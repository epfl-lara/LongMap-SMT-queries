; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114090 () Bool)

(assert start!114090)

(declare-fun b!1354731 () Bool)

(declare-fun res!899762 () Bool)

(declare-fun e!769521 () Bool)

(assert (=> b!1354731 (=> (not res!899762) (not e!769521))))

(declare-datatypes ((array!92272 0))(
  ( (array!92273 (arr!44584 (Array (_ BitVec 32) (_ BitVec 64))) (size!45134 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92272)

(declare-datatypes ((List!31625 0))(
  ( (Nil!31622) (Cons!31621 (h!32830 (_ BitVec 64)) (t!46283 List!31625)) )
))
(declare-fun arrayNoDuplicates!0 (array!92272 (_ BitVec 32) List!31625) Bool)

(assert (=> b!1354731 (= res!899762 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31622))))

(declare-fun b!1354732 () Bool)

(declare-fun res!899766 () Bool)

(assert (=> b!1354732 (=> (not res!899766) (not e!769521))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354732 (= res!899766 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45134 a!3742))))))

(declare-fun b!1354733 () Bool)

(declare-datatypes ((Unit!44493 0))(
  ( (Unit!44494) )
))
(declare-fun e!769524 () Unit!44493)

(declare-fun lt!598358 () Unit!44493)

(assert (=> b!1354733 (= e!769524 lt!598358)))

(declare-fun lt!598359 () Unit!44493)

(declare-fun acc!759 () List!31625)

(declare-fun lemmaListSubSeqRefl!0 (List!31625) Unit!44493)

(assert (=> b!1354733 (= lt!598359 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!754 (List!31625 List!31625) Bool)

(assert (=> b!1354733 (subseq!754 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92272 List!31625 List!31625 (_ BitVec 32)) Unit!44493)

(declare-fun $colon$colon!769 (List!31625 (_ BitVec 64)) List!31625)

(assert (=> b!1354733 (= lt!598358 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!769 acc!759 (select (arr!44584 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354733 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354734 () Bool)

(declare-fun Unit!44495 () Unit!44493)

(assert (=> b!1354734 (= e!769524 Unit!44495)))

(declare-fun b!1354735 () Bool)

(declare-fun res!899761 () Bool)

(declare-fun e!769522 () Bool)

(assert (=> b!1354735 (=> (not res!899761) (not e!769522))))

(declare-fun lt!598356 () List!31625)

(assert (=> b!1354735 (= res!899761 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598356))))

(declare-fun res!899768 () Bool)

(assert (=> start!114090 (=> (not res!899768) (not e!769521))))

(assert (=> start!114090 (= res!899768 (and (bvslt (size!45134 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45134 a!3742))))))

(assert (=> start!114090 e!769521))

(assert (=> start!114090 true))

(declare-fun array_inv!33612 (array!92272) Bool)

(assert (=> start!114090 (array_inv!33612 a!3742)))

(declare-fun b!1354736 () Bool)

(declare-fun res!899763 () Bool)

(assert (=> b!1354736 (=> (not res!899763) (not e!769522))))

(declare-fun contains!9334 (List!31625 (_ BitVec 64)) Bool)

(assert (=> b!1354736 (= res!899763 (not (contains!9334 lt!598356 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354737 () Bool)

(declare-fun e!769523 () Bool)

(assert (=> b!1354737 (= e!769521 e!769523)))

(declare-fun res!899765 () Bool)

(assert (=> b!1354737 (=> (not res!899765) (not e!769523))))

(declare-fun lt!598357 () Bool)

(assert (=> b!1354737 (= res!899765 (and (not (= from!3120 i!1404)) lt!598357))))

(declare-fun lt!598355 () Unit!44493)

(assert (=> b!1354737 (= lt!598355 e!769524)))

(declare-fun c!126926 () Bool)

(assert (=> b!1354737 (= c!126926 lt!598357)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354737 (= lt!598357 (validKeyInArray!0 (select (arr!44584 a!3742) from!3120)))))

(declare-fun b!1354738 () Bool)

(declare-fun res!899773 () Bool)

(assert (=> b!1354738 (=> (not res!899773) (not e!769521))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354738 (= res!899773 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354739 () Bool)

(assert (=> b!1354739 (= e!769522 (not true))))

(assert (=> b!1354739 (arrayNoDuplicates!0 (array!92273 (store (arr!44584 a!3742) i!1404 l!3587) (size!45134 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598356)))

(declare-fun lt!598360 () Unit!44493)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92272 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31625) Unit!44493)

(assert (=> b!1354739 (= lt!598360 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598356))))

(declare-fun b!1354740 () Bool)

(declare-fun res!899759 () Bool)

(assert (=> b!1354740 (=> (not res!899759) (not e!769521))))

(assert (=> b!1354740 (= res!899759 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354741 () Bool)

(declare-fun res!899769 () Bool)

(assert (=> b!1354741 (=> (not res!899769) (not e!769521))))

(declare-fun noDuplicate!2191 (List!31625) Bool)

(assert (=> b!1354741 (= res!899769 (noDuplicate!2191 acc!759))))

(declare-fun b!1354742 () Bool)

(declare-fun res!899760 () Bool)

(assert (=> b!1354742 (=> (not res!899760) (not e!769522))))

(assert (=> b!1354742 (= res!899760 (noDuplicate!2191 lt!598356))))

(declare-fun b!1354743 () Bool)

(declare-fun res!899771 () Bool)

(assert (=> b!1354743 (=> (not res!899771) (not e!769521))))

(assert (=> b!1354743 (= res!899771 (not (contains!9334 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354744 () Bool)

(declare-fun res!899770 () Bool)

(assert (=> b!1354744 (=> (not res!899770) (not e!769522))))

(assert (=> b!1354744 (= res!899770 (not (contains!9334 lt!598356 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354745 () Bool)

(declare-fun res!899767 () Bool)

(assert (=> b!1354745 (=> (not res!899767) (not e!769521))))

(assert (=> b!1354745 (= res!899767 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45134 a!3742)))))

(declare-fun b!1354746 () Bool)

(assert (=> b!1354746 (= e!769523 e!769522)))

(declare-fun res!899764 () Bool)

(assert (=> b!1354746 (=> (not res!899764) (not e!769522))))

(assert (=> b!1354746 (= res!899764 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1354746 (= lt!598356 ($colon$colon!769 acc!759 (select (arr!44584 a!3742) from!3120)))))

(declare-fun b!1354747 () Bool)

(declare-fun res!899772 () Bool)

(assert (=> b!1354747 (=> (not res!899772) (not e!769521))))

(assert (=> b!1354747 (= res!899772 (not (contains!9334 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114090 res!899768) b!1354741))

(assert (= (and b!1354741 res!899769) b!1354743))

(assert (= (and b!1354743 res!899771) b!1354747))

(assert (= (and b!1354747 res!899772) b!1354731))

(assert (= (and b!1354731 res!899762) b!1354740))

(assert (= (and b!1354740 res!899759) b!1354732))

(assert (= (and b!1354732 res!899766) b!1354738))

(assert (= (and b!1354738 res!899773) b!1354745))

(assert (= (and b!1354745 res!899767) b!1354737))

(assert (= (and b!1354737 c!126926) b!1354733))

(assert (= (and b!1354737 (not c!126926)) b!1354734))

(assert (= (and b!1354737 res!899765) b!1354746))

(assert (= (and b!1354746 res!899764) b!1354742))

(assert (= (and b!1354742 res!899760) b!1354736))

(assert (= (and b!1354736 res!899763) b!1354744))

(assert (= (and b!1354744 res!899770) b!1354735))

(assert (= (and b!1354735 res!899761) b!1354739))

(declare-fun m!1241047 () Bool)

(assert (=> b!1354741 m!1241047))

(declare-fun m!1241049 () Bool)

(assert (=> b!1354735 m!1241049))

(declare-fun m!1241051 () Bool)

(assert (=> b!1354744 m!1241051))

(declare-fun m!1241053 () Bool)

(assert (=> b!1354742 m!1241053))

(declare-fun m!1241055 () Bool)

(assert (=> start!114090 m!1241055))

(declare-fun m!1241057 () Bool)

(assert (=> b!1354737 m!1241057))

(assert (=> b!1354737 m!1241057))

(declare-fun m!1241059 () Bool)

(assert (=> b!1354737 m!1241059))

(declare-fun m!1241061 () Bool)

(assert (=> b!1354739 m!1241061))

(declare-fun m!1241063 () Bool)

(assert (=> b!1354739 m!1241063))

(declare-fun m!1241065 () Bool)

(assert (=> b!1354739 m!1241065))

(declare-fun m!1241067 () Bool)

(assert (=> b!1354733 m!1241067))

(assert (=> b!1354733 m!1241057))

(declare-fun m!1241069 () Bool)

(assert (=> b!1354733 m!1241069))

(declare-fun m!1241071 () Bool)

(assert (=> b!1354733 m!1241071))

(declare-fun m!1241073 () Bool)

(assert (=> b!1354733 m!1241073))

(assert (=> b!1354733 m!1241057))

(assert (=> b!1354733 m!1241069))

(declare-fun m!1241075 () Bool)

(assert (=> b!1354733 m!1241075))

(declare-fun m!1241077 () Bool)

(assert (=> b!1354731 m!1241077))

(declare-fun m!1241079 () Bool)

(assert (=> b!1354743 m!1241079))

(declare-fun m!1241081 () Bool)

(assert (=> b!1354738 m!1241081))

(declare-fun m!1241083 () Bool)

(assert (=> b!1354740 m!1241083))

(declare-fun m!1241085 () Bool)

(assert (=> b!1354736 m!1241085))

(assert (=> b!1354746 m!1241057))

(assert (=> b!1354746 m!1241057))

(assert (=> b!1354746 m!1241069))

(declare-fun m!1241087 () Bool)

(assert (=> b!1354747 m!1241087))

(push 1)

