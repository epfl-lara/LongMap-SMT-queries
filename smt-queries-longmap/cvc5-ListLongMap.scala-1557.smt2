; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29518 () Bool)

(assert start!29518)

(declare-fun b!298353 () Bool)

(declare-fun e!188499 () Bool)

(declare-fun e!188500 () Bool)

(assert (=> b!298353 (= e!188499 e!188500)))

(declare-fun res!157331 () Bool)

(assert (=> b!298353 (=> (not res!157331) (not e!188500))))

(declare-datatypes ((SeekEntryResult!2297 0))(
  ( (MissingZero!2297 (index!11361 (_ BitVec 32))) (Found!2297 (index!11362 (_ BitVec 32))) (Intermediate!2297 (undefined!3109 Bool) (index!11363 (_ BitVec 32)) (x!29590 (_ BitVec 32))) (Undefined!2297) (MissingVacant!2297 (index!11364 (_ BitVec 32))) )
))
(declare-fun lt!148317 () SeekEntryResult!2297)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!298353 (= res!157331 (or (= lt!148317 (MissingZero!2297 i!1256)) (= lt!148317 (MissingVacant!2297 i!1256))))))

(declare-datatypes ((array!15090 0))(
  ( (array!15091 (arr!7148 (Array (_ BitVec 32) (_ BitVec 64))) (size!7500 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15090)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15090 (_ BitVec 32)) SeekEntryResult!2297)

(assert (=> b!298353 (= lt!148317 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!298354 () Bool)

(declare-fun res!157334 () Bool)

(assert (=> b!298354 (=> (not res!157334) (not e!188499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298354 (= res!157334 (validKeyInArray!0 k!2524))))

(declare-fun res!157332 () Bool)

(assert (=> start!29518 (=> (not res!157332) (not e!188499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29518 (= res!157332 (validMask!0 mask!3809))))

(assert (=> start!29518 e!188499))

(assert (=> start!29518 true))

(declare-fun array_inv!5111 (array!15090) Bool)

(assert (=> start!29518 (array_inv!5111 a!3312)))

(declare-fun b!298355 () Bool)

(assert (=> b!298355 (= e!188500 false)))

(declare-fun lt!148318 () SeekEntryResult!2297)

(declare-fun lt!148320 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15090 (_ BitVec 32)) SeekEntryResult!2297)

(assert (=> b!298355 (= lt!148318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148320 k!2524 (array!15091 (store (arr!7148 a!3312) i!1256 k!2524) (size!7500 a!3312)) mask!3809))))

(declare-fun lt!148319 () SeekEntryResult!2297)

(assert (=> b!298355 (= lt!148319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148320 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298355 (= lt!148320 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!298356 () Bool)

(declare-fun res!157330 () Bool)

(assert (=> b!298356 (=> (not res!157330) (not e!188500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15090 (_ BitVec 32)) Bool)

(assert (=> b!298356 (= res!157330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!298357 () Bool)

(declare-fun res!157335 () Bool)

(assert (=> b!298357 (=> (not res!157335) (not e!188499))))

(declare-fun arrayContainsKey!0 (array!15090 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298357 (= res!157335 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298358 () Bool)

(declare-fun res!157333 () Bool)

(assert (=> b!298358 (=> (not res!157333) (not e!188499))))

(assert (=> b!298358 (= res!157333 (and (= (size!7500 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7500 a!3312))))))

(assert (= (and start!29518 res!157332) b!298358))

(assert (= (and b!298358 res!157333) b!298354))

(assert (= (and b!298354 res!157334) b!298357))

(assert (= (and b!298357 res!157335) b!298353))

(assert (= (and b!298353 res!157331) b!298356))

(assert (= (and b!298356 res!157330) b!298355))

(declare-fun m!310869 () Bool)

(assert (=> start!29518 m!310869))

(declare-fun m!310871 () Bool)

(assert (=> start!29518 m!310871))

(declare-fun m!310873 () Bool)

(assert (=> b!298357 m!310873))

(declare-fun m!310875 () Bool)

(assert (=> b!298356 m!310875))

(declare-fun m!310877 () Bool)

(assert (=> b!298354 m!310877))

(declare-fun m!310879 () Bool)

(assert (=> b!298353 m!310879))

(declare-fun m!310881 () Bool)

(assert (=> b!298355 m!310881))

(declare-fun m!310883 () Bool)

(assert (=> b!298355 m!310883))

(declare-fun m!310885 () Bool)

(assert (=> b!298355 m!310885))

(declare-fun m!310887 () Bool)

(assert (=> b!298355 m!310887))

(push 1)

