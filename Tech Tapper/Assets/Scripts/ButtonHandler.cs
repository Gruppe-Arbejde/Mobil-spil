using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ButtonHandler : MonoBehaviour
{
    public GameObject Main;
    public GameObject Shop;
    public GameObject Buildings;
    public GameObject Settings;

    public void whenMainButtonClicked()
    {
        if (Main.activeInHierarchy == false )

        {
            Shop.SetActive(false);
            Main.SetActive(true);
            Settings.SetActive(false);
            Buildings.SetActive(false);
        }
        else
        {
            Settings.SetActive(false);
            Shop.SetActive(false);
            Buildings.SetActive(false);
        }

    }

    public void whenBuildingsButtonClicked()
    {
        if (Buildings.activeInHierarchy == false)
        {
            Shop.SetActive(false);
            Settings.SetActive(false);
            //Main.SetActive(false);
            Buildings.SetActive(true);
        }
    }

    public void whenShopButtonClicked()
    {
        if (Shop.activeInHierarchy == false)
        {
            Buildings.SetActive(false);
            Settings.SetActive(false);
            //Main.SetActive(false);
            Shop.SetActive(true);
        }
    }
}