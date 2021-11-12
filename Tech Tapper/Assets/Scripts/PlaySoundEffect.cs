using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlaySoundEffect : MonoBehaviour
{
    public AudioSource MouseClickSFX;

    public void playSoundEffect()
    {
        MouseClickSFX.Play();
    }
}
