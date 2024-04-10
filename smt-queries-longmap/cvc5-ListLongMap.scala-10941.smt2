; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127980 () Bool)

(assert start!127980)

(declare-fun b!1503498 () Bool)

(declare-fun e!840624 () Bool)

(assert (=> b!1503498 (= e!840624 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun lt!653533 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503498 (= lt!653533 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503499 () Bool)

(declare-fun res!1024377 () Bool)

(assert (=> b!1503499 (=> (not res!1024377) (not e!840624))))

(declare-datatypes ((array!100295 0))(
  ( (array!100296 (arr!48404 (Array (_ BitVec 32) (_ BitVec 64))) (size!48954 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100295)

(declare-datatypes ((List!34896 0))(
  ( (Nil!34893) (Cons!34892 (h!36289 (_ BitVec 64)) (t!49590 List!34896)) )
))
(declare-fun arrayNoDuplicates!0 (array!100295 (_ BitVec 32) List!34896) Bool)

(assert (=> b!1503499 (= res!1024377 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34893))))

(declare-fun b!1503500 () Bool)

(declare-fun res!1024383 () Bool)

(assert (=> b!1503500 (=> (not res!1024383) (not e!840624))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503500 (= res!1024383 (and (= (size!48954 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48954 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48954 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503501 () Bool)

(declare-fun res!1024378 () Bool)

(assert (=> b!1503501 (=> (not res!1024378) (not e!840624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503501 (= res!1024378 (validKeyInArray!0 (select (arr!48404 a!2850) j!87)))))

(declare-fun res!1024382 () Bool)

(assert (=> start!127980 (=> (not res!1024382) (not e!840624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127980 (= res!1024382 (validMask!0 mask!2661))))

(assert (=> start!127980 e!840624))

(assert (=> start!127980 true))

(declare-fun array_inv!37432 (array!100295) Bool)

(assert (=> start!127980 (array_inv!37432 a!2850)))

(declare-fun b!1503502 () Bool)

(declare-fun res!1024381 () Bool)

(assert (=> b!1503502 (=> (not res!1024381) (not e!840624))))

(assert (=> b!1503502 (= res!1024381 (not (= (select (arr!48404 a!2850) index!625) (select (arr!48404 a!2850) j!87))))))

(declare-fun b!1503503 () Bool)

(declare-fun res!1024380 () Bool)

(assert (=> b!1503503 (=> (not res!1024380) (not e!840624))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503503 (= res!1024380 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48954 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48954 a!2850)) (= (select (arr!48404 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48404 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48954 a!2850))))))

(declare-fun b!1503504 () Bool)

(declare-fun res!1024376 () Bool)

(assert (=> b!1503504 (=> (not res!1024376) (not e!840624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100295 (_ BitVec 32)) Bool)

(assert (=> b!1503504 (= res!1024376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503505 () Bool)

(declare-fun res!1024384 () Bool)

(assert (=> b!1503505 (=> (not res!1024384) (not e!840624))))

(assert (=> b!1503505 (= res!1024384 (validKeyInArray!0 (select (arr!48404 a!2850) i!996)))))

(declare-fun b!1503506 () Bool)

(declare-fun res!1024379 () Bool)

(assert (=> b!1503506 (=> (not res!1024379) (not e!840624))))

(declare-datatypes ((SeekEntryResult!12602 0))(
  ( (MissingZero!12602 (index!52800 (_ BitVec 32))) (Found!12602 (index!52801 (_ BitVec 32))) (Intermediate!12602 (undefined!13414 Bool) (index!52802 (_ BitVec 32)) (x!134482 (_ BitVec 32))) (Undefined!12602) (MissingVacant!12602 (index!52803 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100295 (_ BitVec 32)) SeekEntryResult!12602)

(assert (=> b!1503506 (= res!1024379 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48404 a!2850) j!87) a!2850 mask!2661) (Found!12602 j!87)))))

(assert (= (and start!127980 res!1024382) b!1503500))

(assert (= (and b!1503500 res!1024383) b!1503505))

(assert (= (and b!1503505 res!1024384) b!1503501))

(assert (= (and b!1503501 res!1024378) b!1503504))

(assert (= (and b!1503504 res!1024376) b!1503499))

(assert (= (and b!1503499 res!1024377) b!1503503))

(assert (= (and b!1503503 res!1024380) b!1503506))

(assert (= (and b!1503506 res!1024379) b!1503502))

(assert (= (and b!1503502 res!1024381) b!1503498))

(declare-fun m!1386751 () Bool)

(assert (=> b!1503505 m!1386751))

(assert (=> b!1503505 m!1386751))

(declare-fun m!1386753 () Bool)

(assert (=> b!1503505 m!1386753))

(declare-fun m!1386755 () Bool)

(assert (=> b!1503504 m!1386755))

(declare-fun m!1386757 () Bool)

(assert (=> b!1503501 m!1386757))

(assert (=> b!1503501 m!1386757))

(declare-fun m!1386759 () Bool)

(assert (=> b!1503501 m!1386759))

(declare-fun m!1386761 () Bool)

(assert (=> b!1503499 m!1386761))

(assert (=> b!1503506 m!1386757))

(assert (=> b!1503506 m!1386757))

(declare-fun m!1386763 () Bool)

(assert (=> b!1503506 m!1386763))

(declare-fun m!1386765 () Bool)

(assert (=> b!1503502 m!1386765))

(assert (=> b!1503502 m!1386757))

(declare-fun m!1386767 () Bool)

(assert (=> start!127980 m!1386767))

(declare-fun m!1386769 () Bool)

(assert (=> start!127980 m!1386769))

(declare-fun m!1386771 () Bool)

(assert (=> b!1503503 m!1386771))

(declare-fun m!1386773 () Bool)

(assert (=> b!1503503 m!1386773))

(declare-fun m!1386775 () Bool)

(assert (=> b!1503503 m!1386775))

(declare-fun m!1386777 () Bool)

(assert (=> b!1503498 m!1386777))

(push 1)

(assert (not b!1503501))

(assert (not b!1503505))

(assert (not start!127980))

(assert (not b!1503499))

(assert (not b!1503498))

(assert (not b!1503504))

(assert (not b!1503506))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

