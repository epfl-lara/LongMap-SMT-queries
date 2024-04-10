; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50718 () Bool)

(assert start!50718)

(declare-fun res!347098 () Bool)

(declare-fun e!319803 () Bool)

(assert (=> start!50718 (=> (not res!347098) (not e!319803))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50718 (= res!347098 (validMask!0 mask!3119))))

(assert (=> start!50718 e!319803))

(assert (=> start!50718 true))

(declare-datatypes ((array!34943 0))(
  ( (array!34944 (arr!16781 (Array (_ BitVec 32) (_ BitVec 64))) (size!17145 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34943)

(declare-fun array_inv!12577 (array!34943) Bool)

(assert (=> start!50718 (array_inv!12577 a!3118)))

(declare-fun b!554685 () Bool)

(declare-fun e!319802 () Bool)

(declare-fun e!319801 () Bool)

(assert (=> b!554685 (= e!319802 e!319801)))

(declare-fun res!347103 () Bool)

(assert (=> b!554685 (=> (not res!347103) (not e!319801))))

(declare-datatypes ((SeekEntryResult!5230 0))(
  ( (MissingZero!5230 (index!23147 (_ BitVec 32))) (Found!5230 (index!23148 (_ BitVec 32))) (Intermediate!5230 (undefined!6042 Bool) (index!23149 (_ BitVec 32)) (x!52056 (_ BitVec 32))) (Undefined!5230) (MissingVacant!5230 (index!23150 (_ BitVec 32))) )
))
(declare-fun lt!251915 () SeekEntryResult!5230)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!251912 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34943 (_ BitVec 32)) SeekEntryResult!5230)

(assert (=> b!554685 (= res!347103 (= lt!251915 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251912 (select (store (arr!16781 a!3118) i!1132 k!1914) j!142) (array!34944 (store (arr!16781 a!3118) i!1132 k!1914) (size!17145 a!3118)) mask!3119)))))

(declare-fun lt!251913 () (_ BitVec 32))

(assert (=> b!554685 (= lt!251915 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251913 (select (arr!16781 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554685 (= lt!251912 (toIndex!0 (select (store (arr!16781 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!554685 (= lt!251913 (toIndex!0 (select (arr!16781 a!3118) j!142) mask!3119))))

(declare-fun b!554686 () Bool)

(assert (=> b!554686 (= e!319801 (not true))))

(declare-fun lt!251917 () SeekEntryResult!5230)

(assert (=> b!554686 (and (= lt!251917 (Found!5230 j!142)) (or (undefined!6042 lt!251915) (not (is-Intermediate!5230 lt!251915)) (= (select (arr!16781 a!3118) (index!23149 lt!251915)) (select (arr!16781 a!3118) j!142)) (not (= (select (arr!16781 a!3118) (index!23149 lt!251915)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251917 (MissingZero!5230 (index!23149 lt!251915)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34943 (_ BitVec 32)) SeekEntryResult!5230)

(assert (=> b!554686 (= lt!251917 (seekEntryOrOpen!0 (select (arr!16781 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34943 (_ BitVec 32)) Bool)

(assert (=> b!554686 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17234 0))(
  ( (Unit!17235) )
))
(declare-fun lt!251914 () Unit!17234)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34943 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17234)

(assert (=> b!554686 (= lt!251914 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554687 () Bool)

(declare-fun res!347102 () Bool)

(assert (=> b!554687 (=> (not res!347102) (not e!319803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554687 (= res!347102 (validKeyInArray!0 k!1914))))

(declare-fun b!554688 () Bool)

(assert (=> b!554688 (= e!319803 e!319802)))

(declare-fun res!347099 () Bool)

(assert (=> b!554688 (=> (not res!347099) (not e!319802))))

(declare-fun lt!251916 () SeekEntryResult!5230)

(assert (=> b!554688 (= res!347099 (or (= lt!251916 (MissingZero!5230 i!1132)) (= lt!251916 (MissingVacant!5230 i!1132))))))

(assert (=> b!554688 (= lt!251916 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554689 () Bool)

(declare-fun res!347104 () Bool)

(assert (=> b!554689 (=> (not res!347104) (not e!319802))))

(assert (=> b!554689 (= res!347104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554690 () Bool)

(declare-fun res!347100 () Bool)

(assert (=> b!554690 (=> (not res!347100) (not e!319803))))

(assert (=> b!554690 (= res!347100 (validKeyInArray!0 (select (arr!16781 a!3118) j!142)))))

(declare-fun b!554691 () Bool)

(declare-fun res!347101 () Bool)

(assert (=> b!554691 (=> (not res!347101) (not e!319802))))

(declare-datatypes ((List!10861 0))(
  ( (Nil!10858) (Cons!10857 (h!11842 (_ BitVec 64)) (t!17089 List!10861)) )
))
(declare-fun arrayNoDuplicates!0 (array!34943 (_ BitVec 32) List!10861) Bool)

(assert (=> b!554691 (= res!347101 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10858))))

(declare-fun b!554692 () Bool)

(declare-fun res!347105 () Bool)

(assert (=> b!554692 (=> (not res!347105) (not e!319803))))

(declare-fun arrayContainsKey!0 (array!34943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554692 (= res!347105 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554693 () Bool)

(declare-fun res!347097 () Bool)

(assert (=> b!554693 (=> (not res!347097) (not e!319803))))

(assert (=> b!554693 (= res!347097 (and (= (size!17145 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17145 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17145 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50718 res!347098) b!554693))

(assert (= (and b!554693 res!347097) b!554690))

(assert (= (and b!554690 res!347100) b!554687))

(assert (= (and b!554687 res!347102) b!554692))

(assert (= (and b!554692 res!347105) b!554688))

(assert (= (and b!554688 res!347099) b!554689))

(assert (= (and b!554689 res!347104) b!554691))

(assert (= (and b!554691 res!347101) b!554685))

(assert (= (and b!554685 res!347103) b!554686))

(declare-fun m!532063 () Bool)

(assert (=> b!554689 m!532063))

(declare-fun m!532065 () Bool)

(assert (=> b!554691 m!532065))

(declare-fun m!532067 () Bool)

(assert (=> b!554692 m!532067))

(declare-fun m!532069 () Bool)

(assert (=> b!554685 m!532069))

(declare-fun m!532071 () Bool)

(assert (=> b!554685 m!532071))

(assert (=> b!554685 m!532069))

(declare-fun m!532073 () Bool)

(assert (=> b!554685 m!532073))

(assert (=> b!554685 m!532073))

(declare-fun m!532075 () Bool)

(assert (=> b!554685 m!532075))

(assert (=> b!554685 m!532069))

(declare-fun m!532077 () Bool)

(assert (=> b!554685 m!532077))

(declare-fun m!532079 () Bool)

(assert (=> b!554685 m!532079))

(assert (=> b!554685 m!532073))

(declare-fun m!532081 () Bool)

(assert (=> b!554685 m!532081))

(declare-fun m!532083 () Bool)

(assert (=> start!50718 m!532083))

(declare-fun m!532085 () Bool)

(assert (=> start!50718 m!532085))

(declare-fun m!532087 () Bool)

(assert (=> b!554687 m!532087))

(assert (=> b!554690 m!532069))

(assert (=> b!554690 m!532069))

(declare-fun m!532089 () Bool)

(assert (=> b!554690 m!532089))

(assert (=> b!554686 m!532069))

(declare-fun m!532091 () Bool)

(assert (=> b!554686 m!532091))

(declare-fun m!532093 () Bool)

(assert (=> b!554686 m!532093))

(declare-fun m!532095 () Bool)

(assert (=> b!554686 m!532095))

(assert (=> b!554686 m!532069))

(declare-fun m!532097 () Bool)

(assert (=> b!554686 m!532097))

(declare-fun m!532099 () Bool)

(assert (=> b!554688 m!532099))

(push 1)

