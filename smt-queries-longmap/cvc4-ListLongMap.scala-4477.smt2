; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62334 () Bool)

(assert start!62334)

(declare-fun b!698245 () Bool)

(declare-fun res!462056 () Bool)

(declare-fun e!396978 () Bool)

(assert (=> b!698245 (=> (not res!462056) (not e!396978))))

(declare-datatypes ((List!13204 0))(
  ( (Nil!13201) (Cons!13200 (h!14245 (_ BitVec 64)) (t!19486 List!13204)) )
))
(declare-fun newAcc!49 () List!13204)

(declare-fun noDuplicate!1028 (List!13204) Bool)

(assert (=> b!698245 (= res!462056 (noDuplicate!1028 newAcc!49))))

(declare-fun b!698246 () Bool)

(declare-fun res!462055 () Bool)

(assert (=> b!698246 (=> (not res!462055) (not e!396978))))

(declare-fun acc!652 () List!13204)

(declare-fun contains!3781 (List!13204 (_ BitVec 64)) Bool)

(assert (=> b!698246 (= res!462055 (not (contains!3781 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698244 () Bool)

(declare-fun res!462057 () Bool)

(assert (=> b!698244 (=> (not res!462057) (not e!396978))))

(assert (=> b!698244 (= res!462057 (noDuplicate!1028 acc!652))))

(declare-fun b!698247 () Bool)

(assert (=> b!698247 (= e!396978 false)))

(declare-fun lt!317238 () Bool)

(assert (=> b!698247 (= lt!317238 (contains!3781 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!462054 () Bool)

(assert (=> start!62334 (=> (not res!462054) (not e!396978))))

(declare-datatypes ((array!40013 0))(
  ( (array!40014 (arr!19163 (Array (_ BitVec 32) (_ BitVec 64))) (size!19548 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40013)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62334 (= res!462054 (and (bvslt (size!19548 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19548 a!3591))))))

(assert (=> start!62334 e!396978))

(declare-fun array_inv!14959 (array!40013) Bool)

(assert (=> start!62334 (array_inv!14959 a!3591)))

(assert (=> start!62334 true))

(assert (= (and start!62334 res!462054) b!698244))

(assert (= (and b!698244 res!462057) b!698245))

(assert (= (and b!698245 res!462056) b!698246))

(assert (= (and b!698246 res!462055) b!698247))

(declare-fun m!658551 () Bool)

(assert (=> b!698246 m!658551))

(declare-fun m!658553 () Bool)

(assert (=> start!62334 m!658553))

(declare-fun m!658555 () Bool)

(assert (=> b!698247 m!658555))

(declare-fun m!658557 () Bool)

(assert (=> b!698244 m!658557))

(declare-fun m!658559 () Bool)

(assert (=> b!698245 m!658559))

(push 1)

(assert (not start!62334))

(assert (not b!698244))

(assert (not b!698247))

(assert (not b!698245))

(assert (not b!698246))

(check-sat)

