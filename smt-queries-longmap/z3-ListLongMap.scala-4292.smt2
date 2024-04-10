; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59782 () Bool)

(assert start!59782)

(declare-fun b!660384 () Bool)

(declare-fun res!428452 () Bool)

(declare-fun e!379487 () Bool)

(assert (=> b!660384 (=> (not res!428452) (not e!379487))))

(declare-datatypes ((List!12648 0))(
  ( (Nil!12645) (Cons!12644 (h!13689 (_ BitVec 64)) (t!18876 List!12648)) )
))
(declare-fun acc!681 () List!12648)

(declare-fun noDuplicate!472 (List!12648) Bool)

(assert (=> b!660384 (= res!428452 (noDuplicate!472 acc!681))))

(declare-fun b!660385 () Bool)

(declare-fun res!428449 () Bool)

(assert (=> b!660385 (=> (not res!428449) (not e!379487))))

(declare-fun e!379488 () Bool)

(assert (=> b!660385 (= res!428449 e!379488)))

(declare-fun res!428455 () Bool)

(assert (=> b!660385 (=> res!428455 e!379488)))

(declare-fun e!379489 () Bool)

(assert (=> b!660385 (= res!428455 e!379489)))

(declare-fun res!428456 () Bool)

(assert (=> b!660385 (=> (not res!428456) (not e!379489))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660385 (= res!428456 (bvsgt from!3004 i!1382))))

(declare-fun b!660386 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3225 (List!12648 (_ BitVec 64)) Bool)

(assert (=> b!660386 (= e!379489 (contains!3225 acc!681 k0!2843))))

(declare-fun b!660387 () Bool)

(declare-fun e!379491 () Bool)

(assert (=> b!660387 (= e!379488 e!379491)))

(declare-fun res!428448 () Bool)

(assert (=> b!660387 (=> (not res!428448) (not e!379491))))

(assert (=> b!660387 (= res!428448 (bvsle from!3004 i!1382))))

(declare-fun b!660388 () Bool)

(declare-fun res!428454 () Bool)

(assert (=> b!660388 (=> (not res!428454) (not e!379487))))

(assert (=> b!660388 (= res!428454 (not (contains!3225 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660389 () Bool)

(declare-fun res!428451 () Bool)

(assert (=> b!660389 (=> (not res!428451) (not e!379487))))

(declare-datatypes ((array!38829 0))(
  ( (array!38830 (arr!18607 (Array (_ BitVec 32) (_ BitVec 64))) (size!18971 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38829)

(declare-fun arrayNoDuplicates!0 (array!38829 (_ BitVec 32) List!12648) Bool)

(assert (=> b!660389 (= res!428451 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12645))))

(declare-fun b!660390 () Bool)

(assert (=> b!660390 (= e!379487 false)))

(declare-fun lt!308779 () Bool)

(assert (=> b!660390 (= lt!308779 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660391 () Bool)

(assert (=> b!660391 (= e!379491 (not (contains!3225 acc!681 k0!2843)))))

(declare-fun b!660392 () Bool)

(declare-fun res!428453 () Bool)

(assert (=> b!660392 (=> (not res!428453) (not e!379487))))

(assert (=> b!660392 (= res!428453 (not (contains!3225 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!428450 () Bool)

(assert (=> start!59782 (=> (not res!428450) (not e!379487))))

(assert (=> start!59782 (= res!428450 (and (bvslt (size!18971 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18971 a!3626))))))

(assert (=> start!59782 e!379487))

(assert (=> start!59782 true))

(declare-fun array_inv!14403 (array!38829) Bool)

(assert (=> start!59782 (array_inv!14403 a!3626)))

(assert (= (and start!59782 res!428450) b!660384))

(assert (= (and b!660384 res!428452) b!660392))

(assert (= (and b!660392 res!428453) b!660388))

(assert (= (and b!660388 res!428454) b!660385))

(assert (= (and b!660385 res!428456) b!660386))

(assert (= (and b!660385 (not res!428455)) b!660387))

(assert (= (and b!660387 res!428448) b!660391))

(assert (= (and b!660385 res!428449) b!660389))

(assert (= (and b!660389 res!428451) b!660390))

(declare-fun m!633091 () Bool)

(assert (=> b!660392 m!633091))

(declare-fun m!633093 () Bool)

(assert (=> b!660389 m!633093))

(declare-fun m!633095 () Bool)

(assert (=> b!660384 m!633095))

(declare-fun m!633097 () Bool)

(assert (=> b!660390 m!633097))

(declare-fun m!633099 () Bool)

(assert (=> b!660386 m!633099))

(assert (=> b!660391 m!633099))

(declare-fun m!633101 () Bool)

(assert (=> start!59782 m!633101))

(declare-fun m!633103 () Bool)

(assert (=> b!660388 m!633103))

(check-sat (not b!660392) (not b!660386) (not b!660388) (not b!660391) (not b!660384) (not b!660390) (not b!660389) (not start!59782))
(check-sat)
