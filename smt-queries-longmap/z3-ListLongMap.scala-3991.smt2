; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54186 () Bool)

(assert start!54186)

(declare-fun b!591263 () Bool)

(declare-datatypes ((Unit!18469 0))(
  ( (Unit!18470) )
))
(declare-fun e!337599 () Unit!18469)

(declare-fun Unit!18471 () Unit!18469)

(assert (=> b!591263 (= e!337599 Unit!18471)))

(assert (=> b!591263 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!337600 () Bool)

(declare-fun b!591264 () Bool)

(declare-datatypes ((array!36861 0))(
  ( (array!36862 (arr!17698 (Array (_ BitVec 32) (_ BitVec 64))) (size!18062 (_ BitVec 32))) )
))
(declare-fun lt!268255 () array!36861)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!36861)

(declare-fun arrayContainsKey!0 (array!36861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591264 (= e!337600 (arrayContainsKey!0 lt!268255 (select (arr!17698 a!2986) j!136) index!984))))

(declare-fun b!591265 () Bool)

(declare-fun e!337592 () Bool)

(declare-fun e!337602 () Bool)

(assert (=> b!591265 (= e!337592 e!337602)))

(declare-fun res!378151 () Bool)

(assert (=> b!591265 (=> (not res!378151) (not e!337602))))

(declare-datatypes ((SeekEntryResult!6094 0))(
  ( (MissingZero!6094 (index!26612 (_ BitVec 32))) (Found!6094 (index!26613 (_ BitVec 32))) (Intermediate!6094 (undefined!6906 Bool) (index!26614 (_ BitVec 32)) (x!55561 (_ BitVec 32))) (Undefined!6094) (MissingVacant!6094 (index!26615 (_ BitVec 32))) )
))
(declare-fun lt!268259 () SeekEntryResult!6094)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!591265 (= res!378151 (and (= lt!268259 (Found!6094 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17698 a!2986) index!984) (select (arr!17698 a!2986) j!136))) (not (= (select (arr!17698 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36861 (_ BitVec 32)) SeekEntryResult!6094)

(assert (=> b!591265 (= lt!268259 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17698 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591266 () Bool)

(declare-fun e!337596 () Bool)

(assert (=> b!591266 (= e!337596 e!337592)))

(declare-fun res!378147 () Bool)

(assert (=> b!591266 (=> (not res!378147) (not e!337592))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!591266 (= res!378147 (= (select (store (arr!17698 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591266 (= lt!268255 (array!36862 (store (arr!17698 a!2986) i!1108 k0!1786) (size!18062 a!2986)))))

(declare-fun b!591267 () Bool)

(declare-fun res!378155 () Bool)

(declare-fun e!337595 () Bool)

(assert (=> b!591267 (=> (not res!378155) (not e!337595))))

(assert (=> b!591267 (= res!378155 (and (= (size!18062 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18062 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18062 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591268 () Bool)

(declare-fun e!337597 () Bool)

(declare-fun lt!268256 () SeekEntryResult!6094)

(assert (=> b!591268 (= e!337597 (= lt!268259 lt!268256))))

(declare-fun res!378152 () Bool)

(assert (=> start!54186 (=> (not res!378152) (not e!337595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54186 (= res!378152 (validMask!0 mask!3053))))

(assert (=> start!54186 e!337595))

(assert (=> start!54186 true))

(declare-fun array_inv!13557 (array!36861) Bool)

(assert (=> start!54186 (array_inv!13557 a!2986)))

(declare-fun b!591269 () Bool)

(declare-fun Unit!18472 () Unit!18469)

(assert (=> b!591269 (= e!337599 Unit!18472)))

(declare-fun b!591270 () Bool)

(declare-fun res!378149 () Bool)

(assert (=> b!591270 (=> (not res!378149) (not e!337596))))

(declare-datatypes ((List!11646 0))(
  ( (Nil!11643) (Cons!11642 (h!12690 (_ BitVec 64)) (t!17866 List!11646)) )
))
(declare-fun arrayNoDuplicates!0 (array!36861 (_ BitVec 32) List!11646) Bool)

(assert (=> b!591270 (= res!378149 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11643))))

(declare-fun b!591271 () Bool)

(declare-fun e!337601 () Bool)

(assert (=> b!591271 (= e!337601 true)))

(declare-fun e!337598 () Bool)

(assert (=> b!591271 e!337598))

(declare-fun res!378146 () Bool)

(assert (=> b!591271 (=> (not res!378146) (not e!337598))))

(declare-fun lt!268264 () (_ BitVec 64))

(assert (=> b!591271 (= res!378146 (= lt!268264 (select (arr!17698 a!2986) j!136)))))

(assert (=> b!591271 (= lt!268264 (select (store (arr!17698 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!591272 () Bool)

(declare-fun res!378144 () Bool)

(assert (=> b!591272 (=> (not res!378144) (not e!337595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591272 (= res!378144 (validKeyInArray!0 k0!1786))))

(declare-fun b!591273 () Bool)

(assert (=> b!591273 (= e!337595 e!337596)))

(declare-fun res!378153 () Bool)

(assert (=> b!591273 (=> (not res!378153) (not e!337596))))

(declare-fun lt!268257 () SeekEntryResult!6094)

(assert (=> b!591273 (= res!378153 (or (= lt!268257 (MissingZero!6094 i!1108)) (= lt!268257 (MissingVacant!6094 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36861 (_ BitVec 32)) SeekEntryResult!6094)

(assert (=> b!591273 (= lt!268257 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!591274 () Bool)

(assert (=> b!591274 (= e!337602 (not e!337601))))

(declare-fun res!378145 () Bool)

(assert (=> b!591274 (=> res!378145 e!337601)))

(declare-fun lt!268261 () SeekEntryResult!6094)

(assert (=> b!591274 (= res!378145 (not (= lt!268261 (Found!6094 index!984))))))

(declare-fun lt!268260 () Unit!18469)

(assert (=> b!591274 (= lt!268260 e!337599)))

(declare-fun c!66929 () Bool)

(assert (=> b!591274 (= c!66929 (= lt!268261 Undefined!6094))))

(declare-fun lt!268262 () (_ BitVec 64))

(assert (=> b!591274 (= lt!268261 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268262 lt!268255 mask!3053))))

(assert (=> b!591274 e!337597))

(declare-fun res!378154 () Bool)

(assert (=> b!591274 (=> (not res!378154) (not e!337597))))

(declare-fun lt!268258 () (_ BitVec 32))

(assert (=> b!591274 (= res!378154 (= lt!268256 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268258 vacantSpotIndex!68 lt!268262 lt!268255 mask!3053)))))

(assert (=> b!591274 (= lt!268256 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268258 vacantSpotIndex!68 (select (arr!17698 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591274 (= lt!268262 (select (store (arr!17698 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268263 () Unit!18469)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36861 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18469)

(assert (=> b!591274 (= lt!268263 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268258 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591274 (= lt!268258 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!591275 () Bool)

(declare-fun res!378150 () Bool)

(assert (=> b!591275 (=> (not res!378150) (not e!337595))))

(assert (=> b!591275 (= res!378150 (validKeyInArray!0 (select (arr!17698 a!2986) j!136)))))

(declare-fun b!591276 () Bool)

(declare-fun res!378157 () Bool)

(assert (=> b!591276 (=> (not res!378157) (not e!337596))))

(assert (=> b!591276 (= res!378157 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17698 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591277 () Bool)

(declare-fun e!337594 () Bool)

(assert (=> b!591277 (= e!337598 e!337594)))

(declare-fun res!378148 () Bool)

(assert (=> b!591277 (=> res!378148 e!337594)))

(assert (=> b!591277 (= res!378148 (or (not (= (select (arr!17698 a!2986) j!136) lt!268262)) (not (= (select (arr!17698 a!2986) j!136) lt!268264)) (bvsge j!136 index!984)))))

(declare-fun b!591278 () Bool)

(assert (=> b!591278 (= e!337594 e!337600)))

(declare-fun res!378142 () Bool)

(assert (=> b!591278 (=> (not res!378142) (not e!337600))))

(assert (=> b!591278 (= res!378142 (arrayContainsKey!0 lt!268255 (select (arr!17698 a!2986) j!136) j!136))))

(declare-fun b!591279 () Bool)

(declare-fun res!378143 () Bool)

(assert (=> b!591279 (=> (not res!378143) (not e!337596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36861 (_ BitVec 32)) Bool)

(assert (=> b!591279 (= res!378143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591280 () Bool)

(declare-fun res!378156 () Bool)

(assert (=> b!591280 (=> (not res!378156) (not e!337595))))

(assert (=> b!591280 (= res!378156 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!54186 res!378152) b!591267))

(assert (= (and b!591267 res!378155) b!591275))

(assert (= (and b!591275 res!378150) b!591272))

(assert (= (and b!591272 res!378144) b!591280))

(assert (= (and b!591280 res!378156) b!591273))

(assert (= (and b!591273 res!378153) b!591279))

(assert (= (and b!591279 res!378143) b!591270))

(assert (= (and b!591270 res!378149) b!591276))

(assert (= (and b!591276 res!378157) b!591266))

(assert (= (and b!591266 res!378147) b!591265))

(assert (= (and b!591265 res!378151) b!591274))

(assert (= (and b!591274 res!378154) b!591268))

(assert (= (and b!591274 c!66929) b!591263))

(assert (= (and b!591274 (not c!66929)) b!591269))

(assert (= (and b!591274 (not res!378145)) b!591271))

(assert (= (and b!591271 res!378146) b!591277))

(assert (= (and b!591277 (not res!378148)) b!591278))

(assert (= (and b!591278 res!378142) b!591264))

(declare-fun m!569735 () Bool)

(assert (=> b!591274 m!569735))

(declare-fun m!569737 () Bool)

(assert (=> b!591274 m!569737))

(declare-fun m!569739 () Bool)

(assert (=> b!591274 m!569739))

(declare-fun m!569741 () Bool)

(assert (=> b!591274 m!569741))

(declare-fun m!569743 () Bool)

(assert (=> b!591274 m!569743))

(assert (=> b!591274 m!569739))

(declare-fun m!569745 () Bool)

(assert (=> b!591274 m!569745))

(declare-fun m!569747 () Bool)

(assert (=> b!591274 m!569747))

(declare-fun m!569749 () Bool)

(assert (=> b!591274 m!569749))

(declare-fun m!569751 () Bool)

(assert (=> b!591272 m!569751))

(assert (=> b!591266 m!569741))

(declare-fun m!569753 () Bool)

(assert (=> b!591266 m!569753))

(assert (=> b!591275 m!569739))

(assert (=> b!591275 m!569739))

(declare-fun m!569755 () Bool)

(assert (=> b!591275 m!569755))

(declare-fun m!569757 () Bool)

(assert (=> b!591265 m!569757))

(assert (=> b!591265 m!569739))

(assert (=> b!591265 m!569739))

(declare-fun m!569759 () Bool)

(assert (=> b!591265 m!569759))

(declare-fun m!569761 () Bool)

(assert (=> b!591273 m!569761))

(assert (=> b!591277 m!569739))

(declare-fun m!569763 () Bool)

(assert (=> b!591279 m!569763))

(assert (=> b!591271 m!569739))

(assert (=> b!591271 m!569741))

(declare-fun m!569765 () Bool)

(assert (=> b!591271 m!569765))

(assert (=> b!591264 m!569739))

(assert (=> b!591264 m!569739))

(declare-fun m!569767 () Bool)

(assert (=> b!591264 m!569767))

(assert (=> b!591278 m!569739))

(assert (=> b!591278 m!569739))

(declare-fun m!569769 () Bool)

(assert (=> b!591278 m!569769))

(declare-fun m!569771 () Bool)

(assert (=> b!591280 m!569771))

(declare-fun m!569773 () Bool)

(assert (=> b!591270 m!569773))

(declare-fun m!569775 () Bool)

(assert (=> b!591276 m!569775))

(declare-fun m!569777 () Bool)

(assert (=> start!54186 m!569777))

(declare-fun m!569779 () Bool)

(assert (=> start!54186 m!569779))

(check-sat (not b!591279) (not b!591273) (not b!591275) (not b!591270) (not b!591264) (not b!591272) (not b!591278) (not b!591280) (not b!591265) (not start!54186) (not b!591274))
(check-sat)
