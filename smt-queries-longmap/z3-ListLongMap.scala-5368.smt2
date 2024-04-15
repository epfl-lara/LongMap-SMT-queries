; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71786 () Bool)

(assert start!71786)

(declare-fun call!36557 () (_ BitVec 32))

(declare-datatypes ((array!46685 0))(
  ( (array!46686 (arr!22377 (Array (_ BitVec 32) (_ BitVec 64))) (size!22798 (_ BitVec 32))) )
))
(declare-fun lt!378994 () array!46685)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun bm!36554 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46685 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36554 (= call!36557 (arrayCountValidKeys!0 lt!378994 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834323 () Bool)

(declare-fun res!567419 () Bool)

(declare-fun e!465486 () Bool)

(assert (=> b!834323 (=> (not res!567419) (not e!465486))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834323 (= res!567419 (validKeyInArray!0 k0!2968))))

(declare-fun res!567418 () Bool)

(assert (=> start!71786 (=> (not res!567418) (not e!465486))))

(declare-fun a!4227 () array!46685)

(assert (=> start!71786 (= res!567418 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22798 a!4227))))))

(assert (=> start!71786 e!465486))

(assert (=> start!71786 true))

(declare-fun array_inv!17889 (array!46685) Bool)

(assert (=> start!71786 (array_inv!17889 a!4227)))

(declare-fun b!834324 () Bool)

(declare-datatypes ((Unit!28625 0))(
  ( (Unit!28626) )
))
(declare-fun e!465488 () Unit!28625)

(declare-fun lt!378995 () Unit!28625)

(assert (=> b!834324 (= e!465488 lt!378995)))

(declare-fun lt!378997 () Unit!28625)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46685 (_ BitVec 32) (_ BitVec 32)) Unit!28625)

(assert (=> b!834324 (= lt!378997 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36558 () (_ BitVec 32))

(declare-fun lt!378999 () (_ BitVec 32))

(assert (=> b!834324 (= call!36558 (bvadd #b00000000000000000000000000000001 lt!378999))))

(assert (=> b!834324 (= lt!378995 (lemmaValidKeyIncreasesNumOfKeys!0 lt!378994 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!378993 () (_ BitVec 32))

(assert (=> b!834324 (= call!36557 (bvadd #b00000000000000000000000000000001 lt!378993))))

(declare-fun bm!36555 () Bool)

(assert (=> bm!36555 (= call!36558 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834325 () Bool)

(declare-fun lt!378996 () Unit!28625)

(assert (=> b!834325 (= e!465488 lt!378996)))

(declare-fun lt!378992 () Unit!28625)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46685 (_ BitVec 32) (_ BitVec 32)) Unit!28625)

(assert (=> b!834325 (= lt!378992 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834325 (= call!36558 lt!378999)))

(assert (=> b!834325 (= lt!378996 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!378994 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834325 (= call!36557 lt!378993)))

(declare-fun b!834326 () Bool)

(declare-fun res!567420 () Bool)

(assert (=> b!834326 (=> (not res!567420) (not e!465486))))

(assert (=> b!834326 (= res!567420 (and (bvslt (size!22798 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22798 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834327 () Bool)

(declare-fun e!465485 () Bool)

(assert (=> b!834327 (= e!465486 e!465485)))

(declare-fun res!567417 () Bool)

(assert (=> b!834327 (=> (not res!567417) (not e!465485))))

(assert (=> b!834327 (= res!567417 (and (= lt!378993 lt!378999) (not (= to!390 (size!22798 a!4227)))))))

(assert (=> b!834327 (= lt!378999 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834327 (= lt!378993 (arrayCountValidKeys!0 lt!378994 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834327 (= lt!378994 (array!46686 (store (arr!22377 a!4227) i!1466 k0!2968) (size!22798 a!4227)))))

(declare-fun b!834328 () Bool)

(declare-fun res!567416 () Bool)

(assert (=> b!834328 (=> (not res!567416) (not e!465486))))

(assert (=> b!834328 (= res!567416 (not (validKeyInArray!0 (select (arr!22377 a!4227) i!1466))))))

(declare-fun b!834329 () Bool)

(declare-fun e!465487 () Bool)

(assert (=> b!834329 (= e!465485 e!465487)))

(declare-fun res!567421 () Bool)

(assert (=> b!834329 (=> (not res!567421) (not e!465487))))

(assert (=> b!834329 (= res!567421 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22798 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379001 () Unit!28625)

(assert (=> b!834329 (= lt!379001 e!465488)))

(declare-fun c!90849 () Bool)

(assert (=> b!834329 (= c!90849 (validKeyInArray!0 (select (arr!22377 a!4227) to!390)))))

(declare-fun b!834330 () Bool)

(assert (=> b!834330 (= e!465487 false)))

(declare-fun lt!378998 () (_ BitVec 32))

(assert (=> b!834330 (= lt!378998 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!379000 () (_ BitVec 32))

(assert (=> b!834330 (= lt!379000 (arrayCountValidKeys!0 lt!378994 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!71786 res!567418) b!834328))

(assert (= (and b!834328 res!567416) b!834323))

(assert (= (and b!834323 res!567419) b!834326))

(assert (= (and b!834326 res!567420) b!834327))

(assert (= (and b!834327 res!567417) b!834329))

(assert (= (and b!834329 c!90849) b!834324))

(assert (= (and b!834329 (not c!90849)) b!834325))

(assert (= (or b!834324 b!834325) bm!36554))

(assert (= (or b!834324 b!834325) bm!36555))

(assert (= (and b!834329 res!567421) b!834330))

(declare-fun m!778839 () Bool)

(assert (=> b!834325 m!778839))

(declare-fun m!778841 () Bool)

(assert (=> b!834325 m!778841))

(declare-fun m!778843 () Bool)

(assert (=> start!71786 m!778843))

(declare-fun m!778845 () Bool)

(assert (=> b!834330 m!778845))

(declare-fun m!778847 () Bool)

(assert (=> b!834330 m!778847))

(declare-fun m!778849 () Bool)

(assert (=> b!834329 m!778849))

(assert (=> b!834329 m!778849))

(declare-fun m!778851 () Bool)

(assert (=> b!834329 m!778851))

(assert (=> bm!36555 m!778845))

(assert (=> bm!36554 m!778847))

(declare-fun m!778853 () Bool)

(assert (=> b!834323 m!778853))

(declare-fun m!778855 () Bool)

(assert (=> b!834324 m!778855))

(declare-fun m!778857 () Bool)

(assert (=> b!834324 m!778857))

(declare-fun m!778859 () Bool)

(assert (=> b!834328 m!778859))

(assert (=> b!834328 m!778859))

(declare-fun m!778861 () Bool)

(assert (=> b!834328 m!778861))

(declare-fun m!778863 () Bool)

(assert (=> b!834327 m!778863))

(declare-fun m!778865 () Bool)

(assert (=> b!834327 m!778865))

(declare-fun m!778867 () Bool)

(assert (=> b!834327 m!778867))

(check-sat (not b!834330) (not bm!36554) (not start!71786) (not b!834325) (not b!834327) (not bm!36555) (not b!834323) (not b!834328) (not b!834329) (not b!834324))
(check-sat)
