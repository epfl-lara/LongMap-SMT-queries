; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127516 () Bool)

(assert start!127516)

(declare-fun b!1498276 () Bool)

(declare-fun res!1019541 () Bool)

(declare-fun e!838865 () Bool)

(assert (=> b!1498276 (=> (not res!1019541) (not e!838865))))

(declare-datatypes ((array!99891 0))(
  ( (array!99892 (arr!48206 (Array (_ BitVec 32) (_ BitVec 64))) (size!48758 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99891)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99891 (_ BitVec 32)) Bool)

(assert (=> b!1498276 (= res!1019541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498277 () Bool)

(declare-fun res!1019543 () Bool)

(assert (=> b!1498277 (=> (not res!1019543) (not e!838865))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498277 (= res!1019543 (and (= (size!48758 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48758 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48758 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1019542 () Bool)

(assert (=> start!127516 (=> (not res!1019542) (not e!838865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127516 (= res!1019542 (validMask!0 mask!2661))))

(assert (=> start!127516 e!838865))

(assert (=> start!127516 true))

(declare-fun array_inv!37439 (array!99891) Bool)

(assert (=> start!127516 (array_inv!37439 a!2850)))

(declare-fun b!1498278 () Bool)

(declare-fun res!1019546 () Bool)

(assert (=> b!1498278 (=> (not res!1019546) (not e!838865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498278 (= res!1019546 (validKeyInArray!0 (select (arr!48206 a!2850) j!87)))))

(declare-fun b!1498279 () Bool)

(declare-fun res!1019540 () Bool)

(assert (=> b!1498279 (=> (not res!1019540) (not e!838865))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498279 (= res!1019540 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48758 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48758 a!2850)) (= (select (arr!48206 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48206 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48758 a!2850))))))

(declare-fun b!1498280 () Bool)

(declare-fun res!1019544 () Bool)

(assert (=> b!1498280 (=> (not res!1019544) (not e!838865))))

(assert (=> b!1498280 (= res!1019544 (validKeyInArray!0 (select (arr!48206 a!2850) i!996)))))

(declare-fun b!1498281 () Bool)

(declare-fun res!1019545 () Bool)

(assert (=> b!1498281 (=> (not res!1019545) (not e!838865))))

(declare-datatypes ((List!34776 0))(
  ( (Nil!34773) (Cons!34772 (h!36170 (_ BitVec 64)) (t!49462 List!34776)) )
))
(declare-fun arrayNoDuplicates!0 (array!99891 (_ BitVec 32) List!34776) Bool)

(assert (=> b!1498281 (= res!1019545 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34773))))

(declare-fun b!1498282 () Bool)

(assert (=> b!1498282 (= e!838865 false)))

(declare-datatypes ((SeekEntryResult!12437 0))(
  ( (MissingZero!12437 (index!52140 (_ BitVec 32))) (Found!12437 (index!52141 (_ BitVec 32))) (Intermediate!12437 (undefined!13249 Bool) (index!52142 (_ BitVec 32)) (x!133842 (_ BitVec 32))) (Undefined!12437) (MissingVacant!12437 (index!52143 (_ BitVec 32))) )
))
(declare-fun lt!652378 () SeekEntryResult!12437)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99891 (_ BitVec 32)) SeekEntryResult!12437)

(assert (=> b!1498282 (= lt!652378 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48206 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127516 res!1019542) b!1498277))

(assert (= (and b!1498277 res!1019543) b!1498280))

(assert (= (and b!1498280 res!1019544) b!1498278))

(assert (= (and b!1498278 res!1019546) b!1498276))

(assert (= (and b!1498276 res!1019541) b!1498281))

(assert (= (and b!1498281 res!1019545) b!1498279))

(assert (= (and b!1498279 res!1019540) b!1498282))

(declare-fun m!1380847 () Bool)

(assert (=> b!1498278 m!1380847))

(assert (=> b!1498278 m!1380847))

(declare-fun m!1380849 () Bool)

(assert (=> b!1498278 m!1380849))

(declare-fun m!1380851 () Bool)

(assert (=> b!1498279 m!1380851))

(declare-fun m!1380853 () Bool)

(assert (=> b!1498279 m!1380853))

(declare-fun m!1380855 () Bool)

(assert (=> b!1498279 m!1380855))

(declare-fun m!1380857 () Bool)

(assert (=> start!127516 m!1380857))

(declare-fun m!1380859 () Bool)

(assert (=> start!127516 m!1380859))

(declare-fun m!1380861 () Bool)

(assert (=> b!1498280 m!1380861))

(assert (=> b!1498280 m!1380861))

(declare-fun m!1380863 () Bool)

(assert (=> b!1498280 m!1380863))

(assert (=> b!1498282 m!1380847))

(assert (=> b!1498282 m!1380847))

(declare-fun m!1380865 () Bool)

(assert (=> b!1498282 m!1380865))

(declare-fun m!1380867 () Bool)

(assert (=> b!1498276 m!1380867))

(declare-fun m!1380869 () Bool)

(assert (=> b!1498281 m!1380869))

(push 1)

(assert (not b!1498280))

(assert (not b!1498276))

(assert (not b!1498282))

(assert (not start!127516))

(assert (not b!1498278))

(assert (not b!1498281))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

