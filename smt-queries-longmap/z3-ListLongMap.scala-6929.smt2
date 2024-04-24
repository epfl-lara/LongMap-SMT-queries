; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87364 () Bool)

(assert start!87364)

(declare-fun b!1011707 () Bool)

(declare-fun e!569260 () Bool)

(declare-fun e!569265 () Bool)

(assert (=> b!1011707 (= e!569260 e!569265)))

(declare-fun res!679297 () Bool)

(assert (=> b!1011707 (=> (not res!679297) (not e!569265))))

(declare-datatypes ((SeekEntryResult!9526 0))(
  ( (MissingZero!9526 (index!40475 (_ BitVec 32))) (Found!9526 (index!40476 (_ BitVec 32))) (Intermediate!9526 (undefined!10338 Bool) (index!40477 (_ BitVec 32)) (x!88040 (_ BitVec 32))) (Undefined!9526) (MissingVacant!9526 (index!40478 (_ BitVec 32))) )
))
(declare-fun lt!447088 () SeekEntryResult!9526)

(declare-fun lt!447087 () SeekEntryResult!9526)

(assert (=> b!1011707 (= res!679297 (= lt!447088 lt!447087))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1011707 (= lt!447087 (Intermediate!9526 false resIndex!38 resX!38))))

(declare-datatypes ((array!63693 0))(
  ( (array!63694 (arr!30658 (Array (_ BitVec 32) (_ BitVec 64))) (size!31161 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63693)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63693 (_ BitVec 32)) SeekEntryResult!9526)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011707 (= lt!447088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30658 a!3219) j!170) mask!3464) (select (arr!30658 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011708 () Bool)

(declare-fun res!679291 () Bool)

(declare-fun e!569264 () Bool)

(assert (=> b!1011708 (=> (not res!679291) (not e!569264))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1011708 (= res!679291 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1011709 () Bool)

(declare-fun lt!447090 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun e!569263 () Bool)

(assert (=> b!1011709 (= e!569263 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447090 (select (arr!30658 a!3219) j!170) a!3219 mask!3464) lt!447087)))))

(declare-fun b!1011710 () Bool)

(declare-fun res!679287 () Bool)

(assert (=> b!1011710 (=> (not res!679287) (not e!569264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1011710 (= res!679287 (validKeyInArray!0 k0!2224))))

(declare-fun b!1011711 () Bool)

(declare-fun res!679284 () Bool)

(assert (=> b!1011711 (=> (not res!679284) (not e!569264))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1011711 (= res!679284 (and (= (size!31161 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31161 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31161 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1011712 () Bool)

(declare-fun res!679285 () Bool)

(assert (=> b!1011712 (=> (not res!679285) (not e!569260))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1011712 (= res!679285 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31161 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31161 a!3219))))))

(declare-fun b!1011713 () Bool)

(declare-fun e!569262 () Bool)

(assert (=> b!1011713 (= e!569262 e!569263)))

(declare-fun res!679290 () Bool)

(assert (=> b!1011713 (=> (not res!679290) (not e!569263))))

(assert (=> b!1011713 (= res!679290 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!447090 #b00000000000000000000000000000000) (bvslt lt!447090 (size!31161 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011713 (= lt!447090 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1011714 () Bool)

(declare-fun res!679295 () Bool)

(assert (=> b!1011714 (=> (not res!679295) (not e!569264))))

(assert (=> b!1011714 (= res!679295 (validKeyInArray!0 (select (arr!30658 a!3219) j!170)))))

(declare-fun b!1011715 () Bool)

(declare-fun e!569261 () Bool)

(assert (=> b!1011715 (= e!569261 e!569262)))

(declare-fun res!679294 () Bool)

(assert (=> b!1011715 (=> (not res!679294) (not e!569262))))

(declare-fun lt!447092 () array!63693)

(declare-fun lt!447089 () (_ BitVec 64))

(assert (=> b!1011715 (= res!679294 (not (= lt!447088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!447089 mask!3464) lt!447089 lt!447092 mask!3464))))))

(assert (=> b!1011715 (= lt!447089 (select (store (arr!30658 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1011715 (= lt!447092 (array!63694 (store (arr!30658 a!3219) i!1194 k0!2224) (size!31161 a!3219)))))

(declare-fun res!679292 () Bool)

(assert (=> start!87364 (=> (not res!679292) (not e!569264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87364 (= res!679292 (validMask!0 mask!3464))))

(assert (=> start!87364 e!569264))

(declare-fun array_inv!23794 (array!63693) Bool)

(assert (=> start!87364 (array_inv!23794 a!3219)))

(assert (=> start!87364 true))

(declare-fun b!1011716 () Bool)

(declare-fun res!679293 () Bool)

(assert (=> b!1011716 (=> (not res!679293) (not e!569260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63693 (_ BitVec 32)) Bool)

(assert (=> b!1011716 (= res!679293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1011717 () Bool)

(declare-fun res!679288 () Bool)

(assert (=> b!1011717 (=> (not res!679288) (not e!569262))))

(assert (=> b!1011717 (= res!679288 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1011718 () Bool)

(declare-fun res!679286 () Bool)

(assert (=> b!1011718 (=> (not res!679286) (not e!569262))))

(declare-fun lt!447086 () SeekEntryResult!9526)

(assert (=> b!1011718 (= res!679286 (not (= lt!447086 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!447089 lt!447092 mask!3464))))))

(declare-fun b!1011719 () Bool)

(assert (=> b!1011719 (= e!569265 e!569261)))

(declare-fun res!679298 () Bool)

(assert (=> b!1011719 (=> (not res!679298) (not e!569261))))

(assert (=> b!1011719 (= res!679298 (= lt!447086 lt!447087))))

(assert (=> b!1011719 (= lt!447086 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30658 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011720 () Bool)

(declare-fun res!679296 () Bool)

(assert (=> b!1011720 (=> (not res!679296) (not e!569260))))

(declare-datatypes ((List!21305 0))(
  ( (Nil!21302) (Cons!21301 (h!22502 (_ BitVec 64)) (t!30298 List!21305)) )
))
(declare-fun arrayNoDuplicates!0 (array!63693 (_ BitVec 32) List!21305) Bool)

(assert (=> b!1011720 (= res!679296 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21302))))

(declare-fun b!1011721 () Bool)

(assert (=> b!1011721 (= e!569264 e!569260)))

(declare-fun res!679289 () Bool)

(assert (=> b!1011721 (=> (not res!679289) (not e!569260))))

(declare-fun lt!447091 () SeekEntryResult!9526)

(assert (=> b!1011721 (= res!679289 (or (= lt!447091 (MissingVacant!9526 i!1194)) (= lt!447091 (MissingZero!9526 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63693 (_ BitVec 32)) SeekEntryResult!9526)

(assert (=> b!1011721 (= lt!447091 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!87364 res!679292) b!1011711))

(assert (= (and b!1011711 res!679284) b!1011714))

(assert (= (and b!1011714 res!679295) b!1011710))

(assert (= (and b!1011710 res!679287) b!1011708))

(assert (= (and b!1011708 res!679291) b!1011721))

(assert (= (and b!1011721 res!679289) b!1011716))

(assert (= (and b!1011716 res!679293) b!1011720))

(assert (= (and b!1011720 res!679296) b!1011712))

(assert (= (and b!1011712 res!679285) b!1011707))

(assert (= (and b!1011707 res!679297) b!1011719))

(assert (= (and b!1011719 res!679298) b!1011715))

(assert (= (and b!1011715 res!679294) b!1011718))

(assert (= (and b!1011718 res!679286) b!1011717))

(assert (= (and b!1011717 res!679288) b!1011713))

(assert (= (and b!1011713 res!679290) b!1011709))

(declare-fun m!936341 () Bool)

(assert (=> start!87364 m!936341))

(declare-fun m!936343 () Bool)

(assert (=> start!87364 m!936343))

(declare-fun m!936345 () Bool)

(assert (=> b!1011718 m!936345))

(declare-fun m!936347 () Bool)

(assert (=> b!1011713 m!936347))

(declare-fun m!936349 () Bool)

(assert (=> b!1011719 m!936349))

(assert (=> b!1011719 m!936349))

(declare-fun m!936351 () Bool)

(assert (=> b!1011719 m!936351))

(declare-fun m!936353 () Bool)

(assert (=> b!1011720 m!936353))

(assert (=> b!1011709 m!936349))

(assert (=> b!1011709 m!936349))

(declare-fun m!936355 () Bool)

(assert (=> b!1011709 m!936355))

(declare-fun m!936357 () Bool)

(assert (=> b!1011708 m!936357))

(declare-fun m!936359 () Bool)

(assert (=> b!1011710 m!936359))

(declare-fun m!936361 () Bool)

(assert (=> b!1011716 m!936361))

(assert (=> b!1011707 m!936349))

(assert (=> b!1011707 m!936349))

(declare-fun m!936363 () Bool)

(assert (=> b!1011707 m!936363))

(assert (=> b!1011707 m!936363))

(assert (=> b!1011707 m!936349))

(declare-fun m!936365 () Bool)

(assert (=> b!1011707 m!936365))

(assert (=> b!1011714 m!936349))

(assert (=> b!1011714 m!936349))

(declare-fun m!936367 () Bool)

(assert (=> b!1011714 m!936367))

(declare-fun m!936369 () Bool)

(assert (=> b!1011715 m!936369))

(assert (=> b!1011715 m!936369))

(declare-fun m!936371 () Bool)

(assert (=> b!1011715 m!936371))

(declare-fun m!936373 () Bool)

(assert (=> b!1011715 m!936373))

(declare-fun m!936375 () Bool)

(assert (=> b!1011715 m!936375))

(declare-fun m!936377 () Bool)

(assert (=> b!1011721 m!936377))

(check-sat (not b!1011720) (not b!1011716) (not b!1011708) (not b!1011710) (not b!1011719) (not b!1011713) (not b!1011721) (not b!1011709) (not start!87364) (not b!1011718) (not b!1011707) (not b!1011715) (not b!1011714))
(check-sat)
(get-model)

(declare-fun b!1011820 () Bool)

(declare-fun e!569314 () Bool)

(declare-fun e!569316 () Bool)

(assert (=> b!1011820 (= e!569314 e!569316)))

(declare-fun lt!447141 () (_ BitVec 64))

(assert (=> b!1011820 (= lt!447141 (select (arr!30658 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33015 0))(
  ( (Unit!33016) )
))
(declare-fun lt!447143 () Unit!33015)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63693 (_ BitVec 64) (_ BitVec 32)) Unit!33015)

(assert (=> b!1011820 (= lt!447143 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!447141 #b00000000000000000000000000000000))))

(assert (=> b!1011820 (arrayContainsKey!0 a!3219 lt!447141 #b00000000000000000000000000000000)))

(declare-fun lt!447142 () Unit!33015)

(assert (=> b!1011820 (= lt!447142 lt!447143)))

(declare-fun res!679394 () Bool)

(assert (=> b!1011820 (= res!679394 (= (seekEntryOrOpen!0 (select (arr!30658 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9526 #b00000000000000000000000000000000)))))

(assert (=> b!1011820 (=> (not res!679394) (not e!569316))))

(declare-fun d!120461 () Bool)

(declare-fun res!679393 () Bool)

(declare-fun e!569315 () Bool)

(assert (=> d!120461 (=> res!679393 e!569315)))

(assert (=> d!120461 (= res!679393 (bvsge #b00000000000000000000000000000000 (size!31161 a!3219)))))

(assert (=> d!120461 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!569315)))

(declare-fun b!1011821 () Bool)

(declare-fun call!42475 () Bool)

(assert (=> b!1011821 (= e!569316 call!42475)))

(declare-fun b!1011822 () Bool)

(assert (=> b!1011822 (= e!569315 e!569314)))

(declare-fun c!102379 () Bool)

(assert (=> b!1011822 (= c!102379 (validKeyInArray!0 (select (arr!30658 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1011823 () Bool)

(assert (=> b!1011823 (= e!569314 call!42475)))

(declare-fun bm!42472 () Bool)

(assert (=> bm!42472 (= call!42475 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!120461 (not res!679393)) b!1011822))

(assert (= (and b!1011822 c!102379) b!1011820))

(assert (= (and b!1011822 (not c!102379)) b!1011823))

(assert (= (and b!1011820 res!679394) b!1011821))

(assert (= (or b!1011821 b!1011823) bm!42472))

(declare-fun m!936455 () Bool)

(assert (=> b!1011820 m!936455))

(declare-fun m!936457 () Bool)

(assert (=> b!1011820 m!936457))

(declare-fun m!936459 () Bool)

(assert (=> b!1011820 m!936459))

(assert (=> b!1011820 m!936455))

(declare-fun m!936461 () Bool)

(assert (=> b!1011820 m!936461))

(assert (=> b!1011822 m!936455))

(assert (=> b!1011822 m!936455))

(declare-fun m!936463 () Bool)

(assert (=> b!1011822 m!936463))

(declare-fun m!936465 () Bool)

(assert (=> bm!42472 m!936465))

(assert (=> b!1011716 d!120461))

(declare-fun b!1011842 () Bool)

(declare-fun lt!447148 () SeekEntryResult!9526)

(assert (=> b!1011842 (and (bvsge (index!40477 lt!447148) #b00000000000000000000000000000000) (bvslt (index!40477 lt!447148) (size!31161 lt!447092)))))

(declare-fun e!569330 () Bool)

(assert (=> b!1011842 (= e!569330 (= (select (arr!30658 lt!447092) (index!40477 lt!447148)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011843 () Bool)

(declare-fun e!569331 () Bool)

(assert (=> b!1011843 (= e!569331 (bvsge (x!88040 lt!447148) #b01111111111111111111111111111110))))

(declare-fun b!1011844 () Bool)

(declare-fun e!569328 () SeekEntryResult!9526)

(assert (=> b!1011844 (= e!569328 (Intermediate!9526 false (toIndex!0 lt!447089 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011845 () Bool)

(declare-fun e!569327 () SeekEntryResult!9526)

(assert (=> b!1011845 (= e!569327 e!569328)))

(declare-fun c!102388 () Bool)

(declare-fun lt!447149 () (_ BitVec 64))

(assert (=> b!1011845 (= c!102388 (or (= lt!447149 lt!447089) (= (bvadd lt!447149 lt!447149) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011846 () Bool)

(assert (=> b!1011846 (= e!569327 (Intermediate!9526 true (toIndex!0 lt!447089 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011847 () Bool)

(declare-fun e!569329 () Bool)

(assert (=> b!1011847 (= e!569331 e!569329)))

(declare-fun res!679403 () Bool)

(get-info :version)

(assert (=> b!1011847 (= res!679403 (and ((_ is Intermediate!9526) lt!447148) (not (undefined!10338 lt!447148)) (bvslt (x!88040 lt!447148) #b01111111111111111111111111111110) (bvsge (x!88040 lt!447148) #b00000000000000000000000000000000) (bvsge (x!88040 lt!447148) #b00000000000000000000000000000000)))))

(assert (=> b!1011847 (=> (not res!679403) (not e!569329))))

(declare-fun b!1011848 () Bool)

(assert (=> b!1011848 (= e!569328 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!447089 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) lt!447089 lt!447092 mask!3464))))

(declare-fun b!1011849 () Bool)

(assert (=> b!1011849 (and (bvsge (index!40477 lt!447148) #b00000000000000000000000000000000) (bvslt (index!40477 lt!447148) (size!31161 lt!447092)))))

(declare-fun res!679402 () Bool)

(assert (=> b!1011849 (= res!679402 (= (select (arr!30658 lt!447092) (index!40477 lt!447148)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011849 (=> res!679402 e!569330)))

(declare-fun b!1011850 () Bool)

(assert (=> b!1011850 (and (bvsge (index!40477 lt!447148) #b00000000000000000000000000000000) (bvslt (index!40477 lt!447148) (size!31161 lt!447092)))))

(declare-fun res!679401 () Bool)

(assert (=> b!1011850 (= res!679401 (= (select (arr!30658 lt!447092) (index!40477 lt!447148)) lt!447089))))

(assert (=> b!1011850 (=> res!679401 e!569330)))

(assert (=> b!1011850 (= e!569329 e!569330)))

(declare-fun d!120463 () Bool)

(assert (=> d!120463 e!569331))

(declare-fun c!102387 () Bool)

(assert (=> d!120463 (= c!102387 (and ((_ is Intermediate!9526) lt!447148) (undefined!10338 lt!447148)))))

(assert (=> d!120463 (= lt!447148 e!569327)))

(declare-fun c!102386 () Bool)

(assert (=> d!120463 (= c!102386 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!120463 (= lt!447149 (select (arr!30658 lt!447092) (toIndex!0 lt!447089 mask!3464)))))

(assert (=> d!120463 (validMask!0 mask!3464)))

(assert (=> d!120463 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!447089 mask!3464) lt!447089 lt!447092 mask!3464) lt!447148)))

(assert (= (and d!120463 c!102386) b!1011846))

(assert (= (and d!120463 (not c!102386)) b!1011845))

(assert (= (and b!1011845 c!102388) b!1011844))

(assert (= (and b!1011845 (not c!102388)) b!1011848))

(assert (= (and d!120463 c!102387) b!1011843))

(assert (= (and d!120463 (not c!102387)) b!1011847))

(assert (= (and b!1011847 res!679403) b!1011850))

(assert (= (and b!1011850 (not res!679401)) b!1011849))

(assert (= (and b!1011849 (not res!679402)) b!1011842))

(declare-fun m!936467 () Bool)

(assert (=> b!1011850 m!936467))

(assert (=> b!1011849 m!936467))

(assert (=> b!1011848 m!936369))

(declare-fun m!936469 () Bool)

(assert (=> b!1011848 m!936469))

(assert (=> b!1011848 m!936469))

(declare-fun m!936471 () Bool)

(assert (=> b!1011848 m!936471))

(assert (=> d!120463 m!936369))

(declare-fun m!936473 () Bool)

(assert (=> d!120463 m!936473))

(assert (=> d!120463 m!936341))

(assert (=> b!1011842 m!936467))

(assert (=> b!1011715 d!120463))

(declare-fun d!120465 () Bool)

(declare-fun lt!447155 () (_ BitVec 32))

(declare-fun lt!447154 () (_ BitVec 32))

(assert (=> d!120465 (= lt!447155 (bvmul (bvxor lt!447154 (bvlshr lt!447154 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120465 (= lt!447154 ((_ extract 31 0) (bvand (bvxor lt!447089 (bvlshr lt!447089 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120465 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!679404 (let ((h!22505 ((_ extract 31 0) (bvand (bvxor lt!447089 (bvlshr lt!447089 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88044 (bvmul (bvxor h!22505 (bvlshr h!22505 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88044 (bvlshr x!88044 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!679404 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!679404 #b00000000000000000000000000000000))))))

(assert (=> d!120465 (= (toIndex!0 lt!447089 mask!3464) (bvand (bvxor lt!447155 (bvlshr lt!447155 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1011715 d!120465))

(declare-fun d!120467 () Bool)

(assert (=> d!120467 (= (validKeyInArray!0 (select (arr!30658 a!3219) j!170)) (and (not (= (select (arr!30658 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30658 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1011714 d!120467))

(declare-fun d!120469 () Bool)

(declare-fun lt!447158 () (_ BitVec 32))

(assert (=> d!120469 (and (bvsge lt!447158 #b00000000000000000000000000000000) (bvslt lt!447158 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!120469 (= lt!447158 (choose!52 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(assert (=> d!120469 (validMask!0 mask!3464)))

(assert (=> d!120469 (= (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464) lt!447158)))

(declare-fun bs!28745 () Bool)

(assert (= bs!28745 d!120469))

(declare-fun m!936475 () Bool)

(assert (=> bs!28745 m!936475))

(assert (=> bs!28745 m!936341))

(assert (=> b!1011713 d!120469))

(declare-fun b!1011899 () Bool)

(declare-fun e!569358 () SeekEntryResult!9526)

(assert (=> b!1011899 (= e!569358 Undefined!9526)))

(declare-fun d!120473 () Bool)

(declare-fun lt!447176 () SeekEntryResult!9526)

(assert (=> d!120473 (and (or ((_ is Undefined!9526) lt!447176) (not ((_ is Found!9526) lt!447176)) (and (bvsge (index!40476 lt!447176) #b00000000000000000000000000000000) (bvslt (index!40476 lt!447176) (size!31161 a!3219)))) (or ((_ is Undefined!9526) lt!447176) ((_ is Found!9526) lt!447176) (not ((_ is MissingZero!9526) lt!447176)) (and (bvsge (index!40475 lt!447176) #b00000000000000000000000000000000) (bvslt (index!40475 lt!447176) (size!31161 a!3219)))) (or ((_ is Undefined!9526) lt!447176) ((_ is Found!9526) lt!447176) ((_ is MissingZero!9526) lt!447176) (not ((_ is MissingVacant!9526) lt!447176)) (and (bvsge (index!40478 lt!447176) #b00000000000000000000000000000000) (bvslt (index!40478 lt!447176) (size!31161 a!3219)))) (or ((_ is Undefined!9526) lt!447176) (ite ((_ is Found!9526) lt!447176) (= (select (arr!30658 a!3219) (index!40476 lt!447176)) k0!2224) (ite ((_ is MissingZero!9526) lt!447176) (= (select (arr!30658 a!3219) (index!40475 lt!447176)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9526) lt!447176) (= (select (arr!30658 a!3219) (index!40478 lt!447176)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!120473 (= lt!447176 e!569358)))

(declare-fun c!102409 () Bool)

(declare-fun lt!447178 () SeekEntryResult!9526)

(assert (=> d!120473 (= c!102409 (and ((_ is Intermediate!9526) lt!447178) (undefined!10338 lt!447178)))))

(assert (=> d!120473 (= lt!447178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!120473 (validMask!0 mask!3464)))

(assert (=> d!120473 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!447176)))

(declare-fun b!1011900 () Bool)

(declare-fun e!569360 () SeekEntryResult!9526)

(assert (=> b!1011900 (= e!569360 (Found!9526 (index!40477 lt!447178)))))

(declare-fun b!1011901 () Bool)

(assert (=> b!1011901 (= e!569358 e!569360)))

(declare-fun lt!447177 () (_ BitVec 64))

(assert (=> b!1011901 (= lt!447177 (select (arr!30658 a!3219) (index!40477 lt!447178)))))

(declare-fun c!102407 () Bool)

(assert (=> b!1011901 (= c!102407 (= lt!447177 k0!2224))))

(declare-fun b!1011902 () Bool)

(declare-fun e!569359 () SeekEntryResult!9526)

(assert (=> b!1011902 (= e!569359 (MissingZero!9526 (index!40477 lt!447178)))))

(declare-fun b!1011903 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63693 (_ BitVec 32)) SeekEntryResult!9526)

(assert (=> b!1011903 (= e!569359 (seekKeyOrZeroReturnVacant!0 (x!88040 lt!447178) (index!40477 lt!447178) (index!40477 lt!447178) k0!2224 a!3219 mask!3464))))

(declare-fun b!1011904 () Bool)

(declare-fun c!102408 () Bool)

(assert (=> b!1011904 (= c!102408 (= lt!447177 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011904 (= e!569360 e!569359)))

(assert (= (and d!120473 c!102409) b!1011899))

(assert (= (and d!120473 (not c!102409)) b!1011901))

(assert (= (and b!1011901 c!102407) b!1011900))

(assert (= (and b!1011901 (not c!102407)) b!1011904))

(assert (= (and b!1011904 c!102408) b!1011902))

(assert (= (and b!1011904 (not c!102408)) b!1011903))

(assert (=> d!120473 m!936341))

(declare-fun m!936479 () Bool)

(assert (=> d!120473 m!936479))

(declare-fun m!936481 () Bool)

(assert (=> d!120473 m!936481))

(declare-fun m!936483 () Bool)

(assert (=> d!120473 m!936483))

(declare-fun m!936485 () Bool)

(assert (=> d!120473 m!936485))

(assert (=> d!120473 m!936481))

(declare-fun m!936487 () Bool)

(assert (=> d!120473 m!936487))

(declare-fun m!936489 () Bool)

(assert (=> b!1011901 m!936489))

(declare-fun m!936491 () Bool)

(assert (=> b!1011903 m!936491))

(assert (=> b!1011721 d!120473))

(declare-fun d!120479 () Bool)

(assert (=> d!120479 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1011710 d!120479))

(declare-fun b!1011933 () Bool)

(declare-fun e!569381 () Bool)

(declare-fun e!569382 () Bool)

(assert (=> b!1011933 (= e!569381 e!569382)))

(declare-fun res!679433 () Bool)

(assert (=> b!1011933 (=> (not res!679433) (not e!569382))))

(declare-fun e!569379 () Bool)

(assert (=> b!1011933 (= res!679433 (not e!569379))))

(declare-fun res!679431 () Bool)

(assert (=> b!1011933 (=> (not res!679431) (not e!569379))))

(assert (=> b!1011933 (= res!679431 (validKeyInArray!0 (select (arr!30658 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1011934 () Bool)

(declare-fun e!569380 () Bool)

(declare-fun call!42478 () Bool)

(assert (=> b!1011934 (= e!569380 call!42478)))

(declare-fun bm!42475 () Bool)

(declare-fun c!102418 () Bool)

(assert (=> bm!42475 (= call!42478 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!102418 (Cons!21301 (select (arr!30658 a!3219) #b00000000000000000000000000000000) Nil!21302) Nil!21302)))))

(declare-fun b!1011935 () Bool)

(assert (=> b!1011935 (= e!569380 call!42478)))

(declare-fun d!120481 () Bool)

(declare-fun res!679432 () Bool)

(assert (=> d!120481 (=> res!679432 e!569381)))

(assert (=> d!120481 (= res!679432 (bvsge #b00000000000000000000000000000000 (size!31161 a!3219)))))

(assert (=> d!120481 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21302) e!569381)))

(declare-fun b!1011936 () Bool)

(assert (=> b!1011936 (= e!569382 e!569380)))

(assert (=> b!1011936 (= c!102418 (validKeyInArray!0 (select (arr!30658 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1011937 () Bool)

(declare-fun contains!5914 (List!21305 (_ BitVec 64)) Bool)

(assert (=> b!1011937 (= e!569379 (contains!5914 Nil!21302 (select (arr!30658 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!120481 (not res!679432)) b!1011933))

(assert (= (and b!1011933 res!679431) b!1011937))

(assert (= (and b!1011933 res!679433) b!1011936))

(assert (= (and b!1011936 c!102418) b!1011934))

(assert (= (and b!1011936 (not c!102418)) b!1011935))

(assert (= (or b!1011934 b!1011935) bm!42475))

(assert (=> b!1011933 m!936455))

(assert (=> b!1011933 m!936455))

(assert (=> b!1011933 m!936463))

(assert (=> bm!42475 m!936455))

(declare-fun m!936509 () Bool)

(assert (=> bm!42475 m!936509))

(assert (=> b!1011936 m!936455))

(assert (=> b!1011936 m!936455))

(assert (=> b!1011936 m!936463))

(assert (=> b!1011937 m!936455))

(assert (=> b!1011937 m!936455))

(declare-fun m!936511 () Bool)

(assert (=> b!1011937 m!936511))

(assert (=> b!1011720 d!120481))

(declare-fun b!1011938 () Bool)

(declare-fun lt!447190 () SeekEntryResult!9526)

(assert (=> b!1011938 (and (bvsge (index!40477 lt!447190) #b00000000000000000000000000000000) (bvslt (index!40477 lt!447190) (size!31161 a!3219)))))

(declare-fun e!569386 () Bool)

(assert (=> b!1011938 (= e!569386 (= (select (arr!30658 a!3219) (index!40477 lt!447190)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011939 () Bool)

(declare-fun e!569388 () Bool)

(assert (=> b!1011939 (= e!569388 (bvsge (x!88040 lt!447190) #b01111111111111111111111111111110))))

(declare-fun b!1011940 () Bool)

(declare-fun e!569384 () SeekEntryResult!9526)

(assert (=> b!1011940 (= e!569384 (Intermediate!9526 false lt!447090 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1011941 () Bool)

(declare-fun e!569383 () SeekEntryResult!9526)

(assert (=> b!1011941 (= e!569383 e!569384)))

(declare-fun lt!447191 () (_ BitVec 64))

(declare-fun c!102421 () Bool)

(assert (=> b!1011941 (= c!102421 (or (= lt!447191 (select (arr!30658 a!3219) j!170)) (= (bvadd lt!447191 lt!447191) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011942 () Bool)

(assert (=> b!1011942 (= e!569383 (Intermediate!9526 true lt!447090 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1011943 () Bool)

(declare-fun e!569385 () Bool)

(assert (=> b!1011943 (= e!569388 e!569385)))

(declare-fun res!679436 () Bool)

(assert (=> b!1011943 (= res!679436 (and ((_ is Intermediate!9526) lt!447190) (not (undefined!10338 lt!447190)) (bvslt (x!88040 lt!447190) #b01111111111111111111111111111110) (bvsge (x!88040 lt!447190) #b00000000000000000000000000000000) (bvsge (x!88040 lt!447190) (bvadd #b00000000000000000000000000000001 x!1245))))))

(assert (=> b!1011943 (=> (not res!679436) (not e!569385))))

(declare-fun b!1011944 () Bool)

(assert (=> b!1011944 (= e!569384 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245 #b00000000000000000000000000000001) (nextIndex!0 lt!447090 (bvadd #b00000000000000000000000000000001 x!1245 #b00000000000000000000000000000001) mask!3464) (select (arr!30658 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011945 () Bool)

(assert (=> b!1011945 (and (bvsge (index!40477 lt!447190) #b00000000000000000000000000000000) (bvslt (index!40477 lt!447190) (size!31161 a!3219)))))

(declare-fun res!679435 () Bool)

(assert (=> b!1011945 (= res!679435 (= (select (arr!30658 a!3219) (index!40477 lt!447190)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011945 (=> res!679435 e!569386)))

(declare-fun b!1011946 () Bool)

(assert (=> b!1011946 (and (bvsge (index!40477 lt!447190) #b00000000000000000000000000000000) (bvslt (index!40477 lt!447190) (size!31161 a!3219)))))

(declare-fun res!679434 () Bool)

(assert (=> b!1011946 (= res!679434 (= (select (arr!30658 a!3219) (index!40477 lt!447190)) (select (arr!30658 a!3219) j!170)))))

(assert (=> b!1011946 (=> res!679434 e!569386)))

(assert (=> b!1011946 (= e!569385 e!569386)))

(declare-fun d!120487 () Bool)

(assert (=> d!120487 e!569388))

(declare-fun c!102420 () Bool)

(assert (=> d!120487 (= c!102420 (and ((_ is Intermediate!9526) lt!447190) (undefined!10338 lt!447190)))))

(assert (=> d!120487 (= lt!447190 e!569383)))

(declare-fun c!102419 () Bool)

(assert (=> d!120487 (= c!102419 (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b01111111111111111111111111111110))))

(assert (=> d!120487 (= lt!447191 (select (arr!30658 a!3219) lt!447090))))

(assert (=> d!120487 (validMask!0 mask!3464)))

(assert (=> d!120487 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447090 (select (arr!30658 a!3219) j!170) a!3219 mask!3464) lt!447190)))

(assert (= (and d!120487 c!102419) b!1011942))

(assert (= (and d!120487 (not c!102419)) b!1011941))

(assert (= (and b!1011941 c!102421) b!1011940))

(assert (= (and b!1011941 (not c!102421)) b!1011944))

(assert (= (and d!120487 c!102420) b!1011939))

(assert (= (and d!120487 (not c!102420)) b!1011943))

(assert (= (and b!1011943 res!679436) b!1011946))

(assert (= (and b!1011946 (not res!679434)) b!1011945))

(assert (= (and b!1011945 (not res!679435)) b!1011938))

(declare-fun m!936515 () Bool)

(assert (=> b!1011946 m!936515))

(assert (=> b!1011945 m!936515))

(declare-fun m!936519 () Bool)

(assert (=> b!1011944 m!936519))

(assert (=> b!1011944 m!936519))

(assert (=> b!1011944 m!936349))

(declare-fun m!936523 () Bool)

(assert (=> b!1011944 m!936523))

(declare-fun m!936525 () Bool)

(assert (=> d!120487 m!936525))

(assert (=> d!120487 m!936341))

(assert (=> b!1011938 m!936515))

(assert (=> b!1011709 d!120487))

(declare-fun b!1011965 () Bool)

(declare-fun lt!447201 () SeekEntryResult!9526)

(assert (=> b!1011965 (and (bvsge (index!40477 lt!447201) #b00000000000000000000000000000000) (bvslt (index!40477 lt!447201) (size!31161 a!3219)))))

(declare-fun e!569401 () Bool)

(assert (=> b!1011965 (= e!569401 (= (select (arr!30658 a!3219) (index!40477 lt!447201)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011966 () Bool)

(declare-fun e!569402 () Bool)

(assert (=> b!1011966 (= e!569402 (bvsge (x!88040 lt!447201) #b01111111111111111111111111111110))))

(declare-fun b!1011967 () Bool)

(declare-fun e!569399 () SeekEntryResult!9526)

(assert (=> b!1011967 (= e!569399 (Intermediate!9526 false index!1507 x!1245))))

(declare-fun b!1011968 () Bool)

(declare-fun e!569398 () SeekEntryResult!9526)

(assert (=> b!1011968 (= e!569398 e!569399)))

(declare-fun lt!447202 () (_ BitVec 64))

(declare-fun c!102430 () Bool)

(assert (=> b!1011968 (= c!102430 (or (= lt!447202 (select (arr!30658 a!3219) j!170)) (= (bvadd lt!447202 lt!447202) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011969 () Bool)

(assert (=> b!1011969 (= e!569398 (Intermediate!9526 true index!1507 x!1245))))

(declare-fun b!1011970 () Bool)

(declare-fun e!569400 () Bool)

(assert (=> b!1011970 (= e!569402 e!569400)))

(declare-fun res!679445 () Bool)

(assert (=> b!1011970 (= res!679445 (and ((_ is Intermediate!9526) lt!447201) (not (undefined!10338 lt!447201)) (bvslt (x!88040 lt!447201) #b01111111111111111111111111111110) (bvsge (x!88040 lt!447201) #b00000000000000000000000000000000) (bvsge (x!88040 lt!447201) x!1245)))))

(assert (=> b!1011970 (=> (not res!679445) (not e!569400))))

(declare-fun b!1011971 () Bool)

(assert (=> b!1011971 (= e!569399 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (select (arr!30658 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011972 () Bool)

(assert (=> b!1011972 (and (bvsge (index!40477 lt!447201) #b00000000000000000000000000000000) (bvslt (index!40477 lt!447201) (size!31161 a!3219)))))

(declare-fun res!679444 () Bool)

(assert (=> b!1011972 (= res!679444 (= (select (arr!30658 a!3219) (index!40477 lt!447201)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011972 (=> res!679444 e!569401)))

(declare-fun b!1011973 () Bool)

(assert (=> b!1011973 (and (bvsge (index!40477 lt!447201) #b00000000000000000000000000000000) (bvslt (index!40477 lt!447201) (size!31161 a!3219)))))

(declare-fun res!679443 () Bool)

(assert (=> b!1011973 (= res!679443 (= (select (arr!30658 a!3219) (index!40477 lt!447201)) (select (arr!30658 a!3219) j!170)))))

(assert (=> b!1011973 (=> res!679443 e!569401)))

(assert (=> b!1011973 (= e!569400 e!569401)))

(declare-fun d!120493 () Bool)

(assert (=> d!120493 e!569402))

(declare-fun c!102429 () Bool)

(assert (=> d!120493 (= c!102429 (and ((_ is Intermediate!9526) lt!447201) (undefined!10338 lt!447201)))))

(assert (=> d!120493 (= lt!447201 e!569398)))

(declare-fun c!102428 () Bool)

(assert (=> d!120493 (= c!102428 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!120493 (= lt!447202 (select (arr!30658 a!3219) index!1507))))

(assert (=> d!120493 (validMask!0 mask!3464)))

(assert (=> d!120493 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30658 a!3219) j!170) a!3219 mask!3464) lt!447201)))

(assert (= (and d!120493 c!102428) b!1011969))

(assert (= (and d!120493 (not c!102428)) b!1011968))

(assert (= (and b!1011968 c!102430) b!1011967))

(assert (= (and b!1011968 (not c!102430)) b!1011971))

(assert (= (and d!120493 c!102429) b!1011966))

(assert (= (and d!120493 (not c!102429)) b!1011970))

(assert (= (and b!1011970 res!679445) b!1011973))

(assert (= (and b!1011973 (not res!679443)) b!1011972))

(assert (= (and b!1011972 (not res!679444)) b!1011965))

(declare-fun m!936531 () Bool)

(assert (=> b!1011973 m!936531))

(assert (=> b!1011972 m!936531))

(declare-fun m!936535 () Bool)

(assert (=> b!1011971 m!936535))

(assert (=> b!1011971 m!936535))

(assert (=> b!1011971 m!936349))

(declare-fun m!936539 () Bool)

(assert (=> b!1011971 m!936539))

(declare-fun m!936543 () Bool)

(assert (=> d!120493 m!936543))

(assert (=> d!120493 m!936341))

(assert (=> b!1011965 m!936531))

(assert (=> b!1011719 d!120493))

(declare-fun d!120499 () Bool)

(declare-fun res!679450 () Bool)

(declare-fun e!569407 () Bool)

(assert (=> d!120499 (=> res!679450 e!569407)))

(assert (=> d!120499 (= res!679450 (= (select (arr!30658 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!120499 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!569407)))

(declare-fun b!1011978 () Bool)

(declare-fun e!569408 () Bool)

(assert (=> b!1011978 (= e!569407 e!569408)))

(declare-fun res!679451 () Bool)

(assert (=> b!1011978 (=> (not res!679451) (not e!569408))))

(assert (=> b!1011978 (= res!679451 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31161 a!3219)))))

(declare-fun b!1011979 () Bool)

(assert (=> b!1011979 (= e!569408 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!120499 (not res!679450)) b!1011978))

(assert (= (and b!1011978 res!679451) b!1011979))

(assert (=> d!120499 m!936455))

(declare-fun m!936547 () Bool)

(assert (=> b!1011979 m!936547))

(assert (=> b!1011708 d!120499))

(declare-fun b!1011989 () Bool)

(declare-fun lt!447208 () SeekEntryResult!9526)

(assert (=> b!1011989 (and (bvsge (index!40477 lt!447208) #b00000000000000000000000000000000) (bvslt (index!40477 lt!447208) (size!31161 lt!447092)))))

(declare-fun e!569417 () Bool)

(assert (=> b!1011989 (= e!569417 (= (select (arr!30658 lt!447092) (index!40477 lt!447208)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011990 () Bool)

(declare-fun e!569418 () Bool)

(assert (=> b!1011990 (= e!569418 (bvsge (x!88040 lt!447208) #b01111111111111111111111111111110))))

(declare-fun b!1011991 () Bool)

(declare-fun e!569415 () SeekEntryResult!9526)

(assert (=> b!1011991 (= e!569415 (Intermediate!9526 false index!1507 x!1245))))

(declare-fun b!1011992 () Bool)

(declare-fun e!569414 () SeekEntryResult!9526)

(assert (=> b!1011992 (= e!569414 e!569415)))

(declare-fun c!102436 () Bool)

(declare-fun lt!447209 () (_ BitVec 64))

(assert (=> b!1011992 (= c!102436 (or (= lt!447209 lt!447089) (= (bvadd lt!447209 lt!447209) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011993 () Bool)

(assert (=> b!1011993 (= e!569414 (Intermediate!9526 true index!1507 x!1245))))

(declare-fun b!1011994 () Bool)

(declare-fun e!569416 () Bool)

(assert (=> b!1011994 (= e!569418 e!569416)))

(declare-fun res!679457 () Bool)

(assert (=> b!1011994 (= res!679457 (and ((_ is Intermediate!9526) lt!447208) (not (undefined!10338 lt!447208)) (bvslt (x!88040 lt!447208) #b01111111111111111111111111111110) (bvsge (x!88040 lt!447208) #b00000000000000000000000000000000) (bvsge (x!88040 lt!447208) x!1245)))))

(assert (=> b!1011994 (=> (not res!679457) (not e!569416))))

(declare-fun b!1011995 () Bool)

(assert (=> b!1011995 (= e!569415 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) lt!447089 lt!447092 mask!3464))))

(declare-fun b!1011996 () Bool)

(assert (=> b!1011996 (and (bvsge (index!40477 lt!447208) #b00000000000000000000000000000000) (bvslt (index!40477 lt!447208) (size!31161 lt!447092)))))

(declare-fun res!679456 () Bool)

(assert (=> b!1011996 (= res!679456 (= (select (arr!30658 lt!447092) (index!40477 lt!447208)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011996 (=> res!679456 e!569417)))

(declare-fun b!1011997 () Bool)

(assert (=> b!1011997 (and (bvsge (index!40477 lt!447208) #b00000000000000000000000000000000) (bvslt (index!40477 lt!447208) (size!31161 lt!447092)))))

(declare-fun res!679455 () Bool)

(assert (=> b!1011997 (= res!679455 (= (select (arr!30658 lt!447092) (index!40477 lt!447208)) lt!447089))))

(assert (=> b!1011997 (=> res!679455 e!569417)))

(assert (=> b!1011997 (= e!569416 e!569417)))

(declare-fun d!120505 () Bool)

(assert (=> d!120505 e!569418))

(declare-fun c!102435 () Bool)

(assert (=> d!120505 (= c!102435 (and ((_ is Intermediate!9526) lt!447208) (undefined!10338 lt!447208)))))

(assert (=> d!120505 (= lt!447208 e!569414)))

(declare-fun c!102434 () Bool)

(assert (=> d!120505 (= c!102434 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!120505 (= lt!447209 (select (arr!30658 lt!447092) index!1507))))

(assert (=> d!120505 (validMask!0 mask!3464)))

(assert (=> d!120505 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!447089 lt!447092 mask!3464) lt!447208)))

(assert (= (and d!120505 c!102434) b!1011993))

(assert (= (and d!120505 (not c!102434)) b!1011992))

(assert (= (and b!1011992 c!102436) b!1011991))

(assert (= (and b!1011992 (not c!102436)) b!1011995))

(assert (= (and d!120505 c!102435) b!1011990))

(assert (= (and d!120505 (not c!102435)) b!1011994))

(assert (= (and b!1011994 res!679457) b!1011997))

(assert (= (and b!1011997 (not res!679455)) b!1011996))

(assert (= (and b!1011996 (not res!679456)) b!1011989))

(declare-fun m!936553 () Bool)

(assert (=> b!1011997 m!936553))

(assert (=> b!1011996 m!936553))

(assert (=> b!1011995 m!936535))

(assert (=> b!1011995 m!936535))

(declare-fun m!936559 () Bool)

(assert (=> b!1011995 m!936559))

(declare-fun m!936561 () Bool)

(assert (=> d!120505 m!936561))

(assert (=> d!120505 m!936341))

(assert (=> b!1011989 m!936553))

(assert (=> b!1011718 d!120505))

(declare-fun b!1012007 () Bool)

(declare-fun lt!447212 () SeekEntryResult!9526)

(assert (=> b!1012007 (and (bvsge (index!40477 lt!447212) #b00000000000000000000000000000000) (bvslt (index!40477 lt!447212) (size!31161 a!3219)))))

(declare-fun e!569427 () Bool)

(assert (=> b!1012007 (= e!569427 (= (select (arr!30658 a!3219) (index!40477 lt!447212)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1012008 () Bool)

(declare-fun e!569428 () Bool)

(assert (=> b!1012008 (= e!569428 (bvsge (x!88040 lt!447212) #b01111111111111111111111111111110))))

(declare-fun e!569425 () SeekEntryResult!9526)

(declare-fun b!1012009 () Bool)

(assert (=> b!1012009 (= e!569425 (Intermediate!9526 false (toIndex!0 (select (arr!30658 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1012010 () Bool)

(declare-fun e!569424 () SeekEntryResult!9526)

(assert (=> b!1012010 (= e!569424 e!569425)))

(declare-fun lt!447213 () (_ BitVec 64))

(declare-fun c!102442 () Bool)

(assert (=> b!1012010 (= c!102442 (or (= lt!447213 (select (arr!30658 a!3219) j!170)) (= (bvadd lt!447213 lt!447213) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1012011 () Bool)

(assert (=> b!1012011 (= e!569424 (Intermediate!9526 true (toIndex!0 (select (arr!30658 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1012012 () Bool)

(declare-fun e!569426 () Bool)

(assert (=> b!1012012 (= e!569428 e!569426)))

(declare-fun res!679463 () Bool)

(assert (=> b!1012012 (= res!679463 (and ((_ is Intermediate!9526) lt!447212) (not (undefined!10338 lt!447212)) (bvslt (x!88040 lt!447212) #b01111111111111111111111111111110) (bvsge (x!88040 lt!447212) #b00000000000000000000000000000000) (bvsge (x!88040 lt!447212) #b00000000000000000000000000000000)))))

(assert (=> b!1012012 (=> (not res!679463) (not e!569426))))

(declare-fun b!1012013 () Bool)

(assert (=> b!1012013 (= e!569425 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30658 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (select (arr!30658 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1012014 () Bool)

(assert (=> b!1012014 (and (bvsge (index!40477 lt!447212) #b00000000000000000000000000000000) (bvslt (index!40477 lt!447212) (size!31161 a!3219)))))

(declare-fun res!679462 () Bool)

(assert (=> b!1012014 (= res!679462 (= (select (arr!30658 a!3219) (index!40477 lt!447212)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1012014 (=> res!679462 e!569427)))

(declare-fun b!1012015 () Bool)

(assert (=> b!1012015 (and (bvsge (index!40477 lt!447212) #b00000000000000000000000000000000) (bvslt (index!40477 lt!447212) (size!31161 a!3219)))))

(declare-fun res!679461 () Bool)

(assert (=> b!1012015 (= res!679461 (= (select (arr!30658 a!3219) (index!40477 lt!447212)) (select (arr!30658 a!3219) j!170)))))

(assert (=> b!1012015 (=> res!679461 e!569427)))

(assert (=> b!1012015 (= e!569426 e!569427)))

(declare-fun d!120509 () Bool)

(assert (=> d!120509 e!569428))

(declare-fun c!102441 () Bool)

(assert (=> d!120509 (= c!102441 (and ((_ is Intermediate!9526) lt!447212) (undefined!10338 lt!447212)))))

(assert (=> d!120509 (= lt!447212 e!569424)))

(declare-fun c!102440 () Bool)

(assert (=> d!120509 (= c!102440 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!120509 (= lt!447213 (select (arr!30658 a!3219) (toIndex!0 (select (arr!30658 a!3219) j!170) mask!3464)))))

(assert (=> d!120509 (validMask!0 mask!3464)))

(assert (=> d!120509 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30658 a!3219) j!170) mask!3464) (select (arr!30658 a!3219) j!170) a!3219 mask!3464) lt!447212)))

(assert (= (and d!120509 c!102440) b!1012011))

(assert (= (and d!120509 (not c!102440)) b!1012010))

(assert (= (and b!1012010 c!102442) b!1012009))

(assert (= (and b!1012010 (not c!102442)) b!1012013))

(assert (= (and d!120509 c!102441) b!1012008))

(assert (= (and d!120509 (not c!102441)) b!1012012))

(assert (= (and b!1012012 res!679463) b!1012015))

(assert (= (and b!1012015 (not res!679461)) b!1012014))

(assert (= (and b!1012014 (not res!679462)) b!1012007))

(declare-fun m!936571 () Bool)

(assert (=> b!1012015 m!936571))

(assert (=> b!1012014 m!936571))

(assert (=> b!1012013 m!936363))

(declare-fun m!936573 () Bool)

(assert (=> b!1012013 m!936573))

(assert (=> b!1012013 m!936573))

(assert (=> b!1012013 m!936349))

(declare-fun m!936575 () Bool)

(assert (=> b!1012013 m!936575))

(assert (=> d!120509 m!936363))

(declare-fun m!936577 () Bool)

(assert (=> d!120509 m!936577))

(assert (=> d!120509 m!936341))

(assert (=> b!1012007 m!936571))

(assert (=> b!1011707 d!120509))

(declare-fun d!120513 () Bool)

(declare-fun lt!447215 () (_ BitVec 32))

(declare-fun lt!447214 () (_ BitVec 32))

(assert (=> d!120513 (= lt!447215 (bvmul (bvxor lt!447214 (bvlshr lt!447214 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120513 (= lt!447214 ((_ extract 31 0) (bvand (bvxor (select (arr!30658 a!3219) j!170) (bvlshr (select (arr!30658 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120513 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!679404 (let ((h!22505 ((_ extract 31 0) (bvand (bvxor (select (arr!30658 a!3219) j!170) (bvlshr (select (arr!30658 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88044 (bvmul (bvxor h!22505 (bvlshr h!22505 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88044 (bvlshr x!88044 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!679404 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!679404 #b00000000000000000000000000000000))))))

(assert (=> d!120513 (= (toIndex!0 (select (arr!30658 a!3219) j!170) mask!3464) (bvand (bvxor lt!447215 (bvlshr lt!447215 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1011707 d!120513))

(declare-fun d!120515 () Bool)

(assert (=> d!120515 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!87364 d!120515))

(declare-fun d!120523 () Bool)

(assert (=> d!120523 (= (array_inv!23794 a!3219) (bvsge (size!31161 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!87364 d!120523))

(check-sat (not d!120469) (not d!120463) (not bm!42475) (not b!1011822) (not d!120505) (not b!1011937) (not d!120493) (not b!1011971) (not b!1011936) (not b!1012013) (not d!120509) (not b!1011995) (not b!1011903) (not b!1011933) (not d!120473) (not b!1011979) (not d!120487) (not bm!42472) (not b!1011820) (not b!1011944) (not b!1011848))
(check-sat)
