; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28610 () Bool)

(assert start!28610)

(declare-fun b!292404 () Bool)

(declare-fun res!153514 () Bool)

(declare-fun e!184979 () Bool)

(assert (=> b!292404 (=> (not res!153514) (not e!184979))))

(declare-datatypes ((array!14782 0))(
  ( (array!14783 (arr!7014 (Array (_ BitVec 32) (_ BitVec 64))) (size!7367 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14782)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292404 (= res!153514 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292405 () Bool)

(declare-fun res!153516 () Bool)

(assert (=> b!292405 (=> (not res!153516) (not e!184979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292405 (= res!153516 (validKeyInArray!0 k0!2524))))

(declare-fun b!292406 () Bool)

(declare-fun e!184980 () Bool)

(assert (=> b!292406 (= e!184980 false)))

(declare-fun lt!144738 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2162 0))(
  ( (MissingZero!2162 (index!10818 (_ BitVec 32))) (Found!2162 (index!10819 (_ BitVec 32))) (Intermediate!2162 (undefined!2974 Bool) (index!10820 (_ BitVec 32)) (x!29024 (_ BitVec 32))) (Undefined!2162) (MissingVacant!2162 (index!10821 (_ BitVec 32))) )
))
(declare-fun lt!144736 () SeekEntryResult!2162)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14782 (_ BitVec 32)) SeekEntryResult!2162)

(assert (=> b!292406 (= lt!144736 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144738 k0!2524 (array!14783 (store (arr!7014 a!3312) i!1256 k0!2524) (size!7367 a!3312)) mask!3809))))

(declare-fun lt!144735 () SeekEntryResult!2162)

(assert (=> b!292406 (= lt!144735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144738 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292406 (= lt!144738 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292407 () Bool)

(assert (=> b!292407 (= e!184979 e!184980)))

(declare-fun res!153515 () Bool)

(assert (=> b!292407 (=> (not res!153515) (not e!184980))))

(declare-fun lt!144737 () SeekEntryResult!2162)

(assert (=> b!292407 (= res!153515 (or (= lt!144737 (MissingZero!2162 i!1256)) (= lt!144737 (MissingVacant!2162 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14782 (_ BitVec 32)) SeekEntryResult!2162)

(assert (=> b!292407 (= lt!144737 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!153517 () Bool)

(assert (=> start!28610 (=> (not res!153517) (not e!184979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28610 (= res!153517 (validMask!0 mask!3809))))

(assert (=> start!28610 e!184979))

(assert (=> start!28610 true))

(declare-fun array_inv!4986 (array!14782) Bool)

(assert (=> start!28610 (array_inv!4986 a!3312)))

(declare-fun b!292408 () Bool)

(declare-fun res!153512 () Bool)

(assert (=> b!292408 (=> (not res!153512) (not e!184979))))

(assert (=> b!292408 (= res!153512 (and (= (size!7367 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7367 a!3312))))))

(declare-fun b!292409 () Bool)

(declare-fun res!153513 () Bool)

(assert (=> b!292409 (=> (not res!153513) (not e!184980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14782 (_ BitVec 32)) Bool)

(assert (=> b!292409 (= res!153513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28610 res!153517) b!292408))

(assert (= (and b!292408 res!153512) b!292405))

(assert (= (and b!292405 res!153516) b!292404))

(assert (= (and b!292404 res!153514) b!292407))

(assert (= (and b!292407 res!153515) b!292409))

(assert (= (and b!292409 res!153513) b!292406))

(declare-fun m!305705 () Bool)

(assert (=> b!292409 m!305705))

(declare-fun m!305707 () Bool)

(assert (=> start!28610 m!305707))

(declare-fun m!305709 () Bool)

(assert (=> start!28610 m!305709))

(declare-fun m!305711 () Bool)

(assert (=> b!292407 m!305711))

(declare-fun m!305713 () Bool)

(assert (=> b!292405 m!305713))

(declare-fun m!305715 () Bool)

(assert (=> b!292404 m!305715))

(declare-fun m!305717 () Bool)

(assert (=> b!292406 m!305717))

(declare-fun m!305719 () Bool)

(assert (=> b!292406 m!305719))

(declare-fun m!305721 () Bool)

(assert (=> b!292406 m!305721))

(declare-fun m!305723 () Bool)

(assert (=> b!292406 m!305723))

(check-sat (not b!292404) (not start!28610) (not b!292405) (not b!292406) (not b!292409) (not b!292407))
(check-sat)
