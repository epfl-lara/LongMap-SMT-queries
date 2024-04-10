; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85582 () Bool)

(assert start!85582)

(declare-fun b!994029 () Bool)

(declare-fun res!664591 () Bool)

(declare-fun e!560934 () Bool)

(assert (=> b!994029 (=> (not res!664591) (not e!560934))))

(declare-datatypes ((List!20988 0))(
  ( (Nil!20985) (Cons!20984 (h!22146 (_ BitVec 64)) (t!29989 List!20988)) )
))
(declare-fun acc!919 () List!20988)

(declare-fun noDuplicate!1447 (List!20988) Bool)

(assert (=> b!994029 (= res!664591 (noDuplicate!1447 acc!919))))

(declare-datatypes ((array!62861 0))(
  ( (array!62862 (arr!30273 (Array (_ BitVec 32) (_ BitVec 64))) (size!30770 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62861)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun b!994030 () Bool)

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!994030 (= e!560934 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30770 a!4424)) (bvsge (bvsub size!36 (bvadd #b00000000000000000000000000000001 from!3778)) (bvsub size!36 from!3778))))))

(declare-fun b!994028 () Bool)

(declare-fun res!664593 () Bool)

(assert (=> b!994028 (=> (not res!664593) (not e!560934))))

(declare-fun contains!5849 (List!20988 (_ BitVec 64)) Bool)

(assert (=> b!994028 (= res!664593 (not (contains!5849 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994027 () Bool)

(declare-fun res!664592 () Bool)

(assert (=> b!994027 (=> (not res!664592) (not e!560934))))

(assert (=> b!994027 (= res!664592 (not (contains!5849 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!664590 () Bool)

(assert (=> start!85582 (=> (not res!664590) (not e!560934))))

(assert (=> start!85582 (= res!664590 (and (= (size!30770 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62862 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30770 a!4424))))))

(assert (=> start!85582 e!560934))

(declare-fun array_inv!23397 (array!62861) Bool)

(assert (=> start!85582 (array_inv!23397 a!4424)))

(assert (=> start!85582 true))

(assert (= (and start!85582 res!664590) b!994027))

(assert (= (and b!994027 res!664592) b!994028))

(assert (= (and b!994028 res!664593) b!994029))

(assert (= (and b!994029 res!664591) b!994030))

(declare-fun m!921641 () Bool)

(assert (=> b!994029 m!921641))

(declare-fun m!921643 () Bool)

(assert (=> b!994028 m!921643))

(declare-fun m!921645 () Bool)

(assert (=> b!994027 m!921645))

(declare-fun m!921647 () Bool)

(assert (=> start!85582 m!921647))

(push 1)

(assert (not b!994029))

(assert (not b!994028))

(assert (not b!994027))

(assert (not start!85582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

