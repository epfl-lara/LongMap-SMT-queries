; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28632 () Bool)

(assert start!28632)

(declare-fun b!292713 () Bool)

(declare-fun res!153771 () Bool)

(declare-fun e!185160 () Bool)

(assert (=> b!292713 (=> (not res!153771) (not e!185160))))

(declare-datatypes ((array!14811 0))(
  ( (array!14812 (arr!7028 (Array (_ BitVec 32) (_ BitVec 64))) (size!7380 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14811)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292713 (= res!153771 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!153773 () Bool)

(assert (=> start!28632 (=> (not res!153773) (not e!185160))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28632 (= res!153773 (validMask!0 mask!3809))))

(assert (=> start!28632 e!185160))

(assert (=> start!28632 true))

(declare-fun array_inv!4991 (array!14811) Bool)

(assert (=> start!28632 (array_inv!4991 a!3312)))

(declare-fun b!292714 () Bool)

(declare-fun e!185161 () Bool)

(assert (=> b!292714 (= e!185160 e!185161)))

(declare-fun res!153770 () Bool)

(assert (=> b!292714 (=> (not res!153770) (not e!185161))))

(declare-datatypes ((SeekEntryResult!2177 0))(
  ( (MissingZero!2177 (index!10878 (_ BitVec 32))) (Found!2177 (index!10879 (_ BitVec 32))) (Intermediate!2177 (undefined!2989 Bool) (index!10880 (_ BitVec 32)) (x!29064 (_ BitVec 32))) (Undefined!2177) (MissingVacant!2177 (index!10881 (_ BitVec 32))) )
))
(declare-fun lt!145024 () SeekEntryResult!2177)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292714 (= res!153770 (or (= lt!145024 (MissingZero!2177 i!1256)) (= lt!145024 (MissingVacant!2177 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14811 (_ BitVec 32)) SeekEntryResult!2177)

(assert (=> b!292714 (= lt!145024 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292715 () Bool)

(declare-fun res!153774 () Bool)

(assert (=> b!292715 (=> (not res!153774) (not e!185160))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292715 (= res!153774 (validKeyInArray!0 k!2524))))

(declare-fun b!292716 () Bool)

(declare-fun res!153772 () Bool)

(assert (=> b!292716 (=> (not res!153772) (not e!185160))))

(assert (=> b!292716 (= res!153772 (and (= (size!7380 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7380 a!3312))))))

(declare-fun b!292717 () Bool)

(declare-fun res!153769 () Bool)

(assert (=> b!292717 (=> (not res!153769) (not e!185161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14811 (_ BitVec 32)) Bool)

(assert (=> b!292717 (= res!153769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292718 () Bool)

(assert (=> b!292718 (= e!185161 false)))

(declare-fun lt!145027 () SeekEntryResult!2177)

(declare-fun lt!145025 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14811 (_ BitVec 32)) SeekEntryResult!2177)

(assert (=> b!292718 (= lt!145027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145025 k!2524 (array!14812 (store (arr!7028 a!3312) i!1256 k!2524) (size!7380 a!3312)) mask!3809))))

(declare-fun lt!145026 () SeekEntryResult!2177)

(assert (=> b!292718 (= lt!145026 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145025 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292718 (= lt!145025 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28632 res!153773) b!292716))

(assert (= (and b!292716 res!153772) b!292715))

(assert (= (and b!292715 res!153774) b!292713))

(assert (= (and b!292713 res!153771) b!292714))

(assert (= (and b!292714 res!153770) b!292717))

(assert (= (and b!292717 res!153769) b!292718))

(declare-fun m!306477 () Bool)

(assert (=> b!292713 m!306477))

(declare-fun m!306479 () Bool)

(assert (=> start!28632 m!306479))

(declare-fun m!306481 () Bool)

(assert (=> start!28632 m!306481))

(declare-fun m!306483 () Bool)

(assert (=> b!292717 m!306483))

(declare-fun m!306485 () Bool)

(assert (=> b!292718 m!306485))

(declare-fun m!306487 () Bool)

(assert (=> b!292718 m!306487))

(declare-fun m!306489 () Bool)

(assert (=> b!292718 m!306489))

(declare-fun m!306491 () Bool)

(assert (=> b!292718 m!306491))

(declare-fun m!306493 () Bool)

(assert (=> b!292715 m!306493))

(declare-fun m!306495 () Bool)

(assert (=> b!292714 m!306495))

(push 1)

