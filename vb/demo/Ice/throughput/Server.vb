' **********************************************************************
'
' Copyright (c) 2003-2011 ZeroC, Inc. All rights reserved.
'
' This copy of Ice is licensed to you under the terms described in the
' ICE_LICENSE file included in this distribution.
'
' **********************************************************************

Module ThroughputS

    Class Server
        Inherits Ice.Application

        Public Overloads Overrides Function run(ByVal args() As String) As Integer
            If args.Length > 0 Then
                Console.Error.WriteLine(appName() & ": too many arguments")
                Return 1
            End If

            Dim adapter As Ice.ObjectAdapter = communicator.createObjectAdapter("Throughput")
            adapter.add(New ThroughputI, communicator().stringToIdentity("throughput"))
            adapter.activate()
            communicator.waitForShutdown()
            Return 0
        End Function
    End Class

    Public Sub Main(ByVal args() As String)
        Dim app As Server = New Server
        Dim status As Integer = app.Main(args, "config.server")
        System.Environment.Exit(status)
    End Sub

End Module
