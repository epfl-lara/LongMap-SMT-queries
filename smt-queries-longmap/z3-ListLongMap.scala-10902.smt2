; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127676 () Bool)

(assert start!127676)

(declare-fun b!1500101 () Bool)

(declare-fun res!1021185 () Bool)

(declare-fun e!839492 () Bool)

(assert (=> b!1500101 (=> (not res!1021185) (not e!839492))))

(declare-datatypes ((array!100057 0))(
  ( (array!100058 (arr!48288 (Array (_ BitVec 32) (_ BitVec 64))) (size!48838 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100057)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500101 (= res!1021185 (not (= (select (arr!48288 a!2850) index!625) (select (arr!48288 a!2850) j!87))))))

(declare-fun b!1500102 () Bool)

(declare-fun res!1021186 () Bool)

(assert (=> b!1500102 (=> (not res!1021186) (not e!839492))))

(declare-datatypes ((List!34780 0))(
  ( (Nil!34777) (Cons!34776 (h!36173 (_ BitVec 64)) (t!49474 List!34780)) )
))
(declare-fun arrayNoDuplicates!0 (array!100057 (_ BitVec 32) List!34780) Bool)

(assert (=> b!1500102 (= res!1021186 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34777))))

(declare-fun res!1021183 () Bool)

(assert (=> start!127676 (=> (not res!1021183) (not e!839492))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127676 (= res!1021183 (validMask!0 mask!2661))))

(assert (=> start!127676 e!839492))

(assert (=> start!127676 true))

(declare-fun array_inv!37316 (array!100057) Bool)

(assert (=> start!127676 (array_inv!37316 a!2850)))

(declare-fun b!1500103 () Bool)

(declare-fun res!1021177 () Bool)

(assert (=> b!1500103 (=> (not res!1021177) (not e!839492))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12498 0))(
  ( (MissingZero!12498 (index!52384 (_ BitVec 32))) (Found!12498 (index!52385 (_ BitVec 32))) (Intermediate!12498 (undefined!13310 Bool) (index!52386 (_ BitVec 32)) (x!134060 (_ BitVec 32))) (Undefined!12498) (MissingVacant!12498 (index!52387 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100057 (_ BitVec 32)) SeekEntryResult!12498)

(assert (=> b!1500103 (= res!1021177 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48288 a!2850) j!87) a!2850 mask!2661) (Found!12498 j!87)))))

(declare-fun b!1500104 () Bool)

(declare-fun res!1021181 () Bool)

(assert (=> b!1500104 (=> (not res!1021181) (not e!839492))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1500104 (= res!1021181 (and (= (size!48838 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48838 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48838 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500105 () Bool)

(declare-fun res!1021179 () Bool)

(assert (=> b!1500105 (=> (not res!1021179) (not e!839492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500105 (= res!1021179 (validKeyInArray!0 (select (arr!48288 a!2850) j!87)))))

(declare-fun b!1500106 () Bool)

(declare-fun res!1021178 () Bool)

(assert (=> b!1500106 (=> (not res!1021178) (not e!839492))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500106 (= res!1021178 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48838 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48838 a!2850)) (= (select (arr!48288 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48288 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48838 a!2850))))))

(declare-fun b!1500107 () Bool)

(declare-fun e!839493 () Bool)

(assert (=> b!1500107 (= e!839492 e!839493)))

(declare-fun res!1021180 () Bool)

(assert (=> b!1500107 (=> (not res!1021180) (not e!839493))))

(declare-fun lt!652870 () (_ BitVec 32))

(assert (=> b!1500107 (= res!1021180 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652870 #b00000000000000000000000000000000) (bvslt lt!652870 (size!48838 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500107 (= lt!652870 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500108 () Bool)

(declare-fun res!1021182 () Bool)

(assert (=> b!1500108 (=> (not res!1021182) (not e!839492))))

(assert (=> b!1500108 (= res!1021182 (validKeyInArray!0 (select (arr!48288 a!2850) i!996)))))

(declare-fun b!1500109 () Bool)

(assert (=> b!1500109 (= e!839493 false)))

(declare-fun lt!652869 () SeekEntryResult!12498)

(assert (=> b!1500109 (= lt!652869 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652870 vacantBefore!10 (select (arr!48288 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500110 () Bool)

(declare-fun res!1021184 () Bool)

(assert (=> b!1500110 (=> (not res!1021184) (not e!839492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100057 (_ BitVec 32)) Bool)

(assert (=> b!1500110 (= res!1021184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127676 res!1021183) b!1500104))

(assert (= (and b!1500104 res!1021181) b!1500108))

(assert (= (and b!1500108 res!1021182) b!1500105))

(assert (= (and b!1500105 res!1021179) b!1500110))

(assert (= (and b!1500110 res!1021184) b!1500102))

(assert (= (and b!1500102 res!1021186) b!1500106))

(assert (= (and b!1500106 res!1021178) b!1500103))

(assert (= (and b!1500103 res!1021177) b!1500101))

(assert (= (and b!1500101 res!1021185) b!1500107))

(assert (= (and b!1500107 res!1021180) b!1500109))

(declare-fun m!1383295 () Bool)

(assert (=> b!1500107 m!1383295))

(declare-fun m!1383297 () Bool)

(assert (=> b!1500110 m!1383297))

(declare-fun m!1383299 () Bool)

(assert (=> b!1500105 m!1383299))

(assert (=> b!1500105 m!1383299))

(declare-fun m!1383301 () Bool)

(assert (=> b!1500105 m!1383301))

(declare-fun m!1383303 () Bool)

(assert (=> b!1500106 m!1383303))

(declare-fun m!1383305 () Bool)

(assert (=> b!1500106 m!1383305))

(declare-fun m!1383307 () Bool)

(assert (=> b!1500106 m!1383307))

(declare-fun m!1383309 () Bool)

(assert (=> b!1500102 m!1383309))

(assert (=> b!1500103 m!1383299))

(assert (=> b!1500103 m!1383299))

(declare-fun m!1383311 () Bool)

(assert (=> b!1500103 m!1383311))

(declare-fun m!1383313 () Bool)

(assert (=> start!127676 m!1383313))

(declare-fun m!1383315 () Bool)

(assert (=> start!127676 m!1383315))

(assert (=> b!1500109 m!1383299))

(assert (=> b!1500109 m!1383299))

(declare-fun m!1383317 () Bool)

(assert (=> b!1500109 m!1383317))

(declare-fun m!1383319 () Bool)

(assert (=> b!1500101 m!1383319))

(assert (=> b!1500101 m!1383299))

(declare-fun m!1383321 () Bool)

(assert (=> b!1500108 m!1383321))

(assert (=> b!1500108 m!1383321))

(declare-fun m!1383323 () Bool)

(assert (=> b!1500108 m!1383323))

(check-sat (not b!1500107) (not b!1500110) (not b!1500108) (not b!1500102) (not b!1500103) (not b!1500109) (not b!1500105) (not start!127676))
(check-sat)
