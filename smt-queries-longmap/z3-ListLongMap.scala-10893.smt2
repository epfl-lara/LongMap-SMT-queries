; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127622 () Bool)

(assert start!127622)

(declare-fun b!1499291 () Bool)

(declare-fun res!1020376 () Bool)

(declare-fun e!839251 () Bool)

(assert (=> b!1499291 (=> (not res!1020376) (not e!839251))))

(declare-datatypes ((array!100003 0))(
  ( (array!100004 (arr!48261 (Array (_ BitVec 32) (_ BitVec 64))) (size!48811 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100003)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499291 (= res!1020376 (not (= (select (arr!48261 a!2850) index!625) (select (arr!48261 a!2850) j!87))))))

(declare-fun b!1499292 () Bool)

(declare-fun e!839249 () Bool)

(assert (=> b!1499292 (= e!839249 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12471 0))(
  ( (MissingZero!12471 (index!52276 (_ BitVec 32))) (Found!12471 (index!52277 (_ BitVec 32))) (Intermediate!12471 (undefined!13283 Bool) (index!52278 (_ BitVec 32)) (x!133961 (_ BitVec 32))) (Undefined!12471) (MissingVacant!12471 (index!52279 (_ BitVec 32))) )
))
(declare-fun lt!652708 () SeekEntryResult!12471)

(declare-fun lt!652707 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100003 (_ BitVec 32)) SeekEntryResult!12471)

(assert (=> b!1499292 (= lt!652708 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652707 vacantBefore!10 (select (arr!48261 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499293 () Bool)

(declare-fun res!1020369 () Bool)

(assert (=> b!1499293 (=> (not res!1020369) (not e!839251))))

(assert (=> b!1499293 (= res!1020369 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48261 a!2850) j!87) a!2850 mask!2661) (Found!12471 j!87)))))

(declare-fun b!1499294 () Bool)

(declare-fun res!1020372 () Bool)

(assert (=> b!1499294 (=> (not res!1020372) (not e!839251))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499294 (= res!1020372 (validKeyInArray!0 (select (arr!48261 a!2850) i!996)))))

(declare-fun res!1020371 () Bool)

(assert (=> start!127622 (=> (not res!1020371) (not e!839251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127622 (= res!1020371 (validMask!0 mask!2661))))

(assert (=> start!127622 e!839251))

(assert (=> start!127622 true))

(declare-fun array_inv!37289 (array!100003) Bool)

(assert (=> start!127622 (array_inv!37289 a!2850)))

(declare-fun b!1499295 () Bool)

(declare-fun res!1020375 () Bool)

(assert (=> b!1499295 (=> (not res!1020375) (not e!839251))))

(assert (=> b!1499295 (= res!1020375 (and (= (size!48811 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48811 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48811 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499296 () Bool)

(declare-fun res!1020367 () Bool)

(assert (=> b!1499296 (=> (not res!1020367) (not e!839251))))

(assert (=> b!1499296 (= res!1020367 (validKeyInArray!0 (select (arr!48261 a!2850) j!87)))))

(declare-fun b!1499297 () Bool)

(declare-fun res!1020370 () Bool)

(assert (=> b!1499297 (=> (not res!1020370) (not e!839251))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499297 (= res!1020370 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48811 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48811 a!2850)) (= (select (arr!48261 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48261 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48811 a!2850))))))

(declare-fun b!1499298 () Bool)

(assert (=> b!1499298 (= e!839251 e!839249)))

(declare-fun res!1020374 () Bool)

(assert (=> b!1499298 (=> (not res!1020374) (not e!839249))))

(assert (=> b!1499298 (= res!1020374 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652707 #b00000000000000000000000000000000) (bvslt lt!652707 (size!48811 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499298 (= lt!652707 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499299 () Bool)

(declare-fun res!1020368 () Bool)

(assert (=> b!1499299 (=> (not res!1020368) (not e!839251))))

(declare-datatypes ((List!34753 0))(
  ( (Nil!34750) (Cons!34749 (h!36146 (_ BitVec 64)) (t!49447 List!34753)) )
))
(declare-fun arrayNoDuplicates!0 (array!100003 (_ BitVec 32) List!34753) Bool)

(assert (=> b!1499299 (= res!1020368 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34750))))

(declare-fun b!1499300 () Bool)

(declare-fun res!1020373 () Bool)

(assert (=> b!1499300 (=> (not res!1020373) (not e!839251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100003 (_ BitVec 32)) Bool)

(assert (=> b!1499300 (= res!1020373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127622 res!1020371) b!1499295))

(assert (= (and b!1499295 res!1020375) b!1499294))

(assert (= (and b!1499294 res!1020372) b!1499296))

(assert (= (and b!1499296 res!1020367) b!1499300))

(assert (= (and b!1499300 res!1020373) b!1499299))

(assert (= (and b!1499299 res!1020368) b!1499297))

(assert (= (and b!1499297 res!1020370) b!1499293))

(assert (= (and b!1499293 res!1020369) b!1499291))

(assert (= (and b!1499291 res!1020376) b!1499298))

(assert (= (and b!1499298 res!1020374) b!1499292))

(declare-fun m!1382485 () Bool)

(assert (=> b!1499296 m!1382485))

(assert (=> b!1499296 m!1382485))

(declare-fun m!1382487 () Bool)

(assert (=> b!1499296 m!1382487))

(assert (=> b!1499293 m!1382485))

(assert (=> b!1499293 m!1382485))

(declare-fun m!1382489 () Bool)

(assert (=> b!1499293 m!1382489))

(declare-fun m!1382491 () Bool)

(assert (=> b!1499298 m!1382491))

(declare-fun m!1382493 () Bool)

(assert (=> b!1499299 m!1382493))

(declare-fun m!1382495 () Bool)

(assert (=> b!1499300 m!1382495))

(declare-fun m!1382497 () Bool)

(assert (=> start!127622 m!1382497))

(declare-fun m!1382499 () Bool)

(assert (=> start!127622 m!1382499))

(declare-fun m!1382501 () Bool)

(assert (=> b!1499297 m!1382501))

(declare-fun m!1382503 () Bool)

(assert (=> b!1499297 m!1382503))

(declare-fun m!1382505 () Bool)

(assert (=> b!1499297 m!1382505))

(assert (=> b!1499292 m!1382485))

(assert (=> b!1499292 m!1382485))

(declare-fun m!1382507 () Bool)

(assert (=> b!1499292 m!1382507))

(declare-fun m!1382509 () Bool)

(assert (=> b!1499291 m!1382509))

(assert (=> b!1499291 m!1382485))

(declare-fun m!1382511 () Bool)

(assert (=> b!1499294 m!1382511))

(assert (=> b!1499294 m!1382511))

(declare-fun m!1382513 () Bool)

(assert (=> b!1499294 m!1382513))

(check-sat (not b!1499299) (not b!1499293) (not start!127622) (not b!1499296) (not b!1499294) (not b!1499298) (not b!1499300) (not b!1499292))
(check-sat)
