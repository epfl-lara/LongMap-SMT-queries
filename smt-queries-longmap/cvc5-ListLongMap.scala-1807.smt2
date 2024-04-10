; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32596 () Bool)

(assert start!32596)

(declare-fun b!325801 () Bool)

(declare-fun e!200755 () Bool)

(declare-fun e!200758 () Bool)

(assert (=> b!325801 (= e!200755 e!200758)))

(declare-fun res!178995 () Bool)

(assert (=> b!325801 (=> (not res!178995) (not e!200758))))

(declare-datatypes ((array!16684 0))(
  ( (array!16685 (arr!7898 (Array (_ BitVec 32) (_ BitVec 64))) (size!8250 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16684)

(declare-fun lt!157136 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!325801 (= res!178995 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1490) resX!58) (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000) (bvsge lt!157136 #b00000000000000000000000000000000) (bvslt lt!157136 (size!8250 a!3305))))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325801 (= lt!157136 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325802 () Bool)

(declare-fun res!178998 () Bool)

(declare-fun e!200757 () Bool)

(assert (=> b!325802 (=> (not res!178998) (not e!200757))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325802 (= res!178998 (and (= (size!8250 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8250 a!3305))))))

(declare-fun b!325803 () Bool)

(assert (=> b!325803 (= e!200757 e!200755)))

(declare-fun res!178997 () Bool)

(assert (=> b!325803 (=> (not res!178997) (not e!200755))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3029 0))(
  ( (MissingZero!3029 (index!14292 (_ BitVec 32))) (Found!3029 (index!14293 (_ BitVec 32))) (Intermediate!3029 (undefined!3841 Bool) (index!14294 (_ BitVec 32)) (x!32538 (_ BitVec 32))) (Undefined!3029) (MissingVacant!3029 (index!14295 (_ BitVec 32))) )
))
(declare-fun lt!157137 () SeekEntryResult!3029)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16684 (_ BitVec 32)) SeekEntryResult!3029)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325803 (= res!178997 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157137))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325803 (= lt!157137 (Intermediate!3029 false resIndex!58 resX!58))))

(declare-fun b!325804 () Bool)

(declare-fun res!178994 () Bool)

(assert (=> b!325804 (=> (not res!178994) (not e!200755))))

(assert (=> b!325804 (= res!178994 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157137))))

(declare-fun b!325805 () Bool)

(declare-fun res!178996 () Bool)

(assert (=> b!325805 (=> (not res!178996) (not e!200755))))

(assert (=> b!325805 (= res!178996 (and (= (select (arr!7898 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8250 a!3305))))))

(declare-fun b!325806 () Bool)

(declare-fun res!178991 () Bool)

(assert (=> b!325806 (=> (not res!178991) (not e!200757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325806 (= res!178991 (validKeyInArray!0 k!2497))))

(declare-fun b!325807 () Bool)

(declare-fun res!178993 () Bool)

(assert (=> b!325807 (=> (not res!178993) (not e!200755))))

(assert (=> b!325807 (= res!178993 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7898 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325808 () Bool)

(declare-fun res!179001 () Bool)

(assert (=> b!325808 (=> (not res!179001) (not e!200757))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16684 (_ BitVec 32)) SeekEntryResult!3029)

(assert (=> b!325808 (= res!179001 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3029 i!1250)))))

(declare-fun b!325809 () Bool)

(declare-fun res!178999 () Bool)

(assert (=> b!325809 (=> (not res!178999) (not e!200757))))

(declare-fun arrayContainsKey!0 (array!16684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325809 (= res!178999 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!179000 () Bool)

(assert (=> start!32596 (=> (not res!179000) (not e!200757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32596 (= res!179000 (validMask!0 mask!3777))))

(assert (=> start!32596 e!200757))

(declare-fun array_inv!5861 (array!16684) Bool)

(assert (=> start!32596 (array_inv!5861 a!3305)))

(assert (=> start!32596 true))

(declare-fun b!325810 () Bool)

(declare-fun res!178992 () Bool)

(assert (=> b!325810 (=> (not res!178992) (not e!200757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16684 (_ BitVec 32)) Bool)

(assert (=> b!325810 (= res!178992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325811 () Bool)

(assert (=> b!325811 (= e!200758 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) lt!157136 k!2497 a!3305 mask!3777) lt!157137)))))

(assert (= (and start!32596 res!179000) b!325802))

(assert (= (and b!325802 res!178998) b!325806))

(assert (= (and b!325806 res!178991) b!325809))

(assert (= (and b!325809 res!178999) b!325808))

(assert (= (and b!325808 res!179001) b!325810))

(assert (= (and b!325810 res!178992) b!325803))

(assert (= (and b!325803 res!178997) b!325805))

(assert (= (and b!325805 res!178996) b!325804))

(assert (= (and b!325804 res!178994) b!325807))

(assert (= (and b!325807 res!178993) b!325801))

(assert (= (and b!325801 res!178995) b!325811))

(declare-fun m!332513 () Bool)

(assert (=> b!325803 m!332513))

(assert (=> b!325803 m!332513))

(declare-fun m!332515 () Bool)

(assert (=> b!325803 m!332515))

(declare-fun m!332517 () Bool)

(assert (=> b!325806 m!332517))

(declare-fun m!332519 () Bool)

(assert (=> b!325801 m!332519))

(declare-fun m!332521 () Bool)

(assert (=> b!325807 m!332521))

(declare-fun m!332523 () Bool)

(assert (=> b!325809 m!332523))

(declare-fun m!332525 () Bool)

(assert (=> b!325804 m!332525))

(declare-fun m!332527 () Bool)

(assert (=> b!325810 m!332527))

(declare-fun m!332529 () Bool)

(assert (=> b!325808 m!332529))

(declare-fun m!332531 () Bool)

(assert (=> start!32596 m!332531))

(declare-fun m!332533 () Bool)

(assert (=> start!32596 m!332533))

(declare-fun m!332535 () Bool)

(assert (=> b!325805 m!332535))

(declare-fun m!332537 () Bool)

(assert (=> b!325811 m!332537))

(push 1)

(assert (not b!325808))

(assert (not b!325804))

(assert (not b!325811))

(assert (not b!325803))

(assert (not b!325801))

(assert (not b!325806))

(assert (not b!325809))

(assert (not start!32596))

(assert (not b!325810))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69709 () Bool)

(declare-fun e!200809 () Bool)

(assert (=> d!69709 e!200809))

(declare-fun c!51045 () Bool)

(declare-fun lt!157170 () SeekEntryResult!3029)

(assert (=> d!69709 (= c!51045 (and (is-Intermediate!3029 lt!157170) (undefined!3841 lt!157170)))))

(declare-fun e!200810 () SeekEntryResult!3029)

(assert (=> d!69709 (= lt!157170 e!200810)))

(declare-fun c!51043 () Bool)

(assert (=> d!69709 (= c!51043 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157169 () (_ BitVec 64))

(assert (=> d!69709 (= lt!157169 (select (arr!7898 a!3305) index!1840))))

(assert (=> d!69709 (validMask!0 mask!3777)))

(assert (=> d!69709 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157170)))

(declare-fun b!325914 () Bool)

(assert (=> b!325914 (= e!200809 (bvsge (x!32538 lt!157170) #b01111111111111111111111111111110))))

(declare-fun b!325915 () Bool)

(assert (=> b!325915 (= e!200810 (Intermediate!3029 true index!1840 x!1490))))

(declare-fun b!325916 () Bool)

(assert (=> b!325916 (and (bvsge (index!14294 lt!157170) #b00000000000000000000000000000000) (bvslt (index!14294 lt!157170) (size!8250 a!3305)))))

(declare-fun res!179088 () Bool)

(assert (=> b!325916 (= res!179088 (= (select (arr!7898 a!3305) (index!14294 lt!157170)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!200811 () Bool)

(assert (=> b!325916 (=> res!179088 e!200811)))

(declare-fun b!325917 () Bool)

(declare-fun e!200808 () SeekEntryResult!3029)

(assert (=> b!325917 (= e!200810 e!200808)))

(declare-fun c!51044 () Bool)

(assert (=> b!325917 (= c!51044 (or (= lt!157169 k!2497) (= (bvadd lt!157169 lt!157169) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!325918 () Bool)

(declare-fun e!200812 () Bool)

(assert (=> b!325918 (= e!200809 e!200812)))

(declare-fun res!179086 () Bool)

(assert (=> b!325918 (= res!179086 (and (is-Intermediate!3029 lt!157170) (not (undefined!3841 lt!157170)) (bvslt (x!32538 lt!157170) #b01111111111111111111111111111110) (bvsge (x!32538 lt!157170) #b00000000000000000000000000000000) (bvsge (x!32538 lt!157170) x!1490)))))

(assert (=> b!325918 (=> (not res!179086) (not e!200812))))

(declare-fun b!325919 () Bool)

(assert (=> b!325919 (and (bvsge (index!14294 lt!157170) #b00000000000000000000000000000000) (bvslt (index!14294 lt!157170) (size!8250 a!3305)))))

(assert (=> b!325919 (= e!200811 (= (select (arr!7898 a!3305) (index!14294 lt!157170)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325920 () Bool)

(assert (=> b!325920 (and (bvsge (index!14294 lt!157170) #b00000000000000000000000000000000) (bvslt (index!14294 lt!157170) (size!8250 a!3305)))))

(declare-fun res!179087 () Bool)

(assert (=> b!325920 (= res!179087 (= (select (arr!7898 a!3305) (index!14294 lt!157170)) k!2497))))

(assert (=> b!325920 (=> res!179087 e!200811)))

(assert (=> b!325920 (= e!200812 e!200811)))

(declare-fun b!325921 () Bool)

(assert (=> b!325921 (= e!200808 (Intermediate!3029 false index!1840 x!1490))))

(declare-fun b!325922 () Bool)

(assert (=> b!325922 (= e!200808 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(assert (= (and d!69709 c!51043) b!325915))

(assert (= (and d!69709 (not c!51043)) b!325917))

(assert (= (and b!325917 c!51044) b!325921))

(assert (= (and b!325917 (not c!51044)) b!325922))

(assert (= (and d!69709 c!51045) b!325914))

(assert (= (and d!69709 (not c!51045)) b!325918))

(assert (= (and b!325918 res!179086) b!325920))

(assert (= (and b!325920 (not res!179087)) b!325916))

(assert (= (and b!325916 (not res!179088)) b!325919))

(declare-fun m!332609 () Bool)

(assert (=> b!325920 m!332609))

(assert (=> b!325919 m!332609))

(assert (=> b!325922 m!332519))

(assert (=> b!325922 m!332519))

(declare-fun m!332611 () Bool)

(assert (=> b!325922 m!332611))

(assert (=> d!69709 m!332521))

(assert (=> d!69709 m!332531))

(assert (=> b!325916 m!332609))

(assert (=> b!325804 d!69709))

(declare-fun d!69731 () Bool)

(declare-fun res!179093 () Bool)

(declare-fun e!200823 () Bool)

(assert (=> d!69731 (=> res!179093 e!200823)))

(assert (=> d!69731 (= res!179093 (= (select (arr!7898 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!69731 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!200823)))

(declare-fun b!325939 () Bool)

(declare-fun e!200824 () Bool)

(assert (=> b!325939 (= e!200823 e!200824)))

(declare-fun res!179094 () Bool)

(assert (=> b!325939 (=> (not res!179094) (not e!200824))))

(assert (=> b!325939 (= res!179094 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8250 a!3305)))))

(declare-fun b!325940 () Bool)

(assert (=> b!325940 (= e!200824 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69731 (not res!179093)) b!325939))

(assert (= (and b!325939 res!179094) b!325940))

(declare-fun m!332613 () Bool)

(assert (=> d!69731 m!332613))

(declare-fun m!332615 () Bool)

(assert (=> b!325940 m!332615))

(assert (=> b!325809 d!69731))

(declare-fun b!325991 () Bool)

(declare-fun e!200856 () Bool)

(declare-fun e!200855 () Bool)

(assert (=> b!325991 (= e!200856 e!200855)))

(declare-fun c!51069 () Bool)

(assert (=> b!325991 (= c!51069 (validKeyInArray!0 (select (arr!7898 a!3305) #b00000000000000000000000000000000)))))

(declare-fun d!69733 () Bool)

(declare-fun res!179111 () Bool)

(assert (=> d!69733 (=> res!179111 e!200856)))

(assert (=> d!69733 (= res!179111 (bvsge #b00000000000000000000000000000000 (size!8250 a!3305)))))

(assert (=> d!69733 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!200856)))

(declare-fun b!325992 () Bool)

(declare-fun e!200854 () Bool)

(declare-fun call!26086 () Bool)

(assert (=> b!325992 (= e!200854 call!26086)))

(declare-fun b!325993 () Bool)

(assert (=> b!325993 (= e!200855 e!200854)))

(declare-fun lt!157194 () (_ BitVec 64))

(assert (=> b!325993 (= lt!157194 (select (arr!7898 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10094 0))(
  ( (Unit!10095) )
))
(declare-fun lt!157196 () Unit!10094)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16684 (_ BitVec 64) (_ BitVec 32)) Unit!10094)

(assert (=> b!325993 (= lt!157196 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157194 #b00000000000000000000000000000000))))

(assert (=> b!325993 (arrayContainsKey!0 a!3305 lt!157194 #b00000000000000000000000000000000)))

(declare-fun lt!157195 () Unit!10094)

(assert (=> b!325993 (= lt!157195 lt!157196)))

(declare-fun res!179112 () Bool)

(assert (=> b!325993 (= res!179112 (= (seekEntryOrOpen!0 (select (arr!7898 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3029 #b00000000000000000000000000000000)))))

(assert (=> b!325993 (=> (not res!179112) (not e!200854))))

(declare-fun b!325994 () Bool)

(assert (=> b!325994 (= e!200855 call!26086)))

(declare-fun bm!26083 () Bool)

(assert (=> bm!26083 (= call!26086 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(assert (= (and d!69733 (not res!179111)) b!325991))

(assert (= (and b!325991 c!51069) b!325993))

(assert (= (and b!325991 (not c!51069)) b!325994))

(assert (= (and b!325993 res!179112) b!325992))

(assert (= (or b!325992 b!325994) bm!26083))

(assert (=> b!325991 m!332613))

(assert (=> b!325991 m!332613))

(declare-fun m!332631 () Bool)

(assert (=> b!325991 m!332631))

(assert (=> b!325993 m!332613))

(declare-fun m!332635 () Bool)

(assert (=> b!325993 m!332635))

(declare-fun m!332637 () Bool)

(assert (=> b!325993 m!332637))

(assert (=> b!325993 m!332613))

(declare-fun m!332641 () Bool)

(assert (=> b!325993 m!332641))

(declare-fun m!332645 () Bool)

(assert (=> bm!26083 m!332645))

(assert (=> b!325810 d!69733))

(declare-fun b!326082 () Bool)

(declare-fun e!200908 () SeekEntryResult!3029)

(declare-fun lt!157245 () SeekEntryResult!3029)

(assert (=> b!326082 (= e!200908 (Found!3029 (index!14294 lt!157245)))))

(declare-fun d!69739 () Bool)

(declare-fun lt!157244 () SeekEntryResult!3029)

(assert (=> d!69739 (and (or (is-Undefined!3029 lt!157244) (not (is-Found!3029 lt!157244)) (and (bvsge (index!14293 lt!157244) #b00000000000000000000000000000000) (bvslt (index!14293 lt!157244) (size!8250 a!3305)))) (or (is-Undefined!3029 lt!157244) (is-Found!3029 lt!157244) (not (is-MissingZero!3029 lt!157244)) (and (bvsge (index!14292 lt!157244) #b00000000000000000000000000000000) (bvslt (index!14292 lt!157244) (size!8250 a!3305)))) (or (is-Undefined!3029 lt!157244) (is-Found!3029 lt!157244) (is-MissingZero!3029 lt!157244) (not (is-MissingVacant!3029 lt!157244)) (and (bvsge (index!14295 lt!157244) #b00000000000000000000000000000000) (bvslt (index!14295 lt!157244) (size!8250 a!3305)))) (or (is-Undefined!3029 lt!157244) (ite (is-Found!3029 lt!157244) (= (select (arr!7898 a!3305) (index!14293 lt!157244)) k!2497) (ite (is-MissingZero!3029 lt!157244) (= (select (arr!7898 a!3305) (index!14292 lt!157244)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3029 lt!157244) (= (select (arr!7898 a!3305) (index!14295 lt!157244)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!200907 () SeekEntryResult!3029)

(assert (=> d!69739 (= lt!157244 e!200907)))

(declare-fun c!51104 () Bool)

(assert (=> d!69739 (= c!51104 (and (is-Intermediate!3029 lt!157245) (undefined!3841 lt!157245)))))

(assert (=> d!69739 (= lt!157245 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!69739 (validMask!0 mask!3777)))

(assert (=> d!69739 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!157244)))

(declare-fun b!326083 () Bool)

(assert (=> b!326083 (= e!200907 Undefined!3029)))

(declare-fun b!326084 () Bool)

(declare-fun e!200906 () SeekEntryResult!3029)

(assert (=> b!326084 (= e!200906 (MissingZero!3029 (index!14294 lt!157245)))))

(declare-fun b!326085 () Bool)

(assert (=> b!326085 (= e!200907 e!200908)))

(declare-fun lt!157243 () (_ BitVec 64))

(assert (=> b!326085 (= lt!157243 (select (arr!7898 a!3305) (index!14294 lt!157245)))))

(declare-fun c!51105 () Bool)

(assert (=> b!326085 (= c!51105 (= lt!157243 k!2497))))

(declare-fun b!326086 () Bool)

(declare-fun c!51103 () Bool)

(assert (=> b!326086 (= c!51103 (= lt!157243 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!326086 (= e!200908 e!200906)))

(declare-fun b!326087 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16684 (_ BitVec 32)) SeekEntryResult!3029)

(assert (=> b!326087 (= e!200906 (seekKeyOrZeroReturnVacant!0 (x!32538 lt!157245) (index!14294 lt!157245) (index!14294 lt!157245) k!2497 a!3305 mask!3777))))

(assert (= (and d!69739 c!51104) b!326083))

(assert (= (and d!69739 (not c!51104)) b!326085))

(assert (= (and b!326085 c!51105) b!326082))

(assert (= (and b!326085 (not c!51105)) b!326086))

(assert (= (and b!326086 c!51103) b!326084))

(assert (= (and b!326086 (not c!51103)) b!326087))

(assert (=> d!69739 m!332531))

(declare-fun m!332695 () Bool)

(assert (=> d!69739 m!332695))

(declare-fun m!332697 () Bool)

(assert (=> d!69739 m!332697))

(declare-fun m!332699 () Bool)

(assert (=> d!69739 m!332699))

(assert (=> d!69739 m!332513))

(assert (=> d!69739 m!332515))

(assert (=> d!69739 m!332513))

(declare-fun m!332701 () Bool)

(assert (=> b!326085 m!332701))

(declare-fun m!332703 () Bool)

(assert (=> b!326087 m!332703))

(assert (=> b!325808 d!69739))

(declare-fun d!69757 () Bool)

(declare-fun e!200915 () Bool)

(assert (=> d!69757 e!200915))

(declare-fun c!51111 () Bool)

(declare-fun lt!157249 () SeekEntryResult!3029)

(assert (=> d!69757 (= c!51111 (and (is-Intermediate!3029 lt!157249) (undefined!3841 lt!157249)))))

(declare-fun e!200916 () SeekEntryResult!3029)

(assert (=> d!69757 (= lt!157249 e!200916)))

(declare-fun c!51109 () Bool)

(assert (=> d!69757 (= c!51109 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157248 () (_ BitVec 64))

(assert (=> d!69757 (= lt!157248 (select (arr!7898 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!69757 (validMask!0 mask!3777)))

(assert (=> d!69757 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157249)))

(declare-fun b!326097 () Bool)

(assert (=> b!326097 (= e!200915 (bvsge (x!32538 lt!157249) #b01111111111111111111111111111110))))

(declare-fun b!326098 () Bool)

(assert (=> b!326098 (= e!200916 (Intermediate!3029 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!326099 () Bool)

(assert (=> b!326099 (and (bvsge (index!14294 lt!157249) #b00000000000000000000000000000000) (bvslt (index!14294 lt!157249) (size!8250 a!3305)))))

(declare-fun res!179141 () Bool)

(assert (=> b!326099 (= res!179141 (= (select (arr!7898 a!3305) (index!14294 lt!157249)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!200917 () Bool)

(assert (=> b!326099 (=> res!179141 e!200917)))

(declare-fun b!326100 () Bool)

(declare-fun e!200914 () SeekEntryResult!3029)

(assert (=> b!326100 (= e!200916 e!200914)))

(declare-fun c!51110 () Bool)

(assert (=> b!326100 (= c!51110 (or (= lt!157248 k!2497) (= (bvadd lt!157248 lt!157248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!326101 () Bool)

(declare-fun e!200918 () Bool)

(assert (=> b!326101 (= e!200915 e!200918)))

(declare-fun res!179139 () Bool)

(assert (=> b!326101 (= res!179139 (and (is-Intermediate!3029 lt!157249) (not (undefined!3841 lt!157249)) (bvslt (x!32538 lt!157249) #b01111111111111111111111111111110) (bvsge (x!32538 lt!157249) #b00000000000000000000000000000000) (bvsge (x!32538 lt!157249) #b00000000000000000000000000000000)))))

(assert (=> b!326101 (=> (not res!179139) (not e!200918))))

(declare-fun b!326102 () Bool)

(assert (=> b!326102 (and (bvsge (index!14294 lt!157249) #b00000000000000000000000000000000) (bvslt (index!14294 lt!157249) (size!8250 a!3305)))))

(assert (=> b!326102 (= e!200917 (= (select (arr!7898 a!3305) (index!14294 lt!157249)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!326103 () Bool)

(assert (=> b!326103 (and (bvsge (index!14294 lt!157249) #b00000000000000000000000000000000) (bvslt (index!14294 lt!157249) (size!8250 a!3305)))))

(declare-fun res!179140 () Bool)

(assert (=> b!326103 (= res!179140 (= (select (arr!7898 a!3305) (index!14294 lt!157249)) k!2497))))

(assert (=> b!326103 (=> res!179140 e!200917)))

(assert (=> b!326103 (= e!200918 e!200917)))

(declare-fun b!326104 () Bool)

(assert (=> b!326104 (= e!200914 (Intermediate!3029 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!326105 () Bool)

(assert (=> b!326105 (= e!200914 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(assert (= (and d!69757 c!51109) b!326098))

(assert (= (and d!69757 (not c!51109)) b!326100))

(assert (= (and b!326100 c!51110) b!326104))

(assert (= (and b!326100 (not c!51110)) b!326105))

(assert (= (and d!69757 c!51111) b!326097))

(assert (= (and d!69757 (not c!51111)) b!326101))

(assert (= (and b!326101 res!179139) b!326103))

(assert (= (and b!326103 (not res!179140)) b!326099))

(assert (= (and b!326099 (not res!179141)) b!326102))

(declare-fun m!332709 () Bool)

(assert (=> b!326103 m!332709))

(assert (=> b!326102 m!332709))

(assert (=> b!326105 m!332513))

(declare-fun m!332711 () Bool)

(assert (=> b!326105 m!332711))

(assert (=> b!326105 m!332711))

(declare-fun m!332713 () Bool)

(assert (=> b!326105 m!332713))

(assert (=> d!69757 m!332513))

(declare-fun m!332715 () Bool)

(assert (=> d!69757 m!332715))

(assert (=> d!69757 m!332531))

(assert (=> b!326099 m!332709))

(assert (=> b!325803 d!69757))

(declare-fun d!69763 () Bool)

(declare-fun lt!157255 () (_ BitVec 32))

(declare-fun lt!157254 () (_ BitVec 32))

(assert (=> d!69763 (= lt!157255 (bvmul (bvxor lt!157254 (bvlshr lt!157254 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69763 (= lt!157254 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69763 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!179142 (let ((h!5396 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32548 (bvmul (bvxor h!5396 (bvlshr h!5396 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32548 (bvlshr x!32548 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!179142 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!179142 #b00000000000000000000000000000000))))))

(assert (=> d!69763 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!157255 (bvlshr lt!157255 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!325803 d!69763))

(declare-fun d!69765 () Bool)

(declare-fun lt!157258 () (_ BitVec 32))

(assert (=> d!69765 (and (bvsge lt!157258 #b00000000000000000000000000000000) (bvslt lt!157258 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69765 (= lt!157258 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!69765 (validMask!0 mask!3777)))

(assert (=> d!69765 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!157258)))

(declare-fun bs!11335 () Bool)

(assert (= bs!11335 d!69765))

(declare-fun m!332719 () Bool)

(assert (=> bs!11335 m!332719))

(assert (=> bs!11335 m!332531))

(assert (=> b!325801 d!69765))

(declare-fun d!69767 () Bool)

(assert (=> d!69767 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32596 d!69767))

(declare-fun d!69769 () Bool)

(assert (=> d!69769 (= (array_inv!5861 a!3305) (bvsge (size!8250 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32596 d!69769))

(declare-fun d!69771 () Bool)

(assert (=> d!69771 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325806 d!69771))

(declare-fun d!69773 () Bool)

(declare-fun e!200926 () Bool)

(assert (=> d!69773 e!200926))

(declare-fun c!51114 () Bool)

(declare-fun lt!157260 () SeekEntryResult!3029)

(assert (=> d!69773 (= c!51114 (and (is-Intermediate!3029 lt!157260) (undefined!3841 lt!157260)))))

(declare-fun e!200927 () SeekEntryResult!3029)

(assert (=> d!69773 (= lt!157260 e!200927)))

(declare-fun c!51112 () Bool)

(assert (=> d!69773 (= c!51112 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(declare-fun lt!157259 () (_ BitVec 64))

(assert (=> d!69773 (= lt!157259 (select (arr!7898 a!3305) lt!157136))))

(assert (=> d!69773 (validMask!0 mask!3777)))

(assert (=> d!69773 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) lt!157136 k!2497 a!3305 mask!3777) lt!157260)))

(declare-fun b!326112 () Bool)

(assert (=> b!326112 (= e!200926 (bvsge (x!32538 lt!157260) #b01111111111111111111111111111110))))

(declare-fun b!326113 () Bool)

(assert (=> b!326113 (= e!200927 (Intermediate!3029 true lt!157136 (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!326114 () Bool)

(assert (=> b!326114 (and (bvsge (index!14294 lt!157260) #b00000000000000000000000000000000) (bvslt (index!14294 lt!157260) (size!8250 a!3305)))))

(declare-fun res!179151 () Bool)

(assert (=> b!326114 (= res!179151 (= (select (arr!7898 a!3305) (index!14294 lt!157260)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!200928 () Bool)

(assert (=> b!326114 (=> res!179151 e!200928)))

(declare-fun b!326115 () Bool)

(declare-fun e!200925 () SeekEntryResult!3029)

(assert (=> b!326115 (= e!200927 e!200925)))

(declare-fun c!51113 () Bool)

(assert (=> b!326115 (= c!51113 (or (= lt!157259 k!2497) (= (bvadd lt!157259 lt!157259) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!326116 () Bool)

(declare-fun e!200929 () Bool)

(assert (=> b!326116 (= e!200926 e!200929)))

(declare-fun res!179149 () Bool)

(assert (=> b!326116 (= res!179149 (and (is-Intermediate!3029 lt!157260) (not (undefined!3841 lt!157260)) (bvslt (x!32538 lt!157260) #b01111111111111111111111111111110) (bvsge (x!32538 lt!157260) #b00000000000000000000000000000000) (bvsge (x!32538 lt!157260) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!326116 (=> (not res!179149) (not e!200929))))

(declare-fun b!326117 () Bool)

(assert (=> b!326117 (and (bvsge (index!14294 lt!157260) #b00000000000000000000000000000000) (bvslt (index!14294 lt!157260) (size!8250 a!3305)))))

(assert (=> b!326117 (= e!200928 (= (select (arr!7898 a!3305) (index!14294 lt!157260)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!326118 () Bool)

(assert (=> b!326118 (and (bvsge (index!14294 lt!157260) #b00000000000000000000000000000000) (bvslt (index!14294 lt!157260) (size!8250 a!3305)))))

(declare-fun res!179150 () Bool)

(assert (=> b!326118 (= res!179150 (= (select (arr!7898 a!3305) (index!14294 lt!157260)) k!2497))))

(assert (=> b!326118 (=> res!179150 e!200928)))

(assert (=> b!326118 (= e!200929 e!200928)))

(declare-fun b!326119 () Bool)

(assert (=> b!326119 (= e!200925 (Intermediate!3029 false lt!157136 (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!326120 () Bool)

(assert (=> b!326120 (= e!200925 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 lt!157136 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k!2497 a!3305 mask!3777))))

(assert (= (and d!69773 c!51112) b!326113))

(assert (= (and d!69773 (not c!51112)) b!326115))

(assert (= (and b!326115 c!51113) b!326119))

(assert (= (and b!326115 (not c!51113)) b!326120))

(assert (= (and d!69773 c!51114) b!326112))

(assert (= (and d!69773 (not c!51114)) b!326116))

(assert (= (and b!326116 res!179149) b!326118))

(assert (= (and b!326118 (not res!179150)) b!326114))

(assert (= (and b!326114 (not res!179151)) b!326117))

(declare-fun m!332721 () Bool)

(assert (=> b!326118 m!332721))

(assert (=> b!326117 m!332721))

(declare-fun m!332723 () Bool)

(assert (=> b!326120 m!332723))

(assert (=> b!326120 m!332723))

(declare-fun m!332725 () Bool)

(assert (=> b!326120 m!332725))

(declare-fun m!332727 () Bool)

(assert (=> d!69773 m!332727))

(assert (=> d!69773 m!332531))

(assert (=> b!326114 m!332721))

(assert (=> b!325811 d!69773))

(push 1)

