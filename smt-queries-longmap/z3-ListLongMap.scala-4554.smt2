; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63498 () Bool)

(assert start!63498)

(declare-fun b!715082 () Bool)

(declare-fun res!478062 () Bool)

(declare-fun e!401824 () Bool)

(assert (=> b!715082 (=> (not res!478062) (not e!401824))))

(declare-datatypes ((List!13434 0))(
  ( (Nil!13431) (Cons!13430 (h!14475 (_ BitVec 64)) (t!19749 List!13434)) )
))
(declare-fun acc!652 () List!13434)

(declare-fun contains!4011 (List!13434 (_ BitVec 64)) Bool)

(assert (=> b!715082 (= res!478062 (not (contains!4011 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715083 () Bool)

(declare-fun res!478066 () Bool)

(assert (=> b!715083 (=> (not res!478066) (not e!401824))))

(declare-fun newAcc!49 () List!13434)

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!715083 (= res!478066 (contains!4011 newAcc!49 k0!2824))))

(declare-fun b!715084 () Bool)

(declare-fun res!478065 () Bool)

(assert (=> b!715084 (=> (not res!478065) (not e!401824))))

(declare-fun noDuplicate!1258 (List!13434) Bool)

(assert (=> b!715084 (= res!478065 (noDuplicate!1258 newAcc!49))))

(declare-fun b!715085 () Bool)

(declare-fun res!478054 () Bool)

(assert (=> b!715085 (=> (not res!478054) (not e!401824))))

(assert (=> b!715085 (= res!478054 (noDuplicate!1258 acc!652))))

(declare-fun b!715086 () Bool)

(declare-fun res!478055 () Bool)

(assert (=> b!715086 (=> (not res!478055) (not e!401824))))

(declare-fun subseq!456 (List!13434 List!13434) Bool)

(assert (=> b!715086 (= res!478055 (subseq!456 acc!652 newAcc!49))))

(declare-fun b!715087 () Bool)

(declare-fun res!478061 () Bool)

(assert (=> b!715087 (=> (not res!478061) (not e!401824))))

(assert (=> b!715087 (= res!478061 (not (contains!4011 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715089 () Bool)

(assert (=> b!715089 (= e!401824 false)))

(declare-datatypes ((array!40512 0))(
  ( (array!40513 (arr!19393 (Array (_ BitVec 32) (_ BitVec 64))) (size!19809 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40512)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun lt!318821 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40512 (_ BitVec 32) List!13434) Bool)

(assert (=> b!715089 (= lt!318821 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715090 () Bool)

(declare-fun res!478053 () Bool)

(assert (=> b!715090 (=> (not res!478053) (not e!401824))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715090 (= res!478053 (not (validKeyInArray!0 (select (arr!19393 a!3591) from!2969))))))

(declare-fun b!715091 () Bool)

(declare-fun res!478052 () Bool)

(assert (=> b!715091 (=> (not res!478052) (not e!401824))))

(assert (=> b!715091 (= res!478052 (not (contains!4011 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715092 () Bool)

(declare-fun res!478059 () Bool)

(assert (=> b!715092 (=> (not res!478059) (not e!401824))))

(assert (=> b!715092 (= res!478059 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715093 () Bool)

(declare-fun res!478063 () Bool)

(assert (=> b!715093 (=> (not res!478063) (not e!401824))))

(assert (=> b!715093 (= res!478063 (not (contains!4011 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715088 () Bool)

(declare-fun res!478058 () Bool)

(assert (=> b!715088 (=> (not res!478058) (not e!401824))))

(declare-fun arrayContainsKey!0 (array!40512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715088 (= res!478058 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun res!478067 () Bool)

(assert (=> start!63498 (=> (not res!478067) (not e!401824))))

(assert (=> start!63498 (= res!478067 (and (bvslt (size!19809 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19809 a!3591))))))

(assert (=> start!63498 e!401824))

(assert (=> start!63498 true))

(declare-fun array_inv!15189 (array!40512) Bool)

(assert (=> start!63498 (array_inv!15189 a!3591)))

(declare-fun b!715094 () Bool)

(declare-fun res!478068 () Bool)

(assert (=> b!715094 (=> (not res!478068) (not e!401824))))

(assert (=> b!715094 (= res!478068 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715095 () Bool)

(declare-fun res!478057 () Bool)

(assert (=> b!715095 (=> (not res!478057) (not e!401824))))

(declare-fun -!421 (List!13434 (_ BitVec 64)) List!13434)

(assert (=> b!715095 (= res!478057 (= (-!421 newAcc!49 k0!2824) acc!652))))

(declare-fun b!715096 () Bool)

(declare-fun res!478056 () Bool)

(assert (=> b!715096 (=> (not res!478056) (not e!401824))))

(assert (=> b!715096 (= res!478056 (not (contains!4011 acc!652 k0!2824)))))

(declare-fun b!715097 () Bool)

(declare-fun res!478064 () Bool)

(assert (=> b!715097 (=> (not res!478064) (not e!401824))))

(assert (=> b!715097 (= res!478064 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!715098 () Bool)

(declare-fun res!478060 () Bool)

(assert (=> b!715098 (=> (not res!478060) (not e!401824))))

(assert (=> b!715098 (= res!478060 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19809 a!3591)))))

(declare-fun b!715099 () Bool)

(declare-fun res!478069 () Bool)

(assert (=> b!715099 (=> (not res!478069) (not e!401824))))

(assert (=> b!715099 (= res!478069 (validKeyInArray!0 k0!2824))))

(assert (= (and start!63498 res!478067) b!715085))

(assert (= (and b!715085 res!478054) b!715084))

(assert (= (and b!715084 res!478065) b!715091))

(assert (= (and b!715091 res!478052) b!715082))

(assert (= (and b!715082 res!478062) b!715097))

(assert (= (and b!715097 res!478064) b!715096))

(assert (= (and b!715096 res!478056) b!715099))

(assert (= (and b!715099 res!478069) b!715092))

(assert (= (and b!715092 res!478059) b!715086))

(assert (= (and b!715086 res!478055) b!715083))

(assert (= (and b!715083 res!478066) b!715095))

(assert (= (and b!715095 res!478057) b!715087))

(assert (= (and b!715087 res!478061) b!715093))

(assert (= (and b!715093 res!478063) b!715098))

(assert (= (and b!715098 res!478060) b!715090))

(assert (= (and b!715090 res!478053) b!715094))

(assert (= (and b!715094 res!478068) b!715088))

(assert (= (and b!715088 res!478058) b!715089))

(declare-fun m!671443 () Bool)

(assert (=> b!715091 m!671443))

(declare-fun m!671445 () Bool)

(assert (=> b!715090 m!671445))

(assert (=> b!715090 m!671445))

(declare-fun m!671447 () Bool)

(assert (=> b!715090 m!671447))

(declare-fun m!671449 () Bool)

(assert (=> b!715086 m!671449))

(declare-fun m!671451 () Bool)

(assert (=> b!715093 m!671451))

(declare-fun m!671453 () Bool)

(assert (=> b!715092 m!671453))

(declare-fun m!671455 () Bool)

(assert (=> b!715099 m!671455))

(declare-fun m!671457 () Bool)

(assert (=> b!715082 m!671457))

(declare-fun m!671459 () Bool)

(assert (=> b!715085 m!671459))

(declare-fun m!671461 () Bool)

(assert (=> b!715088 m!671461))

(declare-fun m!671463 () Bool)

(assert (=> b!715083 m!671463))

(declare-fun m!671465 () Bool)

(assert (=> b!715087 m!671465))

(declare-fun m!671467 () Bool)

(assert (=> b!715096 m!671467))

(declare-fun m!671469 () Bool)

(assert (=> b!715084 m!671469))

(declare-fun m!671471 () Bool)

(assert (=> b!715095 m!671471))

(declare-fun m!671473 () Bool)

(assert (=> b!715089 m!671473))

(declare-fun m!671475 () Bool)

(assert (=> start!63498 m!671475))

(declare-fun m!671477 () Bool)

(assert (=> b!715097 m!671477))

(check-sat (not b!715086) (not b!715092) (not b!715097) (not b!715099) (not b!715084) (not b!715096) (not b!715082) (not b!715090) (not start!63498) (not b!715091) (not b!715095) (not b!715083) (not b!715089) (not b!715088) (not b!715093) (not b!715087) (not b!715085))
(check-sat)
