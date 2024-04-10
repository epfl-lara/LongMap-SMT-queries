; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85486 () Bool)

(assert start!85486)

(declare-fun b!993561 () Bool)

(declare-fun res!664126 () Bool)

(declare-fun e!560666 () Bool)

(assert (=> b!993561 (=> (not res!664126) (not e!560666))))

(declare-datatypes ((List!20945 0))(
  ( (Nil!20942) (Cons!20941 (h!22103 (_ BitVec 64)) (t!29946 List!20945)) )
))
(declare-fun acc!919 () List!20945)

(declare-fun noDuplicate!1404 (List!20945) Bool)

(assert (=> b!993561 (= res!664126 (noDuplicate!1404 acc!919))))

(declare-fun b!993562 () Bool)

(declare-fun res!664128 () Bool)

(assert (=> b!993562 (=> (not res!664128) (not e!560666))))

(declare-fun contains!5806 (List!20945 (_ BitVec 64)) Bool)

(assert (=> b!993562 (= res!664128 (not (contains!5806 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993563 () Bool)

(declare-fun res!664127 () Bool)

(assert (=> b!993563 (=> (not res!664127) (not e!560666))))

(declare-datatypes ((array!62767 0))(
  ( (array!62768 (arr!30227 (Array (_ BitVec 32) (_ BitVec 64))) (size!30724 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62767)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!993563 (= res!664127 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30724 a!4424))))))

(declare-fun b!993564 () Bool)

(declare-fun res!664124 () Bool)

(assert (=> b!993564 (=> (not res!664124) (not e!560666))))

(assert (=> b!993564 (= res!664124 (not (contains!5806 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!664125 () Bool)

(assert (=> start!85486 (=> (not res!664125) (not e!560666))))

(assert (=> start!85486 (= res!664125 (and (= (size!30724 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62768 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30724 a!4424))))))

(assert (=> start!85486 e!560666))

(declare-fun array_inv!23351 (array!62767) Bool)

(assert (=> start!85486 (array_inv!23351 a!4424)))

(assert (=> start!85486 true))

(declare-fun b!993565 () Bool)

(assert (=> b!993565 (= e!560666 (not (bvslt (size!30724 a!4424) #b01111111111111111111111111111111)))))

(declare-fun arrayNoDuplicates!0 (array!62767 (_ BitVec 32) List!20945) Bool)

(assert (=> b!993565 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32924 0))(
  ( (Unit!32925) )
))
(declare-fun lt!440569 () Unit!32924)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62767 (_ BitVec 32) (_ BitVec 32) List!20945) Unit!32924)

(assert (=> b!993565 (= lt!440569 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(assert (= (and start!85486 res!664125) b!993564))

(assert (= (and b!993564 res!664124) b!993562))

(assert (= (and b!993562 res!664128) b!993561))

(assert (= (and b!993561 res!664126) b!993563))

(assert (= (and b!993563 res!664127) b!993565))

(declare-fun m!921259 () Bool)

(assert (=> b!993564 m!921259))

(declare-fun m!921261 () Bool)

(assert (=> b!993561 m!921261))

(declare-fun m!921263 () Bool)

(assert (=> b!993562 m!921263))

(declare-fun m!921265 () Bool)

(assert (=> b!993565 m!921265))

(declare-fun m!921267 () Bool)

(assert (=> b!993565 m!921267))

(declare-fun m!921269 () Bool)

(assert (=> start!85486 m!921269))

(check-sat (not b!993564) (not b!993561) (not b!993565) (not start!85486) (not b!993562))
(check-sat)
