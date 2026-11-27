Public Class Form1

    Private Sub TrackBar2_Scroll(sender As Object, e As EventArgs) Handles TrackBar2.Scroll
        If (TrackBar2.Value <= 256) Then
            PB_PanLeft.Value = 256 - TrackBar2.Value
            PB_PanRight.Value = 0
        Else
            PB_PanLeft.Value = 0
            PB_PanRight.Value = TrackBar2.Value - 256
        End If
    End Sub

    Private Sub TrackBar1_Scroll(sender As Object, e As EventArgs) Handles TrackBar1.Scroll
        PB_Volume.Value = TrackBar1.Value
    End Sub


    Private Sub TB_Sun_Scroll(sender As Object, e As EventArgs) Handles TB_sun.Scroll
        PB_sun.Value = TB_sun.Value
    End Sub

    Private Sub TB_sky_Scroll(sender As Object, e As EventArgs) Handles TB_sky.Scroll
        PB_sky.Value = TB_sky.Value
    End Sub

    Private Sub TB_Grass_Scroll(sender As Object, e As EventArgs) Handles TB_grass.Scroll
        PB_grass.Value = TB_grass.Value

    End Sub

    Private Sub TB_Earth_Scroll(sender As Object, e As EventArgs) Handles TB_earth.Scroll
        PB_earth.Value = TB_earth.Value

    End Sub

    Private Sub CB_sun_CheckedChanged(sender As Object, e As EventArgs) Handles CB_sun.CheckedChanged
        If (CB_sun.Checked = True) Then
            PB_sun.Value = 0
        Else
            PB_sun.Value = TB_sun.Value
        End If

    End Sub

    Private Sub CB_Sky_CheckedChanged(sender As Object, e As EventArgs) Handles CB_sky.CheckedChanged
        If (CB_sky.Checked = True) Then
            PB_sky.Value = 0
        Else
            PB_sky.Value = TB_sky.Value
        End If
    End Sub

    Private Sub CB_grass_CheckedChanged(sender As Object, e As EventArgs) Handles CB_grass.CheckedChanged
        If (CB_grass.Checked = True) Then
            PB_grass.Value = 0
        Else
            PB_grass.Value = TB_grass.Value
        End If
    End Sub


    Private Sub CB_Earth_CheckedChanged(sender As Object, e As EventArgs) Handles CB_earth.CheckedChanged
        If (CB_earth.Checked = True) Then
            PB_earth.Value = 0
        Else
            PB_earth.Value = TB_earth.Value
        End If
    End Sub

    Private Sub PB_PanRight_Click(sender As Object, e As EventArgs) Handles PB_PanRight.Click

    End Sub

    Private Sub CB_only_CheckedChanged(sender As Object, e As EventArgs) Handles CB_only.CheckedChanged

    End Sub
End Class
