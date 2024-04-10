; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116746 () Bool)

(assert start!116746)

(declare-fun b!1375934 () Bool)

(declare-fun res!918886 () Bool)

(declare-fun e!779478 () Bool)

(assert (=> b!1375934 (=> (not res!918886) (not e!779478))))

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93415 0))(
  ( (array!93416 (arr!45111 (Array (_ BitVec 32) (_ BitVec 64))) (size!45661 (_ BitVec 32))) )
))
(declare-fun lt!604973 () array!93415)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun a!4032 () array!93415)

(declare-fun arrayCountValidKeys!0 (array!93415 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375934 (= res!918886 (= (arrayCountValidKeys!0 lt!604973 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1375935 () Bool)

(declare-datatypes ((Unit!45587 0))(
  ( (Unit!45588) )
))
(declare-fun e!779481 () Unit!45587)

(declare-fun lt!604976 () Unit!45587)

(assert (=> b!1375935 (= e!779481 lt!604976)))

(declare-fun lt!604972 () Unit!45587)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93415 (_ BitVec 32) (_ BitVec 32)) Unit!45587)

(assert (=> b!1375935 (= lt!604972 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65791 () (_ BitVec 32))

(declare-fun lt!604978 () (_ BitVec 32))

(assert (=> b!1375935 (= call!65791 lt!604978)))

(assert (=> b!1375935 (= lt!604976 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604973 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65792 () (_ BitVec 32))

(declare-fun lt!604974 () (_ BitVec 32))

(assert (=> b!1375935 (= call!65792 lt!604974)))

(declare-fun b!1375936 () Bool)

(declare-fun e!779479 () Bool)

(assert (=> b!1375936 (= e!779479 e!779478)))

(declare-fun res!918883 () Bool)

(assert (=> b!1375936 (=> (not res!918883) (not e!779478))))

(assert (=> b!1375936 (= res!918883 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45661 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604971 () Unit!45587)

(assert (=> b!1375936 (= lt!604971 e!779481)))

(declare-fun c!127967 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375936 (= c!127967 (validKeyInArray!0 (select (arr!45111 a!4032) to!206)))))

(declare-fun bm!65788 () Bool)

(assert (=> bm!65788 (= call!65791 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375937 () Bool)

(declare-fun res!918884 () Bool)

(declare-fun e!779480 () Bool)

(assert (=> b!1375937 (=> (not res!918884) (not e!779480))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375937 (= res!918884 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1375939 () Bool)

(assert (=> b!1375939 (= e!779478 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (=> b!1375939 (= (arrayCountValidKeys!0 lt!604973 (bvadd #b00000000000000000000000000000001 i!1445) (size!45661 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45661 a!4032)))))

(declare-fun lt!604970 () Unit!45587)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93415 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45587)

(assert (=> b!1375939 (= lt!604970 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375940 () Bool)

(declare-fun lt!604977 () Unit!45587)

(assert (=> b!1375940 (= e!779481 lt!604977)))

(declare-fun lt!604975 () Unit!45587)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93415 (_ BitVec 32) (_ BitVec 32)) Unit!45587)

(assert (=> b!1375940 (= lt!604975 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375940 (= call!65791 (bvadd #b00000000000000000000000000000001 lt!604978))))

(assert (=> b!1375940 (= lt!604977 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604973 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375940 (= call!65792 (bvadd #b00000000000000000000000000000001 lt!604974))))

(declare-fun b!1375941 () Bool)

(declare-fun res!918881 () Bool)

(assert (=> b!1375941 (=> (not res!918881) (not e!779480))))

(assert (=> b!1375941 (= res!918881 (and (bvslt (size!45661 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45661 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375938 () Bool)

(declare-fun res!918882 () Bool)

(assert (=> b!1375938 (=> (not res!918882) (not e!779480))))

(assert (=> b!1375938 (= res!918882 (validKeyInArray!0 (select (arr!45111 a!4032) i!1445)))))

(declare-fun res!918880 () Bool)

(assert (=> start!116746 (=> (not res!918880) (not e!779480))))

(assert (=> start!116746 (= res!918880 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45661 a!4032))))))

(assert (=> start!116746 e!779480))

(assert (=> start!116746 true))

(declare-fun array_inv!34139 (array!93415) Bool)

(assert (=> start!116746 (array_inv!34139 a!4032)))

(declare-fun bm!65789 () Bool)

(assert (=> bm!65789 (= call!65792 (arrayCountValidKeys!0 lt!604973 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375942 () Bool)

(assert (=> b!1375942 (= e!779480 e!779479)))

(declare-fun res!918885 () Bool)

(assert (=> b!1375942 (=> (not res!918885) (not e!779479))))

(assert (=> b!1375942 (= res!918885 (and (= lt!604974 lt!604978) (not (= to!206 (size!45661 a!4032)))))))

(assert (=> b!1375942 (= lt!604978 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375942 (= lt!604974 (arrayCountValidKeys!0 lt!604973 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375942 (= lt!604973 (array!93416 (store (arr!45111 a!4032) i!1445 k0!2947) (size!45661 a!4032)))))

(assert (= (and start!116746 res!918880) b!1375938))

(assert (= (and b!1375938 res!918882) b!1375937))

(assert (= (and b!1375937 res!918884) b!1375941))

(assert (= (and b!1375941 res!918881) b!1375942))

(assert (= (and b!1375942 res!918885) b!1375936))

(assert (= (and b!1375936 c!127967) b!1375940))

(assert (= (and b!1375936 (not c!127967)) b!1375935))

(assert (= (or b!1375940 b!1375935) bm!65789))

(assert (= (or b!1375940 b!1375935) bm!65788))

(assert (= (and b!1375936 res!918883) b!1375934))

(assert (= (and b!1375934 res!918886) b!1375939))

(declare-fun m!1259887 () Bool)

(assert (=> bm!65789 m!1259887))

(declare-fun m!1259889 () Bool)

(assert (=> b!1375938 m!1259889))

(assert (=> b!1375938 m!1259889))

(declare-fun m!1259891 () Bool)

(assert (=> b!1375938 m!1259891))

(declare-fun m!1259893 () Bool)

(assert (=> b!1375940 m!1259893))

(declare-fun m!1259895 () Bool)

(assert (=> b!1375940 m!1259895))

(declare-fun m!1259897 () Bool)

(assert (=> b!1375935 m!1259897))

(declare-fun m!1259899 () Bool)

(assert (=> b!1375935 m!1259899))

(assert (=> b!1375934 m!1259887))

(declare-fun m!1259901 () Bool)

(assert (=> b!1375934 m!1259901))

(declare-fun m!1259903 () Bool)

(assert (=> b!1375936 m!1259903))

(assert (=> b!1375936 m!1259903))

(declare-fun m!1259905 () Bool)

(assert (=> b!1375936 m!1259905))

(declare-fun m!1259907 () Bool)

(assert (=> start!116746 m!1259907))

(declare-fun m!1259909 () Bool)

(assert (=> b!1375942 m!1259909))

(declare-fun m!1259911 () Bool)

(assert (=> b!1375942 m!1259911))

(declare-fun m!1259913 () Bool)

(assert (=> b!1375942 m!1259913))

(declare-fun m!1259915 () Bool)

(assert (=> b!1375937 m!1259915))

(assert (=> bm!65788 m!1259901))

(declare-fun m!1259917 () Bool)

(assert (=> b!1375939 m!1259917))

(declare-fun m!1259919 () Bool)

(assert (=> b!1375939 m!1259919))

(declare-fun m!1259921 () Bool)

(assert (=> b!1375939 m!1259921))

(check-sat (not b!1375937) (not b!1375936) (not b!1375934) (not b!1375939) (not bm!65789) (not b!1375938) (not b!1375935) (not b!1375942) (not start!116746) (not b!1375940) (not bm!65788))
(check-sat)
