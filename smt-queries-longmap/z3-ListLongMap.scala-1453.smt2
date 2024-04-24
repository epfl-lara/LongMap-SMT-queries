; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28000 () Bool)

(assert start!28000)

(declare-fun res!149251 () Bool)

(declare-fun e!182021 () Bool)

(assert (=> start!28000 (=> (not res!149251) (not e!182021))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28000 (= res!149251 (validMask!0 mask!3809))))

(assert (=> start!28000 e!182021))

(assert (=> start!28000 true))

(declare-datatypes ((array!14409 0))(
  ( (array!14410 (arr!6835 (Array (_ BitVec 32) (_ BitVec 64))) (size!7187 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14409)

(declare-fun array_inv!4785 (array!14409) Bool)

(assert (=> start!28000 (array_inv!4785 a!3312)))

(declare-fun b!287387 () Bool)

(declare-fun e!182020 () Bool)

(assert (=> b!287387 (= e!182020 false)))

(declare-datatypes ((SeekEntryResult!1949 0))(
  ( (MissingZero!1949 (index!9966 (_ BitVec 32))) (Found!1949 (index!9967 (_ BitVec 32))) (Intermediate!1949 (undefined!2761 Bool) (index!9968 (_ BitVec 32)) (x!28294 (_ BitVec 32))) (Undefined!1949) (MissingVacant!1949 (index!9969 (_ BitVec 32))) )
))
(declare-fun lt!141528 () SeekEntryResult!1949)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14409 (_ BitVec 32)) SeekEntryResult!1949)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287387 (= lt!141528 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!287388 () Bool)

(declare-fun res!149252 () Bool)

(assert (=> b!287388 (=> (not res!149252) (not e!182021))))

(declare-fun arrayContainsKey!0 (array!14409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287388 (= res!149252 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287389 () Bool)

(declare-fun res!149248 () Bool)

(assert (=> b!287389 (=> (not res!149248) (not e!182020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14409 (_ BitVec 32)) Bool)

(assert (=> b!287389 (= res!149248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287390 () Bool)

(declare-fun res!149253 () Bool)

(assert (=> b!287390 (=> (not res!149253) (not e!182021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287390 (= res!149253 (validKeyInArray!0 k0!2524))))

(declare-fun b!287391 () Bool)

(declare-fun res!149249 () Bool)

(assert (=> b!287391 (=> (not res!149249) (not e!182021))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287391 (= res!149249 (and (= (size!7187 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7187 a!3312))))))

(declare-fun b!287392 () Bool)

(assert (=> b!287392 (= e!182021 e!182020)))

(declare-fun res!149250 () Bool)

(assert (=> b!287392 (=> (not res!149250) (not e!182020))))

(declare-fun lt!141527 () SeekEntryResult!1949)

(assert (=> b!287392 (= res!149250 (or (= lt!141527 (MissingZero!1949 i!1256)) (= lt!141527 (MissingVacant!1949 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14409 (_ BitVec 32)) SeekEntryResult!1949)

(assert (=> b!287392 (= lt!141527 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28000 res!149251) b!287391))

(assert (= (and b!287391 res!149249) b!287390))

(assert (= (and b!287390 res!149253) b!287388))

(assert (= (and b!287388 res!149252) b!287392))

(assert (= (and b!287392 res!149250) b!287389))

(assert (= (and b!287389 res!149248) b!287387))

(declare-fun m!301985 () Bool)

(assert (=> b!287388 m!301985))

(declare-fun m!301987 () Bool)

(assert (=> b!287392 m!301987))

(declare-fun m!301989 () Bool)

(assert (=> b!287390 m!301989))

(declare-fun m!301991 () Bool)

(assert (=> b!287387 m!301991))

(assert (=> b!287387 m!301991))

(declare-fun m!301993 () Bool)

(assert (=> b!287387 m!301993))

(declare-fun m!301995 () Bool)

(assert (=> start!28000 m!301995))

(declare-fun m!301997 () Bool)

(assert (=> start!28000 m!301997))

(declare-fun m!301999 () Bool)

(assert (=> b!287389 m!301999))

(check-sat (not b!287390) (not b!287388) (not b!287392) (not b!287387) (not start!28000) (not b!287389))
(check-sat)
