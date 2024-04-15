; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54156 () Bool)

(assert start!54156)

(declare-fun b!591757 () Bool)

(declare-fun res!378780 () Bool)

(declare-fun e!337892 () Bool)

(assert (=> b!591757 (=> (not res!378780) (not e!337892))))

(declare-datatypes ((array!36900 0))(
  ( (array!36901 (arr!17720 (Array (_ BitVec 32) (_ BitVec 64))) (size!18085 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36900)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591757 (= res!378780 (validKeyInArray!0 (select (arr!17720 a!2986) j!136)))))

(declare-fun b!591758 () Bool)

(declare-fun e!337895 () Bool)

(declare-fun e!337888 () Bool)

(assert (=> b!591758 (= e!337895 e!337888)))

(declare-fun res!378783 () Bool)

(assert (=> b!591758 (=> res!378783 e!337888)))

(declare-fun lt!268470 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!268471 () (_ BitVec 64))

(assert (=> b!591758 (= res!378783 (or (not (= (select (arr!17720 a!2986) j!136) lt!268470)) (not (= (select (arr!17720 a!2986) j!136) lt!268471)) (bvsge j!136 index!984)))))

(declare-fun b!591759 () Bool)

(declare-fun res!378782 () Bool)

(declare-fun e!337886 () Bool)

(assert (=> b!591759 (=> (not res!378782) (not e!337886))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36900 (_ BitVec 32)) Bool)

(assert (=> b!591759 (= res!378782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591760 () Bool)

(declare-fun e!337885 () Bool)

(declare-datatypes ((SeekEntryResult!6157 0))(
  ( (MissingZero!6157 (index!26864 (_ BitVec 32))) (Found!6157 (index!26865 (_ BitVec 32))) (Intermediate!6157 (undefined!6969 Bool) (index!26866 (_ BitVec 32)) (x!55664 (_ BitVec 32))) (Undefined!6157) (MissingVacant!6157 (index!26867 (_ BitVec 32))) )
))
(declare-fun lt!268467 () SeekEntryResult!6157)

(declare-fun lt!268463 () SeekEntryResult!6157)

(assert (=> b!591760 (= e!337885 (= lt!268467 lt!268463))))

(declare-fun b!591762 () Bool)

(declare-datatypes ((Unit!18540 0))(
  ( (Unit!18541) )
))
(declare-fun e!337889 () Unit!18540)

(declare-fun Unit!18542 () Unit!18540)

(assert (=> b!591762 (= e!337889 Unit!18542)))

(assert (=> b!591762 false))

(declare-fun b!591763 () Bool)

(declare-fun e!337890 () Bool)

(assert (=> b!591763 (= e!337890 (bvsge (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000))))

(declare-fun lt!268464 () array!36900)

(declare-fun arrayContainsKey!0 (array!36900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591763 (arrayContainsKey!0 lt!268464 (select (arr!17720 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!268465 () Unit!18540)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36900 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18540)

(assert (=> b!591763 (= lt!268465 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268464 (select (arr!17720 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!591764 () Bool)

(declare-fun res!378778 () Bool)

(assert (=> b!591764 (=> (not res!378778) (not e!337892))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!591764 (= res!378778 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591765 () Bool)

(declare-fun res!378791 () Bool)

(assert (=> b!591765 (=> (not res!378791) (not e!337886))))

(declare-datatypes ((List!11800 0))(
  ( (Nil!11797) (Cons!11796 (h!12841 (_ BitVec 64)) (t!18019 List!11800)) )
))
(declare-fun arrayNoDuplicates!0 (array!36900 (_ BitVec 32) List!11800) Bool)

(assert (=> b!591765 (= res!378791 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11797))))

(declare-fun b!591766 () Bool)

(declare-fun Unit!18543 () Unit!18540)

(assert (=> b!591766 (= e!337889 Unit!18543)))

(declare-fun b!591767 () Bool)

(declare-fun e!337893 () Bool)

(assert (=> b!591767 (= e!337888 e!337893)))

(declare-fun res!378790 () Bool)

(assert (=> b!591767 (=> (not res!378790) (not e!337893))))

(assert (=> b!591767 (= res!378790 (arrayContainsKey!0 lt!268464 (select (arr!17720 a!2986) j!136) j!136))))

(declare-fun b!591768 () Bool)

(declare-fun e!337894 () Bool)

(assert (=> b!591768 (= e!337894 e!337890)))

(declare-fun res!378785 () Bool)

(assert (=> b!591768 (=> res!378785 e!337890)))

(assert (=> b!591768 (= res!378785 (or (not (= (select (arr!17720 a!2986) j!136) lt!268470)) (not (= (select (arr!17720 a!2986) j!136) lt!268471)) (bvsge j!136 index!984)))))

(assert (=> b!591768 e!337895))

(declare-fun res!378776 () Bool)

(assert (=> b!591768 (=> (not res!378776) (not e!337895))))

(assert (=> b!591768 (= res!378776 (= lt!268471 (select (arr!17720 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!591768 (= lt!268471 (select (store (arr!17720 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!378786 () Bool)

(assert (=> start!54156 (=> (not res!378786) (not e!337892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54156 (= res!378786 (validMask!0 mask!3053))))

(assert (=> start!54156 e!337892))

(assert (=> start!54156 true))

(declare-fun array_inv!13603 (array!36900) Bool)

(assert (=> start!54156 (array_inv!13603 a!2986)))

(declare-fun b!591761 () Bool)

(declare-fun e!337896 () Bool)

(assert (=> b!591761 (= e!337896 (not e!337894))))

(declare-fun res!378779 () Bool)

(assert (=> b!591761 (=> res!378779 e!337894)))

(declare-fun lt!268468 () SeekEntryResult!6157)

(assert (=> b!591761 (= res!378779 (not (= lt!268468 (Found!6157 index!984))))))

(declare-fun lt!268466 () Unit!18540)

(assert (=> b!591761 (= lt!268466 e!337889)))

(declare-fun c!66858 () Bool)

(assert (=> b!591761 (= c!66858 (= lt!268468 Undefined!6157))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36900 (_ BitVec 32)) SeekEntryResult!6157)

(assert (=> b!591761 (= lt!268468 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268470 lt!268464 mask!3053))))

(assert (=> b!591761 e!337885))

(declare-fun res!378784 () Bool)

(assert (=> b!591761 (=> (not res!378784) (not e!337885))))

(declare-fun lt!268461 () (_ BitVec 32))

(assert (=> b!591761 (= res!378784 (= lt!268463 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268461 vacantSpotIndex!68 lt!268470 lt!268464 mask!3053)))))

(assert (=> b!591761 (= lt!268463 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268461 vacantSpotIndex!68 (select (arr!17720 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591761 (= lt!268470 (select (store (arr!17720 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268469 () Unit!18540)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36900 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18540)

(assert (=> b!591761 (= lt!268469 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268461 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591761 (= lt!268461 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591769 () Bool)

(declare-fun e!337887 () Bool)

(assert (=> b!591769 (= e!337886 e!337887)))

(declare-fun res!378787 () Bool)

(assert (=> b!591769 (=> (not res!378787) (not e!337887))))

(assert (=> b!591769 (= res!378787 (= (select (store (arr!17720 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591769 (= lt!268464 (array!36901 (store (arr!17720 a!2986) i!1108 k0!1786) (size!18085 a!2986)))))

(declare-fun b!591770 () Bool)

(assert (=> b!591770 (= e!337892 e!337886)))

(declare-fun res!378777 () Bool)

(assert (=> b!591770 (=> (not res!378777) (not e!337886))))

(declare-fun lt!268462 () SeekEntryResult!6157)

(assert (=> b!591770 (= res!378777 (or (= lt!268462 (MissingZero!6157 i!1108)) (= lt!268462 (MissingVacant!6157 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36900 (_ BitVec 32)) SeekEntryResult!6157)

(assert (=> b!591770 (= lt!268462 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!591771 () Bool)

(assert (=> b!591771 (= e!337887 e!337896)))

(declare-fun res!378788 () Bool)

(assert (=> b!591771 (=> (not res!378788) (not e!337896))))

(assert (=> b!591771 (= res!378788 (and (= lt!268467 (Found!6157 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17720 a!2986) index!984) (select (arr!17720 a!2986) j!136))) (not (= (select (arr!17720 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!591771 (= lt!268467 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17720 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591772 () Bool)

(declare-fun res!378781 () Bool)

(assert (=> b!591772 (=> (not res!378781) (not e!337892))))

(assert (=> b!591772 (= res!378781 (validKeyInArray!0 k0!1786))))

(declare-fun b!591773 () Bool)

(declare-fun res!378775 () Bool)

(assert (=> b!591773 (=> (not res!378775) (not e!337886))))

(assert (=> b!591773 (= res!378775 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17720 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591774 () Bool)

(assert (=> b!591774 (= e!337893 (arrayContainsKey!0 lt!268464 (select (arr!17720 a!2986) j!136) index!984))))

(declare-fun b!591775 () Bool)

(declare-fun res!378789 () Bool)

(assert (=> b!591775 (=> (not res!378789) (not e!337892))))

(assert (=> b!591775 (= res!378789 (and (= (size!18085 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18085 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18085 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!54156 res!378786) b!591775))

(assert (= (and b!591775 res!378789) b!591757))

(assert (= (and b!591757 res!378780) b!591772))

(assert (= (and b!591772 res!378781) b!591764))

(assert (= (and b!591764 res!378778) b!591770))

(assert (= (and b!591770 res!378777) b!591759))

(assert (= (and b!591759 res!378782) b!591765))

(assert (= (and b!591765 res!378791) b!591773))

(assert (= (and b!591773 res!378775) b!591769))

(assert (= (and b!591769 res!378787) b!591771))

(assert (= (and b!591771 res!378788) b!591761))

(assert (= (and b!591761 res!378784) b!591760))

(assert (= (and b!591761 c!66858) b!591762))

(assert (= (and b!591761 (not c!66858)) b!591766))

(assert (= (and b!591761 (not res!378779)) b!591768))

(assert (= (and b!591768 res!378776) b!591758))

(assert (= (and b!591758 (not res!378783)) b!591767))

(assert (= (and b!591767 res!378790) b!591774))

(assert (= (and b!591768 (not res!378785)) b!591763))

(declare-fun m!569401 () Bool)

(assert (=> b!591758 m!569401))

(declare-fun m!569403 () Bool)

(assert (=> b!591772 m!569403))

(declare-fun m!569405 () Bool)

(assert (=> b!591765 m!569405))

(assert (=> b!591761 m!569401))

(declare-fun m!569407 () Bool)

(assert (=> b!591761 m!569407))

(declare-fun m!569409 () Bool)

(assert (=> b!591761 m!569409))

(declare-fun m!569411 () Bool)

(assert (=> b!591761 m!569411))

(assert (=> b!591761 m!569401))

(declare-fun m!569413 () Bool)

(assert (=> b!591761 m!569413))

(declare-fun m!569415 () Bool)

(assert (=> b!591761 m!569415))

(declare-fun m!569417 () Bool)

(assert (=> b!591761 m!569417))

(declare-fun m!569419 () Bool)

(assert (=> b!591761 m!569419))

(declare-fun m!569421 () Bool)

(assert (=> b!591764 m!569421))

(declare-fun m!569423 () Bool)

(assert (=> b!591773 m!569423))

(declare-fun m!569425 () Bool)

(assert (=> start!54156 m!569425))

(declare-fun m!569427 () Bool)

(assert (=> start!54156 m!569427))

(assert (=> b!591767 m!569401))

(assert (=> b!591767 m!569401))

(declare-fun m!569429 () Bool)

(assert (=> b!591767 m!569429))

(assert (=> b!591774 m!569401))

(assert (=> b!591774 m!569401))

(declare-fun m!569431 () Bool)

(assert (=> b!591774 m!569431))

(declare-fun m!569433 () Bool)

(assert (=> b!591759 m!569433))

(assert (=> b!591763 m!569401))

(assert (=> b!591763 m!569401))

(declare-fun m!569435 () Bool)

(assert (=> b!591763 m!569435))

(assert (=> b!591763 m!569401))

(declare-fun m!569437 () Bool)

(assert (=> b!591763 m!569437))

(assert (=> b!591768 m!569401))

(assert (=> b!591768 m!569415))

(declare-fun m!569439 () Bool)

(assert (=> b!591768 m!569439))

(assert (=> b!591757 m!569401))

(assert (=> b!591757 m!569401))

(declare-fun m!569441 () Bool)

(assert (=> b!591757 m!569441))

(declare-fun m!569443 () Bool)

(assert (=> b!591771 m!569443))

(assert (=> b!591771 m!569401))

(assert (=> b!591771 m!569401))

(declare-fun m!569445 () Bool)

(assert (=> b!591771 m!569445))

(declare-fun m!569447 () Bool)

(assert (=> b!591770 m!569447))

(assert (=> b!591769 m!569415))

(declare-fun m!569449 () Bool)

(assert (=> b!591769 m!569449))

(check-sat (not b!591757) (not b!591764) (not b!591771) (not start!54156) (not b!591765) (not b!591759) (not b!591770) (not b!591763) (not b!591767) (not b!591774) (not b!591772) (not b!591761))
(check-sat)
