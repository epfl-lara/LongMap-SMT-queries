; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57714 () Bool)

(assert start!57714)

(declare-fun b!638362 () Bool)

(declare-fun e!365274 () Bool)

(declare-fun e!365270 () Bool)

(assert (=> b!638362 (= e!365274 e!365270)))

(declare-fun res!413210 () Bool)

(assert (=> b!638362 (=> (not res!413210) (not e!365270))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38285 0))(
  ( (array!38286 (arr!18365 (Array (_ BitVec 32) (_ BitVec 64))) (size!18729 (_ BitVec 32))) )
))
(declare-fun lt!295211 () array!38285)

(declare-fun a!2986 () array!38285)

(declare-fun arrayContainsKey!0 (array!38285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638362 (= res!413210 (arrayContainsKey!0 lt!295211 (select (arr!18365 a!2986) j!136) j!136))))

(declare-fun b!638363 () Bool)

(declare-fun res!413196 () Bool)

(declare-fun e!365275 () Bool)

(assert (=> b!638363 (=> res!413196 e!365275)))

(declare-datatypes ((List!12406 0))(
  ( (Nil!12403) (Cons!12402 (h!13447 (_ BitVec 64)) (t!18634 List!12406)) )
))
(declare-fun contains!3120 (List!12406 (_ BitVec 64)) Bool)

(assert (=> b!638363 (= res!413196 (contains!3120 Nil!12403 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!638364 () Bool)

(declare-fun e!365273 () Bool)

(declare-fun e!365272 () Bool)

(assert (=> b!638364 (= e!365273 (not e!365272))))

(declare-fun res!413203 () Bool)

(assert (=> b!638364 (=> res!413203 e!365272)))

(declare-datatypes ((SeekEntryResult!6805 0))(
  ( (MissingZero!6805 (index!29534 (_ BitVec 32))) (Found!6805 (index!29535 (_ BitVec 32))) (Intermediate!6805 (undefined!7617 Bool) (index!29536 (_ BitVec 32)) (x!58287 (_ BitVec 32))) (Undefined!6805) (MissingVacant!6805 (index!29537 (_ BitVec 32))) )
))
(declare-fun lt!295213 () SeekEntryResult!6805)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!638364 (= res!413203 (not (= lt!295213 (Found!6805 index!984))))))

(declare-datatypes ((Unit!21554 0))(
  ( (Unit!21555) )
))
(declare-fun lt!295206 () Unit!21554)

(declare-fun e!365268 () Unit!21554)

(assert (=> b!638364 (= lt!295206 e!365268)))

(declare-fun c!72953 () Bool)

(assert (=> b!638364 (= c!72953 (= lt!295213 Undefined!6805))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!295215 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38285 (_ BitVec 32)) SeekEntryResult!6805)

(assert (=> b!638364 (= lt!295213 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295215 lt!295211 mask!3053))))

(declare-fun e!365279 () Bool)

(assert (=> b!638364 e!365279))

(declare-fun res!413193 () Bool)

(assert (=> b!638364 (=> (not res!413193) (not e!365279))))

(declare-fun lt!295209 () SeekEntryResult!6805)

(declare-fun lt!295207 () (_ BitVec 32))

(assert (=> b!638364 (= res!413193 (= lt!295209 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295207 vacantSpotIndex!68 lt!295215 lt!295211 mask!3053)))))

(assert (=> b!638364 (= lt!295209 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295207 vacantSpotIndex!68 (select (arr!18365 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!638364 (= lt!295215 (select (store (arr!18365 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!295212 () Unit!21554)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38285 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21554)

(assert (=> b!638364 (= lt!295212 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295207 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638364 (= lt!295207 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!638365 () Bool)

(declare-fun res!413201 () Bool)

(declare-fun e!365278 () Bool)

(assert (=> b!638365 (=> (not res!413201) (not e!365278))))

(assert (=> b!638365 (= res!413201 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!413190 () Bool)

(assert (=> start!57714 (=> (not res!413190) (not e!365278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57714 (= res!413190 (validMask!0 mask!3053))))

(assert (=> start!57714 e!365278))

(assert (=> start!57714 true))

(declare-fun array_inv!14161 (array!38285) Bool)

(assert (=> start!57714 (array_inv!14161 a!2986)))

(declare-fun b!638366 () Bool)

(declare-fun e!365277 () Bool)

(assert (=> b!638366 (= e!365277 e!365275)))

(declare-fun res!413198 () Bool)

(assert (=> b!638366 (=> res!413198 e!365275)))

(assert (=> b!638366 (= res!413198 (or (bvsge (size!18729 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18729 a!2986))))))

(assert (=> b!638366 (arrayContainsKey!0 lt!295211 (select (arr!18365 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295208 () Unit!21554)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38285 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21554)

(assert (=> b!638366 (= lt!295208 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295211 (select (arr!18365 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638367 () Bool)

(declare-fun e!365269 () Bool)

(assert (=> b!638367 (= e!365278 e!365269)))

(declare-fun res!413207 () Bool)

(assert (=> b!638367 (=> (not res!413207) (not e!365269))))

(declare-fun lt!295210 () SeekEntryResult!6805)

(assert (=> b!638367 (= res!413207 (or (= lt!295210 (MissingZero!6805 i!1108)) (= lt!295210 (MissingVacant!6805 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38285 (_ BitVec 32)) SeekEntryResult!6805)

(assert (=> b!638367 (= lt!295210 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!638368 () Bool)

(assert (=> b!638368 (= e!365272 e!365277)))

(declare-fun res!413208 () Bool)

(assert (=> b!638368 (=> res!413208 e!365277)))

(declare-fun lt!295205 () (_ BitVec 64))

(assert (=> b!638368 (= res!413208 (or (not (= (select (arr!18365 a!2986) j!136) lt!295215)) (not (= (select (arr!18365 a!2986) j!136) lt!295205)) (bvsge j!136 index!984)))))

(declare-fun e!365276 () Bool)

(assert (=> b!638368 e!365276))

(declare-fun res!413206 () Bool)

(assert (=> b!638368 (=> (not res!413206) (not e!365276))))

(assert (=> b!638368 (= res!413206 (= lt!295205 (select (arr!18365 a!2986) j!136)))))

(assert (=> b!638368 (= lt!295205 (select (store (arr!18365 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!638369 () Bool)

(declare-fun Unit!21556 () Unit!21554)

(assert (=> b!638369 (= e!365268 Unit!21556)))

(assert (=> b!638369 false))

(declare-fun b!638370 () Bool)

(declare-fun res!413194 () Bool)

(assert (=> b!638370 (=> res!413194 e!365275)))

(declare-fun noDuplicate!398 (List!12406) Bool)

(assert (=> b!638370 (= res!413194 (not (noDuplicate!398 Nil!12403)))))

(declare-fun b!638371 () Bool)

(declare-fun e!365271 () Bool)

(assert (=> b!638371 (= e!365271 e!365273)))

(declare-fun res!413205 () Bool)

(assert (=> b!638371 (=> (not res!413205) (not e!365273))))

(declare-fun lt!295214 () SeekEntryResult!6805)

(assert (=> b!638371 (= res!413205 (and (= lt!295214 (Found!6805 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18365 a!2986) index!984) (select (arr!18365 a!2986) j!136))) (not (= (select (arr!18365 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!638371 (= lt!295214 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18365 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638372 () Bool)

(declare-fun res!413197 () Bool)

(assert (=> b!638372 (=> (not res!413197) (not e!365278))))

(assert (=> b!638372 (= res!413197 (and (= (size!18729 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18729 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18729 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638373 () Bool)

(assert (=> b!638373 (= e!365275 true)))

(declare-fun lt!295216 () Bool)

(assert (=> b!638373 (= lt!295216 (contains!3120 Nil!12403 k!1786))))

(declare-fun b!638374 () Bool)

(assert (=> b!638374 (= e!365276 e!365274)))

(declare-fun res!413199 () Bool)

(assert (=> b!638374 (=> res!413199 e!365274)))

(assert (=> b!638374 (= res!413199 (or (not (= (select (arr!18365 a!2986) j!136) lt!295215)) (not (= (select (arr!18365 a!2986) j!136) lt!295205)) (bvsge j!136 index!984)))))

(declare-fun b!638375 () Bool)

(declare-fun res!413202 () Bool)

(assert (=> b!638375 (=> res!413202 e!365275)))

(assert (=> b!638375 (= res!413202 (contains!3120 Nil!12403 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!638376 () Bool)

(declare-fun Unit!21557 () Unit!21554)

(assert (=> b!638376 (= e!365268 Unit!21557)))

(declare-fun b!638377 () Bool)

(declare-fun res!413200 () Bool)

(assert (=> b!638377 (=> (not res!413200) (not e!365278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638377 (= res!413200 (validKeyInArray!0 k!1786))))

(declare-fun b!638378 () Bool)

(declare-fun res!413209 () Bool)

(assert (=> b!638378 (=> (not res!413209) (not e!365269))))

(declare-fun arrayNoDuplicates!0 (array!38285 (_ BitVec 32) List!12406) Bool)

(assert (=> b!638378 (= res!413209 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12403))))

(declare-fun b!638379 () Bool)

(declare-fun res!413192 () Bool)

(assert (=> b!638379 (=> (not res!413192) (not e!365269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38285 (_ BitVec 32)) Bool)

(assert (=> b!638379 (= res!413192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638380 () Bool)

(assert (=> b!638380 (= e!365279 (= lt!295214 lt!295209))))

(declare-fun b!638381 () Bool)

(assert (=> b!638381 (= e!365270 (arrayContainsKey!0 lt!295211 (select (arr!18365 a!2986) j!136) index!984))))

(declare-fun b!638382 () Bool)

(declare-fun res!413191 () Bool)

(assert (=> b!638382 (=> (not res!413191) (not e!365278))))

(assert (=> b!638382 (= res!413191 (validKeyInArray!0 (select (arr!18365 a!2986) j!136)))))

(declare-fun b!638383 () Bool)

(declare-fun res!413195 () Bool)

(assert (=> b!638383 (=> (not res!413195) (not e!365269))))

(assert (=> b!638383 (= res!413195 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18365 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638384 () Bool)

(assert (=> b!638384 (= e!365269 e!365271)))

(declare-fun res!413204 () Bool)

(assert (=> b!638384 (=> (not res!413204) (not e!365271))))

(assert (=> b!638384 (= res!413204 (= (select (store (arr!18365 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638384 (= lt!295211 (array!38286 (store (arr!18365 a!2986) i!1108 k!1786) (size!18729 a!2986)))))

(assert (= (and start!57714 res!413190) b!638372))

(assert (= (and b!638372 res!413197) b!638382))

(assert (= (and b!638382 res!413191) b!638377))

(assert (= (and b!638377 res!413200) b!638365))

(assert (= (and b!638365 res!413201) b!638367))

(assert (= (and b!638367 res!413207) b!638379))

(assert (= (and b!638379 res!413192) b!638378))

(assert (= (and b!638378 res!413209) b!638383))

(assert (= (and b!638383 res!413195) b!638384))

(assert (= (and b!638384 res!413204) b!638371))

(assert (= (and b!638371 res!413205) b!638364))

(assert (= (and b!638364 res!413193) b!638380))

(assert (= (and b!638364 c!72953) b!638369))

(assert (= (and b!638364 (not c!72953)) b!638376))

(assert (= (and b!638364 (not res!413203)) b!638368))

(assert (= (and b!638368 res!413206) b!638374))

(assert (= (and b!638374 (not res!413199)) b!638362))

(assert (= (and b!638362 res!413210) b!638381))

(assert (= (and b!638368 (not res!413208)) b!638366))

(assert (= (and b!638366 (not res!413198)) b!638370))

(assert (= (and b!638370 (not res!413194)) b!638375))

(assert (= (and b!638375 (not res!413202)) b!638363))

(assert (= (and b!638363 (not res!413196)) b!638373))

(declare-fun m!612295 () Bool)

(assert (=> b!638365 m!612295))

(declare-fun m!612297 () Bool)

(assert (=> b!638375 m!612297))

(declare-fun m!612299 () Bool)

(assert (=> b!638381 m!612299))

(assert (=> b!638381 m!612299))

(declare-fun m!612301 () Bool)

(assert (=> b!638381 m!612301))

(assert (=> b!638366 m!612299))

(assert (=> b!638366 m!612299))

(declare-fun m!612303 () Bool)

(assert (=> b!638366 m!612303))

(assert (=> b!638366 m!612299))

(declare-fun m!612305 () Bool)

(assert (=> b!638366 m!612305))

(declare-fun m!612307 () Bool)

(assert (=> start!57714 m!612307))

(declare-fun m!612309 () Bool)

(assert (=> start!57714 m!612309))

(declare-fun m!612311 () Bool)

(assert (=> b!638363 m!612311))

(assert (=> b!638382 m!612299))

(assert (=> b!638382 m!612299))

(declare-fun m!612313 () Bool)

(assert (=> b!638382 m!612313))

(declare-fun m!612315 () Bool)

(assert (=> b!638377 m!612315))

(declare-fun m!612317 () Bool)

(assert (=> b!638383 m!612317))

(declare-fun m!612319 () Bool)

(assert (=> b!638367 m!612319))

(assert (=> b!638368 m!612299))

(declare-fun m!612321 () Bool)

(assert (=> b!638368 m!612321))

(declare-fun m!612323 () Bool)

(assert (=> b!638368 m!612323))

(declare-fun m!612325 () Bool)

(assert (=> b!638370 m!612325))

(assert (=> b!638384 m!612321))

(declare-fun m!612327 () Bool)

(assert (=> b!638384 m!612327))

(assert (=> b!638362 m!612299))

(assert (=> b!638362 m!612299))

(declare-fun m!612329 () Bool)

(assert (=> b!638362 m!612329))

(assert (=> b!638374 m!612299))

(declare-fun m!612331 () Bool)

(assert (=> b!638378 m!612331))

(declare-fun m!612333 () Bool)

(assert (=> b!638379 m!612333))

(declare-fun m!612335 () Bool)

(assert (=> b!638373 m!612335))

(declare-fun m!612337 () Bool)

(assert (=> b!638371 m!612337))

(assert (=> b!638371 m!612299))

(assert (=> b!638371 m!612299))

(declare-fun m!612339 () Bool)

(assert (=> b!638371 m!612339))

(declare-fun m!612341 () Bool)

(assert (=> b!638364 m!612341))

(declare-fun m!612343 () Bool)

(assert (=> b!638364 m!612343))

(assert (=> b!638364 m!612299))

(assert (=> b!638364 m!612321))

(declare-fun m!612345 () Bool)

(assert (=> b!638364 m!612345))

(assert (=> b!638364 m!612299))

(declare-fun m!612347 () Bool)

(assert (=> b!638364 m!612347))

(declare-fun m!612349 () Bool)

(assert (=> b!638364 m!612349))

(declare-fun m!612351 () Bool)

(assert (=> b!638364 m!612351))

(push 1)

