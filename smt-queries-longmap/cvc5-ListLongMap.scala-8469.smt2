; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103118 () Bool)

(assert start!103118)

(declare-fun b!1238099 () Bool)

(declare-fun res!825863 () Bool)

(declare-fun e!701726 () Bool)

(assert (=> b!1238099 (=> (not res!825863) (not e!701726))))

(declare-datatypes ((List!27341 0))(
  ( (Nil!27338) (Cons!27337 (h!28546 (_ BitVec 64)) (t!40795 List!27341)) )
))
(declare-fun acc!846 () List!27341)

(declare-fun contains!7313 (List!27341 (_ BitVec 64)) Bool)

(assert (=> b!1238099 (= res!825863 (not (contains!7313 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238100 () Bool)

(declare-fun res!825869 () Bool)

(assert (=> b!1238100 (=> (not res!825869) (not e!701726))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1238100 (= res!825869 (contains!7313 acc!846 k!2925))))

(declare-fun b!1238101 () Bool)

(declare-fun e!701724 () Bool)

(assert (=> b!1238101 (= e!701724 true)))

(declare-fun lt!561046 () Bool)

(declare-fun lt!561044 () List!27341)

(assert (=> b!1238101 (= lt!561046 (contains!7313 lt!561044 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!825862 () Bool)

(assert (=> start!103118 (=> (not res!825862) (not e!701726))))

(declare-datatypes ((array!79727 0))(
  ( (array!79728 (arr!38467 (Array (_ BitVec 32) (_ BitVec 64))) (size!39005 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79727)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103118 (= res!825862 (and (bvslt (size!39005 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39005 a!3835))))))

(assert (=> start!103118 e!701726))

(declare-fun array_inv!29450 (array!79727) Bool)

(assert (=> start!103118 (array_inv!29450 a!3835)))

(assert (=> start!103118 true))

(declare-fun b!1238102 () Bool)

(declare-fun res!825868 () Bool)

(assert (=> b!1238102 (=> (not res!825868) (not e!701726))))

(declare-fun noDuplicate!1956 (List!27341) Bool)

(assert (=> b!1238102 (= res!825868 (noDuplicate!1956 acc!846))))

(declare-fun b!1238103 () Bool)

(declare-fun res!825861 () Bool)

(assert (=> b!1238103 (=> (not res!825861) (not e!701726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238103 (= res!825861 (validKeyInArray!0 (select (arr!38467 a!3835) from!3213)))))

(declare-fun b!1238104 () Bool)

(declare-fun res!825864 () Bool)

(assert (=> b!1238104 (=> res!825864 e!701724)))

(assert (=> b!1238104 (= res!825864 (not (noDuplicate!1956 lt!561044)))))

(declare-fun b!1238105 () Bool)

(declare-fun res!825865 () Bool)

(assert (=> b!1238105 (=> res!825865 e!701724)))

(assert (=> b!1238105 (= res!825865 (contains!7313 lt!561044 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238106 () Bool)

(declare-fun res!825860 () Bool)

(assert (=> b!1238106 (=> (not res!825860) (not e!701726))))

(assert (=> b!1238106 (= res!825860 (not (= from!3213 (bvsub (size!39005 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238107 () Bool)

(assert (=> b!1238107 (= e!701726 (not e!701724))))

(declare-fun res!825867 () Bool)

(assert (=> b!1238107 (=> res!825867 e!701724)))

(assert (=> b!1238107 (= res!825867 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!595 (List!27341 List!27341) Bool)

(assert (=> b!1238107 (subseq!595 acc!846 lt!561044)))

(declare-datatypes ((Unit!40943 0))(
  ( (Unit!40944) )
))
(declare-fun lt!561047 () Unit!40943)

(declare-fun subseqTail!82 (List!27341 List!27341) Unit!40943)

(assert (=> b!1238107 (= lt!561047 (subseqTail!82 lt!561044 lt!561044))))

(assert (=> b!1238107 (subseq!595 lt!561044 lt!561044)))

(declare-fun lt!561045 () Unit!40943)

(declare-fun lemmaListSubSeqRefl!0 (List!27341) Unit!40943)

(assert (=> b!1238107 (= lt!561045 (lemmaListSubSeqRefl!0 lt!561044))))

(assert (=> b!1238107 (= lt!561044 (Cons!27337 (select (arr!38467 a!3835) from!3213) acc!846))))

(declare-fun b!1238108 () Bool)

(declare-fun res!825859 () Bool)

(assert (=> b!1238108 (=> (not res!825859) (not e!701726))))

(declare-fun arrayNoDuplicates!0 (array!79727 (_ BitVec 32) List!27341) Bool)

(assert (=> b!1238108 (= res!825859 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238109 () Bool)

(declare-fun res!825866 () Bool)

(assert (=> b!1238109 (=> (not res!825866) (not e!701726))))

(assert (=> b!1238109 (= res!825866 (not (contains!7313 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103118 res!825862) b!1238102))

(assert (= (and b!1238102 res!825868) b!1238099))

(assert (= (and b!1238099 res!825863) b!1238109))

(assert (= (and b!1238109 res!825866) b!1238108))

(assert (= (and b!1238108 res!825859) b!1238100))

(assert (= (and b!1238100 res!825869) b!1238106))

(assert (= (and b!1238106 res!825860) b!1238103))

(assert (= (and b!1238103 res!825861) b!1238107))

(assert (= (and b!1238107 (not res!825867)) b!1238104))

(assert (= (and b!1238104 (not res!825864)) b!1238105))

(assert (= (and b!1238105 (not res!825865)) b!1238101))

(declare-fun m!1141239 () Bool)

(assert (=> b!1238100 m!1141239))

(declare-fun m!1141241 () Bool)

(assert (=> b!1238104 m!1141241))

(declare-fun m!1141243 () Bool)

(assert (=> b!1238099 m!1141243))

(declare-fun m!1141245 () Bool)

(assert (=> b!1238101 m!1141245))

(declare-fun m!1141247 () Bool)

(assert (=> start!103118 m!1141247))

(declare-fun m!1141249 () Bool)

(assert (=> b!1238102 m!1141249))

(declare-fun m!1141251 () Bool)

(assert (=> b!1238103 m!1141251))

(assert (=> b!1238103 m!1141251))

(declare-fun m!1141253 () Bool)

(assert (=> b!1238103 m!1141253))

(declare-fun m!1141255 () Bool)

(assert (=> b!1238107 m!1141255))

(declare-fun m!1141257 () Bool)

(assert (=> b!1238107 m!1141257))

(declare-fun m!1141259 () Bool)

(assert (=> b!1238107 m!1141259))

(declare-fun m!1141261 () Bool)

(assert (=> b!1238107 m!1141261))

(assert (=> b!1238107 m!1141251))

(declare-fun m!1141263 () Bool)

(assert (=> b!1238108 m!1141263))

(declare-fun m!1141265 () Bool)

(assert (=> b!1238105 m!1141265))

(declare-fun m!1141267 () Bool)

(assert (=> b!1238109 m!1141267))

(push 1)

(assert (not b!1238108))

(assert (not b!1238109))

(assert (not b!1238102))

(assert (not b!1238100))

(assert (not b!1238103))

(assert (not b!1238101))

(assert (not start!103118))

(assert (not b!1238105))

(assert (not b!1238107))

(assert (not b!1238104))

(assert (not b!1238099))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

