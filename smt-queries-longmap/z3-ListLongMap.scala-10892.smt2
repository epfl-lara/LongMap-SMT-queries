; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127616 () Bool)

(assert start!127616)

(declare-fun b!1499213 () Bool)

(declare-fun e!839227 () Bool)

(assert (=> b!1499213 (= e!839227 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99997 0))(
  ( (array!99998 (arr!48258 (Array (_ BitVec 32) (_ BitVec 64))) (size!48808 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99997)

(declare-fun index!625 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12468 0))(
  ( (MissingZero!12468 (index!52264 (_ BitVec 32))) (Found!12468 (index!52265 (_ BitVec 32))) (Intermediate!12468 (undefined!13280 Bool) (index!52266 (_ BitVec 32)) (x!133950 (_ BitVec 32))) (Undefined!12468) (MissingVacant!12468 (index!52267 (_ BitVec 32))) )
))
(declare-fun lt!652693 () SeekEntryResult!12468)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99997 (_ BitVec 32)) SeekEntryResult!12468)

(assert (=> b!1499213 (= lt!652693 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48258 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499214 () Bool)

(declare-fun res!1020293 () Bool)

(assert (=> b!1499214 (=> (not res!1020293) (not e!839227))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1499214 (= res!1020293 (and (= (size!48808 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48808 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48808 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1020294 () Bool)

(assert (=> start!127616 (=> (not res!1020294) (not e!839227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127616 (= res!1020294 (validMask!0 mask!2661))))

(assert (=> start!127616 e!839227))

(assert (=> start!127616 true))

(declare-fun array_inv!37286 (array!99997) Bool)

(assert (=> start!127616 (array_inv!37286 a!2850)))

(declare-fun b!1499215 () Bool)

(declare-fun res!1020289 () Bool)

(assert (=> b!1499215 (=> (not res!1020289) (not e!839227))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499215 (= res!1020289 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48808 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48808 a!2850)) (= (select (arr!48258 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48258 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48808 a!2850))))))

(declare-fun b!1499216 () Bool)

(declare-fun res!1020291 () Bool)

(assert (=> b!1499216 (=> (not res!1020291) (not e!839227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499216 (= res!1020291 (validKeyInArray!0 (select (arr!48258 a!2850) i!996)))))

(declare-fun b!1499217 () Bool)

(declare-fun res!1020290 () Bool)

(assert (=> b!1499217 (=> (not res!1020290) (not e!839227))))

(assert (=> b!1499217 (= res!1020290 (validKeyInArray!0 (select (arr!48258 a!2850) j!87)))))

(declare-fun b!1499218 () Bool)

(declare-fun res!1020292 () Bool)

(assert (=> b!1499218 (=> (not res!1020292) (not e!839227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99997 (_ BitVec 32)) Bool)

(assert (=> b!1499218 (= res!1020292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499219 () Bool)

(declare-fun res!1020295 () Bool)

(assert (=> b!1499219 (=> (not res!1020295) (not e!839227))))

(declare-datatypes ((List!34750 0))(
  ( (Nil!34747) (Cons!34746 (h!36143 (_ BitVec 64)) (t!49444 List!34750)) )
))
(declare-fun arrayNoDuplicates!0 (array!99997 (_ BitVec 32) List!34750) Bool)

(assert (=> b!1499219 (= res!1020295 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34747))))

(assert (= (and start!127616 res!1020294) b!1499214))

(assert (= (and b!1499214 res!1020293) b!1499216))

(assert (= (and b!1499216 res!1020291) b!1499217))

(assert (= (and b!1499217 res!1020290) b!1499218))

(assert (= (and b!1499218 res!1020292) b!1499219))

(assert (= (and b!1499219 res!1020295) b!1499215))

(assert (= (and b!1499215 res!1020289) b!1499213))

(declare-fun m!1382407 () Bool)

(assert (=> b!1499216 m!1382407))

(assert (=> b!1499216 m!1382407))

(declare-fun m!1382409 () Bool)

(assert (=> b!1499216 m!1382409))

(declare-fun m!1382411 () Bool)

(assert (=> b!1499218 m!1382411))

(declare-fun m!1382413 () Bool)

(assert (=> b!1499219 m!1382413))

(declare-fun m!1382415 () Bool)

(assert (=> b!1499215 m!1382415))

(declare-fun m!1382417 () Bool)

(assert (=> b!1499215 m!1382417))

(declare-fun m!1382419 () Bool)

(assert (=> b!1499215 m!1382419))

(declare-fun m!1382421 () Bool)

(assert (=> start!127616 m!1382421))

(declare-fun m!1382423 () Bool)

(assert (=> start!127616 m!1382423))

(declare-fun m!1382425 () Bool)

(assert (=> b!1499213 m!1382425))

(assert (=> b!1499213 m!1382425))

(declare-fun m!1382427 () Bool)

(assert (=> b!1499213 m!1382427))

(assert (=> b!1499217 m!1382425))

(assert (=> b!1499217 m!1382425))

(declare-fun m!1382429 () Bool)

(assert (=> b!1499217 m!1382429))

(check-sat (not b!1499217) (not b!1499213) (not b!1499219) (not b!1499218) (not start!127616) (not b!1499216))
