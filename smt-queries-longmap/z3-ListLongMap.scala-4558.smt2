; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63508 () Bool)

(assert start!63508)

(declare-fun b!715373 () Bool)

(declare-fun res!478509 () Bool)

(declare-fun e!401694 () Bool)

(assert (=> b!715373 (=> (not res!478509) (not e!401694))))

(declare-datatypes ((List!13483 0))(
  ( (Nil!13480) (Cons!13479 (h!14524 (_ BitVec 64)) (t!19789 List!13483)) )
))
(declare-fun newAcc!49 () List!13483)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!4005 (List!13483 (_ BitVec 64)) Bool)

(assert (=> b!715373 (= res!478509 (contains!4005 newAcc!49 k0!2824))))

(declare-fun b!715374 () Bool)

(declare-fun res!478512 () Bool)

(assert (=> b!715374 (=> (not res!478512) (not e!401694))))

(declare-datatypes ((array!40533 0))(
  ( (array!40534 (arr!19403 (Array (_ BitVec 32) (_ BitVec 64))) (size!19818 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40533)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715374 (= res!478512 (not (validKeyInArray!0 (select (arr!19403 a!3591) from!2969))))))

(declare-fun res!478525 () Bool)

(assert (=> start!63508 (=> (not res!478525) (not e!401694))))

(assert (=> start!63508 (= res!478525 (and (bvslt (size!19818 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19818 a!3591))))))

(assert (=> start!63508 e!401694))

(assert (=> start!63508 true))

(declare-fun array_inv!15286 (array!40533) Bool)

(assert (=> start!63508 (array_inv!15286 a!3591)))

(declare-fun b!715375 () Bool)

(declare-fun res!478513 () Bool)

(assert (=> b!715375 (=> (not res!478513) (not e!401694))))

(declare-fun acc!652 () List!13483)

(assert (=> b!715375 (= res!478513 (not (contains!4005 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715376 () Bool)

(declare-fun res!478527 () Bool)

(assert (=> b!715376 (=> (not res!478527) (not e!401694))))

(assert (=> b!715376 (= res!478527 (not (contains!4005 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715377 () Bool)

(declare-fun res!478514 () Bool)

(assert (=> b!715377 (=> (not res!478514) (not e!401694))))

(declare-fun arrayNoDuplicates!0 (array!40533 (_ BitVec 32) List!13483) Bool)

(assert (=> b!715377 (= res!478514 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715378 () Bool)

(declare-fun res!478511 () Bool)

(assert (=> b!715378 (=> (not res!478511) (not e!401694))))

(assert (=> b!715378 (= res!478511 (not (contains!4005 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715379 () Bool)

(declare-fun res!478520 () Bool)

(assert (=> b!715379 (=> (not res!478520) (not e!401694))))

(declare-fun arrayContainsKey!0 (array!40533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715379 (= res!478520 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715380 () Bool)

(declare-fun res!478522 () Bool)

(assert (=> b!715380 (=> (not res!478522) (not e!401694))))

(assert (=> b!715380 (= res!478522 (not (contains!4005 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715381 () Bool)

(declare-fun res!478517 () Bool)

(assert (=> b!715381 (=> (not res!478517) (not e!401694))))

(declare-fun noDuplicate!1274 (List!13483) Bool)

(assert (=> b!715381 (= res!478517 (noDuplicate!1274 acc!652))))

(declare-fun b!715382 () Bool)

(declare-fun res!478518 () Bool)

(assert (=> b!715382 (=> (not res!478518) (not e!401694))))

(assert (=> b!715382 (= res!478518 (not (contains!4005 acc!652 k0!2824)))))

(declare-fun b!715383 () Bool)

(assert (=> b!715383 (= e!401694 (bvsge (bvsub (size!19818 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) (bvsub (size!19818 a!3591) from!2969)))))

(declare-fun b!715384 () Bool)

(declare-fun res!478524 () Bool)

(assert (=> b!715384 (=> (not res!478524) (not e!401694))))

(assert (=> b!715384 (= res!478524 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!715385 () Bool)

(declare-fun res!478516 () Bool)

(assert (=> b!715385 (=> (not res!478516) (not e!401694))))

(declare-fun -!432 (List!13483 (_ BitVec 64)) List!13483)

(assert (=> b!715385 (= res!478516 (= (-!432 newAcc!49 k0!2824) acc!652))))

(declare-fun b!715386 () Bool)

(declare-fun res!478510 () Bool)

(assert (=> b!715386 (=> (not res!478510) (not e!401694))))

(assert (=> b!715386 (= res!478510 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19818 a!3591)))))

(declare-fun b!715387 () Bool)

(declare-fun res!478521 () Bool)

(assert (=> b!715387 (=> (not res!478521) (not e!401694))))

(declare-fun subseq!467 (List!13483 List!13483) Bool)

(assert (=> b!715387 (= res!478521 (subseq!467 acc!652 newAcc!49))))

(declare-fun b!715388 () Bool)

(declare-fun res!478515 () Bool)

(assert (=> b!715388 (=> (not res!478515) (not e!401694))))

(assert (=> b!715388 (= res!478515 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715389 () Bool)

(declare-fun res!478519 () Bool)

(assert (=> b!715389 (=> (not res!478519) (not e!401694))))

(assert (=> b!715389 (= res!478519 (noDuplicate!1274 newAcc!49))))

(declare-fun b!715390 () Bool)

(declare-fun res!478523 () Bool)

(assert (=> b!715390 (=> (not res!478523) (not e!401694))))

(assert (=> b!715390 (= res!478523 (validKeyInArray!0 k0!2824))))

(declare-fun b!715391 () Bool)

(declare-fun res!478526 () Bool)

(assert (=> b!715391 (=> (not res!478526) (not e!401694))))

(assert (=> b!715391 (= res!478526 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (= (and start!63508 res!478525) b!715381))

(assert (= (and b!715381 res!478517) b!715389))

(assert (= (and b!715389 res!478519) b!715375))

(assert (= (and b!715375 res!478513) b!715378))

(assert (= (and b!715378 res!478511) b!715384))

(assert (= (and b!715384 res!478524) b!715382))

(assert (= (and b!715382 res!478518) b!715390))

(assert (= (and b!715390 res!478523) b!715377))

(assert (= (and b!715377 res!478514) b!715387))

(assert (= (and b!715387 res!478521) b!715373))

(assert (= (and b!715373 res!478509) b!715385))

(assert (= (and b!715385 res!478516) b!715376))

(assert (= (and b!715376 res!478527) b!715380))

(assert (= (and b!715380 res!478522) b!715386))

(assert (= (and b!715386 res!478510) b!715374))

(assert (= (and b!715374 res!478512) b!715391))

(assert (= (and b!715391 res!478526) b!715379))

(assert (= (and b!715379 res!478520) b!715388))

(assert (= (and b!715388 res!478515) b!715383))

(declare-fun m!671049 () Bool)

(assert (=> b!715373 m!671049))

(declare-fun m!671051 () Bool)

(assert (=> b!715375 m!671051))

(declare-fun m!671053 () Bool)

(assert (=> b!715376 m!671053))

(declare-fun m!671055 () Bool)

(assert (=> b!715390 m!671055))

(declare-fun m!671057 () Bool)

(assert (=> b!715387 m!671057))

(declare-fun m!671059 () Bool)

(assert (=> b!715380 m!671059))

(declare-fun m!671061 () Bool)

(assert (=> start!63508 m!671061))

(declare-fun m!671063 () Bool)

(assert (=> b!715384 m!671063))

(declare-fun m!671065 () Bool)

(assert (=> b!715379 m!671065))

(declare-fun m!671067 () Bool)

(assert (=> b!715377 m!671067))

(declare-fun m!671069 () Bool)

(assert (=> b!715381 m!671069))

(declare-fun m!671071 () Bool)

(assert (=> b!715382 m!671071))

(declare-fun m!671073 () Bool)

(assert (=> b!715378 m!671073))

(declare-fun m!671075 () Bool)

(assert (=> b!715388 m!671075))

(declare-fun m!671077 () Bool)

(assert (=> b!715385 m!671077))

(declare-fun m!671079 () Bool)

(assert (=> b!715389 m!671079))

(declare-fun m!671081 () Bool)

(assert (=> b!715374 m!671081))

(assert (=> b!715374 m!671081))

(declare-fun m!671083 () Bool)

(assert (=> b!715374 m!671083))

(check-sat (not b!715375) (not start!63508) (not b!715381) (not b!715384) (not b!715378) (not b!715390) (not b!715389) (not b!715382) (not b!715376) (not b!715387) (not b!715388) (not b!715385) (not b!715380) (not b!715373) (not b!715379) (not b!715377) (not b!715374))
(check-sat)
