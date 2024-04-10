; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127602 () Bool)

(assert start!127602)

(declare-fun b!1499050 () Bool)

(declare-fun res!1020130 () Bool)

(declare-fun e!839185 () Bool)

(assert (=> b!1499050 (=> (not res!1020130) (not e!839185))))

(declare-datatypes ((array!99983 0))(
  ( (array!99984 (arr!48251 (Array (_ BitVec 32) (_ BitVec 64))) (size!48801 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99983)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99983 (_ BitVec 32)) Bool)

(assert (=> b!1499050 (= res!1020130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499051 () Bool)

(declare-fun res!1020133 () Bool)

(assert (=> b!1499051 (=> (not res!1020133) (not e!839185))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499051 (= res!1020133 (validKeyInArray!0 (select (arr!48251 a!2850) j!87)))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun b!1499052 () Bool)

(assert (=> b!1499052 (= e!839185 (and (not (= (select (arr!48251 a!2850) index!625) (select (arr!48251 a!2850) j!87))) (bvslt mask!2661 #b00000000000000000000000000000000)))))

(declare-fun b!1499053 () Bool)

(declare-fun res!1020129 () Bool)

(assert (=> b!1499053 (=> (not res!1020129) (not e!839185))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1499053 (= res!1020129 (and (= (size!48801 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48801 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48801 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1020132 () Bool)

(assert (=> start!127602 (=> (not res!1020132) (not e!839185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127602 (= res!1020132 (validMask!0 mask!2661))))

(assert (=> start!127602 e!839185))

(assert (=> start!127602 true))

(declare-fun array_inv!37279 (array!99983) Bool)

(assert (=> start!127602 (array_inv!37279 a!2850)))

(declare-fun b!1499054 () Bool)

(declare-fun res!1020127 () Bool)

(assert (=> b!1499054 (=> (not res!1020127) (not e!839185))))

(declare-datatypes ((List!34743 0))(
  ( (Nil!34740) (Cons!34739 (h!36136 (_ BitVec 64)) (t!49437 List!34743)) )
))
(declare-fun arrayNoDuplicates!0 (array!99983 (_ BitVec 32) List!34743) Bool)

(assert (=> b!1499054 (= res!1020127 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34740))))

(declare-fun b!1499055 () Bool)

(declare-fun res!1020126 () Bool)

(assert (=> b!1499055 (=> (not res!1020126) (not e!839185))))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(assert (=> b!1499055 (= res!1020126 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48801 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48801 a!2850)) (= (select (arr!48251 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48251 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48801 a!2850))))))

(declare-fun b!1499056 () Bool)

(declare-fun res!1020131 () Bool)

(assert (=> b!1499056 (=> (not res!1020131) (not e!839185))))

(declare-datatypes ((SeekEntryResult!12461 0))(
  ( (MissingZero!12461 (index!52236 (_ BitVec 32))) (Found!12461 (index!52237 (_ BitVec 32))) (Intermediate!12461 (undefined!13273 Bool) (index!52238 (_ BitVec 32)) (x!133927 (_ BitVec 32))) (Undefined!12461) (MissingVacant!12461 (index!52239 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99983 (_ BitVec 32)) SeekEntryResult!12461)

(assert (=> b!1499056 (= res!1020131 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48251 a!2850) j!87) a!2850 mask!2661) (Found!12461 j!87)))))

(declare-fun b!1499057 () Bool)

(declare-fun res!1020128 () Bool)

(assert (=> b!1499057 (=> (not res!1020128) (not e!839185))))

(assert (=> b!1499057 (= res!1020128 (validKeyInArray!0 (select (arr!48251 a!2850) i!996)))))

(assert (= (and start!127602 res!1020132) b!1499053))

(assert (= (and b!1499053 res!1020129) b!1499057))

(assert (= (and b!1499057 res!1020128) b!1499051))

(assert (= (and b!1499051 res!1020133) b!1499050))

(assert (= (and b!1499050 res!1020130) b!1499054))

(assert (= (and b!1499054 res!1020127) b!1499055))

(assert (= (and b!1499055 res!1020126) b!1499056))

(assert (= (and b!1499056 res!1020131) b!1499052))

(declare-fun m!1382227 () Bool)

(assert (=> b!1499057 m!1382227))

(assert (=> b!1499057 m!1382227))

(declare-fun m!1382229 () Bool)

(assert (=> b!1499057 m!1382229))

(declare-fun m!1382231 () Bool)

(assert (=> b!1499054 m!1382231))

(declare-fun m!1382233 () Bool)

(assert (=> start!127602 m!1382233))

(declare-fun m!1382235 () Bool)

(assert (=> start!127602 m!1382235))

(declare-fun m!1382237 () Bool)

(assert (=> b!1499056 m!1382237))

(assert (=> b!1499056 m!1382237))

(declare-fun m!1382239 () Bool)

(assert (=> b!1499056 m!1382239))

(assert (=> b!1499051 m!1382237))

(assert (=> b!1499051 m!1382237))

(declare-fun m!1382241 () Bool)

(assert (=> b!1499051 m!1382241))

(declare-fun m!1382243 () Bool)

(assert (=> b!1499050 m!1382243))

(declare-fun m!1382245 () Bool)

(assert (=> b!1499055 m!1382245))

(declare-fun m!1382247 () Bool)

(assert (=> b!1499055 m!1382247))

(declare-fun m!1382249 () Bool)

(assert (=> b!1499055 m!1382249))

(declare-fun m!1382251 () Bool)

(assert (=> b!1499052 m!1382251))

(assert (=> b!1499052 m!1382237))

(push 1)

(assert (not b!1499054))

(assert (not b!1499056))

(assert (not b!1499057))

(assert (not b!1499051))

(assert (not start!127602))

(assert (not b!1499050))

(check-sat)

