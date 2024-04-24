; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54036 () Bool)

(assert start!54036)

(declare-fun b!589982 () Bool)

(declare-fun res!377353 () Bool)

(declare-fun e!336825 () Bool)

(assert (=> b!589982 (=> (not res!377353) (not e!336825))))

(declare-datatypes ((array!36825 0))(
  ( (array!36826 (arr!17683 (Array (_ BitVec 32) (_ BitVec 64))) (size!18047 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36825)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589982 (= res!377353 (validKeyInArray!0 (select (arr!17683 a!2986) j!136)))))

(declare-fun b!589984 () Bool)

(declare-datatypes ((Unit!18409 0))(
  ( (Unit!18410) )
))
(declare-fun e!336827 () Unit!18409)

(declare-fun Unit!18411 () Unit!18409)

(assert (=> b!589984 (= e!336827 Unit!18411)))

(declare-fun b!589985 () Bool)

(declare-fun e!336830 () Bool)

(declare-fun e!336829 () Bool)

(assert (=> b!589985 (= e!336830 e!336829)))

(declare-fun res!377350 () Bool)

(assert (=> b!589985 (=> (not res!377350) (not e!336829))))

(declare-datatypes ((SeekEntryResult!6079 0))(
  ( (MissingZero!6079 (index!26546 (_ BitVec 32))) (Found!6079 (index!26547 (_ BitVec 32))) (Intermediate!6079 (undefined!6891 Bool) (index!26548 (_ BitVec 32)) (x!55488 (_ BitVec 32))) (Undefined!6079) (MissingVacant!6079 (index!26549 (_ BitVec 32))) )
))
(declare-fun lt!267640 () SeekEntryResult!6079)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589985 (= res!377350 (and (= lt!267640 (Found!6079 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17683 a!2986) index!984) (select (arr!17683 a!2986) j!136))) (not (= (select (arr!17683 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36825 (_ BitVec 32)) SeekEntryResult!6079)

(assert (=> b!589985 (= lt!267640 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17683 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589986 () Bool)

(declare-fun res!377348 () Bool)

(assert (=> b!589986 (=> (not res!377348) (not e!336825))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589986 (= res!377348 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589987 () Bool)

(declare-fun e!336828 () Bool)

(assert (=> b!589987 (= e!336829 (not e!336828))))

(declare-fun res!377354 () Bool)

(assert (=> b!589987 (=> res!377354 e!336828)))

(declare-fun lt!267634 () SeekEntryResult!6079)

(assert (=> b!589987 (= res!377354 (not (= lt!267634 (Found!6079 index!984))))))

(declare-fun lt!267637 () Unit!18409)

(assert (=> b!589987 (= lt!267637 e!336827)))

(declare-fun c!66686 () Bool)

(assert (=> b!589987 (= c!66686 (= lt!267634 Undefined!6079))))

(declare-fun lt!267639 () array!36825)

(declare-fun lt!267636 () (_ BitVec 64))

(assert (=> b!589987 (= lt!267634 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267636 lt!267639 mask!3053))))

(declare-fun e!336831 () Bool)

(assert (=> b!589987 e!336831))

(declare-fun res!377352 () Bool)

(assert (=> b!589987 (=> (not res!377352) (not e!336831))))

(declare-fun lt!267635 () (_ BitVec 32))

(declare-fun lt!267638 () SeekEntryResult!6079)

(assert (=> b!589987 (= res!377352 (= lt!267638 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267635 vacantSpotIndex!68 lt!267636 lt!267639 mask!3053)))))

(assert (=> b!589987 (= lt!267638 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267635 vacantSpotIndex!68 (select (arr!17683 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589987 (= lt!267636 (select (store (arr!17683 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267633 () Unit!18409)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18409)

(assert (=> b!589987 (= lt!267633 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267635 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589987 (= lt!267635 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!589988 () Bool)

(declare-fun res!377347 () Bool)

(declare-fun e!336824 () Bool)

(assert (=> b!589988 (=> (not res!377347) (not e!336824))))

(assert (=> b!589988 (= res!377347 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17683 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589989 () Bool)

(declare-fun res!377349 () Bool)

(assert (=> b!589989 (=> (not res!377349) (not e!336825))))

(assert (=> b!589989 (= res!377349 (and (= (size!18047 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18047 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18047 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589990 () Bool)

(declare-fun res!377351 () Bool)

(assert (=> b!589990 (=> (not res!377351) (not e!336825))))

(assert (=> b!589990 (= res!377351 (validKeyInArray!0 k0!1786))))

(declare-fun b!589991 () Bool)

(assert (=> b!589991 (= e!336828 true)))

(assert (=> b!589991 (= (select (store (arr!17683 a!2986) i!1108 k0!1786) index!984) (select (arr!17683 a!2986) j!136))))

(declare-fun b!589992 () Bool)

(assert (=> b!589992 (= e!336825 e!336824)))

(declare-fun res!377357 () Bool)

(assert (=> b!589992 (=> (not res!377357) (not e!336824))))

(declare-fun lt!267632 () SeekEntryResult!6079)

(assert (=> b!589992 (= res!377357 (or (= lt!267632 (MissingZero!6079 i!1108)) (= lt!267632 (MissingVacant!6079 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36825 (_ BitVec 32)) SeekEntryResult!6079)

(assert (=> b!589992 (= lt!267632 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!589993 () Bool)

(declare-fun Unit!18412 () Unit!18409)

(assert (=> b!589993 (= e!336827 Unit!18412)))

(assert (=> b!589993 false))

(declare-fun b!589994 () Bool)

(assert (=> b!589994 (= e!336831 (= lt!267640 lt!267638))))

(declare-fun b!589983 () Bool)

(assert (=> b!589983 (= e!336824 e!336830)))

(declare-fun res!377355 () Bool)

(assert (=> b!589983 (=> (not res!377355) (not e!336830))))

(assert (=> b!589983 (= res!377355 (= (select (store (arr!17683 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589983 (= lt!267639 (array!36826 (store (arr!17683 a!2986) i!1108 k0!1786) (size!18047 a!2986)))))

(declare-fun res!377359 () Bool)

(assert (=> start!54036 (=> (not res!377359) (not e!336825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54036 (= res!377359 (validMask!0 mask!3053))))

(assert (=> start!54036 e!336825))

(assert (=> start!54036 true))

(declare-fun array_inv!13542 (array!36825) Bool)

(assert (=> start!54036 (array_inv!13542 a!2986)))

(declare-fun b!589995 () Bool)

(declare-fun res!377358 () Bool)

(assert (=> b!589995 (=> (not res!377358) (not e!336824))))

(declare-datatypes ((List!11631 0))(
  ( (Nil!11628) (Cons!11627 (h!12675 (_ BitVec 64)) (t!17851 List!11631)) )
))
(declare-fun arrayNoDuplicates!0 (array!36825 (_ BitVec 32) List!11631) Bool)

(assert (=> b!589995 (= res!377358 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11628))))

(declare-fun b!589996 () Bool)

(declare-fun res!377356 () Bool)

(assert (=> b!589996 (=> (not res!377356) (not e!336824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36825 (_ BitVec 32)) Bool)

(assert (=> b!589996 (= res!377356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!54036 res!377359) b!589989))

(assert (= (and b!589989 res!377349) b!589982))

(assert (= (and b!589982 res!377353) b!589990))

(assert (= (and b!589990 res!377351) b!589986))

(assert (= (and b!589986 res!377348) b!589992))

(assert (= (and b!589992 res!377357) b!589996))

(assert (= (and b!589996 res!377356) b!589995))

(assert (= (and b!589995 res!377358) b!589988))

(assert (= (and b!589988 res!377347) b!589983))

(assert (= (and b!589983 res!377355) b!589985))

(assert (= (and b!589985 res!377350) b!589987))

(assert (= (and b!589987 res!377352) b!589994))

(assert (= (and b!589987 c!66686) b!589993))

(assert (= (and b!589987 (not c!66686)) b!589984))

(assert (= (and b!589987 (not res!377354)) b!589991))

(declare-fun m!568643 () Bool)

(assert (=> b!589985 m!568643))

(declare-fun m!568645 () Bool)

(assert (=> b!589985 m!568645))

(assert (=> b!589985 m!568645))

(declare-fun m!568647 () Bool)

(assert (=> b!589985 m!568647))

(assert (=> b!589982 m!568645))

(assert (=> b!589982 m!568645))

(declare-fun m!568649 () Bool)

(assert (=> b!589982 m!568649))

(declare-fun m!568651 () Bool)

(assert (=> b!589987 m!568651))

(declare-fun m!568653 () Bool)

(assert (=> b!589987 m!568653))

(assert (=> b!589987 m!568645))

(declare-fun m!568655 () Bool)

(assert (=> b!589987 m!568655))

(assert (=> b!589987 m!568645))

(declare-fun m!568657 () Bool)

(assert (=> b!589987 m!568657))

(declare-fun m!568659 () Bool)

(assert (=> b!589987 m!568659))

(declare-fun m!568661 () Bool)

(assert (=> b!589987 m!568661))

(declare-fun m!568663 () Bool)

(assert (=> b!589987 m!568663))

(declare-fun m!568665 () Bool)

(assert (=> b!589996 m!568665))

(declare-fun m!568667 () Bool)

(assert (=> start!54036 m!568667))

(declare-fun m!568669 () Bool)

(assert (=> start!54036 m!568669))

(declare-fun m!568671 () Bool)

(assert (=> b!589990 m!568671))

(declare-fun m!568673 () Bool)

(assert (=> b!589995 m!568673))

(declare-fun m!568675 () Bool)

(assert (=> b!589988 m!568675))

(declare-fun m!568677 () Bool)

(assert (=> b!589992 m!568677))

(assert (=> b!589983 m!568655))

(declare-fun m!568679 () Bool)

(assert (=> b!589983 m!568679))

(declare-fun m!568681 () Bool)

(assert (=> b!589986 m!568681))

(assert (=> b!589991 m!568655))

(declare-fun m!568683 () Bool)

(assert (=> b!589991 m!568683))

(assert (=> b!589991 m!568645))

(check-sat (not b!589985) (not b!589982) (not b!589996) (not b!589986) (not b!589995) (not b!589990) (not b!589987) (not start!54036) (not b!589992))
(check-sat)
