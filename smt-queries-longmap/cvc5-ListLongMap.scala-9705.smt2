; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114680 () Bool)

(assert start!114680)

(declare-fun b!1360464 () Bool)

(declare-fun res!904760 () Bool)

(declare-fun e!771819 () Bool)

(assert (=> b!1360464 (=> (not res!904760) (not e!771819))))

(declare-datatypes ((List!31764 0))(
  ( (Nil!31761) (Cons!31760 (h!32969 (_ BitVec 64)) (t!46440 List!31764)) )
))
(declare-fun acc!759 () List!31764)

(declare-fun contains!9473 (List!31764 (_ BitVec 64)) Bool)

(assert (=> b!1360464 (= res!904760 (not (contains!9473 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360465 () Bool)

(declare-datatypes ((Unit!44829 0))(
  ( (Unit!44830) )
))
(declare-fun e!771818 () Unit!44829)

(declare-fun lt!599898 () Unit!44829)

(assert (=> b!1360465 (= e!771818 lt!599898)))

(declare-fun lt!599899 () Unit!44829)

(declare-fun lemmaListSubSeqRefl!0 (List!31764) Unit!44829)

(assert (=> b!1360465 (= lt!599899 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!875 (List!31764 List!31764) Bool)

(assert (=> b!1360465 (subseq!875 acc!759 acc!759)))

(declare-datatypes ((array!92568 0))(
  ( (array!92569 (arr!44723 (Array (_ BitVec 32) (_ BitVec 64))) (size!45273 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92568)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92568 List!31764 List!31764 (_ BitVec 32)) Unit!44829)

(declare-fun $colon$colon!878 (List!31764 (_ BitVec 64)) List!31764)

(assert (=> b!1360465 (= lt!599898 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!878 acc!759 (select (arr!44723 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92568 (_ BitVec 32) List!31764) Bool)

(assert (=> b!1360465 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360466 () Bool)

(assert (=> b!1360466 (= e!771819 false)))

(declare-fun lt!599897 () Unit!44829)

(assert (=> b!1360466 (= lt!599897 e!771818)))

(declare-fun c!127295 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360466 (= c!127295 (validKeyInArray!0 (select (arr!44723 a!3742) from!3120)))))

(declare-fun b!1360467 () Bool)

(declare-fun res!904754 () Bool)

(assert (=> b!1360467 (=> (not res!904754) (not e!771819))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1360467 (= res!904754 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360468 () Bool)

(declare-fun res!904762 () Bool)

(assert (=> b!1360468 (=> (not res!904762) (not e!771819))))

(assert (=> b!1360468 (= res!904762 (not (contains!9473 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!904756 () Bool)

(assert (=> start!114680 (=> (not res!904756) (not e!771819))))

(assert (=> start!114680 (= res!904756 (and (bvslt (size!45273 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45273 a!3742))))))

(assert (=> start!114680 e!771819))

(assert (=> start!114680 true))

(declare-fun array_inv!33751 (array!92568) Bool)

(assert (=> start!114680 (array_inv!33751 a!3742)))

(declare-fun b!1360469 () Bool)

(declare-fun res!904761 () Bool)

(assert (=> b!1360469 (=> (not res!904761) (not e!771819))))

(assert (=> b!1360469 (= res!904761 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45273 a!3742)))))

(declare-fun b!1360470 () Bool)

(declare-fun res!904759 () Bool)

(assert (=> b!1360470 (=> (not res!904759) (not e!771819))))

(declare-fun noDuplicate!2330 (List!31764) Bool)

(assert (=> b!1360470 (= res!904759 (noDuplicate!2330 acc!759))))

(declare-fun b!1360471 () Bool)

(declare-fun res!904757 () Bool)

(assert (=> b!1360471 (=> (not res!904757) (not e!771819))))

(assert (=> b!1360471 (= res!904757 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31761))))

(declare-fun b!1360472 () Bool)

(declare-fun Unit!44831 () Unit!44829)

(assert (=> b!1360472 (= e!771818 Unit!44831)))

(declare-fun b!1360473 () Bool)

(declare-fun res!904755 () Bool)

(assert (=> b!1360473 (=> (not res!904755) (not e!771819))))

(assert (=> b!1360473 (= res!904755 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360474 () Bool)

(declare-fun res!904758 () Bool)

(assert (=> b!1360474 (=> (not res!904758) (not e!771819))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360474 (= res!904758 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45273 a!3742))))))

(assert (= (and start!114680 res!904756) b!1360470))

(assert (= (and b!1360470 res!904759) b!1360468))

(assert (= (and b!1360468 res!904762) b!1360464))

(assert (= (and b!1360464 res!904760) b!1360471))

(assert (= (and b!1360471 res!904757) b!1360473))

(assert (= (and b!1360473 res!904755) b!1360474))

(assert (= (and b!1360474 res!904758) b!1360467))

(assert (= (and b!1360467 res!904754) b!1360469))

(assert (= (and b!1360469 res!904761) b!1360466))

(assert (= (and b!1360466 c!127295) b!1360465))

(assert (= (and b!1360466 (not c!127295)) b!1360472))

(declare-fun m!1245733 () Bool)

(assert (=> start!114680 m!1245733))

(declare-fun m!1245735 () Bool)

(assert (=> b!1360471 m!1245735))

(declare-fun m!1245737 () Bool)

(assert (=> b!1360473 m!1245737))

(declare-fun m!1245739 () Bool)

(assert (=> b!1360467 m!1245739))

(declare-fun m!1245741 () Bool)

(assert (=> b!1360464 m!1245741))

(declare-fun m!1245743 () Bool)

(assert (=> b!1360466 m!1245743))

(assert (=> b!1360466 m!1245743))

(declare-fun m!1245745 () Bool)

(assert (=> b!1360466 m!1245745))

(declare-fun m!1245747 () Bool)

(assert (=> b!1360470 m!1245747))

(declare-fun m!1245749 () Bool)

(assert (=> b!1360465 m!1245749))

(assert (=> b!1360465 m!1245743))

(declare-fun m!1245751 () Bool)

(assert (=> b!1360465 m!1245751))

(declare-fun m!1245753 () Bool)

(assert (=> b!1360465 m!1245753))

(declare-fun m!1245755 () Bool)

(assert (=> b!1360465 m!1245755))

(assert (=> b!1360465 m!1245743))

(assert (=> b!1360465 m!1245751))

(declare-fun m!1245757 () Bool)

(assert (=> b!1360465 m!1245757))

(declare-fun m!1245759 () Bool)

(assert (=> b!1360468 m!1245759))

(push 1)

(assert (not b!1360468))

(assert (not b!1360467))

(assert (not b!1360466))

(assert (not b!1360473))

(assert (not b!1360465))

(assert (not b!1360471))

(assert (not b!1360470))

(assert (not b!1360464))

(assert (not start!114680))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

