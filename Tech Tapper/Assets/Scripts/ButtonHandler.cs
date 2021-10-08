using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ButtonHandler : MonoBehaviour
{
    public GameObject Main;
    public GameObject Shop;
    public GameObject Settings;

    public void whenMainButtonClicked()
    {
        if (Main.activeInHierarchy == false)

            Main.SetActive(true);

        else

            Main.SetActive(false);

    }

    public void whenSettingsButtonClicked()
    {
        if (Settings.activeInHierarchy == false)

            Settings.SetActive(true);

        else

            Settings.SetActive(false);

    }

    public void whenShopButtonClicked()
    {
        if (Shop.activeInHierarchy == false)

            Shop.SetActive(true);

        else

            Shop.SetActive(false);

    }
}