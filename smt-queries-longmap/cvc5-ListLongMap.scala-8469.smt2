; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103116 () Bool)

(assert start!103116)

(declare-fun b!1238101 () Bool)

(declare-fun res!825827 () Bool)

(declare-fun e!701740 () Bool)

(assert (=> b!1238101 (=> (not res!825827) (not e!701740))))

(declare-datatypes ((List!27277 0))(
  ( (Nil!27274) (Cons!27273 (h!28482 (_ BitVec 64)) (t!40740 List!27277)) )
))
(declare-fun acc!846 () List!27277)

(declare-fun contains!7339 (List!27277 (_ BitVec 64)) Bool)

(assert (=> b!1238101 (= res!825827 (not (contains!7339 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238102 () Bool)

(declare-fun res!825826 () Bool)

(assert (=> b!1238102 (=> (not res!825826) (not e!701740))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1238102 (= res!825826 (contains!7339 acc!846 k!2925))))

(declare-fun b!1238103 () Bool)

(declare-fun res!825828 () Bool)

(assert (=> b!1238103 (=> (not res!825828) (not e!701740))))

(declare-datatypes ((array!79802 0))(
  ( (array!79803 (arr!38504 (Array (_ BitVec 32) (_ BitVec 64))) (size!39040 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79802)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79802 (_ BitVec 32) List!27277) Bool)

(assert (=> b!1238103 (= res!825828 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238104 () Bool)

(declare-fun res!825830 () Bool)

(assert (=> b!1238104 (=> (not res!825830) (not e!701740))))

(declare-fun noDuplicate!1936 (List!27277) Bool)

(assert (=> b!1238104 (= res!825830 (noDuplicate!1936 acc!846))))

(declare-fun b!1238105 () Bool)

(declare-fun e!701741 () Bool)

(assert (=> b!1238105 (= e!701741 true)))

(declare-fun lt!561196 () Bool)

(declare-fun lt!561197 () List!27277)

(assert (=> b!1238105 (= lt!561196 (contains!7339 lt!561197 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238107 () Bool)

(declare-fun res!825825 () Bool)

(assert (=> b!1238107 (=> (not res!825825) (not e!701740))))

(assert (=> b!1238107 (= res!825825 (not (contains!7339 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238108 () Bool)

(declare-fun res!825835 () Bool)

(assert (=> b!1238108 (=> (not res!825835) (not e!701740))))

(assert (=> b!1238108 (= res!825835 (not (= from!3213 (bvsub (size!39040 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238109 () Bool)

(declare-fun res!825834 () Bool)

(assert (=> b!1238109 (=> res!825834 e!701741)))

(assert (=> b!1238109 (= res!825834 (not (noDuplicate!1936 lt!561197)))))

(declare-fun b!1238110 () Bool)

(declare-fun res!825829 () Bool)

(assert (=> b!1238110 (=> res!825829 e!701741)))

(assert (=> b!1238110 (= res!825829 (contains!7339 lt!561197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238111 () Bool)

(assert (=> b!1238111 (= e!701740 (not e!701741))))

(declare-fun res!825833 () Bool)

(assert (=> b!1238111 (=> res!825833 e!701741)))

(assert (=> b!1238111 (= res!825833 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!593 (List!27277 List!27277) Bool)

(assert (=> b!1238111 (subseq!593 acc!846 lt!561197)))

(declare-datatypes ((Unit!41094 0))(
  ( (Unit!41095) )
))
(declare-fun lt!561194 () Unit!41094)

(declare-fun subseqTail!80 (List!27277 List!27277) Unit!41094)

(assert (=> b!1238111 (= lt!561194 (subseqTail!80 lt!561197 lt!561197))))

(assert (=> b!1238111 (subseq!593 lt!561197 lt!561197)))

(declare-fun lt!561195 () Unit!41094)

(declare-fun lemmaListSubSeqRefl!0 (List!27277) Unit!41094)

(assert (=> b!1238111 (= lt!561195 (lemmaListSubSeqRefl!0 lt!561197))))

(assert (=> b!1238111 (= lt!561197 (Cons!27273 (select (arr!38504 a!3835) from!3213) acc!846))))

(declare-fun b!1238106 () Bool)

(declare-fun res!825831 () Bool)

(assert (=> b!1238106 (=> (not res!825831) (not e!701740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238106 (= res!825831 (validKeyInArray!0 (select (arr!38504 a!3835) from!3213)))))

(declare-fun res!825832 () Bool)

(assert (=> start!103116 (=> (not res!825832) (not e!701740))))

(assert (=> start!103116 (= res!825832 (and (bvslt (size!39040 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39040 a!3835))))))

(assert (=> start!103116 e!701740))

(declare-fun array_inv!29352 (array!79802) Bool)

(assert (=> start!103116 (array_inv!29352 a!3835)))

(assert (=> start!103116 true))

(assert (= (and start!103116 res!825832) b!1238104))

(assert (= (and b!1238104 res!825830) b!1238107))

(assert (= (and b!1238107 res!825825) b!1238101))

(assert (= (and b!1238101 res!825827) b!1238103))

(assert (= (and b!1238103 res!825828) b!1238102))

(assert (= (and b!1238102 res!825826) b!1238108))

(assert (= (and b!1238108 res!825835) b!1238106))

(assert (= (and b!1238106 res!825831) b!1238111))

(assert (= (and b!1238111 (not res!825833)) b!1238109))

(assert (= (and b!1238109 (not res!825834)) b!1238110))

(assert (= (and b!1238110 (not res!825829)) b!1238105))

(declare-fun m!1141675 () Bool)

(assert (=> b!1238109 m!1141675))

(declare-fun m!1141677 () Bool)

(assert (=> b!1238104 m!1141677))

(declare-fun m!1141679 () Bool)

(assert (=> b!1238110 m!1141679))

(declare-fun m!1141681 () Bool)

(assert (=> b!1238111 m!1141681))

(declare-fun m!1141683 () Bool)

(assert (=> b!1238111 m!1141683))

(declare-fun m!1141685 () Bool)

(assert (=> b!1238111 m!1141685))

(declare-fun m!1141687 () Bool)

(assert (=> b!1238111 m!1141687))

(declare-fun m!1141689 () Bool)

(assert (=> b!1238111 m!1141689))

(assert (=> b!1238106 m!1141689))

(assert (=> b!1238106 m!1141689))

(declare-fun m!1141691 () Bool)

(assert (=> b!1238106 m!1141691))

(declare-fun m!1141693 () Bool)

(assert (=> b!1238103 m!1141693))

(declare-fun m!1141695 () Bool)

(assert (=> b!1238107 m!1141695))

(declare-fun m!1141697 () Bool)

(assert (=> start!103116 m!1141697))

(declare-fun m!1141699 () Bool)

(assert (=> b!1238105 m!1141699))

(declare-fun m!1141701 () Bool)

(assert (=> b!1238102 m!1141701))

(declare-fun m!1141703 () Bool)

(assert (=> b!1238101 m!1141703))

(push 1)

(assert (not b!1238110))

(assert (not b!1238103))

(assert (not b!1238111))

(assert (not b!1238106))

(assert (not start!103116))

(assert (not b!1238105))

(assert (not b!1238109))

(assert (not b!1238102))

(assert (not b!1238104))

(assert (not b!1238101))

(assert (not b!1238107))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

