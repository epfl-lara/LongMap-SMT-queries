; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71792 () Bool)

(assert start!71792)

(declare-fun b!834397 () Bool)

(declare-fun res!567476 () Bool)

(declare-fun e!465529 () Bool)

(assert (=> b!834397 (=> (not res!567476) (not e!465529))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834397 (= res!567476 (validKeyInArray!0 k0!2968))))

(declare-fun b!834398 () Bool)

(declare-fun res!567477 () Bool)

(assert (=> b!834398 (=> (not res!567477) (not e!465529))))

(declare-datatypes ((array!46691 0))(
  ( (array!46692 (arr!22380 (Array (_ BitVec 32) (_ BitVec 64))) (size!22801 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46691)

(declare-fun i!1466 () (_ BitVec 32))

(assert (=> b!834398 (= res!567477 (not (validKeyInArray!0 (select (arr!22380 a!4227) i!1466))))))

(declare-fun bm!36572 () Bool)

(declare-fun call!36576 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46691 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36572 (= call!36576 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!567474 () Bool)

(assert (=> start!71792 (=> (not res!567474) (not e!465529))))

(assert (=> start!71792 (= res!567474 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22801 a!4227))))))

(assert (=> start!71792 e!465529))

(assert (=> start!71792 true))

(declare-fun array_inv!17892 (array!46691) Bool)

(assert (=> start!71792 (array_inv!17892 a!4227)))

(declare-fun lt!379084 () array!46691)

(declare-fun bm!36573 () Bool)

(declare-fun call!36575 () (_ BitVec 32))

(assert (=> bm!36573 (= call!36575 (arrayCountValidKeys!0 lt!379084 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834399 () Bool)

(declare-fun e!465532 () Bool)

(assert (=> b!834399 (= e!465529 e!465532)))

(declare-fun res!567473 () Bool)

(assert (=> b!834399 (=> (not res!567473) (not e!465532))))

(declare-fun lt!379088 () (_ BitVec 32))

(declare-fun lt!379086 () (_ BitVec 32))

(assert (=> b!834399 (= res!567473 (and (= lt!379086 lt!379088) (not (= to!390 (size!22801 a!4227)))))))

(assert (=> b!834399 (= lt!379088 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834399 (= lt!379086 (arrayCountValidKeys!0 lt!379084 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834399 (= lt!379084 (array!46692 (store (arr!22380 a!4227) i!1466 k0!2968) (size!22801 a!4227)))))

(declare-fun b!834400 () Bool)

(declare-fun res!567475 () Bool)

(assert (=> b!834400 (=> (not res!567475) (not e!465529))))

(assert (=> b!834400 (= res!567475 (and (bvslt (size!22801 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22801 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834401 () Bool)

(declare-datatypes ((Unit!28631 0))(
  ( (Unit!28632) )
))
(declare-fun e!465533 () Unit!28631)

(declare-fun lt!379087 () Unit!28631)

(assert (=> b!834401 (= e!465533 lt!379087)))

(declare-fun lt!379085 () Unit!28631)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46691 (_ BitVec 32) (_ BitVec 32)) Unit!28631)

(assert (=> b!834401 (= lt!379085 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834401 (= call!36576 (bvadd #b00000000000000000000000000000001 lt!379088))))

(assert (=> b!834401 (= lt!379087 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379084 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834401 (= call!36575 (bvadd #b00000000000000000000000000000001 lt!379086))))

(declare-fun b!834402 () Bool)

(declare-fun res!567478 () Bool)

(declare-fun e!465531 () Bool)

(assert (=> b!834402 (=> (not res!567478) (not e!465531))))

(assert (=> b!834402 (= res!567478 (= (arrayCountValidKeys!0 lt!379084 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!834403 () Bool)

(assert (=> b!834403 (= e!465532 e!465531)))

(declare-fun res!567472 () Bool)

(assert (=> b!834403 (=> (not res!567472) (not e!465531))))

(assert (=> b!834403 (= res!567472 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22801 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379081 () Unit!28631)

(assert (=> b!834403 (= lt!379081 e!465533)))

(declare-fun c!90858 () Bool)

(assert (=> b!834403 (= c!90858 (validKeyInArray!0 (select (arr!22380 a!4227) to!390)))))

(declare-fun b!834404 () Bool)

(declare-fun lt!379080 () Unit!28631)

(assert (=> b!834404 (= e!465533 lt!379080)))

(declare-fun lt!379083 () Unit!28631)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46691 (_ BitVec 32) (_ BitVec 32)) Unit!28631)

(assert (=> b!834404 (= lt!379083 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834404 (= call!36576 lt!379088)))

(assert (=> b!834404 (= lt!379080 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379084 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834404 (= call!36575 lt!379086)))

(declare-fun b!834405 () Bool)

(assert (=> b!834405 (= e!465531 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (=> b!834405 (= (arrayCountValidKeys!0 lt!379084 (bvadd #b00000000000000000000000000000001 i!1466) (size!22801 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22801 a!4227)))))

(declare-fun lt!379082 () Unit!28631)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46691 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28631)

(assert (=> b!834405 (= lt!379082 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!71792 res!567474) b!834398))

(assert (= (and b!834398 res!567477) b!834397))

(assert (= (and b!834397 res!567476) b!834400))

(assert (= (and b!834400 res!567475) b!834399))

(assert (= (and b!834399 res!567473) b!834403))

(assert (= (and b!834403 c!90858) b!834401))

(assert (= (and b!834403 (not c!90858)) b!834404))

(assert (= (or b!834401 b!834404) bm!36573))

(assert (= (or b!834401 b!834404) bm!36572))

(assert (= (and b!834403 res!567472) b!834402))

(assert (= (and b!834402 res!567478) b!834405))

(declare-fun m!778929 () Bool)

(assert (=> b!834398 m!778929))

(assert (=> b!834398 m!778929))

(declare-fun m!778931 () Bool)

(assert (=> b!834398 m!778931))

(declare-fun m!778933 () Bool)

(assert (=> bm!36572 m!778933))

(declare-fun m!778935 () Bool)

(assert (=> bm!36573 m!778935))

(declare-fun m!778937 () Bool)

(assert (=> b!834401 m!778937))

(declare-fun m!778939 () Bool)

(assert (=> b!834401 m!778939))

(declare-fun m!778941 () Bool)

(assert (=> b!834404 m!778941))

(declare-fun m!778943 () Bool)

(assert (=> b!834404 m!778943))

(declare-fun m!778945 () Bool)

(assert (=> start!71792 m!778945))

(declare-fun m!778947 () Bool)

(assert (=> b!834397 m!778947))

(declare-fun m!778949 () Bool)

(assert (=> b!834399 m!778949))

(declare-fun m!778951 () Bool)

(assert (=> b!834399 m!778951))

(declare-fun m!778953 () Bool)

(assert (=> b!834399 m!778953))

(assert (=> b!834402 m!778935))

(assert (=> b!834402 m!778933))

(declare-fun m!778955 () Bool)

(assert (=> b!834403 m!778955))

(assert (=> b!834403 m!778955))

(declare-fun m!778957 () Bool)

(assert (=> b!834403 m!778957))

(declare-fun m!778959 () Bool)

(assert (=> b!834405 m!778959))

(declare-fun m!778961 () Bool)

(assert (=> b!834405 m!778961))

(declare-fun m!778963 () Bool)

(assert (=> b!834405 m!778963))

(check-sat (not b!834402) (not b!834398) (not b!834399) (not bm!36573) (not b!834405) (not b!834397) (not b!834403) (not b!834404) (not start!71792) (not bm!36572) (not b!834401))
(check-sat)
