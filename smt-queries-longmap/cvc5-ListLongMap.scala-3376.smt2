; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46548 () Bool)

(assert start!46548)

(declare-fun b!514303 () Bool)

(declare-fun e!300324 () Bool)

(declare-fun e!300327 () Bool)

(assert (=> b!514303 (= e!300324 (not e!300327))))

(declare-fun res!314235 () Bool)

(assert (=> b!514303 (=> res!314235 e!300327)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32974 0))(
  ( (array!32975 (arr!15858 (Array (_ BitVec 32) (_ BitVec 64))) (size!16222 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32974)

(declare-datatypes ((SeekEntryResult!4325 0))(
  ( (MissingZero!4325 (index!19488 (_ BitVec 32))) (Found!4325 (index!19489 (_ BitVec 32))) (Intermediate!4325 (undefined!5137 Bool) (index!19490 (_ BitVec 32)) (x!48452 (_ BitVec 32))) (Undefined!4325) (MissingVacant!4325 (index!19491 (_ BitVec 32))) )
))
(declare-fun lt!235452 () SeekEntryResult!4325)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!235454 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32974 (_ BitVec 32)) SeekEntryResult!4325)

(assert (=> b!514303 (= res!314235 (= lt!235452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235454 (select (store (arr!15858 a!3235) i!1204 k!2280) j!176) (array!32975 (store (arr!15858 a!3235) i!1204 k!2280) (size!16222 a!3235)) mask!3524)))))

(declare-fun lt!235456 () (_ BitVec 32))

(assert (=> b!514303 (= lt!235452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235456 (select (arr!15858 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514303 (= lt!235454 (toIndex!0 (select (store (arr!15858 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!514303 (= lt!235456 (toIndex!0 (select (arr!15858 a!3235) j!176) mask!3524))))

(declare-fun e!300326 () Bool)

(assert (=> b!514303 e!300326))

(declare-fun res!314242 () Bool)

(assert (=> b!514303 (=> (not res!314242) (not e!300326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32974 (_ BitVec 32)) Bool)

(assert (=> b!514303 (= res!314242 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15908 0))(
  ( (Unit!15909) )
))
(declare-fun lt!235453 () Unit!15908)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32974 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15908)

(assert (=> b!514303 (= lt!235453 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!514304 () Bool)

(declare-fun res!314241 () Bool)

(assert (=> b!514304 (=> res!314241 e!300327)))

(assert (=> b!514304 (= res!314241 (or (undefined!5137 lt!235452) (not (is-Intermediate!4325 lt!235452))))))

(declare-fun b!514305 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32974 (_ BitVec 32)) SeekEntryResult!4325)

(assert (=> b!514305 (= e!300326 (= (seekEntryOrOpen!0 (select (arr!15858 a!3235) j!176) a!3235 mask!3524) (Found!4325 j!176)))))

(declare-fun b!514306 () Bool)

(declare-fun res!314234 () Bool)

(assert (=> b!514306 (=> (not res!314234) (not e!300324))))

(assert (=> b!514306 (= res!314234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!514307 () Bool)

(declare-fun e!300323 () Bool)

(assert (=> b!514307 (= e!300323 e!300324)))

(declare-fun res!314243 () Bool)

(assert (=> b!514307 (=> (not res!314243) (not e!300324))))

(declare-fun lt!235455 () SeekEntryResult!4325)

(assert (=> b!514307 (= res!314243 (or (= lt!235455 (MissingZero!4325 i!1204)) (= lt!235455 (MissingVacant!4325 i!1204))))))

(assert (=> b!514307 (= lt!235455 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!514308 () Bool)

(declare-fun res!314238 () Bool)

(assert (=> b!514308 (=> (not res!314238) (not e!300323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!514308 (= res!314238 (validKeyInArray!0 (select (arr!15858 a!3235) j!176)))))

(declare-fun b!514309 () Bool)

(declare-fun res!314237 () Bool)

(assert (=> b!514309 (=> (not res!314237) (not e!300324))))

(declare-datatypes ((List!10016 0))(
  ( (Nil!10013) (Cons!10012 (h!10904 (_ BitVec 64)) (t!16244 List!10016)) )
))
(declare-fun arrayNoDuplicates!0 (array!32974 (_ BitVec 32) List!10016) Bool)

(assert (=> b!514309 (= res!314237 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10013))))

(declare-fun b!514310 () Bool)

(declare-fun res!314240 () Bool)

(assert (=> b!514310 (=> (not res!314240) (not e!300323))))

(declare-fun arrayContainsKey!0 (array!32974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!514310 (= res!314240 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!514311 () Bool)

(declare-fun res!314239 () Bool)

(assert (=> b!514311 (=> (not res!314239) (not e!300323))))

(assert (=> b!514311 (= res!314239 (validKeyInArray!0 k!2280))))

(declare-fun res!314233 () Bool)

(assert (=> start!46548 (=> (not res!314233) (not e!300323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46548 (= res!314233 (validMask!0 mask!3524))))

(assert (=> start!46548 e!300323))

(assert (=> start!46548 true))

(declare-fun array_inv!11654 (array!32974) Bool)

(assert (=> start!46548 (array_inv!11654 a!3235)))

(declare-fun b!514312 () Bool)

(assert (=> b!514312 (= e!300327 (or (= (select (arr!15858 a!3235) (index!19490 lt!235452)) (select (arr!15858 a!3235) j!176)) (= (select (arr!15858 a!3235) (index!19490 lt!235452)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15858 a!3235) (index!19490 lt!235452)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!514312 (bvslt (x!48452 lt!235452) #b01111111111111111111111111111110)))

(declare-fun b!514313 () Bool)

(declare-fun res!314236 () Bool)

(assert (=> b!514313 (=> (not res!314236) (not e!300323))))

(assert (=> b!514313 (= res!314236 (and (= (size!16222 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16222 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16222 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46548 res!314233) b!514313))

(assert (= (and b!514313 res!314236) b!514308))

(assert (= (and b!514308 res!314238) b!514311))

(assert (= (and b!514311 res!314239) b!514310))

(assert (= (and b!514310 res!314240) b!514307))

(assert (= (and b!514307 res!314243) b!514306))

(assert (= (and b!514306 res!314234) b!514309))

(assert (= (and b!514309 res!314237) b!514303))

(assert (= (and b!514303 res!314242) b!514305))

(assert (= (and b!514303 (not res!314235)) b!514304))

(assert (= (and b!514304 (not res!314241)) b!514312))

(declare-fun m!495729 () Bool)

(assert (=> b!514303 m!495729))

(declare-fun m!495731 () Bool)

(assert (=> b!514303 m!495731))

(declare-fun m!495733 () Bool)

(assert (=> b!514303 m!495733))

(declare-fun m!495735 () Bool)

(assert (=> b!514303 m!495735))

(declare-fun m!495737 () Bool)

(assert (=> b!514303 m!495737))

(assert (=> b!514303 m!495735))

(declare-fun m!495739 () Bool)

(assert (=> b!514303 m!495739))

(assert (=> b!514303 m!495735))

(declare-fun m!495741 () Bool)

(assert (=> b!514303 m!495741))

(assert (=> b!514303 m!495733))

(declare-fun m!495743 () Bool)

(assert (=> b!514303 m!495743))

(assert (=> b!514303 m!495733))

(declare-fun m!495745 () Bool)

(assert (=> b!514303 m!495745))

(assert (=> b!514308 m!495735))

(assert (=> b!514308 m!495735))

(declare-fun m!495747 () Bool)

(assert (=> b!514308 m!495747))

(assert (=> b!514305 m!495735))

(assert (=> b!514305 m!495735))

(declare-fun m!495749 () Bool)

(assert (=> b!514305 m!495749))

(declare-fun m!495751 () Bool)

(assert (=> b!514311 m!495751))

(declare-fun m!495753 () Bool)

(assert (=> b!514312 m!495753))

(assert (=> b!514312 m!495735))

(declare-fun m!495755 () Bool)

(assert (=> b!514306 m!495755))

(declare-fun m!495757 () Bool)

(assert (=> b!514310 m!495757))

(declare-fun m!495759 () Bool)

(assert (=> b!514309 m!495759))

(declare-fun m!495761 () Bool)

(assert (=> start!46548 m!495761))

(declare-fun m!495763 () Bool)

(assert (=> start!46548 m!495763))

(declare-fun m!495765 () Bool)

(assert (=> b!514307 m!495765))

(push 1)

(assert (not b!514305))

(assert (not b!514306))

(assert (not b!514311))

(assert (not b!514310))

(assert (not b!514307))

(assert (not b!514308))

(assert (not start!46548))

(assert (not b!514303))

(assert (not b!514309))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!514454 () Bool)

(declare-fun e!300407 () SeekEntryResult!4325)

(declare-fun lt!235533 () SeekEntryResult!4325)

(assert (=> b!514454 (= e!300407 (MissingZero!4325 (index!19490 lt!235533)))))

(declare-fun b!514455 () Bool)

(declare-fun e!300405 () SeekEntryResult!4325)

(assert (=> b!514455 (= e!300405 Undefined!4325)))

(declare-fun b!514456 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32974 (_ BitVec 32)) SeekEntryResult!4325)

(assert (=> b!514456 (= e!300407 (seekKeyOrZeroReturnVacant!0 (x!48452 lt!235533) (index!19490 lt!235533) (index!19490 lt!235533) (select (arr!15858 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514458 () Bool)

(declare-fun e!300406 () SeekEntryResult!4325)

(assert (=> b!514458 (= e!300405 e!300406)))

(declare-fun lt!235535 () (_ BitVec 64))

(assert (=> b!514458 (= lt!235535 (select (arr!15858 a!3235) (index!19490 lt!235533)))))

(declare-fun c!60344 () Bool)

(assert (=> b!514458 (= c!60344 (= lt!235535 (select (arr!15858 a!3235) j!176)))))

(declare-fun b!514459 () Bool)

(assert (=> b!514459 (= e!300406 (Found!4325 (index!19490 lt!235533)))))

(declare-fun d!79369 () Bool)

(declare-fun lt!235534 () SeekEntryResult!4325)

(assert (=> d!79369 (and (or (is-Undefined!4325 lt!235534) (not (is-Found!4325 lt!235534)) (and (bvsge (index!19489 lt!235534) #b00000000000000000000000000000000) (bvslt (index!19489 lt!235534) (size!16222 a!3235)))) (or (is-Undefined!4325 lt!235534) (is-Found!4325 lt!235534) (not (is-MissingZero!4325 lt!235534)) (and (bvsge (index!19488 lt!235534) #b00000000000000000000000000000000) (bvslt (index!19488 lt!235534) (size!16222 a!3235)))) (or (is-Undefined!4325 lt!235534) (is-Found!4325 lt!235534) (is-MissingZero!4325 lt!235534) (not (is-MissingVacant!4325 lt!235534)) (and (bvsge (index!19491 lt!235534) #b00000000000000000000000000000000) (bvslt (index!19491 lt!235534) (size!16222 a!3235)))) (or (is-Undefined!4325 lt!235534) (ite (is-Found!4325 lt!235534) (= (select (arr!15858 a!3235) (index!19489 lt!235534)) (select (arr!15858 a!3235) j!176)) (ite (is-MissingZero!4325 lt!235534) (= (select (arr!15858 a!3235) (index!19488 lt!235534)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4325 lt!235534) (= (select (arr!15858 a!3235) (index!19491 lt!235534)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79369 (= lt!235534 e!300405)))

(declare-fun c!60346 () Bool)

(assert (=> d!79369 (= c!60346 (and (is-Intermediate!4325 lt!235533) (undefined!5137 lt!235533)))))

(assert (=> d!79369 (= lt!235533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15858 a!3235) j!176) mask!3524) (select (arr!15858 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79369 (validMask!0 mask!3524)))

(assert (=> d!79369 (= (seekEntryOrOpen!0 (select (arr!15858 a!3235) j!176) a!3235 mask!3524) lt!235534)))

(declare-fun b!514457 () Bool)

(declare-fun c!60345 () Bool)

(assert (=> b!514457 (= c!60345 (= lt!235535 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514457 (= e!300406 e!300407)))

(assert (= (and d!79369 c!60346) b!514455))

(assert (= (and d!79369 (not c!60346)) b!514458))

(assert (= (and b!514458 c!60344) b!514459))

(assert (= (and b!514458 (not c!60344)) b!514457))

(assert (= (and b!514457 c!60345) b!514454))

(assert (= (and b!514457 (not c!60345)) b!514456))

(assert (=> b!514456 m!495735))

(declare-fun m!495871 () Bool)

(assert (=> b!514456 m!495871))

(declare-fun m!495873 () Bool)

(assert (=> b!514458 m!495873))

(assert (=> d!79369 m!495737))

(assert (=> d!79369 m!495735))

(declare-fun m!495875 () Bool)

(assert (=> d!79369 m!495875))

(declare-fun m!495877 () Bool)

(assert (=> d!79369 m!495877))

(assert (=> d!79369 m!495735))

(assert (=> d!79369 m!495737))

(declare-fun m!495879 () Bool)

(assert (=> d!79369 m!495879))

(assert (=> d!79369 m!495761))

(declare-fun m!495881 () Bool)

(assert (=> d!79369 m!495881))

(assert (=> b!514305 d!79369))

(declare-fun d!79383 () Bool)

(declare-fun res!314346 () Bool)

(declare-fun e!300415 () Bool)

(assert (=> d!79383 (=> res!314346 e!300415)))

(assert (=> d!79383 (= res!314346 (= (select (arr!15858 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79383 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!300415)))

(declare-fun b!514468 () Bool)

(declare-fun e!300416 () Bool)

(assert (=> b!514468 (= e!300415 e!300416)))

(declare-fun res!314347 () Bool)

(assert (=> b!514468 (=> (not res!314347) (not e!300416))))

(assert (=> b!514468 (= res!314347 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16222 a!3235)))))

(declare-fun b!514469 () Bool)

(assert (=> b!514469 (= e!300416 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79383 (not res!314346)) b!514468))

(assert (= (and b!514468 res!314347) b!514469))

(declare-fun m!495889 () Bool)

(assert (=> d!79383 m!495889))

(declare-fun m!495891 () Bool)

(assert (=> b!514469 m!495891))

(assert (=> b!514310 d!79383))

(declare-fun d!79387 () Bool)

(assert (=> d!79387 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514311 d!79387))

(declare-fun b!514496 () Bool)

(declare-fun e!300433 () Bool)

(declare-fun call!31607 () Bool)

(assert (=> b!514496 (= e!300433 call!31607)))

(declare-fun b!514497 () Bool)

(declare-fun e!300434 () Bool)

(assert (=> b!514497 (= e!300433 e!300434)))

(declare-fun lt!235560 () (_ BitVec 64))

(assert (=> b!514497 (= lt!235560 (select (arr!15858 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235559 () Unit!15908)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32974 (_ BitVec 64) (_ BitVec 32)) Unit!15908)

(assert (=> b!514497 (= lt!235559 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235560 #b00000000000000000000000000000000))))

(assert (=> b!514497 (arrayContainsKey!0 a!3235 lt!235560 #b00000000000000000000000000000000)))

(declare-fun lt!235561 () Unit!15908)

(assert (=> b!514497 (= lt!235561 lt!235559)))

(declare-fun res!314352 () Bool)

(assert (=> b!514497 (= res!314352 (= (seekEntryOrOpen!0 (select (arr!15858 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4325 #b00000000000000000000000000000000)))))

(assert (=> b!514497 (=> (not res!314352) (not e!300434))))

(declare-fun bm!31604 () Bool)

(assert (=> bm!31604 (= call!31607 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79389 () Bool)

(declare-fun res!314353 () Bool)

(declare-fun e!300432 () Bool)

(assert (=> d!79389 (=> res!314353 e!300432)))

(assert (=> d!79389 (= res!314353 (bvsge #b00000000000000000000000000000000 (size!16222 a!3235)))))

(assert (=> d!79389 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!300432)))

(declare-fun b!514498 () Bool)

(assert (=> b!514498 (= e!300432 e!300433)))

(declare-fun c!60359 () Bool)

(assert (=> b!514498 (= c!60359 (validKeyInArray!0 (select (arr!15858 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514499 () Bool)

(assert (=> b!514499 (= e!300434 call!31607)))

(assert (= (and d!79389 (not res!314353)) b!514498))

(assert (= (and b!514498 c!60359) b!514497))

(assert (= (and b!514498 (not c!60359)) b!514496))

(assert (= (and b!514497 res!314352) b!514499))

(assert (= (or b!514499 b!514496) bm!31604))

(assert (=> b!514497 m!495889))

(declare-fun m!495907 () Bool)

(assert (=> b!514497 m!495907))

(declare-fun m!495909 () Bool)

(assert (=> b!514497 m!495909))

(assert (=> b!514497 m!495889))

(declare-fun m!495911 () Bool)

(assert (=> b!514497 m!495911))

(declare-fun m!495913 () Bool)

(assert (=> bm!31604 m!495913))

(assert (=> b!514498 m!495889))

(assert (=> b!514498 m!495889))

(declare-fun m!495915 () Bool)

(assert (=> b!514498 m!495915))

(assert (=> b!514306 d!79389))

(declare-fun b!514500 () Bool)

(declare-fun e!300437 () SeekEntryResult!4325)

(declare-fun lt!235562 () SeekEntryResult!4325)

(assert (=> b!514500 (= e!300437 (MissingZero!4325 (index!19490 lt!235562)))))

(declare-fun b!514501 () Bool)

(declare-fun e!300435 () SeekEntryResult!4325)

(assert (=> b!514501 (= e!300435 Undefined!4325)))

(declare-fun b!514502 () Bool)

(assert (=> b!514502 (= e!300437 (seekKeyOrZeroReturnVacant!0 (x!48452 lt!235562) (index!19490 lt!235562) (index!19490 lt!235562) k!2280 a!3235 mask!3524))))

(declare-fun b!514504 () Bool)

(declare-fun e!300436 () SeekEntryResult!4325)

(assert (=> b!514504 (= e!300435 e!300436)))

(declare-fun lt!235564 () (_ BitVec 64))

(assert (=> b!514504 (= lt!235564 (select (arr!15858 a!3235) (index!19490 lt!235562)))))

(declare-fun c!60360 () Bool)

(assert (=> b!514504 (= c!60360 (= lt!235564 k!2280))))

(declare-fun b!514505 () Bool)

(assert (=> b!514505 (= e!300436 (Found!4325 (index!19490 lt!235562)))))

(declare-fun d!79397 () Bool)

(declare-fun lt!235563 () SeekEntryResult!4325)

(assert (=> d!79397 (and (or (is-Undefined!4325 lt!235563) (not (is-Found!4325 lt!235563)) (and (bvsge (index!19489 lt!235563) #b00000000000000000000000000000000) (bvslt (index!19489 lt!235563) (size!16222 a!3235)))) (or (is-Undefined!4325 lt!235563) (is-Found!4325 lt!235563) (not (is-MissingZero!4325 lt!235563)) (and (bvsge (index!19488 lt!235563) #b00000000000000000000000000000000) (bvslt (index!19488 lt!235563) (size!16222 a!3235)))) (or (is-Undefined!4325 lt!235563) (is-Found!4325 lt!235563) (is-MissingZero!4325 lt!235563) (not (is-MissingVacant!4325 lt!235563)) (and (bvsge (index!19491 lt!235563) #b00000000000000000000000000000000) (bvslt (index!19491 lt!235563) (size!16222 a!3235)))) (or (is-Undefined!4325 lt!235563) (ite (is-Found!4325 lt!235563) (= (select (arr!15858 a!3235) (index!19489 lt!235563)) k!2280) (ite (is-MissingZero!4325 lt!235563) (= (select (arr!15858 a!3235) (index!19488 lt!235563)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4325 lt!235563) (= (select (arr!15858 a!3235) (index!19491 lt!235563)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79397 (= lt!235563 e!300435)))

(declare-fun c!60362 () Bool)

(assert (=> d!79397 (= c!60362 (and (is-Intermediate!4325 lt!235562) (undefined!5137 lt!235562)))))

(assert (=> d!79397 (= lt!235562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!79397 (validMask!0 mask!3524)))

(assert (=> d!79397 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!235563)))

(declare-fun b!514503 () Bool)

(declare-fun c!60361 () Bool)

(assert (=> b!514503 (= c!60361 (= lt!235564 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514503 (= e!300436 e!300437)))

(assert (= (and d!79397 c!60362) b!514501))

(assert (= (and d!79397 (not c!60362)) b!514504))

(assert (= (and b!514504 c!60360) b!514505))

(assert (= (and b!514504 (not c!60360)) b!514503))

(assert (= (and b!514503 c!60361) b!514500))

(assert (= (and b!514503 (not c!60361)) b!514502))

(declare-fun m!495917 () Bool)

(assert (=> b!514502 m!495917))

(declare-fun m!495919 () Bool)

(assert (=> b!514504 m!495919))

(declare-fun m!495921 () Bool)

(assert (=> d!79397 m!495921))

(declare-fun m!495923 () Bool)

(assert (=> d!79397 m!495923))

(declare-fun m!495925 () Bool)

(assert (=> d!79397 m!495925))

(assert (=> d!79397 m!495921))

(declare-fun m!495927 () Bool)

(assert (=> d!79397 m!495927))

(assert (=> d!79397 m!495761))

(declare-fun m!495929 () Bool)

(assert (=> d!79397 m!495929))

(assert (=> b!514307 d!79397))

(declare-fun d!79399 () Bool)

(assert (=> d!79399 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46548 d!79399))

(declare-fun d!79411 () Bool)

(assert (=> d!79411 (= (array_inv!11654 a!3235) (bvsge (size!16222 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46548 d!79411))

(declare-fun d!79413 () Bool)

(declare-fun lt!235584 () (_ BitVec 32))

(declare-fun lt!235583 () (_ BitVec 32))

(assert (=> d!79413 (= lt!235584 (bvmul (bvxor lt!235583 (bvlshr lt!235583 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79413 (= lt!235583 ((_ extract 31 0) (bvand (bvxor (select (arr!15858 a!3235) j!176) (bvlshr (select (arr!15858 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79413 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314362 (let ((h!10909 ((_ extract 31 0) (bvand (bvxor (select (arr!15858 a!3235) j!176) (bvlshr (select (arr!15858 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48459 (bvmul (bvxor h!10909 (bvlshr h!10909 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48459 (bvlshr x!48459 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314362 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314362 #b00000000000000000000000000000000))))))

(assert (=> d!79413 (= (toIndex!0 (select (arr!15858 a!3235) j!176) mask!3524) (bvand (bvxor lt!235584 (bvlshr lt!235584 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514303 d!79413))

(declare-fun b!514603 () Bool)

(declare-fun e!300502 () SeekEntryResult!4325)

(assert (=> b!514603 (= e!300502 (Intermediate!4325 true lt!235454 #b00000000000000000000000000000000))))

(declare-fun lt!235595 () SeekEntryResult!4325)

(declare-fun b!514604 () Bool)

(assert (=> b!514604 (and (bvsge (index!19490 lt!235595) #b00000000000000000000000000000000) (bvslt (index!19490 lt!235595) (size!16222 (array!32975 (store (arr!15858 a!3235) i!1204 k!2280) (size!16222 a!3235)))))))

(declare-fun res!314391 () Bool)

(assert (=> b!514604 (= res!314391 (= (select (arr!15858 (array!32975 (store (arr!15858 a!3235) i!1204 k!2280) (size!16222 a!3235))) (index!19490 lt!235595)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300498 () Bool)

(assert (=> b!514604 (=> res!314391 e!300498)))

(declare-fun d!79419 () Bool)

(declare-fun e!300501 () Bool)

(assert (=> d!79419 e!300501))

(declare-fun c!60396 () Bool)

(assert (=> d!79419 (= c!60396 (and (is-Intermediate!4325 lt!235595) (undefined!5137 lt!235595)))))

(assert (=> d!79419 (= lt!235595 e!300502)))

(declare-fun c!60395 () Bool)

(assert (=> d!79419 (= c!60395 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235596 () (_ BitVec 64))

(assert (=> d!79419 (= lt!235596 (select (arr!15858 (array!32975 (store (arr!15858 a!3235) i!1204 k!2280) (size!16222 a!3235))) lt!235454))))

(assert (=> d!79419 (validMask!0 mask!3524)))

(assert (=> d!79419 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235454 (select (store (arr!15858 a!3235) i!1204 k!2280) j!176) (array!32975 (store (arr!15858 a!3235) i!1204 k!2280) (size!16222 a!3235)) mask!3524) lt!235595)))

(declare-fun b!514605 () Bool)

(declare-fun e!300500 () SeekEntryResult!4325)

(assert (=> b!514605 (= e!300500 (Intermediate!4325 false lt!235454 #b00000000000000000000000000000000))))

(declare-fun b!514606 () Bool)

(declare-fun e!300499 () Bool)

(assert (=> b!514606 (= e!300501 e!300499)))

(declare-fun res!314392 () Bool)

(assert (=> b!514606 (= res!314392 (and (is-Intermediate!4325 lt!235595) (not (undefined!5137 lt!235595)) (bvslt (x!48452 lt!235595) #b01111111111111111111111111111110) (bvsge (x!48452 lt!235595) #b00000000000000000000000000000000) (bvsge (x!48452 lt!235595) #b00000000000000000000000000000000)))))

(assert (=> b!514606 (=> (not res!314392) (not e!300499))))

(declare-fun b!514607 () Bool)

(assert (=> b!514607 (= e!300501 (bvsge (x!48452 lt!235595) #b01111111111111111111111111111110))))

(declare-fun b!514608 () Bool)

(assert (=> b!514608 (and (bvsge (index!19490 lt!235595) #b00000000000000000000000000000000) (bvslt (index!19490 lt!235595) (size!16222 (array!32975 (store (arr!15858 a!3235) i!1204 k!2280) (size!16222 a!3235)))))))

(assert (=> b!514608 (= e!300498 (= (select (arr!15858 (array!32975 (store (arr!15858 a!3235) i!1204 k!2280) (size!16222 a!3235))) (index!19490 lt!235595)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514609 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514609 (= e!300500 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235454 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15858 a!3235) i!1204 k!2280) j!176) (array!32975 (store (arr!15858 a!3235) i!1204 k!2280) (size!16222 a!3235)) mask!3524))))

(declare-fun b!514610 () Bool)

(assert (=> b!514610 (= e!300502 e!300500)))

(declare-fun c!60394 () Bool)

(assert (=> b!514610 (= c!60394 (or (= lt!235596 (select (store (arr!15858 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!235596 lt!235596) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514611 () Bool)

(assert (=> b!514611 (and (bvsge (index!19490 lt!235595) #b00000000000000000000000000000000) (bvslt (index!19490 lt!235595) (size!16222 (array!32975 (store (arr!15858 a!3235) i!1204 k!2280) (size!16222 a!3235)))))))

(declare-fun res!314390 () Bool)

(assert (=> b!514611 (= res!314390 (= (select (arr!15858 (array!32975 (store (arr!15858 a!3235) i!1204 k!2280) (size!16222 a!3235))) (index!19490 lt!235595)) (select (store (arr!15858 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!514611 (=> res!314390 e!300498)))

(assert (=> b!514611 (= e!300499 e!300498)))

(assert (= (and d!79419 c!60395) b!514603))

(assert (= (and d!79419 (not c!60395)) b!514610))

(assert (= (and b!514610 c!60394) b!514605))

(assert (= (and b!514610 (not c!60394)) b!514609))

(assert (= (and d!79419 c!60396) b!514607))

(assert (= (and d!79419 (not c!60396)) b!514606))

(assert (= (and b!514606 res!314392) b!514611))

(assert (= (and b!514611 (not res!314390)) b!514604))

(assert (= (and b!514604 (not res!314391)) b!514608))

(declare-fun m!495979 () Bool)

(assert (=> b!514609 m!495979))

(assert (=> b!514609 m!495979))

(assert (=> b!514609 m!495733))

(declare-fun m!495981 () Bool)

(assert (=> b!514609 m!495981))

(declare-fun m!495983 () Bool)

(assert (=> b!514608 m!495983))

(assert (=> b!514604 m!495983))

(assert (=> b!514611 m!495983))

(declare-fun m!495985 () Bool)

(assert (=> d!79419 m!495985))

(assert (=> d!79419 m!495761))

(assert (=> b!514303 d!79419))

(declare-fun b!514612 () Bool)

(declare-fun e!300504 () Bool)

(declare-fun call!31612 () Bool)

(assert (=> b!514612 (= e!300504 call!31612)))

(declare-fun b!514613 () Bool)

(declare-fun e!300505 () Bool)

(assert (=> b!514613 (= e!300504 e!300505)))

(declare-fun lt!235598 () (_ BitVec 64))

(assert (=> b!514613 (= lt!235598 (select (arr!15858 a!3235) j!176))))

(declare-fun lt!235597 () Unit!15908)

(assert (=> b!514613 (= lt!235597 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235598 j!176))))

(assert (=> b!514613 (arrayContainsKey!0 a!3235 lt!235598 #b00000000000000000000000000000000)))

(declare-fun lt!235599 () Unit!15908)

(assert (=> b!514613 (= lt!235599 lt!235597)))

(declare-fun res!314393 () Bool)

(assert (=> b!514613 (= res!314393 (= (seekEntryOrOpen!0 (select (arr!15858 a!3235) j!176) a!3235 mask!3524) (Found!4325 j!176)))))

(assert (=> b!514613 (=> (not res!314393) (not e!300505))))

(declare-fun bm!31609 () Bool)

(assert (=> bm!31609 (= call!31612 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79425 () Bool)

(declare-fun res!314394 () Bool)

(declare-fun e!300503 () Bool)

(assert (=> d!79425 (=> res!314394 e!300503)))

(assert (=> d!79425 (= res!314394 (bvsge j!176 (size!16222 a!3235)))))

(assert (=> d!79425 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!300503)))

(declare-fun b!514614 () Bool)

(assert (=> b!514614 (= e!300503 e!300504)))

(declare-fun c!60397 () Bool)

(assert (=> b!514614 (= c!60397 (validKeyInArray!0 (select (arr!15858 a!3235) j!176)))))

(declare-fun b!514615 () Bool)

(assert (=> b!514615 (= e!300505 call!31612)))

(assert (= (and d!79425 (not res!314394)) b!514614))

(assert (= (and b!514614 c!60397) b!514613))

(assert (= (and b!514614 (not c!60397)) b!514612))

(assert (= (and b!514613 res!314393) b!514615))

(assert (= (or b!514615 b!514612) bm!31609))

(assert (=> b!514613 m!495735))

(declare-fun m!495987 () Bool)

(assert (=> b!514613 m!495987))

(declare-fun m!495989 () Bool)

(assert (=> b!514613 m!495989))

(assert (=> b!514613 m!495735))

(assert (=> b!514613 m!495749))

(declare-fun m!495991 () Bool)

(assert (=> bm!31609 m!495991))

(assert (=> b!514614 m!495735))

(assert (=> b!514614 m!495735))

(assert (=> b!514614 m!495747))

(assert (=> b!514303 d!79425))

(declare-fun b!514622 () Bool)

(declare-fun e!300513 () SeekEntryResult!4325)

(assert (=> b!514622 (= e!300513 (Intermediate!4325 true lt!235456 #b00000000000000000000000000000000))))

(declare-fun b!514623 () Bool)

(declare-fun lt!235603 () SeekEntryResult!4325)

(assert (=> b!514623 (and (bvsge (index!19490 lt!235603) #b00000000000000000000000000000000) (bvslt (index!19490 lt!235603) (size!16222 a!3235)))))

(declare-fun res!314396 () Bool)

(assert (=> b!514623 (= res!314396 (= (select (arr!15858 a!3235) (index!19490 lt!235603)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300509 () Bool)

(assert (=> b!514623 (=> res!314396 e!300509)))

(declare-fun d!79427 () Bool)

(declare-fun e!300512 () Bool)

(assert (=> d!79427 e!300512))

(declare-fun c!60403 () Bool)

(assert (=> d!79427 (= c!60403 (and (is-Intermediate!4325 lt!235603) (undefined!5137 lt!235603)))))

(assert (=> d!79427 (= lt!235603 e!300513)))

(declare-fun c!60402 () Bool)

(assert (=> d!79427 (= c!60402 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235604 () (_ BitVec 64))

(assert (=> d!79427 (= lt!235604 (select (arr!15858 a!3235) lt!235456))))

(assert (=> d!79427 (validMask!0 mask!3524)))

(assert (=> d!79427 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235456 (select (arr!15858 a!3235) j!176) a!3235 mask!3524) lt!235603)))

(declare-fun b!514624 () Bool)

(declare-fun e!300511 () SeekEntryResult!4325)

(assert (=> b!514624 (= e!300511 (Intermediate!4325 false lt!235456 #b00000000000000000000000000000000))))

(declare-fun b!514625 () Bool)

(declare-fun e!300510 () Bool)

(assert (=> b!514625 (= e!300512 e!300510)))

(declare-fun res!314397 () Bool)

(assert (=> b!514625 (= res!314397 (and (is-Intermediate!4325 lt!235603) (not (undefined!5137 lt!235603)) (bvslt (x!48452 lt!235603) #b01111111111111111111111111111110) (bvsge (x!48452 lt!235603) #b00000000000000000000000000000000) (bvsge (x!48452 lt!235603) #b00000000000000000000000000000000)))))

(assert (=> b!514625 (=> (not res!314397) (not e!300510))))

(declare-fun b!514626 () Bool)

(assert (=> b!514626 (= e!300512 (bvsge (x!48452 lt!235603) #b01111111111111111111111111111110))))

(declare-fun b!514627 () Bool)

(assert (=> b!514627 (and (bvsge (index!19490 lt!235603) #b00000000000000000000000000000000) (bvslt (index!19490 lt!235603) (size!16222 a!3235)))))

(assert (=> b!514627 (= e!300509 (= (select (arr!15858 a!3235) (index!19490 lt!235603)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514628 () Bool)

(assert (=> b!514628 (= e!300511 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235456 #b00000000000000000000000000000000 mask!3524) (select (arr!15858 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514629 () Bool)

(assert (=> b!514629 (= e!300513 e!300511)))

(declare-fun c!60401 () Bool)

(assert (=> b!514629 (= c!60401 (or (= lt!235604 (select (arr!15858 a!3235) j!176)) (= (bvadd lt!235604 lt!235604) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514630 () Bool)

(assert (=> b!514630 (and (bvsge (index!19490 lt!235603) #b00000000000000000000000000000000) (bvslt (index!19490 lt!235603) (size!16222 a!3235)))))

(declare-fun res!314395 () Bool)

(assert (=> b!514630 (= res!314395 (= (select (arr!15858 a!3235) (index!19490 lt!235603)) (select (arr!15858 a!3235) j!176)))))

(assert (=> b!514630 (=> res!314395 e!300509)))

(assert (=> b!514630 (= e!300510 e!300509)))

(assert (= (and d!79427 c!60402) b!514622))

(assert (= (and d!79427 (not c!60402)) b!514629))

(assert (= (and b!514629 c!60401) b!514624))

(assert (= (and b!514629 (not c!60401)) b!514628))

(assert (= (and d!79427 c!60403) b!514626))

(assert (= (and d!79427 (not c!60403)) b!514625))

(assert (= (and b!514625 res!314397) b!514630))

(assert (= (and b!514630 (not res!314395)) b!514623))

(assert (= (and b!514623 (not res!314396)) b!514627))

(declare-fun m!496005 () Bool)

(assert (=> b!514628 m!496005))

(assert (=> b!514628 m!496005))

(assert (=> b!514628 m!495735))

(declare-fun m!496007 () Bool)

(assert (=> b!514628 m!496007))

(declare-fun m!496009 () Bool)

(assert (=> b!514627 m!496009))

(assert (=> b!514623 m!496009))

(assert (=> b!514630 m!496009))

(declare-fun m!496011 () Bool)

(assert (=> d!79427 m!496011))

(assert (=> d!79427 m!495761))

(assert (=> b!514303 d!79427))

(declare-fun d!79431 () Bool)

(assert (=> d!79431 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235607 () Unit!15908)

(declare-fun choose!38 (array!32974 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15908)

(assert (=> d!79431 (= lt!235607 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79431 (validMask!0 mask!3524)))

(assert (=> d!79431 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235607)))

(declare-fun bs!16269 () Bool)

(assert (= bs!16269 d!79431))

(assert (=> bs!16269 m!495739))

(declare-fun m!496013 () Bool)

(assert (=> bs!16269 m!496013))

(assert (=> bs!16269 m!495761))

(assert (=> b!514303 d!79431))

(declare-fun d!79433 () Bool)

(declare-fun lt!235609 () (_ BitVec 32))

(declare-fun lt!235608 () (_ BitVec 32))

(assert (=> d!79433 (= lt!235609 (bvmul (bvxor lt!235608 (bvlshr lt!235608 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79433 (= lt!235608 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15858 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15858 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79433 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314362 (let ((h!10909 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15858 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15858 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48459 (bvmul (bvxor h!10909 (bvlshr h!10909 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48459 (bvlshr x!48459 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314362 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314362 #b00000000000000000000000000000000))))))

(assert (=> d!79433 (= (toIndex!0 (select (store (arr!15858 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!235609 (bvlshr lt!235609 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514303 d!79433))

(declare-fun d!79435 () Bool)

(assert (=> d!79435 (= (validKeyInArray!0 (select (arr!15858 a!3235) j!176)) (and (not (= (select (arr!15858 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15858 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514308 d!79435))

