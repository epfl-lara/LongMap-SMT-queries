; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117088 () Bool)

(assert start!117088)

(declare-fun b!1378342 () Bool)

(declare-fun e!780872 () Bool)

(assert (=> b!1378342 (= e!780872 false)))

(declare-datatypes ((Unit!45590 0))(
  ( (Unit!45591) )
))
(declare-fun lt!606113 () Unit!45590)

(declare-fun e!780871 () Unit!45590)

(assert (=> b!1378342 (= lt!606113 e!780871)))

(declare-fun c!128431 () Bool)

(declare-datatypes ((array!93643 0))(
  ( (array!93644 (arr!45220 (Array (_ BitVec 32) (_ BitVec 64))) (size!45771 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93643)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378342 (= c!128431 (validKeyInArray!0 (select (arr!45220 a!4032) to!206)))))

(declare-fun b!1378343 () Bool)

(declare-fun res!920377 () Bool)

(declare-fun e!780873 () Bool)

(assert (=> b!1378343 (=> (not res!920377) (not e!780873))))

(declare-fun i!1445 () (_ BitVec 32))

(assert (=> b!1378343 (= res!920377 (validKeyInArray!0 (select (arr!45220 a!4032) i!1445)))))

(declare-fun call!65979 () (_ BitVec 32))

(declare-fun bm!65976 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93643 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65976 (= call!65979 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!606110 () array!93643)

(declare-fun bm!65977 () Bool)

(declare-fun call!65980 () (_ BitVec 32))

(assert (=> bm!65977 (= call!65980 (arrayCountValidKeys!0 lt!606110 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1378344 () Bool)

(declare-fun res!920376 () Bool)

(assert (=> b!1378344 (=> (not res!920376) (not e!780873))))

(assert (=> b!1378344 (= res!920376 (and (bvslt (size!45771 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45771 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1378345 () Bool)

(declare-fun lt!606111 () Unit!45590)

(assert (=> b!1378345 (= e!780871 lt!606111)))

(declare-fun lt!606109 () Unit!45590)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93643 (_ BitVec 32) (_ BitVec 32)) Unit!45590)

(assert (=> b!1378345 (= lt!606109 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!606107 () (_ BitVec 32))

(assert (=> b!1378345 (= call!65979 lt!606107)))

(assert (=> b!1378345 (= lt!606111 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!606110 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!606112 () (_ BitVec 32))

(assert (=> b!1378345 (= call!65980 lt!606112)))

(declare-fun b!1378346 () Bool)

(declare-fun lt!606114 () Unit!45590)

(assert (=> b!1378346 (= e!780871 lt!606114)))

(declare-fun lt!606108 () Unit!45590)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93643 (_ BitVec 32) (_ BitVec 32)) Unit!45590)

(assert (=> b!1378346 (= lt!606108 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378346 (= call!65979 (bvadd #b00000000000000000000000000000001 lt!606107))))

(assert (=> b!1378346 (= lt!606114 (lemmaValidKeyIncreasesNumOfKeys!0 lt!606110 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378346 (= call!65980 (bvadd #b00000000000000000000000000000001 lt!606112))))

(declare-fun res!920379 () Bool)

(assert (=> start!117088 (=> (not res!920379) (not e!780873))))

(assert (=> start!117088 (= res!920379 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45771 a!4032))))))

(assert (=> start!117088 e!780873))

(assert (=> start!117088 true))

(declare-fun array_inv!34501 (array!93643) Bool)

(assert (=> start!117088 (array_inv!34501 a!4032)))

(declare-fun b!1378347 () Bool)

(assert (=> b!1378347 (= e!780873 e!780872)))

(declare-fun res!920375 () Bool)

(assert (=> b!1378347 (=> (not res!920375) (not e!780872))))

(assert (=> b!1378347 (= res!920375 (and (= lt!606112 lt!606107) (not (= to!206 (size!45771 a!4032)))))))

(assert (=> b!1378347 (= lt!606107 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378347 (= lt!606112 (arrayCountValidKeys!0 lt!606110 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1378347 (= lt!606110 (array!93644 (store (arr!45220 a!4032) i!1445 k0!2947) (size!45771 a!4032)))))

(declare-fun b!1378348 () Bool)

(declare-fun res!920378 () Bool)

(assert (=> b!1378348 (=> (not res!920378) (not e!780873))))

(assert (=> b!1378348 (= res!920378 (not (validKeyInArray!0 k0!2947)))))

(assert (= (and start!117088 res!920379) b!1378343))

(assert (= (and b!1378343 res!920377) b!1378348))

(assert (= (and b!1378348 res!920378) b!1378344))

(assert (= (and b!1378344 res!920376) b!1378347))

(assert (= (and b!1378347 res!920375) b!1378342))

(assert (= (and b!1378342 c!128431) b!1378346))

(assert (= (and b!1378342 (not c!128431)) b!1378345))

(assert (= (or b!1378346 b!1378345) bm!65976))

(assert (= (or b!1378346 b!1378345) bm!65977))

(declare-fun m!1262841 () Bool)

(assert (=> bm!65976 m!1262841))

(declare-fun m!1262843 () Bool)

(assert (=> start!117088 m!1262843))

(declare-fun m!1262845 () Bool)

(assert (=> b!1378347 m!1262845))

(declare-fun m!1262847 () Bool)

(assert (=> b!1378347 m!1262847))

(declare-fun m!1262849 () Bool)

(assert (=> b!1378347 m!1262849))

(declare-fun m!1262851 () Bool)

(assert (=> b!1378343 m!1262851))

(assert (=> b!1378343 m!1262851))

(declare-fun m!1262853 () Bool)

(assert (=> b!1378343 m!1262853))

(declare-fun m!1262855 () Bool)

(assert (=> b!1378345 m!1262855))

(declare-fun m!1262857 () Bool)

(assert (=> b!1378345 m!1262857))

(declare-fun m!1262859 () Bool)

(assert (=> b!1378346 m!1262859))

(declare-fun m!1262861 () Bool)

(assert (=> b!1378346 m!1262861))

(declare-fun m!1262863 () Bool)

(assert (=> bm!65977 m!1262863))

(declare-fun m!1262865 () Bool)

(assert (=> b!1378342 m!1262865))

(assert (=> b!1378342 m!1262865))

(declare-fun m!1262867 () Bool)

(assert (=> b!1378342 m!1262867))

(declare-fun m!1262869 () Bool)

(assert (=> b!1378348 m!1262869))

(check-sat (not bm!65976) (not start!117088) (not b!1378348) (not b!1378346) (not b!1378345) (not b!1378343) (not bm!65977) (not b!1378347) (not b!1378342))
(check-sat)
