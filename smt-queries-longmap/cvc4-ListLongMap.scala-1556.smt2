; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29516 () Bool)

(assert start!29516)

(declare-fun res!157317 () Bool)

(declare-fun e!188491 () Bool)

(assert (=> start!29516 (=> (not res!157317) (not e!188491))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29516 (= res!157317 (validMask!0 mask!3809))))

(assert (=> start!29516 e!188491))

(assert (=> start!29516 true))

(declare-datatypes ((array!15088 0))(
  ( (array!15089 (arr!7147 (Array (_ BitVec 32) (_ BitVec 64))) (size!7499 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15088)

(declare-fun array_inv!5110 (array!15088) Bool)

(assert (=> start!29516 (array_inv!5110 a!3312)))

(declare-fun b!298335 () Bool)

(declare-fun e!188489 () Bool)

(assert (=> b!298335 (= e!188489 false)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!148307 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2296 0))(
  ( (MissingZero!2296 (index!11357 (_ BitVec 32))) (Found!2296 (index!11358 (_ BitVec 32))) (Intermediate!2296 (undefined!3108 Bool) (index!11359 (_ BitVec 32)) (x!29581 (_ BitVec 32))) (Undefined!2296) (MissingVacant!2296 (index!11360 (_ BitVec 32))) )
))
(declare-fun lt!148306 () SeekEntryResult!2296)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15088 (_ BitVec 32)) SeekEntryResult!2296)

(assert (=> b!298335 (= lt!148306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148307 k!2524 (array!15089 (store (arr!7147 a!3312) i!1256 k!2524) (size!7499 a!3312)) mask!3809))))

(declare-fun lt!148308 () SeekEntryResult!2296)

(assert (=> b!298335 (= lt!148308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148307 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298335 (= lt!148307 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!298336 () Bool)

(declare-fun res!157313 () Bool)

(assert (=> b!298336 (=> (not res!157313) (not e!188491))))

(assert (=> b!298336 (= res!157313 (and (= (size!7499 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7499 a!3312))))))

(declare-fun b!298337 () Bool)

(declare-fun res!157314 () Bool)

(assert (=> b!298337 (=> (not res!157314) (not e!188491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298337 (= res!157314 (validKeyInArray!0 k!2524))))

(declare-fun b!298338 () Bool)

(declare-fun res!157312 () Bool)

(assert (=> b!298338 (=> (not res!157312) (not e!188491))))

(declare-fun arrayContainsKey!0 (array!15088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298338 (= res!157312 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298339 () Bool)

(declare-fun res!157315 () Bool)

(assert (=> b!298339 (=> (not res!157315) (not e!188489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15088 (_ BitVec 32)) Bool)

(assert (=> b!298339 (= res!157315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!298340 () Bool)

(assert (=> b!298340 (= e!188491 e!188489)))

(declare-fun res!157316 () Bool)

(assert (=> b!298340 (=> (not res!157316) (not e!188489))))

(declare-fun lt!148305 () SeekEntryResult!2296)

(assert (=> b!298340 (= res!157316 (or (= lt!148305 (MissingZero!2296 i!1256)) (= lt!148305 (MissingVacant!2296 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15088 (_ BitVec 32)) SeekEntryResult!2296)

(assert (=> b!298340 (= lt!148305 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!29516 res!157317) b!298336))

(assert (= (and b!298336 res!157313) b!298337))

(assert (= (and b!298337 res!157314) b!298338))

(assert (= (and b!298338 res!157312) b!298340))

(assert (= (and b!298340 res!157316) b!298339))

(assert (= (and b!298339 res!157315) b!298335))

(declare-fun m!310849 () Bool)

(assert (=> b!298335 m!310849))

(declare-fun m!310851 () Bool)

(assert (=> b!298335 m!310851))

(declare-fun m!310853 () Bool)

(assert (=> b!298335 m!310853))

(declare-fun m!310855 () Bool)

(assert (=> b!298335 m!310855))

(declare-fun m!310857 () Bool)

(assert (=> b!298340 m!310857))

(declare-fun m!310859 () Bool)

(assert (=> start!29516 m!310859))

(declare-fun m!310861 () Bool)

(assert (=> start!29516 m!310861))

(declare-fun m!310863 () Bool)

(assert (=> b!298339 m!310863))

(declare-fun m!310865 () Bool)

(assert (=> b!298337 m!310865))

(declare-fun m!310867 () Bool)

(assert (=> b!298338 m!310867))

(push 1)

(assert (not b!298337))

(assert (not b!298335))

(assert (not start!29516))

