Attribute VB_Name = "NewMacros"
Sub discipline_macros()
Attribute discipline_macros.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.discipline_macros"
'
' discipline_macros Macro
'
'
    If Selection.PageSetup.Orientation = wdOrientPortrait Then
        Selection.PageSetup.Orientation = wdOrientLandscape
    Else
        Selection.PageSetup.Orientation = wdOrientPortrait
    End If
    With Selection.PageSetup
        .LineNumbering.Active = False
        .Orientation = wdOrientLandscape
        .TopMargin = CentimetersToPoints(2.54)
        .BottomMargin = CentimetersToPoints(2.54)
        .LeftMargin = CentimetersToPoints(2.54)
        .RightMargin = CentimetersToPoints(2.54)
        .Gutter = CentimetersToPoints(0)
        .HeaderDistance = CentimetersToPoints(1.25)
        .FooterDistance = CentimetersToPoints(1.25)
        .PageWidth = CentimetersToPoints(29.7)
        .PageHeight = CentimetersToPoints(21)
        .FirstPageTray = wdPrinterDefaultBin
        .OtherPagesTray = wdPrinterDefaultBin
        .SectionStart = wdSectionNewPage
        .OddAndEvenPagesHeaderFooter = False
        .DifferentFirstPageHeaderFooter = False
        .VerticalAlignment = wdAlignVerticalTop
        .SuppressEndnotes = False
        .MirrorMargins = False
        .TwoPagesOnOne = False
        .BookFoldPrinting = False
        .BookFoldRevPrinting = False
        .BookFoldPrintingSheets = 1
        .GutterPos = wdGutterPosLeft
    End With
    With Selection.PageSetup
        .LineNumbering.Active = False
        .Orientation = wdOrientLandscape
        .TopMargin = CentimetersToPoints(1.27)
        .BottomMargin = CentimetersToPoints(1.27)
        .LeftMargin = CentimetersToPoints(1.27)
        .RightMargin = CentimetersToPoints(1.27)
        .Gutter = CentimetersToPoints(0)
        .HeaderDistance = CentimetersToPoints(1.25)
        .FooterDistance = CentimetersToPoints(1.25)
        .PageWidth = CentimetersToPoints(29.7)
        .PageHeight = CentimetersToPoints(21)
        .FirstPageTray = wdPrinterDefaultBin
        .OtherPagesTray = wdPrinterDefaultBin
        .SectionStart = wdSectionNewPage
        .OddAndEvenPagesHeaderFooter = False
        .DifferentFirstPageHeaderFooter = False
        .VerticalAlignment = wdAlignVerticalTop
        .SuppressEndnotes = False
        .MirrorMargins = False
        .TwoPagesOnOne = False
        .BookFoldPrinting = False
        .BookFoldRevPrinting = False
        .BookFoldPrintingSheets = 1
        .GutterPos = wdGutterPosLeft
    End With
    If ActiveWindow.View.SplitSpecial <> wdPaneNone Then
        ActiveWindow.Panes(2).Close
    End If
    If ActiveWindow.ActivePane.View.Type = wdNormalView Or ActiveWindow. _
        ActivePane.View.Type = wdOutlineView Then
        ActiveWindow.ActivePane.View.Type = wdPrintView
    End If
    ActiveWindow.ActivePane.View.SeekView = wdSeekCurrentPageFooter
    Application.Templates( _
        "C:\Users\Martin\AppData\Roaming\Microsoft\Document Building Blocks\1033\15\Built-In Building Blocks.dotx" _
        ).BuildingBlockEntries("Bold Numbers 2").Insert Where:=Selection.Range, _
        RichText:=True
    ActiveWindow.ActivePane.View.SeekView = wdSeekMainDocument
End Sub
