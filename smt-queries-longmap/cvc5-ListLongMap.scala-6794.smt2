; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85674 () Bool)

(assert start!85674)

(declare-fun res!664604 () Bool)

(declare-fun e!561309 () Bool)

(assert (=> start!85674 (=> (not res!664604) (not e!561309))))

(declare-datatypes ((array!62832 0))(
  ( (array!62833 (arr!30255 (Array (_ BitVec 32) (_ BitVec 64))) (size!30752 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62832)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85674 (= res!664604 (and (= (size!30752 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62833 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30752 a!4424))))))

(assert (=> start!85674 e!561309))

(declare-fun array_inv!23391 (array!62832) Bool)

(assert (=> start!85674 (array_inv!23391 a!4424)))

(assert (=> start!85674 true))

(declare-fun b!994598 () Bool)

(declare-fun res!664603 () Bool)

(assert (=> b!994598 (=> (not res!664603) (not e!561309))))

(declare-datatypes ((List!20944 0))(
  ( (Nil!20941) (Cons!20940 (h!22108 (_ BitVec 64)) (t!29937 List!20944)) )
))
(declare-fun acc!919 () List!20944)

(declare-fun contains!5838 (List!20944 (_ BitVec 64)) Bool)

(assert (=> b!994598 (= res!664603 (not (contains!5838 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994599 () Bool)

(declare-fun res!664602 () Bool)

(assert (=> b!994599 (=> (not res!664602) (not e!561309))))

(assert (=> b!994599 (= res!664602 (not (contains!5838 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994600 () Bool)

(assert (=> b!994600 (= e!561309 false)))

(declare-fun lt!440960 () Bool)

(declare-fun noDuplicate!1423 (List!20944) Bool)

(assert (=> b!994600 (= lt!440960 (noDuplicate!1423 acc!919))))

(assert (= (and start!85674 res!664604) b!994598))

(assert (= (and b!994598 res!664603) b!994599))

(assert (= (and b!994599 res!664602) b!994600))

(declare-fun m!922665 () Bool)

(assert (=> start!85674 m!922665))

(declare-fun m!922667 () Bool)

(assert (=> b!994598 m!922667))

(declare-fun m!922669 () Bool)

(assert (=> b!994599 m!922669))

(declare-fun m!922671 () Bool)

(assert (=> b!994600 m!922671))

(push 1)

(assert (not start!85674))

(assert (not b!994600))

(assert (not b!994599))

(assert (not b!994598))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

