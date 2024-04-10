; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63342 () Bool)

(assert start!63342)

(declare-fun b!713320 () Bool)

(declare-fun res!476416 () Bool)

(declare-fun e!401237 () Bool)

(assert (=> b!713320 (=> (not res!476416) (not e!401237))))

(declare-datatypes ((List!13404 0))(
  ( (Nil!13401) (Cons!13400 (h!14445 (_ BitVec 64)) (t!19719 List!13404)) )
))
(declare-fun acc!652 () List!13404)

(declare-fun newAcc!49 () List!13404)

(declare-fun subseq!426 (List!13404 List!13404) Bool)

(assert (=> b!713320 (= res!476416 (subseq!426 acc!652 newAcc!49))))

(declare-fun b!713321 () Bool)

(declare-fun res!476407 () Bool)

(assert (=> b!713321 (=> (not res!476407) (not e!401237))))

(declare-fun noDuplicate!1228 (List!13404) Bool)

(assert (=> b!713321 (= res!476407 (noDuplicate!1228 acc!652))))

(declare-fun b!713322 () Bool)

(declare-fun res!476405 () Bool)

(assert (=> b!713322 (=> (not res!476405) (not e!401237))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713322 (= res!476405 (validKeyInArray!0 k0!2824))))

(declare-fun res!476404 () Bool)

(assert (=> start!63342 (=> (not res!476404) (not e!401237))))

(declare-datatypes ((array!40446 0))(
  ( (array!40447 (arr!19363 (Array (_ BitVec 32) (_ BitVec 64))) (size!19774 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40446)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63342 (= res!476404 (and (bvslt (size!19774 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19774 a!3591))))))

(assert (=> start!63342 e!401237))

(assert (=> start!63342 true))

(declare-fun array_inv!15159 (array!40446) Bool)

(assert (=> start!63342 (array_inv!15159 a!3591)))

(declare-fun b!713323 () Bool)

(declare-fun res!476409 () Bool)

(assert (=> b!713323 (=> (not res!476409) (not e!401237))))

(declare-fun -!391 (List!13404 (_ BitVec 64)) List!13404)

(assert (=> b!713323 (= res!476409 (= (-!391 newAcc!49 k0!2824) acc!652))))

(declare-fun b!713324 () Bool)

(declare-fun res!476414 () Bool)

(assert (=> b!713324 (=> (not res!476414) (not e!401237))))

(declare-fun contains!3981 (List!13404 (_ BitVec 64)) Bool)

(assert (=> b!713324 (= res!476414 (not (contains!3981 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713325 () Bool)

(declare-fun res!476408 () Bool)

(assert (=> b!713325 (=> (not res!476408) (not e!401237))))

(assert (=> b!713325 (= res!476408 (not (contains!3981 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713326 () Bool)

(declare-fun res!476406 () Bool)

(assert (=> b!713326 (=> (not res!476406) (not e!401237))))

(assert (=> b!713326 (= res!476406 (noDuplicate!1228 newAcc!49))))

(declare-fun b!713327 () Bool)

(declare-fun res!476412 () Bool)

(assert (=> b!713327 (=> (not res!476412) (not e!401237))))

(declare-fun arrayNoDuplicates!0 (array!40446 (_ BitVec 32) List!13404) Bool)

(assert (=> b!713327 (= res!476412 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713328 () Bool)

(assert (=> b!713328 (= e!401237 false)))

(declare-fun lt!318692 () Bool)

(assert (=> b!713328 (= lt!318692 (contains!3981 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713329 () Bool)

(declare-fun res!476415 () Bool)

(assert (=> b!713329 (=> (not res!476415) (not e!401237))))

(assert (=> b!713329 (= res!476415 (not (contains!3981 acc!652 k0!2824)))))

(declare-fun b!713330 () Bool)

(declare-fun res!476413 () Bool)

(assert (=> b!713330 (=> (not res!476413) (not e!401237))))

(assert (=> b!713330 (= res!476413 (contains!3981 newAcc!49 k0!2824))))

(declare-fun b!713331 () Bool)

(declare-fun res!476411 () Bool)

(assert (=> b!713331 (=> (not res!476411) (not e!401237))))

(assert (=> b!713331 (= res!476411 (not (contains!3981 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713332 () Bool)

(declare-fun res!476410 () Bool)

(assert (=> b!713332 (=> (not res!476410) (not e!401237))))

(declare-fun arrayContainsKey!0 (array!40446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713332 (= res!476410 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(assert (= (and start!63342 res!476404) b!713321))

(assert (= (and b!713321 res!476407) b!713326))

(assert (= (and b!713326 res!476406) b!713324))

(assert (= (and b!713324 res!476414) b!713331))

(assert (= (and b!713331 res!476411) b!713332))

(assert (= (and b!713332 res!476410) b!713329))

(assert (= (and b!713329 res!476415) b!713322))

(assert (= (and b!713322 res!476405) b!713327))

(assert (= (and b!713327 res!476412) b!713320))

(assert (= (and b!713320 res!476416) b!713330))

(assert (= (and b!713330 res!476413) b!713323))

(assert (= (and b!713323 res!476409) b!713325))

(assert (= (and b!713325 res!476408) b!713328))

(declare-fun m!670163 () Bool)

(assert (=> b!713329 m!670163))

(declare-fun m!670165 () Bool)

(assert (=> b!713322 m!670165))

(declare-fun m!670167 () Bool)

(assert (=> b!713327 m!670167))

(declare-fun m!670169 () Bool)

(assert (=> b!713326 m!670169))

(declare-fun m!670171 () Bool)

(assert (=> start!63342 m!670171))

(declare-fun m!670173 () Bool)

(assert (=> b!713320 m!670173))

(declare-fun m!670175 () Bool)

(assert (=> b!713325 m!670175))

(declare-fun m!670177 () Bool)

(assert (=> b!713332 m!670177))

(declare-fun m!670179 () Bool)

(assert (=> b!713331 m!670179))

(declare-fun m!670181 () Bool)

(assert (=> b!713321 m!670181))

(declare-fun m!670183 () Bool)

(assert (=> b!713323 m!670183))

(declare-fun m!670185 () Bool)

(assert (=> b!713328 m!670185))

(declare-fun m!670187 () Bool)

(assert (=> b!713330 m!670187))

(declare-fun m!670189 () Bool)

(assert (=> b!713324 m!670189))

(check-sat (not b!713328) (not b!713332) (not b!713320) (not b!713326) (not b!713329) (not b!713324) (not b!713330) (not b!713325) (not b!713331) (not start!63342) (not b!713323) (not b!713321) (not b!713322) (not b!713327))
(check-sat)
