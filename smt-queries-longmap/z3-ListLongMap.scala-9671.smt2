; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114388 () Bool)

(assert start!114388)

(declare-fun b!1357468 () Bool)

(declare-datatypes ((Unit!44543 0))(
  ( (Unit!44544) )
))
(declare-fun e!770829 () Unit!44543)

(declare-fun lt!599408 () Unit!44543)

(assert (=> b!1357468 (= e!770829 lt!599408)))

(declare-fun lt!599409 () Unit!44543)

(declare-datatypes ((List!31702 0))(
  ( (Nil!31699) (Cons!31698 (h!32916 (_ BitVec 64)) (t!46352 List!31702)) )
))
(declare-fun acc!759 () List!31702)

(declare-fun lemmaListSubSeqRefl!0 (List!31702) Unit!44543)

(assert (=> b!1357468 (= lt!599409 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!791 (List!31702 List!31702) Bool)

(assert (=> b!1357468 (subseq!791 acc!759 acc!759)))

(declare-datatypes ((array!92461 0))(
  ( (array!92462 (arr!44674 (Array (_ BitVec 32) (_ BitVec 64))) (size!45225 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92461)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92461 List!31702 List!31702 (_ BitVec 32)) Unit!44543)

(declare-fun $colon$colon!805 (List!31702 (_ BitVec 64)) List!31702)

(assert (=> b!1357468 (= lt!599408 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!805 acc!759 (select (arr!44674 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92461 (_ BitVec 32) List!31702) Bool)

(assert (=> b!1357468 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1357469 () Bool)

(declare-fun res!901502 () Bool)

(declare-fun e!770830 () Bool)

(assert (=> b!1357469 (=> (not res!901502) (not e!770830))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357469 (= res!901502 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357470 () Bool)

(declare-fun Unit!44545 () Unit!44543)

(assert (=> b!1357470 (= e!770829 Unit!44545)))

(declare-fun b!1357471 () Bool)

(declare-fun res!901498 () Bool)

(assert (=> b!1357471 (=> (not res!901498) (not e!770830))))

(declare-fun contains!9414 (List!31702 (_ BitVec 64)) Bool)

(assert (=> b!1357471 (= res!901498 (not (contains!9414 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357472 () Bool)

(declare-fun res!901503 () Bool)

(assert (=> b!1357472 (=> (not res!901503) (not e!770830))))

(assert (=> b!1357472 (= res!901503 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31699))))

(declare-fun b!1357473 () Bool)

(declare-fun res!901495 () Bool)

(assert (=> b!1357473 (=> (not res!901495) (not e!770830))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357473 (= res!901495 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45225 a!3742))))))

(declare-fun b!1357474 () Bool)

(declare-fun res!901494 () Bool)

(assert (=> b!1357474 (=> (not res!901494) (not e!770830))))

(assert (=> b!1357474 (= res!901494 (not (contains!9414 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357475 () Bool)

(declare-fun e!770827 () Bool)

(assert (=> b!1357475 (= e!770827 (not true))))

(assert (=> b!1357475 (arrayNoDuplicates!0 (array!92462 (store (arr!44674 a!3742) i!1404 l!3587) (size!45225 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599405 () Unit!44543)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92461 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31702) Unit!44543)

(assert (=> b!1357475 (= lt!599405 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1357477 () Bool)

(declare-fun res!901499 () Bool)

(assert (=> b!1357477 (=> (not res!901499) (not e!770830))))

(declare-fun noDuplicate!2245 (List!31702) Bool)

(assert (=> b!1357477 (= res!901499 (noDuplicate!2245 acc!759))))

(declare-fun b!1357478 () Bool)

(assert (=> b!1357478 (= e!770830 e!770827)))

(declare-fun res!901501 () Bool)

(assert (=> b!1357478 (=> (not res!901501) (not e!770827))))

(declare-fun lt!599407 () Bool)

(assert (=> b!1357478 (= res!901501 (and (not (= from!3120 i!1404)) (not lt!599407) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599406 () Unit!44543)

(assert (=> b!1357478 (= lt!599406 e!770829)))

(declare-fun c!127435 () Bool)

(assert (=> b!1357478 (= c!127435 lt!599407)))

(assert (=> b!1357478 (= lt!599407 (validKeyInArray!0 (select (arr!44674 a!3742) from!3120)))))

(declare-fun b!1357479 () Bool)

(declare-fun res!901500 () Bool)

(assert (=> b!1357479 (=> (not res!901500) (not e!770830))))

(assert (=> b!1357479 (= res!901500 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45225 a!3742)))))

(declare-fun b!1357480 () Bool)

(declare-fun res!901497 () Bool)

(assert (=> b!1357480 (=> (not res!901497) (not e!770827))))

(assert (=> b!1357480 (= res!901497 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1357476 () Bool)

(declare-fun res!901496 () Bool)

(assert (=> b!1357476 (=> (not res!901496) (not e!770830))))

(assert (=> b!1357476 (= res!901496 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!901493 () Bool)

(assert (=> start!114388 (=> (not res!901493) (not e!770830))))

(assert (=> start!114388 (= res!901493 (and (bvslt (size!45225 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45225 a!3742))))))

(assert (=> start!114388 e!770830))

(assert (=> start!114388 true))

(declare-fun array_inv!33955 (array!92461) Bool)

(assert (=> start!114388 (array_inv!33955 a!3742)))

(assert (= (and start!114388 res!901493) b!1357477))

(assert (= (and b!1357477 res!901499) b!1357474))

(assert (= (and b!1357474 res!901494) b!1357471))

(assert (= (and b!1357471 res!901498) b!1357472))

(assert (= (and b!1357472 res!901503) b!1357476))

(assert (= (and b!1357476 res!901496) b!1357473))

(assert (= (and b!1357473 res!901495) b!1357469))

(assert (= (and b!1357469 res!901502) b!1357479))

(assert (= (and b!1357479 res!901500) b!1357478))

(assert (= (and b!1357478 c!127435) b!1357468))

(assert (= (and b!1357478 (not c!127435)) b!1357470))

(assert (= (and b!1357478 res!901501) b!1357480))

(assert (= (and b!1357480 res!901497) b!1357475))

(declare-fun m!1243795 () Bool)

(assert (=> b!1357474 m!1243795))

(declare-fun m!1243797 () Bool)

(assert (=> b!1357471 m!1243797))

(declare-fun m!1243799 () Bool)

(assert (=> b!1357477 m!1243799))

(declare-fun m!1243801 () Bool)

(assert (=> b!1357478 m!1243801))

(assert (=> b!1357478 m!1243801))

(declare-fun m!1243803 () Bool)

(assert (=> b!1357478 m!1243803))

(declare-fun m!1243805 () Bool)

(assert (=> b!1357475 m!1243805))

(declare-fun m!1243807 () Bool)

(assert (=> b!1357475 m!1243807))

(declare-fun m!1243809 () Bool)

(assert (=> b!1357475 m!1243809))

(declare-fun m!1243811 () Bool)

(assert (=> start!114388 m!1243811))

(declare-fun m!1243813 () Bool)

(assert (=> b!1357469 m!1243813))

(declare-fun m!1243815 () Bool)

(assert (=> b!1357472 m!1243815))

(declare-fun m!1243817 () Bool)

(assert (=> b!1357468 m!1243817))

(assert (=> b!1357468 m!1243801))

(declare-fun m!1243819 () Bool)

(assert (=> b!1357468 m!1243819))

(declare-fun m!1243821 () Bool)

(assert (=> b!1357468 m!1243821))

(declare-fun m!1243823 () Bool)

(assert (=> b!1357468 m!1243823))

(assert (=> b!1357468 m!1243801))

(assert (=> b!1357468 m!1243819))

(declare-fun m!1243825 () Bool)

(assert (=> b!1357468 m!1243825))

(assert (=> b!1357480 m!1243823))

(declare-fun m!1243827 () Bool)

(assert (=> b!1357476 m!1243827))

(check-sat (not b!1357480) (not b!1357472) (not b!1357469) (not b!1357477) (not b!1357478) (not b!1357475) (not b!1357474) (not b!1357468) (not b!1357476) (not start!114388) (not b!1357471))
(check-sat)
