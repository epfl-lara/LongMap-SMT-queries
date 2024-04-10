; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45014 () Bool)

(assert start!45014)

(declare-fun b!493856 () Bool)

(declare-fun res!296430 () Bool)

(declare-fun e!289953 () Bool)

(assert (=> b!493856 (=> (not res!296430) (not e!289953))))

(declare-datatypes ((array!31959 0))(
  ( (array!31960 (arr!15364 (Array (_ BitVec 32) (_ BitVec 64))) (size!15728 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31959)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493856 (= res!296430 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493857 () Bool)

(declare-fun res!296432 () Bool)

(assert (=> b!493857 (=> (not res!296432) (not e!289953))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493857 (= res!296432 (and (= (size!15728 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15728 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15728 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493858 () Bool)

(declare-fun res!296428 () Bool)

(assert (=> b!493858 (=> (not res!296428) (not e!289953))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493858 (= res!296428 (validKeyInArray!0 (select (arr!15364 a!3235) j!176)))))

(declare-fun b!493859 () Bool)

(declare-fun res!296427 () Bool)

(declare-fun e!289951 () Bool)

(assert (=> b!493859 (=> (not res!296427) (not e!289951))))

(declare-datatypes ((List!9522 0))(
  ( (Nil!9519) (Cons!9518 (h!10386 (_ BitVec 64)) (t!15750 List!9522)) )
))
(declare-fun arrayNoDuplicates!0 (array!31959 (_ BitVec 32) List!9522) Bool)

(assert (=> b!493859 (= res!296427 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9519))))

(declare-fun b!493860 () Bool)

(declare-fun res!296429 () Bool)

(assert (=> b!493860 (=> (not res!296429) (not e!289951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31959 (_ BitVec 32)) Bool)

(assert (=> b!493860 (= res!296429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493862 () Bool)

(declare-fun e!289950 () Bool)

(assert (=> b!493862 (= e!289951 (not e!289950))))

(declare-fun res!296426 () Bool)

(assert (=> b!493862 (=> res!296426 e!289950)))

(declare-fun lt!223426 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3831 0))(
  ( (MissingZero!3831 (index!17503 (_ BitVec 32))) (Found!3831 (index!17504 (_ BitVec 32))) (Intermediate!3831 (undefined!4643 Bool) (index!17505 (_ BitVec 32)) (x!46581 (_ BitVec 32))) (Undefined!3831) (MissingVacant!3831 (index!17506 (_ BitVec 32))) )
))
(declare-fun lt!223422 () SeekEntryResult!3831)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31959 (_ BitVec 32)) SeekEntryResult!3831)

(assert (=> b!493862 (= res!296426 (= lt!223422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223426 (select (store (arr!15364 a!3235) i!1204 k0!2280) j!176) (array!31960 (store (arr!15364 a!3235) i!1204 k0!2280) (size!15728 a!3235)) mask!3524)))))

(declare-fun lt!223421 () (_ BitVec 32))

(assert (=> b!493862 (= lt!223422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223421 (select (arr!15364 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493862 (= lt!223426 (toIndex!0 (select (store (arr!15364 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493862 (= lt!223421 (toIndex!0 (select (arr!15364 a!3235) j!176) mask!3524))))

(declare-fun lt!223423 () SeekEntryResult!3831)

(assert (=> b!493862 (= lt!223423 (Found!3831 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31959 (_ BitVec 32)) SeekEntryResult!3831)

(assert (=> b!493862 (= lt!223423 (seekEntryOrOpen!0 (select (arr!15364 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!493862 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14608 0))(
  ( (Unit!14609) )
))
(declare-fun lt!223425 () Unit!14608)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31959 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14608)

(assert (=> b!493862 (= lt!223425 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493863 () Bool)

(declare-fun res!296433 () Bool)

(assert (=> b!493863 (=> (not res!296433) (not e!289953))))

(assert (=> b!493863 (= res!296433 (validKeyInArray!0 k0!2280))))

(declare-fun b!493864 () Bool)

(declare-fun res!296434 () Bool)

(assert (=> b!493864 (=> res!296434 e!289950)))

(get-info :version)

(assert (=> b!493864 (= res!296434 (or (not ((_ is Intermediate!3831) lt!223422)) (not (undefined!4643 lt!223422))))))

(declare-fun b!493865 () Bool)

(assert (=> b!493865 (= e!289950 true)))

(assert (=> b!493865 (= lt!223423 Undefined!3831)))

(declare-fun res!296431 () Bool)

(assert (=> start!45014 (=> (not res!296431) (not e!289953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45014 (= res!296431 (validMask!0 mask!3524))))

(assert (=> start!45014 e!289953))

(assert (=> start!45014 true))

(declare-fun array_inv!11160 (array!31959) Bool)

(assert (=> start!45014 (array_inv!11160 a!3235)))

(declare-fun b!493861 () Bool)

(assert (=> b!493861 (= e!289953 e!289951)))

(declare-fun res!296435 () Bool)

(assert (=> b!493861 (=> (not res!296435) (not e!289951))))

(declare-fun lt!223424 () SeekEntryResult!3831)

(assert (=> b!493861 (= res!296435 (or (= lt!223424 (MissingZero!3831 i!1204)) (= lt!223424 (MissingVacant!3831 i!1204))))))

(assert (=> b!493861 (= lt!223424 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45014 res!296431) b!493857))

(assert (= (and b!493857 res!296432) b!493858))

(assert (= (and b!493858 res!296428) b!493863))

(assert (= (and b!493863 res!296433) b!493856))

(assert (= (and b!493856 res!296430) b!493861))

(assert (= (and b!493861 res!296435) b!493860))

(assert (= (and b!493860 res!296429) b!493859))

(assert (= (and b!493859 res!296427) b!493862))

(assert (= (and b!493862 (not res!296426)) b!493864))

(assert (= (and b!493864 (not res!296434)) b!493865))

(declare-fun m!474783 () Bool)

(assert (=> b!493858 m!474783))

(assert (=> b!493858 m!474783))

(declare-fun m!474785 () Bool)

(assert (=> b!493858 m!474785))

(declare-fun m!474787 () Bool)

(assert (=> b!493861 m!474787))

(declare-fun m!474789 () Bool)

(assert (=> b!493862 m!474789))

(declare-fun m!474791 () Bool)

(assert (=> b!493862 m!474791))

(declare-fun m!474793 () Bool)

(assert (=> b!493862 m!474793))

(assert (=> b!493862 m!474783))

(declare-fun m!474795 () Bool)

(assert (=> b!493862 m!474795))

(declare-fun m!474797 () Bool)

(assert (=> b!493862 m!474797))

(assert (=> b!493862 m!474783))

(declare-fun m!474799 () Bool)

(assert (=> b!493862 m!474799))

(assert (=> b!493862 m!474793))

(declare-fun m!474801 () Bool)

(assert (=> b!493862 m!474801))

(assert (=> b!493862 m!474793))

(declare-fun m!474803 () Bool)

(assert (=> b!493862 m!474803))

(assert (=> b!493862 m!474783))

(declare-fun m!474805 () Bool)

(assert (=> b!493862 m!474805))

(assert (=> b!493862 m!474783))

(declare-fun m!474807 () Bool)

(assert (=> b!493860 m!474807))

(declare-fun m!474809 () Bool)

(assert (=> start!45014 m!474809))

(declare-fun m!474811 () Bool)

(assert (=> start!45014 m!474811))

(declare-fun m!474813 () Bool)

(assert (=> b!493859 m!474813))

(declare-fun m!474815 () Bool)

(assert (=> b!493863 m!474815))

(declare-fun m!474817 () Bool)

(assert (=> b!493856 m!474817))

(check-sat (not b!493860) (not b!493858) (not b!493861) (not start!45014) (not b!493859) (not b!493862) (not b!493856) (not b!493863))
(check-sat)
