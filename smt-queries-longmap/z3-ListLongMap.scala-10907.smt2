; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128006 () Bool)

(assert start!128006)

(declare-fun b!1502359 () Bool)

(declare-fun res!1022256 () Bool)

(declare-fun e!840757 () Bool)

(assert (=> b!1502359 (=> (not res!1022256) (not e!840757))))

(declare-datatypes ((array!100201 0))(
  ( (array!100202 (arr!48355 (Array (_ BitVec 32) (_ BitVec 64))) (size!48906 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100201)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502359 (= res!1022256 (validKeyInArray!0 (select (arr!48355 a!2850) i!996)))))

(declare-fun b!1502361 () Bool)

(declare-fun e!840759 () Bool)

(assert (=> b!1502361 (= e!840757 e!840759)))

(declare-fun res!1022254 () Bool)

(assert (=> b!1502361 (=> (not res!1022254) (not e!840759))))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653618 () (_ BitVec 32))

(assert (=> b!1502361 (= res!1022254 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653618 #b00000000000000000000000000000000) (bvslt lt!653618 (size!48906 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502361 (= lt!653618 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1502362 () Bool)

(declare-fun res!1022253 () Bool)

(assert (=> b!1502362 (=> (not res!1022253) (not e!840757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100201 (_ BitVec 32)) Bool)

(assert (=> b!1502362 (= res!1022253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502363 () Bool)

(assert (=> b!1502363 (= e!840759 false)))

(declare-datatypes ((SeekEntryResult!12458 0))(
  ( (MissingZero!12458 (index!52224 (_ BitVec 32))) (Found!12458 (index!52225 (_ BitVec 32))) (Intermediate!12458 (undefined!13270 Bool) (index!52226 (_ BitVec 32)) (x!134097 (_ BitVec 32))) (Undefined!12458) (MissingVacant!12458 (index!52227 (_ BitVec 32))) )
))
(declare-fun lt!653619 () SeekEntryResult!12458)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100201 (_ BitVec 32)) SeekEntryResult!12458)

(assert (=> b!1502363 (= lt!653619 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653618 vacantBefore!10 (select (arr!48355 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502364 () Bool)

(declare-fun res!1022255 () Bool)

(assert (=> b!1502364 (=> (not res!1022255) (not e!840757))))

(assert (=> b!1502364 (= res!1022255 (not (= (select (arr!48355 a!2850) index!625) (select (arr!48355 a!2850) j!87))))))

(declare-fun res!1022259 () Bool)

(assert (=> start!128006 (=> (not res!1022259) (not e!840757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128006 (= res!1022259 (validMask!0 mask!2661))))

(assert (=> start!128006 e!840757))

(assert (=> start!128006 true))

(declare-fun array_inv!37636 (array!100201) Bool)

(assert (=> start!128006 (array_inv!37636 a!2850)))

(declare-fun b!1502360 () Bool)

(declare-fun res!1022260 () Bool)

(assert (=> b!1502360 (=> (not res!1022260) (not e!840757))))

(assert (=> b!1502360 (= res!1022260 (validKeyInArray!0 (select (arr!48355 a!2850) j!87)))))

(declare-fun b!1502365 () Bool)

(declare-fun res!1022257 () Bool)

(assert (=> b!1502365 (=> (not res!1022257) (not e!840757))))

(assert (=> b!1502365 (= res!1022257 (and (= (size!48906 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48906 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48906 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502366 () Bool)

(declare-fun res!1022261 () Bool)

(assert (=> b!1502366 (=> (not res!1022261) (not e!840757))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502366 (= res!1022261 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48906 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48906 a!2850)) (= (select (arr!48355 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48355 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48906 a!2850))))))

(declare-fun b!1502367 () Bool)

(declare-fun res!1022252 () Bool)

(assert (=> b!1502367 (=> (not res!1022252) (not e!840757))))

(declare-datatypes ((List!34834 0))(
  ( (Nil!34831) (Cons!34830 (h!36242 (_ BitVec 64)) (t!49520 List!34834)) )
))
(declare-fun arrayNoDuplicates!0 (array!100201 (_ BitVec 32) List!34834) Bool)

(assert (=> b!1502367 (= res!1022252 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34831))))

(declare-fun b!1502368 () Bool)

(declare-fun res!1022258 () Bool)

(assert (=> b!1502368 (=> (not res!1022258) (not e!840757))))

(assert (=> b!1502368 (= res!1022258 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48355 a!2850) j!87) a!2850 mask!2661) (Found!12458 j!87)))))

(assert (= (and start!128006 res!1022259) b!1502365))

(assert (= (and b!1502365 res!1022257) b!1502359))

(assert (= (and b!1502359 res!1022256) b!1502360))

(assert (= (and b!1502360 res!1022260) b!1502362))

(assert (= (and b!1502362 res!1022253) b!1502367))

(assert (= (and b!1502367 res!1022252) b!1502366))

(assert (= (and b!1502366 res!1022261) b!1502368))

(assert (= (and b!1502368 res!1022258) b!1502364))

(assert (= (and b!1502364 res!1022255) b!1502361))

(assert (= (and b!1502361 res!1022254) b!1502363))

(declare-fun m!1385503 () Bool)

(assert (=> b!1502366 m!1385503))

(declare-fun m!1385505 () Bool)

(assert (=> b!1502366 m!1385505))

(declare-fun m!1385507 () Bool)

(assert (=> b!1502366 m!1385507))

(declare-fun m!1385509 () Bool)

(assert (=> b!1502364 m!1385509))

(declare-fun m!1385511 () Bool)

(assert (=> b!1502364 m!1385511))

(assert (=> b!1502360 m!1385511))

(assert (=> b!1502360 m!1385511))

(declare-fun m!1385513 () Bool)

(assert (=> b!1502360 m!1385513))

(assert (=> b!1502368 m!1385511))

(assert (=> b!1502368 m!1385511))

(declare-fun m!1385515 () Bool)

(assert (=> b!1502368 m!1385515))

(declare-fun m!1385517 () Bool)

(assert (=> b!1502359 m!1385517))

(assert (=> b!1502359 m!1385517))

(declare-fun m!1385519 () Bool)

(assert (=> b!1502359 m!1385519))

(declare-fun m!1385521 () Bool)

(assert (=> b!1502361 m!1385521))

(assert (=> b!1502363 m!1385511))

(assert (=> b!1502363 m!1385511))

(declare-fun m!1385523 () Bool)

(assert (=> b!1502363 m!1385523))

(declare-fun m!1385525 () Bool)

(assert (=> b!1502362 m!1385525))

(declare-fun m!1385527 () Bool)

(assert (=> b!1502367 m!1385527))

(declare-fun m!1385529 () Bool)

(assert (=> start!128006 m!1385529))

(declare-fun m!1385531 () Bool)

(assert (=> start!128006 m!1385531))

(check-sat (not b!1502362) (not b!1502361) (not b!1502368) (not start!128006) (not b!1502363) (not b!1502367) (not b!1502359) (not b!1502360))
(check-sat)
