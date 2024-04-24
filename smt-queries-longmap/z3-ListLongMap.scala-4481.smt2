; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62410 () Bool)

(assert start!62410)

(declare-fun res!462312 () Bool)

(declare-fun e!397155 () Bool)

(assert (=> start!62410 (=> (not res!462312) (not e!397155))))

(declare-datatypes ((array!40029 0))(
  ( (array!40030 (arr!19168 (Array (_ BitVec 32) (_ BitVec 64))) (size!19551 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40029)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62410 (= res!462312 (and (bvslt (size!19551 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19551 a!3591))))))

(assert (=> start!62410 e!397155))

(assert (=> start!62410 true))

(declare-fun array_inv!15027 (array!40029) Bool)

(assert (=> start!62410 (array_inv!15027 a!3591)))

(declare-fun b!698597 () Bool)

(declare-fun res!462310 () Bool)

(assert (=> b!698597 (=> (not res!462310) (not e!397155))))

(declare-datatypes ((List!13116 0))(
  ( (Nil!13113) (Cons!13112 (h!14160 (_ BitVec 64)) (t!19390 List!13116)) )
))
(declare-fun acc!652 () List!13116)

(declare-fun contains!3768 (List!13116 (_ BitVec 64)) Bool)

(assert (=> b!698597 (= res!462310 (not (contains!3768 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698598 () Bool)

(declare-fun res!462311 () Bool)

(assert (=> b!698598 (=> (not res!462311) (not e!397155))))

(assert (=> b!698598 (= res!462311 (not (contains!3768 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698599 () Bool)

(declare-fun res!462308 () Bool)

(assert (=> b!698599 (=> (not res!462308) (not e!397155))))

(declare-fun noDuplicate!1042 (List!13116) Bool)

(assert (=> b!698599 (= res!462308 (noDuplicate!1042 acc!652))))

(declare-fun b!698600 () Bool)

(assert (=> b!698600 (= e!397155 false)))

(declare-fun lt!317358 () Bool)

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!698600 (= lt!317358 (contains!3768 acc!652 k0!2824))))

(declare-fun b!698601 () Bool)

(declare-fun res!462313 () Bool)

(assert (=> b!698601 (=> (not res!462313) (not e!397155))))

(declare-fun arrayContainsKey!0 (array!40029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698601 (= res!462313 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!698602 () Bool)

(declare-fun res!462309 () Bool)

(assert (=> b!698602 (=> (not res!462309) (not e!397155))))

(declare-fun newAcc!49 () List!13116)

(assert (=> b!698602 (= res!462309 (noDuplicate!1042 newAcc!49))))

(assert (= (and start!62410 res!462312) b!698599))

(assert (= (and b!698599 res!462308) b!698602))

(assert (= (and b!698602 res!462309) b!698598))

(assert (= (and b!698598 res!462311) b!698597))

(assert (= (and b!698597 res!462310) b!698601))

(assert (= (and b!698601 res!462313) b!698600))

(declare-fun m!659325 () Bool)

(assert (=> b!698599 m!659325))

(declare-fun m!659327 () Bool)

(assert (=> b!698598 m!659327))

(declare-fun m!659329 () Bool)

(assert (=> start!62410 m!659329))

(declare-fun m!659331 () Bool)

(assert (=> b!698602 m!659331))

(declare-fun m!659333 () Bool)

(assert (=> b!698600 m!659333))

(declare-fun m!659335 () Bool)

(assert (=> b!698597 m!659335))

(declare-fun m!659337 () Bool)

(assert (=> b!698601 m!659337))

(check-sat (not b!698597) (not b!698601) (not b!698600) (not b!698602) (not start!62410) (not b!698599) (not b!698598))
(check-sat)
