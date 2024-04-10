; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62338 () Bool)

(assert start!62338)

(declare-fun b!698268 () Bool)

(declare-fun res!462081 () Bool)

(declare-fun e!396991 () Bool)

(assert (=> b!698268 (=> (not res!462081) (not e!396991))))

(declare-datatypes ((List!13206 0))(
  ( (Nil!13203) (Cons!13202 (h!14247 (_ BitVec 64)) (t!19488 List!13206)) )
))
(declare-fun acc!652 () List!13206)

(declare-fun noDuplicate!1030 (List!13206) Bool)

(assert (=> b!698268 (= res!462081 (noDuplicate!1030 acc!652))))

(declare-fun b!698271 () Bool)

(assert (=> b!698271 (= e!396991 false)))

(declare-fun lt!317244 () Bool)

(declare-fun contains!3783 (List!13206 (_ BitVec 64)) Bool)

(assert (=> b!698271 (= lt!317244 (contains!3783 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!698270 () Bool)

(declare-fun res!462079 () Bool)

(assert (=> b!698270 (=> (not res!462079) (not e!396991))))

(assert (=> b!698270 (= res!462079 (not (contains!3783 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698269 () Bool)

(declare-fun res!462080 () Bool)

(assert (=> b!698269 (=> (not res!462080) (not e!396991))))

(declare-fun newAcc!49 () List!13206)

(assert (=> b!698269 (= res!462080 (noDuplicate!1030 newAcc!49))))

(declare-fun res!462078 () Bool)

(assert (=> start!62338 (=> (not res!462078) (not e!396991))))

(declare-datatypes ((array!40017 0))(
  ( (array!40018 (arr!19165 (Array (_ BitVec 32) (_ BitVec 64))) (size!19550 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40017)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62338 (= res!462078 (and (bvslt (size!19550 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19550 a!3591))))))

(assert (=> start!62338 e!396991))

(declare-fun array_inv!14961 (array!40017) Bool)

(assert (=> start!62338 (array_inv!14961 a!3591)))

(assert (=> start!62338 true))

(assert (= (and start!62338 res!462078) b!698268))

(assert (= (and b!698268 res!462081) b!698269))

(assert (= (and b!698269 res!462080) b!698270))

(assert (= (and b!698270 res!462079) b!698271))

(declare-fun m!658571 () Bool)

(assert (=> b!698269 m!658571))

(declare-fun m!658573 () Bool)

(assert (=> b!698270 m!658573))

(declare-fun m!658575 () Bool)

(assert (=> b!698271 m!658575))

(declare-fun m!658577 () Bool)

(assert (=> b!698268 m!658577))

(declare-fun m!658579 () Bool)

(assert (=> start!62338 m!658579))

(check-sat (not b!698271) (not b!698270) (not b!698269) (not b!698268) (not start!62338))
(check-sat)
