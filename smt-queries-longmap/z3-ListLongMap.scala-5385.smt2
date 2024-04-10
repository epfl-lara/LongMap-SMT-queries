; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71910 () Bool)

(assert start!71910)

(declare-fun b!835592 () Bool)

(declare-datatypes ((Unit!28733 0))(
  ( (Unit!28734) )
))
(declare-fun e!466140 () Unit!28733)

(declare-fun lt!379812 () Unit!28733)

(assert (=> b!835592 (= e!466140 lt!379812)))

(declare-datatypes ((array!46820 0))(
  ( (array!46821 (arr!22444 (Array (_ BitVec 32) (_ BitVec 64))) (size!22865 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46820)

(declare-fun lt!379813 () Unit!28733)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46820 (_ BitVec 32) (_ BitVec 32)) Unit!28733)

(assert (=> b!835592 (= lt!379813 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36680 () (_ BitVec 32))

(declare-fun lt!379814 () (_ BitVec 32))

(assert (=> b!835592 (= call!36680 (bvadd #b00000000000000000000000000000001 lt!379814))))

(declare-fun lt!379815 () array!46820)

(assert (=> b!835592 (= lt!379812 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379815 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36679 () (_ BitVec 32))

(declare-fun lt!379816 () (_ BitVec 32))

(assert (=> b!835592 (= call!36679 (bvadd #b00000000000000000000000000000001 lt!379816))))

(declare-fun bm!36676 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46820 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36676 (= call!36679 (arrayCountValidKeys!0 lt!379815 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835593 () Bool)

(declare-fun res!568454 () Bool)

(declare-fun e!466138 () Bool)

(assert (=> b!835593 (=> (not res!568454) (not e!466138))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835593 (= res!568454 (validKeyInArray!0 k0!2968))))

(declare-fun b!835594 () Bool)

(declare-fun res!568453 () Bool)

(assert (=> b!835594 (=> (not res!568453) (not e!466138))))

(assert (=> b!835594 (= res!568453 (and (bvslt (size!22865 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22865 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835595 () Bool)

(declare-fun e!466139 () Bool)

(assert (=> b!835595 (= e!466139 false)))

(declare-fun lt!379811 () Unit!28733)

(assert (=> b!835595 (= lt!379811 e!466140)))

(declare-fun c!90965 () Bool)

(assert (=> b!835595 (= c!90965 (validKeyInArray!0 (select (arr!22444 a!4227) to!390)))))

(declare-fun b!835596 () Bool)

(declare-fun res!568457 () Bool)

(assert (=> b!835596 (=> (not res!568457) (not e!466138))))

(assert (=> b!835596 (= res!568457 (not (validKeyInArray!0 (select (arr!22444 a!4227) i!1466))))))

(declare-fun b!835597 () Bool)

(assert (=> b!835597 (= e!466138 e!466139)))

(declare-fun res!568456 () Bool)

(assert (=> b!835597 (=> (not res!568456) (not e!466139))))

(assert (=> b!835597 (= res!568456 (and (= lt!379816 lt!379814) (not (= to!390 (size!22865 a!4227)))))))

(assert (=> b!835597 (= lt!379814 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835597 (= lt!379816 (arrayCountValidKeys!0 lt!379815 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835597 (= lt!379815 (array!46821 (store (arr!22444 a!4227) i!1466 k0!2968) (size!22865 a!4227)))))

(declare-fun res!568455 () Bool)

(assert (=> start!71910 (=> (not res!568455) (not e!466138))))

(assert (=> start!71910 (= res!568455 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22865 a!4227))))))

(assert (=> start!71910 e!466138))

(assert (=> start!71910 true))

(declare-fun array_inv!17891 (array!46820) Bool)

(assert (=> start!71910 (array_inv!17891 a!4227)))

(declare-fun bm!36677 () Bool)

(assert (=> bm!36677 (= call!36680 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835598 () Bool)

(declare-fun lt!379810 () Unit!28733)

(assert (=> b!835598 (= e!466140 lt!379810)))

(declare-fun lt!379809 () Unit!28733)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46820 (_ BitVec 32) (_ BitVec 32)) Unit!28733)

(assert (=> b!835598 (= lt!379809 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835598 (= call!36680 lt!379814)))

(assert (=> b!835598 (= lt!379810 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379815 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835598 (= call!36679 lt!379816)))

(assert (= (and start!71910 res!568455) b!835596))

(assert (= (and b!835596 res!568457) b!835593))

(assert (= (and b!835593 res!568454) b!835594))

(assert (= (and b!835594 res!568453) b!835597))

(assert (= (and b!835597 res!568456) b!835595))

(assert (= (and b!835595 c!90965) b!835592))

(assert (= (and b!835595 (not c!90965)) b!835598))

(assert (= (or b!835592 b!835598) bm!36677))

(assert (= (or b!835592 b!835598) bm!36676))

(declare-fun m!780795 () Bool)

(assert (=> b!835593 m!780795))

(declare-fun m!780797 () Bool)

(assert (=> start!71910 m!780797))

(declare-fun m!780799 () Bool)

(assert (=> b!835597 m!780799))

(declare-fun m!780801 () Bool)

(assert (=> b!835597 m!780801))

(declare-fun m!780803 () Bool)

(assert (=> b!835597 m!780803))

(declare-fun m!780805 () Bool)

(assert (=> bm!36677 m!780805))

(declare-fun m!780807 () Bool)

(assert (=> b!835592 m!780807))

(declare-fun m!780809 () Bool)

(assert (=> b!835592 m!780809))

(declare-fun m!780811 () Bool)

(assert (=> b!835598 m!780811))

(declare-fun m!780813 () Bool)

(assert (=> b!835598 m!780813))

(declare-fun m!780815 () Bool)

(assert (=> bm!36676 m!780815))

(declare-fun m!780817 () Bool)

(assert (=> b!835596 m!780817))

(assert (=> b!835596 m!780817))

(declare-fun m!780819 () Bool)

(assert (=> b!835596 m!780819))

(declare-fun m!780821 () Bool)

(assert (=> b!835595 m!780821))

(assert (=> b!835595 m!780821))

(declare-fun m!780823 () Bool)

(assert (=> b!835595 m!780823))

(check-sat (not bm!36676) (not b!835596) (not b!835598) (not start!71910) (not b!835597) (not bm!36677) (not b!835595) (not b!835592) (not b!835593))
(check-sat)
