; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63510 () Bool)

(assert start!63510)

(declare-fun b!715406 () Bool)

(declare-fun res!478380 () Bool)

(declare-fun e!401861 () Bool)

(assert (=> b!715406 (=> (not res!478380) (not e!401861))))

(declare-datatypes ((List!13440 0))(
  ( (Nil!13437) (Cons!13436 (h!14481 (_ BitVec 64)) (t!19755 List!13440)) )
))
(declare-fun newAcc!49 () List!13440)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13440)

(declare-fun -!427 (List!13440 (_ BitVec 64)) List!13440)

(assert (=> b!715406 (= res!478380 (= (-!427 newAcc!49 k0!2824) acc!652))))

(declare-fun b!715407 () Bool)

(declare-fun res!478390 () Bool)

(assert (=> b!715407 (=> (not res!478390) (not e!401861))))

(declare-fun contains!4017 (List!13440 (_ BitVec 64)) Bool)

(assert (=> b!715407 (= res!478390 (contains!4017 newAcc!49 k0!2824))))

(declare-fun b!715408 () Bool)

(declare-fun res!478389 () Bool)

(assert (=> b!715408 (=> (not res!478389) (not e!401861))))

(assert (=> b!715408 (= res!478389 (not (contains!4017 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715409 () Bool)

(declare-fun res!478392 () Bool)

(assert (=> b!715409 (=> (not res!478392) (not e!401861))))

(declare-fun noDuplicate!1264 (List!13440) Bool)

(assert (=> b!715409 (= res!478392 (noDuplicate!1264 newAcc!49))))

(declare-fun res!478379 () Bool)

(assert (=> start!63510 (=> (not res!478379) (not e!401861))))

(declare-datatypes ((array!40524 0))(
  ( (array!40525 (arr!19399 (Array (_ BitVec 32) (_ BitVec 64))) (size!19815 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40524)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63510 (= res!478379 (and (bvslt (size!19815 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19815 a!3591))))))

(assert (=> start!63510 e!401861))

(assert (=> start!63510 true))

(declare-fun array_inv!15195 (array!40524) Bool)

(assert (=> start!63510 (array_inv!15195 a!3591)))

(declare-fun b!715410 () Bool)

(declare-fun res!478381 () Bool)

(assert (=> b!715410 (=> (not res!478381) (not e!401861))))

(assert (=> b!715410 (= res!478381 (not (contains!4017 acc!652 k0!2824)))))

(declare-fun b!715411 () Bool)

(declare-fun res!478391 () Bool)

(assert (=> b!715411 (=> (not res!478391) (not e!401861))))

(declare-fun arrayContainsKey!0 (array!40524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715411 (= res!478391 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715412 () Bool)

(declare-fun res!478382 () Bool)

(assert (=> b!715412 (=> (not res!478382) (not e!401861))))

(assert (=> b!715412 (= res!478382 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!715413 () Bool)

(declare-fun res!478387 () Bool)

(assert (=> b!715413 (=> (not res!478387) (not e!401861))))

(declare-fun subseq!462 (List!13440 List!13440) Bool)

(assert (=> b!715413 (= res!478387 (subseq!462 acc!652 newAcc!49))))

(declare-fun b!715414 () Bool)

(declare-fun res!478385 () Bool)

(assert (=> b!715414 (=> (not res!478385) (not e!401861))))

(assert (=> b!715414 (= res!478385 (not (contains!4017 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715415 () Bool)

(declare-fun res!478388 () Bool)

(assert (=> b!715415 (=> (not res!478388) (not e!401861))))

(assert (=> b!715415 (= res!478388 (not (contains!4017 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715416 () Bool)

(declare-fun res!478393 () Bool)

(assert (=> b!715416 (=> (not res!478393) (not e!401861))))

(declare-fun arrayNoDuplicates!0 (array!40524 (_ BitVec 32) List!13440) Bool)

(assert (=> b!715416 (= res!478393 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715417 () Bool)

(declare-fun res!478377 () Bool)

(assert (=> b!715417 (=> (not res!478377) (not e!401861))))

(assert (=> b!715417 (= res!478377 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715418 () Bool)

(declare-fun res!478384 () Bool)

(assert (=> b!715418 (=> (not res!478384) (not e!401861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715418 (= res!478384 (not (validKeyInArray!0 (select (arr!19399 a!3591) from!2969))))))

(declare-fun b!715419 () Bool)

(declare-fun res!478376 () Bool)

(assert (=> b!715419 (=> (not res!478376) (not e!401861))))

(assert (=> b!715419 (= res!478376 (not (contains!4017 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715420 () Bool)

(declare-fun res!478383 () Bool)

(assert (=> b!715420 (=> (not res!478383) (not e!401861))))

(assert (=> b!715420 (= res!478383 (validKeyInArray!0 k0!2824))))

(declare-fun b!715421 () Bool)

(declare-fun res!478378 () Bool)

(assert (=> b!715421 (=> (not res!478378) (not e!401861))))

(assert (=> b!715421 (= res!478378 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19815 a!3591)))))

(declare-fun b!715422 () Bool)

(assert (=> b!715422 (= e!401861 false)))

(declare-fun lt!318839 () Bool)

(assert (=> b!715422 (= lt!318839 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715423 () Bool)

(declare-fun res!478386 () Bool)

(assert (=> b!715423 (=> (not res!478386) (not e!401861))))

(assert (=> b!715423 (= res!478386 (noDuplicate!1264 acc!652))))

(assert (= (and start!63510 res!478379) b!715423))

(assert (= (and b!715423 res!478386) b!715409))

(assert (= (and b!715409 res!478392) b!715408))

(assert (= (and b!715408 res!478389) b!715419))

(assert (= (and b!715419 res!478376) b!715412))

(assert (= (and b!715412 res!478382) b!715410))

(assert (= (and b!715410 res!478381) b!715420))

(assert (= (and b!715420 res!478383) b!715416))

(assert (= (and b!715416 res!478393) b!715413))

(assert (= (and b!715413 res!478387) b!715407))

(assert (= (and b!715407 res!478390) b!715406))

(assert (= (and b!715406 res!478380) b!715414))

(assert (= (and b!715414 res!478385) b!715415))

(assert (= (and b!715415 res!478388) b!715421))

(assert (= (and b!715421 res!478378) b!715418))

(assert (= (and b!715418 res!478384) b!715417))

(assert (= (and b!715417 res!478377) b!715411))

(assert (= (and b!715411 res!478391) b!715422))

(declare-fun m!671659 () Bool)

(assert (=> b!715413 m!671659))

(declare-fun m!671661 () Bool)

(assert (=> b!715423 m!671661))

(declare-fun m!671663 () Bool)

(assert (=> b!715422 m!671663))

(declare-fun m!671665 () Bool)

(assert (=> b!715420 m!671665))

(declare-fun m!671667 () Bool)

(assert (=> b!715406 m!671667))

(declare-fun m!671669 () Bool)

(assert (=> b!715414 m!671669))

(declare-fun m!671671 () Bool)

(assert (=> b!715418 m!671671))

(assert (=> b!715418 m!671671))

(declare-fun m!671673 () Bool)

(assert (=> b!715418 m!671673))

(declare-fun m!671675 () Bool)

(assert (=> b!715411 m!671675))

(declare-fun m!671677 () Bool)

(assert (=> b!715416 m!671677))

(declare-fun m!671679 () Bool)

(assert (=> b!715409 m!671679))

(declare-fun m!671681 () Bool)

(assert (=> b!715415 m!671681))

(declare-fun m!671683 () Bool)

(assert (=> start!63510 m!671683))

(declare-fun m!671685 () Bool)

(assert (=> b!715412 m!671685))

(declare-fun m!671687 () Bool)

(assert (=> b!715419 m!671687))

(declare-fun m!671689 () Bool)

(assert (=> b!715408 m!671689))

(declare-fun m!671691 () Bool)

(assert (=> b!715407 m!671691))

(declare-fun m!671693 () Bool)

(assert (=> b!715410 m!671693))

(check-sat (not b!715422) (not b!715415) (not b!715418) (not b!715416) (not b!715423) (not b!715413) (not b!715420) (not b!715411) (not b!715408) (not b!715419) (not b!715412) (not b!715406) (not b!715414) (not b!715407) (not b!715410) (not b!715409) (not start!63510))
(check-sat)
