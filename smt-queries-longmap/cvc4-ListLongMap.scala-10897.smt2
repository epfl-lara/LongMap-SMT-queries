; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127600 () Bool)

(assert start!127600)

(declare-fun b!1499335 () Bool)

(declare-fun res!1020607 () Bool)

(declare-fun e!839160 () Bool)

(assert (=> b!1499335 (=> (not res!1020607) (not e!839160))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99975 0))(
  ( (array!99976 (arr!48248 (Array (_ BitVec 32) (_ BitVec 64))) (size!48800 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99975)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499335 (= res!1020607 (and (= (size!48800 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48800 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48800 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499336 () Bool)

(declare-fun res!1020608 () Bool)

(assert (=> b!1499336 (=> (not res!1020608) (not e!839160))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12479 0))(
  ( (MissingZero!12479 (index!52308 (_ BitVec 32))) (Found!12479 (index!52309 (_ BitVec 32))) (Intermediate!12479 (undefined!13291 Bool) (index!52310 (_ BitVec 32)) (x!133996 (_ BitVec 32))) (Undefined!12479) (MissingVacant!12479 (index!52311 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99975 (_ BitVec 32)) SeekEntryResult!12479)

(assert (=> b!1499336 (= res!1020608 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48248 a!2850) j!87) a!2850 mask!2661) (Found!12479 j!87)))))

(declare-fun res!1020599 () Bool)

(assert (=> start!127600 (=> (not res!1020599) (not e!839160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127600 (= res!1020599 (validMask!0 mask!2661))))

(assert (=> start!127600 e!839160))

(assert (=> start!127600 true))

(declare-fun array_inv!37481 (array!99975) Bool)

(assert (=> start!127600 (array_inv!37481 a!2850)))

(declare-fun b!1499337 () Bool)

(declare-fun res!1020605 () Bool)

(assert (=> b!1499337 (=> (not res!1020605) (not e!839160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99975 (_ BitVec 32)) Bool)

(assert (=> b!1499337 (= res!1020605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499338 () Bool)

(declare-fun res!1020602 () Bool)

(assert (=> b!1499338 (=> (not res!1020602) (not e!839160))))

(declare-datatypes ((List!34818 0))(
  ( (Nil!34815) (Cons!34814 (h!36212 (_ BitVec 64)) (t!49504 List!34818)) )
))
(declare-fun arrayNoDuplicates!0 (array!99975 (_ BitVec 32) List!34818) Bool)

(assert (=> b!1499338 (= res!1020602 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34815))))

(declare-fun b!1499339 () Bool)

(declare-fun res!1020606 () Bool)

(assert (=> b!1499339 (=> (not res!1020606) (not e!839160))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499339 (= res!1020606 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48800 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48800 a!2850)) (= (select (arr!48248 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48248 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48800 a!2850))))))

(declare-fun b!1499340 () Bool)

(declare-fun res!1020601 () Bool)

(assert (=> b!1499340 (=> (not res!1020601) (not e!839160))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499340 (= res!1020601 (validKeyInArray!0 (select (arr!48248 a!2850) j!87)))))

(declare-fun b!1499341 () Bool)

(declare-fun e!839159 () Bool)

(assert (=> b!1499341 (= e!839160 e!839159)))

(declare-fun res!1020600 () Bool)

(assert (=> b!1499341 (=> (not res!1020600) (not e!839159))))

(declare-fun lt!652501 () (_ BitVec 32))

(assert (=> b!1499341 (= res!1020600 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652501 #b00000000000000000000000000000000) (bvslt lt!652501 (size!48800 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499341 (= lt!652501 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499342 () Bool)

(declare-fun res!1020604 () Bool)

(assert (=> b!1499342 (=> (not res!1020604) (not e!839160))))

(assert (=> b!1499342 (= res!1020604 (validKeyInArray!0 (select (arr!48248 a!2850) i!996)))))

(declare-fun b!1499343 () Bool)

(declare-fun res!1020603 () Bool)

(assert (=> b!1499343 (=> (not res!1020603) (not e!839160))))

(assert (=> b!1499343 (= res!1020603 (not (= (select (arr!48248 a!2850) index!625) (select (arr!48248 a!2850) j!87))))))

(declare-fun b!1499344 () Bool)

(assert (=> b!1499344 (= e!839159 false)))

(declare-fun lt!652500 () SeekEntryResult!12479)

(assert (=> b!1499344 (= lt!652500 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652501 vacantBefore!10 (select (arr!48248 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127600 res!1020599) b!1499335))

(assert (= (and b!1499335 res!1020607) b!1499342))

(assert (= (and b!1499342 res!1020604) b!1499340))

(assert (= (and b!1499340 res!1020601) b!1499337))

(assert (= (and b!1499337 res!1020605) b!1499338))

(assert (= (and b!1499338 res!1020602) b!1499339))

(assert (= (and b!1499339 res!1020606) b!1499336))

(assert (= (and b!1499336 res!1020608) b!1499343))

(assert (= (and b!1499343 res!1020603) b!1499341))

(assert (= (and b!1499341 res!1020600) b!1499344))

(declare-fun m!1381975 () Bool)

(assert (=> b!1499341 m!1381975))

(declare-fun m!1381977 () Bool)

(assert (=> b!1499344 m!1381977))

(assert (=> b!1499344 m!1381977))

(declare-fun m!1381979 () Bool)

(assert (=> b!1499344 m!1381979))

(declare-fun m!1381981 () Bool)

(assert (=> start!127600 m!1381981))

(declare-fun m!1381983 () Bool)

(assert (=> start!127600 m!1381983))

(declare-fun m!1381985 () Bool)

(assert (=> b!1499343 m!1381985))

(assert (=> b!1499343 m!1381977))

(declare-fun m!1381987 () Bool)

(assert (=> b!1499339 m!1381987))

(declare-fun m!1381989 () Bool)

(assert (=> b!1499339 m!1381989))

(declare-fun m!1381991 () Bool)

(assert (=> b!1499339 m!1381991))

(declare-fun m!1381993 () Bool)

(assert (=> b!1499342 m!1381993))

(assert (=> b!1499342 m!1381993))

(declare-fun m!1381995 () Bool)

(assert (=> b!1499342 m!1381995))

(declare-fun m!1381997 () Bool)

(assert (=> b!1499337 m!1381997))

(declare-fun m!1381999 () Bool)

(assert (=> b!1499338 m!1381999))

(assert (=> b!1499336 m!1381977))

(assert (=> b!1499336 m!1381977))

(declare-fun m!1382001 () Bool)

(assert (=> b!1499336 m!1382001))

(assert (=> b!1499340 m!1381977))

(assert (=> b!1499340 m!1381977))

(declare-fun m!1382003 () Bool)

(assert (=> b!1499340 m!1382003))

(push 1)

(assert (not b!1499340))

(assert (not b!1499342))

(assert (not b!1499344))

(assert (not b!1499337))

(assert (not b!1499341))

(assert (not b!1499336))

(assert (not start!127600))

(assert (not b!1499338))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

