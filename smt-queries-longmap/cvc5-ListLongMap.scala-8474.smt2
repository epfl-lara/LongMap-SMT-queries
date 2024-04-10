; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103200 () Bool)

(assert start!103200)

(declare-fun b!1238811 () Bool)

(declare-fun res!826420 () Bool)

(declare-fun e!702083 () Bool)

(assert (=> b!1238811 (=> (not res!826420) (not e!702083))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79835 0))(
  ( (array!79836 (arr!38519 (Array (_ BitVec 32) (_ BitVec 64))) (size!39055 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79835)

(assert (=> b!1238811 (= res!826420 (not (= from!3213 (bvsub (size!39055 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238812 () Bool)

(declare-datatypes ((Unit!41134 0))(
  ( (Unit!41135) )
))
(declare-fun e!702084 () Unit!41134)

(declare-fun Unit!41136 () Unit!41134)

(assert (=> b!1238812 (= e!702084 Unit!41136)))

(declare-fun res!826418 () Bool)

(assert (=> start!103200 (=> (not res!826418) (not e!702083))))

(assert (=> start!103200 (= res!826418 (and (bvslt (size!39055 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39055 a!3835))))))

(assert (=> start!103200 e!702083))

(declare-fun array_inv!29367 (array!79835) Bool)

(assert (=> start!103200 (array_inv!29367 a!3835)))

(assert (=> start!103200 true))

(declare-fun b!1238813 () Bool)

(declare-fun res!826419 () Bool)

(assert (=> b!1238813 (=> (not res!826419) (not e!702083))))

(declare-datatypes ((List!27292 0))(
  ( (Nil!27289) (Cons!27288 (h!28497 (_ BitVec 64)) (t!40755 List!27292)) )
))
(declare-fun acc!846 () List!27292)

(declare-fun contains!7354 (List!27292 (_ BitVec 64)) Bool)

(assert (=> b!1238813 (= res!826419 (not (contains!7354 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238814 () Bool)

(declare-fun res!826417 () Bool)

(assert (=> b!1238814 (=> (not res!826417) (not e!702083))))

(assert (=> b!1238814 (= res!826417 (not (contains!7354 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238815 () Bool)

(assert (=> b!1238815 (= e!702083 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39055 a!3835))))))

(declare-fun lt!561443 () Unit!41134)

(assert (=> b!1238815 (= lt!561443 e!702084)))

(declare-fun c!121057 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238815 (= c!121057 (validKeyInArray!0 (select (arr!38519 a!3835) from!3213)))))

(declare-fun b!1238816 () Bool)

(declare-fun res!826422 () Bool)

(assert (=> b!1238816 (=> (not res!826422) (not e!702083))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1238816 (= res!826422 (contains!7354 acc!846 k!2925))))

(declare-fun b!1238817 () Bool)

(declare-fun res!826421 () Bool)

(assert (=> b!1238817 (=> (not res!826421) (not e!702083))))

(declare-fun noDuplicate!1951 (List!27292) Bool)

(assert (=> b!1238817 (= res!826421 (noDuplicate!1951 acc!846))))

(declare-fun b!1238818 () Bool)

(declare-fun lt!561446 () Unit!41134)

(assert (=> b!1238818 (= e!702084 lt!561446)))

(declare-fun lt!561444 () List!27292)

(assert (=> b!1238818 (= lt!561444 (Cons!27288 (select (arr!38519 a!3835) from!3213) acc!846))))

(declare-fun lt!561442 () Unit!41134)

(declare-fun lemmaListSubSeqRefl!0 (List!27292) Unit!41134)

(assert (=> b!1238818 (= lt!561442 (lemmaListSubSeqRefl!0 lt!561444))))

(declare-fun subseq!608 (List!27292 List!27292) Bool)

(assert (=> b!1238818 (subseq!608 lt!561444 lt!561444)))

(declare-fun lt!561445 () Unit!41134)

(declare-fun subseqTail!95 (List!27292 List!27292) Unit!41134)

(assert (=> b!1238818 (= lt!561445 (subseqTail!95 lt!561444 lt!561444))))

(assert (=> b!1238818 (subseq!608 acc!846 lt!561444)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79835 List!27292 List!27292 (_ BitVec 32)) Unit!41134)

(assert (=> b!1238818 (= lt!561446 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561444 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79835 (_ BitVec 32) List!27292) Bool)

(assert (=> b!1238818 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1238819 () Bool)

(declare-fun res!826423 () Bool)

(assert (=> b!1238819 (=> (not res!826423) (not e!702083))))

(assert (=> b!1238819 (= res!826423 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!103200 res!826418) b!1238817))

(assert (= (and b!1238817 res!826421) b!1238813))

(assert (= (and b!1238813 res!826419) b!1238814))

(assert (= (and b!1238814 res!826417) b!1238819))

(assert (= (and b!1238819 res!826423) b!1238816))

(assert (= (and b!1238816 res!826422) b!1238811))

(assert (= (and b!1238811 res!826420) b!1238815))

(assert (= (and b!1238815 c!121057) b!1238818))

(assert (= (and b!1238815 (not c!121057)) b!1238812))

(declare-fun m!1142323 () Bool)

(assert (=> b!1238818 m!1142323))

(declare-fun m!1142325 () Bool)

(assert (=> b!1238818 m!1142325))

(declare-fun m!1142327 () Bool)

(assert (=> b!1238818 m!1142327))

(declare-fun m!1142329 () Bool)

(assert (=> b!1238818 m!1142329))

(declare-fun m!1142331 () Bool)

(assert (=> b!1238818 m!1142331))

(declare-fun m!1142333 () Bool)

(assert (=> b!1238818 m!1142333))

(declare-fun m!1142335 () Bool)

(assert (=> b!1238818 m!1142335))

(declare-fun m!1142337 () Bool)

(assert (=> b!1238817 m!1142337))

(declare-fun m!1142339 () Bool)

(assert (=> b!1238819 m!1142339))

(declare-fun m!1142341 () Bool)

(assert (=> start!103200 m!1142341))

(assert (=> b!1238815 m!1142329))

(assert (=> b!1238815 m!1142329))

(declare-fun m!1142343 () Bool)

(assert (=> b!1238815 m!1142343))

(declare-fun m!1142345 () Bool)

(assert (=> b!1238816 m!1142345))

(declare-fun m!1142347 () Bool)

(assert (=> b!1238814 m!1142347))

(declare-fun m!1142349 () Bool)

(assert (=> b!1238813 m!1142349))

(push 1)

(assert (not b!1238815))

(assert (not b!1238814))

(assert (not b!1238819))

(assert (not b!1238818))

(assert (not start!103200))

(assert (not b!1238813))

(assert (not b!1238817))

(assert (not b!1238816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

