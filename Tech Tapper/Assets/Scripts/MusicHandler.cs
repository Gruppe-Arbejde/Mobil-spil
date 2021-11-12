using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MusicHandler : MonoBehaviour
{
    [SerializeField] Image musicOnIcon;
    [SerializeField] Image musicOffIcon;
    public GameObject MusicLayer;
    private bool musicMuted = false;

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
        if (musicMuted == false)
        {
            musicMuted = true;
            MusicLayer.SetActive(false);
            //AudioListener.pause = true;
        }

        else
        {
            musicMuted = false;
            MusicLayer.SetActive(true);
            //AudioListener.pause = false;
        }
        Save();
        UpdateButtonIcon();
    }

    private void UpdateButtonIcon()
    {
        if (musicMuted == false && MusicLayer.activeInHierarchy == true)
        {
            musicOnIcon.enabled = true;
            musicOffIcon.enabled = false;
            MusicLayer.SetActive(true);
        }
        else
        {
            musicOnIcon.enabled = false;
            musicOffIcon.enabled = true;
            MusicLayer.SetActive(false);
        }
    }

    private void Load()
    {
        musicMuted = PlayerPrefs.GetInt("muted") == 1;
    }

    private void Save()
    {
        PlayerPrefs.SetInt("muted", musicMuted ? 1 : 0);
    }
}
