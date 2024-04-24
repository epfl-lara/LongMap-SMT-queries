; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62386 () Bool)

(assert start!62386)

(declare-fun res!462127 () Bool)

(declare-fun e!397082 () Bool)

(assert (=> start!62386 (=> (not res!462127) (not e!397082))))

(declare-datatypes ((array!40005 0))(
  ( (array!40006 (arr!19156 (Array (_ BitVec 32) (_ BitVec 64))) (size!19539 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40005)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62386 (= res!462127 (and (bvslt (size!19539 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19539 a!3591))))))

(assert (=> start!62386 e!397082))

(declare-fun array_inv!15015 (array!40005) Bool)

(assert (=> start!62386 (array_inv!15015 a!3591)))

(assert (=> start!62386 true))

(declare-fun b!698415 () Bool)

(declare-fun res!462125 () Bool)

(assert (=> b!698415 (=> (not res!462125) (not e!397082))))

(declare-datatypes ((List!13104 0))(
  ( (Nil!13101) (Cons!13100 (h!14148 (_ BitVec 64)) (t!19378 List!13104)) )
))
(declare-fun acc!652 () List!13104)

(declare-fun contains!3756 (List!13104 (_ BitVec 64)) Bool)

(assert (=> b!698415 (= res!462125 (not (contains!3756 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698413 () Bool)

(declare-fun res!462126 () Bool)

(assert (=> b!698413 (=> (not res!462126) (not e!397082))))

(declare-fun noDuplicate!1030 (List!13104) Bool)

(assert (=> b!698413 (= res!462126 (noDuplicate!1030 acc!652))))

(declare-fun b!698416 () Bool)

(assert (=> b!698416 (= e!397082 false)))

(declare-fun lt!317331 () Bool)

(assert (=> b!698416 (= lt!317331 (contains!3756 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!698414 () Bool)

(declare-fun res!462124 () Bool)

(assert (=> b!698414 (=> (not res!462124) (not e!397082))))

(declare-fun newAcc!49 () List!13104)

(assert (=> b!698414 (= res!462124 (noDuplicate!1030 newAcc!49))))

(assert (= (and start!62386 res!462127) b!698413))

(assert (= (and b!698413 res!462126) b!698414))

(assert (= (and b!698414 res!462124) b!698415))

(assert (= (and b!698415 res!462125) b!698416))

(declare-fun m!659187 () Bool)

(assert (=> b!698415 m!659187))

(declare-fun m!659189 () Bool)

(assert (=> b!698416 m!659189))

(declare-fun m!659191 () Bool)

(assert (=> start!62386 m!659191))

(declare-fun m!659193 () Bool)

(assert (=> b!698413 m!659193))

(declare-fun m!659195 () Bool)

(assert (=> b!698414 m!659195))

(check-sat (not b!698416) (not b!698414) (not b!698415) (not b!698413) (not start!62386))
(check-sat)
