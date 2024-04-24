; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124184 () Bool)

(assert start!124184)

(declare-fun b!1437362 () Bool)

(declare-fun res!969508 () Bool)

(declare-fun e!811257 () Bool)

(assert (=> b!1437362 (=> (not res!969508) (not e!811257))))

(declare-datatypes ((array!97768 0))(
  ( (array!97769 (arr!47179 (Array (_ BitVec 32) (_ BitVec 64))) (size!47730 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97768)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437362 (= res!969508 (validKeyInArray!0 (select (arr!47179 a!2862) i!1006)))))

(declare-fun b!1437363 () Bool)

(declare-fun res!969504 () Bool)

(assert (=> b!1437363 (=> (not res!969504) (not e!811257))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1437363 (= res!969504 (and (= (size!47730 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47730 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47730 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!969507 () Bool)

(assert (=> start!124184 (=> (not res!969507) (not e!811257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124184 (= res!969507 (validMask!0 mask!2687))))

(assert (=> start!124184 e!811257))

(assert (=> start!124184 true))

(declare-fun array_inv!36460 (array!97768) Bool)

(assert (=> start!124184 (array_inv!36460 a!2862)))

(declare-fun b!1437364 () Bool)

(declare-fun e!811259 () Bool)

(declare-datatypes ((List!33667 0))(
  ( (Nil!33664) (Cons!33663 (h!35009 (_ BitVec 64)) (t!48353 List!33667)) )
))
(declare-fun contains!9925 (List!33667 (_ BitVec 64)) Bool)

(assert (=> b!1437364 (= e!811259 (contains!9925 Nil!33664 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1437365 () Bool)

(declare-fun res!969501 () Bool)

(assert (=> b!1437365 (=> (not res!969501) (not e!811257))))

(declare-fun noDuplicate!2632 (List!33667) Bool)

(assert (=> b!1437365 (= res!969501 (noDuplicate!2632 Nil!33664))))

(declare-fun b!1437366 () Bool)

(declare-fun res!969505 () Bool)

(assert (=> b!1437366 (=> (not res!969505) (not e!811257))))

(assert (=> b!1437366 (= res!969505 (and (bvsle #b00000000000000000000000000000000 (size!47730 a!2862)) (bvslt (size!47730 a!2862) #b01111111111111111111111111111111)))))

(declare-fun b!1437367 () Bool)

(declare-fun res!969502 () Bool)

(assert (=> b!1437367 (=> (not res!969502) (not e!811257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97768 (_ BitVec 32)) Bool)

(assert (=> b!1437367 (= res!969502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437368 () Bool)

(declare-fun res!969503 () Bool)

(assert (=> b!1437368 (=> (not res!969503) (not e!811257))))

(assert (=> b!1437368 (= res!969503 (validKeyInArray!0 (select (arr!47179 a!2862) j!93)))))

(declare-fun b!1437369 () Bool)

(assert (=> b!1437369 (= e!811257 e!811259)))

(declare-fun res!969506 () Bool)

(assert (=> b!1437369 (=> res!969506 e!811259)))

(assert (=> b!1437369 (= res!969506 (contains!9925 Nil!33664 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!124184 res!969507) b!1437363))

(assert (= (and b!1437363 res!969504) b!1437362))

(assert (= (and b!1437362 res!969508) b!1437368))

(assert (= (and b!1437368 res!969503) b!1437367))

(assert (= (and b!1437367 res!969502) b!1437366))

(assert (= (and b!1437366 res!969505) b!1437365))

(assert (= (and b!1437365 res!969501) b!1437369))

(assert (= (and b!1437369 (not res!969506)) b!1437364))

(declare-fun m!1326837 () Bool)

(assert (=> b!1437367 m!1326837))

(declare-fun m!1326839 () Bool)

(assert (=> b!1437368 m!1326839))

(assert (=> b!1437368 m!1326839))

(declare-fun m!1326841 () Bool)

(assert (=> b!1437368 m!1326841))

(declare-fun m!1326843 () Bool)

(assert (=> start!124184 m!1326843))

(declare-fun m!1326845 () Bool)

(assert (=> start!124184 m!1326845))

(declare-fun m!1326847 () Bool)

(assert (=> b!1437365 m!1326847))

(declare-fun m!1326849 () Bool)

(assert (=> b!1437364 m!1326849))

(declare-fun m!1326851 () Bool)

(assert (=> b!1437369 m!1326851))

(declare-fun m!1326853 () Bool)

(assert (=> b!1437362 m!1326853))

(assert (=> b!1437362 m!1326853))

(declare-fun m!1326855 () Bool)

(assert (=> b!1437362 m!1326855))

(check-sat (not b!1437369) (not b!1437367) (not start!124184) (not b!1437362) (not b!1437364) (not b!1437368) (not b!1437365))
(check-sat)
(get-model)

(declare-fun d!154875 () Bool)

(declare-fun res!969561 () Bool)

(declare-fun e!811282 () Bool)

(assert (=> d!154875 (=> res!969561 e!811282)))

(get-info :version)

(assert (=> d!154875 (= res!969561 ((_ is Nil!33664) Nil!33664))))

(assert (=> d!154875 (= (noDuplicate!2632 Nil!33664) e!811282)))

(declare-fun b!1437422 () Bool)

(declare-fun e!811283 () Bool)

(assert (=> b!1437422 (= e!811282 e!811283)))

(declare-fun res!969562 () Bool)

(assert (=> b!1437422 (=> (not res!969562) (not e!811283))))

(assert (=> b!1437422 (= res!969562 (not (contains!9925 (t!48353 Nil!33664) (h!35009 Nil!33664))))))

(declare-fun b!1437423 () Bool)

(assert (=> b!1437423 (= e!811283 (noDuplicate!2632 (t!48353 Nil!33664)))))

(assert (= (and d!154875 (not res!969561)) b!1437422))

(assert (= (and b!1437422 res!969562) b!1437423))

(declare-fun m!1326897 () Bool)

(assert (=> b!1437422 m!1326897))

(declare-fun m!1326899 () Bool)

(assert (=> b!1437423 m!1326899))

(assert (=> b!1437365 d!154875))

(declare-fun d!154877 () Bool)

(assert (=> d!154877 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124184 d!154877))

(declare-fun d!154883 () Bool)

(assert (=> d!154883 (= (array_inv!36460 a!2862) (bvsge (size!47730 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124184 d!154883))

(declare-fun d!154887 () Bool)

(declare-fun res!969574 () Bool)

(declare-fun e!811296 () Bool)

(assert (=> d!154887 (=> res!969574 e!811296)))

(assert (=> d!154887 (= res!969574 (bvsge #b00000000000000000000000000000000 (size!47730 a!2862)))))

(assert (=> d!154887 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811296)))

(declare-fun b!1437438 () Bool)

(declare-fun e!811298 () Bool)

(declare-fun call!67656 () Bool)

(assert (=> b!1437438 (= e!811298 call!67656)))

(declare-fun b!1437439 () Bool)

(assert (=> b!1437439 (= e!811296 e!811298)))

(declare-fun c!133444 () Bool)

(assert (=> b!1437439 (= c!133444 (validKeyInArray!0 (select (arr!47179 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437440 () Bool)

(declare-fun e!811297 () Bool)

(assert (=> b!1437440 (= e!811297 call!67656)))

(declare-fun bm!67653 () Bool)

(assert (=> bm!67653 (= call!67656 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1437441 () Bool)

(assert (=> b!1437441 (= e!811298 e!811297)))

(declare-fun lt!632549 () (_ BitVec 64))

(assert (=> b!1437441 (= lt!632549 (select (arr!47179 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48479 0))(
  ( (Unit!48480) )
))
(declare-fun lt!632548 () Unit!48479)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97768 (_ BitVec 64) (_ BitVec 32)) Unit!48479)

(assert (=> b!1437441 (= lt!632548 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632549 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1437441 (arrayContainsKey!0 a!2862 lt!632549 #b00000000000000000000000000000000)))

(declare-fun lt!632547 () Unit!48479)

(assert (=> b!1437441 (= lt!632547 lt!632548)))

(declare-fun res!969573 () Bool)

(declare-datatypes ((SeekEntryResult!11351 0))(
  ( (MissingZero!11351 (index!47796 (_ BitVec 32))) (Found!11351 (index!47797 (_ BitVec 32))) (Intermediate!11351 (undefined!12163 Bool) (index!47798 (_ BitVec 32)) (x!129645 (_ BitVec 32))) (Undefined!11351) (MissingVacant!11351 (index!47799 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97768 (_ BitVec 32)) SeekEntryResult!11351)

(assert (=> b!1437441 (= res!969573 (= (seekEntryOrOpen!0 (select (arr!47179 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11351 #b00000000000000000000000000000000)))))

(assert (=> b!1437441 (=> (not res!969573) (not e!811297))))

(assert (= (and d!154887 (not res!969574)) b!1437439))

(assert (= (and b!1437439 c!133444) b!1437441))

(assert (= (and b!1437439 (not c!133444)) b!1437438))

(assert (= (and b!1437441 res!969573) b!1437440))

(assert (= (or b!1437440 b!1437438) bm!67653))

(declare-fun m!1326907 () Bool)

(assert (=> b!1437439 m!1326907))

(assert (=> b!1437439 m!1326907))

(declare-fun m!1326909 () Bool)

(assert (=> b!1437439 m!1326909))

(declare-fun m!1326911 () Bool)

(assert (=> bm!67653 m!1326911))

(assert (=> b!1437441 m!1326907))

(declare-fun m!1326913 () Bool)

(assert (=> b!1437441 m!1326913))

(declare-fun m!1326915 () Bool)

(assert (=> b!1437441 m!1326915))

(assert (=> b!1437441 m!1326907))

(declare-fun m!1326917 () Bool)

(assert (=> b!1437441 m!1326917))

(assert (=> b!1437367 d!154887))

(declare-fun d!154893 () Bool)

(assert (=> d!154893 (= (validKeyInArray!0 (select (arr!47179 a!2862) i!1006)) (and (not (= (select (arr!47179 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47179 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437362 d!154893))

(declare-fun d!154897 () Bool)

(assert (=> d!154897 (= (validKeyInArray!0 (select (arr!47179 a!2862) j!93)) (and (not (= (select (arr!47179 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47179 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437368 d!154897))

(declare-fun d!154899 () Bool)

(declare-fun lt!632552 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!767 (List!33667) (InoxSet (_ BitVec 64)))

(assert (=> d!154899 (= lt!632552 (select (content!767 Nil!33664) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!811310 () Bool)

(assert (=> d!154899 (= lt!632552 e!811310)))

(declare-fun res!969585 () Bool)

(assert (=> d!154899 (=> (not res!969585) (not e!811310))))

(assert (=> d!154899 (= res!969585 ((_ is Cons!33663) Nil!33664))))

(assert (=> d!154899 (= (contains!9925 Nil!33664 #b0000000000000000000000000000000000000000000000000000000000000000) lt!632552)))

(declare-fun b!1437452 () Bool)

(declare-fun e!811309 () Bool)

(assert (=> b!1437452 (= e!811310 e!811309)))

(declare-fun res!969586 () Bool)

(assert (=> b!1437452 (=> res!969586 e!811309)))

(assert (=> b!1437452 (= res!969586 (= (h!35009 Nil!33664) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1437453 () Bool)

(assert (=> b!1437453 (= e!811309 (contains!9925 (t!48353 Nil!33664) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154899 res!969585) b!1437452))

(assert (= (and b!1437452 (not res!969586)) b!1437453))

(declare-fun m!1326923 () Bool)

(assert (=> d!154899 m!1326923))

(declare-fun m!1326925 () Bool)

(assert (=> d!154899 m!1326925))

(declare-fun m!1326927 () Bool)

(assert (=> b!1437453 m!1326927))

(assert (=> b!1437369 d!154899))

(declare-fun d!154903 () Bool)

(declare-fun lt!632553 () Bool)

(assert (=> d!154903 (= lt!632553 (select (content!767 Nil!33664) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!811312 () Bool)

(assert (=> d!154903 (= lt!632553 e!811312)))

(declare-fun res!969587 () Bool)

(assert (=> d!154903 (=> (not res!969587) (not e!811312))))

(assert (=> d!154903 (= res!969587 ((_ is Cons!33663) Nil!33664))))

(assert (=> d!154903 (= (contains!9925 Nil!33664 #b1000000000000000000000000000000000000000000000000000000000000000) lt!632553)))

(declare-fun b!1437454 () Bool)

(declare-fun e!811311 () Bool)

(assert (=> b!1437454 (= e!811312 e!811311)))

(declare-fun res!969588 () Bool)

(assert (=> b!1437454 (=> res!969588 e!811311)))

(assert (=> b!1437454 (= res!969588 (= (h!35009 Nil!33664) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1437455 () Bool)

(assert (=> b!1437455 (= e!811311 (contains!9925 (t!48353 Nil!33664) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154903 res!969587) b!1437454))

(assert (= (and b!1437454 (not res!969588)) b!1437455))

(assert (=> d!154903 m!1326923))

(declare-fun m!1326929 () Bool)

(assert (=> d!154903 m!1326929))

(declare-fun m!1326931 () Bool)

(assert (=> b!1437455 m!1326931))

(assert (=> b!1437364 d!154903))

(check-sat (not b!1437422) (not b!1437423) (not b!1437439) (not bm!67653) (not d!154899) (not b!1437441) (not b!1437453) (not d!154903) (not b!1437455))
(check-sat)
