; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87270 () Bool)

(assert start!87270)

(declare-fun b!1011525 () Bool)

(declare-fun e!569045 () Bool)

(declare-fun e!569042 () Bool)

(assert (=> b!1011525 (= e!569045 e!569042)))

(declare-fun res!679547 () Bool)

(assert (=> b!1011525 (=> (not res!679547) (not e!569042))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!446918 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9578 0))(
  ( (MissingZero!9578 (index!40683 (_ BitVec 32))) (Found!9578 (index!40684 (_ BitVec 32))) (Intermediate!9578 (undefined!10390 Bool) (index!40685 (_ BitVec 32)) (x!88117 (_ BitVec 32))) (Undefined!9578) (MissingVacant!9578 (index!40686 (_ BitVec 32))) )
))
(declare-fun lt!446919 () SeekEntryResult!9578)

(declare-datatypes ((array!63613 0))(
  ( (array!63614 (arr!30621 (Array (_ BitVec 32) (_ BitVec 64))) (size!31125 (_ BitVec 32))) )
))
(declare-fun lt!446924 () array!63613)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63613 (_ BitVec 32)) SeekEntryResult!9578)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011525 (= res!679547 (not (= lt!446919 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446918 mask!3464) lt!446918 lt!446924 mask!3464))))))

(declare-fun a!3219 () array!63613)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1011525 (= lt!446918 (select (store (arr!30621 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1011525 (= lt!446924 (array!63614 (store (arr!30621 a!3219) i!1194 k0!2224) (size!31125 a!3219)))))

(declare-fun b!1011526 () Bool)

(declare-fun res!679559 () Bool)

(declare-fun e!569040 () Bool)

(assert (=> b!1011526 (=> (not res!679559) (not e!569040))))

(assert (=> b!1011526 (= res!679559 (and (= (size!31125 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31125 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31125 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1011527 () Bool)

(declare-fun res!679550 () Bool)

(assert (=> b!1011527 (=> (not res!679550) (not e!569040))))

(declare-fun arrayContainsKey!0 (array!63613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1011527 (= res!679550 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1011528 () Bool)

(declare-fun e!569043 () Bool)

(assert (=> b!1011528 (= e!569042 e!569043)))

(declare-fun res!679552 () Bool)

(assert (=> b!1011528 (=> (not res!679552) (not e!569043))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!446921 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1011528 (= res!679552 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!446921 #b00000000000000000000000000000000) (bvslt lt!446921 (size!31125 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011528 (= lt!446921 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1011529 () Bool)

(declare-fun res!679549 () Bool)

(declare-fun e!569044 () Bool)

(assert (=> b!1011529 (=> (not res!679549) (not e!569044))))

(declare-fun lt!446920 () SeekEntryResult!9578)

(assert (=> b!1011529 (= res!679549 (not (= lt!446920 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446921 lt!446918 lt!446924 mask!3464))))))

(declare-fun b!1011530 () Bool)

(declare-fun res!679545 () Bool)

(assert (=> b!1011530 (=> (not res!679545) (not e!569042))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1011530 (= res!679545 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1011531 () Bool)

(declare-fun res!679555 () Bool)

(declare-fun e!569041 () Bool)

(assert (=> b!1011531 (=> (not res!679555) (not e!569041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63613 (_ BitVec 32)) Bool)

(assert (=> b!1011531 (= res!679555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!679551 () Bool)

(assert (=> start!87270 (=> (not res!679551) (not e!569040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87270 (= res!679551 (validMask!0 mask!3464))))

(assert (=> start!87270 e!569040))

(declare-fun array_inv!23764 (array!63613) Bool)

(assert (=> start!87270 (array_inv!23764 a!3219)))

(assert (=> start!87270 true))

(declare-fun b!1011532 () Bool)

(declare-fun res!679558 () Bool)

(assert (=> b!1011532 (=> (not res!679558) (not e!569042))))

(declare-fun lt!446925 () SeekEntryResult!9578)

(assert (=> b!1011532 (= res!679558 (not (= lt!446925 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446918 lt!446924 mask!3464))))))

(declare-fun b!1011533 () Bool)

(declare-fun res!679557 () Bool)

(assert (=> b!1011533 (=> (not res!679557) (not e!569040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1011533 (= res!679557 (validKeyInArray!0 k0!2224))))

(declare-fun b!1011534 () Bool)

(declare-fun res!679553 () Bool)

(assert (=> b!1011534 (=> (not res!679553) (not e!569040))))

(assert (=> b!1011534 (= res!679553 (validKeyInArray!0 (select (arr!30621 a!3219) j!170)))))

(declare-fun b!1011535 () Bool)

(declare-fun res!679556 () Bool)

(assert (=> b!1011535 (=> (not res!679556) (not e!569041))))

(assert (=> b!1011535 (= res!679556 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31125 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31125 a!3219))))))

(declare-fun b!1011536 () Bool)

(declare-fun e!569039 () Bool)

(assert (=> b!1011536 (= e!569041 e!569039)))

(declare-fun res!679548 () Bool)

(assert (=> b!1011536 (=> (not res!679548) (not e!569039))))

(declare-fun lt!446926 () SeekEntryResult!9578)

(assert (=> b!1011536 (= res!679548 (= lt!446919 lt!446926))))

(assert (=> b!1011536 (= lt!446926 (Intermediate!9578 false resIndex!38 resX!38))))

(assert (=> b!1011536 (= lt!446919 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30621 a!3219) j!170) mask!3464) (select (arr!30621 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011537 () Bool)

(assert (=> b!1011537 (= e!569044 (not true))))

(assert (=> b!1011537 (= resIndex!38 i!1194)))

(declare-datatypes ((Unit!32911 0))(
  ( (Unit!32912) )
))
(declare-fun lt!446922 () Unit!32911)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!63613 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32911)

(assert (=> b!1011537 (= lt!446922 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3219 i!1194 k0!2224 j!170 lt!446921 (bvadd #b00000000000000000000000000000001 x!1245) resIndex!38 resX!38 mask!3464))))

(declare-fun b!1011538 () Bool)

(declare-fun res!679544 () Bool)

(assert (=> b!1011538 (=> (not res!679544) (not e!569041))))

(declare-datatypes ((List!21363 0))(
  ( (Nil!21360) (Cons!21359 (h!22557 (_ BitVec 64)) (t!30355 List!21363)) )
))
(declare-fun arrayNoDuplicates!0 (array!63613 (_ BitVec 32) List!21363) Bool)

(assert (=> b!1011538 (= res!679544 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21360))))

(declare-fun b!1011539 () Bool)

(assert (=> b!1011539 (= e!569039 e!569045)))

(declare-fun res!679554 () Bool)

(assert (=> b!1011539 (=> (not res!679554) (not e!569045))))

(assert (=> b!1011539 (= res!679554 (= lt!446925 lt!446926))))

(assert (=> b!1011539 (= lt!446925 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30621 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011540 () Bool)

(assert (=> b!1011540 (= e!569040 e!569041)))

(declare-fun res!679546 () Bool)

(assert (=> b!1011540 (=> (not res!679546) (not e!569041))))

(declare-fun lt!446923 () SeekEntryResult!9578)

(assert (=> b!1011540 (= res!679546 (or (= lt!446923 (MissingVacant!9578 i!1194)) (= lt!446923 (MissingZero!9578 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63613 (_ BitVec 32)) SeekEntryResult!9578)

(assert (=> b!1011540 (= lt!446923 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1011541 () Bool)

(assert (=> b!1011541 (= e!569043 e!569044)))

(declare-fun res!679543 () Bool)

(assert (=> b!1011541 (=> (not res!679543) (not e!569044))))

(assert (=> b!1011541 (= res!679543 (= lt!446920 lt!446926))))

(assert (=> b!1011541 (= lt!446920 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446921 (select (arr!30621 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!87270 res!679551) b!1011526))

(assert (= (and b!1011526 res!679559) b!1011534))

(assert (= (and b!1011534 res!679553) b!1011533))

(assert (= (and b!1011533 res!679557) b!1011527))

(assert (= (and b!1011527 res!679550) b!1011540))

(assert (= (and b!1011540 res!679546) b!1011531))

(assert (= (and b!1011531 res!679555) b!1011538))

(assert (= (and b!1011538 res!679544) b!1011535))

(assert (= (and b!1011535 res!679556) b!1011536))

(assert (= (and b!1011536 res!679548) b!1011539))

(assert (= (and b!1011539 res!679554) b!1011525))

(assert (= (and b!1011525 res!679547) b!1011532))

(assert (= (and b!1011532 res!679558) b!1011530))

(assert (= (and b!1011530 res!679545) b!1011528))

(assert (= (and b!1011528 res!679552) b!1011541))

(assert (= (and b!1011541 res!679543) b!1011529))

(assert (= (and b!1011529 res!679549) b!1011537))

(declare-fun m!934975 () Bool)

(assert (=> b!1011527 m!934975))

(declare-fun m!934977 () Bool)

(assert (=> b!1011528 m!934977))

(declare-fun m!934979 () Bool)

(assert (=> b!1011529 m!934979))

(declare-fun m!934981 () Bool)

(assert (=> b!1011536 m!934981))

(assert (=> b!1011536 m!934981))

(declare-fun m!934983 () Bool)

(assert (=> b!1011536 m!934983))

(assert (=> b!1011536 m!934983))

(assert (=> b!1011536 m!934981))

(declare-fun m!934985 () Bool)

(assert (=> b!1011536 m!934985))

(declare-fun m!934987 () Bool)

(assert (=> start!87270 m!934987))

(declare-fun m!934989 () Bool)

(assert (=> start!87270 m!934989))

(assert (=> b!1011539 m!934981))

(assert (=> b!1011539 m!934981))

(declare-fun m!934991 () Bool)

(assert (=> b!1011539 m!934991))

(declare-fun m!934993 () Bool)

(assert (=> b!1011533 m!934993))

(declare-fun m!934995 () Bool)

(assert (=> b!1011531 m!934995))

(assert (=> b!1011534 m!934981))

(assert (=> b!1011534 m!934981))

(declare-fun m!934997 () Bool)

(assert (=> b!1011534 m!934997))

(declare-fun m!934999 () Bool)

(assert (=> b!1011537 m!934999))

(declare-fun m!935001 () Bool)

(assert (=> b!1011538 m!935001))

(assert (=> b!1011541 m!934981))

(assert (=> b!1011541 m!934981))

(declare-fun m!935003 () Bool)

(assert (=> b!1011541 m!935003))

(declare-fun m!935005 () Bool)

(assert (=> b!1011532 m!935005))

(declare-fun m!935007 () Bool)

(assert (=> b!1011525 m!935007))

(assert (=> b!1011525 m!935007))

(declare-fun m!935009 () Bool)

(assert (=> b!1011525 m!935009))

(declare-fun m!935011 () Bool)

(assert (=> b!1011525 m!935011))

(declare-fun m!935013 () Bool)

(assert (=> b!1011525 m!935013))

(declare-fun m!935015 () Bool)

(assert (=> b!1011540 m!935015))

(check-sat (not b!1011525) (not b!1011532) (not b!1011538) (not b!1011540) (not start!87270) (not b!1011533) (not b!1011531) (not b!1011537) (not b!1011541) (not b!1011527) (not b!1011534) (not b!1011539) (not b!1011528) (not b!1011536) (not b!1011529))
(check-sat)
