; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28232 () Bool)

(assert start!28232)

(declare-fun b!289042 () Bool)

(declare-fun e!182997 () Bool)

(assert (=> b!289042 (= e!182997 (not true))))

(declare-datatypes ((array!14539 0))(
  ( (array!14540 (arr!6897 (Array (_ BitVec 32) (_ BitVec 64))) (size!7250 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14539)

(declare-datatypes ((SeekEntryResult!2045 0))(
  ( (MissingZero!2045 (index!10350 (_ BitVec 32))) (Found!2045 (index!10351 (_ BitVec 32))) (Intermediate!2045 (undefined!2857 Bool) (index!10352 (_ BitVec 32)) (x!28577 (_ BitVec 32))) (Undefined!2045) (MissingVacant!2045 (index!10353 (_ BitVec 32))) )
))
(declare-fun lt!142462 () SeekEntryResult!2045)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289042 (and (= (select (arr!6897 a!3312) (index!10352 lt!142462)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10352 lt!142462) i!1256))))

(declare-fun b!289043 () Bool)

(declare-fun res!150718 () Bool)

(declare-fun e!182994 () Bool)

(assert (=> b!289043 (=> (not res!150718) (not e!182994))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14539 (_ BitVec 32)) Bool)

(assert (=> b!289043 (= res!150718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289044 () Bool)

(declare-fun e!182995 () Bool)

(assert (=> b!289044 (= e!182995 e!182994)))

(declare-fun res!150721 () Bool)

(assert (=> b!289044 (=> (not res!150721) (not e!182994))))

(declare-fun lt!142467 () Bool)

(declare-fun lt!142463 () SeekEntryResult!2045)

(assert (=> b!289044 (= res!150721 (or lt!142467 (= lt!142463 (MissingVacant!2045 i!1256))))))

(assert (=> b!289044 (= lt!142467 (= lt!142463 (MissingZero!2045 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14539 (_ BitVec 32)) SeekEntryResult!2045)

(assert (=> b!289044 (= lt!142463 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289045 () Bool)

(declare-fun e!182993 () Bool)

(assert (=> b!289045 (= e!182993 e!182997)))

(declare-fun res!150717 () Bool)

(assert (=> b!289045 (=> (not res!150717) (not e!182997))))

(declare-fun lt!142466 () Bool)

(assert (=> b!289045 (= res!150717 (and (or lt!142466 (not (undefined!2857 lt!142462))) (or lt!142466 (not (= (select (arr!6897 a!3312) (index!10352 lt!142462)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142466 (not (= (select (arr!6897 a!3312) (index!10352 lt!142462)) k0!2524))) (not lt!142466)))))

(get-info :version)

(assert (=> b!289045 (= lt!142466 (not ((_ is Intermediate!2045) lt!142462)))))

(declare-fun b!289046 () Bool)

(declare-fun res!150723 () Bool)

(assert (=> b!289046 (=> (not res!150723) (not e!182995))))

(assert (=> b!289046 (= res!150723 (and (= (size!7250 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7250 a!3312))))))

(declare-fun b!289047 () Bool)

(assert (=> b!289047 (= e!182994 e!182993)))

(declare-fun res!150719 () Bool)

(assert (=> b!289047 (=> (not res!150719) (not e!182993))))

(assert (=> b!289047 (= res!150719 lt!142467)))

(declare-fun lt!142464 () SeekEntryResult!2045)

(declare-fun lt!142465 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14539 (_ BitVec 32)) SeekEntryResult!2045)

(assert (=> b!289047 (= lt!142464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142465 k0!2524 (array!14540 (store (arr!6897 a!3312) i!1256 k0!2524) (size!7250 a!3312)) mask!3809))))

(assert (=> b!289047 (= lt!142462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142465 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289047 (= lt!142465 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!150720 () Bool)

(assert (=> start!28232 (=> (not res!150720) (not e!182995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28232 (= res!150720 (validMask!0 mask!3809))))

(assert (=> start!28232 e!182995))

(assert (=> start!28232 true))

(declare-fun array_inv!4869 (array!14539) Bool)

(assert (=> start!28232 (array_inv!4869 a!3312)))

(declare-fun b!289048 () Bool)

(declare-fun res!150722 () Bool)

(assert (=> b!289048 (=> (not res!150722) (not e!182995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289048 (= res!150722 (validKeyInArray!0 k0!2524))))

(declare-fun b!289049 () Bool)

(declare-fun res!150724 () Bool)

(assert (=> b!289049 (=> (not res!150724) (not e!182995))))

(declare-fun arrayContainsKey!0 (array!14539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289049 (= res!150724 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28232 res!150720) b!289046))

(assert (= (and b!289046 res!150723) b!289048))

(assert (= (and b!289048 res!150722) b!289049))

(assert (= (and b!289049 res!150724) b!289044))

(assert (= (and b!289044 res!150721) b!289043))

(assert (= (and b!289043 res!150718) b!289047))

(assert (= (and b!289047 res!150719) b!289045))

(assert (= (and b!289045 res!150717) b!289042))

(declare-fun m!302765 () Bool)

(assert (=> start!28232 m!302765))

(declare-fun m!302767 () Bool)

(assert (=> start!28232 m!302767))

(declare-fun m!302769 () Bool)

(assert (=> b!289042 m!302769))

(assert (=> b!289045 m!302769))

(declare-fun m!302771 () Bool)

(assert (=> b!289047 m!302771))

(declare-fun m!302773 () Bool)

(assert (=> b!289047 m!302773))

(declare-fun m!302775 () Bool)

(assert (=> b!289047 m!302775))

(declare-fun m!302777 () Bool)

(assert (=> b!289047 m!302777))

(declare-fun m!302779 () Bool)

(assert (=> b!289048 m!302779))

(declare-fun m!302781 () Bool)

(assert (=> b!289043 m!302781))

(declare-fun m!302783 () Bool)

(assert (=> b!289049 m!302783))

(declare-fun m!302785 () Bool)

(assert (=> b!289044 m!302785))

(check-sat (not b!289043) (not b!289049) (not b!289044) (not start!28232) (not b!289048) (not b!289047))
(check-sat)
