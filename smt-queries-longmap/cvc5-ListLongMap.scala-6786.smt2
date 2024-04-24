; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85626 () Bool)

(assert start!85626)

(declare-fun res!664314 () Bool)

(declare-fun e!561164 () Bool)

(assert (=> start!85626 (=> (not res!664314) (not e!561164))))

(declare-datatypes ((array!62784 0))(
  ( (array!62785 (arr!30231 (Array (_ BitVec 32) (_ BitVec 64))) (size!30728 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62784)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85626 (= res!664314 (and (= (size!30728 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62785 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30728 a!4424))))))

(assert (=> start!85626 e!561164))

(declare-fun array_inv!23367 (array!62784) Bool)

(assert (=> start!85626 (array_inv!23367 a!4424)))

(assert (=> start!85626 true))

(declare-fun b!994310 () Bool)

(declare-fun res!664315 () Bool)

(assert (=> b!994310 (=> (not res!664315) (not e!561164))))

(declare-datatypes ((List!20920 0))(
  ( (Nil!20917) (Cons!20916 (h!22084 (_ BitVec 64)) (t!29913 List!20920)) )
))
(declare-fun acc!919 () List!20920)

(declare-fun contains!5814 (List!20920 (_ BitVec 64)) Bool)

(assert (=> b!994310 (= res!664315 (not (contains!5814 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994311 () Bool)

(declare-fun res!664316 () Bool)

(assert (=> b!994311 (=> (not res!664316) (not e!561164))))

(assert (=> b!994311 (= res!664316 (not (contains!5814 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994312 () Bool)

(assert (=> b!994312 (= e!561164 false)))

(declare-fun lt!440888 () Bool)

(declare-fun noDuplicate!1399 (List!20920) Bool)

(assert (=> b!994312 (= lt!440888 (noDuplicate!1399 acc!919))))

(assert (= (and start!85626 res!664314) b!994310))

(assert (= (and b!994310 res!664315) b!994311))

(assert (= (and b!994311 res!664316) b!994312))

(declare-fun m!922425 () Bool)

(assert (=> start!85626 m!922425))

(declare-fun m!922427 () Bool)

(assert (=> b!994310 m!922427))

(declare-fun m!922429 () Bool)

(assert (=> b!994311 m!922429))

(declare-fun m!922431 () Bool)

(assert (=> b!994312 m!922431))

(push 1)

(assert (not b!994311))

(assert (not start!85626))

(assert (not b!994312))

(assert (not b!994310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

