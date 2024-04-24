; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85652 () Bool)

(assert start!85652)

(declare-fun b!994449 () Bool)

(declare-fun e!561242 () Bool)

(declare-datatypes ((array!62810 0))(
  ( (array!62811 (arr!30244 (Array (_ BitVec 32) (_ BitVec 64))) (size!30741 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62810)

(assert (=> b!994449 (= e!561242 (not (bvslt (size!30741 a!4424) #b01111111111111111111111111111111)))))

(declare-fun from!3778 () (_ BitVec 32))

(declare-datatypes ((List!20933 0))(
  ( (Nil!20930) (Cons!20929 (h!22097 (_ BitVec 64)) (t!29926 List!20933)) )
))
(declare-fun acc!919 () List!20933)

(declare-fun arrayNoDuplicates!0 (array!62810 (_ BitVec 32) List!20933) Bool)

(assert (=> b!994449 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32911 0))(
  ( (Unit!32912) )
))
(declare-fun lt!440927 () Unit!32911)

(declare-fun size!36 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62810 (_ BitVec 32) (_ BitVec 32) List!20933) Unit!32911)

(assert (=> b!994449 (= lt!440927 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun b!994450 () Bool)

(declare-fun res!664457 () Bool)

(assert (=> b!994450 (=> (not res!664457) (not e!561242))))

(declare-fun contains!5827 (List!20933 (_ BitVec 64)) Bool)

(assert (=> b!994450 (= res!664457 (not (contains!5827 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994451 () Bool)

(declare-fun res!664455 () Bool)

(assert (=> b!994451 (=> (not res!664455) (not e!561242))))

(assert (=> b!994451 (= res!664455 (not (contains!5827 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994452 () Bool)

(declare-fun res!664454 () Bool)

(assert (=> b!994452 (=> (not res!664454) (not e!561242))))

(assert (=> b!994452 (= res!664454 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30741 a!4424))))))

(declare-fun b!994453 () Bool)

(declare-fun res!664456 () Bool)

(assert (=> b!994453 (=> (not res!664456) (not e!561242))))

(declare-fun noDuplicate!1412 (List!20933) Bool)

(assert (=> b!994453 (= res!664456 (noDuplicate!1412 acc!919))))

(declare-fun res!664453 () Bool)

(assert (=> start!85652 (=> (not res!664453) (not e!561242))))

(assert (=> start!85652 (= res!664453 (and (= (size!30741 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62811 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30741 a!4424))))))

(assert (=> start!85652 e!561242))

(declare-fun array_inv!23380 (array!62810) Bool)

(assert (=> start!85652 (array_inv!23380 a!4424)))

(assert (=> start!85652 true))

(assert (= (and start!85652 res!664453) b!994451))

(assert (= (and b!994451 res!664455) b!994450))

(assert (= (and b!994450 res!664457) b!994453))

(assert (= (and b!994453 res!664456) b!994452))

(assert (= (and b!994452 res!664454) b!994449))

(declare-fun m!922541 () Bool)

(assert (=> b!994451 m!922541))

(declare-fun m!922543 () Bool)

(assert (=> b!994453 m!922543))

(declare-fun m!922545 () Bool)

(assert (=> start!85652 m!922545))

(declare-fun m!922547 () Bool)

(assert (=> b!994449 m!922547))

(declare-fun m!922549 () Bool)

(assert (=> b!994449 m!922549))

(declare-fun m!922551 () Bool)

(assert (=> b!994450 m!922551))

(check-sat (not start!85652) (not b!994451) (not b!994450) (not b!994449) (not b!994453))
(check-sat)
