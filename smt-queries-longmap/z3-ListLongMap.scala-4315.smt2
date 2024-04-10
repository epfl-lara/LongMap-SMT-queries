; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59920 () Bool)

(assert start!59920)

(declare-fun b!663732 () Bool)

(declare-fun res!431570 () Bool)

(declare-fun e!380790 () Bool)

(assert (=> b!663732 (=> (not res!431570) (not e!380790))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663732 (= res!431570 (validKeyInArray!0 k0!2843))))

(declare-fun b!663733 () Bool)

(declare-fun res!431560 () Bool)

(assert (=> b!663733 (=> (not res!431560) (not e!380790))))

(declare-datatypes ((List!12717 0))(
  ( (Nil!12714) (Cons!12713 (h!13758 (_ BitVec 64)) (t!18945 List!12717)) )
))
(declare-fun acc!681 () List!12717)

(declare-fun noDuplicate!541 (List!12717) Bool)

(assert (=> b!663733 (= res!431560 (noDuplicate!541 acc!681))))

(declare-fun b!663734 () Bool)

(declare-fun res!431562 () Bool)

(assert (=> b!663734 (=> (not res!431562) (not e!380790))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38967 0))(
  ( (array!38968 (arr!18676 (Array (_ BitVec 32) (_ BitVec 64))) (size!19040 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38967)

(assert (=> b!663734 (= res!431562 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19040 a!3626))))))

(declare-fun b!663735 () Bool)

(declare-fun res!431571 () Bool)

(assert (=> b!663735 (=> (not res!431571) (not e!380790))))

(declare-fun arrayContainsKey!0 (array!38967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663735 (= res!431571 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663736 () Bool)

(declare-fun e!380786 () Bool)

(declare-fun e!380788 () Bool)

(assert (=> b!663736 (= e!380786 e!380788)))

(declare-fun res!431564 () Bool)

(assert (=> b!663736 (=> (not res!431564) (not e!380788))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!663736 (= res!431564 (bvsle from!3004 i!1382))))

(declare-fun b!663737 () Bool)

(declare-datatypes ((Unit!23105 0))(
  ( (Unit!23106) )
))
(declare-fun e!380789 () Unit!23105)

(declare-fun lt!309369 () Unit!23105)

(assert (=> b!663737 (= e!380789 lt!309369)))

(declare-fun lt!309367 () Unit!23105)

(declare-fun lemmaListSubSeqRefl!0 (List!12717) Unit!23105)

(assert (=> b!663737 (= lt!309367 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!33 (List!12717 List!12717) Bool)

(assert (=> b!663737 (subseq!33 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38967 List!12717 List!12717 (_ BitVec 32)) Unit!23105)

(declare-fun $colon$colon!165 (List!12717 (_ BitVec 64)) List!12717)

(assert (=> b!663737 (= lt!309369 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!165 acc!681 (select (arr!18676 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!38967 (_ BitVec 32) List!12717) Bool)

(assert (=> b!663737 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!663738 () Bool)

(declare-fun res!431569 () Bool)

(assert (=> b!663738 (=> (not res!431569) (not e!380790))))

(declare-fun contains!3294 (List!12717 (_ BitVec 64)) Bool)

(assert (=> b!663738 (= res!431569 (not (contains!3294 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663739 () Bool)

(declare-fun res!431573 () Bool)

(assert (=> b!663739 (=> (not res!431573) (not e!380790))))

(assert (=> b!663739 (= res!431573 (not (contains!3294 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663740 () Bool)

(declare-fun e!380785 () Unit!23105)

(declare-fun Unit!23107 () Unit!23105)

(assert (=> b!663740 (= e!380785 Unit!23107)))

(declare-fun lt!309368 () Unit!23105)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38967 (_ BitVec 64) (_ BitVec 32)) Unit!23105)

(assert (=> b!663740 (= lt!309368 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!663740 false))

(declare-fun b!663741 () Bool)

(declare-fun Unit!23108 () Unit!23105)

(assert (=> b!663741 (= e!380785 Unit!23108)))

(declare-fun b!663742 () Bool)

(declare-fun res!431561 () Bool)

(assert (=> b!663742 (=> (not res!431561) (not e!380790))))

(assert (=> b!663742 (= res!431561 e!380786)))

(declare-fun res!431566 () Bool)

(assert (=> b!663742 (=> res!431566 e!380786)))

(declare-fun e!380784 () Bool)

(assert (=> b!663742 (= res!431566 e!380784)))

(declare-fun res!431572 () Bool)

(assert (=> b!663742 (=> (not res!431572) (not e!380784))))

(assert (=> b!663742 (= res!431572 (bvsgt from!3004 i!1382))))

(declare-fun b!663743 () Bool)

(declare-fun res!431565 () Bool)

(assert (=> b!663743 (=> (not res!431565) (not e!380790))))

(assert (=> b!663743 (= res!431565 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12714))))

(declare-fun b!663744 () Bool)

(declare-fun Unit!23109 () Unit!23105)

(assert (=> b!663744 (= e!380789 Unit!23109)))

(declare-fun b!663745 () Bool)

(assert (=> b!663745 (= e!380788 (not (contains!3294 acc!681 k0!2843)))))

(declare-fun b!663746 () Bool)

(assert (=> b!663746 (= e!380784 (contains!3294 acc!681 k0!2843))))

(declare-fun b!663747 () Bool)

(declare-fun res!431563 () Bool)

(assert (=> b!663747 (=> (not res!431563) (not e!380790))))

(assert (=> b!663747 (= res!431563 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!431567 () Bool)

(assert (=> start!59920 (=> (not res!431567) (not e!380790))))

(assert (=> start!59920 (= res!431567 (and (bvslt (size!19040 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19040 a!3626))))))

(assert (=> start!59920 e!380790))

(assert (=> start!59920 true))

(declare-fun array_inv!14472 (array!38967) Bool)

(assert (=> start!59920 (array_inv!14472 a!3626)))

(declare-fun b!663748 () Bool)

(assert (=> b!663748 (= e!380790 (not true))))

(declare-fun lt!309366 () Unit!23105)

(assert (=> b!663748 (= lt!309366 e!380789)))

(declare-fun c!76453 () Bool)

(assert (=> b!663748 (= c!76453 (validKeyInArray!0 (select (arr!18676 a!3626) from!3004)))))

(declare-fun lt!309370 () Unit!23105)

(assert (=> b!663748 (= lt!309370 e!380785)))

(declare-fun c!76454 () Bool)

(assert (=> b!663748 (= c!76454 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663748 (arrayContainsKey!0 (array!38968 (store (arr!18676 a!3626) i!1382 k0!2843) (size!19040 a!3626)) k0!2843 from!3004)))

(declare-fun b!663749 () Bool)

(declare-fun res!431568 () Bool)

(assert (=> b!663749 (=> (not res!431568) (not e!380790))))

(assert (=> b!663749 (= res!431568 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19040 a!3626)) (= from!3004 i!1382)))))

(assert (= (and start!59920 res!431567) b!663733))

(assert (= (and b!663733 res!431560) b!663738))

(assert (= (and b!663738 res!431569) b!663739))

(assert (= (and b!663739 res!431573) b!663742))

(assert (= (and b!663742 res!431572) b!663746))

(assert (= (and b!663742 (not res!431566)) b!663736))

(assert (= (and b!663736 res!431564) b!663745))

(assert (= (and b!663742 res!431561) b!663743))

(assert (= (and b!663743 res!431565) b!663747))

(assert (= (and b!663747 res!431563) b!663734))

(assert (= (and b!663734 res!431562) b!663732))

(assert (= (and b!663732 res!431570) b!663735))

(assert (= (and b!663735 res!431571) b!663749))

(assert (= (and b!663749 res!431568) b!663748))

(assert (= (and b!663748 c!76454) b!663740))

(assert (= (and b!663748 (not c!76454)) b!663741))

(assert (= (and b!663748 c!76453) b!663737))

(assert (= (and b!663748 (not c!76453)) b!663744))

(declare-fun m!635229 () Bool)

(assert (=> b!663733 m!635229))

(declare-fun m!635231 () Bool)

(assert (=> b!663745 m!635231))

(declare-fun m!635233 () Bool)

(assert (=> b!663740 m!635233))

(declare-fun m!635235 () Bool)

(assert (=> b!663737 m!635235))

(declare-fun m!635237 () Bool)

(assert (=> b!663737 m!635237))

(declare-fun m!635239 () Bool)

(assert (=> b!663737 m!635239))

(declare-fun m!635241 () Bool)

(assert (=> b!663737 m!635241))

(assert (=> b!663737 m!635237))

(assert (=> b!663737 m!635239))

(declare-fun m!635243 () Bool)

(assert (=> b!663737 m!635243))

(declare-fun m!635245 () Bool)

(assert (=> b!663737 m!635245))

(declare-fun m!635247 () Bool)

(assert (=> b!663738 m!635247))

(declare-fun m!635249 () Bool)

(assert (=> b!663747 m!635249))

(declare-fun m!635251 () Bool)

(assert (=> b!663743 m!635251))

(declare-fun m!635253 () Bool)

(assert (=> start!59920 m!635253))

(assert (=> b!663746 m!635231))

(declare-fun m!635255 () Bool)

(assert (=> b!663739 m!635255))

(declare-fun m!635257 () Bool)

(assert (=> b!663732 m!635257))

(assert (=> b!663748 m!635237))

(declare-fun m!635259 () Bool)

(assert (=> b!663748 m!635259))

(declare-fun m!635261 () Bool)

(assert (=> b!663748 m!635261))

(assert (=> b!663748 m!635237))

(declare-fun m!635263 () Bool)

(assert (=> b!663748 m!635263))

(declare-fun m!635265 () Bool)

(assert (=> b!663748 m!635265))

(declare-fun m!635267 () Bool)

(assert (=> b!663735 m!635267))

(check-sat (not b!663748) (not b!663733) (not b!663747) (not b!663735) (not b!663732) (not b!663737) (not b!663740) (not b!663738) (not b!663745) (not b!663739) (not b!663746) (not start!59920) (not b!663743))
