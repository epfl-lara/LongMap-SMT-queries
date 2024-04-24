; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72086 () Bool)

(assert start!72086)

(declare-fun b!836595 () Bool)

(declare-fun e!466779 () Bool)

(declare-fun e!466777 () Bool)

(assert (=> b!836595 (= e!466779 e!466777)))

(declare-fun res!568877 () Bool)

(assert (=> b!836595 (=> (not res!568877) (not e!466777))))

(declare-datatypes ((array!46833 0))(
  ( (array!46834 (arr!22446 (Array (_ BitVec 32) (_ BitVec 64))) (size!22866 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46833)

(declare-fun lt!380294 () (_ BitVec 32))

(declare-fun lt!380287 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!836595 (= res!568877 (and (= lt!380287 lt!380294) (not (= to!390 (size!22866 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46833 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836595 (= lt!380294 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380292 () array!46833)

(assert (=> b!836595 (= lt!380287 (arrayCountValidKeys!0 lt!380292 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!836595 (= lt!380292 (array!46834 (store (arr!22446 a!4227) i!1466 k0!2968) (size!22866 a!4227)))))

(declare-fun b!836596 () Bool)

(declare-fun res!568878 () Bool)

(assert (=> b!836596 (=> (not res!568878) (not e!466779))))

(assert (=> b!836596 (= res!568878 (and (bvslt (size!22866 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22866 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun call!36754 () (_ BitVec 32))

(declare-fun bm!36751 () Bool)

(assert (=> bm!36751 (= call!36754 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836597 () Bool)

(declare-datatypes ((Unit!28756 0))(
  ( (Unit!28757) )
))
(declare-fun e!466780 () Unit!28756)

(declare-fun lt!380291 () Unit!28756)

(assert (=> b!836597 (= e!466780 lt!380291)))

(declare-fun lt!380290 () Unit!28756)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46833 (_ BitVec 32) (_ BitVec 32)) Unit!28756)

(assert (=> b!836597 (= lt!380290 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836597 (= call!36754 lt!380294)))

(assert (=> b!836597 (= lt!380291 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380292 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36755 () (_ BitVec 32))

(assert (=> b!836597 (= call!36755 lt!380287)))

(declare-fun bm!36752 () Bool)

(assert (=> bm!36752 (= call!36755 (arrayCountValidKeys!0 lt!380292 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836598 () Bool)

(declare-fun lt!380288 () Unit!28756)

(assert (=> b!836598 (= e!466780 lt!380288)))

(declare-fun lt!380293 () Unit!28756)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46833 (_ BitVec 32) (_ BitVec 32)) Unit!28756)

(assert (=> b!836598 (= lt!380293 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836598 (= call!36754 (bvadd #b00000000000000000000000000000001 lt!380294))))

(assert (=> b!836598 (= lt!380288 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380292 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836598 (= call!36755 (bvadd #b00000000000000000000000000000001 lt!380287))))

(declare-fun b!836599 () Bool)

(declare-fun res!568876 () Bool)

(assert (=> b!836599 (=> (not res!568876) (not e!466779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836599 (= res!568876 (not (validKeyInArray!0 (select (arr!22446 a!4227) i!1466))))))

(declare-fun b!836600 () Bool)

(assert (=> b!836600 (= e!466777 false)))

(declare-fun lt!380289 () Unit!28756)

(assert (=> b!836600 (= lt!380289 e!466780)))

(declare-fun c!91259 () Bool)

(assert (=> b!836600 (= c!91259 (validKeyInArray!0 (select (arr!22446 a!4227) to!390)))))

(declare-fun res!568874 () Bool)

(assert (=> start!72086 (=> (not res!568874) (not e!466779))))

(assert (=> start!72086 (= res!568874 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22866 a!4227))))))

(assert (=> start!72086 e!466779))

(assert (=> start!72086 true))

(declare-fun array_inv!17932 (array!46833) Bool)

(assert (=> start!72086 (array_inv!17932 a!4227)))

(declare-fun b!836601 () Bool)

(declare-fun res!568875 () Bool)

(assert (=> b!836601 (=> (not res!568875) (not e!466779))))

(assert (=> b!836601 (= res!568875 (validKeyInArray!0 k0!2968))))

(assert (= (and start!72086 res!568874) b!836599))

(assert (= (and b!836599 res!568876) b!836601))

(assert (= (and b!836601 res!568875) b!836596))

(assert (= (and b!836596 res!568878) b!836595))

(assert (= (and b!836595 res!568877) b!836600))

(assert (= (and b!836600 c!91259) b!836598))

(assert (= (and b!836600 (not c!91259)) b!836597))

(assert (= (or b!836598 b!836597) bm!36752))

(assert (= (or b!836598 b!836597) bm!36751))

(declare-fun m!782239 () Bool)

(assert (=> b!836595 m!782239))

(declare-fun m!782241 () Bool)

(assert (=> b!836595 m!782241))

(declare-fun m!782243 () Bool)

(assert (=> b!836595 m!782243))

(declare-fun m!782245 () Bool)

(assert (=> b!836599 m!782245))

(assert (=> b!836599 m!782245))

(declare-fun m!782247 () Bool)

(assert (=> b!836599 m!782247))

(declare-fun m!782249 () Bool)

(assert (=> b!836600 m!782249))

(assert (=> b!836600 m!782249))

(declare-fun m!782251 () Bool)

(assert (=> b!836600 m!782251))

(declare-fun m!782253 () Bool)

(assert (=> b!836597 m!782253))

(declare-fun m!782255 () Bool)

(assert (=> b!836597 m!782255))

(declare-fun m!782257 () Bool)

(assert (=> bm!36752 m!782257))

(declare-fun m!782259 () Bool)

(assert (=> start!72086 m!782259))

(declare-fun m!782261 () Bool)

(assert (=> b!836598 m!782261))

(declare-fun m!782263 () Bool)

(assert (=> b!836598 m!782263))

(declare-fun m!782265 () Bool)

(assert (=> bm!36751 m!782265))

(declare-fun m!782267 () Bool)

(assert (=> b!836601 m!782267))

(check-sat (not bm!36752) (not b!836598) (not bm!36751) (not start!72086) (not b!836599) (not b!836597) (not b!836600) (not b!836595) (not b!836601))
(check-sat)
