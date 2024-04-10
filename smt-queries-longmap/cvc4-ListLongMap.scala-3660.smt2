; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50580 () Bool)

(assert start!50580)

(declare-fun b!552605 () Bool)

(declare-fun res!345020 () Bool)

(declare-fun e!318876 () Bool)

(assert (=> b!552605 (=> (not res!345020) (not e!318876))))

(declare-datatypes ((array!34805 0))(
  ( (array!34806 (arr!16712 (Array (_ BitVec 32) (_ BitVec 64))) (size!17076 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34805)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34805 (_ BitVec 32)) Bool)

(assert (=> b!552605 (= res!345020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552606 () Bool)

(assert (=> b!552606 (= e!318876 (not true))))

(declare-fun e!318875 () Bool)

(assert (=> b!552606 e!318875))

(declare-fun res!345025 () Bool)

(assert (=> b!552606 (=> (not res!345025) (not e!318875))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!552606 (= res!345025 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17096 0))(
  ( (Unit!17097) )
))
(declare-fun lt!251223 () Unit!17096)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17096)

(assert (=> b!552606 (= lt!251223 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552607 () Bool)

(declare-fun res!345018 () Bool)

(declare-fun e!318874 () Bool)

(assert (=> b!552607 (=> (not res!345018) (not e!318874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552607 (= res!345018 (validKeyInArray!0 (select (arr!16712 a!3118) j!142)))))

(declare-fun b!552608 () Bool)

(declare-fun res!345024 () Bool)

(assert (=> b!552608 (=> (not res!345024) (not e!318874))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552608 (= res!345024 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552609 () Bool)

(declare-fun res!345021 () Bool)

(assert (=> b!552609 (=> (not res!345021) (not e!318874))))

(assert (=> b!552609 (= res!345021 (validKeyInArray!0 k!1914))))

(declare-fun b!552610 () Bool)

(declare-fun res!345026 () Bool)

(assert (=> b!552610 (=> (not res!345026) (not e!318876))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5161 0))(
  ( (MissingZero!5161 (index!22871 (_ BitVec 32))) (Found!5161 (index!22872 (_ BitVec 32))) (Intermediate!5161 (undefined!5973 Bool) (index!22873 (_ BitVec 32)) (x!51803 (_ BitVec 32))) (Undefined!5161) (MissingVacant!5161 (index!22874 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34805 (_ BitVec 32)) SeekEntryResult!5161)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552610 (= res!345026 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16712 a!3118) j!142) mask!3119) (select (arr!16712 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16712 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16712 a!3118) i!1132 k!1914) j!142) (array!34806 (store (arr!16712 a!3118) i!1132 k!1914) (size!17076 a!3118)) mask!3119)))))

(declare-fun b!552611 () Bool)

(declare-fun res!345022 () Bool)

(assert (=> b!552611 (=> (not res!345022) (not e!318876))))

(declare-datatypes ((List!10792 0))(
  ( (Nil!10789) (Cons!10788 (h!11773 (_ BitVec 64)) (t!17020 List!10792)) )
))
(declare-fun arrayNoDuplicates!0 (array!34805 (_ BitVec 32) List!10792) Bool)

(assert (=> b!552611 (= res!345022 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10789))))

(declare-fun b!552612 () Bool)

(declare-fun res!345023 () Bool)

(assert (=> b!552612 (=> (not res!345023) (not e!318874))))

(assert (=> b!552612 (= res!345023 (and (= (size!17076 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17076 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17076 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552613 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34805 (_ BitVec 32)) SeekEntryResult!5161)

(assert (=> b!552613 (= e!318875 (= (seekEntryOrOpen!0 (select (arr!16712 a!3118) j!142) a!3118 mask!3119) (Found!5161 j!142)))))

(declare-fun b!552614 () Bool)

(assert (=> b!552614 (= e!318874 e!318876)))

(declare-fun res!345019 () Bool)

(assert (=> b!552614 (=> (not res!345019) (not e!318876))))

(declare-fun lt!251224 () SeekEntryResult!5161)

(assert (=> b!552614 (= res!345019 (or (= lt!251224 (MissingZero!5161 i!1132)) (= lt!251224 (MissingVacant!5161 i!1132))))))

(assert (=> b!552614 (= lt!251224 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!345017 () Bool)

(assert (=> start!50580 (=> (not res!345017) (not e!318874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50580 (= res!345017 (validMask!0 mask!3119))))

(assert (=> start!50580 e!318874))

(assert (=> start!50580 true))

(declare-fun array_inv!12508 (array!34805) Bool)

(assert (=> start!50580 (array_inv!12508 a!3118)))

(assert (= (and start!50580 res!345017) b!552612))

(assert (= (and b!552612 res!345023) b!552607))

(assert (= (and b!552607 res!345018) b!552609))

(assert (= (and b!552609 res!345021) b!552608))

(assert (= (and b!552608 res!345024) b!552614))

(assert (= (and b!552614 res!345019) b!552605))

(assert (= (and b!552605 res!345020) b!552611))

(assert (= (and b!552611 res!345022) b!552610))

(assert (= (and b!552610 res!345026) b!552606))

(assert (= (and b!552606 res!345025) b!552613))

(declare-fun m!529527 () Bool)

(assert (=> b!552608 m!529527))

(declare-fun m!529529 () Bool)

(assert (=> b!552605 m!529529))

(declare-fun m!529531 () Bool)

(assert (=> b!552609 m!529531))

(declare-fun m!529533 () Bool)

(assert (=> b!552607 m!529533))

(assert (=> b!552607 m!529533))

(declare-fun m!529535 () Bool)

(assert (=> b!552607 m!529535))

(declare-fun m!529537 () Bool)

(assert (=> b!552611 m!529537))

(declare-fun m!529539 () Bool)

(assert (=> b!552614 m!529539))

(declare-fun m!529541 () Bool)

(assert (=> start!50580 m!529541))

(declare-fun m!529543 () Bool)

(assert (=> start!50580 m!529543))

(assert (=> b!552610 m!529533))

(declare-fun m!529545 () Bool)

(assert (=> b!552610 m!529545))

(assert (=> b!552610 m!529533))

(declare-fun m!529547 () Bool)

(assert (=> b!552610 m!529547))

(declare-fun m!529549 () Bool)

(assert (=> b!552610 m!529549))

(assert (=> b!552610 m!529547))

(declare-fun m!529551 () Bool)

(assert (=> b!552610 m!529551))

(assert (=> b!552610 m!529545))

(assert (=> b!552610 m!529533))

(declare-fun m!529553 () Bool)

(assert (=> b!552610 m!529553))

(declare-fun m!529555 () Bool)

(assert (=> b!552610 m!529555))

(assert (=> b!552610 m!529547))

(assert (=> b!552610 m!529549))

(assert (=> b!552613 m!529533))

(assert (=> b!552613 m!529533))

(declare-fun m!529557 () Bool)

(assert (=> b!552613 m!529557))

(declare-fun m!529559 () Bool)

(assert (=> b!552606 m!529559))

(declare-fun m!529561 () Bool)

(assert (=> b!552606 m!529561))

(push 1)

