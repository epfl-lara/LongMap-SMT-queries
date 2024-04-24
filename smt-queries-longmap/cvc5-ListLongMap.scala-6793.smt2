; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85668 () Bool)

(assert start!85668)

(declare-fun b!994569 () Bool)

(declare-fun res!664574 () Bool)

(declare-fun e!561290 () Bool)

(assert (=> b!994569 (=> (not res!664574) (not e!561290))))

(declare-datatypes ((List!20941 0))(
  ( (Nil!20938) (Cons!20937 (h!22105 (_ BitVec 64)) (t!29934 List!20941)) )
))
(declare-fun acc!919 () List!20941)

(declare-fun noDuplicate!1420 (List!20941) Bool)

(assert (=> b!994569 (= res!664574 (noDuplicate!1420 acc!919))))

(declare-fun b!994570 () Bool)

(declare-fun res!664573 () Bool)

(assert (=> b!994570 (=> (not res!664573) (not e!561290))))

(declare-datatypes ((array!62826 0))(
  ( (array!62827 (arr!30252 (Array (_ BitVec 32) (_ BitVec 64))) (size!30749 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62826)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!994570 (= res!664573 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30749 a!4424))))))

(declare-fun b!994571 () Bool)

(assert (=> b!994571 (= e!561290 (not true))))

(declare-fun arrayNoDuplicates!0 (array!62826 (_ BitVec 32) List!20941) Bool)

(assert (=> b!994571 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32927 0))(
  ( (Unit!32928) )
))
(declare-fun lt!440951 () Unit!32927)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62826 (_ BitVec 32) (_ BitVec 32) List!20941) Unit!32927)

(assert (=> b!994571 (= lt!440951 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun b!994572 () Bool)

(declare-fun res!664575 () Bool)

(assert (=> b!994572 (=> (not res!664575) (not e!561290))))

(declare-fun contains!5835 (List!20941 (_ BitVec 64)) Bool)

(assert (=> b!994572 (= res!664575 (not (contains!5835 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!664576 () Bool)

(assert (=> start!85668 (=> (not res!664576) (not e!561290))))

(assert (=> start!85668 (= res!664576 (and (= (size!30749 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62827 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30749 a!4424))))))

(assert (=> start!85668 e!561290))

(declare-fun array_inv!23388 (array!62826) Bool)

(assert (=> start!85668 (array_inv!23388 a!4424)))

(assert (=> start!85668 true))

(declare-fun b!994573 () Bool)

(declare-fun res!664577 () Bool)

(assert (=> b!994573 (=> (not res!664577) (not e!561290))))

(assert (=> b!994573 (= res!664577 (not (contains!5835 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85668 res!664576) b!994573))

(assert (= (and b!994573 res!664577) b!994572))

(assert (= (and b!994572 res!664575) b!994569))

(assert (= (and b!994569 res!664574) b!994570))

(assert (= (and b!994570 res!664573) b!994571))

(declare-fun m!922637 () Bool)

(assert (=> b!994572 m!922637))

(declare-fun m!922639 () Bool)

(assert (=> start!85668 m!922639))

(declare-fun m!922641 () Bool)

(assert (=> b!994573 m!922641))

(declare-fun m!922643 () Bool)

(assert (=> b!994569 m!922643))

(declare-fun m!922645 () Bool)

(assert (=> b!994571 m!922645))

(declare-fun m!922647 () Bool)

(assert (=> b!994571 m!922647))

(push 1)

(assert (not b!994572))

(assert (not start!85668))

(assert (not b!994571))

(assert (not b!994569))

(assert (not b!994573))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

