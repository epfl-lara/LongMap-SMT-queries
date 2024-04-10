; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85500 () Bool)

(assert start!85500)

(declare-fun b!993666 () Bool)

(declare-fun res!664230 () Bool)

(declare-fun e!560709 () Bool)

(assert (=> b!993666 (=> (not res!664230) (not e!560709))))

(declare-datatypes ((List!20952 0))(
  ( (Nil!20949) (Cons!20948 (h!22110 (_ BitVec 64)) (t!29953 List!20952)) )
))
(declare-fun acc!919 () List!20952)

(declare-fun contains!5813 (List!20952 (_ BitVec 64)) Bool)

(assert (=> b!993666 (= res!664230 (not (contains!5813 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993667 () Bool)

(declare-fun res!664232 () Bool)

(assert (=> b!993667 (=> (not res!664232) (not e!560709))))

(declare-datatypes ((array!62781 0))(
  ( (array!62782 (arr!30234 (Array (_ BitVec 32) (_ BitVec 64))) (size!30731 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62781)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!993667 (= res!664232 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30731 a!4424))))))

(declare-fun res!664233 () Bool)

(assert (=> start!85500 (=> (not res!664233) (not e!560709))))

(assert (=> start!85500 (= res!664233 (and (= (size!30731 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62782 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30731 a!4424))))))

(assert (=> start!85500 e!560709))

(declare-fun array_inv!23358 (array!62781) Bool)

(assert (=> start!85500 (array_inv!23358 a!4424)))

(assert (=> start!85500 true))

(declare-fun b!993668 () Bool)

(assert (=> b!993668 (= e!560709 (not true))))

(declare-fun arrayNoDuplicates!0 (array!62781 (_ BitVec 32) List!20952) Bool)

(assert (=> b!993668 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32938 0))(
  ( (Unit!32939) )
))
(declare-fun lt!440590 () Unit!32938)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62781 (_ BitVec 32) (_ BitVec 32) List!20952) Unit!32938)

(assert (=> b!993668 (= lt!440590 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun b!993669 () Bool)

(declare-fun res!664231 () Bool)

(assert (=> b!993669 (=> (not res!664231) (not e!560709))))

(declare-fun noDuplicate!1411 (List!20952) Bool)

(assert (=> b!993669 (= res!664231 (noDuplicate!1411 acc!919))))

(declare-fun b!993670 () Bool)

(declare-fun res!664229 () Bool)

(assert (=> b!993670 (=> (not res!664229) (not e!560709))))

(assert (=> b!993670 (= res!664229 (not (contains!5813 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85500 res!664233) b!993666))

(assert (= (and b!993666 res!664230) b!993670))

(assert (= (and b!993670 res!664229) b!993669))

(assert (= (and b!993669 res!664231) b!993667))

(assert (= (and b!993667 res!664232) b!993668))

(declare-fun m!921343 () Bool)

(assert (=> start!85500 m!921343))

(declare-fun m!921345 () Bool)

(assert (=> b!993668 m!921345))

(declare-fun m!921347 () Bool)

(assert (=> b!993668 m!921347))

(declare-fun m!921349 () Bool)

(assert (=> b!993666 m!921349))

(declare-fun m!921351 () Bool)

(assert (=> b!993670 m!921351))

(declare-fun m!921353 () Bool)

(assert (=> b!993669 m!921353))

(push 1)

(assert (not start!85500))

(assert (not b!993669))

(assert (not b!993668))

(assert (not b!993670))

(assert (not b!993666))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

