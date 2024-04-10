; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63374 () Bool)

(assert start!63374)

(declare-fun b!713971 () Bool)

(declare-fun res!477059 () Bool)

(declare-fun e!401332 () Bool)

(assert (=> b!713971 (=> (not res!477059) (not e!401332))))

(declare-datatypes ((List!13420 0))(
  ( (Nil!13417) (Cons!13416 (h!14461 (_ BitVec 64)) (t!19735 List!13420)) )
))
(declare-fun acc!652 () List!13420)

(declare-fun newAcc!49 () List!13420)

(declare-fun subseq!442 (List!13420 List!13420) Bool)

(assert (=> b!713971 (= res!477059 (subseq!442 acc!652 newAcc!49))))

(declare-fun b!713973 () Bool)

(declare-fun res!477064 () Bool)

(assert (=> b!713973 (=> (not res!477064) (not e!401332))))

(declare-fun contains!3997 (List!13420 (_ BitVec 64)) Bool)

(assert (=> b!713973 (= res!477064 (not (contains!3997 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713974 () Bool)

(declare-fun res!477061 () Bool)

(assert (=> b!713974 (=> (not res!477061) (not e!401332))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!713974 (= res!477061 (contains!3997 newAcc!49 k!2824))))

(declare-fun b!713975 () Bool)

(declare-fun res!477066 () Bool)

(assert (=> b!713975 (=> (not res!477066) (not e!401332))))

(declare-fun noDuplicate!1244 (List!13420) Bool)

(assert (=> b!713975 (= res!477066 (noDuplicate!1244 newAcc!49))))

(declare-fun b!713976 () Bool)

(declare-fun res!477058 () Bool)

(assert (=> b!713976 (=> (not res!477058) (not e!401332))))

(assert (=> b!713976 (= res!477058 (not (contains!3997 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713977 () Bool)

(declare-fun res!477065 () Bool)

(assert (=> b!713977 (=> (not res!477065) (not e!401332))))

(assert (=> b!713977 (= res!477065 (not (contains!3997 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713978 () Bool)

(declare-fun res!477057 () Bool)

(assert (=> b!713978 (=> (not res!477057) (not e!401332))))

(declare-datatypes ((array!40478 0))(
  ( (array!40479 (arr!19379 (Array (_ BitVec 32) (_ BitVec 64))) (size!19790 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40478)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40478 (_ BitVec 32) List!13420) Bool)

(assert (=> b!713978 (= res!477057 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713979 () Bool)

(assert (=> b!713979 (= e!401332 false)))

(declare-fun lt!318731 () Bool)

(assert (=> b!713979 (= lt!318731 (contains!3997 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713980 () Bool)

(declare-fun res!477060 () Bool)

(assert (=> b!713980 (=> (not res!477060) (not e!401332))))

(declare-fun -!407 (List!13420 (_ BitVec 64)) List!13420)

(assert (=> b!713980 (= res!477060 (= (-!407 newAcc!49 k!2824) acc!652))))

(declare-fun b!713981 () Bool)

(declare-fun res!477063 () Bool)

(assert (=> b!713981 (=> (not res!477063) (not e!401332))))

(assert (=> b!713981 (= res!477063 (noDuplicate!1244 acc!652))))

(declare-fun b!713982 () Bool)

(declare-fun res!477062 () Bool)

(assert (=> b!713982 (=> (not res!477062) (not e!401332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713982 (= res!477062 (validKeyInArray!0 k!2824))))

(declare-fun b!713983 () Bool)

(declare-fun res!477055 () Bool)

(assert (=> b!713983 (=> (not res!477055) (not e!401332))))

(assert (=> b!713983 (= res!477055 (not (contains!3997 acc!652 k!2824)))))

(declare-fun b!713972 () Bool)

(declare-fun res!477056 () Bool)

(assert (=> b!713972 (=> (not res!477056) (not e!401332))))

(declare-fun arrayContainsKey!0 (array!40478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713972 (= res!477056 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun res!477067 () Bool)

(assert (=> start!63374 (=> (not res!477067) (not e!401332))))

(assert (=> start!63374 (= res!477067 (and (bvslt (size!19790 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19790 a!3591))))))

(assert (=> start!63374 e!401332))

(assert (=> start!63374 true))

(declare-fun array_inv!15175 (array!40478) Bool)

(assert (=> start!63374 (array_inv!15175 a!3591)))

(assert (= (and start!63374 res!477067) b!713981))

(assert (= (and b!713981 res!477063) b!713975))

(assert (= (and b!713975 res!477066) b!713973))

(assert (= (and b!713973 res!477064) b!713977))

(assert (= (and b!713977 res!477065) b!713972))

(assert (= (and b!713972 res!477056) b!713983))

(assert (= (and b!713983 res!477055) b!713982))

(assert (= (and b!713982 res!477062) b!713978))

(assert (= (and b!713978 res!477057) b!713971))

(assert (= (and b!713971 res!477059) b!713974))

(assert (= (and b!713974 res!477061) b!713980))

(assert (= (and b!713980 res!477060) b!713976))

(assert (= (and b!713976 res!477058) b!713979))

(declare-fun m!670623 () Bool)

(assert (=> b!713976 m!670623))

(declare-fun m!670625 () Bool)

(assert (=> b!713975 m!670625))

(declare-fun m!670627 () Bool)

(assert (=> b!713972 m!670627))

(declare-fun m!670629 () Bool)

(assert (=> b!713977 m!670629))

(declare-fun m!670631 () Bool)

(assert (=> b!713981 m!670631))

(declare-fun m!670633 () Bool)

(assert (=> b!713980 m!670633))

(declare-fun m!670635 () Bool)

(assert (=> b!713973 m!670635))

(declare-fun m!670637 () Bool)

(assert (=> b!713983 m!670637))

(declare-fun m!670639 () Bool)

(assert (=> b!713979 m!670639))

(declare-fun m!670641 () Bool)

(assert (=> b!713971 m!670641))

(declare-fun m!670643 () Bool)

(assert (=> b!713978 m!670643))

(declare-fun m!670645 () Bool)

(assert (=> b!713974 m!670645))

(declare-fun m!670647 () Bool)

(assert (=> start!63374 m!670647))

(declare-fun m!670649 () Bool)

(assert (=> b!713982 m!670649))

(push 1)

(assert (not b!713982))

(assert (not b!713978))

(assert (not b!713976))

(assert (not b!713974))

(assert (not b!713972))

(assert (not b!713975))

(assert (not b!713983))

(assert (not b!713980))

(assert (not start!63374))

(assert (not b!713971))

(assert (not b!713979))

(assert (not b!713973))

(assert (not b!713981))

