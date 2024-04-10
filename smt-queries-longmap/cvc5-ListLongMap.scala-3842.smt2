; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52862 () Bool)

(assert start!52862)

(declare-fun b!576182 () Bool)

(declare-fun res!364415 () Bool)

(declare-fun e!331538 () Bool)

(assert (=> b!576182 (=> (not res!364415) (not e!331538))))

(declare-datatypes ((array!35950 0))(
  ( (array!35951 (arr!17256 (Array (_ BitVec 32) (_ BitVec 64))) (size!17620 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35950)

(declare-datatypes ((List!11336 0))(
  ( (Nil!11333) (Cons!11332 (h!12374 (_ BitVec 64)) (t!17564 List!11336)) )
))
(declare-fun arrayNoDuplicates!0 (array!35950 (_ BitVec 32) List!11336) Bool)

(assert (=> b!576182 (= res!364415 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11333))))

(declare-fun b!576183 () Bool)

(assert (=> b!576183 (= e!331538 (not true))))

(declare-fun e!331539 () Bool)

(assert (=> b!576183 e!331539))

(declare-fun res!364416 () Bool)

(assert (=> b!576183 (=> (not res!364416) (not e!331539))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35950 (_ BitVec 32)) Bool)

(assert (=> b!576183 (= res!364416 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18112 0))(
  ( (Unit!18113) )
))
(declare-fun lt!263611 () Unit!18112)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35950 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18112)

(assert (=> b!576183 (= lt!263611 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576184 () Bool)

(declare-fun res!364418 () Bool)

(assert (=> b!576184 (=> (not res!364418) (not e!331538))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5705 0))(
  ( (MissingZero!5705 (index!25047 (_ BitVec 32))) (Found!5705 (index!25048 (_ BitVec 32))) (Intermediate!5705 (undefined!6517 Bool) (index!25049 (_ BitVec 32)) (x!53944 (_ BitVec 32))) (Undefined!5705) (MissingVacant!5705 (index!25050 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35950 (_ BitVec 32)) SeekEntryResult!5705)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576184 (= res!364418 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17256 a!3118) j!142) mask!3119) (select (arr!17256 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17256 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17256 a!3118) i!1132 k!1914) j!142) (array!35951 (store (arr!17256 a!3118) i!1132 k!1914) (size!17620 a!3118)) mask!3119)))))

(declare-fun b!576185 () Bool)

(declare-fun res!364423 () Bool)

(declare-fun e!331536 () Bool)

(assert (=> b!576185 (=> (not res!364423) (not e!331536))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576185 (= res!364423 (validKeyInArray!0 (select (arr!17256 a!3118) j!142)))))

(declare-fun b!576186 () Bool)

(declare-fun res!364420 () Bool)

(assert (=> b!576186 (=> (not res!364420) (not e!331536))))

(assert (=> b!576186 (= res!364420 (and (= (size!17620 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17620 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17620 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576187 () Bool)

(declare-fun res!364422 () Bool)

(assert (=> b!576187 (=> (not res!364422) (not e!331538))))

(assert (=> b!576187 (= res!364422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576188 () Bool)

(declare-fun res!364419 () Bool)

(assert (=> b!576188 (=> (not res!364419) (not e!331536))))

(declare-fun arrayContainsKey!0 (array!35950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576188 (= res!364419 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!364424 () Bool)

(assert (=> start!52862 (=> (not res!364424) (not e!331536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52862 (= res!364424 (validMask!0 mask!3119))))

(assert (=> start!52862 e!331536))

(assert (=> start!52862 true))

(declare-fun array_inv!13052 (array!35950) Bool)

(assert (=> start!52862 (array_inv!13052 a!3118)))

(declare-fun b!576189 () Bool)

(declare-fun res!364417 () Bool)

(assert (=> b!576189 (=> (not res!364417) (not e!331536))))

(assert (=> b!576189 (= res!364417 (validKeyInArray!0 k!1914))))

(declare-fun b!576190 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35950 (_ BitVec 32)) SeekEntryResult!5705)

(assert (=> b!576190 (= e!331539 (= (seekEntryOrOpen!0 (select (arr!17256 a!3118) j!142) a!3118 mask!3119) (Found!5705 j!142)))))

(declare-fun b!576191 () Bool)

(assert (=> b!576191 (= e!331536 e!331538)))

(declare-fun res!364421 () Bool)

(assert (=> b!576191 (=> (not res!364421) (not e!331538))))

(declare-fun lt!263610 () SeekEntryResult!5705)

(assert (=> b!576191 (= res!364421 (or (= lt!263610 (MissingZero!5705 i!1132)) (= lt!263610 (MissingVacant!5705 i!1132))))))

(assert (=> b!576191 (= lt!263610 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!52862 res!364424) b!576186))

(assert (= (and b!576186 res!364420) b!576185))

(assert (= (and b!576185 res!364423) b!576189))

(assert (= (and b!576189 res!364417) b!576188))

(assert (= (and b!576188 res!364419) b!576191))

(assert (= (and b!576191 res!364421) b!576187))

(assert (= (and b!576187 res!364422) b!576182))

(assert (= (and b!576182 res!364415) b!576184))

(assert (= (and b!576184 res!364418) b!576183))

(assert (= (and b!576183 res!364416) b!576190))

(declare-fun m!555093 () Bool)

(assert (=> b!576189 m!555093))

(declare-fun m!555095 () Bool)

(assert (=> b!576188 m!555095))

(declare-fun m!555097 () Bool)

(assert (=> b!576190 m!555097))

(assert (=> b!576190 m!555097))

(declare-fun m!555099 () Bool)

(assert (=> b!576190 m!555099))

(declare-fun m!555101 () Bool)

(assert (=> b!576191 m!555101))

(declare-fun m!555103 () Bool)

(assert (=> b!576187 m!555103))

(declare-fun m!555105 () Bool)

(assert (=> b!576183 m!555105))

(declare-fun m!555107 () Bool)

(assert (=> b!576183 m!555107))

(assert (=> b!576184 m!555097))

(declare-fun m!555109 () Bool)

(assert (=> b!576184 m!555109))

(assert (=> b!576184 m!555097))

(declare-fun m!555111 () Bool)

(assert (=> b!576184 m!555111))

(declare-fun m!555113 () Bool)

(assert (=> b!576184 m!555113))

(assert (=> b!576184 m!555111))

(declare-fun m!555115 () Bool)

(assert (=> b!576184 m!555115))

(assert (=> b!576184 m!555109))

(assert (=> b!576184 m!555097))

(declare-fun m!555117 () Bool)

(assert (=> b!576184 m!555117))

(declare-fun m!555119 () Bool)

(assert (=> b!576184 m!555119))

(assert (=> b!576184 m!555111))

(assert (=> b!576184 m!555113))

(assert (=> b!576185 m!555097))

(assert (=> b!576185 m!555097))

(declare-fun m!555121 () Bool)

(assert (=> b!576185 m!555121))

(declare-fun m!555123 () Bool)

(assert (=> start!52862 m!555123))

(declare-fun m!555125 () Bool)

(assert (=> start!52862 m!555125))

(declare-fun m!555127 () Bool)

(assert (=> b!576182 m!555127))

(push 1)

