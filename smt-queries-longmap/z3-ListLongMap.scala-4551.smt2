; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63418 () Bool)

(assert start!63418)

(declare-fun b!714080 () Bool)

(declare-fun res!477286 () Bool)

(declare-fun e!401358 () Bool)

(assert (=> b!714080 (=> (not res!477286) (not e!401358))))

(declare-datatypes ((array!40488 0))(
  ( (array!40489 (arr!19382 (Array (_ BitVec 32) (_ BitVec 64))) (size!19796 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40488)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13462 0))(
  ( (Nil!13459) (Cons!13458 (h!14503 (_ BitVec 64)) (t!19768 List!13462)) )
))
(declare-fun acc!652 () List!13462)

(declare-fun arrayNoDuplicates!0 (array!40488 (_ BitVec 32) List!13462) Bool)

(assert (=> b!714080 (= res!477286 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!714081 () Bool)

(declare-fun res!477287 () Bool)

(assert (=> b!714081 (=> (not res!477287) (not e!401358))))

(declare-fun newAcc!49 () List!13462)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun -!411 (List!13462 (_ BitVec 64)) List!13462)

(assert (=> b!714081 (= res!477287 (= (-!411 newAcc!49 k0!2824) acc!652))))

(declare-fun b!714082 () Bool)

(declare-fun res!477281 () Bool)

(assert (=> b!714082 (=> (not res!477281) (not e!401358))))

(declare-fun contains!3984 (List!13462 (_ BitVec 64)) Bool)

(assert (=> b!714082 (= res!477281 (not (contains!3984 acc!652 k0!2824)))))

(declare-fun b!714083 () Bool)

(declare-fun res!477279 () Bool)

(assert (=> b!714083 (=> (not res!477279) (not e!401358))))

(assert (=> b!714083 (= res!477279 (not (contains!3984 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714084 () Bool)

(declare-fun res!477282 () Bool)

(assert (=> b!714084 (=> (not res!477282) (not e!401358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714084 (= res!477282 (validKeyInArray!0 k0!2824))))

(declare-fun b!714085 () Bool)

(declare-fun res!477276 () Bool)

(assert (=> b!714085 (=> (not res!477276) (not e!401358))))

(assert (=> b!714085 (= res!477276 (contains!3984 newAcc!49 k0!2824))))

(declare-fun b!714087 () Bool)

(declare-fun res!477284 () Bool)

(assert (=> b!714087 (=> (not res!477284) (not e!401358))))

(declare-fun noDuplicate!1253 (List!13462) Bool)

(assert (=> b!714087 (= res!477284 (noDuplicate!1253 acc!652))))

(declare-fun b!714088 () Bool)

(assert (=> b!714088 (= e!401358 false)))

(declare-fun lt!318512 () Bool)

(assert (=> b!714088 (= lt!318512 (contains!3984 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714089 () Bool)

(declare-fun res!477288 () Bool)

(assert (=> b!714089 (=> (not res!477288) (not e!401358))))

(assert (=> b!714089 (= res!477288 (noDuplicate!1253 newAcc!49))))

(declare-fun b!714090 () Bool)

(declare-fun res!477280 () Bool)

(assert (=> b!714090 (=> (not res!477280) (not e!401358))))

(declare-fun arrayContainsKey!0 (array!40488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714090 (= res!477280 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!714091 () Bool)

(declare-fun res!477277 () Bool)

(assert (=> b!714091 (=> (not res!477277) (not e!401358))))

(assert (=> b!714091 (= res!477277 (not (contains!3984 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714092 () Bool)

(declare-fun res!477278 () Bool)

(assert (=> b!714092 (=> (not res!477278) (not e!401358))))

(assert (=> b!714092 (= res!477278 (not (contains!3984 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!477285 () Bool)

(assert (=> start!63418 (=> (not res!477285) (not e!401358))))

(assert (=> start!63418 (= res!477285 (and (bvslt (size!19796 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19796 a!3591))))))

(assert (=> start!63418 e!401358))

(assert (=> start!63418 true))

(declare-fun array_inv!15265 (array!40488) Bool)

(assert (=> start!63418 (array_inv!15265 a!3591)))

(declare-fun b!714086 () Bool)

(declare-fun res!477283 () Bool)

(assert (=> b!714086 (=> (not res!477283) (not e!401358))))

(declare-fun subseq!446 (List!13462 List!13462) Bool)

(assert (=> b!714086 (= res!477283 (subseq!446 acc!652 newAcc!49))))

(assert (= (and start!63418 res!477285) b!714087))

(assert (= (and b!714087 res!477284) b!714089))

(assert (= (and b!714089 res!477288) b!714083))

(assert (= (and b!714083 res!477279) b!714091))

(assert (= (and b!714091 res!477277) b!714090))

(assert (= (and b!714090 res!477280) b!714082))

(assert (= (and b!714082 res!477281) b!714084))

(assert (= (and b!714084 res!477282) b!714080))

(assert (= (and b!714080 res!477286) b!714086))

(assert (= (and b!714086 res!477283) b!714085))

(assert (= (and b!714085 res!477276) b!714081))

(assert (= (and b!714081 res!477287) b!714092))

(assert (= (and b!714092 res!477278) b!714088))

(declare-fun m!670143 () Bool)

(assert (=> b!714085 m!670143))

(declare-fun m!670145 () Bool)

(assert (=> b!714090 m!670145))

(declare-fun m!670147 () Bool)

(assert (=> b!714080 m!670147))

(declare-fun m!670149 () Bool)

(assert (=> b!714091 m!670149))

(declare-fun m!670151 () Bool)

(assert (=> b!714083 m!670151))

(declare-fun m!670153 () Bool)

(assert (=> b!714089 m!670153))

(declare-fun m!670155 () Bool)

(assert (=> b!714081 m!670155))

(declare-fun m!670157 () Bool)

(assert (=> b!714082 m!670157))

(declare-fun m!670159 () Bool)

(assert (=> b!714092 m!670159))

(declare-fun m!670161 () Bool)

(assert (=> b!714087 m!670161))

(declare-fun m!670163 () Bool)

(assert (=> b!714088 m!670163))

(declare-fun m!670165 () Bool)

(assert (=> b!714086 m!670165))

(declare-fun m!670167 () Bool)

(assert (=> start!63418 m!670167))

(declare-fun m!670169 () Bool)

(assert (=> b!714084 m!670169))

(check-sat (not b!714085) (not b!714090) (not b!714092) (not b!714083) (not b!714084) (not b!714082) (not b!714081) (not b!714088) (not b!714091) (not b!714087) (not b!714089) (not b!714086) (not start!63418) (not b!714080))
(check-sat)
