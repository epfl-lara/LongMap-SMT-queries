; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129564 () Bool)

(assert start!129564)

(declare-fun b!1521284 () Bool)

(declare-fun res!1040716 () Bool)

(declare-fun e!848375 () Bool)

(assert (=> b!1521284 (=> (not res!1040716) (not e!848375))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101239 0))(
  ( (array!101240 (arr!48853 (Array (_ BitVec 32) (_ BitVec 64))) (size!49405 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101239)

(assert (=> b!1521284 (= res!1040716 (and (= (size!49405 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49405 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49405 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521285 () Bool)

(declare-fun res!1040715 () Bool)

(assert (=> b!1521285 (=> (not res!1040715) (not e!848375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101239 (_ BitVec 32)) Bool)

(assert (=> b!1521285 (= res!1040715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521286 () Bool)

(declare-fun res!1040720 () Bool)

(declare-fun e!848376 () Bool)

(assert (=> b!1521286 (=> (not res!1040720) (not e!848376))))

(declare-datatypes ((SeekEntryResult!13041 0))(
  ( (MissingZero!13041 (index!54559 (_ BitVec 32))) (Found!13041 (index!54560 (_ BitVec 32))) (Intermediate!13041 (undefined!13853 Bool) (index!54561 (_ BitVec 32)) (x!136255 (_ BitVec 32))) (Undefined!13041) (MissingVacant!13041 (index!54562 (_ BitVec 32))) )
))
(declare-fun lt!659096 () SeekEntryResult!13041)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101239 (_ BitVec 32)) SeekEntryResult!13041)

(assert (=> b!1521286 (= res!1040720 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48853 a!2804) j!70) a!2804 mask!2512) lt!659096))))

(declare-fun b!1521287 () Bool)

(declare-fun res!1040713 () Bool)

(assert (=> b!1521287 (=> (not res!1040713) (not e!848375))))

(declare-datatypes ((List!35414 0))(
  ( (Nil!35411) (Cons!35410 (h!36832 (_ BitVec 64)) (t!50100 List!35414)) )
))
(declare-fun arrayNoDuplicates!0 (array!101239 (_ BitVec 32) List!35414) Bool)

(assert (=> b!1521287 (= res!1040713 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35411))))

(declare-fun b!1521288 () Bool)

(assert (=> b!1521288 (= e!848375 e!848376)))

(declare-fun res!1040712 () Bool)

(assert (=> b!1521288 (=> (not res!1040712) (not e!848376))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521288 (= res!1040712 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48853 a!2804) j!70) mask!2512) (select (arr!48853 a!2804) j!70) a!2804 mask!2512) lt!659096))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521288 (= lt!659096 (Intermediate!13041 false resIndex!21 resX!21))))

(declare-fun b!1521289 () Bool)

(assert (=> b!1521289 (= e!848376 false)))

(declare-fun lt!659097 () SeekEntryResult!13041)

(assert (=> b!1521289 (= lt!659097 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48853 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48853 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101240 (store (arr!48853 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49405 a!2804)) mask!2512))))

(declare-fun b!1521290 () Bool)

(declare-fun res!1040717 () Bool)

(assert (=> b!1521290 (=> (not res!1040717) (not e!848375))))

(assert (=> b!1521290 (= res!1040717 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49405 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49405 a!2804))))))

(declare-fun b!1521291 () Bool)

(declare-fun res!1040718 () Bool)

(assert (=> b!1521291 (=> (not res!1040718) (not e!848375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521291 (= res!1040718 (validKeyInArray!0 (select (arr!48853 a!2804) j!70)))))

(declare-fun res!1040719 () Bool)

(assert (=> start!129564 (=> (not res!1040719) (not e!848375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129564 (= res!1040719 (validMask!0 mask!2512))))

(assert (=> start!129564 e!848375))

(assert (=> start!129564 true))

(declare-fun array_inv!38086 (array!101239) Bool)

(assert (=> start!129564 (array_inv!38086 a!2804)))

(declare-fun b!1521292 () Bool)

(declare-fun res!1040714 () Bool)

(assert (=> b!1521292 (=> (not res!1040714) (not e!848375))))

(assert (=> b!1521292 (= res!1040714 (validKeyInArray!0 (select (arr!48853 a!2804) i!961)))))

(assert (= (and start!129564 res!1040719) b!1521284))

(assert (= (and b!1521284 res!1040716) b!1521292))

(assert (= (and b!1521292 res!1040714) b!1521291))

(assert (= (and b!1521291 res!1040718) b!1521285))

(assert (= (and b!1521285 res!1040715) b!1521287))

(assert (= (and b!1521287 res!1040713) b!1521290))

(assert (= (and b!1521290 res!1040717) b!1521288))

(assert (= (and b!1521288 res!1040712) b!1521286))

(assert (= (and b!1521286 res!1040720) b!1521289))

(declare-fun m!1403811 () Bool)

(assert (=> b!1521286 m!1403811))

(assert (=> b!1521286 m!1403811))

(declare-fun m!1403813 () Bool)

(assert (=> b!1521286 m!1403813))

(declare-fun m!1403815 () Bool)

(assert (=> b!1521292 m!1403815))

(assert (=> b!1521292 m!1403815))

(declare-fun m!1403817 () Bool)

(assert (=> b!1521292 m!1403817))

(declare-fun m!1403819 () Bool)

(assert (=> b!1521285 m!1403819))

(assert (=> b!1521288 m!1403811))

(assert (=> b!1521288 m!1403811))

(declare-fun m!1403821 () Bool)

(assert (=> b!1521288 m!1403821))

(assert (=> b!1521288 m!1403821))

(assert (=> b!1521288 m!1403811))

(declare-fun m!1403823 () Bool)

(assert (=> b!1521288 m!1403823))

(declare-fun m!1403825 () Bool)

(assert (=> b!1521287 m!1403825))

(declare-fun m!1403827 () Bool)

(assert (=> b!1521289 m!1403827))

(declare-fun m!1403829 () Bool)

(assert (=> b!1521289 m!1403829))

(assert (=> b!1521289 m!1403829))

(declare-fun m!1403831 () Bool)

(assert (=> b!1521289 m!1403831))

(assert (=> b!1521289 m!1403831))

(assert (=> b!1521289 m!1403829))

(declare-fun m!1403833 () Bool)

(assert (=> b!1521289 m!1403833))

(declare-fun m!1403835 () Bool)

(assert (=> start!129564 m!1403835))

(declare-fun m!1403837 () Bool)

(assert (=> start!129564 m!1403837))

(assert (=> b!1521291 m!1403811))

(assert (=> b!1521291 m!1403811))

(declare-fun m!1403839 () Bool)

(assert (=> b!1521291 m!1403839))

(check-sat (not b!1521287) (not start!129564) (not b!1521285) (not b!1521288) (not b!1521289) (not b!1521286) (not b!1521292) (not b!1521291))
(check-sat)
