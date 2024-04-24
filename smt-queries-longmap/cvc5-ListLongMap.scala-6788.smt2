; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85638 () Bool)

(assert start!85638)

(declare-fun res!664370 () Bool)

(declare-fun e!561201 () Bool)

(assert (=> start!85638 (=> (not res!664370) (not e!561201))))

(declare-datatypes ((array!62796 0))(
  ( (array!62797 (arr!30237 (Array (_ BitVec 32) (_ BitVec 64))) (size!30734 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62796)

(declare-fun size!36 () (_ BitVec 32))

(declare-fun from!3778 () (_ BitVec 32))

(assert (=> start!85638 (= res!664370 (and (= (size!30734 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62797 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30734 a!4424))))))

(assert (=> start!85638 e!561201))

(declare-fun array_inv!23373 (array!62796) Bool)

(assert (=> start!85638 (array_inv!23373 a!4424)))

(assert (=> start!85638 true))

(declare-fun b!994364 () Bool)

(declare-fun res!664369 () Bool)

(assert (=> b!994364 (=> (not res!664369) (not e!561201))))

(declare-datatypes ((List!20926 0))(
  ( (Nil!20923) (Cons!20922 (h!22090 (_ BitVec 64)) (t!29919 List!20926)) )
))
(declare-fun acc!919 () List!20926)

(declare-fun contains!5820 (List!20926 (_ BitVec 64)) Bool)

(assert (=> b!994364 (= res!664369 (not (contains!5820 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994365 () Bool)

(declare-fun res!664368 () Bool)

(assert (=> b!994365 (=> (not res!664368) (not e!561201))))

(assert (=> b!994365 (= res!664368 (not (contains!5820 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994366 () Bool)

(assert (=> b!994366 (= e!561201 false)))

(declare-fun lt!440906 () Bool)

(declare-fun noDuplicate!1405 (List!20926) Bool)

(assert (=> b!994366 (= lt!440906 (noDuplicate!1405 acc!919))))

(assert (= (and start!85638 res!664370) b!994364))

(assert (= (and b!994364 res!664369) b!994365))

(assert (= (and b!994365 res!664368) b!994366))

(declare-fun m!922473 () Bool)

(assert (=> start!85638 m!922473))

(declare-fun m!922475 () Bool)

(assert (=> b!994364 m!922475))

(declare-fun m!922477 () Bool)

(assert (=> b!994365 m!922477))

(declare-fun m!922479 () Bool)

(assert (=> b!994366 m!922479))

(push 1)

(assert (not b!994364))

(assert (not b!994365))

(assert (not start!85638))

(assert (not b!994366))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

