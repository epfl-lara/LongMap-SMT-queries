; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125158 () Bool)

(assert start!125158)

(declare-fun b!1458858 () Bool)

(declare-fun res!988903 () Bool)

(declare-fun e!820525 () Bool)

(assert (=> b!1458858 (=> res!988903 e!820525)))

(declare-fun e!820524 () Bool)

(assert (=> b!1458858 (= res!988903 e!820524)))

(declare-fun c!134489 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1458858 (= c!134489 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun lt!639207 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11843 0))(
  ( (MissingZero!11843 (index!49764 (_ BitVec 32))) (Found!11843 (index!49765 (_ BitVec 32))) (Intermediate!11843 (undefined!12655 Bool) (index!49766 (_ BitVec 32)) (x!131380 (_ BitVec 32))) (Undefined!11843) (MissingVacant!11843 (index!49767 (_ BitVec 32))) )
))
(declare-fun lt!639213 () SeekEntryResult!11843)

(declare-fun b!1458860 () Bool)

(declare-fun lt!639206 () (_ BitVec 64))

(declare-datatypes ((array!98606 0))(
  ( (array!98607 (arr!47591 (Array (_ BitVec 32) (_ BitVec 64))) (size!48141 (_ BitVec 32))) )
))
(declare-fun lt!639208 () array!98606)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98606 (_ BitVec 32)) SeekEntryResult!11843)

(assert (=> b!1458860 (= e!820524 (not (= lt!639213 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639207 lt!639206 lt!639208 mask!2687))))))

(declare-fun b!1458861 () Bool)

(declare-fun e!820522 () Bool)

(declare-fun e!820521 () Bool)

(assert (=> b!1458861 (= e!820522 (not e!820521))))

(declare-fun res!988904 () Bool)

(assert (=> b!1458861 (=> res!988904 e!820521)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98606)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1458861 (= res!988904 (or (and (= (select (arr!47591 a!2862) index!646) (select (store (arr!47591 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47591 a!2862) index!646) (select (arr!47591 a!2862) j!93))) (= (select (arr!47591 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!639205 () SeekEntryResult!11843)

(assert (=> b!1458861 (and (= lt!639205 (Found!11843 j!93)) (or (= (select (arr!47591 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47591 a!2862) intermediateBeforeIndex!19) (select (arr!47591 a!2862) j!93))) (let ((bdg!53465 (select (store (arr!47591 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47591 a!2862) index!646) bdg!53465) (= (select (arr!47591 a!2862) index!646) (select (arr!47591 a!2862) j!93))) (= (select (arr!47591 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53465 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98606 (_ BitVec 32)) SeekEntryResult!11843)

(assert (=> b!1458861 (= lt!639205 (seekEntryOrOpen!0 (select (arr!47591 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98606 (_ BitVec 32)) Bool)

(assert (=> b!1458861 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49182 0))(
  ( (Unit!49183) )
))
(declare-fun lt!639211 () Unit!49182)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49182)

(assert (=> b!1458861 (= lt!639211 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458862 () Bool)

(declare-fun e!820529 () Bool)

(declare-fun e!820528 () Bool)

(assert (=> b!1458862 (= e!820529 e!820528)))

(declare-fun res!988913 () Bool)

(assert (=> b!1458862 (=> (not res!988913) (not e!820528))))

(declare-fun lt!639209 () SeekEntryResult!11843)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458862 (= res!988913 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47591 a!2862) j!93) mask!2687) (select (arr!47591 a!2862) j!93) a!2862 mask!2687) lt!639209))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1458862 (= lt!639209 (Intermediate!11843 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458863 () Bool)

(declare-fun res!988908 () Bool)

(declare-fun e!820527 () Bool)

(assert (=> b!1458863 (=> (not res!988908) (not e!820527))))

(assert (=> b!1458863 (= res!988908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458864 () Bool)

(declare-fun res!988912 () Bool)

(assert (=> b!1458864 (=> (not res!988912) (not e!820527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458864 (= res!988912 (validKeyInArray!0 (select (arr!47591 a!2862) j!93)))))

(declare-fun b!1458865 () Bool)

(declare-fun res!988918 () Bool)

(assert (=> b!1458865 (=> (not res!988918) (not e!820528))))

(assert (=> b!1458865 (= res!988918 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47591 a!2862) j!93) a!2862 mask!2687) lt!639209))))

(declare-fun b!1458866 () Bool)

(declare-fun res!988911 () Bool)

(assert (=> b!1458866 (=> (not res!988911) (not e!820527))))

(assert (=> b!1458866 (= res!988911 (and (= (size!48141 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48141 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48141 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458867 () Bool)

(declare-fun res!988902 () Bool)

(assert (=> b!1458867 (=> res!988902 e!820525)))

(assert (=> b!1458867 (= res!988902 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1458868 () Bool)

(assert (=> b!1458868 (= e!820521 e!820525)))

(declare-fun res!988914 () Bool)

(assert (=> b!1458868 (=> res!988914 e!820525)))

(assert (=> b!1458868 (= res!988914 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639207 #b00000000000000000000000000000000) (bvsge lt!639207 (size!48141 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458868 (= lt!639207 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!639212 () SeekEntryResult!11843)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98606 (_ BitVec 32)) SeekEntryResult!11843)

(assert (=> b!1458868 (= lt!639212 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639206 lt!639208 mask!2687))))

(assert (=> b!1458868 (= lt!639212 (seekEntryOrOpen!0 lt!639206 lt!639208 mask!2687))))

(declare-fun b!1458869 () Bool)

(declare-fun res!988901 () Bool)

(assert (=> b!1458869 (=> (not res!988901) (not e!820527))))

(declare-datatypes ((List!34092 0))(
  ( (Nil!34089) (Cons!34088 (h!35438 (_ BitVec 64)) (t!48786 List!34092)) )
))
(declare-fun arrayNoDuplicates!0 (array!98606 (_ BitVec 32) List!34092) Bool)

(assert (=> b!1458869 (= res!988901 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34089))))

(declare-fun b!1458870 () Bool)

(declare-fun res!988907 () Bool)

(assert (=> b!1458870 (=> (not res!988907) (not e!820522))))

(assert (=> b!1458870 (= res!988907 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458871 () Bool)

(declare-fun res!988909 () Bool)

(assert (=> b!1458871 (=> (not res!988909) (not e!820527))))

(assert (=> b!1458871 (= res!988909 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48141 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48141 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48141 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458872 () Bool)

(assert (=> b!1458872 (= e!820524 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639207 intermediateAfterIndex!19 lt!639206 lt!639208 mask!2687) lt!639212)))))

(declare-fun b!1458873 () Bool)

(declare-fun res!988917 () Bool)

(assert (=> b!1458873 (=> res!988917 e!820525)))

(assert (=> b!1458873 (= res!988917 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639207 (select (arr!47591 a!2862) j!93) a!2862 mask!2687) lt!639209)))))

(declare-fun b!1458874 () Bool)

(declare-fun res!988916 () Bool)

(assert (=> b!1458874 (=> (not res!988916) (not e!820527))))

(assert (=> b!1458874 (= res!988916 (validKeyInArray!0 (select (arr!47591 a!2862) i!1006)))))

(declare-fun b!1458875 () Bool)

(declare-fun res!988915 () Bool)

(assert (=> b!1458875 (=> (not res!988915) (not e!820522))))

(declare-fun e!820523 () Bool)

(assert (=> b!1458875 (= res!988915 e!820523)))

(declare-fun c!134490 () Bool)

(assert (=> b!1458875 (= c!134490 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!988906 () Bool)

(assert (=> start!125158 (=> (not res!988906) (not e!820527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125158 (= res!988906 (validMask!0 mask!2687))))

(assert (=> start!125158 e!820527))

(assert (=> start!125158 true))

(declare-fun array_inv!36619 (array!98606) Bool)

(assert (=> start!125158 (array_inv!36619 a!2862)))

(declare-fun b!1458859 () Bool)

(assert (=> b!1458859 (= e!820527 e!820529)))

(declare-fun res!988910 () Bool)

(assert (=> b!1458859 (=> (not res!988910) (not e!820529))))

(assert (=> b!1458859 (= res!988910 (= (select (store (arr!47591 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458859 (= lt!639208 (array!98607 (store (arr!47591 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48141 a!2862)))))

(declare-fun b!1458876 () Bool)

(assert (=> b!1458876 (= e!820525 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1458876 (= lt!639205 lt!639212)))

(declare-fun lt!639210 () Unit!49182)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49182)

(assert (=> b!1458876 (= lt!639210 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639207 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1458877 () Bool)

(assert (=> b!1458877 (= e!820523 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639206 lt!639208 mask!2687) (seekEntryOrOpen!0 lt!639206 lt!639208 mask!2687)))))

(declare-fun b!1458878 () Bool)

(assert (=> b!1458878 (= e!820528 e!820522)))

(declare-fun res!988905 () Bool)

(assert (=> b!1458878 (=> (not res!988905) (not e!820522))))

(assert (=> b!1458878 (= res!988905 (= lt!639213 (Intermediate!11843 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1458878 (= lt!639213 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639206 mask!2687) lt!639206 lt!639208 mask!2687))))

(assert (=> b!1458878 (= lt!639206 (select (store (arr!47591 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458879 () Bool)

(assert (=> b!1458879 (= e!820523 (= lt!639213 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639206 lt!639208 mask!2687)))))

(assert (= (and start!125158 res!988906) b!1458866))

(assert (= (and b!1458866 res!988911) b!1458874))

(assert (= (and b!1458874 res!988916) b!1458864))

(assert (= (and b!1458864 res!988912) b!1458863))

(assert (= (and b!1458863 res!988908) b!1458869))

(assert (= (and b!1458869 res!988901) b!1458871))

(assert (= (and b!1458871 res!988909) b!1458859))

(assert (= (and b!1458859 res!988910) b!1458862))

(assert (= (and b!1458862 res!988913) b!1458865))

(assert (= (and b!1458865 res!988918) b!1458878))

(assert (= (and b!1458878 res!988905) b!1458875))

(assert (= (and b!1458875 c!134490) b!1458879))

(assert (= (and b!1458875 (not c!134490)) b!1458877))

(assert (= (and b!1458875 res!988915) b!1458870))

(assert (= (and b!1458870 res!988907) b!1458861))

(assert (= (and b!1458861 (not res!988904)) b!1458868))

(assert (= (and b!1458868 (not res!988914)) b!1458873))

(assert (= (and b!1458873 (not res!988917)) b!1458858))

(assert (= (and b!1458858 c!134489) b!1458860))

(assert (= (and b!1458858 (not c!134489)) b!1458872))

(assert (= (and b!1458858 (not res!988903)) b!1458867))

(assert (= (and b!1458867 (not res!988902)) b!1458876))

(declare-fun m!1346671 () Bool)

(assert (=> b!1458865 m!1346671))

(assert (=> b!1458865 m!1346671))

(declare-fun m!1346673 () Bool)

(assert (=> b!1458865 m!1346673))

(declare-fun m!1346675 () Bool)

(assert (=> b!1458874 m!1346675))

(assert (=> b!1458874 m!1346675))

(declare-fun m!1346677 () Bool)

(assert (=> b!1458874 m!1346677))

(declare-fun m!1346679 () Bool)

(assert (=> b!1458868 m!1346679))

(declare-fun m!1346681 () Bool)

(assert (=> b!1458868 m!1346681))

(declare-fun m!1346683 () Bool)

(assert (=> b!1458868 m!1346683))

(declare-fun m!1346685 () Bool)

(assert (=> b!1458859 m!1346685))

(declare-fun m!1346687 () Bool)

(assert (=> b!1458859 m!1346687))

(declare-fun m!1346689 () Bool)

(assert (=> b!1458872 m!1346689))

(declare-fun m!1346691 () Bool)

(assert (=> b!1458860 m!1346691))

(assert (=> b!1458873 m!1346671))

(assert (=> b!1458873 m!1346671))

(declare-fun m!1346693 () Bool)

(assert (=> b!1458873 m!1346693))

(declare-fun m!1346695 () Bool)

(assert (=> b!1458869 m!1346695))

(assert (=> b!1458877 m!1346681))

(assert (=> b!1458877 m!1346683))

(assert (=> b!1458862 m!1346671))

(assert (=> b!1458862 m!1346671))

(declare-fun m!1346697 () Bool)

(assert (=> b!1458862 m!1346697))

(assert (=> b!1458862 m!1346697))

(assert (=> b!1458862 m!1346671))

(declare-fun m!1346699 () Bool)

(assert (=> b!1458862 m!1346699))

(declare-fun m!1346701 () Bool)

(assert (=> b!1458879 m!1346701))

(declare-fun m!1346703 () Bool)

(assert (=> start!125158 m!1346703))

(declare-fun m!1346705 () Bool)

(assert (=> start!125158 m!1346705))

(declare-fun m!1346707 () Bool)

(assert (=> b!1458863 m!1346707))

(declare-fun m!1346709 () Bool)

(assert (=> b!1458876 m!1346709))

(declare-fun m!1346711 () Bool)

(assert (=> b!1458861 m!1346711))

(assert (=> b!1458861 m!1346685))

(declare-fun m!1346713 () Bool)

(assert (=> b!1458861 m!1346713))

(declare-fun m!1346715 () Bool)

(assert (=> b!1458861 m!1346715))

(declare-fun m!1346717 () Bool)

(assert (=> b!1458861 m!1346717))

(assert (=> b!1458861 m!1346671))

(declare-fun m!1346719 () Bool)

(assert (=> b!1458861 m!1346719))

(declare-fun m!1346721 () Bool)

(assert (=> b!1458861 m!1346721))

(assert (=> b!1458861 m!1346671))

(assert (=> b!1458864 m!1346671))

(assert (=> b!1458864 m!1346671))

(declare-fun m!1346723 () Bool)

(assert (=> b!1458864 m!1346723))

(declare-fun m!1346725 () Bool)

(assert (=> b!1458878 m!1346725))

(assert (=> b!1458878 m!1346725))

(declare-fun m!1346727 () Bool)

(assert (=> b!1458878 m!1346727))

(assert (=> b!1458878 m!1346685))

(declare-fun m!1346729 () Bool)

(assert (=> b!1458878 m!1346729))

(push 1)

