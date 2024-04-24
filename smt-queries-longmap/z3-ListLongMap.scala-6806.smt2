; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85748 () Bool)

(assert start!85748)

(declare-fun b!994906 () Bool)

(declare-fun res!664912 () Bool)

(declare-fun e!561504 () Bool)

(assert (=> b!994906 (=> (not res!664912) (not e!561504))))

(declare-datatypes ((List!20975 0))(
  ( (Nil!20972) (Cons!20971 (h!22139 (_ BitVec 64)) (t!29968 List!20975)) )
))
(declare-fun acc!919 () List!20975)

(declare-fun contains!5869 (List!20975 (_ BitVec 64)) Bool)

(assert (=> b!994906 (= res!664912 (not (contains!5869 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994908 () Bool)

(declare-fun res!664911 () Bool)

(assert (=> b!994908 (=> (not res!664911) (not e!561504))))

(declare-fun noDuplicate!1454 (List!20975) Bool)

(assert (=> b!994908 (= res!664911 (noDuplicate!1454 acc!919))))

(declare-fun b!994907 () Bool)

(declare-fun res!664913 () Bool)

(assert (=> b!994907 (=> (not res!664913) (not e!561504))))

(assert (=> b!994907 (= res!664913 (not (contains!5869 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!664910 () Bool)

(assert (=> start!85748 (=> (not res!664910) (not e!561504))))

(declare-datatypes ((array!62903 0))(
  ( (array!62904 (arr!30289 (Array (_ BitVec 32) (_ BitVec 64))) (size!30786 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62903)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85748 (= res!664910 (and (= (size!30786 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62904 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30786 a!4424))))))

(assert (=> start!85748 e!561504))

(declare-fun array_inv!23425 (array!62903) Bool)

(assert (=> start!85748 (array_inv!23425 a!4424)))

(assert (=> start!85748 true))

(declare-fun b!994909 () Bool)

(assert (=> b!994909 (= e!561504 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30786 a!4424)) (bvsge (bvsub size!36 (bvadd #b00000000000000000000000000000001 from!3778)) (bvsub size!36 from!3778))))))

(assert (= (and start!85748 res!664910) b!994906))

(assert (= (and b!994906 res!664912) b!994907))

(assert (= (and b!994907 res!664913) b!994908))

(assert (= (and b!994908 res!664911) b!994909))

(declare-fun m!922919 () Bool)

(assert (=> b!994906 m!922919))

(declare-fun m!922921 () Bool)

(assert (=> b!994908 m!922921))

(declare-fun m!922923 () Bool)

(assert (=> b!994907 m!922923))

(declare-fun m!922925 () Bool)

(assert (=> start!85748 m!922925))

(check-sat (not b!994907) (not b!994906) (not b!994908) (not start!85748))
(check-sat)
