; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71790 () Bool)

(assert start!71790)

(declare-fun b!834373 () Bool)

(declare-fun res!567383 () Bool)

(declare-fun e!465516 () Bool)

(assert (=> b!834373 (=> (not res!567383) (not e!465516))))

(declare-datatypes ((array!46700 0))(
  ( (array!46701 (arr!22384 (Array (_ BitVec 32) (_ BitVec 64))) (size!22805 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46700)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834373 (= res!567383 (and (bvslt (size!22805 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22805 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun call!36535 () (_ BitVec 32))

(declare-fun bm!36532 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46700 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36532 (= call!36535 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834374 () Bool)

(declare-fun e!465515 () Bool)

(assert (=> b!834374 (= e!465516 e!465515)))

(declare-fun res!567378 () Bool)

(assert (=> b!834374 (=> (not res!567378) (not e!465515))))

(declare-fun lt!378998 () (_ BitVec 32))

(declare-fun lt!379000 () (_ BitVec 32))

(assert (=> b!834374 (= res!567378 (and (= lt!379000 lt!378998) (not (= to!390 (size!22805 a!4227)))))))

(assert (=> b!834374 (= lt!378998 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!378991 () array!46700)

(assert (=> b!834374 (= lt!379000 (arrayCountValidKeys!0 lt!378991 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!834374 (= lt!378991 (array!46701 (store (arr!22384 a!4227) i!1466 k0!2968) (size!22805 a!4227)))))

(declare-fun b!834375 () Bool)

(declare-datatypes ((Unit!28661 0))(
  ( (Unit!28662) )
))
(declare-fun e!465512 () Unit!28661)

(declare-fun lt!378993 () Unit!28661)

(assert (=> b!834375 (= e!465512 lt!378993)))

(declare-fun lt!378994 () Unit!28661)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46700 (_ BitVec 32) (_ BitVec 32)) Unit!28661)

(assert (=> b!834375 (= lt!378994 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834375 (= call!36535 (bvadd #b00000000000000000000000000000001 lt!378998))))

(assert (=> b!834375 (= lt!378993 (lemmaValidKeyIncreasesNumOfKeys!0 lt!378991 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36536 () (_ BitVec 32))

(assert (=> b!834375 (= call!36536 (bvadd #b00000000000000000000000000000001 lt!379000))))

(declare-fun b!834376 () Bool)

(declare-fun e!465513 () Bool)

(assert (=> b!834376 (= e!465515 e!465513)))

(declare-fun res!567379 () Bool)

(assert (=> b!834376 (=> (not res!567379) (not e!465513))))

(assert (=> b!834376 (= res!567379 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22805 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!378999 () Unit!28661)

(assert (=> b!834376 (= lt!378999 e!465512)))

(declare-fun c!90893 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834376 (= c!90893 (validKeyInArray!0 (select (arr!22384 a!4227) to!390)))))

(declare-fun b!834377 () Bool)

(declare-fun res!567380 () Bool)

(assert (=> b!834377 (=> (not res!567380) (not e!465516))))

(assert (=> b!834377 (= res!567380 (validKeyInArray!0 k0!2968))))

(declare-fun b!834378 () Bool)

(declare-fun res!567382 () Bool)

(assert (=> b!834378 (=> (not res!567382) (not e!465516))))

(assert (=> b!834378 (= res!567382 (not (validKeyInArray!0 (select (arr!22384 a!4227) i!1466))))))

(declare-fun res!567381 () Bool)

(assert (=> start!71790 (=> (not res!567381) (not e!465516))))

(assert (=> start!71790 (= res!567381 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22805 a!4227))))))

(assert (=> start!71790 e!465516))

(assert (=> start!71790 true))

(declare-fun array_inv!17831 (array!46700) Bool)

(assert (=> start!71790 (array_inv!17831 a!4227)))

(declare-fun bm!36533 () Bool)

(assert (=> bm!36533 (= call!36536 (arrayCountValidKeys!0 lt!378991 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834379 () Bool)

(assert (=> b!834379 (= e!465513 false)))

(declare-fun lt!378996 () (_ BitVec 32))

(assert (=> b!834379 (= lt!378996 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!378997 () (_ BitVec 32))

(assert (=> b!834379 (= lt!378997 (arrayCountValidKeys!0 lt!378991 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834380 () Bool)

(declare-fun lt!378992 () Unit!28661)

(assert (=> b!834380 (= e!465512 lt!378992)))

(declare-fun lt!378995 () Unit!28661)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46700 (_ BitVec 32) (_ BitVec 32)) Unit!28661)

(assert (=> b!834380 (= lt!378995 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834380 (= call!36535 lt!378998)))

(assert (=> b!834380 (= lt!378992 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!378991 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834380 (= call!36536 lt!379000)))

(assert (= (and start!71790 res!567381) b!834378))

(assert (= (and b!834378 res!567382) b!834377))

(assert (= (and b!834377 res!567380) b!834373))

(assert (= (and b!834373 res!567383) b!834374))

(assert (= (and b!834374 res!567378) b!834376))

(assert (= (and b!834376 c!90893) b!834375))

(assert (= (and b!834376 (not c!90893)) b!834380))

(assert (= (or b!834375 b!834380) bm!36533))

(assert (= (or b!834375 b!834380) bm!36532))

(assert (= (and b!834376 res!567379) b!834379))

(declare-fun m!779347 () Bool)

(assert (=> bm!36533 m!779347))

(declare-fun m!779349 () Bool)

(assert (=> bm!36532 m!779349))

(declare-fun m!779351 () Bool)

(assert (=> b!834375 m!779351))

(declare-fun m!779353 () Bool)

(assert (=> b!834375 m!779353))

(declare-fun m!779355 () Bool)

(assert (=> b!834377 m!779355))

(declare-fun m!779357 () Bool)

(assert (=> b!834378 m!779357))

(assert (=> b!834378 m!779357))

(declare-fun m!779359 () Bool)

(assert (=> b!834378 m!779359))

(declare-fun m!779361 () Bool)

(assert (=> b!834374 m!779361))

(declare-fun m!779363 () Bool)

(assert (=> b!834374 m!779363))

(declare-fun m!779365 () Bool)

(assert (=> b!834374 m!779365))

(declare-fun m!779367 () Bool)

(assert (=> start!71790 m!779367))

(declare-fun m!779369 () Bool)

(assert (=> b!834376 m!779369))

(assert (=> b!834376 m!779369))

(declare-fun m!779371 () Bool)

(assert (=> b!834376 m!779371))

(declare-fun m!779373 () Bool)

(assert (=> b!834380 m!779373))

(declare-fun m!779375 () Bool)

(assert (=> b!834380 m!779375))

(assert (=> b!834379 m!779349))

(assert (=> b!834379 m!779347))

(check-sat (not b!834378) (not b!834377) (not bm!36533) (not start!71790) (not b!834379) (not b!834374) (not b!834376) (not bm!36532) (not b!834375) (not b!834380))
(check-sat)
