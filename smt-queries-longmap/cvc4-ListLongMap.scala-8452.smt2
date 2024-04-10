; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102850 () Bool)

(assert start!102850)

(declare-fun b!1236247 () Bool)

(declare-datatypes ((Unit!41009 0))(
  ( (Unit!41010) )
))
(declare-fun e!700760 () Unit!41009)

(declare-fun lt!560764 () Unit!41009)

(assert (=> b!1236247 (= e!700760 lt!560764)))

(declare-datatypes ((array!79695 0))(
  ( (array!79696 (arr!38455 (Array (_ BitVec 32) (_ BitVec 64))) (size!38991 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79695)

(declare-datatypes ((List!27228 0))(
  ( (Nil!27225) (Cons!27224 (h!28433 (_ BitVec 64)) (t!40691 List!27228)) )
))
(declare-fun acc!846 () List!27228)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun lt!560765 () List!27228)

(assert (=> b!1236247 (= lt!560765 (Cons!27224 (select (arr!38455 a!3835) from!3213) acc!846))))

(declare-fun lt!560763 () Unit!41009)

(declare-fun lemmaListSubSeqRefl!0 (List!27228) Unit!41009)

(assert (=> b!1236247 (= lt!560763 (lemmaListSubSeqRefl!0 lt!560765))))

(declare-fun subseq!562 (List!27228 List!27228) Bool)

(assert (=> b!1236247 (subseq!562 lt!560765 lt!560765)))

(declare-fun lt!560761 () Unit!41009)

(declare-fun subseqTail!55 (List!27228 List!27228) Unit!41009)

(assert (=> b!1236247 (= lt!560761 (subseqTail!55 lt!560765 lt!560765))))

(assert (=> b!1236247 (subseq!562 acc!846 lt!560765)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79695 List!27228 List!27228 (_ BitVec 32)) Unit!41009)

(assert (=> b!1236247 (= lt!560764 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560765 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79695 (_ BitVec 32) List!27228) Bool)

(assert (=> b!1236247 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1236248 () Bool)

(declare-fun Unit!41011 () Unit!41009)

(assert (=> b!1236248 (= e!700760 Unit!41011)))

(declare-fun b!1236249 () Bool)

(declare-fun res!824234 () Bool)

(declare-fun e!700761 () Bool)

(assert (=> b!1236249 (=> (not res!824234) (not e!700761))))

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7290 (List!27228 (_ BitVec 64)) Bool)

(assert (=> b!1236249 (= res!824234 (contains!7290 acc!846 k!2925))))

(declare-fun b!1236250 () Bool)

(declare-fun res!824235 () Bool)

(declare-fun e!700758 () Bool)

(assert (=> b!1236250 (=> (not res!824235) (not e!700758))))

(assert (=> b!1236250 (= res!824235 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1236251 () Bool)

(declare-fun res!824233 () Bool)

(assert (=> b!1236251 (=> (not res!824233) (not e!700761))))

(assert (=> b!1236251 (= res!824233 (not (contains!7290 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236252 () Bool)

(assert (=> b!1236252 (= e!700758 (not true))))

(declare-fun arrayContainsKey!0 (array!79695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1236252 (not (arrayContainsKey!0 a!3835 k!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!560760 () Unit!41009)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79695 (_ BitVec 32) (_ BitVec 64) List!27228) Unit!41009)

(assert (=> b!1236252 (= lt!560760 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k!2925 acc!846))))

(declare-fun b!1236253 () Bool)

(declare-fun res!824237 () Bool)

(assert (=> b!1236253 (=> (not res!824237) (not e!700761))))

(assert (=> b!1236253 (= res!824237 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236254 () Bool)

(declare-fun res!824236 () Bool)

(assert (=> b!1236254 (=> (not res!824236) (not e!700761))))

(assert (=> b!1236254 (= res!824236 (not (= from!3213 (bvsub (size!38991 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!824239 () Bool)

(assert (=> start!102850 (=> (not res!824239) (not e!700761))))

(assert (=> start!102850 (= res!824239 (and (bvslt (size!38991 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38991 a!3835))))))

(assert (=> start!102850 e!700761))

(declare-fun array_inv!29303 (array!79695) Bool)

(assert (=> start!102850 (array_inv!29303 a!3835)))

(assert (=> start!102850 true))

(declare-fun b!1236255 () Bool)

(assert (=> b!1236255 (= e!700761 e!700758)))

(declare-fun res!824232 () Bool)

(assert (=> b!1236255 (=> (not res!824232) (not e!700758))))

(assert (=> b!1236255 (= res!824232 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38991 a!3835))))))

(declare-fun lt!560762 () Unit!41009)

(assert (=> b!1236255 (= lt!560762 e!700760)))

(declare-fun c!120868 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236255 (= c!120868 (validKeyInArray!0 (select (arr!38455 a!3835) from!3213)))))

(declare-fun b!1236256 () Bool)

(declare-fun res!824231 () Bool)

(assert (=> b!1236256 (=> (not res!824231) (not e!700761))))

(declare-fun noDuplicate!1887 (List!27228) Bool)

(assert (=> b!1236256 (= res!824231 (noDuplicate!1887 acc!846))))

(declare-fun b!1236257 () Bool)

(declare-fun res!824238 () Bool)

(assert (=> b!1236257 (=> (not res!824238) (not e!700761))))

(assert (=> b!1236257 (= res!824238 (not (contains!7290 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102850 res!824239) b!1236256))

(assert (= (and b!1236256 res!824231) b!1236257))

(assert (= (and b!1236257 res!824238) b!1236251))

(assert (= (and b!1236251 res!824233) b!1236253))

(assert (= (and b!1236253 res!824237) b!1236249))

(assert (= (and b!1236249 res!824234) b!1236254))

(assert (= (and b!1236254 res!824236) b!1236255))

(assert (= (and b!1236255 c!120868) b!1236247))

(assert (= (and b!1236255 (not c!120868)) b!1236248))

(assert (= (and b!1236255 res!824232) b!1236250))

(assert (= (and b!1236250 res!824235) b!1236252))

(declare-fun m!1140083 () Bool)

(assert (=> b!1236256 m!1140083))

(declare-fun m!1140085 () Bool)

(assert (=> b!1236250 m!1140085))

(declare-fun m!1140087 () Bool)

(assert (=> b!1236253 m!1140087))

(declare-fun m!1140089 () Bool)

(assert (=> b!1236252 m!1140089))

(declare-fun m!1140091 () Bool)

(assert (=> b!1236252 m!1140091))

(declare-fun m!1140093 () Bool)

(assert (=> b!1236247 m!1140093))

(declare-fun m!1140095 () Bool)

(assert (=> b!1236247 m!1140095))

(declare-fun m!1140097 () Bool)

(assert (=> b!1236247 m!1140097))

(declare-fun m!1140099 () Bool)

(assert (=> b!1236247 m!1140099))

(assert (=> b!1236247 m!1140085))

(declare-fun m!1140101 () Bool)

(assert (=> b!1236247 m!1140101))

(declare-fun m!1140103 () Bool)

(assert (=> b!1236247 m!1140103))

(declare-fun m!1140105 () Bool)

(assert (=> b!1236251 m!1140105))

(assert (=> b!1236255 m!1140103))

(assert (=> b!1236255 m!1140103))

(declare-fun m!1140107 () Bool)

(assert (=> b!1236255 m!1140107))

(declare-fun m!1140109 () Bool)

(assert (=> b!1236257 m!1140109))

(declare-fun m!1140111 () Bool)

(assert (=> b!1236249 m!1140111))

(declare-fun m!1140113 () Bool)

(assert (=> start!102850 m!1140113))

(push 1)

