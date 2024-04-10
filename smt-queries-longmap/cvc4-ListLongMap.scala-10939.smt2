; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127972 () Bool)

(assert start!127972)

(declare-fun b!1503390 () Bool)

(declare-fun res!1024270 () Bool)

(declare-fun e!840601 () Bool)

(assert (=> b!1503390 (=> (not res!1024270) (not e!840601))))

(declare-datatypes ((array!100287 0))(
  ( (array!100288 (arr!48400 (Array (_ BitVec 32) (_ BitVec 64))) (size!48950 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100287)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100287 (_ BitVec 32)) Bool)

(assert (=> b!1503390 (= res!1024270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503391 () Bool)

(declare-fun res!1024276 () Bool)

(assert (=> b!1503391 (=> (not res!1024276) (not e!840601))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503391 (= res!1024276 (not (= (select (arr!48400 a!2850) index!625) (select (arr!48400 a!2850) j!87))))))

(declare-fun res!1024275 () Bool)

(assert (=> start!127972 (=> (not res!1024275) (not e!840601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127972 (= res!1024275 (validMask!0 mask!2661))))

(assert (=> start!127972 e!840601))

(assert (=> start!127972 true))

(declare-fun array_inv!37428 (array!100287) Bool)

(assert (=> start!127972 (array_inv!37428 a!2850)))

(declare-fun b!1503392 () Bool)

(declare-fun res!1024272 () Bool)

(assert (=> b!1503392 (=> (not res!1024272) (not e!840601))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1503392 (= res!1024272 (and (= (size!48950 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48950 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48950 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503393 () Bool)

(assert (=> b!1503393 (= e!840601 false)))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653521 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503393 (= lt!653521 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503394 () Bool)

(declare-fun res!1024269 () Bool)

(assert (=> b!1503394 (=> (not res!1024269) (not e!840601))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503394 (= res!1024269 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48950 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48950 a!2850)) (= (select (arr!48400 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48400 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48950 a!2850))))))

(declare-fun b!1503395 () Bool)

(declare-fun res!1024268 () Bool)

(assert (=> b!1503395 (=> (not res!1024268) (not e!840601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503395 (= res!1024268 (validKeyInArray!0 (select (arr!48400 a!2850) j!87)))))

(declare-fun b!1503396 () Bool)

(declare-fun res!1024274 () Bool)

(assert (=> b!1503396 (=> (not res!1024274) (not e!840601))))

(declare-datatypes ((List!34892 0))(
  ( (Nil!34889) (Cons!34888 (h!36285 (_ BitVec 64)) (t!49586 List!34892)) )
))
(declare-fun arrayNoDuplicates!0 (array!100287 (_ BitVec 32) List!34892) Bool)

(assert (=> b!1503396 (= res!1024274 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34889))))

(declare-fun b!1503397 () Bool)

(declare-fun res!1024273 () Bool)

(assert (=> b!1503397 (=> (not res!1024273) (not e!840601))))

(declare-datatypes ((SeekEntryResult!12598 0))(
  ( (MissingZero!12598 (index!52784 (_ BitVec 32))) (Found!12598 (index!52785 (_ BitVec 32))) (Intermediate!12598 (undefined!13410 Bool) (index!52786 (_ BitVec 32)) (x!134462 (_ BitVec 32))) (Undefined!12598) (MissingVacant!12598 (index!52787 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100287 (_ BitVec 32)) SeekEntryResult!12598)

(assert (=> b!1503397 (= res!1024273 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48400 a!2850) j!87) a!2850 mask!2661) (Found!12598 j!87)))))

(declare-fun b!1503398 () Bool)

(declare-fun res!1024271 () Bool)

(assert (=> b!1503398 (=> (not res!1024271) (not e!840601))))

(assert (=> b!1503398 (= res!1024271 (validKeyInArray!0 (select (arr!48400 a!2850) i!996)))))

(assert (= (and start!127972 res!1024275) b!1503392))

(assert (= (and b!1503392 res!1024272) b!1503398))

(assert (= (and b!1503398 res!1024271) b!1503395))

(assert (= (and b!1503395 res!1024268) b!1503390))

(assert (= (and b!1503390 res!1024270) b!1503396))

(assert (= (and b!1503396 res!1024274) b!1503394))

(assert (= (and b!1503394 res!1024269) b!1503397))

(assert (= (and b!1503397 res!1024273) b!1503391))

(assert (= (and b!1503391 res!1024276) b!1503393))

(declare-fun m!1386639 () Bool)

(assert (=> b!1503393 m!1386639))

(declare-fun m!1386641 () Bool)

(assert (=> b!1503390 m!1386641))

(declare-fun m!1386643 () Bool)

(assert (=> b!1503395 m!1386643))

(assert (=> b!1503395 m!1386643))

(declare-fun m!1386645 () Bool)

(assert (=> b!1503395 m!1386645))

(declare-fun m!1386647 () Bool)

(assert (=> b!1503391 m!1386647))

(assert (=> b!1503391 m!1386643))

(declare-fun m!1386649 () Bool)

(assert (=> b!1503398 m!1386649))

(assert (=> b!1503398 m!1386649))

(declare-fun m!1386651 () Bool)

(assert (=> b!1503398 m!1386651))

(declare-fun m!1386653 () Bool)

(assert (=> start!127972 m!1386653))

(declare-fun m!1386655 () Bool)

(assert (=> start!127972 m!1386655))

(assert (=> b!1503397 m!1386643))

(assert (=> b!1503397 m!1386643))

(declare-fun m!1386657 () Bool)

(assert (=> b!1503397 m!1386657))

(declare-fun m!1386659 () Bool)

(assert (=> b!1503394 m!1386659))

(declare-fun m!1386661 () Bool)

(assert (=> b!1503394 m!1386661))

(declare-fun m!1386663 () Bool)

(assert (=> b!1503394 m!1386663))

(declare-fun m!1386665 () Bool)

(assert (=> b!1503396 m!1386665))

(push 1)

(assert (not b!1503393))

(assert (not b!1503395))

(assert (not b!1503396))

(assert (not b!1503398))

(assert (not b!1503390))

(assert (not start!127972))

(assert (not b!1503397))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

