; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58868 () Bool)

(assert start!58868)

(declare-fun b!649134 () Bool)

(declare-fun res!420677 () Bool)

(declare-fun e!372333 () Bool)

(assert (=> b!649134 (=> (not res!420677) (not e!372333))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38530 0))(
  ( (array!38531 (arr!18471 (Array (_ BitVec 32) (_ BitVec 64))) (size!18835 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38530)

(assert (=> b!649134 (= res!420677 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18471 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!372330 () Bool)

(declare-fun lt!301379 () array!38530)

(declare-fun b!649135 () Bool)

(declare-fun arrayContainsKey!0 (array!38530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649135 (= e!372330 (arrayContainsKey!0 lt!301379 (select (arr!18471 a!2986) j!136) index!984))))

(declare-fun b!649136 () Bool)

(declare-fun e!372332 () Bool)

(declare-fun e!372326 () Bool)

(assert (=> b!649136 (= e!372332 e!372326)))

(declare-fun res!420696 () Bool)

(assert (=> b!649136 (=> (not res!420696) (not e!372326))))

(assert (=> b!649136 (= res!420696 (arrayContainsKey!0 lt!301379 (select (arr!18471 a!2986) j!136) j!136))))

(declare-fun b!649137 () Bool)

(declare-fun e!372328 () Bool)

(assert (=> b!649137 (= e!372328 e!372333)))

(declare-fun res!420698 () Bool)

(assert (=> b!649137 (=> (not res!420698) (not e!372333))))

(declare-datatypes ((SeekEntryResult!6911 0))(
  ( (MissingZero!6911 (index!29991 (_ BitVec 32))) (Found!6911 (index!29992 (_ BitVec 32))) (Intermediate!6911 (undefined!7723 Bool) (index!29993 (_ BitVec 32)) (x!58780 (_ BitVec 32))) (Undefined!6911) (MissingVacant!6911 (index!29994 (_ BitVec 32))) )
))
(declare-fun lt!301382 () SeekEntryResult!6911)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!649137 (= res!420698 (or (= lt!301382 (MissingZero!6911 i!1108)) (= lt!301382 (MissingVacant!6911 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38530 (_ BitVec 32)) SeekEntryResult!6911)

(assert (=> b!649137 (= lt!301382 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!649138 () Bool)

(declare-fun e!372324 () Bool)

(assert (=> b!649138 (= e!372333 e!372324)))

(declare-fun res!420697 () Bool)

(assert (=> b!649138 (=> (not res!420697) (not e!372324))))

(assert (=> b!649138 (= res!420697 (= (select (store (arr!18471 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!649138 (= lt!301379 (array!38531 (store (arr!18471 a!2986) i!1108 k!1786) (size!18835 a!2986)))))

(declare-fun b!649139 () Bool)

(declare-fun res!420678 () Bool)

(declare-fun e!372321 () Bool)

(assert (=> b!649139 (=> res!420678 e!372321)))

(declare-datatypes ((List!12512 0))(
  ( (Nil!12509) (Cons!12508 (h!13553 (_ BitVec 64)) (t!18740 List!12512)) )
))
(declare-fun contains!3167 (List!12512 (_ BitVec 64)) Bool)

(assert (=> b!649139 (= res!420678 (contains!3167 Nil!12509 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649140 () Bool)

(declare-datatypes ((Unit!22092 0))(
  ( (Unit!22093) )
))
(declare-fun e!372325 () Unit!22092)

(declare-fun Unit!22094 () Unit!22092)

(assert (=> b!649140 (= e!372325 Unit!22094)))

(declare-fun lt!301383 () Unit!22092)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38530 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22092)

(assert (=> b!649140 (= lt!301383 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301379 (select (arr!18471 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!649140 (arrayContainsKey!0 lt!301379 (select (arr!18471 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301384 () Unit!22092)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38530 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12512) Unit!22092)

(assert (=> b!649140 (= lt!301384 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12509))))

(declare-fun arrayNoDuplicates!0 (array!38530 (_ BitVec 32) List!12512) Bool)

(assert (=> b!649140 (arrayNoDuplicates!0 lt!301379 #b00000000000000000000000000000000 Nil!12509)))

(declare-fun lt!301387 () Unit!22092)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38530 (_ BitVec 32) (_ BitVec 32)) Unit!22092)

(assert (=> b!649140 (= lt!301387 (lemmaNoDuplicateFromThenFromBigger!0 lt!301379 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649140 (arrayNoDuplicates!0 lt!301379 j!136 Nil!12509)))

(declare-fun lt!301392 () Unit!22092)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38530 (_ BitVec 64) (_ BitVec 32) List!12512) Unit!22092)

(assert (=> b!649140 (= lt!301392 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301379 (select (arr!18471 a!2986) j!136) j!136 Nil!12509))))

(assert (=> b!649140 false))

(declare-fun b!649141 () Bool)

(declare-fun e!372327 () Bool)

(declare-fun e!372322 () Bool)

(assert (=> b!649141 (= e!372327 e!372322)))

(declare-fun res!420692 () Bool)

(assert (=> b!649141 (=> res!420692 e!372322)))

(assert (=> b!649141 (= res!420692 (bvsge index!984 j!136))))

(declare-fun lt!301390 () Unit!22092)

(assert (=> b!649141 (= lt!301390 e!372325)))

(declare-fun c!74596 () Bool)

(assert (=> b!649141 (= c!74596 (bvslt j!136 index!984))))

(declare-fun b!649142 () Bool)

(declare-fun e!372329 () Bool)

(assert (=> b!649142 (= e!372329 e!372327)))

(declare-fun res!420681 () Bool)

(assert (=> b!649142 (=> res!420681 e!372327)))

(declare-fun lt!301388 () (_ BitVec 64))

(declare-fun lt!301380 () (_ BitVec 64))

(assert (=> b!649142 (= res!420681 (or (not (= (select (arr!18471 a!2986) j!136) lt!301388)) (not (= (select (arr!18471 a!2986) j!136) lt!301380))))))

(declare-fun e!372318 () Bool)

(assert (=> b!649142 e!372318))

(declare-fun res!420685 () Bool)

(assert (=> b!649142 (=> (not res!420685) (not e!372318))))

(assert (=> b!649142 (= res!420685 (= lt!301380 (select (arr!18471 a!2986) j!136)))))

(assert (=> b!649142 (= lt!301380 (select (store (arr!18471 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!649143 () Bool)

(assert (=> b!649143 (= e!372326 (arrayContainsKey!0 lt!301379 (select (arr!18471 a!2986) j!136) index!984))))

(declare-fun res!420687 () Bool)

(assert (=> start!58868 (=> (not res!420687) (not e!372328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58868 (= res!420687 (validMask!0 mask!3053))))

(assert (=> start!58868 e!372328))

(assert (=> start!58868 true))

(declare-fun array_inv!14267 (array!38530) Bool)

(assert (=> start!58868 (array_inv!14267 a!2986)))

(declare-fun b!649144 () Bool)

(declare-fun res!420680 () Bool)

(assert (=> b!649144 (=> (not res!420680) (not e!372328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649144 (= res!420680 (validKeyInArray!0 (select (arr!18471 a!2986) j!136)))))

(declare-fun b!649145 () Bool)

(assert (=> b!649145 (= e!372318 e!372332)))

(declare-fun res!420693 () Bool)

(assert (=> b!649145 (=> res!420693 e!372332)))

(assert (=> b!649145 (= res!420693 (or (not (= (select (arr!18471 a!2986) j!136) lt!301388)) (not (= (select (arr!18471 a!2986) j!136) lt!301380)) (bvsge j!136 index!984)))))

(declare-fun b!649146 () Bool)

(declare-fun res!420688 () Bool)

(assert (=> b!649146 (=> (not res!420688) (not e!372333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38530 (_ BitVec 32)) Bool)

(assert (=> b!649146 (= res!420688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!649147 () Bool)

(assert (=> b!649147 (= e!372322 e!372321)))

(declare-fun res!420684 () Bool)

(assert (=> b!649147 (=> res!420684 e!372321)))

(assert (=> b!649147 (= res!420684 (or (bvsge (size!18835 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18835 a!2986))))))

(assert (=> b!649147 (arrayContainsKey!0 lt!301379 (select (arr!18471 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301385 () Unit!22092)

(assert (=> b!649147 (= lt!301385 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301379 (select (arr!18471 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!649147 e!372330))

(declare-fun res!420683 () Bool)

(assert (=> b!649147 (=> (not res!420683) (not e!372330))))

(assert (=> b!649147 (= res!420683 (arrayContainsKey!0 lt!301379 (select (arr!18471 a!2986) j!136) j!136))))

(declare-fun b!649148 () Bool)

(declare-fun e!372319 () Unit!22092)

(declare-fun Unit!22095 () Unit!22092)

(assert (=> b!649148 (= e!372319 Unit!22095)))

(declare-fun b!649149 () Bool)

(declare-fun Unit!22096 () Unit!22092)

(assert (=> b!649149 (= e!372319 Unit!22096)))

(assert (=> b!649149 false))

(declare-fun b!649150 () Bool)

(declare-fun e!372331 () Bool)

(assert (=> b!649150 (= e!372331 (not e!372329))))

(declare-fun res!420691 () Bool)

(assert (=> b!649150 (=> res!420691 e!372329)))

(declare-fun lt!301381 () SeekEntryResult!6911)

(assert (=> b!649150 (= res!420691 (not (= lt!301381 (Found!6911 index!984))))))

(declare-fun lt!301386 () Unit!22092)

(assert (=> b!649150 (= lt!301386 e!372319)))

(declare-fun c!74597 () Bool)

(assert (=> b!649150 (= c!74597 (= lt!301381 Undefined!6911))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38530 (_ BitVec 32)) SeekEntryResult!6911)

(assert (=> b!649150 (= lt!301381 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301388 lt!301379 mask!3053))))

(declare-fun e!372320 () Bool)

(assert (=> b!649150 e!372320))

(declare-fun res!420686 () Bool)

(assert (=> b!649150 (=> (not res!420686) (not e!372320))))

(declare-fun lt!301393 () (_ BitVec 32))

(declare-fun lt!301391 () SeekEntryResult!6911)

(assert (=> b!649150 (= res!420686 (= lt!301391 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301393 vacantSpotIndex!68 lt!301388 lt!301379 mask!3053)))))

(assert (=> b!649150 (= lt!301391 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301393 vacantSpotIndex!68 (select (arr!18471 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!649150 (= lt!301388 (select (store (arr!18471 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!301389 () Unit!22092)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38530 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22092)

(assert (=> b!649150 (= lt!301389 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301393 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649150 (= lt!301393 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!649151 () Bool)

(declare-fun Unit!22097 () Unit!22092)

(assert (=> b!649151 (= e!372325 Unit!22097)))

(declare-fun b!649152 () Bool)

(assert (=> b!649152 (= e!372324 e!372331)))

(declare-fun res!420690 () Bool)

(assert (=> b!649152 (=> (not res!420690) (not e!372331))))

(declare-fun lt!301377 () SeekEntryResult!6911)

(assert (=> b!649152 (= res!420690 (and (= lt!301377 (Found!6911 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18471 a!2986) index!984) (select (arr!18471 a!2986) j!136))) (not (= (select (arr!18471 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!649152 (= lt!301377 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18471 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649153 () Bool)

(declare-fun res!420689 () Bool)

(assert (=> b!649153 (=> (not res!420689) (not e!372328))))

(assert (=> b!649153 (= res!420689 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649154 () Bool)

(assert (=> b!649154 (= e!372320 (= lt!301377 lt!301391))))

(declare-fun b!649155 () Bool)

(declare-fun res!420695 () Bool)

(assert (=> b!649155 (=> (not res!420695) (not e!372328))))

(assert (=> b!649155 (= res!420695 (and (= (size!18835 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18835 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18835 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!649156 () Bool)

(assert (=> b!649156 (= e!372321 true)))

(declare-fun lt!301378 () Bool)

(assert (=> b!649156 (= lt!301378 (contains!3167 Nil!12509 k!1786))))

(declare-fun b!649157 () Bool)

(declare-fun res!420679 () Bool)

(assert (=> b!649157 (=> res!420679 e!372321)))

(declare-fun noDuplicate!429 (List!12512) Bool)

(assert (=> b!649157 (= res!420679 (not (noDuplicate!429 Nil!12509)))))

(declare-fun b!649158 () Bool)

(declare-fun res!420682 () Bool)

(assert (=> b!649158 (=> (not res!420682) (not e!372333))))

(assert (=> b!649158 (= res!420682 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12509))))

(declare-fun b!649159 () Bool)

(declare-fun res!420694 () Bool)

(assert (=> b!649159 (=> res!420694 e!372321)))

(assert (=> b!649159 (= res!420694 (contains!3167 Nil!12509 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649160 () Bool)

(declare-fun res!420676 () Bool)

(assert (=> b!649160 (=> (not res!420676) (not e!372328))))

(assert (=> b!649160 (= res!420676 (validKeyInArray!0 k!1786))))

(assert (= (and start!58868 res!420687) b!649155))

(assert (= (and b!649155 res!420695) b!649144))

(assert (= (and b!649144 res!420680) b!649160))

(assert (= (and b!649160 res!420676) b!649153))

(assert (= (and b!649153 res!420689) b!649137))

(assert (= (and b!649137 res!420698) b!649146))

(assert (= (and b!649146 res!420688) b!649158))

(assert (= (and b!649158 res!420682) b!649134))

(assert (= (and b!649134 res!420677) b!649138))

(assert (= (and b!649138 res!420697) b!649152))

(assert (= (and b!649152 res!420690) b!649150))

(assert (= (and b!649150 res!420686) b!649154))

(assert (= (and b!649150 c!74597) b!649149))

(assert (= (and b!649150 (not c!74597)) b!649148))

(assert (= (and b!649150 (not res!420691)) b!649142))

(assert (= (and b!649142 res!420685) b!649145))

(assert (= (and b!649145 (not res!420693)) b!649136))

(assert (= (and b!649136 res!420696) b!649143))

(assert (= (and b!649142 (not res!420681)) b!649141))

(assert (= (and b!649141 c!74596) b!649140))

(assert (= (and b!649141 (not c!74596)) b!649151))

(assert (= (and b!649141 (not res!420692)) b!649147))

(assert (= (and b!649147 res!420683) b!649135))

(assert (= (and b!649147 (not res!420684)) b!649157))

(assert (= (and b!649157 (not res!420679)) b!649159))

(assert (= (and b!649159 (not res!420694)) b!649139))

(assert (= (and b!649139 (not res!420678)) b!649156))

(declare-fun m!622421 () Bool)

(assert (=> b!649138 m!622421))

(declare-fun m!622423 () Bool)

(assert (=> b!649138 m!622423))

(declare-fun m!622425 () Bool)

(assert (=> b!649135 m!622425))

(assert (=> b!649135 m!622425))

(declare-fun m!622427 () Bool)

(assert (=> b!649135 m!622427))

(declare-fun m!622429 () Bool)

(assert (=> b!649158 m!622429))

(declare-fun m!622431 () Bool)

(assert (=> b!649134 m!622431))

(assert (=> b!649140 m!622425))

(declare-fun m!622433 () Bool)

(assert (=> b!649140 m!622433))

(assert (=> b!649140 m!622425))

(declare-fun m!622435 () Bool)

(assert (=> b!649140 m!622435))

(assert (=> b!649140 m!622425))

(declare-fun m!622437 () Bool)

(assert (=> b!649140 m!622437))

(declare-fun m!622439 () Bool)

(assert (=> b!649140 m!622439))

(declare-fun m!622441 () Bool)

(assert (=> b!649140 m!622441))

(assert (=> b!649140 m!622425))

(declare-fun m!622443 () Bool)

(assert (=> b!649140 m!622443))

(declare-fun m!622445 () Bool)

(assert (=> b!649140 m!622445))

(declare-fun m!622447 () Bool)

(assert (=> b!649157 m!622447))

(declare-fun m!622449 () Bool)

(assert (=> b!649160 m!622449))

(declare-fun m!622451 () Bool)

(assert (=> b!649159 m!622451))

(assert (=> b!649136 m!622425))

(assert (=> b!649136 m!622425))

(declare-fun m!622453 () Bool)

(assert (=> b!649136 m!622453))

(declare-fun m!622455 () Bool)

(assert (=> b!649153 m!622455))

(declare-fun m!622457 () Bool)

(assert (=> b!649139 m!622457))

(declare-fun m!622459 () Bool)

(assert (=> b!649137 m!622459))

(declare-fun m!622461 () Bool)

(assert (=> b!649152 m!622461))

(assert (=> b!649152 m!622425))

(assert (=> b!649152 m!622425))

(declare-fun m!622463 () Bool)

(assert (=> b!649152 m!622463))

(declare-fun m!622465 () Bool)

(assert (=> b!649150 m!622465))

(declare-fun m!622467 () Bool)

(assert (=> b!649150 m!622467))

(declare-fun m!622469 () Bool)

(assert (=> b!649150 m!622469))

(assert (=> b!649150 m!622425))

(declare-fun m!622471 () Bool)

(assert (=> b!649150 m!622471))

(assert (=> b!649150 m!622425))

(assert (=> b!649150 m!622421))

(declare-fun m!622473 () Bool)

(assert (=> b!649150 m!622473))

(declare-fun m!622475 () Bool)

(assert (=> b!649150 m!622475))

(assert (=> b!649145 m!622425))

(declare-fun m!622477 () Bool)

(assert (=> b!649156 m!622477))

(declare-fun m!622479 () Bool)

(assert (=> b!649146 m!622479))

(assert (=> b!649144 m!622425))

(assert (=> b!649144 m!622425))

(declare-fun m!622481 () Bool)

(assert (=> b!649144 m!622481))

(assert (=> b!649147 m!622425))

(assert (=> b!649147 m!622425))

(declare-fun m!622483 () Bool)

(assert (=> b!649147 m!622483))

(assert (=> b!649147 m!622425))

(declare-fun m!622485 () Bool)

(assert (=> b!649147 m!622485))

(assert (=> b!649147 m!622425))

(assert (=> b!649147 m!622453))

(assert (=> b!649142 m!622425))

(assert (=> b!649142 m!622421))

(declare-fun m!622487 () Bool)

(assert (=> b!649142 m!622487))

(assert (=> b!649143 m!622425))

(assert (=> b!649143 m!622425))

(assert (=> b!649143 m!622427))

(declare-fun m!622489 () Bool)

(assert (=> start!58868 m!622489))

(declare-fun m!622491 () Bool)

(assert (=> start!58868 m!622491))

(push 1)

