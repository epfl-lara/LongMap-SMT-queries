; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87272 () Bool)

(assert start!87272)

(declare-fun b!1011706 () Bool)

(declare-fun res!679666 () Bool)

(declare-fun e!569141 () Bool)

(assert (=> b!1011706 (=> (not res!679666) (not e!569141))))

(declare-datatypes ((array!63676 0))(
  ( (array!63677 (arr!30653 (Array (_ BitVec 32) (_ BitVec 64))) (size!31155 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63676)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1011706 (= res!679666 (validKeyInArray!0 (select (arr!30653 a!3219) j!170)))))

(declare-fun b!1011707 () Bool)

(declare-fun res!679659 () Bool)

(assert (=> b!1011707 (=> (not res!679659) (not e!569141))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1011707 (= res!679659 (validKeyInArray!0 k0!2224))))

(declare-fun b!1011708 () Bool)

(declare-fun res!679665 () Bool)

(declare-fun e!569140 () Bool)

(assert (=> b!1011708 (=> (not res!679665) (not e!569140))))

(declare-fun lt!447149 () (_ BitVec 32))

(declare-fun lt!447145 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9585 0))(
  ( (MissingZero!9585 (index!40711 (_ BitVec 32))) (Found!9585 (index!40712 (_ BitVec 32))) (Intermediate!9585 (undefined!10397 Bool) (index!40713 (_ BitVec 32)) (x!88127 (_ BitVec 32))) (Undefined!9585) (MissingVacant!9585 (index!40714 (_ BitVec 32))) )
))
(declare-fun lt!447152 () SeekEntryResult!9585)

(declare-fun lt!447148 () array!63676)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63676 (_ BitVec 32)) SeekEntryResult!9585)

(assert (=> b!1011708 (= res!679665 (not (= lt!447152 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447149 lt!447145 lt!447148 mask!3464))))))

(declare-fun b!1011709 () Bool)

(declare-fun res!679662 () Bool)

(assert (=> b!1011709 (=> (not res!679662) (not e!569141))))

(declare-fun arrayContainsKey!0 (array!63676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1011709 (= res!679662 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1011710 () Bool)

(declare-fun res!679669 () Bool)

(declare-fun e!569139 () Bool)

(assert (=> b!1011710 (=> (not res!679669) (not e!569139))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1011710 (= res!679669 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1011711 () Bool)

(declare-fun e!569143 () Bool)

(declare-fun e!569144 () Bool)

(assert (=> b!1011711 (= e!569143 e!569144)))

(declare-fun res!679660 () Bool)

(assert (=> b!1011711 (=> (not res!679660) (not e!569144))))

(declare-fun lt!447153 () SeekEntryResult!9585)

(declare-fun lt!447150 () SeekEntryResult!9585)

(assert (=> b!1011711 (= res!679660 (= lt!447153 lt!447150))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1011711 (= lt!447150 (Intermediate!9585 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011711 (= lt!447153 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30653 a!3219) j!170) mask!3464) (select (arr!30653 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011712 () Bool)

(assert (=> b!1011712 (= e!569141 e!569143)))

(declare-fun res!679671 () Bool)

(assert (=> b!1011712 (=> (not res!679671) (not e!569143))))

(declare-fun lt!447147 () SeekEntryResult!9585)

(assert (=> b!1011712 (= res!679671 (or (= lt!447147 (MissingVacant!9585 i!1194)) (= lt!447147 (MissingZero!9585 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63676 (_ BitVec 32)) SeekEntryResult!9585)

(assert (=> b!1011712 (= lt!447147 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1011714 () Bool)

(declare-fun res!679670 () Bool)

(assert (=> b!1011714 (=> (not res!679670) (not e!569143))))

(assert (=> b!1011714 (= res!679670 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31155 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31155 a!3219))))))

(declare-fun b!1011715 () Bool)

(declare-fun e!569146 () Bool)

(assert (=> b!1011715 (= e!569144 e!569146)))

(declare-fun res!679668 () Bool)

(assert (=> b!1011715 (=> (not res!679668) (not e!569146))))

(declare-fun lt!447151 () SeekEntryResult!9585)

(assert (=> b!1011715 (= res!679668 (= lt!447151 lt!447150))))

(assert (=> b!1011715 (= lt!447151 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30653 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011716 () Bool)

(declare-fun e!569145 () Bool)

(assert (=> b!1011716 (= e!569145 e!569140)))

(declare-fun res!679667 () Bool)

(assert (=> b!1011716 (=> (not res!679667) (not e!569140))))

(assert (=> b!1011716 (= res!679667 (= lt!447152 lt!447150))))

(assert (=> b!1011716 (= lt!447152 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447149 (select (arr!30653 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011717 () Bool)

(assert (=> b!1011717 (= e!569146 e!569139)))

(declare-fun res!679663 () Bool)

(assert (=> b!1011717 (=> (not res!679663) (not e!569139))))

(assert (=> b!1011717 (= res!679663 (not (= lt!447153 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!447145 mask!3464) lt!447145 lt!447148 mask!3464))))))

(assert (=> b!1011717 (= lt!447145 (select (store (arr!30653 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1011717 (= lt!447148 (array!63677 (store (arr!30653 a!3219) i!1194 k0!2224) (size!31155 a!3219)))))

(declare-fun b!1011718 () Bool)

(declare-fun res!679664 () Bool)

(assert (=> b!1011718 (=> (not res!679664) (not e!569141))))

(assert (=> b!1011718 (= res!679664 (and (= (size!31155 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31155 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31155 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1011719 () Bool)

(declare-fun res!679657 () Bool)

(assert (=> b!1011719 (=> (not res!679657) (not e!569143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63676 (_ BitVec 32)) Bool)

(assert (=> b!1011719 (= res!679657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1011720 () Bool)

(declare-fun res!679658 () Bool)

(assert (=> b!1011720 (=> (not res!679658) (not e!569143))))

(declare-datatypes ((List!21329 0))(
  ( (Nil!21326) (Cons!21325 (h!22523 (_ BitVec 64)) (t!30330 List!21329)) )
))
(declare-fun arrayNoDuplicates!0 (array!63676 (_ BitVec 32) List!21329) Bool)

(assert (=> b!1011720 (= res!679658 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21326))))

(declare-fun b!1011721 () Bool)

(assert (=> b!1011721 (= e!569139 e!569145)))

(declare-fun res!679655 () Bool)

(assert (=> b!1011721 (=> (not res!679655) (not e!569145))))

(assert (=> b!1011721 (= res!679655 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!447149 #b00000000000000000000000000000000) (bvslt lt!447149 (size!31155 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011721 (= lt!447149 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1011722 () Bool)

(assert (=> b!1011722 (= e!569140 (not true))))

(assert (=> b!1011722 (= resIndex!38 i!1194)))

(declare-datatypes ((Unit!33036 0))(
  ( (Unit!33037) )
))
(declare-fun lt!447146 () Unit!33036)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!63676 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!33036)

(assert (=> b!1011722 (= lt!447146 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3219 i!1194 k0!2224 j!170 lt!447149 (bvadd #b00000000000000000000000000000001 x!1245) resIndex!38 resX!38 mask!3464))))

(declare-fun b!1011713 () Bool)

(declare-fun res!679656 () Bool)

(assert (=> b!1011713 (=> (not res!679656) (not e!569139))))

(assert (=> b!1011713 (= res!679656 (not (= lt!447151 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!447145 lt!447148 mask!3464))))))

(declare-fun res!679661 () Bool)

(assert (=> start!87272 (=> (not res!679661) (not e!569141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87272 (= res!679661 (validMask!0 mask!3464))))

(assert (=> start!87272 e!569141))

(declare-fun array_inv!23777 (array!63676) Bool)

(assert (=> start!87272 (array_inv!23777 a!3219)))

(assert (=> start!87272 true))

(assert (= (and start!87272 res!679661) b!1011718))

(assert (= (and b!1011718 res!679664) b!1011706))

(assert (= (and b!1011706 res!679666) b!1011707))

(assert (= (and b!1011707 res!679659) b!1011709))

(assert (= (and b!1011709 res!679662) b!1011712))

(assert (= (and b!1011712 res!679671) b!1011719))

(assert (= (and b!1011719 res!679657) b!1011720))

(assert (= (and b!1011720 res!679658) b!1011714))

(assert (= (and b!1011714 res!679670) b!1011711))

(assert (= (and b!1011711 res!679660) b!1011715))

(assert (= (and b!1011715 res!679668) b!1011717))

(assert (= (and b!1011717 res!679663) b!1011713))

(assert (= (and b!1011713 res!679656) b!1011710))

(assert (= (and b!1011710 res!679669) b!1011721))

(assert (= (and b!1011721 res!679655) b!1011716))

(assert (= (and b!1011716 res!679667) b!1011708))

(assert (= (and b!1011708 res!679665) b!1011722))

(declare-fun m!935655 () Bool)

(assert (=> b!1011722 m!935655))

(declare-fun m!935657 () Bool)

(assert (=> b!1011712 m!935657))

(declare-fun m!935659 () Bool)

(assert (=> b!1011711 m!935659))

(assert (=> b!1011711 m!935659))

(declare-fun m!935661 () Bool)

(assert (=> b!1011711 m!935661))

(assert (=> b!1011711 m!935661))

(assert (=> b!1011711 m!935659))

(declare-fun m!935663 () Bool)

(assert (=> b!1011711 m!935663))

(declare-fun m!935665 () Bool)

(assert (=> b!1011708 m!935665))

(declare-fun m!935667 () Bool)

(assert (=> b!1011707 m!935667))

(assert (=> b!1011715 m!935659))

(assert (=> b!1011715 m!935659))

(declare-fun m!935669 () Bool)

(assert (=> b!1011715 m!935669))

(declare-fun m!935671 () Bool)

(assert (=> b!1011709 m!935671))

(assert (=> b!1011716 m!935659))

(assert (=> b!1011716 m!935659))

(declare-fun m!935673 () Bool)

(assert (=> b!1011716 m!935673))

(declare-fun m!935675 () Bool)

(assert (=> b!1011717 m!935675))

(assert (=> b!1011717 m!935675))

(declare-fun m!935677 () Bool)

(assert (=> b!1011717 m!935677))

(declare-fun m!935679 () Bool)

(assert (=> b!1011717 m!935679))

(declare-fun m!935681 () Bool)

(assert (=> b!1011717 m!935681))

(declare-fun m!935683 () Bool)

(assert (=> b!1011720 m!935683))

(declare-fun m!935685 () Bool)

(assert (=> b!1011721 m!935685))

(declare-fun m!935687 () Bool)

(assert (=> b!1011719 m!935687))

(declare-fun m!935689 () Bool)

(assert (=> start!87272 m!935689))

(declare-fun m!935691 () Bool)

(assert (=> start!87272 m!935691))

(declare-fun m!935693 () Bool)

(assert (=> b!1011713 m!935693))

(assert (=> b!1011706 m!935659))

(assert (=> b!1011706 m!935659))

(declare-fun m!935695 () Bool)

(assert (=> b!1011706 m!935695))

(check-sat (not b!1011715) (not b!1011720) (not b!1011719) (not b!1011711) (not b!1011713) (not b!1011709) (not b!1011717) (not b!1011707) (not b!1011712) (not b!1011721) (not b!1011706) (not b!1011716) (not b!1011722) (not b!1011708) (not start!87272))
(check-sat)
