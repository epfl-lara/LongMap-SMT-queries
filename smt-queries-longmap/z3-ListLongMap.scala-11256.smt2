; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131248 () Bool)

(assert start!131248)

(declare-fun b!1539414 () Bool)

(declare-fun res!1056304 () Bool)

(declare-fun e!856273 () Bool)

(assert (=> b!1539414 (=> (not res!1056304) (not e!856273))))

(declare-datatypes ((array!102274 0))(
  ( (array!102275 (arr!49350 (Array (_ BitVec 32) (_ BitVec 64))) (size!49900 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102274)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102274 (_ BitVec 32)) Bool)

(assert (=> b!1539414 (= res!1056304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539415 () Bool)

(declare-fun res!1056308 () Bool)

(assert (=> b!1539415 (=> (not res!1056308) (not e!856273))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539415 (= res!1056308 (not (= (select (arr!49350 a!2792) index!463) (select (arr!49350 a!2792) j!64))))))

(declare-fun b!1539417 () Bool)

(declare-fun res!1056302 () Bool)

(assert (=> b!1539417 (=> (not res!1056302) (not e!856273))))

(declare-datatypes ((List!35824 0))(
  ( (Nil!35821) (Cons!35820 (h!37265 (_ BitVec 64)) (t!50518 List!35824)) )
))
(declare-fun arrayNoDuplicates!0 (array!102274 (_ BitVec 32) List!35824) Bool)

(assert (=> b!1539417 (= res!1056302 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35821))))

(declare-fun b!1539418 () Bool)

(declare-fun res!1056303 () Bool)

(assert (=> b!1539418 (=> (not res!1056303) (not e!856273))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539418 (= res!1056303 (and (= (size!49900 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49900 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49900 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1056307 () Bool)

(assert (=> start!131248 (=> (not res!1056307) (not e!856273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131248 (= res!1056307 (validMask!0 mask!2480))))

(assert (=> start!131248 e!856273))

(assert (=> start!131248 true))

(declare-fun array_inv!38378 (array!102274) Bool)

(assert (=> start!131248 (array_inv!38378 a!2792)))

(declare-fun b!1539416 () Bool)

(declare-fun res!1056306 () Bool)

(assert (=> b!1539416 (=> (not res!1056306) (not e!856273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539416 (= res!1056306 (validKeyInArray!0 (select (arr!49350 a!2792) j!64)))))

(declare-fun b!1539419 () Bool)

(declare-fun res!1056310 () Bool)

(assert (=> b!1539419 (=> (not res!1056310) (not e!856273))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1539419 (= res!1056310 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49900 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49900 a!2792)) (= (select (arr!49350 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539420 () Bool)

(declare-fun res!1056305 () Bool)

(assert (=> b!1539420 (=> (not res!1056305) (not e!856273))))

(assert (=> b!1539420 (= res!1056305 (validKeyInArray!0 (select (arr!49350 a!2792) i!951)))))

(declare-fun lt!665047 () (_ BitVec 32))

(declare-fun b!1539421 () Bool)

(assert (=> b!1539421 (= e!856273 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (or (bvslt lt!665047 #b00000000000000000000000000000000) (bvsge lt!665047 (size!49900 a!2792)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539421 (= lt!665047 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539422 () Bool)

(declare-fun res!1056309 () Bool)

(assert (=> b!1539422 (=> (not res!1056309) (not e!856273))))

(declare-datatypes ((SeekEntryResult!13476 0))(
  ( (MissingZero!13476 (index!56299 (_ BitVec 32))) (Found!13476 (index!56300 (_ BitVec 32))) (Intermediate!13476 (undefined!14288 Bool) (index!56301 (_ BitVec 32)) (x!138031 (_ BitVec 32))) (Undefined!13476) (MissingVacant!13476 (index!56302 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102274 (_ BitVec 32)) SeekEntryResult!13476)

(assert (=> b!1539422 (= res!1056309 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49350 a!2792) j!64) a!2792 mask!2480) (Found!13476 j!64)))))

(assert (= (and start!131248 res!1056307) b!1539418))

(assert (= (and b!1539418 res!1056303) b!1539420))

(assert (= (and b!1539420 res!1056305) b!1539416))

(assert (= (and b!1539416 res!1056306) b!1539414))

(assert (= (and b!1539414 res!1056304) b!1539417))

(assert (= (and b!1539417 res!1056302) b!1539419))

(assert (= (and b!1539419 res!1056310) b!1539422))

(assert (= (and b!1539422 res!1056309) b!1539415))

(assert (= (and b!1539415 res!1056308) b!1539421))

(declare-fun m!1421691 () Bool)

(assert (=> b!1539422 m!1421691))

(assert (=> b!1539422 m!1421691))

(declare-fun m!1421693 () Bool)

(assert (=> b!1539422 m!1421693))

(declare-fun m!1421695 () Bool)

(assert (=> b!1539421 m!1421695))

(declare-fun m!1421697 () Bool)

(assert (=> b!1539419 m!1421697))

(declare-fun m!1421699 () Bool)

(assert (=> b!1539420 m!1421699))

(assert (=> b!1539420 m!1421699))

(declare-fun m!1421701 () Bool)

(assert (=> b!1539420 m!1421701))

(assert (=> b!1539416 m!1421691))

(assert (=> b!1539416 m!1421691))

(declare-fun m!1421703 () Bool)

(assert (=> b!1539416 m!1421703))

(declare-fun m!1421705 () Bool)

(assert (=> start!131248 m!1421705))

(declare-fun m!1421707 () Bool)

(assert (=> start!131248 m!1421707))

(declare-fun m!1421709 () Bool)

(assert (=> b!1539415 m!1421709))

(assert (=> b!1539415 m!1421691))

(declare-fun m!1421711 () Bool)

(assert (=> b!1539414 m!1421711))

(declare-fun m!1421713 () Bool)

(assert (=> b!1539417 m!1421713))

(check-sat (not b!1539416) (not b!1539422) (not b!1539417) (not b!1539420) (not start!131248) (not b!1539421) (not b!1539414))
(check-sat)
(get-model)

(declare-fun b!1539458 () Bool)

(declare-fun e!856287 () Bool)

(declare-fun call!68619 () Bool)

(assert (=> b!1539458 (= e!856287 call!68619)))

(declare-fun b!1539459 () Bool)

(declare-fun e!856286 () Bool)

(declare-fun e!856288 () Bool)

(assert (=> b!1539459 (= e!856286 e!856288)))

(declare-fun c!141116 () Bool)

(assert (=> b!1539459 (= c!141116 (validKeyInArray!0 (select (arr!49350 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539460 () Bool)

(assert (=> b!1539460 (= e!856288 call!68619)))

(declare-fun d!160423 () Bool)

(declare-fun res!1056342 () Bool)

(assert (=> d!160423 (=> res!1056342 e!856286)))

(assert (=> d!160423 (= res!1056342 (bvsge #b00000000000000000000000000000000 (size!49900 a!2792)))))

(assert (=> d!160423 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!856286)))

(declare-fun bm!68616 () Bool)

(assert (=> bm!68616 (= call!68619 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1539461 () Bool)

(assert (=> b!1539461 (= e!856288 e!856287)))

(declare-fun lt!665059 () (_ BitVec 64))

(assert (=> b!1539461 (= lt!665059 (select (arr!49350 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51410 0))(
  ( (Unit!51411) )
))
(declare-fun lt!665058 () Unit!51410)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102274 (_ BitVec 64) (_ BitVec 32)) Unit!51410)

(assert (=> b!1539461 (= lt!665058 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!665059 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1539461 (arrayContainsKey!0 a!2792 lt!665059 #b00000000000000000000000000000000)))

(declare-fun lt!665057 () Unit!51410)

(assert (=> b!1539461 (= lt!665057 lt!665058)))

(declare-fun res!1056343 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102274 (_ BitVec 32)) SeekEntryResult!13476)

(assert (=> b!1539461 (= res!1056343 (= (seekEntryOrOpen!0 (select (arr!49350 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13476 #b00000000000000000000000000000000)))))

(assert (=> b!1539461 (=> (not res!1056343) (not e!856287))))

(assert (= (and d!160423 (not res!1056342)) b!1539459))

(assert (= (and b!1539459 c!141116) b!1539461))

(assert (= (and b!1539459 (not c!141116)) b!1539460))

(assert (= (and b!1539461 res!1056343) b!1539458))

(assert (= (or b!1539458 b!1539460) bm!68616))

(declare-fun m!1421739 () Bool)

(assert (=> b!1539459 m!1421739))

(assert (=> b!1539459 m!1421739))

(declare-fun m!1421741 () Bool)

(assert (=> b!1539459 m!1421741))

(declare-fun m!1421743 () Bool)

(assert (=> bm!68616 m!1421743))

(assert (=> b!1539461 m!1421739))

(declare-fun m!1421745 () Bool)

(assert (=> b!1539461 m!1421745))

(declare-fun m!1421747 () Bool)

(assert (=> b!1539461 m!1421747))

(assert (=> b!1539461 m!1421739))

(declare-fun m!1421749 () Bool)

(assert (=> b!1539461 m!1421749))

(assert (=> b!1539414 d!160423))

(declare-fun d!160425 () Bool)

(assert (=> d!160425 (= (validKeyInArray!0 (select (arr!49350 a!2792) i!951)) (and (not (= (select (arr!49350 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49350 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539420 d!160425))

(declare-fun d!160427 () Bool)

(assert (=> d!160427 (= (validKeyInArray!0 (select (arr!49350 a!2792) j!64)) (and (not (= (select (arr!49350 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49350 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539416 d!160427))

(declare-fun d!160429 () Bool)

(declare-fun lt!665062 () (_ BitVec 32))

(assert (=> d!160429 (and (bvsge lt!665062 #b00000000000000000000000000000000) (bvslt lt!665062 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160429 (= lt!665062 (choose!52 index!463 x!510 mask!2480))))

(assert (=> d!160429 (validMask!0 mask!2480)))

(assert (=> d!160429 (= (nextIndex!0 index!463 x!510 mask!2480) lt!665062)))

(declare-fun bs!44194 () Bool)

(assert (= bs!44194 d!160429))

(declare-fun m!1421751 () Bool)

(assert (=> bs!44194 m!1421751))

(assert (=> bs!44194 m!1421705))

(assert (=> b!1539421 d!160429))

(declare-fun d!160431 () Bool)

(declare-fun lt!665071 () SeekEntryResult!13476)

(get-info :version)

(assert (=> d!160431 (and (or ((_ is Undefined!13476) lt!665071) (not ((_ is Found!13476) lt!665071)) (and (bvsge (index!56300 lt!665071) #b00000000000000000000000000000000) (bvslt (index!56300 lt!665071) (size!49900 a!2792)))) (or ((_ is Undefined!13476) lt!665071) ((_ is Found!13476) lt!665071) (not ((_ is MissingVacant!13476) lt!665071)) (not (= (index!56302 lt!665071) vacantIndex!5)) (and (bvsge (index!56302 lt!665071) #b00000000000000000000000000000000) (bvslt (index!56302 lt!665071) (size!49900 a!2792)))) (or ((_ is Undefined!13476) lt!665071) (ite ((_ is Found!13476) lt!665071) (= (select (arr!49350 a!2792) (index!56300 lt!665071)) (select (arr!49350 a!2792) j!64)) (and ((_ is MissingVacant!13476) lt!665071) (= (index!56302 lt!665071) vacantIndex!5) (= (select (arr!49350 a!2792) (index!56302 lt!665071)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!856297 () SeekEntryResult!13476)

(assert (=> d!160431 (= lt!665071 e!856297)))

(declare-fun c!141123 () Bool)

(assert (=> d!160431 (= c!141123 (bvsge x!510 #b01111111111111111111111111111110))))

(declare-fun lt!665070 () (_ BitVec 64))

(assert (=> d!160431 (= lt!665070 (select (arr!49350 a!2792) index!463))))

(assert (=> d!160431 (validMask!0 mask!2480)))

(assert (=> d!160431 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49350 a!2792) j!64) a!2792 mask!2480) lt!665071)))

(declare-fun b!1539474 () Bool)

(assert (=> b!1539474 (= e!856297 Undefined!13476)))

(declare-fun b!1539475 () Bool)

(declare-fun e!856296 () SeekEntryResult!13476)

(assert (=> b!1539475 (= e!856296 (MissingVacant!13476 vacantIndex!5))))

(declare-fun b!1539476 () Bool)

(assert (=> b!1539476 (= e!856296 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (arr!49350 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539477 () Bool)

(declare-fun c!141125 () Bool)

(assert (=> b!1539477 (= c!141125 (= lt!665070 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!856295 () SeekEntryResult!13476)

(assert (=> b!1539477 (= e!856295 e!856296)))

(declare-fun b!1539478 () Bool)

(assert (=> b!1539478 (= e!856297 e!856295)))

(declare-fun c!141124 () Bool)

(assert (=> b!1539478 (= c!141124 (= lt!665070 (select (arr!49350 a!2792) j!64)))))

(declare-fun b!1539479 () Bool)

(assert (=> b!1539479 (= e!856295 (Found!13476 index!463))))

(assert (= (and d!160431 c!141123) b!1539474))

(assert (= (and d!160431 (not c!141123)) b!1539478))

(assert (= (and b!1539478 c!141124) b!1539479))

(assert (= (and b!1539478 (not c!141124)) b!1539477))

(assert (= (and b!1539477 c!141125) b!1539475))

(assert (= (and b!1539477 (not c!141125)) b!1539476))

(declare-fun m!1421755 () Bool)

(assert (=> d!160431 m!1421755))

(declare-fun m!1421757 () Bool)

(assert (=> d!160431 m!1421757))

(assert (=> d!160431 m!1421709))

(assert (=> d!160431 m!1421705))

(assert (=> b!1539476 m!1421695))

(assert (=> b!1539476 m!1421695))

(assert (=> b!1539476 m!1421691))

(declare-fun m!1421759 () Bool)

(assert (=> b!1539476 m!1421759))

(assert (=> b!1539422 d!160431))

(declare-fun b!1539517 () Bool)

(declare-fun e!856327 () Bool)

(declare-fun e!856329 () Bool)

(assert (=> b!1539517 (= e!856327 e!856329)))

(declare-fun c!141134 () Bool)

(assert (=> b!1539517 (= c!141134 (validKeyInArray!0 (select (arr!49350 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539519 () Bool)

(declare-fun call!68628 () Bool)

(assert (=> b!1539519 (= e!856329 call!68628)))

(declare-fun b!1539520 () Bool)

(assert (=> b!1539520 (= e!856329 call!68628)))

(declare-fun d!160443 () Bool)

(declare-fun res!1056365 () Bool)

(declare-fun e!856330 () Bool)

(assert (=> d!160443 (=> res!1056365 e!856330)))

(assert (=> d!160443 (= res!1056365 (bvsge #b00000000000000000000000000000000 (size!49900 a!2792)))))

(assert (=> d!160443 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35821) e!856330)))

(declare-fun b!1539518 () Bool)

(declare-fun e!856328 () Bool)

(declare-fun contains!10013 (List!35824 (_ BitVec 64)) Bool)

(assert (=> b!1539518 (= e!856328 (contains!10013 Nil!35821 (select (arr!49350 a!2792) #b00000000000000000000000000000000)))))

(declare-fun bm!68625 () Bool)

(assert (=> bm!68625 (= call!68628 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141134 (Cons!35820 (select (arr!49350 a!2792) #b00000000000000000000000000000000) Nil!35821) Nil!35821)))))

(declare-fun b!1539521 () Bool)

(assert (=> b!1539521 (= e!856330 e!856327)))

(declare-fun res!1056367 () Bool)

(assert (=> b!1539521 (=> (not res!1056367) (not e!856327))))

(assert (=> b!1539521 (= res!1056367 (not e!856328))))

(declare-fun res!1056366 () Bool)

(assert (=> b!1539521 (=> (not res!1056366) (not e!856328))))

(assert (=> b!1539521 (= res!1056366 (validKeyInArray!0 (select (arr!49350 a!2792) #b00000000000000000000000000000000)))))

(assert (= (and d!160443 (not res!1056365)) b!1539521))

(assert (= (and b!1539521 res!1056366) b!1539518))

(assert (= (and b!1539521 res!1056367) b!1539517))

(assert (= (and b!1539517 c!141134) b!1539519))

(assert (= (and b!1539517 (not c!141134)) b!1539520))

(assert (= (or b!1539519 b!1539520) bm!68625))

(assert (=> b!1539517 m!1421739))

(assert (=> b!1539517 m!1421739))

(assert (=> b!1539517 m!1421741))

(assert (=> b!1539518 m!1421739))

(assert (=> b!1539518 m!1421739))

(declare-fun m!1421781 () Bool)

(assert (=> b!1539518 m!1421781))

(assert (=> bm!68625 m!1421739))

(declare-fun m!1421783 () Bool)

(assert (=> bm!68625 m!1421783))

(assert (=> b!1539521 m!1421739))

(assert (=> b!1539521 m!1421739))

(assert (=> b!1539521 m!1421741))

(assert (=> b!1539417 d!160443))

(declare-fun d!160449 () Bool)

(assert (=> d!160449 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131248 d!160449))

(declare-fun d!160453 () Bool)

(assert (=> d!160453 (= (array_inv!38378 a!2792) (bvsge (size!49900 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131248 d!160453))

(check-sat (not d!160429) (not b!1539521) (not b!1539518) (not b!1539459) (not b!1539461) (not bm!68616) (not b!1539517) (not d!160431) (not bm!68625) (not b!1539476))
(check-sat)
