; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54138 () Bool)

(assert start!54138)

(declare-fun b!591269 () Bool)

(declare-fun e!337590 () Bool)

(declare-fun e!337589 () Bool)

(assert (=> b!591269 (= e!337590 e!337589)))

(declare-fun res!378348 () Bool)

(assert (=> b!591269 (=> (not res!378348) (not e!337589))))

(declare-datatypes ((SeekEntryResult!6148 0))(
  ( (MissingZero!6148 (index!26828 (_ BitVec 32))) (Found!6148 (index!26829 (_ BitVec 32))) (Intermediate!6148 (undefined!6960 Bool) (index!26830 (_ BitVec 32)) (x!55631 (_ BitVec 32))) (Undefined!6148) (MissingVacant!6148 (index!26831 (_ BitVec 32))) )
))
(declare-fun lt!268191 () SeekEntryResult!6148)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36882 0))(
  ( (array!36883 (arr!17711 (Array (_ BitVec 32) (_ BitVec 64))) (size!18076 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36882)

(assert (=> b!591269 (= res!378348 (and (= lt!268191 (Found!6148 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17711 a!2986) index!984) (select (arr!17711 a!2986) j!136))) (not (= (select (arr!17711 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36882 (_ BitVec 32)) SeekEntryResult!6148)

(assert (=> b!591269 (= lt!268191 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17711 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!378344 () Bool)

(declare-fun e!337591 () Bool)

(assert (=> start!54138 (=> (not res!378344) (not e!337591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54138 (= res!378344 (validMask!0 mask!3053))))

(assert (=> start!54138 e!337591))

(assert (=> start!54138 true))

(declare-fun array_inv!13594 (array!36882) Bool)

(assert (=> start!54138 (array_inv!13594 a!2986)))

(declare-fun b!591270 () Bool)

(declare-fun e!337586 () Bool)

(assert (=> b!591270 (= e!337589 (not e!337586))))

(declare-fun res!378346 () Bool)

(assert (=> b!591270 (=> res!378346 e!337586)))

(declare-fun lt!268190 () SeekEntryResult!6148)

(assert (=> b!591270 (= res!378346 (not (= lt!268190 (Found!6148 index!984))))))

(declare-datatypes ((Unit!18504 0))(
  ( (Unit!18505) )
))
(declare-fun lt!268198 () Unit!18504)

(declare-fun e!337593 () Unit!18504)

(assert (=> b!591270 (= lt!268198 e!337593)))

(declare-fun c!66831 () Bool)

(assert (=> b!591270 (= c!66831 (= lt!268190 Undefined!6148))))

(declare-fun lt!268194 () (_ BitVec 64))

(declare-fun lt!268196 () array!36882)

(assert (=> b!591270 (= lt!268190 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268194 lt!268196 mask!3053))))

(declare-fun e!337594 () Bool)

(assert (=> b!591270 e!337594))

(declare-fun res!378342 () Bool)

(assert (=> b!591270 (=> (not res!378342) (not e!337594))))

(declare-fun lt!268195 () (_ BitVec 32))

(declare-fun lt!268189 () SeekEntryResult!6148)

(assert (=> b!591270 (= res!378342 (= lt!268189 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268195 vacantSpotIndex!68 lt!268194 lt!268196 mask!3053)))))

(assert (=> b!591270 (= lt!268189 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268195 vacantSpotIndex!68 (select (arr!17711 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!591270 (= lt!268194 (select (store (arr!17711 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268197 () Unit!18504)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36882 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18504)

(assert (=> b!591270 (= lt!268197 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268195 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591270 (= lt!268195 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591271 () Bool)

(assert (=> b!591271 (= e!337594 (= lt!268191 lt!268189))))

(declare-fun b!591272 () Bool)

(declare-fun res!378341 () Bool)

(assert (=> b!591272 (=> (not res!378341) (not e!337591))))

(declare-fun arrayContainsKey!0 (array!36882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591272 (= res!378341 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591273 () Bool)

(declare-fun e!337596 () Bool)

(declare-fun e!337588 () Bool)

(assert (=> b!591273 (= e!337596 e!337588)))

(declare-fun res!378350 () Bool)

(assert (=> b!591273 (=> (not res!378350) (not e!337588))))

(assert (=> b!591273 (= res!378350 (arrayContainsKey!0 lt!268196 (select (arr!17711 a!2986) j!136) j!136))))

(declare-fun b!591274 () Bool)

(assert (=> b!591274 (= e!337586 true)))

(declare-fun e!337592 () Bool)

(assert (=> b!591274 e!337592))

(declare-fun res!378345 () Bool)

(assert (=> b!591274 (=> (not res!378345) (not e!337592))))

(declare-fun lt!268193 () (_ BitVec 64))

(assert (=> b!591274 (= res!378345 (= lt!268193 (select (arr!17711 a!2986) j!136)))))

(assert (=> b!591274 (= lt!268193 (select (store (arr!17711 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!591275 () Bool)

(assert (=> b!591275 (= e!337588 (arrayContainsKey!0 lt!268196 (select (arr!17711 a!2986) j!136) index!984))))

(declare-fun b!591276 () Bool)

(declare-fun res!378354 () Bool)

(declare-fun e!337595 () Bool)

(assert (=> b!591276 (=> (not res!378354) (not e!337595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36882 (_ BitVec 32)) Bool)

(assert (=> b!591276 (= res!378354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591277 () Bool)

(declare-fun res!378349 () Bool)

(assert (=> b!591277 (=> (not res!378349) (not e!337595))))

(assert (=> b!591277 (= res!378349 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17711 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591278 () Bool)

(assert (=> b!591278 (= e!337595 e!337590)))

(declare-fun res!378355 () Bool)

(assert (=> b!591278 (=> (not res!378355) (not e!337590))))

(assert (=> b!591278 (= res!378355 (= (select (store (arr!17711 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591278 (= lt!268196 (array!36883 (store (arr!17711 a!2986) i!1108 k0!1786) (size!18076 a!2986)))))

(declare-fun b!591279 () Bool)

(declare-fun res!378356 () Bool)

(assert (=> b!591279 (=> (not res!378356) (not e!337591))))

(assert (=> b!591279 (= res!378356 (and (= (size!18076 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18076 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18076 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591280 () Bool)

(declare-fun Unit!18506 () Unit!18504)

(assert (=> b!591280 (= e!337593 Unit!18506)))

(assert (=> b!591280 false))

(declare-fun b!591281 () Bool)

(assert (=> b!591281 (= e!337592 e!337596)))

(declare-fun res!378351 () Bool)

(assert (=> b!591281 (=> res!378351 e!337596)))

(assert (=> b!591281 (= res!378351 (or (not (= (select (arr!17711 a!2986) j!136) lt!268194)) (not (= (select (arr!17711 a!2986) j!136) lt!268193)) (bvsge j!136 index!984)))))

(declare-fun b!591282 () Bool)

(declare-fun res!378352 () Bool)

(assert (=> b!591282 (=> (not res!378352) (not e!337591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591282 (= res!378352 (validKeyInArray!0 (select (arr!17711 a!2986) j!136)))))

(declare-fun b!591283 () Bool)

(declare-fun res!378343 () Bool)

(assert (=> b!591283 (=> (not res!378343) (not e!337591))))

(assert (=> b!591283 (= res!378343 (validKeyInArray!0 k0!1786))))

(declare-fun b!591284 () Bool)

(declare-fun Unit!18507 () Unit!18504)

(assert (=> b!591284 (= e!337593 Unit!18507)))

(declare-fun b!591285 () Bool)

(assert (=> b!591285 (= e!337591 e!337595)))

(declare-fun res!378347 () Bool)

(assert (=> b!591285 (=> (not res!378347) (not e!337595))))

(declare-fun lt!268192 () SeekEntryResult!6148)

(assert (=> b!591285 (= res!378347 (or (= lt!268192 (MissingZero!6148 i!1108)) (= lt!268192 (MissingVacant!6148 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36882 (_ BitVec 32)) SeekEntryResult!6148)

(assert (=> b!591285 (= lt!268192 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!591286 () Bool)

(declare-fun res!378353 () Bool)

(assert (=> b!591286 (=> (not res!378353) (not e!337595))))

(declare-datatypes ((List!11791 0))(
  ( (Nil!11788) (Cons!11787 (h!12832 (_ BitVec 64)) (t!18010 List!11791)) )
))
(declare-fun arrayNoDuplicates!0 (array!36882 (_ BitVec 32) List!11791) Bool)

(assert (=> b!591286 (= res!378353 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11788))))

(assert (= (and start!54138 res!378344) b!591279))

(assert (= (and b!591279 res!378356) b!591282))

(assert (= (and b!591282 res!378352) b!591283))

(assert (= (and b!591283 res!378343) b!591272))

(assert (= (and b!591272 res!378341) b!591285))

(assert (= (and b!591285 res!378347) b!591276))

(assert (= (and b!591276 res!378354) b!591286))

(assert (= (and b!591286 res!378353) b!591277))

(assert (= (and b!591277 res!378349) b!591278))

(assert (= (and b!591278 res!378355) b!591269))

(assert (= (and b!591269 res!378348) b!591270))

(assert (= (and b!591270 res!378342) b!591271))

(assert (= (and b!591270 c!66831) b!591280))

(assert (= (and b!591270 (not c!66831)) b!591284))

(assert (= (and b!591270 (not res!378346)) b!591274))

(assert (= (and b!591274 res!378345) b!591281))

(assert (= (and b!591281 (not res!378351)) b!591273))

(assert (= (and b!591273 res!378350) b!591275))

(declare-fun m!568987 () Bool)

(assert (=> b!591274 m!568987))

(declare-fun m!568989 () Bool)

(assert (=> b!591274 m!568989))

(declare-fun m!568991 () Bool)

(assert (=> b!591274 m!568991))

(declare-fun m!568993 () Bool)

(assert (=> b!591272 m!568993))

(assert (=> b!591282 m!568987))

(assert (=> b!591282 m!568987))

(declare-fun m!568995 () Bool)

(assert (=> b!591282 m!568995))

(declare-fun m!568997 () Bool)

(assert (=> b!591269 m!568997))

(assert (=> b!591269 m!568987))

(assert (=> b!591269 m!568987))

(declare-fun m!568999 () Bool)

(assert (=> b!591269 m!568999))

(declare-fun m!569001 () Bool)

(assert (=> b!591285 m!569001))

(assert (=> b!591281 m!568987))

(assert (=> b!591278 m!568989))

(declare-fun m!569003 () Bool)

(assert (=> b!591278 m!569003))

(declare-fun m!569005 () Bool)

(assert (=> b!591276 m!569005))

(assert (=> b!591275 m!568987))

(assert (=> b!591275 m!568987))

(declare-fun m!569007 () Bool)

(assert (=> b!591275 m!569007))

(declare-fun m!569009 () Bool)

(assert (=> start!54138 m!569009))

(declare-fun m!569011 () Bool)

(assert (=> start!54138 m!569011))

(assert (=> b!591273 m!568987))

(assert (=> b!591273 m!568987))

(declare-fun m!569013 () Bool)

(assert (=> b!591273 m!569013))

(declare-fun m!569015 () Bool)

(assert (=> b!591283 m!569015))

(declare-fun m!569017 () Bool)

(assert (=> b!591270 m!569017))

(declare-fun m!569019 () Bool)

(assert (=> b!591270 m!569019))

(assert (=> b!591270 m!568987))

(assert (=> b!591270 m!568989))

(assert (=> b!591270 m!568987))

(declare-fun m!569021 () Bool)

(assert (=> b!591270 m!569021))

(declare-fun m!569023 () Bool)

(assert (=> b!591270 m!569023))

(declare-fun m!569025 () Bool)

(assert (=> b!591270 m!569025))

(declare-fun m!569027 () Bool)

(assert (=> b!591270 m!569027))

(declare-fun m!569029 () Bool)

(assert (=> b!591286 m!569029))

(declare-fun m!569031 () Bool)

(assert (=> b!591277 m!569031))

(check-sat (not b!591275) (not b!591282) (not b!591276) (not b!591273) (not b!591283) (not b!591286) (not b!591272) (not start!54138) (not b!591269) (not b!591285) (not b!591270))
(check-sat)
