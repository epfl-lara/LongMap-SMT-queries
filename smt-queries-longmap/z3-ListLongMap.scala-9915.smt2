; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117260 () Bool)

(assert start!117260)

(declare-fun b!1379562 () Bool)

(declare-fun e!781505 () Bool)

(assert (=> b!1379562 (= e!781505 false)))

(declare-datatypes ((array!93856 0))(
  ( (array!93857 (arr!45327 (Array (_ BitVec 32) (_ BitVec 64))) (size!45877 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93856)

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun lt!607665 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93856 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379562 (= lt!607665 (arrayCountValidKeys!0 (array!93857 (store (arr!45327 a!4094) i!1451 k0!2953) (size!45877 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607664 () (_ BitVec 32))

(assert (=> b!1379562 (= lt!607664 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun res!921999 () Bool)

(assert (=> start!117260 (=> (not res!921999) (not e!781505))))

(assert (=> start!117260 (= res!921999 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45877 a!4094))))))

(assert (=> start!117260 e!781505))

(assert (=> start!117260 true))

(declare-fun array_inv!34355 (array!93856) Bool)

(assert (=> start!117260 (array_inv!34355 a!4094)))

(declare-fun b!1379561 () Bool)

(declare-fun res!921998 () Bool)

(assert (=> b!1379561 (=> (not res!921998) (not e!781505))))

(assert (=> b!1379561 (= res!921998 (and (bvslt (size!45877 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45877 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379560 () Bool)

(declare-fun res!922000 () Bool)

(assert (=> b!1379560 (=> (not res!922000) (not e!781505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379560 (= res!922000 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1379559 () Bool)

(declare-fun res!921997 () Bool)

(assert (=> b!1379559 (=> (not res!921997) (not e!781505))))

(assert (=> b!1379559 (= res!921997 (validKeyInArray!0 (select (arr!45327 a!4094) i!1451)))))

(assert (= (and start!117260 res!921999) b!1379559))

(assert (= (and b!1379559 res!921997) b!1379560))

(assert (= (and b!1379560 res!922000) b!1379561))

(assert (= (and b!1379561 res!921998) b!1379562))

(declare-fun m!1264715 () Bool)

(assert (=> b!1379562 m!1264715))

(declare-fun m!1264717 () Bool)

(assert (=> b!1379562 m!1264717))

(declare-fun m!1264719 () Bool)

(assert (=> b!1379562 m!1264719))

(declare-fun m!1264721 () Bool)

(assert (=> start!117260 m!1264721))

(declare-fun m!1264723 () Bool)

(assert (=> b!1379560 m!1264723))

(declare-fun m!1264725 () Bool)

(assert (=> b!1379559 m!1264725))

(assert (=> b!1379559 m!1264725))

(declare-fun m!1264727 () Bool)

(assert (=> b!1379559 m!1264727))

(check-sat (not start!117260) (not b!1379559) (not b!1379560) (not b!1379562))
