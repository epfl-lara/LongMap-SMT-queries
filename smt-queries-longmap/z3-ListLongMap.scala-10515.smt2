; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123962 () Bool)

(assert start!123962)

(declare-fun res!969009 () Bool)

(declare-fun e!810406 () Bool)

(assert (=> start!123962 (=> (not res!969009) (not e!810406))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123962 (= res!969009 (validMask!0 mask!2687))))

(assert (=> start!123962 e!810406))

(assert (=> start!123962 true))

(declare-datatypes ((array!97658 0))(
  ( (array!97659 (arr!47127 (Array (_ BitVec 32) (_ BitVec 64))) (size!47677 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97658)

(declare-fun array_inv!36155 (array!97658) Bool)

(assert (=> start!123962 (array_inv!36155 a!2862)))

(declare-fun b!1436033 () Bool)

(declare-fun e!810405 () Bool)

(assert (=> b!1436033 (= e!810406 e!810405)))

(declare-fun res!969010 () Bool)

(assert (=> b!1436033 (=> res!969010 e!810405)))

(declare-datatypes ((List!33628 0))(
  ( (Nil!33625) (Cons!33624 (h!34959 (_ BitVec 64)) (t!48322 List!33628)) )
))
(declare-fun contains!9881 (List!33628 (_ BitVec 64)) Bool)

(assert (=> b!1436033 (= res!969010 (contains!9881 Nil!33625 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1436034 () Bool)

(declare-fun res!969008 () Bool)

(assert (=> b!1436034 (=> (not res!969008) (not e!810406))))

(assert (=> b!1436034 (= res!969008 (and (bvsle #b00000000000000000000000000000000 (size!47677 a!2862)) (bvslt (size!47677 a!2862) #b01111111111111111111111111111111)))))

(declare-fun b!1436035 () Bool)

(declare-fun res!969005 () Bool)

(assert (=> b!1436035 (=> (not res!969005) (not e!810406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97658 (_ BitVec 32)) Bool)

(assert (=> b!1436035 (= res!969005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436036 () Bool)

(declare-fun res!969007 () Bool)

(assert (=> b!1436036 (=> (not res!969007) (not e!810406))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436036 (= res!969007 (validKeyInArray!0 (select (arr!47127 a!2862) i!1006)))))

(declare-fun b!1436037 () Bool)

(assert (=> b!1436037 (= e!810405 (contains!9881 Nil!33625 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1436038 () Bool)

(declare-fun res!969004 () Bool)

(assert (=> b!1436038 (=> (not res!969004) (not e!810406))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1436038 (= res!969004 (validKeyInArray!0 (select (arr!47127 a!2862) j!93)))))

(declare-fun b!1436039 () Bool)

(declare-fun res!969003 () Bool)

(assert (=> b!1436039 (=> (not res!969003) (not e!810406))))

(assert (=> b!1436039 (= res!969003 (and (= (size!47677 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47677 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47677 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436040 () Bool)

(declare-fun res!969006 () Bool)

(assert (=> b!1436040 (=> (not res!969006) (not e!810406))))

(declare-fun noDuplicate!2616 (List!33628) Bool)

(assert (=> b!1436040 (= res!969006 (noDuplicate!2616 Nil!33625))))

(assert (= (and start!123962 res!969009) b!1436039))

(assert (= (and b!1436039 res!969003) b!1436036))

(assert (= (and b!1436036 res!969007) b!1436038))

(assert (= (and b!1436038 res!969004) b!1436035))

(assert (= (and b!1436035 res!969005) b!1436034))

(assert (= (and b!1436034 res!969008) b!1436040))

(assert (= (and b!1436040 res!969006) b!1436033))

(assert (= (and b!1436033 (not res!969010)) b!1436037))

(declare-fun m!1325375 () Bool)

(assert (=> b!1436033 m!1325375))

(declare-fun m!1325377 () Bool)

(assert (=> b!1436038 m!1325377))

(assert (=> b!1436038 m!1325377))

(declare-fun m!1325379 () Bool)

(assert (=> b!1436038 m!1325379))

(declare-fun m!1325381 () Bool)

(assert (=> start!123962 m!1325381))

(declare-fun m!1325383 () Bool)

(assert (=> start!123962 m!1325383))

(declare-fun m!1325385 () Bool)

(assert (=> b!1436035 m!1325385))

(declare-fun m!1325387 () Bool)

(assert (=> b!1436037 m!1325387))

(declare-fun m!1325389 () Bool)

(assert (=> b!1436040 m!1325389))

(declare-fun m!1325391 () Bool)

(assert (=> b!1436036 m!1325391))

(assert (=> b!1436036 m!1325391))

(declare-fun m!1325393 () Bool)

(assert (=> b!1436036 m!1325393))

(check-sat (not start!123962) (not b!1436033) (not b!1436035) (not b!1436038) (not b!1436036) (not b!1436040) (not b!1436037))
(check-sat)
(get-model)

(declare-fun d!154483 () Bool)

(declare-fun lt!632049 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!775 (List!33628) (InoxSet (_ BitVec 64)))

(assert (=> d!154483 (= lt!632049 (select (content!775 Nil!33625) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!810421 () Bool)

(assert (=> d!154483 (= lt!632049 e!810421)))

(declare-fun res!969039 () Bool)

(assert (=> d!154483 (=> (not res!969039) (not e!810421))))

(get-info :version)

(assert (=> d!154483 (= res!969039 ((_ is Cons!33624) Nil!33625))))

(assert (=> d!154483 (= (contains!9881 Nil!33625 #b0000000000000000000000000000000000000000000000000000000000000000) lt!632049)))

(declare-fun b!1436069 () Bool)

(declare-fun e!810422 () Bool)

(assert (=> b!1436069 (= e!810421 e!810422)))

(declare-fun res!969040 () Bool)

(assert (=> b!1436069 (=> res!969040 e!810422)))

(assert (=> b!1436069 (= res!969040 (= (h!34959 Nil!33625) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1436070 () Bool)

(assert (=> b!1436070 (= e!810422 (contains!9881 (t!48322 Nil!33625) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154483 res!969039) b!1436069))

(assert (= (and b!1436069 (not res!969040)) b!1436070))

(declare-fun m!1325415 () Bool)

(assert (=> d!154483 m!1325415))

(declare-fun m!1325417 () Bool)

(assert (=> d!154483 m!1325417))

(declare-fun m!1325419 () Bool)

(assert (=> b!1436070 m!1325419))

(assert (=> b!1436033 d!154483))

(declare-fun d!154487 () Bool)

(assert (=> d!154487 (= (validKeyInArray!0 (select (arr!47127 a!2862) j!93)) (and (not (= (select (arr!47127 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47127 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1436038 d!154487))

(declare-fun d!154491 () Bool)

(declare-fun lt!632052 () Bool)

(assert (=> d!154491 (= lt!632052 (select (content!775 Nil!33625) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!810425 () Bool)

(assert (=> d!154491 (= lt!632052 e!810425)))

(declare-fun res!969043 () Bool)

(assert (=> d!154491 (=> (not res!969043) (not e!810425))))

(assert (=> d!154491 (= res!969043 ((_ is Cons!33624) Nil!33625))))

(assert (=> d!154491 (= (contains!9881 Nil!33625 #b1000000000000000000000000000000000000000000000000000000000000000) lt!632052)))

(declare-fun b!1436073 () Bool)

(declare-fun e!810428 () Bool)

(assert (=> b!1436073 (= e!810425 e!810428)))

(declare-fun res!969046 () Bool)

(assert (=> b!1436073 (=> res!969046 e!810428)))

(assert (=> b!1436073 (= res!969046 (= (h!34959 Nil!33625) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1436074 () Bool)

(assert (=> b!1436074 (= e!810428 (contains!9881 (t!48322 Nil!33625) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154491 res!969043) b!1436073))

(assert (= (and b!1436073 (not res!969046)) b!1436074))

(assert (=> d!154491 m!1325415))

(declare-fun m!1325421 () Bool)

(assert (=> d!154491 m!1325421))

(declare-fun m!1325423 () Bool)

(assert (=> b!1436074 m!1325423))

(assert (=> b!1436037 d!154491))

(declare-fun d!154493 () Bool)

(assert (=> d!154493 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!123962 d!154493))

(declare-fun d!154501 () Bool)

(assert (=> d!154501 (= (array_inv!36155 a!2862) (bvsge (size!47677 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!123962 d!154501))

(declare-fun d!154503 () Bool)

(assert (=> d!154503 (= (validKeyInArray!0 (select (arr!47127 a!2862) i!1006)) (and (not (= (select (arr!47127 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47127 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1436036 d!154503))

(declare-fun b!1436111 () Bool)

(declare-fun e!810458 () Bool)

(declare-fun e!810460 () Bool)

(assert (=> b!1436111 (= e!810458 e!810460)))

(declare-fun lt!632074 () (_ BitVec 64))

(assert (=> b!1436111 (= lt!632074 (select (arr!47127 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48542 0))(
  ( (Unit!48543) )
))
(declare-fun lt!632073 () Unit!48542)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97658 (_ BitVec 64) (_ BitVec 32)) Unit!48542)

(assert (=> b!1436111 (= lt!632073 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632074 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1436111 (arrayContainsKey!0 a!2862 lt!632074 #b00000000000000000000000000000000)))

(declare-fun lt!632072 () Unit!48542)

(assert (=> b!1436111 (= lt!632072 lt!632073)))

(declare-fun res!969071 () Bool)

(declare-datatypes ((SeekEntryResult!11398 0))(
  ( (MissingZero!11398 (index!47984 (_ BitVec 32))) (Found!11398 (index!47985 (_ BitVec 32))) (Intermediate!11398 (undefined!12210 Bool) (index!47986 (_ BitVec 32)) (x!129668 (_ BitVec 32))) (Undefined!11398) (MissingVacant!11398 (index!47987 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97658 (_ BitVec 32)) SeekEntryResult!11398)

(assert (=> b!1436111 (= res!969071 (= (seekEntryOrOpen!0 (select (arr!47127 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11398 #b00000000000000000000000000000000)))))

(assert (=> b!1436111 (=> (not res!969071) (not e!810460))))

(declare-fun bm!67582 () Bool)

(declare-fun call!67585 () Bool)

(assert (=> bm!67582 (= call!67585 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1436113 () Bool)

(assert (=> b!1436113 (= e!810460 call!67585)))

(declare-fun b!1436114 () Bool)

(assert (=> b!1436114 (= e!810458 call!67585)))

(declare-fun b!1436112 () Bool)

(declare-fun e!810459 () Bool)

(assert (=> b!1436112 (= e!810459 e!810458)))

(declare-fun c!133023 () Bool)

(assert (=> b!1436112 (= c!133023 (validKeyInArray!0 (select (arr!47127 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!154505 () Bool)

(declare-fun res!969072 () Bool)

(assert (=> d!154505 (=> res!969072 e!810459)))

(assert (=> d!154505 (= res!969072 (bvsge #b00000000000000000000000000000000 (size!47677 a!2862)))))

(assert (=> d!154505 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810459)))

(assert (= (and d!154505 (not res!969072)) b!1436112))

(assert (= (and b!1436112 c!133023) b!1436111))

(assert (= (and b!1436112 (not c!133023)) b!1436114))

(assert (= (and b!1436111 res!969071) b!1436113))

(assert (= (or b!1436113 b!1436114) bm!67582))

(declare-fun m!1325453 () Bool)

(assert (=> b!1436111 m!1325453))

(declare-fun m!1325455 () Bool)

(assert (=> b!1436111 m!1325455))

(declare-fun m!1325457 () Bool)

(assert (=> b!1436111 m!1325457))

(assert (=> b!1436111 m!1325453))

(declare-fun m!1325459 () Bool)

(assert (=> b!1436111 m!1325459))

(declare-fun m!1325461 () Bool)

(assert (=> bm!67582 m!1325461))

(assert (=> b!1436112 m!1325453))

(assert (=> b!1436112 m!1325453))

(declare-fun m!1325463 () Bool)

(assert (=> b!1436112 m!1325463))

(assert (=> b!1436035 d!154505))

(declare-fun d!154513 () Bool)

(declare-fun res!969081 () Bool)

(declare-fun e!810471 () Bool)

(assert (=> d!154513 (=> res!969081 e!810471)))

(assert (=> d!154513 (= res!969081 ((_ is Nil!33625) Nil!33625))))

(assert (=> d!154513 (= (noDuplicate!2616 Nil!33625) e!810471)))

(declare-fun b!1436127 () Bool)

(declare-fun e!810472 () Bool)

(assert (=> b!1436127 (= e!810471 e!810472)))

(declare-fun res!969082 () Bool)

(assert (=> b!1436127 (=> (not res!969082) (not e!810472))))

(assert (=> b!1436127 (= res!969082 (not (contains!9881 (t!48322 Nil!33625) (h!34959 Nil!33625))))))

(declare-fun b!1436128 () Bool)

(assert (=> b!1436128 (= e!810472 (noDuplicate!2616 (t!48322 Nil!33625)))))

(assert (= (and d!154513 (not res!969081)) b!1436127))

(assert (= (and b!1436127 res!969082) b!1436128))

(declare-fun m!1325465 () Bool)

(assert (=> b!1436127 m!1325465))

(declare-fun m!1325467 () Bool)

(assert (=> b!1436128 m!1325467))

(assert (=> b!1436040 d!154513))

(check-sat (not b!1436074) (not b!1436128) (not d!154483) (not b!1436127) (not d!154491) (not bm!67582) (not b!1436070) (not b!1436111) (not b!1436112))
(check-sat)
