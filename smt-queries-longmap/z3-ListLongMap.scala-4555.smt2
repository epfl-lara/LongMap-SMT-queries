; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63504 () Bool)

(assert start!63504)

(declare-fun b!715244 () Bool)

(declare-fun res!478229 () Bool)

(declare-fun e!401842 () Bool)

(assert (=> b!715244 (=> (not res!478229) (not e!401842))))

(declare-datatypes ((List!13437 0))(
  ( (Nil!13434) (Cons!13433 (h!14478 (_ BitVec 64)) (t!19752 List!13437)) )
))
(declare-fun newAcc!49 () List!13437)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13437)

(declare-fun -!424 (List!13437 (_ BitVec 64)) List!13437)

(assert (=> b!715244 (= res!478229 (= (-!424 newAcc!49 k0!2824) acc!652))))

(declare-fun b!715245 () Bool)

(declare-fun res!478225 () Bool)

(assert (=> b!715245 (=> (not res!478225) (not e!401842))))

(declare-fun contains!4014 (List!13437 (_ BitVec 64)) Bool)

(assert (=> b!715245 (= res!478225 (contains!4014 newAcc!49 k0!2824))))

(declare-fun b!715246 () Bool)

(declare-fun res!478216 () Bool)

(assert (=> b!715246 (=> (not res!478216) (not e!401842))))

(declare-fun subseq!459 (List!13437 List!13437) Bool)

(assert (=> b!715246 (= res!478216 (subseq!459 acc!652 newAcc!49))))

(declare-fun b!715247 () Bool)

(declare-fun res!478230 () Bool)

(assert (=> b!715247 (=> (not res!478230) (not e!401842))))

(declare-fun noDuplicate!1261 (List!13437) Bool)

(assert (=> b!715247 (= res!478230 (noDuplicate!1261 acc!652))))

(declare-fun b!715248 () Bool)

(declare-fun res!478231 () Bool)

(assert (=> b!715248 (=> (not res!478231) (not e!401842))))

(assert (=> b!715248 (= res!478231 (not (contains!4014 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715249 () Bool)

(declare-fun res!478214 () Bool)

(assert (=> b!715249 (=> (not res!478214) (not e!401842))))

(declare-datatypes ((array!40518 0))(
  ( (array!40519 (arr!19396 (Array (_ BitVec 32) (_ BitVec 64))) (size!19812 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40518)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715249 (= res!478214 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!715250 () Bool)

(declare-fun res!478220 () Bool)

(assert (=> b!715250 (=> (not res!478220) (not e!401842))))

(assert (=> b!715250 (= res!478220 (not (contains!4014 acc!652 k0!2824)))))

(declare-fun res!478226 () Bool)

(assert (=> start!63504 (=> (not res!478226) (not e!401842))))

(assert (=> start!63504 (= res!478226 (and (bvslt (size!19812 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19812 a!3591))))))

(assert (=> start!63504 e!401842))

(assert (=> start!63504 true))

(declare-fun array_inv!15192 (array!40518) Bool)

(assert (=> start!63504 (array_inv!15192 a!3591)))

(declare-fun b!715251 () Bool)

(declare-fun res!478217 () Bool)

(assert (=> b!715251 (=> (not res!478217) (not e!401842))))

(declare-fun arrayNoDuplicates!0 (array!40518 (_ BitVec 32) List!13437) Bool)

(assert (=> b!715251 (= res!478217 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715252 () Bool)

(declare-fun res!478219 () Bool)

(assert (=> b!715252 (=> (not res!478219) (not e!401842))))

(assert (=> b!715252 (= res!478219 (noDuplicate!1261 newAcc!49))))

(declare-fun b!715253 () Bool)

(declare-fun res!478222 () Bool)

(assert (=> b!715253 (=> (not res!478222) (not e!401842))))

(assert (=> b!715253 (= res!478222 (not (contains!4014 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715254 () Bool)

(declare-fun res!478224 () Bool)

(assert (=> b!715254 (=> (not res!478224) (not e!401842))))

(assert (=> b!715254 (= res!478224 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715255 () Bool)

(declare-fun res!478221 () Bool)

(assert (=> b!715255 (=> (not res!478221) (not e!401842))))

(assert (=> b!715255 (= res!478221 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19812 a!3591)))))

(declare-fun b!715256 () Bool)

(declare-fun res!478218 () Bool)

(assert (=> b!715256 (=> (not res!478218) (not e!401842))))

(assert (=> b!715256 (= res!478218 (not (contains!4014 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715257 () Bool)

(declare-fun res!478228 () Bool)

(assert (=> b!715257 (=> (not res!478228) (not e!401842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715257 (= res!478228 (not (validKeyInArray!0 (select (arr!19396 a!3591) from!2969))))))

(declare-fun b!715258 () Bool)

(declare-fun res!478223 () Bool)

(assert (=> b!715258 (=> (not res!478223) (not e!401842))))

(assert (=> b!715258 (= res!478223 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715259 () Bool)

(declare-fun res!478227 () Bool)

(assert (=> b!715259 (=> (not res!478227) (not e!401842))))

(assert (=> b!715259 (= res!478227 (validKeyInArray!0 k0!2824))))

(declare-fun b!715260 () Bool)

(assert (=> b!715260 (= e!401842 false)))

(declare-fun lt!318830 () Bool)

(assert (=> b!715260 (= lt!318830 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715261 () Bool)

(declare-fun res!478215 () Bool)

(assert (=> b!715261 (=> (not res!478215) (not e!401842))))

(assert (=> b!715261 (= res!478215 (not (contains!4014 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!63504 res!478226) b!715247))

(assert (= (and b!715247 res!478230) b!715252))

(assert (= (and b!715252 res!478219) b!715261))

(assert (= (and b!715261 res!478215) b!715256))

(assert (= (and b!715256 res!478218) b!715249))

(assert (= (and b!715249 res!478214) b!715250))

(assert (= (and b!715250 res!478220) b!715259))

(assert (= (and b!715259 res!478227) b!715251))

(assert (= (and b!715251 res!478217) b!715246))

(assert (= (and b!715246 res!478216) b!715245))

(assert (= (and b!715245 res!478225) b!715244))

(assert (= (and b!715244 res!478229) b!715248))

(assert (= (and b!715248 res!478231) b!715253))

(assert (= (and b!715253 res!478222) b!715255))

(assert (= (and b!715255 res!478221) b!715257))

(assert (= (and b!715257 res!478228) b!715258))

(assert (= (and b!715258 res!478223) b!715254))

(assert (= (and b!715254 res!478224) b!715260))

(declare-fun m!671551 () Bool)

(assert (=> b!715259 m!671551))

(declare-fun m!671553 () Bool)

(assert (=> b!715253 m!671553))

(declare-fun m!671555 () Bool)

(assert (=> b!715260 m!671555))

(declare-fun m!671557 () Bool)

(assert (=> b!715251 m!671557))

(declare-fun m!671559 () Bool)

(assert (=> b!715250 m!671559))

(declare-fun m!671561 () Bool)

(assert (=> b!715261 m!671561))

(declare-fun m!671563 () Bool)

(assert (=> b!715246 m!671563))

(declare-fun m!671565 () Bool)

(assert (=> b!715247 m!671565))

(declare-fun m!671567 () Bool)

(assert (=> b!715257 m!671567))

(assert (=> b!715257 m!671567))

(declare-fun m!671569 () Bool)

(assert (=> b!715257 m!671569))

(declare-fun m!671571 () Bool)

(assert (=> b!715248 m!671571))

(declare-fun m!671573 () Bool)

(assert (=> b!715245 m!671573))

(declare-fun m!671575 () Bool)

(assert (=> b!715249 m!671575))

(declare-fun m!671577 () Bool)

(assert (=> start!63504 m!671577))

(declare-fun m!671579 () Bool)

(assert (=> b!715252 m!671579))

(declare-fun m!671581 () Bool)

(assert (=> b!715244 m!671581))

(declare-fun m!671583 () Bool)

(assert (=> b!715256 m!671583))

(declare-fun m!671585 () Bool)

(assert (=> b!715254 m!671585))

(check-sat (not b!715244) (not b!715245) (not b!715251) (not b!715248) (not b!715250) (not b!715253) (not b!715257) (not b!715246) (not b!715254) (not b!715259) (not b!715260) (not start!63504) (not b!715247) (not b!715256) (not b!715249) (not b!715252) (not b!715261))
(check-sat)
