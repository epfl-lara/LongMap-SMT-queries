; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57018 () Bool)

(assert start!57018)

(declare-fun b!631327 () Bool)

(declare-fun e!360958 () Bool)

(assert (=> b!631327 (= e!360958 (not true))))

(declare-datatypes ((Unit!21218 0))(
  ( (Unit!21219) )
))
(declare-fun lt!291675 () Unit!21218)

(declare-fun e!360954 () Unit!21218)

(assert (=> b!631327 (= lt!291675 e!360954)))

(declare-fun c!71912 () Bool)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38094 0))(
  ( (array!38095 (arr!18281 (Array (_ BitVec 32) (_ BitVec 64))) (size!18645 (_ BitVec 32))) )
))
(declare-fun lt!291676 () array!38094)

(declare-fun lt!291677 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!6721 0))(
  ( (MissingZero!6721 (index!29174 (_ BitVec 32))) (Found!6721 (index!29175 (_ BitVec 32))) (Intermediate!6721 (undefined!7533 Bool) (index!29176 (_ BitVec 32)) (x!57907 (_ BitVec 32))) (Undefined!6721) (MissingVacant!6721 (index!29177 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38094 (_ BitVec 32)) SeekEntryResult!6721)

(assert (=> b!631327 (= c!71912 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291677 lt!291676 mask!3053) Undefined!6721))))

(declare-fun e!360955 () Bool)

(assert (=> b!631327 e!360955))

(declare-fun res!408239 () Bool)

(assert (=> b!631327 (=> (not res!408239) (not e!360955))))

(declare-fun lt!291678 () SeekEntryResult!6721)

(declare-fun lt!291672 () (_ BitVec 32))

(assert (=> b!631327 (= res!408239 (= lt!291678 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291672 vacantSpotIndex!68 lt!291677 lt!291676 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38094)

(assert (=> b!631327 (= lt!291678 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291672 vacantSpotIndex!68 (select (arr!18281 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!631327 (= lt!291677 (select (store (arr!18281 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!291674 () Unit!21218)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38094 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21218)

(assert (=> b!631327 (= lt!291674 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291672 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631327 (= lt!291672 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!631328 () Bool)

(declare-fun res!408241 () Bool)

(declare-fun e!360960 () Bool)

(assert (=> b!631328 (=> (not res!408241) (not e!360960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631328 (= res!408241 (validKeyInArray!0 k!1786))))

(declare-fun res!408248 () Bool)

(assert (=> start!57018 (=> (not res!408248) (not e!360960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57018 (= res!408248 (validMask!0 mask!3053))))

(assert (=> start!57018 e!360960))

(assert (=> start!57018 true))

(declare-fun array_inv!14077 (array!38094) Bool)

(assert (=> start!57018 (array_inv!14077 a!2986)))

(declare-fun b!631329 () Bool)

(declare-fun res!408237 () Bool)

(declare-fun e!360956 () Bool)

(assert (=> b!631329 (=> (not res!408237) (not e!360956))))

(declare-datatypes ((List!12322 0))(
  ( (Nil!12319) (Cons!12318 (h!13363 (_ BitVec 64)) (t!18550 List!12322)) )
))
(declare-fun arrayNoDuplicates!0 (array!38094 (_ BitVec 32) List!12322) Bool)

(assert (=> b!631329 (= res!408237 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12319))))

(declare-fun b!631330 () Bool)

(declare-fun res!408244 () Bool)

(assert (=> b!631330 (=> (not res!408244) (not e!360956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38094 (_ BitVec 32)) Bool)

(assert (=> b!631330 (= res!408244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631331 () Bool)

(declare-fun e!360957 () Bool)

(assert (=> b!631331 (= e!360957 e!360958)))

(declare-fun res!408238 () Bool)

(assert (=> b!631331 (=> (not res!408238) (not e!360958))))

(declare-fun lt!291673 () SeekEntryResult!6721)

(assert (=> b!631331 (= res!408238 (and (= lt!291673 (Found!6721 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18281 a!2986) index!984) (select (arr!18281 a!2986) j!136))) (not (= (select (arr!18281 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!631331 (= lt!291673 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18281 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631332 () Bool)

(declare-fun Unit!21220 () Unit!21218)

(assert (=> b!631332 (= e!360954 Unit!21220)))

(assert (=> b!631332 false))

(declare-fun b!631333 () Bool)

(declare-fun res!408246 () Bool)

(assert (=> b!631333 (=> (not res!408246) (not e!360960))))

(assert (=> b!631333 (= res!408246 (and (= (size!18645 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18645 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18645 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631334 () Bool)

(declare-fun res!408243 () Bool)

(assert (=> b!631334 (=> (not res!408243) (not e!360960))))

(declare-fun arrayContainsKey!0 (array!38094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631334 (= res!408243 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631335 () Bool)

(assert (=> b!631335 (= e!360956 e!360957)))

(declare-fun res!408245 () Bool)

(assert (=> b!631335 (=> (not res!408245) (not e!360957))))

(assert (=> b!631335 (= res!408245 (= (select (store (arr!18281 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631335 (= lt!291676 (array!38095 (store (arr!18281 a!2986) i!1108 k!1786) (size!18645 a!2986)))))

(declare-fun b!631336 () Bool)

(assert (=> b!631336 (= e!360960 e!360956)))

(declare-fun res!408247 () Bool)

(assert (=> b!631336 (=> (not res!408247) (not e!360956))))

(declare-fun lt!291679 () SeekEntryResult!6721)

(assert (=> b!631336 (= res!408247 (or (= lt!291679 (MissingZero!6721 i!1108)) (= lt!291679 (MissingVacant!6721 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38094 (_ BitVec 32)) SeekEntryResult!6721)

(assert (=> b!631336 (= lt!291679 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!631337 () Bool)

(declare-fun res!408242 () Bool)

(assert (=> b!631337 (=> (not res!408242) (not e!360956))))

(assert (=> b!631337 (= res!408242 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18281 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631338 () Bool)

(declare-fun Unit!21221 () Unit!21218)

(assert (=> b!631338 (= e!360954 Unit!21221)))

(declare-fun b!631339 () Bool)

(assert (=> b!631339 (= e!360955 (= lt!291673 lt!291678))))

(declare-fun b!631340 () Bool)

(declare-fun res!408240 () Bool)

(assert (=> b!631340 (=> (not res!408240) (not e!360960))))

(assert (=> b!631340 (= res!408240 (validKeyInArray!0 (select (arr!18281 a!2986) j!136)))))

(assert (= (and start!57018 res!408248) b!631333))

(assert (= (and b!631333 res!408246) b!631340))

(assert (= (and b!631340 res!408240) b!631328))

(assert (= (and b!631328 res!408241) b!631334))

(assert (= (and b!631334 res!408243) b!631336))

(assert (= (and b!631336 res!408247) b!631330))

(assert (= (and b!631330 res!408244) b!631329))

(assert (= (and b!631329 res!408237) b!631337))

(assert (= (and b!631337 res!408242) b!631335))

(assert (= (and b!631335 res!408245) b!631331))

(assert (= (and b!631331 res!408238) b!631327))

(assert (= (and b!631327 res!408239) b!631339))

(assert (= (and b!631327 c!71912) b!631332))

(assert (= (and b!631327 (not c!71912)) b!631338))

(declare-fun m!606263 () Bool)

(assert (=> b!631337 m!606263))

(declare-fun m!606265 () Bool)

(assert (=> b!631340 m!606265))

(assert (=> b!631340 m!606265))

(declare-fun m!606267 () Bool)

(assert (=> b!631340 m!606267))

(declare-fun m!606269 () Bool)

(assert (=> b!631328 m!606269))

(declare-fun m!606271 () Bool)

(assert (=> b!631329 m!606271))

(declare-fun m!606273 () Bool)

(assert (=> b!631330 m!606273))

(declare-fun m!606275 () Bool)

(assert (=> b!631334 m!606275))

(declare-fun m!606277 () Bool)

(assert (=> b!631336 m!606277))

(declare-fun m!606279 () Bool)

(assert (=> b!631327 m!606279))

(declare-fun m!606281 () Bool)

(assert (=> b!631327 m!606281))

(declare-fun m!606283 () Bool)

(assert (=> b!631327 m!606283))

(assert (=> b!631327 m!606265))

(declare-fun m!606285 () Bool)

(assert (=> b!631327 m!606285))

(declare-fun m!606287 () Bool)

(assert (=> b!631327 m!606287))

(declare-fun m!606289 () Bool)

(assert (=> b!631327 m!606289))

(assert (=> b!631327 m!606265))

(declare-fun m!606291 () Bool)

(assert (=> b!631327 m!606291))

(declare-fun m!606293 () Bool)

(assert (=> b!631331 m!606293))

(assert (=> b!631331 m!606265))

(assert (=> b!631331 m!606265))

(declare-fun m!606295 () Bool)

(assert (=> b!631331 m!606295))

(assert (=> b!631335 m!606287))

(declare-fun m!606297 () Bool)

(assert (=> b!631335 m!606297))

(declare-fun m!606299 () Bool)

(assert (=> start!57018 m!606299))

(declare-fun m!606301 () Bool)

(assert (=> start!57018 m!606301))

(push 1)

(assert (not start!57018))

