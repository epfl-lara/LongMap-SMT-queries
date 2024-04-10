; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117266 () Bool)

(assert start!117266)

(declare-fun b!1379605 () Bool)

(declare-fun e!781527 () Bool)

(declare-fun e!781529 () Bool)

(assert (=> b!1379605 (= e!781527 e!781529)))

(declare-fun res!922043 () Bool)

(assert (=> b!1379605 (=> (not res!922043) (not e!781529))))

(declare-datatypes ((array!93862 0))(
  ( (array!93863 (arr!45330 (Array (_ BitVec 32) (_ BitVec 64))) (size!45880 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93862)

(declare-fun lt!607677 () array!93862)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93862 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379605 (= res!922043 (= (arrayCountValidKeys!0 lt!607677 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1379605 (= lt!607677 (array!93863 (store (arr!45330 a!4094) i!1451 k0!2953) (size!45880 a!4094)))))

(declare-fun b!1379606 () Bool)

(declare-fun res!922046 () Bool)

(assert (=> b!1379606 (=> (not res!922046) (not e!781527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379606 (= res!922046 (validKeyInArray!0 (select (arr!45330 a!4094) i!1451)))))

(declare-fun b!1379607 () Bool)

(declare-fun res!922048 () Bool)

(assert (=> b!1379607 (=> (not res!922048) (not e!781527))))

(assert (=> b!1379607 (= res!922048 (and (bvslt (size!45880 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45880 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379608 () Bool)

(assert (=> b!1379608 (= e!781529 (not (= (arrayCountValidKeys!0 lt!607677 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))))

(declare-fun res!922045 () Bool)

(assert (=> start!117266 (=> (not res!922045) (not e!781527))))

(assert (=> start!117266 (= res!922045 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45880 a!4094))))))

(assert (=> start!117266 e!781527))

(assert (=> start!117266 true))

(declare-fun array_inv!34358 (array!93862) Bool)

(assert (=> start!117266 (array_inv!34358 a!4094)))

(declare-fun b!1379609 () Bool)

(declare-fun res!922044 () Bool)

(assert (=> b!1379609 (=> (not res!922044) (not e!781527))))

(assert (=> b!1379609 (= res!922044 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1379610 () Bool)

(declare-fun res!922047 () Bool)

(assert (=> b!1379610 (=> (not res!922047) (not e!781529))))

(assert (=> b!1379610 (= res!922047 (bvsle from!3466 #b00000000000000000000000000000000))))

(assert (= (and start!117266 res!922045) b!1379606))

(assert (= (and b!1379606 res!922046) b!1379609))

(assert (= (and b!1379609 res!922044) b!1379607))

(assert (= (and b!1379607 res!922048) b!1379605))

(assert (= (and b!1379605 res!922043) b!1379610))

(assert (= (and b!1379610 res!922047) b!1379608))

(declare-fun m!1264761 () Bool)

(assert (=> start!117266 m!1264761))

(declare-fun m!1264763 () Bool)

(assert (=> b!1379606 m!1264763))

(assert (=> b!1379606 m!1264763))

(declare-fun m!1264765 () Bool)

(assert (=> b!1379606 m!1264765))

(declare-fun m!1264767 () Bool)

(assert (=> b!1379608 m!1264767))

(declare-fun m!1264769 () Bool)

(assert (=> b!1379608 m!1264769))

(declare-fun m!1264771 () Bool)

(assert (=> b!1379609 m!1264771))

(declare-fun m!1264773 () Bool)

(assert (=> b!1379605 m!1264773))

(declare-fun m!1264775 () Bool)

(assert (=> b!1379605 m!1264775))

(declare-fun m!1264777 () Bool)

(assert (=> b!1379605 m!1264777))

(check-sat (not b!1379606) (not b!1379608) (not start!117266) (not b!1379605) (not b!1379609))
(check-sat)
