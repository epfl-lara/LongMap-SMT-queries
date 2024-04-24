; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85710 () Bool)

(assert start!85710)

(declare-fun b!994723 () Bool)

(declare-fun res!664729 () Bool)

(declare-fun e!561390 () Bool)

(assert (=> b!994723 (=> (not res!664729) (not e!561390))))

(declare-datatypes ((List!20956 0))(
  ( (Nil!20953) (Cons!20952 (h!22120 (_ BitVec 64)) (t!29949 List!20956)) )
))
(declare-fun acc!919 () List!20956)

(declare-fun contains!5850 (List!20956 (_ BitVec 64)) Bool)

(assert (=> b!994723 (= res!664729 (not (contains!5850 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!664727 () Bool)

(assert (=> start!85710 (=> (not res!664727) (not e!561390))))

(declare-datatypes ((array!62865 0))(
  ( (array!62866 (arr!30270 (Array (_ BitVec 32) (_ BitVec 64))) (size!30767 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62865)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85710 (= res!664727 (and (= (size!30767 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62866 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30767 a!4424))))))

(assert (=> start!85710 e!561390))

(declare-fun array_inv!23406 (array!62865) Bool)

(assert (=> start!85710 (array_inv!23406 a!4424)))

(assert (=> start!85710 true))

(declare-fun b!994724 () Bool)

(declare-fun res!664730 () Bool)

(assert (=> b!994724 (=> (not res!664730) (not e!561390))))

(assert (=> b!994724 (= res!664730 (not (contains!5850 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994726 () Bool)

(assert (=> b!994726 (= e!561390 (bvslt (bvsub size!36 from!3778) #b00000000000000000000000000000000))))

(declare-fun b!994725 () Bool)

(declare-fun res!664728 () Bool)

(assert (=> b!994725 (=> (not res!664728) (not e!561390))))

(declare-fun noDuplicate!1435 (List!20956) Bool)

(assert (=> b!994725 (= res!664728 (noDuplicate!1435 acc!919))))

(assert (= (and start!85710 res!664727) b!994723))

(assert (= (and b!994723 res!664729) b!994724))

(assert (= (and b!994724 res!664730) b!994725))

(assert (= (and b!994725 res!664728) b!994726))

(declare-fun m!922767 () Bool)

(assert (=> b!994723 m!922767))

(declare-fun m!922769 () Bool)

(assert (=> start!85710 m!922769))

(declare-fun m!922771 () Bool)

(assert (=> b!994724 m!922771))

(declare-fun m!922773 () Bool)

(assert (=> b!994725 m!922773))

(push 1)

(assert (not b!994724))

(assert (not start!85710))

(assert (not b!994723))

(assert (not b!994725))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

