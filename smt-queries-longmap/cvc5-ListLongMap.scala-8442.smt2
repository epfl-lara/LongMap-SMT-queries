; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102786 () Bool)

(assert start!102786)

(declare-fun b!1235247 () Bool)

(declare-fun res!823409 () Bool)

(declare-fun e!700382 () Bool)

(assert (=> b!1235247 (=> (not res!823409) (not e!700382))))

(declare-datatypes ((List!27196 0))(
  ( (Nil!27193) (Cons!27192 (h!28401 (_ BitVec 64)) (t!40659 List!27196)) )
))
(declare-fun acc!846 () List!27196)

(declare-fun contains!7258 (List!27196 (_ BitVec 64)) Bool)

(assert (=> b!1235247 (= res!823409 (not (contains!7258 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235248 () Bool)

(declare-fun e!700381 () Bool)

(assert (=> b!1235248 (= e!700381 true)))

(declare-fun lt!560191 () List!27196)

(declare-datatypes ((array!79631 0))(
  ( (array!79632 (arr!38423 (Array (_ BitVec 32) (_ BitVec 64))) (size!38959 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79631)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun lt!560194 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79631 (_ BitVec 32) List!27196) Bool)

(assert (=> b!1235248 (= lt!560194 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560191))))

(declare-datatypes ((Unit!40916 0))(
  ( (Unit!40917) )
))
(declare-fun lt!560195 () Unit!40916)

(declare-fun noDuplicateSubseq!77 (List!27196 List!27196) Unit!40916)

(assert (=> b!1235248 (= lt!560195 (noDuplicateSubseq!77 acc!846 lt!560191))))

(declare-fun b!1235249 () Bool)

(declare-fun res!823418 () Bool)

(assert (=> b!1235249 (=> res!823418 e!700381)))

(declare-fun noDuplicate!1855 (List!27196) Bool)

(assert (=> b!1235249 (= res!823418 (not (noDuplicate!1855 lt!560191)))))

(declare-fun b!1235250 () Bool)

(declare-fun res!823414 () Bool)

(assert (=> b!1235250 (=> (not res!823414) (not e!700382))))

(assert (=> b!1235250 (= res!823414 (noDuplicate!1855 acc!846))))

(declare-fun b!1235251 () Bool)

(assert (=> b!1235251 (= e!700382 (not e!700381))))

(declare-fun res!823410 () Bool)

(assert (=> b!1235251 (=> res!823410 e!700381)))

(assert (=> b!1235251 (= res!823410 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!530 (List!27196 List!27196) Bool)

(assert (=> b!1235251 (subseq!530 acc!846 lt!560191)))

(declare-fun lt!560192 () Unit!40916)

(declare-fun subseqTail!23 (List!27196 List!27196) Unit!40916)

(assert (=> b!1235251 (= lt!560192 (subseqTail!23 lt!560191 lt!560191))))

(assert (=> b!1235251 (subseq!530 lt!560191 lt!560191)))

(declare-fun lt!560193 () Unit!40916)

(declare-fun lemmaListSubSeqRefl!0 (List!27196) Unit!40916)

(assert (=> b!1235251 (= lt!560193 (lemmaListSubSeqRefl!0 lt!560191))))

(assert (=> b!1235251 (= lt!560191 (Cons!27192 (select (arr!38423 a!3835) from!3213) acc!846))))

(declare-fun b!1235252 () Bool)

(declare-fun res!823417 () Bool)

(assert (=> b!1235252 (=> (not res!823417) (not e!700382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235252 (= res!823417 (validKeyInArray!0 (select (arr!38423 a!3835) from!3213)))))

(declare-fun b!1235253 () Bool)

(declare-fun res!823413 () Bool)

(assert (=> b!1235253 (=> (not res!823413) (not e!700382))))

(assert (=> b!1235253 (= res!823413 (not (= from!3213 (bvsub (size!38959 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235254 () Bool)

(declare-fun res!823419 () Bool)

(assert (=> b!1235254 (=> res!823419 e!700381)))

(assert (=> b!1235254 (= res!823419 (contains!7258 lt!560191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235255 () Bool)

(declare-fun res!823415 () Bool)

(assert (=> b!1235255 (=> res!823415 e!700381)))

(assert (=> b!1235255 (= res!823415 (contains!7258 lt!560191 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235257 () Bool)

(declare-fun res!823412 () Bool)

(assert (=> b!1235257 (=> (not res!823412) (not e!700382))))

(assert (=> b!1235257 (= res!823412 (not (contains!7258 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235258 () Bool)

(declare-fun res!823411 () Bool)

(assert (=> b!1235258 (=> (not res!823411) (not e!700382))))

(assert (=> b!1235258 (= res!823411 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!823420 () Bool)

(assert (=> start!102786 (=> (not res!823420) (not e!700382))))

(assert (=> start!102786 (= res!823420 (and (bvslt (size!38959 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38959 a!3835))))))

(assert (=> start!102786 e!700382))

(declare-fun array_inv!29271 (array!79631) Bool)

(assert (=> start!102786 (array_inv!29271 a!3835)))

(assert (=> start!102786 true))

(declare-fun b!1235256 () Bool)

(declare-fun res!823416 () Bool)

(assert (=> b!1235256 (=> (not res!823416) (not e!700382))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235256 (= res!823416 (contains!7258 acc!846 k!2925))))

(assert (= (and start!102786 res!823420) b!1235250))

(assert (= (and b!1235250 res!823414) b!1235247))

(assert (= (and b!1235247 res!823409) b!1235257))

(assert (= (and b!1235257 res!823412) b!1235258))

(assert (= (and b!1235258 res!823411) b!1235256))

(assert (= (and b!1235256 res!823416) b!1235253))

(assert (= (and b!1235253 res!823413) b!1235252))

(assert (= (and b!1235252 res!823417) b!1235251))

(assert (= (and b!1235251 (not res!823410)) b!1235249))

(assert (= (and b!1235249 (not res!823418)) b!1235254))

(assert (= (and b!1235254 (not res!823419)) b!1235255))

(assert (= (and b!1235255 (not res!823415)) b!1235248))

(declare-fun m!1139137 () Bool)

(assert (=> b!1235255 m!1139137))

(declare-fun m!1139139 () Bool)

(assert (=> start!102786 m!1139139))

(declare-fun m!1139141 () Bool)

(assert (=> b!1235250 m!1139141))

(declare-fun m!1139143 () Bool)

(assert (=> b!1235251 m!1139143))

(declare-fun m!1139145 () Bool)

(assert (=> b!1235251 m!1139145))

(declare-fun m!1139147 () Bool)

(assert (=> b!1235251 m!1139147))

(declare-fun m!1139149 () Bool)

(assert (=> b!1235251 m!1139149))

(declare-fun m!1139151 () Bool)

(assert (=> b!1235251 m!1139151))

(declare-fun m!1139153 () Bool)

(assert (=> b!1235258 m!1139153))

(declare-fun m!1139155 () Bool)

(assert (=> b!1235256 m!1139155))

(declare-fun m!1139157 () Bool)

(assert (=> b!1235248 m!1139157))

(declare-fun m!1139159 () Bool)

(assert (=> b!1235248 m!1139159))

(declare-fun m!1139161 () Bool)

(assert (=> b!1235257 m!1139161))

(declare-fun m!1139163 () Bool)

(assert (=> b!1235249 m!1139163))

(declare-fun m!1139165 () Bool)

(assert (=> b!1235254 m!1139165))

(declare-fun m!1139167 () Bool)

(assert (=> b!1235247 m!1139167))

(assert (=> b!1235252 m!1139151))

(assert (=> b!1235252 m!1139151))

(declare-fun m!1139169 () Bool)

(assert (=> b!1235252 m!1139169))

(push 1)

(assert (not b!1235251))

(assert (not start!102786))

(assert (not b!1235255))

(assert (not b!1235256))

(assert (not b!1235248))

(assert (not b!1235252))

(assert (not b!1235254))

(assert (not b!1235249))

(assert (not b!1235250))

(assert (not b!1235247))

(assert (not b!1235257))

(assert (not b!1235258))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

