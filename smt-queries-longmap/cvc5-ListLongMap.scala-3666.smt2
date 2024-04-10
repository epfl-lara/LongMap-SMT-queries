; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50612 () Bool)

(assert start!50612)

(declare-fun b!553094 () Bool)

(declare-fun e!319094 () Bool)

(declare-fun e!319092 () Bool)

(assert (=> b!553094 (= e!319094 e!319092)))

(declare-fun res!345508 () Bool)

(assert (=> b!553094 (=> (not res!345508) (not e!319092))))

(declare-datatypes ((SeekEntryResult!5177 0))(
  ( (MissingZero!5177 (index!22935 (_ BitVec 32))) (Found!5177 (index!22936 (_ BitVec 32))) (Intermediate!5177 (undefined!5989 Bool) (index!22937 (_ BitVec 32)) (x!51867 (_ BitVec 32))) (Undefined!5177) (MissingVacant!5177 (index!22938 (_ BitVec 32))) )
))
(declare-fun lt!251365 () SeekEntryResult!5177)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553094 (= res!345508 (or (= lt!251365 (MissingZero!5177 i!1132)) (= lt!251365 (MissingVacant!5177 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!34837 0))(
  ( (array!34838 (arr!16728 (Array (_ BitVec 32) (_ BitVec 64))) (size!17092 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34837)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34837 (_ BitVec 32)) SeekEntryResult!5177)

(assert (=> b!553094 (= lt!251365 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!553095 () Bool)

(declare-fun res!345515 () Bool)

(assert (=> b!553095 (=> (not res!345515) (not e!319094))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!553095 (= res!345515 (and (= (size!17092 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17092 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17092 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!345512 () Bool)

(assert (=> start!50612 (=> (not res!345512) (not e!319094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50612 (= res!345512 (validMask!0 mask!3119))))

(assert (=> start!50612 e!319094))

(assert (=> start!50612 true))

(declare-fun array_inv!12524 (array!34837) Bool)

(assert (=> start!50612 (array_inv!12524 a!3118)))

(declare-fun b!553096 () Bool)

(assert (=> b!553096 (= e!319092 (not true))))

(declare-fun e!319093 () Bool)

(assert (=> b!553096 e!319093))

(declare-fun res!345511 () Bool)

(assert (=> b!553096 (=> (not res!345511) (not e!319093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34837 (_ BitVec 32)) Bool)

(assert (=> b!553096 (= res!345511 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17128 0))(
  ( (Unit!17129) )
))
(declare-fun lt!251364 () Unit!17128)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17128)

(assert (=> b!553096 (= lt!251364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553097 () Bool)

(assert (=> b!553097 (= e!319093 (= (seekEntryOrOpen!0 (select (arr!16728 a!3118) j!142) a!3118 mask!3119) (Found!5177 j!142)))))

(declare-fun b!553098 () Bool)

(declare-fun res!345506 () Bool)

(assert (=> b!553098 (=> (not res!345506) (not e!319092))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34837 (_ BitVec 32)) SeekEntryResult!5177)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553098 (= res!345506 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16728 a!3118) j!142) mask!3119) (select (arr!16728 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16728 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16728 a!3118) i!1132 k!1914) j!142) (array!34838 (store (arr!16728 a!3118) i!1132 k!1914) (size!17092 a!3118)) mask!3119)))))

(declare-fun b!553099 () Bool)

(declare-fun res!345510 () Bool)

(assert (=> b!553099 (=> (not res!345510) (not e!319092))))

(assert (=> b!553099 (= res!345510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553100 () Bool)

(declare-fun res!345513 () Bool)

(assert (=> b!553100 (=> (not res!345513) (not e!319094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553100 (= res!345513 (validKeyInArray!0 k!1914))))

(declare-fun b!553101 () Bool)

(declare-fun res!345514 () Bool)

(assert (=> b!553101 (=> (not res!345514) (not e!319094))))

(declare-fun arrayContainsKey!0 (array!34837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553101 (= res!345514 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553102 () Bool)

(declare-fun res!345507 () Bool)

(assert (=> b!553102 (=> (not res!345507) (not e!319092))))

(declare-datatypes ((List!10808 0))(
  ( (Nil!10805) (Cons!10804 (h!11789 (_ BitVec 64)) (t!17036 List!10808)) )
))
(declare-fun arrayNoDuplicates!0 (array!34837 (_ BitVec 32) List!10808) Bool)

(assert (=> b!553102 (= res!345507 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10805))))

(declare-fun b!553103 () Bool)

(declare-fun res!345509 () Bool)

(assert (=> b!553103 (=> (not res!345509) (not e!319094))))

(assert (=> b!553103 (= res!345509 (validKeyInArray!0 (select (arr!16728 a!3118) j!142)))))

(assert (= (and start!50612 res!345512) b!553095))

(assert (= (and b!553095 res!345515) b!553103))

(assert (= (and b!553103 res!345509) b!553100))

(assert (= (and b!553100 res!345513) b!553101))

(assert (= (and b!553101 res!345514) b!553094))

(assert (= (and b!553094 res!345508) b!553099))

(assert (= (and b!553099 res!345510) b!553102))

(assert (= (and b!553102 res!345507) b!553098))

(assert (= (and b!553098 res!345506) b!553096))

(assert (= (and b!553096 res!345511) b!553097))

(declare-fun m!530109 () Bool)

(assert (=> b!553102 m!530109))

(declare-fun m!530111 () Bool)

(assert (=> start!50612 m!530111))

(declare-fun m!530113 () Bool)

(assert (=> start!50612 m!530113))

(declare-fun m!530115 () Bool)

(assert (=> b!553097 m!530115))

(assert (=> b!553097 m!530115))

(declare-fun m!530117 () Bool)

(assert (=> b!553097 m!530117))

(declare-fun m!530119 () Bool)

(assert (=> b!553096 m!530119))

(declare-fun m!530121 () Bool)

(assert (=> b!553096 m!530121))

(declare-fun m!530123 () Bool)

(assert (=> b!553100 m!530123))

(declare-fun m!530125 () Bool)

(assert (=> b!553101 m!530125))

(assert (=> b!553103 m!530115))

(assert (=> b!553103 m!530115))

(declare-fun m!530127 () Bool)

(assert (=> b!553103 m!530127))

(declare-fun m!530129 () Bool)

(assert (=> b!553094 m!530129))

(declare-fun m!530131 () Bool)

(assert (=> b!553099 m!530131))

(assert (=> b!553098 m!530115))

(declare-fun m!530133 () Bool)

(assert (=> b!553098 m!530133))

(assert (=> b!553098 m!530115))

(declare-fun m!530135 () Bool)

(assert (=> b!553098 m!530135))

(declare-fun m!530137 () Bool)

(assert (=> b!553098 m!530137))

(assert (=> b!553098 m!530135))

(declare-fun m!530139 () Bool)

(assert (=> b!553098 m!530139))

(assert (=> b!553098 m!530133))

(assert (=> b!553098 m!530115))

(declare-fun m!530141 () Bool)

(assert (=> b!553098 m!530141))

(declare-fun m!530143 () Bool)

(assert (=> b!553098 m!530143))

(assert (=> b!553098 m!530135))

(assert (=> b!553098 m!530137))

(push 1)

