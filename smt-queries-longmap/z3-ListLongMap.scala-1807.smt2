; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32582 () Bool)

(assert start!32582)

(declare-fun b!325748 () Bool)

(declare-fun e!200721 () Bool)

(declare-fun e!200724 () Bool)

(assert (=> b!325748 (= e!200721 e!200724)))

(declare-fun res!178993 () Bool)

(assert (=> b!325748 (=> (not res!178993) (not e!200724))))

(declare-datatypes ((array!16683 0))(
  ( (array!16684 (arr!7897 (Array (_ BitVec 32) (_ BitVec 64))) (size!8249 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16683)

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun lt!157154 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!325748 (= res!178993 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1490) resX!58) (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000) (bvsge lt!157154 #b00000000000000000000000000000000) (bvslt lt!157154 (size!8249 a!3305))))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325748 (= lt!157154 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!325749 () Bool)

(declare-fun res!178998 () Bool)

(declare-fun e!200723 () Bool)

(assert (=> b!325749 (=> (not res!178998) (not e!200723))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325749 (= res!178998 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325750 () Bool)

(declare-fun res!178991 () Bool)

(assert (=> b!325750 (=> (not res!178991) (not e!200723))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325750 (= res!178991 (and (= (size!8249 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8249 a!3305))))))

(declare-fun b!325751 () Bool)

(declare-datatypes ((SeekEntryResult!2993 0))(
  ( (MissingZero!2993 (index!14148 (_ BitVec 32))) (Found!2993 (index!14149 (_ BitVec 32))) (Intermediate!2993 (undefined!3805 Bool) (index!14150 (_ BitVec 32)) (x!32499 (_ BitVec 32))) (Undefined!2993) (MissingVacant!2993 (index!14151 (_ BitVec 32))) )
))
(declare-fun lt!157155 () SeekEntryResult!2993)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16683 (_ BitVec 32)) SeekEntryResult!2993)

(assert (=> b!325751 (= e!200724 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) lt!157154 k0!2497 a!3305 mask!3777) lt!157155)))))

(declare-fun b!325752 () Bool)

(declare-fun res!178994 () Bool)

(assert (=> b!325752 (=> (not res!178994) (not e!200723))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325752 (= res!178994 (validKeyInArray!0 k0!2497))))

(declare-fun b!325753 () Bool)

(declare-fun res!178996 () Bool)

(assert (=> b!325753 (=> (not res!178996) (not e!200721))))

(assert (=> b!325753 (= res!178996 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157155))))

(declare-fun b!325754 () Bool)

(assert (=> b!325754 (= e!200723 e!200721)))

(declare-fun res!178997 () Bool)

(assert (=> b!325754 (=> (not res!178997) (not e!200721))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325754 (= res!178997 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157155))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325754 (= lt!157155 (Intermediate!2993 false resIndex!58 resX!58))))

(declare-fun res!178992 () Bool)

(assert (=> start!32582 (=> (not res!178992) (not e!200723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32582 (= res!178992 (validMask!0 mask!3777))))

(assert (=> start!32582 e!200723))

(declare-fun array_inv!5847 (array!16683) Bool)

(assert (=> start!32582 (array_inv!5847 a!3305)))

(assert (=> start!32582 true))

(declare-fun b!325755 () Bool)

(declare-fun res!178990 () Bool)

(assert (=> b!325755 (=> (not res!178990) (not e!200723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16683 (_ BitVec 32)) Bool)

(assert (=> b!325755 (= res!178990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325756 () Bool)

(declare-fun res!178988 () Bool)

(assert (=> b!325756 (=> (not res!178988) (not e!200723))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16683 (_ BitVec 32)) SeekEntryResult!2993)

(assert (=> b!325756 (= res!178988 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2993 i!1250)))))

(declare-fun b!325757 () Bool)

(declare-fun res!178995 () Bool)

(assert (=> b!325757 (=> (not res!178995) (not e!200721))))

(assert (=> b!325757 (= res!178995 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7897 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325758 () Bool)

(declare-fun res!178989 () Bool)

(assert (=> b!325758 (=> (not res!178989) (not e!200721))))

(assert (=> b!325758 (= res!178989 (and (= (select (arr!7897 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8249 a!3305))))))

(assert (= (and start!32582 res!178992) b!325750))

(assert (= (and b!325750 res!178991) b!325752))

(assert (= (and b!325752 res!178994) b!325749))

(assert (= (and b!325749 res!178998) b!325756))

(assert (= (and b!325756 res!178988) b!325755))

(assert (= (and b!325755 res!178990) b!325754))

(assert (= (and b!325754 res!178997) b!325758))

(assert (= (and b!325758 res!178989) b!325753))

(assert (= (and b!325753 res!178996) b!325757))

(assert (= (and b!325757 res!178995) b!325748))

(assert (= (and b!325748 res!178993) b!325751))

(declare-fun m!332701 () Bool)

(assert (=> start!32582 m!332701))

(declare-fun m!332703 () Bool)

(assert (=> start!32582 m!332703))

(declare-fun m!332705 () Bool)

(assert (=> b!325757 m!332705))

(declare-fun m!332707 () Bool)

(assert (=> b!325756 m!332707))

(declare-fun m!332709 () Bool)

(assert (=> b!325749 m!332709))

(declare-fun m!332711 () Bool)

(assert (=> b!325753 m!332711))

(declare-fun m!332713 () Bool)

(assert (=> b!325751 m!332713))

(declare-fun m!332715 () Bool)

(assert (=> b!325755 m!332715))

(declare-fun m!332717 () Bool)

(assert (=> b!325754 m!332717))

(assert (=> b!325754 m!332717))

(declare-fun m!332719 () Bool)

(assert (=> b!325754 m!332719))

(declare-fun m!332721 () Bool)

(assert (=> b!325748 m!332721))

(declare-fun m!332723 () Bool)

(assert (=> b!325758 m!332723))

(declare-fun m!332725 () Bool)

(assert (=> b!325752 m!332725))

(check-sat (not b!325755) (not b!325756) (not b!325754) (not start!32582) (not b!325751) (not b!325752) (not b!325753) (not b!325748) (not b!325749))
(check-sat)
(get-model)

(declare-fun d!69737 () Bool)

(declare-fun res!179069 () Bool)

(declare-fun e!200756 () Bool)

(assert (=> d!69737 (=> res!179069 e!200756)))

(assert (=> d!69737 (= res!179069 (bvsge #b00000000000000000000000000000000 (size!8249 a!3305)))))

(assert (=> d!69737 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!200756)))

(declare-fun b!325833 () Bool)

(declare-fun e!200757 () Bool)

(declare-fun call!26069 () Bool)

(assert (=> b!325833 (= e!200757 call!26069)))

(declare-fun b!325834 () Bool)

(assert (=> b!325834 (= e!200756 e!200757)))

(declare-fun c!51011 () Bool)

(assert (=> b!325834 (= c!51011 (validKeyInArray!0 (select (arr!7897 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!325835 () Bool)

(declare-fun e!200755 () Bool)

(assert (=> b!325835 (= e!200755 call!26069)))

(declare-fun b!325836 () Bool)

(assert (=> b!325836 (= e!200757 e!200755)))

(declare-fun lt!157174 () (_ BitVec 64))

(assert (=> b!325836 (= lt!157174 (select (arr!7897 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10056 0))(
  ( (Unit!10057) )
))
(declare-fun lt!157175 () Unit!10056)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16683 (_ BitVec 64) (_ BitVec 32)) Unit!10056)

(assert (=> b!325836 (= lt!157175 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157174 #b00000000000000000000000000000000))))

(assert (=> b!325836 (arrayContainsKey!0 a!3305 lt!157174 #b00000000000000000000000000000000)))

(declare-fun lt!157176 () Unit!10056)

(assert (=> b!325836 (= lt!157176 lt!157175)))

(declare-fun res!179070 () Bool)

(assert (=> b!325836 (= res!179070 (= (seekEntryOrOpen!0 (select (arr!7897 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2993 #b00000000000000000000000000000000)))))

(assert (=> b!325836 (=> (not res!179070) (not e!200755))))

(declare-fun bm!26066 () Bool)

(assert (=> bm!26066 (= call!26069 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(assert (= (and d!69737 (not res!179069)) b!325834))

(assert (= (and b!325834 c!51011) b!325836))

(assert (= (and b!325834 (not c!51011)) b!325833))

(assert (= (and b!325836 res!179070) b!325835))

(assert (= (or b!325835 b!325833) bm!26066))

(declare-fun m!332779 () Bool)

(assert (=> b!325834 m!332779))

(assert (=> b!325834 m!332779))

(declare-fun m!332781 () Bool)

(assert (=> b!325834 m!332781))

(assert (=> b!325836 m!332779))

(declare-fun m!332783 () Bool)

(assert (=> b!325836 m!332783))

(declare-fun m!332785 () Bool)

(assert (=> b!325836 m!332785))

(assert (=> b!325836 m!332779))

(declare-fun m!332787 () Bool)

(assert (=> b!325836 m!332787))

(declare-fun m!332789 () Bool)

(assert (=> bm!26066 m!332789))

(assert (=> b!325755 d!69737))

(declare-fun d!69739 () Bool)

(declare-fun res!179075 () Bool)

(declare-fun e!200762 () Bool)

(assert (=> d!69739 (=> res!179075 e!200762)))

(assert (=> d!69739 (= res!179075 (= (select (arr!7897 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69739 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!200762)))

(declare-fun b!325841 () Bool)

(declare-fun e!200763 () Bool)

(assert (=> b!325841 (= e!200762 e!200763)))

(declare-fun res!179076 () Bool)

(assert (=> b!325841 (=> (not res!179076) (not e!200763))))

(assert (=> b!325841 (= res!179076 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8249 a!3305)))))

(declare-fun b!325842 () Bool)

(assert (=> b!325842 (= e!200763 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69739 (not res!179075)) b!325841))

(assert (= (and b!325841 res!179076) b!325842))

(assert (=> d!69739 m!332779))

(declare-fun m!332791 () Bool)

(assert (=> b!325842 m!332791))

(assert (=> b!325749 d!69739))

(declare-fun d!69741 () Bool)

(assert (=> d!69741 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32582 d!69741))

(declare-fun d!69749 () Bool)

(assert (=> d!69749 (= (array_inv!5847 a!3305) (bvsge (size!8249 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32582 d!69749))

(declare-fun b!325903 () Bool)

(declare-fun e!200799 () SeekEntryResult!2993)

(assert (=> b!325903 (= e!200799 (Intermediate!2993 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun d!69751 () Bool)

(declare-fun e!200800 () Bool)

(assert (=> d!69751 e!200800))

(declare-fun c!51034 () Bool)

(declare-fun lt!157195 () SeekEntryResult!2993)

(get-info :version)

(assert (=> d!69751 (= c!51034 (and ((_ is Intermediate!2993) lt!157195) (undefined!3805 lt!157195)))))

(declare-fun e!200801 () SeekEntryResult!2993)

(assert (=> d!69751 (= lt!157195 e!200801)))

(declare-fun c!51035 () Bool)

(assert (=> d!69751 (= c!51035 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157194 () (_ BitVec 64))

(assert (=> d!69751 (= lt!157194 (select (arr!7897 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69751 (validMask!0 mask!3777)))

(assert (=> d!69751 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157195)))

(declare-fun b!325904 () Bool)

(assert (=> b!325904 (= e!200801 (Intermediate!2993 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!325905 () Bool)

(assert (=> b!325905 (and (bvsge (index!14150 lt!157195) #b00000000000000000000000000000000) (bvslt (index!14150 lt!157195) (size!8249 a!3305)))))

(declare-fun res!179097 () Bool)

(assert (=> b!325905 (= res!179097 (= (select (arr!7897 a!3305) (index!14150 lt!157195)) k0!2497))))

(declare-fun e!200803 () Bool)

(assert (=> b!325905 (=> res!179097 e!200803)))

(declare-fun e!200802 () Bool)

(assert (=> b!325905 (= e!200802 e!200803)))

(declare-fun b!325906 () Bool)

(assert (=> b!325906 (and (bvsge (index!14150 lt!157195) #b00000000000000000000000000000000) (bvslt (index!14150 lt!157195) (size!8249 a!3305)))))

(assert (=> b!325906 (= e!200803 (= (select (arr!7897 a!3305) (index!14150 lt!157195)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325907 () Bool)

(assert (=> b!325907 (= e!200799 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!325908 () Bool)

(assert (=> b!325908 (and (bvsge (index!14150 lt!157195) #b00000000000000000000000000000000) (bvslt (index!14150 lt!157195) (size!8249 a!3305)))))

(declare-fun res!179095 () Bool)

(assert (=> b!325908 (= res!179095 (= (select (arr!7897 a!3305) (index!14150 lt!157195)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325908 (=> res!179095 e!200803)))

(declare-fun b!325909 () Bool)

(assert (=> b!325909 (= e!200800 e!200802)))

(declare-fun res!179096 () Bool)

(assert (=> b!325909 (= res!179096 (and ((_ is Intermediate!2993) lt!157195) (not (undefined!3805 lt!157195)) (bvslt (x!32499 lt!157195) #b01111111111111111111111111111110) (bvsge (x!32499 lt!157195) #b00000000000000000000000000000000) (bvsge (x!32499 lt!157195) #b00000000000000000000000000000000)))))

(assert (=> b!325909 (=> (not res!179096) (not e!200802))))

(declare-fun b!325910 () Bool)

(assert (=> b!325910 (= e!200800 (bvsge (x!32499 lt!157195) #b01111111111111111111111111111110))))

(declare-fun b!325911 () Bool)

(assert (=> b!325911 (= e!200801 e!200799)))

(declare-fun c!51033 () Bool)

(assert (=> b!325911 (= c!51033 (or (= lt!157194 k0!2497) (= (bvadd lt!157194 lt!157194) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!69751 c!51035) b!325904))

(assert (= (and d!69751 (not c!51035)) b!325911))

(assert (= (and b!325911 c!51033) b!325903))

(assert (= (and b!325911 (not c!51033)) b!325907))

(assert (= (and d!69751 c!51034) b!325910))

(assert (= (and d!69751 (not c!51034)) b!325909))

(assert (= (and b!325909 res!179096) b!325905))

(assert (= (and b!325905 (not res!179097)) b!325908))

(assert (= (and b!325908 (not res!179095)) b!325906))

(assert (=> d!69751 m!332717))

(declare-fun m!332807 () Bool)

(assert (=> d!69751 m!332807))

(assert (=> d!69751 m!332701))

(assert (=> b!325907 m!332717))

(declare-fun m!332809 () Bool)

(assert (=> b!325907 m!332809))

(assert (=> b!325907 m!332809))

(declare-fun m!332811 () Bool)

(assert (=> b!325907 m!332811))

(declare-fun m!332813 () Bool)

(assert (=> b!325908 m!332813))

(assert (=> b!325906 m!332813))

(assert (=> b!325905 m!332813))

(assert (=> b!325754 d!69751))

(declare-fun d!69759 () Bool)

(declare-fun lt!157215 () (_ BitVec 32))

(declare-fun lt!157214 () (_ BitVec 32))

(assert (=> d!69759 (= lt!157215 (bvmul (bvxor lt!157214 (bvlshr lt!157214 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69759 (= lt!157214 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69759 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!179104 (let ((h!5306 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32504 (bvmul (bvxor h!5306 (bvlshr h!5306 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32504 (bvlshr x!32504 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!179104 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!179104 #b00000000000000000000000000000000))))))

(assert (=> d!69759 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157215 (bvlshr lt!157215 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!325754 d!69759))

(declare-fun b!325944 () Bool)

(declare-fun e!200822 () SeekEntryResult!2993)

(assert (=> b!325944 (= e!200822 (Intermediate!2993 false index!1840 x!1490))))

(declare-fun d!69767 () Bool)

(declare-fun e!200823 () Bool)

(assert (=> d!69767 e!200823))

(declare-fun c!51049 () Bool)

(declare-fun lt!157217 () SeekEntryResult!2993)

(assert (=> d!69767 (= c!51049 (and ((_ is Intermediate!2993) lt!157217) (undefined!3805 lt!157217)))))

(declare-fun e!200824 () SeekEntryResult!2993)

(assert (=> d!69767 (= lt!157217 e!200824)))

(declare-fun c!51050 () Bool)

(assert (=> d!69767 (= c!51050 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157216 () (_ BitVec 64))

(assert (=> d!69767 (= lt!157216 (select (arr!7897 a!3305) index!1840))))

(assert (=> d!69767 (validMask!0 mask!3777)))

(assert (=> d!69767 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157217)))

(declare-fun b!325945 () Bool)

(assert (=> b!325945 (= e!200824 (Intermediate!2993 true index!1840 x!1490))))

(declare-fun b!325946 () Bool)

(assert (=> b!325946 (and (bvsge (index!14150 lt!157217) #b00000000000000000000000000000000) (bvslt (index!14150 lt!157217) (size!8249 a!3305)))))

(declare-fun res!179110 () Bool)

(assert (=> b!325946 (= res!179110 (= (select (arr!7897 a!3305) (index!14150 lt!157217)) k0!2497))))

(declare-fun e!200826 () Bool)

(assert (=> b!325946 (=> res!179110 e!200826)))

(declare-fun e!200825 () Bool)

(assert (=> b!325946 (= e!200825 e!200826)))

(declare-fun b!325947 () Bool)

(assert (=> b!325947 (and (bvsge (index!14150 lt!157217) #b00000000000000000000000000000000) (bvslt (index!14150 lt!157217) (size!8249 a!3305)))))

(assert (=> b!325947 (= e!200826 (= (select (arr!7897 a!3305) (index!14150 lt!157217)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325948 () Bool)

(assert (=> b!325948 (= e!200822 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 (bvadd x!1490 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!325949 () Bool)

(assert (=> b!325949 (and (bvsge (index!14150 lt!157217) #b00000000000000000000000000000000) (bvslt (index!14150 lt!157217) (size!8249 a!3305)))))

(declare-fun res!179108 () Bool)

(assert (=> b!325949 (= res!179108 (= (select (arr!7897 a!3305) (index!14150 lt!157217)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325949 (=> res!179108 e!200826)))

(declare-fun b!325950 () Bool)

(assert (=> b!325950 (= e!200823 e!200825)))

(declare-fun res!179109 () Bool)

(assert (=> b!325950 (= res!179109 (and ((_ is Intermediate!2993) lt!157217) (not (undefined!3805 lt!157217)) (bvslt (x!32499 lt!157217) #b01111111111111111111111111111110) (bvsge (x!32499 lt!157217) #b00000000000000000000000000000000) (bvsge (x!32499 lt!157217) x!1490)))))

(assert (=> b!325950 (=> (not res!179109) (not e!200825))))

(declare-fun b!325951 () Bool)

(assert (=> b!325951 (= e!200823 (bvsge (x!32499 lt!157217) #b01111111111111111111111111111110))))

(declare-fun b!325952 () Bool)

(assert (=> b!325952 (= e!200824 e!200822)))

(declare-fun c!51048 () Bool)

(assert (=> b!325952 (= c!51048 (or (= lt!157216 k0!2497) (= (bvadd lt!157216 lt!157216) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!69767 c!51050) b!325945))

(assert (= (and d!69767 (not c!51050)) b!325952))

(assert (= (and b!325952 c!51048) b!325944))

(assert (= (and b!325952 (not c!51048)) b!325948))

(assert (= (and d!69767 c!51049) b!325951))

(assert (= (and d!69767 (not c!51049)) b!325950))

(assert (= (and b!325950 res!179109) b!325946))

(assert (= (and b!325946 (not res!179110)) b!325949))

(assert (= (and b!325949 (not res!179108)) b!325947))

(assert (=> d!69767 m!332705))

(assert (=> d!69767 m!332701))

(declare-fun m!332831 () Bool)

(assert (=> b!325948 m!332831))

(assert (=> b!325948 m!332831))

(declare-fun m!332833 () Bool)

(assert (=> b!325948 m!332833))

(declare-fun m!332835 () Bool)

(assert (=> b!325949 m!332835))

(assert (=> b!325947 m!332835))

(assert (=> b!325946 m!332835))

(assert (=> b!325753 d!69767))

(declare-fun d!69771 () Bool)

(declare-fun lt!157223 () (_ BitVec 32))

(assert (=> d!69771 (and (bvsge lt!157223 #b00000000000000000000000000000000) (bvslt lt!157223 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69771 (= lt!157223 (choose!52 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(assert (=> d!69771 (validMask!0 mask!3777)))

(assert (=> d!69771 (= (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) lt!157223)))

(declare-fun bs!11350 () Bool)

(assert (= bs!11350 d!69771))

(declare-fun m!332837 () Bool)

(assert (=> bs!11350 m!332837))

(assert (=> bs!11350 m!332701))

(assert (=> b!325748 d!69771))

(declare-fun d!69773 () Bool)

(assert (=> d!69773 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325752 d!69773))

(declare-fun b!325974 () Bool)

(declare-fun e!200840 () SeekEntryResult!2993)

(assert (=> b!325974 (= e!200840 (Intermediate!2993 false lt!157154 (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun d!69775 () Bool)

(declare-fun e!200841 () Bool)

(assert (=> d!69775 e!200841))

(declare-fun c!51057 () Bool)

(declare-fun lt!157233 () SeekEntryResult!2993)

(assert (=> d!69775 (= c!51057 (and ((_ is Intermediate!2993) lt!157233) (undefined!3805 lt!157233)))))

(declare-fun e!200842 () SeekEntryResult!2993)

(assert (=> d!69775 (= lt!157233 e!200842)))

(declare-fun c!51058 () Bool)

(assert (=> d!69775 (= c!51058 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(declare-fun lt!157232 () (_ BitVec 64))

(assert (=> d!69775 (= lt!157232 (select (arr!7897 a!3305) lt!157154))))

(assert (=> d!69775 (validMask!0 mask!3777)))

(assert (=> d!69775 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) lt!157154 k0!2497 a!3305 mask!3777) lt!157233)))

(declare-fun b!325975 () Bool)

(assert (=> b!325975 (= e!200842 (Intermediate!2993 true lt!157154 (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!325976 () Bool)

(assert (=> b!325976 (and (bvsge (index!14150 lt!157233) #b00000000000000000000000000000000) (bvslt (index!14150 lt!157233) (size!8249 a!3305)))))

(declare-fun res!179124 () Bool)

(assert (=> b!325976 (= res!179124 (= (select (arr!7897 a!3305) (index!14150 lt!157233)) k0!2497))))

(declare-fun e!200844 () Bool)

(assert (=> b!325976 (=> res!179124 e!200844)))

(declare-fun e!200843 () Bool)

(assert (=> b!325976 (= e!200843 e!200844)))

(declare-fun b!325977 () Bool)

(assert (=> b!325977 (and (bvsge (index!14150 lt!157233) #b00000000000000000000000000000000) (bvslt (index!14150 lt!157233) (size!8249 a!3305)))))

(assert (=> b!325977 (= e!200844 (= (select (arr!7897 a!3305) (index!14150 lt!157233)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325978 () Bool)

(assert (=> b!325978 (= e!200840 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 lt!157154 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!325979 () Bool)

(assert (=> b!325979 (and (bvsge (index!14150 lt!157233) #b00000000000000000000000000000000) (bvslt (index!14150 lt!157233) (size!8249 a!3305)))))

(declare-fun res!179122 () Bool)

(assert (=> b!325979 (= res!179122 (= (select (arr!7897 a!3305) (index!14150 lt!157233)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325979 (=> res!179122 e!200844)))

(declare-fun b!325980 () Bool)

(assert (=> b!325980 (= e!200841 e!200843)))

(declare-fun res!179123 () Bool)

(assert (=> b!325980 (= res!179123 (and ((_ is Intermediate!2993) lt!157233) (not (undefined!3805 lt!157233)) (bvslt (x!32499 lt!157233) #b01111111111111111111111111111110) (bvsge (x!32499 lt!157233) #b00000000000000000000000000000000) (bvsge (x!32499 lt!157233) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!325980 (=> (not res!179123) (not e!200843))))

(declare-fun b!325981 () Bool)

(assert (=> b!325981 (= e!200841 (bvsge (x!32499 lt!157233) #b01111111111111111111111111111110))))

(declare-fun b!325982 () Bool)

(assert (=> b!325982 (= e!200842 e!200840)))

(declare-fun c!51056 () Bool)

(assert (=> b!325982 (= c!51056 (or (= lt!157232 k0!2497) (= (bvadd lt!157232 lt!157232) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!69775 c!51058) b!325975))

(assert (= (and d!69775 (not c!51058)) b!325982))

(assert (= (and b!325982 c!51056) b!325974))

(assert (= (and b!325982 (not c!51056)) b!325978))

(assert (= (and d!69775 c!51057) b!325981))

(assert (= (and d!69775 (not c!51057)) b!325980))

(assert (= (and b!325980 res!179123) b!325976))

(assert (= (and b!325976 (not res!179124)) b!325979))

(assert (= (and b!325979 (not res!179122)) b!325977))

(declare-fun m!332845 () Bool)

(assert (=> d!69775 m!332845))

(assert (=> d!69775 m!332701))

(declare-fun m!332849 () Bool)

(assert (=> b!325978 m!332849))

(assert (=> b!325978 m!332849))

(declare-fun m!332851 () Bool)

(assert (=> b!325978 m!332851))

(declare-fun m!332853 () Bool)

(assert (=> b!325979 m!332853))

(assert (=> b!325977 m!332853))

(assert (=> b!325976 m!332853))

(assert (=> b!325751 d!69775))

(declare-fun b!326023 () Bool)

(declare-fun e!200871 () SeekEntryResult!2993)

(declare-fun lt!157257 () SeekEntryResult!2993)

(assert (=> b!326023 (= e!200871 (MissingZero!2993 (index!14150 lt!157257)))))

(declare-fun d!69779 () Bool)

(declare-fun lt!157256 () SeekEntryResult!2993)

(assert (=> d!69779 (and (or ((_ is Undefined!2993) lt!157256) (not ((_ is Found!2993) lt!157256)) (and (bvsge (index!14149 lt!157256) #b00000000000000000000000000000000) (bvslt (index!14149 lt!157256) (size!8249 a!3305)))) (or ((_ is Undefined!2993) lt!157256) ((_ is Found!2993) lt!157256) (not ((_ is MissingZero!2993) lt!157256)) (and (bvsge (index!14148 lt!157256) #b00000000000000000000000000000000) (bvslt (index!14148 lt!157256) (size!8249 a!3305)))) (or ((_ is Undefined!2993) lt!157256) ((_ is Found!2993) lt!157256) ((_ is MissingZero!2993) lt!157256) (not ((_ is MissingVacant!2993) lt!157256)) (and (bvsge (index!14151 lt!157256) #b00000000000000000000000000000000) (bvslt (index!14151 lt!157256) (size!8249 a!3305)))) (or ((_ is Undefined!2993) lt!157256) (ite ((_ is Found!2993) lt!157256) (= (select (arr!7897 a!3305) (index!14149 lt!157256)) k0!2497) (ite ((_ is MissingZero!2993) lt!157256) (= (select (arr!7897 a!3305) (index!14148 lt!157256)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2993) lt!157256) (= (select (arr!7897 a!3305) (index!14151 lt!157256)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!200872 () SeekEntryResult!2993)

(assert (=> d!69779 (= lt!157256 e!200872)))

(declare-fun c!51074 () Bool)

(assert (=> d!69779 (= c!51074 (and ((_ is Intermediate!2993) lt!157257) (undefined!3805 lt!157257)))))

(assert (=> d!69779 (= lt!157257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69779 (validMask!0 mask!3777)))

(assert (=> d!69779 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157256)))

(declare-fun b!326024 () Bool)

(declare-fun e!200870 () SeekEntryResult!2993)

(assert (=> b!326024 (= e!200870 (Found!2993 (index!14150 lt!157257)))))

(declare-fun b!326025 () Bool)

(assert (=> b!326025 (= e!200872 Undefined!2993)))

(declare-fun b!326026 () Bool)

(declare-fun c!51072 () Bool)

(declare-fun lt!157258 () (_ BitVec 64))

(assert (=> b!326026 (= c!51072 (= lt!157258 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!326026 (= e!200870 e!200871)))

(declare-fun b!326027 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16683 (_ BitVec 32)) SeekEntryResult!2993)

(assert (=> b!326027 (= e!200871 (seekKeyOrZeroReturnVacant!0 (x!32499 lt!157257) (index!14150 lt!157257) (index!14150 lt!157257) k0!2497 a!3305 mask!3777))))

(declare-fun b!326028 () Bool)

(assert (=> b!326028 (= e!200872 e!200870)))

(assert (=> b!326028 (= lt!157258 (select (arr!7897 a!3305) (index!14150 lt!157257)))))

(declare-fun c!51073 () Bool)

(assert (=> b!326028 (= c!51073 (= lt!157258 k0!2497))))

(assert (= (and d!69779 c!51074) b!326025))

(assert (= (and d!69779 (not c!51074)) b!326028))

(assert (= (and b!326028 c!51073) b!326024))

(assert (= (and b!326028 (not c!51073)) b!326026))

(assert (= (and b!326026 c!51072) b!326023))

(assert (= (and b!326026 (not c!51072)) b!326027))

(assert (=> d!69779 m!332701))

(declare-fun m!332885 () Bool)

(assert (=> d!69779 m!332885))

(assert (=> d!69779 m!332717))

(declare-fun m!332887 () Bool)

(assert (=> d!69779 m!332887))

(assert (=> d!69779 m!332717))

(assert (=> d!69779 m!332719))

(declare-fun m!332889 () Bool)

(assert (=> d!69779 m!332889))

(declare-fun m!332891 () Bool)

(assert (=> b!326027 m!332891))

(declare-fun m!332893 () Bool)

(assert (=> b!326028 m!332893))

(assert (=> b!325756 d!69779))

(check-sat (not d!69775) (not d!69751) (not d!69779) (not bm!26066) (not b!325978) (not b!325907) (not b!325948) (not b!325834) (not b!325836) (not b!326027) (not d!69767) (not b!325842) (not d!69771))
(check-sat)
