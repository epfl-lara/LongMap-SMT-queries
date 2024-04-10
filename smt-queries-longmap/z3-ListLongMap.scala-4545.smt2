; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63348 () Bool)

(assert start!63348)

(declare-fun b!713452 () Bool)

(declare-fun res!476540 () Bool)

(declare-fun e!401254 () Bool)

(assert (=> b!713452 (=> (not res!476540) (not e!401254))))

(declare-datatypes ((array!40452 0))(
  ( (array!40453 (arr!19366 (Array (_ BitVec 32) (_ BitVec 64))) (size!19777 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40452)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13407 0))(
  ( (Nil!13404) (Cons!13403 (h!14448 (_ BitVec 64)) (t!19722 List!13407)) )
))
(declare-fun acc!652 () List!13407)

(declare-fun arrayNoDuplicates!0 (array!40452 (_ BitVec 32) List!13407) Bool)

(assert (=> b!713452 (= res!476540 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713453 () Bool)

(declare-fun res!476548 () Bool)

(assert (=> b!713453 (=> (not res!476548) (not e!401254))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3984 (List!13407 (_ BitVec 64)) Bool)

(assert (=> b!713453 (= res!476548 (not (contains!3984 acc!652 k0!2824)))))

(declare-fun b!713454 () Bool)

(declare-fun res!476538 () Bool)

(assert (=> b!713454 (=> (not res!476538) (not e!401254))))

(declare-fun arrayContainsKey!0 (array!40452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713454 (= res!476538 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!713455 () Bool)

(assert (=> b!713455 (= e!401254 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!713456 () Bool)

(declare-fun res!476547 () Bool)

(assert (=> b!713456 (=> (not res!476547) (not e!401254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713456 (= res!476547 (not (validKeyInArray!0 (select (arr!19366 a!3591) from!2969))))))

(declare-fun b!713457 () Bool)

(declare-fun res!476542 () Bool)

(assert (=> b!713457 (=> (not res!476542) (not e!401254))))

(declare-fun newAcc!49 () List!13407)

(declare-fun subseq!429 (List!13407 List!13407) Bool)

(assert (=> b!713457 (= res!476542 (subseq!429 acc!652 newAcc!49))))

(declare-fun res!476546 () Bool)

(assert (=> start!63348 (=> (not res!476546) (not e!401254))))

(assert (=> start!63348 (= res!476546 (and (bvslt (size!19777 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19777 a!3591))))))

(assert (=> start!63348 e!401254))

(assert (=> start!63348 true))

(declare-fun array_inv!15162 (array!40452) Bool)

(assert (=> start!63348 (array_inv!15162 a!3591)))

(declare-fun b!713458 () Bool)

(declare-fun res!476543 () Bool)

(assert (=> b!713458 (=> (not res!476543) (not e!401254))))

(declare-fun noDuplicate!1231 (List!13407) Bool)

(assert (=> b!713458 (= res!476543 (noDuplicate!1231 newAcc!49))))

(declare-fun b!713459 () Bool)

(declare-fun res!476551 () Bool)

(assert (=> b!713459 (=> (not res!476551) (not e!401254))))

(assert (=> b!713459 (= res!476551 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19777 a!3591)))))

(declare-fun b!713460 () Bool)

(declare-fun res!476545 () Bool)

(assert (=> b!713460 (=> (not res!476545) (not e!401254))))

(assert (=> b!713460 (= res!476545 (not (contains!3984 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713461 () Bool)

(declare-fun res!476536 () Bool)

(assert (=> b!713461 (=> (not res!476536) (not e!401254))))

(assert (=> b!713461 (= res!476536 (contains!3984 newAcc!49 k0!2824))))

(declare-fun b!713462 () Bool)

(declare-fun res!476544 () Bool)

(assert (=> b!713462 (=> (not res!476544) (not e!401254))))

(assert (=> b!713462 (= res!476544 (not (contains!3984 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713463 () Bool)

(declare-fun res!476539 () Bool)

(assert (=> b!713463 (=> (not res!476539) (not e!401254))))

(assert (=> b!713463 (= res!476539 (validKeyInArray!0 k0!2824))))

(declare-fun b!713464 () Bool)

(declare-fun res!476537 () Bool)

(assert (=> b!713464 (=> (not res!476537) (not e!401254))))

(assert (=> b!713464 (= res!476537 (not (contains!3984 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713465 () Bool)

(declare-fun res!476541 () Bool)

(assert (=> b!713465 (=> (not res!476541) (not e!401254))))

(declare-fun -!394 (List!13407 (_ BitVec 64)) List!13407)

(assert (=> b!713465 (= res!476541 (= (-!394 newAcc!49 k0!2824) acc!652))))

(declare-fun b!713466 () Bool)

(declare-fun res!476550 () Bool)

(assert (=> b!713466 (=> (not res!476550) (not e!401254))))

(assert (=> b!713466 (= res!476550 (not (contains!3984 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713467 () Bool)

(declare-fun res!476549 () Bool)

(assert (=> b!713467 (=> (not res!476549) (not e!401254))))

(assert (=> b!713467 (= res!476549 (noDuplicate!1231 acc!652))))

(assert (= (and start!63348 res!476546) b!713467))

(assert (= (and b!713467 res!476549) b!713458))

(assert (= (and b!713458 res!476543) b!713466))

(assert (= (and b!713466 res!476550) b!713460))

(assert (= (and b!713460 res!476545) b!713454))

(assert (= (and b!713454 res!476538) b!713453))

(assert (= (and b!713453 res!476548) b!713463))

(assert (= (and b!713463 res!476539) b!713452))

(assert (= (and b!713452 res!476540) b!713457))

(assert (= (and b!713457 res!476542) b!713461))

(assert (= (and b!713461 res!476536) b!713465))

(assert (= (and b!713465 res!476541) b!713464))

(assert (= (and b!713464 res!476537) b!713462))

(assert (= (and b!713462 res!476544) b!713459))

(assert (= (and b!713459 res!476551) b!713456))

(assert (= (and b!713456 res!476547) b!713455))

(declare-fun m!670251 () Bool)

(assert (=> start!63348 m!670251))

(declare-fun m!670253 () Bool)

(assert (=> b!713462 m!670253))

(declare-fun m!670255 () Bool)

(assert (=> b!713465 m!670255))

(declare-fun m!670257 () Bool)

(assert (=> b!713456 m!670257))

(assert (=> b!713456 m!670257))

(declare-fun m!670259 () Bool)

(assert (=> b!713456 m!670259))

(declare-fun m!670261 () Bool)

(assert (=> b!713464 m!670261))

(declare-fun m!670263 () Bool)

(assert (=> b!713457 m!670263))

(declare-fun m!670265 () Bool)

(assert (=> b!713466 m!670265))

(declare-fun m!670267 () Bool)

(assert (=> b!713463 m!670267))

(declare-fun m!670269 () Bool)

(assert (=> b!713467 m!670269))

(declare-fun m!670271 () Bool)

(assert (=> b!713454 m!670271))

(declare-fun m!670273 () Bool)

(assert (=> b!713452 m!670273))

(declare-fun m!670275 () Bool)

(assert (=> b!713461 m!670275))

(declare-fun m!670277 () Bool)

(assert (=> b!713453 m!670277))

(declare-fun m!670279 () Bool)

(assert (=> b!713460 m!670279))

(declare-fun m!670281 () Bool)

(assert (=> b!713458 m!670281))

(check-sat (not b!713458) (not b!713463) (not start!63348) (not b!713466) (not b!713460) (not b!713467) (not b!713457) (not b!713462) (not b!713461) (not b!713453) (not b!713452) (not b!713465) (not b!713456) (not b!713464) (not b!713454))
(check-sat)
