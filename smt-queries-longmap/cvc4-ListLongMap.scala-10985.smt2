; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128704 () Bool)

(assert start!128704)

(declare-fun b!1508301 () Bool)

(declare-fun res!1028312 () Bool)

(declare-fun e!842659 () Bool)

(assert (=> b!1508301 (=> (not res!1028312) (not e!842659))))

(declare-datatypes ((array!100599 0))(
  ( (array!100600 (arr!48538 (Array (_ BitVec 32) (_ BitVec 64))) (size!49088 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100599)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508301 (= res!1028312 (validKeyInArray!0 (select (arr!48538 a!2804) i!961)))))

(declare-fun res!1028317 () Bool)

(assert (=> start!128704 (=> (not res!1028317) (not e!842659))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128704 (= res!1028317 (validMask!0 mask!2512))))

(assert (=> start!128704 e!842659))

(assert (=> start!128704 true))

(declare-fun array_inv!37566 (array!100599) Bool)

(assert (=> start!128704 (array_inv!37566 a!2804)))

(declare-fun b!1508302 () Bool)

(declare-fun res!1028310 () Bool)

(assert (=> b!1508302 (=> (not res!1028310) (not e!842659))))

(declare-datatypes ((List!35021 0))(
  ( (Nil!35018) (Cons!35017 (h!36426 (_ BitVec 64)) (t!49715 List!35021)) )
))
(declare-fun arrayNoDuplicates!0 (array!100599 (_ BitVec 32) List!35021) Bool)

(assert (=> b!1508302 (= res!1028310 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35018))))

(declare-fun b!1508303 () Bool)

(declare-fun e!842658 () Bool)

(assert (=> b!1508303 (= e!842658 false)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun lt!654600 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508303 (= lt!654600 (toIndex!0 (select (store (arr!48538 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508304 () Bool)

(assert (=> b!1508304 (= e!842659 e!842658)))

(declare-fun res!1028316 () Bool)

(assert (=> b!1508304 (=> (not res!1028316) (not e!842658))))

(declare-datatypes ((SeekEntryResult!12709 0))(
  ( (MissingZero!12709 (index!53231 (_ BitVec 32))) (Found!12709 (index!53232 (_ BitVec 32))) (Intermediate!12709 (undefined!13521 Bool) (index!53233 (_ BitVec 32)) (x!134989 (_ BitVec 32))) (Undefined!12709) (MissingVacant!12709 (index!53234 (_ BitVec 32))) )
))
(declare-fun lt!654601 () SeekEntryResult!12709)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100599 (_ BitVec 32)) SeekEntryResult!12709)

(assert (=> b!1508304 (= res!1028316 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48538 a!2804) j!70) mask!2512) (select (arr!48538 a!2804) j!70) a!2804 mask!2512) lt!654601))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508304 (= lt!654601 (Intermediate!12709 false resIndex!21 resX!21))))

(declare-fun b!1508305 () Bool)

(declare-fun res!1028313 () Bool)

(assert (=> b!1508305 (=> (not res!1028313) (not e!842659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100599 (_ BitVec 32)) Bool)

(assert (=> b!1508305 (= res!1028313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508306 () Bool)

(declare-fun res!1028311 () Bool)

(assert (=> b!1508306 (=> (not res!1028311) (not e!842659))))

(assert (=> b!1508306 (= res!1028311 (and (= (size!49088 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49088 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49088 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508307 () Bool)

(declare-fun res!1028315 () Bool)

(assert (=> b!1508307 (=> (not res!1028315) (not e!842659))))

(assert (=> b!1508307 (= res!1028315 (validKeyInArray!0 (select (arr!48538 a!2804) j!70)))))

(declare-fun b!1508308 () Bool)

(declare-fun res!1028314 () Bool)

(assert (=> b!1508308 (=> (not res!1028314) (not e!842659))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1508308 (= res!1028314 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49088 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49088 a!2804))))))

(declare-fun b!1508309 () Bool)

(declare-fun res!1028309 () Bool)

(assert (=> b!1508309 (=> (not res!1028309) (not e!842658))))

(assert (=> b!1508309 (= res!1028309 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48538 a!2804) j!70) a!2804 mask!2512) lt!654601))))

(assert (= (and start!128704 res!1028317) b!1508306))

(assert (= (and b!1508306 res!1028311) b!1508301))

(assert (= (and b!1508301 res!1028312) b!1508307))

(assert (= (and b!1508307 res!1028315) b!1508305))

(assert (= (and b!1508305 res!1028313) b!1508302))

(assert (= (and b!1508302 res!1028310) b!1508308))

(assert (= (and b!1508308 res!1028314) b!1508304))

(assert (= (and b!1508304 res!1028316) b!1508309))

(assert (= (and b!1508309 res!1028309) b!1508303))

(declare-fun m!1390803 () Bool)

(assert (=> b!1508302 m!1390803))

(declare-fun m!1390805 () Bool)

(assert (=> start!128704 m!1390805))

(declare-fun m!1390807 () Bool)

(assert (=> start!128704 m!1390807))

(declare-fun m!1390809 () Bool)

(assert (=> b!1508301 m!1390809))

(assert (=> b!1508301 m!1390809))

(declare-fun m!1390811 () Bool)

(assert (=> b!1508301 m!1390811))

(declare-fun m!1390813 () Bool)

(assert (=> b!1508304 m!1390813))

(assert (=> b!1508304 m!1390813))

(declare-fun m!1390815 () Bool)

(assert (=> b!1508304 m!1390815))

(assert (=> b!1508304 m!1390815))

(assert (=> b!1508304 m!1390813))

(declare-fun m!1390817 () Bool)

(assert (=> b!1508304 m!1390817))

(declare-fun m!1390819 () Bool)

(assert (=> b!1508303 m!1390819))

(declare-fun m!1390821 () Bool)

(assert (=> b!1508303 m!1390821))

(assert (=> b!1508303 m!1390821))

(declare-fun m!1390823 () Bool)

(assert (=> b!1508303 m!1390823))

(declare-fun m!1390825 () Bool)

(assert (=> b!1508305 m!1390825))

(assert (=> b!1508307 m!1390813))

(assert (=> b!1508307 m!1390813))

(declare-fun m!1390827 () Bool)

(assert (=> b!1508307 m!1390827))

(assert (=> b!1508309 m!1390813))

(assert (=> b!1508309 m!1390813))

(declare-fun m!1390829 () Bool)

(assert (=> b!1508309 m!1390829))

(push 1)

(assert (not b!1508304))

(assert (not b!1508307))

(assert (not b!1508309))

(assert (not b!1508305))

(assert (not b!1508301))

(assert (not b!1508302))

(assert (not b!1508303))

(assert (not start!128704))

(check-sat)

