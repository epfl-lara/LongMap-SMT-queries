; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130256 () Bool)

(assert start!130256)

(declare-fun b!1529172 () Bool)

(declare-fun res!1046882 () Bool)

(declare-fun e!852221 () Bool)

(assert (=> b!1529172 (=> (not res!1046882) (not e!852221))))

(declare-datatypes ((array!101606 0))(
  ( (array!101607 (arr!49028 (Array (_ BitVec 32) (_ BitVec 64))) (size!49578 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101606)

(declare-datatypes ((List!35511 0))(
  ( (Nil!35508) (Cons!35507 (h!36943 (_ BitVec 64)) (t!50205 List!35511)) )
))
(declare-fun arrayNoDuplicates!0 (array!101606 (_ BitVec 32) List!35511) Bool)

(assert (=> b!1529172 (= res!1046882 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35508))))

(declare-fun b!1529173 () Bool)

(declare-fun e!852223 () Bool)

(assert (=> b!1529173 (= e!852223 true)))

(declare-fun lt!662345 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529173 (= lt!662345 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529174 () Bool)

(declare-fun res!1046883 () Bool)

(declare-fun e!852219 () Bool)

(assert (=> b!1529174 (=> (not res!1046883) (not e!852219))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13193 0))(
  ( (MissingZero!13193 (index!55167 (_ BitVec 32))) (Found!13193 (index!55168 (_ BitVec 32))) (Intermediate!13193 (undefined!14005 Bool) (index!55169 (_ BitVec 32)) (x!136856 (_ BitVec 32))) (Undefined!13193) (MissingVacant!13193 (index!55170 (_ BitVec 32))) )
))
(declare-fun lt!662344 () SeekEntryResult!13193)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101606 (_ BitVec 32)) SeekEntryResult!13193)

(assert (=> b!1529174 (= res!1046883 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49028 a!2804) j!70) a!2804 mask!2512) lt!662344))))

(declare-fun b!1529175 () Bool)

(assert (=> b!1529175 (= e!852219 (not e!852223))))

(declare-fun res!1046880 () Bool)

(assert (=> b!1529175 (=> res!1046880 e!852223)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1529175 (= res!1046880 (or (not (= (select (arr!49028 a!2804) j!70) (select (store (arr!49028 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852222 () Bool)

(assert (=> b!1529175 e!852222))

(declare-fun res!1046879 () Bool)

(assert (=> b!1529175 (=> (not res!1046879) (not e!852222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101606 (_ BitVec 32)) Bool)

(assert (=> b!1529175 (= res!1046879 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51170 0))(
  ( (Unit!51171) )
))
(declare-fun lt!662347 () Unit!51170)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51170)

(assert (=> b!1529175 (= lt!662347 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529176 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101606 (_ BitVec 32)) SeekEntryResult!13193)

(assert (=> b!1529176 (= e!852222 (= (seekEntry!0 (select (arr!49028 a!2804) j!70) a!2804 mask!2512) (Found!13193 j!70)))))

(declare-fun b!1529177 () Bool)

(declare-fun res!1046881 () Bool)

(assert (=> b!1529177 (=> (not res!1046881) (not e!852221))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529177 (= res!1046881 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49578 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49578 a!2804))))))

(declare-fun b!1529178 () Bool)

(declare-fun res!1046884 () Bool)

(assert (=> b!1529178 (=> (not res!1046884) (not e!852221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529178 (= res!1046884 (validKeyInArray!0 (select (arr!49028 a!2804) j!70)))))

(declare-fun b!1529179 () Bool)

(assert (=> b!1529179 (= e!852221 e!852219)))

(declare-fun res!1046885 () Bool)

(assert (=> b!1529179 (=> (not res!1046885) (not e!852219))))

(declare-fun lt!662346 () SeekEntryResult!13193)

(assert (=> b!1529179 (= res!1046885 (= lt!662346 lt!662344))))

(assert (=> b!1529179 (= lt!662344 (Intermediate!13193 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529179 (= lt!662346 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49028 a!2804) j!70) mask!2512) (select (arr!49028 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529181 () Bool)

(declare-fun res!1046890 () Bool)

(assert (=> b!1529181 (=> (not res!1046890) (not e!852221))))

(assert (=> b!1529181 (= res!1046890 (and (= (size!49578 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49578 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49578 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529180 () Bool)

(declare-fun res!1046887 () Bool)

(assert (=> b!1529180 (=> (not res!1046887) (not e!852221))))

(assert (=> b!1529180 (= res!1046887 (validKeyInArray!0 (select (arr!49028 a!2804) i!961)))))

(declare-fun res!1046889 () Bool)

(assert (=> start!130256 (=> (not res!1046889) (not e!852221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130256 (= res!1046889 (validMask!0 mask!2512))))

(assert (=> start!130256 e!852221))

(assert (=> start!130256 true))

(declare-fun array_inv!38056 (array!101606) Bool)

(assert (=> start!130256 (array_inv!38056 a!2804)))

(declare-fun b!1529182 () Bool)

(declare-fun res!1046888 () Bool)

(assert (=> b!1529182 (=> (not res!1046888) (not e!852221))))

(assert (=> b!1529182 (= res!1046888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529183 () Bool)

(declare-fun res!1046886 () Bool)

(assert (=> b!1529183 (=> (not res!1046886) (not e!852219))))

(assert (=> b!1529183 (= res!1046886 (= lt!662346 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49028 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49028 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101607 (store (arr!49028 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49578 a!2804)) mask!2512)))))

(assert (= (and start!130256 res!1046889) b!1529181))

(assert (= (and b!1529181 res!1046890) b!1529180))

(assert (= (and b!1529180 res!1046887) b!1529178))

(assert (= (and b!1529178 res!1046884) b!1529182))

(assert (= (and b!1529182 res!1046888) b!1529172))

(assert (= (and b!1529172 res!1046882) b!1529177))

(assert (= (and b!1529177 res!1046881) b!1529179))

(assert (= (and b!1529179 res!1046885) b!1529174))

(assert (= (and b!1529174 res!1046883) b!1529183))

(assert (= (and b!1529183 res!1046886) b!1529175))

(assert (= (and b!1529175 res!1046879) b!1529176))

(assert (= (and b!1529175 (not res!1046880)) b!1529173))

(declare-fun m!1412103 () Bool)

(assert (=> b!1529172 m!1412103))

(declare-fun m!1412105 () Bool)

(assert (=> b!1529175 m!1412105))

(declare-fun m!1412107 () Bool)

(assert (=> b!1529175 m!1412107))

(declare-fun m!1412109 () Bool)

(assert (=> b!1529175 m!1412109))

(declare-fun m!1412111 () Bool)

(assert (=> b!1529175 m!1412111))

(declare-fun m!1412113 () Bool)

(assert (=> b!1529175 m!1412113))

(assert (=> b!1529174 m!1412105))

(assert (=> b!1529174 m!1412105))

(declare-fun m!1412115 () Bool)

(assert (=> b!1529174 m!1412115))

(declare-fun m!1412117 () Bool)

(assert (=> start!130256 m!1412117))

(declare-fun m!1412119 () Bool)

(assert (=> start!130256 m!1412119))

(declare-fun m!1412121 () Bool)

(assert (=> b!1529180 m!1412121))

(assert (=> b!1529180 m!1412121))

(declare-fun m!1412123 () Bool)

(assert (=> b!1529180 m!1412123))

(assert (=> b!1529183 m!1412109))

(assert (=> b!1529183 m!1412111))

(assert (=> b!1529183 m!1412111))

(declare-fun m!1412125 () Bool)

(assert (=> b!1529183 m!1412125))

(assert (=> b!1529183 m!1412125))

(assert (=> b!1529183 m!1412111))

(declare-fun m!1412127 () Bool)

(assert (=> b!1529183 m!1412127))

(declare-fun m!1412129 () Bool)

(assert (=> b!1529182 m!1412129))

(assert (=> b!1529179 m!1412105))

(assert (=> b!1529179 m!1412105))

(declare-fun m!1412131 () Bool)

(assert (=> b!1529179 m!1412131))

(assert (=> b!1529179 m!1412131))

(assert (=> b!1529179 m!1412105))

(declare-fun m!1412133 () Bool)

(assert (=> b!1529179 m!1412133))

(declare-fun m!1412135 () Bool)

(assert (=> b!1529173 m!1412135))

(assert (=> b!1529178 m!1412105))

(assert (=> b!1529178 m!1412105))

(declare-fun m!1412137 () Bool)

(assert (=> b!1529178 m!1412137))

(assert (=> b!1529176 m!1412105))

(assert (=> b!1529176 m!1412105))

(declare-fun m!1412139 () Bool)

(assert (=> b!1529176 m!1412139))

(push 1)

