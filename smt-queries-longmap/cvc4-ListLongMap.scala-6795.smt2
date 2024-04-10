; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85512 () Bool)

(assert start!85512)

(declare-fun res!664296 () Bool)

(declare-fun e!560745 () Bool)

(assert (=> start!85512 (=> (not res!664296) (not e!560745))))

(declare-datatypes ((array!62793 0))(
  ( (array!62794 (arr!30240 (Array (_ BitVec 32) (_ BitVec 64))) (size!30737 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62793)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85512 (= res!664296 (and (= (size!30737 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62794 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30737 a!4424))))))

(assert (=> start!85512 e!560745))

(declare-fun array_inv!23364 (array!62793) Bool)

(assert (=> start!85512 (array_inv!23364 a!4424)))

(assert (=> start!85512 true))

(declare-fun b!993731 () Bool)

(declare-fun res!664294 () Bool)

(assert (=> b!993731 (=> (not res!664294) (not e!560745))))

(declare-datatypes ((List!20958 0))(
  ( (Nil!20955) (Cons!20954 (h!22116 (_ BitVec 64)) (t!29959 List!20958)) )
))
(declare-fun acc!919 () List!20958)

(declare-fun contains!5819 (List!20958 (_ BitVec 64)) Bool)

(assert (=> b!993731 (= res!664294 (not (contains!5819 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993732 () Bool)

(declare-fun res!664293 () Bool)

(assert (=> b!993732 (=> (not res!664293) (not e!560745))))

(declare-fun noDuplicate!1417 (List!20958) Bool)

(assert (=> b!993732 (= res!664293 (noDuplicate!1417 acc!919))))

(declare-fun b!993733 () Bool)

(assert (=> b!993733 (= e!560745 (and (bvsge from!3778 size!36) (bvsge (size!30737 a!4424) #b01111111111111111111111111111111)))))

(declare-fun b!993730 () Bool)

(declare-fun res!664295 () Bool)

(assert (=> b!993730 (=> (not res!664295) (not e!560745))))

(assert (=> b!993730 (= res!664295 (not (contains!5819 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85512 res!664296) b!993730))

(assert (= (and b!993730 res!664295) b!993731))

(assert (= (and b!993731 res!664294) b!993732))

(assert (= (and b!993732 res!664293) b!993733))

(declare-fun m!921395 () Bool)

(assert (=> start!85512 m!921395))

(declare-fun m!921397 () Bool)

(assert (=> b!993731 m!921397))

(declare-fun m!921399 () Bool)

(assert (=> b!993732 m!921399))

(declare-fun m!921401 () Bool)

(assert (=> b!993730 m!921401))

(push 1)

(assert (not start!85512))

(assert (not b!993730))

(assert (not b!993732))

(assert (not b!993731))

(check-sat)

(pop 1)

(push 1)

(check-sat)

