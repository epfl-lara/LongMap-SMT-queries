; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116702 () Bool)

(assert start!116702)

(declare-fun b!1375415 () Bool)

(declare-fun e!779163 () Bool)

(assert (=> b!1375415 (= e!779163 (not true))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!604364 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93371 0))(
  ( (array!93372 (arr!45089 (Array (_ BitVec 32) (_ BitVec 64))) (size!45639 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93371)

(declare-fun arrayCountValidKeys!0 (array!93371 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375415 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) lt!604364)))

(declare-datatypes ((Unit!45543 0))(
  ( (Unit!45544) )
))
(declare-fun lt!604365 () Unit!45543)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93371 (_ BitVec 32) (_ BitVec 32)) Unit!45543)

(assert (=> b!1375415 (= lt!604365 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375416 () Bool)

(declare-fun e!779164 () Bool)

(assert (=> b!1375416 (= e!779164 e!779163)))

(declare-fun res!918482 () Bool)

(assert (=> b!1375416 (=> (not res!918482) (not e!779163))))

(declare-fun lt!604366 () (_ BitVec 32))

(assert (=> b!1375416 (= res!918482 (and (= lt!604366 lt!604364) (not (= to!206 (size!45639 a!4032)))))))

(assert (=> b!1375416 (= lt!604364 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375416 (= lt!604366 (arrayCountValidKeys!0 (array!93372 (store (arr!45089 a!4032) i!1445 k!2947) (size!45639 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375417 () Bool)

(declare-fun res!918483 () Bool)

(assert (=> b!1375417 (=> (not res!918483) (not e!779164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375417 (= res!918483 (validKeyInArray!0 (select (arr!45089 a!4032) i!1445)))))

(declare-fun b!1375418 () Bool)

(declare-fun res!918479 () Bool)

(assert (=> b!1375418 (=> (not res!918479) (not e!779164))))

(assert (=> b!1375418 (= res!918479 (and (bvslt (size!45639 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45639 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375420 () Bool)

(declare-fun res!918481 () Bool)

(assert (=> b!1375420 (=> (not res!918481) (not e!779164))))

(assert (=> b!1375420 (= res!918481 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1375419 () Bool)

(declare-fun res!918480 () Bool)

(assert (=> b!1375419 (=> (not res!918480) (not e!779163))))

(assert (=> b!1375419 (= res!918480 (not (validKeyInArray!0 (select (arr!45089 a!4032) to!206))))))

(declare-fun res!918484 () Bool)

(assert (=> start!116702 (=> (not res!918484) (not e!779164))))

(assert (=> start!116702 (= res!918484 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45639 a!4032))))))

(assert (=> start!116702 e!779164))

(assert (=> start!116702 true))

(declare-fun array_inv!34117 (array!93371) Bool)

(assert (=> start!116702 (array_inv!34117 a!4032)))

(assert (= (and start!116702 res!918484) b!1375417))

(assert (= (and b!1375417 res!918483) b!1375420))

(assert (= (and b!1375420 res!918481) b!1375418))

(assert (= (and b!1375418 res!918479) b!1375416))

(assert (= (and b!1375416 res!918482) b!1375419))

(assert (= (and b!1375419 res!918480) b!1375415))

(declare-fun m!1259245 () Bool)

(assert (=> b!1375417 m!1259245))

(assert (=> b!1375417 m!1259245))

(declare-fun m!1259247 () Bool)

(assert (=> b!1375417 m!1259247))

(declare-fun m!1259249 () Bool)

(assert (=> b!1375420 m!1259249))

(declare-fun m!1259251 () Bool)

(assert (=> b!1375419 m!1259251))

(assert (=> b!1375419 m!1259251))

(declare-fun m!1259253 () Bool)

(assert (=> b!1375419 m!1259253))

(declare-fun m!1259255 () Bool)

(assert (=> b!1375415 m!1259255))

(declare-fun m!1259257 () Bool)

(assert (=> b!1375415 m!1259257))

(declare-fun m!1259259 () Bool)

(assert (=> start!116702 m!1259259))

(declare-fun m!1259261 () Bool)

(assert (=> b!1375416 m!1259261))

(declare-fun m!1259263 () Bool)

(assert (=> b!1375416 m!1259263))

(declare-fun m!1259265 () Bool)

(assert (=> b!1375416 m!1259265))

(push 1)

(assert (not start!116702))

