using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ClickSFXManager : MonoBehaviour
{
    [SerializeField] Image soundOnIcon;
    [SerializeField] Image soundOffIcon;
    public GameObject ClickSFXLayer;
    private bool sfxMuted = false;

    // start is called before the first frame update.
    private void Start()
    {
        if (!PlayerPrefs.HasKey("muted"))
        {
            PlayerPrefs.SetInt("muted", 0);
            Load();
        }
        else
        {
            Load();
        }

        UpdateButtonIcon();
        //MusicLayer.SetActive(false);
        //AudioListener.pause = muted;
    }

    public void OnButtonPress()
    {
        if (sfxMuted == false)
        {
            sfxMuted = true;
            ClickSFXLayer.SetActive(false);
            //AudioListener.pause = true;
        }

        else
        {
            sfxMuted = false;
            ClickSFXLayer.SetActive(true);
            //AudioListener.pause = false;
        }
        Save();
        UpdateButtonIcon();
    }

    private void UpdateButtonIcon()
    {
        if (sfxMuted == false && ClickSFXLayer.activeInHierarchy == true)
        {
            soundOnIcon.enabled = true;
            soundOffIcon.enabled = false;
            ClickSFXLayer.SetActive(true);
        }
        else
        {
            soundOnIcon.enabled = false;
            soundOffIcon.enabled = true;
            ClickSFXLayer.SetActive(false);
        }
    }

    private void Load()
    {
        sfxMuted = PlayerPrefs.GetInt("muted") == 1;
    }

    private void Save()
    {
        PlayerPrefs.SetInt("muted", sfxMuted ? 1 : 0);
    }
}
