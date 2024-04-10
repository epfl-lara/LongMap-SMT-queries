; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127670 () Bool)

(assert start!127670)

(declare-fun b!1500011 () Bool)

(declare-fun res!1021095 () Bool)

(declare-fun e!839466 () Bool)

(assert (=> b!1500011 (=> (not res!1021095) (not e!839466))))

(declare-datatypes ((array!100051 0))(
  ( (array!100052 (arr!48285 (Array (_ BitVec 32) (_ BitVec 64))) (size!48835 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100051)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500011 (= res!1021095 (validKeyInArray!0 (select (arr!48285 a!2850) i!996)))))

(declare-fun b!1500012 () Bool)

(declare-fun res!1021088 () Bool)

(assert (=> b!1500012 (=> (not res!1021088) (not e!839466))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1500012 (= res!1021088 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48835 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48835 a!2850)) (= (select (arr!48285 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48285 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48835 a!2850))))))

(declare-fun b!1500013 () Bool)

(declare-fun res!1021092 () Bool)

(assert (=> b!1500013 (=> (not res!1021092) (not e!839466))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500013 (= res!1021092 (and (= (size!48835 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48835 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48835 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500015 () Bool)

(declare-fun e!839465 () Bool)

(assert (=> b!1500015 (= e!839466 e!839465)))

(declare-fun res!1021091 () Bool)

(assert (=> b!1500015 (=> (not res!1021091) (not e!839465))))

(declare-fun lt!652851 () (_ BitVec 32))

(assert (=> b!1500015 (= res!1021091 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652851 #b00000000000000000000000000000000) (bvslt lt!652851 (size!48835 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500015 (= lt!652851 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500016 () Bool)

(declare-fun res!1021090 () Bool)

(assert (=> b!1500016 (=> (not res!1021090) (not e!839466))))

(declare-datatypes ((SeekEntryResult!12495 0))(
  ( (MissingZero!12495 (index!52372 (_ BitVec 32))) (Found!12495 (index!52373 (_ BitVec 32))) (Intermediate!12495 (undefined!13307 Bool) (index!52374 (_ BitVec 32)) (x!134049 (_ BitVec 32))) (Undefined!12495) (MissingVacant!12495 (index!52375 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100051 (_ BitVec 32)) SeekEntryResult!12495)

(assert (=> b!1500016 (= res!1021090 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48285 a!2850) j!87) a!2850 mask!2661) (Found!12495 j!87)))))

(declare-fun b!1500017 () Bool)

(declare-fun res!1021094 () Bool)

(assert (=> b!1500017 (=> (not res!1021094) (not e!839466))))

(assert (=> b!1500017 (= res!1021094 (validKeyInArray!0 (select (arr!48285 a!2850) j!87)))))

(declare-fun b!1500018 () Bool)

(assert (=> b!1500018 (= e!839465 false)))

(declare-fun lt!652852 () SeekEntryResult!12495)

(assert (=> b!1500018 (= lt!652852 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652851 vacantBefore!10 (select (arr!48285 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500019 () Bool)

(declare-fun res!1021087 () Bool)

(assert (=> b!1500019 (=> (not res!1021087) (not e!839466))))

(declare-datatypes ((List!34777 0))(
  ( (Nil!34774) (Cons!34773 (h!36170 (_ BitVec 64)) (t!49471 List!34777)) )
))
(declare-fun arrayNoDuplicates!0 (array!100051 (_ BitVec 32) List!34777) Bool)

(assert (=> b!1500019 (= res!1021087 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34774))))

(declare-fun b!1500020 () Bool)

(declare-fun res!1021096 () Bool)

(assert (=> b!1500020 (=> (not res!1021096) (not e!839466))))

(assert (=> b!1500020 (= res!1021096 (not (= (select (arr!48285 a!2850) index!625) (select (arr!48285 a!2850) j!87))))))

(declare-fun res!1021093 () Bool)

(assert (=> start!127670 (=> (not res!1021093) (not e!839466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127670 (= res!1021093 (validMask!0 mask!2661))))

(assert (=> start!127670 e!839466))

(assert (=> start!127670 true))

(declare-fun array_inv!37313 (array!100051) Bool)

(assert (=> start!127670 (array_inv!37313 a!2850)))

(declare-fun b!1500014 () Bool)

(declare-fun res!1021089 () Bool)

(assert (=> b!1500014 (=> (not res!1021089) (not e!839466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100051 (_ BitVec 32)) Bool)

(assert (=> b!1500014 (= res!1021089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127670 res!1021093) b!1500013))

(assert (= (and b!1500013 res!1021092) b!1500011))

(assert (= (and b!1500011 res!1021095) b!1500017))

(assert (= (and b!1500017 res!1021094) b!1500014))

(assert (= (and b!1500014 res!1021089) b!1500019))

(assert (= (and b!1500019 res!1021087) b!1500012))

(assert (= (and b!1500012 res!1021088) b!1500016))

(assert (= (and b!1500016 res!1021090) b!1500020))

(assert (= (and b!1500020 res!1021096) b!1500015))

(assert (= (and b!1500015 res!1021091) b!1500018))

(declare-fun m!1383205 () Bool)

(assert (=> b!1500015 m!1383205))

(declare-fun m!1383207 () Bool)

(assert (=> b!1500018 m!1383207))

(assert (=> b!1500018 m!1383207))

(declare-fun m!1383209 () Bool)

(assert (=> b!1500018 m!1383209))

(declare-fun m!1383211 () Bool)

(assert (=> b!1500020 m!1383211))

(assert (=> b!1500020 m!1383207))

(assert (=> b!1500016 m!1383207))

(assert (=> b!1500016 m!1383207))

(declare-fun m!1383213 () Bool)

(assert (=> b!1500016 m!1383213))

(declare-fun m!1383215 () Bool)

(assert (=> b!1500011 m!1383215))

(assert (=> b!1500011 m!1383215))

(declare-fun m!1383217 () Bool)

(assert (=> b!1500011 m!1383217))

(declare-fun m!1383219 () Bool)

(assert (=> start!127670 m!1383219))

(declare-fun m!1383221 () Bool)

(assert (=> start!127670 m!1383221))

(assert (=> b!1500017 m!1383207))

(assert (=> b!1500017 m!1383207))

(declare-fun m!1383223 () Bool)

(assert (=> b!1500017 m!1383223))

(declare-fun m!1383225 () Bool)

(assert (=> b!1500012 m!1383225))

(declare-fun m!1383227 () Bool)

(assert (=> b!1500012 m!1383227))

(declare-fun m!1383229 () Bool)

(assert (=> b!1500012 m!1383229))

(declare-fun m!1383231 () Bool)

(assert (=> b!1500019 m!1383231))

(declare-fun m!1383233 () Bool)

(assert (=> b!1500014 m!1383233))

(check-sat (not b!1500017) (not b!1500016) (not b!1500019) (not start!127670) (not b!1500011) (not b!1500014) (not b!1500015) (not b!1500018))
(check-sat)
