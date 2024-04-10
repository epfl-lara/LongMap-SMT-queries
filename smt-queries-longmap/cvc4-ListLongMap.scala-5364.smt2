; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71786 () Bool)

(assert start!71786)

(declare-fun b!834325 () Bool)

(declare-datatypes ((Unit!28657 0))(
  ( (Unit!28658) )
))
(declare-fun e!465482 () Unit!28657)

(declare-fun lt!378937 () Unit!28657)

(assert (=> b!834325 (= e!465482 lt!378937)))

(declare-datatypes ((array!46696 0))(
  ( (array!46697 (arr!22382 (Array (_ BitVec 32) (_ BitVec 64))) (size!22803 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46696)

(declare-fun lt!378938 () Unit!28657)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46696 (_ BitVec 32) (_ BitVec 32)) Unit!28657)

(assert (=> b!834325 (= lt!378938 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36523 () (_ BitVec 32))

(declare-fun lt!378931 () (_ BitVec 32))

(assert (=> b!834325 (= call!36523 (bvadd #b00000000000000000000000000000001 lt!378931))))

(declare-fun lt!378935 () array!46696)

(assert (=> b!834325 (= lt!378937 (lemmaValidKeyIncreasesNumOfKeys!0 lt!378935 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36524 () (_ BitVec 32))

(declare-fun lt!378934 () (_ BitVec 32))

(assert (=> b!834325 (= call!36524 (bvadd #b00000000000000000000000000000001 lt!378934))))

(declare-fun b!834326 () Bool)

(declare-fun res!567344 () Bool)

(declare-fun e!465483 () Bool)

(assert (=> b!834326 (=> (not res!567344) (not e!465483))))

(assert (=> b!834326 (= res!567344 (and (bvslt (size!22803 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22803 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834327 () Bool)

(declare-fun res!567347 () Bool)

(assert (=> b!834327 (=> (not res!567347) (not e!465483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834327 (= res!567347 (not (validKeyInArray!0 (select (arr!22382 a!4227) i!1466))))))

(declare-fun bm!36520 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46696 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36520 (= call!36524 (arrayCountValidKeys!0 lt!378935 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834328 () Bool)

(declare-fun lt!378940 () Unit!28657)

(assert (=> b!834328 (= e!465482 lt!378940)))

(declare-fun lt!378936 () Unit!28657)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46696 (_ BitVec 32) (_ BitVec 32)) Unit!28657)

(assert (=> b!834328 (= lt!378936 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834328 (= call!36523 lt!378931)))

(assert (=> b!834328 (= lt!378940 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!378935 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834328 (= call!36524 lt!378934)))

(declare-fun b!834329 () Bool)

(declare-fun e!465486 () Bool)

(assert (=> b!834329 (= e!465483 e!465486)))

(declare-fun res!567346 () Bool)

(assert (=> b!834329 (=> (not res!567346) (not e!465486))))

(assert (=> b!834329 (= res!567346 (and (= lt!378934 lt!378931) (not (= to!390 (size!22803 a!4227)))))))

(assert (=> b!834329 (= lt!378931 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834329 (= lt!378934 (arrayCountValidKeys!0 lt!378935 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834329 (= lt!378935 (array!46697 (store (arr!22382 a!4227) i!1466 k!2968) (size!22803 a!4227)))))

(declare-fun res!567342 () Bool)

(assert (=> start!71786 (=> (not res!567342) (not e!465483))))

(assert (=> start!71786 (= res!567342 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22803 a!4227))))))

(assert (=> start!71786 e!465483))

(assert (=> start!71786 true))

(declare-fun array_inv!17829 (array!46696) Bool)

(assert (=> start!71786 (array_inv!17829 a!4227)))

(declare-fun b!834330 () Bool)

(declare-fun res!567345 () Bool)

(assert (=> b!834330 (=> (not res!567345) (not e!465483))))

(assert (=> b!834330 (= res!567345 (validKeyInArray!0 k!2968))))

(declare-fun bm!36521 () Bool)

(assert (=> bm!36521 (= call!36523 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834331 () Bool)

(declare-fun e!465485 () Bool)

(assert (=> b!834331 (= e!465485 false)))

(declare-fun lt!378933 () (_ BitVec 32))

(assert (=> b!834331 (= lt!378933 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!378932 () (_ BitVec 32))

(assert (=> b!834331 (= lt!378932 (arrayCountValidKeys!0 lt!378935 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834332 () Bool)

(assert (=> b!834332 (= e!465486 e!465485)))

(declare-fun res!567343 () Bool)

(assert (=> b!834332 (=> (not res!567343) (not e!465485))))

(assert (=> b!834332 (= res!567343 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22803 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!378939 () Unit!28657)

(assert (=> b!834332 (= lt!378939 e!465482)))

(declare-fun c!90887 () Bool)

(assert (=> b!834332 (= c!90887 (validKeyInArray!0 (select (arr!22382 a!4227) to!390)))))

(assert (= (and start!71786 res!567342) b!834327))

(assert (= (and b!834327 res!567347) b!834330))

(assert (= (and b!834330 res!567345) b!834326))

(assert (= (and b!834326 res!567344) b!834329))

(assert (= (and b!834329 res!567346) b!834332))

(assert (= (and b!834332 c!90887) b!834325))

(assert (= (and b!834332 (not c!90887)) b!834328))

(assert (= (or b!834325 b!834328) bm!36520))

(assert (= (or b!834325 b!834328) bm!36521))

(assert (= (and b!834332 res!567343) b!834331))

(declare-fun m!779287 () Bool)

(assert (=> start!71786 m!779287))

(declare-fun m!779289 () Bool)

(assert (=> b!834332 m!779289))

(assert (=> b!834332 m!779289))

(declare-fun m!779291 () Bool)

(assert (=> b!834332 m!779291))

(declare-fun m!779293 () Bool)

(assert (=> b!834329 m!779293))

(declare-fun m!779295 () Bool)

(assert (=> b!834329 m!779295))

(declare-fun m!779297 () Bool)

(assert (=> b!834329 m!779297))

(declare-fun m!779299 () Bool)

(assert (=> bm!36520 m!779299))

(declare-fun m!779301 () Bool)

(assert (=> b!834328 m!779301))

(declare-fun m!779303 () Bool)

(assert (=> b!834328 m!779303))

(declare-fun m!779305 () Bool)

(assert (=> b!834331 m!779305))

(assert (=> b!834331 m!779299))

(declare-fun m!779307 () Bool)

(assert (=> b!834327 m!779307))

(assert (=> b!834327 m!779307))

(declare-fun m!779309 () Bool)

(assert (=> b!834327 m!779309))

(declare-fun m!779311 () Bool)

(assert (=> b!834325 m!779311))

(declare-fun m!779313 () Bool)

(assert (=> b!834325 m!779313))

(declare-fun m!779315 () Bool)

(assert (=> b!834330 m!779315))

(assert (=> bm!36521 m!779305))

(push 1)

(assert (not bm!36520))

(assert (not b!834329))

(assert (not b!834331))

(assert (not b!834328))

(assert (not b!834325))

(assert (not b!834330))

