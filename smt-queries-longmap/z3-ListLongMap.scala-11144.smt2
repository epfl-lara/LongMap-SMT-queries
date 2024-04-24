; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130608 () Bool)

(assert start!130608)

(declare-fun b!1530917 () Bool)

(declare-fun e!853402 () Bool)

(declare-datatypes ((SeekEntryResult!13124 0))(
  ( (MissingZero!13124 (index!54891 (_ BitVec 32))) (Found!13124 (index!54892 (_ BitVec 32))) (Intermediate!13124 (undefined!13936 Bool) (index!54893 (_ BitVec 32)) (x!136794 (_ BitVec 32))) (Undefined!13124) (MissingVacant!13124 (index!54894 (_ BitVec 32))) )
))
(declare-fun lt!663006 () SeekEntryResult!13124)

(declare-fun lt!663001 () SeekEntryResult!13124)

(assert (=> b!1530917 (= e!853402 (= lt!663006 lt!663001))))

(declare-fun lt!663002 () SeekEntryResult!13124)

(declare-fun lt!663003 () SeekEntryResult!13124)

(assert (=> b!1530917 (= lt!663002 lt!663003)))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((Unit!51067 0))(
  ( (Unit!51068) )
))
(declare-fun lt!662999 () Unit!51067)

(declare-datatypes ((array!101695 0))(
  ( (array!101696 (arr!49066 (Array (_ BitVec 32) (_ BitVec 64))) (size!49617 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101695)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51067)

(assert (=> b!1530917 (= lt!662999 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1530918 () Bool)

(declare-fun res!1047146 () Bool)

(declare-fun e!853403 () Bool)

(assert (=> b!1530918 (=> (not res!1047146) (not e!853403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530918 (= res!1047146 (validKeyInArray!0 (select (arr!49066 a!2804) j!70)))))

(declare-fun b!1530919 () Bool)

(declare-fun res!1047142 () Bool)

(declare-fun e!853400 () Bool)

(assert (=> b!1530919 (=> (not res!1047142) (not e!853400))))

(declare-fun lt!663004 () SeekEntryResult!13124)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101695 (_ BitVec 32)) SeekEntryResult!13124)

(assert (=> b!1530919 (= res!1047142 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49066 a!2804) j!70) a!2804 mask!2512) lt!663004))))

(declare-fun b!1530920 () Bool)

(assert (=> b!1530920 (= e!853403 e!853400)))

(declare-fun res!1047148 () Bool)

(assert (=> b!1530920 (=> (not res!1047148) (not e!853400))))

(declare-fun lt!662997 () SeekEntryResult!13124)

(assert (=> b!1530920 (= res!1047148 (= lt!662997 lt!663004))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1530920 (= lt!663004 (Intermediate!13124 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530920 (= lt!662997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49066 a!2804) j!70) mask!2512) (select (arr!49066 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530921 () Bool)

(declare-fun res!1047140 () Bool)

(assert (=> b!1530921 (=> (not res!1047140) (not e!853403))))

(assert (=> b!1530921 (= res!1047140 (and (= (size!49617 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49617 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49617 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530922 () Bool)

(declare-fun res!1047149 () Bool)

(assert (=> b!1530922 (=> (not res!1047149) (not e!853403))))

(declare-datatypes ((List!35536 0))(
  ( (Nil!35533) (Cons!35532 (h!36986 (_ BitVec 64)) (t!50222 List!35536)) )
))
(declare-fun arrayNoDuplicates!0 (array!101695 (_ BitVec 32) List!35536) Bool)

(assert (=> b!1530922 (= res!1047149 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35533))))

(declare-fun e!853405 () Bool)

(declare-fun b!1530923 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101695 (_ BitVec 32)) SeekEntryResult!13124)

(assert (=> b!1530923 (= e!853405 (= (seekEntry!0 (select (arr!49066 a!2804) j!70) a!2804 mask!2512) (Found!13124 j!70)))))

(declare-fun b!1530924 () Bool)

(declare-fun res!1047144 () Bool)

(assert (=> b!1530924 (=> (not res!1047144) (not e!853403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101695 (_ BitVec 32)) Bool)

(assert (=> b!1530924 (= res!1047144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1530925 () Bool)

(declare-fun res!1047139 () Bool)

(assert (=> b!1530925 (=> (not res!1047139) (not e!853403))))

(assert (=> b!1530925 (= res!1047139 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49617 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49617 a!2804))))))

(declare-fun res!1047138 () Bool)

(assert (=> start!130608 (=> (not res!1047138) (not e!853403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130608 (= res!1047138 (validMask!0 mask!2512))))

(assert (=> start!130608 e!853403))

(assert (=> start!130608 true))

(declare-fun array_inv!38347 (array!101695) Bool)

(assert (=> start!130608 (array_inv!38347 a!2804)))

(declare-fun b!1530926 () Bool)

(declare-fun e!853399 () Bool)

(assert (=> b!1530926 (= e!853399 e!853402)))

(declare-fun res!1047141 () Bool)

(assert (=> b!1530926 (=> res!1047141 e!853402)))

(assert (=> b!1530926 (= res!1047141 (not (= lt!663003 (Found!13124 j!70))))))

(assert (=> b!1530926 (= lt!663001 lt!663002)))

(declare-fun lt!663000 () (_ BitVec 64))

(declare-fun lt!662998 () array!101695)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101695 (_ BitVec 32)) SeekEntryResult!13124)

(assert (=> b!1530926 (= lt!663002 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!663000 lt!662998 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101695 (_ BitVec 32)) SeekEntryResult!13124)

(assert (=> b!1530926 (= lt!663001 (seekEntryOrOpen!0 lt!663000 lt!662998 mask!2512))))

(assert (=> b!1530926 (= lt!663006 lt!663003)))

(assert (=> b!1530926 (= lt!663003 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49066 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1530926 (= lt!663006 (seekEntryOrOpen!0 (select (arr!49066 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530927 () Bool)

(declare-fun e!853401 () Bool)

(assert (=> b!1530927 (= e!853401 (not e!853399))))

(declare-fun res!1047147 () Bool)

(assert (=> b!1530927 (=> res!1047147 e!853399)))

(assert (=> b!1530927 (= res!1047147 (or (not (= (select (arr!49066 a!2804) j!70) lt!663000)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49066 a!2804) index!487) (select (arr!49066 a!2804) j!70)) (not (= (select (arr!49066 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1530927 e!853405))

(declare-fun res!1047143 () Bool)

(assert (=> b!1530927 (=> (not res!1047143) (not e!853405))))

(assert (=> b!1530927 (= res!1047143 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!663005 () Unit!51067)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51067)

(assert (=> b!1530927 (= lt!663005 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1530928 () Bool)

(declare-fun res!1047145 () Bool)

(assert (=> b!1530928 (=> (not res!1047145) (not e!853403))))

(assert (=> b!1530928 (= res!1047145 (validKeyInArray!0 (select (arr!49066 a!2804) i!961)))))

(declare-fun b!1530929 () Bool)

(assert (=> b!1530929 (= e!853400 e!853401)))

(declare-fun res!1047150 () Bool)

(assert (=> b!1530929 (=> (not res!1047150) (not e!853401))))

(assert (=> b!1530929 (= res!1047150 (= lt!662997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663000 mask!2512) lt!663000 lt!662998 mask!2512)))))

(assert (=> b!1530929 (= lt!663000 (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1530929 (= lt!662998 (array!101696 (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49617 a!2804)))))

(assert (= (and start!130608 res!1047138) b!1530921))

(assert (= (and b!1530921 res!1047140) b!1530928))

(assert (= (and b!1530928 res!1047145) b!1530918))

(assert (= (and b!1530918 res!1047146) b!1530924))

(assert (= (and b!1530924 res!1047144) b!1530922))

(assert (= (and b!1530922 res!1047149) b!1530925))

(assert (= (and b!1530925 res!1047139) b!1530920))

(assert (= (and b!1530920 res!1047148) b!1530919))

(assert (= (and b!1530919 res!1047142) b!1530929))

(assert (= (and b!1530929 res!1047150) b!1530927))

(assert (= (and b!1530927 res!1047143) b!1530923))

(assert (= (and b!1530927 (not res!1047147)) b!1530926))

(assert (= (and b!1530926 (not res!1047141)) b!1530917))

(declare-fun m!1413643 () Bool)

(assert (=> b!1530926 m!1413643))

(declare-fun m!1413645 () Bool)

(assert (=> b!1530926 m!1413645))

(assert (=> b!1530926 m!1413643))

(declare-fun m!1413647 () Bool)

(assert (=> b!1530926 m!1413647))

(declare-fun m!1413649 () Bool)

(assert (=> b!1530926 m!1413649))

(assert (=> b!1530926 m!1413643))

(declare-fun m!1413651 () Bool)

(assert (=> b!1530926 m!1413651))

(declare-fun m!1413653 () Bool)

(assert (=> b!1530917 m!1413653))

(assert (=> b!1530927 m!1413643))

(declare-fun m!1413655 () Bool)

(assert (=> b!1530927 m!1413655))

(declare-fun m!1413657 () Bool)

(assert (=> b!1530927 m!1413657))

(declare-fun m!1413659 () Bool)

(assert (=> b!1530927 m!1413659))

(assert (=> b!1530923 m!1413643))

(assert (=> b!1530923 m!1413643))

(declare-fun m!1413661 () Bool)

(assert (=> b!1530923 m!1413661))

(assert (=> b!1530919 m!1413643))

(assert (=> b!1530919 m!1413643))

(declare-fun m!1413663 () Bool)

(assert (=> b!1530919 m!1413663))

(declare-fun m!1413665 () Bool)

(assert (=> b!1530924 m!1413665))

(declare-fun m!1413667 () Bool)

(assert (=> start!130608 m!1413667))

(declare-fun m!1413669 () Bool)

(assert (=> start!130608 m!1413669))

(declare-fun m!1413671 () Bool)

(assert (=> b!1530922 m!1413671))

(assert (=> b!1530918 m!1413643))

(assert (=> b!1530918 m!1413643))

(declare-fun m!1413673 () Bool)

(assert (=> b!1530918 m!1413673))

(declare-fun m!1413675 () Bool)

(assert (=> b!1530928 m!1413675))

(assert (=> b!1530928 m!1413675))

(declare-fun m!1413677 () Bool)

(assert (=> b!1530928 m!1413677))

(assert (=> b!1530920 m!1413643))

(assert (=> b!1530920 m!1413643))

(declare-fun m!1413679 () Bool)

(assert (=> b!1530920 m!1413679))

(assert (=> b!1530920 m!1413679))

(assert (=> b!1530920 m!1413643))

(declare-fun m!1413681 () Bool)

(assert (=> b!1530920 m!1413681))

(declare-fun m!1413683 () Bool)

(assert (=> b!1530929 m!1413683))

(assert (=> b!1530929 m!1413683))

(declare-fun m!1413685 () Bool)

(assert (=> b!1530929 m!1413685))

(declare-fun m!1413687 () Bool)

(assert (=> b!1530929 m!1413687))

(declare-fun m!1413689 () Bool)

(assert (=> b!1530929 m!1413689))

(check-sat (not b!1530923) (not b!1530920) (not start!130608) (not b!1530924) (not b!1530926) (not b!1530928) (not b!1530929) (not b!1530917) (not b!1530922) (not b!1530927) (not b!1530919) (not b!1530918))
(check-sat)
