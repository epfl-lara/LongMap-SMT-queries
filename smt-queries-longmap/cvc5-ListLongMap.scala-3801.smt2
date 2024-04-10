; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52160 () Bool)

(assert start!52160)

(declare-fun b!569319 () Bool)

(declare-fun e!327526 () Bool)

(declare-fun e!327525 () Bool)

(assert (=> b!569319 (= e!327526 e!327525)))

(declare-fun res!359342 () Bool)

(assert (=> b!569319 (=> (not res!359342) (not e!327525))))

(declare-datatypes ((SeekEntryResult!5582 0))(
  ( (MissingZero!5582 (index!24555 (_ BitVec 32))) (Found!5582 (index!24556 (_ BitVec 32))) (Intermediate!5582 (undefined!6394 Bool) (index!24557 (_ BitVec 32)) (x!53433 (_ BitVec 32))) (Undefined!5582) (MissingVacant!5582 (index!24558 (_ BitVec 32))) )
))
(declare-fun lt!259463 () SeekEntryResult!5582)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569319 (= res!359342 (or (= lt!259463 (MissingZero!5582 i!1132)) (= lt!259463 (MissingVacant!5582 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35683 0))(
  ( (array!35684 (arr!17133 (Array (_ BitVec 32) (_ BitVec 64))) (size!17497 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35683)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35683 (_ BitVec 32)) SeekEntryResult!5582)

(assert (=> b!569319 (= lt!259463 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569320 () Bool)

(declare-fun res!359340 () Bool)

(assert (=> b!569320 (=> (not res!359340) (not e!327525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35683 (_ BitVec 32)) Bool)

(assert (=> b!569320 (= res!359340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569321 () Bool)

(declare-fun e!327528 () Bool)

(assert (=> b!569321 (= e!327525 e!327528)))

(declare-fun res!359344 () Bool)

(assert (=> b!569321 (=> (not res!359344) (not e!327528))))

(declare-fun lt!259467 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!259464 () SeekEntryResult!5582)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35683 (_ BitVec 32)) SeekEntryResult!5582)

(assert (=> b!569321 (= res!359344 (= lt!259464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259467 (select (store (arr!17133 a!3118) i!1132 k!1914) j!142) (array!35684 (store (arr!17133 a!3118) i!1132 k!1914) (size!17497 a!3118)) mask!3119)))))

(declare-fun lt!259465 () (_ BitVec 32))

(assert (=> b!569321 (= lt!259464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259465 (select (arr!17133 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569321 (= lt!259467 (toIndex!0 (select (store (arr!17133 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569321 (= lt!259465 (toIndex!0 (select (arr!17133 a!3118) j!142) mask!3119))))

(declare-fun res!359338 () Bool)

(assert (=> start!52160 (=> (not res!359338) (not e!327526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52160 (= res!359338 (validMask!0 mask!3119))))

(assert (=> start!52160 e!327526))

(assert (=> start!52160 true))

(declare-fun array_inv!12929 (array!35683) Bool)

(assert (=> start!52160 (array_inv!12929 a!3118)))

(declare-fun b!569322 () Bool)

(declare-fun res!359337 () Bool)

(assert (=> b!569322 (=> (not res!359337) (not e!327526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569322 (= res!359337 (validKeyInArray!0 k!1914))))

(declare-fun b!569323 () Bool)

(declare-fun res!359343 () Bool)

(assert (=> b!569323 (=> (not res!359343) (not e!327526))))

(assert (=> b!569323 (= res!359343 (and (= (size!17497 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17497 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17497 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569324 () Bool)

(assert (=> b!569324 (= e!327528 (not (or (undefined!6394 lt!259464) (not (is-Intermediate!5582 lt!259464)) (= (select (arr!17133 a!3118) (index!24557 lt!259464)) (select (arr!17133 a!3118) j!142)) (not (= (select (arr!17133 a!3118) (index!24557 lt!259464)) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!259466 () SeekEntryResult!5582)

(assert (=> b!569324 (and (= lt!259466 (Found!5582 j!142)) (or (undefined!6394 lt!259464) (not (is-Intermediate!5582 lt!259464)) (= (select (arr!17133 a!3118) (index!24557 lt!259464)) (select (arr!17133 a!3118) j!142)) (not (= (select (arr!17133 a!3118) (index!24557 lt!259464)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259466 (MissingZero!5582 (index!24557 lt!259464)))))))

(assert (=> b!569324 (= lt!259466 (seekEntryOrOpen!0 (select (arr!17133 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569324 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17866 0))(
  ( (Unit!17867) )
))
(declare-fun lt!259468 () Unit!17866)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17866)

(assert (=> b!569324 (= lt!259468 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569325 () Bool)

(declare-fun res!359341 () Bool)

(assert (=> b!569325 (=> (not res!359341) (not e!327525))))

(declare-datatypes ((List!11213 0))(
  ( (Nil!11210) (Cons!11209 (h!12230 (_ BitVec 64)) (t!17441 List!11213)) )
))
(declare-fun arrayNoDuplicates!0 (array!35683 (_ BitVec 32) List!11213) Bool)

(assert (=> b!569325 (= res!359341 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11210))))

(declare-fun b!569326 () Bool)

(declare-fun res!359345 () Bool)

(assert (=> b!569326 (=> (not res!359345) (not e!327526))))

(declare-fun arrayContainsKey!0 (array!35683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569326 (= res!359345 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569327 () Bool)

(declare-fun res!359339 () Bool)

(assert (=> b!569327 (=> (not res!359339) (not e!327526))))

(assert (=> b!569327 (= res!359339 (validKeyInArray!0 (select (arr!17133 a!3118) j!142)))))

(assert (= (and start!52160 res!359338) b!569323))

(assert (= (and b!569323 res!359343) b!569327))

(assert (= (and b!569327 res!359339) b!569322))

(assert (= (and b!569322 res!359337) b!569326))

(assert (= (and b!569326 res!359345) b!569319))

(assert (= (and b!569319 res!359342) b!569320))

(assert (= (and b!569320 res!359340) b!569325))

(assert (= (and b!569325 res!359341) b!569321))

(assert (= (and b!569321 res!359344) b!569324))

(declare-fun m!548001 () Bool)

(assert (=> start!52160 m!548001))

(declare-fun m!548003 () Bool)

(assert (=> start!52160 m!548003))

(declare-fun m!548005 () Bool)

(assert (=> b!569320 m!548005))

(declare-fun m!548007 () Bool)

(assert (=> b!569321 m!548007))

(declare-fun m!548009 () Bool)

(assert (=> b!569321 m!548009))

(declare-fun m!548011 () Bool)

(assert (=> b!569321 m!548011))

(assert (=> b!569321 m!548009))

(declare-fun m!548013 () Bool)

(assert (=> b!569321 m!548013))

(assert (=> b!569321 m!548009))

(declare-fun m!548015 () Bool)

(assert (=> b!569321 m!548015))

(assert (=> b!569321 m!548007))

(declare-fun m!548017 () Bool)

(assert (=> b!569321 m!548017))

(assert (=> b!569321 m!548007))

(declare-fun m!548019 () Bool)

(assert (=> b!569321 m!548019))

(assert (=> b!569327 m!548007))

(assert (=> b!569327 m!548007))

(declare-fun m!548021 () Bool)

(assert (=> b!569327 m!548021))

(declare-fun m!548023 () Bool)

(assert (=> b!569324 m!548023))

(assert (=> b!569324 m!548007))

(declare-fun m!548025 () Bool)

(assert (=> b!569324 m!548025))

(declare-fun m!548027 () Bool)

(assert (=> b!569324 m!548027))

(assert (=> b!569324 m!548007))

(declare-fun m!548029 () Bool)

(assert (=> b!569324 m!548029))

(declare-fun m!548031 () Bool)

(assert (=> b!569322 m!548031))

(declare-fun m!548033 () Bool)

(assert (=> b!569326 m!548033))

(declare-fun m!548035 () Bool)

(assert (=> b!569319 m!548035))

(declare-fun m!548037 () Bool)

(assert (=> b!569325 m!548037))

(push 1)

