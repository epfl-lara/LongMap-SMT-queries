; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127712 () Bool)

(assert start!127712)

(declare-fun b!1501053 () Bool)

(declare-fun res!1022324 () Bool)

(declare-fun e!839702 () Bool)

(assert (=> b!1501053 (=> (not res!1022324) (not e!839702))))

(declare-datatypes ((array!100087 0))(
  ( (array!100088 (arr!48304 (Array (_ BitVec 32) (_ BitVec 64))) (size!48856 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100087)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501053 (= res!1022324 (validKeyInArray!0 (select (arr!48304 a!2850) i!996)))))

(declare-fun b!1501055 () Bool)

(declare-fun e!839703 () Bool)

(assert (=> b!1501055 (= e!839703 (not true))))

(declare-fun lt!652874 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12535 0))(
  ( (MissingZero!12535 (index!52532 (_ BitVec 32))) (Found!12535 (index!52533 (_ BitVec 32))) (Intermediate!12535 (undefined!13347 Bool) (index!52534 (_ BitVec 32)) (x!134204 (_ BitVec 32))) (Undefined!12535) (MissingVacant!12535 (index!52535 (_ BitVec 32))) )
))
(declare-fun lt!652875 () SeekEntryResult!12535)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100087 (_ BitVec 32)) SeekEntryResult!12535)

(assert (=> b!1501055 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652874 vacantAfter!10 (select (store (arr!48304 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100088 (store (arr!48304 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48856 a!2850)) mask!2661) lt!652875)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((Unit!50065 0))(
  ( (Unit!50066) )
))
(declare-fun lt!652876 () Unit!50065)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100087 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50065)

(assert (=> b!1501055 (= lt!652876 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!652874 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501056 () Bool)

(declare-fun e!839700 () Bool)

(assert (=> b!1501056 (= e!839700 e!839703)))

(declare-fun res!1022323 () Bool)

(assert (=> b!1501056 (=> (not res!1022323) (not e!839703))))

(assert (=> b!1501056 (= res!1022323 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652874 #b00000000000000000000000000000000) (bvslt lt!652874 (size!48856 a!2850))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501056 (= lt!652874 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501057 () Bool)

(declare-fun res!1022317 () Bool)

(assert (=> b!1501057 (=> (not res!1022317) (not e!839702))))

(declare-datatypes ((List!34874 0))(
  ( (Nil!34871) (Cons!34870 (h!36268 (_ BitVec 64)) (t!49560 List!34874)) )
))
(declare-fun arrayNoDuplicates!0 (array!100087 (_ BitVec 32) List!34874) Bool)

(assert (=> b!1501057 (= res!1022317 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34871))))

(declare-fun b!1501058 () Bool)

(declare-fun res!1022319 () Bool)

(assert (=> b!1501058 (=> (not res!1022319) (not e!839700))))

(assert (=> b!1501058 (= res!1022319 (not (= (select (arr!48304 a!2850) index!625) (select (arr!48304 a!2850) j!87))))))

(declare-fun res!1022325 () Bool)

(assert (=> start!127712 (=> (not res!1022325) (not e!839702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127712 (= res!1022325 (validMask!0 mask!2661))))

(assert (=> start!127712 e!839702))

(assert (=> start!127712 true))

(declare-fun array_inv!37537 (array!100087) Bool)

(assert (=> start!127712 (array_inv!37537 a!2850)))

(declare-fun b!1501054 () Bool)

(declare-fun res!1022327 () Bool)

(assert (=> b!1501054 (=> (not res!1022327) (not e!839702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100087 (_ BitVec 32)) Bool)

(assert (=> b!1501054 (= res!1022327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501059 () Bool)

(declare-fun res!1022322 () Bool)

(assert (=> b!1501059 (=> (not res!1022322) (not e!839703))))

(assert (=> b!1501059 (= res!1022322 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652874 vacantBefore!10 (select (arr!48304 a!2850) j!87) a!2850 mask!2661) lt!652875))))

(declare-fun b!1501060 () Bool)

(declare-fun res!1022320 () Bool)

(assert (=> b!1501060 (=> (not res!1022320) (not e!839702))))

(assert (=> b!1501060 (= res!1022320 (and (= (size!48856 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48856 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48856 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501061 () Bool)

(declare-fun res!1022318 () Bool)

(assert (=> b!1501061 (=> (not res!1022318) (not e!839702))))

(assert (=> b!1501061 (= res!1022318 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48856 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48856 a!2850)) (= (select (arr!48304 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48304 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48856 a!2850))))))

(declare-fun b!1501062 () Bool)

(assert (=> b!1501062 (= e!839702 e!839700)))

(declare-fun res!1022321 () Bool)

(assert (=> b!1501062 (=> (not res!1022321) (not e!839700))))

(assert (=> b!1501062 (= res!1022321 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48304 a!2850) j!87) a!2850 mask!2661) lt!652875))))

(assert (=> b!1501062 (= lt!652875 (Found!12535 j!87))))

(declare-fun b!1501063 () Bool)

(declare-fun res!1022326 () Bool)

(assert (=> b!1501063 (=> (not res!1022326) (not e!839702))))

(assert (=> b!1501063 (= res!1022326 (validKeyInArray!0 (select (arr!48304 a!2850) j!87)))))

(assert (= (and start!127712 res!1022325) b!1501060))

(assert (= (and b!1501060 res!1022320) b!1501053))

(assert (= (and b!1501053 res!1022324) b!1501063))

(assert (= (and b!1501063 res!1022326) b!1501054))

(assert (= (and b!1501054 res!1022327) b!1501057))

(assert (= (and b!1501057 res!1022317) b!1501061))

(assert (= (and b!1501061 res!1022318) b!1501062))

(assert (= (and b!1501062 res!1022321) b!1501058))

(assert (= (and b!1501058 res!1022319) b!1501056))

(assert (= (and b!1501056 res!1022323) b!1501059))

(assert (= (and b!1501059 res!1022322) b!1501055))

(declare-fun m!1383727 () Bool)

(assert (=> b!1501061 m!1383727))

(declare-fun m!1383729 () Bool)

(assert (=> b!1501061 m!1383729))

(declare-fun m!1383731 () Bool)

(assert (=> b!1501061 m!1383731))

(declare-fun m!1383733 () Bool)

(assert (=> b!1501063 m!1383733))

(assert (=> b!1501063 m!1383733))

(declare-fun m!1383735 () Bool)

(assert (=> b!1501063 m!1383735))

(declare-fun m!1383737 () Bool)

(assert (=> b!1501056 m!1383737))

(declare-fun m!1383739 () Bool)

(assert (=> b!1501057 m!1383739))

(declare-fun m!1383741 () Bool)

(assert (=> b!1501054 m!1383741))

(assert (=> b!1501062 m!1383733))

(assert (=> b!1501062 m!1383733))

(declare-fun m!1383743 () Bool)

(assert (=> b!1501062 m!1383743))

(assert (=> b!1501055 m!1383729))

(declare-fun m!1383745 () Bool)

(assert (=> b!1501055 m!1383745))

(assert (=> b!1501055 m!1383745))

(declare-fun m!1383747 () Bool)

(assert (=> b!1501055 m!1383747))

(declare-fun m!1383749 () Bool)

(assert (=> b!1501055 m!1383749))

(declare-fun m!1383751 () Bool)

(assert (=> start!127712 m!1383751))

(declare-fun m!1383753 () Bool)

(assert (=> start!127712 m!1383753))

(assert (=> b!1501059 m!1383733))

(assert (=> b!1501059 m!1383733))

(declare-fun m!1383755 () Bool)

(assert (=> b!1501059 m!1383755))

(declare-fun m!1383757 () Bool)

(assert (=> b!1501058 m!1383757))

(assert (=> b!1501058 m!1383733))

(declare-fun m!1383759 () Bool)

(assert (=> b!1501053 m!1383759))

(assert (=> b!1501053 m!1383759))

(declare-fun m!1383761 () Bool)

(assert (=> b!1501053 m!1383761))

(check-sat (not b!1501056) (not b!1501057) (not b!1501054) (not b!1501059) (not b!1501062) (not b!1501055) (not b!1501063) (not start!127712) (not b!1501053))
(check-sat)
