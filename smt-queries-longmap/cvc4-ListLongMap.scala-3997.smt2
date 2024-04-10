; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54176 () Bool)

(assert start!54176)

(declare-fun b!592142 () Bool)

(declare-fun e!338134 () Bool)

(declare-fun e!338141 () Bool)

(assert (=> b!592142 (= e!338134 (not e!338141))))

(declare-fun res!379013 () Bool)

(assert (=> b!592142 (=> res!379013 e!338141)))

(declare-datatypes ((SeekEntryResult!6163 0))(
  ( (MissingZero!6163 (index!26888 (_ BitVec 32))) (Found!6163 (index!26889 (_ BitVec 32))) (Intermediate!6163 (undefined!6975 Bool) (index!26890 (_ BitVec 32)) (x!55675 (_ BitVec 32))) (Undefined!6163) (MissingVacant!6163 (index!26891 (_ BitVec 32))) )
))
(declare-fun lt!268771 () SeekEntryResult!6163)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!592142 (= res!379013 (not (= lt!268771 (Found!6163 index!984))))))

(declare-datatypes ((Unit!18570 0))(
  ( (Unit!18571) )
))
(declare-fun lt!268761 () Unit!18570)

(declare-fun e!338142 () Unit!18570)

(assert (=> b!592142 (= lt!268761 e!338142)))

(declare-fun c!66935 () Bool)

(assert (=> b!592142 (= c!66935 (= lt!268771 Undefined!6163))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!268765 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36906 0))(
  ( (array!36907 (arr!17723 (Array (_ BitVec 32) (_ BitVec 64))) (size!18087 (_ BitVec 32))) )
))
(declare-fun lt!268766 () array!36906)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36906 (_ BitVec 32)) SeekEntryResult!6163)

(assert (=> b!592142 (= lt!268771 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268765 lt!268766 mask!3053))))

(declare-fun e!338140 () Bool)

(assert (=> b!592142 e!338140))

(declare-fun res!379009 () Bool)

(assert (=> b!592142 (=> (not res!379009) (not e!338140))))

(declare-fun lt!268768 () (_ BitVec 32))

(declare-fun lt!268762 () SeekEntryResult!6163)

(assert (=> b!592142 (= res!379009 (= lt!268762 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268768 vacantSpotIndex!68 lt!268765 lt!268766 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!36906)

(assert (=> b!592142 (= lt!268762 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268768 vacantSpotIndex!68 (select (arr!17723 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!592142 (= lt!268765 (select (store (arr!17723 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268763 () Unit!18570)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36906 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18570)

(assert (=> b!592142 (= lt!268763 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268768 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592142 (= lt!268768 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!592143 () Bool)

(declare-fun res!379021 () Bool)

(declare-fun e!338135 () Bool)

(assert (=> b!592143 (=> (not res!379021) (not e!338135))))

(declare-fun arrayContainsKey!0 (array!36906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592143 (= res!379021 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!592144 () Bool)

(declare-fun lt!268764 () SeekEntryResult!6163)

(assert (=> b!592144 (= e!338140 (= lt!268764 lt!268762))))

(declare-fun b!592145 () Bool)

(declare-fun res!379006 () Bool)

(assert (=> b!592145 (=> (not res!379006) (not e!338135))))

(assert (=> b!592145 (= res!379006 (and (= (size!18087 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18087 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18087 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!592146 () Bool)

(declare-fun e!338139 () Bool)

(assert (=> b!592146 (= e!338139 e!338134)))

(declare-fun res!379010 () Bool)

(assert (=> b!592146 (=> (not res!379010) (not e!338134))))

(assert (=> b!592146 (= res!379010 (and (= lt!268764 (Found!6163 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17723 a!2986) index!984) (select (arr!17723 a!2986) j!136))) (not (= (select (arr!17723 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!592146 (= lt!268764 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17723 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592147 () Bool)

(declare-fun res!379008 () Bool)

(declare-fun e!338131 () Bool)

(assert (=> b!592147 (=> (not res!379008) (not e!338131))))

(assert (=> b!592147 (= res!379008 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17723 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!592148 () Bool)

(declare-fun e!338133 () Bool)

(assert (=> b!592148 (= e!338133 (bvsge (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000))))

(assert (=> b!592148 (arrayContainsKey!0 lt!268766 (select (arr!17723 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!268770 () Unit!18570)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36906 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18570)

(assert (=> b!592148 (= lt!268770 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268766 (select (arr!17723 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592149 () Bool)

(declare-fun e!338138 () Bool)

(declare-fun e!338137 () Bool)

(assert (=> b!592149 (= e!338138 e!338137)))

(declare-fun res!379019 () Bool)

(assert (=> b!592149 (=> res!379019 e!338137)))

(declare-fun lt!268767 () (_ BitVec 64))

(assert (=> b!592149 (= res!379019 (or (not (= (select (arr!17723 a!2986) j!136) lt!268765)) (not (= (select (arr!17723 a!2986) j!136) lt!268767)) (bvsge j!136 index!984)))))

(declare-fun b!592150 () Bool)

(assert (=> b!592150 (= e!338141 e!338133)))

(declare-fun res!379012 () Bool)

(assert (=> b!592150 (=> res!379012 e!338133)))

(assert (=> b!592150 (= res!379012 (or (not (= (select (arr!17723 a!2986) j!136) lt!268765)) (not (= (select (arr!17723 a!2986) j!136) lt!268767)) (bvsge j!136 index!984)))))

(assert (=> b!592150 e!338138))

(declare-fun res!379015 () Bool)

(assert (=> b!592150 (=> (not res!379015) (not e!338138))))

(assert (=> b!592150 (= res!379015 (= lt!268767 (select (arr!17723 a!2986) j!136)))))

(assert (=> b!592150 (= lt!268767 (select (store (arr!17723 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!592151 () Bool)

(declare-fun res!379020 () Bool)

(assert (=> b!592151 (=> (not res!379020) (not e!338131))))

(declare-datatypes ((List!11764 0))(
  ( (Nil!11761) (Cons!11760 (h!12805 (_ BitVec 64)) (t!17992 List!11764)) )
))
(declare-fun arrayNoDuplicates!0 (array!36906 (_ BitVec 32) List!11764) Bool)

(assert (=> b!592151 (= res!379020 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11761))))

(declare-fun b!592152 () Bool)

(declare-fun e!338136 () Bool)

(assert (=> b!592152 (= e!338136 (arrayContainsKey!0 lt!268766 (select (arr!17723 a!2986) j!136) index!984))))

(declare-fun b!592153 () Bool)

(assert (=> b!592153 (= e!338131 e!338139)))

(declare-fun res!379018 () Bool)

(assert (=> b!592153 (=> (not res!379018) (not e!338139))))

(assert (=> b!592153 (= res!379018 (= (select (store (arr!17723 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592153 (= lt!268766 (array!36907 (store (arr!17723 a!2986) i!1108 k!1786) (size!18087 a!2986)))))

(declare-fun b!592154 () Bool)

(declare-fun res!379016 () Bool)

(assert (=> b!592154 (=> (not res!379016) (not e!338135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592154 (= res!379016 (validKeyInArray!0 k!1786))))

(declare-fun b!592155 () Bool)

(assert (=> b!592155 (= e!338135 e!338131)))

(declare-fun res!379022 () Bool)

(assert (=> b!592155 (=> (not res!379022) (not e!338131))))

(declare-fun lt!268769 () SeekEntryResult!6163)

(assert (=> b!592155 (= res!379022 (or (= lt!268769 (MissingZero!6163 i!1108)) (= lt!268769 (MissingVacant!6163 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36906 (_ BitVec 32)) SeekEntryResult!6163)

(assert (=> b!592155 (= lt!268769 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!592156 () Bool)

(assert (=> b!592156 (= e!338137 e!338136)))

(declare-fun res!379014 () Bool)

(assert (=> b!592156 (=> (not res!379014) (not e!338136))))

(assert (=> b!592156 (= res!379014 (arrayContainsKey!0 lt!268766 (select (arr!17723 a!2986) j!136) j!136))))

(declare-fun b!592157 () Bool)

(declare-fun Unit!18572 () Unit!18570)

(assert (=> b!592157 (= e!338142 Unit!18572)))

(declare-fun b!592158 () Bool)

(declare-fun Unit!18573 () Unit!18570)

(assert (=> b!592158 (= e!338142 Unit!18573)))

(assert (=> b!592158 false))

(declare-fun res!379011 () Bool)

(assert (=> start!54176 (=> (not res!379011) (not e!338135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54176 (= res!379011 (validMask!0 mask!3053))))

(assert (=> start!54176 e!338135))

(assert (=> start!54176 true))

(declare-fun array_inv!13519 (array!36906) Bool)

(assert (=> start!54176 (array_inv!13519 a!2986)))

(declare-fun b!592159 () Bool)

(declare-fun res!379007 () Bool)

(assert (=> b!592159 (=> (not res!379007) (not e!338135))))

(assert (=> b!592159 (= res!379007 (validKeyInArray!0 (select (arr!17723 a!2986) j!136)))))

(declare-fun b!592160 () Bool)

(declare-fun res!379017 () Bool)

(assert (=> b!592160 (=> (not res!379017) (not e!338131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36906 (_ BitVec 32)) Bool)

(assert (=> b!592160 (= res!379017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!54176 res!379011) b!592145))

(assert (= (and b!592145 res!379006) b!592159))

(assert (= (and b!592159 res!379007) b!592154))

(assert (= (and b!592154 res!379016) b!592143))

(assert (= (and b!592143 res!379021) b!592155))

(assert (= (and b!592155 res!379022) b!592160))

(assert (= (and b!592160 res!379017) b!592151))

(assert (= (and b!592151 res!379020) b!592147))

(assert (= (and b!592147 res!379008) b!592153))

(assert (= (and b!592153 res!379018) b!592146))

(assert (= (and b!592146 res!379010) b!592142))

(assert (= (and b!592142 res!379009) b!592144))

(assert (= (and b!592142 c!66935) b!592158))

(assert (= (and b!592142 (not c!66935)) b!592157))

(assert (= (and b!592142 (not res!379013)) b!592150))

(assert (= (and b!592150 res!379015) b!592149))

(assert (= (and b!592149 (not res!379019)) b!592156))

(assert (= (and b!592156 res!379014) b!592152))

(assert (= (and b!592150 (not res!379012)) b!592148))

(declare-fun m!570287 () Bool)

(assert (=> b!592149 m!570287))

(declare-fun m!570289 () Bool)

(assert (=> b!592151 m!570289))

(declare-fun m!570291 () Bool)

(assert (=> b!592160 m!570291))

(assert (=> b!592148 m!570287))

(assert (=> b!592148 m!570287))

(declare-fun m!570293 () Bool)

(assert (=> b!592148 m!570293))

(assert (=> b!592148 m!570287))

(declare-fun m!570295 () Bool)

(assert (=> b!592148 m!570295))

(declare-fun m!570297 () Bool)

(assert (=> start!54176 m!570297))

(declare-fun m!570299 () Bool)

(assert (=> start!54176 m!570299))

(declare-fun m!570301 () Bool)

(assert (=> b!592153 m!570301))

(declare-fun m!570303 () Bool)

(assert (=> b!592153 m!570303))

(declare-fun m!570305 () Bool)

(assert (=> b!592142 m!570305))

(declare-fun m!570307 () Bool)

(assert (=> b!592142 m!570307))

(assert (=> b!592142 m!570287))

(declare-fun m!570309 () Bool)

(assert (=> b!592142 m!570309))

(assert (=> b!592142 m!570301))

(declare-fun m!570311 () Bool)

(assert (=> b!592142 m!570311))

(declare-fun m!570313 () Bool)

(assert (=> b!592142 m!570313))

(assert (=> b!592142 m!570287))

(declare-fun m!570315 () Bool)

(assert (=> b!592142 m!570315))

(declare-fun m!570317 () Bool)

(assert (=> b!592146 m!570317))

(assert (=> b!592146 m!570287))

(assert (=> b!592146 m!570287))

(declare-fun m!570319 () Bool)

(assert (=> b!592146 m!570319))

(assert (=> b!592150 m!570287))

(assert (=> b!592150 m!570301))

(declare-fun m!570321 () Bool)

(assert (=> b!592150 m!570321))

(declare-fun m!570323 () Bool)

(assert (=> b!592143 m!570323))

(declare-fun m!570325 () Bool)

(assert (=> b!592155 m!570325))

(declare-fun m!570327 () Bool)

(assert (=> b!592147 m!570327))

(assert (=> b!592159 m!570287))

(assert (=> b!592159 m!570287))

(declare-fun m!570329 () Bool)

(assert (=> b!592159 m!570329))

(assert (=> b!592156 m!570287))

(assert (=> b!592156 m!570287))

(declare-fun m!570331 () Bool)

(assert (=> b!592156 m!570331))

(assert (=> b!592152 m!570287))

(assert (=> b!592152 m!570287))

(declare-fun m!570333 () Bool)

(assert (=> b!592152 m!570333))

(declare-fun m!570335 () Bool)

(assert (=> b!592154 m!570335))

(push 1)

