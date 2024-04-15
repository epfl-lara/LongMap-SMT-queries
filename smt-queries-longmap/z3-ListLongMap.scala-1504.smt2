; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28502 () Bool)

(assert start!28502)

(declare-fun b!291526 () Bool)

(declare-fun e!184454 () Bool)

(declare-fun e!184458 () Bool)

(assert (=> b!291526 (= e!184454 e!184458)))

(declare-fun res!152775 () Bool)

(assert (=> b!291526 (=> (not res!152775) (not e!184458))))

(declare-fun lt!144124 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2132 0))(
  ( (MissingZero!2132 (index!10698 (_ BitVec 32))) (Found!2132 (index!10699 (_ BitVec 32))) (Intermediate!2132 (undefined!2944 Bool) (index!10700 (_ BitVec 32)) (x!28908 (_ BitVec 32))) (Undefined!2132) (MissingVacant!2132 (index!10701 (_ BitVec 32))) )
))
(declare-fun lt!144122 () SeekEntryResult!2132)

(assert (=> b!291526 (= res!152775 (and (not lt!144124) (= lt!144122 (MissingVacant!2132 i!1256))))))

(declare-fun lt!144125 () (_ BitVec 32))

(declare-datatypes ((array!14719 0))(
  ( (array!14720 (arr!6984 (Array (_ BitVec 32) (_ BitVec 64))) (size!7337 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14719)

(declare-fun lt!144121 () SeekEntryResult!2132)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14719 (_ BitVec 32)) SeekEntryResult!2132)

(assert (=> b!291526 (= lt!144121 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144125 k0!2524 (array!14720 (store (arr!6984 a!3312) i!1256 k0!2524) (size!7337 a!3312)) mask!3809))))

(declare-fun lt!144126 () SeekEntryResult!2132)

(assert (=> b!291526 (= lt!144126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144125 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291526 (= lt!144125 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291527 () Bool)

(declare-fun res!152777 () Bool)

(assert (=> b!291527 (=> (not res!152777) (not e!184454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14719 (_ BitVec 32)) Bool)

(assert (=> b!291527 (= res!152777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291528 () Bool)

(declare-fun res!152779 () Bool)

(declare-fun e!184455 () Bool)

(assert (=> b!291528 (=> (not res!152779) (not e!184455))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291528 (= res!152779 (validKeyInArray!0 k0!2524))))

(declare-fun b!291529 () Bool)

(assert (=> b!291529 (= e!184455 e!184454)))

(declare-fun res!152778 () Bool)

(assert (=> b!291529 (=> (not res!152778) (not e!184454))))

(assert (=> b!291529 (= res!152778 (or lt!144124 (= lt!144122 (MissingVacant!2132 i!1256))))))

(assert (=> b!291529 (= lt!144124 (= lt!144122 (MissingZero!2132 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14719 (_ BitVec 32)) SeekEntryResult!2132)

(assert (=> b!291529 (= lt!144122 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291530 () Bool)

(declare-fun res!152782 () Bool)

(assert (=> b!291530 (=> (not res!152782) (not e!184455))))

(declare-fun arrayContainsKey!0 (array!14719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291530 (= res!152782 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!152781 () Bool)

(assert (=> start!28502 (=> (not res!152781) (not e!184455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28502 (= res!152781 (validMask!0 mask!3809))))

(assert (=> start!28502 e!184455))

(assert (=> start!28502 true))

(declare-fun array_inv!4956 (array!14719) Bool)

(assert (=> start!28502 (array_inv!4956 a!3312)))

(declare-fun b!291531 () Bool)

(declare-fun e!184457 () Bool)

(assert (=> b!291531 (= e!184457 (not true))))

(assert (=> b!291531 (= (index!10700 lt!144126) i!1256)))

(declare-fun b!291532 () Bool)

(declare-fun res!152776 () Bool)

(assert (=> b!291532 (=> (not res!152776) (not e!184455))))

(assert (=> b!291532 (= res!152776 (and (= (size!7337 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7337 a!3312))))))

(declare-fun b!291533 () Bool)

(assert (=> b!291533 (= e!184458 e!184457)))

(declare-fun res!152780 () Bool)

(assert (=> b!291533 (=> (not res!152780) (not e!184457))))

(declare-fun lt!144123 () Bool)

(assert (=> b!291533 (= res!152780 (and (or lt!144123 (not (undefined!2944 lt!144126))) (not lt!144123) (= (select (arr!6984 a!3312) (index!10700 lt!144126)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291533 (= lt!144123 (not ((_ is Intermediate!2132) lt!144126)))))

(assert (= (and start!28502 res!152781) b!291532))

(assert (= (and b!291532 res!152776) b!291528))

(assert (= (and b!291528 res!152779) b!291530))

(assert (= (and b!291530 res!152782) b!291529))

(assert (= (and b!291529 res!152778) b!291527))

(assert (= (and b!291527 res!152777) b!291526))

(assert (= (and b!291526 res!152775) b!291533))

(assert (= (and b!291533 res!152780) b!291531))

(declare-fun m!304919 () Bool)

(assert (=> b!291528 m!304919))

(declare-fun m!304921 () Bool)

(assert (=> b!291529 m!304921))

(declare-fun m!304923 () Bool)

(assert (=> b!291526 m!304923))

(declare-fun m!304925 () Bool)

(assert (=> b!291526 m!304925))

(declare-fun m!304927 () Bool)

(assert (=> b!291526 m!304927))

(declare-fun m!304929 () Bool)

(assert (=> b!291526 m!304929))

(declare-fun m!304931 () Bool)

(assert (=> b!291527 m!304931))

(declare-fun m!304933 () Bool)

(assert (=> b!291530 m!304933))

(declare-fun m!304935 () Bool)

(assert (=> b!291533 m!304935))

(declare-fun m!304937 () Bool)

(assert (=> start!28502 m!304937))

(declare-fun m!304939 () Bool)

(assert (=> start!28502 m!304939))

(check-sat (not start!28502) (not b!291530) (not b!291529) (not b!291526) (not b!291527) (not b!291528))
(check-sat)
