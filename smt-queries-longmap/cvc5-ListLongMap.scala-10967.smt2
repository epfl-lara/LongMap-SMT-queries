; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128418 () Bool)

(assert start!128418)

(declare-fun b!1506082 () Bool)

(declare-fun res!1026611 () Bool)

(declare-fun e!841689 () Bool)

(assert (=> b!1506082 (=> (not res!1026611) (not e!841689))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100430 0))(
  ( (array!100431 (arr!48459 (Array (_ BitVec 32) (_ BitVec 64))) (size!49011 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100430)

(assert (=> b!1506082 (= res!1026611 (and (= (size!49011 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49011 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49011 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506083 () Bool)

(declare-fun res!1026615 () Bool)

(assert (=> b!1506083 (=> (not res!1026615) (not e!841689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506083 (= res!1026615 (validKeyInArray!0 (select (arr!48459 a!2804) i!961)))))

(declare-fun b!1506084 () Bool)

(declare-fun res!1026613 () Bool)

(assert (=> b!1506084 (=> (not res!1026613) (not e!841689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100430 (_ BitVec 32)) Bool)

(assert (=> b!1506084 (= res!1026613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506085 () Bool)

(assert (=> b!1506085 (= e!841689 false)))

(declare-fun lt!653937 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506085 (= lt!653937 (toIndex!0 (select (arr!48459 a!2804) j!70) mask!2512))))

(declare-fun b!1506086 () Bool)

(declare-fun res!1026616 () Bool)

(assert (=> b!1506086 (=> (not res!1026616) (not e!841689))))

(declare-datatypes ((List!35020 0))(
  ( (Nil!35017) (Cons!35016 (h!36417 (_ BitVec 64)) (t!49706 List!35020)) )
))
(declare-fun arrayNoDuplicates!0 (array!100430 (_ BitVec 32) List!35020) Bool)

(assert (=> b!1506086 (= res!1026616 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35017))))

(declare-fun b!1506087 () Bool)

(declare-fun res!1026617 () Bool)

(assert (=> b!1506087 (=> (not res!1026617) (not e!841689))))

(assert (=> b!1506087 (= res!1026617 (validKeyInArray!0 (select (arr!48459 a!2804) j!70)))))

(declare-fun b!1506088 () Bool)

(declare-fun res!1026612 () Bool)

(assert (=> b!1506088 (=> (not res!1026612) (not e!841689))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506088 (= res!1026612 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49011 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49011 a!2804))))))

(declare-fun res!1026614 () Bool)

(assert (=> start!128418 (=> (not res!1026614) (not e!841689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128418 (= res!1026614 (validMask!0 mask!2512))))

(assert (=> start!128418 e!841689))

(assert (=> start!128418 true))

(declare-fun array_inv!37692 (array!100430) Bool)

(assert (=> start!128418 (array_inv!37692 a!2804)))

(assert (= (and start!128418 res!1026614) b!1506082))

(assert (= (and b!1506082 res!1026611) b!1506083))

(assert (= (and b!1506083 res!1026615) b!1506087))

(assert (= (and b!1506087 res!1026617) b!1506084))

(assert (= (and b!1506084 res!1026613) b!1506086))

(assert (= (and b!1506086 res!1026616) b!1506088))

(assert (= (and b!1506088 res!1026612) b!1506085))

(declare-fun m!1388459 () Bool)

(assert (=> start!128418 m!1388459))

(declare-fun m!1388461 () Bool)

(assert (=> start!128418 m!1388461))

(declare-fun m!1388463 () Bool)

(assert (=> b!1506084 m!1388463))

(declare-fun m!1388465 () Bool)

(assert (=> b!1506086 m!1388465))

(declare-fun m!1388467 () Bool)

(assert (=> b!1506083 m!1388467))

(assert (=> b!1506083 m!1388467))

(declare-fun m!1388469 () Bool)

(assert (=> b!1506083 m!1388469))

(declare-fun m!1388471 () Bool)

(assert (=> b!1506087 m!1388471))

(assert (=> b!1506087 m!1388471))

(declare-fun m!1388473 () Bool)

(assert (=> b!1506087 m!1388473))

(assert (=> b!1506085 m!1388471))

(assert (=> b!1506085 m!1388471))

(declare-fun m!1388475 () Bool)

(assert (=> b!1506085 m!1388475))

(push 1)

(assert (not b!1506085))

(assert (not b!1506084))

(assert (not b!1506087))

(assert (not b!1506086))

(assert (not start!128418))

(assert (not b!1506083))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

