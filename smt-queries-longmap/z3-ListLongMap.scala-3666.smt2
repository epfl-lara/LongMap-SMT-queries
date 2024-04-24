; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50658 () Bool)

(assert start!50658)

(declare-fun b!553294 () Bool)

(declare-fun res!345604 () Bool)

(declare-fun e!319224 () Bool)

(assert (=> b!553294 (=> (not res!345604) (not e!319224))))

(declare-datatypes ((array!34830 0))(
  ( (array!34831 (arr!16723 (Array (_ BitVec 32) (_ BitVec 64))) (size!17087 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34830)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34830 (_ BitVec 32)) Bool)

(assert (=> b!553294 (= res!345604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553295 () Bool)

(assert (=> b!553295 (= e!319224 (not true))))

(declare-fun e!319222 () Bool)

(assert (=> b!553295 e!319222))

(declare-fun res!345601 () Bool)

(assert (=> b!553295 (=> (not res!345601) (not e!319222))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!553295 (= res!345601 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17101 0))(
  ( (Unit!17102) )
))
(declare-fun lt!251475 () Unit!17101)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34830 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17101)

(assert (=> b!553295 (= lt!251475 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553296 () Bool)

(declare-datatypes ((SeekEntryResult!5128 0))(
  ( (MissingZero!5128 (index!22739 (_ BitVec 32))) (Found!5128 (index!22740 (_ BitVec 32))) (Intermediate!5128 (undefined!5940 Bool) (index!22741 (_ BitVec 32)) (x!51821 (_ BitVec 32))) (Undefined!5128) (MissingVacant!5128 (index!22742 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34830 (_ BitVec 32)) SeekEntryResult!5128)

(assert (=> b!553296 (= e!319222 (= (seekEntryOrOpen!0 (select (arr!16723 a!3118) j!142) a!3118 mask!3119) (Found!5128 j!142)))))

(declare-fun b!553297 () Bool)

(declare-fun res!345605 () Bool)

(declare-fun e!319223 () Bool)

(assert (=> b!553297 (=> (not res!345605) (not e!319223))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553297 (= res!345605 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!345606 () Bool)

(assert (=> start!50658 (=> (not res!345606) (not e!319223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50658 (= res!345606 (validMask!0 mask!3119))))

(assert (=> start!50658 e!319223))

(assert (=> start!50658 true))

(declare-fun array_inv!12582 (array!34830) Bool)

(assert (=> start!50658 (array_inv!12582 a!3118)))

(declare-fun b!553298 () Bool)

(declare-fun res!345608 () Bool)

(assert (=> b!553298 (=> (not res!345608) (not e!319223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553298 (= res!345608 (validKeyInArray!0 k0!1914))))

(declare-fun b!553299 () Bool)

(declare-fun res!345607 () Bool)

(assert (=> b!553299 (=> (not res!345607) (not e!319224))))

(declare-datatypes ((List!10710 0))(
  ( (Nil!10707) (Cons!10706 (h!11694 (_ BitVec 64)) (t!16930 List!10710)) )
))
(declare-fun arrayNoDuplicates!0 (array!34830 (_ BitVec 32) List!10710) Bool)

(assert (=> b!553299 (= res!345607 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10707))))

(declare-fun b!553300 () Bool)

(declare-fun res!345610 () Bool)

(assert (=> b!553300 (=> (not res!345610) (not e!319223))))

(assert (=> b!553300 (= res!345610 (validKeyInArray!0 (select (arr!16723 a!3118) j!142)))))

(declare-fun b!553301 () Bool)

(declare-fun res!345602 () Bool)

(assert (=> b!553301 (=> (not res!345602) (not e!319223))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553301 (= res!345602 (and (= (size!17087 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17087 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17087 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553302 () Bool)

(assert (=> b!553302 (= e!319223 e!319224)))

(declare-fun res!345609 () Bool)

(assert (=> b!553302 (=> (not res!345609) (not e!319224))))

(declare-fun lt!251476 () SeekEntryResult!5128)

(assert (=> b!553302 (= res!345609 (or (= lt!251476 (MissingZero!5128 i!1132)) (= lt!251476 (MissingVacant!5128 i!1132))))))

(assert (=> b!553302 (= lt!251476 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553303 () Bool)

(declare-fun res!345603 () Bool)

(assert (=> b!553303 (=> (not res!345603) (not e!319224))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34830 (_ BitVec 32)) SeekEntryResult!5128)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553303 (= res!345603 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16723 a!3118) j!142) mask!3119) (select (arr!16723 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16723 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16723 a!3118) i!1132 k0!1914) j!142) (array!34831 (store (arr!16723 a!3118) i!1132 k0!1914) (size!17087 a!3118)) mask!3119)))))

(assert (= (and start!50658 res!345606) b!553301))

(assert (= (and b!553301 res!345602) b!553300))

(assert (= (and b!553300 res!345610) b!553298))

(assert (= (and b!553298 res!345608) b!553297))

(assert (= (and b!553297 res!345605) b!553302))

(assert (= (and b!553302 res!345609) b!553294))

(assert (= (and b!553294 res!345604) b!553299))

(assert (= (and b!553299 res!345607) b!553303))

(assert (= (and b!553303 res!345603) b!553295))

(assert (= (and b!553295 res!345601) b!553296))

(declare-fun m!530447 () Bool)

(assert (=> b!553300 m!530447))

(assert (=> b!553300 m!530447))

(declare-fun m!530449 () Bool)

(assert (=> b!553300 m!530449))

(declare-fun m!530451 () Bool)

(assert (=> start!50658 m!530451))

(declare-fun m!530453 () Bool)

(assert (=> start!50658 m!530453))

(declare-fun m!530455 () Bool)

(assert (=> b!553294 m!530455))

(assert (=> b!553296 m!530447))

(assert (=> b!553296 m!530447))

(declare-fun m!530457 () Bool)

(assert (=> b!553296 m!530457))

(declare-fun m!530459 () Bool)

(assert (=> b!553295 m!530459))

(declare-fun m!530461 () Bool)

(assert (=> b!553295 m!530461))

(assert (=> b!553303 m!530447))

(declare-fun m!530463 () Bool)

(assert (=> b!553303 m!530463))

(assert (=> b!553303 m!530447))

(declare-fun m!530465 () Bool)

(assert (=> b!553303 m!530465))

(declare-fun m!530467 () Bool)

(assert (=> b!553303 m!530467))

(assert (=> b!553303 m!530465))

(declare-fun m!530469 () Bool)

(assert (=> b!553303 m!530469))

(assert (=> b!553303 m!530463))

(assert (=> b!553303 m!530447))

(declare-fun m!530471 () Bool)

(assert (=> b!553303 m!530471))

(declare-fun m!530473 () Bool)

(assert (=> b!553303 m!530473))

(assert (=> b!553303 m!530465))

(assert (=> b!553303 m!530467))

(declare-fun m!530475 () Bool)

(assert (=> b!553297 m!530475))

(declare-fun m!530477 () Bool)

(assert (=> b!553298 m!530477))

(declare-fun m!530479 () Bool)

(assert (=> b!553302 m!530479))

(declare-fun m!530481 () Bool)

(assert (=> b!553299 m!530481))

(check-sat (not b!553299) (not b!553300) (not b!553298) (not b!553302) (not b!553303) (not b!553294) (not b!553295) (not b!553296) (not b!553297) (not start!50658))
(check-sat)
