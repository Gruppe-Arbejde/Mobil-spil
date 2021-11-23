using System;
using UnityEngine;
using UnityEngine.UI;

public class Manager : MonoBehaviour
{
    public static Manager instance { get; private set; }

    public Text ClicksTotalText;
    public float TotalClicks;

    public void Start()
    {
        TotalClicks = SaveManager.instance.LoadedClicks;
        ClicksTotalText.text = TotalClicks.ToString("0");
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

    // Add Click
    public void AddClicks()
    {
        TotalClicks++;

        SaveManager.instance.LoadedClicks = TotalClicks;
        SaveManager.instance.Save();

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
    // Auto Clicker
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
