; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63430 () Bool)

(assert start!63430)

(declare-fun b!714385 () Bool)

(declare-fun res!477415 () Bool)

(declare-fun e!401555 () Bool)

(assert (=> b!714385 (=> (not res!477415) (not e!401555))))

(declare-datatypes ((List!13424 0))(
  ( (Nil!13421) (Cons!13420 (h!14465 (_ BitVec 64)) (t!19739 List!13424)) )
))
(declare-fun newAcc!49 () List!13424)

(declare-fun contains!4001 (List!13424 (_ BitVec 64)) Bool)

(assert (=> b!714385 (= res!477415 (not (contains!4001 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714386 () Bool)

(declare-fun res!477420 () Bool)

(assert (=> b!714386 (=> (not res!477420) (not e!401555))))

(declare-fun acc!652 () List!13424)

(declare-fun noDuplicate!1248 (List!13424) Bool)

(assert (=> b!714386 (= res!477420 (noDuplicate!1248 acc!652))))

(declare-fun b!714387 () Bool)

(declare-fun res!477417 () Bool)

(assert (=> b!714387 (=> (not res!477417) (not e!401555))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!714387 (= res!477417 (not (contains!4001 acc!652 k!2824)))))

(declare-fun b!714388 () Bool)

(declare-fun res!477426 () Bool)

(assert (=> b!714388 (=> (not res!477426) (not e!401555))))

(assert (=> b!714388 (= res!477426 (contains!4001 newAcc!49 k!2824))))

(declare-fun b!714389 () Bool)

(assert (=> b!714389 (= e!401555 false)))

(declare-fun lt!318767 () Bool)

(assert (=> b!714389 (= lt!318767 (contains!4001 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714390 () Bool)

(declare-fun res!477419 () Bool)

(assert (=> b!714390 (=> (not res!477419) (not e!401555))))

(declare-datatypes ((array!40489 0))(
  ( (array!40490 (arr!19383 (Array (_ BitVec 32) (_ BitVec 64))) (size!19796 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40489)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40489 (_ BitVec 32) List!13424) Bool)

(assert (=> b!714390 (= res!477419 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!477416 () Bool)

(assert (=> start!63430 (=> (not res!477416) (not e!401555))))

(assert (=> start!63430 (= res!477416 (and (bvslt (size!19796 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19796 a!3591))))))

(assert (=> start!63430 e!401555))

(assert (=> start!63430 true))

(declare-fun array_inv!15179 (array!40489) Bool)

(assert (=> start!63430 (array_inv!15179 a!3591)))

(declare-fun b!714391 () Bool)

(declare-fun res!477421 () Bool)

(assert (=> b!714391 (=> (not res!477421) (not e!401555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714391 (= res!477421 (validKeyInArray!0 k!2824))))

(declare-fun b!714392 () Bool)

(declare-fun res!477423 () Bool)

(assert (=> b!714392 (=> (not res!477423) (not e!401555))))

(assert (=> b!714392 (= res!477423 (not (contains!4001 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714393 () Bool)

(declare-fun res!477422 () Bool)

(assert (=> b!714393 (=> (not res!477422) (not e!401555))))

(declare-fun subseq!446 (List!13424 List!13424) Bool)

(assert (=> b!714393 (= res!477422 (subseq!446 acc!652 newAcc!49))))

(declare-fun b!714394 () Bool)

(declare-fun res!477425 () Bool)

(assert (=> b!714394 (=> (not res!477425) (not e!401555))))

(assert (=> b!714394 (= res!477425 (not (contains!4001 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714395 () Bool)

(declare-fun res!477418 () Bool)

(assert (=> b!714395 (=> (not res!477418) (not e!401555))))

(declare-fun arrayContainsKey!0 (array!40489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714395 (= res!477418 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!714396 () Bool)

(declare-fun res!477424 () Bool)

(assert (=> b!714396 (=> (not res!477424) (not e!401555))))

(declare-fun -!411 (List!13424 (_ BitVec 64)) List!13424)

(assert (=> b!714396 (= res!477424 (= (-!411 newAcc!49 k!2824) acc!652))))

(declare-fun b!714397 () Bool)

(declare-fun res!477427 () Bool)

(assert (=> b!714397 (=> (not res!477427) (not e!401555))))

(assert (=> b!714397 (= res!477427 (noDuplicate!1248 newAcc!49))))

(assert (= (and start!63430 res!477416) b!714386))

(assert (= (and b!714386 res!477420) b!714397))

(assert (= (and b!714397 res!477427) b!714392))

(assert (= (and b!714392 res!477423) b!714394))

(assert (= (and b!714394 res!477425) b!714395))

(assert (= (and b!714395 res!477418) b!714387))

(assert (= (and b!714387 res!477417) b!714391))

(assert (= (and b!714391 res!477421) b!714390))

(assert (= (and b!714390 res!477419) b!714393))

(assert (= (and b!714393 res!477422) b!714388))

(assert (= (and b!714388 res!477426) b!714396))

(assert (= (and b!714396 res!477424) b!714385))

(assert (= (and b!714385 res!477415) b!714389))

(declare-fun m!670933 () Bool)

(assert (=> b!714396 m!670933))

(declare-fun m!670935 () Bool)

(assert (=> b!714386 m!670935))

(declare-fun m!670937 () Bool)

(assert (=> b!714391 m!670937))

(declare-fun m!670939 () Bool)

(assert (=> b!714397 m!670939))

(declare-fun m!670941 () Bool)

(assert (=> b!714389 m!670941))

(declare-fun m!670943 () Bool)

(assert (=> b!714387 m!670943))

(declare-fun m!670945 () Bool)

(assert (=> b!714395 m!670945))

(declare-fun m!670947 () Bool)

(assert (=> b!714388 m!670947))

(declare-fun m!670949 () Bool)

(assert (=> start!63430 m!670949))

(declare-fun m!670951 () Bool)

(assert (=> b!714390 m!670951))

(declare-fun m!670953 () Bool)

(assert (=> b!714393 m!670953))

(declare-fun m!670955 () Bool)

(assert (=> b!714385 m!670955))

(declare-fun m!670957 () Bool)

(assert (=> b!714394 m!670957))

(declare-fun m!670959 () Bool)

(assert (=> b!714392 m!670959))

(push 1)

(assert (not b!714396))

(assert (not b!714392))

(assert (not b!714391))

(assert (not b!714395))

(assert (not b!714385))

(assert (not b!714394))

(assert (not start!63430))

(assert (not b!714393))

(assert (not b!714397))

(assert (not b!714388))

(assert (not b!714387))

(assert (not b!714389))

(assert (not b!714386))

(assert (not b!714390))

(check-sat)

