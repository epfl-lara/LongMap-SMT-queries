; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128416 () Bool)

(assert start!128416)

(declare-fun b!1506152 () Bool)

(declare-fun res!1026512 () Bool)

(declare-fun e!841785 () Bool)

(assert (=> b!1506152 (=> (not res!1026512) (not e!841785))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100461 0))(
  ( (array!100462 (arr!48475 (Array (_ BitVec 32) (_ BitVec 64))) (size!49025 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100461)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506152 (= res!1026512 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49025 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49025 a!2804))))))

(declare-fun b!1506153 () Bool)

(declare-fun res!1026508 () Bool)

(assert (=> b!1506153 (=> (not res!1026508) (not e!841785))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100461 (_ BitVec 32)) Bool)

(assert (=> b!1506153 (= res!1026508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506154 () Bool)

(declare-fun res!1026510 () Bool)

(assert (=> b!1506154 (=> (not res!1026510) (not e!841785))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1506154 (= res!1026510 (and (= (size!49025 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49025 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49025 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1026514 () Bool)

(assert (=> start!128416 (=> (not res!1026514) (not e!841785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128416 (= res!1026514 (validMask!0 mask!2512))))

(assert (=> start!128416 e!841785))

(assert (=> start!128416 true))

(declare-fun array_inv!37503 (array!100461) Bool)

(assert (=> start!128416 (array_inv!37503 a!2804)))

(declare-fun b!1506155 () Bool)

(assert (=> b!1506155 (= e!841785 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!654160 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506155 (= lt!654160 (toIndex!0 (select (arr!48475 a!2804) j!70) mask!2512))))

(declare-fun b!1506156 () Bool)

(declare-fun res!1026513 () Bool)

(assert (=> b!1506156 (=> (not res!1026513) (not e!841785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506156 (= res!1026513 (validKeyInArray!0 (select (arr!48475 a!2804) j!70)))))

(declare-fun b!1506157 () Bool)

(declare-fun res!1026511 () Bool)

(assert (=> b!1506157 (=> (not res!1026511) (not e!841785))))

(declare-datatypes ((List!34958 0))(
  ( (Nil!34955) (Cons!34954 (h!36351 (_ BitVec 64)) (t!49652 List!34958)) )
))
(declare-fun arrayNoDuplicates!0 (array!100461 (_ BitVec 32) List!34958) Bool)

(assert (=> b!1506157 (= res!1026511 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34955))))

(declare-fun b!1506158 () Bool)

(declare-fun res!1026509 () Bool)

(assert (=> b!1506158 (=> (not res!1026509) (not e!841785))))

(assert (=> b!1506158 (= res!1026509 (validKeyInArray!0 (select (arr!48475 a!2804) i!961)))))

(assert (= (and start!128416 res!1026514) b!1506154))

(assert (= (and b!1506154 res!1026510) b!1506158))

(assert (= (and b!1506158 res!1026509) b!1506156))

(assert (= (and b!1506156 res!1026513) b!1506153))

(assert (= (and b!1506153 res!1026508) b!1506157))

(assert (= (and b!1506157 res!1026511) b!1506152))

(assert (= (and b!1506152 res!1026512) b!1506155))

(declare-fun m!1389157 () Bool)

(assert (=> b!1506156 m!1389157))

(assert (=> b!1506156 m!1389157))

(declare-fun m!1389159 () Bool)

(assert (=> b!1506156 m!1389159))

(declare-fun m!1389161 () Bool)

(assert (=> b!1506157 m!1389161))

(declare-fun m!1389163 () Bool)

(assert (=> b!1506158 m!1389163))

(assert (=> b!1506158 m!1389163))

(declare-fun m!1389165 () Bool)

(assert (=> b!1506158 m!1389165))

(assert (=> b!1506155 m!1389157))

(assert (=> b!1506155 m!1389157))

(declare-fun m!1389167 () Bool)

(assert (=> b!1506155 m!1389167))

(declare-fun m!1389169 () Bool)

(assert (=> b!1506153 m!1389169))

(declare-fun m!1389171 () Bool)

(assert (=> start!128416 m!1389171))

(declare-fun m!1389173 () Bool)

(assert (=> start!128416 m!1389173))

(push 1)

(assert (not b!1506155))

(assert (not b!1506156))

(assert (not b!1506157))

(assert (not b!1506153))

(assert (not b!1506158))

(assert (not start!128416))

(check-sat)

(pop 1)

(push 1)

(check-sat)

