; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128940 () Bool)

(assert start!128940)

(declare-fun b!1511500 () Bool)

(declare-fun res!1031403 () Bool)

(declare-fun e!843846 () Bool)

(assert (=> b!1511500 (=> (not res!1031403) (not e!843846))))

(declare-datatypes ((array!100796 0))(
  ( (array!100797 (arr!48635 (Array (_ BitVec 32) (_ BitVec 64))) (size!49185 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100796)

(declare-datatypes ((List!35118 0))(
  ( (Nil!35115) (Cons!35114 (h!36526 (_ BitVec 64)) (t!49812 List!35118)) )
))
(declare-fun arrayNoDuplicates!0 (array!100796 (_ BitVec 32) List!35118) Bool)

(assert (=> b!1511500 (= res!1031403 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35115))))

(declare-fun b!1511501 () Bool)

(declare-fun e!843847 () Bool)

(assert (=> b!1511501 (= e!843847 (not true))))

(declare-fun e!843845 () Bool)

(assert (=> b!1511501 e!843845))

(declare-fun res!1031411 () Bool)

(assert (=> b!1511501 (=> (not res!1031411) (not e!843845))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100796 (_ BitVec 32)) Bool)

(assert (=> b!1511501 (= res!1031411 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50480 0))(
  ( (Unit!50481) )
))
(declare-fun lt!655458 () Unit!50480)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50480)

(assert (=> b!1511501 (= lt!655458 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511502 () Bool)

(declare-fun res!1031412 () Bool)

(assert (=> b!1511502 (=> (not res!1031412) (not e!843846))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511502 (= res!1031412 (validKeyInArray!0 (select (arr!48635 a!2804) i!961)))))

(declare-fun b!1511503 () Bool)

(declare-fun res!1031405 () Bool)

(assert (=> b!1511503 (=> (not res!1031405) (not e!843847))))

(declare-datatypes ((SeekEntryResult!12806 0))(
  ( (MissingZero!12806 (index!53619 (_ BitVec 32))) (Found!12806 (index!53620 (_ BitVec 32))) (Intermediate!12806 (undefined!13618 Bool) (index!53621 (_ BitVec 32)) (x!135356 (_ BitVec 32))) (Undefined!12806) (MissingVacant!12806 (index!53622 (_ BitVec 32))) )
))
(declare-fun lt!655457 () SeekEntryResult!12806)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100796 (_ BitVec 32)) SeekEntryResult!12806)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511503 (= res!1031405 (= lt!655457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48635 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48635 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100797 (store (arr!48635 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49185 a!2804)) mask!2512)))))

(declare-fun b!1511504 () Bool)

(declare-fun res!1031404 () Bool)

(assert (=> b!1511504 (=> (not res!1031404) (not e!843846))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511504 (= res!1031404 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49185 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49185 a!2804))))))

(declare-fun b!1511505 () Bool)

(declare-fun res!1031406 () Bool)

(assert (=> b!1511505 (=> (not res!1031406) (not e!843846))))

(assert (=> b!1511505 (= res!1031406 (and (= (size!49185 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49185 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49185 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511506 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100796 (_ BitVec 32)) SeekEntryResult!12806)

(assert (=> b!1511506 (= e!843845 (= (seekEntry!0 (select (arr!48635 a!2804) j!70) a!2804 mask!2512) (Found!12806 j!70)))))

(declare-fun b!1511507 () Bool)

(declare-fun res!1031413 () Bool)

(assert (=> b!1511507 (=> (not res!1031413) (not e!843846))))

(assert (=> b!1511507 (= res!1031413 (validKeyInArray!0 (select (arr!48635 a!2804) j!70)))))

(declare-fun res!1031408 () Bool)

(assert (=> start!128940 (=> (not res!1031408) (not e!843846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128940 (= res!1031408 (validMask!0 mask!2512))))

(assert (=> start!128940 e!843846))

(assert (=> start!128940 true))

(declare-fun array_inv!37663 (array!100796) Bool)

(assert (=> start!128940 (array_inv!37663 a!2804)))

(declare-fun b!1511508 () Bool)

(declare-fun res!1031409 () Bool)

(assert (=> b!1511508 (=> (not res!1031409) (not e!843847))))

(declare-fun lt!655459 () SeekEntryResult!12806)

(assert (=> b!1511508 (= res!1031409 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48635 a!2804) j!70) a!2804 mask!2512) lt!655459))))

(declare-fun b!1511509 () Bool)

(declare-fun res!1031407 () Bool)

(assert (=> b!1511509 (=> (not res!1031407) (not e!843846))))

(assert (=> b!1511509 (= res!1031407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511510 () Bool)

(assert (=> b!1511510 (= e!843846 e!843847)))

(declare-fun res!1031410 () Bool)

(assert (=> b!1511510 (=> (not res!1031410) (not e!843847))))

(assert (=> b!1511510 (= res!1031410 (= lt!655457 lt!655459))))

(assert (=> b!1511510 (= lt!655459 (Intermediate!12806 false resIndex!21 resX!21))))

(assert (=> b!1511510 (= lt!655457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48635 a!2804) j!70) mask!2512) (select (arr!48635 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!128940 res!1031408) b!1511505))

(assert (= (and b!1511505 res!1031406) b!1511502))

(assert (= (and b!1511502 res!1031412) b!1511507))

(assert (= (and b!1511507 res!1031413) b!1511509))

(assert (= (and b!1511509 res!1031407) b!1511500))

(assert (= (and b!1511500 res!1031403) b!1511504))

(assert (= (and b!1511504 res!1031404) b!1511510))

(assert (= (and b!1511510 res!1031410) b!1511508))

(assert (= (and b!1511508 res!1031409) b!1511503))

(assert (= (and b!1511503 res!1031405) b!1511501))

(assert (= (and b!1511501 res!1031411) b!1511506))

(declare-fun m!1394203 () Bool)

(assert (=> b!1511509 m!1394203))

(declare-fun m!1394205 () Bool)

(assert (=> b!1511507 m!1394205))

(assert (=> b!1511507 m!1394205))

(declare-fun m!1394207 () Bool)

(assert (=> b!1511507 m!1394207))

(declare-fun m!1394209 () Bool)

(assert (=> b!1511500 m!1394209))

(declare-fun m!1394211 () Bool)

(assert (=> b!1511502 m!1394211))

(assert (=> b!1511502 m!1394211))

(declare-fun m!1394213 () Bool)

(assert (=> b!1511502 m!1394213))

(declare-fun m!1394215 () Bool)

(assert (=> start!128940 m!1394215))

(declare-fun m!1394217 () Bool)

(assert (=> start!128940 m!1394217))

(assert (=> b!1511508 m!1394205))

(assert (=> b!1511508 m!1394205))

(declare-fun m!1394219 () Bool)

(assert (=> b!1511508 m!1394219))

(assert (=> b!1511510 m!1394205))

(assert (=> b!1511510 m!1394205))

(declare-fun m!1394221 () Bool)

(assert (=> b!1511510 m!1394221))

(assert (=> b!1511510 m!1394221))

(assert (=> b!1511510 m!1394205))

(declare-fun m!1394223 () Bool)

(assert (=> b!1511510 m!1394223))

(declare-fun m!1394225 () Bool)

(assert (=> b!1511503 m!1394225))

(declare-fun m!1394227 () Bool)

(assert (=> b!1511503 m!1394227))

(assert (=> b!1511503 m!1394227))

(declare-fun m!1394229 () Bool)

(assert (=> b!1511503 m!1394229))

(assert (=> b!1511503 m!1394229))

(assert (=> b!1511503 m!1394227))

(declare-fun m!1394231 () Bool)

(assert (=> b!1511503 m!1394231))

(assert (=> b!1511506 m!1394205))

(assert (=> b!1511506 m!1394205))

(declare-fun m!1394233 () Bool)

(assert (=> b!1511506 m!1394233))

(declare-fun m!1394235 () Bool)

(assert (=> b!1511501 m!1394235))

(declare-fun m!1394237 () Bool)

(assert (=> b!1511501 m!1394237))

(push 1)

