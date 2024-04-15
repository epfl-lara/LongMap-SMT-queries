; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55986 () Bool)

(assert start!55986)

(declare-fun b!615161 () Bool)

(declare-fun res!396289 () Bool)

(declare-fun e!352688 () Bool)

(assert (=> b!615161 (=> (not res!396289) (not e!352688))))

(declare-datatypes ((array!37470 0))(
  ( (array!37471 (arr!17981 (Array (_ BitVec 32) (_ BitVec 64))) (size!18346 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37470)

(declare-datatypes ((List!12061 0))(
  ( (Nil!12058) (Cons!12057 (h!13102 (_ BitVec 64)) (t!18280 List!12061)) )
))
(declare-fun arrayNoDuplicates!0 (array!37470 (_ BitVec 32) List!12061) Bool)

(assert (=> b!615161 (= res!396289 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12058))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!352694 () Bool)

(declare-fun b!615162 () Bool)

(declare-fun lt!282444 () array!37470)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615162 (= e!352694 (arrayContainsKey!0 lt!282444 (select (arr!17981 a!2986) j!136) index!984))))

(declare-fun b!615163 () Bool)

(declare-fun res!396285 () Bool)

(assert (=> b!615163 (=> (not res!396285) (not e!352688))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!615163 (= res!396285 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17981 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615164 () Bool)

(declare-fun e!352698 () Bool)

(assert (=> b!615164 (= e!352698 e!352688)))

(declare-fun res!396286 () Bool)

(assert (=> b!615164 (=> (not res!396286) (not e!352688))))

(declare-datatypes ((SeekEntryResult!6418 0))(
  ( (MissingZero!6418 (index!27956 (_ BitVec 32))) (Found!6418 (index!27957 (_ BitVec 32))) (Intermediate!6418 (undefined!7230 Bool) (index!27958 (_ BitVec 32)) (x!56765 (_ BitVec 32))) (Undefined!6418) (MissingVacant!6418 (index!27959 (_ BitVec 32))) )
))
(declare-fun lt!282449 () SeekEntryResult!6418)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!615164 (= res!396286 (or (= lt!282449 (MissingZero!6418 i!1108)) (= lt!282449 (MissingVacant!6418 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37470 (_ BitVec 32)) SeekEntryResult!6418)

(assert (=> b!615164 (= lt!282449 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!615165 () Bool)

(declare-fun res!396283 () Bool)

(assert (=> b!615165 (=> (not res!396283) (not e!352698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615165 (= res!396283 (validKeyInArray!0 (select (arr!17981 a!2986) j!136)))))

(declare-fun b!615166 () Bool)

(declare-datatypes ((Unit!19926 0))(
  ( (Unit!19927) )
))
(declare-fun e!352689 () Unit!19926)

(declare-fun Unit!19928 () Unit!19926)

(assert (=> b!615166 (= e!352689 Unit!19928)))

(declare-fun b!615167 () Bool)

(declare-fun res!396282 () Bool)

(assert (=> b!615167 (=> (not res!396282) (not e!352698))))

(assert (=> b!615167 (= res!396282 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615168 () Bool)

(declare-fun e!352693 () Bool)

(assert (=> b!615168 (= e!352693 (arrayContainsKey!0 lt!282444 (select (arr!17981 a!2986) j!136) index!984))))

(declare-fun b!615169 () Bool)

(declare-fun res!396284 () Bool)

(assert (=> b!615169 (= res!396284 (bvsge j!136 index!984))))

(declare-fun e!352699 () Bool)

(assert (=> b!615169 (=> res!396284 e!352699)))

(declare-fun e!352696 () Bool)

(assert (=> b!615169 (= e!352696 e!352699)))

(declare-fun b!615170 () Bool)

(assert (=> b!615170 false))

(declare-fun lt!282462 () Unit!19926)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37470 (_ BitVec 64) (_ BitVec 32) List!12061) Unit!19926)

(assert (=> b!615170 (= lt!282462 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282444 (select (arr!17981 a!2986) j!136) j!136 Nil!12058))))

(assert (=> b!615170 (arrayNoDuplicates!0 lt!282444 j!136 Nil!12058)))

(declare-fun lt!282450 () Unit!19926)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37470 (_ BitVec 32) (_ BitVec 32)) Unit!19926)

(assert (=> b!615170 (= lt!282450 (lemmaNoDuplicateFromThenFromBigger!0 lt!282444 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615170 (arrayNoDuplicates!0 lt!282444 #b00000000000000000000000000000000 Nil!12058)))

(declare-fun lt!282446 () Unit!19926)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37470 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12061) Unit!19926)

(assert (=> b!615170 (= lt!282446 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12058))))

(assert (=> b!615170 (arrayContainsKey!0 lt!282444 (select (arr!17981 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282459 () Unit!19926)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37470 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19926)

(assert (=> b!615170 (= lt!282459 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282444 (select (arr!17981 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!352695 () Unit!19926)

(declare-fun Unit!19929 () Unit!19926)

(assert (=> b!615170 (= e!352695 Unit!19929)))

(declare-fun b!615171 () Bool)

(declare-fun res!396295 () Bool)

(assert (=> b!615171 (=> (not res!396295) (not e!352698))))

(assert (=> b!615171 (= res!396295 (validKeyInArray!0 k0!1786))))

(declare-fun b!615172 () Bool)

(declare-fun res!396292 () Bool)

(assert (=> b!615172 (=> (not res!396292) (not e!352698))))

(assert (=> b!615172 (= res!396292 (and (= (size!18346 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18346 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18346 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615173 () Bool)

(declare-fun e!352690 () Bool)

(assert (=> b!615173 (= e!352688 e!352690)))

(declare-fun res!396293 () Bool)

(assert (=> b!615173 (=> (not res!396293) (not e!352690))))

(assert (=> b!615173 (= res!396293 (= (select (store (arr!17981 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615173 (= lt!282444 (array!37471 (store (arr!17981 a!2986) i!1108 k0!1786) (size!18346 a!2986)))))

(declare-fun b!615174 () Bool)

(declare-fun e!352691 () Unit!19926)

(declare-fun Unit!19930 () Unit!19926)

(assert (=> b!615174 (= e!352691 Unit!19930)))

(declare-fun b!615175 () Bool)

(declare-fun res!396296 () Bool)

(assert (=> b!615175 (= res!396296 (arrayContainsKey!0 lt!282444 (select (arr!17981 a!2986) j!136) j!136))))

(assert (=> b!615175 (=> (not res!396296) (not e!352694))))

(assert (=> b!615175 (= e!352699 e!352694)))

(declare-fun b!615176 () Bool)

(declare-fun Unit!19931 () Unit!19926)

(assert (=> b!615176 (= e!352689 Unit!19931)))

(assert (=> b!615176 false))

(declare-fun res!396281 () Bool)

(assert (=> start!55986 (=> (not res!396281) (not e!352698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55986 (= res!396281 (validMask!0 mask!3053))))

(assert (=> start!55986 e!352698))

(assert (=> start!55986 true))

(declare-fun array_inv!13864 (array!37470) Bool)

(assert (=> start!55986 (array_inv!13864 a!2986)))

(declare-fun b!615177 () Bool)

(declare-fun e!352701 () Bool)

(assert (=> b!615177 (= e!352701 (not true))))

(declare-fun lt!282451 () Unit!19926)

(assert (=> b!615177 (= lt!282451 e!352691)))

(declare-fun c!69809 () Bool)

(declare-fun lt!282455 () SeekEntryResult!6418)

(assert (=> b!615177 (= c!69809 (= lt!282455 (Found!6418 index!984)))))

(declare-fun lt!282460 () Unit!19926)

(assert (=> b!615177 (= lt!282460 e!352689)))

(declare-fun c!69808 () Bool)

(assert (=> b!615177 (= c!69808 (= lt!282455 Undefined!6418))))

(declare-fun lt!282447 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37470 (_ BitVec 32)) SeekEntryResult!6418)

(assert (=> b!615177 (= lt!282455 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282447 lt!282444 mask!3053))))

(declare-fun e!352692 () Bool)

(assert (=> b!615177 e!352692))

(declare-fun res!396288 () Bool)

(assert (=> b!615177 (=> (not res!396288) (not e!352692))))

(declare-fun lt!282452 () (_ BitVec 32))

(declare-fun lt!282457 () SeekEntryResult!6418)

(assert (=> b!615177 (= res!396288 (= lt!282457 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282452 vacantSpotIndex!68 lt!282447 lt!282444 mask!3053)))))

(assert (=> b!615177 (= lt!282457 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282452 vacantSpotIndex!68 (select (arr!17981 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615177 (= lt!282447 (select (store (arr!17981 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!282461 () Unit!19926)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37470 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19926)

(assert (=> b!615177 (= lt!282461 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282452 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615177 (= lt!282452 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!615178 () Bool)

(declare-fun res!396290 () Bool)

(assert (=> b!615178 (=> (not res!396290) (not e!352688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37470 (_ BitVec 32)) Bool)

(assert (=> b!615178 (= res!396290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615179 () Bool)

(assert (=> b!615179 (= e!352690 e!352701)))

(declare-fun res!396291 () Bool)

(assert (=> b!615179 (=> (not res!396291) (not e!352701))))

(declare-fun lt!282458 () SeekEntryResult!6418)

(assert (=> b!615179 (= res!396291 (and (= lt!282458 (Found!6418 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17981 a!2986) index!984) (select (arr!17981 a!2986) j!136))) (not (= (select (arr!17981 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!615179 (= lt!282458 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17981 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615180 () Bool)

(declare-fun Unit!19932 () Unit!19926)

(assert (=> b!615180 (= e!352691 Unit!19932)))

(declare-fun res!396287 () Bool)

(assert (=> b!615180 (= res!396287 (= (select (store (arr!17981 a!2986) i!1108 k0!1786) index!984) (select (arr!17981 a!2986) j!136)))))

(assert (=> b!615180 (=> (not res!396287) (not e!352696))))

(assert (=> b!615180 e!352696))

(declare-fun c!69810 () Bool)

(assert (=> b!615180 (= c!69810 (bvslt j!136 index!984))))

(declare-fun lt!282453 () Unit!19926)

(assert (=> b!615180 (= lt!282453 e!352695)))

(declare-fun c!69807 () Bool)

(assert (=> b!615180 (= c!69807 (bvslt index!984 j!136))))

(declare-fun lt!282454 () Unit!19926)

(declare-fun e!352700 () Unit!19926)

(assert (=> b!615180 (= lt!282454 e!352700)))

(assert (=> b!615180 false))

(declare-fun b!615181 () Bool)

(assert (=> b!615181 false))

(declare-fun lt!282456 () Unit!19926)

(assert (=> b!615181 (= lt!282456 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282444 (select (arr!17981 a!2986) j!136) index!984 Nil!12058))))

(assert (=> b!615181 (arrayNoDuplicates!0 lt!282444 index!984 Nil!12058)))

(declare-fun lt!282448 () Unit!19926)

(assert (=> b!615181 (= lt!282448 (lemmaNoDuplicateFromThenFromBigger!0 lt!282444 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615181 (arrayNoDuplicates!0 lt!282444 #b00000000000000000000000000000000 Nil!12058)))

(declare-fun lt!282445 () Unit!19926)

(assert (=> b!615181 (= lt!282445 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12058))))

(assert (=> b!615181 (arrayContainsKey!0 lt!282444 (select (arr!17981 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282463 () Unit!19926)

(assert (=> b!615181 (= lt!282463 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282444 (select (arr!17981 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!615181 e!352693))

(declare-fun res!396294 () Bool)

(assert (=> b!615181 (=> (not res!396294) (not e!352693))))

(assert (=> b!615181 (= res!396294 (arrayContainsKey!0 lt!282444 (select (arr!17981 a!2986) j!136) j!136))))

(declare-fun Unit!19933 () Unit!19926)

(assert (=> b!615181 (= e!352700 Unit!19933)))

(declare-fun b!615182 () Bool)

(assert (=> b!615182 (= e!352692 (= lt!282458 lt!282457))))

(declare-fun b!615183 () Bool)

(declare-fun Unit!19934 () Unit!19926)

(assert (=> b!615183 (= e!352695 Unit!19934)))

(declare-fun b!615184 () Bool)

(declare-fun Unit!19935 () Unit!19926)

(assert (=> b!615184 (= e!352700 Unit!19935)))

(assert (= (and start!55986 res!396281) b!615172))

(assert (= (and b!615172 res!396292) b!615165))

(assert (= (and b!615165 res!396283) b!615171))

(assert (= (and b!615171 res!396295) b!615167))

(assert (= (and b!615167 res!396282) b!615164))

(assert (= (and b!615164 res!396286) b!615178))

(assert (= (and b!615178 res!396290) b!615161))

(assert (= (and b!615161 res!396289) b!615163))

(assert (= (and b!615163 res!396285) b!615173))

(assert (= (and b!615173 res!396293) b!615179))

(assert (= (and b!615179 res!396291) b!615177))

(assert (= (and b!615177 res!396288) b!615182))

(assert (= (and b!615177 c!69808) b!615176))

(assert (= (and b!615177 (not c!69808)) b!615166))

(assert (= (and b!615177 c!69809) b!615180))

(assert (= (and b!615177 (not c!69809)) b!615174))

(assert (= (and b!615180 res!396287) b!615169))

(assert (= (and b!615169 (not res!396284)) b!615175))

(assert (= (and b!615175 res!396296) b!615162))

(assert (= (and b!615180 c!69810) b!615170))

(assert (= (and b!615180 (not c!69810)) b!615183))

(assert (= (and b!615180 c!69807) b!615181))

(assert (= (and b!615180 (not c!69807)) b!615184))

(assert (= (and b!615181 res!396294) b!615168))

(declare-fun m!590863 () Bool)

(assert (=> b!615167 m!590863))

(declare-fun m!590865 () Bool)

(assert (=> b!615171 m!590865))

(declare-fun m!590867 () Bool)

(assert (=> b!615162 m!590867))

(assert (=> b!615162 m!590867))

(declare-fun m!590869 () Bool)

(assert (=> b!615162 m!590869))

(declare-fun m!590871 () Bool)

(assert (=> b!615161 m!590871))

(assert (=> b!615168 m!590867))

(assert (=> b!615168 m!590867))

(assert (=> b!615168 m!590869))

(declare-fun m!590873 () Bool)

(assert (=> b!615163 m!590873))

(declare-fun m!590875 () Bool)

(assert (=> b!615178 m!590875))

(declare-fun m!590877 () Bool)

(assert (=> start!55986 m!590877))

(declare-fun m!590879 () Bool)

(assert (=> start!55986 m!590879))

(assert (=> b!615165 m!590867))

(assert (=> b!615165 m!590867))

(declare-fun m!590881 () Bool)

(assert (=> b!615165 m!590881))

(declare-fun m!590883 () Bool)

(assert (=> b!615180 m!590883))

(declare-fun m!590885 () Bool)

(assert (=> b!615180 m!590885))

(assert (=> b!615180 m!590867))

(declare-fun m!590887 () Bool)

(assert (=> b!615179 m!590887))

(assert (=> b!615179 m!590867))

(assert (=> b!615179 m!590867))

(declare-fun m!590889 () Bool)

(assert (=> b!615179 m!590889))

(assert (=> b!615175 m!590867))

(assert (=> b!615175 m!590867))

(declare-fun m!590891 () Bool)

(assert (=> b!615175 m!590891))

(assert (=> b!615181 m!590867))

(assert (=> b!615181 m!590891))

(assert (=> b!615181 m!590867))

(declare-fun m!590893 () Bool)

(assert (=> b!615181 m!590893))

(declare-fun m!590895 () Bool)

(assert (=> b!615181 m!590895))

(declare-fun m!590897 () Bool)

(assert (=> b!615181 m!590897))

(declare-fun m!590899 () Bool)

(assert (=> b!615181 m!590899))

(assert (=> b!615181 m!590867))

(declare-fun m!590901 () Bool)

(assert (=> b!615181 m!590901))

(assert (=> b!615181 m!590867))

(declare-fun m!590903 () Bool)

(assert (=> b!615181 m!590903))

(assert (=> b!615181 m!590867))

(declare-fun m!590905 () Bool)

(assert (=> b!615181 m!590905))

(declare-fun m!590907 () Bool)

(assert (=> b!615164 m!590907))

(assert (=> b!615170 m!590867))

(declare-fun m!590909 () Bool)

(assert (=> b!615170 m!590909))

(assert (=> b!615170 m!590867))

(declare-fun m!590911 () Bool)

(assert (=> b!615170 m!590911))

(declare-fun m!590913 () Bool)

(assert (=> b!615170 m!590913))

(assert (=> b!615170 m!590867))

(declare-fun m!590915 () Bool)

(assert (=> b!615170 m!590915))

(declare-fun m!590917 () Bool)

(assert (=> b!615170 m!590917))

(assert (=> b!615170 m!590897))

(assert (=> b!615170 m!590899))

(assert (=> b!615170 m!590867))

(declare-fun m!590919 () Bool)

(assert (=> b!615177 m!590919))

(declare-fun m!590921 () Bool)

(assert (=> b!615177 m!590921))

(assert (=> b!615177 m!590867))

(assert (=> b!615177 m!590883))

(declare-fun m!590923 () Bool)

(assert (=> b!615177 m!590923))

(declare-fun m!590925 () Bool)

(assert (=> b!615177 m!590925))

(assert (=> b!615177 m!590867))

(declare-fun m!590927 () Bool)

(assert (=> b!615177 m!590927))

(declare-fun m!590929 () Bool)

(assert (=> b!615177 m!590929))

(assert (=> b!615173 m!590883))

(declare-fun m!590931 () Bool)

(assert (=> b!615173 m!590931))

(check-sat (not start!55986) (not b!615179) (not b!615161) (not b!615162) (not b!615168) (not b!615181) (not b!615177) (not b!615171) (not b!615178) (not b!615170) (not b!615164) (not b!615165) (not b!615167) (not b!615175))
(check-sat)
