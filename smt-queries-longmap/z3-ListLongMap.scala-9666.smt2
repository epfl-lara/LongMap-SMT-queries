; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114136 () Bool)

(assert start!114136)

(declare-fun b!1355654 () Bool)

(declare-fun res!900545 () Bool)

(declare-fun e!769817 () Bool)

(assert (=> b!1355654 (=> (not res!900545) (not e!769817))))

(declare-datatypes ((List!31648 0))(
  ( (Nil!31645) (Cons!31644 (h!32853 (_ BitVec 64)) (t!46306 List!31648)) )
))
(declare-fun acc!759 () List!31648)

(declare-fun noDuplicate!2214 (List!31648) Bool)

(assert (=> b!1355654 (= res!900545 (noDuplicate!2214 acc!759))))

(declare-fun b!1355655 () Bool)

(declare-datatypes ((Unit!44562 0))(
  ( (Unit!44563) )
))
(declare-fun e!769816 () Unit!44562)

(declare-fun Unit!44564 () Unit!44562)

(assert (=> b!1355655 (= e!769816 Unit!44564)))

(declare-fun b!1355657 () Bool)

(declare-fun lt!598721 () Unit!44562)

(assert (=> b!1355657 (= e!769816 lt!598721)))

(declare-fun lt!598720 () Unit!44562)

(declare-fun lemmaListSubSeqRefl!0 (List!31648) Unit!44562)

(assert (=> b!1355657 (= lt!598720 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!777 (List!31648 List!31648) Bool)

(assert (=> b!1355657 (subseq!777 acc!759 acc!759)))

(declare-datatypes ((array!92318 0))(
  ( (array!92319 (arr!44607 (Array (_ BitVec 32) (_ BitVec 64))) (size!45157 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92318)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92318 List!31648 List!31648 (_ BitVec 32)) Unit!44562)

(declare-fun $colon$colon!792 (List!31648 (_ BitVec 64)) List!31648)

(assert (=> b!1355657 (= lt!598721 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!792 acc!759 (select (arr!44607 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92318 (_ BitVec 32) List!31648) Bool)

(assert (=> b!1355657 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355658 () Bool)

(declare-fun res!900550 () Bool)

(assert (=> b!1355658 (=> (not res!900550) (not e!769817))))

(assert (=> b!1355658 (= res!900550 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45157 a!3742)))))

(declare-fun b!1355659 () Bool)

(declare-fun res!900549 () Bool)

(assert (=> b!1355659 (=> (not res!900549) (not e!769817))))

(assert (=> b!1355659 (= res!900549 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31645))))

(declare-fun b!1355656 () Bool)

(declare-fun e!769819 () Bool)

(assert (=> b!1355656 (= e!769819 false)))

(declare-fun lt!598719 () Bool)

(assert (=> b!1355656 (= lt!598719 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!900547 () Bool)

(assert (=> start!114136 (=> (not res!900547) (not e!769817))))

(assert (=> start!114136 (= res!900547 (and (bvslt (size!45157 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45157 a!3742))))))

(assert (=> start!114136 e!769817))

(assert (=> start!114136 true))

(declare-fun array_inv!33635 (array!92318) Bool)

(assert (=> start!114136 (array_inv!33635 a!3742)))

(declare-fun b!1355660 () Bool)

(declare-fun res!900551 () Bool)

(assert (=> b!1355660 (=> (not res!900551) (not e!769817))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355660 (= res!900551 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45157 a!3742))))))

(declare-fun b!1355661 () Bool)

(declare-fun res!900552 () Bool)

(assert (=> b!1355661 (=> (not res!900552) (not e!769817))))

(declare-fun contains!9357 (List!31648 (_ BitVec 64)) Bool)

(assert (=> b!1355661 (= res!900552 (not (contains!9357 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355662 () Bool)

(declare-fun res!900553 () Bool)

(assert (=> b!1355662 (=> (not res!900553) (not e!769817))))

(assert (=> b!1355662 (= res!900553 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355663 () Bool)

(declare-fun res!900546 () Bool)

(assert (=> b!1355663 (=> (not res!900546) (not e!769817))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355663 (= res!900546 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355664 () Bool)

(declare-fun res!900548 () Bool)

(assert (=> b!1355664 (=> (not res!900548) (not e!769817))))

(assert (=> b!1355664 (= res!900548 (not (contains!9357 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355665 () Bool)

(assert (=> b!1355665 (= e!769817 e!769819)))

(declare-fun res!900544 () Bool)

(assert (=> b!1355665 (=> (not res!900544) (not e!769819))))

(declare-fun lt!598722 () Bool)

(assert (=> b!1355665 (= res!900544 (and (not (= from!3120 i!1404)) (not lt!598722) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598723 () Unit!44562)

(assert (=> b!1355665 (= lt!598723 e!769816)))

(declare-fun c!126995 () Bool)

(assert (=> b!1355665 (= c!126995 lt!598722)))

(assert (=> b!1355665 (= lt!598722 (validKeyInArray!0 (select (arr!44607 a!3742) from!3120)))))

(assert (= (and start!114136 res!900547) b!1355654))

(assert (= (and b!1355654 res!900545) b!1355661))

(assert (= (and b!1355661 res!900552) b!1355664))

(assert (= (and b!1355664 res!900548) b!1355659))

(assert (= (and b!1355659 res!900549) b!1355662))

(assert (= (and b!1355662 res!900553) b!1355660))

(assert (= (and b!1355660 res!900551) b!1355663))

(assert (= (and b!1355663 res!900546) b!1355658))

(assert (= (and b!1355658 res!900550) b!1355665))

(assert (= (and b!1355665 c!126995) b!1355657))

(assert (= (and b!1355665 (not c!126995)) b!1355655))

(assert (= (and b!1355665 res!900544) b!1355656))

(declare-fun m!1241789 () Bool)

(assert (=> b!1355654 m!1241789))

(declare-fun m!1241791 () Bool)

(assert (=> b!1355664 m!1241791))

(declare-fun m!1241793 () Bool)

(assert (=> b!1355663 m!1241793))

(declare-fun m!1241795 () Bool)

(assert (=> b!1355665 m!1241795))

(assert (=> b!1355665 m!1241795))

(declare-fun m!1241797 () Bool)

(assert (=> b!1355665 m!1241797))

(declare-fun m!1241799 () Bool)

(assert (=> b!1355661 m!1241799))

(declare-fun m!1241801 () Bool)

(assert (=> b!1355657 m!1241801))

(assert (=> b!1355657 m!1241795))

(declare-fun m!1241803 () Bool)

(assert (=> b!1355657 m!1241803))

(declare-fun m!1241805 () Bool)

(assert (=> b!1355657 m!1241805))

(declare-fun m!1241807 () Bool)

(assert (=> b!1355657 m!1241807))

(assert (=> b!1355657 m!1241795))

(assert (=> b!1355657 m!1241803))

(declare-fun m!1241809 () Bool)

(assert (=> b!1355657 m!1241809))

(declare-fun m!1241811 () Bool)

(assert (=> b!1355659 m!1241811))

(assert (=> b!1355656 m!1241807))

(declare-fun m!1241813 () Bool)

(assert (=> b!1355662 m!1241813))

(declare-fun m!1241815 () Bool)

(assert (=> start!114136 m!1241815))

(check-sat (not b!1355654) (not start!114136) (not b!1355665) (not b!1355657) (not b!1355663) (not b!1355662) (not b!1355664) (not b!1355659) (not b!1355656) (not b!1355661))
(check-sat)
