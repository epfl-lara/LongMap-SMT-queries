; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126852 () Bool)

(assert start!126852)

(declare-fun res!1013136 () Bool)

(declare-fun e!834887 () Bool)

(assert (=> start!126852 (=> (not res!1013136) (not e!834887))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126852 (= res!1013136 (validMask!0 mask!2687))))

(assert (=> start!126852 e!834887))

(assert (=> start!126852 true))

(declare-datatypes ((array!99625 0))(
  ( (array!99626 (arr!48084 (Array (_ BitVec 32) (_ BitVec 64))) (size!48634 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99625)

(declare-fun array_inv!37112 (array!99625) Bool)

(assert (=> start!126852 (array_inv!37112 a!2862)))

(declare-fun b!1489728 () Bool)

(declare-fun e!834890 () Bool)

(declare-fun e!834885 () Bool)

(assert (=> b!1489728 (= e!834890 (not e!834885))))

(declare-fun res!1013124 () Bool)

(assert (=> b!1489728 (=> res!1013124 e!834885)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1489728 (= res!1013124 (or (and (= (select (arr!48084 a!2862) index!646) (select (store (arr!48084 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48084 a!2862) index!646) (select (arr!48084 a!2862) j!93))) (= (select (arr!48084 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12324 0))(
  ( (MissingZero!12324 (index!51688 (_ BitVec 32))) (Found!12324 (index!51689 (_ BitVec 32))) (Intermediate!12324 (undefined!13136 Bool) (index!51690 (_ BitVec 32)) (x!133284 (_ BitVec 32))) (Undefined!12324) (MissingVacant!12324 (index!51691 (_ BitVec 32))) )
))
(declare-fun lt!649671 () SeekEntryResult!12324)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1489728 (and (= lt!649671 (Found!12324 j!93)) (or (= (select (arr!48084 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48084 a!2862) intermediateBeforeIndex!19) (select (arr!48084 a!2862) j!93))) (let ((bdg!54740 (select (store (arr!48084 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48084 a!2862) index!646) bdg!54740) (= (select (arr!48084 a!2862) index!646) (select (arr!48084 a!2862) j!93))) (= (select (arr!48084 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54740 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99625 (_ BitVec 32)) SeekEntryResult!12324)

(assert (=> b!1489728 (= lt!649671 (seekEntryOrOpen!0 (select (arr!48084 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99625 (_ BitVec 32)) Bool)

(assert (=> b!1489728 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49988 0))(
  ( (Unit!49989) )
))
(declare-fun lt!649677 () Unit!49988)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49988)

(assert (=> b!1489728 (= lt!649677 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489729 () Bool)

(declare-fun e!834883 () Bool)

(assert (=> b!1489729 (= e!834885 e!834883)))

(declare-fun res!1013125 () Bool)

(assert (=> b!1489729 (=> res!1013125 e!834883)))

(declare-fun lt!649670 () (_ BitVec 32))

(assert (=> b!1489729 (= res!1013125 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649670 #b00000000000000000000000000000000) (bvsge lt!649670 (size!48634 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489729 (= lt!649670 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!649672 () array!99625)

(declare-fun lt!649669 () (_ BitVec 64))

(declare-fun lt!649675 () SeekEntryResult!12324)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99625 (_ BitVec 32)) SeekEntryResult!12324)

(assert (=> b!1489729 (= lt!649675 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649669 lt!649672 mask!2687))))

(assert (=> b!1489729 (= lt!649675 (seekEntryOrOpen!0 lt!649669 lt!649672 mask!2687))))

(declare-fun e!834882 () Bool)

(declare-fun b!1489730 () Bool)

(assert (=> b!1489730 (= e!834882 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649669 lt!649672 mask!2687) (seekEntryOrOpen!0 lt!649669 lt!649672 mask!2687)))))

(declare-fun b!1489731 () Bool)

(declare-fun e!834884 () Bool)

(declare-fun e!834886 () Bool)

(assert (=> b!1489731 (= e!834884 e!834886)))

(declare-fun res!1013123 () Bool)

(assert (=> b!1489731 (=> (not res!1013123) (not e!834886))))

(declare-fun lt!649673 () SeekEntryResult!12324)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99625 (_ BitVec 32)) SeekEntryResult!12324)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489731 (= res!1013123 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48084 a!2862) j!93) mask!2687) (select (arr!48084 a!2862) j!93) a!2862 mask!2687) lt!649673))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1489731 (= lt!649673 (Intermediate!12324 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489732 () Bool)

(declare-fun res!1013122 () Bool)

(assert (=> b!1489732 (=> (not res!1013122) (not e!834887))))

(assert (=> b!1489732 (= res!1013122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489733 () Bool)

(declare-fun res!1013137 () Bool)

(assert (=> b!1489733 (=> (not res!1013137) (not e!834886))))

(assert (=> b!1489733 (= res!1013137 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48084 a!2862) j!93) a!2862 mask!2687) lt!649673))))

(declare-fun b!1489734 () Bool)

(declare-fun res!1013131 () Bool)

(assert (=> b!1489734 (=> (not res!1013131) (not e!834887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489734 (= res!1013131 (validKeyInArray!0 (select (arr!48084 a!2862) i!1006)))))

(declare-fun b!1489735 () Bool)

(declare-fun res!1013132 () Bool)

(assert (=> b!1489735 (=> res!1013132 e!834883)))

(declare-fun e!834888 () Bool)

(assert (=> b!1489735 (= res!1013132 e!834888)))

(declare-fun c!137832 () Bool)

(assert (=> b!1489735 (= c!137832 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489736 () Bool)

(assert (=> b!1489736 (= e!834883 true)))

(assert (=> b!1489736 (= lt!649671 lt!649675)))

(declare-fun lt!649676 () Unit!49988)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49988)

(assert (=> b!1489736 (= lt!649676 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649670 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1489737 () Bool)

(declare-fun res!1013130 () Bool)

(assert (=> b!1489737 (=> (not res!1013130) (not e!834890))))

(assert (=> b!1489737 (= res!1013130 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1489738 () Bool)

(assert (=> b!1489738 (= e!834886 e!834890)))

(declare-fun res!1013128 () Bool)

(assert (=> b!1489738 (=> (not res!1013128) (not e!834890))))

(declare-fun lt!649674 () SeekEntryResult!12324)

(assert (=> b!1489738 (= res!1013128 (= lt!649674 (Intermediate!12324 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1489738 (= lt!649674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649669 mask!2687) lt!649669 lt!649672 mask!2687))))

(assert (=> b!1489738 (= lt!649669 (select (store (arr!48084 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489739 () Bool)

(assert (=> b!1489739 (= e!834887 e!834884)))

(declare-fun res!1013126 () Bool)

(assert (=> b!1489739 (=> (not res!1013126) (not e!834884))))

(assert (=> b!1489739 (= res!1013126 (= (select (store (arr!48084 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489739 (= lt!649672 (array!99626 (store (arr!48084 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48634 a!2862)))))

(declare-fun b!1489740 () Bool)

(declare-fun res!1013134 () Bool)

(assert (=> b!1489740 (=> (not res!1013134) (not e!834887))))

(assert (=> b!1489740 (= res!1013134 (and (= (size!48634 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48634 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48634 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489741 () Bool)

(declare-fun res!1013133 () Bool)

(assert (=> b!1489741 (=> (not res!1013133) (not e!834890))))

(assert (=> b!1489741 (= res!1013133 e!834882)))

(declare-fun c!137831 () Bool)

(assert (=> b!1489741 (= c!137831 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489742 () Bool)

(declare-fun res!1013135 () Bool)

(assert (=> b!1489742 (=> (not res!1013135) (not e!834887))))

(assert (=> b!1489742 (= res!1013135 (validKeyInArray!0 (select (arr!48084 a!2862) j!93)))))

(declare-fun b!1489743 () Bool)

(declare-fun res!1013120 () Bool)

(assert (=> b!1489743 (=> (not res!1013120) (not e!834887))))

(declare-datatypes ((List!34585 0))(
  ( (Nil!34582) (Cons!34581 (h!35964 (_ BitVec 64)) (t!49279 List!34585)) )
))
(declare-fun arrayNoDuplicates!0 (array!99625 (_ BitVec 32) List!34585) Bool)

(assert (=> b!1489743 (= res!1013120 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34582))))

(declare-fun b!1489744 () Bool)

(declare-fun res!1013129 () Bool)

(assert (=> b!1489744 (=> res!1013129 e!834883)))

(assert (=> b!1489744 (= res!1013129 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649670 (select (arr!48084 a!2862) j!93) a!2862 mask!2687) lt!649673)))))

(declare-fun b!1489745 () Bool)

(assert (=> b!1489745 (= e!834888 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649670 intermediateAfterIndex!19 lt!649669 lt!649672 mask!2687) lt!649675)))))

(declare-fun b!1489746 () Bool)

(assert (=> b!1489746 (= e!834882 (= lt!649674 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649669 lt!649672 mask!2687)))))

(declare-fun b!1489747 () Bool)

(assert (=> b!1489747 (= e!834888 (not (= lt!649674 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649670 lt!649669 lt!649672 mask!2687))))))

(declare-fun b!1489748 () Bool)

(declare-fun res!1013121 () Bool)

(assert (=> b!1489748 (=> res!1013121 e!834883)))

(assert (=> b!1489748 (= res!1013121 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1489749 () Bool)

(declare-fun res!1013127 () Bool)

(assert (=> b!1489749 (=> (not res!1013127) (not e!834887))))

(assert (=> b!1489749 (= res!1013127 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48634 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48634 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48634 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126852 res!1013136) b!1489740))

(assert (= (and b!1489740 res!1013134) b!1489734))

(assert (= (and b!1489734 res!1013131) b!1489742))

(assert (= (and b!1489742 res!1013135) b!1489732))

(assert (= (and b!1489732 res!1013122) b!1489743))

(assert (= (and b!1489743 res!1013120) b!1489749))

(assert (= (and b!1489749 res!1013127) b!1489739))

(assert (= (and b!1489739 res!1013126) b!1489731))

(assert (= (and b!1489731 res!1013123) b!1489733))

(assert (= (and b!1489733 res!1013137) b!1489738))

(assert (= (and b!1489738 res!1013128) b!1489741))

(assert (= (and b!1489741 c!137831) b!1489746))

(assert (= (and b!1489741 (not c!137831)) b!1489730))

(assert (= (and b!1489741 res!1013133) b!1489737))

(assert (= (and b!1489737 res!1013130) b!1489728))

(assert (= (and b!1489728 (not res!1013124)) b!1489729))

(assert (= (and b!1489729 (not res!1013125)) b!1489744))

(assert (= (and b!1489744 (not res!1013129)) b!1489735))

(assert (= (and b!1489735 c!137832) b!1489747))

(assert (= (and b!1489735 (not c!137832)) b!1489745))

(assert (= (and b!1489735 (not res!1013132)) b!1489748))

(assert (= (and b!1489748 (not res!1013121)) b!1489736))

(declare-fun m!1373935 () Bool)

(assert (=> b!1489745 m!1373935))

(declare-fun m!1373937 () Bool)

(assert (=> b!1489728 m!1373937))

(declare-fun m!1373939 () Bool)

(assert (=> b!1489728 m!1373939))

(declare-fun m!1373941 () Bool)

(assert (=> b!1489728 m!1373941))

(declare-fun m!1373943 () Bool)

(assert (=> b!1489728 m!1373943))

(declare-fun m!1373945 () Bool)

(assert (=> b!1489728 m!1373945))

(declare-fun m!1373947 () Bool)

(assert (=> b!1489728 m!1373947))

(declare-fun m!1373949 () Bool)

(assert (=> b!1489728 m!1373949))

(declare-fun m!1373951 () Bool)

(assert (=> b!1489728 m!1373951))

(assert (=> b!1489728 m!1373947))

(assert (=> b!1489739 m!1373939))

(declare-fun m!1373953 () Bool)

(assert (=> b!1489739 m!1373953))

(declare-fun m!1373955 () Bool)

(assert (=> b!1489747 m!1373955))

(declare-fun m!1373957 () Bool)

(assert (=> b!1489729 m!1373957))

(declare-fun m!1373959 () Bool)

(assert (=> b!1489729 m!1373959))

(declare-fun m!1373961 () Bool)

(assert (=> b!1489729 m!1373961))

(declare-fun m!1373963 () Bool)

(assert (=> b!1489746 m!1373963))

(assert (=> b!1489730 m!1373959))

(assert (=> b!1489730 m!1373961))

(assert (=> b!1489731 m!1373947))

(assert (=> b!1489731 m!1373947))

(declare-fun m!1373965 () Bool)

(assert (=> b!1489731 m!1373965))

(assert (=> b!1489731 m!1373965))

(assert (=> b!1489731 m!1373947))

(declare-fun m!1373967 () Bool)

(assert (=> b!1489731 m!1373967))

(declare-fun m!1373969 () Bool)

(assert (=> b!1489743 m!1373969))

(assert (=> b!1489744 m!1373947))

(assert (=> b!1489744 m!1373947))

(declare-fun m!1373971 () Bool)

(assert (=> b!1489744 m!1373971))

(declare-fun m!1373973 () Bool)

(assert (=> b!1489736 m!1373973))

(assert (=> b!1489733 m!1373947))

(assert (=> b!1489733 m!1373947))

(declare-fun m!1373975 () Bool)

(assert (=> b!1489733 m!1373975))

(declare-fun m!1373977 () Bool)

(assert (=> b!1489734 m!1373977))

(assert (=> b!1489734 m!1373977))

(declare-fun m!1373979 () Bool)

(assert (=> b!1489734 m!1373979))

(declare-fun m!1373981 () Bool)

(assert (=> b!1489738 m!1373981))

(assert (=> b!1489738 m!1373981))

(declare-fun m!1373983 () Bool)

(assert (=> b!1489738 m!1373983))

(assert (=> b!1489738 m!1373939))

(declare-fun m!1373985 () Bool)

(assert (=> b!1489738 m!1373985))

(declare-fun m!1373987 () Bool)

(assert (=> b!1489732 m!1373987))

(assert (=> b!1489742 m!1373947))

(assert (=> b!1489742 m!1373947))

(declare-fun m!1373989 () Bool)

(assert (=> b!1489742 m!1373989))

(declare-fun m!1373991 () Bool)

(assert (=> start!126852 m!1373991))

(declare-fun m!1373993 () Bool)

(assert (=> start!126852 m!1373993))

(check-sat (not b!1489744) (not b!1489746) (not b!1489728) (not b!1489731) (not b!1489736) (not b!1489729) (not b!1489743) (not b!1489745) (not b!1489747) (not b!1489730) (not start!126852) (not b!1489742) (not b!1489734) (not b!1489732) (not b!1489733) (not b!1489738))
(check-sat)
