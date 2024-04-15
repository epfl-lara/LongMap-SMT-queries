; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54816 () Bool)

(assert start!54816)

(declare-fun b!598537 () Bool)

(declare-fun e!342143 () Bool)

(declare-fun e!342141 () Bool)

(assert (=> b!598537 (= e!342143 e!342141)))

(declare-fun res!383720 () Bool)

(assert (=> b!598537 (=> (not res!383720) (not e!342141))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37065 0))(
  ( (array!37066 (arr!17792 (Array (_ BitVec 32) (_ BitVec 64))) (size!18157 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37065)

(declare-datatypes ((SeekEntryResult!6229 0))(
  ( (MissingZero!6229 (index!27173 (_ BitVec 32))) (Found!6229 (index!27174 (_ BitVec 32))) (Intermediate!6229 (undefined!7041 Bool) (index!27175 (_ BitVec 32)) (x!55991 (_ BitVec 32))) (Undefined!6229) (MissingVacant!6229 (index!27176 (_ BitVec 32))) )
))
(declare-fun lt!271868 () SeekEntryResult!6229)

(assert (=> b!598537 (= res!383720 (and (= lt!271868 (Found!6229 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17792 a!2986) index!984) (select (arr!17792 a!2986) j!136))) (not (= (select (arr!17792 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37065 (_ BitVec 32)) SeekEntryResult!6229)

(assert (=> b!598537 (= lt!271868 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17792 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598538 () Bool)

(declare-fun e!342138 () Bool)

(declare-fun e!342146 () Bool)

(assert (=> b!598538 (= e!342138 e!342146)))

(declare-fun res!383734 () Bool)

(assert (=> b!598538 (=> res!383734 e!342146)))

(declare-fun lt!271864 () (_ BitVec 64))

(declare-fun lt!271863 () (_ BitVec 64))

(assert (=> b!598538 (= res!383734 (or (not (= (select (arr!17792 a!2986) j!136) lt!271864)) (not (= (select (arr!17792 a!2986) j!136) lt!271863)) (bvsge j!136 index!984)))))

(declare-fun b!598539 () Bool)

(declare-fun e!342140 () Bool)

(declare-fun e!342145 () Bool)

(assert (=> b!598539 (= e!342140 e!342145)))

(declare-fun res!383726 () Bool)

(assert (=> b!598539 (=> res!383726 e!342145)))

(assert (=> b!598539 (= res!383726 (or (not (= (select (arr!17792 a!2986) j!136) lt!271864)) (not (= (select (arr!17792 a!2986) j!136) lt!271863)) (bvsge j!136 index!984)))))

(assert (=> b!598539 e!342138))

(declare-fun res!383731 () Bool)

(assert (=> b!598539 (=> (not res!383731) (not e!342138))))

(assert (=> b!598539 (= res!383731 (= lt!271863 (select (arr!17792 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!598539 (= lt!271863 (select (store (arr!17792 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!598540 () Bool)

(declare-fun res!383735 () Bool)

(declare-fun e!342139 () Bool)

(assert (=> b!598540 (=> (not res!383735) (not e!342139))))

(declare-datatypes ((List!11872 0))(
  ( (Nil!11869) (Cons!11868 (h!12913 (_ BitVec 64)) (t!18091 List!11872)) )
))
(declare-fun arrayNoDuplicates!0 (array!37065 (_ BitVec 32) List!11872) Bool)

(assert (=> b!598540 (= res!383735 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11869))))

(declare-fun lt!271865 () array!37065)

(declare-fun b!598541 () Bool)

(declare-fun e!342136 () Bool)

(declare-fun arrayContainsKey!0 (array!37065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598541 (= e!342136 (arrayContainsKey!0 lt!271865 (select (arr!17792 a!2986) j!136) index!984))))

(declare-fun b!598542 () Bool)

(assert (=> b!598542 (= e!342139 e!342143)))

(declare-fun res!383727 () Bool)

(assert (=> b!598542 (=> (not res!383727) (not e!342143))))

(assert (=> b!598542 (= res!383727 (= (select (store (arr!17792 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598542 (= lt!271865 (array!37066 (store (arr!17792 a!2986) i!1108 k0!1786) (size!18157 a!2986)))))

(declare-fun b!598543 () Bool)

(declare-fun e!342142 () Bool)

(assert (=> b!598543 (= e!342142 e!342139)))

(declare-fun res!383725 () Bool)

(assert (=> b!598543 (=> (not res!383725) (not e!342139))))

(declare-fun lt!271869 () SeekEntryResult!6229)

(assert (=> b!598543 (= res!383725 (or (= lt!271869 (MissingZero!6229 i!1108)) (= lt!271869 (MissingVacant!6229 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37065 (_ BitVec 32)) SeekEntryResult!6229)

(assert (=> b!598543 (= lt!271869 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!598544 () Bool)

(assert (=> b!598544 (= e!342146 e!342136)))

(declare-fun res!383732 () Bool)

(assert (=> b!598544 (=> (not res!383732) (not e!342136))))

(assert (=> b!598544 (= res!383732 (arrayContainsKey!0 lt!271865 (select (arr!17792 a!2986) j!136) j!136))))

(declare-fun b!598545 () Bool)

(declare-datatypes ((Unit!18828 0))(
  ( (Unit!18829) )
))
(declare-fun e!342137 () Unit!18828)

(declare-fun Unit!18830 () Unit!18828)

(assert (=> b!598545 (= e!342137 Unit!18830)))

(assert (=> b!598545 false))

(declare-fun b!598546 () Bool)

(declare-fun Unit!18831 () Unit!18828)

(assert (=> b!598546 (= e!342137 Unit!18831)))

(declare-fun b!598547 () Bool)

(declare-fun res!383728 () Bool)

(assert (=> b!598547 (=> (not res!383728) (not e!342142))))

(assert (=> b!598547 (= res!383728 (and (= (size!18157 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18157 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18157 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598548 () Bool)

(declare-fun res!383733 () Bool)

(assert (=> b!598548 (=> (not res!383733) (not e!342139))))

(assert (=> b!598548 (= res!383733 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17792 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598549 () Bool)

(declare-fun res!383724 () Bool)

(assert (=> b!598549 (=> (not res!383724) (not e!342139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37065 (_ BitVec 32)) Bool)

(assert (=> b!598549 (= res!383724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598550 () Bool)

(assert (=> b!598550 (= e!342141 (not e!342140))))

(declare-fun res!383721 () Bool)

(assert (=> b!598550 (=> res!383721 e!342140)))

(declare-fun lt!271870 () SeekEntryResult!6229)

(assert (=> b!598550 (= res!383721 (not (= lt!271870 (Found!6229 index!984))))))

(declare-fun lt!271866 () Unit!18828)

(assert (=> b!598550 (= lt!271866 e!342137)))

(declare-fun c!67776 () Bool)

(assert (=> b!598550 (= c!67776 (= lt!271870 Undefined!6229))))

(assert (=> b!598550 (= lt!271870 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271864 lt!271865 mask!3053))))

(declare-fun e!342147 () Bool)

(assert (=> b!598550 e!342147))

(declare-fun res!383730 () Bool)

(assert (=> b!598550 (=> (not res!383730) (not e!342147))))

(declare-fun lt!271872 () (_ BitVec 32))

(declare-fun lt!271871 () SeekEntryResult!6229)

(assert (=> b!598550 (= res!383730 (= lt!271871 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271872 vacantSpotIndex!68 lt!271864 lt!271865 mask!3053)))))

(assert (=> b!598550 (= lt!271871 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271872 vacantSpotIndex!68 (select (arr!17792 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!598550 (= lt!271864 (select (store (arr!17792 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!271867 () Unit!18828)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37065 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18828)

(assert (=> b!598550 (= lt!271867 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271872 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598550 (= lt!271872 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!598551 () Bool)

(assert (=> b!598551 (= e!342145 true)))

(assert (=> b!598551 (arrayNoDuplicates!0 lt!271865 #b00000000000000000000000000000000 Nil!11869)))

(declare-fun lt!271862 () Unit!18828)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37065 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11872) Unit!18828)

(assert (=> b!598551 (= lt!271862 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11869))))

(assert (=> b!598551 (arrayContainsKey!0 lt!271865 (select (arr!17792 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271873 () Unit!18828)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37065 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18828)

(assert (=> b!598551 (= lt!271873 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271865 (select (arr!17792 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598552 () Bool)

(declare-fun res!383723 () Bool)

(assert (=> b!598552 (=> (not res!383723) (not e!342142))))

(assert (=> b!598552 (= res!383723 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!383719 () Bool)

(assert (=> start!54816 (=> (not res!383719) (not e!342142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54816 (= res!383719 (validMask!0 mask!3053))))

(assert (=> start!54816 e!342142))

(assert (=> start!54816 true))

(declare-fun array_inv!13675 (array!37065) Bool)

(assert (=> start!54816 (array_inv!13675 a!2986)))

(declare-fun b!598553 () Bool)

(assert (=> b!598553 (= e!342147 (= lt!271868 lt!271871))))

(declare-fun b!598554 () Bool)

(declare-fun res!383729 () Bool)

(assert (=> b!598554 (=> (not res!383729) (not e!342142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598554 (= res!383729 (validKeyInArray!0 (select (arr!17792 a!2986) j!136)))))

(declare-fun b!598555 () Bool)

(declare-fun res!383722 () Bool)

(assert (=> b!598555 (=> (not res!383722) (not e!342142))))

(assert (=> b!598555 (= res!383722 (validKeyInArray!0 k0!1786))))

(assert (= (and start!54816 res!383719) b!598547))

(assert (= (and b!598547 res!383728) b!598554))

(assert (= (and b!598554 res!383729) b!598555))

(assert (= (and b!598555 res!383722) b!598552))

(assert (= (and b!598552 res!383723) b!598543))

(assert (= (and b!598543 res!383725) b!598549))

(assert (= (and b!598549 res!383724) b!598540))

(assert (= (and b!598540 res!383735) b!598548))

(assert (= (and b!598548 res!383733) b!598542))

(assert (= (and b!598542 res!383727) b!598537))

(assert (= (and b!598537 res!383720) b!598550))

(assert (= (and b!598550 res!383730) b!598553))

(assert (= (and b!598550 c!67776) b!598545))

(assert (= (and b!598550 (not c!67776)) b!598546))

(assert (= (and b!598550 (not res!383721)) b!598539))

(assert (= (and b!598539 res!383731) b!598538))

(assert (= (and b!598538 (not res!383734)) b!598544))

(assert (= (and b!598544 res!383732) b!598541))

(assert (= (and b!598539 (not res!383726)) b!598551))

(declare-fun m!575323 () Bool)

(assert (=> b!598542 m!575323))

(declare-fun m!575325 () Bool)

(assert (=> b!598542 m!575325))

(declare-fun m!575327 () Bool)

(assert (=> b!598552 m!575327))

(declare-fun m!575329 () Bool)

(assert (=> b!598540 m!575329))

(declare-fun m!575331 () Bool)

(assert (=> start!54816 m!575331))

(declare-fun m!575333 () Bool)

(assert (=> start!54816 m!575333))

(declare-fun m!575335 () Bool)

(assert (=> b!598549 m!575335))

(declare-fun m!575337 () Bool)

(assert (=> b!598541 m!575337))

(assert (=> b!598541 m!575337))

(declare-fun m!575339 () Bool)

(assert (=> b!598541 m!575339))

(assert (=> b!598538 m!575337))

(declare-fun m!575341 () Bool)

(assert (=> b!598543 m!575341))

(declare-fun m!575343 () Bool)

(assert (=> b!598537 m!575343))

(assert (=> b!598537 m!575337))

(assert (=> b!598537 m!575337))

(declare-fun m!575345 () Bool)

(assert (=> b!598537 m!575345))

(assert (=> b!598539 m!575337))

(assert (=> b!598539 m!575323))

(declare-fun m!575347 () Bool)

(assert (=> b!598539 m!575347))

(declare-fun m!575349 () Bool)

(assert (=> b!598550 m!575349))

(declare-fun m!575351 () Bool)

(assert (=> b!598550 m!575351))

(declare-fun m!575353 () Bool)

(assert (=> b!598550 m!575353))

(assert (=> b!598550 m!575323))

(declare-fun m!575355 () Bool)

(assert (=> b!598550 m!575355))

(declare-fun m!575357 () Bool)

(assert (=> b!598550 m!575357))

(assert (=> b!598550 m!575337))

(assert (=> b!598550 m!575337))

(declare-fun m!575359 () Bool)

(assert (=> b!598550 m!575359))

(assert (=> b!598551 m!575337))

(assert (=> b!598551 m!575337))

(declare-fun m!575361 () Bool)

(assert (=> b!598551 m!575361))

(declare-fun m!575363 () Bool)

(assert (=> b!598551 m!575363))

(assert (=> b!598551 m!575337))

(declare-fun m!575365 () Bool)

(assert (=> b!598551 m!575365))

(declare-fun m!575367 () Bool)

(assert (=> b!598551 m!575367))

(declare-fun m!575369 () Bool)

(assert (=> b!598555 m!575369))

(declare-fun m!575371 () Bool)

(assert (=> b!598548 m!575371))

(assert (=> b!598554 m!575337))

(assert (=> b!598554 m!575337))

(declare-fun m!575373 () Bool)

(assert (=> b!598554 m!575373))

(assert (=> b!598544 m!575337))

(assert (=> b!598544 m!575337))

(declare-fun m!575375 () Bool)

(assert (=> b!598544 m!575375))

(check-sat (not b!598544) (not b!598551) (not b!598537) (not b!598541) (not b!598550) (not b!598540) (not b!598555) (not b!598543) (not start!54816) (not b!598549) (not b!598552) (not b!598554))
(check-sat)
