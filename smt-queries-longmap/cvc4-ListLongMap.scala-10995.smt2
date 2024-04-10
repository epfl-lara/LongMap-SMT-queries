; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128806 () Bool)

(assert start!128806)

(declare-fun b!1509309 () Bool)

(declare-fun res!1029214 () Bool)

(declare-fun e!843061 () Bool)

(assert (=> b!1509309 (=> (not res!1029214) (not e!843061))))

(declare-datatypes ((array!100662 0))(
  ( (array!100663 (arr!48568 (Array (_ BitVec 32) (_ BitVec 64))) (size!49118 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100662)

(declare-datatypes ((List!35051 0))(
  ( (Nil!35048) (Cons!35047 (h!36459 (_ BitVec 64)) (t!49745 List!35051)) )
))
(declare-fun arrayNoDuplicates!0 (array!100662 (_ BitVec 32) List!35051) Bool)

(assert (=> b!1509309 (= res!1029214 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35048))))

(declare-fun b!1509310 () Bool)

(declare-fun e!843060 () Bool)

(assert (=> b!1509310 (= e!843060 false)))

(declare-datatypes ((SeekEntryResult!12739 0))(
  ( (MissingZero!12739 (index!53351 (_ BitVec 32))) (Found!12739 (index!53352 (_ BitVec 32))) (Intermediate!12739 (undefined!13551 Bool) (index!53353 (_ BitVec 32)) (x!135105 (_ BitVec 32))) (Undefined!12739) (MissingVacant!12739 (index!53354 (_ BitVec 32))) )
))
(declare-fun lt!654856 () SeekEntryResult!12739)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100662 (_ BitVec 32)) SeekEntryResult!12739)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509310 (= lt!654856 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48568 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48568 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100663 (store (arr!48568 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49118 a!2804)) mask!2512))))

(declare-fun b!1509311 () Bool)

(declare-fun res!1029213 () Bool)

(assert (=> b!1509311 (=> (not res!1029213) (not e!843061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509311 (= res!1029213 (validKeyInArray!0 (select (arr!48568 a!2804) i!961)))))

(declare-fun b!1509312 () Bool)

(declare-fun res!1029218 () Bool)

(assert (=> b!1509312 (=> (not res!1029218) (not e!843061))))

(assert (=> b!1509312 (= res!1029218 (validKeyInArray!0 (select (arr!48568 a!2804) j!70)))))

(declare-fun b!1509313 () Bool)

(declare-fun res!1029220 () Bool)

(assert (=> b!1509313 (=> (not res!1029220) (not e!843061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100662 (_ BitVec 32)) Bool)

(assert (=> b!1509313 (= res!1029220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509314 () Bool)

(declare-fun res!1029216 () Bool)

(assert (=> b!1509314 (=> (not res!1029216) (not e!843060))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!654855 () SeekEntryResult!12739)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1509314 (= res!1029216 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48568 a!2804) j!70) a!2804 mask!2512) lt!654855))))

(declare-fun b!1509315 () Bool)

(declare-fun res!1029217 () Bool)

(assert (=> b!1509315 (=> (not res!1029217) (not e!843061))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509315 (= res!1029217 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49118 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49118 a!2804))))))

(declare-fun res!1029215 () Bool)

(assert (=> start!128806 (=> (not res!1029215) (not e!843061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128806 (= res!1029215 (validMask!0 mask!2512))))

(assert (=> start!128806 e!843061))

(assert (=> start!128806 true))

(declare-fun array_inv!37596 (array!100662) Bool)

(assert (=> start!128806 (array_inv!37596 a!2804)))

(declare-fun b!1509316 () Bool)

(assert (=> b!1509316 (= e!843061 e!843060)))

(declare-fun res!1029212 () Bool)

(assert (=> b!1509316 (=> (not res!1029212) (not e!843060))))

(assert (=> b!1509316 (= res!1029212 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48568 a!2804) j!70) mask!2512) (select (arr!48568 a!2804) j!70) a!2804 mask!2512) lt!654855))))

(assert (=> b!1509316 (= lt!654855 (Intermediate!12739 false resIndex!21 resX!21))))

(declare-fun b!1509317 () Bool)

(declare-fun res!1029219 () Bool)

(assert (=> b!1509317 (=> (not res!1029219) (not e!843061))))

(assert (=> b!1509317 (= res!1029219 (and (= (size!49118 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49118 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49118 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128806 res!1029215) b!1509317))

(assert (= (and b!1509317 res!1029219) b!1509311))

(assert (= (and b!1509311 res!1029213) b!1509312))

(assert (= (and b!1509312 res!1029218) b!1509313))

(assert (= (and b!1509313 res!1029220) b!1509309))

(assert (= (and b!1509309 res!1029214) b!1509315))

(assert (= (and b!1509315 res!1029217) b!1509316))

(assert (= (and b!1509316 res!1029212) b!1509314))

(assert (= (and b!1509314 res!1029216) b!1509310))

(declare-fun m!1391773 () Bool)

(assert (=> b!1509316 m!1391773))

(assert (=> b!1509316 m!1391773))

(declare-fun m!1391775 () Bool)

(assert (=> b!1509316 m!1391775))

(assert (=> b!1509316 m!1391775))

(assert (=> b!1509316 m!1391773))

(declare-fun m!1391777 () Bool)

(assert (=> b!1509316 m!1391777))

(declare-fun m!1391779 () Bool)

(assert (=> b!1509310 m!1391779))

(declare-fun m!1391781 () Bool)

(assert (=> b!1509310 m!1391781))

(assert (=> b!1509310 m!1391781))

(declare-fun m!1391783 () Bool)

(assert (=> b!1509310 m!1391783))

(assert (=> b!1509310 m!1391783))

(assert (=> b!1509310 m!1391781))

(declare-fun m!1391785 () Bool)

(assert (=> b!1509310 m!1391785))

(declare-fun m!1391787 () Bool)

(assert (=> start!128806 m!1391787))

(declare-fun m!1391789 () Bool)

(assert (=> start!128806 m!1391789))

(assert (=> b!1509312 m!1391773))

(assert (=> b!1509312 m!1391773))

(declare-fun m!1391791 () Bool)

(assert (=> b!1509312 m!1391791))

(declare-fun m!1391793 () Bool)

(assert (=> b!1509309 m!1391793))

(declare-fun m!1391795 () Bool)

(assert (=> b!1509313 m!1391795))

(assert (=> b!1509314 m!1391773))

(assert (=> b!1509314 m!1391773))

(declare-fun m!1391797 () Bool)

(assert (=> b!1509314 m!1391797))

(declare-fun m!1391799 () Bool)

(assert (=> b!1509311 m!1391799))

(assert (=> b!1509311 m!1391799))

(declare-fun m!1391801 () Bool)

(assert (=> b!1509311 m!1391801))

(push 1)

(assert (not b!1509312))

(assert (not b!1509311))

(assert (not b!1509310))

(assert (not b!1509314))

(assert (not b!1509313))

