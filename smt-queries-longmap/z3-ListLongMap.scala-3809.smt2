; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52196 () Bool)

(assert start!52196)

(declare-fun b!569716 () Bool)

(declare-fun res!359884 () Bool)

(declare-fun e!327645 () Bool)

(assert (=> b!569716 (=> (not res!359884) (not e!327645))))

(declare-datatypes ((array!35728 0))(
  ( (array!35729 (arr!17156 (Array (_ BitVec 32) (_ BitVec 64))) (size!17521 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35728)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35728 (_ BitVec 32)) Bool)

(assert (=> b!569716 (= res!359884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569717 () Bool)

(declare-fun res!359885 () Bool)

(declare-fun e!327641 () Bool)

(assert (=> b!569717 (=> (not res!359885) (not e!327641))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569717 (= res!359885 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569718 () Bool)

(declare-fun e!327644 () Bool)

(assert (=> b!569718 (= e!327645 e!327644)))

(declare-fun res!359878 () Bool)

(assert (=> b!569718 (=> (not res!359878) (not e!327644))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5602 0))(
  ( (MissingZero!5602 (index!24635 (_ BitVec 32))) (Found!5602 (index!24636 (_ BitVec 32))) (Intermediate!5602 (undefined!6414 Bool) (index!24637 (_ BitVec 32)) (x!53512 (_ BitVec 32))) (Undefined!5602) (MissingVacant!5602 (index!24638 (_ BitVec 32))) )
))
(declare-fun lt!259593 () SeekEntryResult!5602)

(declare-fun lt!259592 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35728 (_ BitVec 32)) SeekEntryResult!5602)

(assert (=> b!569718 (= res!359878 (= lt!259593 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259592 (select (store (arr!17156 a!3118) i!1132 k0!1914) j!142) (array!35729 (store (arr!17156 a!3118) i!1132 k0!1914) (size!17521 a!3118)) mask!3119)))))

(declare-fun lt!259589 () (_ BitVec 32))

(assert (=> b!569718 (= lt!259593 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259589 (select (arr!17156 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569718 (= lt!259592 (toIndex!0 (select (store (arr!17156 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569718 (= lt!259589 (toIndex!0 (select (arr!17156 a!3118) j!142) mask!3119))))

(declare-fun b!569719 () Bool)

(declare-fun e!327642 () Bool)

(assert (=> b!569719 (= e!327644 (not e!327642))))

(declare-fun res!359881 () Bool)

(assert (=> b!569719 (=> res!359881 e!327642)))

(get-info :version)

(assert (=> b!569719 (= res!359881 (or (undefined!6414 lt!259593) (not ((_ is Intermediate!5602) lt!259593)) (= (select (arr!17156 a!3118) (index!24637 lt!259593)) (select (arr!17156 a!3118) j!142)) (= (select (arr!17156 a!3118) (index!24637 lt!259593)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!259594 () SeekEntryResult!5602)

(assert (=> b!569719 (= lt!259594 (Found!5602 j!142))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35728 (_ BitVec 32)) SeekEntryResult!5602)

(assert (=> b!569719 (= lt!259594 (seekEntryOrOpen!0 (select (arr!17156 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569719 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17892 0))(
  ( (Unit!17893) )
))
(declare-fun lt!259590 () Unit!17892)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35728 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17892)

(assert (=> b!569719 (= lt!259590 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569720 () Bool)

(assert (=> b!569720 (= e!327641 e!327645)))

(declare-fun res!359882 () Bool)

(assert (=> b!569720 (=> (not res!359882) (not e!327645))))

(declare-fun lt!259591 () SeekEntryResult!5602)

(assert (=> b!569720 (= res!359882 (or (= lt!259591 (MissingZero!5602 i!1132)) (= lt!259591 (MissingVacant!5602 i!1132))))))

(assert (=> b!569720 (= lt!259591 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569721 () Bool)

(declare-fun res!359879 () Bool)

(assert (=> b!569721 (=> (not res!359879) (not e!327641))))

(assert (=> b!569721 (= res!359879 (and (= (size!17521 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17521 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17521 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569722 () Bool)

(declare-fun res!359877 () Bool)

(assert (=> b!569722 (=> (not res!359877) (not e!327641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569722 (= res!359877 (validKeyInArray!0 (select (arr!17156 a!3118) j!142)))))

(declare-fun b!569723 () Bool)

(declare-fun res!359883 () Bool)

(assert (=> b!569723 (=> (not res!359883) (not e!327645))))

(declare-datatypes ((List!11275 0))(
  ( (Nil!11272) (Cons!11271 (h!12292 (_ BitVec 64)) (t!17494 List!11275)) )
))
(declare-fun arrayNoDuplicates!0 (array!35728 (_ BitVec 32) List!11275) Bool)

(assert (=> b!569723 (= res!359883 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11272))))

(declare-fun b!569724 () Bool)

(declare-fun res!359880 () Bool)

(assert (=> b!569724 (=> (not res!359880) (not e!327641))))

(assert (=> b!569724 (= res!359880 (validKeyInArray!0 k0!1914))))

(declare-fun b!569725 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35728 (_ BitVec 32)) SeekEntryResult!5602)

(assert (=> b!569725 (= e!327642 (= lt!259594 (seekKeyOrZeroReturnVacant!0 (x!53512 lt!259593) (index!24637 lt!259593) (index!24637 lt!259593) (select (arr!17156 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!359876 () Bool)

(assert (=> start!52196 (=> (not res!359876) (not e!327641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52196 (= res!359876 (validMask!0 mask!3119))))

(assert (=> start!52196 e!327641))

(assert (=> start!52196 true))

(declare-fun array_inv!13039 (array!35728) Bool)

(assert (=> start!52196 (array_inv!13039 a!3118)))

(assert (= (and start!52196 res!359876) b!569721))

(assert (= (and b!569721 res!359879) b!569722))

(assert (= (and b!569722 res!359877) b!569724))

(assert (= (and b!569724 res!359880) b!569717))

(assert (= (and b!569717 res!359885) b!569720))

(assert (= (and b!569720 res!359882) b!569716))

(assert (= (and b!569716 res!359884) b!569723))

(assert (= (and b!569723 res!359883) b!569718))

(assert (= (and b!569718 res!359878) b!569719))

(assert (= (and b!569719 (not res!359881)) b!569725))

(declare-fun m!548129 () Bool)

(assert (=> b!569722 m!548129))

(assert (=> b!569722 m!548129))

(declare-fun m!548131 () Bool)

(assert (=> b!569722 m!548131))

(declare-fun m!548133 () Bool)

(assert (=> b!569717 m!548133))

(assert (=> b!569718 m!548129))

(declare-fun m!548135 () Bool)

(assert (=> b!569718 m!548135))

(declare-fun m!548137 () Bool)

(assert (=> b!569718 m!548137))

(declare-fun m!548139 () Bool)

(assert (=> b!569718 m!548139))

(assert (=> b!569718 m!548129))

(assert (=> b!569718 m!548137))

(declare-fun m!548141 () Bool)

(assert (=> b!569718 m!548141))

(assert (=> b!569718 m!548129))

(declare-fun m!548143 () Bool)

(assert (=> b!569718 m!548143))

(assert (=> b!569718 m!548137))

(declare-fun m!548145 () Bool)

(assert (=> b!569718 m!548145))

(assert (=> b!569725 m!548129))

(assert (=> b!569725 m!548129))

(declare-fun m!548147 () Bool)

(assert (=> b!569725 m!548147))

(declare-fun m!548149 () Bool)

(assert (=> b!569724 m!548149))

(assert (=> b!569719 m!548129))

(declare-fun m!548151 () Bool)

(assert (=> b!569719 m!548151))

(declare-fun m!548153 () Bool)

(assert (=> b!569719 m!548153))

(declare-fun m!548155 () Bool)

(assert (=> b!569719 m!548155))

(assert (=> b!569719 m!548129))

(declare-fun m!548157 () Bool)

(assert (=> b!569719 m!548157))

(declare-fun m!548159 () Bool)

(assert (=> start!52196 m!548159))

(declare-fun m!548161 () Bool)

(assert (=> start!52196 m!548161))

(declare-fun m!548163 () Bool)

(assert (=> b!569716 m!548163))

(declare-fun m!548165 () Bool)

(assert (=> b!569720 m!548165))

(declare-fun m!548167 () Bool)

(assert (=> b!569723 m!548167))

(check-sat (not b!569718) (not start!52196) (not b!569723) (not b!569725) (not b!569719) (not b!569722) (not b!569716) (not b!569720) (not b!569717) (not b!569724))
(check-sat)
(get-model)

(declare-fun b!569798 () Bool)

(declare-fun e!327683 () SeekEntryResult!5602)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569798 (= e!327683 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53512 lt!259593) #b00000000000000000000000000000001) (nextIndex!0 (index!24637 lt!259593) (x!53512 lt!259593) mask!3119) (index!24637 lt!259593) (select (arr!17156 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!569799 () Bool)

(declare-fun c!65282 () Bool)

(declare-fun lt!259635 () (_ BitVec 64))

(assert (=> b!569799 (= c!65282 (= lt!259635 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327682 () SeekEntryResult!5602)

(assert (=> b!569799 (= e!327682 e!327683)))

(declare-fun b!569800 () Bool)

(declare-fun e!327684 () SeekEntryResult!5602)

(assert (=> b!569800 (= e!327684 Undefined!5602)))

(declare-fun lt!259636 () SeekEntryResult!5602)

(declare-fun d!84395 () Bool)

(assert (=> d!84395 (and (or ((_ is Undefined!5602) lt!259636) (not ((_ is Found!5602) lt!259636)) (and (bvsge (index!24636 lt!259636) #b00000000000000000000000000000000) (bvslt (index!24636 lt!259636) (size!17521 a!3118)))) (or ((_ is Undefined!5602) lt!259636) ((_ is Found!5602) lt!259636) (not ((_ is MissingVacant!5602) lt!259636)) (not (= (index!24638 lt!259636) (index!24637 lt!259593))) (and (bvsge (index!24638 lt!259636) #b00000000000000000000000000000000) (bvslt (index!24638 lt!259636) (size!17521 a!3118)))) (or ((_ is Undefined!5602) lt!259636) (ite ((_ is Found!5602) lt!259636) (= (select (arr!17156 a!3118) (index!24636 lt!259636)) (select (arr!17156 a!3118) j!142)) (and ((_ is MissingVacant!5602) lt!259636) (= (index!24638 lt!259636) (index!24637 lt!259593)) (= (select (arr!17156 a!3118) (index!24638 lt!259636)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84395 (= lt!259636 e!327684)))

(declare-fun c!65283 () Bool)

(assert (=> d!84395 (= c!65283 (bvsge (x!53512 lt!259593) #b01111111111111111111111111111110))))

(assert (=> d!84395 (= lt!259635 (select (arr!17156 a!3118) (index!24637 lt!259593)))))

(assert (=> d!84395 (validMask!0 mask!3119)))

(assert (=> d!84395 (= (seekKeyOrZeroReturnVacant!0 (x!53512 lt!259593) (index!24637 lt!259593) (index!24637 lt!259593) (select (arr!17156 a!3118) j!142) a!3118 mask!3119) lt!259636)))

(declare-fun b!569801 () Bool)

(assert (=> b!569801 (= e!327684 e!327682)))

(declare-fun c!65281 () Bool)

(assert (=> b!569801 (= c!65281 (= lt!259635 (select (arr!17156 a!3118) j!142)))))

(declare-fun b!569802 () Bool)

(assert (=> b!569802 (= e!327682 (Found!5602 (index!24637 lt!259593)))))

(declare-fun b!569803 () Bool)

(assert (=> b!569803 (= e!327683 (MissingVacant!5602 (index!24637 lt!259593)))))

(assert (= (and d!84395 c!65283) b!569800))

(assert (= (and d!84395 (not c!65283)) b!569801))

(assert (= (and b!569801 c!65281) b!569802))

(assert (= (and b!569801 (not c!65281)) b!569799))

(assert (= (and b!569799 c!65282) b!569803))

(assert (= (and b!569799 (not c!65282)) b!569798))

(declare-fun m!548249 () Bool)

(assert (=> b!569798 m!548249))

(assert (=> b!569798 m!548249))

(assert (=> b!569798 m!548129))

(declare-fun m!548251 () Bool)

(assert (=> b!569798 m!548251))

(declare-fun m!548253 () Bool)

(assert (=> d!84395 m!548253))

(declare-fun m!548255 () Bool)

(assert (=> d!84395 m!548255))

(assert (=> d!84395 m!548153))

(assert (=> d!84395 m!548159))

(assert (=> b!569725 d!84395))

(declare-fun e!327707 () SeekEntryResult!5602)

(declare-fun lt!259659 () SeekEntryResult!5602)

(declare-fun b!569840 () Bool)

(assert (=> b!569840 (= e!327707 (seekKeyOrZeroReturnVacant!0 (x!53512 lt!259659) (index!24637 lt!259659) (index!24637 lt!259659) k0!1914 a!3118 mask!3119))))

(declare-fun b!569841 () Bool)

(declare-fun c!65301 () Bool)

(declare-fun lt!259660 () (_ BitVec 64))

(assert (=> b!569841 (= c!65301 (= lt!259660 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327708 () SeekEntryResult!5602)

(assert (=> b!569841 (= e!327708 e!327707)))

(declare-fun b!569842 () Bool)

(assert (=> b!569842 (= e!327707 (MissingZero!5602 (index!24637 lt!259659)))))

(declare-fun b!569843 () Bool)

(declare-fun e!327706 () SeekEntryResult!5602)

(assert (=> b!569843 (= e!327706 e!327708)))

(assert (=> b!569843 (= lt!259660 (select (arr!17156 a!3118) (index!24637 lt!259659)))))

(declare-fun c!65300 () Bool)

(assert (=> b!569843 (= c!65300 (= lt!259660 k0!1914))))

(declare-fun d!84399 () Bool)

(declare-fun lt!259658 () SeekEntryResult!5602)

(assert (=> d!84399 (and (or ((_ is Undefined!5602) lt!259658) (not ((_ is Found!5602) lt!259658)) (and (bvsge (index!24636 lt!259658) #b00000000000000000000000000000000) (bvslt (index!24636 lt!259658) (size!17521 a!3118)))) (or ((_ is Undefined!5602) lt!259658) ((_ is Found!5602) lt!259658) (not ((_ is MissingZero!5602) lt!259658)) (and (bvsge (index!24635 lt!259658) #b00000000000000000000000000000000) (bvslt (index!24635 lt!259658) (size!17521 a!3118)))) (or ((_ is Undefined!5602) lt!259658) ((_ is Found!5602) lt!259658) ((_ is MissingZero!5602) lt!259658) (not ((_ is MissingVacant!5602) lt!259658)) (and (bvsge (index!24638 lt!259658) #b00000000000000000000000000000000) (bvslt (index!24638 lt!259658) (size!17521 a!3118)))) (or ((_ is Undefined!5602) lt!259658) (ite ((_ is Found!5602) lt!259658) (= (select (arr!17156 a!3118) (index!24636 lt!259658)) k0!1914) (ite ((_ is MissingZero!5602) lt!259658) (= (select (arr!17156 a!3118) (index!24635 lt!259658)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5602) lt!259658) (= (select (arr!17156 a!3118) (index!24638 lt!259658)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84399 (= lt!259658 e!327706)))

(declare-fun c!65299 () Bool)

(assert (=> d!84399 (= c!65299 (and ((_ is Intermediate!5602) lt!259659) (undefined!6414 lt!259659)))))

(assert (=> d!84399 (= lt!259659 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84399 (validMask!0 mask!3119)))

(assert (=> d!84399 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!259658)))

(declare-fun b!569844 () Bool)

(assert (=> b!569844 (= e!327708 (Found!5602 (index!24637 lt!259659)))))

(declare-fun b!569845 () Bool)

(assert (=> b!569845 (= e!327706 Undefined!5602)))

(assert (= (and d!84399 c!65299) b!569845))

(assert (= (and d!84399 (not c!65299)) b!569843))

(assert (= (and b!569843 c!65300) b!569844))

(assert (= (and b!569843 (not c!65300)) b!569841))

(assert (= (and b!569841 c!65301) b!569842))

(assert (= (and b!569841 (not c!65301)) b!569840))

(declare-fun m!548269 () Bool)

(assert (=> b!569840 m!548269))

(declare-fun m!548271 () Bool)

(assert (=> b!569843 m!548271))

(declare-fun m!548273 () Bool)

(assert (=> d!84399 m!548273))

(declare-fun m!548275 () Bool)

(assert (=> d!84399 m!548275))

(declare-fun m!548277 () Bool)

(assert (=> d!84399 m!548277))

(assert (=> d!84399 m!548275))

(declare-fun m!548279 () Bool)

(assert (=> d!84399 m!548279))

(assert (=> d!84399 m!548159))

(declare-fun m!548281 () Bool)

(assert (=> d!84399 m!548281))

(assert (=> b!569720 d!84399))

(declare-fun b!569876 () Bool)

(declare-fun e!327728 () Bool)

(declare-fun call!32564 () Bool)

(assert (=> b!569876 (= e!327728 call!32564)))

(declare-fun d!84405 () Bool)

(declare-fun res!359959 () Bool)

(declare-fun e!327727 () Bool)

(assert (=> d!84405 (=> res!359959 e!327727)))

(assert (=> d!84405 (= res!359959 (bvsge #b00000000000000000000000000000000 (size!17521 a!3118)))))

(assert (=> d!84405 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!327727)))

(declare-fun bm!32561 () Bool)

(assert (=> bm!32561 (= call!32564 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!569877 () Bool)

(declare-fun e!327729 () Bool)

(assert (=> b!569877 (= e!327729 e!327728)))

(declare-fun lt!259683 () (_ BitVec 64))

(assert (=> b!569877 (= lt!259683 (select (arr!17156 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!259684 () Unit!17892)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35728 (_ BitVec 64) (_ BitVec 32)) Unit!17892)

(assert (=> b!569877 (= lt!259684 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!259683 #b00000000000000000000000000000000))))

(assert (=> b!569877 (arrayContainsKey!0 a!3118 lt!259683 #b00000000000000000000000000000000)))

(declare-fun lt!259682 () Unit!17892)

(assert (=> b!569877 (= lt!259682 lt!259684)))

(declare-fun res!359958 () Bool)

(assert (=> b!569877 (= res!359958 (= (seekEntryOrOpen!0 (select (arr!17156 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5602 #b00000000000000000000000000000000)))))

(assert (=> b!569877 (=> (not res!359958) (not e!327728))))

(declare-fun b!569878 () Bool)

(assert (=> b!569878 (= e!327727 e!327729)))

(declare-fun c!65314 () Bool)

(assert (=> b!569878 (= c!65314 (validKeyInArray!0 (select (arr!17156 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!569879 () Bool)

(assert (=> b!569879 (= e!327729 call!32564)))

(assert (= (and d!84405 (not res!359959)) b!569878))

(assert (= (and b!569878 c!65314) b!569877))

(assert (= (and b!569878 (not c!65314)) b!569879))

(assert (= (and b!569877 res!359958) b!569876))

(assert (= (or b!569876 b!569879) bm!32561))

(declare-fun m!548303 () Bool)

(assert (=> bm!32561 m!548303))

(declare-fun m!548305 () Bool)

(assert (=> b!569877 m!548305))

(declare-fun m!548307 () Bool)

(assert (=> b!569877 m!548307))

(declare-fun m!548309 () Bool)

(assert (=> b!569877 m!548309))

(assert (=> b!569877 m!548305))

(declare-fun m!548311 () Bool)

(assert (=> b!569877 m!548311))

(assert (=> b!569878 m!548305))

(assert (=> b!569878 m!548305))

(declare-fun m!548313 () Bool)

(assert (=> b!569878 m!548313))

(assert (=> b!569716 d!84405))

(declare-fun d!84413 () Bool)

(assert (=> d!84413 (= (validKeyInArray!0 (select (arr!17156 a!3118) j!142)) (and (not (= (select (arr!17156 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17156 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!569722 d!84413))

(declare-fun d!84415 () Bool)

(declare-fun res!359964 () Bool)

(declare-fun e!327737 () Bool)

(assert (=> d!84415 (=> res!359964 e!327737)))

(assert (=> d!84415 (= res!359964 (= (select (arr!17156 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84415 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!327737)))

(declare-fun b!569890 () Bool)

(declare-fun e!327738 () Bool)

(assert (=> b!569890 (= e!327737 e!327738)))

(declare-fun res!359965 () Bool)

(assert (=> b!569890 (=> (not res!359965) (not e!327738))))

(assert (=> b!569890 (= res!359965 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17521 a!3118)))))

(declare-fun b!569891 () Bool)

(assert (=> b!569891 (= e!327738 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84415 (not res!359964)) b!569890))

(assert (= (and b!569890 res!359965) b!569891))

(assert (=> d!84415 m!548305))

(declare-fun m!548329 () Bool)

(assert (=> b!569891 m!548329))

(assert (=> b!569717 d!84415))

(declare-fun d!84419 () Bool)

(assert (=> d!84419 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52196 d!84419))

(declare-fun d!84421 () Bool)

(assert (=> d!84421 (= (array_inv!13039 a!3118) (bvsge (size!17521 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52196 d!84421))

(declare-fun bm!32564 () Bool)

(declare-fun call!32567 () Bool)

(declare-fun c!65338 () Bool)

(assert (=> bm!32564 (= call!32567 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65338 (Cons!11271 (select (arr!17156 a!3118) #b00000000000000000000000000000000) Nil!11272) Nil!11272)))))

(declare-fun b!569947 () Bool)

(declare-fun e!327772 () Bool)

(declare-fun contains!2858 (List!11275 (_ BitVec 64)) Bool)

(assert (=> b!569947 (= e!327772 (contains!2858 Nil!11272 (select (arr!17156 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!569948 () Bool)

(declare-fun e!327773 () Bool)

(assert (=> b!569948 (= e!327773 call!32567)))

(declare-fun b!569949 () Bool)

(assert (=> b!569949 (= e!327773 call!32567)))

(declare-fun b!569951 () Bool)

(declare-fun e!327774 () Bool)

(assert (=> b!569951 (= e!327774 e!327773)))

(assert (=> b!569951 (= c!65338 (validKeyInArray!0 (select (arr!17156 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84423 () Bool)

(declare-fun res!359983 () Bool)

(declare-fun e!327771 () Bool)

(assert (=> d!84423 (=> res!359983 e!327771)))

(assert (=> d!84423 (= res!359983 (bvsge #b00000000000000000000000000000000 (size!17521 a!3118)))))

(assert (=> d!84423 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11272) e!327771)))

(declare-fun b!569950 () Bool)

(assert (=> b!569950 (= e!327771 e!327774)))

(declare-fun res!359981 () Bool)

(assert (=> b!569950 (=> (not res!359981) (not e!327774))))

(assert (=> b!569950 (= res!359981 (not e!327772))))

(declare-fun res!359982 () Bool)

(assert (=> b!569950 (=> (not res!359982) (not e!327772))))

(assert (=> b!569950 (= res!359982 (validKeyInArray!0 (select (arr!17156 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84423 (not res!359983)) b!569950))

(assert (= (and b!569950 res!359982) b!569947))

(assert (= (and b!569950 res!359981) b!569951))

(assert (= (and b!569951 c!65338) b!569949))

(assert (= (and b!569951 (not c!65338)) b!569948))

(assert (= (or b!569949 b!569948) bm!32564))

(assert (=> bm!32564 m!548305))

(declare-fun m!548347 () Bool)

(assert (=> bm!32564 m!548347))

(assert (=> b!569947 m!548305))

(assert (=> b!569947 m!548305))

(declare-fun m!548349 () Bool)

(assert (=> b!569947 m!548349))

(assert (=> b!569951 m!548305))

(assert (=> b!569951 m!548305))

(assert (=> b!569951 m!548313))

(assert (=> b!569950 m!548305))

(assert (=> b!569950 m!548305))

(assert (=> b!569950 m!548313))

(assert (=> b!569723 d!84423))

(declare-fun lt!259728 () SeekEntryResult!5602)

(declare-fun b!570018 () Bool)

(assert (=> b!570018 (and (bvsge (index!24637 lt!259728) #b00000000000000000000000000000000) (bvslt (index!24637 lt!259728) (size!17521 (array!35729 (store (arr!17156 a!3118) i!1132 k0!1914) (size!17521 a!3118)))))))

(declare-fun res!360011 () Bool)

(assert (=> b!570018 (= res!360011 (= (select (arr!17156 (array!35729 (store (arr!17156 a!3118) i!1132 k0!1914) (size!17521 a!3118))) (index!24637 lt!259728)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327818 () Bool)

(assert (=> b!570018 (=> res!360011 e!327818)))

(declare-fun b!570019 () Bool)

(declare-fun e!327817 () SeekEntryResult!5602)

(assert (=> b!570019 (= e!327817 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!259592 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17156 a!3118) i!1132 k0!1914) j!142) (array!35729 (store (arr!17156 a!3118) i!1132 k0!1914) (size!17521 a!3118)) mask!3119))))

(declare-fun b!570020 () Bool)

(assert (=> b!570020 (and (bvsge (index!24637 lt!259728) #b00000000000000000000000000000000) (bvslt (index!24637 lt!259728) (size!17521 (array!35729 (store (arr!17156 a!3118) i!1132 k0!1914) (size!17521 a!3118)))))))

(assert (=> b!570020 (= e!327818 (= (select (arr!17156 (array!35729 (store (arr!17156 a!3118) i!1132 k0!1914) (size!17521 a!3118))) (index!24637 lt!259728)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!570021 () Bool)

(assert (=> b!570021 (= e!327817 (Intermediate!5602 false lt!259592 #b00000000000000000000000000000000))))

(declare-fun d!84429 () Bool)

(declare-fun e!327820 () Bool)

(assert (=> d!84429 e!327820))

(declare-fun c!65361 () Bool)

(assert (=> d!84429 (= c!65361 (and ((_ is Intermediate!5602) lt!259728) (undefined!6414 lt!259728)))))

(declare-fun e!327821 () SeekEntryResult!5602)

(assert (=> d!84429 (= lt!259728 e!327821)))

(declare-fun c!65360 () Bool)

(assert (=> d!84429 (= c!65360 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!259727 () (_ BitVec 64))

(assert (=> d!84429 (= lt!259727 (select (arr!17156 (array!35729 (store (arr!17156 a!3118) i!1132 k0!1914) (size!17521 a!3118))) lt!259592))))

(assert (=> d!84429 (validMask!0 mask!3119)))

(assert (=> d!84429 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259592 (select (store (arr!17156 a!3118) i!1132 k0!1914) j!142) (array!35729 (store (arr!17156 a!3118) i!1132 k0!1914) (size!17521 a!3118)) mask!3119) lt!259728)))

(declare-fun b!570022 () Bool)

(assert (=> b!570022 (= e!327821 e!327817)))

(declare-fun c!65362 () Bool)

(assert (=> b!570022 (= c!65362 (or (= lt!259727 (select (store (arr!17156 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!259727 lt!259727) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570023 () Bool)

(assert (=> b!570023 (and (bvsge (index!24637 lt!259728) #b00000000000000000000000000000000) (bvslt (index!24637 lt!259728) (size!17521 (array!35729 (store (arr!17156 a!3118) i!1132 k0!1914) (size!17521 a!3118)))))))

(declare-fun res!360009 () Bool)

(assert (=> b!570023 (= res!360009 (= (select (arr!17156 (array!35729 (store (arr!17156 a!3118) i!1132 k0!1914) (size!17521 a!3118))) (index!24637 lt!259728)) (select (store (arr!17156 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!570023 (=> res!360009 e!327818)))

(declare-fun e!327819 () Bool)

(assert (=> b!570023 (= e!327819 e!327818)))

(declare-fun b!570024 () Bool)

(assert (=> b!570024 (= e!327820 (bvsge (x!53512 lt!259728) #b01111111111111111111111111111110))))

(declare-fun b!570025 () Bool)

(assert (=> b!570025 (= e!327820 e!327819)))

(declare-fun res!360010 () Bool)

(assert (=> b!570025 (= res!360010 (and ((_ is Intermediate!5602) lt!259728) (not (undefined!6414 lt!259728)) (bvslt (x!53512 lt!259728) #b01111111111111111111111111111110) (bvsge (x!53512 lt!259728) #b00000000000000000000000000000000) (bvsge (x!53512 lt!259728) #b00000000000000000000000000000000)))))

(assert (=> b!570025 (=> (not res!360010) (not e!327819))))

(declare-fun b!570026 () Bool)

(assert (=> b!570026 (= e!327821 (Intermediate!5602 true lt!259592 #b00000000000000000000000000000000))))

(assert (= (and d!84429 c!65360) b!570026))

(assert (= (and d!84429 (not c!65360)) b!570022))

(assert (= (and b!570022 c!65362) b!570021))

(assert (= (and b!570022 (not c!65362)) b!570019))

(assert (= (and d!84429 c!65361) b!570024))

(assert (= (and d!84429 (not c!65361)) b!570025))

(assert (= (and b!570025 res!360010) b!570023))

(assert (= (and b!570023 (not res!360009)) b!570018))

(assert (= (and b!570018 (not res!360011)) b!570020))

(declare-fun m!548375 () Bool)

(assert (=> b!570020 m!548375))

(declare-fun m!548377 () Bool)

(assert (=> d!84429 m!548377))

(assert (=> d!84429 m!548159))

(declare-fun m!548379 () Bool)

(assert (=> b!570019 m!548379))

(assert (=> b!570019 m!548379))

(assert (=> b!570019 m!548137))

(declare-fun m!548381 () Bool)

(assert (=> b!570019 m!548381))

(assert (=> b!570018 m!548375))

(assert (=> b!570023 m!548375))

(assert (=> b!569718 d!84429))

(declare-fun b!570033 () Bool)

(declare-fun lt!259732 () SeekEntryResult!5602)

(assert (=> b!570033 (and (bvsge (index!24637 lt!259732) #b00000000000000000000000000000000) (bvslt (index!24637 lt!259732) (size!17521 a!3118)))))

(declare-fun res!360014 () Bool)

(assert (=> b!570033 (= res!360014 (= (select (arr!17156 a!3118) (index!24637 lt!259732)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327826 () Bool)

(assert (=> b!570033 (=> res!360014 e!327826)))

(declare-fun b!570034 () Bool)

(declare-fun e!327825 () SeekEntryResult!5602)

(assert (=> b!570034 (= e!327825 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!259589 #b00000000000000000000000000000000 mask!3119) (select (arr!17156 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!570035 () Bool)

(assert (=> b!570035 (and (bvsge (index!24637 lt!259732) #b00000000000000000000000000000000) (bvslt (index!24637 lt!259732) (size!17521 a!3118)))))

(assert (=> b!570035 (= e!327826 (= (select (arr!17156 a!3118) (index!24637 lt!259732)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!570036 () Bool)

(assert (=> b!570036 (= e!327825 (Intermediate!5602 false lt!259589 #b00000000000000000000000000000000))))

(declare-fun d!84441 () Bool)

(declare-fun e!327828 () Bool)

(assert (=> d!84441 e!327828))

(declare-fun c!65367 () Bool)

(assert (=> d!84441 (= c!65367 (and ((_ is Intermediate!5602) lt!259732) (undefined!6414 lt!259732)))))

(declare-fun e!327829 () SeekEntryResult!5602)

(assert (=> d!84441 (= lt!259732 e!327829)))

(declare-fun c!65366 () Bool)

(assert (=> d!84441 (= c!65366 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!259731 () (_ BitVec 64))

(assert (=> d!84441 (= lt!259731 (select (arr!17156 a!3118) lt!259589))))

(assert (=> d!84441 (validMask!0 mask!3119)))

(assert (=> d!84441 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259589 (select (arr!17156 a!3118) j!142) a!3118 mask!3119) lt!259732)))

(declare-fun b!570037 () Bool)

(assert (=> b!570037 (= e!327829 e!327825)))

(declare-fun c!65368 () Bool)

(assert (=> b!570037 (= c!65368 (or (= lt!259731 (select (arr!17156 a!3118) j!142)) (= (bvadd lt!259731 lt!259731) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570038 () Bool)

(assert (=> b!570038 (and (bvsge (index!24637 lt!259732) #b00000000000000000000000000000000) (bvslt (index!24637 lt!259732) (size!17521 a!3118)))))

(declare-fun res!360012 () Bool)

(assert (=> b!570038 (= res!360012 (= (select (arr!17156 a!3118) (index!24637 lt!259732)) (select (arr!17156 a!3118) j!142)))))

(assert (=> b!570038 (=> res!360012 e!327826)))

(declare-fun e!327827 () Bool)

(assert (=> b!570038 (= e!327827 e!327826)))

(declare-fun b!570039 () Bool)

(assert (=> b!570039 (= e!327828 (bvsge (x!53512 lt!259732) #b01111111111111111111111111111110))))

(declare-fun b!570040 () Bool)

(assert (=> b!570040 (= e!327828 e!327827)))

(declare-fun res!360013 () Bool)

(assert (=> b!570040 (= res!360013 (and ((_ is Intermediate!5602) lt!259732) (not (undefined!6414 lt!259732)) (bvslt (x!53512 lt!259732) #b01111111111111111111111111111110) (bvsge (x!53512 lt!259732) #b00000000000000000000000000000000) (bvsge (x!53512 lt!259732) #b00000000000000000000000000000000)))))

(assert (=> b!570040 (=> (not res!360013) (not e!327827))))

(declare-fun b!570041 () Bool)

(assert (=> b!570041 (= e!327829 (Intermediate!5602 true lt!259589 #b00000000000000000000000000000000))))

(assert (= (and d!84441 c!65366) b!570041))

(assert (= (and d!84441 (not c!65366)) b!570037))

(assert (= (and b!570037 c!65368) b!570036))

(assert (= (and b!570037 (not c!65368)) b!570034))

(assert (= (and d!84441 c!65367) b!570039))

(assert (= (and d!84441 (not c!65367)) b!570040))

(assert (= (and b!570040 res!360013) b!570038))

(assert (= (and b!570038 (not res!360012)) b!570033))

(assert (= (and b!570033 (not res!360014)) b!570035))

(declare-fun m!548391 () Bool)

(assert (=> b!570035 m!548391))

(declare-fun m!548393 () Bool)

(assert (=> d!84441 m!548393))

(assert (=> d!84441 m!548159))

(declare-fun m!548395 () Bool)

(assert (=> b!570034 m!548395))

(assert (=> b!570034 m!548395))

(assert (=> b!570034 m!548129))

(declare-fun m!548397 () Bool)

(assert (=> b!570034 m!548397))

(assert (=> b!570033 m!548391))

(assert (=> b!570038 m!548391))

(assert (=> b!569718 d!84441))

(declare-fun d!84445 () Bool)

(declare-fun lt!259738 () (_ BitVec 32))

(declare-fun lt!259737 () (_ BitVec 32))

(assert (=> d!84445 (= lt!259738 (bvmul (bvxor lt!259737 (bvlshr lt!259737 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84445 (= lt!259737 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17156 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17156 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84445 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!360015 (let ((h!12296 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17156 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17156 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53521 (bvmul (bvxor h!12296 (bvlshr h!12296 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53521 (bvlshr x!53521 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!360015 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!360015 #b00000000000000000000000000000000))))))

(assert (=> d!84445 (= (toIndex!0 (select (store (arr!17156 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!259738 (bvlshr lt!259738 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!569718 d!84445))

(declare-fun d!84455 () Bool)

(declare-fun lt!259740 () (_ BitVec 32))

(declare-fun lt!259739 () (_ BitVec 32))

(assert (=> d!84455 (= lt!259740 (bvmul (bvxor lt!259739 (bvlshr lt!259739 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84455 (= lt!259739 ((_ extract 31 0) (bvand (bvxor (select (arr!17156 a!3118) j!142) (bvlshr (select (arr!17156 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84455 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!360015 (let ((h!12296 ((_ extract 31 0) (bvand (bvxor (select (arr!17156 a!3118) j!142) (bvlshr (select (arr!17156 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53521 (bvmul (bvxor h!12296 (bvlshr h!12296 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53521 (bvlshr x!53521 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!360015 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!360015 #b00000000000000000000000000000000))))))

(assert (=> d!84455 (= (toIndex!0 (select (arr!17156 a!3118) j!142) mask!3119) (bvand (bvxor lt!259740 (bvlshr lt!259740 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!569718 d!84455))

(declare-fun d!84457 () Bool)

(assert (=> d!84457 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!569724 d!84457))

(declare-fun lt!259742 () SeekEntryResult!5602)

(declare-fun e!327843 () SeekEntryResult!5602)

(declare-fun b!570057 () Bool)

(assert (=> b!570057 (= e!327843 (seekKeyOrZeroReturnVacant!0 (x!53512 lt!259742) (index!24637 lt!259742) (index!24637 lt!259742) (select (arr!17156 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!570058 () Bool)

(declare-fun c!65374 () Bool)

(declare-fun lt!259743 () (_ BitVec 64))

(assert (=> b!570058 (= c!65374 (= lt!259743 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327844 () SeekEntryResult!5602)

(assert (=> b!570058 (= e!327844 e!327843)))

(declare-fun b!570059 () Bool)

(assert (=> b!570059 (= e!327843 (MissingZero!5602 (index!24637 lt!259742)))))

(declare-fun b!570060 () Bool)

(declare-fun e!327842 () SeekEntryResult!5602)

(assert (=> b!570060 (= e!327842 e!327844)))

(assert (=> b!570060 (= lt!259743 (select (arr!17156 a!3118) (index!24637 lt!259742)))))

(declare-fun c!65373 () Bool)

(assert (=> b!570060 (= c!65373 (= lt!259743 (select (arr!17156 a!3118) j!142)))))

(declare-fun d!84459 () Bool)

(declare-fun lt!259741 () SeekEntryResult!5602)

(assert (=> d!84459 (and (or ((_ is Undefined!5602) lt!259741) (not ((_ is Found!5602) lt!259741)) (and (bvsge (index!24636 lt!259741) #b00000000000000000000000000000000) (bvslt (index!24636 lt!259741) (size!17521 a!3118)))) (or ((_ is Undefined!5602) lt!259741) ((_ is Found!5602) lt!259741) (not ((_ is MissingZero!5602) lt!259741)) (and (bvsge (index!24635 lt!259741) #b00000000000000000000000000000000) (bvslt (index!24635 lt!259741) (size!17521 a!3118)))) (or ((_ is Undefined!5602) lt!259741) ((_ is Found!5602) lt!259741) ((_ is MissingZero!5602) lt!259741) (not ((_ is MissingVacant!5602) lt!259741)) (and (bvsge (index!24638 lt!259741) #b00000000000000000000000000000000) (bvslt (index!24638 lt!259741) (size!17521 a!3118)))) (or ((_ is Undefined!5602) lt!259741) (ite ((_ is Found!5602) lt!259741) (= (select (arr!17156 a!3118) (index!24636 lt!259741)) (select (arr!17156 a!3118) j!142)) (ite ((_ is MissingZero!5602) lt!259741) (= (select (arr!17156 a!3118) (index!24635 lt!259741)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5602) lt!259741) (= (select (arr!17156 a!3118) (index!24638 lt!259741)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84459 (= lt!259741 e!327842)))

(declare-fun c!65372 () Bool)

(assert (=> d!84459 (= c!65372 (and ((_ is Intermediate!5602) lt!259742) (undefined!6414 lt!259742)))))

(assert (=> d!84459 (= lt!259742 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17156 a!3118) j!142) mask!3119) (select (arr!17156 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84459 (validMask!0 mask!3119)))

(assert (=> d!84459 (= (seekEntryOrOpen!0 (select (arr!17156 a!3118) j!142) a!3118 mask!3119) lt!259741)))

(declare-fun b!570061 () Bool)

(assert (=> b!570061 (= e!327844 (Found!5602 (index!24637 lt!259742)))))

(declare-fun b!570062 () Bool)

(assert (=> b!570062 (= e!327842 Undefined!5602)))

(assert (= (and d!84459 c!65372) b!570062))

(assert (= (and d!84459 (not c!65372)) b!570060))

(assert (= (and b!570060 c!65373) b!570061))

(assert (= (and b!570060 (not c!65373)) b!570058))

(assert (= (and b!570058 c!65374) b!570059))

(assert (= (and b!570058 (not c!65374)) b!570057))

(assert (=> b!570057 m!548129))

(declare-fun m!548401 () Bool)

(assert (=> b!570057 m!548401))

(declare-fun m!548403 () Bool)

(assert (=> b!570060 m!548403))

(declare-fun m!548407 () Bool)

(assert (=> d!84459 m!548407))

(assert (=> d!84459 m!548129))

(assert (=> d!84459 m!548135))

(declare-fun m!548409 () Bool)

(assert (=> d!84459 m!548409))

(assert (=> d!84459 m!548135))

(assert (=> d!84459 m!548129))

(declare-fun m!548411 () Bool)

(assert (=> d!84459 m!548411))

(assert (=> d!84459 m!548159))

(declare-fun m!548413 () Bool)

(assert (=> d!84459 m!548413))

(assert (=> b!569719 d!84459))

(declare-fun b!570063 () Bool)

(declare-fun e!327846 () Bool)

(declare-fun call!32577 () Bool)

(assert (=> b!570063 (= e!327846 call!32577)))

(declare-fun d!84463 () Bool)

(declare-fun res!360026 () Bool)

(declare-fun e!327845 () Bool)

(assert (=> d!84463 (=> res!360026 e!327845)))

(assert (=> d!84463 (= res!360026 (bvsge j!142 (size!17521 a!3118)))))

(assert (=> d!84463 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!327845)))

(declare-fun bm!32574 () Bool)

(assert (=> bm!32574 (= call!32577 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!570064 () Bool)

(declare-fun e!327847 () Bool)

(assert (=> b!570064 (= e!327847 e!327846)))

(declare-fun lt!259745 () (_ BitVec 64))

(assert (=> b!570064 (= lt!259745 (select (arr!17156 a!3118) j!142))))

(declare-fun lt!259746 () Unit!17892)

(assert (=> b!570064 (= lt!259746 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!259745 j!142))))

(assert (=> b!570064 (arrayContainsKey!0 a!3118 lt!259745 #b00000000000000000000000000000000)))

(declare-fun lt!259744 () Unit!17892)

(assert (=> b!570064 (= lt!259744 lt!259746)))

(declare-fun res!360025 () Bool)

(assert (=> b!570064 (= res!360025 (= (seekEntryOrOpen!0 (select (arr!17156 a!3118) j!142) a!3118 mask!3119) (Found!5602 j!142)))))

(assert (=> b!570064 (=> (not res!360025) (not e!327846))))

(declare-fun b!570065 () Bool)

(assert (=> b!570065 (= e!327845 e!327847)))

(declare-fun c!65375 () Bool)

(assert (=> b!570065 (= c!65375 (validKeyInArray!0 (select (arr!17156 a!3118) j!142)))))

(declare-fun b!570066 () Bool)

(assert (=> b!570066 (= e!327847 call!32577)))

(assert (= (and d!84463 (not res!360026)) b!570065))

(assert (= (and b!570065 c!65375) b!570064))

(assert (= (and b!570065 (not c!65375)) b!570066))

(assert (= (and b!570064 res!360025) b!570063))

(assert (= (or b!570063 b!570066) bm!32574))

(declare-fun m!548415 () Bool)

(assert (=> bm!32574 m!548415))

(assert (=> b!570064 m!548129))

(declare-fun m!548417 () Bool)

(assert (=> b!570064 m!548417))

(declare-fun m!548419 () Bool)

(assert (=> b!570064 m!548419))

(assert (=> b!570064 m!548129))

(assert (=> b!570064 m!548157))

(assert (=> b!570065 m!548129))

(assert (=> b!570065 m!548129))

(assert (=> b!570065 m!548131))

(assert (=> b!569719 d!84463))

(declare-fun d!84467 () Bool)

(assert (=> d!84467 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!259752 () Unit!17892)

(declare-fun choose!38 (array!35728 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17892)

(assert (=> d!84467 (= lt!259752 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84467 (validMask!0 mask!3119)))

(assert (=> d!84467 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!259752)))

(declare-fun bs!17657 () Bool)

(assert (= bs!17657 d!84467))

(assert (=> bs!17657 m!548151))

(declare-fun m!548437 () Bool)

(assert (=> bs!17657 m!548437))

(assert (=> bs!17657 m!548159))

(assert (=> b!569719 d!84467))

(check-sat (not b!569877) (not bm!32574) (not b!569947) (not b!569878) (not b!570057) (not d!84459) (not d!84441) (not b!570064) (not b!569951) (not b!570034) (not b!569840) (not d!84467) (not d!84395) (not b!569798) (not bm!32564) (not bm!32561) (not b!569891) (not b!570065) (not d!84429) (not d!84399) (not b!569950) (not b!570019))
(check-sat)
