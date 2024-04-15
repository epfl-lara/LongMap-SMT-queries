; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50906 () Bool)

(assert start!50906)

(declare-fun b!556669 () Bool)

(declare-fun res!349041 () Bool)

(declare-fun e!320684 () Bool)

(assert (=> b!556669 (=> (not res!349041) (not e!320684))))

(declare-datatypes ((array!35083 0))(
  ( (array!35084 (arr!16850 (Array (_ BitVec 32) (_ BitVec 64))) (size!17215 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35083)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556669 (= res!349041 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556670 () Bool)

(declare-fun e!320681 () Bool)

(assert (=> b!556670 (= e!320684 e!320681)))

(declare-fun res!349047 () Bool)

(assert (=> b!556670 (=> (not res!349047) (not e!320681))))

(declare-datatypes ((SeekEntryResult!5296 0))(
  ( (MissingZero!5296 (index!23411 (_ BitVec 32))) (Found!5296 (index!23412 (_ BitVec 32))) (Intermediate!5296 (undefined!6108 Bool) (index!23413 (_ BitVec 32)) (x!52315 (_ BitVec 32))) (Undefined!5296) (MissingVacant!5296 (index!23414 (_ BitVec 32))) )
))
(declare-fun lt!252858 () SeekEntryResult!5296)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556670 (= res!349047 (or (= lt!252858 (MissingZero!5296 i!1132)) (= lt!252858 (MissingVacant!5296 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35083 (_ BitVec 32)) SeekEntryResult!5296)

(assert (=> b!556670 (= lt!252858 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!556671 () Bool)

(declare-fun res!349043 () Bool)

(assert (=> b!556671 (=> (not res!349043) (not e!320681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35083 (_ BitVec 32)) Bool)

(assert (=> b!556671 (= res!349043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!349042 () Bool)

(assert (=> start!50906 (=> (not res!349042) (not e!320684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50906 (= res!349042 (validMask!0 mask!3119))))

(assert (=> start!50906 e!320684))

(assert (=> start!50906 true))

(declare-fun array_inv!12733 (array!35083) Bool)

(assert (=> start!50906 (array_inv!12733 a!3118)))

(declare-fun b!556672 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!320685 () Bool)

(declare-fun lt!252860 () SeekEntryResult!5296)

(get-info :version)

(assert (=> b!556672 (= e!320685 (not (or (not ((_ is Intermediate!5296) lt!252860)) (undefined!6108 lt!252860) (= (select (arr!16850 a!3118) (index!23413 lt!252860)) (select (arr!16850 a!3118) j!142)) (= (select (arr!16850 a!3118) (index!23413 lt!252860)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23413 lt!252860) #b00000000000000000000000000000000) (bvsge (index!23413 lt!252860) (bvadd #b00000000000000000000000000000001 mask!3119)) (and (bvsle (x!52315 lt!252860) #b01111111111111111111111111111110) (bvsge (x!52315 lt!252860) #b00000000000000000000000000000000)))))))

(declare-fun e!320682 () Bool)

(assert (=> b!556672 e!320682))

(declare-fun res!349048 () Bool)

(assert (=> b!556672 (=> (not res!349048) (not e!320682))))

(assert (=> b!556672 (= res!349048 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17352 0))(
  ( (Unit!17353) )
))
(declare-fun lt!252862 () Unit!17352)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35083 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17352)

(assert (=> b!556672 (= lt!252862 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556673 () Bool)

(declare-fun res!349040 () Bool)

(assert (=> b!556673 (=> (not res!349040) (not e!320684))))

(assert (=> b!556673 (= res!349040 (and (= (size!17215 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17215 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17215 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556674 () Bool)

(assert (=> b!556674 (= e!320681 e!320685)))

(declare-fun res!349049 () Bool)

(assert (=> b!556674 (=> (not res!349049) (not e!320685))))

(declare-fun lt!252861 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35083 (_ BitVec 32)) SeekEntryResult!5296)

(assert (=> b!556674 (= res!349049 (= lt!252860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252861 (select (store (arr!16850 a!3118) i!1132 k0!1914) j!142) (array!35084 (store (arr!16850 a!3118) i!1132 k0!1914) (size!17215 a!3118)) mask!3119)))))

(declare-fun lt!252859 () (_ BitVec 32))

(assert (=> b!556674 (= lt!252860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252859 (select (arr!16850 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556674 (= lt!252861 (toIndex!0 (select (store (arr!16850 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!556674 (= lt!252859 (toIndex!0 (select (arr!16850 a!3118) j!142) mask!3119))))

(declare-fun b!556675 () Bool)

(assert (=> b!556675 (= e!320682 (= (seekEntryOrOpen!0 (select (arr!16850 a!3118) j!142) a!3118 mask!3119) (Found!5296 j!142)))))

(declare-fun b!556676 () Bool)

(declare-fun res!349044 () Bool)

(assert (=> b!556676 (=> (not res!349044) (not e!320684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556676 (= res!349044 (validKeyInArray!0 (select (arr!16850 a!3118) j!142)))))

(declare-fun b!556677 () Bool)

(declare-fun res!349045 () Bool)

(assert (=> b!556677 (=> (not res!349045) (not e!320681))))

(declare-datatypes ((List!10969 0))(
  ( (Nil!10966) (Cons!10965 (h!11953 (_ BitVec 64)) (t!17188 List!10969)) )
))
(declare-fun arrayNoDuplicates!0 (array!35083 (_ BitVec 32) List!10969) Bool)

(assert (=> b!556677 (= res!349045 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10966))))

(declare-fun b!556678 () Bool)

(declare-fun res!349046 () Bool)

(assert (=> b!556678 (=> (not res!349046) (not e!320684))))

(assert (=> b!556678 (= res!349046 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50906 res!349042) b!556673))

(assert (= (and b!556673 res!349040) b!556676))

(assert (= (and b!556676 res!349044) b!556678))

(assert (= (and b!556678 res!349046) b!556669))

(assert (= (and b!556669 res!349041) b!556670))

(assert (= (and b!556670 res!349047) b!556671))

(assert (= (and b!556671 res!349043) b!556677))

(assert (= (and b!556677 res!349045) b!556674))

(assert (= (and b!556674 res!349049) b!556672))

(assert (= (and b!556672 res!349048) b!556675))

(declare-fun m!534125 () Bool)

(assert (=> b!556671 m!534125))

(declare-fun m!534127 () Bool)

(assert (=> b!556674 m!534127))

(declare-fun m!534129 () Bool)

(assert (=> b!556674 m!534129))

(assert (=> b!556674 m!534127))

(assert (=> b!556674 m!534127))

(declare-fun m!534131 () Bool)

(assert (=> b!556674 m!534131))

(declare-fun m!534133 () Bool)

(assert (=> b!556674 m!534133))

(declare-fun m!534135 () Bool)

(assert (=> b!556674 m!534135))

(assert (=> b!556674 m!534133))

(declare-fun m!534137 () Bool)

(assert (=> b!556674 m!534137))

(assert (=> b!556674 m!534133))

(declare-fun m!534139 () Bool)

(assert (=> b!556674 m!534139))

(declare-fun m!534141 () Bool)

(assert (=> b!556677 m!534141))

(declare-fun m!534143 () Bool)

(assert (=> start!50906 m!534143))

(declare-fun m!534145 () Bool)

(assert (=> start!50906 m!534145))

(declare-fun m!534147 () Bool)

(assert (=> b!556670 m!534147))

(assert (=> b!556675 m!534127))

(assert (=> b!556675 m!534127))

(declare-fun m!534149 () Bool)

(assert (=> b!556675 m!534149))

(declare-fun m!534151 () Bool)

(assert (=> b!556672 m!534151))

(assert (=> b!556672 m!534127))

(declare-fun m!534153 () Bool)

(assert (=> b!556672 m!534153))

(declare-fun m!534155 () Bool)

(assert (=> b!556672 m!534155))

(declare-fun m!534157 () Bool)

(assert (=> b!556678 m!534157))

(declare-fun m!534159 () Bool)

(assert (=> b!556669 m!534159))

(assert (=> b!556676 m!534127))

(assert (=> b!556676 m!534127))

(declare-fun m!534161 () Bool)

(assert (=> b!556676 m!534161))

(check-sat (not b!556671) (not b!556669) (not b!556675) (not b!556670) (not b!556672) (not b!556674) (not b!556678) (not start!50906) (not b!556676) (not b!556677))
(check-sat)
(get-model)

(declare-fun d!83171 () Bool)

(declare-fun res!349114 () Bool)

(declare-fun e!320720 () Bool)

(assert (=> d!83171 (=> res!349114 e!320720)))

(assert (=> d!83171 (= res!349114 (= (select (arr!16850 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83171 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!320720)))

(declare-fun b!556743 () Bool)

(declare-fun e!320721 () Bool)

(assert (=> b!556743 (= e!320720 e!320721)))

(declare-fun res!349115 () Bool)

(assert (=> b!556743 (=> (not res!349115) (not e!320721))))

(assert (=> b!556743 (= res!349115 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17215 a!3118)))))

(declare-fun b!556744 () Bool)

(assert (=> b!556744 (= e!320721 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83171 (not res!349114)) b!556743))

(assert (= (and b!556743 res!349115) b!556744))

(declare-fun m!534239 () Bool)

(assert (=> d!83171 m!534239))

(declare-fun m!534241 () Bool)

(assert (=> b!556744 m!534241))

(assert (=> b!556669 d!83171))

(declare-fun b!556763 () Bool)

(declare-fun lt!252897 () SeekEntryResult!5296)

(assert (=> b!556763 (and (bvsge (index!23413 lt!252897) #b00000000000000000000000000000000) (bvslt (index!23413 lt!252897) (size!17215 (array!35084 (store (arr!16850 a!3118) i!1132 k0!1914) (size!17215 a!3118)))))))

(declare-fun res!349124 () Bool)

(assert (=> b!556763 (= res!349124 (= (select (arr!16850 (array!35084 (store (arr!16850 a!3118) i!1132 k0!1914) (size!17215 a!3118))) (index!23413 lt!252897)) (select (store (arr!16850 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!320733 () Bool)

(assert (=> b!556763 (=> res!349124 e!320733)))

(declare-fun e!320734 () Bool)

(assert (=> b!556763 (= e!320734 e!320733)))

(declare-fun b!556764 () Bool)

(declare-fun e!320732 () SeekEntryResult!5296)

(declare-fun e!320736 () SeekEntryResult!5296)

(assert (=> b!556764 (= e!320732 e!320736)))

(declare-fun c!64160 () Bool)

(declare-fun lt!252898 () (_ BitVec 64))

(assert (=> b!556764 (= c!64160 (or (= lt!252898 (select (store (arr!16850 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!252898 lt!252898) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!556765 () Bool)

(declare-fun e!320735 () Bool)

(assert (=> b!556765 (= e!320735 (bvsge (x!52315 lt!252897) #b01111111111111111111111111111110))))

(declare-fun b!556766 () Bool)

(assert (=> b!556766 (= e!320732 (Intermediate!5296 true lt!252861 #b00000000000000000000000000000000))))

(declare-fun b!556767 () Bool)

(assert (=> b!556767 (= e!320736 (Intermediate!5296 false lt!252861 #b00000000000000000000000000000000))))

(declare-fun b!556768 () Bool)

(assert (=> b!556768 (and (bvsge (index!23413 lt!252897) #b00000000000000000000000000000000) (bvslt (index!23413 lt!252897) (size!17215 (array!35084 (store (arr!16850 a!3118) i!1132 k0!1914) (size!17215 a!3118)))))))

(assert (=> b!556768 (= e!320733 (= (select (arr!16850 (array!35084 (store (arr!16850 a!3118) i!1132 k0!1914) (size!17215 a!3118))) (index!23413 lt!252897)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!83173 () Bool)

(assert (=> d!83173 e!320735))

(declare-fun c!64159 () Bool)

(assert (=> d!83173 (= c!64159 (and ((_ is Intermediate!5296) lt!252897) (undefined!6108 lt!252897)))))

(assert (=> d!83173 (= lt!252897 e!320732)))

(declare-fun c!64161 () Bool)

(assert (=> d!83173 (= c!64161 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83173 (= lt!252898 (select (arr!16850 (array!35084 (store (arr!16850 a!3118) i!1132 k0!1914) (size!17215 a!3118))) lt!252861))))

(assert (=> d!83173 (validMask!0 mask!3119)))

(assert (=> d!83173 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252861 (select (store (arr!16850 a!3118) i!1132 k0!1914) j!142) (array!35084 (store (arr!16850 a!3118) i!1132 k0!1914) (size!17215 a!3118)) mask!3119) lt!252897)))

(declare-fun b!556769 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556769 (= e!320736 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!252861 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16850 a!3118) i!1132 k0!1914) j!142) (array!35084 (store (arr!16850 a!3118) i!1132 k0!1914) (size!17215 a!3118)) mask!3119))))

(declare-fun b!556770 () Bool)

(assert (=> b!556770 (= e!320735 e!320734)))

(declare-fun res!349123 () Bool)

(assert (=> b!556770 (= res!349123 (and ((_ is Intermediate!5296) lt!252897) (not (undefined!6108 lt!252897)) (bvslt (x!52315 lt!252897) #b01111111111111111111111111111110) (bvsge (x!52315 lt!252897) #b00000000000000000000000000000000) (bvsge (x!52315 lt!252897) #b00000000000000000000000000000000)))))

(assert (=> b!556770 (=> (not res!349123) (not e!320734))))

(declare-fun b!556771 () Bool)

(assert (=> b!556771 (and (bvsge (index!23413 lt!252897) #b00000000000000000000000000000000) (bvslt (index!23413 lt!252897) (size!17215 (array!35084 (store (arr!16850 a!3118) i!1132 k0!1914) (size!17215 a!3118)))))))

(declare-fun res!349122 () Bool)

(assert (=> b!556771 (= res!349122 (= (select (arr!16850 (array!35084 (store (arr!16850 a!3118) i!1132 k0!1914) (size!17215 a!3118))) (index!23413 lt!252897)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!556771 (=> res!349122 e!320733)))

(assert (= (and d!83173 c!64161) b!556766))

(assert (= (and d!83173 (not c!64161)) b!556764))

(assert (= (and b!556764 c!64160) b!556767))

(assert (= (and b!556764 (not c!64160)) b!556769))

(assert (= (and d!83173 c!64159) b!556765))

(assert (= (and d!83173 (not c!64159)) b!556770))

(assert (= (and b!556770 res!349123) b!556763))

(assert (= (and b!556763 (not res!349124)) b!556771))

(assert (= (and b!556771 (not res!349122)) b!556768))

(declare-fun m!534243 () Bool)

(assert (=> d!83173 m!534243))

(assert (=> d!83173 m!534143))

(declare-fun m!534245 () Bool)

(assert (=> b!556771 m!534245))

(assert (=> b!556763 m!534245))

(assert (=> b!556768 m!534245))

(declare-fun m!534247 () Bool)

(assert (=> b!556769 m!534247))

(assert (=> b!556769 m!534247))

(assert (=> b!556769 m!534133))

(declare-fun m!534249 () Bool)

(assert (=> b!556769 m!534249))

(assert (=> b!556674 d!83173))

(declare-fun b!556772 () Bool)

(declare-fun lt!252899 () SeekEntryResult!5296)

(assert (=> b!556772 (and (bvsge (index!23413 lt!252899) #b00000000000000000000000000000000) (bvslt (index!23413 lt!252899) (size!17215 a!3118)))))

(declare-fun res!349127 () Bool)

(assert (=> b!556772 (= res!349127 (= (select (arr!16850 a!3118) (index!23413 lt!252899)) (select (arr!16850 a!3118) j!142)))))

(declare-fun e!320738 () Bool)

(assert (=> b!556772 (=> res!349127 e!320738)))

(declare-fun e!320739 () Bool)

(assert (=> b!556772 (= e!320739 e!320738)))

(declare-fun b!556773 () Bool)

(declare-fun e!320737 () SeekEntryResult!5296)

(declare-fun e!320741 () SeekEntryResult!5296)

(assert (=> b!556773 (= e!320737 e!320741)))

(declare-fun c!64163 () Bool)

(declare-fun lt!252900 () (_ BitVec 64))

(assert (=> b!556773 (= c!64163 (or (= lt!252900 (select (arr!16850 a!3118) j!142)) (= (bvadd lt!252900 lt!252900) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!556774 () Bool)

(declare-fun e!320740 () Bool)

(assert (=> b!556774 (= e!320740 (bvsge (x!52315 lt!252899) #b01111111111111111111111111111110))))

(declare-fun b!556775 () Bool)

(assert (=> b!556775 (= e!320737 (Intermediate!5296 true lt!252859 #b00000000000000000000000000000000))))

(declare-fun b!556776 () Bool)

(assert (=> b!556776 (= e!320741 (Intermediate!5296 false lt!252859 #b00000000000000000000000000000000))))

(declare-fun b!556777 () Bool)

(assert (=> b!556777 (and (bvsge (index!23413 lt!252899) #b00000000000000000000000000000000) (bvslt (index!23413 lt!252899) (size!17215 a!3118)))))

(assert (=> b!556777 (= e!320738 (= (select (arr!16850 a!3118) (index!23413 lt!252899)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!83177 () Bool)

(assert (=> d!83177 e!320740))

(declare-fun c!64162 () Bool)

(assert (=> d!83177 (= c!64162 (and ((_ is Intermediate!5296) lt!252899) (undefined!6108 lt!252899)))))

(assert (=> d!83177 (= lt!252899 e!320737)))

(declare-fun c!64164 () Bool)

(assert (=> d!83177 (= c!64164 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83177 (= lt!252900 (select (arr!16850 a!3118) lt!252859))))

(assert (=> d!83177 (validMask!0 mask!3119)))

(assert (=> d!83177 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252859 (select (arr!16850 a!3118) j!142) a!3118 mask!3119) lt!252899)))

(declare-fun b!556778 () Bool)

(assert (=> b!556778 (= e!320741 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!252859 #b00000000000000000000000000000000 mask!3119) (select (arr!16850 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!556779 () Bool)

(assert (=> b!556779 (= e!320740 e!320739)))

(declare-fun res!349126 () Bool)

(assert (=> b!556779 (= res!349126 (and ((_ is Intermediate!5296) lt!252899) (not (undefined!6108 lt!252899)) (bvslt (x!52315 lt!252899) #b01111111111111111111111111111110) (bvsge (x!52315 lt!252899) #b00000000000000000000000000000000) (bvsge (x!52315 lt!252899) #b00000000000000000000000000000000)))))

(assert (=> b!556779 (=> (not res!349126) (not e!320739))))

(declare-fun b!556780 () Bool)

(assert (=> b!556780 (and (bvsge (index!23413 lt!252899) #b00000000000000000000000000000000) (bvslt (index!23413 lt!252899) (size!17215 a!3118)))))

(declare-fun res!349125 () Bool)

(assert (=> b!556780 (= res!349125 (= (select (arr!16850 a!3118) (index!23413 lt!252899)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!556780 (=> res!349125 e!320738)))

(assert (= (and d!83177 c!64164) b!556775))

(assert (= (and d!83177 (not c!64164)) b!556773))

(assert (= (and b!556773 c!64163) b!556776))

(assert (= (and b!556773 (not c!64163)) b!556778))

(assert (= (and d!83177 c!64162) b!556774))

(assert (= (and d!83177 (not c!64162)) b!556779))

(assert (= (and b!556779 res!349126) b!556772))

(assert (= (and b!556772 (not res!349127)) b!556780))

(assert (= (and b!556780 (not res!349125)) b!556777))

(declare-fun m!534251 () Bool)

(assert (=> d!83177 m!534251))

(assert (=> d!83177 m!534143))

(declare-fun m!534253 () Bool)

(assert (=> b!556780 m!534253))

(assert (=> b!556772 m!534253))

(assert (=> b!556777 m!534253))

(declare-fun m!534255 () Bool)

(assert (=> b!556778 m!534255))

(assert (=> b!556778 m!534255))

(assert (=> b!556778 m!534127))

(declare-fun m!534257 () Bool)

(assert (=> b!556778 m!534257))

(assert (=> b!556674 d!83177))

(declare-fun d!83179 () Bool)

(declare-fun lt!252906 () (_ BitVec 32))

(declare-fun lt!252905 () (_ BitVec 32))

(assert (=> d!83179 (= lt!252906 (bvmul (bvxor lt!252905 (bvlshr lt!252905 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83179 (= lt!252905 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16850 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16850 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83179 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349128 (let ((h!11956 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16850 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16850 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52319 (bvmul (bvxor h!11956 (bvlshr h!11956 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52319 (bvlshr x!52319 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349128 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349128 #b00000000000000000000000000000000))))))

(assert (=> d!83179 (= (toIndex!0 (select (store (arr!16850 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!252906 (bvlshr lt!252906 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!556674 d!83179))

(declare-fun d!83181 () Bool)

(declare-fun lt!252908 () (_ BitVec 32))

(declare-fun lt!252907 () (_ BitVec 32))

(assert (=> d!83181 (= lt!252908 (bvmul (bvxor lt!252907 (bvlshr lt!252907 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83181 (= lt!252907 ((_ extract 31 0) (bvand (bvxor (select (arr!16850 a!3118) j!142) (bvlshr (select (arr!16850 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83181 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349128 (let ((h!11956 ((_ extract 31 0) (bvand (bvxor (select (arr!16850 a!3118) j!142) (bvlshr (select (arr!16850 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52319 (bvmul (bvxor h!11956 (bvlshr h!11956 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52319 (bvlshr x!52319 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349128 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349128 #b00000000000000000000000000000000))))))

(assert (=> d!83181 (= (toIndex!0 (select (arr!16850 a!3118) j!142) mask!3119) (bvand (bvxor lt!252908 (bvlshr lt!252908 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!556674 d!83181))

(declare-fun b!556811 () Bool)

(declare-fun e!320758 () SeekEntryResult!5296)

(declare-fun lt!252926 () SeekEntryResult!5296)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35083 (_ BitVec 32)) SeekEntryResult!5296)

(assert (=> b!556811 (= e!320758 (seekKeyOrZeroReturnVacant!0 (x!52315 lt!252926) (index!23413 lt!252926) (index!23413 lt!252926) (select (arr!16850 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!556812 () Bool)

(assert (=> b!556812 (= e!320758 (MissingZero!5296 (index!23413 lt!252926)))))

(declare-fun b!556813 () Bool)

(declare-fun c!64180 () Bool)

(declare-fun lt!252925 () (_ BitVec 64))

(assert (=> b!556813 (= c!64180 (= lt!252925 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!320757 () SeekEntryResult!5296)

(assert (=> b!556813 (= e!320757 e!320758)))

(declare-fun b!556814 () Bool)

(declare-fun e!320759 () SeekEntryResult!5296)

(assert (=> b!556814 (= e!320759 e!320757)))

(assert (=> b!556814 (= lt!252925 (select (arr!16850 a!3118) (index!23413 lt!252926)))))

(declare-fun c!64182 () Bool)

(assert (=> b!556814 (= c!64182 (= lt!252925 (select (arr!16850 a!3118) j!142)))))

(declare-fun d!83183 () Bool)

(declare-fun lt!252924 () SeekEntryResult!5296)

(assert (=> d!83183 (and (or ((_ is Undefined!5296) lt!252924) (not ((_ is Found!5296) lt!252924)) (and (bvsge (index!23412 lt!252924) #b00000000000000000000000000000000) (bvslt (index!23412 lt!252924) (size!17215 a!3118)))) (or ((_ is Undefined!5296) lt!252924) ((_ is Found!5296) lt!252924) (not ((_ is MissingZero!5296) lt!252924)) (and (bvsge (index!23411 lt!252924) #b00000000000000000000000000000000) (bvslt (index!23411 lt!252924) (size!17215 a!3118)))) (or ((_ is Undefined!5296) lt!252924) ((_ is Found!5296) lt!252924) ((_ is MissingZero!5296) lt!252924) (not ((_ is MissingVacant!5296) lt!252924)) (and (bvsge (index!23414 lt!252924) #b00000000000000000000000000000000) (bvslt (index!23414 lt!252924) (size!17215 a!3118)))) (or ((_ is Undefined!5296) lt!252924) (ite ((_ is Found!5296) lt!252924) (= (select (arr!16850 a!3118) (index!23412 lt!252924)) (select (arr!16850 a!3118) j!142)) (ite ((_ is MissingZero!5296) lt!252924) (= (select (arr!16850 a!3118) (index!23411 lt!252924)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5296) lt!252924) (= (select (arr!16850 a!3118) (index!23414 lt!252924)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83183 (= lt!252924 e!320759)))

(declare-fun c!64181 () Bool)

(assert (=> d!83183 (= c!64181 (and ((_ is Intermediate!5296) lt!252926) (undefined!6108 lt!252926)))))

(assert (=> d!83183 (= lt!252926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16850 a!3118) j!142) mask!3119) (select (arr!16850 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83183 (validMask!0 mask!3119)))

(assert (=> d!83183 (= (seekEntryOrOpen!0 (select (arr!16850 a!3118) j!142) a!3118 mask!3119) lt!252924)))

(declare-fun b!556815 () Bool)

(assert (=> b!556815 (= e!320759 Undefined!5296)))

(declare-fun b!556816 () Bool)

(assert (=> b!556816 (= e!320757 (Found!5296 (index!23413 lt!252926)))))

(assert (= (and d!83183 c!64181) b!556815))

(assert (= (and d!83183 (not c!64181)) b!556814))

(assert (= (and b!556814 c!64182) b!556816))

(assert (= (and b!556814 (not c!64182)) b!556813))

(assert (= (and b!556813 c!64180) b!556812))

(assert (= (and b!556813 (not c!64180)) b!556811))

(assert (=> b!556811 m!534127))

(declare-fun m!534273 () Bool)

(assert (=> b!556811 m!534273))

(declare-fun m!534275 () Bool)

(assert (=> b!556814 m!534275))

(assert (=> d!83183 m!534127))

(assert (=> d!83183 m!534129))

(declare-fun m!534277 () Bool)

(assert (=> d!83183 m!534277))

(assert (=> d!83183 m!534143))

(declare-fun m!534279 () Bool)

(assert (=> d!83183 m!534279))

(assert (=> d!83183 m!534129))

(assert (=> d!83183 m!534127))

(declare-fun m!534281 () Bool)

(assert (=> d!83183 m!534281))

(declare-fun m!534283 () Bool)

(assert (=> d!83183 m!534283))

(assert (=> b!556675 d!83183))

(declare-fun b!556817 () Bool)

(declare-fun e!320761 () SeekEntryResult!5296)

(declare-fun lt!252929 () SeekEntryResult!5296)

(assert (=> b!556817 (= e!320761 (seekKeyOrZeroReturnVacant!0 (x!52315 lt!252929) (index!23413 lt!252929) (index!23413 lt!252929) k0!1914 a!3118 mask!3119))))

(declare-fun b!556818 () Bool)

(assert (=> b!556818 (= e!320761 (MissingZero!5296 (index!23413 lt!252929)))))

(declare-fun b!556819 () Bool)

(declare-fun c!64183 () Bool)

(declare-fun lt!252928 () (_ BitVec 64))

(assert (=> b!556819 (= c!64183 (= lt!252928 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!320760 () SeekEntryResult!5296)

(assert (=> b!556819 (= e!320760 e!320761)))

(declare-fun b!556820 () Bool)

(declare-fun e!320762 () SeekEntryResult!5296)

(assert (=> b!556820 (= e!320762 e!320760)))

(assert (=> b!556820 (= lt!252928 (select (arr!16850 a!3118) (index!23413 lt!252929)))))

(declare-fun c!64185 () Bool)

(assert (=> b!556820 (= c!64185 (= lt!252928 k0!1914))))

(declare-fun d!83189 () Bool)

(declare-fun lt!252927 () SeekEntryResult!5296)

(assert (=> d!83189 (and (or ((_ is Undefined!5296) lt!252927) (not ((_ is Found!5296) lt!252927)) (and (bvsge (index!23412 lt!252927) #b00000000000000000000000000000000) (bvslt (index!23412 lt!252927) (size!17215 a!3118)))) (or ((_ is Undefined!5296) lt!252927) ((_ is Found!5296) lt!252927) (not ((_ is MissingZero!5296) lt!252927)) (and (bvsge (index!23411 lt!252927) #b00000000000000000000000000000000) (bvslt (index!23411 lt!252927) (size!17215 a!3118)))) (or ((_ is Undefined!5296) lt!252927) ((_ is Found!5296) lt!252927) ((_ is MissingZero!5296) lt!252927) (not ((_ is MissingVacant!5296) lt!252927)) (and (bvsge (index!23414 lt!252927) #b00000000000000000000000000000000) (bvslt (index!23414 lt!252927) (size!17215 a!3118)))) (or ((_ is Undefined!5296) lt!252927) (ite ((_ is Found!5296) lt!252927) (= (select (arr!16850 a!3118) (index!23412 lt!252927)) k0!1914) (ite ((_ is MissingZero!5296) lt!252927) (= (select (arr!16850 a!3118) (index!23411 lt!252927)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5296) lt!252927) (= (select (arr!16850 a!3118) (index!23414 lt!252927)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83189 (= lt!252927 e!320762)))

(declare-fun c!64184 () Bool)

(assert (=> d!83189 (= c!64184 (and ((_ is Intermediate!5296) lt!252929) (undefined!6108 lt!252929)))))

(assert (=> d!83189 (= lt!252929 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83189 (validMask!0 mask!3119)))

(assert (=> d!83189 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!252927)))

(declare-fun b!556821 () Bool)

(assert (=> b!556821 (= e!320762 Undefined!5296)))

(declare-fun b!556822 () Bool)

(assert (=> b!556822 (= e!320760 (Found!5296 (index!23413 lt!252929)))))

(assert (= (and d!83189 c!64184) b!556821))

(assert (= (and d!83189 (not c!64184)) b!556820))

(assert (= (and b!556820 c!64185) b!556822))

(assert (= (and b!556820 (not c!64185)) b!556819))

(assert (= (and b!556819 c!64183) b!556818))

(assert (= (and b!556819 (not c!64183)) b!556817))

(declare-fun m!534285 () Bool)

(assert (=> b!556817 m!534285))

(declare-fun m!534287 () Bool)

(assert (=> b!556820 m!534287))

(declare-fun m!534289 () Bool)

(assert (=> d!83189 m!534289))

(declare-fun m!534291 () Bool)

(assert (=> d!83189 m!534291))

(assert (=> d!83189 m!534143))

(declare-fun m!534293 () Bool)

(assert (=> d!83189 m!534293))

(assert (=> d!83189 m!534289))

(declare-fun m!534295 () Bool)

(assert (=> d!83189 m!534295))

(declare-fun m!534297 () Bool)

(assert (=> d!83189 m!534297))

(assert (=> b!556670 d!83189))

(declare-fun b!556855 () Bool)

(declare-fun e!320785 () Bool)

(declare-fun e!320786 () Bool)

(assert (=> b!556855 (= e!320785 e!320786)))

(declare-fun c!64197 () Bool)

(assert (=> b!556855 (= c!64197 (validKeyInArray!0 (select (arr!16850 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32329 () Bool)

(declare-fun call!32332 () Bool)

(assert (=> bm!32329 (= call!32332 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!556856 () Bool)

(declare-fun e!320784 () Bool)

(assert (=> b!556856 (= e!320786 e!320784)))

(declare-fun lt!252953 () (_ BitVec 64))

(assert (=> b!556856 (= lt!252953 (select (arr!16850 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!252951 () Unit!17352)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35083 (_ BitVec 64) (_ BitVec 32)) Unit!17352)

(assert (=> b!556856 (= lt!252951 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!252953 #b00000000000000000000000000000000))))

(assert (=> b!556856 (arrayContainsKey!0 a!3118 lt!252953 #b00000000000000000000000000000000)))

(declare-fun lt!252952 () Unit!17352)

(assert (=> b!556856 (= lt!252952 lt!252951)))

(declare-fun res!349139 () Bool)

(assert (=> b!556856 (= res!349139 (= (seekEntryOrOpen!0 (select (arr!16850 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5296 #b00000000000000000000000000000000)))))

(assert (=> b!556856 (=> (not res!349139) (not e!320784))))

(declare-fun d!83191 () Bool)

(declare-fun res!349140 () Bool)

(assert (=> d!83191 (=> res!349140 e!320785)))

(assert (=> d!83191 (= res!349140 (bvsge #b00000000000000000000000000000000 (size!17215 a!3118)))))

(assert (=> d!83191 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!320785)))

(declare-fun b!556857 () Bool)

(assert (=> b!556857 (= e!320784 call!32332)))

(declare-fun b!556858 () Bool)

(assert (=> b!556858 (= e!320786 call!32332)))

(assert (= (and d!83191 (not res!349140)) b!556855))

(assert (= (and b!556855 c!64197) b!556856))

(assert (= (and b!556855 (not c!64197)) b!556858))

(assert (= (and b!556856 res!349139) b!556857))

(assert (= (or b!556857 b!556858) bm!32329))

(assert (=> b!556855 m!534239))

(assert (=> b!556855 m!534239))

(declare-fun m!534311 () Bool)

(assert (=> b!556855 m!534311))

(declare-fun m!534313 () Bool)

(assert (=> bm!32329 m!534313))

(assert (=> b!556856 m!534239))

(declare-fun m!534315 () Bool)

(assert (=> b!556856 m!534315))

(declare-fun m!534317 () Bool)

(assert (=> b!556856 m!534317))

(assert (=> b!556856 m!534239))

(declare-fun m!534319 () Bool)

(assert (=> b!556856 m!534319))

(assert (=> b!556671 d!83191))

(declare-fun d!83195 () Bool)

(assert (=> d!83195 (= (validKeyInArray!0 (select (arr!16850 a!3118) j!142)) (and (not (= (select (arr!16850 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16850 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!556676 d!83195))

(declare-fun d!83197 () Bool)

(declare-fun res!349157 () Bool)

(declare-fun e!320810 () Bool)

(assert (=> d!83197 (=> res!349157 e!320810)))

(assert (=> d!83197 (= res!349157 (bvsge #b00000000000000000000000000000000 (size!17215 a!3118)))))

(assert (=> d!83197 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10966) e!320810)))

(declare-fun b!556885 () Bool)

(declare-fun e!320808 () Bool)

(declare-fun e!320809 () Bool)

(assert (=> b!556885 (= e!320808 e!320809)))

(declare-fun c!64204 () Bool)

(assert (=> b!556885 (= c!64204 (validKeyInArray!0 (select (arr!16850 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!556886 () Bool)

(declare-fun call!32336 () Bool)

(assert (=> b!556886 (= e!320809 call!32336)))

(declare-fun bm!32333 () Bool)

(assert (=> bm!32333 (= call!32336 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64204 (Cons!10965 (select (arr!16850 a!3118) #b00000000000000000000000000000000) Nil!10966) Nil!10966)))))

(declare-fun b!556887 () Bool)

(declare-fun e!320807 () Bool)

(declare-fun contains!2829 (List!10969 (_ BitVec 64)) Bool)

(assert (=> b!556887 (= e!320807 (contains!2829 Nil!10966 (select (arr!16850 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!556888 () Bool)

(assert (=> b!556888 (= e!320809 call!32336)))

(declare-fun b!556889 () Bool)

(assert (=> b!556889 (= e!320810 e!320808)))

(declare-fun res!349156 () Bool)

(assert (=> b!556889 (=> (not res!349156) (not e!320808))))

(assert (=> b!556889 (= res!349156 (not e!320807))))

(declare-fun res!349155 () Bool)

(assert (=> b!556889 (=> (not res!349155) (not e!320807))))

(assert (=> b!556889 (= res!349155 (validKeyInArray!0 (select (arr!16850 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83197 (not res!349157)) b!556889))

(assert (= (and b!556889 res!349155) b!556887))

(assert (= (and b!556889 res!349156) b!556885))

(assert (= (and b!556885 c!64204) b!556888))

(assert (= (and b!556885 (not c!64204)) b!556886))

(assert (= (or b!556888 b!556886) bm!32333))

(assert (=> b!556885 m!534239))

(assert (=> b!556885 m!534239))

(assert (=> b!556885 m!534311))

(assert (=> bm!32333 m!534239))

(declare-fun m!534343 () Bool)

(assert (=> bm!32333 m!534343))

(assert (=> b!556887 m!534239))

(assert (=> b!556887 m!534239))

(declare-fun m!534345 () Bool)

(assert (=> b!556887 m!534345))

(assert (=> b!556889 m!534239))

(assert (=> b!556889 m!534239))

(assert (=> b!556889 m!534311))

(assert (=> b!556677 d!83197))

(declare-fun b!556890 () Bool)

(declare-fun e!320812 () Bool)

(declare-fun e!320813 () Bool)

(assert (=> b!556890 (= e!320812 e!320813)))

(declare-fun c!64205 () Bool)

(assert (=> b!556890 (= c!64205 (validKeyInArray!0 (select (arr!16850 a!3118) j!142)))))

(declare-fun call!32337 () Bool)

(declare-fun bm!32334 () Bool)

(assert (=> bm!32334 (= call!32337 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!556891 () Bool)

(declare-fun e!320811 () Bool)

(assert (=> b!556891 (= e!320813 e!320811)))

(declare-fun lt!252962 () (_ BitVec 64))

(assert (=> b!556891 (= lt!252962 (select (arr!16850 a!3118) j!142))))

(declare-fun lt!252960 () Unit!17352)

(assert (=> b!556891 (= lt!252960 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!252962 j!142))))

(assert (=> b!556891 (arrayContainsKey!0 a!3118 lt!252962 #b00000000000000000000000000000000)))

(declare-fun lt!252961 () Unit!17352)

(assert (=> b!556891 (= lt!252961 lt!252960)))

(declare-fun res!349158 () Bool)

(assert (=> b!556891 (= res!349158 (= (seekEntryOrOpen!0 (select (arr!16850 a!3118) j!142) a!3118 mask!3119) (Found!5296 j!142)))))

(assert (=> b!556891 (=> (not res!349158) (not e!320811))))

(declare-fun d!83209 () Bool)

(declare-fun res!349159 () Bool)

(assert (=> d!83209 (=> res!349159 e!320812)))

(assert (=> d!83209 (= res!349159 (bvsge j!142 (size!17215 a!3118)))))

(assert (=> d!83209 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!320812)))

(declare-fun b!556892 () Bool)

(assert (=> b!556892 (= e!320811 call!32337)))

(declare-fun b!556893 () Bool)

(assert (=> b!556893 (= e!320813 call!32337)))

(assert (= (and d!83209 (not res!349159)) b!556890))

(assert (= (and b!556890 c!64205) b!556891))

(assert (= (and b!556890 (not c!64205)) b!556893))

(assert (= (and b!556891 res!349158) b!556892))

(assert (= (or b!556892 b!556893) bm!32334))

(assert (=> b!556890 m!534127))

(assert (=> b!556890 m!534127))

(assert (=> b!556890 m!534161))

(declare-fun m!534347 () Bool)

(assert (=> bm!32334 m!534347))

(assert (=> b!556891 m!534127))

(declare-fun m!534349 () Bool)

(assert (=> b!556891 m!534349))

(declare-fun m!534351 () Bool)

(assert (=> b!556891 m!534351))

(assert (=> b!556891 m!534127))

(assert (=> b!556891 m!534149))

(assert (=> b!556672 d!83209))

(declare-fun d!83211 () Bool)

(assert (=> d!83211 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!252968 () Unit!17352)

(declare-fun choose!38 (array!35083 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17352)

(assert (=> d!83211 (= lt!252968 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83211 (validMask!0 mask!3119)))

(assert (=> d!83211 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!252968)))

(declare-fun bs!17318 () Bool)

(assert (= bs!17318 d!83211))

(assert (=> bs!17318 m!534153))

(declare-fun m!534355 () Bool)

(assert (=> bs!17318 m!534355))

(assert (=> bs!17318 m!534143))

(assert (=> b!556672 d!83211))

(declare-fun d!83219 () Bool)

(assert (=> d!83219 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!556678 d!83219))

(declare-fun d!83221 () Bool)

(assert (=> d!83221 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50906 d!83221))

(declare-fun d!83225 () Bool)

(assert (=> d!83225 (= (array_inv!12733 a!3118) (bvsge (size!17215 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50906 d!83225))

(check-sat (not b!556769) (not d!83189) (not d!83177) (not bm!32334) (not b!556885) (not b!556744) (not b!556889) (not b!556856) (not bm!32329) (not bm!32333) (not b!556891) (not d!83211) (not d!83183) (not d!83173) (not b!556890) (not b!556887) (not b!556778) (not b!556855) (not b!556817) (not b!556811))
(check-sat)
