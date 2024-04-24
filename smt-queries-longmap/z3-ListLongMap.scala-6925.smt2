; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87280 () Bool)

(assert start!87280)

(declare-fun b!1010886 () Bool)

(declare-fun res!678671 () Bool)

(declare-fun e!568848 () Bool)

(assert (=> b!1010886 (=> (not res!678671) (not e!568848))))

(declare-datatypes ((array!63666 0))(
  ( (array!63667 (arr!30646 (Array (_ BitVec 32) (_ BitVec 64))) (size!31149 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63666)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010886 (= res!678671 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31149 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31149 a!3219))))))

(declare-fun b!1010887 () Bool)

(declare-fun res!678667 () Bool)

(declare-fun e!568845 () Bool)

(assert (=> b!1010887 (=> (not res!678667) (not e!568845))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010887 (= res!678667 (validKeyInArray!0 (select (arr!30646 a!3219) j!170)))))

(declare-fun res!678665 () Bool)

(assert (=> start!87280 (=> (not res!678665) (not e!568845))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87280 (= res!678665 (validMask!0 mask!3464))))

(assert (=> start!87280 e!568845))

(declare-fun array_inv!23782 (array!63666) Bool)

(assert (=> start!87280 (array_inv!23782 a!3219)))

(assert (=> start!87280 true))

(declare-fun b!1010888 () Bool)

(declare-fun e!568844 () Bool)

(declare-fun e!568847 () Bool)

(assert (=> b!1010888 (= e!568844 e!568847)))

(declare-fun res!678663 () Bool)

(assert (=> b!1010888 (=> (not res!678663) (not e!568847))))

(declare-fun lt!446714 () array!63666)

(declare-datatypes ((SeekEntryResult!9514 0))(
  ( (MissingZero!9514 (index!40427 (_ BitVec 32))) (Found!9514 (index!40428 (_ BitVec 32))) (Intermediate!9514 (undefined!10326 Bool) (index!40429 (_ BitVec 32)) (x!87987 (_ BitVec 32))) (Undefined!9514) (MissingVacant!9514 (index!40430 (_ BitVec 32))) )
))
(declare-fun lt!446717 () SeekEntryResult!9514)

(declare-fun lt!446713 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63666 (_ BitVec 32)) SeekEntryResult!9514)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010888 (= res!678663 (not (= lt!446717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446713 mask!3464) lt!446713 lt!446714 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1010888 (= lt!446713 (select (store (arr!30646 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1010888 (= lt!446714 (array!63667 (store (arr!30646 a!3219) i!1194 k0!2224) (size!31149 a!3219)))))

(declare-fun b!1010889 () Bool)

(declare-fun res!678664 () Bool)

(assert (=> b!1010889 (=> (not res!678664) (not e!568845))))

(assert (=> b!1010889 (= res!678664 (validKeyInArray!0 k0!2224))))

(declare-fun b!1010890 () Bool)

(declare-fun res!678669 () Bool)

(assert (=> b!1010890 (=> (not res!678669) (not e!568847))))

(assert (=> b!1010890 (= res!678669 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010891 () Bool)

(declare-fun res!678662 () Bool)

(assert (=> b!1010891 (=> (not res!678662) (not e!568848))))

(declare-datatypes ((List!21293 0))(
  ( (Nil!21290) (Cons!21289 (h!22487 (_ BitVec 64)) (t!30286 List!21293)) )
))
(declare-fun arrayNoDuplicates!0 (array!63666 (_ BitVec 32) List!21293) Bool)

(assert (=> b!1010891 (= res!678662 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21290))))

(declare-fun b!1010892 () Bool)

(declare-fun res!678658 () Bool)

(assert (=> b!1010892 (=> (not res!678658) (not e!568845))))

(declare-fun arrayContainsKey!0 (array!63666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010892 (= res!678658 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1010893 () Bool)

(declare-fun res!678659 () Bool)

(assert (=> b!1010893 (=> (not res!678659) (not e!568848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63666 (_ BitVec 32)) Bool)

(assert (=> b!1010893 (= res!678659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010894 () Bool)

(assert (=> b!1010894 (= e!568845 e!568848)))

(declare-fun res!678666 () Bool)

(assert (=> b!1010894 (=> (not res!678666) (not e!568848))))

(declare-fun lt!446711 () SeekEntryResult!9514)

(assert (=> b!1010894 (= res!678666 (or (= lt!446711 (MissingVacant!9514 i!1194)) (= lt!446711 (MissingZero!9514 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63666 (_ BitVec 32)) SeekEntryResult!9514)

(assert (=> b!1010894 (= lt!446711 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1010895 () Bool)

(declare-fun res!678660 () Bool)

(assert (=> b!1010895 (=> (not res!678660) (not e!568845))))

(assert (=> b!1010895 (= res!678660 (and (= (size!31149 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31149 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31149 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1010896 () Bool)

(declare-fun e!568846 () Bool)

(assert (=> b!1010896 (= e!568848 e!568846)))

(declare-fun res!678670 () Bool)

(assert (=> b!1010896 (=> (not res!678670) (not e!568846))))

(declare-fun lt!446716 () SeekEntryResult!9514)

(assert (=> b!1010896 (= res!678670 (= lt!446717 lt!446716))))

(assert (=> b!1010896 (= lt!446716 (Intermediate!9514 false resIndex!38 resX!38))))

(assert (=> b!1010896 (= lt!446717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30646 a!3219) j!170) mask!3464) (select (arr!30646 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010897 () Bool)

(declare-fun res!678668 () Bool)

(assert (=> b!1010897 (=> (not res!678668) (not e!568847))))

(declare-fun lt!446715 () SeekEntryResult!9514)

(assert (=> b!1010897 (= res!678668 (not (= lt!446715 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446713 lt!446714 mask!3464))))))

(declare-fun b!1010898 () Bool)

(assert (=> b!1010898 (= e!568847 false)))

(declare-fun lt!446712 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010898 (= lt!446712 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1010899 () Bool)

(assert (=> b!1010899 (= e!568846 e!568844)))

(declare-fun res!678661 () Bool)

(assert (=> b!1010899 (=> (not res!678661) (not e!568844))))

(assert (=> b!1010899 (= res!678661 (= lt!446715 lt!446716))))

(assert (=> b!1010899 (= lt!446715 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30646 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!87280 res!678665) b!1010895))

(assert (= (and b!1010895 res!678660) b!1010887))

(assert (= (and b!1010887 res!678667) b!1010889))

(assert (= (and b!1010889 res!678664) b!1010892))

(assert (= (and b!1010892 res!678658) b!1010894))

(assert (= (and b!1010894 res!678666) b!1010893))

(assert (= (and b!1010893 res!678659) b!1010891))

(assert (= (and b!1010891 res!678662) b!1010886))

(assert (= (and b!1010886 res!678671) b!1010896))

(assert (= (and b!1010896 res!678670) b!1010899))

(assert (= (and b!1010899 res!678661) b!1010888))

(assert (= (and b!1010888 res!678663) b!1010897))

(assert (= (and b!1010897 res!678668) b!1010890))

(assert (= (and b!1010890 res!678669) b!1010898))

(declare-fun m!935717 () Bool)

(assert (=> b!1010888 m!935717))

(assert (=> b!1010888 m!935717))

(declare-fun m!935719 () Bool)

(assert (=> b!1010888 m!935719))

(declare-fun m!935721 () Bool)

(assert (=> b!1010888 m!935721))

(declare-fun m!935723 () Bool)

(assert (=> b!1010888 m!935723))

(declare-fun m!935725 () Bool)

(assert (=> b!1010891 m!935725))

(declare-fun m!935727 () Bool)

(assert (=> b!1010896 m!935727))

(assert (=> b!1010896 m!935727))

(declare-fun m!935729 () Bool)

(assert (=> b!1010896 m!935729))

(assert (=> b!1010896 m!935729))

(assert (=> b!1010896 m!935727))

(declare-fun m!935731 () Bool)

(assert (=> b!1010896 m!935731))

(declare-fun m!935733 () Bool)

(assert (=> b!1010894 m!935733))

(declare-fun m!935735 () Bool)

(assert (=> b!1010892 m!935735))

(declare-fun m!935737 () Bool)

(assert (=> b!1010889 m!935737))

(declare-fun m!935739 () Bool)

(assert (=> start!87280 m!935739))

(declare-fun m!935741 () Bool)

(assert (=> start!87280 m!935741))

(declare-fun m!935743 () Bool)

(assert (=> b!1010897 m!935743))

(assert (=> b!1010887 m!935727))

(assert (=> b!1010887 m!935727))

(declare-fun m!935745 () Bool)

(assert (=> b!1010887 m!935745))

(declare-fun m!935747 () Bool)

(assert (=> b!1010893 m!935747))

(declare-fun m!935749 () Bool)

(assert (=> b!1010898 m!935749))

(assert (=> b!1010899 m!935727))

(assert (=> b!1010899 m!935727))

(declare-fun m!935751 () Bool)

(assert (=> b!1010899 m!935751))

(check-sat (not b!1010889) (not start!87280) (not b!1010898) (not b!1010891) (not b!1010899) (not b!1010888) (not b!1010892) (not b!1010896) (not b!1010894) (not b!1010887) (not b!1010893) (not b!1010897))
(check-sat)
