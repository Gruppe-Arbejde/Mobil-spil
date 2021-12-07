using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;

public class Manager : MonoBehaviour
{
    public Text ClicksTotalText;
    public double TotalClicks;
    public double valuta;
    public static int multiplier;
    public static int clicksU;

    private void Start()
    {
        multiplier = 1;
        clicksU = 0;
    

    }

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

    // Serverrack Auto click
    bool hasServerrack;
    public int ServerrackClicksPerSecond;
    public int minimumClicksToUnlockServerrack;
    //-------------------------------------------------------------------------------------------------------

    // XXXX Auto click
    bool hasXXXX;
    public int XXXXClicksPerSecond;
    public int minimumClicksToUnlockXXXX;
    //-------------------------------------------------------------------------------------------------------

    public double ClickPower()
    {
        UpgradeData Data = new UpgradeData();
        return 1 + Data.clickUpgradeLevel;
    }

    // Add Click
    public void AddClicks()
    {

        TotalClicks = clicksU;
        valuta = System.Convert.ToDouble(ClicksTotalText);

        //SaveManager.instance.LoadedClicks = TotalClicks;
        //SaveManager.instance.Save();

        ClicksTotalText.text = System.Convert.ToString(clicksU);

        // Shortens big numbers
        if (TotalClicks >= 1000)
        {
            decimal resKilo = 0;
            resKilo = Convert.ToDecimal(TotalClicks / 1000);
            ClicksTotalText.text = Convert.ToString($"{resKilo:n2} K");
            //ClicksTotalText.text = Convert.ToDecimal(Math.Floor(TotalClicks / 1000)).ToString() + " K";
        }
        else if (TotalClicks >= 1000000)
        {
            decimal resMillion = 0;
            resMillion = Convert.ToDecimal(TotalClicks / 1000000);
            ClicksTotalText.text = Convert.ToString($"{resMillion:n2} M");
            //ClicksTotalText.text = Math.Floor(TotalClicks / 1000000).ToString() + " M";
        }
        else if (TotalClicks >= 1000000000)
        {
            decimal resBillion = 0;
            resBillion = Convert.ToDecimal(TotalClicks / 1000000000);
            ClicksTotalText.text = Convert.ToString($"{resBillion:n2} B");
            //ClicksTotalText.text = Math.Floor(TotalClicks / 1000000000).ToString() + " B";
        }
        else if (TotalClicks >= 1000000000000)
        {
            decimal resTrillion = 0;
            resTrillion = Convert.ToDecimal(TotalClicks / 1000000000000);
            ClicksTotalText.text = Convert.ToString($"{resTrillion:n1} T");
            //ClicksTotalText.text = Math.Floor(TotalClicks / 1000000000000).ToString() + " T";
        }
        else if (TotalClicks >= 1000000000000000)
        {
            decimal resQuad = 0;
            resQuad = Convert.ToDecimal(TotalClicks / 1000000000000000);
            ClicksTotalText.text = Convert.ToString($"{resQuad} Quadrillion");
            //ClicksTotalText.text = Math.Floor(TotalClicks / 1000000000000000).ToString() + " Quadrillion";
        }
        else if (TotalClicks >= 1000000000000000000)
        {
            decimal resQuin = 0;
            resQuin = Convert.ToDecimal(TotalClicks / 1000000000000000000);
            ClicksTotalText.text = Convert.ToString($"{resQuin} Quintillion");
            //ClicksTotalText.text = Math.Floor(TotalClicks / 1000000000000000000).ToString() + " Quintillion";
        }
        else
        {
            decimal underKilo = 0;
            underKilo = Convert.ToDecimal(TotalClicks / 1);
            ClicksTotalText.text = Convert.ToString($"{underKilo}");
            //ClicksTotalText.text = TotalClicks.ToString("0");
        }
    }

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

    // Serverrack Auto Click
    public void AutoServerrackUpgrade()
    {
        if (!hasServerrack && TotalClicks >= minimumClicksToUnlockServerrack)
        {
            TotalClicks -= minimumClicksToUnlockServerrack;
            hasServerrack = true;
        }
    }

    // XXXX Auto Click
    public void AutoXXXXUpgrade()
    {
        if (!hasXXXX && TotalClicks >= minimumClicksToUnlockXXXX)
        {
            TotalClicks -= minimumClicksToUnlockXXXX;
            hasXXXX = true;
        }
    }

    
    //-------------------------------------------------------------------------------------------------------

    // Update
    private void Update()
    {
        //ClicksTotalText.text = System.Convert.ToString(clicksU);

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

        if (hasServerrack)
        {
            TotalClicks += ServerrackClicksPerSecond * Time.deltaTime;
            ClicksTotalText.text = TotalClicks.ToString("0");
        }

        if (hasXXXX)
        {
            TotalClicks += XXXXClicksPerSecond * Time.deltaTime;
            ClicksTotalText.text = TotalClicks.ToString("0");
        }

       

    }

}
