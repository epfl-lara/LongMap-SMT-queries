; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29512 () Bool)

(assert start!29512)

(declare-fun b!298299 () Bool)

(declare-fun e!188472 () Bool)

(declare-fun e!188471 () Bool)

(assert (=> b!298299 (= e!188472 e!188471)))

(declare-fun res!157276 () Bool)

(assert (=> b!298299 (=> (not res!157276) (not e!188471))))

(declare-datatypes ((SeekEntryResult!2294 0))(
  ( (MissingZero!2294 (index!11349 (_ BitVec 32))) (Found!2294 (index!11350 (_ BitVec 32))) (Intermediate!2294 (undefined!3106 Bool) (index!11351 (_ BitVec 32)) (x!29579 (_ BitVec 32))) (Undefined!2294) (MissingVacant!2294 (index!11352 (_ BitVec 32))) )
))
(declare-fun lt!148282 () SeekEntryResult!2294)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!298299 (= res!157276 (or (= lt!148282 (MissingZero!2294 i!1256)) (= lt!148282 (MissingVacant!2294 i!1256))))))

(declare-datatypes ((array!15084 0))(
  ( (array!15085 (arr!7145 (Array (_ BitVec 32) (_ BitVec 64))) (size!7497 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15084)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15084 (_ BitVec 32)) SeekEntryResult!2294)

(assert (=> b!298299 (= lt!148282 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!298300 () Bool)

(declare-fun res!157278 () Bool)

(assert (=> b!298300 (=> (not res!157278) (not e!188471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15084 (_ BitVec 32)) Bool)

(assert (=> b!298300 (= res!157278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!298301 () Bool)

(declare-fun res!157280 () Bool)

(assert (=> b!298301 (=> (not res!157280) (not e!188472))))

(declare-fun arrayContainsKey!0 (array!15084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298301 (= res!157280 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298302 () Bool)

(declare-fun res!157279 () Bool)

(assert (=> b!298302 (=> (not res!157279) (not e!188472))))

(assert (=> b!298302 (= res!157279 (and (= (size!7497 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7497 a!3312))))))

(declare-fun res!157281 () Bool)

(assert (=> start!29512 (=> (not res!157281) (not e!188472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29512 (= res!157281 (validMask!0 mask!3809))))

(assert (=> start!29512 e!188472))

(assert (=> start!29512 true))

(declare-fun array_inv!5108 (array!15084) Bool)

(assert (=> start!29512 (array_inv!5108 a!3312)))

(declare-fun b!298303 () Bool)

(declare-fun res!157277 () Bool)

(assert (=> b!298303 (=> (not res!157277) (not e!188472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298303 (= res!157277 (validKeyInArray!0 k!2524))))

(declare-fun b!298304 () Bool)

(assert (=> b!298304 (= e!188471 false)))

(declare-fun lt!148283 () (_ BitVec 32))

(declare-fun lt!148284 () SeekEntryResult!2294)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15084 (_ BitVec 32)) SeekEntryResult!2294)

(assert (=> b!298304 (= lt!148284 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148283 k!2524 (array!15085 (store (arr!7145 a!3312) i!1256 k!2524) (size!7497 a!3312)) mask!3809))))

(declare-fun lt!148281 () SeekEntryResult!2294)

(assert (=> b!298304 (= lt!148281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148283 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298304 (= lt!148283 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!29512 res!157281) b!298302))

(assert (= (and b!298302 res!157279) b!298303))

(assert (= (and b!298303 res!157277) b!298301))

(assert (= (and b!298301 res!157280) b!298299))

(assert (= (and b!298299 res!157276) b!298300))

(assert (= (and b!298300 res!157278) b!298304))

(declare-fun m!310809 () Bool)

(assert (=> b!298299 m!310809))

(declare-fun m!310811 () Bool)

(assert (=> start!29512 m!310811))

(declare-fun m!310813 () Bool)

(assert (=> start!29512 m!310813))

(declare-fun m!310815 () Bool)

(assert (=> b!298303 m!310815))

(declare-fun m!310817 () Bool)

(assert (=> b!298300 m!310817))

(declare-fun m!310819 () Bool)

(assert (=> b!298301 m!310819))

(declare-fun m!310821 () Bool)

(assert (=> b!298304 m!310821))

(declare-fun m!310823 () Bool)

(assert (=> b!298304 m!310823))

(declare-fun m!310825 () Bool)

(assert (=> b!298304 m!310825))

(declare-fun m!310827 () Bool)

(assert (=> b!298304 m!310827))

(push 1)

