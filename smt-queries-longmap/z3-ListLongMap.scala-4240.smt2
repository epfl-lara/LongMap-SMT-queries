; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58546 () Bool)

(assert start!58546)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38481 0))(
  ( (array!38482 (arr!18451 (Array (_ BitVec 32) (_ BitVec 64))) (size!18815 (_ BitVec 32))) )
))
(declare-fun lt!299931 () array!38481)

(declare-fun e!370570 () Bool)

(declare-fun b!646459 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38481)

(declare-fun arrayContainsKey!0 (array!38481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!646459 (= e!370570 (arrayContainsKey!0 lt!299931 (select (arr!18451 a!2986) j!136) index!984))))

(declare-fun b!646460 () Bool)

(declare-fun e!370573 () Bool)

(declare-fun e!370574 () Bool)

(assert (=> b!646460 (= e!370573 e!370574)))

(declare-fun res!418879 () Bool)

(assert (=> b!646460 (=> (not res!418879) (not e!370574))))

(declare-datatypes ((SeekEntryResult!6891 0))(
  ( (MissingZero!6891 (index!29902 (_ BitVec 32))) (Found!6891 (index!29903 (_ BitVec 32))) (Intermediate!6891 (undefined!7703 Bool) (index!29904 (_ BitVec 32)) (x!58677 (_ BitVec 32))) (Undefined!6891) (MissingVacant!6891 (index!29905 (_ BitVec 32))) )
))
(declare-fun lt!299924 () SeekEntryResult!6891)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!646460 (= res!418879 (or (= lt!299924 (MissingZero!6891 i!1108)) (= lt!299924 (MissingVacant!6891 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38481 (_ BitVec 32)) SeekEntryResult!6891)

(assert (=> b!646460 (= lt!299924 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!646461 () Bool)

(declare-fun e!370565 () Bool)

(declare-fun e!370562 () Bool)

(assert (=> b!646461 (= e!370565 e!370562)))

(declare-fun res!418875 () Bool)

(assert (=> b!646461 (=> res!418875 e!370562)))

(declare-fun lt!299923 () (_ BitVec 64))

(declare-fun lt!299930 () (_ BitVec 64))

(assert (=> b!646461 (= res!418875 (or (not (= (select (arr!18451 a!2986) j!136) lt!299930)) (not (= (select (arr!18451 a!2986) j!136) lt!299923))))))

(declare-fun e!370561 () Bool)

(assert (=> b!646461 e!370561))

(declare-fun res!418884 () Bool)

(assert (=> b!646461 (=> (not res!418884) (not e!370561))))

(assert (=> b!646461 (= res!418884 (= lt!299923 (select (arr!18451 a!2986) j!136)))))

(assert (=> b!646461 (= lt!299923 (select (store (arr!18451 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!646463 () Bool)

(declare-fun res!418877 () Bool)

(assert (=> b!646463 (=> (not res!418877) (not e!370573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!646463 (= res!418877 (validKeyInArray!0 k0!1786))))

(declare-fun b!646464 () Bool)

(declare-datatypes ((Unit!21972 0))(
  ( (Unit!21973) )
))
(declare-fun e!370569 () Unit!21972)

(declare-fun Unit!21974 () Unit!21972)

(assert (=> b!646464 (= e!370569 Unit!21974)))

(declare-fun b!646465 () Bool)

(declare-fun res!418873 () Bool)

(assert (=> b!646465 (=> (not res!418873) (not e!370574))))

(declare-datatypes ((List!12492 0))(
  ( (Nil!12489) (Cons!12488 (h!13533 (_ BitVec 64)) (t!18720 List!12492)) )
))
(declare-fun arrayNoDuplicates!0 (array!38481 (_ BitVec 32) List!12492) Bool)

(assert (=> b!646465 (= res!418873 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12489))))

(declare-fun b!646466 () Bool)

(declare-fun res!418887 () Bool)

(assert (=> b!646466 (=> (not res!418887) (not e!370574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38481 (_ BitVec 32)) Bool)

(assert (=> b!646466 (= res!418887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!646467 () Bool)

(declare-fun e!370575 () Bool)

(declare-fun lt!299928 () SeekEntryResult!6891)

(declare-fun lt!299921 () SeekEntryResult!6891)

(assert (=> b!646467 (= e!370575 (= lt!299928 lt!299921))))

(declare-fun b!646468 () Bool)

(declare-fun e!370568 () Bool)

(assert (=> b!646468 (= e!370568 (not e!370565))))

(declare-fun res!418878 () Bool)

(assert (=> b!646468 (=> res!418878 e!370565)))

(declare-fun lt!299929 () SeekEntryResult!6891)

(assert (=> b!646468 (= res!418878 (not (= lt!299929 (Found!6891 index!984))))))

(declare-fun lt!299927 () Unit!21972)

(assert (=> b!646468 (= lt!299927 e!370569)))

(declare-fun c!74162 () Bool)

(assert (=> b!646468 (= c!74162 (= lt!299929 Undefined!6891))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38481 (_ BitVec 32)) SeekEntryResult!6891)

(assert (=> b!646468 (= lt!299929 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299930 lt!299931 mask!3053))))

(assert (=> b!646468 e!370575))

(declare-fun res!418872 () Bool)

(assert (=> b!646468 (=> (not res!418872) (not e!370575))))

(declare-fun lt!299933 () (_ BitVec 32))

(assert (=> b!646468 (= res!418872 (= lt!299921 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299933 vacantSpotIndex!68 lt!299930 lt!299931 mask!3053)))))

(assert (=> b!646468 (= lt!299921 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299933 vacantSpotIndex!68 (select (arr!18451 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!646468 (= lt!299930 (select (store (arr!18451 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!299934 () Unit!21972)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21972)

(assert (=> b!646468 (= lt!299934 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299933 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!646468 (= lt!299933 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!646469 () Bool)

(declare-fun e!370566 () Bool)

(assert (=> b!646469 (= e!370566 (or (bvsge (size!18815 a!2986) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!18815 a!2986))))))

(assert (=> b!646469 (arrayContainsKey!0 lt!299931 (select (arr!18451 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299920 () Unit!21972)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38481 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21972)

(assert (=> b!646469 (= lt!299920 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299931 (select (arr!18451 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!646469 e!370570))

(declare-fun res!418888 () Bool)

(assert (=> b!646469 (=> (not res!418888) (not e!370570))))

(assert (=> b!646469 (= res!418888 (arrayContainsKey!0 lt!299931 (select (arr!18451 a!2986) j!136) j!136))))

(declare-fun res!418882 () Bool)

(assert (=> start!58546 (=> (not res!418882) (not e!370573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58546 (= res!418882 (validMask!0 mask!3053))))

(assert (=> start!58546 e!370573))

(assert (=> start!58546 true))

(declare-fun array_inv!14247 (array!38481) Bool)

(assert (=> start!58546 (array_inv!14247 a!2986)))

(declare-fun b!646462 () Bool)

(declare-fun e!370567 () Bool)

(assert (=> b!646462 (= e!370561 e!370567)))

(declare-fun res!418881 () Bool)

(assert (=> b!646462 (=> res!418881 e!370567)))

(assert (=> b!646462 (= res!418881 (or (not (= (select (arr!18451 a!2986) j!136) lt!299930)) (not (= (select (arr!18451 a!2986) j!136) lt!299923)) (bvsge j!136 index!984)))))

(declare-fun b!646470 () Bool)

(declare-fun e!370572 () Bool)

(assert (=> b!646470 (= e!370572 e!370568)))

(declare-fun res!418874 () Bool)

(assert (=> b!646470 (=> (not res!418874) (not e!370568))))

(assert (=> b!646470 (= res!418874 (and (= lt!299928 (Found!6891 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18451 a!2986) index!984) (select (arr!18451 a!2986) j!136))) (not (= (select (arr!18451 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!646470 (= lt!299928 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18451 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646471 () Bool)

(assert (=> b!646471 (= e!370562 e!370566)))

(declare-fun res!418876 () Bool)

(assert (=> b!646471 (=> res!418876 e!370566)))

(assert (=> b!646471 (= res!418876 (bvsge index!984 j!136))))

(declare-fun lt!299926 () Unit!21972)

(declare-fun e!370563 () Unit!21972)

(assert (=> b!646471 (= lt!299926 e!370563)))

(declare-fun c!74161 () Bool)

(assert (=> b!646471 (= c!74161 (bvslt j!136 index!984))))

(declare-fun b!646472 () Bool)

(declare-fun Unit!21975 () Unit!21972)

(assert (=> b!646472 (= e!370569 Unit!21975)))

(assert (=> b!646472 false))

(declare-fun b!646473 () Bool)

(assert (=> b!646473 (= e!370574 e!370572)))

(declare-fun res!418885 () Bool)

(assert (=> b!646473 (=> (not res!418885) (not e!370572))))

(assert (=> b!646473 (= res!418885 (= (select (store (arr!18451 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646473 (= lt!299931 (array!38482 (store (arr!18451 a!2986) i!1108 k0!1786) (size!18815 a!2986)))))

(declare-fun b!646474 () Bool)

(declare-fun Unit!21976 () Unit!21972)

(assert (=> b!646474 (= e!370563 Unit!21976)))

(declare-fun lt!299935 () Unit!21972)

(assert (=> b!646474 (= lt!299935 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299931 (select (arr!18451 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!646474 (arrayContainsKey!0 lt!299931 (select (arr!18451 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299932 () Unit!21972)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38481 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12492) Unit!21972)

(assert (=> b!646474 (= lt!299932 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12489))))

(assert (=> b!646474 (arrayNoDuplicates!0 lt!299931 #b00000000000000000000000000000000 Nil!12489)))

(declare-fun lt!299925 () Unit!21972)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38481 (_ BitVec 32) (_ BitVec 32)) Unit!21972)

(assert (=> b!646474 (= lt!299925 (lemmaNoDuplicateFromThenFromBigger!0 lt!299931 #b00000000000000000000000000000000 j!136))))

(assert (=> b!646474 (arrayNoDuplicates!0 lt!299931 j!136 Nil!12489)))

(declare-fun lt!299922 () Unit!21972)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38481 (_ BitVec 64) (_ BitVec 32) List!12492) Unit!21972)

(assert (=> b!646474 (= lt!299922 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299931 (select (arr!18451 a!2986) j!136) j!136 Nil!12489))))

(assert (=> b!646474 false))

(declare-fun b!646475 () Bool)

(declare-fun res!418880 () Bool)

(assert (=> b!646475 (=> (not res!418880) (not e!370573))))

(assert (=> b!646475 (= res!418880 (validKeyInArray!0 (select (arr!18451 a!2986) j!136)))))

(declare-fun b!646476 () Bool)

(declare-fun res!418889 () Bool)

(assert (=> b!646476 (=> (not res!418889) (not e!370573))))

(assert (=> b!646476 (= res!418889 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!646477 () Bool)

(declare-fun e!370571 () Bool)

(assert (=> b!646477 (= e!370567 e!370571)))

(declare-fun res!418883 () Bool)

(assert (=> b!646477 (=> (not res!418883) (not e!370571))))

(assert (=> b!646477 (= res!418883 (arrayContainsKey!0 lt!299931 (select (arr!18451 a!2986) j!136) j!136))))

(declare-fun b!646478 () Bool)

(declare-fun res!418871 () Bool)

(assert (=> b!646478 (=> (not res!418871) (not e!370573))))

(assert (=> b!646478 (= res!418871 (and (= (size!18815 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18815 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18815 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!646479 () Bool)

(assert (=> b!646479 (= e!370571 (arrayContainsKey!0 lt!299931 (select (arr!18451 a!2986) j!136) index!984))))

(declare-fun b!646480 () Bool)

(declare-fun res!418886 () Bool)

(assert (=> b!646480 (=> (not res!418886) (not e!370574))))

(assert (=> b!646480 (= res!418886 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18451 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!646481 () Bool)

(declare-fun Unit!21977 () Unit!21972)

(assert (=> b!646481 (= e!370563 Unit!21977)))

(assert (= (and start!58546 res!418882) b!646478))

(assert (= (and b!646478 res!418871) b!646475))

(assert (= (and b!646475 res!418880) b!646463))

(assert (= (and b!646463 res!418877) b!646476))

(assert (= (and b!646476 res!418889) b!646460))

(assert (= (and b!646460 res!418879) b!646466))

(assert (= (and b!646466 res!418887) b!646465))

(assert (= (and b!646465 res!418873) b!646480))

(assert (= (and b!646480 res!418886) b!646473))

(assert (= (and b!646473 res!418885) b!646470))

(assert (= (and b!646470 res!418874) b!646468))

(assert (= (and b!646468 res!418872) b!646467))

(assert (= (and b!646468 c!74162) b!646472))

(assert (= (and b!646468 (not c!74162)) b!646464))

(assert (= (and b!646468 (not res!418878)) b!646461))

(assert (= (and b!646461 res!418884) b!646462))

(assert (= (and b!646462 (not res!418881)) b!646477))

(assert (= (and b!646477 res!418883) b!646479))

(assert (= (and b!646461 (not res!418875)) b!646471))

(assert (= (and b!646471 c!74161) b!646474))

(assert (= (and b!646471 (not c!74161)) b!646481))

(assert (= (and b!646471 (not res!418876)) b!646469))

(assert (= (and b!646469 res!418888) b!646459))

(declare-fun m!619923 () Bool)

(assert (=> b!646479 m!619923))

(assert (=> b!646479 m!619923))

(declare-fun m!619925 () Bool)

(assert (=> b!646479 m!619925))

(declare-fun m!619927 () Bool)

(assert (=> b!646468 m!619927))

(declare-fun m!619929 () Bool)

(assert (=> b!646468 m!619929))

(assert (=> b!646468 m!619923))

(declare-fun m!619931 () Bool)

(assert (=> b!646468 m!619931))

(declare-fun m!619933 () Bool)

(assert (=> b!646468 m!619933))

(declare-fun m!619935 () Bool)

(assert (=> b!646468 m!619935))

(assert (=> b!646468 m!619923))

(declare-fun m!619937 () Bool)

(assert (=> b!646468 m!619937))

(declare-fun m!619939 () Bool)

(assert (=> b!646468 m!619939))

(assert (=> b!646469 m!619923))

(assert (=> b!646469 m!619923))

(declare-fun m!619941 () Bool)

(assert (=> b!646469 m!619941))

(assert (=> b!646469 m!619923))

(declare-fun m!619943 () Bool)

(assert (=> b!646469 m!619943))

(assert (=> b!646469 m!619923))

(declare-fun m!619945 () Bool)

(assert (=> b!646469 m!619945))

(declare-fun m!619947 () Bool)

(assert (=> b!646476 m!619947))

(assert (=> b!646473 m!619931))

(declare-fun m!619949 () Bool)

(assert (=> b!646473 m!619949))

(declare-fun m!619951 () Bool)

(assert (=> b!646480 m!619951))

(declare-fun m!619953 () Bool)

(assert (=> b!646474 m!619953))

(assert (=> b!646474 m!619923))

(declare-fun m!619955 () Bool)

(assert (=> b!646474 m!619955))

(assert (=> b!646474 m!619923))

(declare-fun m!619957 () Bool)

(assert (=> b!646474 m!619957))

(declare-fun m!619959 () Bool)

(assert (=> b!646474 m!619959))

(assert (=> b!646474 m!619923))

(declare-fun m!619961 () Bool)

(assert (=> b!646474 m!619961))

(assert (=> b!646474 m!619923))

(declare-fun m!619963 () Bool)

(assert (=> b!646474 m!619963))

(declare-fun m!619965 () Bool)

(assert (=> b!646474 m!619965))

(declare-fun m!619967 () Bool)

(assert (=> start!58546 m!619967))

(declare-fun m!619969 () Bool)

(assert (=> start!58546 m!619969))

(declare-fun m!619971 () Bool)

(assert (=> b!646466 m!619971))

(assert (=> b!646477 m!619923))

(assert (=> b!646477 m!619923))

(assert (=> b!646477 m!619945))

(declare-fun m!619973 () Bool)

(assert (=> b!646465 m!619973))

(declare-fun m!619975 () Bool)

(assert (=> b!646463 m!619975))

(declare-fun m!619977 () Bool)

(assert (=> b!646460 m!619977))

(assert (=> b!646459 m!619923))

(assert (=> b!646459 m!619923))

(assert (=> b!646459 m!619925))

(assert (=> b!646461 m!619923))

(assert (=> b!646461 m!619931))

(declare-fun m!619979 () Bool)

(assert (=> b!646461 m!619979))

(assert (=> b!646475 m!619923))

(assert (=> b!646475 m!619923))

(declare-fun m!619981 () Bool)

(assert (=> b!646475 m!619981))

(assert (=> b!646462 m!619923))

(declare-fun m!619983 () Bool)

(assert (=> b!646470 m!619983))

(assert (=> b!646470 m!619923))

(assert (=> b!646470 m!619923))

(declare-fun m!619985 () Bool)

(assert (=> b!646470 m!619985))

(check-sat (not b!646474) (not b!646468) (not b!646469) (not b!646477) (not b!646470) (not b!646463) (not b!646479) (not b!646460) (not b!646475) (not start!58546) (not b!646476) (not b!646465) (not b!646466) (not b!646459))
(check-sat)
