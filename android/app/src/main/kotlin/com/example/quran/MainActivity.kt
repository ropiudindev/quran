package com.example.quran

import android.os.Bundle
import androidx.biometric.BiometricManager
import androidx.biometric.BiometricPrompt
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.Executor
import android.util.Log

class MainActivity : FlutterFragmentActivity() {
    private val CHANNEL = "fingerprint"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "authenticate") {
                    authenticate(result)
                } else {
                    result.notImplemented()
                }
            }
    }

    private var isAuthenticationInProgress = false
    private var result: MethodChannel.Result? = null

    private fun authenticate(result: MethodChannel.Result) {
        if (isAuthenticationInProgress) {
            result.error("AUTH_IN_PROGRESS", "Authentication is already in progress", null)
            return
        }

        val biometricManager = BiometricManager.from(this)
        if (biometricManager.canAuthenticate(BiometricManager.Authenticators.BIOMETRIC_STRONG) != BiometricManager.BIOMETRIC_SUCCESS) {
            result.success(false)
            return
        }

        // Set the result callback
        this.result = result
        val executor: Executor = ContextCompat.getMainExecutor(this)
        val biometricPrompt = BiometricPrompt(this, executor, object : BiometricPrompt.AuthenticationCallback() {

            override fun onAuthenticationSucceeded(authResult: BiometricPrompt.AuthenticationResult) {
                super.onAuthenticationSucceeded(authResult)
                logDebug("Authentication succeeded")
                handleAuthenticationSuccess()
            }

            override fun onAuthenticationFailed() {
                super.onAuthenticationFailed()
                logDebug("Authentication failed")
                handleAuthenticationFailure()
            }

            override fun onAuthenticationError(errorCode: Int, errString: CharSequence) {
                super.onAuthenticationError(errorCode, errString)
                logDebug("Authentication error: $errString")
                handleAuthenticationError(errString)
            }
        })

        val promptInfo = BiometricPrompt.PromptInfo.Builder()
            .setTitle("Login with Fingerprint")
            .setSubtitle("Use your fingerprint to authenticate")
            .setNegativeButtonText("Cancel")
            .build()

        isAuthenticationInProgress = true
        biometricPrompt.authenticate(promptInfo)
    }

    private fun handleAuthenticationSuccess() {
        if (isAuthenticationInProgress) {
            logDebug("Handling success")
            isAuthenticationInProgress = false
            result?.success(true)
            result = null
        } else {
            logDebug("Ignoring success because authentication is not in progress")
        }
    }

    private fun handleAuthenticationFailure() {
        if (isAuthenticationInProgress) {
            logDebug("Handling failure")
            isAuthenticationInProgress = false
            result?.success(false)
            result = null
        } else {
            logDebug("Ignoring failure because authentication is not in progress")
        }
    }

    private fun handleAuthenticationError(errString: CharSequence) {
        if (isAuthenticationInProgress) {
            logDebug("Handling error")
            isAuthenticationInProgress = false
            result?.error("AUTH_ERROR", errString.toString(), null)
            result = null
        } else {
            logDebug("Ignoring error because authentication is not in progress")
        }
    }

    private fun logDebug(message: String) {
        Log.d("BiometricAuth", message)
    }
}
