; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85562 () Bool)

(assert start!85562)

(declare-fun b!993764 () Bool)

(declare-fun res!664458 () Bool)

(declare-fun e!560773 () Bool)

(assert (=> b!993764 (=> (not res!664458) (not e!560773))))

(declare-datatypes ((List!21021 0))(
  ( (Nil!21018) (Cons!21017 (h!22179 (_ BitVec 64)) (t!30013 List!21021)) )
))
(declare-fun acc!919 () List!21021)

(declare-fun contains!5820 (List!21021 (_ BitVec 64)) Bool)

(assert (=> b!993764 (= res!664458 (not (contains!5820 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!62795 0))(
  ( (array!62796 (arr!30240 (Array (_ BitVec 32) (_ BitVec 64))) (size!30738 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62795)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun b!993767 () Bool)

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!993767 (= e!560773 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30738 a!4424)) (bvsge (bvsub size!36 (bvadd #b00000000000000000000000000000001 from!3778)) (bvsub size!36 from!3778))))))

(declare-fun b!993766 () Bool)

(declare-fun res!664459 () Bool)

(assert (=> b!993766 (=> (not res!664459) (not e!560773))))

(declare-fun noDuplicate!1453 (List!21021) Bool)

(assert (=> b!993766 (= res!664459 (noDuplicate!1453 acc!919))))

(declare-fun res!664456 () Bool)

(assert (=> start!85562 (=> (not res!664456) (not e!560773))))

(assert (=> start!85562 (= res!664456 (and (= (size!30738 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62796 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30738 a!4424))))))

(assert (=> start!85562 e!560773))

(declare-fun array_inv!23383 (array!62795) Bool)

(assert (=> start!85562 (array_inv!23383 a!4424)))

(assert (=> start!85562 true))

(declare-fun b!993765 () Bool)

(declare-fun res!664457 () Bool)

(assert (=> b!993765 (=> (not res!664457) (not e!560773))))

(assert (=> b!993765 (= res!664457 (not (contains!5820 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85562 res!664456) b!993764))

(assert (= (and b!993764 res!664458) b!993765))

(assert (= (and b!993765 res!664457) b!993766))

(assert (= (and b!993766 res!664459) b!993767))

(declare-fun m!920867 () Bool)

(assert (=> b!993764 m!920867))

(declare-fun m!920869 () Bool)

(assert (=> b!993766 m!920869))

(declare-fun m!920871 () Bool)

(assert (=> start!85562 m!920871))

(declare-fun m!920873 () Bool)

(assert (=> b!993765 m!920873))

(check-sat (not b!993764) (not b!993765) (not b!993766) (not start!85562))
(check-sat)
