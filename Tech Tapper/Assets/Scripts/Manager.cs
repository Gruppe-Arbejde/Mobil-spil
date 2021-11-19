using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Manager : MonoBehaviour
{
    public Text ClicksTotalText;
    float TotalClicks;

    // Default Auto click
    bool hasUpgrade;
    public int autoClicksPerSecond;
    public int minimumClicksToUnlockUpgrade;
    //-------------------------------------------------------------------------------------------------------

    // Keyboard Auto click
    bool hasKeyboard;
    public int keyboardClicksPerSecond;
    public int minimumClicksToUnlockKeyboad;
    //-------------------------------------------------------------------------------------------------------

    // Add Click
    public void AddClicks()
    {
        TotalClicks++;

        // Shortens big numbers
        if (TotalClicks >= 1000)
            ClicksTotalText.text = Math.Floor(TotalClicks / 1000).ToString() + "K";
        else if (TotalClicks >= 1000000)
            ClicksTotalText.text = Math.Floor(TotalClicks / 1000).ToString() + "M";
        else if (TotalClicks >= 1000000000)
            ClicksTotalText.text = Math.Floor(TotalClicks / 1000000000).ToString() + "B";
        else if (TotalClicks >= 1000000000000)
            ClicksTotalText.text = Math.Floor(TotalClicks / 1000000000000).ToString() + "T";
        else if (TotalClicks >= 1000000000000000)
            ClicksTotalText.text = Math.Floor(TotalClicks / 1000000000000000).ToString() + "Quadrillion";
        else if (TotalClicks >= 1000000000000000000)
            ClicksTotalText.text = Math.Floor(TotalClicks / 1000000000000000000).ToString() + "Quintillion";
        else
            ClicksTotalText.text = TotalClicks.ToString("0");
    }

    //-------------------------------------------------------------------------------------------------------

    // Auto Clickers

    // Default Auto click
    public void AutoClickUpgrade()
    {
        if (!hasUpgrade && TotalClicks >= minimumClicksToUnlockUpgrade)
        {
            TotalClicks -= minimumClicksToUnlockUpgrade;
            hasUpgrade = true;
        }
    }

    // Keyboard Auto Click
    public void AutoKeyboardUpgrade()
    {
        if (!hasKeyboard && TotalClicks >= minimumClicksToUnlockKeyboad)
        {
            TotalClicks -= minimumClicksToUnlockKeyboad;
            hasKeyboard = true;
        }
    }
    //-------------------------------------------------------------------------------------------------------

    // Update
    private void Update()
    {
        if (hasUpgrade)
        {
            TotalClicks += autoClicksPerSecond * Time.deltaTime;
            ClicksTotalText.text = TotalClicks.ToString("0");
        }
        if (hasKeyboard)
        {
            TotalClicks += keyboardClicksPerSecond * Time.deltaTime;
            ClicksTotalText.text = TotalClicks.ToString("0");
        }
    }
}
