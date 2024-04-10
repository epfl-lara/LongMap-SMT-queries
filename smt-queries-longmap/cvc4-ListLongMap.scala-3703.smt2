; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50838 () Bool)

(assert start!50838)

(declare-fun res!348766 () Bool)

(declare-fun e!320532 () Bool)

(assert (=> start!50838 (=> (not res!348766) (not e!320532))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50838 (= res!348766 (validMask!0 mask!3119))))

(assert (=> start!50838 e!320532))

(assert (=> start!50838 true))

(declare-datatypes ((array!35063 0))(
  ( (array!35064 (arr!16841 (Array (_ BitVec 32) (_ BitVec 64))) (size!17205 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35063)

(declare-fun array_inv!12637 (array!35063) Bool)

(assert (=> start!50838 (array_inv!12637 a!3118)))

(declare-fun b!556349 () Bool)

(declare-fun e!320529 () Bool)

(assert (=> b!556349 (= e!320532 e!320529)))

(declare-fun res!348770 () Bool)

(assert (=> b!556349 (=> (not res!348770) (not e!320529))))

(declare-datatypes ((SeekEntryResult!5290 0))(
  ( (MissingZero!5290 (index!23387 (_ BitVec 32))) (Found!5290 (index!23388 (_ BitVec 32))) (Intermediate!5290 (undefined!6102 Bool) (index!23389 (_ BitVec 32)) (x!52276 (_ BitVec 32))) (Undefined!5290) (MissingVacant!5290 (index!23390 (_ BitVec 32))) )
))
(declare-fun lt!252844 () SeekEntryResult!5290)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556349 (= res!348770 (or (= lt!252844 (MissingZero!5290 i!1132)) (= lt!252844 (MissingVacant!5290 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35063 (_ BitVec 32)) SeekEntryResult!5290)

(assert (=> b!556349 (= lt!252844 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!556350 () Bool)

(declare-fun res!348764 () Bool)

(assert (=> b!556350 (=> (not res!348764) (not e!320529))))

(declare-datatypes ((List!10921 0))(
  ( (Nil!10918) (Cons!10917 (h!11902 (_ BitVec 64)) (t!17149 List!10921)) )
))
(declare-fun arrayNoDuplicates!0 (array!35063 (_ BitVec 32) List!10921) Bool)

(assert (=> b!556350 (= res!348764 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10918))))

(declare-fun b!556351 () Bool)

(declare-fun res!348763 () Bool)

(assert (=> b!556351 (=> (not res!348763) (not e!320532))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556351 (= res!348763 (validKeyInArray!0 (select (arr!16841 a!3118) j!142)))))

(declare-fun b!556352 () Bool)

(declare-fun res!348767 () Bool)

(assert (=> b!556352 (=> (not res!348767) (not e!320529))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35063 (_ BitVec 32)) SeekEntryResult!5290)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556352 (= res!348767 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16841 a!3118) j!142) mask!3119) (select (arr!16841 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16841 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16841 a!3118) i!1132 k!1914) j!142) (array!35064 (store (arr!16841 a!3118) i!1132 k!1914) (size!17205 a!3118)) mask!3119)))))

(declare-fun b!556353 () Bool)

(assert (=> b!556353 (= e!320529 (not true))))

(declare-fun e!320530 () Bool)

(assert (=> b!556353 e!320530))

(declare-fun res!348762 () Bool)

(assert (=> b!556353 (=> (not res!348762) (not e!320530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35063 (_ BitVec 32)) Bool)

(assert (=> b!556353 (= res!348762 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17354 0))(
  ( (Unit!17355) )
))
(declare-fun lt!252843 () Unit!17354)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35063 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17354)

(assert (=> b!556353 (= lt!252843 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556354 () Bool)

(declare-fun res!348765 () Bool)

(assert (=> b!556354 (=> (not res!348765) (not e!320529))))

(assert (=> b!556354 (= res!348765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556355 () Bool)

(declare-fun res!348768 () Bool)

(assert (=> b!556355 (=> (not res!348768) (not e!320532))))

(assert (=> b!556355 (= res!348768 (and (= (size!17205 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17205 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17205 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556356 () Bool)

(declare-fun res!348761 () Bool)

(assert (=> b!556356 (=> (not res!348761) (not e!320532))))

(declare-fun arrayContainsKey!0 (array!35063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556356 (= res!348761 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556357 () Bool)

(declare-fun res!348769 () Bool)

(assert (=> b!556357 (=> (not res!348769) (not e!320532))))

(assert (=> b!556357 (= res!348769 (validKeyInArray!0 k!1914))))

(declare-fun b!556358 () Bool)

(assert (=> b!556358 (= e!320530 (= (seekEntryOrOpen!0 (select (arr!16841 a!3118) j!142) a!3118 mask!3119) (Found!5290 j!142)))))

(assert (= (and start!50838 res!348766) b!556355))

(assert (= (and b!556355 res!348768) b!556351))

(assert (= (and b!556351 res!348763) b!556357))

(assert (= (and b!556357 res!348769) b!556356))

(assert (= (and b!556356 res!348761) b!556349))

(assert (= (and b!556349 res!348770) b!556354))

(assert (= (and b!556354 res!348765) b!556350))

(assert (= (and b!556350 res!348764) b!556352))

(assert (= (and b!556352 res!348767) b!556353))

(assert (= (and b!556353 res!348762) b!556358))

(declare-fun m!534321 () Bool)

(assert (=> start!50838 m!534321))

(declare-fun m!534323 () Bool)

(assert (=> start!50838 m!534323))

(declare-fun m!534325 () Bool)

(assert (=> b!556354 m!534325))

(declare-fun m!534327 () Bool)

(assert (=> b!556357 m!534327))

(declare-fun m!534329 () Bool)

(assert (=> b!556349 m!534329))

(declare-fun m!534331 () Bool)

(assert (=> b!556356 m!534331))

(declare-fun m!534333 () Bool)

(assert (=> b!556351 m!534333))

(assert (=> b!556351 m!534333))

(declare-fun m!534335 () Bool)

(assert (=> b!556351 m!534335))

(declare-fun m!534337 () Bool)

(assert (=> b!556350 m!534337))

(assert (=> b!556358 m!534333))

(assert (=> b!556358 m!534333))

(declare-fun m!534339 () Bool)

(assert (=> b!556358 m!534339))

(assert (=> b!556352 m!534333))

(declare-fun m!534341 () Bool)

(assert (=> b!556352 m!534341))

(assert (=> b!556352 m!534333))

(declare-fun m!534343 () Bool)

(assert (=> b!556352 m!534343))

(declare-fun m!534345 () Bool)

(assert (=> b!556352 m!534345))

(assert (=> b!556352 m!534343))

(declare-fun m!534347 () Bool)

(assert (=> b!556352 m!534347))

(assert (=> b!556352 m!534341))

(assert (=> b!556352 m!534333))

(declare-fun m!534349 () Bool)

(assert (=> b!556352 m!534349))

(declare-fun m!534351 () Bool)

(assert (=> b!556352 m!534351))

(assert (=> b!556352 m!534343))

(assert (=> b!556352 m!534345))

(declare-fun m!534353 () Bool)

(assert (=> b!556353 m!534353))

(declare-fun m!534355 () Bool)

(assert (=> b!556353 m!534355))

(push 1)

