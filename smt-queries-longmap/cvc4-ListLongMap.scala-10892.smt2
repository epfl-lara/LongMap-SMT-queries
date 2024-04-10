; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127618 () Bool)

(assert start!127618)

(declare-fun b!1499234 () Bool)

(declare-fun res!1020315 () Bool)

(declare-fun e!839232 () Bool)

(assert (=> b!1499234 (=> (not res!1020315) (not e!839232))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99999 0))(
  ( (array!100000 (arr!48259 (Array (_ BitVec 32) (_ BitVec 64))) (size!48809 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99999)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499234 (= res!1020315 (and (= (size!48809 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48809 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48809 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499235 () Bool)

(declare-fun res!1020312 () Bool)

(assert (=> b!1499235 (=> (not res!1020312) (not e!839232))))

(declare-datatypes ((List!34751 0))(
  ( (Nil!34748) (Cons!34747 (h!36144 (_ BitVec 64)) (t!49445 List!34751)) )
))
(declare-fun arrayNoDuplicates!0 (array!99999 (_ BitVec 32) List!34751) Bool)

(assert (=> b!1499235 (= res!1020312 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34748))))

(declare-fun b!1499236 () Bool)

(assert (=> b!1499236 (= e!839232 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12469 0))(
  ( (MissingZero!12469 (index!52268 (_ BitVec 32))) (Found!12469 (index!52269 (_ BitVec 32))) (Intermediate!12469 (undefined!13281 Bool) (index!52270 (_ BitVec 32)) (x!133951 (_ BitVec 32))) (Undefined!12469) (MissingVacant!12469 (index!52271 (_ BitVec 32))) )
))
(declare-fun lt!652696 () SeekEntryResult!12469)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99999 (_ BitVec 32)) SeekEntryResult!12469)

(assert (=> b!1499236 (= lt!652696 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48259 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499237 () Bool)

(declare-fun res!1020316 () Bool)

(assert (=> b!1499237 (=> (not res!1020316) (not e!839232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99999 (_ BitVec 32)) Bool)

(assert (=> b!1499237 (= res!1020316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499238 () Bool)

(declare-fun res!1020311 () Bool)

(assert (=> b!1499238 (=> (not res!1020311) (not e!839232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499238 (= res!1020311 (validKeyInArray!0 (select (arr!48259 a!2850) i!996)))))

(declare-fun b!1499239 () Bool)

(declare-fun res!1020313 () Bool)

(assert (=> b!1499239 (=> (not res!1020313) (not e!839232))))

(assert (=> b!1499239 (= res!1020313 (validKeyInArray!0 (select (arr!48259 a!2850) j!87)))))

(declare-fun res!1020314 () Bool)

(assert (=> start!127618 (=> (not res!1020314) (not e!839232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127618 (= res!1020314 (validMask!0 mask!2661))))

(assert (=> start!127618 e!839232))

(assert (=> start!127618 true))

(declare-fun array_inv!37287 (array!99999) Bool)

(assert (=> start!127618 (array_inv!37287 a!2850)))

(declare-fun b!1499240 () Bool)

(declare-fun res!1020310 () Bool)

(assert (=> b!1499240 (=> (not res!1020310) (not e!839232))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499240 (= res!1020310 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48809 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48809 a!2850)) (= (select (arr!48259 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48259 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48809 a!2850))))))

(assert (= (and start!127618 res!1020314) b!1499234))

(assert (= (and b!1499234 res!1020315) b!1499238))

(assert (= (and b!1499238 res!1020311) b!1499239))

(assert (= (and b!1499239 res!1020313) b!1499237))

(assert (= (and b!1499237 res!1020316) b!1499235))

(assert (= (and b!1499235 res!1020312) b!1499240))

(assert (= (and b!1499240 res!1020310) b!1499236))

(declare-fun m!1382431 () Bool)

(assert (=> b!1499238 m!1382431))

(assert (=> b!1499238 m!1382431))

(declare-fun m!1382433 () Bool)

(assert (=> b!1499238 m!1382433))

(declare-fun m!1382435 () Bool)

(assert (=> start!127618 m!1382435))

(declare-fun m!1382437 () Bool)

(assert (=> start!127618 m!1382437))

(declare-fun m!1382439 () Bool)

(assert (=> b!1499239 m!1382439))

(assert (=> b!1499239 m!1382439))

(declare-fun m!1382441 () Bool)

(assert (=> b!1499239 m!1382441))

(declare-fun m!1382443 () Bool)

(assert (=> b!1499240 m!1382443))

(declare-fun m!1382445 () Bool)

(assert (=> b!1499240 m!1382445))

(declare-fun m!1382447 () Bool)

(assert (=> b!1499240 m!1382447))

(declare-fun m!1382449 () Bool)

(assert (=> b!1499235 m!1382449))

(declare-fun m!1382451 () Bool)

(assert (=> b!1499237 m!1382451))

(assert (=> b!1499236 m!1382439))

(assert (=> b!1499236 m!1382439))

(declare-fun m!1382453 () Bool)

(assert (=> b!1499236 m!1382453))

(push 1)

(assert (not b!1499237))

(assert (not b!1499236))

(assert (not b!1499239))

(assert (not b!1499235))

(assert (not start!127618))

