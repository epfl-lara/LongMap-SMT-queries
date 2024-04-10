; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127696 () Bool)

(assert start!127696)

(declare-fun b!1500401 () Bool)

(declare-fun res!1021483 () Bool)

(declare-fun e!839582 () Bool)

(assert (=> b!1500401 (=> (not res!1021483) (not e!839582))))

(declare-datatypes ((array!100077 0))(
  ( (array!100078 (arr!48298 (Array (_ BitVec 32) (_ BitVec 64))) (size!48848 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100077)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500401 (= res!1021483 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48848 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48848 a!2850)) (= (select (arr!48298 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48298 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48848 a!2850))))))

(declare-fun b!1500402 () Bool)

(declare-fun res!1021481 () Bool)

(assert (=> b!1500402 (=> (not res!1021481) (not e!839582))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500402 (= res!1021481 (and (= (size!48848 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48848 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48848 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500403 () Bool)

(declare-fun res!1021477 () Bool)

(assert (=> b!1500403 (=> (not res!1021477) (not e!839582))))

(declare-datatypes ((List!34790 0))(
  ( (Nil!34787) (Cons!34786 (h!36183 (_ BitVec 64)) (t!49484 List!34790)) )
))
(declare-fun arrayNoDuplicates!0 (array!100077 (_ BitVec 32) List!34790) Bool)

(assert (=> b!1500403 (= res!1021477 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34787))))

(declare-fun b!1500404 () Bool)

(declare-fun e!839584 () Bool)

(assert (=> b!1500404 (= e!839582 e!839584)))

(declare-fun res!1021480 () Bool)

(assert (=> b!1500404 (=> (not res!1021480) (not e!839584))))

(declare-fun lt!652929 () (_ BitVec 32))

(assert (=> b!1500404 (= res!1021480 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652929 #b00000000000000000000000000000000) (bvslt lt!652929 (size!48848 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500404 (= lt!652929 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500405 () Bool)

(declare-fun res!1021486 () Bool)

(assert (=> b!1500405 (=> (not res!1021486) (not e!839582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100077 (_ BitVec 32)) Bool)

(assert (=> b!1500405 (= res!1021486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500406 () Bool)

(declare-fun res!1021484 () Bool)

(assert (=> b!1500406 (=> (not res!1021484) (not e!839582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500406 (= res!1021484 (validKeyInArray!0 (select (arr!48298 a!2850) i!996)))))

(declare-fun b!1500407 () Bool)

(declare-fun res!1021482 () Bool)

(assert (=> b!1500407 (=> (not res!1021482) (not e!839582))))

(assert (=> b!1500407 (= res!1021482 (validKeyInArray!0 (select (arr!48298 a!2850) j!87)))))

(declare-fun b!1500408 () Bool)

(assert (=> b!1500408 (= e!839584 false)))

(declare-datatypes ((SeekEntryResult!12508 0))(
  ( (MissingZero!12508 (index!52424 (_ BitVec 32))) (Found!12508 (index!52425 (_ BitVec 32))) (Intermediate!12508 (undefined!13320 Bool) (index!52426 (_ BitVec 32)) (x!134094 (_ BitVec 32))) (Undefined!12508) (MissingVacant!12508 (index!52427 (_ BitVec 32))) )
))
(declare-fun lt!652930 () SeekEntryResult!12508)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100077 (_ BitVec 32)) SeekEntryResult!12508)

(assert (=> b!1500408 (= lt!652930 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652929 vacantBefore!10 (select (arr!48298 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1021485 () Bool)

(assert (=> start!127696 (=> (not res!1021485) (not e!839582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127696 (= res!1021485 (validMask!0 mask!2661))))

(assert (=> start!127696 e!839582))

(assert (=> start!127696 true))

(declare-fun array_inv!37326 (array!100077) Bool)

(assert (=> start!127696 (array_inv!37326 a!2850)))

(declare-fun b!1500409 () Bool)

(declare-fun res!1021478 () Bool)

(assert (=> b!1500409 (=> (not res!1021478) (not e!839582))))

(assert (=> b!1500409 (= res!1021478 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48298 a!2850) j!87) a!2850 mask!2661) (Found!12508 j!87)))))

(declare-fun b!1500410 () Bool)

(declare-fun res!1021479 () Bool)

(assert (=> b!1500410 (=> (not res!1021479) (not e!839582))))

(assert (=> b!1500410 (= res!1021479 (not (= (select (arr!48298 a!2850) index!625) (select (arr!48298 a!2850) j!87))))))

(assert (= (and start!127696 res!1021485) b!1500402))

(assert (= (and b!1500402 res!1021481) b!1500406))

(assert (= (and b!1500406 res!1021484) b!1500407))

(assert (= (and b!1500407 res!1021482) b!1500405))

(assert (= (and b!1500405 res!1021486) b!1500403))

(assert (= (and b!1500403 res!1021477) b!1500401))

(assert (= (and b!1500401 res!1021483) b!1500409))

(assert (= (and b!1500409 res!1021478) b!1500410))

(assert (= (and b!1500410 res!1021479) b!1500404))

(assert (= (and b!1500404 res!1021480) b!1500408))

(declare-fun m!1383595 () Bool)

(assert (=> b!1500406 m!1383595))

(assert (=> b!1500406 m!1383595))

(declare-fun m!1383597 () Bool)

(assert (=> b!1500406 m!1383597))

(declare-fun m!1383599 () Bool)

(assert (=> b!1500408 m!1383599))

(assert (=> b!1500408 m!1383599))

(declare-fun m!1383601 () Bool)

(assert (=> b!1500408 m!1383601))

(declare-fun m!1383603 () Bool)

(assert (=> b!1500404 m!1383603))

(declare-fun m!1383605 () Bool)

(assert (=> start!127696 m!1383605))

(declare-fun m!1383607 () Bool)

(assert (=> start!127696 m!1383607))

(declare-fun m!1383609 () Bool)

(assert (=> b!1500405 m!1383609))

(declare-fun m!1383611 () Bool)

(assert (=> b!1500403 m!1383611))

(assert (=> b!1500409 m!1383599))

(assert (=> b!1500409 m!1383599))

(declare-fun m!1383613 () Bool)

(assert (=> b!1500409 m!1383613))

(declare-fun m!1383615 () Bool)

(assert (=> b!1500401 m!1383615))

(declare-fun m!1383617 () Bool)

(assert (=> b!1500401 m!1383617))

(declare-fun m!1383619 () Bool)

(assert (=> b!1500401 m!1383619))

(declare-fun m!1383621 () Bool)

(assert (=> b!1500410 m!1383621))

(assert (=> b!1500410 m!1383599))

(assert (=> b!1500407 m!1383599))

(assert (=> b!1500407 m!1383599))

(declare-fun m!1383623 () Bool)

(assert (=> b!1500407 m!1383623))

(push 1)

(assert (not b!1500409))

(assert (not b!1500408))

(assert (not b!1500407))

(assert (not b!1500405))

(assert (not start!127696))

(assert (not b!1500406))

(assert (not b!1500403))

(assert (not b!1500404))

(check-sat)

