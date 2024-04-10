; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50846 () Bool)

(assert start!50846)

(declare-fun res!348885 () Bool)

(declare-fun e!320586 () Bool)

(assert (=> start!50846 (=> (not res!348885) (not e!320586))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50846 (= res!348885 (validMask!0 mask!3119))))

(assert (=> start!50846 e!320586))

(assert (=> start!50846 true))

(declare-datatypes ((array!35071 0))(
  ( (array!35072 (arr!16845 (Array (_ BitVec 32) (_ BitVec 64))) (size!17209 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35071)

(declare-fun array_inv!12641 (array!35071) Bool)

(assert (=> start!50846 (array_inv!12641 a!3118)))

(declare-fun b!556469 () Bool)

(declare-fun res!348889 () Bool)

(declare-fun e!320587 () Bool)

(assert (=> b!556469 (=> (not res!348889) (not e!320587))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5294 0))(
  ( (MissingZero!5294 (index!23403 (_ BitVec 32))) (Found!5294 (index!23404 (_ BitVec 32))) (Intermediate!5294 (undefined!6106 Bool) (index!23405 (_ BitVec 32)) (x!52296 (_ BitVec 32))) (Undefined!5294) (MissingVacant!5294 (index!23406 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35071 (_ BitVec 32)) SeekEntryResult!5294)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556469 (= res!348889 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16845 a!3118) j!142) mask!3119) (select (arr!16845 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16845 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16845 a!3118) i!1132 k!1914) j!142) (array!35072 (store (arr!16845 a!3118) i!1132 k!1914) (size!17209 a!3118)) mask!3119)))))

(declare-fun b!556470 () Bool)

(declare-fun res!348883 () Bool)

(assert (=> b!556470 (=> (not res!348883) (not e!320586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556470 (= res!348883 (validKeyInArray!0 (select (arr!16845 a!3118) j!142)))))

(declare-fun b!556471 () Bool)

(declare-fun res!348887 () Bool)

(assert (=> b!556471 (=> (not res!348887) (not e!320586))))

(assert (=> b!556471 (= res!348887 (and (= (size!17209 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17209 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17209 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556472 () Bool)

(declare-fun res!348884 () Bool)

(assert (=> b!556472 (=> (not res!348884) (not e!320586))))

(assert (=> b!556472 (= res!348884 (validKeyInArray!0 k!1914))))

(declare-fun b!556473 () Bool)

(assert (=> b!556473 (= e!320586 e!320587)))

(declare-fun res!348890 () Bool)

(assert (=> b!556473 (=> (not res!348890) (not e!320587))))

(declare-fun lt!252894 () SeekEntryResult!5294)

(assert (=> b!556473 (= res!348890 (or (= lt!252894 (MissingZero!5294 i!1132)) (= lt!252894 (MissingVacant!5294 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35071 (_ BitVec 32)) SeekEntryResult!5294)

(assert (=> b!556473 (= lt!252894 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!556474 () Bool)

(declare-fun res!348888 () Bool)

(assert (=> b!556474 (=> (not res!348888) (not e!320586))))

(declare-fun arrayContainsKey!0 (array!35071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556474 (= res!348888 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556475 () Bool)

(assert (=> b!556475 (= e!320587 (not true))))

(declare-fun e!320588 () Bool)

(assert (=> b!556475 e!320588))

(declare-fun res!348881 () Bool)

(assert (=> b!556475 (=> (not res!348881) (not e!320588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35071 (_ BitVec 32)) Bool)

(assert (=> b!556475 (= res!348881 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17362 0))(
  ( (Unit!17363) )
))
(declare-fun lt!252895 () Unit!17362)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35071 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17362)

(assert (=> b!556475 (= lt!252895 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556476 () Bool)

(declare-fun res!348886 () Bool)

(assert (=> b!556476 (=> (not res!348886) (not e!320587))))

(declare-datatypes ((List!10925 0))(
  ( (Nil!10922) (Cons!10921 (h!11906 (_ BitVec 64)) (t!17153 List!10925)) )
))
(declare-fun arrayNoDuplicates!0 (array!35071 (_ BitVec 32) List!10925) Bool)

(assert (=> b!556476 (= res!348886 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10922))))

(declare-fun b!556477 () Bool)

(declare-fun res!348882 () Bool)

(assert (=> b!556477 (=> (not res!348882) (not e!320587))))

(assert (=> b!556477 (= res!348882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556478 () Bool)

(assert (=> b!556478 (= e!320588 (= (seekEntryOrOpen!0 (select (arr!16845 a!3118) j!142) a!3118 mask!3119) (Found!5294 j!142)))))

(assert (= (and start!50846 res!348885) b!556471))

(assert (= (and b!556471 res!348887) b!556470))

(assert (= (and b!556470 res!348883) b!556472))

(assert (= (and b!556472 res!348884) b!556474))

(assert (= (and b!556474 res!348888) b!556473))

(assert (= (and b!556473 res!348890) b!556477))

(assert (= (and b!556477 res!348882) b!556476))

(assert (= (and b!556476 res!348886) b!556469))

(assert (= (and b!556469 res!348889) b!556475))

(assert (= (and b!556475 res!348881) b!556478))

(declare-fun m!534471 () Bool)

(assert (=> b!556475 m!534471))

(declare-fun m!534473 () Bool)

(assert (=> b!556475 m!534473))

(declare-fun m!534475 () Bool)

(assert (=> b!556469 m!534475))

(declare-fun m!534477 () Bool)

(assert (=> b!556469 m!534477))

(assert (=> b!556469 m!534475))

(declare-fun m!534479 () Bool)

(assert (=> b!556469 m!534479))

(declare-fun m!534481 () Bool)

(assert (=> b!556469 m!534481))

(assert (=> b!556469 m!534479))

(declare-fun m!534483 () Bool)

(assert (=> b!556469 m!534483))

(assert (=> b!556469 m!534477))

(assert (=> b!556469 m!534475))

(declare-fun m!534485 () Bool)

(assert (=> b!556469 m!534485))

(declare-fun m!534487 () Bool)

(assert (=> b!556469 m!534487))

(assert (=> b!556469 m!534479))

(assert (=> b!556469 m!534481))

(assert (=> b!556470 m!534475))

(assert (=> b!556470 m!534475))

(declare-fun m!534489 () Bool)

(assert (=> b!556470 m!534489))

(declare-fun m!534491 () Bool)

(assert (=> b!556472 m!534491))

(declare-fun m!534493 () Bool)

(assert (=> b!556476 m!534493))

(declare-fun m!534495 () Bool)

(assert (=> b!556473 m!534495))

(assert (=> b!556478 m!534475))

(assert (=> b!556478 m!534475))

(declare-fun m!534497 () Bool)

(assert (=> b!556478 m!534497))

(declare-fun m!534499 () Bool)

(assert (=> b!556477 m!534499))

(declare-fun m!534501 () Bool)

(assert (=> b!556474 m!534501))

(declare-fun m!534503 () Bool)

(assert (=> start!50846 m!534503))

(declare-fun m!534505 () Bool)

(assert (=> start!50846 m!534505))

(push 1)

