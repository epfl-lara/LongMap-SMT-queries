; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127806 () Bool)

(assert start!127806)

(declare-fun b!1501946 () Bool)

(declare-fun res!1023025 () Bool)

(declare-fun e!840121 () Bool)

(assert (=> b!1501946 (=> (not res!1023025) (not e!840121))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100187 0))(
  ( (array!100188 (arr!48353 (Array (_ BitVec 32) (_ BitVec 64))) (size!48903 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100187)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501946 (= res!1023025 (and (= (size!48903 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48903 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48903 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501947 () Bool)

(declare-fun res!1023023 () Bool)

(assert (=> b!1501947 (=> (not res!1023023) (not e!840121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501947 (= res!1023023 (validKeyInArray!0 (select (arr!48353 a!2850) i!996)))))

(declare-fun b!1501948 () Bool)

(declare-fun res!1023028 () Bool)

(assert (=> b!1501948 (=> (not res!1023028) (not e!840121))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501948 (= res!1023028 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48903 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48903 a!2850)) (= (select (arr!48353 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48353 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48903 a!2850))))))

(declare-fun res!1023024 () Bool)

(assert (=> start!127806 (=> (not res!1023024) (not e!840121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127806 (= res!1023024 (validMask!0 mask!2661))))

(assert (=> start!127806 e!840121))

(assert (=> start!127806 true))

(declare-fun array_inv!37381 (array!100187) Bool)

(assert (=> start!127806 (array_inv!37381 a!2850)))

(declare-fun b!1501949 () Bool)

(assert (=> b!1501949 (= e!840121 false)))

(declare-datatypes ((SeekEntryResult!12551 0))(
  ( (MissingZero!12551 (index!52596 (_ BitVec 32))) (Found!12551 (index!52597 (_ BitVec 32))) (Intermediate!12551 (undefined!13363 Bool) (index!52598 (_ BitVec 32)) (x!134289 (_ BitVec 32))) (Undefined!12551) (MissingVacant!12551 (index!52599 (_ BitVec 32))) )
))
(declare-fun lt!653293 () SeekEntryResult!12551)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100187 (_ BitVec 32)) SeekEntryResult!12551)

(assert (=> b!1501949 (= lt!653293 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48353 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1501950 () Bool)

(declare-fun res!1023022 () Bool)

(assert (=> b!1501950 (=> (not res!1023022) (not e!840121))))

(declare-datatypes ((List!34845 0))(
  ( (Nil!34842) (Cons!34841 (h!36238 (_ BitVec 64)) (t!49539 List!34845)) )
))
(declare-fun arrayNoDuplicates!0 (array!100187 (_ BitVec 32) List!34845) Bool)

(assert (=> b!1501950 (= res!1023022 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34842))))

(declare-fun b!1501951 () Bool)

(declare-fun res!1023026 () Bool)

(assert (=> b!1501951 (=> (not res!1023026) (not e!840121))))

(assert (=> b!1501951 (= res!1023026 (validKeyInArray!0 (select (arr!48353 a!2850) j!87)))))

(declare-fun b!1501952 () Bool)

(declare-fun res!1023027 () Bool)

(assert (=> b!1501952 (=> (not res!1023027) (not e!840121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100187 (_ BitVec 32)) Bool)

(assert (=> b!1501952 (= res!1023027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127806 res!1023024) b!1501946))

(assert (= (and b!1501946 res!1023025) b!1501947))

(assert (= (and b!1501947 res!1023023) b!1501951))

(assert (= (and b!1501951 res!1023026) b!1501952))

(assert (= (and b!1501952 res!1023027) b!1501950))

(assert (= (and b!1501950 res!1023022) b!1501948))

(assert (= (and b!1501948 res!1023028) b!1501949))

(declare-fun m!1385227 () Bool)

(assert (=> b!1501950 m!1385227))

(declare-fun m!1385229 () Bool)

(assert (=> b!1501951 m!1385229))

(assert (=> b!1501951 m!1385229))

(declare-fun m!1385231 () Bool)

(assert (=> b!1501951 m!1385231))

(declare-fun m!1385233 () Bool)

(assert (=> b!1501952 m!1385233))

(declare-fun m!1385235 () Bool)

(assert (=> b!1501947 m!1385235))

(assert (=> b!1501947 m!1385235))

(declare-fun m!1385237 () Bool)

(assert (=> b!1501947 m!1385237))

(declare-fun m!1385239 () Bool)

(assert (=> b!1501948 m!1385239))

(declare-fun m!1385241 () Bool)

(assert (=> b!1501948 m!1385241))

(declare-fun m!1385243 () Bool)

(assert (=> b!1501948 m!1385243))

(declare-fun m!1385245 () Bool)

(assert (=> start!127806 m!1385245))

(declare-fun m!1385247 () Bool)

(assert (=> start!127806 m!1385247))

(assert (=> b!1501949 m!1385229))

(assert (=> b!1501949 m!1385229))

(declare-fun m!1385249 () Bool)

(assert (=> b!1501949 m!1385249))

(push 1)

(assert (not start!127806))

(assert (not b!1501949))

(assert (not b!1501952))

(assert (not b!1501950))

(assert (not b!1501951))

(assert (not b!1501947))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

