; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56136 () Bool)

(assert start!56136)

(declare-fun b!618757 () Bool)

(declare-fun res!398638 () Bool)

(declare-fun e!354859 () Bool)

(assert (=> b!618757 (=> (not res!398638) (not e!354859))))

(declare-datatypes ((array!37551 0))(
  ( (array!37552 (arr!18019 (Array (_ BitVec 32) (_ BitVec 64))) (size!18383 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37551)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618757 (= res!398638 (validKeyInArray!0 (select (arr!18019 a!2986) j!136)))))

(declare-fun lt!285318 () array!37551)

(declare-fun b!618758 () Bool)

(declare-fun e!354861 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618758 (= e!354861 (arrayContainsKey!0 lt!285318 (select (arr!18019 a!2986) j!136) index!984))))

(declare-fun b!618759 () Bool)

(declare-fun res!398637 () Bool)

(assert (=> b!618759 (=> (not res!398637) (not e!354859))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!618759 (= res!398637 (and (= (size!18383 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18383 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18383 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618760 () Bool)

(assert (=> b!618760 false))

(declare-datatypes ((Unit!20347 0))(
  ( (Unit!20348) )
))
(declare-fun lt!285314 () Unit!20347)

(declare-datatypes ((List!11967 0))(
  ( (Nil!11964) (Cons!11963 (h!13011 (_ BitVec 64)) (t!18187 List!11967)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37551 (_ BitVec 64) (_ BitVec 32) List!11967) Unit!20347)

(assert (=> b!618760 (= lt!285314 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285318 (select (arr!18019 a!2986) j!136) index!984 Nil!11964))))

(declare-fun arrayNoDuplicates!0 (array!37551 (_ BitVec 32) List!11967) Bool)

(assert (=> b!618760 (arrayNoDuplicates!0 lt!285318 index!984 Nil!11964)))

(declare-fun lt!285316 () Unit!20347)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37551 (_ BitVec 32) (_ BitVec 32)) Unit!20347)

(assert (=> b!618760 (= lt!285316 (lemmaNoDuplicateFromThenFromBigger!0 lt!285318 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618760 (arrayNoDuplicates!0 lt!285318 #b00000000000000000000000000000000 Nil!11964)))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!285304 () Unit!20347)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37551 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11967) Unit!20347)

(assert (=> b!618760 (= lt!285304 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11964))))

(assert (=> b!618760 (arrayContainsKey!0 lt!285318 (select (arr!18019 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285313 () Unit!20347)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37551 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20347)

(assert (=> b!618760 (= lt!285313 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285318 (select (arr!18019 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354852 () Bool)

(assert (=> b!618760 e!354852))

(declare-fun res!398625 () Bool)

(assert (=> b!618760 (=> (not res!398625) (not e!354852))))

(assert (=> b!618760 (= res!398625 (arrayContainsKey!0 lt!285318 (select (arr!18019 a!2986) j!136) j!136))))

(declare-fun e!354857 () Unit!20347)

(declare-fun Unit!20349 () Unit!20347)

(assert (=> b!618760 (= e!354857 Unit!20349)))

(declare-fun b!618761 () Bool)

(declare-fun res!398626 () Bool)

(assert (=> b!618761 (=> (not res!398626) (not e!354859))))

(assert (=> b!618761 (= res!398626 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618762 () Bool)

(declare-fun e!354853 () Bool)

(declare-datatypes ((SeekEntryResult!6415 0))(
  ( (MissingZero!6415 (index!27944 (_ BitVec 32))) (Found!6415 (index!27945 (_ BitVec 32))) (Intermediate!6415 (undefined!7227 Bool) (index!27946 (_ BitVec 32)) (x!56882 (_ BitVec 32))) (Undefined!6415) (MissingVacant!6415 (index!27947 (_ BitVec 32))) )
))
(declare-fun lt!285308 () SeekEntryResult!6415)

(declare-fun lt!285300 () SeekEntryResult!6415)

(assert (=> b!618762 (= e!354853 (= lt!285308 lt!285300))))

(declare-fun b!618764 () Bool)

(declare-fun e!354850 () Unit!20347)

(declare-fun Unit!20350 () Unit!20347)

(assert (=> b!618764 (= e!354850 Unit!20350)))

(declare-fun b!618765 () Bool)

(declare-fun res!398627 () Bool)

(assert (=> b!618765 (=> (not res!398627) (not e!354859))))

(assert (=> b!618765 (= res!398627 (validKeyInArray!0 k0!1786))))

(declare-fun b!618766 () Bool)

(declare-fun Unit!20351 () Unit!20347)

(assert (=> b!618766 (= e!354857 Unit!20351)))

(declare-fun b!618767 () Bool)

(declare-fun res!398624 () Bool)

(declare-fun e!354858 () Bool)

(assert (=> b!618767 (=> (not res!398624) (not e!354858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37551 (_ BitVec 32)) Bool)

(assert (=> b!618767 (= res!398624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618768 () Bool)

(assert (=> b!618768 false))

(declare-fun lt!285302 () Unit!20347)

(assert (=> b!618768 (= lt!285302 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285318 (select (arr!18019 a!2986) j!136) j!136 Nil!11964))))

(assert (=> b!618768 (arrayNoDuplicates!0 lt!285318 j!136 Nil!11964)))

(declare-fun lt!285312 () Unit!20347)

(assert (=> b!618768 (= lt!285312 (lemmaNoDuplicateFromThenFromBigger!0 lt!285318 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618768 (arrayNoDuplicates!0 lt!285318 #b00000000000000000000000000000000 Nil!11964)))

(declare-fun lt!285305 () Unit!20347)

(assert (=> b!618768 (= lt!285305 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11964))))

(assert (=> b!618768 (arrayContainsKey!0 lt!285318 (select (arr!18019 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285319 () Unit!20347)

(assert (=> b!618768 (= lt!285319 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285318 (select (arr!18019 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20352 () Unit!20347)

(assert (=> b!618768 (= e!354850 Unit!20352)))

(declare-fun b!618769 () Bool)

(declare-fun res!398623 () Bool)

(assert (=> b!618769 (= res!398623 (bvsge j!136 index!984))))

(declare-fun e!354854 () Bool)

(assert (=> b!618769 (=> res!398623 e!354854)))

(declare-fun e!354851 () Bool)

(assert (=> b!618769 (= e!354851 e!354854)))

(declare-fun res!398635 () Bool)

(declare-fun b!618770 () Bool)

(assert (=> b!618770 (= res!398635 (arrayContainsKey!0 lt!285318 (select (arr!18019 a!2986) j!136) j!136))))

(assert (=> b!618770 (=> (not res!398635) (not e!354861))))

(assert (=> b!618770 (= e!354854 e!354861)))

(declare-fun b!618771 () Bool)

(declare-fun e!354856 () Bool)

(declare-fun e!354855 () Bool)

(assert (=> b!618771 (= e!354856 (not e!354855))))

(declare-fun res!398636 () Bool)

(assert (=> b!618771 (=> res!398636 e!354855)))

(declare-fun lt!285301 () SeekEntryResult!6415)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!618771 (= res!398636 (not (= lt!285301 (MissingVacant!6415 vacantSpotIndex!68))))))

(declare-fun lt!285303 () Unit!20347)

(declare-fun e!354849 () Unit!20347)

(assert (=> b!618771 (= lt!285303 e!354849)))

(declare-fun c!70438 () Bool)

(assert (=> b!618771 (= c!70438 (= lt!285301 (Found!6415 index!984)))))

(declare-fun lt!285307 () Unit!20347)

(declare-fun e!354860 () Unit!20347)

(assert (=> b!618771 (= lt!285307 e!354860)))

(declare-fun c!70436 () Bool)

(assert (=> b!618771 (= c!70436 (= lt!285301 Undefined!6415))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!285309 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37551 (_ BitVec 32)) SeekEntryResult!6415)

(assert (=> b!618771 (= lt!285301 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285309 lt!285318 mask!3053))))

(assert (=> b!618771 e!354853))

(declare-fun res!398629 () Bool)

(assert (=> b!618771 (=> (not res!398629) (not e!354853))))

(declare-fun lt!285317 () (_ BitVec 32))

(assert (=> b!618771 (= res!398629 (= lt!285300 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285317 vacantSpotIndex!68 lt!285309 lt!285318 mask!3053)))))

(assert (=> b!618771 (= lt!285300 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285317 vacantSpotIndex!68 (select (arr!18019 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618771 (= lt!285309 (select (store (arr!18019 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!285311 () Unit!20347)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37551 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20347)

(assert (=> b!618771 (= lt!285311 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285317 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618771 (= lt!285317 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!618772 () Bool)

(assert (=> b!618772 (= e!354852 (arrayContainsKey!0 lt!285318 (select (arr!18019 a!2986) j!136) index!984))))

(declare-fun b!618773 () Bool)

(declare-fun res!398632 () Bool)

(assert (=> b!618773 (=> (not res!398632) (not e!354858))))

(assert (=> b!618773 (= res!398632 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11964))))

(declare-fun res!398628 () Bool)

(assert (=> start!56136 (=> (not res!398628) (not e!354859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56136 (= res!398628 (validMask!0 mask!3053))))

(assert (=> start!56136 e!354859))

(assert (=> start!56136 true))

(declare-fun array_inv!13878 (array!37551) Bool)

(assert (=> start!56136 (array_inv!13878 a!2986)))

(declare-fun b!618763 () Bool)

(declare-fun Unit!20353 () Unit!20347)

(assert (=> b!618763 (= e!354849 Unit!20353)))

(declare-fun b!618774 () Bool)

(declare-fun e!354848 () Bool)

(assert (=> b!618774 (= e!354848 e!354856)))

(declare-fun res!398622 () Bool)

(assert (=> b!618774 (=> (not res!398622) (not e!354856))))

(assert (=> b!618774 (= res!398622 (and (= lt!285308 (Found!6415 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18019 a!2986) index!984) (select (arr!18019 a!2986) j!136))) (not (= (select (arr!18019 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!618774 (= lt!285308 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18019 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618775 () Bool)

(assert (=> b!618775 (= e!354859 e!354858)))

(declare-fun res!398633 () Bool)

(assert (=> b!618775 (=> (not res!398633) (not e!354858))))

(declare-fun lt!285306 () SeekEntryResult!6415)

(assert (=> b!618775 (= res!398633 (or (= lt!285306 (MissingZero!6415 i!1108)) (= lt!285306 (MissingVacant!6415 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37551 (_ BitVec 32)) SeekEntryResult!6415)

(assert (=> b!618775 (= lt!285306 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!618776 () Bool)

(declare-fun Unit!20354 () Unit!20347)

(assert (=> b!618776 (= e!354860 Unit!20354)))

(assert (=> b!618776 false))

(declare-fun b!618777 () Bool)

(assert (=> b!618777 (= e!354855 true)))

(assert (=> b!618777 (= (select (store (arr!18019 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618778 () Bool)

(declare-fun Unit!20355 () Unit!20347)

(assert (=> b!618778 (= e!354849 Unit!20355)))

(declare-fun res!398634 () Bool)

(assert (=> b!618778 (= res!398634 (= (select (store (arr!18019 a!2986) i!1108 k0!1786) index!984) (select (arr!18019 a!2986) j!136)))))

(assert (=> b!618778 (=> (not res!398634) (not e!354851))))

(assert (=> b!618778 e!354851))

(declare-fun c!70437 () Bool)

(assert (=> b!618778 (= c!70437 (bvslt j!136 index!984))))

(declare-fun lt!285315 () Unit!20347)

(assert (=> b!618778 (= lt!285315 e!354850)))

(declare-fun c!70439 () Bool)

(assert (=> b!618778 (= c!70439 (bvslt index!984 j!136))))

(declare-fun lt!285310 () Unit!20347)

(assert (=> b!618778 (= lt!285310 e!354857)))

(assert (=> b!618778 false))

(declare-fun b!618779 () Bool)

(declare-fun res!398630 () Bool)

(assert (=> b!618779 (=> (not res!398630) (not e!354858))))

(assert (=> b!618779 (= res!398630 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18019 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618780 () Bool)

(assert (=> b!618780 (= e!354858 e!354848)))

(declare-fun res!398631 () Bool)

(assert (=> b!618780 (=> (not res!398631) (not e!354848))))

(assert (=> b!618780 (= res!398631 (= (select (store (arr!18019 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618780 (= lt!285318 (array!37552 (store (arr!18019 a!2986) i!1108 k0!1786) (size!18383 a!2986)))))

(declare-fun b!618781 () Bool)

(declare-fun Unit!20356 () Unit!20347)

(assert (=> b!618781 (= e!354860 Unit!20356)))

(assert (= (and start!56136 res!398628) b!618759))

(assert (= (and b!618759 res!398637) b!618757))

(assert (= (and b!618757 res!398638) b!618765))

(assert (= (and b!618765 res!398627) b!618761))

(assert (= (and b!618761 res!398626) b!618775))

(assert (= (and b!618775 res!398633) b!618767))

(assert (= (and b!618767 res!398624) b!618773))

(assert (= (and b!618773 res!398632) b!618779))

(assert (= (and b!618779 res!398630) b!618780))

(assert (= (and b!618780 res!398631) b!618774))

(assert (= (and b!618774 res!398622) b!618771))

(assert (= (and b!618771 res!398629) b!618762))

(assert (= (and b!618771 c!70436) b!618776))

(assert (= (and b!618771 (not c!70436)) b!618781))

(assert (= (and b!618771 c!70438) b!618778))

(assert (= (and b!618771 (not c!70438)) b!618763))

(assert (= (and b!618778 res!398634) b!618769))

(assert (= (and b!618769 (not res!398623)) b!618770))

(assert (= (and b!618770 res!398635) b!618758))

(assert (= (and b!618778 c!70437) b!618768))

(assert (= (and b!618778 (not c!70437)) b!618764))

(assert (= (and b!618778 c!70439) b!618760))

(assert (= (and b!618778 (not c!70439)) b!618766))

(assert (= (and b!618760 res!398625) b!618772))

(assert (= (and b!618771 (not res!398636)) b!618777))

(declare-fun m!595067 () Bool)

(assert (=> b!618757 m!595067))

(assert (=> b!618757 m!595067))

(declare-fun m!595069 () Bool)

(assert (=> b!618757 m!595069))

(assert (=> b!618758 m!595067))

(assert (=> b!618758 m!595067))

(declare-fun m!595071 () Bool)

(assert (=> b!618758 m!595071))

(declare-fun m!595073 () Bool)

(assert (=> b!618778 m!595073))

(declare-fun m!595075 () Bool)

(assert (=> b!618778 m!595075))

(assert (=> b!618778 m!595067))

(assert (=> b!618777 m!595073))

(assert (=> b!618777 m!595075))

(assert (=> b!618780 m!595073))

(declare-fun m!595077 () Bool)

(assert (=> b!618780 m!595077))

(assert (=> b!618770 m!595067))

(assert (=> b!618770 m!595067))

(declare-fun m!595079 () Bool)

(assert (=> b!618770 m!595079))

(declare-fun m!595081 () Bool)

(assert (=> b!618767 m!595081))

(declare-fun m!595083 () Bool)

(assert (=> b!618765 m!595083))

(declare-fun m!595085 () Bool)

(assert (=> b!618768 m!595085))

(assert (=> b!618768 m!595067))

(declare-fun m!595087 () Bool)

(assert (=> b!618768 m!595087))

(assert (=> b!618768 m!595067))

(declare-fun m!595089 () Bool)

(assert (=> b!618768 m!595089))

(assert (=> b!618768 m!595067))

(declare-fun m!595091 () Bool)

(assert (=> b!618768 m!595091))

(declare-fun m!595093 () Bool)

(assert (=> b!618768 m!595093))

(declare-fun m!595095 () Bool)

(assert (=> b!618768 m!595095))

(assert (=> b!618768 m!595067))

(declare-fun m!595097 () Bool)

(assert (=> b!618768 m!595097))

(assert (=> b!618772 m!595067))

(assert (=> b!618772 m!595067))

(assert (=> b!618772 m!595071))

(declare-fun m!595099 () Bool)

(assert (=> b!618771 m!595099))

(declare-fun m!595101 () Bool)

(assert (=> b!618771 m!595101))

(declare-fun m!595103 () Bool)

(assert (=> b!618771 m!595103))

(assert (=> b!618771 m!595067))

(assert (=> b!618771 m!595073))

(assert (=> b!618771 m!595067))

(declare-fun m!595105 () Bool)

(assert (=> b!618771 m!595105))

(declare-fun m!595107 () Bool)

(assert (=> b!618771 m!595107))

(declare-fun m!595109 () Bool)

(assert (=> b!618771 m!595109))

(declare-fun m!595111 () Bool)

(assert (=> b!618774 m!595111))

(assert (=> b!618774 m!595067))

(assert (=> b!618774 m!595067))

(declare-fun m!595113 () Bool)

(assert (=> b!618774 m!595113))

(assert (=> b!618760 m!595067))

(assert (=> b!618760 m!595079))

(assert (=> b!618760 m!595067))

(assert (=> b!618760 m!595067))

(declare-fun m!595115 () Bool)

(assert (=> b!618760 m!595115))

(assert (=> b!618760 m!595067))

(declare-fun m!595117 () Bool)

(assert (=> b!618760 m!595117))

(assert (=> b!618760 m!595093))

(declare-fun m!595119 () Bool)

(assert (=> b!618760 m!595119))

(declare-fun m!595121 () Bool)

(assert (=> b!618760 m!595121))

(assert (=> b!618760 m!595067))

(declare-fun m!595123 () Bool)

(assert (=> b!618760 m!595123))

(assert (=> b!618760 m!595095))

(declare-fun m!595125 () Bool)

(assert (=> b!618775 m!595125))

(declare-fun m!595127 () Bool)

(assert (=> b!618773 m!595127))

(declare-fun m!595129 () Bool)

(assert (=> b!618761 m!595129))

(declare-fun m!595131 () Bool)

(assert (=> b!618779 m!595131))

(declare-fun m!595133 () Bool)

(assert (=> start!56136 m!595133))

(declare-fun m!595135 () Bool)

(assert (=> start!56136 m!595135))

(check-sat (not b!618773) (not b!618758) (not b!618770) (not b!618771) (not b!618768) (not b!618767) (not b!618761) (not b!618774) (not b!618772) (not b!618760) (not b!618765) (not b!618757) (not start!56136) (not b!618775))
(check-sat)
