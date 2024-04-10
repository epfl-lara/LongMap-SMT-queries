; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127814 () Bool)

(assert start!127814)

(declare-fun res!1023110 () Bool)

(declare-fun e!840145 () Bool)

(assert (=> start!127814 (=> (not res!1023110) (not e!840145))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127814 (= res!1023110 (validMask!0 mask!2661))))

(assert (=> start!127814 e!840145))

(assert (=> start!127814 true))

(declare-datatypes ((array!100195 0))(
  ( (array!100196 (arr!48357 (Array (_ BitVec 32) (_ BitVec 64))) (size!48907 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100195)

(declare-fun array_inv!37385 (array!100195) Bool)

(assert (=> start!127814 (array_inv!37385 a!2850)))

(declare-fun b!1502030 () Bool)

(declare-fun res!1023112 () Bool)

(assert (=> b!1502030 (=> (not res!1023112) (not e!840145))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502030 (= res!1023112 (validKeyInArray!0 (select (arr!48357 a!2850) j!87)))))

(declare-fun b!1502031 () Bool)

(declare-fun res!1023109 () Bool)

(assert (=> b!1502031 (=> (not res!1023109) (not e!840145))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1502031 (= res!1023109 (validKeyInArray!0 (select (arr!48357 a!2850) i!996)))))

(declare-fun b!1502032 () Bool)

(declare-fun res!1023108 () Bool)

(assert (=> b!1502032 (=> (not res!1023108) (not e!840145))))

(assert (=> b!1502032 (= res!1023108 (and (= (size!48907 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48907 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48907 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502033 () Bool)

(declare-fun res!1023106 () Bool)

(assert (=> b!1502033 (=> (not res!1023106) (not e!840145))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502033 (= res!1023106 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48907 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48907 a!2850)) (= (select (arr!48357 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48357 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48907 a!2850))))))

(declare-fun b!1502034 () Bool)

(declare-fun res!1023107 () Bool)

(assert (=> b!1502034 (=> (not res!1023107) (not e!840145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100195 (_ BitVec 32)) Bool)

(assert (=> b!1502034 (= res!1023107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502035 () Bool)

(declare-fun res!1023111 () Bool)

(assert (=> b!1502035 (=> (not res!1023111) (not e!840145))))

(declare-datatypes ((List!34849 0))(
  ( (Nil!34846) (Cons!34845 (h!36242 (_ BitVec 64)) (t!49543 List!34849)) )
))
(declare-fun arrayNoDuplicates!0 (array!100195 (_ BitVec 32) List!34849) Bool)

(assert (=> b!1502035 (= res!1023111 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34846))))

(declare-fun b!1502036 () Bool)

(assert (=> b!1502036 (= e!840145 false)))

(declare-datatypes ((SeekEntryResult!12555 0))(
  ( (MissingZero!12555 (index!52612 (_ BitVec 32))) (Found!12555 (index!52613 (_ BitVec 32))) (Intermediate!12555 (undefined!13367 Bool) (index!52614 (_ BitVec 32)) (x!134301 (_ BitVec 32))) (Undefined!12555) (MissingVacant!12555 (index!52615 (_ BitVec 32))) )
))
(declare-fun lt!653305 () SeekEntryResult!12555)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100195 (_ BitVec 32)) SeekEntryResult!12555)

(assert (=> b!1502036 (= lt!653305 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48357 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127814 res!1023110) b!1502032))

(assert (= (and b!1502032 res!1023108) b!1502031))

(assert (= (and b!1502031 res!1023109) b!1502030))

(assert (= (and b!1502030 res!1023112) b!1502034))

(assert (= (and b!1502034 res!1023107) b!1502035))

(assert (= (and b!1502035 res!1023111) b!1502033))

(assert (= (and b!1502033 res!1023106) b!1502036))

(declare-fun m!1385323 () Bool)

(assert (=> start!127814 m!1385323))

(declare-fun m!1385325 () Bool)

(assert (=> start!127814 m!1385325))

(declare-fun m!1385327 () Bool)

(assert (=> b!1502034 m!1385327))

(declare-fun m!1385329 () Bool)

(assert (=> b!1502033 m!1385329))

(declare-fun m!1385331 () Bool)

(assert (=> b!1502033 m!1385331))

(declare-fun m!1385333 () Bool)

(assert (=> b!1502033 m!1385333))

(declare-fun m!1385335 () Bool)

(assert (=> b!1502036 m!1385335))

(assert (=> b!1502036 m!1385335))

(declare-fun m!1385337 () Bool)

(assert (=> b!1502036 m!1385337))

(declare-fun m!1385339 () Bool)

(assert (=> b!1502031 m!1385339))

(assert (=> b!1502031 m!1385339))

(declare-fun m!1385341 () Bool)

(assert (=> b!1502031 m!1385341))

(assert (=> b!1502030 m!1385335))

(assert (=> b!1502030 m!1385335))

(declare-fun m!1385343 () Bool)

(assert (=> b!1502030 m!1385343))

(declare-fun m!1385345 () Bool)

(assert (=> b!1502035 m!1385345))

(check-sat (not b!1502035) (not b!1502036) (not start!127814) (not b!1502034) (not b!1502031) (not b!1502030))
