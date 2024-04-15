; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87192 () Bool)

(assert start!87192)

(declare-fun b!1010720 () Bool)

(declare-fun e!568606 () Bool)

(declare-fun e!568604 () Bool)

(assert (=> b!1010720 (= e!568606 e!568604)))

(declare-fun res!678969 () Bool)

(assert (=> b!1010720 (=> (not res!678969) (not e!568604))))

(declare-datatypes ((SeekEntryResult!9569 0))(
  ( (MissingZero!9569 (index!40647 (_ BitVec 32))) (Found!9569 (index!40648 (_ BitVec 32))) (Intermediate!9569 (undefined!10381 Bool) (index!40649 (_ BitVec 32)) (x!88075 (_ BitVec 32))) (Undefined!9569) (MissingVacant!9569 (index!40650 (_ BitVec 32))) )
))
(declare-fun lt!446571 () SeekEntryResult!9569)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1010720 (= res!678969 (or (= lt!446571 (MissingVacant!9569 i!1194)) (= lt!446571 (MissingZero!9569 i!1194))))))

(declare-datatypes ((array!63592 0))(
  ( (array!63593 (arr!30612 (Array (_ BitVec 32) (_ BitVec 64))) (size!31116 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63592)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63592 (_ BitVec 32)) SeekEntryResult!9569)

(assert (=> b!1010720 (= lt!446571 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1010721 () Bool)

(declare-fun res!678971 () Bool)

(assert (=> b!1010721 (=> (not res!678971) (not e!568606))))

(declare-fun arrayContainsKey!0 (array!63592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010721 (= res!678971 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1010722 () Bool)

(declare-fun res!678982 () Bool)

(assert (=> b!1010722 (=> (not res!678982) (not e!568604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63592 (_ BitVec 32)) Bool)

(assert (=> b!1010722 (= res!678982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010723 () Bool)

(declare-fun e!568603 () Bool)

(declare-fun e!568605 () Bool)

(assert (=> b!1010723 (= e!568603 e!568605)))

(declare-fun res!678978 () Bool)

(assert (=> b!1010723 (=> (not res!678978) (not e!568605))))

(declare-fun lt!446572 () (_ BitVec 64))

(declare-fun lt!446566 () array!63592)

(declare-fun lt!446568 () SeekEntryResult!9569)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63592 (_ BitVec 32)) SeekEntryResult!9569)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010723 (= res!678978 (not (= lt!446568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446572 mask!3464) lt!446572 lt!446566 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1010723 (= lt!446572 (select (store (arr!30612 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1010723 (= lt!446566 (array!63593 (store (arr!30612 a!3219) i!1194 k0!2224) (size!31116 a!3219)))))

(declare-fun b!1010724 () Bool)

(declare-fun res!678977 () Bool)

(assert (=> b!1010724 (=> (not res!678977) (not e!568606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010724 (= res!678977 (validKeyInArray!0 (select (arr!30612 a!3219) j!170)))))

(declare-fun b!1010725 () Bool)

(declare-fun res!678974 () Bool)

(assert (=> b!1010725 (=> (not res!678974) (not e!568605))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1010725 (= res!678974 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010727 () Bool)

(declare-fun res!678970 () Bool)

(assert (=> b!1010727 (=> (not res!678970) (not e!568605))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!446570 () SeekEntryResult!9569)

(assert (=> b!1010727 (= res!678970 (not (= lt!446570 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446572 lt!446566 mask!3464))))))

(declare-fun b!1010728 () Bool)

(declare-fun e!568601 () Bool)

(assert (=> b!1010728 (= e!568605 e!568601)))

(declare-fun res!678980 () Bool)

(assert (=> b!1010728 (=> (not res!678980) (not e!568601))))

(declare-fun lt!446569 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010728 (= res!678980 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!446569 #b00000000000000000000000000000000) (bvslt lt!446569 (size!31116 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010728 (= lt!446569 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1010729 () Bool)

(declare-fun e!568607 () Bool)

(assert (=> b!1010729 (= e!568607 e!568603)))

(declare-fun res!678975 () Bool)

(assert (=> b!1010729 (=> (not res!678975) (not e!568603))))

(declare-fun lt!446565 () SeekEntryResult!9569)

(assert (=> b!1010729 (= res!678975 (= lt!446570 lt!446565))))

(assert (=> b!1010729 (= lt!446570 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30612 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010730 () Bool)

(declare-fun res!678979 () Bool)

(assert (=> b!1010730 (=> (not res!678979) (not e!568604))))

(declare-datatypes ((List!21354 0))(
  ( (Nil!21351) (Cons!21350 (h!22545 (_ BitVec 64)) (t!30346 List!21354)) )
))
(declare-fun arrayNoDuplicates!0 (array!63592 (_ BitVec 32) List!21354) Bool)

(assert (=> b!1010730 (= res!678979 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21351))))

(declare-fun b!1010731 () Bool)

(declare-fun res!678972 () Bool)

(assert (=> b!1010731 (=> (not res!678972) (not e!568604))))

(assert (=> b!1010731 (= res!678972 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31116 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31116 a!3219))))))

(declare-fun b!1010732 () Bool)

(declare-fun res!678973 () Bool)

(assert (=> b!1010732 (=> (not res!678973) (not e!568606))))

(assert (=> b!1010732 (= res!678973 (and (= (size!31116 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31116 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31116 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1010733 () Bool)

(assert (=> b!1010733 (= e!568601 false)))

(declare-fun lt!446567 () SeekEntryResult!9569)

(assert (=> b!1010733 (= lt!446567 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446569 (select (arr!30612 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010734 () Bool)

(assert (=> b!1010734 (= e!568604 e!568607)))

(declare-fun res!678983 () Bool)

(assert (=> b!1010734 (=> (not res!678983) (not e!568607))))

(assert (=> b!1010734 (= res!678983 (= lt!446568 lt!446565))))

(assert (=> b!1010734 (= lt!446565 (Intermediate!9569 false resIndex!38 resX!38))))

(assert (=> b!1010734 (= lt!446568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30612 a!3219) j!170) mask!3464) (select (arr!30612 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010726 () Bool)

(declare-fun res!678976 () Bool)

(assert (=> b!1010726 (=> (not res!678976) (not e!568606))))

(assert (=> b!1010726 (= res!678976 (validKeyInArray!0 k0!2224))))

(declare-fun res!678981 () Bool)

(assert (=> start!87192 (=> (not res!678981) (not e!568606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87192 (= res!678981 (validMask!0 mask!3464))))

(assert (=> start!87192 e!568606))

(declare-fun array_inv!23755 (array!63592) Bool)

(assert (=> start!87192 (array_inv!23755 a!3219)))

(assert (=> start!87192 true))

(assert (= (and start!87192 res!678981) b!1010732))

(assert (= (and b!1010732 res!678973) b!1010724))

(assert (= (and b!1010724 res!678977) b!1010726))

(assert (= (and b!1010726 res!678976) b!1010721))

(assert (= (and b!1010721 res!678971) b!1010720))

(assert (= (and b!1010720 res!678969) b!1010722))

(assert (= (and b!1010722 res!678982) b!1010730))

(assert (= (and b!1010730 res!678979) b!1010731))

(assert (= (and b!1010731 res!678972) b!1010734))

(assert (= (and b!1010734 res!678983) b!1010729))

(assert (= (and b!1010729 res!678975) b!1010723))

(assert (= (and b!1010723 res!678978) b!1010727))

(assert (= (and b!1010727 res!678970) b!1010725))

(assert (= (and b!1010725 res!678974) b!1010728))

(assert (= (and b!1010728 res!678980) b!1010733))

(declare-fun m!934393 () Bool)

(assert (=> start!87192 m!934393))

(declare-fun m!934395 () Bool)

(assert (=> start!87192 m!934395))

(declare-fun m!934397 () Bool)

(assert (=> b!1010721 m!934397))

(declare-fun m!934399 () Bool)

(assert (=> b!1010723 m!934399))

(assert (=> b!1010723 m!934399))

(declare-fun m!934401 () Bool)

(assert (=> b!1010723 m!934401))

(declare-fun m!934403 () Bool)

(assert (=> b!1010723 m!934403))

(declare-fun m!934405 () Bool)

(assert (=> b!1010723 m!934405))

(declare-fun m!934407 () Bool)

(assert (=> b!1010730 m!934407))

(declare-fun m!934409 () Bool)

(assert (=> b!1010726 m!934409))

(declare-fun m!934411 () Bool)

(assert (=> b!1010733 m!934411))

(assert (=> b!1010733 m!934411))

(declare-fun m!934413 () Bool)

(assert (=> b!1010733 m!934413))

(assert (=> b!1010724 m!934411))

(assert (=> b!1010724 m!934411))

(declare-fun m!934415 () Bool)

(assert (=> b!1010724 m!934415))

(declare-fun m!934417 () Bool)

(assert (=> b!1010727 m!934417))

(assert (=> b!1010729 m!934411))

(assert (=> b!1010729 m!934411))

(declare-fun m!934419 () Bool)

(assert (=> b!1010729 m!934419))

(declare-fun m!934421 () Bool)

(assert (=> b!1010722 m!934421))

(assert (=> b!1010734 m!934411))

(assert (=> b!1010734 m!934411))

(declare-fun m!934423 () Bool)

(assert (=> b!1010734 m!934423))

(assert (=> b!1010734 m!934423))

(assert (=> b!1010734 m!934411))

(declare-fun m!934425 () Bool)

(assert (=> b!1010734 m!934425))

(declare-fun m!934427 () Bool)

(assert (=> b!1010728 m!934427))

(declare-fun m!934429 () Bool)

(assert (=> b!1010720 m!934429))

(check-sat (not b!1010727) (not b!1010733) (not b!1010729) (not b!1010724) (not b!1010730) (not b!1010734) (not b!1010722) (not b!1010721) (not b!1010726) (not b!1010723) (not b!1010728) (not start!87192) (not b!1010720))
(check-sat)
