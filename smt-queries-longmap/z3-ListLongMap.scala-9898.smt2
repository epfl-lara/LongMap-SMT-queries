; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117128 () Bool)

(assert start!117128)

(declare-fun b!1378610 () Bool)

(declare-fun res!921189 () Bool)

(declare-fun e!780997 () Bool)

(assert (=> b!1378610 (=> (not res!921189) (not e!780997))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378610 (= res!921189 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1378611 () Bool)

(declare-fun res!921190 () Bool)

(assert (=> b!1378611 (=> (not res!921190) (not e!780997))))

(declare-datatypes ((array!93699 0))(
  ( (array!93700 (arr!45250 (Array (_ BitVec 32) (_ BitVec 64))) (size!45802 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93699)

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378611 (= res!921190 (validKeyInArray!0 (select (arr!45250 a!4094) i!1451)))))

(declare-fun b!1378612 () Bool)

(declare-fun res!921187 () Bool)

(assert (=> b!1378612 (=> (not res!921187) (not e!780997))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93699 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378612 (= res!921187 (= (arrayCountValidKeys!0 (array!93700 (store (arr!45250 a!4094) i!1451 k0!2953) (size!45802 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(declare-fun b!1378613 () Bool)

(assert (=> b!1378613 (= e!780997 (and (bvsle from!3466 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451))))))

(declare-fun b!1378614 () Bool)

(declare-fun res!921191 () Bool)

(assert (=> b!1378614 (=> (not res!921191) (not e!780997))))

(assert (=> b!1378614 (= res!921191 (and (bvslt (size!45802 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45802 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!921188 () Bool)

(assert (=> start!117128 (=> (not res!921188) (not e!780997))))

(assert (=> start!117128 (= res!921188 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45802 a!4094))))))

(assert (=> start!117128 e!780997))

(assert (=> start!117128 true))

(declare-fun array_inv!34483 (array!93699) Bool)

(assert (=> start!117128 (array_inv!34483 a!4094)))

(assert (= (and start!117128 res!921188) b!1378611))

(assert (= (and b!1378611 res!921190) b!1378610))

(assert (= (and b!1378610 res!921189) b!1378614))

(assert (= (and b!1378614 res!921191) b!1378612))

(assert (= (and b!1378612 res!921187) b!1378613))

(declare-fun m!1262991 () Bool)

(assert (=> b!1378610 m!1262991))

(declare-fun m!1262993 () Bool)

(assert (=> b!1378611 m!1262993))

(assert (=> b!1378611 m!1262993))

(declare-fun m!1262995 () Bool)

(assert (=> b!1378611 m!1262995))

(declare-fun m!1262997 () Bool)

(assert (=> b!1378612 m!1262997))

(declare-fun m!1262999 () Bool)

(assert (=> b!1378612 m!1262999))

(declare-fun m!1263001 () Bool)

(assert (=> b!1378612 m!1263001))

(declare-fun m!1263003 () Bool)

(assert (=> start!117128 m!1263003))

(check-sat (not start!117128) (not b!1378610) (not b!1378611) (not b!1378612))
(check-sat)
