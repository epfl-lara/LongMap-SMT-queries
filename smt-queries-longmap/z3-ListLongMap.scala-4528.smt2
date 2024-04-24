; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62692 () Bool)

(assert start!62692)

(declare-fun b!707251 () Bool)

(declare-fun res!470970 () Bool)

(declare-fun e!398163 () Bool)

(assert (=> b!707251 (=> (not res!470970) (not e!398163))))

(declare-datatypes ((List!13257 0))(
  ( (Nil!13254) (Cons!13253 (h!14301 (_ BitVec 64)) (t!19531 List!13257)) )
))
(declare-fun newAcc!49 () List!13257)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3909 (List!13257 (_ BitVec 64)) Bool)

(assert (=> b!707251 (= res!470970 (contains!3909 newAcc!49 k0!2824))))

(declare-fun res!470968 () Bool)

(assert (=> start!62692 (=> (not res!470968) (not e!398163))))

(declare-datatypes ((array!40311 0))(
  ( (array!40312 (arr!19309 (Array (_ BitVec 32) (_ BitVec 64))) (size!19692 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40311)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62692 (= res!470968 (and (bvslt (size!19692 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19692 a!3591))))))

(assert (=> start!62692 e!398163))

(assert (=> start!62692 true))

(declare-fun array_inv!15168 (array!40311) Bool)

(assert (=> start!62692 (array_inv!15168 a!3591)))

(declare-fun b!707252 () Bool)

(declare-fun res!470973 () Bool)

(assert (=> b!707252 (=> (not res!470973) (not e!398163))))

(declare-fun acc!652 () List!13257)

(declare-fun noDuplicate!1183 (List!13257) Bool)

(assert (=> b!707252 (= res!470973 (noDuplicate!1183 acc!652))))

(declare-fun b!707253 () Bool)

(declare-fun res!470971 () Bool)

(assert (=> b!707253 (=> (not res!470971) (not e!398163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707253 (= res!470971 (validKeyInArray!0 k0!2824))))

(declare-fun b!707254 () Bool)

(declare-fun res!470974 () Bool)

(assert (=> b!707254 (=> (not res!470974) (not e!398163))))

(declare-fun arrayContainsKey!0 (array!40311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707254 (= res!470974 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!707255 () Bool)

(declare-fun res!470963 () Bool)

(assert (=> b!707255 (=> (not res!470963) (not e!398163))))

(assert (=> b!707255 (= res!470963 (noDuplicate!1183 newAcc!49))))

(declare-fun b!707256 () Bool)

(declare-fun res!470966 () Bool)

(assert (=> b!707256 (=> (not res!470966) (not e!398163))))

(assert (=> b!707256 (= res!470966 (not (contains!3909 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707257 () Bool)

(declare-fun res!470967 () Bool)

(assert (=> b!707257 (=> (not res!470967) (not e!398163))))

(declare-fun -!341 (List!13257 (_ BitVec 64)) List!13257)

(assert (=> b!707257 (= res!470967 (= (-!341 newAcc!49 k0!2824) acc!652))))

(declare-fun b!707258 () Bool)

(declare-fun res!470969 () Bool)

(assert (=> b!707258 (=> (not res!470969) (not e!398163))))

(declare-fun subseq!377 (List!13257 List!13257) Bool)

(assert (=> b!707258 (= res!470969 (subseq!377 acc!652 newAcc!49))))

(declare-fun b!707259 () Bool)

(declare-fun res!470964 () Bool)

(assert (=> b!707259 (=> (not res!470964) (not e!398163))))

(declare-fun arrayNoDuplicates!0 (array!40311 (_ BitVec 32) List!13257) Bool)

(assert (=> b!707259 (= res!470964 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707260 () Bool)

(declare-fun res!470962 () Bool)

(assert (=> b!707260 (=> (not res!470962) (not e!398163))))

(assert (=> b!707260 (= res!470962 (not (contains!3909 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707261 () Bool)

(declare-fun res!470972 () Bool)

(assert (=> b!707261 (=> (not res!470972) (not e!398163))))

(assert (=> b!707261 (= res!470972 (not (contains!3909 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707262 () Bool)

(declare-fun res!470965 () Bool)

(assert (=> b!707262 (=> (not res!470965) (not e!398163))))

(assert (=> b!707262 (= res!470965 (not (contains!3909 acc!652 k0!2824)))))

(declare-fun b!707263 () Bool)

(assert (=> b!707263 (= e!398163 false)))

(declare-fun lt!318087 () Bool)

(assert (=> b!707263 (= lt!318087 (contains!3909 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!62692 res!470968) b!707252))

(assert (= (and b!707252 res!470973) b!707255))

(assert (= (and b!707255 res!470963) b!707256))

(assert (= (and b!707256 res!470966) b!707260))

(assert (= (and b!707260 res!470962) b!707254))

(assert (= (and b!707254 res!470974) b!707262))

(assert (= (and b!707262 res!470965) b!707253))

(assert (= (and b!707253 res!470971) b!707259))

(assert (= (and b!707259 res!470964) b!707258))

(assert (= (and b!707258 res!470969) b!707251))

(assert (= (and b!707251 res!470970) b!707257))

(assert (= (and b!707257 res!470967) b!707261))

(assert (= (and b!707261 res!470972) b!707263))

(declare-fun m!665403 () Bool)

(assert (=> b!707257 m!665403))

(declare-fun m!665405 () Bool)

(assert (=> b!707251 m!665405))

(declare-fun m!665407 () Bool)

(assert (=> b!707255 m!665407))

(declare-fun m!665409 () Bool)

(assert (=> b!707254 m!665409))

(declare-fun m!665411 () Bool)

(assert (=> b!707262 m!665411))

(declare-fun m!665413 () Bool)

(assert (=> b!707260 m!665413))

(declare-fun m!665415 () Bool)

(assert (=> b!707253 m!665415))

(declare-fun m!665417 () Bool)

(assert (=> b!707263 m!665417))

(declare-fun m!665419 () Bool)

(assert (=> b!707259 m!665419))

(declare-fun m!665421 () Bool)

(assert (=> b!707258 m!665421))

(declare-fun m!665423 () Bool)

(assert (=> b!707252 m!665423))

(declare-fun m!665425 () Bool)

(assert (=> b!707261 m!665425))

(declare-fun m!665427 () Bool)

(assert (=> start!62692 m!665427))

(declare-fun m!665429 () Bool)

(assert (=> b!707256 m!665429))

(check-sat (not start!62692) (not b!707257) (not b!707259) (not b!707260) (not b!707254) (not b!707251) (not b!707261) (not b!707258) (not b!707256) (not b!707262) (not b!707252) (not b!707263) (not b!707253) (not b!707255))
(check-sat)
