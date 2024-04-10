; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50842 () Bool)

(assert start!50842)

(declare-fun b!556409 () Bool)

(declare-fun e!320559 () Bool)

(declare-fun e!320560 () Bool)

(assert (=> b!556409 (= e!320559 e!320560)))

(declare-fun res!348829 () Bool)

(assert (=> b!556409 (=> (not res!348829) (not e!320560))))

(declare-datatypes ((SeekEntryResult!5292 0))(
  ( (MissingZero!5292 (index!23395 (_ BitVec 32))) (Found!5292 (index!23396 (_ BitVec 32))) (Intermediate!5292 (undefined!6104 Bool) (index!23397 (_ BitVec 32)) (x!52286 (_ BitVec 32))) (Undefined!5292) (MissingVacant!5292 (index!23398 (_ BitVec 32))) )
))
(declare-fun lt!252870 () SeekEntryResult!5292)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556409 (= res!348829 (or (= lt!252870 (MissingZero!5292 i!1132)) (= lt!252870 (MissingVacant!5292 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35067 0))(
  ( (array!35068 (arr!16843 (Array (_ BitVec 32) (_ BitVec 64))) (size!17207 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35067)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35067 (_ BitVec 32)) SeekEntryResult!5292)

(assert (=> b!556409 (= lt!252870 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!556410 () Bool)

(declare-fun res!348830 () Bool)

(assert (=> b!556410 (=> (not res!348830) (not e!320559))))

(declare-fun arrayContainsKey!0 (array!35067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556410 (= res!348830 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun e!320558 () Bool)

(declare-fun b!556411 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!252874 () SeekEntryResult!5292)

(get-info :version)

(assert (=> b!556411 (= e!320558 (not (or (not ((_ is Intermediate!5292) lt!252874)) (undefined!6104 lt!252874) (= (select (arr!16843 a!3118) (index!23397 lt!252874)) (select (arr!16843 a!3118) j!142)) (= (select (arr!16843 a!3118) (index!23397 lt!252874)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!320561 () Bool)

(assert (=> b!556411 e!320561))

(declare-fun res!348821 () Bool)

(assert (=> b!556411 (=> (not res!348821) (not e!320561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35067 (_ BitVec 32)) Bool)

(assert (=> b!556411 (= res!348821 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17358 0))(
  ( (Unit!17359) )
))
(declare-fun lt!252871 () Unit!17358)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35067 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17358)

(assert (=> b!556411 (= lt!252871 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556412 () Bool)

(declare-fun res!348825 () Bool)

(assert (=> b!556412 (=> (not res!348825) (not e!320559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556412 (= res!348825 (validKeyInArray!0 k0!1914))))

(declare-fun b!556413 () Bool)

(declare-fun res!348828 () Bool)

(assert (=> b!556413 (=> (not res!348828) (not e!320560))))

(assert (=> b!556413 (= res!348828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556414 () Bool)

(declare-fun res!348822 () Bool)

(assert (=> b!556414 (=> (not res!348822) (not e!320559))))

(assert (=> b!556414 (= res!348822 (validKeyInArray!0 (select (arr!16843 a!3118) j!142)))))

(declare-fun res!348826 () Bool)

(assert (=> start!50842 (=> (not res!348826) (not e!320559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50842 (= res!348826 (validMask!0 mask!3119))))

(assert (=> start!50842 e!320559))

(assert (=> start!50842 true))

(declare-fun array_inv!12639 (array!35067) Bool)

(assert (=> start!50842 (array_inv!12639 a!3118)))

(declare-fun b!556415 () Bool)

(declare-fun res!348823 () Bool)

(assert (=> b!556415 (=> (not res!348823) (not e!320559))))

(assert (=> b!556415 (= res!348823 (and (= (size!17207 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17207 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17207 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556416 () Bool)

(assert (=> b!556416 (= e!320560 e!320558)))

(declare-fun res!348827 () Bool)

(assert (=> b!556416 (=> (not res!348827) (not e!320558))))

(declare-fun lt!252873 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35067 (_ BitVec 32)) SeekEntryResult!5292)

(assert (=> b!556416 (= res!348827 (= lt!252874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252873 (select (store (arr!16843 a!3118) i!1132 k0!1914) j!142) (array!35068 (store (arr!16843 a!3118) i!1132 k0!1914) (size!17207 a!3118)) mask!3119)))))

(declare-fun lt!252872 () (_ BitVec 32))

(assert (=> b!556416 (= lt!252874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252872 (select (arr!16843 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556416 (= lt!252873 (toIndex!0 (select (store (arr!16843 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!556416 (= lt!252872 (toIndex!0 (select (arr!16843 a!3118) j!142) mask!3119))))

(declare-fun b!556417 () Bool)

(declare-fun res!348824 () Bool)

(assert (=> b!556417 (=> (not res!348824) (not e!320560))))

(declare-datatypes ((List!10923 0))(
  ( (Nil!10920) (Cons!10919 (h!11904 (_ BitVec 64)) (t!17151 List!10923)) )
))
(declare-fun arrayNoDuplicates!0 (array!35067 (_ BitVec 32) List!10923) Bool)

(assert (=> b!556417 (= res!348824 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10920))))

(declare-fun b!556418 () Bool)

(assert (=> b!556418 (= e!320561 (= (seekEntryOrOpen!0 (select (arr!16843 a!3118) j!142) a!3118 mask!3119) (Found!5292 j!142)))))

(assert (= (and start!50842 res!348826) b!556415))

(assert (= (and b!556415 res!348823) b!556414))

(assert (= (and b!556414 res!348822) b!556412))

(assert (= (and b!556412 res!348825) b!556410))

(assert (= (and b!556410 res!348830) b!556409))

(assert (= (and b!556409 res!348829) b!556413))

(assert (= (and b!556413 res!348828) b!556417))

(assert (= (and b!556417 res!348824) b!556416))

(assert (= (and b!556416 res!348827) b!556411))

(assert (= (and b!556411 res!348821) b!556418))

(declare-fun m!534395 () Bool)

(assert (=> b!556417 m!534395))

(declare-fun m!534397 () Bool)

(assert (=> b!556411 m!534397))

(declare-fun m!534399 () Bool)

(assert (=> b!556411 m!534399))

(declare-fun m!534401 () Bool)

(assert (=> b!556411 m!534401))

(declare-fun m!534403 () Bool)

(assert (=> b!556411 m!534403))

(declare-fun m!534405 () Bool)

(assert (=> b!556410 m!534405))

(assert (=> b!556414 m!534399))

(assert (=> b!556414 m!534399))

(declare-fun m!534407 () Bool)

(assert (=> b!556414 m!534407))

(assert (=> b!556416 m!534399))

(declare-fun m!534409 () Bool)

(assert (=> b!556416 m!534409))

(declare-fun m!534411 () Bool)

(assert (=> b!556416 m!534411))

(assert (=> b!556416 m!534411))

(declare-fun m!534413 () Bool)

(assert (=> b!556416 m!534413))

(declare-fun m!534415 () Bool)

(assert (=> b!556416 m!534415))

(assert (=> b!556416 m!534411))

(declare-fun m!534417 () Bool)

(assert (=> b!556416 m!534417))

(assert (=> b!556416 m!534399))

(declare-fun m!534419 () Bool)

(assert (=> b!556416 m!534419))

(assert (=> b!556416 m!534399))

(declare-fun m!534421 () Bool)

(assert (=> b!556413 m!534421))

(declare-fun m!534423 () Bool)

(assert (=> b!556409 m!534423))

(declare-fun m!534425 () Bool)

(assert (=> b!556412 m!534425))

(assert (=> b!556418 m!534399))

(assert (=> b!556418 m!534399))

(declare-fun m!534427 () Bool)

(assert (=> b!556418 m!534427))

(declare-fun m!534429 () Bool)

(assert (=> start!50842 m!534429))

(declare-fun m!534431 () Bool)

(assert (=> start!50842 m!534431))

(check-sat (not b!556414) (not b!556416) (not b!556413) (not b!556418) (not b!556410) (not b!556409) (not b!556411) (not start!50842) (not b!556417) (not b!556412))
(check-sat)
