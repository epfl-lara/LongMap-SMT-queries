; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59652 () Bool)

(assert start!59652)

(declare-fun res!427252 () Bool)

(declare-fun e!378530 () Bool)

(assert (=> start!59652 (=> (not res!427252) (not e!378530))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59652 (= res!427252 (validMask!0 mask!3053))))

(assert (=> start!59652 e!378530))

(assert (=> start!59652 true))

(declare-datatypes ((array!38748 0))(
  ( (array!38749 (arr!18568 (Array (_ BitVec 32) (_ BitVec 64))) (size!18932 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38748)

(declare-fun array_inv!14427 (array!38748) Bool)

(assert (=> start!59652 (array_inv!14427 a!2986)))

(declare-fun b!658883 () Bool)

(declare-fun res!427258 () Bool)

(assert (=> b!658883 (=> (not res!427258) (not e!378530))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!658883 (= res!427258 (and (= (size!18932 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18932 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18932 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658884 () Bool)

(declare-datatypes ((Unit!22863 0))(
  ( (Unit!22864) )
))
(declare-fun e!378531 () Unit!22863)

(declare-fun Unit!22865 () Unit!22863)

(assert (=> b!658884 (= e!378531 Unit!22865)))

(declare-fun b!658885 () Bool)

(declare-fun e!378537 () Unit!22863)

(declare-fun Unit!22866 () Unit!22863)

(assert (=> b!658885 (= e!378537 Unit!22866)))

(declare-fun b!658886 () Bool)

(assert (=> b!658886 false))

(declare-fun lt!308164 () array!38748)

(declare-fun lt!308157 () Unit!22863)

(declare-datatypes ((List!12516 0))(
  ( (Nil!12513) (Cons!12512 (h!13560 (_ BitVec 64)) (t!18736 List!12516)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38748 (_ BitVec 64) (_ BitVec 32) List!12516) Unit!22863)

(assert (=> b!658886 (= lt!308157 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308164 (select (arr!18568 a!2986) j!136) j!136 Nil!12513))))

(declare-fun arrayNoDuplicates!0 (array!38748 (_ BitVec 32) List!12516) Bool)

(assert (=> b!658886 (arrayNoDuplicates!0 lt!308164 j!136 Nil!12513)))

(declare-fun lt!308153 () Unit!22863)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38748 (_ BitVec 32) (_ BitVec 32)) Unit!22863)

(assert (=> b!658886 (= lt!308153 (lemmaNoDuplicateFromThenFromBigger!0 lt!308164 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658886 (arrayNoDuplicates!0 lt!308164 #b00000000000000000000000000000000 Nil!12513)))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!308169 () Unit!22863)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38748 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12516) Unit!22863)

(assert (=> b!658886 (= lt!308169 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12513))))

(declare-fun arrayContainsKey!0 (array!38748 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658886 (arrayContainsKey!0 lt!308164 (select (arr!18568 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308166 () Unit!22863)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38748 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22863)

(assert (=> b!658886 (= lt!308166 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308164 (select (arr!18568 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22867 () Unit!22863)

(assert (=> b!658886 (= e!378531 Unit!22867)))

(declare-fun b!658887 () Bool)

(declare-fun res!427254 () Bool)

(declare-fun e!378525 () Bool)

(assert (=> b!658887 (=> (not res!427254) (not e!378525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38748 (_ BitVec 32)) Bool)

(assert (=> b!658887 (= res!427254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!427266 () Bool)

(declare-fun b!658888 () Bool)

(assert (=> b!658888 (= res!427266 (arrayContainsKey!0 lt!308164 (select (arr!18568 a!2986) j!136) j!136))))

(declare-fun e!378527 () Bool)

(assert (=> b!658888 (=> (not res!427266) (not e!378527))))

(declare-fun e!378532 () Bool)

(assert (=> b!658888 (= e!378532 e!378527)))

(declare-fun b!658889 () Bool)

(assert (=> b!658889 (= e!378530 e!378525)))

(declare-fun res!427262 () Bool)

(assert (=> b!658889 (=> (not res!427262) (not e!378525))))

(declare-datatypes ((SeekEntryResult!6964 0))(
  ( (MissingZero!6964 (index!30221 (_ BitVec 32))) (Found!6964 (index!30222 (_ BitVec 32))) (Intermediate!6964 (undefined!7776 Bool) (index!30223 (_ BitVec 32)) (x!59162 (_ BitVec 32))) (Undefined!6964) (MissingVacant!6964 (index!30224 (_ BitVec 32))) )
))
(declare-fun lt!308160 () SeekEntryResult!6964)

(assert (=> b!658889 (= res!427262 (or (= lt!308160 (MissingZero!6964 i!1108)) (= lt!308160 (MissingVacant!6964 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38748 (_ BitVec 32)) SeekEntryResult!6964)

(assert (=> b!658889 (= lt!308160 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!658890 () Bool)

(declare-fun e!378536 () Unit!22863)

(declare-fun Unit!22868 () Unit!22863)

(assert (=> b!658890 (= e!378536 Unit!22868)))

(assert (=> b!658890 false))

(declare-fun b!658891 () Bool)

(declare-fun e!378533 () Bool)

(assert (=> b!658891 (= e!378533 (not true))))

(declare-fun lt!308165 () Unit!22863)

(declare-fun e!378524 () Unit!22863)

(assert (=> b!658891 (= lt!308165 e!378524)))

(declare-fun c!76186 () Bool)

(declare-fun lt!308161 () SeekEntryResult!6964)

(assert (=> b!658891 (= c!76186 (= lt!308161 (Found!6964 index!984)))))

(declare-fun lt!308167 () Unit!22863)

(assert (=> b!658891 (= lt!308167 e!378536)))

(declare-fun c!76184 () Bool)

(assert (=> b!658891 (= c!76184 (= lt!308161 Undefined!6964))))

(declare-fun lt!308159 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38748 (_ BitVec 32)) SeekEntryResult!6964)

(assert (=> b!658891 (= lt!308161 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!308159 lt!308164 mask!3053))))

(declare-fun e!378528 () Bool)

(assert (=> b!658891 e!378528))

(declare-fun res!427255 () Bool)

(assert (=> b!658891 (=> (not res!427255) (not e!378528))))

(declare-fun lt!308156 () SeekEntryResult!6964)

(declare-fun lt!308158 () (_ BitVec 32))

(assert (=> b!658891 (= res!427255 (= lt!308156 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308158 vacantSpotIndex!68 lt!308159 lt!308164 mask!3053)))))

(assert (=> b!658891 (= lt!308156 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308158 vacantSpotIndex!68 (select (arr!18568 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658891 (= lt!308159 (select (store (arr!18568 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!308163 () Unit!22863)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38748 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22863)

(assert (=> b!658891 (= lt!308163 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308158 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658891 (= lt!308158 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!658892 () Bool)

(declare-fun res!427261 () Bool)

(assert (=> b!658892 (=> (not res!427261) (not e!378530))))

(assert (=> b!658892 (= res!427261 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658893 () Bool)

(declare-fun e!378526 () Bool)

(assert (=> b!658893 (= e!378526 e!378533)))

(declare-fun res!427259 () Bool)

(assert (=> b!658893 (=> (not res!427259) (not e!378533))))

(declare-fun lt!308168 () SeekEntryResult!6964)

(assert (=> b!658893 (= res!427259 (and (= lt!308168 (Found!6964 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18568 a!2986) index!984) (select (arr!18568 a!2986) j!136))) (not (= (select (arr!18568 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!658893 (= lt!308168 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18568 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658894 () Bool)

(declare-fun Unit!22869 () Unit!22863)

(assert (=> b!658894 (= e!378524 Unit!22869)))

(declare-fun b!658895 () Bool)

(assert (=> b!658895 (= e!378525 e!378526)))

(declare-fun res!427256 () Bool)

(assert (=> b!658895 (=> (not res!427256) (not e!378526))))

(assert (=> b!658895 (= res!427256 (= (select (store (arr!18568 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658895 (= lt!308164 (array!38749 (store (arr!18568 a!2986) i!1108 k0!1786) (size!18932 a!2986)))))

(declare-fun b!658896 () Bool)

(assert (=> b!658896 (= e!378527 (arrayContainsKey!0 lt!308164 (select (arr!18568 a!2986) j!136) index!984))))

(declare-fun b!658897 () Bool)

(assert (=> b!658897 false))

(declare-fun lt!308155 () Unit!22863)

(assert (=> b!658897 (= lt!308155 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308164 (select (arr!18568 a!2986) j!136) index!984 Nil!12513))))

(assert (=> b!658897 (arrayNoDuplicates!0 lt!308164 index!984 Nil!12513)))

(declare-fun lt!308152 () Unit!22863)

(assert (=> b!658897 (= lt!308152 (lemmaNoDuplicateFromThenFromBigger!0 lt!308164 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658897 (arrayNoDuplicates!0 lt!308164 #b00000000000000000000000000000000 Nil!12513)))

(declare-fun lt!308170 () Unit!22863)

(assert (=> b!658897 (= lt!308170 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12513))))

(assert (=> b!658897 (arrayContainsKey!0 lt!308164 (select (arr!18568 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!308154 () Unit!22863)

(assert (=> b!658897 (= lt!308154 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308164 (select (arr!18568 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!378529 () Bool)

(assert (=> b!658897 e!378529))

(declare-fun res!427260 () Bool)

(assert (=> b!658897 (=> (not res!427260) (not e!378529))))

(assert (=> b!658897 (= res!427260 (arrayContainsKey!0 lt!308164 (select (arr!18568 a!2986) j!136) j!136))))

(declare-fun Unit!22870 () Unit!22863)

(assert (=> b!658897 (= e!378537 Unit!22870)))

(declare-fun b!658898 () Bool)

(declare-fun res!427253 () Bool)

(assert (=> b!658898 (=> (not res!427253) (not e!378530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658898 (= res!427253 (validKeyInArray!0 (select (arr!18568 a!2986) j!136)))))

(declare-fun b!658899 () Bool)

(declare-fun res!427265 () Bool)

(assert (=> b!658899 (= res!427265 (bvsge j!136 index!984))))

(assert (=> b!658899 (=> res!427265 e!378532)))

(declare-fun e!378535 () Bool)

(assert (=> b!658899 (= e!378535 e!378532)))

(declare-fun b!658900 () Bool)

(declare-fun res!427257 () Bool)

(assert (=> b!658900 (=> (not res!427257) (not e!378530))))

(assert (=> b!658900 (= res!427257 (validKeyInArray!0 k0!1786))))

(declare-fun b!658901 () Bool)

(assert (=> b!658901 (= e!378528 (= lt!308168 lt!308156))))

(declare-fun b!658902 () Bool)

(declare-fun res!427264 () Bool)

(assert (=> b!658902 (=> (not res!427264) (not e!378525))))

(assert (=> b!658902 (= res!427264 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12513))))

(declare-fun b!658903 () Bool)

(declare-fun res!427263 () Bool)

(assert (=> b!658903 (=> (not res!427263) (not e!378525))))

(assert (=> b!658903 (= res!427263 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18568 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!658904 () Bool)

(declare-fun Unit!22871 () Unit!22863)

(assert (=> b!658904 (= e!378524 Unit!22871)))

(declare-fun res!427267 () Bool)

(assert (=> b!658904 (= res!427267 (= (select (store (arr!18568 a!2986) i!1108 k0!1786) index!984) (select (arr!18568 a!2986) j!136)))))

(assert (=> b!658904 (=> (not res!427267) (not e!378535))))

(assert (=> b!658904 e!378535))

(declare-fun c!76187 () Bool)

(assert (=> b!658904 (= c!76187 (bvslt j!136 index!984))))

(declare-fun lt!308162 () Unit!22863)

(assert (=> b!658904 (= lt!308162 e!378531)))

(declare-fun c!76185 () Bool)

(assert (=> b!658904 (= c!76185 (bvslt index!984 j!136))))

(declare-fun lt!308151 () Unit!22863)

(assert (=> b!658904 (= lt!308151 e!378537)))

(assert (=> b!658904 false))

(declare-fun b!658905 () Bool)

(declare-fun Unit!22872 () Unit!22863)

(assert (=> b!658905 (= e!378536 Unit!22872)))

(declare-fun b!658906 () Bool)

(assert (=> b!658906 (= e!378529 (arrayContainsKey!0 lt!308164 (select (arr!18568 a!2986) j!136) index!984))))

(assert (= (and start!59652 res!427252) b!658883))

(assert (= (and b!658883 res!427258) b!658898))

(assert (= (and b!658898 res!427253) b!658900))

(assert (= (and b!658900 res!427257) b!658892))

(assert (= (and b!658892 res!427261) b!658889))

(assert (= (and b!658889 res!427262) b!658887))

(assert (= (and b!658887 res!427254) b!658902))

(assert (= (and b!658902 res!427264) b!658903))

(assert (= (and b!658903 res!427263) b!658895))

(assert (= (and b!658895 res!427256) b!658893))

(assert (= (and b!658893 res!427259) b!658891))

(assert (= (and b!658891 res!427255) b!658901))

(assert (= (and b!658891 c!76184) b!658890))

(assert (= (and b!658891 (not c!76184)) b!658905))

(assert (= (and b!658891 c!76186) b!658904))

(assert (= (and b!658891 (not c!76186)) b!658894))

(assert (= (and b!658904 res!427267) b!658899))

(assert (= (and b!658899 (not res!427265)) b!658888))

(assert (= (and b!658888 res!427266) b!658896))

(assert (= (and b!658904 c!76187) b!658886))

(assert (= (and b!658904 (not c!76187)) b!658884))

(assert (= (and b!658904 c!76185) b!658897))

(assert (= (and b!658904 (not c!76185)) b!658885))

(assert (= (and b!658897 res!427260) b!658906))

(declare-fun m!632329 () Bool)

(assert (=> b!658900 m!632329))

(declare-fun m!632331 () Bool)

(assert (=> b!658886 m!632331))

(assert (=> b!658886 m!632331))

(declare-fun m!632333 () Bool)

(assert (=> b!658886 m!632333))

(declare-fun m!632335 () Bool)

(assert (=> b!658886 m!632335))

(assert (=> b!658886 m!632331))

(declare-fun m!632337 () Bool)

(assert (=> b!658886 m!632337))

(declare-fun m!632339 () Bool)

(assert (=> b!658886 m!632339))

(assert (=> b!658886 m!632331))

(declare-fun m!632341 () Bool)

(assert (=> b!658886 m!632341))

(declare-fun m!632343 () Bool)

(assert (=> b!658886 m!632343))

(declare-fun m!632345 () Bool)

(assert (=> b!658886 m!632345))

(assert (=> b!658898 m!632331))

(assert (=> b!658898 m!632331))

(declare-fun m!632347 () Bool)

(assert (=> b!658898 m!632347))

(declare-fun m!632349 () Bool)

(assert (=> b!658887 m!632349))

(declare-fun m!632351 () Bool)

(assert (=> b!658903 m!632351))

(assert (=> b!658906 m!632331))

(assert (=> b!658906 m!632331))

(declare-fun m!632353 () Bool)

(assert (=> b!658906 m!632353))

(declare-fun m!632355 () Bool)

(assert (=> start!59652 m!632355))

(declare-fun m!632357 () Bool)

(assert (=> start!59652 m!632357))

(declare-fun m!632359 () Bool)

(assert (=> b!658893 m!632359))

(assert (=> b!658893 m!632331))

(assert (=> b!658893 m!632331))

(declare-fun m!632361 () Bool)

(assert (=> b!658893 m!632361))

(declare-fun m!632363 () Bool)

(assert (=> b!658889 m!632363))

(declare-fun m!632365 () Bool)

(assert (=> b!658904 m!632365))

(declare-fun m!632367 () Bool)

(assert (=> b!658904 m!632367))

(assert (=> b!658904 m!632331))

(assert (=> b!658888 m!632331))

(assert (=> b!658888 m!632331))

(declare-fun m!632369 () Bool)

(assert (=> b!658888 m!632369))

(declare-fun m!632371 () Bool)

(assert (=> b!658891 m!632371))

(declare-fun m!632373 () Bool)

(assert (=> b!658891 m!632373))

(assert (=> b!658891 m!632331))

(declare-fun m!632375 () Bool)

(assert (=> b!658891 m!632375))

(declare-fun m!632377 () Bool)

(assert (=> b!658891 m!632377))

(assert (=> b!658891 m!632331))

(declare-fun m!632379 () Bool)

(assert (=> b!658891 m!632379))

(declare-fun m!632381 () Bool)

(assert (=> b!658891 m!632381))

(assert (=> b!658891 m!632365))

(declare-fun m!632383 () Bool)

(assert (=> b!658892 m!632383))

(assert (=> b!658895 m!632365))

(declare-fun m!632385 () Bool)

(assert (=> b!658895 m!632385))

(assert (=> b!658897 m!632331))

(assert (=> b!658897 m!632369))

(assert (=> b!658897 m!632331))

(declare-fun m!632387 () Bool)

(assert (=> b!658897 m!632387))

(assert (=> b!658897 m!632331))

(assert (=> b!658897 m!632331))

(declare-fun m!632389 () Bool)

(assert (=> b!658897 m!632389))

(declare-fun m!632391 () Bool)

(assert (=> b!658897 m!632391))

(declare-fun m!632393 () Bool)

(assert (=> b!658897 m!632393))

(assert (=> b!658897 m!632335))

(assert (=> b!658897 m!632331))

(declare-fun m!632395 () Bool)

(assert (=> b!658897 m!632395))

(assert (=> b!658897 m!632345))

(declare-fun m!632397 () Bool)

(assert (=> b!658902 m!632397))

(assert (=> b!658896 m!632331))

(assert (=> b!658896 m!632331))

(assert (=> b!658896 m!632353))

(check-sat (not b!658906) (not b!658896) (not b!658900) (not b!658897) (not b!658889) (not b!658893) (not b!658892) (not b!658887) (not b!658898) (not b!658902) (not b!658886) (not b!658888) (not b!658891) (not start!59652))
(check-sat)
