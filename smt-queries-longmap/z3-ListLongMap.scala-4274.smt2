; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59610 () Bool)

(assert start!59610)

(declare-fun b!657328 () Bool)

(declare-fun e!377612 () Bool)

(declare-datatypes ((SeekEntryResult!6943 0))(
  ( (MissingZero!6943 (index!30137 (_ BitVec 32))) (Found!6943 (index!30138 (_ BitVec 32))) (Intermediate!6943 (undefined!7755 Bool) (index!30139 (_ BitVec 32)) (x!59085 (_ BitVec 32))) (Undefined!6943) (MissingVacant!6943 (index!30140 (_ BitVec 32))) )
))
(declare-fun lt!306905 () SeekEntryResult!6943)

(declare-fun lt!306901 () SeekEntryResult!6943)

(assert (=> b!657328 (= e!377612 (= lt!306905 lt!306901))))

(declare-fun b!657329 () Bool)

(declare-datatypes ((Unit!22653 0))(
  ( (Unit!22654) )
))
(declare-fun e!377599 () Unit!22653)

(declare-fun Unit!22655 () Unit!22653)

(assert (=> b!657329 (= e!377599 Unit!22655)))

(declare-fun b!657330 () Bool)

(declare-fun e!377604 () Unit!22653)

(declare-fun Unit!22656 () Unit!22653)

(assert (=> b!657330 (= e!377604 Unit!22656)))

(declare-fun b!657331 () Bool)

(declare-fun e!377606 () Bool)

(declare-fun e!377605 () Bool)

(assert (=> b!657331 (= e!377606 e!377605)))

(declare-fun res!426204 () Bool)

(assert (=> b!657331 (=> (not res!426204) (not e!377605))))

(declare-fun lt!306895 () SeekEntryResult!6943)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!657331 (= res!426204 (or (= lt!306895 (MissingZero!6943 i!1108)) (= lt!306895 (MissingVacant!6943 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38706 0))(
  ( (array!38707 (arr!18547 (Array (_ BitVec 32) (_ BitVec 64))) (size!18911 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38706)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38706 (_ BitVec 32)) SeekEntryResult!6943)

(assert (=> b!657331 (= lt!306895 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!657332 () Bool)

(declare-fun e!377609 () Unit!22653)

(declare-fun Unit!22657 () Unit!22653)

(assert (=> b!657332 (= e!377609 Unit!22657)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!657333 () Bool)

(declare-fun lt!306904 () array!38706)

(declare-fun res!426211 () Bool)

(declare-fun arrayContainsKey!0 (array!38706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657333 (= res!426211 (arrayContainsKey!0 lt!306904 (select (arr!18547 a!2986) j!136) j!136))))

(declare-fun e!377601 () Bool)

(assert (=> b!657333 (=> (not res!426211) (not e!377601))))

(declare-fun e!377603 () Bool)

(assert (=> b!657333 (= e!377603 e!377601)))

(declare-fun b!657334 () Bool)

(declare-fun e!377610 () Bool)

(declare-fun e!377611 () Bool)

(assert (=> b!657334 (= e!377610 e!377611)))

(declare-fun res!426207 () Bool)

(assert (=> b!657334 (=> (not res!426207) (not e!377611))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!657334 (= res!426207 (and (= lt!306905 (Found!6943 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18547 a!2986) index!984) (select (arr!18547 a!2986) j!136))) (not (= (select (arr!18547 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38706 (_ BitVec 32)) SeekEntryResult!6943)

(assert (=> b!657334 (= lt!306905 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18547 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!657335 () Bool)

(declare-fun res!426209 () Bool)

(assert (=> b!657335 (=> (not res!426209) (not e!377606))))

(assert (=> b!657335 (= res!426209 (and (= (size!18911 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18911 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18911 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657336 () Bool)

(declare-fun res!426214 () Bool)

(assert (=> b!657336 (=> (not res!426214) (not e!377605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38706 (_ BitVec 32)) Bool)

(assert (=> b!657336 (= res!426214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657337 () Bool)

(declare-fun res!426215 () Bool)

(assert (=> b!657337 (=> (not res!426215) (not e!377606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657337 (= res!426215 (validKeyInArray!0 k0!1786))))

(declare-fun e!377607 () Bool)

(declare-fun b!657338 () Bool)

(assert (=> b!657338 (= e!377607 (arrayContainsKey!0 lt!306904 (select (arr!18547 a!2986) j!136) index!984))))

(declare-fun res!426205 () Bool)

(assert (=> start!59610 (=> (not res!426205) (not e!377606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59610 (= res!426205 (validMask!0 mask!3053))))

(assert (=> start!59610 e!377606))

(assert (=> start!59610 true))

(declare-fun array_inv!14406 (array!38706) Bool)

(assert (=> start!59610 (array_inv!14406 a!2986)))

(declare-fun b!657339 () Bool)

(declare-fun e!377600 () Bool)

(assert (=> b!657339 (= e!377611 (not e!377600))))

(declare-fun res!426208 () Bool)

(assert (=> b!657339 (=> res!426208 e!377600)))

(declare-fun lt!306910 () SeekEntryResult!6943)

(assert (=> b!657339 (= res!426208 (not (= lt!306910 (MissingVacant!6943 vacantSpotIndex!68))))))

(declare-fun lt!306903 () Unit!22653)

(assert (=> b!657339 (= lt!306903 e!377599)))

(declare-fun c!75933 () Bool)

(assert (=> b!657339 (= c!75933 (= lt!306910 (Found!6943 index!984)))))

(declare-fun lt!306894 () Unit!22653)

(assert (=> b!657339 (= lt!306894 e!377609)))

(declare-fun c!75935 () Bool)

(assert (=> b!657339 (= c!75935 (= lt!306910 Undefined!6943))))

(declare-fun lt!306909 () (_ BitVec 64))

(assert (=> b!657339 (= lt!306910 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306909 lt!306904 mask!3053))))

(assert (=> b!657339 e!377612))

(declare-fun res!426206 () Bool)

(assert (=> b!657339 (=> (not res!426206) (not e!377612))))

(declare-fun lt!306899 () (_ BitVec 32))

(assert (=> b!657339 (= res!426206 (= lt!306901 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306899 vacantSpotIndex!68 lt!306909 lt!306904 mask!3053)))))

(assert (=> b!657339 (= lt!306901 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306899 vacantSpotIndex!68 (select (arr!18547 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657339 (= lt!306909 (select (store (arr!18547 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!306897 () Unit!22653)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38706 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22653)

(assert (=> b!657339 (= lt!306897 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306899 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657339 (= lt!306899 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!657340 () Bool)

(declare-fun res!426210 () Bool)

(assert (=> b!657340 (= res!426210 (bvsge j!136 index!984))))

(assert (=> b!657340 (=> res!426210 e!377603)))

(declare-fun e!377602 () Bool)

(assert (=> b!657340 (= e!377602 e!377603)))

(declare-fun b!657341 () Bool)

(assert (=> b!657341 false))

(declare-fun lt!306906 () Unit!22653)

(declare-datatypes ((List!12495 0))(
  ( (Nil!12492) (Cons!12491 (h!13539 (_ BitVec 64)) (t!18715 List!12495)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38706 (_ BitVec 64) (_ BitVec 32) List!12495) Unit!22653)

(assert (=> b!657341 (= lt!306906 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306904 (select (arr!18547 a!2986) j!136) j!136 Nil!12492))))

(declare-fun arrayNoDuplicates!0 (array!38706 (_ BitVec 32) List!12495) Bool)

(assert (=> b!657341 (arrayNoDuplicates!0 lt!306904 j!136 Nil!12492)))

(declare-fun lt!306908 () Unit!22653)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38706 (_ BitVec 32) (_ BitVec 32)) Unit!22653)

(assert (=> b!657341 (= lt!306908 (lemmaNoDuplicateFromThenFromBigger!0 lt!306904 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657341 (arrayNoDuplicates!0 lt!306904 #b00000000000000000000000000000000 Nil!12492)))

(declare-fun lt!306902 () Unit!22653)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38706 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12495) Unit!22653)

(assert (=> b!657341 (= lt!306902 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12492))))

(assert (=> b!657341 (arrayContainsKey!0 lt!306904 (select (arr!18547 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306896 () Unit!22653)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38706 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22653)

(assert (=> b!657341 (= lt!306896 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306904 (select (arr!18547 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22658 () Unit!22653)

(assert (=> b!657341 (= e!377604 Unit!22658)))

(declare-fun b!657342 () Bool)

(assert (=> b!657342 (= e!377605 e!377610)))

(declare-fun res!426203 () Bool)

(assert (=> b!657342 (=> (not res!426203) (not e!377610))))

(assert (=> b!657342 (= res!426203 (= (select (store (arr!18547 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657342 (= lt!306904 (array!38707 (store (arr!18547 a!2986) i!1108 k0!1786) (size!18911 a!2986)))))

(declare-fun b!657343 () Bool)

(declare-fun res!426216 () Bool)

(assert (=> b!657343 (=> (not res!426216) (not e!377606))))

(assert (=> b!657343 (= res!426216 (validKeyInArray!0 (select (arr!18547 a!2986) j!136)))))

(declare-fun b!657344 () Bool)

(declare-fun res!426201 () Bool)

(assert (=> b!657344 (=> (not res!426201) (not e!377605))))

(assert (=> b!657344 (= res!426201 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18547 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!657345 () Bool)

(declare-fun res!426213 () Bool)

(assert (=> b!657345 (=> (not res!426213) (not e!377606))))

(assert (=> b!657345 (= res!426213 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!657346 () Bool)

(assert (=> b!657346 (= e!377600 true)))

(assert (=> b!657346 (= (select (store (arr!18547 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!657347 () Bool)

(declare-fun res!426217 () Bool)

(assert (=> b!657347 (=> (not res!426217) (not e!377605))))

(assert (=> b!657347 (= res!426217 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12492))))

(declare-fun b!657348 () Bool)

(assert (=> b!657348 (= e!377601 (arrayContainsKey!0 lt!306904 (select (arr!18547 a!2986) j!136) index!984))))

(declare-fun b!657349 () Bool)

(declare-fun Unit!22659 () Unit!22653)

(assert (=> b!657349 (= e!377609 Unit!22659)))

(assert (=> b!657349 false))

(declare-fun b!657350 () Bool)

(assert (=> b!657350 false))

(declare-fun lt!306891 () Unit!22653)

(assert (=> b!657350 (= lt!306891 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306904 (select (arr!18547 a!2986) j!136) index!984 Nil!12492))))

(assert (=> b!657350 (arrayNoDuplicates!0 lt!306904 index!984 Nil!12492)))

(declare-fun lt!306907 () Unit!22653)

(assert (=> b!657350 (= lt!306907 (lemmaNoDuplicateFromThenFromBigger!0 lt!306904 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657350 (arrayNoDuplicates!0 lt!306904 #b00000000000000000000000000000000 Nil!12492)))

(declare-fun lt!306898 () Unit!22653)

(assert (=> b!657350 (= lt!306898 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12492))))

(assert (=> b!657350 (arrayContainsKey!0 lt!306904 (select (arr!18547 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306892 () Unit!22653)

(assert (=> b!657350 (= lt!306892 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306904 (select (arr!18547 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!657350 e!377607))

(declare-fun res!426202 () Bool)

(assert (=> b!657350 (=> (not res!426202) (not e!377607))))

(assert (=> b!657350 (= res!426202 (arrayContainsKey!0 lt!306904 (select (arr!18547 a!2986) j!136) j!136))))

(declare-fun e!377608 () Unit!22653)

(declare-fun Unit!22660 () Unit!22653)

(assert (=> b!657350 (= e!377608 Unit!22660)))

(declare-fun b!657351 () Bool)

(declare-fun Unit!22661 () Unit!22653)

(assert (=> b!657351 (= e!377599 Unit!22661)))

(declare-fun res!426212 () Bool)

(assert (=> b!657351 (= res!426212 (= (select (store (arr!18547 a!2986) i!1108 k0!1786) index!984) (select (arr!18547 a!2986) j!136)))))

(assert (=> b!657351 (=> (not res!426212) (not e!377602))))

(assert (=> b!657351 e!377602))

(declare-fun c!75934 () Bool)

(assert (=> b!657351 (= c!75934 (bvslt j!136 index!984))))

(declare-fun lt!306900 () Unit!22653)

(assert (=> b!657351 (= lt!306900 e!377604)))

(declare-fun c!75932 () Bool)

(assert (=> b!657351 (= c!75932 (bvslt index!984 j!136))))

(declare-fun lt!306893 () Unit!22653)

(assert (=> b!657351 (= lt!306893 e!377608)))

(assert (=> b!657351 false))

(declare-fun b!657352 () Bool)

(declare-fun Unit!22662 () Unit!22653)

(assert (=> b!657352 (= e!377608 Unit!22662)))

(assert (= (and start!59610 res!426205) b!657335))

(assert (= (and b!657335 res!426209) b!657343))

(assert (= (and b!657343 res!426216) b!657337))

(assert (= (and b!657337 res!426215) b!657345))

(assert (= (and b!657345 res!426213) b!657331))

(assert (= (and b!657331 res!426204) b!657336))

(assert (= (and b!657336 res!426214) b!657347))

(assert (= (and b!657347 res!426217) b!657344))

(assert (= (and b!657344 res!426201) b!657342))

(assert (= (and b!657342 res!426203) b!657334))

(assert (= (and b!657334 res!426207) b!657339))

(assert (= (and b!657339 res!426206) b!657328))

(assert (= (and b!657339 c!75935) b!657349))

(assert (= (and b!657339 (not c!75935)) b!657332))

(assert (= (and b!657339 c!75933) b!657351))

(assert (= (and b!657339 (not c!75933)) b!657329))

(assert (= (and b!657351 res!426212) b!657340))

(assert (= (and b!657340 (not res!426210)) b!657333))

(assert (= (and b!657333 res!426211) b!657348))

(assert (= (and b!657351 c!75934) b!657341))

(assert (= (and b!657351 (not c!75934)) b!657330))

(assert (= (and b!657351 c!75932) b!657350))

(assert (= (and b!657351 (not c!75932)) b!657352))

(assert (= (and b!657350 res!426202) b!657338))

(assert (= (and b!657339 (not res!426208)) b!657346))

(declare-fun m!630859 () Bool)

(assert (=> b!657338 m!630859))

(assert (=> b!657338 m!630859))

(declare-fun m!630861 () Bool)

(assert (=> b!657338 m!630861))

(declare-fun m!630863 () Bool)

(assert (=> start!59610 m!630863))

(declare-fun m!630865 () Bool)

(assert (=> start!59610 m!630865))

(declare-fun m!630867 () Bool)

(assert (=> b!657339 m!630867))

(declare-fun m!630869 () Bool)

(assert (=> b!657339 m!630869))

(declare-fun m!630871 () Bool)

(assert (=> b!657339 m!630871))

(declare-fun m!630873 () Bool)

(assert (=> b!657339 m!630873))

(declare-fun m!630875 () Bool)

(assert (=> b!657339 m!630875))

(assert (=> b!657339 m!630859))

(declare-fun m!630877 () Bool)

(assert (=> b!657339 m!630877))

(assert (=> b!657339 m!630859))

(declare-fun m!630879 () Bool)

(assert (=> b!657339 m!630879))

(declare-fun m!630881 () Bool)

(assert (=> b!657344 m!630881))

(declare-fun m!630883 () Bool)

(assert (=> b!657336 m!630883))

(assert (=> b!657350 m!630859))

(declare-fun m!630885 () Bool)

(assert (=> b!657350 m!630885))

(assert (=> b!657350 m!630859))

(declare-fun m!630887 () Bool)

(assert (=> b!657350 m!630887))

(declare-fun m!630889 () Bool)

(assert (=> b!657350 m!630889))

(assert (=> b!657350 m!630859))

(declare-fun m!630891 () Bool)

(assert (=> b!657350 m!630891))

(assert (=> b!657350 m!630859))

(declare-fun m!630893 () Bool)

(assert (=> b!657350 m!630893))

(declare-fun m!630895 () Bool)

(assert (=> b!657350 m!630895))

(declare-fun m!630897 () Bool)

(assert (=> b!657350 m!630897))

(assert (=> b!657350 m!630859))

(declare-fun m!630899 () Bool)

(assert (=> b!657350 m!630899))

(assert (=> b!657351 m!630873))

(declare-fun m!630901 () Bool)

(assert (=> b!657351 m!630901))

(assert (=> b!657351 m!630859))

(assert (=> b!657348 m!630859))

(assert (=> b!657348 m!630859))

(assert (=> b!657348 m!630861))

(assert (=> b!657342 m!630873))

(declare-fun m!630903 () Bool)

(assert (=> b!657342 m!630903))

(declare-fun m!630905 () Bool)

(assert (=> b!657341 m!630905))

(assert (=> b!657341 m!630859))

(assert (=> b!657341 m!630859))

(declare-fun m!630907 () Bool)

(assert (=> b!657341 m!630907))

(declare-fun m!630909 () Bool)

(assert (=> b!657341 m!630909))

(assert (=> b!657341 m!630897))

(assert (=> b!657341 m!630859))

(declare-fun m!630911 () Bool)

(assert (=> b!657341 m!630911))

(assert (=> b!657341 m!630859))

(declare-fun m!630913 () Bool)

(assert (=> b!657341 m!630913))

(assert (=> b!657341 m!630895))

(assert (=> b!657333 m!630859))

(assert (=> b!657333 m!630859))

(assert (=> b!657333 m!630885))

(assert (=> b!657343 m!630859))

(assert (=> b!657343 m!630859))

(declare-fun m!630915 () Bool)

(assert (=> b!657343 m!630915))

(declare-fun m!630917 () Bool)

(assert (=> b!657347 m!630917))

(declare-fun m!630919 () Bool)

(assert (=> b!657331 m!630919))

(assert (=> b!657346 m!630873))

(assert (=> b!657346 m!630901))

(declare-fun m!630921 () Bool)

(assert (=> b!657334 m!630921))

(assert (=> b!657334 m!630859))

(assert (=> b!657334 m!630859))

(declare-fun m!630923 () Bool)

(assert (=> b!657334 m!630923))

(declare-fun m!630925 () Bool)

(assert (=> b!657345 m!630925))

(declare-fun m!630927 () Bool)

(assert (=> b!657337 m!630927))

(check-sat (not b!657333) (not b!657345) (not b!657348) (not start!59610) (not b!657339) (not b!657347) (not b!657337) (not b!657343) (not b!657334) (not b!657336) (not b!657341) (not b!657338) (not b!657331) (not b!657350))
(check-sat)
