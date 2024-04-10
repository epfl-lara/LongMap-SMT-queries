; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50712 () Bool)

(assert start!50712)

(declare-fun b!554604 () Bool)

(declare-fun res!347017 () Bool)

(declare-fun e!319764 () Bool)

(assert (=> b!554604 (=> (not res!347017) (not e!319764))))

(declare-datatypes ((array!34937 0))(
  ( (array!34938 (arr!16778 (Array (_ BitVec 32) (_ BitVec 64))) (size!17142 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34937)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34937 (_ BitVec 32)) Bool)

(assert (=> b!554604 (= res!347017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554605 () Bool)

(declare-fun res!347018 () Bool)

(declare-fun e!319766 () Bool)

(assert (=> b!554605 (=> (not res!347018) (not e!319766))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554605 (= res!347018 (validKeyInArray!0 k!1914))))

(declare-fun b!554606 () Bool)

(declare-fun res!347022 () Bool)

(assert (=> b!554606 (=> (not res!347022) (not e!319766))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!554606 (= res!347022 (validKeyInArray!0 (select (arr!16778 a!3118) j!142)))))

(declare-fun res!347023 () Bool)

(assert (=> start!50712 (=> (not res!347023) (not e!319766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50712 (= res!347023 (validMask!0 mask!3119))))

(assert (=> start!50712 e!319766))

(assert (=> start!50712 true))

(declare-fun array_inv!12574 (array!34937) Bool)

(assert (=> start!50712 (array_inv!12574 a!3118)))

(declare-fun b!554607 () Bool)

(assert (=> b!554607 (= e!319766 e!319764)))

(declare-fun res!347016 () Bool)

(assert (=> b!554607 (=> (not res!347016) (not e!319764))))

(declare-datatypes ((SeekEntryResult!5227 0))(
  ( (MissingZero!5227 (index!23135 (_ BitVec 32))) (Found!5227 (index!23136 (_ BitVec 32))) (Intermediate!5227 (undefined!6039 Bool) (index!23137 (_ BitVec 32)) (x!52045 (_ BitVec 32))) (Undefined!5227) (MissingVacant!5227 (index!23138 (_ BitVec 32))) )
))
(declare-fun lt!251858 () SeekEntryResult!5227)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554607 (= res!347016 (or (= lt!251858 (MissingZero!5227 i!1132)) (= lt!251858 (MissingVacant!5227 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34937 (_ BitVec 32)) SeekEntryResult!5227)

(assert (=> b!554607 (= lt!251858 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554608 () Bool)

(declare-fun res!347019 () Bool)

(assert (=> b!554608 (=> (not res!347019) (not e!319766))))

(assert (=> b!554608 (= res!347019 (and (= (size!17142 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17142 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17142 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554609 () Bool)

(declare-fun res!347024 () Bool)

(assert (=> b!554609 (=> (not res!347024) (not e!319764))))

(declare-datatypes ((List!10858 0))(
  ( (Nil!10855) (Cons!10854 (h!11839 (_ BitVec 64)) (t!17086 List!10858)) )
))
(declare-fun arrayNoDuplicates!0 (array!34937 (_ BitVec 32) List!10858) Bool)

(assert (=> b!554609 (= res!347024 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10855))))

(declare-fun b!554610 () Bool)

(declare-fun e!319765 () Bool)

(assert (=> b!554610 (= e!319764 e!319765)))

(declare-fun res!347020 () Bool)

(assert (=> b!554610 (=> (not res!347020) (not e!319765))))

(declare-fun lt!251863 () SeekEntryResult!5227)

(declare-fun lt!251861 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34937 (_ BitVec 32)) SeekEntryResult!5227)

(assert (=> b!554610 (= res!347020 (= lt!251863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251861 (select (store (arr!16778 a!3118) i!1132 k!1914) j!142) (array!34938 (store (arr!16778 a!3118) i!1132 k!1914) (size!17142 a!3118)) mask!3119)))))

(declare-fun lt!251860 () (_ BitVec 32))

(assert (=> b!554610 (= lt!251863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251860 (select (arr!16778 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554610 (= lt!251861 (toIndex!0 (select (store (arr!16778 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!554610 (= lt!251860 (toIndex!0 (select (arr!16778 a!3118) j!142) mask!3119))))

(declare-fun b!554611 () Bool)

(declare-fun res!347021 () Bool)

(assert (=> b!554611 (=> (not res!347021) (not e!319766))))

(declare-fun arrayContainsKey!0 (array!34937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554611 (= res!347021 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554612 () Bool)

(assert (=> b!554612 (= e!319765 (not true))))

(declare-fun lt!251862 () SeekEntryResult!5227)

(assert (=> b!554612 (and (= lt!251862 (Found!5227 j!142)) (or (undefined!6039 lt!251863) (not (is-Intermediate!5227 lt!251863)) (= (select (arr!16778 a!3118) (index!23137 lt!251863)) (select (arr!16778 a!3118) j!142)) (not (= (select (arr!16778 a!3118) (index!23137 lt!251863)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251862 (MissingZero!5227 (index!23137 lt!251863)))))))

(assert (=> b!554612 (= lt!251862 (seekEntryOrOpen!0 (select (arr!16778 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!554612 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17228 0))(
  ( (Unit!17229) )
))
(declare-fun lt!251859 () Unit!17228)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34937 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17228)

(assert (=> b!554612 (= lt!251859 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50712 res!347023) b!554608))

(assert (= (and b!554608 res!347019) b!554606))

(assert (= (and b!554606 res!347022) b!554605))

(assert (= (and b!554605 res!347018) b!554611))

(assert (= (and b!554611 res!347021) b!554607))

(assert (= (and b!554607 res!347016) b!554604))

(assert (= (and b!554604 res!347017) b!554609))

(assert (= (and b!554609 res!347024) b!554610))

(assert (= (and b!554610 res!347020) b!554612))

(declare-fun m!531949 () Bool)

(assert (=> b!554611 m!531949))

(declare-fun m!531951 () Bool)

(assert (=> b!554604 m!531951))

(declare-fun m!531953 () Bool)

(assert (=> b!554607 m!531953))

(declare-fun m!531955 () Bool)

(assert (=> b!554612 m!531955))

(declare-fun m!531957 () Bool)

(assert (=> b!554612 m!531957))

(declare-fun m!531959 () Bool)

(assert (=> b!554612 m!531959))

(assert (=> b!554612 m!531955))

(declare-fun m!531961 () Bool)

(assert (=> b!554612 m!531961))

(declare-fun m!531963 () Bool)

(assert (=> b!554612 m!531963))

(declare-fun m!531965 () Bool)

(assert (=> start!50712 m!531965))

(declare-fun m!531967 () Bool)

(assert (=> start!50712 m!531967))

(declare-fun m!531969 () Bool)

(assert (=> b!554609 m!531969))

(declare-fun m!531971 () Bool)

(assert (=> b!554605 m!531971))

(assert (=> b!554606 m!531955))

(assert (=> b!554606 m!531955))

(declare-fun m!531973 () Bool)

(assert (=> b!554606 m!531973))

(assert (=> b!554610 m!531955))

(assert (=> b!554610 m!531955))

(declare-fun m!531975 () Bool)

(assert (=> b!554610 m!531975))

(declare-fun m!531977 () Bool)

(assert (=> b!554610 m!531977))

(declare-fun m!531979 () Bool)

(assert (=> b!554610 m!531979))

(assert (=> b!554610 m!531977))

(declare-fun m!531981 () Bool)

(assert (=> b!554610 m!531981))

(assert (=> b!554610 m!531955))

(declare-fun m!531983 () Bool)

(assert (=> b!554610 m!531983))

(assert (=> b!554610 m!531977))

(declare-fun m!531985 () Bool)

(assert (=> b!554610 m!531985))

(push 1)

