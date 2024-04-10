; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63432 () Bool)

(assert start!63432)

(declare-fun b!714424 () Bool)

(declare-fun res!477455 () Bool)

(declare-fun e!401561 () Bool)

(assert (=> b!714424 (=> (not res!477455) (not e!401561))))

(declare-datatypes ((List!13425 0))(
  ( (Nil!13422) (Cons!13421 (h!14466 (_ BitVec 64)) (t!19740 List!13425)) )
))
(declare-fun acc!652 () List!13425)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!4002 (List!13425 (_ BitVec 64)) Bool)

(assert (=> b!714424 (= res!477455 (not (contains!4002 acc!652 k0!2824)))))

(declare-fun b!714425 () Bool)

(declare-fun res!477461 () Bool)

(assert (=> b!714425 (=> (not res!477461) (not e!401561))))

(declare-fun newAcc!49 () List!13425)

(declare-fun noDuplicate!1249 (List!13425) Bool)

(assert (=> b!714425 (= res!477461 (noDuplicate!1249 newAcc!49))))

(declare-fun b!714426 () Bool)

(declare-fun res!477459 () Bool)

(assert (=> b!714426 (=> (not res!477459) (not e!401561))))

(declare-datatypes ((array!40491 0))(
  ( (array!40492 (arr!19384 (Array (_ BitVec 32) (_ BitVec 64))) (size!19797 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40491)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40491 (_ BitVec 32) List!13425) Bool)

(assert (=> b!714426 (= res!477459 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!714427 () Bool)

(declare-fun res!477465 () Bool)

(assert (=> b!714427 (=> (not res!477465) (not e!401561))))

(assert (=> b!714427 (= res!477465 (not (contains!4002 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!477463 () Bool)

(assert (=> start!63432 (=> (not res!477463) (not e!401561))))

(assert (=> start!63432 (= res!477463 (and (bvslt (size!19797 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19797 a!3591))))))

(assert (=> start!63432 e!401561))

(assert (=> start!63432 true))

(declare-fun array_inv!15180 (array!40491) Bool)

(assert (=> start!63432 (array_inv!15180 a!3591)))

(declare-fun b!714428 () Bool)

(declare-fun res!477454 () Bool)

(assert (=> b!714428 (=> (not res!477454) (not e!401561))))

(declare-fun -!412 (List!13425 (_ BitVec 64)) List!13425)

(assert (=> b!714428 (= res!477454 (= (-!412 newAcc!49 k0!2824) acc!652))))

(declare-fun b!714429 () Bool)

(assert (=> b!714429 (= e!401561 false)))

(declare-fun lt!318770 () Bool)

(assert (=> b!714429 (= lt!318770 (contains!4002 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714430 () Bool)

(declare-fun res!477458 () Bool)

(assert (=> b!714430 (=> (not res!477458) (not e!401561))))

(assert (=> b!714430 (= res!477458 (noDuplicate!1249 acc!652))))

(declare-fun b!714431 () Bool)

(declare-fun res!477466 () Bool)

(assert (=> b!714431 (=> (not res!477466) (not e!401561))))

(declare-fun arrayContainsKey!0 (array!40491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714431 (= res!477466 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!714432 () Bool)

(declare-fun res!477457 () Bool)

(assert (=> b!714432 (=> (not res!477457) (not e!401561))))

(assert (=> b!714432 (= res!477457 (not (contains!4002 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714433 () Bool)

(declare-fun res!477462 () Bool)

(assert (=> b!714433 (=> (not res!477462) (not e!401561))))

(assert (=> b!714433 (= res!477462 (not (contains!4002 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714434 () Bool)

(declare-fun res!477460 () Bool)

(assert (=> b!714434 (=> (not res!477460) (not e!401561))))

(declare-fun subseq!447 (List!13425 List!13425) Bool)

(assert (=> b!714434 (= res!477460 (subseq!447 acc!652 newAcc!49))))

(declare-fun b!714435 () Bool)

(declare-fun res!477456 () Bool)

(assert (=> b!714435 (=> (not res!477456) (not e!401561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714435 (= res!477456 (validKeyInArray!0 k0!2824))))

(declare-fun b!714436 () Bool)

(declare-fun res!477464 () Bool)

(assert (=> b!714436 (=> (not res!477464) (not e!401561))))

(assert (=> b!714436 (= res!477464 (contains!4002 newAcc!49 k0!2824))))

(assert (= (and start!63432 res!477463) b!714430))

(assert (= (and b!714430 res!477458) b!714425))

(assert (= (and b!714425 res!477461) b!714427))

(assert (= (and b!714427 res!477465) b!714432))

(assert (= (and b!714432 res!477457) b!714431))

(assert (= (and b!714431 res!477466) b!714424))

(assert (= (and b!714424 res!477455) b!714435))

(assert (= (and b!714435 res!477456) b!714426))

(assert (= (and b!714426 res!477459) b!714434))

(assert (= (and b!714434 res!477460) b!714436))

(assert (= (and b!714436 res!477464) b!714428))

(assert (= (and b!714428 res!477454) b!714433))

(assert (= (and b!714433 res!477462) b!714429))

(declare-fun m!670961 () Bool)

(assert (=> b!714433 m!670961))

(declare-fun m!670963 () Bool)

(assert (=> b!714428 m!670963))

(declare-fun m!670965 () Bool)

(assert (=> b!714434 m!670965))

(declare-fun m!670967 () Bool)

(assert (=> b!714425 m!670967))

(declare-fun m!670969 () Bool)

(assert (=> b!714426 m!670969))

(declare-fun m!670971 () Bool)

(assert (=> b!714436 m!670971))

(declare-fun m!670973 () Bool)

(assert (=> b!714427 m!670973))

(declare-fun m!670975 () Bool)

(assert (=> b!714424 m!670975))

(declare-fun m!670977 () Bool)

(assert (=> b!714432 m!670977))

(declare-fun m!670979 () Bool)

(assert (=> b!714430 m!670979))

(declare-fun m!670981 () Bool)

(assert (=> b!714435 m!670981))

(declare-fun m!670983 () Bool)

(assert (=> start!63432 m!670983))

(declare-fun m!670985 () Bool)

(assert (=> b!714431 m!670985))

(declare-fun m!670987 () Bool)

(assert (=> b!714429 m!670987))

(check-sat (not b!714430) (not b!714426) (not b!714429) (not b!714425) (not b!714427) (not b!714434) (not b!714436) (not start!63432) (not b!714424) (not b!714428) (not b!714432) (not b!714431) (not b!714433) (not b!714435))
(check-sat)
