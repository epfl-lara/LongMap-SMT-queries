; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127552 () Bool)

(assert start!127552)

(declare-fun res!1019556 () Bool)

(declare-fun e!839034 () Bool)

(assert (=> start!127552 (=> (not res!1019556) (not e!839034))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127552 (= res!1019556 (validMask!0 mask!2661))))

(assert (=> start!127552 e!839034))

(assert (=> start!127552 true))

(declare-datatypes ((array!99933 0))(
  ( (array!99934 (arr!48226 (Array (_ BitVec 32) (_ BitVec 64))) (size!48776 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99933)

(declare-fun array_inv!37254 (array!99933) Bool)

(assert (=> start!127552 (array_inv!37254 a!2850)))

(declare-fun b!1498478 () Bool)

(assert (=> b!1498478 (= e!839034 false)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12436 0))(
  ( (MissingZero!12436 (index!52136 (_ BitVec 32))) (Found!12436 (index!52137 (_ BitVec 32))) (Intermediate!12436 (undefined!13248 Bool) (index!52138 (_ BitVec 32)) (x!133830 (_ BitVec 32))) (Undefined!12436) (MissingVacant!12436 (index!52139 (_ BitVec 32))) )
))
(declare-fun lt!652651 () SeekEntryResult!12436)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99933 (_ BitVec 32)) SeekEntryResult!12436)

(assert (=> b!1498478 (= lt!652651 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48226 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1498479 () Bool)

(declare-fun res!1019560 () Bool)

(assert (=> b!1498479 (=> (not res!1019560) (not e!839034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498479 (= res!1019560 (validKeyInArray!0 (select (arr!48226 a!2850) j!87)))))

(declare-fun b!1498480 () Bool)

(declare-fun res!1019557 () Bool)

(assert (=> b!1498480 (=> (not res!1019557) (not e!839034))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498480 (= res!1019557 (and (= (size!48776 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48776 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48776 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498481 () Bool)

(declare-fun res!1019555 () Bool)

(assert (=> b!1498481 (=> (not res!1019555) (not e!839034))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498481 (= res!1019555 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48776 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48776 a!2850)) (= (select (arr!48226 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48226 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48776 a!2850))))))

(declare-fun b!1498482 () Bool)

(declare-fun res!1019554 () Bool)

(assert (=> b!1498482 (=> (not res!1019554) (not e!839034))))

(assert (=> b!1498482 (= res!1019554 (validKeyInArray!0 (select (arr!48226 a!2850) i!996)))))

(declare-fun b!1498483 () Bool)

(declare-fun res!1019558 () Bool)

(assert (=> b!1498483 (=> (not res!1019558) (not e!839034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99933 (_ BitVec 32)) Bool)

(assert (=> b!1498483 (= res!1019558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498484 () Bool)

(declare-fun res!1019559 () Bool)

(assert (=> b!1498484 (=> (not res!1019559) (not e!839034))))

(declare-datatypes ((List!34718 0))(
  ( (Nil!34715) (Cons!34714 (h!36111 (_ BitVec 64)) (t!49412 List!34718)) )
))
(declare-fun arrayNoDuplicates!0 (array!99933 (_ BitVec 32) List!34718) Bool)

(assert (=> b!1498484 (= res!1019559 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34715))))

(assert (= (and start!127552 res!1019556) b!1498480))

(assert (= (and b!1498480 res!1019557) b!1498482))

(assert (= (and b!1498482 res!1019554) b!1498479))

(assert (= (and b!1498479 res!1019560) b!1498483))

(assert (= (and b!1498483 res!1019558) b!1498484))

(assert (= (and b!1498484 res!1019559) b!1498481))

(assert (= (and b!1498481 res!1019555) b!1498478))

(declare-fun m!1381591 () Bool)

(assert (=> b!1498484 m!1381591))

(declare-fun m!1381593 () Bool)

(assert (=> b!1498483 m!1381593))

(declare-fun m!1381595 () Bool)

(assert (=> start!127552 m!1381595))

(declare-fun m!1381597 () Bool)

(assert (=> start!127552 m!1381597))

(declare-fun m!1381599 () Bool)

(assert (=> b!1498482 m!1381599))

(assert (=> b!1498482 m!1381599))

(declare-fun m!1381601 () Bool)

(assert (=> b!1498482 m!1381601))

(declare-fun m!1381603 () Bool)

(assert (=> b!1498479 m!1381603))

(assert (=> b!1498479 m!1381603))

(declare-fun m!1381605 () Bool)

(assert (=> b!1498479 m!1381605))

(assert (=> b!1498478 m!1381603))

(assert (=> b!1498478 m!1381603))

(declare-fun m!1381607 () Bool)

(assert (=> b!1498478 m!1381607))

(declare-fun m!1381609 () Bool)

(assert (=> b!1498481 m!1381609))

(declare-fun m!1381611 () Bool)

(assert (=> b!1498481 m!1381611))

(declare-fun m!1381613 () Bool)

(assert (=> b!1498481 m!1381613))

(push 1)

(assert (not b!1498482))

(assert (not b!1498484))

(assert (not b!1498478))

(assert (not start!127552))

(assert (not b!1498479))

