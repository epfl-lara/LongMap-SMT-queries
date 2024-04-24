; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87274 () Bool)

(assert start!87274)

(declare-fun b!1010761 () Bool)

(declare-fun e!568791 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010761 (= e!568791 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvslt (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000)))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!446654 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010761 (= lt!446654 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1010762 () Bool)

(declare-fun e!568790 () Bool)

(declare-fun e!568789 () Bool)

(assert (=> b!1010762 (= e!568790 e!568789)))

(declare-fun res!678539 () Bool)

(assert (=> b!1010762 (=> (not res!678539) (not e!568789))))

(declare-datatypes ((SeekEntryResult!9511 0))(
  ( (MissingZero!9511 (index!40415 (_ BitVec 32))) (Found!9511 (index!40416 (_ BitVec 32))) (Intermediate!9511 (undefined!10323 Bool) (index!40417 (_ BitVec 32)) (x!87976 (_ BitVec 32))) (Undefined!9511) (MissingVacant!9511 (index!40418 (_ BitVec 32))) )
))
(declare-fun lt!446649 () SeekEntryResult!9511)

(declare-fun lt!446650 () SeekEntryResult!9511)

(assert (=> b!1010762 (= res!678539 (= lt!446649 lt!446650))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1010762 (= lt!446650 (Intermediate!9511 false resIndex!38 resX!38))))

(declare-datatypes ((array!63660 0))(
  ( (array!63661 (arr!30643 (Array (_ BitVec 32) (_ BitVec 64))) (size!31146 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63660)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63660 (_ BitVec 32)) SeekEntryResult!9511)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010762 (= lt!446649 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30643 a!3219) j!170) mask!3464) (select (arr!30643 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010763 () Bool)

(declare-fun e!568794 () Bool)

(assert (=> b!1010763 (= e!568794 e!568791)))

(declare-fun res!678541 () Bool)

(assert (=> b!1010763 (=> (not res!678541) (not e!568791))))

(declare-fun lt!446653 () (_ BitVec 64))

(declare-fun lt!446651 () array!63660)

(assert (=> b!1010763 (= res!678541 (not (= lt!446649 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446653 mask!3464) lt!446653 lt!446651 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1010763 (= lt!446653 (select (store (arr!30643 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1010763 (= lt!446651 (array!63661 (store (arr!30643 a!3219) i!1194 k0!2224) (size!31146 a!3219)))))

(declare-fun b!1010764 () Bool)

(declare-fun res!678532 () Bool)

(assert (=> b!1010764 (=> (not res!678532) (not e!568790))))

(declare-datatypes ((List!21290 0))(
  ( (Nil!21287) (Cons!21286 (h!22484 (_ BitVec 64)) (t!30283 List!21290)) )
))
(declare-fun arrayNoDuplicates!0 (array!63660 (_ BitVec 32) List!21290) Bool)

(assert (=> b!1010764 (= res!678532 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21287))))

(declare-fun b!1010765 () Bool)

(declare-fun res!678538 () Bool)

(declare-fun e!568792 () Bool)

(assert (=> b!1010765 (=> (not res!678538) (not e!568792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010765 (= res!678538 (validKeyInArray!0 (select (arr!30643 a!3219) j!170)))))

(declare-fun b!1010766 () Bool)

(declare-fun res!678537 () Bool)

(assert (=> b!1010766 (=> (not res!678537) (not e!568792))))

(assert (=> b!1010766 (= res!678537 (and (= (size!31146 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31146 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31146 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1010767 () Bool)

(declare-fun res!678540 () Bool)

(assert (=> b!1010767 (=> (not res!678540) (not e!568792))))

(assert (=> b!1010767 (= res!678540 (validKeyInArray!0 k0!2224))))

(declare-fun b!1010768 () Bool)

(assert (=> b!1010768 (= e!568789 e!568794)))

(declare-fun res!678544 () Bool)

(assert (=> b!1010768 (=> (not res!678544) (not e!568794))))

(declare-fun lt!446652 () SeekEntryResult!9511)

(assert (=> b!1010768 (= res!678544 (= lt!446652 lt!446650))))

(assert (=> b!1010768 (= lt!446652 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30643 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010769 () Bool)

(declare-fun res!678543 () Bool)

(assert (=> b!1010769 (=> (not res!678543) (not e!568791))))

(assert (=> b!1010769 (= res!678543 (not (= lt!446652 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446653 lt!446651 mask!3464))))))

(declare-fun b!1010760 () Bool)

(assert (=> b!1010760 (= e!568792 e!568790)))

(declare-fun res!678535 () Bool)

(assert (=> b!1010760 (=> (not res!678535) (not e!568790))))

(declare-fun lt!446648 () SeekEntryResult!9511)

(assert (=> b!1010760 (= res!678535 (or (= lt!446648 (MissingVacant!9511 i!1194)) (= lt!446648 (MissingZero!9511 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63660 (_ BitVec 32)) SeekEntryResult!9511)

(assert (=> b!1010760 (= lt!446648 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!678534 () Bool)

(assert (=> start!87274 (=> (not res!678534) (not e!568792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87274 (= res!678534 (validMask!0 mask!3464))))

(assert (=> start!87274 e!568792))

(declare-fun array_inv!23779 (array!63660) Bool)

(assert (=> start!87274 (array_inv!23779 a!3219)))

(assert (=> start!87274 true))

(declare-fun b!1010770 () Bool)

(declare-fun res!678536 () Bool)

(assert (=> b!1010770 (=> (not res!678536) (not e!568790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63660 (_ BitVec 32)) Bool)

(assert (=> b!1010770 (= res!678536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010771 () Bool)

(declare-fun res!678533 () Bool)

(assert (=> b!1010771 (=> (not res!678533) (not e!568791))))

(assert (=> b!1010771 (= res!678533 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010772 () Bool)

(declare-fun res!678542 () Bool)

(assert (=> b!1010772 (=> (not res!678542) (not e!568790))))

(assert (=> b!1010772 (= res!678542 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31146 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31146 a!3219))))))

(declare-fun b!1010773 () Bool)

(declare-fun res!678545 () Bool)

(assert (=> b!1010773 (=> (not res!678545) (not e!568792))))

(declare-fun arrayContainsKey!0 (array!63660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010773 (= res!678545 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!87274 res!678534) b!1010766))

(assert (= (and b!1010766 res!678537) b!1010765))

(assert (= (and b!1010765 res!678538) b!1010767))

(assert (= (and b!1010767 res!678540) b!1010773))

(assert (= (and b!1010773 res!678545) b!1010760))

(assert (= (and b!1010760 res!678535) b!1010770))

(assert (= (and b!1010770 res!678536) b!1010764))

(assert (= (and b!1010764 res!678532) b!1010772))

(assert (= (and b!1010772 res!678542) b!1010762))

(assert (= (and b!1010762 res!678539) b!1010768))

(assert (= (and b!1010768 res!678544) b!1010763))

(assert (= (and b!1010763 res!678541) b!1010769))

(assert (= (and b!1010769 res!678543) b!1010771))

(assert (= (and b!1010771 res!678533) b!1010761))

(declare-fun m!935609 () Bool)

(assert (=> b!1010763 m!935609))

(assert (=> b!1010763 m!935609))

(declare-fun m!935611 () Bool)

(assert (=> b!1010763 m!935611))

(declare-fun m!935613 () Bool)

(assert (=> b!1010763 m!935613))

(declare-fun m!935615 () Bool)

(assert (=> b!1010763 m!935615))

(declare-fun m!935617 () Bool)

(assert (=> b!1010773 m!935617))

(declare-fun m!935619 () Bool)

(assert (=> start!87274 m!935619))

(declare-fun m!935621 () Bool)

(assert (=> start!87274 m!935621))

(declare-fun m!935623 () Bool)

(assert (=> b!1010761 m!935623))

(declare-fun m!935625 () Bool)

(assert (=> b!1010769 m!935625))

(declare-fun m!935627 () Bool)

(assert (=> b!1010765 m!935627))

(assert (=> b!1010765 m!935627))

(declare-fun m!935629 () Bool)

(assert (=> b!1010765 m!935629))

(declare-fun m!935631 () Bool)

(assert (=> b!1010767 m!935631))

(declare-fun m!935633 () Bool)

(assert (=> b!1010760 m!935633))

(assert (=> b!1010762 m!935627))

(assert (=> b!1010762 m!935627))

(declare-fun m!935635 () Bool)

(assert (=> b!1010762 m!935635))

(assert (=> b!1010762 m!935635))

(assert (=> b!1010762 m!935627))

(declare-fun m!935637 () Bool)

(assert (=> b!1010762 m!935637))

(declare-fun m!935639 () Bool)

(assert (=> b!1010764 m!935639))

(assert (=> b!1010768 m!935627))

(assert (=> b!1010768 m!935627))

(declare-fun m!935641 () Bool)

(assert (=> b!1010768 m!935641))

(declare-fun m!935643 () Bool)

(assert (=> b!1010770 m!935643))

(check-sat (not b!1010767) (not b!1010761) (not b!1010769) (not b!1010762) (not b!1010768) (not b!1010764) (not b!1010773) (not start!87274) (not b!1010763) (not b!1010760) (not b!1010770) (not b!1010765))
(check-sat)
