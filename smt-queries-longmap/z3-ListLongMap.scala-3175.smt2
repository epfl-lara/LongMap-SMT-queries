; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44664 () Bool)

(assert start!44664)

(declare-fun b!489947 () Bool)

(declare-fun res!293029 () Bool)

(declare-fun e!288035 () Bool)

(assert (=> b!489947 (=> (not res!293029) (not e!288035))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489947 (= res!293029 (validKeyInArray!0 k0!2280))))

(declare-fun res!293033 () Bool)

(assert (=> start!44664 (=> (not res!293033) (not e!288035))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44664 (= res!293033 (validMask!0 mask!3524))))

(assert (=> start!44664 e!288035))

(assert (=> start!44664 true))

(declare-datatypes ((array!31733 0))(
  ( (array!31734 (arr!15254 (Array (_ BitVec 32) (_ BitVec 64))) (size!15619 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31733)

(declare-fun array_inv!11137 (array!31733) Bool)

(assert (=> start!44664 (array_inv!11137 a!3235)))

(declare-fun b!489948 () Bool)

(declare-fun res!293031 () Bool)

(assert (=> b!489948 (=> (not res!293031) (not e!288035))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!489948 (= res!293031 (validKeyInArray!0 (select (arr!15254 a!3235) j!176)))))

(declare-fun b!489949 () Bool)

(declare-fun e!288033 () Bool)

(assert (=> b!489949 (= e!288035 e!288033)))

(declare-fun res!293030 () Bool)

(assert (=> b!489949 (=> (not res!293030) (not e!288033))))

(declare-datatypes ((SeekEntryResult!3718 0))(
  ( (MissingZero!3718 (index!17051 (_ BitVec 32))) (Found!3718 (index!17052 (_ BitVec 32))) (Intermediate!3718 (undefined!4530 Bool) (index!17053 (_ BitVec 32)) (x!46163 (_ BitVec 32))) (Undefined!3718) (MissingVacant!3718 (index!17054 (_ BitVec 32))) )
))
(declare-fun lt!221116 () SeekEntryResult!3718)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489949 (= res!293030 (or (= lt!221116 (MissingZero!3718 i!1204)) (= lt!221116 (MissingVacant!3718 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31733 (_ BitVec 32)) SeekEntryResult!3718)

(assert (=> b!489949 (= lt!221116 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489950 () Bool)

(declare-fun res!293028 () Bool)

(assert (=> b!489950 (=> (not res!293028) (not e!288035))))

(assert (=> b!489950 (= res!293028 (and (= (size!15619 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15619 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15619 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489951 () Bool)

(declare-fun res!293032 () Bool)

(assert (=> b!489951 (=> (not res!293032) (not e!288033))))

(declare-datatypes ((List!9451 0))(
  ( (Nil!9448) (Cons!9447 (h!10309 (_ BitVec 64)) (t!15670 List!9451)) )
))
(declare-fun arrayNoDuplicates!0 (array!31733 (_ BitVec 32) List!9451) Bool)

(assert (=> b!489951 (= res!293032 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9448))))

(declare-fun b!489952 () Bool)

(assert (=> b!489952 (= e!288033 (not true))))

(declare-fun lt!221112 () (_ BitVec 32))

(declare-fun lt!221114 () SeekEntryResult!3718)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31733 (_ BitVec 32)) SeekEntryResult!3718)

(assert (=> b!489952 (= lt!221114 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221112 (select (store (arr!15254 a!3235) i!1204 k0!2280) j!176) (array!31734 (store (arr!15254 a!3235) i!1204 k0!2280) (size!15619 a!3235)) mask!3524))))

(declare-fun lt!221113 () SeekEntryResult!3718)

(declare-fun lt!221111 () (_ BitVec 32))

(assert (=> b!489952 (= lt!221113 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221111 (select (arr!15254 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489952 (= lt!221112 (toIndex!0 (select (store (arr!15254 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489952 (= lt!221111 (toIndex!0 (select (arr!15254 a!3235) j!176) mask!3524))))

(declare-fun e!288036 () Bool)

(assert (=> b!489952 e!288036))

(declare-fun res!293027 () Bool)

(assert (=> b!489952 (=> (not res!293027) (not e!288036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31733 (_ BitVec 32)) Bool)

(assert (=> b!489952 (= res!293027 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14368 0))(
  ( (Unit!14369) )
))
(declare-fun lt!221115 () Unit!14368)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14368)

(assert (=> b!489952 (= lt!221115 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489953 () Bool)

(declare-fun res!293026 () Bool)

(assert (=> b!489953 (=> (not res!293026) (not e!288035))))

(declare-fun arrayContainsKey!0 (array!31733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489953 (= res!293026 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489954 () Bool)

(assert (=> b!489954 (= e!288036 (= (seekEntryOrOpen!0 (select (arr!15254 a!3235) j!176) a!3235 mask!3524) (Found!3718 j!176)))))

(declare-fun b!489955 () Bool)

(declare-fun res!293025 () Bool)

(assert (=> b!489955 (=> (not res!293025) (not e!288033))))

(assert (=> b!489955 (= res!293025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44664 res!293033) b!489950))

(assert (= (and b!489950 res!293028) b!489948))

(assert (= (and b!489948 res!293031) b!489947))

(assert (= (and b!489947 res!293029) b!489953))

(assert (= (and b!489953 res!293026) b!489949))

(assert (= (and b!489949 res!293030) b!489955))

(assert (= (and b!489955 res!293025) b!489951))

(assert (= (and b!489951 res!293032) b!489952))

(assert (= (and b!489952 res!293027) b!489954))

(declare-fun m!469501 () Bool)

(assert (=> b!489947 m!469501))

(declare-fun m!469503 () Bool)

(assert (=> b!489955 m!469503))

(declare-fun m!469505 () Bool)

(assert (=> b!489949 m!469505))

(declare-fun m!469507 () Bool)

(assert (=> b!489948 m!469507))

(assert (=> b!489948 m!469507))

(declare-fun m!469509 () Bool)

(assert (=> b!489948 m!469509))

(declare-fun m!469511 () Bool)

(assert (=> b!489951 m!469511))

(assert (=> b!489954 m!469507))

(assert (=> b!489954 m!469507))

(declare-fun m!469513 () Bool)

(assert (=> b!489954 m!469513))

(declare-fun m!469515 () Bool)

(assert (=> start!44664 m!469515))

(declare-fun m!469517 () Bool)

(assert (=> start!44664 m!469517))

(declare-fun m!469519 () Bool)

(assert (=> b!489952 m!469519))

(declare-fun m!469521 () Bool)

(assert (=> b!489952 m!469521))

(declare-fun m!469523 () Bool)

(assert (=> b!489952 m!469523))

(assert (=> b!489952 m!469507))

(declare-fun m!469525 () Bool)

(assert (=> b!489952 m!469525))

(assert (=> b!489952 m!469507))

(declare-fun m!469527 () Bool)

(assert (=> b!489952 m!469527))

(assert (=> b!489952 m!469507))

(declare-fun m!469529 () Bool)

(assert (=> b!489952 m!469529))

(assert (=> b!489952 m!469523))

(declare-fun m!469531 () Bool)

(assert (=> b!489952 m!469531))

(assert (=> b!489952 m!469523))

(declare-fun m!469533 () Bool)

(assert (=> b!489952 m!469533))

(declare-fun m!469535 () Bool)

(assert (=> b!489953 m!469535))

(check-sat (not b!489947) (not b!489949) (not b!489954) (not b!489951) (not b!489955) (not b!489952) (not start!44664) (not b!489948) (not b!489953))
(check-sat)
