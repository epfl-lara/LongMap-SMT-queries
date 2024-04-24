; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85722 () Bool)

(assert start!85722)

(declare-fun res!664783 () Bool)

(declare-fun e!561425 () Bool)

(assert (=> start!85722 (=> (not res!664783) (not e!561425))))

(declare-datatypes ((array!62877 0))(
  ( (array!62878 (arr!30276 (Array (_ BitVec 32) (_ BitVec 64))) (size!30773 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62877)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85722 (= res!664783 (and (= (size!30773 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62878 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30773 a!4424))))))

(assert (=> start!85722 e!561425))

(declare-fun array_inv!23412 (array!62877) Bool)

(assert (=> start!85722 (array_inv!23412 a!4424)))

(assert (=> start!85722 true))

(declare-fun b!994778 () Bool)

(declare-fun res!664784 () Bool)

(assert (=> b!994778 (=> (not res!664784) (not e!561425))))

(declare-datatypes ((List!20962 0))(
  ( (Nil!20959) (Cons!20958 (h!22126 (_ BitVec 64)) (t!29955 List!20962)) )
))
(declare-fun acc!919 () List!20962)

(declare-fun contains!5856 (List!20962 (_ BitVec 64)) Bool)

(assert (=> b!994778 (= res!664784 (not (contains!5856 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994779 () Bool)

(declare-fun res!664782 () Bool)

(assert (=> b!994779 (=> (not res!664782) (not e!561425))))

(assert (=> b!994779 (= res!664782 (not (contains!5856 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994780 () Bool)

(assert (=> b!994780 (= e!561425 false)))

(declare-fun lt!440996 () Bool)

(declare-fun noDuplicate!1441 (List!20962) Bool)

(assert (=> b!994780 (= lt!440996 (noDuplicate!1441 acc!919))))

(assert (= (and start!85722 res!664783) b!994778))

(assert (= (and b!994778 res!664784) b!994779))

(assert (= (and b!994779 res!664782) b!994780))

(declare-fun m!922815 () Bool)

(assert (=> start!85722 m!922815))

(declare-fun m!922817 () Bool)

(assert (=> b!994778 m!922817))

(declare-fun m!922819 () Bool)

(assert (=> b!994779 m!922819))

(declare-fun m!922821 () Bool)

(assert (=> b!994780 m!922821))

(push 1)

(assert (not b!994779))

(assert (not start!85722))

(assert (not b!994780))

(assert (not b!994778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

