; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85716 () Bool)

(assert start!85716)

(declare-fun res!664755 () Bool)

(declare-fun e!561408 () Bool)

(assert (=> start!85716 (=> (not res!664755) (not e!561408))))

(declare-datatypes ((array!62871 0))(
  ( (array!62872 (arr!30273 (Array (_ BitVec 32) (_ BitVec 64))) (size!30770 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62871)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85716 (= res!664755 (and (= (size!30770 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62872 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30770 a!4424))))))

(assert (=> start!85716 e!561408))

(declare-fun array_inv!23409 (array!62871) Bool)

(assert (=> start!85716 (array_inv!23409 a!4424)))

(assert (=> start!85716 true))

(declare-fun b!994751 () Bool)

(declare-fun res!664757 () Bool)

(assert (=> b!994751 (=> (not res!664757) (not e!561408))))

(declare-datatypes ((List!20959 0))(
  ( (Nil!20956) (Cons!20955 (h!22123 (_ BitVec 64)) (t!29952 List!20959)) )
))
(declare-fun acc!919 () List!20959)

(declare-fun contains!5853 (List!20959 (_ BitVec 64)) Bool)

(assert (=> b!994751 (= res!664757 (not (contains!5853 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994752 () Bool)

(declare-fun res!664756 () Bool)

(assert (=> b!994752 (=> (not res!664756) (not e!561408))))

(assert (=> b!994752 (= res!664756 (not (contains!5853 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994753 () Bool)

(assert (=> b!994753 (= e!561408 false)))

(declare-fun lt!440987 () Bool)

(declare-fun noDuplicate!1438 (List!20959) Bool)

(assert (=> b!994753 (= lt!440987 (noDuplicate!1438 acc!919))))

(assert (= (and start!85716 res!664755) b!994751))

(assert (= (and b!994751 res!664757) b!994752))

(assert (= (and b!994752 res!664756) b!994753))

(declare-fun m!922791 () Bool)

(assert (=> start!85716 m!922791))

(declare-fun m!922793 () Bool)

(assert (=> b!994751 m!922793))

(declare-fun m!922795 () Bool)

(assert (=> b!994752 m!922795))

(declare-fun m!922797 () Bool)

(assert (=> b!994753 m!922797))

(push 1)

(assert (not b!994753))

(assert (not start!85716))

(assert (not b!994752))

(assert (not b!994751))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

