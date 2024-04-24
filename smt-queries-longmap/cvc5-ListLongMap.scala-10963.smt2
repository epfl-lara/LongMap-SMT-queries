; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128712 () Bool)

(assert start!128712)

(declare-fun b!1507921 () Bool)

(declare-fun res!1027106 () Bool)

(declare-fun e!842904 () Bool)

(assert (=> b!1507921 (=> (not res!1027106) (not e!842904))))

(declare-datatypes ((array!100571 0))(
  ( (array!100572 (arr!48525 (Array (_ BitVec 32) (_ BitVec 64))) (size!49076 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100571)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100571 (_ BitVec 32)) Bool)

(assert (=> b!1507921 (= res!1027106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507922 () Bool)

(declare-fun res!1027105 () Bool)

(assert (=> b!1507922 (=> (not res!1027105) (not e!842904))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1507922 (= res!1027105 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49076 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49076 a!2804))))))

(declare-fun b!1507923 () Bool)

(assert (=> b!1507923 (= e!842904 false)))

(declare-fun lt!654814 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507923 (= lt!654814 (toIndex!0 (select (arr!48525 a!2804) j!70) mask!2512))))

(declare-fun res!1027104 () Bool)

(assert (=> start!128712 (=> (not res!1027104) (not e!842904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128712 (= res!1027104 (validMask!0 mask!2512))))

(assert (=> start!128712 e!842904))

(assert (=> start!128712 true))

(declare-fun array_inv!37806 (array!100571) Bool)

(assert (=> start!128712 (array_inv!37806 a!2804)))

(declare-fun b!1507924 () Bool)

(declare-fun res!1027103 () Bool)

(assert (=> b!1507924 (=> (not res!1027103) (not e!842904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507924 (= res!1027103 (validKeyInArray!0 (select (arr!48525 a!2804) j!70)))))

(declare-fun b!1507925 () Bool)

(declare-fun res!1027101 () Bool)

(assert (=> b!1507925 (=> (not res!1027101) (not e!842904))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1507925 (= res!1027101 (validKeyInArray!0 (select (arr!48525 a!2804) i!961)))))

(declare-fun b!1507926 () Bool)

(declare-fun res!1027100 () Bool)

(assert (=> b!1507926 (=> (not res!1027100) (not e!842904))))

(assert (=> b!1507926 (= res!1027100 (and (= (size!49076 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49076 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49076 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507927 () Bool)

(declare-fun res!1027102 () Bool)

(assert (=> b!1507927 (=> (not res!1027102) (not e!842904))))

(declare-datatypes ((List!34995 0))(
  ( (Nil!34992) (Cons!34991 (h!36403 (_ BitVec 64)) (t!49681 List!34995)) )
))
(declare-fun arrayNoDuplicates!0 (array!100571 (_ BitVec 32) List!34995) Bool)

(assert (=> b!1507927 (= res!1027102 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34992))))

(assert (= (and start!128712 res!1027104) b!1507926))

(assert (= (and b!1507926 res!1027100) b!1507925))

(assert (= (and b!1507925 res!1027101) b!1507924))

(assert (= (and b!1507924 res!1027103) b!1507921))

(assert (= (and b!1507921 res!1027106) b!1507927))

(assert (= (and b!1507927 res!1027102) b!1507922))

(assert (= (and b!1507922 res!1027105) b!1507923))

(declare-fun m!1390899 () Bool)

(assert (=> b!1507923 m!1390899))

(assert (=> b!1507923 m!1390899))

(declare-fun m!1390901 () Bool)

(assert (=> b!1507923 m!1390901))

(declare-fun m!1390903 () Bool)

(assert (=> start!128712 m!1390903))

(declare-fun m!1390905 () Bool)

(assert (=> start!128712 m!1390905))

(assert (=> b!1507924 m!1390899))

(assert (=> b!1507924 m!1390899))

(declare-fun m!1390907 () Bool)

(assert (=> b!1507924 m!1390907))

(declare-fun m!1390909 () Bool)

(assert (=> b!1507925 m!1390909))

(assert (=> b!1507925 m!1390909))

(declare-fun m!1390911 () Bool)

(assert (=> b!1507925 m!1390911))

(declare-fun m!1390913 () Bool)

(assert (=> b!1507927 m!1390913))

(declare-fun m!1390915 () Bool)

(assert (=> b!1507921 m!1390915))

(push 1)

(assert (not b!1507924))

(assert (not b!1507923))

(assert (not b!1507927))

(assert (not start!128712))

(assert (not b!1507925))

(assert (not b!1507921))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

