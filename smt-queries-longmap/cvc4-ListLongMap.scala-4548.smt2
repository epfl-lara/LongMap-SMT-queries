; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63368 () Bool)

(assert start!63368)

(declare-fun b!713854 () Bool)

(declare-fun res!476939 () Bool)

(declare-fun e!401314 () Bool)

(assert (=> b!713854 (=> (not res!476939) (not e!401314))))

(declare-datatypes ((List!13417 0))(
  ( (Nil!13414) (Cons!13413 (h!14458 (_ BitVec 64)) (t!19732 List!13417)) )
))
(declare-fun acc!652 () List!13417)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3994 (List!13417 (_ BitVec 64)) Bool)

(assert (=> b!713854 (= res!476939 (not (contains!3994 acc!652 k!2824)))))

(declare-fun b!713855 () Bool)

(declare-fun res!476942 () Bool)

(assert (=> b!713855 (=> (not res!476942) (not e!401314))))

(declare-fun newAcc!49 () List!13417)

(declare-fun subseq!439 (List!13417 List!13417) Bool)

(assert (=> b!713855 (= res!476942 (subseq!439 acc!652 newAcc!49))))

(declare-fun b!713856 () Bool)

(declare-fun res!476948 () Bool)

(assert (=> b!713856 (=> (not res!476948) (not e!401314))))

(declare-datatypes ((array!40472 0))(
  ( (array!40473 (arr!19376 (Array (_ BitVec 32) (_ BitVec 64))) (size!19787 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40472)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40472 (_ BitVec 32) List!13417) Bool)

(assert (=> b!713856 (= res!476948 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713857 () Bool)

(declare-fun res!476950 () Bool)

(assert (=> b!713857 (=> (not res!476950) (not e!401314))))

(declare-fun arrayContainsKey!0 (array!40472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713857 (= res!476950 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!713858 () Bool)

(declare-fun res!476944 () Bool)

(assert (=> b!713858 (=> (not res!476944) (not e!401314))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713858 (= res!476944 (validKeyInArray!0 k!2824))))

(declare-fun b!713859 () Bool)

(declare-fun res!476946 () Bool)

(assert (=> b!713859 (=> (not res!476946) (not e!401314))))

(assert (=> b!713859 (= res!476946 (not (contains!3994 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713860 () Bool)

(declare-fun res!476945 () Bool)

(assert (=> b!713860 (=> (not res!476945) (not e!401314))))

(assert (=> b!713860 (= res!476945 (not (contains!3994 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713861 () Bool)

(declare-fun res!476940 () Bool)

(assert (=> b!713861 (=> (not res!476940) (not e!401314))))

(assert (=> b!713861 (= res!476940 (not (contains!3994 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713862 () Bool)

(assert (=> b!713862 (= e!401314 false)))

(declare-fun lt!318722 () Bool)

(assert (=> b!713862 (= lt!318722 (contains!3994 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713863 () Bool)

(declare-fun res!476941 () Bool)

(assert (=> b!713863 (=> (not res!476941) (not e!401314))))

(declare-fun noDuplicate!1241 (List!13417) Bool)

(assert (=> b!713863 (= res!476941 (noDuplicate!1241 acc!652))))

(declare-fun b!713864 () Bool)

(declare-fun res!476949 () Bool)

(assert (=> b!713864 (=> (not res!476949) (not e!401314))))

(declare-fun -!404 (List!13417 (_ BitVec 64)) List!13417)

(assert (=> b!713864 (= res!476949 (= (-!404 newAcc!49 k!2824) acc!652))))

(declare-fun b!713865 () Bool)

(declare-fun res!476943 () Bool)

(assert (=> b!713865 (=> (not res!476943) (not e!401314))))

(assert (=> b!713865 (= res!476943 (noDuplicate!1241 newAcc!49))))

(declare-fun b!713866 () Bool)

(declare-fun res!476947 () Bool)

(assert (=> b!713866 (=> (not res!476947) (not e!401314))))

(assert (=> b!713866 (= res!476947 (contains!3994 newAcc!49 k!2824))))

(declare-fun res!476938 () Bool)

(assert (=> start!63368 (=> (not res!476938) (not e!401314))))

(assert (=> start!63368 (= res!476938 (and (bvslt (size!19787 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19787 a!3591))))))

(assert (=> start!63368 e!401314))

(assert (=> start!63368 true))

(declare-fun array_inv!15172 (array!40472) Bool)

(assert (=> start!63368 (array_inv!15172 a!3591)))

(assert (= (and start!63368 res!476938) b!713863))

(assert (= (and b!713863 res!476941) b!713865))

(assert (= (and b!713865 res!476943) b!713859))

(assert (= (and b!713859 res!476946) b!713861))

(assert (= (and b!713861 res!476940) b!713857))

(assert (= (and b!713857 res!476950) b!713854))

(assert (= (and b!713854 res!476939) b!713858))

(assert (= (and b!713858 res!476944) b!713856))

(assert (= (and b!713856 res!476948) b!713855))

(assert (= (and b!713855 res!476942) b!713866))

(assert (= (and b!713866 res!476947) b!713864))

(assert (= (and b!713864 res!476949) b!713860))

(assert (= (and b!713860 res!476945) b!713862))

(declare-fun m!670539 () Bool)

(assert (=> b!713854 m!670539))

(declare-fun m!670541 () Bool)

(assert (=> b!713865 m!670541))

(declare-fun m!670543 () Bool)

(assert (=> b!713866 m!670543))

(declare-fun m!670545 () Bool)

(assert (=> start!63368 m!670545))

(declare-fun m!670547 () Bool)

(assert (=> b!713862 m!670547))

(declare-fun m!670549 () Bool)

(assert (=> b!713864 m!670549))

(declare-fun m!670551 () Bool)

(assert (=> b!713858 m!670551))

(declare-fun m!670553 () Bool)

(assert (=> b!713861 m!670553))

(declare-fun m!670555 () Bool)

(assert (=> b!713860 m!670555))

(declare-fun m!670557 () Bool)

(assert (=> b!713863 m!670557))

(declare-fun m!670559 () Bool)

(assert (=> b!713859 m!670559))

(declare-fun m!670561 () Bool)

(assert (=> b!713857 m!670561))

(declare-fun m!670563 () Bool)

(assert (=> b!713855 m!670563))

(declare-fun m!670565 () Bool)

(assert (=> b!713856 m!670565))

(push 1)

(assert (not b!713859))

(assert (not b!713863))

(assert (not b!713857))

(assert (not b!713866))

(assert (not b!713864))

(assert (not b!713855))

(assert (not b!713862))

(assert (not b!713861))

(assert (not b!713856))

(assert (not b!713854))

(assert (not b!713860))

(assert (not b!713865))

(assert (not b!713858))

(assert (not start!63368))

(check-sat)

