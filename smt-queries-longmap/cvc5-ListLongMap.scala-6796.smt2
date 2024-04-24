; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85686 () Bool)

(assert start!85686)

(declare-fun res!664665 () Bool)

(declare-fun e!561345 () Bool)

(assert (=> start!85686 (=> (not res!664665) (not e!561345))))

(declare-datatypes ((array!62844 0))(
  ( (array!62845 (arr!30261 (Array (_ BitVec 32) (_ BitVec 64))) (size!30758 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62844)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85686 (= res!664665 (and (= (size!30758 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62845 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30758 a!4424))))))

(assert (=> start!85686 e!561345))

(declare-fun array_inv!23397 (array!62844) Bool)

(assert (=> start!85686 (array_inv!23397 a!4424)))

(assert (=> start!85686 true))

(declare-fun b!994661 () Bool)

(declare-fun res!664666 () Bool)

(assert (=> b!994661 (=> (not res!664666) (not e!561345))))

(declare-datatypes ((List!20950 0))(
  ( (Nil!20947) (Cons!20946 (h!22114 (_ BitVec 64)) (t!29943 List!20950)) )
))
(declare-fun acc!919 () List!20950)

(declare-fun contains!5844 (List!20950 (_ BitVec 64)) Bool)

(assert (=> b!994661 (= res!664666 (not (contains!5844 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994662 () Bool)

(declare-fun res!664667 () Bool)

(assert (=> b!994662 (=> (not res!664667) (not e!561345))))

(assert (=> b!994662 (= res!664667 (not (contains!5844 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994663 () Bool)

(assert (=> b!994663 (= e!561345 false)))

(declare-fun lt!440969 () Bool)

(declare-fun noDuplicate!1429 (List!20950) Bool)

(assert (=> b!994663 (= lt!440969 (noDuplicate!1429 acc!919))))

(assert (= (and start!85686 res!664665) b!994661))

(assert (= (and b!994661 res!664666) b!994662))

(assert (= (and b!994662 res!664667) b!994663))

(declare-fun m!922713 () Bool)

(assert (=> start!85686 m!922713))

(declare-fun m!922715 () Bool)

(assert (=> b!994661 m!922715))

(declare-fun m!922717 () Bool)

(assert (=> b!994662 m!922717))

(declare-fun m!922719 () Bool)

(assert (=> b!994663 m!922719))

(push 1)

(assert (not start!85686))

(assert (not b!994663))

(assert (not b!994662))

(assert (not b!994661))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

