; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33284 () Bool)

(assert start!33284)

(declare-fun b!330859 () Bool)

(declare-fun res!182410 () Bool)

(declare-fun e!202985 () Bool)

(assert (=> b!330859 (=> (not res!182410) (not e!202985))))

(declare-datatypes ((array!16896 0))(
  ( (array!16897 (arr!7989 (Array (_ BitVec 32) (_ BitVec 64))) (size!8342 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16896)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!330859 (= res!182410 (and (= (size!8342 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8342 a!3305))))))

(declare-fun b!330860 () Bool)

(declare-fun res!182415 () Bool)

(assert (=> b!330860 (=> (not res!182415) (not e!202985))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3119 0))(
  ( (MissingZero!3119 (index!14652 (_ BitVec 32))) (Found!3119 (index!14653 (_ BitVec 32))) (Intermediate!3119 (undefined!3931 Bool) (index!14654 (_ BitVec 32)) (x!32954 (_ BitVec 32))) (Undefined!3119) (MissingVacant!3119 (index!14655 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16896 (_ BitVec 32)) SeekEntryResult!3119)

(assert (=> b!330860 (= res!182415 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3119 i!1250)))))

(declare-fun b!330861 () Bool)

(declare-fun res!182407 () Bool)

(assert (=> b!330861 (=> (not res!182407) (not e!202985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330861 (= res!182407 (validKeyInArray!0 k0!2497))))

(declare-fun b!330862 () Bool)

(declare-fun e!202984 () Bool)

(declare-fun e!202982 () Bool)

(assert (=> b!330862 (= e!202984 e!202982)))

(declare-fun res!182412 () Bool)

(assert (=> b!330862 (=> (not res!182412) (not e!202982))))

(declare-fun lt!158487 () SeekEntryResult!3119)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun lt!158488 () SeekEntryResult!3119)

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!330862 (= res!182412 (and (= lt!158488 lt!158487) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7989 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16896 (_ BitVec 32)) SeekEntryResult!3119)

(assert (=> b!330862 (= lt!158488 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(declare-fun res!182411 () Bool)

(assert (=> start!33284 (=> (not res!182411) (not e!202985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33284 (= res!182411 (validMask!0 mask!3777))))

(assert (=> start!33284 e!202985))

(declare-fun array_inv!5961 (array!16896) Bool)

(assert (=> start!33284 (array_inv!5961 a!3305)))

(assert (=> start!33284 true))

(declare-fun b!330863 () Bool)

(assert (=> b!330863 (= e!202985 e!202984)))

(declare-fun res!182414 () Bool)

(assert (=> b!330863 (=> (not res!182414) (not e!202984))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330863 (= res!182414 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158487))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!330863 (= lt!158487 (Intermediate!3119 false resIndex!58 resX!58))))

(declare-fun b!330864 () Bool)

(declare-fun res!182409 () Bool)

(assert (=> b!330864 (=> (not res!182409) (not e!202985))))

(declare-fun arrayContainsKey!0 (array!16896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330864 (= res!182409 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330865 () Bool)

(declare-fun res!182408 () Bool)

(assert (=> b!330865 (=> (not res!182408) (not e!202985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16896 (_ BitVec 32)) Bool)

(assert (=> b!330865 (= res!182408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330866 () Bool)

(declare-fun res!182413 () Bool)

(assert (=> b!330866 (=> (not res!182413) (not e!202984))))

(assert (=> b!330866 (= res!182413 (and (= (select (arr!7989 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8342 a!3305))))))

(declare-fun b!330867 () Bool)

(assert (=> b!330867 (= e!202982 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 (array!16897 (store (arr!7989 a!3305) i!1250 k0!2497) (size!8342 a!3305)) mask!3777) lt!158488)))))

(declare-datatypes ((Unit!10299 0))(
  ( (Unit!10300) )
))
(declare-fun lt!158489 () Unit!10299)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16896 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10299)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330867 (= lt!158489 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(assert (= (and start!33284 res!182411) b!330859))

(assert (= (and b!330859 res!182410) b!330861))

(assert (= (and b!330861 res!182407) b!330864))

(assert (= (and b!330864 res!182409) b!330860))

(assert (= (and b!330860 res!182415) b!330865))

(assert (= (and b!330865 res!182408) b!330863))

(assert (= (and b!330863 res!182414) b!330866))

(assert (= (and b!330866 res!182413) b!330862))

(assert (= (and b!330862 res!182412) b!330867))

(declare-fun m!335401 () Bool)

(assert (=> start!33284 m!335401))

(declare-fun m!335403 () Bool)

(assert (=> start!33284 m!335403))

(declare-fun m!335405 () Bool)

(assert (=> b!330864 m!335405))

(declare-fun m!335407 () Bool)

(assert (=> b!330863 m!335407))

(assert (=> b!330863 m!335407))

(declare-fun m!335409 () Bool)

(assert (=> b!330863 m!335409))

(declare-fun m!335411 () Bool)

(assert (=> b!330861 m!335411))

(declare-fun m!335413 () Bool)

(assert (=> b!330860 m!335413))

(declare-fun m!335415 () Bool)

(assert (=> b!330866 m!335415))

(declare-fun m!335417 () Bool)

(assert (=> b!330865 m!335417))

(declare-fun m!335419 () Bool)

(assert (=> b!330862 m!335419))

(declare-fun m!335421 () Bool)

(assert (=> b!330862 m!335421))

(declare-fun m!335423 () Bool)

(assert (=> b!330867 m!335423))

(declare-fun m!335425 () Bool)

(assert (=> b!330867 m!335425))

(declare-fun m!335427 () Bool)

(assert (=> b!330867 m!335427))

(assert (=> b!330867 m!335427))

(declare-fun m!335429 () Bool)

(assert (=> b!330867 m!335429))

(check-sat (not b!330864) (not b!330860) (not b!330862) (not b!330865) (not start!33284) (not b!330863) (not b!330861) (not b!330867))
(check-sat)
(get-model)

(declare-fun b!330940 () Bool)

(declare-fun e!203022 () Bool)

(declare-fun lt!158513 () SeekEntryResult!3119)

(assert (=> b!330940 (= e!203022 (bvsge (x!32954 lt!158513) #b01111111111111111111111111111110))))

(declare-fun b!330942 () Bool)

(declare-fun e!203021 () Bool)

(assert (=> b!330942 (= e!203022 e!203021)))

(declare-fun res!182476 () Bool)

(get-info :version)

(assert (=> b!330942 (= res!182476 (and ((_ is Intermediate!3119) lt!158513) (not (undefined!3931 lt!158513)) (bvslt (x!32954 lt!158513) #b01111111111111111111111111111110) (bvsge (x!32954 lt!158513) #b00000000000000000000000000000000) (bvsge (x!32954 lt!158513) x!1490)))))

(assert (=> b!330942 (=> (not res!182476) (not e!203021))))

(declare-fun b!330943 () Bool)

(declare-fun e!203023 () SeekEntryResult!3119)

(declare-fun e!203024 () SeekEntryResult!3119)

(assert (=> b!330943 (= e!203023 e!203024)))

(declare-fun c!51877 () Bool)

(declare-fun lt!158512 () (_ BitVec 64))

(assert (=> b!330943 (= c!51877 (or (= lt!158512 k0!2497) (= (bvadd lt!158512 lt!158512) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330944 () Bool)

(assert (=> b!330944 (= e!203024 (Intermediate!3119 false index!1840 x!1490))))

(declare-fun b!330945 () Bool)

(assert (=> b!330945 (and (bvsge (index!14654 lt!158513) #b00000000000000000000000000000000) (bvslt (index!14654 lt!158513) (size!8342 (array!16897 (store (arr!7989 a!3305) i!1250 k0!2497) (size!8342 a!3305)))))))

(declare-fun res!182478 () Bool)

(assert (=> b!330945 (= res!182478 (= (select (arr!7989 (array!16897 (store (arr!7989 a!3305) i!1250 k0!2497) (size!8342 a!3305))) (index!14654 lt!158513)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203020 () Bool)

(assert (=> b!330945 (=> res!182478 e!203020)))

(declare-fun b!330946 () Bool)

(assert (=> b!330946 (and (bvsge (index!14654 lt!158513) #b00000000000000000000000000000000) (bvslt (index!14654 lt!158513) (size!8342 (array!16897 (store (arr!7989 a!3305) i!1250 k0!2497) (size!8342 a!3305)))))))

(assert (=> b!330946 (= e!203020 (= (select (arr!7989 (array!16897 (store (arr!7989 a!3305) i!1250 k0!2497) (size!8342 a!3305))) (index!14654 lt!158513)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!330947 () Bool)

(assert (=> b!330947 (and (bvsge (index!14654 lt!158513) #b00000000000000000000000000000000) (bvslt (index!14654 lt!158513) (size!8342 (array!16897 (store (arr!7989 a!3305) i!1250 k0!2497) (size!8342 a!3305)))))))

(declare-fun res!182477 () Bool)

(assert (=> b!330947 (= res!182477 (= (select (arr!7989 (array!16897 (store (arr!7989 a!3305) i!1250 k0!2497) (size!8342 a!3305))) (index!14654 lt!158513)) k0!2497))))

(assert (=> b!330947 (=> res!182477 e!203020)))

(assert (=> b!330947 (= e!203021 e!203020)))

(declare-fun b!330948 () Bool)

(assert (=> b!330948 (= e!203024 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 (array!16897 (store (arr!7989 a!3305) i!1250 k0!2497) (size!8342 a!3305)) mask!3777))))

(declare-fun d!70167 () Bool)

(assert (=> d!70167 e!203022))

(declare-fun c!51878 () Bool)

(assert (=> d!70167 (= c!51878 (and ((_ is Intermediate!3119) lt!158513) (undefined!3931 lt!158513)))))

(assert (=> d!70167 (= lt!158513 e!203023)))

(declare-fun c!51876 () Bool)

(assert (=> d!70167 (= c!51876 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!70167 (= lt!158512 (select (arr!7989 (array!16897 (store (arr!7989 a!3305) i!1250 k0!2497) (size!8342 a!3305))) index!1840))))

(assert (=> d!70167 (validMask!0 mask!3777)))

(assert (=> d!70167 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 (array!16897 (store (arr!7989 a!3305) i!1250 k0!2497) (size!8342 a!3305)) mask!3777) lt!158513)))

(declare-fun b!330941 () Bool)

(assert (=> b!330941 (= e!203023 (Intermediate!3119 true index!1840 x!1490))))

(assert (= (and d!70167 c!51876) b!330941))

(assert (= (and d!70167 (not c!51876)) b!330943))

(assert (= (and b!330943 c!51877) b!330944))

(assert (= (and b!330943 (not c!51877)) b!330948))

(assert (= (and d!70167 c!51878) b!330940))

(assert (= (and d!70167 (not c!51878)) b!330942))

(assert (= (and b!330942 res!182476) b!330947))

(assert (= (and b!330947 (not res!182477)) b!330945))

(assert (= (and b!330945 (not res!182478)) b!330946))

(declare-fun m!335491 () Bool)

(assert (=> b!330947 m!335491))

(assert (=> b!330946 m!335491))

(assert (=> b!330945 m!335491))

(assert (=> b!330948 m!335427))

(assert (=> b!330948 m!335427))

(declare-fun m!335493 () Bool)

(assert (=> b!330948 m!335493))

(declare-fun m!335495 () Bool)

(assert (=> d!70167 m!335495))

(assert (=> d!70167 m!335401))

(assert (=> b!330867 d!70167))

(declare-fun b!331013 () Bool)

(declare-fun e!203067 () Unit!10299)

(declare-fun Unit!10305 () Unit!10299)

(assert (=> b!331013 (= e!203067 Unit!10305)))

(declare-fun b!331014 () Bool)

(declare-fun e!203069 () Unit!10299)

(declare-fun Unit!10306 () Unit!10299)

(assert (=> b!331014 (= e!203069 Unit!10306)))

(declare-fun b!331015 () Bool)

(declare-fun e!203065 () Unit!10299)

(declare-fun Unit!10307 () Unit!10299)

(assert (=> b!331015 (= e!203065 Unit!10307)))

(declare-fun call!26156 () SeekEntryResult!3119)

(assert (=> b!331015 (= call!26156 (Intermediate!3119 false (nextIndex!0 index!1840 x!1490 mask!3777) resX!58))))

(declare-fun lt!158548 () Unit!10299)

(declare-fun Unit!10308 () Unit!10299)

(assert (=> b!331015 (= lt!158548 Unit!10308)))

(assert (=> b!331015 false))

(declare-fun b!331016 () Bool)

(declare-fun e!203070 () Bool)

(assert (=> b!331016 (= e!203070 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 (array!16897 (store (arr!7989 a!3305) i!1250 k0!2497) (size!8342 a!3305)) mask!3777) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun e!203066 () Unit!10299)

(declare-fun call!26155 () (_ BitVec 32))

(declare-fun b!331017 () Bool)

(assert (=> b!331017 (= e!203066 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) call!26155 resIndex!58 resX!58 mask!3777))))

(declare-fun c!51901 () Bool)

(declare-fun b!331018 () Bool)

(assert (=> b!331018 (= c!51901 (or (= (select (arr!7989 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7989 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!331018 (= e!203067 e!203065)))

(declare-fun bm!26152 () Bool)

(declare-fun e!203068 () (_ BitVec 32))

(assert (=> bm!26152 (= call!26156 (seekKeyOrZeroOrLongMinValue!0 (ite c!51901 (bvadd #b00000000000000000000000000000001 x!1490) (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001)) e!203068 k0!2497 a!3305 mask!3777))))

(declare-fun c!51905 () Bool)

(assert (=> bm!26152 (= c!51905 c!51901)))

(declare-fun b!331020 () Bool)

(declare-fun Unit!10309 () Unit!10299)

(assert (=> b!331020 (= e!203065 Unit!10309)))

(declare-fun c!51903 () Bool)

(assert (=> b!331020 (= c!51903 ((_ is Intermediate!3119) call!26156))))

(declare-fun lt!158550 () Unit!10299)

(assert (=> b!331020 (= lt!158550 e!203069)))

(assert (=> b!331020 false))

(declare-fun b!331021 () Bool)

(assert (=> b!331021 false))

(declare-fun Unit!10310 () Unit!10299)

(assert (=> b!331021 (= e!203069 Unit!10310)))

(declare-fun bm!26153 () Bool)

(assert (=> bm!26153 (= call!26155 (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun d!70169 () Bool)

(assert (=> d!70169 e!203070))

(declare-fun res!182499 () Bool)

(assert (=> d!70169 (=> (not res!182499) (not e!203070))))

(assert (=> d!70169 (= res!182499 (and (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8342 a!3305))))))

(declare-fun lt!158546 () Unit!10299)

(assert (=> d!70169 (= lt!158546 e!203066)))

(declare-fun c!51904 () Bool)

(assert (=> d!70169 (= c!51904 (= (bvadd #b00000000000000000000000000000001 x!1490) resX!58))))

(assert (=> d!70169 (validMask!0 mask!3777)))

(assert (=> d!70169 (= (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777) lt!158546)))

(declare-fun b!331019 () Bool)

(assert (=> b!331019 (= e!203068 call!26155)))

(declare-fun b!331022 () Bool)

(declare-fun Unit!10311 () Unit!10299)

(assert (=> b!331022 (= e!203066 Unit!10311)))

(declare-fun c!51902 () Bool)

(assert (=> b!331022 (= c!51902 (not (= resIndex!58 (nextIndex!0 index!1840 x!1490 mask!3777))))))

(declare-fun lt!158547 () Unit!10299)

(assert (=> b!331022 (= lt!158547 e!203067)))

(assert (=> b!331022 (= (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58)))

(declare-fun lt!158549 () Unit!10299)

(declare-fun Unit!10312 () Unit!10299)

(assert (=> b!331022 (= lt!158549 Unit!10312)))

(assert (=> b!331022 (= (select (arr!7989 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!331023 () Bool)

(assert (=> b!331023 (= e!203068 (nextIndex!0 index!1840 x!1490 mask!3777))))

(assert (= (and d!70169 c!51904) b!331022))

(assert (= (and d!70169 (not c!51904)) b!331017))

(assert (= (and b!331022 c!51902) b!331018))

(assert (= (and b!331022 (not c!51902)) b!331013))

(assert (= (and b!331018 c!51901) b!331015))

(assert (= (and b!331018 (not c!51901)) b!331020))

(assert (= (and b!331020 c!51903) b!331014))

(assert (= (and b!331020 (not c!51903)) b!331021))

(assert (= (or b!331015 b!331020) bm!26152))

(assert (= (and bm!26152 c!51905) b!331023))

(assert (= (and bm!26152 (not c!51905)) b!331019))

(assert (= (or b!331019 b!331017) bm!26153))

(assert (= (and d!70169 res!182499) b!331016))

(assert (=> bm!26153 m!335427))

(declare-fun m!335521 () Bool)

(assert (=> bm!26153 m!335521))

(assert (=> d!70169 m!335401))

(assert (=> b!331018 m!335427))

(declare-fun m!335523 () Bool)

(assert (=> b!331018 m!335523))

(assert (=> b!331022 m!335427))

(assert (=> b!331022 m!335523))

(assert (=> b!331016 m!335423))

(assert (=> b!331016 m!335427))

(declare-fun m!335525 () Bool)

(assert (=> b!331016 m!335525))

(assert (=> b!331016 m!335427))

(declare-fun m!335527 () Bool)

(assert (=> b!331016 m!335527))

(declare-fun m!335529 () Bool)

(assert (=> bm!26152 m!335529))

(declare-fun m!335531 () Bool)

(assert (=> b!331017 m!335531))

(assert (=> b!330867 d!70169))

(declare-fun d!70183 () Bool)

(declare-fun lt!158555 () (_ BitVec 32))

(assert (=> d!70183 (and (bvsge lt!158555 #b00000000000000000000000000000000) (bvslt lt!158555 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70183 (= lt!158555 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!70183 (validMask!0 mask!3777)))

(assert (=> d!70183 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!158555)))

(declare-fun bs!11414 () Bool)

(assert (= bs!11414 d!70183))

(declare-fun m!335533 () Bool)

(assert (=> bs!11414 m!335533))

(assert (=> bs!11414 m!335401))

(assert (=> b!330867 d!70183))

(declare-fun d!70185 () Bool)

(assert (=> d!70185 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33284 d!70185))

(declare-fun d!70195 () Bool)

(assert (=> d!70195 (= (array_inv!5961 a!3305) (bvsge (size!8342 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33284 d!70195))

(declare-fun d!70197 () Bool)

(assert (=> d!70197 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!330861 d!70197))

(declare-fun b!331123 () Bool)

(declare-fun e!203126 () SeekEntryResult!3119)

(assert (=> b!331123 (= e!203126 Undefined!3119)))

(declare-fun d!70199 () Bool)

(declare-fun lt!158594 () SeekEntryResult!3119)

(assert (=> d!70199 (and (or ((_ is Undefined!3119) lt!158594) (not ((_ is Found!3119) lt!158594)) (and (bvsge (index!14653 lt!158594) #b00000000000000000000000000000000) (bvslt (index!14653 lt!158594) (size!8342 a!3305)))) (or ((_ is Undefined!3119) lt!158594) ((_ is Found!3119) lt!158594) (not ((_ is MissingZero!3119) lt!158594)) (and (bvsge (index!14652 lt!158594) #b00000000000000000000000000000000) (bvslt (index!14652 lt!158594) (size!8342 a!3305)))) (or ((_ is Undefined!3119) lt!158594) ((_ is Found!3119) lt!158594) ((_ is MissingZero!3119) lt!158594) (not ((_ is MissingVacant!3119) lt!158594)) (and (bvsge (index!14655 lt!158594) #b00000000000000000000000000000000) (bvslt (index!14655 lt!158594) (size!8342 a!3305)))) (or ((_ is Undefined!3119) lt!158594) (ite ((_ is Found!3119) lt!158594) (= (select (arr!7989 a!3305) (index!14653 lt!158594)) k0!2497) (ite ((_ is MissingZero!3119) lt!158594) (= (select (arr!7989 a!3305) (index!14652 lt!158594)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3119) lt!158594) (= (select (arr!7989 a!3305) (index!14655 lt!158594)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70199 (= lt!158594 e!203126)))

(declare-fun c!51947 () Bool)

(declare-fun lt!158596 () SeekEntryResult!3119)

(assert (=> d!70199 (= c!51947 (and ((_ is Intermediate!3119) lt!158596) (undefined!3931 lt!158596)))))

(assert (=> d!70199 (= lt!158596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!70199 (validMask!0 mask!3777)))

(assert (=> d!70199 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!158594)))

(declare-fun b!331124 () Bool)

(declare-fun c!51946 () Bool)

(declare-fun lt!158595 () (_ BitVec 64))

(assert (=> b!331124 (= c!51946 (= lt!158595 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203128 () SeekEntryResult!3119)

(declare-fun e!203127 () SeekEntryResult!3119)

(assert (=> b!331124 (= e!203128 e!203127)))

(declare-fun b!331125 () Bool)

(assert (=> b!331125 (= e!203127 (MissingZero!3119 (index!14654 lt!158596)))))

(declare-fun b!331126 () Bool)

(assert (=> b!331126 (= e!203126 e!203128)))

(assert (=> b!331126 (= lt!158595 (select (arr!7989 a!3305) (index!14654 lt!158596)))))

(declare-fun c!51945 () Bool)

(assert (=> b!331126 (= c!51945 (= lt!158595 k0!2497))))

(declare-fun b!331127 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16896 (_ BitVec 32)) SeekEntryResult!3119)

(assert (=> b!331127 (= e!203127 (seekKeyOrZeroReturnVacant!0 (x!32954 lt!158596) (index!14654 lt!158596) (index!14654 lt!158596) k0!2497 a!3305 mask!3777))))

(declare-fun b!331128 () Bool)

(assert (=> b!331128 (= e!203128 (Found!3119 (index!14654 lt!158596)))))

(assert (= (and d!70199 c!51947) b!331123))

(assert (= (and d!70199 (not c!51947)) b!331126))

(assert (= (and b!331126 c!51945) b!331128))

(assert (= (and b!331126 (not c!51945)) b!331124))

(assert (= (and b!331124 c!51946) b!331125))

(assert (= (and b!331124 (not c!51946)) b!331127))

(assert (=> d!70199 m!335407))

(assert (=> d!70199 m!335407))

(assert (=> d!70199 m!335409))

(declare-fun m!335573 () Bool)

(assert (=> d!70199 m!335573))

(assert (=> d!70199 m!335401))

(declare-fun m!335575 () Bool)

(assert (=> d!70199 m!335575))

(declare-fun m!335577 () Bool)

(assert (=> d!70199 m!335577))

(declare-fun m!335579 () Bool)

(assert (=> b!331126 m!335579))

(declare-fun m!335581 () Bool)

(assert (=> b!331127 m!335581))

(assert (=> b!330860 d!70199))

(declare-fun b!331161 () Bool)

(declare-fun e!203153 () Bool)

(declare-fun e!203151 () Bool)

(assert (=> b!331161 (= e!203153 e!203151)))

(declare-fun lt!158607 () (_ BitVec 64))

(assert (=> b!331161 (= lt!158607 (select (arr!7989 a!3305) #b00000000000000000000000000000000))))

(declare-fun lt!158608 () Unit!10299)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16896 (_ BitVec 64) (_ BitVec 32)) Unit!10299)

(assert (=> b!331161 (= lt!158608 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158607 #b00000000000000000000000000000000))))

(assert (=> b!331161 (arrayContainsKey!0 a!3305 lt!158607 #b00000000000000000000000000000000)))

(declare-fun lt!158609 () Unit!10299)

(assert (=> b!331161 (= lt!158609 lt!158608)))

(declare-fun res!182538 () Bool)

(assert (=> b!331161 (= res!182538 (= (seekEntryOrOpen!0 (select (arr!7989 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3119 #b00000000000000000000000000000000)))))

(assert (=> b!331161 (=> (not res!182538) (not e!203151))))

(declare-fun b!331162 () Bool)

(declare-fun call!26159 () Bool)

(assert (=> b!331162 (= e!203151 call!26159)))

(declare-fun d!70207 () Bool)

(declare-fun res!182539 () Bool)

(declare-fun e!203152 () Bool)

(assert (=> d!70207 (=> res!182539 e!203152)))

(assert (=> d!70207 (= res!182539 (bvsge #b00000000000000000000000000000000 (size!8342 a!3305)))))

(assert (=> d!70207 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!203152)))

(declare-fun bm!26156 () Bool)

(assert (=> bm!26156 (= call!26159 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!331163 () Bool)

(assert (=> b!331163 (= e!203152 e!203153)))

(declare-fun c!51956 () Bool)

(assert (=> b!331163 (= c!51956 (validKeyInArray!0 (select (arr!7989 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!331164 () Bool)

(assert (=> b!331164 (= e!203153 call!26159)))

(assert (= (and d!70207 (not res!182539)) b!331163))

(assert (= (and b!331163 c!51956) b!331161))

(assert (= (and b!331163 (not c!51956)) b!331164))

(assert (= (and b!331161 res!182538) b!331162))

(assert (= (or b!331162 b!331164) bm!26156))

(declare-fun m!335597 () Bool)

(assert (=> b!331161 m!335597))

(declare-fun m!335599 () Bool)

(assert (=> b!331161 m!335599))

(declare-fun m!335601 () Bool)

(assert (=> b!331161 m!335601))

(assert (=> b!331161 m!335597))

(declare-fun m!335603 () Bool)

(assert (=> b!331161 m!335603))

(declare-fun m!335605 () Bool)

(assert (=> bm!26156 m!335605))

(assert (=> b!331163 m!335597))

(assert (=> b!331163 m!335597))

(declare-fun m!335607 () Bool)

(assert (=> b!331163 m!335607))

(assert (=> b!330865 d!70207))

(declare-fun d!70219 () Bool)

(declare-fun res!182544 () Bool)

(declare-fun e!203158 () Bool)

(assert (=> d!70219 (=> res!182544 e!203158)))

(assert (=> d!70219 (= res!182544 (= (select (arr!7989 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!70219 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!203158)))

(declare-fun b!331169 () Bool)

(declare-fun e!203159 () Bool)

(assert (=> b!331169 (= e!203158 e!203159)))

(declare-fun res!182545 () Bool)

(assert (=> b!331169 (=> (not res!182545) (not e!203159))))

(assert (=> b!331169 (= res!182545 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8342 a!3305)))))

(declare-fun b!331170 () Bool)

(assert (=> b!331170 (= e!203159 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70219 (not res!182544)) b!331169))

(assert (= (and b!331169 res!182545) b!331170))

(assert (=> d!70219 m!335597))

(declare-fun m!335609 () Bool)

(assert (=> b!331170 m!335609))

(assert (=> b!330864 d!70219))

(declare-fun b!331171 () Bool)

(declare-fun e!203162 () Bool)

(declare-fun lt!158611 () SeekEntryResult!3119)

(assert (=> b!331171 (= e!203162 (bvsge (x!32954 lt!158611) #b01111111111111111111111111111110))))

(declare-fun b!331173 () Bool)

(declare-fun e!203161 () Bool)

(assert (=> b!331173 (= e!203162 e!203161)))

(declare-fun res!182546 () Bool)

(assert (=> b!331173 (= res!182546 (and ((_ is Intermediate!3119) lt!158611) (not (undefined!3931 lt!158611)) (bvslt (x!32954 lt!158611) #b01111111111111111111111111111110) (bvsge (x!32954 lt!158611) #b00000000000000000000000000000000) (bvsge (x!32954 lt!158611) #b00000000000000000000000000000000)))))

(assert (=> b!331173 (=> (not res!182546) (not e!203161))))

(declare-fun b!331174 () Bool)

(declare-fun e!203163 () SeekEntryResult!3119)

(declare-fun e!203164 () SeekEntryResult!3119)

(assert (=> b!331174 (= e!203163 e!203164)))

(declare-fun c!51958 () Bool)

(declare-fun lt!158610 () (_ BitVec 64))

(assert (=> b!331174 (= c!51958 (or (= lt!158610 k0!2497) (= (bvadd lt!158610 lt!158610) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!331175 () Bool)

(assert (=> b!331175 (= e!203164 (Intermediate!3119 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!331176 () Bool)

(assert (=> b!331176 (and (bvsge (index!14654 lt!158611) #b00000000000000000000000000000000) (bvslt (index!14654 lt!158611) (size!8342 a!3305)))))

(declare-fun res!182548 () Bool)

(assert (=> b!331176 (= res!182548 (= (select (arr!7989 a!3305) (index!14654 lt!158611)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203160 () Bool)

(assert (=> b!331176 (=> res!182548 e!203160)))

(declare-fun b!331177 () Bool)

(assert (=> b!331177 (and (bvsge (index!14654 lt!158611) #b00000000000000000000000000000000) (bvslt (index!14654 lt!158611) (size!8342 a!3305)))))

(assert (=> b!331177 (= e!203160 (= (select (arr!7989 a!3305) (index!14654 lt!158611)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331178 () Bool)

(assert (=> b!331178 (and (bvsge (index!14654 lt!158611) #b00000000000000000000000000000000) (bvslt (index!14654 lt!158611) (size!8342 a!3305)))))

(declare-fun res!182547 () Bool)

(assert (=> b!331178 (= res!182547 (= (select (arr!7989 a!3305) (index!14654 lt!158611)) k0!2497))))

(assert (=> b!331178 (=> res!182547 e!203160)))

(assert (=> b!331178 (= e!203161 e!203160)))

(declare-fun b!331179 () Bool)

(assert (=> b!331179 (= e!203164 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun d!70221 () Bool)

(assert (=> d!70221 e!203162))

(declare-fun c!51959 () Bool)

(assert (=> d!70221 (= c!51959 (and ((_ is Intermediate!3119) lt!158611) (undefined!3931 lt!158611)))))

(assert (=> d!70221 (= lt!158611 e!203163)))

(declare-fun c!51957 () Bool)

(assert (=> d!70221 (= c!51957 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!70221 (= lt!158610 (select (arr!7989 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!70221 (validMask!0 mask!3777)))

(assert (=> d!70221 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158611)))

(declare-fun b!331172 () Bool)

(assert (=> b!331172 (= e!203163 (Intermediate!3119 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(assert (= (and d!70221 c!51957) b!331172))

(assert (= (and d!70221 (not c!51957)) b!331174))

(assert (= (and b!331174 c!51958) b!331175))

(assert (= (and b!331174 (not c!51958)) b!331179))

(assert (= (and d!70221 c!51959) b!331171))

(assert (= (and d!70221 (not c!51959)) b!331173))

(assert (= (and b!331173 res!182546) b!331178))

(assert (= (and b!331178 (not res!182547)) b!331176))

(assert (= (and b!331176 (not res!182548)) b!331177))

(declare-fun m!335611 () Bool)

(assert (=> b!331178 m!335611))

(assert (=> b!331177 m!335611))

(assert (=> b!331176 m!335611))

(assert (=> b!331179 m!335407))

(declare-fun m!335613 () Bool)

(assert (=> b!331179 m!335613))

(assert (=> b!331179 m!335613))

(declare-fun m!335615 () Bool)

(assert (=> b!331179 m!335615))

(assert (=> d!70221 m!335407))

(declare-fun m!335617 () Bool)

(assert (=> d!70221 m!335617))

(assert (=> d!70221 m!335401))

(assert (=> b!330863 d!70221))

(declare-fun d!70223 () Bool)

(declare-fun lt!158617 () (_ BitVec 32))

(declare-fun lt!158616 () (_ BitVec 32))

(assert (=> d!70223 (= lt!158617 (bvmul (bvxor lt!158616 (bvlshr lt!158616 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70223 (= lt!158616 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70223 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!182549 (let ((h!5393 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32963 (bvmul (bvxor h!5393 (bvlshr h!5393 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32963 (bvlshr x!32963 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!182549 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!182549 #b00000000000000000000000000000000))))))

(assert (=> d!70223 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!158617 (bvlshr lt!158617 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!330863 d!70223))

(declare-fun b!331180 () Bool)

(declare-fun e!203167 () Bool)

(declare-fun lt!158619 () SeekEntryResult!3119)

(assert (=> b!331180 (= e!203167 (bvsge (x!32954 lt!158619) #b01111111111111111111111111111110))))

(declare-fun b!331182 () Bool)

(declare-fun e!203166 () Bool)

(assert (=> b!331182 (= e!203167 e!203166)))

(declare-fun res!182550 () Bool)

(assert (=> b!331182 (= res!182550 (and ((_ is Intermediate!3119) lt!158619) (not (undefined!3931 lt!158619)) (bvslt (x!32954 lt!158619) #b01111111111111111111111111111110) (bvsge (x!32954 lt!158619) #b00000000000000000000000000000000) (bvsge (x!32954 lt!158619) x!1490)))))

(assert (=> b!331182 (=> (not res!182550) (not e!203166))))

(declare-fun b!331183 () Bool)

(declare-fun e!203168 () SeekEntryResult!3119)

(declare-fun e!203169 () SeekEntryResult!3119)

(assert (=> b!331183 (= e!203168 e!203169)))

(declare-fun c!51961 () Bool)

(declare-fun lt!158618 () (_ BitVec 64))

(assert (=> b!331183 (= c!51961 (or (= lt!158618 k0!2497) (= (bvadd lt!158618 lt!158618) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!331184 () Bool)

(assert (=> b!331184 (= e!203169 (Intermediate!3119 false index!1840 x!1490))))

(declare-fun b!331185 () Bool)

(assert (=> b!331185 (and (bvsge (index!14654 lt!158619) #b00000000000000000000000000000000) (bvslt (index!14654 lt!158619) (size!8342 a!3305)))))

(declare-fun res!182552 () Bool)

(assert (=> b!331185 (= res!182552 (= (select (arr!7989 a!3305) (index!14654 lt!158619)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203165 () Bool)

(assert (=> b!331185 (=> res!182552 e!203165)))

(declare-fun b!331186 () Bool)

(assert (=> b!331186 (and (bvsge (index!14654 lt!158619) #b00000000000000000000000000000000) (bvslt (index!14654 lt!158619) (size!8342 a!3305)))))

(assert (=> b!331186 (= e!203165 (= (select (arr!7989 a!3305) (index!14654 lt!158619)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331187 () Bool)

(assert (=> b!331187 (and (bvsge (index!14654 lt!158619) #b00000000000000000000000000000000) (bvslt (index!14654 lt!158619) (size!8342 a!3305)))))

(declare-fun res!182551 () Bool)

(assert (=> b!331187 (= res!182551 (= (select (arr!7989 a!3305) (index!14654 lt!158619)) k0!2497))))

(assert (=> b!331187 (=> res!182551 e!203165)))

(assert (=> b!331187 (= e!203166 e!203165)))

(declare-fun b!331188 () Bool)

(assert (=> b!331188 (= e!203169 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun d!70225 () Bool)

(assert (=> d!70225 e!203167))

(declare-fun c!51962 () Bool)

(assert (=> d!70225 (= c!51962 (and ((_ is Intermediate!3119) lt!158619) (undefined!3931 lt!158619)))))

(assert (=> d!70225 (= lt!158619 e!203168)))

(declare-fun c!51960 () Bool)

(assert (=> d!70225 (= c!51960 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!70225 (= lt!158618 (select (arr!7989 a!3305) index!1840))))

(assert (=> d!70225 (validMask!0 mask!3777)))

(assert (=> d!70225 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158619)))

(declare-fun b!331181 () Bool)

(assert (=> b!331181 (= e!203168 (Intermediate!3119 true index!1840 x!1490))))

(assert (= (and d!70225 c!51960) b!331181))

(assert (= (and d!70225 (not c!51960)) b!331183))

(assert (= (and b!331183 c!51961) b!331184))

(assert (= (and b!331183 (not c!51961)) b!331188))

(assert (= (and d!70225 c!51962) b!331180))

(assert (= (and d!70225 (not c!51962)) b!331182))

(assert (= (and b!331182 res!182550) b!331187))

(assert (= (and b!331187 (not res!182551)) b!331185))

(assert (= (and b!331185 (not res!182552)) b!331186))

(declare-fun m!335619 () Bool)

(assert (=> b!331187 m!335619))

(assert (=> b!331186 m!335619))

(assert (=> b!331185 m!335619))

(assert (=> b!331188 m!335427))

(assert (=> b!331188 m!335427))

(declare-fun m!335621 () Bool)

(assert (=> b!331188 m!335621))

(assert (=> d!70225 m!335419))

(assert (=> d!70225 m!335401))

(assert (=> b!330862 d!70225))

(check-sat (not d!70183) (not b!331188) (not d!70199) (not bm!26153) (not d!70169) (not b!331163) (not d!70167) (not b!331127) (not bm!26152) (not d!70225) (not b!331170) (not b!330948) (not b!331017) (not b!331016) (not d!70221) (not b!331161) (not b!331179) (not bm!26156))
(check-sat)
