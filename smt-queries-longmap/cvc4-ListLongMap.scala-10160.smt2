; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119728 () Bool)

(assert start!119728)

(declare-fun b!1394737 () Bool)

(declare-fun e!789638 () Bool)

(assert (=> b!1394737 (= e!789638 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95410 0))(
  ( (array!95411 (arr!46063 (Array (_ BitVec 32) (_ BitVec 64))) (size!46613 (_ BitVec 32))) )
))
(declare-fun lt!612703 () array!95410)

(declare-datatypes ((SeekEntryResult!10380 0))(
  ( (MissingZero!10380 (index!43891 (_ BitVec 32))) (Found!10380 (index!43892 (_ BitVec 32))) (Intermediate!10380 (undefined!11192 Bool) (index!43893 (_ BitVec 32)) (x!125552 (_ BitVec 32))) (Undefined!10380) (MissingVacant!10380 (index!43894 (_ BitVec 32))) )
))
(declare-fun lt!612704 () SeekEntryResult!10380)

(declare-fun lt!612706 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95410 (_ BitVec 32)) SeekEntryResult!10380)

(assert (=> b!1394737 (= lt!612704 (seekEntryOrOpen!0 lt!612706 lt!612703 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!612705 () (_ BitVec 32))

(declare-datatypes ((Unit!46764 0))(
  ( (Unit!46765) )
))
(declare-fun lt!612707 () Unit!46764)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!612708 () SeekEntryResult!10380)

(declare-fun a!2901 () array!95410)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95410 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46764)

(assert (=> b!1394737 (= lt!612707 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612705 (x!125552 lt!612708) (index!43893 lt!612708) mask!2840))))

(declare-fun b!1394738 () Bool)

(declare-fun res!934151 () Bool)

(declare-fun e!789637 () Bool)

(assert (=> b!1394738 (=> (not res!934151) (not e!789637))))

(declare-datatypes ((List!32582 0))(
  ( (Nil!32579) (Cons!32578 (h!33811 (_ BitVec 64)) (t!47276 List!32582)) )
))
(declare-fun arrayNoDuplicates!0 (array!95410 (_ BitVec 32) List!32582) Bool)

(assert (=> b!1394738 (= res!934151 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32579))))

(declare-fun b!1394739 () Bool)

(declare-fun e!789636 () Bool)

(assert (=> b!1394739 (= e!789636 e!789638)))

(declare-fun res!934147 () Bool)

(assert (=> b!1394739 (=> res!934147 e!789638)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95410 (_ BitVec 32)) SeekEntryResult!10380)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394739 (= res!934147 (not (= lt!612708 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612706 mask!2840) lt!612706 lt!612703 mask!2840))))))

(assert (=> b!1394739 (= lt!612706 (select (store (arr!46063 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394739 (= lt!612703 (array!95411 (store (arr!46063 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46613 a!2901)))))

(declare-fun res!934149 () Bool)

(assert (=> start!119728 (=> (not res!934149) (not e!789637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119728 (= res!934149 (validMask!0 mask!2840))))

(assert (=> start!119728 e!789637))

(assert (=> start!119728 true))

(declare-fun array_inv!35091 (array!95410) Bool)

(assert (=> start!119728 (array_inv!35091 a!2901)))

(declare-fun b!1394740 () Bool)

(declare-fun res!934153 () Bool)

(assert (=> b!1394740 (=> (not res!934153) (not e!789637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394740 (= res!934153 (validKeyInArray!0 (select (arr!46063 a!2901) i!1037)))))

(declare-fun b!1394741 () Bool)

(declare-fun res!934145 () Bool)

(assert (=> b!1394741 (=> (not res!934145) (not e!789637))))

(assert (=> b!1394741 (= res!934145 (validKeyInArray!0 (select (arr!46063 a!2901) j!112)))))

(declare-fun b!1394742 () Bool)

(declare-fun res!934150 () Bool)

(assert (=> b!1394742 (=> res!934150 e!789638)))

(assert (=> b!1394742 (= res!934150 (or (bvslt (x!125552 lt!612708) #b00000000000000000000000000000000) (bvsgt (x!125552 lt!612708) #b01111111111111111111111111111110) (bvslt lt!612705 #b00000000000000000000000000000000) (bvsge lt!612705 (size!46613 a!2901)) (bvslt (index!43893 lt!612708) #b00000000000000000000000000000000) (bvsge (index!43893 lt!612708) (size!46613 a!2901)) (not (= lt!612708 (Intermediate!10380 false (index!43893 lt!612708) (x!125552 lt!612708))))))))

(declare-fun b!1394743 () Bool)

(declare-fun res!934148 () Bool)

(assert (=> b!1394743 (=> (not res!934148) (not e!789637))))

(assert (=> b!1394743 (= res!934148 (and (= (size!46613 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46613 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46613 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394744 () Bool)

(assert (=> b!1394744 (= e!789637 (not e!789636))))

(declare-fun res!934146 () Bool)

(assert (=> b!1394744 (=> res!934146 e!789636)))

(assert (=> b!1394744 (= res!934146 (or (not (is-Intermediate!10380 lt!612708)) (undefined!11192 lt!612708)))))

(assert (=> b!1394744 (= lt!612704 (Found!10380 j!112))))

(assert (=> b!1394744 (= lt!612704 (seekEntryOrOpen!0 (select (arr!46063 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95410 (_ BitVec 32)) Bool)

(assert (=> b!1394744 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612702 () Unit!46764)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95410 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46764)

(assert (=> b!1394744 (= lt!612702 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394744 (= lt!612708 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612705 (select (arr!46063 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394744 (= lt!612705 (toIndex!0 (select (arr!46063 a!2901) j!112) mask!2840))))

(declare-fun b!1394745 () Bool)

(declare-fun res!934152 () Bool)

(assert (=> b!1394745 (=> (not res!934152) (not e!789637))))

(assert (=> b!1394745 (= res!934152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119728 res!934149) b!1394743))

(assert (= (and b!1394743 res!934148) b!1394740))

(assert (= (and b!1394740 res!934153) b!1394741))

(assert (= (and b!1394741 res!934145) b!1394745))

(assert (= (and b!1394745 res!934152) b!1394738))

(assert (= (and b!1394738 res!934151) b!1394744))

(assert (= (and b!1394744 (not res!934146)) b!1394739))

(assert (= (and b!1394739 (not res!934147)) b!1394742))

(assert (= (and b!1394742 (not res!934150)) b!1394737))

(declare-fun m!1281181 () Bool)

(assert (=> b!1394744 m!1281181))

(declare-fun m!1281183 () Bool)

(assert (=> b!1394744 m!1281183))

(assert (=> b!1394744 m!1281181))

(declare-fun m!1281185 () Bool)

(assert (=> b!1394744 m!1281185))

(assert (=> b!1394744 m!1281181))

(declare-fun m!1281187 () Bool)

(assert (=> b!1394744 m!1281187))

(assert (=> b!1394744 m!1281181))

(declare-fun m!1281189 () Bool)

(assert (=> b!1394744 m!1281189))

(declare-fun m!1281191 () Bool)

(assert (=> b!1394744 m!1281191))

(declare-fun m!1281193 () Bool)

(assert (=> b!1394745 m!1281193))

(declare-fun m!1281195 () Bool)

(assert (=> b!1394738 m!1281195))

(declare-fun m!1281197 () Bool)

(assert (=> b!1394740 m!1281197))

(assert (=> b!1394740 m!1281197))

(declare-fun m!1281199 () Bool)

(assert (=> b!1394740 m!1281199))

(declare-fun m!1281201 () Bool)

(assert (=> b!1394737 m!1281201))

(declare-fun m!1281203 () Bool)

(assert (=> b!1394737 m!1281203))

(declare-fun m!1281205 () Bool)

(assert (=> start!119728 m!1281205))

(declare-fun m!1281207 () Bool)

(assert (=> start!119728 m!1281207))

(assert (=> b!1394741 m!1281181))

(assert (=> b!1394741 m!1281181))

(declare-fun m!1281209 () Bool)

(assert (=> b!1394741 m!1281209))

(declare-fun m!1281211 () Bool)

(assert (=> b!1394739 m!1281211))

(assert (=> b!1394739 m!1281211))

(declare-fun m!1281213 () Bool)

(assert (=> b!1394739 m!1281213))

(declare-fun m!1281215 () Bool)

(assert (=> b!1394739 m!1281215))

(declare-fun m!1281217 () Bool)

(assert (=> b!1394739 m!1281217))

(push 1)

(assert (not start!119728))

(assert (not b!1394737))

(assert (not b!1394745))

(assert (not b!1394740))

(assert (not b!1394738))

(assert (not b!1394744))

(assert (not b!1394741))

(assert (not b!1394739))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

