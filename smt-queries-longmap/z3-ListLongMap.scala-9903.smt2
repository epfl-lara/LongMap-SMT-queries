; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117164 () Bool)

(assert start!117164)

(declare-fun b!1378892 () Bool)

(declare-fun e!781123 () Bool)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378892 (= e!781123 (and (bvsgt from!3466 #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvslt from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsgt from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))))

(declare-fun res!921427 () Bool)

(assert (=> start!117164 (=> (not res!921427) (not e!781123))))

(declare-datatypes ((array!93781 0))(
  ( (array!93782 (arr!45291 (Array (_ BitVec 32) (_ BitVec 64))) (size!45841 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93781)

(assert (=> start!117164 (= res!921427 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45841 a!4094))))))

(assert (=> start!117164 e!781123))

(assert (=> start!117164 true))

(declare-fun array_inv!34319 (array!93781) Bool)

(assert (=> start!117164 (array_inv!34319 a!4094)))

(declare-fun b!1378893 () Bool)

(declare-fun res!921426 () Bool)

(assert (=> b!1378893 (=> (not res!921426) (not e!781123))))

(assert (=> b!1378893 (= res!921426 (and (bvslt (size!45841 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45841 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378894 () Bool)

(declare-fun res!921430 () Bool)

(assert (=> b!1378894 (=> (not res!921430) (not e!781123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378894 (= res!921430 (validKeyInArray!0 (select (arr!45291 a!4094) i!1451)))))

(declare-fun b!1378895 () Bool)

(declare-fun res!921428 () Bool)

(assert (=> b!1378895 (=> (not res!921428) (not e!781123))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1378895 (= res!921428 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1378896 () Bool)

(declare-fun res!921429 () Bool)

(assert (=> b!1378896 (=> (not res!921429) (not e!781123))))

(declare-fun arrayCountValidKeys!0 (array!93781 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378896 (= res!921429 (= (arrayCountValidKeys!0 (array!93782 (store (arr!45291 a!4094) i!1451 k0!2953) (size!45841 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(assert (= (and start!117164 res!921427) b!1378894))

(assert (= (and b!1378894 res!921430) b!1378895))

(assert (= (and b!1378895 res!921428) b!1378893))

(assert (= (and b!1378893 res!921426) b!1378896))

(assert (= (and b!1378896 res!921429) b!1378892))

(declare-fun m!1263719 () Bool)

(assert (=> start!117164 m!1263719))

(declare-fun m!1263721 () Bool)

(assert (=> b!1378894 m!1263721))

(assert (=> b!1378894 m!1263721))

(declare-fun m!1263723 () Bool)

(assert (=> b!1378894 m!1263723))

(declare-fun m!1263725 () Bool)

(assert (=> b!1378895 m!1263725))

(declare-fun m!1263727 () Bool)

(assert (=> b!1378896 m!1263727))

(declare-fun m!1263729 () Bool)

(assert (=> b!1378896 m!1263729))

(declare-fun m!1263731 () Bool)

(assert (=> b!1378896 m!1263731))

(check-sat (not b!1378894) (not start!117164) (not b!1378896) (not b!1378895))
(check-sat)
