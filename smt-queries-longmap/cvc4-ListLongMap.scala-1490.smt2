; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28330 () Bool)

(assert start!28330)

(declare-fun b!290281 () Bool)

(declare-fun e!183695 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!290281 (= e!183695 (not (bvsge mask!3809 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!2098 0))(
  ( (MissingZero!2098 (index!10562 (_ BitVec 32))) (Found!2098 (index!10563 (_ BitVec 32))) (Intermediate!2098 (undefined!2910 Bool) (index!10564 (_ BitVec 32)) (x!28751 (_ BitVec 32))) (Undefined!2098) (MissingVacant!2098 (index!10565 (_ BitVec 32))) )
))
(declare-fun lt!143390 () SeekEntryResult!2098)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290281 (= (index!10564 lt!143390) i!1256)))

(declare-fun b!290282 () Bool)

(declare-fun e!183694 () Bool)

(declare-fun e!183692 () Bool)

(assert (=> b!290282 (= e!183694 e!183692)))

(declare-fun res!151765 () Bool)

(assert (=> b!290282 (=> (not res!151765) (not e!183692))))

(declare-fun lt!143393 () Bool)

(declare-fun lt!143395 () SeekEntryResult!2098)

(assert (=> b!290282 (= res!151765 (and (not lt!143393) (= lt!143395 (MissingVacant!2098 i!1256))))))

(declare-fun lt!143392 () SeekEntryResult!2098)

(declare-fun lt!143391 () (_ BitVec 32))

(declare-datatypes ((array!14644 0))(
  ( (array!14645 (arr!6949 (Array (_ BitVec 32) (_ BitVec 64))) (size!7301 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14644)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14644 (_ BitVec 32)) SeekEntryResult!2098)

(assert (=> b!290282 (= lt!143392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143391 k!2524 (array!14645 (store (arr!6949 a!3312) i!1256 k!2524) (size!7301 a!3312)) mask!3809))))

(assert (=> b!290282 (= lt!143390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143391 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290282 (= lt!143391 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!290283 () Bool)

(declare-fun e!183691 () Bool)

(assert (=> b!290283 (= e!183691 e!183694)))

(declare-fun res!151761 () Bool)

(assert (=> b!290283 (=> (not res!151761) (not e!183694))))

(assert (=> b!290283 (= res!151761 (or lt!143393 (= lt!143395 (MissingVacant!2098 i!1256))))))

(assert (=> b!290283 (= lt!143393 (= lt!143395 (MissingZero!2098 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14644 (_ BitVec 32)) SeekEntryResult!2098)

(assert (=> b!290283 (= lt!143395 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!290284 () Bool)

(declare-fun res!151763 () Bool)

(assert (=> b!290284 (=> (not res!151763) (not e!183691))))

(declare-fun arrayContainsKey!0 (array!14644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290284 (= res!151763 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290285 () Bool)

(declare-fun res!151764 () Bool)

(assert (=> b!290285 (=> (not res!151764) (not e!183691))))

(assert (=> b!290285 (= res!151764 (and (= (size!7301 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7301 a!3312))))))

(declare-fun b!290286 () Bool)

(declare-fun res!151766 () Bool)

(assert (=> b!290286 (=> (not res!151766) (not e!183694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14644 (_ BitVec 32)) Bool)

(assert (=> b!290286 (= res!151766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290287 () Bool)

(assert (=> b!290287 (= e!183692 e!183695)))

(declare-fun res!151762 () Bool)

(assert (=> b!290287 (=> (not res!151762) (not e!183695))))

(declare-fun lt!143394 () Bool)

(assert (=> b!290287 (= res!151762 (and (or lt!143394 (not (undefined!2910 lt!143390))) (not lt!143394) (= (select (arr!6949 a!3312) (index!10564 lt!143390)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290287 (= lt!143394 (not (is-Intermediate!2098 lt!143390)))))

(declare-fun res!151760 () Bool)

(assert (=> start!28330 (=> (not res!151760) (not e!183691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28330 (= res!151760 (validMask!0 mask!3809))))

(assert (=> start!28330 e!183691))

(assert (=> start!28330 true))

(declare-fun array_inv!4912 (array!14644) Bool)

(assert (=> start!28330 (array_inv!4912 a!3312)))

(declare-fun b!290288 () Bool)

(declare-fun res!151767 () Bool)

(assert (=> b!290288 (=> (not res!151767) (not e!183691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290288 (= res!151767 (validKeyInArray!0 k!2524))))

(assert (= (and start!28330 res!151760) b!290285))

(assert (= (and b!290285 res!151764) b!290288))

(assert (= (and b!290288 res!151767) b!290284))

(assert (= (and b!290284 res!151763) b!290283))

(assert (= (and b!290283 res!151761) b!290286))

(assert (= (and b!290286 res!151766) b!290282))

(assert (= (and b!290282 res!151765) b!290287))

(assert (= (and b!290287 res!151762) b!290281))

(declare-fun m!304391 () Bool)

(assert (=> b!290284 m!304391))

(declare-fun m!304393 () Bool)

(assert (=> b!290288 m!304393))

(declare-fun m!304395 () Bool)

(assert (=> start!28330 m!304395))

(declare-fun m!304397 () Bool)

(assert (=> start!28330 m!304397))

(declare-fun m!304399 () Bool)

(assert (=> b!290283 m!304399))

(declare-fun m!304401 () Bool)

(assert (=> b!290287 m!304401))

(declare-fun m!304403 () Bool)

(assert (=> b!290282 m!304403))

(declare-fun m!304405 () Bool)

(assert (=> b!290282 m!304405))

(declare-fun m!304407 () Bool)

(assert (=> b!290282 m!304407))

(declare-fun m!304409 () Bool)

(assert (=> b!290282 m!304409))

(declare-fun m!304411 () Bool)

(assert (=> b!290286 m!304411))

(push 1)

(assert (not start!28330))

(assert (not b!290288))

(assert (not b!290286))

(assert (not b!290284))

(assert (not b!290283))

(assert (not b!290282))

(check-sat)

