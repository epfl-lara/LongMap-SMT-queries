; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71800 () Bool)

(assert start!71800)

(declare-datatypes ((array!46710 0))(
  ( (array!46711 (arr!22389 (Array (_ BitVec 32) (_ BitVec 64))) (size!22810 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46710)

(declare-fun bm!36562 () Bool)

(declare-fun call!36565 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46710 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36562 (= call!36565 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834493 () Bool)

(declare-datatypes ((Unit!28671 0))(
  ( (Unit!28672) )
))
(declare-fun e!465591 () Unit!28671)

(declare-fun lt!379143 () Unit!28671)

(assert (=> b!834493 (= e!465591 lt!379143)))

(declare-fun lt!379149 () Unit!28671)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46710 (_ BitVec 32) (_ BitVec 32)) Unit!28671)

(assert (=> b!834493 (= lt!379149 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379142 () (_ BitVec 32))

(assert (=> b!834493 (= call!36565 (bvadd #b00000000000000000000000000000001 lt!379142))))

(declare-fun lt!379146 () array!46710)

(assert (=> b!834493 (= lt!379143 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379146 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36566 () (_ BitVec 32))

(declare-fun lt!379147 () (_ BitVec 32))

(assert (=> b!834493 (= call!36566 (bvadd #b00000000000000000000000000000001 lt!379147))))

(declare-fun b!834494 () Bool)

(declare-fun e!465588 () Bool)

(declare-fun e!465587 () Bool)

(assert (=> b!834494 (= e!465588 e!465587)))

(declare-fun res!567470 () Bool)

(assert (=> b!834494 (=> (not res!567470) (not e!465587))))

(assert (=> b!834494 (= res!567470 (and (= lt!379147 lt!379142) (not (= to!390 (size!22810 a!4227)))))))

(assert (=> b!834494 (= lt!379142 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834494 (= lt!379147 (arrayCountValidKeys!0 lt!379146 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834494 (= lt!379146 (array!46711 (store (arr!22389 a!4227) i!1466 k!2968) (size!22810 a!4227)))))

(declare-fun b!834495 () Bool)

(declare-fun e!465589 () Bool)

(assert (=> b!834495 (= e!465587 e!465589)))

(declare-fun res!567471 () Bool)

(assert (=> b!834495 (=> (not res!567471) (not e!465589))))

(assert (=> b!834495 (= res!567471 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22810 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379144 () Unit!28671)

(assert (=> b!834495 (= lt!379144 e!465591)))

(declare-fun c!90908 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834495 (= c!90908 (validKeyInArray!0 (select (arr!22389 a!4227) to!390)))))

(declare-fun b!834496 () Bool)

(assert (=> b!834496 (= e!465589 false)))

(declare-fun lt!379148 () (_ BitVec 32))

(assert (=> b!834496 (= lt!379148 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!379150 () (_ BitVec 32))

(assert (=> b!834496 (= lt!379150 (arrayCountValidKeys!0 lt!379146 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun bm!36563 () Bool)

(assert (=> bm!36563 (= call!36566 (arrayCountValidKeys!0 lt!379146 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834497 () Bool)

(declare-fun res!567469 () Bool)

(assert (=> b!834497 (=> (not res!567469) (not e!465588))))

(assert (=> b!834497 (= res!567469 (validKeyInArray!0 k!2968))))

(declare-fun b!834498 () Bool)

(declare-fun res!567473 () Bool)

(assert (=> b!834498 (=> (not res!567473) (not e!465588))))

(assert (=> b!834498 (= res!567473 (not (validKeyInArray!0 (select (arr!22389 a!4227) i!1466))))))

(declare-fun res!567472 () Bool)

(assert (=> start!71800 (=> (not res!567472) (not e!465588))))

(assert (=> start!71800 (= res!567472 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22810 a!4227))))))

(assert (=> start!71800 e!465588))

(assert (=> start!71800 true))

(declare-fun array_inv!17836 (array!46710) Bool)

(assert (=> start!71800 (array_inv!17836 a!4227)))

(declare-fun b!834499 () Bool)

(declare-fun res!567468 () Bool)

(assert (=> b!834499 (=> (not res!567468) (not e!465588))))

(assert (=> b!834499 (= res!567468 (and (bvslt (size!22810 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22810 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834500 () Bool)

(declare-fun lt!379141 () Unit!28671)

(assert (=> b!834500 (= e!465591 lt!379141)))

(declare-fun lt!379145 () Unit!28671)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46710 (_ BitVec 32) (_ BitVec 32)) Unit!28671)

(assert (=> b!834500 (= lt!379145 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834500 (= call!36565 lt!379142)))

(assert (=> b!834500 (= lt!379141 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379146 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834500 (= call!36566 lt!379147)))

(assert (= (and start!71800 res!567472) b!834498))

(assert (= (and b!834498 res!567473) b!834497))

(assert (= (and b!834497 res!567469) b!834499))

(assert (= (and b!834499 res!567468) b!834494))

(assert (= (and b!834494 res!567470) b!834495))

(assert (= (and b!834495 c!90908) b!834493))

(assert (= (and b!834495 (not c!90908)) b!834500))

(assert (= (or b!834493 b!834500) bm!36563))

(assert (= (or b!834493 b!834500) bm!36562))

(assert (= (and b!834495 res!567471) b!834496))

(declare-fun m!779497 () Bool)

(assert (=> b!834497 m!779497))

(declare-fun m!779499 () Bool)

(assert (=> bm!36562 m!779499))

(assert (=> b!834496 m!779499))

(declare-fun m!779501 () Bool)

(assert (=> b!834496 m!779501))

(declare-fun m!779503 () Bool)

(assert (=> b!834495 m!779503))

(assert (=> b!834495 m!779503))

(declare-fun m!779505 () Bool)

(assert (=> b!834495 m!779505))

(declare-fun m!779507 () Bool)

(assert (=> start!71800 m!779507))

(declare-fun m!779509 () Bool)

(assert (=> b!834500 m!779509))

(declare-fun m!779511 () Bool)

(assert (=> b!834500 m!779511))

(declare-fun m!779513 () Bool)

(assert (=> b!834498 m!779513))

(assert (=> b!834498 m!779513))

(declare-fun m!779515 () Bool)

(assert (=> b!834498 m!779515))

(declare-fun m!779517 () Bool)

(assert (=> b!834493 m!779517))

(declare-fun m!779519 () Bool)

(assert (=> b!834493 m!779519))

(assert (=> bm!36563 m!779501))

(declare-fun m!779521 () Bool)

(assert (=> b!834494 m!779521))

(declare-fun m!779523 () Bool)

(assert (=> b!834494 m!779523))

(declare-fun m!779525 () Bool)

(assert (=> b!834494 m!779525))

(push 1)

