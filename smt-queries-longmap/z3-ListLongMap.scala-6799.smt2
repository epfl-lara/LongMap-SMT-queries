; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85538 () Bool)

(assert start!85538)

(declare-fun b!993809 () Bool)

(declare-fun res!664374 () Bool)

(declare-fun e!560802 () Bool)

(assert (=> b!993809 (=> (not res!664374) (not e!560802))))

(declare-datatypes ((List!20966 0))(
  ( (Nil!20963) (Cons!20962 (h!22124 (_ BitVec 64)) (t!29967 List!20966)) )
))
(declare-fun acc!919 () List!20966)

(declare-fun contains!5827 (List!20966 (_ BitVec 64)) Bool)

(assert (=> b!993809 (= res!664374 (not (contains!5827 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993808 () Bool)

(declare-fun res!664372 () Bool)

(assert (=> b!993808 (=> (not res!664372) (not e!560802))))

(assert (=> b!993808 (= res!664372 (not (contains!5827 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!664371 () Bool)

(assert (=> start!85538 (=> (not res!664371) (not e!560802))))

(declare-datatypes ((array!62817 0))(
  ( (array!62818 (arr!30251 (Array (_ BitVec 32) (_ BitVec 64))) (size!30748 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62817)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85538 (= res!664371 (and (= (size!30748 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62818 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30748 a!4424))))))

(assert (=> start!85538 e!560802))

(declare-fun array_inv!23375 (array!62817) Bool)

(assert (=> start!85538 (array_inv!23375 a!4424)))

(assert (=> start!85538 true))

(declare-fun b!993810 () Bool)

(declare-fun res!664373 () Bool)

(assert (=> b!993810 (=> (not res!664373) (not e!560802))))

(declare-fun noDuplicate!1425 (List!20966) Bool)

(assert (=> b!993810 (= res!664373 (noDuplicate!1425 acc!919))))

(declare-fun b!993811 () Bool)

(assert (=> b!993811 (= e!560802 (bvslt (bvsub size!36 from!3778) #b00000000000000000000000000000000))))

(assert (= (and start!85538 res!664371) b!993808))

(assert (= (and b!993808 res!664372) b!993809))

(assert (= (and b!993809 res!664374) b!993810))

(assert (= (and b!993810 res!664373) b!993811))

(declare-fun m!921465 () Bool)

(assert (=> b!993809 m!921465))

(declare-fun m!921467 () Bool)

(assert (=> b!993808 m!921467))

(declare-fun m!921469 () Bool)

(assert (=> start!85538 m!921469))

(declare-fun m!921471 () Bool)

(assert (=> b!993810 m!921471))

(check-sat (not start!85538) (not b!993808) (not b!993809) (not b!993810))
(check-sat)
