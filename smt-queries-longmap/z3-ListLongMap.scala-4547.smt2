; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63346 () Bool)

(assert start!63346)

(declare-fun b!713354 () Bool)

(declare-fun res!476609 () Bool)

(declare-fun e!401088 () Bool)

(assert (=> b!713354 (=> (not res!476609) (not e!401088))))

(declare-datatypes ((List!13450 0))(
  ( (Nil!13447) (Cons!13446 (h!14491 (_ BitVec 64)) (t!19756 List!13450)) )
))
(declare-fun acc!652 () List!13450)

(declare-fun contains!3972 (List!13450 (_ BitVec 64)) Bool)

(assert (=> b!713354 (= res!476609 (not (contains!3972 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713355 () Bool)

(declare-fun res!476604 () Bool)

(assert (=> b!713355 (=> (not res!476604) (not e!401088))))

(declare-fun newAcc!49 () List!13450)

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!713355 (= res!476604 (contains!3972 newAcc!49 k0!2824))))

(declare-fun b!713356 () Bool)

(declare-fun res!476610 () Bool)

(assert (=> b!713356 (=> (not res!476610) (not e!401088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713356 (= res!476610 (validKeyInArray!0 k0!2824))))

(declare-fun res!476613 () Bool)

(assert (=> start!63346 (=> (not res!476613) (not e!401088))))

(declare-datatypes ((array!40461 0))(
  ( (array!40462 (arr!19370 (Array (_ BitVec 32) (_ BitVec 64))) (size!19782 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40461)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63346 (= res!476613 (and (bvslt (size!19782 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19782 a!3591))))))

(assert (=> start!63346 e!401088))

(assert (=> start!63346 true))

(declare-fun array_inv!15253 (array!40461) Bool)

(assert (=> start!63346 (array_inv!15253 a!3591)))

(declare-fun b!713357 () Bool)

(declare-fun res!476612 () Bool)

(assert (=> b!713357 (=> (not res!476612) (not e!401088))))

(declare-fun arrayNoDuplicates!0 (array!40461 (_ BitVec 32) List!13450) Bool)

(assert (=> b!713357 (= res!476612 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713358 () Bool)

(declare-fun res!476615 () Bool)

(assert (=> b!713358 (=> (not res!476615) (not e!401088))))

(declare-fun subseq!434 (List!13450 List!13450) Bool)

(assert (=> b!713358 (= res!476615 (subseq!434 acc!652 newAcc!49))))

(declare-fun b!713359 () Bool)

(declare-fun res!476605 () Bool)

(assert (=> b!713359 (=> (not res!476605) (not e!401088))))

(declare-fun noDuplicate!1241 (List!13450) Bool)

(assert (=> b!713359 (= res!476605 (noDuplicate!1241 newAcc!49))))

(declare-fun b!713360 () Bool)

(assert (=> b!713360 (= e!401088 false)))

(declare-fun lt!318452 () Bool)

(assert (=> b!713360 (= lt!318452 (contains!3972 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713361 () Bool)

(declare-fun res!476608 () Bool)

(assert (=> b!713361 (=> (not res!476608) (not e!401088))))

(assert (=> b!713361 (= res!476608 (not (contains!3972 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713362 () Bool)

(declare-fun res!476607 () Bool)

(assert (=> b!713362 (=> (not res!476607) (not e!401088))))

(declare-fun arrayContainsKey!0 (array!40461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713362 (= res!476607 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!713363 () Bool)

(declare-fun res!476614 () Bool)

(assert (=> b!713363 (=> (not res!476614) (not e!401088))))

(declare-fun -!399 (List!13450 (_ BitVec 64)) List!13450)

(assert (=> b!713363 (= res!476614 (= (-!399 newAcc!49 k0!2824) acc!652))))

(declare-fun b!713364 () Bool)

(declare-fun res!476616 () Bool)

(assert (=> b!713364 (=> (not res!476616) (not e!401088))))

(assert (=> b!713364 (= res!476616 (not (contains!3972 acc!652 k0!2824)))))

(declare-fun b!713365 () Bool)

(declare-fun res!476611 () Bool)

(assert (=> b!713365 (=> (not res!476611) (not e!401088))))

(assert (=> b!713365 (= res!476611 (noDuplicate!1241 acc!652))))

(declare-fun b!713366 () Bool)

(declare-fun res!476606 () Bool)

(assert (=> b!713366 (=> (not res!476606) (not e!401088))))

(assert (=> b!713366 (= res!476606 (not (contains!3972 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!63346 res!476613) b!713365))

(assert (= (and b!713365 res!476611) b!713359))

(assert (= (and b!713359 res!476605) b!713354))

(assert (= (and b!713354 res!476609) b!713361))

(assert (= (and b!713361 res!476608) b!713362))

(assert (= (and b!713362 res!476607) b!713364))

(assert (= (and b!713364 res!476616) b!713356))

(assert (= (and b!713356 res!476610) b!713357))

(assert (= (and b!713357 res!476612) b!713358))

(assert (= (and b!713358 res!476615) b!713355))

(assert (= (and b!713355 res!476604) b!713363))

(assert (= (and b!713363 res!476614) b!713366))

(assert (= (and b!713366 res!476606) b!713360))

(declare-fun m!669609 () Bool)

(assert (=> b!713361 m!669609))

(declare-fun m!669611 () Bool)

(assert (=> b!713366 m!669611))

(declare-fun m!669613 () Bool)

(assert (=> b!713359 m!669613))

(declare-fun m!669615 () Bool)

(assert (=> b!713363 m!669615))

(declare-fun m!669617 () Bool)

(assert (=> b!713362 m!669617))

(declare-fun m!669619 () Bool)

(assert (=> start!63346 m!669619))

(declare-fun m!669621 () Bool)

(assert (=> b!713360 m!669621))

(declare-fun m!669623 () Bool)

(assert (=> b!713364 m!669623))

(declare-fun m!669625 () Bool)

(assert (=> b!713356 m!669625))

(declare-fun m!669627 () Bool)

(assert (=> b!713355 m!669627))

(declare-fun m!669629 () Bool)

(assert (=> b!713354 m!669629))

(declare-fun m!669631 () Bool)

(assert (=> b!713358 m!669631))

(declare-fun m!669633 () Bool)

(assert (=> b!713365 m!669633))

(declare-fun m!669635 () Bool)

(assert (=> b!713357 m!669635))

(check-sat (not b!713358) (not b!713364) (not b!713359) (not b!713361) (not b!713356) (not b!713360) (not b!713362) (not b!713365) (not b!713363) (not b!713366) (not b!713357) (not b!713354) (not b!713355) (not start!63346))
(check-sat)
