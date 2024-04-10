; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29522 () Bool)

(assert start!29522)

(declare-fun b!298389 () Bool)

(declare-fun res!157370 () Bool)

(declare-fun e!188516 () Bool)

(assert (=> b!298389 (=> (not res!157370) (not e!188516))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!15094 0))(
  ( (array!15095 (arr!7150 (Array (_ BitVec 32) (_ BitVec 64))) (size!7502 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15094)

(assert (=> b!298389 (= res!157370 (and (= (size!7502 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7502 a!3312))))))

(declare-fun b!298390 () Bool)

(declare-fun res!157366 () Bool)

(assert (=> b!298390 (=> (not res!157366) (not e!188516))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298390 (= res!157366 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298391 () Bool)

(declare-fun e!188518 () Bool)

(assert (=> b!298391 (= e!188516 e!188518)))

(declare-fun res!157369 () Bool)

(assert (=> b!298391 (=> (not res!157369) (not e!188518))))

(declare-datatypes ((SeekEntryResult!2299 0))(
  ( (MissingZero!2299 (index!11369 (_ BitVec 32))) (Found!2299 (index!11370 (_ BitVec 32))) (Intermediate!2299 (undefined!3111 Bool) (index!11371 (_ BitVec 32)) (x!29592 (_ BitVec 32))) (Undefined!2299) (MissingVacant!2299 (index!11372 (_ BitVec 32))) )
))
(declare-fun lt!148343 () SeekEntryResult!2299)

(assert (=> b!298391 (= res!157369 (or (= lt!148343 (MissingZero!2299 i!1256)) (= lt!148343 (MissingVacant!2299 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15094 (_ BitVec 32)) SeekEntryResult!2299)

(assert (=> b!298391 (= lt!148343 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!298392 () Bool)

(assert (=> b!298392 (= e!188518 false)))

(declare-fun lt!148342 () (_ BitVec 32))

(declare-fun lt!148344 () SeekEntryResult!2299)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15094 (_ BitVec 32)) SeekEntryResult!2299)

(assert (=> b!298392 (= lt!148344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148342 k!2524 (array!15095 (store (arr!7150 a!3312) i!1256 k!2524) (size!7502 a!3312)) mask!3809))))

(declare-fun lt!148341 () SeekEntryResult!2299)

(assert (=> b!298392 (= lt!148341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148342 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298392 (= lt!148342 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!298393 () Bool)

(declare-fun res!157368 () Bool)

(assert (=> b!298393 (=> (not res!157368) (not e!188516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298393 (= res!157368 (validKeyInArray!0 k!2524))))

(declare-fun res!157367 () Bool)

(assert (=> start!29522 (=> (not res!157367) (not e!188516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29522 (= res!157367 (validMask!0 mask!3809))))

(assert (=> start!29522 e!188516))

(assert (=> start!29522 true))

(declare-fun array_inv!5113 (array!15094) Bool)

(assert (=> start!29522 (array_inv!5113 a!3312)))

(declare-fun b!298394 () Bool)

(declare-fun res!157371 () Bool)

(assert (=> b!298394 (=> (not res!157371) (not e!188518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15094 (_ BitVec 32)) Bool)

(assert (=> b!298394 (= res!157371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29522 res!157367) b!298389))

(assert (= (and b!298389 res!157370) b!298393))

(assert (= (and b!298393 res!157368) b!298390))

(assert (= (and b!298390 res!157366) b!298391))

(assert (= (and b!298391 res!157369) b!298394))

(assert (= (and b!298394 res!157371) b!298392))

(declare-fun m!310909 () Bool)

(assert (=> b!298390 m!310909))

(declare-fun m!310911 () Bool)

(assert (=> b!298394 m!310911))

(declare-fun m!310913 () Bool)

(assert (=> b!298393 m!310913))

(declare-fun m!310915 () Bool)

(assert (=> start!29522 m!310915))

(declare-fun m!310917 () Bool)

(assert (=> start!29522 m!310917))

(declare-fun m!310919 () Bool)

(assert (=> b!298392 m!310919))

(declare-fun m!310921 () Bool)

(assert (=> b!298392 m!310921))

(declare-fun m!310923 () Bool)

(assert (=> b!298392 m!310923))

(declare-fun m!310925 () Bool)

(assert (=> b!298392 m!310925))

(declare-fun m!310927 () Bool)

(assert (=> b!298391 m!310927))

(push 1)

