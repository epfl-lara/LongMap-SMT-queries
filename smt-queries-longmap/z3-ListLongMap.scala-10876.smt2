; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127472 () Bool)

(assert start!127472)

(declare-fun b!1497875 () Bool)

(declare-fun res!1019144 () Bool)

(declare-fun e!838733 () Bool)

(assert (=> b!1497875 (=> (not res!1019144) (not e!838733))))

(declare-datatypes ((array!99847 0))(
  ( (array!99848 (arr!48184 (Array (_ BitVec 32) (_ BitVec 64))) (size!48736 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99847)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497875 (= res!1019144 (validKeyInArray!0 (select (arr!48184 a!2850) j!87)))))

(declare-fun res!1019141 () Bool)

(assert (=> start!127472 (=> (not res!1019141) (not e!838733))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127472 (= res!1019141 (validMask!0 mask!2661))))

(assert (=> start!127472 e!838733))

(assert (=> start!127472 true))

(declare-fun array_inv!37417 (array!99847) Bool)

(assert (=> start!127472 (array_inv!37417 a!2850)))

(declare-fun b!1497876 () Bool)

(declare-fun res!1019142 () Bool)

(assert (=> b!1497876 (=> (not res!1019142) (not e!838733))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1497876 (= res!1019142 (validKeyInArray!0 (select (arr!48184 a!2850) i!996)))))

(declare-fun b!1497877 () Bool)

(declare-fun res!1019140 () Bool)

(assert (=> b!1497877 (=> (not res!1019140) (not e!838733))))

(declare-datatypes ((List!34754 0))(
  ( (Nil!34751) (Cons!34750 (h!36148 (_ BitVec 64)) (t!49440 List!34754)) )
))
(declare-fun arrayNoDuplicates!0 (array!99847 (_ BitVec 32) List!34754) Bool)

(assert (=> b!1497877 (= res!1019140 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34751))))

(declare-fun b!1497878 () Bool)

(declare-fun res!1019139 () Bool)

(assert (=> b!1497878 (=> (not res!1019139) (not e!838733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99847 (_ BitVec 32)) Bool)

(assert (=> b!1497878 (= res!1019139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1497879 () Bool)

(declare-fun res!1019143 () Bool)

(assert (=> b!1497879 (=> (not res!1019143) (not e!838733))))

(assert (=> b!1497879 (= res!1019143 (and (= (size!48736 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48736 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48736 a!2850)) (not (= i!996 j!87))))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun b!1497880 () Bool)

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1497880 (= e!838733 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48736 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48736 a!2850)) (= (select (arr!48184 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48184 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48736 a!2850)) (bvsge mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(assert (= (and start!127472 res!1019141) b!1497879))

(assert (= (and b!1497879 res!1019143) b!1497876))

(assert (= (and b!1497876 res!1019142) b!1497875))

(assert (= (and b!1497875 res!1019144) b!1497878))

(assert (= (and b!1497878 res!1019139) b!1497877))

(assert (= (and b!1497877 res!1019140) b!1497880))

(declare-fun m!1380397 () Bool)

(assert (=> b!1497875 m!1380397))

(assert (=> b!1497875 m!1380397))

(declare-fun m!1380399 () Bool)

(assert (=> b!1497875 m!1380399))

(declare-fun m!1380401 () Bool)

(assert (=> start!127472 m!1380401))

(declare-fun m!1380403 () Bool)

(assert (=> start!127472 m!1380403))

(declare-fun m!1380405 () Bool)

(assert (=> b!1497880 m!1380405))

(declare-fun m!1380407 () Bool)

(assert (=> b!1497880 m!1380407))

(declare-fun m!1380409 () Bool)

(assert (=> b!1497880 m!1380409))

(declare-fun m!1380411 () Bool)

(assert (=> b!1497876 m!1380411))

(assert (=> b!1497876 m!1380411))

(declare-fun m!1380413 () Bool)

(assert (=> b!1497876 m!1380413))

(declare-fun m!1380415 () Bool)

(assert (=> b!1497878 m!1380415))

(declare-fun m!1380417 () Bool)

(assert (=> b!1497877 m!1380417))

(check-sat (not start!127472) (not b!1497878) (not b!1497875) (not b!1497876) (not b!1497877))
(check-sat)
