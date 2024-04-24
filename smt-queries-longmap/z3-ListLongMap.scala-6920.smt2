; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87166 () Bool)

(assert start!87166)

(declare-fun b!1009677 () Bool)

(declare-fun e!568214 () Bool)

(declare-fun e!568213 () Bool)

(assert (=> b!1009677 (= e!568214 e!568213)))

(declare-fun res!677817 () Bool)

(assert (=> b!1009677 (=> (not res!677817) (not e!568213))))

(declare-datatypes ((SeekEntryResult!9499 0))(
  ( (MissingZero!9499 (index!40367 (_ BitVec 32))) (Found!9499 (index!40368 (_ BitVec 32))) (Intermediate!9499 (undefined!10311 Bool) (index!40369 (_ BitVec 32)) (x!87917 (_ BitVec 32))) (Undefined!9499) (MissingVacant!9499 (index!40370 (_ BitVec 32))) )
))
(declare-fun lt!446179 () SeekEntryResult!9499)

(declare-fun lt!446177 () SeekEntryResult!9499)

(assert (=> b!1009677 (= res!677817 (= lt!446179 lt!446177))))

(declare-datatypes ((array!63633 0))(
  ( (array!63634 (arr!30631 (Array (_ BitVec 32) (_ BitVec 64))) (size!31134 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63633)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63633 (_ BitVec 32)) SeekEntryResult!9499)

(assert (=> b!1009677 (= lt!446179 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30631 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009678 () Bool)

(declare-fun res!677819 () Bool)

(declare-fun e!568215 () Bool)

(assert (=> b!1009678 (=> (not res!677819) (not e!568215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009678 (= res!677819 (validKeyInArray!0 (select (arr!30631 a!3219) j!170)))))

(declare-fun b!1009679 () Bool)

(declare-fun res!677816 () Bool)

(declare-fun e!568217 () Bool)

(assert (=> b!1009679 (=> (not res!677816) (not e!568217))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009679 (= res!677816 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31134 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31134 a!3219))))))

(declare-fun b!1009680 () Bool)

(declare-fun res!677810 () Bool)

(declare-fun e!568216 () Bool)

(assert (=> b!1009680 (=> (not res!677810) (not e!568216))))

(declare-fun lt!446176 () (_ BitVec 64))

(declare-fun lt!446174 () array!63633)

(assert (=> b!1009680 (= res!677810 (not (= lt!446179 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446176 lt!446174 mask!3464))))))

(declare-fun b!1009682 () Bool)

(declare-fun res!677809 () Bool)

(assert (=> b!1009682 (=> (not res!677809) (not e!568215))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009682 (= res!677809 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1009683 () Bool)

(assert (=> b!1009683 (= e!568216 false)))

(declare-fun lt!446175 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009683 (= lt!446175 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1009684 () Bool)

(declare-fun res!677821 () Bool)

(assert (=> b!1009684 (=> (not res!677821) (not e!568217))))

(declare-datatypes ((List!21278 0))(
  ( (Nil!21275) (Cons!21274 (h!22469 (_ BitVec 64)) (t!30271 List!21278)) )
))
(declare-fun arrayNoDuplicates!0 (array!63633 (_ BitVec 32) List!21278) Bool)

(assert (=> b!1009684 (= res!677821 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21275))))

(declare-fun b!1009685 () Bool)

(declare-fun res!677813 () Bool)

(assert (=> b!1009685 (=> (not res!677813) (not e!568215))))

(assert (=> b!1009685 (= res!677813 (validKeyInArray!0 k0!2224))))

(declare-fun b!1009686 () Bool)

(declare-fun res!677814 () Bool)

(assert (=> b!1009686 (=> (not res!677814) (not e!568216))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1009686 (= res!677814 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1009687 () Bool)

(assert (=> b!1009687 (= e!568217 e!568214)))

(declare-fun res!677815 () Bool)

(assert (=> b!1009687 (=> (not res!677815) (not e!568214))))

(declare-fun lt!446180 () SeekEntryResult!9499)

(assert (=> b!1009687 (= res!677815 (= lt!446180 lt!446177))))

(assert (=> b!1009687 (= lt!446177 (Intermediate!9499 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009687 (= lt!446180 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30631 a!3219) j!170) mask!3464) (select (arr!30631 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009688 () Bool)

(declare-fun res!677822 () Bool)

(assert (=> b!1009688 (=> (not res!677822) (not e!568215))))

(assert (=> b!1009688 (= res!677822 (and (= (size!31134 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31134 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31134 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009689 () Bool)

(assert (=> b!1009689 (= e!568213 e!568216)))

(declare-fun res!677812 () Bool)

(assert (=> b!1009689 (=> (not res!677812) (not e!568216))))

(assert (=> b!1009689 (= res!677812 (not (= lt!446180 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446176 mask!3464) lt!446176 lt!446174 mask!3464))))))

(assert (=> b!1009689 (= lt!446176 (select (store (arr!30631 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1009689 (= lt!446174 (array!63634 (store (arr!30631 a!3219) i!1194 k0!2224) (size!31134 a!3219)))))

(declare-fun b!1009690 () Bool)

(assert (=> b!1009690 (= e!568215 e!568217)))

(declare-fun res!677818 () Bool)

(assert (=> b!1009690 (=> (not res!677818) (not e!568217))))

(declare-fun lt!446178 () SeekEntryResult!9499)

(assert (=> b!1009690 (= res!677818 (or (= lt!446178 (MissingVacant!9499 i!1194)) (= lt!446178 (MissingZero!9499 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63633 (_ BitVec 32)) SeekEntryResult!9499)

(assert (=> b!1009690 (= lt!446178 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!677820 () Bool)

(assert (=> start!87166 (=> (not res!677820) (not e!568215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87166 (= res!677820 (validMask!0 mask!3464))))

(assert (=> start!87166 e!568215))

(declare-fun array_inv!23767 (array!63633) Bool)

(assert (=> start!87166 (array_inv!23767 a!3219)))

(assert (=> start!87166 true))

(declare-fun b!1009681 () Bool)

(declare-fun res!677811 () Bool)

(assert (=> b!1009681 (=> (not res!677811) (not e!568217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63633 (_ BitVec 32)) Bool)

(assert (=> b!1009681 (= res!677811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!87166 res!677820) b!1009688))

(assert (= (and b!1009688 res!677822) b!1009678))

(assert (= (and b!1009678 res!677819) b!1009685))

(assert (= (and b!1009685 res!677813) b!1009682))

(assert (= (and b!1009682 res!677809) b!1009690))

(assert (= (and b!1009690 res!677818) b!1009681))

(assert (= (and b!1009681 res!677811) b!1009684))

(assert (= (and b!1009684 res!677821) b!1009679))

(assert (= (and b!1009679 res!677816) b!1009687))

(assert (= (and b!1009687 res!677815) b!1009677))

(assert (= (and b!1009677 res!677817) b!1009689))

(assert (= (and b!1009689 res!677812) b!1009680))

(assert (= (and b!1009680 res!677810) b!1009686))

(assert (= (and b!1009686 res!677814) b!1009683))

(declare-fun m!934703 () Bool)

(assert (=> b!1009683 m!934703))

(declare-fun m!934705 () Bool)

(assert (=> b!1009680 m!934705))

(declare-fun m!934707 () Bool)

(assert (=> b!1009681 m!934707))

(declare-fun m!934709 () Bool)

(assert (=> b!1009685 m!934709))

(declare-fun m!934711 () Bool)

(assert (=> b!1009677 m!934711))

(assert (=> b!1009677 m!934711))

(declare-fun m!934713 () Bool)

(assert (=> b!1009677 m!934713))

(assert (=> b!1009678 m!934711))

(assert (=> b!1009678 m!934711))

(declare-fun m!934715 () Bool)

(assert (=> b!1009678 m!934715))

(declare-fun m!934717 () Bool)

(assert (=> b!1009682 m!934717))

(declare-fun m!934719 () Bool)

(assert (=> b!1009684 m!934719))

(assert (=> b!1009687 m!934711))

(assert (=> b!1009687 m!934711))

(declare-fun m!934721 () Bool)

(assert (=> b!1009687 m!934721))

(assert (=> b!1009687 m!934721))

(assert (=> b!1009687 m!934711))

(declare-fun m!934723 () Bool)

(assert (=> b!1009687 m!934723))

(declare-fun m!934725 () Bool)

(assert (=> b!1009690 m!934725))

(declare-fun m!934727 () Bool)

(assert (=> start!87166 m!934727))

(declare-fun m!934729 () Bool)

(assert (=> start!87166 m!934729))

(declare-fun m!934731 () Bool)

(assert (=> b!1009689 m!934731))

(assert (=> b!1009689 m!934731))

(declare-fun m!934733 () Bool)

(assert (=> b!1009689 m!934733))

(declare-fun m!934735 () Bool)

(assert (=> b!1009689 m!934735))

(declare-fun m!934737 () Bool)

(assert (=> b!1009689 m!934737))

(check-sat (not b!1009677) (not b!1009689) (not b!1009690) (not b!1009685) (not b!1009680) (not b!1009684) (not start!87166) (not b!1009681) (not b!1009683) (not b!1009682) (not b!1009687) (not b!1009678))
(check-sat)
