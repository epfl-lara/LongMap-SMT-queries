; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57604 () Bool)

(assert start!57604)

(declare-fun b!636922 () Bool)

(declare-fun e!364411 () Bool)

(declare-fun e!364417 () Bool)

(assert (=> b!636922 (= e!364411 e!364417)))

(declare-fun res!412051 () Bool)

(assert (=> b!636922 (=> res!412051 e!364417)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!294504 () (_ BitVec 64))

(declare-fun lt!294511 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38250 0))(
  ( (array!38251 (arr!18349 (Array (_ BitVec 32) (_ BitVec 64))) (size!18713 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38250)

(assert (=> b!636922 (= res!412051 (or (not (= (select (arr!18349 a!2986) j!136) lt!294511)) (not (= (select (arr!18349 a!2986) j!136) lt!294504)) (bvsge j!136 index!984)))))

(declare-fun b!636923 () Bool)

(declare-fun e!364410 () Bool)

(declare-datatypes ((SeekEntryResult!6789 0))(
  ( (MissingZero!6789 (index!29467 (_ BitVec 32))) (Found!6789 (index!29468 (_ BitVec 32))) (Intermediate!6789 (undefined!7601 Bool) (index!29469 (_ BitVec 32)) (x!58222 (_ BitVec 32))) (Undefined!6789) (MissingVacant!6789 (index!29470 (_ BitVec 32))) )
))
(declare-fun lt!294501 () SeekEntryResult!6789)

(declare-fun lt!294503 () SeekEntryResult!6789)

(assert (=> b!636923 (= e!364410 (= lt!294501 lt!294503))))

(declare-fun b!636924 () Bool)

(declare-fun e!364412 () Bool)

(declare-fun lt!294508 () array!38250)

(declare-fun arrayContainsKey!0 (array!38250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!636924 (= e!364412 (arrayContainsKey!0 lt!294508 (select (arr!18349 a!2986) j!136) index!984))))

(declare-fun res!412063 () Bool)

(declare-fun e!364414 () Bool)

(assert (=> start!57604 (=> (not res!412063) (not e!364414))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57604 (= res!412063 (validMask!0 mask!3053))))

(assert (=> start!57604 e!364414))

(assert (=> start!57604 true))

(declare-fun array_inv!14145 (array!38250) Bool)

(assert (=> start!57604 (array_inv!14145 a!2986)))

(declare-fun b!636925 () Bool)

(declare-fun res!412045 () Bool)

(declare-fun e!364408 () Bool)

(assert (=> b!636925 (=> (not res!412045) (not e!364408))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!636925 (= res!412045 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18349 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636926 () Bool)

(declare-fun e!364418 () Bool)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((List!12390 0))(
  ( (Nil!12387) (Cons!12386 (h!13431 (_ BitVec 64)) (t!18618 List!12390)) )
))
(declare-fun contains!3104 (List!12390 (_ BitVec 64)) Bool)

(assert (=> b!636926 (= e!364418 (not (contains!3104 Nil!12387 k0!1786)))))

(declare-fun b!636927 () Bool)

(declare-fun e!364416 () Bool)

(declare-fun e!364409 () Bool)

(assert (=> b!636927 (= e!364416 e!364409)))

(declare-fun res!412046 () Bool)

(assert (=> b!636927 (=> (not res!412046) (not e!364409))))

(assert (=> b!636927 (= res!412046 (and (= lt!294501 (Found!6789 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18349 a!2986) index!984) (select (arr!18349 a!2986) j!136))) (not (= (select (arr!18349 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38250 (_ BitVec 32)) SeekEntryResult!6789)

(assert (=> b!636927 (= lt!294501 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18349 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636928 () Bool)

(declare-fun res!412044 () Bool)

(assert (=> b!636928 (=> (not res!412044) (not e!364408))))

(declare-fun arrayNoDuplicates!0 (array!38250 (_ BitVec 32) List!12390) Bool)

(assert (=> b!636928 (= res!412044 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12387))))

(declare-fun b!636929 () Bool)

(declare-fun res!412058 () Bool)

(assert (=> b!636929 (=> (not res!412058) (not e!364414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!636929 (= res!412058 (validKeyInArray!0 k0!1786))))

(declare-fun b!636930 () Bool)

(declare-datatypes ((Unit!21490 0))(
  ( (Unit!21491) )
))
(declare-fun e!364415 () Unit!21490)

(declare-fun Unit!21492 () Unit!21490)

(assert (=> b!636930 (= e!364415 Unit!21492)))

(declare-fun b!636931 () Bool)

(declare-fun e!364419 () Bool)

(assert (=> b!636931 (= e!364419 e!364418)))

(declare-fun res!412057 () Bool)

(assert (=> b!636931 (=> res!412057 e!364418)))

(assert (=> b!636931 (= res!412057 (or (bvsge (size!18713 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18713 a!2986))))))

(assert (=> b!636931 (arrayContainsKey!0 lt!294508 (select (arr!18349 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294502 () Unit!21490)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38250 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21490)

(assert (=> b!636931 (= lt!294502 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294508 (select (arr!18349 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!636932 () Bool)

(assert (=> b!636932 (= e!364408 e!364416)))

(declare-fun res!412064 () Bool)

(assert (=> b!636932 (=> (not res!412064) (not e!364416))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!636932 (= res!412064 (= (select (store (arr!18349 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636932 (= lt!294508 (array!38251 (store (arr!18349 a!2986) i!1108 k0!1786) (size!18713 a!2986)))))

(declare-fun b!636933 () Bool)

(declare-fun res!412053 () Bool)

(assert (=> b!636933 (=> res!412053 e!364418)))

(assert (=> b!636933 (= res!412053 (contains!3104 Nil!12387 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!636934 () Bool)

(declare-fun res!412061 () Bool)

(assert (=> b!636934 (=> (not res!412061) (not e!364414))))

(assert (=> b!636934 (= res!412061 (validKeyInArray!0 (select (arr!18349 a!2986) j!136)))))

(declare-fun b!636935 () Bool)

(declare-fun res!412048 () Bool)

(assert (=> b!636935 (=> (not res!412048) (not e!364408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38250 (_ BitVec 32)) Bool)

(assert (=> b!636935 (= res!412048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!636936 () Bool)

(declare-fun res!412056 () Bool)

(assert (=> b!636936 (=> (not res!412056) (not e!364414))))

(assert (=> b!636936 (= res!412056 (and (= (size!18713 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18713 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18713 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!636937 () Bool)

(declare-fun res!412062 () Bool)

(assert (=> b!636937 (=> res!412062 e!364418)))

(assert (=> b!636937 (= res!412062 (contains!3104 Nil!12387 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!636938 () Bool)

(declare-fun res!412049 () Bool)

(assert (=> b!636938 (=> res!412049 e!364418)))

(declare-fun noDuplicate!382 (List!12390) Bool)

(assert (=> b!636938 (= res!412049 (not (noDuplicate!382 Nil!12387)))))

(declare-fun b!636939 () Bool)

(assert (=> b!636939 (= e!364414 e!364408)))

(declare-fun res!412060 () Bool)

(assert (=> b!636939 (=> (not res!412060) (not e!364408))))

(declare-fun lt!294505 () SeekEntryResult!6789)

(assert (=> b!636939 (= res!412060 (or (= lt!294505 (MissingZero!6789 i!1108)) (= lt!294505 (MissingVacant!6789 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38250 (_ BitVec 32)) SeekEntryResult!6789)

(assert (=> b!636939 (= lt!294505 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!636940 () Bool)

(declare-fun Unit!21493 () Unit!21490)

(assert (=> b!636940 (= e!364415 Unit!21493)))

(assert (=> b!636940 false))

(declare-fun b!636941 () Bool)

(declare-fun res!412054 () Bool)

(assert (=> b!636941 (=> (not res!412054) (not e!364414))))

(assert (=> b!636941 (= res!412054 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!636942 () Bool)

(assert (=> b!636942 (= e!364417 e!364412)))

(declare-fun res!412055 () Bool)

(assert (=> b!636942 (=> (not res!412055) (not e!364412))))

(assert (=> b!636942 (= res!412055 (arrayContainsKey!0 lt!294508 (select (arr!18349 a!2986) j!136) j!136))))

(declare-fun b!636943 () Bool)

(declare-fun e!364413 () Bool)

(assert (=> b!636943 (= e!364409 (not e!364413))))

(declare-fun res!412059 () Bool)

(assert (=> b!636943 (=> res!412059 e!364413)))

(declare-fun lt!294509 () SeekEntryResult!6789)

(assert (=> b!636943 (= res!412059 (not (= lt!294509 (Found!6789 index!984))))))

(declare-fun lt!294506 () Unit!21490)

(assert (=> b!636943 (= lt!294506 e!364415)))

(declare-fun c!72806 () Bool)

(assert (=> b!636943 (= c!72806 (= lt!294509 Undefined!6789))))

(assert (=> b!636943 (= lt!294509 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294511 lt!294508 mask!3053))))

(assert (=> b!636943 e!364410))

(declare-fun res!412052 () Bool)

(assert (=> b!636943 (=> (not res!412052) (not e!364410))))

(declare-fun lt!294507 () (_ BitVec 32))

(assert (=> b!636943 (= res!412052 (= lt!294503 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294507 vacantSpotIndex!68 lt!294511 lt!294508 mask!3053)))))

(assert (=> b!636943 (= lt!294503 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294507 vacantSpotIndex!68 (select (arr!18349 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!636943 (= lt!294511 (select (store (arr!18349 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294510 () Unit!21490)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38250 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21490)

(assert (=> b!636943 (= lt!294510 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294507 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!636943 (= lt!294507 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!636944 () Bool)

(assert (=> b!636944 (= e!364413 e!364419)))

(declare-fun res!412047 () Bool)

(assert (=> b!636944 (=> res!412047 e!364419)))

(assert (=> b!636944 (= res!412047 (or (not (= (select (arr!18349 a!2986) j!136) lt!294511)) (not (= (select (arr!18349 a!2986) j!136) lt!294504)) (bvsge j!136 index!984)))))

(assert (=> b!636944 e!364411))

(declare-fun res!412050 () Bool)

(assert (=> b!636944 (=> (not res!412050) (not e!364411))))

(assert (=> b!636944 (= res!412050 (= lt!294504 (select (arr!18349 a!2986) j!136)))))

(assert (=> b!636944 (= lt!294504 (select (store (arr!18349 a!2986) i!1108 k0!1786) index!984))))

(assert (= (and start!57604 res!412063) b!636936))

(assert (= (and b!636936 res!412056) b!636934))

(assert (= (and b!636934 res!412061) b!636929))

(assert (= (and b!636929 res!412058) b!636941))

(assert (= (and b!636941 res!412054) b!636939))

(assert (= (and b!636939 res!412060) b!636935))

(assert (= (and b!636935 res!412048) b!636928))

(assert (= (and b!636928 res!412044) b!636925))

(assert (= (and b!636925 res!412045) b!636932))

(assert (= (and b!636932 res!412064) b!636927))

(assert (= (and b!636927 res!412046) b!636943))

(assert (= (and b!636943 res!412052) b!636923))

(assert (= (and b!636943 c!72806) b!636940))

(assert (= (and b!636943 (not c!72806)) b!636930))

(assert (= (and b!636943 (not res!412059)) b!636944))

(assert (= (and b!636944 res!412050) b!636922))

(assert (= (and b!636922 (not res!412051)) b!636942))

(assert (= (and b!636942 res!412055) b!636924))

(assert (= (and b!636944 (not res!412047)) b!636931))

(assert (= (and b!636931 (not res!412057)) b!636938))

(assert (= (and b!636938 (not res!412049)) b!636933))

(assert (= (and b!636933 (not res!412053)) b!636937))

(assert (= (and b!636937 (not res!412062)) b!636926))

(declare-fun m!611067 () Bool)

(assert (=> b!636934 m!611067))

(assert (=> b!636934 m!611067))

(declare-fun m!611069 () Bool)

(assert (=> b!636934 m!611069))

(declare-fun m!611071 () Bool)

(assert (=> b!636925 m!611071))

(declare-fun m!611073 () Bool)

(assert (=> b!636926 m!611073))

(declare-fun m!611075 () Bool)

(assert (=> b!636941 m!611075))

(declare-fun m!611077 () Bool)

(assert (=> b!636937 m!611077))

(declare-fun m!611079 () Bool)

(assert (=> b!636933 m!611079))

(declare-fun m!611081 () Bool)

(assert (=> start!57604 m!611081))

(declare-fun m!611083 () Bool)

(assert (=> start!57604 m!611083))

(declare-fun m!611085 () Bool)

(assert (=> b!636938 m!611085))

(declare-fun m!611087 () Bool)

(assert (=> b!636939 m!611087))

(declare-fun m!611089 () Bool)

(assert (=> b!636935 m!611089))

(declare-fun m!611091 () Bool)

(assert (=> b!636932 m!611091))

(declare-fun m!611093 () Bool)

(assert (=> b!636932 m!611093))

(assert (=> b!636922 m!611067))

(declare-fun m!611095 () Bool)

(assert (=> b!636927 m!611095))

(assert (=> b!636927 m!611067))

(assert (=> b!636927 m!611067))

(declare-fun m!611097 () Bool)

(assert (=> b!636927 m!611097))

(declare-fun m!611099 () Bool)

(assert (=> b!636929 m!611099))

(declare-fun m!611101 () Bool)

(assert (=> b!636928 m!611101))

(declare-fun m!611103 () Bool)

(assert (=> b!636943 m!611103))

(declare-fun m!611105 () Bool)

(assert (=> b!636943 m!611105))

(declare-fun m!611107 () Bool)

(assert (=> b!636943 m!611107))

(assert (=> b!636943 m!611067))

(assert (=> b!636943 m!611091))

(declare-fun m!611109 () Bool)

(assert (=> b!636943 m!611109))

(declare-fun m!611111 () Bool)

(assert (=> b!636943 m!611111))

(assert (=> b!636943 m!611067))

(declare-fun m!611113 () Bool)

(assert (=> b!636943 m!611113))

(assert (=> b!636931 m!611067))

(assert (=> b!636931 m!611067))

(declare-fun m!611115 () Bool)

(assert (=> b!636931 m!611115))

(assert (=> b!636931 m!611067))

(declare-fun m!611117 () Bool)

(assert (=> b!636931 m!611117))

(assert (=> b!636942 m!611067))

(assert (=> b!636942 m!611067))

(declare-fun m!611119 () Bool)

(assert (=> b!636942 m!611119))

(assert (=> b!636944 m!611067))

(assert (=> b!636944 m!611091))

(declare-fun m!611121 () Bool)

(assert (=> b!636944 m!611121))

(assert (=> b!636924 m!611067))

(assert (=> b!636924 m!611067))

(declare-fun m!611123 () Bool)

(assert (=> b!636924 m!611123))

(check-sat (not b!636934) (not b!636927) (not b!636924) (not b!636929) (not b!636941) (not b!636928) (not b!636938) (not b!636926) (not b!636942) (not b!636937) (not b!636931) (not b!636939) (not start!57604) (not b!636935) (not b!636933) (not b!636943))
(check-sat)
(get-model)

(declare-fun d!90067 () Bool)

(declare-fun res!412132 () Bool)

(declare-fun e!364463 () Bool)

(assert (=> d!90067 (=> res!412132 e!364463)))

(assert (=> d!90067 (= res!412132 (= (select (arr!18349 lt!294508) j!136) (select (arr!18349 a!2986) j!136)))))

(assert (=> d!90067 (= (arrayContainsKey!0 lt!294508 (select (arr!18349 a!2986) j!136) j!136) e!364463)))

(declare-fun b!637018 () Bool)

(declare-fun e!364464 () Bool)

(assert (=> b!637018 (= e!364463 e!364464)))

(declare-fun res!412133 () Bool)

(assert (=> b!637018 (=> (not res!412133) (not e!364464))))

(assert (=> b!637018 (= res!412133 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18713 lt!294508)))))

(declare-fun b!637019 () Bool)

(assert (=> b!637019 (= e!364464 (arrayContainsKey!0 lt!294508 (select (arr!18349 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90067 (not res!412132)) b!637018))

(assert (= (and b!637018 res!412133) b!637019))

(declare-fun m!611183 () Bool)

(assert (=> d!90067 m!611183))

(assert (=> b!637019 m!611067))

(declare-fun m!611185 () Bool)

(assert (=> b!637019 m!611185))

(assert (=> b!636942 d!90067))

(declare-fun d!90069 () Bool)

(declare-fun res!412134 () Bool)

(declare-fun e!364465 () Bool)

(assert (=> d!90069 (=> res!412134 e!364465)))

(assert (=> d!90069 (= res!412134 (= (select (arr!18349 lt!294508) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18349 a!2986) j!136)))))

(assert (=> d!90069 (= (arrayContainsKey!0 lt!294508 (select (arr!18349 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!364465)))

(declare-fun b!637020 () Bool)

(declare-fun e!364466 () Bool)

(assert (=> b!637020 (= e!364465 e!364466)))

(declare-fun res!412135 () Bool)

(assert (=> b!637020 (=> (not res!412135) (not e!364466))))

(assert (=> b!637020 (= res!412135 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18713 lt!294508)))))

(declare-fun b!637021 () Bool)

(assert (=> b!637021 (= e!364466 (arrayContainsKey!0 lt!294508 (select (arr!18349 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90069 (not res!412134)) b!637020))

(assert (= (and b!637020 res!412135) b!637021))

(declare-fun m!611187 () Bool)

(assert (=> d!90069 m!611187))

(assert (=> b!637021 m!611067))

(declare-fun m!611189 () Bool)

(assert (=> b!637021 m!611189))

(assert (=> b!636931 d!90069))

(declare-fun d!90071 () Bool)

(assert (=> d!90071 (arrayContainsKey!0 lt!294508 (select (arr!18349 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294547 () Unit!21490)

(declare-fun choose!114 (array!38250 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21490)

(assert (=> d!90071 (= lt!294547 (choose!114 lt!294508 (select (arr!18349 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90071 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90071 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294508 (select (arr!18349 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!294547)))

(declare-fun bs!19123 () Bool)

(assert (= bs!19123 d!90071))

(assert (=> bs!19123 m!611067))

(assert (=> bs!19123 m!611115))

(assert (=> bs!19123 m!611067))

(declare-fun m!611191 () Bool)

(assert (=> bs!19123 m!611191))

(assert (=> b!636931 d!90071))

(declare-fun d!90073 () Bool)

(declare-fun lt!294550 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!244 (List!12390) (InoxSet (_ BitVec 64)))

(assert (=> d!90073 (= lt!294550 (select (content!244 Nil!12387) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364471 () Bool)

(assert (=> d!90073 (= lt!294550 e!364471)))

(declare-fun res!412141 () Bool)

(assert (=> d!90073 (=> (not res!412141) (not e!364471))))

(get-info :version)

(assert (=> d!90073 (= res!412141 ((_ is Cons!12386) Nil!12387))))

(assert (=> d!90073 (= (contains!3104 Nil!12387 #b0000000000000000000000000000000000000000000000000000000000000000) lt!294550)))

(declare-fun b!637026 () Bool)

(declare-fun e!364472 () Bool)

(assert (=> b!637026 (= e!364471 e!364472)))

(declare-fun res!412140 () Bool)

(assert (=> b!637026 (=> res!412140 e!364472)))

(assert (=> b!637026 (= res!412140 (= (h!13431 Nil!12387) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637027 () Bool)

(assert (=> b!637027 (= e!364472 (contains!3104 (t!18618 Nil!12387) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!90073 res!412141) b!637026))

(assert (= (and b!637026 (not res!412140)) b!637027))

(declare-fun m!611193 () Bool)

(assert (=> d!90073 m!611193))

(declare-fun m!611195 () Bool)

(assert (=> d!90073 m!611195))

(declare-fun m!611197 () Bool)

(assert (=> b!637027 m!611197))

(assert (=> b!636933 d!90073))

(declare-fun b!637040 () Bool)

(declare-fun e!364479 () SeekEntryResult!6789)

(assert (=> b!637040 (= e!364479 (MissingVacant!6789 vacantSpotIndex!68))))

(declare-fun b!637041 () Bool)

(declare-fun e!364481 () SeekEntryResult!6789)

(declare-fun e!364480 () SeekEntryResult!6789)

(assert (=> b!637041 (= e!364481 e!364480)))

(declare-fun c!72818 () Bool)

(declare-fun lt!294555 () (_ BitVec 64))

(assert (=> b!637041 (= c!72818 (= lt!294555 lt!294511))))

(declare-fun b!637043 () Bool)

(assert (=> b!637043 (= e!364481 Undefined!6789)))

(declare-fun b!637044 () Bool)

(assert (=> b!637044 (= e!364480 (Found!6789 index!984))))

(declare-fun b!637045 () Bool)

(declare-fun c!72817 () Bool)

(assert (=> b!637045 (= c!72817 (= lt!294555 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637045 (= e!364480 e!364479)))

(declare-fun d!90075 () Bool)

(declare-fun lt!294556 () SeekEntryResult!6789)

(assert (=> d!90075 (and (or ((_ is Undefined!6789) lt!294556) (not ((_ is Found!6789) lt!294556)) (and (bvsge (index!29468 lt!294556) #b00000000000000000000000000000000) (bvslt (index!29468 lt!294556) (size!18713 lt!294508)))) (or ((_ is Undefined!6789) lt!294556) ((_ is Found!6789) lt!294556) (not ((_ is MissingVacant!6789) lt!294556)) (not (= (index!29470 lt!294556) vacantSpotIndex!68)) (and (bvsge (index!29470 lt!294556) #b00000000000000000000000000000000) (bvslt (index!29470 lt!294556) (size!18713 lt!294508)))) (or ((_ is Undefined!6789) lt!294556) (ite ((_ is Found!6789) lt!294556) (= (select (arr!18349 lt!294508) (index!29468 lt!294556)) lt!294511) (and ((_ is MissingVacant!6789) lt!294556) (= (index!29470 lt!294556) vacantSpotIndex!68) (= (select (arr!18349 lt!294508) (index!29470 lt!294556)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90075 (= lt!294556 e!364481)))

(declare-fun c!72816 () Bool)

(assert (=> d!90075 (= c!72816 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90075 (= lt!294555 (select (arr!18349 lt!294508) index!984))))

(assert (=> d!90075 (validMask!0 mask!3053)))

(assert (=> d!90075 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294511 lt!294508 mask!3053) lt!294556)))

(declare-fun b!637042 () Bool)

(assert (=> b!637042 (= e!364479 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!294511 lt!294508 mask!3053))))

(assert (= (and d!90075 c!72816) b!637043))

(assert (= (and d!90075 (not c!72816)) b!637041))

(assert (= (and b!637041 c!72818) b!637044))

(assert (= (and b!637041 (not c!72818)) b!637045))

(assert (= (and b!637045 c!72817) b!637040))

(assert (= (and b!637045 (not c!72817)) b!637042))

(declare-fun m!611199 () Bool)

(assert (=> d!90075 m!611199))

(declare-fun m!611201 () Bool)

(assert (=> d!90075 m!611201))

(declare-fun m!611203 () Bool)

(assert (=> d!90075 m!611203))

(assert (=> d!90075 m!611081))

(assert (=> b!637042 m!611103))

(assert (=> b!637042 m!611103))

(declare-fun m!611205 () Bool)

(assert (=> b!637042 m!611205))

(assert (=> b!636943 d!90075))

(declare-fun b!637046 () Bool)

(declare-fun e!364482 () SeekEntryResult!6789)

(assert (=> b!637046 (= e!364482 (MissingVacant!6789 vacantSpotIndex!68))))

(declare-fun b!637047 () Bool)

(declare-fun e!364484 () SeekEntryResult!6789)

(declare-fun e!364483 () SeekEntryResult!6789)

(assert (=> b!637047 (= e!364484 e!364483)))

(declare-fun c!72821 () Bool)

(declare-fun lt!294557 () (_ BitVec 64))

(assert (=> b!637047 (= c!72821 (= lt!294557 (select (arr!18349 a!2986) j!136)))))

(declare-fun b!637049 () Bool)

(assert (=> b!637049 (= e!364484 Undefined!6789)))

(declare-fun b!637050 () Bool)

(assert (=> b!637050 (= e!364483 (Found!6789 lt!294507))))

(declare-fun b!637051 () Bool)

(declare-fun c!72820 () Bool)

(assert (=> b!637051 (= c!72820 (= lt!294557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637051 (= e!364483 e!364482)))

(declare-fun d!90077 () Bool)

(declare-fun lt!294558 () SeekEntryResult!6789)

(assert (=> d!90077 (and (or ((_ is Undefined!6789) lt!294558) (not ((_ is Found!6789) lt!294558)) (and (bvsge (index!29468 lt!294558) #b00000000000000000000000000000000) (bvslt (index!29468 lt!294558) (size!18713 a!2986)))) (or ((_ is Undefined!6789) lt!294558) ((_ is Found!6789) lt!294558) (not ((_ is MissingVacant!6789) lt!294558)) (not (= (index!29470 lt!294558) vacantSpotIndex!68)) (and (bvsge (index!29470 lt!294558) #b00000000000000000000000000000000) (bvslt (index!29470 lt!294558) (size!18713 a!2986)))) (or ((_ is Undefined!6789) lt!294558) (ite ((_ is Found!6789) lt!294558) (= (select (arr!18349 a!2986) (index!29468 lt!294558)) (select (arr!18349 a!2986) j!136)) (and ((_ is MissingVacant!6789) lt!294558) (= (index!29470 lt!294558) vacantSpotIndex!68) (= (select (arr!18349 a!2986) (index!29470 lt!294558)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90077 (= lt!294558 e!364484)))

(declare-fun c!72819 () Bool)

(assert (=> d!90077 (= c!72819 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90077 (= lt!294557 (select (arr!18349 a!2986) lt!294507))))

(assert (=> d!90077 (validMask!0 mask!3053)))

(assert (=> d!90077 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294507 vacantSpotIndex!68 (select (arr!18349 a!2986) j!136) a!2986 mask!3053) lt!294558)))

(declare-fun b!637048 () Bool)

(assert (=> b!637048 (= e!364482 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!294507 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18349 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!90077 c!72819) b!637049))

(assert (= (and d!90077 (not c!72819)) b!637047))

(assert (= (and b!637047 c!72821) b!637050))

(assert (= (and b!637047 (not c!72821)) b!637051))

(assert (= (and b!637051 c!72820) b!637046))

(assert (= (and b!637051 (not c!72820)) b!637048))

(declare-fun m!611207 () Bool)

(assert (=> d!90077 m!611207))

(declare-fun m!611209 () Bool)

(assert (=> d!90077 m!611209))

(declare-fun m!611211 () Bool)

(assert (=> d!90077 m!611211))

(assert (=> d!90077 m!611081))

(declare-fun m!611213 () Bool)

(assert (=> b!637048 m!611213))

(assert (=> b!637048 m!611213))

(assert (=> b!637048 m!611067))

(declare-fun m!611215 () Bool)

(assert (=> b!637048 m!611215))

(assert (=> b!636943 d!90077))

(declare-fun d!90079 () Bool)

(declare-fun lt!294561 () (_ BitVec 32))

(assert (=> d!90079 (and (bvsge lt!294561 #b00000000000000000000000000000000) (bvslt lt!294561 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90079 (= lt!294561 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90079 (validMask!0 mask!3053)))

(assert (=> d!90079 (= (nextIndex!0 index!984 x!910 mask!3053) lt!294561)))

(declare-fun bs!19124 () Bool)

(assert (= bs!19124 d!90079))

(declare-fun m!611217 () Bool)

(assert (=> bs!19124 m!611217))

(assert (=> bs!19124 m!611081))

(assert (=> b!636943 d!90079))

(declare-fun b!637052 () Bool)

(declare-fun e!364485 () SeekEntryResult!6789)

(assert (=> b!637052 (= e!364485 (MissingVacant!6789 vacantSpotIndex!68))))

(declare-fun b!637053 () Bool)

(declare-fun e!364487 () SeekEntryResult!6789)

(declare-fun e!364486 () SeekEntryResult!6789)

(assert (=> b!637053 (= e!364487 e!364486)))

(declare-fun c!72824 () Bool)

(declare-fun lt!294562 () (_ BitVec 64))

(assert (=> b!637053 (= c!72824 (= lt!294562 lt!294511))))

(declare-fun b!637055 () Bool)

(assert (=> b!637055 (= e!364487 Undefined!6789)))

(declare-fun b!637056 () Bool)

(assert (=> b!637056 (= e!364486 (Found!6789 lt!294507))))

(declare-fun b!637057 () Bool)

(declare-fun c!72823 () Bool)

(assert (=> b!637057 (= c!72823 (= lt!294562 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637057 (= e!364486 e!364485)))

(declare-fun d!90081 () Bool)

(declare-fun lt!294563 () SeekEntryResult!6789)

(assert (=> d!90081 (and (or ((_ is Undefined!6789) lt!294563) (not ((_ is Found!6789) lt!294563)) (and (bvsge (index!29468 lt!294563) #b00000000000000000000000000000000) (bvslt (index!29468 lt!294563) (size!18713 lt!294508)))) (or ((_ is Undefined!6789) lt!294563) ((_ is Found!6789) lt!294563) (not ((_ is MissingVacant!6789) lt!294563)) (not (= (index!29470 lt!294563) vacantSpotIndex!68)) (and (bvsge (index!29470 lt!294563) #b00000000000000000000000000000000) (bvslt (index!29470 lt!294563) (size!18713 lt!294508)))) (or ((_ is Undefined!6789) lt!294563) (ite ((_ is Found!6789) lt!294563) (= (select (arr!18349 lt!294508) (index!29468 lt!294563)) lt!294511) (and ((_ is MissingVacant!6789) lt!294563) (= (index!29470 lt!294563) vacantSpotIndex!68) (= (select (arr!18349 lt!294508) (index!29470 lt!294563)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90081 (= lt!294563 e!364487)))

(declare-fun c!72822 () Bool)

(assert (=> d!90081 (= c!72822 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90081 (= lt!294562 (select (arr!18349 lt!294508) lt!294507))))

(assert (=> d!90081 (validMask!0 mask!3053)))

(assert (=> d!90081 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294507 vacantSpotIndex!68 lt!294511 lt!294508 mask!3053) lt!294563)))

(declare-fun b!637054 () Bool)

(assert (=> b!637054 (= e!364485 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!294507 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!294511 lt!294508 mask!3053))))

(assert (= (and d!90081 c!72822) b!637055))

(assert (= (and d!90081 (not c!72822)) b!637053))

(assert (= (and b!637053 c!72824) b!637056))

(assert (= (and b!637053 (not c!72824)) b!637057))

(assert (= (and b!637057 c!72823) b!637052))

(assert (= (and b!637057 (not c!72823)) b!637054))

(declare-fun m!611219 () Bool)

(assert (=> d!90081 m!611219))

(declare-fun m!611221 () Bool)

(assert (=> d!90081 m!611221))

(declare-fun m!611223 () Bool)

(assert (=> d!90081 m!611223))

(assert (=> d!90081 m!611081))

(assert (=> b!637054 m!611213))

(assert (=> b!637054 m!611213))

(declare-fun m!611225 () Bool)

(assert (=> b!637054 m!611225))

(assert (=> b!636943 d!90081))

(declare-fun d!90083 () Bool)

(declare-fun e!364490 () Bool)

(assert (=> d!90083 e!364490))

(declare-fun res!412144 () Bool)

(assert (=> d!90083 (=> (not res!412144) (not e!364490))))

(assert (=> d!90083 (= res!412144 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18713 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18713 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18713 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18713 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18713 a!2986))))))

(declare-fun lt!294566 () Unit!21490)

(declare-fun choose!9 (array!38250 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21490)

(assert (=> d!90083 (= lt!294566 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294507 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90083 (validMask!0 mask!3053)))

(assert (=> d!90083 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294507 vacantSpotIndex!68 mask!3053) lt!294566)))

(declare-fun b!637060 () Bool)

(assert (=> b!637060 (= e!364490 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294507 vacantSpotIndex!68 (select (arr!18349 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294507 vacantSpotIndex!68 (select (store (arr!18349 a!2986) i!1108 k0!1786) j!136) (array!38251 (store (arr!18349 a!2986) i!1108 k0!1786) (size!18713 a!2986)) mask!3053)))))

(assert (= (and d!90083 res!412144) b!637060))

(declare-fun m!611227 () Bool)

(assert (=> d!90083 m!611227))

(assert (=> d!90083 m!611081))

(assert (=> b!637060 m!611105))

(assert (=> b!637060 m!611067))

(assert (=> b!637060 m!611091))

(assert (=> b!637060 m!611105))

(declare-fun m!611229 () Bool)

(assert (=> b!637060 m!611229))

(assert (=> b!637060 m!611067))

(assert (=> b!637060 m!611113))

(assert (=> b!636943 d!90083))

(declare-fun d!90085 () Bool)

(assert (=> d!90085 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!636929 d!90085))

(declare-fun d!90087 () Bool)

(assert (=> d!90087 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57604 d!90087))

(declare-fun d!90093 () Bool)

(assert (=> d!90093 (= (array_inv!14145 a!2986) (bvsge (size!18713 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57604 d!90093))

(declare-fun b!637104 () Bool)

(declare-fun e!364528 () Bool)

(declare-fun call!33457 () Bool)

(assert (=> b!637104 (= e!364528 call!33457)))

(declare-fun b!637105 () Bool)

(declare-fun e!364530 () Bool)

(declare-fun e!364529 () Bool)

(assert (=> b!637105 (= e!364530 e!364529)))

(declare-fun res!412176 () Bool)

(assert (=> b!637105 (=> (not res!412176) (not e!364529))))

(declare-fun e!364527 () Bool)

(assert (=> b!637105 (= res!412176 (not e!364527))))

(declare-fun res!412174 () Bool)

(assert (=> b!637105 (=> (not res!412174) (not e!364527))))

(assert (=> b!637105 (= res!412174 (validKeyInArray!0 (select (arr!18349 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33454 () Bool)

(declare-fun c!72832 () Bool)

(assert (=> bm!33454 (= call!33457 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72832 (Cons!12386 (select (arr!18349 a!2986) #b00000000000000000000000000000000) Nil!12387) Nil!12387)))))

(declare-fun b!637107 () Bool)

(assert (=> b!637107 (= e!364528 call!33457)))

(declare-fun b!637108 () Bool)

(assert (=> b!637108 (= e!364527 (contains!3104 Nil!12387 (select (arr!18349 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90097 () Bool)

(declare-fun res!412175 () Bool)

(assert (=> d!90097 (=> res!412175 e!364530)))

(assert (=> d!90097 (= res!412175 (bvsge #b00000000000000000000000000000000 (size!18713 a!2986)))))

(assert (=> d!90097 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12387) e!364530)))

(declare-fun b!637106 () Bool)

(assert (=> b!637106 (= e!364529 e!364528)))

(assert (=> b!637106 (= c!72832 (validKeyInArray!0 (select (arr!18349 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90097 (not res!412175)) b!637105))

(assert (= (and b!637105 res!412174) b!637108))

(assert (= (and b!637105 res!412176) b!637106))

(assert (= (and b!637106 c!72832) b!637107))

(assert (= (and b!637106 (not c!72832)) b!637104))

(assert (= (or b!637107 b!637104) bm!33454))

(declare-fun m!611243 () Bool)

(assert (=> b!637105 m!611243))

(assert (=> b!637105 m!611243))

(declare-fun m!611245 () Bool)

(assert (=> b!637105 m!611245))

(assert (=> bm!33454 m!611243))

(declare-fun m!611247 () Bool)

(assert (=> bm!33454 m!611247))

(assert (=> b!637108 m!611243))

(assert (=> b!637108 m!611243))

(declare-fun m!611249 () Bool)

(assert (=> b!637108 m!611249))

(assert (=> b!637106 m!611243))

(assert (=> b!637106 m!611243))

(assert (=> b!637106 m!611245))

(assert (=> b!636928 d!90097))

(declare-fun b!637157 () Bool)

(declare-fun e!364566 () SeekEntryResult!6789)

(assert (=> b!637157 (= e!364566 Undefined!6789)))

(declare-fun b!637158 () Bool)

(declare-fun c!72846 () Bool)

(declare-fun lt!294597 () (_ BitVec 64))

(assert (=> b!637158 (= c!72846 (= lt!294597 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364568 () SeekEntryResult!6789)

(declare-fun e!364567 () SeekEntryResult!6789)

(assert (=> b!637158 (= e!364568 e!364567)))

(declare-fun lt!294595 () SeekEntryResult!6789)

(declare-fun b!637159 () Bool)

(assert (=> b!637159 (= e!364567 (seekKeyOrZeroReturnVacant!0 (x!58222 lt!294595) (index!29469 lt!294595) (index!29469 lt!294595) k0!1786 a!2986 mask!3053))))

(declare-fun b!637160 () Bool)

(assert (=> b!637160 (= e!364568 (Found!6789 (index!29469 lt!294595)))))

(declare-fun b!637162 () Bool)

(assert (=> b!637162 (= e!364567 (MissingZero!6789 (index!29469 lt!294595)))))

(declare-fun d!90101 () Bool)

(declare-fun lt!294596 () SeekEntryResult!6789)

(assert (=> d!90101 (and (or ((_ is Undefined!6789) lt!294596) (not ((_ is Found!6789) lt!294596)) (and (bvsge (index!29468 lt!294596) #b00000000000000000000000000000000) (bvslt (index!29468 lt!294596) (size!18713 a!2986)))) (or ((_ is Undefined!6789) lt!294596) ((_ is Found!6789) lt!294596) (not ((_ is MissingZero!6789) lt!294596)) (and (bvsge (index!29467 lt!294596) #b00000000000000000000000000000000) (bvslt (index!29467 lt!294596) (size!18713 a!2986)))) (or ((_ is Undefined!6789) lt!294596) ((_ is Found!6789) lt!294596) ((_ is MissingZero!6789) lt!294596) (not ((_ is MissingVacant!6789) lt!294596)) (and (bvsge (index!29470 lt!294596) #b00000000000000000000000000000000) (bvslt (index!29470 lt!294596) (size!18713 a!2986)))) (or ((_ is Undefined!6789) lt!294596) (ite ((_ is Found!6789) lt!294596) (= (select (arr!18349 a!2986) (index!29468 lt!294596)) k0!1786) (ite ((_ is MissingZero!6789) lt!294596) (= (select (arr!18349 a!2986) (index!29467 lt!294596)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6789) lt!294596) (= (select (arr!18349 a!2986) (index!29470 lt!294596)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90101 (= lt!294596 e!364566)))

(declare-fun c!72848 () Bool)

(assert (=> d!90101 (= c!72848 (and ((_ is Intermediate!6789) lt!294595) (undefined!7601 lt!294595)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38250 (_ BitVec 32)) SeekEntryResult!6789)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90101 (= lt!294595 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90101 (validMask!0 mask!3053)))

(assert (=> d!90101 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!294596)))

(declare-fun b!637161 () Bool)

(assert (=> b!637161 (= e!364566 e!364568)))

(assert (=> b!637161 (= lt!294597 (select (arr!18349 a!2986) (index!29469 lt!294595)))))

(declare-fun c!72847 () Bool)

(assert (=> b!637161 (= c!72847 (= lt!294597 k0!1786))))

(assert (= (and d!90101 c!72848) b!637157))

(assert (= (and d!90101 (not c!72848)) b!637161))

(assert (= (and b!637161 c!72847) b!637160))

(assert (= (and b!637161 (not c!72847)) b!637158))

(assert (= (and b!637158 c!72846) b!637162))

(assert (= (and b!637158 (not c!72846)) b!637159))

(declare-fun m!611289 () Bool)

(assert (=> b!637159 m!611289))

(declare-fun m!611291 () Bool)

(assert (=> d!90101 m!611291))

(assert (=> d!90101 m!611081))

(declare-fun m!611293 () Bool)

(assert (=> d!90101 m!611293))

(assert (=> d!90101 m!611293))

(declare-fun m!611295 () Bool)

(assert (=> d!90101 m!611295))

(declare-fun m!611297 () Bool)

(assert (=> d!90101 m!611297))

(declare-fun m!611299 () Bool)

(assert (=> d!90101 m!611299))

(declare-fun m!611301 () Bool)

(assert (=> b!637161 m!611301))

(assert (=> b!636939 d!90101))

(declare-fun d!90127 () Bool)

(declare-fun res!412199 () Bool)

(declare-fun e!364569 () Bool)

(assert (=> d!90127 (=> res!412199 e!364569)))

(assert (=> d!90127 (= res!412199 (= (select (arr!18349 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90127 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!364569)))

(declare-fun b!637163 () Bool)

(declare-fun e!364570 () Bool)

(assert (=> b!637163 (= e!364569 e!364570)))

(declare-fun res!412200 () Bool)

(assert (=> b!637163 (=> (not res!412200) (not e!364570))))

(assert (=> b!637163 (= res!412200 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18713 a!2986)))))

(declare-fun b!637164 () Bool)

(assert (=> b!637164 (= e!364570 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90127 (not res!412199)) b!637163))

(assert (= (and b!637163 res!412200) b!637164))

(assert (=> d!90127 m!611243))

(declare-fun m!611303 () Bool)

(assert (=> b!637164 m!611303))

(assert (=> b!636941 d!90127))

(declare-fun d!90129 () Bool)

(declare-fun lt!294598 () Bool)

(assert (=> d!90129 (= lt!294598 (select (content!244 Nil!12387) k0!1786))))

(declare-fun e!364571 () Bool)

(assert (=> d!90129 (= lt!294598 e!364571)))

(declare-fun res!412202 () Bool)

(assert (=> d!90129 (=> (not res!412202) (not e!364571))))

(assert (=> d!90129 (= res!412202 ((_ is Cons!12386) Nil!12387))))

(assert (=> d!90129 (= (contains!3104 Nil!12387 k0!1786) lt!294598)))

(declare-fun b!637165 () Bool)

(declare-fun e!364572 () Bool)

(assert (=> b!637165 (= e!364571 e!364572)))

(declare-fun res!412201 () Bool)

(assert (=> b!637165 (=> res!412201 e!364572)))

(assert (=> b!637165 (= res!412201 (= (h!13431 Nil!12387) k0!1786))))

(declare-fun b!637166 () Bool)

(assert (=> b!637166 (= e!364572 (contains!3104 (t!18618 Nil!12387) k0!1786))))

(assert (= (and d!90129 res!412202) b!637165))

(assert (= (and b!637165 (not res!412201)) b!637166))

(assert (=> d!90129 m!611193))

(declare-fun m!611305 () Bool)

(assert (=> d!90129 m!611305))

(declare-fun m!611307 () Bool)

(assert (=> b!637166 m!611307))

(assert (=> b!636926 d!90129))

(declare-fun d!90131 () Bool)

(declare-fun lt!294599 () Bool)

(assert (=> d!90131 (= lt!294599 (select (content!244 Nil!12387) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364573 () Bool)

(assert (=> d!90131 (= lt!294599 e!364573)))

(declare-fun res!412204 () Bool)

(assert (=> d!90131 (=> (not res!412204) (not e!364573))))

(assert (=> d!90131 (= res!412204 ((_ is Cons!12386) Nil!12387))))

(assert (=> d!90131 (= (contains!3104 Nil!12387 #b1000000000000000000000000000000000000000000000000000000000000000) lt!294599)))

(declare-fun b!637167 () Bool)

(declare-fun e!364574 () Bool)

(assert (=> b!637167 (= e!364573 e!364574)))

(declare-fun res!412203 () Bool)

(assert (=> b!637167 (=> res!412203 e!364574)))

(assert (=> b!637167 (= res!412203 (= (h!13431 Nil!12387) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637168 () Bool)

(assert (=> b!637168 (= e!364574 (contains!3104 (t!18618 Nil!12387) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!90131 res!412204) b!637167))

(assert (= (and b!637167 (not res!412203)) b!637168))

(assert (=> d!90131 m!611193))

(declare-fun m!611309 () Bool)

(assert (=> d!90131 m!611309))

(declare-fun m!611311 () Bool)

(assert (=> b!637168 m!611311))

(assert (=> b!636937 d!90131))

(declare-fun d!90133 () Bool)

(declare-fun res!412209 () Bool)

(declare-fun e!364582 () Bool)

(assert (=> d!90133 (=> res!412209 e!364582)))

(assert (=> d!90133 (= res!412209 ((_ is Nil!12387) Nil!12387))))

(assert (=> d!90133 (= (noDuplicate!382 Nil!12387) e!364582)))

(declare-fun b!637179 () Bool)

(declare-fun e!364583 () Bool)

(assert (=> b!637179 (= e!364582 e!364583)))

(declare-fun res!412210 () Bool)

(assert (=> b!637179 (=> (not res!412210) (not e!364583))))

(assert (=> b!637179 (= res!412210 (not (contains!3104 (t!18618 Nil!12387) (h!13431 Nil!12387))))))

(declare-fun b!637180 () Bool)

(assert (=> b!637180 (= e!364583 (noDuplicate!382 (t!18618 Nil!12387)))))

(assert (= (and d!90133 (not res!412209)) b!637179))

(assert (= (and b!637179 res!412210) b!637180))

(declare-fun m!611319 () Bool)

(assert (=> b!637179 m!611319))

(declare-fun m!611321 () Bool)

(assert (=> b!637180 m!611321))

(assert (=> b!636938 d!90133))

(declare-fun b!637181 () Bool)

(declare-fun e!364584 () SeekEntryResult!6789)

(assert (=> b!637181 (= e!364584 (MissingVacant!6789 vacantSpotIndex!68))))

(declare-fun b!637182 () Bool)

(declare-fun e!364586 () SeekEntryResult!6789)

(declare-fun e!364585 () SeekEntryResult!6789)

(assert (=> b!637182 (= e!364586 e!364585)))

(declare-fun lt!294602 () (_ BitVec 64))

(declare-fun c!72854 () Bool)

(assert (=> b!637182 (= c!72854 (= lt!294602 (select (arr!18349 a!2986) j!136)))))

(declare-fun b!637184 () Bool)

(assert (=> b!637184 (= e!364586 Undefined!6789)))

(declare-fun b!637185 () Bool)

(assert (=> b!637185 (= e!364585 (Found!6789 index!984))))

(declare-fun b!637186 () Bool)

(declare-fun c!72853 () Bool)

(assert (=> b!637186 (= c!72853 (= lt!294602 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637186 (= e!364585 e!364584)))

(declare-fun d!90139 () Bool)

(declare-fun lt!294603 () SeekEntryResult!6789)

(assert (=> d!90139 (and (or ((_ is Undefined!6789) lt!294603) (not ((_ is Found!6789) lt!294603)) (and (bvsge (index!29468 lt!294603) #b00000000000000000000000000000000) (bvslt (index!29468 lt!294603) (size!18713 a!2986)))) (or ((_ is Undefined!6789) lt!294603) ((_ is Found!6789) lt!294603) (not ((_ is MissingVacant!6789) lt!294603)) (not (= (index!29470 lt!294603) vacantSpotIndex!68)) (and (bvsge (index!29470 lt!294603) #b00000000000000000000000000000000) (bvslt (index!29470 lt!294603) (size!18713 a!2986)))) (or ((_ is Undefined!6789) lt!294603) (ite ((_ is Found!6789) lt!294603) (= (select (arr!18349 a!2986) (index!29468 lt!294603)) (select (arr!18349 a!2986) j!136)) (and ((_ is MissingVacant!6789) lt!294603) (= (index!29470 lt!294603) vacantSpotIndex!68) (= (select (arr!18349 a!2986) (index!29470 lt!294603)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90139 (= lt!294603 e!364586)))

(declare-fun c!72852 () Bool)

(assert (=> d!90139 (= c!72852 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90139 (= lt!294602 (select (arr!18349 a!2986) index!984))))

(assert (=> d!90139 (validMask!0 mask!3053)))

(assert (=> d!90139 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18349 a!2986) j!136) a!2986 mask!3053) lt!294603)))

(declare-fun b!637183 () Bool)

(assert (=> b!637183 (= e!364584 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18349 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!90139 c!72852) b!637184))

(assert (= (and d!90139 (not c!72852)) b!637182))

(assert (= (and b!637182 c!72854) b!637185))

(assert (= (and b!637182 (not c!72854)) b!637186))

(assert (= (and b!637186 c!72853) b!637181))

(assert (= (and b!637186 (not c!72853)) b!637183))

(declare-fun m!611323 () Bool)

(assert (=> d!90139 m!611323))

(declare-fun m!611325 () Bool)

(assert (=> d!90139 m!611325))

(assert (=> d!90139 m!611095))

(assert (=> d!90139 m!611081))

(assert (=> b!637183 m!611103))

(assert (=> b!637183 m!611103))

(assert (=> b!637183 m!611067))

(declare-fun m!611327 () Bool)

(assert (=> b!637183 m!611327))

(assert (=> b!636927 d!90139))

(declare-fun d!90141 () Bool)

(assert (=> d!90141 (= (validKeyInArray!0 (select (arr!18349 a!2986) j!136)) (and (not (= (select (arr!18349 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18349 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!636934 d!90141))

(declare-fun d!90143 () Bool)

(declare-fun res!412211 () Bool)

(declare-fun e!364587 () Bool)

(assert (=> d!90143 (=> res!412211 e!364587)))

(assert (=> d!90143 (= res!412211 (= (select (arr!18349 lt!294508) index!984) (select (arr!18349 a!2986) j!136)))))

(assert (=> d!90143 (= (arrayContainsKey!0 lt!294508 (select (arr!18349 a!2986) j!136) index!984) e!364587)))

(declare-fun b!637187 () Bool)

(declare-fun e!364588 () Bool)

(assert (=> b!637187 (= e!364587 e!364588)))

(declare-fun res!412212 () Bool)

(assert (=> b!637187 (=> (not res!412212) (not e!364588))))

(assert (=> b!637187 (= res!412212 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18713 lt!294508)))))

(declare-fun b!637188 () Bool)

(assert (=> b!637188 (= e!364588 (arrayContainsKey!0 lt!294508 (select (arr!18349 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90143 (not res!412211)) b!637187))

(assert (= (and b!637187 res!412212) b!637188))

(assert (=> d!90143 m!611203))

(assert (=> b!637188 m!611067))

(declare-fun m!611329 () Bool)

(assert (=> b!637188 m!611329))

(assert (=> b!636924 d!90143))

(declare-fun d!90145 () Bool)

(declare-fun res!412217 () Bool)

(declare-fun e!364602 () Bool)

(assert (=> d!90145 (=> res!412217 e!364602)))

(assert (=> d!90145 (= res!412217 (bvsge #b00000000000000000000000000000000 (size!18713 a!2986)))))

(assert (=> d!90145 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!364602)))

(declare-fun bm!33458 () Bool)

(declare-fun call!33461 () Bool)

(assert (=> bm!33458 (= call!33461 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!637209 () Bool)

(declare-fun e!364601 () Bool)

(assert (=> b!637209 (= e!364601 call!33461)))

(declare-fun b!637210 () Bool)

(declare-fun e!364603 () Bool)

(assert (=> b!637210 (= e!364602 e!364603)))

(declare-fun c!72863 () Bool)

(assert (=> b!637210 (= c!72863 (validKeyInArray!0 (select (arr!18349 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!637211 () Bool)

(assert (=> b!637211 (= e!364603 e!364601)))

(declare-fun lt!294616 () (_ BitVec 64))

(assert (=> b!637211 (= lt!294616 (select (arr!18349 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!294618 () Unit!21490)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38250 (_ BitVec 64) (_ BitVec 32)) Unit!21490)

(assert (=> b!637211 (= lt!294618 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!294616 #b00000000000000000000000000000000))))

(assert (=> b!637211 (arrayContainsKey!0 a!2986 lt!294616 #b00000000000000000000000000000000)))

(declare-fun lt!294617 () Unit!21490)

(assert (=> b!637211 (= lt!294617 lt!294618)))

(declare-fun res!412218 () Bool)

(assert (=> b!637211 (= res!412218 (= (seekEntryOrOpen!0 (select (arr!18349 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6789 #b00000000000000000000000000000000)))))

(assert (=> b!637211 (=> (not res!412218) (not e!364601))))

(declare-fun b!637212 () Bool)

(assert (=> b!637212 (= e!364603 call!33461)))

(assert (= (and d!90145 (not res!412217)) b!637210))

(assert (= (and b!637210 c!72863) b!637211))

(assert (= (and b!637210 (not c!72863)) b!637212))

(assert (= (and b!637211 res!412218) b!637209))

(assert (= (or b!637209 b!637212) bm!33458))

(declare-fun m!611331 () Bool)

(assert (=> bm!33458 m!611331))

(assert (=> b!637210 m!611243))

(assert (=> b!637210 m!611243))

(assert (=> b!637210 m!611245))

(assert (=> b!637211 m!611243))

(declare-fun m!611333 () Bool)

(assert (=> b!637211 m!611333))

(declare-fun m!611335 () Bool)

(assert (=> b!637211 m!611335))

(assert (=> b!637211 m!611243))

(declare-fun m!611337 () Bool)

(assert (=> b!637211 m!611337))

(assert (=> b!636935 d!90145))

(check-sat (not b!637108) (not b!637042) (not b!637159) (not d!90081) (not d!90139) (not b!637180) (not d!90079) (not b!637019) (not b!637166) (not b!637021) (not d!90071) (not d!90075) (not bm!33458) (not d!90077) (not d!90083) (not b!637183) (not b!637211) (not b!637164) (not b!637060) (not b!637168) (not b!637179) (not b!637105) (not b!637210) (not b!637048) (not d!90129) (not bm!33454) (not d!90101) (not b!637027) (not b!637106) (not d!90131) (not b!637188) (not d!90073) (not b!637054))
(check-sat)
