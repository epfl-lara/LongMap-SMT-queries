; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113990 () Bool)

(assert start!113990)

(declare-fun res!897823 () Bool)

(declare-fun e!768825 () Bool)

(assert (=> start!113990 (=> (not res!897823) (not e!768825))))

(declare-datatypes ((array!92172 0))(
  ( (array!92173 (arr!44534 (Array (_ BitVec 32) (_ BitVec 64))) (size!45084 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92172)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113990 (= res!897823 (and (bvslt (size!45084 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45084 a!3742))))))

(assert (=> start!113990 e!768825))

(assert (=> start!113990 true))

(declare-fun array_inv!33562 (array!92172) Bool)

(assert (=> start!113990 (array_inv!33562 a!3742)))

(declare-fun b!1352486 () Bool)

(declare-fun res!897822 () Bool)

(assert (=> b!1352486 (=> (not res!897822) (not e!768825))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352486 (= res!897822 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45084 a!3742))))))

(declare-fun b!1352487 () Bool)

(declare-fun res!897818 () Bool)

(assert (=> b!1352487 (=> (not res!897818) (not e!768825))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352487 (= res!897818 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352488 () Bool)

(declare-fun e!768826 () Bool)

(assert (=> b!1352488 (= e!768825 e!768826)))

(declare-fun res!897820 () Bool)

(assert (=> b!1352488 (=> (not res!897820) (not e!768826))))

(assert (=> b!1352488 (= res!897820 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44343 0))(
  ( (Unit!44344) )
))
(declare-fun lt!597562 () Unit!44343)

(declare-fun e!768824 () Unit!44343)

(assert (=> b!1352488 (= lt!597562 e!768824)))

(declare-fun c!126776 () Bool)

(assert (=> b!1352488 (= c!126776 (validKeyInArray!0 (select (arr!44534 a!3742) from!3120)))))

(declare-fun b!1352489 () Bool)

(declare-fun res!897821 () Bool)

(assert (=> b!1352489 (=> (not res!897821) (not e!768825))))

(declare-datatypes ((List!31575 0))(
  ( (Nil!31572) (Cons!31571 (h!32780 (_ BitVec 64)) (t!46233 List!31575)) )
))
(declare-fun acc!759 () List!31575)

(declare-fun noDuplicate!2141 (List!31575) Bool)

(assert (=> b!1352489 (= res!897821 (noDuplicate!2141 acc!759))))

(declare-fun b!1352490 () Bool)

(declare-fun res!897815 () Bool)

(assert (=> b!1352490 (=> (not res!897815) (not e!768825))))

(declare-fun contains!9284 (List!31575 (_ BitVec 64)) Bool)

(assert (=> b!1352490 (= res!897815 (not (contains!9284 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352491 () Bool)

(assert (=> b!1352491 (= e!768826 false)))

(declare-fun lt!597560 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92172 (_ BitVec 32) List!31575) Bool)

(assert (=> b!1352491 (= lt!597560 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352492 () Bool)

(declare-fun lt!597561 () Unit!44343)

(assert (=> b!1352492 (= e!768824 lt!597561)))

(declare-fun lt!597559 () Unit!44343)

(declare-fun lemmaListSubSeqRefl!0 (List!31575) Unit!44343)

(assert (=> b!1352492 (= lt!597559 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!704 (List!31575 List!31575) Bool)

(assert (=> b!1352492 (subseq!704 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92172 List!31575 List!31575 (_ BitVec 32)) Unit!44343)

(declare-fun $colon$colon!719 (List!31575 (_ BitVec 64)) List!31575)

(assert (=> b!1352492 (= lt!597561 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!719 acc!759 (select (arr!44534 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352492 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352493 () Bool)

(declare-fun res!897819 () Bool)

(assert (=> b!1352493 (=> (not res!897819) (not e!768825))))

(assert (=> b!1352493 (= res!897819 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352494 () Bool)

(declare-fun res!897817 () Bool)

(assert (=> b!1352494 (=> (not res!897817) (not e!768825))))

(assert (=> b!1352494 (= res!897817 (not (contains!9284 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352495 () Bool)

(declare-fun res!897814 () Bool)

(assert (=> b!1352495 (=> (not res!897814) (not e!768825))))

(assert (=> b!1352495 (= res!897814 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31572))))

(declare-fun b!1352496 () Bool)

(declare-fun res!897816 () Bool)

(assert (=> b!1352496 (=> (not res!897816) (not e!768825))))

(assert (=> b!1352496 (= res!897816 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45084 a!3742)))))

(declare-fun b!1352497 () Bool)

(declare-fun Unit!44345 () Unit!44343)

(assert (=> b!1352497 (= e!768824 Unit!44345)))

(assert (= (and start!113990 res!897823) b!1352489))

(assert (= (and b!1352489 res!897821) b!1352490))

(assert (= (and b!1352490 res!897815) b!1352494))

(assert (= (and b!1352494 res!897817) b!1352495))

(assert (= (and b!1352495 res!897814) b!1352493))

(assert (= (and b!1352493 res!897819) b!1352486))

(assert (= (and b!1352486 res!897822) b!1352487))

(assert (= (and b!1352487 res!897818) b!1352496))

(assert (= (and b!1352496 res!897816) b!1352488))

(assert (= (and b!1352488 c!126776) b!1352492))

(assert (= (and b!1352488 (not c!126776)) b!1352497))

(assert (= (and b!1352488 res!897820) b!1352491))

(declare-fun m!1239289 () Bool)

(assert (=> b!1352493 m!1239289))

(declare-fun m!1239291 () Bool)

(assert (=> b!1352487 m!1239291))

(declare-fun m!1239293 () Bool)

(assert (=> b!1352495 m!1239293))

(declare-fun m!1239295 () Bool)

(assert (=> b!1352489 m!1239295))

(declare-fun m!1239297 () Bool)

(assert (=> b!1352491 m!1239297))

(declare-fun m!1239299 () Bool)

(assert (=> start!113990 m!1239299))

(declare-fun m!1239301 () Bool)

(assert (=> b!1352490 m!1239301))

(declare-fun m!1239303 () Bool)

(assert (=> b!1352492 m!1239303))

(declare-fun m!1239305 () Bool)

(assert (=> b!1352492 m!1239305))

(declare-fun m!1239307 () Bool)

(assert (=> b!1352492 m!1239307))

(declare-fun m!1239309 () Bool)

(assert (=> b!1352492 m!1239309))

(assert (=> b!1352492 m!1239297))

(assert (=> b!1352492 m!1239305))

(assert (=> b!1352492 m!1239307))

(declare-fun m!1239311 () Bool)

(assert (=> b!1352492 m!1239311))

(declare-fun m!1239313 () Bool)

(assert (=> b!1352494 m!1239313))

(assert (=> b!1352488 m!1239305))

(assert (=> b!1352488 m!1239305))

(declare-fun m!1239315 () Bool)

(assert (=> b!1352488 m!1239315))

(push 1)

