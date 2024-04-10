; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116690 () Bool)

(assert start!116690)

(declare-fun b!1375325 () Bool)

(declare-fun e!779118 () Bool)

(declare-fun e!779117 () Bool)

(assert (=> b!1375325 (= e!779118 e!779117)))

(declare-fun res!918390 () Bool)

(assert (=> b!1375325 (=> (not res!918390) (not e!779117))))

(declare-fun lt!604319 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!604321 () (_ BitVec 32))

(declare-datatypes ((array!93359 0))(
  ( (array!93360 (arr!45083 (Array (_ BitVec 32) (_ BitVec 64))) (size!45633 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93359)

(assert (=> b!1375325 (= res!918390 (and (= lt!604319 lt!604321) (not (= to!206 (size!45633 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93359 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375325 (= lt!604321 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375325 (= lt!604319 (arrayCountValidKeys!0 (array!93360 (store (arr!45083 a!4032) i!1445 k!2947) (size!45633 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375326 () Bool)

(declare-fun res!918393 () Bool)

(assert (=> b!1375326 (=> (not res!918393) (not e!779118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375326 (= res!918393 (validKeyInArray!0 (select (arr!45083 a!4032) i!1445)))))

(declare-fun b!1375327 () Bool)

(declare-fun res!918391 () Bool)

(assert (=> b!1375327 (=> (not res!918391) (not e!779117))))

(assert (=> b!1375327 (= res!918391 (validKeyInArray!0 (select (arr!45083 a!4032) to!206)))))

(declare-fun res!918389 () Bool)

(assert (=> start!116690 (=> (not res!918389) (not e!779118))))

(assert (=> start!116690 (= res!918389 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45633 a!4032))))))

(assert (=> start!116690 e!779118))

(assert (=> start!116690 true))

(declare-fun array_inv!34111 (array!93359) Bool)

(assert (=> start!116690 (array_inv!34111 a!4032)))

(declare-fun b!1375328 () Bool)

(assert (=> b!1375328 (= e!779117 (not true))))

(assert (=> b!1375328 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (bvadd #b00000000000000000000000000000001 lt!604321))))

(declare-datatypes ((Unit!45537 0))(
  ( (Unit!45538) )
))
(declare-fun lt!604320 () Unit!45537)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93359 (_ BitVec 32) (_ BitVec 32)) Unit!45537)

(assert (=> b!1375328 (= lt!604320 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375329 () Bool)

(declare-fun res!918392 () Bool)

(assert (=> b!1375329 (=> (not res!918392) (not e!779118))))

(assert (=> b!1375329 (= res!918392 (and (bvslt (size!45633 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45633 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375330 () Bool)

(declare-fun res!918394 () Bool)

(assert (=> b!1375330 (=> (not res!918394) (not e!779118))))

(assert (=> b!1375330 (= res!918394 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116690 res!918389) b!1375326))

(assert (= (and b!1375326 res!918393) b!1375330))

(assert (= (and b!1375330 res!918394) b!1375329))

(assert (= (and b!1375329 res!918392) b!1375325))

(assert (= (and b!1375325 res!918390) b!1375327))

(assert (= (and b!1375327 res!918391) b!1375328))

(declare-fun m!1259137 () Bool)

(assert (=> start!116690 m!1259137))

(declare-fun m!1259139 () Bool)

(assert (=> b!1375328 m!1259139))

(declare-fun m!1259141 () Bool)

(assert (=> b!1375328 m!1259141))

(declare-fun m!1259143 () Bool)

(assert (=> b!1375327 m!1259143))

(assert (=> b!1375327 m!1259143))

(declare-fun m!1259145 () Bool)

(assert (=> b!1375327 m!1259145))

(declare-fun m!1259147 () Bool)

(assert (=> b!1375326 m!1259147))

(assert (=> b!1375326 m!1259147))

(declare-fun m!1259149 () Bool)

(assert (=> b!1375326 m!1259149))

(declare-fun m!1259151 () Bool)

(assert (=> b!1375325 m!1259151))

(declare-fun m!1259153 () Bool)

(assert (=> b!1375325 m!1259153))

(declare-fun m!1259155 () Bool)

(assert (=> b!1375325 m!1259155))

(declare-fun m!1259157 () Bool)

(assert (=> b!1375330 m!1259157))

(push 1)

(assert (not b!1375326))

(assert (not b!1375330))

(assert (not 