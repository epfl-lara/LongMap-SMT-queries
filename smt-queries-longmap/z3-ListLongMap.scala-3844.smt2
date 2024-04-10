; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52876 () Bool)

(assert start!52876)

(declare-fun b!576392 () Bool)

(declare-fun res!364628 () Bool)

(declare-fun e!331622 () Bool)

(assert (=> b!576392 (=> (not res!364628) (not e!331622))))

(declare-datatypes ((array!35964 0))(
  ( (array!35965 (arr!17263 (Array (_ BitVec 32) (_ BitVec 64))) (size!17627 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35964)

(declare-datatypes ((List!11343 0))(
  ( (Nil!11340) (Cons!11339 (h!12381 (_ BitVec 64)) (t!17571 List!11343)) )
))
(declare-fun arrayNoDuplicates!0 (array!35964 (_ BitVec 32) List!11343) Bool)

(assert (=> b!576392 (= res!364628 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11340))))

(declare-fun b!576393 () Bool)

(declare-fun res!364634 () Bool)

(assert (=> b!576393 (=> (not res!364634) (not e!331622))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5712 0))(
  ( (MissingZero!5712 (index!25075 (_ BitVec 32))) (Found!5712 (index!25076 (_ BitVec 32))) (Intermediate!5712 (undefined!6524 Bool) (index!25077 (_ BitVec 32)) (x!53967 (_ BitVec 32))) (Undefined!5712) (MissingVacant!5712 (index!25078 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35964 (_ BitVec 32)) SeekEntryResult!5712)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576393 (= res!364634 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17263 a!3118) j!142) mask!3119) (select (arr!17263 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17263 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17263 a!3118) i!1132 k0!1914) j!142) (array!35965 (store (arr!17263 a!3118) i!1132 k0!1914) (size!17627 a!3118)) mask!3119)))))

(declare-fun b!576394 () Bool)

(declare-fun res!364630 () Bool)

(declare-fun e!331620 () Bool)

(assert (=> b!576394 (=> (not res!364630) (not e!331620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576394 (= res!364630 (validKeyInArray!0 (select (arr!17263 a!3118) j!142)))))

(declare-fun res!364627 () Bool)

(assert (=> start!52876 (=> (not res!364627) (not e!331620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52876 (= res!364627 (validMask!0 mask!3119))))

(assert (=> start!52876 e!331620))

(assert (=> start!52876 true))

(declare-fun array_inv!13059 (array!35964) Bool)

(assert (=> start!52876 (array_inv!13059 a!3118)))

(declare-fun b!576395 () Bool)

(declare-fun e!331621 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35964 (_ BitVec 32)) SeekEntryResult!5712)

(assert (=> b!576395 (= e!331621 (= (seekEntryOrOpen!0 (select (arr!17263 a!3118) j!142) a!3118 mask!3119) (Found!5712 j!142)))))

(declare-fun b!576396 () Bool)

(declare-fun res!364631 () Bool)

(assert (=> b!576396 (=> (not res!364631) (not e!331620))))

(assert (=> b!576396 (= res!364631 (validKeyInArray!0 k0!1914))))

(declare-fun b!576397 () Bool)

(assert (=> b!576397 (= e!331620 e!331622)))

(declare-fun res!364626 () Bool)

(assert (=> b!576397 (=> (not res!364626) (not e!331622))))

(declare-fun lt!263653 () SeekEntryResult!5712)

(assert (=> b!576397 (= res!364626 (or (= lt!263653 (MissingZero!5712 i!1132)) (= lt!263653 (MissingVacant!5712 i!1132))))))

(assert (=> b!576397 (= lt!263653 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!576398 () Bool)

(assert (=> b!576398 (= e!331622 (not true))))

(assert (=> b!576398 e!331621))

(declare-fun res!364625 () Bool)

(assert (=> b!576398 (=> (not res!364625) (not e!331621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35964 (_ BitVec 32)) Bool)

(assert (=> b!576398 (= res!364625 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18126 0))(
  ( (Unit!18127) )
))
(declare-fun lt!263652 () Unit!18126)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35964 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18126)

(assert (=> b!576398 (= lt!263652 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576399 () Bool)

(declare-fun res!364633 () Bool)

(assert (=> b!576399 (=> (not res!364633) (not e!331620))))

(declare-fun arrayContainsKey!0 (array!35964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576399 (= res!364633 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576400 () Bool)

(declare-fun res!364629 () Bool)

(assert (=> b!576400 (=> (not res!364629) (not e!331620))))

(assert (=> b!576400 (= res!364629 (and (= (size!17627 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17627 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17627 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576401 () Bool)

(declare-fun res!364632 () Bool)

(assert (=> b!576401 (=> (not res!364632) (not e!331622))))

(assert (=> b!576401 (= res!364632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52876 res!364627) b!576400))

(assert (= (and b!576400 res!364629) b!576394))

(assert (= (and b!576394 res!364630) b!576396))

(assert (= (and b!576396 res!364631) b!576399))

(assert (= (and b!576399 res!364633) b!576397))

(assert (= (and b!576397 res!364626) b!576401))

(assert (= (and b!576401 res!364632) b!576392))

(assert (= (and b!576392 res!364628) b!576393))

(assert (= (and b!576393 res!364634) b!576398))

(assert (= (and b!576398 res!364625) b!576395))

(declare-fun m!555345 () Bool)

(assert (=> b!576395 m!555345))

(assert (=> b!576395 m!555345))

(declare-fun m!555347 () Bool)

(assert (=> b!576395 m!555347))

(declare-fun m!555349 () Bool)

(assert (=> b!576401 m!555349))

(declare-fun m!555351 () Bool)

(assert (=> b!576398 m!555351))

(declare-fun m!555353 () Bool)

(assert (=> b!576398 m!555353))

(declare-fun m!555355 () Bool)

(assert (=> b!576396 m!555355))

(assert (=> b!576394 m!555345))

(assert (=> b!576394 m!555345))

(declare-fun m!555357 () Bool)

(assert (=> b!576394 m!555357))

(declare-fun m!555359 () Bool)

(assert (=> b!576399 m!555359))

(declare-fun m!555361 () Bool)

(assert (=> start!52876 m!555361))

(declare-fun m!555363 () Bool)

(assert (=> start!52876 m!555363))

(declare-fun m!555365 () Bool)

(assert (=> b!576397 m!555365))

(declare-fun m!555367 () Bool)

(assert (=> b!576392 m!555367))

(assert (=> b!576393 m!555345))

(declare-fun m!555369 () Bool)

(assert (=> b!576393 m!555369))

(assert (=> b!576393 m!555345))

(declare-fun m!555371 () Bool)

(assert (=> b!576393 m!555371))

(declare-fun m!555373 () Bool)

(assert (=> b!576393 m!555373))

(assert (=> b!576393 m!555371))

(declare-fun m!555375 () Bool)

(assert (=> b!576393 m!555375))

(assert (=> b!576393 m!555369))

(assert (=> b!576393 m!555345))

(declare-fun m!555377 () Bool)

(assert (=> b!576393 m!555377))

(declare-fun m!555379 () Bool)

(assert (=> b!576393 m!555379))

(assert (=> b!576393 m!555371))

(assert (=> b!576393 m!555373))

(check-sat (not b!576393) (not b!576399) (not b!576392) (not b!576394) (not start!52876) (not b!576398) (not b!576401) (not b!576395) (not b!576396) (not b!576397))
(check-sat)
