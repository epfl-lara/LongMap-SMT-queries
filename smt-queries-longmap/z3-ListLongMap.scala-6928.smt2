; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87122 () Bool)

(assert start!87122)

(declare-fun b!1010287 () Bool)

(declare-fun res!678691 () Bool)

(declare-fun e!568367 () Bool)

(assert (=> b!1010287 (=> (not res!678691) (not e!568367))))

(declare-datatypes ((array!63640 0))(
  ( (array!63641 (arr!30638 (Array (_ BitVec 32) (_ BitVec 64))) (size!31140 (_ BitVec 32))) )
))
(declare-fun lt!446530 () array!63640)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9570 0))(
  ( (MissingZero!9570 (index!40651 (_ BitVec 32))) (Found!9570 (index!40652 (_ BitVec 32))) (Intermediate!9570 (undefined!10382 Bool) (index!40653 (_ BitVec 32)) (x!88054 (_ BitVec 32))) (Undefined!9570) (MissingVacant!9570 (index!40654 (_ BitVec 32))) )
))
(declare-fun lt!446535 () SeekEntryResult!9570)

(declare-fun lt!446531 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63640 (_ BitVec 32)) SeekEntryResult!9570)

(assert (=> b!1010287 (= res!678691 (not (= lt!446535 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446531 lt!446530 mask!3464))))))

(declare-fun res!678693 () Bool)

(declare-fun e!568369 () Bool)

(assert (=> start!87122 (=> (not res!678693) (not e!568369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87122 (= res!678693 (validMask!0 mask!3464))))

(assert (=> start!87122 e!568369))

(declare-fun a!3219 () array!63640)

(declare-fun array_inv!23762 (array!63640) Bool)

(assert (=> start!87122 (array_inv!23762 a!3219)))

(assert (=> start!87122 true))

(declare-fun b!1010288 () Bool)

(declare-fun res!678684 () Bool)

(declare-fun e!568364 () Bool)

(assert (=> b!1010288 (=> (not res!678684) (not e!568364))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010288 (= res!678684 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31140 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31140 a!3219))))))

(declare-fun b!1010289 () Bool)

(declare-fun res!678692 () Bool)

(assert (=> b!1010289 (=> (not res!678692) (not e!568369))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1010289 (= res!678692 (and (= (size!31140 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31140 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31140 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1010290 () Bool)

(declare-fun e!568366 () Bool)

(assert (=> b!1010290 (= e!568364 e!568366)))

(declare-fun res!678685 () Bool)

(assert (=> b!1010290 (=> (not res!678685) (not e!568366))))

(declare-fun lt!446529 () SeekEntryResult!9570)

(declare-fun lt!446532 () SeekEntryResult!9570)

(assert (=> b!1010290 (= res!678685 (= lt!446529 lt!446532))))

(assert (=> b!1010290 (= lt!446532 (Intermediate!9570 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010290 (= lt!446529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30638 a!3219) j!170) mask!3464) (select (arr!30638 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010291 () Bool)

(declare-fun res!678686 () Bool)

(assert (=> b!1010291 (=> (not res!678686) (not e!568369))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010291 (= res!678686 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1010292 () Bool)

(declare-fun res!678683 () Bool)

(assert (=> b!1010292 (=> (not res!678683) (not e!568367))))

(assert (=> b!1010292 (= res!678683 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010293 () Bool)

(declare-fun res!678689 () Bool)

(assert (=> b!1010293 (=> (not res!678689) (not e!568364))))

(declare-datatypes ((List!21314 0))(
  ( (Nil!21311) (Cons!21310 (h!22502 (_ BitVec 64)) (t!30315 List!21314)) )
))
(declare-fun arrayNoDuplicates!0 (array!63640 (_ BitVec 32) List!21314) Bool)

(assert (=> b!1010293 (= res!678689 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21311))))

(declare-fun b!1010294 () Bool)

(declare-fun res!678688 () Bool)

(assert (=> b!1010294 (=> (not res!678688) (not e!568369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010294 (= res!678688 (validKeyInArray!0 k0!2224))))

(declare-fun b!1010295 () Bool)

(declare-fun e!568368 () Bool)

(assert (=> b!1010295 (= e!568366 e!568368)))

(declare-fun res!678681 () Bool)

(assert (=> b!1010295 (=> (not res!678681) (not e!568368))))

(assert (=> b!1010295 (= res!678681 (= lt!446535 lt!446532))))

(assert (=> b!1010295 (= lt!446535 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30638 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010296 () Bool)

(assert (=> b!1010296 (= e!568367 false)))

(declare-fun lt!446534 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010296 (= lt!446534 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1010297 () Bool)

(declare-fun res!678682 () Bool)

(assert (=> b!1010297 (=> (not res!678682) (not e!568369))))

(assert (=> b!1010297 (= res!678682 (validKeyInArray!0 (select (arr!30638 a!3219) j!170)))))

(declare-fun b!1010298 () Bool)

(declare-fun res!678687 () Bool)

(assert (=> b!1010298 (=> (not res!678687) (not e!568364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63640 (_ BitVec 32)) Bool)

(assert (=> b!1010298 (= res!678687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010299 () Bool)

(assert (=> b!1010299 (= e!568368 e!568367)))

(declare-fun res!678680 () Bool)

(assert (=> b!1010299 (=> (not res!678680) (not e!568367))))

(assert (=> b!1010299 (= res!678680 (not (= lt!446529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446531 mask!3464) lt!446531 lt!446530 mask!3464))))))

(assert (=> b!1010299 (= lt!446531 (select (store (arr!30638 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1010299 (= lt!446530 (array!63641 (store (arr!30638 a!3219) i!1194 k0!2224) (size!31140 a!3219)))))

(declare-fun b!1010300 () Bool)

(assert (=> b!1010300 (= e!568369 e!568364)))

(declare-fun res!678690 () Bool)

(assert (=> b!1010300 (=> (not res!678690) (not e!568364))))

(declare-fun lt!446533 () SeekEntryResult!9570)

(assert (=> b!1010300 (= res!678690 (or (= lt!446533 (MissingVacant!9570 i!1194)) (= lt!446533 (MissingZero!9570 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63640 (_ BitVec 32)) SeekEntryResult!9570)

(assert (=> b!1010300 (= lt!446533 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!87122 res!678693) b!1010289))

(assert (= (and b!1010289 res!678692) b!1010297))

(assert (= (and b!1010297 res!678682) b!1010294))

(assert (= (and b!1010294 res!678688) b!1010291))

(assert (= (and b!1010291 res!678686) b!1010300))

(assert (= (and b!1010300 res!678690) b!1010298))

(assert (= (and b!1010298 res!678687) b!1010293))

(assert (= (and b!1010293 res!678689) b!1010288))

(assert (= (and b!1010288 res!678684) b!1010290))

(assert (= (and b!1010290 res!678685) b!1010295))

(assert (= (and b!1010295 res!678681) b!1010299))

(assert (= (and b!1010299 res!678680) b!1010287))

(assert (= (and b!1010287 res!678691) b!1010292))

(assert (= (and b!1010292 res!678683) b!1010296))

(declare-fun m!934635 () Bool)

(assert (=> b!1010287 m!934635))

(declare-fun m!934637 () Bool)

(assert (=> b!1010295 m!934637))

(assert (=> b!1010295 m!934637))

(declare-fun m!934639 () Bool)

(assert (=> b!1010295 m!934639))

(declare-fun m!934641 () Bool)

(assert (=> start!87122 m!934641))

(declare-fun m!934643 () Bool)

(assert (=> start!87122 m!934643))

(declare-fun m!934645 () Bool)

(assert (=> b!1010300 m!934645))

(declare-fun m!934647 () Bool)

(assert (=> b!1010296 m!934647))

(declare-fun m!934649 () Bool)

(assert (=> b!1010293 m!934649))

(declare-fun m!934651 () Bool)

(assert (=> b!1010294 m!934651))

(declare-fun m!934653 () Bool)

(assert (=> b!1010291 m!934653))

(declare-fun m!934655 () Bool)

(assert (=> b!1010298 m!934655))

(assert (=> b!1010290 m!934637))

(assert (=> b!1010290 m!934637))

(declare-fun m!934657 () Bool)

(assert (=> b!1010290 m!934657))

(assert (=> b!1010290 m!934657))

(assert (=> b!1010290 m!934637))

(declare-fun m!934659 () Bool)

(assert (=> b!1010290 m!934659))

(declare-fun m!934661 () Bool)

(assert (=> b!1010299 m!934661))

(assert (=> b!1010299 m!934661))

(declare-fun m!934663 () Bool)

(assert (=> b!1010299 m!934663))

(declare-fun m!934665 () Bool)

(assert (=> b!1010299 m!934665))

(declare-fun m!934667 () Bool)

(assert (=> b!1010299 m!934667))

(assert (=> b!1010297 m!934637))

(assert (=> b!1010297 m!934637))

(declare-fun m!934669 () Bool)

(assert (=> b!1010297 m!934669))

(check-sat (not b!1010299) (not start!87122) (not b!1010295) (not b!1010290) (not b!1010300) (not b!1010293) (not b!1010297) (not b!1010291) (not b!1010296) (not b!1010294) (not b!1010298) (not b!1010287))
(check-sat)
