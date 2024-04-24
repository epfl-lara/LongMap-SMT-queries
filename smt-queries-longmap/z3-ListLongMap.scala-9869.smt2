; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117130 () Bool)

(assert start!117130)

(declare-fun b!1378817 () Bool)

(declare-fun res!920751 () Bool)

(declare-fun e!781140 () Bool)

(assert (=> b!1378817 (=> (not res!920751) (not e!781140))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93685 0))(
  ( (array!93686 (arr!45241 (Array (_ BitVec 32) (_ BitVec 64))) (size!45792 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93685)

(assert (=> b!1378817 (= res!920751 (and (bvslt (size!45792 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45792 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun lt!606561 () array!93685)

(declare-fun b!1378818 () Bool)

(declare-fun e!781141 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93685 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378818 (= e!781141 (not (= (arrayCountValidKeys!0 lt!606561 (bvadd #b00000000000000000000000000000001 i!1445) (size!45792 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45792 a!4032)))))))

(declare-fun b!1378819 () Bool)

(declare-fun res!920749 () Bool)

(assert (=> b!1378819 (=> (not res!920749) (not e!781140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378819 (= res!920749 (validKeyInArray!0 (select (arr!45241 a!4032) i!1445)))))

(declare-fun res!920746 () Bool)

(assert (=> start!117130 (=> (not res!920746) (not e!781140))))

(assert (=> start!117130 (= res!920746 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45792 a!4032))))))

(assert (=> start!117130 e!781140))

(assert (=> start!117130 true))

(declare-fun array_inv!34522 (array!93685) Bool)

(assert (=> start!117130 (array_inv!34522 a!4032)))

(declare-fun b!1378820 () Bool)

(declare-fun res!920747 () Bool)

(assert (=> b!1378820 (=> (not res!920747) (not e!781141))))

(assert (=> b!1378820 (= res!920747 (= to!206 (size!45792 a!4032)))))

(declare-fun b!1378821 () Bool)

(assert (=> b!1378821 (= e!781140 e!781141)))

(declare-fun res!920748 () Bool)

(assert (=> b!1378821 (=> (not res!920748) (not e!781141))))

(assert (=> b!1378821 (= res!920748 (= (arrayCountValidKeys!0 lt!606561 (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1378821 (= lt!606561 (array!93686 (store (arr!45241 a!4032) i!1445 k0!2947) (size!45792 a!4032)))))

(declare-fun b!1378822 () Bool)

(declare-fun res!920750 () Bool)

(assert (=> b!1378822 (=> (not res!920750) (not e!781140))))

(assert (=> b!1378822 (= res!920750 (not (validKeyInArray!0 k0!2947)))))

(assert (= (and start!117130 res!920746) b!1378819))

(assert (= (and b!1378819 res!920749) b!1378822))

(assert (= (and b!1378822 res!920750) b!1378817))

(assert (= (and b!1378817 res!920751) b!1378821))

(assert (= (and b!1378821 res!920748) b!1378820))

(assert (= (and b!1378820 res!920747) b!1378818))

(declare-fun m!1263459 () Bool)

(assert (=> b!1378819 m!1263459))

(assert (=> b!1378819 m!1263459))

(declare-fun m!1263461 () Bool)

(assert (=> b!1378819 m!1263461))

(declare-fun m!1263463 () Bool)

(assert (=> b!1378821 m!1263463))

(declare-fun m!1263465 () Bool)

(assert (=> b!1378821 m!1263465))

(declare-fun m!1263467 () Bool)

(assert (=> b!1378821 m!1263467))

(declare-fun m!1263469 () Bool)

(assert (=> start!117130 m!1263469))

(declare-fun m!1263471 () Bool)

(assert (=> b!1378822 m!1263471))

(declare-fun m!1263473 () Bool)

(assert (=> b!1378818 m!1263473))

(declare-fun m!1263475 () Bool)

(assert (=> b!1378818 m!1263475))

(check-sat (not b!1378821) (not b!1378819) (not b!1378822) (not b!1378818) (not start!117130))
(check-sat)
