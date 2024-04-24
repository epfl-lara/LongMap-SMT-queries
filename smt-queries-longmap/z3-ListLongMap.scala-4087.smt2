; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56070 () Bool)

(assert start!56070)

(declare-fun b!616289 () Bool)

(declare-fun res!396950 () Bool)

(declare-fun e!353380 () Bool)

(assert (=> b!616289 (=> (not res!396950) (not e!353380))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616289 (= res!396950 (validKeyInArray!0 k0!1786))))

(declare-fun b!616290 () Bool)

(declare-fun res!396958 () Bool)

(declare-fun e!353382 () Bool)

(assert (=> b!616290 (=> (not res!396958) (not e!353382))))

(declare-datatypes ((array!37485 0))(
  ( (array!37486 (arr!17986 (Array (_ BitVec 32) (_ BitVec 64))) (size!18350 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37485)

(declare-datatypes ((List!11934 0))(
  ( (Nil!11931) (Cons!11930 (h!12978 (_ BitVec 64)) (t!18154 List!11934)) )
))
(declare-fun arrayNoDuplicates!0 (array!37485 (_ BitVec 32) List!11934) Bool)

(assert (=> b!616290 (= res!396958 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11931))))

(declare-fun b!616291 () Bool)

(declare-fun res!396957 () Bool)

(assert (=> b!616291 (=> (not res!396957) (not e!353380))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!616291 (= res!396957 (and (= (size!18350 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18350 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18350 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616292 () Bool)

(assert (=> b!616292 (= e!353380 e!353382)))

(declare-fun res!396954 () Bool)

(assert (=> b!616292 (=> (not res!396954) (not e!353382))))

(declare-datatypes ((SeekEntryResult!6382 0))(
  ( (MissingZero!6382 (index!27812 (_ BitVec 32))) (Found!6382 (index!27813 (_ BitVec 32))) (Intermediate!6382 (undefined!7194 Bool) (index!27814 (_ BitVec 32)) (x!56761 (_ BitVec 32))) (Undefined!6382) (MissingVacant!6382 (index!27815 (_ BitVec 32))) )
))
(declare-fun lt!283328 () SeekEntryResult!6382)

(assert (=> b!616292 (= res!396954 (or (= lt!283328 (MissingZero!6382 i!1108)) (= lt!283328 (MissingVacant!6382 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37485 (_ BitVec 32)) SeekEntryResult!6382)

(assert (=> b!616292 (= lt!283328 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!616293 () Bool)

(declare-datatypes ((Unit!20017 0))(
  ( (Unit!20018) )
))
(declare-fun e!353381 () Unit!20017)

(declare-fun Unit!20019 () Unit!20017)

(assert (=> b!616293 (= e!353381 Unit!20019)))

(declare-fun b!616294 () Bool)

(declare-fun e!353375 () Unit!20017)

(declare-fun Unit!20020 () Unit!20017)

(assert (=> b!616294 (= e!353375 Unit!20020)))

(declare-fun lt!283331 () array!37485)

(declare-fun b!616295 () Bool)

(declare-fun res!396956 () Bool)

(declare-fun arrayContainsKey!0 (array!37485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616295 (= res!396956 (arrayContainsKey!0 lt!283331 (select (arr!17986 a!2986) j!136) j!136))))

(declare-fun e!353374 () Bool)

(assert (=> b!616295 (=> (not res!396956) (not e!353374))))

(declare-fun e!353370 () Bool)

(assert (=> b!616295 (= e!353370 e!353374)))

(declare-fun b!616296 () Bool)

(declare-fun e!353378 () Unit!20017)

(declare-fun Unit!20021 () Unit!20017)

(assert (=> b!616296 (= e!353378 Unit!20021)))

(declare-fun b!616297 () Bool)

(declare-fun e!353372 () Unit!20017)

(declare-fun Unit!20022 () Unit!20017)

(assert (=> b!616297 (= e!353372 Unit!20022)))

(declare-fun b!616298 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!616298 (= e!353374 (arrayContainsKey!0 lt!283331 (select (arr!17986 a!2986) j!136) index!984))))

(declare-fun b!616299 () Bool)

(assert (=> b!616299 false))

(declare-fun lt!283338 () Unit!20017)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37485 (_ BitVec 64) (_ BitVec 32) List!11934) Unit!20017)

(assert (=> b!616299 (= lt!283338 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283331 (select (arr!17986 a!2986) j!136) index!984 Nil!11931))))

(assert (=> b!616299 (arrayNoDuplicates!0 lt!283331 index!984 Nil!11931)))

(declare-fun lt!283320 () Unit!20017)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37485 (_ BitVec 32) (_ BitVec 32)) Unit!20017)

(assert (=> b!616299 (= lt!283320 (lemmaNoDuplicateFromThenFromBigger!0 lt!283331 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616299 (arrayNoDuplicates!0 lt!283331 #b00000000000000000000000000000000 Nil!11931)))

(declare-fun lt!283323 () Unit!20017)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37485 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11934) Unit!20017)

(assert (=> b!616299 (= lt!283323 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11931))))

(assert (=> b!616299 (arrayContainsKey!0 lt!283331 (select (arr!17986 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283321 () Unit!20017)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37485 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20017)

(assert (=> b!616299 (= lt!283321 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283331 (select (arr!17986 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353379 () Bool)

(assert (=> b!616299 e!353379))

(declare-fun res!396961 () Bool)

(assert (=> b!616299 (=> (not res!396961) (not e!353379))))

(assert (=> b!616299 (= res!396961 (arrayContainsKey!0 lt!283331 (select (arr!17986 a!2986) j!136) j!136))))

(declare-fun Unit!20023 () Unit!20017)

(assert (=> b!616299 (= e!353372 Unit!20023)))

(declare-fun b!616301 () Bool)

(declare-fun res!396960 () Bool)

(assert (=> b!616301 (=> (not res!396960) (not e!353380))))

(assert (=> b!616301 (= res!396960 (validKeyInArray!0 (select (arr!17986 a!2986) j!136)))))

(declare-fun b!616302 () Bool)

(declare-fun e!353371 () Bool)

(declare-fun e!353377 () Bool)

(assert (=> b!616302 (= e!353371 e!353377)))

(declare-fun res!396959 () Bool)

(assert (=> b!616302 (=> (not res!396959) (not e!353377))))

(declare-fun lt!283337 () SeekEntryResult!6382)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!616302 (= res!396959 (and (= lt!283337 (Found!6382 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17986 a!2986) index!984) (select (arr!17986 a!2986) j!136))) (not (= (select (arr!17986 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37485 (_ BitVec 32)) SeekEntryResult!6382)

(assert (=> b!616302 (= lt!283337 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17986 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616303 () Bool)

(declare-fun res!396949 () Bool)

(assert (=> b!616303 (= res!396949 (bvsge j!136 index!984))))

(assert (=> b!616303 (=> res!396949 e!353370)))

(declare-fun e!353376 () Bool)

(assert (=> b!616303 (= e!353376 e!353370)))

(declare-fun b!616304 () Bool)

(declare-fun Unit!20024 () Unit!20017)

(assert (=> b!616304 (= e!353378 Unit!20024)))

(assert (=> b!616304 false))

(declare-fun b!616305 () Bool)

(declare-fun res!396951 () Bool)

(assert (=> b!616305 (=> (not res!396951) (not e!353382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37485 (_ BitVec 32)) Bool)

(assert (=> b!616305 (= res!396951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616306 () Bool)

(declare-fun Unit!20025 () Unit!20017)

(assert (=> b!616306 (= e!353375 Unit!20025)))

(declare-fun res!396948 () Bool)

(assert (=> b!616306 (= res!396948 (= (select (store (arr!17986 a!2986) i!1108 k0!1786) index!984) (select (arr!17986 a!2986) j!136)))))

(assert (=> b!616306 (=> (not res!396948) (not e!353376))))

(assert (=> b!616306 e!353376))

(declare-fun c!70040 () Bool)

(assert (=> b!616306 (= c!70040 (bvslt j!136 index!984))))

(declare-fun lt!283324 () Unit!20017)

(assert (=> b!616306 (= lt!283324 e!353381)))

(declare-fun c!70042 () Bool)

(assert (=> b!616306 (= c!70042 (bvslt index!984 j!136))))

(declare-fun lt!283326 () Unit!20017)

(assert (=> b!616306 (= lt!283326 e!353372)))

(assert (=> b!616306 false))

(declare-fun b!616307 () Bool)

(declare-fun res!396953 () Bool)

(assert (=> b!616307 (=> (not res!396953) (not e!353380))))

(assert (=> b!616307 (= res!396953 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616308 () Bool)

(assert (=> b!616308 false))

(declare-fun lt!283327 () Unit!20017)

(assert (=> b!616308 (= lt!283327 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283331 (select (arr!17986 a!2986) j!136) j!136 Nil!11931))))

(assert (=> b!616308 (arrayNoDuplicates!0 lt!283331 j!136 Nil!11931)))

(declare-fun lt!283334 () Unit!20017)

(assert (=> b!616308 (= lt!283334 (lemmaNoDuplicateFromThenFromBigger!0 lt!283331 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616308 (arrayNoDuplicates!0 lt!283331 #b00000000000000000000000000000000 Nil!11931)))

(declare-fun lt!283333 () Unit!20017)

(assert (=> b!616308 (= lt!283333 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11931))))

(assert (=> b!616308 (arrayContainsKey!0 lt!283331 (select (arr!17986 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283322 () Unit!20017)

(assert (=> b!616308 (= lt!283322 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283331 (select (arr!17986 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20026 () Unit!20017)

(assert (=> b!616308 (= e!353381 Unit!20026)))

(declare-fun b!616309 () Bool)

(declare-fun res!396947 () Bool)

(assert (=> b!616309 (=> (not res!396947) (not e!353382))))

(assert (=> b!616309 (= res!396947 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17986 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616310 () Bool)

(assert (=> b!616310 (= e!353377 (not true))))

(declare-fun lt!283336 () Unit!20017)

(assert (=> b!616310 (= lt!283336 e!353375)))

(declare-fun c!70041 () Bool)

(declare-fun lt!283339 () SeekEntryResult!6382)

(assert (=> b!616310 (= c!70041 (= lt!283339 (Found!6382 index!984)))))

(declare-fun lt!283330 () Unit!20017)

(assert (=> b!616310 (= lt!283330 e!353378)))

(declare-fun c!70043 () Bool)

(assert (=> b!616310 (= c!70043 (= lt!283339 Undefined!6382))))

(declare-fun lt!283332 () (_ BitVec 64))

(assert (=> b!616310 (= lt!283339 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283332 lt!283331 mask!3053))))

(declare-fun e!353369 () Bool)

(assert (=> b!616310 e!353369))

(declare-fun res!396952 () Bool)

(assert (=> b!616310 (=> (not res!396952) (not e!353369))))

(declare-fun lt!283325 () SeekEntryResult!6382)

(declare-fun lt!283335 () (_ BitVec 32))

(assert (=> b!616310 (= res!396952 (= lt!283325 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283335 vacantSpotIndex!68 lt!283332 lt!283331 mask!3053)))))

(assert (=> b!616310 (= lt!283325 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283335 vacantSpotIndex!68 (select (arr!17986 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616310 (= lt!283332 (select (store (arr!17986 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!283329 () Unit!20017)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37485 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20017)

(assert (=> b!616310 (= lt!283329 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283335 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616310 (= lt!283335 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!616311 () Bool)

(assert (=> b!616311 (= e!353382 e!353371)))

(declare-fun res!396946 () Bool)

(assert (=> b!616311 (=> (not res!396946) (not e!353371))))

(assert (=> b!616311 (= res!396946 (= (select (store (arr!17986 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616311 (= lt!283331 (array!37486 (store (arr!17986 a!2986) i!1108 k0!1786) (size!18350 a!2986)))))

(declare-fun b!616312 () Bool)

(assert (=> b!616312 (= e!353369 (= lt!283337 lt!283325))))

(declare-fun res!396955 () Bool)

(assert (=> start!56070 (=> (not res!396955) (not e!353380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56070 (= res!396955 (validMask!0 mask!3053))))

(assert (=> start!56070 e!353380))

(assert (=> start!56070 true))

(declare-fun array_inv!13845 (array!37485) Bool)

(assert (=> start!56070 (array_inv!13845 a!2986)))

(declare-fun b!616300 () Bool)

(assert (=> b!616300 (= e!353379 (arrayContainsKey!0 lt!283331 (select (arr!17986 a!2986) j!136) index!984))))

(assert (= (and start!56070 res!396955) b!616291))

(assert (= (and b!616291 res!396957) b!616301))

(assert (= (and b!616301 res!396960) b!616289))

(assert (= (and b!616289 res!396950) b!616307))

(assert (= (and b!616307 res!396953) b!616292))

(assert (= (and b!616292 res!396954) b!616305))

(assert (= (and b!616305 res!396951) b!616290))

(assert (= (and b!616290 res!396958) b!616309))

(assert (= (and b!616309 res!396947) b!616311))

(assert (= (and b!616311 res!396946) b!616302))

(assert (= (and b!616302 res!396959) b!616310))

(assert (= (and b!616310 res!396952) b!616312))

(assert (= (and b!616310 c!70043) b!616304))

(assert (= (and b!616310 (not c!70043)) b!616296))

(assert (= (and b!616310 c!70041) b!616306))

(assert (= (and b!616310 (not c!70041)) b!616294))

(assert (= (and b!616306 res!396948) b!616303))

(assert (= (and b!616303 (not res!396949)) b!616295))

(assert (= (and b!616295 res!396956) b!616298))

(assert (= (and b!616306 c!70040) b!616308))

(assert (= (and b!616306 (not c!70040)) b!616293))

(assert (= (and b!616306 c!70042) b!616299))

(assert (= (and b!616306 (not c!70042)) b!616297))

(assert (= (and b!616299 res!396961) b!616300))

(declare-fun m!592751 () Bool)

(assert (=> start!56070 m!592751))

(declare-fun m!592753 () Bool)

(assert (=> start!56070 m!592753))

(declare-fun m!592755 () Bool)

(assert (=> b!616308 m!592755))

(declare-fun m!592757 () Bool)

(assert (=> b!616308 m!592757))

(assert (=> b!616308 m!592757))

(declare-fun m!592759 () Bool)

(assert (=> b!616308 m!592759))

(declare-fun m!592761 () Bool)

(assert (=> b!616308 m!592761))

(assert (=> b!616308 m!592757))

(declare-fun m!592763 () Bool)

(assert (=> b!616308 m!592763))

(assert (=> b!616308 m!592757))

(declare-fun m!592765 () Bool)

(assert (=> b!616308 m!592765))

(declare-fun m!592767 () Bool)

(assert (=> b!616308 m!592767))

(declare-fun m!592769 () Bool)

(assert (=> b!616308 m!592769))

(declare-fun m!592771 () Bool)

(assert (=> b!616292 m!592771))

(assert (=> b!616299 m!592757))

(declare-fun m!592773 () Bool)

(assert (=> b!616299 m!592773))

(assert (=> b!616299 m!592757))

(assert (=> b!616299 m!592757))

(declare-fun m!592775 () Bool)

(assert (=> b!616299 m!592775))

(assert (=> b!616299 m!592757))

(declare-fun m!592777 () Bool)

(assert (=> b!616299 m!592777))

(declare-fun m!592779 () Bool)

(assert (=> b!616299 m!592779))

(declare-fun m!592781 () Bool)

(assert (=> b!616299 m!592781))

(assert (=> b!616299 m!592761))

(assert (=> b!616299 m!592767))

(assert (=> b!616299 m!592757))

(declare-fun m!592783 () Bool)

(assert (=> b!616299 m!592783))

(declare-fun m!592785 () Bool)

(assert (=> b!616307 m!592785))

(declare-fun m!592787 () Bool)

(assert (=> b!616302 m!592787))

(assert (=> b!616302 m!592757))

(assert (=> b!616302 m!592757))

(declare-fun m!592789 () Bool)

(assert (=> b!616302 m!592789))

(assert (=> b!616301 m!592757))

(assert (=> b!616301 m!592757))

(declare-fun m!592791 () Bool)

(assert (=> b!616301 m!592791))

(declare-fun m!592793 () Bool)

(assert (=> b!616311 m!592793))

(declare-fun m!592795 () Bool)

(assert (=> b!616311 m!592795))

(declare-fun m!592797 () Bool)

(assert (=> b!616289 m!592797))

(assert (=> b!616306 m!592793))

(declare-fun m!592799 () Bool)

(assert (=> b!616306 m!592799))

(assert (=> b!616306 m!592757))

(assert (=> b!616298 m!592757))

(assert (=> b!616298 m!592757))

(declare-fun m!592801 () Bool)

(assert (=> b!616298 m!592801))

(declare-fun m!592803 () Bool)

(assert (=> b!616305 m!592803))

(declare-fun m!592805 () Bool)

(assert (=> b!616309 m!592805))

(assert (=> b!616295 m!592757))

(assert (=> b!616295 m!592757))

(assert (=> b!616295 m!592775))

(declare-fun m!592807 () Bool)

(assert (=> b!616290 m!592807))

(declare-fun m!592809 () Bool)

(assert (=> b!616310 m!592809))

(declare-fun m!592811 () Bool)

(assert (=> b!616310 m!592811))

(declare-fun m!592813 () Bool)

(assert (=> b!616310 m!592813))

(assert (=> b!616310 m!592757))

(declare-fun m!592815 () Bool)

(assert (=> b!616310 m!592815))

(assert (=> b!616310 m!592793))

(declare-fun m!592817 () Bool)

(assert (=> b!616310 m!592817))

(assert (=> b!616310 m!592757))

(declare-fun m!592819 () Bool)

(assert (=> b!616310 m!592819))

(assert (=> b!616300 m!592757))

(assert (=> b!616300 m!592757))

(assert (=> b!616300 m!592801))

(check-sat (not b!616289) (not start!56070) (not b!616295) (not b!616301) (not b!616305) (not b!616300) (not b!616310) (not b!616307) (not b!616298) (not b!616308) (not b!616292) (not b!616290) (not b!616302) (not b!616299))
(check-sat)
