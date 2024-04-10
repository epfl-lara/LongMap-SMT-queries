; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114082 () Bool)

(assert start!114082)

(declare-fun b!1354527 () Bool)

(declare-fun res!899588 () Bool)

(declare-fun e!769465 () Bool)

(assert (=> b!1354527 (=> (not res!899588) (not e!769465))))

(declare-datatypes ((List!31621 0))(
  ( (Nil!31618) (Cons!31617 (h!32826 (_ BitVec 64)) (t!46279 List!31621)) )
))
(declare-fun acc!759 () List!31621)

(declare-fun contains!9330 (List!31621 (_ BitVec 64)) Bool)

(assert (=> b!1354527 (= res!899588 (not (contains!9330 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!899586 () Bool)

(assert (=> start!114082 (=> (not res!899586) (not e!769465))))

(declare-datatypes ((array!92264 0))(
  ( (array!92265 (arr!44580 (Array (_ BitVec 32) (_ BitVec 64))) (size!45130 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92264)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114082 (= res!899586 (and (bvslt (size!45130 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45130 a!3742))))))

(assert (=> start!114082 e!769465))

(assert (=> start!114082 true))

(declare-fun array_inv!33608 (array!92264) Bool)

(assert (=> start!114082 (array_inv!33608 a!3742)))

(declare-fun b!1354528 () Bool)

(declare-fun res!899583 () Bool)

(assert (=> b!1354528 (=> (not res!899583) (not e!769465))))

(declare-fun arrayNoDuplicates!0 (array!92264 (_ BitVec 32) List!31621) Bool)

(assert (=> b!1354528 (= res!899583 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354529 () Bool)

(declare-fun res!899587 () Bool)

(declare-fun e!769463 () Bool)

(assert (=> b!1354529 (=> (not res!899587) (not e!769463))))

(declare-fun lt!598286 () List!31621)

(assert (=> b!1354529 (= res!899587 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598286))))

(declare-fun b!1354530 () Bool)

(assert (=> b!1354530 (= e!769463 (not (bvsle from!3120 (size!45130 a!3742))))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354530 (arrayNoDuplicates!0 (array!92265 (store (arr!44580 a!3742) i!1404 l!3587) (size!45130 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598286)))

(declare-datatypes ((Unit!44481 0))(
  ( (Unit!44482) )
))
(declare-fun lt!598284 () Unit!44481)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92264 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31621) Unit!44481)

(assert (=> b!1354530 (= lt!598284 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598286))))

(declare-fun b!1354531 () Bool)

(declare-fun res!899585 () Bool)

(assert (=> b!1354531 (=> (not res!899585) (not e!769465))))

(assert (=> b!1354531 (= res!899585 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45130 a!3742)))))

(declare-fun b!1354532 () Bool)

(declare-fun res!899579 () Bool)

(assert (=> b!1354532 (=> (not res!899579) (not e!769465))))

(assert (=> b!1354532 (= res!899579 (not (contains!9330 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354533 () Bool)

(declare-fun res!899590 () Bool)

(assert (=> b!1354533 (=> (not res!899590) (not e!769463))))

(declare-fun noDuplicate!2187 (List!31621) Bool)

(assert (=> b!1354533 (= res!899590 (noDuplicate!2187 lt!598286))))

(declare-fun b!1354534 () Bool)

(declare-fun e!769464 () Unit!44481)

(declare-fun Unit!44483 () Unit!44481)

(assert (=> b!1354534 (= e!769464 Unit!44483)))

(declare-fun b!1354535 () Bool)

(declare-fun res!899593 () Bool)

(assert (=> b!1354535 (=> (not res!899593) (not e!769465))))

(assert (=> b!1354535 (= res!899593 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45130 a!3742))))))

(declare-fun b!1354536 () Bool)

(declare-fun e!769461 () Bool)

(assert (=> b!1354536 (= e!769461 e!769463)))

(declare-fun res!899580 () Bool)

(assert (=> b!1354536 (=> (not res!899580) (not e!769463))))

(assert (=> b!1354536 (= res!899580 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!765 (List!31621 (_ BitVec 64)) List!31621)

(assert (=> b!1354536 (= lt!598286 ($colon$colon!765 acc!759 (select (arr!44580 a!3742) from!3120)))))

(declare-fun b!1354537 () Bool)

(assert (=> b!1354537 (= e!769465 e!769461)))

(declare-fun res!899581 () Bool)

(assert (=> b!1354537 (=> (not res!899581) (not e!769461))))

(declare-fun lt!598287 () Bool)

(assert (=> b!1354537 (= res!899581 (and (not (= from!3120 i!1404)) lt!598287))))

(declare-fun lt!598283 () Unit!44481)

(assert (=> b!1354537 (= lt!598283 e!769464)))

(declare-fun c!126914 () Bool)

(assert (=> b!1354537 (= c!126914 lt!598287)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354537 (= lt!598287 (validKeyInArray!0 (select (arr!44580 a!3742) from!3120)))))

(declare-fun b!1354538 () Bool)

(declare-fun res!899582 () Bool)

(assert (=> b!1354538 (=> (not res!899582) (not e!769465))))

(assert (=> b!1354538 (= res!899582 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31618))))

(declare-fun b!1354539 () Bool)

(declare-fun res!899592 () Bool)

(assert (=> b!1354539 (=> (not res!899592) (not e!769465))))

(assert (=> b!1354539 (= res!899592 (noDuplicate!2187 acc!759))))

(declare-fun b!1354540 () Bool)

(declare-fun lt!598285 () Unit!44481)

(assert (=> b!1354540 (= e!769464 lt!598285)))

(declare-fun lt!598288 () Unit!44481)

(declare-fun lemmaListSubSeqRefl!0 (List!31621) Unit!44481)

(assert (=> b!1354540 (= lt!598288 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!750 (List!31621 List!31621) Bool)

(assert (=> b!1354540 (subseq!750 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92264 List!31621 List!31621 (_ BitVec 32)) Unit!44481)

(assert (=> b!1354540 (= lt!598285 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!765 acc!759 (select (arr!44580 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354540 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354541 () Bool)

(declare-fun res!899591 () Bool)

(assert (=> b!1354541 (=> (not res!899591) (not e!769465))))

(assert (=> b!1354541 (= res!899591 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354542 () Bool)

(declare-fun res!899589 () Bool)

(assert (=> b!1354542 (=> (not res!899589) (not e!769463))))

(assert (=> b!1354542 (= res!899589 (not (contains!9330 lt!598286 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354543 () Bool)

(declare-fun res!899584 () Bool)

(assert (=> b!1354543 (=> (not res!899584) (not e!769463))))

(assert (=> b!1354543 (= res!899584 (not (contains!9330 lt!598286 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114082 res!899586) b!1354539))

(assert (= (and b!1354539 res!899592) b!1354527))

(assert (= (and b!1354527 res!899588) b!1354532))

(assert (= (and b!1354532 res!899579) b!1354538))

(assert (= (and b!1354538 res!899582) b!1354528))

(assert (= (and b!1354528 res!899583) b!1354535))

(assert (= (and b!1354535 res!899593) b!1354541))

(assert (= (and b!1354541 res!899591) b!1354531))

(assert (= (and b!1354531 res!899585) b!1354537))

(assert (= (and b!1354537 c!126914) b!1354540))

(assert (= (and b!1354537 (not c!126914)) b!1354534))

(assert (= (and b!1354537 res!899581) b!1354536))

(assert (= (and b!1354536 res!899580) b!1354533))

(assert (= (and b!1354533 res!899590) b!1354542))

(assert (= (and b!1354542 res!899589) b!1354543))

(assert (= (and b!1354543 res!899584) b!1354529))

(assert (= (and b!1354529 res!899587) b!1354530))

(declare-fun m!1240879 () Bool)

(assert (=> b!1354539 m!1240879))

(declare-fun m!1240881 () Bool)

(assert (=> b!1354538 m!1240881))

(declare-fun m!1240883 () Bool)

(assert (=> b!1354541 m!1240883))

(declare-fun m!1240885 () Bool)

(assert (=> b!1354537 m!1240885))

(assert (=> b!1354537 m!1240885))

(declare-fun m!1240887 () Bool)

(assert (=> b!1354537 m!1240887))

(declare-fun m!1240889 () Bool)

(assert (=> b!1354542 m!1240889))

(declare-fun m!1240891 () Bool)

(assert (=> b!1354540 m!1240891))

(assert (=> b!1354540 m!1240885))

(declare-fun m!1240893 () Bool)

(assert (=> b!1354540 m!1240893))

(declare-fun m!1240895 () Bool)

(assert (=> b!1354540 m!1240895))

(declare-fun m!1240897 () Bool)

(assert (=> b!1354540 m!1240897))

(assert (=> b!1354540 m!1240885))

(assert (=> b!1354540 m!1240893))

(declare-fun m!1240899 () Bool)

(assert (=> b!1354540 m!1240899))

(declare-fun m!1240901 () Bool)

(assert (=> b!1354533 m!1240901))

(declare-fun m!1240903 () Bool)

(assert (=> b!1354530 m!1240903))

(declare-fun m!1240905 () Bool)

(assert (=> b!1354530 m!1240905))

(declare-fun m!1240907 () Bool)

(assert (=> b!1354530 m!1240907))

(declare-fun m!1240909 () Bool)

(assert (=> b!1354528 m!1240909))

(assert (=> b!1354536 m!1240885))

(assert (=> b!1354536 m!1240885))

(assert (=> b!1354536 m!1240893))

(declare-fun m!1240911 () Bool)

(assert (=> start!114082 m!1240911))

(declare-fun m!1240913 () Bool)

(assert (=> b!1354527 m!1240913))

(declare-fun m!1240915 () Bool)

(assert (=> b!1354532 m!1240915))

(declare-fun m!1240917 () Bool)

(assert (=> b!1354543 m!1240917))

(declare-fun m!1240919 () Bool)

(assert (=> b!1354529 m!1240919))

(check-sat (not b!1354530) (not b!1354528) (not b!1354532) (not b!1354538) (not b!1354529) (not b!1354543) (not b!1354539) (not b!1354537) (not b!1354542) (not b!1354527) (not b!1354540) (not b!1354533) (not b!1354536) (not start!114082) (not b!1354541))
(check-sat)
