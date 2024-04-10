; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63372 () Bool)

(assert start!63372)

(declare-fun b!713932 () Bool)

(declare-fun res!477023 () Bool)

(declare-fun e!401327 () Bool)

(assert (=> b!713932 (=> (not res!477023) (not e!401327))))

(declare-datatypes ((List!13419 0))(
  ( (Nil!13416) (Cons!13415 (h!14460 (_ BitVec 64)) (t!19734 List!13419)) )
))
(declare-fun acc!652 () List!13419)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3996 (List!13419 (_ BitVec 64)) Bool)

(assert (=> b!713932 (= res!477023 (not (contains!3996 acc!652 k0!2824)))))

(declare-fun b!713933 () Bool)

(declare-fun res!477025 () Bool)

(assert (=> b!713933 (=> (not res!477025) (not e!401327))))

(declare-fun newAcc!49 () List!13419)

(declare-fun subseq!441 (List!13419 List!13419) Bool)

(assert (=> b!713933 (= res!477025 (subseq!441 acc!652 newAcc!49))))

(declare-fun b!713934 () Bool)

(declare-fun res!477017 () Bool)

(assert (=> b!713934 (=> (not res!477017) (not e!401327))))

(declare-datatypes ((array!40476 0))(
  ( (array!40477 (arr!19378 (Array (_ BitVec 32) (_ BitVec 64))) (size!19789 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40476)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40476 (_ BitVec 32) List!13419) Bool)

(assert (=> b!713934 (= res!477017 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713935 () Bool)

(declare-fun res!477018 () Bool)

(assert (=> b!713935 (=> (not res!477018) (not e!401327))))

(assert (=> b!713935 (= res!477018 (not (contains!3996 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!477022 () Bool)

(assert (=> start!63372 (=> (not res!477022) (not e!401327))))

(assert (=> start!63372 (= res!477022 (and (bvslt (size!19789 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19789 a!3591))))))

(assert (=> start!63372 e!401327))

(assert (=> start!63372 true))

(declare-fun array_inv!15174 (array!40476) Bool)

(assert (=> start!63372 (array_inv!15174 a!3591)))

(declare-fun b!713936 () Bool)

(declare-fun res!477021 () Bool)

(assert (=> b!713936 (=> (not res!477021) (not e!401327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713936 (= res!477021 (validKeyInArray!0 k0!2824))))

(declare-fun b!713937 () Bool)

(declare-fun res!477024 () Bool)

(assert (=> b!713937 (=> (not res!477024) (not e!401327))))

(declare-fun noDuplicate!1243 (List!13419) Bool)

(assert (=> b!713937 (= res!477024 (noDuplicate!1243 acc!652))))

(declare-fun b!713938 () Bool)

(assert (=> b!713938 (= e!401327 false)))

(declare-fun lt!318728 () Bool)

(assert (=> b!713938 (= lt!318728 (contains!3996 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713939 () Bool)

(declare-fun res!477016 () Bool)

(assert (=> b!713939 (=> (not res!477016) (not e!401327))))

(declare-fun -!406 (List!13419 (_ BitVec 64)) List!13419)

(assert (=> b!713939 (= res!477016 (= (-!406 newAcc!49 k0!2824) acc!652))))

(declare-fun b!713940 () Bool)

(declare-fun res!477028 () Bool)

(assert (=> b!713940 (=> (not res!477028) (not e!401327))))

(assert (=> b!713940 (= res!477028 (noDuplicate!1243 newAcc!49))))

(declare-fun b!713941 () Bool)

(declare-fun res!477019 () Bool)

(assert (=> b!713941 (=> (not res!477019) (not e!401327))))

(assert (=> b!713941 (= res!477019 (not (contains!3996 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713942 () Bool)

(declare-fun res!477026 () Bool)

(assert (=> b!713942 (=> (not res!477026) (not e!401327))))

(declare-fun arrayContainsKey!0 (array!40476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713942 (= res!477026 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!713943 () Bool)

(declare-fun res!477027 () Bool)

(assert (=> b!713943 (=> (not res!477027) (not e!401327))))

(assert (=> b!713943 (= res!477027 (not (contains!3996 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713944 () Bool)

(declare-fun res!477020 () Bool)

(assert (=> b!713944 (=> (not res!477020) (not e!401327))))

(assert (=> b!713944 (= res!477020 (contains!3996 newAcc!49 k0!2824))))

(assert (= (and start!63372 res!477022) b!713937))

(assert (= (and b!713937 res!477024) b!713940))

(assert (= (and b!713940 res!477028) b!713943))

(assert (= (and b!713943 res!477027) b!713935))

(assert (= (and b!713935 res!477018) b!713942))

(assert (= (and b!713942 res!477026) b!713932))

(assert (= (and b!713932 res!477023) b!713936))

(assert (= (and b!713936 res!477021) b!713934))

(assert (= (and b!713934 res!477017) b!713933))

(assert (= (and b!713933 res!477025) b!713944))

(assert (= (and b!713944 res!477020) b!713939))

(assert (= (and b!713939 res!477016) b!713941))

(assert (= (and b!713941 res!477019) b!713938))

(declare-fun m!670595 () Bool)

(assert (=> b!713933 m!670595))

(declare-fun m!670597 () Bool)

(assert (=> b!713934 m!670597))

(declare-fun m!670599 () Bool)

(assert (=> b!713941 m!670599))

(declare-fun m!670601 () Bool)

(assert (=> b!713942 m!670601))

(declare-fun m!670603 () Bool)

(assert (=> b!713937 m!670603))

(declare-fun m!670605 () Bool)

(assert (=> b!713938 m!670605))

(declare-fun m!670607 () Bool)

(assert (=> b!713944 m!670607))

(declare-fun m!670609 () Bool)

(assert (=> b!713943 m!670609))

(declare-fun m!670611 () Bool)

(assert (=> b!713936 m!670611))

(declare-fun m!670613 () Bool)

(assert (=> start!63372 m!670613))

(declare-fun m!670615 () Bool)

(assert (=> b!713935 m!670615))

(declare-fun m!670617 () Bool)

(assert (=> b!713939 m!670617))

(declare-fun m!670619 () Bool)

(assert (=> b!713940 m!670619))

(declare-fun m!670621 () Bool)

(assert (=> b!713932 m!670621))

(check-sat (not start!63372) (not b!713935) (not b!713940) (not b!713941) (not b!713937) (not b!713943) (not b!713944) (not b!713938) (not b!713936) (not b!713942) (not b!713934) (not b!713933) (not b!713932) (not b!713939))
(check-sat)
