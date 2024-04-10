; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102188 () Bool)

(assert start!102188)

(declare-fun b!1230224 () Bool)

(declare-fun e!698042 () Bool)

(assert (=> b!1230224 (= e!698042 (not true))))

(declare-datatypes ((array!79363 0))(
  ( (array!79364 (arr!38301 (Array (_ BitVec 32) (_ BitVec 64))) (size!38837 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79363)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230224 (not (arrayContainsKey!0 a!3806 (select (arr!38301 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40768 0))(
  ( (Unit!40769) )
))
(declare-fun lt!559346 () Unit!40768)

(declare-datatypes ((List!27074 0))(
  ( (Nil!27071) (Cons!27070 (h!28279 (_ BitVec 64)) (t!40537 List!27074)) )
))
(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79363 (_ BitVec 32) (_ BitVec 64) List!27074) Unit!40768)

(assert (=> b!1230224 (= lt!559346 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38301 a!3806) from!3184) (Cons!27070 (select (arr!38301 a!3806) from!3184) Nil!27071)))))

(declare-fun e!698043 () Bool)

(assert (=> b!1230224 e!698043))

(declare-fun res!818717 () Bool)

(assert (=> b!1230224 (=> (not res!818717) (not e!698043))))

(declare-fun arrayNoDuplicates!0 (array!79363 (_ BitVec 32) List!27074) Bool)

(assert (=> b!1230224 (= res!818717 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27071))))

(declare-fun acc!823 () List!27074)

(declare-fun lt!559345 () Unit!40768)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79363 List!27074 List!27074 (_ BitVec 32)) Unit!40768)

(assert (=> b!1230224 (= lt!559345 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27071 from!3184))))

(assert (=> b!1230224 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27070 (select (arr!38301 a!3806) from!3184) acc!823))))

(declare-fun b!1230225 () Bool)

(declare-fun res!818714 () Bool)

(assert (=> b!1230225 (=> (not res!818714) (not e!698042))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230225 (= res!818714 (validKeyInArray!0 k0!2913))))

(declare-fun res!818718 () Bool)

(assert (=> start!102188 (=> (not res!818718) (not e!698042))))

(assert (=> start!102188 (= res!818718 (bvslt (size!38837 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102188 e!698042))

(declare-fun array_inv!29149 (array!79363) Bool)

(assert (=> start!102188 (array_inv!29149 a!3806)))

(assert (=> start!102188 true))

(declare-fun b!1230226 () Bool)

(declare-fun res!818716 () Bool)

(assert (=> b!1230226 (=> (not res!818716) (not e!698042))))

(declare-fun noDuplicate!1733 (List!27074) Bool)

(assert (=> b!1230226 (= res!818716 (noDuplicate!1733 acc!823))))

(declare-fun b!1230227 () Bool)

(declare-fun res!818712 () Bool)

(assert (=> b!1230227 (=> (not res!818712) (not e!698042))))

(declare-fun contains!7136 (List!27074 (_ BitVec 64)) Bool)

(assert (=> b!1230227 (= res!818712 (not (contains!7136 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230228 () Bool)

(assert (=> b!1230228 (= e!698043 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27070 (select (arr!38301 a!3806) from!3184) Nil!27071)))))

(declare-fun b!1230229 () Bool)

(declare-fun res!818710 () Bool)

(assert (=> b!1230229 (=> (not res!818710) (not e!698042))))

(assert (=> b!1230229 (= res!818710 (validKeyInArray!0 (select (arr!38301 a!3806) from!3184)))))

(declare-fun b!1230230 () Bool)

(declare-fun res!818711 () Bool)

(assert (=> b!1230230 (=> (not res!818711) (not e!698042))))

(assert (=> b!1230230 (= res!818711 (not (contains!7136 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230231 () Bool)

(declare-fun res!818715 () Bool)

(assert (=> b!1230231 (=> (not res!818715) (not e!698042))))

(assert (=> b!1230231 (= res!818715 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230232 () Bool)

(declare-fun res!818713 () Bool)

(assert (=> b!1230232 (=> (not res!818713) (not e!698042))))

(assert (=> b!1230232 (= res!818713 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230233 () Bool)

(declare-fun res!818719 () Bool)

(assert (=> b!1230233 (=> (not res!818719) (not e!698042))))

(assert (=> b!1230233 (= res!818719 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38837 a!3806)) (bvslt from!3184 (size!38837 a!3806))))))

(assert (= (and start!102188 res!818718) b!1230225))

(assert (= (and b!1230225 res!818714) b!1230233))

(assert (= (and b!1230233 res!818719) b!1230226))

(assert (= (and b!1230226 res!818716) b!1230227))

(assert (= (and b!1230227 res!818712) b!1230230))

(assert (= (and b!1230230 res!818711) b!1230231))

(assert (= (and b!1230231 res!818715) b!1230232))

(assert (= (and b!1230232 res!818713) b!1230229))

(assert (= (and b!1230229 res!818710) b!1230224))

(assert (= (and b!1230224 res!818717) b!1230228))

(declare-fun m!1134679 () Bool)

(assert (=> b!1230227 m!1134679))

(declare-fun m!1134681 () Bool)

(assert (=> b!1230231 m!1134681))

(declare-fun m!1134683 () Bool)

(assert (=> b!1230228 m!1134683))

(declare-fun m!1134685 () Bool)

(assert (=> b!1230228 m!1134685))

(declare-fun m!1134687 () Bool)

(assert (=> b!1230232 m!1134687))

(declare-fun m!1134689 () Bool)

(assert (=> b!1230230 m!1134689))

(declare-fun m!1134691 () Bool)

(assert (=> b!1230224 m!1134691))

(declare-fun m!1134693 () Bool)

(assert (=> b!1230224 m!1134693))

(assert (=> b!1230224 m!1134683))

(declare-fun m!1134695 () Bool)

(assert (=> b!1230224 m!1134695))

(assert (=> b!1230224 m!1134683))

(declare-fun m!1134697 () Bool)

(assert (=> b!1230224 m!1134697))

(assert (=> b!1230224 m!1134683))

(declare-fun m!1134699 () Bool)

(assert (=> b!1230224 m!1134699))

(declare-fun m!1134701 () Bool)

(assert (=> start!102188 m!1134701))

(assert (=> b!1230229 m!1134683))

(assert (=> b!1230229 m!1134683))

(declare-fun m!1134703 () Bool)

(assert (=> b!1230229 m!1134703))

(declare-fun m!1134705 () Bool)

(assert (=> b!1230225 m!1134705))

(declare-fun m!1134707 () Bool)

(assert (=> b!1230226 m!1134707))

(check-sat (not b!1230230) (not b!1230225) (not b!1230231) (not b!1230228) (not b!1230226) (not b!1230224) (not b!1230227) (not b!1230229) (not start!102188) (not b!1230232))
