; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63440 () Bool)

(assert start!63440)

(declare-fun b!714580 () Bool)

(declare-fun res!477613 () Bool)

(declare-fun e!401585 () Bool)

(assert (=> b!714580 (=> (not res!477613) (not e!401585))))

(declare-datatypes ((List!13429 0))(
  ( (Nil!13426) (Cons!13425 (h!14470 (_ BitVec 64)) (t!19744 List!13429)) )
))
(declare-fun acc!652 () List!13429)

(declare-fun contains!4006 (List!13429 (_ BitVec 64)) Bool)

(assert (=> b!714580 (= res!477613 (not (contains!4006 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714581 () Bool)

(declare-fun res!477612 () Bool)

(assert (=> b!714581 (=> (not res!477612) (not e!401585))))

(declare-datatypes ((array!40499 0))(
  ( (array!40500 (arr!19388 (Array (_ BitVec 32) (_ BitVec 64))) (size!19801 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40499)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40499 (_ BitVec 32) List!13429) Bool)

(assert (=> b!714581 (= res!477612 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!714582 () Bool)

(declare-fun res!477622 () Bool)

(assert (=> b!714582 (=> (not res!477622) (not e!401585))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714582 (= res!477622 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!714583 () Bool)

(declare-fun res!477610 () Bool)

(assert (=> b!714583 (=> (not res!477610) (not e!401585))))

(declare-fun newAcc!49 () List!13429)

(declare-fun subseq!451 (List!13429 List!13429) Bool)

(assert (=> b!714583 (= res!477610 (subseq!451 acc!652 newAcc!49))))

(declare-fun b!714584 () Bool)

(declare-fun res!477620 () Bool)

(assert (=> b!714584 (=> (not res!477620) (not e!401585))))

(assert (=> b!714584 (= res!477620 (not (contains!4006 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!477617 () Bool)

(assert (=> start!63440 (=> (not res!477617) (not e!401585))))

(assert (=> start!63440 (= res!477617 (and (bvslt (size!19801 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19801 a!3591))))))

(assert (=> start!63440 e!401585))

(assert (=> start!63440 true))

(declare-fun array_inv!15184 (array!40499) Bool)

(assert (=> start!63440 (array_inv!15184 a!3591)))

(declare-fun b!714585 () Bool)

(declare-fun res!477618 () Bool)

(assert (=> b!714585 (=> (not res!477618) (not e!401585))))

(declare-fun noDuplicate!1253 (List!13429) Bool)

(assert (=> b!714585 (= res!477618 (noDuplicate!1253 newAcc!49))))

(declare-fun b!714586 () Bool)

(declare-fun res!477614 () Bool)

(assert (=> b!714586 (=> (not res!477614) (not e!401585))))

(assert (=> b!714586 (= res!477614 (contains!4006 newAcc!49 k!2824))))

(declare-fun b!714587 () Bool)

(declare-fun res!477619 () Bool)

(assert (=> b!714587 (=> (not res!477619) (not e!401585))))

(assert (=> b!714587 (= res!477619 (not (contains!4006 acc!652 k!2824)))))

(declare-fun b!714588 () Bool)

(assert (=> b!714588 (= e!401585 false)))

(declare-fun lt!318782 () Bool)

(assert (=> b!714588 (= lt!318782 (contains!4006 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714589 () Bool)

(declare-fun res!477615 () Bool)

(assert (=> b!714589 (=> (not res!477615) (not e!401585))))

(assert (=> b!714589 (= res!477615 (noDuplicate!1253 acc!652))))

(declare-fun b!714590 () Bool)

(declare-fun res!477611 () Bool)

(assert (=> b!714590 (=> (not res!477611) (not e!401585))))

(declare-fun -!416 (List!13429 (_ BitVec 64)) List!13429)

(assert (=> b!714590 (= res!477611 (= (-!416 newAcc!49 k!2824) acc!652))))

(declare-fun b!714591 () Bool)

(declare-fun res!477616 () Bool)

(assert (=> b!714591 (=> (not res!477616) (not e!401585))))

(assert (=> b!714591 (= res!477616 (not (contains!4006 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714592 () Bool)

(declare-fun res!477621 () Bool)

(assert (=> b!714592 (=> (not res!477621) (not e!401585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714592 (= res!477621 (validKeyInArray!0 k!2824))))

(assert (= (and start!63440 res!477617) b!714589))

(assert (= (and b!714589 res!477615) b!714585))

(assert (= (and b!714585 res!477618) b!714580))

(assert (= (and b!714580 res!477613) b!714591))

(assert (= (and b!714591 res!477616) b!714582))

(assert (= (and b!714582 res!477622) b!714587))

(assert (= (and b!714587 res!477619) b!714592))

(assert (= (and b!714592 res!477621) b!714581))

(assert (= (and b!714581 res!477612) b!714583))

(assert (= (and b!714583 res!477610) b!714586))

(assert (= (and b!714586 res!477614) b!714590))

(assert (= (and b!714590 res!477611) b!714584))

(assert (= (and b!714584 res!477620) b!714588))

(declare-fun m!671073 () Bool)

(assert (=> b!714580 m!671073))

(declare-fun m!671075 () Bool)

(assert (=> b!714581 m!671075))

(declare-fun m!671077 () Bool)

(assert (=> b!714589 m!671077))

(declare-fun m!671079 () Bool)

(assert (=> b!714582 m!671079))

(declare-fun m!671081 () Bool)

(assert (=> start!63440 m!671081))

(declare-fun m!671083 () Bool)

(assert (=> b!714590 m!671083))

(declare-fun m!671085 () Bool)

(assert (=> b!714584 m!671085))

(declare-fun m!671087 () Bool)

(assert (=> b!714591 m!671087))

(declare-fun m!671089 () Bool)

(assert (=> b!714585 m!671089))

(declare-fun m!671091 () Bool)

(assert (=> b!714586 m!671091))

(declare-fun m!671093 () Bool)

(assert (=> b!714588 m!671093))

(declare-fun m!671095 () Bool)

(assert (=> b!714592 m!671095))

(declare-fun m!671097 () Bool)

(assert (=> b!714583 m!671097))

(declare-fun m!671099 () Bool)

(assert (=> b!714587 m!671099))

(push 1)

(assert (not b!714583))

(assert (not start!63440))

(assert (not b!714586))

(assert (not b!714587))

(assert (not b!714582))

(assert (not b!714584))

(assert (not b!714592))

(assert (not b!714590))

(assert (not b!714580))

(assert (not b!714589))

(assert (not b!714588))

(assert (not b!714585))

(assert (not b!714591))

