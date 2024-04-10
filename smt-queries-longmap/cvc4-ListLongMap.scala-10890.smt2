; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127606 () Bool)

(assert start!127606)

(declare-fun res!1020175 () Bool)

(declare-fun e!839197 () Bool)

(assert (=> start!127606 (=> (not res!1020175) (not e!839197))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127606 (= res!1020175 (validMask!0 mask!2661))))

(assert (=> start!127606 e!839197))

(assert (=> start!127606 true))

(declare-datatypes ((array!99987 0))(
  ( (array!99988 (arr!48253 (Array (_ BitVec 32) (_ BitVec 64))) (size!48803 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99987)

(declare-fun array_inv!37281 (array!99987) Bool)

(assert (=> start!127606 (array_inv!37281 a!2850)))

(declare-fun b!1499098 () Bool)

(declare-fun res!1020177 () Bool)

(assert (=> b!1499098 (=> (not res!1020177) (not e!839197))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499098 (= res!1020177 (validKeyInArray!0 (select (arr!48253 a!2850) i!996)))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun b!1499099 () Bool)

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499099 (= e!839197 (and (not (= (select (arr!48253 a!2850) index!625) (select (arr!48253 a!2850) j!87))) (bvslt mask!2661 #b00000000000000000000000000000000)))))

(declare-fun b!1499100 () Bool)

(declare-fun res!1020180 () Bool)

(assert (=> b!1499100 (=> (not res!1020180) (not e!839197))))

(declare-datatypes ((List!34745 0))(
  ( (Nil!34742) (Cons!34741 (h!36138 (_ BitVec 64)) (t!49439 List!34745)) )
))
(declare-fun arrayNoDuplicates!0 (array!99987 (_ BitVec 32) List!34745) Bool)

(assert (=> b!1499100 (= res!1020180 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34742))))

(declare-fun b!1499101 () Bool)

(declare-fun res!1020181 () Bool)

(assert (=> b!1499101 (=> (not res!1020181) (not e!839197))))

(assert (=> b!1499101 (= res!1020181 (and (= (size!48803 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48803 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48803 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499102 () Bool)

(declare-fun res!1020176 () Bool)

(assert (=> b!1499102 (=> (not res!1020176) (not e!839197))))

(assert (=> b!1499102 (= res!1020176 (validKeyInArray!0 (select (arr!48253 a!2850) j!87)))))

(declare-fun b!1499103 () Bool)

(declare-fun res!1020174 () Bool)

(assert (=> b!1499103 (=> (not res!1020174) (not e!839197))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499103 (= res!1020174 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48803 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48803 a!2850)) (= (select (arr!48253 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48253 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48803 a!2850))))))

(declare-fun b!1499104 () Bool)

(declare-fun res!1020178 () Bool)

(assert (=> b!1499104 (=> (not res!1020178) (not e!839197))))

(declare-datatypes ((SeekEntryResult!12463 0))(
  ( (MissingZero!12463 (index!52244 (_ BitVec 32))) (Found!12463 (index!52245 (_ BitVec 32))) (Intermediate!12463 (undefined!13275 Bool) (index!52246 (_ BitVec 32)) (x!133929 (_ BitVec 32))) (Undefined!12463) (MissingVacant!12463 (index!52247 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99987 (_ BitVec 32)) SeekEntryResult!12463)

(assert (=> b!1499104 (= res!1020178 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48253 a!2850) j!87) a!2850 mask!2661) (Found!12463 j!87)))))

(declare-fun b!1499105 () Bool)

(declare-fun res!1020179 () Bool)

(assert (=> b!1499105 (=> (not res!1020179) (not e!839197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99987 (_ BitVec 32)) Bool)

(assert (=> b!1499105 (= res!1020179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127606 res!1020175) b!1499101))

(assert (= (and b!1499101 res!1020181) b!1499098))

(assert (= (and b!1499098 res!1020177) b!1499102))

(assert (= (and b!1499102 res!1020176) b!1499105))

(assert (= (and b!1499105 res!1020179) b!1499100))

(assert (= (and b!1499100 res!1020180) b!1499103))

(assert (= (and b!1499103 res!1020174) b!1499104))

(assert (= (and b!1499104 res!1020178) b!1499099))

(declare-fun m!1382279 () Bool)

(assert (=> b!1499100 m!1382279))

(declare-fun m!1382281 () Bool)

(assert (=> b!1499103 m!1382281))

(declare-fun m!1382283 () Bool)

(assert (=> b!1499103 m!1382283))

(declare-fun m!1382285 () Bool)

(assert (=> b!1499103 m!1382285))

(declare-fun m!1382287 () Bool)

(assert (=> b!1499098 m!1382287))

(assert (=> b!1499098 m!1382287))

(declare-fun m!1382289 () Bool)

(assert (=> b!1499098 m!1382289))

(declare-fun m!1382291 () Bool)

(assert (=> b!1499104 m!1382291))

(assert (=> b!1499104 m!1382291))

(declare-fun m!1382293 () Bool)

(assert (=> b!1499104 m!1382293))

(assert (=> b!1499102 m!1382291))

(assert (=> b!1499102 m!1382291))

(declare-fun m!1382295 () Bool)

(assert (=> b!1499102 m!1382295))

(declare-fun m!1382297 () Bool)

(assert (=> b!1499099 m!1382297))

(assert (=> b!1499099 m!1382291))

(declare-fun m!1382299 () Bool)

(assert (=> start!127606 m!1382299))

(declare-fun m!1382301 () Bool)

(assert (=> start!127606 m!1382301))

(declare-fun m!1382303 () Bool)

(assert (=> b!1499105 m!1382303))

(push 1)

(assert (not b!1499105))

(assert (not start!127606))

(assert (not b!1499102))

(assert (not b!1499098))

(assert (not b!1499100))

(assert (not b!1499104))

(check-sat)

(pop 1)

(push 1)

(check-sat)

