; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71888 () Bool)

(assert start!71888)

(declare-fun b!835329 () Bool)

(declare-fun res!568335 () Bool)

(declare-fun e!465978 () Bool)

(assert (=> b!835329 (=> (not res!568335) (not e!465978))))

(declare-datatypes ((array!46787 0))(
  ( (array!46788 (arr!22428 (Array (_ BitVec 32) (_ BitVec 64))) (size!22849 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46787)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835329 (= res!568335 (and (bvslt (size!22849 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22849 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun call!36648 () (_ BitVec 32))

(declare-fun bm!36644 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46787 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36644 (= call!36648 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835330 () Bool)

(declare-fun e!465980 () Bool)

(assert (=> b!835330 (= e!465978 e!465980)))

(declare-fun res!568332 () Bool)

(assert (=> b!835330 (=> (not res!568332) (not e!465980))))

(declare-fun lt!379546 () (_ BitVec 32))

(declare-fun lt!379548 () (_ BitVec 32))

(assert (=> b!835330 (= res!568332 (and (= lt!379546 lt!379548) (not (= to!390 (size!22849 a!4227)))))))

(assert (=> b!835330 (= lt!379548 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379550 () array!46787)

(assert (=> b!835330 (= lt!379546 (arrayCountValidKeys!0 lt!379550 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835330 (= lt!379550 (array!46788 (store (arr!22428 a!4227) i!1466 k0!2968) (size!22849 a!4227)))))

(declare-fun b!835331 () Bool)

(assert (=> b!835331 (= e!465980 false)))

(declare-datatypes ((Unit!28679 0))(
  ( (Unit!28680) )
))
(declare-fun lt!379549 () Unit!28679)

(declare-fun e!465979 () Unit!28679)

(assert (=> b!835331 (= lt!379549 e!465979)))

(declare-fun c!90894 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835331 (= c!90894 (validKeyInArray!0 (select (arr!22428 a!4227) to!390)))))

(declare-fun b!835332 () Bool)

(declare-fun lt!379551 () Unit!28679)

(assert (=> b!835332 (= e!465979 lt!379551)))

(declare-fun lt!379553 () Unit!28679)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46787 (_ BitVec 32) (_ BitVec 32)) Unit!28679)

(assert (=> b!835332 (= lt!379553 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835332 (= call!36648 lt!379548)))

(assert (=> b!835332 (= lt!379551 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379550 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36647 () (_ BitVec 32))

(assert (=> b!835332 (= call!36647 lt!379546)))

(declare-fun b!835333 () Bool)

(declare-fun lt!379552 () Unit!28679)

(assert (=> b!835333 (= e!465979 lt!379552)))

(declare-fun lt!379547 () Unit!28679)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46787 (_ BitVec 32) (_ BitVec 32)) Unit!28679)

(assert (=> b!835333 (= lt!379547 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835333 (= call!36648 (bvadd #b00000000000000000000000000000001 lt!379548))))

(assert (=> b!835333 (= lt!379552 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379550 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835333 (= call!36647 (bvadd #b00000000000000000000000000000001 lt!379546))))

(declare-fun b!835334 () Bool)

(declare-fun res!568333 () Bool)

(assert (=> b!835334 (=> (not res!568333) (not e!465978))))

(assert (=> b!835334 (= res!568333 (not (validKeyInArray!0 (select (arr!22428 a!4227) i!1466))))))

(declare-fun bm!36645 () Bool)

(assert (=> bm!36645 (= call!36647 (arrayCountValidKeys!0 lt!379550 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835335 () Bool)

(declare-fun res!568336 () Bool)

(assert (=> b!835335 (=> (not res!568336) (not e!465978))))

(assert (=> b!835335 (= res!568336 (validKeyInArray!0 k0!2968))))

(declare-fun res!568334 () Bool)

(assert (=> start!71888 (=> (not res!568334) (not e!465978))))

(assert (=> start!71888 (= res!568334 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22849 a!4227))))))

(assert (=> start!71888 e!465978))

(assert (=> start!71888 true))

(declare-fun array_inv!17940 (array!46787) Bool)

(assert (=> start!71888 (array_inv!17940 a!4227)))

(assert (= (and start!71888 res!568334) b!835334))

(assert (= (and b!835334 res!568333) b!835335))

(assert (= (and b!835335 res!568336) b!835329))

(assert (= (and b!835329 res!568335) b!835330))

(assert (= (and b!835330 res!568332) b!835331))

(assert (= (and b!835331 c!90894) b!835333))

(assert (= (and b!835331 (not c!90894)) b!835332))

(assert (= (or b!835333 b!835332) bm!36645))

(assert (= (or b!835333 b!835332) bm!36644))

(declare-fun m!780013 () Bool)

(assert (=> b!835335 m!780013))

(declare-fun m!780015 () Bool)

(assert (=> bm!36644 m!780015))

(declare-fun m!780017 () Bool)

(assert (=> b!835332 m!780017))

(declare-fun m!780019 () Bool)

(assert (=> b!835332 m!780019))

(declare-fun m!780021 () Bool)

(assert (=> b!835331 m!780021))

(assert (=> b!835331 m!780021))

(declare-fun m!780023 () Bool)

(assert (=> b!835331 m!780023))

(declare-fun m!780025 () Bool)

(assert (=> b!835330 m!780025))

(declare-fun m!780027 () Bool)

(assert (=> b!835330 m!780027))

(declare-fun m!780029 () Bool)

(assert (=> b!835330 m!780029))

(declare-fun m!780031 () Bool)

(assert (=> b!835333 m!780031))

(declare-fun m!780033 () Bool)

(assert (=> b!835333 m!780033))

(declare-fun m!780035 () Bool)

(assert (=> start!71888 m!780035))

(declare-fun m!780037 () Bool)

(assert (=> bm!36645 m!780037))

(declare-fun m!780039 () Bool)

(assert (=> b!835334 m!780039))

(assert (=> b!835334 m!780039))

(declare-fun m!780041 () Bool)

(assert (=> b!835334 m!780041))

(check-sat (not b!835335) (not b!835332) (not bm!36644) (not start!71888) (not b!835333) (not b!835331) (not b!835334) (not b!835330) (not bm!36645))
(check-sat)
