; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54810 () Bool)

(assert start!54810)

(declare-fun b!598366 () Bool)

(declare-datatypes ((Unit!18816 0))(
  ( (Unit!18817) )
))
(declare-fun e!342039 () Unit!18816)

(declare-fun Unit!18818 () Unit!18816)

(assert (=> b!598366 (= e!342039 Unit!18818)))

(declare-fun b!598367 () Bool)

(declare-fun e!342030 () Bool)

(declare-fun e!342034 () Bool)

(assert (=> b!598367 (= e!342030 e!342034)))

(declare-fun res!383581 () Bool)

(assert (=> b!598367 (=> res!383581 e!342034)))

(declare-fun lt!271754 () (_ BitVec 64))

(declare-fun lt!271755 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37059 0))(
  ( (array!37060 (arr!17789 (Array (_ BitVec 32) (_ BitVec 64))) (size!18154 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37059)

(assert (=> b!598367 (= res!383581 (or (not (= (select (arr!17789 a!2986) j!136) lt!271755)) (not (= (select (arr!17789 a!2986) j!136) lt!271754)) (bvsge j!136 index!984)))))

(declare-fun b!598368 () Bool)

(declare-fun lt!271762 () array!37059)

(declare-fun e!342029 () Bool)

(declare-fun arrayContainsKey!0 (array!37059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598368 (= e!342029 (arrayContainsKey!0 lt!271762 (select (arr!17789 a!2986) j!136) index!984))))

(declare-fun b!598369 () Bool)

(declare-fun Unit!18819 () Unit!18816)

(assert (=> b!598369 (= e!342039 Unit!18819)))

(assert (=> b!598369 false))

(declare-fun res!383578 () Bool)

(declare-fun e!342037 () Bool)

(assert (=> start!54810 (=> (not res!383578) (not e!342037))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54810 (= res!383578 (validMask!0 mask!3053))))

(assert (=> start!54810 e!342037))

(assert (=> start!54810 true))

(declare-fun array_inv!13672 (array!37059) Bool)

(assert (=> start!54810 (array_inv!13672 a!2986)))

(declare-fun b!598370 () Bool)

(declare-fun res!383570 () Bool)

(assert (=> b!598370 (=> (not res!383570) (not e!342037))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!598370 (= res!383570 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598371 () Bool)

(declare-fun e!342035 () Bool)

(declare-fun e!342032 () Bool)

(assert (=> b!598371 (= e!342035 e!342032)))

(declare-fun res!383569 () Bool)

(assert (=> b!598371 (=> (not res!383569) (not e!342032))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!598371 (= res!383569 (= (select (store (arr!17789 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598371 (= lt!271762 (array!37060 (store (arr!17789 a!2986) i!1108 k0!1786) (size!18154 a!2986)))))

(declare-fun b!598372 () Bool)

(declare-fun res!383580 () Bool)

(assert (=> b!598372 (=> (not res!383580) (not e!342037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598372 (= res!383580 (validKeyInArray!0 k0!1786))))

(declare-fun b!598373 () Bool)

(declare-fun res!383571 () Bool)

(assert (=> b!598373 (=> (not res!383571) (not e!342035))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!598373 (= res!383571 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17789 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598374 () Bool)

(assert (=> b!598374 (= e!342034 e!342029)))

(declare-fun res!383572 () Bool)

(assert (=> b!598374 (=> (not res!383572) (not e!342029))))

(assert (=> b!598374 (= res!383572 (arrayContainsKey!0 lt!271762 (select (arr!17789 a!2986) j!136) j!136))))

(declare-fun b!598375 () Bool)

(declare-fun e!342031 () Bool)

(assert (=> b!598375 (= e!342032 e!342031)))

(declare-fun res!383568 () Bool)

(assert (=> b!598375 (=> (not res!383568) (not e!342031))))

(declare-datatypes ((SeekEntryResult!6226 0))(
  ( (MissingZero!6226 (index!27161 (_ BitVec 32))) (Found!6226 (index!27162 (_ BitVec 32))) (Intermediate!6226 (undefined!7038 Bool) (index!27163 (_ BitVec 32)) (x!55980 (_ BitVec 32))) (Undefined!6226) (MissingVacant!6226 (index!27164 (_ BitVec 32))) )
))
(declare-fun lt!271756 () SeekEntryResult!6226)

(assert (=> b!598375 (= res!383568 (and (= lt!271756 (Found!6226 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17789 a!2986) index!984) (select (arr!17789 a!2986) j!136))) (not (= (select (arr!17789 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37059 (_ BitVec 32)) SeekEntryResult!6226)

(assert (=> b!598375 (= lt!271756 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17789 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598376 () Bool)

(declare-fun e!342036 () Bool)

(declare-fun lt!271765 () SeekEntryResult!6226)

(assert (=> b!598376 (= e!342036 (= lt!271756 lt!271765))))

(declare-fun b!598377 () Bool)

(declare-fun e!342033 () Bool)

(declare-fun e!342028 () Bool)

(assert (=> b!598377 (= e!342033 e!342028)))

(declare-fun res!383575 () Bool)

(assert (=> b!598377 (=> res!383575 e!342028)))

(assert (=> b!598377 (= res!383575 (or (not (= (select (arr!17789 a!2986) j!136) lt!271755)) (not (= (select (arr!17789 a!2986) j!136) lt!271754)) (bvsge j!136 index!984)))))

(assert (=> b!598377 e!342030))

(declare-fun res!383576 () Bool)

(assert (=> b!598377 (=> (not res!383576) (not e!342030))))

(assert (=> b!598377 (= res!383576 (= lt!271754 (select (arr!17789 a!2986) j!136)))))

(assert (=> b!598377 (= lt!271754 (select (store (arr!17789 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!598378 () Bool)

(declare-fun res!383577 () Bool)

(assert (=> b!598378 (=> (not res!383577) (not e!342035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37059 (_ BitVec 32)) Bool)

(assert (=> b!598378 (= res!383577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598379 () Bool)

(declare-fun res!383566 () Bool)

(assert (=> b!598379 (=> (not res!383566) (not e!342037))))

(assert (=> b!598379 (= res!383566 (validKeyInArray!0 (select (arr!17789 a!2986) j!136)))))

(declare-fun b!598380 () Bool)

(declare-fun res!383567 () Bool)

(assert (=> b!598380 (=> (not res!383567) (not e!342035))))

(declare-datatypes ((List!11869 0))(
  ( (Nil!11866) (Cons!11865 (h!12910 (_ BitVec 64)) (t!18088 List!11869)) )
))
(declare-fun arrayNoDuplicates!0 (array!37059 (_ BitVec 32) List!11869) Bool)

(assert (=> b!598380 (= res!383567 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11866))))

(declare-fun b!598381 () Bool)

(assert (=> b!598381 (= e!342037 e!342035)))

(declare-fun res!383579 () Bool)

(assert (=> b!598381 (=> (not res!383579) (not e!342035))))

(declare-fun lt!271759 () SeekEntryResult!6226)

(assert (=> b!598381 (= res!383579 (or (= lt!271759 (MissingZero!6226 i!1108)) (= lt!271759 (MissingVacant!6226 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37059 (_ BitVec 32)) SeekEntryResult!6226)

(assert (=> b!598381 (= lt!271759 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!598382 () Bool)

(assert (=> b!598382 (= e!342031 (not e!342033))))

(declare-fun res!383582 () Bool)

(assert (=> b!598382 (=> res!383582 e!342033)))

(declare-fun lt!271763 () SeekEntryResult!6226)

(assert (=> b!598382 (= res!383582 (not (= lt!271763 (Found!6226 index!984))))))

(declare-fun lt!271758 () Unit!18816)

(assert (=> b!598382 (= lt!271758 e!342039)))

(declare-fun c!67767 () Bool)

(assert (=> b!598382 (= c!67767 (= lt!271763 Undefined!6226))))

(assert (=> b!598382 (= lt!271763 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271755 lt!271762 mask!3053))))

(assert (=> b!598382 e!342036))

(declare-fun res!383573 () Bool)

(assert (=> b!598382 (=> (not res!383573) (not e!342036))))

(declare-fun lt!271761 () (_ BitVec 32))

(assert (=> b!598382 (= res!383573 (= lt!271765 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271761 vacantSpotIndex!68 lt!271755 lt!271762 mask!3053)))))

(assert (=> b!598382 (= lt!271765 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271761 vacantSpotIndex!68 (select (arr!17789 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!598382 (= lt!271755 (select (store (arr!17789 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!271757 () Unit!18816)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37059 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18816)

(assert (=> b!598382 (= lt!271757 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271761 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598382 (= lt!271761 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!598383 () Bool)

(assert (=> b!598383 (= e!342028 true)))

(assert (=> b!598383 (arrayNoDuplicates!0 lt!271762 #b00000000000000000000000000000000 Nil!11866)))

(declare-fun lt!271760 () Unit!18816)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37059 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11869) Unit!18816)

(assert (=> b!598383 (= lt!271760 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11866))))

(assert (=> b!598383 (arrayContainsKey!0 lt!271762 (select (arr!17789 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271764 () Unit!18816)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37059 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18816)

(assert (=> b!598383 (= lt!271764 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271762 (select (arr!17789 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598384 () Bool)

(declare-fun res!383574 () Bool)

(assert (=> b!598384 (=> (not res!383574) (not e!342037))))

(assert (=> b!598384 (= res!383574 (and (= (size!18154 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18154 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18154 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!54810 res!383578) b!598384))

(assert (= (and b!598384 res!383574) b!598379))

(assert (= (and b!598379 res!383566) b!598372))

(assert (= (and b!598372 res!383580) b!598370))

(assert (= (and b!598370 res!383570) b!598381))

(assert (= (and b!598381 res!383579) b!598378))

(assert (= (and b!598378 res!383577) b!598380))

(assert (= (and b!598380 res!383567) b!598373))

(assert (= (and b!598373 res!383571) b!598371))

(assert (= (and b!598371 res!383569) b!598375))

(assert (= (and b!598375 res!383568) b!598382))

(assert (= (and b!598382 res!383573) b!598376))

(assert (= (and b!598382 c!67767) b!598369))

(assert (= (and b!598382 (not c!67767)) b!598366))

(assert (= (and b!598382 (not res!383582)) b!598377))

(assert (= (and b!598377 res!383576) b!598367))

(assert (= (and b!598367 (not res!383581)) b!598374))

(assert (= (and b!598374 res!383572) b!598368))

(assert (= (and b!598377 (not res!383575)) b!598383))

(declare-fun m!575161 () Bool)

(assert (=> b!598373 m!575161))

(declare-fun m!575163 () Bool)

(assert (=> b!598382 m!575163))

(declare-fun m!575165 () Bool)

(assert (=> b!598382 m!575165))

(declare-fun m!575167 () Bool)

(assert (=> b!598382 m!575167))

(declare-fun m!575169 () Bool)

(assert (=> b!598382 m!575169))

(assert (=> b!598382 m!575165))

(declare-fun m!575171 () Bool)

(assert (=> b!598382 m!575171))

(declare-fun m!575173 () Bool)

(assert (=> b!598382 m!575173))

(declare-fun m!575175 () Bool)

(assert (=> b!598382 m!575175))

(declare-fun m!575177 () Bool)

(assert (=> b!598382 m!575177))

(declare-fun m!575179 () Bool)

(assert (=> b!598375 m!575179))

(assert (=> b!598375 m!575165))

(assert (=> b!598375 m!575165))

(declare-fun m!575181 () Bool)

(assert (=> b!598375 m!575181))

(assert (=> b!598367 m!575165))

(assert (=> b!598383 m!575165))

(assert (=> b!598383 m!575165))

(declare-fun m!575183 () Bool)

(assert (=> b!598383 m!575183))

(declare-fun m!575185 () Bool)

(assert (=> b!598383 m!575185))

(assert (=> b!598383 m!575165))

(declare-fun m!575187 () Bool)

(assert (=> b!598383 m!575187))

(declare-fun m!575189 () Bool)

(assert (=> b!598383 m!575189))

(assert (=> b!598371 m!575167))

(declare-fun m!575191 () Bool)

(assert (=> b!598371 m!575191))

(declare-fun m!575193 () Bool)

(assert (=> b!598378 m!575193))

(declare-fun m!575195 () Bool)

(assert (=> b!598380 m!575195))

(declare-fun m!575197 () Bool)

(assert (=> b!598372 m!575197))

(assert (=> b!598368 m!575165))

(assert (=> b!598368 m!575165))

(declare-fun m!575199 () Bool)

(assert (=> b!598368 m!575199))

(assert (=> b!598374 m!575165))

(assert (=> b!598374 m!575165))

(declare-fun m!575201 () Bool)

(assert (=> b!598374 m!575201))

(declare-fun m!575203 () Bool)

(assert (=> start!54810 m!575203))

(declare-fun m!575205 () Bool)

(assert (=> start!54810 m!575205))

(assert (=> b!598377 m!575165))

(assert (=> b!598377 m!575167))

(declare-fun m!575207 () Bool)

(assert (=> b!598377 m!575207))

(assert (=> b!598379 m!575165))

(assert (=> b!598379 m!575165))

(declare-fun m!575209 () Bool)

(assert (=> b!598379 m!575209))

(declare-fun m!575211 () Bool)

(assert (=> b!598381 m!575211))

(declare-fun m!575213 () Bool)

(assert (=> b!598370 m!575213))

(check-sat (not b!598370) (not b!598379) (not b!598374) (not b!598372) (not start!54810) (not b!598382) (not b!598375) (not b!598383) (not b!598378) (not b!598381) (not b!598380) (not b!598368))
(check-sat)
