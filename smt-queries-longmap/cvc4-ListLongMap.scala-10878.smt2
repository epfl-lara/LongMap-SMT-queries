; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127534 () Bool)

(assert start!127534)

(declare-fun b!1498326 () Bool)

(declare-fun res!1019403 () Bool)

(declare-fun e!838980 () Bool)

(assert (=> b!1498326 (=> (not res!1019403) (not e!838980))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99915 0))(
  ( (array!99916 (arr!48217 (Array (_ BitVec 32) (_ BitVec 64))) (size!48767 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99915)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498326 (= res!1019403 (and (= (size!48767 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48767 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48767 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498327 () Bool)

(declare-fun res!1019402 () Bool)

(assert (=> b!1498327 (=> (not res!1019402) (not e!838980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99915 (_ BitVec 32)) Bool)

(assert (=> b!1498327 (= res!1019402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1019405 () Bool)

(assert (=> start!127534 (=> (not res!1019405) (not e!838980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127534 (= res!1019405 (validMask!0 mask!2661))))

(assert (=> start!127534 e!838980))

(assert (=> start!127534 true))

(declare-fun array_inv!37245 (array!99915) Bool)

(assert (=> start!127534 (array_inv!37245 a!2850)))

(declare-fun b!1498328 () Bool)

(declare-fun res!1019404 () Bool)

(assert (=> b!1498328 (=> (not res!1019404) (not e!838980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498328 (= res!1019404 (validKeyInArray!0 (select (arr!48217 a!2850) i!996)))))

(declare-fun b!1498329 () Bool)

(declare-fun res!1019406 () Bool)

(assert (=> b!1498329 (=> (not res!1019406) (not e!838980))))

(assert (=> b!1498329 (= res!1019406 (validKeyInArray!0 (select (arr!48217 a!2850) j!87)))))

(declare-fun b!1498330 () Bool)

(declare-fun res!1019407 () Bool)

(assert (=> b!1498330 (=> (not res!1019407) (not e!838980))))

(declare-datatypes ((List!34709 0))(
  ( (Nil!34706) (Cons!34705 (h!36102 (_ BitVec 64)) (t!49403 List!34709)) )
))
(declare-fun arrayNoDuplicates!0 (array!99915 (_ BitVec 32) List!34709) Bool)

(assert (=> b!1498330 (= res!1019407 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34706))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun b!1498331 () Bool)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498331 (= e!838980 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48767 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48767 a!2850)) (= (select (arr!48217 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48217 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48767 a!2850)) (bvsge mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge vacantBefore!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(assert (= (and start!127534 res!1019405) b!1498326))

(assert (= (and b!1498326 res!1019403) b!1498328))

(assert (= (and b!1498328 res!1019404) b!1498329))

(assert (= (and b!1498329 res!1019406) b!1498327))

(assert (= (and b!1498327 res!1019402) b!1498330))

(assert (= (and b!1498330 res!1019407) b!1498331))

(declare-fun m!1381425 () Bool)

(assert (=> b!1498328 m!1381425))

(assert (=> b!1498328 m!1381425))

(declare-fun m!1381427 () Bool)

(assert (=> b!1498328 m!1381427))

(declare-fun m!1381429 () Bool)

(assert (=> b!1498327 m!1381429))

(declare-fun m!1381431 () Bool)

(assert (=> start!127534 m!1381431))

(declare-fun m!1381433 () Bool)

(assert (=> start!127534 m!1381433))

(declare-fun m!1381435 () Bool)

(assert (=> b!1498331 m!1381435))

(declare-fun m!1381437 () Bool)

(assert (=> b!1498331 m!1381437))

(declare-fun m!1381439 () Bool)

(assert (=> b!1498331 m!1381439))

(declare-fun m!1381441 () Bool)

(assert (=> b!1498330 m!1381441))

(declare-fun m!1381443 () Bool)

(assert (=> b!1498329 m!1381443))

(assert (=> b!1498329 m!1381443))

(declare-fun m!1381445 () Bool)

(assert (=> b!1498329 m!1381445))

(push 1)

(assert (not b!1498329))

(assert (not b!1498327))

(assert (not b!1498328))

(assert (not start!127534))

(assert (not b!1498330))

(check-sat)

(pop 1)

(push 1)

(check-sat)

