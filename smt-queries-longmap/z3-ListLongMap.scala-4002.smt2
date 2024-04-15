; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54318 () Bool)

(assert start!54318)

(declare-fun res!379735 () Bool)

(declare-fun e!338812 () Bool)

(assert (=> start!54318 (=> (not res!379735) (not e!338812))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54318 (= res!379735 (validMask!0 mask!3053))))

(assert (=> start!54318 e!338812))

(assert (=> start!54318 true))

(declare-datatypes ((array!36936 0))(
  ( (array!36937 (arr!17735 (Array (_ BitVec 32) (_ BitVec 64))) (size!18100 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36936)

(declare-fun array_inv!13618 (array!36936) Bool)

(assert (=> start!54318 (array_inv!13618 a!2986)))

(declare-fun b!593190 () Bool)

(declare-fun e!338811 () Bool)

(declare-fun e!338809 () Bool)

(assert (=> b!593190 (= e!338811 e!338809)))

(declare-fun res!379739 () Bool)

(assert (=> b!593190 (=> res!379739 e!338809)))

(assert (=> b!593190 (= res!379739 (or (bvsgt #b00000000000000000000000000000000 (size!18100 a!2986)) (bvsge (size!18100 a!2986) #b01111111111111111111111111111111)))))

(declare-fun lt!269195 () array!36936)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!36936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!593190 (arrayContainsKey!0 lt!269195 (select (arr!17735 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!18600 0))(
  ( (Unit!18601) )
))
(declare-fun lt!269193 () Unit!18600)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36936 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18600)

(assert (=> b!593190 (= lt!269193 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269195 (select (arr!17735 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!593191 () Bool)

(declare-fun e!338815 () Bool)

(declare-fun e!338817 () Bool)

(assert (=> b!593191 (= e!338815 (not e!338817))))

(declare-fun res!379731 () Bool)

(assert (=> b!593191 (=> res!379731 e!338817)))

(declare-datatypes ((SeekEntryResult!6172 0))(
  ( (MissingZero!6172 (index!26930 (_ BitVec 32))) (Found!6172 (index!26931 (_ BitVec 32))) (Intermediate!6172 (undefined!6984 Bool) (index!26932 (_ BitVec 32)) (x!55737 (_ BitVec 32))) (Undefined!6172) (MissingVacant!6172 (index!26933 (_ BitVec 32))) )
))
(declare-fun lt!269190 () SeekEntryResult!6172)

(assert (=> b!593191 (= res!379731 (not (= lt!269190 (Found!6172 index!984))))))

(declare-fun lt!269199 () Unit!18600)

(declare-fun e!338808 () Unit!18600)

(assert (=> b!593191 (= lt!269199 e!338808)))

(declare-fun c!67101 () Bool)

(assert (=> b!593191 (= c!67101 (= lt!269190 Undefined!6172))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!269197 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36936 (_ BitVec 32)) SeekEntryResult!6172)

(assert (=> b!593191 (= lt!269190 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269197 lt!269195 mask!3053))))

(declare-fun e!338816 () Bool)

(assert (=> b!593191 e!338816))

(declare-fun res!379732 () Bool)

(assert (=> b!593191 (=> (not res!379732) (not e!338816))))

(declare-fun lt!269200 () SeekEntryResult!6172)

(declare-fun lt!269198 () (_ BitVec 32))

(assert (=> b!593191 (= res!379732 (= lt!269200 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269198 vacantSpotIndex!68 lt!269197 lt!269195 mask!3053)))))

(assert (=> b!593191 (= lt!269200 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269198 vacantSpotIndex!68 (select (arr!17735 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!593191 (= lt!269197 (select (store (arr!17735 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!269192 () Unit!18600)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36936 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18600)

(assert (=> b!593191 (= lt!269192 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269198 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!593191 (= lt!269198 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!593192 () Bool)

(declare-fun e!338806 () Bool)

(assert (=> b!593192 (= e!338812 e!338806)))

(declare-fun res!379728 () Bool)

(assert (=> b!593192 (=> (not res!379728) (not e!338806))))

(declare-fun lt!269191 () SeekEntryResult!6172)

(assert (=> b!593192 (= res!379728 (or (= lt!269191 (MissingZero!6172 i!1108)) (= lt!269191 (MissingVacant!6172 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36936 (_ BitVec 32)) SeekEntryResult!6172)

(assert (=> b!593192 (= lt!269191 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!593193 () Bool)

(declare-fun e!338810 () Bool)

(declare-fun e!338813 () Bool)

(assert (=> b!593193 (= e!338810 e!338813)))

(declare-fun res!379730 () Bool)

(assert (=> b!593193 (=> (not res!379730) (not e!338813))))

(assert (=> b!593193 (= res!379730 (arrayContainsKey!0 lt!269195 (select (arr!17735 a!2986) j!136) j!136))))

(declare-fun b!593194 () Bool)

(assert (=> b!593194 (= e!338813 (arrayContainsKey!0 lt!269195 (select (arr!17735 a!2986) j!136) index!984))))

(declare-fun b!593195 () Bool)

(declare-fun e!338805 () Bool)

(assert (=> b!593195 (= e!338806 e!338805)))

(declare-fun res!379738 () Bool)

(assert (=> b!593195 (=> (not res!379738) (not e!338805))))

(assert (=> b!593195 (= res!379738 (= (select (store (arr!17735 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593195 (= lt!269195 (array!36937 (store (arr!17735 a!2986) i!1108 k0!1786) (size!18100 a!2986)))))

(declare-fun b!593196 () Bool)

(declare-fun res!379734 () Bool)

(assert (=> b!593196 (=> (not res!379734) (not e!338812))))

(assert (=> b!593196 (= res!379734 (and (= (size!18100 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18100 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18100 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!593197 () Bool)

(declare-fun lt!269194 () SeekEntryResult!6172)

(assert (=> b!593197 (= e!338816 (= lt!269194 lt!269200))))

(declare-fun b!593198 () Bool)

(declare-fun res!379727 () Bool)

(assert (=> b!593198 (=> (not res!379727) (not e!338812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!593198 (= res!379727 (validKeyInArray!0 k0!1786))))

(declare-fun b!593199 () Bool)

(declare-fun Unit!18602 () Unit!18600)

(assert (=> b!593199 (= e!338808 Unit!18602)))

(declare-fun b!593200 () Bool)

(declare-fun res!379724 () Bool)

(assert (=> b!593200 (=> (not res!379724) (not e!338812))))

(assert (=> b!593200 (= res!379724 (validKeyInArray!0 (select (arr!17735 a!2986) j!136)))))

(declare-fun b!593201 () Bool)

(declare-fun res!379723 () Bool)

(assert (=> b!593201 (=> (not res!379723) (not e!338806))))

(assert (=> b!593201 (= res!379723 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17735 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!593202 () Bool)

(declare-fun Unit!18603 () Unit!18600)

(assert (=> b!593202 (= e!338808 Unit!18603)))

(assert (=> b!593202 false))

(declare-fun b!593203 () Bool)

(assert (=> b!593203 (= e!338817 e!338811)))

(declare-fun res!379729 () Bool)

(assert (=> b!593203 (=> res!379729 e!338811)))

(declare-fun lt!269196 () (_ BitVec 64))

(assert (=> b!593203 (= res!379729 (or (not (= (select (arr!17735 a!2986) j!136) lt!269197)) (not (= (select (arr!17735 a!2986) j!136) lt!269196)) (bvsge j!136 index!984)))))

(declare-fun e!338814 () Bool)

(assert (=> b!593203 e!338814))

(declare-fun res!379733 () Bool)

(assert (=> b!593203 (=> (not res!379733) (not e!338814))))

(assert (=> b!593203 (= res!379733 (= lt!269196 (select (arr!17735 a!2986) j!136)))))

(assert (=> b!593203 (= lt!269196 (select (store (arr!17735 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!593204 () Bool)

(declare-fun res!379736 () Bool)

(assert (=> b!593204 (=> (not res!379736) (not e!338806))))

(declare-datatypes ((List!11815 0))(
  ( (Nil!11812) (Cons!11811 (h!12856 (_ BitVec 64)) (t!18034 List!11815)) )
))
(declare-fun arrayNoDuplicates!0 (array!36936 (_ BitVec 32) List!11815) Bool)

(assert (=> b!593204 (= res!379736 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11812))))

(declare-fun b!593205 () Bool)

(declare-fun res!379725 () Bool)

(assert (=> b!593205 (=> (not res!379725) (not e!338812))))

(assert (=> b!593205 (= res!379725 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!593206 () Bool)

(declare-fun res!379737 () Bool)

(assert (=> b!593206 (=> (not res!379737) (not e!338806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36936 (_ BitVec 32)) Bool)

(assert (=> b!593206 (= res!379737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!593207 () Bool)

(assert (=> b!593207 (= e!338814 e!338810)))

(declare-fun res!379722 () Bool)

(assert (=> b!593207 (=> res!379722 e!338810)))

(assert (=> b!593207 (= res!379722 (or (not (= (select (arr!17735 a!2986) j!136) lt!269197)) (not (= (select (arr!17735 a!2986) j!136) lt!269196)) (bvsge j!136 index!984)))))

(declare-fun b!593208 () Bool)

(declare-fun noDuplicate!236 (List!11815) Bool)

(assert (=> b!593208 (= e!338809 (noDuplicate!236 Nil!11812))))

(declare-fun b!593209 () Bool)

(assert (=> b!593209 (= e!338805 e!338815)))

(declare-fun res!379726 () Bool)

(assert (=> b!593209 (=> (not res!379726) (not e!338815))))

(assert (=> b!593209 (= res!379726 (and (= lt!269194 (Found!6172 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17735 a!2986) index!984) (select (arr!17735 a!2986) j!136))) (not (= (select (arr!17735 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!593209 (= lt!269194 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17735 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!54318 res!379735) b!593196))

(assert (= (and b!593196 res!379734) b!593200))

(assert (= (and b!593200 res!379724) b!593198))

(assert (= (and b!593198 res!379727) b!593205))

(assert (= (and b!593205 res!379725) b!593192))

(assert (= (and b!593192 res!379728) b!593206))

(assert (= (and b!593206 res!379737) b!593204))

(assert (= (and b!593204 res!379736) b!593201))

(assert (= (and b!593201 res!379723) b!593195))

(assert (= (and b!593195 res!379738) b!593209))

(assert (= (and b!593209 res!379726) b!593191))

(assert (= (and b!593191 res!379732) b!593197))

(assert (= (and b!593191 c!67101) b!593202))

(assert (= (and b!593191 (not c!67101)) b!593199))

(assert (= (and b!593191 (not res!379731)) b!593203))

(assert (= (and b!593203 res!379733) b!593207))

(assert (= (and b!593207 (not res!379722)) b!593193))

(assert (= (and b!593193 res!379730) b!593194))

(assert (= (and b!593203 (not res!379729)) b!593190))

(assert (= (and b!593190 (not res!379739)) b!593208))

(declare-fun m!570643 () Bool)

(assert (=> b!593203 m!570643))

(declare-fun m!570645 () Bool)

(assert (=> b!593203 m!570645))

(declare-fun m!570647 () Bool)

(assert (=> b!593203 m!570647))

(assert (=> b!593194 m!570643))

(assert (=> b!593194 m!570643))

(declare-fun m!570649 () Bool)

(assert (=> b!593194 m!570649))

(assert (=> b!593195 m!570645))

(declare-fun m!570651 () Bool)

(assert (=> b!593195 m!570651))

(assert (=> b!593200 m!570643))

(assert (=> b!593200 m!570643))

(declare-fun m!570653 () Bool)

(assert (=> b!593200 m!570653))

(declare-fun m!570655 () Bool)

(assert (=> b!593206 m!570655))

(declare-fun m!570657 () Bool)

(assert (=> b!593205 m!570657))

(declare-fun m!570659 () Bool)

(assert (=> b!593201 m!570659))

(declare-fun m!570661 () Bool)

(assert (=> b!593209 m!570661))

(assert (=> b!593209 m!570643))

(assert (=> b!593209 m!570643))

(declare-fun m!570663 () Bool)

(assert (=> b!593209 m!570663))

(assert (=> b!593193 m!570643))

(assert (=> b!593193 m!570643))

(declare-fun m!570665 () Bool)

(assert (=> b!593193 m!570665))

(assert (=> b!593207 m!570643))

(declare-fun m!570667 () Bool)

(assert (=> b!593192 m!570667))

(declare-fun m!570669 () Bool)

(assert (=> b!593204 m!570669))

(declare-fun m!570671 () Bool)

(assert (=> b!593208 m!570671))

(declare-fun m!570673 () Bool)

(assert (=> start!54318 m!570673))

(declare-fun m!570675 () Bool)

(assert (=> start!54318 m!570675))

(declare-fun m!570677 () Bool)

(assert (=> b!593198 m!570677))

(declare-fun m!570679 () Bool)

(assert (=> b!593191 m!570679))

(declare-fun m!570681 () Bool)

(assert (=> b!593191 m!570681))

(assert (=> b!593191 m!570643))

(declare-fun m!570683 () Bool)

(assert (=> b!593191 m!570683))

(assert (=> b!593191 m!570645))

(declare-fun m!570685 () Bool)

(assert (=> b!593191 m!570685))

(declare-fun m!570687 () Bool)

(assert (=> b!593191 m!570687))

(assert (=> b!593191 m!570643))

(declare-fun m!570689 () Bool)

(assert (=> b!593191 m!570689))

(assert (=> b!593190 m!570643))

(assert (=> b!593190 m!570643))

(declare-fun m!570691 () Bool)

(assert (=> b!593190 m!570691))

(assert (=> b!593190 m!570643))

(declare-fun m!570693 () Bool)

(assert (=> b!593190 m!570693))

(check-sat (not b!593200) (not b!593191) (not b!593190) (not b!593194) (not b!593198) (not b!593192) (not b!593208) (not start!54318) (not b!593193) (not b!593204) (not b!593206) (not b!593205) (not b!593209))
(check-sat)
(get-model)

(declare-fun b!593342 () Bool)

(declare-fun e!338902 () SeekEntryResult!6172)

(declare-fun e!338904 () SeekEntryResult!6172)

(assert (=> b!593342 (= e!338902 e!338904)))

(declare-fun lt!269274 () (_ BitVec 64))

(declare-fun lt!269275 () SeekEntryResult!6172)

(assert (=> b!593342 (= lt!269274 (select (arr!17735 a!2986) (index!26932 lt!269275)))))

(declare-fun c!67114 () Bool)

(assert (=> b!593342 (= c!67114 (= lt!269274 k0!1786))))

(declare-fun e!338903 () SeekEntryResult!6172)

(declare-fun b!593343 () Bool)

(assert (=> b!593343 (= e!338903 (seekKeyOrZeroReturnVacant!0 (x!55737 lt!269275) (index!26932 lt!269275) (index!26932 lt!269275) k0!1786 a!2986 mask!3053))))

(declare-fun b!593344 () Bool)

(assert (=> b!593344 (= e!338903 (MissingZero!6172 (index!26932 lt!269275)))))

(declare-fun b!593345 () Bool)

(assert (=> b!593345 (= e!338904 (Found!6172 (index!26932 lt!269275)))))

(declare-fun b!593347 () Bool)

(declare-fun c!67115 () Bool)

(assert (=> b!593347 (= c!67115 (= lt!269274 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593347 (= e!338904 e!338903)))

(declare-fun d!86233 () Bool)

(declare-fun lt!269273 () SeekEntryResult!6172)

(get-info :version)

(assert (=> d!86233 (and (or ((_ is Undefined!6172) lt!269273) (not ((_ is Found!6172) lt!269273)) (and (bvsge (index!26931 lt!269273) #b00000000000000000000000000000000) (bvslt (index!26931 lt!269273) (size!18100 a!2986)))) (or ((_ is Undefined!6172) lt!269273) ((_ is Found!6172) lt!269273) (not ((_ is MissingZero!6172) lt!269273)) (and (bvsge (index!26930 lt!269273) #b00000000000000000000000000000000) (bvslt (index!26930 lt!269273) (size!18100 a!2986)))) (or ((_ is Undefined!6172) lt!269273) ((_ is Found!6172) lt!269273) ((_ is MissingZero!6172) lt!269273) (not ((_ is MissingVacant!6172) lt!269273)) (and (bvsge (index!26933 lt!269273) #b00000000000000000000000000000000) (bvslt (index!26933 lt!269273) (size!18100 a!2986)))) (or ((_ is Undefined!6172) lt!269273) (ite ((_ is Found!6172) lt!269273) (= (select (arr!17735 a!2986) (index!26931 lt!269273)) k0!1786) (ite ((_ is MissingZero!6172) lt!269273) (= (select (arr!17735 a!2986) (index!26930 lt!269273)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6172) lt!269273) (= (select (arr!17735 a!2986) (index!26933 lt!269273)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86233 (= lt!269273 e!338902)))

(declare-fun c!67116 () Bool)

(assert (=> d!86233 (= c!67116 (and ((_ is Intermediate!6172) lt!269275) (undefined!6984 lt!269275)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36936 (_ BitVec 32)) SeekEntryResult!6172)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86233 (= lt!269275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86233 (validMask!0 mask!3053)))

(assert (=> d!86233 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!269273)))

(declare-fun b!593346 () Bool)

(assert (=> b!593346 (= e!338902 Undefined!6172)))

(assert (= (and d!86233 c!67116) b!593346))

(assert (= (and d!86233 (not c!67116)) b!593342))

(assert (= (and b!593342 c!67114) b!593345))

(assert (= (and b!593342 (not c!67114)) b!593347))

(assert (= (and b!593347 c!67115) b!593344))

(assert (= (and b!593347 (not c!67115)) b!593343))

(declare-fun m!570799 () Bool)

(assert (=> b!593342 m!570799))

(declare-fun m!570801 () Bool)

(assert (=> b!593343 m!570801))

(declare-fun m!570803 () Bool)

(assert (=> d!86233 m!570803))

(declare-fun m!570805 () Bool)

(assert (=> d!86233 m!570805))

(declare-fun m!570807 () Bool)

(assert (=> d!86233 m!570807))

(assert (=> d!86233 m!570805))

(declare-fun m!570809 () Bool)

(assert (=> d!86233 m!570809))

(assert (=> d!86233 m!570673))

(declare-fun m!570811 () Bool)

(assert (=> d!86233 m!570811))

(assert (=> b!593192 d!86233))

(declare-fun b!593360 () Bool)

(declare-fun e!338913 () SeekEntryResult!6172)

(assert (=> b!593360 (= e!338913 (Found!6172 lt!269198))))

(declare-fun b!593361 () Bool)

(declare-fun e!338912 () SeekEntryResult!6172)

(assert (=> b!593361 (= e!338912 (MissingVacant!6172 vacantSpotIndex!68))))

(declare-fun lt!269281 () SeekEntryResult!6172)

(declare-fun d!86235 () Bool)

(assert (=> d!86235 (and (or ((_ is Undefined!6172) lt!269281) (not ((_ is Found!6172) lt!269281)) (and (bvsge (index!26931 lt!269281) #b00000000000000000000000000000000) (bvslt (index!26931 lt!269281) (size!18100 lt!269195)))) (or ((_ is Undefined!6172) lt!269281) ((_ is Found!6172) lt!269281) (not ((_ is MissingVacant!6172) lt!269281)) (not (= (index!26933 lt!269281) vacantSpotIndex!68)) (and (bvsge (index!26933 lt!269281) #b00000000000000000000000000000000) (bvslt (index!26933 lt!269281) (size!18100 lt!269195)))) (or ((_ is Undefined!6172) lt!269281) (ite ((_ is Found!6172) lt!269281) (= (select (arr!17735 lt!269195) (index!26931 lt!269281)) lt!269197) (and ((_ is MissingVacant!6172) lt!269281) (= (index!26933 lt!269281) vacantSpotIndex!68) (= (select (arr!17735 lt!269195) (index!26933 lt!269281)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338911 () SeekEntryResult!6172)

(assert (=> d!86235 (= lt!269281 e!338911)))

(declare-fun c!67125 () Bool)

(assert (=> d!86235 (= c!67125 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!269280 () (_ BitVec 64))

(assert (=> d!86235 (= lt!269280 (select (arr!17735 lt!269195) lt!269198))))

(assert (=> d!86235 (validMask!0 mask!3053)))

(assert (=> d!86235 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269198 vacantSpotIndex!68 lt!269197 lt!269195 mask!3053) lt!269281)))

(declare-fun b!593362 () Bool)

(assert (=> b!593362 (= e!338912 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269198 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!269197 lt!269195 mask!3053))))

(declare-fun b!593363 () Bool)

(declare-fun c!67124 () Bool)

(assert (=> b!593363 (= c!67124 (= lt!269280 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593363 (= e!338913 e!338912)))

(declare-fun b!593364 () Bool)

(assert (=> b!593364 (= e!338911 Undefined!6172)))

(declare-fun b!593365 () Bool)

(assert (=> b!593365 (= e!338911 e!338913)))

(declare-fun c!67123 () Bool)

(assert (=> b!593365 (= c!67123 (= lt!269280 lt!269197))))

(assert (= (and d!86235 c!67125) b!593364))

(assert (= (and d!86235 (not c!67125)) b!593365))

(assert (= (and b!593365 c!67123) b!593360))

(assert (= (and b!593365 (not c!67123)) b!593363))

(assert (= (and b!593363 c!67124) b!593361))

(assert (= (and b!593363 (not c!67124)) b!593362))

(declare-fun m!570813 () Bool)

(assert (=> d!86235 m!570813))

(declare-fun m!570815 () Bool)

(assert (=> d!86235 m!570815))

(declare-fun m!570817 () Bool)

(assert (=> d!86235 m!570817))

(assert (=> d!86235 m!570673))

(declare-fun m!570819 () Bool)

(assert (=> b!593362 m!570819))

(assert (=> b!593362 m!570819))

(declare-fun m!570821 () Bool)

(assert (=> b!593362 m!570821))

(assert (=> b!593191 d!86235))

(declare-fun b!593366 () Bool)

(declare-fun e!338916 () SeekEntryResult!6172)

(assert (=> b!593366 (= e!338916 (Found!6172 lt!269198))))

(declare-fun b!593367 () Bool)

(declare-fun e!338915 () SeekEntryResult!6172)

(assert (=> b!593367 (= e!338915 (MissingVacant!6172 vacantSpotIndex!68))))

(declare-fun d!86237 () Bool)

(declare-fun lt!269283 () SeekEntryResult!6172)

(assert (=> d!86237 (and (or ((_ is Undefined!6172) lt!269283) (not ((_ is Found!6172) lt!269283)) (and (bvsge (index!26931 lt!269283) #b00000000000000000000000000000000) (bvslt (index!26931 lt!269283) (size!18100 a!2986)))) (or ((_ is Undefined!6172) lt!269283) ((_ is Found!6172) lt!269283) (not ((_ is MissingVacant!6172) lt!269283)) (not (= (index!26933 lt!269283) vacantSpotIndex!68)) (and (bvsge (index!26933 lt!269283) #b00000000000000000000000000000000) (bvslt (index!26933 lt!269283) (size!18100 a!2986)))) (or ((_ is Undefined!6172) lt!269283) (ite ((_ is Found!6172) lt!269283) (= (select (arr!17735 a!2986) (index!26931 lt!269283)) (select (arr!17735 a!2986) j!136)) (and ((_ is MissingVacant!6172) lt!269283) (= (index!26933 lt!269283) vacantSpotIndex!68) (= (select (arr!17735 a!2986) (index!26933 lt!269283)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338914 () SeekEntryResult!6172)

(assert (=> d!86237 (= lt!269283 e!338914)))

(declare-fun c!67128 () Bool)

(assert (=> d!86237 (= c!67128 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!269282 () (_ BitVec 64))

(assert (=> d!86237 (= lt!269282 (select (arr!17735 a!2986) lt!269198))))

(assert (=> d!86237 (validMask!0 mask!3053)))

(assert (=> d!86237 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269198 vacantSpotIndex!68 (select (arr!17735 a!2986) j!136) a!2986 mask!3053) lt!269283)))

(declare-fun b!593368 () Bool)

(assert (=> b!593368 (= e!338915 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269198 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17735 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593369 () Bool)

(declare-fun c!67127 () Bool)

(assert (=> b!593369 (= c!67127 (= lt!269282 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593369 (= e!338916 e!338915)))

(declare-fun b!593370 () Bool)

(assert (=> b!593370 (= e!338914 Undefined!6172)))

(declare-fun b!593371 () Bool)

(assert (=> b!593371 (= e!338914 e!338916)))

(declare-fun c!67126 () Bool)

(assert (=> b!593371 (= c!67126 (= lt!269282 (select (arr!17735 a!2986) j!136)))))

(assert (= (and d!86237 c!67128) b!593370))

(assert (= (and d!86237 (not c!67128)) b!593371))

(assert (= (and b!593371 c!67126) b!593366))

(assert (= (and b!593371 (not c!67126)) b!593369))

(assert (= (and b!593369 c!67127) b!593367))

(assert (= (and b!593369 (not c!67127)) b!593368))

(declare-fun m!570823 () Bool)

(assert (=> d!86237 m!570823))

(declare-fun m!570825 () Bool)

(assert (=> d!86237 m!570825))

(declare-fun m!570827 () Bool)

(assert (=> d!86237 m!570827))

(assert (=> d!86237 m!570673))

(assert (=> b!593368 m!570819))

(assert (=> b!593368 m!570819))

(assert (=> b!593368 m!570643))

(declare-fun m!570829 () Bool)

(assert (=> b!593368 m!570829))

(assert (=> b!593191 d!86237))

(declare-fun d!86239 () Bool)

(declare-fun lt!269286 () (_ BitVec 32))

(assert (=> d!86239 (and (bvsge lt!269286 #b00000000000000000000000000000000) (bvslt lt!269286 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86239 (= lt!269286 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86239 (validMask!0 mask!3053)))

(assert (=> d!86239 (= (nextIndex!0 index!984 x!910 mask!3053) lt!269286)))

(declare-fun bs!18280 () Bool)

(assert (= bs!18280 d!86239))

(declare-fun m!570831 () Bool)

(assert (=> bs!18280 m!570831))

(assert (=> bs!18280 m!570673))

(assert (=> b!593191 d!86239))

(declare-fun d!86241 () Bool)

(declare-fun e!338927 () Bool)

(assert (=> d!86241 e!338927))

(declare-fun res!379858 () Bool)

(assert (=> d!86241 (=> (not res!379858) (not e!338927))))

(assert (=> d!86241 (= res!379858 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18100 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18100 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18100 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18100 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18100 a!2986))))))

(declare-fun lt!269292 () Unit!18600)

(declare-fun choose!9 (array!36936 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18600)

(assert (=> d!86241 (= lt!269292 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269198 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86241 (validMask!0 mask!3053)))

(assert (=> d!86241 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269198 vacantSpotIndex!68 mask!3053) lt!269292)))

(declare-fun b!593382 () Bool)

(assert (=> b!593382 (= e!338927 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269198 vacantSpotIndex!68 (select (arr!17735 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269198 vacantSpotIndex!68 (select (store (arr!17735 a!2986) i!1108 k0!1786) j!136) (array!36937 (store (arr!17735 a!2986) i!1108 k0!1786) (size!18100 a!2986)) mask!3053)))))

(assert (= (and d!86241 res!379858) b!593382))

(declare-fun m!570843 () Bool)

(assert (=> d!86241 m!570843))

(assert (=> d!86241 m!570673))

(assert (=> b!593382 m!570643))

(assert (=> b!593382 m!570683))

(assert (=> b!593382 m!570681))

(assert (=> b!593382 m!570643))

(assert (=> b!593382 m!570681))

(declare-fun m!570849 () Bool)

(assert (=> b!593382 m!570849))

(assert (=> b!593382 m!570645))

(assert (=> b!593191 d!86241))

(declare-fun b!593385 () Bool)

(declare-fun e!338932 () SeekEntryResult!6172)

(assert (=> b!593385 (= e!338932 (Found!6172 index!984))))

(declare-fun b!593386 () Bool)

(declare-fun e!338931 () SeekEntryResult!6172)

(assert (=> b!593386 (= e!338931 (MissingVacant!6172 vacantSpotIndex!68))))

(declare-fun d!86261 () Bool)

(declare-fun lt!269294 () SeekEntryResult!6172)

(assert (=> d!86261 (and (or ((_ is Undefined!6172) lt!269294) (not ((_ is Found!6172) lt!269294)) (and (bvsge (index!26931 lt!269294) #b00000000000000000000000000000000) (bvslt (index!26931 lt!269294) (size!18100 lt!269195)))) (or ((_ is Undefined!6172) lt!269294) ((_ is Found!6172) lt!269294) (not ((_ is MissingVacant!6172) lt!269294)) (not (= (index!26933 lt!269294) vacantSpotIndex!68)) (and (bvsge (index!26933 lt!269294) #b00000000000000000000000000000000) (bvslt (index!26933 lt!269294) (size!18100 lt!269195)))) (or ((_ is Undefined!6172) lt!269294) (ite ((_ is Found!6172) lt!269294) (= (select (arr!17735 lt!269195) (index!26931 lt!269294)) lt!269197) (and ((_ is MissingVacant!6172) lt!269294) (= (index!26933 lt!269294) vacantSpotIndex!68) (= (select (arr!17735 lt!269195) (index!26933 lt!269294)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338930 () SeekEntryResult!6172)

(assert (=> d!86261 (= lt!269294 e!338930)))

(declare-fun c!67131 () Bool)

(assert (=> d!86261 (= c!67131 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!269293 () (_ BitVec 64))

(assert (=> d!86261 (= lt!269293 (select (arr!17735 lt!269195) index!984))))

(assert (=> d!86261 (validMask!0 mask!3053)))

(assert (=> d!86261 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269197 lt!269195 mask!3053) lt!269294)))

(declare-fun b!593387 () Bool)

(assert (=> b!593387 (= e!338931 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!269197 lt!269195 mask!3053))))

(declare-fun b!593388 () Bool)

(declare-fun c!67130 () Bool)

(assert (=> b!593388 (= c!67130 (= lt!269293 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593388 (= e!338932 e!338931)))

(declare-fun b!593389 () Bool)

(assert (=> b!593389 (= e!338930 Undefined!6172)))

(declare-fun b!593390 () Bool)

(assert (=> b!593390 (= e!338930 e!338932)))

(declare-fun c!67129 () Bool)

(assert (=> b!593390 (= c!67129 (= lt!269293 lt!269197))))

(assert (= (and d!86261 c!67131) b!593389))

(assert (= (and d!86261 (not c!67131)) b!593390))

(assert (= (and b!593390 c!67129) b!593385))

(assert (= (and b!593390 (not c!67129)) b!593388))

(assert (= (and b!593388 c!67130) b!593386))

(assert (= (and b!593388 (not c!67130)) b!593387))

(declare-fun m!570851 () Bool)

(assert (=> d!86261 m!570851))

(declare-fun m!570853 () Bool)

(assert (=> d!86261 m!570853))

(declare-fun m!570855 () Bool)

(assert (=> d!86261 m!570855))

(assert (=> d!86261 m!570673))

(assert (=> b!593387 m!570679))

(assert (=> b!593387 m!570679))

(declare-fun m!570857 () Bool)

(assert (=> b!593387 m!570857))

(assert (=> b!593191 d!86261))

(declare-fun d!86263 () Bool)

(declare-fun res!379865 () Bool)

(declare-fun e!338937 () Bool)

(assert (=> d!86263 (=> res!379865 e!338937)))

(assert (=> d!86263 (= res!379865 (= (select (arr!17735 lt!269195) j!136) (select (arr!17735 a!2986) j!136)))))

(assert (=> d!86263 (= (arrayContainsKey!0 lt!269195 (select (arr!17735 a!2986) j!136) j!136) e!338937)))

(declare-fun b!593395 () Bool)

(declare-fun e!338938 () Bool)

(assert (=> b!593395 (= e!338937 e!338938)))

(declare-fun res!379866 () Bool)

(assert (=> b!593395 (=> (not res!379866) (not e!338938))))

(assert (=> b!593395 (= res!379866 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18100 lt!269195)))))

(declare-fun b!593396 () Bool)

(assert (=> b!593396 (= e!338938 (arrayContainsKey!0 lt!269195 (select (arr!17735 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86263 (not res!379865)) b!593395))

(assert (= (and b!593395 res!379866) b!593396))

(declare-fun m!570859 () Bool)

(assert (=> d!86263 m!570859))

(assert (=> b!593396 m!570643))

(declare-fun m!570861 () Bool)

(assert (=> b!593396 m!570861))

(assert (=> b!593193 d!86263))

(declare-fun b!593419 () Bool)

(declare-fun e!338953 () Bool)

(declare-fun e!338954 () Bool)

(assert (=> b!593419 (= e!338953 e!338954)))

(declare-fun c!67140 () Bool)

(assert (=> b!593419 (= c!67140 (validKeyInArray!0 (select (arr!17735 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!593420 () Bool)

(declare-fun e!338955 () Bool)

(assert (=> b!593420 (= e!338955 e!338953)))

(declare-fun res!379874 () Bool)

(assert (=> b!593420 (=> (not res!379874) (not e!338953))))

(declare-fun e!338956 () Bool)

(assert (=> b!593420 (= res!379874 (not e!338956))))

(declare-fun res!379875 () Bool)

(assert (=> b!593420 (=> (not res!379875) (not e!338956))))

(assert (=> b!593420 (= res!379875 (validKeyInArray!0 (select (arr!17735 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!593421 () Bool)

(declare-fun contains!2900 (List!11815 (_ BitVec 64)) Bool)

(assert (=> b!593421 (= e!338956 (contains!2900 Nil!11812 (select (arr!17735 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86265 () Bool)

(declare-fun res!379873 () Bool)

(assert (=> d!86265 (=> res!379873 e!338955)))

(assert (=> d!86265 (= res!379873 (bvsge #b00000000000000000000000000000000 (size!18100 a!2986)))))

(assert (=> d!86265 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11812) e!338955)))

(declare-fun bm!32842 () Bool)

(declare-fun call!32845 () Bool)

(assert (=> bm!32842 (= call!32845 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67140 (Cons!11811 (select (arr!17735 a!2986) #b00000000000000000000000000000000) Nil!11812) Nil!11812)))))

(declare-fun b!593422 () Bool)

(assert (=> b!593422 (= e!338954 call!32845)))

(declare-fun b!593423 () Bool)

(assert (=> b!593423 (= e!338954 call!32845)))

(assert (= (and d!86265 (not res!379873)) b!593420))

(assert (= (and b!593420 res!379875) b!593421))

(assert (= (and b!593420 res!379874) b!593419))

(assert (= (and b!593419 c!67140) b!593423))

(assert (= (and b!593419 (not c!67140)) b!593422))

(assert (= (or b!593423 b!593422) bm!32842))

(declare-fun m!570863 () Bool)

(assert (=> b!593419 m!570863))

(assert (=> b!593419 m!570863))

(declare-fun m!570865 () Bool)

(assert (=> b!593419 m!570865))

(assert (=> b!593420 m!570863))

(assert (=> b!593420 m!570863))

(assert (=> b!593420 m!570865))

(assert (=> b!593421 m!570863))

(assert (=> b!593421 m!570863))

(declare-fun m!570869 () Bool)

(assert (=> b!593421 m!570869))

(assert (=> bm!32842 m!570863))

(declare-fun m!570875 () Bool)

(assert (=> bm!32842 m!570875))

(assert (=> b!593204 d!86265))

(declare-fun d!86271 () Bool)

(declare-fun res!379876 () Bool)

(declare-fun e!338960 () Bool)

(assert (=> d!86271 (=> res!379876 e!338960)))

(assert (=> d!86271 (= res!379876 (= (select (arr!17735 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86271 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!338960)))

(declare-fun b!593430 () Bool)

(declare-fun e!338961 () Bool)

(assert (=> b!593430 (= e!338960 e!338961)))

(declare-fun res!379877 () Bool)

(assert (=> b!593430 (=> (not res!379877) (not e!338961))))

(assert (=> b!593430 (= res!379877 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18100 a!2986)))))

(declare-fun b!593431 () Bool)

(assert (=> b!593431 (= e!338961 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86271 (not res!379876)) b!593430))

(assert (= (and b!593430 res!379877) b!593431))

(assert (=> d!86271 m!570863))

(declare-fun m!570877 () Bool)

(assert (=> b!593431 m!570877))

(assert (=> b!593205 d!86271))

(declare-fun d!86277 () Bool)

(declare-fun res!379878 () Bool)

(declare-fun e!338962 () Bool)

(assert (=> d!86277 (=> res!379878 e!338962)))

(assert (=> d!86277 (= res!379878 (= (select (arr!17735 lt!269195) index!984) (select (arr!17735 a!2986) j!136)))))

(assert (=> d!86277 (= (arrayContainsKey!0 lt!269195 (select (arr!17735 a!2986) j!136) index!984) e!338962)))

(declare-fun b!593432 () Bool)

(declare-fun e!338963 () Bool)

(assert (=> b!593432 (= e!338962 e!338963)))

(declare-fun res!379879 () Bool)

(assert (=> b!593432 (=> (not res!379879) (not e!338963))))

(assert (=> b!593432 (= res!379879 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18100 lt!269195)))))

(declare-fun b!593433 () Bool)

(assert (=> b!593433 (= e!338963 (arrayContainsKey!0 lt!269195 (select (arr!17735 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86277 (not res!379878)) b!593432))

(assert (= (and b!593432 res!379879) b!593433))

(assert (=> d!86277 m!570855))

(assert (=> b!593433 m!570643))

(declare-fun m!570879 () Bool)

(assert (=> b!593433 m!570879))

(assert (=> b!593194 d!86277))

(declare-fun d!86279 () Bool)

(declare-fun res!379890 () Bool)

(declare-fun e!338977 () Bool)

(assert (=> d!86279 (=> res!379890 e!338977)))

(assert (=> d!86279 (= res!379890 (bvsge #b00000000000000000000000000000000 (size!18100 a!2986)))))

(assert (=> d!86279 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!338977)))

(declare-fun bm!32845 () Bool)

(declare-fun call!32848 () Bool)

(assert (=> bm!32845 (= call!32848 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!593448 () Bool)

(declare-fun e!338978 () Bool)

(assert (=> b!593448 (= e!338978 call!32848)))

(declare-fun b!593449 () Bool)

(declare-fun e!338976 () Bool)

(assert (=> b!593449 (= e!338977 e!338976)))

(declare-fun c!67146 () Bool)

(assert (=> b!593449 (= c!67146 (validKeyInArray!0 (select (arr!17735 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!593450 () Bool)

(assert (=> b!593450 (= e!338976 call!32848)))

(declare-fun b!593451 () Bool)

(assert (=> b!593451 (= e!338976 e!338978)))

(declare-fun lt!269307 () (_ BitVec 64))

(assert (=> b!593451 (= lt!269307 (select (arr!17735 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!269308 () Unit!18600)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36936 (_ BitVec 64) (_ BitVec 32)) Unit!18600)

(assert (=> b!593451 (= lt!269308 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!269307 #b00000000000000000000000000000000))))

(assert (=> b!593451 (arrayContainsKey!0 a!2986 lt!269307 #b00000000000000000000000000000000)))

(declare-fun lt!269309 () Unit!18600)

(assert (=> b!593451 (= lt!269309 lt!269308)))

(declare-fun res!379891 () Bool)

(assert (=> b!593451 (= res!379891 (= (seekEntryOrOpen!0 (select (arr!17735 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6172 #b00000000000000000000000000000000)))))

(assert (=> b!593451 (=> (not res!379891) (not e!338978))))

(assert (= (and d!86279 (not res!379890)) b!593449))

(assert (= (and b!593449 c!67146) b!593451))

(assert (= (and b!593449 (not c!67146)) b!593450))

(assert (= (and b!593451 res!379891) b!593448))

(assert (= (or b!593448 b!593450) bm!32845))

(declare-fun m!570885 () Bool)

(assert (=> bm!32845 m!570885))

(assert (=> b!593449 m!570863))

(assert (=> b!593449 m!570863))

(assert (=> b!593449 m!570865))

(assert (=> b!593451 m!570863))

(declare-fun m!570887 () Bool)

(assert (=> b!593451 m!570887))

(declare-fun m!570889 () Bool)

(assert (=> b!593451 m!570889))

(assert (=> b!593451 m!570863))

(declare-fun m!570891 () Bool)

(assert (=> b!593451 m!570891))

(assert (=> b!593206 d!86279))

(declare-fun d!86283 () Bool)

(declare-fun res!379898 () Bool)

(declare-fun e!338985 () Bool)

(assert (=> d!86283 (=> res!379898 e!338985)))

(assert (=> d!86283 (= res!379898 ((_ is Nil!11812) Nil!11812))))

(assert (=> d!86283 (= (noDuplicate!236 Nil!11812) e!338985)))

(declare-fun b!593458 () Bool)

(declare-fun e!338986 () Bool)

(assert (=> b!593458 (= e!338985 e!338986)))

(declare-fun res!379899 () Bool)

(assert (=> b!593458 (=> (not res!379899) (not e!338986))))

(assert (=> b!593458 (= res!379899 (not (contains!2900 (t!18034 Nil!11812) (h!12856 Nil!11812))))))

(declare-fun b!593459 () Bool)

(assert (=> b!593459 (= e!338986 (noDuplicate!236 (t!18034 Nil!11812)))))

(assert (= (and d!86283 (not res!379898)) b!593458))

(assert (= (and b!593458 res!379899) b!593459))

(declare-fun m!570893 () Bool)

(assert (=> b!593458 m!570893))

(declare-fun m!570895 () Bool)

(assert (=> b!593459 m!570895))

(assert (=> b!593208 d!86283))

(declare-fun b!593460 () Bool)

(declare-fun e!338989 () SeekEntryResult!6172)

(assert (=> b!593460 (= e!338989 (Found!6172 index!984))))

(declare-fun b!593461 () Bool)

(declare-fun e!338988 () SeekEntryResult!6172)

(assert (=> b!593461 (= e!338988 (MissingVacant!6172 vacantSpotIndex!68))))

(declare-fun d!86285 () Bool)

(declare-fun lt!269313 () SeekEntryResult!6172)

(assert (=> d!86285 (and (or ((_ is Undefined!6172) lt!269313) (not ((_ is Found!6172) lt!269313)) (and (bvsge (index!26931 lt!269313) #b00000000000000000000000000000000) (bvslt (index!26931 lt!269313) (size!18100 a!2986)))) (or ((_ is Undefined!6172) lt!269313) ((_ is Found!6172) lt!269313) (not ((_ is MissingVacant!6172) lt!269313)) (not (= (index!26933 lt!269313) vacantSpotIndex!68)) (and (bvsge (index!26933 lt!269313) #b00000000000000000000000000000000) (bvslt (index!26933 lt!269313) (size!18100 a!2986)))) (or ((_ is Undefined!6172) lt!269313) (ite ((_ is Found!6172) lt!269313) (= (select (arr!17735 a!2986) (index!26931 lt!269313)) (select (arr!17735 a!2986) j!136)) (and ((_ is MissingVacant!6172) lt!269313) (= (index!26933 lt!269313) vacantSpotIndex!68) (= (select (arr!17735 a!2986) (index!26933 lt!269313)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338987 () SeekEntryResult!6172)

(assert (=> d!86285 (= lt!269313 e!338987)))

(declare-fun c!67149 () Bool)

(assert (=> d!86285 (= c!67149 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!269312 () (_ BitVec 64))

(assert (=> d!86285 (= lt!269312 (select (arr!17735 a!2986) index!984))))

(assert (=> d!86285 (validMask!0 mask!3053)))

(assert (=> d!86285 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17735 a!2986) j!136) a!2986 mask!3053) lt!269313)))

(declare-fun b!593462 () Bool)

(assert (=> b!593462 (= e!338988 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17735 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593463 () Bool)

(declare-fun c!67148 () Bool)

(assert (=> b!593463 (= c!67148 (= lt!269312 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593463 (= e!338989 e!338988)))

(declare-fun b!593464 () Bool)

(assert (=> b!593464 (= e!338987 Undefined!6172)))

(declare-fun b!593465 () Bool)

(assert (=> b!593465 (= e!338987 e!338989)))

(declare-fun c!67147 () Bool)

(assert (=> b!593465 (= c!67147 (= lt!269312 (select (arr!17735 a!2986) j!136)))))

(assert (= (and d!86285 c!67149) b!593464))

(assert (= (and d!86285 (not c!67149)) b!593465))

(assert (= (and b!593465 c!67147) b!593460))

(assert (= (and b!593465 (not c!67147)) b!593463))

(assert (= (and b!593463 c!67148) b!593461))

(assert (= (and b!593463 (not c!67148)) b!593462))

(declare-fun m!570897 () Bool)

(assert (=> d!86285 m!570897))

(declare-fun m!570899 () Bool)

(assert (=> d!86285 m!570899))

(assert (=> d!86285 m!570661))

(assert (=> d!86285 m!570673))

(assert (=> b!593462 m!570679))

(assert (=> b!593462 m!570679))

(assert (=> b!593462 m!570643))

(declare-fun m!570901 () Bool)

(assert (=> b!593462 m!570901))

(assert (=> b!593209 d!86285))

(declare-fun d!86287 () Bool)

(assert (=> d!86287 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!593198 d!86287))

(declare-fun d!86291 () Bool)

(assert (=> d!86291 (= (validKeyInArray!0 (select (arr!17735 a!2986) j!136)) (and (not (= (select (arr!17735 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17735 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!593200 d!86291))

(declare-fun d!86293 () Bool)

(assert (=> d!86293 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54318 d!86293))

(declare-fun d!86305 () Bool)

(assert (=> d!86305 (= (array_inv!13618 a!2986) (bvsge (size!18100 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54318 d!86305))

(declare-fun d!86307 () Bool)

(declare-fun res!379901 () Bool)

(declare-fun e!339009 () Bool)

(assert (=> d!86307 (=> res!379901 e!339009)))

(assert (=> d!86307 (= res!379901 (= (select (arr!17735 lt!269195) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17735 a!2986) j!136)))))

(assert (=> d!86307 (= (arrayContainsKey!0 lt!269195 (select (arr!17735 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!339009)))

(declare-fun b!593503 () Bool)

(declare-fun e!339010 () Bool)

(assert (=> b!593503 (= e!339009 e!339010)))

(declare-fun res!379902 () Bool)

(assert (=> b!593503 (=> (not res!379902) (not e!339010))))

(assert (=> b!593503 (= res!379902 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18100 lt!269195)))))

(declare-fun b!593504 () Bool)

(assert (=> b!593504 (= e!339010 (arrayContainsKey!0 lt!269195 (select (arr!17735 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86307 (not res!379901)) b!593503))

(assert (= (and b!593503 res!379902) b!593504))

(declare-fun m!570949 () Bool)

(assert (=> d!86307 m!570949))

(assert (=> b!593504 m!570643))

(declare-fun m!570951 () Bool)

(assert (=> b!593504 m!570951))

(assert (=> b!593190 d!86307))

(declare-fun d!86309 () Bool)

(assert (=> d!86309 (arrayContainsKey!0 lt!269195 (select (arr!17735 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269335 () Unit!18600)

(declare-fun choose!114 (array!36936 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18600)

(assert (=> d!86309 (= lt!269335 (choose!114 lt!269195 (select (arr!17735 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86309 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86309 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269195 (select (arr!17735 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!269335)))

(declare-fun bs!18283 () Bool)

(assert (= bs!18283 d!86309))

(assert (=> bs!18283 m!570643))

(assert (=> bs!18283 m!570691))

(assert (=> bs!18283 m!570643))

(declare-fun m!570953 () Bool)

(assert (=> bs!18283 m!570953))

(assert (=> b!593190 d!86309))

(check-sat (not b!593462) (not b!593343) (not b!593433) (not b!593420) (not d!86261) (not b!593421) (not bm!32842) (not b!593382) (not b!593451) (not d!86233) (not d!86237) (not b!593362) (not b!593368) (not d!86241) (not d!86235) (not d!86239) (not b!593387) (not b!593458) (not b!593504) (not b!593419) (not b!593459) (not b!593396) (not d!86285) (not b!593431) (not b!593449) (not bm!32845) (not d!86309))
(check-sat)
