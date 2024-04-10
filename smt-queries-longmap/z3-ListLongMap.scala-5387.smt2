; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71922 () Bool)

(assert start!71922)

(declare-fun b!835718 () Bool)

(declare-fun res!568544 () Bool)

(declare-fun e!466210 () Bool)

(assert (=> b!835718 (=> (not res!568544) (not e!466210))))

(declare-datatypes ((array!46832 0))(
  ( (array!46833 (arr!22450 (Array (_ BitVec 32) (_ BitVec 64))) (size!22871 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46832)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835718 (= res!568544 (not (validKeyInArray!0 (select (arr!22450 a!4227) i!1466))))))

(declare-fun b!835719 () Bool)

(declare-fun res!568547 () Bool)

(assert (=> b!835719 (=> (not res!568547) (not e!466210))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835719 (= res!568547 (and (bvslt (size!22871 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22871 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun bm!36712 () Bool)

(declare-fun lt!379959 () array!46832)

(declare-fun call!36716 () (_ BitVec 32))

(declare-fun c!90983 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46832 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36712 (= call!36716 (arrayCountValidKeys!0 (ite c!90983 lt!379959 a!4227) (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835720 () Bool)

(declare-fun e!466209 () Bool)

(assert (=> b!835720 (= e!466210 e!466209)))

(declare-fun res!568545 () Bool)

(assert (=> b!835720 (=> (not res!568545) (not e!466209))))

(declare-fun lt!379957 () (_ BitVec 32))

(declare-fun lt!379955 () (_ BitVec 32))

(assert (=> b!835720 (= res!568545 (and (= lt!379955 lt!379957) (not (= to!390 (size!22871 a!4227)))))))

(assert (=> b!835720 (= lt!379957 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835720 (= lt!379955 (arrayCountValidKeys!0 lt!379959 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835720 (= lt!379959 (array!46833 (store (arr!22450 a!4227) i!1466 k0!2968) (size!22871 a!4227)))))

(declare-fun b!835721 () Bool)

(assert (=> b!835721 (= e!466209 false)))

(declare-datatypes ((Unit!28745 0))(
  ( (Unit!28746) )
))
(declare-fun lt!379958 () Unit!28745)

(declare-fun e!466212 () Unit!28745)

(assert (=> b!835721 (= lt!379958 e!466212)))

(assert (=> b!835721 (= c!90983 (validKeyInArray!0 (select (arr!22450 a!4227) to!390)))))

(declare-fun b!835722 () Bool)

(declare-fun res!568546 () Bool)

(assert (=> b!835722 (=> (not res!568546) (not e!466210))))

(assert (=> b!835722 (= res!568546 (validKeyInArray!0 k0!2968))))

(declare-fun b!835723 () Bool)

(declare-fun lt!379954 () Unit!28745)

(assert (=> b!835723 (= e!466212 lt!379954)))

(declare-fun lt!379953 () Unit!28745)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46832 (_ BitVec 32) (_ BitVec 32)) Unit!28745)

(assert (=> b!835723 (= lt!379953 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835723 (= call!36716 lt!379957)))

(assert (=> b!835723 (= lt!379954 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379959 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36715 () (_ BitVec 32))

(assert (=> b!835723 (= call!36715 lt!379955)))

(declare-fun res!568543 () Bool)

(assert (=> start!71922 (=> (not res!568543) (not e!466210))))

(assert (=> start!71922 (= res!568543 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22871 a!4227))))))

(assert (=> start!71922 e!466210))

(assert (=> start!71922 true))

(declare-fun array_inv!17897 (array!46832) Bool)

(assert (=> start!71922 (array_inv!17897 a!4227)))

(declare-fun bm!36713 () Bool)

(assert (=> bm!36713 (= call!36715 (arrayCountValidKeys!0 (ite c!90983 a!4227 lt!379959) (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835724 () Bool)

(declare-fun lt!379956 () Unit!28745)

(assert (=> b!835724 (= e!466212 lt!379956)))

(declare-fun lt!379960 () Unit!28745)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46832 (_ BitVec 32) (_ BitVec 32)) Unit!28745)

(assert (=> b!835724 (= lt!379960 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835724 (= call!36715 (bvadd #b00000000000000000000000000000001 lt!379957))))

(assert (=> b!835724 (= lt!379956 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379959 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835724 (= call!36716 (bvadd #b00000000000000000000000000000001 lt!379955))))

(assert (= (and start!71922 res!568543) b!835718))

(assert (= (and b!835718 res!568544) b!835722))

(assert (= (and b!835722 res!568546) b!835719))

(assert (= (and b!835719 res!568547) b!835720))

(assert (= (and b!835720 res!568545) b!835721))

(assert (= (and b!835721 c!90983) b!835724))

(assert (= (and b!835721 (not c!90983)) b!835723))

(assert (= (or b!835724 b!835723) bm!36713))

(assert (= (or b!835724 b!835723) bm!36712))

(declare-fun m!780975 () Bool)

(assert (=> bm!36713 m!780975))

(declare-fun m!780977 () Bool)

(assert (=> start!71922 m!780977))

(declare-fun m!780979 () Bool)

(assert (=> b!835720 m!780979))

(declare-fun m!780981 () Bool)

(assert (=> b!835720 m!780981))

(declare-fun m!780983 () Bool)

(assert (=> b!835720 m!780983))

(declare-fun m!780985 () Bool)

(assert (=> b!835721 m!780985))

(assert (=> b!835721 m!780985))

(declare-fun m!780987 () Bool)

(assert (=> b!835721 m!780987))

(declare-fun m!780989 () Bool)

(assert (=> b!835722 m!780989))

(declare-fun m!780991 () Bool)

(assert (=> b!835718 m!780991))

(assert (=> b!835718 m!780991))

(declare-fun m!780993 () Bool)

(assert (=> b!835718 m!780993))

(declare-fun m!780995 () Bool)

(assert (=> bm!36712 m!780995))

(declare-fun m!780997 () Bool)

(assert (=> b!835724 m!780997))

(declare-fun m!780999 () Bool)

(assert (=> b!835724 m!780999))

(declare-fun m!781001 () Bool)

(assert (=> b!835723 m!781001))

(declare-fun m!781003 () Bool)

(assert (=> b!835723 m!781003))

(check-sat (not b!835723) (not b!835718) (not b!835721) (not bm!36713) (not b!835720) (not bm!36712) (not b!835722) (not b!835724) (not start!71922))
(check-sat)
