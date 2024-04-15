; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59354 () Bool)

(assert start!59354)

(declare-fun b!655453 () Bool)

(declare-fun res!425253 () Bool)

(declare-fun e!376409 () Bool)

(assert (=> b!655453 (=> (not res!425253) (not e!376409))))

(declare-datatypes ((array!38685 0))(
  ( (array!38686 (arr!18542 (Array (_ BitVec 32) (_ BitVec 64))) (size!18907 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38685)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655453 (= res!425253 (validKeyInArray!0 (select (arr!18542 a!2986) j!136)))))

(declare-fun b!655454 () Bool)

(declare-fun e!376410 () Bool)

(declare-fun e!376408 () Bool)

(assert (=> b!655454 (= e!376410 e!376408)))

(declare-fun res!425257 () Bool)

(assert (=> b!655454 (=> (not res!425257) (not e!376408))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!655454 (= res!425257 (= (select (store (arr!18542 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!305697 () array!38685)

(assert (=> b!655454 (= lt!305697 (array!38686 (store (arr!18542 a!2986) i!1108 k0!1786) (size!18907 a!2986)))))

(declare-fun b!655455 () Bool)

(declare-fun res!425250 () Bool)

(assert (=> b!655455 (=> (not res!425250) (not e!376409))))

(declare-fun arrayContainsKey!0 (array!38685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655455 (= res!425250 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!655456 () Bool)

(declare-fun e!376403 () Bool)

(assert (=> b!655456 (= e!376408 e!376403)))

(declare-fun res!425248 () Bool)

(assert (=> b!655456 (=> (not res!425248) (not e!376403))))

(declare-datatypes ((SeekEntryResult!6979 0))(
  ( (MissingZero!6979 (index!30275 (_ BitVec 32))) (Found!6979 (index!30276 (_ BitVec 32))) (Intermediate!6979 (undefined!7791 Bool) (index!30277 (_ BitVec 32)) (x!59071 (_ BitVec 32))) (Undefined!6979) (MissingVacant!6979 (index!30278 (_ BitVec 32))) )
))
(declare-fun lt!305696 () SeekEntryResult!6979)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!655456 (= res!425248 (and (= lt!305696 (Found!6979 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18542 a!2986) index!984) (select (arr!18542 a!2986) j!136))) (not (= (select (arr!18542 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38685 (_ BitVec 32)) SeekEntryResult!6979)

(assert (=> b!655456 (= lt!305696 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18542 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655457 () Bool)

(declare-fun res!425260 () Bool)

(assert (=> b!655457 (=> (not res!425260) (not e!376409))))

(assert (=> b!655457 (= res!425260 (and (= (size!18907 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18907 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18907 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!655458 () Bool)

(declare-fun e!376400 () Bool)

(assert (=> b!655458 (= e!376400 (arrayContainsKey!0 lt!305697 (select (arr!18542 a!2986) j!136) index!984))))

(declare-fun res!425259 () Bool)

(assert (=> start!59354 (=> (not res!425259) (not e!376409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59354 (= res!425259 (validMask!0 mask!3053))))

(assert (=> start!59354 e!376409))

(assert (=> start!59354 true))

(declare-fun array_inv!14425 (array!38685) Bool)

(assert (=> start!59354 (array_inv!14425 a!2986)))

(declare-fun b!655459 () Bool)

(declare-datatypes ((Unit!22562 0))(
  ( (Unit!22563) )
))
(declare-fun e!376401 () Unit!22562)

(declare-fun Unit!22564 () Unit!22562)

(assert (=> b!655459 (= e!376401 Unit!22564)))

(declare-fun b!655460 () Bool)

(declare-fun res!425247 () Bool)

(assert (=> b!655460 (=> (not res!425247) (not e!376409))))

(assert (=> b!655460 (= res!425247 (validKeyInArray!0 k0!1786))))

(declare-fun b!655461 () Bool)

(declare-fun res!425245 () Bool)

(assert (=> b!655461 (= res!425245 (bvsge j!136 index!984))))

(declare-fun e!376411 () Bool)

(assert (=> b!655461 (=> res!425245 e!376411)))

(declare-fun e!376405 () Bool)

(assert (=> b!655461 (= e!376405 e!376411)))

(declare-fun b!655462 () Bool)

(declare-fun lt!305693 () SeekEntryResult!6979)

(assert (=> b!655462 (= e!376403 (not (or (not (= lt!305693 (MissingVacant!6979 vacantSpotIndex!68))) (bvslt index!984 (size!18907 a!2986)))))))

(declare-fun lt!305691 () Unit!22562)

(declare-fun e!376407 () Unit!22562)

(assert (=> b!655462 (= lt!305691 e!376407)))

(declare-fun c!75471 () Bool)

(assert (=> b!655462 (= c!75471 (= lt!305693 (Found!6979 index!984)))))

(declare-fun lt!305689 () Unit!22562)

(assert (=> b!655462 (= lt!305689 e!376401)))

(declare-fun c!75474 () Bool)

(assert (=> b!655462 (= c!75474 (= lt!305693 Undefined!6979))))

(declare-fun lt!305700 () (_ BitVec 64))

(assert (=> b!655462 (= lt!305693 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305700 lt!305697 mask!3053))))

(declare-fun e!376412 () Bool)

(assert (=> b!655462 e!376412))

(declare-fun res!425249 () Bool)

(assert (=> b!655462 (=> (not res!425249) (not e!376412))))

(declare-fun lt!305694 () SeekEntryResult!6979)

(declare-fun lt!305701 () (_ BitVec 32))

(assert (=> b!655462 (= res!425249 (= lt!305694 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305701 vacantSpotIndex!68 lt!305700 lt!305697 mask!3053)))))

(assert (=> b!655462 (= lt!305694 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305701 vacantSpotIndex!68 (select (arr!18542 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655462 (= lt!305700 (select (store (arr!18542 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!305706 () Unit!22562)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38685 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22562)

(assert (=> b!655462 (= lt!305706 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305701 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655462 (= lt!305701 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!425258 () Bool)

(declare-fun b!655463 () Bool)

(assert (=> b!655463 (= res!425258 (arrayContainsKey!0 lt!305697 (select (arr!18542 a!2986) j!136) j!136))))

(declare-fun e!376406 () Bool)

(assert (=> b!655463 (=> (not res!425258) (not e!376406))))

(assert (=> b!655463 (= e!376411 e!376406)))

(declare-fun b!655464 () Bool)

(declare-fun res!425256 () Bool)

(assert (=> b!655464 (=> (not res!425256) (not e!376410))))

(assert (=> b!655464 (= res!425256 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18542 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655465 () Bool)

(declare-fun e!376404 () Unit!22562)

(declare-fun Unit!22565 () Unit!22562)

(assert (=> b!655465 (= e!376404 Unit!22565)))

(declare-fun b!655466 () Bool)

(assert (=> b!655466 false))

(declare-fun lt!305698 () Unit!22562)

(declare-datatypes ((List!12622 0))(
  ( (Nil!12619) (Cons!12618 (h!13663 (_ BitVec 64)) (t!18841 List!12622)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38685 (_ BitVec 64) (_ BitVec 32) List!12622) Unit!22562)

(assert (=> b!655466 (= lt!305698 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305697 (select (arr!18542 a!2986) j!136) index!984 Nil!12619))))

(declare-fun arrayNoDuplicates!0 (array!38685 (_ BitVec 32) List!12622) Bool)

(assert (=> b!655466 (arrayNoDuplicates!0 lt!305697 index!984 Nil!12619)))

(declare-fun lt!305704 () Unit!22562)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38685 (_ BitVec 32) (_ BitVec 32)) Unit!22562)

(assert (=> b!655466 (= lt!305704 (lemmaNoDuplicateFromThenFromBigger!0 lt!305697 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655466 (arrayNoDuplicates!0 lt!305697 #b00000000000000000000000000000000 Nil!12619)))

(declare-fun lt!305702 () Unit!22562)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38685 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12622) Unit!22562)

(assert (=> b!655466 (= lt!305702 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12619))))

(assert (=> b!655466 (arrayContainsKey!0 lt!305697 (select (arr!18542 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305690 () Unit!22562)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38685 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22562)

(assert (=> b!655466 (= lt!305690 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305697 (select (arr!18542 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!655466 e!376400))

(declare-fun res!425251 () Bool)

(assert (=> b!655466 (=> (not res!425251) (not e!376400))))

(assert (=> b!655466 (= res!425251 (arrayContainsKey!0 lt!305697 (select (arr!18542 a!2986) j!136) j!136))))

(declare-fun Unit!22566 () Unit!22562)

(assert (=> b!655466 (= e!376404 Unit!22566)))

(declare-fun b!655467 () Bool)

(declare-fun Unit!22567 () Unit!22562)

(assert (=> b!655467 (= e!376401 Unit!22567)))

(assert (=> b!655467 false))

(declare-fun b!655468 () Bool)

(declare-fun res!425246 () Bool)

(assert (=> b!655468 (=> (not res!425246) (not e!376410))))

(assert (=> b!655468 (= res!425246 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12619))))

(declare-fun b!655469 () Bool)

(assert (=> b!655469 (= e!376412 (= lt!305696 lt!305694))))

(declare-fun b!655470 () Bool)

(declare-fun res!425254 () Bool)

(assert (=> b!655470 (=> (not res!425254) (not e!376410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38685 (_ BitVec 32)) Bool)

(assert (=> b!655470 (= res!425254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655471 () Bool)

(declare-fun e!376399 () Unit!22562)

(declare-fun Unit!22568 () Unit!22562)

(assert (=> b!655471 (= e!376399 Unit!22568)))

(declare-fun b!655472 () Bool)

(assert (=> b!655472 (= e!376409 e!376410)))

(declare-fun res!425255 () Bool)

(assert (=> b!655472 (=> (not res!425255) (not e!376410))))

(declare-fun lt!305699 () SeekEntryResult!6979)

(assert (=> b!655472 (= res!425255 (or (= lt!305699 (MissingZero!6979 i!1108)) (= lt!305699 (MissingVacant!6979 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38685 (_ BitVec 32)) SeekEntryResult!6979)

(assert (=> b!655472 (= lt!305699 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!655473 () Bool)

(assert (=> b!655473 (= e!376406 (arrayContainsKey!0 lt!305697 (select (arr!18542 a!2986) j!136) index!984))))

(declare-fun b!655474 () Bool)

(declare-fun Unit!22569 () Unit!22562)

(assert (=> b!655474 (= e!376407 Unit!22569)))

(declare-fun res!425252 () Bool)

(assert (=> b!655474 (= res!425252 (= (select (store (arr!18542 a!2986) i!1108 k0!1786) index!984) (select (arr!18542 a!2986) j!136)))))

(assert (=> b!655474 (=> (not res!425252) (not e!376405))))

(assert (=> b!655474 e!376405))

(declare-fun c!75473 () Bool)

(assert (=> b!655474 (= c!75473 (bvslt j!136 index!984))))

(declare-fun lt!305692 () Unit!22562)

(assert (=> b!655474 (= lt!305692 e!376399)))

(declare-fun c!75472 () Bool)

(assert (=> b!655474 (= c!75472 (bvslt index!984 j!136))))

(declare-fun lt!305695 () Unit!22562)

(assert (=> b!655474 (= lt!305695 e!376404)))

(assert (=> b!655474 false))

(declare-fun b!655475 () Bool)

(assert (=> b!655475 false))

(declare-fun lt!305687 () Unit!22562)

(assert (=> b!655475 (= lt!305687 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305697 (select (arr!18542 a!2986) j!136) j!136 Nil!12619))))

(assert (=> b!655475 (arrayNoDuplicates!0 lt!305697 j!136 Nil!12619)))

(declare-fun lt!305703 () Unit!22562)

(assert (=> b!655475 (= lt!305703 (lemmaNoDuplicateFromThenFromBigger!0 lt!305697 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655475 (arrayNoDuplicates!0 lt!305697 #b00000000000000000000000000000000 Nil!12619)))

(declare-fun lt!305688 () Unit!22562)

(assert (=> b!655475 (= lt!305688 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12619))))

(assert (=> b!655475 (arrayContainsKey!0 lt!305697 (select (arr!18542 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305705 () Unit!22562)

(assert (=> b!655475 (= lt!305705 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305697 (select (arr!18542 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22570 () Unit!22562)

(assert (=> b!655475 (= e!376399 Unit!22570)))

(declare-fun b!655476 () Bool)

(declare-fun Unit!22571 () Unit!22562)

(assert (=> b!655476 (= e!376407 Unit!22571)))

(assert (= (and start!59354 res!425259) b!655457))

(assert (= (and b!655457 res!425260) b!655453))

(assert (= (and b!655453 res!425253) b!655460))

(assert (= (and b!655460 res!425247) b!655455))

(assert (= (and b!655455 res!425250) b!655472))

(assert (= (and b!655472 res!425255) b!655470))

(assert (= (and b!655470 res!425254) b!655468))

(assert (= (and b!655468 res!425246) b!655464))

(assert (= (and b!655464 res!425256) b!655454))

(assert (= (and b!655454 res!425257) b!655456))

(assert (= (and b!655456 res!425248) b!655462))

(assert (= (and b!655462 res!425249) b!655469))

(assert (= (and b!655462 c!75474) b!655467))

(assert (= (and b!655462 (not c!75474)) b!655459))

(assert (= (and b!655462 c!75471) b!655474))

(assert (= (and b!655462 (not c!75471)) b!655476))

(assert (= (and b!655474 res!425252) b!655461))

(assert (= (and b!655461 (not res!425245)) b!655463))

(assert (= (and b!655463 res!425258) b!655473))

(assert (= (and b!655474 c!75473) b!655475))

(assert (= (and b!655474 (not c!75473)) b!655471))

(assert (= (and b!655474 c!75472) b!655466))

(assert (= (and b!655474 (not c!75472)) b!655465))

(assert (= (and b!655466 res!425251) b!655458))

(declare-fun m!628035 () Bool)

(assert (=> b!655455 m!628035))

(declare-fun m!628037 () Bool)

(assert (=> b!655475 m!628037))

(declare-fun m!628039 () Bool)

(assert (=> b!655475 m!628039))

(assert (=> b!655475 m!628037))

(declare-fun m!628041 () Bool)

(assert (=> b!655475 m!628041))

(assert (=> b!655475 m!628037))

(declare-fun m!628043 () Bool)

(assert (=> b!655475 m!628043))

(declare-fun m!628045 () Bool)

(assert (=> b!655475 m!628045))

(declare-fun m!628047 () Bool)

(assert (=> b!655475 m!628047))

(declare-fun m!628049 () Bool)

(assert (=> b!655475 m!628049))

(assert (=> b!655475 m!628037))

(declare-fun m!628051 () Bool)

(assert (=> b!655475 m!628051))

(declare-fun m!628053 () Bool)

(assert (=> start!59354 m!628053))

(declare-fun m!628055 () Bool)

(assert (=> start!59354 m!628055))

(declare-fun m!628057 () Bool)

(assert (=> b!655470 m!628057))

(declare-fun m!628059 () Bool)

(assert (=> b!655460 m!628059))

(declare-fun m!628061 () Bool)

(assert (=> b!655474 m!628061))

(declare-fun m!628063 () Bool)

(assert (=> b!655474 m!628063))

(assert (=> b!655474 m!628037))

(declare-fun m!628065 () Bool)

(assert (=> b!655464 m!628065))

(assert (=> b!655453 m!628037))

(assert (=> b!655453 m!628037))

(declare-fun m!628067 () Bool)

(assert (=> b!655453 m!628067))

(declare-fun m!628069 () Bool)

(assert (=> b!655456 m!628069))

(assert (=> b!655456 m!628037))

(assert (=> b!655456 m!628037))

(declare-fun m!628071 () Bool)

(assert (=> b!655456 m!628071))

(assert (=> b!655458 m!628037))

(assert (=> b!655458 m!628037))

(declare-fun m!628073 () Bool)

(assert (=> b!655458 m!628073))

(assert (=> b!655466 m!628037))

(declare-fun m!628075 () Bool)

(assert (=> b!655466 m!628075))

(assert (=> b!655466 m!628037))

(declare-fun m!628077 () Bool)

(assert (=> b!655466 m!628077))

(assert (=> b!655466 m!628037))

(declare-fun m!628079 () Bool)

(assert (=> b!655466 m!628079))

(assert (=> b!655466 m!628037))

(declare-fun m!628081 () Bool)

(assert (=> b!655466 m!628081))

(assert (=> b!655466 m!628045))

(assert (=> b!655466 m!628037))

(declare-fun m!628083 () Bool)

(assert (=> b!655466 m!628083))

(declare-fun m!628085 () Bool)

(assert (=> b!655466 m!628085))

(assert (=> b!655466 m!628047))

(declare-fun m!628087 () Bool)

(assert (=> b!655472 m!628087))

(declare-fun m!628089 () Bool)

(assert (=> b!655462 m!628089))

(declare-fun m!628091 () Bool)

(assert (=> b!655462 m!628091))

(assert (=> b!655462 m!628037))

(declare-fun m!628093 () Bool)

(assert (=> b!655462 m!628093))

(assert (=> b!655462 m!628037))

(assert (=> b!655462 m!628061))

(declare-fun m!628095 () Bool)

(assert (=> b!655462 m!628095))

(declare-fun m!628097 () Bool)

(assert (=> b!655462 m!628097))

(declare-fun m!628099 () Bool)

(assert (=> b!655462 m!628099))

(assert (=> b!655463 m!628037))

(assert (=> b!655463 m!628037))

(assert (=> b!655463 m!628083))

(declare-fun m!628101 () Bool)

(assert (=> b!655468 m!628101))

(assert (=> b!655454 m!628061))

(declare-fun m!628103 () Bool)

(assert (=> b!655454 m!628103))

(assert (=> b!655473 m!628037))

(assert (=> b!655473 m!628037))

(assert (=> b!655473 m!628073))

(check-sat (not b!655460) (not b!655455) (not b!655462) (not b!655470) (not b!655468) (not b!655473) (not b!655475) (not b!655463) (not b!655472) (not b!655458) (not b!655453) (not b!655466) (not b!655456) (not start!59354))
(check-sat)
