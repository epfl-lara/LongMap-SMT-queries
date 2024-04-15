; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56046 () Bool)

(assert start!56046)

(declare-fun b!617377 () Bool)

(assert (=> b!617377 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!20226 0))(
  ( (Unit!20227) )
))
(declare-fun lt!284244 () Unit!20226)

(declare-datatypes ((array!37530 0))(
  ( (array!37531 (arr!18011 (Array (_ BitVec 32) (_ BitVec 64))) (size!18376 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37530)

(declare-fun lt!284255 () array!37530)

(declare-datatypes ((List!12091 0))(
  ( (Nil!12088) (Cons!12087 (h!13132 (_ BitVec 64)) (t!18310 List!12091)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37530 (_ BitVec 64) (_ BitVec 32) List!12091) Unit!20226)

(assert (=> b!617377 (= lt!284244 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284255 (select (arr!18011 a!2986) j!136) j!136 Nil!12088))))

(declare-fun arrayNoDuplicates!0 (array!37530 (_ BitVec 32) List!12091) Bool)

(assert (=> b!617377 (arrayNoDuplicates!0 lt!284255 j!136 Nil!12088)))

(declare-fun lt!284245 () Unit!20226)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37530 (_ BitVec 32) (_ BitVec 32)) Unit!20226)

(assert (=> b!617377 (= lt!284245 (lemmaNoDuplicateFromThenFromBigger!0 lt!284255 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617377 (arrayNoDuplicates!0 lt!284255 #b00000000000000000000000000000000 Nil!12088)))

(declare-fun lt!284248 () Unit!20226)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37530 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12091) Unit!20226)

(assert (=> b!617377 (= lt!284248 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12088))))

(declare-fun arrayContainsKey!0 (array!37530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617377 (arrayContainsKey!0 lt!284255 (select (arr!18011 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284246 () Unit!20226)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37530 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20226)

(assert (=> b!617377 (= lt!284246 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284255 (select (arr!18011 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!354013 () Unit!20226)

(declare-fun Unit!20228 () Unit!20226)

(assert (=> b!617377 (= e!354013 Unit!20228)))

(declare-fun b!617378 () Bool)

(declare-fun e!354012 () Bool)

(assert (=> b!617378 (= e!354012 true)))

(assert (=> b!617378 (= (select (store (arr!18011 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!617379 () Bool)

(declare-fun res!397783 () Bool)

(declare-fun e!354008 () Bool)

(assert (=> b!617379 (=> (not res!397783) (not e!354008))))

(assert (=> b!617379 (= res!397783 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617380 () Bool)

(declare-fun e!354006 () Unit!20226)

(declare-fun Unit!20229 () Unit!20226)

(assert (=> b!617380 (= e!354006 Unit!20229)))

(declare-fun b!617381 () Bool)

(declare-fun res!397792 () Bool)

(assert (=> b!617381 (=> (not res!397792) (not e!354008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617381 (= res!397792 (validKeyInArray!0 k0!1786))))

(declare-fun b!617382 () Bool)

(declare-fun res!397782 () Bool)

(assert (=> b!617382 (=> (not res!397782) (not e!354008))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!617382 (= res!397782 (and (= (size!18376 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18376 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18376 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617383 () Bool)

(declare-fun e!354009 () Bool)

(assert (=> b!617383 (= e!354008 e!354009)))

(declare-fun res!397790 () Bool)

(assert (=> b!617383 (=> (not res!397790) (not e!354009))))

(declare-datatypes ((SeekEntryResult!6448 0))(
  ( (MissingZero!6448 (index!28076 (_ BitVec 32))) (Found!6448 (index!28077 (_ BitVec 32))) (Intermediate!6448 (undefined!7260 Bool) (index!28078 (_ BitVec 32)) (x!56875 (_ BitVec 32))) (Undefined!6448) (MissingVacant!6448 (index!28079 (_ BitVec 32))) )
))
(declare-fun lt!284260 () SeekEntryResult!6448)

(assert (=> b!617383 (= res!397790 (or (= lt!284260 (MissingZero!6448 i!1108)) (= lt!284260 (MissingVacant!6448 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37530 (_ BitVec 32)) SeekEntryResult!6448)

(assert (=> b!617383 (= lt!284260 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!617384 () Bool)

(declare-fun e!354018 () Unit!20226)

(declare-fun Unit!20230 () Unit!20226)

(assert (=> b!617384 (= e!354018 Unit!20230)))

(declare-fun res!397778 () Bool)

(assert (=> b!617384 (= res!397778 (= (select (store (arr!18011 a!2986) i!1108 k0!1786) index!984) (select (arr!18011 a!2986) j!136)))))

(declare-fun e!354015 () Bool)

(assert (=> b!617384 (=> (not res!397778) (not e!354015))))

(assert (=> b!617384 e!354015))

(declare-fun c!70168 () Bool)

(assert (=> b!617384 (= c!70168 (bvslt j!136 index!984))))

(declare-fun lt!284251 () Unit!20226)

(assert (=> b!617384 (= lt!284251 e!354013)))

(declare-fun c!70167 () Bool)

(assert (=> b!617384 (= c!70167 (bvslt index!984 j!136))))

(declare-fun lt!284258 () Unit!20226)

(declare-fun e!354007 () Unit!20226)

(assert (=> b!617384 (= lt!284258 e!354007)))

(assert (=> b!617384 false))

(declare-fun b!617385 () Bool)

(declare-fun e!354004 () Bool)

(declare-fun e!354010 () Bool)

(assert (=> b!617385 (= e!354004 e!354010)))

(declare-fun res!397779 () Bool)

(assert (=> b!617385 (=> (not res!397779) (not e!354010))))

(declare-fun lt!284257 () SeekEntryResult!6448)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!617385 (= res!397779 (and (= lt!284257 (Found!6448 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18011 a!2986) index!984) (select (arr!18011 a!2986) j!136))) (not (= (select (arr!18011 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37530 (_ BitVec 32)) SeekEntryResult!6448)

(assert (=> b!617385 (= lt!284257 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18011 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617386 () Bool)

(declare-fun res!397793 () Bool)

(assert (=> b!617386 (=> (not res!397793) (not e!354008))))

(assert (=> b!617386 (= res!397793 (validKeyInArray!0 (select (arr!18011 a!2986) j!136)))))

(declare-fun b!617387 () Bool)

(declare-fun Unit!20231 () Unit!20226)

(assert (=> b!617387 (= e!354018 Unit!20231)))

(declare-fun e!354005 () Bool)

(declare-fun b!617388 () Bool)

(assert (=> b!617388 (= e!354005 (arrayContainsKey!0 lt!284255 (select (arr!18011 a!2986) j!136) index!984))))

(declare-fun b!617389 () Bool)

(declare-fun e!354014 () Bool)

(declare-fun lt!284250 () SeekEntryResult!6448)

(assert (=> b!617389 (= e!354014 (= lt!284257 lt!284250))))

(declare-fun b!617390 () Bool)

(declare-fun res!397785 () Bool)

(assert (=> b!617390 (=> (not res!397785) (not e!354009))))

(assert (=> b!617390 (= res!397785 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18011 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617391 () Bool)

(assert (=> b!617391 (= e!354010 (not e!354012))))

(declare-fun res!397791 () Bool)

(assert (=> b!617391 (=> res!397791 e!354012)))

(declare-fun lt!284263 () SeekEntryResult!6448)

(assert (=> b!617391 (= res!397791 (not (= lt!284263 (MissingVacant!6448 vacantSpotIndex!68))))))

(declare-fun lt!284249 () Unit!20226)

(assert (=> b!617391 (= lt!284249 e!354018)))

(declare-fun c!70170 () Bool)

(assert (=> b!617391 (= c!70170 (= lt!284263 (Found!6448 index!984)))))

(declare-fun lt!284261 () Unit!20226)

(assert (=> b!617391 (= lt!284261 e!354006)))

(declare-fun c!70169 () Bool)

(assert (=> b!617391 (= c!70169 (= lt!284263 Undefined!6448))))

(declare-fun lt!284254 () (_ BitVec 64))

(assert (=> b!617391 (= lt!284263 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284254 lt!284255 mask!3053))))

(assert (=> b!617391 e!354014))

(declare-fun res!397777 () Bool)

(assert (=> b!617391 (=> (not res!397777) (not e!354014))))

(declare-fun lt!284253 () (_ BitVec 32))

(assert (=> b!617391 (= res!397777 (= lt!284250 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284253 vacantSpotIndex!68 lt!284254 lt!284255 mask!3053)))))

(assert (=> b!617391 (= lt!284250 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284253 vacantSpotIndex!68 (select (arr!18011 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617391 (= lt!284254 (select (store (arr!18011 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284252 () Unit!20226)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37530 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20226)

(assert (=> b!617391 (= lt!284252 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284253 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617391 (= lt!284253 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!617392 () Bool)

(declare-fun res!397781 () Bool)

(assert (=> b!617392 (=> (not res!397781) (not e!354009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37530 (_ BitVec 32)) Bool)

(assert (=> b!617392 (= res!397781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!397787 () Bool)

(assert (=> start!56046 (=> (not res!397787) (not e!354008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56046 (= res!397787 (validMask!0 mask!3053))))

(assert (=> start!56046 e!354008))

(assert (=> start!56046 true))

(declare-fun array_inv!13894 (array!37530) Bool)

(assert (=> start!56046 (array_inv!13894 a!2986)))

(declare-fun b!617393 () Bool)

(declare-fun res!397780 () Bool)

(assert (=> b!617393 (= res!397780 (bvsge j!136 index!984))))

(declare-fun e!354016 () Bool)

(assert (=> b!617393 (=> res!397780 e!354016)))

(assert (=> b!617393 (= e!354015 e!354016)))

(declare-fun b!617394 () Bool)

(assert (=> b!617394 (= e!354009 e!354004)))

(declare-fun res!397788 () Bool)

(assert (=> b!617394 (=> (not res!397788) (not e!354004))))

(assert (=> b!617394 (= res!397788 (= (select (store (arr!18011 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!617394 (= lt!284255 (array!37531 (store (arr!18011 a!2986) i!1108 k0!1786) (size!18376 a!2986)))))

(declare-fun b!617395 () Bool)

(declare-fun Unit!20232 () Unit!20226)

(assert (=> b!617395 (= e!354006 Unit!20232)))

(assert (=> b!617395 false))

(declare-fun b!617396 () Bool)

(assert (=> b!617396 false))

(declare-fun lt!284247 () Unit!20226)

(assert (=> b!617396 (= lt!284247 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284255 (select (arr!18011 a!2986) j!136) index!984 Nil!12088))))

(assert (=> b!617396 (arrayNoDuplicates!0 lt!284255 index!984 Nil!12088)))

(declare-fun lt!284256 () Unit!20226)

(assert (=> b!617396 (= lt!284256 (lemmaNoDuplicateFromThenFromBigger!0 lt!284255 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617396 (arrayNoDuplicates!0 lt!284255 #b00000000000000000000000000000000 Nil!12088)))

(declare-fun lt!284259 () Unit!20226)

(assert (=> b!617396 (= lt!284259 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12088))))

(assert (=> b!617396 (arrayContainsKey!0 lt!284255 (select (arr!18011 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284262 () Unit!20226)

(assert (=> b!617396 (= lt!284262 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284255 (select (arr!18011 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354011 () Bool)

(assert (=> b!617396 e!354011))

(declare-fun res!397786 () Bool)

(assert (=> b!617396 (=> (not res!397786) (not e!354011))))

(assert (=> b!617396 (= res!397786 (arrayContainsKey!0 lt!284255 (select (arr!18011 a!2986) j!136) j!136))))

(declare-fun Unit!20233 () Unit!20226)

(assert (=> b!617396 (= e!354007 Unit!20233)))

(declare-fun b!617397 () Bool)

(declare-fun res!397784 () Bool)

(assert (=> b!617397 (= res!397784 (arrayContainsKey!0 lt!284255 (select (arr!18011 a!2986) j!136) j!136))))

(assert (=> b!617397 (=> (not res!397784) (not e!354005))))

(assert (=> b!617397 (= e!354016 e!354005)))

(declare-fun b!617398 () Bool)

(declare-fun Unit!20234 () Unit!20226)

(assert (=> b!617398 (= e!354007 Unit!20234)))

(declare-fun b!617399 () Bool)

(declare-fun res!397789 () Bool)

(assert (=> b!617399 (=> (not res!397789) (not e!354009))))

(assert (=> b!617399 (= res!397789 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12088))))

(declare-fun b!617400 () Bool)

(assert (=> b!617400 (= e!354011 (arrayContainsKey!0 lt!284255 (select (arr!18011 a!2986) j!136) index!984))))

(declare-fun b!617401 () Bool)

(declare-fun Unit!20235 () Unit!20226)

(assert (=> b!617401 (= e!354013 Unit!20235)))

(assert (= (and start!56046 res!397787) b!617382))

(assert (= (and b!617382 res!397782) b!617386))

(assert (= (and b!617386 res!397793) b!617381))

(assert (= (and b!617381 res!397792) b!617379))

(assert (= (and b!617379 res!397783) b!617383))

(assert (= (and b!617383 res!397790) b!617392))

(assert (= (and b!617392 res!397781) b!617399))

(assert (= (and b!617399 res!397789) b!617390))

(assert (= (and b!617390 res!397785) b!617394))

(assert (= (and b!617394 res!397788) b!617385))

(assert (= (and b!617385 res!397779) b!617391))

(assert (= (and b!617391 res!397777) b!617389))

(assert (= (and b!617391 c!70169) b!617395))

(assert (= (and b!617391 (not c!70169)) b!617380))

(assert (= (and b!617391 c!70170) b!617384))

(assert (= (and b!617391 (not c!70170)) b!617387))

(assert (= (and b!617384 res!397778) b!617393))

(assert (= (and b!617393 (not res!397780)) b!617397))

(assert (= (and b!617397 res!397784) b!617388))

(assert (= (and b!617384 c!70168) b!617377))

(assert (= (and b!617384 (not c!70168)) b!617401))

(assert (= (and b!617384 c!70167) b!617396))

(assert (= (and b!617384 (not c!70167)) b!617398))

(assert (= (and b!617396 res!397786) b!617400))

(assert (= (and b!617391 (not res!397791)) b!617378))

(declare-fun m!592969 () Bool)

(assert (=> b!617377 m!592969))

(declare-fun m!592971 () Bool)

(assert (=> b!617377 m!592971))

(assert (=> b!617377 m!592969))

(declare-fun m!592973 () Bool)

(assert (=> b!617377 m!592973))

(declare-fun m!592975 () Bool)

(assert (=> b!617377 m!592975))

(assert (=> b!617377 m!592969))

(declare-fun m!592977 () Bool)

(assert (=> b!617377 m!592977))

(assert (=> b!617377 m!592969))

(declare-fun m!592979 () Bool)

(assert (=> b!617377 m!592979))

(declare-fun m!592981 () Bool)

(assert (=> b!617377 m!592981))

(declare-fun m!592983 () Bool)

(assert (=> b!617377 m!592983))

(declare-fun m!592985 () Bool)

(assert (=> start!56046 m!592985))

(declare-fun m!592987 () Bool)

(assert (=> start!56046 m!592987))

(declare-fun m!592989 () Bool)

(assert (=> b!617391 m!592989))

(declare-fun m!592991 () Bool)

(assert (=> b!617391 m!592991))

(declare-fun m!592993 () Bool)

(assert (=> b!617391 m!592993))

(assert (=> b!617391 m!592969))

(declare-fun m!592995 () Bool)

(assert (=> b!617391 m!592995))

(declare-fun m!592997 () Bool)

(assert (=> b!617391 m!592997))

(declare-fun m!592999 () Bool)

(assert (=> b!617391 m!592999))

(assert (=> b!617391 m!592969))

(declare-fun m!593001 () Bool)

(assert (=> b!617391 m!593001))

(declare-fun m!593003 () Bool)

(assert (=> b!617399 m!593003))

(declare-fun m!593005 () Bool)

(assert (=> b!617390 m!593005))

(declare-fun m!593007 () Bool)

(assert (=> b!617383 m!593007))

(declare-fun m!593009 () Bool)

(assert (=> b!617385 m!593009))

(assert (=> b!617385 m!592969))

(assert (=> b!617385 m!592969))

(declare-fun m!593011 () Bool)

(assert (=> b!617385 m!593011))

(declare-fun m!593013 () Bool)

(assert (=> b!617381 m!593013))

(assert (=> b!617378 m!592995))

(declare-fun m!593015 () Bool)

(assert (=> b!617378 m!593015))

(assert (=> b!617397 m!592969))

(assert (=> b!617397 m!592969))

(declare-fun m!593017 () Bool)

(assert (=> b!617397 m!593017))

(assert (=> b!617394 m!592995))

(declare-fun m!593019 () Bool)

(assert (=> b!617394 m!593019))

(assert (=> b!617386 m!592969))

(assert (=> b!617386 m!592969))

(declare-fun m!593021 () Bool)

(assert (=> b!617386 m!593021))

(assert (=> b!617388 m!592969))

(assert (=> b!617388 m!592969))

(declare-fun m!593023 () Bool)

(assert (=> b!617388 m!593023))

(assert (=> b!617384 m!592995))

(assert (=> b!617384 m!593015))

(assert (=> b!617384 m!592969))

(assert (=> b!617396 m!592969))

(assert (=> b!617396 m!592969))

(declare-fun m!593025 () Bool)

(assert (=> b!617396 m!593025))

(assert (=> b!617396 m!592975))

(assert (=> b!617396 m!592969))

(declare-fun m!593027 () Bool)

(assert (=> b!617396 m!593027))

(declare-fun m!593029 () Bool)

(assert (=> b!617396 m!593029))

(declare-fun m!593031 () Bool)

(assert (=> b!617396 m!593031))

(assert (=> b!617396 m!592983))

(assert (=> b!617396 m!592969))

(assert (=> b!617396 m!593017))

(assert (=> b!617396 m!592969))

(declare-fun m!593033 () Bool)

(assert (=> b!617396 m!593033))

(declare-fun m!593035 () Bool)

(assert (=> b!617392 m!593035))

(assert (=> b!617400 m!592969))

(assert (=> b!617400 m!592969))

(assert (=> b!617400 m!593023))

(declare-fun m!593037 () Bool)

(assert (=> b!617379 m!593037))

(check-sat (not start!56046) (not b!617396) (not b!617399) (not b!617379) (not b!617383) (not b!617392) (not b!617377) (not b!617397) (not b!617391) (not b!617388) (not b!617385) (not b!617400) (not b!617381) (not b!617386))
(check-sat)
