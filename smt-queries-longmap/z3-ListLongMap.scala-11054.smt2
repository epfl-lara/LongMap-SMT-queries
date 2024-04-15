; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129104 () Bool)

(assert start!129104)

(declare-fun b!1515522 () Bool)

(declare-fun e!845703 () Bool)

(declare-fun e!845700 () Bool)

(assert (=> b!1515522 (= e!845703 e!845700)))

(declare-fun res!1035638 () Bool)

(assert (=> b!1515522 (=> (not res!1035638) (not e!845700))))

(declare-fun lt!656904 () (_ BitVec 64))

(declare-datatypes ((array!100960 0))(
  ( (array!100961 (arr!48718 (Array (_ BitVec 32) (_ BitVec 64))) (size!49270 (_ BitVec 32))) )
))
(declare-fun lt!656902 () array!100960)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12912 0))(
  ( (MissingZero!12912 (index!54043 (_ BitVec 32))) (Found!12912 (index!54044 (_ BitVec 32))) (Intermediate!12912 (undefined!13724 Bool) (index!54045 (_ BitVec 32)) (x!135744 (_ BitVec 32))) (Undefined!12912) (MissingVacant!12912 (index!54046 (_ BitVec 32))) )
))
(declare-fun lt!656903 () SeekEntryResult!12912)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100960 (_ BitVec 32)) SeekEntryResult!12912)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515522 (= res!1035638 (= lt!656903 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656904 mask!2512) lt!656904 lt!656902 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!100960)

(assert (=> b!1515522 (= lt!656904 (select (store (arr!48718 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515522 (= lt!656902 (array!100961 (store (arr!48718 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49270 a!2804)))))

(declare-fun b!1515523 () Bool)

(declare-fun e!845704 () Bool)

(assert (=> b!1515523 (= e!845700 (not e!845704))))

(declare-fun res!1035634 () Bool)

(assert (=> b!1515523 (=> res!1035634 e!845704)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515523 (= res!1035634 (or (not (= (select (arr!48718 a!2804) j!70) lt!656904)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48718 a!2804) index!487) (select (arr!48718 a!2804) j!70)) (not (= (select (arr!48718 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!845699 () Bool)

(assert (=> b!1515523 e!845699))

(declare-fun res!1035642 () Bool)

(assert (=> b!1515523 (=> (not res!1035642) (not e!845699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100960 (_ BitVec 32)) Bool)

(assert (=> b!1515523 (= res!1035642 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50531 0))(
  ( (Unit!50532) )
))
(declare-fun lt!656901 () Unit!50531)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50531)

(assert (=> b!1515523 (= lt!656901 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515524 () Bool)

(declare-fun res!1035640 () Bool)

(declare-fun e!845701 () Bool)

(assert (=> b!1515524 (=> (not res!1035640) (not e!845701))))

(assert (=> b!1515524 (= res!1035640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1035637 () Bool)

(assert (=> start!129104 (=> (not res!1035637) (not e!845701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129104 (= res!1035637 (validMask!0 mask!2512))))

(assert (=> start!129104 e!845701))

(assert (=> start!129104 true))

(declare-fun array_inv!37951 (array!100960) Bool)

(assert (=> start!129104 (array_inv!37951 a!2804)))

(declare-fun b!1515525 () Bool)

(declare-fun e!845706 () Bool)

(assert (=> b!1515525 (= e!845704 e!845706)))

(declare-fun res!1035643 () Bool)

(assert (=> b!1515525 (=> res!1035643 e!845706)))

(declare-fun lt!656899 () SeekEntryResult!12912)

(assert (=> b!1515525 (= res!1035643 (not (= lt!656899 (Found!12912 j!70))))))

(declare-fun lt!656897 () SeekEntryResult!12912)

(declare-fun lt!656895 () SeekEntryResult!12912)

(assert (=> b!1515525 (= lt!656897 lt!656895)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100960 (_ BitVec 32)) SeekEntryResult!12912)

(assert (=> b!1515525 (= lt!656895 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656904 lt!656902 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100960 (_ BitVec 32)) SeekEntryResult!12912)

(assert (=> b!1515525 (= lt!656897 (seekEntryOrOpen!0 lt!656904 lt!656902 mask!2512))))

(declare-fun lt!656900 () SeekEntryResult!12912)

(assert (=> b!1515525 (= lt!656900 lt!656899)))

(assert (=> b!1515525 (= lt!656899 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48718 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515525 (= lt!656900 (seekEntryOrOpen!0 (select (arr!48718 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515526 () Bool)

(declare-fun res!1035631 () Bool)

(assert (=> b!1515526 (=> (not res!1035631) (not e!845701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515526 (= res!1035631 (validKeyInArray!0 (select (arr!48718 a!2804) j!70)))))

(declare-fun b!1515527 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100960 (_ BitVec 32)) SeekEntryResult!12912)

(assert (=> b!1515527 (= e!845699 (= (seekEntry!0 (select (arr!48718 a!2804) j!70) a!2804 mask!2512) (Found!12912 j!70)))))

(declare-fun b!1515528 () Bool)

(assert (=> b!1515528 (= e!845701 e!845703)))

(declare-fun res!1035632 () Bool)

(assert (=> b!1515528 (=> (not res!1035632) (not e!845703))))

(declare-fun lt!656898 () SeekEntryResult!12912)

(assert (=> b!1515528 (= res!1035632 (= lt!656903 lt!656898))))

(assert (=> b!1515528 (= lt!656898 (Intermediate!12912 false resIndex!21 resX!21))))

(assert (=> b!1515528 (= lt!656903 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48718 a!2804) j!70) mask!2512) (select (arr!48718 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515529 () Bool)

(declare-fun res!1035633 () Bool)

(assert (=> b!1515529 (=> (not res!1035633) (not e!845701))))

(declare-datatypes ((List!35279 0))(
  ( (Nil!35276) (Cons!35275 (h!36688 (_ BitVec 64)) (t!49965 List!35279)) )
))
(declare-fun arrayNoDuplicates!0 (array!100960 (_ BitVec 32) List!35279) Bool)

(assert (=> b!1515529 (= res!1035633 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35276))))

(declare-fun b!1515530 () Bool)

(declare-fun e!845702 () Bool)

(assert (=> b!1515530 (= e!845702 (validKeyInArray!0 lt!656904))))

(declare-fun b!1515531 () Bool)

(declare-fun res!1035639 () Bool)

(assert (=> b!1515531 (=> (not res!1035639) (not e!845703))))

(assert (=> b!1515531 (= res!1035639 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48718 a!2804) j!70) a!2804 mask!2512) lt!656898))))

(declare-fun b!1515532 () Bool)

(declare-fun res!1035644 () Bool)

(assert (=> b!1515532 (=> (not res!1035644) (not e!845701))))

(assert (=> b!1515532 (= res!1035644 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49270 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49270 a!2804))))))

(declare-fun b!1515533 () Bool)

(declare-fun res!1035636 () Bool)

(assert (=> b!1515533 (=> (not res!1035636) (not e!845701))))

(assert (=> b!1515533 (= res!1035636 (and (= (size!49270 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49270 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49270 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515534 () Bool)

(declare-fun res!1035635 () Bool)

(assert (=> b!1515534 (=> (not res!1035635) (not e!845701))))

(assert (=> b!1515534 (= res!1035635 (validKeyInArray!0 (select (arr!48718 a!2804) i!961)))))

(declare-fun b!1515535 () Bool)

(assert (=> b!1515535 (= e!845706 e!845702)))

(declare-fun res!1035641 () Bool)

(assert (=> b!1515535 (=> res!1035641 e!845702)))

(assert (=> b!1515535 (= res!1035641 (bvslt mask!2512 #b00000000000000000000000000000000))))

(assert (=> b!1515535 (= lt!656895 lt!656899)))

(declare-fun lt!656896 () Unit!50531)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50531)

(assert (=> b!1515535 (= lt!656896 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(assert (= (and start!129104 res!1035637) b!1515533))

(assert (= (and b!1515533 res!1035636) b!1515534))

(assert (= (and b!1515534 res!1035635) b!1515526))

(assert (= (and b!1515526 res!1035631) b!1515524))

(assert (= (and b!1515524 res!1035640) b!1515529))

(assert (= (and b!1515529 res!1035633) b!1515532))

(assert (= (and b!1515532 res!1035644) b!1515528))

(assert (= (and b!1515528 res!1035632) b!1515531))

(assert (= (and b!1515531 res!1035639) b!1515522))

(assert (= (and b!1515522 res!1035638) b!1515523))

(assert (= (and b!1515523 res!1035642) b!1515527))

(assert (= (and b!1515523 (not res!1035634)) b!1515525))

(assert (= (and b!1515525 (not res!1035643)) b!1515535))

(assert (= (and b!1515535 (not res!1035641)) b!1515530))

(declare-fun m!1398155 () Bool)

(assert (=> b!1515530 m!1398155))

(declare-fun m!1398157 () Bool)

(assert (=> b!1515526 m!1398157))

(assert (=> b!1515526 m!1398157))

(declare-fun m!1398159 () Bool)

(assert (=> b!1515526 m!1398159))

(declare-fun m!1398161 () Bool)

(assert (=> start!129104 m!1398161))

(declare-fun m!1398163 () Bool)

(assert (=> start!129104 m!1398163))

(assert (=> b!1515528 m!1398157))

(assert (=> b!1515528 m!1398157))

(declare-fun m!1398165 () Bool)

(assert (=> b!1515528 m!1398165))

(assert (=> b!1515528 m!1398165))

(assert (=> b!1515528 m!1398157))

(declare-fun m!1398167 () Bool)

(assert (=> b!1515528 m!1398167))

(declare-fun m!1398169 () Bool)

(assert (=> b!1515524 m!1398169))

(assert (=> b!1515531 m!1398157))

(assert (=> b!1515531 m!1398157))

(declare-fun m!1398171 () Bool)

(assert (=> b!1515531 m!1398171))

(declare-fun m!1398173 () Bool)

(assert (=> b!1515535 m!1398173))

(declare-fun m!1398175 () Bool)

(assert (=> b!1515534 m!1398175))

(assert (=> b!1515534 m!1398175))

(declare-fun m!1398177 () Bool)

(assert (=> b!1515534 m!1398177))

(assert (=> b!1515525 m!1398157))

(declare-fun m!1398179 () Bool)

(assert (=> b!1515525 m!1398179))

(assert (=> b!1515525 m!1398157))

(declare-fun m!1398181 () Bool)

(assert (=> b!1515525 m!1398181))

(declare-fun m!1398183 () Bool)

(assert (=> b!1515525 m!1398183))

(assert (=> b!1515525 m!1398157))

(declare-fun m!1398185 () Bool)

(assert (=> b!1515525 m!1398185))

(assert (=> b!1515527 m!1398157))

(assert (=> b!1515527 m!1398157))

(declare-fun m!1398187 () Bool)

(assert (=> b!1515527 m!1398187))

(declare-fun m!1398189 () Bool)

(assert (=> b!1515522 m!1398189))

(assert (=> b!1515522 m!1398189))

(declare-fun m!1398191 () Bool)

(assert (=> b!1515522 m!1398191))

(declare-fun m!1398193 () Bool)

(assert (=> b!1515522 m!1398193))

(declare-fun m!1398195 () Bool)

(assert (=> b!1515522 m!1398195))

(declare-fun m!1398197 () Bool)

(assert (=> b!1515529 m!1398197))

(assert (=> b!1515523 m!1398157))

(declare-fun m!1398199 () Bool)

(assert (=> b!1515523 m!1398199))

(declare-fun m!1398201 () Bool)

(assert (=> b!1515523 m!1398201))

(declare-fun m!1398203 () Bool)

(assert (=> b!1515523 m!1398203))

(check-sat (not b!1515527) (not b!1515531) (not b!1515526) (not b!1515524) (not b!1515522) (not b!1515535) (not b!1515525) (not b!1515523) (not b!1515528) (not start!129104) (not b!1515530) (not b!1515529) (not b!1515534))
(check-sat)
