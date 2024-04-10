; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128914 () Bool)

(assert start!128914)

(declare-fun b!1511071 () Bool)

(declare-fun e!843690 () Bool)

(assert (=> b!1511071 (= e!843690 (not true))))

(declare-fun e!843688 () Bool)

(assert (=> b!1511071 e!843688))

(declare-fun res!1030984 () Bool)

(assert (=> b!1511071 (=> (not res!1030984) (not e!843688))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100770 0))(
  ( (array!100771 (arr!48622 (Array (_ BitVec 32) (_ BitVec 64))) (size!49172 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100770)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100770 (_ BitVec 32)) Bool)

(assert (=> b!1511071 (= res!1030984 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50454 0))(
  ( (Unit!50455) )
))
(declare-fun lt!655340 () Unit!50454)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100770 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50454)

(assert (=> b!1511071 (= lt!655340 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511072 () Bool)

(declare-fun res!1030976 () Bool)

(assert (=> b!1511072 (=> (not res!1030976) (not e!843690))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12793 0))(
  ( (MissingZero!12793 (index!53567 (_ BitVec 32))) (Found!12793 (index!53568 (_ BitVec 32))) (Intermediate!12793 (undefined!13605 Bool) (index!53569 (_ BitVec 32)) (x!135303 (_ BitVec 32))) (Undefined!12793) (MissingVacant!12793 (index!53570 (_ BitVec 32))) )
))
(declare-fun lt!655342 () SeekEntryResult!12793)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100770 (_ BitVec 32)) SeekEntryResult!12793)

(assert (=> b!1511072 (= res!1030976 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48622 a!2804) j!70) a!2804 mask!2512) lt!655342))))

(declare-fun b!1511073 () Bool)

(declare-fun e!843691 () Bool)

(assert (=> b!1511073 (= e!843691 e!843690)))

(declare-fun res!1030974 () Bool)

(assert (=> b!1511073 (=> (not res!1030974) (not e!843690))))

(declare-fun lt!655341 () SeekEntryResult!12793)

(assert (=> b!1511073 (= res!1030974 (= lt!655341 lt!655342))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1511073 (= lt!655342 (Intermediate!12793 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511073 (= lt!655341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48622 a!2804) j!70) mask!2512) (select (arr!48622 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511074 () Bool)

(declare-fun res!1030981 () Bool)

(assert (=> b!1511074 (=> (not res!1030981) (not e!843691))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511074 (= res!1030981 (validKeyInArray!0 (select (arr!48622 a!2804) i!961)))))

(declare-fun b!1511075 () Bool)

(declare-fun res!1030977 () Bool)

(assert (=> b!1511075 (=> (not res!1030977) (not e!843691))))

(assert (=> b!1511075 (= res!1030977 (and (= (size!49172 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49172 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49172 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1030980 () Bool)

(assert (=> start!128914 (=> (not res!1030980) (not e!843691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128914 (= res!1030980 (validMask!0 mask!2512))))

(assert (=> start!128914 e!843691))

(assert (=> start!128914 true))

(declare-fun array_inv!37650 (array!100770) Bool)

(assert (=> start!128914 (array_inv!37650 a!2804)))

(declare-fun b!1511076 () Bool)

(declare-fun res!1030978 () Bool)

(assert (=> b!1511076 (=> (not res!1030978) (not e!843691))))

(declare-datatypes ((List!35105 0))(
  ( (Nil!35102) (Cons!35101 (h!36513 (_ BitVec 64)) (t!49799 List!35105)) )
))
(declare-fun arrayNoDuplicates!0 (array!100770 (_ BitVec 32) List!35105) Bool)

(assert (=> b!1511076 (= res!1030978 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35102))))

(declare-fun b!1511077 () Bool)

(declare-fun res!1030983 () Bool)

(assert (=> b!1511077 (=> (not res!1030983) (not e!843691))))

(assert (=> b!1511077 (= res!1030983 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49172 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49172 a!2804))))))

(declare-fun b!1511078 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100770 (_ BitVec 32)) SeekEntryResult!12793)

(assert (=> b!1511078 (= e!843688 (= (seekEntry!0 (select (arr!48622 a!2804) j!70) a!2804 mask!2512) (Found!12793 j!70)))))

(declare-fun b!1511079 () Bool)

(declare-fun res!1030982 () Bool)

(assert (=> b!1511079 (=> (not res!1030982) (not e!843691))))

(assert (=> b!1511079 (= res!1030982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511080 () Bool)

(declare-fun res!1030975 () Bool)

(assert (=> b!1511080 (=> (not res!1030975) (not e!843691))))

(assert (=> b!1511080 (= res!1030975 (validKeyInArray!0 (select (arr!48622 a!2804) j!70)))))

(declare-fun b!1511081 () Bool)

(declare-fun res!1030979 () Bool)

(assert (=> b!1511081 (=> (not res!1030979) (not e!843690))))

(assert (=> b!1511081 (= res!1030979 (= lt!655341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48622 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48622 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100771 (store (arr!48622 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49172 a!2804)) mask!2512)))))

(assert (= (and start!128914 res!1030980) b!1511075))

(assert (= (and b!1511075 res!1030977) b!1511074))

(assert (= (and b!1511074 res!1030981) b!1511080))

(assert (= (and b!1511080 res!1030975) b!1511079))

(assert (= (and b!1511079 res!1030982) b!1511076))

(assert (= (and b!1511076 res!1030978) b!1511077))

(assert (= (and b!1511077 res!1030983) b!1511073))

(assert (= (and b!1511073 res!1030974) b!1511072))

(assert (= (and b!1511072 res!1030976) b!1511081))

(assert (= (and b!1511081 res!1030979) b!1511071))

(assert (= (and b!1511071 res!1030984) b!1511078))

(declare-fun m!1393729 () Bool)

(assert (=> b!1511073 m!1393729))

(assert (=> b!1511073 m!1393729))

(declare-fun m!1393731 () Bool)

(assert (=> b!1511073 m!1393731))

(assert (=> b!1511073 m!1393731))

(assert (=> b!1511073 m!1393729))

(declare-fun m!1393733 () Bool)

(assert (=> b!1511073 m!1393733))

(declare-fun m!1393735 () Bool)

(assert (=> b!1511071 m!1393735))

(declare-fun m!1393737 () Bool)

(assert (=> b!1511071 m!1393737))

(declare-fun m!1393739 () Bool)

(assert (=> b!1511074 m!1393739))

(assert (=> b!1511074 m!1393739))

(declare-fun m!1393741 () Bool)

(assert (=> b!1511074 m!1393741))

(declare-fun m!1393743 () Bool)

(assert (=> b!1511076 m!1393743))

(declare-fun m!1393745 () Bool)

(assert (=> b!1511079 m!1393745))

(declare-fun m!1393747 () Bool)

(assert (=> start!128914 m!1393747))

(declare-fun m!1393749 () Bool)

(assert (=> start!128914 m!1393749))

(declare-fun m!1393751 () Bool)

(assert (=> b!1511081 m!1393751))

(declare-fun m!1393753 () Bool)

(assert (=> b!1511081 m!1393753))

(assert (=> b!1511081 m!1393753))

(declare-fun m!1393755 () Bool)

(assert (=> b!1511081 m!1393755))

(assert (=> b!1511081 m!1393755))

(assert (=> b!1511081 m!1393753))

(declare-fun m!1393757 () Bool)

(assert (=> b!1511081 m!1393757))

(assert (=> b!1511080 m!1393729))

(assert (=> b!1511080 m!1393729))

(declare-fun m!1393759 () Bool)

(assert (=> b!1511080 m!1393759))

(assert (=> b!1511078 m!1393729))

(assert (=> b!1511078 m!1393729))

(declare-fun m!1393761 () Bool)

(assert (=> b!1511078 m!1393761))

(assert (=> b!1511072 m!1393729))

(assert (=> b!1511072 m!1393729))

(declare-fun m!1393763 () Bool)

(assert (=> b!1511072 m!1393763))

(push 1)

(assert (not b!1511080))

(assert (not b!1511071))

