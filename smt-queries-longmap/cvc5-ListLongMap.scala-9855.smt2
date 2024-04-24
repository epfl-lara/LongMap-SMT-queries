; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117050 () Bool)

(assert start!117050)

(declare-fun b!1377952 () Bool)

(declare-fun res!920045 () Bool)

(declare-fun e!780672 () Bool)

(assert (=> b!1377952 (=> (not res!920045) (not e!780672))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377952 (= res!920045 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377953 () Bool)

(declare-fun res!920048 () Bool)

(assert (=> b!1377953 (=> (not res!920048) (not e!780672))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93605 0))(
  ( (array!93606 (arr!45201 (Array (_ BitVec 32) (_ BitVec 64))) (size!45752 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93605)

(assert (=> b!1377953 (= res!920048 (and (bvslt (size!45752 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45752 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377954 () Bool)

(declare-fun res!920043 () Bool)

(assert (=> b!1377954 (=> (not res!920043) (not e!780672))))

(assert (=> b!1377954 (= res!920043 (validKeyInArray!0 (select (arr!45201 a!4032) i!1445)))))

(declare-fun b!1377955 () Bool)

(declare-fun res!920049 () Bool)

(declare-fun e!780670 () Bool)

(assert (=> b!1377955 (=> (not res!920049) (not e!780670))))

(assert (=> b!1377955 (= res!920049 (validKeyInArray!0 (select (arr!45201 a!4032) to!206)))))

(declare-fun b!1377956 () Bool)

(declare-fun e!780671 () Bool)

(assert (=> b!1377956 (= e!780670 (not e!780671))))

(declare-fun res!920044 () Bool)

(assert (=> b!1377956 (=> (not res!920044) (not e!780671))))

(assert (=> b!1377956 (= res!920044 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvslt to!206 (size!45752 a!4032))))))

(declare-fun lt!605818 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93605 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377956 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (bvadd #b00000000000000000000000000000001 lt!605818))))

(declare-datatypes ((Unit!45558 0))(
  ( (Unit!45559) )
))
(declare-fun lt!605819 () Unit!45558)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93605 (_ BitVec 32) (_ BitVec 32)) Unit!45558)

(assert (=> b!1377956 (= lt!605819 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1377957 () Bool)

(assert (=> b!1377957 (= e!780671 (validKeyInArray!0 (select (store (arr!45201 a!4032) i!1445 k!2947) to!206)))))

(declare-fun res!920046 () Bool)

(assert (=> start!117050 (=> (not res!920046) (not e!780672))))

(assert (=> start!117050 (= res!920046 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45752 a!4032))))))

(assert (=> start!117050 e!780672))

(assert (=> start!117050 true))

(declare-fun array_inv!34482 (array!93605) Bool)

(assert (=> start!117050 (array_inv!34482 a!4032)))

(declare-fun b!1377958 () Bool)

(assert (=> b!1377958 (= e!780672 e!780670)))

(declare-fun res!920047 () Bool)

(assert (=> b!1377958 (=> (not res!920047) (not e!780670))))

(declare-fun lt!605820 () (_ BitVec 32))

(assert (=> b!1377958 (= res!920047 (and (= lt!605820 lt!605818) (not (= to!206 (size!45752 a!4032)))))))

(assert (=> b!1377958 (= lt!605818 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377958 (= lt!605820 (arrayCountValidKeys!0 (array!93606 (store (arr!45201 a!4032) i!1445 k!2947) (size!45752 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (= (and start!117050 res!920046) b!1377954))

(assert (= (and b!1377954 res!920043) b!1377952))

(assert (= (and b!1377952 res!920045) b!1377953))

(assert (= (and b!1377953 res!920048) b!1377958))

(assert (= (and b!1377958 res!920047) b!1377955))

(assert (= (and b!1377955 res!920049) b!1377956))

(assert (= (and b!1377956 res!920044) b!1377957))

(declare-fun m!1262347 () Bool)

(assert (=> b!1377952 m!1262347))

(declare-fun m!1262349 () Bool)

(assert (=> b!1377957 m!1262349))

(declare-fun m!1262351 () Bool)

(assert (=> b!1377957 m!1262351))

(assert (=> b!1377957 m!1262351))

(declare-fun m!1262353 () Bool)

(assert (=> b!1377957 m!1262353))

(declare-fun m!1262355 () Bool)

(assert (=> b!1377955 m!1262355))

(assert (=> b!1377955 m!1262355))

(declare-fun m!1262357 () Bool)

(assert (=> b!1377955 m!1262357))

(declare-fun m!1262359 () Bool)

(assert (=> b!1377958 m!1262359))

(assert (=> b!1377958 m!1262349))

(declare-fun m!1262361 () Bool)

(assert (=> b!1377958 m!1262361))

(declare-fun m!1262363 () Bool)

(assert (=> start!117050 m!1262363))

(declare-fun m!1262365 () Bool)

(assert (=> b!1377954 m!1262365))

(assert (=> b!1377954 m!1262365))

(declare-fun m!1262367 () Bool)

(assert (=> b!1377954 m!1262367))

(declare-fun m!1262369 () Bool)

(assert (=> b!1377956 m!1262369))

(declare-fun m!1262371 () Bool)

(assert (=> b!1377956 m!1262371))

(push 1)

(assert (not b!1377955))

(assert (not b!1377954))

(assert (not b!1377956))

(assert (not b!1377952))

(assert (not b!1377957))

(assert (not start!117050))

(assert (not b!1377958))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

