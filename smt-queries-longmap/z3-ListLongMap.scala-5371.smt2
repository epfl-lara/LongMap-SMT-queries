; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71804 () Bool)

(assert start!71804)

(declare-datatypes ((array!46703 0))(
  ( (array!46704 (arr!22386 (Array (_ BitVec 32) (_ BitVec 64))) (size!22807 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46703)

(declare-fun call!36612 () (_ BitVec 32))

(declare-fun bm!36608 () Bool)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46703 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36608 (= call!36612 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun call!36611 () (_ BitVec 32))

(declare-fun lt!379242 () array!46703)

(declare-fun bm!36609 () Bool)

(assert (=> bm!36609 (= call!36611 (arrayCountValidKeys!0 lt!379242 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834559 () Bool)

(declare-datatypes ((Unit!28643 0))(
  ( (Unit!28644) )
))
(declare-fun e!465619 () Unit!28643)

(declare-fun lt!379243 () Unit!28643)

(assert (=> b!834559 (= e!465619 lt!379243)))

(declare-fun lt!379245 () Unit!28643)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46703 (_ BitVec 32) (_ BitVec 32)) Unit!28643)

(assert (=> b!834559 (= lt!379245 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379244 () (_ BitVec 32))

(assert (=> b!834559 (= call!36612 (bvadd #b00000000000000000000000000000001 lt!379244))))

(assert (=> b!834559 (= lt!379243 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379242 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379248 () (_ BitVec 32))

(assert (=> b!834559 (= call!36611 (bvadd #b00000000000000000000000000000001 lt!379248))))

(declare-fun b!834560 () Bool)

(declare-fun e!465621 () Bool)

(assert (=> b!834560 (= e!465621 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (=> b!834560 (= (arrayCountValidKeys!0 lt!379242 (bvadd #b00000000000000000000000000000001 i!1466) (size!22807 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22807 a!4227)))))

(declare-fun lt!379247 () Unit!28643)

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46703 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28643)

(assert (=> b!834560 (= lt!379247 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!567601 () Bool)

(declare-fun e!465623 () Bool)

(assert (=> start!71804 (=> (not res!567601) (not e!465623))))

(assert (=> start!71804 (= res!567601 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22807 a!4227))))))

(assert (=> start!71804 e!465623))

(assert (=> start!71804 true))

(declare-fun array_inv!17898 (array!46703) Bool)

(assert (=> start!71804 (array_inv!17898 a!4227)))

(declare-fun b!834561 () Bool)

(declare-fun lt!379250 () Unit!28643)

(assert (=> b!834561 (= e!465619 lt!379250)))

(declare-fun lt!379249 () Unit!28643)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46703 (_ BitVec 32) (_ BitVec 32)) Unit!28643)

(assert (=> b!834561 (= lt!379249 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834561 (= call!36612 lt!379244)))

(assert (=> b!834561 (= lt!379250 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379242 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834561 (= call!36611 lt!379248)))

(declare-fun b!834562 () Bool)

(declare-fun res!567602 () Bool)

(assert (=> b!834562 (=> (not res!567602) (not e!465621))))

(assert (=> b!834562 (= res!567602 (= (arrayCountValidKeys!0 lt!379242 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!834563 () Bool)

(declare-fun e!465622 () Bool)

(assert (=> b!834563 (= e!465622 e!465621)))

(declare-fun res!567603 () Bool)

(assert (=> b!834563 (=> (not res!567603) (not e!465621))))

(assert (=> b!834563 (= res!567603 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22807 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379246 () Unit!28643)

(assert (=> b!834563 (= lt!379246 e!465619)))

(declare-fun c!90876 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834563 (= c!90876 (validKeyInArray!0 (select (arr!22386 a!4227) to!390)))))

(declare-fun b!834564 () Bool)

(declare-fun res!567599 () Bool)

(assert (=> b!834564 (=> (not res!567599) (not e!465623))))

(assert (=> b!834564 (= res!567599 (and (bvslt (size!22807 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22807 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834565 () Bool)

(declare-fun res!567600 () Bool)

(assert (=> b!834565 (=> (not res!567600) (not e!465623))))

(assert (=> b!834565 (= res!567600 (not (validKeyInArray!0 (select (arr!22386 a!4227) i!1466))))))

(declare-fun b!834566 () Bool)

(declare-fun res!567598 () Bool)

(assert (=> b!834566 (=> (not res!567598) (not e!465623))))

(assert (=> b!834566 (= res!567598 (validKeyInArray!0 k0!2968))))

(declare-fun b!834567 () Bool)

(assert (=> b!834567 (= e!465623 e!465622)))

(declare-fun res!567604 () Bool)

(assert (=> b!834567 (=> (not res!567604) (not e!465622))))

(assert (=> b!834567 (= res!567604 (and (= lt!379248 lt!379244) (not (= to!390 (size!22807 a!4227)))))))

(assert (=> b!834567 (= lt!379244 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834567 (= lt!379248 (arrayCountValidKeys!0 lt!379242 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834567 (= lt!379242 (array!46704 (store (arr!22386 a!4227) i!1466 k0!2968) (size!22807 a!4227)))))

(assert (= (and start!71804 res!567601) b!834565))

(assert (= (and b!834565 res!567600) b!834566))

(assert (= (and b!834566 res!567598) b!834564))

(assert (= (and b!834564 res!567599) b!834567))

(assert (= (and b!834567 res!567604) b!834563))

(assert (= (and b!834563 c!90876) b!834559))

(assert (= (and b!834563 (not c!90876)) b!834561))

(assert (= (or b!834559 b!834561) bm!36609))

(assert (= (or b!834559 b!834561) bm!36608))

(assert (= (and b!834563 res!567603) b!834562))

(assert (= (and b!834562 res!567602) b!834560))

(declare-fun m!779145 () Bool)

(assert (=> b!834559 m!779145))

(declare-fun m!779147 () Bool)

(assert (=> b!834559 m!779147))

(declare-fun m!779149 () Bool)

(assert (=> bm!36608 m!779149))

(declare-fun m!779151 () Bool)

(assert (=> b!834565 m!779151))

(assert (=> b!834565 m!779151))

(declare-fun m!779153 () Bool)

(assert (=> b!834565 m!779153))

(declare-fun m!779155 () Bool)

(assert (=> b!834566 m!779155))

(declare-fun m!779157 () Bool)

(assert (=> start!71804 m!779157))

(declare-fun m!779159 () Bool)

(assert (=> b!834561 m!779159))

(declare-fun m!779161 () Bool)

(assert (=> b!834561 m!779161))

(declare-fun m!779163 () Bool)

(assert (=> b!834567 m!779163))

(declare-fun m!779165 () Bool)

(assert (=> b!834567 m!779165))

(declare-fun m!779167 () Bool)

(assert (=> b!834567 m!779167))

(declare-fun m!779169 () Bool)

(assert (=> bm!36609 m!779169))

(declare-fun m!779171 () Bool)

(assert (=> b!834563 m!779171))

(assert (=> b!834563 m!779171))

(declare-fun m!779173 () Bool)

(assert (=> b!834563 m!779173))

(assert (=> b!834562 m!779169))

(assert (=> b!834562 m!779149))

(declare-fun m!779175 () Bool)

(assert (=> b!834560 m!779175))

(declare-fun m!779177 () Bool)

(assert (=> b!834560 m!779177))

(declare-fun m!779179 () Bool)

(assert (=> b!834560 m!779179))

(check-sat (not b!834567) (not start!71804) (not bm!36608) (not b!834565) (not b!834559) (not b!834566) (not b!834562) (not bm!36609) (not b!834561) (not b!834560) (not b!834563))
(check-sat)
