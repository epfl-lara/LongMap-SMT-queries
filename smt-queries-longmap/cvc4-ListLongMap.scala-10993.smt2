; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128794 () Bool)

(assert start!128794)

(declare-fun b!1509147 () Bool)

(declare-fun res!1029057 () Bool)

(declare-fun e!843005 () Bool)

(assert (=> b!1509147 (=> (not res!1029057) (not e!843005))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100650 0))(
  ( (array!100651 (arr!48562 (Array (_ BitVec 32) (_ BitVec 64))) (size!49112 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100650)

(assert (=> b!1509147 (= res!1029057 (and (= (size!49112 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49112 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49112 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509148 () Bool)

(declare-fun res!1029056 () Bool)

(assert (=> b!1509148 (=> (not res!1029056) (not e!843005))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509148 (= res!1029056 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49112 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49112 a!2804))))))

(declare-fun b!1509149 () Bool)

(declare-fun res!1029051 () Bool)

(assert (=> b!1509149 (=> (not res!1029051) (not e!843005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100650 (_ BitVec 32)) Bool)

(assert (=> b!1509149 (= res!1029051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509150 () Bool)

(declare-fun res!1029054 () Bool)

(assert (=> b!1509150 (=> (not res!1029054) (not e!843005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509150 (= res!1029054 (validKeyInArray!0 (select (arr!48562 a!2804) i!961)))))

(declare-fun b!1509151 () Bool)

(declare-fun e!843006 () Bool)

(assert (=> b!1509151 (= e!843006 false)))

(declare-datatypes ((SeekEntryResult!12733 0))(
  ( (MissingZero!12733 (index!53327 (_ BitVec 32))) (Found!12733 (index!53328 (_ BitVec 32))) (Intermediate!12733 (undefined!13545 Bool) (index!53329 (_ BitVec 32)) (x!135083 (_ BitVec 32))) (Undefined!12733) (MissingVacant!12733 (index!53330 (_ BitVec 32))) )
))
(declare-fun lt!654819 () SeekEntryResult!12733)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100650 (_ BitVec 32)) SeekEntryResult!12733)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509151 (= lt!654819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48562 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48562 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100651 (store (arr!48562 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49112 a!2804)) mask!2512))))

(declare-fun b!1509152 () Bool)

(declare-fun res!1029050 () Bool)

(assert (=> b!1509152 (=> (not res!1029050) (not e!843006))))

(declare-fun lt!654820 () SeekEntryResult!12733)

(assert (=> b!1509152 (= res!1029050 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48562 a!2804) j!70) a!2804 mask!2512) lt!654820))))

(declare-fun res!1029053 () Bool)

(assert (=> start!128794 (=> (not res!1029053) (not e!843005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128794 (= res!1029053 (validMask!0 mask!2512))))

(assert (=> start!128794 e!843005))

(assert (=> start!128794 true))

(declare-fun array_inv!37590 (array!100650) Bool)

(assert (=> start!128794 (array_inv!37590 a!2804)))

(declare-fun b!1509153 () Bool)

(declare-fun res!1029058 () Bool)

(assert (=> b!1509153 (=> (not res!1029058) (not e!843005))))

(assert (=> b!1509153 (= res!1029058 (validKeyInArray!0 (select (arr!48562 a!2804) j!70)))))

(declare-fun b!1509154 () Bool)

(assert (=> b!1509154 (= e!843005 e!843006)))

(declare-fun res!1029052 () Bool)

(assert (=> b!1509154 (=> (not res!1029052) (not e!843006))))

(assert (=> b!1509154 (= res!1029052 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48562 a!2804) j!70) mask!2512) (select (arr!48562 a!2804) j!70) a!2804 mask!2512) lt!654820))))

(assert (=> b!1509154 (= lt!654820 (Intermediate!12733 false resIndex!21 resX!21))))

(declare-fun b!1509155 () Bool)

(declare-fun res!1029055 () Bool)

(assert (=> b!1509155 (=> (not res!1029055) (not e!843005))))

(declare-datatypes ((List!35045 0))(
  ( (Nil!35042) (Cons!35041 (h!36453 (_ BitVec 64)) (t!49739 List!35045)) )
))
(declare-fun arrayNoDuplicates!0 (array!100650 (_ BitVec 32) List!35045) Bool)

(assert (=> b!1509155 (= res!1029055 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35042))))

(assert (= (and start!128794 res!1029053) b!1509147))

(assert (= (and b!1509147 res!1029057) b!1509150))

(assert (= (and b!1509150 res!1029054) b!1509153))

(assert (= (and b!1509153 res!1029058) b!1509149))

(assert (= (and b!1509149 res!1029051) b!1509155))

(assert (= (and b!1509155 res!1029055) b!1509148))

(assert (= (and b!1509148 res!1029056) b!1509154))

(assert (= (and b!1509154 res!1029052) b!1509152))

(assert (= (and b!1509152 res!1029050) b!1509151))

(declare-fun m!1391593 () Bool)

(assert (=> b!1509150 m!1391593))

(assert (=> b!1509150 m!1391593))

(declare-fun m!1391595 () Bool)

(assert (=> b!1509150 m!1391595))

(declare-fun m!1391597 () Bool)

(assert (=> b!1509153 m!1391597))

(assert (=> b!1509153 m!1391597))

(declare-fun m!1391599 () Bool)

(assert (=> b!1509153 m!1391599))

(declare-fun m!1391601 () Bool)

(assert (=> b!1509151 m!1391601))

(declare-fun m!1391603 () Bool)

(assert (=> b!1509151 m!1391603))

(assert (=> b!1509151 m!1391603))

(declare-fun m!1391605 () Bool)

(assert (=> b!1509151 m!1391605))

(assert (=> b!1509151 m!1391605))

(assert (=> b!1509151 m!1391603))

(declare-fun m!1391607 () Bool)

(assert (=> b!1509151 m!1391607))

(declare-fun m!1391609 () Bool)

(assert (=> b!1509155 m!1391609))

(assert (=> b!1509154 m!1391597))

(assert (=> b!1509154 m!1391597))

(declare-fun m!1391611 () Bool)

(assert (=> b!1509154 m!1391611))

(assert (=> b!1509154 m!1391611))

(assert (=> b!1509154 m!1391597))

(declare-fun m!1391613 () Bool)

(assert (=> b!1509154 m!1391613))

(declare-fun m!1391615 () Bool)

(assert (=> b!1509149 m!1391615))

(assert (=> b!1509152 m!1391597))

(assert (=> b!1509152 m!1391597))

(declare-fun m!1391617 () Bool)

(assert (=> b!1509152 m!1391617))

(declare-fun m!1391619 () Bool)

(assert (=> start!128794 m!1391619))

(declare-fun m!1391621 () Bool)

(assert (=> start!128794 m!1391621))

(push 1)

