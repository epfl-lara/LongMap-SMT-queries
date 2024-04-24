; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32276 () Bool)

(assert start!32276)

(declare-fun b!321741 () Bool)

(declare-fun res!175914 () Bool)

(declare-fun e!199250 () Bool)

(assert (=> b!321741 (=> (not res!175914) (not e!199250))))

(declare-datatypes ((array!16479 0))(
  ( (array!16480 (arr!7798 (Array (_ BitVec 32) (_ BitVec 64))) (size!8150 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16479)

(declare-datatypes ((SeekEntryResult!2894 0))(
  ( (MissingZero!2894 (index!13752 (_ BitVec 32))) (Found!2894 (index!13753 (_ BitVec 32))) (Intermediate!2894 (undefined!3706 Bool) (index!13754 (_ BitVec 32)) (x!32118 (_ BitVec 32))) (Undefined!2894) (MissingVacant!2894 (index!13755 (_ BitVec 32))) )
))
(declare-fun lt!156278 () SeekEntryResult!2894)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16479 (_ BitVec 32)) SeekEntryResult!2894)

(assert (=> b!321741 (= res!175914 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156278))))

(declare-fun b!321742 () Bool)

(declare-fun res!175918 () Bool)

(assert (=> b!321742 (=> (not res!175918) (not e!199250))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!321742 (= res!175918 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7798 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7798 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7798 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321743 () Bool)

(declare-fun e!199251 () Bool)

(assert (=> b!321743 (= e!199251 e!199250)))

(declare-fun res!175916 () Bool)

(assert (=> b!321743 (=> (not res!175916) (not e!199250))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321743 (= res!175916 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156278))))

(assert (=> b!321743 (= lt!156278 (Intermediate!2894 false resIndex!58 resX!58))))

(declare-fun b!321744 () Bool)

(declare-fun res!175913 () Bool)

(assert (=> b!321744 (=> (not res!175913) (not e!199251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16479 (_ BitVec 32)) Bool)

(assert (=> b!321744 (= res!175913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321745 () Bool)

(declare-fun res!175911 () Bool)

(assert (=> b!321745 (=> (not res!175911) (not e!199250))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321745 (= res!175911 (and (= (select (arr!7798 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8150 a!3305))))))

(declare-fun b!321746 () Bool)

(declare-fun res!175912 () Bool)

(assert (=> b!321746 (=> (not res!175912) (not e!199251))))

(declare-fun arrayContainsKey!0 (array!16479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321746 (= res!175912 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321747 () Bool)

(declare-fun res!175915 () Bool)

(assert (=> b!321747 (=> (not res!175915) (not e!199251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321747 (= res!175915 (validKeyInArray!0 k0!2497))))

(declare-fun b!321748 () Bool)

(declare-fun res!175919 () Bool)

(assert (=> b!321748 (=> (not res!175919) (not e!199251))))

(assert (=> b!321748 (= res!175919 (and (= (size!8150 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8150 a!3305))))))

(declare-fun b!321750 () Bool)

(declare-fun res!175920 () Bool)

(assert (=> b!321750 (=> (not res!175920) (not e!199251))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16479 (_ BitVec 32)) SeekEntryResult!2894)

(assert (=> b!321750 (= res!175920 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2894 i!1250)))))

(declare-fun b!321749 () Bool)

(declare-fun lt!156279 () (_ BitVec 32))

(assert (=> b!321749 (= e!199250 (and (bvsge mask!3777 #b00000000000000000000000000000000) (or (bvslt lt!156279 #b00000000000000000000000000000000) (bvsge lt!156279 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321749 (= lt!156279 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun res!175917 () Bool)

(assert (=> start!32276 (=> (not res!175917) (not e!199251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32276 (= res!175917 (validMask!0 mask!3777))))

(assert (=> start!32276 e!199251))

(declare-fun array_inv!5748 (array!16479) Bool)

(assert (=> start!32276 (array_inv!5748 a!3305)))

(assert (=> start!32276 true))

(assert (= (and start!32276 res!175917) b!321748))

(assert (= (and b!321748 res!175919) b!321747))

(assert (= (and b!321747 res!175915) b!321746))

(assert (= (and b!321746 res!175912) b!321750))

(assert (= (and b!321750 res!175920) b!321744))

(assert (= (and b!321744 res!175913) b!321743))

(assert (= (and b!321743 res!175916) b!321745))

(assert (= (and b!321745 res!175911) b!321741))

(assert (= (and b!321741 res!175914) b!321742))

(assert (= (and b!321742 res!175918) b!321749))

(declare-fun m!330043 () Bool)

(assert (=> b!321746 m!330043))

(declare-fun m!330045 () Bool)

(assert (=> b!321741 m!330045))

(declare-fun m!330047 () Bool)

(assert (=> b!321747 m!330047))

(declare-fun m!330049 () Bool)

(assert (=> b!321745 m!330049))

(declare-fun m!330051 () Bool)

(assert (=> b!321750 m!330051))

(declare-fun m!330053 () Bool)

(assert (=> b!321743 m!330053))

(assert (=> b!321743 m!330053))

(declare-fun m!330055 () Bool)

(assert (=> b!321743 m!330055))

(declare-fun m!330057 () Bool)

(assert (=> start!32276 m!330057))

(declare-fun m!330059 () Bool)

(assert (=> start!32276 m!330059))

(declare-fun m!330061 () Bool)

(assert (=> b!321744 m!330061))

(declare-fun m!330063 () Bool)

(assert (=> b!321749 m!330063))

(declare-fun m!330065 () Bool)

(assert (=> b!321742 m!330065))

(check-sat (not b!321747) (not b!321743) (not b!321741) (not b!321744) (not b!321746) (not b!321750) (not b!321749) (not start!32276))
(check-sat)
(get-model)

(declare-fun d!69551 () Bool)

(assert (=> d!69551 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!321747 d!69551))

(declare-fun e!199288 () SeekEntryResult!2894)

(declare-fun b!321835 () Bool)

(assert (=> b!321835 (= e!199288 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!321836 () Bool)

(declare-fun lt!156299 () SeekEntryResult!2894)

(assert (=> b!321836 (and (bvsge (index!13754 lt!156299) #b00000000000000000000000000000000) (bvslt (index!13754 lt!156299) (size!8150 a!3305)))))

(declare-fun res!175993 () Bool)

(assert (=> b!321836 (= res!175993 (= (select (arr!7798 a!3305) (index!13754 lt!156299)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!199286 () Bool)

(assert (=> b!321836 (=> res!175993 e!199286)))

(declare-fun b!321837 () Bool)

(declare-fun e!199290 () Bool)

(assert (=> b!321837 (= e!199290 (bvsge (x!32118 lt!156299) #b01111111111111111111111111111110))))

(declare-fun b!321838 () Bool)

(assert (=> b!321838 (= e!199288 (Intermediate!2894 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!321840 () Bool)

(declare-fun e!199287 () SeekEntryResult!2894)

(assert (=> b!321840 (= e!199287 e!199288)))

(declare-fun c!50549 () Bool)

(declare-fun lt!156298 () (_ BitVec 64))

(assert (=> b!321840 (= c!50549 (or (= lt!156298 k0!2497) (= (bvadd lt!156298 lt!156298) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!321841 () Bool)

(assert (=> b!321841 (= e!199287 (Intermediate!2894 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun d!69553 () Bool)

(assert (=> d!69553 e!199290))

(declare-fun c!50548 () Bool)

(get-info :version)

(assert (=> d!69553 (= c!50548 (and ((_ is Intermediate!2894) lt!156299) (undefined!3706 lt!156299)))))

(assert (=> d!69553 (= lt!156299 e!199287)))

(declare-fun c!50547 () Bool)

(assert (=> d!69553 (= c!50547 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69553 (= lt!156298 (select (arr!7798 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69553 (validMask!0 mask!3777)))

(assert (=> d!69553 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156299)))

(declare-fun b!321839 () Bool)

(assert (=> b!321839 (and (bvsge (index!13754 lt!156299) #b00000000000000000000000000000000) (bvslt (index!13754 lt!156299) (size!8150 a!3305)))))

(declare-fun res!175994 () Bool)

(assert (=> b!321839 (= res!175994 (= (select (arr!7798 a!3305) (index!13754 lt!156299)) k0!2497))))

(assert (=> b!321839 (=> res!175994 e!199286)))

(declare-fun e!199289 () Bool)

(assert (=> b!321839 (= e!199289 e!199286)))

(declare-fun b!321842 () Bool)

(assert (=> b!321842 (= e!199290 e!199289)))

(declare-fun res!175995 () Bool)

(assert (=> b!321842 (= res!175995 (and ((_ is Intermediate!2894) lt!156299) (not (undefined!3706 lt!156299)) (bvslt (x!32118 lt!156299) #b01111111111111111111111111111110) (bvsge (x!32118 lt!156299) #b00000000000000000000000000000000) (bvsge (x!32118 lt!156299) #b00000000000000000000000000000000)))))

(assert (=> b!321842 (=> (not res!175995) (not e!199289))))

(declare-fun b!321843 () Bool)

(assert (=> b!321843 (and (bvsge (index!13754 lt!156299) #b00000000000000000000000000000000) (bvslt (index!13754 lt!156299) (size!8150 a!3305)))))

(assert (=> b!321843 (= e!199286 (= (select (arr!7798 a!3305) (index!13754 lt!156299)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!69553 c!50547) b!321841))

(assert (= (and d!69553 (not c!50547)) b!321840))

(assert (= (and b!321840 c!50549) b!321838))

(assert (= (and b!321840 (not c!50549)) b!321835))

(assert (= (and d!69553 c!50548) b!321837))

(assert (= (and d!69553 (not c!50548)) b!321842))

(assert (= (and b!321842 res!175995) b!321839))

(assert (= (and b!321839 (not res!175994)) b!321836))

(assert (= (and b!321836 (not res!175993)) b!321843))

(assert (=> b!321835 m!330053))

(declare-fun m!330121 () Bool)

(assert (=> b!321835 m!330121))

(assert (=> b!321835 m!330121))

(declare-fun m!330123 () Bool)

(assert (=> b!321835 m!330123))

(declare-fun m!330125 () Bool)

(assert (=> b!321843 m!330125))

(assert (=> b!321839 m!330125))

(assert (=> b!321836 m!330125))

(assert (=> d!69553 m!330053))

(declare-fun m!330127 () Bool)

(assert (=> d!69553 m!330127))

(assert (=> d!69553 m!330057))

(assert (=> b!321743 d!69553))

(declare-fun d!69563 () Bool)

(declare-fun lt!156312 () (_ BitVec 32))

(declare-fun lt!156311 () (_ BitVec 32))

(assert (=> d!69563 (= lt!156312 (bvmul (bvxor lt!156311 (bvlshr lt!156311 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69563 (= lt!156311 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69563 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!175996 (let ((h!5300 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32123 (bvmul (bvxor h!5300 (bvlshr h!5300 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32123 (bvlshr x!32123 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!175996 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!175996 #b00000000000000000000000000000000))))))

(assert (=> d!69563 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!156312 (bvlshr lt!156312 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!321743 d!69563))

(declare-fun d!69565 () Bool)

(declare-fun lt!156318 () (_ BitVec 32))

(assert (=> d!69565 (and (bvsge lt!156318 #b00000000000000000000000000000000) (bvslt lt!156318 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69565 (= lt!156318 (choose!52 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(assert (=> d!69565 (validMask!0 mask!3777)))

(assert (=> d!69565 (= (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) lt!156318)))

(declare-fun bs!11245 () Bool)

(assert (= bs!11245 d!69565))

(declare-fun m!330139 () Bool)

(assert (=> bs!11245 m!330139))

(assert (=> bs!11245 m!330057))

(assert (=> b!321749 d!69565))

(declare-fun b!321894 () Bool)

(declare-fun e!199324 () Bool)

(declare-fun call!26051 () Bool)

(assert (=> b!321894 (= e!199324 call!26051)))

(declare-fun bm!26048 () Bool)

(assert (=> bm!26048 (= call!26051 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!321895 () Bool)

(declare-fun e!199322 () Bool)

(assert (=> b!321895 (= e!199322 call!26051)))

(declare-fun b!321896 () Bool)

(assert (=> b!321896 (= e!199324 e!199322)))

(declare-fun lt!156330 () (_ BitVec 64))

(assert (=> b!321896 (= lt!156330 (select (arr!7798 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9792 0))(
  ( (Unit!9793) )
))
(declare-fun lt!156329 () Unit!9792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16479 (_ BitVec 64) (_ BitVec 32)) Unit!9792)

(assert (=> b!321896 (= lt!156329 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!156330 #b00000000000000000000000000000000))))

(assert (=> b!321896 (arrayContainsKey!0 a!3305 lt!156330 #b00000000000000000000000000000000)))

(declare-fun lt!156331 () Unit!9792)

(assert (=> b!321896 (= lt!156331 lt!156329)))

(declare-fun res!176014 () Bool)

(assert (=> b!321896 (= res!176014 (= (seekEntryOrOpen!0 (select (arr!7798 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2894 #b00000000000000000000000000000000)))))

(assert (=> b!321896 (=> (not res!176014) (not e!199322))))

(declare-fun b!321897 () Bool)

(declare-fun e!199323 () Bool)

(assert (=> b!321897 (= e!199323 e!199324)))

(declare-fun c!50567 () Bool)

(assert (=> b!321897 (= c!50567 (validKeyInArray!0 (select (arr!7798 a!3305) #b00000000000000000000000000000000)))))

(declare-fun d!69569 () Bool)

(declare-fun res!176013 () Bool)

(assert (=> d!69569 (=> res!176013 e!199323)))

(assert (=> d!69569 (= res!176013 (bvsge #b00000000000000000000000000000000 (size!8150 a!3305)))))

(assert (=> d!69569 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!199323)))

(assert (= (and d!69569 (not res!176013)) b!321897))

(assert (= (and b!321897 c!50567) b!321896))

(assert (= (and b!321897 (not c!50567)) b!321894))

(assert (= (and b!321896 res!176014) b!321895))

(assert (= (or b!321895 b!321894) bm!26048))

(declare-fun m!330145 () Bool)

(assert (=> bm!26048 m!330145))

(declare-fun m!330147 () Bool)

(assert (=> b!321896 m!330147))

(declare-fun m!330149 () Bool)

(assert (=> b!321896 m!330149))

(declare-fun m!330151 () Bool)

(assert (=> b!321896 m!330151))

(assert (=> b!321896 m!330147))

(declare-fun m!330153 () Bool)

(assert (=> b!321896 m!330153))

(assert (=> b!321897 m!330147))

(assert (=> b!321897 m!330147))

(declare-fun m!330155 () Bool)

(assert (=> b!321897 m!330155))

(assert (=> b!321744 d!69569))

(declare-fun d!69573 () Bool)

(assert (=> d!69573 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32276 d!69573))

(declare-fun d!69579 () Bool)

(assert (=> d!69579 (= (array_inv!5748 a!3305) (bvsge (size!8150 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32276 d!69579))

(declare-fun b!321988 () Bool)

(declare-fun e!199381 () SeekEntryResult!2894)

(declare-fun lt!156382 () SeekEntryResult!2894)

(assert (=> b!321988 (= e!199381 (Found!2894 (index!13754 lt!156382)))))

(declare-fun b!321989 () Bool)

(declare-fun c!50600 () Bool)

(declare-fun lt!156380 () (_ BitVec 64))

(assert (=> b!321989 (= c!50600 (= lt!156380 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!199380 () SeekEntryResult!2894)

(assert (=> b!321989 (= e!199381 e!199380)))

(declare-fun b!321990 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16479 (_ BitVec 32)) SeekEntryResult!2894)

(assert (=> b!321990 (= e!199380 (seekKeyOrZeroReturnVacant!0 (x!32118 lt!156382) (index!13754 lt!156382) (index!13754 lt!156382) k0!2497 a!3305 mask!3777))))

(declare-fun b!321991 () Bool)

(declare-fun e!199379 () SeekEntryResult!2894)

(assert (=> b!321991 (= e!199379 Undefined!2894)))

(declare-fun d!69581 () Bool)

(declare-fun lt!156381 () SeekEntryResult!2894)

(assert (=> d!69581 (and (or ((_ is Undefined!2894) lt!156381) (not ((_ is Found!2894) lt!156381)) (and (bvsge (index!13753 lt!156381) #b00000000000000000000000000000000) (bvslt (index!13753 lt!156381) (size!8150 a!3305)))) (or ((_ is Undefined!2894) lt!156381) ((_ is Found!2894) lt!156381) (not ((_ is MissingZero!2894) lt!156381)) (and (bvsge (index!13752 lt!156381) #b00000000000000000000000000000000) (bvslt (index!13752 lt!156381) (size!8150 a!3305)))) (or ((_ is Undefined!2894) lt!156381) ((_ is Found!2894) lt!156381) ((_ is MissingZero!2894) lt!156381) (not ((_ is MissingVacant!2894) lt!156381)) (and (bvsge (index!13755 lt!156381) #b00000000000000000000000000000000) (bvslt (index!13755 lt!156381) (size!8150 a!3305)))) (or ((_ is Undefined!2894) lt!156381) (ite ((_ is Found!2894) lt!156381) (= (select (arr!7798 a!3305) (index!13753 lt!156381)) k0!2497) (ite ((_ is MissingZero!2894) lt!156381) (= (select (arr!7798 a!3305) (index!13752 lt!156381)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2894) lt!156381) (= (select (arr!7798 a!3305) (index!13755 lt!156381)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69581 (= lt!156381 e!199379)))

(declare-fun c!50599 () Bool)

(assert (=> d!69581 (= c!50599 (and ((_ is Intermediate!2894) lt!156382) (undefined!3706 lt!156382)))))

(assert (=> d!69581 (= lt!156382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69581 (validMask!0 mask!3777)))

(assert (=> d!69581 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!156381)))

(declare-fun b!321992 () Bool)

(assert (=> b!321992 (= e!199379 e!199381)))

(assert (=> b!321992 (= lt!156380 (select (arr!7798 a!3305) (index!13754 lt!156382)))))

(declare-fun c!50598 () Bool)

(assert (=> b!321992 (= c!50598 (= lt!156380 k0!2497))))

(declare-fun b!321993 () Bool)

(assert (=> b!321993 (= e!199380 (MissingZero!2894 (index!13754 lt!156382)))))

(assert (= (and d!69581 c!50599) b!321991))

(assert (= (and d!69581 (not c!50599)) b!321992))

(assert (= (and b!321992 c!50598) b!321988))

(assert (= (and b!321992 (not c!50598)) b!321989))

(assert (= (and b!321989 c!50600) b!321993))

(assert (= (and b!321989 (not c!50600)) b!321990))

(declare-fun m!330205 () Bool)

(assert (=> b!321990 m!330205))

(assert (=> d!69581 m!330057))

(assert (=> d!69581 m!330053))

(declare-fun m!330207 () Bool)

(assert (=> d!69581 m!330207))

(declare-fun m!330209 () Bool)

(assert (=> d!69581 m!330209))

(declare-fun m!330211 () Bool)

(assert (=> d!69581 m!330211))

(assert (=> d!69581 m!330053))

(assert (=> d!69581 m!330055))

(declare-fun m!330213 () Bool)

(assert (=> b!321992 m!330213))

(assert (=> b!321750 d!69581))

(declare-fun d!69601 () Bool)

(declare-fun res!176051 () Bool)

(declare-fun e!199386 () Bool)

(assert (=> d!69601 (=> res!176051 e!199386)))

(assert (=> d!69601 (= res!176051 (= (select (arr!7798 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69601 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!199386)))

(declare-fun b!321998 () Bool)

(declare-fun e!199387 () Bool)

(assert (=> b!321998 (= e!199386 e!199387)))

(declare-fun res!176052 () Bool)

(assert (=> b!321998 (=> (not res!176052) (not e!199387))))

(assert (=> b!321998 (= res!176052 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8150 a!3305)))))

(declare-fun b!321999 () Bool)

(assert (=> b!321999 (= e!199387 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69601 (not res!176051)) b!321998))

(assert (= (and b!321998 res!176052) b!321999))

(assert (=> d!69601 m!330147))

(declare-fun m!330215 () Bool)

(assert (=> b!321999 m!330215))

(assert (=> b!321746 d!69601))

(declare-fun b!322000 () Bool)

(declare-fun e!199390 () SeekEntryResult!2894)

(assert (=> b!322000 (= e!199390 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 (bvadd x!1490 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!322001 () Bool)

(declare-fun lt!156384 () SeekEntryResult!2894)

(assert (=> b!322001 (and (bvsge (index!13754 lt!156384) #b00000000000000000000000000000000) (bvslt (index!13754 lt!156384) (size!8150 a!3305)))))

(declare-fun res!176053 () Bool)

(assert (=> b!322001 (= res!176053 (= (select (arr!7798 a!3305) (index!13754 lt!156384)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!199388 () Bool)

(assert (=> b!322001 (=> res!176053 e!199388)))

(declare-fun b!322002 () Bool)

(declare-fun e!199392 () Bool)

(assert (=> b!322002 (= e!199392 (bvsge (x!32118 lt!156384) #b01111111111111111111111111111110))))

(declare-fun b!322003 () Bool)

(assert (=> b!322003 (= e!199390 (Intermediate!2894 false index!1840 x!1490))))

(declare-fun b!322005 () Bool)

(declare-fun e!199389 () SeekEntryResult!2894)

(assert (=> b!322005 (= e!199389 e!199390)))

(declare-fun c!50603 () Bool)

(declare-fun lt!156383 () (_ BitVec 64))

(assert (=> b!322005 (= c!50603 (or (= lt!156383 k0!2497) (= (bvadd lt!156383 lt!156383) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322006 () Bool)

(assert (=> b!322006 (= e!199389 (Intermediate!2894 true index!1840 x!1490))))

(declare-fun d!69603 () Bool)

(assert (=> d!69603 e!199392))

(declare-fun c!50602 () Bool)

(assert (=> d!69603 (= c!50602 (and ((_ is Intermediate!2894) lt!156384) (undefined!3706 lt!156384)))))

(assert (=> d!69603 (= lt!156384 e!199389)))

(declare-fun c!50601 () Bool)

(assert (=> d!69603 (= c!50601 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!69603 (= lt!156383 (select (arr!7798 a!3305) index!1840))))

(assert (=> d!69603 (validMask!0 mask!3777)))

(assert (=> d!69603 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156384)))

(declare-fun b!322004 () Bool)

(assert (=> b!322004 (and (bvsge (index!13754 lt!156384) #b00000000000000000000000000000000) (bvslt (index!13754 lt!156384) (size!8150 a!3305)))))

(declare-fun res!176054 () Bool)

(assert (=> b!322004 (= res!176054 (= (select (arr!7798 a!3305) (index!13754 lt!156384)) k0!2497))))

(assert (=> b!322004 (=> res!176054 e!199388)))

(declare-fun e!199391 () Bool)

(assert (=> b!322004 (= e!199391 e!199388)))

(declare-fun b!322007 () Bool)

(assert (=> b!322007 (= e!199392 e!199391)))

(declare-fun res!176055 () Bool)

(assert (=> b!322007 (= res!176055 (and ((_ is Intermediate!2894) lt!156384) (not (undefined!3706 lt!156384)) (bvslt (x!32118 lt!156384) #b01111111111111111111111111111110) (bvsge (x!32118 lt!156384) #b00000000000000000000000000000000) (bvsge (x!32118 lt!156384) x!1490)))))

(assert (=> b!322007 (=> (not res!176055) (not e!199391))))

(declare-fun b!322008 () Bool)

(assert (=> b!322008 (and (bvsge (index!13754 lt!156384) #b00000000000000000000000000000000) (bvslt (index!13754 lt!156384) (size!8150 a!3305)))))

(assert (=> b!322008 (= e!199388 (= (select (arr!7798 a!3305) (index!13754 lt!156384)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!69603 c!50601) b!322006))

(assert (= (and d!69603 (not c!50601)) b!322005))

(assert (= (and b!322005 c!50603) b!322003))

(assert (= (and b!322005 (not c!50603)) b!322000))

(assert (= (and d!69603 c!50602) b!322002))

(assert (= (and d!69603 (not c!50602)) b!322007))

(assert (= (and b!322007 res!176055) b!322004))

(assert (= (and b!322004 (not res!176054)) b!322001))

(assert (= (and b!322001 (not res!176053)) b!322008))

(declare-fun m!330217 () Bool)

(assert (=> b!322000 m!330217))

(assert (=> b!322000 m!330217))

(declare-fun m!330219 () Bool)

(assert (=> b!322000 m!330219))

(declare-fun m!330221 () Bool)

(assert (=> b!322008 m!330221))

(assert (=> b!322004 m!330221))

(assert (=> b!322001 m!330221))

(assert (=> d!69603 m!330065))

(assert (=> d!69603 m!330057))

(assert (=> b!321741 d!69603))

(check-sat (not d!69581) (not b!321999) (not b!321897) (not b!321990) (not d!69603) (not b!322000) (not b!321835) (not d!69553) (not bm!26048) (not d!69565) (not b!321896))
(check-sat)
