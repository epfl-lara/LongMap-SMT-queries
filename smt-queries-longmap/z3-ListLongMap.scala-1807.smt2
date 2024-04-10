; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32598 () Bool)

(assert start!32598)

(declare-fun b!325834 () Bool)

(declare-fun e!200768 () Bool)

(declare-fun e!200770 () Bool)

(assert (=> b!325834 (= e!200768 e!200770)))

(declare-fun res!179025 () Bool)

(assert (=> b!325834 (=> (not res!179025) (not e!200770))))

(declare-datatypes ((array!16686 0))(
  ( (array!16687 (arr!7899 (Array (_ BitVec 32) (_ BitVec 64))) (size!8251 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16686)

(declare-datatypes ((SeekEntryResult!3030 0))(
  ( (MissingZero!3030 (index!14296 (_ BitVec 32))) (Found!3030 (index!14297 (_ BitVec 32))) (Intermediate!3030 (undefined!3842 Bool) (index!14298 (_ BitVec 32)) (x!32539 (_ BitVec 32))) (Undefined!3030) (MissingVacant!3030 (index!14299 (_ BitVec 32))) )
))
(declare-fun lt!157143 () SeekEntryResult!3030)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16686 (_ BitVec 32)) SeekEntryResult!3030)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325834 (= res!179025 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157143))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325834 (= lt!157143 (Intermediate!3030 false resIndex!58 resX!58))))

(declare-fun b!325835 () Bool)

(declare-fun res!179027 () Bool)

(assert (=> b!325835 (=> (not res!179027) (not e!200768))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325835 (= res!179027 (and (= (size!8251 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8251 a!3305))))))

(declare-fun b!325836 () Bool)

(declare-fun res!179024 () Bool)

(assert (=> b!325836 (=> (not res!179024) (not e!200768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16686 (_ BitVec 32)) Bool)

(assert (=> b!325836 (= res!179024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun lt!157142 () (_ BitVec 32))

(declare-fun b!325837 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun e!200767 () Bool)

(assert (=> b!325837 (= e!200767 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) lt!157142 k0!2497 a!3305 mask!3777) lt!157143)))))

(declare-fun b!325838 () Bool)

(declare-fun res!179028 () Bool)

(assert (=> b!325838 (=> (not res!179028) (not e!200768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325838 (= res!179028 (validKeyInArray!0 k0!2497))))

(declare-fun b!325839 () Bool)

(declare-fun res!179031 () Bool)

(assert (=> b!325839 (=> (not res!179031) (not e!200770))))

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!325839 (= res!179031 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157143))))

(declare-fun b!325841 () Bool)

(declare-fun res!179034 () Bool)

(assert (=> b!325841 (=> (not res!179034) (not e!200768))))

(declare-fun arrayContainsKey!0 (array!16686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325841 (= res!179034 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325842 () Bool)

(declare-fun res!179029 () Bool)

(assert (=> b!325842 (=> (not res!179029) (not e!200770))))

(assert (=> b!325842 (= res!179029 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7899 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun res!179033 () Bool)

(assert (=> start!32598 (=> (not res!179033) (not e!200768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32598 (= res!179033 (validMask!0 mask!3777))))

(assert (=> start!32598 e!200768))

(declare-fun array_inv!5862 (array!16686) Bool)

(assert (=> start!32598 (array_inv!5862 a!3305)))

(assert (=> start!32598 true))

(declare-fun b!325840 () Bool)

(assert (=> b!325840 (= e!200770 e!200767)))

(declare-fun res!179030 () Bool)

(assert (=> b!325840 (=> (not res!179030) (not e!200767))))

(assert (=> b!325840 (= res!179030 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1490) resX!58) (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000) (bvsge lt!157142 #b00000000000000000000000000000000) (bvslt lt!157142 (size!8251 a!3305))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325840 (= lt!157142 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325843 () Bool)

(declare-fun res!179032 () Bool)

(assert (=> b!325843 (=> (not res!179032) (not e!200768))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16686 (_ BitVec 32)) SeekEntryResult!3030)

(assert (=> b!325843 (= res!179032 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3030 i!1250)))))

(declare-fun b!325844 () Bool)

(declare-fun res!179026 () Bool)

(assert (=> b!325844 (=> (not res!179026) (not e!200770))))

(assert (=> b!325844 (= res!179026 (and (= (select (arr!7899 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8251 a!3305))))))

(assert (= (and start!32598 res!179033) b!325835))

(assert (= (and b!325835 res!179027) b!325838))

(assert (= (and b!325838 res!179028) b!325841))

(assert (= (and b!325841 res!179034) b!325843))

(assert (= (and b!325843 res!179032) b!325836))

(assert (= (and b!325836 res!179024) b!325834))

(assert (= (and b!325834 res!179025) b!325844))

(assert (= (and b!325844 res!179026) b!325839))

(assert (= (and b!325839 res!179031) b!325842))

(assert (= (and b!325842 res!179029) b!325840))

(assert (= (and b!325840 res!179030) b!325837))

(declare-fun m!332539 () Bool)

(assert (=> b!325839 m!332539))

(declare-fun m!332541 () Bool)

(assert (=> b!325844 m!332541))

(declare-fun m!332543 () Bool)

(assert (=> b!325836 m!332543))

(declare-fun m!332545 () Bool)

(assert (=> b!325837 m!332545))

(declare-fun m!332547 () Bool)

(assert (=> b!325840 m!332547))

(declare-fun m!332549 () Bool)

(assert (=> b!325842 m!332549))

(declare-fun m!332551 () Bool)

(assert (=> b!325834 m!332551))

(assert (=> b!325834 m!332551))

(declare-fun m!332553 () Bool)

(assert (=> b!325834 m!332553))

(declare-fun m!332555 () Bool)

(assert (=> b!325841 m!332555))

(declare-fun m!332557 () Bool)

(assert (=> b!325843 m!332557))

(declare-fun m!332559 () Bool)

(assert (=> b!325838 m!332559))

(declare-fun m!332561 () Bool)

(assert (=> start!32598 m!332561))

(declare-fun m!332563 () Bool)

(assert (=> start!32598 m!332563))

(check-sat (not b!325834) (not b!325841) (not b!325837) (not b!325840) (not start!32598) (not b!325843) (not b!325838) (not b!325839) (not b!325836))
(check-sat)
(get-model)

(declare-fun d!69711 () Bool)

(declare-fun res!179072 () Bool)

(declare-fun e!200787 () Bool)

(assert (=> d!69711 (=> res!179072 e!200787)))

(assert (=> d!69711 (= res!179072 (= (select (arr!7899 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69711 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!200787)))

(declare-fun b!325882 () Bool)

(declare-fun e!200788 () Bool)

(assert (=> b!325882 (= e!200787 e!200788)))

(declare-fun res!179073 () Bool)

(assert (=> b!325882 (=> (not res!179073) (not e!200788))))

(assert (=> b!325882 (= res!179073 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8251 a!3305)))))

(declare-fun b!325883 () Bool)

(assert (=> b!325883 (= e!200788 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69711 (not res!179072)) b!325882))

(assert (= (and b!325882 res!179073) b!325883))

(declare-fun m!332591 () Bool)

(assert (=> d!69711 m!332591))

(declare-fun m!332593 () Bool)

(assert (=> b!325883 m!332593))

(assert (=> b!325841 d!69711))

(declare-fun b!325892 () Bool)

(declare-fun e!200796 () Bool)

(declare-fun e!200795 () Bool)

(assert (=> b!325892 (= e!200796 e!200795)))

(declare-fun lt!157158 () (_ BitVec 64))

(assert (=> b!325892 (= lt!157158 (select (arr!7899 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10092 0))(
  ( (Unit!10093) )
))
(declare-fun lt!157157 () Unit!10092)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16686 (_ BitVec 64) (_ BitVec 32)) Unit!10092)

(assert (=> b!325892 (= lt!157157 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157158 #b00000000000000000000000000000000))))

(assert (=> b!325892 (arrayContainsKey!0 a!3305 lt!157158 #b00000000000000000000000000000000)))

(declare-fun lt!157156 () Unit!10092)

(assert (=> b!325892 (= lt!157156 lt!157157)))

(declare-fun res!179079 () Bool)

(assert (=> b!325892 (= res!179079 (= (seekEntryOrOpen!0 (select (arr!7899 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3030 #b00000000000000000000000000000000)))))

(assert (=> b!325892 (=> (not res!179079) (not e!200795))))

(declare-fun b!325893 () Bool)

(declare-fun e!200797 () Bool)

(assert (=> b!325893 (= e!200797 e!200796)))

(declare-fun c!51036 () Bool)

(assert (=> b!325893 (= c!51036 (validKeyInArray!0 (select (arr!7899 a!3305) #b00000000000000000000000000000000)))))

(declare-fun d!69713 () Bool)

(declare-fun res!179078 () Bool)

(assert (=> d!69713 (=> res!179078 e!200797)))

(assert (=> d!69713 (= res!179078 (bvsge #b00000000000000000000000000000000 (size!8251 a!3305)))))

(assert (=> d!69713 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!200797)))

(declare-fun b!325894 () Bool)

(declare-fun call!26083 () Bool)

(assert (=> b!325894 (= e!200795 call!26083)))

(declare-fun bm!26080 () Bool)

(assert (=> bm!26080 (= call!26083 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!325895 () Bool)

(assert (=> b!325895 (= e!200796 call!26083)))

(assert (= (and d!69713 (not res!179078)) b!325893))

(assert (= (and b!325893 c!51036) b!325892))

(assert (= (and b!325893 (not c!51036)) b!325895))

(assert (= (and b!325892 res!179079) b!325894))

(assert (= (or b!325894 b!325895) bm!26080))

(assert (=> b!325892 m!332591))

(declare-fun m!332595 () Bool)

(assert (=> b!325892 m!332595))

(declare-fun m!332597 () Bool)

(assert (=> b!325892 m!332597))

(assert (=> b!325892 m!332591))

(declare-fun m!332599 () Bool)

(assert (=> b!325892 m!332599))

(assert (=> b!325893 m!332591))

(assert (=> b!325893 m!332591))

(declare-fun m!332601 () Bool)

(assert (=> b!325893 m!332601))

(declare-fun m!332603 () Bool)

(assert (=> bm!26080 m!332603))

(assert (=> b!325836 d!69713))

(declare-fun d!69717 () Bool)

(assert (=> d!69717 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32598 d!69717))

(declare-fun d!69725 () Bool)

(assert (=> d!69725 (= (array_inv!5862 a!3305) (bvsge (size!8251 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32598 d!69725))

(declare-fun d!69727 () Bool)

(declare-fun lt!157168 () (_ BitVec 32))

(assert (=> d!69727 (and (bvsge lt!157168 #b00000000000000000000000000000000) (bvslt lt!157168 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69727 (= lt!157168 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!69727 (validMask!0 mask!3777)))

(assert (=> d!69727 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!157168)))

(declare-fun bs!11334 () Bool)

(assert (= bs!11334 d!69727))

(declare-fun m!332607 () Bool)

(assert (=> bs!11334 m!332607))

(assert (=> bs!11334 m!332561))

(assert (=> b!325840 d!69727))

(declare-fun b!325974 () Bool)

(declare-fun lt!157190 () SeekEntryResult!3030)

(assert (=> b!325974 (and (bvsge (index!14298 lt!157190) #b00000000000000000000000000000000) (bvslt (index!14298 lt!157190) (size!8251 a!3305)))))

(declare-fun res!179105 () Bool)

(assert (=> b!325974 (= res!179105 (= (select (arr!7899 a!3305) (index!14298 lt!157190)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!200848 () Bool)

(assert (=> b!325974 (=> res!179105 e!200848)))

(declare-fun b!325975 () Bool)

(declare-fun e!200844 () SeekEntryResult!3030)

(assert (=> b!325975 (= e!200844 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!325976 () Bool)

(assert (=> b!325976 (and (bvsge (index!14298 lt!157190) #b00000000000000000000000000000000) (bvslt (index!14298 lt!157190) (size!8251 a!3305)))))

(assert (=> b!325976 (= e!200848 (= (select (arr!7899 a!3305) (index!14298 lt!157190)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325977 () Bool)

(declare-fun e!200846 () SeekEntryResult!3030)

(assert (=> b!325977 (= e!200846 (Intermediate!3030 true index!1840 x!1490))))

(declare-fun b!325973 () Bool)

(declare-fun e!200847 () Bool)

(declare-fun e!200845 () Bool)

(assert (=> b!325973 (= e!200847 e!200845)))

(declare-fun res!179106 () Bool)

(get-info :version)

(assert (=> b!325973 (= res!179106 (and ((_ is Intermediate!3030) lt!157190) (not (undefined!3842 lt!157190)) (bvslt (x!32539 lt!157190) #b01111111111111111111111111111110) (bvsge (x!32539 lt!157190) #b00000000000000000000000000000000) (bvsge (x!32539 lt!157190) x!1490)))))

(assert (=> b!325973 (=> (not res!179106) (not e!200845))))

(declare-fun d!69729 () Bool)

(assert (=> d!69729 e!200847))

(declare-fun c!51063 () Bool)

(assert (=> d!69729 (= c!51063 (and ((_ is Intermediate!3030) lt!157190) (undefined!3842 lt!157190)))))

(assert (=> d!69729 (= lt!157190 e!200846)))

(declare-fun c!51064 () Bool)

(assert (=> d!69729 (= c!51064 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157191 () (_ BitVec 64))

(assert (=> d!69729 (= lt!157191 (select (arr!7899 a!3305) index!1840))))

(assert (=> d!69729 (validMask!0 mask!3777)))

(assert (=> d!69729 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157190)))

(declare-fun b!325978 () Bool)

(assert (=> b!325978 (= e!200847 (bvsge (x!32539 lt!157190) #b01111111111111111111111111111110))))

(declare-fun b!325979 () Bool)

(assert (=> b!325979 (and (bvsge (index!14298 lt!157190) #b00000000000000000000000000000000) (bvslt (index!14298 lt!157190) (size!8251 a!3305)))))

(declare-fun res!179107 () Bool)

(assert (=> b!325979 (= res!179107 (= (select (arr!7899 a!3305) (index!14298 lt!157190)) k0!2497))))

(assert (=> b!325979 (=> res!179107 e!200848)))

(assert (=> b!325979 (= e!200845 e!200848)))

(declare-fun b!325980 () Bool)

(assert (=> b!325980 (= e!200844 (Intermediate!3030 false index!1840 x!1490))))

(declare-fun b!325981 () Bool)

(assert (=> b!325981 (= e!200846 e!200844)))

(declare-fun c!51065 () Bool)

(assert (=> b!325981 (= c!51065 (or (= lt!157191 k0!2497) (= (bvadd lt!157191 lt!157191) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!69729 c!51064) b!325977))

(assert (= (and d!69729 (not c!51064)) b!325981))

(assert (= (and b!325981 c!51065) b!325980))

(assert (= (and b!325981 (not c!51065)) b!325975))

(assert (= (and d!69729 c!51063) b!325978))

(assert (= (and d!69729 (not c!51063)) b!325973))

(assert (= (and b!325973 res!179106) b!325979))

(assert (= (and b!325979 (not res!179107)) b!325974))

(assert (= (and b!325974 (not res!179105)) b!325976))

(declare-fun m!332627 () Bool)

(assert (=> b!325976 m!332627))

(assert (=> b!325979 m!332627))

(assert (=> d!69729 m!332549))

(assert (=> d!69729 m!332561))

(assert (=> b!325974 m!332627))

(assert (=> b!325975 m!332547))

(assert (=> b!325975 m!332547))

(declare-fun m!332629 () Bool)

(assert (=> b!325975 m!332629))

(assert (=> b!325839 d!69729))

(declare-fun b!325983 () Bool)

(declare-fun lt!157192 () SeekEntryResult!3030)

(assert (=> b!325983 (and (bvsge (index!14298 lt!157192) #b00000000000000000000000000000000) (bvslt (index!14298 lt!157192) (size!8251 a!3305)))))

(declare-fun res!179108 () Bool)

(assert (=> b!325983 (= res!179108 (= (select (arr!7899 a!3305) (index!14298 lt!157192)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!200853 () Bool)

(assert (=> b!325983 (=> res!179108 e!200853)))

(declare-fun e!200849 () SeekEntryResult!3030)

(declare-fun b!325984 () Bool)

(assert (=> b!325984 (= e!200849 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!325985 () Bool)

(assert (=> b!325985 (and (bvsge (index!14298 lt!157192) #b00000000000000000000000000000000) (bvslt (index!14298 lt!157192) (size!8251 a!3305)))))

(assert (=> b!325985 (= e!200853 (= (select (arr!7899 a!3305) (index!14298 lt!157192)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325986 () Bool)

(declare-fun e!200851 () SeekEntryResult!3030)

(assert (=> b!325986 (= e!200851 (Intermediate!3030 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!325982 () Bool)

(declare-fun e!200852 () Bool)

(declare-fun e!200850 () Bool)

(assert (=> b!325982 (= e!200852 e!200850)))

(declare-fun res!179109 () Bool)

(assert (=> b!325982 (= res!179109 (and ((_ is Intermediate!3030) lt!157192) (not (undefined!3842 lt!157192)) (bvslt (x!32539 lt!157192) #b01111111111111111111111111111110) (bvsge (x!32539 lt!157192) #b00000000000000000000000000000000) (bvsge (x!32539 lt!157192) #b00000000000000000000000000000000)))))

(assert (=> b!325982 (=> (not res!179109) (not e!200850))))

(declare-fun d!69737 () Bool)

(assert (=> d!69737 e!200852))

(declare-fun c!51066 () Bool)

(assert (=> d!69737 (= c!51066 (and ((_ is Intermediate!3030) lt!157192) (undefined!3842 lt!157192)))))

(assert (=> d!69737 (= lt!157192 e!200851)))

(declare-fun c!51067 () Bool)

(assert (=> d!69737 (= c!51067 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157193 () (_ BitVec 64))

(assert (=> d!69737 (= lt!157193 (select (arr!7899 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69737 (validMask!0 mask!3777)))

(assert (=> d!69737 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157192)))

(declare-fun b!325987 () Bool)

(assert (=> b!325987 (= e!200852 (bvsge (x!32539 lt!157192) #b01111111111111111111111111111110))))

(declare-fun b!325988 () Bool)

(assert (=> b!325988 (and (bvsge (index!14298 lt!157192) #b00000000000000000000000000000000) (bvslt (index!14298 lt!157192) (size!8251 a!3305)))))

(declare-fun res!179110 () Bool)

(assert (=> b!325988 (= res!179110 (= (select (arr!7899 a!3305) (index!14298 lt!157192)) k0!2497))))

(assert (=> b!325988 (=> res!179110 e!200853)))

(assert (=> b!325988 (= e!200850 e!200853)))

(declare-fun b!325989 () Bool)

(assert (=> b!325989 (= e!200849 (Intermediate!3030 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!325990 () Bool)

(assert (=> b!325990 (= e!200851 e!200849)))

(declare-fun c!51068 () Bool)

(assert (=> b!325990 (= c!51068 (or (= lt!157193 k0!2497) (= (bvadd lt!157193 lt!157193) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!69737 c!51067) b!325986))

(assert (= (and d!69737 (not c!51067)) b!325990))

(assert (= (and b!325990 c!51068) b!325989))

(assert (= (and b!325990 (not c!51068)) b!325984))

(assert (= (and d!69737 c!51066) b!325987))

(assert (= (and d!69737 (not c!51066)) b!325982))

(assert (= (and b!325982 res!179109) b!325988))

(assert (= (and b!325988 (not res!179110)) b!325983))

(assert (= (and b!325983 (not res!179108)) b!325985))

(declare-fun m!332633 () Bool)

(assert (=> b!325985 m!332633))

(assert (=> b!325988 m!332633))

(assert (=> d!69737 m!332551))

(declare-fun m!332639 () Bool)

(assert (=> d!69737 m!332639))

(assert (=> d!69737 m!332561))

(assert (=> b!325983 m!332633))

(assert (=> b!325984 m!332551))

(declare-fun m!332643 () Bool)

(assert (=> b!325984 m!332643))

(assert (=> b!325984 m!332643))

(declare-fun m!332647 () Bool)

(assert (=> b!325984 m!332647))

(assert (=> b!325834 d!69737))

(declare-fun d!69741 () Bool)

(declare-fun lt!157206 () (_ BitVec 32))

(declare-fun lt!157205 () (_ BitVec 32))

(assert (=> d!69741 (= lt!157206 (bvmul (bvxor lt!157205 (bvlshr lt!157205 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69741 (= lt!157205 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69741 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!179113 (let ((h!5394 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32545 (bvmul (bvxor h!5394 (bvlshr h!5394 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32545 (bvlshr x!32545 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!179113 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!179113 #b00000000000000000000000000000000))))))

(assert (=> d!69741 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157206 (bvlshr lt!157206 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!325834 d!69741))

(declare-fun b!326004 () Bool)

(declare-fun lt!157207 () SeekEntryResult!3030)

(assert (=> b!326004 (and (bvsge (index!14298 lt!157207) #b00000000000000000000000000000000) (bvslt (index!14298 lt!157207) (size!8251 a!3305)))))

(declare-fun res!179114 () Bool)

(assert (=> b!326004 (= res!179114 (= (select (arr!7899 a!3305) (index!14298 lt!157207)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!200865 () Bool)

(assert (=> b!326004 (=> res!179114 e!200865)))

(declare-fun e!200861 () SeekEntryResult!3030)

(declare-fun b!326005 () Bool)

(assert (=> b!326005 (= e!200861 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 lt!157142 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!326006 () Bool)

(assert (=> b!326006 (and (bvsge (index!14298 lt!157207) #b00000000000000000000000000000000) (bvslt (index!14298 lt!157207) (size!8251 a!3305)))))

(assert (=> b!326006 (= e!200865 (= (select (arr!7899 a!3305) (index!14298 lt!157207)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!326007 () Bool)

(declare-fun e!200863 () SeekEntryResult!3030)

(assert (=> b!326007 (= e!200863 (Intermediate!3030 true lt!157142 (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!326003 () Bool)

(declare-fun e!200864 () Bool)

(declare-fun e!200862 () Bool)

(assert (=> b!326003 (= e!200864 e!200862)))

(declare-fun res!179115 () Bool)

(assert (=> b!326003 (= res!179115 (and ((_ is Intermediate!3030) lt!157207) (not (undefined!3842 lt!157207)) (bvslt (x!32539 lt!157207) #b01111111111111111111111111111110) (bvsge (x!32539 lt!157207) #b00000000000000000000000000000000) (bvsge (x!32539 lt!157207) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!326003 (=> (not res!179115) (not e!200862))))

(declare-fun d!69743 () Bool)

(assert (=> d!69743 e!200864))

(declare-fun c!51074 () Bool)

(assert (=> d!69743 (= c!51074 (and ((_ is Intermediate!3030) lt!157207) (undefined!3842 lt!157207)))))

(assert (=> d!69743 (= lt!157207 e!200863)))

(declare-fun c!51075 () Bool)

(assert (=> d!69743 (= c!51075 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(declare-fun lt!157208 () (_ BitVec 64))

(assert (=> d!69743 (= lt!157208 (select (arr!7899 a!3305) lt!157142))))

(assert (=> d!69743 (validMask!0 mask!3777)))

(assert (=> d!69743 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) lt!157142 k0!2497 a!3305 mask!3777) lt!157207)))

(declare-fun b!326008 () Bool)

(assert (=> b!326008 (= e!200864 (bvsge (x!32539 lt!157207) #b01111111111111111111111111111110))))

(declare-fun b!326009 () Bool)

(assert (=> b!326009 (and (bvsge (index!14298 lt!157207) #b00000000000000000000000000000000) (bvslt (index!14298 lt!157207) (size!8251 a!3305)))))

(declare-fun res!179116 () Bool)

(assert (=> b!326009 (= res!179116 (= (select (arr!7899 a!3305) (index!14298 lt!157207)) k0!2497))))

(assert (=> b!326009 (=> res!179116 e!200865)))

(assert (=> b!326009 (= e!200862 e!200865)))

(declare-fun b!326010 () Bool)

(assert (=> b!326010 (= e!200861 (Intermediate!3030 false lt!157142 (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!326011 () Bool)

(assert (=> b!326011 (= e!200863 e!200861)))

(declare-fun c!51076 () Bool)

(assert (=> b!326011 (= c!51076 (or (= lt!157208 k0!2497) (= (bvadd lt!157208 lt!157208) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!69743 c!51075) b!326007))

(assert (= (and d!69743 (not c!51075)) b!326011))

(assert (= (and b!326011 c!51076) b!326010))

(assert (= (and b!326011 (not c!51076)) b!326005))

(assert (= (and d!69743 c!51074) b!326008))

(assert (= (and d!69743 (not c!51074)) b!326003))

(assert (= (and b!326003 res!179115) b!326009))

(assert (= (and b!326009 (not res!179116)) b!326004))

(assert (= (and b!326004 (not res!179114)) b!326006))

(declare-fun m!332649 () Bool)

(assert (=> b!326006 m!332649))

(assert (=> b!326009 m!332649))

(declare-fun m!332651 () Bool)

(assert (=> d!69743 m!332651))

(assert (=> d!69743 m!332561))

(assert (=> b!326004 m!332649))

(declare-fun m!332653 () Bool)

(assert (=> b!326005 m!332653))

(assert (=> b!326005 m!332653))

(declare-fun m!332655 () Bool)

(assert (=> b!326005 m!332655))

(assert (=> b!325837 d!69743))

(declare-fun b!326076 () Bool)

(declare-fun lt!157241 () SeekEntryResult!3030)

(declare-fun e!200903 () SeekEntryResult!3030)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16686 (_ BitVec 32)) SeekEntryResult!3030)

(assert (=> b!326076 (= e!200903 (seekKeyOrZeroReturnVacant!0 (x!32539 lt!157241) (index!14298 lt!157241) (index!14298 lt!157241) k0!2497 a!3305 mask!3777))))

(declare-fun b!326077 () Bool)

(declare-fun c!51102 () Bool)

(declare-fun lt!157242 () (_ BitVec 64))

(assert (=> b!326077 (= c!51102 (= lt!157242 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!200904 () SeekEntryResult!3030)

(assert (=> b!326077 (= e!200904 e!200903)))

(declare-fun b!326079 () Bool)

(assert (=> b!326079 (= e!200904 (Found!3030 (index!14298 lt!157241)))))

(declare-fun b!326080 () Bool)

(declare-fun e!200905 () SeekEntryResult!3030)

(assert (=> b!326080 (= e!200905 Undefined!3030)))

(declare-fun b!326081 () Bool)

(assert (=> b!326081 (= e!200905 e!200904)))

(assert (=> b!326081 (= lt!157242 (select (arr!7899 a!3305) (index!14298 lt!157241)))))

(declare-fun c!51100 () Bool)

(assert (=> b!326081 (= c!51100 (= lt!157242 k0!2497))))

(declare-fun b!326078 () Bool)

(assert (=> b!326078 (= e!200903 (MissingZero!3030 (index!14298 lt!157241)))))

(declare-fun d!69745 () Bool)

(declare-fun lt!157240 () SeekEntryResult!3030)

(assert (=> d!69745 (and (or ((_ is Undefined!3030) lt!157240) (not ((_ is Found!3030) lt!157240)) (and (bvsge (index!14297 lt!157240) #b00000000000000000000000000000000) (bvslt (index!14297 lt!157240) (size!8251 a!3305)))) (or ((_ is Undefined!3030) lt!157240) ((_ is Found!3030) lt!157240) (not ((_ is MissingZero!3030) lt!157240)) (and (bvsge (index!14296 lt!157240) #b00000000000000000000000000000000) (bvslt (index!14296 lt!157240) (size!8251 a!3305)))) (or ((_ is Undefined!3030) lt!157240) ((_ is Found!3030) lt!157240) ((_ is MissingZero!3030) lt!157240) (not ((_ is MissingVacant!3030) lt!157240)) (and (bvsge (index!14299 lt!157240) #b00000000000000000000000000000000) (bvslt (index!14299 lt!157240) (size!8251 a!3305)))) (or ((_ is Undefined!3030) lt!157240) (ite ((_ is Found!3030) lt!157240) (= (select (arr!7899 a!3305) (index!14297 lt!157240)) k0!2497) (ite ((_ is MissingZero!3030) lt!157240) (= (select (arr!7899 a!3305) (index!14296 lt!157240)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3030) lt!157240) (= (select (arr!7899 a!3305) (index!14299 lt!157240)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69745 (= lt!157240 e!200905)))

(declare-fun c!51101 () Bool)

(assert (=> d!69745 (= c!51101 (and ((_ is Intermediate!3030) lt!157241) (undefined!3842 lt!157241)))))

(assert (=> d!69745 (= lt!157241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69745 (validMask!0 mask!3777)))

(assert (=> d!69745 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157240)))

(assert (= (and d!69745 c!51101) b!326080))

(assert (= (and d!69745 (not c!51101)) b!326081))

(assert (= (and b!326081 c!51100) b!326079))

(assert (= (and b!326081 (not c!51100)) b!326077))

(assert (= (and b!326077 c!51102) b!326078))

(assert (= (and b!326077 (not c!51102)) b!326076))

(declare-fun m!332685 () Bool)

(assert (=> b!326076 m!332685))

(declare-fun m!332687 () Bool)

(assert (=> b!326081 m!332687))

(assert (=> d!69745 m!332551))

(assert (=> d!69745 m!332553))

(assert (=> d!69745 m!332551))

(declare-fun m!332689 () Bool)

(assert (=> d!69745 m!332689))

(declare-fun m!332691 () Bool)

(assert (=> d!69745 m!332691))

(declare-fun m!332693 () Bool)

(assert (=> d!69745 m!332693))

(assert (=> d!69745 m!332561))

(assert (=> b!325843 d!69745))

(declare-fun d!69755 () Bool)

(assert (=> d!69755 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325838 d!69755))

(check-sat (not d!69727) (not b!325892) (not bm!26080) (not b!325975) (not d!69737) (not d!69745) (not b!325883) (not d!69743) (not b!325893) (not b!325984) (not b!326005) (not d!69729) (not b!326076))
(check-sat)
