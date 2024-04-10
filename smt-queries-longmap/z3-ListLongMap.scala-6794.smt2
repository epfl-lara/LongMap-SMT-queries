; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85504 () Bool)

(assert start!85504)

(declare-fun res!664250 () Bool)

(declare-fun e!560720 () Bool)

(assert (=> start!85504 (=> (not res!664250) (not e!560720))))

(declare-datatypes ((array!62785 0))(
  ( (array!62786 (arr!30236 (Array (_ BitVec 32) (_ BitVec 64))) (size!30733 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62785)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85504 (= res!664250 (and (= (size!30733 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62786 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30733 a!4424))))))

(assert (=> start!85504 e!560720))

(declare-fun array_inv!23360 (array!62785) Bool)

(assert (=> start!85504 (array_inv!23360 a!4424)))

(assert (=> start!85504 true))

(declare-fun b!993686 () Bool)

(declare-fun res!664249 () Bool)

(assert (=> b!993686 (=> (not res!664249) (not e!560720))))

(declare-datatypes ((List!20954 0))(
  ( (Nil!20951) (Cons!20950 (h!22112 (_ BitVec 64)) (t!29955 List!20954)) )
))
(declare-fun acc!919 () List!20954)

(declare-fun contains!5815 (List!20954 (_ BitVec 64)) Bool)

(assert (=> b!993686 (= res!664249 (not (contains!5815 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993687 () Bool)

(declare-fun res!664251 () Bool)

(assert (=> b!993687 (=> (not res!664251) (not e!560720))))

(assert (=> b!993687 (= res!664251 (not (contains!5815 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993688 () Bool)

(assert (=> b!993688 (= e!560720 false)))

(declare-fun lt!440596 () Bool)

(declare-fun noDuplicate!1413 (List!20954) Bool)

(assert (=> b!993688 (= lt!440596 (noDuplicate!1413 acc!919))))

(assert (= (and start!85504 res!664250) b!993686))

(assert (= (and b!993686 res!664249) b!993687))

(assert (= (and b!993687 res!664251) b!993688))

(declare-fun m!921363 () Bool)

(assert (=> start!85504 m!921363))

(declare-fun m!921365 () Bool)

(assert (=> b!993686 m!921365))

(declare-fun m!921367 () Bool)

(assert (=> b!993687 m!921367))

(declare-fun m!921369 () Bool)

(assert (=> b!993688 m!921369))

(check-sat (not b!993686) (not b!993687) (not start!85504) (not b!993688))
