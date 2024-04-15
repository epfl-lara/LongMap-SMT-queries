; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127688 () Bool)

(assert start!127688)

(declare-fun b!1500657 () Bool)

(declare-fun res!1021929 () Bool)

(declare-fun e!839559 () Bool)

(assert (=> b!1500657 (=> (not res!1021929) (not e!839559))))

(declare-datatypes ((array!100063 0))(
  ( (array!100064 (arr!48292 (Array (_ BitVec 32) (_ BitVec 64))) (size!48844 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100063)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500657 (= res!1021929 (validKeyInArray!0 (select (arr!48292 a!2850) i!996)))))

(declare-fun b!1500658 () Bool)

(declare-fun e!839556 () Bool)

(declare-fun e!839558 () Bool)

(assert (=> b!1500658 (= e!839556 e!839558)))

(declare-fun res!1021926 () Bool)

(assert (=> b!1500658 (=> (not res!1021926) (not e!839558))))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!652768 () (_ BitVec 32))

(assert (=> b!1500658 (= res!1021926 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652768 #b00000000000000000000000000000000) (bvslt lt!652768 (size!48844 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500658 (= lt!652768 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500659 () Bool)

(declare-fun res!1021928 () Bool)

(assert (=> b!1500659 (=> (not res!1021928) (not e!839559))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500659 (= res!1021928 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48844 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48844 a!2850)) (= (select (arr!48292 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48292 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48844 a!2850))))))

(declare-fun b!1500660 () Bool)

(declare-fun res!1021931 () Bool)

(assert (=> b!1500660 (=> (not res!1021931) (not e!839559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100063 (_ BitVec 32)) Bool)

(assert (=> b!1500660 (= res!1021931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500661 () Bool)

(declare-fun res!1021921 () Bool)

(assert (=> b!1500661 (=> (not res!1021921) (not e!839559))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500661 (= res!1021921 (and (= (size!48844 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48844 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48844 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500663 () Bool)

(declare-fun res!1021924 () Bool)

(assert (=> b!1500663 (=> (not res!1021924) (not e!839559))))

(assert (=> b!1500663 (= res!1021924 (validKeyInArray!0 (select (arr!48292 a!2850) j!87)))))

(declare-fun b!1500664 () Bool)

(assert (=> b!1500664 (= e!839558 (not true))))

(declare-datatypes ((SeekEntryResult!12523 0))(
  ( (MissingZero!12523 (index!52484 (_ BitVec 32))) (Found!12523 (index!52485 (_ BitVec 32))) (Intermediate!12523 (undefined!13335 Bool) (index!52486 (_ BitVec 32)) (x!134160 (_ BitVec 32))) (Undefined!12523) (MissingVacant!12523 (index!52487 (_ BitVec 32))) )
))
(declare-fun lt!652767 () SeekEntryResult!12523)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100063 (_ BitVec 32)) SeekEntryResult!12523)

(assert (=> b!1500664 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652768 vacantAfter!10 (select (store (arr!48292 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100064 (store (arr!48292 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48844 a!2850)) mask!2661) lt!652767)))

(declare-datatypes ((Unit!50041 0))(
  ( (Unit!50042) )
))
(declare-fun lt!652766 () Unit!50041)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100063 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50041)

(assert (=> b!1500664 (= lt!652766 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!652768 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1500665 () Bool)

(declare-fun res!1021925 () Bool)

(assert (=> b!1500665 (=> (not res!1021925) (not e!839559))))

(declare-datatypes ((List!34862 0))(
  ( (Nil!34859) (Cons!34858 (h!36256 (_ BitVec 64)) (t!49548 List!34862)) )
))
(declare-fun arrayNoDuplicates!0 (array!100063 (_ BitVec 32) List!34862) Bool)

(assert (=> b!1500665 (= res!1021925 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34859))))

(declare-fun b!1500666 () Bool)

(assert (=> b!1500666 (= e!839559 e!839556)))

(declare-fun res!1021930 () Bool)

(assert (=> b!1500666 (=> (not res!1021930) (not e!839556))))

(assert (=> b!1500666 (= res!1021930 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48292 a!2850) j!87) a!2850 mask!2661) lt!652767))))

(assert (=> b!1500666 (= lt!652767 (Found!12523 j!87))))

(declare-fun b!1500667 () Bool)

(declare-fun res!1021923 () Bool)

(assert (=> b!1500667 (=> (not res!1021923) (not e!839558))))

(assert (=> b!1500667 (= res!1021923 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652768 vacantBefore!10 (select (arr!48292 a!2850) j!87) a!2850 mask!2661) lt!652767))))

(declare-fun b!1500662 () Bool)

(declare-fun res!1021927 () Bool)

(assert (=> b!1500662 (=> (not res!1021927) (not e!839556))))

(assert (=> b!1500662 (= res!1021927 (not (= (select (arr!48292 a!2850) index!625) (select (arr!48292 a!2850) j!87))))))

(declare-fun res!1021922 () Bool)

(assert (=> start!127688 (=> (not res!1021922) (not e!839559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127688 (= res!1021922 (validMask!0 mask!2661))))

(assert (=> start!127688 e!839559))

(assert (=> start!127688 true))

(declare-fun array_inv!37525 (array!100063) Bool)

(assert (=> start!127688 (array_inv!37525 a!2850)))

(assert (= (and start!127688 res!1021922) b!1500661))

(assert (= (and b!1500661 res!1021921) b!1500657))

(assert (= (and b!1500657 res!1021929) b!1500663))

(assert (= (and b!1500663 res!1021924) b!1500660))

(assert (= (and b!1500660 res!1021931) b!1500665))

(assert (= (and b!1500665 res!1021925) b!1500659))

(assert (= (and b!1500659 res!1021928) b!1500666))

(assert (= (and b!1500666 res!1021930) b!1500662))

(assert (= (and b!1500662 res!1021927) b!1500658))

(assert (= (and b!1500658 res!1021926) b!1500667))

(assert (= (and b!1500667 res!1021923) b!1500664))

(declare-fun m!1383295 () Bool)

(assert (=> b!1500658 m!1383295))

(declare-fun m!1383297 () Bool)

(assert (=> b!1500666 m!1383297))

(assert (=> b!1500666 m!1383297))

(declare-fun m!1383299 () Bool)

(assert (=> b!1500666 m!1383299))

(declare-fun m!1383301 () Bool)

(assert (=> b!1500657 m!1383301))

(assert (=> b!1500657 m!1383301))

(declare-fun m!1383303 () Bool)

(assert (=> b!1500657 m!1383303))

(declare-fun m!1383305 () Bool)

(assert (=> b!1500659 m!1383305))

(declare-fun m!1383307 () Bool)

(assert (=> b!1500659 m!1383307))

(declare-fun m!1383309 () Bool)

(assert (=> b!1500659 m!1383309))

(declare-fun m!1383311 () Bool)

(assert (=> b!1500662 m!1383311))

(assert (=> b!1500662 m!1383297))

(assert (=> b!1500667 m!1383297))

(assert (=> b!1500667 m!1383297))

(declare-fun m!1383313 () Bool)

(assert (=> b!1500667 m!1383313))

(assert (=> b!1500664 m!1383307))

(declare-fun m!1383315 () Bool)

(assert (=> b!1500664 m!1383315))

(assert (=> b!1500664 m!1383315))

(declare-fun m!1383317 () Bool)

(assert (=> b!1500664 m!1383317))

(declare-fun m!1383319 () Bool)

(assert (=> b!1500664 m!1383319))

(declare-fun m!1383321 () Bool)

(assert (=> b!1500665 m!1383321))

(declare-fun m!1383323 () Bool)

(assert (=> b!1500660 m!1383323))

(assert (=> b!1500663 m!1383297))

(assert (=> b!1500663 m!1383297))

(declare-fun m!1383325 () Bool)

(assert (=> b!1500663 m!1383325))

(declare-fun m!1383327 () Bool)

(assert (=> start!127688 m!1383327))

(declare-fun m!1383329 () Bool)

(assert (=> start!127688 m!1383329))

(check-sat (not b!1500657) (not b!1500660) (not start!127688) (not b!1500666) (not b!1500663) (not b!1500658) (not b!1500664) (not b!1500665) (not b!1500667))
(check-sat)
