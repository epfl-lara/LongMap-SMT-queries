; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54144 () Bool)

(assert start!54144)

(declare-fun b!591270 () Bool)

(declare-fun e!337598 () Bool)

(declare-fun e!337605 () Bool)

(assert (=> b!591270 (= e!337598 e!337605)))

(declare-fun res!378242 () Bool)

(assert (=> b!591270 (=> (not res!378242) (not e!337605))))

(declare-datatypes ((SeekEntryResult!6147 0))(
  ( (MissingZero!6147 (index!26824 (_ BitVec 32))) (Found!6147 (index!26825 (_ BitVec 32))) (Intermediate!6147 (undefined!6959 Bool) (index!26826 (_ BitVec 32)) (x!55619 (_ BitVec 32))) (Undefined!6147) (MissingVacant!6147 (index!26827 (_ BitVec 32))) )
))
(declare-fun lt!268273 () SeekEntryResult!6147)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!591270 (= res!378242 (or (= lt!268273 (MissingZero!6147 i!1108)) (= lt!268273 (MissingVacant!6147 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36874 0))(
  ( (array!36875 (arr!17707 (Array (_ BitVec 32) (_ BitVec 64))) (size!18071 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36874)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36874 (_ BitVec 32)) SeekEntryResult!6147)

(assert (=> b!591270 (= lt!268273 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!591271 () Bool)

(declare-fun res!378236 () Bool)

(assert (=> b!591271 (=> (not res!378236) (not e!337598))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!591271 (= res!378236 (and (= (size!18071 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18071 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18071 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591272 () Bool)

(declare-fun e!337602 () Bool)

(assert (=> b!591272 (= e!337602 true)))

(declare-fun e!337600 () Bool)

(assert (=> b!591272 e!337600))

(declare-fun res!378237 () Bool)

(assert (=> b!591272 (=> (not res!378237) (not e!337600))))

(declare-fun lt!268280 () (_ BitVec 64))

(assert (=> b!591272 (= res!378237 (= lt!268280 (select (arr!17707 a!2986) j!136)))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!591272 (= lt!268280 (select (store (arr!17707 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!591273 () Bool)

(declare-fun res!378234 () Bool)

(assert (=> b!591273 (=> (not res!378234) (not e!337605))))

(declare-datatypes ((List!11748 0))(
  ( (Nil!11745) (Cons!11744 (h!12789 (_ BitVec 64)) (t!17976 List!11748)) )
))
(declare-fun arrayNoDuplicates!0 (array!36874 (_ BitVec 32) List!11748) Bool)

(assert (=> b!591273 (= res!378234 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11745))))

(declare-fun b!591274 () Bool)

(declare-fun res!378233 () Bool)

(assert (=> b!591274 (=> (not res!378233) (not e!337605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36874 (_ BitVec 32)) Bool)

(assert (=> b!591274 (= res!378233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!378230 () Bool)

(assert (=> start!54144 (=> (not res!378230) (not e!337598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54144 (= res!378230 (validMask!0 mask!3053))))

(assert (=> start!54144 e!337598))

(assert (=> start!54144 true))

(declare-fun array_inv!13503 (array!36874) Bool)

(assert (=> start!54144 (array_inv!13503 a!2986)))

(declare-fun lt!268275 () array!36874)

(declare-fun b!591275 () Bool)

(declare-fun e!337596 () Bool)

(declare-fun arrayContainsKey!0 (array!36874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591275 (= e!337596 (arrayContainsKey!0 lt!268275 (select (arr!17707 a!2986) j!136) index!984))))

(declare-fun b!591276 () Bool)

(declare-fun res!378244 () Bool)

(assert (=> b!591276 (=> (not res!378244) (not e!337605))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!591276 (= res!378244 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17707 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591277 () Bool)

(declare-datatypes ((Unit!18506 0))(
  ( (Unit!18507) )
))
(declare-fun e!337601 () Unit!18506)

(declare-fun Unit!18508 () Unit!18506)

(assert (=> b!591277 (= e!337601 Unit!18508)))

(assert (=> b!591277 false))

(declare-fun b!591278 () Bool)

(declare-fun res!378231 () Bool)

(assert (=> b!591278 (=> (not res!378231) (not e!337598))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591278 (= res!378231 (validKeyInArray!0 (select (arr!17707 a!2986) j!136)))))

(declare-fun b!591279 () Bool)

(declare-fun e!337595 () Bool)

(assert (=> b!591279 (= e!337605 e!337595)))

(declare-fun res!378238 () Bool)

(assert (=> b!591279 (=> (not res!378238) (not e!337595))))

(assert (=> b!591279 (= res!378238 (= (select (store (arr!17707 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591279 (= lt!268275 (array!36875 (store (arr!17707 a!2986) i!1108 k0!1786) (size!18071 a!2986)))))

(declare-fun b!591280 () Bool)

(declare-fun e!337603 () Bool)

(assert (=> b!591280 (= e!337603 (not e!337602))))

(declare-fun res!378245 () Bool)

(assert (=> b!591280 (=> res!378245 e!337602)))

(declare-fun lt!268274 () SeekEntryResult!6147)

(assert (=> b!591280 (= res!378245 (not (= lt!268274 (Found!6147 index!984))))))

(declare-fun lt!268277 () Unit!18506)

(assert (=> b!591280 (= lt!268277 e!337601)))

(declare-fun c!66887 () Bool)

(assert (=> b!591280 (= c!66887 (= lt!268274 Undefined!6147))))

(declare-fun lt!268276 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36874 (_ BitVec 32)) SeekEntryResult!6147)

(assert (=> b!591280 (= lt!268274 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268276 lt!268275 mask!3053))))

(declare-fun e!337604 () Bool)

(assert (=> b!591280 e!337604))

(declare-fun res!378240 () Bool)

(assert (=> b!591280 (=> (not res!378240) (not e!337604))))

(declare-fun lt!268278 () (_ BitVec 32))

(declare-fun lt!268279 () SeekEntryResult!6147)

(assert (=> b!591280 (= res!378240 (= lt!268279 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268278 vacantSpotIndex!68 lt!268276 lt!268275 mask!3053)))))

(assert (=> b!591280 (= lt!268279 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268278 vacantSpotIndex!68 (select (arr!17707 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591280 (= lt!268276 (select (store (arr!17707 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268281 () Unit!18506)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36874 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18506)

(assert (=> b!591280 (= lt!268281 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268278 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591280 (= lt!268278 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591281 () Bool)

(declare-fun res!378241 () Bool)

(assert (=> b!591281 (=> (not res!378241) (not e!337598))))

(assert (=> b!591281 (= res!378241 (validKeyInArray!0 k0!1786))))

(declare-fun b!591282 () Bool)

(declare-fun res!378235 () Bool)

(assert (=> b!591282 (=> (not res!378235) (not e!337598))))

(assert (=> b!591282 (= res!378235 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591283 () Bool)

(declare-fun lt!268282 () SeekEntryResult!6147)

(assert (=> b!591283 (= e!337604 (= lt!268282 lt!268279))))

(declare-fun b!591284 () Bool)

(assert (=> b!591284 (= e!337595 e!337603)))

(declare-fun res!378243 () Bool)

(assert (=> b!591284 (=> (not res!378243) (not e!337603))))

(assert (=> b!591284 (= res!378243 (and (= lt!268282 (Found!6147 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17707 a!2986) index!984) (select (arr!17707 a!2986) j!136))) (not (= (select (arr!17707 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!591284 (= lt!268282 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17707 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591285 () Bool)

(declare-fun e!337597 () Bool)

(assert (=> b!591285 (= e!337597 e!337596)))

(declare-fun res!378239 () Bool)

(assert (=> b!591285 (=> (not res!378239) (not e!337596))))

(assert (=> b!591285 (= res!378239 (arrayContainsKey!0 lt!268275 (select (arr!17707 a!2986) j!136) j!136))))

(declare-fun b!591286 () Bool)

(assert (=> b!591286 (= e!337600 e!337597)))

(declare-fun res!378232 () Bool)

(assert (=> b!591286 (=> res!378232 e!337597)))

(assert (=> b!591286 (= res!378232 (or (not (= (select (arr!17707 a!2986) j!136) lt!268276)) (not (= (select (arr!17707 a!2986) j!136) lt!268280)) (bvsge j!136 index!984)))))

(declare-fun b!591287 () Bool)

(declare-fun Unit!18509 () Unit!18506)

(assert (=> b!591287 (= e!337601 Unit!18509)))

(assert (= (and start!54144 res!378230) b!591271))

(assert (= (and b!591271 res!378236) b!591278))

(assert (= (and b!591278 res!378231) b!591281))

(assert (= (and b!591281 res!378241) b!591282))

(assert (= (and b!591282 res!378235) b!591270))

(assert (= (and b!591270 res!378242) b!591274))

(assert (= (and b!591274 res!378233) b!591273))

(assert (= (and b!591273 res!378234) b!591276))

(assert (= (and b!591276 res!378244) b!591279))

(assert (= (and b!591279 res!378238) b!591284))

(assert (= (and b!591284 res!378243) b!591280))

(assert (= (and b!591280 res!378240) b!591283))

(assert (= (and b!591280 c!66887) b!591277))

(assert (= (and b!591280 (not c!66887)) b!591287))

(assert (= (and b!591280 (not res!378245)) b!591272))

(assert (= (and b!591272 res!378237) b!591286))

(assert (= (and b!591286 (not res!378232)) b!591285))

(assert (= (and b!591285 res!378239) b!591275))

(declare-fun m!569543 () Bool)

(assert (=> b!591274 m!569543))

(declare-fun m!569545 () Bool)

(assert (=> start!54144 m!569545))

(declare-fun m!569547 () Bool)

(assert (=> start!54144 m!569547))

(declare-fun m!569549 () Bool)

(assert (=> b!591270 m!569549))

(declare-fun m!569551 () Bool)

(assert (=> b!591281 m!569551))

(declare-fun m!569553 () Bool)

(assert (=> b!591275 m!569553))

(assert (=> b!591275 m!569553))

(declare-fun m!569555 () Bool)

(assert (=> b!591275 m!569555))

(assert (=> b!591286 m!569553))

(declare-fun m!569557 () Bool)

(assert (=> b!591282 m!569557))

(declare-fun m!569559 () Bool)

(assert (=> b!591273 m!569559))

(declare-fun m!569561 () Bool)

(assert (=> b!591276 m!569561))

(assert (=> b!591278 m!569553))

(assert (=> b!591278 m!569553))

(declare-fun m!569563 () Bool)

(assert (=> b!591278 m!569563))

(assert (=> b!591272 m!569553))

(declare-fun m!569565 () Bool)

(assert (=> b!591272 m!569565))

(declare-fun m!569567 () Bool)

(assert (=> b!591272 m!569567))

(declare-fun m!569569 () Bool)

(assert (=> b!591280 m!569569))

(declare-fun m!569571 () Bool)

(assert (=> b!591280 m!569571))

(assert (=> b!591280 m!569553))

(declare-fun m!569573 () Bool)

(assert (=> b!591280 m!569573))

(declare-fun m!569575 () Bool)

(assert (=> b!591280 m!569575))

(assert (=> b!591280 m!569553))

(declare-fun m!569577 () Bool)

(assert (=> b!591280 m!569577))

(declare-fun m!569579 () Bool)

(assert (=> b!591280 m!569579))

(assert (=> b!591280 m!569565))

(assert (=> b!591279 m!569565))

(declare-fun m!569581 () Bool)

(assert (=> b!591279 m!569581))

(assert (=> b!591285 m!569553))

(assert (=> b!591285 m!569553))

(declare-fun m!569583 () Bool)

(assert (=> b!591285 m!569583))

(declare-fun m!569585 () Bool)

(assert (=> b!591284 m!569585))

(assert (=> b!591284 m!569553))

(assert (=> b!591284 m!569553))

(declare-fun m!569587 () Bool)

(assert (=> b!591284 m!569587))

(check-sat (not b!591274) (not b!591270) (not b!591285) (not b!591280) (not start!54144) (not b!591282) (not b!591273) (not b!591278) (not b!591281) (not b!591284) (not b!591275))
(check-sat)
