; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62652 () Bool)

(assert start!62652)

(declare-fun res!471211 () Bool)

(declare-fun e!398094 () Bool)

(assert (=> start!62652 (=> (not res!471211) (not e!398094))))

(declare-datatypes ((array!40331 0))(
  ( (array!40332 (arr!19322 (Array (_ BitVec 32) (_ BitVec 64))) (size!19707 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40331)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62652 (= res!471211 (and (bvslt (size!19707 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19707 a!3591))))))

(assert (=> start!62652 e!398094))

(assert (=> start!62652 true))

(declare-fun array_inv!15118 (array!40331) Bool)

(assert (=> start!62652 (array_inv!15118 a!3591)))

(declare-fun b!707397 () Bool)

(assert (=> b!707397 (= e!398094 false)))

(declare-fun lt!318003 () Bool)

(declare-datatypes ((List!13363 0))(
  ( (Nil!13360) (Cons!13359 (h!14404 (_ BitVec 64)) (t!19645 List!13363)) )
))
(declare-fun newAcc!49 () List!13363)

(declare-fun contains!3940 (List!13363 (_ BitVec 64)) Bool)

(assert (=> b!707397 (= lt!318003 (contains!3940 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707398 () Bool)

(declare-fun res!471212 () Bool)

(assert (=> b!707398 (=> (not res!471212) (not e!398094))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13363)

(declare-fun -!350 (List!13363 (_ BitVec 64)) List!13363)

(assert (=> b!707398 (= res!471212 (= (-!350 newAcc!49 k!2824) acc!652))))

(declare-fun b!707399 () Bool)

(declare-fun res!471210 () Bool)

(assert (=> b!707399 (=> (not res!471210) (not e!398094))))

(assert (=> b!707399 (= res!471210 (not (contains!3940 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707400 () Bool)

(declare-fun res!471209 () Bool)

(assert (=> b!707400 (=> (not res!471209) (not e!398094))))

(assert (=> b!707400 (= res!471209 (not (contains!3940 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707401 () Bool)

(declare-fun res!471217 () Bool)

(assert (=> b!707401 (=> (not res!471217) (not e!398094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707401 (= res!471217 (validKeyInArray!0 k!2824))))

(declare-fun b!707402 () Bool)

(declare-fun res!471208 () Bool)

(assert (=> b!707402 (=> (not res!471208) (not e!398094))))

(declare-fun noDuplicate!1187 (List!13363) Bool)

(assert (=> b!707402 (= res!471208 (noDuplicate!1187 acc!652))))

(declare-fun b!707403 () Bool)

(declare-fun res!471213 () Bool)

(assert (=> b!707403 (=> (not res!471213) (not e!398094))))

(assert (=> b!707403 (= res!471213 (noDuplicate!1187 newAcc!49))))

(declare-fun b!707404 () Bool)

(declare-fun res!471218 () Bool)

(assert (=> b!707404 (=> (not res!471218) (not e!398094))))

(assert (=> b!707404 (= res!471218 (not (contains!3940 acc!652 k!2824)))))

(declare-fun b!707405 () Bool)

(declare-fun res!471216 () Bool)

(assert (=> b!707405 (=> (not res!471216) (not e!398094))))

(declare-fun subseq!385 (List!13363 List!13363) Bool)

(assert (=> b!707405 (= res!471216 (subseq!385 acc!652 newAcc!49))))

(declare-fun b!707406 () Bool)

(declare-fun res!471215 () Bool)

(assert (=> b!707406 (=> (not res!471215) (not e!398094))))

(assert (=> b!707406 (= res!471215 (not (contains!3940 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707407 () Bool)

(declare-fun res!471214 () Bool)

(assert (=> b!707407 (=> (not res!471214) (not e!398094))))

(declare-fun arrayNoDuplicates!0 (array!40331 (_ BitVec 32) List!13363) Bool)

(assert (=> b!707407 (= res!471214 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707408 () Bool)

(declare-fun res!471219 () Bool)

(assert (=> b!707408 (=> (not res!471219) (not e!398094))))

(assert (=> b!707408 (= res!471219 (contains!3940 newAcc!49 k!2824))))

(declare-fun b!707409 () Bool)

(declare-fun res!471207 () Bool)

(assert (=> b!707409 (=> (not res!471207) (not e!398094))))

(declare-fun arrayContainsKey!0 (array!40331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707409 (= res!471207 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(assert (= (and start!62652 res!471211) b!707402))

(assert (= (and b!707402 res!471208) b!707403))

(assert (= (and b!707403 res!471213) b!707406))

(assert (= (and b!707406 res!471215) b!707399))

(assert (= (and b!707399 res!471210) b!707409))

(assert (= (and b!707409 res!471207) b!707404))

(assert (= (and b!707404 res!471218) b!707401))

(assert (= (and b!707401 res!471217) b!707407))

(assert (= (and b!707407 res!471214) b!707405))

(assert (= (and b!707405 res!471216) b!707408))

(assert (= (and b!707408 res!471219) b!707398))

(assert (= (and b!707398 res!471212) b!707400))

(assert (= (and b!707400 res!471209) b!707397))

(declare-fun m!664983 () Bool)

(assert (=> b!707400 m!664983))

(declare-fun m!664985 () Bool)

(assert (=> b!707397 m!664985))

(declare-fun m!664987 () Bool)

(assert (=> b!707399 m!664987))

(declare-fun m!664989 () Bool)

(assert (=> b!707407 m!664989))

(declare-fun m!664991 () Bool)

(assert (=> b!707403 m!664991))

(declare-fun m!664993 () Bool)

(assert (=> b!707406 m!664993))

(declare-fun m!664995 () Bool)

(assert (=> b!707405 m!664995))

(declare-fun m!664997 () Bool)

(assert (=> b!707408 m!664997))

(declare-fun m!664999 () Bool)

(assert (=> start!62652 m!664999))

(declare-fun m!665001 () Bool)

(assert (=> b!707398 m!665001))

(declare-fun m!665003 () Bool)

(assert (=> b!707404 m!665003))

(declare-fun m!665005 () Bool)

(assert (=> b!707401 m!665005))

(declare-fun m!665007 () Bool)

(assert (=> b!707409 m!665007))

(declare-fun m!665009 () Bool)

(assert (=> b!707402 m!665009))

(push 1)

(assert (not start!62652))

(assert (not b!707406))

(assert (not b!707403))

(assert (not b!707409))

(assert (not b!707407))

(assert (not b!707402))

(assert (not b!707405))

(assert (not b!707400))

(assert (not b!707398))

(assert (not b!707397))

(assert (not b!707404))

(assert (not b!707399))

(assert (not b!707401))

(assert (not b!707408))

(check-sat)

