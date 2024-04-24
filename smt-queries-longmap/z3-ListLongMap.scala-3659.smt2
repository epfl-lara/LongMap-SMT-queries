; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50556 () Bool)

(assert start!50556)

(declare-fun b!552365 () Bool)

(declare-fun e!318749 () Bool)

(declare-fun e!318750 () Bool)

(assert (=> b!552365 (= e!318749 e!318750)))

(declare-fun res!344861 () Bool)

(assert (=> b!552365 (=> (not res!344861) (not e!318750))))

(declare-datatypes ((SeekEntryResult!5107 0))(
  ( (MissingZero!5107 (index!22655 (_ BitVec 32))) (Found!5107 (index!22656 (_ BitVec 32))) (Intermediate!5107 (undefined!5919 Bool) (index!22657 (_ BitVec 32)) (x!51738 (_ BitVec 32))) (Undefined!5107) (MissingVacant!5107 (index!22658 (_ BitVec 32))) )
))
(declare-fun lt!251163 () SeekEntryResult!5107)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552365 (= res!344861 (or (= lt!251163 (MissingZero!5107 i!1132)) (= lt!251163 (MissingVacant!5107 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34785 0))(
  ( (array!34786 (arr!16702 (Array (_ BitVec 32) (_ BitVec 64))) (size!17066 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34785)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34785 (_ BitVec 32)) SeekEntryResult!5107)

(assert (=> b!552365 (= lt!251163 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!552366 () Bool)

(declare-fun res!344856 () Bool)

(assert (=> b!552366 (=> (not res!344856) (not e!318750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34785 (_ BitVec 32)) Bool)

(assert (=> b!552366 (= res!344856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552367 () Bool)

(declare-fun e!318753 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!552367 (= e!318753 (= (seekEntryOrOpen!0 (select (arr!16702 a!3118) j!142) a!3118 mask!3119) (Found!5107 j!142)))))

(declare-fun b!552368 () Bool)

(declare-fun res!344859 () Bool)

(assert (=> b!552368 (=> (not res!344859) (not e!318749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552368 (= res!344859 (validKeyInArray!0 k0!1914))))

(declare-fun b!552369 () Bool)

(declare-fun e!318752 () Bool)

(declare-fun lt!251162 () (_ BitVec 32))

(assert (=> b!552369 (= e!318752 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge lt!251162 #b00000000000000000000000000000000) (bvslt lt!251162 (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(assert (=> b!552369 e!318753))

(declare-fun res!344860 () Bool)

(assert (=> b!552369 (=> (not res!344860) (not e!318753))))

(assert (=> b!552369 (= res!344860 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17059 0))(
  ( (Unit!17060) )
))
(declare-fun lt!251164 () Unit!17059)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34785 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17059)

(assert (=> b!552369 (= lt!251164 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552370 () Bool)

(declare-fun res!344854 () Bool)

(assert (=> b!552370 (=> (not res!344854) (not e!318749))))

(assert (=> b!552370 (= res!344854 (validKeyInArray!0 (select (arr!16702 a!3118) j!142)))))

(declare-fun b!552371 () Bool)

(declare-fun res!344862 () Bool)

(assert (=> b!552371 (=> (not res!344862) (not e!318749))))

(declare-fun arrayContainsKey!0 (array!34785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552371 (= res!344862 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552364 () Bool)

(declare-fun res!344855 () Bool)

(assert (=> b!552364 (=> (not res!344855) (not e!318750))))

(declare-datatypes ((List!10689 0))(
  ( (Nil!10686) (Cons!10685 (h!11670 (_ BitVec 64)) (t!16909 List!10689)) )
))
(declare-fun arrayNoDuplicates!0 (array!34785 (_ BitVec 32) List!10689) Bool)

(assert (=> b!552364 (= res!344855 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10686))))

(declare-fun res!344857 () Bool)

(assert (=> start!50556 (=> (not res!344857) (not e!318749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50556 (= res!344857 (validMask!0 mask!3119))))

(assert (=> start!50556 e!318749))

(assert (=> start!50556 true))

(declare-fun array_inv!12561 (array!34785) Bool)

(assert (=> start!50556 (array_inv!12561 a!3118)))

(declare-fun b!552372 () Bool)

(assert (=> b!552372 (= e!318750 e!318752)))

(declare-fun res!344863 () Bool)

(assert (=> b!552372 (=> (not res!344863) (not e!318752))))

(declare-fun lt!251161 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34785 (_ BitVec 32)) SeekEntryResult!5107)

(assert (=> b!552372 (= res!344863 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251161 (select (arr!16702 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251162 (select (store (arr!16702 a!3118) i!1132 k0!1914) j!142) (array!34786 (store (arr!16702 a!3118) i!1132 k0!1914) (size!17066 a!3118)) mask!3119)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552372 (= lt!251162 (toIndex!0 (select (store (arr!16702 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!552372 (= lt!251161 (toIndex!0 (select (arr!16702 a!3118) j!142) mask!3119))))

(declare-fun b!552373 () Bool)

(declare-fun res!344858 () Bool)

(assert (=> b!552373 (=> (not res!344858) (not e!318749))))

(assert (=> b!552373 (= res!344858 (and (= (size!17066 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17066 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17066 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50556 res!344857) b!552373))

(assert (= (and b!552373 res!344858) b!552370))

(assert (= (and b!552370 res!344854) b!552368))

(assert (= (and b!552368 res!344859) b!552371))

(assert (= (and b!552371 res!344862) b!552365))

(assert (= (and b!552365 res!344861) b!552366))

(assert (= (and b!552366 res!344856) b!552364))

(assert (= (and b!552364 res!344855) b!552372))

(assert (= (and b!552372 res!344863) b!552369))

(assert (= (and b!552369 res!344860) b!552367))

(declare-fun m!529481 () Bool)

(assert (=> b!552372 m!529481))

(declare-fun m!529483 () Bool)

(assert (=> b!552372 m!529483))

(assert (=> b!552372 m!529481))

(declare-fun m!529485 () Bool)

(assert (=> b!552372 m!529485))

(assert (=> b!552372 m!529481))

(declare-fun m!529487 () Bool)

(assert (=> b!552372 m!529487))

(declare-fun m!529489 () Bool)

(assert (=> b!552372 m!529489))

(assert (=> b!552372 m!529485))

(declare-fun m!529491 () Bool)

(assert (=> b!552372 m!529491))

(assert (=> b!552372 m!529485))

(declare-fun m!529493 () Bool)

(assert (=> b!552372 m!529493))

(assert (=> b!552367 m!529481))

(assert (=> b!552367 m!529481))

(declare-fun m!529495 () Bool)

(assert (=> b!552367 m!529495))

(assert (=> b!552370 m!529481))

(assert (=> b!552370 m!529481))

(declare-fun m!529497 () Bool)

(assert (=> b!552370 m!529497))

(declare-fun m!529499 () Bool)

(assert (=> start!50556 m!529499))

(declare-fun m!529501 () Bool)

(assert (=> start!50556 m!529501))

(declare-fun m!529503 () Bool)

(assert (=> b!552364 m!529503))

(declare-fun m!529505 () Bool)

(assert (=> b!552369 m!529505))

(declare-fun m!529507 () Bool)

(assert (=> b!552369 m!529507))

(declare-fun m!529509 () Bool)

(assert (=> b!552365 m!529509))

(declare-fun m!529511 () Bool)

(assert (=> b!552368 m!529511))

(declare-fun m!529513 () Bool)

(assert (=> b!552371 m!529513))

(declare-fun m!529515 () Bool)

(assert (=> b!552366 m!529515))

(check-sat (not b!552365) (not b!552370) (not b!552367) (not b!552369) (not b!552366) (not b!552368) (not b!552372) (not b!552364) (not b!552371) (not start!50556))
(check-sat)
(get-model)

(declare-fun d!83213 () Bool)

(assert (=> d!83213 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!552368 d!83213))

(declare-fun b!552457 () Bool)

(declare-fun e!318803 () Bool)

(declare-fun call!32319 () Bool)

(assert (=> b!552457 (= e!318803 call!32319)))

(declare-fun d!83215 () Bool)

(declare-fun res!344937 () Bool)

(declare-fun e!318802 () Bool)

(assert (=> d!83215 (=> res!344937 e!318802)))

(assert (=> d!83215 (= res!344937 (bvsge j!142 (size!17066 a!3118)))))

(assert (=> d!83215 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!318802)))

(declare-fun b!552458 () Bool)

(declare-fun e!318804 () Bool)

(assert (=> b!552458 (= e!318803 e!318804)))

(declare-fun lt!251197 () (_ BitVec 64))

(assert (=> b!552458 (= lt!251197 (select (arr!16702 a!3118) j!142))))

(declare-fun lt!251195 () Unit!17059)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34785 (_ BitVec 64) (_ BitVec 32)) Unit!17059)

(assert (=> b!552458 (= lt!251195 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!251197 j!142))))

(assert (=> b!552458 (arrayContainsKey!0 a!3118 lt!251197 #b00000000000000000000000000000000)))

(declare-fun lt!251196 () Unit!17059)

(assert (=> b!552458 (= lt!251196 lt!251195)))

(declare-fun res!344938 () Bool)

(assert (=> b!552458 (= res!344938 (= (seekEntryOrOpen!0 (select (arr!16702 a!3118) j!142) a!3118 mask!3119) (Found!5107 j!142)))))

(assert (=> b!552458 (=> (not res!344938) (not e!318804))))

(declare-fun b!552459 () Bool)

(assert (=> b!552459 (= e!318802 e!318803)))

(declare-fun c!64097 () Bool)

(assert (=> b!552459 (= c!64097 (validKeyInArray!0 (select (arr!16702 a!3118) j!142)))))

(declare-fun bm!32316 () Bool)

(assert (=> bm!32316 (= call!32319 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!552460 () Bool)

(assert (=> b!552460 (= e!318804 call!32319)))

(assert (= (and d!83215 (not res!344937)) b!552459))

(assert (= (and b!552459 c!64097) b!552458))

(assert (= (and b!552459 (not c!64097)) b!552457))

(assert (= (and b!552458 res!344938) b!552460))

(assert (= (or b!552460 b!552457) bm!32316))

(assert (=> b!552458 m!529481))

(declare-fun m!529597 () Bool)

(assert (=> b!552458 m!529597))

(declare-fun m!529599 () Bool)

(assert (=> b!552458 m!529599))

(assert (=> b!552458 m!529481))

(assert (=> b!552458 m!529495))

(assert (=> b!552459 m!529481))

(assert (=> b!552459 m!529481))

(assert (=> b!552459 m!529497))

(declare-fun m!529601 () Bool)

(assert (=> bm!32316 m!529601))

(assert (=> b!552369 d!83215))

(declare-fun d!83221 () Bool)

(assert (=> d!83221 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!251209 () Unit!17059)

(declare-fun choose!38 (array!34785 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17059)

(assert (=> d!83221 (= lt!251209 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83221 (validMask!0 mask!3119)))

(assert (=> d!83221 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!251209)))

(declare-fun bs!17216 () Bool)

(assert (= bs!17216 d!83221))

(assert (=> bs!17216 m!529505))

(declare-fun m!529609 () Bool)

(assert (=> bs!17216 m!529609))

(assert (=> bs!17216 m!529499))

(assert (=> b!552369 d!83221))

(declare-fun b!552509 () Bool)

(declare-fun e!318843 () Bool)

(declare-fun lt!251230 () SeekEntryResult!5107)

(assert (=> b!552509 (= e!318843 (bvsge (x!51738 lt!251230) #b01111111111111111111111111111110))))

(declare-fun d!83225 () Bool)

(assert (=> d!83225 e!318843))

(declare-fun c!64110 () Bool)

(get-info :version)

(assert (=> d!83225 (= c!64110 (and ((_ is Intermediate!5107) lt!251230) (undefined!5919 lt!251230)))))

(declare-fun e!318839 () SeekEntryResult!5107)

(assert (=> d!83225 (= lt!251230 e!318839)))

(declare-fun c!64112 () Bool)

(assert (=> d!83225 (= c!64112 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!251229 () (_ BitVec 64))

(assert (=> d!83225 (= lt!251229 (select (arr!16702 a!3118) lt!251161))))

(assert (=> d!83225 (validMask!0 mask!3119)))

(assert (=> d!83225 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251161 (select (arr!16702 a!3118) j!142) a!3118 mask!3119) lt!251230)))

(declare-fun b!552510 () Bool)

(declare-fun e!318842 () SeekEntryResult!5107)

(assert (=> b!552510 (= e!318839 e!318842)))

(declare-fun c!64111 () Bool)

(assert (=> b!552510 (= c!64111 (or (= lt!251229 (select (arr!16702 a!3118) j!142)) (= (bvadd lt!251229 lt!251229) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!552511 () Bool)

(declare-fun e!318841 () Bool)

(assert (=> b!552511 (= e!318843 e!318841)))

(declare-fun res!344963 () Bool)

(assert (=> b!552511 (= res!344963 (and ((_ is Intermediate!5107) lt!251230) (not (undefined!5919 lt!251230)) (bvslt (x!51738 lt!251230) #b01111111111111111111111111111110) (bvsge (x!51738 lt!251230) #b00000000000000000000000000000000) (bvsge (x!51738 lt!251230) #b00000000000000000000000000000000)))))

(assert (=> b!552511 (=> (not res!344963) (not e!318841))))

(declare-fun b!552512 () Bool)

(assert (=> b!552512 (= e!318842 (Intermediate!5107 false lt!251161 #b00000000000000000000000000000000))))

(declare-fun b!552513 () Bool)

(assert (=> b!552513 (and (bvsge (index!22657 lt!251230) #b00000000000000000000000000000000) (bvslt (index!22657 lt!251230) (size!17066 a!3118)))))

(declare-fun res!344965 () Bool)

(assert (=> b!552513 (= res!344965 (= (select (arr!16702 a!3118) (index!22657 lt!251230)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318840 () Bool)

(assert (=> b!552513 (=> res!344965 e!318840)))

(declare-fun b!552514 () Bool)

(assert (=> b!552514 (= e!318839 (Intermediate!5107 true lt!251161 #b00000000000000000000000000000000))))

(declare-fun b!552515 () Bool)

(assert (=> b!552515 (and (bvsge (index!22657 lt!251230) #b00000000000000000000000000000000) (bvslt (index!22657 lt!251230) (size!17066 a!3118)))))

(assert (=> b!552515 (= e!318840 (= (select (arr!16702 a!3118) (index!22657 lt!251230)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!552516 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552516 (= e!318842 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!251161 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!16702 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!552517 () Bool)

(assert (=> b!552517 (and (bvsge (index!22657 lt!251230) #b00000000000000000000000000000000) (bvslt (index!22657 lt!251230) (size!17066 a!3118)))))

(declare-fun res!344964 () Bool)

(assert (=> b!552517 (= res!344964 (= (select (arr!16702 a!3118) (index!22657 lt!251230)) (select (arr!16702 a!3118) j!142)))))

(assert (=> b!552517 (=> res!344964 e!318840)))

(assert (=> b!552517 (= e!318841 e!318840)))

(assert (= (and d!83225 c!64112) b!552514))

(assert (= (and d!83225 (not c!64112)) b!552510))

(assert (= (and b!552510 c!64111) b!552512))

(assert (= (and b!552510 (not c!64111)) b!552516))

(assert (= (and d!83225 c!64110) b!552509))

(assert (= (and d!83225 (not c!64110)) b!552511))

(assert (= (and b!552511 res!344963) b!552517))

(assert (= (and b!552517 (not res!344964)) b!552513))

(assert (= (and b!552513 (not res!344965)) b!552515))

(declare-fun m!529623 () Bool)

(assert (=> b!552517 m!529623))

(declare-fun m!529625 () Bool)

(assert (=> b!552516 m!529625))

(assert (=> b!552516 m!529625))

(assert (=> b!552516 m!529481))

(declare-fun m!529627 () Bool)

(assert (=> b!552516 m!529627))

(assert (=> b!552515 m!529623))

(declare-fun m!529629 () Bool)

(assert (=> d!83225 m!529629))

(assert (=> d!83225 m!529499))

(assert (=> b!552513 m!529623))

(assert (=> b!552372 d!83225))

(declare-fun b!552518 () Bool)

(declare-fun e!318848 () Bool)

(declare-fun lt!251232 () SeekEntryResult!5107)

(assert (=> b!552518 (= e!318848 (bvsge (x!51738 lt!251232) #b01111111111111111111111111111110))))

(declare-fun d!83245 () Bool)

(assert (=> d!83245 e!318848))

(declare-fun c!64113 () Bool)

(assert (=> d!83245 (= c!64113 (and ((_ is Intermediate!5107) lt!251232) (undefined!5919 lt!251232)))))

(declare-fun e!318844 () SeekEntryResult!5107)

(assert (=> d!83245 (= lt!251232 e!318844)))

(declare-fun c!64115 () Bool)

(assert (=> d!83245 (= c!64115 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!251231 () (_ BitVec 64))

(assert (=> d!83245 (= lt!251231 (select (arr!16702 (array!34786 (store (arr!16702 a!3118) i!1132 k0!1914) (size!17066 a!3118))) lt!251162))))

(assert (=> d!83245 (validMask!0 mask!3119)))

(assert (=> d!83245 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251162 (select (store (arr!16702 a!3118) i!1132 k0!1914) j!142) (array!34786 (store (arr!16702 a!3118) i!1132 k0!1914) (size!17066 a!3118)) mask!3119) lt!251232)))

(declare-fun b!552519 () Bool)

(declare-fun e!318847 () SeekEntryResult!5107)

(assert (=> b!552519 (= e!318844 e!318847)))

(declare-fun c!64114 () Bool)

(assert (=> b!552519 (= c!64114 (or (= lt!251231 (select (store (arr!16702 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!251231 lt!251231) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!552520 () Bool)

(declare-fun e!318846 () Bool)

(assert (=> b!552520 (= e!318848 e!318846)))

(declare-fun res!344966 () Bool)

(assert (=> b!552520 (= res!344966 (and ((_ is Intermediate!5107) lt!251232) (not (undefined!5919 lt!251232)) (bvslt (x!51738 lt!251232) #b01111111111111111111111111111110) (bvsge (x!51738 lt!251232) #b00000000000000000000000000000000) (bvsge (x!51738 lt!251232) #b00000000000000000000000000000000)))))

(assert (=> b!552520 (=> (not res!344966) (not e!318846))))

(declare-fun b!552521 () Bool)

(assert (=> b!552521 (= e!318847 (Intermediate!5107 false lt!251162 #b00000000000000000000000000000000))))

(declare-fun b!552522 () Bool)

(assert (=> b!552522 (and (bvsge (index!22657 lt!251232) #b00000000000000000000000000000000) (bvslt (index!22657 lt!251232) (size!17066 (array!34786 (store (arr!16702 a!3118) i!1132 k0!1914) (size!17066 a!3118)))))))

(declare-fun res!344968 () Bool)

(assert (=> b!552522 (= res!344968 (= (select (arr!16702 (array!34786 (store (arr!16702 a!3118) i!1132 k0!1914) (size!17066 a!3118))) (index!22657 lt!251232)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318845 () Bool)

(assert (=> b!552522 (=> res!344968 e!318845)))

(declare-fun b!552523 () Bool)

(assert (=> b!552523 (= e!318844 (Intermediate!5107 true lt!251162 #b00000000000000000000000000000000))))

(declare-fun b!552524 () Bool)

(assert (=> b!552524 (and (bvsge (index!22657 lt!251232) #b00000000000000000000000000000000) (bvslt (index!22657 lt!251232) (size!17066 (array!34786 (store (arr!16702 a!3118) i!1132 k0!1914) (size!17066 a!3118)))))))

(assert (=> b!552524 (= e!318845 (= (select (arr!16702 (array!34786 (store (arr!16702 a!3118) i!1132 k0!1914) (size!17066 a!3118))) (index!22657 lt!251232)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!552525 () Bool)

(assert (=> b!552525 (= e!318847 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!251162 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (store (arr!16702 a!3118) i!1132 k0!1914) j!142) (array!34786 (store (arr!16702 a!3118) i!1132 k0!1914) (size!17066 a!3118)) mask!3119))))

(declare-fun b!552526 () Bool)

(assert (=> b!552526 (and (bvsge (index!22657 lt!251232) #b00000000000000000000000000000000) (bvslt (index!22657 lt!251232) (size!17066 (array!34786 (store (arr!16702 a!3118) i!1132 k0!1914) (size!17066 a!3118)))))))

(declare-fun res!344967 () Bool)

(assert (=> b!552526 (= res!344967 (= (select (arr!16702 (array!34786 (store (arr!16702 a!3118) i!1132 k0!1914) (size!17066 a!3118))) (index!22657 lt!251232)) (select (store (arr!16702 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!552526 (=> res!344967 e!318845)))

(assert (=> b!552526 (= e!318846 e!318845)))

(assert (= (and d!83245 c!64115) b!552523))

(assert (= (and d!83245 (not c!64115)) b!552519))

(assert (= (and b!552519 c!64114) b!552521))

(assert (= (and b!552519 (not c!64114)) b!552525))

(assert (= (and d!83245 c!64113) b!552518))

(assert (= (and d!83245 (not c!64113)) b!552520))

(assert (= (and b!552520 res!344966) b!552526))

(assert (= (and b!552526 (not res!344967)) b!552522))

(assert (= (and b!552522 (not res!344968)) b!552524))

(declare-fun m!529631 () Bool)

(assert (=> b!552526 m!529631))

(declare-fun m!529633 () Bool)

(assert (=> b!552525 m!529633))

(assert (=> b!552525 m!529633))

(assert (=> b!552525 m!529485))

(declare-fun m!529635 () Bool)

(assert (=> b!552525 m!529635))

(assert (=> b!552524 m!529631))

(declare-fun m!529637 () Bool)

(assert (=> d!83245 m!529637))

(assert (=> d!83245 m!529499))

(assert (=> b!552522 m!529631))

(assert (=> b!552372 d!83245))

(declare-fun d!83247 () Bool)

(declare-fun lt!251250 () (_ BitVec 32))

(declare-fun lt!251249 () (_ BitVec 32))

(assert (=> d!83247 (= lt!251250 (bvmul (bvxor lt!251249 (bvlshr lt!251249 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83247 (= lt!251249 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16702 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16702 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83247 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344969 (let ((h!11673 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16702 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16702 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51742 (bvmul (bvxor h!11673 (bvlshr h!11673 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51742 (bvlshr x!51742 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344969 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344969 #b00000000000000000000000000000000))))))

(assert (=> d!83247 (= (toIndex!0 (select (store (arr!16702 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!251250 (bvlshr lt!251250 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!552372 d!83247))

(declare-fun d!83249 () Bool)

(declare-fun lt!251252 () (_ BitVec 32))

(declare-fun lt!251251 () (_ BitVec 32))

(assert (=> d!83249 (= lt!251252 (bvmul (bvxor lt!251251 (bvlshr lt!251251 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83249 (= lt!251251 ((_ extract 31 0) (bvand (bvxor (select (arr!16702 a!3118) j!142) (bvlshr (select (arr!16702 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83249 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344969 (let ((h!11673 ((_ extract 31 0) (bvand (bvxor (select (arr!16702 a!3118) j!142) (bvlshr (select (arr!16702 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51742 (bvmul (bvxor h!11673 (bvlshr h!11673 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51742 (bvlshr x!51742 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344969 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344969 #b00000000000000000000000000000000))))))

(assert (=> d!83249 (= (toIndex!0 (select (arr!16702 a!3118) j!142) mask!3119) (bvand (bvxor lt!251252 (bvlshr lt!251252 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!552372 d!83249))

(declare-fun b!552622 () Bool)

(declare-fun e!318908 () SeekEntryResult!5107)

(declare-fun lt!251277 () SeekEntryResult!5107)

(assert (=> b!552622 (= e!318908 (Found!5107 (index!22657 lt!251277)))))

(declare-fun b!552623 () Bool)

(declare-fun e!318907 () SeekEntryResult!5107)

(assert (=> b!552623 (= e!318907 e!318908)))

(declare-fun lt!251276 () (_ BitVec 64))

(assert (=> b!552623 (= lt!251276 (select (arr!16702 a!3118) (index!22657 lt!251277)))))

(declare-fun c!64151 () Bool)

(assert (=> b!552623 (= c!64151 (= lt!251276 (select (arr!16702 a!3118) j!142)))))

(declare-fun b!552624 () Bool)

(declare-fun c!64153 () Bool)

(assert (=> b!552624 (= c!64153 (= lt!251276 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318909 () SeekEntryResult!5107)

(assert (=> b!552624 (= e!318908 e!318909)))

(declare-fun b!552625 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34785 (_ BitVec 32)) SeekEntryResult!5107)

(assert (=> b!552625 (= e!318909 (seekKeyOrZeroReturnVacant!0 (x!51738 lt!251277) (index!22657 lt!251277) (index!22657 lt!251277) (select (arr!16702 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!83251 () Bool)

(declare-fun lt!251275 () SeekEntryResult!5107)

(assert (=> d!83251 (and (or ((_ is Undefined!5107) lt!251275) (not ((_ is Found!5107) lt!251275)) (and (bvsge (index!22656 lt!251275) #b00000000000000000000000000000000) (bvslt (index!22656 lt!251275) (size!17066 a!3118)))) (or ((_ is Undefined!5107) lt!251275) ((_ is Found!5107) lt!251275) (not ((_ is MissingZero!5107) lt!251275)) (and (bvsge (index!22655 lt!251275) #b00000000000000000000000000000000) (bvslt (index!22655 lt!251275) (size!17066 a!3118)))) (or ((_ is Undefined!5107) lt!251275) ((_ is Found!5107) lt!251275) ((_ is MissingZero!5107) lt!251275) (not ((_ is MissingVacant!5107) lt!251275)) (and (bvsge (index!22658 lt!251275) #b00000000000000000000000000000000) (bvslt (index!22658 lt!251275) (size!17066 a!3118)))) (or ((_ is Undefined!5107) lt!251275) (ite ((_ is Found!5107) lt!251275) (= (select (arr!16702 a!3118) (index!22656 lt!251275)) (select (arr!16702 a!3118) j!142)) (ite ((_ is MissingZero!5107) lt!251275) (= (select (arr!16702 a!3118) (index!22655 lt!251275)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5107) lt!251275) (= (select (arr!16702 a!3118) (index!22658 lt!251275)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83251 (= lt!251275 e!318907)))

(declare-fun c!64152 () Bool)

(assert (=> d!83251 (= c!64152 (and ((_ is Intermediate!5107) lt!251277) (undefined!5919 lt!251277)))))

(assert (=> d!83251 (= lt!251277 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16702 a!3118) j!142) mask!3119) (select (arr!16702 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83251 (validMask!0 mask!3119)))

(assert (=> d!83251 (= (seekEntryOrOpen!0 (select (arr!16702 a!3118) j!142) a!3118 mask!3119) lt!251275)))

(declare-fun b!552626 () Bool)

(assert (=> b!552626 (= e!318907 Undefined!5107)))

(declare-fun b!552627 () Bool)

(assert (=> b!552627 (= e!318909 (MissingZero!5107 (index!22657 lt!251277)))))

(assert (= (and d!83251 c!64152) b!552626))

(assert (= (and d!83251 (not c!64152)) b!552623))

(assert (= (and b!552623 c!64151) b!552622))

(assert (= (and b!552623 (not c!64151)) b!552624))

(assert (= (and b!552624 c!64153) b!552627))

(assert (= (and b!552624 (not c!64153)) b!552625))

(declare-fun m!529691 () Bool)

(assert (=> b!552623 m!529691))

(assert (=> b!552625 m!529481))

(declare-fun m!529693 () Bool)

(assert (=> b!552625 m!529693))

(declare-fun m!529695 () Bool)

(assert (=> d!83251 m!529695))

(assert (=> d!83251 m!529481))

(assert (=> d!83251 m!529483))

(assert (=> d!83251 m!529499))

(declare-fun m!529697 () Bool)

(assert (=> d!83251 m!529697))

(assert (=> d!83251 m!529483))

(assert (=> d!83251 m!529481))

(declare-fun m!529699 () Bool)

(assert (=> d!83251 m!529699))

(declare-fun m!529701 () Bool)

(assert (=> d!83251 m!529701))

(assert (=> b!552367 d!83251))

(declare-fun d!83267 () Bool)

(declare-fun res!345002 () Bool)

(declare-fun e!318919 () Bool)

(assert (=> d!83267 (=> res!345002 e!318919)))

(assert (=> d!83267 (= res!345002 (= (select (arr!16702 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83267 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!318919)))

(declare-fun b!552641 () Bool)

(declare-fun e!318920 () Bool)

(assert (=> b!552641 (= e!318919 e!318920)))

(declare-fun res!345003 () Bool)

(assert (=> b!552641 (=> (not res!345003) (not e!318920))))

(assert (=> b!552641 (= res!345003 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17066 a!3118)))))

(declare-fun b!552642 () Bool)

(assert (=> b!552642 (= e!318920 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83267 (not res!345002)) b!552641))

(assert (= (and b!552641 res!345003) b!552642))

(declare-fun m!529711 () Bool)

(assert (=> d!83267 m!529711))

(declare-fun m!529713 () Bool)

(assert (=> b!552642 m!529713))

(assert (=> b!552371 d!83267))

(declare-fun b!552652 () Bool)

(declare-fun e!318927 () Bool)

(declare-fun call!32331 () Bool)

(assert (=> b!552652 (= e!318927 call!32331)))

(declare-fun d!83275 () Bool)

(declare-fun res!345007 () Bool)

(declare-fun e!318926 () Bool)

(assert (=> d!83275 (=> res!345007 e!318926)))

(assert (=> d!83275 (= res!345007 (bvsge #b00000000000000000000000000000000 (size!17066 a!3118)))))

(assert (=> d!83275 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!318926)))

(declare-fun b!552653 () Bool)

(declare-fun e!318928 () Bool)

(assert (=> b!552653 (= e!318927 e!318928)))

(declare-fun lt!251284 () (_ BitVec 64))

(assert (=> b!552653 (= lt!251284 (select (arr!16702 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!251282 () Unit!17059)

(assert (=> b!552653 (= lt!251282 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!251284 #b00000000000000000000000000000000))))

(assert (=> b!552653 (arrayContainsKey!0 a!3118 lt!251284 #b00000000000000000000000000000000)))

(declare-fun lt!251283 () Unit!17059)

(assert (=> b!552653 (= lt!251283 lt!251282)))

(declare-fun res!345008 () Bool)

(assert (=> b!552653 (= res!345008 (= (seekEntryOrOpen!0 (select (arr!16702 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5107 #b00000000000000000000000000000000)))))

(assert (=> b!552653 (=> (not res!345008) (not e!318928))))

(declare-fun b!552654 () Bool)

(assert (=> b!552654 (= e!318926 e!318927)))

(declare-fun c!64160 () Bool)

(assert (=> b!552654 (= c!64160 (validKeyInArray!0 (select (arr!16702 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32328 () Bool)

(assert (=> bm!32328 (= call!32331 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!552655 () Bool)

(assert (=> b!552655 (= e!318928 call!32331)))

(assert (= (and d!83275 (not res!345007)) b!552654))

(assert (= (and b!552654 c!64160) b!552653))

(assert (= (and b!552654 (not c!64160)) b!552652))

(assert (= (and b!552653 res!345008) b!552655))

(assert (= (or b!552655 b!552652) bm!32328))

(assert (=> b!552653 m!529711))

(declare-fun m!529715 () Bool)

(assert (=> b!552653 m!529715))

(declare-fun m!529717 () Bool)

(assert (=> b!552653 m!529717))

(assert (=> b!552653 m!529711))

(declare-fun m!529719 () Bool)

(assert (=> b!552653 m!529719))

(assert (=> b!552654 m!529711))

(assert (=> b!552654 m!529711))

(declare-fun m!529723 () Bool)

(assert (=> b!552654 m!529723))

(declare-fun m!529725 () Bool)

(assert (=> bm!32328 m!529725))

(assert (=> b!552366 d!83275))

(declare-fun d!83277 () Bool)

(assert (=> d!83277 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50556 d!83277))

(declare-fun d!83287 () Bool)

(assert (=> d!83287 (= (array_inv!12561 a!3118) (bvsge (size!17066 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50556 d!83287))

(declare-fun b!552690 () Bool)

(declare-fun e!318952 () Bool)

(declare-fun call!32334 () Bool)

(assert (=> b!552690 (= e!318952 call!32334)))

(declare-fun b!552691 () Bool)

(declare-fun e!318951 () Bool)

(declare-fun contains!2819 (List!10689 (_ BitVec 64)) Bool)

(assert (=> b!552691 (= e!318951 (contains!2819 Nil!10686 (select (arr!16702 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!552693 () Bool)

(declare-fun e!318950 () Bool)

(assert (=> b!552693 (= e!318950 e!318952)))

(declare-fun c!64172 () Bool)

(assert (=> b!552693 (= c!64172 (validKeyInArray!0 (select (arr!16702 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!552694 () Bool)

(assert (=> b!552694 (= e!318952 call!32334)))

(declare-fun bm!32331 () Bool)

(assert (=> bm!32331 (= call!32334 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64172 (Cons!10685 (select (arr!16702 a!3118) #b00000000000000000000000000000000) Nil!10686) Nil!10686)))))

(declare-fun b!552692 () Bool)

(declare-fun e!318953 () Bool)

(assert (=> b!552692 (= e!318953 e!318950)))

(declare-fun res!345022 () Bool)

(assert (=> b!552692 (=> (not res!345022) (not e!318950))))

(assert (=> b!552692 (= res!345022 (not e!318951))))

(declare-fun res!345024 () Bool)

(assert (=> b!552692 (=> (not res!345024) (not e!318951))))

(assert (=> b!552692 (= res!345024 (validKeyInArray!0 (select (arr!16702 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83289 () Bool)

(declare-fun res!345023 () Bool)

(assert (=> d!83289 (=> res!345023 e!318953)))

(assert (=> d!83289 (= res!345023 (bvsge #b00000000000000000000000000000000 (size!17066 a!3118)))))

(assert (=> d!83289 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10686) e!318953)))

(assert (= (and d!83289 (not res!345023)) b!552692))

(assert (= (and b!552692 res!345024) b!552691))

(assert (= (and b!552692 res!345022) b!552693))

(assert (= (and b!552693 c!64172) b!552690))

(assert (= (and b!552693 (not c!64172)) b!552694))

(assert (= (or b!552690 b!552694) bm!32331))

(assert (=> b!552691 m!529711))

(assert (=> b!552691 m!529711))

(declare-fun m!529745 () Bool)

(assert (=> b!552691 m!529745))

(assert (=> b!552693 m!529711))

(assert (=> b!552693 m!529711))

(assert (=> b!552693 m!529723))

(assert (=> bm!32331 m!529711))

(declare-fun m!529747 () Bool)

(assert (=> bm!32331 m!529747))

(assert (=> b!552692 m!529711))

(assert (=> b!552692 m!529711))

(assert (=> b!552692 m!529723))

(assert (=> b!552364 d!83289))

(declare-fun d!83291 () Bool)

(assert (=> d!83291 (= (validKeyInArray!0 (select (arr!16702 a!3118) j!142)) (and (not (= (select (arr!16702 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16702 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!552370 d!83291))

(declare-fun b!552695 () Bool)

(declare-fun e!318955 () SeekEntryResult!5107)

(declare-fun lt!251302 () SeekEntryResult!5107)

(assert (=> b!552695 (= e!318955 (Found!5107 (index!22657 lt!251302)))))

(declare-fun b!552696 () Bool)

(declare-fun e!318954 () SeekEntryResult!5107)

(assert (=> b!552696 (= e!318954 e!318955)))

(declare-fun lt!251301 () (_ BitVec 64))

(assert (=> b!552696 (= lt!251301 (select (arr!16702 a!3118) (index!22657 lt!251302)))))

(declare-fun c!64173 () Bool)

(assert (=> b!552696 (= c!64173 (= lt!251301 k0!1914))))

(declare-fun b!552697 () Bool)

(declare-fun c!64175 () Bool)

(assert (=> b!552697 (= c!64175 (= lt!251301 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318956 () SeekEntryResult!5107)

(assert (=> b!552697 (= e!318955 e!318956)))

(declare-fun b!552698 () Bool)

(assert (=> b!552698 (= e!318956 (seekKeyOrZeroReturnVacant!0 (x!51738 lt!251302) (index!22657 lt!251302) (index!22657 lt!251302) k0!1914 a!3118 mask!3119))))

(declare-fun d!83293 () Bool)

(declare-fun lt!251300 () SeekEntryResult!5107)

(assert (=> d!83293 (and (or ((_ is Undefined!5107) lt!251300) (not ((_ is Found!5107) lt!251300)) (and (bvsge (index!22656 lt!251300) #b00000000000000000000000000000000) (bvslt (index!22656 lt!251300) (size!17066 a!3118)))) (or ((_ is Undefined!5107) lt!251300) ((_ is Found!5107) lt!251300) (not ((_ is MissingZero!5107) lt!251300)) (and (bvsge (index!22655 lt!251300) #b00000000000000000000000000000000) (bvslt (index!22655 lt!251300) (size!17066 a!3118)))) (or ((_ is Undefined!5107) lt!251300) ((_ is Found!5107) lt!251300) ((_ is MissingZero!5107) lt!251300) (not ((_ is MissingVacant!5107) lt!251300)) (and (bvsge (index!22658 lt!251300) #b00000000000000000000000000000000) (bvslt (index!22658 lt!251300) (size!17066 a!3118)))) (or ((_ is Undefined!5107) lt!251300) (ite ((_ is Found!5107) lt!251300) (= (select (arr!16702 a!3118) (index!22656 lt!251300)) k0!1914) (ite ((_ is MissingZero!5107) lt!251300) (= (select (arr!16702 a!3118) (index!22655 lt!251300)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5107) lt!251300) (= (select (arr!16702 a!3118) (index!22658 lt!251300)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83293 (= lt!251300 e!318954)))

(declare-fun c!64174 () Bool)

(assert (=> d!83293 (= c!64174 (and ((_ is Intermediate!5107) lt!251302) (undefined!5919 lt!251302)))))

(assert (=> d!83293 (= lt!251302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83293 (validMask!0 mask!3119)))

(assert (=> d!83293 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!251300)))

(declare-fun b!552699 () Bool)

(assert (=> b!552699 (= e!318954 Undefined!5107)))

(declare-fun b!552700 () Bool)

(assert (=> b!552700 (= e!318956 (MissingZero!5107 (index!22657 lt!251302)))))

(assert (= (and d!83293 c!64174) b!552699))

(assert (= (and d!83293 (not c!64174)) b!552696))

(assert (= (and b!552696 c!64173) b!552695))

(assert (= (and b!552696 (not c!64173)) b!552697))

(assert (= (and b!552697 c!64175) b!552700))

(assert (= (and b!552697 (not c!64175)) b!552698))

(declare-fun m!529749 () Bool)

(assert (=> b!552696 m!529749))

(declare-fun m!529751 () Bool)

(assert (=> b!552698 m!529751))

(declare-fun m!529753 () Bool)

(assert (=> d!83293 m!529753))

(declare-fun m!529755 () Bool)

(assert (=> d!83293 m!529755))

(assert (=> d!83293 m!529499))

(declare-fun m!529757 () Bool)

(assert (=> d!83293 m!529757))

(assert (=> d!83293 m!529755))

(declare-fun m!529759 () Bool)

(assert (=> d!83293 m!529759))

(declare-fun m!529761 () Bool)

(assert (=> d!83293 m!529761))

(assert (=> b!552365 d!83293))

(check-sat (not d!83245) (not d!83225) (not b!552525) (not b!552653) (not b!552459) (not b!552625) (not b!552654) (not d!83293) (not b!552698) (not b!552691) (not d!83221) (not bm!32316) (not b!552692) (not b!552642) (not b!552458) (not b!552516) (not b!552693) (not bm!32328) (not bm!32331) (not d!83251))
(check-sat)
