; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51494 () Bool)

(assert start!51494)

(declare-fun b!563255 () Bool)

(declare-fun res!354411 () Bool)

(declare-fun e!324610 () Bool)

(assert (=> b!563255 (=> (not res!354411) (not e!324610))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35359 0))(
  ( (array!35360 (arr!16980 (Array (_ BitVec 32) (_ BitVec 64))) (size!17344 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35359)

(assert (=> b!563255 (= res!354411 (and (= (size!17344 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17344 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17344 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563256 () Bool)

(declare-fun res!354415 () Bool)

(declare-fun e!324609 () Bool)

(assert (=> b!563256 (=> (not res!354415) (not e!324609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35359 (_ BitVec 32)) Bool)

(assert (=> b!563256 (= res!354415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563257 () Bool)

(declare-fun res!354416 () Bool)

(assert (=> b!563257 (=> (not res!354416) (not e!324610))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563257 (= res!354416 (validKeyInArray!0 k!1914))))

(declare-fun res!354408 () Bool)

(assert (=> start!51494 (=> (not res!354408) (not e!324610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51494 (= res!354408 (validMask!0 mask!3119))))

(assert (=> start!51494 e!324610))

(assert (=> start!51494 true))

(declare-fun array_inv!12776 (array!35359) Bool)

(assert (=> start!51494 (array_inv!12776 a!3118)))

(declare-fun b!563258 () Bool)

(declare-fun res!354410 () Bool)

(assert (=> b!563258 (=> (not res!354410) (not e!324610))))

(assert (=> b!563258 (= res!354410 (validKeyInArray!0 (select (arr!16980 a!3118) j!142)))))

(declare-fun b!563259 () Bool)

(declare-fun res!354407 () Bool)

(assert (=> b!563259 (=> (not res!354407) (not e!324609))))

(declare-datatypes ((List!11060 0))(
  ( (Nil!11057) (Cons!11056 (h!12059 (_ BitVec 64)) (t!17288 List!11060)) )
))
(declare-fun arrayNoDuplicates!0 (array!35359 (_ BitVec 32) List!11060) Bool)

(assert (=> b!563259 (= res!354407 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11057))))

(declare-fun b!563260 () Bool)

(declare-fun res!354413 () Bool)

(assert (=> b!563260 (=> (not res!354413) (not e!324609))))

(declare-datatypes ((SeekEntryResult!5429 0))(
  ( (MissingZero!5429 (index!23943 (_ BitVec 32))) (Found!5429 (index!23944 (_ BitVec 32))) (Intermediate!5429 (undefined!6241 Bool) (index!23945 (_ BitVec 32)) (x!52836 (_ BitVec 32))) (Undefined!5429) (MissingVacant!5429 (index!23946 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35359 (_ BitVec 32)) SeekEntryResult!5429)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563260 (= res!354413 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16980 a!3118) j!142) mask!3119) (select (arr!16980 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16980 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16980 a!3118) i!1132 k!1914) j!142) (array!35360 (store (arr!16980 a!3118) i!1132 k!1914) (size!17344 a!3118)) mask!3119)))))

(declare-fun b!563261 () Bool)

(declare-fun res!354409 () Bool)

(assert (=> b!563261 (=> (not res!354409) (not e!324610))))

(declare-fun arrayContainsKey!0 (array!35359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563261 (= res!354409 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563262 () Bool)

(assert (=> b!563262 (= e!324610 e!324609)))

(declare-fun res!354414 () Bool)

(assert (=> b!563262 (=> (not res!354414) (not e!324609))))

(declare-fun lt!257160 () SeekEntryResult!5429)

(assert (=> b!563262 (= res!354414 (or (= lt!257160 (MissingZero!5429 i!1132)) (= lt!257160 (MissingVacant!5429 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35359 (_ BitVec 32)) SeekEntryResult!5429)

(assert (=> b!563262 (= lt!257160 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563263 () Bool)

(declare-fun e!324612 () Bool)

(assert (=> b!563263 (= e!324612 (= (seekEntryOrOpen!0 (select (arr!16980 a!3118) j!142) a!3118 mask!3119) (Found!5429 j!142)))))

(declare-fun b!563264 () Bool)

(assert (=> b!563264 (= e!324609 (not true))))

(assert (=> b!563264 e!324612))

(declare-fun res!354412 () Bool)

(assert (=> b!563264 (=> (not res!354412) (not e!324612))))

(assert (=> b!563264 (= res!354412 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17632 0))(
  ( (Unit!17633) )
))
(declare-fun lt!257161 () Unit!17632)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17632)

(assert (=> b!563264 (= lt!257161 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51494 res!354408) b!563255))

(assert (= (and b!563255 res!354411) b!563258))

(assert (= (and b!563258 res!354410) b!563257))

(assert (= (and b!563257 res!354416) b!563261))

(assert (= (and b!563261 res!354409) b!563262))

(assert (= (and b!563262 res!354414) b!563256))

(assert (= (and b!563256 res!354415) b!563259))

(assert (= (and b!563259 res!354407) b!563260))

(assert (= (and b!563260 res!354413) b!563264))

(assert (= (and b!563264 res!354412) b!563263))

(declare-fun m!541563 () Bool)

(assert (=> b!563260 m!541563))

(declare-fun m!541565 () Bool)

(assert (=> b!563260 m!541565))

(assert (=> b!563260 m!541563))

(declare-fun m!541567 () Bool)

(assert (=> b!563260 m!541567))

(declare-fun m!541569 () Bool)

(assert (=> b!563260 m!541569))

(assert (=> b!563260 m!541567))

(declare-fun m!541571 () Bool)

(assert (=> b!563260 m!541571))

(assert (=> b!563260 m!541565))

(assert (=> b!563260 m!541563))

(declare-fun m!541573 () Bool)

(assert (=> b!563260 m!541573))

(declare-fun m!541575 () Bool)

(assert (=> b!563260 m!541575))

(assert (=> b!563260 m!541567))

(assert (=> b!563260 m!541569))

(assert (=> b!563258 m!541563))

(assert (=> b!563258 m!541563))

(declare-fun m!541577 () Bool)

(assert (=> b!563258 m!541577))

(declare-fun m!541579 () Bool)

(assert (=> b!563262 m!541579))

(declare-fun m!541581 () Bool)

(assert (=> b!563257 m!541581))

(assert (=> b!563263 m!541563))

(assert (=> b!563263 m!541563))

(declare-fun m!541583 () Bool)

(assert (=> b!563263 m!541583))

(declare-fun m!541585 () Bool)

(assert (=> start!51494 m!541585))

(declare-fun m!541587 () Bool)

(assert (=> start!51494 m!541587))

(declare-fun m!541589 () Bool)

(assert (=> b!563261 m!541589))

(declare-fun m!541591 () Bool)

(assert (=> b!563256 m!541591))

(declare-fun m!541593 () Bool)

(assert (=> b!563264 m!541593))

(declare-fun m!541595 () Bool)

(assert (=> b!563264 m!541595))

(declare-fun m!541597 () Bool)

(assert (=> b!563259 m!541597))

(push 1)

