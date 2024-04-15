; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29156 () Bool)

(assert start!29156)

(declare-fun res!155683 () Bool)

(declare-fun e!186920 () Bool)

(assert (=> start!29156 (=> (not res!155683) (not e!186920))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29156 (= res!155683 (validMask!0 mask!3809))))

(assert (=> start!29156 e!186920))

(assert (=> start!29156 true))

(declare-datatypes ((array!14962 0))(
  ( (array!14963 (arr!7092 (Array (_ BitVec 32) (_ BitVec 64))) (size!7445 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14962)

(declare-fun array_inv!5064 (array!14962) Bool)

(assert (=> start!29156 (array_inv!5064 a!3312)))

(declare-fun b!295743 () Bool)

(declare-fun res!155680 () Bool)

(assert (=> b!295743 (=> (not res!155680) (not e!186920))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295743 (= res!155680 (validKeyInArray!0 k0!2524))))

(declare-fun b!295744 () Bool)

(declare-fun e!186918 () Bool)

(declare-fun e!186921 () Bool)

(assert (=> b!295744 (= e!186918 e!186921)))

(declare-fun res!155686 () Bool)

(assert (=> b!295744 (=> (not res!155686) (not e!186921))))

(declare-fun lt!146657 () Bool)

(assert (=> b!295744 (= res!155686 lt!146657)))

(declare-datatypes ((SeekEntryResult!2240 0))(
  ( (MissingZero!2240 (index!11130 (_ BitVec 32))) (Found!2240 (index!11131 (_ BitVec 32))) (Intermediate!2240 (undefined!3052 Bool) (index!11132 (_ BitVec 32)) (x!29360 (_ BitVec 32))) (Undefined!2240) (MissingVacant!2240 (index!11133 (_ BitVec 32))) )
))
(declare-fun lt!146658 () SeekEntryResult!2240)

(declare-fun lt!146661 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14962 (_ BitVec 32)) SeekEntryResult!2240)

(assert (=> b!295744 (= lt!146658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146661 k0!2524 (array!14963 (store (arr!7092 a!3312) i!1256 k0!2524) (size!7445 a!3312)) mask!3809))))

(declare-fun lt!146660 () SeekEntryResult!2240)

(assert (=> b!295744 (= lt!146660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146661 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295744 (= lt!146661 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295745 () Bool)

(declare-fun e!186919 () Bool)

(assert (=> b!295745 (= e!186919 (not true))))

(assert (=> b!295745 (and (= (select (arr!7092 a!3312) (index!11132 lt!146660)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11132 lt!146660) i!1256))))

(declare-fun b!295746 () Bool)

(assert (=> b!295746 (= e!186921 e!186919)))

(declare-fun res!155685 () Bool)

(assert (=> b!295746 (=> (not res!155685) (not e!186919))))

(declare-fun lt!146659 () Bool)

(assert (=> b!295746 (= res!155685 (and (or lt!146659 (not (undefined!3052 lt!146660))) (or lt!146659 (not (= (select (arr!7092 a!3312) (index!11132 lt!146660)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146659 (not (= (select (arr!7092 a!3312) (index!11132 lt!146660)) k0!2524))) (not lt!146659)))))

(get-info :version)

(assert (=> b!295746 (= lt!146659 (not ((_ is Intermediate!2240) lt!146660)))))

(declare-fun b!295747 () Bool)

(declare-fun res!155679 () Bool)

(assert (=> b!295747 (=> (not res!155679) (not e!186918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14962 (_ BitVec 32)) Bool)

(assert (=> b!295747 (= res!155679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295748 () Bool)

(assert (=> b!295748 (= e!186920 e!186918)))

(declare-fun res!155681 () Bool)

(assert (=> b!295748 (=> (not res!155681) (not e!186918))))

(declare-fun lt!146656 () SeekEntryResult!2240)

(assert (=> b!295748 (= res!155681 (or lt!146657 (= lt!146656 (MissingVacant!2240 i!1256))))))

(assert (=> b!295748 (= lt!146657 (= lt!146656 (MissingZero!2240 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14962 (_ BitVec 32)) SeekEntryResult!2240)

(assert (=> b!295748 (= lt!146656 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295749 () Bool)

(declare-fun res!155684 () Bool)

(assert (=> b!295749 (=> (not res!155684) (not e!186920))))

(assert (=> b!295749 (= res!155684 (and (= (size!7445 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7445 a!3312))))))

(declare-fun b!295750 () Bool)

(declare-fun res!155682 () Bool)

(assert (=> b!295750 (=> (not res!155682) (not e!186920))))

(declare-fun arrayContainsKey!0 (array!14962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295750 (= res!155682 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29156 res!155683) b!295749))

(assert (= (and b!295749 res!155684) b!295743))

(assert (= (and b!295743 res!155680) b!295750))

(assert (= (and b!295750 res!155682) b!295748))

(assert (= (and b!295748 res!155681) b!295747))

(assert (= (and b!295747 res!155679) b!295744))

(assert (= (and b!295744 res!155686) b!295746))

(assert (= (and b!295746 res!155685) b!295745))

(declare-fun m!308355 () Bool)

(assert (=> start!29156 m!308355))

(declare-fun m!308357 () Bool)

(assert (=> start!29156 m!308357))

(declare-fun m!308359 () Bool)

(assert (=> b!295747 m!308359))

(declare-fun m!308361 () Bool)

(assert (=> b!295743 m!308361))

(declare-fun m!308363 () Bool)

(assert (=> b!295748 m!308363))

(declare-fun m!308365 () Bool)

(assert (=> b!295750 m!308365))

(declare-fun m!308367 () Bool)

(assert (=> b!295746 m!308367))

(declare-fun m!308369 () Bool)

(assert (=> b!295744 m!308369))

(declare-fun m!308371 () Bool)

(assert (=> b!295744 m!308371))

(declare-fun m!308373 () Bool)

(assert (=> b!295744 m!308373))

(declare-fun m!308375 () Bool)

(assert (=> b!295744 m!308375))

(assert (=> b!295745 m!308367))

(check-sat (not b!295743) (not start!29156) (not b!295747) (not b!295744) (not b!295750) (not b!295748))
(check-sat)
