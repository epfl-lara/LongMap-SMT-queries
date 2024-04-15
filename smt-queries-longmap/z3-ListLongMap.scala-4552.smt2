; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63424 () Bool)

(assert start!63424)

(declare-fun b!714197 () Bool)

(declare-fun res!477401 () Bool)

(declare-fun e!401376 () Bool)

(assert (=> b!714197 (=> (not res!477401) (not e!401376))))

(declare-datatypes ((List!13465 0))(
  ( (Nil!13462) (Cons!13461 (h!14506 (_ BitVec 64)) (t!19771 List!13465)) )
))
(declare-fun newAcc!49 () List!13465)

(declare-fun contains!3987 (List!13465 (_ BitVec 64)) Bool)

(assert (=> b!714197 (= res!477401 (not (contains!3987 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714198 () Bool)

(declare-fun res!477403 () Bool)

(assert (=> b!714198 (=> (not res!477403) (not e!401376))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13465)

(declare-fun -!414 (List!13465 (_ BitVec 64)) List!13465)

(assert (=> b!714198 (= res!477403 (= (-!414 newAcc!49 k0!2824) acc!652))))

(declare-fun b!714199 () Bool)

(declare-fun res!477395 () Bool)

(assert (=> b!714199 (=> (not res!477395) (not e!401376))))

(declare-fun noDuplicate!1256 (List!13465) Bool)

(assert (=> b!714199 (= res!477395 (noDuplicate!1256 newAcc!49))))

(declare-fun b!714200 () Bool)

(declare-fun res!477394 () Bool)

(assert (=> b!714200 (=> (not res!477394) (not e!401376))))

(assert (=> b!714200 (= res!477394 (not (contains!3987 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714201 () Bool)

(declare-fun res!477396 () Bool)

(assert (=> b!714201 (=> (not res!477396) (not e!401376))))

(assert (=> b!714201 (= res!477396 (noDuplicate!1256 acc!652))))

(declare-fun b!714202 () Bool)

(declare-fun res!477397 () Bool)

(assert (=> b!714202 (=> (not res!477397) (not e!401376))))

(declare-datatypes ((array!40494 0))(
  ( (array!40495 (arr!19385 (Array (_ BitVec 32) (_ BitVec 64))) (size!19799 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40494)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40494 (_ BitVec 32) List!13465) Bool)

(assert (=> b!714202 (= res!477397 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!714204 () Bool)

(declare-fun res!477398 () Bool)

(assert (=> b!714204 (=> (not res!477398) (not e!401376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714204 (= res!477398 (validKeyInArray!0 k0!2824))))

(declare-fun b!714205 () Bool)

(declare-fun res!477402 () Bool)

(assert (=> b!714205 (=> (not res!477402) (not e!401376))))

(declare-fun arrayContainsKey!0 (array!40494 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714205 (= res!477402 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!714206 () Bool)

(assert (=> b!714206 (= e!401376 false)))

(declare-fun lt!318521 () Bool)

(assert (=> b!714206 (= lt!318521 (contains!3987 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714207 () Bool)

(declare-fun res!477405 () Bool)

(assert (=> b!714207 (=> (not res!477405) (not e!401376))))

(assert (=> b!714207 (= res!477405 (contains!3987 newAcc!49 k0!2824))))

(declare-fun b!714208 () Bool)

(declare-fun res!477404 () Bool)

(assert (=> b!714208 (=> (not res!477404) (not e!401376))))

(assert (=> b!714208 (= res!477404 (not (contains!3987 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714209 () Bool)

(declare-fun res!477399 () Bool)

(assert (=> b!714209 (=> (not res!477399) (not e!401376))))

(assert (=> b!714209 (= res!477399 (not (contains!3987 acc!652 k0!2824)))))

(declare-fun b!714203 () Bool)

(declare-fun res!477393 () Bool)

(assert (=> b!714203 (=> (not res!477393) (not e!401376))))

(declare-fun subseq!449 (List!13465 List!13465) Bool)

(assert (=> b!714203 (= res!477393 (subseq!449 acc!652 newAcc!49))))

(declare-fun res!477400 () Bool)

(assert (=> start!63424 (=> (not res!477400) (not e!401376))))

(assert (=> start!63424 (= res!477400 (and (bvslt (size!19799 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19799 a!3591))))))

(assert (=> start!63424 e!401376))

(assert (=> start!63424 true))

(declare-fun array_inv!15268 (array!40494) Bool)

(assert (=> start!63424 (array_inv!15268 a!3591)))

(assert (= (and start!63424 res!477400) b!714201))

(assert (= (and b!714201 res!477396) b!714199))

(assert (= (and b!714199 res!477395) b!714200))

(assert (= (and b!714200 res!477394) b!714208))

(assert (= (and b!714208 res!477404) b!714205))

(assert (= (and b!714205 res!477402) b!714209))

(assert (= (and b!714209 res!477399) b!714204))

(assert (= (and b!714204 res!477398) b!714202))

(assert (= (and b!714202 res!477397) b!714203))

(assert (= (and b!714203 res!477393) b!714207))

(assert (= (and b!714207 res!477405) b!714198))

(assert (= (and b!714198 res!477403) b!714197))

(assert (= (and b!714197 res!477401) b!714206))

(declare-fun m!670227 () Bool)

(assert (=> b!714201 m!670227))

(declare-fun m!670229 () Bool)

(assert (=> b!714206 m!670229))

(declare-fun m!670231 () Bool)

(assert (=> b!714205 m!670231))

(declare-fun m!670233 () Bool)

(assert (=> b!714204 m!670233))

(declare-fun m!670235 () Bool)

(assert (=> b!714199 m!670235))

(declare-fun m!670237 () Bool)

(assert (=> b!714198 m!670237))

(declare-fun m!670239 () Bool)

(assert (=> b!714197 m!670239))

(declare-fun m!670241 () Bool)

(assert (=> b!714208 m!670241))

(declare-fun m!670243 () Bool)

(assert (=> b!714200 m!670243))

(declare-fun m!670245 () Bool)

(assert (=> b!714203 m!670245))

(declare-fun m!670247 () Bool)

(assert (=> b!714209 m!670247))

(declare-fun m!670249 () Bool)

(assert (=> b!714207 m!670249))

(declare-fun m!670251 () Bool)

(assert (=> start!63424 m!670251))

(declare-fun m!670253 () Bool)

(assert (=> b!714202 m!670253))

(check-sat (not b!714204) (not b!714202) (not b!714200) (not b!714197) (not b!714203) (not b!714201) (not b!714209) (not b!714198) (not start!63424) (not b!714199) (not b!714205) (not b!714208) (not b!714207) (not b!714206))
(check-sat)
