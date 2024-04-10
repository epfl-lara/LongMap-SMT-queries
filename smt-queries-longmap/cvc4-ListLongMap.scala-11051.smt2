; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129142 () Bool)

(assert start!129142)

(declare-fun res!1035494 () Bool)

(declare-fun e!845768 () Bool)

(assert (=> start!129142 (=> (not res!1035494) (not e!845768))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129142 (= res!1035494 (validMask!0 mask!2512))))

(assert (=> start!129142 e!845768))

(assert (=> start!129142 true))

(declare-datatypes ((array!100998 0))(
  ( (array!100999 (arr!48736 (Array (_ BitVec 32) (_ BitVec 64))) (size!49286 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100998)

(declare-fun array_inv!37764 (array!100998) Bool)

(assert (=> start!129142 (array_inv!37764 a!2804)))

(declare-fun b!1515587 () Bool)

(declare-fun res!1035500 () Bool)

(assert (=> b!1515587 (=> (not res!1035500) (not e!845768))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1515587 (= res!1035500 (and (= (size!49286 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49286 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49286 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515588 () Bool)

(declare-fun res!1035497 () Bool)

(assert (=> b!1515588 (=> (not res!1035497) (not e!845768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100998 (_ BitVec 32)) Bool)

(assert (=> b!1515588 (= res!1035497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515589 () Bool)

(declare-fun e!845770 () Bool)

(declare-fun e!845769 () Bool)

(assert (=> b!1515589 (= e!845770 e!845769)))

(declare-fun res!1035502 () Bool)

(assert (=> b!1515589 (=> (not res!1035502) (not e!845769))))

(declare-fun lt!656986 () array!100998)

(declare-datatypes ((SeekEntryResult!12907 0))(
  ( (MissingZero!12907 (index!54023 (_ BitVec 32))) (Found!12907 (index!54024 (_ BitVec 32))) (Intermediate!12907 (undefined!13719 Bool) (index!54025 (_ BitVec 32)) (x!135721 (_ BitVec 32))) (Undefined!12907) (MissingVacant!12907 (index!54026 (_ BitVec 32))) )
))
(declare-fun lt!656984 () SeekEntryResult!12907)

(declare-fun lt!656983 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100998 (_ BitVec 32)) SeekEntryResult!12907)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515589 (= res!1035502 (= lt!656984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656983 mask!2512) lt!656983 lt!656986 mask!2512)))))

(assert (=> b!1515589 (= lt!656983 (select (store (arr!48736 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515589 (= lt!656986 (array!100999 (store (arr!48736 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49286 a!2804)))))

(declare-fun b!1515590 () Bool)

(declare-fun e!845765 () Bool)

(assert (=> b!1515590 (= e!845765 true)))

(declare-fun lt!656988 () SeekEntryResult!12907)

(declare-fun lt!656981 () SeekEntryResult!12907)

(assert (=> b!1515590 (= lt!656988 lt!656981)))

(declare-datatypes ((Unit!50682 0))(
  ( (Unit!50683) )
))
(declare-fun lt!656987 () Unit!50682)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100998 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50682)

(assert (=> b!1515590 (= lt!656987 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515591 () Bool)

(declare-fun e!845767 () Bool)

(assert (=> b!1515591 (= e!845767 e!845765)))

(declare-fun res!1035491 () Bool)

(assert (=> b!1515591 (=> res!1035491 e!845765)))

(assert (=> b!1515591 (= res!1035491 (not (= lt!656981 (Found!12907 j!70))))))

(declare-fun lt!656985 () SeekEntryResult!12907)

(assert (=> b!1515591 (= lt!656985 lt!656988)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100998 (_ BitVec 32)) SeekEntryResult!12907)

(assert (=> b!1515591 (= lt!656988 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656983 lt!656986 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100998 (_ BitVec 32)) SeekEntryResult!12907)

(assert (=> b!1515591 (= lt!656985 (seekEntryOrOpen!0 lt!656983 lt!656986 mask!2512))))

(declare-fun lt!656982 () SeekEntryResult!12907)

(assert (=> b!1515591 (= lt!656982 lt!656981)))

(assert (=> b!1515591 (= lt!656981 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48736 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515591 (= lt!656982 (seekEntryOrOpen!0 (select (arr!48736 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515592 () Bool)

(declare-fun e!845766 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100998 (_ BitVec 32)) SeekEntryResult!12907)

(assert (=> b!1515592 (= e!845766 (= (seekEntry!0 (select (arr!48736 a!2804) j!70) a!2804 mask!2512) (Found!12907 j!70)))))

(declare-fun b!1515593 () Bool)

(declare-fun res!1035501 () Bool)

(assert (=> b!1515593 (=> (not res!1035501) (not e!845768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515593 (= res!1035501 (validKeyInArray!0 (select (arr!48736 a!2804) i!961)))))

(declare-fun b!1515594 () Bool)

(declare-fun res!1035498 () Bool)

(assert (=> b!1515594 (=> (not res!1035498) (not e!845768))))

(assert (=> b!1515594 (= res!1035498 (validKeyInArray!0 (select (arr!48736 a!2804) j!70)))))

(declare-fun b!1515595 () Bool)

(declare-fun res!1035493 () Bool)

(assert (=> b!1515595 (=> (not res!1035493) (not e!845768))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515595 (= res!1035493 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49286 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49286 a!2804))))))

(declare-fun b!1515596 () Bool)

(assert (=> b!1515596 (= e!845769 (not e!845767))))

(declare-fun res!1035492 () Bool)

(assert (=> b!1515596 (=> res!1035492 e!845767)))

(assert (=> b!1515596 (= res!1035492 (or (not (= (select (arr!48736 a!2804) j!70) lt!656983)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48736 a!2804) index!487) (select (arr!48736 a!2804) j!70)) (not (= (select (arr!48736 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1515596 e!845766))

(declare-fun res!1035496 () Bool)

(assert (=> b!1515596 (=> (not res!1035496) (not e!845766))))

(assert (=> b!1515596 (= res!1035496 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!656989 () Unit!50682)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100998 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50682)

(assert (=> b!1515596 (= lt!656989 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515597 () Bool)

(assert (=> b!1515597 (= e!845768 e!845770)))

(declare-fun res!1035495 () Bool)

(assert (=> b!1515597 (=> (not res!1035495) (not e!845770))))

(declare-fun lt!656980 () SeekEntryResult!12907)

(assert (=> b!1515597 (= res!1035495 (= lt!656984 lt!656980))))

(assert (=> b!1515597 (= lt!656980 (Intermediate!12907 false resIndex!21 resX!21))))

(assert (=> b!1515597 (= lt!656984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48736 a!2804) j!70) mask!2512) (select (arr!48736 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515598 () Bool)

(declare-fun res!1035499 () Bool)

(assert (=> b!1515598 (=> (not res!1035499) (not e!845770))))

(assert (=> b!1515598 (= res!1035499 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48736 a!2804) j!70) a!2804 mask!2512) lt!656980))))

(declare-fun b!1515599 () Bool)

(declare-fun res!1035490 () Bool)

(assert (=> b!1515599 (=> (not res!1035490) (not e!845768))))

(declare-datatypes ((List!35219 0))(
  ( (Nil!35216) (Cons!35215 (h!36627 (_ BitVec 64)) (t!49913 List!35219)) )
))
(declare-fun arrayNoDuplicates!0 (array!100998 (_ BitVec 32) List!35219) Bool)

(assert (=> b!1515599 (= res!1035490 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35216))))

(assert (= (and start!129142 res!1035494) b!1515587))

(assert (= (and b!1515587 res!1035500) b!1515593))

(assert (= (and b!1515593 res!1035501) b!1515594))

(assert (= (and b!1515594 res!1035498) b!1515588))

(assert (= (and b!1515588 res!1035497) b!1515599))

(assert (= (and b!1515599 res!1035490) b!1515595))

(assert (= (and b!1515595 res!1035493) b!1515597))

(assert (= (and b!1515597 res!1035495) b!1515598))

(assert (= (and b!1515598 res!1035499) b!1515589))

(assert (= (and b!1515589 res!1035502) b!1515596))

(assert (= (and b!1515596 res!1035496) b!1515592))

(assert (= (and b!1515596 (not res!1035492)) b!1515591))

(assert (= (and b!1515591 (not res!1035491)) b!1515590))

(declare-fun m!1398727 () Bool)

(assert (=> b!1515591 m!1398727))

(declare-fun m!1398729 () Bool)

(assert (=> b!1515591 m!1398729))

(assert (=> b!1515591 m!1398727))

(declare-fun m!1398731 () Bool)

(assert (=> b!1515591 m!1398731))

(assert (=> b!1515591 m!1398727))

(declare-fun m!1398733 () Bool)

(assert (=> b!1515591 m!1398733))

(declare-fun m!1398735 () Bool)

(assert (=> b!1515591 m!1398735))

(declare-fun m!1398737 () Bool)

(assert (=> start!129142 m!1398737))

(declare-fun m!1398739 () Bool)

(assert (=> start!129142 m!1398739))

(declare-fun m!1398741 () Bool)

(assert (=> b!1515593 m!1398741))

(assert (=> b!1515593 m!1398741))

(declare-fun m!1398743 () Bool)

(assert (=> b!1515593 m!1398743))

(assert (=> b!1515592 m!1398727))

(assert (=> b!1515592 m!1398727))

(declare-fun m!1398745 () Bool)

(assert (=> b!1515592 m!1398745))

(declare-fun m!1398747 () Bool)

(assert (=> b!1515599 m!1398747))

(assert (=> b!1515594 m!1398727))

(assert (=> b!1515594 m!1398727))

(declare-fun m!1398749 () Bool)

(assert (=> b!1515594 m!1398749))

(declare-fun m!1398751 () Bool)

(assert (=> b!1515590 m!1398751))

(declare-fun m!1398753 () Bool)

(assert (=> b!1515589 m!1398753))

(assert (=> b!1515589 m!1398753))

(declare-fun m!1398755 () Bool)

(assert (=> b!1515589 m!1398755))

(declare-fun m!1398757 () Bool)

(assert (=> b!1515589 m!1398757))

(declare-fun m!1398759 () Bool)

(assert (=> b!1515589 m!1398759))

(assert (=> b!1515597 m!1398727))

(assert (=> b!1515597 m!1398727))

(declare-fun m!1398761 () Bool)

(assert (=> b!1515597 m!1398761))

(assert (=> b!1515597 m!1398761))

(assert (=> b!1515597 m!1398727))

(declare-fun m!1398763 () Bool)

(assert (=> b!1515597 m!1398763))

(assert (=> b!1515596 m!1398727))

(declare-fun m!1398765 () Bool)

(assert (=> b!1515596 m!1398765))

(declare-fun m!1398767 () Bool)

(assert (=> b!1515596 m!1398767))

(declare-fun m!1398769 () Bool)

(assert (=> b!1515596 m!1398769))

(assert (=> b!1515598 m!1398727))

(assert (=> b!1515598 m!1398727))

(declare-fun m!1398771 () Bool)

(assert (=> b!1515598 m!1398771))

(declare-fun m!1398773 () Bool)

(assert (=> b!1515588 m!1398773))

(push 1)

