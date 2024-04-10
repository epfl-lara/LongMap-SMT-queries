; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28282 () Bool)

(assert start!28282)

(declare-fun b!289833 () Bool)

(declare-fun res!151314 () Bool)

(declare-fun e!183461 () Bool)

(assert (=> b!289833 (=> (not res!151314) (not e!183461))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14596 0))(
  ( (array!14597 (arr!6925 (Array (_ BitVec 32) (_ BitVec 64))) (size!7277 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14596)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!289833 (= res!151314 (and (= (size!7277 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7277 a!3312))))))

(declare-fun b!289834 () Bool)

(declare-fun e!183459 () Bool)

(assert (=> b!289834 (= e!183461 e!183459)))

(declare-fun res!151316 () Bool)

(assert (=> b!289834 (=> (not res!151316) (not e!183459))))

(declare-datatypes ((SeekEntryResult!2074 0))(
  ( (MissingZero!2074 (index!10466 (_ BitVec 32))) (Found!2074 (index!10467 (_ BitVec 32))) (Intermediate!2074 (undefined!2886 Bool) (index!10468 (_ BitVec 32)) (x!28663 (_ BitVec 32))) (Undefined!2074) (MissingVacant!2074 (index!10469 (_ BitVec 32))) )
))
(declare-fun lt!143077 () SeekEntryResult!2074)

(assert (=> b!289834 (= res!151316 (or (= lt!143077 (MissingZero!2074 i!1256)) (= lt!143077 (MissingVacant!2074 i!1256))))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14596 (_ BitVec 32)) SeekEntryResult!2074)

(assert (=> b!289834 (= lt!143077 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289835 () Bool)

(declare-fun res!151312 () Bool)

(assert (=> b!289835 (=> (not res!151312) (not e!183461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289835 (= res!151312 (validKeyInArray!0 k!2524))))

(declare-fun b!289836 () Bool)

(assert (=> b!289836 (= e!183459 false)))

(declare-fun lt!143079 () SeekEntryResult!2074)

(declare-fun lt!143080 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14596 (_ BitVec 32)) SeekEntryResult!2074)

(assert (=> b!289836 (= lt!143079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143080 k!2524 (array!14597 (store (arr!6925 a!3312) i!1256 k!2524) (size!7277 a!3312)) mask!3809))))

(declare-fun lt!143078 () SeekEntryResult!2074)

(assert (=> b!289836 (= lt!143078 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143080 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289836 (= lt!143080 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289837 () Bool)

(declare-fun res!151315 () Bool)

(assert (=> b!289837 (=> (not res!151315) (not e!183459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14596 (_ BitVec 32)) Bool)

(assert (=> b!289837 (= res!151315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289838 () Bool)

(declare-fun res!151313 () Bool)

(assert (=> b!289838 (=> (not res!151313) (not e!183461))))

(declare-fun arrayContainsKey!0 (array!14596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289838 (= res!151313 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!151317 () Bool)

(assert (=> start!28282 (=> (not res!151317) (not e!183461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28282 (= res!151317 (validMask!0 mask!3809))))

(assert (=> start!28282 e!183461))

(assert (=> start!28282 true))

(declare-fun array_inv!4888 (array!14596) Bool)

(assert (=> start!28282 (array_inv!4888 a!3312)))

(assert (= (and start!28282 res!151317) b!289833))

(assert (= (and b!289833 res!151314) b!289835))

(assert (= (and b!289835 res!151312) b!289838))

(assert (= (and b!289838 res!151313) b!289834))

(assert (= (and b!289834 res!151316) b!289837))

(assert (= (and b!289837 res!151315) b!289836))

(declare-fun m!303907 () Bool)

(assert (=> start!28282 m!303907))

(declare-fun m!303909 () Bool)

(assert (=> start!28282 m!303909))

(declare-fun m!303911 () Bool)

(assert (=> b!289838 m!303911))

(declare-fun m!303913 () Bool)

(assert (=> b!289837 m!303913))

(declare-fun m!303915 () Bool)

(assert (=> b!289834 m!303915))

(declare-fun m!303917 () Bool)

(assert (=> b!289835 m!303917))

(declare-fun m!303919 () Bool)

(assert (=> b!289836 m!303919))

(declare-fun m!303921 () Bool)

(assert (=> b!289836 m!303921))

(declare-fun m!303923 () Bool)

(assert (=> b!289836 m!303923))

(declare-fun m!303925 () Bool)

(assert (=> b!289836 m!303925))

(push 1)

(assert (not start!28282))

(assert (not b!289834))

(assert (not b!289835))

(assert (not b!289837))

(assert (not b!289838))

(assert (not b!289836))

