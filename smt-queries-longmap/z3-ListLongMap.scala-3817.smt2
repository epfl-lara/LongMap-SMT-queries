; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52390 () Bool)

(assert start!52390)

(declare-fun b!571568 () Bool)

(declare-fun e!328742 () Bool)

(declare-fun e!328739 () Bool)

(assert (=> b!571568 (= e!328742 e!328739)))

(declare-fun res!361088 () Bool)

(assert (=> b!571568 (=> (not res!361088) (not e!328739))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!260635 () (_ BitVec 32))

(declare-datatypes ((array!35787 0))(
  ( (array!35788 (arr!17182 (Array (_ BitVec 32) (_ BitVec 64))) (size!17546 (_ BitVec 32))) )
))
(declare-fun lt!260641 () array!35787)

(declare-datatypes ((SeekEntryResult!5631 0))(
  ( (MissingZero!5631 (index!24751 (_ BitVec 32))) (Found!5631 (index!24752 (_ BitVec 32))) (Intermediate!5631 (undefined!6443 Bool) (index!24753 (_ BitVec 32)) (x!53628 (_ BitVec 32))) (Undefined!5631) (MissingVacant!5631 (index!24754 (_ BitVec 32))) )
))
(declare-fun lt!260633 () SeekEntryResult!5631)

(declare-fun lt!260636 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35787 (_ BitVec 32)) SeekEntryResult!5631)

(assert (=> b!571568 (= res!361088 (= lt!260633 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260635 lt!260636 lt!260641 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!260637 () (_ BitVec 32))

(declare-fun a!3118 () array!35787)

(assert (=> b!571568 (= lt!260633 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260637 (select (arr!17182 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571568 (= lt!260635 (toIndex!0 lt!260636 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571568 (= lt!260636 (select (store (arr!17182 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!571568 (= lt!260637 (toIndex!0 (select (arr!17182 a!3118) j!142) mask!3119))))

(assert (=> b!571568 (= lt!260641 (array!35788 (store (arr!17182 a!3118) i!1132 k0!1914) (size!17546 a!3118)))))

(declare-fun b!571569 () Bool)

(declare-fun res!361078 () Bool)

(assert (=> b!571569 (=> (not res!361078) (not e!328742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35787 (_ BitVec 32)) Bool)

(assert (=> b!571569 (= res!361078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571570 () Bool)

(declare-fun e!328740 () Bool)

(declare-fun e!328746 () Bool)

(assert (=> b!571570 (= e!328740 e!328746)))

(declare-fun res!361077 () Bool)

(assert (=> b!571570 (=> res!361077 e!328746)))

(get-info :version)

(assert (=> b!571570 (= res!361077 (or (undefined!6443 lt!260633) (not ((_ is Intermediate!5631) lt!260633))))))

(declare-fun b!571571 () Bool)

(declare-fun res!361076 () Bool)

(assert (=> b!571571 (=> (not res!361076) (not e!328742))))

(declare-datatypes ((List!11262 0))(
  ( (Nil!11259) (Cons!11258 (h!12285 (_ BitVec 64)) (t!17490 List!11262)) )
))
(declare-fun arrayNoDuplicates!0 (array!35787 (_ BitVec 32) List!11262) Bool)

(assert (=> b!571571 (= res!361076 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11259))))

(declare-fun b!571572 () Bool)

(declare-fun e!328744 () Bool)

(assert (=> b!571572 (= e!328744 e!328742)))

(declare-fun res!361079 () Bool)

(assert (=> b!571572 (=> (not res!361079) (not e!328742))))

(declare-fun lt!260634 () SeekEntryResult!5631)

(assert (=> b!571572 (= res!361079 (or (= lt!260634 (MissingZero!5631 i!1132)) (= lt!260634 (MissingVacant!5631 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35787 (_ BitVec 32)) SeekEntryResult!5631)

(assert (=> b!571572 (= lt!260634 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!571573 () Bool)

(declare-fun res!361081 () Bool)

(assert (=> b!571573 (=> (not res!361081) (not e!328744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571573 (= res!361081 (validKeyInArray!0 (select (arr!17182 a!3118) j!142)))))

(declare-fun res!361087 () Bool)

(assert (=> start!52390 (=> (not res!361087) (not e!328744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52390 (= res!361087 (validMask!0 mask!3119))))

(assert (=> start!52390 e!328744))

(assert (=> start!52390 true))

(declare-fun array_inv!12978 (array!35787) Bool)

(assert (=> start!52390 (array_inv!12978 a!3118)))

(declare-fun b!571574 () Bool)

(declare-fun res!361082 () Bool)

(assert (=> b!571574 (=> (not res!361082) (not e!328744))))

(declare-fun arrayContainsKey!0 (array!35787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571574 (= res!361082 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571575 () Bool)

(assert (=> b!571575 (= e!328739 (not true))))

(assert (=> b!571575 e!328740))

(declare-fun res!361086 () Bool)

(assert (=> b!571575 (=> (not res!361086) (not e!328740))))

(declare-fun lt!260640 () SeekEntryResult!5631)

(assert (=> b!571575 (= res!361086 (= lt!260640 (Found!5631 j!142)))))

(assert (=> b!571575 (= lt!260640 (seekEntryOrOpen!0 (select (arr!17182 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!571575 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17964 0))(
  ( (Unit!17965) )
))
(declare-fun lt!260639 () Unit!17964)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17964)

(assert (=> b!571575 (= lt!260639 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571576 () Bool)

(declare-fun e!328741 () Bool)

(assert (=> b!571576 (= e!328746 e!328741)))

(declare-fun res!361084 () Bool)

(assert (=> b!571576 (=> res!361084 e!328741)))

(declare-fun lt!260638 () (_ BitVec 64))

(assert (=> b!571576 (= res!361084 (or (= lt!260638 (select (arr!17182 a!3118) j!142)) (= lt!260638 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571576 (= lt!260638 (select (arr!17182 a!3118) (index!24753 lt!260633)))))

(declare-fun b!571577 () Bool)

(declare-fun res!361083 () Bool)

(assert (=> b!571577 (=> (not res!361083) (not e!328744))))

(assert (=> b!571577 (= res!361083 (and (= (size!17546 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17546 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17546 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571578 () Bool)

(declare-fun e!328743 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35787 (_ BitVec 32)) SeekEntryResult!5631)

(assert (=> b!571578 (= e!328743 (= (seekEntryOrOpen!0 lt!260636 lt!260641 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53628 lt!260633) (index!24753 lt!260633) (index!24753 lt!260633) lt!260636 lt!260641 mask!3119)))))

(declare-fun b!571579 () Bool)

(assert (=> b!571579 (= e!328741 e!328743)))

(declare-fun res!361085 () Bool)

(assert (=> b!571579 (=> (not res!361085) (not e!328743))))

(assert (=> b!571579 (= res!361085 (= lt!260640 (seekKeyOrZeroReturnVacant!0 (x!53628 lt!260633) (index!24753 lt!260633) (index!24753 lt!260633) (select (arr!17182 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571580 () Bool)

(declare-fun res!361080 () Bool)

(assert (=> b!571580 (=> (not res!361080) (not e!328744))))

(assert (=> b!571580 (= res!361080 (validKeyInArray!0 k0!1914))))

(assert (= (and start!52390 res!361087) b!571577))

(assert (= (and b!571577 res!361083) b!571573))

(assert (= (and b!571573 res!361081) b!571580))

(assert (= (and b!571580 res!361080) b!571574))

(assert (= (and b!571574 res!361082) b!571572))

(assert (= (and b!571572 res!361079) b!571569))

(assert (= (and b!571569 res!361078) b!571571))

(assert (= (and b!571571 res!361076) b!571568))

(assert (= (and b!571568 res!361088) b!571575))

(assert (= (and b!571575 res!361086) b!571570))

(assert (= (and b!571570 (not res!361077)) b!571576))

(assert (= (and b!571576 (not res!361084)) b!571579))

(assert (= (and b!571579 res!361085) b!571578))

(declare-fun m!550433 () Bool)

(assert (=> b!571569 m!550433))

(declare-fun m!550435 () Bool)

(assert (=> b!571571 m!550435))

(declare-fun m!550437 () Bool)

(assert (=> b!571579 m!550437))

(assert (=> b!571579 m!550437))

(declare-fun m!550439 () Bool)

(assert (=> b!571579 m!550439))

(assert (=> b!571573 m!550437))

(assert (=> b!571573 m!550437))

(declare-fun m!550441 () Bool)

(assert (=> b!571573 m!550441))

(declare-fun m!550443 () Bool)

(assert (=> b!571578 m!550443))

(declare-fun m!550445 () Bool)

(assert (=> b!571578 m!550445))

(declare-fun m!550447 () Bool)

(assert (=> b!571574 m!550447))

(declare-fun m!550449 () Bool)

(assert (=> b!571580 m!550449))

(assert (=> b!571568 m!550437))

(declare-fun m!550451 () Bool)

(assert (=> b!571568 m!550451))

(assert (=> b!571568 m!550437))

(declare-fun m!550453 () Bool)

(assert (=> b!571568 m!550453))

(declare-fun m!550455 () Bool)

(assert (=> b!571568 m!550455))

(assert (=> b!571568 m!550437))

(declare-fun m!550457 () Bool)

(assert (=> b!571568 m!550457))

(declare-fun m!550459 () Bool)

(assert (=> b!571568 m!550459))

(declare-fun m!550461 () Bool)

(assert (=> b!571568 m!550461))

(assert (=> b!571576 m!550437))

(declare-fun m!550463 () Bool)

(assert (=> b!571576 m!550463))

(declare-fun m!550465 () Bool)

(assert (=> start!52390 m!550465))

(declare-fun m!550467 () Bool)

(assert (=> start!52390 m!550467))

(assert (=> b!571575 m!550437))

(assert (=> b!571575 m!550437))

(declare-fun m!550469 () Bool)

(assert (=> b!571575 m!550469))

(declare-fun m!550471 () Bool)

(assert (=> b!571575 m!550471))

(declare-fun m!550473 () Bool)

(assert (=> b!571575 m!550473))

(declare-fun m!550475 () Bool)

(assert (=> b!571572 m!550475))

(check-sat (not b!571571) (not b!571574) (not b!571575) (not b!571573) (not b!571572) (not b!571568) (not b!571579) (not start!52390) (not b!571569) (not b!571578) (not b!571580))
(check-sat)
