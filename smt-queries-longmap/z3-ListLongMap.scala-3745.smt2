; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51466 () Bool)

(assert start!51466)

(declare-fun b!562746 () Bool)

(declare-fun e!324313 () Bool)

(declare-fun e!324316 () Bool)

(assert (=> b!562746 (= e!324313 e!324316)))

(declare-fun res!353903 () Bool)

(assert (=> b!562746 (=> (not res!353903) (not e!324316))))

(declare-datatypes ((SeekEntryResult!5415 0))(
  ( (MissingZero!5415 (index!23887 (_ BitVec 32))) (Found!5415 (index!23888 (_ BitVec 32))) (Intermediate!5415 (undefined!6227 Bool) (index!23889 (_ BitVec 32)) (x!52782 (_ BitVec 32))) (Undefined!5415) (MissingVacant!5415 (index!23890 (_ BitVec 32))) )
))
(declare-fun lt!256606 () SeekEntryResult!5415)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562746 (= res!353903 (or (= lt!256606 (MissingZero!5415 i!1132)) (= lt!256606 (MissingVacant!5415 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35331 0))(
  ( (array!35332 (arr!16966 (Array (_ BitVec 32) (_ BitVec 64))) (size!17330 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35331)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35331 (_ BitVec 32)) SeekEntryResult!5415)

(assert (=> b!562746 (= lt!256606 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562747 () Bool)

(declare-fun e!324312 () Bool)

(assert (=> b!562747 (= e!324316 e!324312)))

(declare-fun res!353907 () Bool)

(assert (=> b!562747 (=> (not res!353907) (not e!324312))))

(declare-fun lt!256596 () array!35331)

(declare-fun lt!256600 () SeekEntryResult!5415)

(declare-fun lt!256607 () (_ BitVec 64))

(declare-fun lt!256598 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35331 (_ BitVec 32)) SeekEntryResult!5415)

(assert (=> b!562747 (= res!353907 (= lt!256600 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256598 lt!256607 lt!256596 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!256597 () (_ BitVec 32))

(assert (=> b!562747 (= lt!256600 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256597 (select (arr!16966 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562747 (= lt!256598 (toIndex!0 lt!256607 mask!3119))))

(assert (=> b!562747 (= lt!256607 (select (store (arr!16966 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562747 (= lt!256597 (toIndex!0 (select (arr!16966 a!3118) j!142) mask!3119))))

(assert (=> b!562747 (= lt!256596 (array!35332 (store (arr!16966 a!3118) i!1132 k0!1914) (size!17330 a!3118)))))

(declare-fun b!562748 () Bool)

(declare-fun res!353905 () Bool)

(assert (=> b!562748 (=> (not res!353905) (not e!324316))))

(declare-datatypes ((List!11046 0))(
  ( (Nil!11043) (Cons!11042 (h!12045 (_ BitVec 64)) (t!17274 List!11046)) )
))
(declare-fun arrayNoDuplicates!0 (array!35331 (_ BitVec 32) List!11046) Bool)

(assert (=> b!562748 (= res!353905 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11043))))

(declare-fun b!562749 () Bool)

(declare-fun res!353901 () Bool)

(assert (=> b!562749 (=> (not res!353901) (not e!324313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562749 (= res!353901 (validKeyInArray!0 (select (arr!16966 a!3118) j!142)))))

(declare-fun b!562750 () Bool)

(declare-fun e!324317 () Bool)

(declare-fun e!324318 () Bool)

(assert (=> b!562750 (= e!324317 e!324318)))

(declare-fun res!353906 () Bool)

(assert (=> b!562750 (=> res!353906 e!324318)))

(declare-fun lt!256604 () (_ BitVec 64))

(declare-fun lt!256602 () SeekEntryResult!5415)

(declare-fun lt!256601 () SeekEntryResult!5415)

(assert (=> b!562750 (= res!353906 (or (bvslt (index!23889 lt!256600) #b00000000000000000000000000000000) (bvsge (index!23889 lt!256600) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52782 lt!256600) #b01111111111111111111111111111110) (bvslt (x!52782 lt!256600) #b00000000000000000000000000000000) (not (= lt!256604 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16966 a!3118) i!1132 k0!1914) (index!23889 lt!256600)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256601 lt!256602))))))

(declare-fun lt!256609 () SeekEntryResult!5415)

(declare-fun lt!256603 () SeekEntryResult!5415)

(assert (=> b!562750 (= lt!256609 lt!256603)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35331 (_ BitVec 32)) SeekEntryResult!5415)

(assert (=> b!562750 (= lt!256603 (seekKeyOrZeroReturnVacant!0 (x!52782 lt!256600) (index!23889 lt!256600) (index!23889 lt!256600) lt!256607 lt!256596 mask!3119))))

(assert (=> b!562750 (= lt!256609 (seekEntryOrOpen!0 lt!256607 lt!256596 mask!3119))))

(declare-fun lt!256605 () SeekEntryResult!5415)

(assert (=> b!562750 (= lt!256605 lt!256601)))

(assert (=> b!562750 (= lt!256601 (seekKeyOrZeroReturnVacant!0 (x!52782 lt!256600) (index!23889 lt!256600) (index!23889 lt!256600) (select (arr!16966 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562751 () Bool)

(declare-fun res!353900 () Bool)

(assert (=> b!562751 (=> (not res!353900) (not e!324313))))

(declare-fun arrayContainsKey!0 (array!35331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562751 (= res!353900 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562752 () Bool)

(assert (=> b!562752 (= e!324318 true)))

(assert (=> b!562752 (= lt!256601 lt!256603)))

(declare-datatypes ((Unit!17604 0))(
  ( (Unit!17605) )
))
(declare-fun lt!256608 () Unit!17604)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35331 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17604)

(assert (=> b!562752 (= lt!256608 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52782 lt!256600) (index!23889 lt!256600) (index!23889 lt!256600) mask!3119))))

(declare-fun b!562753 () Bool)

(declare-fun res!353898 () Bool)

(assert (=> b!562753 (=> (not res!353898) (not e!324316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35331 (_ BitVec 32)) Bool)

(assert (=> b!562753 (= res!353898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!353908 () Bool)

(assert (=> start!51466 (=> (not res!353908) (not e!324313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51466 (= res!353908 (validMask!0 mask!3119))))

(assert (=> start!51466 e!324313))

(assert (=> start!51466 true))

(declare-fun array_inv!12762 (array!35331) Bool)

(assert (=> start!51466 (array_inv!12762 a!3118)))

(declare-fun b!562754 () Bool)

(declare-fun e!324314 () Bool)

(assert (=> b!562754 (= e!324312 (not e!324314))))

(declare-fun res!353899 () Bool)

(assert (=> b!562754 (=> res!353899 e!324314)))

(get-info :version)

(assert (=> b!562754 (= res!353899 (or (undefined!6227 lt!256600) (not ((_ is Intermediate!5415) lt!256600))))))

(assert (=> b!562754 (= lt!256605 lt!256602)))

(assert (=> b!562754 (= lt!256602 (Found!5415 j!142))))

(assert (=> b!562754 (= lt!256605 (seekEntryOrOpen!0 (select (arr!16966 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!562754 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!256599 () Unit!17604)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35331 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17604)

(assert (=> b!562754 (= lt!256599 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562755 () Bool)

(declare-fun res!353902 () Bool)

(assert (=> b!562755 (=> (not res!353902) (not e!324313))))

(assert (=> b!562755 (= res!353902 (validKeyInArray!0 k0!1914))))

(declare-fun b!562756 () Bool)

(assert (=> b!562756 (= e!324314 e!324317)))

(declare-fun res!353904 () Bool)

(assert (=> b!562756 (=> res!353904 e!324317)))

(assert (=> b!562756 (= res!353904 (or (= lt!256604 (select (arr!16966 a!3118) j!142)) (= lt!256604 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562756 (= lt!256604 (select (arr!16966 a!3118) (index!23889 lt!256600)))))

(declare-fun b!562757 () Bool)

(declare-fun res!353909 () Bool)

(assert (=> b!562757 (=> (not res!353909) (not e!324313))))

(assert (=> b!562757 (= res!353909 (and (= (size!17330 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17330 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17330 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51466 res!353908) b!562757))

(assert (= (and b!562757 res!353909) b!562749))

(assert (= (and b!562749 res!353901) b!562755))

(assert (= (and b!562755 res!353902) b!562751))

(assert (= (and b!562751 res!353900) b!562746))

(assert (= (and b!562746 res!353903) b!562753))

(assert (= (and b!562753 res!353898) b!562748))

(assert (= (and b!562748 res!353905) b!562747))

(assert (= (and b!562747 res!353907) b!562754))

(assert (= (and b!562754 (not res!353899)) b!562756))

(assert (= (and b!562756 (not res!353904)) b!562750))

(assert (= (and b!562750 (not res!353906)) b!562752))

(declare-fun m!540885 () Bool)

(assert (=> start!51466 m!540885))

(declare-fun m!540887 () Bool)

(assert (=> start!51466 m!540887))

(declare-fun m!540889 () Bool)

(assert (=> b!562752 m!540889))

(declare-fun m!540891 () Bool)

(assert (=> b!562754 m!540891))

(assert (=> b!562754 m!540891))

(declare-fun m!540893 () Bool)

(assert (=> b!562754 m!540893))

(declare-fun m!540895 () Bool)

(assert (=> b!562754 m!540895))

(declare-fun m!540897 () Bool)

(assert (=> b!562754 m!540897))

(declare-fun m!540899 () Bool)

(assert (=> b!562746 m!540899))

(declare-fun m!540901 () Bool)

(assert (=> b!562747 m!540901))

(assert (=> b!562747 m!540891))

(declare-fun m!540903 () Bool)

(assert (=> b!562747 m!540903))

(assert (=> b!562747 m!540891))

(declare-fun m!540905 () Bool)

(assert (=> b!562747 m!540905))

(declare-fun m!540907 () Bool)

(assert (=> b!562747 m!540907))

(declare-fun m!540909 () Bool)

(assert (=> b!562747 m!540909))

(assert (=> b!562747 m!540891))

(declare-fun m!540911 () Bool)

(assert (=> b!562747 m!540911))

(declare-fun m!540913 () Bool)

(assert (=> b!562753 m!540913))

(assert (=> b!562756 m!540891))

(declare-fun m!540915 () Bool)

(assert (=> b!562756 m!540915))

(declare-fun m!540917 () Bool)

(assert (=> b!562751 m!540917))

(declare-fun m!540919 () Bool)

(assert (=> b!562755 m!540919))

(assert (=> b!562749 m!540891))

(assert (=> b!562749 m!540891))

(declare-fun m!540921 () Bool)

(assert (=> b!562749 m!540921))

(declare-fun m!540923 () Bool)

(assert (=> b!562750 m!540923))

(assert (=> b!562750 m!540891))

(declare-fun m!540925 () Bool)

(assert (=> b!562750 m!540925))

(assert (=> b!562750 m!540891))

(declare-fun m!540927 () Bool)

(assert (=> b!562750 m!540927))

(assert (=> b!562750 m!540909))

(declare-fun m!540929 () Bool)

(assert (=> b!562750 m!540929))

(declare-fun m!540931 () Bool)

(assert (=> b!562748 m!540931))

(check-sat (not start!51466) (not b!562753) (not b!562750) (not b!562751) (not b!562752) (not b!562754) (not b!562755) (not b!562748) (not b!562746) (not b!562749) (not b!562747))
(check-sat)
