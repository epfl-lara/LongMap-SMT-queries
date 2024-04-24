; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72110 () Bool)

(assert start!72110)

(declare-fun res!569091 () Bool)

(declare-fun e!466943 () Bool)

(assert (=> start!72110 (=> (not res!569091) (not e!466943))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46857 0))(
  ( (array!46858 (arr!22458 (Array (_ BitVec 32) (_ BitVec 64))) (size!22878 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46857)

(assert (=> start!72110 (= res!569091 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22878 a!4227))))))

(assert (=> start!72110 e!466943))

(assert (=> start!72110 true))

(declare-fun array_inv!17944 (array!46857) Bool)

(assert (=> start!72110 (array_inv!17944 a!4227)))

(declare-fun b!836878 () Bool)

(declare-fun e!466941 () Bool)

(assert (=> b!836878 (= e!466941 (not true))))

(declare-fun lt!380579 () array!46857)

(declare-fun arrayCountValidKeys!0 (array!46857 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836878 (= (arrayCountValidKeys!0 lt!380579 (bvadd #b00000000000000000000000000000001 i!1466) (size!22878 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22878 a!4227)))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun to!390 () (_ BitVec 32))

(declare-datatypes ((Unit!28780 0))(
  ( (Unit!28781) )
))
(declare-fun lt!380583 () Unit!28780)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28780)

(assert (=> b!836878 (= lt!380583 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun bm!36823 () Bool)

(declare-fun call!36826 () (_ BitVec 32))

(assert (=> bm!36823 (= call!36826 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836879 () Bool)

(declare-fun res!569085 () Bool)

(assert (=> b!836879 (=> (not res!569085) (not e!466941))))

(assert (=> b!836879 (= res!569085 (= (arrayCountValidKeys!0 lt!380579 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!836880 () Bool)

(declare-fun e!466944 () Bool)

(assert (=> b!836880 (= e!466944 e!466941)))

(declare-fun res!569088 () Bool)

(assert (=> b!836880 (=> (not res!569088) (not e!466941))))

(assert (=> b!836880 (= res!569088 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22878 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!380581 () Unit!28780)

(declare-fun e!466945 () Unit!28780)

(assert (=> b!836880 (= lt!380581 e!466945)))

(declare-fun c!91295 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836880 (= c!91295 (validKeyInArray!0 (select (arr!22458 a!4227) to!390)))))

(declare-fun b!836881 () Bool)

(declare-fun res!569089 () Bool)

(assert (=> b!836881 (=> (not res!569089) (not e!466943))))

(assert (=> b!836881 (= res!569089 (not (validKeyInArray!0 (select (arr!22458 a!4227) i!1466))))))

(declare-fun b!836882 () Bool)

(declare-fun res!569087 () Bool)

(assert (=> b!836882 (=> (not res!569087) (not e!466943))))

(assert (=> b!836882 (= res!569087 (validKeyInArray!0 k0!2968))))

(declare-fun call!36827 () (_ BitVec 32))

(declare-fun bm!36824 () Bool)

(assert (=> bm!36824 (= call!36827 (arrayCountValidKeys!0 lt!380579 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836883 () Bool)

(declare-fun lt!380577 () Unit!28780)

(assert (=> b!836883 (= e!466945 lt!380577)))

(declare-fun lt!380578 () Unit!28780)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46857 (_ BitVec 32) (_ BitVec 32)) Unit!28780)

(assert (=> b!836883 (= lt!380578 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380585 () (_ BitVec 32))

(assert (=> b!836883 (= call!36826 lt!380585)))

(assert (=> b!836883 (= lt!380577 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380579 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380584 () (_ BitVec 32))

(assert (=> b!836883 (= call!36827 lt!380584)))

(declare-fun b!836884 () Bool)

(assert (=> b!836884 (= e!466943 e!466944)))

(declare-fun res!569090 () Bool)

(assert (=> b!836884 (=> (not res!569090) (not e!466944))))

(assert (=> b!836884 (= res!569090 (and (= lt!380584 lt!380585) (not (= to!390 (size!22878 a!4227)))))))

(assert (=> b!836884 (= lt!380585 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836884 (= lt!380584 (arrayCountValidKeys!0 lt!380579 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836884 (= lt!380579 (array!46858 (store (arr!22458 a!4227) i!1466 k0!2968) (size!22878 a!4227)))))

(declare-fun b!836885 () Bool)

(declare-fun res!569086 () Bool)

(assert (=> b!836885 (=> (not res!569086) (not e!466943))))

(assert (=> b!836885 (= res!569086 (and (bvslt (size!22878 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22878 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836886 () Bool)

(declare-fun lt!380580 () Unit!28780)

(assert (=> b!836886 (= e!466945 lt!380580)))

(declare-fun lt!380582 () Unit!28780)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46857 (_ BitVec 32) (_ BitVec 32)) Unit!28780)

(assert (=> b!836886 (= lt!380582 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836886 (= call!36826 (bvadd #b00000000000000000000000000000001 lt!380585))))

(assert (=> b!836886 (= lt!380580 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380579 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836886 (= call!36827 (bvadd #b00000000000000000000000000000001 lt!380584))))

(assert (= (and start!72110 res!569091) b!836881))

(assert (= (and b!836881 res!569089) b!836882))

(assert (= (and b!836882 res!569087) b!836885))

(assert (= (and b!836885 res!569086) b!836884))

(assert (= (and b!836884 res!569090) b!836880))

(assert (= (and b!836880 c!91295) b!836886))

(assert (= (and b!836880 (not c!91295)) b!836883))

(assert (= (or b!836886 b!836883) bm!36824))

(assert (= (or b!836886 b!836883) bm!36823))

(assert (= (and b!836880 res!569088) b!836879))

(assert (= (and b!836879 res!569085) b!836878))

(declare-fun m!782599 () Bool)

(assert (=> b!836878 m!782599))

(declare-fun m!782601 () Bool)

(assert (=> b!836878 m!782601))

(declare-fun m!782603 () Bool)

(assert (=> b!836878 m!782603))

(declare-fun m!782605 () Bool)

(assert (=> b!836884 m!782605))

(declare-fun m!782607 () Bool)

(assert (=> b!836884 m!782607))

(declare-fun m!782609 () Bool)

(assert (=> b!836884 m!782609))

(declare-fun m!782611 () Bool)

(assert (=> b!836886 m!782611))

(declare-fun m!782613 () Bool)

(assert (=> b!836886 m!782613))

(declare-fun m!782615 () Bool)

(assert (=> bm!36824 m!782615))

(declare-fun m!782617 () Bool)

(assert (=> start!72110 m!782617))

(declare-fun m!782619 () Bool)

(assert (=> b!836881 m!782619))

(assert (=> b!836881 m!782619))

(declare-fun m!782621 () Bool)

(assert (=> b!836881 m!782621))

(declare-fun m!782623 () Bool)

(assert (=> b!836883 m!782623))

(declare-fun m!782625 () Bool)

(assert (=> b!836883 m!782625))

(assert (=> b!836879 m!782615))

(declare-fun m!782627 () Bool)

(assert (=> b!836879 m!782627))

(declare-fun m!782629 () Bool)

(assert (=> b!836882 m!782629))

(declare-fun m!782631 () Bool)

(assert (=> b!836880 m!782631))

(assert (=> b!836880 m!782631))

(declare-fun m!782633 () Bool)

(assert (=> b!836880 m!782633))

(assert (=> bm!36823 m!782627))

(check-sat (not b!836884) (not start!72110) (not b!836879) (not bm!36823) (not b!836886) (not bm!36824) (not b!836883) (not b!836878) (not b!836880) (not b!836882) (not b!836881))
(check-sat)
