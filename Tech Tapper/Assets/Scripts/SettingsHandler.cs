using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SettingsHandler : MonoBehaviour
{
    public GameObject Settings;
    public GameObject Hardware;
    public GameObject Buildings;

    public void whenSettingsButtonClicked()
    {
        if (Settings.activeInHierarchy == false ) // If Settings is not active.
        {
            // Then Disable Shop and buildings and enable Settings
            Hardware.SetActive(false);
            Buildings.SetActive(false);
            Settings.SetActive(true);
        }
        // Else Set settings as inactive
        else
            Settings.SetActive(false);

    }
}
