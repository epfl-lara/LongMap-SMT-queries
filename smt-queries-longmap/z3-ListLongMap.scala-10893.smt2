; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127922 () Bool)

(assert start!127922)

(declare-fun b!1501099 () Bool)

(declare-fun res!1020995 () Bool)

(declare-fun e!840379 () Bool)

(assert (=> b!1501099 (=> (not res!1020995) (not e!840379))))

(declare-datatypes ((array!100117 0))(
  ( (array!100118 (arr!48313 (Array (_ BitVec 32) (_ BitVec 64))) (size!48864 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100117)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501099 (= res!1020995 (not (= (select (arr!48313 a!2850) index!625) (select (arr!48313 a!2850) j!87))))))

(declare-fun b!1501100 () Bool)

(declare-fun res!1020996 () Bool)

(assert (=> b!1501100 (=> (not res!1020996) (not e!840379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501100 (= res!1020996 (validKeyInArray!0 (select (arr!48313 a!2850) j!87)))))

(declare-fun b!1501101 () Bool)

(declare-fun res!1020998 () Bool)

(assert (=> b!1501101 (=> (not res!1020998) (not e!840379))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501101 (= res!1020998 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48864 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48864 a!2850)) (= (select (arr!48313 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48313 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48864 a!2850))))))

(declare-fun b!1501102 () Bool)

(declare-fun e!840380 () Bool)

(assert (=> b!1501102 (= e!840379 e!840380)))

(declare-fun res!1020993 () Bool)

(assert (=> b!1501102 (=> (not res!1020993) (not e!840380))))

(declare-fun lt!653366 () (_ BitVec 32))

(assert (=> b!1501102 (= res!1020993 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653366 #b00000000000000000000000000000000) (bvslt lt!653366 (size!48864 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501102 (= lt!653366 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1501104 () Bool)

(declare-fun res!1020999 () Bool)

(assert (=> b!1501104 (=> (not res!1020999) (not e!840379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100117 (_ BitVec 32)) Bool)

(assert (=> b!1501104 (= res!1020999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501105 () Bool)

(declare-fun res!1020994 () Bool)

(assert (=> b!1501105 (=> (not res!1020994) (not e!840379))))

(assert (=> b!1501105 (= res!1020994 (and (= (size!48864 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48864 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48864 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501106 () Bool)

(declare-fun res!1020992 () Bool)

(assert (=> b!1501106 (=> (not res!1020992) (not e!840379))))

(declare-datatypes ((List!34792 0))(
  ( (Nil!34789) (Cons!34788 (h!36200 (_ BitVec 64)) (t!49478 List!34792)) )
))
(declare-fun arrayNoDuplicates!0 (array!100117 (_ BitVec 32) List!34792) Bool)

(assert (=> b!1501106 (= res!1020992 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34789))))

(declare-fun b!1501107 () Bool)

(assert (=> b!1501107 (= e!840380 false)))

(declare-datatypes ((SeekEntryResult!12416 0))(
  ( (MissingZero!12416 (index!52056 (_ BitVec 32))) (Found!12416 (index!52057 (_ BitVec 32))) (Intermediate!12416 (undefined!13228 Bool) (index!52058 (_ BitVec 32)) (x!133943 (_ BitVec 32))) (Undefined!12416) (MissingVacant!12416 (index!52059 (_ BitVec 32))) )
))
(declare-fun lt!653367 () SeekEntryResult!12416)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100117 (_ BitVec 32)) SeekEntryResult!12416)

(assert (=> b!1501107 (= lt!653367 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653366 vacantBefore!10 (select (arr!48313 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1501108 () Bool)

(declare-fun res!1020997 () Bool)

(assert (=> b!1501108 (=> (not res!1020997) (not e!840379))))

(assert (=> b!1501108 (= res!1020997 (validKeyInArray!0 (select (arr!48313 a!2850) i!996)))))

(declare-fun b!1501103 () Bool)

(declare-fun res!1021000 () Bool)

(assert (=> b!1501103 (=> (not res!1021000) (not e!840379))))

(assert (=> b!1501103 (= res!1021000 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48313 a!2850) j!87) a!2850 mask!2661) (Found!12416 j!87)))))

(declare-fun res!1021001 () Bool)

(assert (=> start!127922 (=> (not res!1021001) (not e!840379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127922 (= res!1021001 (validMask!0 mask!2661))))

(assert (=> start!127922 e!840379))

(assert (=> start!127922 true))

(declare-fun array_inv!37594 (array!100117) Bool)

(assert (=> start!127922 (array_inv!37594 a!2850)))

(assert (= (and start!127922 res!1021001) b!1501105))

(assert (= (and b!1501105 res!1020994) b!1501108))

(assert (= (and b!1501108 res!1020997) b!1501100))

(assert (= (and b!1501100 res!1020996) b!1501104))

(assert (= (and b!1501104 res!1020999) b!1501106))

(assert (= (and b!1501106 res!1020992) b!1501101))

(assert (= (and b!1501101 res!1020998) b!1501103))

(assert (= (and b!1501103 res!1021000) b!1501099))

(assert (= (and b!1501099 res!1020995) b!1501102))

(assert (= (and b!1501102 res!1020993) b!1501107))

(declare-fun m!1384243 () Bool)

(assert (=> b!1501108 m!1384243))

(assert (=> b!1501108 m!1384243))

(declare-fun m!1384245 () Bool)

(assert (=> b!1501108 m!1384245))

(declare-fun m!1384247 () Bool)

(assert (=> b!1501101 m!1384247))

(declare-fun m!1384249 () Bool)

(assert (=> b!1501101 m!1384249))

(declare-fun m!1384251 () Bool)

(assert (=> b!1501101 m!1384251))

(declare-fun m!1384253 () Bool)

(assert (=> b!1501099 m!1384253))

(declare-fun m!1384255 () Bool)

(assert (=> b!1501099 m!1384255))

(assert (=> b!1501100 m!1384255))

(assert (=> b!1501100 m!1384255))

(declare-fun m!1384257 () Bool)

(assert (=> b!1501100 m!1384257))

(declare-fun m!1384259 () Bool)

(assert (=> start!127922 m!1384259))

(declare-fun m!1384261 () Bool)

(assert (=> start!127922 m!1384261))

(declare-fun m!1384263 () Bool)

(assert (=> b!1501104 m!1384263))

(declare-fun m!1384265 () Bool)

(assert (=> b!1501102 m!1384265))

(assert (=> b!1501107 m!1384255))

(assert (=> b!1501107 m!1384255))

(declare-fun m!1384267 () Bool)

(assert (=> b!1501107 m!1384267))

(declare-fun m!1384269 () Bool)

(assert (=> b!1501106 m!1384269))

(assert (=> b!1501103 m!1384255))

(assert (=> b!1501103 m!1384255))

(declare-fun m!1384271 () Bool)

(assert (=> b!1501103 m!1384271))

(check-sat (not b!1501102) (not b!1501103) (not b!1501106) (not start!127922) (not b!1501108) (not b!1501104) (not b!1501107) (not b!1501100))
(check-sat)
