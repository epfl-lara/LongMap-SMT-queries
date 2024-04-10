; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56054 () Bool)

(assert start!56054)

(declare-fun b!617348 () Bool)

(declare-datatypes ((Unit!20208 0))(
  ( (Unit!20209) )
))
(declare-fun e!354011 () Unit!20208)

(declare-fun Unit!20210 () Unit!20208)

(assert (=> b!617348 (= e!354011 Unit!20210)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun res!397712 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37524 0))(
  ( (array!37525 (arr!18008 (Array (_ BitVec 32) (_ BitVec 64))) (size!18372 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37524)

(assert (=> b!617348 (= res!397712 (= (select (store (arr!18008 a!2986) i!1108 k!1786) index!984) (select (arr!18008 a!2986) j!136)))))

(declare-fun e!354008 () Bool)

(assert (=> b!617348 (=> (not res!397712) (not e!354008))))

(assert (=> b!617348 e!354008))

(declare-fun c!70190 () Bool)

(assert (=> b!617348 (= c!70190 (bvslt j!136 index!984))))

(declare-fun lt!284252 () Unit!20208)

(declare-fun e!354010 () Unit!20208)

(assert (=> b!617348 (= lt!284252 e!354010)))

(declare-fun c!70191 () Bool)

(assert (=> b!617348 (= c!70191 (bvslt index!984 j!136))))

(declare-fun lt!284250 () Unit!20208)

(declare-fun e!354012 () Unit!20208)

(assert (=> b!617348 (= lt!284250 e!354012)))

(assert (=> b!617348 false))

(declare-fun b!617349 () Bool)

(declare-fun res!397702 () Bool)

(declare-fun e!354006 () Bool)

(assert (=> b!617349 (=> (not res!397702) (not e!354006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617349 (= res!397702 (validKeyInArray!0 k!1786))))

(declare-fun b!617350 () Bool)

(declare-fun lt!284242 () array!37524)

(declare-fun res!397703 () Bool)

(declare-fun arrayContainsKey!0 (array!37524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617350 (= res!397703 (arrayContainsKey!0 lt!284242 (select (arr!18008 a!2986) j!136) j!136))))

(declare-fun e!354001 () Bool)

(assert (=> b!617350 (=> (not res!397703) (not e!354001))))

(declare-fun e!354007 () Bool)

(assert (=> b!617350 (= e!354007 e!354001)))

(declare-fun b!617351 () Bool)

(declare-fun e!353999 () Bool)

(assert (=> b!617351 (= e!354006 e!353999)))

(declare-fun res!397707 () Bool)

(assert (=> b!617351 (=> (not res!397707) (not e!353999))))

(declare-datatypes ((SeekEntryResult!6448 0))(
  ( (MissingZero!6448 (index!28076 (_ BitVec 32))) (Found!6448 (index!28077 (_ BitVec 32))) (Intermediate!6448 (undefined!7260 Bool) (index!28078 (_ BitVec 32)) (x!56864 (_ BitVec 32))) (Undefined!6448) (MissingVacant!6448 (index!28079 (_ BitVec 32))) )
))
(declare-fun lt!284245 () SeekEntryResult!6448)

(assert (=> b!617351 (= res!397707 (or (= lt!284245 (MissingZero!6448 i!1108)) (= lt!284245 (MissingVacant!6448 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37524 (_ BitVec 32)) SeekEntryResult!6448)

(assert (=> b!617351 (= lt!284245 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!617352 () Bool)

(declare-fun res!397711 () Bool)

(assert (=> b!617352 (=> (not res!397711) (not e!353999))))

(declare-datatypes ((List!12049 0))(
  ( (Nil!12046) (Cons!12045 (h!13090 (_ BitVec 64)) (t!18277 List!12049)) )
))
(declare-fun arrayNoDuplicates!0 (array!37524 (_ BitVec 32) List!12049) Bool)

(assert (=> b!617352 (= res!397711 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12046))))

(declare-fun b!617353 () Bool)

(declare-fun e!353998 () Bool)

(assert (=> b!617353 (= e!353998 (arrayContainsKey!0 lt!284242 (select (arr!18008 a!2986) j!136) index!984))))

(declare-fun b!617354 () Bool)

(declare-fun Unit!20211 () Unit!20208)

(assert (=> b!617354 (= e!354010 Unit!20211)))

(declare-fun b!617356 () Bool)

(declare-fun Unit!20212 () Unit!20208)

(assert (=> b!617356 (= e!354012 Unit!20212)))

(declare-fun b!617357 () Bool)

(declare-fun res!397709 () Bool)

(assert (=> b!617357 (=> (not res!397709) (not e!354006))))

(assert (=> b!617357 (= res!397709 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617358 () Bool)

(declare-fun e!354004 () Bool)

(assert (=> b!617358 (= e!353999 e!354004)))

(declare-fun res!397716 () Bool)

(assert (=> b!617358 (=> (not res!397716) (not e!354004))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!617358 (= res!397716 (= (select (store (arr!18008 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!617358 (= lt!284242 (array!37525 (store (arr!18008 a!2986) i!1108 k!1786) (size!18372 a!2986)))))

(declare-fun b!617359 () Bool)

(declare-fun res!397704 () Bool)

(assert (=> b!617359 (=> (not res!397704) (not e!354006))))

(assert (=> b!617359 (= res!397704 (validKeyInArray!0 (select (arr!18008 a!2986) j!136)))))

(declare-fun b!617360 () Bool)

(declare-fun res!397706 () Bool)

(assert (=> b!617360 (=> (not res!397706) (not e!353999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37524 (_ BitVec 32)) Bool)

(assert (=> b!617360 (= res!397706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617361 () Bool)

(assert (=> b!617361 (= e!354001 (arrayContainsKey!0 lt!284242 (select (arr!18008 a!2986) j!136) index!984))))

(declare-fun b!617355 () Bool)

(declare-fun Unit!20213 () Unit!20208)

(assert (=> b!617355 (= e!354011 Unit!20213)))

(declare-fun res!397708 () Bool)

(assert (=> start!56054 (=> (not res!397708) (not e!354006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56054 (= res!397708 (validMask!0 mask!3053))))

(assert (=> start!56054 e!354006))

(assert (=> start!56054 true))

(declare-fun array_inv!13804 (array!37524) Bool)

(assert (=> start!56054 (array_inv!13804 a!2986)))

(declare-fun b!617362 () Bool)

(assert (=> b!617362 false))

(declare-fun lt!284238 () Unit!20208)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37524 (_ BitVec 64) (_ BitVec 32) List!12049) Unit!20208)

(assert (=> b!617362 (= lt!284238 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284242 (select (arr!18008 a!2986) j!136) j!136 Nil!12046))))

(assert (=> b!617362 (arrayNoDuplicates!0 lt!284242 j!136 Nil!12046)))

(declare-fun lt!284240 () Unit!20208)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37524 (_ BitVec 32) (_ BitVec 32)) Unit!20208)

(assert (=> b!617362 (= lt!284240 (lemmaNoDuplicateFromThenFromBigger!0 lt!284242 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617362 (arrayNoDuplicates!0 lt!284242 #b00000000000000000000000000000000 Nil!12046)))

(declare-fun lt!284255 () Unit!20208)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37524 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12049) Unit!20208)

(assert (=> b!617362 (= lt!284255 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12046))))

(assert (=> b!617362 (arrayContainsKey!0 lt!284242 (select (arr!18008 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284248 () Unit!20208)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37524 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20208)

(assert (=> b!617362 (= lt!284248 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284242 (select (arr!18008 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20214 () Unit!20208)

(assert (=> b!617362 (= e!354010 Unit!20214)))

(declare-fun b!617363 () Bool)

(declare-fun e!354009 () Bool)

(assert (=> b!617363 (= e!354004 e!354009)))

(declare-fun res!397710 () Bool)

(assert (=> b!617363 (=> (not res!397710) (not e!354009))))

(declare-fun lt!284257 () SeekEntryResult!6448)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!617363 (= res!397710 (and (= lt!284257 (Found!6448 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18008 a!2986) index!984) (select (arr!18008 a!2986) j!136))) (not (= (select (arr!18008 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37524 (_ BitVec 32)) SeekEntryResult!6448)

(assert (=> b!617363 (= lt!284257 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18008 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617364 () Bool)

(declare-fun e!354005 () Bool)

(assert (=> b!617364 (= e!354005 true)))

(assert (=> b!617364 (= (select (store (arr!18008 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!617365 () Bool)

(assert (=> b!617365 (= e!354009 (not e!354005))))

(declare-fun res!397714 () Bool)

(assert (=> b!617365 (=> res!397714 e!354005)))

(declare-fun lt!284249 () SeekEntryResult!6448)

(assert (=> b!617365 (= res!397714 (not (= lt!284249 (MissingVacant!6448 vacantSpotIndex!68))))))

(declare-fun lt!284247 () Unit!20208)

(assert (=> b!617365 (= lt!284247 e!354011)))

(declare-fun c!70193 () Bool)

(assert (=> b!617365 (= c!70193 (= lt!284249 (Found!6448 index!984)))))

(declare-fun lt!284241 () Unit!20208)

(declare-fun e!354000 () Unit!20208)

(assert (=> b!617365 (= lt!284241 e!354000)))

(declare-fun c!70192 () Bool)

(assert (=> b!617365 (= c!70192 (= lt!284249 Undefined!6448))))

(declare-fun lt!284244 () (_ BitVec 64))

(assert (=> b!617365 (= lt!284249 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284244 lt!284242 mask!3053))))

(declare-fun e!354003 () Bool)

(assert (=> b!617365 e!354003))

(declare-fun res!397718 () Bool)

(assert (=> b!617365 (=> (not res!397718) (not e!354003))))

(declare-fun lt!284243 () (_ BitVec 32))

(declare-fun lt!284251 () SeekEntryResult!6448)

(assert (=> b!617365 (= res!397718 (= lt!284251 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284243 vacantSpotIndex!68 lt!284244 lt!284242 mask!3053)))))

(assert (=> b!617365 (= lt!284251 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284243 vacantSpotIndex!68 (select (arr!18008 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617365 (= lt!284244 (select (store (arr!18008 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!284246 () Unit!20208)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37524 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20208)

(assert (=> b!617365 (= lt!284246 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284243 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617365 (= lt!284243 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!617366 () Bool)

(declare-fun Unit!20215 () Unit!20208)

(assert (=> b!617366 (= e!354000 Unit!20215)))

(assert (=> b!617366 false))

(declare-fun b!617367 () Bool)

(declare-fun res!397705 () Bool)

(assert (=> b!617367 (= res!397705 (bvsge j!136 index!984))))

(assert (=> b!617367 (=> res!397705 e!354007)))

(assert (=> b!617367 (= e!354008 e!354007)))

(declare-fun b!617368 () Bool)

(declare-fun res!397717 () Bool)

(assert (=> b!617368 (=> (not res!397717) (not e!353999))))

(assert (=> b!617368 (= res!397717 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18008 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617369 () Bool)

(assert (=> b!617369 false))

(declare-fun lt!284254 () Unit!20208)

(assert (=> b!617369 (= lt!284254 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284242 (select (arr!18008 a!2986) j!136) index!984 Nil!12046))))

(assert (=> b!617369 (arrayNoDuplicates!0 lt!284242 index!984 Nil!12046)))

(declare-fun lt!284256 () Unit!20208)

(assert (=> b!617369 (= lt!284256 (lemmaNoDuplicateFromThenFromBigger!0 lt!284242 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617369 (arrayNoDuplicates!0 lt!284242 #b00000000000000000000000000000000 Nil!12046)))

(declare-fun lt!284253 () Unit!20208)

(assert (=> b!617369 (= lt!284253 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12046))))

(assert (=> b!617369 (arrayContainsKey!0 lt!284242 (select (arr!18008 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284239 () Unit!20208)

(assert (=> b!617369 (= lt!284239 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284242 (select (arr!18008 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!617369 e!353998))

(declare-fun res!397713 () Bool)

(assert (=> b!617369 (=> (not res!397713) (not e!353998))))

(assert (=> b!617369 (= res!397713 (arrayContainsKey!0 lt!284242 (select (arr!18008 a!2986) j!136) j!136))))

(declare-fun Unit!20216 () Unit!20208)

(assert (=> b!617369 (= e!354012 Unit!20216)))

(declare-fun b!617370 () Bool)

(declare-fun res!397715 () Bool)

(assert (=> b!617370 (=> (not res!397715) (not e!354006))))

(assert (=> b!617370 (= res!397715 (and (= (size!18372 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18372 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18372 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617371 () Bool)

(declare-fun Unit!20217 () Unit!20208)

(assert (=> b!617371 (= e!354000 Unit!20217)))

(declare-fun b!617372 () Bool)

(assert (=> b!617372 (= e!354003 (= lt!284257 lt!284251))))

(assert (= (and start!56054 res!397708) b!617370))

(assert (= (and b!617370 res!397715) b!617359))

(assert (= (and b!617359 res!397704) b!617349))

(assert (= (and b!617349 res!397702) b!617357))

(assert (= (and b!617357 res!397709) b!617351))

(assert (= (and b!617351 res!397707) b!617360))

(assert (= (and b!617360 res!397706) b!617352))

(assert (= (and b!617352 res!397711) b!617368))

(assert (= (and b!617368 res!397717) b!617358))

(assert (= (and b!617358 res!397716) b!617363))

(assert (= (and b!617363 res!397710) b!617365))

(assert (= (and b!617365 res!397718) b!617372))

(assert (= (and b!617365 c!70192) b!617366))

(assert (= (and b!617365 (not c!70192)) b!617371))

(assert (= (and b!617365 c!70193) b!617348))

(assert (= (and b!617365 (not c!70193)) b!617355))

(assert (= (and b!617348 res!397712) b!617367))

(assert (= (and b!617367 (not res!397705)) b!617350))

(assert (= (and b!617350 res!397703) b!617361))

(assert (= (and b!617348 c!70190) b!617362))

(assert (= (and b!617348 (not c!70190)) b!617354))

(assert (= (and b!617348 c!70191) b!617369))

(assert (= (and b!617348 (not c!70191)) b!617356))

(assert (= (and b!617369 res!397713) b!617353))

(assert (= (and b!617365 (not res!397714)) b!617364))

(declare-fun m!593461 () Bool)

(assert (=> b!617369 m!593461))

(declare-fun m!593463 () Bool)

(assert (=> b!617369 m!593463))

(declare-fun m!593465 () Bool)

(assert (=> b!617369 m!593465))

(assert (=> b!617369 m!593461))

(declare-fun m!593467 () Bool)

(assert (=> b!617369 m!593467))

(declare-fun m!593469 () Bool)

(assert (=> b!617369 m!593469))

(assert (=> b!617369 m!593461))

(declare-fun m!593471 () Bool)

(assert (=> b!617369 m!593471))

(declare-fun m!593473 () Bool)

(assert (=> b!617369 m!593473))

(declare-fun m!593475 () Bool)

(assert (=> b!617369 m!593475))

(assert (=> b!617369 m!593461))

(assert (=> b!617369 m!593461))

(declare-fun m!593477 () Bool)

(assert (=> b!617369 m!593477))

(declare-fun m!593479 () Bool)

(assert (=> b!617349 m!593479))

(declare-fun m!593481 () Bool)

(assert (=> b!617357 m!593481))

(assert (=> b!617359 m!593461))

(assert (=> b!617359 m!593461))

(declare-fun m!593483 () Bool)

(assert (=> b!617359 m!593483))

(declare-fun m!593485 () Bool)

(assert (=> b!617360 m!593485))

(declare-fun m!593487 () Bool)

(assert (=> b!617368 m!593487))

(assert (=> b!617361 m!593461))

(assert (=> b!617361 m!593461))

(declare-fun m!593489 () Bool)

(assert (=> b!617361 m!593489))

(assert (=> b!617350 m!593461))

(assert (=> b!617350 m!593461))

(assert (=> b!617350 m!593463))

(declare-fun m!593491 () Bool)

(assert (=> b!617351 m!593491))

(declare-fun m!593493 () Bool)

(assert (=> start!56054 m!593493))

(declare-fun m!593495 () Bool)

(assert (=> start!56054 m!593495))

(declare-fun m!593497 () Bool)

(assert (=> b!617358 m!593497))

(declare-fun m!593499 () Bool)

(assert (=> b!617358 m!593499))

(assert (=> b!617362 m!593461))

(declare-fun m!593501 () Bool)

(assert (=> b!617362 m!593501))

(declare-fun m!593503 () Bool)

(assert (=> b!617362 m!593503))

(assert (=> b!617362 m!593461))

(assert (=> b!617362 m!593461))

(declare-fun m!593505 () Bool)

(assert (=> b!617362 m!593505))

(assert (=> b!617362 m!593465))

(declare-fun m!593507 () Bool)

(assert (=> b!617362 m!593507))

(assert (=> b!617362 m!593461))

(declare-fun m!593509 () Bool)

(assert (=> b!617362 m!593509))

(assert (=> b!617362 m!593475))

(declare-fun m!593511 () Bool)

(assert (=> b!617365 m!593511))

(declare-fun m!593513 () Bool)

(assert (=> b!617365 m!593513))

(assert (=> b!617365 m!593461))

(assert (=> b!617365 m!593497))

(declare-fun m!593515 () Bool)

(assert (=> b!617365 m!593515))

(declare-fun m!593517 () Bool)

(assert (=> b!617365 m!593517))

(declare-fun m!593519 () Bool)

(assert (=> b!617365 m!593519))

(assert (=> b!617365 m!593461))

(declare-fun m!593521 () Bool)

(assert (=> b!617365 m!593521))

(assert (=> b!617353 m!593461))

(assert (=> b!617353 m!593461))

(assert (=> b!617353 m!593489))

(declare-fun m!593523 () Bool)

(assert (=> b!617352 m!593523))

(assert (=> b!617348 m!593497))

(declare-fun m!593525 () Bool)

(assert (=> b!617348 m!593525))

(assert (=> b!617348 m!593461))

(declare-fun m!593527 () Bool)

(assert (=> b!617363 m!593527))

(assert (=> b!617363 m!593461))

(assert (=> b!617363 m!593461))

(declare-fun m!593529 () Bool)

(assert (=> b!617363 m!593529))

(assert (=> b!617364 m!593497))

(assert (=> b!617364 m!593525))

(push 1)

