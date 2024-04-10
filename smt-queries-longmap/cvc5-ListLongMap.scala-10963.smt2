; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128406 () Bool)

(assert start!128406)

(declare-fun res!1026406 () Bool)

(declare-fun e!841756 () Bool)

(assert (=> start!128406 (=> (not res!1026406) (not e!841756))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128406 (= res!1026406 (validMask!0 mask!2512))))

(assert (=> start!128406 e!841756))

(assert (=> start!128406 true))

(declare-datatypes ((array!100451 0))(
  ( (array!100452 (arr!48470 (Array (_ BitVec 32) (_ BitVec 64))) (size!49020 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100451)

(declare-fun array_inv!37498 (array!100451) Bool)

(assert (=> start!128406 (array_inv!37498 a!2804)))

(declare-fun b!1506047 () Bool)

(declare-fun res!1026408 () Bool)

(assert (=> b!1506047 (=> (not res!1026408) (not e!841756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100451 (_ BitVec 32)) Bool)

(assert (=> b!1506047 (= res!1026408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506048 () Bool)

(declare-fun res!1026404 () Bool)

(assert (=> b!1506048 (=> (not res!1026404) (not e!841756))))

(declare-datatypes ((List!34953 0))(
  ( (Nil!34950) (Cons!34949 (h!36346 (_ BitVec 64)) (t!49647 List!34953)) )
))
(declare-fun arrayNoDuplicates!0 (array!100451 (_ BitVec 32) List!34953) Bool)

(assert (=> b!1506048 (= res!1026404 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34950))))

(declare-fun b!1506049 () Bool)

(declare-fun res!1026405 () Bool)

(assert (=> b!1506049 (=> (not res!1026405) (not e!841756))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506049 (= res!1026405 (validKeyInArray!0 (select (arr!48470 a!2804) i!961)))))

(declare-fun b!1506050 () Bool)

(assert (=> b!1506050 (= e!841756 false)))

(declare-fun lt!654145 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506050 (= lt!654145 (toIndex!0 (select (arr!48470 a!2804) j!70) mask!2512))))

(declare-fun b!1506051 () Bool)

(declare-fun res!1026407 () Bool)

(assert (=> b!1506051 (=> (not res!1026407) (not e!841756))))

(assert (=> b!1506051 (= res!1026407 (validKeyInArray!0 (select (arr!48470 a!2804) j!70)))))

(declare-fun b!1506052 () Bool)

(declare-fun res!1026403 () Bool)

(assert (=> b!1506052 (=> (not res!1026403) (not e!841756))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506052 (= res!1026403 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49020 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49020 a!2804))))))

(declare-fun b!1506053 () Bool)

(declare-fun res!1026409 () Bool)

(assert (=> b!1506053 (=> (not res!1026409) (not e!841756))))

(assert (=> b!1506053 (= res!1026409 (and (= (size!49020 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49020 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49020 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128406 res!1026406) b!1506053))

(assert (= (and b!1506053 res!1026409) b!1506049))

(assert (= (and b!1506049 res!1026405) b!1506051))

(assert (= (and b!1506051 res!1026407) b!1506047))

(assert (= (and b!1506047 res!1026408) b!1506048))

(assert (= (and b!1506048 res!1026404) b!1506052))

(assert (= (and b!1506052 res!1026403) b!1506050))

(declare-fun m!1389067 () Bool)

(assert (=> b!1506047 m!1389067))

(declare-fun m!1389069 () Bool)

(assert (=> b!1506049 m!1389069))

(assert (=> b!1506049 m!1389069))

(declare-fun m!1389071 () Bool)

(assert (=> b!1506049 m!1389071))

(declare-fun m!1389073 () Bool)

(assert (=> start!128406 m!1389073))

(declare-fun m!1389075 () Bool)

(assert (=> start!128406 m!1389075))

(declare-fun m!1389077 () Bool)

(assert (=> b!1506048 m!1389077))

(declare-fun m!1389079 () Bool)

(assert (=> b!1506050 m!1389079))

(assert (=> b!1506050 m!1389079))

(declare-fun m!1389081 () Bool)

(assert (=> b!1506050 m!1389081))

(assert (=> b!1506051 m!1389079))

(assert (=> b!1506051 m!1389079))

(declare-fun m!1389083 () Bool)

(assert (=> b!1506051 m!1389083))

(push 1)

(assert (not b!1506050))

(assert (not b!1506051))

(assert (not b!1506048))

(assert (not b!1506047))

(assert (not start!128406))

(assert (not b!1506049))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

