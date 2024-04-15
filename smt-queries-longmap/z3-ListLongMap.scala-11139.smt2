; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130080 () Bool)

(assert start!130080)

(declare-fun b!1527301 () Bool)

(declare-fun res!1045524 () Bool)

(declare-fun e!851222 () Bool)

(assert (=> b!1527301 (=> (not res!1045524) (not e!851222))))

(declare-datatypes ((array!101491 0))(
  ( (array!101492 (arr!48973 (Array (_ BitVec 32) (_ BitVec 64))) (size!49525 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101491)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527301 (= res!1045524 (validKeyInArray!0 (select (arr!48973 a!2804) i!961)))))

(declare-fun b!1527302 () Bool)

(declare-fun res!1045523 () Bool)

(assert (=> b!1527302 (=> (not res!1045523) (not e!851222))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1527302 (= res!1045523 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49525 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49525 a!2804))))))

(declare-fun b!1527303 () Bool)

(declare-fun res!1045527 () Bool)

(assert (=> b!1527303 (=> (not res!1045527) (not e!851222))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1527303 (= res!1045527 (and (= (size!49525 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49525 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49525 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527304 () Bool)

(declare-fun e!851223 () Bool)

(declare-datatypes ((SeekEntryResult!13161 0))(
  ( (MissingZero!13161 (index!55039 (_ BitVec 32))) (Found!13161 (index!55040 (_ BitVec 32))) (Intermediate!13161 (undefined!13973 Bool) (index!55041 (_ BitVec 32)) (x!136730 (_ BitVec 32))) (Undefined!13161) (MissingVacant!13161 (index!55042 (_ BitVec 32))) )
))
(declare-fun lt!661218 () SeekEntryResult!13161)

(assert (=> b!1527304 (= e!851223 (= lt!661218 (Found!13161 j!70)))))

(declare-fun e!851221 () Bool)

(assert (=> b!1527304 e!851221))

(declare-fun res!1045519 () Bool)

(assert (=> b!1527304 (=> (not res!1045519) (not e!851221))))

(declare-fun lt!661212 () SeekEntryResult!13161)

(assert (=> b!1527304 (= res!1045519 (= lt!661212 lt!661218))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101491 (_ BitVec 32)) SeekEntryResult!13161)

(assert (=> b!1527304 (= lt!661218 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48973 a!2804) j!70) a!2804 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101491 (_ BitVec 32)) SeekEntryResult!13161)

(assert (=> b!1527304 (= lt!661212 (seekEntryOrOpen!0 (select (arr!48973 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527305 () Bool)

(declare-fun e!851227 () Bool)

(declare-fun e!851225 () Bool)

(assert (=> b!1527305 (= e!851227 e!851225)))

(declare-fun res!1045526 () Bool)

(assert (=> b!1527305 (=> (not res!1045526) (not e!851225))))

(declare-fun lt!661214 () (_ BitVec 64))

(declare-fun lt!661215 () array!101491)

(declare-fun lt!661213 () SeekEntryResult!13161)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101491 (_ BitVec 32)) SeekEntryResult!13161)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527305 (= res!1045526 (= lt!661213 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661214 mask!2512) lt!661214 lt!661215 mask!2512)))))

(assert (=> b!1527305 (= lt!661214 (select (store (arr!48973 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527305 (= lt!661215 (array!101492 (store (arr!48973 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49525 a!2804)))))

(declare-fun e!851224 () Bool)

(declare-fun b!1527306 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101491 (_ BitVec 32)) SeekEntryResult!13161)

(assert (=> b!1527306 (= e!851224 (= (seekEntry!0 (select (arr!48973 a!2804) j!70) a!2804 mask!2512) (Found!13161 j!70)))))

(declare-fun b!1527307 () Bool)

(assert (=> b!1527307 (= e!851222 e!851227)))

(declare-fun res!1045520 () Bool)

(assert (=> b!1527307 (=> (not res!1045520) (not e!851227))))

(declare-fun lt!661216 () SeekEntryResult!13161)

(assert (=> b!1527307 (= res!1045520 (= lt!661213 lt!661216))))

(assert (=> b!1527307 (= lt!661216 (Intermediate!13161 false resIndex!21 resX!21))))

(assert (=> b!1527307 (= lt!661213 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48973 a!2804) j!70) mask!2512) (select (arr!48973 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527308 () Bool)

(declare-fun res!1045521 () Bool)

(assert (=> b!1527308 (=> (not res!1045521) (not e!851222))))

(assert (=> b!1527308 (= res!1045521 (validKeyInArray!0 (select (arr!48973 a!2804) j!70)))))

(declare-fun res!1045531 () Bool)

(assert (=> start!130080 (=> (not res!1045531) (not e!851222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130080 (= res!1045531 (validMask!0 mask!2512))))

(assert (=> start!130080 e!851222))

(assert (=> start!130080 true))

(declare-fun array_inv!38206 (array!101491) Bool)

(assert (=> start!130080 (array_inv!38206 a!2804)))

(declare-fun b!1527309 () Bool)

(assert (=> b!1527309 (= e!851221 (= (seekEntryOrOpen!0 lt!661214 lt!661215 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661214 lt!661215 mask!2512)))))

(declare-fun b!1527310 () Bool)

(assert (=> b!1527310 (= e!851225 (not e!851223))))

(declare-fun res!1045530 () Bool)

(assert (=> b!1527310 (=> res!1045530 e!851223)))

(assert (=> b!1527310 (= res!1045530 (or (not (= (select (arr!48973 a!2804) j!70) lt!661214)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48973 a!2804) index!487) (select (arr!48973 a!2804) j!70)) (not (= (select (arr!48973 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1527310 e!851224))

(declare-fun res!1045528 () Bool)

(assert (=> b!1527310 (=> (not res!1045528) (not e!851224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101491 (_ BitVec 32)) Bool)

(assert (=> b!1527310 (= res!1045528 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50945 0))(
  ( (Unit!50946) )
))
(declare-fun lt!661217 () Unit!50945)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50945)

(assert (=> b!1527310 (= lt!661217 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527311 () Bool)

(declare-fun res!1045522 () Bool)

(assert (=> b!1527311 (=> (not res!1045522) (not e!851222))))

(declare-datatypes ((List!35534 0))(
  ( (Nil!35531) (Cons!35530 (h!36964 (_ BitVec 64)) (t!50220 List!35534)) )
))
(declare-fun arrayNoDuplicates!0 (array!101491 (_ BitVec 32) List!35534) Bool)

(assert (=> b!1527311 (= res!1045522 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35531))))

(declare-fun b!1527312 () Bool)

(declare-fun res!1045529 () Bool)

(assert (=> b!1527312 (=> (not res!1045529) (not e!851227))))

(assert (=> b!1527312 (= res!1045529 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48973 a!2804) j!70) a!2804 mask!2512) lt!661216))))

(declare-fun b!1527313 () Bool)

(declare-fun res!1045525 () Bool)

(assert (=> b!1527313 (=> (not res!1045525) (not e!851222))))

(assert (=> b!1527313 (= res!1045525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130080 res!1045531) b!1527303))

(assert (= (and b!1527303 res!1045527) b!1527301))

(assert (= (and b!1527301 res!1045524) b!1527308))

(assert (= (and b!1527308 res!1045521) b!1527313))

(assert (= (and b!1527313 res!1045525) b!1527311))

(assert (= (and b!1527311 res!1045522) b!1527302))

(assert (= (and b!1527302 res!1045523) b!1527307))

(assert (= (and b!1527307 res!1045520) b!1527312))

(assert (= (and b!1527312 res!1045529) b!1527305))

(assert (= (and b!1527305 res!1045526) b!1527310))

(assert (= (and b!1527310 res!1045528) b!1527306))

(assert (= (and b!1527310 (not res!1045530)) b!1527304))

(assert (= (and b!1527304 res!1045519) b!1527309))

(declare-fun m!1409639 () Bool)

(assert (=> b!1527309 m!1409639))

(declare-fun m!1409641 () Bool)

(assert (=> b!1527309 m!1409641))

(declare-fun m!1409643 () Bool)

(assert (=> b!1527312 m!1409643))

(assert (=> b!1527312 m!1409643))

(declare-fun m!1409645 () Bool)

(assert (=> b!1527312 m!1409645))

(assert (=> b!1527307 m!1409643))

(assert (=> b!1527307 m!1409643))

(declare-fun m!1409647 () Bool)

(assert (=> b!1527307 m!1409647))

(assert (=> b!1527307 m!1409647))

(assert (=> b!1527307 m!1409643))

(declare-fun m!1409649 () Bool)

(assert (=> b!1527307 m!1409649))

(assert (=> b!1527308 m!1409643))

(assert (=> b!1527308 m!1409643))

(declare-fun m!1409651 () Bool)

(assert (=> b!1527308 m!1409651))

(declare-fun m!1409653 () Bool)

(assert (=> b!1527301 m!1409653))

(assert (=> b!1527301 m!1409653))

(declare-fun m!1409655 () Bool)

(assert (=> b!1527301 m!1409655))

(assert (=> b!1527310 m!1409643))

(declare-fun m!1409657 () Bool)

(assert (=> b!1527310 m!1409657))

(declare-fun m!1409659 () Bool)

(assert (=> b!1527310 m!1409659))

(declare-fun m!1409661 () Bool)

(assert (=> b!1527310 m!1409661))

(declare-fun m!1409663 () Bool)

(assert (=> b!1527313 m!1409663))

(declare-fun m!1409665 () Bool)

(assert (=> b!1527311 m!1409665))

(declare-fun m!1409667 () Bool)

(assert (=> b!1527305 m!1409667))

(assert (=> b!1527305 m!1409667))

(declare-fun m!1409669 () Bool)

(assert (=> b!1527305 m!1409669))

(declare-fun m!1409671 () Bool)

(assert (=> b!1527305 m!1409671))

(declare-fun m!1409673 () Bool)

(assert (=> b!1527305 m!1409673))

(declare-fun m!1409675 () Bool)

(assert (=> start!130080 m!1409675))

(declare-fun m!1409677 () Bool)

(assert (=> start!130080 m!1409677))

(assert (=> b!1527304 m!1409643))

(assert (=> b!1527304 m!1409643))

(declare-fun m!1409679 () Bool)

(assert (=> b!1527304 m!1409679))

(assert (=> b!1527304 m!1409643))

(declare-fun m!1409681 () Bool)

(assert (=> b!1527304 m!1409681))

(assert (=> b!1527306 m!1409643))

(assert (=> b!1527306 m!1409643))

(declare-fun m!1409683 () Bool)

(assert (=> b!1527306 m!1409683))

(check-sat (not b!1527306) (not b!1527305) (not b!1527311) (not b!1527313) (not b!1527310) (not b!1527309) (not b!1527307) (not b!1527312) (not b!1527308) (not start!130080) (not b!1527304) (not b!1527301))
(check-sat)
(get-model)

(declare-fun b!1527452 () Bool)

(declare-fun e!851305 () SeekEntryResult!13161)

(assert (=> b!1527452 (= e!851305 (Found!13161 index!487))))

(declare-fun b!1527453 () Bool)

(declare-fun e!851306 () SeekEntryResult!13161)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527453 (= e!851306 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 (select (arr!48973 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527454 () Bool)

(assert (=> b!1527454 (= e!851306 (MissingVacant!13161 index!487))))

(declare-fun d!159343 () Bool)

(declare-fun lt!661286 () SeekEntryResult!13161)

(get-info :version)

(assert (=> d!159343 (and (or ((_ is Undefined!13161) lt!661286) (not ((_ is Found!13161) lt!661286)) (and (bvsge (index!55040 lt!661286) #b00000000000000000000000000000000) (bvslt (index!55040 lt!661286) (size!49525 a!2804)))) (or ((_ is Undefined!13161) lt!661286) ((_ is Found!13161) lt!661286) (not ((_ is MissingVacant!13161) lt!661286)) (not (= (index!55042 lt!661286) index!487)) (and (bvsge (index!55042 lt!661286) #b00000000000000000000000000000000) (bvslt (index!55042 lt!661286) (size!49525 a!2804)))) (or ((_ is Undefined!13161) lt!661286) (ite ((_ is Found!13161) lt!661286) (= (select (arr!48973 a!2804) (index!55040 lt!661286)) (select (arr!48973 a!2804) j!70)) (and ((_ is MissingVacant!13161) lt!661286) (= (index!55042 lt!661286) index!487) (= (select (arr!48973 a!2804) (index!55042 lt!661286)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!851307 () SeekEntryResult!13161)

(assert (=> d!159343 (= lt!661286 e!851307)))

(declare-fun c!140469 () Bool)

(assert (=> d!159343 (= c!140469 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!661287 () (_ BitVec 64))

(assert (=> d!159343 (= lt!661287 (select (arr!48973 a!2804) index!487))))

(assert (=> d!159343 (validMask!0 mask!2512)))

(assert (=> d!159343 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48973 a!2804) j!70) a!2804 mask!2512) lt!661286)))

(declare-fun b!1527455 () Bool)

(assert (=> b!1527455 (= e!851307 Undefined!13161)))

(declare-fun b!1527456 () Bool)

(assert (=> b!1527456 (= e!851307 e!851305)))

(declare-fun c!140468 () Bool)

(assert (=> b!1527456 (= c!140468 (= lt!661287 (select (arr!48973 a!2804) j!70)))))

(declare-fun b!1527457 () Bool)

(declare-fun c!140467 () Bool)

(assert (=> b!1527457 (= c!140467 (= lt!661287 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527457 (= e!851305 e!851306)))

(assert (= (and d!159343 c!140469) b!1527455))

(assert (= (and d!159343 (not c!140469)) b!1527456))

(assert (= (and b!1527456 c!140468) b!1527452))

(assert (= (and b!1527456 (not c!140468)) b!1527457))

(assert (= (and b!1527457 c!140467) b!1527454))

(assert (= (and b!1527457 (not c!140467)) b!1527453))

(declare-fun m!1409803 () Bool)

(assert (=> b!1527453 m!1409803))

(assert (=> b!1527453 m!1409803))

(assert (=> b!1527453 m!1409643))

(declare-fun m!1409805 () Bool)

(assert (=> b!1527453 m!1409805))

(declare-fun m!1409807 () Bool)

(assert (=> d!159343 m!1409807))

(declare-fun m!1409809 () Bool)

(assert (=> d!159343 m!1409809))

(assert (=> d!159343 m!1409657))

(assert (=> d!159343 m!1409675))

(assert (=> b!1527304 d!159343))

(declare-fun lt!661319 () SeekEntryResult!13161)

(declare-fun b!1527506 () Bool)

(declare-fun e!851332 () SeekEntryResult!13161)

(assert (=> b!1527506 (= e!851332 (seekKeyOrZeroReturnVacant!0 (x!136730 lt!661319) (index!55041 lt!661319) (index!55041 lt!661319) (select (arr!48973 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527507 () Bool)

(declare-fun e!851333 () SeekEntryResult!13161)

(declare-fun e!851334 () SeekEntryResult!13161)

(assert (=> b!1527507 (= e!851333 e!851334)))

(declare-fun lt!661318 () (_ BitVec 64))

(assert (=> b!1527507 (= lt!661318 (select (arr!48973 a!2804) (index!55041 lt!661319)))))

(declare-fun c!140494 () Bool)

(assert (=> b!1527507 (= c!140494 (= lt!661318 (select (arr!48973 a!2804) j!70)))))

(declare-fun d!159355 () Bool)

(declare-fun lt!661317 () SeekEntryResult!13161)

(assert (=> d!159355 (and (or ((_ is Undefined!13161) lt!661317) (not ((_ is Found!13161) lt!661317)) (and (bvsge (index!55040 lt!661317) #b00000000000000000000000000000000) (bvslt (index!55040 lt!661317) (size!49525 a!2804)))) (or ((_ is Undefined!13161) lt!661317) ((_ is Found!13161) lt!661317) (not ((_ is MissingZero!13161) lt!661317)) (and (bvsge (index!55039 lt!661317) #b00000000000000000000000000000000) (bvslt (index!55039 lt!661317) (size!49525 a!2804)))) (or ((_ is Undefined!13161) lt!661317) ((_ is Found!13161) lt!661317) ((_ is MissingZero!13161) lt!661317) (not ((_ is MissingVacant!13161) lt!661317)) (and (bvsge (index!55042 lt!661317) #b00000000000000000000000000000000) (bvslt (index!55042 lt!661317) (size!49525 a!2804)))) (or ((_ is Undefined!13161) lt!661317) (ite ((_ is Found!13161) lt!661317) (= (select (arr!48973 a!2804) (index!55040 lt!661317)) (select (arr!48973 a!2804) j!70)) (ite ((_ is MissingZero!13161) lt!661317) (= (select (arr!48973 a!2804) (index!55039 lt!661317)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13161) lt!661317) (= (select (arr!48973 a!2804) (index!55042 lt!661317)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159355 (= lt!661317 e!851333)))

(declare-fun c!140496 () Bool)

(assert (=> d!159355 (= c!140496 (and ((_ is Intermediate!13161) lt!661319) (undefined!13973 lt!661319)))))

(assert (=> d!159355 (= lt!661319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48973 a!2804) j!70) mask!2512) (select (arr!48973 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159355 (validMask!0 mask!2512)))

(assert (=> d!159355 (= (seekEntryOrOpen!0 (select (arr!48973 a!2804) j!70) a!2804 mask!2512) lt!661317)))

(declare-fun b!1527508 () Bool)

(declare-fun c!140495 () Bool)

(assert (=> b!1527508 (= c!140495 (= lt!661318 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527508 (= e!851334 e!851332)))

(declare-fun b!1527509 () Bool)

(assert (=> b!1527509 (= e!851332 (MissingZero!13161 (index!55041 lt!661319)))))

(declare-fun b!1527510 () Bool)

(assert (=> b!1527510 (= e!851334 (Found!13161 (index!55041 lt!661319)))))

(declare-fun b!1527511 () Bool)

(assert (=> b!1527511 (= e!851333 Undefined!13161)))

(assert (= (and d!159355 c!140496) b!1527511))

(assert (= (and d!159355 (not c!140496)) b!1527507))

(assert (= (and b!1527507 c!140494) b!1527510))

(assert (= (and b!1527507 (not c!140494)) b!1527508))

(assert (= (and b!1527508 c!140495) b!1527509))

(assert (= (and b!1527508 (not c!140495)) b!1527506))

(assert (=> b!1527506 m!1409643))

(declare-fun m!1409827 () Bool)

(assert (=> b!1527506 m!1409827))

(declare-fun m!1409829 () Bool)

(assert (=> b!1527507 m!1409829))

(declare-fun m!1409831 () Bool)

(assert (=> d!159355 m!1409831))

(declare-fun m!1409833 () Bool)

(assert (=> d!159355 m!1409833))

(assert (=> d!159355 m!1409675))

(assert (=> d!159355 m!1409647))

(assert (=> d!159355 m!1409643))

(assert (=> d!159355 m!1409649))

(assert (=> d!159355 m!1409643))

(assert (=> d!159355 m!1409647))

(declare-fun m!1409835 () Bool)

(assert (=> d!159355 m!1409835))

(assert (=> b!1527304 d!159355))

(declare-fun b!1527566 () Bool)

(declare-fun e!851367 () Bool)

(declare-fun lt!661337 () SeekEntryResult!13161)

(assert (=> b!1527566 (= e!851367 (bvsge (x!136730 lt!661337) #b01111111111111111111111111111110))))

(declare-fun b!1527567 () Bool)

(assert (=> b!1527567 (and (bvsge (index!55041 lt!661337) #b00000000000000000000000000000000) (bvslt (index!55041 lt!661337) (size!49525 lt!661215)))))

(declare-fun res!1045635 () Bool)

(assert (=> b!1527567 (= res!1045635 (= (select (arr!48973 lt!661215) (index!55041 lt!661337)) lt!661214))))

(declare-fun e!851364 () Bool)

(assert (=> b!1527567 (=> res!1045635 e!851364)))

(declare-fun e!851363 () Bool)

(assert (=> b!1527567 (= e!851363 e!851364)))

(declare-fun b!1527568 () Bool)

(assert (=> b!1527568 (and (bvsge (index!55041 lt!661337) #b00000000000000000000000000000000) (bvslt (index!55041 lt!661337) (size!49525 lt!661215)))))

(declare-fun res!1045636 () Bool)

(assert (=> b!1527568 (= res!1045636 (= (select (arr!48973 lt!661215) (index!55041 lt!661337)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527568 (=> res!1045636 e!851364)))

(declare-fun b!1527569 () Bool)

(assert (=> b!1527569 (and (bvsge (index!55041 lt!661337) #b00000000000000000000000000000000) (bvslt (index!55041 lt!661337) (size!49525 lt!661215)))))

(assert (=> b!1527569 (= e!851364 (= (select (arr!48973 lt!661215) (index!55041 lt!661337)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1527570 () Bool)

(assert (=> b!1527570 (= e!851367 e!851363)))

(declare-fun res!1045637 () Bool)

(assert (=> b!1527570 (= res!1045637 (and ((_ is Intermediate!13161) lt!661337) (not (undefined!13973 lt!661337)) (bvslt (x!136730 lt!661337) #b01111111111111111111111111111110) (bvsge (x!136730 lt!661337) #b00000000000000000000000000000000) (bvsge (x!136730 lt!661337) #b00000000000000000000000000000000)))))

(assert (=> b!1527570 (=> (not res!1045637) (not e!851363))))

(declare-fun b!1527571 () Bool)

(declare-fun e!851366 () SeekEntryResult!13161)

(assert (=> b!1527571 (= e!851366 (Intermediate!13161 true (toIndex!0 lt!661214 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1527572 () Bool)

(declare-fun e!851365 () SeekEntryResult!13161)

(assert (=> b!1527572 (= e!851365 (Intermediate!13161 false (toIndex!0 lt!661214 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1527573 () Bool)

(assert (=> b!1527573 (= e!851365 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!661214 mask!2512) #b00000000000000000000000000000000 mask!2512) lt!661214 lt!661215 mask!2512))))

(declare-fun d!159361 () Bool)

(assert (=> d!159361 e!851367))

(declare-fun c!140522 () Bool)

(assert (=> d!159361 (= c!140522 (and ((_ is Intermediate!13161) lt!661337) (undefined!13973 lt!661337)))))

(assert (=> d!159361 (= lt!661337 e!851366)))

(declare-fun c!140523 () Bool)

(assert (=> d!159361 (= c!140523 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!661336 () (_ BitVec 64))

(assert (=> d!159361 (= lt!661336 (select (arr!48973 lt!661215) (toIndex!0 lt!661214 mask!2512)))))

(assert (=> d!159361 (validMask!0 mask!2512)))

(assert (=> d!159361 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661214 mask!2512) lt!661214 lt!661215 mask!2512) lt!661337)))

(declare-fun b!1527574 () Bool)

(assert (=> b!1527574 (= e!851366 e!851365)))

(declare-fun c!140521 () Bool)

(assert (=> b!1527574 (= c!140521 (or (= lt!661336 lt!661214) (= (bvadd lt!661336 lt!661336) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!159361 c!140523) b!1527571))

(assert (= (and d!159361 (not c!140523)) b!1527574))

(assert (= (and b!1527574 c!140521) b!1527572))

(assert (= (and b!1527574 (not c!140521)) b!1527573))

(assert (= (and d!159361 c!140522) b!1527566))

(assert (= (and d!159361 (not c!140522)) b!1527570))

(assert (= (and b!1527570 res!1045637) b!1527567))

(assert (= (and b!1527567 (not res!1045635)) b!1527568))

(assert (= (and b!1527568 (not res!1045636)) b!1527569))

(declare-fun m!1409853 () Bool)

(assert (=> b!1527567 m!1409853))

(assert (=> b!1527569 m!1409853))

(assert (=> b!1527573 m!1409667))

(declare-fun m!1409855 () Bool)

(assert (=> b!1527573 m!1409855))

(assert (=> b!1527573 m!1409855))

(declare-fun m!1409857 () Bool)

(assert (=> b!1527573 m!1409857))

(assert (=> d!159361 m!1409667))

(declare-fun m!1409859 () Bool)

(assert (=> d!159361 m!1409859))

(assert (=> d!159361 m!1409675))

(assert (=> b!1527568 m!1409853))

(assert (=> b!1527305 d!159361))

(declare-fun d!159367 () Bool)

(declare-fun lt!661352 () (_ BitVec 32))

(declare-fun lt!661351 () (_ BitVec 32))

(assert (=> d!159367 (= lt!661352 (bvmul (bvxor lt!661351 (bvlshr lt!661351 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159367 (= lt!661351 ((_ extract 31 0) (bvand (bvxor lt!661214 (bvlshr lt!661214 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159367 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1045638 (let ((h!36968 ((_ extract 31 0) (bvand (bvxor lt!661214 (bvlshr lt!661214 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136739 (bvmul (bvxor h!36968 (bvlshr h!36968 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136739 (bvlshr x!136739 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1045638 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1045638 #b00000000000000000000000000000000))))))

(assert (=> d!159367 (= (toIndex!0 lt!661214 mask!2512) (bvand (bvxor lt!661352 (bvlshr lt!661352 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1527305 d!159367))

(declare-fun b!1527624 () Bool)

(declare-fun e!851397 () Bool)

(declare-fun call!68440 () Bool)

(assert (=> b!1527624 (= e!851397 call!68440)))

(declare-fun bm!68437 () Bool)

(declare-fun c!140544 () Bool)

(assert (=> bm!68437 (= call!68440 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140544 (Cons!35530 (select (arr!48973 a!2804) #b00000000000000000000000000000000) Nil!35531) Nil!35531)))))

(declare-fun b!1527625 () Bool)

(declare-fun e!851398 () Bool)

(assert (=> b!1527625 (= e!851398 e!851397)))

(assert (=> b!1527625 (= c!140544 (validKeyInArray!0 (select (arr!48973 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159371 () Bool)

(declare-fun res!1045650 () Bool)

(declare-fun e!851399 () Bool)

(assert (=> d!159371 (=> res!1045650 e!851399)))

(assert (=> d!159371 (= res!1045650 (bvsge #b00000000000000000000000000000000 (size!49525 a!2804)))))

(assert (=> d!159371 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35531) e!851399)))

(declare-fun b!1527626 () Bool)

(declare-fun e!851396 () Bool)

(declare-fun contains!9958 (List!35534 (_ BitVec 64)) Bool)

(assert (=> b!1527626 (= e!851396 (contains!9958 Nil!35531 (select (arr!48973 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1527627 () Bool)

(assert (=> b!1527627 (= e!851399 e!851398)))

(declare-fun res!1045648 () Bool)

(assert (=> b!1527627 (=> (not res!1045648) (not e!851398))))

(assert (=> b!1527627 (= res!1045648 (not e!851396))))

(declare-fun res!1045649 () Bool)

(assert (=> b!1527627 (=> (not res!1045649) (not e!851396))))

(assert (=> b!1527627 (= res!1045649 (validKeyInArray!0 (select (arr!48973 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1527628 () Bool)

(assert (=> b!1527628 (= e!851397 call!68440)))

(assert (= (and d!159371 (not res!1045650)) b!1527627))

(assert (= (and b!1527627 res!1045649) b!1527626))

(assert (= (and b!1527627 res!1045648) b!1527625))

(assert (= (and b!1527625 c!140544) b!1527628))

(assert (= (and b!1527625 (not c!140544)) b!1527624))

(assert (= (or b!1527628 b!1527624) bm!68437))

(declare-fun m!1409895 () Bool)

(assert (=> bm!68437 m!1409895))

(declare-fun m!1409897 () Bool)

(assert (=> bm!68437 m!1409897))

(assert (=> b!1527625 m!1409895))

(assert (=> b!1527625 m!1409895))

(declare-fun m!1409899 () Bool)

(assert (=> b!1527625 m!1409899))

(assert (=> b!1527626 m!1409895))

(assert (=> b!1527626 m!1409895))

(declare-fun m!1409901 () Bool)

(assert (=> b!1527626 m!1409901))

(assert (=> b!1527627 m!1409895))

(assert (=> b!1527627 m!1409895))

(assert (=> b!1527627 m!1409899))

(assert (=> b!1527311 d!159371))

(declare-fun b!1527665 () Bool)

(declare-fun e!851427 () Bool)

(declare-fun call!68446 () Bool)

(assert (=> b!1527665 (= e!851427 call!68446)))

(declare-fun d!159387 () Bool)

(declare-fun res!1045665 () Bool)

(declare-fun e!851426 () Bool)

(assert (=> d!159387 (=> res!1045665 e!851426)))

(assert (=> d!159387 (= res!1045665 (bvsge #b00000000000000000000000000000000 (size!49525 a!2804)))))

(assert (=> d!159387 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!851426)))

(declare-fun b!1527666 () Bool)

(assert (=> b!1527666 (= e!851426 e!851427)))

(declare-fun c!140556 () Bool)

(assert (=> b!1527666 (= c!140556 (validKeyInArray!0 (select (arr!48973 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68443 () Bool)

(assert (=> bm!68443 (= call!68446 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1527667 () Bool)

(declare-fun e!851425 () Bool)

(assert (=> b!1527667 (= e!851425 call!68446)))

(declare-fun b!1527668 () Bool)

(assert (=> b!1527668 (= e!851427 e!851425)))

(declare-fun lt!661382 () (_ BitVec 64))

(assert (=> b!1527668 (= lt!661382 (select (arr!48973 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!661383 () Unit!50945)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101491 (_ BitVec 64) (_ BitVec 32)) Unit!50945)

(assert (=> b!1527668 (= lt!661383 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!661382 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1527668 (arrayContainsKey!0 a!2804 lt!661382 #b00000000000000000000000000000000)))

(declare-fun lt!661381 () Unit!50945)

(assert (=> b!1527668 (= lt!661381 lt!661383)))

(declare-fun res!1045666 () Bool)

(assert (=> b!1527668 (= res!1045666 (= (seekEntryOrOpen!0 (select (arr!48973 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13161 #b00000000000000000000000000000000)))))

(assert (=> b!1527668 (=> (not res!1045666) (not e!851425))))

(assert (= (and d!159387 (not res!1045665)) b!1527666))

(assert (= (and b!1527666 c!140556) b!1527668))

(assert (= (and b!1527666 (not c!140556)) b!1527665))

(assert (= (and b!1527668 res!1045666) b!1527667))

(assert (= (or b!1527667 b!1527665) bm!68443))

(assert (=> b!1527666 m!1409895))

(assert (=> b!1527666 m!1409895))

(assert (=> b!1527666 m!1409899))

(declare-fun m!1409915 () Bool)

(assert (=> bm!68443 m!1409915))

(assert (=> b!1527668 m!1409895))

(declare-fun m!1409917 () Bool)

(assert (=> b!1527668 m!1409917))

(declare-fun m!1409919 () Bool)

(assert (=> b!1527668 m!1409919))

(assert (=> b!1527668 m!1409895))

(declare-fun m!1409921 () Bool)

(assert (=> b!1527668 m!1409921))

(assert (=> b!1527313 d!159387))

(declare-fun d!159391 () Bool)

(assert (=> d!159391 (= (validKeyInArray!0 (select (arr!48973 a!2804) i!961)) (and (not (= (select (arr!48973 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48973 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1527301 d!159391))

(declare-fun b!1527671 () Bool)

(declare-fun e!851432 () Bool)

(declare-fun lt!661385 () SeekEntryResult!13161)

(assert (=> b!1527671 (= e!851432 (bvsge (x!136730 lt!661385) #b01111111111111111111111111111110))))

(declare-fun b!1527672 () Bool)

(assert (=> b!1527672 (and (bvsge (index!55041 lt!661385) #b00000000000000000000000000000000) (bvslt (index!55041 lt!661385) (size!49525 a!2804)))))

(declare-fun res!1045669 () Bool)

(assert (=> b!1527672 (= res!1045669 (= (select (arr!48973 a!2804) (index!55041 lt!661385)) (select (arr!48973 a!2804) j!70)))))

(declare-fun e!851429 () Bool)

(assert (=> b!1527672 (=> res!1045669 e!851429)))

(declare-fun e!851428 () Bool)

(assert (=> b!1527672 (= e!851428 e!851429)))

(declare-fun b!1527673 () Bool)

(assert (=> b!1527673 (and (bvsge (index!55041 lt!661385) #b00000000000000000000000000000000) (bvslt (index!55041 lt!661385) (size!49525 a!2804)))))

(declare-fun res!1045670 () Bool)

(assert (=> b!1527673 (= res!1045670 (= (select (arr!48973 a!2804) (index!55041 lt!661385)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527673 (=> res!1045670 e!851429)))

(declare-fun b!1527674 () Bool)

(assert (=> b!1527674 (and (bvsge (index!55041 lt!661385) #b00000000000000000000000000000000) (bvslt (index!55041 lt!661385) (size!49525 a!2804)))))

(assert (=> b!1527674 (= e!851429 (= (select (arr!48973 a!2804) (index!55041 lt!661385)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1527675 () Bool)

(assert (=> b!1527675 (= e!851432 e!851428)))

(declare-fun res!1045671 () Bool)

(assert (=> b!1527675 (= res!1045671 (and ((_ is Intermediate!13161) lt!661385) (not (undefined!13973 lt!661385)) (bvslt (x!136730 lt!661385) #b01111111111111111111111111111110) (bvsge (x!136730 lt!661385) #b00000000000000000000000000000000) (bvsge (x!136730 lt!661385) x!534)))))

(assert (=> b!1527675 (=> (not res!1045671) (not e!851428))))

(declare-fun b!1527676 () Bool)

(declare-fun e!851431 () SeekEntryResult!13161)

(assert (=> b!1527676 (= e!851431 (Intermediate!13161 true index!487 x!534))))

(declare-fun b!1527677 () Bool)

(declare-fun e!851430 () SeekEntryResult!13161)

(assert (=> b!1527677 (= e!851430 (Intermediate!13161 false index!487 x!534))))

(declare-fun b!1527678 () Bool)

(assert (=> b!1527678 (= e!851430 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48973 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159393 () Bool)

(assert (=> d!159393 e!851432))

(declare-fun c!140558 () Bool)

(assert (=> d!159393 (= c!140558 (and ((_ is Intermediate!13161) lt!661385) (undefined!13973 lt!661385)))))

(assert (=> d!159393 (= lt!661385 e!851431)))

(declare-fun c!140559 () Bool)

(assert (=> d!159393 (= c!140559 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!661384 () (_ BitVec 64))

(assert (=> d!159393 (= lt!661384 (select (arr!48973 a!2804) index!487))))

(assert (=> d!159393 (validMask!0 mask!2512)))

(assert (=> d!159393 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48973 a!2804) j!70) a!2804 mask!2512) lt!661385)))

(declare-fun b!1527679 () Bool)

(assert (=> b!1527679 (= e!851431 e!851430)))

(declare-fun c!140557 () Bool)

(assert (=> b!1527679 (= c!140557 (or (= lt!661384 (select (arr!48973 a!2804) j!70)) (= (bvadd lt!661384 lt!661384) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!159393 c!140559) b!1527676))

(assert (= (and d!159393 (not c!140559)) b!1527679))

(assert (= (and b!1527679 c!140557) b!1527677))

(assert (= (and b!1527679 (not c!140557)) b!1527678))

(assert (= (and d!159393 c!140558) b!1527671))

(assert (= (and d!159393 (not c!140558)) b!1527675))

(assert (= (and b!1527675 res!1045671) b!1527672))

(assert (= (and b!1527672 (not res!1045669)) b!1527673))

(assert (= (and b!1527673 (not res!1045670)) b!1527674))

(declare-fun m!1409923 () Bool)

(assert (=> b!1527672 m!1409923))

(assert (=> b!1527674 m!1409923))

(assert (=> b!1527678 m!1409803))

(assert (=> b!1527678 m!1409803))

(assert (=> b!1527678 m!1409643))

(declare-fun m!1409925 () Bool)

(assert (=> b!1527678 m!1409925))

(assert (=> d!159393 m!1409657))

(assert (=> d!159393 m!1409675))

(assert (=> b!1527673 m!1409923))

(assert (=> b!1527312 d!159393))

(declare-fun d!159395 () Bool)

(assert (=> d!159395 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130080 d!159395))

(declare-fun d!159407 () Bool)

(assert (=> d!159407 (= (array_inv!38206 a!2804) (bvsge (size!49525 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130080 d!159407))

(declare-fun b!1527728 () Bool)

(declare-fun e!851458 () SeekEntryResult!13161)

(declare-fun lt!661415 () SeekEntryResult!13161)

(assert (=> b!1527728 (= e!851458 (seekKeyOrZeroReturnVacant!0 (x!136730 lt!661415) (index!55041 lt!661415) (index!55041 lt!661415) lt!661214 lt!661215 mask!2512))))

(declare-fun b!1527729 () Bool)

(declare-fun e!851459 () SeekEntryResult!13161)

(declare-fun e!851460 () SeekEntryResult!13161)

(assert (=> b!1527729 (= e!851459 e!851460)))

(declare-fun lt!661414 () (_ BitVec 64))

(assert (=> b!1527729 (= lt!661414 (select (arr!48973 lt!661215) (index!55041 lt!661415)))))

(declare-fun c!140581 () Bool)

(assert (=> b!1527729 (= c!140581 (= lt!661414 lt!661214))))

(declare-fun d!159411 () Bool)

(declare-fun lt!661413 () SeekEntryResult!13161)

(assert (=> d!159411 (and (or ((_ is Undefined!13161) lt!661413) (not ((_ is Found!13161) lt!661413)) (and (bvsge (index!55040 lt!661413) #b00000000000000000000000000000000) (bvslt (index!55040 lt!661413) (size!49525 lt!661215)))) (or ((_ is Undefined!13161) lt!661413) ((_ is Found!13161) lt!661413) (not ((_ is MissingZero!13161) lt!661413)) (and (bvsge (index!55039 lt!661413) #b00000000000000000000000000000000) (bvslt (index!55039 lt!661413) (size!49525 lt!661215)))) (or ((_ is Undefined!13161) lt!661413) ((_ is Found!13161) lt!661413) ((_ is MissingZero!13161) lt!661413) (not ((_ is MissingVacant!13161) lt!661413)) (and (bvsge (index!55042 lt!661413) #b00000000000000000000000000000000) (bvslt (index!55042 lt!661413) (size!49525 lt!661215)))) (or ((_ is Undefined!13161) lt!661413) (ite ((_ is Found!13161) lt!661413) (= (select (arr!48973 lt!661215) (index!55040 lt!661413)) lt!661214) (ite ((_ is MissingZero!13161) lt!661413) (= (select (arr!48973 lt!661215) (index!55039 lt!661413)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13161) lt!661413) (= (select (arr!48973 lt!661215) (index!55042 lt!661413)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159411 (= lt!661413 e!851459)))

(declare-fun c!140583 () Bool)

(assert (=> d!159411 (= c!140583 (and ((_ is Intermediate!13161) lt!661415) (undefined!13973 lt!661415)))))

(assert (=> d!159411 (= lt!661415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661214 mask!2512) lt!661214 lt!661215 mask!2512))))

(assert (=> d!159411 (validMask!0 mask!2512)))

(assert (=> d!159411 (= (seekEntryOrOpen!0 lt!661214 lt!661215 mask!2512) lt!661413)))

(declare-fun b!1527730 () Bool)

(declare-fun c!140582 () Bool)

(assert (=> b!1527730 (= c!140582 (= lt!661414 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527730 (= e!851460 e!851458)))

(declare-fun b!1527731 () Bool)

(assert (=> b!1527731 (= e!851458 (MissingZero!13161 (index!55041 lt!661415)))))

(declare-fun b!1527732 () Bool)

(assert (=> b!1527732 (= e!851460 (Found!13161 (index!55041 lt!661415)))))

(declare-fun b!1527733 () Bool)

(assert (=> b!1527733 (= e!851459 Undefined!13161)))

(assert (= (and d!159411 c!140583) b!1527733))

(assert (= (and d!159411 (not c!140583)) b!1527729))

(assert (= (and b!1527729 c!140581) b!1527732))

(assert (= (and b!1527729 (not c!140581)) b!1527730))

(assert (= (and b!1527730 c!140582) b!1527731))

(assert (= (and b!1527730 (not c!140582)) b!1527728))

(declare-fun m!1409963 () Bool)

(assert (=> b!1527728 m!1409963))

(declare-fun m!1409965 () Bool)

(assert (=> b!1527729 m!1409965))

(declare-fun m!1409967 () Bool)

(assert (=> d!159411 m!1409967))

(declare-fun m!1409969 () Bool)

(assert (=> d!159411 m!1409969))

(assert (=> d!159411 m!1409675))

(assert (=> d!159411 m!1409667))

(assert (=> d!159411 m!1409669))

(assert (=> d!159411 m!1409667))

(declare-fun m!1409971 () Bool)

(assert (=> d!159411 m!1409971))

(assert (=> b!1527309 d!159411))

(declare-fun b!1527734 () Bool)

(declare-fun e!851461 () SeekEntryResult!13161)

(assert (=> b!1527734 (= e!851461 (Found!13161 index!487))))

(declare-fun e!851462 () SeekEntryResult!13161)

(declare-fun b!1527735 () Bool)

(assert (=> b!1527735 (= e!851462 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 lt!661214 lt!661215 mask!2512))))

(declare-fun b!1527736 () Bool)

(assert (=> b!1527736 (= e!851462 (MissingVacant!13161 index!487))))

(declare-fun d!159417 () Bool)

(declare-fun lt!661416 () SeekEntryResult!13161)

(assert (=> d!159417 (and (or ((_ is Undefined!13161) lt!661416) (not ((_ is Found!13161) lt!661416)) (and (bvsge (index!55040 lt!661416) #b00000000000000000000000000000000) (bvslt (index!55040 lt!661416) (size!49525 lt!661215)))) (or ((_ is Undefined!13161) lt!661416) ((_ is Found!13161) lt!661416) (not ((_ is MissingVacant!13161) lt!661416)) (not (= (index!55042 lt!661416) index!487)) (and (bvsge (index!55042 lt!661416) #b00000000000000000000000000000000) (bvslt (index!55042 lt!661416) (size!49525 lt!661215)))) (or ((_ is Undefined!13161) lt!661416) (ite ((_ is Found!13161) lt!661416) (= (select (arr!48973 lt!661215) (index!55040 lt!661416)) lt!661214) (and ((_ is MissingVacant!13161) lt!661416) (= (index!55042 lt!661416) index!487) (= (select (arr!48973 lt!661215) (index!55042 lt!661416)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!851463 () SeekEntryResult!13161)

(assert (=> d!159417 (= lt!661416 e!851463)))

(declare-fun c!140586 () Bool)

(assert (=> d!159417 (= c!140586 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!661417 () (_ BitVec 64))

(assert (=> d!159417 (= lt!661417 (select (arr!48973 lt!661215) index!487))))

(assert (=> d!159417 (validMask!0 mask!2512)))

(assert (=> d!159417 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661214 lt!661215 mask!2512) lt!661416)))

(declare-fun b!1527737 () Bool)

(assert (=> b!1527737 (= e!851463 Undefined!13161)))

(declare-fun b!1527738 () Bool)

(assert (=> b!1527738 (= e!851463 e!851461)))

(declare-fun c!140585 () Bool)

(assert (=> b!1527738 (= c!140585 (= lt!661417 lt!661214))))

(declare-fun b!1527739 () Bool)

(declare-fun c!140584 () Bool)

(assert (=> b!1527739 (= c!140584 (= lt!661417 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527739 (= e!851461 e!851462)))

(assert (= (and d!159417 c!140586) b!1527737))

(assert (= (and d!159417 (not c!140586)) b!1527738))

(assert (= (and b!1527738 c!140585) b!1527734))

(assert (= (and b!1527738 (not c!140585)) b!1527739))

(assert (= (and b!1527739 c!140584) b!1527736))

(assert (= (and b!1527739 (not c!140584)) b!1527735))

(assert (=> b!1527735 m!1409803))

(assert (=> b!1527735 m!1409803))

(declare-fun m!1409973 () Bool)

(assert (=> b!1527735 m!1409973))

(declare-fun m!1409975 () Bool)

(assert (=> d!159417 m!1409975))

(declare-fun m!1409977 () Bool)

(assert (=> d!159417 m!1409977))

(declare-fun m!1409979 () Bool)

(assert (=> d!159417 m!1409979))

(assert (=> d!159417 m!1409675))

(assert (=> b!1527309 d!159417))

(declare-fun d!159419 () Bool)

(assert (=> d!159419 (= (validKeyInArray!0 (select (arr!48973 a!2804) j!70)) (and (not (= (select (arr!48973 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48973 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1527308 d!159419))

(declare-fun b!1527740 () Bool)

(declare-fun e!851466 () Bool)

(declare-fun call!68447 () Bool)

(assert (=> b!1527740 (= e!851466 call!68447)))

(declare-fun d!159421 () Bool)

(declare-fun res!1045679 () Bool)

(declare-fun e!851465 () Bool)

(assert (=> d!159421 (=> res!1045679 e!851465)))

(assert (=> d!159421 (= res!1045679 (bvsge j!70 (size!49525 a!2804)))))

(assert (=> d!159421 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!851465)))

(declare-fun b!1527741 () Bool)

(assert (=> b!1527741 (= e!851465 e!851466)))

(declare-fun c!140587 () Bool)

(assert (=> b!1527741 (= c!140587 (validKeyInArray!0 (select (arr!48973 a!2804) j!70)))))

(declare-fun bm!68444 () Bool)

(assert (=> bm!68444 (= call!68447 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1527742 () Bool)

(declare-fun e!851464 () Bool)

(assert (=> b!1527742 (= e!851464 call!68447)))

(declare-fun b!1527743 () Bool)

(assert (=> b!1527743 (= e!851466 e!851464)))

(declare-fun lt!661419 () (_ BitVec 64))

(assert (=> b!1527743 (= lt!661419 (select (arr!48973 a!2804) j!70))))

(declare-fun lt!661420 () Unit!50945)

(assert (=> b!1527743 (= lt!661420 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!661419 j!70))))

(assert (=> b!1527743 (arrayContainsKey!0 a!2804 lt!661419 #b00000000000000000000000000000000)))

(declare-fun lt!661418 () Unit!50945)

(assert (=> b!1527743 (= lt!661418 lt!661420)))

(declare-fun res!1045680 () Bool)

(assert (=> b!1527743 (= res!1045680 (= (seekEntryOrOpen!0 (select (arr!48973 a!2804) j!70) a!2804 mask!2512) (Found!13161 j!70)))))

(assert (=> b!1527743 (=> (not res!1045680) (not e!851464))))

(assert (= (and d!159421 (not res!1045679)) b!1527741))

(assert (= (and b!1527741 c!140587) b!1527743))

(assert (= (and b!1527741 (not c!140587)) b!1527740))

(assert (= (and b!1527743 res!1045680) b!1527742))

(assert (= (or b!1527742 b!1527740) bm!68444))

(assert (=> b!1527741 m!1409643))

(assert (=> b!1527741 m!1409643))

(assert (=> b!1527741 m!1409651))

(declare-fun m!1409981 () Bool)

(assert (=> bm!68444 m!1409981))

(assert (=> b!1527743 m!1409643))

(declare-fun m!1409983 () Bool)

(assert (=> b!1527743 m!1409983))

(declare-fun m!1409985 () Bool)

(assert (=> b!1527743 m!1409985))

(assert (=> b!1527743 m!1409643))

(assert (=> b!1527743 m!1409681))

(assert (=> b!1527310 d!159421))

(declare-fun d!159423 () Bool)

(assert (=> d!159423 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!661423 () Unit!50945)

(declare-fun choose!38 (array!101491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50945)

(assert (=> d!159423 (= lt!661423 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159423 (validMask!0 mask!2512)))

(assert (=> d!159423 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!661423)))

(declare-fun bs!43773 () Bool)

(assert (= bs!43773 d!159423))

(assert (=> bs!43773 m!1409659))

(declare-fun m!1409989 () Bool)

(assert (=> bs!43773 m!1409989))

(assert (=> bs!43773 m!1409675))

(assert (=> b!1527310 d!159423))

(declare-fun b!1527759 () Bool)

(declare-fun e!851483 () Bool)

(declare-fun lt!661425 () SeekEntryResult!13161)

(assert (=> b!1527759 (= e!851483 (bvsge (x!136730 lt!661425) #b01111111111111111111111111111110))))

(declare-fun b!1527760 () Bool)

(assert (=> b!1527760 (and (bvsge (index!55041 lt!661425) #b00000000000000000000000000000000) (bvslt (index!55041 lt!661425) (size!49525 a!2804)))))

(declare-fun res!1045690 () Bool)

(assert (=> b!1527760 (= res!1045690 (= (select (arr!48973 a!2804) (index!55041 lt!661425)) (select (arr!48973 a!2804) j!70)))))

(declare-fun e!851480 () Bool)

(assert (=> b!1527760 (=> res!1045690 e!851480)))

(declare-fun e!851479 () Bool)

(assert (=> b!1527760 (= e!851479 e!851480)))

(declare-fun b!1527761 () Bool)

(assert (=> b!1527761 (and (bvsge (index!55041 lt!661425) #b00000000000000000000000000000000) (bvslt (index!55041 lt!661425) (size!49525 a!2804)))))

(declare-fun res!1045691 () Bool)

(assert (=> b!1527761 (= res!1045691 (= (select (arr!48973 a!2804) (index!55041 lt!661425)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527761 (=> res!1045691 e!851480)))

(declare-fun b!1527762 () Bool)

(assert (=> b!1527762 (and (bvsge (index!55041 lt!661425) #b00000000000000000000000000000000) (bvslt (index!55041 lt!661425) (size!49525 a!2804)))))

(assert (=> b!1527762 (= e!851480 (= (select (arr!48973 a!2804) (index!55041 lt!661425)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1527763 () Bool)

(assert (=> b!1527763 (= e!851483 e!851479)))

(declare-fun res!1045692 () Bool)

(assert (=> b!1527763 (= res!1045692 (and ((_ is Intermediate!13161) lt!661425) (not (undefined!13973 lt!661425)) (bvslt (x!136730 lt!661425) #b01111111111111111111111111111110) (bvsge (x!136730 lt!661425) #b00000000000000000000000000000000) (bvsge (x!136730 lt!661425) #b00000000000000000000000000000000)))))

(assert (=> b!1527763 (=> (not res!1045692) (not e!851479))))

(declare-fun e!851482 () SeekEntryResult!13161)

(declare-fun b!1527764 () Bool)

(assert (=> b!1527764 (= e!851482 (Intermediate!13161 true (toIndex!0 (select (arr!48973 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1527765 () Bool)

(declare-fun e!851481 () SeekEntryResult!13161)

(assert (=> b!1527765 (= e!851481 (Intermediate!13161 false (toIndex!0 (select (arr!48973 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1527766 () Bool)

(assert (=> b!1527766 (= e!851481 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48973 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48973 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159425 () Bool)

(assert (=> d!159425 e!851483))

(declare-fun c!140592 () Bool)

(assert (=> d!159425 (= c!140592 (and ((_ is Intermediate!13161) lt!661425) (undefined!13973 lt!661425)))))

(assert (=> d!159425 (= lt!661425 e!851482)))

(declare-fun c!140593 () Bool)

(assert (=> d!159425 (= c!140593 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!661424 () (_ BitVec 64))

(assert (=> d!159425 (= lt!661424 (select (arr!48973 a!2804) (toIndex!0 (select (arr!48973 a!2804) j!70) mask!2512)))))

(assert (=> d!159425 (validMask!0 mask!2512)))

(assert (=> d!159425 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48973 a!2804) j!70) mask!2512) (select (arr!48973 a!2804) j!70) a!2804 mask!2512) lt!661425)))

(declare-fun b!1527767 () Bool)

(assert (=> b!1527767 (= e!851482 e!851481)))

(declare-fun c!140591 () Bool)

(assert (=> b!1527767 (= c!140591 (or (= lt!661424 (select (arr!48973 a!2804) j!70)) (= (bvadd lt!661424 lt!661424) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!159425 c!140593) b!1527764))

(assert (= (and d!159425 (not c!140593)) b!1527767))

(assert (= (and b!1527767 c!140591) b!1527765))

(assert (= (and b!1527767 (not c!140591)) b!1527766))

(assert (= (and d!159425 c!140592) b!1527759))

(assert (= (and d!159425 (not c!140592)) b!1527763))

(assert (= (and b!1527763 res!1045692) b!1527760))

(assert (= (and b!1527760 (not res!1045690)) b!1527761))

(assert (= (and b!1527761 (not res!1045691)) b!1527762))

(declare-fun m!1409999 () Bool)

(assert (=> b!1527760 m!1409999))

(assert (=> b!1527762 m!1409999))

(assert (=> b!1527766 m!1409647))

(declare-fun m!1410001 () Bool)

(assert (=> b!1527766 m!1410001))

(assert (=> b!1527766 m!1410001))

(assert (=> b!1527766 m!1409643))

(declare-fun m!1410003 () Bool)

(assert (=> b!1527766 m!1410003))

(assert (=> d!159425 m!1409647))

(declare-fun m!1410005 () Bool)

(assert (=> d!159425 m!1410005))

(assert (=> d!159425 m!1409675))

(assert (=> b!1527761 m!1409999))

(assert (=> b!1527307 d!159425))

(declare-fun d!159431 () Bool)

(declare-fun lt!661430 () (_ BitVec 32))

(declare-fun lt!661429 () (_ BitVec 32))

(assert (=> d!159431 (= lt!661430 (bvmul (bvxor lt!661429 (bvlshr lt!661429 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159431 (= lt!661429 ((_ extract 31 0) (bvand (bvxor (select (arr!48973 a!2804) j!70) (bvlshr (select (arr!48973 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159431 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1045638 (let ((h!36968 ((_ extract 31 0) (bvand (bvxor (select (arr!48973 a!2804) j!70) (bvlshr (select (arr!48973 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136739 (bvmul (bvxor h!36968 (bvlshr h!36968 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136739 (bvlshr x!136739 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1045638 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1045638 #b00000000000000000000000000000000))))))

(assert (=> d!159431 (= (toIndex!0 (select (arr!48973 a!2804) j!70) mask!2512) (bvand (bvxor lt!661430 (bvlshr lt!661430 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1527307 d!159431))

(declare-fun b!1527812 () Bool)

(declare-fun e!851515 () SeekEntryResult!13161)

(declare-fun lt!661451 () SeekEntryResult!13161)

(assert (=> b!1527812 (= e!851515 (Found!13161 (index!55041 lt!661451)))))

(declare-fun d!159433 () Bool)

(declare-fun lt!661450 () SeekEntryResult!13161)

(assert (=> d!159433 (and (or ((_ is MissingVacant!13161) lt!661450) (not ((_ is Found!13161) lt!661450)) (and (bvsge (index!55040 lt!661450) #b00000000000000000000000000000000) (bvslt (index!55040 lt!661450) (size!49525 a!2804)))) (not ((_ is MissingVacant!13161) lt!661450)) (or (not ((_ is Found!13161) lt!661450)) (= (select (arr!48973 a!2804) (index!55040 lt!661450)) (select (arr!48973 a!2804) j!70))))))

(declare-fun e!851514 () SeekEntryResult!13161)

(assert (=> d!159433 (= lt!661450 e!851514)))

(declare-fun c!140610 () Bool)

(assert (=> d!159433 (= c!140610 (and ((_ is Intermediate!13161) lt!661451) (undefined!13973 lt!661451)))))

(assert (=> d!159433 (= lt!661451 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48973 a!2804) j!70) mask!2512) (select (arr!48973 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159433 (validMask!0 mask!2512)))

(assert (=> d!159433 (= (seekEntry!0 (select (arr!48973 a!2804) j!70) a!2804 mask!2512) lt!661450)))

(declare-fun b!1527813 () Bool)

(declare-fun e!851513 () SeekEntryResult!13161)

(declare-fun lt!661449 () SeekEntryResult!13161)

(assert (=> b!1527813 (= e!851513 (ite ((_ is MissingVacant!13161) lt!661449) (MissingZero!13161 (index!55042 lt!661449)) lt!661449))))

(assert (=> b!1527813 (= lt!661449 (seekKeyOrZeroReturnVacant!0 (x!136730 lt!661451) (index!55041 lt!661451) (index!55041 lt!661451) (select (arr!48973 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527814 () Bool)

(assert (=> b!1527814 (= e!851514 Undefined!13161)))

(declare-fun b!1527815 () Bool)

(declare-fun c!140609 () Bool)

(declare-fun lt!661452 () (_ BitVec 64))

(assert (=> b!1527815 (= c!140609 (= lt!661452 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527815 (= e!851515 e!851513)))

(declare-fun b!1527816 () Bool)

(assert (=> b!1527816 (= e!851514 e!851515)))

(assert (=> b!1527816 (= lt!661452 (select (arr!48973 a!2804) (index!55041 lt!661451)))))

(declare-fun c!140608 () Bool)

(assert (=> b!1527816 (= c!140608 (= lt!661452 (select (arr!48973 a!2804) j!70)))))

(declare-fun b!1527817 () Bool)

(assert (=> b!1527817 (= e!851513 (MissingZero!13161 (index!55041 lt!661451)))))

(assert (= (and d!159433 c!140610) b!1527814))

(assert (= (and d!159433 (not c!140610)) b!1527816))

(assert (= (and b!1527816 c!140608) b!1527812))

(assert (= (and b!1527816 (not c!140608)) b!1527815))

(assert (= (and b!1527815 c!140609) b!1527817))

(assert (= (and b!1527815 (not c!140609)) b!1527813))

(declare-fun m!1410027 () Bool)

(assert (=> d!159433 m!1410027))

(assert (=> d!159433 m!1409643))

(assert (=> d!159433 m!1409647))

(assert (=> d!159433 m!1409647))

(assert (=> d!159433 m!1409643))

(assert (=> d!159433 m!1409649))

(assert (=> d!159433 m!1409675))

(assert (=> b!1527813 m!1409643))

(declare-fun m!1410029 () Bool)

(assert (=> b!1527813 m!1410029))

(declare-fun m!1410031 () Bool)

(assert (=> b!1527816 m!1410031))

(assert (=> b!1527306 d!159433))

(check-sat (not d!159343) (not b!1527625) (not b!1527741) (not b!1527766) (not b!1527728) (not bm!68444) (not b!1527453) (not bm!68443) (not b!1527743) (not b!1527506) (not bm!68437) (not d!159417) (not b!1527813) (not d!159355) (not d!159433) (not b!1527666) (not b!1527627) (not d!159411) (not d!159425) (not d!159393) (not b!1527573) (not d!159361) (not b!1527626) (not b!1527735) (not b!1527668) (not d!159423) (not b!1527678))
(check-sat)
