; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127746 () Bool)

(assert start!127746)

(declare-fun b!1501521 () Bool)

(declare-fun res!1022785 () Bool)

(declare-fun e!839880 () Bool)

(assert (=> b!1501521 (=> (not res!1022785) (not e!839880))))

(declare-datatypes ((array!100121 0))(
  ( (array!100122 (arr!48321 (Array (_ BitVec 32) (_ BitVec 64))) (size!48873 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100121)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501521 (= res!1022785 (validKeyInArray!0 (select (arr!48321 a!2850) i!996)))))

(declare-fun b!1501522 () Bool)

(declare-fun res!1022786 () Bool)

(assert (=> b!1501522 (=> (not res!1022786) (not e!839880))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100121 (_ BitVec 32)) Bool)

(assert (=> b!1501522 (= res!1022786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1022789 () Bool)

(assert (=> start!127746 (=> (not res!1022789) (not e!839880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127746 (= res!1022789 (validMask!0 mask!2661))))

(assert (=> start!127746 e!839880))

(assert (=> start!127746 true))

(declare-fun array_inv!37554 (array!100121) Bool)

(assert (=> start!127746 (array_inv!37554 a!2850)))

(declare-fun b!1501523 () Bool)

(declare-fun res!1022787 () Bool)

(assert (=> b!1501523 (=> (not res!1022787) (not e!839880))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501523 (= res!1022787 (and (= (size!48873 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48873 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48873 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501524 () Bool)

(declare-fun res!1022788 () Bool)

(assert (=> b!1501524 (=> (not res!1022788) (not e!839880))))

(assert (=> b!1501524 (= res!1022788 (validKeyInArray!0 (select (arr!48321 a!2850) j!87)))))

(declare-fun b!1501525 () Bool)

(assert (=> b!1501525 (= e!839880 false)))

(declare-fun lt!652993 () Bool)

(declare-datatypes ((List!34891 0))(
  ( (Nil!34888) (Cons!34887 (h!36285 (_ BitVec 64)) (t!49577 List!34891)) )
))
(declare-fun arrayNoDuplicates!0 (array!100121 (_ BitVec 32) List!34891) Bool)

(assert (=> b!1501525 (= lt!652993 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34888))))

(assert (= (and start!127746 res!1022789) b!1501523))

(assert (= (and b!1501523 res!1022787) b!1501521))

(assert (= (and b!1501521 res!1022785) b!1501524))

(assert (= (and b!1501524 res!1022788) b!1501522))

(assert (= (and b!1501522 res!1022786) b!1501525))

(declare-fun m!1384245 () Bool)

(assert (=> b!1501522 m!1384245))

(declare-fun m!1384247 () Bool)

(assert (=> start!127746 m!1384247))

(declare-fun m!1384249 () Bool)

(assert (=> start!127746 m!1384249))

(declare-fun m!1384251 () Bool)

(assert (=> b!1501524 m!1384251))

(assert (=> b!1501524 m!1384251))

(declare-fun m!1384253 () Bool)

(assert (=> b!1501524 m!1384253))

(declare-fun m!1384255 () Bool)

(assert (=> b!1501525 m!1384255))

(declare-fun m!1384257 () Bool)

(assert (=> b!1501521 m!1384257))

(assert (=> b!1501521 m!1384257))

(declare-fun m!1384259 () Bool)

(assert (=> b!1501521 m!1384259))

(push 1)

(assert (not b!1501521))

(assert (not b!1501524))

(assert (not b!1501522))

(assert (not b!1501525))

(assert (not start!127746))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

