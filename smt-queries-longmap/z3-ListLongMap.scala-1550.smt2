; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29320 () Bool)

(assert start!29320)

(declare-fun b!297207 () Bool)

(declare-fun res!156697 () Bool)

(declare-fun e!187827 () Bool)

(assert (=> b!297207 (=> (not res!156697) (not e!187827))))

(declare-datatypes ((array!15036 0))(
  ( (array!15037 (arr!7126 (Array (_ BitVec 32) (_ BitVec 64))) (size!7478 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15036)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15036 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297207 (= res!156697 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun e!187826 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2240 0))(
  ( (MissingZero!2240 (index!11130 (_ BitVec 32))) (Found!2240 (index!11131 (_ BitVec 32))) (Intermediate!2240 (undefined!3052 Bool) (index!11132 (_ BitVec 32)) (x!29457 (_ BitVec 32))) (Undefined!2240) (MissingVacant!2240 (index!11133 (_ BitVec 32))) )
))
(declare-fun lt!147700 () SeekEntryResult!2240)

(declare-fun b!297208 () Bool)

(assert (=> b!297208 (= e!187826 (not (= (select (store (arr!7126 a!3312) i!1256 k0!2524) (index!11132 lt!147700)) k0!2524)))))

(declare-fun lt!147699 () SeekEntryResult!2240)

(assert (=> b!297208 (= lt!147699 lt!147700)))

(declare-datatypes ((Unit!9208 0))(
  ( (Unit!9209) )
))
(declare-fun lt!147697 () Unit!9208)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!147698 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15036 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9208)

(assert (=> b!297208 (= lt!147697 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147698 (index!11132 lt!147700) (x!29457 lt!147700) mask!3809))))

(assert (=> b!297208 (and (= (select (arr!7126 a!3312) (index!11132 lt!147700)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11132 lt!147700) i!1256))))

(declare-fun b!297209 () Bool)

(declare-fun res!156698 () Bool)

(assert (=> b!297209 (=> (not res!156698) (not e!187827))))

(assert (=> b!297209 (= res!156698 (and (= (size!7478 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7478 a!3312))))))

(declare-fun b!297210 () Bool)

(declare-fun res!156696 () Bool)

(declare-fun e!187829 () Bool)

(assert (=> b!297210 (=> (not res!156696) (not e!187829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15036 (_ BitVec 32)) Bool)

(assert (=> b!297210 (= res!156696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297211 () Bool)

(assert (=> b!297211 (= e!187827 e!187829)))

(declare-fun res!156695 () Bool)

(assert (=> b!297211 (=> (not res!156695) (not e!187829))))

(declare-fun lt!147696 () Bool)

(declare-fun lt!147702 () SeekEntryResult!2240)

(assert (=> b!297211 (= res!156695 (or lt!147696 (= lt!147702 (MissingVacant!2240 i!1256))))))

(assert (=> b!297211 (= lt!147696 (= lt!147702 (MissingZero!2240 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15036 (_ BitVec 32)) SeekEntryResult!2240)

(assert (=> b!297211 (= lt!147702 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!297212 () Bool)

(declare-fun res!156699 () Bool)

(assert (=> b!297212 (=> (not res!156699) (not e!187827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297212 (= res!156699 (validKeyInArray!0 k0!2524))))

(declare-fun res!156700 () Bool)

(assert (=> start!29320 (=> (not res!156700) (not e!187827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29320 (= res!156700 (validMask!0 mask!3809))))

(assert (=> start!29320 e!187827))

(assert (=> start!29320 true))

(declare-fun array_inv!5076 (array!15036) Bool)

(assert (=> start!29320 (array_inv!5076 a!3312)))

(declare-fun b!297213 () Bool)

(declare-fun e!187825 () Bool)

(assert (=> b!297213 (= e!187829 e!187825)))

(declare-fun res!156702 () Bool)

(assert (=> b!297213 (=> (not res!156702) (not e!187825))))

(assert (=> b!297213 (= res!156702 lt!147696)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15036 (_ BitVec 32)) SeekEntryResult!2240)

(assert (=> b!297213 (= lt!147699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147698 k0!2524 (array!15037 (store (arr!7126 a!3312) i!1256 k0!2524) (size!7478 a!3312)) mask!3809))))

(assert (=> b!297213 (= lt!147700 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147698 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297213 (= lt!147698 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!297214 () Bool)

(assert (=> b!297214 (= e!187825 e!187826)))

(declare-fun res!156701 () Bool)

(assert (=> b!297214 (=> (not res!156701) (not e!187826))))

(declare-fun lt!147701 () Bool)

(assert (=> b!297214 (= res!156701 (and (or lt!147701 (not (undefined!3052 lt!147700))) (or lt!147701 (not (= (select (arr!7126 a!3312) (index!11132 lt!147700)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147701 (not (= (select (arr!7126 a!3312) (index!11132 lt!147700)) k0!2524))) (not lt!147701)))))

(get-info :version)

(assert (=> b!297214 (= lt!147701 (not ((_ is Intermediate!2240) lt!147700)))))

(assert (= (and start!29320 res!156700) b!297209))

(assert (= (and b!297209 res!156698) b!297212))

(assert (= (and b!297212 res!156699) b!297207))

(assert (= (and b!297207 res!156697) b!297211))

(assert (= (and b!297211 res!156695) b!297210))

(assert (= (and b!297210 res!156696) b!297213))

(assert (= (and b!297213 res!156702) b!297214))

(assert (= (and b!297214 res!156701) b!297208))

(declare-fun m!310193 () Bool)

(assert (=> b!297210 m!310193))

(declare-fun m!310195 () Bool)

(assert (=> b!297213 m!310195))

(declare-fun m!310197 () Bool)

(assert (=> b!297213 m!310197))

(declare-fun m!310199 () Bool)

(assert (=> b!297213 m!310199))

(declare-fun m!310201 () Bool)

(assert (=> b!297213 m!310201))

(assert (=> b!297208 m!310195))

(declare-fun m!310203 () Bool)

(assert (=> b!297208 m!310203))

(declare-fun m!310205 () Bool)

(assert (=> b!297208 m!310205))

(declare-fun m!310207 () Bool)

(assert (=> b!297208 m!310207))

(declare-fun m!310209 () Bool)

(assert (=> start!29320 m!310209))

(declare-fun m!310211 () Bool)

(assert (=> start!29320 m!310211))

(assert (=> b!297214 m!310207))

(declare-fun m!310213 () Bool)

(assert (=> b!297212 m!310213))

(declare-fun m!310215 () Bool)

(assert (=> b!297211 m!310215))

(declare-fun m!310217 () Bool)

(assert (=> b!297207 m!310217))

(check-sat (not b!297213) (not b!297212) (not b!297210) (not b!297211) (not b!297208) (not start!29320) (not b!297207))
(check-sat)
