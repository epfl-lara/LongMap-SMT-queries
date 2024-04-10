; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62336 () Bool)

(assert start!62336)

(declare-fun b!698258 () Bool)

(declare-fun res!462069 () Bool)

(declare-fun e!396985 () Bool)

(assert (=> b!698258 (=> (not res!462069) (not e!396985))))

(declare-datatypes ((List!13205 0))(
  ( (Nil!13202) (Cons!13201 (h!14246 (_ BitVec 64)) (t!19487 List!13205)) )
))
(declare-fun acc!652 () List!13205)

(declare-fun contains!3782 (List!13205 (_ BitVec 64)) Bool)

(assert (=> b!698258 (= res!462069 (not (contains!3782 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698257 () Bool)

(declare-fun res!462068 () Bool)

(assert (=> b!698257 (=> (not res!462068) (not e!396985))))

(declare-fun newAcc!49 () List!13205)

(declare-fun noDuplicate!1029 (List!13205) Bool)

(assert (=> b!698257 (= res!462068 (noDuplicate!1029 newAcc!49))))

(declare-fun b!698256 () Bool)

(declare-fun res!462066 () Bool)

(assert (=> b!698256 (=> (not res!462066) (not e!396985))))

(assert (=> b!698256 (= res!462066 (noDuplicate!1029 acc!652))))

(declare-fun b!698259 () Bool)

(assert (=> b!698259 (= e!396985 false)))

(declare-fun lt!317241 () Bool)

(assert (=> b!698259 (= lt!317241 (contains!3782 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!462067 () Bool)

(assert (=> start!62336 (=> (not res!462067) (not e!396985))))

(declare-datatypes ((array!40015 0))(
  ( (array!40016 (arr!19164 (Array (_ BitVec 32) (_ BitVec 64))) (size!19549 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40015)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62336 (= res!462067 (and (bvslt (size!19549 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19549 a!3591))))))

(assert (=> start!62336 e!396985))

(declare-fun array_inv!14960 (array!40015) Bool)

(assert (=> start!62336 (array_inv!14960 a!3591)))

(assert (=> start!62336 true))

(assert (= (and start!62336 res!462067) b!698256))

(assert (= (and b!698256 res!462066) b!698257))

(assert (= (and b!698257 res!462068) b!698258))

(assert (= (and b!698258 res!462069) b!698259))

(declare-fun m!658561 () Bool)

(assert (=> b!698257 m!658561))

(declare-fun m!658563 () Bool)

(assert (=> b!698259 m!658563))

(declare-fun m!658565 () Bool)

(assert (=> start!62336 m!658565))

(declare-fun m!658567 () Bool)

(assert (=> b!698256 m!658567))

(declare-fun m!658569 () Bool)

(assert (=> b!698258 m!658569))

(push 1)

(assert (not b!698256))

(assert (not b!698259))

(assert (not b!698257))

(assert (not b!698258))

(assert (not start!62336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

