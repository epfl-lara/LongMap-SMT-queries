; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46846 () Bool)

(assert start!46846)

(declare-fun b!517123 () Bool)

(declare-fun res!316510 () Bool)

(declare-fun e!301769 () Bool)

(assert (=> b!517123 (=> (not res!316510) (not e!301769))))

(declare-datatypes ((array!33101 0))(
  ( (array!33102 (arr!15917 (Array (_ BitVec 32) (_ BitVec 64))) (size!16281 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33101)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517123 (= res!316510 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!316509 () Bool)

(assert (=> start!46846 (=> (not res!316509) (not e!301769))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46846 (= res!316509 (validMask!0 mask!3524))))

(assert (=> start!46846 e!301769))

(assert (=> start!46846 true))

(declare-fun array_inv!11713 (array!33101) Bool)

(assert (=> start!46846 (array_inv!11713 a!3235)))

(declare-fun b!517124 () Bool)

(declare-fun e!301770 () Bool)

(assert (=> b!517124 (= e!301770 true)))

(declare-datatypes ((SeekEntryResult!4384 0))(
  ( (MissingZero!4384 (index!19724 (_ BitVec 32))) (Found!4384 (index!19725 (_ BitVec 32))) (Intermediate!4384 (undefined!5196 Bool) (index!19726 (_ BitVec 32)) (x!48681 (_ BitVec 32))) (Undefined!4384) (MissingVacant!4384 (index!19727 (_ BitVec 32))) )
))
(declare-fun lt!236726 () SeekEntryResult!4384)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!517124 (and (bvslt (x!48681 lt!236726) #b01111111111111111111111111111110) (or (= (select (arr!15917 a!3235) (index!19726 lt!236726)) (select (arr!15917 a!3235) j!176)) (= (select (arr!15917 a!3235) (index!19726 lt!236726)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15917 a!3235) (index!19726 lt!236726)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517125 () Bool)

(declare-fun res!316508 () Bool)

(assert (=> b!517125 (=> (not res!316508) (not e!301769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517125 (= res!316508 (validKeyInArray!0 (select (arr!15917 a!3235) j!176)))))

(declare-fun b!517126 () Bool)

(declare-fun res!316506 () Bool)

(assert (=> b!517126 (=> (not res!316506) (not e!301769))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!517126 (= res!316506 (and (= (size!16281 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16281 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16281 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517127 () Bool)

(declare-fun res!316513 () Bool)

(declare-fun e!301767 () Bool)

(assert (=> b!517127 (=> (not res!316513) (not e!301767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33101 (_ BitVec 32)) Bool)

(assert (=> b!517127 (= res!316513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!517128 () Bool)

(assert (=> b!517128 (= e!301769 e!301767)))

(declare-fun res!316514 () Bool)

(assert (=> b!517128 (=> (not res!316514) (not e!301767))))

(declare-fun lt!236728 () SeekEntryResult!4384)

(assert (=> b!517128 (= res!316514 (or (= lt!236728 (MissingZero!4384 i!1204)) (= lt!236728 (MissingVacant!4384 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33101 (_ BitVec 32)) SeekEntryResult!4384)

(assert (=> b!517128 (= lt!236728 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!517129 () Bool)

(assert (=> b!517129 (= e!301767 (not e!301770))))

(declare-fun res!316507 () Bool)

(assert (=> b!517129 (=> res!316507 e!301770)))

(declare-fun lt!236725 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33101 (_ BitVec 32)) SeekEntryResult!4384)

(assert (=> b!517129 (= res!316507 (= lt!236726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236725 (select (store (arr!15917 a!3235) i!1204 k!2280) j!176) (array!33102 (store (arr!15917 a!3235) i!1204 k!2280) (size!16281 a!3235)) mask!3524)))))

(declare-fun lt!236724 () (_ BitVec 32))

(assert (=> b!517129 (= lt!236726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236724 (select (arr!15917 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517129 (= lt!236725 (toIndex!0 (select (store (arr!15917 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!517129 (= lt!236724 (toIndex!0 (select (arr!15917 a!3235) j!176) mask!3524))))

(declare-fun e!301768 () Bool)

(assert (=> b!517129 e!301768))

(declare-fun res!316511 () Bool)

(assert (=> b!517129 (=> (not res!316511) (not e!301768))))

(assert (=> b!517129 (= res!316511 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16026 0))(
  ( (Unit!16027) )
))
(declare-fun lt!236727 () Unit!16026)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33101 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16026)

(assert (=> b!517129 (= lt!236727 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!517130 () Bool)

(declare-fun res!316512 () Bool)

(assert (=> b!517130 (=> res!316512 e!301770)))

(assert (=> b!517130 (= res!316512 (or (undefined!5196 lt!236726) (not (is-Intermediate!4384 lt!236726))))))

(declare-fun b!517131 () Bool)

(declare-fun res!316505 () Bool)

(assert (=> b!517131 (=> (not res!316505) (not e!301767))))

(declare-datatypes ((List!10075 0))(
  ( (Nil!10072) (Cons!10071 (h!10972 (_ BitVec 64)) (t!16303 List!10075)) )
))
(declare-fun arrayNoDuplicates!0 (array!33101 (_ BitVec 32) List!10075) Bool)

(assert (=> b!517131 (= res!316505 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10072))))

(declare-fun b!517132 () Bool)

(assert (=> b!517132 (= e!301768 (= (seekEntryOrOpen!0 (select (arr!15917 a!3235) j!176) a!3235 mask!3524) (Found!4384 j!176)))))

(declare-fun b!517133 () Bool)

(declare-fun res!316504 () Bool)

(assert (=> b!517133 (=> (not res!316504) (not e!301769))))

(assert (=> b!517133 (= res!316504 (validKeyInArray!0 k!2280))))

(assert (= (and start!46846 res!316509) b!517126))

(assert (= (and b!517126 res!316506) b!517125))

(assert (= (and b!517125 res!316508) b!517133))

(assert (= (and b!517133 res!316504) b!517123))

(assert (= (and b!517123 res!316510) b!517128))

(assert (= (and b!517128 res!316514) b!517127))

(assert (= (and b!517127 res!316513) b!517131))

(assert (= (and b!517131 res!316505) b!517129))

(assert (= (and b!517129 res!316511) b!517132))

(assert (= (and b!517129 (not res!316507)) b!517130))

(assert (= (and b!517130 (not res!316512)) b!517124))

(declare-fun m!498583 () Bool)

(assert (=> b!517133 m!498583))

(declare-fun m!498585 () Bool)

(assert (=> b!517123 m!498585))

(declare-fun m!498587 () Bool)

(assert (=> b!517128 m!498587))

(declare-fun m!498589 () Bool)

(assert (=> b!517129 m!498589))

(declare-fun m!498591 () Bool)

(assert (=> b!517129 m!498591))

(declare-fun m!498593 () Bool)

(assert (=> b!517129 m!498593))

(declare-fun m!498595 () Bool)

(assert (=> b!517129 m!498595))

(declare-fun m!498597 () Bool)

(assert (=> b!517129 m!498597))

(assert (=> b!517129 m!498595))

(declare-fun m!498599 () Bool)

(assert (=> b!517129 m!498599))

(assert (=> b!517129 m!498593))

(declare-fun m!498601 () Bool)

(assert (=> b!517129 m!498601))

(assert (=> b!517129 m!498593))

(declare-fun m!498603 () Bool)

(assert (=> b!517129 m!498603))

(assert (=> b!517129 m!498595))

(declare-fun m!498605 () Bool)

(assert (=> b!517129 m!498605))

(declare-fun m!498607 () Bool)

(assert (=> b!517127 m!498607))

(declare-fun m!498609 () Bool)

(assert (=> b!517131 m!498609))

(assert (=> b!517132 m!498595))

(assert (=> b!517132 m!498595))

(declare-fun m!498611 () Bool)

(assert (=> b!517132 m!498611))

(assert (=> b!517125 m!498595))

(assert (=> b!517125 m!498595))

(declare-fun m!498613 () Bool)

(assert (=> b!517125 m!498613))

(declare-fun m!498615 () Bool)

(assert (=> start!46846 m!498615))

(declare-fun m!498617 () Bool)

(assert (=> start!46846 m!498617))

(declare-fun m!498619 () Bool)

(assert (=> b!517124 m!498619))

(assert (=> b!517124 m!498595))

(push 1)

