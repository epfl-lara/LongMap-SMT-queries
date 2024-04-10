; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55118 () Bool)

(assert start!55118)

(declare-fun b!603271 () Bool)

(declare-fun res!387403 () Bool)

(declare-fun e!345101 () Bool)

(assert (=> b!603271 (=> (not res!387403) (not e!345101))))

(declare-datatypes ((array!37191 0))(
  ( (array!37192 (arr!17852 (Array (_ BitVec 32) (_ BitVec 64))) (size!18216 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37191)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37191 (_ BitVec 32)) Bool)

(assert (=> b!603271 (= res!387403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603272 () Bool)

(declare-datatypes ((Unit!19132 0))(
  ( (Unit!19133) )
))
(declare-fun e!345092 () Unit!19132)

(declare-fun Unit!19134 () Unit!19132)

(assert (=> b!603272 (= e!345092 Unit!19134)))

(declare-fun b!603273 () Bool)

(declare-fun res!387399 () Bool)

(declare-fun e!345099 () Bool)

(assert (=> b!603273 (=> (not res!387399) (not e!345099))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603273 (= res!387399 (validKeyInArray!0 k!1786))))

(declare-fun res!387413 () Bool)

(assert (=> start!55118 (=> (not res!387413) (not e!345099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55118 (= res!387413 (validMask!0 mask!3053))))

(assert (=> start!55118 e!345099))

(assert (=> start!55118 true))

(declare-fun array_inv!13648 (array!37191) Bool)

(assert (=> start!55118 (array_inv!13648 a!2986)))

(declare-fun b!603274 () Bool)

(declare-fun e!345100 () Bool)

(assert (=> b!603274 (= e!345100 true)))

(declare-fun e!345105 () Bool)

(assert (=> b!603274 e!345105))

(declare-fun res!387395 () Bool)

(assert (=> b!603274 (=> (not res!387395) (not e!345105))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!274885 () array!37191)

(declare-fun arrayContainsKey!0 (array!37191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603274 (= res!387395 (arrayContainsKey!0 lt!274885 (select (arr!17852 a!2986) j!136) j!136))))

(declare-fun b!603275 () Bool)

(declare-fun res!387409 () Bool)

(assert (=> b!603275 (=> (not res!387409) (not e!345101))))

(declare-datatypes ((List!11893 0))(
  ( (Nil!11890) (Cons!11889 (h!12934 (_ BitVec 64)) (t!18121 List!11893)) )
))
(declare-fun arrayNoDuplicates!0 (array!37191 (_ BitVec 32) List!11893) Bool)

(assert (=> b!603275 (= res!387409 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11890))))

(declare-fun b!603276 () Bool)

(declare-fun Unit!19135 () Unit!19132)

(assert (=> b!603276 (= e!345092 Unit!19135)))

(declare-fun lt!274883 () Unit!19132)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37191 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19132)

(assert (=> b!603276 (= lt!274883 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274885 (select (arr!17852 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603276 (arrayContainsKey!0 lt!274885 (select (arr!17852 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!274884 () Unit!19132)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37191 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11893) Unit!19132)

(assert (=> b!603276 (= lt!274884 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11890))))

(assert (=> b!603276 (arrayNoDuplicates!0 lt!274885 #b00000000000000000000000000000000 Nil!11890)))

(declare-fun lt!274888 () Unit!19132)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37191 (_ BitVec 32) (_ BitVec 32)) Unit!19132)

(assert (=> b!603276 (= lt!274888 (lemmaNoDuplicateFromThenFromBigger!0 lt!274885 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603276 (arrayNoDuplicates!0 lt!274885 j!136 Nil!11890)))

(declare-fun lt!274886 () Unit!19132)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37191 (_ BitVec 64) (_ BitVec 32) List!11893) Unit!19132)

(assert (=> b!603276 (= lt!274886 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274885 (select (arr!17852 a!2986) j!136) j!136 Nil!11890))))

(assert (=> b!603276 false))

(declare-fun b!603277 () Bool)

(declare-fun e!345096 () Bool)

(assert (=> b!603277 (= e!345101 e!345096)))

(declare-fun res!387401 () Bool)

(assert (=> b!603277 (=> (not res!387401) (not e!345096))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!603277 (= res!387401 (= (select (store (arr!17852 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603277 (= lt!274885 (array!37192 (store (arr!17852 a!2986) i!1108 k!1786) (size!18216 a!2986)))))

(declare-fun b!603278 () Bool)

(declare-fun e!345102 () Bool)

(declare-fun e!345093 () Bool)

(assert (=> b!603278 (= e!345102 (not e!345093))))

(declare-fun res!387404 () Bool)

(assert (=> b!603278 (=> res!387404 e!345093)))

(declare-datatypes ((SeekEntryResult!6292 0))(
  ( (MissingZero!6292 (index!27431 (_ BitVec 32))) (Found!6292 (index!27432 (_ BitVec 32))) (Intermediate!6292 (undefined!7104 Bool) (index!27433 (_ BitVec 32)) (x!56229 (_ BitVec 32))) (Undefined!6292) (MissingVacant!6292 (index!27434 (_ BitVec 32))) )
))
(declare-fun lt!274893 () SeekEntryResult!6292)

(assert (=> b!603278 (= res!387404 (not (= lt!274893 (Found!6292 index!984))))))

(declare-fun lt!274895 () Unit!19132)

(declare-fun e!345091 () Unit!19132)

(assert (=> b!603278 (= lt!274895 e!345091)))

(declare-fun c!68306 () Bool)

(assert (=> b!603278 (= c!68306 (= lt!274893 Undefined!6292))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!274896 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37191 (_ BitVec 32)) SeekEntryResult!6292)

(assert (=> b!603278 (= lt!274893 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274896 lt!274885 mask!3053))))

(declare-fun e!345098 () Bool)

(assert (=> b!603278 e!345098))

(declare-fun res!387402 () Bool)

(assert (=> b!603278 (=> (not res!387402) (not e!345098))))

(declare-fun lt!274887 () SeekEntryResult!6292)

(declare-fun lt!274891 () (_ BitVec 32))

(assert (=> b!603278 (= res!387402 (= lt!274887 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274891 vacantSpotIndex!68 lt!274896 lt!274885 mask!3053)))))

(assert (=> b!603278 (= lt!274887 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274891 vacantSpotIndex!68 (select (arr!17852 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603278 (= lt!274896 (select (store (arr!17852 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!274890 () Unit!19132)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37191 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19132)

(assert (=> b!603278 (= lt!274890 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274891 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603278 (= lt!274891 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!603279 () Bool)

(declare-fun Unit!19136 () Unit!19132)

(assert (=> b!603279 (= e!345091 Unit!19136)))

(assert (=> b!603279 false))

(declare-fun b!603280 () Bool)

(declare-fun res!387406 () Bool)

(assert (=> b!603280 (=> (not res!387406) (not e!345099))))

(assert (=> b!603280 (= res!387406 (and (= (size!18216 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18216 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18216 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603281 () Bool)

(declare-fun e!345103 () Bool)

(assert (=> b!603281 (= e!345093 e!345103)))

(declare-fun res!387412 () Bool)

(assert (=> b!603281 (=> res!387412 e!345103)))

(declare-fun lt!274894 () (_ BitVec 64))

(assert (=> b!603281 (= res!387412 (or (not (= (select (arr!17852 a!2986) j!136) lt!274896)) (not (= (select (arr!17852 a!2986) j!136) lt!274894))))))

(declare-fun e!345094 () Bool)

(assert (=> b!603281 e!345094))

(declare-fun res!387405 () Bool)

(assert (=> b!603281 (=> (not res!387405) (not e!345094))))

(assert (=> b!603281 (= res!387405 (= lt!274894 (select (arr!17852 a!2986) j!136)))))

(assert (=> b!603281 (= lt!274894 (select (store (arr!17852 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!603282 () Bool)

(declare-fun Unit!19137 () Unit!19132)

(assert (=> b!603282 (= e!345091 Unit!19137)))

(declare-fun b!603283 () Bool)

(assert (=> b!603283 (= e!345099 e!345101)))

(declare-fun res!387408 () Bool)

(assert (=> b!603283 (=> (not res!387408) (not e!345101))))

(declare-fun lt!274889 () SeekEntryResult!6292)

(assert (=> b!603283 (= res!387408 (or (= lt!274889 (MissingZero!6292 i!1108)) (= lt!274889 (MissingVacant!6292 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37191 (_ BitVec 32)) SeekEntryResult!6292)

(assert (=> b!603283 (= lt!274889 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!603284 () Bool)

(assert (=> b!603284 (= e!345103 e!345100)))

(declare-fun res!387410 () Bool)

(assert (=> b!603284 (=> res!387410 e!345100)))

(assert (=> b!603284 (= res!387410 (bvsge index!984 j!136))))

(declare-fun lt!274892 () Unit!19132)

(assert (=> b!603284 (= lt!274892 e!345092)))

(declare-fun c!68305 () Bool)

(assert (=> b!603284 (= c!68305 (bvslt j!136 index!984))))

(declare-fun b!603285 () Bool)

(declare-fun res!387397 () Bool)

(assert (=> b!603285 (=> (not res!387397) (not e!345101))))

(assert (=> b!603285 (= res!387397 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17852 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603286 () Bool)

(declare-fun e!345104 () Bool)

(assert (=> b!603286 (= e!345104 (arrayContainsKey!0 lt!274885 (select (arr!17852 a!2986) j!136) index!984))))

(declare-fun b!603287 () Bool)

(assert (=> b!603287 (= e!345096 e!345102)))

(declare-fun res!387398 () Bool)

(assert (=> b!603287 (=> (not res!387398) (not e!345102))))

(declare-fun lt!274897 () SeekEntryResult!6292)

(assert (=> b!603287 (= res!387398 (and (= lt!274897 (Found!6292 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17852 a!2986) index!984) (select (arr!17852 a!2986) j!136))) (not (= (select (arr!17852 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!603287 (= lt!274897 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17852 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603288 () Bool)

(declare-fun e!345095 () Bool)

(assert (=> b!603288 (= e!345095 e!345104)))

(declare-fun res!387400 () Bool)

(assert (=> b!603288 (=> (not res!387400) (not e!345104))))

(assert (=> b!603288 (= res!387400 (arrayContainsKey!0 lt!274885 (select (arr!17852 a!2986) j!136) j!136))))

(declare-fun b!603289 () Bool)

(declare-fun res!387396 () Bool)

(assert (=> b!603289 (=> (not res!387396) (not e!345099))))

(assert (=> b!603289 (= res!387396 (validKeyInArray!0 (select (arr!17852 a!2986) j!136)))))

(declare-fun b!603290 () Bool)

(declare-fun res!387411 () Bool)

(assert (=> b!603290 (=> (not res!387411) (not e!345099))))

(assert (=> b!603290 (= res!387411 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603291 () Bool)

(assert (=> b!603291 (= e!345105 (arrayContainsKey!0 lt!274885 (select (arr!17852 a!2986) j!136) index!984))))

(declare-fun b!603292 () Bool)

(assert (=> b!603292 (= e!345098 (= lt!274897 lt!274887))))

(declare-fun b!603293 () Bool)

(assert (=> b!603293 (= e!345094 e!345095)))

(declare-fun res!387407 () Bool)

(assert (=> b!603293 (=> res!387407 e!345095)))

(assert (=> b!603293 (= res!387407 (or (not (= (select (arr!17852 a!2986) j!136) lt!274896)) (not (= (select (arr!17852 a!2986) j!136) lt!274894)) (bvsge j!136 index!984)))))

(assert (= (and start!55118 res!387413) b!603280))

(assert (= (and b!603280 res!387406) b!603289))

(assert (= (and b!603289 res!387396) b!603273))

(assert (= (and b!603273 res!387399) b!603290))

(assert (= (and b!603290 res!387411) b!603283))

(assert (= (and b!603283 res!387408) b!603271))

(assert (= (and b!603271 res!387403) b!603275))

(assert (= (and b!603275 res!387409) b!603285))

(assert (= (and b!603285 res!387397) b!603277))

(assert (= (and b!603277 res!387401) b!603287))

(assert (= (and b!603287 res!387398) b!603278))

(assert (= (and b!603278 res!387402) b!603292))

(assert (= (and b!603278 c!68306) b!603279))

(assert (= (and b!603278 (not c!68306)) b!603282))

(assert (= (and b!603278 (not res!387404)) b!603281))

(assert (= (and b!603281 res!387405) b!603293))

(assert (= (and b!603293 (not res!387407)) b!603288))

(assert (= (and b!603288 res!387400) b!603286))

(assert (= (and b!603281 (not res!387412)) b!603284))

(assert (= (and b!603284 c!68305) b!603276))

(assert (= (and b!603284 (not c!68305)) b!603272))

(assert (= (and b!603284 (not res!387410)) b!603274))

(assert (= (and b!603274 res!387395) b!603291))

(declare-fun m!580313 () Bool)

(assert (=> b!603278 m!580313))

(declare-fun m!580315 () Bool)

(assert (=> b!603278 m!580315))

(declare-fun m!580317 () Bool)

(assert (=> b!603278 m!580317))

(declare-fun m!580319 () Bool)

(assert (=> b!603278 m!580319))

(declare-fun m!580321 () Bool)

(assert (=> b!603278 m!580321))

(assert (=> b!603278 m!580317))

(declare-fun m!580323 () Bool)

(assert (=> b!603278 m!580323))

(declare-fun m!580325 () Bool)

(assert (=> b!603278 m!580325))

(declare-fun m!580327 () Bool)

(assert (=> b!603278 m!580327))

(assert (=> b!603289 m!580317))

(assert (=> b!603289 m!580317))

(declare-fun m!580329 () Bool)

(assert (=> b!603289 m!580329))

(assert (=> b!603288 m!580317))

(assert (=> b!603288 m!580317))

(declare-fun m!580331 () Bool)

(assert (=> b!603288 m!580331))

(declare-fun m!580333 () Bool)

(assert (=> b!603275 m!580333))

(declare-fun m!580335 () Bool)

(assert (=> b!603287 m!580335))

(assert (=> b!603287 m!580317))

(assert (=> b!603287 m!580317))

(declare-fun m!580337 () Bool)

(assert (=> b!603287 m!580337))

(declare-fun m!580339 () Bool)

(assert (=> b!603271 m!580339))

(assert (=> b!603286 m!580317))

(assert (=> b!603286 m!580317))

(declare-fun m!580341 () Bool)

(assert (=> b!603286 m!580341))

(assert (=> b!603291 m!580317))

(assert (=> b!603291 m!580317))

(assert (=> b!603291 m!580341))

(declare-fun m!580343 () Bool)

(assert (=> b!603285 m!580343))

(assert (=> b!603277 m!580319))

(declare-fun m!580345 () Bool)

(assert (=> b!603277 m!580345))

(assert (=> b!603274 m!580317))

(assert (=> b!603274 m!580317))

(assert (=> b!603274 m!580331))

(declare-fun m!580347 () Bool)

(assert (=> b!603290 m!580347))

(declare-fun m!580349 () Bool)

(assert (=> start!55118 m!580349))

(declare-fun m!580351 () Bool)

(assert (=> start!55118 m!580351))

(assert (=> b!603293 m!580317))

(declare-fun m!580353 () Bool)

(assert (=> b!603283 m!580353))

(assert (=> b!603276 m!580317))

(declare-fun m!580355 () Bool)

(assert (=> b!603276 m!580355))

(assert (=> b!603276 m!580317))

(assert (=> b!603276 m!580317))

(declare-fun m!580357 () Bool)

(assert (=> b!603276 m!580357))

(assert (=> b!603276 m!580317))

(declare-fun m!580359 () Bool)

(assert (=> b!603276 m!580359))

(declare-fun m!580361 () Bool)

(assert (=> b!603276 m!580361))

(declare-fun m!580363 () Bool)

(assert (=> b!603276 m!580363))

(declare-fun m!580365 () Bool)

(assert (=> b!603276 m!580365))

(declare-fun m!580367 () Bool)

(assert (=> b!603276 m!580367))

(assert (=> b!603281 m!580317))

(assert (=> b!603281 m!580319))

(declare-fun m!580369 () Bool)

(assert (=> b!603281 m!580369))

(declare-fun m!580371 () Bool)

(assert (=> b!603273 m!580371))

(push 1)

(assert (not b!603287))

(assert (not b!603276))

(assert (not b!603289))

(assert (not b!603273))

(assert (not b!603275))

(assert (not b!603274))

(assert (not b!603291))

(assert (not b!603290))

(assert (not b!603283))

(assert (not b!603271))

(assert (not start!55118))

(assert (not b!603278))

(assert (not b!603288))

(assert (not b!603286))

(check-sat)

(pop 1)

(push 1)

(check-sat)

