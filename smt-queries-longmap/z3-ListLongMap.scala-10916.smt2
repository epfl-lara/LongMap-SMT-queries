; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128060 () Bool)

(assert start!128060)

(declare-fun b!1503207 () Bool)

(declare-fun res!1023109 () Bool)

(declare-fun e!841038 () Bool)

(assert (=> b!1503207 (=> (not res!1023109) (not e!841038))))

(declare-datatypes ((array!100255 0))(
  ( (array!100256 (arr!48382 (Array (_ BitVec 32) (_ BitVec 64))) (size!48933 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100255)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503207 (= res!1023109 (not (= (select (arr!48382 a!2850) index!625) (select (arr!48382 a!2850) j!87))))))

(declare-fun b!1503208 () Bool)

(declare-fun res!1023107 () Bool)

(declare-fun e!841040 () Bool)

(assert (=> b!1503208 (=> (not res!1023107) (not e!841040))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503208 (= res!1023107 (validKeyInArray!0 (select (arr!48382 a!2850) i!996)))))

(declare-fun b!1503209 () Bool)

(declare-fun e!841039 () Bool)

(assert (=> b!1503209 (= e!841038 e!841039)))

(declare-fun res!1023100 () Bool)

(assert (=> b!1503209 (=> (not res!1023100) (not e!841039))))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653818 () (_ BitVec 32))

(assert (=> b!1503209 (= res!1023100 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653818 #b00000000000000000000000000000000) (bvslt lt!653818 (size!48933 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503209 (= lt!653818 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1503210 () Bool)

(declare-fun res!1023104 () Bool)

(assert (=> b!1503210 (=> (not res!1023104) (not e!841040))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503210 (= res!1023104 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48933 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48933 a!2850)) (= (select (arr!48382 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48382 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48933 a!2850))))))

(declare-fun b!1503211 () Bool)

(declare-fun res!1023101 () Bool)

(assert (=> b!1503211 (=> (not res!1023101) (not e!841040))))

(assert (=> b!1503211 (= res!1023101 (and (= (size!48933 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48933 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48933 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503212 () Bool)

(assert (=> b!1503212 (= e!841040 e!841038)))

(declare-fun res!1023106 () Bool)

(assert (=> b!1503212 (=> (not res!1023106) (not e!841038))))

(declare-datatypes ((SeekEntryResult!12485 0))(
  ( (MissingZero!12485 (index!52332 (_ BitVec 32))) (Found!12485 (index!52333 (_ BitVec 32))) (Intermediate!12485 (undefined!13297 Bool) (index!52334 (_ BitVec 32)) (x!134196 (_ BitVec 32))) (Undefined!12485) (MissingVacant!12485 (index!52335 (_ BitVec 32))) )
))
(declare-fun lt!653820 () SeekEntryResult!12485)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100255 (_ BitVec 32)) SeekEntryResult!12485)

(assert (=> b!1503212 (= res!1023106 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48382 a!2850) j!87) a!2850 mask!2661) lt!653820))))

(assert (=> b!1503212 (= lt!653820 (Found!12485 j!87))))

(declare-fun b!1503213 () Bool)

(assert (=> b!1503213 (= e!841039 (not true))))

(assert (=> b!1503213 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653818 vacantAfter!10 (select (store (arr!48382 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100256 (store (arr!48382 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48933 a!2850)) mask!2661) lt!653820)))

(declare-datatypes ((Unit!50161 0))(
  ( (Unit!50162) )
))
(declare-fun lt!653819 () Unit!50161)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50161)

(assert (=> b!1503213 (= lt!653819 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653818 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1503214 () Bool)

(declare-fun res!1023110 () Bool)

(assert (=> b!1503214 (=> (not res!1023110) (not e!841040))))

(assert (=> b!1503214 (= res!1023110 (validKeyInArray!0 (select (arr!48382 a!2850) j!87)))))

(declare-fun b!1503216 () Bool)

(declare-fun res!1023108 () Bool)

(assert (=> b!1503216 (=> (not res!1023108) (not e!841039))))

(assert (=> b!1503216 (= res!1023108 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653818 vacantBefore!10 (select (arr!48382 a!2850) j!87) a!2850 mask!2661) lt!653820))))

(declare-fun b!1503217 () Bool)

(declare-fun res!1023102 () Bool)

(assert (=> b!1503217 (=> (not res!1023102) (not e!841040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100255 (_ BitVec 32)) Bool)

(assert (=> b!1503217 (= res!1023102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1023105 () Bool)

(assert (=> start!128060 (=> (not res!1023105) (not e!841040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128060 (= res!1023105 (validMask!0 mask!2661))))

(assert (=> start!128060 e!841040))

(assert (=> start!128060 true))

(declare-fun array_inv!37663 (array!100255) Bool)

(assert (=> start!128060 (array_inv!37663 a!2850)))

(declare-fun b!1503215 () Bool)

(declare-fun res!1023103 () Bool)

(assert (=> b!1503215 (=> (not res!1023103) (not e!841040))))

(declare-datatypes ((List!34861 0))(
  ( (Nil!34858) (Cons!34857 (h!36269 (_ BitVec 64)) (t!49547 List!34861)) )
))
(declare-fun arrayNoDuplicates!0 (array!100255 (_ BitVec 32) List!34861) Bool)

(assert (=> b!1503215 (= res!1023103 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34858))))

(assert (= (and start!128060 res!1023105) b!1503211))

(assert (= (and b!1503211 res!1023101) b!1503208))

(assert (= (and b!1503208 res!1023107) b!1503214))

(assert (= (and b!1503214 res!1023110) b!1503217))

(assert (= (and b!1503217 res!1023102) b!1503215))

(assert (= (and b!1503215 res!1023103) b!1503210))

(assert (= (and b!1503210 res!1023104) b!1503212))

(assert (= (and b!1503212 res!1023106) b!1503207))

(assert (= (and b!1503207 res!1023109) b!1503209))

(assert (= (and b!1503209 res!1023100) b!1503216))

(assert (= (and b!1503216 res!1023108) b!1503213))

(declare-fun m!1386385 () Bool)

(assert (=> b!1503215 m!1386385))

(declare-fun m!1386387 () Bool)

(assert (=> b!1503213 m!1386387))

(declare-fun m!1386389 () Bool)

(assert (=> b!1503213 m!1386389))

(assert (=> b!1503213 m!1386389))

(declare-fun m!1386391 () Bool)

(assert (=> b!1503213 m!1386391))

(declare-fun m!1386393 () Bool)

(assert (=> b!1503213 m!1386393))

(declare-fun m!1386395 () Bool)

(assert (=> b!1503217 m!1386395))

(declare-fun m!1386397 () Bool)

(assert (=> b!1503214 m!1386397))

(assert (=> b!1503214 m!1386397))

(declare-fun m!1386399 () Bool)

(assert (=> b!1503214 m!1386399))

(declare-fun m!1386401 () Bool)

(assert (=> b!1503207 m!1386401))

(assert (=> b!1503207 m!1386397))

(declare-fun m!1386403 () Bool)

(assert (=> b!1503209 m!1386403))

(assert (=> b!1503216 m!1386397))

(assert (=> b!1503216 m!1386397))

(declare-fun m!1386405 () Bool)

(assert (=> b!1503216 m!1386405))

(declare-fun m!1386407 () Bool)

(assert (=> start!128060 m!1386407))

(declare-fun m!1386409 () Bool)

(assert (=> start!128060 m!1386409))

(declare-fun m!1386411 () Bool)

(assert (=> b!1503208 m!1386411))

(assert (=> b!1503208 m!1386411))

(declare-fun m!1386413 () Bool)

(assert (=> b!1503208 m!1386413))

(assert (=> b!1503212 m!1386397))

(assert (=> b!1503212 m!1386397))

(declare-fun m!1386415 () Bool)

(assert (=> b!1503212 m!1386415))

(declare-fun m!1386417 () Bool)

(assert (=> b!1503210 m!1386417))

(assert (=> b!1503210 m!1386387))

(declare-fun m!1386419 () Bool)

(assert (=> b!1503210 m!1386419))

(check-sat (not b!1503215) (not b!1503217) (not b!1503214) (not b!1503208) (not b!1503212) (not b!1503213) (not b!1503209) (not b!1503216) (not start!128060))
(check-sat)
