; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85644 () Bool)

(assert start!85644)

(declare-fun res!664397 () Bool)

(declare-fun e!561219 () Bool)

(assert (=> start!85644 (=> (not res!664397) (not e!561219))))

(declare-datatypes ((array!62802 0))(
  ( (array!62803 (arr!30240 (Array (_ BitVec 32) (_ BitVec 64))) (size!30737 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62802)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85644 (= res!664397 (and (= (size!30737 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62803 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30737 a!4424))))))

(assert (=> start!85644 e!561219))

(declare-fun array_inv!23376 (array!62802) Bool)

(assert (=> start!85644 (array_inv!23376 a!4424)))

(assert (=> start!85644 true))

(declare-fun b!994391 () Bool)

(declare-fun res!664396 () Bool)

(assert (=> b!994391 (=> (not res!664396) (not e!561219))))

(declare-datatypes ((List!20929 0))(
  ( (Nil!20926) (Cons!20925 (h!22093 (_ BitVec 64)) (t!29922 List!20929)) )
))
(declare-fun acc!919 () List!20929)

(declare-fun contains!5823 (List!20929 (_ BitVec 64)) Bool)

(assert (=> b!994391 (= res!664396 (not (contains!5823 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994392 () Bool)

(declare-fun res!664395 () Bool)

(assert (=> b!994392 (=> (not res!664395) (not e!561219))))

(assert (=> b!994392 (= res!664395 (not (contains!5823 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994393 () Bool)

(assert (=> b!994393 (= e!561219 false)))

(declare-fun lt!440915 () Bool)

(declare-fun noDuplicate!1408 (List!20929) Bool)

(assert (=> b!994393 (= lt!440915 (noDuplicate!1408 acc!919))))

(assert (= (and start!85644 res!664397) b!994391))

(assert (= (and b!994391 res!664396) b!994392))

(assert (= (and b!994392 res!664395) b!994393))

(declare-fun m!922497 () Bool)

(assert (=> start!85644 m!922497))

(declare-fun m!922499 () Bool)

(assert (=> b!994391 m!922499))

(declare-fun m!922501 () Bool)

(assert (=> b!994392 m!922501))

(declare-fun m!922503 () Bool)

(assert (=> b!994393 m!922503))

(push 1)

(assert (not start!85644))

(assert (not b!994393))

(assert (not b!994391))

(assert (not b!994392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

