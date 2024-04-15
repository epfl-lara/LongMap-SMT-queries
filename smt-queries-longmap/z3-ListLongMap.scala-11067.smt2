; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129182 () Bool)

(assert start!129182)

(declare-fun b!1516978 () Bool)

(declare-fun res!1037093 () Bool)

(declare-fun e!846343 () Bool)

(assert (=> b!1516978 (=> (not res!1037093) (not e!846343))))

(declare-datatypes ((SeekEntryResult!12951 0))(
  ( (MissingZero!12951 (index!54199 (_ BitVec 32))) (Found!12951 (index!54200 (_ BitVec 32))) (Intermediate!12951 (undefined!13763 Bool) (index!54201 (_ BitVec 32)) (x!135887 (_ BitVec 32))) (Undefined!12951) (MissingVacant!12951 (index!54202 (_ BitVec 32))) )
))
(declare-fun lt!657445 () SeekEntryResult!12951)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101038 0))(
  ( (array!101039 (arr!48757 (Array (_ BitVec 32) (_ BitVec 64))) (size!49309 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101038)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101038 (_ BitVec 32)) SeekEntryResult!12951)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516978 (= res!1037093 (= lt!657445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48757 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48757 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101039 (store (arr!48757 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49309 a!2804)) mask!2512)))))

(declare-fun b!1516979 () Bool)

(declare-fun e!846345 () Bool)

(assert (=> b!1516979 (= e!846345 true)))

(declare-fun lt!657444 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!657447 () SeekEntryResult!12951)

(assert (=> b!1516979 (= lt!657447 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657444 (select (arr!48757 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516980 () Bool)

(declare-fun res!1037099 () Bool)

(declare-fun e!846347 () Bool)

(assert (=> b!1516980 (=> (not res!1037099) (not e!846347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516980 (= res!1037099 (validKeyInArray!0 (select (arr!48757 a!2804) j!70)))))

(declare-fun b!1516981 () Bool)

(assert (=> b!1516981 (= e!846347 e!846343)))

(declare-fun res!1037087 () Bool)

(assert (=> b!1516981 (=> (not res!1037087) (not e!846343))))

(declare-fun lt!657443 () SeekEntryResult!12951)

(assert (=> b!1516981 (= res!1037087 (= lt!657445 lt!657443))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1516981 (= lt!657443 (Intermediate!12951 false resIndex!21 resX!21))))

(assert (=> b!1516981 (= lt!657445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48757 a!2804) j!70) mask!2512) (select (arr!48757 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516982 () Bool)

(declare-fun e!846348 () Bool)

(assert (=> b!1516982 (= e!846343 (not e!846348))))

(declare-fun res!1037095 () Bool)

(assert (=> b!1516982 (=> res!1037095 e!846348)))

(assert (=> b!1516982 (= res!1037095 (or (not (= (select (arr!48757 a!2804) j!70) (select (store (arr!48757 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846344 () Bool)

(assert (=> b!1516982 e!846344))

(declare-fun res!1037089 () Bool)

(assert (=> b!1516982 (=> (not res!1037089) (not e!846344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101038 (_ BitVec 32)) Bool)

(assert (=> b!1516982 (= res!1037089 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50609 0))(
  ( (Unit!50610) )
))
(declare-fun lt!657446 () Unit!50609)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101038 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50609)

(assert (=> b!1516982 (= lt!657446 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516983 () Bool)

(assert (=> b!1516983 (= e!846348 e!846345)))

(declare-fun res!1037096 () Bool)

(assert (=> b!1516983 (=> res!1037096 e!846345)))

(assert (=> b!1516983 (= res!1037096 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657444 #b00000000000000000000000000000000) (bvsge lt!657444 (size!49309 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516983 (= lt!657444 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516984 () Bool)

(declare-fun res!1037097 () Bool)

(assert (=> b!1516984 (=> (not res!1037097) (not e!846343))))

(assert (=> b!1516984 (= res!1037097 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48757 a!2804) j!70) a!2804 mask!2512) lt!657443))))

(declare-fun b!1516985 () Bool)

(declare-fun res!1037092 () Bool)

(assert (=> b!1516985 (=> (not res!1037092) (not e!846347))))

(assert (=> b!1516985 (= res!1037092 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49309 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49309 a!2804))))))

(declare-fun b!1516987 () Bool)

(declare-fun res!1037098 () Bool)

(assert (=> b!1516987 (=> (not res!1037098) (not e!846347))))

(declare-datatypes ((List!35318 0))(
  ( (Nil!35315) (Cons!35314 (h!36727 (_ BitVec 64)) (t!50004 List!35318)) )
))
(declare-fun arrayNoDuplicates!0 (array!101038 (_ BitVec 32) List!35318) Bool)

(assert (=> b!1516987 (= res!1037098 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35315))))

(declare-fun b!1516988 () Bool)

(declare-fun res!1037090 () Bool)

(assert (=> b!1516988 (=> (not res!1037090) (not e!846347))))

(assert (=> b!1516988 (= res!1037090 (and (= (size!49309 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49309 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49309 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516989 () Bool)

(declare-fun res!1037091 () Bool)

(assert (=> b!1516989 (=> (not res!1037091) (not e!846347))))

(assert (=> b!1516989 (= res!1037091 (validKeyInArray!0 (select (arr!48757 a!2804) i!961)))))

(declare-fun b!1516990 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101038 (_ BitVec 32)) SeekEntryResult!12951)

(assert (=> b!1516990 (= e!846344 (= (seekEntry!0 (select (arr!48757 a!2804) j!70) a!2804 mask!2512) (Found!12951 j!70)))))

(declare-fun res!1037088 () Bool)

(assert (=> start!129182 (=> (not res!1037088) (not e!846347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129182 (= res!1037088 (validMask!0 mask!2512))))

(assert (=> start!129182 e!846347))

(assert (=> start!129182 true))

(declare-fun array_inv!37990 (array!101038) Bool)

(assert (=> start!129182 (array_inv!37990 a!2804)))

(declare-fun b!1516986 () Bool)

(declare-fun res!1037094 () Bool)

(assert (=> b!1516986 (=> (not res!1037094) (not e!846347))))

(assert (=> b!1516986 (= res!1037094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129182 res!1037088) b!1516988))

(assert (= (and b!1516988 res!1037090) b!1516989))

(assert (= (and b!1516989 res!1037091) b!1516980))

(assert (= (and b!1516980 res!1037099) b!1516986))

(assert (= (and b!1516986 res!1037094) b!1516987))

(assert (= (and b!1516987 res!1037098) b!1516985))

(assert (= (and b!1516985 res!1037092) b!1516981))

(assert (= (and b!1516981 res!1037087) b!1516984))

(assert (= (and b!1516984 res!1037097) b!1516978))

(assert (= (and b!1516978 res!1037093) b!1516982))

(assert (= (and b!1516982 res!1037089) b!1516990))

(assert (= (and b!1516982 (not res!1037095)) b!1516983))

(assert (= (and b!1516983 (not res!1037096)) b!1516979))

(declare-fun m!1399697 () Bool)

(assert (=> b!1516986 m!1399697))

(declare-fun m!1399699 () Bool)

(assert (=> b!1516990 m!1399699))

(assert (=> b!1516990 m!1399699))

(declare-fun m!1399701 () Bool)

(assert (=> b!1516990 m!1399701))

(declare-fun m!1399703 () Bool)

(assert (=> b!1516989 m!1399703))

(assert (=> b!1516989 m!1399703))

(declare-fun m!1399705 () Bool)

(assert (=> b!1516989 m!1399705))

(assert (=> b!1516984 m!1399699))

(assert (=> b!1516984 m!1399699))

(declare-fun m!1399707 () Bool)

(assert (=> b!1516984 m!1399707))

(declare-fun m!1399709 () Bool)

(assert (=> b!1516987 m!1399709))

(assert (=> b!1516981 m!1399699))

(assert (=> b!1516981 m!1399699))

(declare-fun m!1399711 () Bool)

(assert (=> b!1516981 m!1399711))

(assert (=> b!1516981 m!1399711))

(assert (=> b!1516981 m!1399699))

(declare-fun m!1399713 () Bool)

(assert (=> b!1516981 m!1399713))

(assert (=> b!1516982 m!1399699))

(declare-fun m!1399715 () Bool)

(assert (=> b!1516982 m!1399715))

(declare-fun m!1399717 () Bool)

(assert (=> b!1516982 m!1399717))

(declare-fun m!1399719 () Bool)

(assert (=> b!1516982 m!1399719))

(declare-fun m!1399721 () Bool)

(assert (=> b!1516982 m!1399721))

(declare-fun m!1399723 () Bool)

(assert (=> b!1516983 m!1399723))

(assert (=> b!1516979 m!1399699))

(assert (=> b!1516979 m!1399699))

(declare-fun m!1399725 () Bool)

(assert (=> b!1516979 m!1399725))

(assert (=> b!1516980 m!1399699))

(assert (=> b!1516980 m!1399699))

(declare-fun m!1399727 () Bool)

(assert (=> b!1516980 m!1399727))

(assert (=> b!1516978 m!1399717))

(assert (=> b!1516978 m!1399719))

(assert (=> b!1516978 m!1399719))

(declare-fun m!1399729 () Bool)

(assert (=> b!1516978 m!1399729))

(assert (=> b!1516978 m!1399729))

(assert (=> b!1516978 m!1399719))

(declare-fun m!1399731 () Bool)

(assert (=> b!1516978 m!1399731))

(declare-fun m!1399733 () Bool)

(assert (=> start!129182 m!1399733))

(declare-fun m!1399735 () Bool)

(assert (=> start!129182 m!1399735))

(check-sat (not b!1516979) (not b!1516986) (not b!1516987) (not b!1516978) (not b!1516990) (not b!1516981) (not b!1516980) (not b!1516982) (not b!1516983) (not b!1516984) (not start!129182) (not b!1516989))
(check-sat)
