; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71940 () Bool)

(assert start!71940)

(declare-fun b!835926 () Bool)

(declare-datatypes ((Unit!28763 0))(
  ( (Unit!28764) )
))
(declare-fun e!466334 () Unit!28763)

(declare-fun lt!380169 () Unit!28763)

(assert (=> b!835926 (= e!466334 lt!380169)))

(declare-datatypes ((array!46850 0))(
  ( (array!46851 (arr!22459 (Array (_ BitVec 32) (_ BitVec 64))) (size!22880 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46850)

(declare-fun lt!380176 () Unit!28763)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46850 (_ BitVec 32) (_ BitVec 32)) Unit!28763)

(assert (=> b!835926 (= lt!380176 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36770 () (_ BitVec 32))

(declare-fun lt!380173 () (_ BitVec 32))

(assert (=> b!835926 (= call!36770 lt!380173)))

(declare-fun lt!380171 () array!46850)

(assert (=> b!835926 (= lt!380169 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380171 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36769 () (_ BitVec 32))

(declare-fun lt!380170 () (_ BitVec 32))

(assert (=> b!835926 (= call!36769 lt!380170)))

(declare-fun b!835927 () Bool)

(declare-fun res!568699 () Bool)

(declare-fun e!466333 () Bool)

(assert (=> b!835927 (=> (not res!568699) (not e!466333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835927 (= res!568699 (not (validKeyInArray!0 (select (arr!22459 a!4227) i!1466))))))

(declare-fun res!568698 () Bool)

(assert (=> start!71940 (=> (not res!568698) (not e!466333))))

(assert (=> start!71940 (= res!568698 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22880 a!4227))))))

(assert (=> start!71940 e!466333))

(assert (=> start!71940 true))

(declare-fun array_inv!17906 (array!46850) Bool)

(assert (=> start!71940 (array_inv!17906 a!4227)))

(declare-fun b!835928 () Bool)

(declare-fun lt!380175 () Unit!28763)

(assert (=> b!835928 (= e!466334 lt!380175)))

(declare-fun lt!380172 () Unit!28763)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46850 (_ BitVec 32) (_ BitVec 32)) Unit!28763)

(assert (=> b!835928 (= lt!380172 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835928 (= call!36770 (bvadd #b00000000000000000000000000000001 lt!380173))))

(assert (=> b!835928 (= lt!380175 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380171 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835928 (= call!36769 (bvadd #b00000000000000000000000000000001 lt!380170))))

(declare-fun b!835929 () Bool)

(declare-fun e!466335 () Bool)

(declare-fun e!466332 () Bool)

(assert (=> b!835929 (= e!466335 e!466332)))

(declare-fun res!568700 () Bool)

(assert (=> b!835929 (=> (not res!568700) (not e!466332))))

(assert (=> b!835929 (= res!568700 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22880 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!380174 () Unit!28763)

(assert (=> b!835929 (= lt!380174 e!466334)))

(declare-fun c!91010 () Bool)

(assert (=> b!835929 (= c!91010 (validKeyInArray!0 (select (arr!22459 a!4227) to!390)))))

(declare-fun bm!36766 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46850 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36766 (= call!36770 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835930 () Bool)

(assert (=> b!835930 (= e!466333 e!466335)))

(declare-fun res!568702 () Bool)

(assert (=> b!835930 (=> (not res!568702) (not e!466335))))

(assert (=> b!835930 (= res!568702 (and (= lt!380170 lt!380173) (not (= to!390 (size!22880 a!4227)))))))

(assert (=> b!835930 (= lt!380173 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835930 (= lt!380170 (arrayCountValidKeys!0 lt!380171 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835930 (= lt!380171 (array!46851 (store (arr!22459 a!4227) i!1466 k0!2968) (size!22880 a!4227)))))

(declare-fun b!835931 () Bool)

(declare-fun res!568703 () Bool)

(assert (=> b!835931 (=> (not res!568703) (not e!466333))))

(assert (=> b!835931 (= res!568703 (and (bvslt (size!22880 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22880 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835932 () Bool)

(declare-fun res!568697 () Bool)

(assert (=> b!835932 (=> (not res!568697) (not e!466333))))

(assert (=> b!835932 (= res!568697 (validKeyInArray!0 k0!2968))))

(declare-fun bm!36767 () Bool)

(assert (=> bm!36767 (= call!36769 (arrayCountValidKeys!0 lt!380171 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835933 () Bool)

(assert (=> b!835933 (= e!466332 (bvsge (bvsub (size!22880 a!4227) to!390) (bvsub (bvadd #b00000000000000000000000000000001 (size!22880 a!4227)) to!390)))))

(declare-fun b!835934 () Bool)

(declare-fun res!568701 () Bool)

(assert (=> b!835934 (=> (not res!568701) (not e!466332))))

(assert (=> b!835934 (= res!568701 (= (arrayCountValidKeys!0 lt!380171 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(assert (= (and start!71940 res!568698) b!835927))

(assert (= (and b!835927 res!568699) b!835932))

(assert (= (and b!835932 res!568697) b!835931))

(assert (= (and b!835931 res!568703) b!835930))

(assert (= (and b!835930 res!568702) b!835929))

(assert (= (and b!835929 c!91010) b!835928))

(assert (= (and b!835929 (not c!91010)) b!835926))

(assert (= (or b!835928 b!835926) bm!36766))

(assert (= (or b!835928 b!835926) bm!36767))

(assert (= (and b!835929 res!568700) b!835934))

(assert (= (and b!835934 res!568701) b!835933))

(declare-fun m!781249 () Bool)

(assert (=> b!835926 m!781249))

(declare-fun m!781251 () Bool)

(assert (=> b!835926 m!781251))

(declare-fun m!781253 () Bool)

(assert (=> b!835927 m!781253))

(assert (=> b!835927 m!781253))

(declare-fun m!781255 () Bool)

(assert (=> b!835927 m!781255))

(declare-fun m!781257 () Bool)

(assert (=> bm!36766 m!781257))

(declare-fun m!781259 () Bool)

(assert (=> bm!36767 m!781259))

(declare-fun m!781261 () Bool)

(assert (=> b!835928 m!781261))

(declare-fun m!781263 () Bool)

(assert (=> b!835928 m!781263))

(assert (=> b!835934 m!781259))

(assert (=> b!835934 m!781257))

(declare-fun m!781265 () Bool)

(assert (=> b!835932 m!781265))

(declare-fun m!781267 () Bool)

(assert (=> b!835930 m!781267))

(declare-fun m!781269 () Bool)

(assert (=> b!835930 m!781269))

(declare-fun m!781271 () Bool)

(assert (=> b!835930 m!781271))

(declare-fun m!781273 () Bool)

(assert (=> start!71940 m!781273))

(declare-fun m!781275 () Bool)

(assert (=> b!835929 m!781275))

(assert (=> b!835929 m!781275))

(declare-fun m!781277 () Bool)

(assert (=> b!835929 m!781277))

(check-sat (not b!835930) (not b!835929) (not b!835932) (not bm!36766) (not start!71940) (not b!835926) (not b!835934) (not b!835927) (not bm!36767) (not b!835928))
(check-sat)
