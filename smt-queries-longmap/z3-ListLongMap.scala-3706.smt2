; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50840 () Bool)

(assert start!50840)

(declare-fun b!556288 () Bool)

(declare-fun res!348847 () Bool)

(declare-fun e!320452 () Bool)

(assert (=> b!556288 (=> (not res!348847) (not e!320452))))

(declare-datatypes ((array!35074 0))(
  ( (array!35075 (arr!16847 (Array (_ BitVec 32) (_ BitVec 64))) (size!17212 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35074)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556288 (= res!348847 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556290 () Bool)

(declare-fun res!348851 () Bool)

(assert (=> b!556290 (=> (not res!348851) (not e!320452))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556290 (= res!348851 (validKeyInArray!0 (select (arr!16847 a!3118) j!142)))))

(declare-fun e!320450 () Bool)

(declare-fun b!556291 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5293 0))(
  ( (MissingZero!5293 (index!23399 (_ BitVec 32))) (Found!5293 (index!23400 (_ BitVec 32))) (Intermediate!5293 (undefined!6105 Bool) (index!23401 (_ BitVec 32)) (x!52298 (_ BitVec 32))) (Undefined!5293) (MissingVacant!5293 (index!23402 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35074 (_ BitVec 32)) SeekEntryResult!5293)

(assert (=> b!556291 (= e!320450 (= (seekEntryOrOpen!0 (select (arr!16847 a!3118) j!142) a!3118 mask!3119) (Found!5293 j!142)))))

(declare-fun b!556292 () Bool)

(declare-fun res!348842 () Bool)

(assert (=> b!556292 (=> (not res!348842) (not e!320452))))

(assert (=> b!556292 (= res!348842 (validKeyInArray!0 k0!1914))))

(declare-fun b!556293 () Bool)

(declare-fun e!320451 () Bool)

(declare-fun e!320453 () Bool)

(assert (=> b!556293 (= e!320451 e!320453)))

(declare-fun res!348846 () Bool)

(assert (=> b!556293 (=> (not res!348846) (not e!320453))))

(declare-fun lt!252686 () SeekEntryResult!5293)

(declare-fun lt!252685 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35074 (_ BitVec 32)) SeekEntryResult!5293)

(assert (=> b!556293 (= res!348846 (= lt!252686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252685 (select (store (arr!16847 a!3118) i!1132 k0!1914) j!142) (array!35075 (store (arr!16847 a!3118) i!1132 k0!1914) (size!17212 a!3118)) mask!3119)))))

(declare-fun lt!252687 () (_ BitVec 32))

(assert (=> b!556293 (= lt!252686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252687 (select (arr!16847 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556293 (= lt!252685 (toIndex!0 (select (store (arr!16847 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!556293 (= lt!252687 (toIndex!0 (select (arr!16847 a!3118) j!142) mask!3119))))

(declare-fun b!556294 () Bool)

(declare-fun res!348844 () Bool)

(assert (=> b!556294 (=> (not res!348844) (not e!320451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35074 (_ BitVec 32)) Bool)

(assert (=> b!556294 (= res!348844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556295 () Bool)

(declare-fun res!348850 () Bool)

(assert (=> b!556295 (=> (not res!348850) (not e!320451))))

(declare-datatypes ((List!10966 0))(
  ( (Nil!10963) (Cons!10962 (h!11947 (_ BitVec 64)) (t!17185 List!10966)) )
))
(declare-fun arrayNoDuplicates!0 (array!35074 (_ BitVec 32) List!10966) Bool)

(assert (=> b!556295 (= res!348850 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10963))))

(declare-fun b!556296 () Bool)

(assert (=> b!556296 (= e!320452 e!320451)))

(declare-fun res!348845 () Bool)

(assert (=> b!556296 (=> (not res!348845) (not e!320451))))

(declare-fun lt!252684 () SeekEntryResult!5293)

(assert (=> b!556296 (= res!348845 (or (= lt!252684 (MissingZero!5293 i!1132)) (= lt!252684 (MissingVacant!5293 i!1132))))))

(assert (=> b!556296 (= lt!252684 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!556297 () Bool)

(declare-fun res!348849 () Bool)

(assert (=> b!556297 (=> (not res!348849) (not e!320452))))

(assert (=> b!556297 (= res!348849 (and (= (size!17212 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17212 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17212 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!348843 () Bool)

(assert (=> start!50840 (=> (not res!348843) (not e!320452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50840 (= res!348843 (validMask!0 mask!3119))))

(assert (=> start!50840 e!320452))

(assert (=> start!50840 true))

(declare-fun array_inv!12730 (array!35074) Bool)

(assert (=> start!50840 (array_inv!12730 a!3118)))

(declare-fun b!556289 () Bool)

(get-info :version)

(assert (=> b!556289 (= e!320453 (not (or (not ((_ is Intermediate!5293) lt!252686)) (undefined!6105 lt!252686) (= (select (arr!16847 a!3118) (index!23401 lt!252686)) (select (arr!16847 a!3118) j!142)) (= (select (arr!16847 a!3118) (index!23401 lt!252686)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge (index!23401 lt!252686) #b00000000000000000000000000000000) (bvslt (index!23401 lt!252686) (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(assert (=> b!556289 e!320450))

(declare-fun res!348848 () Bool)

(assert (=> b!556289 (=> (not res!348848) (not e!320450))))

(assert (=> b!556289 (= res!348848 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17346 0))(
  ( (Unit!17347) )
))
(declare-fun lt!252688 () Unit!17346)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17346)

(assert (=> b!556289 (= lt!252688 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50840 res!348843) b!556297))

(assert (= (and b!556297 res!348849) b!556290))

(assert (= (and b!556290 res!348851) b!556292))

(assert (= (and b!556292 res!348842) b!556288))

(assert (= (and b!556288 res!348847) b!556296))

(assert (= (and b!556296 res!348845) b!556294))

(assert (= (and b!556294 res!348844) b!556295))

(assert (= (and b!556295 res!348850) b!556293))

(assert (= (and b!556293 res!348846) b!556289))

(assert (= (and b!556289 res!348848) b!556291))

(declare-fun m!533807 () Bool)

(assert (=> b!556296 m!533807))

(declare-fun m!533809 () Bool)

(assert (=> b!556292 m!533809))

(declare-fun m!533811 () Bool)

(assert (=> b!556290 m!533811))

(assert (=> b!556290 m!533811))

(declare-fun m!533813 () Bool)

(assert (=> b!556290 m!533813))

(declare-fun m!533815 () Bool)

(assert (=> b!556289 m!533815))

(assert (=> b!556289 m!533811))

(declare-fun m!533817 () Bool)

(assert (=> b!556289 m!533817))

(declare-fun m!533819 () Bool)

(assert (=> b!556289 m!533819))

(declare-fun m!533821 () Bool)

(assert (=> b!556288 m!533821))

(declare-fun m!533823 () Bool)

(assert (=> start!50840 m!533823))

(declare-fun m!533825 () Bool)

(assert (=> start!50840 m!533825))

(declare-fun m!533827 () Bool)

(assert (=> b!556294 m!533827))

(assert (=> b!556291 m!533811))

(assert (=> b!556291 m!533811))

(declare-fun m!533829 () Bool)

(assert (=> b!556291 m!533829))

(declare-fun m!533831 () Bool)

(assert (=> b!556295 m!533831))

(assert (=> b!556293 m!533811))

(declare-fun m!533833 () Bool)

(assert (=> b!556293 m!533833))

(assert (=> b!556293 m!533811))

(assert (=> b!556293 m!533811))

(declare-fun m!533835 () Bool)

(assert (=> b!556293 m!533835))

(declare-fun m!533837 () Bool)

(assert (=> b!556293 m!533837))

(assert (=> b!556293 m!533837))

(declare-fun m!533839 () Bool)

(assert (=> b!556293 m!533839))

(declare-fun m!533841 () Bool)

(assert (=> b!556293 m!533841))

(assert (=> b!556293 m!533837))

(declare-fun m!533843 () Bool)

(assert (=> b!556293 m!533843))

(check-sat (not b!556290) (not b!556296) (not start!50840) (not b!556292) (not b!556289) (not b!556288) (not b!556291) (not b!556295) (not b!556293) (not b!556294))
(check-sat)
(get-model)

(declare-fun d!83079 () Bool)

(assert (=> d!83079 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50840 d!83079))

(declare-fun d!83085 () Bool)

(assert (=> d!83085 (= (array_inv!12730 a!3118) (bvsge (size!17212 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50840 d!83085))

(declare-fun d!83087 () Bool)

(assert (=> d!83087 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!556292 d!83087))

(declare-fun b!556387 () Bool)

(declare-fun e!320510 () Bool)

(declare-fun e!320509 () Bool)

(assert (=> b!556387 (= e!320510 e!320509)))

(declare-fun c!64065 () Bool)

(assert (=> b!556387 (= c!64065 (validKeyInArray!0 (select (arr!16847 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!556388 () Bool)

(declare-fun e!320511 () Bool)

(assert (=> b!556388 (= e!320509 e!320511)))

(declare-fun lt!252727 () (_ BitVec 64))

(assert (=> b!556388 (= lt!252727 (select (arr!16847 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!252725 () Unit!17346)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35074 (_ BitVec 64) (_ BitVec 32)) Unit!17346)

(assert (=> b!556388 (= lt!252725 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!252727 #b00000000000000000000000000000000))))

(assert (=> b!556388 (arrayContainsKey!0 a!3118 lt!252727 #b00000000000000000000000000000000)))

(declare-fun lt!252726 () Unit!17346)

(assert (=> b!556388 (= lt!252726 lt!252725)))

(declare-fun res!348931 () Bool)

(assert (=> b!556388 (= res!348931 (= (seekEntryOrOpen!0 (select (arr!16847 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5293 #b00000000000000000000000000000000)))))

(assert (=> b!556388 (=> (not res!348931) (not e!320511))))

(declare-fun d!83093 () Bool)

(declare-fun res!348932 () Bool)

(assert (=> d!83093 (=> res!348932 e!320510)))

(assert (=> d!83093 (= res!348932 (bvsge #b00000000000000000000000000000000 (size!17212 a!3118)))))

(assert (=> d!83093 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!320510)))

(declare-fun b!556389 () Bool)

(declare-fun call!32311 () Bool)

(assert (=> b!556389 (= e!320511 call!32311)))

(declare-fun bm!32308 () Bool)

(assert (=> bm!32308 (= call!32311 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!556390 () Bool)

(assert (=> b!556390 (= e!320509 call!32311)))

(assert (= (and d!83093 (not res!348932)) b!556387))

(assert (= (and b!556387 c!64065) b!556388))

(assert (= (and b!556387 (not c!64065)) b!556390))

(assert (= (and b!556388 res!348931) b!556389))

(assert (= (or b!556389 b!556390) bm!32308))

(declare-fun m!533933 () Bool)

(assert (=> b!556387 m!533933))

(assert (=> b!556387 m!533933))

(declare-fun m!533935 () Bool)

(assert (=> b!556387 m!533935))

(assert (=> b!556388 m!533933))

(declare-fun m!533937 () Bool)

(assert (=> b!556388 m!533937))

(declare-fun m!533939 () Bool)

(assert (=> b!556388 m!533939))

(assert (=> b!556388 m!533933))

(declare-fun m!533941 () Bool)

(assert (=> b!556388 m!533941))

(declare-fun m!533943 () Bool)

(assert (=> bm!32308 m!533943))

(assert (=> b!556294 d!83093))

(declare-fun d!83103 () Bool)

(declare-fun res!348937 () Bool)

(declare-fun e!320516 () Bool)

(assert (=> d!83103 (=> res!348937 e!320516)))

(assert (=> d!83103 (= res!348937 (= (select (arr!16847 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83103 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!320516)))

(declare-fun b!556395 () Bool)

(declare-fun e!320517 () Bool)

(assert (=> b!556395 (= e!320516 e!320517)))

(declare-fun res!348938 () Bool)

(assert (=> b!556395 (=> (not res!348938) (not e!320517))))

(assert (=> b!556395 (= res!348938 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17212 a!3118)))))

(declare-fun b!556396 () Bool)

(assert (=> b!556396 (= e!320517 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83103 (not res!348937)) b!556395))

(assert (= (and b!556395 res!348938) b!556396))

(assert (=> d!83103 m!533933))

(declare-fun m!533945 () Bool)

(assert (=> b!556396 m!533945))

(assert (=> b!556288 d!83103))

(declare-fun b!556449 () Bool)

(declare-fun e!320550 () SeekEntryResult!5293)

(assert (=> b!556449 (= e!320550 (Intermediate!5293 true lt!252685 #b00000000000000000000000000000000))))

(declare-fun b!556450 () Bool)

(declare-fun e!320551 () SeekEntryResult!5293)

(assert (=> b!556450 (= e!320550 e!320551)))

(declare-fun c!64085 () Bool)

(declare-fun lt!252757 () (_ BitVec 64))

(assert (=> b!556450 (= c!64085 (or (= lt!252757 (select (store (arr!16847 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!252757 lt!252757) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!83105 () Bool)

(declare-fun e!320549 () Bool)

(assert (=> d!83105 e!320549))

(declare-fun c!64087 () Bool)

(declare-fun lt!252756 () SeekEntryResult!5293)

(assert (=> d!83105 (= c!64087 (and ((_ is Intermediate!5293) lt!252756) (undefined!6105 lt!252756)))))

(assert (=> d!83105 (= lt!252756 e!320550)))

(declare-fun c!64086 () Bool)

(assert (=> d!83105 (= c!64086 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83105 (= lt!252757 (select (arr!16847 (array!35075 (store (arr!16847 a!3118) i!1132 k0!1914) (size!17212 a!3118))) lt!252685))))

(assert (=> d!83105 (validMask!0 mask!3119)))

(assert (=> d!83105 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252685 (select (store (arr!16847 a!3118) i!1132 k0!1914) j!142) (array!35075 (store (arr!16847 a!3118) i!1132 k0!1914) (size!17212 a!3118)) mask!3119) lt!252756)))

(declare-fun b!556451 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556451 (= e!320551 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!252685 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16847 a!3118) i!1132 k0!1914) j!142) (array!35075 (store (arr!16847 a!3118) i!1132 k0!1914) (size!17212 a!3118)) mask!3119))))

(declare-fun b!556452 () Bool)

(assert (=> b!556452 (and (bvsge (index!23401 lt!252756) #b00000000000000000000000000000000) (bvslt (index!23401 lt!252756) (size!17212 (array!35075 (store (arr!16847 a!3118) i!1132 k0!1914) (size!17212 a!3118)))))))

(declare-fun res!348953 () Bool)

(assert (=> b!556452 (= res!348953 (= (select (arr!16847 (array!35075 (store (arr!16847 a!3118) i!1132 k0!1914) (size!17212 a!3118))) (index!23401 lt!252756)) (select (store (arr!16847 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!320552 () Bool)

(assert (=> b!556452 (=> res!348953 e!320552)))

(declare-fun e!320553 () Bool)

(assert (=> b!556452 (= e!320553 e!320552)))

(declare-fun b!556453 () Bool)

(assert (=> b!556453 (and (bvsge (index!23401 lt!252756) #b00000000000000000000000000000000) (bvslt (index!23401 lt!252756) (size!17212 (array!35075 (store (arr!16847 a!3118) i!1132 k0!1914) (size!17212 a!3118)))))))

(declare-fun res!348954 () Bool)

(assert (=> b!556453 (= res!348954 (= (select (arr!16847 (array!35075 (store (arr!16847 a!3118) i!1132 k0!1914) (size!17212 a!3118))) (index!23401 lt!252756)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!556453 (=> res!348954 e!320552)))

(declare-fun b!556454 () Bool)

(assert (=> b!556454 (= e!320549 (bvsge (x!52298 lt!252756) #b01111111111111111111111111111110))))

(declare-fun b!556455 () Bool)

(assert (=> b!556455 (= e!320551 (Intermediate!5293 false lt!252685 #b00000000000000000000000000000000))))

(declare-fun b!556456 () Bool)

(assert (=> b!556456 (= e!320549 e!320553)))

(declare-fun res!348955 () Bool)

(assert (=> b!556456 (= res!348955 (and ((_ is Intermediate!5293) lt!252756) (not (undefined!6105 lt!252756)) (bvslt (x!52298 lt!252756) #b01111111111111111111111111111110) (bvsge (x!52298 lt!252756) #b00000000000000000000000000000000) (bvsge (x!52298 lt!252756) #b00000000000000000000000000000000)))))

(assert (=> b!556456 (=> (not res!348955) (not e!320553))))

(declare-fun b!556457 () Bool)

(assert (=> b!556457 (and (bvsge (index!23401 lt!252756) #b00000000000000000000000000000000) (bvslt (index!23401 lt!252756) (size!17212 (array!35075 (store (arr!16847 a!3118) i!1132 k0!1914) (size!17212 a!3118)))))))

(assert (=> b!556457 (= e!320552 (= (select (arr!16847 (array!35075 (store (arr!16847 a!3118) i!1132 k0!1914) (size!17212 a!3118))) (index!23401 lt!252756)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!83105 c!64086) b!556449))

(assert (= (and d!83105 (not c!64086)) b!556450))

(assert (= (and b!556450 c!64085) b!556455))

(assert (= (and b!556450 (not c!64085)) b!556451))

(assert (= (and d!83105 c!64087) b!556454))

(assert (= (and d!83105 (not c!64087)) b!556456))

(assert (= (and b!556456 res!348955) b!556452))

(assert (= (and b!556452 (not res!348953)) b!556453))

(assert (= (and b!556453 (not res!348954)) b!556457))

(declare-fun m!533977 () Bool)

(assert (=> b!556451 m!533977))

(assert (=> b!556451 m!533977))

(assert (=> b!556451 m!533837))

(declare-fun m!533979 () Bool)

(assert (=> b!556451 m!533979))

(declare-fun m!533981 () Bool)

(assert (=> b!556452 m!533981))

(declare-fun m!533983 () Bool)

(assert (=> d!83105 m!533983))

(assert (=> d!83105 m!533823))

(assert (=> b!556453 m!533981))

(assert (=> b!556457 m!533981))

(assert (=> b!556293 d!83105))

(declare-fun b!556458 () Bool)

(declare-fun e!320555 () SeekEntryResult!5293)

(assert (=> b!556458 (= e!320555 (Intermediate!5293 true lt!252687 #b00000000000000000000000000000000))))

(declare-fun b!556459 () Bool)

(declare-fun e!320556 () SeekEntryResult!5293)

(assert (=> b!556459 (= e!320555 e!320556)))

(declare-fun lt!252759 () (_ BitVec 64))

(declare-fun c!64088 () Bool)

(assert (=> b!556459 (= c!64088 (or (= lt!252759 (select (arr!16847 a!3118) j!142)) (= (bvadd lt!252759 lt!252759) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!83115 () Bool)

(declare-fun e!320554 () Bool)

(assert (=> d!83115 e!320554))

(declare-fun c!64090 () Bool)

(declare-fun lt!252758 () SeekEntryResult!5293)

(assert (=> d!83115 (= c!64090 (and ((_ is Intermediate!5293) lt!252758) (undefined!6105 lt!252758)))))

(assert (=> d!83115 (= lt!252758 e!320555)))

(declare-fun c!64089 () Bool)

(assert (=> d!83115 (= c!64089 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83115 (= lt!252759 (select (arr!16847 a!3118) lt!252687))))

(assert (=> d!83115 (validMask!0 mask!3119)))

(assert (=> d!83115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252687 (select (arr!16847 a!3118) j!142) a!3118 mask!3119) lt!252758)))

(declare-fun b!556460 () Bool)

(assert (=> b!556460 (= e!320556 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!252687 #b00000000000000000000000000000000 mask!3119) (select (arr!16847 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!556461 () Bool)

(assert (=> b!556461 (and (bvsge (index!23401 lt!252758) #b00000000000000000000000000000000) (bvslt (index!23401 lt!252758) (size!17212 a!3118)))))

(declare-fun res!348956 () Bool)

(assert (=> b!556461 (= res!348956 (= (select (arr!16847 a!3118) (index!23401 lt!252758)) (select (arr!16847 a!3118) j!142)))))

(declare-fun e!320557 () Bool)

(assert (=> b!556461 (=> res!348956 e!320557)))

(declare-fun e!320558 () Bool)

(assert (=> b!556461 (= e!320558 e!320557)))

(declare-fun b!556462 () Bool)

(assert (=> b!556462 (and (bvsge (index!23401 lt!252758) #b00000000000000000000000000000000) (bvslt (index!23401 lt!252758) (size!17212 a!3118)))))

(declare-fun res!348957 () Bool)

(assert (=> b!556462 (= res!348957 (= (select (arr!16847 a!3118) (index!23401 lt!252758)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!556462 (=> res!348957 e!320557)))

(declare-fun b!556463 () Bool)

(assert (=> b!556463 (= e!320554 (bvsge (x!52298 lt!252758) #b01111111111111111111111111111110))))

(declare-fun b!556464 () Bool)

(assert (=> b!556464 (= e!320556 (Intermediate!5293 false lt!252687 #b00000000000000000000000000000000))))

(declare-fun b!556465 () Bool)

(assert (=> b!556465 (= e!320554 e!320558)))

(declare-fun res!348958 () Bool)

(assert (=> b!556465 (= res!348958 (and ((_ is Intermediate!5293) lt!252758) (not (undefined!6105 lt!252758)) (bvslt (x!52298 lt!252758) #b01111111111111111111111111111110) (bvsge (x!52298 lt!252758) #b00000000000000000000000000000000) (bvsge (x!52298 lt!252758) #b00000000000000000000000000000000)))))

(assert (=> b!556465 (=> (not res!348958) (not e!320558))))

(declare-fun b!556466 () Bool)

(assert (=> b!556466 (and (bvsge (index!23401 lt!252758) #b00000000000000000000000000000000) (bvslt (index!23401 lt!252758) (size!17212 a!3118)))))

(assert (=> b!556466 (= e!320557 (= (select (arr!16847 a!3118) (index!23401 lt!252758)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!83115 c!64089) b!556458))

(assert (= (and d!83115 (not c!64089)) b!556459))

(assert (= (and b!556459 c!64088) b!556464))

(assert (= (and b!556459 (not c!64088)) b!556460))

(assert (= (and d!83115 c!64090) b!556463))

(assert (= (and d!83115 (not c!64090)) b!556465))

(assert (= (and b!556465 res!348958) b!556461))

(assert (= (and b!556461 (not res!348956)) b!556462))

(assert (= (and b!556462 (not res!348957)) b!556466))

(declare-fun m!533985 () Bool)

(assert (=> b!556460 m!533985))

(assert (=> b!556460 m!533985))

(assert (=> b!556460 m!533811))

(declare-fun m!533987 () Bool)

(assert (=> b!556460 m!533987))

(declare-fun m!533989 () Bool)

(assert (=> b!556461 m!533989))

(declare-fun m!533991 () Bool)

(assert (=> d!83115 m!533991))

(assert (=> d!83115 m!533823))

(assert (=> b!556462 m!533989))

(assert (=> b!556466 m!533989))

(assert (=> b!556293 d!83115))

(declare-fun d!83117 () Bool)

(declare-fun lt!252778 () (_ BitVec 32))

(declare-fun lt!252777 () (_ BitVec 32))

(assert (=> d!83117 (= lt!252778 (bvmul (bvxor lt!252777 (bvlshr lt!252777 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83117 (= lt!252777 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16847 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16847 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83117 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!348963 (let ((h!11950 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16847 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16847 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52302 (bvmul (bvxor h!11950 (bvlshr h!11950 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52302 (bvlshr x!52302 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!348963 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!348963 #b00000000000000000000000000000000))))))

(assert (=> d!83117 (= (toIndex!0 (select (store (arr!16847 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!252778 (bvlshr lt!252778 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!556293 d!83117))

(declare-fun d!83121 () Bool)

(declare-fun lt!252780 () (_ BitVec 32))

(declare-fun lt!252779 () (_ BitVec 32))

(assert (=> d!83121 (= lt!252780 (bvmul (bvxor lt!252779 (bvlshr lt!252779 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83121 (= lt!252779 ((_ extract 31 0) (bvand (bvxor (select (arr!16847 a!3118) j!142) (bvlshr (select (arr!16847 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83121 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!348963 (let ((h!11950 ((_ extract 31 0) (bvand (bvxor (select (arr!16847 a!3118) j!142) (bvlshr (select (arr!16847 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52302 (bvmul (bvxor h!11950 (bvlshr h!11950 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52302 (bvlshr x!52302 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!348963 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!348963 #b00000000000000000000000000000000))))))

(assert (=> d!83121 (= (toIndex!0 (select (arr!16847 a!3118) j!142) mask!3119) (bvand (bvxor lt!252780 (bvlshr lt!252780 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!556293 d!83121))

(declare-fun d!83123 () Bool)

(assert (=> d!83123 (= (validKeyInArray!0 (select (arr!16847 a!3118) j!142)) (and (not (= (select (arr!16847 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16847 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!556290 d!83123))

(declare-fun b!556537 () Bool)

(declare-fun e!320606 () Bool)

(declare-fun call!32321 () Bool)

(assert (=> b!556537 (= e!320606 call!32321)))

(declare-fun b!556538 () Bool)

(declare-fun e!320607 () Bool)

(declare-fun e!320605 () Bool)

(assert (=> b!556538 (= e!320607 e!320605)))

(declare-fun res!348992 () Bool)

(assert (=> b!556538 (=> (not res!348992) (not e!320605))))

(declare-fun e!320608 () Bool)

(assert (=> b!556538 (= res!348992 (not e!320608))))

(declare-fun res!348991 () Bool)

(assert (=> b!556538 (=> (not res!348991) (not e!320608))))

(assert (=> b!556538 (= res!348991 (validKeyInArray!0 (select (arr!16847 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!556539 () Bool)

(declare-fun contains!2827 (List!10966 (_ BitVec 64)) Bool)

(assert (=> b!556539 (= e!320608 (contains!2827 Nil!10963 (select (arr!16847 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83125 () Bool)

(declare-fun res!348990 () Bool)

(assert (=> d!83125 (=> res!348990 e!320607)))

(assert (=> d!83125 (= res!348990 (bvsge #b00000000000000000000000000000000 (size!17212 a!3118)))))

(assert (=> d!83125 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10963) e!320607)))

(declare-fun b!556540 () Bool)

(assert (=> b!556540 (= e!320605 e!320606)))

(declare-fun c!64111 () Bool)

(assert (=> b!556540 (= c!64111 (validKeyInArray!0 (select (arr!16847 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!556541 () Bool)

(assert (=> b!556541 (= e!320606 call!32321)))

(declare-fun bm!32318 () Bool)

(assert (=> bm!32318 (= call!32321 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64111 (Cons!10962 (select (arr!16847 a!3118) #b00000000000000000000000000000000) Nil!10963) Nil!10963)))))

(assert (= (and d!83125 (not res!348990)) b!556538))

(assert (= (and b!556538 res!348991) b!556539))

(assert (= (and b!556538 res!348992) b!556540))

(assert (= (and b!556540 c!64111) b!556537))

(assert (= (and b!556540 (not c!64111)) b!556541))

(assert (= (or b!556537 b!556541) bm!32318))

(assert (=> b!556538 m!533933))

(assert (=> b!556538 m!533933))

(assert (=> b!556538 m!533935))

(assert (=> b!556539 m!533933))

(assert (=> b!556539 m!533933))

(declare-fun m!534033 () Bool)

(assert (=> b!556539 m!534033))

(assert (=> b!556540 m!533933))

(assert (=> b!556540 m!533933))

(assert (=> b!556540 m!533935))

(assert (=> bm!32318 m!533933))

(declare-fun m!534035 () Bool)

(assert (=> bm!32318 m!534035))

(assert (=> b!556295 d!83125))

(declare-fun b!556542 () Bool)

(declare-fun e!320610 () Bool)

(declare-fun e!320609 () Bool)

(assert (=> b!556542 (= e!320610 e!320609)))

(declare-fun c!64112 () Bool)

(assert (=> b!556542 (= c!64112 (validKeyInArray!0 (select (arr!16847 a!3118) j!142)))))

(declare-fun b!556543 () Bool)

(declare-fun e!320611 () Bool)

(assert (=> b!556543 (= e!320609 e!320611)))

(declare-fun lt!252793 () (_ BitVec 64))

(assert (=> b!556543 (= lt!252793 (select (arr!16847 a!3118) j!142))))

(declare-fun lt!252791 () Unit!17346)

(assert (=> b!556543 (= lt!252791 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!252793 j!142))))

(assert (=> b!556543 (arrayContainsKey!0 a!3118 lt!252793 #b00000000000000000000000000000000)))

(declare-fun lt!252792 () Unit!17346)

(assert (=> b!556543 (= lt!252792 lt!252791)))

(declare-fun res!348993 () Bool)

(assert (=> b!556543 (= res!348993 (= (seekEntryOrOpen!0 (select (arr!16847 a!3118) j!142) a!3118 mask!3119) (Found!5293 j!142)))))

(assert (=> b!556543 (=> (not res!348993) (not e!320611))))

(declare-fun d!83137 () Bool)

(declare-fun res!348994 () Bool)

(assert (=> d!83137 (=> res!348994 e!320610)))

(assert (=> d!83137 (= res!348994 (bvsge j!142 (size!17212 a!3118)))))

(assert (=> d!83137 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!320610)))

(declare-fun b!556544 () Bool)

(declare-fun call!32322 () Bool)

(assert (=> b!556544 (= e!320611 call!32322)))

(declare-fun bm!32319 () Bool)

(assert (=> bm!32319 (= call!32322 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!556545 () Bool)

(assert (=> b!556545 (= e!320609 call!32322)))

(assert (= (and d!83137 (not res!348994)) b!556542))

(assert (= (and b!556542 c!64112) b!556543))

(assert (= (and b!556542 (not c!64112)) b!556545))

(assert (= (and b!556543 res!348993) b!556544))

(assert (= (or b!556544 b!556545) bm!32319))

(assert (=> b!556542 m!533811))

(assert (=> b!556542 m!533811))

(assert (=> b!556542 m!533813))

(assert (=> b!556543 m!533811))

(declare-fun m!534037 () Bool)

(assert (=> b!556543 m!534037))

(declare-fun m!534039 () Bool)

(assert (=> b!556543 m!534039))

(assert (=> b!556543 m!533811))

(assert (=> b!556543 m!533829))

(declare-fun m!534041 () Bool)

(assert (=> bm!32319 m!534041))

(assert (=> b!556289 d!83137))

(declare-fun d!83139 () Bool)

(assert (=> d!83139 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!252804 () Unit!17346)

(declare-fun choose!38 (array!35074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17346)

(assert (=> d!83139 (= lt!252804 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83139 (validMask!0 mask!3119)))

(assert (=> d!83139 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!252804)))

(declare-fun bs!17313 () Bool)

(assert (= bs!17313 d!83139))

(assert (=> bs!17313 m!533817))

(declare-fun m!534043 () Bool)

(assert (=> bs!17313 m!534043))

(assert (=> bs!17313 m!533823))

(assert (=> b!556289 d!83139))

(declare-fun b!556612 () Bool)

(declare-fun e!320648 () SeekEntryResult!5293)

(assert (=> b!556612 (= e!320648 Undefined!5293)))

(declare-fun b!556614 () Bool)

(declare-fun e!320649 () SeekEntryResult!5293)

(declare-fun lt!252833 () SeekEntryResult!5293)

(assert (=> b!556614 (= e!320649 (MissingZero!5293 (index!23401 lt!252833)))))

(declare-fun b!556615 () Bool)

(declare-fun e!320647 () SeekEntryResult!5293)

(assert (=> b!556615 (= e!320647 (Found!5293 (index!23401 lt!252833)))))

(declare-fun b!556616 () Bool)

(declare-fun c!64141 () Bool)

(declare-fun lt!252832 () (_ BitVec 64))

(assert (=> b!556616 (= c!64141 (= lt!252832 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!556616 (= e!320647 e!320649)))

(declare-fun b!556617 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35074 (_ BitVec 32)) SeekEntryResult!5293)

(assert (=> b!556617 (= e!320649 (seekKeyOrZeroReturnVacant!0 (x!52298 lt!252833) (index!23401 lt!252833) (index!23401 lt!252833) (select (arr!16847 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!556613 () Bool)

(assert (=> b!556613 (= e!320648 e!320647)))

(assert (=> b!556613 (= lt!252832 (select (arr!16847 a!3118) (index!23401 lt!252833)))))

(declare-fun c!64142 () Bool)

(assert (=> b!556613 (= c!64142 (= lt!252832 (select (arr!16847 a!3118) j!142)))))

(declare-fun d!83147 () Bool)

(declare-fun lt!252834 () SeekEntryResult!5293)

(assert (=> d!83147 (and (or ((_ is Undefined!5293) lt!252834) (not ((_ is Found!5293) lt!252834)) (and (bvsge (index!23400 lt!252834) #b00000000000000000000000000000000) (bvslt (index!23400 lt!252834) (size!17212 a!3118)))) (or ((_ is Undefined!5293) lt!252834) ((_ is Found!5293) lt!252834) (not ((_ is MissingZero!5293) lt!252834)) (and (bvsge (index!23399 lt!252834) #b00000000000000000000000000000000) (bvslt (index!23399 lt!252834) (size!17212 a!3118)))) (or ((_ is Undefined!5293) lt!252834) ((_ is Found!5293) lt!252834) ((_ is MissingZero!5293) lt!252834) (not ((_ is MissingVacant!5293) lt!252834)) (and (bvsge (index!23402 lt!252834) #b00000000000000000000000000000000) (bvslt (index!23402 lt!252834) (size!17212 a!3118)))) (or ((_ is Undefined!5293) lt!252834) (ite ((_ is Found!5293) lt!252834) (= (select (arr!16847 a!3118) (index!23400 lt!252834)) (select (arr!16847 a!3118) j!142)) (ite ((_ is MissingZero!5293) lt!252834) (= (select (arr!16847 a!3118) (index!23399 lt!252834)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5293) lt!252834) (= (select (arr!16847 a!3118) (index!23402 lt!252834)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83147 (= lt!252834 e!320648)))

(declare-fun c!64140 () Bool)

(assert (=> d!83147 (= c!64140 (and ((_ is Intermediate!5293) lt!252833) (undefined!6105 lt!252833)))))

(assert (=> d!83147 (= lt!252833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16847 a!3118) j!142) mask!3119) (select (arr!16847 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83147 (validMask!0 mask!3119)))

(assert (=> d!83147 (= (seekEntryOrOpen!0 (select (arr!16847 a!3118) j!142) a!3118 mask!3119) lt!252834)))

(assert (= (and d!83147 c!64140) b!556612))

(assert (= (and d!83147 (not c!64140)) b!556613))

(assert (= (and b!556613 c!64142) b!556615))

(assert (= (and b!556613 (not c!64142)) b!556616))

(assert (= (and b!556616 c!64141) b!556614))

(assert (= (and b!556616 (not c!64141)) b!556617))

(assert (=> b!556617 m!533811))

(declare-fun m!534075 () Bool)

(assert (=> b!556617 m!534075))

(declare-fun m!534077 () Bool)

(assert (=> b!556613 m!534077))

(assert (=> d!83147 m!533811))

(assert (=> d!83147 m!533833))

(declare-fun m!534079 () Bool)

(assert (=> d!83147 m!534079))

(assert (=> d!83147 m!533833))

(assert (=> d!83147 m!533811))

(declare-fun m!534081 () Bool)

(assert (=> d!83147 m!534081))

(assert (=> d!83147 m!533823))

(declare-fun m!534083 () Bool)

(assert (=> d!83147 m!534083))

(declare-fun m!534085 () Bool)

(assert (=> d!83147 m!534085))

(assert (=> b!556291 d!83147))

(declare-fun b!556618 () Bool)

(declare-fun e!320651 () SeekEntryResult!5293)

(assert (=> b!556618 (= e!320651 Undefined!5293)))

(declare-fun b!556620 () Bool)

(declare-fun e!320652 () SeekEntryResult!5293)

(declare-fun lt!252840 () SeekEntryResult!5293)

(assert (=> b!556620 (= e!320652 (MissingZero!5293 (index!23401 lt!252840)))))

(declare-fun b!556621 () Bool)

(declare-fun e!320650 () SeekEntryResult!5293)

(assert (=> b!556621 (= e!320650 (Found!5293 (index!23401 lt!252840)))))

(declare-fun b!556622 () Bool)

(declare-fun c!64144 () Bool)

(declare-fun lt!252839 () (_ BitVec 64))

(assert (=> b!556622 (= c!64144 (= lt!252839 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!556622 (= e!320650 e!320652)))

(declare-fun b!556623 () Bool)

(assert (=> b!556623 (= e!320652 (seekKeyOrZeroReturnVacant!0 (x!52298 lt!252840) (index!23401 lt!252840) (index!23401 lt!252840) k0!1914 a!3118 mask!3119))))

(declare-fun b!556619 () Bool)

(assert (=> b!556619 (= e!320651 e!320650)))

(assert (=> b!556619 (= lt!252839 (select (arr!16847 a!3118) (index!23401 lt!252840)))))

(declare-fun c!64145 () Bool)

(assert (=> b!556619 (= c!64145 (= lt!252839 k0!1914))))

(declare-fun d!83157 () Bool)

(declare-fun lt!252841 () SeekEntryResult!5293)

(assert (=> d!83157 (and (or ((_ is Undefined!5293) lt!252841) (not ((_ is Found!5293) lt!252841)) (and (bvsge (index!23400 lt!252841) #b00000000000000000000000000000000) (bvslt (index!23400 lt!252841) (size!17212 a!3118)))) (or ((_ is Undefined!5293) lt!252841) ((_ is Found!5293) lt!252841) (not ((_ is MissingZero!5293) lt!252841)) (and (bvsge (index!23399 lt!252841) #b00000000000000000000000000000000) (bvslt (index!23399 lt!252841) (size!17212 a!3118)))) (or ((_ is Undefined!5293) lt!252841) ((_ is Found!5293) lt!252841) ((_ is MissingZero!5293) lt!252841) (not ((_ is MissingVacant!5293) lt!252841)) (and (bvsge (index!23402 lt!252841) #b00000000000000000000000000000000) (bvslt (index!23402 lt!252841) (size!17212 a!3118)))) (or ((_ is Undefined!5293) lt!252841) (ite ((_ is Found!5293) lt!252841) (= (select (arr!16847 a!3118) (index!23400 lt!252841)) k0!1914) (ite ((_ is MissingZero!5293) lt!252841) (= (select (arr!16847 a!3118) (index!23399 lt!252841)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5293) lt!252841) (= (select (arr!16847 a!3118) (index!23402 lt!252841)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83157 (= lt!252841 e!320651)))

(declare-fun c!64143 () Bool)

(assert (=> d!83157 (= c!64143 (and ((_ is Intermediate!5293) lt!252840) (undefined!6105 lt!252840)))))

(assert (=> d!83157 (= lt!252840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83157 (validMask!0 mask!3119)))

(assert (=> d!83157 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!252841)))

(assert (= (and d!83157 c!64143) b!556618))

(assert (= (and d!83157 (not c!64143)) b!556619))

(assert (= (and b!556619 c!64145) b!556621))

(assert (= (and b!556619 (not c!64145)) b!556622))

(assert (= (and b!556622 c!64144) b!556620))

(assert (= (and b!556622 (not c!64144)) b!556623))

(declare-fun m!534087 () Bool)

(assert (=> b!556623 m!534087))

(declare-fun m!534089 () Bool)

(assert (=> b!556619 m!534089))

(declare-fun m!534091 () Bool)

(assert (=> d!83157 m!534091))

(declare-fun m!534093 () Bool)

(assert (=> d!83157 m!534093))

(assert (=> d!83157 m!534091))

(declare-fun m!534095 () Bool)

(assert (=> d!83157 m!534095))

(assert (=> d!83157 m!533823))

(declare-fun m!534097 () Bool)

(assert (=> d!83157 m!534097))

(declare-fun m!534099 () Bool)

(assert (=> d!83157 m!534099))

(assert (=> b!556296 d!83157))

(check-sat (not bm!32319) (not b!556460) (not d!83105) (not b!556543) (not bm!32318) (not b!556388) (not b!556623) (not b!556451) (not d!83115) (not b!556538) (not b!556617) (not bm!32308) (not b!556396) (not b!556539) (not b!556542) (not b!556540) (not d!83147) (not d!83139) (not d!83157) (not b!556387))
(check-sat)
