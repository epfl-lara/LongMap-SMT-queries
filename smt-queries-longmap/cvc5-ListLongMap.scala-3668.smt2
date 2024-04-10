; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50624 () Bool)

(assert start!50624)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!553274 () Bool)

(declare-fun e!319176 () Bool)

(declare-datatypes ((array!34849 0))(
  ( (array!34850 (arr!16734 (Array (_ BitVec 32) (_ BitVec 64))) (size!17098 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34849)

(declare-datatypes ((SeekEntryResult!5183 0))(
  ( (MissingZero!5183 (index!22959 (_ BitVec 32))) (Found!5183 (index!22960 (_ BitVec 32))) (Intermediate!5183 (undefined!5995 Bool) (index!22961 (_ BitVec 32)) (x!51889 (_ BitVec 32))) (Undefined!5183) (MissingVacant!5183 (index!22962 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34849 (_ BitVec 32)) SeekEntryResult!5183)

(assert (=> b!553274 (= e!319176 (= (seekEntryOrOpen!0 (select (arr!16734 a!3118) j!142) a!3118 mask!3119) (Found!5183 j!142)))))

(declare-fun b!553275 () Bool)

(declare-fun res!345691 () Bool)

(declare-fun e!319175 () Bool)

(assert (=> b!553275 (=> (not res!345691) (not e!319175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34849 (_ BitVec 32)) Bool)

(assert (=> b!553275 (= res!345691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553276 () Bool)

(declare-fun res!345686 () Bool)

(assert (=> b!553276 (=> (not res!345686) (not e!319175))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34849 (_ BitVec 32)) SeekEntryResult!5183)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553276 (= res!345686 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16734 a!3118) j!142) mask!3119) (select (arr!16734 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16734 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16734 a!3118) i!1132 k!1914) j!142) (array!34850 (store (arr!16734 a!3118) i!1132 k!1914) (size!17098 a!3118)) mask!3119)))))

(declare-fun b!553277 () Bool)

(declare-fun res!345694 () Bool)

(declare-fun e!319174 () Bool)

(assert (=> b!553277 (=> (not res!345694) (not e!319174))))

(declare-fun arrayContainsKey!0 (array!34849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553277 (= res!345694 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553278 () Bool)

(declare-fun res!345692 () Bool)

(assert (=> b!553278 (=> (not res!345692) (not e!319175))))

(declare-datatypes ((List!10814 0))(
  ( (Nil!10811) (Cons!10810 (h!11795 (_ BitVec 64)) (t!17042 List!10814)) )
))
(declare-fun arrayNoDuplicates!0 (array!34849 (_ BitVec 32) List!10814) Bool)

(assert (=> b!553278 (= res!345692 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10811))))

(declare-fun res!345687 () Bool)

(assert (=> start!50624 (=> (not res!345687) (not e!319174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50624 (= res!345687 (validMask!0 mask!3119))))

(assert (=> start!50624 e!319174))

(assert (=> start!50624 true))

(declare-fun array_inv!12530 (array!34849) Bool)

(assert (=> start!50624 (array_inv!12530 a!3118)))

(declare-fun b!553279 () Bool)

(declare-fun res!345688 () Bool)

(assert (=> b!553279 (=> (not res!345688) (not e!319174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553279 (= res!345688 (validKeyInArray!0 (select (arr!16734 a!3118) j!142)))))

(declare-fun b!553280 () Bool)

(assert (=> b!553280 (= e!319175 (not true))))

(assert (=> b!553280 e!319176))

(declare-fun res!345689 () Bool)

(assert (=> b!553280 (=> (not res!345689) (not e!319176))))

(assert (=> b!553280 (= res!345689 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17140 0))(
  ( (Unit!17141) )
))
(declare-fun lt!251427 () Unit!17140)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17140)

(assert (=> b!553280 (= lt!251427 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553281 () Bool)

(declare-fun res!345690 () Bool)

(assert (=> b!553281 (=> (not res!345690) (not e!319174))))

(assert (=> b!553281 (= res!345690 (validKeyInArray!0 k!1914))))

(declare-fun b!553282 () Bool)

(declare-fun res!345693 () Bool)

(assert (=> b!553282 (=> (not res!345693) (not e!319174))))

(assert (=> b!553282 (= res!345693 (and (= (size!17098 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17098 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17098 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553283 () Bool)

(assert (=> b!553283 (= e!319174 e!319175)))

(declare-fun res!345695 () Bool)

(assert (=> b!553283 (=> (not res!345695) (not e!319175))))

(declare-fun lt!251428 () SeekEntryResult!5183)

(assert (=> b!553283 (= res!345695 (or (= lt!251428 (MissingZero!5183 i!1132)) (= lt!251428 (MissingVacant!5183 i!1132))))))

(assert (=> b!553283 (= lt!251428 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!50624 res!345687) b!553282))

(assert (= (and b!553282 res!345693) b!553279))

(assert (= (and b!553279 res!345688) b!553281))

(assert (= (and b!553281 res!345690) b!553277))

(assert (= (and b!553277 res!345694) b!553283))

(assert (= (and b!553283 res!345695) b!553275))

(assert (= (and b!553275 res!345691) b!553278))

(assert (= (and b!553278 res!345692) b!553276))

(assert (= (and b!553276 res!345686) b!553280))

(assert (= (and b!553280 res!345689) b!553274))

(declare-fun m!530325 () Bool)

(assert (=> b!553279 m!530325))

(assert (=> b!553279 m!530325))

(declare-fun m!530327 () Bool)

(assert (=> b!553279 m!530327))

(declare-fun m!530329 () Bool)

(assert (=> b!553275 m!530329))

(declare-fun m!530331 () Bool)

(assert (=> b!553280 m!530331))

(declare-fun m!530333 () Bool)

(assert (=> b!553280 m!530333))

(declare-fun m!530335 () Bool)

(assert (=> start!50624 m!530335))

(declare-fun m!530337 () Bool)

(assert (=> start!50624 m!530337))

(assert (=> b!553276 m!530325))

(declare-fun m!530339 () Bool)

(assert (=> b!553276 m!530339))

(assert (=> b!553276 m!530325))

(declare-fun m!530341 () Bool)

(assert (=> b!553276 m!530341))

(declare-fun m!530343 () Bool)

(assert (=> b!553276 m!530343))

(assert (=> b!553276 m!530341))

(declare-fun m!530345 () Bool)

(assert (=> b!553276 m!530345))

(assert (=> b!553276 m!530339))

(assert (=> b!553276 m!530325))

(declare-fun m!530347 () Bool)

(assert (=> b!553276 m!530347))

(declare-fun m!530349 () Bool)

(assert (=> b!553276 m!530349))

(assert (=> b!553276 m!530341))

(assert (=> b!553276 m!530343))

(declare-fun m!530351 () Bool)

(assert (=> b!553278 m!530351))

(assert (=> b!553274 m!530325))

(assert (=> b!553274 m!530325))

(declare-fun m!530353 () Bool)

(assert (=> b!553274 m!530353))

(declare-fun m!530355 () Bool)

(assert (=> b!553277 m!530355))

(declare-fun m!530357 () Bool)

(assert (=> b!553283 m!530357))

(declare-fun m!530359 () Bool)

(assert (=> b!553281 m!530359))

(push 1)

