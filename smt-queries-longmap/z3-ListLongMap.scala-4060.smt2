; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55572 () Bool)

(assert start!55572)

(declare-fun b!608726 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37317 0))(
  ( (array!37318 (arr!17909 (Array (_ BitVec 32) (_ BitVec 64))) (size!18274 (_ BitVec 32))) )
))
(declare-fun lt!278082 () array!37317)

(declare-fun e!348606 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37317)

(declare-fun arrayContainsKey!0 (array!37317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608726 (= e!348606 (arrayContainsKey!0 lt!278082 (select (arr!17909 a!2986) j!136) index!984))))

(declare-fun b!608727 () Bool)

(declare-datatypes ((Unit!19458 0))(
  ( (Unit!19459) )
))
(declare-fun e!348607 () Unit!19458)

(declare-fun Unit!19460 () Unit!19458)

(assert (=> b!608727 (= e!348607 Unit!19460)))

(declare-fun b!608728 () Bool)

(declare-fun e!348609 () Unit!19458)

(declare-fun Unit!19461 () Unit!19458)

(assert (=> b!608728 (= e!348609 Unit!19461)))

(declare-fun lt!278085 () Unit!19458)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37317 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19458)

(assert (=> b!608728 (= lt!278085 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278082 (select (arr!17909 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608728 (arrayContainsKey!0 lt!278082 (select (arr!17909 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!278072 () Unit!19458)

(declare-datatypes ((List!11989 0))(
  ( (Nil!11986) (Cons!11985 (h!13030 (_ BitVec 64)) (t!18208 List!11989)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37317 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11989) Unit!19458)

(assert (=> b!608728 (= lt!278072 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11986))))

(declare-fun arrayNoDuplicates!0 (array!37317 (_ BitVec 32) List!11989) Bool)

(assert (=> b!608728 (arrayNoDuplicates!0 lt!278082 #b00000000000000000000000000000000 Nil!11986)))

(declare-fun lt!278074 () Unit!19458)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37317 (_ BitVec 32) (_ BitVec 32)) Unit!19458)

(assert (=> b!608728 (= lt!278074 (lemmaNoDuplicateFromThenFromBigger!0 lt!278082 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608728 (arrayNoDuplicates!0 lt!278082 j!136 Nil!11986)))

(declare-fun lt!278086 () Unit!19458)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37317 (_ BitVec 64) (_ BitVec 32) List!11989) Unit!19458)

(assert (=> b!608728 (= lt!278086 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278082 (select (arr!17909 a!2986) j!136) j!136 Nil!11986))))

(assert (=> b!608728 false))

(declare-fun b!608729 () Bool)

(declare-fun res!391473 () Bool)

(declare-fun e!348605 () Bool)

(assert (=> b!608729 (=> (not res!391473) (not e!348605))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37317 (_ BitVec 32)) Bool)

(assert (=> b!608729 (= res!391473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608730 () Bool)

(declare-fun Unit!19462 () Unit!19458)

(assert (=> b!608730 (= e!348609 Unit!19462)))

(declare-fun b!608731 () Bool)

(declare-fun res!391467 () Bool)

(declare-fun e!348612 () Bool)

(assert (=> b!608731 (=> res!391467 e!348612)))

(declare-fun contains!3011 (List!11989 (_ BitVec 64)) Bool)

(assert (=> b!608731 (= res!391467 (contains!3011 Nil!11986 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608732 () Bool)

(declare-fun res!391476 () Bool)

(assert (=> b!608732 (=> res!391476 e!348612)))

(assert (=> b!608732 (= res!391476 (contains!3011 Nil!11986 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608733 () Bool)

(declare-fun e!348603 () Bool)

(declare-fun e!348608 () Bool)

(assert (=> b!608733 (= e!348603 e!348608)))

(declare-fun res!391456 () Bool)

(assert (=> b!608733 (=> (not res!391456) (not e!348608))))

(assert (=> b!608733 (= res!391456 (arrayContainsKey!0 lt!278082 (select (arr!17909 a!2986) j!136) j!136))))

(declare-fun b!608734 () Bool)

(declare-fun e!348614 () Bool)

(assert (=> b!608734 (= e!348605 e!348614)))

(declare-fun res!391477 () Bool)

(assert (=> b!608734 (=> (not res!391477) (not e!348614))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!608734 (= res!391477 (= (select (store (arr!17909 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608734 (= lt!278082 (array!37318 (store (arr!17909 a!2986) i!1108 k0!1786) (size!18274 a!2986)))))

(declare-fun b!608735 () Bool)

(declare-fun e!348610 () Bool)

(declare-fun e!348602 () Bool)

(assert (=> b!608735 (= e!348610 e!348602)))

(declare-fun res!391461 () Bool)

(assert (=> b!608735 (=> res!391461 e!348602)))

(declare-fun lt!278070 () (_ BitVec 64))

(declare-fun lt!278071 () (_ BitVec 64))

(assert (=> b!608735 (= res!391461 (or (not (= (select (arr!17909 a!2986) j!136) lt!278070)) (not (= (select (arr!17909 a!2986) j!136) lt!278071))))))

(declare-fun e!348601 () Bool)

(assert (=> b!608735 e!348601))

(declare-fun res!391457 () Bool)

(assert (=> b!608735 (=> (not res!391457) (not e!348601))))

(assert (=> b!608735 (= res!391457 (= lt!278071 (select (arr!17909 a!2986) j!136)))))

(assert (=> b!608735 (= lt!278071 (select (store (arr!17909 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!608736 () Bool)

(declare-fun res!391474 () Bool)

(declare-fun e!348613 () Bool)

(assert (=> b!608736 (=> (not res!391474) (not e!348613))))

(assert (=> b!608736 (= res!391474 (and (= (size!18274 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18274 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18274 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608737 () Bool)

(assert (=> b!608737 (= e!348612 true)))

(declare-fun lt!278075 () Bool)

(assert (=> b!608737 (= lt!278075 (contains!3011 Nil!11986 k0!1786))))

(declare-fun b!608738 () Bool)

(assert (=> b!608738 (= e!348608 (arrayContainsKey!0 lt!278082 (select (arr!17909 a!2986) j!136) index!984))))

(declare-fun b!608739 () Bool)

(declare-fun e!348611 () Bool)

(assert (=> b!608739 (= e!348611 (not e!348610))))

(declare-fun res!391475 () Bool)

(assert (=> b!608739 (=> res!391475 e!348610)))

(declare-datatypes ((SeekEntryResult!6346 0))(
  ( (MissingZero!6346 (index!27659 (_ BitVec 32))) (Found!6346 (index!27660 (_ BitVec 32))) (Intermediate!6346 (undefined!7158 Bool) (index!27661 (_ BitVec 32)) (x!56474 (_ BitVec 32))) (Undefined!6346) (MissingVacant!6346 (index!27662 (_ BitVec 32))) )
))
(declare-fun lt!278077 () SeekEntryResult!6346)

(assert (=> b!608739 (= res!391475 (not (= lt!278077 (Found!6346 index!984))))))

(declare-fun lt!278073 () Unit!19458)

(assert (=> b!608739 (= lt!278073 e!348607)))

(declare-fun c!69002 () Bool)

(assert (=> b!608739 (= c!69002 (= lt!278077 Undefined!6346))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37317 (_ BitVec 32)) SeekEntryResult!6346)

(assert (=> b!608739 (= lt!278077 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278070 lt!278082 mask!3053))))

(declare-fun e!348615 () Bool)

(assert (=> b!608739 e!348615))

(declare-fun res!391465 () Bool)

(assert (=> b!608739 (=> (not res!391465) (not e!348615))))

(declare-fun lt!278079 () SeekEntryResult!6346)

(declare-fun lt!278078 () (_ BitVec 32))

(assert (=> b!608739 (= res!391465 (= lt!278079 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278078 vacantSpotIndex!68 lt!278070 lt!278082 mask!3053)))))

(assert (=> b!608739 (= lt!278079 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278078 vacantSpotIndex!68 (select (arr!17909 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608739 (= lt!278070 (select (store (arr!17909 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278076 () Unit!19458)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37317 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19458)

(assert (=> b!608739 (= lt!278076 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278078 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608739 (= lt!278078 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!608740 () Bool)

(declare-fun res!391472 () Bool)

(assert (=> b!608740 (=> (not res!391472) (not e!348613))))

(assert (=> b!608740 (= res!391472 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608741 () Bool)

(declare-fun Unit!19463 () Unit!19458)

(assert (=> b!608741 (= e!348607 Unit!19463)))

(assert (=> b!608741 false))

(declare-fun b!608742 () Bool)

(assert (=> b!608742 (= e!348614 e!348611)))

(declare-fun res!391478 () Bool)

(assert (=> b!608742 (=> (not res!391478) (not e!348611))))

(declare-fun lt!278084 () SeekEntryResult!6346)

(assert (=> b!608742 (= res!391478 (and (= lt!278084 (Found!6346 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17909 a!2986) index!984) (select (arr!17909 a!2986) j!136))) (not (= (select (arr!17909 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!608742 (= lt!278084 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17909 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608743 () Bool)

(declare-fun res!391470 () Bool)

(assert (=> b!608743 (=> (not res!391470) (not e!348605))))

(assert (=> b!608743 (= res!391470 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17909 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!391466 () Bool)

(assert (=> start!55572 (=> (not res!391466) (not e!348613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55572 (= res!391466 (validMask!0 mask!3053))))

(assert (=> start!55572 e!348613))

(assert (=> start!55572 true))

(declare-fun array_inv!13792 (array!37317) Bool)

(assert (=> start!55572 (array_inv!13792 a!2986)))

(declare-fun b!608744 () Bool)

(declare-fun res!391462 () Bool)

(assert (=> b!608744 (=> (not res!391462) (not e!348605))))

(assert (=> b!608744 (= res!391462 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11986))))

(declare-fun b!608745 () Bool)

(assert (=> b!608745 (= e!348601 e!348603)))

(declare-fun res!391471 () Bool)

(assert (=> b!608745 (=> res!391471 e!348603)))

(assert (=> b!608745 (= res!391471 (or (not (= (select (arr!17909 a!2986) j!136) lt!278070)) (not (= (select (arr!17909 a!2986) j!136) lt!278071)) (bvsge j!136 index!984)))))

(declare-fun b!608746 () Bool)

(declare-fun res!391464 () Bool)

(assert (=> b!608746 (=> (not res!391464) (not e!348613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608746 (= res!391464 (validKeyInArray!0 k0!1786))))

(declare-fun b!608747 () Bool)

(declare-fun e!348604 () Bool)

(assert (=> b!608747 (= e!348604 e!348612)))

(declare-fun res!391458 () Bool)

(assert (=> b!608747 (=> res!391458 e!348612)))

(assert (=> b!608747 (= res!391458 (or (bvsge (size!18274 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18274 a!2986))))))

(assert (=> b!608747 (arrayContainsKey!0 lt!278082 (select (arr!17909 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278083 () Unit!19458)

(assert (=> b!608747 (= lt!278083 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278082 (select (arr!17909 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!608747 e!348606))

(declare-fun res!391460 () Bool)

(assert (=> b!608747 (=> (not res!391460) (not e!348606))))

(assert (=> b!608747 (= res!391460 (arrayContainsKey!0 lt!278082 (select (arr!17909 a!2986) j!136) j!136))))

(declare-fun b!608748 () Bool)

(assert (=> b!608748 (= e!348615 (= lt!278084 lt!278079))))

(declare-fun b!608749 () Bool)

(assert (=> b!608749 (= e!348602 e!348604)))

(declare-fun res!391468 () Bool)

(assert (=> b!608749 (=> res!391468 e!348604)))

(assert (=> b!608749 (= res!391468 (bvsge index!984 j!136))))

(declare-fun lt!278080 () Unit!19458)

(assert (=> b!608749 (= lt!278080 e!348609)))

(declare-fun c!69003 () Bool)

(assert (=> b!608749 (= c!69003 (bvslt j!136 index!984))))

(declare-fun b!608750 () Bool)

(declare-fun res!391459 () Bool)

(assert (=> b!608750 (=> res!391459 e!348612)))

(declare-fun noDuplicate!338 (List!11989) Bool)

(assert (=> b!608750 (= res!391459 (not (noDuplicate!338 Nil!11986)))))

(declare-fun b!608751 () Bool)

(assert (=> b!608751 (= e!348613 e!348605)))

(declare-fun res!391463 () Bool)

(assert (=> b!608751 (=> (not res!391463) (not e!348605))))

(declare-fun lt!278081 () SeekEntryResult!6346)

(assert (=> b!608751 (= res!391463 (or (= lt!278081 (MissingZero!6346 i!1108)) (= lt!278081 (MissingVacant!6346 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37317 (_ BitVec 32)) SeekEntryResult!6346)

(assert (=> b!608751 (= lt!278081 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!608752 () Bool)

(declare-fun res!391469 () Bool)

(assert (=> b!608752 (=> (not res!391469) (not e!348613))))

(assert (=> b!608752 (= res!391469 (validKeyInArray!0 (select (arr!17909 a!2986) j!136)))))

(assert (= (and start!55572 res!391466) b!608736))

(assert (= (and b!608736 res!391474) b!608752))

(assert (= (and b!608752 res!391469) b!608746))

(assert (= (and b!608746 res!391464) b!608740))

(assert (= (and b!608740 res!391472) b!608751))

(assert (= (and b!608751 res!391463) b!608729))

(assert (= (and b!608729 res!391473) b!608744))

(assert (= (and b!608744 res!391462) b!608743))

(assert (= (and b!608743 res!391470) b!608734))

(assert (= (and b!608734 res!391477) b!608742))

(assert (= (and b!608742 res!391478) b!608739))

(assert (= (and b!608739 res!391465) b!608748))

(assert (= (and b!608739 c!69002) b!608741))

(assert (= (and b!608739 (not c!69002)) b!608727))

(assert (= (and b!608739 (not res!391475)) b!608735))

(assert (= (and b!608735 res!391457) b!608745))

(assert (= (and b!608745 (not res!391471)) b!608733))

(assert (= (and b!608733 res!391456) b!608738))

(assert (= (and b!608735 (not res!391461)) b!608749))

(assert (= (and b!608749 c!69003) b!608728))

(assert (= (and b!608749 (not c!69003)) b!608730))

(assert (= (and b!608749 (not res!391468)) b!608747))

(assert (= (and b!608747 res!391460) b!608726))

(assert (= (and b!608747 (not res!391458)) b!608750))

(assert (= (and b!608750 (not res!391459)) b!608731))

(assert (= (and b!608731 (not res!391467)) b!608732))

(assert (= (and b!608732 (not res!391476)) b!608737))

(declare-fun m!584791 () Bool)

(assert (=> b!608740 m!584791))

(declare-fun m!584793 () Bool)

(assert (=> b!608742 m!584793))

(declare-fun m!584795 () Bool)

(assert (=> b!608742 m!584795))

(assert (=> b!608742 m!584795))

(declare-fun m!584797 () Bool)

(assert (=> b!608742 m!584797))

(assert (=> b!608745 m!584795))

(assert (=> b!608735 m!584795))

(declare-fun m!584799 () Bool)

(assert (=> b!608735 m!584799))

(declare-fun m!584801 () Bool)

(assert (=> b!608735 m!584801))

(declare-fun m!584803 () Bool)

(assert (=> b!608732 m!584803))

(assert (=> b!608738 m!584795))

(assert (=> b!608738 m!584795))

(declare-fun m!584805 () Bool)

(assert (=> b!608738 m!584805))

(declare-fun m!584807 () Bool)

(assert (=> b!608729 m!584807))

(declare-fun m!584809 () Bool)

(assert (=> b!608731 m!584809))

(assert (=> b!608752 m!584795))

(assert (=> b!608752 m!584795))

(declare-fun m!584811 () Bool)

(assert (=> b!608752 m!584811))

(declare-fun m!584813 () Bool)

(assert (=> b!608751 m!584813))

(assert (=> b!608733 m!584795))

(assert (=> b!608733 m!584795))

(declare-fun m!584815 () Bool)

(assert (=> b!608733 m!584815))

(declare-fun m!584817 () Bool)

(assert (=> start!55572 m!584817))

(declare-fun m!584819 () Bool)

(assert (=> start!55572 m!584819))

(assert (=> b!608734 m!584799))

(declare-fun m!584821 () Bool)

(assert (=> b!608734 m!584821))

(declare-fun m!584823 () Bool)

(assert (=> b!608737 m!584823))

(declare-fun m!584825 () Bool)

(assert (=> b!608739 m!584825))

(assert (=> b!608739 m!584795))

(assert (=> b!608739 m!584799))

(assert (=> b!608739 m!584795))

(declare-fun m!584827 () Bool)

(assert (=> b!608739 m!584827))

(declare-fun m!584829 () Bool)

(assert (=> b!608739 m!584829))

(declare-fun m!584831 () Bool)

(assert (=> b!608739 m!584831))

(declare-fun m!584833 () Bool)

(assert (=> b!608739 m!584833))

(declare-fun m!584835 () Bool)

(assert (=> b!608739 m!584835))

(declare-fun m!584837 () Bool)

(assert (=> b!608746 m!584837))

(declare-fun m!584839 () Bool)

(assert (=> b!608744 m!584839))

(declare-fun m!584841 () Bool)

(assert (=> b!608743 m!584841))

(assert (=> b!608747 m!584795))

(assert (=> b!608747 m!584795))

(declare-fun m!584843 () Bool)

(assert (=> b!608747 m!584843))

(assert (=> b!608747 m!584795))

(declare-fun m!584845 () Bool)

(assert (=> b!608747 m!584845))

(assert (=> b!608747 m!584795))

(assert (=> b!608747 m!584815))

(assert (=> b!608728 m!584795))

(declare-fun m!584847 () Bool)

(assert (=> b!608728 m!584847))

(assert (=> b!608728 m!584795))

(declare-fun m!584849 () Bool)

(assert (=> b!608728 m!584849))

(declare-fun m!584851 () Bool)

(assert (=> b!608728 m!584851))

(assert (=> b!608728 m!584795))

(declare-fun m!584853 () Bool)

(assert (=> b!608728 m!584853))

(declare-fun m!584855 () Bool)

(assert (=> b!608728 m!584855))

(assert (=> b!608728 m!584795))

(declare-fun m!584857 () Bool)

(assert (=> b!608728 m!584857))

(declare-fun m!584859 () Bool)

(assert (=> b!608728 m!584859))

(declare-fun m!584861 () Bool)

(assert (=> b!608750 m!584861))

(assert (=> b!608726 m!584795))

(assert (=> b!608726 m!584795))

(assert (=> b!608726 m!584805))

(check-sat (not b!608739) (not b!608737) (not start!55572) (not b!608742) (not b!608731) (not b!608726) (not b!608750) (not b!608729) (not b!608728) (not b!608751) (not b!608740) (not b!608744) (not b!608752) (not b!608732) (not b!608738) (not b!608747) (not b!608746) (not b!608733))
(check-sat)
