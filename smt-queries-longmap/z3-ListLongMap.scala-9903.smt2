; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117158 () Bool)

(assert start!117158)

(declare-fun b!1378808 () Bool)

(declare-fun e!781087 () Bool)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378808 (= e!781087 (and (bvsgt from!3466 #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvslt from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsgt from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))))

(declare-fun b!1378809 () Bool)

(declare-fun res!921389 () Bool)

(assert (=> b!1378809 (=> (not res!921389) (not e!781087))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378809 (= res!921389 (not (validKeyInArray!0 k0!2953)))))

(declare-fun res!921387 () Bool)

(assert (=> start!117158 (=> (not res!921387) (not e!781087))))

(declare-datatypes ((array!93729 0))(
  ( (array!93730 (arr!45265 (Array (_ BitVec 32) (_ BitVec 64))) (size!45817 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93729)

(assert (=> start!117158 (= res!921387 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45817 a!4094))))))

(assert (=> start!117158 e!781087))

(assert (=> start!117158 true))

(declare-fun array_inv!34498 (array!93729) Bool)

(assert (=> start!117158 (array_inv!34498 a!4094)))

(declare-fun b!1378810 () Bool)

(declare-fun res!921385 () Bool)

(assert (=> b!1378810 (=> (not res!921385) (not e!781087))))

(assert (=> b!1378810 (= res!921385 (validKeyInArray!0 (select (arr!45265 a!4094) i!1451)))))

(declare-fun b!1378811 () Bool)

(declare-fun res!921388 () Bool)

(assert (=> b!1378811 (=> (not res!921388) (not e!781087))))

(declare-fun arrayCountValidKeys!0 (array!93729 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378811 (= res!921388 (= (arrayCountValidKeys!0 (array!93730 (store (arr!45265 a!4094) i!1451 k0!2953) (size!45817 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(declare-fun b!1378812 () Bool)

(declare-fun res!921386 () Bool)

(assert (=> b!1378812 (=> (not res!921386) (not e!781087))))

(assert (=> b!1378812 (= res!921386 (and (bvslt (size!45817 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45817 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117158 res!921387) b!1378810))

(assert (= (and b!1378810 res!921385) b!1378809))

(assert (= (and b!1378809 res!921389) b!1378812))

(assert (= (and b!1378812 res!921386) b!1378811))

(assert (= (and b!1378811 res!921388) b!1378808))

(declare-fun m!1263201 () Bool)

(assert (=> b!1378809 m!1263201))

(declare-fun m!1263203 () Bool)

(assert (=> start!117158 m!1263203))

(declare-fun m!1263205 () Bool)

(assert (=> b!1378810 m!1263205))

(assert (=> b!1378810 m!1263205))

(declare-fun m!1263207 () Bool)

(assert (=> b!1378810 m!1263207))

(declare-fun m!1263209 () Bool)

(assert (=> b!1378811 m!1263209))

(declare-fun m!1263211 () Bool)

(assert (=> b!1378811 m!1263211))

(declare-fun m!1263213 () Bool)

(assert (=> b!1378811 m!1263213))

(check-sat (not b!1378811) (not b!1378810) (not b!1378809) (not start!117158))
(check-sat)
