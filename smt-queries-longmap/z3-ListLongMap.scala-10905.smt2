; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127994 () Bool)

(assert start!127994)

(declare-fun b!1502179 () Bool)

(declare-fun res!1022080 () Bool)

(declare-fun e!840705 () Bool)

(assert (=> b!1502179 (=> (not res!1022080) (not e!840705))))

(declare-datatypes ((array!100189 0))(
  ( (array!100190 (arr!48349 (Array (_ BitVec 32) (_ BitVec 64))) (size!48900 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100189)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1502179 (= res!1022080 (and (= (size!48900 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48900 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48900 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502180 () Bool)

(declare-fun res!1022081 () Bool)

(assert (=> b!1502180 (=> (not res!1022081) (not e!840705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502180 (= res!1022081 (validKeyInArray!0 (select (arr!48349 a!2850) i!996)))))

(declare-fun b!1502181 () Bool)

(declare-fun res!1022072 () Bool)

(assert (=> b!1502181 (=> (not res!1022072) (not e!840705))))

(assert (=> b!1502181 (= res!1022072 (validKeyInArray!0 (select (arr!48349 a!2850) j!87)))))

(declare-fun b!1502182 () Bool)

(declare-fun res!1022075 () Bool)

(assert (=> b!1502182 (=> (not res!1022075) (not e!840705))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1502182 (= res!1022075 (not (= (select (arr!48349 a!2850) index!625) (select (arr!48349 a!2850) j!87))))))

(declare-fun b!1502184 () Bool)

(declare-fun res!1022077 () Bool)

(assert (=> b!1502184 (=> (not res!1022077) (not e!840705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100189 (_ BitVec 32)) Bool)

(assert (=> b!1502184 (= res!1022077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502185 () Bool)

(declare-fun e!840704 () Bool)

(assert (=> b!1502185 (= e!840705 e!840704)))

(declare-fun res!1022078 () Bool)

(assert (=> b!1502185 (=> (not res!1022078) (not e!840704))))

(declare-fun lt!653583 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1502185 (= res!1022078 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653583 #b00000000000000000000000000000000) (bvslt lt!653583 (size!48900 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502185 (= lt!653583 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1502186 () Bool)

(declare-fun res!1022073 () Bool)

(assert (=> b!1502186 (=> (not res!1022073) (not e!840705))))

(declare-datatypes ((List!34828 0))(
  ( (Nil!34825) (Cons!34824 (h!36236 (_ BitVec 64)) (t!49514 List!34828)) )
))
(declare-fun arrayNoDuplicates!0 (array!100189 (_ BitVec 32) List!34828) Bool)

(assert (=> b!1502186 (= res!1022073 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34825))))

(declare-fun b!1502187 () Bool)

(declare-fun res!1022079 () Bool)

(assert (=> b!1502187 (=> (not res!1022079) (not e!840705))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12452 0))(
  ( (MissingZero!12452 (index!52200 (_ BitVec 32))) (Found!12452 (index!52201 (_ BitVec 32))) (Intermediate!12452 (undefined!13264 Bool) (index!52202 (_ BitVec 32)) (x!134075 (_ BitVec 32))) (Undefined!12452) (MissingVacant!12452 (index!52203 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100189 (_ BitVec 32)) SeekEntryResult!12452)

(assert (=> b!1502187 (= res!1022079 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48349 a!2850) j!87) a!2850 mask!2661) (Found!12452 j!87)))))

(declare-fun b!1502188 () Bool)

(assert (=> b!1502188 (= e!840704 false)))

(declare-fun lt!653582 () SeekEntryResult!12452)

(assert (=> b!1502188 (= lt!653582 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653583 vacantBefore!10 (select (arr!48349 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1022074 () Bool)

(assert (=> start!127994 (=> (not res!1022074) (not e!840705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127994 (= res!1022074 (validMask!0 mask!2661))))

(assert (=> start!127994 e!840705))

(assert (=> start!127994 true))

(declare-fun array_inv!37630 (array!100189) Bool)

(assert (=> start!127994 (array_inv!37630 a!2850)))

(declare-fun b!1502183 () Bool)

(declare-fun res!1022076 () Bool)

(assert (=> b!1502183 (=> (not res!1022076) (not e!840705))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502183 (= res!1022076 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48900 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48900 a!2850)) (= (select (arr!48349 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48349 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48900 a!2850))))))

(assert (= (and start!127994 res!1022074) b!1502179))

(assert (= (and b!1502179 res!1022080) b!1502180))

(assert (= (and b!1502180 res!1022081) b!1502181))

(assert (= (and b!1502181 res!1022072) b!1502184))

(assert (= (and b!1502184 res!1022077) b!1502186))

(assert (= (and b!1502186 res!1022073) b!1502183))

(assert (= (and b!1502183 res!1022076) b!1502187))

(assert (= (and b!1502187 res!1022079) b!1502182))

(assert (= (and b!1502182 res!1022075) b!1502185))

(assert (= (and b!1502185 res!1022078) b!1502188))

(declare-fun m!1385323 () Bool)

(assert (=> b!1502182 m!1385323))

(declare-fun m!1385325 () Bool)

(assert (=> b!1502182 m!1385325))

(declare-fun m!1385327 () Bool)

(assert (=> start!127994 m!1385327))

(declare-fun m!1385329 () Bool)

(assert (=> start!127994 m!1385329))

(declare-fun m!1385331 () Bool)

(assert (=> b!1502186 m!1385331))

(declare-fun m!1385333 () Bool)

(assert (=> b!1502185 m!1385333))

(declare-fun m!1385335 () Bool)

(assert (=> b!1502183 m!1385335))

(declare-fun m!1385337 () Bool)

(assert (=> b!1502183 m!1385337))

(declare-fun m!1385339 () Bool)

(assert (=> b!1502183 m!1385339))

(assert (=> b!1502181 m!1385325))

(assert (=> b!1502181 m!1385325))

(declare-fun m!1385341 () Bool)

(assert (=> b!1502181 m!1385341))

(declare-fun m!1385343 () Bool)

(assert (=> b!1502180 m!1385343))

(assert (=> b!1502180 m!1385343))

(declare-fun m!1385345 () Bool)

(assert (=> b!1502180 m!1385345))

(declare-fun m!1385347 () Bool)

(assert (=> b!1502184 m!1385347))

(assert (=> b!1502188 m!1385325))

(assert (=> b!1502188 m!1385325))

(declare-fun m!1385349 () Bool)

(assert (=> b!1502188 m!1385349))

(assert (=> b!1502187 m!1385325))

(assert (=> b!1502187 m!1385325))

(declare-fun m!1385351 () Bool)

(assert (=> b!1502187 m!1385351))

(check-sat (not b!1502185) (not b!1502180) (not b!1502188) (not b!1502187) (not start!127994) (not b!1502184) (not b!1502186) (not b!1502181))
(check-sat)
