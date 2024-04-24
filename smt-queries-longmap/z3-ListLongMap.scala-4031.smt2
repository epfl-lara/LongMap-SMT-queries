; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54942 () Bool)

(assert start!54942)

(declare-fun b!600922 () Bool)

(declare-fun res!385694 () Bool)

(declare-fun e!343595 () Bool)

(assert (=> b!600922 (=> (not res!385694) (not e!343595))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37122 0))(
  ( (array!37123 (arr!17818 (Array (_ BitVec 32) (_ BitVec 64))) (size!18182 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37122)

(assert (=> b!600922 (= res!385694 (and (= (size!18182 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18182 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18182 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600923 () Bool)

(declare-fun res!385685 () Bool)

(declare-fun e!343593 () Bool)

(assert (=> b!600923 (=> res!385685 e!343593)))

(declare-datatypes ((List!11766 0))(
  ( (Nil!11763) (Cons!11762 (h!12810 (_ BitVec 64)) (t!17986 List!11766)) )
))
(declare-fun contains!2956 (List!11766 (_ BitVec 64)) Bool)

(assert (=> b!600923 (= res!385685 (contains!2956 Nil!11763 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600924 () Bool)

(declare-fun e!343596 () Bool)

(assert (=> b!600924 (= e!343596 e!343593)))

(declare-fun res!385682 () Bool)

(assert (=> b!600924 (=> res!385682 e!343593)))

(assert (=> b!600924 (= res!385682 (or (bvsge (size!18182 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18182 a!2986))))))

(declare-fun lt!273408 () array!37122)

(declare-fun arrayNoDuplicates!0 (array!37122 (_ BitVec 32) List!11766) Bool)

(assert (=> b!600924 (arrayNoDuplicates!0 lt!273408 j!136 Nil!11763)))

(declare-datatypes ((Unit!18949 0))(
  ( (Unit!18950) )
))
(declare-fun lt!273416 () Unit!18949)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37122 (_ BitVec 32) (_ BitVec 32)) Unit!18949)

(assert (=> b!600924 (= lt!273416 (lemmaNoDuplicateFromThenFromBigger!0 lt!273408 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600924 (arrayNoDuplicates!0 lt!273408 #b00000000000000000000000000000000 Nil!11763)))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!273417 () Unit!18949)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37122 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11766) Unit!18949)

(assert (=> b!600924 (= lt!273417 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11763))))

(declare-fun arrayContainsKey!0 (array!37122 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600924 (arrayContainsKey!0 lt!273408 (select (arr!17818 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273414 () Unit!18949)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37122 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18949)

(assert (=> b!600924 (= lt!273414 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273408 (select (arr!17818 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600925 () Bool)

(declare-fun e!343584 () Bool)

(assert (=> b!600925 (= e!343584 e!343596)))

(declare-fun res!385679 () Bool)

(assert (=> b!600925 (=> res!385679 e!343596)))

(declare-fun lt!273410 () (_ BitVec 64))

(declare-fun lt!273412 () (_ BitVec 64))

(assert (=> b!600925 (= res!385679 (or (not (= (select (arr!17818 a!2986) j!136) lt!273412)) (not (= (select (arr!17818 a!2986) j!136) lt!273410)) (bvsge j!136 index!984)))))

(declare-fun e!343592 () Bool)

(assert (=> b!600925 e!343592))

(declare-fun res!385680 () Bool)

(assert (=> b!600925 (=> (not res!385680) (not e!343592))))

(assert (=> b!600925 (= res!385680 (= lt!273410 (select (arr!17818 a!2986) j!136)))))

(assert (=> b!600925 (= lt!273410 (select (store (arr!17818 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!600927 () Bool)

(declare-fun res!385687 () Bool)

(declare-fun e!343585 () Bool)

(assert (=> b!600927 (=> (not res!385687) (not e!343585))))

(assert (=> b!600927 (= res!385687 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11763))))

(declare-fun b!600928 () Bool)

(declare-fun e!343586 () Bool)

(declare-fun e!343590 () Bool)

(assert (=> b!600928 (= e!343586 e!343590)))

(declare-fun res!385692 () Bool)

(assert (=> b!600928 (=> (not res!385692) (not e!343590))))

(assert (=> b!600928 (= res!385692 (arrayContainsKey!0 lt!273408 (select (arr!17818 a!2986) j!136) j!136))))

(declare-fun b!600929 () Bool)

(declare-fun e!343588 () Unit!18949)

(declare-fun Unit!18951 () Unit!18949)

(assert (=> b!600929 (= e!343588 Unit!18951)))

(assert (=> b!600929 false))

(declare-fun b!600930 () Bool)

(declare-fun e!343587 () Bool)

(declare-datatypes ((SeekEntryResult!6214 0))(
  ( (MissingZero!6214 (index!27113 (_ BitVec 32))) (Found!6214 (index!27114 (_ BitVec 32))) (Intermediate!6214 (undefined!7026 Bool) (index!27115 (_ BitVec 32)) (x!56064 (_ BitVec 32))) (Undefined!6214) (MissingVacant!6214 (index!27116 (_ BitVec 32))) )
))
(declare-fun lt!273421 () SeekEntryResult!6214)

(declare-fun lt!273419 () SeekEntryResult!6214)

(assert (=> b!600930 (= e!343587 (= lt!273421 lt!273419))))

(declare-fun b!600931 () Bool)

(declare-fun res!385678 () Bool)

(assert (=> b!600931 (=> (not res!385678) (not e!343595))))

(assert (=> b!600931 (= res!385678 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600932 () Bool)

(assert (=> b!600932 (= e!343590 (arrayContainsKey!0 lt!273408 (select (arr!17818 a!2986) j!136) index!984))))

(declare-fun b!600933 () Bool)

(declare-fun e!343591 () Bool)

(declare-fun e!343589 () Bool)

(assert (=> b!600933 (= e!343591 e!343589)))

(declare-fun res!385684 () Bool)

(assert (=> b!600933 (=> (not res!385684) (not e!343589))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!600933 (= res!385684 (and (= lt!273421 (Found!6214 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17818 a!2986) index!984) (select (arr!17818 a!2986) j!136))) (not (= (select (arr!17818 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37122 (_ BitVec 32)) SeekEntryResult!6214)

(assert (=> b!600933 (= lt!273421 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17818 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600934 () Bool)

(declare-fun res!385686 () Bool)

(assert (=> b!600934 (=> res!385686 e!343593)))

(declare-fun noDuplicate!301 (List!11766) Bool)

(assert (=> b!600934 (= res!385686 (not (noDuplicate!301 Nil!11763)))))

(declare-fun b!600935 () Bool)

(declare-fun res!385693 () Bool)

(assert (=> b!600935 (=> (not res!385693) (not e!343585))))

(assert (=> b!600935 (= res!385693 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17818 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600936 () Bool)

(declare-fun res!385690 () Bool)

(assert (=> b!600936 (=> (not res!385690) (not e!343595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600936 (= res!385690 (validKeyInArray!0 k0!1786))))

(declare-fun b!600937 () Bool)

(assert (=> b!600937 (= e!343595 e!343585)))

(declare-fun res!385689 () Bool)

(assert (=> b!600937 (=> (not res!385689) (not e!343585))))

(declare-fun lt!273415 () SeekEntryResult!6214)

(assert (=> b!600937 (= res!385689 (or (= lt!273415 (MissingZero!6214 i!1108)) (= lt!273415 (MissingVacant!6214 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37122 (_ BitVec 32)) SeekEntryResult!6214)

(assert (=> b!600937 (= lt!273415 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!600926 () Bool)

(declare-fun res!385691 () Bool)

(assert (=> b!600926 (=> (not res!385691) (not e!343595))))

(assert (=> b!600926 (= res!385691 (validKeyInArray!0 (select (arr!17818 a!2986) j!136)))))

(declare-fun res!385688 () Bool)

(assert (=> start!54942 (=> (not res!385688) (not e!343595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54942 (= res!385688 (validMask!0 mask!3053))))

(assert (=> start!54942 e!343595))

(assert (=> start!54942 true))

(declare-fun array_inv!13677 (array!37122) Bool)

(assert (=> start!54942 (array_inv!13677 a!2986)))

(declare-fun b!600938 () Bool)

(assert (=> b!600938 (= e!343592 e!343586)))

(declare-fun res!385681 () Bool)

(assert (=> b!600938 (=> res!385681 e!343586)))

(assert (=> b!600938 (= res!385681 (or (not (= (select (arr!17818 a!2986) j!136) lt!273412)) (not (= (select (arr!17818 a!2986) j!136) lt!273410)) (bvsge j!136 index!984)))))

(declare-fun b!600939 () Bool)

(declare-fun res!385683 () Bool)

(assert (=> b!600939 (=> (not res!385683) (not e!343585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37122 (_ BitVec 32)) Bool)

(assert (=> b!600939 (= res!385683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600940 () Bool)

(assert (=> b!600940 (= e!343593 true)))

(declare-fun lt!273411 () Bool)

(assert (=> b!600940 (= lt!273411 (contains!2956 Nil!11763 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600941 () Bool)

(assert (=> b!600941 (= e!343589 (not e!343584))))

(declare-fun res!385695 () Bool)

(assert (=> b!600941 (=> res!385695 e!343584)))

(declare-fun lt!273413 () SeekEntryResult!6214)

(assert (=> b!600941 (= res!385695 (not (= lt!273413 (Found!6214 index!984))))))

(declare-fun lt!273420 () Unit!18949)

(assert (=> b!600941 (= lt!273420 e!343588)))

(declare-fun c!67991 () Bool)

(assert (=> b!600941 (= c!67991 (= lt!273413 Undefined!6214))))

(assert (=> b!600941 (= lt!273413 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273412 lt!273408 mask!3053))))

(assert (=> b!600941 e!343587))

(declare-fun res!385696 () Bool)

(assert (=> b!600941 (=> (not res!385696) (not e!343587))))

(declare-fun lt!273409 () (_ BitVec 32))

(assert (=> b!600941 (= res!385696 (= lt!273419 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273409 vacantSpotIndex!68 lt!273412 lt!273408 mask!3053)))))

(assert (=> b!600941 (= lt!273419 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273409 vacantSpotIndex!68 (select (arr!17818 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600941 (= lt!273412 (select (store (arr!17818 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273418 () Unit!18949)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37122 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18949)

(assert (=> b!600941 (= lt!273418 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273409 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600941 (= lt!273409 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!600942 () Bool)

(declare-fun Unit!18952 () Unit!18949)

(assert (=> b!600942 (= e!343588 Unit!18952)))

(declare-fun b!600943 () Bool)

(assert (=> b!600943 (= e!343585 e!343591)))

(declare-fun res!385677 () Bool)

(assert (=> b!600943 (=> (not res!385677) (not e!343591))))

(assert (=> b!600943 (= res!385677 (= (select (store (arr!17818 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600943 (= lt!273408 (array!37123 (store (arr!17818 a!2986) i!1108 k0!1786) (size!18182 a!2986)))))

(assert (= (and start!54942 res!385688) b!600922))

(assert (= (and b!600922 res!385694) b!600926))

(assert (= (and b!600926 res!385691) b!600936))

(assert (= (and b!600936 res!385690) b!600931))

(assert (= (and b!600931 res!385678) b!600937))

(assert (= (and b!600937 res!385689) b!600939))

(assert (= (and b!600939 res!385683) b!600927))

(assert (= (and b!600927 res!385687) b!600935))

(assert (= (and b!600935 res!385693) b!600943))

(assert (= (and b!600943 res!385677) b!600933))

(assert (= (and b!600933 res!385684) b!600941))

(assert (= (and b!600941 res!385696) b!600930))

(assert (= (and b!600941 c!67991) b!600929))

(assert (= (and b!600941 (not c!67991)) b!600942))

(assert (= (and b!600941 (not res!385695)) b!600925))

(assert (= (and b!600925 res!385680) b!600938))

(assert (= (and b!600938 (not res!385681)) b!600928))

(assert (= (and b!600928 res!385692) b!600932))

(assert (= (and b!600925 (not res!385679)) b!600924))

(assert (= (and b!600924 (not res!385682)) b!600934))

(assert (= (and b!600934 (not res!385686)) b!600923))

(assert (= (and b!600923 (not res!385685)) b!600940))

(declare-fun m!578357 () Bool)

(assert (=> b!600943 m!578357))

(declare-fun m!578359 () Bool)

(assert (=> b!600943 m!578359))

(declare-fun m!578361 () Bool)

(assert (=> b!600938 m!578361))

(assert (=> b!600926 m!578361))

(assert (=> b!600926 m!578361))

(declare-fun m!578363 () Bool)

(assert (=> b!600926 m!578363))

(declare-fun m!578365 () Bool)

(assert (=> b!600937 m!578365))

(assert (=> b!600928 m!578361))

(assert (=> b!600928 m!578361))

(declare-fun m!578367 () Bool)

(assert (=> b!600928 m!578367))

(declare-fun m!578369 () Bool)

(assert (=> b!600927 m!578369))

(declare-fun m!578371 () Bool)

(assert (=> b!600939 m!578371))

(assert (=> b!600924 m!578361))

(declare-fun m!578373 () Bool)

(assert (=> b!600924 m!578373))

(assert (=> b!600924 m!578361))

(assert (=> b!600924 m!578361))

(declare-fun m!578375 () Bool)

(assert (=> b!600924 m!578375))

(declare-fun m!578377 () Bool)

(assert (=> b!600924 m!578377))

(declare-fun m!578379 () Bool)

(assert (=> b!600924 m!578379))

(declare-fun m!578381 () Bool)

(assert (=> b!600924 m!578381))

(declare-fun m!578383 () Bool)

(assert (=> b!600924 m!578383))

(declare-fun m!578385 () Bool)

(assert (=> start!54942 m!578385))

(declare-fun m!578387 () Bool)

(assert (=> start!54942 m!578387))

(declare-fun m!578389 () Bool)

(assert (=> b!600936 m!578389))

(assert (=> b!600925 m!578361))

(assert (=> b!600925 m!578357))

(declare-fun m!578391 () Bool)

(assert (=> b!600925 m!578391))

(assert (=> b!600932 m!578361))

(assert (=> b!600932 m!578361))

(declare-fun m!578393 () Bool)

(assert (=> b!600932 m!578393))

(declare-fun m!578395 () Bool)

(assert (=> b!600933 m!578395))

(assert (=> b!600933 m!578361))

(assert (=> b!600933 m!578361))

(declare-fun m!578397 () Bool)

(assert (=> b!600933 m!578397))

(declare-fun m!578399 () Bool)

(assert (=> b!600934 m!578399))

(declare-fun m!578401 () Bool)

(assert (=> b!600941 m!578401))

(declare-fun m!578403 () Bool)

(assert (=> b!600941 m!578403))

(assert (=> b!600941 m!578361))

(assert (=> b!600941 m!578357))

(declare-fun m!578405 () Bool)

(assert (=> b!600941 m!578405))

(declare-fun m!578407 () Bool)

(assert (=> b!600941 m!578407))

(assert (=> b!600941 m!578361))

(declare-fun m!578409 () Bool)

(assert (=> b!600941 m!578409))

(declare-fun m!578411 () Bool)

(assert (=> b!600941 m!578411))

(declare-fun m!578413 () Bool)

(assert (=> b!600931 m!578413))

(declare-fun m!578415 () Bool)

(assert (=> b!600935 m!578415))

(declare-fun m!578417 () Bool)

(assert (=> b!600940 m!578417))

(declare-fun m!578419 () Bool)

(assert (=> b!600923 m!578419))

(check-sat (not b!600924) (not b!600940) (not b!600932) (not b!600937) (not b!600933) (not b!600934) (not b!600931) (not b!600927) (not b!600939) (not start!54942) (not b!600928) (not b!600926) (not b!600923) (not b!600941) (not b!600936))
(check-sat)
