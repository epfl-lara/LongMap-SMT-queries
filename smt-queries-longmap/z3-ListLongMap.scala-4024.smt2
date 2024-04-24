; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54900 () Bool)

(assert start!54900)

(declare-fun res!384426 () Bool)

(declare-fun e!342775 () Bool)

(assert (=> start!54900 (=> (not res!384426) (not e!342775))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54900 (= res!384426 (validMask!0 mask!3053))))

(assert (=> start!54900 e!342775))

(assert (=> start!54900 true))

(declare-datatypes ((array!37080 0))(
  ( (array!37081 (arr!17797 (Array (_ BitVec 32) (_ BitVec 64))) (size!18161 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37080)

(declare-fun array_inv!13656 (array!37080) Bool)

(assert (=> start!54900 (array_inv!13656 a!2986)))

(declare-fun b!599536 () Bool)

(declare-fun e!342768 () Bool)

(declare-datatypes ((SeekEntryResult!6193 0))(
  ( (MissingZero!6193 (index!27029 (_ BitVec 32))) (Found!6193 (index!27030 (_ BitVec 32))) (Intermediate!6193 (undefined!7005 Bool) (index!27031 (_ BitVec 32)) (x!55987 (_ BitVec 32))) (Undefined!6193) (MissingVacant!6193 (index!27032 (_ BitVec 32))) )
))
(declare-fun lt!272535 () SeekEntryResult!6193)

(declare-fun lt!272526 () SeekEntryResult!6193)

(assert (=> b!599536 (= e!342768 (= lt!272535 lt!272526))))

(declare-fun b!599537 () Bool)

(declare-fun e!342776 () Bool)

(declare-fun e!342769 () Bool)

(assert (=> b!599537 (= e!342776 e!342769)))

(declare-fun res!384420 () Bool)

(assert (=> b!599537 (=> (not res!384420) (not e!342769))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!599537 (= res!384420 (and (= lt!272535 (Found!6193 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17797 a!2986) index!984) (select (arr!17797 a!2986) j!136))) (not (= (select (arr!17797 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37080 (_ BitVec 32)) SeekEntryResult!6193)

(assert (=> b!599537 (= lt!272535 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17797 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599538 () Bool)

(declare-datatypes ((Unit!18865 0))(
  ( (Unit!18866) )
))
(declare-fun e!342772 () Unit!18865)

(declare-fun Unit!18867 () Unit!18865)

(assert (=> b!599538 (= e!342772 Unit!18867)))

(assert (=> b!599538 false))

(declare-fun b!599539 () Bool)

(declare-fun e!342766 () Bool)

(assert (=> b!599539 (= e!342769 (not e!342766))))

(declare-fun res!384434 () Bool)

(assert (=> b!599539 (=> res!384434 e!342766)))

(declare-fun lt!272532 () SeekEntryResult!6193)

(assert (=> b!599539 (= res!384434 (not (= lt!272532 (Found!6193 index!984))))))

(declare-fun lt!272528 () Unit!18865)

(assert (=> b!599539 (= lt!272528 e!342772)))

(declare-fun c!67928 () Bool)

(assert (=> b!599539 (= c!67928 (= lt!272532 Undefined!6193))))

(declare-fun lt!272537 () (_ BitVec 64))

(declare-fun lt!272538 () array!37080)

(assert (=> b!599539 (= lt!272532 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272537 lt!272538 mask!3053))))

(assert (=> b!599539 e!342768))

(declare-fun res!384432 () Bool)

(assert (=> b!599539 (=> (not res!384432) (not e!342768))))

(declare-fun lt!272536 () (_ BitVec 32))

(assert (=> b!599539 (= res!384432 (= lt!272526 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272536 vacantSpotIndex!68 lt!272537 lt!272538 mask!3053)))))

(assert (=> b!599539 (= lt!272526 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272536 vacantSpotIndex!68 (select (arr!17797 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!599539 (= lt!272537 (select (store (arr!17797 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272533 () Unit!18865)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37080 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18865)

(assert (=> b!599539 (= lt!272533 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272536 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599539 (= lt!272536 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!599540 () Bool)

(declare-fun e!342765 () Bool)

(declare-fun e!342773 () Bool)

(assert (=> b!599540 (= e!342765 e!342773)))

(declare-fun res!384436 () Bool)

(assert (=> b!599540 (=> (not res!384436) (not e!342773))))

(declare-fun arrayContainsKey!0 (array!37080 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599540 (= res!384436 (arrayContainsKey!0 lt!272538 (select (arr!17797 a!2986) j!136) j!136))))

(declare-fun b!599541 () Bool)

(declare-fun res!384417 () Bool)

(declare-fun e!342777 () Bool)

(assert (=> b!599541 (=> (not res!384417) (not e!342777))))

(assert (=> b!599541 (= res!384417 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17797 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599542 () Bool)

(declare-fun e!342770 () Bool)

(assert (=> b!599542 (= e!342770 e!342765)))

(declare-fun res!384424 () Bool)

(assert (=> b!599542 (=> res!384424 e!342765)))

(declare-fun lt!272530 () (_ BitVec 64))

(assert (=> b!599542 (= res!384424 (or (not (= (select (arr!17797 a!2986) j!136) lt!272537)) (not (= (select (arr!17797 a!2986) j!136) lt!272530)) (bvsge j!136 index!984)))))

(declare-fun b!599543 () Bool)

(assert (=> b!599543 (= e!342775 e!342777)))

(declare-fun res!384433 () Bool)

(assert (=> b!599543 (=> (not res!384433) (not e!342777))))

(declare-fun lt!272529 () SeekEntryResult!6193)

(assert (=> b!599543 (= res!384433 (or (= lt!272529 (MissingZero!6193 i!1108)) (= lt!272529 (MissingVacant!6193 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37080 (_ BitVec 32)) SeekEntryResult!6193)

(assert (=> b!599543 (= lt!272529 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!599544 () Bool)

(declare-fun e!342771 () Bool)

(assert (=> b!599544 (= e!342771 true)))

(declare-fun lt!272534 () Bool)

(declare-datatypes ((List!11745 0))(
  ( (Nil!11742) (Cons!11741 (h!12789 (_ BitVec 64)) (t!17965 List!11745)) )
))
(declare-fun contains!2935 (List!11745 (_ BitVec 64)) Bool)

(assert (=> b!599544 (= lt!272534 (contains!2935 Nil!11742 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599545 () Bool)

(declare-fun Unit!18868 () Unit!18865)

(assert (=> b!599545 (= e!342772 Unit!18868)))

(declare-fun b!599546 () Bool)

(declare-fun res!384435 () Bool)

(assert (=> b!599546 (=> res!384435 e!342771)))

(assert (=> b!599546 (= res!384435 (contains!2935 Nil!11742 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599547 () Bool)

(declare-fun res!384430 () Bool)

(assert (=> b!599547 (=> (not res!384430) (not e!342775))))

(assert (=> b!599547 (= res!384430 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599548 () Bool)

(assert (=> b!599548 (= e!342777 e!342776)))

(declare-fun res!384422 () Bool)

(assert (=> b!599548 (=> (not res!384422) (not e!342776))))

(assert (=> b!599548 (= res!384422 (= (select (store (arr!17797 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599548 (= lt!272538 (array!37081 (store (arr!17797 a!2986) i!1108 k0!1786) (size!18161 a!2986)))))

(declare-fun b!599549 () Bool)

(declare-fun e!342767 () Bool)

(assert (=> b!599549 (= e!342766 e!342767)))

(declare-fun res!384419 () Bool)

(assert (=> b!599549 (=> res!384419 e!342767)))

(assert (=> b!599549 (= res!384419 (or (not (= (select (arr!17797 a!2986) j!136) lt!272537)) (not (= (select (arr!17797 a!2986) j!136) lt!272530)) (bvsge j!136 index!984)))))

(assert (=> b!599549 e!342770))

(declare-fun res!384431 () Bool)

(assert (=> b!599549 (=> (not res!384431) (not e!342770))))

(assert (=> b!599549 (= res!384431 (= lt!272530 (select (arr!17797 a!2986) j!136)))))

(assert (=> b!599549 (= lt!272530 (select (store (arr!17797 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!599550 () Bool)

(assert (=> b!599550 (= e!342767 e!342771)))

(declare-fun res!384423 () Bool)

(assert (=> b!599550 (=> res!384423 e!342771)))

(assert (=> b!599550 (= res!384423 (or (bvsge (size!18161 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18161 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37080 (_ BitVec 32) List!11745) Bool)

(assert (=> b!599550 (arrayNoDuplicates!0 lt!272538 j!136 Nil!11742)))

(declare-fun lt!272527 () Unit!18865)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37080 (_ BitVec 32) (_ BitVec 32)) Unit!18865)

(assert (=> b!599550 (= lt!272527 (lemmaNoDuplicateFromThenFromBigger!0 lt!272538 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599550 (arrayNoDuplicates!0 lt!272538 #b00000000000000000000000000000000 Nil!11742)))

(declare-fun lt!272539 () Unit!18865)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37080 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11745) Unit!18865)

(assert (=> b!599550 (= lt!272539 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11742))))

(assert (=> b!599550 (arrayContainsKey!0 lt!272538 (select (arr!17797 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272531 () Unit!18865)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37080 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18865)

(assert (=> b!599550 (= lt!272531 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272538 (select (arr!17797 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599551 () Bool)

(declare-fun res!384429 () Bool)

(assert (=> b!599551 (=> (not res!384429) (not e!342775))))

(assert (=> b!599551 (= res!384429 (and (= (size!18161 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18161 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18161 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599552 () Bool)

(declare-fun res!384428 () Bool)

(assert (=> b!599552 (=> res!384428 e!342771)))

(declare-fun noDuplicate!280 (List!11745) Bool)

(assert (=> b!599552 (= res!384428 (not (noDuplicate!280 Nil!11742)))))

(declare-fun b!599553 () Bool)

(declare-fun res!384421 () Bool)

(assert (=> b!599553 (=> (not res!384421) (not e!342775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599553 (= res!384421 (validKeyInArray!0 (select (arr!17797 a!2986) j!136)))))

(declare-fun b!599554 () Bool)

(declare-fun res!384425 () Bool)

(assert (=> b!599554 (=> (not res!384425) (not e!342775))))

(assert (=> b!599554 (= res!384425 (validKeyInArray!0 k0!1786))))

(declare-fun b!599555 () Bool)

(declare-fun res!384427 () Bool)

(assert (=> b!599555 (=> (not res!384427) (not e!342777))))

(assert (=> b!599555 (= res!384427 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11742))))

(declare-fun b!599556 () Bool)

(declare-fun res!384418 () Bool)

(assert (=> b!599556 (=> (not res!384418) (not e!342777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37080 (_ BitVec 32)) Bool)

(assert (=> b!599556 (= res!384418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599557 () Bool)

(assert (=> b!599557 (= e!342773 (arrayContainsKey!0 lt!272538 (select (arr!17797 a!2986) j!136) index!984))))

(assert (= (and start!54900 res!384426) b!599551))

(assert (= (and b!599551 res!384429) b!599553))

(assert (= (and b!599553 res!384421) b!599554))

(assert (= (and b!599554 res!384425) b!599547))

(assert (= (and b!599547 res!384430) b!599543))

(assert (= (and b!599543 res!384433) b!599556))

(assert (= (and b!599556 res!384418) b!599555))

(assert (= (and b!599555 res!384427) b!599541))

(assert (= (and b!599541 res!384417) b!599548))

(assert (= (and b!599548 res!384422) b!599537))

(assert (= (and b!599537 res!384420) b!599539))

(assert (= (and b!599539 res!384432) b!599536))

(assert (= (and b!599539 c!67928) b!599538))

(assert (= (and b!599539 (not c!67928)) b!599545))

(assert (= (and b!599539 (not res!384434)) b!599549))

(assert (= (and b!599549 res!384431) b!599542))

(assert (= (and b!599542 (not res!384424)) b!599540))

(assert (= (and b!599540 res!384436) b!599557))

(assert (= (and b!599549 (not res!384419)) b!599550))

(assert (= (and b!599550 (not res!384423)) b!599552))

(assert (= (and b!599552 (not res!384428)) b!599546))

(assert (= (and b!599546 (not res!384435)) b!599544))

(declare-fun m!577013 () Bool)

(assert (=> b!599541 m!577013))

(declare-fun m!577015 () Bool)

(assert (=> b!599555 m!577015))

(declare-fun m!577017 () Bool)

(assert (=> b!599537 m!577017))

(declare-fun m!577019 () Bool)

(assert (=> b!599537 m!577019))

(assert (=> b!599537 m!577019))

(declare-fun m!577021 () Bool)

(assert (=> b!599537 m!577021))

(declare-fun m!577023 () Bool)

(assert (=> b!599552 m!577023))

(assert (=> b!599549 m!577019))

(declare-fun m!577025 () Bool)

(assert (=> b!599549 m!577025))

(declare-fun m!577027 () Bool)

(assert (=> b!599549 m!577027))

(assert (=> b!599557 m!577019))

(assert (=> b!599557 m!577019))

(declare-fun m!577029 () Bool)

(assert (=> b!599557 m!577029))

(assert (=> b!599548 m!577025))

(declare-fun m!577031 () Bool)

(assert (=> b!599548 m!577031))

(assert (=> b!599540 m!577019))

(assert (=> b!599540 m!577019))

(declare-fun m!577033 () Bool)

(assert (=> b!599540 m!577033))

(declare-fun m!577035 () Bool)

(assert (=> b!599544 m!577035))

(declare-fun m!577037 () Bool)

(assert (=> b!599556 m!577037))

(declare-fun m!577039 () Bool)

(assert (=> start!54900 m!577039))

(declare-fun m!577041 () Bool)

(assert (=> start!54900 m!577041))

(declare-fun m!577043 () Bool)

(assert (=> b!599554 m!577043))

(assert (=> b!599550 m!577019))

(declare-fun m!577045 () Bool)

(assert (=> b!599550 m!577045))

(declare-fun m!577047 () Bool)

(assert (=> b!599550 m!577047))

(assert (=> b!599550 m!577019))

(declare-fun m!577049 () Bool)

(assert (=> b!599550 m!577049))

(assert (=> b!599550 m!577019))

(declare-fun m!577051 () Bool)

(assert (=> b!599550 m!577051))

(declare-fun m!577053 () Bool)

(assert (=> b!599550 m!577053))

(declare-fun m!577055 () Bool)

(assert (=> b!599550 m!577055))

(declare-fun m!577057 () Bool)

(assert (=> b!599543 m!577057))

(assert (=> b!599542 m!577019))

(declare-fun m!577059 () Bool)

(assert (=> b!599539 m!577059))

(declare-fun m!577061 () Bool)

(assert (=> b!599539 m!577061))

(assert (=> b!599539 m!577019))

(assert (=> b!599539 m!577025))

(declare-fun m!577063 () Bool)

(assert (=> b!599539 m!577063))

(declare-fun m!577065 () Bool)

(assert (=> b!599539 m!577065))

(assert (=> b!599539 m!577019))

(declare-fun m!577067 () Bool)

(assert (=> b!599539 m!577067))

(declare-fun m!577069 () Bool)

(assert (=> b!599539 m!577069))

(declare-fun m!577071 () Bool)

(assert (=> b!599547 m!577071))

(declare-fun m!577073 () Bool)

(assert (=> b!599546 m!577073))

(assert (=> b!599553 m!577019))

(assert (=> b!599553 m!577019))

(declare-fun m!577075 () Bool)

(assert (=> b!599553 m!577075))

(check-sat (not b!599540) (not b!599546) (not b!599537) (not b!599539) (not b!599547) (not start!54900) (not b!599543) (not b!599550) (not b!599553) (not b!599544) (not b!599556) (not b!599554) (not b!599557) (not b!599555) (not b!599552))
(check-sat)
