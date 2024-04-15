; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54882 () Bool)

(assert start!54882)

(declare-fun b!600640 () Bool)

(declare-datatypes ((Unit!18960 0))(
  ( (Unit!18961) )
))
(declare-fun e!343403 () Unit!18960)

(declare-fun Unit!18962 () Unit!18960)

(assert (=> b!600640 (= e!343403 Unit!18962)))

(declare-fun b!600641 () Bool)

(declare-fun e!343405 () Bool)

(declare-fun e!343406 () Bool)

(assert (=> b!600641 (= e!343405 e!343406)))

(declare-fun res!385627 () Bool)

(assert (=> b!600641 (=> res!385627 e!343406)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!273211 () (_ BitVec 64))

(declare-fun lt!273202 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37131 0))(
  ( (array!37132 (arr!17825 (Array (_ BitVec 32) (_ BitVec 64))) (size!18190 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37131)

(assert (=> b!600641 (= res!385627 (or (not (= (select (arr!17825 a!2986) j!136) lt!273202)) (not (= (select (arr!17825 a!2986) j!136) lt!273211)) (bvsge j!136 index!984)))))

(declare-fun e!343398 () Bool)

(assert (=> b!600641 e!343398))

(declare-fun res!385640 () Bool)

(assert (=> b!600641 (=> (not res!385640) (not e!343398))))

(assert (=> b!600641 (= res!385640 (= lt!273211 (select (arr!17825 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!600641 (= lt!273211 (select (store (arr!17825 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!600642 () Bool)

(declare-fun res!385625 () Bool)

(declare-fun e!343399 () Bool)

(assert (=> b!600642 (=> (not res!385625) (not e!343399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600642 (= res!385625 (validKeyInArray!0 k0!1786))))

(declare-fun b!600643 () Bool)

(declare-fun res!385642 () Bool)

(declare-fun e!343410 () Bool)

(assert (=> b!600643 (=> res!385642 e!343410)))

(declare-datatypes ((List!11905 0))(
  ( (Nil!11902) (Cons!11901 (h!12946 (_ BitVec 64)) (t!18124 List!11905)) )
))
(declare-fun noDuplicate!305 (List!11905) Bool)

(assert (=> b!600643 (= res!385642 (not (noDuplicate!305 Nil!11902)))))

(declare-fun e!343401 () Bool)

(declare-fun lt!273201 () array!37131)

(declare-fun b!600644 () Bool)

(declare-fun arrayContainsKey!0 (array!37131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600644 (= e!343401 (arrayContainsKey!0 lt!273201 (select (arr!17825 a!2986) j!136) index!984))))

(declare-fun b!600645 () Bool)

(declare-fun e!343400 () Bool)

(assert (=> b!600645 (= e!343400 e!343401)))

(declare-fun res!385635 () Bool)

(assert (=> b!600645 (=> (not res!385635) (not e!343401))))

(assert (=> b!600645 (= res!385635 (arrayContainsKey!0 lt!273201 (select (arr!17825 a!2986) j!136) j!136))))

(declare-fun b!600646 () Bool)

(declare-fun res!385630 () Bool)

(assert (=> b!600646 (=> (not res!385630) (not e!343399))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!600646 (= res!385630 (and (= (size!18190 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18190 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18190 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600647 () Bool)

(declare-fun res!385636 () Bool)

(assert (=> b!600647 (=> (not res!385636) (not e!343399))))

(assert (=> b!600647 (= res!385636 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600648 () Bool)

(declare-fun e!343404 () Bool)

(declare-fun e!343409 () Bool)

(assert (=> b!600648 (= e!343404 e!343409)))

(declare-fun res!385631 () Bool)

(assert (=> b!600648 (=> (not res!385631) (not e!343409))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!600648 (= res!385631 (= (select (store (arr!17825 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600648 (= lt!273201 (array!37132 (store (arr!17825 a!2986) i!1108 k0!1786) (size!18190 a!2986)))))

(declare-fun b!600649 () Bool)

(assert (=> b!600649 (= e!343410 true)))

(declare-fun lt!273210 () Bool)

(declare-fun contains!2970 (List!11905 (_ BitVec 64)) Bool)

(assert (=> b!600649 (= lt!273210 (contains!2970 Nil!11902 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600650 () Bool)

(declare-fun e!343408 () Bool)

(assert (=> b!600650 (= e!343409 e!343408)))

(declare-fun res!385629 () Bool)

(assert (=> b!600650 (=> (not res!385629) (not e!343408))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6262 0))(
  ( (MissingZero!6262 (index!27305 (_ BitVec 32))) (Found!6262 (index!27306 (_ BitVec 32))) (Intermediate!6262 (undefined!7074 Bool) (index!27307 (_ BitVec 32)) (x!56112 (_ BitVec 32))) (Undefined!6262) (MissingVacant!6262 (index!27308 (_ BitVec 32))) )
))
(declare-fun lt!273206 () SeekEntryResult!6262)

(assert (=> b!600650 (= res!385629 (and (= lt!273206 (Found!6262 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17825 a!2986) index!984) (select (arr!17825 a!2986) j!136))) (not (= (select (arr!17825 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37131 (_ BitVec 32)) SeekEntryResult!6262)

(assert (=> b!600650 (= lt!273206 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17825 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600651 () Bool)

(declare-fun res!385639 () Bool)

(assert (=> b!600651 (=> (not res!385639) (not e!343399))))

(assert (=> b!600651 (= res!385639 (validKeyInArray!0 (select (arr!17825 a!2986) j!136)))))

(declare-fun b!600652 () Bool)

(declare-fun res!385624 () Bool)

(assert (=> b!600652 (=> (not res!385624) (not e!343404))))

(declare-fun arrayNoDuplicates!0 (array!37131 (_ BitVec 32) List!11905) Bool)

(assert (=> b!600652 (= res!385624 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11902))))

(declare-fun b!600653 () Bool)

(declare-fun res!385628 () Bool)

(assert (=> b!600653 (=> (not res!385628) (not e!343404))))

(assert (=> b!600653 (= res!385628 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17825 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600654 () Bool)

(assert (=> b!600654 (= e!343406 e!343410)))

(declare-fun res!385643 () Bool)

(assert (=> b!600654 (=> res!385643 e!343410)))

(assert (=> b!600654 (= res!385643 (or (bvsge (size!18190 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18190 a!2986))))))

(assert (=> b!600654 (arrayNoDuplicates!0 lt!273201 j!136 Nil!11902)))

(declare-fun lt!273203 () Unit!18960)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37131 (_ BitVec 32) (_ BitVec 32)) Unit!18960)

(assert (=> b!600654 (= lt!273203 (lemmaNoDuplicateFromThenFromBigger!0 lt!273201 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600654 (arrayNoDuplicates!0 lt!273201 #b00000000000000000000000000000000 Nil!11902)))

(declare-fun lt!273200 () Unit!18960)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37131 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11905) Unit!18960)

(assert (=> b!600654 (= lt!273200 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11902))))

(assert (=> b!600654 (arrayContainsKey!0 lt!273201 (select (arr!17825 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273205 () Unit!18960)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37131 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18960)

(assert (=> b!600654 (= lt!273205 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273201 (select (arr!17825 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600655 () Bool)

(assert (=> b!600655 (= e!343398 e!343400)))

(declare-fun res!385637 () Bool)

(assert (=> b!600655 (=> res!385637 e!343400)))

(assert (=> b!600655 (= res!385637 (or (not (= (select (arr!17825 a!2986) j!136) lt!273202)) (not (= (select (arr!17825 a!2986) j!136) lt!273211)) (bvsge j!136 index!984)))))

(declare-fun b!600656 () Bool)

(assert (=> b!600656 (= e!343408 (not e!343405))))

(declare-fun res!385641 () Bool)

(assert (=> b!600656 (=> res!385641 e!343405)))

(declare-fun lt!273209 () SeekEntryResult!6262)

(assert (=> b!600656 (= res!385641 (not (= lt!273209 (Found!6262 index!984))))))

(declare-fun lt!273199 () Unit!18960)

(assert (=> b!600656 (= lt!273199 e!343403)))

(declare-fun c!67875 () Bool)

(assert (=> b!600656 (= c!67875 (= lt!273209 Undefined!6262))))

(assert (=> b!600656 (= lt!273209 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273202 lt!273201 mask!3053))))

(declare-fun e!343407 () Bool)

(assert (=> b!600656 e!343407))

(declare-fun res!385633 () Bool)

(assert (=> b!600656 (=> (not res!385633) (not e!343407))))

(declare-fun lt!273207 () SeekEntryResult!6262)

(declare-fun lt!273204 () (_ BitVec 32))

(assert (=> b!600656 (= res!385633 (= lt!273207 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273204 vacantSpotIndex!68 lt!273202 lt!273201 mask!3053)))))

(assert (=> b!600656 (= lt!273207 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273204 vacantSpotIndex!68 (select (arr!17825 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600656 (= lt!273202 (select (store (arr!17825 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273208 () Unit!18960)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37131 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18960)

(assert (=> b!600656 (= lt!273208 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273204 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600656 (= lt!273204 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!385632 () Bool)

(assert (=> start!54882 (=> (not res!385632) (not e!343399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54882 (= res!385632 (validMask!0 mask!3053))))

(assert (=> start!54882 e!343399))

(assert (=> start!54882 true))

(declare-fun array_inv!13708 (array!37131) Bool)

(assert (=> start!54882 (array_inv!13708 a!2986)))

(declare-fun b!600657 () Bool)

(assert (=> b!600657 (= e!343399 e!343404)))

(declare-fun res!385626 () Bool)

(assert (=> b!600657 (=> (not res!385626) (not e!343404))))

(declare-fun lt!273198 () SeekEntryResult!6262)

(assert (=> b!600657 (= res!385626 (or (= lt!273198 (MissingZero!6262 i!1108)) (= lt!273198 (MissingVacant!6262 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37131 (_ BitVec 32)) SeekEntryResult!6262)

(assert (=> b!600657 (= lt!273198 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!600658 () Bool)

(declare-fun Unit!18963 () Unit!18960)

(assert (=> b!600658 (= e!343403 Unit!18963)))

(assert (=> b!600658 false))

(declare-fun b!600659 () Bool)

(declare-fun res!385634 () Bool)

(assert (=> b!600659 (=> (not res!385634) (not e!343404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37131 (_ BitVec 32)) Bool)

(assert (=> b!600659 (= res!385634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600660 () Bool)

(assert (=> b!600660 (= e!343407 (= lt!273206 lt!273207))))

(declare-fun b!600661 () Bool)

(declare-fun res!385638 () Bool)

(assert (=> b!600661 (=> res!385638 e!343410)))

(assert (=> b!600661 (= res!385638 (contains!2970 Nil!11902 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!54882 res!385632) b!600646))

(assert (= (and b!600646 res!385630) b!600651))

(assert (= (and b!600651 res!385639) b!600642))

(assert (= (and b!600642 res!385625) b!600647))

(assert (= (and b!600647 res!385636) b!600657))

(assert (= (and b!600657 res!385626) b!600659))

(assert (= (and b!600659 res!385634) b!600652))

(assert (= (and b!600652 res!385624) b!600653))

(assert (= (and b!600653 res!385628) b!600648))

(assert (= (and b!600648 res!385631) b!600650))

(assert (= (and b!600650 res!385629) b!600656))

(assert (= (and b!600656 res!385633) b!600660))

(assert (= (and b!600656 c!67875) b!600658))

(assert (= (and b!600656 (not c!67875)) b!600640))

(assert (= (and b!600656 (not res!385641)) b!600641))

(assert (= (and b!600641 res!385640) b!600655))

(assert (= (and b!600655 (not res!385637)) b!600645))

(assert (= (and b!600645 res!385635) b!600644))

(assert (= (and b!600641 (not res!385627)) b!600654))

(assert (= (and b!600654 (not res!385643)) b!600643))

(assert (= (and b!600643 (not res!385642)) b!600661))

(assert (= (and b!600661 (not res!385638)) b!600649))

(declare-fun m!577345 () Bool)

(assert (=> b!600656 m!577345))

(declare-fun m!577347 () Bool)

(assert (=> b!600656 m!577347))

(declare-fun m!577349 () Bool)

(assert (=> b!600656 m!577349))

(declare-fun m!577351 () Bool)

(assert (=> b!600656 m!577351))

(declare-fun m!577353 () Bool)

(assert (=> b!600656 m!577353))

(assert (=> b!600656 m!577351))

(declare-fun m!577355 () Bool)

(assert (=> b!600656 m!577355))

(declare-fun m!577357 () Bool)

(assert (=> b!600656 m!577357))

(declare-fun m!577359 () Bool)

(assert (=> b!600656 m!577359))

(declare-fun m!577361 () Bool)

(assert (=> b!600652 m!577361))

(declare-fun m!577363 () Bool)

(assert (=> b!600653 m!577363))

(declare-fun m!577365 () Bool)

(assert (=> b!600642 m!577365))

(declare-fun m!577367 () Bool)

(assert (=> b!600654 m!577367))

(assert (=> b!600654 m!577351))

(declare-fun m!577369 () Bool)

(assert (=> b!600654 m!577369))

(assert (=> b!600654 m!577351))

(declare-fun m!577371 () Bool)

(assert (=> b!600654 m!577371))

(declare-fun m!577373 () Bool)

(assert (=> b!600654 m!577373))

(assert (=> b!600654 m!577351))

(declare-fun m!577375 () Bool)

(assert (=> b!600654 m!577375))

(declare-fun m!577377 () Bool)

(assert (=> b!600654 m!577377))

(declare-fun m!577379 () Bool)

(assert (=> b!600647 m!577379))

(assert (=> b!600644 m!577351))

(assert (=> b!600644 m!577351))

(declare-fun m!577381 () Bool)

(assert (=> b!600644 m!577381))

(declare-fun m!577383 () Bool)

(assert (=> b!600661 m!577383))

(declare-fun m!577385 () Bool)

(assert (=> b!600659 m!577385))

(declare-fun m!577387 () Bool)

(assert (=> b!600657 m!577387))

(assert (=> b!600641 m!577351))

(assert (=> b!600641 m!577353))

(declare-fun m!577389 () Bool)

(assert (=> b!600641 m!577389))

(declare-fun m!577391 () Bool)

(assert (=> b!600650 m!577391))

(assert (=> b!600650 m!577351))

(assert (=> b!600650 m!577351))

(declare-fun m!577393 () Bool)

(assert (=> b!600650 m!577393))

(assert (=> b!600648 m!577353))

(declare-fun m!577395 () Bool)

(assert (=> b!600648 m!577395))

(declare-fun m!577397 () Bool)

(assert (=> b!600649 m!577397))

(assert (=> b!600655 m!577351))

(declare-fun m!577399 () Bool)

(assert (=> start!54882 m!577399))

(declare-fun m!577401 () Bool)

(assert (=> start!54882 m!577401))

(assert (=> b!600651 m!577351))

(assert (=> b!600651 m!577351))

(declare-fun m!577403 () Bool)

(assert (=> b!600651 m!577403))

(declare-fun m!577405 () Bool)

(assert (=> b!600643 m!577405))

(assert (=> b!600645 m!577351))

(assert (=> b!600645 m!577351))

(declare-fun m!577407 () Bool)

(assert (=> b!600645 m!577407))

(check-sat (not b!600656) (not b!600650) (not start!54882) (not b!600642) (not b!600644) (not b!600654) (not b!600645) (not b!600647) (not b!600657) (not b!600652) (not b!600643) (not b!600659) (not b!600649) (not b!600651) (not b!600661))
(check-sat)
