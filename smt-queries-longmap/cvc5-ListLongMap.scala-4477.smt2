; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62330 () Bool)

(assert start!62330)

(declare-fun b!698223 () Bool)

(declare-fun e!396966 () Bool)

(assert (=> b!698223 (= e!396966 false)))

(declare-fun lt!317232 () Bool)

(declare-datatypes ((List!13202 0))(
  ( (Nil!13199) (Cons!13198 (h!14243 (_ BitVec 64)) (t!19484 List!13202)) )
))
(declare-fun acc!652 () List!13202)

(declare-fun contains!3779 (List!13202 (_ BitVec 64)) Bool)

(assert (=> b!698223 (= lt!317232 (contains!3779 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!698220 () Bool)

(declare-fun res!462031 () Bool)

(assert (=> b!698220 (=> (not res!462031) (not e!396966))))

(declare-fun noDuplicate!1026 (List!13202) Bool)

(assert (=> b!698220 (= res!462031 (noDuplicate!1026 acc!652))))

(declare-fun b!698222 () Bool)

(declare-fun res!462030 () Bool)

(assert (=> b!698222 (=> (not res!462030) (not e!396966))))

(assert (=> b!698222 (= res!462030 (not (contains!3779 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!462032 () Bool)

(assert (=> start!62330 (=> (not res!462032) (not e!396966))))

(declare-datatypes ((array!40009 0))(
  ( (array!40010 (arr!19161 (Array (_ BitVec 32) (_ BitVec 64))) (size!19546 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40009)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62330 (= res!462032 (and (bvslt (size!19546 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19546 a!3591))))))

(assert (=> start!62330 e!396966))

(declare-fun array_inv!14957 (array!40009) Bool)

(assert (=> start!62330 (array_inv!14957 a!3591)))

(assert (=> start!62330 true))

(declare-fun b!698221 () Bool)

(declare-fun res!462033 () Bool)

(assert (=> b!698221 (=> (not res!462033) (not e!396966))))

(declare-fun newAcc!49 () List!13202)

(assert (=> b!698221 (= res!462033 (noDuplicate!1026 newAcc!49))))

(assert (= (and start!62330 res!462032) b!698220))

(assert (= (and b!698220 res!462031) b!698221))

(assert (= (and b!698221 res!462033) b!698222))

(assert (= (and b!698222 res!462030) b!698223))

(declare-fun m!658531 () Bool)

(assert (=> b!698221 m!658531))

(declare-fun m!658533 () Bool)

(assert (=> start!62330 m!658533))

(declare-fun m!658535 () Bool)

(assert (=> b!698223 m!658535))

(declare-fun m!658537 () Bool)

(assert (=> b!698222 m!658537))

(declare-fun m!658539 () Bool)

(assert (=> b!698220 m!658539))

(push 1)

(assert (not b!698221))

(assert (not start!62330))

(assert (not b!698223))

(assert (not b!698220))

(assert (not b!698222))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

