; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128412 () Bool)

(assert start!128412)

(declare-fun b!1506110 () Bool)

(declare-fun res!1026472 () Bool)

(declare-fun e!841774 () Bool)

(assert (=> b!1506110 (=> (not res!1026472) (not e!841774))))

(declare-datatypes ((array!100457 0))(
  ( (array!100458 (arr!48473 (Array (_ BitVec 32) (_ BitVec 64))) (size!49023 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100457)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506110 (= res!1026472 (validKeyInArray!0 (select (arr!48473 a!2804) j!70)))))

(declare-fun b!1506111 () Bool)

(declare-fun res!1026467 () Bool)

(assert (=> b!1506111 (=> (not res!1026467) (not e!841774))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1506111 (= res!1026467 (and (= (size!49023 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49023 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49023 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506112 () Bool)

(declare-fun res!1026469 () Bool)

(assert (=> b!1506112 (=> (not res!1026469) (not e!841774))))

(declare-datatypes ((List!34956 0))(
  ( (Nil!34953) (Cons!34952 (h!36349 (_ BitVec 64)) (t!49650 List!34956)) )
))
(declare-fun arrayNoDuplicates!0 (array!100457 (_ BitVec 32) List!34956) Bool)

(assert (=> b!1506112 (= res!1026469 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34953))))

(declare-fun b!1506113 () Bool)

(declare-fun res!1026470 () Bool)

(assert (=> b!1506113 (=> (not res!1026470) (not e!841774))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506113 (= res!1026470 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49023 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49023 a!2804))))))

(declare-fun b!1506114 () Bool)

(assert (=> b!1506114 (= e!841774 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!654154 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506114 (= lt!654154 (toIndex!0 (select (arr!48473 a!2804) j!70) mask!2512))))

(declare-fun b!1506115 () Bool)

(declare-fun res!1026471 () Bool)

(assert (=> b!1506115 (=> (not res!1026471) (not e!841774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100457 (_ BitVec 32)) Bool)

(assert (=> b!1506115 (= res!1026471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506116 () Bool)

(declare-fun res!1026468 () Bool)

(assert (=> b!1506116 (=> (not res!1026468) (not e!841774))))

(assert (=> b!1506116 (= res!1026468 (validKeyInArray!0 (select (arr!48473 a!2804) i!961)))))

(declare-fun res!1026466 () Bool)

(assert (=> start!128412 (=> (not res!1026466) (not e!841774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128412 (= res!1026466 (validMask!0 mask!2512))))

(assert (=> start!128412 e!841774))

(assert (=> start!128412 true))

(declare-fun array_inv!37501 (array!100457) Bool)

(assert (=> start!128412 (array_inv!37501 a!2804)))

(assert (= (and start!128412 res!1026466) b!1506111))

(assert (= (and b!1506111 res!1026467) b!1506116))

(assert (= (and b!1506116 res!1026468) b!1506110))

(assert (= (and b!1506110 res!1026472) b!1506115))

(assert (= (and b!1506115 res!1026471) b!1506112))

(assert (= (and b!1506112 res!1026469) b!1506113))

(assert (= (and b!1506113 res!1026470) b!1506114))

(declare-fun m!1389121 () Bool)

(assert (=> b!1506110 m!1389121))

(assert (=> b!1506110 m!1389121))

(declare-fun m!1389123 () Bool)

(assert (=> b!1506110 m!1389123))

(declare-fun m!1389125 () Bool)

(assert (=> b!1506115 m!1389125))

(declare-fun m!1389127 () Bool)

(assert (=> start!128412 m!1389127))

(declare-fun m!1389129 () Bool)

(assert (=> start!128412 m!1389129))

(assert (=> b!1506114 m!1389121))

(assert (=> b!1506114 m!1389121))

(declare-fun m!1389131 () Bool)

(assert (=> b!1506114 m!1389131))

(declare-fun m!1389133 () Bool)

(assert (=> b!1506112 m!1389133))

(declare-fun m!1389135 () Bool)

(assert (=> b!1506116 m!1389135))

(assert (=> b!1506116 m!1389135))

(declare-fun m!1389137 () Bool)

(assert (=> b!1506116 m!1389137))

(push 1)

(assert (not b!1506112))

(assert (not b!1506116))

(assert (not b!1506115))

(assert (not b!1506114))

(assert (not b!1506110))

