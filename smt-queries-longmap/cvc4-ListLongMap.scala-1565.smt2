; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29834 () Bool)

(assert start!29834)

(declare-fun b!300231 () Bool)

(declare-fun res!158268 () Bool)

(declare-fun e!189593 () Bool)

(assert (=> b!300231 (=> (not res!158268) (not e!189593))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300231 (= res!158268 (validKeyInArray!0 k!2524))))

(declare-fun b!300232 () Bool)

(declare-fun res!158263 () Bool)

(assert (=> b!300232 (=> (not res!158263) (not e!189593))))

(declare-datatypes ((array!15157 0))(
  ( (array!15158 (arr!7174 (Array (_ BitVec 32) (_ BitVec 64))) (size!7526 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15157)

(declare-fun arrayContainsKey!0 (array!15157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300232 (= res!158263 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300233 () Bool)

(declare-fun res!158267 () Bool)

(declare-fun e!189595 () Bool)

(assert (=> b!300233 (=> (not res!158267) (not e!189595))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15157 (_ BitVec 32)) Bool)

(assert (=> b!300233 (= res!158267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300234 () Bool)

(declare-fun res!158266 () Bool)

(assert (=> b!300234 (=> (not res!158266) (not e!189593))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!300234 (= res!158266 (and (= (size!7526 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7526 a!3312))))))

(declare-fun res!158264 () Bool)

(assert (=> start!29834 (=> (not res!158264) (not e!189593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29834 (= res!158264 (validMask!0 mask!3809))))

(assert (=> start!29834 e!189593))

(assert (=> start!29834 true))

(declare-fun array_inv!5137 (array!15157) Bool)

(assert (=> start!29834 (array_inv!5137 a!3312)))

(declare-fun b!300235 () Bool)

(assert (=> b!300235 (= e!189593 e!189595)))

(declare-fun res!158265 () Bool)

(assert (=> b!300235 (=> (not res!158265) (not e!189595))))

(declare-datatypes ((SeekEntryResult!2323 0))(
  ( (MissingZero!2323 (index!11468 (_ BitVec 32))) (Found!2323 (index!11469 (_ BitVec 32))) (Intermediate!2323 (undefined!3135 Bool) (index!11470 (_ BitVec 32)) (x!29719 (_ BitVec 32))) (Undefined!2323) (MissingVacant!2323 (index!11471 (_ BitVec 32))) )
))
(declare-fun lt!149335 () SeekEntryResult!2323)

(assert (=> b!300235 (= res!158265 (or (= lt!149335 (MissingZero!2323 i!1256)) (= lt!149335 (MissingVacant!2323 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15157 (_ BitVec 32)) SeekEntryResult!2323)

(assert (=> b!300235 (= lt!149335 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!300236 () Bool)

(assert (=> b!300236 (= e!189595 false)))

(declare-fun lt!149336 () SeekEntryResult!2323)

(declare-fun lt!149337 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15157 (_ BitVec 32)) SeekEntryResult!2323)

(assert (=> b!300236 (= lt!149336 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149337 k!2524 (array!15158 (store (arr!7174 a!3312) i!1256 k!2524) (size!7526 a!3312)) mask!3809))))

(declare-fun lt!149334 () SeekEntryResult!2323)

(assert (=> b!300236 (= lt!149334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149337 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300236 (= lt!149337 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!29834 res!158264) b!300234))

(assert (= (and b!300234 res!158266) b!300231))

(assert (= (and b!300231 res!158268) b!300232))

(assert (= (and b!300232 res!158263) b!300235))

(assert (= (and b!300235 res!158265) b!300233))

(assert (= (and b!300233 res!158267) b!300236))

(declare-fun m!312283 () Bool)

(assert (=> start!29834 m!312283))

(declare-fun m!312285 () Bool)

(assert (=> start!29834 m!312285))

(declare-fun m!312287 () Bool)

(assert (=> b!300235 m!312287))

(declare-fun m!312289 () Bool)

(assert (=> b!300236 m!312289))

(declare-fun m!312291 () Bool)

(assert (=> b!300236 m!312291))

(declare-fun m!312293 () Bool)

(assert (=> b!300236 m!312293))

(declare-fun m!312295 () Bool)

(assert (=> b!300236 m!312295))

(declare-fun m!312297 () Bool)

(assert (=> b!300233 m!312297))

(declare-fun m!312299 () Bool)

(assert (=> b!300232 m!312299))

(declare-fun m!312301 () Bool)

(assert (=> b!300231 m!312301))

(push 1)

(assert (not b!300236))

(assert (not b!300235))

(assert (not b!300232))

(assert (not start!29834))

