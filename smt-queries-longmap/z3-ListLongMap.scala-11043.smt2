; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129092 () Bool)

(assert start!129092)

(declare-fun b!1514581 () Bool)

(declare-fun res!1034491 () Bool)

(declare-fun e!845239 () Bool)

(assert (=> b!1514581 (=> (not res!1034491) (not e!845239))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100948 0))(
  ( (array!100949 (arr!48711 (Array (_ BitVec 32) (_ BitVec 64))) (size!49261 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100948)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12882 0))(
  ( (MissingZero!12882 (index!53923 (_ BitVec 32))) (Found!12882 (index!53924 (_ BitVec 32))) (Intermediate!12882 (undefined!13694 Bool) (index!53925 (_ BitVec 32)) (x!135632 (_ BitVec 32))) (Undefined!12882) (MissingVacant!12882 (index!53926 (_ BitVec 32))) )
))
(declare-fun lt!656389 () SeekEntryResult!12882)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100948 (_ BitVec 32)) SeekEntryResult!12882)

(assert (=> b!1514581 (= res!1034491 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48711 a!2804) j!70) a!2804 mask!2512) lt!656389))))

(declare-fun b!1514583 () Bool)

(declare-fun res!1034485 () Bool)

(declare-fun e!845245 () Bool)

(assert (=> b!1514583 (=> (not res!1034485) (not e!845245))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100948 (_ BitVec 32)) SeekEntryResult!12882)

(assert (=> b!1514583 (= res!1034485 (= (seekEntry!0 (select (arr!48711 a!2804) j!70) a!2804 mask!2512) (Found!12882 j!70)))))

(declare-fun b!1514584 () Bool)

(declare-fun res!1034486 () Bool)

(declare-fun e!845241 () Bool)

(assert (=> b!1514584 (=> (not res!1034486) (not e!845241))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514584 (= res!1034486 (and (= (size!49261 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49261 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49261 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514585 () Bool)

(declare-fun res!1034488 () Bool)

(assert (=> b!1514585 (=> (not res!1034488) (not e!845241))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514585 (= res!1034488 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49261 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49261 a!2804))))))

(declare-fun b!1514586 () Bool)

(assert (=> b!1514586 (= e!845241 e!845239)))

(declare-fun res!1034493 () Bool)

(assert (=> b!1514586 (=> (not res!1034493) (not e!845239))))

(declare-fun lt!656388 () SeekEntryResult!12882)

(assert (=> b!1514586 (= res!1034493 (= lt!656388 lt!656389))))

(assert (=> b!1514586 (= lt!656389 (Intermediate!12882 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514586 (= lt!656388 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48711 a!2804) j!70) mask!2512) (select (arr!48711 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514587 () Bool)

(declare-fun e!845244 () Bool)

(assert (=> b!1514587 (= e!845245 e!845244)))

(declare-fun res!1034489 () Bool)

(assert (=> b!1514587 (=> res!1034489 e!845244)))

(declare-fun lt!656386 () (_ BitVec 64))

(assert (=> b!1514587 (= res!1034489 (or (not (= (select (arr!48711 a!2804) j!70) lt!656386)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48711 a!2804) index!487) (select (arr!48711 a!2804) j!70)) (not (= (select (arr!48711 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514588 () Bool)

(declare-fun res!1034494 () Bool)

(assert (=> b!1514588 (=> (not res!1034494) (not e!845241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100948 (_ BitVec 32)) Bool)

(assert (=> b!1514588 (= res!1034494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1034497 () Bool)

(assert (=> start!129092 (=> (not res!1034497) (not e!845241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129092 (= res!1034497 (validMask!0 mask!2512))))

(assert (=> start!129092 e!845241))

(assert (=> start!129092 true))

(declare-fun array_inv!37739 (array!100948) Bool)

(assert (=> start!129092 (array_inv!37739 a!2804)))

(declare-fun b!1514582 () Bool)

(declare-fun res!1034492 () Bool)

(assert (=> b!1514582 (=> (not res!1034492) (not e!845241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514582 (= res!1034492 (validKeyInArray!0 (select (arr!48711 a!2804) i!961)))))

(declare-fun b!1514589 () Bool)

(declare-fun e!845242 () Bool)

(assert (=> b!1514589 (= e!845242 (not true))))

(assert (=> b!1514589 e!845245))

(declare-fun res!1034490 () Bool)

(assert (=> b!1514589 (=> (not res!1034490) (not e!845245))))

(assert (=> b!1514589 (= res!1034490 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50632 0))(
  ( (Unit!50633) )
))
(declare-fun lt!656385 () Unit!50632)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50632)

(assert (=> b!1514589 (= lt!656385 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514590 () Bool)

(declare-fun res!1034496 () Bool)

(assert (=> b!1514590 (=> (not res!1034496) (not e!845241))))

(assert (=> b!1514590 (= res!1034496 (validKeyInArray!0 (select (arr!48711 a!2804) j!70)))))

(declare-fun b!1514591 () Bool)

(declare-fun res!1034487 () Bool)

(assert (=> b!1514591 (=> (not res!1034487) (not e!845241))))

(declare-datatypes ((List!35194 0))(
  ( (Nil!35191) (Cons!35190 (h!36602 (_ BitVec 64)) (t!49888 List!35194)) )
))
(declare-fun arrayNoDuplicates!0 (array!100948 (_ BitVec 32) List!35194) Bool)

(assert (=> b!1514591 (= res!1034487 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35191))))

(declare-fun b!1514592 () Bool)

(declare-fun e!845240 () Bool)

(assert (=> b!1514592 (= e!845244 e!845240)))

(declare-fun res!1034495 () Bool)

(assert (=> b!1514592 (=> (not res!1034495) (not e!845240))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100948 (_ BitVec 32)) SeekEntryResult!12882)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100948 (_ BitVec 32)) SeekEntryResult!12882)

(assert (=> b!1514592 (= res!1034495 (= (seekEntryOrOpen!0 (select (arr!48711 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48711 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514593 () Bool)

(declare-fun lt!656387 () array!100948)

(assert (=> b!1514593 (= e!845240 (= (seekEntryOrOpen!0 lt!656386 lt!656387 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656386 lt!656387 mask!2512)))))

(declare-fun b!1514594 () Bool)

(assert (=> b!1514594 (= e!845239 e!845242)))

(declare-fun res!1034484 () Bool)

(assert (=> b!1514594 (=> (not res!1034484) (not e!845242))))

(assert (=> b!1514594 (= res!1034484 (= lt!656388 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656386 mask!2512) lt!656386 lt!656387 mask!2512)))))

(assert (=> b!1514594 (= lt!656386 (select (store (arr!48711 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514594 (= lt!656387 (array!100949 (store (arr!48711 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49261 a!2804)))))

(assert (= (and start!129092 res!1034497) b!1514584))

(assert (= (and b!1514584 res!1034486) b!1514582))

(assert (= (and b!1514582 res!1034492) b!1514590))

(assert (= (and b!1514590 res!1034496) b!1514588))

(assert (= (and b!1514588 res!1034494) b!1514591))

(assert (= (and b!1514591 res!1034487) b!1514585))

(assert (= (and b!1514585 res!1034488) b!1514586))

(assert (= (and b!1514586 res!1034493) b!1514581))

(assert (= (and b!1514581 res!1034491) b!1514594))

(assert (= (and b!1514594 res!1034484) b!1514589))

(assert (= (and b!1514589 res!1034490) b!1514583))

(assert (= (and b!1514583 res!1034485) b!1514587))

(assert (= (and b!1514587 (not res!1034489)) b!1514592))

(assert (= (and b!1514592 res!1034495) b!1514593))

(declare-fun m!1397549 () Bool)

(assert (=> b!1514589 m!1397549))

(declare-fun m!1397551 () Bool)

(assert (=> b!1514589 m!1397551))

(declare-fun m!1397553 () Bool)

(assert (=> b!1514593 m!1397553))

(declare-fun m!1397555 () Bool)

(assert (=> b!1514593 m!1397555))

(declare-fun m!1397557 () Bool)

(assert (=> b!1514590 m!1397557))

(assert (=> b!1514590 m!1397557))

(declare-fun m!1397559 () Bool)

(assert (=> b!1514590 m!1397559))

(assert (=> b!1514592 m!1397557))

(assert (=> b!1514592 m!1397557))

(declare-fun m!1397561 () Bool)

(assert (=> b!1514592 m!1397561))

(assert (=> b!1514592 m!1397557))

(declare-fun m!1397563 () Bool)

(assert (=> b!1514592 m!1397563))

(declare-fun m!1397565 () Bool)

(assert (=> start!129092 m!1397565))

(declare-fun m!1397567 () Bool)

(assert (=> start!129092 m!1397567))

(declare-fun m!1397569 () Bool)

(assert (=> b!1514588 m!1397569))

(assert (=> b!1514587 m!1397557))

(declare-fun m!1397571 () Bool)

(assert (=> b!1514587 m!1397571))

(assert (=> b!1514586 m!1397557))

(assert (=> b!1514586 m!1397557))

(declare-fun m!1397573 () Bool)

(assert (=> b!1514586 m!1397573))

(assert (=> b!1514586 m!1397573))

(assert (=> b!1514586 m!1397557))

(declare-fun m!1397575 () Bool)

(assert (=> b!1514586 m!1397575))

(declare-fun m!1397577 () Bool)

(assert (=> b!1514591 m!1397577))

(assert (=> b!1514581 m!1397557))

(assert (=> b!1514581 m!1397557))

(declare-fun m!1397579 () Bool)

(assert (=> b!1514581 m!1397579))

(assert (=> b!1514583 m!1397557))

(assert (=> b!1514583 m!1397557))

(declare-fun m!1397581 () Bool)

(assert (=> b!1514583 m!1397581))

(declare-fun m!1397583 () Bool)

(assert (=> b!1514594 m!1397583))

(assert (=> b!1514594 m!1397583))

(declare-fun m!1397585 () Bool)

(assert (=> b!1514594 m!1397585))

(declare-fun m!1397587 () Bool)

(assert (=> b!1514594 m!1397587))

(declare-fun m!1397589 () Bool)

(assert (=> b!1514594 m!1397589))

(declare-fun m!1397591 () Bool)

(assert (=> b!1514582 m!1397591))

(assert (=> b!1514582 m!1397591))

(declare-fun m!1397593 () Bool)

(assert (=> b!1514582 m!1397593))

(check-sat (not b!1514586) (not b!1514583) (not b!1514589) (not b!1514592) (not b!1514582) (not b!1514581) (not b!1514593) (not b!1514594) (not start!129092) (not b!1514590) (not b!1514588) (not b!1514591))
(check-sat)
