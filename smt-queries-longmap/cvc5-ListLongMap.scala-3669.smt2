; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50630 () Bool)

(assert start!50630)

(declare-fun b!553366 () Bool)

(declare-fun res!345780 () Bool)

(declare-fun e!319213 () Bool)

(assert (=> b!553366 (=> (not res!345780) (not e!319213))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553366 (= res!345780 (validKeyInArray!0 k!1914))))

(declare-fun b!553367 () Bool)

(declare-fun res!345779 () Bool)

(declare-fun e!319216 () Bool)

(assert (=> b!553367 (=> (not res!345779) (not e!319216))))

(declare-datatypes ((array!34855 0))(
  ( (array!34856 (arr!16737 (Array (_ BitVec 32) (_ BitVec 64))) (size!17101 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34855)

(declare-datatypes ((List!10817 0))(
  ( (Nil!10814) (Cons!10813 (h!11798 (_ BitVec 64)) (t!17045 List!10817)) )
))
(declare-fun arrayNoDuplicates!0 (array!34855 (_ BitVec 32) List!10817) Bool)

(assert (=> b!553367 (= res!345779 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10814))))

(declare-fun b!553368 () Bool)

(declare-fun e!319215 () Bool)

(assert (=> b!553368 (= e!319216 e!319215)))

(declare-fun res!345785 () Bool)

(assert (=> b!553368 (=> (not res!345785) (not e!319215))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5186 0))(
  ( (MissingZero!5186 (index!22971 (_ BitVec 32))) (Found!5186 (index!22972 (_ BitVec 32))) (Intermediate!5186 (undefined!5998 Bool) (index!22973 (_ BitVec 32)) (x!51900 (_ BitVec 32))) (Undefined!5186) (MissingVacant!5186 (index!22974 (_ BitVec 32))) )
))
(declare-fun lt!251452 () SeekEntryResult!5186)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!251451 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34855 (_ BitVec 32)) SeekEntryResult!5186)

(assert (=> b!553368 (= res!345785 (= lt!251452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251451 (select (store (arr!16737 a!3118) i!1132 k!1914) j!142) (array!34856 (store (arr!16737 a!3118) i!1132 k!1914) (size!17101 a!3118)) mask!3119)))))

(declare-fun lt!251454 () (_ BitVec 32))

(assert (=> b!553368 (= lt!251452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251454 (select (arr!16737 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553368 (= lt!251451 (toIndex!0 (select (store (arr!16737 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!553368 (= lt!251454 (toIndex!0 (select (arr!16737 a!3118) j!142) mask!3119))))

(declare-fun b!553369 () Bool)

(declare-fun e!319217 () Bool)

(assert (=> b!553369 (= e!319215 (not e!319217))))

(declare-fun res!345784 () Bool)

(assert (=> b!553369 (=> res!345784 e!319217)))

(assert (=> b!553369 (= res!345784 (or (not (is-Intermediate!5186 lt!251452)) (not (undefined!5998 lt!251452)) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!319214 () Bool)

(assert (=> b!553369 e!319214))

(declare-fun res!345778 () Bool)

(assert (=> b!553369 (=> (not res!345778) (not e!319214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34855 (_ BitVec 32)) Bool)

(assert (=> b!553369 (= res!345778 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17146 0))(
  ( (Unit!17147) )
))
(declare-fun lt!251453 () Unit!17146)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17146)

(assert (=> b!553369 (= lt!251453 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553370 () Bool)

(declare-fun res!345781 () Bool)

(assert (=> b!553370 (=> (not res!345781) (not e!319213))))

(declare-fun arrayContainsKey!0 (array!34855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553370 (= res!345781 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553371 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34855 (_ BitVec 32)) SeekEntryResult!5186)

(assert (=> b!553371 (= e!319214 (= (seekEntryOrOpen!0 (select (arr!16737 a!3118) j!142) a!3118 mask!3119) (Found!5186 j!142)))))

(declare-fun res!345783 () Bool)

(assert (=> start!50630 (=> (not res!345783) (not e!319213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50630 (= res!345783 (validMask!0 mask!3119))))

(assert (=> start!50630 e!319213))

(assert (=> start!50630 true))

(declare-fun array_inv!12533 (array!34855) Bool)

(assert (=> start!50630 (array_inv!12533 a!3118)))

(declare-fun b!553372 () Bool)

(assert (=> b!553372 (= e!319213 e!319216)))

(declare-fun res!345788 () Bool)

(assert (=> b!553372 (=> (not res!345788) (not e!319216))))

(declare-fun lt!251455 () SeekEntryResult!5186)

(assert (=> b!553372 (= res!345788 (or (= lt!251455 (MissingZero!5186 i!1132)) (= lt!251455 (MissingVacant!5186 i!1132))))))

(assert (=> b!553372 (= lt!251455 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!553373 () Bool)

(declare-fun res!345782 () Bool)

(assert (=> b!553373 (=> (not res!345782) (not e!319216))))

(assert (=> b!553373 (= res!345782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553374 () Bool)

(declare-fun res!345787 () Bool)

(assert (=> b!553374 (=> (not res!345787) (not e!319213))))

(assert (=> b!553374 (= res!345787 (validKeyInArray!0 (select (arr!16737 a!3118) j!142)))))

(declare-fun b!553375 () Bool)

(declare-fun res!345786 () Bool)

(assert (=> b!553375 (=> (not res!345786) (not e!319213))))

(assert (=> b!553375 (= res!345786 (and (= (size!17101 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17101 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17101 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553376 () Bool)

(assert (=> b!553376 (= e!319217 (validKeyInArray!0 (select (store (arr!16737 a!3118) i!1132 k!1914) j!142)))))

(assert (= (and start!50630 res!345783) b!553375))

(assert (= (and b!553375 res!345786) b!553374))

(assert (= (and b!553374 res!345787) b!553366))

(assert (= (and b!553366 res!345780) b!553370))

(assert (= (and b!553370 res!345781) b!553372))

(assert (= (and b!553372 res!345788) b!553373))

(assert (= (and b!553373 res!345782) b!553367))

(assert (= (and b!553367 res!345779) b!553368))

(assert (= (and b!553368 res!345785) b!553369))

(assert (= (and b!553369 res!345778) b!553371))

(assert (= (and b!553369 (not res!345784)) b!553376))

(declare-fun m!530433 () Bool)

(assert (=> b!553371 m!530433))

(assert (=> b!553371 m!530433))

(declare-fun m!530435 () Bool)

(assert (=> b!553371 m!530435))

(declare-fun m!530437 () Bool)

(assert (=> b!553367 m!530437))

(declare-fun m!530439 () Bool)

(assert (=> start!50630 m!530439))

(declare-fun m!530441 () Bool)

(assert (=> start!50630 m!530441))

(assert (=> b!553368 m!530433))

(declare-fun m!530443 () Bool)

(assert (=> b!553368 m!530443))

(declare-fun m!530445 () Bool)

(assert (=> b!553368 m!530445))

(declare-fun m!530447 () Bool)

(assert (=> b!553368 m!530447))

(assert (=> b!553368 m!530433))

(assert (=> b!553368 m!530433))

(declare-fun m!530449 () Bool)

(assert (=> b!553368 m!530449))

(assert (=> b!553368 m!530445))

(declare-fun m!530451 () Bool)

(assert (=> b!553368 m!530451))

(assert (=> b!553368 m!530445))

(declare-fun m!530453 () Bool)

(assert (=> b!553368 m!530453))

(assert (=> b!553376 m!530451))

(assert (=> b!553376 m!530445))

(assert (=> b!553376 m!530445))

(declare-fun m!530455 () Bool)

(assert (=> b!553376 m!530455))

(assert (=> b!553374 m!530433))

(assert (=> b!553374 m!530433))

(declare-fun m!530457 () Bool)

(assert (=> b!553374 m!530457))

(declare-fun m!530459 () Bool)

(assert (=> b!553373 m!530459))

(declare-fun m!530461 () Bool)

(assert (=> b!553366 m!530461))

(declare-fun m!530463 () Bool)

(assert (=> b!553369 m!530463))

(declare-fun m!530465 () Bool)

(assert (=> b!553369 m!530465))

(declare-fun m!530467 () Bool)

(assert (=> b!553370 m!530467))

(declare-fun m!530469 () Bool)

(assert (=> b!553372 m!530469))

(push 1)

