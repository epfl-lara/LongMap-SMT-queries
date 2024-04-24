; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117058 () Bool)

(assert start!117058)

(declare-fun res!920127 () Bool)

(declare-fun e!780699 () Bool)

(assert (=> start!117058 (=> (not res!920127) (not e!780699))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93613 0))(
  ( (array!93614 (arr!45205 (Array (_ BitVec 32) (_ BitVec 64))) (size!45756 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93613)

(assert (=> start!117058 (= res!920127 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45756 a!4032))))))

(assert (=> start!117058 e!780699))

(assert (=> start!117058 true))

(declare-fun array_inv!34486 (array!93613) Bool)

(assert (=> start!117058 (array_inv!34486 a!4032)))

(declare-fun b!1378034 () Bool)

(declare-fun res!920130 () Bool)

(assert (=> b!1378034 (=> (not res!920130) (not e!780699))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1378034 (= res!920130 (and (bvslt (size!45756 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45756 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1378035 () Bool)

(declare-fun e!780700 () Bool)

(assert (=> b!1378035 (= e!780699 e!780700)))

(declare-fun res!920125 () Bool)

(assert (=> b!1378035 (=> (not res!920125) (not e!780700))))

(declare-fun lt!605828 () (_ BitVec 32))

(declare-fun lt!605827 () (_ BitVec 32))

(assert (=> b!1378035 (= res!920125 (and (= lt!605828 lt!605827) (not (= to!206 (size!45756 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93613 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378035 (= lt!605827 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1378035 (= lt!605828 (arrayCountValidKeys!0 (array!93614 (store (arr!45205 a!4032) i!1445 k0!2947) (size!45756 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1378036 () Bool)

(declare-fun res!920129 () Bool)

(assert (=> b!1378036 (=> (not res!920129) (not e!780699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378036 (= res!920129 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1378037 () Bool)

(declare-fun res!920128 () Bool)

(assert (=> b!1378037 (=> (not res!920128) (not e!780699))))

(assert (=> b!1378037 (= res!920128 (validKeyInArray!0 (select (arr!45205 a!4032) i!1445)))))

(declare-fun b!1378038 () Bool)

(declare-fun res!920126 () Bool)

(assert (=> b!1378038 (=> (not res!920126) (not e!780700))))

(assert (=> b!1378038 (= res!920126 (not (validKeyInArray!0 (select (arr!45205 a!4032) to!206))))))

(declare-fun b!1378039 () Bool)

(assert (=> b!1378039 (= e!780700 (not true))))

(assert (=> b!1378039 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) lt!605827)))

(declare-datatypes ((Unit!45560 0))(
  ( (Unit!45561) )
))
(declare-fun lt!605829 () Unit!45560)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93613 (_ BitVec 32) (_ BitVec 32)) Unit!45560)

(assert (=> b!1378039 (= lt!605829 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (= (and start!117058 res!920127) b!1378037))

(assert (= (and b!1378037 res!920128) b!1378036))

(assert (= (and b!1378036 res!920129) b!1378034))

(assert (= (and b!1378034 res!920130) b!1378035))

(assert (= (and b!1378035 res!920125) b!1378038))

(assert (= (and b!1378038 res!920126) b!1378039))

(declare-fun m!1262427 () Bool)

(assert (=> start!117058 m!1262427))

(declare-fun m!1262429 () Bool)

(assert (=> b!1378035 m!1262429))

(declare-fun m!1262431 () Bool)

(assert (=> b!1378035 m!1262431))

(declare-fun m!1262433 () Bool)

(assert (=> b!1378035 m!1262433))

(declare-fun m!1262435 () Bool)

(assert (=> b!1378036 m!1262435))

(declare-fun m!1262437 () Bool)

(assert (=> b!1378037 m!1262437))

(assert (=> b!1378037 m!1262437))

(declare-fun m!1262439 () Bool)

(assert (=> b!1378037 m!1262439))

(declare-fun m!1262441 () Bool)

(assert (=> b!1378039 m!1262441))

(declare-fun m!1262443 () Bool)

(assert (=> b!1378039 m!1262443))

(declare-fun m!1262445 () Bool)

(assert (=> b!1378038 m!1262445))

(assert (=> b!1378038 m!1262445))

(declare-fun m!1262447 () Bool)

(assert (=> b!1378038 m!1262447))

(check-sat (not b!1378036) (not b!1378035) (not b!1378037) (not b!1378039) (not b!1378038) (not start!117058))
(check-sat)
