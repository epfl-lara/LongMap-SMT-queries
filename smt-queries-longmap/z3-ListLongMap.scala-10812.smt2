; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126470 () Bool)

(assert start!126470)

(declare-fun b!1483801 () Bool)

(declare-fun res!1008838 () Bool)

(declare-fun e!831923 () Bool)

(assert (=> b!1483801 (=> (not res!1008838) (not e!831923))))

(declare-datatypes ((array!99430 0))(
  ( (array!99431 (arr!47992 (Array (_ BitVec 32) (_ BitVec 64))) (size!48544 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99430)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99430 (_ BitVec 32)) Bool)

(assert (=> b!1483801 (= res!1008838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483802 () Bool)

(declare-fun res!1008842 () Bool)

(assert (=> b!1483802 (=> (not res!1008842) (not e!831923))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483802 (= res!1008842 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48544 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48544 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48544 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483803 () Bool)

(declare-fun res!1008831 () Bool)

(assert (=> b!1483803 (=> (not res!1008831) (not e!831923))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483803 (= res!1008831 (validKeyInArray!0 (select (arr!47992 a!2862) i!1006)))))

(declare-fun b!1483804 () Bool)

(declare-fun e!831927 () Bool)

(declare-fun e!831924 () Bool)

(assert (=> b!1483804 (= e!831927 e!831924)))

(declare-fun res!1008836 () Bool)

(assert (=> b!1483804 (=> (not res!1008836) (not e!831924))))

(declare-datatypes ((SeekEntryResult!12257 0))(
  ( (MissingZero!12257 (index!51420 (_ BitVec 32))) (Found!12257 (index!51421 (_ BitVec 32))) (Intermediate!12257 (undefined!13069 Bool) (index!51422 (_ BitVec 32)) (x!132998 (_ BitVec 32))) (Undefined!12257) (MissingVacant!12257 (index!51423 (_ BitVec 32))) )
))
(declare-fun lt!647368 () SeekEntryResult!12257)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99430 (_ BitVec 32)) SeekEntryResult!12257)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483804 (= res!1008836 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47992 a!2862) j!93) mask!2687) (select (arr!47992 a!2862) j!93) a!2862 mask!2687) lt!647368))))

(assert (=> b!1483804 (= lt!647368 (Intermediate!12257 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483805 () Bool)

(assert (=> b!1483805 (= e!831923 e!831927)))

(declare-fun res!1008843 () Bool)

(assert (=> b!1483805 (=> (not res!1008843) (not e!831927))))

(assert (=> b!1483805 (= res!1008843 (= (select (store (arr!47992 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647367 () array!99430)

(assert (=> b!1483805 (= lt!647367 (array!99431 (store (arr!47992 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48544 a!2862)))))

(declare-fun res!1008834 () Bool)

(assert (=> start!126470 (=> (not res!1008834) (not e!831923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126470 (= res!1008834 (validMask!0 mask!2687))))

(assert (=> start!126470 e!831923))

(assert (=> start!126470 true))

(declare-fun array_inv!37225 (array!99430) Bool)

(assert (=> start!126470 (array_inv!37225 a!2862)))

(declare-fun b!1483806 () Bool)

(declare-fun res!1008845 () Bool)

(assert (=> b!1483806 (=> (not res!1008845) (not e!831923))))

(assert (=> b!1483806 (= res!1008845 (and (= (size!48544 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48544 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48544 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483807 () Bool)

(declare-fun res!1008840 () Bool)

(assert (=> b!1483807 (=> (not res!1008840) (not e!831923))))

(declare-datatypes ((List!34571 0))(
  ( (Nil!34568) (Cons!34567 (h!35941 (_ BitVec 64)) (t!49257 List!34571)) )
))
(declare-fun arrayNoDuplicates!0 (array!99430 (_ BitVec 32) List!34571) Bool)

(assert (=> b!1483807 (= res!1008840 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34568))))

(declare-fun b!1483808 () Bool)

(declare-fun res!1008832 () Bool)

(assert (=> b!1483808 (=> (not res!1008832) (not e!831923))))

(assert (=> b!1483808 (= res!1008832 (validKeyInArray!0 (select (arr!47992 a!2862) j!93)))))

(declare-fun b!1483809 () Bool)

(declare-fun res!1008846 () Bool)

(declare-fun e!831929 () Bool)

(assert (=> b!1483809 (=> (not res!1008846) (not e!831929))))

(declare-fun e!831920 () Bool)

(assert (=> b!1483809 (= res!1008846 e!831920)))

(declare-fun c!137011 () Bool)

(assert (=> b!1483809 (= c!137011 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483810 () Bool)

(declare-fun res!1008837 () Bool)

(declare-fun e!831925 () Bool)

(assert (=> b!1483810 (=> (not res!1008837) (not e!831925))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99430 (_ BitVec 32)) SeekEntryResult!12257)

(assert (=> b!1483810 (= res!1008837 (= (seekEntryOrOpen!0 (select (arr!47992 a!2862) j!93) a!2862 mask!2687) (Found!12257 j!93)))))

(declare-fun b!1483811 () Bool)

(declare-fun res!1008835 () Bool)

(assert (=> b!1483811 (=> (not res!1008835) (not e!831929))))

(assert (=> b!1483811 (= res!1008835 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483812 () Bool)

(declare-fun res!1008830 () Bool)

(assert (=> b!1483812 (=> (not res!1008830) (not e!831924))))

(assert (=> b!1483812 (= res!1008830 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47992 a!2862) j!93) a!2862 mask!2687) lt!647368))))

(declare-fun b!1483813 () Bool)

(declare-fun e!831922 () Bool)

(assert (=> b!1483813 (= e!831929 (not e!831922))))

(declare-fun res!1008841 () Bool)

(assert (=> b!1483813 (=> res!1008841 e!831922)))

(assert (=> b!1483813 (= res!1008841 (or (and (= (select (arr!47992 a!2862) index!646) (select (store (arr!47992 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47992 a!2862) index!646) (select (arr!47992 a!2862) j!93))) (= (select (arr!47992 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483813 e!831925))

(declare-fun res!1008844 () Bool)

(assert (=> b!1483813 (=> (not res!1008844) (not e!831925))))

(assert (=> b!1483813 (= res!1008844 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49695 0))(
  ( (Unit!49696) )
))
(declare-fun lt!647372 () Unit!49695)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49695)

(assert (=> b!1483813 (= lt!647372 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!647371 () (_ BitVec 64))

(declare-fun b!1483814 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99430 (_ BitVec 32)) SeekEntryResult!12257)

(assert (=> b!1483814 (= e!831920 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647371 lt!647367 mask!2687) (seekEntryOrOpen!0 lt!647371 lt!647367 mask!2687)))))

(declare-fun e!831921 () Bool)

(declare-fun b!1483815 () Bool)

(assert (=> b!1483815 (= e!831921 (= (seekEntryOrOpen!0 lt!647371 lt!647367 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647371 lt!647367 mask!2687)))))

(declare-fun lt!647369 () SeekEntryResult!12257)

(declare-fun b!1483816 () Bool)

(assert (=> b!1483816 (= e!831920 (= lt!647369 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647371 lt!647367 mask!2687)))))

(declare-fun b!1483817 () Bool)

(declare-fun res!1008829 () Bool)

(assert (=> b!1483817 (=> (not res!1008829) (not e!831925))))

(assert (=> b!1483817 (= res!1008829 (or (= (select (arr!47992 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47992 a!2862) intermediateBeforeIndex!19) (select (arr!47992 a!2862) j!93))))))

(declare-fun b!1483818 () Bool)

(declare-fun e!831928 () Bool)

(assert (=> b!1483818 (= e!831928 e!831921)))

(declare-fun res!1008833 () Bool)

(assert (=> b!1483818 (=> (not res!1008833) (not e!831921))))

(declare-fun lt!647370 () (_ BitVec 64))

(assert (=> b!1483818 (= res!1008833 (and (= index!646 intermediateAfterIndex!19) (= lt!647370 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483819 () Bool)

(assert (=> b!1483819 (= e!831924 e!831929)))

(declare-fun res!1008847 () Bool)

(assert (=> b!1483819 (=> (not res!1008847) (not e!831929))))

(assert (=> b!1483819 (= res!1008847 (= lt!647369 (Intermediate!12257 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1483819 (= lt!647369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647371 mask!2687) lt!647371 lt!647367 mask!2687))))

(assert (=> b!1483819 (= lt!647371 (select (store (arr!47992 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483820 () Bool)

(assert (=> b!1483820 (= e!831925 e!831928)))

(declare-fun res!1008839 () Bool)

(assert (=> b!1483820 (=> res!1008839 e!831928)))

(assert (=> b!1483820 (= res!1008839 (or (and (= (select (arr!47992 a!2862) index!646) lt!647370) (= (select (arr!47992 a!2862) index!646) (select (arr!47992 a!2862) j!93))) (= (select (arr!47992 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483820 (= lt!647370 (select (store (arr!47992 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483821 () Bool)

(assert (=> b!1483821 (= e!831922 true)))

(declare-fun lt!647366 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483821 (= lt!647366 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (= (and start!126470 res!1008834) b!1483806))

(assert (= (and b!1483806 res!1008845) b!1483803))

(assert (= (and b!1483803 res!1008831) b!1483808))

(assert (= (and b!1483808 res!1008832) b!1483801))

(assert (= (and b!1483801 res!1008838) b!1483807))

(assert (= (and b!1483807 res!1008840) b!1483802))

(assert (= (and b!1483802 res!1008842) b!1483805))

(assert (= (and b!1483805 res!1008843) b!1483804))

(assert (= (and b!1483804 res!1008836) b!1483812))

(assert (= (and b!1483812 res!1008830) b!1483819))

(assert (= (and b!1483819 res!1008847) b!1483809))

(assert (= (and b!1483809 c!137011) b!1483816))

(assert (= (and b!1483809 (not c!137011)) b!1483814))

(assert (= (and b!1483809 res!1008846) b!1483811))

(assert (= (and b!1483811 res!1008835) b!1483813))

(assert (= (and b!1483813 res!1008844) b!1483810))

(assert (= (and b!1483810 res!1008837) b!1483817))

(assert (= (and b!1483817 res!1008829) b!1483820))

(assert (= (and b!1483820 (not res!1008839)) b!1483818))

(assert (= (and b!1483818 res!1008833) b!1483815))

(assert (= (and b!1483813 (not res!1008841)) b!1483821))

(declare-fun m!1368621 () Bool)

(assert (=> b!1483807 m!1368621))

(declare-fun m!1368623 () Bool)

(assert (=> b!1483803 m!1368623))

(assert (=> b!1483803 m!1368623))

(declare-fun m!1368625 () Bool)

(assert (=> b!1483803 m!1368625))

(declare-fun m!1368627 () Bool)

(assert (=> b!1483813 m!1368627))

(declare-fun m!1368629 () Bool)

(assert (=> b!1483813 m!1368629))

(declare-fun m!1368631 () Bool)

(assert (=> b!1483813 m!1368631))

(declare-fun m!1368633 () Bool)

(assert (=> b!1483813 m!1368633))

(declare-fun m!1368635 () Bool)

(assert (=> b!1483813 m!1368635))

(declare-fun m!1368637 () Bool)

(assert (=> b!1483813 m!1368637))

(assert (=> b!1483810 m!1368637))

(assert (=> b!1483810 m!1368637))

(declare-fun m!1368639 () Bool)

(assert (=> b!1483810 m!1368639))

(declare-fun m!1368641 () Bool)

(assert (=> b!1483817 m!1368641))

(assert (=> b!1483817 m!1368637))

(declare-fun m!1368643 () Bool)

(assert (=> b!1483814 m!1368643))

(declare-fun m!1368645 () Bool)

(assert (=> b!1483814 m!1368645))

(declare-fun m!1368647 () Bool)

(assert (=> start!126470 m!1368647))

(declare-fun m!1368649 () Bool)

(assert (=> start!126470 m!1368649))

(declare-fun m!1368651 () Bool)

(assert (=> b!1483819 m!1368651))

(assert (=> b!1483819 m!1368651))

(declare-fun m!1368653 () Bool)

(assert (=> b!1483819 m!1368653))

(assert (=> b!1483819 m!1368629))

(declare-fun m!1368655 () Bool)

(assert (=> b!1483819 m!1368655))

(assert (=> b!1483820 m!1368633))

(assert (=> b!1483820 m!1368637))

(assert (=> b!1483820 m!1368629))

(assert (=> b!1483820 m!1368631))

(assert (=> b!1483815 m!1368645))

(assert (=> b!1483815 m!1368643))

(declare-fun m!1368657 () Bool)

(assert (=> b!1483816 m!1368657))

(assert (=> b!1483805 m!1368629))

(declare-fun m!1368659 () Bool)

(assert (=> b!1483805 m!1368659))

(assert (=> b!1483812 m!1368637))

(assert (=> b!1483812 m!1368637))

(declare-fun m!1368661 () Bool)

(assert (=> b!1483812 m!1368661))

(assert (=> b!1483808 m!1368637))

(assert (=> b!1483808 m!1368637))

(declare-fun m!1368663 () Bool)

(assert (=> b!1483808 m!1368663))

(declare-fun m!1368665 () Bool)

(assert (=> b!1483801 m!1368665))

(declare-fun m!1368667 () Bool)

(assert (=> b!1483821 m!1368667))

(assert (=> b!1483804 m!1368637))

(assert (=> b!1483804 m!1368637))

(declare-fun m!1368669 () Bool)

(assert (=> b!1483804 m!1368669))

(assert (=> b!1483804 m!1368669))

(assert (=> b!1483804 m!1368637))

(declare-fun m!1368671 () Bool)

(assert (=> b!1483804 m!1368671))

(check-sat (not b!1483815) (not start!126470) (not b!1483801) (not b!1483810) (not b!1483816) (not b!1483813) (not b!1483807) (not b!1483803) (not b!1483804) (not b!1483814) (not b!1483808) (not b!1483819) (not b!1483812) (not b!1483821))
(check-sat)
