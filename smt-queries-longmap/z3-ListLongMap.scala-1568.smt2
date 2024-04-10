; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29898 () Bool)

(assert start!29898)

(declare-fun b!300591 () Bool)

(declare-fun res!158485 () Bool)

(declare-fun e!189799 () Bool)

(assert (=> b!300591 (=> (not res!158485) (not e!189799))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300591 (= res!158485 (validKeyInArray!0 k0!2524))))

(declare-fun b!300592 () Bool)

(declare-fun e!189797 () Bool)

(assert (=> b!300592 (= e!189799 e!189797)))

(declare-fun res!158483 () Bool)

(assert (=> b!300592 (=> (not res!158483) (not e!189797))))

(declare-datatypes ((SeekEntryResult!2331 0))(
  ( (MissingZero!2331 (index!11500 (_ BitVec 32))) (Found!2331 (index!11501 (_ BitVec 32))) (Intermediate!2331 (undefined!3143 Bool) (index!11502 (_ BitVec 32)) (x!29757 (_ BitVec 32))) (Undefined!2331) (MissingVacant!2331 (index!11503 (_ BitVec 32))) )
))
(declare-fun lt!149535 () SeekEntryResult!2331)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!300592 (= res!158483 (or (= lt!149535 (MissingZero!2331 i!1256)) (= lt!149535 (MissingVacant!2331 i!1256))))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!15176 0))(
  ( (array!15177 (arr!7182 (Array (_ BitVec 32) (_ BitVec 64))) (size!7534 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15176)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15176 (_ BitVec 32)) SeekEntryResult!2331)

(assert (=> b!300592 (= lt!149535 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300593 () Bool)

(assert (=> b!300593 (= e!189797 false)))

(declare-fun lt!149538 () (_ BitVec 32))

(declare-fun lt!149536 () SeekEntryResult!2331)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15176 (_ BitVec 32)) SeekEntryResult!2331)

(assert (=> b!300593 (= lt!149536 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149538 k0!2524 (array!15177 (store (arr!7182 a!3312) i!1256 k0!2524) (size!7534 a!3312)) mask!3809))))

(declare-fun lt!149537 () SeekEntryResult!2331)

(assert (=> b!300593 (= lt!149537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149538 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300593 (= lt!149538 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!300594 () Bool)

(declare-fun res!158482 () Bool)

(assert (=> b!300594 (=> (not res!158482) (not e!189799))))

(assert (=> b!300594 (= res!158482 (and (= (size!7534 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7534 a!3312))))))

(declare-fun b!300595 () Bool)

(declare-fun res!158486 () Bool)

(assert (=> b!300595 (=> (not res!158486) (not e!189797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15176 (_ BitVec 32)) Bool)

(assert (=> b!300595 (= res!158486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!158487 () Bool)

(assert (=> start!29898 (=> (not res!158487) (not e!189799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29898 (= res!158487 (validMask!0 mask!3809))))

(assert (=> start!29898 e!189799))

(assert (=> start!29898 true))

(declare-fun array_inv!5145 (array!15176) Bool)

(assert (=> start!29898 (array_inv!5145 a!3312)))

(declare-fun b!300596 () Bool)

(declare-fun res!158484 () Bool)

(assert (=> b!300596 (=> (not res!158484) (not e!189799))))

(declare-fun arrayContainsKey!0 (array!15176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300596 (= res!158484 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29898 res!158487) b!300594))

(assert (= (and b!300594 res!158482) b!300591))

(assert (= (and b!300591 res!158485) b!300596))

(assert (= (and b!300596 res!158484) b!300592))

(assert (= (and b!300592 res!158483) b!300595))

(assert (= (and b!300595 res!158486) b!300593))

(declare-fun m!312569 () Bool)

(assert (=> b!300592 m!312569))

(declare-fun m!312571 () Bool)

(assert (=> b!300591 m!312571))

(declare-fun m!312573 () Bool)

(assert (=> b!300596 m!312573))

(declare-fun m!312575 () Bool)

(assert (=> start!29898 m!312575))

(declare-fun m!312577 () Bool)

(assert (=> start!29898 m!312577))

(declare-fun m!312579 () Bool)

(assert (=> b!300595 m!312579))

(declare-fun m!312581 () Bool)

(assert (=> b!300593 m!312581))

(declare-fun m!312583 () Bool)

(assert (=> b!300593 m!312583))

(declare-fun m!312585 () Bool)

(assert (=> b!300593 m!312585))

(declare-fun m!312587 () Bool)

(assert (=> b!300593 m!312587))

(check-sat (not b!300591) (not b!300595) (not b!300596) (not b!300593) (not start!29898) (not b!300592))
(check-sat)
