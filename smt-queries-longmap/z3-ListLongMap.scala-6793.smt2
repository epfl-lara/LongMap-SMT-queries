; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85498 () Bool)

(assert start!85498)

(declare-fun b!993651 () Bool)

(declare-fun res!664215 () Bool)

(declare-fun e!560703 () Bool)

(assert (=> b!993651 (=> (not res!664215) (not e!560703))))

(declare-datatypes ((List!20951 0))(
  ( (Nil!20948) (Cons!20947 (h!22109 (_ BitVec 64)) (t!29952 List!20951)) )
))
(declare-fun acc!919 () List!20951)

(declare-fun contains!5812 (List!20951 (_ BitVec 64)) Bool)

(assert (=> b!993651 (= res!664215 (not (contains!5812 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993652 () Bool)

(declare-fun res!664218 () Bool)

(assert (=> b!993652 (=> (not res!664218) (not e!560703))))

(declare-datatypes ((array!62779 0))(
  ( (array!62780 (arr!30233 (Array (_ BitVec 32) (_ BitVec 64))) (size!30730 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62779)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!993652 (= res!664218 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30730 a!4424))))))

(declare-fun b!993653 () Bool)

(declare-fun res!664214 () Bool)

(assert (=> b!993653 (=> (not res!664214) (not e!560703))))

(assert (=> b!993653 (= res!664214 (not (contains!5812 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993654 () Bool)

(declare-fun res!664216 () Bool)

(assert (=> b!993654 (=> (not res!664216) (not e!560703))))

(declare-fun noDuplicate!1410 (List!20951) Bool)

(assert (=> b!993654 (= res!664216 (noDuplicate!1410 acc!919))))

(declare-fun res!664217 () Bool)

(assert (=> start!85498 (=> (not res!664217) (not e!560703))))

(assert (=> start!85498 (= res!664217 (and (= (size!30730 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62780 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30730 a!4424))))))

(assert (=> start!85498 e!560703))

(declare-fun array_inv!23357 (array!62779) Bool)

(assert (=> start!85498 (array_inv!23357 a!4424)))

(assert (=> start!85498 true))

(declare-fun b!993655 () Bool)

(assert (=> b!993655 (= e!560703 (not true))))

(declare-fun arrayNoDuplicates!0 (array!62779 (_ BitVec 32) List!20951) Bool)

(assert (=> b!993655 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32936 0))(
  ( (Unit!32937) )
))
(declare-fun lt!440587 () Unit!32936)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62779 (_ BitVec 32) (_ BitVec 32) List!20951) Unit!32936)

(assert (=> b!993655 (= lt!440587 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(assert (= (and start!85498 res!664217) b!993651))

(assert (= (and b!993651 res!664215) b!993653))

(assert (= (and b!993653 res!664214) b!993654))

(assert (= (and b!993654 res!664216) b!993652))

(assert (= (and b!993652 res!664218) b!993655))

(declare-fun m!921331 () Bool)

(assert (=> b!993654 m!921331))

(declare-fun m!921333 () Bool)

(assert (=> b!993655 m!921333))

(declare-fun m!921335 () Bool)

(assert (=> b!993655 m!921335))

(declare-fun m!921337 () Bool)

(assert (=> start!85498 m!921337))

(declare-fun m!921339 () Bool)

(assert (=> b!993653 m!921339))

(declare-fun m!921341 () Bool)

(assert (=> b!993651 m!921341))

(check-sat (not b!993654) (not b!993651) (not b!993653) (not start!85498) (not b!993655))
