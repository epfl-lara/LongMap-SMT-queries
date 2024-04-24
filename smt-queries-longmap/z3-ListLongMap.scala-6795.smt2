; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85676 () Bool)

(assert start!85676)

(declare-fun b!994611 () Bool)

(declare-fun res!664613 () Bool)

(declare-fun e!561314 () Bool)

(assert (=> b!994611 (=> (not res!664613) (not e!561314))))

(declare-datatypes ((List!20945 0))(
  ( (Nil!20942) (Cons!20941 (h!22109 (_ BitVec 64)) (t!29938 List!20945)) )
))
(declare-fun acc!919 () List!20945)

(declare-fun noDuplicate!1424 (List!20945) Bool)

(assert (=> b!994611 (= res!664613 (noDuplicate!1424 acc!919))))

(declare-fun b!994609 () Bool)

(declare-fun res!664615 () Bool)

(assert (=> b!994609 (=> (not res!664615) (not e!561314))))

(declare-fun contains!5839 (List!20945 (_ BitVec 64)) Bool)

(assert (=> b!994609 (= res!664615 (not (contains!5839 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994610 () Bool)

(declare-fun res!664616 () Bool)

(assert (=> b!994610 (=> (not res!664616) (not e!561314))))

(assert (=> b!994610 (= res!664616 (not (contains!5839 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!62834 0))(
  ( (array!62835 (arr!30256 (Array (_ BitVec 32) (_ BitVec 64))) (size!30753 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62834)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun b!994612 () Bool)

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!994612 (= e!561314 (and (bvsge from!3778 size!36) (bvsge (size!30753 a!4424) #b01111111111111111111111111111111)))))

(declare-fun res!664614 () Bool)

(assert (=> start!85676 (=> (not res!664614) (not e!561314))))

(assert (=> start!85676 (= res!664614 (and (= (size!30753 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62835 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30753 a!4424))))))

(assert (=> start!85676 e!561314))

(declare-fun array_inv!23392 (array!62834) Bool)

(assert (=> start!85676 (array_inv!23392 a!4424)))

(assert (=> start!85676 true))

(assert (= (and start!85676 res!664614) b!994609))

(assert (= (and b!994609 res!664615) b!994610))

(assert (= (and b!994610 res!664616) b!994611))

(assert (= (and b!994611 res!664613) b!994612))

(declare-fun m!922673 () Bool)

(assert (=> b!994611 m!922673))

(declare-fun m!922675 () Bool)

(assert (=> b!994609 m!922675))

(declare-fun m!922677 () Bool)

(assert (=> b!994610 m!922677))

(declare-fun m!922679 () Bool)

(assert (=> start!85676 m!922679))

(check-sat (not b!994610) (not b!994609) (not start!85676) (not b!994611))
(check-sat)
