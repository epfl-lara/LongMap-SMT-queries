; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102790 () Bool)

(assert start!102790)

(declare-fun b!1235319 () Bool)

(declare-fun res!823481 () Bool)

(declare-fun e!700399 () Bool)

(assert (=> b!1235319 (=> (not res!823481) (not e!700399))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79635 0))(
  ( (array!79636 (arr!38425 (Array (_ BitVec 32) (_ BitVec 64))) (size!38961 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79635)

(assert (=> b!1235319 (= res!823481 (not (= from!3213 (bvsub (size!38961 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235320 () Bool)

(declare-fun res!823492 () Bool)

(assert (=> b!1235320 (=> (not res!823492) (not e!700399))))

(declare-datatypes ((List!27198 0))(
  ( (Nil!27195) (Cons!27194 (h!28403 (_ BitVec 64)) (t!40661 List!27198)) )
))
(declare-fun acc!846 () List!27198)

(declare-fun noDuplicate!1857 (List!27198) Bool)

(assert (=> b!1235320 (= res!823492 (noDuplicate!1857 acc!846))))

(declare-fun b!1235321 () Bool)

(declare-fun res!823485 () Bool)

(assert (=> b!1235321 (=> (not res!823485) (not e!700399))))

(declare-fun contains!7260 (List!27198 (_ BitVec 64)) Bool)

(assert (=> b!1235321 (= res!823485 (not (contains!7260 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235323 () Bool)

(declare-fun e!700401 () Bool)

(assert (=> b!1235323 (= e!700399 (not e!700401))))

(declare-fun res!823486 () Bool)

(assert (=> b!1235323 (=> res!823486 e!700401)))

(assert (=> b!1235323 (= res!823486 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun lt!560222 () List!27198)

(declare-fun subseq!532 (List!27198 List!27198) Bool)

(assert (=> b!1235323 (subseq!532 acc!846 lt!560222)))

(declare-datatypes ((Unit!40920 0))(
  ( (Unit!40921) )
))
(declare-fun lt!560221 () Unit!40920)

(declare-fun subseqTail!25 (List!27198 List!27198) Unit!40920)

(assert (=> b!1235323 (= lt!560221 (subseqTail!25 lt!560222 lt!560222))))

(assert (=> b!1235323 (subseq!532 lt!560222 lt!560222)))

(declare-fun lt!560223 () Unit!40920)

(declare-fun lemmaListSubSeqRefl!0 (List!27198) Unit!40920)

(assert (=> b!1235323 (= lt!560223 (lemmaListSubSeqRefl!0 lt!560222))))

(assert (=> b!1235323 (= lt!560222 (Cons!27194 (select (arr!38425 a!3835) from!3213) acc!846))))

(declare-fun b!1235324 () Bool)

(declare-fun res!823482 () Bool)

(assert (=> b!1235324 (=> res!823482 e!700401)))

(assert (=> b!1235324 (= res!823482 (contains!7260 lt!560222 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235325 () Bool)

(assert (=> b!1235325 (= e!700401 true)))

(declare-fun lt!560225 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79635 (_ BitVec 32) List!27198) Bool)

(assert (=> b!1235325 (= lt!560225 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560222))))

(declare-fun lt!560224 () Unit!40920)

(declare-fun noDuplicateSubseq!79 (List!27198 List!27198) Unit!40920)

(assert (=> b!1235325 (= lt!560224 (noDuplicateSubseq!79 acc!846 lt!560222))))

(declare-fun b!1235326 () Bool)

(declare-fun res!823490 () Bool)

(assert (=> b!1235326 (=> (not res!823490) (not e!700399))))

(assert (=> b!1235326 (= res!823490 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235327 () Bool)

(declare-fun res!823483 () Bool)

(assert (=> b!1235327 (=> (not res!823483) (not e!700399))))

(assert (=> b!1235327 (= res!823483 (not (contains!7260 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235328 () Bool)

(declare-fun res!823489 () Bool)

(assert (=> b!1235328 (=> res!823489 e!700401)))

(assert (=> b!1235328 (= res!823489 (contains!7260 lt!560222 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235322 () Bool)

(declare-fun res!823488 () Bool)

(assert (=> b!1235322 (=> (not res!823488) (not e!700399))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235322 (= res!823488 (contains!7260 acc!846 k!2925))))

(declare-fun res!823487 () Bool)

(assert (=> start!102790 (=> (not res!823487) (not e!700399))))

(assert (=> start!102790 (= res!823487 (and (bvslt (size!38961 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38961 a!3835))))))

(assert (=> start!102790 e!700399))

(declare-fun array_inv!29273 (array!79635) Bool)

(assert (=> start!102790 (array_inv!29273 a!3835)))

(assert (=> start!102790 true))

(declare-fun b!1235329 () Bool)

(declare-fun res!823491 () Bool)

(assert (=> b!1235329 (=> res!823491 e!700401)))

(assert (=> b!1235329 (= res!823491 (not (noDuplicate!1857 lt!560222)))))

(declare-fun b!1235330 () Bool)

(declare-fun res!823484 () Bool)

(assert (=> b!1235330 (=> (not res!823484) (not e!700399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235330 (= res!823484 (validKeyInArray!0 (select (arr!38425 a!3835) from!3213)))))

(assert (= (and start!102790 res!823487) b!1235320))

(assert (= (and b!1235320 res!823492) b!1235321))

(assert (= (and b!1235321 res!823485) b!1235327))

(assert (= (and b!1235327 res!823483) b!1235326))

(assert (= (and b!1235326 res!823490) b!1235322))

(assert (= (and b!1235322 res!823488) b!1235319))

(assert (= (and b!1235319 res!823481) b!1235330))

(assert (= (and b!1235330 res!823484) b!1235323))

(assert (= (and b!1235323 (not res!823486)) b!1235329))

(assert (= (and b!1235329 (not res!823491)) b!1235324))

(assert (= (and b!1235324 (not res!823482)) b!1235328))

(assert (= (and b!1235328 (not res!823489)) b!1235325))

(declare-fun m!1139205 () Bool)

(assert (=> b!1235326 m!1139205))

(declare-fun m!1139207 () Bool)

(assert (=> b!1235323 m!1139207))

(declare-fun m!1139209 () Bool)

(assert (=> b!1235323 m!1139209))

(declare-fun m!1139211 () Bool)

(assert (=> b!1235323 m!1139211))

(declare-fun m!1139213 () Bool)

(assert (=> b!1235323 m!1139213))

(declare-fun m!1139215 () Bool)

(assert (=> b!1235323 m!1139215))

(declare-fun m!1139217 () Bool)

(assert (=> b!1235324 m!1139217))

(declare-fun m!1139219 () Bool)

(assert (=> b!1235322 m!1139219))

(declare-fun m!1139221 () Bool)

(assert (=> start!102790 m!1139221))

(declare-fun m!1139223 () Bool)

(assert (=> b!1235325 m!1139223))

(declare-fun m!1139225 () Bool)

(assert (=> b!1235325 m!1139225))

(declare-fun m!1139227 () Bool)

(assert (=> b!1235320 m!1139227))

(declare-fun m!1139229 () Bool)

(assert (=> b!1235328 m!1139229))

(declare-fun m!1139231 () Bool)

(assert (=> b!1235321 m!1139231))

(declare-fun m!1139233 () Bool)

(assert (=> b!1235329 m!1139233))

(declare-fun m!1139235 () Bool)

(assert (=> b!1235327 m!1139235))

(assert (=> b!1235330 m!1139211))

(assert (=> b!1235330 m!1139211))

(declare-fun m!1139237 () Bool)

(assert (=> b!1235330 m!1139237))

(push 1)

(assert (not b!1235323))

(assert (not b!1235328))

(assert (not b!1235326))

(assert (not b!1235321))

(assert (not b!1235330))

(assert (not b!1235322))

(assert (not b!1235324))

(assert (not b!1235329))

(assert (not start!102790))

(assert (not b!1235325))

(assert (not b!1235327))

(assert (not b!1235320))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

