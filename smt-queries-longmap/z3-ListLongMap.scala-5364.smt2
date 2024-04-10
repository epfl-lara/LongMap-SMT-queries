; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71784 () Bool)

(assert start!71784)

(declare-fun b!834301 () Bool)

(declare-fun e!465468 () Bool)

(declare-fun e!465470 () Bool)

(assert (=> b!834301 (= e!465468 e!465470)))

(declare-fun res!567327 () Bool)

(assert (=> b!834301 (=> (not res!567327) (not e!465470))))

(declare-datatypes ((array!46694 0))(
  ( (array!46695 (arr!22381 (Array (_ BitVec 32) (_ BitVec 64))) (size!22802 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46694)

(declare-fun lt!378906 () (_ BitVec 32))

(declare-fun lt!378904 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834301 (= res!567327 (and (= lt!378906 lt!378904) (not (= to!390 (size!22802 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46694 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834301 (= lt!378904 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!378901 () array!46694)

(assert (=> b!834301 (= lt!378906 (arrayCountValidKeys!0 lt!378901 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!834301 (= lt!378901 (array!46695 (store (arr!22381 a!4227) i!1466 k0!2968) (size!22802 a!4227)))))

(declare-fun b!834302 () Bool)

(declare-datatypes ((Unit!28655 0))(
  ( (Unit!28656) )
))
(declare-fun e!465469 () Unit!28655)

(declare-fun lt!378903 () Unit!28655)

(assert (=> b!834302 (= e!465469 lt!378903)))

(declare-fun lt!378902 () Unit!28655)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46694 (_ BitVec 32) (_ BitVec 32)) Unit!28655)

(assert (=> b!834302 (= lt!378902 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36518 () (_ BitVec 32))

(assert (=> b!834302 (= call!36518 (bvadd #b00000000000000000000000000000001 lt!378904))))

(assert (=> b!834302 (= lt!378903 (lemmaValidKeyIncreasesNumOfKeys!0 lt!378901 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36517 () (_ BitVec 32))

(assert (=> b!834302 (= call!36517 (bvadd #b00000000000000000000000000000001 lt!378906))))

(declare-fun b!834303 () Bool)

(declare-fun res!567328 () Bool)

(assert (=> b!834303 (=> (not res!567328) (not e!465468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834303 (= res!567328 (validKeyInArray!0 k0!2968))))

(declare-fun res!567329 () Bool)

(assert (=> start!71784 (=> (not res!567329) (not e!465468))))

(assert (=> start!71784 (= res!567329 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22802 a!4227))))))

(assert (=> start!71784 e!465468))

(assert (=> start!71784 true))

(declare-fun array_inv!17828 (array!46694) Bool)

(assert (=> start!71784 (array_inv!17828 a!4227)))

(declare-fun b!834304 () Bool)

(declare-fun e!465471 () Bool)

(assert (=> b!834304 (= e!465471 false)))

(declare-fun lt!378910 () (_ BitVec 32))

(assert (=> b!834304 (= lt!378910 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!378909 () (_ BitVec 32))

(assert (=> b!834304 (= lt!378909 (arrayCountValidKeys!0 lt!378901 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834305 () Bool)

(declare-fun lt!378905 () Unit!28655)

(assert (=> b!834305 (= e!465469 lt!378905)))

(declare-fun lt!378908 () Unit!28655)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46694 (_ BitVec 32) (_ BitVec 32)) Unit!28655)

(assert (=> b!834305 (= lt!378908 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834305 (= call!36518 lt!378904)))

(assert (=> b!834305 (= lt!378905 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!378901 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834305 (= call!36517 lt!378906)))

(declare-fun b!834306 () Bool)

(assert (=> b!834306 (= e!465470 e!465471)))

(declare-fun res!567326 () Bool)

(assert (=> b!834306 (=> (not res!567326) (not e!465471))))

(assert (=> b!834306 (= res!567326 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22802 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!378907 () Unit!28655)

(assert (=> b!834306 (= lt!378907 e!465469)))

(declare-fun c!90884 () Bool)

(assert (=> b!834306 (= c!90884 (validKeyInArray!0 (select (arr!22381 a!4227) to!390)))))

(declare-fun b!834307 () Bool)

(declare-fun res!567324 () Bool)

(assert (=> b!834307 (=> (not res!567324) (not e!465468))))

(assert (=> b!834307 (= res!567324 (and (bvslt (size!22802 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22802 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun bm!36514 () Bool)

(assert (=> bm!36514 (= call!36518 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun bm!36515 () Bool)

(assert (=> bm!36515 (= call!36517 (arrayCountValidKeys!0 lt!378901 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834308 () Bool)

(declare-fun res!567325 () Bool)

(assert (=> b!834308 (=> (not res!567325) (not e!465468))))

(assert (=> b!834308 (= res!567325 (not (validKeyInArray!0 (select (arr!22381 a!4227) i!1466))))))

(assert (= (and start!71784 res!567329) b!834308))

(assert (= (and b!834308 res!567325) b!834303))

(assert (= (and b!834303 res!567328) b!834307))

(assert (= (and b!834307 res!567324) b!834301))

(assert (= (and b!834301 res!567327) b!834306))

(assert (= (and b!834306 c!90884) b!834302))

(assert (= (and b!834306 (not c!90884)) b!834305))

(assert (= (or b!834302 b!834305) bm!36515))

(assert (= (or b!834302 b!834305) bm!36514))

(assert (= (and b!834306 res!567326) b!834304))

(declare-fun m!779257 () Bool)

(assert (=> b!834301 m!779257))

(declare-fun m!779259 () Bool)

(assert (=> b!834301 m!779259))

(declare-fun m!779261 () Bool)

(assert (=> b!834301 m!779261))

(declare-fun m!779263 () Bool)

(assert (=> b!834305 m!779263))

(declare-fun m!779265 () Bool)

(assert (=> b!834305 m!779265))

(declare-fun m!779267 () Bool)

(assert (=> b!834306 m!779267))

(assert (=> b!834306 m!779267))

(declare-fun m!779269 () Bool)

(assert (=> b!834306 m!779269))

(declare-fun m!779271 () Bool)

(assert (=> b!834304 m!779271))

(declare-fun m!779273 () Bool)

(assert (=> b!834304 m!779273))

(declare-fun m!779275 () Bool)

(assert (=> b!834303 m!779275))

(declare-fun m!779277 () Bool)

(assert (=> b!834308 m!779277))

(assert (=> b!834308 m!779277))

(declare-fun m!779279 () Bool)

(assert (=> b!834308 m!779279))

(assert (=> bm!36515 m!779273))

(declare-fun m!779281 () Bool)

(assert (=> b!834302 m!779281))

(declare-fun m!779283 () Bool)

(assert (=> b!834302 m!779283))

(declare-fun m!779285 () Bool)

(assert (=> start!71784 m!779285))

(assert (=> bm!36514 m!779271))

(check-sat (not bm!36514) (not b!834302) (not b!834308) (not b!834305) (not bm!36515) (not b!834306) (not start!71784) (not b!834301) (not b!834303) (not b!834304))
(check-sat)
