; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32822 () Bool)

(assert start!32822)

(declare-fun b!327762 () Bool)

(declare-fun res!180562 () Bool)

(declare-fun e!201546 () Bool)

(assert (=> b!327762 (=> (not res!180562) (not e!201546))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327762 (= res!180562 (validKeyInArray!0 k0!2497))))

(declare-fun b!327763 () Bool)

(declare-fun res!180566 () Bool)

(declare-fun e!201544 () Bool)

(assert (=> b!327763 (=> (not res!180566) (not e!201544))))

(declare-datatypes ((array!16782 0))(
  ( (array!16783 (arr!7942 (Array (_ BitVec 32) (_ BitVec 64))) (size!8294 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16782)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!327763 (= res!180566 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7942 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7942 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7942 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!327764 () Bool)

(assert (=> b!327764 (= e!201546 e!201544)))

(declare-fun res!180565 () Bool)

(assert (=> b!327764 (=> (not res!180565) (not e!201544))))

(declare-datatypes ((SeekEntryResult!3038 0))(
  ( (MissingZero!3038 (index!14328 (_ BitVec 32))) (Found!3038 (index!14329 (_ BitVec 32))) (Intermediate!3038 (undefined!3850 Bool) (index!14330 (_ BitVec 32)) (x!32685 (_ BitVec 32))) (Undefined!3038) (MissingVacant!3038 (index!14331 (_ BitVec 32))) )
))
(declare-fun lt!157709 () SeekEntryResult!3038)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16782 (_ BitVec 32)) SeekEntryResult!3038)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327764 (= res!180565 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157709))))

(assert (=> b!327764 (= lt!157709 (Intermediate!3038 false resIndex!58 resX!58))))

(declare-fun b!327765 () Bool)

(declare-fun lt!157710 () SeekEntryResult!3038)

(get-info :version)

(assert (=> b!327765 (= e!201544 (and ((_ is Intermediate!3038) lt!157710) (bvslt (x!32685 lt!157710) (bvadd #b00000000000000000000000000000001 x!1490))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327765 (= lt!157710 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!327766 () Bool)

(declare-fun res!180567 () Bool)

(assert (=> b!327766 (=> (not res!180567) (not e!201544))))

(assert (=> b!327766 (= res!180567 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157709))))

(declare-fun res!180564 () Bool)

(assert (=> start!32822 (=> (not res!180564) (not e!201546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32822 (= res!180564 (validMask!0 mask!3777))))

(assert (=> start!32822 e!201546))

(declare-fun array_inv!5892 (array!16782) Bool)

(assert (=> start!32822 (array_inv!5892 a!3305)))

(assert (=> start!32822 true))

(declare-fun b!327767 () Bool)

(declare-fun res!180570 () Bool)

(assert (=> b!327767 (=> (not res!180570) (not e!201546))))

(declare-fun arrayContainsKey!0 (array!16782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327767 (= res!180570 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!327768 () Bool)

(declare-fun res!180569 () Bool)

(assert (=> b!327768 (=> (not res!180569) (not e!201544))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!327768 (= res!180569 (and (= (select (arr!7942 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8294 a!3305))))))

(declare-fun b!327769 () Bool)

(declare-fun res!180563 () Bool)

(assert (=> b!327769 (=> (not res!180563) (not e!201546))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16782 (_ BitVec 32)) SeekEntryResult!3038)

(assert (=> b!327769 (= res!180563 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3038 i!1250)))))

(declare-fun b!327770 () Bool)

(declare-fun res!180561 () Bool)

(assert (=> b!327770 (=> (not res!180561) (not e!201546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16782 (_ BitVec 32)) Bool)

(assert (=> b!327770 (= res!180561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!327771 () Bool)

(declare-fun res!180568 () Bool)

(assert (=> b!327771 (=> (not res!180568) (not e!201546))))

(assert (=> b!327771 (= res!180568 (and (= (size!8294 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8294 a!3305))))))

(assert (= (and start!32822 res!180564) b!327771))

(assert (= (and b!327771 res!180568) b!327762))

(assert (= (and b!327762 res!180562) b!327767))

(assert (= (and b!327767 res!180570) b!327769))

(assert (= (and b!327769 res!180563) b!327770))

(assert (= (and b!327770 res!180561) b!327764))

(assert (= (and b!327764 res!180565) b!327768))

(assert (= (and b!327768 res!180569) b!327766))

(assert (= (and b!327766 res!180567) b!327763))

(assert (= (and b!327763 res!180566) b!327765))

(declare-fun m!334219 () Bool)

(assert (=> b!327767 m!334219))

(declare-fun m!334221 () Bool)

(assert (=> b!327765 m!334221))

(assert (=> b!327765 m!334221))

(declare-fun m!334223 () Bool)

(assert (=> b!327765 m!334223))

(declare-fun m!334225 () Bool)

(assert (=> b!327764 m!334225))

(assert (=> b!327764 m!334225))

(declare-fun m!334227 () Bool)

(assert (=> b!327764 m!334227))

(declare-fun m!334229 () Bool)

(assert (=> b!327769 m!334229))

(declare-fun m!334231 () Bool)

(assert (=> b!327768 m!334231))

(declare-fun m!334233 () Bool)

(assert (=> b!327762 m!334233))

(declare-fun m!334235 () Bool)

(assert (=> start!32822 m!334235))

(declare-fun m!334237 () Bool)

(assert (=> start!32822 m!334237))

(declare-fun m!334239 () Bool)

(assert (=> b!327763 m!334239))

(declare-fun m!334241 () Bool)

(assert (=> b!327770 m!334241))

(declare-fun m!334243 () Bool)

(assert (=> b!327766 m!334243))

(check-sat (not b!327766) (not b!327770) (not b!327762) (not b!327767) (not start!32822) (not b!327765) (not b!327764) (not b!327769))
(check-sat)
(get-model)

(declare-fun d!69941 () Bool)

(declare-fun res!180635 () Bool)

(declare-fun e!201573 () Bool)

(assert (=> d!69941 (=> res!180635 e!201573)))

(assert (=> d!69941 (= res!180635 (bvsge #b00000000000000000000000000000000 (size!8294 a!3305)))))

(assert (=> d!69941 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201573)))

(declare-fun b!327840 () Bool)

(declare-fun e!201572 () Bool)

(assert (=> b!327840 (= e!201573 e!201572)))

(declare-fun c!51236 () Bool)

(assert (=> b!327840 (= c!51236 (validKeyInArray!0 (select (arr!7942 a!3305) #b00000000000000000000000000000000)))))

(declare-fun bm!26093 () Bool)

(declare-fun call!26096 () Bool)

(assert (=> bm!26093 (= call!26096 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!327841 () Bool)

(declare-fun e!201571 () Bool)

(assert (=> b!327841 (= e!201572 e!201571)))

(declare-fun lt!157730 () (_ BitVec 64))

(assert (=> b!327841 (= lt!157730 (select (arr!7942 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10144 0))(
  ( (Unit!10145) )
))
(declare-fun lt!157729 () Unit!10144)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16782 (_ BitVec 64) (_ BitVec 32)) Unit!10144)

(assert (=> b!327841 (= lt!157729 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157730 #b00000000000000000000000000000000))))

(assert (=> b!327841 (arrayContainsKey!0 a!3305 lt!157730 #b00000000000000000000000000000000)))

(declare-fun lt!157731 () Unit!10144)

(assert (=> b!327841 (= lt!157731 lt!157729)))

(declare-fun res!180636 () Bool)

(assert (=> b!327841 (= res!180636 (= (seekEntryOrOpen!0 (select (arr!7942 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3038 #b00000000000000000000000000000000)))))

(assert (=> b!327841 (=> (not res!180636) (not e!201571))))

(declare-fun b!327842 () Bool)

(assert (=> b!327842 (= e!201571 call!26096)))

(declare-fun b!327843 () Bool)

(assert (=> b!327843 (= e!201572 call!26096)))

(assert (= (and d!69941 (not res!180635)) b!327840))

(assert (= (and b!327840 c!51236) b!327841))

(assert (= (and b!327840 (not c!51236)) b!327843))

(assert (= (and b!327841 res!180636) b!327842))

(assert (= (or b!327842 b!327843) bm!26093))

(declare-fun m!334297 () Bool)

(assert (=> b!327840 m!334297))

(assert (=> b!327840 m!334297))

(declare-fun m!334299 () Bool)

(assert (=> b!327840 m!334299))

(declare-fun m!334301 () Bool)

(assert (=> bm!26093 m!334301))

(assert (=> b!327841 m!334297))

(declare-fun m!334303 () Bool)

(assert (=> b!327841 m!334303))

(declare-fun m!334305 () Bool)

(assert (=> b!327841 m!334305))

(assert (=> b!327841 m!334297))

(declare-fun m!334307 () Bool)

(assert (=> b!327841 m!334307))

(assert (=> b!327770 d!69941))

(declare-fun b!327880 () Bool)

(declare-fun lt!157740 () SeekEntryResult!3038)

(assert (=> b!327880 (and (bvsge (index!14330 lt!157740) #b00000000000000000000000000000000) (bvslt (index!14330 lt!157740) (size!8294 a!3305)))))

(declare-fun res!180651 () Bool)

(assert (=> b!327880 (= res!180651 (= (select (arr!7942 a!3305) (index!14330 lt!157740)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201597 () Bool)

(assert (=> b!327880 (=> res!180651 e!201597)))

(declare-fun b!327881 () Bool)

(declare-fun e!201599 () Bool)

(assert (=> b!327881 (= e!201599 (bvsge (x!32685 lt!157740) #b01111111111111111111111111111110))))

(declare-fun b!327882 () Bool)

(assert (=> b!327882 (and (bvsge (index!14330 lt!157740) #b00000000000000000000000000000000) (bvslt (index!14330 lt!157740) (size!8294 a!3305)))))

(assert (=> b!327882 (= e!201597 (= (select (arr!7942 a!3305) (index!14330 lt!157740)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!69943 () Bool)

(assert (=> d!69943 e!201599))

(declare-fun c!51249 () Bool)

(assert (=> d!69943 (= c!51249 (and ((_ is Intermediate!3038) lt!157740) (undefined!3850 lt!157740)))))

(declare-fun e!201598 () SeekEntryResult!3038)

(assert (=> d!69943 (= lt!157740 e!201598)))

(declare-fun c!51250 () Bool)

(assert (=> d!69943 (= c!51250 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(declare-fun lt!157741 () (_ BitVec 64))

(assert (=> d!69943 (= lt!157741 (select (arr!7942 a!3305) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777)))))

(assert (=> d!69943 (validMask!0 mask!3777)))

(assert (=> d!69943 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777) lt!157740)))

(declare-fun e!201596 () SeekEntryResult!3038)

(declare-fun b!327883 () Bool)

(assert (=> b!327883 (= e!201596 (Intermediate!3038 false (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!327884 () Bool)

(assert (=> b!327884 (= e!201596 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!327885 () Bool)

(assert (=> b!327885 (and (bvsge (index!14330 lt!157740) #b00000000000000000000000000000000) (bvslt (index!14330 lt!157740) (size!8294 a!3305)))))

(declare-fun res!180650 () Bool)

(assert (=> b!327885 (= res!180650 (= (select (arr!7942 a!3305) (index!14330 lt!157740)) k0!2497))))

(assert (=> b!327885 (=> res!180650 e!201597)))

(declare-fun e!201600 () Bool)

(assert (=> b!327885 (= e!201600 e!201597)))

(declare-fun b!327886 () Bool)

(assert (=> b!327886 (= e!201598 (Intermediate!3038 true (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!327887 () Bool)

(assert (=> b!327887 (= e!201599 e!201600)))

(declare-fun res!180649 () Bool)

(assert (=> b!327887 (= res!180649 (and ((_ is Intermediate!3038) lt!157740) (not (undefined!3850 lt!157740)) (bvslt (x!32685 lt!157740) #b01111111111111111111111111111110) (bvsge (x!32685 lt!157740) #b00000000000000000000000000000000) (bvsge (x!32685 lt!157740) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!327887 (=> (not res!180649) (not e!201600))))

(declare-fun b!327888 () Bool)

(assert (=> b!327888 (= e!201598 e!201596)))

(declare-fun c!51251 () Bool)

(assert (=> b!327888 (= c!51251 (or (= lt!157741 k0!2497) (= (bvadd lt!157741 lt!157741) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!69943 c!51250) b!327886))

(assert (= (and d!69943 (not c!51250)) b!327888))

(assert (= (and b!327888 c!51251) b!327883))

(assert (= (and b!327888 (not c!51251)) b!327884))

(assert (= (and d!69943 c!51249) b!327881))

(assert (= (and d!69943 (not c!51249)) b!327887))

(assert (= (and b!327887 res!180649) b!327885))

(assert (= (and b!327885 (not res!180650)) b!327880))

(assert (= (and b!327880 (not res!180651)) b!327882))

(declare-fun m!334313 () Bool)

(assert (=> b!327882 m!334313))

(assert (=> d!69943 m!334221))

(declare-fun m!334315 () Bool)

(assert (=> d!69943 m!334315))

(assert (=> d!69943 m!334235))

(assert (=> b!327885 m!334313))

(assert (=> b!327880 m!334313))

(assert (=> b!327884 m!334221))

(declare-fun m!334317 () Bool)

(assert (=> b!327884 m!334317))

(assert (=> b!327884 m!334317))

(declare-fun m!334319 () Bool)

(assert (=> b!327884 m!334319))

(assert (=> b!327765 d!69943))

(declare-fun d!69955 () Bool)

(declare-fun lt!157744 () (_ BitVec 32))

(assert (=> d!69955 (and (bvsge lt!157744 #b00000000000000000000000000000000) (bvslt lt!157744 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69955 (= lt!157744 (choose!52 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(assert (=> d!69955 (validMask!0 mask!3777)))

(assert (=> d!69955 (= (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) lt!157744)))

(declare-fun bs!11397 () Bool)

(assert (= bs!11397 d!69955))

(declare-fun m!334321 () Bool)

(assert (=> bs!11397 m!334321))

(assert (=> bs!11397 m!334235))

(assert (=> b!327765 d!69955))

(declare-fun d!69957 () Bool)

(assert (=> d!69957 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32822 d!69957))

(declare-fun d!69967 () Bool)

(assert (=> d!69967 (= (array_inv!5892 a!3305) (bvsge (size!8294 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32822 d!69967))

(declare-fun d!69969 () Bool)

(declare-fun lt!157793 () SeekEntryResult!3038)

(assert (=> d!69969 (and (or ((_ is Undefined!3038) lt!157793) (not ((_ is Found!3038) lt!157793)) (and (bvsge (index!14329 lt!157793) #b00000000000000000000000000000000) (bvslt (index!14329 lt!157793) (size!8294 a!3305)))) (or ((_ is Undefined!3038) lt!157793) ((_ is Found!3038) lt!157793) (not ((_ is MissingZero!3038) lt!157793)) (and (bvsge (index!14328 lt!157793) #b00000000000000000000000000000000) (bvslt (index!14328 lt!157793) (size!8294 a!3305)))) (or ((_ is Undefined!3038) lt!157793) ((_ is Found!3038) lt!157793) ((_ is MissingZero!3038) lt!157793) (not ((_ is MissingVacant!3038) lt!157793)) (and (bvsge (index!14331 lt!157793) #b00000000000000000000000000000000) (bvslt (index!14331 lt!157793) (size!8294 a!3305)))) (or ((_ is Undefined!3038) lt!157793) (ite ((_ is Found!3038) lt!157793) (= (select (arr!7942 a!3305) (index!14329 lt!157793)) k0!2497) (ite ((_ is MissingZero!3038) lt!157793) (= (select (arr!7942 a!3305) (index!14328 lt!157793)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3038) lt!157793) (= (select (arr!7942 a!3305) (index!14331 lt!157793)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!201662 () SeekEntryResult!3038)

(assert (=> d!69969 (= lt!157793 e!201662)))

(declare-fun c!51285 () Bool)

(declare-fun lt!157791 () SeekEntryResult!3038)

(assert (=> d!69969 (= c!51285 (and ((_ is Intermediate!3038) lt!157791) (undefined!3850 lt!157791)))))

(assert (=> d!69969 (= lt!157791 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69969 (validMask!0 mask!3777)))

(assert (=> d!69969 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157793)))

(declare-fun b!327991 () Bool)

(declare-fun c!51287 () Bool)

(declare-fun lt!157792 () (_ BitVec 64))

(assert (=> b!327991 (= c!51287 (= lt!157792 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201664 () SeekEntryResult!3038)

(declare-fun e!201663 () SeekEntryResult!3038)

(assert (=> b!327991 (= e!201664 e!201663)))

(declare-fun b!327992 () Bool)

(assert (=> b!327992 (= e!201662 e!201664)))

(assert (=> b!327992 (= lt!157792 (select (arr!7942 a!3305) (index!14330 lt!157791)))))

(declare-fun c!51286 () Bool)

(assert (=> b!327992 (= c!51286 (= lt!157792 k0!2497))))

(declare-fun b!327993 () Bool)

(assert (=> b!327993 (= e!201664 (Found!3038 (index!14330 lt!157791)))))

(declare-fun b!327994 () Bool)

(assert (=> b!327994 (= e!201662 Undefined!3038)))

(declare-fun b!327995 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16782 (_ BitVec 32)) SeekEntryResult!3038)

(assert (=> b!327995 (= e!201663 (seekKeyOrZeroReturnVacant!0 (x!32685 lt!157791) (index!14330 lt!157791) (index!14330 lt!157791) k0!2497 a!3305 mask!3777))))

(declare-fun b!327996 () Bool)

(assert (=> b!327996 (= e!201663 (MissingZero!3038 (index!14330 lt!157791)))))

(assert (= (and d!69969 c!51285) b!327994))

(assert (= (and d!69969 (not c!51285)) b!327992))

(assert (= (and b!327992 c!51286) b!327993))

(assert (= (and b!327992 (not c!51286)) b!327991))

(assert (= (and b!327991 c!51287) b!327996))

(assert (= (and b!327991 (not c!51287)) b!327995))

(assert (=> d!69969 m!334235))

(assert (=> d!69969 m!334225))

(assert (=> d!69969 m!334227))

(declare-fun m!334369 () Bool)

(assert (=> d!69969 m!334369))

(declare-fun m!334371 () Bool)

(assert (=> d!69969 m!334371))

(declare-fun m!334373 () Bool)

(assert (=> d!69969 m!334373))

(assert (=> d!69969 m!334225))

(declare-fun m!334375 () Bool)

(assert (=> b!327992 m!334375))

(declare-fun m!334377 () Bool)

(assert (=> b!327995 m!334377))

(assert (=> b!327769 d!69969))

(declare-fun b!328003 () Bool)

(declare-fun lt!157799 () SeekEntryResult!3038)

(assert (=> b!328003 (and (bvsge (index!14330 lt!157799) #b00000000000000000000000000000000) (bvslt (index!14330 lt!157799) (size!8294 a!3305)))))

(declare-fun res!180692 () Bool)

(assert (=> b!328003 (= res!180692 (= (select (arr!7942 a!3305) (index!14330 lt!157799)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201669 () Bool)

(assert (=> b!328003 (=> res!180692 e!201669)))

(declare-fun b!328004 () Bool)

(declare-fun e!201671 () Bool)

(assert (=> b!328004 (= e!201671 (bvsge (x!32685 lt!157799) #b01111111111111111111111111111110))))

(declare-fun b!328005 () Bool)

(assert (=> b!328005 (and (bvsge (index!14330 lt!157799) #b00000000000000000000000000000000) (bvslt (index!14330 lt!157799) (size!8294 a!3305)))))

(assert (=> b!328005 (= e!201669 (= (select (arr!7942 a!3305) (index!14330 lt!157799)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!69985 () Bool)

(assert (=> d!69985 e!201671))

(declare-fun c!51291 () Bool)

(assert (=> d!69985 (= c!51291 (and ((_ is Intermediate!3038) lt!157799) (undefined!3850 lt!157799)))))

(declare-fun e!201670 () SeekEntryResult!3038)

(assert (=> d!69985 (= lt!157799 e!201670)))

(declare-fun c!51292 () Bool)

(assert (=> d!69985 (= c!51292 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157800 () (_ BitVec 64))

(assert (=> d!69985 (= lt!157800 (select (arr!7942 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69985 (validMask!0 mask!3777)))

(assert (=> d!69985 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157799)))

(declare-fun b!328006 () Bool)

(declare-fun e!201668 () SeekEntryResult!3038)

(assert (=> b!328006 (= e!201668 (Intermediate!3038 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328007 () Bool)

(assert (=> b!328007 (= e!201668 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!328008 () Bool)

(assert (=> b!328008 (and (bvsge (index!14330 lt!157799) #b00000000000000000000000000000000) (bvslt (index!14330 lt!157799) (size!8294 a!3305)))))

(declare-fun res!180691 () Bool)

(assert (=> b!328008 (= res!180691 (= (select (arr!7942 a!3305) (index!14330 lt!157799)) k0!2497))))

(assert (=> b!328008 (=> res!180691 e!201669)))

(declare-fun e!201672 () Bool)

(assert (=> b!328008 (= e!201672 e!201669)))

(declare-fun b!328009 () Bool)

(assert (=> b!328009 (= e!201670 (Intermediate!3038 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328010 () Bool)

(assert (=> b!328010 (= e!201671 e!201672)))

(declare-fun res!180690 () Bool)

(assert (=> b!328010 (= res!180690 (and ((_ is Intermediate!3038) lt!157799) (not (undefined!3850 lt!157799)) (bvslt (x!32685 lt!157799) #b01111111111111111111111111111110) (bvsge (x!32685 lt!157799) #b00000000000000000000000000000000) (bvsge (x!32685 lt!157799) #b00000000000000000000000000000000)))))

(assert (=> b!328010 (=> (not res!180690) (not e!201672))))

(declare-fun b!328011 () Bool)

(assert (=> b!328011 (= e!201670 e!201668)))

(declare-fun c!51293 () Bool)

(assert (=> b!328011 (= c!51293 (or (= lt!157800 k0!2497) (= (bvadd lt!157800 lt!157800) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!69985 c!51292) b!328009))

(assert (= (and d!69985 (not c!51292)) b!328011))

(assert (= (and b!328011 c!51293) b!328006))

(assert (= (and b!328011 (not c!51293)) b!328007))

(assert (= (and d!69985 c!51291) b!328004))

(assert (= (and d!69985 (not c!51291)) b!328010))

(assert (= (and b!328010 res!180690) b!328008))

(assert (= (and b!328008 (not res!180691)) b!328003))

(assert (= (and b!328003 (not res!180692)) b!328005))

(declare-fun m!334389 () Bool)

(assert (=> b!328005 m!334389))

(assert (=> d!69985 m!334225))

(declare-fun m!334391 () Bool)

(assert (=> d!69985 m!334391))

(assert (=> d!69985 m!334235))

(assert (=> b!328008 m!334389))

(assert (=> b!328003 m!334389))

(assert (=> b!328007 m!334225))

(declare-fun m!334393 () Bool)

(assert (=> b!328007 m!334393))

(assert (=> b!328007 m!334393))

(declare-fun m!334395 () Bool)

(assert (=> b!328007 m!334395))

(assert (=> b!327764 d!69985))

(declare-fun d!69989 () Bool)

(declare-fun lt!157806 () (_ BitVec 32))

(declare-fun lt!157805 () (_ BitVec 32))

(assert (=> d!69989 (= lt!157806 (bvmul (bvxor lt!157805 (bvlshr lt!157805 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69989 (= lt!157805 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69989 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180693 (let ((h!5317 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32695 (bvmul (bvxor h!5317 (bvlshr h!5317 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32695 (bvlshr x!32695 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180693 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180693 #b00000000000000000000000000000000))))))

(assert (=> d!69989 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157806 (bvlshr lt!157806 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!327764 d!69989))

(declare-fun d!69991 () Bool)

(assert (=> d!69991 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!327762 d!69991))

(declare-fun b!328012 () Bool)

(declare-fun lt!157807 () SeekEntryResult!3038)

(assert (=> b!328012 (and (bvsge (index!14330 lt!157807) #b00000000000000000000000000000000) (bvslt (index!14330 lt!157807) (size!8294 a!3305)))))

(declare-fun res!180696 () Bool)

(assert (=> b!328012 (= res!180696 (= (select (arr!7942 a!3305) (index!14330 lt!157807)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201674 () Bool)

(assert (=> b!328012 (=> res!180696 e!201674)))

(declare-fun b!328013 () Bool)

(declare-fun e!201676 () Bool)

(assert (=> b!328013 (= e!201676 (bvsge (x!32685 lt!157807) #b01111111111111111111111111111110))))

(declare-fun b!328014 () Bool)

(assert (=> b!328014 (and (bvsge (index!14330 lt!157807) #b00000000000000000000000000000000) (bvslt (index!14330 lt!157807) (size!8294 a!3305)))))

(assert (=> b!328014 (= e!201674 (= (select (arr!7942 a!3305) (index!14330 lt!157807)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!69993 () Bool)

(assert (=> d!69993 e!201676))

(declare-fun c!51294 () Bool)

(assert (=> d!69993 (= c!51294 (and ((_ is Intermediate!3038) lt!157807) (undefined!3850 lt!157807)))))

(declare-fun e!201675 () SeekEntryResult!3038)

(assert (=> d!69993 (= lt!157807 e!201675)))

(declare-fun c!51295 () Bool)

(assert (=> d!69993 (= c!51295 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157808 () (_ BitVec 64))

(assert (=> d!69993 (= lt!157808 (select (arr!7942 a!3305) index!1840))))

(assert (=> d!69993 (validMask!0 mask!3777)))

(assert (=> d!69993 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157807)))

(declare-fun b!328015 () Bool)

(declare-fun e!201673 () SeekEntryResult!3038)

(assert (=> b!328015 (= e!201673 (Intermediate!3038 false index!1840 x!1490))))

(declare-fun b!328016 () Bool)

(assert (=> b!328016 (= e!201673 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 (bvadd x!1490 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!328017 () Bool)

(assert (=> b!328017 (and (bvsge (index!14330 lt!157807) #b00000000000000000000000000000000) (bvslt (index!14330 lt!157807) (size!8294 a!3305)))))

(declare-fun res!180695 () Bool)

(assert (=> b!328017 (= res!180695 (= (select (arr!7942 a!3305) (index!14330 lt!157807)) k0!2497))))

(assert (=> b!328017 (=> res!180695 e!201674)))

(declare-fun e!201677 () Bool)

(assert (=> b!328017 (= e!201677 e!201674)))

(declare-fun b!328018 () Bool)

(assert (=> b!328018 (= e!201675 (Intermediate!3038 true index!1840 x!1490))))

(declare-fun b!328019 () Bool)

(assert (=> b!328019 (= e!201676 e!201677)))

(declare-fun res!180694 () Bool)

(assert (=> b!328019 (= res!180694 (and ((_ is Intermediate!3038) lt!157807) (not (undefined!3850 lt!157807)) (bvslt (x!32685 lt!157807) #b01111111111111111111111111111110) (bvsge (x!32685 lt!157807) #b00000000000000000000000000000000) (bvsge (x!32685 lt!157807) x!1490)))))

(assert (=> b!328019 (=> (not res!180694) (not e!201677))))

(declare-fun b!328020 () Bool)

(assert (=> b!328020 (= e!201675 e!201673)))

(declare-fun c!51296 () Bool)

(assert (=> b!328020 (= c!51296 (or (= lt!157808 k0!2497) (= (bvadd lt!157808 lt!157808) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!69993 c!51295) b!328018))

(assert (= (and d!69993 (not c!51295)) b!328020))

(assert (= (and b!328020 c!51296) b!328015))

(assert (= (and b!328020 (not c!51296)) b!328016))

(assert (= (and d!69993 c!51294) b!328013))

(assert (= (and d!69993 (not c!51294)) b!328019))

(assert (= (and b!328019 res!180694) b!328017))

(assert (= (and b!328017 (not res!180695)) b!328012))

(assert (= (and b!328012 (not res!180696)) b!328014))

(declare-fun m!334397 () Bool)

(assert (=> b!328014 m!334397))

(assert (=> d!69993 m!334239))

(assert (=> d!69993 m!334235))

(assert (=> b!328017 m!334397))

(assert (=> b!328012 m!334397))

(declare-fun m!334399 () Bool)

(assert (=> b!328016 m!334399))

(assert (=> b!328016 m!334399))

(declare-fun m!334401 () Bool)

(assert (=> b!328016 m!334401))

(assert (=> b!327766 d!69993))

(declare-fun d!69995 () Bool)

(declare-fun res!180701 () Bool)

(declare-fun e!201682 () Bool)

(assert (=> d!69995 (=> res!180701 e!201682)))

(assert (=> d!69995 (= res!180701 (= (select (arr!7942 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69995 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!201682)))

(declare-fun b!328025 () Bool)

(declare-fun e!201683 () Bool)

(assert (=> b!328025 (= e!201682 e!201683)))

(declare-fun res!180702 () Bool)

(assert (=> b!328025 (=> (not res!180702) (not e!201683))))

(assert (=> b!328025 (= res!180702 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8294 a!3305)))))

(declare-fun b!328026 () Bool)

(assert (=> b!328026 (= e!201683 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69995 (not res!180701)) b!328025))

(assert (= (and b!328025 res!180702) b!328026))

(assert (=> d!69995 m!334297))

(declare-fun m!334403 () Bool)

(assert (=> b!328026 m!334403))

(assert (=> b!327767 d!69995))

(check-sat (not d!69955) (not d!69969) (not b!328016) (not d!69985) (not b!327841) (not bm!26093) (not b!327840) (not d!69943) (not d!69993) (not b!327995) (not b!328007) (not b!327884) (not b!328026))
(check-sat)
