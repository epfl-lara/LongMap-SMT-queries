; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28078 () Bool)

(assert start!28078)

(declare-fun b!287727 () Bool)

(declare-fun res!149495 () Bool)

(declare-fun e!182212 () Bool)

(assert (=> b!287727 (=> (not res!149495) (not e!182212))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287727 (= res!149495 (validKeyInArray!0 k!2524))))

(declare-fun b!287728 () Bool)

(declare-fun res!149491 () Bool)

(assert (=> b!287728 (=> (not res!149491) (not e!182212))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14437 0))(
  ( (array!14438 (arr!6847 (Array (_ BitVec 32) (_ BitVec 64))) (size!7199 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14437)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!287728 (= res!149491 (and (= (size!7199 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7199 a!3312))))))

(declare-fun res!149492 () Bool)

(assert (=> start!28078 (=> (not res!149492) (not e!182212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28078 (= res!149492 (validMask!0 mask!3809))))

(assert (=> start!28078 e!182212))

(assert (=> start!28078 true))

(declare-fun array_inv!4810 (array!14437) Bool)

(assert (=> start!28078 (array_inv!4810 a!3312)))

(declare-fun b!287729 () Bool)

(declare-fun e!182213 () Bool)

(assert (=> b!287729 (= e!182212 e!182213)))

(declare-fun res!149494 () Bool)

(assert (=> b!287729 (=> (not res!149494) (not e!182213))))

(declare-datatypes ((SeekEntryResult!1996 0))(
  ( (MissingZero!1996 (index!10154 (_ BitVec 32))) (Found!1996 (index!10155 (_ BitVec 32))) (Intermediate!1996 (undefined!2808 Bool) (index!10156 (_ BitVec 32)) (x!28371 (_ BitVec 32))) (Undefined!1996) (MissingVacant!1996 (index!10157 (_ BitVec 32))) )
))
(declare-fun lt!141633 () SeekEntryResult!1996)

(assert (=> b!287729 (= res!149494 (or (= lt!141633 (MissingZero!1996 i!1256)) (= lt!141633 (MissingVacant!1996 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14437 (_ BitVec 32)) SeekEntryResult!1996)

(assert (=> b!287729 (= lt!141633 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287730 () Bool)

(assert (=> b!287730 (= e!182213 false)))

(declare-fun lt!141634 () SeekEntryResult!1996)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14437 (_ BitVec 32)) SeekEntryResult!1996)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287730 (= lt!141634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!287731 () Bool)

(declare-fun res!149493 () Bool)

(assert (=> b!287731 (=> (not res!149493) (not e!182212))))

(declare-fun arrayContainsKey!0 (array!14437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287731 (= res!149493 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287732 () Bool)

(declare-fun res!149496 () Bool)

(assert (=> b!287732 (=> (not res!149496) (not e!182213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14437 (_ BitVec 32)) Bool)

(assert (=> b!287732 (= res!149496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28078 res!149492) b!287728))

(assert (= (and b!287728 res!149491) b!287727))

(assert (= (and b!287727 res!149495) b!287731))

(assert (= (and b!287731 res!149493) b!287729))

(assert (= (and b!287729 res!149494) b!287732))

(assert (= (and b!287732 res!149496) b!287730))

(declare-fun m!302057 () Bool)

(assert (=> b!287730 m!302057))

(assert (=> b!287730 m!302057))

(declare-fun m!302059 () Bool)

(assert (=> b!287730 m!302059))

(declare-fun m!302061 () Bool)

(assert (=> b!287731 m!302061))

(declare-fun m!302063 () Bool)

(assert (=> b!287729 m!302063))

(declare-fun m!302065 () Bool)

(assert (=> b!287727 m!302065))

(declare-fun m!302067 () Bool)

(assert (=> b!287732 m!302067))

(declare-fun m!302069 () Bool)

(assert (=> start!28078 m!302069))

(declare-fun m!302071 () Bool)

(assert (=> start!28078 m!302071))

(push 1)

(assert (not b!287730))

(assert (not b!287731))

(assert (not b!287727))

(assert (not b!287732))

(assert (not start!28078))

(assert (not b!287729))

(check-sat)

