; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56016 () Bool)

(assert start!56016)

(declare-fun b!616252 () Bool)

(declare-fun e!353330 () Bool)

(declare-fun e!353334 () Bool)

(assert (=> b!616252 (= e!353330 (not e!353334))))

(declare-fun res!397019 () Bool)

(assert (=> b!616252 (=> res!397019 e!353334)))

(declare-datatypes ((SeekEntryResult!6433 0))(
  ( (MissingZero!6433 (index!28016 (_ BitVec 32))) (Found!6433 (index!28017 (_ BitVec 32))) (Intermediate!6433 (undefined!7245 Bool) (index!28018 (_ BitVec 32)) (x!56820 (_ BitVec 32))) (Undefined!6433) (MissingVacant!6433 (index!28019 (_ BitVec 32))) )
))
(declare-fun lt!283356 () SeekEntryResult!6433)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!616252 (= res!397019 (not (= lt!283356 (MissingVacant!6433 vacantSpotIndex!68))))))

(declare-datatypes ((Unit!20076 0))(
  ( (Unit!20077) )
))
(declare-fun lt!283354 () Unit!20076)

(declare-fun e!353343 () Unit!20076)

(assert (=> b!616252 (= lt!283354 e!353343)))

(declare-fun c!69988 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!616252 (= c!69988 (= lt!283356 (Found!6433 index!984)))))

(declare-fun lt!283360 () Unit!20076)

(declare-fun e!353336 () Unit!20076)

(assert (=> b!616252 (= lt!283360 e!353336)))

(declare-fun c!69990 () Bool)

(assert (=> b!616252 (= c!69990 (= lt!283356 Undefined!6433))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!283353 () (_ BitVec 64))

(declare-datatypes ((array!37500 0))(
  ( (array!37501 (arr!17996 (Array (_ BitVec 32) (_ BitVec 64))) (size!18361 (_ BitVec 32))) )
))
(declare-fun lt!283347 () array!37500)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37500 (_ BitVec 32)) SeekEntryResult!6433)

(assert (=> b!616252 (= lt!283356 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283353 lt!283347 mask!3053))))

(declare-fun e!353329 () Bool)

(assert (=> b!616252 e!353329))

(declare-fun res!397015 () Bool)

(assert (=> b!616252 (=> (not res!397015) (not e!353329))))

(declare-fun lt!283346 () SeekEntryResult!6433)

(declare-fun lt!283349 () (_ BitVec 32))

(assert (=> b!616252 (= res!397015 (= lt!283346 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283349 vacantSpotIndex!68 lt!283353 lt!283347 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37500)

(assert (=> b!616252 (= lt!283346 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283349 vacantSpotIndex!68 (select (arr!17996 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!616252 (= lt!283353 (select (store (arr!17996 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!283350 () Unit!20076)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37500 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20076)

(assert (=> b!616252 (= lt!283350 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283349 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616252 (= lt!283349 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!616253 () Bool)

(declare-fun res!397022 () Bool)

(assert (=> b!616253 (= res!397022 (bvsge j!136 index!984))))

(declare-fun e!353342 () Bool)

(assert (=> b!616253 (=> res!397022 e!353342)))

(declare-fun e!353337 () Bool)

(assert (=> b!616253 (= e!353337 e!353342)))

(declare-fun b!616254 () Bool)

(declare-fun res!397021 () Bool)

(declare-fun e!353339 () Bool)

(assert (=> b!616254 (=> (not res!397021) (not e!353339))))

(declare-fun arrayContainsKey!0 (array!37500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616254 (= res!397021 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616255 () Bool)

(assert (=> b!616255 (= e!353334 true)))

(assert (=> b!616255 (= (select (store (arr!17996 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!616256 () Bool)

(declare-fun e!353341 () Bool)

(assert (=> b!616256 (= e!353341 e!353330)))

(declare-fun res!397020 () Bool)

(assert (=> b!616256 (=> (not res!397020) (not e!353330))))

(declare-fun lt!283352 () SeekEntryResult!6433)

(assert (=> b!616256 (= res!397020 (and (= lt!283352 (Found!6433 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17996 a!2986) index!984) (select (arr!17996 a!2986) j!136))) (not (= (select (arr!17996 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!616256 (= lt!283352 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17996 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616257 () Bool)

(declare-fun res!397027 () Bool)

(assert (=> b!616257 (=> (not res!397027) (not e!353339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616257 (= res!397027 (validKeyInArray!0 (select (arr!17996 a!2986) j!136)))))

(declare-fun b!616258 () Bool)

(assert (=> b!616258 false))

(declare-fun lt!283363 () Unit!20076)

(declare-datatypes ((List!12076 0))(
  ( (Nil!12073) (Cons!12072 (h!13117 (_ BitVec 64)) (t!18295 List!12076)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37500 (_ BitVec 64) (_ BitVec 32) List!12076) Unit!20076)

(assert (=> b!616258 (= lt!283363 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283347 (select (arr!17996 a!2986) j!136) j!136 Nil!12073))))

(declare-fun arrayNoDuplicates!0 (array!37500 (_ BitVec 32) List!12076) Bool)

(assert (=> b!616258 (arrayNoDuplicates!0 lt!283347 j!136 Nil!12073)))

(declare-fun lt!283351 () Unit!20076)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37500 (_ BitVec 32) (_ BitVec 32)) Unit!20076)

(assert (=> b!616258 (= lt!283351 (lemmaNoDuplicateFromThenFromBigger!0 lt!283347 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616258 (arrayNoDuplicates!0 lt!283347 #b00000000000000000000000000000000 Nil!12073)))

(declare-fun lt!283345 () Unit!20076)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37500 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12076) Unit!20076)

(assert (=> b!616258 (= lt!283345 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12073))))

(assert (=> b!616258 (arrayContainsKey!0 lt!283347 (select (arr!17996 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283361 () Unit!20076)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37500 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20076)

(assert (=> b!616258 (= lt!283361 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283347 (select (arr!17996 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!353335 () Unit!20076)

(declare-fun Unit!20078 () Unit!20076)

(assert (=> b!616258 (= e!353335 Unit!20078)))

(declare-fun b!616259 () Bool)

(declare-fun e!353340 () Bool)

(assert (=> b!616259 (= e!353339 e!353340)))

(declare-fun res!397023 () Bool)

(assert (=> b!616259 (=> (not res!397023) (not e!353340))))

(declare-fun lt!283348 () SeekEntryResult!6433)

(assert (=> b!616259 (= res!397023 (or (= lt!283348 (MissingZero!6433 i!1108)) (= lt!283348 (MissingVacant!6433 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37500 (_ BitVec 32)) SeekEntryResult!6433)

(assert (=> b!616259 (= lt!283348 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!616260 () Bool)

(declare-fun res!397012 () Bool)

(assert (=> b!616260 (=> (not res!397012) (not e!353339))))

(assert (=> b!616260 (= res!397012 (validKeyInArray!0 k0!1786))))

(declare-fun b!616261 () Bool)

(declare-fun Unit!20079 () Unit!20076)

(assert (=> b!616261 (= e!353343 Unit!20079)))

(declare-fun b!616262 () Bool)

(declare-fun res!397025 () Bool)

(assert (=> b!616262 (=> (not res!397025) (not e!353340))))

(assert (=> b!616262 (= res!397025 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17996 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616263 () Bool)

(declare-fun res!397016 () Bool)

(assert (=> b!616263 (=> (not res!397016) (not e!353339))))

(assert (=> b!616263 (= res!397016 (and (= (size!18361 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18361 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18361 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616264 () Bool)

(declare-fun Unit!20080 () Unit!20076)

(assert (=> b!616264 (= e!353335 Unit!20080)))

(declare-fun e!353331 () Bool)

(declare-fun b!616265 () Bool)

(assert (=> b!616265 (= e!353331 (arrayContainsKey!0 lt!283347 (select (arr!17996 a!2986) j!136) index!984))))

(declare-fun b!616266 () Bool)

(declare-fun e!353332 () Unit!20076)

(declare-fun Unit!20081 () Unit!20076)

(assert (=> b!616266 (= e!353332 Unit!20081)))

(declare-fun b!616267 () Bool)

(declare-fun Unit!20082 () Unit!20076)

(assert (=> b!616267 (= e!353343 Unit!20082)))

(declare-fun res!397013 () Bool)

(assert (=> b!616267 (= res!397013 (= (select (store (arr!17996 a!2986) i!1108 k0!1786) index!984) (select (arr!17996 a!2986) j!136)))))

(assert (=> b!616267 (=> (not res!397013) (not e!353337))))

(assert (=> b!616267 e!353337))

(declare-fun c!69987 () Bool)

(assert (=> b!616267 (= c!69987 (bvslt j!136 index!984))))

(declare-fun lt!283358 () Unit!20076)

(assert (=> b!616267 (= lt!283358 e!353335)))

(declare-fun c!69989 () Bool)

(assert (=> b!616267 (= c!69989 (bvslt index!984 j!136))))

(declare-fun lt!283359 () Unit!20076)

(assert (=> b!616267 (= lt!283359 e!353332)))

(assert (=> b!616267 false))

(declare-fun b!616268 () Bool)

(declare-fun res!397014 () Bool)

(assert (=> b!616268 (= res!397014 (arrayContainsKey!0 lt!283347 (select (arr!17996 a!2986) j!136) j!136))))

(declare-fun e!353333 () Bool)

(assert (=> b!616268 (=> (not res!397014) (not e!353333))))

(assert (=> b!616268 (= e!353342 e!353333)))

(declare-fun b!616269 () Bool)

(declare-fun res!397018 () Bool)

(assert (=> b!616269 (=> (not res!397018) (not e!353340))))

(assert (=> b!616269 (= res!397018 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12073))))

(declare-fun b!616270 () Bool)

(declare-fun Unit!20083 () Unit!20076)

(assert (=> b!616270 (= e!353336 Unit!20083)))

(assert (=> b!616270 false))

(declare-fun b!616271 () Bool)

(assert (=> b!616271 (= e!353333 (arrayContainsKey!0 lt!283347 (select (arr!17996 a!2986) j!136) index!984))))

(declare-fun b!616272 () Bool)

(assert (=> b!616272 (= e!353340 e!353341)))

(declare-fun res!397028 () Bool)

(assert (=> b!616272 (=> (not res!397028) (not e!353341))))

(assert (=> b!616272 (= res!397028 (= (select (store (arr!17996 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616272 (= lt!283347 (array!37501 (store (arr!17996 a!2986) i!1108 k0!1786) (size!18361 a!2986)))))

(declare-fun b!616273 () Bool)

(declare-fun res!397017 () Bool)

(assert (=> b!616273 (=> (not res!397017) (not e!353340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37500 (_ BitVec 32)) Bool)

(assert (=> b!616273 (= res!397017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616274 () Bool)

(assert (=> b!616274 (= e!353329 (= lt!283352 lt!283346))))

(declare-fun b!616276 () Bool)

(assert (=> b!616276 false))

(declare-fun lt!283344 () Unit!20076)

(assert (=> b!616276 (= lt!283344 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283347 (select (arr!17996 a!2986) j!136) index!984 Nil!12073))))

(assert (=> b!616276 (arrayNoDuplicates!0 lt!283347 index!984 Nil!12073)))

(declare-fun lt!283355 () Unit!20076)

(assert (=> b!616276 (= lt!283355 (lemmaNoDuplicateFromThenFromBigger!0 lt!283347 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616276 (arrayNoDuplicates!0 lt!283347 #b00000000000000000000000000000000 Nil!12073)))

(declare-fun lt!283357 () Unit!20076)

(assert (=> b!616276 (= lt!283357 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12073))))

(assert (=> b!616276 (arrayContainsKey!0 lt!283347 (select (arr!17996 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283362 () Unit!20076)

(assert (=> b!616276 (= lt!283362 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283347 (select (arr!17996 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!616276 e!353331))

(declare-fun res!397026 () Bool)

(assert (=> b!616276 (=> (not res!397026) (not e!353331))))

(assert (=> b!616276 (= res!397026 (arrayContainsKey!0 lt!283347 (select (arr!17996 a!2986) j!136) j!136))))

(declare-fun Unit!20084 () Unit!20076)

(assert (=> b!616276 (= e!353332 Unit!20084)))

(declare-fun res!397024 () Bool)

(assert (=> start!56016 (=> (not res!397024) (not e!353339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56016 (= res!397024 (validMask!0 mask!3053))))

(assert (=> start!56016 e!353339))

(assert (=> start!56016 true))

(declare-fun array_inv!13879 (array!37500) Bool)

(assert (=> start!56016 (array_inv!13879 a!2986)))

(declare-fun b!616275 () Bool)

(declare-fun Unit!20085 () Unit!20076)

(assert (=> b!616275 (= e!353336 Unit!20085)))

(assert (= (and start!56016 res!397024) b!616263))

(assert (= (and b!616263 res!397016) b!616257))

(assert (= (and b!616257 res!397027) b!616260))

(assert (= (and b!616260 res!397012) b!616254))

(assert (= (and b!616254 res!397021) b!616259))

(assert (= (and b!616259 res!397023) b!616273))

(assert (= (and b!616273 res!397017) b!616269))

(assert (= (and b!616269 res!397018) b!616262))

(assert (= (and b!616262 res!397025) b!616272))

(assert (= (and b!616272 res!397028) b!616256))

(assert (= (and b!616256 res!397020) b!616252))

(assert (= (and b!616252 res!397015) b!616274))

(assert (= (and b!616252 c!69990) b!616270))

(assert (= (and b!616252 (not c!69990)) b!616275))

(assert (= (and b!616252 c!69988) b!616267))

(assert (= (and b!616252 (not c!69988)) b!616261))

(assert (= (and b!616267 res!397013) b!616253))

(assert (= (and b!616253 (not res!397022)) b!616268))

(assert (= (and b!616268 res!397014) b!616271))

(assert (= (and b!616267 c!69987) b!616258))

(assert (= (and b!616267 (not c!69987)) b!616264))

(assert (= (and b!616267 c!69989) b!616276))

(assert (= (and b!616267 (not c!69989)) b!616266))

(assert (= (and b!616276 res!397026) b!616265))

(assert (= (and b!616252 (not res!397019)) b!616255))

(declare-fun m!591919 () Bool)

(assert (=> b!616255 m!591919))

(declare-fun m!591921 () Bool)

(assert (=> b!616255 m!591921))

(declare-fun m!591923 () Bool)

(assert (=> b!616262 m!591923))

(declare-fun m!591925 () Bool)

(assert (=> b!616265 m!591925))

(assert (=> b!616265 m!591925))

(declare-fun m!591927 () Bool)

(assert (=> b!616265 m!591927))

(assert (=> b!616276 m!591925))

(declare-fun m!591929 () Bool)

(assert (=> b!616276 m!591929))

(assert (=> b!616276 m!591925))

(declare-fun m!591931 () Bool)

(assert (=> b!616276 m!591931))

(declare-fun m!591933 () Bool)

(assert (=> b!616276 m!591933))

(assert (=> b!616276 m!591925))

(declare-fun m!591935 () Bool)

(assert (=> b!616276 m!591935))

(declare-fun m!591937 () Bool)

(assert (=> b!616276 m!591937))

(assert (=> b!616276 m!591925))

(assert (=> b!616276 m!591925))

(declare-fun m!591939 () Bool)

(assert (=> b!616276 m!591939))

(declare-fun m!591941 () Bool)

(assert (=> b!616276 m!591941))

(declare-fun m!591943 () Bool)

(assert (=> b!616276 m!591943))

(assert (=> b!616267 m!591919))

(assert (=> b!616267 m!591921))

(assert (=> b!616267 m!591925))

(assert (=> b!616268 m!591925))

(assert (=> b!616268 m!591925))

(assert (=> b!616268 m!591939))

(declare-fun m!591945 () Bool)

(assert (=> b!616273 m!591945))

(assert (=> b!616272 m!591919))

(declare-fun m!591947 () Bool)

(assert (=> b!616272 m!591947))

(declare-fun m!591949 () Bool)

(assert (=> b!616269 m!591949))

(assert (=> b!616257 m!591925))

(assert (=> b!616257 m!591925))

(declare-fun m!591951 () Bool)

(assert (=> b!616257 m!591951))

(declare-fun m!591953 () Bool)

(assert (=> start!56016 m!591953))

(declare-fun m!591955 () Bool)

(assert (=> start!56016 m!591955))

(declare-fun m!591957 () Bool)

(assert (=> b!616258 m!591957))

(assert (=> b!616258 m!591925))

(assert (=> b!616258 m!591925))

(declare-fun m!591959 () Bool)

(assert (=> b!616258 m!591959))

(declare-fun m!591961 () Bool)

(assert (=> b!616258 m!591961))

(assert (=> b!616258 m!591933))

(assert (=> b!616258 m!591925))

(declare-fun m!591963 () Bool)

(assert (=> b!616258 m!591963))

(assert (=> b!616258 m!591925))

(declare-fun m!591965 () Bool)

(assert (=> b!616258 m!591965))

(assert (=> b!616258 m!591943))

(declare-fun m!591967 () Bool)

(assert (=> b!616260 m!591967))

(assert (=> b!616271 m!591925))

(assert (=> b!616271 m!591925))

(assert (=> b!616271 m!591927))

(declare-fun m!591969 () Bool)

(assert (=> b!616252 m!591969))

(declare-fun m!591971 () Bool)

(assert (=> b!616252 m!591971))

(declare-fun m!591973 () Bool)

(assert (=> b!616252 m!591973))

(declare-fun m!591975 () Bool)

(assert (=> b!616252 m!591975))

(assert (=> b!616252 m!591925))

(declare-fun m!591977 () Bool)

(assert (=> b!616252 m!591977))

(assert (=> b!616252 m!591925))

(declare-fun m!591979 () Bool)

(assert (=> b!616252 m!591979))

(assert (=> b!616252 m!591919))

(declare-fun m!591981 () Bool)

(assert (=> b!616254 m!591981))

(declare-fun m!591983 () Bool)

(assert (=> b!616256 m!591983))

(assert (=> b!616256 m!591925))

(assert (=> b!616256 m!591925))

(declare-fun m!591985 () Bool)

(assert (=> b!616256 m!591985))

(declare-fun m!591987 () Bool)

(assert (=> b!616259 m!591987))

(check-sat (not b!616260) (not b!616276) (not b!616265) (not b!616256) (not b!616269) (not b!616271) (not b!616258) (not b!616257) (not b!616273) (not b!616252) (not b!616268) (not b!616254) (not b!616259) (not start!56016))
(check-sat)
