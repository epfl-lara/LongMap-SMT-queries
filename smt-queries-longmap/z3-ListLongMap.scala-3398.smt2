; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46970 () Bool)

(assert start!46970)

(declare-fun b!517875 () Bool)

(declare-fun res!316950 () Bool)

(declare-fun e!302205 () Bool)

(assert (=> b!517875 (=> res!316950 e!302205)))

(declare-datatypes ((SeekEntryResult!4342 0))(
  ( (MissingZero!4342 (index!19556 (_ BitVec 32))) (Found!4342 (index!19557 (_ BitVec 32))) (Intermediate!4342 (undefined!5154 Bool) (index!19558 (_ BitVec 32)) (x!48672 (_ BitVec 32))) (Undefined!4342) (MissingVacant!4342 (index!19559 (_ BitVec 32))) )
))
(declare-fun lt!237101 () SeekEntryResult!4342)

(get-info :version)

(assert (=> b!517875 (= res!316950 (or (undefined!5154 lt!237101) (not ((_ is Intermediate!4342) lt!237101))))))

(declare-fun b!517876 () Bool)

(declare-fun res!316953 () Bool)

(declare-fun e!302206 () Bool)

(assert (=> b!517876 (=> (not res!316953) (not e!302206))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33112 0))(
  ( (array!33113 (arr!15919 (Array (_ BitVec 32) (_ BitVec 64))) (size!16283 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33112)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!517876 (= res!316953 (and (= (size!16283 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16283 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16283 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517877 () Bool)

(declare-fun e!302204 () Bool)

(assert (=> b!517877 (= e!302204 (not e!302205))))

(declare-fun res!316952 () Bool)

(assert (=> b!517877 (=> res!316952 e!302205)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!237100 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33112 (_ BitVec 32)) SeekEntryResult!4342)

(assert (=> b!517877 (= res!316952 (= lt!237101 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237100 (select (store (arr!15919 a!3235) i!1204 k0!2280) j!176) (array!33113 (store (arr!15919 a!3235) i!1204 k0!2280) (size!16283 a!3235)) mask!3524)))))

(declare-fun lt!237102 () (_ BitVec 32))

(assert (=> b!517877 (= lt!237101 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237102 (select (arr!15919 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517877 (= lt!237100 (toIndex!0 (select (store (arr!15919 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!517877 (= lt!237102 (toIndex!0 (select (arr!15919 a!3235) j!176) mask!3524))))

(declare-fun e!302208 () Bool)

(assert (=> b!517877 e!302208))

(declare-fun res!316945 () Bool)

(assert (=> b!517877 (=> (not res!316945) (not e!302208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33112 (_ BitVec 32)) Bool)

(assert (=> b!517877 (= res!316945 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16003 0))(
  ( (Unit!16004) )
))
(declare-fun lt!237103 () Unit!16003)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16003)

(assert (=> b!517877 (= lt!237103 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!517878 () Bool)

(declare-fun res!316954 () Bool)

(assert (=> b!517878 (=> (not res!316954) (not e!302204))))

(declare-datatypes ((List!9984 0))(
  ( (Nil!9981) (Cons!9980 (h!10887 (_ BitVec 64)) (t!16204 List!9984)) )
))
(declare-fun arrayNoDuplicates!0 (array!33112 (_ BitVec 32) List!9984) Bool)

(assert (=> b!517878 (= res!316954 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9981))))

(declare-fun b!517879 () Bool)

(assert (=> b!517879 (= e!302206 e!302204)))

(declare-fun res!316947 () Bool)

(assert (=> b!517879 (=> (not res!316947) (not e!302204))))

(declare-fun lt!237099 () SeekEntryResult!4342)

(assert (=> b!517879 (= res!316947 (or (= lt!237099 (MissingZero!4342 i!1204)) (= lt!237099 (MissingVacant!4342 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33112 (_ BitVec 32)) SeekEntryResult!4342)

(assert (=> b!517879 (= lt!237099 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!517880 () Bool)

(declare-fun res!316944 () Bool)

(assert (=> b!517880 (=> (not res!316944) (not e!302206))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517880 (= res!316944 (validKeyInArray!0 (select (arr!15919 a!3235) j!176)))))

(declare-fun b!517881 () Bool)

(declare-fun res!316948 () Bool)

(assert (=> b!517881 (=> (not res!316948) (not e!302206))))

(declare-fun arrayContainsKey!0 (array!33112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517881 (= res!316948 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!316946 () Bool)

(assert (=> start!46970 (=> (not res!316946) (not e!302206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46970 (= res!316946 (validMask!0 mask!3524))))

(assert (=> start!46970 e!302206))

(assert (=> start!46970 true))

(declare-fun array_inv!11778 (array!33112) Bool)

(assert (=> start!46970 (array_inv!11778 a!3235)))

(declare-fun b!517882 () Bool)

(assert (=> b!517882 (= e!302208 (= (seekEntryOrOpen!0 (select (arr!15919 a!3235) j!176) a!3235 mask!3524) (Found!4342 j!176)))))

(declare-fun b!517883 () Bool)

(declare-fun res!316951 () Bool)

(assert (=> b!517883 (=> (not res!316951) (not e!302204))))

(assert (=> b!517883 (= res!316951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!517884 () Bool)

(assert (=> b!517884 (= e!302205 true)))

(assert (=> b!517884 (and (bvslt (x!48672 lt!237101) #b01111111111111111111111111111110) (or (= (select (arr!15919 a!3235) (index!19558 lt!237101)) (select (arr!15919 a!3235) j!176)) (= (select (arr!15919 a!3235) (index!19558 lt!237101)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15919 a!3235) (index!19558 lt!237101)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517885 () Bool)

(declare-fun res!316949 () Bool)

(assert (=> b!517885 (=> (not res!316949) (not e!302206))))

(assert (=> b!517885 (= res!316949 (validKeyInArray!0 k0!2280))))

(assert (= (and start!46970 res!316946) b!517876))

(assert (= (and b!517876 res!316953) b!517880))

(assert (= (and b!517880 res!316944) b!517885))

(assert (= (and b!517885 res!316949) b!517881))

(assert (= (and b!517881 res!316948) b!517879))

(assert (= (and b!517879 res!316947) b!517883))

(assert (= (and b!517883 res!316951) b!517878))

(assert (= (and b!517878 res!316954) b!517877))

(assert (= (and b!517877 res!316945) b!517882))

(assert (= (and b!517877 (not res!316952)) b!517875))

(assert (= (and b!517875 (not res!316950)) b!517884))

(declare-fun m!499441 () Bool)

(assert (=> b!517877 m!499441))

(declare-fun m!499443 () Bool)

(assert (=> b!517877 m!499443))

(declare-fun m!499445 () Bool)

(assert (=> b!517877 m!499445))

(declare-fun m!499447 () Bool)

(assert (=> b!517877 m!499447))

(declare-fun m!499449 () Bool)

(assert (=> b!517877 m!499449))

(assert (=> b!517877 m!499447))

(declare-fun m!499451 () Bool)

(assert (=> b!517877 m!499451))

(assert (=> b!517877 m!499447))

(declare-fun m!499453 () Bool)

(assert (=> b!517877 m!499453))

(assert (=> b!517877 m!499445))

(declare-fun m!499455 () Bool)

(assert (=> b!517877 m!499455))

(assert (=> b!517877 m!499445))

(declare-fun m!499457 () Bool)

(assert (=> b!517877 m!499457))

(declare-fun m!499459 () Bool)

(assert (=> b!517881 m!499459))

(declare-fun m!499461 () Bool)

(assert (=> b!517884 m!499461))

(assert (=> b!517884 m!499447))

(assert (=> b!517880 m!499447))

(assert (=> b!517880 m!499447))

(declare-fun m!499463 () Bool)

(assert (=> b!517880 m!499463))

(declare-fun m!499465 () Bool)

(assert (=> b!517879 m!499465))

(declare-fun m!499467 () Bool)

(assert (=> b!517878 m!499467))

(declare-fun m!499469 () Bool)

(assert (=> start!46970 m!499469))

(declare-fun m!499471 () Bool)

(assert (=> start!46970 m!499471))

(declare-fun m!499473 () Bool)

(assert (=> b!517883 m!499473))

(declare-fun m!499475 () Bool)

(assert (=> b!517885 m!499475))

(assert (=> b!517882 m!499447))

(assert (=> b!517882 m!499447))

(declare-fun m!499477 () Bool)

(assert (=> b!517882 m!499477))

(check-sat (not b!517877) (not b!517879) (not b!517878) (not b!517882) (not b!517881) (not start!46970) (not b!517880) (not b!517885) (not b!517883))
(check-sat)
