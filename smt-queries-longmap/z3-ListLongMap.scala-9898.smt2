; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117134 () Bool)

(assert start!117134)

(declare-fun b!1378694 () Bool)

(declare-fun res!921228 () Bool)

(declare-fun e!781034 () Bool)

(assert (=> b!1378694 (=> (not res!921228) (not e!781034))))

(declare-datatypes ((array!93751 0))(
  ( (array!93752 (arr!45276 (Array (_ BitVec 32) (_ BitVec 64))) (size!45826 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93751)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378694 (= res!921228 (and (bvslt (size!45826 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45826 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378695 () Bool)

(declare-fun res!921230 () Bool)

(assert (=> b!1378695 (=> (not res!921230) (not e!781034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378695 (= res!921230 (validKeyInArray!0 (select (arr!45276 a!4094) i!1451)))))

(declare-fun b!1378696 () Bool)

(declare-fun res!921232 () Bool)

(assert (=> b!1378696 (=> (not res!921232) (not e!781034))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93751 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378696 (= res!921232 (= (arrayCountValidKeys!0 (array!93752 (store (arr!45276 a!4094) i!1451 k0!2953) (size!45826 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(declare-fun b!1378697 () Bool)

(assert (=> b!1378697 (= e!781034 (and (bvsle from!3466 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451))))))

(declare-fun res!921231 () Bool)

(assert (=> start!117134 (=> (not res!921231) (not e!781034))))

(assert (=> start!117134 (= res!921231 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45826 a!4094))))))

(assert (=> start!117134 e!781034))

(assert (=> start!117134 true))

(declare-fun array_inv!34304 (array!93751) Bool)

(assert (=> start!117134 (array_inv!34304 a!4094)))

(declare-fun b!1378698 () Bool)

(declare-fun res!921229 () Bool)

(assert (=> b!1378698 (=> (not res!921229) (not e!781034))))

(assert (=> b!1378698 (= res!921229 (not (validKeyInArray!0 k0!2953)))))

(assert (= (and start!117134 res!921231) b!1378695))

(assert (= (and b!1378695 res!921230) b!1378698))

(assert (= (and b!1378698 res!921229) b!1378694))

(assert (= (and b!1378694 res!921228) b!1378696))

(assert (= (and b!1378696 res!921232) b!1378697))

(declare-fun m!1263509 () Bool)

(assert (=> b!1378695 m!1263509))

(assert (=> b!1378695 m!1263509))

(declare-fun m!1263511 () Bool)

(assert (=> b!1378695 m!1263511))

(declare-fun m!1263513 () Bool)

(assert (=> b!1378696 m!1263513))

(declare-fun m!1263515 () Bool)

(assert (=> b!1378696 m!1263515))

(declare-fun m!1263517 () Bool)

(assert (=> b!1378696 m!1263517))

(declare-fun m!1263519 () Bool)

(assert (=> start!117134 m!1263519))

(declare-fun m!1263521 () Bool)

(assert (=> b!1378698 m!1263521))

(check-sat (not b!1378696) (not b!1378698) (not start!117134) (not b!1378695))
(check-sat)
