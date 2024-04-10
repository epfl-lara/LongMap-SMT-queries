; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51464 () Bool)

(assert start!51464)

(declare-fun b!562710 () Bool)

(declare-fun res!353872 () Bool)

(declare-fun e!324297 () Bool)

(assert (=> b!562710 (=> (not res!353872) (not e!324297))))

(declare-datatypes ((array!35329 0))(
  ( (array!35330 (arr!16965 (Array (_ BitVec 32) (_ BitVec 64))) (size!17329 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35329)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562710 (= res!353872 (validKeyInArray!0 (select (arr!16965 a!3118) j!142)))))

(declare-fun b!562711 () Bool)

(declare-fun e!324291 () Bool)

(assert (=> b!562711 (= e!324291 true)))

(declare-datatypes ((SeekEntryResult!5414 0))(
  ( (MissingZero!5414 (index!23883 (_ BitVec 32))) (Found!5414 (index!23884 (_ BitVec 32))) (Intermediate!5414 (undefined!6226 Bool) (index!23885 (_ BitVec 32)) (x!52781 (_ BitVec 32))) (Undefined!5414) (MissingVacant!5414 (index!23886 (_ BitVec 32))) )
))
(declare-fun lt!256557 () SeekEntryResult!5414)

(declare-fun lt!256559 () SeekEntryResult!5414)

(assert (=> b!562711 (= lt!256557 lt!256559)))

(declare-datatypes ((Unit!17602 0))(
  ( (Unit!17603) )
))
(declare-fun lt!256566 () Unit!17602)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!256562 () SeekEntryResult!5414)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17602)

(assert (=> b!562711 (= lt!256566 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!52781 lt!256562) (index!23885 lt!256562) (index!23885 lt!256562) mask!3119))))

(declare-fun b!562712 () Bool)

(declare-fun res!353867 () Bool)

(declare-fun e!324293 () Bool)

(assert (=> b!562712 (=> (not res!353867) (not e!324293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35329 (_ BitVec 32)) Bool)

(assert (=> b!562712 (= res!353867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562713 () Bool)

(declare-fun e!324296 () Bool)

(assert (=> b!562713 (= e!324296 e!324291)))

(declare-fun res!353866 () Bool)

(assert (=> b!562713 (=> res!353866 e!324291)))

(declare-fun lt!256567 () (_ BitVec 64))

(declare-fun lt!256558 () SeekEntryResult!5414)

(assert (=> b!562713 (= res!353866 (or (bvslt (index!23885 lt!256562) #b00000000000000000000000000000000) (bvsge (index!23885 lt!256562) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52781 lt!256562) #b01111111111111111111111111111110) (bvslt (x!52781 lt!256562) #b00000000000000000000000000000000) (not (= lt!256567 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16965 a!3118) i!1132 k!1914) (index!23885 lt!256562)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256557 lt!256558))))))

(declare-fun lt!256565 () SeekEntryResult!5414)

(assert (=> b!562713 (= lt!256565 lt!256559)))

(declare-fun lt!256564 () array!35329)

(declare-fun lt!256561 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35329 (_ BitVec 32)) SeekEntryResult!5414)

(assert (=> b!562713 (= lt!256559 (seekKeyOrZeroReturnVacant!0 (x!52781 lt!256562) (index!23885 lt!256562) (index!23885 lt!256562) lt!256561 lt!256564 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35329 (_ BitVec 32)) SeekEntryResult!5414)

(assert (=> b!562713 (= lt!256565 (seekEntryOrOpen!0 lt!256561 lt!256564 mask!3119))))

(declare-fun lt!256560 () SeekEntryResult!5414)

(assert (=> b!562713 (= lt!256560 lt!256557)))

(assert (=> b!562713 (= lt!256557 (seekKeyOrZeroReturnVacant!0 (x!52781 lt!256562) (index!23885 lt!256562) (index!23885 lt!256562) (select (arr!16965 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562714 () Bool)

(declare-fun res!353862 () Bool)

(assert (=> b!562714 (=> (not res!353862) (not e!324297))))

(declare-fun arrayContainsKey!0 (array!35329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562714 (= res!353862 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562715 () Bool)

(assert (=> b!562715 (= e!324297 e!324293)))

(declare-fun res!353865 () Bool)

(assert (=> b!562715 (=> (not res!353865) (not e!324293))))

(declare-fun lt!256563 () SeekEntryResult!5414)

(assert (=> b!562715 (= res!353865 (or (= lt!256563 (MissingZero!5414 i!1132)) (= lt!256563 (MissingVacant!5414 i!1132))))))

(assert (=> b!562715 (= lt!256563 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!562716 () Bool)

(declare-fun e!324295 () Bool)

(declare-fun e!324294 () Bool)

(assert (=> b!562716 (= e!324295 (not e!324294))))

(declare-fun res!353863 () Bool)

(assert (=> b!562716 (=> res!353863 e!324294)))

(assert (=> b!562716 (= res!353863 (or (undefined!6226 lt!256562) (not (is-Intermediate!5414 lt!256562))))))

(assert (=> b!562716 (= lt!256560 lt!256558)))

(assert (=> b!562716 (= lt!256558 (Found!5414 j!142))))

(assert (=> b!562716 (= lt!256560 (seekEntryOrOpen!0 (select (arr!16965 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!562716 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!256554 () Unit!17602)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17602)

(assert (=> b!562716 (= lt!256554 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562717 () Bool)

(declare-fun res!353864 () Bool)

(assert (=> b!562717 (=> (not res!353864) (not e!324297))))

(assert (=> b!562717 (= res!353864 (and (= (size!17329 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17329 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17329 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!353868 () Bool)

(assert (=> start!51464 (=> (not res!353868) (not e!324297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51464 (= res!353868 (validMask!0 mask!3119))))

(assert (=> start!51464 e!324297))

(assert (=> start!51464 true))

(declare-fun array_inv!12761 (array!35329) Bool)

(assert (=> start!51464 (array_inv!12761 a!3118)))

(declare-fun b!562718 () Bool)

(assert (=> b!562718 (= e!324293 e!324295)))

(declare-fun res!353873 () Bool)

(assert (=> b!562718 (=> (not res!353873) (not e!324295))))

(declare-fun lt!256556 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35329 (_ BitVec 32)) SeekEntryResult!5414)

(assert (=> b!562718 (= res!353873 (= lt!256562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256556 lt!256561 lt!256564 mask!3119)))))

(declare-fun lt!256555 () (_ BitVec 32))

(assert (=> b!562718 (= lt!256562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256555 (select (arr!16965 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562718 (= lt!256556 (toIndex!0 lt!256561 mask!3119))))

(assert (=> b!562718 (= lt!256561 (select (store (arr!16965 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562718 (= lt!256555 (toIndex!0 (select (arr!16965 a!3118) j!142) mask!3119))))

(assert (=> b!562718 (= lt!256564 (array!35330 (store (arr!16965 a!3118) i!1132 k!1914) (size!17329 a!3118)))))

(declare-fun b!562719 () Bool)

(declare-fun res!353869 () Bool)

(assert (=> b!562719 (=> (not res!353869) (not e!324297))))

(assert (=> b!562719 (= res!353869 (validKeyInArray!0 k!1914))))

(declare-fun b!562720 () Bool)

(assert (=> b!562720 (= e!324294 e!324296)))

(declare-fun res!353871 () Bool)

(assert (=> b!562720 (=> res!353871 e!324296)))

(assert (=> b!562720 (= res!353871 (or (= lt!256567 (select (arr!16965 a!3118) j!142)) (= lt!256567 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562720 (= lt!256567 (select (arr!16965 a!3118) (index!23885 lt!256562)))))

(declare-fun b!562721 () Bool)

(declare-fun res!353870 () Bool)

(assert (=> b!562721 (=> (not res!353870) (not e!324293))))

(declare-datatypes ((List!11045 0))(
  ( (Nil!11042) (Cons!11041 (h!12044 (_ BitVec 64)) (t!17273 List!11045)) )
))
(declare-fun arrayNoDuplicates!0 (array!35329 (_ BitVec 32) List!11045) Bool)

(assert (=> b!562721 (= res!353870 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11042))))

(assert (= (and start!51464 res!353868) b!562717))

(assert (= (and b!562717 res!353864) b!562710))

(assert (= (and b!562710 res!353872) b!562719))

(assert (= (and b!562719 res!353869) b!562714))

(assert (= (and b!562714 res!353862) b!562715))

(assert (= (and b!562715 res!353865) b!562712))

(assert (= (and b!562712 res!353867) b!562721))

(assert (= (and b!562721 res!353870) b!562718))

(assert (= (and b!562718 res!353873) b!562716))

(assert (= (and b!562716 (not res!353863)) b!562720))

(assert (= (and b!562720 (not res!353871)) b!562713))

(assert (= (and b!562713 (not res!353866)) b!562711))

(declare-fun m!540837 () Bool)

(assert (=> b!562714 m!540837))

(declare-fun m!540839 () Bool)

(assert (=> b!562711 m!540839))

(declare-fun m!540841 () Bool)

(assert (=> b!562721 m!540841))

(declare-fun m!540843 () Bool)

(assert (=> b!562716 m!540843))

(assert (=> b!562716 m!540843))

(declare-fun m!540845 () Bool)

(assert (=> b!562716 m!540845))

(declare-fun m!540847 () Bool)

(assert (=> b!562716 m!540847))

(declare-fun m!540849 () Bool)

(assert (=> b!562716 m!540849))

(declare-fun m!540851 () Bool)

(assert (=> b!562719 m!540851))

(assert (=> b!562718 m!540843))

(declare-fun m!540853 () Bool)

(assert (=> b!562718 m!540853))

(declare-fun m!540855 () Bool)

(assert (=> b!562718 m!540855))

(assert (=> b!562718 m!540843))

(declare-fun m!540857 () Bool)

(assert (=> b!562718 m!540857))

(assert (=> b!562718 m!540843))

(declare-fun m!540859 () Bool)

(assert (=> b!562718 m!540859))

(declare-fun m!540861 () Bool)

(assert (=> b!562718 m!540861))

(declare-fun m!540863 () Bool)

(assert (=> b!562718 m!540863))

(assert (=> b!562710 m!540843))

(assert (=> b!562710 m!540843))

(declare-fun m!540865 () Bool)

(assert (=> b!562710 m!540865))

(declare-fun m!540867 () Bool)

(assert (=> b!562713 m!540867))

(assert (=> b!562713 m!540843))

(declare-fun m!540869 () Bool)

(assert (=> b!562713 m!540869))

(assert (=> b!562713 m!540859))

(assert (=> b!562713 m!540843))

(declare-fun m!540871 () Bool)

(assert (=> b!562713 m!540871))

(declare-fun m!540873 () Bool)

(assert (=> b!562713 m!540873))

(declare-fun m!540875 () Bool)

(assert (=> start!51464 m!540875))

(declare-fun m!540877 () Bool)

(assert (=> start!51464 m!540877))

(declare-fun m!540879 () Bool)

(assert (=> b!562712 m!540879))

(declare-fun m!540881 () Bool)

(assert (=> b!562715 m!540881))

(assert (=> b!562720 m!540843))

(declare-fun m!540883 () Bool)

(assert (=> b!562720 m!540883))

(push 1)

