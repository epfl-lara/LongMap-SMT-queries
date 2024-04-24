; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53688 () Bool)

(assert start!53688)

(declare-fun b!584603 () Bool)

(declare-fun res!372322 () Bool)

(declare-fun e!334766 () Bool)

(assert (=> b!584603 (=> (not res!372322) (not e!334766))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36534 0))(
  ( (array!36535 (arr!17539 (Array (_ BitVec 32) (_ BitVec 64))) (size!17903 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36534)

(declare-datatypes ((SeekEntryResult!5935 0))(
  ( (MissingZero!5935 (index!25967 (_ BitVec 32))) (Found!5935 (index!25968 (_ BitVec 32))) (Intermediate!5935 (undefined!6747 Bool) (index!25969 (_ BitVec 32)) (x!54951 (_ BitVec 32))) (Undefined!5935) (MissingVacant!5935 (index!25970 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36534 (_ BitVec 32)) SeekEntryResult!5935)

(assert (=> b!584603 (= res!372322 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17539 a!2986) j!136) a!2986 mask!3053) (Found!5935 j!136)))))

(declare-fun b!584604 () Bool)

(declare-fun res!372320 () Bool)

(declare-fun e!334767 () Bool)

(assert (=> b!584604 (=> (not res!372320) (not e!334767))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584604 (= res!372320 (and (= (size!17903 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17903 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17903 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584605 () Bool)

(declare-fun e!334765 () Bool)

(assert (=> b!584605 (= e!334766 e!334765)))

(declare-fun res!372314 () Bool)

(assert (=> b!584605 (=> (not res!372314) (not e!334765))))

(declare-fun lt!265665 () (_ BitVec 32))

(assert (=> b!584605 (= res!372314 (and (bvsge lt!265665 #b00000000000000000000000000000000) (bvslt lt!265665 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584605 (= lt!265665 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!584606 () Bool)

(declare-fun res!372321 () Bool)

(assert (=> b!584606 (=> (not res!372321) (not e!334767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584606 (= res!372321 (validKeyInArray!0 (select (arr!17539 a!2986) j!136)))))

(declare-fun b!584607 () Bool)

(declare-fun res!372315 () Bool)

(assert (=> b!584607 (=> (not res!372315) (not e!334767))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584607 (= res!372315 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584608 () Bool)

(declare-fun res!372319 () Bool)

(assert (=> b!584608 (=> (not res!372319) (not e!334766))))

(declare-datatypes ((List!11487 0))(
  ( (Nil!11484) (Cons!11483 (h!12531 (_ BitVec 64)) (t!17707 List!11487)) )
))
(declare-fun arrayNoDuplicates!0 (array!36534 (_ BitVec 32) List!11487) Bool)

(assert (=> b!584608 (= res!372319 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11484))))

(declare-fun res!372317 () Bool)

(assert (=> start!53688 (=> (not res!372317) (not e!334767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53688 (= res!372317 (validMask!0 mask!3053))))

(assert (=> start!53688 e!334767))

(assert (=> start!53688 true))

(declare-fun array_inv!13398 (array!36534) Bool)

(assert (=> start!53688 (array_inv!13398 a!2986)))

(declare-fun b!584609 () Bool)

(declare-fun res!372325 () Bool)

(assert (=> b!584609 (=> (not res!372325) (not e!334766))))

(assert (=> b!584609 (= res!372325 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17539 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17539 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584610 () Bool)

(declare-fun res!372323 () Bool)

(assert (=> b!584610 (=> (not res!372323) (not e!334767))))

(assert (=> b!584610 (= res!372323 (validKeyInArray!0 k0!1786))))

(declare-fun b!584611 () Bool)

(assert (=> b!584611 (= e!334765 false)))

(declare-fun lt!265666 () SeekEntryResult!5935)

(assert (=> b!584611 (= lt!265666 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265665 vacantSpotIndex!68 (select (arr!17539 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584612 () Bool)

(declare-fun res!372316 () Bool)

(assert (=> b!584612 (=> (not res!372316) (not e!334766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36534 (_ BitVec 32)) Bool)

(assert (=> b!584612 (= res!372316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584613 () Bool)

(assert (=> b!584613 (= e!334767 e!334766)))

(declare-fun res!372318 () Bool)

(assert (=> b!584613 (=> (not res!372318) (not e!334766))))

(declare-fun lt!265664 () SeekEntryResult!5935)

(assert (=> b!584613 (= res!372318 (or (= lt!265664 (MissingZero!5935 i!1108)) (= lt!265664 (MissingVacant!5935 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36534 (_ BitVec 32)) SeekEntryResult!5935)

(assert (=> b!584613 (= lt!265664 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584614 () Bool)

(declare-fun res!372324 () Bool)

(assert (=> b!584614 (=> (not res!372324) (not e!334766))))

(assert (=> b!584614 (= res!372324 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17539 a!2986) index!984) (select (arr!17539 a!2986) j!136))) (not (= (select (arr!17539 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53688 res!372317) b!584604))

(assert (= (and b!584604 res!372320) b!584606))

(assert (= (and b!584606 res!372321) b!584610))

(assert (= (and b!584610 res!372323) b!584607))

(assert (= (and b!584607 res!372315) b!584613))

(assert (= (and b!584613 res!372318) b!584612))

(assert (= (and b!584612 res!372316) b!584608))

(assert (= (and b!584608 res!372319) b!584609))

(assert (= (and b!584609 res!372325) b!584603))

(assert (= (and b!584603 res!372322) b!584614))

(assert (= (and b!584614 res!372324) b!584605))

(assert (= (and b!584605 res!372314) b!584611))

(declare-fun m!563111 () Bool)

(assert (=> b!584608 m!563111))

(declare-fun m!563113 () Bool)

(assert (=> b!584611 m!563113))

(assert (=> b!584611 m!563113))

(declare-fun m!563115 () Bool)

(assert (=> b!584611 m!563115))

(declare-fun m!563117 () Bool)

(assert (=> b!584614 m!563117))

(assert (=> b!584614 m!563113))

(declare-fun m!563119 () Bool)

(assert (=> b!584609 m!563119))

(declare-fun m!563121 () Bool)

(assert (=> b!584609 m!563121))

(declare-fun m!563123 () Bool)

(assert (=> b!584609 m!563123))

(declare-fun m!563125 () Bool)

(assert (=> b!584612 m!563125))

(declare-fun m!563127 () Bool)

(assert (=> b!584610 m!563127))

(declare-fun m!563129 () Bool)

(assert (=> b!584607 m!563129))

(declare-fun m!563131 () Bool)

(assert (=> start!53688 m!563131))

(declare-fun m!563133 () Bool)

(assert (=> start!53688 m!563133))

(declare-fun m!563135 () Bool)

(assert (=> b!584613 m!563135))

(assert (=> b!584606 m!563113))

(assert (=> b!584606 m!563113))

(declare-fun m!563137 () Bool)

(assert (=> b!584606 m!563137))

(declare-fun m!563139 () Bool)

(assert (=> b!584605 m!563139))

(assert (=> b!584603 m!563113))

(assert (=> b!584603 m!563113))

(declare-fun m!563141 () Bool)

(assert (=> b!584603 m!563141))

(check-sat (not b!584613) (not b!584605) (not b!584603) (not start!53688) (not b!584611) (not b!584610) (not b!584612) (not b!584606) (not b!584607) (not b!584608))
(check-sat)
