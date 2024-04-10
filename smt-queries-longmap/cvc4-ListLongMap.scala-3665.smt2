; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50610 () Bool)

(assert start!50610)

(declare-fun b!553064 () Bool)

(declare-fun res!345479 () Bool)

(declare-fun e!319081 () Bool)

(assert (=> b!553064 (=> (not res!345479) (not e!319081))))

(declare-datatypes ((array!34835 0))(
  ( (array!34836 (arr!16727 (Array (_ BitVec 32) (_ BitVec 64))) (size!17091 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34835)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34835 (_ BitVec 32)) Bool)

(assert (=> b!553064 (= res!345479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!345482 () Bool)

(declare-fun e!319083 () Bool)

(assert (=> start!50610 (=> (not res!345482) (not e!319083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50610 (= res!345482 (validMask!0 mask!3119))))

(assert (=> start!50610 e!319083))

(assert (=> start!50610 true))

(declare-fun array_inv!12523 (array!34835) Bool)

(assert (=> start!50610 (array_inv!12523 a!3118)))

(declare-fun b!553065 () Bool)

(assert (=> b!553065 (= e!319083 e!319081)))

(declare-fun res!345478 () Bool)

(assert (=> b!553065 (=> (not res!345478) (not e!319081))))

(declare-datatypes ((SeekEntryResult!5176 0))(
  ( (MissingZero!5176 (index!22931 (_ BitVec 32))) (Found!5176 (index!22932 (_ BitVec 32))) (Intermediate!5176 (undefined!5988 Bool) (index!22933 (_ BitVec 32)) (x!51858 (_ BitVec 32))) (Undefined!5176) (MissingVacant!5176 (index!22934 (_ BitVec 32))) )
))
(declare-fun lt!251358 () SeekEntryResult!5176)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553065 (= res!345478 (or (= lt!251358 (MissingZero!5176 i!1132)) (= lt!251358 (MissingVacant!5176 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34835 (_ BitVec 32)) SeekEntryResult!5176)

(assert (=> b!553065 (= lt!251358 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!553066 () Bool)

(assert (=> b!553066 (= e!319081 (not true))))

(declare-fun e!319082 () Bool)

(assert (=> b!553066 e!319082))

(declare-fun res!345483 () Bool)

(assert (=> b!553066 (=> (not res!345483) (not e!319082))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!553066 (= res!345483 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17126 0))(
  ( (Unit!17127) )
))
(declare-fun lt!251359 () Unit!17126)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17126)

(assert (=> b!553066 (= lt!251359 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553067 () Bool)

(declare-fun res!345477 () Bool)

(assert (=> b!553067 (=> (not res!345477) (not e!319083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553067 (= res!345477 (validKeyInArray!0 k!1914))))

(declare-fun b!553068 () Bool)

(declare-fun res!345484 () Bool)

(assert (=> b!553068 (=> (not res!345484) (not e!319081))))

(declare-datatypes ((List!10807 0))(
  ( (Nil!10804) (Cons!10803 (h!11788 (_ BitVec 64)) (t!17035 List!10807)) )
))
(declare-fun arrayNoDuplicates!0 (array!34835 (_ BitVec 32) List!10807) Bool)

(assert (=> b!553068 (= res!345484 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10804))))

(declare-fun b!553069 () Bool)

(declare-fun res!345476 () Bool)

(assert (=> b!553069 (=> (not res!345476) (not e!319083))))

(assert (=> b!553069 (= res!345476 (validKeyInArray!0 (select (arr!16727 a!3118) j!142)))))

(declare-fun b!553070 () Bool)

(declare-fun res!345480 () Bool)

(assert (=> b!553070 (=> (not res!345480) (not e!319081))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34835 (_ BitVec 32)) SeekEntryResult!5176)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553070 (= res!345480 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16727 a!3118) j!142) mask!3119) (select (arr!16727 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16727 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16727 a!3118) i!1132 k!1914) j!142) (array!34836 (store (arr!16727 a!3118) i!1132 k!1914) (size!17091 a!3118)) mask!3119)))))

(declare-fun b!553071 () Bool)

(assert (=> b!553071 (= e!319082 (= (seekEntryOrOpen!0 (select (arr!16727 a!3118) j!142) a!3118 mask!3119) (Found!5176 j!142)))))

(declare-fun b!553072 () Bool)

(declare-fun res!345485 () Bool)

(assert (=> b!553072 (=> (not res!345485) (not e!319083))))

(declare-fun arrayContainsKey!0 (array!34835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553072 (= res!345485 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553073 () Bool)

(declare-fun res!345481 () Bool)

(assert (=> b!553073 (=> (not res!345481) (not e!319083))))

(assert (=> b!553073 (= res!345481 (and (= (size!17091 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17091 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17091 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50610 res!345482) b!553073))

(assert (= (and b!553073 res!345481) b!553069))

(assert (= (and b!553069 res!345476) b!553067))

(assert (= (and b!553067 res!345477) b!553072))

(assert (= (and b!553072 res!345485) b!553065))

(assert (= (and b!553065 res!345478) b!553064))

(assert (= (and b!553064 res!345479) b!553068))

(assert (= (and b!553068 res!345484) b!553070))

(assert (= (and b!553070 res!345480) b!553066))

(assert (= (and b!553066 res!345483) b!553071))

(declare-fun m!530073 () Bool)

(assert (=> start!50610 m!530073))

(declare-fun m!530075 () Bool)

(assert (=> start!50610 m!530075))

(declare-fun m!530077 () Bool)

(assert (=> b!553067 m!530077))

(declare-fun m!530079 () Bool)

(assert (=> b!553070 m!530079))

(declare-fun m!530081 () Bool)

(assert (=> b!553070 m!530081))

(assert (=> b!553070 m!530079))

(declare-fun m!530083 () Bool)

(assert (=> b!553070 m!530083))

(declare-fun m!530085 () Bool)

(assert (=> b!553070 m!530085))

(assert (=> b!553070 m!530083))

(declare-fun m!530087 () Bool)

(assert (=> b!553070 m!530087))

(assert (=> b!553070 m!530081))

(assert (=> b!553070 m!530079))

(declare-fun m!530089 () Bool)

(assert (=> b!553070 m!530089))

(declare-fun m!530091 () Bool)

(assert (=> b!553070 m!530091))

(assert (=> b!553070 m!530083))

(assert (=> b!553070 m!530085))

(declare-fun m!530093 () Bool)

(assert (=> b!553068 m!530093))

(declare-fun m!530095 () Bool)

(assert (=> b!553064 m!530095))

(declare-fun m!530097 () Bool)

(assert (=> b!553066 m!530097))

(declare-fun m!530099 () Bool)

(assert (=> b!553066 m!530099))

(declare-fun m!530101 () Bool)

(assert (=> b!553072 m!530101))

(assert (=> b!553071 m!530079))

(assert (=> b!553071 m!530079))

(declare-fun m!530103 () Bool)

(assert (=> b!553071 m!530103))

(assert (=> b!553069 m!530079))

(assert (=> b!553069 m!530079))

(declare-fun m!530105 () Bool)

(assert (=> b!553069 m!530105))

(declare-fun m!530107 () Bool)

(assert (=> b!553065 m!530107))

(push 1)

