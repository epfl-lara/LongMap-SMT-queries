; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130532 () Bool)

(assert start!130532)

(declare-fun b!1531831 () Bool)

(declare-fun res!1048978 () Bool)

(declare-fun e!853530 () Bool)

(assert (=> b!1531831 (=> (not res!1048978) (not e!853530))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101711 0))(
  ( (array!101712 (arr!49076 (Array (_ BitVec 32) (_ BitVec 64))) (size!49626 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101711)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1531831 (= res!1048978 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49626 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49626 a!2804))))))

(declare-fun b!1531832 () Bool)

(declare-fun e!853529 () Bool)

(declare-fun e!853531 () Bool)

(assert (=> b!1531832 (= e!853529 (not e!853531))))

(declare-fun res!1048976 () Bool)

(assert (=> b!1531832 (=> res!1048976 e!853531)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun lt!663400 () (_ BitVec 64))

(assert (=> b!1531832 (= res!1048976 (or (not (= (select (arr!49076 a!2804) j!70) lt!663400)) (= x!534 resX!21)))))

(declare-fun e!853527 () Bool)

(assert (=> b!1531832 e!853527))

(declare-fun res!1048983 () Bool)

(assert (=> b!1531832 (=> (not res!1048983) (not e!853527))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101711 (_ BitVec 32)) Bool)

(assert (=> b!1531832 (= res!1048983 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51266 0))(
  ( (Unit!51267) )
))
(declare-fun lt!663403 () Unit!51266)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51266)

(assert (=> b!1531832 (= lt!663403 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531833 () Bool)

(declare-fun e!853528 () Bool)

(assert (=> b!1531833 (= e!853528 e!853529)))

(declare-fun res!1048984 () Bool)

(assert (=> b!1531833 (=> (not res!1048984) (not e!853529))))

(declare-fun lt!663401 () array!101711)

(declare-datatypes ((SeekEntryResult!13241 0))(
  ( (MissingZero!13241 (index!55359 (_ BitVec 32))) (Found!13241 (index!55360 (_ BitVec 32))) (Intermediate!13241 (undefined!14053 Bool) (index!55361 (_ BitVec 32)) (x!137059 (_ BitVec 32))) (Undefined!13241) (MissingVacant!13241 (index!55362 (_ BitVec 32))) )
))
(declare-fun lt!663404 () SeekEntryResult!13241)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101711 (_ BitVec 32)) SeekEntryResult!13241)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531833 (= res!1048984 (= lt!663404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663400 mask!2512) lt!663400 lt!663401 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1531833 (= lt!663400 (select (store (arr!49076 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1531833 (= lt!663401 (array!101712 (store (arr!49076 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49626 a!2804)))))

(declare-fun b!1531834 () Bool)

(declare-fun e!853525 () Bool)

(assert (=> b!1531834 (= e!853525 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101711 (_ BitVec 32)) SeekEntryResult!13241)

(assert (=> b!1531834 (= (seekEntryOrOpen!0 (select (arr!49076 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663400 lt!663401 mask!2512))))

(declare-fun lt!663406 () Unit!51266)

(declare-fun lt!663402 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51266)

(assert (=> b!1531834 (= lt!663406 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663402 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1531835 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101711 (_ BitVec 32)) SeekEntryResult!13241)

(assert (=> b!1531835 (= e!853527 (= (seekEntry!0 (select (arr!49076 a!2804) j!70) a!2804 mask!2512) (Found!13241 j!70)))))

(declare-fun b!1531836 () Bool)

(declare-fun res!1048972 () Bool)

(assert (=> b!1531836 (=> (not res!1048972) (not e!853530))))

(assert (=> b!1531836 (= res!1048972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531838 () Bool)

(declare-fun res!1048979 () Bool)

(assert (=> b!1531838 (=> (not res!1048979) (not e!853530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531838 (= res!1048979 (validKeyInArray!0 (select (arr!49076 a!2804) i!961)))))

(declare-fun b!1531839 () Bool)

(declare-fun res!1048975 () Bool)

(assert (=> b!1531839 (=> (not res!1048975) (not e!853530))))

(declare-datatypes ((List!35559 0))(
  ( (Nil!35556) (Cons!35555 (h!37000 (_ BitVec 64)) (t!50253 List!35559)) )
))
(declare-fun arrayNoDuplicates!0 (array!101711 (_ BitVec 32) List!35559) Bool)

(assert (=> b!1531839 (= res!1048975 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35556))))

(declare-fun b!1531840 () Bool)

(declare-fun res!1048982 () Bool)

(assert (=> b!1531840 (=> (not res!1048982) (not e!853530))))

(assert (=> b!1531840 (= res!1048982 (validKeyInArray!0 (select (arr!49076 a!2804) j!70)))))

(declare-fun b!1531841 () Bool)

(declare-fun res!1048977 () Bool)

(assert (=> b!1531841 (=> (not res!1048977) (not e!853530))))

(assert (=> b!1531841 (= res!1048977 (and (= (size!49626 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49626 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49626 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531842 () Bool)

(declare-fun res!1048971 () Bool)

(assert (=> b!1531842 (=> (not res!1048971) (not e!853528))))

(declare-fun lt!663405 () SeekEntryResult!13241)

(assert (=> b!1531842 (= res!1048971 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49076 a!2804) j!70) a!2804 mask!2512) lt!663405))))

(declare-fun b!1531843 () Bool)

(declare-fun res!1048973 () Bool)

(assert (=> b!1531843 (=> res!1048973 e!853525)))

(assert (=> b!1531843 (= res!1048973 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663402 (select (arr!49076 a!2804) j!70) a!2804 mask!2512) lt!663405)))))

(declare-fun b!1531844 () Bool)

(assert (=> b!1531844 (= e!853530 e!853528)))

(declare-fun res!1048981 () Bool)

(assert (=> b!1531844 (=> (not res!1048981) (not e!853528))))

(assert (=> b!1531844 (= res!1048981 (= lt!663404 lt!663405))))

(assert (=> b!1531844 (= lt!663405 (Intermediate!13241 false resIndex!21 resX!21))))

(assert (=> b!1531844 (= lt!663404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49076 a!2804) j!70) mask!2512) (select (arr!49076 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1048974 () Bool)

(assert (=> start!130532 (=> (not res!1048974) (not e!853530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130532 (= res!1048974 (validMask!0 mask!2512))))

(assert (=> start!130532 e!853530))

(assert (=> start!130532 true))

(declare-fun array_inv!38104 (array!101711) Bool)

(assert (=> start!130532 (array_inv!38104 a!2804)))

(declare-fun b!1531837 () Bool)

(assert (=> b!1531837 (= e!853531 e!853525)))

(declare-fun res!1048980 () Bool)

(assert (=> b!1531837 (=> res!1048980 e!853525)))

(assert (=> b!1531837 (= res!1048980 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663402 #b00000000000000000000000000000000) (bvsge lt!663402 (size!49626 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531837 (= lt!663402 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!130532 res!1048974) b!1531841))

(assert (= (and b!1531841 res!1048977) b!1531838))

(assert (= (and b!1531838 res!1048979) b!1531840))

(assert (= (and b!1531840 res!1048982) b!1531836))

(assert (= (and b!1531836 res!1048972) b!1531839))

(assert (= (and b!1531839 res!1048975) b!1531831))

(assert (= (and b!1531831 res!1048978) b!1531844))

(assert (= (and b!1531844 res!1048981) b!1531842))

(assert (= (and b!1531842 res!1048971) b!1531833))

(assert (= (and b!1531833 res!1048984) b!1531832))

(assert (= (and b!1531832 res!1048983) b!1531835))

(assert (= (and b!1531832 (not res!1048976)) b!1531837))

(assert (= (and b!1531837 (not res!1048980)) b!1531843))

(assert (= (and b!1531843 (not res!1048973)) b!1531834))

(declare-fun m!1414497 () Bool)

(assert (=> start!130532 m!1414497))

(declare-fun m!1414499 () Bool)

(assert (=> start!130532 m!1414499))

(declare-fun m!1414501 () Bool)

(assert (=> b!1531842 m!1414501))

(assert (=> b!1531842 m!1414501))

(declare-fun m!1414503 () Bool)

(assert (=> b!1531842 m!1414503))

(assert (=> b!1531840 m!1414501))

(assert (=> b!1531840 m!1414501))

(declare-fun m!1414505 () Bool)

(assert (=> b!1531840 m!1414505))

(assert (=> b!1531832 m!1414501))

(declare-fun m!1414507 () Bool)

(assert (=> b!1531832 m!1414507))

(declare-fun m!1414509 () Bool)

(assert (=> b!1531832 m!1414509))

(assert (=> b!1531844 m!1414501))

(assert (=> b!1531844 m!1414501))

(declare-fun m!1414511 () Bool)

(assert (=> b!1531844 m!1414511))

(assert (=> b!1531844 m!1414511))

(assert (=> b!1531844 m!1414501))

(declare-fun m!1414513 () Bool)

(assert (=> b!1531844 m!1414513))

(declare-fun m!1414515 () Bool)

(assert (=> b!1531838 m!1414515))

(assert (=> b!1531838 m!1414515))

(declare-fun m!1414517 () Bool)

(assert (=> b!1531838 m!1414517))

(declare-fun m!1414519 () Bool)

(assert (=> b!1531839 m!1414519))

(assert (=> b!1531843 m!1414501))

(assert (=> b!1531843 m!1414501))

(declare-fun m!1414521 () Bool)

(assert (=> b!1531843 m!1414521))

(assert (=> b!1531834 m!1414501))

(assert (=> b!1531834 m!1414501))

(declare-fun m!1414523 () Bool)

(assert (=> b!1531834 m!1414523))

(declare-fun m!1414525 () Bool)

(assert (=> b!1531834 m!1414525))

(declare-fun m!1414527 () Bool)

(assert (=> b!1531834 m!1414527))

(declare-fun m!1414529 () Bool)

(assert (=> b!1531836 m!1414529))

(declare-fun m!1414531 () Bool)

(assert (=> b!1531833 m!1414531))

(assert (=> b!1531833 m!1414531))

(declare-fun m!1414533 () Bool)

(assert (=> b!1531833 m!1414533))

(declare-fun m!1414535 () Bool)

(assert (=> b!1531833 m!1414535))

(declare-fun m!1414537 () Bool)

(assert (=> b!1531833 m!1414537))

(assert (=> b!1531835 m!1414501))

(assert (=> b!1531835 m!1414501))

(declare-fun m!1414539 () Bool)

(assert (=> b!1531835 m!1414539))

(declare-fun m!1414541 () Bool)

(assert (=> b!1531837 m!1414541))

(push 1)

