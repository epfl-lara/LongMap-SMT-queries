; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51432 () Bool)

(assert start!51432)

(declare-fun b!562115 () Bool)

(declare-fun res!353272 () Bool)

(declare-fun e!323942 () Bool)

(assert (=> b!562115 (=> (not res!353272) (not e!323942))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562115 (= res!353272 (validKeyInArray!0 k!1914))))

(declare-fun b!562116 () Bool)

(declare-fun e!323938 () Bool)

(assert (=> b!562116 (= e!323938 (not true))))

(declare-fun e!323940 () Bool)

(assert (=> b!562116 e!323940))

(declare-fun res!353277 () Bool)

(assert (=> b!562116 (=> (not res!353277) (not e!323940))))

(declare-datatypes ((SeekEntryResult!5398 0))(
  ( (MissingZero!5398 (index!23819 (_ BitVec 32))) (Found!5398 (index!23820 (_ BitVec 32))) (Intermediate!5398 (undefined!6210 Bool) (index!23821 (_ BitVec 32)) (x!52717 (_ BitVec 32))) (Undefined!5398) (MissingVacant!5398 (index!23822 (_ BitVec 32))) )
))
(declare-fun lt!255978 () SeekEntryResult!5398)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562116 (= res!353277 (= lt!255978 (Found!5398 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35297 0))(
  ( (array!35298 (arr!16949 (Array (_ BitVec 32) (_ BitVec 64))) (size!17313 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35297)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35297 (_ BitVec 32)) SeekEntryResult!5398)

(assert (=> b!562116 (= lt!255978 (seekEntryOrOpen!0 (select (arr!16949 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35297 (_ BitVec 32)) Bool)

(assert (=> b!562116 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17570 0))(
  ( (Unit!17571) )
))
(declare-fun lt!255981 () Unit!17570)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17570)

(assert (=> b!562116 (= lt!255981 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562117 () Bool)

(declare-fun res!353269 () Bool)

(assert (=> b!562117 (=> (not res!353269) (not e!323942))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562117 (= res!353269 (and (= (size!17313 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17313 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17313 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562118 () Bool)

(declare-fun e!323939 () Bool)

(assert (=> b!562118 (= e!323940 e!323939)))

(declare-fun res!353275 () Bool)

(assert (=> b!562118 (=> res!353275 e!323939)))

(declare-fun lt!255982 () SeekEntryResult!5398)

(assert (=> b!562118 (= res!353275 (or (undefined!6210 lt!255982) (not (is-Intermediate!5398 lt!255982))))))

(declare-fun res!353270 () Bool)

(assert (=> start!51432 (=> (not res!353270) (not e!323942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51432 (= res!353270 (validMask!0 mask!3119))))

(assert (=> start!51432 e!323942))

(assert (=> start!51432 true))

(declare-fun array_inv!12745 (array!35297) Bool)

(assert (=> start!51432 (array_inv!12745 a!3118)))

(declare-fun b!562119 () Bool)

(declare-fun e!323943 () Bool)

(declare-fun e!323936 () Bool)

(assert (=> b!562119 (= e!323943 e!323936)))

(declare-fun res!353273 () Bool)

(assert (=> b!562119 (=> (not res!353273) (not e!323936))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35297 (_ BitVec 32)) SeekEntryResult!5398)

(assert (=> b!562119 (= res!353273 (= lt!255978 (seekKeyOrZeroReturnVacant!0 (x!52717 lt!255982) (index!23821 lt!255982) (index!23821 lt!255982) (select (arr!16949 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun lt!255984 () (_ BitVec 64))

(declare-fun b!562120 () Bool)

(declare-fun lt!255977 () array!35297)

(assert (=> b!562120 (= e!323936 (= (seekEntryOrOpen!0 lt!255984 lt!255977 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52717 lt!255982) (index!23821 lt!255982) (index!23821 lt!255982) lt!255984 lt!255977 mask!3119)))))

(declare-fun b!562121 () Bool)

(declare-fun res!353268 () Bool)

(assert (=> b!562121 (=> (not res!353268) (not e!323942))))

(declare-fun arrayContainsKey!0 (array!35297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562121 (= res!353268 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562122 () Bool)

(declare-fun e!323941 () Bool)

(assert (=> b!562122 (= e!323941 e!323938)))

(declare-fun res!353274 () Bool)

(assert (=> b!562122 (=> (not res!353274) (not e!323938))))

(declare-fun lt!255979 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35297 (_ BitVec 32)) SeekEntryResult!5398)

(assert (=> b!562122 (= res!353274 (= lt!255982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255979 lt!255984 lt!255977 mask!3119)))))

(declare-fun lt!255985 () (_ BitVec 32))

(assert (=> b!562122 (= lt!255982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255985 (select (arr!16949 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562122 (= lt!255979 (toIndex!0 lt!255984 mask!3119))))

(assert (=> b!562122 (= lt!255984 (select (store (arr!16949 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562122 (= lt!255985 (toIndex!0 (select (arr!16949 a!3118) j!142) mask!3119))))

(assert (=> b!562122 (= lt!255977 (array!35298 (store (arr!16949 a!3118) i!1132 k!1914) (size!17313 a!3118)))))

(declare-fun b!562123 () Bool)

(declare-fun res!353267 () Bool)

(assert (=> b!562123 (=> (not res!353267) (not e!323941))))

(assert (=> b!562123 (= res!353267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562124 () Bool)

(declare-fun res!353276 () Bool)

(assert (=> b!562124 (=> (not res!353276) (not e!323941))))

(declare-datatypes ((List!11029 0))(
  ( (Nil!11026) (Cons!11025 (h!12028 (_ BitVec 64)) (t!17257 List!11029)) )
))
(declare-fun arrayNoDuplicates!0 (array!35297 (_ BitVec 32) List!11029) Bool)

(assert (=> b!562124 (= res!353276 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11026))))

(declare-fun b!562125 () Bool)

(declare-fun res!353271 () Bool)

(assert (=> b!562125 (=> (not res!353271) (not e!323942))))

(assert (=> b!562125 (= res!353271 (validKeyInArray!0 (select (arr!16949 a!3118) j!142)))))

(declare-fun b!562126 () Bool)

(assert (=> b!562126 (= e!323942 e!323941)))

(declare-fun res!353278 () Bool)

(assert (=> b!562126 (=> (not res!353278) (not e!323941))))

(declare-fun lt!255983 () SeekEntryResult!5398)

(assert (=> b!562126 (= res!353278 (or (= lt!255983 (MissingZero!5398 i!1132)) (= lt!255983 (MissingVacant!5398 i!1132))))))

(assert (=> b!562126 (= lt!255983 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!562127 () Bool)

(assert (=> b!562127 (= e!323939 e!323943)))

(declare-fun res!353279 () Bool)

(assert (=> b!562127 (=> res!353279 e!323943)))

(declare-fun lt!255980 () (_ BitVec 64))

(assert (=> b!562127 (= res!353279 (or (= lt!255980 (select (arr!16949 a!3118) j!142)) (= lt!255980 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562127 (= lt!255980 (select (arr!16949 a!3118) (index!23821 lt!255982)))))

(assert (= (and start!51432 res!353270) b!562117))

(assert (= (and b!562117 res!353269) b!562125))

(assert (= (and b!562125 res!353271) b!562115))

(assert (= (and b!562115 res!353272) b!562121))

(assert (= (and b!562121 res!353268) b!562126))

(assert (= (and b!562126 res!353278) b!562123))

(assert (= (and b!562123 res!353267) b!562124))

(assert (= (and b!562124 res!353276) b!562122))

(assert (= (and b!562122 res!353274) b!562116))

(assert (= (and b!562116 res!353277) b!562118))

(assert (= (and b!562118 (not res!353275)) b!562127))

(assert (= (and b!562127 (not res!353279)) b!562119))

(assert (= (and b!562119 res!353273) b!562120))

(declare-fun m!540097 () Bool)

(assert (=> b!562125 m!540097))

(assert (=> b!562125 m!540097))

(declare-fun m!540099 () Bool)

(assert (=> b!562125 m!540099))

(declare-fun m!540101 () Bool)

(assert (=> b!562124 m!540101))

(assert (=> b!562127 m!540097))

(declare-fun m!540103 () Bool)

(assert (=> b!562127 m!540103))

(assert (=> b!562122 m!540097))

(declare-fun m!540105 () Bool)

(assert (=> b!562122 m!540105))

(assert (=> b!562122 m!540097))

(assert (=> b!562122 m!540097))

(declare-fun m!540107 () Bool)

(assert (=> b!562122 m!540107))

(declare-fun m!540109 () Bool)

(assert (=> b!562122 m!540109))

(declare-fun m!540111 () Bool)

(assert (=> b!562122 m!540111))

(declare-fun m!540113 () Bool)

(assert (=> b!562122 m!540113))

(declare-fun m!540115 () Bool)

(assert (=> b!562122 m!540115))

(assert (=> b!562116 m!540097))

(assert (=> b!562116 m!540097))

(declare-fun m!540117 () Bool)

(assert (=> b!562116 m!540117))

(declare-fun m!540119 () Bool)

(assert (=> b!562116 m!540119))

(declare-fun m!540121 () Bool)

(assert (=> b!562116 m!540121))

(declare-fun m!540123 () Bool)

(assert (=> b!562121 m!540123))

(declare-fun m!540125 () Bool)

(assert (=> start!51432 m!540125))

(declare-fun m!540127 () Bool)

(assert (=> start!51432 m!540127))

(declare-fun m!540129 () Bool)

(assert (=> b!562120 m!540129))

(declare-fun m!540131 () Bool)

(assert (=> b!562120 m!540131))

(declare-fun m!540133 () Bool)

(assert (=> b!562123 m!540133))

(declare-fun m!540135 () Bool)

(assert (=> b!562126 m!540135))

(assert (=> b!562119 m!540097))

(assert (=> b!562119 m!540097))

(declare-fun m!540137 () Bool)

(assert (=> b!562119 m!540137))

(declare-fun m!540139 () Bool)

(assert (=> b!562115 m!540139))

(push 1)

