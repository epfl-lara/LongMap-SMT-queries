; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127610 () Bool)

(assert start!127610)

(declare-fun b!1499146 () Bool)

(declare-fun res!1020226 () Bool)

(declare-fun e!839209 () Bool)

(assert (=> b!1499146 (=> (not res!1020226) (not e!839209))))

(declare-datatypes ((array!99991 0))(
  ( (array!99992 (arr!48255 (Array (_ BitVec 32) (_ BitVec 64))) (size!48805 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99991)

(declare-datatypes ((List!34747 0))(
  ( (Nil!34744) (Cons!34743 (h!36140 (_ BitVec 64)) (t!49441 List!34747)) )
))
(declare-fun arrayNoDuplicates!0 (array!99991 (_ BitVec 32) List!34747) Bool)

(assert (=> b!1499146 (= res!1020226 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34744))))

(declare-fun b!1499147 () Bool)

(declare-fun res!1020229 () Bool)

(assert (=> b!1499147 (=> (not res!1020229) (not e!839209))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12465 0))(
  ( (MissingZero!12465 (index!52252 (_ BitVec 32))) (Found!12465 (index!52253 (_ BitVec 32))) (Intermediate!12465 (undefined!13277 Bool) (index!52254 (_ BitVec 32)) (x!133939 (_ BitVec 32))) (Undefined!12465) (MissingVacant!12465 (index!52255 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99991 (_ BitVec 32)) SeekEntryResult!12465)

(assert (=> b!1499147 (= res!1020229 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48255 a!2850) j!87) a!2850 mask!2661) (Found!12465 j!87)))))

(declare-fun b!1499148 () Bool)

(declare-fun res!1020224 () Bool)

(assert (=> b!1499148 (=> (not res!1020224) (not e!839209))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499148 (= res!1020224 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48805 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48805 a!2850)) (= (select (arr!48255 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48255 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48805 a!2850))))))

(declare-fun res!1020222 () Bool)

(assert (=> start!127610 (=> (not res!1020222) (not e!839209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127610 (= res!1020222 (validMask!0 mask!2661))))

(assert (=> start!127610 e!839209))

(assert (=> start!127610 true))

(declare-fun array_inv!37283 (array!99991) Bool)

(assert (=> start!127610 (array_inv!37283 a!2850)))

(declare-fun b!1499149 () Bool)

(declare-fun res!1020225 () Bool)

(assert (=> b!1499149 (=> (not res!1020225) (not e!839209))))

(assert (=> b!1499149 (= res!1020225 (and (= (size!48805 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48805 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48805 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499150 () Bool)

(declare-fun res!1020228 () Bool)

(assert (=> b!1499150 (=> (not res!1020228) (not e!839209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499150 (= res!1020228 (validKeyInArray!0 (select (arr!48255 a!2850) i!996)))))

(declare-fun b!1499151 () Bool)

(declare-fun res!1020227 () Bool)

(assert (=> b!1499151 (=> (not res!1020227) (not e!839209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99991 (_ BitVec 32)) Bool)

(assert (=> b!1499151 (= res!1020227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499152 () Bool)

(assert (=> b!1499152 (= e!839209 (and (not (= (select (arr!48255 a!2850) index!625) (select (arr!48255 a!2850) j!87))) (bvsge mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1499153 () Bool)

(declare-fun res!1020223 () Bool)

(assert (=> b!1499153 (=> (not res!1020223) (not e!839209))))

(assert (=> b!1499153 (= res!1020223 (validKeyInArray!0 (select (arr!48255 a!2850) j!87)))))

(assert (= (and start!127610 res!1020222) b!1499149))

(assert (= (and b!1499149 res!1020225) b!1499150))

(assert (= (and b!1499150 res!1020228) b!1499153))

(assert (= (and b!1499153 res!1020223) b!1499151))

(assert (= (and b!1499151 res!1020227) b!1499146))

(assert (= (and b!1499146 res!1020226) b!1499148))

(assert (= (and b!1499148 res!1020224) b!1499147))

(assert (= (and b!1499147 res!1020229) b!1499152))

(declare-fun m!1382331 () Bool)

(assert (=> b!1499150 m!1382331))

(assert (=> b!1499150 m!1382331))

(declare-fun m!1382333 () Bool)

(assert (=> b!1499150 m!1382333))

(declare-fun m!1382335 () Bool)

(assert (=> b!1499148 m!1382335))

(declare-fun m!1382337 () Bool)

(assert (=> b!1499148 m!1382337))

(declare-fun m!1382339 () Bool)

(assert (=> b!1499148 m!1382339))

(declare-fun m!1382341 () Bool)

(assert (=> b!1499152 m!1382341))

(declare-fun m!1382343 () Bool)

(assert (=> b!1499152 m!1382343))

(assert (=> b!1499147 m!1382343))

(assert (=> b!1499147 m!1382343))

(declare-fun m!1382345 () Bool)

(assert (=> b!1499147 m!1382345))

(declare-fun m!1382347 () Bool)

(assert (=> start!127610 m!1382347))

(declare-fun m!1382349 () Bool)

(assert (=> start!127610 m!1382349))

(declare-fun m!1382351 () Bool)

(assert (=> b!1499146 m!1382351))

(declare-fun m!1382353 () Bool)

(assert (=> b!1499151 m!1382353))

(assert (=> b!1499153 m!1382343))

(assert (=> b!1499153 m!1382343))

(declare-fun m!1382355 () Bool)

(assert (=> b!1499153 m!1382355))

(check-sat (not start!127610) (not b!1499151) (not b!1499150) (not b!1499153) (not b!1499146) (not b!1499147))
(check-sat)
