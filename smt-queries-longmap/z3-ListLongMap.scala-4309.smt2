; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59940 () Bool)

(assert start!59940)

(declare-fun b!662794 () Bool)

(declare-fun res!430671 () Bool)

(declare-fun e!380493 () Bool)

(assert (=> b!662794 (=> (not res!430671) (not e!380493))))

(declare-datatypes ((List!12600 0))(
  ( (Nil!12597) (Cons!12596 (h!13644 (_ BitVec 64)) (t!18820 List!12600)) )
))
(declare-fun acc!681 () List!12600)

(declare-fun noDuplicate!526 (List!12600) Bool)

(assert (=> b!662794 (= res!430671 (noDuplicate!526 acc!681))))

(declare-fun b!662795 () Bool)

(declare-fun e!380498 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3252 (List!12600 (_ BitVec 64)) Bool)

(assert (=> b!662795 (= e!380498 (contains!3252 acc!681 k0!2843))))

(declare-fun b!662796 () Bool)

(declare-fun res!430675 () Bool)

(assert (=> b!662796 (=> (not res!430675) (not e!380493))))

(assert (=> b!662796 (= res!430675 (not (contains!3252 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662797 () Bool)

(declare-fun res!430679 () Bool)

(declare-fun e!380499 () Bool)

(assert (=> b!662797 (=> res!430679 e!380499)))

(declare-fun lt!309151 () List!12600)

(assert (=> b!662797 (= res!430679 (contains!3252 lt!309151 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662798 () Bool)

(declare-fun e!380496 () Bool)

(assert (=> b!662798 (= e!380496 e!380499)))

(declare-fun res!430681 () Bool)

(assert (=> b!662798 (=> res!430681 e!380499)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!662798 (= res!430681 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!38925 0))(
  ( (array!38926 (arr!18652 (Array (_ BitVec 32) (_ BitVec 64))) (size!19016 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38925)

(declare-fun $colon$colon!143 (List!12600 (_ BitVec 64)) List!12600)

(assert (=> b!662798 (= lt!309151 ($colon$colon!143 acc!681 (select (arr!18652 a!3626) from!3004)))))

(declare-fun subseq!14 (List!12600 List!12600) Bool)

(assert (=> b!662798 (subseq!14 acc!681 acc!681)))

(declare-datatypes ((Unit!23001 0))(
  ( (Unit!23002) )
))
(declare-fun lt!309153 () Unit!23001)

(declare-fun lemmaListSubSeqRefl!0 (List!12600) Unit!23001)

(assert (=> b!662798 (= lt!309153 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662799 () Bool)

(declare-fun res!430685 () Bool)

(assert (=> b!662799 (=> (not res!430685) (not e!380493))))

(assert (=> b!662799 (= res!430685 (not (contains!3252 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662801 () Bool)

(declare-fun res!430682 () Bool)

(assert (=> b!662801 (=> (not res!430682) (not e!380493))))

(declare-fun arrayNoDuplicates!0 (array!38925 (_ BitVec 32) List!12600) Bool)

(assert (=> b!662801 (= res!430682 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662802 () Bool)

(declare-fun e!380497 () Unit!23001)

(declare-fun Unit!23003 () Unit!23001)

(assert (=> b!662802 (= e!380497 Unit!23003)))

(declare-fun lt!309150 () Unit!23001)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38925 (_ BitVec 64) (_ BitVec 32)) Unit!23001)

(assert (=> b!662802 (= lt!309150 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!662802 false))

(declare-fun b!662803 () Bool)

(declare-fun res!430683 () Bool)

(assert (=> b!662803 (=> (not res!430683) (not e!380493))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!662803 (= res!430683 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19016 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662804 () Bool)

(declare-fun res!430684 () Bool)

(assert (=> b!662804 (=> (not res!430684) (not e!380493))))

(declare-fun arrayContainsKey!0 (array!38925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662804 (= res!430684 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662805 () Bool)

(declare-fun res!430688 () Bool)

(assert (=> b!662805 (=> (not res!430688) (not e!380493))))

(assert (=> b!662805 (= res!430688 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19016 a!3626))))))

(declare-fun b!662806 () Bool)

(declare-fun res!430672 () Bool)

(assert (=> b!662806 (=> (not res!430672) (not e!380493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662806 (= res!430672 (validKeyInArray!0 k0!2843))))

(declare-fun b!662807 () Bool)

(declare-fun Unit!23004 () Unit!23001)

(assert (=> b!662807 (= e!380497 Unit!23004)))

(declare-fun b!662808 () Bool)

(declare-fun res!430677 () Bool)

(assert (=> b!662808 (=> res!430677 e!380499)))

(assert (=> b!662808 (= res!430677 (contains!3252 lt!309151 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662809 () Bool)

(assert (=> b!662809 (= e!380493 (not e!380496))))

(declare-fun res!430690 () Bool)

(assert (=> b!662809 (=> res!430690 e!380496)))

(assert (=> b!662809 (= res!430690 (not (validKeyInArray!0 (select (arr!18652 a!3626) from!3004))))))

(declare-fun lt!309149 () Unit!23001)

(assert (=> b!662809 (= lt!309149 e!380497)))

(declare-fun c!76430 () Bool)

(assert (=> b!662809 (= c!76430 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662809 (arrayContainsKey!0 (array!38926 (store (arr!18652 a!3626) i!1382 k0!2843) (size!19016 a!3626)) k0!2843 from!3004)))

(declare-fun b!662810 () Bool)

(declare-fun res!430686 () Bool)

(assert (=> b!662810 (=> res!430686 e!380499)))

(assert (=> b!662810 (= res!430686 (not (noDuplicate!526 lt!309151)))))

(declare-fun b!662811 () Bool)

(assert (=> b!662811 (= e!380499 true)))

(declare-fun lt!309154 () Bool)

(assert (=> b!662811 (= lt!309154 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309151))))

(declare-fun lt!309152 () Unit!23001)

(declare-fun noDuplicateSubseq!14 (List!12600 List!12600) Unit!23001)

(assert (=> b!662811 (= lt!309152 (noDuplicateSubseq!14 acc!681 lt!309151))))

(declare-fun res!430674 () Bool)

(assert (=> start!59940 (=> (not res!430674) (not e!380493))))

(assert (=> start!59940 (= res!430674 (and (bvslt (size!19016 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19016 a!3626))))))

(assert (=> start!59940 e!380493))

(assert (=> start!59940 true))

(declare-fun array_inv!14511 (array!38925) Bool)

(assert (=> start!59940 (array_inv!14511 a!3626)))

(declare-fun b!662800 () Bool)

(declare-fun e!380492 () Bool)

(assert (=> b!662800 (= e!380492 (not (contains!3252 acc!681 k0!2843)))))

(declare-fun b!662812 () Bool)

(declare-fun res!430678 () Bool)

(assert (=> b!662812 (=> (not res!430678) (not e!380493))))

(declare-fun e!380495 () Bool)

(assert (=> b!662812 (= res!430678 e!380495)))

(declare-fun res!430673 () Bool)

(assert (=> b!662812 (=> res!430673 e!380495)))

(assert (=> b!662812 (= res!430673 e!380498)))

(declare-fun res!430680 () Bool)

(assert (=> b!662812 (=> (not res!430680) (not e!380498))))

(assert (=> b!662812 (= res!430680 (bvsgt from!3004 i!1382))))

(declare-fun b!662813 () Bool)

(declare-fun res!430689 () Bool)

(assert (=> b!662813 (=> res!430689 e!380499)))

(assert (=> b!662813 (= res!430689 (not (subseq!14 acc!681 lt!309151)))))

(declare-fun b!662814 () Bool)

(declare-fun res!430687 () Bool)

(assert (=> b!662814 (=> (not res!430687) (not e!380493))))

(assert (=> b!662814 (= res!430687 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12597))))

(declare-fun b!662815 () Bool)

(assert (=> b!662815 (= e!380495 e!380492)))

(declare-fun res!430676 () Bool)

(assert (=> b!662815 (=> (not res!430676) (not e!380492))))

(assert (=> b!662815 (= res!430676 (bvsle from!3004 i!1382))))

(assert (= (and start!59940 res!430674) b!662794))

(assert (= (and b!662794 res!430671) b!662799))

(assert (= (and b!662799 res!430685) b!662796))

(assert (= (and b!662796 res!430675) b!662812))

(assert (= (and b!662812 res!430680) b!662795))

(assert (= (and b!662812 (not res!430673)) b!662815))

(assert (= (and b!662815 res!430676) b!662800))

(assert (= (and b!662812 res!430678) b!662814))

(assert (= (and b!662814 res!430687) b!662801))

(assert (= (and b!662801 res!430682) b!662805))

(assert (= (and b!662805 res!430688) b!662806))

(assert (= (and b!662806 res!430672) b!662804))

(assert (= (and b!662804 res!430684) b!662803))

(assert (= (and b!662803 res!430683) b!662809))

(assert (= (and b!662809 c!76430) b!662802))

(assert (= (and b!662809 (not c!76430)) b!662807))

(assert (= (and b!662809 (not res!430690)) b!662798))

(assert (= (and b!662798 (not res!430681)) b!662810))

(assert (= (and b!662810 (not res!430686)) b!662797))

(assert (= (and b!662797 (not res!430679)) b!662808))

(assert (= (and b!662808 (not res!430677)) b!662813))

(assert (= (and b!662813 (not res!430689)) b!662811))

(declare-fun m!635071 () Bool)

(assert (=> b!662811 m!635071))

(declare-fun m!635073 () Bool)

(assert (=> b!662811 m!635073))

(declare-fun m!635075 () Bool)

(assert (=> b!662794 m!635075))

(declare-fun m!635077 () Bool)

(assert (=> b!662813 m!635077))

(declare-fun m!635079 () Bool)

(assert (=> b!662814 m!635079))

(declare-fun m!635081 () Bool)

(assert (=> b!662810 m!635081))

(declare-fun m!635083 () Bool)

(assert (=> b!662801 m!635083))

(declare-fun m!635085 () Bool)

(assert (=> b!662809 m!635085))

(declare-fun m!635087 () Bool)

(assert (=> b!662809 m!635087))

(declare-fun m!635089 () Bool)

(assert (=> b!662809 m!635089))

(assert (=> b!662809 m!635085))

(declare-fun m!635091 () Bool)

(assert (=> b!662809 m!635091))

(declare-fun m!635093 () Bool)

(assert (=> b!662809 m!635093))

(declare-fun m!635095 () Bool)

(assert (=> b!662804 m!635095))

(declare-fun m!635097 () Bool)

(assert (=> b!662795 m!635097))

(assert (=> b!662798 m!635085))

(assert (=> b!662798 m!635085))

(declare-fun m!635099 () Bool)

(assert (=> b!662798 m!635099))

(declare-fun m!635101 () Bool)

(assert (=> b!662798 m!635101))

(declare-fun m!635103 () Bool)

(assert (=> b!662798 m!635103))

(declare-fun m!635105 () Bool)

(assert (=> b!662797 m!635105))

(declare-fun m!635107 () Bool)

(assert (=> b!662808 m!635107))

(declare-fun m!635109 () Bool)

(assert (=> b!662806 m!635109))

(assert (=> b!662800 m!635097))

(declare-fun m!635111 () Bool)

(assert (=> b!662799 m!635111))

(declare-fun m!635113 () Bool)

(assert (=> b!662796 m!635113))

(declare-fun m!635115 () Bool)

(assert (=> start!59940 m!635115))

(declare-fun m!635117 () Bool)

(assert (=> b!662802 m!635117))

(check-sat (not b!662799) (not b!662796) (not b!662800) (not b!662809) (not b!662813) (not b!662797) (not b!662795) (not b!662798) (not b!662801) (not b!662794) (not b!662814) (not b!662804) (not b!662808) (not b!662810) (not b!662811) (not b!662802) (not b!662806) (not start!59940))
(check-sat)
