; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114130 () Bool)

(assert start!114130)

(declare-fun b!1355547 () Bool)

(declare-fun res!900456 () Bool)

(declare-fun e!769781 () Bool)

(assert (=> b!1355547 (=> (not res!900456) (not e!769781))))

(declare-datatypes ((List!31645 0))(
  ( (Nil!31642) (Cons!31641 (h!32850 (_ BitVec 64)) (t!46303 List!31645)) )
))
(declare-fun acc!759 () List!31645)

(declare-fun contains!9354 (List!31645 (_ BitVec 64)) Bool)

(assert (=> b!1355547 (= res!900456 (not (contains!9354 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355548 () Bool)

(declare-fun res!900454 () Bool)

(assert (=> b!1355548 (=> (not res!900454) (not e!769781))))

(assert (=> b!1355548 (= res!900454 (not (contains!9354 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355549 () Bool)

(declare-fun res!900455 () Bool)

(assert (=> b!1355549 (=> (not res!900455) (not e!769781))))

(declare-fun noDuplicate!2211 (List!31645) Bool)

(assert (=> b!1355549 (= res!900455 (noDuplicate!2211 acc!759))))

(declare-fun b!1355550 () Bool)

(declare-fun e!769780 () Bool)

(assert (=> b!1355550 (= e!769781 e!769780)))

(declare-fun res!900462 () Bool)

(assert (=> b!1355550 (=> (not res!900462) (not e!769780))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!598675 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355550 (= res!900462 (and (not (= from!3120 i!1404)) (not lt!598675) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44553 0))(
  ( (Unit!44554) )
))
(declare-fun lt!598674 () Unit!44553)

(declare-fun e!769782 () Unit!44553)

(assert (=> b!1355550 (= lt!598674 e!769782)))

(declare-fun c!126986 () Bool)

(assert (=> b!1355550 (= c!126986 lt!598675)))

(declare-datatypes ((array!92312 0))(
  ( (array!92313 (arr!44604 (Array (_ BitVec 32) (_ BitVec 64))) (size!45154 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92312)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355550 (= lt!598675 (validKeyInArray!0 (select (arr!44604 a!3742) from!3120)))))

(declare-fun b!1355551 () Bool)

(declare-fun lt!598676 () Unit!44553)

(assert (=> b!1355551 (= e!769782 lt!598676)))

(declare-fun lt!598677 () Unit!44553)

(declare-fun lemmaListSubSeqRefl!0 (List!31645) Unit!44553)

(assert (=> b!1355551 (= lt!598677 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!774 (List!31645 List!31645) Bool)

(assert (=> b!1355551 (subseq!774 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92312 List!31645 List!31645 (_ BitVec 32)) Unit!44553)

(declare-fun $colon$colon!789 (List!31645 (_ BitVec 64)) List!31645)

(assert (=> b!1355551 (= lt!598676 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!789 acc!759 (select (arr!44604 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92312 (_ BitVec 32) List!31645) Bool)

(assert (=> b!1355551 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355552 () Bool)

(assert (=> b!1355552 (= e!769780 false)))

(declare-fun lt!598678 () Bool)

(assert (=> b!1355552 (= lt!598678 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355553 () Bool)

(declare-fun res!900458 () Bool)

(assert (=> b!1355553 (=> (not res!900458) (not e!769781))))

(assert (=> b!1355553 (= res!900458 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45154 a!3742)))))

(declare-fun res!900463 () Bool)

(assert (=> start!114130 (=> (not res!900463) (not e!769781))))

(assert (=> start!114130 (= res!900463 (and (bvslt (size!45154 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45154 a!3742))))))

(assert (=> start!114130 e!769781))

(assert (=> start!114130 true))

(declare-fun array_inv!33632 (array!92312) Bool)

(assert (=> start!114130 (array_inv!33632 a!3742)))

(declare-fun b!1355546 () Bool)

(declare-fun res!900461 () Bool)

(assert (=> b!1355546 (=> (not res!900461) (not e!769781))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1355546 (= res!900461 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355554 () Bool)

(declare-fun Unit!44555 () Unit!44553)

(assert (=> b!1355554 (= e!769782 Unit!44555)))

(declare-fun b!1355555 () Bool)

(declare-fun res!900459 () Bool)

(assert (=> b!1355555 (=> (not res!900459) (not e!769781))))

(assert (=> b!1355555 (= res!900459 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45154 a!3742))))))

(declare-fun b!1355556 () Bool)

(declare-fun res!900460 () Bool)

(assert (=> b!1355556 (=> (not res!900460) (not e!769781))))

(assert (=> b!1355556 (= res!900460 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355557 () Bool)

(declare-fun res!900457 () Bool)

(assert (=> b!1355557 (=> (not res!900457) (not e!769781))))

(assert (=> b!1355557 (= res!900457 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31642))))

(assert (= (and start!114130 res!900463) b!1355549))

(assert (= (and b!1355549 res!900455) b!1355547))

(assert (= (and b!1355547 res!900456) b!1355548))

(assert (= (and b!1355548 res!900454) b!1355557))

(assert (= (and b!1355557 res!900457) b!1355556))

(assert (= (and b!1355556 res!900460) b!1355555))

(assert (= (and b!1355555 res!900459) b!1355546))

(assert (= (and b!1355546 res!900461) b!1355553))

(assert (= (and b!1355553 res!900458) b!1355550))

(assert (= (and b!1355550 c!126986) b!1355551))

(assert (= (and b!1355550 (not c!126986)) b!1355554))

(assert (= (and b!1355550 res!900462) b!1355552))

(declare-fun m!1241705 () Bool)

(assert (=> start!114130 m!1241705))

(declare-fun m!1241707 () Bool)

(assert (=> b!1355552 m!1241707))

(declare-fun m!1241709 () Bool)

(assert (=> b!1355556 m!1241709))

(declare-fun m!1241711 () Bool)

(assert (=> b!1355546 m!1241711))

(declare-fun m!1241713 () Bool)

(assert (=> b!1355548 m!1241713))

(declare-fun m!1241715 () Bool)

(assert (=> b!1355549 m!1241715))

(declare-fun m!1241717 () Bool)

(assert (=> b!1355557 m!1241717))

(declare-fun m!1241719 () Bool)

(assert (=> b!1355550 m!1241719))

(assert (=> b!1355550 m!1241719))

(declare-fun m!1241721 () Bool)

(assert (=> b!1355550 m!1241721))

(declare-fun m!1241723 () Bool)

(assert (=> b!1355551 m!1241723))

(assert (=> b!1355551 m!1241719))

(declare-fun m!1241725 () Bool)

(assert (=> b!1355551 m!1241725))

(declare-fun m!1241727 () Bool)

(assert (=> b!1355551 m!1241727))

(assert (=> b!1355551 m!1241707))

(assert (=> b!1355551 m!1241719))

(assert (=> b!1355551 m!1241725))

(declare-fun m!1241729 () Bool)

(assert (=> b!1355551 m!1241729))

(declare-fun m!1241731 () Bool)

(assert (=> b!1355547 m!1241731))

(check-sat (not b!1355552) (not b!1355556) (not b!1355546) (not b!1355547) (not b!1355549) (not start!114130) (not b!1355557) (not b!1355550) (not b!1355551) (not b!1355548))
(check-sat)
