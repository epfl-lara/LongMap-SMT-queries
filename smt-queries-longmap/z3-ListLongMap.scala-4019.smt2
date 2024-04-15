; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54804 () Bool)

(assert start!54804)

(declare-fun b!598195 () Bool)

(declare-fun e!341926 () Bool)

(declare-fun e!341928 () Bool)

(assert (=> b!598195 (= e!341926 e!341928)))

(declare-fun res!383429 () Bool)

(assert (=> b!598195 (=> res!383429 e!341928)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!271653 () (_ BitVec 64))

(declare-fun lt!271650 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37053 0))(
  ( (array!37054 (arr!17786 (Array (_ BitVec 32) (_ BitVec 64))) (size!18151 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37053)

(assert (=> b!598195 (= res!383429 (or (not (= (select (arr!17786 a!2986) j!136) lt!271650)) (not (= (select (arr!17786 a!2986) j!136) lt!271653)) (bvsge j!136 index!984)))))

(declare-fun e!341927 () Bool)

(assert (=> b!598195 e!341927))

(declare-fun res!383425 () Bool)

(assert (=> b!598195 (=> (not res!383425) (not e!341927))))

(assert (=> b!598195 (= res!383425 (= lt!271653 (select (arr!17786 a!2986) j!136)))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!598195 (= lt!271653 (select (store (arr!17786 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!598196 () Bool)

(declare-fun e!341924 () Bool)

(declare-fun e!341920 () Bool)

(assert (=> b!598196 (= e!341924 e!341920)))

(declare-fun res!383421 () Bool)

(assert (=> b!598196 (=> (not res!383421) (not e!341920))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!598196 (= res!383421 (= (select (store (arr!17786 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!271648 () array!37053)

(assert (=> b!598196 (= lt!271648 (array!37054 (store (arr!17786 a!2986) i!1108 k0!1786) (size!18151 a!2986)))))

(declare-fun b!598197 () Bool)

(declare-fun e!341929 () Bool)

(assert (=> b!598197 (= e!341929 e!341924)))

(declare-fun res!383428 () Bool)

(assert (=> b!598197 (=> (not res!383428) (not e!341924))))

(declare-datatypes ((SeekEntryResult!6223 0))(
  ( (MissingZero!6223 (index!27149 (_ BitVec 32))) (Found!6223 (index!27150 (_ BitVec 32))) (Intermediate!6223 (undefined!7035 Bool) (index!27151 (_ BitVec 32)) (x!55969 (_ BitVec 32))) (Undefined!6223) (MissingVacant!6223 (index!27152 (_ BitVec 32))) )
))
(declare-fun lt!271657 () SeekEntryResult!6223)

(assert (=> b!598197 (= res!383428 (or (= lt!271657 (MissingZero!6223 i!1108)) (= lt!271657 (MissingVacant!6223 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37053 (_ BitVec 32)) SeekEntryResult!6223)

(assert (=> b!598197 (= lt!271657 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!598198 () Bool)

(declare-fun res!383417 () Bool)

(assert (=> b!598198 (=> (not res!383417) (not e!341929))))

(declare-fun arrayContainsKey!0 (array!37053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598198 (= res!383417 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598199 () Bool)

(declare-fun e!341925 () Bool)

(declare-fun lt!271654 () SeekEntryResult!6223)

(declare-fun lt!271647 () SeekEntryResult!6223)

(assert (=> b!598199 (= e!341925 (= lt!271654 lt!271647))))

(declare-fun b!598200 () Bool)

(declare-fun res!383420 () Bool)

(assert (=> b!598200 (=> (not res!383420) (not e!341924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37053 (_ BitVec 32)) Bool)

(assert (=> b!598200 (= res!383420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598201 () Bool)

(declare-fun res!383418 () Bool)

(assert (=> b!598201 (=> (not res!383418) (not e!341929))))

(assert (=> b!598201 (= res!383418 (and (= (size!18151 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18151 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18151 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598202 () Bool)

(declare-fun e!341922 () Bool)

(assert (=> b!598202 (= e!341927 e!341922)))

(declare-fun res!383423 () Bool)

(assert (=> b!598202 (=> res!383423 e!341922)))

(assert (=> b!598202 (= res!383423 (or (not (= (select (arr!17786 a!2986) j!136) lt!271650)) (not (= (select (arr!17786 a!2986) j!136) lt!271653)) (bvsge j!136 index!984)))))

(declare-fun b!598203 () Bool)

(declare-datatypes ((Unit!18804 0))(
  ( (Unit!18805) )
))
(declare-fun e!341921 () Unit!18804)

(declare-fun Unit!18806 () Unit!18804)

(assert (=> b!598203 (= e!341921 Unit!18806)))

(declare-fun e!341930 () Bool)

(declare-fun b!598204 () Bool)

(assert (=> b!598204 (= e!341930 (arrayContainsKey!0 lt!271648 (select (arr!17786 a!2986) j!136) index!984))))

(declare-fun res!383415 () Bool)

(assert (=> start!54804 (=> (not res!383415) (not e!341929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54804 (= res!383415 (validMask!0 mask!3053))))

(assert (=> start!54804 e!341929))

(assert (=> start!54804 true))

(declare-fun array_inv!13669 (array!37053) Bool)

(assert (=> start!54804 (array_inv!13669 a!2986)))

(declare-fun b!598205 () Bool)

(declare-fun res!383413 () Bool)

(assert (=> b!598205 (=> (not res!383413) (not e!341924))))

(declare-datatypes ((List!11866 0))(
  ( (Nil!11863) (Cons!11862 (h!12907 (_ BitVec 64)) (t!18085 List!11866)) )
))
(declare-fun arrayNoDuplicates!0 (array!37053 (_ BitVec 32) List!11866) Bool)

(assert (=> b!598205 (= res!383413 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11863))))

(declare-fun b!598206 () Bool)

(assert (=> b!598206 (= e!341922 e!341930)))

(declare-fun res!383424 () Bool)

(assert (=> b!598206 (=> (not res!383424) (not e!341930))))

(assert (=> b!598206 (= res!383424 (arrayContainsKey!0 lt!271648 (select (arr!17786 a!2986) j!136) j!136))))

(declare-fun b!598207 () Bool)

(declare-fun res!383426 () Bool)

(assert (=> b!598207 (=> (not res!383426) (not e!341929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598207 (= res!383426 (validKeyInArray!0 k0!1786))))

(declare-fun b!598208 () Bool)

(declare-fun e!341923 () Bool)

(assert (=> b!598208 (= e!341923 (not e!341926))))

(declare-fun res!383416 () Bool)

(assert (=> b!598208 (=> res!383416 e!341926)))

(declare-fun lt!271652 () SeekEntryResult!6223)

(assert (=> b!598208 (= res!383416 (not (= lt!271652 (Found!6223 index!984))))))

(declare-fun lt!271655 () Unit!18804)

(assert (=> b!598208 (= lt!271655 e!341921)))

(declare-fun c!67758 () Bool)

(assert (=> b!598208 (= c!67758 (= lt!271652 Undefined!6223))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37053 (_ BitVec 32)) SeekEntryResult!6223)

(assert (=> b!598208 (= lt!271652 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271650 lt!271648 mask!3053))))

(assert (=> b!598208 e!341925))

(declare-fun res!383414 () Bool)

(assert (=> b!598208 (=> (not res!383414) (not e!341925))))

(declare-fun lt!271649 () (_ BitVec 32))

(assert (=> b!598208 (= res!383414 (= lt!271647 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271649 vacantSpotIndex!68 lt!271650 lt!271648 mask!3053)))))

(assert (=> b!598208 (= lt!271647 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271649 vacantSpotIndex!68 (select (arr!17786 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!598208 (= lt!271650 (select (store (arr!17786 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!271651 () Unit!18804)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37053 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18804)

(assert (=> b!598208 (= lt!271651 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271649 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598208 (= lt!271649 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!598209 () Bool)

(declare-fun Unit!18807 () Unit!18804)

(assert (=> b!598209 (= e!341921 Unit!18807)))

(assert (=> b!598209 false))

(declare-fun b!598210 () Bool)

(assert (=> b!598210 (= e!341920 e!341923)))

(declare-fun res!383419 () Bool)

(assert (=> b!598210 (=> (not res!383419) (not e!341923))))

(assert (=> b!598210 (= res!383419 (and (= lt!271654 (Found!6223 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17786 a!2986) index!984) (select (arr!17786 a!2986) j!136))) (not (= (select (arr!17786 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!598210 (= lt!271654 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17786 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598211 () Bool)

(declare-fun res!383422 () Bool)

(assert (=> b!598211 (=> (not res!383422) (not e!341924))))

(assert (=> b!598211 (= res!383422 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17786 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598212 () Bool)

(declare-fun res!383427 () Bool)

(assert (=> b!598212 (=> (not res!383427) (not e!341929))))

(assert (=> b!598212 (= res!383427 (validKeyInArray!0 (select (arr!17786 a!2986) j!136)))))

(declare-fun b!598213 () Bool)

(assert (=> b!598213 (= e!341928 true)))

(assert (=> b!598213 (arrayNoDuplicates!0 lt!271648 #b00000000000000000000000000000000 Nil!11863)))

(declare-fun lt!271646 () Unit!18804)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37053 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11866) Unit!18804)

(assert (=> b!598213 (= lt!271646 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11863))))

(assert (=> b!598213 (arrayContainsKey!0 lt!271648 (select (arr!17786 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271656 () Unit!18804)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37053 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18804)

(assert (=> b!598213 (= lt!271656 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271648 (select (arr!17786 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!54804 res!383415) b!598201))

(assert (= (and b!598201 res!383418) b!598212))

(assert (= (and b!598212 res!383427) b!598207))

(assert (= (and b!598207 res!383426) b!598198))

(assert (= (and b!598198 res!383417) b!598197))

(assert (= (and b!598197 res!383428) b!598200))

(assert (= (and b!598200 res!383420) b!598205))

(assert (= (and b!598205 res!383413) b!598211))

(assert (= (and b!598211 res!383422) b!598196))

(assert (= (and b!598196 res!383421) b!598210))

(assert (= (and b!598210 res!383419) b!598208))

(assert (= (and b!598208 res!383414) b!598199))

(assert (= (and b!598208 c!67758) b!598209))

(assert (= (and b!598208 (not c!67758)) b!598203))

(assert (= (and b!598208 (not res!383416)) b!598195))

(assert (= (and b!598195 res!383425) b!598202))

(assert (= (and b!598202 (not res!383423)) b!598206))

(assert (= (and b!598206 res!383424) b!598204))

(assert (= (and b!598195 (not res!383429)) b!598213))

(declare-fun m!574999 () Bool)

(assert (=> b!598196 m!574999))

(declare-fun m!575001 () Bool)

(assert (=> b!598196 m!575001))

(declare-fun m!575003 () Bool)

(assert (=> b!598212 m!575003))

(assert (=> b!598212 m!575003))

(declare-fun m!575005 () Bool)

(assert (=> b!598212 m!575005))

(declare-fun m!575007 () Bool)

(assert (=> b!598205 m!575007))

(declare-fun m!575009 () Bool)

(assert (=> b!598210 m!575009))

(assert (=> b!598210 m!575003))

(assert (=> b!598210 m!575003))

(declare-fun m!575011 () Bool)

(assert (=> b!598210 m!575011))

(declare-fun m!575013 () Bool)

(assert (=> b!598200 m!575013))

(declare-fun m!575015 () Bool)

(assert (=> b!598198 m!575015))

(declare-fun m!575017 () Bool)

(assert (=> b!598197 m!575017))

(assert (=> b!598204 m!575003))

(assert (=> b!598204 m!575003))

(declare-fun m!575019 () Bool)

(assert (=> b!598204 m!575019))

(assert (=> b!598213 m!575003))

(assert (=> b!598213 m!575003))

(declare-fun m!575021 () Bool)

(assert (=> b!598213 m!575021))

(declare-fun m!575023 () Bool)

(assert (=> b!598213 m!575023))

(assert (=> b!598213 m!575003))

(declare-fun m!575025 () Bool)

(assert (=> b!598213 m!575025))

(declare-fun m!575027 () Bool)

(assert (=> b!598213 m!575027))

(assert (=> b!598206 m!575003))

(assert (=> b!598206 m!575003))

(declare-fun m!575029 () Bool)

(assert (=> b!598206 m!575029))

(assert (=> b!598202 m!575003))

(declare-fun m!575031 () Bool)

(assert (=> b!598207 m!575031))

(declare-fun m!575033 () Bool)

(assert (=> b!598208 m!575033))

(declare-fun m!575035 () Bool)

(assert (=> b!598208 m!575035))

(declare-fun m!575037 () Bool)

(assert (=> b!598208 m!575037))

(assert (=> b!598208 m!575003))

(assert (=> b!598208 m!574999))

(declare-fun m!575039 () Bool)

(assert (=> b!598208 m!575039))

(assert (=> b!598208 m!575003))

(declare-fun m!575041 () Bool)

(assert (=> b!598208 m!575041))

(declare-fun m!575043 () Bool)

(assert (=> b!598208 m!575043))

(declare-fun m!575045 () Bool)

(assert (=> start!54804 m!575045))

(declare-fun m!575047 () Bool)

(assert (=> start!54804 m!575047))

(assert (=> b!598195 m!575003))

(assert (=> b!598195 m!574999))

(declare-fun m!575049 () Bool)

(assert (=> b!598195 m!575049))

(declare-fun m!575051 () Bool)

(assert (=> b!598211 m!575051))

(check-sat (not b!598206) (not b!598204) (not b!598210) (not b!598200) (not b!598207) (not b!598212) (not b!598208) (not b!598205) (not b!598198) (not b!598213) (not start!54804) (not b!598197))
(check-sat)
