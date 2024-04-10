; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131246 () Bool)

(assert start!131246)

(declare-fun b!1539387 () Bool)

(declare-fun res!1056281 () Bool)

(declare-fun e!856266 () Bool)

(assert (=> b!1539387 (=> (not res!1056281) (not e!856266))))

(declare-datatypes ((array!102272 0))(
  ( (array!102273 (arr!49349 (Array (_ BitVec 32) (_ BitVec 64))) (size!49899 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102272)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539387 (= res!1056281 (validKeyInArray!0 (select (arr!49349 a!2792) j!64)))))

(declare-fun b!1539388 () Bool)

(declare-fun res!1056277 () Bool)

(assert (=> b!1539388 (=> (not res!1056277) (not e!856266))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539388 (= res!1056277 (not (= (select (arr!49349 a!2792) index!463) (select (arr!49349 a!2792) j!64))))))

(declare-fun b!1539389 () Bool)

(declare-fun res!1056275 () Bool)

(assert (=> b!1539389 (=> (not res!1056275) (not e!856266))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13475 0))(
  ( (MissingZero!13475 (index!56295 (_ BitVec 32))) (Found!13475 (index!56296 (_ BitVec 32))) (Intermediate!13475 (undefined!14287 Bool) (index!56297 (_ BitVec 32)) (x!138030 (_ BitVec 32))) (Undefined!13475) (MissingVacant!13475 (index!56298 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102272 (_ BitVec 32)) SeekEntryResult!13475)

(assert (=> b!1539389 (= res!1056275 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49349 a!2792) j!64) a!2792 mask!2480) (Found!13475 j!64)))))

(declare-fun b!1539390 () Bool)

(declare-fun res!1056283 () Bool)

(assert (=> b!1539390 (=> (not res!1056283) (not e!856266))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539390 (= res!1056283 (and (= (size!49899 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49899 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49899 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539391 () Bool)

(declare-fun res!1056279 () Bool)

(assert (=> b!1539391 (=> (not res!1056279) (not e!856266))))

(assert (=> b!1539391 (= res!1056279 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49899 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49899 a!2792)) (= (select (arr!49349 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539392 () Bool)

(declare-fun lt!665044 () (_ BitVec 32))

(assert (=> b!1539392 (= e!856266 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (or (bvslt lt!665044 #b00000000000000000000000000000000) (bvsge lt!665044 (size!49899 a!2792)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539392 (= lt!665044 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun res!1056276 () Bool)

(assert (=> start!131246 (=> (not res!1056276) (not e!856266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131246 (= res!1056276 (validMask!0 mask!2480))))

(assert (=> start!131246 e!856266))

(assert (=> start!131246 true))

(declare-fun array_inv!38377 (array!102272) Bool)

(assert (=> start!131246 (array_inv!38377 a!2792)))

(declare-fun b!1539393 () Bool)

(declare-fun res!1056282 () Bool)

(assert (=> b!1539393 (=> (not res!1056282) (not e!856266))))

(assert (=> b!1539393 (= res!1056282 (validKeyInArray!0 (select (arr!49349 a!2792) i!951)))))

(declare-fun b!1539394 () Bool)

(declare-fun res!1056280 () Bool)

(assert (=> b!1539394 (=> (not res!1056280) (not e!856266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102272 (_ BitVec 32)) Bool)

(assert (=> b!1539394 (= res!1056280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539395 () Bool)

(declare-fun res!1056278 () Bool)

(assert (=> b!1539395 (=> (not res!1056278) (not e!856266))))

(declare-datatypes ((List!35823 0))(
  ( (Nil!35820) (Cons!35819 (h!37264 (_ BitVec 64)) (t!50517 List!35823)) )
))
(declare-fun arrayNoDuplicates!0 (array!102272 (_ BitVec 32) List!35823) Bool)

(assert (=> b!1539395 (= res!1056278 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35820))))

(assert (= (and start!131246 res!1056276) b!1539390))

(assert (= (and b!1539390 res!1056283) b!1539393))

(assert (= (and b!1539393 res!1056282) b!1539387))

(assert (= (and b!1539387 res!1056281) b!1539394))

(assert (= (and b!1539394 res!1056280) b!1539395))

(assert (= (and b!1539395 res!1056278) b!1539391))

(assert (= (and b!1539391 res!1056279) b!1539389))

(assert (= (and b!1539389 res!1056275) b!1539388))

(assert (= (and b!1539388 res!1056277) b!1539392))

(declare-fun m!1421667 () Bool)

(assert (=> start!131246 m!1421667))

(declare-fun m!1421669 () Bool)

(assert (=> start!131246 m!1421669))

(declare-fun m!1421671 () Bool)

(assert (=> b!1539393 m!1421671))

(assert (=> b!1539393 m!1421671))

(declare-fun m!1421673 () Bool)

(assert (=> b!1539393 m!1421673))

(declare-fun m!1421675 () Bool)

(assert (=> b!1539387 m!1421675))

(assert (=> b!1539387 m!1421675))

(declare-fun m!1421677 () Bool)

(assert (=> b!1539387 m!1421677))

(declare-fun m!1421679 () Bool)

(assert (=> b!1539388 m!1421679))

(assert (=> b!1539388 m!1421675))

(declare-fun m!1421681 () Bool)

(assert (=> b!1539394 m!1421681))

(declare-fun m!1421683 () Bool)

(assert (=> b!1539392 m!1421683))

(assert (=> b!1539389 m!1421675))

(assert (=> b!1539389 m!1421675))

(declare-fun m!1421685 () Bool)

(assert (=> b!1539389 m!1421685))

(declare-fun m!1421687 () Bool)

(assert (=> b!1539391 m!1421687))

(declare-fun m!1421689 () Bool)

(assert (=> b!1539395 m!1421689))

(push 1)

(assert (not b!1539389))

(assert (not b!1539394))

(assert (not b!1539393))

(assert (not b!1539387))

(assert (not b!1539395))

(assert (not start!131246))

(assert (not b!1539392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!160433 () Bool)

(declare-fun lt!665065 () (_ BitVec 32))

(assert (=> d!160433 (and (bvsge lt!665065 #b00000000000000000000000000000000) (bvslt lt!665065 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160433 (= lt!665065 (choose!52 index!463 x!510 mask!2480))))

(assert (=> d!160433 (validMask!0 mask!2480)))

(assert (=> d!160433 (= (nextIndex!0 index!463 x!510 mask!2480) lt!665065)))

(declare-fun bs!44195 () Bool)

(assert (= bs!44195 d!160433))

(declare-fun m!1421753 () Bool)

(assert (=> bs!44195 m!1421753))

(assert (=> bs!44195 m!1421667))

(assert (=> b!1539392 d!160433))

(declare-fun d!160435 () Bool)

(assert (=> d!160435 (= (validKeyInArray!0 (select (arr!49349 a!2792) j!64)) (and (not (= (select (arr!49349 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49349 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539387 d!160435))

(declare-fun d!160437 () Bool)

(assert (=> d!160437 (= (validKeyInArray!0 (select (arr!49349 a!2792) i!951)) (and (not (= (select (arr!49349 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49349 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539393 d!160437))

(declare-fun b!1539498 () Bool)

(declare-fun e!856313 () Bool)

(declare-fun e!856312 () Bool)

(assert (=> b!1539498 (= e!856313 e!856312)))

(declare-fun lt!665080 () (_ BitVec 64))

(assert (=> b!1539498 (= lt!665080 (select (arr!49349 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51412 0))(
  ( (Unit!51413) )
))
(declare-fun lt!665078 () Unit!51412)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102272 (_ BitVec 64) (_ BitVec 32)) Unit!51412)

(assert (=> b!1539498 (= lt!665078 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!665080 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102272 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1539498 (arrayContainsKey!0 a!2792 lt!665080 #b00000000000000000000000000000000)))

(declare-fun lt!665079 () Unit!51412)

(assert (=> b!1539498 (= lt!665079 lt!665078)))

(declare-fun res!1056354 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102272 (_ BitVec 32)) SeekEntryResult!13475)

(assert (=> b!1539498 (= res!1056354 (= (seekEntryOrOpen!0 (select (arr!49349 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13475 #b00000000000000000000000000000000)))))

(assert (=> b!1539498 (=> (not res!1056354) (not e!856312))))

(declare-fun b!1539499 () Bool)

(declare-fun call!68624 () Bool)

(assert (=> b!1539499 (= e!856312 call!68624)))

(declare-fun d!160439 () Bool)

(declare-fun res!1056355 () Bool)

(declare-fun e!856314 () Bool)

(assert (=> d!160439 (=> res!1056355 e!856314)))

(assert (=> d!160439 (= res!1056355 (bvsge #b00000000000000000000000000000000 (size!49899 a!2792)))))

(assert (=> d!160439 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!856314)))

(declare-fun b!1539500 () Bool)

(assert (=> b!1539500 (= e!856313 call!68624)))

(declare-fun b!1539501 () Bool)

(assert (=> b!1539501 (= e!856314 e!856313)))

(declare-fun c!141130 () Bool)

(assert (=> b!1539501 (= c!141130 (validKeyInArray!0 (select (arr!49349 a!2792) #b00000000000000000000000000000000)))))

(declare-fun bm!68621 () Bool)

(assert (=> bm!68621 (= call!68624 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(assert (= (and d!160439 (not res!1056355)) b!1539501))

(assert (= (and b!1539501 c!141130) b!1539498))

(assert (= (and b!1539501 (not c!141130)) b!1539500))

(assert (= (and b!1539498 res!1056354) b!1539499))

(assert (= (or b!1539499 b!1539500) bm!68621))

(declare-fun m!1421761 () Bool)

(assert (=> b!1539498 m!1421761))

(declare-fun m!1421763 () Bool)

(assert (=> b!1539498 m!1421763))

(declare-fun m!1421765 () Bool)

(assert (=> b!1539498 m!1421765))

(assert (=> b!1539498 m!1421761))

(declare-fun m!1421767 () Bool)

(assert (=> b!1539498 m!1421767))

(assert (=> b!1539501 m!1421761))

(assert (=> b!1539501 m!1421761))

(declare-fun m!1421769 () Bool)

(assert (=> b!1539501 m!1421769))

(declare-fun m!1421771 () Bool)

(assert (=> bm!68621 m!1421771))

(assert (=> b!1539394 d!160439))

(declare-fun b!1539546 () Bool)

(declare-fun e!856346 () SeekEntryResult!13475)

(assert (=> b!1539546 (= e!856346 (Found!13475 index!463))))

(declare-fun b!1539547 () Bool)

(declare-fun e!856348 () SeekEntryResult!13475)

(assert (=> b!1539547 (= e!856348 Undefined!13475)))

(declare-fun b!1539548 () Bool)

(declare-fun e!856347 () SeekEntryResult!13475)

(assert (=> b!1539548 (= e!856347 (MissingVacant!13475 vacantIndex!5))))

(declare-fun b!1539549 () Bool)

(assert (=> b!1539549 (= e!856347 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (arr!49349 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539550 () Bool)

(declare-fun c!141146 () Bool)

(declare-fun lt!665094 () (_ BitVec 64))

(assert (=> b!1539550 (= c!141146 (= lt!665094 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1539550 (= e!856346 e!856347)))

(declare-fun lt!665095 () SeekEntryResult!13475)

(declare-fun d!160445 () Bool)

(assert (=> d!160445 (and (or (is-Undefined!13475 lt!665095) (not (is-Found!13475 lt!665095)) (and (bvsge (index!56296 lt!665095) #b00000000000000000000000000000000) (bvslt (index!56296 lt!665095) (size!49899 a!2792)))) (or (is-Undefined!13475 lt!665095) (is-Found!13475 lt!665095) (not (is-MissingVacant!13475 lt!665095)) (not (= (index!56298 lt!665095) vacantIndex!5)) (and (bvsge (index!56298 lt!665095) #b00000000000000000000000000000000) (bvslt (index!56298 lt!665095) (size!49899 a!2792)))) (or (is-Undefined!13475 lt!665095) (ite (is-Found!13475 lt!665095) (= (select (arr!49349 a!2792) (index!56296 lt!665095)) (select (arr!49349 a!2792) j!64)) (and (is-MissingVacant!13475 lt!665095) (= (index!56298 lt!665095) vacantIndex!5) (= (select (arr!49349 a!2792) (index!56298 lt!665095)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160445 (= lt!665095 e!856348)))

(declare-fun c!141145 () Bool)

(assert (=> d!160445 (= c!141145 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!160445 (= lt!665094 (select (arr!49349 a!2792) index!463))))

(assert (=> d!160445 (validMask!0 mask!2480)))

(assert (=> d!160445 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49349 a!2792) j!64) a!2792 mask!2480) lt!665095)))

(declare-fun b!1539551 () Bool)

(assert (=> b!1539551 (= e!856348 e!856346)))

(declare-fun c!141144 () Bool)

(assert (=> b!1539551 (= c!141144 (= lt!665094 (select (arr!49349 a!2792) j!64)))))

(assert (= (and d!160445 c!141145) b!1539547))

(assert (= (and d!160445 (not c!141145)) b!1539551))

(assert (= (and b!1539551 c!141144) b!1539546))

(assert (= (and b!1539551 (not c!141144)) b!1539550))

(assert (= (and b!1539550 c!141146) b!1539548))

(assert (= (and b!1539550 (not c!141146)) b!1539549))

(assert (=> b!1539549 m!1421683))

(assert (=> b!1539549 m!1421683))

(assert (=> b!1539549 m!1421675))

(declare-fun m!1421793 () Bool)

(assert (=> b!1539549 m!1421793))

(declare-fun m!1421795 () Bool)

(assert (=> d!160445 m!1421795))

(declare-fun m!1421797 () Bool)

(assert (=> d!160445 m!1421797))

(assert (=> d!160445 m!1421679))

(assert (=> d!160445 m!1421667))

(assert (=> b!1539389 d!160445))

(declare-fun bm!68631 () Bool)

(declare-fun call!68634 () Bool)

(declare-fun c!141155 () Bool)

(assert (=> bm!68631 (= call!68634 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141155 (Cons!35819 (select (arr!49349 a!2792) #b00000000000000000000000000000000) Nil!35820) Nil!35820)))))

(declare-fun b!1539574 () Bool)

(declare-fun e!856363 () Bool)

(assert (=> b!1539574 (= e!856363 call!68634)))

(declare-fun b!1539575 () Bool)

(declare-fun e!856365 () Bool)

(assert (=> b!1539575 (= e!856365 e!856363)))

(assert (=> b!1539575 (= c!141155 (validKeyInArray!0 (select (arr!49349 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539576 () Bool)

(declare-fun e!856364 () Bool)

(assert (=> b!1539576 (= e!856364 e!856365)))

(declare-fun res!1056382 () Bool)

(assert (=> b!1539576 (=> (not res!1056382) (not e!856365))))

(declare-fun e!856366 () Bool)

(assert (=> b!1539576 (= res!1056382 (not e!856366))))

(declare-fun res!1056381 () Bool)

(assert (=> b!1539576 (=> (not res!1056381) (not e!856366))))

(assert (=> b!1539576 (= res!1056381 (validKeyInArray!0 (select (arr!49349 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539577 () Bool)

(declare-fun contains!10015 (List!35823 (_ BitVec 64)) Bool)

(assert (=> b!1539577 (= e!856366 (contains!10015 Nil!35820 (select (arr!49349 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539578 () Bool)

(assert (=> b!1539578 (= e!856363 call!68634)))

(declare-fun d!160455 () Bool)

(declare-fun res!1056380 () Bool)

(assert (=> d!160455 (=> res!1056380 e!856364)))

(assert (=> d!160455 (= res!1056380 (bvsge #b00000000000000000000000000000000 (size!49899 a!2792)))))

(assert (=> d!160455 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35820) e!856364)))

(assert (= (and d!160455 (not res!1056380)) b!1539576))

(assert (= (and b!1539576 res!1056381) b!1539577))

(assert (= (and b!1539576 res!1056382) b!1539575))

(assert (= (and b!1539575 c!141155) b!1539578))

(assert (= (and b!1539575 (not c!141155)) b!1539574))

(assert (= (or b!1539578 b!1539574) bm!68631))

(assert (=> bm!68631 m!1421761))

(declare-fun m!1421799 () Bool)

(assert (=> bm!68631 m!1421799))

(assert (=> b!1539575 m!1421761))

(assert (=> b!1539575 m!1421761))

(assert (=> b!1539575 m!1421769))

(assert (=> b!1539576 m!1421761))

(assert (=> b!1539576 m!1421761))

(assert (=> b!1539576 m!1421769))

(assert (=> b!1539577 m!1421761))

(assert (=> b!1539577 m!1421761))

(declare-fun m!1421801 () Bool)

(assert (=> b!1539577 m!1421801))

(assert (=> b!1539395 d!160455))

(declare-fun d!160457 () Bool)

(assert (=> d!160457 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131246 d!160457))

(declare-fun d!160463 () Bool)

(assert (=> d!160463 (= (array_inv!38377 a!2792) (bvsge (size!49899 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131246 d!160463))

(push 1)

