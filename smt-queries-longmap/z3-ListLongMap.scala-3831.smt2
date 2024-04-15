; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52526 () Bool)

(assert start!52526)

(declare-fun b!573277 () Bool)

(declare-fun res!362665 () Bool)

(declare-fun e!329780 () Bool)

(assert (=> b!573277 (=> (not res!362665) (not e!329780))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!573277 (= res!362665 (validKeyInArray!0 k0!1914))))

(declare-fun b!573278 () Bool)

(declare-fun e!329781 () Bool)

(assert (=> b!573278 (= e!329780 e!329781)))

(declare-fun res!362656 () Bool)

(assert (=> b!573278 (=> (not res!362656) (not e!329781))))

(declare-datatypes ((SeekEntryResult!5668 0))(
  ( (MissingZero!5668 (index!24899 (_ BitVec 32))) (Found!5668 (index!24900 (_ BitVec 32))) (Intermediate!5668 (undefined!6480 Bool) (index!24901 (_ BitVec 32)) (x!53781 (_ BitVec 32))) (Undefined!5668) (MissingVacant!5668 (index!24902 (_ BitVec 32))) )
))
(declare-fun lt!261673 () SeekEntryResult!5668)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!573278 (= res!362656 (or (= lt!261673 (MissingZero!5668 i!1132)) (= lt!261673 (MissingVacant!5668 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35869 0))(
  ( (array!35870 (arr!17222 (Array (_ BitVec 32) (_ BitVec 64))) (size!17587 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35869)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35869 (_ BitVec 32)) SeekEntryResult!5668)

(assert (=> b!573278 (= lt!261673 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!573279 () Bool)

(declare-fun e!329785 () Bool)

(declare-fun e!329786 () Bool)

(assert (=> b!573279 (= e!329785 e!329786)))

(declare-fun res!362654 () Bool)

(assert (=> b!573279 (=> (not res!362654) (not e!329786))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!261675 () SeekEntryResult!5668)

(declare-fun lt!261676 () SeekEntryResult!5668)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35869 (_ BitVec 32)) SeekEntryResult!5668)

(assert (=> b!573279 (= res!362654 (= lt!261676 (seekKeyOrZeroReturnVacant!0 (x!53781 lt!261675) (index!24901 lt!261675) (index!24901 lt!261675) (select (arr!17222 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!573280 () Bool)

(declare-fun res!362659 () Bool)

(assert (=> b!573280 (=> (not res!362659) (not e!329780))))

(assert (=> b!573280 (= res!362659 (validKeyInArray!0 (select (arr!17222 a!3118) j!142)))))

(declare-fun b!573281 () Bool)

(declare-fun res!362658 () Bool)

(assert (=> b!573281 (=> (not res!362658) (not e!329781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35869 (_ BitVec 32)) Bool)

(assert (=> b!573281 (= res!362658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!362663 () Bool)

(assert (=> start!52526 (=> (not res!362663) (not e!329780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52526 (= res!362663 (validMask!0 mask!3119))))

(assert (=> start!52526 e!329780))

(assert (=> start!52526 true))

(declare-fun array_inv!13105 (array!35869) Bool)

(assert (=> start!52526 (array_inv!13105 a!3118)))

(declare-fun b!573282 () Bool)

(declare-fun res!362666 () Bool)

(assert (=> b!573282 (=> (not res!362666) (not e!329780))))

(assert (=> b!573282 (= res!362666 (and (= (size!17587 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17587 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17587 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!573283 () Bool)

(declare-fun res!362664 () Bool)

(assert (=> b!573283 (=> (not res!362664) (not e!329781))))

(declare-datatypes ((List!11341 0))(
  ( (Nil!11338) (Cons!11337 (h!12367 (_ BitVec 64)) (t!17560 List!11341)) )
))
(declare-fun arrayNoDuplicates!0 (array!35869 (_ BitVec 32) List!11341) Bool)

(assert (=> b!573283 (= res!362664 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11338))))

(declare-fun b!573284 () Bool)

(declare-fun e!329784 () Bool)

(assert (=> b!573284 (= e!329784 e!329785)))

(declare-fun res!362657 () Bool)

(assert (=> b!573284 (=> res!362657 e!329785)))

(declare-fun lt!261669 () (_ BitVec 64))

(assert (=> b!573284 (= res!362657 (or (= lt!261669 (select (arr!17222 a!3118) j!142)) (= lt!261669 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!573284 (= lt!261669 (select (arr!17222 a!3118) (index!24901 lt!261675)))))

(declare-fun b!573285 () Bool)

(declare-fun e!329782 () Bool)

(assert (=> b!573285 (= e!329782 e!329784)))

(declare-fun res!362655 () Bool)

(assert (=> b!573285 (=> res!362655 e!329784)))

(get-info :version)

(assert (=> b!573285 (= res!362655 (or (undefined!6480 lt!261675) (not ((_ is Intermediate!5668) lt!261675))))))

(declare-fun lt!261670 () array!35869)

(declare-fun b!573286 () Bool)

(declare-fun lt!261674 () (_ BitVec 64))

(assert (=> b!573286 (= e!329786 (= (seekEntryOrOpen!0 lt!261674 lt!261670 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53781 lt!261675) (index!24901 lt!261675) (index!24901 lt!261675) lt!261674 lt!261670 mask!3119)))))

(declare-fun b!573287 () Bool)

(declare-fun e!329787 () Bool)

(assert (=> b!573287 (= e!329781 e!329787)))

(declare-fun res!362661 () Bool)

(assert (=> b!573287 (=> (not res!362661) (not e!329787))))

(declare-fun lt!261668 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35869 (_ BitVec 32)) SeekEntryResult!5668)

(assert (=> b!573287 (= res!362661 (= lt!261675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261668 lt!261674 lt!261670 mask!3119)))))

(declare-fun lt!261671 () (_ BitVec 32))

(assert (=> b!573287 (= lt!261675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261671 (select (arr!17222 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573287 (= lt!261668 (toIndex!0 lt!261674 mask!3119))))

(assert (=> b!573287 (= lt!261674 (select (store (arr!17222 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!573287 (= lt!261671 (toIndex!0 (select (arr!17222 a!3118) j!142) mask!3119))))

(assert (=> b!573287 (= lt!261670 (array!35870 (store (arr!17222 a!3118) i!1132 k0!1914) (size!17587 a!3118)))))

(declare-fun b!573288 () Bool)

(assert (=> b!573288 (= e!329787 (not (or (undefined!6480 lt!261675) (not ((_ is Intermediate!5668) lt!261675)) (let ((bdg!17977 (select (arr!17222 a!3118) (index!24901 lt!261675)))) (or (= bdg!17977 (select (arr!17222 a!3118) j!142)) (= bdg!17977 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (index!24901 lt!261675) #b00000000000000000000000000000000) (bvsge (index!24901 lt!261675) (bvadd #b00000000000000000000000000000001 mask!3119)) (and (bvsle (x!53781 lt!261675) #b01111111111111111111111111111110) (bvsge (x!53781 lt!261675) #b00000000000000000000000000000000)))))))))

(assert (=> b!573288 e!329782))

(declare-fun res!362660 () Bool)

(assert (=> b!573288 (=> (not res!362660) (not e!329782))))

(assert (=> b!573288 (= res!362660 (= lt!261676 (Found!5668 j!142)))))

(assert (=> b!573288 (= lt!261676 (seekEntryOrOpen!0 (select (arr!17222 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!573288 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18024 0))(
  ( (Unit!18025) )
))
(declare-fun lt!261672 () Unit!18024)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18024)

(assert (=> b!573288 (= lt!261672 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!573289 () Bool)

(declare-fun res!362662 () Bool)

(assert (=> b!573289 (=> (not res!362662) (not e!329780))))

(declare-fun arrayContainsKey!0 (array!35869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!573289 (= res!362662 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!52526 res!362663) b!573282))

(assert (= (and b!573282 res!362666) b!573280))

(assert (= (and b!573280 res!362659) b!573277))

(assert (= (and b!573277 res!362665) b!573289))

(assert (= (and b!573289 res!362662) b!573278))

(assert (= (and b!573278 res!362656) b!573281))

(assert (= (and b!573281 res!362658) b!573283))

(assert (= (and b!573283 res!362664) b!573287))

(assert (= (and b!573287 res!362661) b!573288))

(assert (= (and b!573288 res!362660) b!573285))

(assert (= (and b!573285 (not res!362655)) b!573284))

(assert (= (and b!573284 (not res!362657)) b!573279))

(assert (= (and b!573279 res!362654) b!573286))

(declare-fun m!551753 () Bool)

(assert (=> b!573278 m!551753))

(declare-fun m!551755 () Bool)

(assert (=> b!573279 m!551755))

(assert (=> b!573279 m!551755))

(declare-fun m!551757 () Bool)

(assert (=> b!573279 m!551757))

(declare-fun m!551759 () Bool)

(assert (=> b!573289 m!551759))

(declare-fun m!551761 () Bool)

(assert (=> b!573283 m!551761))

(declare-fun m!551763 () Bool)

(assert (=> b!573286 m!551763))

(declare-fun m!551765 () Bool)

(assert (=> b!573286 m!551765))

(assert (=> b!573287 m!551755))

(declare-fun m!551767 () Bool)

(assert (=> b!573287 m!551767))

(assert (=> b!573287 m!551755))

(declare-fun m!551769 () Bool)

(assert (=> b!573287 m!551769))

(declare-fun m!551771 () Bool)

(assert (=> b!573287 m!551771))

(declare-fun m!551773 () Bool)

(assert (=> b!573287 m!551773))

(declare-fun m!551775 () Bool)

(assert (=> b!573287 m!551775))

(assert (=> b!573287 m!551755))

(declare-fun m!551777 () Bool)

(assert (=> b!573287 m!551777))

(declare-fun m!551779 () Bool)

(assert (=> b!573288 m!551779))

(assert (=> b!573288 m!551755))

(declare-fun m!551781 () Bool)

(assert (=> b!573288 m!551781))

(declare-fun m!551783 () Bool)

(assert (=> b!573288 m!551783))

(assert (=> b!573288 m!551755))

(declare-fun m!551785 () Bool)

(assert (=> b!573288 m!551785))

(declare-fun m!551787 () Bool)

(assert (=> b!573277 m!551787))

(assert (=> b!573284 m!551755))

(assert (=> b!573284 m!551779))

(declare-fun m!551789 () Bool)

(assert (=> start!52526 m!551789))

(declare-fun m!551791 () Bool)

(assert (=> start!52526 m!551791))

(assert (=> b!573280 m!551755))

(assert (=> b!573280 m!551755))

(declare-fun m!551793 () Bool)

(assert (=> b!573280 m!551793))

(declare-fun m!551795 () Bool)

(assert (=> b!573281 m!551795))

(check-sat (not b!573288) (not b!573278) (not start!52526) (not b!573283) (not b!573280) (not b!573279) (not b!573287) (not b!573286) (not b!573277) (not b!573289) (not b!573281))
(check-sat)
(get-model)

(declare-fun d!84751 () Bool)

(declare-fun lt!261737 () SeekEntryResult!5668)

(assert (=> d!84751 (and (or ((_ is Undefined!5668) lt!261737) (not ((_ is Found!5668) lt!261737)) (and (bvsge (index!24900 lt!261737) #b00000000000000000000000000000000) (bvslt (index!24900 lt!261737) (size!17587 a!3118)))) (or ((_ is Undefined!5668) lt!261737) ((_ is Found!5668) lt!261737) (not ((_ is MissingZero!5668) lt!261737)) (and (bvsge (index!24899 lt!261737) #b00000000000000000000000000000000) (bvslt (index!24899 lt!261737) (size!17587 a!3118)))) (or ((_ is Undefined!5668) lt!261737) ((_ is Found!5668) lt!261737) ((_ is MissingZero!5668) lt!261737) (not ((_ is MissingVacant!5668) lt!261737)) (and (bvsge (index!24902 lt!261737) #b00000000000000000000000000000000) (bvslt (index!24902 lt!261737) (size!17587 a!3118)))) (or ((_ is Undefined!5668) lt!261737) (ite ((_ is Found!5668) lt!261737) (= (select (arr!17222 a!3118) (index!24900 lt!261737)) k0!1914) (ite ((_ is MissingZero!5668) lt!261737) (= (select (arr!17222 a!3118) (index!24899 lt!261737)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5668) lt!261737) (= (select (arr!17222 a!3118) (index!24902 lt!261737)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!329843 () SeekEntryResult!5668)

(assert (=> d!84751 (= lt!261737 e!329843)))

(declare-fun c!65677 () Bool)

(declare-fun lt!261738 () SeekEntryResult!5668)

(assert (=> d!84751 (= c!65677 (and ((_ is Intermediate!5668) lt!261738) (undefined!6480 lt!261738)))))

(assert (=> d!84751 (= lt!261738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84751 (validMask!0 mask!3119)))

(assert (=> d!84751 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!261737)))

(declare-fun b!573380 () Bool)

(declare-fun e!329844 () SeekEntryResult!5668)

(assert (=> b!573380 (= e!329844 (MissingZero!5668 (index!24901 lt!261738)))))

(declare-fun b!573381 () Bool)

(declare-fun c!65679 () Bool)

(declare-fun lt!261739 () (_ BitVec 64))

(assert (=> b!573381 (= c!65679 (= lt!261739 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!329842 () SeekEntryResult!5668)

(assert (=> b!573381 (= e!329842 e!329844)))

(declare-fun b!573382 () Bool)

(assert (=> b!573382 (= e!329843 e!329842)))

(assert (=> b!573382 (= lt!261739 (select (arr!17222 a!3118) (index!24901 lt!261738)))))

(declare-fun c!65678 () Bool)

(assert (=> b!573382 (= c!65678 (= lt!261739 k0!1914))))

(declare-fun b!573383 () Bool)

(assert (=> b!573383 (= e!329843 Undefined!5668)))

(declare-fun b!573384 () Bool)

(assert (=> b!573384 (= e!329844 (seekKeyOrZeroReturnVacant!0 (x!53781 lt!261738) (index!24901 lt!261738) (index!24901 lt!261738) k0!1914 a!3118 mask!3119))))

(declare-fun b!573385 () Bool)

(assert (=> b!573385 (= e!329842 (Found!5668 (index!24901 lt!261738)))))

(assert (= (and d!84751 c!65677) b!573383))

(assert (= (and d!84751 (not c!65677)) b!573382))

(assert (= (and b!573382 c!65678) b!573385))

(assert (= (and b!573382 (not c!65678)) b!573381))

(assert (= (and b!573381 c!65679) b!573380))

(assert (= (and b!573381 (not c!65679)) b!573384))

(declare-fun m!551885 () Bool)

(assert (=> d!84751 m!551885))

(assert (=> d!84751 m!551789))

(declare-fun m!551887 () Bool)

(assert (=> d!84751 m!551887))

(declare-fun m!551889 () Bool)

(assert (=> d!84751 m!551889))

(declare-fun m!551891 () Bool)

(assert (=> d!84751 m!551891))

(assert (=> d!84751 m!551891))

(declare-fun m!551893 () Bool)

(assert (=> d!84751 m!551893))

(declare-fun m!551895 () Bool)

(assert (=> b!573382 m!551895))

(declare-fun m!551897 () Bool)

(assert (=> b!573384 m!551897))

(assert (=> b!573278 d!84751))

(declare-fun d!84753 () Bool)

(declare-fun res!362749 () Bool)

(declare-fun e!329849 () Bool)

(assert (=> d!84753 (=> res!362749 e!329849)))

(assert (=> d!84753 (= res!362749 (= (select (arr!17222 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84753 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!329849)))

(declare-fun b!573390 () Bool)

(declare-fun e!329850 () Bool)

(assert (=> b!573390 (= e!329849 e!329850)))

(declare-fun res!362750 () Bool)

(assert (=> b!573390 (=> (not res!362750) (not e!329850))))

(assert (=> b!573390 (= res!362750 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17587 a!3118)))))

(declare-fun b!573391 () Bool)

(assert (=> b!573391 (= e!329850 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84753 (not res!362749)) b!573390))

(assert (= (and b!573390 res!362750) b!573391))

(declare-fun m!551899 () Bool)

(assert (=> d!84753 m!551899))

(declare-fun m!551901 () Bool)

(assert (=> b!573391 m!551901))

(assert (=> b!573289 d!84753))

(declare-fun b!573449 () Bool)

(declare-fun e!329881 () SeekEntryResult!5668)

(declare-fun e!329882 () SeekEntryResult!5668)

(assert (=> b!573449 (= e!329881 e!329882)))

(declare-fun c!65706 () Bool)

(declare-fun lt!261760 () (_ BitVec 64))

(assert (=> b!573449 (= c!65706 (= lt!261760 (select (arr!17222 a!3118) j!142)))))

(declare-fun b!573450 () Bool)

(declare-fun e!329883 () SeekEntryResult!5668)

(assert (=> b!573450 (= e!329883 (MissingVacant!5668 (index!24901 lt!261675)))))

(declare-fun b!573451 () Bool)

(declare-fun c!65704 () Bool)

(assert (=> b!573451 (= c!65704 (= lt!261760 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573451 (= e!329882 e!329883)))

(declare-fun b!573452 () Bool)

(assert (=> b!573452 (= e!329881 Undefined!5668)))

(declare-fun b!573453 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573453 (= e!329883 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53781 lt!261675) #b00000000000000000000000000000001) (nextIndex!0 (index!24901 lt!261675) (x!53781 lt!261675) mask!3119) (index!24901 lt!261675) (select (arr!17222 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573454 () Bool)

(assert (=> b!573454 (= e!329882 (Found!5668 (index!24901 lt!261675)))))

(declare-fun lt!261759 () SeekEntryResult!5668)

(declare-fun d!84759 () Bool)

(assert (=> d!84759 (and (or ((_ is Undefined!5668) lt!261759) (not ((_ is Found!5668) lt!261759)) (and (bvsge (index!24900 lt!261759) #b00000000000000000000000000000000) (bvslt (index!24900 lt!261759) (size!17587 a!3118)))) (or ((_ is Undefined!5668) lt!261759) ((_ is Found!5668) lt!261759) (not ((_ is MissingVacant!5668) lt!261759)) (not (= (index!24902 lt!261759) (index!24901 lt!261675))) (and (bvsge (index!24902 lt!261759) #b00000000000000000000000000000000) (bvslt (index!24902 lt!261759) (size!17587 a!3118)))) (or ((_ is Undefined!5668) lt!261759) (ite ((_ is Found!5668) lt!261759) (= (select (arr!17222 a!3118) (index!24900 lt!261759)) (select (arr!17222 a!3118) j!142)) (and ((_ is MissingVacant!5668) lt!261759) (= (index!24902 lt!261759) (index!24901 lt!261675)) (= (select (arr!17222 a!3118) (index!24902 lt!261759)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84759 (= lt!261759 e!329881)))

(declare-fun c!65705 () Bool)

(assert (=> d!84759 (= c!65705 (bvsge (x!53781 lt!261675) #b01111111111111111111111111111110))))

(assert (=> d!84759 (= lt!261760 (select (arr!17222 a!3118) (index!24901 lt!261675)))))

(assert (=> d!84759 (validMask!0 mask!3119)))

(assert (=> d!84759 (= (seekKeyOrZeroReturnVacant!0 (x!53781 lt!261675) (index!24901 lt!261675) (index!24901 lt!261675) (select (arr!17222 a!3118) j!142) a!3118 mask!3119) lt!261759)))

(assert (= (and d!84759 c!65705) b!573452))

(assert (= (and d!84759 (not c!65705)) b!573449))

(assert (= (and b!573449 c!65706) b!573454))

(assert (= (and b!573449 (not c!65706)) b!573451))

(assert (= (and b!573451 c!65704) b!573450))

(assert (= (and b!573451 (not c!65704)) b!573453))

(declare-fun m!551923 () Bool)

(assert (=> b!573453 m!551923))

(assert (=> b!573453 m!551923))

(assert (=> b!573453 m!551755))

(declare-fun m!551925 () Bool)

(assert (=> b!573453 m!551925))

(declare-fun m!551927 () Bool)

(assert (=> d!84759 m!551927))

(declare-fun m!551929 () Bool)

(assert (=> d!84759 m!551929))

(assert (=> d!84759 m!551779))

(assert (=> d!84759 m!551789))

(assert (=> b!573279 d!84759))

(declare-fun d!84765 () Bool)

(assert (=> d!84765 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573277 d!84765))

(declare-fun d!84769 () Bool)

(declare-fun lt!261763 () SeekEntryResult!5668)

(assert (=> d!84769 (and (or ((_ is Undefined!5668) lt!261763) (not ((_ is Found!5668) lt!261763)) (and (bvsge (index!24900 lt!261763) #b00000000000000000000000000000000) (bvslt (index!24900 lt!261763) (size!17587 a!3118)))) (or ((_ is Undefined!5668) lt!261763) ((_ is Found!5668) lt!261763) (not ((_ is MissingZero!5668) lt!261763)) (and (bvsge (index!24899 lt!261763) #b00000000000000000000000000000000) (bvslt (index!24899 lt!261763) (size!17587 a!3118)))) (or ((_ is Undefined!5668) lt!261763) ((_ is Found!5668) lt!261763) ((_ is MissingZero!5668) lt!261763) (not ((_ is MissingVacant!5668) lt!261763)) (and (bvsge (index!24902 lt!261763) #b00000000000000000000000000000000) (bvslt (index!24902 lt!261763) (size!17587 a!3118)))) (or ((_ is Undefined!5668) lt!261763) (ite ((_ is Found!5668) lt!261763) (= (select (arr!17222 a!3118) (index!24900 lt!261763)) (select (arr!17222 a!3118) j!142)) (ite ((_ is MissingZero!5668) lt!261763) (= (select (arr!17222 a!3118) (index!24899 lt!261763)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5668) lt!261763) (= (select (arr!17222 a!3118) (index!24902 lt!261763)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!329890 () SeekEntryResult!5668)

(assert (=> d!84769 (= lt!261763 e!329890)))

(declare-fun c!65710 () Bool)

(declare-fun lt!261764 () SeekEntryResult!5668)

(assert (=> d!84769 (= c!65710 (and ((_ is Intermediate!5668) lt!261764) (undefined!6480 lt!261764)))))

(assert (=> d!84769 (= lt!261764 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17222 a!3118) j!142) mask!3119) (select (arr!17222 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84769 (validMask!0 mask!3119)))

(assert (=> d!84769 (= (seekEntryOrOpen!0 (select (arr!17222 a!3118) j!142) a!3118 mask!3119) lt!261763)))

(declare-fun b!573464 () Bool)

(declare-fun e!329891 () SeekEntryResult!5668)

(assert (=> b!573464 (= e!329891 (MissingZero!5668 (index!24901 lt!261764)))))

(declare-fun b!573465 () Bool)

(declare-fun c!65712 () Bool)

(declare-fun lt!261765 () (_ BitVec 64))

(assert (=> b!573465 (= c!65712 (= lt!261765 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!329889 () SeekEntryResult!5668)

(assert (=> b!573465 (= e!329889 e!329891)))

(declare-fun b!573466 () Bool)

(assert (=> b!573466 (= e!329890 e!329889)))

(assert (=> b!573466 (= lt!261765 (select (arr!17222 a!3118) (index!24901 lt!261764)))))

(declare-fun c!65711 () Bool)

(assert (=> b!573466 (= c!65711 (= lt!261765 (select (arr!17222 a!3118) j!142)))))

(declare-fun b!573467 () Bool)

(assert (=> b!573467 (= e!329890 Undefined!5668)))

(declare-fun b!573468 () Bool)

(assert (=> b!573468 (= e!329891 (seekKeyOrZeroReturnVacant!0 (x!53781 lt!261764) (index!24901 lt!261764) (index!24901 lt!261764) (select (arr!17222 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573469 () Bool)

(assert (=> b!573469 (= e!329889 (Found!5668 (index!24901 lt!261764)))))

(assert (= (and d!84769 c!65710) b!573467))

(assert (= (and d!84769 (not c!65710)) b!573466))

(assert (= (and b!573466 c!65711) b!573469))

(assert (= (and b!573466 (not c!65711)) b!573465))

(assert (= (and b!573465 c!65712) b!573464))

(assert (= (and b!573465 (not c!65712)) b!573468))

(declare-fun m!551939 () Bool)

(assert (=> d!84769 m!551939))

(assert (=> d!84769 m!551789))

(declare-fun m!551941 () Bool)

(assert (=> d!84769 m!551941))

(declare-fun m!551943 () Bool)

(assert (=> d!84769 m!551943))

(assert (=> d!84769 m!551755))

(assert (=> d!84769 m!551767))

(assert (=> d!84769 m!551767))

(assert (=> d!84769 m!551755))

(declare-fun m!551945 () Bool)

(assert (=> d!84769 m!551945))

(declare-fun m!551947 () Bool)

(assert (=> b!573466 m!551947))

(assert (=> b!573468 m!551755))

(declare-fun m!551949 () Bool)

(assert (=> b!573468 m!551949))

(assert (=> b!573288 d!84769))

(declare-fun call!32626 () Bool)

(declare-fun bm!32623 () Bool)

(assert (=> bm!32623 (= call!32626 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!573490 () Bool)

(declare-fun e!329908 () Bool)

(declare-fun e!329907 () Bool)

(assert (=> b!573490 (= e!329908 e!329907)))

(declare-fun c!65718 () Bool)

(assert (=> b!573490 (= c!65718 (validKeyInArray!0 (select (arr!17222 a!3118) j!142)))))

(declare-fun d!84771 () Bool)

(declare-fun res!362774 () Bool)

(assert (=> d!84771 (=> res!362774 e!329908)))

(assert (=> d!84771 (= res!362774 (bvsge j!142 (size!17587 a!3118)))))

(assert (=> d!84771 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!329908)))

(declare-fun b!573491 () Bool)

(declare-fun e!329909 () Bool)

(assert (=> b!573491 (= e!329907 e!329909)))

(declare-fun lt!261792 () (_ BitVec 64))

(assert (=> b!573491 (= lt!261792 (select (arr!17222 a!3118) j!142))))

(declare-fun lt!261793 () Unit!18024)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35869 (_ BitVec 64) (_ BitVec 32)) Unit!18024)

(assert (=> b!573491 (= lt!261793 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!261792 j!142))))

(assert (=> b!573491 (arrayContainsKey!0 a!3118 lt!261792 #b00000000000000000000000000000000)))

(declare-fun lt!261794 () Unit!18024)

(assert (=> b!573491 (= lt!261794 lt!261793)))

(declare-fun res!362775 () Bool)

(assert (=> b!573491 (= res!362775 (= (seekEntryOrOpen!0 (select (arr!17222 a!3118) j!142) a!3118 mask!3119) (Found!5668 j!142)))))

(assert (=> b!573491 (=> (not res!362775) (not e!329909))))

(declare-fun b!573492 () Bool)

(assert (=> b!573492 (= e!329909 call!32626)))

(declare-fun b!573493 () Bool)

(assert (=> b!573493 (= e!329907 call!32626)))

(assert (= (and d!84771 (not res!362774)) b!573490))

(assert (= (and b!573490 c!65718) b!573491))

(assert (= (and b!573490 (not c!65718)) b!573493))

(assert (= (and b!573491 res!362775) b!573492))

(assert (= (or b!573492 b!573493) bm!32623))

(declare-fun m!551959 () Bool)

(assert (=> bm!32623 m!551959))

(assert (=> b!573490 m!551755))

(assert (=> b!573490 m!551755))

(assert (=> b!573490 m!551793))

(assert (=> b!573491 m!551755))

(declare-fun m!551961 () Bool)

(assert (=> b!573491 m!551961))

(declare-fun m!551963 () Bool)

(assert (=> b!573491 m!551963))

(assert (=> b!573491 m!551755))

(assert (=> b!573491 m!551785))

(assert (=> b!573288 d!84771))

(declare-fun d!84783 () Bool)

(assert (=> d!84783 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!261797 () Unit!18024)

(declare-fun choose!38 (array!35869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18024)

(assert (=> d!84783 (= lt!261797 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84783 (validMask!0 mask!3119)))

(assert (=> d!84783 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!261797)))

(declare-fun bs!17732 () Bool)

(assert (= bs!17732 d!84783))

(assert (=> bs!17732 m!551781))

(declare-fun m!551965 () Bool)

(assert (=> bs!17732 m!551965))

(assert (=> bs!17732 m!551789))

(assert (=> b!573288 d!84783))

(declare-fun b!573526 () Bool)

(declare-fun e!329933 () Bool)

(declare-fun call!32630 () Bool)

(assert (=> b!573526 (= e!329933 call!32630)))

(declare-fun bm!32627 () Bool)

(declare-fun c!65731 () Bool)

(assert (=> bm!32627 (= call!32630 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65731 (Cons!11337 (select (arr!17222 a!3118) #b00000000000000000000000000000000) Nil!11338) Nil!11338)))))

(declare-fun d!84785 () Bool)

(declare-fun res!362786 () Bool)

(declare-fun e!329932 () Bool)

(assert (=> d!84785 (=> res!362786 e!329932)))

(assert (=> d!84785 (= res!362786 (bvsge #b00000000000000000000000000000000 (size!17587 a!3118)))))

(assert (=> d!84785 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11338) e!329932)))

(declare-fun b!573527 () Bool)

(declare-fun e!329930 () Bool)

(assert (=> b!573527 (= e!329930 e!329933)))

(assert (=> b!573527 (= c!65731 (validKeyInArray!0 (select (arr!17222 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573528 () Bool)

(declare-fun e!329931 () Bool)

(declare-fun contains!2866 (List!11341 (_ BitVec 64)) Bool)

(assert (=> b!573528 (= e!329931 (contains!2866 Nil!11338 (select (arr!17222 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573529 () Bool)

(assert (=> b!573529 (= e!329932 e!329930)))

(declare-fun res!362784 () Bool)

(assert (=> b!573529 (=> (not res!362784) (not e!329930))))

(assert (=> b!573529 (= res!362784 (not e!329931))))

(declare-fun res!362785 () Bool)

(assert (=> b!573529 (=> (not res!362785) (not e!329931))))

(assert (=> b!573529 (= res!362785 (validKeyInArray!0 (select (arr!17222 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573530 () Bool)

(assert (=> b!573530 (= e!329933 call!32630)))

(assert (= (and d!84785 (not res!362786)) b!573529))

(assert (= (and b!573529 res!362785) b!573528))

(assert (= (and b!573529 res!362784) b!573527))

(assert (= (and b!573527 c!65731) b!573526))

(assert (= (and b!573527 (not c!65731)) b!573530))

(assert (= (or b!573526 b!573530) bm!32627))

(assert (=> bm!32627 m!551899))

(declare-fun m!551991 () Bool)

(assert (=> bm!32627 m!551991))

(assert (=> b!573527 m!551899))

(assert (=> b!573527 m!551899))

(declare-fun m!551993 () Bool)

(assert (=> b!573527 m!551993))

(assert (=> b!573528 m!551899))

(assert (=> b!573528 m!551899))

(declare-fun m!551995 () Bool)

(assert (=> b!573528 m!551995))

(assert (=> b!573529 m!551899))

(assert (=> b!573529 m!551899))

(assert (=> b!573529 m!551993))

(assert (=> b!573283 d!84785))

(declare-fun d!84795 () Bool)

(declare-fun lt!261810 () SeekEntryResult!5668)

(assert (=> d!84795 (and (or ((_ is Undefined!5668) lt!261810) (not ((_ is Found!5668) lt!261810)) (and (bvsge (index!24900 lt!261810) #b00000000000000000000000000000000) (bvslt (index!24900 lt!261810) (size!17587 lt!261670)))) (or ((_ is Undefined!5668) lt!261810) ((_ is Found!5668) lt!261810) (not ((_ is MissingZero!5668) lt!261810)) (and (bvsge (index!24899 lt!261810) #b00000000000000000000000000000000) (bvslt (index!24899 lt!261810) (size!17587 lt!261670)))) (or ((_ is Undefined!5668) lt!261810) ((_ is Found!5668) lt!261810) ((_ is MissingZero!5668) lt!261810) (not ((_ is MissingVacant!5668) lt!261810)) (and (bvsge (index!24902 lt!261810) #b00000000000000000000000000000000) (bvslt (index!24902 lt!261810) (size!17587 lt!261670)))) (or ((_ is Undefined!5668) lt!261810) (ite ((_ is Found!5668) lt!261810) (= (select (arr!17222 lt!261670) (index!24900 lt!261810)) lt!261674) (ite ((_ is MissingZero!5668) lt!261810) (= (select (arr!17222 lt!261670) (index!24899 lt!261810)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5668) lt!261810) (= (select (arr!17222 lt!261670) (index!24902 lt!261810)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!329941 () SeekEntryResult!5668)

(assert (=> d!84795 (= lt!261810 e!329941)))

(declare-fun c!65732 () Bool)

(declare-fun lt!261811 () SeekEntryResult!5668)

(assert (=> d!84795 (= c!65732 (and ((_ is Intermediate!5668) lt!261811) (undefined!6480 lt!261811)))))

(assert (=> d!84795 (= lt!261811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!261674 mask!3119) lt!261674 lt!261670 mask!3119))))

(assert (=> d!84795 (validMask!0 mask!3119)))

(assert (=> d!84795 (= (seekEntryOrOpen!0 lt!261674 lt!261670 mask!3119) lt!261810)))

(declare-fun b!573539 () Bool)

(declare-fun e!329942 () SeekEntryResult!5668)

(assert (=> b!573539 (= e!329942 (MissingZero!5668 (index!24901 lt!261811)))))

(declare-fun b!573540 () Bool)

(declare-fun c!65734 () Bool)

(declare-fun lt!261812 () (_ BitVec 64))

(assert (=> b!573540 (= c!65734 (= lt!261812 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!329940 () SeekEntryResult!5668)

(assert (=> b!573540 (= e!329940 e!329942)))

(declare-fun b!573541 () Bool)

(assert (=> b!573541 (= e!329941 e!329940)))

(assert (=> b!573541 (= lt!261812 (select (arr!17222 lt!261670) (index!24901 lt!261811)))))

(declare-fun c!65733 () Bool)

(assert (=> b!573541 (= c!65733 (= lt!261812 lt!261674))))

(declare-fun b!573542 () Bool)

(assert (=> b!573542 (= e!329941 Undefined!5668)))

(declare-fun b!573543 () Bool)

(assert (=> b!573543 (= e!329942 (seekKeyOrZeroReturnVacant!0 (x!53781 lt!261811) (index!24901 lt!261811) (index!24901 lt!261811) lt!261674 lt!261670 mask!3119))))

(declare-fun b!573544 () Bool)

(assert (=> b!573544 (= e!329940 (Found!5668 (index!24901 lt!261811)))))

(assert (= (and d!84795 c!65732) b!573542))

(assert (= (and d!84795 (not c!65732)) b!573541))

(assert (= (and b!573541 c!65733) b!573544))

(assert (= (and b!573541 (not c!65733)) b!573540))

(assert (= (and b!573540 c!65734) b!573539))

(assert (= (and b!573540 (not c!65734)) b!573543))

(declare-fun m!551997 () Bool)

(assert (=> d!84795 m!551997))

(assert (=> d!84795 m!551789))

(declare-fun m!551999 () Bool)

(assert (=> d!84795 m!551999))

(declare-fun m!552001 () Bool)

(assert (=> d!84795 m!552001))

(assert (=> d!84795 m!551773))

(assert (=> d!84795 m!551773))

(declare-fun m!552003 () Bool)

(assert (=> d!84795 m!552003))

(declare-fun m!552005 () Bool)

(assert (=> b!573541 m!552005))

(declare-fun m!552007 () Bool)

(assert (=> b!573543 m!552007))

(assert (=> b!573286 d!84795))

(declare-fun b!573547 () Bool)

(declare-fun e!329945 () SeekEntryResult!5668)

(declare-fun e!329946 () SeekEntryResult!5668)

(assert (=> b!573547 (= e!329945 e!329946)))

(declare-fun c!65739 () Bool)

(declare-fun lt!261814 () (_ BitVec 64))

(assert (=> b!573547 (= c!65739 (= lt!261814 lt!261674))))

(declare-fun b!573548 () Bool)

(declare-fun e!329947 () SeekEntryResult!5668)

(assert (=> b!573548 (= e!329947 (MissingVacant!5668 (index!24901 lt!261675)))))

(declare-fun b!573549 () Bool)

(declare-fun c!65737 () Bool)

(assert (=> b!573549 (= c!65737 (= lt!261814 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573549 (= e!329946 e!329947)))

(declare-fun b!573550 () Bool)

(assert (=> b!573550 (= e!329945 Undefined!5668)))

(declare-fun b!573551 () Bool)

(assert (=> b!573551 (= e!329947 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53781 lt!261675) #b00000000000000000000000000000001) (nextIndex!0 (index!24901 lt!261675) (x!53781 lt!261675) mask!3119) (index!24901 lt!261675) lt!261674 lt!261670 mask!3119))))

(declare-fun b!573552 () Bool)

(assert (=> b!573552 (= e!329946 (Found!5668 (index!24901 lt!261675)))))

(declare-fun d!84797 () Bool)

(declare-fun lt!261813 () SeekEntryResult!5668)

(assert (=> d!84797 (and (or ((_ is Undefined!5668) lt!261813) (not ((_ is Found!5668) lt!261813)) (and (bvsge (index!24900 lt!261813) #b00000000000000000000000000000000) (bvslt (index!24900 lt!261813) (size!17587 lt!261670)))) (or ((_ is Undefined!5668) lt!261813) ((_ is Found!5668) lt!261813) (not ((_ is MissingVacant!5668) lt!261813)) (not (= (index!24902 lt!261813) (index!24901 lt!261675))) (and (bvsge (index!24902 lt!261813) #b00000000000000000000000000000000) (bvslt (index!24902 lt!261813) (size!17587 lt!261670)))) (or ((_ is Undefined!5668) lt!261813) (ite ((_ is Found!5668) lt!261813) (= (select (arr!17222 lt!261670) (index!24900 lt!261813)) lt!261674) (and ((_ is MissingVacant!5668) lt!261813) (= (index!24902 lt!261813) (index!24901 lt!261675)) (= (select (arr!17222 lt!261670) (index!24902 lt!261813)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84797 (= lt!261813 e!329945)))

(declare-fun c!65738 () Bool)

(assert (=> d!84797 (= c!65738 (bvsge (x!53781 lt!261675) #b01111111111111111111111111111110))))

(assert (=> d!84797 (= lt!261814 (select (arr!17222 lt!261670) (index!24901 lt!261675)))))

(assert (=> d!84797 (validMask!0 mask!3119)))

(assert (=> d!84797 (= (seekKeyOrZeroReturnVacant!0 (x!53781 lt!261675) (index!24901 lt!261675) (index!24901 lt!261675) lt!261674 lt!261670 mask!3119) lt!261813)))

(assert (= (and d!84797 c!65738) b!573550))

(assert (= (and d!84797 (not c!65738)) b!573547))

(assert (= (and b!573547 c!65739) b!573552))

(assert (= (and b!573547 (not c!65739)) b!573549))

(assert (= (and b!573549 c!65737) b!573548))

(assert (= (and b!573549 (not c!65737)) b!573551))

(assert (=> b!573551 m!551923))

(assert (=> b!573551 m!551923))

(declare-fun m!552009 () Bool)

(assert (=> b!573551 m!552009))

(declare-fun m!552011 () Bool)

(assert (=> d!84797 m!552011))

(declare-fun m!552013 () Bool)

(assert (=> d!84797 m!552013))

(declare-fun m!552015 () Bool)

(assert (=> d!84797 m!552015))

(assert (=> d!84797 m!551789))

(assert (=> b!573286 d!84797))

(declare-fun d!84799 () Bool)

(assert (=> d!84799 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52526 d!84799))

(declare-fun d!84809 () Bool)

(assert (=> d!84809 (= (array_inv!13105 a!3118) (bvsge (size!17587 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52526 d!84809))

(declare-fun bm!32634 () Bool)

(declare-fun call!32637 () Bool)

(assert (=> bm!32634 (= call!32637 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!573570 () Bool)

(declare-fun e!329962 () Bool)

(declare-fun e!329961 () Bool)

(assert (=> b!573570 (= e!329962 e!329961)))

(declare-fun c!65744 () Bool)

(assert (=> b!573570 (= c!65744 (validKeyInArray!0 (select (arr!17222 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84811 () Bool)

(declare-fun res!362802 () Bool)

(assert (=> d!84811 (=> res!362802 e!329962)))

(assert (=> d!84811 (= res!362802 (bvsge #b00000000000000000000000000000000 (size!17587 a!3118)))))

(assert (=> d!84811 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!329962)))

(declare-fun b!573571 () Bool)

(declare-fun e!329963 () Bool)

(assert (=> b!573571 (= e!329961 e!329963)))

(declare-fun lt!261827 () (_ BitVec 64))

(assert (=> b!573571 (= lt!261827 (select (arr!17222 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!261828 () Unit!18024)

(assert (=> b!573571 (= lt!261828 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!261827 #b00000000000000000000000000000000))))

(assert (=> b!573571 (arrayContainsKey!0 a!3118 lt!261827 #b00000000000000000000000000000000)))

(declare-fun lt!261829 () Unit!18024)

(assert (=> b!573571 (= lt!261829 lt!261828)))

(declare-fun res!362803 () Bool)

(assert (=> b!573571 (= res!362803 (= (seekEntryOrOpen!0 (select (arr!17222 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5668 #b00000000000000000000000000000000)))))

(assert (=> b!573571 (=> (not res!362803) (not e!329963))))

(declare-fun b!573572 () Bool)

(assert (=> b!573572 (= e!329963 call!32637)))

(declare-fun b!573573 () Bool)

(assert (=> b!573573 (= e!329961 call!32637)))

(assert (= (and d!84811 (not res!362802)) b!573570))

(assert (= (and b!573570 c!65744) b!573571))

(assert (= (and b!573570 (not c!65744)) b!573573))

(assert (= (and b!573571 res!362803) b!573572))

(assert (= (or b!573572 b!573573) bm!32634))

(declare-fun m!552029 () Bool)

(assert (=> bm!32634 m!552029))

(assert (=> b!573570 m!551899))

(assert (=> b!573570 m!551899))

(assert (=> b!573570 m!551993))

(assert (=> b!573571 m!551899))

(declare-fun m!552031 () Bool)

(assert (=> b!573571 m!552031))

(declare-fun m!552033 () Bool)

(assert (=> b!573571 m!552033))

(assert (=> b!573571 m!551899))

(declare-fun m!552035 () Bool)

(assert (=> b!573571 m!552035))

(assert (=> b!573281 d!84811))

(declare-fun b!573677 () Bool)

(declare-fun lt!261857 () SeekEntryResult!5668)

(assert (=> b!573677 (and (bvsge (index!24901 lt!261857) #b00000000000000000000000000000000) (bvslt (index!24901 lt!261857) (size!17587 lt!261670)))))

(declare-fun e!330030 () Bool)

(assert (=> b!573677 (= e!330030 (= (select (arr!17222 lt!261670) (index!24901 lt!261857)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!573678 () Bool)

(declare-fun e!330031 () SeekEntryResult!5668)

(declare-fun e!330033 () SeekEntryResult!5668)

(assert (=> b!573678 (= e!330031 e!330033)))

(declare-fun c!65780 () Bool)

(declare-fun lt!261856 () (_ BitVec 64))

(assert (=> b!573678 (= c!65780 (or (= lt!261856 lt!261674) (= (bvadd lt!261856 lt!261856) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!573679 () Bool)

(assert (=> b!573679 (= e!330031 (Intermediate!5668 true lt!261668 #b00000000000000000000000000000000))))

(declare-fun b!573680 () Bool)

(assert (=> b!573680 (= e!330033 (Intermediate!5668 false lt!261668 #b00000000000000000000000000000000))))

(declare-fun b!573682 () Bool)

(assert (=> b!573682 (and (bvsge (index!24901 lt!261857) #b00000000000000000000000000000000) (bvslt (index!24901 lt!261857) (size!17587 lt!261670)))))

(declare-fun res!362841 () Bool)

(assert (=> b!573682 (= res!362841 (= (select (arr!17222 lt!261670) (index!24901 lt!261857)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573682 (=> res!362841 e!330030)))

(declare-fun b!573683 () Bool)

(assert (=> b!573683 (= e!330033 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261668 #b00000000000000000000000000000000 mask!3119) lt!261674 lt!261670 mask!3119))))

(declare-fun b!573684 () Bool)

(declare-fun e!330032 () Bool)

(declare-fun e!330029 () Bool)

(assert (=> b!573684 (= e!330032 e!330029)))

(declare-fun res!362839 () Bool)

(assert (=> b!573684 (= res!362839 (and ((_ is Intermediate!5668) lt!261857) (not (undefined!6480 lt!261857)) (bvslt (x!53781 lt!261857) #b01111111111111111111111111111110) (bvsge (x!53781 lt!261857) #b00000000000000000000000000000000) (bvsge (x!53781 lt!261857) #b00000000000000000000000000000000)))))

(assert (=> b!573684 (=> (not res!362839) (not e!330029))))

(declare-fun b!573685 () Bool)

(assert (=> b!573685 (and (bvsge (index!24901 lt!261857) #b00000000000000000000000000000000) (bvslt (index!24901 lt!261857) (size!17587 lt!261670)))))

(declare-fun res!362840 () Bool)

(assert (=> b!573685 (= res!362840 (= (select (arr!17222 lt!261670) (index!24901 lt!261857)) lt!261674))))

(assert (=> b!573685 (=> res!362840 e!330030)))

(assert (=> b!573685 (= e!330029 e!330030)))

(declare-fun b!573681 () Bool)

(assert (=> b!573681 (= e!330032 (bvsge (x!53781 lt!261857) #b01111111111111111111111111111110))))

(declare-fun d!84813 () Bool)

(assert (=> d!84813 e!330032))

(declare-fun c!65779 () Bool)

(assert (=> d!84813 (= c!65779 (and ((_ is Intermediate!5668) lt!261857) (undefined!6480 lt!261857)))))

(assert (=> d!84813 (= lt!261857 e!330031)))

(declare-fun c!65781 () Bool)

(assert (=> d!84813 (= c!65781 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84813 (= lt!261856 (select (arr!17222 lt!261670) lt!261668))))

(assert (=> d!84813 (validMask!0 mask!3119)))

(assert (=> d!84813 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261668 lt!261674 lt!261670 mask!3119) lt!261857)))

(assert (= (and d!84813 c!65781) b!573679))

(assert (= (and d!84813 (not c!65781)) b!573678))

(assert (= (and b!573678 c!65780) b!573680))

(assert (= (and b!573678 (not c!65780)) b!573683))

(assert (= (and d!84813 c!65779) b!573681))

(assert (= (and d!84813 (not c!65779)) b!573684))

(assert (= (and b!573684 res!362839) b!573685))

(assert (= (and b!573685 (not res!362840)) b!573682))

(assert (= (and b!573682 (not res!362841)) b!573677))

(declare-fun m!552105 () Bool)

(assert (=> b!573682 m!552105))

(assert (=> b!573677 m!552105))

(declare-fun m!552107 () Bool)

(assert (=> b!573683 m!552107))

(assert (=> b!573683 m!552107))

(declare-fun m!552109 () Bool)

(assert (=> b!573683 m!552109))

(declare-fun m!552111 () Bool)

(assert (=> d!84813 m!552111))

(assert (=> d!84813 m!551789))

(assert (=> b!573685 m!552105))

(assert (=> b!573287 d!84813))

(declare-fun b!573686 () Bool)

(declare-fun lt!261859 () SeekEntryResult!5668)

(assert (=> b!573686 (and (bvsge (index!24901 lt!261859) #b00000000000000000000000000000000) (bvslt (index!24901 lt!261859) (size!17587 a!3118)))))

(declare-fun e!330035 () Bool)

(assert (=> b!573686 (= e!330035 (= (select (arr!17222 a!3118) (index!24901 lt!261859)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!573687 () Bool)

(declare-fun e!330036 () SeekEntryResult!5668)

(declare-fun e!330038 () SeekEntryResult!5668)

(assert (=> b!573687 (= e!330036 e!330038)))

(declare-fun lt!261858 () (_ BitVec 64))

(declare-fun c!65783 () Bool)

(assert (=> b!573687 (= c!65783 (or (= lt!261858 (select (arr!17222 a!3118) j!142)) (= (bvadd lt!261858 lt!261858) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!573688 () Bool)

(assert (=> b!573688 (= e!330036 (Intermediate!5668 true lt!261671 #b00000000000000000000000000000000))))

(declare-fun b!573689 () Bool)

(assert (=> b!573689 (= e!330038 (Intermediate!5668 false lt!261671 #b00000000000000000000000000000000))))

(declare-fun b!573691 () Bool)

(assert (=> b!573691 (and (bvsge (index!24901 lt!261859) #b00000000000000000000000000000000) (bvslt (index!24901 lt!261859) (size!17587 a!3118)))))

(declare-fun res!362844 () Bool)

(assert (=> b!573691 (= res!362844 (= (select (arr!17222 a!3118) (index!24901 lt!261859)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573691 (=> res!362844 e!330035)))

(declare-fun b!573692 () Bool)

(assert (=> b!573692 (= e!330038 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261671 #b00000000000000000000000000000000 mask!3119) (select (arr!17222 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573693 () Bool)

(declare-fun e!330037 () Bool)

(declare-fun e!330034 () Bool)

(assert (=> b!573693 (= e!330037 e!330034)))

(declare-fun res!362842 () Bool)

(assert (=> b!573693 (= res!362842 (and ((_ is Intermediate!5668) lt!261859) (not (undefined!6480 lt!261859)) (bvslt (x!53781 lt!261859) #b01111111111111111111111111111110) (bvsge (x!53781 lt!261859) #b00000000000000000000000000000000) (bvsge (x!53781 lt!261859) #b00000000000000000000000000000000)))))

(assert (=> b!573693 (=> (not res!362842) (not e!330034))))

(declare-fun b!573694 () Bool)

(assert (=> b!573694 (and (bvsge (index!24901 lt!261859) #b00000000000000000000000000000000) (bvslt (index!24901 lt!261859) (size!17587 a!3118)))))

(declare-fun res!362843 () Bool)

(assert (=> b!573694 (= res!362843 (= (select (arr!17222 a!3118) (index!24901 lt!261859)) (select (arr!17222 a!3118) j!142)))))

(assert (=> b!573694 (=> res!362843 e!330035)))

(assert (=> b!573694 (= e!330034 e!330035)))

(declare-fun b!573690 () Bool)

(assert (=> b!573690 (= e!330037 (bvsge (x!53781 lt!261859) #b01111111111111111111111111111110))))

(declare-fun d!84837 () Bool)

(assert (=> d!84837 e!330037))

(declare-fun c!65782 () Bool)

(assert (=> d!84837 (= c!65782 (and ((_ is Intermediate!5668) lt!261859) (undefined!6480 lt!261859)))))

(assert (=> d!84837 (= lt!261859 e!330036)))

(declare-fun c!65784 () Bool)

(assert (=> d!84837 (= c!65784 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84837 (= lt!261858 (select (arr!17222 a!3118) lt!261671))))

(assert (=> d!84837 (validMask!0 mask!3119)))

(assert (=> d!84837 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261671 (select (arr!17222 a!3118) j!142) a!3118 mask!3119) lt!261859)))

(assert (= (and d!84837 c!65784) b!573688))

(assert (= (and d!84837 (not c!65784)) b!573687))

(assert (= (and b!573687 c!65783) b!573689))

(assert (= (and b!573687 (not c!65783)) b!573692))

(assert (= (and d!84837 c!65782) b!573690))

(assert (= (and d!84837 (not c!65782)) b!573693))

(assert (= (and b!573693 res!362842) b!573694))

(assert (= (and b!573694 (not res!362843)) b!573691))

(assert (= (and b!573691 (not res!362844)) b!573686))

(declare-fun m!552113 () Bool)

(assert (=> b!573691 m!552113))

(assert (=> b!573686 m!552113))

(declare-fun m!552115 () Bool)

(assert (=> b!573692 m!552115))

(assert (=> b!573692 m!552115))

(assert (=> b!573692 m!551755))

(declare-fun m!552117 () Bool)

(assert (=> b!573692 m!552117))

(declare-fun m!552119 () Bool)

(assert (=> d!84837 m!552119))

(assert (=> d!84837 m!551789))

(assert (=> b!573694 m!552113))

(assert (=> b!573287 d!84837))

(declare-fun d!84839 () Bool)

(declare-fun lt!261873 () (_ BitVec 32))

(declare-fun lt!261872 () (_ BitVec 32))

(assert (=> d!84839 (= lt!261873 (bvmul (bvxor lt!261872 (bvlshr lt!261872 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84839 (= lt!261872 ((_ extract 31 0) (bvand (bvxor lt!261674 (bvlshr lt!261674 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84839 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362845 (let ((h!12371 ((_ extract 31 0) (bvand (bvxor lt!261674 (bvlshr lt!261674 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53790 (bvmul (bvxor h!12371 (bvlshr h!12371 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53790 (bvlshr x!53790 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362845 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362845 #b00000000000000000000000000000000))))))

(assert (=> d!84839 (= (toIndex!0 lt!261674 mask!3119) (bvand (bvxor lt!261873 (bvlshr lt!261873 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573287 d!84839))

(declare-fun d!84845 () Bool)

(declare-fun lt!261875 () (_ BitVec 32))

(declare-fun lt!261874 () (_ BitVec 32))

(assert (=> d!84845 (= lt!261875 (bvmul (bvxor lt!261874 (bvlshr lt!261874 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84845 (= lt!261874 ((_ extract 31 0) (bvand (bvxor (select (arr!17222 a!3118) j!142) (bvlshr (select (arr!17222 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84845 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362845 (let ((h!12371 ((_ extract 31 0) (bvand (bvxor (select (arr!17222 a!3118) j!142) (bvlshr (select (arr!17222 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53790 (bvmul (bvxor h!12371 (bvlshr h!12371 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53790 (bvlshr x!53790 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362845 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362845 #b00000000000000000000000000000000))))))

(assert (=> d!84845 (= (toIndex!0 (select (arr!17222 a!3118) j!142) mask!3119) (bvand (bvxor lt!261875 (bvlshr lt!261875 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573287 d!84845))

(declare-fun d!84847 () Bool)

(assert (=> d!84847 (= (validKeyInArray!0 (select (arr!17222 a!3118) j!142)) (and (not (= (select (arr!17222 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17222 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573280 d!84847))

(check-sat (not d!84813) (not b!573570) (not d!84769) (not b!573692) (not b!573529) (not d!84783) (not b!573571) (not b!573391) (not d!84837) (not b!573683) (not b!573468) (not d!84795) (not d!84751) (not b!573490) (not b!573527) (not bm!32627) (not b!573528) (not b!573491) (not d!84759) (not b!573543) (not d!84797) (not bm!32634) (not b!573551) (not b!573384) (not bm!32623) (not b!573453))
(check-sat)
