; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62370 () Bool)

(assert start!62370)

(declare-fun b!698548 () Bool)

(declare-fun res!462358 () Bool)

(declare-fun e!397086 () Bool)

(assert (=> b!698548 (=> (not res!462358) (not e!397086))))

(declare-datatypes ((array!40049 0))(
  ( (array!40050 (arr!19181 (Array (_ BitVec 32) (_ BitVec 64))) (size!19566 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40049)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698548 (= res!462358 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!698549 () Bool)

(assert (=> b!698549 (= e!397086 false)))

(declare-fun lt!317283 () Bool)

(declare-datatypes ((List!13222 0))(
  ( (Nil!13219) (Cons!13218 (h!14263 (_ BitVec 64)) (t!19504 List!13222)) )
))
(declare-fun acc!652 () List!13222)

(declare-fun contains!3799 (List!13222 (_ BitVec 64)) Bool)

(assert (=> b!698549 (= lt!317283 (contains!3799 acc!652 k!2824))))

(declare-fun b!698550 () Bool)

(declare-fun res!462363 () Bool)

(assert (=> b!698550 (=> (not res!462363) (not e!397086))))

(declare-fun noDuplicate!1046 (List!13222) Bool)

(assert (=> b!698550 (= res!462363 (noDuplicate!1046 acc!652))))

(declare-fun res!462360 () Bool)

(assert (=> start!62370 (=> (not res!462360) (not e!397086))))

(assert (=> start!62370 (= res!462360 (and (bvslt (size!19566 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19566 a!3591))))))

(assert (=> start!62370 e!397086))

(assert (=> start!62370 true))

(declare-fun array_inv!14977 (array!40049) Bool)

(assert (=> start!62370 (array_inv!14977 a!3591)))

(declare-fun b!698551 () Bool)

(declare-fun res!462359 () Bool)

(assert (=> b!698551 (=> (not res!462359) (not e!397086))))

(assert (=> b!698551 (= res!462359 (not (contains!3799 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698552 () Bool)

(declare-fun res!462362 () Bool)

(assert (=> b!698552 (=> (not res!462362) (not e!397086))))

(declare-fun newAcc!49 () List!13222)

(assert (=> b!698552 (= res!462362 (noDuplicate!1046 newAcc!49))))

(declare-fun b!698553 () Bool)

(declare-fun res!462361 () Bool)

(assert (=> b!698553 (=> (not res!462361) (not e!397086))))

(assert (=> b!698553 (= res!462361 (not (contains!3799 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62370 res!462360) b!698550))

(assert (= (and b!698550 res!462363) b!698552))

(assert (= (and b!698552 res!462362) b!698551))

(assert (= (and b!698551 res!462359) b!698553))

(assert (= (and b!698553 res!462361) b!698548))

(assert (= (and b!698548 res!462358) b!698549))

(declare-fun m!658781 () Bool)

(assert (=> b!698551 m!658781))

(declare-fun m!658783 () Bool)

(assert (=> start!62370 m!658783))

(declare-fun m!658785 () Bool)

(assert (=> b!698549 m!658785))

(declare-fun m!658787 () Bool)

(assert (=> b!698550 m!658787))

(declare-fun m!658789 () Bool)

(assert (=> b!698548 m!658789))

(declare-fun m!658791 () Bool)

(assert (=> b!698553 m!658791))

(declare-fun m!658793 () Bool)

(assert (=> b!698552 m!658793))

(push 1)

(assert (not b!698548))

(assert (not b!698550))

(assert (not b!698552))

(assert (not b!698551))

(assert (not start!62370))

(assert (not b!698549))

(assert (not b!698553))

(check-sat)

(pop 1)

(push 1)

(check-sat)

