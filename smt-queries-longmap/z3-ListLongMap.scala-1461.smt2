; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28100 () Bool)

(assert start!28100)

(declare-fun b!287818 () Bool)

(declare-fun res!149635 () Bool)

(declare-fun e!182235 () Bool)

(assert (=> b!287818 (=> (not res!149635) (not e!182235))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287818 (= res!149635 (validKeyInArray!0 k0!2524))))

(declare-fun b!287819 () Bool)

(declare-fun e!182231 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!287819 (= e!182231 (not (bvsge mask!3809 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!14452 0))(
  ( (array!14453 (arr!6855 (Array (_ BitVec 32) (_ BitVec 64))) (size!7208 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14452)

(declare-datatypes ((SeekEntryResult!2003 0))(
  ( (MissingZero!2003 (index!10182 (_ BitVec 32))) (Found!2003 (index!10183 (_ BitVec 32))) (Intermediate!2003 (undefined!2815 Bool) (index!10184 (_ BitVec 32)) (x!28417 (_ BitVec 32))) (Undefined!2003) (MissingVacant!2003 (index!10185 (_ BitVec 32))) )
))
(declare-fun lt!141615 () SeekEntryResult!2003)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287819 (and (= (select (arr!6855 a!3312) (index!10184 lt!141615)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10184 lt!141615) i!1256))))

(declare-fun b!287820 () Bool)

(declare-fun res!149638 () Bool)

(assert (=> b!287820 (=> (not res!149638) (not e!182235))))

(declare-fun arrayContainsKey!0 (array!14452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287820 (= res!149638 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287821 () Bool)

(declare-fun e!182232 () Bool)

(assert (=> b!287821 (= e!182235 e!182232)))

(declare-fun res!149634 () Bool)

(assert (=> b!287821 (=> (not res!149634) (not e!182232))))

(declare-fun lt!141614 () SeekEntryResult!2003)

(declare-fun lt!141612 () Bool)

(assert (=> b!287821 (= res!149634 (or lt!141612 (= lt!141614 (MissingVacant!2003 i!1256))))))

(assert (=> b!287821 (= lt!141612 (= lt!141614 (MissingZero!2003 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14452 (_ BitVec 32)) SeekEntryResult!2003)

(assert (=> b!287821 (= lt!141614 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287822 () Bool)

(declare-fun res!149636 () Bool)

(assert (=> b!287822 (=> (not res!149636) (not e!182235))))

(assert (=> b!287822 (= res!149636 (and (= (size!7208 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7208 a!3312))))))

(declare-fun res!149637 () Bool)

(assert (=> start!28100 (=> (not res!149637) (not e!182235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28100 (= res!149637 (validMask!0 mask!3809))))

(assert (=> start!28100 e!182235))

(assert (=> start!28100 true))

(declare-fun array_inv!4827 (array!14452) Bool)

(assert (=> start!28100 (array_inv!4827 a!3312)))

(declare-fun b!287823 () Bool)

(declare-fun e!182233 () Bool)

(assert (=> b!287823 (= e!182232 e!182233)))

(declare-fun res!149639 () Bool)

(assert (=> b!287823 (=> (not res!149639) (not e!182233))))

(assert (=> b!287823 (= res!149639 lt!141612)))

(declare-fun lt!141613 () (_ BitVec 32))

(declare-fun lt!141610 () SeekEntryResult!2003)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14452 (_ BitVec 32)) SeekEntryResult!2003)

(assert (=> b!287823 (= lt!141610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141613 k0!2524 (array!14453 (store (arr!6855 a!3312) i!1256 k0!2524) (size!7208 a!3312)) mask!3809))))

(assert (=> b!287823 (= lt!141615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141613 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287823 (= lt!141613 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!287824 () Bool)

(declare-fun res!149641 () Bool)

(assert (=> b!287824 (=> (not res!149641) (not e!182232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14452 (_ BitVec 32)) Bool)

(assert (=> b!287824 (= res!149641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287825 () Bool)

(assert (=> b!287825 (= e!182233 e!182231)))

(declare-fun res!149640 () Bool)

(assert (=> b!287825 (=> (not res!149640) (not e!182231))))

(declare-fun lt!141611 () Bool)

(assert (=> b!287825 (= res!149640 (and (or lt!141611 (not (undefined!2815 lt!141615))) (or lt!141611 (not (= (select (arr!6855 a!3312) (index!10184 lt!141615)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!141611 (not (= (select (arr!6855 a!3312) (index!10184 lt!141615)) k0!2524))) (not lt!141611)))))

(get-info :version)

(assert (=> b!287825 (= lt!141611 (not ((_ is Intermediate!2003) lt!141615)))))

(assert (= (and start!28100 res!149637) b!287822))

(assert (= (and b!287822 res!149636) b!287818))

(assert (= (and b!287818 res!149635) b!287820))

(assert (= (and b!287820 res!149638) b!287821))

(assert (= (and b!287821 res!149634) b!287824))

(assert (= (and b!287824 res!149641) b!287823))

(assert (= (and b!287823 res!149639) b!287825))

(assert (= (and b!287825 res!149640) b!287819))

(declare-fun m!301721 () Bool)

(assert (=> b!287825 m!301721))

(declare-fun m!301723 () Bool)

(assert (=> b!287818 m!301723))

(declare-fun m!301725 () Bool)

(assert (=> b!287824 m!301725))

(declare-fun m!301727 () Bool)

(assert (=> start!28100 m!301727))

(declare-fun m!301729 () Bool)

(assert (=> start!28100 m!301729))

(assert (=> b!287819 m!301721))

(declare-fun m!301731 () Bool)

(assert (=> b!287820 m!301731))

(declare-fun m!301733 () Bool)

(assert (=> b!287821 m!301733))

(declare-fun m!301735 () Bool)

(assert (=> b!287823 m!301735))

(declare-fun m!301737 () Bool)

(assert (=> b!287823 m!301737))

(declare-fun m!301739 () Bool)

(assert (=> b!287823 m!301739))

(declare-fun m!301741 () Bool)

(assert (=> b!287823 m!301741))

(check-sat (not b!287818) (not start!28100) (not b!287823) (not b!287820) (not b!287821) (not b!287824))
(check-sat)
