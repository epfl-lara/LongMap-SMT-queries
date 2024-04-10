; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63344 () Bool)

(assert start!63344)

(declare-fun b!713359 () Bool)

(declare-fun res!476449 () Bool)

(declare-fun e!401243 () Bool)

(assert (=> b!713359 (=> (not res!476449) (not e!401243))))

(declare-datatypes ((List!13405 0))(
  ( (Nil!13402) (Cons!13401 (h!14446 (_ BitVec 64)) (t!19720 List!13405)) )
))
(declare-fun newAcc!49 () List!13405)

(declare-fun noDuplicate!1229 (List!13405) Bool)

(assert (=> b!713359 (= res!476449 (noDuplicate!1229 newAcc!49))))

(declare-fun b!713360 () Bool)

(declare-fun res!476454 () Bool)

(assert (=> b!713360 (=> (not res!476454) (not e!401243))))

(declare-fun acc!652 () List!13405)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3982 (List!13405 (_ BitVec 64)) Bool)

(assert (=> b!713360 (= res!476454 (not (contains!3982 acc!652 k!2824)))))

(declare-fun b!713361 () Bool)

(declare-fun res!476455 () Bool)

(assert (=> b!713361 (=> (not res!476455) (not e!401243))))

(assert (=> b!713361 (= res!476455 (contains!3982 newAcc!49 k!2824))))

(declare-fun b!713362 () Bool)

(declare-fun res!476446 () Bool)

(assert (=> b!713362 (=> (not res!476446) (not e!401243))))

(assert (=> b!713362 (= res!476446 (not (contains!3982 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713363 () Bool)

(declare-fun res!476447 () Bool)

(assert (=> b!713363 (=> (not res!476447) (not e!401243))))

(declare-fun -!392 (List!13405 (_ BitVec 64)) List!13405)

(assert (=> b!713363 (= res!476447 (= (-!392 newAcc!49 k!2824) acc!652))))

(declare-fun res!476452 () Bool)

(assert (=> start!63344 (=> (not res!476452) (not e!401243))))

(declare-datatypes ((array!40448 0))(
  ( (array!40449 (arr!19364 (Array (_ BitVec 32) (_ BitVec 64))) (size!19775 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40448)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63344 (= res!476452 (and (bvslt (size!19775 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19775 a!3591))))))

(assert (=> start!63344 e!401243))

(assert (=> start!63344 true))

(declare-fun array_inv!15160 (array!40448) Bool)

(assert (=> start!63344 (array_inv!15160 a!3591)))

(declare-fun b!713364 () Bool)

(declare-fun res!476445 () Bool)

(assert (=> b!713364 (=> (not res!476445) (not e!401243))))

(declare-fun arrayNoDuplicates!0 (array!40448 (_ BitVec 32) List!13405) Bool)

(assert (=> b!713364 (= res!476445 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713365 () Bool)

(declare-fun res!476453 () Bool)

(assert (=> b!713365 (=> (not res!476453) (not e!401243))))

(declare-fun subseq!427 (List!13405 List!13405) Bool)

(assert (=> b!713365 (= res!476453 (subseq!427 acc!652 newAcc!49))))

(declare-fun b!713366 () Bool)

(declare-fun res!476448 () Bool)

(assert (=> b!713366 (=> (not res!476448) (not e!401243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713366 (= res!476448 (validKeyInArray!0 k!2824))))

(declare-fun b!713367 () Bool)

(declare-fun res!476443 () Bool)

(assert (=> b!713367 (=> (not res!476443) (not e!401243))))

(assert (=> b!713367 (= res!476443 (not (contains!3982 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713368 () Bool)

(assert (=> b!713368 (= e!401243 false)))

(declare-fun lt!318695 () Bool)

(assert (=> b!713368 (= lt!318695 (contains!3982 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713369 () Bool)

(declare-fun res!476450 () Bool)

(assert (=> b!713369 (=> (not res!476450) (not e!401243))))

(declare-fun arrayContainsKey!0 (array!40448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713369 (= res!476450 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!713370 () Bool)

(declare-fun res!476451 () Bool)

(assert (=> b!713370 (=> (not res!476451) (not e!401243))))

(assert (=> b!713370 (= res!476451 (noDuplicate!1229 acc!652))))

(declare-fun b!713371 () Bool)

(declare-fun res!476444 () Bool)

(assert (=> b!713371 (=> (not res!476444) (not e!401243))))

(assert (=> b!713371 (= res!476444 (not (contains!3982 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!63344 res!476452) b!713370))

(assert (= (and b!713370 res!476451) b!713359))

(assert (= (and b!713359 res!476449) b!713367))

(assert (= (and b!713367 res!476443) b!713371))

(assert (= (and b!713371 res!476444) b!713369))

(assert (= (and b!713369 res!476450) b!713360))

(assert (= (and b!713360 res!476454) b!713366))

(assert (= (and b!713366 res!476448) b!713364))

(assert (= (and b!713364 res!476445) b!713365))

(assert (= (and b!713365 res!476453) b!713361))

(assert (= (and b!713361 res!476455) b!713363))

(assert (= (and b!713363 res!476447) b!713362))

(assert (= (and b!713362 res!476446) b!713368))

(declare-fun m!670191 () Bool)

(assert (=> b!713365 m!670191))

(declare-fun m!670193 () Bool)

(assert (=> b!713362 m!670193))

(declare-fun m!670195 () Bool)

(assert (=> b!713360 m!670195))

(declare-fun m!670197 () Bool)

(assert (=> b!713370 m!670197))

(declare-fun m!670199 () Bool)

(assert (=> b!713367 m!670199))

(declare-fun m!670201 () Bool)

(assert (=> b!713361 m!670201))

(declare-fun m!670203 () Bool)

(assert (=> b!713368 m!670203))

(declare-fun m!670205 () Bool)

(assert (=> b!713366 m!670205))

(declare-fun m!670207 () Bool)

(assert (=> b!713359 m!670207))

(declare-fun m!670209 () Bool)

(assert (=> b!713364 m!670209))

(declare-fun m!670211 () Bool)

(assert (=> b!713369 m!670211))

(declare-fun m!670213 () Bool)

(assert (=> b!713363 m!670213))

(declare-fun m!670215 () Bool)

(assert (=> b!713371 m!670215))

(declare-fun m!670217 () Bool)

(assert (=> start!63344 m!670217))

(push 1)

(assert (not start!63344))

(assert (not b!713371))

(assert (not b!713365))

(assert (not b!713368))

(assert (not b!713359))

(assert (not b!713364))

(assert (not b!713367))

(assert (not b!713366))

(assert (not b!713360))

(assert (not b!713361))

(assert (not b!713362))

(assert (not b!713370))

(assert (not b!713363))

(assert (not b!713369))

(check-sat)

