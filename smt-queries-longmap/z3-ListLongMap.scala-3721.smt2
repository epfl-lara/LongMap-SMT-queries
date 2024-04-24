; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51300 () Bool)

(assert start!51300)

(declare-fun b!559784 () Bool)

(declare-fun res!351077 () Bool)

(declare-fun e!322507 () Bool)

(assert (=> b!559784 (=> (not res!351077) (not e!322507))))

(declare-datatypes ((array!35175 0))(
  ( (array!35176 (arr!16888 (Array (_ BitVec 32) (_ BitVec 64))) (size!17252 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35175)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!559784 (= res!351077 (validKeyInArray!0 (select (arr!16888 a!3118) j!142)))))

(declare-fun b!559785 () Bool)

(declare-fun e!322510 () Bool)

(declare-fun e!322509 () Bool)

(assert (=> b!559785 (= e!322510 e!322509)))

(declare-fun res!351075 () Bool)

(assert (=> b!559785 (=> (not res!351075) (not e!322509))))

(declare-datatypes ((SeekEntryResult!5293 0))(
  ( (MissingZero!5293 (index!23399 (_ BitVec 32))) (Found!5293 (index!23400 (_ BitVec 32))) (Intermediate!5293 (undefined!6105 Bool) (index!23401 (_ BitVec 32)) (x!52462 (_ BitVec 32))) (Undefined!5293) (MissingVacant!5293 (index!23402 (_ BitVec 32))) )
))
(declare-fun lt!254437 () SeekEntryResult!5293)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!254436 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!254441 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35175 (_ BitVec 32)) SeekEntryResult!5293)

(assert (=> b!559785 (= res!351075 (= lt!254437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254436 lt!254441 (array!35176 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118)) mask!3119)))))

(declare-fun lt!254438 () (_ BitVec 32))

(assert (=> b!559785 (= lt!254437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254438 (select (arr!16888 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559785 (= lt!254436 (toIndex!0 lt!254441 mask!3119))))

(assert (=> b!559785 (= lt!254441 (select (store (arr!16888 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!559785 (= lt!254438 (toIndex!0 (select (arr!16888 a!3118) j!142) mask!3119))))

(declare-fun b!559786 () Bool)

(declare-fun res!351074 () Bool)

(assert (=> b!559786 (=> (not res!351074) (not e!322510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35175 (_ BitVec 32)) Bool)

(assert (=> b!559786 (= res!351074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!559787 () Bool)

(declare-fun e!322511 () Bool)

(declare-fun e!322512 () Bool)

(assert (=> b!559787 (= e!322511 e!322512)))

(declare-fun res!351068 () Bool)

(assert (=> b!559787 (=> res!351068 e!322512)))

(declare-fun lt!254440 () (_ BitVec 64))

(assert (=> b!559787 (= res!351068 (or (= lt!254440 (select (arr!16888 a!3118) j!142)) (= lt!254440 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!559787 (= lt!254440 (select (arr!16888 a!3118) (index!23401 lt!254437)))))

(declare-fun b!559789 () Bool)

(declare-fun lt!254439 () SeekEntryResult!5293)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35175 (_ BitVec 32)) SeekEntryResult!5293)

(assert (=> b!559789 (= e!322512 (= lt!254439 (seekKeyOrZeroReturnVacant!0 (x!52462 lt!254437) (index!23401 lt!254437) (index!23401 lt!254437) (select (arr!16888 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!559790 () Bool)

(declare-fun res!351072 () Bool)

(assert (=> b!559790 (=> (not res!351072) (not e!322510))))

(declare-datatypes ((List!10875 0))(
  ( (Nil!10872) (Cons!10871 (h!11874 (_ BitVec 64)) (t!17095 List!10875)) )
))
(declare-fun arrayNoDuplicates!0 (array!35175 (_ BitVec 32) List!10875) Bool)

(assert (=> b!559790 (= res!351072 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10872))))

(declare-fun b!559791 () Bool)

(declare-fun res!351079 () Bool)

(assert (=> b!559791 (=> (not res!351079) (not e!322507))))

(assert (=> b!559791 (= res!351079 (and (= (size!17252 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17252 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17252 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!559792 () Bool)

(declare-fun res!351069 () Bool)

(assert (=> b!559792 (=> (not res!351069) (not e!322507))))

(declare-fun arrayContainsKey!0 (array!35175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!559792 (= res!351069 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!559793 () Bool)

(get-info :version)

(assert (=> b!559793 (= e!322509 (not (or (undefined!6105 lt!254437) (not ((_ is Intermediate!5293) lt!254437)) (let ((bdg!16975 (select (arr!16888 a!3118) (index!23401 lt!254437)))) (or (= bdg!16975 (select (arr!16888 a!3118) j!142)) (= bdg!16975 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23401 lt!254437) #b00000000000000000000000000000000) (bvsge (index!23401 lt!254437) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52462 lt!254437) #b01111111111111111111111111111110) (bvslt (x!52462 lt!254437) #b00000000000000000000000000000000) (= (select (store (arr!16888 a!3118) i!1132 k0!1914) (index!23401 lt!254437)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!322508 () Bool)

(assert (=> b!559793 e!322508))

(declare-fun res!351073 () Bool)

(assert (=> b!559793 (=> (not res!351073) (not e!322508))))

(assert (=> b!559793 (= res!351073 (= lt!254439 (Found!5293 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35175 (_ BitVec 32)) SeekEntryResult!5293)

(assert (=> b!559793 (= lt!254439 (seekEntryOrOpen!0 (select (arr!16888 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!559793 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17431 0))(
  ( (Unit!17432) )
))
(declare-fun lt!254443 () Unit!17431)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35175 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17431)

(assert (=> b!559793 (= lt!254443 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!559788 () Bool)

(declare-fun res!351076 () Bool)

(assert (=> b!559788 (=> (not res!351076) (not e!322507))))

(assert (=> b!559788 (= res!351076 (validKeyInArray!0 k0!1914))))

(declare-fun res!351071 () Bool)

(assert (=> start!51300 (=> (not res!351071) (not e!322507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51300 (= res!351071 (validMask!0 mask!3119))))

(assert (=> start!51300 e!322507))

(assert (=> start!51300 true))

(declare-fun array_inv!12747 (array!35175) Bool)

(assert (=> start!51300 (array_inv!12747 a!3118)))

(declare-fun b!559794 () Bool)

(assert (=> b!559794 (= e!322508 e!322511)))

(declare-fun res!351070 () Bool)

(assert (=> b!559794 (=> res!351070 e!322511)))

(assert (=> b!559794 (= res!351070 (or (undefined!6105 lt!254437) (not ((_ is Intermediate!5293) lt!254437))))))

(declare-fun b!559795 () Bool)

(assert (=> b!559795 (= e!322507 e!322510)))

(declare-fun res!351078 () Bool)

(assert (=> b!559795 (=> (not res!351078) (not e!322510))))

(declare-fun lt!254442 () SeekEntryResult!5293)

(assert (=> b!559795 (= res!351078 (or (= lt!254442 (MissingZero!5293 i!1132)) (= lt!254442 (MissingVacant!5293 i!1132))))))

(assert (=> b!559795 (= lt!254442 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51300 res!351071) b!559791))

(assert (= (and b!559791 res!351079) b!559784))

(assert (= (and b!559784 res!351077) b!559788))

(assert (= (and b!559788 res!351076) b!559792))

(assert (= (and b!559792 res!351069) b!559795))

(assert (= (and b!559795 res!351078) b!559786))

(assert (= (and b!559786 res!351074) b!559790))

(assert (= (and b!559790 res!351072) b!559785))

(assert (= (and b!559785 res!351075) b!559793))

(assert (= (and b!559793 res!351073) b!559794))

(assert (= (and b!559794 (not res!351070)) b!559787))

(assert (= (and b!559787 (not res!351068)) b!559789))

(declare-fun m!537749 () Bool)

(assert (=> b!559788 m!537749))

(declare-fun m!537751 () Bool)

(assert (=> b!559787 m!537751))

(declare-fun m!537753 () Bool)

(assert (=> b!559787 m!537753))

(declare-fun m!537755 () Bool)

(assert (=> b!559793 m!537755))

(assert (=> b!559793 m!537751))

(declare-fun m!537757 () Bool)

(assert (=> b!559793 m!537757))

(declare-fun m!537759 () Bool)

(assert (=> b!559793 m!537759))

(declare-fun m!537761 () Bool)

(assert (=> b!559793 m!537761))

(assert (=> b!559793 m!537753))

(assert (=> b!559793 m!537751))

(declare-fun m!537763 () Bool)

(assert (=> b!559793 m!537763))

(declare-fun m!537765 () Bool)

(assert (=> start!51300 m!537765))

(declare-fun m!537767 () Bool)

(assert (=> start!51300 m!537767))

(declare-fun m!537769 () Bool)

(assert (=> b!559792 m!537769))

(declare-fun m!537771 () Bool)

(assert (=> b!559786 m!537771))

(declare-fun m!537773 () Bool)

(assert (=> b!559790 m!537773))

(assert (=> b!559789 m!537751))

(assert (=> b!559789 m!537751))

(declare-fun m!537775 () Bool)

(assert (=> b!559789 m!537775))

(assert (=> b!559784 m!537751))

(assert (=> b!559784 m!537751))

(declare-fun m!537777 () Bool)

(assert (=> b!559784 m!537777))

(assert (=> b!559785 m!537751))

(declare-fun m!537779 () Bool)

(assert (=> b!559785 m!537779))

(assert (=> b!559785 m!537751))

(declare-fun m!537781 () Bool)

(assert (=> b!559785 m!537781))

(declare-fun m!537783 () Bool)

(assert (=> b!559785 m!537783))

(declare-fun m!537785 () Bool)

(assert (=> b!559785 m!537785))

(assert (=> b!559785 m!537759))

(declare-fun m!537787 () Bool)

(assert (=> b!559785 m!537787))

(assert (=> b!559785 m!537751))

(declare-fun m!537789 () Bool)

(assert (=> b!559795 m!537789))

(check-sat (not b!559790) (not b!559789) (not b!559786) (not b!559784) (not b!559788) (not b!559793) (not b!559792) (not b!559785) (not b!559795) (not start!51300))
(check-sat)
(get-model)

(declare-fun b!559880 () Bool)

(declare-fun e!322562 () SeekEntryResult!5293)

(declare-fun e!322561 () SeekEntryResult!5293)

(assert (=> b!559880 (= e!322562 e!322561)))

(declare-fun lt!254498 () (_ BitVec 64))

(declare-fun lt!254499 () SeekEntryResult!5293)

(assert (=> b!559880 (= lt!254498 (select (arr!16888 a!3118) (index!23401 lt!254499)))))

(declare-fun c!64710 () Bool)

(assert (=> b!559880 (= c!64710 (= lt!254498 (select (arr!16888 a!3118) j!142)))))

(declare-fun b!559881 () Bool)

(declare-fun e!322563 () SeekEntryResult!5293)

(assert (=> b!559881 (= e!322563 (seekKeyOrZeroReturnVacant!0 (x!52462 lt!254499) (index!23401 lt!254499) (index!23401 lt!254499) (select (arr!16888 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!559882 () Bool)

(assert (=> b!559882 (= e!322562 Undefined!5293)))

(declare-fun b!559883 () Bool)

(assert (=> b!559883 (= e!322561 (Found!5293 (index!23401 lt!254499)))))

(declare-fun b!559884 () Bool)

(declare-fun c!64711 () Bool)

(assert (=> b!559884 (= c!64711 (= lt!254498 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559884 (= e!322561 e!322563)))

(declare-fun b!559885 () Bool)

(assert (=> b!559885 (= e!322563 (MissingZero!5293 (index!23401 lt!254499)))))

(declare-fun d!83889 () Bool)

(declare-fun lt!254500 () SeekEntryResult!5293)

(assert (=> d!83889 (and (or ((_ is Undefined!5293) lt!254500) (not ((_ is Found!5293) lt!254500)) (and (bvsge (index!23400 lt!254500) #b00000000000000000000000000000000) (bvslt (index!23400 lt!254500) (size!17252 a!3118)))) (or ((_ is Undefined!5293) lt!254500) ((_ is Found!5293) lt!254500) (not ((_ is MissingZero!5293) lt!254500)) (and (bvsge (index!23399 lt!254500) #b00000000000000000000000000000000) (bvslt (index!23399 lt!254500) (size!17252 a!3118)))) (or ((_ is Undefined!5293) lt!254500) ((_ is Found!5293) lt!254500) ((_ is MissingZero!5293) lt!254500) (not ((_ is MissingVacant!5293) lt!254500)) (and (bvsge (index!23402 lt!254500) #b00000000000000000000000000000000) (bvslt (index!23402 lt!254500) (size!17252 a!3118)))) (or ((_ is Undefined!5293) lt!254500) (ite ((_ is Found!5293) lt!254500) (= (select (arr!16888 a!3118) (index!23400 lt!254500)) (select (arr!16888 a!3118) j!142)) (ite ((_ is MissingZero!5293) lt!254500) (= (select (arr!16888 a!3118) (index!23399 lt!254500)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5293) lt!254500) (= (select (arr!16888 a!3118) (index!23402 lt!254500)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83889 (= lt!254500 e!322562)))

(declare-fun c!64712 () Bool)

(assert (=> d!83889 (= c!64712 (and ((_ is Intermediate!5293) lt!254499) (undefined!6105 lt!254499)))))

(assert (=> d!83889 (= lt!254499 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16888 a!3118) j!142) mask!3119) (select (arr!16888 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83889 (validMask!0 mask!3119)))

(assert (=> d!83889 (= (seekEntryOrOpen!0 (select (arr!16888 a!3118) j!142) a!3118 mask!3119) lt!254500)))

(assert (= (and d!83889 c!64712) b!559882))

(assert (= (and d!83889 (not c!64712)) b!559880))

(assert (= (and b!559880 c!64710) b!559883))

(assert (= (and b!559880 (not c!64710)) b!559884))

(assert (= (and b!559884 c!64711) b!559885))

(assert (= (and b!559884 (not c!64711)) b!559881))

(declare-fun m!537875 () Bool)

(assert (=> b!559880 m!537875))

(assert (=> b!559881 m!537751))

(declare-fun m!537877 () Bool)

(assert (=> b!559881 m!537877))

(declare-fun m!537879 () Bool)

(assert (=> d!83889 m!537879))

(assert (=> d!83889 m!537751))

(assert (=> d!83889 m!537779))

(assert (=> d!83889 m!537765))

(declare-fun m!537881 () Bool)

(assert (=> d!83889 m!537881))

(declare-fun m!537883 () Bool)

(assert (=> d!83889 m!537883))

(assert (=> d!83889 m!537779))

(assert (=> d!83889 m!537751))

(declare-fun m!537885 () Bool)

(assert (=> d!83889 m!537885))

(assert (=> b!559793 d!83889))

(declare-fun d!83891 () Bool)

(declare-fun res!351160 () Bool)

(declare-fun e!322576 () Bool)

(assert (=> d!83891 (=> res!351160 e!322576)))

(assert (=> d!83891 (= res!351160 (bvsge j!142 (size!17252 a!3118)))))

(assert (=> d!83891 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!322576)))

(declare-fun call!32444 () Bool)

(declare-fun bm!32441 () Bool)

(assert (=> bm!32441 (= call!32444 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!559902 () Bool)

(declare-fun e!322577 () Bool)

(declare-fun e!322578 () Bool)

(assert (=> b!559902 (= e!322577 e!322578)))

(declare-fun lt!254515 () (_ BitVec 64))

(assert (=> b!559902 (= lt!254515 (select (arr!16888 a!3118) j!142))))

(declare-fun lt!254513 () Unit!17431)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35175 (_ BitVec 64) (_ BitVec 32)) Unit!17431)

(assert (=> b!559902 (= lt!254513 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254515 j!142))))

(assert (=> b!559902 (arrayContainsKey!0 a!3118 lt!254515 #b00000000000000000000000000000000)))

(declare-fun lt!254514 () Unit!17431)

(assert (=> b!559902 (= lt!254514 lt!254513)))

(declare-fun res!351161 () Bool)

(assert (=> b!559902 (= res!351161 (= (seekEntryOrOpen!0 (select (arr!16888 a!3118) j!142) a!3118 mask!3119) (Found!5293 j!142)))))

(assert (=> b!559902 (=> (not res!351161) (not e!322578))))

(declare-fun b!559903 () Bool)

(assert (=> b!559903 (= e!322577 call!32444)))

(declare-fun b!559904 () Bool)

(assert (=> b!559904 (= e!322576 e!322577)))

(declare-fun c!64717 () Bool)

(assert (=> b!559904 (= c!64717 (validKeyInArray!0 (select (arr!16888 a!3118) j!142)))))

(declare-fun b!559905 () Bool)

(assert (=> b!559905 (= e!322578 call!32444)))

(assert (= (and d!83891 (not res!351160)) b!559904))

(assert (= (and b!559904 c!64717) b!559902))

(assert (= (and b!559904 (not c!64717)) b!559903))

(assert (= (and b!559902 res!351161) b!559905))

(assert (= (or b!559905 b!559903) bm!32441))

(declare-fun m!537887 () Bool)

(assert (=> bm!32441 m!537887))

(assert (=> b!559902 m!537751))

(declare-fun m!537889 () Bool)

(assert (=> b!559902 m!537889))

(declare-fun m!537891 () Bool)

(assert (=> b!559902 m!537891))

(assert (=> b!559902 m!537751))

(assert (=> b!559902 m!537763))

(assert (=> b!559904 m!537751))

(assert (=> b!559904 m!537751))

(assert (=> b!559904 m!537777))

(assert (=> b!559793 d!83891))

(declare-fun d!83895 () Bool)

(assert (=> d!83895 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!254521 () Unit!17431)

(declare-fun choose!38 (array!35175 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17431)

(assert (=> d!83895 (= lt!254521 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83895 (validMask!0 mask!3119)))

(assert (=> d!83895 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!254521)))

(declare-fun bs!17420 () Bool)

(assert (= bs!17420 d!83895))

(assert (=> bs!17420 m!537757))

(declare-fun m!537905 () Bool)

(assert (=> bs!17420 m!537905))

(assert (=> bs!17420 m!537765))

(assert (=> b!559793 d!83895))

(declare-fun d!83899 () Bool)

(declare-fun res!351168 () Bool)

(declare-fun e!322586 () Bool)

(assert (=> d!83899 (=> res!351168 e!322586)))

(assert (=> d!83899 (= res!351168 (= (select (arr!16888 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83899 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!322586)))

(declare-fun b!559914 () Bool)

(declare-fun e!322587 () Bool)

(assert (=> b!559914 (= e!322586 e!322587)))

(declare-fun res!351169 () Bool)

(assert (=> b!559914 (=> (not res!351169) (not e!322587))))

(assert (=> b!559914 (= res!351169 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17252 a!3118)))))

(declare-fun b!559915 () Bool)

(assert (=> b!559915 (= e!322587 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83899 (not res!351168)) b!559914))

(assert (= (and b!559914 res!351169) b!559915))

(declare-fun m!537907 () Bool)

(assert (=> d!83899 m!537907))

(declare-fun m!537909 () Bool)

(assert (=> b!559915 m!537909))

(assert (=> b!559792 d!83899))

(declare-fun lt!254531 () SeekEntryResult!5293)

(declare-fun d!83901 () Bool)

(assert (=> d!83901 (and (or ((_ is Undefined!5293) lt!254531) (not ((_ is Found!5293) lt!254531)) (and (bvsge (index!23400 lt!254531) #b00000000000000000000000000000000) (bvslt (index!23400 lt!254531) (size!17252 a!3118)))) (or ((_ is Undefined!5293) lt!254531) ((_ is Found!5293) lt!254531) (not ((_ is MissingVacant!5293) lt!254531)) (not (= (index!23402 lt!254531) (index!23401 lt!254437))) (and (bvsge (index!23402 lt!254531) #b00000000000000000000000000000000) (bvslt (index!23402 lt!254531) (size!17252 a!3118)))) (or ((_ is Undefined!5293) lt!254531) (ite ((_ is Found!5293) lt!254531) (= (select (arr!16888 a!3118) (index!23400 lt!254531)) (select (arr!16888 a!3118) j!142)) (and ((_ is MissingVacant!5293) lt!254531) (= (index!23402 lt!254531) (index!23401 lt!254437)) (= (select (arr!16888 a!3118) (index!23402 lt!254531)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!322601 () SeekEntryResult!5293)

(assert (=> d!83901 (= lt!254531 e!322601)))

(declare-fun c!64733 () Bool)

(assert (=> d!83901 (= c!64733 (bvsge (x!52462 lt!254437) #b01111111111111111111111111111110))))

(declare-fun lt!254530 () (_ BitVec 64))

(assert (=> d!83901 (= lt!254530 (select (arr!16888 a!3118) (index!23401 lt!254437)))))

(assert (=> d!83901 (validMask!0 mask!3119)))

(assert (=> d!83901 (= (seekKeyOrZeroReturnVacant!0 (x!52462 lt!254437) (index!23401 lt!254437) (index!23401 lt!254437) (select (arr!16888 a!3118) j!142) a!3118 mask!3119) lt!254531)))

(declare-fun b!559940 () Bool)

(declare-fun e!322600 () SeekEntryResult!5293)

(assert (=> b!559940 (= e!322600 (MissingVacant!5293 (index!23401 lt!254437)))))

(declare-fun b!559941 () Bool)

(declare-fun c!64732 () Bool)

(assert (=> b!559941 (= c!64732 (= lt!254530 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322602 () SeekEntryResult!5293)

(assert (=> b!559941 (= e!322602 e!322600)))

(declare-fun b!559942 () Bool)

(assert (=> b!559942 (= e!322602 (Found!5293 (index!23401 lt!254437)))))

(declare-fun b!559943 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559943 (= e!322600 (seekKeyOrZeroReturnVacant!0 (bvadd (x!52462 lt!254437) #b00000000000000000000000000000001) (nextIndex!0 (index!23401 lt!254437) (bvadd (x!52462 lt!254437) #b00000000000000000000000000000001) mask!3119) (index!23401 lt!254437) (select (arr!16888 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!559944 () Bool)

(assert (=> b!559944 (= e!322601 Undefined!5293)))

(declare-fun b!559945 () Bool)

(assert (=> b!559945 (= e!322601 e!322602)))

(declare-fun c!64731 () Bool)

(assert (=> b!559945 (= c!64731 (= lt!254530 (select (arr!16888 a!3118) j!142)))))

(assert (= (and d!83901 c!64733) b!559944))

(assert (= (and d!83901 (not c!64733)) b!559945))

(assert (= (and b!559945 c!64731) b!559942))

(assert (= (and b!559945 (not c!64731)) b!559941))

(assert (= (and b!559941 c!64732) b!559940))

(assert (= (and b!559941 (not c!64732)) b!559943))

(declare-fun m!537911 () Bool)

(assert (=> d!83901 m!537911))

(declare-fun m!537913 () Bool)

(assert (=> d!83901 m!537913))

(assert (=> d!83901 m!537753))

(assert (=> d!83901 m!537765))

(declare-fun m!537915 () Bool)

(assert (=> b!559943 m!537915))

(assert (=> b!559943 m!537915))

(assert (=> b!559943 m!537751))

(declare-fun m!537917 () Bool)

(assert (=> b!559943 m!537917))

(assert (=> b!559789 d!83901))

(declare-fun d!83905 () Bool)

(assert (=> d!83905 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559788 d!83905))

(declare-fun d!83907 () Bool)

(assert (=> d!83907 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51300 d!83907))

(declare-fun d!83911 () Bool)

(assert (=> d!83911 (= (array_inv!12747 a!3118) (bvsge (size!17252 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51300 d!83911))

(declare-fun b!559995 () Bool)

(declare-fun e!322637 () Bool)

(declare-fun call!32451 () Bool)

(assert (=> b!559995 (= e!322637 call!32451)))

(declare-fun d!83913 () Bool)

(declare-fun res!351186 () Bool)

(declare-fun e!322635 () Bool)

(assert (=> d!83913 (=> res!351186 e!322635)))

(assert (=> d!83913 (= res!351186 (bvsge #b00000000000000000000000000000000 (size!17252 a!3118)))))

(assert (=> d!83913 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10872) e!322635)))

(declare-fun bm!32448 () Bool)

(declare-fun c!64751 () Bool)

(assert (=> bm!32448 (= call!32451 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64751 (Cons!10871 (select (arr!16888 a!3118) #b00000000000000000000000000000000) Nil!10872) Nil!10872)))))

(declare-fun b!559996 () Bool)

(declare-fun e!322638 () Bool)

(assert (=> b!559996 (= e!322635 e!322638)))

(declare-fun res!351185 () Bool)

(assert (=> b!559996 (=> (not res!351185) (not e!322638))))

(declare-fun e!322636 () Bool)

(assert (=> b!559996 (= res!351185 (not e!322636))))

(declare-fun res!351187 () Bool)

(assert (=> b!559996 (=> (not res!351187) (not e!322636))))

(assert (=> b!559996 (= res!351187 (validKeyInArray!0 (select (arr!16888 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559997 () Bool)

(assert (=> b!559997 (= e!322638 e!322637)))

(assert (=> b!559997 (= c!64751 (validKeyInArray!0 (select (arr!16888 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559998 () Bool)

(declare-fun contains!2834 (List!10875 (_ BitVec 64)) Bool)

(assert (=> b!559998 (= e!322636 (contains!2834 Nil!10872 (select (arr!16888 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559999 () Bool)

(assert (=> b!559999 (= e!322637 call!32451)))

(assert (= (and d!83913 (not res!351186)) b!559996))

(assert (= (and b!559996 res!351187) b!559998))

(assert (= (and b!559996 res!351185) b!559997))

(assert (= (and b!559997 c!64751) b!559995))

(assert (= (and b!559997 (not c!64751)) b!559999))

(assert (= (or b!559995 b!559999) bm!32448))

(assert (=> bm!32448 m!537907))

(declare-fun m!537939 () Bool)

(assert (=> bm!32448 m!537939))

(assert (=> b!559996 m!537907))

(assert (=> b!559996 m!537907))

(declare-fun m!537941 () Bool)

(assert (=> b!559996 m!537941))

(assert (=> b!559997 m!537907))

(assert (=> b!559997 m!537907))

(assert (=> b!559997 m!537941))

(assert (=> b!559998 m!537907))

(assert (=> b!559998 m!537907))

(declare-fun m!537943 () Bool)

(assert (=> b!559998 m!537943))

(assert (=> b!559790 d!83913))

(declare-fun b!560036 () Bool)

(declare-fun lt!254554 () SeekEntryResult!5293)

(assert (=> b!560036 (and (bvsge (index!23401 lt!254554) #b00000000000000000000000000000000) (bvslt (index!23401 lt!254554) (size!17252 (array!35176 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118)))))))

(declare-fun res!351208 () Bool)

(assert (=> b!560036 (= res!351208 (= (select (arr!16888 (array!35176 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118))) (index!23401 lt!254554)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322667 () Bool)

(assert (=> b!560036 (=> res!351208 e!322667)))

(declare-fun d!83919 () Bool)

(declare-fun e!322665 () Bool)

(assert (=> d!83919 e!322665))

(declare-fun c!64761 () Bool)

(assert (=> d!83919 (= c!64761 (and ((_ is Intermediate!5293) lt!254554) (undefined!6105 lt!254554)))))

(declare-fun e!322664 () SeekEntryResult!5293)

(assert (=> d!83919 (= lt!254554 e!322664)))

(declare-fun c!64762 () Bool)

(assert (=> d!83919 (= c!64762 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!254553 () (_ BitVec 64))

(assert (=> d!83919 (= lt!254553 (select (arr!16888 (array!35176 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118))) lt!254436))))

(assert (=> d!83919 (validMask!0 mask!3119)))

(assert (=> d!83919 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254436 lt!254441 (array!35176 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118)) mask!3119) lt!254554)))

(declare-fun b!560037 () Bool)

(declare-fun e!322668 () SeekEntryResult!5293)

(assert (=> b!560037 (= e!322664 e!322668)))

(declare-fun c!64763 () Bool)

(assert (=> b!560037 (= c!64763 (or (= lt!254553 lt!254441) (= (bvadd lt!254553 lt!254553) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!560038 () Bool)

(assert (=> b!560038 (= e!322668 (Intermediate!5293 false lt!254436 #b00000000000000000000000000000000))))

(declare-fun b!560039 () Bool)

(assert (=> b!560039 (= e!322665 (bvsge (x!52462 lt!254554) #b01111111111111111111111111111110))))

(declare-fun b!560040 () Bool)

(assert (=> b!560040 (= e!322668 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254436 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) lt!254441 (array!35176 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118)) mask!3119))))

(declare-fun b!560041 () Bool)

(assert (=> b!560041 (and (bvsge (index!23401 lt!254554) #b00000000000000000000000000000000) (bvslt (index!23401 lt!254554) (size!17252 (array!35176 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118)))))))

(declare-fun res!351207 () Bool)

(assert (=> b!560041 (= res!351207 (= (select (arr!16888 (array!35176 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118))) (index!23401 lt!254554)) lt!254441))))

(assert (=> b!560041 (=> res!351207 e!322667)))

(declare-fun e!322666 () Bool)

(assert (=> b!560041 (= e!322666 e!322667)))

(declare-fun b!560042 () Bool)

(assert (=> b!560042 (and (bvsge (index!23401 lt!254554) #b00000000000000000000000000000000) (bvslt (index!23401 lt!254554) (size!17252 (array!35176 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118)))))))

(assert (=> b!560042 (= e!322667 (= (select (arr!16888 (array!35176 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118))) (index!23401 lt!254554)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!560043 () Bool)

(assert (=> b!560043 (= e!322665 e!322666)))

(declare-fun res!351206 () Bool)

(assert (=> b!560043 (= res!351206 (and ((_ is Intermediate!5293) lt!254554) (not (undefined!6105 lt!254554)) (bvslt (x!52462 lt!254554) #b01111111111111111111111111111110) (bvsge (x!52462 lt!254554) #b00000000000000000000000000000000) (bvsge (x!52462 lt!254554) #b00000000000000000000000000000000)))))

(assert (=> b!560043 (=> (not res!351206) (not e!322666))))

(declare-fun b!560044 () Bool)

(assert (=> b!560044 (= e!322664 (Intermediate!5293 true lt!254436 #b00000000000000000000000000000000))))

(assert (= (and d!83919 c!64762) b!560044))

(assert (= (and d!83919 (not c!64762)) b!560037))

(assert (= (and b!560037 c!64763) b!560038))

(assert (= (and b!560037 (not c!64763)) b!560040))

(assert (= (and d!83919 c!64761) b!560039))

(assert (= (and d!83919 (not c!64761)) b!560043))

(assert (= (and b!560043 res!351206) b!560041))

(assert (= (and b!560041 (not res!351207)) b!560036))

(assert (= (and b!560036 (not res!351208)) b!560042))

(declare-fun m!537959 () Bool)

(assert (=> b!560042 m!537959))

(assert (=> b!560036 m!537959))

(assert (=> b!560041 m!537959))

(declare-fun m!537961 () Bool)

(assert (=> b!560040 m!537961))

(assert (=> b!560040 m!537961))

(declare-fun m!537963 () Bool)

(assert (=> b!560040 m!537963))

(declare-fun m!537965 () Bool)

(assert (=> d!83919 m!537965))

(assert (=> d!83919 m!537765))

(assert (=> b!559785 d!83919))

(declare-fun b!560045 () Bool)

(declare-fun lt!254556 () SeekEntryResult!5293)

(assert (=> b!560045 (and (bvsge (index!23401 lt!254556) #b00000000000000000000000000000000) (bvslt (index!23401 lt!254556) (size!17252 a!3118)))))

(declare-fun res!351211 () Bool)

(assert (=> b!560045 (= res!351211 (= (select (arr!16888 a!3118) (index!23401 lt!254556)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322672 () Bool)

(assert (=> b!560045 (=> res!351211 e!322672)))

(declare-fun d!83929 () Bool)

(declare-fun e!322670 () Bool)

(assert (=> d!83929 e!322670))

(declare-fun c!64764 () Bool)

(assert (=> d!83929 (= c!64764 (and ((_ is Intermediate!5293) lt!254556) (undefined!6105 lt!254556)))))

(declare-fun e!322669 () SeekEntryResult!5293)

(assert (=> d!83929 (= lt!254556 e!322669)))

(declare-fun c!64765 () Bool)

(assert (=> d!83929 (= c!64765 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!254555 () (_ BitVec 64))

(assert (=> d!83929 (= lt!254555 (select (arr!16888 a!3118) lt!254438))))

(assert (=> d!83929 (validMask!0 mask!3119)))

(assert (=> d!83929 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254438 (select (arr!16888 a!3118) j!142) a!3118 mask!3119) lt!254556)))

(declare-fun b!560046 () Bool)

(declare-fun e!322673 () SeekEntryResult!5293)

(assert (=> b!560046 (= e!322669 e!322673)))

(declare-fun c!64766 () Bool)

(assert (=> b!560046 (= c!64766 (or (= lt!254555 (select (arr!16888 a!3118) j!142)) (= (bvadd lt!254555 lt!254555) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!560047 () Bool)

(assert (=> b!560047 (= e!322673 (Intermediate!5293 false lt!254438 #b00000000000000000000000000000000))))

(declare-fun b!560048 () Bool)

(assert (=> b!560048 (= e!322670 (bvsge (x!52462 lt!254556) #b01111111111111111111111111111110))))

(declare-fun b!560049 () Bool)

(assert (=> b!560049 (= e!322673 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254438 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!16888 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!560050 () Bool)

(assert (=> b!560050 (and (bvsge (index!23401 lt!254556) #b00000000000000000000000000000000) (bvslt (index!23401 lt!254556) (size!17252 a!3118)))))

(declare-fun res!351210 () Bool)

(assert (=> b!560050 (= res!351210 (= (select (arr!16888 a!3118) (index!23401 lt!254556)) (select (arr!16888 a!3118) j!142)))))

(assert (=> b!560050 (=> res!351210 e!322672)))

(declare-fun e!322671 () Bool)

(assert (=> b!560050 (= e!322671 e!322672)))

(declare-fun b!560051 () Bool)

(assert (=> b!560051 (and (bvsge (index!23401 lt!254556) #b00000000000000000000000000000000) (bvslt (index!23401 lt!254556) (size!17252 a!3118)))))

(assert (=> b!560051 (= e!322672 (= (select (arr!16888 a!3118) (index!23401 lt!254556)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!560052 () Bool)

(assert (=> b!560052 (= e!322670 e!322671)))

(declare-fun res!351209 () Bool)

(assert (=> b!560052 (= res!351209 (and ((_ is Intermediate!5293) lt!254556) (not (undefined!6105 lt!254556)) (bvslt (x!52462 lt!254556) #b01111111111111111111111111111110) (bvsge (x!52462 lt!254556) #b00000000000000000000000000000000) (bvsge (x!52462 lt!254556) #b00000000000000000000000000000000)))))

(assert (=> b!560052 (=> (not res!351209) (not e!322671))))

(declare-fun b!560053 () Bool)

(assert (=> b!560053 (= e!322669 (Intermediate!5293 true lt!254438 #b00000000000000000000000000000000))))

(assert (= (and d!83929 c!64765) b!560053))

(assert (= (and d!83929 (not c!64765)) b!560046))

(assert (= (and b!560046 c!64766) b!560047))

(assert (= (and b!560046 (not c!64766)) b!560049))

(assert (= (and d!83929 c!64764) b!560048))

(assert (= (and d!83929 (not c!64764)) b!560052))

(assert (= (and b!560052 res!351209) b!560050))

(assert (= (and b!560050 (not res!351210)) b!560045))

(assert (= (and b!560045 (not res!351211)) b!560051))

(declare-fun m!537967 () Bool)

(assert (=> b!560051 m!537967))

(assert (=> b!560045 m!537967))

(assert (=> b!560050 m!537967))

(declare-fun m!537969 () Bool)

(assert (=> b!560049 m!537969))

(assert (=> b!560049 m!537969))

(assert (=> b!560049 m!537751))

(declare-fun m!537971 () Bool)

(assert (=> b!560049 m!537971))

(declare-fun m!537973 () Bool)

(assert (=> d!83929 m!537973))

(assert (=> d!83929 m!537765))

(assert (=> b!559785 d!83929))

(declare-fun d!83931 () Bool)

(declare-fun lt!254562 () (_ BitVec 32))

(declare-fun lt!254561 () (_ BitVec 32))

(assert (=> d!83931 (= lt!254562 (bvmul (bvxor lt!254561 (bvlshr lt!254561 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83931 (= lt!254561 ((_ extract 31 0) (bvand (bvxor lt!254441 (bvlshr lt!254441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83931 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!351212 (let ((h!11877 ((_ extract 31 0) (bvand (bvxor lt!254441 (bvlshr lt!254441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52469 (bvmul (bvxor h!11877 (bvlshr h!11877 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52469 (bvlshr x!52469 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!351212 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!351212 #b00000000000000000000000000000000))))))

(assert (=> d!83931 (= (toIndex!0 lt!254441 mask!3119) (bvand (bvxor lt!254562 (bvlshr lt!254562 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!559785 d!83931))

(declare-fun d!83933 () Bool)

(declare-fun lt!254564 () (_ BitVec 32))

(declare-fun lt!254563 () (_ BitVec 32))

(assert (=> d!83933 (= lt!254564 (bvmul (bvxor lt!254563 (bvlshr lt!254563 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83933 (= lt!254563 ((_ extract 31 0) (bvand (bvxor (select (arr!16888 a!3118) j!142) (bvlshr (select (arr!16888 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83933 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!351212 (let ((h!11877 ((_ extract 31 0) (bvand (bvxor (select (arr!16888 a!3118) j!142) (bvlshr (select (arr!16888 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52469 (bvmul (bvxor h!11877 (bvlshr h!11877 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52469 (bvlshr x!52469 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!351212 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!351212 #b00000000000000000000000000000000))))))

(assert (=> d!83933 (= (toIndex!0 (select (arr!16888 a!3118) j!142) mask!3119) (bvand (bvxor lt!254564 (bvlshr lt!254564 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!559785 d!83933))

(declare-fun d!83935 () Bool)

(assert (=> d!83935 (= (validKeyInArray!0 (select (arr!16888 a!3118) j!142)) (and (not (= (select (arr!16888 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16888 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559784 d!83935))

(declare-fun b!560054 () Bool)

(declare-fun e!322675 () SeekEntryResult!5293)

(declare-fun e!322674 () SeekEntryResult!5293)

(assert (=> b!560054 (= e!322675 e!322674)))

(declare-fun lt!254565 () (_ BitVec 64))

(declare-fun lt!254566 () SeekEntryResult!5293)

(assert (=> b!560054 (= lt!254565 (select (arr!16888 a!3118) (index!23401 lt!254566)))))

(declare-fun c!64767 () Bool)

(assert (=> b!560054 (= c!64767 (= lt!254565 k0!1914))))

(declare-fun e!322676 () SeekEntryResult!5293)

(declare-fun b!560055 () Bool)

(assert (=> b!560055 (= e!322676 (seekKeyOrZeroReturnVacant!0 (x!52462 lt!254566) (index!23401 lt!254566) (index!23401 lt!254566) k0!1914 a!3118 mask!3119))))

(declare-fun b!560056 () Bool)

(assert (=> b!560056 (= e!322675 Undefined!5293)))

(declare-fun b!560057 () Bool)

(assert (=> b!560057 (= e!322674 (Found!5293 (index!23401 lt!254566)))))

(declare-fun b!560058 () Bool)

(declare-fun c!64768 () Bool)

(assert (=> b!560058 (= c!64768 (= lt!254565 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!560058 (= e!322674 e!322676)))

(declare-fun b!560059 () Bool)

(assert (=> b!560059 (= e!322676 (MissingZero!5293 (index!23401 lt!254566)))))

(declare-fun d!83937 () Bool)

(declare-fun lt!254567 () SeekEntryResult!5293)

(assert (=> d!83937 (and (or ((_ is Undefined!5293) lt!254567) (not ((_ is Found!5293) lt!254567)) (and (bvsge (index!23400 lt!254567) #b00000000000000000000000000000000) (bvslt (index!23400 lt!254567) (size!17252 a!3118)))) (or ((_ is Undefined!5293) lt!254567) ((_ is Found!5293) lt!254567) (not ((_ is MissingZero!5293) lt!254567)) (and (bvsge (index!23399 lt!254567) #b00000000000000000000000000000000) (bvslt (index!23399 lt!254567) (size!17252 a!3118)))) (or ((_ is Undefined!5293) lt!254567) ((_ is Found!5293) lt!254567) ((_ is MissingZero!5293) lt!254567) (not ((_ is MissingVacant!5293) lt!254567)) (and (bvsge (index!23402 lt!254567) #b00000000000000000000000000000000) (bvslt (index!23402 lt!254567) (size!17252 a!3118)))) (or ((_ is Undefined!5293) lt!254567) (ite ((_ is Found!5293) lt!254567) (= (select (arr!16888 a!3118) (index!23400 lt!254567)) k0!1914) (ite ((_ is MissingZero!5293) lt!254567) (= (select (arr!16888 a!3118) (index!23399 lt!254567)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5293) lt!254567) (= (select (arr!16888 a!3118) (index!23402 lt!254567)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83937 (= lt!254567 e!322675)))

(declare-fun c!64769 () Bool)

(assert (=> d!83937 (= c!64769 (and ((_ is Intermediate!5293) lt!254566) (undefined!6105 lt!254566)))))

(assert (=> d!83937 (= lt!254566 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83937 (validMask!0 mask!3119)))

(assert (=> d!83937 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!254567)))

(assert (= (and d!83937 c!64769) b!560056))

(assert (= (and d!83937 (not c!64769)) b!560054))

(assert (= (and b!560054 c!64767) b!560057))

(assert (= (and b!560054 (not c!64767)) b!560058))

(assert (= (and b!560058 c!64768) b!560059))

(assert (= (and b!560058 (not c!64768)) b!560055))

(declare-fun m!537975 () Bool)

(assert (=> b!560054 m!537975))

(declare-fun m!537977 () Bool)

(assert (=> b!560055 m!537977))

(declare-fun m!537979 () Bool)

(assert (=> d!83937 m!537979))

(declare-fun m!537981 () Bool)

(assert (=> d!83937 m!537981))

(assert (=> d!83937 m!537765))

(declare-fun m!537983 () Bool)

(assert (=> d!83937 m!537983))

(declare-fun m!537985 () Bool)

(assert (=> d!83937 m!537985))

(assert (=> d!83937 m!537981))

(declare-fun m!537987 () Bool)

(assert (=> d!83937 m!537987))

(assert (=> b!559795 d!83937))

(declare-fun d!83939 () Bool)

(declare-fun res!351213 () Bool)

(declare-fun e!322677 () Bool)

(assert (=> d!83939 (=> res!351213 e!322677)))

(assert (=> d!83939 (= res!351213 (bvsge #b00000000000000000000000000000000 (size!17252 a!3118)))))

(assert (=> d!83939 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!322677)))

(declare-fun bm!32452 () Bool)

(declare-fun call!32455 () Bool)

(assert (=> bm!32452 (= call!32455 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!560060 () Bool)

(declare-fun e!322678 () Bool)

(declare-fun e!322679 () Bool)

(assert (=> b!560060 (= e!322678 e!322679)))

(declare-fun lt!254570 () (_ BitVec 64))

(assert (=> b!560060 (= lt!254570 (select (arr!16888 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!254568 () Unit!17431)

(assert (=> b!560060 (= lt!254568 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254570 #b00000000000000000000000000000000))))

(assert (=> b!560060 (arrayContainsKey!0 a!3118 lt!254570 #b00000000000000000000000000000000)))

(declare-fun lt!254569 () Unit!17431)

(assert (=> b!560060 (= lt!254569 lt!254568)))

(declare-fun res!351214 () Bool)

(assert (=> b!560060 (= res!351214 (= (seekEntryOrOpen!0 (select (arr!16888 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5293 #b00000000000000000000000000000000)))))

(assert (=> b!560060 (=> (not res!351214) (not e!322679))))

(declare-fun b!560061 () Bool)

(assert (=> b!560061 (= e!322678 call!32455)))

(declare-fun b!560062 () Bool)

(assert (=> b!560062 (= e!322677 e!322678)))

(declare-fun c!64770 () Bool)

(assert (=> b!560062 (= c!64770 (validKeyInArray!0 (select (arr!16888 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!560063 () Bool)

(assert (=> b!560063 (= e!322679 call!32455)))

(assert (= (and d!83939 (not res!351213)) b!560062))

(assert (= (and b!560062 c!64770) b!560060))

(assert (= (and b!560062 (not c!64770)) b!560061))

(assert (= (and b!560060 res!351214) b!560063))

(assert (= (or b!560063 b!560061) bm!32452))

(declare-fun m!537989 () Bool)

(assert (=> bm!32452 m!537989))

(assert (=> b!560060 m!537907))

(declare-fun m!537991 () Bool)

(assert (=> b!560060 m!537991))

(declare-fun m!537993 () Bool)

(assert (=> b!560060 m!537993))

(assert (=> b!560060 m!537907))

(declare-fun m!537995 () Bool)

(assert (=> b!560060 m!537995))

(assert (=> b!560062 m!537907))

(assert (=> b!560062 m!537907))

(assert (=> b!560062 m!537941))

(assert (=> b!559786 d!83939))

(check-sat (not b!559998) (not b!559997) (not d!83919) (not b!560049) (not b!560040) (not b!560060) (not bm!32441) (not b!559943) (not b!559902) (not b!559996) (not d!83889) (not b!559881) (not b!560062) (not bm!32448) (not d!83937) (not b!560055) (not d!83929) (not b!559904) (not b!559915) (not d!83895) (not d!83901) (not bm!32452))
(check-sat)
