; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29316 () Bool)

(assert start!29316)

(declare-fun b!297022 () Bool)

(declare-fun e!187720 () Bool)

(declare-fun e!187719 () Bool)

(assert (=> b!297022 (= e!187720 e!187719)))

(declare-fun res!156553 () Bool)

(assert (=> b!297022 (=> (not res!156553) (not e!187719))))

(declare-fun lt!147529 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2271 0))(
  ( (MissingZero!2271 (index!11254 (_ BitVec 32))) (Found!2271 (index!11255 (_ BitVec 32))) (Intermediate!2271 (undefined!3083 Bool) (index!11256 (_ BitVec 32)) (x!29471 (_ BitVec 32))) (Undefined!2271) (MissingVacant!2271 (index!11257 (_ BitVec 32))) )
))
(declare-fun lt!147525 () SeekEntryResult!2271)

(assert (=> b!297022 (= res!156553 (or lt!147529 (= lt!147525 (MissingVacant!2271 i!1256))))))

(assert (=> b!297022 (= lt!147529 (= lt!147525 (MissingZero!2271 i!1256)))))

(declare-datatypes ((array!15029 0))(
  ( (array!15030 (arr!7122 (Array (_ BitVec 32) (_ BitVec 64))) (size!7474 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15029)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15029 (_ BitVec 32)) SeekEntryResult!2271)

(assert (=> b!297022 (= lt!147525 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!297023 () Bool)

(declare-fun res!156554 () Bool)

(assert (=> b!297023 (=> (not res!156554) (not e!187719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15029 (_ BitVec 32)) Bool)

(assert (=> b!297023 (= res!156554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297024 () Bool)

(declare-fun res!156555 () Bool)

(assert (=> b!297024 (=> (not res!156555) (not e!187720))))

(declare-fun arrayContainsKey!0 (array!15029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297024 (= res!156555 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297026 () Bool)

(declare-fun e!187717 () Bool)

(assert (=> b!297026 (= e!187719 e!187717)))

(declare-fun res!156551 () Bool)

(assert (=> b!297026 (=> (not res!156551) (not e!187717))))

(assert (=> b!297026 (= res!156551 lt!147529)))

(declare-fun lt!147528 () SeekEntryResult!2271)

(declare-fun lt!147530 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15029 (_ BitVec 32)) SeekEntryResult!2271)

(assert (=> b!297026 (= lt!147528 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147530 k0!2524 (array!15030 (store (arr!7122 a!3312) i!1256 k0!2524) (size!7474 a!3312)) mask!3809))))

(declare-fun lt!147531 () SeekEntryResult!2271)

(assert (=> b!297026 (= lt!147531 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147530 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297026 (= lt!147530 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!297027 () Bool)

(declare-fun res!156550 () Bool)

(assert (=> b!297027 (=> (not res!156550) (not e!187720))))

(assert (=> b!297027 (= res!156550 (and (= (size!7474 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7474 a!3312))))))

(declare-fun b!297028 () Bool)

(declare-fun res!156548 () Bool)

(assert (=> b!297028 (=> (not res!156548) (not e!187720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297028 (= res!156548 (validKeyInArray!0 k0!2524))))

(declare-fun b!297029 () Bool)

(declare-fun e!187716 () Bool)

(assert (=> b!297029 (= e!187717 e!187716)))

(declare-fun res!156552 () Bool)

(assert (=> b!297029 (=> (not res!156552) (not e!187716))))

(declare-fun lt!147527 () Bool)

(assert (=> b!297029 (= res!156552 (and (or lt!147527 (not (undefined!3083 lt!147531))) (or lt!147527 (not (= (select (arr!7122 a!3312) (index!11256 lt!147531)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147527 (not (= (select (arr!7122 a!3312) (index!11256 lt!147531)) k0!2524))) (not lt!147527)))))

(get-info :version)

(assert (=> b!297029 (= lt!147527 (not ((_ is Intermediate!2271) lt!147531)))))

(declare-fun b!297025 () Bool)

(assert (=> b!297025 (= e!187716 (not true))))

(assert (=> b!297025 (= lt!147528 lt!147531)))

(declare-datatypes ((Unit!9240 0))(
  ( (Unit!9241) )
))
(declare-fun lt!147526 () Unit!9240)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15029 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9240)

(assert (=> b!297025 (= lt!147526 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147530 (index!11256 lt!147531) (x!29471 lt!147531) mask!3809))))

(assert (=> b!297025 (and (= (select (arr!7122 a!3312) (index!11256 lt!147531)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11256 lt!147531) i!1256))))

(declare-fun res!156549 () Bool)

(assert (=> start!29316 (=> (not res!156549) (not e!187720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29316 (= res!156549 (validMask!0 mask!3809))))

(assert (=> start!29316 e!187720))

(assert (=> start!29316 true))

(declare-fun array_inv!5085 (array!15029) Bool)

(assert (=> start!29316 (array_inv!5085 a!3312)))

(assert (= (and start!29316 res!156549) b!297027))

(assert (= (and b!297027 res!156550) b!297028))

(assert (= (and b!297028 res!156548) b!297024))

(assert (= (and b!297024 res!156555) b!297022))

(assert (= (and b!297022 res!156553) b!297023))

(assert (= (and b!297023 res!156554) b!297026))

(assert (= (and b!297026 res!156551) b!297029))

(assert (= (and b!297029 res!156552) b!297025))

(declare-fun m!309843 () Bool)

(assert (=> b!297024 m!309843))

(declare-fun m!309845 () Bool)

(assert (=> b!297028 m!309845))

(declare-fun m!309847 () Bool)

(assert (=> b!297029 m!309847))

(declare-fun m!309849 () Bool)

(assert (=> start!29316 m!309849))

(declare-fun m!309851 () Bool)

(assert (=> start!29316 m!309851))

(declare-fun m!309853 () Bool)

(assert (=> b!297026 m!309853))

(declare-fun m!309855 () Bool)

(assert (=> b!297026 m!309855))

(declare-fun m!309857 () Bool)

(assert (=> b!297026 m!309857))

(declare-fun m!309859 () Bool)

(assert (=> b!297026 m!309859))

(declare-fun m!309861 () Bool)

(assert (=> b!297022 m!309861))

(declare-fun m!309863 () Bool)

(assert (=> b!297025 m!309863))

(assert (=> b!297025 m!309847))

(declare-fun m!309865 () Bool)

(assert (=> b!297023 m!309865))

(check-sat (not b!297026) (not b!297025) (not b!297028) (not b!297024) (not b!297023) (not b!297022) (not start!29316))
(check-sat)
