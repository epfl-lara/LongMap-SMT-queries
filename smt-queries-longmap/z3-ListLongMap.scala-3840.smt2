; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52792 () Bool)

(assert start!52792)

(declare-fun res!364160 () Bool)

(declare-fun e!331269 () Bool)

(assert (=> start!52792 (=> (not res!364160) (not e!331269))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52792 (= res!364160 (validMask!0 mask!3119))))

(assert (=> start!52792 e!331269))

(assert (=> start!52792 true))

(declare-datatypes ((array!35937 0))(
  ( (array!35938 (arr!17251 (Array (_ BitVec 32) (_ BitVec 64))) (size!17615 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35937)

(declare-fun array_inv!13047 (array!35937) Bool)

(assert (=> start!52792 (array_inv!13047 a!3118)))

(declare-fun b!575733 () Bool)

(declare-fun res!364150 () Bool)

(declare-fun e!331270 () Bool)

(assert (=> b!575733 (=> (not res!364150) (not e!331270))))

(declare-datatypes ((List!11331 0))(
  ( (Nil!11328) (Cons!11327 (h!12366 (_ BitVec 64)) (t!17559 List!11331)) )
))
(declare-fun arrayNoDuplicates!0 (array!35937 (_ BitVec 32) List!11331) Bool)

(assert (=> b!575733 (= res!364150 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11328))))

(declare-fun b!575734 () Bool)

(declare-fun res!364157 () Bool)

(assert (=> b!575734 (=> (not res!364157) (not e!331269))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575734 (= res!364157 (validKeyInArray!0 (select (arr!17251 a!3118) j!142)))))

(declare-fun b!575735 () Bool)

(declare-fun e!331275 () Bool)

(declare-fun e!331271 () Bool)

(assert (=> b!575735 (= e!331275 (not e!331271))))

(declare-fun res!364149 () Bool)

(assert (=> b!575735 (=> res!364149 e!331271)))

(declare-datatypes ((SeekEntryResult!5700 0))(
  ( (MissingZero!5700 (index!25027 (_ BitVec 32))) (Found!5700 (index!25028 (_ BitVec 32))) (Intermediate!5700 (undefined!6512 Bool) (index!25029 (_ BitVec 32)) (x!53917 (_ BitVec 32))) (Undefined!5700) (MissingVacant!5700 (index!25030 (_ BitVec 32))) )
))
(declare-fun lt!263369 () SeekEntryResult!5700)

(get-info :version)

(assert (=> b!575735 (= res!364149 (or (undefined!6512 lt!263369) (not ((_ is Intermediate!5700) lt!263369))))))

(declare-fun lt!263376 () SeekEntryResult!5700)

(declare-fun lt!263374 () SeekEntryResult!5700)

(assert (=> b!575735 (= lt!263376 lt!263374)))

(assert (=> b!575735 (= lt!263374 (Found!5700 j!142))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35937 (_ BitVec 32)) SeekEntryResult!5700)

(assert (=> b!575735 (= lt!263376 (seekEntryOrOpen!0 (select (arr!17251 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35937 (_ BitVec 32)) Bool)

(assert (=> b!575735 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18102 0))(
  ( (Unit!18103) )
))
(declare-fun lt!263370 () Unit!18102)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35937 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18102)

(assert (=> b!575735 (= lt!263370 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575736 () Bool)

(declare-fun e!331274 () Bool)

(assert (=> b!575736 (= e!331271 e!331274)))

(declare-fun res!364153 () Bool)

(assert (=> b!575736 (=> res!364153 e!331274)))

(declare-fun lt!263379 () (_ BitVec 64))

(assert (=> b!575736 (= res!364153 (or (= lt!263379 (select (arr!17251 a!3118) j!142)) (= lt!263379 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575736 (= lt!263379 (select (arr!17251 a!3118) (index!25029 lt!263369)))))

(declare-fun b!575737 () Bool)

(declare-fun e!331273 () Bool)

(assert (=> b!575737 (= e!331274 e!331273)))

(declare-fun res!364158 () Bool)

(assert (=> b!575737 (=> res!364158 e!331273)))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!263378 () SeekEntryResult!5700)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!575737 (= res!364158 (or (bvslt (index!25029 lt!263369) #b00000000000000000000000000000000) (bvsge (index!25029 lt!263369) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53917 lt!263369) #b01111111111111111111111111111110) (bvslt (x!53917 lt!263369) #b00000000000000000000000000000000) (not (= lt!263379 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17251 a!3118) i!1132 k0!1914) (index!25029 lt!263369)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263378 lt!263374))))))

(declare-fun lt!263371 () SeekEntryResult!5700)

(declare-fun lt!263372 () SeekEntryResult!5700)

(assert (=> b!575737 (= lt!263371 lt!263372)))

(declare-fun lt!263367 () array!35937)

(declare-fun lt!263373 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35937 (_ BitVec 32)) SeekEntryResult!5700)

(assert (=> b!575737 (= lt!263372 (seekKeyOrZeroReturnVacant!0 (x!53917 lt!263369) (index!25029 lt!263369) (index!25029 lt!263369) lt!263373 lt!263367 mask!3119))))

(assert (=> b!575737 (= lt!263371 (seekEntryOrOpen!0 lt!263373 lt!263367 mask!3119))))

(assert (=> b!575737 (= lt!263376 lt!263378)))

(assert (=> b!575737 (= lt!263378 (seekKeyOrZeroReturnVacant!0 (x!53917 lt!263369) (index!25029 lt!263369) (index!25029 lt!263369) (select (arr!17251 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575738 () Bool)

(declare-fun res!364154 () Bool)

(assert (=> b!575738 (=> (not res!364154) (not e!331270))))

(assert (=> b!575738 (= res!364154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575739 () Bool)

(assert (=> b!575739 (= e!331270 e!331275)))

(declare-fun res!364151 () Bool)

(assert (=> b!575739 (=> (not res!364151) (not e!331275))))

(declare-fun lt!263380 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35937 (_ BitVec 32)) SeekEntryResult!5700)

(assert (=> b!575739 (= res!364151 (= lt!263369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263380 lt!263373 lt!263367 mask!3119)))))

(declare-fun lt!263377 () (_ BitVec 32))

(assert (=> b!575739 (= lt!263369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263377 (select (arr!17251 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575739 (= lt!263380 (toIndex!0 lt!263373 mask!3119))))

(assert (=> b!575739 (= lt!263373 (select (store (arr!17251 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!575739 (= lt!263377 (toIndex!0 (select (arr!17251 a!3118) j!142) mask!3119))))

(assert (=> b!575739 (= lt!263367 (array!35938 (store (arr!17251 a!3118) i!1132 k0!1914) (size!17615 a!3118)))))

(declare-fun b!575740 () Bool)

(declare-fun res!364156 () Bool)

(assert (=> b!575740 (=> (not res!364156) (not e!331269))))

(assert (=> b!575740 (= res!364156 (and (= (size!17615 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17615 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17615 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575741 () Bool)

(declare-fun res!364155 () Bool)

(assert (=> b!575741 (=> (not res!364155) (not e!331269))))

(assert (=> b!575741 (= res!364155 (validKeyInArray!0 k0!1914))))

(declare-fun b!575742 () Bool)

(assert (=> b!575742 (= e!331269 e!331270)))

(declare-fun res!364159 () Bool)

(assert (=> b!575742 (=> (not res!364159) (not e!331270))))

(declare-fun lt!263368 () SeekEntryResult!5700)

(assert (=> b!575742 (= res!364159 (or (= lt!263368 (MissingZero!5700 i!1132)) (= lt!263368 (MissingVacant!5700 i!1132))))))

(assert (=> b!575742 (= lt!263368 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!575743 () Bool)

(declare-fun res!364152 () Bool)

(assert (=> b!575743 (=> (not res!364152) (not e!331269))))

(declare-fun arrayContainsKey!0 (array!35937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575743 (= res!364152 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575744 () Bool)

(assert (=> b!575744 (= e!331273 (= lt!263376 lt!263371))))

(assert (=> b!575744 (= lt!263378 lt!263372)))

(declare-fun lt!263375 () Unit!18102)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18102)

(assert (=> b!575744 (= lt!263375 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!53917 lt!263369) (index!25029 lt!263369) (index!25029 lt!263369) mask!3119))))

(assert (= (and start!52792 res!364160) b!575740))

(assert (= (and b!575740 res!364156) b!575734))

(assert (= (and b!575734 res!364157) b!575741))

(assert (= (and b!575741 res!364155) b!575743))

(assert (= (and b!575743 res!364152) b!575742))

(assert (= (and b!575742 res!364159) b!575738))

(assert (= (and b!575738 res!364154) b!575733))

(assert (= (and b!575733 res!364150) b!575739))

(assert (= (and b!575739 res!364151) b!575735))

(assert (= (and b!575735 (not res!364149)) b!575736))

(assert (= (and b!575736 (not res!364153)) b!575737))

(assert (= (and b!575737 (not res!364158)) b!575744))

(declare-fun m!554685 () Bool)

(assert (=> b!575737 m!554685))

(declare-fun m!554687 () Bool)

(assert (=> b!575737 m!554687))

(declare-fun m!554689 () Bool)

(assert (=> b!575737 m!554689))

(declare-fun m!554691 () Bool)

(assert (=> b!575737 m!554691))

(assert (=> b!575737 m!554685))

(declare-fun m!554693 () Bool)

(assert (=> b!575737 m!554693))

(declare-fun m!554695 () Bool)

(assert (=> b!575737 m!554695))

(declare-fun m!554697 () Bool)

(assert (=> start!52792 m!554697))

(declare-fun m!554699 () Bool)

(assert (=> start!52792 m!554699))

(declare-fun m!554701 () Bool)

(assert (=> b!575744 m!554701))

(declare-fun m!554703 () Bool)

(assert (=> b!575743 m!554703))

(assert (=> b!575735 m!554685))

(assert (=> b!575735 m!554685))

(declare-fun m!554705 () Bool)

(assert (=> b!575735 m!554705))

(declare-fun m!554707 () Bool)

(assert (=> b!575735 m!554707))

(declare-fun m!554709 () Bool)

(assert (=> b!575735 m!554709))

(assert (=> b!575736 m!554685))

(declare-fun m!554711 () Bool)

(assert (=> b!575736 m!554711))

(declare-fun m!554713 () Bool)

(assert (=> b!575738 m!554713))

(declare-fun m!554715 () Bool)

(assert (=> b!575742 m!554715))

(declare-fun m!554717 () Bool)

(assert (=> b!575733 m!554717))

(assert (=> b!575739 m!554685))

(declare-fun m!554719 () Bool)

(assert (=> b!575739 m!554719))

(assert (=> b!575739 m!554685))

(declare-fun m!554721 () Bool)

(assert (=> b!575739 m!554721))

(declare-fun m!554723 () Bool)

(assert (=> b!575739 m!554723))

(assert (=> b!575739 m!554685))

(declare-fun m!554725 () Bool)

(assert (=> b!575739 m!554725))

(assert (=> b!575739 m!554689))

(declare-fun m!554727 () Bool)

(assert (=> b!575739 m!554727))

(assert (=> b!575734 m!554685))

(assert (=> b!575734 m!554685))

(declare-fun m!554729 () Bool)

(assert (=> b!575734 m!554729))

(declare-fun m!554731 () Bool)

(assert (=> b!575741 m!554731))

(check-sat (not b!575743) (not b!575734) (not b!575741) (not b!575737) (not b!575738) (not start!52792) (not b!575739) (not b!575735) (not b!575742) (not b!575744) (not b!575733))
(check-sat)
