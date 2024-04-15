; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53952 () Bool)

(assert start!53952)

(declare-fun b!589104 () Bool)

(declare-datatypes ((Unit!18372 0))(
  ( (Unit!18373) )
))
(declare-fun e!336317 () Unit!18372)

(declare-fun Unit!18374 () Unit!18372)

(assert (=> b!589104 (= e!336317 Unit!18374)))

(assert (=> b!589104 false))

(declare-fun b!589105 () Bool)

(declare-fun res!376774 () Bool)

(declare-fun e!336318 () Bool)

(assert (=> b!589105 (=> (not res!376774) (not e!336318))))

(declare-datatypes ((array!36810 0))(
  ( (array!36811 (arr!17678 (Array (_ BitVec 32) (_ BitVec 64))) (size!18043 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36810)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589105 (= res!376774 (validKeyInArray!0 (select (arr!17678 a!2986) j!136)))))

(declare-fun b!589106 () Bool)

(declare-fun e!336315 () Bool)

(declare-fun e!336312 () Bool)

(assert (=> b!589106 (= e!336315 e!336312)))

(declare-fun res!376779 () Bool)

(assert (=> b!589106 (=> (not res!376779) (not e!336312))))

(declare-datatypes ((SeekEntryResult!6115 0))(
  ( (MissingZero!6115 (index!26690 (_ BitVec 32))) (Found!6115 (index!26691 (_ BitVec 32))) (Intermediate!6115 (undefined!6927 Bool) (index!26692 (_ BitVec 32)) (x!55492 (_ BitVec 32))) (Undefined!6115) (MissingVacant!6115 (index!26693 (_ BitVec 32))) )
))
(declare-fun lt!267076 () SeekEntryResult!6115)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589106 (= res!376779 (and (= lt!267076 (Found!6115 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17678 a!2986) index!984) (select (arr!17678 a!2986) j!136))) (not (= (select (arr!17678 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36810 (_ BitVec 32)) SeekEntryResult!6115)

(assert (=> b!589106 (= lt!267076 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17678 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589107 () Bool)

(declare-fun res!376776 () Bool)

(assert (=> b!589107 (=> (not res!376776) (not e!336318))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!589107 (= res!376776 (validKeyInArray!0 k0!1786))))

(declare-fun b!589109 () Bool)

(declare-fun res!376772 () Bool)

(assert (=> b!589109 (=> (not res!376772) (not e!336318))))

(declare-fun arrayContainsKey!0 (array!36810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589109 (= res!376772 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589110 () Bool)

(assert (=> b!589110 (= e!336312 (not true))))

(declare-fun lt!267072 () Unit!18372)

(assert (=> b!589110 (= lt!267072 e!336317)))

(declare-fun lt!267070 () array!36810)

(declare-fun lt!267073 () (_ BitVec 64))

(declare-fun c!66534 () Bool)

(assert (=> b!589110 (= c!66534 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267073 lt!267070 mask!3053) Undefined!6115))))

(declare-fun e!336316 () Bool)

(assert (=> b!589110 e!336316))

(declare-fun res!376781 () Bool)

(assert (=> b!589110 (=> (not res!376781) (not e!336316))))

(declare-fun lt!267071 () SeekEntryResult!6115)

(declare-fun lt!267075 () (_ BitVec 32))

(assert (=> b!589110 (= res!376781 (= lt!267071 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267075 vacantSpotIndex!68 lt!267073 lt!267070 mask!3053)))))

(assert (=> b!589110 (= lt!267071 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267075 vacantSpotIndex!68 (select (arr!17678 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589110 (= lt!267073 (select (store (arr!17678 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267074 () Unit!18372)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36810 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18372)

(assert (=> b!589110 (= lt!267074 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267075 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589110 (= lt!267075 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589111 () Bool)

(declare-fun res!376778 () Bool)

(declare-fun e!336314 () Bool)

(assert (=> b!589111 (=> (not res!376778) (not e!336314))))

(assert (=> b!589111 (= res!376778 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17678 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589112 () Bool)

(assert (=> b!589112 (= e!336316 (= lt!267076 lt!267071))))

(declare-fun b!589113 () Bool)

(declare-fun Unit!18375 () Unit!18372)

(assert (=> b!589113 (= e!336317 Unit!18375)))

(declare-fun b!589114 () Bool)

(assert (=> b!589114 (= e!336318 e!336314)))

(declare-fun res!376773 () Bool)

(assert (=> b!589114 (=> (not res!376773) (not e!336314))))

(declare-fun lt!267069 () SeekEntryResult!6115)

(assert (=> b!589114 (= res!376773 (or (= lt!267069 (MissingZero!6115 i!1108)) (= lt!267069 (MissingVacant!6115 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36810 (_ BitVec 32)) SeekEntryResult!6115)

(assert (=> b!589114 (= lt!267069 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!589115 () Bool)

(declare-fun res!376780 () Bool)

(assert (=> b!589115 (=> (not res!376780) (not e!336314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36810 (_ BitVec 32)) Bool)

(assert (=> b!589115 (= res!376780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589116 () Bool)

(assert (=> b!589116 (= e!336314 e!336315)))

(declare-fun res!376770 () Bool)

(assert (=> b!589116 (=> (not res!376770) (not e!336315))))

(assert (=> b!589116 (= res!376770 (= (select (store (arr!17678 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589116 (= lt!267070 (array!36811 (store (arr!17678 a!2986) i!1108 k0!1786) (size!18043 a!2986)))))

(declare-fun b!589117 () Bool)

(declare-fun res!376771 () Bool)

(assert (=> b!589117 (=> (not res!376771) (not e!336318))))

(assert (=> b!589117 (= res!376771 (and (= (size!18043 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18043 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18043 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!376775 () Bool)

(assert (=> start!53952 (=> (not res!376775) (not e!336318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53952 (= res!376775 (validMask!0 mask!3053))))

(assert (=> start!53952 e!336318))

(assert (=> start!53952 true))

(declare-fun array_inv!13561 (array!36810) Bool)

(assert (=> start!53952 (array_inv!13561 a!2986)))

(declare-fun b!589108 () Bool)

(declare-fun res!376777 () Bool)

(assert (=> b!589108 (=> (not res!376777) (not e!336314))))

(declare-datatypes ((List!11758 0))(
  ( (Nil!11755) (Cons!11754 (h!12799 (_ BitVec 64)) (t!17977 List!11758)) )
))
(declare-fun arrayNoDuplicates!0 (array!36810 (_ BitVec 32) List!11758) Bool)

(assert (=> b!589108 (= res!376777 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11755))))

(assert (= (and start!53952 res!376775) b!589117))

(assert (= (and b!589117 res!376771) b!589105))

(assert (= (and b!589105 res!376774) b!589107))

(assert (= (and b!589107 res!376776) b!589109))

(assert (= (and b!589109 res!376772) b!589114))

(assert (= (and b!589114 res!376773) b!589115))

(assert (= (and b!589115 res!376780) b!589108))

(assert (= (and b!589108 res!376777) b!589111))

(assert (= (and b!589111 res!376778) b!589116))

(assert (= (and b!589116 res!376770) b!589106))

(assert (= (and b!589106 res!376779) b!589110))

(assert (= (and b!589110 res!376781) b!589112))

(assert (= (and b!589110 c!66534) b!589104))

(assert (= (and b!589110 (not c!66534)) b!589113))

(declare-fun m!567121 () Bool)

(assert (=> b!589108 m!567121))

(declare-fun m!567123 () Bool)

(assert (=> b!589114 m!567123))

(declare-fun m!567125 () Bool)

(assert (=> b!589115 m!567125))

(declare-fun m!567127 () Bool)

(assert (=> start!53952 m!567127))

(declare-fun m!567129 () Bool)

(assert (=> start!53952 m!567129))

(declare-fun m!567131 () Bool)

(assert (=> b!589110 m!567131))

(declare-fun m!567133 () Bool)

(assert (=> b!589110 m!567133))

(declare-fun m!567135 () Bool)

(assert (=> b!589110 m!567135))

(declare-fun m!567137 () Bool)

(assert (=> b!589110 m!567137))

(declare-fun m!567139 () Bool)

(assert (=> b!589110 m!567139))

(declare-fun m!567141 () Bool)

(assert (=> b!589110 m!567141))

(assert (=> b!589110 m!567137))

(declare-fun m!567143 () Bool)

(assert (=> b!589110 m!567143))

(declare-fun m!567145 () Bool)

(assert (=> b!589110 m!567145))

(assert (=> b!589116 m!567139))

(declare-fun m!567147 () Bool)

(assert (=> b!589116 m!567147))

(declare-fun m!567149 () Bool)

(assert (=> b!589111 m!567149))

(assert (=> b!589105 m!567137))

(assert (=> b!589105 m!567137))

(declare-fun m!567151 () Bool)

(assert (=> b!589105 m!567151))

(declare-fun m!567153 () Bool)

(assert (=> b!589107 m!567153))

(declare-fun m!567155 () Bool)

(assert (=> b!589106 m!567155))

(assert (=> b!589106 m!567137))

(assert (=> b!589106 m!567137))

(declare-fun m!567157 () Bool)

(assert (=> b!589106 m!567157))

(declare-fun m!567159 () Bool)

(assert (=> b!589109 m!567159))

(check-sat (not b!589108) (not b!589114) (not b!589115) (not b!589106) (not b!589109) (not b!589105) (not b!589107) (not start!53952) (not b!589110))
(check-sat)
