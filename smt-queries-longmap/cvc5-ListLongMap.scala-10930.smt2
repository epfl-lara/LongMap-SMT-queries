; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127878 () Bool)

(assert start!127878)

(declare-fun b!1502468 () Bool)

(declare-fun res!1023454 () Bool)

(declare-fun e!840318 () Bool)

(assert (=> b!1502468 (=> (not res!1023454) (not e!840318))))

(declare-datatypes ((array!100226 0))(
  ( (array!100227 (arr!48371 (Array (_ BitVec 32) (_ BitVec 64))) (size!48921 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100226)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502468 (= res!1023454 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48921 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48921 a!2850)) (= (select (arr!48371 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48371 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48921 a!2850))))))

(declare-fun b!1502469 () Bool)

(assert (=> b!1502469 (= e!840318 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12569 0))(
  ( (MissingZero!12569 (index!52668 (_ BitVec 32))) (Found!12569 (index!52669 (_ BitVec 32))) (Intermediate!12569 (undefined!13381 Bool) (index!52670 (_ BitVec 32)) (x!134358 (_ BitVec 32))) (Undefined!12569) (MissingVacant!12569 (index!52671 (_ BitVec 32))) )
))
(declare-fun lt!653383 () SeekEntryResult!12569)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100226 (_ BitVec 32)) SeekEntryResult!12569)

(assert (=> b!1502469 (= lt!653383 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48371 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502470 () Bool)

(declare-fun res!1023458 () Bool)

(assert (=> b!1502470 (=> (not res!1023458) (not e!840318))))

(assert (=> b!1502470 (= res!1023458 (and (= (size!48921 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48921 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48921 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502471 () Bool)

(declare-fun res!1023460 () Bool)

(assert (=> b!1502471 (=> (not res!1023460) (not e!840318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100226 (_ BitVec 32)) Bool)

(assert (=> b!1502471 (= res!1023460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502472 () Bool)

(declare-fun res!1023456 () Bool)

(assert (=> b!1502472 (=> (not res!1023456) (not e!840318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502472 (= res!1023456 (validKeyInArray!0 (select (arr!48371 a!2850) j!87)))))

(declare-fun res!1023457 () Bool)

(assert (=> start!127878 (=> (not res!1023457) (not e!840318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127878 (= res!1023457 (validMask!0 mask!2661))))

(assert (=> start!127878 e!840318))

(assert (=> start!127878 true))

(declare-fun array_inv!37399 (array!100226) Bool)

(assert (=> start!127878 (array_inv!37399 a!2850)))

(declare-fun b!1502473 () Bool)

(declare-fun res!1023455 () Bool)

(assert (=> b!1502473 (=> (not res!1023455) (not e!840318))))

(declare-datatypes ((List!34863 0))(
  ( (Nil!34860) (Cons!34859 (h!36256 (_ BitVec 64)) (t!49557 List!34863)) )
))
(declare-fun arrayNoDuplicates!0 (array!100226 (_ BitVec 32) List!34863) Bool)

(assert (=> b!1502473 (= res!1023455 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34860))))

(declare-fun b!1502474 () Bool)

(declare-fun res!1023459 () Bool)

(assert (=> b!1502474 (=> (not res!1023459) (not e!840318))))

(assert (=> b!1502474 (= res!1023459 (validKeyInArray!0 (select (arr!48371 a!2850) i!996)))))

(assert (= (and start!127878 res!1023457) b!1502470))

(assert (= (and b!1502470 res!1023458) b!1502474))

(assert (= (and b!1502474 res!1023459) b!1502472))

(assert (= (and b!1502472 res!1023456) b!1502471))

(assert (= (and b!1502471 res!1023460) b!1502473))

(assert (= (and b!1502473 res!1023455) b!1502468))

(assert (= (and b!1502468 res!1023454) b!1502469))

(declare-fun m!1385737 () Bool)

(assert (=> b!1502469 m!1385737))

(assert (=> b!1502469 m!1385737))

(declare-fun m!1385739 () Bool)

(assert (=> b!1502469 m!1385739))

(declare-fun m!1385741 () Bool)

(assert (=> b!1502473 m!1385741))

(declare-fun m!1385743 () Bool)

(assert (=> b!1502474 m!1385743))

(assert (=> b!1502474 m!1385743))

(declare-fun m!1385745 () Bool)

(assert (=> b!1502474 m!1385745))

(declare-fun m!1385747 () Bool)

(assert (=> b!1502471 m!1385747))

(declare-fun m!1385749 () Bool)

(assert (=> start!127878 m!1385749))

(declare-fun m!1385751 () Bool)

(assert (=> start!127878 m!1385751))

(declare-fun m!1385753 () Bool)

(assert (=> b!1502468 m!1385753))

(declare-fun m!1385755 () Bool)

(assert (=> b!1502468 m!1385755))

(declare-fun m!1385757 () Bool)

(assert (=> b!1502468 m!1385757))

(assert (=> b!1502472 m!1385737))

(assert (=> b!1502472 m!1385737))

(declare-fun m!1385759 () Bool)

(assert (=> b!1502472 m!1385759))

(push 1)

(assert (not b!1502471))

(assert (not b!1502469))

(assert (not b!1502474))

(assert (not b!1502472))

(assert (not b!1502473))

(assert (not start!127878))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

