; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116740 () Bool)

(assert start!116740)

(declare-fun res!918839 () Bool)

(declare-fun e!779440 () Bool)

(assert (=> start!116740 (=> (not res!918839) (not e!779440))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93363 0))(
  ( (array!93364 (arr!45085 (Array (_ BitVec 32) (_ BitVec 64))) (size!45637 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93363)

(assert (=> start!116740 (= res!918839 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45637 a!4032))))))

(assert (=> start!116740 e!779440))

(assert (=> start!116740 true))

(declare-fun array_inv!34318 (array!93363) Bool)

(assert (=> start!116740 (array_inv!34318 a!4032)))

(declare-fun b!1375846 () Bool)

(declare-datatypes ((Unit!45426 0))(
  ( (Unit!45427) )
))
(declare-fun e!779436 () Unit!45426)

(declare-fun lt!604766 () Unit!45426)

(assert (=> b!1375846 (= e!779436 lt!604766)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!604761 () Unit!45426)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93363 (_ BitVec 32) (_ BitVec 32)) Unit!45426)

(assert (=> b!1375846 (= lt!604761 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65769 () (_ BitVec 32))

(declare-fun lt!604762 () (_ BitVec 32))

(assert (=> b!1375846 (= call!65769 lt!604762)))

(declare-fun lt!604769 () array!93363)

(assert (=> b!1375846 (= lt!604766 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604769 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65768 () (_ BitVec 32))

(declare-fun lt!604768 () (_ BitVec 32))

(assert (=> b!1375846 (= call!65768 lt!604768)))

(declare-fun b!1375847 () Bool)

(declare-fun e!779438 () Bool)

(declare-fun e!779439 () Bool)

(assert (=> b!1375847 (= e!779438 e!779439)))

(declare-fun res!918834 () Bool)

(assert (=> b!1375847 (=> (not res!918834) (not e!779439))))

(assert (=> b!1375847 (= res!918834 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45637 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604765 () Unit!45426)

(assert (=> b!1375847 (= lt!604765 e!779436)))

(declare-fun c!127949 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375847 (= c!127949 (validKeyInArray!0 (select (arr!45085 a!4032) to!206)))))

(declare-fun b!1375848 () Bool)

(declare-fun res!918835 () Bool)

(assert (=> b!1375848 (=> (not res!918835) (not e!779440))))

(assert (=> b!1375848 (= res!918835 (validKeyInArray!0 (select (arr!45085 a!4032) i!1445)))))

(declare-fun b!1375849 () Bool)

(declare-fun lt!604763 () Unit!45426)

(assert (=> b!1375849 (= e!779436 lt!604763)))

(declare-fun lt!604767 () Unit!45426)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93363 (_ BitVec 32) (_ BitVec 32)) Unit!45426)

(assert (=> b!1375849 (= lt!604767 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375849 (= call!65769 (bvadd #b00000000000000000000000000000001 lt!604762))))

(assert (=> b!1375849 (= lt!604763 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604769 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375849 (= call!65768 (bvadd #b00000000000000000000000000000001 lt!604768))))

(declare-fun bm!65765 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93363 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65765 (= call!65769 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65766 () Bool)

(assert (=> bm!65766 (= call!65768 (arrayCountValidKeys!0 lt!604769 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375850 () Bool)

(declare-fun res!918833 () Bool)

(assert (=> b!1375850 (=> (not res!918833) (not e!779440))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375850 (= res!918833 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1375851 () Bool)

(declare-fun res!918838 () Bool)

(assert (=> b!1375851 (=> (not res!918838) (not e!779439))))

(assert (=> b!1375851 (= res!918838 (= (arrayCountValidKeys!0 lt!604769 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1375852 () Bool)

(declare-fun res!918836 () Bool)

(assert (=> b!1375852 (=> (not res!918836) (not e!779440))))

(assert (=> b!1375852 (= res!918836 (and (bvslt (size!45637 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45637 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375853 () Bool)

(assert (=> b!1375853 (= e!779440 e!779438)))

(declare-fun res!918837 () Bool)

(assert (=> b!1375853 (=> (not res!918837) (not e!779438))))

(assert (=> b!1375853 (= res!918837 (and (= lt!604768 lt!604762) (not (= to!206 (size!45637 a!4032)))))))

(assert (=> b!1375853 (= lt!604762 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375853 (= lt!604768 (arrayCountValidKeys!0 lt!604769 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375853 (= lt!604769 (array!93364 (store (arr!45085 a!4032) i!1445 k0!2947) (size!45637 a!4032)))))

(declare-fun b!1375854 () Bool)

(assert (=> b!1375854 (= e!779439 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (=> b!1375854 (= (arrayCountValidKeys!0 lt!604769 (bvadd #b00000000000000000000000000000001 i!1445) (size!45637 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45637 a!4032)))))

(declare-fun lt!604764 () Unit!45426)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93363 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45426)

(assert (=> b!1375854 (= lt!604764 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116740 res!918839) b!1375848))

(assert (= (and b!1375848 res!918835) b!1375850))

(assert (= (and b!1375850 res!918833) b!1375852))

(assert (= (and b!1375852 res!918836) b!1375853))

(assert (= (and b!1375853 res!918837) b!1375847))

(assert (= (and b!1375847 c!127949) b!1375849))

(assert (= (and b!1375847 (not c!127949)) b!1375846))

(assert (= (or b!1375849 b!1375846) bm!65765))

(assert (= (or b!1375849 b!1375846) bm!65766))

(assert (= (and b!1375847 res!918834) b!1375851))

(assert (= (and b!1375851 res!918838) b!1375854))

(declare-fun m!1259353 () Bool)

(assert (=> start!116740 m!1259353))

(declare-fun m!1259355 () Bool)

(assert (=> b!1375848 m!1259355))

(assert (=> b!1375848 m!1259355))

(declare-fun m!1259357 () Bool)

(assert (=> b!1375848 m!1259357))

(declare-fun m!1259359 () Bool)

(assert (=> bm!65766 m!1259359))

(declare-fun m!1259361 () Bool)

(assert (=> b!1375849 m!1259361))

(declare-fun m!1259363 () Bool)

(assert (=> b!1375849 m!1259363))

(declare-fun m!1259365 () Bool)

(assert (=> bm!65765 m!1259365))

(declare-fun m!1259367 () Bool)

(assert (=> b!1375853 m!1259367))

(declare-fun m!1259369 () Bool)

(assert (=> b!1375853 m!1259369))

(declare-fun m!1259371 () Bool)

(assert (=> b!1375853 m!1259371))

(declare-fun m!1259373 () Bool)

(assert (=> b!1375854 m!1259373))

(declare-fun m!1259375 () Bool)

(assert (=> b!1375854 m!1259375))

(declare-fun m!1259377 () Bool)

(assert (=> b!1375854 m!1259377))

(declare-fun m!1259379 () Bool)

(assert (=> b!1375850 m!1259379))

(declare-fun m!1259381 () Bool)

(assert (=> b!1375847 m!1259381))

(assert (=> b!1375847 m!1259381))

(declare-fun m!1259383 () Bool)

(assert (=> b!1375847 m!1259383))

(assert (=> b!1375851 m!1259359))

(assert (=> b!1375851 m!1259365))

(declare-fun m!1259385 () Bool)

(assert (=> b!1375846 m!1259385))

(declare-fun m!1259387 () Bool)

(assert (=> b!1375846 m!1259387))

(check-sat (not b!1375853) (not b!1375854) (not b!1375849) (not start!116740) (not b!1375850) (not bm!65766) (not b!1375851) (not b!1375848) (not b!1375846) (not b!1375847) (not bm!65765))
(check-sat)
