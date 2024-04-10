; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52890 () Bool)

(assert start!52890)

(declare-fun b!576602 () Bool)

(declare-fun res!364840 () Bool)

(declare-fun e!331712 () Bool)

(assert (=> b!576602 (=> (not res!364840) (not e!331712))))

(declare-datatypes ((array!35978 0))(
  ( (array!35979 (arr!17270 (Array (_ BitVec 32) (_ BitVec 64))) (size!17634 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35978)

(declare-datatypes ((List!11350 0))(
  ( (Nil!11347) (Cons!11346 (h!12388 (_ BitVec 64)) (t!17578 List!11350)) )
))
(declare-fun arrayNoDuplicates!0 (array!35978 (_ BitVec 32) List!11350) Bool)

(assert (=> b!576602 (= res!364840 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11347))))

(declare-fun b!576603 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!331716 () Bool)

(declare-fun lt!263757 () (_ BitVec 64))

(declare-fun lt!263753 () array!35978)

(declare-datatypes ((SeekEntryResult!5719 0))(
  ( (MissingZero!5719 (index!25103 (_ BitVec 32))) (Found!5719 (index!25104 (_ BitVec 32))) (Intermediate!5719 (undefined!6531 Bool) (index!25105 (_ BitVec 32)) (x!53990 (_ BitVec 32))) (Undefined!5719) (MissingVacant!5719 (index!25106 (_ BitVec 32))) )
))
(declare-fun lt!263755 () SeekEntryResult!5719)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35978 (_ BitVec 32)) SeekEntryResult!5719)

(assert (=> b!576603 (= e!331716 (= lt!263755 (seekEntryOrOpen!0 lt!263757 lt!263753 mask!3119)))))

(declare-fun b!576604 () Bool)

(declare-fun e!331714 () Bool)

(assert (=> b!576604 (= e!331714 e!331712)))

(declare-fun res!364839 () Bool)

(assert (=> b!576604 (=> (not res!364839) (not e!331712))))

(declare-fun lt!263756 () SeekEntryResult!5719)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!576604 (= res!364839 (or (= lt!263756 (MissingZero!5719 i!1132)) (= lt!263756 (MissingVacant!5719 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!576604 (= lt!263756 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!576605 () Bool)

(declare-fun res!364842 () Bool)

(assert (=> b!576605 (=> (not res!364842) (not e!331714))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!576605 (= res!364842 (and (= (size!17634 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17634 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17634 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576606 () Bool)

(declare-fun e!331715 () Bool)

(assert (=> b!576606 (= e!331712 e!331715)))

(declare-fun res!364841 () Bool)

(assert (=> b!576606 (=> (not res!364841) (not e!331715))))

(declare-fun lt!263750 () (_ BitVec 32))

(declare-fun lt!263751 () SeekEntryResult!5719)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35978 (_ BitVec 32)) SeekEntryResult!5719)

(assert (=> b!576606 (= res!364841 (= lt!263751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263750 lt!263757 lt!263753 mask!3119)))))

(declare-fun lt!263754 () (_ BitVec 32))

(assert (=> b!576606 (= lt!263751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263754 (select (arr!17270 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576606 (= lt!263750 (toIndex!0 lt!263757 mask!3119))))

(assert (=> b!576606 (= lt!263757 (select (store (arr!17270 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!576606 (= lt!263754 (toIndex!0 (select (arr!17270 a!3118) j!142) mask!3119))))

(assert (=> b!576606 (= lt!263753 (array!35979 (store (arr!17270 a!3118) i!1132 k!1914) (size!17634 a!3118)))))

(declare-fun b!576607 () Bool)

(declare-fun res!364843 () Bool)

(assert (=> b!576607 (=> (not res!364843) (not e!331714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576607 (= res!364843 (validKeyInArray!0 (select (arr!17270 a!3118) j!142)))))

(declare-fun res!364835 () Bool)

(assert (=> start!52890 (=> (not res!364835) (not e!331714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52890 (= res!364835 (validMask!0 mask!3119))))

(assert (=> start!52890 e!331714))

(assert (=> start!52890 true))

(declare-fun array_inv!13066 (array!35978) Bool)

(assert (=> start!52890 (array_inv!13066 a!3118)))

(declare-fun b!576608 () Bool)

(declare-fun res!364836 () Bool)

(assert (=> b!576608 (=> (not res!364836) (not e!331714))))

(declare-fun arrayContainsKey!0 (array!35978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576608 (= res!364836 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576609 () Bool)

(declare-fun res!364837 () Bool)

(assert (=> b!576609 (=> (not res!364837) (not e!331712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35978 (_ BitVec 32)) Bool)

(assert (=> b!576609 (= res!364837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576610 () Bool)

(assert (=> b!576610 (= e!331715 (not e!331716))))

(declare-fun res!364838 () Bool)

(assert (=> b!576610 (=> res!364838 e!331716)))

(declare-fun lt!263758 () Bool)

(assert (=> b!576610 (= res!364838 (or (and (not lt!263758) (undefined!6531 lt!263751)) (and (not lt!263758) (not (undefined!6531 lt!263751)))))))

(assert (=> b!576610 (= lt!263758 (not (is-Intermediate!5719 lt!263751)))))

(assert (=> b!576610 (= lt!263755 (Found!5719 j!142))))

(assert (=> b!576610 (= lt!263755 (seekEntryOrOpen!0 (select (arr!17270 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!576610 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18140 0))(
  ( (Unit!18141) )
))
(declare-fun lt!263752 () Unit!18140)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35978 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18140)

(assert (=> b!576610 (= lt!263752 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576611 () Bool)

(declare-fun res!364844 () Bool)

(assert (=> b!576611 (=> (not res!364844) (not e!331714))))

(assert (=> b!576611 (= res!364844 (validKeyInArray!0 k!1914))))

(assert (= (and start!52890 res!364835) b!576605))

(assert (= (and b!576605 res!364842) b!576607))

(assert (= (and b!576607 res!364843) b!576611))

(assert (= (and b!576611 res!364844) b!576608))

(assert (= (and b!576608 res!364836) b!576604))

(assert (= (and b!576604 res!364839) b!576609))

(assert (= (and b!576609 res!364837) b!576602))

(assert (= (and b!576602 res!364840) b!576606))

(assert (= (and b!576606 res!364841) b!576610))

(assert (= (and b!576610 (not res!364838)) b!576603))

(declare-fun m!555601 () Bool)

(assert (=> b!576604 m!555601))

(declare-fun m!555603 () Bool)

(assert (=> b!576609 m!555603))

(declare-fun m!555605 () Bool)

(assert (=> b!576608 m!555605))

(declare-fun m!555607 () Bool)

(assert (=> b!576607 m!555607))

(assert (=> b!576607 m!555607))

(declare-fun m!555609 () Bool)

(assert (=> b!576607 m!555609))

(assert (=> b!576606 m!555607))

(declare-fun m!555611 () Bool)

(assert (=> b!576606 m!555611))

(assert (=> b!576606 m!555607))

(declare-fun m!555613 () Bool)

(assert (=> b!576606 m!555613))

(declare-fun m!555615 () Bool)

(assert (=> b!576606 m!555615))

(declare-fun m!555617 () Bool)

(assert (=> b!576606 m!555617))

(declare-fun m!555619 () Bool)

(assert (=> b!576606 m!555619))

(assert (=> b!576606 m!555607))

(declare-fun m!555621 () Bool)

(assert (=> b!576606 m!555621))

(assert (=> b!576610 m!555607))

(assert (=> b!576610 m!555607))

(declare-fun m!555623 () Bool)

(assert (=> b!576610 m!555623))

(declare-fun m!555625 () Bool)

(assert (=> b!576610 m!555625))

(declare-fun m!555627 () Bool)

(assert (=> b!576610 m!555627))

(declare-fun m!555629 () Bool)

(assert (=> b!576611 m!555629))

(declare-fun m!555631 () Bool)

(assert (=> start!52890 m!555631))

(declare-fun m!555633 () Bool)

(assert (=> start!52890 m!555633))

(declare-fun m!555635 () Bool)

(assert (=> b!576603 m!555635))

(declare-fun m!555637 () Bool)

(assert (=> b!576602 m!555637))

(push 1)

(assert (not b!576611))

(assert (not b!576602))

(assert (not b!576607))

(assert (not b!576609))

(assert (not b!576606))

(assert (not b!576610))

(assert (not b!576603))

(assert (not b!576608))

(assert (not start!52890))

(assert (not b!576604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!85413 () Bool)

(assert (=> d!85413 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52890 d!85413))

(declare-fun d!85417 () Bool)

(assert (=> d!85417 (= (array_inv!13066 a!3118) (bvsge (size!17634 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52890 d!85417))

(declare-fun b!576696 () Bool)

(declare-fun e!331768 () SeekEntryResult!5719)

(declare-fun e!331767 () SeekEntryResult!5719)

(assert (=> b!576696 (= e!331768 e!331767)))

(declare-fun lt!263799 () (_ BitVec 64))

(declare-fun lt!263800 () SeekEntryResult!5719)

(assert (=> b!576696 (= lt!263799 (select (arr!17270 a!3118) (index!25105 lt!263800)))))

(declare-fun c!66279 () Bool)

(assert (=> b!576696 (= c!66279 (= lt!263799 (select (arr!17270 a!3118) j!142)))))

(declare-fun b!576697 () Bool)

(assert (=> b!576697 (= e!331768 Undefined!5719)))

(declare-fun e!331769 () SeekEntryResult!5719)

(declare-fun b!576699 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35978 (_ BitVec 32)) SeekEntryResult!5719)

(assert (=> b!576699 (= e!331769 (seekKeyOrZeroReturnVacant!0 (x!53990 lt!263800) (index!25105 lt!263800) (index!25105 lt!263800) (select (arr!17270 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!85419 () Bool)

(declare-fun lt!263801 () SeekEntryResult!5719)

(assert (=> d!85419 (and (or (is-Undefined!5719 lt!263801) (not (is-Found!5719 lt!263801)) (and (bvsge (index!25104 lt!263801) #b00000000000000000000000000000000) (bvslt (index!25104 lt!263801) (size!17634 a!3118)))) (or (is-Undefined!5719 lt!263801) (is-Found!5719 lt!263801) (not (is-MissingZero!5719 lt!263801)) (and (bvsge (index!25103 lt!263801) #b00000000000000000000000000000000) (bvslt (index!25103 lt!263801) (size!17634 a!3118)))) (or (is-Undefined!5719 lt!263801) (is-Found!5719 lt!263801) (is-MissingZero!5719 lt!263801) (not (is-MissingVacant!5719 lt!263801)) (and (bvsge (index!25106 lt!263801) #b00000000000000000000000000000000) (bvslt (index!25106 lt!263801) (size!17634 a!3118)))) (or (is-Undefined!5719 lt!263801) (ite (is-Found!5719 lt!263801) (= (select (arr!17270 a!3118) (index!25104 lt!263801)) (select (arr!17270 a!3118) j!142)) (ite (is-MissingZero!5719 lt!263801) (= (select (arr!17270 a!3118) (index!25103 lt!263801)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5719 lt!263801) (= (select (arr!17270 a!3118) (index!25106 lt!263801)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85419 (= lt!263801 e!331768)))

(declare-fun c!66280 () Bool)

(assert (=> d!85419 (= c!66280 (and (is-Intermediate!5719 lt!263800) (undefined!6531 lt!263800)))))

(assert (=> d!85419 (= lt!263800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17270 a!3118) j!142) mask!3119) (select (arr!17270 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85419 (validMask!0 mask!3119)))

(assert (=> d!85419 (= (seekEntryOrOpen!0 (select (arr!17270 a!3118) j!142) a!3118 mask!3119) lt!263801)))

(declare-fun b!576698 () Bool)

(assert (=> b!576698 (= e!331769 (MissingZero!5719 (index!25105 lt!263800)))))

(declare-fun b!576700 () Bool)

(declare-fun c!66281 () Bool)

(assert (=> b!576700 (= c!66281 (= lt!263799 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576700 (= e!331767 e!331769)))

(declare-fun b!576701 () Bool)

(assert (=> b!576701 (= e!331767 (Found!5719 (index!25105 lt!263800)))))

(assert (= (and d!85419 c!66280) b!576697))

(assert (= (and d!85419 (not c!66280)) b!576696))

(assert (= (and b!576696 c!66279) b!576701))

(assert (= (and b!576696 (not c!66279)) b!576700))

(assert (= (and b!576700 c!66281) b!576698))

(assert (= (and b!576700 (not c!66281)) b!576699))

(declare-fun m!555681 () Bool)

(assert (=> b!576696 m!555681))

(assert (=> b!576699 m!555607))

(declare-fun m!555683 () Bool)

(assert (=> b!576699 m!555683))

(declare-fun m!555685 () Bool)

(assert (=> d!85419 m!555685))

(assert (=> d!85419 m!555631))

(assert (=> d!85419 m!555607))

(assert (=> d!85419 m!555611))

(declare-fun m!555687 () Bool)

(assert (=> d!85419 m!555687))

(assert (=> d!85419 m!555611))

(assert (=> d!85419 m!555607))

(declare-fun m!555689 () Bool)

(assert (=> d!85419 m!555689))

(declare-fun m!555691 () Bool)

(assert (=> d!85419 m!555691))

(assert (=> b!576610 d!85419))

(declare-fun d!85431 () Bool)

(declare-fun res!364880 () Bool)

(declare-fun e!331785 () Bool)

(assert (=> d!85431 (=> res!364880 e!331785)))

(assert (=> d!85431 (= res!364880 (bvsge j!142 (size!17634 a!3118)))))

(assert (=> d!85431 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!331785)))

(declare-fun b!576722 () Bool)

(declare-fun e!331786 () Bool)

(declare-fun call!32738 () Bool)

(assert (=> b!576722 (= e!331786 call!32738)))

(declare-fun b!576723 () Bool)

(declare-fun e!331787 () Bool)

(assert (=> b!576723 (= e!331785 e!331787)))

(declare-fun c!66287 () Bool)

(assert (=> b!576723 (= c!66287 (validKeyInArray!0 (select (arr!17270 a!3118) j!142)))))

(declare-fun b!576724 () Bool)

(assert (=> b!576724 (= e!331787 e!331786)))

(declare-fun lt!263820 () (_ BitVec 64))

(assert (=> b!576724 (= lt!263820 (select (arr!17270 a!3118) j!142))))

(declare-fun lt!263821 () Unit!18140)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35978 (_ BitVec 64) (_ BitVec 32)) Unit!18140)

(assert (=> b!576724 (= lt!263821 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!263820 j!142))))

(assert (=> b!576724 (arrayContainsKey!0 a!3118 lt!263820 #b00000000000000000000000000000000)))

(declare-fun lt!263822 () Unit!18140)

(assert (=> b!576724 (= lt!263822 lt!263821)))

(declare-fun res!364881 () Bool)

(assert (=> b!576724 (= res!364881 (= (seekEntryOrOpen!0 (select (arr!17270 a!3118) j!142) a!3118 mask!3119) (Found!5719 j!142)))))

(assert (=> b!576724 (=> (not res!364881) (not e!331786))))

(declare-fun b!576725 () Bool)

(assert (=> b!576725 (= e!331787 call!32738)))

(declare-fun bm!32735 () Bool)

(assert (=> bm!32735 (= call!32738 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!85431 (not res!364880)) b!576723))

(assert (= (and b!576723 c!66287) b!576724))

(assert (= (and b!576723 (not c!66287)) b!576725))

(assert (= (and b!576724 res!364881) b!576722))

(assert (= (or b!576722 b!576725) bm!32735))

(assert (=> b!576723 m!555607))

(assert (=> b!576723 m!555607))

(assert (=> b!576723 m!555609))

(assert (=> b!576724 m!555607))

(declare-fun m!555701 () Bool)

(assert (=> b!576724 m!555701))

(declare-fun m!555703 () Bool)

(assert (=> b!576724 m!555703))

(assert (=> b!576724 m!555607))

(assert (=> b!576724 m!555623))

(declare-fun m!555705 () Bool)

(assert (=> bm!32735 m!555705))

(assert (=> b!576610 d!85431))

(declare-fun d!85437 () Bool)

(assert (=> d!85437 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!263831 () Unit!18140)

(declare-fun choose!38 (array!35978 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18140)

(assert (=> d!85437 (= lt!263831 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85437 (validMask!0 mask!3119)))

(assert (=> d!85437 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!263831)))

(declare-fun bs!17819 () Bool)

(assert (= bs!17819 d!85437))

(assert (=> bs!17819 m!555625))

(declare-fun m!555707 () Bool)

(assert (=> bs!17819 m!555707))

(assert (=> bs!17819 m!555631))

(assert (=> b!576610 d!85437))

(declare-fun b!576748 () Bool)

(declare-fun e!331803 () SeekEntryResult!5719)

(declare-fun e!331802 () SeekEntryResult!5719)

(assert (=> b!576748 (= e!331803 e!331802)))

(declare-fun lt!263832 () (_ BitVec 64))

(declare-fun lt!263833 () SeekEntryResult!5719)

(assert (=> b!576748 (= lt!263832 (select (arr!17270 a!3118) (index!25105 lt!263833)))))

(declare-fun c!66296 () Bool)

(assert (=> b!576748 (= c!66296 (= lt!263832 k!1914))))

(declare-fun b!576749 () Bool)

(assert (=> b!576749 (= e!331803 Undefined!5719)))

(declare-fun e!331804 () SeekEntryResult!5719)

(declare-fun b!576751 () Bool)

(assert (=> b!576751 (= e!331804 (seekKeyOrZeroReturnVacant!0 (x!53990 lt!263833) (index!25105 lt!263833) (index!25105 lt!263833) k!1914 a!3118 mask!3119))))

(declare-fun d!85439 () Bool)

(declare-fun lt!263834 () SeekEntryResult!5719)

(assert (=> d!85439 (and (or (is-Undefined!5719 lt!263834) (not (is-Found!5719 lt!263834)) (and (bvsge (index!25104 lt!263834) #b00000000000000000000000000000000) (bvslt (index!25104 lt!263834) (size!17634 a!3118)))) (or (is-Undefined!5719 lt!263834) (is-Found!5719 lt!263834) (not (is-MissingZero!5719 lt!263834)) (and (bvsge (index!25103 lt!263834) #b00000000000000000000000000000000) (bvslt (index!25103 lt!263834) (size!17634 a!3118)))) (or (is-Undefined!5719 lt!263834) (is-Found!5719 lt!263834) (is-MissingZero!5719 lt!263834) (not (is-MissingVacant!5719 lt!263834)) (and (bvsge (index!25106 lt!263834) #b00000000000000000000000000000000) (bvslt (index!25106 lt!263834) (size!17634 a!3118)))) (or (is-Undefined!5719 lt!263834) (ite (is-Found!5719 lt!263834) (= (select (arr!17270 a!3118) (index!25104 lt!263834)) k!1914) (ite (is-MissingZero!5719 lt!263834) (= (select (arr!17270 a!3118) (index!25103 lt!263834)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5719 lt!263834) (= (select (arr!17270 a!3118) (index!25106 lt!263834)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85439 (= lt!263834 e!331803)))

(declare-fun c!66297 () Bool)

(assert (=> d!85439 (= c!66297 (and (is-Intermediate!5719 lt!263833) (undefined!6531 lt!263833)))))

(assert (=> d!85439 (= lt!263833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!85439 (validMask!0 mask!3119)))

(assert (=> d!85439 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!263834)))

(declare-fun b!576750 () Bool)

(assert (=> b!576750 (= e!331804 (MissingZero!5719 (index!25105 lt!263833)))))

(declare-fun b!576752 () Bool)

(declare-fun c!66298 () Bool)

(assert (=> b!576752 (= c!66298 (= lt!263832 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576752 (= e!331802 e!331804)))

(declare-fun b!576753 () Bool)

(assert (=> b!576753 (= e!331802 (Found!5719 (index!25105 lt!263833)))))

(assert (= (and d!85439 c!66297) b!576749))

(assert (= (and d!85439 (not c!66297)) b!576748))

(assert (= (and b!576748 c!66296) b!576753))

(assert (= (and b!576748 (not c!66296)) b!576752))

(assert (= (and b!576752 c!66298) b!576750))

(assert (= (and b!576752 (not c!66298)) b!576751))

(declare-fun m!555709 () Bool)

(assert (=> b!576748 m!555709))

(declare-fun m!555711 () Bool)

(assert (=> b!576751 m!555711))

(declare-fun m!555713 () Bool)

(assert (=> d!85439 m!555713))

(assert (=> d!85439 m!555631))

(declare-fun m!555715 () Bool)

(assert (=> d!85439 m!555715))

(declare-fun m!555717 () Bool)

(assert (=> d!85439 m!555717))

(assert (=> d!85439 m!555715))

(declare-fun m!555719 () Bool)

(assert (=> d!85439 m!555719))

(declare-fun m!555721 () Bool)

(assert (=> d!85439 m!555721))

(assert (=> b!576604 d!85439))

(declare-fun b!576826 () Bool)

(declare-fun e!331855 () SeekEntryResult!5719)

(assert (=> b!576826 (= e!331855 (Intermediate!5719 true lt!263750 #b00000000000000000000000000000000))))

(declare-fun b!576827 () Bool)

(declare-fun e!331852 () Bool)

(declare-fun lt!263858 () SeekEntryResult!5719)

(assert (=> b!576827 (= e!331852 (bvsge (x!53990 lt!263858) #b01111111111111111111111111111110))))

(declare-fun b!576828 () Bool)

(assert (=> b!576828 (and (bvsge (index!25105 lt!263858) #b00000000000000000000000000000000) (bvslt (index!25105 lt!263858) (size!17634 lt!263753)))))

(declare-fun res!364915 () Bool)

(assert (=> b!576828 (= res!364915 (= (select (arr!17270 lt!263753) (index!25105 lt!263858)) lt!263757))))

(declare-fun e!331853 () Bool)

(assert (=> b!576828 (=> res!364915 e!331853)))

(declare-fun e!331854 () Bool)

(assert (=> b!576828 (= e!331854 e!331853)))

(declare-fun d!85441 () Bool)

(assert (=> d!85441 e!331852))

(declare-fun c!66324 () Bool)

(assert (=> d!85441 (= c!66324 (and (is-Intermediate!5719 lt!263858) (undefined!6531 lt!263858)))))

(assert (=> d!85441 (= lt!263858 e!331855)))

(declare-fun c!66322 () Bool)

(assert (=> d!85441 (= c!66322 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!263857 () (_ BitVec 64))

(assert (=> d!85441 (= lt!263857 (select (arr!17270 lt!263753) lt!263750))))

(assert (=> d!85441 (validMask!0 mask!3119)))

(assert (=> d!85441 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263750 lt!263757 lt!263753 mask!3119) lt!263858)))

(declare-fun b!576829 () Bool)

(assert (=> b!576829 (and (bvsge (index!25105 lt!263858) #b00000000000000000000000000000000) (bvslt (index!25105 lt!263858) (size!17634 lt!263753)))))

(declare-fun res!364914 () Bool)

(assert (=> b!576829 (= res!364914 (= (select (arr!17270 lt!263753) (index!25105 lt!263858)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576829 (=> res!364914 e!331853)))

(declare-fun b!576830 () Bool)

(declare-fun e!331856 () SeekEntryResult!5719)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576830 (= e!331856 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263750 #b00000000000000000000000000000000 mask!3119) lt!263757 lt!263753 mask!3119))))

(declare-fun b!576831 () Bool)

(assert (=> b!576831 (= e!331856 (Intermediate!5719 false lt!263750 #b00000000000000000000000000000000))))

(declare-fun b!576832 () Bool)

(assert (=> b!576832 (= e!331855 e!331856)))

(declare-fun c!66323 () Bool)

(assert (=> b!576832 (= c!66323 (or (= lt!263857 lt!263757) (= (bvadd lt!263857 lt!263857) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!576833 () Bool)

(assert (=> b!576833 (= e!331852 e!331854)))

(declare-fun res!364916 () Bool)

(assert (=> b!576833 (= res!364916 (and (is-Intermediate!5719 lt!263858) (not (undefined!6531 lt!263858)) (bvslt (x!53990 lt!263858) #b01111111111111111111111111111110) (bvsge (x!53990 lt!263858) #b00000000000000000000000000000000) (bvsge (x!53990 lt!263858) #b00000000000000000000000000000000)))))

(assert (=> b!576833 (=> (not res!364916) (not e!331854))))

(declare-fun b!576834 () Bool)

(assert (=> b!576834 (and (bvsge (index!25105 lt!263858) #b00000000000000000000000000000000) (bvslt (index!25105 lt!263858) (size!17634 lt!263753)))))

(assert (=> b!576834 (= e!331853 (= (select (arr!17270 lt!263753) (index!25105 lt!263858)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!85441 c!66322) b!576826))

(assert (= (and d!85441 (not c!66322)) b!576832))

(assert (= (and b!576832 c!66323) b!576831))

(assert (= (and b!576832 (not c!66323)) b!576830))

(assert (= (and d!85441 c!66324) b!576827))

(assert (= (and d!85441 (not c!66324)) b!576833))

(assert (= (and b!576833 res!364916) b!576828))

(assert (= (and b!576828 (not res!364915)) b!576829))

(assert (= (and b!576829 (not res!364914)) b!576834))

(declare-fun m!555797 () Bool)

(assert (=> b!576829 m!555797))

(declare-fun m!555799 () Bool)

(assert (=> d!85441 m!555799))

(assert (=> d!85441 m!555631))

(declare-fun m!555801 () Bool)

(assert (=> b!576830 m!555801))

(assert (=> b!576830 m!555801))

(declare-fun m!555803 () Bool)

(assert (=> b!576830 m!555803))

(assert (=> b!576828 m!555797))

(assert (=> b!576834 m!555797))

(assert (=> b!576606 d!85441))

(declare-fun b!576843 () Bool)

(declare-fun e!331864 () SeekEntryResult!5719)

(assert (=> b!576843 (= e!331864 (Intermediate!5719 true lt!263754 #b00000000000000000000000000000000))))

(declare-fun b!576844 () Bool)

(declare-fun e!331861 () Bool)

(declare-fun lt!263864 () SeekEntryResult!5719)

(assert (=> b!576844 (= e!331861 (bvsge (x!53990 lt!263864) #b01111111111111111111111111111110))))

(declare-fun b!576845 () Bool)

(assert (=> b!576845 (and (bvsge (index!25105 lt!263864) #b00000000000000000000000000000000) (bvslt (index!25105 lt!263864) (size!17634 a!3118)))))

(declare-fun res!364918 () Bool)

(assert (=> b!576845 (= res!364918 (= (select (arr!17270 a!3118) (index!25105 lt!263864)) (select (arr!17270 a!3118) j!142)))))

(declare-fun e!331862 () Bool)

(assert (=> b!576845 (=> res!364918 e!331862)))

(declare-fun e!331863 () Bool)

(assert (=> b!576845 (= e!331863 e!331862)))

(declare-fun d!85467 () Bool)

(assert (=> d!85467 e!331861))

(declare-fun c!66331 () Bool)

(assert (=> d!85467 (= c!66331 (and (is-Intermediate!5719 lt!263864) (undefined!6531 lt!263864)))))

(assert (=> d!85467 (= lt!263864 e!331864)))

(declare-fun c!66329 () Bool)

(assert (=> d!85467 (= c!66329 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!263863 () (_ BitVec 64))

(assert (=> d!85467 (= lt!263863 (select (arr!17270 a!3118) lt!263754))))

(assert (=> d!85467 (validMask!0 mask!3119)))

(assert (=> d!85467 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263754 (select (arr!17270 a!3118) j!142) a!3118 mask!3119) lt!263864)))

(declare-fun b!576846 () Bool)

(assert (=> b!576846 (and (bvsge (index!25105 lt!263864) #b00000000000000000000000000000000) (bvslt (index!25105 lt!263864) (size!17634 a!3118)))))

(declare-fun res!364917 () Bool)

(assert (=> b!576846 (= res!364917 (= (select (arr!17270 a!3118) (index!25105 lt!263864)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576846 (=> res!364917 e!331862)))

(declare-fun e!331865 () SeekEntryResult!5719)

(declare-fun b!576847 () Bool)

(assert (=> b!576847 (= e!331865 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263754 #b00000000000000000000000000000000 mask!3119) (select (arr!17270 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!576848 () Bool)

(assert (=> b!576848 (= e!331865 (Intermediate!5719 false lt!263754 #b00000000000000000000000000000000))))

(declare-fun b!576849 () Bool)

(assert (=> b!576849 (= e!331864 e!331865)))

(declare-fun c!66330 () Bool)

(assert (=> b!576849 (= c!66330 (or (= lt!263863 (select (arr!17270 a!3118) j!142)) (= (bvadd lt!263863 lt!263863) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!576850 () Bool)

(assert (=> b!576850 (= e!331861 e!331863)))

(declare-fun res!364919 () Bool)

(assert (=> b!576850 (= res!364919 (and (is-Intermediate!5719 lt!263864) (not (undefined!6531 lt!263864)) (bvslt (x!53990 lt!263864) #b01111111111111111111111111111110) (bvsge (x!53990 lt!263864) #b00000000000000000000000000000000) (bvsge (x!53990 lt!263864) #b00000000000000000000000000000000)))))

(assert (=> b!576850 (=> (not res!364919) (not e!331863))))

(declare-fun b!576851 () Bool)

(assert (=> b!576851 (and (bvsge (index!25105 lt!263864) #b00000000000000000000000000000000) (bvslt (index!25105 lt!263864) (size!17634 a!3118)))))

(assert (=> b!576851 (= e!331862 (= (select (arr!17270 a!3118) (index!25105 lt!263864)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!85467 c!66329) b!576843))

(assert (= (and d!85467 (not c!66329)) b!576849))

(assert (= (and b!576849 c!66330) b!576848))

(assert (= (and b!576849 (not c!66330)) b!576847))

(assert (= (and d!85467 c!66331) b!576844))

(assert (= (and d!85467 (not c!66331)) b!576850))

(assert (= (and b!576850 res!364919) b!576845))

(assert (= (and b!576845 (not res!364918)) b!576846))

(assert (= (and b!576846 (not res!364917)) b!576851))

(declare-fun m!555805 () Bool)

(assert (=> b!576846 m!555805))

(declare-fun m!555807 () Bool)

(assert (=> d!85467 m!555807))

(assert (=> d!85467 m!555631))

(declare-fun m!555809 () Bool)

(assert (=> b!576847 m!555809))

(assert (=> b!576847 m!555809))

(assert (=> b!576847 m!555607))

(declare-fun m!555811 () Bool)

(assert (=> b!576847 m!555811))

(assert (=> b!576845 m!555805))

(assert (=> b!576851 m!555805))

(assert (=> b!576606 d!85467))

(declare-fun d!85469 () Bool)

(declare-fun lt!263874 () (_ BitVec 32))

(declare-fun lt!263873 () (_ BitVec 32))

(assert (=> d!85469 (= lt!263874 (bvmul (bvxor lt!263873 (bvlshr lt!263873 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85469 (= lt!263873 ((_ extract 31 0) (bvand (bvxor lt!263757 (bvlshr lt!263757 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85469 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!364926 (let ((h!12390 ((_ extract 31 0) (bvand (bvxor lt!263757 (bvlshr lt!263757 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53995 (bvmul (bvxor h!12390 (bvlshr h!12390 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53995 (bvlshr x!53995 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!364926 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!364926 #b00000000000000000000000000000000))))))

(assert (=> d!85469 (= (toIndex!0 lt!263757 mask!3119) (bvand (bvxor lt!263874 (bvlshr lt!263874 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!576606 d!85469))

(declare-fun d!85473 () Bool)

(declare-fun lt!263876 () (_ BitVec 32))

(declare-fun lt!263875 () (_ BitVec 32))

(assert (=> d!85473 (= lt!263876 (bvmul (bvxor lt!263875 (bvlshr lt!263875 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85473 (= lt!263875 ((_ extract 31 0) (bvand (bvxor (select (arr!17270 a!3118) j!142) (bvlshr (select (arr!17270 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85473 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!364926 (let ((h!12390 ((_ extract 31 0) (bvand (bvxor (select (arr!17270 a!3118) j!142) (bvlshr (select (arr!17270 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53995 (bvmul (bvxor h!12390 (bvlshr h!12390 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53995 (bvlshr x!53995 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!364926 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!364926 #b00000000000000000000000000000000))))))

(assert (=> d!85473 (= (toIndex!0 (select (arr!17270 a!3118) j!142) mask!3119) (bvand (bvxor lt!263876 (bvlshr lt!263876 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!576606 d!85473))

(declare-fun d!85475 () Bool)

(assert (=> d!85475 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!576611 d!85475))

(declare-fun bm!32745 () Bool)

(declare-fun call!32748 () Bool)

(declare-fun c!66342 () Bool)

(assert (=> bm!32745 (= call!32748 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66342 (Cons!11346 (select (arr!17270 a!3118) #b00000000000000000000000000000000) Nil!11347) Nil!11347)))))

(declare-fun d!85479 () Bool)

(declare-fun res!364942 () Bool)

(declare-fun e!331892 () Bool)

(assert (=> d!85479 (=> res!364942 e!331892)))

(assert (=> d!85479 (= res!364942 (bvsge #b00000000000000000000000000000000 (size!17634 a!3118)))))

(assert (=> d!85479 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11347) e!331892)))

(declare-fun b!576890 () Bool)

(declare-fun e!331893 () Bool)

(assert (=> b!576890 (= e!331893 call!32748)))

(declare-fun b!576891 () Bool)

(declare-fun e!331891 () Bool)

(assert (=> b!576891 (= e!331891 e!331893)))

(assert (=> b!576891 (= c!66342 (validKeyInArray!0 (select (arr!17270 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576892 () Bool)

(assert (=> b!576892 (= e!331892 e!331891)))

(declare-fun res!364940 () Bool)

(assert (=> b!576892 (=> (not res!364940) (not e!331891))))

(declare-fun e!331890 () Bool)

(assert (=> b!576892 (= res!364940 (not e!331890))))

(declare-fun res!364941 () Bool)

(assert (=> b!576892 (=> (not res!364941) (not e!331890))))

(assert (=> b!576892 (= res!364941 (validKeyInArray!0 (select (arr!17270 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576893 () Bool)

(declare-fun contains!2898 (List!11350 (_ BitVec 64)) Bool)

(assert (=> b!576893 (= e!331890 (contains!2898 Nil!11347 (select (arr!17270 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576894 () Bool)

(assert (=> b!576894 (= e!331893 call!32748)))

(assert (= (and d!85479 (not res!364942)) b!576892))

(assert (= (and b!576892 res!364941) b!576893))

(assert (= (and b!576892 res!364940) b!576891))

(assert (= (and b!576891 c!66342) b!576890))

(assert (= (and b!576891 (not c!66342)) b!576894))

(assert (= (or b!576890 b!576894) bm!32745))

(declare-fun m!555829 () Bool)

(assert (=> bm!32745 m!555829))

(declare-fun m!555831 () Bool)

(assert (=> bm!32745 m!555831))

(assert (=> b!576891 m!555829))

(assert (=> b!576891 m!555829))

(declare-fun m!555833 () Bool)

(assert (=> b!576891 m!555833))

(assert (=> b!576892 m!555829))

(assert (=> b!576892 m!555829))

(assert (=> b!576892 m!555833))

(assert (=> b!576893 m!555829))

(assert (=> b!576893 m!555829))

(declare-fun m!555835 () Bool)

(assert (=> b!576893 m!555835))

(assert (=> b!576602 d!85479))

(declare-fun d!85485 () Bool)

(assert (=> d!85485 (= (validKeyInArray!0 (select (arr!17270 a!3118) j!142)) (and (not (= (select (arr!17270 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17270 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!576607 d!85485))

(declare-fun d!85487 () Bool)

(declare-fun res!364943 () Bool)

(declare-fun e!331894 () Bool)

(assert (=> d!85487 (=> res!364943 e!331894)))

(assert (=> d!85487 (= res!364943 (bvsge #b00000000000000000000000000000000 (size!17634 a!3118)))))

(assert (=> d!85487 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!331894)))

(declare-fun b!576895 () Bool)

(declare-fun e!331895 () Bool)

(declare-fun call!32749 () Bool)

(assert (=> b!576895 (= e!331895 call!32749)))

(declare-fun b!576896 () Bool)

(declare-fun e!331896 () Bool)

(assert (=> b!576896 (= e!331894 e!331896)))

(declare-fun c!66343 () Bool)

(assert (=> b!576896 (= c!66343 (validKeyInArray!0 (select (arr!17270 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576897 () Bool)

(assert (=> b!576897 (= e!331896 e!331895)))

