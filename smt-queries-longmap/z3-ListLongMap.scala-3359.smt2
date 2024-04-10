; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46208 () Bool)

(assert start!46208)

(declare-fun res!312272 () Bool)

(declare-fun e!298933 () Bool)

(assert (=> start!46208 (=> (not res!312272) (not e!298933))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46208 (= res!312272 (validMask!0 mask!3524))))

(assert (=> start!46208 e!298933))

(assert (=> start!46208 true))

(declare-datatypes ((array!32862 0))(
  ( (array!32863 (arr!15808 (Array (_ BitVec 32) (_ BitVec 64))) (size!16172 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32862)

(declare-fun array_inv!11604 (array!32862) Bool)

(assert (=> start!46208 (array_inv!11604 a!3235)))

(declare-fun b!511610 () Bool)

(declare-fun res!312274 () Bool)

(declare-fun e!298932 () Bool)

(assert (=> b!511610 (=> (not res!312274) (not e!298932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32862 (_ BitVec 32)) Bool)

(assert (=> b!511610 (= res!312274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511611 () Bool)

(declare-fun res!312275 () Bool)

(assert (=> b!511611 (=> (not res!312275) (not e!298933))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511611 (= res!312275 (validKeyInArray!0 k0!2280))))

(declare-fun b!511612 () Bool)

(declare-fun e!298935 () Bool)

(assert (=> b!511612 (= e!298932 (not e!298935))))

(declare-fun res!312278 () Bool)

(assert (=> b!511612 (=> res!312278 e!298935)))

(declare-fun lt!234088 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4275 0))(
  ( (MissingZero!4275 (index!19288 (_ BitVec 32))) (Found!4275 (index!19289 (_ BitVec 32))) (Intermediate!4275 (undefined!5087 Bool) (index!19290 (_ BitVec 32)) (x!48242 (_ BitVec 32))) (Undefined!4275) (MissingVacant!4275 (index!19291 (_ BitVec 32))) )
))
(declare-fun lt!234087 () SeekEntryResult!4275)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32862 (_ BitVec 32)) SeekEntryResult!4275)

(assert (=> b!511612 (= res!312278 (= lt!234087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234088 (select (store (arr!15808 a!3235) i!1204 k0!2280) j!176) (array!32863 (store (arr!15808 a!3235) i!1204 k0!2280) (size!16172 a!3235)) mask!3524)))))

(declare-fun lt!234086 () (_ BitVec 32))

(assert (=> b!511612 (= lt!234087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234086 (select (arr!15808 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511612 (= lt!234088 (toIndex!0 (select (store (arr!15808 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511612 (= lt!234086 (toIndex!0 (select (arr!15808 a!3235) j!176) mask!3524))))

(declare-fun lt!234084 () SeekEntryResult!4275)

(assert (=> b!511612 (= lt!234084 (Found!4275 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32862 (_ BitVec 32)) SeekEntryResult!4275)

(assert (=> b!511612 (= lt!234084 (seekEntryOrOpen!0 (select (arr!15808 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511612 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15808 0))(
  ( (Unit!15809) )
))
(declare-fun lt!234083 () Unit!15808)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32862 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15808)

(assert (=> b!511612 (= lt!234083 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511613 () Bool)

(declare-fun res!312273 () Bool)

(assert (=> b!511613 (=> (not res!312273) (not e!298933))))

(assert (=> b!511613 (= res!312273 (and (= (size!16172 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16172 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16172 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511614 () Bool)

(declare-fun res!312279 () Bool)

(assert (=> b!511614 (=> (not res!312279) (not e!298933))))

(assert (=> b!511614 (= res!312279 (validKeyInArray!0 (select (arr!15808 a!3235) j!176)))))

(declare-fun b!511615 () Bool)

(declare-fun res!312276 () Bool)

(assert (=> b!511615 (=> (not res!312276) (not e!298933))))

(declare-fun arrayContainsKey!0 (array!32862 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511615 (= res!312276 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511616 () Bool)

(declare-fun res!312277 () Bool)

(assert (=> b!511616 (=> (not res!312277) (not e!298932))))

(declare-datatypes ((List!9966 0))(
  ( (Nil!9963) (Cons!9962 (h!10842 (_ BitVec 64)) (t!16194 List!9966)) )
))
(declare-fun arrayNoDuplicates!0 (array!32862 (_ BitVec 32) List!9966) Bool)

(assert (=> b!511616 (= res!312277 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9963))))

(declare-fun b!511617 () Bool)

(assert (=> b!511617 (= e!298935 (bvsle #b00000000000000000000000000000000 (size!16172 a!3235)))))

(assert (=> b!511617 (= lt!234084 Undefined!4275)))

(declare-fun b!511618 () Bool)

(declare-fun res!312281 () Bool)

(assert (=> b!511618 (=> res!312281 e!298935)))

(get-info :version)

(assert (=> b!511618 (= res!312281 (or (not ((_ is Intermediate!4275) lt!234087)) (not (undefined!5087 lt!234087))))))

(declare-fun b!511619 () Bool)

(assert (=> b!511619 (= e!298933 e!298932)))

(declare-fun res!312280 () Bool)

(assert (=> b!511619 (=> (not res!312280) (not e!298932))))

(declare-fun lt!234085 () SeekEntryResult!4275)

(assert (=> b!511619 (= res!312280 (or (= lt!234085 (MissingZero!4275 i!1204)) (= lt!234085 (MissingVacant!4275 i!1204))))))

(assert (=> b!511619 (= lt!234085 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46208 res!312272) b!511613))

(assert (= (and b!511613 res!312273) b!511614))

(assert (= (and b!511614 res!312279) b!511611))

(assert (= (and b!511611 res!312275) b!511615))

(assert (= (and b!511615 res!312276) b!511619))

(assert (= (and b!511619 res!312280) b!511610))

(assert (= (and b!511610 res!312274) b!511616))

(assert (= (and b!511616 res!312277) b!511612))

(assert (= (and b!511612 (not res!312278)) b!511618))

(assert (= (and b!511618 (not res!312281)) b!511617))

(declare-fun m!493101 () Bool)

(assert (=> b!511610 m!493101))

(declare-fun m!493103 () Bool)

(assert (=> b!511615 m!493103))

(declare-fun m!493105 () Bool)

(assert (=> start!46208 m!493105))

(declare-fun m!493107 () Bool)

(assert (=> start!46208 m!493107))

(declare-fun m!493109 () Bool)

(assert (=> b!511619 m!493109))

(declare-fun m!493111 () Bool)

(assert (=> b!511612 m!493111))

(declare-fun m!493113 () Bool)

(assert (=> b!511612 m!493113))

(declare-fun m!493115 () Bool)

(assert (=> b!511612 m!493115))

(declare-fun m!493117 () Bool)

(assert (=> b!511612 m!493117))

(assert (=> b!511612 m!493111))

(declare-fun m!493119 () Bool)

(assert (=> b!511612 m!493119))

(declare-fun m!493121 () Bool)

(assert (=> b!511612 m!493121))

(assert (=> b!511612 m!493119))

(declare-fun m!493123 () Bool)

(assert (=> b!511612 m!493123))

(assert (=> b!511612 m!493119))

(declare-fun m!493125 () Bool)

(assert (=> b!511612 m!493125))

(assert (=> b!511612 m!493119))

(declare-fun m!493127 () Bool)

(assert (=> b!511612 m!493127))

(assert (=> b!511612 m!493111))

(declare-fun m!493129 () Bool)

(assert (=> b!511612 m!493129))

(declare-fun m!493131 () Bool)

(assert (=> b!511616 m!493131))

(assert (=> b!511614 m!493119))

(assert (=> b!511614 m!493119))

(declare-fun m!493133 () Bool)

(assert (=> b!511614 m!493133))

(declare-fun m!493135 () Bool)

(assert (=> b!511611 m!493135))

(check-sat (not b!511614) (not b!511610) (not start!46208) (not b!511615) (not b!511611) (not b!511612) (not b!511619) (not b!511616))
(check-sat)
