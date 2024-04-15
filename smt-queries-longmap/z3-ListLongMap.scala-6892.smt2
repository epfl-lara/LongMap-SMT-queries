; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86598 () Bool)

(assert start!86598)

(declare-fun b!1004269 () Bool)

(declare-fun res!673872 () Bool)

(declare-fun e!565499 () Bool)

(assert (=> b!1004269 (=> (not res!673872) (not e!565499))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-datatypes ((array!63346 0))(
  ( (array!63347 (arr!30498 (Array (_ BitVec 32) (_ BitVec 64))) (size!31002 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63346)

(assert (=> b!1004269 (= res!673872 (and (= (size!31002 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31002 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31002 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004270 () Bool)

(declare-fun res!673871 () Bool)

(assert (=> b!1004270 (=> (not res!673871) (not e!565499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004270 (= res!673871 (validKeyInArray!0 (select (arr!30498 a!3219) j!170)))))

(declare-fun b!1004271 () Bool)

(declare-fun res!673876 () Bool)

(declare-fun e!565500 () Bool)

(assert (=> b!1004271 (=> (not res!673876) (not e!565500))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004271 (= res!673876 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31002 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31002 a!3219))))))

(declare-fun b!1004272 () Bool)

(declare-fun res!673873 () Bool)

(assert (=> b!1004272 (=> (not res!673873) (not e!565500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63346 (_ BitVec 32)) Bool)

(assert (=> b!1004272 (= res!673873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!673880 () Bool)

(assert (=> start!86598 (=> (not res!673880) (not e!565499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86598 (= res!673880 (validMask!0 mask!3464))))

(assert (=> start!86598 e!565499))

(declare-fun array_inv!23641 (array!63346) Bool)

(assert (=> start!86598 (array_inv!23641 a!3219)))

(assert (=> start!86598 true))

(declare-fun b!1004273 () Bool)

(declare-fun e!565501 () Bool)

(declare-fun e!565498 () Bool)

(assert (=> b!1004273 (= e!565501 e!565498)))

(declare-fun res!673881 () Bool)

(assert (=> b!1004273 (=> (not res!673881) (not e!565498))))

(declare-datatypes ((SeekEntryResult!9455 0))(
  ( (MissingZero!9455 (index!40191 (_ BitVec 32))) (Found!9455 (index!40192 (_ BitVec 32))) (Intermediate!9455 (undefined!10267 Bool) (index!40193 (_ BitVec 32)) (x!87606 (_ BitVec 32))) (Undefined!9455) (MissingVacant!9455 (index!40194 (_ BitVec 32))) )
))
(declare-fun lt!443968 () SeekEntryResult!9455)

(declare-fun lt!443969 () array!63346)

(declare-fun lt!443971 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63346 (_ BitVec 32)) SeekEntryResult!9455)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004273 (= res!673881 (not (= lt!443968 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443971 mask!3464) lt!443971 lt!443969 mask!3464))))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1004273 (= lt!443971 (select (store (arr!30498 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1004273 (= lt!443969 (array!63347 (store (arr!30498 a!3219) i!1194 k0!2224) (size!31002 a!3219)))))

(declare-fun b!1004274 () Bool)

(assert (=> b!1004274 (= e!565499 e!565500)))

(declare-fun res!673875 () Bool)

(assert (=> b!1004274 (=> (not res!673875) (not e!565500))))

(declare-fun lt!443970 () SeekEntryResult!9455)

(assert (=> b!1004274 (= res!673875 (or (= lt!443970 (MissingVacant!9455 i!1194)) (= lt!443970 (MissingZero!9455 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63346 (_ BitVec 32)) SeekEntryResult!9455)

(assert (=> b!1004274 (= lt!443970 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1004275 () Bool)

(assert (=> b!1004275 (= e!565498 (and (= index!1507 resIndex!38) (not (= x!1245 resX!38))))))

(declare-fun b!1004276 () Bool)

(declare-fun res!673877 () Bool)

(assert (=> b!1004276 (=> (not res!673877) (not e!565498))))

(declare-fun lt!443967 () SeekEntryResult!9455)

(assert (=> b!1004276 (= res!673877 (not (= lt!443967 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443971 lt!443969 mask!3464))))))

(declare-fun b!1004277 () Bool)

(declare-fun res!673878 () Bool)

(assert (=> b!1004277 (=> (not res!673878) (not e!565500))))

(declare-datatypes ((List!21240 0))(
  ( (Nil!21237) (Cons!21236 (h!22413 (_ BitVec 64)) (t!30232 List!21240)) )
))
(declare-fun arrayNoDuplicates!0 (array!63346 (_ BitVec 32) List!21240) Bool)

(assert (=> b!1004277 (= res!673878 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21237))))

(declare-fun b!1004278 () Bool)

(declare-fun res!673874 () Bool)

(assert (=> b!1004278 (=> (not res!673874) (not e!565499))))

(assert (=> b!1004278 (= res!673874 (validKeyInArray!0 k0!2224))))

(declare-fun b!1004279 () Bool)

(declare-fun e!565502 () Bool)

(assert (=> b!1004279 (= e!565502 e!565501)))

(declare-fun res!673882 () Bool)

(assert (=> b!1004279 (=> (not res!673882) (not e!565501))))

(declare-fun lt!443966 () SeekEntryResult!9455)

(assert (=> b!1004279 (= res!673882 (= lt!443967 lt!443966))))

(assert (=> b!1004279 (= lt!443967 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30498 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004280 () Bool)

(declare-fun res!673879 () Bool)

(assert (=> b!1004280 (=> (not res!673879) (not e!565499))))

(declare-fun arrayContainsKey!0 (array!63346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004280 (= res!673879 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004281 () Bool)

(assert (=> b!1004281 (= e!565500 e!565502)))

(declare-fun res!673883 () Bool)

(assert (=> b!1004281 (=> (not res!673883) (not e!565502))))

(assert (=> b!1004281 (= res!673883 (= lt!443968 lt!443966))))

(assert (=> b!1004281 (= lt!443966 (Intermediate!9455 false resIndex!38 resX!38))))

(assert (=> b!1004281 (= lt!443968 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30498 a!3219) j!170) mask!3464) (select (arr!30498 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86598 res!673880) b!1004269))

(assert (= (and b!1004269 res!673872) b!1004270))

(assert (= (and b!1004270 res!673871) b!1004278))

(assert (= (and b!1004278 res!673874) b!1004280))

(assert (= (and b!1004280 res!673879) b!1004274))

(assert (= (and b!1004274 res!673875) b!1004272))

(assert (= (and b!1004272 res!673873) b!1004277))

(assert (= (and b!1004277 res!673878) b!1004271))

(assert (= (and b!1004271 res!673876) b!1004281))

(assert (= (and b!1004281 res!673883) b!1004279))

(assert (= (and b!1004279 res!673882) b!1004273))

(assert (= (and b!1004273 res!673881) b!1004276))

(assert (= (and b!1004276 res!673877) b!1004275))

(declare-fun m!929299 () Bool)

(assert (=> b!1004273 m!929299))

(assert (=> b!1004273 m!929299))

(declare-fun m!929301 () Bool)

(assert (=> b!1004273 m!929301))

(declare-fun m!929303 () Bool)

(assert (=> b!1004273 m!929303))

(declare-fun m!929305 () Bool)

(assert (=> b!1004273 m!929305))

(declare-fun m!929307 () Bool)

(assert (=> b!1004280 m!929307))

(declare-fun m!929309 () Bool)

(assert (=> b!1004278 m!929309))

(declare-fun m!929311 () Bool)

(assert (=> b!1004276 m!929311))

(declare-fun m!929313 () Bool)

(assert (=> b!1004272 m!929313))

(declare-fun m!929315 () Bool)

(assert (=> start!86598 m!929315))

(declare-fun m!929317 () Bool)

(assert (=> start!86598 m!929317))

(declare-fun m!929319 () Bool)

(assert (=> b!1004277 m!929319))

(declare-fun m!929321 () Bool)

(assert (=> b!1004270 m!929321))

(assert (=> b!1004270 m!929321))

(declare-fun m!929323 () Bool)

(assert (=> b!1004270 m!929323))

(declare-fun m!929325 () Bool)

(assert (=> b!1004274 m!929325))

(assert (=> b!1004281 m!929321))

(assert (=> b!1004281 m!929321))

(declare-fun m!929327 () Bool)

(assert (=> b!1004281 m!929327))

(assert (=> b!1004281 m!929327))

(assert (=> b!1004281 m!929321))

(declare-fun m!929329 () Bool)

(assert (=> b!1004281 m!929329))

(assert (=> b!1004279 m!929321))

(assert (=> b!1004279 m!929321))

(declare-fun m!929331 () Bool)

(assert (=> b!1004279 m!929331))

(check-sat (not b!1004281) (not start!86598) (not b!1004279) (not b!1004273) (not b!1004280) (not b!1004278) (not b!1004276) (not b!1004270) (not b!1004277) (not b!1004272) (not b!1004274))
(check-sat)
(get-model)

(declare-fun b!1004372 () Bool)

(declare-fun c!101355 () Bool)

(declare-fun lt!444016 () (_ BitVec 64))

(assert (=> b!1004372 (= c!101355 (= lt!444016 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!565547 () SeekEntryResult!9455)

(declare-fun e!565546 () SeekEntryResult!9455)

(assert (=> b!1004372 (= e!565547 e!565546)))

(declare-fun d!119233 () Bool)

(declare-fun lt!444015 () SeekEntryResult!9455)

(get-info :version)

(assert (=> d!119233 (and (or ((_ is Undefined!9455) lt!444015) (not ((_ is Found!9455) lt!444015)) (and (bvsge (index!40192 lt!444015) #b00000000000000000000000000000000) (bvslt (index!40192 lt!444015) (size!31002 a!3219)))) (or ((_ is Undefined!9455) lt!444015) ((_ is Found!9455) lt!444015) (not ((_ is MissingZero!9455) lt!444015)) (and (bvsge (index!40191 lt!444015) #b00000000000000000000000000000000) (bvslt (index!40191 lt!444015) (size!31002 a!3219)))) (or ((_ is Undefined!9455) lt!444015) ((_ is Found!9455) lt!444015) ((_ is MissingZero!9455) lt!444015) (not ((_ is MissingVacant!9455) lt!444015)) (and (bvsge (index!40194 lt!444015) #b00000000000000000000000000000000) (bvslt (index!40194 lt!444015) (size!31002 a!3219)))) (or ((_ is Undefined!9455) lt!444015) (ite ((_ is Found!9455) lt!444015) (= (select (arr!30498 a!3219) (index!40192 lt!444015)) k0!2224) (ite ((_ is MissingZero!9455) lt!444015) (= (select (arr!30498 a!3219) (index!40191 lt!444015)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9455) lt!444015) (= (select (arr!30498 a!3219) (index!40194 lt!444015)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!565545 () SeekEntryResult!9455)

(assert (=> d!119233 (= lt!444015 e!565545)))

(declare-fun c!101356 () Bool)

(declare-fun lt!444014 () SeekEntryResult!9455)

(assert (=> d!119233 (= c!101356 (and ((_ is Intermediate!9455) lt!444014) (undefined!10267 lt!444014)))))

(assert (=> d!119233 (= lt!444014 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119233 (validMask!0 mask!3464)))

(assert (=> d!119233 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!444015)))

(declare-fun b!1004373 () Bool)

(assert (=> b!1004373 (= e!565546 (MissingZero!9455 (index!40193 lt!444014)))))

(declare-fun b!1004374 () Bool)

(assert (=> b!1004374 (= e!565545 e!565547)))

(assert (=> b!1004374 (= lt!444016 (select (arr!30498 a!3219) (index!40193 lt!444014)))))

(declare-fun c!101354 () Bool)

(assert (=> b!1004374 (= c!101354 (= lt!444016 k0!2224))))

(declare-fun b!1004375 () Bool)

(assert (=> b!1004375 (= e!565547 (Found!9455 (index!40193 lt!444014)))))

(declare-fun b!1004376 () Bool)

(assert (=> b!1004376 (= e!565545 Undefined!9455)))

(declare-fun b!1004377 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63346 (_ BitVec 32)) SeekEntryResult!9455)

(assert (=> b!1004377 (= e!565546 (seekKeyOrZeroReturnVacant!0 (x!87606 lt!444014) (index!40193 lt!444014) (index!40193 lt!444014) k0!2224 a!3219 mask!3464))))

(assert (= (and d!119233 c!101356) b!1004376))

(assert (= (and d!119233 (not c!101356)) b!1004374))

(assert (= (and b!1004374 c!101354) b!1004375))

(assert (= (and b!1004374 (not c!101354)) b!1004372))

(assert (= (and b!1004372 c!101355) b!1004373))

(assert (= (and b!1004372 (not c!101355)) b!1004377))

(declare-fun m!929401 () Bool)

(assert (=> d!119233 m!929401))

(declare-fun m!929403 () Bool)

(assert (=> d!119233 m!929403))

(declare-fun m!929405 () Bool)

(assert (=> d!119233 m!929405))

(assert (=> d!119233 m!929403))

(declare-fun m!929407 () Bool)

(assert (=> d!119233 m!929407))

(declare-fun m!929409 () Bool)

(assert (=> d!119233 m!929409))

(assert (=> d!119233 m!929315))

(declare-fun m!929411 () Bool)

(assert (=> b!1004374 m!929411))

(declare-fun m!929413 () Bool)

(assert (=> b!1004377 m!929413))

(assert (=> b!1004274 d!119233))

(declare-fun b!1004406 () Bool)

(declare-fun e!565568 () SeekEntryResult!9455)

(assert (=> b!1004406 (= e!565568 (Intermediate!9455 true index!1507 x!1245))))

(declare-fun b!1004407 () Bool)

(declare-fun e!565566 () Bool)

(declare-fun e!565570 () Bool)

(assert (=> b!1004407 (= e!565566 e!565570)))

(declare-fun res!673976 () Bool)

(declare-fun lt!444022 () SeekEntryResult!9455)

(assert (=> b!1004407 (= res!673976 (and ((_ is Intermediate!9455) lt!444022) (not (undefined!10267 lt!444022)) (bvslt (x!87606 lt!444022) #b01111111111111111111111111111110) (bvsge (x!87606 lt!444022) #b00000000000000000000000000000000) (bvsge (x!87606 lt!444022) x!1245)))))

(assert (=> b!1004407 (=> (not res!673976) (not e!565570))))

(declare-fun b!1004408 () Bool)

(declare-fun e!565569 () SeekEntryResult!9455)

(assert (=> b!1004408 (= e!565568 e!565569)))

(declare-fun c!101367 () Bool)

(declare-fun lt!444021 () (_ BitVec 64))

(assert (=> b!1004408 (= c!101367 (or (= lt!444021 (select (arr!30498 a!3219) j!170)) (= (bvadd lt!444021 lt!444021) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004410 () Bool)

(assert (=> b!1004410 (and (bvsge (index!40193 lt!444022) #b00000000000000000000000000000000) (bvslt (index!40193 lt!444022) (size!31002 a!3219)))))

(declare-fun e!565567 () Bool)

(assert (=> b!1004410 (= e!565567 (= (select (arr!30498 a!3219) (index!40193 lt!444022)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1004411 () Bool)

(assert (=> b!1004411 (and (bvsge (index!40193 lt!444022) #b00000000000000000000000000000000) (bvslt (index!40193 lt!444022) (size!31002 a!3219)))))

(declare-fun res!673975 () Bool)

(assert (=> b!1004411 (= res!673975 (= (select (arr!30498 a!3219) (index!40193 lt!444022)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004411 (=> res!673975 e!565567)))

(declare-fun b!1004412 () Bool)

(assert (=> b!1004412 (and (bvsge (index!40193 lt!444022) #b00000000000000000000000000000000) (bvslt (index!40193 lt!444022) (size!31002 a!3219)))))

(declare-fun res!673974 () Bool)

(assert (=> b!1004412 (= res!673974 (= (select (arr!30498 a!3219) (index!40193 lt!444022)) (select (arr!30498 a!3219) j!170)))))

(assert (=> b!1004412 (=> res!673974 e!565567)))

(assert (=> b!1004412 (= e!565570 e!565567)))

(declare-fun b!1004413 () Bool)

(assert (=> b!1004413 (= e!565566 (bvsge (x!87606 lt!444022) #b01111111111111111111111111111110))))

(declare-fun b!1004414 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004414 (= e!565569 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30498 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004409 () Bool)

(assert (=> b!1004409 (= e!565569 (Intermediate!9455 false index!1507 x!1245))))

(declare-fun d!119235 () Bool)

(assert (=> d!119235 e!565566))

(declare-fun c!101366 () Bool)

(assert (=> d!119235 (= c!101366 (and ((_ is Intermediate!9455) lt!444022) (undefined!10267 lt!444022)))))

(assert (=> d!119235 (= lt!444022 e!565568)))

(declare-fun c!101365 () Bool)

(assert (=> d!119235 (= c!101365 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119235 (= lt!444021 (select (arr!30498 a!3219) index!1507))))

(assert (=> d!119235 (validMask!0 mask!3464)))

(assert (=> d!119235 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30498 a!3219) j!170) a!3219 mask!3464) lt!444022)))

(assert (= (and d!119235 c!101365) b!1004406))

(assert (= (and d!119235 (not c!101365)) b!1004408))

(assert (= (and b!1004408 c!101367) b!1004409))

(assert (= (and b!1004408 (not c!101367)) b!1004414))

(assert (= (and d!119235 c!101366) b!1004413))

(assert (= (and d!119235 (not c!101366)) b!1004407))

(assert (= (and b!1004407 res!673976) b!1004412))

(assert (= (and b!1004412 (not res!673974)) b!1004411))

(assert (= (and b!1004411 (not res!673975)) b!1004410))

(declare-fun m!929415 () Bool)

(assert (=> b!1004414 m!929415))

(assert (=> b!1004414 m!929415))

(assert (=> b!1004414 m!929321))

(declare-fun m!929417 () Bool)

(assert (=> b!1004414 m!929417))

(declare-fun m!929419 () Bool)

(assert (=> b!1004412 m!929419))

(declare-fun m!929421 () Bool)

(assert (=> d!119235 m!929421))

(assert (=> d!119235 m!929315))

(assert (=> b!1004410 m!929419))

(assert (=> b!1004411 m!929419))

(assert (=> b!1004279 d!119235))

(declare-fun d!119241 () Bool)

(assert (=> d!119241 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86598 d!119241))

(declare-fun d!119245 () Bool)

(assert (=> d!119245 (= (array_inv!23641 a!3219) (bvsge (size!31002 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86598 d!119245))

(declare-fun b!1004428 () Bool)

(declare-fun e!565581 () SeekEntryResult!9455)

(assert (=> b!1004428 (= e!565581 (Intermediate!9455 true (toIndex!0 (select (arr!30498 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1004429 () Bool)

(declare-fun e!565579 () Bool)

(declare-fun e!565583 () Bool)

(assert (=> b!1004429 (= e!565579 e!565583)))

(declare-fun res!673982 () Bool)

(declare-fun lt!444028 () SeekEntryResult!9455)

(assert (=> b!1004429 (= res!673982 (and ((_ is Intermediate!9455) lt!444028) (not (undefined!10267 lt!444028)) (bvslt (x!87606 lt!444028) #b01111111111111111111111111111110) (bvsge (x!87606 lt!444028) #b00000000000000000000000000000000) (bvsge (x!87606 lt!444028) #b00000000000000000000000000000000)))))

(assert (=> b!1004429 (=> (not res!673982) (not e!565583))))

(declare-fun b!1004430 () Bool)

(declare-fun e!565582 () SeekEntryResult!9455)

(assert (=> b!1004430 (= e!565581 e!565582)))

(declare-fun c!101375 () Bool)

(declare-fun lt!444027 () (_ BitVec 64))

(assert (=> b!1004430 (= c!101375 (or (= lt!444027 (select (arr!30498 a!3219) j!170)) (= (bvadd lt!444027 lt!444027) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004432 () Bool)

(assert (=> b!1004432 (and (bvsge (index!40193 lt!444028) #b00000000000000000000000000000000) (bvslt (index!40193 lt!444028) (size!31002 a!3219)))))

(declare-fun e!565580 () Bool)

(assert (=> b!1004432 (= e!565580 (= (select (arr!30498 a!3219) (index!40193 lt!444028)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1004433 () Bool)

(assert (=> b!1004433 (and (bvsge (index!40193 lt!444028) #b00000000000000000000000000000000) (bvslt (index!40193 lt!444028) (size!31002 a!3219)))))

(declare-fun res!673981 () Bool)

(assert (=> b!1004433 (= res!673981 (= (select (arr!30498 a!3219) (index!40193 lt!444028)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004433 (=> res!673981 e!565580)))

(declare-fun b!1004434 () Bool)

(assert (=> b!1004434 (and (bvsge (index!40193 lt!444028) #b00000000000000000000000000000000) (bvslt (index!40193 lt!444028) (size!31002 a!3219)))))

(declare-fun res!673980 () Bool)

(assert (=> b!1004434 (= res!673980 (= (select (arr!30498 a!3219) (index!40193 lt!444028)) (select (arr!30498 a!3219) j!170)))))

(assert (=> b!1004434 (=> res!673980 e!565580)))

(assert (=> b!1004434 (= e!565583 e!565580)))

(declare-fun b!1004435 () Bool)

(assert (=> b!1004435 (= e!565579 (bvsge (x!87606 lt!444028) #b01111111111111111111111111111110))))

(declare-fun b!1004436 () Bool)

(assert (=> b!1004436 (= e!565582 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30498 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30498 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004431 () Bool)

(assert (=> b!1004431 (= e!565582 (Intermediate!9455 false (toIndex!0 (select (arr!30498 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun d!119247 () Bool)

(assert (=> d!119247 e!565579))

(declare-fun c!101374 () Bool)

(assert (=> d!119247 (= c!101374 (and ((_ is Intermediate!9455) lt!444028) (undefined!10267 lt!444028)))))

(assert (=> d!119247 (= lt!444028 e!565581)))

(declare-fun c!101373 () Bool)

(assert (=> d!119247 (= c!101373 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119247 (= lt!444027 (select (arr!30498 a!3219) (toIndex!0 (select (arr!30498 a!3219) j!170) mask!3464)))))

(assert (=> d!119247 (validMask!0 mask!3464)))

(assert (=> d!119247 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30498 a!3219) j!170) mask!3464) (select (arr!30498 a!3219) j!170) a!3219 mask!3464) lt!444028)))

(assert (= (and d!119247 c!101373) b!1004428))

(assert (= (and d!119247 (not c!101373)) b!1004430))

(assert (= (and b!1004430 c!101375) b!1004431))

(assert (= (and b!1004430 (not c!101375)) b!1004436))

(assert (= (and d!119247 c!101374) b!1004435))

(assert (= (and d!119247 (not c!101374)) b!1004429))

(assert (= (and b!1004429 res!673982) b!1004434))

(assert (= (and b!1004434 (not res!673980)) b!1004433))

(assert (= (and b!1004433 (not res!673981)) b!1004432))

(assert (=> b!1004436 m!929327))

(declare-fun m!929431 () Bool)

(assert (=> b!1004436 m!929431))

(assert (=> b!1004436 m!929431))

(assert (=> b!1004436 m!929321))

(declare-fun m!929433 () Bool)

(assert (=> b!1004436 m!929433))

(declare-fun m!929435 () Bool)

(assert (=> b!1004434 m!929435))

(assert (=> d!119247 m!929327))

(declare-fun m!929437 () Bool)

(assert (=> d!119247 m!929437))

(assert (=> d!119247 m!929315))

(assert (=> b!1004432 m!929435))

(assert (=> b!1004433 m!929435))

(assert (=> b!1004281 d!119247))

(declare-fun d!119249 () Bool)

(declare-fun lt!444034 () (_ BitVec 32))

(declare-fun lt!444033 () (_ BitVec 32))

(assert (=> d!119249 (= lt!444034 (bvmul (bvxor lt!444033 (bvlshr lt!444033 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119249 (= lt!444033 ((_ extract 31 0) (bvand (bvxor (select (arr!30498 a!3219) j!170) (bvlshr (select (arr!30498 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119249 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!673985 (let ((h!22416 ((_ extract 31 0) (bvand (bvxor (select (arr!30498 a!3219) j!170) (bvlshr (select (arr!30498 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87611 (bvmul (bvxor h!22416 (bvlshr h!22416 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87611 (bvlshr x!87611 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!673985 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!673985 #b00000000000000000000000000000000))))))

(assert (=> d!119249 (= (toIndex!0 (select (arr!30498 a!3219) j!170) mask!3464) (bvand (bvxor lt!444034 (bvlshr lt!444034 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1004281 d!119249))

(declare-fun d!119251 () Bool)

(assert (=> d!119251 (= (validKeyInArray!0 (select (arr!30498 a!3219) j!170)) (and (not (= (select (arr!30498 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30498 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1004270 d!119251))

(declare-fun d!119253 () Bool)

(declare-fun res!673997 () Bool)

(declare-fun e!565599 () Bool)

(assert (=> d!119253 (=> res!673997 e!565599)))

(assert (=> d!119253 (= res!673997 (= (select (arr!30498 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119253 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!565599)))

(declare-fun b!1004460 () Bool)

(declare-fun e!565600 () Bool)

(assert (=> b!1004460 (= e!565599 e!565600)))

(declare-fun res!673998 () Bool)

(assert (=> b!1004460 (=> (not res!673998) (not e!565600))))

(assert (=> b!1004460 (= res!673998 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31002 a!3219)))))

(declare-fun b!1004461 () Bool)

(assert (=> b!1004461 (= e!565600 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119253 (not res!673997)) b!1004460))

(assert (= (and b!1004460 res!673998) b!1004461))

(declare-fun m!929443 () Bool)

(assert (=> d!119253 m!929443))

(declare-fun m!929445 () Bool)

(assert (=> b!1004461 m!929445))

(assert (=> b!1004280 d!119253))

(declare-fun b!1004481 () Bool)

(declare-fun e!565617 () Bool)

(declare-fun contains!5851 (List!21240 (_ BitVec 64)) Bool)

(assert (=> b!1004481 (= e!565617 (contains!5851 Nil!21237 (select (arr!30498 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1004482 () Bool)

(declare-fun e!565614 () Bool)

(declare-fun call!42292 () Bool)

(assert (=> b!1004482 (= e!565614 call!42292)))

(declare-fun bm!42289 () Bool)

(declare-fun c!101386 () Bool)

(assert (=> bm!42289 (= call!42292 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101386 (Cons!21236 (select (arr!30498 a!3219) #b00000000000000000000000000000000) Nil!21237) Nil!21237)))))

(declare-fun b!1004483 () Bool)

(assert (=> b!1004483 (= e!565614 call!42292)))

(declare-fun b!1004484 () Bool)

(declare-fun e!565616 () Bool)

(assert (=> b!1004484 (= e!565616 e!565614)))

(assert (=> b!1004484 (= c!101386 (validKeyInArray!0 (select (arr!30498 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1004485 () Bool)

(declare-fun e!565615 () Bool)

(assert (=> b!1004485 (= e!565615 e!565616)))

(declare-fun res!674008 () Bool)

(assert (=> b!1004485 (=> (not res!674008) (not e!565616))))

(assert (=> b!1004485 (= res!674008 (not e!565617))))

(declare-fun res!674010 () Bool)

(assert (=> b!1004485 (=> (not res!674010) (not e!565617))))

(assert (=> b!1004485 (= res!674010 (validKeyInArray!0 (select (arr!30498 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119255 () Bool)

(declare-fun res!674009 () Bool)

(assert (=> d!119255 (=> res!674009 e!565615)))

(assert (=> d!119255 (= res!674009 (bvsge #b00000000000000000000000000000000 (size!31002 a!3219)))))

(assert (=> d!119255 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21237) e!565615)))

(assert (= (and d!119255 (not res!674009)) b!1004485))

(assert (= (and b!1004485 res!674010) b!1004481))

(assert (= (and b!1004485 res!674008) b!1004484))

(assert (= (and b!1004484 c!101386) b!1004483))

(assert (= (and b!1004484 (not c!101386)) b!1004482))

(assert (= (or b!1004483 b!1004482) bm!42289))

(assert (=> b!1004481 m!929443))

(assert (=> b!1004481 m!929443))

(declare-fun m!929457 () Bool)

(assert (=> b!1004481 m!929457))

(assert (=> bm!42289 m!929443))

(declare-fun m!929459 () Bool)

(assert (=> bm!42289 m!929459))

(assert (=> b!1004484 m!929443))

(assert (=> b!1004484 m!929443))

(declare-fun m!929461 () Bool)

(assert (=> b!1004484 m!929461))

(assert (=> b!1004485 m!929443))

(assert (=> b!1004485 m!929443))

(assert (=> b!1004485 m!929461))

(assert (=> b!1004277 d!119255))

(declare-fun b!1004486 () Bool)

(declare-fun e!565620 () SeekEntryResult!9455)

(assert (=> b!1004486 (= e!565620 (Intermediate!9455 true index!1507 x!1245))))

(declare-fun b!1004487 () Bool)

(declare-fun e!565618 () Bool)

(declare-fun e!565622 () Bool)

(assert (=> b!1004487 (= e!565618 e!565622)))

(declare-fun res!674013 () Bool)

(declare-fun lt!444040 () SeekEntryResult!9455)

(assert (=> b!1004487 (= res!674013 (and ((_ is Intermediate!9455) lt!444040) (not (undefined!10267 lt!444040)) (bvslt (x!87606 lt!444040) #b01111111111111111111111111111110) (bvsge (x!87606 lt!444040) #b00000000000000000000000000000000) (bvsge (x!87606 lt!444040) x!1245)))))

(assert (=> b!1004487 (=> (not res!674013) (not e!565622))))

(declare-fun b!1004488 () Bool)

(declare-fun e!565621 () SeekEntryResult!9455)

(assert (=> b!1004488 (= e!565620 e!565621)))

(declare-fun c!101389 () Bool)

(declare-fun lt!444039 () (_ BitVec 64))

(assert (=> b!1004488 (= c!101389 (or (= lt!444039 lt!443971) (= (bvadd lt!444039 lt!444039) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004490 () Bool)

(assert (=> b!1004490 (and (bvsge (index!40193 lt!444040) #b00000000000000000000000000000000) (bvslt (index!40193 lt!444040) (size!31002 lt!443969)))))

(declare-fun e!565619 () Bool)

(assert (=> b!1004490 (= e!565619 (= (select (arr!30498 lt!443969) (index!40193 lt!444040)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1004491 () Bool)

(assert (=> b!1004491 (and (bvsge (index!40193 lt!444040) #b00000000000000000000000000000000) (bvslt (index!40193 lt!444040) (size!31002 lt!443969)))))

(declare-fun res!674012 () Bool)

(assert (=> b!1004491 (= res!674012 (= (select (arr!30498 lt!443969) (index!40193 lt!444040)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004491 (=> res!674012 e!565619)))

(declare-fun b!1004492 () Bool)

(assert (=> b!1004492 (and (bvsge (index!40193 lt!444040) #b00000000000000000000000000000000) (bvslt (index!40193 lt!444040) (size!31002 lt!443969)))))

(declare-fun res!674011 () Bool)

(assert (=> b!1004492 (= res!674011 (= (select (arr!30498 lt!443969) (index!40193 lt!444040)) lt!443971))))

(assert (=> b!1004492 (=> res!674011 e!565619)))

(assert (=> b!1004492 (= e!565622 e!565619)))

(declare-fun b!1004493 () Bool)

(assert (=> b!1004493 (= e!565618 (bvsge (x!87606 lt!444040) #b01111111111111111111111111111110))))

(declare-fun b!1004494 () Bool)

(assert (=> b!1004494 (= e!565621 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!443971 lt!443969 mask!3464))))

(declare-fun b!1004489 () Bool)

(assert (=> b!1004489 (= e!565621 (Intermediate!9455 false index!1507 x!1245))))

(declare-fun d!119261 () Bool)

(assert (=> d!119261 e!565618))

(declare-fun c!101388 () Bool)

(assert (=> d!119261 (= c!101388 (and ((_ is Intermediate!9455) lt!444040) (undefined!10267 lt!444040)))))

(assert (=> d!119261 (= lt!444040 e!565620)))

(declare-fun c!101387 () Bool)

(assert (=> d!119261 (= c!101387 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119261 (= lt!444039 (select (arr!30498 lt!443969) index!1507))))

(assert (=> d!119261 (validMask!0 mask!3464)))

(assert (=> d!119261 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443971 lt!443969 mask!3464) lt!444040)))

(assert (= (and d!119261 c!101387) b!1004486))

(assert (= (and d!119261 (not c!101387)) b!1004488))

(assert (= (and b!1004488 c!101389) b!1004489))

(assert (= (and b!1004488 (not c!101389)) b!1004494))

(assert (= (and d!119261 c!101388) b!1004493))

(assert (= (and d!119261 (not c!101388)) b!1004487))

(assert (= (and b!1004487 res!674013) b!1004492))

(assert (= (and b!1004492 (not res!674011)) b!1004491))

(assert (= (and b!1004491 (not res!674012)) b!1004490))

(assert (=> b!1004494 m!929415))

(assert (=> b!1004494 m!929415))

(declare-fun m!929463 () Bool)

(assert (=> b!1004494 m!929463))

(declare-fun m!929465 () Bool)

(assert (=> b!1004492 m!929465))

(declare-fun m!929467 () Bool)

(assert (=> d!119261 m!929467))

(assert (=> d!119261 m!929315))

(assert (=> b!1004490 m!929465))

(assert (=> b!1004491 m!929465))

(assert (=> b!1004276 d!119261))

(declare-fun b!1004497 () Bool)

(declare-fun e!565625 () SeekEntryResult!9455)

(assert (=> b!1004497 (= e!565625 (Intermediate!9455 true (toIndex!0 lt!443971 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1004498 () Bool)

(declare-fun e!565623 () Bool)

(declare-fun e!565627 () Bool)

(assert (=> b!1004498 (= e!565623 e!565627)))

(declare-fun res!674016 () Bool)

(declare-fun lt!444046 () SeekEntryResult!9455)

(assert (=> b!1004498 (= res!674016 (and ((_ is Intermediate!9455) lt!444046) (not (undefined!10267 lt!444046)) (bvslt (x!87606 lt!444046) #b01111111111111111111111111111110) (bvsge (x!87606 lt!444046) #b00000000000000000000000000000000) (bvsge (x!87606 lt!444046) #b00000000000000000000000000000000)))))

(assert (=> b!1004498 (=> (not res!674016) (not e!565627))))

(declare-fun b!1004499 () Bool)

(declare-fun e!565626 () SeekEntryResult!9455)

(assert (=> b!1004499 (= e!565625 e!565626)))

(declare-fun c!101392 () Bool)

(declare-fun lt!444045 () (_ BitVec 64))

(assert (=> b!1004499 (= c!101392 (or (= lt!444045 lt!443971) (= (bvadd lt!444045 lt!444045) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004501 () Bool)

(assert (=> b!1004501 (and (bvsge (index!40193 lt!444046) #b00000000000000000000000000000000) (bvslt (index!40193 lt!444046) (size!31002 lt!443969)))))

(declare-fun e!565624 () Bool)

(assert (=> b!1004501 (= e!565624 (= (select (arr!30498 lt!443969) (index!40193 lt!444046)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1004502 () Bool)

(assert (=> b!1004502 (and (bvsge (index!40193 lt!444046) #b00000000000000000000000000000000) (bvslt (index!40193 lt!444046) (size!31002 lt!443969)))))

(declare-fun res!674015 () Bool)

(assert (=> b!1004502 (= res!674015 (= (select (arr!30498 lt!443969) (index!40193 lt!444046)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004502 (=> res!674015 e!565624)))

(declare-fun b!1004503 () Bool)

(assert (=> b!1004503 (and (bvsge (index!40193 lt!444046) #b00000000000000000000000000000000) (bvslt (index!40193 lt!444046) (size!31002 lt!443969)))))

(declare-fun res!674014 () Bool)

(assert (=> b!1004503 (= res!674014 (= (select (arr!30498 lt!443969) (index!40193 lt!444046)) lt!443971))))

(assert (=> b!1004503 (=> res!674014 e!565624)))

(assert (=> b!1004503 (= e!565627 e!565624)))

(declare-fun b!1004504 () Bool)

(assert (=> b!1004504 (= e!565623 (bvsge (x!87606 lt!444046) #b01111111111111111111111111111110))))

(declare-fun b!1004505 () Bool)

(assert (=> b!1004505 (= e!565626 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!443971 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!443971 lt!443969 mask!3464))))

(declare-fun b!1004500 () Bool)

(assert (=> b!1004500 (= e!565626 (Intermediate!9455 false (toIndex!0 lt!443971 mask!3464) #b00000000000000000000000000000000))))

(declare-fun d!119263 () Bool)

(assert (=> d!119263 e!565623))

(declare-fun c!101391 () Bool)

(assert (=> d!119263 (= c!101391 (and ((_ is Intermediate!9455) lt!444046) (undefined!10267 lt!444046)))))

(assert (=> d!119263 (= lt!444046 e!565625)))

(declare-fun c!101390 () Bool)

(assert (=> d!119263 (= c!101390 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119263 (= lt!444045 (select (arr!30498 lt!443969) (toIndex!0 lt!443971 mask!3464)))))

(assert (=> d!119263 (validMask!0 mask!3464)))

(assert (=> d!119263 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443971 mask!3464) lt!443971 lt!443969 mask!3464) lt!444046)))

(assert (= (and d!119263 c!101390) b!1004497))

(assert (= (and d!119263 (not c!101390)) b!1004499))

(assert (= (and b!1004499 c!101392) b!1004500))

(assert (= (and b!1004499 (not c!101392)) b!1004505))

(assert (= (and d!119263 c!101391) b!1004504))

(assert (= (and d!119263 (not c!101391)) b!1004498))

(assert (= (and b!1004498 res!674016) b!1004503))

(assert (= (and b!1004503 (not res!674014)) b!1004502))

(assert (= (and b!1004502 (not res!674015)) b!1004501))

(assert (=> b!1004505 m!929299))

(declare-fun m!929469 () Bool)

(assert (=> b!1004505 m!929469))

(assert (=> b!1004505 m!929469))

(declare-fun m!929471 () Bool)

(assert (=> b!1004505 m!929471))

(declare-fun m!929473 () Bool)

(assert (=> b!1004503 m!929473))

(assert (=> d!119263 m!929299))

(declare-fun m!929475 () Bool)

(assert (=> d!119263 m!929475))

(assert (=> d!119263 m!929315))

(assert (=> b!1004501 m!929473))

(assert (=> b!1004502 m!929473))

(assert (=> b!1004273 d!119263))

(declare-fun d!119265 () Bool)

(declare-fun lt!444048 () (_ BitVec 32))

(declare-fun lt!444047 () (_ BitVec 32))

(assert (=> d!119265 (= lt!444048 (bvmul (bvxor lt!444047 (bvlshr lt!444047 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119265 (= lt!444047 ((_ extract 31 0) (bvand (bvxor lt!443971 (bvlshr lt!443971 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119265 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!673985 (let ((h!22416 ((_ extract 31 0) (bvand (bvxor lt!443971 (bvlshr lt!443971 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87611 (bvmul (bvxor h!22416 (bvlshr h!22416 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87611 (bvlshr x!87611 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!673985 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!673985 #b00000000000000000000000000000000))))))

(assert (=> d!119265 (= (toIndex!0 lt!443971 mask!3464) (bvand (bvxor lt!444048 (bvlshr lt!444048 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1004273 d!119265))

(declare-fun d!119267 () Bool)

(assert (=> d!119267 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1004278 d!119267))

(declare-fun b!1004539 () Bool)

(declare-fun e!565650 () Bool)

(declare-fun call!42295 () Bool)

(assert (=> b!1004539 (= e!565650 call!42295)))

(declare-fun bm!42292 () Bool)

(assert (=> bm!42292 (= call!42295 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun d!119269 () Bool)

(declare-fun res!674031 () Bool)

(declare-fun e!565649 () Bool)

(assert (=> d!119269 (=> res!674031 e!565649)))

(assert (=> d!119269 (= res!674031 (bvsge #b00000000000000000000000000000000 (size!31002 a!3219)))))

(assert (=> d!119269 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!565649)))

(declare-fun b!1004540 () Bool)

(declare-fun e!565651 () Bool)

(assert (=> b!1004540 (= e!565650 e!565651)))

(declare-fun lt!444057 () (_ BitVec 64))

(assert (=> b!1004540 (= lt!444057 (select (arr!30498 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32869 0))(
  ( (Unit!32870) )
))
(declare-fun lt!444058 () Unit!32869)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63346 (_ BitVec 64) (_ BitVec 32)) Unit!32869)

(assert (=> b!1004540 (= lt!444058 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!444057 #b00000000000000000000000000000000))))

(assert (=> b!1004540 (arrayContainsKey!0 a!3219 lt!444057 #b00000000000000000000000000000000)))

(declare-fun lt!444059 () Unit!32869)

(assert (=> b!1004540 (= lt!444059 lt!444058)))

(declare-fun res!674030 () Bool)

(assert (=> b!1004540 (= res!674030 (= (seekEntryOrOpen!0 (select (arr!30498 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9455 #b00000000000000000000000000000000)))))

(assert (=> b!1004540 (=> (not res!674030) (not e!565651))))

(declare-fun b!1004541 () Bool)

(assert (=> b!1004541 (= e!565649 e!565650)))

(declare-fun c!101404 () Bool)

(assert (=> b!1004541 (= c!101404 (validKeyInArray!0 (select (arr!30498 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1004542 () Bool)

(assert (=> b!1004542 (= e!565651 call!42295)))

(assert (= (and d!119269 (not res!674031)) b!1004541))

(assert (= (and b!1004541 c!101404) b!1004540))

(assert (= (and b!1004541 (not c!101404)) b!1004539))

(assert (= (and b!1004540 res!674030) b!1004542))

(assert (= (or b!1004542 b!1004539) bm!42292))

(declare-fun m!929485 () Bool)

(assert (=> bm!42292 m!929485))

(assert (=> b!1004540 m!929443))

(declare-fun m!929487 () Bool)

(assert (=> b!1004540 m!929487))

(declare-fun m!929489 () Bool)

(assert (=> b!1004540 m!929489))

(assert (=> b!1004540 m!929443))

(declare-fun m!929491 () Bool)

(assert (=> b!1004540 m!929491))

(assert (=> b!1004541 m!929443))

(assert (=> b!1004541 m!929443))

(assert (=> b!1004541 m!929461))

(assert (=> b!1004272 d!119269))

(check-sat (not d!119261) (not d!119247) (not bm!42289) (not b!1004436) (not b!1004494) (not b!1004377) (not b!1004481) (not b!1004541) (not b!1004505) (not b!1004414) (not b!1004484) (not bm!42292) (not b!1004485) (not d!119263) (not d!119235) (not b!1004461) (not d!119233) (not b!1004540))
(check-sat)
