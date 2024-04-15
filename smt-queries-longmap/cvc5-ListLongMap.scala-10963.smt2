; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128358 () Bool)

(assert start!128358)

(declare-fun b!1505749 () Bool)

(declare-fun res!1026317 () Bool)

(declare-fun e!841553 () Bool)

(assert (=> b!1505749 (=> (not res!1026317) (not e!841553))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100403 0))(
  ( (array!100404 (arr!48447 (Array (_ BitVec 32) (_ BitVec 64))) (size!48999 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100403)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1505749 (= res!1026317 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!48999 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!48999 a!2804))))))

(declare-fun b!1505750 () Bool)

(declare-fun res!1026311 () Bool)

(assert (=> b!1505750 (=> (not res!1026311) (not e!841553))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1505750 (= res!1026311 (and (= (size!48999 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!48999 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!48999 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1026312 () Bool)

(assert (=> start!128358 (=> (not res!1026312) (not e!841553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128358 (= res!1026312 (validMask!0 mask!2512))))

(assert (=> start!128358 e!841553))

(assert (=> start!128358 true))

(declare-fun array_inv!37680 (array!100403) Bool)

(assert (=> start!128358 (array_inv!37680 a!2804)))

(declare-fun b!1505751 () Bool)

(declare-fun res!1026314 () Bool)

(assert (=> b!1505751 (=> (not res!1026314) (not e!841553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505751 (= res!1026314 (validKeyInArray!0 (select (arr!48447 a!2804) i!961)))))

(declare-fun b!1505752 () Bool)

(declare-fun res!1026313 () Bool)

(assert (=> b!1505752 (=> (not res!1026313) (not e!841553))))

(declare-datatypes ((List!35008 0))(
  ( (Nil!35005) (Cons!35004 (h!36402 (_ BitVec 64)) (t!49694 List!35008)) )
))
(declare-fun arrayNoDuplicates!0 (array!100403 (_ BitVec 32) List!35008) Bool)

(assert (=> b!1505752 (= res!1026313 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35005))))

(declare-fun b!1505753 () Bool)

(assert (=> b!1505753 (= e!841553 false)))

(declare-fun lt!653856 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505753 (= lt!653856 (toIndex!0 (select (arr!48447 a!2804) j!70) mask!2512))))

(declare-fun b!1505754 () Bool)

(declare-fun res!1026316 () Bool)

(assert (=> b!1505754 (=> (not res!1026316) (not e!841553))))

(assert (=> b!1505754 (= res!1026316 (validKeyInArray!0 (select (arr!48447 a!2804) j!70)))))

(declare-fun b!1505755 () Bool)

(declare-fun res!1026315 () Bool)

(assert (=> b!1505755 (=> (not res!1026315) (not e!841553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100403 (_ BitVec 32)) Bool)

(assert (=> b!1505755 (= res!1026315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128358 res!1026312) b!1505750))

(assert (= (and b!1505750 res!1026311) b!1505751))

(assert (= (and b!1505751 res!1026314) b!1505754))

(assert (= (and b!1505754 res!1026316) b!1505755))

(assert (= (and b!1505755 res!1026315) b!1505752))

(assert (= (and b!1505752 res!1026313) b!1505749))

(assert (= (and b!1505749 res!1026317) b!1505753))

(declare-fun m!1388195 () Bool)

(assert (=> b!1505755 m!1388195))

(declare-fun m!1388197 () Bool)

(assert (=> b!1505753 m!1388197))

(assert (=> b!1505753 m!1388197))

(declare-fun m!1388199 () Bool)

(assert (=> b!1505753 m!1388199))

(declare-fun m!1388201 () Bool)

(assert (=> b!1505752 m!1388201))

(declare-fun m!1388203 () Bool)

(assert (=> start!128358 m!1388203))

(declare-fun m!1388205 () Bool)

(assert (=> start!128358 m!1388205))

(assert (=> b!1505754 m!1388197))

(assert (=> b!1505754 m!1388197))

(declare-fun m!1388207 () Bool)

(assert (=> b!1505754 m!1388207))

(declare-fun m!1388209 () Bool)

(assert (=> b!1505751 m!1388209))

(assert (=> b!1505751 m!1388209))

(declare-fun m!1388211 () Bool)

(assert (=> b!1505751 m!1388211))

(push 1)

(assert (not b!1505753))

(assert (not b!1505755))

(assert (not b!1505752))

(assert (not start!128358))

(assert (not b!1505751))

(assert (not b!1505754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

