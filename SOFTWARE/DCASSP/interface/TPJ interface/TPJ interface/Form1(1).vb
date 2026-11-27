Public Class Form1

    Private Sub Chart1_Click(sender As Object, e As EventArgs) Handles Chart1.Click

    End Sub

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

    Private Sub RadioButton1_CheckedChanged(sender As Object, e As EventArgs)

    End Sub

    Private Sub RadioButton4_CheckedChanged(sender As Object, e As EventArgs)

    End Sub

    Private Sub RadioButton5_CheckedChanged(sender As Object, e As EventArgs)

    End Sub

    Private Sub RadioButton7_CheckedChanged(sender As Object, e As EventArgs)

    End Sub

    Private Sub RadioButton6_CheckedChanged(sender As Object, e As EventArgs)

    End Sub

    Private Sub TB_Sun_Scroll(sender As Object, e As EventArgs) Handles TB_Sun.Scroll
        PB_Sun.Value = TB_Sun.Value
    End Sub

    Private Sub TB_sky_Scroll(sender As Object, e As EventArgs) Handles TB_sky.Scroll
        PB_Sky.Value = TB_sky.Value
    End Sub

    Private Sub TB_Grass_Scroll(sender As Object, e As EventArgs) Handles TB_Grass.Scroll
        PB_grass.Value = TB_Grass.Value

    End Sub

    Private Sub TB_Earth_Scroll(sender As Object, e As EventArgs) Handles TB_Earth.Scroll
        PB_earth.Value = TB_Earth.Value

    End Sub

    Private Sub CB_sun_CheckedChanged(sender As Object, e As EventArgs) Handles CB_sun.CheckedChanged
        TB_Sun.Value = 0
        CB_sun.Checked = False
        PB_Sun.Value = TB_Sun.Value()
    End Sub

    Private Sub CB_Sky_CheckedChanged(sender As Object, e As EventArgs) Handles CB_Sky.CheckedChanged
        TB_sky.Value = 0
        CB_Sky.Checked = False
        PB_Sky.Value = TB_sky.Value
    End Sub

    Private Sub CB_grass_CheckedChanged(sender As Object, e As EventArgs) Handles CB_grass.CheckedChanged
        TB_Grass.Value = 0
        CB_grass.Checked = False
        PB_grass.Value = TB_Grass.Value
    End Sub

    Private Sub CB_Earth_CheckedChanged(sender As Object, e As EventArgs) Handles CB_Earth.CheckedChanged
        TB_Earth.Value = 0
        CB_Earth.Checked = False
        PB_earth.Value = TB_Earth.Value


    End Sub

    Private Sub PB_PanRight_Click(sender As Object, e As EventArgs) Handles PB_PanRight.Click

    End Sub
End Class
