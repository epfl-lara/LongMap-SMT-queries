; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114678 () Bool)

(assert start!114678)

(declare-fun b!1360431 () Bool)

(declare-fun res!904732 () Bool)

(declare-fun e!771810 () Bool)

(assert (=> b!1360431 (=> (not res!904732) (not e!771810))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92566 0))(
  ( (array!92567 (arr!44722 (Array (_ BitVec 32) (_ BitVec 64))) (size!45272 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92566)

(assert (=> b!1360431 (= res!904732 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45272 a!3742))))))

(declare-fun b!1360432 () Bool)

(declare-fun res!904731 () Bool)

(assert (=> b!1360432 (=> (not res!904731) (not e!771810))))

(declare-datatypes ((List!31763 0))(
  ( (Nil!31760) (Cons!31759 (h!32968 (_ BitVec 64)) (t!46439 List!31763)) )
))
(declare-fun acc!759 () List!31763)

(declare-fun contains!9472 (List!31763 (_ BitVec 64)) Bool)

(assert (=> b!1360432 (= res!904731 (not (contains!9472 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360433 () Bool)

(declare-fun res!904728 () Bool)

(assert (=> b!1360433 (=> (not res!904728) (not e!771810))))

(declare-fun arrayNoDuplicates!0 (array!92566 (_ BitVec 32) List!31763) Bool)

(assert (=> b!1360433 (= res!904728 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31760))))

(declare-fun b!1360434 () Bool)

(declare-fun res!904734 () Bool)

(assert (=> b!1360434 (=> (not res!904734) (not e!771810))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1360434 (= res!904734 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360435 () Bool)

(declare-fun res!904729 () Bool)

(assert (=> b!1360435 (=> (not res!904729) (not e!771810))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360435 (= res!904729 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360436 () Bool)

(declare-fun res!904730 () Bool)

(assert (=> b!1360436 (=> (not res!904730) (not e!771810))))

(assert (=> b!1360436 (= res!904730 (not (contains!9472 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360438 () Bool)

(declare-datatypes ((Unit!44826 0))(
  ( (Unit!44827) )
))
(declare-fun e!771811 () Unit!44826)

(declare-fun lt!599890 () Unit!44826)

(assert (=> b!1360438 (= e!771811 lt!599890)))

(declare-fun lt!599889 () Unit!44826)

(declare-fun lemmaListSubSeqRefl!0 (List!31763) Unit!44826)

(assert (=> b!1360438 (= lt!599889 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!874 (List!31763 List!31763) Bool)

(assert (=> b!1360438 (subseq!874 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92566 List!31763 List!31763 (_ BitVec 32)) Unit!44826)

(declare-fun $colon$colon!877 (List!31763 (_ BitVec 64)) List!31763)

(assert (=> b!1360438 (= lt!599890 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!877 acc!759 (select (arr!44722 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360438 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599887 () Bool)

(declare-fun b!1360439 () Bool)

(assert (=> b!1360439 (= e!771810 (and (not (= from!3120 i!1404)) lt!599887 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599888 () Unit!44826)

(assert (=> b!1360439 (= lt!599888 e!771811)))

(declare-fun c!127292 () Bool)

(assert (=> b!1360439 (= c!127292 lt!599887)))

(assert (=> b!1360439 (= lt!599887 (validKeyInArray!0 (select (arr!44722 a!3742) from!3120)))))

(declare-fun b!1360440 () Bool)

(declare-fun res!904735 () Bool)

(assert (=> b!1360440 (=> (not res!904735) (not e!771810))))

(assert (=> b!1360440 (= res!904735 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45272 a!3742)))))

(declare-fun b!1360441 () Bool)

(declare-fun Unit!44828 () Unit!44826)

(assert (=> b!1360441 (= e!771811 Unit!44828)))

(declare-fun b!1360437 () Bool)

(declare-fun res!904733 () Bool)

(assert (=> b!1360437 (=> (not res!904733) (not e!771810))))

(declare-fun noDuplicate!2329 (List!31763) Bool)

(assert (=> b!1360437 (= res!904733 (noDuplicate!2329 acc!759))))

(declare-fun res!904727 () Bool)

(assert (=> start!114678 (=> (not res!904727) (not e!771810))))

(assert (=> start!114678 (= res!904727 (and (bvslt (size!45272 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45272 a!3742))))))

(assert (=> start!114678 e!771810))

(assert (=> start!114678 true))

(declare-fun array_inv!33750 (array!92566) Bool)

(assert (=> start!114678 (array_inv!33750 a!3742)))

(assert (= (and start!114678 res!904727) b!1360437))

(assert (= (and b!1360437 res!904733) b!1360436))

(assert (= (and b!1360436 res!904730) b!1360432))

(assert (= (and b!1360432 res!904731) b!1360433))

(assert (= (and b!1360433 res!904728) b!1360434))

(assert (= (and b!1360434 res!904734) b!1360431))

(assert (= (and b!1360431 res!904732) b!1360435))

(assert (= (and b!1360435 res!904729) b!1360440))

(assert (= (and b!1360440 res!904735) b!1360439))

(assert (= (and b!1360439 c!127292) b!1360438))

(assert (= (and b!1360439 (not c!127292)) b!1360441))

(declare-fun m!1245705 () Bool)

(assert (=> b!1360437 m!1245705))

(declare-fun m!1245707 () Bool)

(assert (=> b!1360433 m!1245707))

(declare-fun m!1245709 () Bool)

(assert (=> b!1360439 m!1245709))

(assert (=> b!1360439 m!1245709))

(declare-fun m!1245711 () Bool)

(assert (=> b!1360439 m!1245711))

(declare-fun m!1245713 () Bool)

(assert (=> b!1360432 m!1245713))

(declare-fun m!1245715 () Bool)

(assert (=> b!1360434 m!1245715))

(declare-fun m!1245717 () Bool)

(assert (=> b!1360438 m!1245717))

(assert (=> b!1360438 m!1245709))

(declare-fun m!1245719 () Bool)

(assert (=> b!1360438 m!1245719))

(declare-fun m!1245721 () Bool)

(assert (=> b!1360438 m!1245721))

(declare-fun m!1245723 () Bool)

(assert (=> b!1360438 m!1245723))

(assert (=> b!1360438 m!1245709))

(assert (=> b!1360438 m!1245719))

(declare-fun m!1245725 () Bool)

(assert (=> b!1360438 m!1245725))

(declare-fun m!1245727 () Bool)

(assert (=> start!114678 m!1245727))

(declare-fun m!1245729 () Bool)

(assert (=> b!1360436 m!1245729))

(declare-fun m!1245731 () Bool)

(assert (=> b!1360435 m!1245731))

(push 1)

(assert (not b!1360433))

(assert (not start!114678))

(assert (not b!1360439))

(assert (not b!1360432))

(assert (not b!1360437))

(assert (not b!1360434))

