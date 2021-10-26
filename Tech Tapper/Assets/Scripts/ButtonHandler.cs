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
        {
            Shop.SetActive(false);
            Main.SetActive(true);
            Settings.SetActive(false);
        }
        else
        {
            Settings.SetActive(false);
            //Main.SetActive(false);
            Shop.SetActive(false);
        }
    }

    public void whenSettingsButtonClicked()
    {
        if (Settings.activeInHierarchy == false)
        {
            Shop.SetActive(false);
            //Main.SetActive(false);
            Settings.SetActive(true);
        }
        //else
        //{
        //    Settings.SetActive(false);
        //}
    }

    public void whenShopButtonClicked()
    {
        if (Shop.activeInHierarchy == false)
        {
            Shop.SetActive(true);
            //Main.SetActive(false);
            Settings.SetActive(false);
        }
        //else
        //{
        //    Shop.SetActive(false);
        //}
    }
}