; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55158 () Bool)

(assert start!55158)

(declare-fun b!604651 () Bool)

(declare-fun res!388548 () Bool)

(declare-fun e!345999 () Bool)

(assert (=> b!604651 (=> (not res!388548) (not e!345999))))

(declare-datatypes ((array!37231 0))(
  ( (array!37232 (arr!17872 (Array (_ BitVec 32) (_ BitVec 64))) (size!18236 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37231)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37231 (_ BitVec 32)) Bool)

(assert (=> b!604651 (= res!388548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!604652 () Bool)

(declare-fun res!388546 () Bool)

(declare-fun e!345998 () Bool)

(assert (=> b!604652 (=> (not res!388546) (not e!345998))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604652 (= res!388546 (validKeyInArray!0 k0!1786))))

(declare-fun b!604653 () Bool)

(declare-fun e!346001 () Bool)

(declare-fun e!345996 () Bool)

(assert (=> b!604653 (= e!346001 e!345996)))

(declare-fun res!388537 () Bool)

(assert (=> b!604653 (=> (not res!388537) (not e!345996))))

(declare-datatypes ((SeekEntryResult!6312 0))(
  ( (MissingZero!6312 (index!27511 (_ BitVec 32))) (Found!6312 (index!27512 (_ BitVec 32))) (Intermediate!6312 (undefined!7124 Bool) (index!27513 (_ BitVec 32)) (x!56305 (_ BitVec 32))) (Undefined!6312) (MissingVacant!6312 (index!27514 (_ BitVec 32))) )
))
(declare-fun lt!275817 () SeekEntryResult!6312)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!604653 (= res!388537 (and (= lt!275817 (Found!6312 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17872 a!2986) index!984) (select (arr!17872 a!2986) j!136))) (not (= (select (arr!17872 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37231 (_ BitVec 32)) SeekEntryResult!6312)

(assert (=> b!604653 (= lt!275817 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17872 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604654 () Bool)

(assert (=> b!604654 (= e!345998 e!345999)))

(declare-fun res!388540 () Bool)

(assert (=> b!604654 (=> (not res!388540) (not e!345999))))

(declare-fun lt!275812 () SeekEntryResult!6312)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!604654 (= res!388540 (or (= lt!275812 (MissingZero!6312 i!1108)) (= lt!275812 (MissingVacant!6312 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37231 (_ BitVec 32)) SeekEntryResult!6312)

(assert (=> b!604654 (= lt!275812 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!604655 () Bool)

(declare-fun res!388549 () Bool)

(assert (=> b!604655 (=> (not res!388549) (not e!345998))))

(assert (=> b!604655 (= res!388549 (validKeyInArray!0 (select (arr!17872 a!2986) j!136)))))

(declare-fun b!604656 () Bool)

(declare-fun e!345993 () Bool)

(assert (=> b!604656 (= e!345996 (not e!345993))))

(declare-fun res!388544 () Bool)

(assert (=> b!604656 (=> res!388544 e!345993)))

(declare-fun lt!275810 () SeekEntryResult!6312)

(assert (=> b!604656 (= res!388544 (not (= lt!275810 (Found!6312 index!984))))))

(declare-datatypes ((Unit!19252 0))(
  ( (Unit!19253) )
))
(declare-fun lt!275815 () Unit!19252)

(declare-fun e!345992 () Unit!19252)

(assert (=> b!604656 (= lt!275815 e!345992)))

(declare-fun c!68425 () Bool)

(assert (=> b!604656 (= c!68425 (= lt!275810 Undefined!6312))))

(declare-fun lt!275821 () array!37231)

(declare-fun lt!275814 () (_ BitVec 64))

(assert (=> b!604656 (= lt!275810 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275814 lt!275821 mask!3053))))

(declare-fun e!345995 () Bool)

(assert (=> b!604656 e!345995))

(declare-fun res!388535 () Bool)

(assert (=> b!604656 (=> (not res!388535) (not e!345995))))

(declare-fun lt!275820 () (_ BitVec 32))

(declare-fun lt!275813 () SeekEntryResult!6312)

(assert (=> b!604656 (= res!388535 (= lt!275813 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275820 vacantSpotIndex!68 lt!275814 lt!275821 mask!3053)))))

(assert (=> b!604656 (= lt!275813 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275820 vacantSpotIndex!68 (select (arr!17872 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!604656 (= lt!275814 (select (store (arr!17872 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275811 () Unit!19252)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37231 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19252)

(assert (=> b!604656 (= lt!275811 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275820 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604656 (= lt!275820 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!604657 () Bool)

(declare-fun res!388543 () Bool)

(assert (=> b!604657 (=> (not res!388543) (not e!345998))))

(declare-fun arrayContainsKey!0 (array!37231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604657 (= res!388543 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!604658 () Bool)

(declare-fun Unit!19254 () Unit!19252)

(assert (=> b!604658 (= e!345992 Unit!19254)))

(declare-fun b!604659 () Bool)

(assert (=> b!604659 (= e!345995 (= lt!275817 lt!275813))))

(declare-fun b!604660 () Bool)

(declare-fun res!388553 () Bool)

(assert (=> b!604660 (=> (not res!388553) (not e!345998))))

(assert (=> b!604660 (= res!388553 (and (= (size!18236 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18236 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18236 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604661 () Bool)

(declare-fun e!346004 () Unit!19252)

(declare-fun Unit!19255 () Unit!19252)

(assert (=> b!604661 (= e!346004 Unit!19255)))

(declare-fun lt!275807 () Unit!19252)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37231 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19252)

(assert (=> b!604661 (= lt!275807 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275821 (select (arr!17872 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!604661 (arrayContainsKey!0 lt!275821 (select (arr!17872 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275816 () Unit!19252)

(declare-datatypes ((List!11913 0))(
  ( (Nil!11910) (Cons!11909 (h!12954 (_ BitVec 64)) (t!18141 List!11913)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37231 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11913) Unit!19252)

(assert (=> b!604661 (= lt!275816 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11910))))

(declare-fun arrayNoDuplicates!0 (array!37231 (_ BitVec 32) List!11913) Bool)

(assert (=> b!604661 (arrayNoDuplicates!0 lt!275821 #b00000000000000000000000000000000 Nil!11910)))

(declare-fun lt!275806 () Unit!19252)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37231 (_ BitVec 32) (_ BitVec 32)) Unit!19252)

(assert (=> b!604661 (= lt!275806 (lemmaNoDuplicateFromThenFromBigger!0 lt!275821 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604661 (arrayNoDuplicates!0 lt!275821 j!136 Nil!11910)))

(declare-fun lt!275818 () Unit!19252)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37231 (_ BitVec 64) (_ BitVec 32) List!11913) Unit!19252)

(assert (=> b!604661 (= lt!275818 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275821 (select (arr!17872 a!2986) j!136) j!136 Nil!11910))))

(assert (=> b!604661 false))

(declare-fun b!604662 () Bool)

(declare-fun Unit!19256 () Unit!19252)

(assert (=> b!604662 (= e!346004 Unit!19256)))

(declare-fun b!604663 () Bool)

(declare-fun e!345997 () Bool)

(assert (=> b!604663 (= e!345993 e!345997)))

(declare-fun res!388547 () Bool)

(assert (=> b!604663 (=> res!388547 e!345997)))

(declare-fun lt!275809 () (_ BitVec 64))

(assert (=> b!604663 (= res!388547 (or (not (= (select (arr!17872 a!2986) j!136) lt!275814)) (not (= (select (arr!17872 a!2986) j!136) lt!275809))))))

(declare-fun e!346003 () Bool)

(assert (=> b!604663 e!346003))

(declare-fun res!388541 () Bool)

(assert (=> b!604663 (=> (not res!388541) (not e!346003))))

(assert (=> b!604663 (= res!388541 (= lt!275809 (select (arr!17872 a!2986) j!136)))))

(assert (=> b!604663 (= lt!275809 (select (store (arr!17872 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!604664 () Bool)

(declare-fun e!346005 () Bool)

(assert (=> b!604664 (= e!346005 (arrayContainsKey!0 lt!275821 (select (arr!17872 a!2986) j!136) index!984))))

(declare-fun b!604665 () Bool)

(declare-fun res!388551 () Bool)

(assert (=> b!604665 (=> (not res!388551) (not e!345999))))

(assert (=> b!604665 (= res!388551 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17872 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604666 () Bool)

(assert (=> b!604666 (= e!345999 e!346001)))

(declare-fun res!388545 () Bool)

(assert (=> b!604666 (=> (not res!388545) (not e!346001))))

(assert (=> b!604666 (= res!388545 (= (select (store (arr!17872 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604666 (= lt!275821 (array!37232 (store (arr!17872 a!2986) i!1108 k0!1786) (size!18236 a!2986)))))

(declare-fun b!604667 () Bool)

(declare-fun res!388550 () Bool)

(assert (=> b!604667 (=> (not res!388550) (not e!345999))))

(assert (=> b!604667 (= res!388550 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11910))))

(declare-fun e!346000 () Bool)

(declare-fun b!604668 () Bool)

(assert (=> b!604668 (= e!346000 (arrayContainsKey!0 lt!275821 (select (arr!17872 a!2986) j!136) index!984))))

(declare-fun b!604669 () Bool)

(declare-fun e!345991 () Bool)

(assert (=> b!604669 (= e!345991 (or (bvslt (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18236 a!2986)) (bvslt (size!18236 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!604669 (arrayContainsKey!0 lt!275821 (select (arr!17872 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275819 () Unit!19252)

(assert (=> b!604669 (= lt!275819 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275821 (select (arr!17872 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!604669 e!346005))

(declare-fun res!388539 () Bool)

(assert (=> b!604669 (=> (not res!388539) (not e!346005))))

(assert (=> b!604669 (= res!388539 (arrayContainsKey!0 lt!275821 (select (arr!17872 a!2986) j!136) j!136))))

(declare-fun res!388542 () Bool)

(assert (=> start!55158 (=> (not res!388542) (not e!345998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55158 (= res!388542 (validMask!0 mask!3053))))

(assert (=> start!55158 e!345998))

(assert (=> start!55158 true))

(declare-fun array_inv!13668 (array!37231) Bool)

(assert (=> start!55158 (array_inv!13668 a!2986)))

(declare-fun b!604670 () Bool)

(declare-fun Unit!19257 () Unit!19252)

(assert (=> b!604670 (= e!345992 Unit!19257)))

(assert (=> b!604670 false))

(declare-fun b!604671 () Bool)

(declare-fun e!346002 () Bool)

(assert (=> b!604671 (= e!346002 e!346000)))

(declare-fun res!388536 () Bool)

(assert (=> b!604671 (=> (not res!388536) (not e!346000))))

(assert (=> b!604671 (= res!388536 (arrayContainsKey!0 lt!275821 (select (arr!17872 a!2986) j!136) j!136))))

(declare-fun b!604672 () Bool)

(assert (=> b!604672 (= e!346003 e!346002)))

(declare-fun res!388538 () Bool)

(assert (=> b!604672 (=> res!388538 e!346002)))

(assert (=> b!604672 (= res!388538 (or (not (= (select (arr!17872 a!2986) j!136) lt!275814)) (not (= (select (arr!17872 a!2986) j!136) lt!275809)) (bvsge j!136 index!984)))))

(declare-fun b!604673 () Bool)

(assert (=> b!604673 (= e!345997 e!345991)))

(declare-fun res!388552 () Bool)

(assert (=> b!604673 (=> res!388552 e!345991)))

(assert (=> b!604673 (= res!388552 (bvsge index!984 j!136))))

(declare-fun lt!275808 () Unit!19252)

(assert (=> b!604673 (= lt!275808 e!346004)))

(declare-fun c!68426 () Bool)

(assert (=> b!604673 (= c!68426 (bvslt j!136 index!984))))

(assert (= (and start!55158 res!388542) b!604660))

(assert (= (and b!604660 res!388553) b!604655))

(assert (= (and b!604655 res!388549) b!604652))

(assert (= (and b!604652 res!388546) b!604657))

(assert (= (and b!604657 res!388543) b!604654))

(assert (= (and b!604654 res!388540) b!604651))

(assert (= (and b!604651 res!388548) b!604667))

(assert (= (and b!604667 res!388550) b!604665))

(assert (= (and b!604665 res!388551) b!604666))

(assert (= (and b!604666 res!388545) b!604653))

(assert (= (and b!604653 res!388537) b!604656))

(assert (= (and b!604656 res!388535) b!604659))

(assert (= (and b!604656 c!68425) b!604670))

(assert (= (and b!604656 (not c!68425)) b!604658))

(assert (= (and b!604656 (not res!388544)) b!604663))

(assert (= (and b!604663 res!388541) b!604672))

(assert (= (and b!604672 (not res!388538)) b!604671))

(assert (= (and b!604671 res!388536) b!604668))

(assert (= (and b!604663 (not res!388547)) b!604673))

(assert (= (and b!604673 c!68426) b!604661))

(assert (= (and b!604673 (not c!68426)) b!604662))

(assert (= (and b!604673 (not res!388552)) b!604669))

(assert (= (and b!604669 res!388539) b!604664))

(declare-fun m!581541 () Bool)

(assert (=> b!604657 m!581541))

(declare-fun m!581543 () Bool)

(assert (=> b!604653 m!581543))

(declare-fun m!581545 () Bool)

(assert (=> b!604653 m!581545))

(assert (=> b!604653 m!581545))

(declare-fun m!581547 () Bool)

(assert (=> b!604653 m!581547))

(assert (=> b!604655 m!581545))

(assert (=> b!604655 m!581545))

(declare-fun m!581549 () Bool)

(assert (=> b!604655 m!581549))

(assert (=> b!604672 m!581545))

(declare-fun m!581551 () Bool)

(assert (=> b!604665 m!581551))

(assert (=> b!604671 m!581545))

(assert (=> b!604671 m!581545))

(declare-fun m!581553 () Bool)

(assert (=> b!604671 m!581553))

(declare-fun m!581555 () Bool)

(assert (=> b!604654 m!581555))

(assert (=> b!604663 m!581545))

(declare-fun m!581557 () Bool)

(assert (=> b!604663 m!581557))

(declare-fun m!581559 () Bool)

(assert (=> b!604663 m!581559))

(declare-fun m!581561 () Bool)

(assert (=> start!55158 m!581561))

(declare-fun m!581563 () Bool)

(assert (=> start!55158 m!581563))

(declare-fun m!581565 () Bool)

(assert (=> b!604652 m!581565))

(declare-fun m!581567 () Bool)

(assert (=> b!604656 m!581567))

(declare-fun m!581569 () Bool)

(assert (=> b!604656 m!581569))

(declare-fun m!581571 () Bool)

(assert (=> b!604656 m!581571))

(assert (=> b!604656 m!581545))

(assert (=> b!604656 m!581557))

(declare-fun m!581573 () Bool)

(assert (=> b!604656 m!581573))

(declare-fun m!581575 () Bool)

(assert (=> b!604656 m!581575))

(assert (=> b!604656 m!581545))

(declare-fun m!581577 () Bool)

(assert (=> b!604656 m!581577))

(assert (=> b!604669 m!581545))

(assert (=> b!604669 m!581545))

(declare-fun m!581579 () Bool)

(assert (=> b!604669 m!581579))

(assert (=> b!604669 m!581545))

(declare-fun m!581581 () Bool)

(assert (=> b!604669 m!581581))

(assert (=> b!604669 m!581545))

(assert (=> b!604669 m!581553))

(assert (=> b!604664 m!581545))

(assert (=> b!604664 m!581545))

(declare-fun m!581583 () Bool)

(assert (=> b!604664 m!581583))

(assert (=> b!604666 m!581557))

(declare-fun m!581585 () Bool)

(assert (=> b!604666 m!581585))

(declare-fun m!581587 () Bool)

(assert (=> b!604667 m!581587))

(declare-fun m!581589 () Bool)

(assert (=> b!604651 m!581589))

(assert (=> b!604668 m!581545))

(assert (=> b!604668 m!581545))

(assert (=> b!604668 m!581583))

(assert (=> b!604661 m!581545))

(declare-fun m!581591 () Bool)

(assert (=> b!604661 m!581591))

(assert (=> b!604661 m!581545))

(assert (=> b!604661 m!581545))

(declare-fun m!581593 () Bool)

(assert (=> b!604661 m!581593))

(declare-fun m!581595 () Bool)

(assert (=> b!604661 m!581595))

(declare-fun m!581597 () Bool)

(assert (=> b!604661 m!581597))

(assert (=> b!604661 m!581545))

(declare-fun m!581599 () Bool)

(assert (=> b!604661 m!581599))

(declare-fun m!581601 () Bool)

(assert (=> b!604661 m!581601))

(declare-fun m!581603 () Bool)

(assert (=> b!604661 m!581603))

(check-sat (not b!604664) (not b!604667) (not b!604653) (not b!604654) (not b!604652) (not b!604661) (not b!604657) (not b!604651) (not start!55158) (not b!604671) (not b!604668) (not b!604655) (not b!604669) (not b!604656))
(check-sat)
(get-model)

(declare-fun d!87437 () Bool)

(assert (=> d!87437 (= (validKeyInArray!0 (select (arr!17872 a!2986) j!136)) (and (not (= (select (arr!17872 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17872 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!604655 d!87437))

(declare-fun b!604753 () Bool)

(declare-fun e!346059 () Bool)

(declare-fun contains!2991 (List!11913 (_ BitVec 64)) Bool)

(assert (=> b!604753 (= e!346059 (contains!2991 Nil!11910 (select (arr!17872 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87439 () Bool)

(declare-fun res!388618 () Bool)

(declare-fun e!346060 () Bool)

(assert (=> d!87439 (=> res!388618 e!346060)))

(assert (=> d!87439 (= res!388618 (bvsge #b00000000000000000000000000000000 (size!18236 a!2986)))))

(assert (=> d!87439 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11910) e!346060)))

(declare-fun bm!33014 () Bool)

(declare-fun call!33017 () Bool)

(declare-fun c!68435 () Bool)

(assert (=> bm!33014 (= call!33017 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68435 (Cons!11909 (select (arr!17872 a!2986) #b00000000000000000000000000000000) Nil!11910) Nil!11910)))))

(declare-fun b!604754 () Bool)

(declare-fun e!346061 () Bool)

(assert (=> b!604754 (= e!346060 e!346061)))

(declare-fun res!388619 () Bool)

(assert (=> b!604754 (=> (not res!388619) (not e!346061))))

(assert (=> b!604754 (= res!388619 (not e!346059))))

(declare-fun res!388617 () Bool)

(assert (=> b!604754 (=> (not res!388617) (not e!346059))))

(assert (=> b!604754 (= res!388617 (validKeyInArray!0 (select (arr!17872 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!604755 () Bool)

(declare-fun e!346062 () Bool)

(assert (=> b!604755 (= e!346061 e!346062)))

(assert (=> b!604755 (= c!68435 (validKeyInArray!0 (select (arr!17872 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!604756 () Bool)

(assert (=> b!604756 (= e!346062 call!33017)))

(declare-fun b!604757 () Bool)

(assert (=> b!604757 (= e!346062 call!33017)))

(assert (= (and d!87439 (not res!388618)) b!604754))

(assert (= (and b!604754 res!388617) b!604753))

(assert (= (and b!604754 res!388619) b!604755))

(assert (= (and b!604755 c!68435) b!604757))

(assert (= (and b!604755 (not c!68435)) b!604756))

(assert (= (or b!604757 b!604756) bm!33014))

(declare-fun m!581669 () Bool)

(assert (=> b!604753 m!581669))

(assert (=> b!604753 m!581669))

(declare-fun m!581671 () Bool)

(assert (=> b!604753 m!581671))

(assert (=> bm!33014 m!581669))

(declare-fun m!581673 () Bool)

(assert (=> bm!33014 m!581673))

(assert (=> b!604754 m!581669))

(assert (=> b!604754 m!581669))

(declare-fun m!581675 () Bool)

(assert (=> b!604754 m!581675))

(assert (=> b!604755 m!581669))

(assert (=> b!604755 m!581669))

(assert (=> b!604755 m!581675))

(assert (=> b!604667 d!87439))

(declare-fun d!87441 () Bool)

(declare-fun e!346065 () Bool)

(assert (=> d!87441 e!346065))

(declare-fun res!388622 () Bool)

(assert (=> d!87441 (=> (not res!388622) (not e!346065))))

(assert (=> d!87441 (= res!388622 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18236 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18236 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18236 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18236 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18236 a!2986))))))

(declare-fun lt!275872 () Unit!19252)

(declare-fun choose!9 (array!37231 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19252)

(assert (=> d!87441 (= lt!275872 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275820 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87441 (validMask!0 mask!3053)))

(assert (=> d!87441 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275820 vacantSpotIndex!68 mask!3053) lt!275872)))

(declare-fun b!604760 () Bool)

(assert (=> b!604760 (= e!346065 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275820 vacantSpotIndex!68 (select (arr!17872 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275820 vacantSpotIndex!68 (select (store (arr!17872 a!2986) i!1108 k0!1786) j!136) (array!37232 (store (arr!17872 a!2986) i!1108 k0!1786) (size!18236 a!2986)) mask!3053)))))

(assert (= (and d!87441 res!388622) b!604760))

(declare-fun m!581677 () Bool)

(assert (=> d!87441 m!581677))

(assert (=> d!87441 m!581561))

(assert (=> b!604760 m!581545))

(assert (=> b!604760 m!581577))

(assert (=> b!604760 m!581557))

(assert (=> b!604760 m!581545))

(assert (=> b!604760 m!581571))

(assert (=> b!604760 m!581571))

(declare-fun m!581679 () Bool)

(assert (=> b!604760 m!581679))

(assert (=> b!604656 d!87441))

(declare-fun d!87443 () Bool)

(declare-fun lt!275875 () (_ BitVec 32))

(assert (=> d!87443 (and (bvsge lt!275875 #b00000000000000000000000000000000) (bvslt lt!275875 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87443 (= lt!275875 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87443 (validMask!0 mask!3053)))

(assert (=> d!87443 (= (nextIndex!0 index!984 x!910 mask!3053) lt!275875)))

(declare-fun bs!18499 () Bool)

(assert (= bs!18499 d!87443))

(declare-fun m!581681 () Bool)

(assert (=> bs!18499 m!581681))

(assert (=> bs!18499 m!581561))

(assert (=> b!604656 d!87443))

(declare-fun b!604781 () Bool)

(declare-fun e!346081 () SeekEntryResult!6312)

(declare-fun e!346080 () SeekEntryResult!6312)

(assert (=> b!604781 (= e!346081 e!346080)))

(declare-fun c!68442 () Bool)

(declare-fun lt!275880 () (_ BitVec 64))

(assert (=> b!604781 (= c!68442 (= lt!275880 (select (arr!17872 a!2986) j!136)))))

(declare-fun b!604782 () Bool)

(assert (=> b!604782 (= e!346080 (Found!6312 lt!275820))))

(declare-fun b!604783 () Bool)

(declare-fun e!346082 () SeekEntryResult!6312)

(assert (=> b!604783 (= e!346082 (MissingVacant!6312 vacantSpotIndex!68))))

(declare-fun b!604784 () Bool)

(assert (=> b!604784 (= e!346082 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!275820 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17872 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604785 () Bool)

(assert (=> b!604785 (= e!346081 Undefined!6312)))

(declare-fun b!604786 () Bool)

(declare-fun c!68443 () Bool)

(assert (=> b!604786 (= c!68443 (= lt!275880 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604786 (= e!346080 e!346082)))

(declare-fun lt!275881 () SeekEntryResult!6312)

(declare-fun d!87445 () Bool)

(get-info :version)

(assert (=> d!87445 (and (or ((_ is Undefined!6312) lt!275881) (not ((_ is Found!6312) lt!275881)) (and (bvsge (index!27512 lt!275881) #b00000000000000000000000000000000) (bvslt (index!27512 lt!275881) (size!18236 a!2986)))) (or ((_ is Undefined!6312) lt!275881) ((_ is Found!6312) lt!275881) (not ((_ is MissingVacant!6312) lt!275881)) (not (= (index!27514 lt!275881) vacantSpotIndex!68)) (and (bvsge (index!27514 lt!275881) #b00000000000000000000000000000000) (bvslt (index!27514 lt!275881) (size!18236 a!2986)))) (or ((_ is Undefined!6312) lt!275881) (ite ((_ is Found!6312) lt!275881) (= (select (arr!17872 a!2986) (index!27512 lt!275881)) (select (arr!17872 a!2986) j!136)) (and ((_ is MissingVacant!6312) lt!275881) (= (index!27514 lt!275881) vacantSpotIndex!68) (= (select (arr!17872 a!2986) (index!27514 lt!275881)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87445 (= lt!275881 e!346081)))

(declare-fun c!68444 () Bool)

(assert (=> d!87445 (= c!68444 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87445 (= lt!275880 (select (arr!17872 a!2986) lt!275820))))

(assert (=> d!87445 (validMask!0 mask!3053)))

(assert (=> d!87445 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275820 vacantSpotIndex!68 (select (arr!17872 a!2986) j!136) a!2986 mask!3053) lt!275881)))

(assert (= (and d!87445 c!68444) b!604785))

(assert (= (and d!87445 (not c!68444)) b!604781))

(assert (= (and b!604781 c!68442) b!604782))

(assert (= (and b!604781 (not c!68442)) b!604786))

(assert (= (and b!604786 c!68443) b!604783))

(assert (= (and b!604786 (not c!68443)) b!604784))

(declare-fun m!581691 () Bool)

(assert (=> b!604784 m!581691))

(assert (=> b!604784 m!581691))

(assert (=> b!604784 m!581545))

(declare-fun m!581693 () Bool)

(assert (=> b!604784 m!581693))

(declare-fun m!581695 () Bool)

(assert (=> d!87445 m!581695))

(declare-fun m!581697 () Bool)

(assert (=> d!87445 m!581697))

(declare-fun m!581699 () Bool)

(assert (=> d!87445 m!581699))

(assert (=> d!87445 m!581561))

(assert (=> b!604656 d!87445))

(declare-fun b!604787 () Bool)

(declare-fun e!346084 () SeekEntryResult!6312)

(declare-fun e!346083 () SeekEntryResult!6312)

(assert (=> b!604787 (= e!346084 e!346083)))

(declare-fun c!68445 () Bool)

(declare-fun lt!275882 () (_ BitVec 64))

(assert (=> b!604787 (= c!68445 (= lt!275882 lt!275814))))

(declare-fun b!604788 () Bool)

(assert (=> b!604788 (= e!346083 (Found!6312 index!984))))

(declare-fun b!604789 () Bool)

(declare-fun e!346085 () SeekEntryResult!6312)

(assert (=> b!604789 (= e!346085 (MissingVacant!6312 vacantSpotIndex!68))))

(declare-fun b!604790 () Bool)

(assert (=> b!604790 (= e!346085 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!275814 lt!275821 mask!3053))))

(declare-fun b!604791 () Bool)

(assert (=> b!604791 (= e!346084 Undefined!6312)))

(declare-fun b!604792 () Bool)

(declare-fun c!68446 () Bool)

(assert (=> b!604792 (= c!68446 (= lt!275882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604792 (= e!346083 e!346085)))

(declare-fun lt!275883 () SeekEntryResult!6312)

(declare-fun d!87453 () Bool)

(assert (=> d!87453 (and (or ((_ is Undefined!6312) lt!275883) (not ((_ is Found!6312) lt!275883)) (and (bvsge (index!27512 lt!275883) #b00000000000000000000000000000000) (bvslt (index!27512 lt!275883) (size!18236 lt!275821)))) (or ((_ is Undefined!6312) lt!275883) ((_ is Found!6312) lt!275883) (not ((_ is MissingVacant!6312) lt!275883)) (not (= (index!27514 lt!275883) vacantSpotIndex!68)) (and (bvsge (index!27514 lt!275883) #b00000000000000000000000000000000) (bvslt (index!27514 lt!275883) (size!18236 lt!275821)))) (or ((_ is Undefined!6312) lt!275883) (ite ((_ is Found!6312) lt!275883) (= (select (arr!17872 lt!275821) (index!27512 lt!275883)) lt!275814) (and ((_ is MissingVacant!6312) lt!275883) (= (index!27514 lt!275883) vacantSpotIndex!68) (= (select (arr!17872 lt!275821) (index!27514 lt!275883)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87453 (= lt!275883 e!346084)))

(declare-fun c!68447 () Bool)

(assert (=> d!87453 (= c!68447 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87453 (= lt!275882 (select (arr!17872 lt!275821) index!984))))

(assert (=> d!87453 (validMask!0 mask!3053)))

(assert (=> d!87453 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275814 lt!275821 mask!3053) lt!275883)))

(assert (= (and d!87453 c!68447) b!604791))

(assert (= (and d!87453 (not c!68447)) b!604787))

(assert (= (and b!604787 c!68445) b!604788))

(assert (= (and b!604787 (not c!68445)) b!604792))

(assert (= (and b!604792 c!68446) b!604789))

(assert (= (and b!604792 (not c!68446)) b!604790))

(assert (=> b!604790 m!581569))

(assert (=> b!604790 m!581569))

(declare-fun m!581701 () Bool)

(assert (=> b!604790 m!581701))

(declare-fun m!581703 () Bool)

(assert (=> d!87453 m!581703))

(declare-fun m!581705 () Bool)

(assert (=> d!87453 m!581705))

(declare-fun m!581707 () Bool)

(assert (=> d!87453 m!581707))

(assert (=> d!87453 m!581561))

(assert (=> b!604656 d!87453))

(declare-fun b!604793 () Bool)

(declare-fun e!346087 () SeekEntryResult!6312)

(declare-fun e!346086 () SeekEntryResult!6312)

(assert (=> b!604793 (= e!346087 e!346086)))

(declare-fun c!68448 () Bool)

(declare-fun lt!275887 () (_ BitVec 64))

(assert (=> b!604793 (= c!68448 (= lt!275887 lt!275814))))

(declare-fun b!604794 () Bool)

(assert (=> b!604794 (= e!346086 (Found!6312 lt!275820))))

(declare-fun b!604795 () Bool)

(declare-fun e!346088 () SeekEntryResult!6312)

(assert (=> b!604795 (= e!346088 (MissingVacant!6312 vacantSpotIndex!68))))

(declare-fun b!604796 () Bool)

(assert (=> b!604796 (= e!346088 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!275820 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!275814 lt!275821 mask!3053))))

(declare-fun b!604797 () Bool)

(assert (=> b!604797 (= e!346087 Undefined!6312)))

(declare-fun b!604798 () Bool)

(declare-fun c!68449 () Bool)

(assert (=> b!604798 (= c!68449 (= lt!275887 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604798 (= e!346086 e!346088)))

(declare-fun lt!275888 () SeekEntryResult!6312)

(declare-fun d!87455 () Bool)

(assert (=> d!87455 (and (or ((_ is Undefined!6312) lt!275888) (not ((_ is Found!6312) lt!275888)) (and (bvsge (index!27512 lt!275888) #b00000000000000000000000000000000) (bvslt (index!27512 lt!275888) (size!18236 lt!275821)))) (or ((_ is Undefined!6312) lt!275888) ((_ is Found!6312) lt!275888) (not ((_ is MissingVacant!6312) lt!275888)) (not (= (index!27514 lt!275888) vacantSpotIndex!68)) (and (bvsge (index!27514 lt!275888) #b00000000000000000000000000000000) (bvslt (index!27514 lt!275888) (size!18236 lt!275821)))) (or ((_ is Undefined!6312) lt!275888) (ite ((_ is Found!6312) lt!275888) (= (select (arr!17872 lt!275821) (index!27512 lt!275888)) lt!275814) (and ((_ is MissingVacant!6312) lt!275888) (= (index!27514 lt!275888) vacantSpotIndex!68) (= (select (arr!17872 lt!275821) (index!27514 lt!275888)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87455 (= lt!275888 e!346087)))

(declare-fun c!68450 () Bool)

(assert (=> d!87455 (= c!68450 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87455 (= lt!275887 (select (arr!17872 lt!275821) lt!275820))))

(assert (=> d!87455 (validMask!0 mask!3053)))

(assert (=> d!87455 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275820 vacantSpotIndex!68 lt!275814 lt!275821 mask!3053) lt!275888)))

(assert (= (and d!87455 c!68450) b!604797))

(assert (= (and d!87455 (not c!68450)) b!604793))

(assert (= (and b!604793 c!68448) b!604794))

(assert (= (and b!604793 (not c!68448)) b!604798))

(assert (= (and b!604798 c!68449) b!604795))

(assert (= (and b!604798 (not c!68449)) b!604796))

(assert (=> b!604796 m!581691))

(assert (=> b!604796 m!581691))

(declare-fun m!581711 () Bool)

(assert (=> b!604796 m!581711))

(declare-fun m!581713 () Bool)

(assert (=> d!87455 m!581713))

(declare-fun m!581715 () Bool)

(assert (=> d!87455 m!581715))

(declare-fun m!581717 () Bool)

(assert (=> d!87455 m!581717))

(assert (=> d!87455 m!581561))

(assert (=> b!604656 d!87455))

(declare-fun d!87459 () Bool)

(assert (=> d!87459 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!604652 d!87459))

(declare-fun b!604836 () Bool)

(declare-fun e!346116 () SeekEntryResult!6312)

(declare-fun lt!275906 () SeekEntryResult!6312)

(assert (=> b!604836 (= e!346116 (Found!6312 (index!27513 lt!275906)))))

(declare-fun d!87461 () Bool)

(declare-fun lt!275907 () SeekEntryResult!6312)

(assert (=> d!87461 (and (or ((_ is Undefined!6312) lt!275907) (not ((_ is Found!6312) lt!275907)) (and (bvsge (index!27512 lt!275907) #b00000000000000000000000000000000) (bvslt (index!27512 lt!275907) (size!18236 a!2986)))) (or ((_ is Undefined!6312) lt!275907) ((_ is Found!6312) lt!275907) (not ((_ is MissingZero!6312) lt!275907)) (and (bvsge (index!27511 lt!275907) #b00000000000000000000000000000000) (bvslt (index!27511 lt!275907) (size!18236 a!2986)))) (or ((_ is Undefined!6312) lt!275907) ((_ is Found!6312) lt!275907) ((_ is MissingZero!6312) lt!275907) (not ((_ is MissingVacant!6312) lt!275907)) (and (bvsge (index!27514 lt!275907) #b00000000000000000000000000000000) (bvslt (index!27514 lt!275907) (size!18236 a!2986)))) (or ((_ is Undefined!6312) lt!275907) (ite ((_ is Found!6312) lt!275907) (= (select (arr!17872 a!2986) (index!27512 lt!275907)) k0!1786) (ite ((_ is MissingZero!6312) lt!275907) (= (select (arr!17872 a!2986) (index!27511 lt!275907)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6312) lt!275907) (= (select (arr!17872 a!2986) (index!27514 lt!275907)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!346118 () SeekEntryResult!6312)

(assert (=> d!87461 (= lt!275907 e!346118)))

(declare-fun c!68461 () Bool)

(assert (=> d!87461 (= c!68461 (and ((_ is Intermediate!6312) lt!275906) (undefined!7124 lt!275906)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37231 (_ BitVec 32)) SeekEntryResult!6312)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87461 (= lt!275906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87461 (validMask!0 mask!3053)))

(assert (=> d!87461 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!275907)))

(declare-fun b!604837 () Bool)

(assert (=> b!604837 (= e!346118 e!346116)))

(declare-fun lt!275905 () (_ BitVec 64))

(assert (=> b!604837 (= lt!275905 (select (arr!17872 a!2986) (index!27513 lt!275906)))))

(declare-fun c!68463 () Bool)

(assert (=> b!604837 (= c!68463 (= lt!275905 k0!1786))))

(declare-fun b!604838 () Bool)

(assert (=> b!604838 (= e!346118 Undefined!6312)))

(declare-fun b!604839 () Bool)

(declare-fun c!68462 () Bool)

(assert (=> b!604839 (= c!68462 (= lt!275905 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346117 () SeekEntryResult!6312)

(assert (=> b!604839 (= e!346116 e!346117)))

(declare-fun b!604840 () Bool)

(assert (=> b!604840 (= e!346117 (seekKeyOrZeroReturnVacant!0 (x!56305 lt!275906) (index!27513 lt!275906) (index!27513 lt!275906) k0!1786 a!2986 mask!3053))))

(declare-fun b!604841 () Bool)

(assert (=> b!604841 (= e!346117 (MissingZero!6312 (index!27513 lt!275906)))))

(assert (= (and d!87461 c!68461) b!604838))

(assert (= (and d!87461 (not c!68461)) b!604837))

(assert (= (and b!604837 c!68463) b!604836))

(assert (= (and b!604837 (not c!68463)) b!604839))

(assert (= (and b!604839 c!68462) b!604841))

(assert (= (and b!604839 (not c!68462)) b!604840))

(declare-fun m!581751 () Bool)

(assert (=> d!87461 m!581751))

(declare-fun m!581753 () Bool)

(assert (=> d!87461 m!581753))

(declare-fun m!581755 () Bool)

(assert (=> d!87461 m!581755))

(declare-fun m!581757 () Bool)

(assert (=> d!87461 m!581757))

(declare-fun m!581759 () Bool)

(assert (=> d!87461 m!581759))

(assert (=> d!87461 m!581753))

(assert (=> d!87461 m!581561))

(declare-fun m!581761 () Bool)

(assert (=> b!604837 m!581761))

(declare-fun m!581763 () Bool)

(assert (=> b!604840 m!581763))

(assert (=> b!604654 d!87461))

(declare-fun b!604844 () Bool)

(declare-fun e!346122 () SeekEntryResult!6312)

(declare-fun e!346121 () SeekEntryResult!6312)

(assert (=> b!604844 (= e!346122 e!346121)))

(declare-fun c!68464 () Bool)

(declare-fun lt!275908 () (_ BitVec 64))

(assert (=> b!604844 (= c!68464 (= lt!275908 (select (arr!17872 a!2986) j!136)))))

(declare-fun b!604845 () Bool)

(assert (=> b!604845 (= e!346121 (Found!6312 index!984))))

(declare-fun b!604846 () Bool)

(declare-fun e!346123 () SeekEntryResult!6312)

(assert (=> b!604846 (= e!346123 (MissingVacant!6312 vacantSpotIndex!68))))

(declare-fun b!604847 () Bool)

(assert (=> b!604847 (= e!346123 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17872 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604848 () Bool)

(assert (=> b!604848 (= e!346122 Undefined!6312)))

(declare-fun b!604849 () Bool)

(declare-fun c!68465 () Bool)

(assert (=> b!604849 (= c!68465 (= lt!275908 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604849 (= e!346121 e!346123)))

(declare-fun lt!275909 () SeekEntryResult!6312)

(declare-fun d!87483 () Bool)

(assert (=> d!87483 (and (or ((_ is Undefined!6312) lt!275909) (not ((_ is Found!6312) lt!275909)) (and (bvsge (index!27512 lt!275909) #b00000000000000000000000000000000) (bvslt (index!27512 lt!275909) (size!18236 a!2986)))) (or ((_ is Undefined!6312) lt!275909) ((_ is Found!6312) lt!275909) (not ((_ is MissingVacant!6312) lt!275909)) (not (= (index!27514 lt!275909) vacantSpotIndex!68)) (and (bvsge (index!27514 lt!275909) #b00000000000000000000000000000000) (bvslt (index!27514 lt!275909) (size!18236 a!2986)))) (or ((_ is Undefined!6312) lt!275909) (ite ((_ is Found!6312) lt!275909) (= (select (arr!17872 a!2986) (index!27512 lt!275909)) (select (arr!17872 a!2986) j!136)) (and ((_ is MissingVacant!6312) lt!275909) (= (index!27514 lt!275909) vacantSpotIndex!68) (= (select (arr!17872 a!2986) (index!27514 lt!275909)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87483 (= lt!275909 e!346122)))

(declare-fun c!68466 () Bool)

(assert (=> d!87483 (= c!68466 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87483 (= lt!275908 (select (arr!17872 a!2986) index!984))))

(assert (=> d!87483 (validMask!0 mask!3053)))

(assert (=> d!87483 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17872 a!2986) j!136) a!2986 mask!3053) lt!275909)))

(assert (= (and d!87483 c!68466) b!604848))

(assert (= (and d!87483 (not c!68466)) b!604844))

(assert (= (and b!604844 c!68464) b!604845))

(assert (= (and b!604844 (not c!68464)) b!604849))

(assert (= (and b!604849 c!68465) b!604846))

(assert (= (and b!604849 (not c!68465)) b!604847))

(assert (=> b!604847 m!581569))

(assert (=> b!604847 m!581569))

(assert (=> b!604847 m!581545))

(declare-fun m!581765 () Bool)

(assert (=> b!604847 m!581765))

(declare-fun m!581767 () Bool)

(assert (=> d!87483 m!581767))

(declare-fun m!581769 () Bool)

(assert (=> d!87483 m!581769))

(assert (=> d!87483 m!581543))

(assert (=> d!87483 m!581561))

(assert (=> b!604653 d!87483))

(declare-fun d!87487 () Bool)

(declare-fun res!388654 () Bool)

(declare-fun e!346134 () Bool)

(assert (=> d!87487 (=> res!388654 e!346134)))

(assert (=> d!87487 (= res!388654 (= (select (arr!17872 lt!275821) index!984) (select (arr!17872 a!2986) j!136)))))

(assert (=> d!87487 (= (arrayContainsKey!0 lt!275821 (select (arr!17872 a!2986) j!136) index!984) e!346134)))

(declare-fun b!604866 () Bool)

(declare-fun e!346135 () Bool)

(assert (=> b!604866 (= e!346134 e!346135)))

(declare-fun res!388655 () Bool)

(assert (=> b!604866 (=> (not res!388655) (not e!346135))))

(assert (=> b!604866 (= res!388655 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18236 lt!275821)))))

(declare-fun b!604867 () Bool)

(assert (=> b!604867 (= e!346135 (arrayContainsKey!0 lt!275821 (select (arr!17872 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87487 (not res!388654)) b!604866))

(assert (= (and b!604866 res!388655) b!604867))

(assert (=> d!87487 m!581707))

(assert (=> b!604867 m!581545))

(declare-fun m!581771 () Bool)

(assert (=> b!604867 m!581771))

(assert (=> b!604664 d!87487))

(declare-fun d!87489 () Bool)

(declare-fun res!388656 () Bool)

(declare-fun e!346136 () Bool)

(assert (=> d!87489 (=> res!388656 e!346136)))

(assert (=> d!87489 (= res!388656 (= (select (arr!17872 lt!275821) j!136) (select (arr!17872 a!2986) j!136)))))

(assert (=> d!87489 (= (arrayContainsKey!0 lt!275821 (select (arr!17872 a!2986) j!136) j!136) e!346136)))

(declare-fun b!604868 () Bool)

(declare-fun e!346137 () Bool)

(assert (=> b!604868 (= e!346136 e!346137)))

(declare-fun res!388657 () Bool)

(assert (=> b!604868 (=> (not res!388657) (not e!346137))))

(assert (=> b!604868 (= res!388657 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18236 lt!275821)))))

(declare-fun b!604869 () Bool)

(assert (=> b!604869 (= e!346137 (arrayContainsKey!0 lt!275821 (select (arr!17872 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87489 (not res!388656)) b!604868))

(assert (= (and b!604868 res!388657) b!604869))

(declare-fun m!581773 () Bool)

(assert (=> d!87489 m!581773))

(assert (=> b!604869 m!581545))

(declare-fun m!581775 () Bool)

(assert (=> b!604869 m!581775))

(assert (=> b!604671 d!87489))

(declare-fun b!604884 () Bool)

(declare-fun e!346148 () Bool)

(declare-fun call!33024 () Bool)

(assert (=> b!604884 (= e!346148 call!33024)))

(declare-fun b!604885 () Bool)

(declare-fun e!346147 () Bool)

(assert (=> b!604885 (= e!346148 e!346147)))

(declare-fun lt!275922 () (_ BitVec 64))

(assert (=> b!604885 (= lt!275922 (select (arr!17872 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!275924 () Unit!19252)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37231 (_ BitVec 64) (_ BitVec 32)) Unit!19252)

(assert (=> b!604885 (= lt!275924 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!275922 #b00000000000000000000000000000000))))

(assert (=> b!604885 (arrayContainsKey!0 a!2986 lt!275922 #b00000000000000000000000000000000)))

(declare-fun lt!275923 () Unit!19252)

(assert (=> b!604885 (= lt!275923 lt!275924)))

(declare-fun res!388662 () Bool)

(assert (=> b!604885 (= res!388662 (= (seekEntryOrOpen!0 (select (arr!17872 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6312 #b00000000000000000000000000000000)))))

(assert (=> b!604885 (=> (not res!388662) (not e!346147))))

(declare-fun bm!33021 () Bool)

(assert (=> bm!33021 (= call!33024 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!604886 () Bool)

(assert (=> b!604886 (= e!346147 call!33024)))

(declare-fun d!87491 () Bool)

(declare-fun res!388663 () Bool)

(declare-fun e!346149 () Bool)

(assert (=> d!87491 (=> res!388663 e!346149)))

(assert (=> d!87491 (= res!388663 (bvsge #b00000000000000000000000000000000 (size!18236 a!2986)))))

(assert (=> d!87491 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!346149)))

(declare-fun b!604887 () Bool)

(assert (=> b!604887 (= e!346149 e!346148)))

(declare-fun c!68478 () Bool)

(assert (=> b!604887 (= c!68478 (validKeyInArray!0 (select (arr!17872 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!87491 (not res!388663)) b!604887))

(assert (= (and b!604887 c!68478) b!604885))

(assert (= (and b!604887 (not c!68478)) b!604884))

(assert (= (and b!604885 res!388662) b!604886))

(assert (= (or b!604886 b!604884) bm!33021))

(assert (=> b!604885 m!581669))

(declare-fun m!581785 () Bool)

(assert (=> b!604885 m!581785))

(declare-fun m!581787 () Bool)

(assert (=> b!604885 m!581787))

(assert (=> b!604885 m!581669))

(declare-fun m!581789 () Bool)

(assert (=> b!604885 m!581789))

(declare-fun m!581791 () Bool)

(assert (=> bm!33021 m!581791))

(assert (=> b!604887 m!581669))

(assert (=> b!604887 m!581669))

(assert (=> b!604887 m!581675))

(assert (=> b!604651 d!87491))

(declare-fun d!87499 () Bool)

(assert (=> d!87499 (arrayContainsKey!0 lt!275821 (select (arr!17872 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275927 () Unit!19252)

(declare-fun choose!114 (array!37231 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19252)

(assert (=> d!87499 (= lt!275927 (choose!114 lt!275821 (select (arr!17872 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87499 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87499 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275821 (select (arr!17872 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!275927)))

(declare-fun bs!18504 () Bool)

(assert (= bs!18504 d!87499))

(assert (=> bs!18504 m!581545))

(assert (=> bs!18504 m!581591))

(assert (=> bs!18504 m!581545))

(declare-fun m!581797 () Bool)

(assert (=> bs!18504 m!581797))

(assert (=> b!604661 d!87499))

(declare-fun b!604890 () Bool)

(declare-fun e!346152 () Bool)

(assert (=> b!604890 (= e!346152 (contains!2991 Nil!11910 (select (arr!17872 lt!275821) j!136)))))

(declare-fun d!87503 () Bool)

(declare-fun res!388667 () Bool)

(declare-fun e!346153 () Bool)

(assert (=> d!87503 (=> res!388667 e!346153)))

(assert (=> d!87503 (= res!388667 (bvsge j!136 (size!18236 lt!275821)))))

(assert (=> d!87503 (= (arrayNoDuplicates!0 lt!275821 j!136 Nil!11910) e!346153)))

(declare-fun bm!33022 () Bool)

(declare-fun call!33025 () Bool)

(declare-fun c!68479 () Bool)

(assert (=> bm!33022 (= call!33025 (arrayNoDuplicates!0 lt!275821 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68479 (Cons!11909 (select (arr!17872 lt!275821) j!136) Nil!11910) Nil!11910)))))

(declare-fun b!604891 () Bool)

(declare-fun e!346154 () Bool)

(assert (=> b!604891 (= e!346153 e!346154)))

(declare-fun res!388668 () Bool)

(assert (=> b!604891 (=> (not res!388668) (not e!346154))))

(assert (=> b!604891 (= res!388668 (not e!346152))))

(declare-fun res!388666 () Bool)

(assert (=> b!604891 (=> (not res!388666) (not e!346152))))

(assert (=> b!604891 (= res!388666 (validKeyInArray!0 (select (arr!17872 lt!275821) j!136)))))

(declare-fun b!604892 () Bool)

(declare-fun e!346155 () Bool)

(assert (=> b!604892 (= e!346154 e!346155)))

(assert (=> b!604892 (= c!68479 (validKeyInArray!0 (select (arr!17872 lt!275821) j!136)))))

(declare-fun b!604893 () Bool)

(assert (=> b!604893 (= e!346155 call!33025)))

(declare-fun b!604894 () Bool)

(assert (=> b!604894 (= e!346155 call!33025)))

(assert (= (and d!87503 (not res!388667)) b!604891))

(assert (= (and b!604891 res!388666) b!604890))

(assert (= (and b!604891 res!388668) b!604892))

(assert (= (and b!604892 c!68479) b!604894))

(assert (= (and b!604892 (not c!68479)) b!604893))

(assert (= (or b!604894 b!604893) bm!33022))

(assert (=> b!604890 m!581773))

(assert (=> b!604890 m!581773))

(declare-fun m!581799 () Bool)

(assert (=> b!604890 m!581799))

(assert (=> bm!33022 m!581773))

(declare-fun m!581801 () Bool)

(assert (=> bm!33022 m!581801))

(assert (=> b!604891 m!581773))

(assert (=> b!604891 m!581773))

(declare-fun m!581803 () Bool)

(assert (=> b!604891 m!581803))

(assert (=> b!604892 m!581773))

(assert (=> b!604892 m!581773))

(assert (=> b!604892 m!581803))

(assert (=> b!604661 d!87503))

(declare-fun d!87505 () Bool)

(declare-fun res!388669 () Bool)

(declare-fun e!346156 () Bool)

(assert (=> d!87505 (=> res!388669 e!346156)))

(assert (=> d!87505 (= res!388669 (= (select (arr!17872 lt!275821) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17872 a!2986) j!136)))))

(assert (=> d!87505 (= (arrayContainsKey!0 lt!275821 (select (arr!17872 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!346156)))

(declare-fun b!604895 () Bool)

(declare-fun e!346157 () Bool)

(assert (=> b!604895 (= e!346156 e!346157)))

(declare-fun res!388670 () Bool)

(assert (=> b!604895 (=> (not res!388670) (not e!346157))))

(assert (=> b!604895 (= res!388670 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18236 lt!275821)))))

(declare-fun b!604896 () Bool)

(assert (=> b!604896 (= e!346157 (arrayContainsKey!0 lt!275821 (select (arr!17872 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87505 (not res!388669)) b!604895))

(assert (= (and b!604895 res!388670) b!604896))

(declare-fun m!581805 () Bool)

(assert (=> d!87505 m!581805))

(assert (=> b!604896 m!581545))

(declare-fun m!581807 () Bool)

(assert (=> b!604896 m!581807))

(assert (=> b!604661 d!87505))

(declare-fun b!604897 () Bool)

(declare-fun e!346158 () Bool)

(assert (=> b!604897 (= e!346158 (contains!2991 Nil!11910 (select (arr!17872 lt!275821) #b00000000000000000000000000000000)))))

(declare-fun d!87507 () Bool)

(declare-fun res!388672 () Bool)

(declare-fun e!346159 () Bool)

(assert (=> d!87507 (=> res!388672 e!346159)))

(assert (=> d!87507 (= res!388672 (bvsge #b00000000000000000000000000000000 (size!18236 lt!275821)))))

(assert (=> d!87507 (= (arrayNoDuplicates!0 lt!275821 #b00000000000000000000000000000000 Nil!11910) e!346159)))

(declare-fun bm!33023 () Bool)

(declare-fun call!33026 () Bool)

(declare-fun c!68480 () Bool)

(assert (=> bm!33023 (= call!33026 (arrayNoDuplicates!0 lt!275821 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68480 (Cons!11909 (select (arr!17872 lt!275821) #b00000000000000000000000000000000) Nil!11910) Nil!11910)))))

(declare-fun b!604898 () Bool)

(declare-fun e!346160 () Bool)

(assert (=> b!604898 (= e!346159 e!346160)))

(declare-fun res!388673 () Bool)

(assert (=> b!604898 (=> (not res!388673) (not e!346160))))

(assert (=> b!604898 (= res!388673 (not e!346158))))

(declare-fun res!388671 () Bool)

(assert (=> b!604898 (=> (not res!388671) (not e!346158))))

(assert (=> b!604898 (= res!388671 (validKeyInArray!0 (select (arr!17872 lt!275821) #b00000000000000000000000000000000)))))

(declare-fun b!604899 () Bool)

(declare-fun e!346161 () Bool)

(assert (=> b!604899 (= e!346160 e!346161)))

(assert (=> b!604899 (= c!68480 (validKeyInArray!0 (select (arr!17872 lt!275821) #b00000000000000000000000000000000)))))

(declare-fun b!604900 () Bool)

(assert (=> b!604900 (= e!346161 call!33026)))

(declare-fun b!604901 () Bool)

(assert (=> b!604901 (= e!346161 call!33026)))

(assert (= (and d!87507 (not res!388672)) b!604898))

(assert (= (and b!604898 res!388671) b!604897))

(assert (= (and b!604898 res!388673) b!604899))

(assert (= (and b!604899 c!68480) b!604901))

(assert (= (and b!604899 (not c!68480)) b!604900))

(assert (= (or b!604901 b!604900) bm!33023))

(declare-fun m!581809 () Bool)

(assert (=> b!604897 m!581809))

(assert (=> b!604897 m!581809))

(declare-fun m!581811 () Bool)

(assert (=> b!604897 m!581811))

(assert (=> bm!33023 m!581809))

(declare-fun m!581813 () Bool)

(assert (=> bm!33023 m!581813))

(assert (=> b!604898 m!581809))

(assert (=> b!604898 m!581809))

(declare-fun m!581815 () Bool)

(assert (=> b!604898 m!581815))

(assert (=> b!604899 m!581809))

(assert (=> b!604899 m!581809))

(assert (=> b!604899 m!581815))

(assert (=> b!604661 d!87507))

(declare-fun d!87509 () Bool)

(declare-fun e!346170 () Bool)

(assert (=> d!87509 e!346170))

(declare-fun res!388679 () Bool)

(assert (=> d!87509 (=> (not res!388679) (not e!346170))))

(assert (=> d!87509 (= res!388679 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18236 a!2986))))))

(declare-fun lt!275935 () Unit!19252)

(declare-fun choose!41 (array!37231 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11913) Unit!19252)

(assert (=> d!87509 (= lt!275935 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11910))))

(assert (=> d!87509 (bvslt (size!18236 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87509 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11910) lt!275935)))

(declare-fun b!604913 () Bool)

(assert (=> b!604913 (= e!346170 (arrayNoDuplicates!0 (array!37232 (store (arr!17872 a!2986) i!1108 k0!1786) (size!18236 a!2986)) #b00000000000000000000000000000000 Nil!11910))))

(assert (= (and d!87509 res!388679) b!604913))

(declare-fun m!581821 () Bool)

(assert (=> d!87509 m!581821))

(assert (=> b!604913 m!581557))

(declare-fun m!581823 () Bool)

(assert (=> b!604913 m!581823))

(assert (=> b!604661 d!87509))

(declare-fun d!87513 () Bool)

(assert (=> d!87513 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18236 lt!275821)) (not (= (select (arr!17872 lt!275821) j!136) (select (arr!17872 a!2986) j!136))))))

(declare-fun lt!275943 () Unit!19252)

(declare-fun choose!21 (array!37231 (_ BitVec 64) (_ BitVec 32) List!11913) Unit!19252)

(assert (=> d!87513 (= lt!275943 (choose!21 lt!275821 (select (arr!17872 a!2986) j!136) j!136 Nil!11910))))

(assert (=> d!87513 (bvslt (size!18236 lt!275821) #b01111111111111111111111111111111)))

(assert (=> d!87513 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275821 (select (arr!17872 a!2986) j!136) j!136 Nil!11910) lt!275943)))

(declare-fun bs!18506 () Bool)

(assert (= bs!18506 d!87513))

(assert (=> bs!18506 m!581773))

(assert (=> bs!18506 m!581545))

(declare-fun m!581837 () Bool)

(assert (=> bs!18506 m!581837))

(assert (=> b!604661 d!87513))

(declare-fun d!87519 () Bool)

(assert (=> d!87519 (arrayNoDuplicates!0 lt!275821 j!136 Nil!11910)))

(declare-fun lt!275946 () Unit!19252)

(declare-fun choose!39 (array!37231 (_ BitVec 32) (_ BitVec 32)) Unit!19252)

(assert (=> d!87519 (= lt!275946 (choose!39 lt!275821 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87519 (bvslt (size!18236 lt!275821) #b01111111111111111111111111111111)))

(assert (=> d!87519 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!275821 #b00000000000000000000000000000000 j!136) lt!275946)))

(declare-fun bs!18507 () Bool)

(assert (= bs!18507 d!87519))

(assert (=> bs!18507 m!581601))

(declare-fun m!581847 () Bool)

(assert (=> bs!18507 m!581847))

(assert (=> b!604661 d!87519))

(declare-fun d!87523 () Bool)

(assert (=> d!87523 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55158 d!87523))

(declare-fun d!87535 () Bool)

(assert (=> d!87535 (= (array_inv!13668 a!2986) (bvsge (size!18236 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55158 d!87535))

(declare-fun d!87537 () Bool)

(declare-fun res!388695 () Bool)

(declare-fun e!346201 () Bool)

(assert (=> d!87537 (=> res!388695 e!346201)))

(assert (=> d!87537 (= res!388695 (= (select (arr!17872 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87537 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!346201)))

(declare-fun b!604959 () Bool)

(declare-fun e!346202 () Bool)

(assert (=> b!604959 (= e!346201 e!346202)))

(declare-fun res!388696 () Bool)

(assert (=> b!604959 (=> (not res!388696) (not e!346202))))

(assert (=> b!604959 (= res!388696 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18236 a!2986)))))

(declare-fun b!604960 () Bool)

(assert (=> b!604960 (= e!346202 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87537 (not res!388695)) b!604959))

(assert (= (and b!604959 res!388696) b!604960))

(assert (=> d!87537 m!581669))

(declare-fun m!581875 () Bool)

(assert (=> b!604960 m!581875))

(assert (=> b!604657 d!87537))

(assert (=> b!604668 d!87487))

(declare-fun d!87539 () Bool)

(declare-fun res!388697 () Bool)

(declare-fun e!346203 () Bool)

(assert (=> d!87539 (=> res!388697 e!346203)))

(assert (=> d!87539 (= res!388697 (= (select (arr!17872 lt!275821) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17872 a!2986) j!136)))))

(assert (=> d!87539 (= (arrayContainsKey!0 lt!275821 (select (arr!17872 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!346203)))

(declare-fun b!604961 () Bool)

(declare-fun e!346204 () Bool)

(assert (=> b!604961 (= e!346203 e!346204)))

(declare-fun res!388698 () Bool)

(assert (=> b!604961 (=> (not res!388698) (not e!346204))))

(assert (=> b!604961 (= res!388698 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18236 lt!275821)))))

(declare-fun b!604962 () Bool)

(assert (=> b!604962 (= e!346204 (arrayContainsKey!0 lt!275821 (select (arr!17872 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87539 (not res!388697)) b!604961))

(assert (= (and b!604961 res!388698) b!604962))

(declare-fun m!581877 () Bool)

(assert (=> d!87539 m!581877))

(assert (=> b!604962 m!581545))

(declare-fun m!581879 () Bool)

(assert (=> b!604962 m!581879))

(assert (=> b!604669 d!87539))

(declare-fun d!87541 () Bool)

(assert (=> d!87541 (arrayContainsKey!0 lt!275821 (select (arr!17872 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275959 () Unit!19252)

(assert (=> d!87541 (= lt!275959 (choose!114 lt!275821 (select (arr!17872 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!87541 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!87541 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275821 (select (arr!17872 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!275959)))

(declare-fun bs!18509 () Bool)

(assert (= bs!18509 d!87541))

(assert (=> bs!18509 m!581545))

(assert (=> bs!18509 m!581579))

(assert (=> bs!18509 m!581545))

(declare-fun m!581881 () Bool)

(assert (=> bs!18509 m!581881))

(assert (=> b!604669 d!87541))

(assert (=> b!604669 d!87489))

(check-sat (not d!87453) (not d!87499) (not b!604890) (not b!604892) (not d!87509) (not b!604962) (not d!87483) (not d!87519) (not b!604885) (not b!604840) (not b!604896) (not d!87445) (not b!604887) (not bm!33021) (not b!604790) (not b!604899) (not d!87443) (not bm!33023) (not b!604753) (not bm!33014) (not b!604847) (not b!604760) (not bm!33022) (not d!87541) (not d!87441) (not b!604784) (not b!604796) (not d!87513) (not b!604960) (not b!604867) (not b!604869) (not d!87455) (not b!604898) (not b!604755) (not b!604913) (not d!87461) (not b!604891) (not b!604754) (not b!604897))
(check-sat)
