; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52356 () Bool)

(assert start!52356)

(declare-fun b!571119 () Bool)

(declare-fun e!328475 () Bool)

(assert (=> b!571119 (= e!328475 (not true))))

(declare-fun e!328474 () Bool)

(assert (=> b!571119 e!328474))

(declare-fun res!360797 () Bool)

(assert (=> b!571119 (=> (not res!360797) (not e!328474))))

(declare-datatypes ((SeekEntryResult!5575 0))(
  ( (MissingZero!5575 (index!24527 (_ BitVec 32))) (Found!5575 (index!24528 (_ BitVec 32))) (Intermediate!5575 (undefined!6387 Bool) (index!24529 (_ BitVec 32)) (x!53550 (_ BitVec 32))) (Undefined!5575) (MissingVacant!5575 (index!24530 (_ BitVec 32))) )
))
(declare-fun lt!260410 () SeekEntryResult!5575)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!571119 (= res!360797 (= lt!260410 (Found!5575 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35763 0))(
  ( (array!35764 (arr!17170 (Array (_ BitVec 32) (_ BitVec 64))) (size!17534 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35763)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35763 (_ BitVec 32)) SeekEntryResult!5575)

(assert (=> b!571119 (= lt!260410 (seekEntryOrOpen!0 (select (arr!17170 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35763 (_ BitVec 32)) Bool)

(assert (=> b!571119 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17923 0))(
  ( (Unit!17924) )
))
(declare-fun lt!260405 () Unit!17923)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35763 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17923)

(assert (=> b!571119 (= lt!260405 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571120 () Bool)

(declare-fun e!328479 () Bool)

(declare-fun e!328477 () Bool)

(assert (=> b!571120 (= e!328479 e!328477)))

(declare-fun res!360800 () Bool)

(assert (=> b!571120 (=> (not res!360800) (not e!328477))))

(declare-fun lt!260407 () SeekEntryResult!5575)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571120 (= res!360800 (or (= lt!260407 (MissingZero!5575 i!1132)) (= lt!260407 (MissingVacant!5575 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!571120 (= lt!260407 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!571121 () Bool)

(declare-fun res!360802 () Bool)

(assert (=> b!571121 (=> (not res!360802) (not e!328479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571121 (= res!360802 (validKeyInArray!0 (select (arr!17170 a!3118) j!142)))))

(declare-fun b!571123 () Bool)

(declare-fun res!360801 () Bool)

(assert (=> b!571123 (=> (not res!360801) (not e!328479))))

(assert (=> b!571123 (= res!360801 (validKeyInArray!0 k0!1914))))

(declare-fun b!571124 () Bool)

(declare-fun res!360804 () Bool)

(assert (=> b!571124 (=> (not res!360804) (not e!328477))))

(declare-datatypes ((List!11157 0))(
  ( (Nil!11154) (Cons!11153 (h!12180 (_ BitVec 64)) (t!17377 List!11157)) )
))
(declare-fun arrayNoDuplicates!0 (array!35763 (_ BitVec 32) List!11157) Bool)

(assert (=> b!571124 (= res!360804 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11154))))

(declare-fun e!328476 () Bool)

(declare-fun lt!260409 () SeekEntryResult!5575)

(declare-fun b!571125 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35763 (_ BitVec 32)) SeekEntryResult!5575)

(assert (=> b!571125 (= e!328476 (= lt!260410 (seekKeyOrZeroReturnVacant!0 (x!53550 lt!260409) (index!24529 lt!260409) (index!24529 lt!260409) (select (arr!17170 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!360796 () Bool)

(assert (=> start!52356 (=> (not res!360796) (not e!328479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52356 (= res!360796 (validMask!0 mask!3119))))

(assert (=> start!52356 e!328479))

(assert (=> start!52356 true))

(declare-fun array_inv!13029 (array!35763) Bool)

(assert (=> start!52356 (array_inv!13029 a!3118)))

(declare-fun b!571122 () Bool)

(declare-fun res!360803 () Bool)

(assert (=> b!571122 (=> (not res!360803) (not e!328479))))

(assert (=> b!571122 (= res!360803 (and (= (size!17534 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17534 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17534 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571126 () Bool)

(declare-fun res!360795 () Bool)

(assert (=> b!571126 (=> (not res!360795) (not e!328477))))

(assert (=> b!571126 (= res!360795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571127 () Bool)

(assert (=> b!571127 (= e!328474 e!328476)))

(declare-fun res!360798 () Bool)

(assert (=> b!571127 (=> res!360798 e!328476)))

(get-info :version)

(assert (=> b!571127 (= res!360798 (or (undefined!6387 lt!260409) (not ((_ is Intermediate!5575) lt!260409)) (= (select (arr!17170 a!3118) (index!24529 lt!260409)) (select (arr!17170 a!3118) j!142)) (= (select (arr!17170 a!3118) (index!24529 lt!260409)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!571128 () Bool)

(declare-fun res!360799 () Bool)

(assert (=> b!571128 (=> (not res!360799) (not e!328479))))

(declare-fun arrayContainsKey!0 (array!35763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571128 (= res!360799 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571129 () Bool)

(assert (=> b!571129 (= e!328477 e!328475)))

(declare-fun res!360805 () Bool)

(assert (=> b!571129 (=> (not res!360805) (not e!328475))))

(declare-fun lt!260406 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35763 (_ BitVec 32)) SeekEntryResult!5575)

(assert (=> b!571129 (= res!360805 (= lt!260409 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260406 (select (store (arr!17170 a!3118) i!1132 k0!1914) j!142) (array!35764 (store (arr!17170 a!3118) i!1132 k0!1914) (size!17534 a!3118)) mask!3119)))))

(declare-fun lt!260408 () (_ BitVec 32))

(assert (=> b!571129 (= lt!260409 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260408 (select (arr!17170 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571129 (= lt!260406 (toIndex!0 (select (store (arr!17170 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!571129 (= lt!260408 (toIndex!0 (select (arr!17170 a!3118) j!142) mask!3119))))

(assert (= (and start!52356 res!360796) b!571122))

(assert (= (and b!571122 res!360803) b!571121))

(assert (= (and b!571121 res!360802) b!571123))

(assert (= (and b!571123 res!360801) b!571128))

(assert (= (and b!571128 res!360799) b!571120))

(assert (= (and b!571120 res!360800) b!571126))

(assert (= (and b!571126 res!360795) b!571124))

(assert (= (and b!571124 res!360804) b!571129))

(assert (= (and b!571129 res!360805) b!571119))

(assert (= (and b!571119 res!360797) b!571127))

(assert (= (and b!571127 (not res!360798)) b!571125))

(declare-fun m!550187 () Bool)

(assert (=> b!571120 m!550187))

(declare-fun m!550189 () Bool)

(assert (=> b!571126 m!550189))

(declare-fun m!550191 () Bool)

(assert (=> b!571123 m!550191))

(declare-fun m!550193 () Bool)

(assert (=> start!52356 m!550193))

(declare-fun m!550195 () Bool)

(assert (=> start!52356 m!550195))

(declare-fun m!550197 () Bool)

(assert (=> b!571129 m!550197))

(declare-fun m!550199 () Bool)

(assert (=> b!571129 m!550199))

(assert (=> b!571129 m!550197))

(declare-fun m!550201 () Bool)

(assert (=> b!571129 m!550201))

(declare-fun m!550203 () Bool)

(assert (=> b!571129 m!550203))

(declare-fun m!550205 () Bool)

(assert (=> b!571129 m!550205))

(assert (=> b!571129 m!550203))

(declare-fun m!550207 () Bool)

(assert (=> b!571129 m!550207))

(assert (=> b!571129 m!550197))

(declare-fun m!550209 () Bool)

(assert (=> b!571129 m!550209))

(assert (=> b!571129 m!550203))

(declare-fun m!550211 () Bool)

(assert (=> b!571127 m!550211))

(assert (=> b!571127 m!550197))

(assert (=> b!571125 m!550197))

(assert (=> b!571125 m!550197))

(declare-fun m!550213 () Bool)

(assert (=> b!571125 m!550213))

(assert (=> b!571119 m!550197))

(assert (=> b!571119 m!550197))

(declare-fun m!550215 () Bool)

(assert (=> b!571119 m!550215))

(declare-fun m!550217 () Bool)

(assert (=> b!571119 m!550217))

(declare-fun m!550219 () Bool)

(assert (=> b!571119 m!550219))

(assert (=> b!571121 m!550197))

(assert (=> b!571121 m!550197))

(declare-fun m!550221 () Bool)

(assert (=> b!571121 m!550221))

(declare-fun m!550223 () Bool)

(assert (=> b!571128 m!550223))

(declare-fun m!550225 () Bool)

(assert (=> b!571124 m!550225))

(check-sat (not b!571128) (not b!571119) (not b!571124) (not b!571123) (not start!52356) (not b!571121) (not b!571125) (not b!571129) (not b!571126) (not b!571120))
(check-sat)
