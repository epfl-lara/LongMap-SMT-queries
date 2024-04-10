; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85562 () Bool)

(assert start!85562)

(declare-fun b!993927 () Bool)

(declare-fun res!664491 () Bool)

(declare-fun e!560874 () Bool)

(assert (=> b!993927 (=> (not res!664491) (not e!560874))))

(declare-datatypes ((List!20978 0))(
  ( (Nil!20975) (Cons!20974 (h!22136 (_ BitVec 64)) (t!29979 List!20978)) )
))
(declare-fun acc!919 () List!20978)

(declare-fun noDuplicate!1437 (List!20978) Bool)

(assert (=> b!993927 (= res!664491 (noDuplicate!1437 acc!919))))

(declare-fun b!993925 () Bool)

(declare-fun res!664489 () Bool)

(assert (=> b!993925 (=> (not res!664489) (not e!560874))))

(declare-fun contains!5839 (List!20978 (_ BitVec 64)) Bool)

(assert (=> b!993925 (= res!664489 (not (contains!5839 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!62841 0))(
  ( (array!62842 (arr!30263 (Array (_ BitVec 32) (_ BitVec 64))) (size!30760 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62841)

(declare-fun b!993928 () Bool)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!993928 (= e!560874 (and (bvslt from!3778 size!36) (or (bvslt (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!3778) (size!30760 a!4424)))))))

(declare-fun b!993926 () Bool)

(declare-fun res!664490 () Bool)

(assert (=> b!993926 (=> (not res!664490) (not e!560874))))

(assert (=> b!993926 (= res!664490 (not (contains!5839 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!664488 () Bool)

(assert (=> start!85562 (=> (not res!664488) (not e!560874))))

(assert (=> start!85562 (= res!664488 (and (= (size!30760 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62842 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30760 a!4424))))))

(assert (=> start!85562 e!560874))

(declare-fun array_inv!23387 (array!62841) Bool)

(assert (=> start!85562 (array_inv!23387 a!4424)))

(assert (=> start!85562 true))

(assert (= (and start!85562 res!664488) b!993925))

(assert (= (and b!993925 res!664489) b!993926))

(assert (= (and b!993926 res!664490) b!993927))

(assert (= (and b!993927 res!664491) b!993928))

(declare-fun m!921561 () Bool)

(assert (=> b!993927 m!921561))

(declare-fun m!921563 () Bool)

(assert (=> b!993925 m!921563))

(declare-fun m!921565 () Bool)

(assert (=> b!993926 m!921565))

(declare-fun m!921567 () Bool)

(assert (=> start!85562 m!921567))

(check-sat (not start!85562) (not b!993925) (not b!993926) (not b!993927))
(check-sat)
