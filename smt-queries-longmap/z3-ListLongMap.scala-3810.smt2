; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52326 () Bool)

(assert start!52326)

(declare-fun b!570624 () Bool)

(declare-fun e!328209 () Bool)

(declare-fun e!328207 () Bool)

(assert (=> b!570624 (= e!328209 e!328207)))

(declare-fun res!360306 () Bool)

(assert (=> b!570624 (=> (not res!360306) (not e!328207))))

(declare-datatypes ((SeekEntryResult!5560 0))(
  ( (MissingZero!5560 (index!24467 (_ BitVec 32))) (Found!5560 (index!24468 (_ BitVec 32))) (Intermediate!5560 (undefined!6372 Bool) (index!24469 (_ BitVec 32)) (x!53495 (_ BitVec 32))) (Undefined!5560) (MissingVacant!5560 (index!24470 (_ BitVec 32))) )
))
(declare-fun lt!260135 () SeekEntryResult!5560)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!570624 (= res!360306 (or (= lt!260135 (MissingZero!5560 i!1132)) (= lt!260135 (MissingVacant!5560 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35733 0))(
  ( (array!35734 (arr!17155 (Array (_ BitVec 32) (_ BitVec 64))) (size!17519 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35733)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35733 (_ BitVec 32)) SeekEntryResult!5560)

(assert (=> b!570624 (= lt!260135 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!360305 () Bool)

(assert (=> start!52326 (=> (not res!360305) (not e!328209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52326 (= res!360305 (validMask!0 mask!3119))))

(assert (=> start!52326 e!328209))

(assert (=> start!52326 true))

(declare-fun array_inv!13014 (array!35733) Bool)

(assert (=> start!52326 (array_inv!13014 a!3118)))

(declare-fun b!570625 () Bool)

(declare-fun res!360309 () Bool)

(assert (=> b!570625 (=> (not res!360309) (not e!328209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570625 (= res!360309 (validKeyInArray!0 k0!1914))))

(declare-fun b!570626 () Bool)

(declare-fun res!360300 () Bool)

(assert (=> b!570626 (=> (not res!360300) (not e!328209))))

(declare-fun arrayContainsKey!0 (array!35733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570626 (= res!360300 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570627 () Bool)

(declare-fun e!328208 () Bool)

(assert (=> b!570627 (= e!328208 (not true))))

(declare-fun e!328204 () Bool)

(assert (=> b!570627 e!328204))

(declare-fun res!360310 () Bool)

(assert (=> b!570627 (=> (not res!360310) (not e!328204))))

(declare-fun lt!260138 () SeekEntryResult!5560)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!570627 (= res!360310 (= lt!260138 (Found!5560 j!142)))))

(assert (=> b!570627 (= lt!260138 (seekEntryOrOpen!0 (select (arr!17155 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35733 (_ BitVec 32)) Bool)

(assert (=> b!570627 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17893 0))(
  ( (Unit!17894) )
))
(declare-fun lt!260136 () Unit!17893)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17893)

(assert (=> b!570627 (= lt!260136 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570628 () Bool)

(assert (=> b!570628 (= e!328207 e!328208)))

(declare-fun res!360308 () Bool)

(assert (=> b!570628 (=> (not res!360308) (not e!328208))))

(declare-fun lt!260140 () SeekEntryResult!5560)

(declare-fun lt!260139 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35733 (_ BitVec 32)) SeekEntryResult!5560)

(assert (=> b!570628 (= res!360308 (= lt!260140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260139 (select (store (arr!17155 a!3118) i!1132 k0!1914) j!142) (array!35734 (store (arr!17155 a!3118) i!1132 k0!1914) (size!17519 a!3118)) mask!3119)))))

(declare-fun lt!260137 () (_ BitVec 32))

(assert (=> b!570628 (= lt!260140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260137 (select (arr!17155 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570628 (= lt!260139 (toIndex!0 (select (store (arr!17155 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570628 (= lt!260137 (toIndex!0 (select (arr!17155 a!3118) j!142) mask!3119))))

(declare-fun b!570629 () Bool)

(declare-fun e!328206 () Bool)

(assert (=> b!570629 (= e!328204 e!328206)))

(declare-fun res!360302 () Bool)

(assert (=> b!570629 (=> res!360302 e!328206)))

(get-info :version)

(assert (=> b!570629 (= res!360302 (or (undefined!6372 lt!260140) (not ((_ is Intermediate!5560) lt!260140)) (= (select (arr!17155 a!3118) (index!24469 lt!260140)) (select (arr!17155 a!3118) j!142)) (= (select (arr!17155 a!3118) (index!24469 lt!260140)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570630 () Bool)

(declare-fun res!360301 () Bool)

(assert (=> b!570630 (=> (not res!360301) (not e!328209))))

(assert (=> b!570630 (= res!360301 (and (= (size!17519 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17519 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17519 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570631 () Bool)

(declare-fun res!360304 () Bool)

(assert (=> b!570631 (=> (not res!360304) (not e!328207))))

(declare-datatypes ((List!11142 0))(
  ( (Nil!11139) (Cons!11138 (h!12165 (_ BitVec 64)) (t!17362 List!11142)) )
))
(declare-fun arrayNoDuplicates!0 (array!35733 (_ BitVec 32) List!11142) Bool)

(assert (=> b!570631 (= res!360304 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11139))))

(declare-fun b!570632 () Bool)

(declare-fun res!360303 () Bool)

(assert (=> b!570632 (=> (not res!360303) (not e!328207))))

(assert (=> b!570632 (= res!360303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570633 () Bool)

(declare-fun res!360307 () Bool)

(assert (=> b!570633 (=> (not res!360307) (not e!328209))))

(assert (=> b!570633 (= res!360307 (validKeyInArray!0 (select (arr!17155 a!3118) j!142)))))

(declare-fun b!570634 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35733 (_ BitVec 32)) SeekEntryResult!5560)

(assert (=> b!570634 (= e!328206 (= lt!260138 (seekKeyOrZeroReturnVacant!0 (x!53495 lt!260140) (index!24469 lt!260140) (index!24469 lt!260140) (select (arr!17155 a!3118) j!142) a!3118 mask!3119)))))

(assert (= (and start!52326 res!360305) b!570630))

(assert (= (and b!570630 res!360301) b!570633))

(assert (= (and b!570633 res!360307) b!570625))

(assert (= (and b!570625 res!360309) b!570626))

(assert (= (and b!570626 res!360300) b!570624))

(assert (= (and b!570624 res!360306) b!570632))

(assert (= (and b!570632 res!360303) b!570631))

(assert (= (and b!570631 res!360304) b!570628))

(assert (= (and b!570628 res!360308) b!570627))

(assert (= (and b!570627 res!360310) b!570629))

(assert (= (and b!570629 (not res!360302)) b!570634))

(declare-fun m!549587 () Bool)

(assert (=> b!570627 m!549587))

(assert (=> b!570627 m!549587))

(declare-fun m!549589 () Bool)

(assert (=> b!570627 m!549589))

(declare-fun m!549591 () Bool)

(assert (=> b!570627 m!549591))

(declare-fun m!549593 () Bool)

(assert (=> b!570627 m!549593))

(declare-fun m!549595 () Bool)

(assert (=> b!570624 m!549595))

(assert (=> b!570634 m!549587))

(assert (=> b!570634 m!549587))

(declare-fun m!549597 () Bool)

(assert (=> b!570634 m!549597))

(assert (=> b!570633 m!549587))

(assert (=> b!570633 m!549587))

(declare-fun m!549599 () Bool)

(assert (=> b!570633 m!549599))

(declare-fun m!549601 () Bool)

(assert (=> b!570629 m!549601))

(assert (=> b!570629 m!549587))

(assert (=> b!570628 m!549587))

(declare-fun m!549603 () Bool)

(assert (=> b!570628 m!549603))

(declare-fun m!549605 () Bool)

(assert (=> b!570628 m!549605))

(declare-fun m!549607 () Bool)

(assert (=> b!570628 m!549607))

(assert (=> b!570628 m!549587))

(assert (=> b!570628 m!549605))

(assert (=> b!570628 m!549587))

(declare-fun m!549609 () Bool)

(assert (=> b!570628 m!549609))

(declare-fun m!549611 () Bool)

(assert (=> b!570628 m!549611))

(assert (=> b!570628 m!549605))

(declare-fun m!549613 () Bool)

(assert (=> b!570628 m!549613))

(declare-fun m!549615 () Bool)

(assert (=> b!570625 m!549615))

(declare-fun m!549617 () Bool)

(assert (=> b!570632 m!549617))

(declare-fun m!549619 () Bool)

(assert (=> start!52326 m!549619))

(declare-fun m!549621 () Bool)

(assert (=> start!52326 m!549621))

(declare-fun m!549623 () Bool)

(assert (=> b!570626 m!549623))

(declare-fun m!549625 () Bool)

(assert (=> b!570631 m!549625))

(check-sat (not b!570631) (not b!570625) (not b!570633) (not b!570628) (not b!570624) (not b!570626) (not start!52326) (not b!570627) (not b!570632) (not b!570634))
(check-sat)
