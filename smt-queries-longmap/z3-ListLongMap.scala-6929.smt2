; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87128 () Bool)

(assert start!87128)

(declare-fun b!1010418 () Bool)

(declare-fun e!568423 () Bool)

(declare-fun e!568429 () Bool)

(assert (=> b!1010418 (= e!568423 e!568429)))

(declare-fun res!678825 () Bool)

(assert (=> b!1010418 (=> (not res!678825) (not e!568429))))

(declare-datatypes ((array!63646 0))(
  ( (array!63647 (arr!30641 (Array (_ BitVec 32) (_ BitVec 64))) (size!31143 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63646)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!446596 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010418 (= res!678825 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!446596 #b00000000000000000000000000000000) (bvslt lt!446596 (size!31143 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010418 (= lt!446596 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1010419 () Bool)

(declare-fun e!568425 () Bool)

(declare-fun e!568426 () Bool)

(assert (=> b!1010419 (= e!568425 e!568426)))

(declare-fun res!678821 () Bool)

(assert (=> b!1010419 (=> (not res!678821) (not e!568426))))

(declare-datatypes ((SeekEntryResult!9573 0))(
  ( (MissingZero!9573 (index!40663 (_ BitVec 32))) (Found!9573 (index!40664 (_ BitVec 32))) (Intermediate!9573 (undefined!10385 Bool) (index!40665 (_ BitVec 32)) (x!88065 (_ BitVec 32))) (Undefined!9573) (MissingVacant!9573 (index!40666 (_ BitVec 32))) )
))
(declare-fun lt!446594 () SeekEntryResult!9573)

(declare-fun lt!446592 () SeekEntryResult!9573)

(assert (=> b!1010419 (= res!678821 (= lt!446594 lt!446592))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63646 (_ BitVec 32)) SeekEntryResult!9573)

(assert (=> b!1010419 (= lt!446594 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30641 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010420 () Bool)

(declare-fun res!678820 () Bool)

(declare-fun e!568428 () Bool)

(assert (=> b!1010420 (=> (not res!678820) (not e!568428))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010420 (= res!678820 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1010421 () Bool)

(declare-fun res!678817 () Bool)

(assert (=> b!1010421 (=> (not res!678817) (not e!568428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010421 (= res!678817 (validKeyInArray!0 k0!2224))))

(declare-fun b!1010422 () Bool)

(declare-fun res!678812 () Bool)

(declare-fun e!568427 () Bool)

(assert (=> b!1010422 (=> (not res!678812) (not e!568427))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1010422 (= res!678812 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31143 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31143 a!3219))))))

(declare-fun b!1010423 () Bool)

(declare-fun res!678822 () Bool)

(assert (=> b!1010423 (=> (not res!678822) (not e!568427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63646 (_ BitVec 32)) Bool)

(assert (=> b!1010423 (= res!678822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010424 () Bool)

(declare-fun res!678814 () Bool)

(assert (=> b!1010424 (=> (not res!678814) (not e!568428))))

(assert (=> b!1010424 (= res!678814 (validKeyInArray!0 (select (arr!30641 a!3219) j!170)))))

(declare-fun b!1010425 () Bool)

(declare-fun res!678816 () Bool)

(assert (=> b!1010425 (=> (not res!678816) (not e!568423))))

(declare-fun lt!446593 () (_ BitVec 64))

(declare-fun lt!446597 () array!63646)

(assert (=> b!1010425 (= res!678816 (not (= lt!446594 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446593 lt!446597 mask!3464))))))

(declare-fun b!1010426 () Bool)

(declare-fun res!678813 () Bool)

(assert (=> b!1010426 (=> (not res!678813) (not e!568428))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1010426 (= res!678813 (and (= (size!31143 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31143 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31143 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1010427 () Bool)

(assert (=> b!1010427 (= e!568426 e!568423)))

(declare-fun res!678824 () Bool)

(assert (=> b!1010427 (=> (not res!678824) (not e!568423))))

(declare-fun lt!446595 () SeekEntryResult!9573)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010427 (= res!678824 (not (= lt!446595 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446593 mask!3464) lt!446593 lt!446597 mask!3464))))))

(assert (=> b!1010427 (= lt!446593 (select (store (arr!30641 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1010427 (= lt!446597 (array!63647 (store (arr!30641 a!3219) i!1194 k0!2224) (size!31143 a!3219)))))

(declare-fun b!1010428 () Bool)

(declare-fun res!678819 () Bool)

(assert (=> b!1010428 (=> (not res!678819) (not e!568423))))

(assert (=> b!1010428 (= res!678819 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010429 () Bool)

(assert (=> b!1010429 (= e!568428 e!568427)))

(declare-fun res!678823 () Bool)

(assert (=> b!1010429 (=> (not res!678823) (not e!568427))))

(declare-fun lt!446598 () SeekEntryResult!9573)

(assert (=> b!1010429 (= res!678823 (or (= lt!446598 (MissingVacant!9573 i!1194)) (= lt!446598 (MissingZero!9573 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63646 (_ BitVec 32)) SeekEntryResult!9573)

(assert (=> b!1010429 (= lt!446598 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1010430 () Bool)

(assert (=> b!1010430 (= e!568427 e!568425)))

(declare-fun res!678815 () Bool)

(assert (=> b!1010430 (=> (not res!678815) (not e!568425))))

(assert (=> b!1010430 (= res!678815 (= lt!446595 lt!446592))))

(assert (=> b!1010430 (= lt!446592 (Intermediate!9573 false resIndex!38 resX!38))))

(assert (=> b!1010430 (= lt!446595 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30641 a!3219) j!170) mask!3464) (select (arr!30641 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!678818 () Bool)

(assert (=> start!87128 (=> (not res!678818) (not e!568428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87128 (= res!678818 (validMask!0 mask!3464))))

(assert (=> start!87128 e!568428))

(declare-fun array_inv!23765 (array!63646) Bool)

(assert (=> start!87128 (array_inv!23765 a!3219)))

(assert (=> start!87128 true))

(declare-fun b!1010431 () Bool)

(declare-fun res!678811 () Bool)

(assert (=> b!1010431 (=> (not res!678811) (not e!568427))))

(declare-datatypes ((List!21317 0))(
  ( (Nil!21314) (Cons!21313 (h!22505 (_ BitVec 64)) (t!30318 List!21317)) )
))
(declare-fun arrayNoDuplicates!0 (array!63646 (_ BitVec 32) List!21317) Bool)

(assert (=> b!1010431 (= res!678811 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21314))))

(declare-fun b!1010432 () Bool)

(assert (=> b!1010432 (= e!568429 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446596 (select (arr!30641 a!3219) j!170) a!3219 mask!3464) lt!446592)))))

(assert (= (and start!87128 res!678818) b!1010426))

(assert (= (and b!1010426 res!678813) b!1010424))

(assert (= (and b!1010424 res!678814) b!1010421))

(assert (= (and b!1010421 res!678817) b!1010420))

(assert (= (and b!1010420 res!678820) b!1010429))

(assert (= (and b!1010429 res!678823) b!1010423))

(assert (= (and b!1010423 res!678822) b!1010431))

(assert (= (and b!1010431 res!678811) b!1010422))

(assert (= (and b!1010422 res!678812) b!1010430))

(assert (= (and b!1010430 res!678815) b!1010419))

(assert (= (and b!1010419 res!678821) b!1010427))

(assert (= (and b!1010427 res!678824) b!1010425))

(assert (= (and b!1010425 res!678816) b!1010428))

(assert (= (and b!1010428 res!678819) b!1010418))

(assert (= (and b!1010418 res!678825) b!1010432))

(declare-fun m!934745 () Bool)

(assert (=> start!87128 m!934745))

(declare-fun m!934747 () Bool)

(assert (=> start!87128 m!934747))

(declare-fun m!934749 () Bool)

(assert (=> b!1010425 m!934749))

(declare-fun m!934751 () Bool)

(assert (=> b!1010430 m!934751))

(assert (=> b!1010430 m!934751))

(declare-fun m!934753 () Bool)

(assert (=> b!1010430 m!934753))

(assert (=> b!1010430 m!934753))

(assert (=> b!1010430 m!934751))

(declare-fun m!934755 () Bool)

(assert (=> b!1010430 m!934755))

(assert (=> b!1010419 m!934751))

(assert (=> b!1010419 m!934751))

(declare-fun m!934757 () Bool)

(assert (=> b!1010419 m!934757))

(declare-fun m!934759 () Bool)

(assert (=> b!1010429 m!934759))

(declare-fun m!934761 () Bool)

(assert (=> b!1010418 m!934761))

(declare-fun m!934763 () Bool)

(assert (=> b!1010421 m!934763))

(declare-fun m!934765 () Bool)

(assert (=> b!1010431 m!934765))

(declare-fun m!934767 () Bool)

(assert (=> b!1010427 m!934767))

(assert (=> b!1010427 m!934767))

(declare-fun m!934769 () Bool)

(assert (=> b!1010427 m!934769))

(declare-fun m!934771 () Bool)

(assert (=> b!1010427 m!934771))

(declare-fun m!934773 () Bool)

(assert (=> b!1010427 m!934773))

(declare-fun m!934775 () Bool)

(assert (=> b!1010420 m!934775))

(declare-fun m!934777 () Bool)

(assert (=> b!1010423 m!934777))

(assert (=> b!1010424 m!934751))

(assert (=> b!1010424 m!934751))

(declare-fun m!934779 () Bool)

(assert (=> b!1010424 m!934779))

(assert (=> b!1010432 m!934751))

(assert (=> b!1010432 m!934751))

(declare-fun m!934781 () Bool)

(assert (=> b!1010432 m!934781))

(check-sat (not b!1010418) (not b!1010431) (not start!87128) (not b!1010429) (not b!1010425) (not b!1010424) (not b!1010423) (not b!1010430) (not b!1010420) (not b!1010432) (not b!1010427) (not b!1010419) (not b!1010421))
(check-sat)
(get-model)

(declare-fun b!1010496 () Bool)

(declare-fun e!568464 () SeekEntryResult!9573)

(assert (=> b!1010496 (= e!568464 (Intermediate!9573 true index!1507 x!1245))))

(declare-fun b!1010497 () Bool)

(declare-fun e!568465 () Bool)

(declare-fun e!568462 () Bool)

(assert (=> b!1010497 (= e!568465 e!568462)))

(declare-fun res!678877 () Bool)

(declare-fun lt!446625 () SeekEntryResult!9573)

(get-info :version)

(assert (=> b!1010497 (= res!678877 (and ((_ is Intermediate!9573) lt!446625) (not (undefined!10385 lt!446625)) (bvslt (x!88065 lt!446625) #b01111111111111111111111111111110) (bvsge (x!88065 lt!446625) #b00000000000000000000000000000000) (bvsge (x!88065 lt!446625) x!1245)))))

(assert (=> b!1010497 (=> (not res!678877) (not e!568462))))

(declare-fun b!1010498 () Bool)

(assert (=> b!1010498 (and (bvsge (index!40665 lt!446625) #b00000000000000000000000000000000) (bvslt (index!40665 lt!446625) (size!31143 a!3219)))))

(declare-fun e!568463 () Bool)

(assert (=> b!1010498 (= e!568463 (= (select (arr!30641 a!3219) (index!40665 lt!446625)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010500 () Bool)

(assert (=> b!1010500 (and (bvsge (index!40665 lt!446625) #b00000000000000000000000000000000) (bvslt (index!40665 lt!446625) (size!31143 a!3219)))))

(declare-fun res!678879 () Bool)

(assert (=> b!1010500 (= res!678879 (= (select (arr!30641 a!3219) (index!40665 lt!446625)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010500 (=> res!678879 e!568463)))

(declare-fun e!568461 () SeekEntryResult!9573)

(declare-fun b!1010501 () Bool)

(assert (=> b!1010501 (= e!568461 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30641 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010502 () Bool)

(assert (=> b!1010502 (= e!568465 (bvsge (x!88065 lt!446625) #b01111111111111111111111111111110))))

(declare-fun b!1010503 () Bool)

(assert (=> b!1010503 (and (bvsge (index!40665 lt!446625) #b00000000000000000000000000000000) (bvslt (index!40665 lt!446625) (size!31143 a!3219)))))

(declare-fun res!678878 () Bool)

(assert (=> b!1010503 (= res!678878 (= (select (arr!30641 a!3219) (index!40665 lt!446625)) (select (arr!30641 a!3219) j!170)))))

(assert (=> b!1010503 (=> res!678878 e!568463)))

(assert (=> b!1010503 (= e!568462 e!568463)))

(declare-fun b!1010504 () Bool)

(assert (=> b!1010504 (= e!568464 e!568461)))

(declare-fun c!101968 () Bool)

(declare-fun lt!446624 () (_ BitVec 64))

(assert (=> b!1010504 (= c!101968 (or (= lt!446624 (select (arr!30641 a!3219) j!170)) (= (bvadd lt!446624 lt!446624) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010499 () Bool)

(assert (=> b!1010499 (= e!568461 (Intermediate!9573 false index!1507 x!1245))))

(declare-fun d!119985 () Bool)

(assert (=> d!119985 e!568465))

(declare-fun c!101969 () Bool)

(assert (=> d!119985 (= c!101969 (and ((_ is Intermediate!9573) lt!446625) (undefined!10385 lt!446625)))))

(assert (=> d!119985 (= lt!446625 e!568464)))

(declare-fun c!101970 () Bool)

(assert (=> d!119985 (= c!101970 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119985 (= lt!446624 (select (arr!30641 a!3219) index!1507))))

(assert (=> d!119985 (validMask!0 mask!3464)))

(assert (=> d!119985 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30641 a!3219) j!170) a!3219 mask!3464) lt!446625)))

(assert (= (and d!119985 c!101970) b!1010496))

(assert (= (and d!119985 (not c!101970)) b!1010504))

(assert (= (and b!1010504 c!101968) b!1010499))

(assert (= (and b!1010504 (not c!101968)) b!1010501))

(assert (= (and d!119985 c!101969) b!1010502))

(assert (= (and d!119985 (not c!101969)) b!1010497))

(assert (= (and b!1010497 res!678877) b!1010503))

(assert (= (and b!1010503 (not res!678878)) b!1010500))

(assert (= (and b!1010500 (not res!678879)) b!1010498))

(declare-fun m!934821 () Bool)

(assert (=> b!1010503 m!934821))

(assert (=> b!1010500 m!934821))

(declare-fun m!934823 () Bool)

(assert (=> d!119985 m!934823))

(assert (=> d!119985 m!934745))

(assert (=> b!1010498 m!934821))

(assert (=> b!1010501 m!934761))

(assert (=> b!1010501 m!934761))

(assert (=> b!1010501 m!934751))

(declare-fun m!934825 () Bool)

(assert (=> b!1010501 m!934825))

(assert (=> b!1010419 d!119985))

(declare-fun b!1010505 () Bool)

(declare-fun e!568469 () SeekEntryResult!9573)

(assert (=> b!1010505 (= e!568469 (Intermediate!9573 true (toIndex!0 (select (arr!30641 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010506 () Bool)

(declare-fun e!568470 () Bool)

(declare-fun e!568467 () Bool)

(assert (=> b!1010506 (= e!568470 e!568467)))

(declare-fun res!678880 () Bool)

(declare-fun lt!446627 () SeekEntryResult!9573)

(assert (=> b!1010506 (= res!678880 (and ((_ is Intermediate!9573) lt!446627) (not (undefined!10385 lt!446627)) (bvslt (x!88065 lt!446627) #b01111111111111111111111111111110) (bvsge (x!88065 lt!446627) #b00000000000000000000000000000000) (bvsge (x!88065 lt!446627) #b00000000000000000000000000000000)))))

(assert (=> b!1010506 (=> (not res!678880) (not e!568467))))

(declare-fun b!1010507 () Bool)

(assert (=> b!1010507 (and (bvsge (index!40665 lt!446627) #b00000000000000000000000000000000) (bvslt (index!40665 lt!446627) (size!31143 a!3219)))))

(declare-fun e!568468 () Bool)

(assert (=> b!1010507 (= e!568468 (= (select (arr!30641 a!3219) (index!40665 lt!446627)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010509 () Bool)

(assert (=> b!1010509 (and (bvsge (index!40665 lt!446627) #b00000000000000000000000000000000) (bvslt (index!40665 lt!446627) (size!31143 a!3219)))))

(declare-fun res!678882 () Bool)

(assert (=> b!1010509 (= res!678882 (= (select (arr!30641 a!3219) (index!40665 lt!446627)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010509 (=> res!678882 e!568468)))

(declare-fun b!1010510 () Bool)

(declare-fun e!568466 () SeekEntryResult!9573)

(assert (=> b!1010510 (= e!568466 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30641 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30641 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010511 () Bool)

(assert (=> b!1010511 (= e!568470 (bvsge (x!88065 lt!446627) #b01111111111111111111111111111110))))

(declare-fun b!1010512 () Bool)

(assert (=> b!1010512 (and (bvsge (index!40665 lt!446627) #b00000000000000000000000000000000) (bvslt (index!40665 lt!446627) (size!31143 a!3219)))))

(declare-fun res!678881 () Bool)

(assert (=> b!1010512 (= res!678881 (= (select (arr!30641 a!3219) (index!40665 lt!446627)) (select (arr!30641 a!3219) j!170)))))

(assert (=> b!1010512 (=> res!678881 e!568468)))

(assert (=> b!1010512 (= e!568467 e!568468)))

(declare-fun b!1010513 () Bool)

(assert (=> b!1010513 (= e!568469 e!568466)))

(declare-fun lt!446626 () (_ BitVec 64))

(declare-fun c!101971 () Bool)

(assert (=> b!1010513 (= c!101971 (or (= lt!446626 (select (arr!30641 a!3219) j!170)) (= (bvadd lt!446626 lt!446626) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010508 () Bool)

(assert (=> b!1010508 (= e!568466 (Intermediate!9573 false (toIndex!0 (select (arr!30641 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun d!119987 () Bool)

(assert (=> d!119987 e!568470))

(declare-fun c!101972 () Bool)

(assert (=> d!119987 (= c!101972 (and ((_ is Intermediate!9573) lt!446627) (undefined!10385 lt!446627)))))

(assert (=> d!119987 (= lt!446627 e!568469)))

(declare-fun c!101973 () Bool)

(assert (=> d!119987 (= c!101973 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119987 (= lt!446626 (select (arr!30641 a!3219) (toIndex!0 (select (arr!30641 a!3219) j!170) mask!3464)))))

(assert (=> d!119987 (validMask!0 mask!3464)))

(assert (=> d!119987 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30641 a!3219) j!170) mask!3464) (select (arr!30641 a!3219) j!170) a!3219 mask!3464) lt!446627)))

(assert (= (and d!119987 c!101973) b!1010505))

(assert (= (and d!119987 (not c!101973)) b!1010513))

(assert (= (and b!1010513 c!101971) b!1010508))

(assert (= (and b!1010513 (not c!101971)) b!1010510))

(assert (= (and d!119987 c!101972) b!1010511))

(assert (= (and d!119987 (not c!101972)) b!1010506))

(assert (= (and b!1010506 res!678880) b!1010512))

(assert (= (and b!1010512 (not res!678881)) b!1010509))

(assert (= (and b!1010509 (not res!678882)) b!1010507))

(declare-fun m!934827 () Bool)

(assert (=> b!1010512 m!934827))

(assert (=> b!1010509 m!934827))

(assert (=> d!119987 m!934753))

(declare-fun m!934829 () Bool)

(assert (=> d!119987 m!934829))

(assert (=> d!119987 m!934745))

(assert (=> b!1010507 m!934827))

(assert (=> b!1010510 m!934753))

(declare-fun m!934831 () Bool)

(assert (=> b!1010510 m!934831))

(assert (=> b!1010510 m!934831))

(assert (=> b!1010510 m!934751))

(declare-fun m!934833 () Bool)

(assert (=> b!1010510 m!934833))

(assert (=> b!1010430 d!119987))

(declare-fun d!119989 () Bool)

(declare-fun lt!446633 () (_ BitVec 32))

(declare-fun lt!446632 () (_ BitVec 32))

(assert (=> d!119989 (= lt!446633 (bvmul (bvxor lt!446632 (bvlshr lt!446632 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119989 (= lt!446632 ((_ extract 31 0) (bvand (bvxor (select (arr!30641 a!3219) j!170) (bvlshr (select (arr!30641 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119989 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678883 (let ((h!22507 ((_ extract 31 0) (bvand (bvxor (select (arr!30641 a!3219) j!170) (bvlshr (select (arr!30641 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88068 (bvmul (bvxor h!22507 (bvlshr h!22507 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88068 (bvlshr x!88068 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678883 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678883 #b00000000000000000000000000000000))))))

(assert (=> d!119989 (= (toIndex!0 (select (arr!30641 a!3219) j!170) mask!3464) (bvand (bvxor lt!446633 (bvlshr lt!446633 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1010430 d!119989))

(declare-fun d!119991 () Bool)

(assert (=> d!119991 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!87128 d!119991))

(declare-fun d!119993 () Bool)

(assert (=> d!119993 (= (array_inv!23765 a!3219) (bvsge (size!31143 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!87128 d!119993))

(declare-fun b!1010534 () Bool)

(declare-fun c!101985 () Bool)

(declare-fun lt!446646 () (_ BitVec 64))

(assert (=> b!1010534 (= c!101985 (= lt!446646 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!568482 () SeekEntryResult!9573)

(declare-fun e!568483 () SeekEntryResult!9573)

(assert (=> b!1010534 (= e!568482 e!568483)))

(declare-fun d!119995 () Bool)

(declare-fun lt!446644 () SeekEntryResult!9573)

(assert (=> d!119995 (and (or ((_ is Undefined!9573) lt!446644) (not ((_ is Found!9573) lt!446644)) (and (bvsge (index!40664 lt!446644) #b00000000000000000000000000000000) (bvslt (index!40664 lt!446644) (size!31143 a!3219)))) (or ((_ is Undefined!9573) lt!446644) ((_ is Found!9573) lt!446644) (not ((_ is MissingZero!9573) lt!446644)) (and (bvsge (index!40663 lt!446644) #b00000000000000000000000000000000) (bvslt (index!40663 lt!446644) (size!31143 a!3219)))) (or ((_ is Undefined!9573) lt!446644) ((_ is Found!9573) lt!446644) ((_ is MissingZero!9573) lt!446644) (not ((_ is MissingVacant!9573) lt!446644)) (and (bvsge (index!40666 lt!446644) #b00000000000000000000000000000000) (bvslt (index!40666 lt!446644) (size!31143 a!3219)))) (or ((_ is Undefined!9573) lt!446644) (ite ((_ is Found!9573) lt!446644) (= (select (arr!30641 a!3219) (index!40664 lt!446644)) k0!2224) (ite ((_ is MissingZero!9573) lt!446644) (= (select (arr!30641 a!3219) (index!40663 lt!446644)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9573) lt!446644) (= (select (arr!30641 a!3219) (index!40666 lt!446644)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!568481 () SeekEntryResult!9573)

(assert (=> d!119995 (= lt!446644 e!568481)))

(declare-fun c!101984 () Bool)

(declare-fun lt!446645 () SeekEntryResult!9573)

(assert (=> d!119995 (= c!101984 (and ((_ is Intermediate!9573) lt!446645) (undefined!10385 lt!446645)))))

(assert (=> d!119995 (= lt!446645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119995 (validMask!0 mask!3464)))

(assert (=> d!119995 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!446644)))

(declare-fun b!1010535 () Bool)

(assert (=> b!1010535 (= e!568482 (Found!9573 (index!40665 lt!446645)))))

(declare-fun b!1010536 () Bool)

(assert (=> b!1010536 (= e!568481 Undefined!9573)))

(declare-fun b!1010537 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63646 (_ BitVec 32)) SeekEntryResult!9573)

(assert (=> b!1010537 (= e!568483 (seekKeyOrZeroReturnVacant!0 (x!88065 lt!446645) (index!40665 lt!446645) (index!40665 lt!446645) k0!2224 a!3219 mask!3464))))

(declare-fun b!1010538 () Bool)

(assert (=> b!1010538 (= e!568481 e!568482)))

(assert (=> b!1010538 (= lt!446646 (select (arr!30641 a!3219) (index!40665 lt!446645)))))

(declare-fun c!101986 () Bool)

(assert (=> b!1010538 (= c!101986 (= lt!446646 k0!2224))))

(declare-fun b!1010539 () Bool)

(assert (=> b!1010539 (= e!568483 (MissingZero!9573 (index!40665 lt!446645)))))

(assert (= (and d!119995 c!101984) b!1010536))

(assert (= (and d!119995 (not c!101984)) b!1010538))

(assert (= (and b!1010538 c!101986) b!1010535))

(assert (= (and b!1010538 (not c!101986)) b!1010534))

(assert (= (and b!1010534 c!101985) b!1010539))

(assert (= (and b!1010534 (not c!101985)) b!1010537))

(declare-fun m!934835 () Bool)

(assert (=> d!119995 m!934835))

(declare-fun m!934837 () Bool)

(assert (=> d!119995 m!934837))

(declare-fun m!934839 () Bool)

(assert (=> d!119995 m!934839))

(declare-fun m!934841 () Bool)

(assert (=> d!119995 m!934841))

(assert (=> d!119995 m!934745))

(declare-fun m!934843 () Bool)

(assert (=> d!119995 m!934843))

(assert (=> d!119995 m!934837))

(declare-fun m!934845 () Bool)

(assert (=> b!1010537 m!934845))

(declare-fun m!934847 () Bool)

(assert (=> b!1010538 m!934847))

(assert (=> b!1010429 d!119995))

(declare-fun d!120001 () Bool)

(declare-fun lt!446653 () (_ BitVec 32))

(assert (=> d!120001 (and (bvsge lt!446653 #b00000000000000000000000000000000) (bvslt lt!446653 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!120001 (= lt!446653 (choose!52 index!1507 x!1245 mask!3464))))

(assert (=> d!120001 (validMask!0 mask!3464)))

(assert (=> d!120001 (= (nextIndex!0 index!1507 x!1245 mask!3464) lt!446653)))

(declare-fun bs!28725 () Bool)

(assert (= bs!28725 d!120001))

(declare-fun m!934849 () Bool)

(assert (=> bs!28725 m!934849))

(assert (=> bs!28725 m!934745))

(assert (=> b!1010418 d!120001))

(declare-fun b!1010560 () Bool)

(declare-fun e!568497 () SeekEntryResult!9573)

(assert (=> b!1010560 (= e!568497 (Intermediate!9573 true lt!446596 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1010561 () Bool)

(declare-fun e!568498 () Bool)

(declare-fun e!568495 () Bool)

(assert (=> b!1010561 (= e!568498 e!568495)))

(declare-fun res!678890 () Bool)

(declare-fun lt!446655 () SeekEntryResult!9573)

(assert (=> b!1010561 (= res!678890 (and ((_ is Intermediate!9573) lt!446655) (not (undefined!10385 lt!446655)) (bvslt (x!88065 lt!446655) #b01111111111111111111111111111110) (bvsge (x!88065 lt!446655) #b00000000000000000000000000000000) (bvsge (x!88065 lt!446655) (bvadd #b00000000000000000000000000000001 x!1245))))))

(assert (=> b!1010561 (=> (not res!678890) (not e!568495))))

(declare-fun b!1010562 () Bool)

(assert (=> b!1010562 (and (bvsge (index!40665 lt!446655) #b00000000000000000000000000000000) (bvslt (index!40665 lt!446655) (size!31143 a!3219)))))

(declare-fun e!568496 () Bool)

(assert (=> b!1010562 (= e!568496 (= (select (arr!30641 a!3219) (index!40665 lt!446655)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010564 () Bool)

(assert (=> b!1010564 (and (bvsge (index!40665 lt!446655) #b00000000000000000000000000000000) (bvslt (index!40665 lt!446655) (size!31143 a!3219)))))

(declare-fun res!678892 () Bool)

(assert (=> b!1010564 (= res!678892 (= (select (arr!30641 a!3219) (index!40665 lt!446655)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010564 (=> res!678892 e!568496)))

(declare-fun e!568494 () SeekEntryResult!9573)

(declare-fun b!1010565 () Bool)

(assert (=> b!1010565 (= e!568494 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245 #b00000000000000000000000000000001) (nextIndex!0 lt!446596 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464) (select (arr!30641 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010566 () Bool)

(assert (=> b!1010566 (= e!568498 (bvsge (x!88065 lt!446655) #b01111111111111111111111111111110))))

(declare-fun b!1010567 () Bool)

(assert (=> b!1010567 (and (bvsge (index!40665 lt!446655) #b00000000000000000000000000000000) (bvslt (index!40665 lt!446655) (size!31143 a!3219)))))

(declare-fun res!678891 () Bool)

(assert (=> b!1010567 (= res!678891 (= (select (arr!30641 a!3219) (index!40665 lt!446655)) (select (arr!30641 a!3219) j!170)))))

(assert (=> b!1010567 (=> res!678891 e!568496)))

(assert (=> b!1010567 (= e!568495 e!568496)))

(declare-fun b!1010568 () Bool)

(assert (=> b!1010568 (= e!568497 e!568494)))

(declare-fun lt!446654 () (_ BitVec 64))

(declare-fun c!101993 () Bool)

(assert (=> b!1010568 (= c!101993 (or (= lt!446654 (select (arr!30641 a!3219) j!170)) (= (bvadd lt!446654 lt!446654) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010563 () Bool)

(assert (=> b!1010563 (= e!568494 (Intermediate!9573 false lt!446596 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun d!120003 () Bool)

(assert (=> d!120003 e!568498))

(declare-fun c!101994 () Bool)

(assert (=> d!120003 (= c!101994 (and ((_ is Intermediate!9573) lt!446655) (undefined!10385 lt!446655)))))

(assert (=> d!120003 (= lt!446655 e!568497)))

(declare-fun c!101995 () Bool)

(assert (=> d!120003 (= c!101995 (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b01111111111111111111111111111110))))

(assert (=> d!120003 (= lt!446654 (select (arr!30641 a!3219) lt!446596))))

(assert (=> d!120003 (validMask!0 mask!3464)))

(assert (=> d!120003 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446596 (select (arr!30641 a!3219) j!170) a!3219 mask!3464) lt!446655)))

(assert (= (and d!120003 c!101995) b!1010560))

(assert (= (and d!120003 (not c!101995)) b!1010568))

(assert (= (and b!1010568 c!101993) b!1010563))

(assert (= (and b!1010568 (not c!101993)) b!1010565))

(assert (= (and d!120003 c!101994) b!1010566))

(assert (= (and d!120003 (not c!101994)) b!1010561))

(assert (= (and b!1010561 res!678890) b!1010567))

(assert (= (and b!1010567 (not res!678891)) b!1010564))

(assert (= (and b!1010564 (not res!678892)) b!1010562))

(declare-fun m!934851 () Bool)

(assert (=> b!1010567 m!934851))

(assert (=> b!1010564 m!934851))

(declare-fun m!934853 () Bool)

(assert (=> d!120003 m!934853))

(assert (=> d!120003 m!934745))

(assert (=> b!1010562 m!934851))

(declare-fun m!934855 () Bool)

(assert (=> b!1010565 m!934855))

(assert (=> b!1010565 m!934855))

(assert (=> b!1010565 m!934751))

(declare-fun m!934857 () Bool)

(assert (=> b!1010565 m!934857))

(assert (=> b!1010432 d!120003))

(declare-fun b!1010606 () Bool)

(declare-fun e!568523 () Bool)

(declare-fun contains!5894 (List!21317 (_ BitVec 64)) Bool)

(assert (=> b!1010606 (= e!568523 (contains!5894 Nil!21314 (select (arr!30641 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1010607 () Bool)

(declare-fun e!568525 () Bool)

(declare-fun e!568524 () Bool)

(assert (=> b!1010607 (= e!568525 e!568524)))

(declare-fun c!102006 () Bool)

(assert (=> b!1010607 (= c!102006 (validKeyInArray!0 (select (arr!30641 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1010608 () Bool)

(declare-fun e!568526 () Bool)

(assert (=> b!1010608 (= e!568526 e!568525)))

(declare-fun res!678914 () Bool)

(assert (=> b!1010608 (=> (not res!678914) (not e!568525))))

(assert (=> b!1010608 (= res!678914 (not e!568523))))

(declare-fun res!678913 () Bool)

(assert (=> b!1010608 (=> (not res!678913) (not e!568523))))

(assert (=> b!1010608 (= res!678913 (validKeyInArray!0 (select (arr!30641 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!120005 () Bool)

(declare-fun res!678912 () Bool)

(assert (=> d!120005 (=> res!678912 e!568526)))

(assert (=> d!120005 (= res!678912 (bvsge #b00000000000000000000000000000000 (size!31143 a!3219)))))

(assert (=> d!120005 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21314) e!568526)))

(declare-fun b!1010605 () Bool)

(declare-fun call!42408 () Bool)

(assert (=> b!1010605 (= e!568524 call!42408)))

(declare-fun b!1010609 () Bool)

(assert (=> b!1010609 (= e!568524 call!42408)))

(declare-fun bm!42405 () Bool)

(assert (=> bm!42405 (= call!42408 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!102006 (Cons!21313 (select (arr!30641 a!3219) #b00000000000000000000000000000000) Nil!21314) Nil!21314)))))

(assert (= (and d!120005 (not res!678912)) b!1010608))

(assert (= (and b!1010608 res!678913) b!1010606))

(assert (= (and b!1010608 res!678914) b!1010607))

(assert (= (and b!1010607 c!102006) b!1010609))

(assert (= (and b!1010607 (not c!102006)) b!1010605))

(assert (= (or b!1010609 b!1010605) bm!42405))

(declare-fun m!934875 () Bool)

(assert (=> b!1010606 m!934875))

(assert (=> b!1010606 m!934875))

(declare-fun m!934877 () Bool)

(assert (=> b!1010606 m!934877))

(assert (=> b!1010607 m!934875))

(assert (=> b!1010607 m!934875))

(declare-fun m!934879 () Bool)

(assert (=> b!1010607 m!934879))

(assert (=> b!1010608 m!934875))

(assert (=> b!1010608 m!934875))

(assert (=> b!1010608 m!934879))

(assert (=> bm!42405 m!934875))

(declare-fun m!934881 () Bool)

(assert (=> bm!42405 m!934881))

(assert (=> b!1010431 d!120005))

(declare-fun d!120011 () Bool)

(declare-fun res!678919 () Bool)

(declare-fun e!568531 () Bool)

(assert (=> d!120011 (=> res!678919 e!568531)))

(assert (=> d!120011 (= res!678919 (= (select (arr!30641 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!120011 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!568531)))

(declare-fun b!1010614 () Bool)

(declare-fun e!568532 () Bool)

(assert (=> b!1010614 (= e!568531 e!568532)))

(declare-fun res!678920 () Bool)

(assert (=> b!1010614 (=> (not res!678920) (not e!568532))))

(assert (=> b!1010614 (= res!678920 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31143 a!3219)))))

(declare-fun b!1010615 () Bool)

(assert (=> b!1010615 (= e!568532 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!120011 (not res!678919)) b!1010614))

(assert (= (and b!1010614 res!678920) b!1010615))

(assert (=> d!120011 m!934875))

(declare-fun m!934883 () Bool)

(assert (=> b!1010615 m!934883))

(assert (=> b!1010420 d!120011))

(declare-fun d!120015 () Bool)

(assert (=> d!120015 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1010421 d!120015))

(declare-fun d!120021 () Bool)

(assert (=> d!120021 (= (validKeyInArray!0 (select (arr!30641 a!3219) j!170)) (and (not (= (select (arr!30641 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30641 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1010424 d!120021))

(declare-fun b!1010616 () Bool)

(declare-fun e!568536 () SeekEntryResult!9573)

(assert (=> b!1010616 (= e!568536 (Intermediate!9573 true index!1507 x!1245))))

(declare-fun b!1010617 () Bool)

(declare-fun e!568537 () Bool)

(declare-fun e!568534 () Bool)

(assert (=> b!1010617 (= e!568537 e!568534)))

(declare-fun res!678921 () Bool)

(declare-fun lt!446667 () SeekEntryResult!9573)

(assert (=> b!1010617 (= res!678921 (and ((_ is Intermediate!9573) lt!446667) (not (undefined!10385 lt!446667)) (bvslt (x!88065 lt!446667) #b01111111111111111111111111111110) (bvsge (x!88065 lt!446667) #b00000000000000000000000000000000) (bvsge (x!88065 lt!446667) x!1245)))))

(assert (=> b!1010617 (=> (not res!678921) (not e!568534))))

(declare-fun b!1010618 () Bool)

(assert (=> b!1010618 (and (bvsge (index!40665 lt!446667) #b00000000000000000000000000000000) (bvslt (index!40665 lt!446667) (size!31143 lt!446597)))))

(declare-fun e!568535 () Bool)

(assert (=> b!1010618 (= e!568535 (= (select (arr!30641 lt!446597) (index!40665 lt!446667)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010620 () Bool)

(assert (=> b!1010620 (and (bvsge (index!40665 lt!446667) #b00000000000000000000000000000000) (bvslt (index!40665 lt!446667) (size!31143 lt!446597)))))

(declare-fun res!678923 () Bool)

(assert (=> b!1010620 (= res!678923 (= (select (arr!30641 lt!446597) (index!40665 lt!446667)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010620 (=> res!678923 e!568535)))

(declare-fun e!568533 () SeekEntryResult!9573)

(declare-fun b!1010621 () Bool)

(assert (=> b!1010621 (= e!568533 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!446593 lt!446597 mask!3464))))

(declare-fun b!1010622 () Bool)

(assert (=> b!1010622 (= e!568537 (bvsge (x!88065 lt!446667) #b01111111111111111111111111111110))))

(declare-fun b!1010623 () Bool)

(assert (=> b!1010623 (and (bvsge (index!40665 lt!446667) #b00000000000000000000000000000000) (bvslt (index!40665 lt!446667) (size!31143 lt!446597)))))

(declare-fun res!678922 () Bool)

(assert (=> b!1010623 (= res!678922 (= (select (arr!30641 lt!446597) (index!40665 lt!446667)) lt!446593))))

(assert (=> b!1010623 (=> res!678922 e!568535)))

(assert (=> b!1010623 (= e!568534 e!568535)))

(declare-fun b!1010624 () Bool)

(assert (=> b!1010624 (= e!568536 e!568533)))

(declare-fun c!102007 () Bool)

(declare-fun lt!446666 () (_ BitVec 64))

(assert (=> b!1010624 (= c!102007 (or (= lt!446666 lt!446593) (= (bvadd lt!446666 lt!446666) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010619 () Bool)

(assert (=> b!1010619 (= e!568533 (Intermediate!9573 false index!1507 x!1245))))

(declare-fun d!120023 () Bool)

(assert (=> d!120023 e!568537))

(declare-fun c!102008 () Bool)

(assert (=> d!120023 (= c!102008 (and ((_ is Intermediate!9573) lt!446667) (undefined!10385 lt!446667)))))

(assert (=> d!120023 (= lt!446667 e!568536)))

(declare-fun c!102009 () Bool)

(assert (=> d!120023 (= c!102009 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!120023 (= lt!446666 (select (arr!30641 lt!446597) index!1507))))

(assert (=> d!120023 (validMask!0 mask!3464)))

(assert (=> d!120023 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446593 lt!446597 mask!3464) lt!446667)))

(assert (= (and d!120023 c!102009) b!1010616))

(assert (= (and d!120023 (not c!102009)) b!1010624))

(assert (= (and b!1010624 c!102007) b!1010619))

(assert (= (and b!1010624 (not c!102007)) b!1010621))

(assert (= (and d!120023 c!102008) b!1010622))

(assert (= (and d!120023 (not c!102008)) b!1010617))

(assert (= (and b!1010617 res!678921) b!1010623))

(assert (= (and b!1010623 (not res!678922)) b!1010620))

(assert (= (and b!1010620 (not res!678923)) b!1010618))

(declare-fun m!934885 () Bool)

(assert (=> b!1010623 m!934885))

(assert (=> b!1010620 m!934885))

(declare-fun m!934887 () Bool)

(assert (=> d!120023 m!934887))

(assert (=> d!120023 m!934745))

(assert (=> b!1010618 m!934885))

(assert (=> b!1010621 m!934761))

(assert (=> b!1010621 m!934761))

(declare-fun m!934889 () Bool)

(assert (=> b!1010621 m!934889))

(assert (=> b!1010425 d!120023))

(declare-fun b!1010667 () Bool)

(declare-fun e!568569 () Bool)

(declare-fun call!42413 () Bool)

(assert (=> b!1010667 (= e!568569 call!42413)))

(declare-fun bm!42410 () Bool)

(assert (=> bm!42410 (= call!42413 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1010668 () Bool)

(declare-fun e!568568 () Bool)

(assert (=> b!1010668 (= e!568569 e!568568)))

(declare-fun lt!446683 () (_ BitVec 64))

(assert (=> b!1010668 (= lt!446683 (select (arr!30641 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33026 0))(
  ( (Unit!33027) )
))
(declare-fun lt!446684 () Unit!33026)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63646 (_ BitVec 64) (_ BitVec 32)) Unit!33026)

(assert (=> b!1010668 (= lt!446684 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!446683 #b00000000000000000000000000000000))))

(assert (=> b!1010668 (arrayContainsKey!0 a!3219 lt!446683 #b00000000000000000000000000000000)))

(declare-fun lt!446685 () Unit!33026)

(assert (=> b!1010668 (= lt!446685 lt!446684)))

(declare-fun res!678947 () Bool)

(assert (=> b!1010668 (= res!678947 (= (seekEntryOrOpen!0 (select (arr!30641 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9573 #b00000000000000000000000000000000)))))

(assert (=> b!1010668 (=> (not res!678947) (not e!568568))))

(declare-fun b!1010669 () Bool)

(declare-fun e!568570 () Bool)

(assert (=> b!1010669 (= e!568570 e!568569)))

(declare-fun c!102020 () Bool)

(assert (=> b!1010669 (= c!102020 (validKeyInArray!0 (select (arr!30641 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1010670 () Bool)

(assert (=> b!1010670 (= e!568568 call!42413)))

(declare-fun d!120027 () Bool)

(declare-fun res!678946 () Bool)

(assert (=> d!120027 (=> res!678946 e!568570)))

(assert (=> d!120027 (= res!678946 (bvsge #b00000000000000000000000000000000 (size!31143 a!3219)))))

(assert (=> d!120027 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!568570)))

(assert (= (and d!120027 (not res!678946)) b!1010669))

(assert (= (and b!1010669 c!102020) b!1010668))

(assert (= (and b!1010669 (not c!102020)) b!1010667))

(assert (= (and b!1010668 res!678947) b!1010670))

(assert (= (or b!1010670 b!1010667) bm!42410))

(declare-fun m!934911 () Bool)

(assert (=> bm!42410 m!934911))

(assert (=> b!1010668 m!934875))

(declare-fun m!934913 () Bool)

(assert (=> b!1010668 m!934913))

(declare-fun m!934915 () Bool)

(assert (=> b!1010668 m!934915))

(assert (=> b!1010668 m!934875))

(declare-fun m!934917 () Bool)

(assert (=> b!1010668 m!934917))

(assert (=> b!1010669 m!934875))

(assert (=> b!1010669 m!934875))

(assert (=> b!1010669 m!934879))

(assert (=> b!1010423 d!120027))

(declare-fun b!1010671 () Bool)

(declare-fun e!568574 () SeekEntryResult!9573)

(assert (=> b!1010671 (= e!568574 (Intermediate!9573 true (toIndex!0 lt!446593 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010672 () Bool)

(declare-fun e!568575 () Bool)

(declare-fun e!568572 () Bool)

(assert (=> b!1010672 (= e!568575 e!568572)))

(declare-fun res!678948 () Bool)

(declare-fun lt!446687 () SeekEntryResult!9573)

(assert (=> b!1010672 (= res!678948 (and ((_ is Intermediate!9573) lt!446687) (not (undefined!10385 lt!446687)) (bvslt (x!88065 lt!446687) #b01111111111111111111111111111110) (bvsge (x!88065 lt!446687) #b00000000000000000000000000000000) (bvsge (x!88065 lt!446687) #b00000000000000000000000000000000)))))

(assert (=> b!1010672 (=> (not res!678948) (not e!568572))))

(declare-fun b!1010673 () Bool)

(assert (=> b!1010673 (and (bvsge (index!40665 lt!446687) #b00000000000000000000000000000000) (bvslt (index!40665 lt!446687) (size!31143 lt!446597)))))

(declare-fun e!568573 () Bool)

(assert (=> b!1010673 (= e!568573 (= (select (arr!30641 lt!446597) (index!40665 lt!446687)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010675 () Bool)

(assert (=> b!1010675 (and (bvsge (index!40665 lt!446687) #b00000000000000000000000000000000) (bvslt (index!40665 lt!446687) (size!31143 lt!446597)))))

(declare-fun res!678950 () Bool)

(assert (=> b!1010675 (= res!678950 (= (select (arr!30641 lt!446597) (index!40665 lt!446687)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010675 (=> res!678950 e!568573)))

(declare-fun b!1010676 () Bool)

(declare-fun e!568571 () SeekEntryResult!9573)

(assert (=> b!1010676 (= e!568571 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!446593 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!446593 lt!446597 mask!3464))))

(declare-fun b!1010677 () Bool)

(assert (=> b!1010677 (= e!568575 (bvsge (x!88065 lt!446687) #b01111111111111111111111111111110))))

(declare-fun b!1010678 () Bool)

(assert (=> b!1010678 (and (bvsge (index!40665 lt!446687) #b00000000000000000000000000000000) (bvslt (index!40665 lt!446687) (size!31143 lt!446597)))))

(declare-fun res!678949 () Bool)

(assert (=> b!1010678 (= res!678949 (= (select (arr!30641 lt!446597) (index!40665 lt!446687)) lt!446593))))

(assert (=> b!1010678 (=> res!678949 e!568573)))

(assert (=> b!1010678 (= e!568572 e!568573)))

(declare-fun b!1010679 () Bool)

(assert (=> b!1010679 (= e!568574 e!568571)))

(declare-fun c!102021 () Bool)

(declare-fun lt!446686 () (_ BitVec 64))

(assert (=> b!1010679 (= c!102021 (or (= lt!446686 lt!446593) (= (bvadd lt!446686 lt!446686) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010674 () Bool)

(assert (=> b!1010674 (= e!568571 (Intermediate!9573 false (toIndex!0 lt!446593 mask!3464) #b00000000000000000000000000000000))))

(declare-fun d!120039 () Bool)

(assert (=> d!120039 e!568575))

(declare-fun c!102022 () Bool)

(assert (=> d!120039 (= c!102022 (and ((_ is Intermediate!9573) lt!446687) (undefined!10385 lt!446687)))))

(assert (=> d!120039 (= lt!446687 e!568574)))

(declare-fun c!102023 () Bool)

(assert (=> d!120039 (= c!102023 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!120039 (= lt!446686 (select (arr!30641 lt!446597) (toIndex!0 lt!446593 mask!3464)))))

(assert (=> d!120039 (validMask!0 mask!3464)))

(assert (=> d!120039 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446593 mask!3464) lt!446593 lt!446597 mask!3464) lt!446687)))

(assert (= (and d!120039 c!102023) b!1010671))

(assert (= (and d!120039 (not c!102023)) b!1010679))

(assert (= (and b!1010679 c!102021) b!1010674))

(assert (= (and b!1010679 (not c!102021)) b!1010676))

(assert (= (and d!120039 c!102022) b!1010677))

(assert (= (and d!120039 (not c!102022)) b!1010672))

(assert (= (and b!1010672 res!678948) b!1010678))

(assert (= (and b!1010678 (not res!678949)) b!1010675))

(assert (= (and b!1010675 (not res!678950)) b!1010673))

(declare-fun m!934919 () Bool)

(assert (=> b!1010678 m!934919))

(assert (=> b!1010675 m!934919))

(assert (=> d!120039 m!934767))

(declare-fun m!934921 () Bool)

(assert (=> d!120039 m!934921))

(assert (=> d!120039 m!934745))

(assert (=> b!1010673 m!934919))

(assert (=> b!1010676 m!934767))

(declare-fun m!934923 () Bool)

(assert (=> b!1010676 m!934923))

(assert (=> b!1010676 m!934923))

(declare-fun m!934925 () Bool)

(assert (=> b!1010676 m!934925))

(assert (=> b!1010427 d!120039))

(declare-fun d!120041 () Bool)

(declare-fun lt!446689 () (_ BitVec 32))

(declare-fun lt!446688 () (_ BitVec 32))

(assert (=> d!120041 (= lt!446689 (bvmul (bvxor lt!446688 (bvlshr lt!446688 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120041 (= lt!446688 ((_ extract 31 0) (bvand (bvxor lt!446593 (bvlshr lt!446593 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120041 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678883 (let ((h!22507 ((_ extract 31 0) (bvand (bvxor lt!446593 (bvlshr lt!446593 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88068 (bvmul (bvxor h!22507 (bvlshr h!22507 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88068 (bvlshr x!88068 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678883 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678883 #b00000000000000000000000000000000))))))

(assert (=> d!120041 (= (toIndex!0 lt!446593 mask!3464) (bvand (bvxor lt!446689 (bvlshr lt!446689 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1010427 d!120041))

(check-sat (not b!1010537) (not d!120023) (not b!1010621) (not b!1010676) (not b!1010606) (not b!1010608) (not bm!42405) (not b!1010669) (not b!1010607) (not b!1010668) (not bm!42410) (not d!119995) (not b!1010615) (not d!120039) (not d!119987) (not b!1010501) (not d!120003) (not b!1010510) (not b!1010565) (not d!119985) (not d!120001))
(check-sat)
