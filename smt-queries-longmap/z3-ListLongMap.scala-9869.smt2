; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116902 () Bool)

(assert start!116902)

(declare-fun b!1377521 () Bool)

(declare-fun res!920245 () Bool)

(declare-fun e!780298 () Bool)

(assert (=> b!1377521 (=> (not res!920245) (not e!780298))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93571 0))(
  ( (array!93572 (arr!45189 (Array (_ BitVec 32) (_ BitVec 64))) (size!45739 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93571)

(assert (=> b!1377521 (= res!920245 (and (bvslt (size!45739 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45739 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377522 () Bool)

(declare-fun res!920246 () Bool)

(assert (=> b!1377522 (=> (not res!920246) (not e!780298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377522 (= res!920246 (validKeyInArray!0 (select (arr!45189 a!4032) i!1445)))))

(declare-fun b!1377523 () Bool)

(declare-fun res!920244 () Bool)

(assert (=> b!1377523 (=> (not res!920244) (not e!780298))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1377523 (= res!920244 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1377524 () Bool)

(declare-fun e!780296 () Bool)

(declare-fun lt!606082 () array!93571)

(declare-fun arrayCountValidKeys!0 (array!93571 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377524 (= e!780296 (not (= (arrayCountValidKeys!0 lt!606082 (bvadd #b00000000000000000000000000000001 i!1445) (size!45739 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45739 a!4032)))))))

(declare-fun b!1377525 () Bool)

(declare-fun res!920247 () Bool)

(assert (=> b!1377525 (=> (not res!920247) (not e!780296))))

(assert (=> b!1377525 (= res!920247 (= to!206 (size!45739 a!4032)))))

(declare-fun res!920243 () Bool)

(assert (=> start!116902 (=> (not res!920243) (not e!780298))))

(assert (=> start!116902 (= res!920243 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45739 a!4032))))))

(assert (=> start!116902 e!780298))

(assert (=> start!116902 true))

(declare-fun array_inv!34217 (array!93571) Bool)

(assert (=> start!116902 (array_inv!34217 a!4032)))

(declare-fun b!1377526 () Bool)

(assert (=> b!1377526 (= e!780298 e!780296)))

(declare-fun res!920248 () Bool)

(assert (=> b!1377526 (=> (not res!920248) (not e!780296))))

(assert (=> b!1377526 (= res!920248 (= (arrayCountValidKeys!0 lt!606082 (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(assert (=> b!1377526 (= lt!606082 (array!93572 (store (arr!45189 a!4032) i!1445 k0!2947) (size!45739 a!4032)))))

(assert (= (and start!116902 res!920243) b!1377522))

(assert (= (and b!1377522 res!920246) b!1377523))

(assert (= (and b!1377523 res!920244) b!1377521))

(assert (= (and b!1377521 res!920245) b!1377526))

(assert (= (and b!1377526 res!920248) b!1377525))

(assert (= (and b!1377525 res!920247) b!1377524))

(declare-fun m!1261841 () Bool)

(assert (=> b!1377526 m!1261841))

(declare-fun m!1261843 () Bool)

(assert (=> b!1377526 m!1261843))

(declare-fun m!1261845 () Bool)

(assert (=> b!1377526 m!1261845))

(declare-fun m!1261847 () Bool)

(assert (=> b!1377523 m!1261847))

(declare-fun m!1261849 () Bool)

(assert (=> start!116902 m!1261849))

(declare-fun m!1261851 () Bool)

(assert (=> b!1377524 m!1261851))

(declare-fun m!1261853 () Bool)

(assert (=> b!1377524 m!1261853))

(declare-fun m!1261855 () Bool)

(assert (=> b!1377522 m!1261855))

(assert (=> b!1377522 m!1261855))

(declare-fun m!1261857 () Bool)

(assert (=> b!1377522 m!1261857))

(check-sat (not b!1377526) (not start!116902) (not b!1377523) (not b!1377524) (not b!1377522))
