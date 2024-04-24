; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85692 () Bool)

(assert start!85692)

(declare-fun res!664693 () Bool)

(declare-fun e!561363 () Bool)

(assert (=> start!85692 (=> (not res!664693) (not e!561363))))

(declare-datatypes ((array!62850 0))(
  ( (array!62851 (arr!30264 (Array (_ BitVec 32) (_ BitVec 64))) (size!30761 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62850)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85692 (= res!664693 (and (= (size!30761 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62851 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30761 a!4424))))))

(assert (=> start!85692 e!561363))

(declare-fun array_inv!23400 (array!62850) Bool)

(assert (=> start!85692 (array_inv!23400 a!4424)))

(assert (=> start!85692 true))

(declare-fun b!994688 () Bool)

(declare-fun res!664692 () Bool)

(assert (=> b!994688 (=> (not res!664692) (not e!561363))))

(declare-datatypes ((List!20953 0))(
  ( (Nil!20950) (Cons!20949 (h!22117 (_ BitVec 64)) (t!29946 List!20953)) )
))
(declare-fun acc!919 () List!20953)

(declare-fun contains!5847 (List!20953 (_ BitVec 64)) Bool)

(assert (=> b!994688 (= res!664692 (not (contains!5847 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994689 () Bool)

(declare-fun res!664694 () Bool)

(assert (=> b!994689 (=> (not res!664694) (not e!561363))))

(assert (=> b!994689 (= res!664694 (not (contains!5847 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994690 () Bool)

(assert (=> b!994690 (= e!561363 false)))

(declare-fun lt!440978 () Bool)

(declare-fun noDuplicate!1432 (List!20953) Bool)

(assert (=> b!994690 (= lt!440978 (noDuplicate!1432 acc!919))))

(assert (= (and start!85692 res!664693) b!994688))

(assert (= (and b!994688 res!664692) b!994689))

(assert (= (and b!994689 res!664694) b!994690))

(declare-fun m!922737 () Bool)

(assert (=> start!85692 m!922737))

(declare-fun m!922739 () Bool)

(assert (=> b!994688 m!922739))

(declare-fun m!922741 () Bool)

(assert (=> b!994689 m!922741))

(declare-fun m!922743 () Bool)

(assert (=> b!994690 m!922743))

(push 1)

(assert (not b!994689))

(assert (not b!994688))

(assert (not b!994690))

(assert (not start!85692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

