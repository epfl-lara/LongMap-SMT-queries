; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114790 () Bool)

(assert start!114790)

(declare-fun b!1360610 () Bool)

(declare-fun e!772206 () Bool)

(declare-fun e!772204 () Bool)

(assert (=> b!1360610 (= e!772206 e!772204)))

(declare-fun res!904324 () Bool)

(assert (=> b!1360610 (=> (not res!904324) (not e!772204))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360610 (= res!904324 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44687 0))(
  ( (Unit!44688) )
))
(declare-fun lt!600040 () Unit!44687)

(declare-fun e!772205 () Unit!44687)

(assert (=> b!1360610 (= lt!600040 e!772205)))

(declare-fun c!127591 () Bool)

(declare-datatypes ((array!92626 0))(
  ( (array!92627 (arr!44749 (Array (_ BitVec 32) (_ BitVec 64))) (size!45300 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92626)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360610 (= c!127591 (validKeyInArray!0 (select (arr!44749 a!3742) from!3120)))))

(declare-fun b!1360611 () Bool)

(declare-fun lt!600041 () Unit!44687)

(assert (=> b!1360611 (= e!772205 lt!600041)))

(declare-fun lt!600039 () Unit!44687)

(declare-datatypes ((List!31777 0))(
  ( (Nil!31774) (Cons!31773 (h!32991 (_ BitVec 64)) (t!46442 List!31777)) )
))
(declare-fun acc!759 () List!31777)

(declare-fun lemmaListSubSeqRefl!0 (List!31777) Unit!44687)

(assert (=> b!1360611 (= lt!600039 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!848 (List!31777 List!31777) Bool)

(assert (=> b!1360611 (subseq!848 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92626 List!31777 List!31777 (_ BitVec 32)) Unit!44687)

(declare-fun $colon$colon!850 (List!31777 (_ BitVec 64)) List!31777)

(assert (=> b!1360611 (= lt!600041 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!850 acc!759 (select (arr!44749 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92626 (_ BitVec 32) List!31777) Bool)

(assert (=> b!1360611 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360612 () Bool)

(declare-fun res!904327 () Bool)

(assert (=> b!1360612 (=> (not res!904327) (not e!772206))))

(assert (=> b!1360612 (= res!904327 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45300 a!3742))))))

(declare-fun b!1360613 () Bool)

(declare-fun res!904323 () Bool)

(assert (=> b!1360613 (=> (not res!904323) (not e!772206))))

(assert (=> b!1360613 (= res!904323 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!904332 () Bool)

(assert (=> start!114790 (=> (not res!904332) (not e!772206))))

(assert (=> start!114790 (= res!904332 (and (bvslt (size!45300 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45300 a!3742))))))

(assert (=> start!114790 e!772206))

(assert (=> start!114790 true))

(declare-fun array_inv!34030 (array!92626) Bool)

(assert (=> start!114790 (array_inv!34030 a!3742)))

(declare-fun b!1360614 () Bool)

(declare-fun res!904326 () Bool)

(assert (=> b!1360614 (=> (not res!904326) (not e!772206))))

(declare-fun contains!9489 (List!31777 (_ BitVec 64)) Bool)

(assert (=> b!1360614 (= res!904326 (not (contains!9489 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360615 () Bool)

(declare-fun res!904328 () Bool)

(assert (=> b!1360615 (=> (not res!904328) (not e!772206))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1360615 (= res!904328 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360616 () Bool)

(declare-fun res!904330 () Bool)

(assert (=> b!1360616 (=> (not res!904330) (not e!772206))))

(assert (=> b!1360616 (= res!904330 (not (contains!9489 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360617 () Bool)

(assert (=> b!1360617 (= e!772204 false)))

(declare-fun lt!600042 () Bool)

(assert (=> b!1360617 (= lt!600042 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1360618 () Bool)

(declare-fun res!904325 () Bool)

(assert (=> b!1360618 (=> (not res!904325) (not e!772206))))

(assert (=> b!1360618 (= res!904325 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45300 a!3742)))))

(declare-fun b!1360619 () Bool)

(declare-fun res!904329 () Bool)

(assert (=> b!1360619 (=> (not res!904329) (not e!772206))))

(assert (=> b!1360619 (= res!904329 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31774))))

(declare-fun b!1360620 () Bool)

(declare-fun Unit!44689 () Unit!44687)

(assert (=> b!1360620 (= e!772205 Unit!44689)))

(declare-fun b!1360621 () Bool)

(declare-fun res!904331 () Bool)

(assert (=> b!1360621 (=> (not res!904331) (not e!772206))))

(declare-fun noDuplicate!2320 (List!31777) Bool)

(assert (=> b!1360621 (= res!904331 (noDuplicate!2320 acc!759))))

(assert (= (and start!114790 res!904332) b!1360621))

(assert (= (and b!1360621 res!904331) b!1360616))

(assert (= (and b!1360616 res!904330) b!1360614))

(assert (= (and b!1360614 res!904326) b!1360619))

(assert (= (and b!1360619 res!904329) b!1360613))

(assert (= (and b!1360613 res!904323) b!1360612))

(assert (= (and b!1360612 res!904327) b!1360615))

(assert (= (and b!1360615 res!904328) b!1360618))

(assert (= (and b!1360618 res!904325) b!1360610))

(assert (= (and b!1360610 c!127591) b!1360611))

(assert (= (and b!1360610 (not c!127591)) b!1360620))

(assert (= (and b!1360610 res!904324) b!1360617))

(declare-fun m!1246345 () Bool)

(assert (=> start!114790 m!1246345))

(declare-fun m!1246347 () Bool)

(assert (=> b!1360611 m!1246347))

(declare-fun m!1246349 () Bool)

(assert (=> b!1360611 m!1246349))

(declare-fun m!1246351 () Bool)

(assert (=> b!1360611 m!1246351))

(declare-fun m!1246353 () Bool)

(assert (=> b!1360611 m!1246353))

(declare-fun m!1246355 () Bool)

(assert (=> b!1360611 m!1246355))

(assert (=> b!1360611 m!1246349))

(assert (=> b!1360611 m!1246351))

(declare-fun m!1246357 () Bool)

(assert (=> b!1360611 m!1246357))

(declare-fun m!1246359 () Bool)

(assert (=> b!1360621 m!1246359))

(declare-fun m!1246361 () Bool)

(assert (=> b!1360615 m!1246361))

(declare-fun m!1246363 () Bool)

(assert (=> b!1360614 m!1246363))

(assert (=> b!1360610 m!1246349))

(assert (=> b!1360610 m!1246349))

(declare-fun m!1246365 () Bool)

(assert (=> b!1360610 m!1246365))

(assert (=> b!1360617 m!1246355))

(declare-fun m!1246367 () Bool)

(assert (=> b!1360616 m!1246367))

(declare-fun m!1246369 () Bool)

(assert (=> b!1360613 m!1246369))

(declare-fun m!1246371 () Bool)

(assert (=> b!1360619 m!1246371))

(check-sat (not b!1360615) (not b!1360616) (not b!1360621) (not b!1360617) (not b!1360614) (not b!1360610) (not b!1360619) (not b!1360611) (not b!1360613) (not start!114790))
(check-sat)
