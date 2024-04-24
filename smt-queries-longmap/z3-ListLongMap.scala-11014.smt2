; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129218 () Bool)

(assert start!129218)

(declare-fun b!1512936 () Bool)

(declare-fun res!1031663 () Bool)

(declare-fun e!844838 () Bool)

(assert (=> b!1512936 (=> (not res!1031663) (not e!844838))))

(declare-datatypes ((SeekEntryResult!12740 0))(
  ( (MissingZero!12740 (index!53355 (_ BitVec 32))) (Found!12740 (index!53356 (_ BitVec 32))) (Intermediate!12740 (undefined!13552 Bool) (index!53357 (_ BitVec 32)) (x!135295 (_ BitVec 32))) (Undefined!12740) (MissingVacant!12740 (index!53358 (_ BitVec 32))) )
))
(declare-fun lt!656012 () SeekEntryResult!12740)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100888 0))(
  ( (array!100889 (arr!48676 (Array (_ BitVec 32) (_ BitVec 64))) (size!49227 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100888)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100888 (_ BitVec 32)) SeekEntryResult!12740)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512936 (= res!1031663 (= lt!656012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48676 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48676 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100889 (store (arr!48676 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49227 a!2804)) mask!2512)))))

(declare-fun b!1512937 () Bool)

(declare-fun res!1031668 () Bool)

(declare-fun e!844837 () Bool)

(assert (=> b!1512937 (=> (not res!1031668) (not e!844837))))

(assert (=> b!1512937 (= res!1031668 (and (= (size!49227 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49227 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49227 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512938 () Bool)

(assert (=> b!1512938 (= e!844837 e!844838)))

(declare-fun res!1031667 () Bool)

(assert (=> b!1512938 (=> (not res!1031667) (not e!844838))))

(declare-fun lt!656014 () SeekEntryResult!12740)

(assert (=> b!1512938 (= res!1031667 (= lt!656012 lt!656014))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1512938 (= lt!656014 (Intermediate!12740 false resIndex!21 resX!21))))

(assert (=> b!1512938 (= lt!656012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48676 a!2804) j!70) mask!2512) (select (arr!48676 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512939 () Bool)

(declare-fun e!844836 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100888 (_ BitVec 32)) SeekEntryResult!12740)

(assert (=> b!1512939 (= e!844836 (= (seekEntry!0 (select (arr!48676 a!2804) j!70) a!2804 mask!2512) (Found!12740 j!70)))))

(declare-fun b!1512940 () Bool)

(declare-fun res!1031662 () Bool)

(assert (=> b!1512940 (=> (not res!1031662) (not e!844837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512940 (= res!1031662 (validKeyInArray!0 (select (arr!48676 a!2804) i!961)))))

(declare-fun b!1512941 () Bool)

(declare-fun res!1031671 () Bool)

(assert (=> b!1512941 (=> (not res!1031671) (not e!844838))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1512941 (= res!1031671 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48676 a!2804) j!70) a!2804 mask!2512) lt!656014))))

(declare-fun b!1512943 () Bool)

(declare-fun res!1031672 () Bool)

(assert (=> b!1512943 (=> (not res!1031672) (not e!844837))))

(assert (=> b!1512943 (= res!1031672 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49227 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49227 a!2804))))))

(declare-fun b!1512944 () Bool)

(assert (=> b!1512944 (= e!844838 (not (or (not (= (select (arr!48676 a!2804) j!70) (select (store (arr!48676 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48676 a!2804) index!487) (select (arr!48676 a!2804) j!70)) (not (= (select (arr!48676 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvslt index!487 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(assert (=> b!1512944 e!844836))

(declare-fun res!1031666 () Bool)

(assert (=> b!1512944 (=> (not res!1031666) (not e!844836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100888 (_ BitVec 32)) Bool)

(assert (=> b!1512944 (= res!1031666 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50383 0))(
  ( (Unit!50384) )
))
(declare-fun lt!656013 () Unit!50383)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50383)

(assert (=> b!1512944 (= lt!656013 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512945 () Bool)

(declare-fun res!1031664 () Bool)

(assert (=> b!1512945 (=> (not res!1031664) (not e!844837))))

(assert (=> b!1512945 (= res!1031664 (validKeyInArray!0 (select (arr!48676 a!2804) j!70)))))

(declare-fun b!1512946 () Bool)

(declare-fun res!1031669 () Bool)

(assert (=> b!1512946 (=> (not res!1031669) (not e!844837))))

(assert (=> b!1512946 (= res!1031669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1031670 () Bool)

(assert (=> start!129218 (=> (not res!1031670) (not e!844837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129218 (= res!1031670 (validMask!0 mask!2512))))

(assert (=> start!129218 e!844837))

(assert (=> start!129218 true))

(declare-fun array_inv!37957 (array!100888) Bool)

(assert (=> start!129218 (array_inv!37957 a!2804)))

(declare-fun b!1512942 () Bool)

(declare-fun res!1031665 () Bool)

(assert (=> b!1512942 (=> (not res!1031665) (not e!844837))))

(declare-datatypes ((List!35146 0))(
  ( (Nil!35143) (Cons!35142 (h!36569 (_ BitVec 64)) (t!49832 List!35146)) )
))
(declare-fun arrayNoDuplicates!0 (array!100888 (_ BitVec 32) List!35146) Bool)

(assert (=> b!1512942 (= res!1031665 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35143))))

(assert (= (and start!129218 res!1031670) b!1512937))

(assert (= (and b!1512937 res!1031668) b!1512940))

(assert (= (and b!1512940 res!1031662) b!1512945))

(assert (= (and b!1512945 res!1031664) b!1512946))

(assert (= (and b!1512946 res!1031669) b!1512942))

(assert (= (and b!1512942 res!1031665) b!1512943))

(assert (= (and b!1512943 res!1031672) b!1512938))

(assert (= (and b!1512938 res!1031667) b!1512941))

(assert (= (and b!1512941 res!1031671) b!1512936))

(assert (= (and b!1512936 res!1031663) b!1512944))

(assert (= (and b!1512944 res!1031666) b!1512939))

(declare-fun m!1395561 () Bool)

(assert (=> b!1512942 m!1395561))

(declare-fun m!1395563 () Bool)

(assert (=> b!1512941 m!1395563))

(assert (=> b!1512941 m!1395563))

(declare-fun m!1395565 () Bool)

(assert (=> b!1512941 m!1395565))

(assert (=> b!1512944 m!1395563))

(declare-fun m!1395567 () Bool)

(assert (=> b!1512944 m!1395567))

(declare-fun m!1395569 () Bool)

(assert (=> b!1512944 m!1395569))

(declare-fun m!1395571 () Bool)

(assert (=> b!1512944 m!1395571))

(declare-fun m!1395573 () Bool)

(assert (=> b!1512944 m!1395573))

(declare-fun m!1395575 () Bool)

(assert (=> b!1512944 m!1395575))

(declare-fun m!1395577 () Bool)

(assert (=> b!1512940 m!1395577))

(assert (=> b!1512940 m!1395577))

(declare-fun m!1395579 () Bool)

(assert (=> b!1512940 m!1395579))

(declare-fun m!1395581 () Bool)

(assert (=> start!129218 m!1395581))

(declare-fun m!1395583 () Bool)

(assert (=> start!129218 m!1395583))

(assert (=> b!1512939 m!1395563))

(assert (=> b!1512939 m!1395563))

(declare-fun m!1395585 () Bool)

(assert (=> b!1512939 m!1395585))

(assert (=> b!1512938 m!1395563))

(assert (=> b!1512938 m!1395563))

(declare-fun m!1395587 () Bool)

(assert (=> b!1512938 m!1395587))

(assert (=> b!1512938 m!1395587))

(assert (=> b!1512938 m!1395563))

(declare-fun m!1395589 () Bool)

(assert (=> b!1512938 m!1395589))

(assert (=> b!1512936 m!1395569))

(assert (=> b!1512936 m!1395573))

(assert (=> b!1512936 m!1395573))

(declare-fun m!1395591 () Bool)

(assert (=> b!1512936 m!1395591))

(assert (=> b!1512936 m!1395591))

(assert (=> b!1512936 m!1395573))

(declare-fun m!1395593 () Bool)

(assert (=> b!1512936 m!1395593))

(assert (=> b!1512945 m!1395563))

(assert (=> b!1512945 m!1395563))

(declare-fun m!1395595 () Bool)

(assert (=> b!1512945 m!1395595))

(declare-fun m!1395597 () Bool)

(assert (=> b!1512946 m!1395597))

(check-sat (not b!1512936) (not b!1512946) (not b!1512944) (not b!1512938) (not b!1512942) (not b!1512941) (not b!1512945) (not start!129218) (not b!1512939) (not b!1512940))
(check-sat)
