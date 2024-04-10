; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127682 () Bool)

(assert start!127682)

(declare-fun b!1500191 () Bool)

(declare-fun e!839519 () Bool)

(assert (=> b!1500191 (= e!839519 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100063 0))(
  ( (array!100064 (arr!48291 (Array (_ BitVec 32) (_ BitVec 64))) (size!48841 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100063)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!652888 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12501 0))(
  ( (MissingZero!12501 (index!52396 (_ BitVec 32))) (Found!12501 (index!52397 (_ BitVec 32))) (Intermediate!12501 (undefined!13313 Bool) (index!52398 (_ BitVec 32)) (x!134071 (_ BitVec 32))) (Undefined!12501) (MissingVacant!12501 (index!52399 (_ BitVec 32))) )
))
(declare-fun lt!652887 () SeekEntryResult!12501)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100063 (_ BitVec 32)) SeekEntryResult!12501)

(assert (=> b!1500191 (= lt!652887 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652888 vacantBefore!10 (select (arr!48291 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500192 () Bool)

(declare-fun res!1021267 () Bool)

(declare-fun e!839521 () Bool)

(assert (=> b!1500192 (=> (not res!1021267) (not e!839521))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500192 (= res!1021267 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48841 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48841 a!2850)) (= (select (arr!48291 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48291 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48841 a!2850))))))

(declare-fun b!1500193 () Bool)

(declare-fun res!1021270 () Bool)

(assert (=> b!1500193 (=> (not res!1021270) (not e!839521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500193 (= res!1021270 (validKeyInArray!0 (select (arr!48291 a!2850) j!87)))))

(declare-fun res!1021274 () Bool)

(assert (=> start!127682 (=> (not res!1021274) (not e!839521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127682 (= res!1021274 (validMask!0 mask!2661))))

(assert (=> start!127682 e!839521))

(assert (=> start!127682 true))

(declare-fun array_inv!37319 (array!100063) Bool)

(assert (=> start!127682 (array_inv!37319 a!2850)))

(declare-fun b!1500194 () Bool)

(declare-fun res!1021276 () Bool)

(assert (=> b!1500194 (=> (not res!1021276) (not e!839521))))

(assert (=> b!1500194 (= res!1021276 (and (= (size!48841 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48841 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48841 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500195 () Bool)

(declare-fun res!1021271 () Bool)

(assert (=> b!1500195 (=> (not res!1021271) (not e!839521))))

(assert (=> b!1500195 (= res!1021271 (validKeyInArray!0 (select (arr!48291 a!2850) i!996)))))

(declare-fun b!1500196 () Bool)

(declare-fun res!1021269 () Bool)

(assert (=> b!1500196 (=> (not res!1021269) (not e!839521))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100063 (_ BitVec 32)) Bool)

(assert (=> b!1500196 (= res!1021269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500197 () Bool)

(declare-fun res!1021275 () Bool)

(assert (=> b!1500197 (=> (not res!1021275) (not e!839521))))

(assert (=> b!1500197 (= res!1021275 (not (= (select (arr!48291 a!2850) index!625) (select (arr!48291 a!2850) j!87))))))

(declare-fun b!1500198 () Bool)

(declare-fun res!1021273 () Bool)

(assert (=> b!1500198 (=> (not res!1021273) (not e!839521))))

(declare-datatypes ((List!34783 0))(
  ( (Nil!34780) (Cons!34779 (h!36176 (_ BitVec 64)) (t!49477 List!34783)) )
))
(declare-fun arrayNoDuplicates!0 (array!100063 (_ BitVec 32) List!34783) Bool)

(assert (=> b!1500198 (= res!1021273 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34780))))

(declare-fun b!1500199 () Bool)

(assert (=> b!1500199 (= e!839521 e!839519)))

(declare-fun res!1021268 () Bool)

(assert (=> b!1500199 (=> (not res!1021268) (not e!839519))))

(assert (=> b!1500199 (= res!1021268 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652888 #b00000000000000000000000000000000) (bvslt lt!652888 (size!48841 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500199 (= lt!652888 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500200 () Bool)

(declare-fun res!1021272 () Bool)

(assert (=> b!1500200 (=> (not res!1021272) (not e!839521))))

(assert (=> b!1500200 (= res!1021272 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48291 a!2850) j!87) a!2850 mask!2661) (Found!12501 j!87)))))

(assert (= (and start!127682 res!1021274) b!1500194))

(assert (= (and b!1500194 res!1021276) b!1500195))

(assert (= (and b!1500195 res!1021271) b!1500193))

(assert (= (and b!1500193 res!1021270) b!1500196))

(assert (= (and b!1500196 res!1021269) b!1500198))

(assert (= (and b!1500198 res!1021273) b!1500192))

(assert (= (and b!1500192 res!1021267) b!1500200))

(assert (= (and b!1500200 res!1021272) b!1500197))

(assert (= (and b!1500197 res!1021275) b!1500199))

(assert (= (and b!1500199 res!1021268) b!1500191))

(declare-fun m!1383385 () Bool)

(assert (=> b!1500199 m!1383385))

(declare-fun m!1383387 () Bool)

(assert (=> b!1500195 m!1383387))

(assert (=> b!1500195 m!1383387))

(declare-fun m!1383389 () Bool)

(assert (=> b!1500195 m!1383389))

(declare-fun m!1383391 () Bool)

(assert (=> b!1500192 m!1383391))

(declare-fun m!1383393 () Bool)

(assert (=> b!1500192 m!1383393))

(declare-fun m!1383395 () Bool)

(assert (=> b!1500192 m!1383395))

(declare-fun m!1383397 () Bool)

(assert (=> b!1500196 m!1383397))

(declare-fun m!1383399 () Bool)

(assert (=> b!1500200 m!1383399))

(assert (=> b!1500200 m!1383399))

(declare-fun m!1383401 () Bool)

(assert (=> b!1500200 m!1383401))

(declare-fun m!1383403 () Bool)

(assert (=> b!1500197 m!1383403))

(assert (=> b!1500197 m!1383399))

(assert (=> b!1500191 m!1383399))

(assert (=> b!1500191 m!1383399))

(declare-fun m!1383405 () Bool)

(assert (=> b!1500191 m!1383405))

(assert (=> b!1500193 m!1383399))

(assert (=> b!1500193 m!1383399))

(declare-fun m!1383407 () Bool)

(assert (=> b!1500193 m!1383407))

(declare-fun m!1383409 () Bool)

(assert (=> start!127682 m!1383409))

(declare-fun m!1383411 () Bool)

(assert (=> start!127682 m!1383411))

(declare-fun m!1383413 () Bool)

(assert (=> b!1500198 m!1383413))

(check-sat (not b!1500193) (not start!127682) (not b!1500196) (not b!1500198) (not b!1500191) (not b!1500200) (not b!1500195) (not b!1500199))
(check-sat)
