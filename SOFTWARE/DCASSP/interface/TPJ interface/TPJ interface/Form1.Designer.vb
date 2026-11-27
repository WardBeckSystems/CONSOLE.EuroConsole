<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim ChartArea2 As System.Windows.Forms.DataVisualization.Charting.ChartArea = New System.Windows.Forms.DataVisualization.Charting.ChartArea()
        Dim Legend2 As System.Windows.Forms.DataVisualization.Charting.Legend = New System.Windows.Forms.DataVisualization.Charting.Legend()
        Dim Series2 As System.Windows.Forms.DataVisualization.Charting.Series = New System.Windows.Forms.DataVisualization.Charting.Series()
        Dim DataPoint2 As System.Windows.Forms.DataVisualization.Charting.DataPoint = New System.Windows.Forms.DataVisualization.Charting.DataPoint(0.0R, 0.0R)
        Me.Chart1 = New System.Windows.Forms.DataVisualization.Charting.Chart()
        Me.USB = New System.IO.Ports.SerialPort(Me.components)
        Me.StatusStrip1 = New System.Windows.Forms.StatusStrip()
        Me.PB_PanLeft = New System.Windows.Forms.ProgressBar()
        Me.TrackBar1 = New System.Windows.Forms.TrackBar()
        Me.TrackBar2 = New System.Windows.Forms.TrackBar()
        Me.PB_Volume = New System.Windows.Forms.ProgressBar()
        Me.TB_sun = New System.Windows.Forms.TrackBar()
        Me.TB_sky = New System.Windows.Forms.TrackBar()
        Me.TB_earth = New System.Windows.Forms.TrackBar()
        Me.TB_grass = New System.Windows.Forms.TrackBar()
        Me.PB_sun = New System.Windows.Forms.ProgressBar()
        Me.PB_sky = New System.Windows.Forms.ProgressBar()
        Me.PB_earth = New System.Windows.Forms.ProgressBar()
        Me.PB_grass = New System.Windows.Forms.ProgressBar()
        Me.CB_sun = New System.Windows.Forms.CheckBox()
        Me.CB_sky = New System.Windows.Forms.CheckBox()
        Me.CB_grass = New System.Windows.Forms.CheckBox()
        Me.CB_earth = New System.Windows.Forms.CheckBox()
        Me.PB_PanRight = New System.Windows.Forms.ProgressBar()
        Me.CB_only = New System.Windows.Forms.CheckBox()
        Me.CheckBox1 = New System.Windows.Forms.CheckBox()
        Me.CB_ChOn = New System.Windows.Forms.CheckBox()
        CType(Me.Chart1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.TrackBar1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.TrackBar2, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.TB_sun, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.TB_sky, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.TB_earth, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.TB_grass, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Chart1
        '
        ChartArea2.Name = "ChartArea1"
        Me.Chart1.ChartAreas.Add(ChartArea2)
        Legend2.Name = "Legend1"
        Me.Chart1.Legends.Add(Legend2)
        Me.Chart1.Location = New System.Drawing.Point(367, 199)
        Me.Chart1.Name = "Chart1"
        Series2.ChartArea = "ChartArea1"
        Series2.Legend = "Legend1"
        Series2.Name = "Data1"
        Series2.Points.Add(DataPoint2)
        Me.Chart1.Series.Add(Series2)
        Me.Chart1.Size = New System.Drawing.Size(282, 160)
        Me.Chart1.TabIndex = 0
        Me.Chart1.Text = "Chart1"
        '
        'StatusStrip1
        '
        Me.StatusStrip1.Location = New System.Drawing.Point(0, 440)
        Me.StatusStrip1.Name = "StatusStrip1"
        Me.StatusStrip1.Size = New System.Drawing.Size(554, 22)
        Me.StatusStrip1.TabIndex = 1
        Me.StatusStrip1.Text = "StatusStrip1"
        '
        'PB_PanLeft
        '
        Me.PB_PanLeft.Location = New System.Drawing.Point(39, 255)
        Me.PB_PanLeft.Maximum = 256
        Me.PB_PanLeft.Name = "PB_PanLeft"
        Me.PB_PanLeft.RightToLeft = System.Windows.Forms.RightToLeft.Yes
        Me.PB_PanLeft.RightToLeftLayout = True
        Me.PB_PanLeft.Size = New System.Drawing.Size(116, 23)
        Me.PB_PanLeft.TabIndex = 2
        '
        'TrackBar1
        '
        Me.TrackBar1.Location = New System.Drawing.Point(126, 282)
        Me.TrackBar1.Maximum = 255
        Me.TrackBar1.Name = "TrackBar1"
        Me.TrackBar1.Orientation = System.Windows.Forms.Orientation.Vertical
        Me.TrackBar1.Size = New System.Drawing.Size(45, 150)
        Me.TrackBar1.TabIndex = 3
        '
        'TrackBar2
        '
        Me.TrackBar2.Location = New System.Drawing.Point(27, 233)
        Me.TrackBar2.Maximum = 512
        Me.TrackBar2.Name = "TrackBar2"
        Me.TrackBar2.Size = New System.Drawing.Size(250, 45)
        Me.TrackBar2.TabIndex = 4
        Me.TrackBar2.Value = 256
        '
        'PB_Volume
        '
        Me.PB_Volume.Location = New System.Drawing.Point(164, 338)
        Me.PB_Volume.Maximum = 255
        Me.PB_Volume.Name = "PB_Volume"
        Me.PB_Volume.Size = New System.Drawing.Size(99, 35)
        Me.PB_Volume.TabIndex = 5
        '
        'TB_sun
        '
        Me.TB_sun.LargeChange = 10
        Me.TB_sun.Location = New System.Drawing.Point(27, 29)
        Me.TB_sun.Maximum = 255
        Me.TB_sun.Name = "TB_sun"
        Me.TB_sun.Size = New System.Drawing.Size(104, 45)
        Me.TB_sun.TabIndex = 13
        '
        'TB_sky
        '
        Me.TB_sky.Location = New System.Drawing.Point(27, 74)
        Me.TB_sky.Maximum = 255
        Me.TB_sky.Name = "TB_sky"
        Me.TB_sky.Size = New System.Drawing.Size(104, 45)
        Me.TB_sky.TabIndex = 14
        '
        'TB_earth
        '
        Me.TB_earth.Location = New System.Drawing.Point(27, 164)
        Me.TB_earth.Maximum = 255
        Me.TB_earth.Name = "TB_earth"
        Me.TB_earth.Size = New System.Drawing.Size(104, 45)
        Me.TB_earth.TabIndex = 16
        '
        'TB_grass
        '
        Me.TB_grass.Location = New System.Drawing.Point(27, 119)
        Me.TB_grass.Maximum = 255
        Me.TB_grass.Name = "TB_grass"
        Me.TB_grass.Size = New System.Drawing.Size(104, 45)
        Me.TB_grass.TabIndex = 15
        '
        'PB_sun
        '
        Me.PB_sun.Location = New System.Drawing.Point(39, 51)
        Me.PB_sun.Maximum = 255
        Me.PB_sun.Name = "PB_sun"
        Me.PB_sun.Size = New System.Drawing.Size(79, 17)
        Me.PB_sun.TabIndex = 17
        '
        'PB_sky
        '
        Me.PB_sky.Location = New System.Drawing.Point(39, 96)
        Me.PB_sky.Maximum = 255
        Me.PB_sky.Name = "PB_sky"
        Me.PB_sky.Size = New System.Drawing.Size(79, 17)
        Me.PB_sky.TabIndex = 18
        '
        'PB_earth
        '
        Me.PB_earth.Location = New System.Drawing.Point(39, 186)
        Me.PB_earth.Maximum = 255
        Me.PB_earth.Name = "PB_earth"
        Me.PB_earth.Size = New System.Drawing.Size(79, 17)
        Me.PB_earth.TabIndex = 20
        '
        'PB_grass
        '
        Me.PB_grass.Location = New System.Drawing.Point(39, 141)
        Me.PB_grass.Maximum = 255
        Me.PB_grass.Name = "PB_grass"
        Me.PB_grass.Size = New System.Drawing.Size(79, 17)
        Me.PB_grass.TabIndex = 19
        '
        'CB_sun
        '
        Me.CB_sun.AutoSize = True
        Me.CB_sun.Location = New System.Drawing.Point(135, 29)
        Me.CB_sun.Name = "CB_sun"
        Me.CB_sun.Size = New System.Drawing.Size(49, 17)
        Me.CB_sun.TabIndex = 21
        Me.CB_sun.Text = "SUN"
        Me.CB_sun.UseVisualStyleBackColor = True
        '
        'CB_sky
        '
        Me.CB_sky.AutoSize = True
        Me.CB_sky.Location = New System.Drawing.Point(135, 77)
        Me.CB_sky.Name = "CB_sky"
        Me.CB_sky.Size = New System.Drawing.Size(47, 17)
        Me.CB_sky.TabIndex = 22
        Me.CB_sky.Text = "SKY"
        Me.CB_sky.UseVisualStyleBackColor = True
        '
        'CB_grass
        '
        Me.CB_grass.AutoSize = True
        Me.CB_grass.Location = New System.Drawing.Point(135, 119)
        Me.CB_grass.Name = "CB_grass"
        Me.CB_grass.Size = New System.Drawing.Size(63, 17)
        Me.CB_grass.TabIndex = 23
        Me.CB_grass.Text = "GRASS"
        Me.CB_grass.UseVisualStyleBackColor = True
        '
        'CB_earth
        '
        Me.CB_earth.AutoSize = True
        Me.CB_earth.Location = New System.Drawing.Point(135, 164)
        Me.CB_earth.Name = "CB_earth"
        Me.CB_earth.Size = New System.Drawing.Size(63, 17)
        Me.CB_earth.TabIndex = 24
        Me.CB_earth.Text = "EARTH"
        Me.CB_earth.UseVisualStyleBackColor = True
        '
        'PB_PanRight
        '
        Me.PB_PanRight.Location = New System.Drawing.Point(151, 255)
        Me.PB_PanRight.Maximum = 256
        Me.PB_PanRight.Name = "PB_PanRight"
        Me.PB_PanRight.Size = New System.Drawing.Size(112, 23)
        Me.PB_PanRight.TabIndex = 25
        '
        'CB_only
        '
        Me.CB_only.AutoSize = True
        Me.CB_only.Location = New System.Drawing.Point(68, 282)
        Me.CB_only.Name = "CB_only"
        Me.CB_only.Size = New System.Drawing.Size(55, 17)
        Me.CB_only.TabIndex = 26
        Me.CB_only.Text = "ONLY"
        Me.CB_only.UseVisualStyleBackColor = True
        '
        'CheckBox1
        '
        Me.CheckBox1.AutoSize = True
        Me.CheckBox1.Location = New System.Drawing.Point(164, 282)
        Me.CheckBox1.Name = "CheckBox1"
        Me.CheckBox1.Size = New System.Drawing.Size(67, 17)
        Me.CheckBox1.TabIndex = 27
        Me.CheckBox1.Text = "SELECT"
        Me.CheckBox1.UseVisualStyleBackColor = True
        '
        'CB_ChOn
        '
        Me.CB_ChOn.AutoSize = True
        Me.CB_ChOn.Location = New System.Drawing.Point(164, 415)
        Me.CB_ChOn.Name = "CB_ChOn"
        Me.CB_ChOn.Size = New System.Drawing.Size(60, 17)
        Me.CB_ChOn.TabIndex = 28
        Me.CB_ChOn.Text = "CH ON"
        Me.CB_ChOn.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(554, 462)
        Me.Controls.Add(Me.CB_ChOn)
        Me.Controls.Add(Me.CheckBox1)
        Me.Controls.Add(Me.CB_only)
        Me.Controls.Add(Me.PB_PanRight)
        Me.Controls.Add(Me.CB_earth)
        Me.Controls.Add(Me.CB_grass)
        Me.Controls.Add(Me.CB_sky)
        Me.Controls.Add(Me.CB_sun)
        Me.Controls.Add(Me.PB_earth)
        Me.Controls.Add(Me.PB_grass)
        Me.Controls.Add(Me.PB_sky)
        Me.Controls.Add(Me.PB_sun)
        Me.Controls.Add(Me.TB_earth)
        Me.Controls.Add(Me.TB_grass)
        Me.Controls.Add(Me.TB_sky)
        Me.Controls.Add(Me.TB_sun)
        Me.Controls.Add(Me.PB_Volume)
        Me.Controls.Add(Me.TrackBar1)
        Me.Controls.Add(Me.PB_PanLeft)
        Me.Controls.Add(Me.StatusStrip1)
        Me.Controls.Add(Me.Chart1)
        Me.Controls.Add(Me.TrackBar2)
        Me.Name = "Form1"
        Me.Text = "Form1"
        CType(Me.Chart1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.TrackBar1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.TrackBar2, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.TB_sun, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.TB_sky, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.TB_earth, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.TB_grass, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Chart1 As System.Windows.Forms.DataVisualization.Charting.Chart
    Friend WithEvents USB As System.IO.Ports.SerialPort
    Friend WithEvents StatusStrip1 As System.Windows.Forms.StatusStrip
    Friend WithEvents PB_PanLeft As System.Windows.Forms.ProgressBar
    Friend WithEvents TrackBar1 As System.Windows.Forms.TrackBar
    Friend WithEvents TrackBar2 As System.Windows.Forms.TrackBar
    Friend WithEvents PB_Volume As System.Windows.Forms.ProgressBar
    Friend WithEvents TB_sun As System.Windows.Forms.TrackBar
    Friend WithEvents TB_sky As System.Windows.Forms.TrackBar
    Friend WithEvents TB_earth As System.Windows.Forms.TrackBar
    Friend WithEvents TB_grass As System.Windows.Forms.TrackBar
    Friend WithEvents PB_sun As System.Windows.Forms.ProgressBar
    Friend WithEvents PB_sky As System.Windows.Forms.ProgressBar
    Friend WithEvents PB_earth As System.Windows.Forms.ProgressBar
    Friend WithEvents PB_grass As System.Windows.Forms.ProgressBar
    Friend WithEvents CB_sun As System.Windows.Forms.CheckBox
    Friend WithEvents CB_sky As System.Windows.Forms.CheckBox
    Friend WithEvents CB_grass As System.Windows.Forms.CheckBox
    Friend WithEvents CB_earth As System.Windows.Forms.CheckBox
    Friend WithEvents PB_PanRight As System.Windows.Forms.ProgressBar
    Friend WithEvents CB_only As System.Windows.Forms.CheckBox
    Friend WithEvents CheckBox1 As System.Windows.Forms.CheckBox
    Friend WithEvents CB_ChOn As System.Windows.Forms.CheckBox

End Class
