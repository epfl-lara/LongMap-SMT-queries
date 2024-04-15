; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63340 () Bool)

(assert start!63340)

(declare-fun b!713238 () Bool)

(declare-fun res!476497 () Bool)

(declare-fun e!401071 () Bool)

(assert (=> b!713238 (=> (not res!476497) (not e!401071))))

(declare-datatypes ((List!13447 0))(
  ( (Nil!13444) (Cons!13443 (h!14488 (_ BitVec 64)) (t!19753 List!13447)) )
))
(declare-fun newAcc!49 () List!13447)

(declare-fun noDuplicate!1238 (List!13447) Bool)

(assert (=> b!713238 (= res!476497 (noDuplicate!1238 newAcc!49))))

(declare-fun b!713239 () Bool)

(declare-fun res!476487 () Bool)

(assert (=> b!713239 (=> (not res!476487) (not e!401071))))

(declare-fun acc!652 () List!13447)

(declare-fun contains!3969 (List!13447 (_ BitVec 64)) Bool)

(assert (=> b!713239 (= res!476487 (not (contains!3969 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713240 () Bool)

(declare-fun res!476494 () Bool)

(assert (=> b!713240 (=> (not res!476494) (not e!401071))))

(assert (=> b!713240 (= res!476494 (noDuplicate!1238 acc!652))))

(declare-fun b!713241 () Bool)

(declare-fun res!476496 () Bool)

(assert (=> b!713241 (=> (not res!476496) (not e!401071))))

(assert (=> b!713241 (= res!476496 (not (contains!3969 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713242 () Bool)

(declare-fun res!476498 () Bool)

(assert (=> b!713242 (=> (not res!476498) (not e!401071))))

(declare-fun subseq!431 (List!13447 List!13447) Bool)

(assert (=> b!713242 (= res!476498 (subseq!431 acc!652 newAcc!49))))

(declare-fun b!713243 () Bool)

(declare-fun res!476491 () Bool)

(assert (=> b!713243 (=> (not res!476491) (not e!401071))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713243 (= res!476491 (validKeyInArray!0 k0!2824))))

(declare-fun b!713244 () Bool)

(declare-fun res!476499 () Bool)

(assert (=> b!713244 (=> (not res!476499) (not e!401071))))

(declare-datatypes ((array!40455 0))(
  ( (array!40456 (arr!19367 (Array (_ BitVec 32) (_ BitVec 64))) (size!19779 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40455)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40455 (_ BitVec 32) List!13447) Bool)

(assert (=> b!713244 (= res!476499 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713245 () Bool)

(declare-fun res!476488 () Bool)

(assert (=> b!713245 (=> (not res!476488) (not e!401071))))

(assert (=> b!713245 (= res!476488 (not (contains!3969 acc!652 k0!2824)))))

(declare-fun b!713246 () Bool)

(declare-fun res!476495 () Bool)

(assert (=> b!713246 (=> (not res!476495) (not e!401071))))

(declare-fun arrayContainsKey!0 (array!40455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713246 (= res!476495 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!713247 () Bool)

(declare-fun res!476489 () Bool)

(assert (=> b!713247 (=> (not res!476489) (not e!401071))))

(declare-fun -!396 (List!13447 (_ BitVec 64)) List!13447)

(assert (=> b!713247 (= res!476489 (= (-!396 newAcc!49 k0!2824) acc!652))))

(declare-fun b!713237 () Bool)

(declare-fun res!476490 () Bool)

(assert (=> b!713237 (=> (not res!476490) (not e!401071))))

(assert (=> b!713237 (= res!476490 (contains!3969 newAcc!49 k0!2824))))

(declare-fun res!476492 () Bool)

(assert (=> start!63340 (=> (not res!476492) (not e!401071))))

(assert (=> start!63340 (= res!476492 (and (bvslt (size!19779 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19779 a!3591))))))

(assert (=> start!63340 e!401071))

(assert (=> start!63340 true))

(declare-fun array_inv!15250 (array!40455) Bool)

(assert (=> start!63340 (array_inv!15250 a!3591)))

(declare-fun b!713248 () Bool)

(declare-fun res!476493 () Bool)

(assert (=> b!713248 (=> (not res!476493) (not e!401071))))

(assert (=> b!713248 (= res!476493 (not (contains!3969 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713249 () Bool)

(assert (=> b!713249 (= e!401071 false)))

(declare-fun lt!318443 () Bool)

(assert (=> b!713249 (= lt!318443 (contains!3969 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!63340 res!476492) b!713240))

(assert (= (and b!713240 res!476494) b!713238))

(assert (= (and b!713238 res!476497) b!713239))

(assert (= (and b!713239 res!476487) b!713241))

(assert (= (and b!713241 res!476496) b!713246))

(assert (= (and b!713246 res!476495) b!713245))

(assert (= (and b!713245 res!476488) b!713243))

(assert (= (and b!713243 res!476491) b!713244))

(assert (= (and b!713244 res!476499) b!713242))

(assert (= (and b!713242 res!476498) b!713237))

(assert (= (and b!713237 res!476490) b!713247))

(assert (= (and b!713247 res!476489) b!713248))

(assert (= (and b!713248 res!476493) b!713249))

(declare-fun m!669525 () Bool)

(assert (=> b!713242 m!669525))

(declare-fun m!669527 () Bool)

(assert (=> b!713243 m!669527))

(declare-fun m!669529 () Bool)

(assert (=> b!713245 m!669529))

(declare-fun m!669531 () Bool)

(assert (=> b!713240 m!669531))

(declare-fun m!669533 () Bool)

(assert (=> b!713247 m!669533))

(declare-fun m!669535 () Bool)

(assert (=> b!713249 m!669535))

(declare-fun m!669537 () Bool)

(assert (=> b!713248 m!669537))

(declare-fun m!669539 () Bool)

(assert (=> b!713239 m!669539))

(declare-fun m!669541 () Bool)

(assert (=> b!713238 m!669541))

(declare-fun m!669543 () Bool)

(assert (=> b!713241 m!669543))

(declare-fun m!669545 () Bool)

(assert (=> start!63340 m!669545))

(declare-fun m!669547 () Bool)

(assert (=> b!713246 m!669547))

(declare-fun m!669549 () Bool)

(assert (=> b!713244 m!669549))

(declare-fun m!669551 () Bool)

(assert (=> b!713237 m!669551))

(check-sat (not b!713247) (not b!713243) (not b!713239) (not start!63340) (not b!713242) (not b!713238) (not b!713245) (not b!713237) (not b!713241) (not b!713249) (not b!713246) (not b!713244) (not b!713240) (not b!713248))
(check-sat)
