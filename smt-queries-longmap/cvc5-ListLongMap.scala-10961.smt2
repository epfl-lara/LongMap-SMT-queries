; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128364 () Bool)

(assert start!128364)

(declare-fun b!1505856 () Bool)

(declare-fun res!1026252 () Bool)

(declare-fun e!841657 () Bool)

(assert (=> b!1505856 (=> (not res!1026252) (not e!841657))))

(declare-datatypes ((array!100436 0))(
  ( (array!100437 (arr!48464 (Array (_ BitVec 32) (_ BitVec 64))) (size!49014 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100436)

(declare-datatypes ((List!34947 0))(
  ( (Nil!34944) (Cons!34943 (h!36340 (_ BitVec 64)) (t!49641 List!34947)) )
))
(declare-fun arrayNoDuplicates!0 (array!100436 (_ BitVec 32) List!34947) Bool)

(assert (=> b!1505856 (= res!1026252 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34944))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1505857 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1505857 (= e!841657 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49014 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49014 a!2804)) (bvslt mask!2512 #b00000000000000000000000000000000)))))

(declare-fun res!1026249 () Bool)

(assert (=> start!128364 (=> (not res!1026249) (not e!841657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128364 (= res!1026249 (validMask!0 mask!2512))))

(assert (=> start!128364 e!841657))

(assert (=> start!128364 true))

(declare-fun array_inv!37492 (array!100436) Bool)

(assert (=> start!128364 (array_inv!37492 a!2804)))

(declare-fun b!1505858 () Bool)

(declare-fun res!1026248 () Bool)

(assert (=> b!1505858 (=> (not res!1026248) (not e!841657))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1505858 (= res!1026248 (and (= (size!49014 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49014 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49014 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505859 () Bool)

(declare-fun res!1026250 () Bool)

(assert (=> b!1505859 (=> (not res!1026250) (not e!841657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100436 (_ BitVec 32)) Bool)

(assert (=> b!1505859 (= res!1026250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505860 () Bool)

(declare-fun res!1026253 () Bool)

(assert (=> b!1505860 (=> (not res!1026253) (not e!841657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505860 (= res!1026253 (validKeyInArray!0 (select (arr!48464 a!2804) i!961)))))

(declare-fun b!1505861 () Bool)

(declare-fun res!1026251 () Bool)

(assert (=> b!1505861 (=> (not res!1026251) (not e!841657))))

(assert (=> b!1505861 (= res!1026251 (validKeyInArray!0 (select (arr!48464 a!2804) j!70)))))

(assert (= (and start!128364 res!1026249) b!1505858))

(assert (= (and b!1505858 res!1026248) b!1505860))

(assert (= (and b!1505860 res!1026253) b!1505861))

(assert (= (and b!1505861 res!1026251) b!1505859))

(assert (= (and b!1505859 res!1026250) b!1505856))

(assert (= (and b!1505856 res!1026252) b!1505857))

(declare-fun m!1388923 () Bool)

(assert (=> start!128364 m!1388923))

(declare-fun m!1388925 () Bool)

(assert (=> start!128364 m!1388925))

(declare-fun m!1388927 () Bool)

(assert (=> b!1505856 m!1388927))

(declare-fun m!1388929 () Bool)

(assert (=> b!1505860 m!1388929))

(assert (=> b!1505860 m!1388929))

(declare-fun m!1388931 () Bool)

(assert (=> b!1505860 m!1388931))

(declare-fun m!1388933 () Bool)

(assert (=> b!1505861 m!1388933))

(assert (=> b!1505861 m!1388933))

(declare-fun m!1388935 () Bool)

(assert (=> b!1505861 m!1388935))

(declare-fun m!1388937 () Bool)

(assert (=> b!1505859 m!1388937))

(push 1)

(assert (not start!128364))

(assert (not b!1505861))

(assert (not b!1505859))

(assert (not b!1505856))

(assert (not b!1505860))

(check-sat)

(pop 1)

