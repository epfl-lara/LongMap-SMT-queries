; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117364 () Bool)

(assert start!117364)

(declare-fun b!1379989 () Bool)

(declare-fun res!921737 () Bool)

(declare-fun e!781878 () Bool)

(assert (=> b!1379989 (=> (not res!921737) (not e!781878))))

(declare-datatypes ((array!93865 0))(
  ( (array!93866 (arr!45328 (Array (_ BitVec 32) (_ BitVec 64))) (size!45879 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93865)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1379989 (= res!921737 (and (bvslt (size!45879 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45879 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379990 () Bool)

(declare-fun res!921734 () Bool)

(assert (=> b!1379990 (=> (not res!921734) (not e!781878))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93865 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379990 (= res!921734 (= (arrayCountValidKeys!0 (array!93866 (store (arr!45328 a!4094) i!1451 k0!2953) (size!45879 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(declare-fun res!921736 () Bool)

(assert (=> start!117364 (=> (not res!921736) (not e!781878))))

(assert (=> start!117364 (= res!921736 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45879 a!4094))))))

(assert (=> start!117364 e!781878))

(assert (=> start!117364 true))

(declare-fun array_inv!34609 (array!93865) Bool)

(assert (=> start!117364 (array_inv!34609 a!4094)))

(declare-fun b!1379991 () Bool)

(declare-fun res!921735 () Bool)

(assert (=> b!1379991 (=> (not res!921735) (not e!781878))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379991 (= res!921735 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1379992 () Bool)

(assert (=> b!1379992 (= e!781878 (and (bvsle from!3466 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451))))))

(declare-fun b!1379993 () Bool)

(declare-fun res!921738 () Bool)

(assert (=> b!1379993 (=> (not res!921738) (not e!781878))))

(assert (=> b!1379993 (= res!921738 (validKeyInArray!0 (select (arr!45328 a!4094) i!1451)))))

(assert (= (and start!117364 res!921736) b!1379993))

(assert (= (and b!1379993 res!921738) b!1379991))

(assert (= (and b!1379991 res!921735) b!1379989))

(assert (= (and b!1379989 res!921737) b!1379990))

(assert (= (and b!1379990 res!921734) b!1379992))

(declare-fun m!1265131 () Bool)

(assert (=> b!1379990 m!1265131))

(declare-fun m!1265133 () Bool)

(assert (=> b!1379990 m!1265133))

(declare-fun m!1265135 () Bool)

(assert (=> b!1379990 m!1265135))

(declare-fun m!1265137 () Bool)

(assert (=> start!117364 m!1265137))

(declare-fun m!1265139 () Bool)

(assert (=> b!1379991 m!1265139))

(declare-fun m!1265141 () Bool)

(assert (=> b!1379993 m!1265141))

(assert (=> b!1379993 m!1265141))

(declare-fun m!1265143 () Bool)

(assert (=> b!1379993 m!1265143))

(check-sat (not b!1379993) (not start!117364) (not b!1379990) (not b!1379991))
(check-sat)
