; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62650 () Bool)

(assert start!62650)

(declare-fun b!707358 () Bool)

(declare-fun res!471176 () Bool)

(declare-fun e!398088 () Bool)

(assert (=> b!707358 (=> (not res!471176) (not e!398088))))

(declare-datatypes ((List!13362 0))(
  ( (Nil!13359) (Cons!13358 (h!14403 (_ BitVec 64)) (t!19644 List!13362)) )
))
(declare-fun acc!652 () List!13362)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3939 (List!13362 (_ BitVec 64)) Bool)

(assert (=> b!707358 (= res!471176 (not (contains!3939 acc!652 k0!2824)))))

(declare-fun b!707359 () Bool)

(declare-fun res!471172 () Bool)

(assert (=> b!707359 (=> (not res!471172) (not e!398088))))

(declare-fun newAcc!49 () List!13362)

(declare-fun -!349 (List!13362 (_ BitVec 64)) List!13362)

(assert (=> b!707359 (= res!471172 (= (-!349 newAcc!49 k0!2824) acc!652))))

(declare-fun b!707360 () Bool)

(declare-fun res!471171 () Bool)

(assert (=> b!707360 (=> (not res!471171) (not e!398088))))

(assert (=> b!707360 (= res!471171 (contains!3939 newAcc!49 k0!2824))))

(declare-fun b!707361 () Bool)

(declare-fun res!471169 () Bool)

(assert (=> b!707361 (=> (not res!471169) (not e!398088))))

(assert (=> b!707361 (= res!471169 (not (contains!3939 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707362 () Bool)

(declare-fun res!471179 () Bool)

(assert (=> b!707362 (=> (not res!471179) (not e!398088))))

(declare-fun noDuplicate!1186 (List!13362) Bool)

(assert (=> b!707362 (= res!471179 (noDuplicate!1186 newAcc!49))))

(declare-fun b!707363 () Bool)

(declare-fun res!471174 () Bool)

(assert (=> b!707363 (=> (not res!471174) (not e!398088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707363 (= res!471174 (validKeyInArray!0 k0!2824))))

(declare-fun b!707364 () Bool)

(declare-fun res!471180 () Bool)

(assert (=> b!707364 (=> (not res!471180) (not e!398088))))

(assert (=> b!707364 (= res!471180 (noDuplicate!1186 acc!652))))

(declare-fun b!707365 () Bool)

(declare-fun res!471177 () Bool)

(assert (=> b!707365 (=> (not res!471177) (not e!398088))))

(assert (=> b!707365 (= res!471177 (not (contains!3939 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707366 () Bool)

(declare-fun res!471173 () Bool)

(assert (=> b!707366 (=> (not res!471173) (not e!398088))))

(declare-fun subseq!384 (List!13362 List!13362) Bool)

(assert (=> b!707366 (= res!471173 (subseq!384 acc!652 newAcc!49))))

(declare-fun res!471168 () Bool)

(assert (=> start!62650 (=> (not res!471168) (not e!398088))))

(declare-datatypes ((array!40329 0))(
  ( (array!40330 (arr!19321 (Array (_ BitVec 32) (_ BitVec 64))) (size!19706 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40329)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62650 (= res!471168 (and (bvslt (size!19706 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19706 a!3591))))))

(assert (=> start!62650 e!398088))

(assert (=> start!62650 true))

(declare-fun array_inv!15117 (array!40329) Bool)

(assert (=> start!62650 (array_inv!15117 a!3591)))

(declare-fun b!707367 () Bool)

(declare-fun res!471170 () Bool)

(assert (=> b!707367 (=> (not res!471170) (not e!398088))))

(declare-fun arrayNoDuplicates!0 (array!40329 (_ BitVec 32) List!13362) Bool)

(assert (=> b!707367 (= res!471170 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707368 () Bool)

(assert (=> b!707368 (= e!398088 false)))

(declare-fun lt!318000 () Bool)

(assert (=> b!707368 (= lt!318000 (contains!3939 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707369 () Bool)

(declare-fun res!471175 () Bool)

(assert (=> b!707369 (=> (not res!471175) (not e!398088))))

(assert (=> b!707369 (= res!471175 (not (contains!3939 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707370 () Bool)

(declare-fun res!471178 () Bool)

(assert (=> b!707370 (=> (not res!471178) (not e!398088))))

(declare-fun arrayContainsKey!0 (array!40329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707370 (= res!471178 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(assert (= (and start!62650 res!471168) b!707364))

(assert (= (and b!707364 res!471180) b!707362))

(assert (= (and b!707362 res!471179) b!707361))

(assert (= (and b!707361 res!471169) b!707369))

(assert (= (and b!707369 res!471175) b!707370))

(assert (= (and b!707370 res!471178) b!707358))

(assert (= (and b!707358 res!471176) b!707363))

(assert (= (and b!707363 res!471174) b!707367))

(assert (= (and b!707367 res!471170) b!707366))

(assert (= (and b!707366 res!471173) b!707360))

(assert (= (and b!707360 res!471171) b!707359))

(assert (= (and b!707359 res!471172) b!707365))

(assert (= (and b!707365 res!471177) b!707368))

(declare-fun m!664955 () Bool)

(assert (=> b!707358 m!664955))

(declare-fun m!664957 () Bool)

(assert (=> b!707370 m!664957))

(declare-fun m!664959 () Bool)

(assert (=> b!707360 m!664959))

(declare-fun m!664961 () Bool)

(assert (=> b!707362 m!664961))

(declare-fun m!664963 () Bool)

(assert (=> b!707369 m!664963))

(declare-fun m!664965 () Bool)

(assert (=> b!707367 m!664965))

(declare-fun m!664967 () Bool)

(assert (=> b!707366 m!664967))

(declare-fun m!664969 () Bool)

(assert (=> start!62650 m!664969))

(declare-fun m!664971 () Bool)

(assert (=> b!707361 m!664971))

(declare-fun m!664973 () Bool)

(assert (=> b!707363 m!664973))

(declare-fun m!664975 () Bool)

(assert (=> b!707364 m!664975))

(declare-fun m!664977 () Bool)

(assert (=> b!707368 m!664977))

(declare-fun m!664979 () Bool)

(assert (=> b!707365 m!664979))

(declare-fun m!664981 () Bool)

(assert (=> b!707359 m!664981))

(check-sat (not b!707365) (not b!707358) (not b!707366) (not b!707367) (not b!707369) (not b!707363) (not b!707368) (not b!707361) (not b!707360) (not b!707364) (not b!707362) (not start!62650) (not b!707370) (not b!707359))
(check-sat)
