; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52862 () Bool)

(assert start!52862)

(declare-fun b!576091 () Bool)

(declare-fun res!364475 () Bool)

(declare-fun e!331435 () Bool)

(assert (=> b!576091 (=> (not res!364475) (not e!331435))))

(declare-datatypes ((array!35959 0))(
  ( (array!35960 (arr!17261 (Array (_ BitVec 32) (_ BitVec 64))) (size!17626 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35959)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576091 (= res!364475 (validKeyInArray!0 (select (arr!17261 a!3118) j!142)))))

(declare-fun res!364474 () Bool)

(assert (=> start!52862 (=> (not res!364474) (not e!331435))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52862 (= res!364474 (validMask!0 mask!3119))))

(assert (=> start!52862 e!331435))

(assert (=> start!52862 true))

(declare-fun array_inv!13144 (array!35959) Bool)

(assert (=> start!52862 (array_inv!13144 a!3118)))

(declare-fun b!576092 () Bool)

(declare-fun res!364473 () Bool)

(declare-fun e!331436 () Bool)

(assert (=> b!576092 (=> (not res!364473) (not e!331436))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5707 0))(
  ( (MissingZero!5707 (index!25055 (_ BitVec 32))) (Found!5707 (index!25056 (_ BitVec 32))) (Intermediate!5707 (undefined!6519 Bool) (index!25057 (_ BitVec 32)) (x!53957 (_ BitVec 32))) (Undefined!5707) (MissingVacant!5707 (index!25058 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35959 (_ BitVec 32)) SeekEntryResult!5707)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576092 (= res!364473 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17261 a!3118) j!142) mask!3119) (select (arr!17261 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17261 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17261 a!3118) i!1132 k0!1914) j!142) (array!35960 (store (arr!17261 a!3118) i!1132 k0!1914) (size!17626 a!3118)) mask!3119)))))

(declare-fun b!576093 () Bool)

(declare-fun res!364466 () Bool)

(assert (=> b!576093 (=> (not res!364466) (not e!331435))))

(assert (=> b!576093 (= res!364466 (validKeyInArray!0 k0!1914))))

(declare-fun b!576094 () Bool)

(declare-fun res!364472 () Bool)

(assert (=> b!576094 (=> (not res!364472) (not e!331435))))

(declare-fun arrayContainsKey!0 (array!35959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576094 (= res!364472 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576095 () Bool)

(declare-fun e!331437 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35959 (_ BitVec 32)) SeekEntryResult!5707)

(assert (=> b!576095 (= e!331437 (= (seekEntryOrOpen!0 (select (arr!17261 a!3118) j!142) a!3118 mask!3119) (Found!5707 j!142)))))

(declare-fun b!576096 () Bool)

(assert (=> b!576096 (= e!331435 e!331436)))

(declare-fun res!364469 () Bool)

(assert (=> b!576096 (=> (not res!364469) (not e!331436))))

(declare-fun lt!263412 () SeekEntryResult!5707)

(assert (=> b!576096 (= res!364469 (or (= lt!263412 (MissingZero!5707 i!1132)) (= lt!263412 (MissingVacant!5707 i!1132))))))

(assert (=> b!576096 (= lt!263412 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!576097 () Bool)

(declare-fun res!364471 () Bool)

(assert (=> b!576097 (=> (not res!364471) (not e!331436))))

(declare-datatypes ((List!11380 0))(
  ( (Nil!11377) (Cons!11376 (h!12418 (_ BitVec 64)) (t!17599 List!11380)) )
))
(declare-fun arrayNoDuplicates!0 (array!35959 (_ BitVec 32) List!11380) Bool)

(assert (=> b!576097 (= res!364471 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11377))))

(declare-fun b!576098 () Bool)

(declare-fun res!364470 () Bool)

(assert (=> b!576098 (=> (not res!364470) (not e!331436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35959 (_ BitVec 32)) Bool)

(assert (=> b!576098 (= res!364470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576099 () Bool)

(assert (=> b!576099 (= e!331436 (not true))))

(assert (=> b!576099 e!331437))

(declare-fun res!364468 () Bool)

(assert (=> b!576099 (=> (not res!364468) (not e!331437))))

(assert (=> b!576099 (= res!364468 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18102 0))(
  ( (Unit!18103) )
))
(declare-fun lt!263413 () Unit!18102)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35959 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18102)

(assert (=> b!576099 (= lt!263413 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576100 () Bool)

(declare-fun res!364467 () Bool)

(assert (=> b!576100 (=> (not res!364467) (not e!331435))))

(assert (=> b!576100 (= res!364467 (and (= (size!17626 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17626 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17626 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52862 res!364474) b!576100))

(assert (= (and b!576100 res!364467) b!576091))

(assert (= (and b!576091 res!364475) b!576093))

(assert (= (and b!576093 res!364466) b!576094))

(assert (= (and b!576094 res!364472) b!576096))

(assert (= (and b!576096 res!364469) b!576098))

(assert (= (and b!576098 res!364470) b!576097))

(assert (= (and b!576097 res!364471) b!576092))

(assert (= (and b!576092 res!364473) b!576099))

(assert (= (and b!576099 res!364468) b!576095))

(declare-fun m!554537 () Bool)

(assert (=> b!576096 m!554537))

(declare-fun m!554539 () Bool)

(assert (=> b!576099 m!554539))

(declare-fun m!554541 () Bool)

(assert (=> b!576099 m!554541))

(declare-fun m!554543 () Bool)

(assert (=> start!52862 m!554543))

(declare-fun m!554545 () Bool)

(assert (=> start!52862 m!554545))

(declare-fun m!554547 () Bool)

(assert (=> b!576093 m!554547))

(declare-fun m!554549 () Bool)

(assert (=> b!576095 m!554549))

(assert (=> b!576095 m!554549))

(declare-fun m!554551 () Bool)

(assert (=> b!576095 m!554551))

(declare-fun m!554553 () Bool)

(assert (=> b!576094 m!554553))

(declare-fun m!554555 () Bool)

(assert (=> b!576098 m!554555))

(declare-fun m!554557 () Bool)

(assert (=> b!576097 m!554557))

(assert (=> b!576092 m!554549))

(declare-fun m!554559 () Bool)

(assert (=> b!576092 m!554559))

(assert (=> b!576092 m!554549))

(declare-fun m!554561 () Bool)

(assert (=> b!576092 m!554561))

(declare-fun m!554563 () Bool)

(assert (=> b!576092 m!554563))

(assert (=> b!576092 m!554561))

(declare-fun m!554565 () Bool)

(assert (=> b!576092 m!554565))

(assert (=> b!576092 m!554559))

(assert (=> b!576092 m!554549))

(declare-fun m!554567 () Bool)

(assert (=> b!576092 m!554567))

(declare-fun m!554569 () Bool)

(assert (=> b!576092 m!554569))

(assert (=> b!576092 m!554561))

(assert (=> b!576092 m!554563))

(assert (=> b!576091 m!554549))

(assert (=> b!576091 m!554549))

(declare-fun m!554571 () Bool)

(assert (=> b!576091 m!554571))

(check-sat (not b!576099) (not start!52862) (not b!576095) (not b!576093) (not b!576096) (not b!576098) (not b!576094) (not b!576097) (not b!576091) (not b!576092))
(check-sat)
