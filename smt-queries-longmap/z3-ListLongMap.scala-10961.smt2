; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128366 () Bool)

(assert start!128366)

(declare-fun b!1505874 () Bool)

(declare-fun res!1026266 () Bool)

(declare-fun e!841662 () Bool)

(assert (=> b!1505874 (=> (not res!1026266) (not e!841662))))

(declare-datatypes ((array!100438 0))(
  ( (array!100439 (arr!48465 (Array (_ BitVec 32) (_ BitVec 64))) (size!49015 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100438)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100438 (_ BitVec 32)) Bool)

(assert (=> b!1505874 (= res!1026266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505875 () Bool)

(declare-fun res!1026268 () Bool)

(assert (=> b!1505875 (=> (not res!1026268) (not e!841662))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1505875 (= res!1026268 (and (= (size!49015 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49015 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49015 a!2804)) (not (= i!961 j!70))))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1505876 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1505876 (= e!841662 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49015 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49015 a!2804)) (bvslt mask!2512 #b00000000000000000000000000000000)))))

(declare-fun res!1026271 () Bool)

(assert (=> start!128366 (=> (not res!1026271) (not e!841662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128366 (= res!1026271 (validMask!0 mask!2512))))

(assert (=> start!128366 e!841662))

(assert (=> start!128366 true))

(declare-fun array_inv!37493 (array!100438) Bool)

(assert (=> start!128366 (array_inv!37493 a!2804)))

(declare-fun b!1505877 () Bool)

(declare-fun res!1026269 () Bool)

(assert (=> b!1505877 (=> (not res!1026269) (not e!841662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505877 (= res!1026269 (validKeyInArray!0 (select (arr!48465 a!2804) i!961)))))

(declare-fun b!1505878 () Bool)

(declare-fun res!1026270 () Bool)

(assert (=> b!1505878 (=> (not res!1026270) (not e!841662))))

(assert (=> b!1505878 (= res!1026270 (validKeyInArray!0 (select (arr!48465 a!2804) j!70)))))

(declare-fun b!1505879 () Bool)

(declare-fun res!1026267 () Bool)

(assert (=> b!1505879 (=> (not res!1026267) (not e!841662))))

(declare-datatypes ((List!34948 0))(
  ( (Nil!34945) (Cons!34944 (h!36341 (_ BitVec 64)) (t!49642 List!34948)) )
))
(declare-fun arrayNoDuplicates!0 (array!100438 (_ BitVec 32) List!34948) Bool)

(assert (=> b!1505879 (= res!1026267 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34945))))

(assert (= (and start!128366 res!1026271) b!1505875))

(assert (= (and b!1505875 res!1026268) b!1505877))

(assert (= (and b!1505877 res!1026269) b!1505878))

(assert (= (and b!1505878 res!1026270) b!1505874))

(assert (= (and b!1505874 res!1026266) b!1505879))

(assert (= (and b!1505879 res!1026267) b!1505876))

(declare-fun m!1388939 () Bool)

(assert (=> b!1505879 m!1388939))

(declare-fun m!1388941 () Bool)

(assert (=> start!128366 m!1388941))

(declare-fun m!1388943 () Bool)

(assert (=> start!128366 m!1388943))

(declare-fun m!1388945 () Bool)

(assert (=> b!1505874 m!1388945))

(declare-fun m!1388947 () Bool)

(assert (=> b!1505877 m!1388947))

(assert (=> b!1505877 m!1388947))

(declare-fun m!1388949 () Bool)

(assert (=> b!1505877 m!1388949))

(declare-fun m!1388951 () Bool)

(assert (=> b!1505878 m!1388951))

(assert (=> b!1505878 m!1388951))

(declare-fun m!1388953 () Bool)

(assert (=> b!1505878 m!1388953))

(check-sat (not b!1505879) (not b!1505878) (not start!128366) (not b!1505874) (not b!1505877))
(check-sat)
