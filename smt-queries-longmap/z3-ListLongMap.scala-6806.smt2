; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85580 () Bool)

(assert start!85580)

(declare-fun b!994017 () Bool)

(declare-fun res!664579 () Bool)

(declare-fun e!560928 () Bool)

(assert (=> b!994017 (=> (not res!664579) (not e!560928))))

(declare-datatypes ((List!20987 0))(
  ( (Nil!20984) (Cons!20983 (h!22145 (_ BitVec 64)) (t!29988 List!20987)) )
))
(declare-fun acc!919 () List!20987)

(declare-fun noDuplicate!1446 (List!20987) Bool)

(assert (=> b!994017 (= res!664579 (noDuplicate!1446 acc!919))))

(declare-fun b!994015 () Bool)

(declare-fun res!664580 () Bool)

(assert (=> b!994015 (=> (not res!664580) (not e!560928))))

(declare-fun contains!5848 (List!20987 (_ BitVec 64)) Bool)

(assert (=> b!994015 (= res!664580 (not (contains!5848 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994016 () Bool)

(declare-fun res!664581 () Bool)

(assert (=> b!994016 (=> (not res!664581) (not e!560928))))

(assert (=> b!994016 (= res!664581 (not (contains!5848 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(declare-fun b!994018 () Bool)

(declare-datatypes ((array!62859 0))(
  ( (array!62860 (arr!30272 (Array (_ BitVec 32) (_ BitVec 64))) (size!30769 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62859)

(assert (=> b!994018 (= e!560928 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30769 a!4424)) (bvsge (bvsub size!36 (bvadd #b00000000000000000000000000000001 from!3778)) (bvsub size!36 from!3778))))))

(declare-fun res!664578 () Bool)

(assert (=> start!85580 (=> (not res!664578) (not e!560928))))

(assert (=> start!85580 (= res!664578 (and (= (size!30769 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62860 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30769 a!4424))))))

(assert (=> start!85580 e!560928))

(declare-fun array_inv!23396 (array!62859) Bool)

(assert (=> start!85580 (array_inv!23396 a!4424)))

(assert (=> start!85580 true))

(assert (= (and start!85580 res!664578) b!994015))

(assert (= (and b!994015 res!664580) b!994016))

(assert (= (and b!994016 res!664581) b!994017))

(assert (= (and b!994017 res!664579) b!994018))

(declare-fun m!921633 () Bool)

(assert (=> b!994017 m!921633))

(declare-fun m!921635 () Bool)

(assert (=> b!994015 m!921635))

(declare-fun m!921637 () Bool)

(assert (=> b!994016 m!921637))

(declare-fun m!921639 () Bool)

(assert (=> start!85580 m!921639))

(check-sat (not b!994016) (not b!994015) (not start!85580) (not b!994017))
(check-sat)
