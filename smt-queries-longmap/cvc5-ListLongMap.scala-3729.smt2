; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51368 () Bool)

(assert start!51368)

(declare-fun b!560867 () Bool)

(declare-fun res!352025 () Bool)

(declare-fun e!323175 () Bool)

(assert (=> b!560867 (=> (not res!352025) (not e!323175))))

(declare-datatypes ((array!35233 0))(
  ( (array!35234 (arr!16917 (Array (_ BitVec 32) (_ BitVec 64))) (size!17281 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35233)

(declare-datatypes ((List!10997 0))(
  ( (Nil!10994) (Cons!10993 (h!11996 (_ BitVec 64)) (t!17225 List!10997)) )
))
(declare-fun arrayNoDuplicates!0 (array!35233 (_ BitVec 32) List!10997) Bool)

(assert (=> b!560867 (= res!352025 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10994))))

(declare-fun b!560868 () Bool)

(declare-fun e!323169 () Bool)

(declare-fun e!323173 () Bool)

(assert (=> b!560868 (= e!323169 e!323173)))

(declare-fun res!352020 () Bool)

(assert (=> b!560868 (=> res!352020 e!323173)))

(declare-datatypes ((SeekEntryResult!5366 0))(
  ( (MissingZero!5366 (index!23691 (_ BitVec 32))) (Found!5366 (index!23692 (_ BitVec 32))) (Intermediate!5366 (undefined!6178 Bool) (index!23693 (_ BitVec 32)) (x!52605 (_ BitVec 32))) (Undefined!5366) (MissingVacant!5366 (index!23694 (_ BitVec 32))) )
))
(declare-fun lt!255115 () SeekEntryResult!5366)

(assert (=> b!560868 (= res!352020 (or (undefined!6178 lt!255115) (not (is-Intermediate!5366 lt!255115))))))

(declare-fun b!560869 () Bool)

(declare-fun res!352029 () Bool)

(declare-fun e!323168 () Bool)

(assert (=> b!560869 (=> (not res!352029) (not e!323168))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560869 (= res!352029 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560870 () Bool)

(declare-fun e!323174 () Bool)

(declare-fun e!323172 () Bool)

(assert (=> b!560870 (= e!323174 e!323172)))

(declare-fun res!352022 () Bool)

(assert (=> b!560870 (=> (not res!352022) (not e!323172))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255114 () SeekEntryResult!5366)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35233 (_ BitVec 32)) SeekEntryResult!5366)

(assert (=> b!560870 (= res!352022 (= lt!255114 (seekKeyOrZeroReturnVacant!0 (x!52605 lt!255115) (index!23693 lt!255115) (index!23693 lt!255115) (select (arr!16917 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560871 () Bool)

(declare-fun e!323170 () Bool)

(assert (=> b!560871 (= e!323170 (not true))))

(assert (=> b!560871 e!323169))

(declare-fun res!352027 () Bool)

(assert (=> b!560871 (=> (not res!352027) (not e!323169))))

(assert (=> b!560871 (= res!352027 (= lt!255114 (Found!5366 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35233 (_ BitVec 32)) SeekEntryResult!5366)

(assert (=> b!560871 (= lt!255114 (seekEntryOrOpen!0 (select (arr!16917 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35233 (_ BitVec 32)) Bool)

(assert (=> b!560871 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17506 0))(
  ( (Unit!17507) )
))
(declare-fun lt!255119 () Unit!17506)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35233 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17506)

(assert (=> b!560871 (= lt!255119 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560872 () Bool)

(declare-fun res!352030 () Bool)

(assert (=> b!560872 (=> (not res!352030) (not e!323168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560872 (= res!352030 (validKeyInArray!0 k!1914))))

(declare-fun res!352019 () Bool)

(assert (=> start!51368 (=> (not res!352019) (not e!323168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51368 (= res!352019 (validMask!0 mask!3119))))

(assert (=> start!51368 e!323168))

(assert (=> start!51368 true))

(declare-fun array_inv!12713 (array!35233) Bool)

(assert (=> start!51368 (array_inv!12713 a!3118)))

(declare-fun b!560873 () Bool)

(declare-fun lt!255121 () (_ BitVec 64))

(declare-fun lt!255113 () array!35233)

(assert (=> b!560873 (= e!323172 (= (seekEntryOrOpen!0 lt!255121 lt!255113 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52605 lt!255115) (index!23693 lt!255115) (index!23693 lt!255115) lt!255121 lt!255113 mask!3119)))))

(declare-fun b!560874 () Bool)

(assert (=> b!560874 (= e!323173 e!323174)))

(declare-fun res!352024 () Bool)

(assert (=> b!560874 (=> res!352024 e!323174)))

(declare-fun lt!255116 () (_ BitVec 64))

(assert (=> b!560874 (= res!352024 (or (= lt!255116 (select (arr!16917 a!3118) j!142)) (= lt!255116 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560874 (= lt!255116 (select (arr!16917 a!3118) (index!23693 lt!255115)))))

(declare-fun b!560875 () Bool)

(assert (=> b!560875 (= e!323168 e!323175)))

(declare-fun res!352031 () Bool)

(assert (=> b!560875 (=> (not res!352031) (not e!323175))))

(declare-fun lt!255120 () SeekEntryResult!5366)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560875 (= res!352031 (or (= lt!255120 (MissingZero!5366 i!1132)) (= lt!255120 (MissingVacant!5366 i!1132))))))

(assert (=> b!560875 (= lt!255120 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!560876 () Bool)

(declare-fun res!352026 () Bool)

(assert (=> b!560876 (=> (not res!352026) (not e!323168))))

(assert (=> b!560876 (= res!352026 (validKeyInArray!0 (select (arr!16917 a!3118) j!142)))))

(declare-fun b!560877 () Bool)

(declare-fun res!352028 () Bool)

(assert (=> b!560877 (=> (not res!352028) (not e!323175))))

(assert (=> b!560877 (= res!352028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560878 () Bool)

(declare-fun res!352021 () Bool)

(assert (=> b!560878 (=> (not res!352021) (not e!323168))))

(assert (=> b!560878 (= res!352021 (and (= (size!17281 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17281 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17281 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560879 () Bool)

(assert (=> b!560879 (= e!323175 e!323170)))

(declare-fun res!352023 () Bool)

(assert (=> b!560879 (=> (not res!352023) (not e!323170))))

(declare-fun lt!255117 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35233 (_ BitVec 32)) SeekEntryResult!5366)

(assert (=> b!560879 (= res!352023 (= lt!255115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255117 lt!255121 lt!255113 mask!3119)))))

(declare-fun lt!255118 () (_ BitVec 32))

(assert (=> b!560879 (= lt!255115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255118 (select (arr!16917 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560879 (= lt!255117 (toIndex!0 lt!255121 mask!3119))))

(assert (=> b!560879 (= lt!255121 (select (store (arr!16917 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!560879 (= lt!255118 (toIndex!0 (select (arr!16917 a!3118) j!142) mask!3119))))

(assert (=> b!560879 (= lt!255113 (array!35234 (store (arr!16917 a!3118) i!1132 k!1914) (size!17281 a!3118)))))

(assert (= (and start!51368 res!352019) b!560878))

(assert (= (and b!560878 res!352021) b!560876))

(assert (= (and b!560876 res!352026) b!560872))

(assert (= (and b!560872 res!352030) b!560869))

(assert (= (and b!560869 res!352029) b!560875))

(assert (= (and b!560875 res!352031) b!560877))

(assert (= (and b!560877 res!352028) b!560867))

(assert (= (and b!560867 res!352025) b!560879))

(assert (= (and b!560879 res!352023) b!560871))

(assert (= (and b!560871 res!352027) b!560868))

(assert (= (and b!560868 (not res!352020)) b!560874))

(assert (= (and b!560874 (not res!352024)) b!560870))

(assert (= (and b!560870 res!352022) b!560873))

(declare-fun m!538689 () Bool)

(assert (=> b!560867 m!538689))

(declare-fun m!538691 () Bool)

(assert (=> b!560872 m!538691))

(declare-fun m!538693 () Bool)

(assert (=> b!560870 m!538693))

(assert (=> b!560870 m!538693))

(declare-fun m!538695 () Bool)

(assert (=> b!560870 m!538695))

(declare-fun m!538697 () Bool)

(assert (=> b!560869 m!538697))

(assert (=> b!560871 m!538693))

(assert (=> b!560871 m!538693))

(declare-fun m!538699 () Bool)

(assert (=> b!560871 m!538699))

(declare-fun m!538701 () Bool)

(assert (=> b!560871 m!538701))

(declare-fun m!538703 () Bool)

(assert (=> b!560871 m!538703))

(assert (=> b!560874 m!538693))

(declare-fun m!538705 () Bool)

(assert (=> b!560874 m!538705))

(declare-fun m!538707 () Bool)

(assert (=> b!560875 m!538707))

(declare-fun m!538709 () Bool)

(assert (=> b!560877 m!538709))

(declare-fun m!538711 () Bool)

(assert (=> start!51368 m!538711))

(declare-fun m!538713 () Bool)

(assert (=> start!51368 m!538713))

(declare-fun m!538715 () Bool)

(assert (=> b!560873 m!538715))

(declare-fun m!538717 () Bool)

(assert (=> b!560873 m!538717))

(declare-fun m!538719 () Bool)

(assert (=> b!560879 m!538719))

(assert (=> b!560879 m!538693))

(declare-fun m!538721 () Bool)

(assert (=> b!560879 m!538721))

(assert (=> b!560879 m!538693))

(declare-fun m!538723 () Bool)

(assert (=> b!560879 m!538723))

(declare-fun m!538725 () Bool)

(assert (=> b!560879 m!538725))

(declare-fun m!538727 () Bool)

(assert (=> b!560879 m!538727))

(assert (=> b!560879 m!538693))

(declare-fun m!538729 () Bool)

(assert (=> b!560879 m!538729))

(assert (=> b!560876 m!538693))

(assert (=> b!560876 m!538693))

(declare-fun m!538731 () Bool)

(assert (=> b!560876 m!538731))

(push 1)

