; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71948 () Bool)

(assert start!71948)

(declare-datatypes ((array!46695 0))(
  ( (array!46696 (arr!22377 (Array (_ BitVec 32) (_ BitVec 64))) (size!22797 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46695)

(declare-fun bm!36553 () Bool)

(declare-fun c!91160 () Bool)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lt!379236 () array!46695)

(declare-fun call!36557 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46695 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36553 (= call!36557 (arrayCountValidKeys!0 (ite c!91160 lt!379236 a!4227) (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835175 () Bool)

(declare-datatypes ((Unit!28666 0))(
  ( (Unit!28667) )
))
(declare-fun e!466036 () Unit!28666)

(declare-fun lt!379238 () Unit!28666)

(assert (=> b!835175 (= e!466036 lt!379238)))

(declare-fun lt!379237 () Unit!28666)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46695 (_ BitVec 32) (_ BitVec 32)) Unit!28666)

(assert (=> b!835175 (= lt!379237 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379232 () (_ BitVec 32))

(assert (=> b!835175 (= call!36557 lt!379232)))

(assert (=> b!835175 (= lt!379238 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379236 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36556 () (_ BitVec 32))

(declare-fun lt!379230 () (_ BitVec 32))

(assert (=> b!835175 (= call!36556 lt!379230)))

(declare-fun b!835176 () Bool)

(declare-fun lt!379235 () Unit!28666)

(assert (=> b!835176 (= e!466036 lt!379235)))

(declare-fun lt!379229 () Unit!28666)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46695 (_ BitVec 32) (_ BitVec 32)) Unit!28666)

(assert (=> b!835176 (= lt!379229 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835176 (= call!36556 (bvadd #b00000000000000000000000000000001 lt!379232))))

(assert (=> b!835176 (= lt!379235 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379236 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835176 (= call!36557 (bvadd #b00000000000000000000000000000001 lt!379230))))

(declare-fun b!835177 () Bool)

(declare-fun e!466033 () Bool)

(declare-fun e!466035 () Bool)

(assert (=> b!835177 (= e!466033 e!466035)))

(declare-fun res!567655 () Bool)

(assert (=> b!835177 (=> (not res!567655) (not e!466035))))

(assert (=> b!835177 (= res!567655 (and (= lt!379230 lt!379232) (not (= to!390 (size!22797 a!4227)))))))

(assert (=> b!835177 (= lt!379232 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835177 (= lt!379230 (arrayCountValidKeys!0 lt!379236 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835177 (= lt!379236 (array!46696 (store (arr!22377 a!4227) i!1466 k0!2968) (size!22797 a!4227)))))

(declare-fun b!835178 () Bool)

(declare-fun e!466034 () Bool)

(assert (=> b!835178 (= e!466034 false)))

(declare-fun lt!379231 () (_ BitVec 32))

(assert (=> b!835178 (= lt!379231 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!379234 () (_ BitVec 32))

(assert (=> b!835178 (= lt!379234 (arrayCountValidKeys!0 lt!379236 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835179 () Bool)

(declare-fun res!567653 () Bool)

(assert (=> b!835179 (=> (not res!567653) (not e!466033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835179 (= res!567653 (not (validKeyInArray!0 (select (arr!22377 a!4227) i!1466))))))

(declare-fun b!835180 () Bool)

(declare-fun res!567654 () Bool)

(assert (=> b!835180 (=> (not res!567654) (not e!466033))))

(assert (=> b!835180 (= res!567654 (and (bvslt (size!22797 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22797 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835181 () Bool)

(assert (=> b!835181 (= e!466035 e!466034)))

(declare-fun res!567652 () Bool)

(assert (=> b!835181 (=> (not res!567652) (not e!466034))))

(assert (=> b!835181 (= res!567652 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22797 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379233 () Unit!28666)

(assert (=> b!835181 (= lt!379233 e!466036)))

(assert (=> b!835181 (= c!91160 (validKeyInArray!0 (select (arr!22377 a!4227) to!390)))))

(declare-fun res!567656 () Bool)

(assert (=> start!71948 (=> (not res!567656) (not e!466033))))

(assert (=> start!71948 (= res!567656 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22797 a!4227))))))

(assert (=> start!71948 e!466033))

(assert (=> start!71948 true))

(declare-fun array_inv!17863 (array!46695) Bool)

(assert (=> start!71948 (array_inv!17863 a!4227)))

(declare-fun b!835182 () Bool)

(declare-fun res!567657 () Bool)

(assert (=> b!835182 (=> (not res!567657) (not e!466033))))

(assert (=> b!835182 (= res!567657 (validKeyInArray!0 k0!2968))))

(declare-fun bm!36554 () Bool)

(assert (=> bm!36554 (= call!36556 (arrayCountValidKeys!0 (ite c!91160 a!4227 lt!379236) (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!71948 res!567656) b!835179))

(assert (= (and b!835179 res!567653) b!835182))

(assert (= (and b!835182 res!567657) b!835180))

(assert (= (and b!835180 res!567654) b!835177))

(assert (= (and b!835177 res!567655) b!835181))

(assert (= (and b!835181 c!91160) b!835176))

(assert (= (and b!835181 (not c!91160)) b!835175))

(assert (= (or b!835176 b!835175) bm!36554))

(assert (= (or b!835176 b!835175) bm!36553))

(assert (= (and b!835181 res!567652) b!835178))

(declare-fun m!780513 () Bool)

(assert (=> b!835175 m!780513))

(declare-fun m!780515 () Bool)

(assert (=> b!835175 m!780515))

(declare-fun m!780517 () Bool)

(assert (=> bm!36554 m!780517))

(declare-fun m!780519 () Bool)

(assert (=> start!71948 m!780519))

(declare-fun m!780521 () Bool)

(assert (=> b!835178 m!780521))

(declare-fun m!780523 () Bool)

(assert (=> b!835178 m!780523))

(declare-fun m!780525 () Bool)

(assert (=> b!835177 m!780525))

(declare-fun m!780527 () Bool)

(assert (=> b!835177 m!780527))

(declare-fun m!780529 () Bool)

(assert (=> b!835177 m!780529))

(declare-fun m!780531 () Bool)

(assert (=> b!835182 m!780531))

(declare-fun m!780533 () Bool)

(assert (=> b!835181 m!780533))

(assert (=> b!835181 m!780533))

(declare-fun m!780535 () Bool)

(assert (=> b!835181 m!780535))

(declare-fun m!780537 () Bool)

(assert (=> b!835179 m!780537))

(assert (=> b!835179 m!780537))

(declare-fun m!780539 () Bool)

(assert (=> b!835179 m!780539))

(declare-fun m!780541 () Bool)

(assert (=> b!835176 m!780541))

(declare-fun m!780543 () Bool)

(assert (=> b!835176 m!780543))

(declare-fun m!780545 () Bool)

(assert (=> bm!36553 m!780545))

(check-sat (not b!835178) (not b!835181) (not bm!36554) (not b!835176) (not b!835179) (not b!835182) (not b!835175) (not bm!36553) (not start!71948) (not b!835177))
(check-sat)
