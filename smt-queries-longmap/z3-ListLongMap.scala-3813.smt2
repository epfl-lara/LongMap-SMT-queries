; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52286 () Bool)

(assert start!52286)

(declare-fun b!570450 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5614 0))(
  ( (MissingZero!5614 (index!24683 (_ BitVec 32))) (Found!5614 (index!24684 (_ BitVec 32))) (Intermediate!5614 (undefined!6426 Bool) (index!24685 (_ BitVec 32)) (x!53565 (_ BitVec 32))) (Undefined!5614) (MissingVacant!5614 (index!24686 (_ BitVec 32))) )
))
(declare-fun lt!259955 () SeekEntryResult!5614)

(declare-fun lt!259954 () SeekEntryResult!5614)

(declare-datatypes ((array!35755 0))(
  ( (array!35756 (arr!17168 (Array (_ BitVec 32) (_ BitVec 64))) (size!17533 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35755)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!328064 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35755 (_ BitVec 32)) SeekEntryResult!5614)

(assert (=> b!570450 (= e!328064 (= lt!259955 (seekKeyOrZeroReturnVacant!0 (x!53565 lt!259954) (index!24685 lt!259954) (index!24685 lt!259954) (select (arr!17168 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570451 () Bool)

(declare-fun res!360383 () Bool)

(declare-fun e!328063 () Bool)

(assert (=> b!570451 (=> (not res!360383) (not e!328063))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570451 (= res!360383 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570452 () Bool)

(declare-fun e!328065 () Bool)

(assert (=> b!570452 (= e!328065 e!328064)))

(declare-fun res!360376 () Bool)

(assert (=> b!570452 (=> res!360376 e!328064)))

(get-info :version)

(assert (=> b!570452 (= res!360376 (or (undefined!6426 lt!259954) (not ((_ is Intermediate!5614) lt!259954)) (= (select (arr!17168 a!3118) (index!24685 lt!259954)) (select (arr!17168 a!3118) j!142)) (= (select (arr!17168 a!3118) (index!24685 lt!259954)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!360374 () Bool)

(assert (=> start!52286 (=> (not res!360374) (not e!328063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52286 (= res!360374 (validMask!0 mask!3119))))

(assert (=> start!52286 e!328063))

(assert (=> start!52286 true))

(declare-fun array_inv!13051 (array!35755) Bool)

(assert (=> start!52286 (array_inv!13051 a!3118)))

(declare-fun b!570453 () Bool)

(declare-fun e!328067 () Bool)

(assert (=> b!570453 (= e!328067 (not true))))

(assert (=> b!570453 e!328065))

(declare-fun res!360377 () Bool)

(assert (=> b!570453 (=> (not res!360377) (not e!328065))))

(assert (=> b!570453 (= res!360377 (= lt!259955 (Found!5614 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35755 (_ BitVec 32)) SeekEntryResult!5614)

(assert (=> b!570453 (= lt!259955 (seekEntryOrOpen!0 (select (arr!17168 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35755 (_ BitVec 32)) Bool)

(assert (=> b!570453 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17916 0))(
  ( (Unit!17917) )
))
(declare-fun lt!259956 () Unit!17916)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17916)

(assert (=> b!570453 (= lt!259956 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570454 () Bool)

(declare-fun res!360382 () Bool)

(assert (=> b!570454 (=> (not res!360382) (not e!328063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570454 (= res!360382 (validKeyInArray!0 k0!1914))))

(declare-fun b!570455 () Bool)

(declare-fun res!360380 () Bool)

(assert (=> b!570455 (=> (not res!360380) (not e!328063))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!570455 (= res!360380 (and (= (size!17533 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17533 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17533 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570456 () Bool)

(declare-fun res!360378 () Bool)

(declare-fun e!328066 () Bool)

(assert (=> b!570456 (=> (not res!360378) (not e!328066))))

(declare-datatypes ((List!11287 0))(
  ( (Nil!11284) (Cons!11283 (h!12307 (_ BitVec 64)) (t!17506 List!11287)) )
))
(declare-fun arrayNoDuplicates!0 (array!35755 (_ BitVec 32) List!11287) Bool)

(assert (=> b!570456 (= res!360378 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11284))))

(declare-fun b!570457 () Bool)

(assert (=> b!570457 (= e!328063 e!328066)))

(declare-fun res!360381 () Bool)

(assert (=> b!570457 (=> (not res!360381) (not e!328066))))

(declare-fun lt!259953 () SeekEntryResult!5614)

(assert (=> b!570457 (= res!360381 (or (= lt!259953 (MissingZero!5614 i!1132)) (= lt!259953 (MissingVacant!5614 i!1132))))))

(assert (=> b!570457 (= lt!259953 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!570458 () Bool)

(declare-fun res!360379 () Bool)

(assert (=> b!570458 (=> (not res!360379) (not e!328063))))

(assert (=> b!570458 (= res!360379 (validKeyInArray!0 (select (arr!17168 a!3118) j!142)))))

(declare-fun b!570459 () Bool)

(declare-fun res!360375 () Bool)

(assert (=> b!570459 (=> (not res!360375) (not e!328066))))

(assert (=> b!570459 (= res!360375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570460 () Bool)

(assert (=> b!570460 (= e!328066 e!328067)))

(declare-fun res!360373 () Bool)

(assert (=> b!570460 (=> (not res!360373) (not e!328067))))

(declare-fun lt!259957 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35755 (_ BitVec 32)) SeekEntryResult!5614)

(assert (=> b!570460 (= res!360373 (= lt!259954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259957 (select (store (arr!17168 a!3118) i!1132 k0!1914) j!142) (array!35756 (store (arr!17168 a!3118) i!1132 k0!1914) (size!17533 a!3118)) mask!3119)))))

(declare-fun lt!259952 () (_ BitVec 32))

(assert (=> b!570460 (= lt!259954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259952 (select (arr!17168 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570460 (= lt!259957 (toIndex!0 (select (store (arr!17168 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570460 (= lt!259952 (toIndex!0 (select (arr!17168 a!3118) j!142) mask!3119))))

(assert (= (and start!52286 res!360374) b!570455))

(assert (= (and b!570455 res!360380) b!570458))

(assert (= (and b!570458 res!360379) b!570454))

(assert (= (and b!570454 res!360382) b!570451))

(assert (= (and b!570451 res!360383) b!570457))

(assert (= (and b!570457 res!360381) b!570459))

(assert (= (and b!570459 res!360375) b!570456))

(assert (= (and b!570456 res!360378) b!570460))

(assert (= (and b!570460 res!360373) b!570453))

(assert (= (and b!570453 res!360377) b!570452))

(assert (= (and b!570452 (not res!360376)) b!570450))

(declare-fun m!548837 () Bool)

(assert (=> b!570458 m!548837))

(assert (=> b!570458 m!548837))

(declare-fun m!548839 () Bool)

(assert (=> b!570458 m!548839))

(declare-fun m!548841 () Bool)

(assert (=> start!52286 m!548841))

(declare-fun m!548843 () Bool)

(assert (=> start!52286 m!548843))

(assert (=> b!570450 m!548837))

(assert (=> b!570450 m!548837))

(declare-fun m!548845 () Bool)

(assert (=> b!570450 m!548845))

(declare-fun m!548847 () Bool)

(assert (=> b!570454 m!548847))

(assert (=> b!570453 m!548837))

(assert (=> b!570453 m!548837))

(declare-fun m!548849 () Bool)

(assert (=> b!570453 m!548849))

(declare-fun m!548851 () Bool)

(assert (=> b!570453 m!548851))

(declare-fun m!548853 () Bool)

(assert (=> b!570453 m!548853))

(declare-fun m!548855 () Bool)

(assert (=> b!570457 m!548855))

(declare-fun m!548857 () Bool)

(assert (=> b!570452 m!548857))

(assert (=> b!570452 m!548837))

(declare-fun m!548859 () Bool)

(assert (=> b!570451 m!548859))

(declare-fun m!548861 () Bool)

(assert (=> b!570459 m!548861))

(assert (=> b!570460 m!548837))

(declare-fun m!548863 () Bool)

(assert (=> b!570460 m!548863))

(declare-fun m!548865 () Bool)

(assert (=> b!570460 m!548865))

(assert (=> b!570460 m!548865))

(declare-fun m!548867 () Bool)

(assert (=> b!570460 m!548867))

(assert (=> b!570460 m!548837))

(declare-fun m!548869 () Bool)

(assert (=> b!570460 m!548869))

(assert (=> b!570460 m!548837))

(declare-fun m!548871 () Bool)

(assert (=> b!570460 m!548871))

(assert (=> b!570460 m!548865))

(declare-fun m!548873 () Bool)

(assert (=> b!570460 m!548873))

(declare-fun m!548875 () Bool)

(assert (=> b!570456 m!548875))

(check-sat (not b!570457) (not b!570456) (not b!570453) (not b!570458) (not b!570460) (not b!570450) (not b!570454) (not b!570459) (not b!570451) (not start!52286))
(check-sat)
