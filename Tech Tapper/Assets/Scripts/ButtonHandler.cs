using UnityEngine;

public class ButtonHandler : MonoBehaviour
{
    public GameObject Main;
    public GameObject Hardware;
    public GameObject Buildings;
    public GameObject Settings;

    public void whenMainButtonClicked()
    {
        if (Main.activeInHierarchy == false)
        {
            Hardware.SetActive(false);
            Main.SetActive(true);
            Settings.SetActive(false);
            Buildings.SetActive(false);
        }
        else
        {
            Settings.SetActive(false);
            Hardware.SetActive(false);
            Buildings.SetActive(false);
        }

    }

    public void whenBuildingsButtonClicked()
    {
        if (Buildings.activeInHierarchy == false)
        {
            Hardware.SetActive(false);
            Settings.SetActive(false);
            //Main.SetActive(false);
            Buildings.SetActive(true);
        }
    }

    public void whenShopButtonClicked()
    {
        if (Hardware.activeInHierarchy == false)
        {
            Buildings.SetActive(false);
            Settings.SetActive(false);
            //Main.SetActive(false);
            Hardware.SetActive(true);
        }
    }
    public void whenCloseButtonClicked()
    {
        if (Main.activeInHierarchy == false)

        {
            Hardware.SetActive(false);
            Main.SetActive(true);
            Settings.SetActive(false);
            Buildings.SetActive(false);
        }
        else
        {
            Settings.SetActive(false);
            Hardware.SetActive(false);
            Buildings.SetActive(false);
        }
    }
}