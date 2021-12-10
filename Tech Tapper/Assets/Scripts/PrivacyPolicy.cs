using UnityEngine;

public class PrivacyPolicy : MonoBehaviour
{
    public string Url;

    public void Open()
    {
        Application.OpenURL(Url);
    }
}
