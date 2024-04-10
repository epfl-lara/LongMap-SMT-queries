; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128766 () Bool)

(assert start!128766)

(declare-fun b!1508760 () Bool)

(declare-fun res!1028664 () Bool)

(declare-fun e!842872 () Bool)

(assert (=> b!1508760 (=> (not res!1028664) (not e!842872))))

(declare-datatypes ((array!100622 0))(
  ( (array!100623 (arr!48548 (Array (_ BitVec 32) (_ BitVec 64))) (size!49098 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100622)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100622 (_ BitVec 32)) Bool)

(assert (=> b!1508760 (= res!1028664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508761 () Bool)

(declare-fun res!1028671 () Bool)

(assert (=> b!1508761 (=> (not res!1028671) (not e!842872))))

(declare-datatypes ((List!35031 0))(
  ( (Nil!35028) (Cons!35027 (h!36439 (_ BitVec 64)) (t!49725 List!35031)) )
))
(declare-fun arrayNoDuplicates!0 (array!100622 (_ BitVec 32) List!35031) Bool)

(assert (=> b!1508761 (= res!1028671 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35028))))

(declare-fun b!1508762 () Bool)

(declare-fun res!1028668 () Bool)

(assert (=> b!1508762 (=> (not res!1028668) (not e!842872))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508762 (= res!1028668 (validKeyInArray!0 (select (arr!48548 a!2804) i!961)))))

(declare-fun b!1508763 () Bool)

(declare-fun res!1028669 () Bool)

(assert (=> b!1508763 (=> (not res!1028669) (not e!842872))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1508763 (= res!1028669 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49098 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49098 a!2804))))))

(declare-fun b!1508764 () Bool)

(declare-fun res!1028663 () Bool)

(assert (=> b!1508764 (=> (not res!1028663) (not e!842872))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1508764 (= res!1028663 (and (= (size!49098 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49098 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49098 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508765 () Bool)

(declare-fun res!1028670 () Bool)

(declare-fun e!842871 () Bool)

(assert (=> b!1508765 (=> (not res!1028670) (not e!842871))))

(declare-datatypes ((SeekEntryResult!12719 0))(
  ( (MissingZero!12719 (index!53271 (_ BitVec 32))) (Found!12719 (index!53272 (_ BitVec 32))) (Intermediate!12719 (undefined!13531 Bool) (index!53273 (_ BitVec 32)) (x!135037 (_ BitVec 32))) (Undefined!12719) (MissingVacant!12719 (index!53274 (_ BitVec 32))) )
))
(declare-fun lt!654736 () SeekEntryResult!12719)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100622 (_ BitVec 32)) SeekEntryResult!12719)

(assert (=> b!1508765 (= res!1028670 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48548 a!2804) j!70) a!2804 mask!2512) lt!654736))))

(declare-fun b!1508766 () Bool)

(assert (=> b!1508766 (= e!842872 e!842871)))

(declare-fun res!1028667 () Bool)

(assert (=> b!1508766 (=> (not res!1028667) (not e!842871))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508766 (= res!1028667 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48548 a!2804) j!70) mask!2512) (select (arr!48548 a!2804) j!70) a!2804 mask!2512) lt!654736))))

(assert (=> b!1508766 (= lt!654736 (Intermediate!12719 false resIndex!21 resX!21))))

(declare-fun res!1028665 () Bool)

(assert (=> start!128766 (=> (not res!1028665) (not e!842872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128766 (= res!1028665 (validMask!0 mask!2512))))

(assert (=> start!128766 e!842872))

(assert (=> start!128766 true))

(declare-fun array_inv!37576 (array!100622) Bool)

(assert (=> start!128766 (array_inv!37576 a!2804)))

(declare-fun b!1508767 () Bool)

(assert (=> b!1508767 (= e!842871 false)))

(declare-fun lt!654735 () (_ BitVec 32))

(assert (=> b!1508767 (= lt!654735 (toIndex!0 (select (store (arr!48548 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508768 () Bool)

(declare-fun res!1028666 () Bool)

(assert (=> b!1508768 (=> (not res!1028666) (not e!842872))))

(assert (=> b!1508768 (= res!1028666 (validKeyInArray!0 (select (arr!48548 a!2804) j!70)))))

(assert (= (and start!128766 res!1028665) b!1508764))

(assert (= (and b!1508764 res!1028663) b!1508762))

(assert (= (and b!1508762 res!1028668) b!1508768))

(assert (= (and b!1508768 res!1028666) b!1508760))

(assert (= (and b!1508760 res!1028664) b!1508761))

(assert (= (and b!1508761 res!1028671) b!1508763))

(assert (= (and b!1508763 res!1028669) b!1508766))

(assert (= (and b!1508766 res!1028667) b!1508765))

(assert (= (and b!1508765 res!1028670) b!1508767))

(declare-fun m!1391179 () Bool)

(assert (=> b!1508765 m!1391179))

(assert (=> b!1508765 m!1391179))

(declare-fun m!1391181 () Bool)

(assert (=> b!1508765 m!1391181))

(declare-fun m!1391183 () Bool)

(assert (=> b!1508762 m!1391183))

(assert (=> b!1508762 m!1391183))

(declare-fun m!1391185 () Bool)

(assert (=> b!1508762 m!1391185))

(assert (=> b!1508766 m!1391179))

(assert (=> b!1508766 m!1391179))

(declare-fun m!1391187 () Bool)

(assert (=> b!1508766 m!1391187))

(assert (=> b!1508766 m!1391187))

(assert (=> b!1508766 m!1391179))

(declare-fun m!1391189 () Bool)

(assert (=> b!1508766 m!1391189))

(declare-fun m!1391191 () Bool)

(assert (=> b!1508767 m!1391191))

(declare-fun m!1391193 () Bool)

(assert (=> b!1508767 m!1391193))

(assert (=> b!1508767 m!1391193))

(declare-fun m!1391195 () Bool)

(assert (=> b!1508767 m!1391195))

(declare-fun m!1391197 () Bool)

(assert (=> start!128766 m!1391197))

(declare-fun m!1391199 () Bool)

(assert (=> start!128766 m!1391199))

(declare-fun m!1391201 () Bool)

(assert (=> b!1508760 m!1391201))

(declare-fun m!1391203 () Bool)

(assert (=> b!1508761 m!1391203))

(assert (=> b!1508768 m!1391179))

(assert (=> b!1508768 m!1391179))

(declare-fun m!1391205 () Bool)

(assert (=> b!1508768 m!1391205))

(push 1)

