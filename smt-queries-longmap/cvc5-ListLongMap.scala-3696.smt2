; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50792 () Bool)

(assert start!50792)

(declare-fun res!348099 () Bool)

(declare-fun e!320247 () Bool)

(assert (=> start!50792 (=> (not res!348099) (not e!320247))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50792 (= res!348099 (validMask!0 mask!3119))))

(assert (=> start!50792 e!320247))

(assert (=> start!50792 true))

(declare-datatypes ((array!35017 0))(
  ( (array!35018 (arr!16818 (Array (_ BitVec 32) (_ BitVec 64))) (size!17182 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35017)

(declare-fun array_inv!12614 (array!35017) Bool)

(assert (=> start!50792 (array_inv!12614 a!3118)))

(declare-fun b!555684 () Bool)

(declare-fun e!320246 () Bool)

(assert (=> b!555684 (= e!320246 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5267 0))(
  ( (MissingZero!5267 (index!23295 (_ BitVec 32))) (Found!5267 (index!23296 (_ BitVec 32))) (Intermediate!5267 (undefined!6079 Bool) (index!23297 (_ BitVec 32)) (x!52197 (_ BitVec 32))) (Undefined!5267) (MissingVacant!5267 (index!23298 (_ BitVec 32))) )
))
(declare-fun lt!252578 () SeekEntryResult!5267)

(declare-fun lt!252581 () SeekEntryResult!5267)

(assert (=> b!555684 (and (= lt!252578 (Found!5267 j!142)) (or (undefined!6079 lt!252581) (not (is-Intermediate!5267 lt!252581)) (= (select (arr!16818 a!3118) (index!23297 lt!252581)) (select (arr!16818 a!3118) j!142)) (not (= (select (arr!16818 a!3118) (index!23297 lt!252581)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252578 (MissingZero!5267 (index!23297 lt!252581)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35017 (_ BitVec 32)) SeekEntryResult!5267)

(assert (=> b!555684 (= lt!252578 (seekEntryOrOpen!0 (select (arr!16818 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35017 (_ BitVec 32)) Bool)

(assert (=> b!555684 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17308 0))(
  ( (Unit!17309) )
))
(declare-fun lt!252580 () Unit!17308)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35017 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17308)

(assert (=> b!555684 (= lt!252580 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555685 () Bool)

(declare-fun res!348097 () Bool)

(declare-fun e!320244 () Bool)

(assert (=> b!555685 (=> (not res!348097) (not e!320244))))

(assert (=> b!555685 (= res!348097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555686 () Bool)

(assert (=> b!555686 (= e!320247 e!320244)))

(declare-fun res!348098 () Bool)

(assert (=> b!555686 (=> (not res!348098) (not e!320244))))

(declare-fun lt!252582 () SeekEntryResult!5267)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555686 (= res!348098 (or (= lt!252582 (MissingZero!5267 i!1132)) (= lt!252582 (MissingVacant!5267 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!555686 (= lt!252582 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!555687 () Bool)

(declare-fun res!348100 () Bool)

(assert (=> b!555687 (=> (not res!348100) (not e!320247))))

(declare-fun arrayContainsKey!0 (array!35017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555687 (= res!348100 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555688 () Bool)

(declare-fun res!348104 () Bool)

(assert (=> b!555688 (=> (not res!348104) (not e!320247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555688 (= res!348104 (validKeyInArray!0 (select (arr!16818 a!3118) j!142)))))

(declare-fun b!555689 () Bool)

(declare-fun res!348103 () Bool)

(assert (=> b!555689 (=> (not res!348103) (not e!320247))))

(assert (=> b!555689 (= res!348103 (validKeyInArray!0 k!1914))))

(declare-fun b!555690 () Bool)

(declare-fun res!348096 () Bool)

(assert (=> b!555690 (=> (not res!348096) (not e!320244))))

(declare-datatypes ((List!10898 0))(
  ( (Nil!10895) (Cons!10894 (h!11879 (_ BitVec 64)) (t!17126 List!10898)) )
))
(declare-fun arrayNoDuplicates!0 (array!35017 (_ BitVec 32) List!10898) Bool)

(assert (=> b!555690 (= res!348096 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10895))))

(declare-fun b!555691 () Bool)

(assert (=> b!555691 (= e!320244 e!320246)))

(declare-fun res!348101 () Bool)

(assert (=> b!555691 (=> (not res!348101) (not e!320246))))

(declare-fun lt!252579 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35017 (_ BitVec 32)) SeekEntryResult!5267)

(assert (=> b!555691 (= res!348101 (= lt!252581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252579 (select (store (arr!16818 a!3118) i!1132 k!1914) j!142) (array!35018 (store (arr!16818 a!3118) i!1132 k!1914) (size!17182 a!3118)) mask!3119)))))

(declare-fun lt!252583 () (_ BitVec 32))

(assert (=> b!555691 (= lt!252581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252583 (select (arr!16818 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555691 (= lt!252579 (toIndex!0 (select (store (arr!16818 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555691 (= lt!252583 (toIndex!0 (select (arr!16818 a!3118) j!142) mask!3119))))

(declare-fun b!555692 () Bool)

(declare-fun res!348102 () Bool)

(assert (=> b!555692 (=> (not res!348102) (not e!320247))))

(assert (=> b!555692 (= res!348102 (and (= (size!17182 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17182 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17182 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50792 res!348099) b!555692))

(assert (= (and b!555692 res!348102) b!555688))

(assert (= (and b!555688 res!348104) b!555689))

(assert (= (and b!555689 res!348103) b!555687))

(assert (= (and b!555687 res!348100) b!555686))

(assert (= (and b!555686 res!348098) b!555685))

(assert (= (and b!555685 res!348097) b!555690))

(assert (= (and b!555690 res!348096) b!555691))

(assert (= (and b!555691 res!348101) b!555684))

(declare-fun m!533469 () Bool)

(assert (=> b!555684 m!533469))

(declare-fun m!533471 () Bool)

(assert (=> b!555684 m!533471))

(declare-fun m!533473 () Bool)

(assert (=> b!555684 m!533473))

(declare-fun m!533475 () Bool)

(assert (=> b!555684 m!533475))

(assert (=> b!555684 m!533469))

(declare-fun m!533477 () Bool)

(assert (=> b!555684 m!533477))

(declare-fun m!533479 () Bool)

(assert (=> b!555686 m!533479))

(assert (=> b!555688 m!533469))

(assert (=> b!555688 m!533469))

(declare-fun m!533481 () Bool)

(assert (=> b!555688 m!533481))

(declare-fun m!533483 () Bool)

(assert (=> b!555687 m!533483))

(declare-fun m!533485 () Bool)

(assert (=> start!50792 m!533485))

(declare-fun m!533487 () Bool)

(assert (=> start!50792 m!533487))

(declare-fun m!533489 () Bool)

(assert (=> b!555685 m!533489))

(declare-fun m!533491 () Bool)

(assert (=> b!555689 m!533491))

(assert (=> b!555691 m!533469))

(declare-fun m!533493 () Bool)

(assert (=> b!555691 m!533493))

(declare-fun m!533495 () Bool)

(assert (=> b!555691 m!533495))

(declare-fun m!533497 () Bool)

(assert (=> b!555691 m!533497))

(assert (=> b!555691 m!533469))

(assert (=> b!555691 m!533495))

(declare-fun m!533499 () Bool)

(assert (=> b!555691 m!533499))

(assert (=> b!555691 m!533469))

(declare-fun m!533501 () Bool)

(assert (=> b!555691 m!533501))

(assert (=> b!555691 m!533495))

(declare-fun m!533503 () Bool)

(assert (=> b!555691 m!533503))

(declare-fun m!533505 () Bool)

(assert (=> b!555690 m!533505))

(push 1)

