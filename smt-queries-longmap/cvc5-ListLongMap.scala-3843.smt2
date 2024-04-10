; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52868 () Bool)

(assert start!52868)

(declare-fun b!576272 () Bool)

(declare-fun res!364507 () Bool)

(declare-fun e!331572 () Bool)

(assert (=> b!576272 (=> (not res!364507) (not e!331572))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35956 0))(
  ( (array!35957 (arr!17259 (Array (_ BitVec 32) (_ BitVec 64))) (size!17623 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35956)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5708 0))(
  ( (MissingZero!5708 (index!25059 (_ BitVec 32))) (Found!5708 (index!25060 (_ BitVec 32))) (Intermediate!5708 (undefined!6520 Bool) (index!25061 (_ BitVec 32)) (x!53955 (_ BitVec 32))) (Undefined!5708) (MissingVacant!5708 (index!25062 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35956 (_ BitVec 32)) SeekEntryResult!5708)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576272 (= res!364507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17259 a!3118) j!142) mask!3119) (select (arr!17259 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17259 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17259 a!3118) i!1132 k!1914) j!142) (array!35957 (store (arr!17259 a!3118) i!1132 k!1914) (size!17623 a!3118)) mask!3119)))))

(declare-fun b!576273 () Bool)

(declare-fun res!364511 () Bool)

(declare-fun e!331573 () Bool)

(assert (=> b!576273 (=> (not res!364511) (not e!331573))))

(declare-fun arrayContainsKey!0 (array!35956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576273 (= res!364511 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576274 () Bool)

(declare-fun res!364510 () Bool)

(assert (=> b!576274 (=> (not res!364510) (not e!331572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35956 (_ BitVec 32)) Bool)

(assert (=> b!576274 (= res!364510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576275 () Bool)

(declare-fun res!364513 () Bool)

(assert (=> b!576275 (=> (not res!364513) (not e!331573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576275 (= res!364513 (validKeyInArray!0 k!1914))))

(declare-fun b!576276 () Bool)

(assert (=> b!576276 (= e!331572 (not true))))

(declare-fun e!331574 () Bool)

(assert (=> b!576276 e!331574))

(declare-fun res!364505 () Bool)

(assert (=> b!576276 (=> (not res!364505) (not e!331574))))

(assert (=> b!576276 (= res!364505 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18118 0))(
  ( (Unit!18119) )
))
(declare-fun lt!263629 () Unit!18118)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18118)

(assert (=> b!576276 (= lt!263629 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576277 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35956 (_ BitVec 32)) SeekEntryResult!5708)

(assert (=> b!576277 (= e!331574 (= (seekEntryOrOpen!0 (select (arr!17259 a!3118) j!142) a!3118 mask!3119) (Found!5708 j!142)))))

(declare-fun b!576278 () Bool)

(assert (=> b!576278 (= e!331573 e!331572)))

(declare-fun res!364512 () Bool)

(assert (=> b!576278 (=> (not res!364512) (not e!331572))))

(declare-fun lt!263628 () SeekEntryResult!5708)

(assert (=> b!576278 (= res!364512 (or (= lt!263628 (MissingZero!5708 i!1132)) (= lt!263628 (MissingVacant!5708 i!1132))))))

(assert (=> b!576278 (= lt!263628 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!364514 () Bool)

(assert (=> start!52868 (=> (not res!364514) (not e!331573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52868 (= res!364514 (validMask!0 mask!3119))))

(assert (=> start!52868 e!331573))

(assert (=> start!52868 true))

(declare-fun array_inv!13055 (array!35956) Bool)

(assert (=> start!52868 (array_inv!13055 a!3118)))

(declare-fun b!576279 () Bool)

(declare-fun res!364506 () Bool)

(assert (=> b!576279 (=> (not res!364506) (not e!331572))))

(declare-datatypes ((List!11339 0))(
  ( (Nil!11336) (Cons!11335 (h!12377 (_ BitVec 64)) (t!17567 List!11339)) )
))
(declare-fun arrayNoDuplicates!0 (array!35956 (_ BitVec 32) List!11339) Bool)

(assert (=> b!576279 (= res!364506 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11336))))

(declare-fun b!576280 () Bool)

(declare-fun res!364509 () Bool)

(assert (=> b!576280 (=> (not res!364509) (not e!331573))))

(assert (=> b!576280 (= res!364509 (and (= (size!17623 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17623 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17623 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576281 () Bool)

(declare-fun res!364508 () Bool)

(assert (=> b!576281 (=> (not res!364508) (not e!331573))))

(assert (=> b!576281 (= res!364508 (validKeyInArray!0 (select (arr!17259 a!3118) j!142)))))

(assert (= (and start!52868 res!364514) b!576280))

(assert (= (and b!576280 res!364509) b!576281))

(assert (= (and b!576281 res!364508) b!576275))

(assert (= (and b!576275 res!364513) b!576273))

(assert (= (and b!576273 res!364511) b!576278))

(assert (= (and b!576278 res!364512) b!576274))

(assert (= (and b!576274 res!364510) b!576279))

(assert (= (and b!576279 res!364506) b!576272))

(assert (= (and b!576272 res!364507) b!576276))

(assert (= (and b!576276 res!364505) b!576277))

(declare-fun m!555201 () Bool)

(assert (=> b!576278 m!555201))

(declare-fun m!555203 () Bool)

(assert (=> start!52868 m!555203))

(declare-fun m!555205 () Bool)

(assert (=> start!52868 m!555205))

(declare-fun m!555207 () Bool)

(assert (=> b!576274 m!555207))

(declare-fun m!555209 () Bool)

(assert (=> b!576272 m!555209))

(declare-fun m!555211 () Bool)

(assert (=> b!576272 m!555211))

(assert (=> b!576272 m!555209))

(declare-fun m!555213 () Bool)

(assert (=> b!576272 m!555213))

(declare-fun m!555215 () Bool)

(assert (=> b!576272 m!555215))

(assert (=> b!576272 m!555213))

(declare-fun m!555217 () Bool)

(assert (=> b!576272 m!555217))

(assert (=> b!576272 m!555211))

(assert (=> b!576272 m!555209))

(declare-fun m!555219 () Bool)

(assert (=> b!576272 m!555219))

(declare-fun m!555221 () Bool)

(assert (=> b!576272 m!555221))

(assert (=> b!576272 m!555213))

(assert (=> b!576272 m!555215))

(declare-fun m!555223 () Bool)

(assert (=> b!576276 m!555223))

(declare-fun m!555225 () Bool)

(assert (=> b!576276 m!555225))

(assert (=> b!576277 m!555209))

(assert (=> b!576277 m!555209))

(declare-fun m!555227 () Bool)

(assert (=> b!576277 m!555227))

(declare-fun m!555229 () Bool)

(assert (=> b!576279 m!555229))

(declare-fun m!555231 () Bool)

(assert (=> b!576273 m!555231))

(declare-fun m!555233 () Bool)

(assert (=> b!576275 m!555233))

(assert (=> b!576281 m!555209))

(assert (=> b!576281 m!555209))

(declare-fun m!555235 () Bool)

(assert (=> b!576281 m!555235))

(push 1)

