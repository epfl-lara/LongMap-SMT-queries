; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102238 () Bool)

(assert start!102238)

(declare-fun b!1229509 () Bool)

(declare-fun res!817343 () Bool)

(declare-fun e!697997 () Bool)

(assert (=> b!1229509 (=> (not res!817343) (not e!697997))))

(declare-datatypes ((array!79311 0))(
  ( (array!79312 (arr!38272 (Array (_ BitVec 32) (_ BitVec 64))) (size!38809 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79311)

(declare-datatypes ((List!27058 0))(
  ( (Nil!27055) (Cons!27054 (h!28272 (_ BitVec 64)) (t!40513 List!27058)) )
))
(declare-fun acc!823 () List!27058)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79311 (_ BitVec 32) List!27058) Bool)

(assert (=> b!1229509 (= res!817343 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229510 () Bool)

(declare-fun res!817350 () Bool)

(assert (=> b!1229510 (=> (not res!817350) (not e!697997))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229510 (= res!817350 (validKeyInArray!0 k!2913))))

(declare-fun b!1229511 () Bool)

(declare-fun res!817352 () Bool)

(assert (=> b!1229511 (=> (not res!817352) (not e!697997))))

(assert (=> b!1229511 (= res!817352 (validKeyInArray!0 (select (arr!38272 a!3806) from!3184)))))

(declare-fun b!1229513 () Bool)

(declare-fun e!697995 () Bool)

(assert (=> b!1229513 (= e!697995 true)))

(declare-datatypes ((Unit!40659 0))(
  ( (Unit!40660) )
))
(declare-fun lt!559455 () Unit!40659)

(declare-fun noDuplicateSubseq!52 (List!27058 List!27058) Unit!40659)

(assert (=> b!1229513 (= lt!559455 (noDuplicateSubseq!52 Nil!27055 acc!823))))

(declare-fun b!1229514 () Bool)

(declare-fun res!817349 () Bool)

(assert (=> b!1229514 (=> res!817349 e!697995)))

(declare-fun contains!7129 (List!27058 (_ BitVec 64)) Bool)

(assert (=> b!1229514 (= res!817349 (contains!7129 Nil!27055 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229515 () Bool)

(declare-fun res!817345 () Bool)

(assert (=> b!1229515 (=> (not res!817345) (not e!697997))))

(assert (=> b!1229515 (= res!817345 (not (contains!7129 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229516 () Bool)

(declare-fun res!817346 () Bool)

(assert (=> b!1229516 (=> res!817346 e!697995)))

(assert (=> b!1229516 (= res!817346 (contains!7129 Nil!27055 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229517 () Bool)

(assert (=> b!1229517 (= e!697997 (not e!697995))))

(declare-fun res!817340 () Bool)

(assert (=> b!1229517 (=> res!817340 e!697995)))

(assert (=> b!1229517 (= res!817340 (bvsgt from!3184 (size!38809 a!3806)))))

(assert (=> b!1229517 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27054 (select (arr!38272 a!3806) from!3184) acc!823))))

(declare-fun b!1229518 () Bool)

(declare-fun res!817351 () Bool)

(assert (=> b!1229518 (=> res!817351 e!697995)))

(declare-fun subseq!499 (List!27058 List!27058) Bool)

(assert (=> b!1229518 (= res!817351 (not (subseq!499 Nil!27055 acc!823)))))

(declare-fun b!1229519 () Bool)

(declare-fun res!817347 () Bool)

(assert (=> b!1229519 (=> (not res!817347) (not e!697997))))

(assert (=> b!1229519 (= res!817347 (not (contains!7129 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229512 () Bool)

(declare-fun res!817344 () Bool)

(assert (=> b!1229512 (=> (not res!817344) (not e!697997))))

(declare-fun arrayContainsKey!0 (array!79311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229512 (= res!817344 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!817342 () Bool)

(assert (=> start!102238 (=> (not res!817342) (not e!697997))))

(assert (=> start!102238 (= res!817342 (bvslt (size!38809 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102238 e!697997))

(declare-fun array_inv!29210 (array!79311) Bool)

(assert (=> start!102238 (array_inv!29210 a!3806)))

(assert (=> start!102238 true))

(declare-fun b!1229520 () Bool)

(declare-fun res!817348 () Bool)

(assert (=> b!1229520 (=> (not res!817348) (not e!697997))))

(assert (=> b!1229520 (= res!817348 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38809 a!3806)) (bvslt from!3184 (size!38809 a!3806))))))

(declare-fun b!1229521 () Bool)

(declare-fun res!817341 () Bool)

(assert (=> b!1229521 (=> (not res!817341) (not e!697997))))

(declare-fun noDuplicate!1710 (List!27058) Bool)

(assert (=> b!1229521 (= res!817341 (noDuplicate!1710 acc!823))))

(assert (= (and start!102238 res!817342) b!1229510))

(assert (= (and b!1229510 res!817350) b!1229520))

(assert (= (and b!1229520 res!817348) b!1229521))

(assert (= (and b!1229521 res!817341) b!1229515))

(assert (= (and b!1229515 res!817345) b!1229519))

(assert (= (and b!1229519 res!817347) b!1229512))

(assert (= (and b!1229512 res!817344) b!1229509))

(assert (= (and b!1229509 res!817343) b!1229511))

(assert (= (and b!1229511 res!817352) b!1229517))

(assert (= (and b!1229517 (not res!817340)) b!1229514))

(assert (= (and b!1229514 (not res!817349)) b!1229516))

(assert (= (and b!1229516 (not res!817346)) b!1229518))

(assert (= (and b!1229518 (not res!817351)) b!1229513))

(declare-fun m!1134377 () Bool)

(assert (=> b!1229514 m!1134377))

(declare-fun m!1134379 () Bool)

(assert (=> b!1229515 m!1134379))

(declare-fun m!1134381 () Bool)

(assert (=> b!1229509 m!1134381))

(declare-fun m!1134383 () Bool)

(assert (=> b!1229521 m!1134383))

(declare-fun m!1134385 () Bool)

(assert (=> b!1229518 m!1134385))

(declare-fun m!1134387 () Bool)

(assert (=> start!102238 m!1134387))

(declare-fun m!1134389 () Bool)

(assert (=> b!1229511 m!1134389))

(assert (=> b!1229511 m!1134389))

(declare-fun m!1134391 () Bool)

(assert (=> b!1229511 m!1134391))

(declare-fun m!1134393 () Bool)

(assert (=> b!1229519 m!1134393))

(declare-fun m!1134395 () Bool)

(assert (=> b!1229512 m!1134395))

(declare-fun m!1134397 () Bool)

(assert (=> b!1229513 m!1134397))

(assert (=> b!1229517 m!1134389))

(declare-fun m!1134399 () Bool)

(assert (=> b!1229517 m!1134399))

(declare-fun m!1134401 () Bool)

(assert (=> b!1229516 m!1134401))

(declare-fun m!1134403 () Bool)

(assert (=> b!1229510 m!1134403))

(push 1)

(assert (not b!1229511))

(assert (not b!1229518))

(assert (not b!1229516))

(assert (not b!1229521))

(assert (not b!1229510))

(assert (not b!1229515))

(assert (not b!1229519))

(assert (not b!1229509))

(assert (not b!1229513))

(assert (not b!1229514))

(assert (not start!102238))

(assert (not b!1229512))

(assert (not b!1229517))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

