; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127688 () Bool)

(assert start!127688)

(declare-fun b!1500281 () Bool)

(declare-fun res!1021365 () Bool)

(declare-fun e!839548 () Bool)

(assert (=> b!1500281 (=> (not res!1021365) (not e!839548))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100069 0))(
  ( (array!100070 (arr!48294 (Array (_ BitVec 32) (_ BitVec 64))) (size!48844 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100069)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12504 0))(
  ( (MissingZero!12504 (index!52408 (_ BitVec 32))) (Found!12504 (index!52409 (_ BitVec 32))) (Intermediate!12504 (undefined!13316 Bool) (index!52410 (_ BitVec 32)) (x!134082 (_ BitVec 32))) (Undefined!12504) (MissingVacant!12504 (index!52411 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100069 (_ BitVec 32)) SeekEntryResult!12504)

(assert (=> b!1500281 (= res!1021365 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48294 a!2850) j!87) a!2850 mask!2661) (Found!12504 j!87)))))

(declare-fun res!1021364 () Bool)

(assert (=> start!127688 (=> (not res!1021364) (not e!839548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127688 (= res!1021364 (validMask!0 mask!2661))))

(assert (=> start!127688 e!839548))

(assert (=> start!127688 true))

(declare-fun array_inv!37322 (array!100069) Bool)

(assert (=> start!127688 (array_inv!37322 a!2850)))

(declare-fun b!1500282 () Bool)

(declare-fun res!1021363 () Bool)

(assert (=> b!1500282 (=> (not res!1021363) (not e!839548))))

(declare-datatypes ((List!34786 0))(
  ( (Nil!34783) (Cons!34782 (h!36179 (_ BitVec 64)) (t!49480 List!34786)) )
))
(declare-fun arrayNoDuplicates!0 (array!100069 (_ BitVec 32) List!34786) Bool)

(assert (=> b!1500282 (= res!1021363 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34783))))

(declare-fun b!1500283 () Bool)

(declare-fun res!1021361 () Bool)

(assert (=> b!1500283 (=> (not res!1021361) (not e!839548))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500283 (= res!1021361 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48844 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48844 a!2850)) (= (select (arr!48294 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48294 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48844 a!2850))))))

(declare-fun b!1500284 () Bool)

(declare-fun res!1021360 () Bool)

(assert (=> b!1500284 (=> (not res!1021360) (not e!839548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500284 (= res!1021360 (validKeyInArray!0 (select (arr!48294 a!2850) j!87)))))

(declare-fun b!1500285 () Bool)

(declare-fun res!1021359 () Bool)

(assert (=> b!1500285 (=> (not res!1021359) (not e!839548))))

(assert (=> b!1500285 (= res!1021359 (validKeyInArray!0 (select (arr!48294 a!2850) i!996)))))

(declare-fun b!1500286 () Bool)

(declare-fun res!1021362 () Bool)

(assert (=> b!1500286 (=> (not res!1021362) (not e!839548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100069 (_ BitVec 32)) Bool)

(assert (=> b!1500286 (= res!1021362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500287 () Bool)

(declare-fun res!1021366 () Bool)

(assert (=> b!1500287 (=> (not res!1021366) (not e!839548))))

(assert (=> b!1500287 (= res!1021366 (not (= (select (arr!48294 a!2850) index!625) (select (arr!48294 a!2850) j!87))))))

(declare-fun b!1500288 () Bool)

(declare-fun e!839546 () Bool)

(assert (=> b!1500288 (= e!839546 false)))

(declare-fun lt!652905 () SeekEntryResult!12504)

(declare-fun lt!652906 () (_ BitVec 32))

(assert (=> b!1500288 (= lt!652905 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652906 vacantBefore!10 (select (arr!48294 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500289 () Bool)

(assert (=> b!1500289 (= e!839548 e!839546)))

(declare-fun res!1021358 () Bool)

(assert (=> b!1500289 (=> (not res!1021358) (not e!839546))))

(assert (=> b!1500289 (= res!1021358 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652906 #b00000000000000000000000000000000) (bvslt lt!652906 (size!48844 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500289 (= lt!652906 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500290 () Bool)

(declare-fun res!1021357 () Bool)

(assert (=> b!1500290 (=> (not res!1021357) (not e!839548))))

(assert (=> b!1500290 (= res!1021357 (and (= (size!48844 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48844 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48844 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127688 res!1021364) b!1500290))

(assert (= (and b!1500290 res!1021357) b!1500285))

(assert (= (and b!1500285 res!1021359) b!1500284))

(assert (= (and b!1500284 res!1021360) b!1500286))

(assert (= (and b!1500286 res!1021362) b!1500282))

(assert (= (and b!1500282 res!1021363) b!1500283))

(assert (= (and b!1500283 res!1021361) b!1500281))

(assert (= (and b!1500281 res!1021365) b!1500287))

(assert (= (and b!1500287 res!1021366) b!1500289))

(assert (= (and b!1500289 res!1021358) b!1500288))

(declare-fun m!1383475 () Bool)

(assert (=> b!1500283 m!1383475))

(declare-fun m!1383477 () Bool)

(assert (=> b!1500283 m!1383477))

(declare-fun m!1383479 () Bool)

(assert (=> b!1500283 m!1383479))

(declare-fun m!1383481 () Bool)

(assert (=> start!127688 m!1383481))

(declare-fun m!1383483 () Bool)

(assert (=> start!127688 m!1383483))

(declare-fun m!1383485 () Bool)

(assert (=> b!1500281 m!1383485))

(assert (=> b!1500281 m!1383485))

(declare-fun m!1383487 () Bool)

(assert (=> b!1500281 m!1383487))

(assert (=> b!1500288 m!1383485))

(assert (=> b!1500288 m!1383485))

(declare-fun m!1383489 () Bool)

(assert (=> b!1500288 m!1383489))

(declare-fun m!1383491 () Bool)

(assert (=> b!1500287 m!1383491))

(assert (=> b!1500287 m!1383485))

(declare-fun m!1383493 () Bool)

(assert (=> b!1500286 m!1383493))

(declare-fun m!1383495 () Bool)

(assert (=> b!1500289 m!1383495))

(declare-fun m!1383497 () Bool)

(assert (=> b!1500285 m!1383497))

(assert (=> b!1500285 m!1383497))

(declare-fun m!1383499 () Bool)

(assert (=> b!1500285 m!1383499))

(declare-fun m!1383501 () Bool)

(assert (=> b!1500282 m!1383501))

(assert (=> b!1500284 m!1383485))

(assert (=> b!1500284 m!1383485))

(declare-fun m!1383503 () Bool)

(assert (=> b!1500284 m!1383503))

(check-sat (not b!1500285) (not b!1500288) (not b!1500286) (not b!1500281) (not b!1500289) (not start!127688) (not b!1500282) (not b!1500284))
(check-sat)
