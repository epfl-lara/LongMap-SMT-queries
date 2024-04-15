; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129080 () Bool)

(assert start!129080)

(declare-fun b!1515052 () Bool)

(declare-fun res!1035170 () Bool)

(declare-fun e!845447 () Bool)

(assert (=> b!1515052 (=> (not res!1035170) (not e!845447))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100936 0))(
  ( (array!100937 (arr!48706 (Array (_ BitVec 32) (_ BitVec 64))) (size!49258 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100936)

(assert (=> b!1515052 (= res!1035170 (and (= (size!49258 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49258 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49258 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515053 () Bool)

(declare-fun e!845445 () Bool)

(declare-fun e!845451 () Bool)

(assert (=> b!1515053 (= e!845445 (not e!845451))))

(declare-fun res!1035162 () Bool)

(assert (=> b!1515053 (=> res!1035162 e!845451)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lt!656537 () (_ BitVec 64))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515053 (= res!1035162 (or (not (= (select (arr!48706 a!2804) j!70) lt!656537)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48706 a!2804) index!487) (select (arr!48706 a!2804) j!70)) (not (= (select (arr!48706 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!845448 () Bool)

(assert (=> b!1515053 e!845448))

(declare-fun res!1035168 () Bool)

(assert (=> b!1515053 (=> (not res!1035168) (not e!845448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100936 (_ BitVec 32)) Bool)

(assert (=> b!1515053 (= res!1035168 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50507 0))(
  ( (Unit!50508) )
))
(declare-fun lt!656540 () Unit!50507)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50507)

(assert (=> b!1515053 (= lt!656540 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515054 () Bool)

(declare-fun e!845450 () Bool)

(assert (=> b!1515054 (= e!845447 e!845450)))

(declare-fun res!1035171 () Bool)

(assert (=> b!1515054 (=> (not res!1035171) (not e!845450))))

(declare-datatypes ((SeekEntryResult!12900 0))(
  ( (MissingZero!12900 (index!53995 (_ BitVec 32))) (Found!12900 (index!53996 (_ BitVec 32))) (Intermediate!12900 (undefined!13712 Bool) (index!53997 (_ BitVec 32)) (x!135700 (_ BitVec 32))) (Undefined!12900) (MissingVacant!12900 (index!53998 (_ BitVec 32))) )
))
(declare-fun lt!656536 () SeekEntryResult!12900)

(declare-fun lt!656539 () SeekEntryResult!12900)

(assert (=> b!1515054 (= res!1035171 (= lt!656536 lt!656539))))

(assert (=> b!1515054 (= lt!656539 (Intermediate!12900 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100936 (_ BitVec 32)) SeekEntryResult!12900)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515054 (= lt!656536 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48706 a!2804) j!70) mask!2512) (select (arr!48706 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515055 () Bool)

(declare-fun res!1035161 () Bool)

(assert (=> b!1515055 (=> (not res!1035161) (not e!845447))))

(declare-datatypes ((List!35267 0))(
  ( (Nil!35264) (Cons!35263 (h!36676 (_ BitVec 64)) (t!49953 List!35267)) )
))
(declare-fun arrayNoDuplicates!0 (array!100936 (_ BitVec 32) List!35267) Bool)

(assert (=> b!1515055 (= res!1035161 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35264))))

(declare-fun b!1515056 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100936 (_ BitVec 32)) SeekEntryResult!12900)

(assert (=> b!1515056 (= e!845448 (= (seekEntry!0 (select (arr!48706 a!2804) j!70) a!2804 mask!2512) (Found!12900 j!70)))))

(declare-fun b!1515057 () Bool)

(assert (=> b!1515057 (= e!845450 e!845445)))

(declare-fun res!1035172 () Bool)

(assert (=> b!1515057 (=> (not res!1035172) (not e!845445))))

(declare-fun lt!656543 () array!100936)

(assert (=> b!1515057 (= res!1035172 (= lt!656536 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656537 mask!2512) lt!656537 lt!656543 mask!2512)))))

(assert (=> b!1515057 (= lt!656537 (select (store (arr!48706 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515057 (= lt!656543 (array!100937 (store (arr!48706 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49258 a!2804)))))

(declare-fun b!1515058 () Bool)

(declare-fun res!1035164 () Bool)

(assert (=> b!1515058 (=> (not res!1035164) (not e!845447))))

(assert (=> b!1515058 (= res!1035164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515060 () Bool)

(declare-fun res!1035165 () Bool)

(assert (=> b!1515060 (=> (not res!1035165) (not e!845447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515060 (= res!1035165 (validKeyInArray!0 (select (arr!48706 a!2804) j!70)))))

(declare-fun b!1515061 () Bool)

(declare-fun res!1035166 () Bool)

(assert (=> b!1515061 (=> (not res!1035166) (not e!845450))))

(assert (=> b!1515061 (= res!1035166 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48706 a!2804) j!70) a!2804 mask!2512) lt!656539))))

(declare-fun b!1515062 () Bool)

(declare-fun e!845449 () Bool)

(assert (=> b!1515062 (= e!845451 e!845449)))

(declare-fun res!1035169 () Bool)

(assert (=> b!1515062 (=> res!1035169 e!845449)))

(declare-fun lt!656535 () SeekEntryResult!12900)

(assert (=> b!1515062 (= res!1035169 (not (= lt!656535 (Found!12900 j!70))))))

(declare-fun lt!656542 () SeekEntryResult!12900)

(declare-fun lt!656544 () SeekEntryResult!12900)

(assert (=> b!1515062 (= lt!656542 lt!656544)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100936 (_ BitVec 32)) SeekEntryResult!12900)

(assert (=> b!1515062 (= lt!656544 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656537 lt!656543 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100936 (_ BitVec 32)) SeekEntryResult!12900)

(assert (=> b!1515062 (= lt!656542 (seekEntryOrOpen!0 lt!656537 lt!656543 mask!2512))))

(declare-fun lt!656541 () SeekEntryResult!12900)

(assert (=> b!1515062 (= lt!656541 lt!656535)))

(assert (=> b!1515062 (= lt!656535 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48706 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515062 (= lt!656541 (seekEntryOrOpen!0 (select (arr!48706 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515063 () Bool)

(declare-fun res!1035173 () Bool)

(assert (=> b!1515063 (=> (not res!1035173) (not e!845447))))

(assert (=> b!1515063 (= res!1035173 (validKeyInArray!0 (select (arr!48706 a!2804) i!961)))))

(declare-fun b!1515064 () Bool)

(assert (=> b!1515064 (= e!845449 true)))

(assert (=> b!1515064 (= lt!656544 lt!656535)))

(declare-fun lt!656538 () Unit!50507)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50507)

(assert (=> b!1515064 (= lt!656538 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515059 () Bool)

(declare-fun res!1035167 () Bool)

(assert (=> b!1515059 (=> (not res!1035167) (not e!845447))))

(assert (=> b!1515059 (= res!1035167 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49258 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49258 a!2804))))))

(declare-fun res!1035163 () Bool)

(assert (=> start!129080 (=> (not res!1035163) (not e!845447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129080 (= res!1035163 (validMask!0 mask!2512))))

(assert (=> start!129080 e!845447))

(assert (=> start!129080 true))

(declare-fun array_inv!37939 (array!100936) Bool)

(assert (=> start!129080 (array_inv!37939 a!2804)))

(assert (= (and start!129080 res!1035163) b!1515052))

(assert (= (and b!1515052 res!1035170) b!1515063))

(assert (= (and b!1515063 res!1035173) b!1515060))

(assert (= (and b!1515060 res!1035165) b!1515058))

(assert (= (and b!1515058 res!1035164) b!1515055))

(assert (= (and b!1515055 res!1035161) b!1515059))

(assert (= (and b!1515059 res!1035167) b!1515054))

(assert (= (and b!1515054 res!1035171) b!1515061))

(assert (= (and b!1515061 res!1035166) b!1515057))

(assert (= (and b!1515057 res!1035172) b!1515053))

(assert (= (and b!1515053 res!1035168) b!1515056))

(assert (= (and b!1515053 (not res!1035162)) b!1515062))

(assert (= (and b!1515062 (not res!1035169)) b!1515064))

(declare-fun m!1397579 () Bool)

(assert (=> b!1515055 m!1397579))

(declare-fun m!1397581 () Bool)

(assert (=> b!1515063 m!1397581))

(assert (=> b!1515063 m!1397581))

(declare-fun m!1397583 () Bool)

(assert (=> b!1515063 m!1397583))

(declare-fun m!1397585 () Bool)

(assert (=> b!1515064 m!1397585))

(declare-fun m!1397587 () Bool)

(assert (=> start!129080 m!1397587))

(declare-fun m!1397589 () Bool)

(assert (=> start!129080 m!1397589))

(declare-fun m!1397591 () Bool)

(assert (=> b!1515053 m!1397591))

(declare-fun m!1397593 () Bool)

(assert (=> b!1515053 m!1397593))

(declare-fun m!1397595 () Bool)

(assert (=> b!1515053 m!1397595))

(declare-fun m!1397597 () Bool)

(assert (=> b!1515053 m!1397597))

(assert (=> b!1515062 m!1397591))

(declare-fun m!1397599 () Bool)

(assert (=> b!1515062 m!1397599))

(assert (=> b!1515062 m!1397591))

(declare-fun m!1397601 () Bool)

(assert (=> b!1515062 m!1397601))

(assert (=> b!1515062 m!1397591))

(declare-fun m!1397603 () Bool)

(assert (=> b!1515062 m!1397603))

(declare-fun m!1397605 () Bool)

(assert (=> b!1515062 m!1397605))

(assert (=> b!1515054 m!1397591))

(assert (=> b!1515054 m!1397591))

(declare-fun m!1397607 () Bool)

(assert (=> b!1515054 m!1397607))

(assert (=> b!1515054 m!1397607))

(assert (=> b!1515054 m!1397591))

(declare-fun m!1397609 () Bool)

(assert (=> b!1515054 m!1397609))

(assert (=> b!1515061 m!1397591))

(assert (=> b!1515061 m!1397591))

(declare-fun m!1397611 () Bool)

(assert (=> b!1515061 m!1397611))

(assert (=> b!1515060 m!1397591))

(assert (=> b!1515060 m!1397591))

(declare-fun m!1397613 () Bool)

(assert (=> b!1515060 m!1397613))

(assert (=> b!1515056 m!1397591))

(assert (=> b!1515056 m!1397591))

(declare-fun m!1397615 () Bool)

(assert (=> b!1515056 m!1397615))

(declare-fun m!1397617 () Bool)

(assert (=> b!1515058 m!1397617))

(declare-fun m!1397619 () Bool)

(assert (=> b!1515057 m!1397619))

(assert (=> b!1515057 m!1397619))

(declare-fun m!1397621 () Bool)

(assert (=> b!1515057 m!1397621))

(declare-fun m!1397623 () Bool)

(assert (=> b!1515057 m!1397623))

(declare-fun m!1397625 () Bool)

(assert (=> b!1515057 m!1397625))

(check-sat (not b!1515058) (not b!1515063) (not b!1515060) (not b!1515061) (not b!1515062) (not start!129080) (not b!1515056) (not b!1515055) (not b!1515064) (not b!1515054) (not b!1515057) (not b!1515053))
(check-sat)
