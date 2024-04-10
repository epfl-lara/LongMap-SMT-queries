; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32952 () Bool)

(assert start!32952)

(declare-fun res!180892 () Bool)

(declare-fun e!201898 () Bool)

(assert (=> start!32952 (=> (not res!180892) (not e!201898))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32952 (= res!180892 (validMask!0 mask!3777))))

(assert (=> start!32952 e!201898))

(declare-datatypes ((array!16803 0))(
  ( (array!16804 (arr!7950 (Array (_ BitVec 32) (_ BitVec 64))) (size!8302 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16803)

(declare-fun array_inv!5913 (array!16803) Bool)

(assert (=> start!32952 (array_inv!5913 a!3305)))

(assert (=> start!32952 true))

(declare-fun b!328425 () Bool)

(declare-fun res!180900 () Bool)

(assert (=> b!328425 (=> (not res!180900) (not e!201898))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328425 (= res!180900 (and (= (size!8302 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8302 a!3305))))))

(declare-fun b!328426 () Bool)

(declare-fun res!180898 () Bool)

(assert (=> b!328426 (=> (not res!180898) (not e!201898))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328426 (= res!180898 (validKeyInArray!0 k0!2497))))

(declare-fun b!328427 () Bool)

(declare-fun res!180897 () Bool)

(declare-fun e!201897 () Bool)

(assert (=> b!328427 (=> (not res!180897) (not e!201897))))

(declare-datatypes ((SeekEntryResult!3081 0))(
  ( (MissingZero!3081 (index!14500 (_ BitVec 32))) (Found!3081 (index!14501 (_ BitVec 32))) (Intermediate!3081 (undefined!3893 Bool) (index!14502 (_ BitVec 32)) (x!32762 (_ BitVec 32))) (Undefined!3081) (MissingVacant!3081 (index!14503 (_ BitVec 32))) )
))
(declare-fun lt!157911 () SeekEntryResult!3081)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16803 (_ BitVec 32)) SeekEntryResult!3081)

(assert (=> b!328427 (= res!180897 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157911))))

(declare-fun b!328428 () Bool)

(assert (=> b!328428 (= e!201898 e!201897)))

(declare-fun res!180893 () Bool)

(assert (=> b!328428 (=> (not res!180893) (not e!201897))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328428 (= res!180893 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157911))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!328428 (= lt!157911 (Intermediate!3081 false resIndex!58 resX!58))))

(declare-fun b!328429 () Bool)

(declare-fun res!180895 () Bool)

(assert (=> b!328429 (=> (not res!180895) (not e!201898))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16803 (_ BitVec 32)) SeekEntryResult!3081)

(assert (=> b!328429 (= res!180895 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3081 i!1250)))))

(declare-fun b!328430 () Bool)

(declare-fun res!180896 () Bool)

(assert (=> b!328430 (=> (not res!180896) (not e!201897))))

(assert (=> b!328430 (= res!180896 (and (= (select (arr!7950 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8302 a!3305))))))

(declare-fun b!328431 () Bool)

(assert (=> b!328431 (= e!201897 (bvslt (bvsub #b01111111111111111111111111111110 x!1490) #b00000000000000000000000000000000))))

(declare-fun b!328432 () Bool)

(declare-fun res!180894 () Bool)

(assert (=> b!328432 (=> (not res!180894) (not e!201898))))

(declare-fun arrayContainsKey!0 (array!16803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328432 (= res!180894 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328433 () Bool)

(declare-fun res!180899 () Bool)

(assert (=> b!328433 (=> (not res!180899) (not e!201898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16803 (_ BitVec 32)) Bool)

(assert (=> b!328433 (= res!180899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32952 res!180892) b!328425))

(assert (= (and b!328425 res!180900) b!328426))

(assert (= (and b!328426 res!180898) b!328432))

(assert (= (and b!328432 res!180894) b!328429))

(assert (= (and b!328429 res!180895) b!328433))

(assert (= (and b!328433 res!180899) b!328428))

(assert (= (and b!328428 res!180893) b!328430))

(assert (= (and b!328430 res!180896) b!328427))

(assert (= (and b!328427 res!180897) b!328431))

(declare-fun m!334405 () Bool)

(assert (=> b!328429 m!334405))

(declare-fun m!334407 () Bool)

(assert (=> b!328427 m!334407))

(declare-fun m!334409 () Bool)

(assert (=> b!328430 m!334409))

(declare-fun m!334411 () Bool)

(assert (=> b!328428 m!334411))

(assert (=> b!328428 m!334411))

(declare-fun m!334413 () Bool)

(assert (=> b!328428 m!334413))

(declare-fun m!334415 () Bool)

(assert (=> b!328432 m!334415))

(declare-fun m!334417 () Bool)

(assert (=> b!328426 m!334417))

(declare-fun m!334419 () Bool)

(assert (=> start!32952 m!334419))

(declare-fun m!334421 () Bool)

(assert (=> start!32952 m!334421))

(declare-fun m!334423 () Bool)

(assert (=> b!328433 m!334423))

(check-sat (not b!328426) (not b!328432) (not b!328429) (not start!32952) (not b!328433) (not b!328427) (not b!328428))
(check-sat)
(get-model)

(declare-fun d!70031 () Bool)

(assert (=> d!70031 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32952 d!70031))

(declare-fun d!70037 () Bool)

(assert (=> d!70037 (= (array_inv!5913 a!3305) (bvsge (size!8302 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32952 d!70037))

(declare-fun d!70039 () Bool)

(assert (=> d!70039 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!328426 d!70039))

(declare-fun d!70041 () Bool)

(declare-fun res!180932 () Bool)

(declare-fun e!201912 () Bool)

(assert (=> d!70041 (=> res!180932 e!201912)))

(assert (=> d!70041 (= res!180932 (= (select (arr!7950 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!70041 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!201912)))

(declare-fun b!328465 () Bool)

(declare-fun e!201913 () Bool)

(assert (=> b!328465 (= e!201912 e!201913)))

(declare-fun res!180933 () Bool)

(assert (=> b!328465 (=> (not res!180933) (not e!201913))))

(assert (=> b!328465 (= res!180933 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8302 a!3305)))))

(declare-fun b!328466 () Bool)

(assert (=> b!328466 (= e!201913 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70041 (not res!180932)) b!328465))

(assert (= (and b!328465 res!180933) b!328466))

(declare-fun m!334445 () Bool)

(assert (=> d!70041 m!334445))

(declare-fun m!334447 () Bool)

(assert (=> b!328466 m!334447))

(assert (=> b!328432 d!70041))

(declare-fun d!70047 () Bool)

(declare-fun e!201948 () Bool)

(assert (=> d!70047 e!201948))

(declare-fun c!51424 () Bool)

(declare-fun lt!157937 () SeekEntryResult!3081)

(get-info :version)

(assert (=> d!70047 (= c!51424 (and ((_ is Intermediate!3081) lt!157937) (undefined!3893 lt!157937)))))

(declare-fun e!201947 () SeekEntryResult!3081)

(assert (=> d!70047 (= lt!157937 e!201947)))

(declare-fun c!51422 () Bool)

(assert (=> d!70047 (= c!51422 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157936 () (_ BitVec 64))

(assert (=> d!70047 (= lt!157936 (select (arr!7950 a!3305) index!1840))))

(assert (=> d!70047 (validMask!0 mask!3777)))

(assert (=> d!70047 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157937)))

(declare-fun b!328523 () Bool)

(assert (=> b!328523 (= e!201948 (bvsge (x!32762 lt!157937) #b01111111111111111111111111111110))))

(declare-fun b!328524 () Bool)

(assert (=> b!328524 (and (bvsge (index!14502 lt!157937) #b00000000000000000000000000000000) (bvslt (index!14502 lt!157937) (size!8302 a!3305)))))

(declare-fun res!180953 () Bool)

(assert (=> b!328524 (= res!180953 (= (select (arr!7950 a!3305) (index!14502 lt!157937)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201951 () Bool)

(assert (=> b!328524 (=> res!180953 e!201951)))

(declare-fun b!328525 () Bool)

(declare-fun e!201949 () SeekEntryResult!3081)

(assert (=> b!328525 (= e!201947 e!201949)))

(declare-fun c!51423 () Bool)

(assert (=> b!328525 (= c!51423 (or (= lt!157936 k0!2497) (= (bvadd lt!157936 lt!157936) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!328526 () Bool)

(assert (=> b!328526 (= e!201947 (Intermediate!3081 true index!1840 x!1490))))

(declare-fun b!328527 () Bool)

(assert (=> b!328527 (= e!201949 (Intermediate!3081 false index!1840 x!1490))))

(declare-fun b!328528 () Bool)

(assert (=> b!328528 (and (bvsge (index!14502 lt!157937) #b00000000000000000000000000000000) (bvslt (index!14502 lt!157937) (size!8302 a!3305)))))

(declare-fun res!180952 () Bool)

(assert (=> b!328528 (= res!180952 (= (select (arr!7950 a!3305) (index!14502 lt!157937)) k0!2497))))

(assert (=> b!328528 (=> res!180952 e!201951)))

(declare-fun e!201950 () Bool)

(assert (=> b!328528 (= e!201950 e!201951)))

(declare-fun b!328529 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328529 (= e!201949 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!328530 () Bool)

(assert (=> b!328530 (and (bvsge (index!14502 lt!157937) #b00000000000000000000000000000000) (bvslt (index!14502 lt!157937) (size!8302 a!3305)))))

(assert (=> b!328530 (= e!201951 (= (select (arr!7950 a!3305) (index!14502 lt!157937)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328531 () Bool)

(assert (=> b!328531 (= e!201948 e!201950)))

(declare-fun res!180954 () Bool)

(assert (=> b!328531 (= res!180954 (and ((_ is Intermediate!3081) lt!157937) (not (undefined!3893 lt!157937)) (bvslt (x!32762 lt!157937) #b01111111111111111111111111111110) (bvsge (x!32762 lt!157937) #b00000000000000000000000000000000) (bvsge (x!32762 lt!157937) x!1490)))))

(assert (=> b!328531 (=> (not res!180954) (not e!201950))))

(assert (= (and d!70047 c!51422) b!328526))

(assert (= (and d!70047 (not c!51422)) b!328525))

(assert (= (and b!328525 c!51423) b!328527))

(assert (= (and b!328525 (not c!51423)) b!328529))

(assert (= (and d!70047 c!51424) b!328523))

(assert (= (and d!70047 (not c!51424)) b!328531))

(assert (= (and b!328531 res!180954) b!328528))

(assert (= (and b!328528 (not res!180952)) b!328524))

(assert (= (and b!328524 (not res!180953)) b!328530))

(declare-fun m!334461 () Bool)

(assert (=> b!328528 m!334461))

(declare-fun m!334463 () Bool)

(assert (=> b!328529 m!334463))

(assert (=> b!328529 m!334463))

(declare-fun m!334469 () Bool)

(assert (=> b!328529 m!334469))

(assert (=> b!328524 m!334461))

(assert (=> b!328530 m!334461))

(declare-fun m!334473 () Bool)

(assert (=> d!70047 m!334473))

(assert (=> d!70047 m!334419))

(assert (=> b!328427 d!70047))

(declare-fun d!70051 () Bool)

(declare-fun res!180975 () Bool)

(declare-fun e!201981 () Bool)

(assert (=> d!70051 (=> res!180975 e!201981)))

(assert (=> d!70051 (= res!180975 (bvsge #b00000000000000000000000000000000 (size!8302 a!3305)))))

(assert (=> d!70051 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201981)))

(declare-fun b!328577 () Bool)

(declare-fun e!201979 () Bool)

(declare-fun call!26131 () Bool)

(assert (=> b!328577 (= e!201979 call!26131)))

(declare-fun b!328578 () Bool)

(assert (=> b!328578 (= e!201981 e!201979)))

(declare-fun c!51438 () Bool)

(assert (=> b!328578 (= c!51438 (validKeyInArray!0 (select (arr!7950 a!3305) #b00000000000000000000000000000000)))))

(declare-fun bm!26128 () Bool)

(assert (=> bm!26128 (= call!26131 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!328579 () Bool)

(declare-fun e!201980 () Bool)

(assert (=> b!328579 (= e!201979 e!201980)))

(declare-fun lt!157958 () (_ BitVec 64))

(assert (=> b!328579 (= lt!157958 (select (arr!7950 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10196 0))(
  ( (Unit!10197) )
))
(declare-fun lt!157956 () Unit!10196)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16803 (_ BitVec 64) (_ BitVec 32)) Unit!10196)

(assert (=> b!328579 (= lt!157956 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157958 #b00000000000000000000000000000000))))

(assert (=> b!328579 (arrayContainsKey!0 a!3305 lt!157958 #b00000000000000000000000000000000)))

(declare-fun lt!157957 () Unit!10196)

(assert (=> b!328579 (= lt!157957 lt!157956)))

(declare-fun res!180976 () Bool)

(assert (=> b!328579 (= res!180976 (= (seekEntryOrOpen!0 (select (arr!7950 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3081 #b00000000000000000000000000000000)))))

(assert (=> b!328579 (=> (not res!180976) (not e!201980))))

(declare-fun b!328580 () Bool)

(assert (=> b!328580 (= e!201980 call!26131)))

(assert (= (and d!70051 (not res!180975)) b!328578))

(assert (= (and b!328578 c!51438) b!328579))

(assert (= (and b!328578 (not c!51438)) b!328577))

(assert (= (and b!328579 res!180976) b!328580))

(assert (= (or b!328580 b!328577) bm!26128))

(assert (=> b!328578 m!334445))

(assert (=> b!328578 m!334445))

(declare-fun m!334493 () Bool)

(assert (=> b!328578 m!334493))

(declare-fun m!334495 () Bool)

(assert (=> bm!26128 m!334495))

(assert (=> b!328579 m!334445))

(declare-fun m!334497 () Bool)

(assert (=> b!328579 m!334497))

(declare-fun m!334499 () Bool)

(assert (=> b!328579 m!334499))

(assert (=> b!328579 m!334445))

(declare-fun m!334501 () Bool)

(assert (=> b!328579 m!334501))

(assert (=> b!328433 d!70051))

(declare-fun d!70061 () Bool)

(declare-fun e!201983 () Bool)

(assert (=> d!70061 e!201983))

(declare-fun c!51441 () Bool)

(declare-fun lt!157960 () SeekEntryResult!3081)

(assert (=> d!70061 (= c!51441 (and ((_ is Intermediate!3081) lt!157960) (undefined!3893 lt!157960)))))

(declare-fun e!201982 () SeekEntryResult!3081)

(assert (=> d!70061 (= lt!157960 e!201982)))

(declare-fun c!51439 () Bool)

(assert (=> d!70061 (= c!51439 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157959 () (_ BitVec 64))

(assert (=> d!70061 (= lt!157959 (select (arr!7950 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!70061 (validMask!0 mask!3777)))

(assert (=> d!70061 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157960)))

(declare-fun b!328581 () Bool)

(assert (=> b!328581 (= e!201983 (bvsge (x!32762 lt!157960) #b01111111111111111111111111111110))))

(declare-fun b!328582 () Bool)

(assert (=> b!328582 (and (bvsge (index!14502 lt!157960) #b00000000000000000000000000000000) (bvslt (index!14502 lt!157960) (size!8302 a!3305)))))

(declare-fun res!180978 () Bool)

(assert (=> b!328582 (= res!180978 (= (select (arr!7950 a!3305) (index!14502 lt!157960)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201986 () Bool)

(assert (=> b!328582 (=> res!180978 e!201986)))

(declare-fun b!328583 () Bool)

(declare-fun e!201984 () SeekEntryResult!3081)

(assert (=> b!328583 (= e!201982 e!201984)))

(declare-fun c!51440 () Bool)

(assert (=> b!328583 (= c!51440 (or (= lt!157959 k0!2497) (= (bvadd lt!157959 lt!157959) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!328584 () Bool)

(assert (=> b!328584 (= e!201982 (Intermediate!3081 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328585 () Bool)

(assert (=> b!328585 (= e!201984 (Intermediate!3081 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328586 () Bool)

(assert (=> b!328586 (and (bvsge (index!14502 lt!157960) #b00000000000000000000000000000000) (bvslt (index!14502 lt!157960) (size!8302 a!3305)))))

(declare-fun res!180977 () Bool)

(assert (=> b!328586 (= res!180977 (= (select (arr!7950 a!3305) (index!14502 lt!157960)) k0!2497))))

(assert (=> b!328586 (=> res!180977 e!201986)))

(declare-fun e!201985 () Bool)

(assert (=> b!328586 (= e!201985 e!201986)))

(declare-fun b!328587 () Bool)

(assert (=> b!328587 (= e!201984 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!328588 () Bool)

(assert (=> b!328588 (and (bvsge (index!14502 lt!157960) #b00000000000000000000000000000000) (bvslt (index!14502 lt!157960) (size!8302 a!3305)))))

(assert (=> b!328588 (= e!201986 (= (select (arr!7950 a!3305) (index!14502 lt!157960)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328589 () Bool)

(assert (=> b!328589 (= e!201983 e!201985)))

(declare-fun res!180979 () Bool)

(assert (=> b!328589 (= res!180979 (and ((_ is Intermediate!3081) lt!157960) (not (undefined!3893 lt!157960)) (bvslt (x!32762 lt!157960) #b01111111111111111111111111111110) (bvsge (x!32762 lt!157960) #b00000000000000000000000000000000) (bvsge (x!32762 lt!157960) #b00000000000000000000000000000000)))))

(assert (=> b!328589 (=> (not res!180979) (not e!201985))))

(assert (= (and d!70061 c!51439) b!328584))

(assert (= (and d!70061 (not c!51439)) b!328583))

(assert (= (and b!328583 c!51440) b!328585))

(assert (= (and b!328583 (not c!51440)) b!328587))

(assert (= (and d!70061 c!51441) b!328581))

(assert (= (and d!70061 (not c!51441)) b!328589))

(assert (= (and b!328589 res!180979) b!328586))

(assert (= (and b!328586 (not res!180977)) b!328582))

(assert (= (and b!328582 (not res!180978)) b!328588))

(declare-fun m!334503 () Bool)

(assert (=> b!328586 m!334503))

(assert (=> b!328587 m!334411))

(declare-fun m!334505 () Bool)

(assert (=> b!328587 m!334505))

(assert (=> b!328587 m!334505))

(declare-fun m!334507 () Bool)

(assert (=> b!328587 m!334507))

(assert (=> b!328582 m!334503))

(assert (=> b!328588 m!334503))

(assert (=> d!70061 m!334411))

(declare-fun m!334509 () Bool)

(assert (=> d!70061 m!334509))

(assert (=> d!70061 m!334419))

(assert (=> b!328428 d!70061))

(declare-fun d!70063 () Bool)

(declare-fun lt!157966 () (_ BitVec 32))

(declare-fun lt!157965 () (_ BitVec 32))

(assert (=> d!70063 (= lt!157966 (bvmul (bvxor lt!157965 (bvlshr lt!157965 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70063 (= lt!157965 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70063 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180980 (let ((h!5410 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32768 (bvmul (bvxor h!5410 (bvlshr h!5410 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32768 (bvlshr x!32768 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180980 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180980 #b00000000000000000000000000000000))))))

(assert (=> d!70063 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157966 (bvlshr lt!157966 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!328428 d!70063))

(declare-fun b!328635 () Bool)

(declare-fun c!51454 () Bool)

(declare-fun lt!157990 () (_ BitVec 64))

(assert (=> b!328635 (= c!51454 (= lt!157990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202019 () SeekEntryResult!3081)

(declare-fun e!202021 () SeekEntryResult!3081)

(assert (=> b!328635 (= e!202019 e!202021)))

(declare-fun b!328636 () Bool)

(declare-fun lt!157992 () SeekEntryResult!3081)

(assert (=> b!328636 (= e!202019 (Found!3081 (index!14502 lt!157992)))))

(declare-fun b!328637 () Bool)

(declare-fun e!202020 () SeekEntryResult!3081)

(assert (=> b!328637 (= e!202020 Undefined!3081)))

(declare-fun b!328639 () Bool)

(assert (=> b!328639 (= e!202020 e!202019)))

(assert (=> b!328639 (= lt!157990 (select (arr!7950 a!3305) (index!14502 lt!157992)))))

(declare-fun c!51456 () Bool)

(assert (=> b!328639 (= c!51456 (= lt!157990 k0!2497))))

(declare-fun b!328640 () Bool)

(assert (=> b!328640 (= e!202021 (MissingZero!3081 (index!14502 lt!157992)))))

(declare-fun d!70069 () Bool)

(declare-fun lt!157991 () SeekEntryResult!3081)

(assert (=> d!70069 (and (or ((_ is Undefined!3081) lt!157991) (not ((_ is Found!3081) lt!157991)) (and (bvsge (index!14501 lt!157991) #b00000000000000000000000000000000) (bvslt (index!14501 lt!157991) (size!8302 a!3305)))) (or ((_ is Undefined!3081) lt!157991) ((_ is Found!3081) lt!157991) (not ((_ is MissingZero!3081) lt!157991)) (and (bvsge (index!14500 lt!157991) #b00000000000000000000000000000000) (bvslt (index!14500 lt!157991) (size!8302 a!3305)))) (or ((_ is Undefined!3081) lt!157991) ((_ is Found!3081) lt!157991) ((_ is MissingZero!3081) lt!157991) (not ((_ is MissingVacant!3081) lt!157991)) (and (bvsge (index!14503 lt!157991) #b00000000000000000000000000000000) (bvslt (index!14503 lt!157991) (size!8302 a!3305)))) (or ((_ is Undefined!3081) lt!157991) (ite ((_ is Found!3081) lt!157991) (= (select (arr!7950 a!3305) (index!14501 lt!157991)) k0!2497) (ite ((_ is MissingZero!3081) lt!157991) (= (select (arr!7950 a!3305) (index!14500 lt!157991)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3081) lt!157991) (= (select (arr!7950 a!3305) (index!14503 lt!157991)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70069 (= lt!157991 e!202020)))

(declare-fun c!51455 () Bool)

(assert (=> d!70069 (= c!51455 (and ((_ is Intermediate!3081) lt!157992) (undefined!3893 lt!157992)))))

(assert (=> d!70069 (= lt!157992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!70069 (validMask!0 mask!3777)))

(assert (=> d!70069 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157991)))

(declare-fun b!328638 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16803 (_ BitVec 32)) SeekEntryResult!3081)

(assert (=> b!328638 (= e!202021 (seekKeyOrZeroReturnVacant!0 (x!32762 lt!157992) (index!14502 lt!157992) (index!14502 lt!157992) k0!2497 a!3305 mask!3777))))

(assert (= (and d!70069 c!51455) b!328637))

(assert (= (and d!70069 (not c!51455)) b!328639))

(assert (= (and b!328639 c!51456) b!328636))

(assert (= (and b!328639 (not c!51456)) b!328635))

(assert (= (and b!328635 c!51454) b!328640))

(assert (= (and b!328635 (not c!51454)) b!328638))

(declare-fun m!334535 () Bool)

(assert (=> b!328639 m!334535))

(declare-fun m!334537 () Bool)

(assert (=> d!70069 m!334537))

(declare-fun m!334539 () Bool)

(assert (=> d!70069 m!334539))

(declare-fun m!334541 () Bool)

(assert (=> d!70069 m!334541))

(assert (=> d!70069 m!334419))

(assert (=> d!70069 m!334411))

(assert (=> d!70069 m!334413))

(assert (=> d!70069 m!334411))

(declare-fun m!334543 () Bool)

(assert (=> b!328638 m!334543))

(assert (=> b!328429 d!70069))

(check-sat (not d!70069) (not b!328578) (not b!328466) (not b!328638) (not b!328587) (not b!328529) (not d!70047) (not d!70061) (not b!328579) (not bm!26128))
(check-sat)
