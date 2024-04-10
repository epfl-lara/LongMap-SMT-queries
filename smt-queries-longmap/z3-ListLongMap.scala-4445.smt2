; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61774 () Bool)

(assert start!61774)

(declare-fun b!691375 () Bool)

(declare-fun res!455752 () Bool)

(declare-fun e!393492 () Bool)

(assert (=> b!691375 (=> (not res!455752) (not e!393492))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39795 0))(
  ( (array!39796 (arr!19066 (Array (_ BitVec 32) (_ BitVec 64))) (size!19451 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39795)

(assert (=> b!691375 (= res!455752 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19451 a!3626))))))

(declare-fun b!691376 () Bool)

(declare-datatypes ((Unit!24382 0))(
  ( (Unit!24383) )
))
(declare-fun e!393489 () Unit!24382)

(declare-fun Unit!24384 () Unit!24382)

(assert (=> b!691376 (= e!393489 Unit!24384)))

(declare-fun b!691377 () Bool)

(assert (=> b!691377 (= e!393492 false)))

(declare-fun lt!316459 () Unit!24382)

(assert (=> b!691377 (= lt!316459 e!393489)))

(declare-fun c!78182 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!691377 (= c!78182 (= (select (arr!19066 a!3626) from!3004) k0!2843))))

(declare-fun b!691378 () Bool)

(declare-fun res!455750 () Bool)

(assert (=> b!691378 (=> (not res!455750) (not e!393492))))

(declare-fun e!393491 () Bool)

(assert (=> b!691378 (= res!455750 e!393491)))

(declare-fun res!455746 () Bool)

(assert (=> b!691378 (=> res!455746 e!393491)))

(declare-fun e!393490 () Bool)

(assert (=> b!691378 (= res!455746 e!393490)))

(declare-fun res!455754 () Bool)

(assert (=> b!691378 (=> (not res!455754) (not e!393490))))

(assert (=> b!691378 (= res!455754 (bvsgt from!3004 i!1382))))

(declare-fun b!691379 () Bool)

(declare-fun res!455748 () Bool)

(assert (=> b!691379 (=> (not res!455748) (not e!393492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691379 (= res!455748 (validKeyInArray!0 k0!2843))))

(declare-fun b!691380 () Bool)

(declare-fun res!455753 () Bool)

(assert (=> b!691380 (=> (not res!455753) (not e!393492))))

(assert (=> b!691380 (= res!455753 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19451 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691381 () Bool)

(declare-fun Unit!24385 () Unit!24382)

(assert (=> b!691381 (= e!393489 Unit!24385)))

(declare-fun arrayContainsKey!0 (array!39795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691381 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316458 () Unit!24382)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39795 (_ BitVec 64) (_ BitVec 32)) Unit!24382)

(assert (=> b!691381 (= lt!316458 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!691381 false))

(declare-fun b!691382 () Bool)

(declare-fun res!455751 () Bool)

(assert (=> b!691382 (=> (not res!455751) (not e!393492))))

(declare-datatypes ((List!13107 0))(
  ( (Nil!13104) (Cons!13103 (h!14148 (_ BitVec 64)) (t!19374 List!13107)) )
))
(declare-fun arrayNoDuplicates!0 (array!39795 (_ BitVec 32) List!13107) Bool)

(assert (=> b!691382 (= res!455751 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13104))))

(declare-fun res!455747 () Bool)

(assert (=> start!61774 (=> (not res!455747) (not e!393492))))

(assert (=> start!61774 (= res!455747 (and (bvslt (size!19451 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19451 a!3626))))))

(assert (=> start!61774 e!393492))

(assert (=> start!61774 true))

(declare-fun array_inv!14862 (array!39795) Bool)

(assert (=> start!61774 (array_inv!14862 a!3626)))

(declare-fun b!691383 () Bool)

(declare-fun acc!681 () List!13107)

(declare-fun contains!3684 (List!13107 (_ BitVec 64)) Bool)

(assert (=> b!691383 (= e!393490 (contains!3684 acc!681 k0!2843))))

(declare-fun b!691384 () Bool)

(declare-fun res!455755 () Bool)

(assert (=> b!691384 (=> (not res!455755) (not e!393492))))

(declare-fun noDuplicate!931 (List!13107) Bool)

(assert (=> b!691384 (= res!455755 (noDuplicate!931 acc!681))))

(declare-fun b!691385 () Bool)

(declare-fun res!455758 () Bool)

(assert (=> b!691385 (=> (not res!455758) (not e!393492))))

(assert (=> b!691385 (= res!455758 (not (contains!3684 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691386 () Bool)

(declare-fun res!455757 () Bool)

(assert (=> b!691386 (=> (not res!455757) (not e!393492))))

(assert (=> b!691386 (= res!455757 (not (contains!3684 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691387 () Bool)

(declare-fun res!455745 () Bool)

(assert (=> b!691387 (=> (not res!455745) (not e!393492))))

(assert (=> b!691387 (= res!455745 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691388 () Bool)

(declare-fun res!455756 () Bool)

(assert (=> b!691388 (=> (not res!455756) (not e!393492))))

(assert (=> b!691388 (= res!455756 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691389 () Bool)

(declare-fun res!455759 () Bool)

(assert (=> b!691389 (=> (not res!455759) (not e!393492))))

(assert (=> b!691389 (= res!455759 (validKeyInArray!0 (select (arr!19066 a!3626) from!3004)))))

(declare-fun b!691390 () Bool)

(declare-fun e!393488 () Bool)

(assert (=> b!691390 (= e!393488 (not (contains!3684 acc!681 k0!2843)))))

(declare-fun b!691391 () Bool)

(assert (=> b!691391 (= e!393491 e!393488)))

(declare-fun res!455749 () Bool)

(assert (=> b!691391 (=> (not res!455749) (not e!393488))))

(assert (=> b!691391 (= res!455749 (bvsle from!3004 i!1382))))

(assert (= (and start!61774 res!455747) b!691384))

(assert (= (and b!691384 res!455755) b!691386))

(assert (= (and b!691386 res!455757) b!691385))

(assert (= (and b!691385 res!455758) b!691378))

(assert (= (and b!691378 res!455754) b!691383))

(assert (= (and b!691378 (not res!455746)) b!691391))

(assert (= (and b!691391 res!455749) b!691390))

(assert (= (and b!691378 res!455750) b!691382))

(assert (= (and b!691382 res!455751) b!691388))

(assert (= (and b!691388 res!455756) b!691375))

(assert (= (and b!691375 res!455752) b!691379))

(assert (= (and b!691379 res!455748) b!691387))

(assert (= (and b!691387 res!455745) b!691380))

(assert (= (and b!691380 res!455753) b!691389))

(assert (= (and b!691389 res!455759) b!691377))

(assert (= (and b!691377 c!78182) b!691381))

(assert (= (and b!691377 (not c!78182)) b!691376))

(declare-fun m!654433 () Bool)

(assert (=> b!691377 m!654433))

(declare-fun m!654435 () Bool)

(assert (=> b!691387 m!654435))

(declare-fun m!654437 () Bool)

(assert (=> b!691383 m!654437))

(declare-fun m!654439 () Bool)

(assert (=> b!691379 m!654439))

(declare-fun m!654441 () Bool)

(assert (=> b!691381 m!654441))

(declare-fun m!654443 () Bool)

(assert (=> b!691381 m!654443))

(declare-fun m!654445 () Bool)

(assert (=> b!691384 m!654445))

(declare-fun m!654447 () Bool)

(assert (=> b!691388 m!654447))

(assert (=> b!691390 m!654437))

(assert (=> b!691389 m!654433))

(assert (=> b!691389 m!654433))

(declare-fun m!654449 () Bool)

(assert (=> b!691389 m!654449))

(declare-fun m!654451 () Bool)

(assert (=> b!691386 m!654451))

(declare-fun m!654453 () Bool)

(assert (=> b!691385 m!654453))

(declare-fun m!654455 () Bool)

(assert (=> b!691382 m!654455))

(declare-fun m!654457 () Bool)

(assert (=> start!61774 m!654457))

(check-sat (not b!691385) (not b!691388) (not b!691386) (not start!61774) (not b!691379) (not b!691384) (not b!691387) (not b!691381) (not b!691382) (not b!691390) (not b!691383) (not b!691389))
