; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127574 () Bool)

(assert start!127574)

(declare-fun b!1498945 () Bool)

(declare-fun res!1020213 () Bool)

(declare-fun e!839041 () Bool)

(assert (=> b!1498945 (=> (not res!1020213) (not e!839041))))

(declare-datatypes ((array!99949 0))(
  ( (array!99950 (arr!48235 (Array (_ BitVec 32) (_ BitVec 64))) (size!48787 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99949)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498945 (= res!1020213 (validKeyInArray!0 (select (arr!48235 a!2850) j!87)))))

(declare-fun b!1498946 () Bool)

(declare-fun res!1020218 () Bool)

(assert (=> b!1498946 (=> (not res!1020218) (not e!839041))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1498946 (= res!1020218 (not (= (select (arr!48235 a!2850) index!625) (select (arr!48235 a!2850) j!87))))))

(declare-fun b!1498947 () Bool)

(declare-fun res!1020210 () Bool)

(assert (=> b!1498947 (=> (not res!1020210) (not e!839041))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498947 (= res!1020210 (and (= (size!48787 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48787 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48787 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498948 () Bool)

(declare-fun res!1020216 () Bool)

(assert (=> b!1498948 (=> (not res!1020216) (not e!839041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99949 (_ BitVec 32)) Bool)

(assert (=> b!1498948 (= res!1020216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498949 () Bool)

(declare-fun res!1020212 () Bool)

(assert (=> b!1498949 (=> (not res!1020212) (not e!839041))))

(declare-datatypes ((List!34805 0))(
  ( (Nil!34802) (Cons!34801 (h!36199 (_ BitVec 64)) (t!49491 List!34805)) )
))
(declare-fun arrayNoDuplicates!0 (array!99949 (_ BitVec 32) List!34805) Bool)

(assert (=> b!1498949 (= res!1020212 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34802))))

(declare-fun b!1498950 () Bool)

(declare-fun res!1020215 () Bool)

(assert (=> b!1498950 (=> (not res!1020215) (not e!839041))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498950 (= res!1020215 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48787 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48787 a!2850)) (= (select (arr!48235 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48235 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48787 a!2850))))))

(declare-fun b!1498951 () Bool)

(declare-fun res!1020211 () Bool)

(assert (=> b!1498951 (=> (not res!1020211) (not e!839041))))

(assert (=> b!1498951 (= res!1020211 (validKeyInArray!0 (select (arr!48235 a!2850) i!996)))))

(declare-fun b!1498952 () Bool)

(declare-fun e!839043 () Bool)

(assert (=> b!1498952 (= e!839041 e!839043)))

(declare-fun res!1020209 () Bool)

(assert (=> b!1498952 (=> (not res!1020209) (not e!839043))))

(declare-fun lt!652422 () (_ BitVec 32))

(assert (=> b!1498952 (= res!1020209 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652422 #b00000000000000000000000000000000) (bvslt lt!652422 (size!48787 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1498952 (= lt!652422 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1498954 () Bool)

(assert (=> b!1498954 (= e!839043 false)))

(declare-datatypes ((SeekEntryResult!12466 0))(
  ( (MissingZero!12466 (index!52256 (_ BitVec 32))) (Found!12466 (index!52257 (_ BitVec 32))) (Intermediate!12466 (undefined!13278 Bool) (index!52258 (_ BitVec 32)) (x!133951 (_ BitVec 32))) (Undefined!12466) (MissingVacant!12466 (index!52259 (_ BitVec 32))) )
))
(declare-fun lt!652423 () SeekEntryResult!12466)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99949 (_ BitVec 32)) SeekEntryResult!12466)

(assert (=> b!1498954 (= lt!652423 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652422 vacantBefore!10 (select (arr!48235 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1498953 () Bool)

(declare-fun res!1020217 () Bool)

(assert (=> b!1498953 (=> (not res!1020217) (not e!839041))))

(assert (=> b!1498953 (= res!1020217 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48235 a!2850) j!87) a!2850 mask!2661) (Found!12466 j!87)))))

(declare-fun res!1020214 () Bool)

(assert (=> start!127574 (=> (not res!1020214) (not e!839041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127574 (= res!1020214 (validMask!0 mask!2661))))

(assert (=> start!127574 e!839041))

(assert (=> start!127574 true))

(declare-fun array_inv!37468 (array!99949) Bool)

(assert (=> start!127574 (array_inv!37468 a!2850)))

(assert (= (and start!127574 res!1020214) b!1498947))

(assert (= (and b!1498947 res!1020210) b!1498951))

(assert (= (and b!1498951 res!1020211) b!1498945))

(assert (= (and b!1498945 res!1020213) b!1498948))

(assert (= (and b!1498948 res!1020216) b!1498949))

(assert (= (and b!1498949 res!1020212) b!1498950))

(assert (= (and b!1498950 res!1020215) b!1498953))

(assert (= (and b!1498953 res!1020217) b!1498946))

(assert (= (and b!1498946 res!1020218) b!1498952))

(assert (= (and b!1498952 res!1020209) b!1498954))

(declare-fun m!1381585 () Bool)

(assert (=> b!1498953 m!1381585))

(assert (=> b!1498953 m!1381585))

(declare-fun m!1381587 () Bool)

(assert (=> b!1498953 m!1381587))

(declare-fun m!1381589 () Bool)

(assert (=> b!1498948 m!1381589))

(declare-fun m!1381591 () Bool)

(assert (=> b!1498951 m!1381591))

(assert (=> b!1498951 m!1381591))

(declare-fun m!1381593 () Bool)

(assert (=> b!1498951 m!1381593))

(declare-fun m!1381595 () Bool)

(assert (=> b!1498952 m!1381595))

(assert (=> b!1498945 m!1381585))

(assert (=> b!1498945 m!1381585))

(declare-fun m!1381597 () Bool)

(assert (=> b!1498945 m!1381597))

(declare-fun m!1381599 () Bool)

(assert (=> b!1498949 m!1381599))

(declare-fun m!1381601 () Bool)

(assert (=> start!127574 m!1381601))

(declare-fun m!1381603 () Bool)

(assert (=> start!127574 m!1381603))

(assert (=> b!1498954 m!1381585))

(assert (=> b!1498954 m!1381585))

(declare-fun m!1381605 () Bool)

(assert (=> b!1498954 m!1381605))

(declare-fun m!1381607 () Bool)

(assert (=> b!1498946 m!1381607))

(assert (=> b!1498946 m!1381585))

(declare-fun m!1381609 () Bool)

(assert (=> b!1498950 m!1381609))

(declare-fun m!1381611 () Bool)

(assert (=> b!1498950 m!1381611))

(declare-fun m!1381613 () Bool)

(assert (=> b!1498950 m!1381613))

(check-sat (not b!1498951) (not b!1498952) (not start!127574) (not b!1498949) (not b!1498945) (not b!1498954) (not b!1498953) (not b!1498948))
(check-sat)
