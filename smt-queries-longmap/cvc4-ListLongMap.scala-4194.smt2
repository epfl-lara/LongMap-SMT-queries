; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57258 () Bool)

(assert start!57258)

(declare-fun b!633702 () Bool)

(declare-fun res!409839 () Bool)

(declare-fun e!362346 () Bool)

(assert (=> b!633702 (=> (not res!409839) (not e!362346))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633702 (= res!409839 (validKeyInArray!0 k!1786))))

(declare-fun b!633703 () Bool)

(declare-fun e!362343 () Bool)

(assert (=> b!633703 (= e!362346 e!362343)))

(declare-fun res!409826 () Bool)

(assert (=> b!633703 (=> (not res!409826) (not e!362343))))

(declare-datatypes ((SeekEntryResult!6754 0))(
  ( (MissingZero!6754 (index!29315 (_ BitVec 32))) (Found!6754 (index!29316 (_ BitVec 32))) (Intermediate!6754 (undefined!7566 Bool) (index!29317 (_ BitVec 32)) (x!58055 (_ BitVec 32))) (Undefined!6754) (MissingVacant!6754 (index!29318 (_ BitVec 32))) )
))
(declare-fun lt!292921 () SeekEntryResult!6754)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!633703 (= res!409826 (or (= lt!292921 (MissingZero!6754 i!1108)) (= lt!292921 (MissingVacant!6754 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!38168 0))(
  ( (array!38169 (arr!18314 (Array (_ BitVec 32) (_ BitVec 64))) (size!18678 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38168)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38168 (_ BitVec 32)) SeekEntryResult!6754)

(assert (=> b!633703 (= lt!292921 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!633704 () Bool)

(declare-fun res!409830 () Bool)

(assert (=> b!633704 (=> (not res!409830) (not e!362346))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!633704 (= res!409830 (validKeyInArray!0 (select (arr!18314 a!2986) j!136)))))

(declare-fun res!409841 () Bool)

(assert (=> start!57258 (=> (not res!409841) (not e!362346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57258 (= res!409841 (validMask!0 mask!3053))))

(assert (=> start!57258 e!362346))

(assert (=> start!57258 true))

(declare-fun array_inv!14110 (array!38168) Bool)

(assert (=> start!57258 (array_inv!14110 a!2986)))

(declare-fun b!633705 () Bool)

(declare-fun e!362352 () Bool)

(declare-fun e!362348 () Bool)

(assert (=> b!633705 (= e!362352 e!362348)))

(declare-fun res!409837 () Bool)

(assert (=> b!633705 (=> res!409837 e!362348)))

(declare-fun lt!292919 () (_ BitVec 64))

(declare-fun lt!292912 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!633705 (= res!409837 (or (not (= (select (arr!18314 a!2986) j!136) lt!292919)) (not (= (select (arr!18314 a!2986) j!136) lt!292912)) (bvsge j!136 index!984)))))

(declare-fun b!633706 () Bool)

(declare-fun res!409834 () Bool)

(assert (=> b!633706 (=> (not res!409834) (not e!362346))))

(declare-fun arrayContainsKey!0 (array!38168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633706 (= res!409834 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633707 () Bool)

(declare-fun e!362345 () Bool)

(assert (=> b!633707 (= e!362345 (or (not (= (select (arr!18314 a!2986) j!136) lt!292919)) (not (= (select (arr!18314 a!2986) j!136) lt!292912)) (bvsge j!136 index!984) (bvslt index!984 (size!18678 a!2986))))))

(assert (=> b!633707 e!362352))

(declare-fun res!409840 () Bool)

(assert (=> b!633707 (=> (not res!409840) (not e!362352))))

(assert (=> b!633707 (= res!409840 (= lt!292912 (select (arr!18314 a!2986) j!136)))))

(assert (=> b!633707 (= lt!292912 (select (store (arr!18314 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!633708 () Bool)

(declare-fun res!409829 () Bool)

(assert (=> b!633708 (=> (not res!409829) (not e!362343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38168 (_ BitVec 32)) Bool)

(assert (=> b!633708 (= res!409829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633709 () Bool)

(declare-fun res!409836 () Bool)

(assert (=> b!633709 (=> (not res!409836) (not e!362346))))

(assert (=> b!633709 (= res!409836 (and (= (size!18678 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18678 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18678 a!2986)) (not (= i!1108 j!136))))))

(declare-fun lt!292918 () array!38168)

(declare-fun e!362351 () Bool)

(declare-fun b!633710 () Bool)

(assert (=> b!633710 (= e!362351 (arrayContainsKey!0 lt!292918 (select (arr!18314 a!2986) j!136) index!984))))

(declare-fun b!633711 () Bool)

(declare-fun e!362344 () Bool)

(assert (=> b!633711 (= e!362343 e!362344)))

(declare-fun res!409832 () Bool)

(assert (=> b!633711 (=> (not res!409832) (not e!362344))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!633711 (= res!409832 (= (select (store (arr!18314 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633711 (= lt!292918 (array!38169 (store (arr!18314 a!2986) i!1108 k!1786) (size!18678 a!2986)))))

(declare-fun b!633712 () Bool)

(declare-fun res!409833 () Bool)

(assert (=> b!633712 (=> (not res!409833) (not e!362343))))

(declare-datatypes ((List!12355 0))(
  ( (Nil!12352) (Cons!12351 (h!13396 (_ BitVec 64)) (t!18583 List!12355)) )
))
(declare-fun arrayNoDuplicates!0 (array!38168 (_ BitVec 32) List!12355) Bool)

(assert (=> b!633712 (= res!409833 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12352))))

(declare-fun b!633713 () Bool)

(declare-datatypes ((Unit!21350 0))(
  ( (Unit!21351) )
))
(declare-fun e!362347 () Unit!21350)

(declare-fun Unit!21352 () Unit!21350)

(assert (=> b!633713 (= e!362347 Unit!21352)))

(declare-fun b!633714 () Bool)

(declare-fun Unit!21353 () Unit!21350)

(assert (=> b!633714 (= e!362347 Unit!21353)))

(assert (=> b!633714 false))

(declare-fun b!633715 () Bool)

(declare-fun res!409835 () Bool)

(assert (=> b!633715 (=> (not res!409835) (not e!362343))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!633715 (= res!409835 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18314 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633716 () Bool)

(declare-fun e!362349 () Bool)

(assert (=> b!633716 (= e!362344 e!362349)))

(declare-fun res!409838 () Bool)

(assert (=> b!633716 (=> (not res!409838) (not e!362349))))

(declare-fun lt!292917 () SeekEntryResult!6754)

(assert (=> b!633716 (= res!409838 (and (= lt!292917 (Found!6754 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18314 a!2986) index!984) (select (arr!18314 a!2986) j!136))) (not (= (select (arr!18314 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38168 (_ BitVec 32)) SeekEntryResult!6754)

(assert (=> b!633716 (= lt!292917 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18314 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633717 () Bool)

(assert (=> b!633717 (= e!362349 (not e!362345))))

(declare-fun res!409827 () Bool)

(assert (=> b!633717 (=> res!409827 e!362345)))

(declare-fun lt!292916 () SeekEntryResult!6754)

(assert (=> b!633717 (= res!409827 (not (= lt!292916 (Found!6754 index!984))))))

(declare-fun lt!292913 () Unit!21350)

(assert (=> b!633717 (= lt!292913 e!362347)))

(declare-fun c!72305 () Bool)

(assert (=> b!633717 (= c!72305 (= lt!292916 Undefined!6754))))

(assert (=> b!633717 (= lt!292916 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292919 lt!292918 mask!3053))))

(declare-fun e!362342 () Bool)

(assert (=> b!633717 e!362342))

(declare-fun res!409828 () Bool)

(assert (=> b!633717 (=> (not res!409828) (not e!362342))))

(declare-fun lt!292920 () (_ BitVec 32))

(declare-fun lt!292915 () SeekEntryResult!6754)

(assert (=> b!633717 (= res!409828 (= lt!292915 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292920 vacantSpotIndex!68 lt!292919 lt!292918 mask!3053)))))

(assert (=> b!633717 (= lt!292915 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292920 vacantSpotIndex!68 (select (arr!18314 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633717 (= lt!292919 (select (store (arr!18314 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292914 () Unit!21350)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38168 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21350)

(assert (=> b!633717 (= lt!292914 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292920 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633717 (= lt!292920 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!633718 () Bool)

(assert (=> b!633718 (= e!362348 e!362351)))

(declare-fun res!409831 () Bool)

(assert (=> b!633718 (=> (not res!409831) (not e!362351))))

(assert (=> b!633718 (= res!409831 (arrayContainsKey!0 lt!292918 (select (arr!18314 a!2986) j!136) j!136))))

(declare-fun b!633719 () Bool)

(assert (=> b!633719 (= e!362342 (= lt!292917 lt!292915))))

(assert (= (and start!57258 res!409841) b!633709))

(assert (= (and b!633709 res!409836) b!633704))

(assert (= (and b!633704 res!409830) b!633702))

(assert (= (and b!633702 res!409839) b!633706))

(assert (= (and b!633706 res!409834) b!633703))

(assert (= (and b!633703 res!409826) b!633708))

(assert (= (and b!633708 res!409829) b!633712))

(assert (= (and b!633712 res!409833) b!633715))

(assert (= (and b!633715 res!409835) b!633711))

(assert (= (and b!633711 res!409832) b!633716))

(assert (= (and b!633716 res!409838) b!633717))

(assert (= (and b!633717 res!409828) b!633719))

(assert (= (and b!633717 c!72305) b!633714))

(assert (= (and b!633717 (not c!72305)) b!633713))

(assert (= (and b!633717 (not res!409827)) b!633707))

(assert (= (and b!633707 res!409840) b!633705))

(assert (= (and b!633705 (not res!409837)) b!633718))

(assert (= (and b!633718 res!409831) b!633710))

(declare-fun m!608317 () Bool)

(assert (=> b!633710 m!608317))

(assert (=> b!633710 m!608317))

(declare-fun m!608319 () Bool)

(assert (=> b!633710 m!608319))

(assert (=> b!633704 m!608317))

(assert (=> b!633704 m!608317))

(declare-fun m!608321 () Bool)

(assert (=> b!633704 m!608321))

(declare-fun m!608323 () Bool)

(assert (=> b!633703 m!608323))

(declare-fun m!608325 () Bool)

(assert (=> b!633708 m!608325))

(declare-fun m!608327 () Bool)

(assert (=> start!57258 m!608327))

(declare-fun m!608329 () Bool)

(assert (=> start!57258 m!608329))

(declare-fun m!608331 () Bool)

(assert (=> b!633716 m!608331))

(assert (=> b!633716 m!608317))

(assert (=> b!633716 m!608317))

(declare-fun m!608333 () Bool)

(assert (=> b!633716 m!608333))

(declare-fun m!608335 () Bool)

(assert (=> b!633717 m!608335))

(declare-fun m!608337 () Bool)

(assert (=> b!633717 m!608337))

(declare-fun m!608339 () Bool)

(assert (=> b!633717 m!608339))

(assert (=> b!633717 m!608317))

(declare-fun m!608341 () Bool)

(assert (=> b!633717 m!608341))

(assert (=> b!633717 m!608317))

(declare-fun m!608343 () Bool)

(assert (=> b!633717 m!608343))

(declare-fun m!608345 () Bool)

(assert (=> b!633717 m!608345))

(declare-fun m!608347 () Bool)

(assert (=> b!633717 m!608347))

(assert (=> b!633711 m!608341))

(declare-fun m!608349 () Bool)

(assert (=> b!633711 m!608349))

(declare-fun m!608351 () Bool)

(assert (=> b!633715 m!608351))

(assert (=> b!633705 m!608317))

(assert (=> b!633707 m!608317))

(assert (=> b!633707 m!608341))

(declare-fun m!608353 () Bool)

(assert (=> b!633707 m!608353))

(declare-fun m!608355 () Bool)

(assert (=> b!633706 m!608355))

(declare-fun m!608357 () Bool)

(assert (=> b!633702 m!608357))

(assert (=> b!633718 m!608317))

(assert (=> b!633718 m!608317))

(declare-fun m!608359 () Bool)

(assert (=> b!633718 m!608359))

(declare-fun m!608361 () Bool)

(assert (=> b!633712 m!608361))

(push 1)

(assert (not b!633703))

(assert (not b!633717))

(assert (not b!633716))

(assert (not b!633710))

(assert (not b!633712))

(assert (not b!633708))

(assert (not b!633706))

(assert (not start!57258))

(assert (not b!633702))

(assert (not b!633718))

(assert (not b!633704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

