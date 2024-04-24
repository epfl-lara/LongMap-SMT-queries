; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116950 () Bool)

(assert start!116950)

(declare-fun b!1376931 () Bool)

(declare-fun e!780139 () Bool)

(declare-fun e!780135 () Bool)

(assert (=> b!1376931 (= e!780139 e!780135)))

(declare-fun res!919163 () Bool)

(assert (=> b!1376931 (=> (not res!919163) (not e!780135))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93505 0))(
  ( (array!93506 (arr!45151 (Array (_ BitVec 32) (_ BitVec 64))) (size!45702 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93505)

(assert (=> b!1376931 (= res!919163 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45702 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45500 0))(
  ( (Unit!45501) )
))
(declare-fun lt!605069 () Unit!45500)

(declare-fun e!780137 () Unit!45500)

(assert (=> b!1376931 (= lt!605069 e!780137)))

(declare-fun c!128332 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376931 (= c!128332 (validKeyInArray!0 (select (arr!45151 a!4032) to!206)))))

(declare-fun b!1376932 () Bool)

(declare-fun lt!605075 () Unit!45500)

(assert (=> b!1376932 (= e!780137 lt!605075)))

(declare-fun lt!605071 () Unit!45500)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93505 (_ BitVec 32) (_ BitVec 32)) Unit!45500)

(assert (=> b!1376932 (= lt!605071 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65781 () (_ BitVec 32))

(declare-fun lt!605068 () (_ BitVec 32))

(assert (=> b!1376932 (= call!65781 (bvadd #b00000000000000000000000000000001 lt!605068))))

(declare-fun lt!605076 () array!93505)

(assert (=> b!1376932 (= lt!605075 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605076 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65782 () (_ BitVec 32))

(declare-fun lt!605070 () (_ BitVec 32))

(assert (=> b!1376932 (= call!65782 (bvadd #b00000000000000000000000000000001 lt!605070))))

(declare-fun b!1376933 () Bool)

(declare-fun res!919164 () Bool)

(declare-fun e!780138 () Bool)

(assert (=> b!1376933 (=> (not res!919164) (not e!780138))))

(assert (=> b!1376933 (= res!919164 (and (bvslt (size!45702 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45702 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun bm!65778 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93505 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65778 (= call!65782 (arrayCountValidKeys!0 lt!605076 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376934 () Bool)

(assert (=> b!1376934 (= e!780135 false)))

(declare-fun lt!605072 () (_ BitVec 32))

(assert (=> b!1376934 (= lt!605072 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!605073 () (_ BitVec 32))

(assert (=> b!1376934 (= lt!605073 (arrayCountValidKeys!0 lt!605076 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376935 () Bool)

(declare-fun res!919162 () Bool)

(assert (=> b!1376935 (=> (not res!919162) (not e!780138))))

(assert (=> b!1376935 (= res!919162 (validKeyInArray!0 (select (arr!45151 a!4032) i!1445)))))

(declare-fun bm!65779 () Bool)

(assert (=> bm!65779 (= call!65781 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376936 () Bool)

(declare-fun res!919167 () Bool)

(assert (=> b!1376936 (=> (not res!919167) (not e!780138))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376936 (= res!919167 (not (validKeyInArray!0 k0!2947)))))

(declare-fun res!919165 () Bool)

(assert (=> start!116950 (=> (not res!919165) (not e!780138))))

(assert (=> start!116950 (= res!919165 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45702 a!4032))))))

(assert (=> start!116950 e!780138))

(assert (=> start!116950 true))

(declare-fun array_inv!34432 (array!93505) Bool)

(assert (=> start!116950 (array_inv!34432 a!4032)))

(declare-fun b!1376937 () Bool)

(assert (=> b!1376937 (= e!780138 e!780139)))

(declare-fun res!919166 () Bool)

(assert (=> b!1376937 (=> (not res!919166) (not e!780139))))

(assert (=> b!1376937 (= res!919166 (and (= lt!605070 lt!605068) (not (= to!206 (size!45702 a!4032)))))))

(assert (=> b!1376937 (= lt!605068 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376937 (= lt!605070 (arrayCountValidKeys!0 lt!605076 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376937 (= lt!605076 (array!93506 (store (arr!45151 a!4032) i!1445 k0!2947) (size!45702 a!4032)))))

(declare-fun b!1376938 () Bool)

(declare-fun lt!605067 () Unit!45500)

(assert (=> b!1376938 (= e!780137 lt!605067)))

(declare-fun lt!605074 () Unit!45500)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93505 (_ BitVec 32) (_ BitVec 32)) Unit!45500)

(assert (=> b!1376938 (= lt!605074 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376938 (= call!65781 lt!605068)))

(assert (=> b!1376938 (= lt!605067 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605076 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376938 (= call!65782 lt!605070)))

(assert (= (and start!116950 res!919165) b!1376935))

(assert (= (and b!1376935 res!919162) b!1376936))

(assert (= (and b!1376936 res!919167) b!1376933))

(assert (= (and b!1376933 res!919164) b!1376937))

(assert (= (and b!1376937 res!919166) b!1376931))

(assert (= (and b!1376931 c!128332) b!1376932))

(assert (= (and b!1376931 (not c!128332)) b!1376938))

(assert (= (or b!1376932 b!1376938) bm!65779))

(assert (= (or b!1376932 b!1376938) bm!65778))

(assert (= (and b!1376931 res!919163) b!1376934))

(declare-fun m!1261119 () Bool)

(assert (=> b!1376937 m!1261119))

(declare-fun m!1261121 () Bool)

(assert (=> b!1376937 m!1261121))

(declare-fun m!1261123 () Bool)

(assert (=> b!1376937 m!1261123))

(declare-fun m!1261125 () Bool)

(assert (=> b!1376932 m!1261125))

(declare-fun m!1261127 () Bool)

(assert (=> b!1376932 m!1261127))

(declare-fun m!1261129 () Bool)

(assert (=> b!1376938 m!1261129))

(declare-fun m!1261131 () Bool)

(assert (=> b!1376938 m!1261131))

(declare-fun m!1261133 () Bool)

(assert (=> start!116950 m!1261133))

(declare-fun m!1261135 () Bool)

(assert (=> b!1376934 m!1261135))

(declare-fun m!1261137 () Bool)

(assert (=> b!1376934 m!1261137))

(declare-fun m!1261139 () Bool)

(assert (=> b!1376936 m!1261139))

(declare-fun m!1261141 () Bool)

(assert (=> b!1376931 m!1261141))

(assert (=> b!1376931 m!1261141))

(declare-fun m!1261143 () Bool)

(assert (=> b!1376931 m!1261143))

(assert (=> bm!65779 m!1261135))

(declare-fun m!1261145 () Bool)

(assert (=> b!1376935 m!1261145))

(assert (=> b!1376935 m!1261145))

(declare-fun m!1261147 () Bool)

(assert (=> b!1376935 m!1261147))

(assert (=> bm!65778 m!1261137))

(check-sat (not b!1376935) (not b!1376936) (not bm!65779) (not b!1376932) (not b!1376931) (not b!1376934) (not b!1376937) (not b!1376938) (not start!116950) (not bm!65778))
(check-sat)
