; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130158 () Bool)

(assert start!130158)

(declare-fun b!1525573 () Bool)

(declare-fun res!1042996 () Bool)

(declare-fun e!850700 () Bool)

(assert (=> b!1525573 (=> (not res!1042996) (not e!850700))))

(declare-datatypes ((array!101491 0))(
  ( (array!101492 (arr!48970 (Array (_ BitVec 32) (_ BitVec 64))) (size!49521 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101491)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525573 (= res!1042996 (validKeyInArray!0 (select (arr!48970 a!2804) j!70)))))

(declare-fun b!1525574 () Bool)

(declare-fun e!850701 () Bool)

(assert (=> b!1525574 (= e!850700 e!850701)))

(declare-fun res!1042997 () Bool)

(assert (=> b!1525574 (=> (not res!1042997) (not e!850701))))

(declare-datatypes ((SeekEntryResult!13028 0))(
  ( (MissingZero!13028 (index!54507 (_ BitVec 32))) (Found!13028 (index!54508 (_ BitVec 32))) (Intermediate!13028 (undefined!13840 Bool) (index!54509 (_ BitVec 32)) (x!136409 (_ BitVec 32))) (Undefined!13028) (MissingVacant!13028 (index!54510 (_ BitVec 32))) )
))
(declare-fun lt!660784 () SeekEntryResult!13028)

(declare-fun lt!660786 () SeekEntryResult!13028)

(assert (=> b!1525574 (= res!1042997 (= lt!660784 lt!660786))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1525574 (= lt!660786 (Intermediate!13028 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101491 (_ BitVec 32)) SeekEntryResult!13028)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525574 (= lt!660784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48970 a!2804) j!70) mask!2512) (select (arr!48970 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525575 () Bool)

(declare-fun res!1042998 () Bool)

(assert (=> b!1525575 (=> (not res!1042998) (not e!850701))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1525575 (= res!1042998 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48970 a!2804) j!70) a!2804 mask!2512) lt!660786))))

(declare-fun b!1525576 () Bool)

(declare-fun res!1042995 () Bool)

(assert (=> b!1525576 (=> (not res!1042995) (not e!850700))))

(assert (=> b!1525576 (= res!1042995 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49521 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49521 a!2804))))))

(declare-fun b!1525577 () Bool)

(declare-fun res!1043000 () Bool)

(assert (=> b!1525577 (=> (not res!1043000) (not e!850700))))

(declare-datatypes ((List!35440 0))(
  ( (Nil!35437) (Cons!35436 (h!36878 (_ BitVec 64)) (t!50126 List!35440)) )
))
(declare-fun arrayNoDuplicates!0 (array!101491 (_ BitVec 32) List!35440) Bool)

(assert (=> b!1525577 (= res!1043000 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35437))))

(declare-fun b!1525578 () Bool)

(assert (=> b!1525578 (= e!850701 (not true))))

(declare-fun e!850699 () Bool)

(assert (=> b!1525578 e!850699))

(declare-fun res!1043004 () Bool)

(assert (=> b!1525578 (=> (not res!1043004) (not e!850699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101491 (_ BitVec 32)) Bool)

(assert (=> b!1525578 (= res!1043004 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50875 0))(
  ( (Unit!50876) )
))
(declare-fun lt!660785 () Unit!50875)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50875)

(assert (=> b!1525578 (= lt!660785 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1043001 () Bool)

(assert (=> start!130158 (=> (not res!1043001) (not e!850700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130158 (= res!1043001 (validMask!0 mask!2512))))

(assert (=> start!130158 e!850700))

(assert (=> start!130158 true))

(declare-fun array_inv!38251 (array!101491) Bool)

(assert (=> start!130158 (array_inv!38251 a!2804)))

(declare-fun b!1525579 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101491 (_ BitVec 32)) SeekEntryResult!13028)

(assert (=> b!1525579 (= e!850699 (= (seekEntry!0 (select (arr!48970 a!2804) j!70) a!2804 mask!2512) (Found!13028 j!70)))))

(declare-fun b!1525580 () Bool)

(declare-fun res!1042999 () Bool)

(assert (=> b!1525580 (=> (not res!1042999) (not e!850700))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1525580 (= res!1042999 (validKeyInArray!0 (select (arr!48970 a!2804) i!961)))))

(declare-fun b!1525581 () Bool)

(declare-fun res!1043002 () Bool)

(assert (=> b!1525581 (=> (not res!1043002) (not e!850700))))

(assert (=> b!1525581 (= res!1043002 (and (= (size!49521 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49521 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49521 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525582 () Bool)

(declare-fun res!1042994 () Bool)

(assert (=> b!1525582 (=> (not res!1042994) (not e!850701))))

(assert (=> b!1525582 (= res!1042994 (= lt!660784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48970 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48970 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101492 (store (arr!48970 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49521 a!2804)) mask!2512)))))

(declare-fun b!1525583 () Bool)

(declare-fun res!1043003 () Bool)

(assert (=> b!1525583 (=> (not res!1043003) (not e!850700))))

(assert (=> b!1525583 (= res!1043003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130158 res!1043001) b!1525581))

(assert (= (and b!1525581 res!1043002) b!1525580))

(assert (= (and b!1525580 res!1042999) b!1525573))

(assert (= (and b!1525573 res!1042996) b!1525583))

(assert (= (and b!1525583 res!1043003) b!1525577))

(assert (= (and b!1525577 res!1043000) b!1525576))

(assert (= (and b!1525576 res!1042995) b!1525574))

(assert (= (and b!1525574 res!1042997) b!1525575))

(assert (= (and b!1525575 res!1042998) b!1525582))

(assert (= (and b!1525582 res!1042994) b!1525578))

(assert (= (and b!1525578 res!1043004) b!1525579))

(declare-fun m!1408525 () Bool)

(assert (=> start!130158 m!1408525))

(declare-fun m!1408527 () Bool)

(assert (=> start!130158 m!1408527))

(declare-fun m!1408529 () Bool)

(assert (=> b!1525578 m!1408529))

(declare-fun m!1408531 () Bool)

(assert (=> b!1525578 m!1408531))

(declare-fun m!1408533 () Bool)

(assert (=> b!1525579 m!1408533))

(assert (=> b!1525579 m!1408533))

(declare-fun m!1408535 () Bool)

(assert (=> b!1525579 m!1408535))

(declare-fun m!1408537 () Bool)

(assert (=> b!1525577 m!1408537))

(assert (=> b!1525574 m!1408533))

(assert (=> b!1525574 m!1408533))

(declare-fun m!1408539 () Bool)

(assert (=> b!1525574 m!1408539))

(assert (=> b!1525574 m!1408539))

(assert (=> b!1525574 m!1408533))

(declare-fun m!1408541 () Bool)

(assert (=> b!1525574 m!1408541))

(declare-fun m!1408543 () Bool)

(assert (=> b!1525580 m!1408543))

(assert (=> b!1525580 m!1408543))

(declare-fun m!1408545 () Bool)

(assert (=> b!1525580 m!1408545))

(assert (=> b!1525575 m!1408533))

(assert (=> b!1525575 m!1408533))

(declare-fun m!1408547 () Bool)

(assert (=> b!1525575 m!1408547))

(declare-fun m!1408549 () Bool)

(assert (=> b!1525582 m!1408549))

(declare-fun m!1408551 () Bool)

(assert (=> b!1525582 m!1408551))

(assert (=> b!1525582 m!1408551))

(declare-fun m!1408553 () Bool)

(assert (=> b!1525582 m!1408553))

(assert (=> b!1525582 m!1408553))

(assert (=> b!1525582 m!1408551))

(declare-fun m!1408555 () Bool)

(assert (=> b!1525582 m!1408555))

(assert (=> b!1525573 m!1408533))

(assert (=> b!1525573 m!1408533))

(declare-fun m!1408557 () Bool)

(assert (=> b!1525573 m!1408557))

(declare-fun m!1408559 () Bool)

(assert (=> b!1525583 m!1408559))

(check-sat (not start!130158) (not b!1525583) (not b!1525580) (not b!1525582) (not b!1525574) (not b!1525579) (not b!1525573) (not b!1525577) (not b!1525578) (not b!1525575))
(check-sat)
