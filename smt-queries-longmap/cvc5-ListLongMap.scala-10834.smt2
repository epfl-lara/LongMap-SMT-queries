; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126850 () Bool)

(assert start!126850)

(declare-fun b!1489662 () Bool)

(declare-fun res!1013081 () Bool)

(declare-fun e!834863 () Bool)

(assert (=> b!1489662 (=> (not res!1013081) (not e!834863))))

(declare-fun e!834860 () Bool)

(assert (=> b!1489662 (= res!1013081 e!834860)))

(declare-fun c!137826 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1489662 (= c!137826 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1013075 () Bool)

(declare-fun e!834857 () Bool)

(assert (=> start!126850 (=> (not res!1013075) (not e!834857))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126850 (= res!1013075 (validMask!0 mask!2687))))

(assert (=> start!126850 e!834857))

(assert (=> start!126850 true))

(declare-datatypes ((array!99623 0))(
  ( (array!99624 (arr!48083 (Array (_ BitVec 32) (_ BitVec 64))) (size!48633 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99623)

(declare-fun array_inv!37111 (array!99623) Bool)

(assert (=> start!126850 (array_inv!37111 a!2862)))

(declare-fun lt!649645 () (_ BitVec 32))

(declare-fun b!1489663 () Bool)

(declare-datatypes ((SeekEntryResult!12323 0))(
  ( (MissingZero!12323 (index!51684 (_ BitVec 32))) (Found!12323 (index!51685 (_ BitVec 32))) (Intermediate!12323 (undefined!13135 Bool) (index!51686 (_ BitVec 32)) (x!133283 (_ BitVec 32))) (Undefined!12323) (MissingVacant!12323 (index!51687 (_ BitVec 32))) )
))
(declare-fun lt!649644 () SeekEntryResult!12323)

(declare-fun e!834858 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!649649 () array!99623)

(declare-fun lt!649647 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99623 (_ BitVec 32)) SeekEntryResult!12323)

(assert (=> b!1489663 (= e!834858 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649645 intermediateAfterIndex!19 lt!649647 lt!649649 mask!2687) lt!649644)))))

(declare-fun b!1489664 () Bool)

(declare-fun e!834856 () Bool)

(declare-fun e!834861 () Bool)

(assert (=> b!1489664 (= e!834856 e!834861)))

(declare-fun res!1013083 () Bool)

(assert (=> b!1489664 (=> (not res!1013083) (not e!834861))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!649646 () SeekEntryResult!12323)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99623 (_ BitVec 32)) SeekEntryResult!12323)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489664 (= res!1013083 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48083 a!2862) j!93) mask!2687) (select (arr!48083 a!2862) j!93) a!2862 mask!2687) lt!649646))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1489664 (= lt!649646 (Intermediate!12323 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489665 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99623 (_ BitVec 32)) SeekEntryResult!12323)

(assert (=> b!1489665 (= e!834860 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649647 lt!649649 mask!2687) (seekEntryOrOpen!0 lt!649647 lt!649649 mask!2687)))))

(declare-fun b!1489666 () Bool)

(declare-fun res!1013070 () Bool)

(assert (=> b!1489666 (=> (not res!1013070) (not e!834857))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1489666 (= res!1013070 (and (= (size!48633 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48633 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48633 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489667 () Bool)

(declare-fun res!1013077 () Bool)

(declare-fun e!834859 () Bool)

(assert (=> b!1489667 (=> res!1013077 e!834859)))

(assert (=> b!1489667 (= res!1013077 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1489668 () Bool)

(declare-fun res!1013073 () Bool)

(assert (=> b!1489668 (=> (not res!1013073) (not e!834857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99623 (_ BitVec 32)) Bool)

(assert (=> b!1489668 (= res!1013073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489669 () Bool)

(declare-fun res!1013074 () Bool)

(assert (=> b!1489669 (=> (not res!1013074) (not e!834863))))

(assert (=> b!1489669 (= res!1013074 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1489670 () Bool)

(declare-fun res!1013068 () Bool)

(assert (=> b!1489670 (=> res!1013068 e!834859)))

(assert (=> b!1489670 (= res!1013068 e!834858)))

(declare-fun c!137825 () Bool)

(assert (=> b!1489670 (= c!137825 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489671 () Bool)

(declare-fun e!834862 () Bool)

(assert (=> b!1489671 (= e!834863 (not e!834862))))

(declare-fun res!1013069 () Bool)

(assert (=> b!1489671 (=> res!1013069 e!834862)))

(assert (=> b!1489671 (= res!1013069 (or (and (= (select (arr!48083 a!2862) index!646) (select (store (arr!48083 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48083 a!2862) index!646) (select (arr!48083 a!2862) j!93))) (= (select (arr!48083 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun lt!649643 () SeekEntryResult!12323)

(assert (=> b!1489671 (and (= lt!649643 (Found!12323 j!93)) (or (= (select (arr!48083 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48083 a!2862) intermediateBeforeIndex!19) (select (arr!48083 a!2862) j!93))) (let ((bdg!54738 (select (store (arr!48083 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48083 a!2862) index!646) bdg!54738) (= (select (arr!48083 a!2862) index!646) (select (arr!48083 a!2862) j!93))) (= (select (arr!48083 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54738 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1489671 (= lt!649643 (seekEntryOrOpen!0 (select (arr!48083 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1489671 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49986 0))(
  ( (Unit!49987) )
))
(declare-fun lt!649648 () Unit!49986)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49986)

(assert (=> b!1489671 (= lt!649648 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489672 () Bool)

(declare-fun lt!649642 () SeekEntryResult!12323)

(assert (=> b!1489672 (= e!834860 (= lt!649642 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649647 lt!649649 mask!2687)))))

(declare-fun b!1489673 () Bool)

(declare-fun res!1013072 () Bool)

(assert (=> b!1489673 (=> (not res!1013072) (not e!834857))))

(assert (=> b!1489673 (= res!1013072 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48633 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48633 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48633 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1489674 () Bool)

(declare-fun res!1013067 () Bool)

(assert (=> b!1489674 (=> (not res!1013067) (not e!834857))))

(declare-datatypes ((List!34584 0))(
  ( (Nil!34581) (Cons!34580 (h!35963 (_ BitVec 64)) (t!49278 List!34584)) )
))
(declare-fun arrayNoDuplicates!0 (array!99623 (_ BitVec 32) List!34584) Bool)

(assert (=> b!1489674 (= res!1013067 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34581))))

(declare-fun b!1489675 () Bool)

(assert (=> b!1489675 (= e!834862 e!834859)))

(declare-fun res!1013080 () Bool)

(assert (=> b!1489675 (=> res!1013080 e!834859)))

(assert (=> b!1489675 (= res!1013080 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649645 #b00000000000000000000000000000000) (bvsge lt!649645 (size!48633 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489675 (= lt!649645 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1489675 (= lt!649644 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649647 lt!649649 mask!2687))))

(assert (=> b!1489675 (= lt!649644 (seekEntryOrOpen!0 lt!649647 lt!649649 mask!2687))))

(declare-fun b!1489676 () Bool)

(declare-fun res!1013076 () Bool)

(assert (=> b!1489676 (=> (not res!1013076) (not e!834861))))

(assert (=> b!1489676 (= res!1013076 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48083 a!2862) j!93) a!2862 mask!2687) lt!649646))))

(declare-fun b!1489677 () Bool)

(assert (=> b!1489677 (= e!834859 true)))

(assert (=> b!1489677 (= lt!649643 lt!649644)))

(declare-fun lt!649650 () Unit!49986)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49986)

(assert (=> b!1489677 (= lt!649650 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649645 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1489678 () Bool)

(declare-fun res!1013078 () Bool)

(assert (=> b!1489678 (=> (not res!1013078) (not e!834857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489678 (= res!1013078 (validKeyInArray!0 (select (arr!48083 a!2862) j!93)))))

(declare-fun b!1489679 () Bool)

(declare-fun res!1013082 () Bool)

(assert (=> b!1489679 (=> (not res!1013082) (not e!834857))))

(assert (=> b!1489679 (= res!1013082 (validKeyInArray!0 (select (arr!48083 a!2862) i!1006)))))

(declare-fun b!1489680 () Bool)

(assert (=> b!1489680 (= e!834857 e!834856)))

(declare-fun res!1013066 () Bool)

(assert (=> b!1489680 (=> (not res!1013066) (not e!834856))))

(assert (=> b!1489680 (= res!1013066 (= (select (store (arr!48083 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489680 (= lt!649649 (array!99624 (store (arr!48083 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48633 a!2862)))))

(declare-fun b!1489681 () Bool)

(assert (=> b!1489681 (= e!834861 e!834863)))

(declare-fun res!1013071 () Bool)

(assert (=> b!1489681 (=> (not res!1013071) (not e!834863))))

(assert (=> b!1489681 (= res!1013071 (= lt!649642 (Intermediate!12323 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1489681 (= lt!649642 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649647 mask!2687) lt!649647 lt!649649 mask!2687))))

(assert (=> b!1489681 (= lt!649647 (select (store (arr!48083 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489682 () Bool)

(assert (=> b!1489682 (= e!834858 (not (= lt!649642 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649645 lt!649647 lt!649649 mask!2687))))))

(declare-fun b!1489683 () Bool)

(declare-fun res!1013079 () Bool)

(assert (=> b!1489683 (=> res!1013079 e!834859)))

(assert (=> b!1489683 (= res!1013079 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649645 (select (arr!48083 a!2862) j!93) a!2862 mask!2687) lt!649646)))))

(assert (= (and start!126850 res!1013075) b!1489666))

(assert (= (and b!1489666 res!1013070) b!1489679))

(assert (= (and b!1489679 res!1013082) b!1489678))

(assert (= (and b!1489678 res!1013078) b!1489668))

(assert (= (and b!1489668 res!1013073) b!1489674))

(assert (= (and b!1489674 res!1013067) b!1489673))

(assert (= (and b!1489673 res!1013072) b!1489680))

(assert (= (and b!1489680 res!1013066) b!1489664))

(assert (= (and b!1489664 res!1013083) b!1489676))

(assert (= (and b!1489676 res!1013076) b!1489681))

(assert (= (and b!1489681 res!1013071) b!1489662))

(assert (= (and b!1489662 c!137826) b!1489672))

(assert (= (and b!1489662 (not c!137826)) b!1489665))

(assert (= (and b!1489662 res!1013081) b!1489669))

(assert (= (and b!1489669 res!1013074) b!1489671))

(assert (= (and b!1489671 (not res!1013069)) b!1489675))

(assert (= (and b!1489675 (not res!1013080)) b!1489683))

(assert (= (and b!1489683 (not res!1013079)) b!1489670))

(assert (= (and b!1489670 c!137825) b!1489682))

(assert (= (and b!1489670 (not c!137825)) b!1489663))

(assert (= (and b!1489670 (not res!1013068)) b!1489667))

(assert (= (and b!1489667 (not res!1013077)) b!1489677))

(declare-fun m!1373875 () Bool)

(assert (=> b!1489668 m!1373875))

(declare-fun m!1373877 () Bool)

(assert (=> b!1489663 m!1373877))

(declare-fun m!1373879 () Bool)

(assert (=> b!1489678 m!1373879))

(assert (=> b!1489678 m!1373879))

(declare-fun m!1373881 () Bool)

(assert (=> b!1489678 m!1373881))

(assert (=> b!1489683 m!1373879))

(assert (=> b!1489683 m!1373879))

(declare-fun m!1373883 () Bool)

(assert (=> b!1489683 m!1373883))

(declare-fun m!1373885 () Bool)

(assert (=> b!1489674 m!1373885))

(assert (=> b!1489676 m!1373879))

(assert (=> b!1489676 m!1373879))

(declare-fun m!1373887 () Bool)

(assert (=> b!1489676 m!1373887))

(declare-fun m!1373889 () Bool)

(assert (=> b!1489681 m!1373889))

(assert (=> b!1489681 m!1373889))

(declare-fun m!1373891 () Bool)

(assert (=> b!1489681 m!1373891))

(declare-fun m!1373893 () Bool)

(assert (=> b!1489681 m!1373893))

(declare-fun m!1373895 () Bool)

(assert (=> b!1489681 m!1373895))

(assert (=> b!1489664 m!1373879))

(assert (=> b!1489664 m!1373879))

(declare-fun m!1373897 () Bool)

(assert (=> b!1489664 m!1373897))

(assert (=> b!1489664 m!1373897))

(assert (=> b!1489664 m!1373879))

(declare-fun m!1373899 () Bool)

(assert (=> b!1489664 m!1373899))

(declare-fun m!1373901 () Bool)

(assert (=> b!1489679 m!1373901))

(assert (=> b!1489679 m!1373901))

(declare-fun m!1373903 () Bool)

(assert (=> b!1489679 m!1373903))

(declare-fun m!1373905 () Bool)

(assert (=> b!1489682 m!1373905))

(declare-fun m!1373907 () Bool)

(assert (=> start!126850 m!1373907))

(declare-fun m!1373909 () Bool)

(assert (=> start!126850 m!1373909))

(declare-fun m!1373911 () Bool)

(assert (=> b!1489665 m!1373911))

(declare-fun m!1373913 () Bool)

(assert (=> b!1489665 m!1373913))

(assert (=> b!1489680 m!1373893))

(declare-fun m!1373915 () Bool)

(assert (=> b!1489680 m!1373915))

(declare-fun m!1373917 () Bool)

(assert (=> b!1489671 m!1373917))

(assert (=> b!1489671 m!1373893))

(declare-fun m!1373919 () Bool)

(assert (=> b!1489671 m!1373919))

(declare-fun m!1373921 () Bool)

(assert (=> b!1489671 m!1373921))

(declare-fun m!1373923 () Bool)

(assert (=> b!1489671 m!1373923))

(assert (=> b!1489671 m!1373879))

(declare-fun m!1373925 () Bool)

(assert (=> b!1489671 m!1373925))

(declare-fun m!1373927 () Bool)

(assert (=> b!1489671 m!1373927))

(assert (=> b!1489671 m!1373879))

(declare-fun m!1373929 () Bool)

(assert (=> b!1489677 m!1373929))

(declare-fun m!1373931 () Bool)

(assert (=> b!1489675 m!1373931))

(assert (=> b!1489675 m!1373911))

(assert (=> b!1489675 m!1373913))

(declare-fun m!1373933 () Bool)

(assert (=> b!1489672 m!1373933))

(push 1)

