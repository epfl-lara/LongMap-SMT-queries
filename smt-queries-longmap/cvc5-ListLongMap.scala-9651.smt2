; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114044 () Bool)

(assert start!114044)

(declare-fun b!1353610 () Bool)

(declare-fun e!769179 () Bool)

(declare-fun e!769180 () Bool)

(assert (=> b!1353610 (= e!769179 e!769180)))

(declare-fun res!898788 () Bool)

(assert (=> b!1353610 (=> (not res!898788) (not e!769180))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!597944 () Bool)

(assert (=> b!1353610 (= res!898788 (and (not (= from!3120 i!1404)) lt!597944))))

(declare-datatypes ((Unit!44424 0))(
  ( (Unit!44425) )
))
(declare-fun lt!597943 () Unit!44424)

(declare-fun e!769178 () Unit!44424)

(assert (=> b!1353610 (= lt!597943 e!769178)))

(declare-fun c!126857 () Bool)

(assert (=> b!1353610 (= c!126857 lt!597944)))

(declare-datatypes ((array!92226 0))(
  ( (array!92227 (arr!44561 (Array (_ BitVec 32) (_ BitVec 64))) (size!45111 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92226)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353610 (= lt!597944 (validKeyInArray!0 (select (arr!44561 a!3742) from!3120)))))

(declare-fun b!1353611 () Bool)

(declare-fun res!898784 () Bool)

(assert (=> b!1353611 (=> (not res!898784) (not e!769179))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1353611 (= res!898784 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353612 () Bool)

(declare-fun res!898777 () Bool)

(declare-fun e!769177 () Bool)

(assert (=> b!1353612 (=> (not res!898777) (not e!769177))))

(declare-datatypes ((List!31602 0))(
  ( (Nil!31599) (Cons!31598 (h!32807 (_ BitVec 64)) (t!46260 List!31602)) )
))
(declare-fun lt!597946 () List!31602)

(declare-fun contains!9311 (List!31602 (_ BitVec 64)) Bool)

(assert (=> b!1353612 (= res!898777 (not (contains!9311 lt!597946 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353613 () Bool)

(declare-fun res!898781 () Bool)

(assert (=> b!1353613 (=> (not res!898781) (not e!769179))))

(declare-fun acc!759 () List!31602)

(declare-fun arrayNoDuplicates!0 (array!92226 (_ BitVec 32) List!31602) Bool)

(assert (=> b!1353613 (= res!898781 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353614 () Bool)

(declare-fun Unit!44426 () Unit!44424)

(assert (=> b!1353614 (= e!769178 Unit!44426)))

(declare-fun b!1353615 () Bool)

(declare-fun res!898783 () Bool)

(assert (=> b!1353615 (=> (not res!898783) (not e!769179))))

(assert (=> b!1353615 (= res!898783 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45111 a!3742))))))

(declare-fun res!898782 () Bool)

(assert (=> start!114044 (=> (not res!898782) (not e!769179))))

(assert (=> start!114044 (= res!898782 (and (bvslt (size!45111 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45111 a!3742))))))

(assert (=> start!114044 e!769179))

(assert (=> start!114044 true))

(declare-fun array_inv!33589 (array!92226) Bool)

(assert (=> start!114044 (array_inv!33589 a!3742)))

(declare-fun b!1353616 () Bool)

(declare-fun res!898787 () Bool)

(assert (=> b!1353616 (=> (not res!898787) (not e!769177))))

(declare-fun noDuplicate!2168 (List!31602) Bool)

(assert (=> b!1353616 (= res!898787 (noDuplicate!2168 lt!597946))))

(declare-fun b!1353617 () Bool)

(declare-fun res!898780 () Bool)

(assert (=> b!1353617 (=> (not res!898780) (not e!769179))))

(assert (=> b!1353617 (= res!898780 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31599))))

(declare-fun b!1353618 () Bool)

(declare-fun res!898776 () Bool)

(assert (=> b!1353618 (=> (not res!898776) (not e!769179))))

(assert (=> b!1353618 (= res!898776 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45111 a!3742)))))

(declare-fun b!1353619 () Bool)

(declare-fun res!898785 () Bool)

(assert (=> b!1353619 (=> (not res!898785) (not e!769179))))

(assert (=> b!1353619 (= res!898785 (not (contains!9311 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353620 () Bool)

(declare-fun res!898779 () Bool)

(assert (=> b!1353620 (=> (not res!898779) (not e!769177))))

(assert (=> b!1353620 (= res!898779 (not (contains!9311 lt!597946 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353621 () Bool)

(declare-fun res!898786 () Bool)

(assert (=> b!1353621 (=> (not res!898786) (not e!769179))))

(assert (=> b!1353621 (= res!898786 (not (contains!9311 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353622 () Bool)

(assert (=> b!1353622 (= e!769177 false)))

(declare-fun lt!597941 () Bool)

(assert (=> b!1353622 (= lt!597941 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597946))))

(declare-fun b!1353623 () Bool)

(declare-fun res!898789 () Bool)

(assert (=> b!1353623 (=> (not res!898789) (not e!769179))))

(assert (=> b!1353623 (= res!898789 (noDuplicate!2168 acc!759))))

(declare-fun b!1353624 () Bool)

(assert (=> b!1353624 (= e!769180 e!769177)))

(declare-fun res!898778 () Bool)

(assert (=> b!1353624 (=> (not res!898778) (not e!769177))))

(assert (=> b!1353624 (= res!898778 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!746 (List!31602 (_ BitVec 64)) List!31602)

(assert (=> b!1353624 (= lt!597946 ($colon$colon!746 acc!759 (select (arr!44561 a!3742) from!3120)))))

(declare-fun b!1353625 () Bool)

(declare-fun lt!597942 () Unit!44424)

(assert (=> b!1353625 (= e!769178 lt!597942)))

(declare-fun lt!597945 () Unit!44424)

(declare-fun lemmaListSubSeqRefl!0 (List!31602) Unit!44424)

(assert (=> b!1353625 (= lt!597945 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!731 (List!31602 List!31602) Bool)

(assert (=> b!1353625 (subseq!731 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92226 List!31602 List!31602 (_ BitVec 32)) Unit!44424)

(assert (=> b!1353625 (= lt!597942 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!746 acc!759 (select (arr!44561 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353625 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114044 res!898782) b!1353623))

(assert (= (and b!1353623 res!898789) b!1353621))

(assert (= (and b!1353621 res!898786) b!1353619))

(assert (= (and b!1353619 res!898785) b!1353617))

(assert (= (and b!1353617 res!898780) b!1353613))

(assert (= (and b!1353613 res!898781) b!1353615))

(assert (= (and b!1353615 res!898783) b!1353611))

(assert (= (and b!1353611 res!898784) b!1353618))

(assert (= (and b!1353618 res!898776) b!1353610))

(assert (= (and b!1353610 c!126857) b!1353625))

(assert (= (and b!1353610 (not c!126857)) b!1353614))

(assert (= (and b!1353610 res!898788) b!1353624))

(assert (= (and b!1353624 res!898778) b!1353616))

(assert (= (and b!1353616 res!898787) b!1353612))

(assert (= (and b!1353612 res!898777) b!1353620))

(assert (= (and b!1353620 res!898779) b!1353622))

(declare-fun m!1240189 () Bool)

(assert (=> b!1353622 m!1240189))

(declare-fun m!1240191 () Bool)

(assert (=> b!1353619 m!1240191))

(declare-fun m!1240193 () Bool)

(assert (=> b!1353610 m!1240193))

(assert (=> b!1353610 m!1240193))

(declare-fun m!1240195 () Bool)

(assert (=> b!1353610 m!1240195))

(declare-fun m!1240197 () Bool)

(assert (=> b!1353611 m!1240197))

(declare-fun m!1240199 () Bool)

(assert (=> b!1353616 m!1240199))

(declare-fun m!1240201 () Bool)

(assert (=> b!1353625 m!1240201))

(assert (=> b!1353625 m!1240193))

(declare-fun m!1240203 () Bool)

(assert (=> b!1353625 m!1240203))

(declare-fun m!1240205 () Bool)

(assert (=> b!1353625 m!1240205))

(declare-fun m!1240207 () Bool)

(assert (=> b!1353625 m!1240207))

(assert (=> b!1353625 m!1240193))

(assert (=> b!1353625 m!1240203))

(declare-fun m!1240209 () Bool)

(assert (=> b!1353625 m!1240209))

(assert (=> b!1353624 m!1240193))

(assert (=> b!1353624 m!1240193))

(assert (=> b!1353624 m!1240203))

(declare-fun m!1240211 () Bool)

(assert (=> b!1353617 m!1240211))

(declare-fun m!1240213 () Bool)

(assert (=> b!1353621 m!1240213))

(declare-fun m!1240215 () Bool)

(assert (=> b!1353612 m!1240215))

(declare-fun m!1240217 () Bool)

(assert (=> start!114044 m!1240217))

(declare-fun m!1240219 () Bool)

(assert (=> b!1353613 m!1240219))

(declare-fun m!1240221 () Bool)

(assert (=> b!1353623 m!1240221))

(declare-fun m!1240223 () Bool)

(assert (=> b!1353620 m!1240223))

(push 1)

