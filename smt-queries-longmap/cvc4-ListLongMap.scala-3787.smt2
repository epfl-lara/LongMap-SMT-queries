; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51900 () Bool)

(assert start!51900)

(declare-fun b!567293 () Bool)

(declare-fun res!357887 () Bool)

(declare-fun e!326462 () Bool)

(assert (=> b!567293 (=> (not res!357887) (not e!326462))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35594 0))(
  ( (array!35595 (arr!17093 (Array (_ BitVec 32) (_ BitVec 64))) (size!17457 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35594)

(assert (=> b!567293 (= res!357887 (and (= (size!17457 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17457 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17457 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!357881 () Bool)

(assert (=> start!51900 (=> (not res!357881) (not e!326462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51900 (= res!357881 (validMask!0 mask!3119))))

(assert (=> start!51900 e!326462))

(assert (=> start!51900 true))

(declare-fun array_inv!12889 (array!35594) Bool)

(assert (=> start!51900 (array_inv!12889 a!3118)))

(declare-fun b!567294 () Bool)

(declare-fun e!326463 () Bool)

(assert (=> b!567294 (= e!326462 e!326463)))

(declare-fun res!357885 () Bool)

(assert (=> b!567294 (=> (not res!357885) (not e!326463))))

(declare-datatypes ((SeekEntryResult!5542 0))(
  ( (MissingZero!5542 (index!24395 (_ BitVec 32))) (Found!5542 (index!24396 (_ BitVec 32))) (Intermediate!5542 (undefined!6354 Bool) (index!24397 (_ BitVec 32)) (x!53263 (_ BitVec 32))) (Undefined!5542) (MissingVacant!5542 (index!24398 (_ BitVec 32))) )
))
(declare-fun lt!258486 () SeekEntryResult!5542)

(assert (=> b!567294 (= res!357885 (or (= lt!258486 (MissingZero!5542 i!1132)) (= lt!258486 (MissingVacant!5542 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35594 (_ BitVec 32)) SeekEntryResult!5542)

(assert (=> b!567294 (= lt!258486 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!567295 () Bool)

(declare-fun res!357886 () Bool)

(assert (=> b!567295 (=> (not res!357886) (not e!326462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567295 (= res!357886 (validKeyInArray!0 k!1914))))

(declare-fun b!567296 () Bool)

(declare-fun res!357884 () Bool)

(assert (=> b!567296 (=> (not res!357884) (not e!326463))))

(declare-datatypes ((List!11173 0))(
  ( (Nil!11170) (Cons!11169 (h!12181 (_ BitVec 64)) (t!17401 List!11173)) )
))
(declare-fun arrayNoDuplicates!0 (array!35594 (_ BitVec 32) List!11173) Bool)

(assert (=> b!567296 (= res!357884 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11170))))

(declare-fun b!567297 () Bool)

(assert (=> b!567297 (= e!326463 (not true))))

(declare-fun e!326461 () Bool)

(assert (=> b!567297 e!326461))

(declare-fun res!357882 () Bool)

(assert (=> b!567297 (=> (not res!357882) (not e!326461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35594 (_ BitVec 32)) Bool)

(assert (=> b!567297 (= res!357882 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17786 0))(
  ( (Unit!17787) )
))
(declare-fun lt!258487 () Unit!17786)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17786)

(assert (=> b!567297 (= lt!258487 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567298 () Bool)

(declare-fun res!357879 () Bool)

(assert (=> b!567298 (=> (not res!357879) (not e!326462))))

(assert (=> b!567298 (= res!357879 (validKeyInArray!0 (select (arr!17093 a!3118) j!142)))))

(declare-fun b!567299 () Bool)

(assert (=> b!567299 (= e!326461 (= (seekEntryOrOpen!0 (select (arr!17093 a!3118) j!142) a!3118 mask!3119) (Found!5542 j!142)))))

(declare-fun b!567300 () Bool)

(declare-fun res!357880 () Bool)

(assert (=> b!567300 (=> (not res!357880) (not e!326463))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35594 (_ BitVec 32)) SeekEntryResult!5542)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567300 (= res!357880 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17093 a!3118) j!142) mask!3119) (select (arr!17093 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17093 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17093 a!3118) i!1132 k!1914) j!142) (array!35595 (store (arr!17093 a!3118) i!1132 k!1914) (size!17457 a!3118)) mask!3119)))))

(declare-fun b!567301 () Bool)

(declare-fun res!357878 () Bool)

(assert (=> b!567301 (=> (not res!357878) (not e!326462))))

(declare-fun arrayContainsKey!0 (array!35594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567301 (= res!357878 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567302 () Bool)

(declare-fun res!357883 () Bool)

(assert (=> b!567302 (=> (not res!357883) (not e!326463))))

(assert (=> b!567302 (= res!357883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51900 res!357881) b!567293))

(assert (= (and b!567293 res!357887) b!567298))

(assert (= (and b!567298 res!357879) b!567295))

(assert (= (and b!567295 res!357886) b!567301))

(assert (= (and b!567301 res!357878) b!567294))

(assert (= (and b!567294 res!357885) b!567302))

(assert (= (and b!567302 res!357883) b!567296))

(assert (= (and b!567296 res!357884) b!567300))

(assert (= (and b!567300 res!357880) b!567297))

(assert (= (and b!567297 res!357882) b!567299))

(declare-fun m!545853 () Bool)

(assert (=> b!567299 m!545853))

(assert (=> b!567299 m!545853))

(declare-fun m!545855 () Bool)

(assert (=> b!567299 m!545855))

(declare-fun m!545857 () Bool)

(assert (=> b!567295 m!545857))

(assert (=> b!567298 m!545853))

(assert (=> b!567298 m!545853))

(declare-fun m!545859 () Bool)

(assert (=> b!567298 m!545859))

(declare-fun m!545861 () Bool)

(assert (=> b!567294 m!545861))

(assert (=> b!567300 m!545853))

(declare-fun m!545863 () Bool)

(assert (=> b!567300 m!545863))

(assert (=> b!567300 m!545853))

(declare-fun m!545865 () Bool)

(assert (=> b!567300 m!545865))

(declare-fun m!545867 () Bool)

(assert (=> b!567300 m!545867))

(assert (=> b!567300 m!545865))

(declare-fun m!545869 () Bool)

(assert (=> b!567300 m!545869))

(assert (=> b!567300 m!545863))

(assert (=> b!567300 m!545853))

(declare-fun m!545871 () Bool)

(assert (=> b!567300 m!545871))

(declare-fun m!545873 () Bool)

(assert (=> b!567300 m!545873))

(assert (=> b!567300 m!545865))

(assert (=> b!567300 m!545867))

(declare-fun m!545875 () Bool)

(assert (=> b!567296 m!545875))

(declare-fun m!545877 () Bool)

(assert (=> b!567301 m!545877))

(declare-fun m!545879 () Bool)

(assert (=> start!51900 m!545879))

(declare-fun m!545881 () Bool)

(assert (=> start!51900 m!545881))

(declare-fun m!545883 () Bool)

(assert (=> b!567302 m!545883))

(declare-fun m!545885 () Bool)

(assert (=> b!567297 m!545885))

(declare-fun m!545887 () Bool)

(assert (=> b!567297 m!545887))

(push 1)

