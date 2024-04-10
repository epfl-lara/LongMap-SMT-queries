; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63508 () Bool)

(assert start!63508)

(declare-fun b!715352 () Bool)

(declare-fun res!478330 () Bool)

(declare-fun e!401855 () Bool)

(assert (=> b!715352 (=> (not res!478330) (not e!401855))))

(declare-datatypes ((array!40522 0))(
  ( (array!40523 (arr!19398 (Array (_ BitVec 32) (_ BitVec 64))) (size!19814 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40522)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715352 (= res!478330 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun res!478338 () Bool)

(assert (=> start!63508 (=> (not res!478338) (not e!401855))))

(assert (=> start!63508 (= res!478338 (and (bvslt (size!19814 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19814 a!3591))))))

(assert (=> start!63508 e!401855))

(assert (=> start!63508 true))

(declare-fun array_inv!15194 (array!40522) Bool)

(assert (=> start!63508 (array_inv!15194 a!3591)))

(declare-fun b!715353 () Bool)

(declare-fun res!478332 () Bool)

(assert (=> b!715353 (=> (not res!478332) (not e!401855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715353 (= res!478332 (validKeyInArray!0 k!2824))))

(declare-fun b!715354 () Bool)

(declare-fun res!478334 () Bool)

(assert (=> b!715354 (=> (not res!478334) (not e!401855))))

(declare-datatypes ((List!13439 0))(
  ( (Nil!13436) (Cons!13435 (h!14480 (_ BitVec 64)) (t!19754 List!13439)) )
))
(declare-fun newAcc!49 () List!13439)

(declare-fun contains!4016 (List!13439 (_ BitVec 64)) Bool)

(assert (=> b!715354 (= res!478334 (not (contains!4016 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715355 () Bool)

(assert (=> b!715355 (= e!401855 false)))

(declare-fun acc!652 () List!13439)

(declare-fun lt!318836 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40522 (_ BitVec 32) List!13439) Bool)

(assert (=> b!715355 (= lt!318836 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715356 () Bool)

(declare-fun res!478327 () Bool)

(assert (=> b!715356 (=> (not res!478327) (not e!401855))))

(declare-fun noDuplicate!1263 (List!13439) Bool)

(assert (=> b!715356 (= res!478327 (noDuplicate!1263 newAcc!49))))

(declare-fun b!715357 () Bool)

(declare-fun res!478325 () Bool)

(assert (=> b!715357 (=> (not res!478325) (not e!401855))))

(assert (=> b!715357 (= res!478325 (not (contains!4016 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715358 () Bool)

(declare-fun res!478333 () Bool)

(assert (=> b!715358 (=> (not res!478333) (not e!401855))))

(assert (=> b!715358 (= res!478333 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!715359 () Bool)

(declare-fun res!478337 () Bool)

(assert (=> b!715359 (=> (not res!478337) (not e!401855))))

(assert (=> b!715359 (= res!478337 (not (contains!4016 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715360 () Bool)

(declare-fun res!478326 () Bool)

(assert (=> b!715360 (=> (not res!478326) (not e!401855))))

(declare-fun subseq!461 (List!13439 List!13439) Bool)

(assert (=> b!715360 (= res!478326 (subseq!461 acc!652 newAcc!49))))

(declare-fun b!715361 () Bool)

(declare-fun res!478324 () Bool)

(assert (=> b!715361 (=> (not res!478324) (not e!401855))))

(assert (=> b!715361 (= res!478324 (not (contains!4016 acc!652 k!2824)))))

(declare-fun b!715362 () Bool)

(declare-fun res!478329 () Bool)

(assert (=> b!715362 (=> (not res!478329) (not e!401855))))

(assert (=> b!715362 (= res!478329 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19814 a!3591)))))

(declare-fun b!715363 () Bool)

(declare-fun res!478328 () Bool)

(assert (=> b!715363 (=> (not res!478328) (not e!401855))))

(assert (=> b!715363 (= res!478328 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715364 () Bool)

(declare-fun res!478339 () Bool)

(assert (=> b!715364 (=> (not res!478339) (not e!401855))))

(assert (=> b!715364 (= res!478339 (not (contains!4016 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715365 () Bool)

(declare-fun res!478323 () Bool)

(assert (=> b!715365 (=> (not res!478323) (not e!401855))))

(declare-fun -!426 (List!13439 (_ BitVec 64)) List!13439)

(assert (=> b!715365 (= res!478323 (= (-!426 newAcc!49 k!2824) acc!652))))

(declare-fun b!715366 () Bool)

(declare-fun res!478335 () Bool)

(assert (=> b!715366 (=> (not res!478335) (not e!401855))))

(assert (=> b!715366 (= res!478335 (not (validKeyInArray!0 (select (arr!19398 a!3591) from!2969))))))

(declare-fun b!715367 () Bool)

(declare-fun res!478331 () Bool)

(assert (=> b!715367 (=> (not res!478331) (not e!401855))))

(assert (=> b!715367 (= res!478331 (noDuplicate!1263 acc!652))))

(declare-fun b!715368 () Bool)

(declare-fun res!478336 () Bool)

(assert (=> b!715368 (=> (not res!478336) (not e!401855))))

(assert (=> b!715368 (= res!478336 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715369 () Bool)

(declare-fun res!478322 () Bool)

(assert (=> b!715369 (=> (not res!478322) (not e!401855))))

(assert (=> b!715369 (= res!478322 (contains!4016 newAcc!49 k!2824))))

(assert (= (and start!63508 res!478338) b!715367))

(assert (= (and b!715367 res!478331) b!715356))

(assert (= (and b!715356 res!478327) b!715359))

(assert (= (and b!715359 res!478337) b!715364))

(assert (= (and b!715364 res!478339) b!715358))

(assert (= (and b!715358 res!478333) b!715361))

(assert (= (and b!715361 res!478324) b!715353))

(assert (= (and b!715353 res!478332) b!715363))

(assert (= (and b!715363 res!478328) b!715360))

(assert (= (and b!715360 res!478326) b!715369))

(assert (= (and b!715369 res!478322) b!715365))

(assert (= (and b!715365 res!478323) b!715354))

(assert (= (and b!715354 res!478334) b!715357))

(assert (= (and b!715357 res!478325) b!715362))

(assert (= (and b!715362 res!478329) b!715366))

(assert (= (and b!715366 res!478335) b!715368))

(assert (= (and b!715368 res!478336) b!715352))

(assert (= (and b!715352 res!478330) b!715355))

(declare-fun m!671623 () Bool)

(assert (=> start!63508 m!671623))

(declare-fun m!671625 () Bool)

(assert (=> b!715361 m!671625))

(declare-fun m!671627 () Bool)

(assert (=> b!715367 m!671627))

(declare-fun m!671629 () Bool)

(assert (=> b!715364 m!671629))

(declare-fun m!671631 () Bool)

(assert (=> b!715359 m!671631))

(declare-fun m!671633 () Bool)

(assert (=> b!715355 m!671633))

(declare-fun m!671635 () Bool)

(assert (=> b!715358 m!671635))

(declare-fun m!671637 () Bool)

(assert (=> b!715363 m!671637))

(declare-fun m!671639 () Bool)

(assert (=> b!715369 m!671639))

(declare-fun m!671641 () Bool)

(assert (=> b!715353 m!671641))

(declare-fun m!671643 () Bool)

(assert (=> b!715356 m!671643))

(declare-fun m!671645 () Bool)

(assert (=> b!715352 m!671645))

(declare-fun m!671647 () Bool)

(assert (=> b!715354 m!671647))

(declare-fun m!671649 () Bool)

(assert (=> b!715357 m!671649))

(declare-fun m!671651 () Bool)

(assert (=> b!715360 m!671651))

(declare-fun m!671653 () Bool)

(assert (=> b!715366 m!671653))

(assert (=> b!715366 m!671653))

(declare-fun m!671655 () Bool)

(assert (=> b!715366 m!671655))

(declare-fun m!671657 () Bool)

(assert (=> b!715365 m!671657))

(push 1)

(assert (not b!715365))

(assert (not b!715356))

(assert (not b!715369))

(assert (not b!715359))

(assert (not b!715358))

(assert (not b!715361))

(assert (not b!715357))

(assert (not start!63508))

(assert (not b!715367))

(assert (not b!715360))

(assert (not b!715353))

(assert (not b!715363))

(assert (not b!715366))

(assert (not b!715364))

(assert (not b!715352))

(assert (not b!715354))

(assert (not b!715355))

(check-sat)

