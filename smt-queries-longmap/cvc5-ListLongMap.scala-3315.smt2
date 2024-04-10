; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45834 () Bool)

(assert start!45834)

(declare-fun b!507544 () Bool)

(declare-fun res!308507 () Bool)

(declare-fun e!297023 () Bool)

(assert (=> b!507544 (=> (not res!308507) (not e!297023))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507544 (= res!308507 (validKeyInArray!0 k!2280))))

(declare-fun b!507545 () Bool)

(declare-fun res!308509 () Bool)

(declare-fun e!297019 () Bool)

(assert (=> b!507545 (=> (not res!308509) (not e!297019))))

(declare-datatypes ((array!32590 0))(
  ( (array!32591 (arr!15675 (Array (_ BitVec 32) (_ BitVec 64))) (size!16039 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32590)

(declare-datatypes ((List!9833 0))(
  ( (Nil!9830) (Cons!9829 (h!10706 (_ BitVec 64)) (t!16061 List!9833)) )
))
(declare-fun arrayNoDuplicates!0 (array!32590 (_ BitVec 32) List!9833) Bool)

(assert (=> b!507545 (= res!308509 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9830))))

(declare-fun res!308505 () Bool)

(assert (=> start!45834 (=> (not res!308505) (not e!297023))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45834 (= res!308505 (validMask!0 mask!3524))))

(assert (=> start!45834 e!297023))

(assert (=> start!45834 true))

(declare-fun array_inv!11471 (array!32590) Bool)

(assert (=> start!45834 (array_inv!11471 a!3235)))

(declare-fun b!507546 () Bool)

(declare-fun e!297022 () Bool)

(declare-fun e!297021 () Bool)

(assert (=> b!507546 (= e!297022 e!297021)))

(declare-fun res!308511 () Bool)

(assert (=> b!507546 (=> res!308511 e!297021)))

(declare-fun lt!231812 () Bool)

(declare-datatypes ((SeekEntryResult!4142 0))(
  ( (MissingZero!4142 (index!18756 (_ BitVec 32))) (Found!4142 (index!18757 (_ BitVec 32))) (Intermediate!4142 (undefined!4954 Bool) (index!18758 (_ BitVec 32)) (x!47751 (_ BitVec 32))) (Undefined!4142) (MissingVacant!4142 (index!18759 (_ BitVec 32))) )
))
(declare-fun lt!231814 () SeekEntryResult!4142)

(assert (=> b!507546 (= res!308511 (or (and (not lt!231812) (undefined!4954 lt!231814)) (and (not lt!231812) (not (undefined!4954 lt!231814)))))))

(assert (=> b!507546 (= lt!231812 (not (is-Intermediate!4142 lt!231814)))))

(declare-fun b!507547 () Bool)

(assert (=> b!507547 (= e!297023 e!297019)))

(declare-fun res!308512 () Bool)

(assert (=> b!507547 (=> (not res!308512) (not e!297019))))

(declare-fun lt!231810 () SeekEntryResult!4142)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507547 (= res!308512 (or (= lt!231810 (MissingZero!4142 i!1204)) (= lt!231810 (MissingVacant!4142 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32590 (_ BitVec 32)) SeekEntryResult!4142)

(assert (=> b!507547 (= lt!231810 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507548 () Bool)

(declare-fun res!308510 () Bool)

(assert (=> b!507548 (=> (not res!308510) (not e!297023))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507548 (= res!308510 (and (= (size!16039 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16039 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16039 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507549 () Bool)

(declare-fun res!308513 () Bool)

(assert (=> b!507549 (=> (not res!308513) (not e!297023))))

(assert (=> b!507549 (= res!308513 (validKeyInArray!0 (select (arr!15675 a!3235) j!176)))))

(declare-fun e!297020 () Bool)

(declare-fun b!507550 () Bool)

(assert (=> b!507550 (= e!297020 (= (seekEntryOrOpen!0 (select (arr!15675 a!3235) j!176) a!3235 mask!3524) (Found!4142 j!176)))))

(declare-fun b!507551 () Bool)

(assert (=> b!507551 (= e!297021 true)))

(declare-fun lt!231809 () SeekEntryResult!4142)

(declare-fun lt!231817 () (_ BitVec 64))

(declare-fun lt!231816 () array!32590)

(assert (=> b!507551 (= lt!231809 (seekEntryOrOpen!0 lt!231817 lt!231816 mask!3524))))

(assert (=> b!507551 false))

(declare-fun b!507552 () Bool)

(declare-fun res!308504 () Bool)

(assert (=> b!507552 (=> (not res!308504) (not e!297023))))

(declare-fun arrayContainsKey!0 (array!32590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507552 (= res!308504 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507553 () Bool)

(declare-fun res!308508 () Bool)

(assert (=> b!507553 (=> (not res!308508) (not e!297019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32590 (_ BitVec 32)) Bool)

(assert (=> b!507553 (= res!308508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507554 () Bool)

(assert (=> b!507554 (= e!297019 (not e!297022))))

(declare-fun res!308503 () Bool)

(assert (=> b!507554 (=> res!308503 e!297022)))

(declare-fun lt!231811 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32590 (_ BitVec 32)) SeekEntryResult!4142)

(assert (=> b!507554 (= res!308503 (= lt!231814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231811 lt!231817 lt!231816 mask!3524)))))

(declare-fun lt!231813 () (_ BitVec 32))

(assert (=> b!507554 (= lt!231814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231813 (select (arr!15675 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507554 (= lt!231811 (toIndex!0 lt!231817 mask!3524))))

(assert (=> b!507554 (= lt!231817 (select (store (arr!15675 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!507554 (= lt!231813 (toIndex!0 (select (arr!15675 a!3235) j!176) mask!3524))))

(assert (=> b!507554 (= lt!231816 (array!32591 (store (arr!15675 a!3235) i!1204 k!2280) (size!16039 a!3235)))))

(assert (=> b!507554 e!297020))

(declare-fun res!308506 () Bool)

(assert (=> b!507554 (=> (not res!308506) (not e!297020))))

(assert (=> b!507554 (= res!308506 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15572 0))(
  ( (Unit!15573) )
))
(declare-fun lt!231815 () Unit!15572)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15572)

(assert (=> b!507554 (= lt!231815 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45834 res!308505) b!507548))

(assert (= (and b!507548 res!308510) b!507549))

(assert (= (and b!507549 res!308513) b!507544))

(assert (= (and b!507544 res!308507) b!507552))

(assert (= (and b!507552 res!308504) b!507547))

(assert (= (and b!507547 res!308512) b!507553))

(assert (= (and b!507553 res!308508) b!507545))

(assert (= (and b!507545 res!308509) b!507554))

(assert (= (and b!507554 res!308506) b!507550))

(assert (= (and b!507554 (not res!308503)) b!507546))

(assert (= (and b!507546 (not res!308511)) b!507551))

(declare-fun m!488331 () Bool)

(assert (=> b!507553 m!488331))

(declare-fun m!488333 () Bool)

(assert (=> b!507552 m!488333))

(declare-fun m!488335 () Bool)

(assert (=> b!507545 m!488335))

(declare-fun m!488337 () Bool)

(assert (=> b!507544 m!488337))

(declare-fun m!488339 () Bool)

(assert (=> b!507550 m!488339))

(assert (=> b!507550 m!488339))

(declare-fun m!488341 () Bool)

(assert (=> b!507550 m!488341))

(assert (=> b!507549 m!488339))

(assert (=> b!507549 m!488339))

(declare-fun m!488343 () Bool)

(assert (=> b!507549 m!488343))

(declare-fun m!488345 () Bool)

(assert (=> start!45834 m!488345))

(declare-fun m!488347 () Bool)

(assert (=> start!45834 m!488347))

(declare-fun m!488349 () Bool)

(assert (=> b!507551 m!488349))

(declare-fun m!488351 () Bool)

(assert (=> b!507547 m!488351))

(declare-fun m!488353 () Bool)

(assert (=> b!507554 m!488353))

(declare-fun m!488355 () Bool)

(assert (=> b!507554 m!488355))

(declare-fun m!488357 () Bool)

(assert (=> b!507554 m!488357))

(declare-fun m!488359 () Bool)

(assert (=> b!507554 m!488359))

(assert (=> b!507554 m!488339))

(declare-fun m!488361 () Bool)

(assert (=> b!507554 m!488361))

(assert (=> b!507554 m!488339))

(declare-fun m!488363 () Bool)

(assert (=> b!507554 m!488363))

(assert (=> b!507554 m!488339))

(declare-fun m!488365 () Bool)

(assert (=> b!507554 m!488365))

(declare-fun m!488367 () Bool)

(assert (=> b!507554 m!488367))

(push 1)

