; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55992 () Bool)

(assert start!55992)

(declare-fun b!613359 () Bool)

(declare-fun res!394721 () Bool)

(declare-fun e!351609 () Bool)

(assert (=> b!613359 (=> (not res!394721) (not e!351609))))

(declare-datatypes ((array!37407 0))(
  ( (array!37408 (arr!17947 (Array (_ BitVec 32) (_ BitVec 64))) (size!18311 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37407)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!613359 (= res!394721 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!613360 () Bool)

(declare-datatypes ((Unit!19711 0))(
  ( (Unit!19712) )
))
(declare-fun e!351621 () Unit!19711)

(declare-fun Unit!19713 () Unit!19711)

(assert (=> b!613360 (= e!351621 Unit!19713)))

(declare-fun lt!281054 () array!37407)

(declare-fun lt!281057 () Unit!19711)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37407 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19711)

(assert (=> b!613360 (= lt!281057 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281054 (select (arr!17947 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!613360 (arrayContainsKey!0 lt!281054 (select (arr!17947 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!281044 () Unit!19711)

(declare-datatypes ((List!11895 0))(
  ( (Nil!11892) (Cons!11891 (h!12939 (_ BitVec 64)) (t!18115 List!11895)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37407 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11895) Unit!19711)

(assert (=> b!613360 (= lt!281044 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11892))))

(declare-fun arrayNoDuplicates!0 (array!37407 (_ BitVec 32) List!11895) Bool)

(assert (=> b!613360 (arrayNoDuplicates!0 lt!281054 #b00000000000000000000000000000000 Nil!11892)))

(declare-fun lt!281059 () Unit!19711)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37407 (_ BitVec 32) (_ BitVec 32)) Unit!19711)

(assert (=> b!613360 (= lt!281059 (lemmaNoDuplicateFromThenFromBigger!0 lt!281054 #b00000000000000000000000000000000 j!136))))

(assert (=> b!613360 (arrayNoDuplicates!0 lt!281054 j!136 Nil!11892)))

(declare-fun lt!281056 () Unit!19711)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37407 (_ BitVec 64) (_ BitVec 32) List!11895) Unit!19711)

(assert (=> b!613360 (= lt!281056 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!281054 (select (arr!17947 a!2986) j!136) j!136 Nil!11892))))

(assert (=> b!613360 false))

(declare-fun b!613361 () Bool)

(declare-fun e!351624 () Bool)

(declare-fun e!351610 () Bool)

(assert (=> b!613361 (= e!351624 e!351610)))

(declare-fun res!394726 () Bool)

(assert (=> b!613361 (=> (not res!394726) (not e!351610))))

(assert (=> b!613361 (= res!394726 (arrayContainsKey!0 lt!281054 (select (arr!17947 a!2986) j!136) j!136))))

(declare-fun b!613362 () Bool)

(declare-fun e!351615 () Unit!19711)

(declare-fun Unit!19714 () Unit!19711)

(assert (=> b!613362 (= e!351615 Unit!19714)))

(assert (=> b!613362 false))

(declare-fun b!613363 () Bool)

(declare-fun e!351612 () Bool)

(declare-fun e!351616 () Bool)

(assert (=> b!613363 (= e!351612 e!351616)))

(declare-fun res!394719 () Bool)

(assert (=> b!613363 (=> res!394719 e!351616)))

(assert (=> b!613363 (= res!394719 (bvsge index!984 j!136))))

(declare-fun lt!281041 () Unit!19711)

(assert (=> b!613363 (= lt!281041 e!351621)))

(declare-fun c!69694 () Bool)

(assert (=> b!613363 (= c!69694 (bvslt j!136 index!984))))

(declare-fun b!613364 () Bool)

(declare-fun res!394708 () Bool)

(declare-fun e!351617 () Bool)

(assert (=> b!613364 (=> res!394708 e!351617)))

(declare-fun contains!3027 (List!11895 (_ BitVec 64)) Bool)

(assert (=> b!613364 (= res!394708 (contains!3027 Nil!11892 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613365 () Bool)

(declare-fun e!351618 () Bool)

(assert (=> b!613365 (= e!351618 e!351612)))

(declare-fun res!394716 () Bool)

(assert (=> b!613365 (=> res!394716 e!351612)))

(declare-fun lt!281051 () (_ BitVec 64))

(declare-fun lt!281055 () (_ BitVec 64))

(assert (=> b!613365 (= res!394716 (or (not (= (select (arr!17947 a!2986) j!136) lt!281055)) (not (= (select (arr!17947 a!2986) j!136) lt!281051))))))

(declare-fun e!351622 () Bool)

(assert (=> b!613365 e!351622))

(declare-fun res!394715 () Bool)

(assert (=> b!613365 (=> (not res!394715) (not e!351622))))

(assert (=> b!613365 (= res!394715 (= lt!281051 (select (arr!17947 a!2986) j!136)))))

(assert (=> b!613365 (= lt!281051 (select (store (arr!17947 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!613366 () Bool)

(declare-fun res!394720 () Bool)

(assert (=> b!613366 (=> res!394720 e!351617)))

(declare-fun noDuplicate!358 (List!11895) Bool)

(assert (=> b!613366 (= res!394720 (not (noDuplicate!358 Nil!11892)))))

(declare-fun b!613367 () Bool)

(declare-fun e!351613 () Bool)

(declare-fun e!351611 () Bool)

(assert (=> b!613367 (= e!351613 e!351611)))

(declare-fun res!394723 () Bool)

(assert (=> b!613367 (=> (not res!394723) (not e!351611))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!613367 (= res!394723 (= (select (store (arr!17947 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!613367 (= lt!281054 (array!37408 (store (arr!17947 a!2986) i!1108 k0!1786) (size!18311 a!2986)))))

(declare-fun b!613368 () Bool)

(declare-fun Unit!19715 () Unit!19711)

(assert (=> b!613368 (= e!351621 Unit!19715)))

(declare-fun b!613369 () Bool)

(declare-fun res!394711 () Bool)

(assert (=> b!613369 (=> (not res!394711) (not e!351613))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37407 (_ BitVec 32)) Bool)

(assert (=> b!613369 (= res!394711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!613370 () Bool)

(declare-fun e!351620 () Bool)

(declare-datatypes ((SeekEntryResult!6343 0))(
  ( (MissingZero!6343 (index!27656 (_ BitVec 32))) (Found!6343 (index!27657 (_ BitVec 32))) (Intermediate!6343 (undefined!7155 Bool) (index!27658 (_ BitVec 32)) (x!56618 (_ BitVec 32))) (Undefined!6343) (MissingVacant!6343 (index!27659 (_ BitVec 32))) )
))
(declare-fun lt!281043 () SeekEntryResult!6343)

(declare-fun lt!281045 () SeekEntryResult!6343)

(assert (=> b!613370 (= e!351620 (= lt!281043 lt!281045))))

(declare-fun res!394709 () Bool)

(assert (=> start!55992 (=> (not res!394709) (not e!351609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55992 (= res!394709 (validMask!0 mask!3053))))

(assert (=> start!55992 e!351609))

(assert (=> start!55992 true))

(declare-fun array_inv!13806 (array!37407) Bool)

(assert (=> start!55992 (array_inv!13806 a!2986)))

(declare-fun b!613371 () Bool)

(assert (=> b!613371 (= e!351609 e!351613)))

(declare-fun res!394722 () Bool)

(assert (=> b!613371 (=> (not res!394722) (not e!351613))))

(declare-fun lt!281052 () SeekEntryResult!6343)

(assert (=> b!613371 (= res!394722 (or (= lt!281052 (MissingZero!6343 i!1108)) (= lt!281052 (MissingVacant!6343 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37407 (_ BitVec 32)) SeekEntryResult!6343)

(assert (=> b!613371 (= lt!281052 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!613372 () Bool)

(declare-fun e!351614 () Bool)

(assert (=> b!613372 (= e!351614 (arrayContainsKey!0 lt!281054 (select (arr!17947 a!2986) j!136) index!984))))

(declare-fun b!613373 () Bool)

(declare-fun res!394728 () Bool)

(assert (=> b!613373 (=> (not res!394728) (not e!351613))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!613373 (= res!394728 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17947 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!613374 () Bool)

(assert (=> b!613374 (= e!351616 e!351617)))

(declare-fun res!394717 () Bool)

(assert (=> b!613374 (=> res!394717 e!351617)))

(assert (=> b!613374 (= res!394717 (or (bvsge (size!18311 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18311 a!2986)) (bvsge index!984 (size!18311 a!2986))))))

(assert (=> b!613374 (arrayNoDuplicates!0 lt!281054 index!984 Nil!11892)))

(declare-fun lt!281048 () Unit!19711)

(assert (=> b!613374 (= lt!281048 (lemmaNoDuplicateFromThenFromBigger!0 lt!281054 #b00000000000000000000000000000000 index!984))))

(assert (=> b!613374 (arrayNoDuplicates!0 lt!281054 #b00000000000000000000000000000000 Nil!11892)))

(declare-fun lt!281047 () Unit!19711)

(assert (=> b!613374 (= lt!281047 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11892))))

(assert (=> b!613374 (arrayContainsKey!0 lt!281054 (select (arr!17947 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!281053 () Unit!19711)

(assert (=> b!613374 (= lt!281053 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281054 (select (arr!17947 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!613374 e!351614))

(declare-fun res!394712 () Bool)

(assert (=> b!613374 (=> (not res!394712) (not e!351614))))

(assert (=> b!613374 (= res!394712 (arrayContainsKey!0 lt!281054 (select (arr!17947 a!2986) j!136) j!136))))

(declare-fun b!613375 () Bool)

(assert (=> b!613375 (= e!351617 true)))

(declare-fun lt!281050 () Bool)

(assert (=> b!613375 (= lt!281050 (contains!3027 Nil!11892 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613376 () Bool)

(declare-fun res!394725 () Bool)

(assert (=> b!613376 (=> (not res!394725) (not e!351609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!613376 (= res!394725 (validKeyInArray!0 (select (arr!17947 a!2986) j!136)))))

(declare-fun b!613377 () Bool)

(assert (=> b!613377 (= e!351622 e!351624)))

(declare-fun res!394727 () Bool)

(assert (=> b!613377 (=> res!394727 e!351624)))

(assert (=> b!613377 (= res!394727 (or (not (= (select (arr!17947 a!2986) j!136) lt!281055)) (not (= (select (arr!17947 a!2986) j!136) lt!281051)) (bvsge j!136 index!984)))))

(declare-fun b!613378 () Bool)

(declare-fun e!351619 () Bool)

(assert (=> b!613378 (= e!351611 e!351619)))

(declare-fun res!394714 () Bool)

(assert (=> b!613378 (=> (not res!394714) (not e!351619))))

(assert (=> b!613378 (= res!394714 (and (= lt!281043 (Found!6343 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17947 a!2986) index!984) (select (arr!17947 a!2986) j!136))) (not (= (select (arr!17947 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37407 (_ BitVec 32)) SeekEntryResult!6343)

(assert (=> b!613378 (= lt!281043 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17947 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!613379 () Bool)

(declare-fun res!394724 () Bool)

(assert (=> b!613379 (=> (not res!394724) (not e!351609))))

(assert (=> b!613379 (= res!394724 (validKeyInArray!0 k0!1786))))

(declare-fun b!613380 () Bool)

(declare-fun res!394718 () Bool)

(assert (=> b!613380 (=> (not res!394718) (not e!351613))))

(assert (=> b!613380 (= res!394718 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11892))))

(declare-fun b!613381 () Bool)

(assert (=> b!613381 (= e!351610 (arrayContainsKey!0 lt!281054 (select (arr!17947 a!2986) j!136) index!984))))

(declare-fun b!613382 () Bool)

(assert (=> b!613382 (= e!351619 (not e!351618))))

(declare-fun res!394729 () Bool)

(assert (=> b!613382 (=> res!394729 e!351618)))

(declare-fun lt!281046 () SeekEntryResult!6343)

(assert (=> b!613382 (= res!394729 (not (= lt!281046 (Found!6343 index!984))))))

(declare-fun lt!281058 () Unit!19711)

(assert (=> b!613382 (= lt!281058 e!351615)))

(declare-fun c!69695 () Bool)

(assert (=> b!613382 (= c!69695 (= lt!281046 Undefined!6343))))

(assert (=> b!613382 (= lt!281046 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!281055 lt!281054 mask!3053))))

(assert (=> b!613382 e!351620))

(declare-fun res!394710 () Bool)

(assert (=> b!613382 (=> (not res!394710) (not e!351620))))

(declare-fun lt!281042 () (_ BitVec 32))

(assert (=> b!613382 (= res!394710 (= lt!281045 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281042 vacantSpotIndex!68 lt!281055 lt!281054 mask!3053)))))

(assert (=> b!613382 (= lt!281045 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281042 vacantSpotIndex!68 (select (arr!17947 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!613382 (= lt!281055 (select (store (arr!17947 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!281049 () Unit!19711)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37407 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19711)

(assert (=> b!613382 (= lt!281049 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!281042 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!613382 (= lt!281042 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!613383 () Bool)

(declare-fun res!394713 () Bool)

(assert (=> b!613383 (=> (not res!394713) (not e!351609))))

(assert (=> b!613383 (= res!394713 (and (= (size!18311 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18311 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18311 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!613384 () Bool)

(declare-fun Unit!19716 () Unit!19711)

(assert (=> b!613384 (= e!351615 Unit!19716)))

(assert (= (and start!55992 res!394709) b!613383))

(assert (= (and b!613383 res!394713) b!613376))

(assert (= (and b!613376 res!394725) b!613379))

(assert (= (and b!613379 res!394724) b!613359))

(assert (= (and b!613359 res!394721) b!613371))

(assert (= (and b!613371 res!394722) b!613369))

(assert (= (and b!613369 res!394711) b!613380))

(assert (= (and b!613380 res!394718) b!613373))

(assert (= (and b!613373 res!394728) b!613367))

(assert (= (and b!613367 res!394723) b!613378))

(assert (= (and b!613378 res!394714) b!613382))

(assert (= (and b!613382 res!394710) b!613370))

(assert (= (and b!613382 c!69695) b!613362))

(assert (= (and b!613382 (not c!69695)) b!613384))

(assert (= (and b!613382 (not res!394729)) b!613365))

(assert (= (and b!613365 res!394715) b!613377))

(assert (= (and b!613377 (not res!394727)) b!613361))

(assert (= (and b!613361 res!394726) b!613381))

(assert (= (and b!613365 (not res!394716)) b!613363))

(assert (= (and b!613363 c!69694) b!613360))

(assert (= (and b!613363 (not c!69694)) b!613368))

(assert (= (and b!613363 (not res!394719)) b!613374))

(assert (= (and b!613374 res!394712) b!613372))

(assert (= (and b!613374 (not res!394717)) b!613366))

(assert (= (and b!613366 (not res!394720)) b!613364))

(assert (= (and b!613364 (not res!394708)) b!613375))

(declare-fun m!589937 () Bool)

(assert (=> b!613374 m!589937))

(declare-fun m!589939 () Bool)

(assert (=> b!613374 m!589939))

(assert (=> b!613374 m!589939))

(declare-fun m!589941 () Bool)

(assert (=> b!613374 m!589941))

(declare-fun m!589943 () Bool)

(assert (=> b!613374 m!589943))

(assert (=> b!613374 m!589939))

(declare-fun m!589945 () Bool)

(assert (=> b!613374 m!589945))

(assert (=> b!613374 m!589939))

(declare-fun m!589947 () Bool)

(assert (=> b!613374 m!589947))

(declare-fun m!589949 () Bool)

(assert (=> b!613374 m!589949))

(declare-fun m!589951 () Bool)

(assert (=> b!613374 m!589951))

(declare-fun m!589953 () Bool)

(assert (=> b!613375 m!589953))

(declare-fun m!589955 () Bool)

(assert (=> b!613371 m!589955))

(declare-fun m!589957 () Bool)

(assert (=> b!613359 m!589957))

(assert (=> b!613372 m!589939))

(assert (=> b!613372 m!589939))

(declare-fun m!589959 () Bool)

(assert (=> b!613372 m!589959))

(declare-fun m!589961 () Bool)

(assert (=> b!613380 m!589961))

(declare-fun m!589963 () Bool)

(assert (=> b!613364 m!589963))

(assert (=> b!613360 m!589939))

(assert (=> b!613360 m!589939))

(declare-fun m!589965 () Bool)

(assert (=> b!613360 m!589965))

(assert (=> b!613360 m!589939))

(declare-fun m!589967 () Bool)

(assert (=> b!613360 m!589967))

(declare-fun m!589969 () Bool)

(assert (=> b!613360 m!589969))

(assert (=> b!613360 m!589939))

(declare-fun m!589971 () Bool)

(assert (=> b!613360 m!589971))

(assert (=> b!613360 m!589949))

(declare-fun m!589973 () Bool)

(assert (=> b!613360 m!589973))

(assert (=> b!613360 m!589951))

(declare-fun m!589975 () Bool)

(assert (=> b!613369 m!589975))

(assert (=> b!613376 m!589939))

(assert (=> b!613376 m!589939))

(declare-fun m!589977 () Bool)

(assert (=> b!613376 m!589977))

(assert (=> b!613361 m!589939))

(assert (=> b!613361 m!589939))

(assert (=> b!613361 m!589941))

(declare-fun m!589979 () Bool)

(assert (=> b!613367 m!589979))

(declare-fun m!589981 () Bool)

(assert (=> b!613367 m!589981))

(declare-fun m!589983 () Bool)

(assert (=> b!613366 m!589983))

(declare-fun m!589985 () Bool)

(assert (=> start!55992 m!589985))

(declare-fun m!589987 () Bool)

(assert (=> start!55992 m!589987))

(declare-fun m!589989 () Bool)

(assert (=> b!613378 m!589989))

(assert (=> b!613378 m!589939))

(assert (=> b!613378 m!589939))

(declare-fun m!589991 () Bool)

(assert (=> b!613378 m!589991))

(declare-fun m!589993 () Bool)

(assert (=> b!613382 m!589993))

(assert (=> b!613382 m!589939))

(assert (=> b!613382 m!589979))

(declare-fun m!589995 () Bool)

(assert (=> b!613382 m!589995))

(assert (=> b!613382 m!589939))

(declare-fun m!589997 () Bool)

(assert (=> b!613382 m!589997))

(declare-fun m!589999 () Bool)

(assert (=> b!613382 m!589999))

(declare-fun m!590001 () Bool)

(assert (=> b!613382 m!590001))

(declare-fun m!590003 () Bool)

(assert (=> b!613382 m!590003))

(declare-fun m!590005 () Bool)

(assert (=> b!613379 m!590005))

(declare-fun m!590007 () Bool)

(assert (=> b!613373 m!590007))

(assert (=> b!613381 m!589939))

(assert (=> b!613381 m!589939))

(assert (=> b!613381 m!589959))

(assert (=> b!613365 m!589939))

(assert (=> b!613365 m!589979))

(declare-fun m!590009 () Bool)

(assert (=> b!613365 m!590009))

(assert (=> b!613377 m!589939))

(check-sat (not b!613375) (not b!613359) (not b!613361) (not b!613366) (not b!613360) (not b!613364) (not b!613374) (not b!613369) (not b!613379) (not start!55992) (not b!613381) (not b!613371) (not b!613380) (not b!613372) (not b!613382) (not b!613378) (not b!613376))
(check-sat)
