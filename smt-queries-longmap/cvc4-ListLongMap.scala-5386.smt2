; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71918 () Bool)

(assert start!71918)

(declare-fun b!835676 () Bool)

(declare-fun res!568516 () Bool)

(declare-fun e!466185 () Bool)

(assert (=> b!835676 (=> (not res!568516) (not e!466185))))

(declare-datatypes ((array!46828 0))(
  ( (array!46829 (arr!22448 (Array (_ BitVec 32) (_ BitVec 64))) (size!22869 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46828)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835676 (= res!568516 (and (bvslt (size!22869 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22869 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835677 () Bool)

(declare-fun e!466187 () Bool)

(assert (=> b!835677 (= e!466187 false)))

(declare-datatypes ((Unit!28741 0))(
  ( (Unit!28742) )
))
(declare-fun lt!379906 () Unit!28741)

(declare-fun e!466188 () Unit!28741)

(assert (=> b!835677 (= lt!379906 e!466188)))

(declare-fun c!90977 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835677 (= c!90977 (validKeyInArray!0 (select (arr!22448 a!4227) to!390)))))

(declare-fun b!835678 () Bool)

(declare-fun res!568517 () Bool)

(assert (=> b!835678 (=> (not res!568517) (not e!466185))))

(assert (=> b!835678 (= res!568517 (not (validKeyInArray!0 (select (arr!22448 a!4227) i!1466))))))

(declare-fun b!835679 () Bool)

(declare-fun res!568515 () Bool)

(assert (=> b!835679 (=> (not res!568515) (not e!466185))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!835679 (= res!568515 (validKeyInArray!0 k!2968))))

(declare-fun b!835680 () Bool)

(declare-fun lt!379911 () Unit!28741)

(assert (=> b!835680 (= e!466188 lt!379911)))

(declare-fun lt!379912 () Unit!28741)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46828 (_ BitVec 32) (_ BitVec 32)) Unit!28741)

(assert (=> b!835680 (= lt!379912 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36703 () (_ BitVec 32))

(declare-fun lt!379907 () (_ BitVec 32))

(assert (=> b!835680 (= call!36703 lt!379907)))

(declare-fun lt!379909 () array!46828)

(assert (=> b!835680 (= lt!379911 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379909 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36704 () (_ BitVec 32))

(declare-fun lt!379905 () (_ BitVec 32))

(assert (=> b!835680 (= call!36704 lt!379905)))

(declare-fun bm!36700 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46828 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36700 (= call!36703 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!568513 () Bool)

(assert (=> start!71918 (=> (not res!568513) (not e!466185))))

(assert (=> start!71918 (= res!568513 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22869 a!4227))))))

(assert (=> start!71918 e!466185))

(assert (=> start!71918 true))

(declare-fun array_inv!17895 (array!46828) Bool)

(assert (=> start!71918 (array_inv!17895 a!4227)))

(declare-fun b!835681 () Bool)

(declare-fun lt!379910 () Unit!28741)

(assert (=> b!835681 (= e!466188 lt!379910)))

(declare-fun lt!379908 () Unit!28741)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46828 (_ BitVec 32) (_ BitVec 32)) Unit!28741)

(assert (=> b!835681 (= lt!379908 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835681 (= call!36703 (bvadd #b00000000000000000000000000000001 lt!379907))))

(assert (=> b!835681 (= lt!379910 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379909 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835681 (= call!36704 (bvadd #b00000000000000000000000000000001 lt!379905))))

(declare-fun b!835682 () Bool)

(assert (=> b!835682 (= e!466185 e!466187)))

(declare-fun res!568514 () Bool)

(assert (=> b!835682 (=> (not res!568514) (not e!466187))))

(assert (=> b!835682 (= res!568514 (and (= lt!379905 lt!379907) (not (= to!390 (size!22869 a!4227)))))))

(assert (=> b!835682 (= lt!379907 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835682 (= lt!379905 (arrayCountValidKeys!0 lt!379909 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835682 (= lt!379909 (array!46829 (store (arr!22448 a!4227) i!1466 k!2968) (size!22869 a!4227)))))

(declare-fun bm!36701 () Bool)

(assert (=> bm!36701 (= call!36704 (arrayCountValidKeys!0 lt!379909 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!71918 res!568513) b!835678))

(assert (= (and b!835678 res!568517) b!835679))

(assert (= (and b!835679 res!568515) b!835676))

(assert (= (and b!835676 res!568516) b!835682))

(assert (= (and b!835682 res!568514) b!835677))

(assert (= (and b!835677 c!90977) b!835681))

(assert (= (and b!835677 (not c!90977)) b!835680))

(assert (= (or b!835681 b!835680) bm!36701))

(assert (= (or b!835681 b!835680) bm!36700))

(declare-fun m!780915 () Bool)

(assert (=> bm!36701 m!780915))

(declare-fun m!780917 () Bool)

(assert (=> b!835681 m!780917))

(declare-fun m!780919 () Bool)

(assert (=> b!835681 m!780919))

(declare-fun m!780921 () Bool)

(assert (=> start!71918 m!780921))

(declare-fun m!780923 () Bool)

(assert (=> b!835677 m!780923))

(assert (=> b!835677 m!780923))

(declare-fun m!780925 () Bool)

(assert (=> b!835677 m!780925))

(declare-fun m!780927 () Bool)

(assert (=> b!835680 m!780927))

(declare-fun m!780929 () Bool)

(assert (=> b!835680 m!780929))

(declare-fun m!780931 () Bool)

(assert (=> b!835678 m!780931))

(assert (=> b!835678 m!780931))

(declare-fun m!780933 () Bool)

(assert (=> b!835678 m!780933))

(declare-fun m!780935 () Bool)

(assert (=> b!835679 m!780935))

(declare-fun m!780937 () Bool)

(assert (=> b!835682 m!780937))

(declare-fun m!780939 () Bool)

(assert (=> b!835682 m!780939))

(declare-fun m!780941 () Bool)

(assert (=> b!835682 m!780941))

(declare-fun m!780943 () Bool)

(assert (=> bm!36700 m!780943))

(push 1)

