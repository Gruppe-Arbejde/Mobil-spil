using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SettingsHandler : MonoBehaviour
{
    public GameObject Settings;

    public void whenSettingsButtonClicked()
    {
        if (Settings.activeInHierarchy == false)

            Settings.SetActive(true);

        else

            Settings.SetActive(false);

    }
}
