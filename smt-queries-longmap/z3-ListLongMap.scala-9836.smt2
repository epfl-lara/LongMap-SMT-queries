; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116932 () Bool)

(assert start!116932)

(declare-fun b!1376729 () Bool)

(declare-fun res!919003 () Bool)

(declare-fun e!780016 () Bool)

(assert (=> b!1376729 (=> (not res!919003) (not e!780016))))

(declare-datatypes ((array!93487 0))(
  ( (array!93488 (arr!45142 (Array (_ BitVec 32) (_ BitVec 64))) (size!45693 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93487)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376729 (= res!919003 (not (validKeyInArray!0 (select (arr!45142 a!4032) to!206))))))

(declare-fun b!1376730 () Bool)

(declare-fun res!919002 () Bool)

(declare-fun e!780014 () Bool)

(assert (=> b!1376730 (=> (not res!919002) (not e!780014))))

(declare-fun i!1445 () (_ BitVec 32))

(assert (=> b!1376730 (= res!919002 (and (bvslt (size!45693 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45693 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376731 () Bool)

(declare-fun res!919001 () Bool)

(assert (=> b!1376731 (=> (not res!919001) (not e!780014))))

(assert (=> b!1376731 (= res!919001 (validKeyInArray!0 (select (arr!45142 a!4032) i!1445)))))

(declare-fun b!1376732 () Bool)

(assert (=> b!1376732 (= e!780014 e!780016)))

(declare-fun res!919005 () Bool)

(assert (=> b!1376732 (=> (not res!919005) (not e!780016))))

(declare-fun lt!604847 () (_ BitVec 32))

(declare-fun lt!604848 () (_ BitVec 32))

(assert (=> b!1376732 (= res!919005 (and (= lt!604848 lt!604847) (not (= to!206 (size!45693 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93487 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376732 (= lt!604847 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376732 (= lt!604848 (arrayCountValidKeys!0 (array!93488 (store (arr!45142 a!4032) i!1445 k0!2947) (size!45693 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376733 () Bool)

(assert (=> b!1376733 (= e!780016 (not true))))

(assert (=> b!1376733 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) lt!604847)))

(declare-datatypes ((Unit!45482 0))(
  ( (Unit!45483) )
))
(declare-fun lt!604846 () Unit!45482)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93487 (_ BitVec 32) (_ BitVec 32)) Unit!45482)

(assert (=> b!1376733 (= lt!604846 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376734 () Bool)

(declare-fun res!919004 () Bool)

(assert (=> b!1376734 (=> (not res!919004) (not e!780014))))

(assert (=> b!1376734 (= res!919004 (not (validKeyInArray!0 k0!2947)))))

(declare-fun res!919000 () Bool)

(assert (=> start!116932 (=> (not res!919000) (not e!780014))))

(assert (=> start!116932 (= res!919000 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45693 a!4032))))))

(assert (=> start!116932 e!780014))

(assert (=> start!116932 true))

(declare-fun array_inv!34423 (array!93487) Bool)

(assert (=> start!116932 (array_inv!34423 a!4032)))

(assert (= (and start!116932 res!919000) b!1376731))

(assert (= (and b!1376731 res!919001) b!1376734))

(assert (= (and b!1376734 res!919004) b!1376730))

(assert (= (and b!1376730 res!919002) b!1376732))

(assert (= (and b!1376732 res!919005) b!1376729))

(assert (= (and b!1376729 res!919003) b!1376733))

(declare-fun m!1260869 () Bool)

(assert (=> b!1376731 m!1260869))

(assert (=> b!1376731 m!1260869))

(declare-fun m!1260871 () Bool)

(assert (=> b!1376731 m!1260871))

(declare-fun m!1260873 () Bool)

(assert (=> b!1376733 m!1260873))

(declare-fun m!1260875 () Bool)

(assert (=> b!1376733 m!1260875))

(declare-fun m!1260877 () Bool)

(assert (=> start!116932 m!1260877))

(declare-fun m!1260879 () Bool)

(assert (=> b!1376734 m!1260879))

(declare-fun m!1260881 () Bool)

(assert (=> b!1376729 m!1260881))

(assert (=> b!1376729 m!1260881))

(declare-fun m!1260883 () Bool)

(assert (=> b!1376729 m!1260883))

(declare-fun m!1260885 () Bool)

(assert (=> b!1376732 m!1260885))

(declare-fun m!1260887 () Bool)

(assert (=> b!1376732 m!1260887))

(declare-fun m!1260889 () Bool)

(assert (=> b!1376732 m!1260889))

(check-sat (not b!1376729) (not b!1376734) (not start!116932) (not b!1376732) (not b!1376731) (not b!1376733))
(check-sat)
