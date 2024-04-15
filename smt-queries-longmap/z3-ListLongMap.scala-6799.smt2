; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85520 () Bool)

(assert start!85520)

(declare-fun b!993557 () Bool)

(declare-fun res!664249 () Bool)

(declare-fun e!560647 () Bool)

(assert (=> b!993557 (=> (not res!664249) (not e!560647))))

(declare-datatypes ((List!21000 0))(
  ( (Nil!20997) (Cons!20996 (h!22158 (_ BitVec 64)) (t!29992 List!21000)) )
))
(declare-fun acc!919 () List!21000)

(declare-fun contains!5799 (List!21000 (_ BitVec 64)) Bool)

(assert (=> b!993557 (= res!664249 (not (contains!5799 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993559 () Bool)

(declare-fun res!664250 () Bool)

(assert (=> b!993559 (=> (not res!664250) (not e!560647))))

(declare-fun noDuplicate!1432 (List!21000) Bool)

(assert (=> b!993559 (= res!664250 (noDuplicate!1432 acc!919))))

(declare-fun b!993558 () Bool)

(declare-fun res!664251 () Bool)

(assert (=> b!993558 (=> (not res!664251) (not e!560647))))

(assert (=> b!993558 (= res!664251 (not (contains!5799 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993560 () Bool)

(declare-fun size!36 () (_ BitVec 32))

(declare-fun from!3778 () (_ BitVec 32))

(assert (=> b!993560 (= e!560647 (bvslt (bvsub size!36 from!3778) #b00000000000000000000000000000000))))

(declare-fun res!664252 () Bool)

(assert (=> start!85520 (=> (not res!664252) (not e!560647))))

(declare-datatypes ((array!62753 0))(
  ( (array!62754 (arr!30219 (Array (_ BitVec 32) (_ BitVec 64))) (size!30717 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62753)

(assert (=> start!85520 (= res!664252 (and (= (size!30717 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62754 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30717 a!4424))))))

(assert (=> start!85520 e!560647))

(declare-fun array_inv!23362 (array!62753) Bool)

(assert (=> start!85520 (array_inv!23362 a!4424)))

(assert (=> start!85520 true))

(assert (= (and start!85520 res!664252) b!993557))

(assert (= (and b!993557 res!664249) b!993558))

(assert (= (and b!993558 res!664251) b!993559))

(assert (= (and b!993559 res!664250) b!993560))

(declare-fun m!920699 () Bool)

(assert (=> b!993557 m!920699))

(declare-fun m!920701 () Bool)

(assert (=> b!993559 m!920701))

(declare-fun m!920703 () Bool)

(assert (=> b!993558 m!920703))

(declare-fun m!920705 () Bool)

(assert (=> start!85520 m!920705))

(check-sat (not b!993559) (not b!993557) (not start!85520) (not b!993558))
(check-sat)
