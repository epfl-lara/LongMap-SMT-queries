; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125192 () Bool)

(assert start!125192)

(declare-fun res!989825 () Bool)

(declare-fun e!820980 () Bool)

(assert (=> start!125192 (=> (not res!989825) (not e!820980))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125192 (= res!989825 (validMask!0 mask!2687))))

(assert (=> start!125192 e!820980))

(assert (=> start!125192 true))

(declare-datatypes ((array!98640 0))(
  ( (array!98641 (arr!47608 (Array (_ BitVec 32) (_ BitVec 64))) (size!48158 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98640)

(declare-fun array_inv!36636 (array!98640) Bool)

(assert (=> start!125192 (array_inv!36636 a!2862)))

(declare-fun b!1459980 () Bool)

(declare-fun e!820981 () Bool)

(declare-fun e!820985 () Bool)

(assert (=> b!1459980 (= e!820981 (not e!820985))))

(declare-fun res!989830 () Bool)

(assert (=> b!1459980 (=> res!989830 e!820985)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1459980 (= res!989830 (or (and (= (select (arr!47608 a!2862) index!646) (select (store (arr!47608 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47608 a!2862) index!646) (select (arr!47608 a!2862) j!93))) (= (select (arr!47608 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11860 0))(
  ( (MissingZero!11860 (index!49832 (_ BitVec 32))) (Found!11860 (index!49833 (_ BitVec 32))) (Intermediate!11860 (undefined!12672 Bool) (index!49834 (_ BitVec 32)) (x!131437 (_ BitVec 32))) (Undefined!11860) (MissingVacant!11860 (index!49835 (_ BitVec 32))) )
))
(declare-fun lt!639669 () SeekEntryResult!11860)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1459980 (and (= lt!639669 (Found!11860 j!93)) (or (= (select (arr!47608 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47608 a!2862) intermediateBeforeIndex!19) (select (arr!47608 a!2862) j!93))) (let ((bdg!53549 (select (store (arr!47608 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47608 a!2862) index!646) bdg!53549) (= (select (arr!47608 a!2862) index!646) (select (arr!47608 a!2862) j!93))) (= (select (arr!47608 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53549 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98640 (_ BitVec 32)) SeekEntryResult!11860)

(assert (=> b!1459980 (= lt!639669 (seekEntryOrOpen!0 (select (arr!47608 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98640 (_ BitVec 32)) Bool)

(assert (=> b!1459980 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49216 0))(
  ( (Unit!49217) )
))
(declare-fun lt!639665 () Unit!49216)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49216)

(assert (=> b!1459980 (= lt!639665 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459981 () Bool)

(declare-fun res!989822 () Bool)

(assert (=> b!1459981 (=> (not res!989822) (not e!820980))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1459981 (= res!989822 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48158 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48158 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48158 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459982 () Bool)

(declare-fun res!989820 () Bool)

(declare-fun e!820987 () Bool)

(assert (=> b!1459982 (=> res!989820 e!820987)))

(declare-fun e!820983 () Bool)

(assert (=> b!1459982 (= res!989820 e!820983)))

(declare-fun c!134592 () Bool)

(assert (=> b!1459982 (= c!134592 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459983 () Bool)

(declare-fun res!989833 () Bool)

(assert (=> b!1459983 (=> (not res!989833) (not e!820980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459983 (= res!989833 (validKeyInArray!0 (select (arr!47608 a!2862) i!1006)))))

(declare-fun b!1459984 () Bool)

(declare-fun lt!639670 () (_ BitVec 32))

(declare-fun lt!639666 () (_ BitVec 64))

(declare-fun lt!639664 () array!98640)

(declare-fun lt!639671 () SeekEntryResult!11860)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98640 (_ BitVec 32)) SeekEntryResult!11860)

(assert (=> b!1459984 (= e!820983 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639670 intermediateAfterIndex!19 lt!639666 lt!639664 mask!2687) lt!639671)))))

(declare-fun b!1459985 () Bool)

(declare-fun res!989821 () Bool)

(assert (=> b!1459985 (=> res!989821 e!820987)))

(assert (=> b!1459985 (= res!989821 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1459986 () Bool)

(declare-fun e!820982 () Bool)

(assert (=> b!1459986 (= e!820980 e!820982)))

(declare-fun res!989819 () Bool)

(assert (=> b!1459986 (=> (not res!989819) (not e!820982))))

(assert (=> b!1459986 (= res!989819 (= (select (store (arr!47608 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459986 (= lt!639664 (array!98641 (store (arr!47608 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48158 a!2862)))))

(declare-fun b!1459987 () Bool)

(declare-fun res!989836 () Bool)

(declare-fun e!820988 () Bool)

(assert (=> b!1459987 (=> (not res!989836) (not e!820988))))

(declare-fun lt!639672 () SeekEntryResult!11860)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98640 (_ BitVec 32)) SeekEntryResult!11860)

(assert (=> b!1459987 (= res!989836 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47608 a!2862) j!93) a!2862 mask!2687) lt!639672))))

(declare-fun b!1459988 () Bool)

(assert (=> b!1459988 (= e!820987 true)))

(assert (=> b!1459988 (= lt!639669 lt!639671)))

(declare-fun lt!639668 () Unit!49216)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49216)

(assert (=> b!1459988 (= lt!639668 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639670 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459989 () Bool)

(declare-fun res!989826 () Bool)

(assert (=> b!1459989 (=> (not res!989826) (not e!820980))))

(assert (=> b!1459989 (= res!989826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459990 () Bool)

(assert (=> b!1459990 (= e!820985 e!820987)))

(declare-fun res!989831 () Bool)

(assert (=> b!1459990 (=> res!989831 e!820987)))

(assert (=> b!1459990 (= res!989831 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639670 #b00000000000000000000000000000000) (bvsge lt!639670 (size!48158 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459990 (= lt!639670 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1459990 (= lt!639671 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639666 lt!639664 mask!2687))))

(assert (=> b!1459990 (= lt!639671 (seekEntryOrOpen!0 lt!639666 lt!639664 mask!2687))))

(declare-fun b!1459991 () Bool)

(declare-fun res!989829 () Bool)

(assert (=> b!1459991 (=> (not res!989829) (not e!820981))))

(declare-fun e!820984 () Bool)

(assert (=> b!1459991 (= res!989829 e!820984)))

(declare-fun c!134591 () Bool)

(assert (=> b!1459991 (= c!134591 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459992 () Bool)

(declare-fun res!989828 () Bool)

(assert (=> b!1459992 (=> (not res!989828) (not e!820981))))

(assert (=> b!1459992 (= res!989828 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459993 () Bool)

(declare-fun res!989835 () Bool)

(assert (=> b!1459993 (=> (not res!989835) (not e!820980))))

(assert (=> b!1459993 (= res!989835 (and (= (size!48158 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48158 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48158 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459994 () Bool)

(declare-fun res!989832 () Bool)

(assert (=> b!1459994 (=> (not res!989832) (not e!820980))))

(assert (=> b!1459994 (= res!989832 (validKeyInArray!0 (select (arr!47608 a!2862) j!93)))))

(declare-fun b!1459995 () Bool)

(assert (=> b!1459995 (= e!820982 e!820988)))

(declare-fun res!989834 () Bool)

(assert (=> b!1459995 (=> (not res!989834) (not e!820988))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459995 (= res!989834 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47608 a!2862) j!93) mask!2687) (select (arr!47608 a!2862) j!93) a!2862 mask!2687) lt!639672))))

(assert (=> b!1459995 (= lt!639672 (Intermediate!11860 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459996 () Bool)

(declare-fun lt!639667 () SeekEntryResult!11860)

(assert (=> b!1459996 (= e!820983 (not (= lt!639667 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639670 lt!639666 lt!639664 mask!2687))))))

(declare-fun b!1459997 () Bool)

(assert (=> b!1459997 (= e!820988 e!820981)))

(declare-fun res!989827 () Bool)

(assert (=> b!1459997 (=> (not res!989827) (not e!820981))))

(assert (=> b!1459997 (= res!989827 (= lt!639667 (Intermediate!11860 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1459997 (= lt!639667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639666 mask!2687) lt!639666 lt!639664 mask!2687))))

(assert (=> b!1459997 (= lt!639666 (select (store (arr!47608 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459998 () Bool)

(declare-fun res!989824 () Bool)

(assert (=> b!1459998 (=> res!989824 e!820987)))

(assert (=> b!1459998 (= res!989824 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639670 (select (arr!47608 a!2862) j!93) a!2862 mask!2687) lt!639672)))))

(declare-fun b!1459999 () Bool)

(assert (=> b!1459999 (= e!820984 (= lt!639667 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639666 lt!639664 mask!2687)))))

(declare-fun b!1460000 () Bool)

(assert (=> b!1460000 (= e!820984 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639666 lt!639664 mask!2687) (seekEntryOrOpen!0 lt!639666 lt!639664 mask!2687)))))

(declare-fun b!1460001 () Bool)

(declare-fun res!989823 () Bool)

(assert (=> b!1460001 (=> (not res!989823) (not e!820980))))

(declare-datatypes ((List!34109 0))(
  ( (Nil!34106) (Cons!34105 (h!35455 (_ BitVec 64)) (t!48803 List!34109)) )
))
(declare-fun arrayNoDuplicates!0 (array!98640 (_ BitVec 32) List!34109) Bool)

(assert (=> b!1460001 (= res!989823 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34106))))

(assert (= (and start!125192 res!989825) b!1459993))

(assert (= (and b!1459993 res!989835) b!1459983))

(assert (= (and b!1459983 res!989833) b!1459994))

(assert (= (and b!1459994 res!989832) b!1459989))

(assert (= (and b!1459989 res!989826) b!1460001))

(assert (= (and b!1460001 res!989823) b!1459981))

(assert (= (and b!1459981 res!989822) b!1459986))

(assert (= (and b!1459986 res!989819) b!1459995))

(assert (= (and b!1459995 res!989834) b!1459987))

(assert (= (and b!1459987 res!989836) b!1459997))

(assert (= (and b!1459997 res!989827) b!1459991))

(assert (= (and b!1459991 c!134591) b!1459999))

(assert (= (and b!1459991 (not c!134591)) b!1460000))

(assert (= (and b!1459991 res!989829) b!1459992))

(assert (= (and b!1459992 res!989828) b!1459980))

(assert (= (and b!1459980 (not res!989830)) b!1459990))

(assert (= (and b!1459990 (not res!989831)) b!1459998))

(assert (= (and b!1459998 (not res!989824)) b!1459982))

(assert (= (and b!1459982 c!134592) b!1459996))

(assert (= (and b!1459982 (not c!134592)) b!1459984))

(assert (= (and b!1459982 (not res!989820)) b!1459985))

(assert (= (and b!1459985 (not res!989821)) b!1459988))

(declare-fun m!1347691 () Bool)

(assert (=> b!1459990 m!1347691))

(declare-fun m!1347693 () Bool)

(assert (=> b!1459990 m!1347693))

(declare-fun m!1347695 () Bool)

(assert (=> b!1459990 m!1347695))

(declare-fun m!1347697 () Bool)

(assert (=> b!1460001 m!1347697))

(declare-fun m!1347699 () Bool)

(assert (=> b!1459995 m!1347699))

(assert (=> b!1459995 m!1347699))

(declare-fun m!1347701 () Bool)

(assert (=> b!1459995 m!1347701))

(assert (=> b!1459995 m!1347701))

(assert (=> b!1459995 m!1347699))

(declare-fun m!1347703 () Bool)

(assert (=> b!1459995 m!1347703))

(assert (=> b!1459998 m!1347699))

(assert (=> b!1459998 m!1347699))

(declare-fun m!1347705 () Bool)

(assert (=> b!1459998 m!1347705))

(declare-fun m!1347707 () Bool)

(assert (=> b!1459999 m!1347707))

(declare-fun m!1347709 () Bool)

(assert (=> b!1459997 m!1347709))

(assert (=> b!1459997 m!1347709))

(declare-fun m!1347711 () Bool)

(assert (=> b!1459997 m!1347711))

(declare-fun m!1347713 () Bool)

(assert (=> b!1459997 m!1347713))

(declare-fun m!1347715 () Bool)

(assert (=> b!1459997 m!1347715))

(assert (=> b!1459987 m!1347699))

(assert (=> b!1459987 m!1347699))

(declare-fun m!1347717 () Bool)

(assert (=> b!1459987 m!1347717))

(declare-fun m!1347719 () Bool)

(assert (=> b!1459989 m!1347719))

(declare-fun m!1347721 () Bool)

(assert (=> b!1459980 m!1347721))

(assert (=> b!1459980 m!1347713))

(declare-fun m!1347723 () Bool)

(assert (=> b!1459980 m!1347723))

(declare-fun m!1347725 () Bool)

(assert (=> b!1459980 m!1347725))

(declare-fun m!1347727 () Bool)

(assert (=> b!1459980 m!1347727))

(assert (=> b!1459980 m!1347699))

(declare-fun m!1347729 () Bool)

(assert (=> b!1459980 m!1347729))

(declare-fun m!1347731 () Bool)

(assert (=> b!1459980 m!1347731))

(assert (=> b!1459980 m!1347699))

(assert (=> b!1459986 m!1347713))

(declare-fun m!1347733 () Bool)

(assert (=> b!1459986 m!1347733))

(assert (=> b!1460000 m!1347693))

(assert (=> b!1460000 m!1347695))

(declare-fun m!1347735 () Bool)

(assert (=> b!1459984 m!1347735))

(declare-fun m!1347737 () Bool)

(assert (=> b!1459983 m!1347737))

(assert (=> b!1459983 m!1347737))

(declare-fun m!1347739 () Bool)

(assert (=> b!1459983 m!1347739))

(declare-fun m!1347741 () Bool)

(assert (=> b!1459988 m!1347741))

(declare-fun m!1347743 () Bool)

(assert (=> start!125192 m!1347743))

(declare-fun m!1347745 () Bool)

(assert (=> start!125192 m!1347745))

(declare-fun m!1347747 () Bool)

(assert (=> b!1459996 m!1347747))

(assert (=> b!1459994 m!1347699))

(assert (=> b!1459994 m!1347699))

(declare-fun m!1347749 () Bool)

(assert (=> b!1459994 m!1347749))

(push 1)

