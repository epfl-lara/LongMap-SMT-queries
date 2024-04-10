; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62354 () Bool)

(assert start!62354)

(declare-fun b!698404 () Bool)

(declare-fun res!462218 () Bool)

(declare-fun e!397039 () Bool)

(assert (=> b!698404 (=> (not res!462218) (not e!397039))))

(declare-datatypes ((List!13214 0))(
  ( (Nil!13211) (Cons!13210 (h!14255 (_ BitVec 64)) (t!19496 List!13214)) )
))
(declare-fun acc!652 () List!13214)

(declare-fun contains!3791 (List!13214 (_ BitVec 64)) Bool)

(assert (=> b!698404 (= res!462218 (not (contains!3791 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!462219 () Bool)

(assert (=> start!62354 (=> (not res!462219) (not e!397039))))

(declare-datatypes ((array!40033 0))(
  ( (array!40034 (arr!19173 (Array (_ BitVec 32) (_ BitVec 64))) (size!19558 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40033)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62354 (= res!462219 (and (bvslt (size!19558 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19558 a!3591))))))

(assert (=> start!62354 e!397039))

(assert (=> start!62354 true))

(declare-fun array_inv!14969 (array!40033) Bool)

(assert (=> start!62354 (array_inv!14969 a!3591)))

(declare-fun b!698405 () Bool)

(declare-fun res!462216 () Bool)

(assert (=> b!698405 (=> (not res!462216) (not e!397039))))

(declare-fun newAcc!49 () List!13214)

(declare-fun noDuplicate!1038 (List!13214) Bool)

(assert (=> b!698405 (= res!462216 (noDuplicate!1038 newAcc!49))))

(declare-fun b!698406 () Bool)

(declare-fun res!462214 () Bool)

(assert (=> b!698406 (=> (not res!462214) (not e!397039))))

(assert (=> b!698406 (= res!462214 (noDuplicate!1038 acc!652))))

(declare-fun b!698407 () Bool)

(declare-fun res!462215 () Bool)

(assert (=> b!698407 (=> (not res!462215) (not e!397039))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698407 (= res!462215 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!698408 () Bool)

(declare-fun res!462217 () Bool)

(assert (=> b!698408 (=> (not res!462217) (not e!397039))))

(assert (=> b!698408 (= res!462217 (not (contains!3791 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698409 () Bool)

(assert (=> b!698409 (= e!397039 false)))

(declare-fun lt!317259 () Bool)

(assert (=> b!698409 (= lt!317259 (contains!3791 acc!652 k!2824))))

(assert (= (and start!62354 res!462219) b!698406))

(assert (= (and b!698406 res!462214) b!698405))

(assert (= (and b!698405 res!462216) b!698404))

(assert (= (and b!698404 res!462218) b!698408))

(assert (= (and b!698408 res!462217) b!698407))

(assert (= (and b!698407 res!462215) b!698409))

(declare-fun m!658669 () Bool)

(assert (=> start!62354 m!658669))

(declare-fun m!658671 () Bool)

(assert (=> b!698406 m!658671))

(declare-fun m!658673 () Bool)

(assert (=> b!698409 m!658673))

(declare-fun m!658675 () Bool)

(assert (=> b!698407 m!658675))

(declare-fun m!658677 () Bool)

(assert (=> b!698405 m!658677))

(declare-fun m!658679 () Bool)

(assert (=> b!698408 m!658679))

(declare-fun m!658681 () Bool)

(assert (=> b!698404 m!658681))

(push 1)

(assert (not b!698405))

(assert (not b!698407))

(assert (not start!62354))

(assert (not b!698408))

(assert (not b!698409))

(assert (not b!698406))

(assert (not b!698404))

(check-sat)

(pop 1)

