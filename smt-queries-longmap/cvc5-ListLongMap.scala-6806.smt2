; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85578 () Bool)

(assert start!85578)

(declare-fun b!994004 () Bool)

(declare-fun res!664568 () Bool)

(declare-fun e!560922 () Bool)

(assert (=> b!994004 (=> (not res!664568) (not e!560922))))

(declare-datatypes ((List!20986 0))(
  ( (Nil!20983) (Cons!20982 (h!22144 (_ BitVec 64)) (t!29987 List!20986)) )
))
(declare-fun acc!919 () List!20986)

(declare-fun contains!5847 (List!20986 (_ BitVec 64)) Bool)

(assert (=> b!994004 (= res!664568 (not (contains!5847 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!664567 () Bool)

(assert (=> start!85578 (=> (not res!664567) (not e!560922))))

(declare-datatypes ((array!62857 0))(
  ( (array!62858 (arr!30271 (Array (_ BitVec 32) (_ BitVec 64))) (size!30768 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62857)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85578 (= res!664567 (and (= (size!30768 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62858 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30768 a!4424))))))

(assert (=> start!85578 e!560922))

(declare-fun array_inv!23395 (array!62857) Bool)

(assert (=> start!85578 (array_inv!23395 a!4424)))

(assert (=> start!85578 true))

(declare-fun b!994006 () Bool)

(assert (=> b!994006 (= e!560922 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30768 a!4424)) (bvsge (bvsub size!36 (bvadd #b00000000000000000000000000000001 from!3778)) (bvsub size!36 from!3778))))))

(declare-fun b!994003 () Bool)

(declare-fun res!664566 () Bool)

(assert (=> b!994003 (=> (not res!664566) (not e!560922))))

(assert (=> b!994003 (= res!664566 (not (contains!5847 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994005 () Bool)

(declare-fun res!664569 () Bool)

(assert (=> b!994005 (=> (not res!664569) (not e!560922))))

(declare-fun noDuplicate!1445 (List!20986) Bool)

(assert (=> b!994005 (= res!664569 (noDuplicate!1445 acc!919))))

(assert (= (and start!85578 res!664567) b!994003))

(assert (= (and b!994003 res!664566) b!994004))

(assert (= (and b!994004 res!664568) b!994005))

(assert (= (and b!994005 res!664569) b!994006))

(declare-fun m!921625 () Bool)

(assert (=> b!994004 m!921625))

(declare-fun m!921627 () Bool)

(assert (=> start!85578 m!921627))

(declare-fun m!921629 () Bool)

(assert (=> b!994003 m!921629))

(declare-fun m!921631 () Bool)

(assert (=> b!994005 m!921631))

(push 1)

(assert (not b!994003))

(assert (not start!85578))

(assert (not b!994005))

(assert (not b!994004))

(check-sat)

(pop 1)

(push 1)

(check-sat)

