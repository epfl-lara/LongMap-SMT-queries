; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102782 () Bool)

(assert start!102782)

(declare-fun b!1235175 () Bool)

(declare-fun res!823342 () Bool)

(declare-fun e!700364 () Bool)

(assert (=> b!1235175 (=> res!823342 e!700364)))

(declare-datatypes ((List!27194 0))(
  ( (Nil!27191) (Cons!27190 (h!28399 (_ BitVec 64)) (t!40657 List!27194)) )
))
(declare-fun lt!560163 () List!27194)

(declare-fun contains!7256 (List!27194 (_ BitVec 64)) Bool)

(assert (=> b!1235175 (= res!823342 (contains!7256 lt!560163 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235176 () Bool)

(declare-fun res!823339 () Bool)

(declare-fun e!700365 () Bool)

(assert (=> b!1235176 (=> (not res!823339) (not e!700365))))

(declare-fun acc!846 () List!27194)

(assert (=> b!1235176 (= res!823339 (not (contains!7256 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235177 () Bool)

(declare-fun res!823337 () Bool)

(assert (=> b!1235177 (=> (not res!823337) (not e!700365))))

(declare-datatypes ((array!79627 0))(
  ( (array!79628 (arr!38421 (Array (_ BitVec 32) (_ BitVec 64))) (size!38957 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79627)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235177 (= res!823337 (validKeyInArray!0 (select (arr!38421 a!3835) from!3213)))))

(declare-fun b!1235178 () Bool)

(assert (=> b!1235178 (= e!700364 true)))

(declare-fun lt!560161 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79627 (_ BitVec 32) List!27194) Bool)

(assert (=> b!1235178 (= lt!560161 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560163))))

(declare-datatypes ((Unit!40912 0))(
  ( (Unit!40913) )
))
(declare-fun lt!560164 () Unit!40912)

(declare-fun noDuplicateSubseq!75 (List!27194 List!27194) Unit!40912)

(assert (=> b!1235178 (= lt!560164 (noDuplicateSubseq!75 acc!846 lt!560163))))

(declare-fun b!1235179 () Bool)

(declare-fun res!823338 () Bool)

(assert (=> b!1235179 (=> (not res!823338) (not e!700365))))

(assert (=> b!1235179 (= res!823338 (not (= from!3213 (bvsub (size!38957 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235180 () Bool)

(declare-fun res!823340 () Bool)

(assert (=> b!1235180 (=> (not res!823340) (not e!700365))))

(assert (=> b!1235180 (= res!823340 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!823344 () Bool)

(assert (=> start!102782 (=> (not res!823344) (not e!700365))))

(assert (=> start!102782 (= res!823344 (and (bvslt (size!38957 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38957 a!3835))))))

(assert (=> start!102782 e!700365))

(declare-fun array_inv!29269 (array!79627) Bool)

(assert (=> start!102782 (array_inv!29269 a!3835)))

(assert (=> start!102782 true))

(declare-fun b!1235181 () Bool)

(declare-fun res!823346 () Bool)

(assert (=> b!1235181 (=> (not res!823346) (not e!700365))))

(declare-fun noDuplicate!1853 (List!27194) Bool)

(assert (=> b!1235181 (= res!823346 (noDuplicate!1853 acc!846))))

(declare-fun b!1235182 () Bool)

(declare-fun res!823341 () Bool)

(assert (=> b!1235182 (=> (not res!823341) (not e!700365))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235182 (= res!823341 (contains!7256 acc!846 k0!2925))))

(declare-fun b!1235183 () Bool)

(declare-fun res!823348 () Bool)

(assert (=> b!1235183 (=> res!823348 e!700364)))

(assert (=> b!1235183 (= res!823348 (not (noDuplicate!1853 lt!560163)))))

(declare-fun b!1235184 () Bool)

(declare-fun res!823343 () Bool)

(assert (=> b!1235184 (=> (not res!823343) (not e!700365))))

(assert (=> b!1235184 (= res!823343 (not (contains!7256 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235185 () Bool)

(declare-fun res!823345 () Bool)

(assert (=> b!1235185 (=> res!823345 e!700364)))

(assert (=> b!1235185 (= res!823345 (contains!7256 lt!560163 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235186 () Bool)

(assert (=> b!1235186 (= e!700365 (not e!700364))))

(declare-fun res!823347 () Bool)

(assert (=> b!1235186 (=> res!823347 e!700364)))

(assert (=> b!1235186 (= res!823347 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!528 (List!27194 List!27194) Bool)

(assert (=> b!1235186 (subseq!528 acc!846 lt!560163)))

(declare-fun lt!560165 () Unit!40912)

(declare-fun subseqTail!21 (List!27194 List!27194) Unit!40912)

(assert (=> b!1235186 (= lt!560165 (subseqTail!21 lt!560163 lt!560163))))

(assert (=> b!1235186 (subseq!528 lt!560163 lt!560163)))

(declare-fun lt!560162 () Unit!40912)

(declare-fun lemmaListSubSeqRefl!0 (List!27194) Unit!40912)

(assert (=> b!1235186 (= lt!560162 (lemmaListSubSeqRefl!0 lt!560163))))

(assert (=> b!1235186 (= lt!560163 (Cons!27190 (select (arr!38421 a!3835) from!3213) acc!846))))

(assert (= (and start!102782 res!823344) b!1235181))

(assert (= (and b!1235181 res!823346) b!1235176))

(assert (= (and b!1235176 res!823339) b!1235184))

(assert (= (and b!1235184 res!823343) b!1235180))

(assert (= (and b!1235180 res!823340) b!1235182))

(assert (= (and b!1235182 res!823341) b!1235179))

(assert (= (and b!1235179 res!823338) b!1235177))

(assert (= (and b!1235177 res!823337) b!1235186))

(assert (= (and b!1235186 (not res!823347)) b!1235183))

(assert (= (and b!1235183 (not res!823348)) b!1235185))

(assert (= (and b!1235185 (not res!823345)) b!1235175))

(assert (= (and b!1235175 (not res!823342)) b!1235178))

(declare-fun m!1139069 () Bool)

(assert (=> b!1235182 m!1139069))

(declare-fun m!1139071 () Bool)

(assert (=> b!1235178 m!1139071))

(declare-fun m!1139073 () Bool)

(assert (=> b!1235178 m!1139073))

(declare-fun m!1139075 () Bool)

(assert (=> b!1235176 m!1139075))

(declare-fun m!1139077 () Bool)

(assert (=> b!1235184 m!1139077))

(declare-fun m!1139079 () Bool)

(assert (=> b!1235186 m!1139079))

(declare-fun m!1139081 () Bool)

(assert (=> b!1235186 m!1139081))

(declare-fun m!1139083 () Bool)

(assert (=> b!1235186 m!1139083))

(declare-fun m!1139085 () Bool)

(assert (=> b!1235186 m!1139085))

(declare-fun m!1139087 () Bool)

(assert (=> b!1235186 m!1139087))

(declare-fun m!1139089 () Bool)

(assert (=> b!1235183 m!1139089))

(assert (=> b!1235177 m!1139083))

(assert (=> b!1235177 m!1139083))

(declare-fun m!1139091 () Bool)

(assert (=> b!1235177 m!1139091))

(declare-fun m!1139093 () Bool)

(assert (=> b!1235181 m!1139093))

(declare-fun m!1139095 () Bool)

(assert (=> b!1235185 m!1139095))

(declare-fun m!1139097 () Bool)

(assert (=> b!1235180 m!1139097))

(declare-fun m!1139099 () Bool)

(assert (=> start!102782 m!1139099))

(declare-fun m!1139101 () Bool)

(assert (=> b!1235175 m!1139101))

(check-sat (not b!1235177) (not b!1235181) (not b!1235185) (not b!1235183) (not b!1235180) (not b!1235184) (not b!1235186) (not start!102782) (not b!1235178) (not b!1235175) (not b!1235182) (not b!1235176))
(check-sat)
