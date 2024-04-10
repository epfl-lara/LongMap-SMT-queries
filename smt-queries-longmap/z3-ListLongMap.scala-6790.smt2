; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85480 () Bool)

(assert start!85480)

(declare-fun b!993516 () Bool)

(declare-fun res!664082 () Bool)

(declare-fun e!560648 () Bool)

(assert (=> b!993516 (=> (not res!664082) (not e!560648))))

(declare-datatypes ((List!20942 0))(
  ( (Nil!20939) (Cons!20938 (h!22100 (_ BitVec 64)) (t!29943 List!20942)) )
))
(declare-fun acc!919 () List!20942)

(declare-fun contains!5803 (List!20942 (_ BitVec 64)) Bool)

(assert (=> b!993516 (= res!664082 (not (contains!5803 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!664080 () Bool)

(assert (=> start!85480 (=> (not res!664080) (not e!560648))))

(declare-datatypes ((array!62761 0))(
  ( (array!62762 (arr!30224 (Array (_ BitVec 32) (_ BitVec 64))) (size!30721 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62761)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85480 (= res!664080 (and (= (size!30721 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62762 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30721 a!4424))))))

(assert (=> start!85480 e!560648))

(declare-fun array_inv!23348 (array!62761) Bool)

(assert (=> start!85480 (array_inv!23348 a!4424)))

(assert (=> start!85480 true))

(declare-fun b!993517 () Bool)

(declare-fun res!664079 () Bool)

(assert (=> b!993517 (=> (not res!664079) (not e!560648))))

(declare-fun noDuplicate!1401 (List!20942) Bool)

(assert (=> b!993517 (= res!664079 (noDuplicate!1401 acc!919))))

(declare-fun b!993518 () Bool)

(assert (=> b!993518 (= e!560648 (not true))))

(declare-fun arrayNoDuplicates!0 (array!62761 (_ BitVec 32) List!20942) Bool)

(assert (=> b!993518 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32918 0))(
  ( (Unit!32919) )
))
(declare-fun lt!440560 () Unit!32918)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62761 (_ BitVec 32) (_ BitVec 32) List!20942) Unit!32918)

(assert (=> b!993518 (= lt!440560 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun b!993519 () Bool)

(declare-fun res!664081 () Bool)

(assert (=> b!993519 (=> (not res!664081) (not e!560648))))

(assert (=> b!993519 (= res!664081 (not (contains!5803 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993520 () Bool)

(declare-fun res!664083 () Bool)

(assert (=> b!993520 (=> (not res!664083) (not e!560648))))

(assert (=> b!993520 (= res!664083 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30721 a!4424))))))

(assert (= (and start!85480 res!664080) b!993519))

(assert (= (and b!993519 res!664081) b!993516))

(assert (= (and b!993516 res!664082) b!993517))

(assert (= (and b!993517 res!664079) b!993520))

(assert (= (and b!993520 res!664083) b!993518))

(declare-fun m!921223 () Bool)

(assert (=> start!85480 m!921223))

(declare-fun m!921225 () Bool)

(assert (=> b!993518 m!921225))

(declare-fun m!921227 () Bool)

(assert (=> b!993518 m!921227))

(declare-fun m!921229 () Bool)

(assert (=> b!993516 m!921229))

(declare-fun m!921231 () Bool)

(assert (=> b!993519 m!921231))

(declare-fun m!921233 () Bool)

(assert (=> b!993517 m!921233))

(check-sat (not b!993519) (not start!85480) (not b!993516) (not b!993517) (not b!993518))
