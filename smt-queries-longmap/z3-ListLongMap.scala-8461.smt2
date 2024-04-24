; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103138 () Bool)

(assert start!103138)

(declare-fun b!1238021 () Bool)

(declare-fun res!825217 () Bool)

(declare-fun e!701773 () Bool)

(assert (=> b!1238021 (=> (not res!825217) (not e!701773))))

(declare-datatypes ((array!79781 0))(
  ( (array!79782 (arr!38492 (Array (_ BitVec 32) (_ BitVec 64))) (size!39029 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79781)

(declare-datatypes ((List!27278 0))(
  ( (Nil!27275) (Cons!27274 (h!28492 (_ BitVec 64)) (t!40733 List!27278)) )
))
(declare-fun acc!846 () List!27278)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79781 (_ BitVec 32) List!27278) Bool)

(assert (=> b!1238021 (= res!825217 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238022 () Bool)

(declare-fun res!825215 () Bool)

(assert (=> b!1238022 (=> (not res!825215) (not e!701773))))

(declare-fun noDuplicate!1930 (List!27278) Bool)

(assert (=> b!1238022 (= res!825215 (noDuplicate!1930 acc!846))))

(declare-fun b!1238023 () Bool)

(assert (=> b!1238023 (= e!701773 (not true))))

(declare-datatypes ((Unit!40997 0))(
  ( (Unit!40998) )
))
(declare-fun lt!561341 () Unit!40997)

(declare-fun lt!561339 () List!27278)

(declare-fun subseqTail!56 (List!27278 List!27278) Unit!40997)

(assert (=> b!1238023 (= lt!561341 (subseqTail!56 lt!561339 lt!561339))))

(declare-fun subseq!569 (List!27278 List!27278) Bool)

(assert (=> b!1238023 (subseq!569 lt!561339 lt!561339)))

(declare-fun lt!561340 () Unit!40997)

(declare-fun lemmaListSubSeqRefl!0 (List!27278) Unit!40997)

(assert (=> b!1238023 (= lt!561340 (lemmaListSubSeqRefl!0 lt!561339))))

(assert (=> b!1238023 (= lt!561339 (Cons!27274 (select (arr!38492 a!3835) from!3213) acc!846))))

(declare-fun b!1238024 () Bool)

(declare-fun res!825214 () Bool)

(assert (=> b!1238024 (=> (not res!825214) (not e!701773))))

(assert (=> b!1238024 (= res!825214 (not (= from!3213 (bvsub (size!39029 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238025 () Bool)

(declare-fun res!825213 () Bool)

(assert (=> b!1238025 (=> (not res!825213) (not e!701773))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7349 (List!27278 (_ BitVec 64)) Bool)

(assert (=> b!1238025 (= res!825213 (contains!7349 acc!846 k0!2925))))

(declare-fun b!1238026 () Bool)

(declare-fun res!825218 () Bool)

(assert (=> b!1238026 (=> (not res!825218) (not e!701773))))

(assert (=> b!1238026 (= res!825218 (not (contains!7349 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238027 () Bool)

(declare-fun res!825212 () Bool)

(assert (=> b!1238027 (=> (not res!825212) (not e!701773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238027 (= res!825212 (validKeyInArray!0 (select (arr!38492 a!3835) from!3213)))))

(declare-fun res!825216 () Bool)

(assert (=> start!103138 (=> (not res!825216) (not e!701773))))

(assert (=> start!103138 (= res!825216 (and (bvslt (size!39029 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39029 a!3835))))))

(assert (=> start!103138 e!701773))

(declare-fun array_inv!29430 (array!79781) Bool)

(assert (=> start!103138 (array_inv!29430 a!3835)))

(assert (=> start!103138 true))

(declare-fun b!1238028 () Bool)

(declare-fun res!825219 () Bool)

(assert (=> b!1238028 (=> (not res!825219) (not e!701773))))

(assert (=> b!1238028 (= res!825219 (not (contains!7349 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103138 res!825216) b!1238022))

(assert (= (and b!1238022 res!825215) b!1238026))

(assert (= (and b!1238026 res!825218) b!1238028))

(assert (= (and b!1238028 res!825219) b!1238021))

(assert (= (and b!1238021 res!825217) b!1238025))

(assert (= (and b!1238025 res!825213) b!1238024))

(assert (= (and b!1238024 res!825214) b!1238027))

(assert (= (and b!1238027 res!825212) b!1238023))

(declare-fun m!1142099 () Bool)

(assert (=> b!1238021 m!1142099))

(declare-fun m!1142101 () Bool)

(assert (=> b!1238023 m!1142101))

(declare-fun m!1142103 () Bool)

(assert (=> b!1238023 m!1142103))

(declare-fun m!1142105 () Bool)

(assert (=> b!1238023 m!1142105))

(declare-fun m!1142107 () Bool)

(assert (=> b!1238023 m!1142107))

(declare-fun m!1142109 () Bool)

(assert (=> b!1238026 m!1142109))

(declare-fun m!1142111 () Bool)

(assert (=> b!1238028 m!1142111))

(assert (=> b!1238027 m!1142107))

(assert (=> b!1238027 m!1142107))

(declare-fun m!1142113 () Bool)

(assert (=> b!1238027 m!1142113))

(declare-fun m!1142115 () Bool)

(assert (=> b!1238022 m!1142115))

(declare-fun m!1142117 () Bool)

(assert (=> start!103138 m!1142117))

(declare-fun m!1142119 () Bool)

(assert (=> b!1238025 m!1142119))

(check-sat (not b!1238026) (not b!1238022) (not b!1238023) (not b!1238021) (not b!1238028) (not start!103138) (not b!1238025) (not b!1238027))
(check-sat)
