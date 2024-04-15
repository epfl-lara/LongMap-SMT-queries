; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29878 () Bool)

(assert start!29878)

(declare-fun b!300298 () Bool)

(declare-fun res!158337 () Bool)

(declare-fun e!189612 () Bool)

(assert (=> b!300298 (=> (not res!158337) (not e!189612))))

(declare-datatypes ((array!15163 0))(
  ( (array!15164 (arr!7176 (Array (_ BitVec 32) (_ BitVec 64))) (size!7529 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15163)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15163 (_ BitVec 32)) Bool)

(assert (=> b!300298 (= res!158337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!158338 () Bool)

(declare-fun e!189613 () Bool)

(assert (=> start!29878 (=> (not res!158338) (not e!189613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29878 (= res!158338 (validMask!0 mask!3809))))

(assert (=> start!29878 e!189613))

(assert (=> start!29878 true))

(declare-fun array_inv!5148 (array!15163) Bool)

(assert (=> start!29878 (array_inv!5148 a!3312)))

(declare-fun b!300299 () Bool)

(assert (=> b!300299 (= e!189612 false)))

(declare-datatypes ((SeekEntryResult!2324 0))(
  ( (MissingZero!2324 (index!11472 (_ BitVec 32))) (Found!2324 (index!11473 (_ BitVec 32))) (Intermediate!2324 (undefined!3136 Bool) (index!11474 (_ BitVec 32)) (x!29745 (_ BitVec 32))) (Undefined!2324) (MissingVacant!2324 (index!11475 (_ BitVec 32))) )
))
(declare-fun lt!149291 () SeekEntryResult!2324)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!149288 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15163 (_ BitVec 32)) SeekEntryResult!2324)

(assert (=> b!300299 (= lt!149291 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149288 k0!2524 (array!15164 (store (arr!7176 a!3312) i!1256 k0!2524) (size!7529 a!3312)) mask!3809))))

(declare-fun lt!149290 () SeekEntryResult!2324)

(assert (=> b!300299 (= lt!149290 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149288 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300299 (= lt!149288 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!300300 () Bool)

(declare-fun res!158336 () Bool)

(assert (=> b!300300 (=> (not res!158336) (not e!189613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300300 (= res!158336 (validKeyInArray!0 k0!2524))))

(declare-fun b!300301 () Bool)

(declare-fun res!158335 () Bool)

(assert (=> b!300301 (=> (not res!158335) (not e!189613))))

(assert (=> b!300301 (= res!158335 (and (= (size!7529 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7529 a!3312))))))

(declare-fun b!300302 () Bool)

(assert (=> b!300302 (= e!189613 e!189612)))

(declare-fun res!158340 () Bool)

(assert (=> b!300302 (=> (not res!158340) (not e!189612))))

(declare-fun lt!149289 () SeekEntryResult!2324)

(assert (=> b!300302 (= res!158340 (or (= lt!149289 (MissingZero!2324 i!1256)) (= lt!149289 (MissingVacant!2324 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15163 (_ BitVec 32)) SeekEntryResult!2324)

(assert (=> b!300302 (= lt!149289 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300303 () Bool)

(declare-fun res!158339 () Bool)

(assert (=> b!300303 (=> (not res!158339) (not e!189613))))

(declare-fun arrayContainsKey!0 (array!15163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300303 (= res!158339 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29878 res!158338) b!300301))

(assert (= (and b!300301 res!158335) b!300300))

(assert (= (and b!300300 res!158336) b!300303))

(assert (= (and b!300303 res!158339) b!300302))

(assert (= (and b!300302 res!158340) b!300298))

(assert (= (and b!300298 res!158337) b!300299))

(declare-fun m!311809 () Bool)

(assert (=> start!29878 m!311809))

(declare-fun m!311811 () Bool)

(assert (=> start!29878 m!311811))

(declare-fun m!311813 () Bool)

(assert (=> b!300298 m!311813))

(declare-fun m!311815 () Bool)

(assert (=> b!300303 m!311815))

(declare-fun m!311817 () Bool)

(assert (=> b!300302 m!311817))

(declare-fun m!311819 () Bool)

(assert (=> b!300300 m!311819))

(declare-fun m!311821 () Bool)

(assert (=> b!300299 m!311821))

(declare-fun m!311823 () Bool)

(assert (=> b!300299 m!311823))

(declare-fun m!311825 () Bool)

(assert (=> b!300299 m!311825))

(declare-fun m!311827 () Bool)

(assert (=> b!300299 m!311827))

(check-sat (not b!300303) (not b!300298) (not start!29878) (not b!300302) (not b!300300) (not b!300299))
(check-sat)
