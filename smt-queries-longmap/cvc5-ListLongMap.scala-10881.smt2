; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127820 () Bool)

(assert start!127820)

(declare-fun b!1500184 () Bool)

(declare-fun res!1020161 () Bool)

(declare-fun e!840092 () Bool)

(assert (=> b!1500184 (=> (not res!1020161) (not e!840092))))

(declare-datatypes ((array!100046 0))(
  ( (array!100047 (arr!48279 (Array (_ BitVec 32) (_ BitVec 64))) (size!48830 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100046)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500184 (= res!1020161 (validKeyInArray!0 (select (arr!48279 a!2850) j!87)))))

(declare-fun b!1500185 () Bool)

(assert (=> b!1500185 (= e!840092 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12382 0))(
  ( (MissingZero!12382 (index!51920 (_ BitVec 32))) (Found!12382 (index!51921 (_ BitVec 32))) (Intermediate!12382 (undefined!13194 Bool) (index!51922 (_ BitVec 32)) (x!133810 (_ BitVec 32))) (Undefined!12382) (MissingVacant!12382 (index!51923 (_ BitVec 32))) )
))
(declare-fun lt!653289 () SeekEntryResult!12382)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100046 (_ BitVec 32)) SeekEntryResult!12382)

(assert (=> b!1500185 (= lt!653289 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48279 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500186 () Bool)

(declare-fun res!1020163 () Bool)

(assert (=> b!1500186 (=> (not res!1020163) (not e!840092))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1500186 (= res!1020163 (validKeyInArray!0 (select (arr!48279 a!2850) i!996)))))

(declare-fun b!1500187 () Bool)

(declare-fun res!1020162 () Bool)

(assert (=> b!1500187 (=> (not res!1020162) (not e!840092))))

(assert (=> b!1500187 (= res!1020162 (and (= (size!48830 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48830 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48830 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500188 () Bool)

(declare-fun res!1020164 () Bool)

(assert (=> b!1500188 (=> (not res!1020164) (not e!840092))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500188 (= res!1020164 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48830 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48830 a!2850)) (= (select (arr!48279 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48279 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48830 a!2850))))))

(declare-fun b!1500190 () Bool)

(declare-fun res!1020165 () Bool)

(assert (=> b!1500190 (=> (not res!1020165) (not e!840092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100046 (_ BitVec 32)) Bool)

(assert (=> b!1500190 (= res!1020165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500189 () Bool)

(declare-fun res!1020167 () Bool)

(assert (=> b!1500189 (=> (not res!1020167) (not e!840092))))

(declare-datatypes ((List!34758 0))(
  ( (Nil!34755) (Cons!34754 (h!36166 (_ BitVec 64)) (t!49444 List!34758)) )
))
(declare-fun arrayNoDuplicates!0 (array!100046 (_ BitVec 32) List!34758) Bool)

(assert (=> b!1500189 (= res!1020167 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34755))))

(declare-fun res!1020166 () Bool)

(assert (=> start!127820 (=> (not res!1020166) (not e!840092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127820 (= res!1020166 (validMask!0 mask!2661))))

(assert (=> start!127820 e!840092))

(assert (=> start!127820 true))

(declare-fun array_inv!37560 (array!100046) Bool)

(assert (=> start!127820 (array_inv!37560 a!2850)))

(assert (= (and start!127820 res!1020166) b!1500187))

(assert (= (and b!1500187 res!1020162) b!1500186))

(assert (= (and b!1500186 res!1020163) b!1500184))

(assert (= (and b!1500184 res!1020161) b!1500190))

(assert (= (and b!1500190 res!1020165) b!1500189))

(assert (= (and b!1500189 res!1020167) b!1500188))

(assert (= (and b!1500188 res!1020164) b!1500185))

(declare-fun m!1383317 () Bool)

(assert (=> b!1500190 m!1383317))

(declare-fun m!1383319 () Bool)

(assert (=> start!127820 m!1383319))

(declare-fun m!1383321 () Bool)

(assert (=> start!127820 m!1383321))

(declare-fun m!1383323 () Bool)

(assert (=> b!1500188 m!1383323))

(declare-fun m!1383325 () Bool)

(assert (=> b!1500188 m!1383325))

(declare-fun m!1383327 () Bool)

(assert (=> b!1500188 m!1383327))

(declare-fun m!1383329 () Bool)

(assert (=> b!1500185 m!1383329))

(assert (=> b!1500185 m!1383329))

(declare-fun m!1383331 () Bool)

(assert (=> b!1500185 m!1383331))

(declare-fun m!1383333 () Bool)

(assert (=> b!1500186 m!1383333))

(assert (=> b!1500186 m!1383333))

(declare-fun m!1383335 () Bool)

(assert (=> b!1500186 m!1383335))

(declare-fun m!1383337 () Bool)

(assert (=> b!1500189 m!1383337))

(assert (=> b!1500184 m!1383329))

(assert (=> b!1500184 m!1383329))

(declare-fun m!1383339 () Bool)

(assert (=> b!1500184 m!1383339))

(push 1)

(assert (not start!127820))

(assert (not b!1500184))

(assert (not b!1500186))

(assert (not b!1500185))

(assert (not b!1500189))

(assert (not b!1500190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

