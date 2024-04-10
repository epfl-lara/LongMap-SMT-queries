; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28664 () Bool)

(assert start!28664)

(declare-fun b!293001 () Bool)

(declare-fun res!154061 () Bool)

(declare-fun e!185304 () Bool)

(assert (=> b!293001 (=> (not res!154061) (not e!185304))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293001 (= res!154061 (validKeyInArray!0 k0!2524))))

(declare-fun b!293002 () Bool)

(declare-fun res!154059 () Bool)

(declare-fun e!185306 () Bool)

(assert (=> b!293002 (=> (not res!154059) (not e!185306))))

(declare-datatypes ((array!14843 0))(
  ( (array!14844 (arr!7044 (Array (_ BitVec 32) (_ BitVec 64))) (size!7396 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14843)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14843 (_ BitVec 32)) Bool)

(assert (=> b!293002 (= res!154059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293003 () Bool)

(declare-fun res!154057 () Bool)

(assert (=> b!293003 (=> (not res!154057) (not e!185304))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!293003 (= res!154057 (and (= (size!7396 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7396 a!3312))))))

(declare-fun b!293004 () Bool)

(declare-fun res!154058 () Bool)

(assert (=> b!293004 (=> (not res!154058) (not e!185304))))

(declare-fun arrayContainsKey!0 (array!14843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293004 (= res!154058 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293005 () Bool)

(assert (=> b!293005 (= e!185306 false)))

(declare-datatypes ((SeekEntryResult!2193 0))(
  ( (MissingZero!2193 (index!10942 (_ BitVec 32))) (Found!2193 (index!10943 (_ BitVec 32))) (Intermediate!2193 (undefined!3005 Bool) (index!10944 (_ BitVec 32)) (x!29120 (_ BitVec 32))) (Undefined!2193) (MissingVacant!2193 (index!10945 (_ BitVec 32))) )
))
(declare-fun lt!145217 () SeekEntryResult!2193)

(declare-fun lt!145216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14843 (_ BitVec 32)) SeekEntryResult!2193)

(assert (=> b!293005 (= lt!145217 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145216 k0!2524 (array!14844 (store (arr!7044 a!3312) i!1256 k0!2524) (size!7396 a!3312)) mask!3809))))

(declare-fun lt!145219 () SeekEntryResult!2193)

(assert (=> b!293005 (= lt!145219 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145216 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293005 (= lt!145216 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!154060 () Bool)

(assert (=> start!28664 (=> (not res!154060) (not e!185304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28664 (= res!154060 (validMask!0 mask!3809))))

(assert (=> start!28664 e!185304))

(assert (=> start!28664 true))

(declare-fun array_inv!5007 (array!14843) Bool)

(assert (=> start!28664 (array_inv!5007 a!3312)))

(declare-fun b!293006 () Bool)

(assert (=> b!293006 (= e!185304 e!185306)))

(declare-fun res!154062 () Bool)

(assert (=> b!293006 (=> (not res!154062) (not e!185306))))

(declare-fun lt!145218 () SeekEntryResult!2193)

(assert (=> b!293006 (= res!154062 (or (= lt!145218 (MissingZero!2193 i!1256)) (= lt!145218 (MissingVacant!2193 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14843 (_ BitVec 32)) SeekEntryResult!2193)

(assert (=> b!293006 (= lt!145218 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28664 res!154060) b!293003))

(assert (= (and b!293003 res!154057) b!293001))

(assert (= (and b!293001 res!154061) b!293004))

(assert (= (and b!293004 res!154058) b!293006))

(assert (= (and b!293006 res!154062) b!293002))

(assert (= (and b!293002 res!154059) b!293005))

(declare-fun m!306797 () Bool)

(assert (=> b!293005 m!306797))

(declare-fun m!306799 () Bool)

(assert (=> b!293005 m!306799))

(declare-fun m!306801 () Bool)

(assert (=> b!293005 m!306801))

(declare-fun m!306803 () Bool)

(assert (=> b!293005 m!306803))

(declare-fun m!306805 () Bool)

(assert (=> b!293004 m!306805))

(declare-fun m!306807 () Bool)

(assert (=> b!293006 m!306807))

(declare-fun m!306809 () Bool)

(assert (=> b!293001 m!306809))

(declare-fun m!306811 () Bool)

(assert (=> start!28664 m!306811))

(declare-fun m!306813 () Bool)

(assert (=> start!28664 m!306813))

(declare-fun m!306815 () Bool)

(assert (=> b!293002 m!306815))

(check-sat (not b!293005) (not b!293004) (not b!293002) (not b!293006) (not b!293001) (not start!28664))
(check-sat)
