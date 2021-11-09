using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEditor;

public class Manager : MonoBehaviour
{
    public static Manager instance { get; private set; }

    public Text ClicksTotalText;
    public float TotalClicks;


    

    public void Start()
    { 
        TotalClicks = SaveManager.instance.LoadedClicks; //Overwrites the amount of clicks with the one loaded
        ClicksTotalText.text = TotalClicks.ToString("0"); //Overwrites the amount of clicks up in the textfield with the correct one
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

    // Default Click
    public void AddClicks()
    {
        TotalClicks++;
        ClicksTotalText.text = TotalClicks.ToString("0");
        SaveManager.instance.LoadedClicks = TotalClicks; //Saves the amount of clicks to the SaveManager
        SaveManager.instance.Save(); 
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
