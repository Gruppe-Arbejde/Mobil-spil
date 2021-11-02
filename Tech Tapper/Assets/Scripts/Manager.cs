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

    // Mouse Auto click
    bool hasMouse;
    public int MouseClicksPerSecond;
    public int minimumClicksToUnlockMouse;
    //-------------------------------------------------------------------------------------------------------
    
    
    // Monitor Auto click
    bool hasMonitor;
    public int MonitorClicksPerSecond;
    public int minimumClicksToUnlockMonitor;
    //-------------------------------------------------------------------------------------------------------

    // Computer Auto click
    bool hasComputer;
    public int ComputerClicksPerSecond;
    public int minimumClicksToUnlockComputer;
    //-------------------------------------------------------------------------------------------------------


    // Default Click
    public void AddClicks()
    {
        TotalClicks++;
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

    // Mouse Auto Click
    public void AutoMouseUpgrade()
    {
        if (!hasMouse && TotalClicks >= minimumClicksToUnlockMouse)
        {
            TotalClicks -= minimumClicksToUnlockMouse;
            hasMouse = true;
        }
    }
    
    // Monitor Auto Click
    public void AutoMonitorUpgrade()
    {
        if (!hasMonitor && TotalClicks >= minimumClicksToUnlockMonitor)
        {
            TotalClicks -= minimumClicksToUnlockMonitor;
            hasMonitor = true;
        }
    }

    // Computer Auto Click
    public void AutoComputerUpgrade()
    {
        if (!hasComputer && TotalClicks >= minimumClicksToUnlockComputer)
        {
            TotalClicks -= minimumClicksToUnlockComputer;
            hasComputer = true;
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
     
          if (hasMouse)
        {
            TotalClicks += MouseClicksPerSecond * Time.deltaTime;
            ClicksTotalText.text = TotalClicks.ToString("0");
        }
        
          if (hasMonitor)
        {
            TotalClicks += MonitorClicksPerSecond * Time.deltaTime;
            ClicksTotalText.text = TotalClicks.ToString("0");
        }

          if (hasComputer)
        {
            TotalClicks += ComputerClicksPerSecond * Time.deltaTime;
            ClicksTotalText.text = TotalClicks.ToString("0");
        }
        

    }

}
