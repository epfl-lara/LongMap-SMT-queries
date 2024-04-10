; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117146 () Bool)

(assert start!117146)

(declare-fun b!1378775 () Bool)

(declare-fun res!921309 () Bool)

(declare-fun e!781070 () Bool)

(assert (=> b!1378775 (=> (not res!921309) (not e!781070))))

(declare-datatypes ((array!93763 0))(
  ( (array!93764 (arr!45282 (Array (_ BitVec 32) (_ BitVec 64))) (size!45832 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93763)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378775 (= res!921309 (and (bvslt (size!45832 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45832 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378776 () Bool)

(declare-fun res!921313 () Bool)

(assert (=> b!1378776 (=> (not res!921313) (not e!781070))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378776 (= res!921313 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1378777 () Bool)

(declare-fun res!921311 () Bool)

(assert (=> b!1378777 (=> (not res!921311) (not e!781070))))

(declare-fun arrayCountValidKeys!0 (array!93763 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378777 (= res!921311 (= (arrayCountValidKeys!0 (array!93764 (store (arr!45282 a!4094) i!1451 k0!2953) (size!45832 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(declare-fun res!921312 () Bool)

(assert (=> start!117146 (=> (not res!921312) (not e!781070))))

(assert (=> start!117146 (= res!921312 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45832 a!4094))))))

(assert (=> start!117146 e!781070))

(assert (=> start!117146 true))

(declare-fun array_inv!34310 (array!93763) Bool)

(assert (=> start!117146 (array_inv!34310 a!4094)))

(declare-fun b!1378778 () Bool)

(assert (=> b!1378778 (= e!781070 (and (bvsle from!3466 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451))))))

(declare-fun b!1378779 () Bool)

(declare-fun res!921310 () Bool)

(assert (=> b!1378779 (=> (not res!921310) (not e!781070))))

(assert (=> b!1378779 (= res!921310 (validKeyInArray!0 (select (arr!45282 a!4094) i!1451)))))

(assert (= (and start!117146 res!921312) b!1378779))

(assert (= (and b!1378779 res!921310) b!1378776))

(assert (= (and b!1378776 res!921313) b!1378775))

(assert (= (and b!1378775 res!921309) b!1378777))

(assert (= (and b!1378777 res!921311) b!1378778))

(declare-fun m!1263593 () Bool)

(assert (=> b!1378776 m!1263593))

(declare-fun m!1263595 () Bool)

(assert (=> b!1378777 m!1263595))

(declare-fun m!1263597 () Bool)

(assert (=> b!1378777 m!1263597))

(declare-fun m!1263599 () Bool)

(assert (=> b!1378777 m!1263599))

(declare-fun m!1263601 () Bool)

(assert (=> start!117146 m!1263601))

(declare-fun m!1263603 () Bool)

(assert (=> b!1378779 m!1263603))

(assert (=> b!1378779 m!1263603))

(declare-fun m!1263605 () Bool)

(assert (=> b!1378779 m!1263605))

(check-sat (not start!117146) (not b!1378779) (not b!1378777) (not b!1378776))
(check-sat)
