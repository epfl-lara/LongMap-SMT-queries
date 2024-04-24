; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55068 () Bool)

(assert start!55068)

(declare-fun b!602608 () Bool)

(declare-fun e!344654 () Bool)

(declare-fun e!344647 () Bool)

(assert (=> b!602608 (= e!344654 e!344647)))

(declare-fun res!386935 () Bool)

(assert (=> b!602608 (=> (not res!386935) (not e!344647))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37167 0))(
  ( (array!37168 (arr!17839 (Array (_ BitVec 32) (_ BitVec 64))) (size!18203 (_ BitVec 32))) )
))
(declare-fun lt!274487 () array!37167)

(declare-fun a!2986 () array!37167)

(declare-fun arrayContainsKey!0 (array!37167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602608 (= res!386935 (arrayContainsKey!0 lt!274487 (select (arr!17839 a!2986) j!136) j!136))))

(declare-fun b!602609 () Bool)

(declare-datatypes ((Unit!19063 0))(
  ( (Unit!19064) )
))
(declare-fun e!344658 () Unit!19063)

(declare-fun Unit!19065 () Unit!19063)

(assert (=> b!602609 (= e!344658 Unit!19065)))

(declare-fun lt!274489 () Unit!19063)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37167 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19063)

(assert (=> b!602609 (= lt!274489 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274487 (select (arr!17839 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!602609 (arrayContainsKey!0 lt!274487 (select (arr!17839 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!274494 () Unit!19063)

(declare-datatypes ((List!11787 0))(
  ( (Nil!11784) (Cons!11783 (h!12831 (_ BitVec 64)) (t!18007 List!11787)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37167 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11787) Unit!19063)

(assert (=> b!602609 (= lt!274494 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11784))))

(declare-fun arrayNoDuplicates!0 (array!37167 (_ BitVec 32) List!11787) Bool)

(assert (=> b!602609 (arrayNoDuplicates!0 lt!274487 #b00000000000000000000000000000000 Nil!11784)))

(declare-fun lt!274482 () Unit!19063)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37167 (_ BitVec 32) (_ BitVec 32)) Unit!19063)

(assert (=> b!602609 (= lt!274482 (lemmaNoDuplicateFromThenFromBigger!0 lt!274487 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602609 (arrayNoDuplicates!0 lt!274487 j!136 Nil!11784)))

(declare-fun lt!274492 () Unit!19063)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37167 (_ BitVec 64) (_ BitVec 32) List!11787) Unit!19063)

(assert (=> b!602609 (= lt!274492 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274487 (select (arr!17839 a!2986) j!136) j!136 Nil!11784))))

(assert (=> b!602609 false))

(declare-fun b!602610 () Bool)

(declare-fun e!344645 () Bool)

(assert (=> b!602610 (= e!344645 e!344654)))

(declare-fun res!386943 () Bool)

(assert (=> b!602610 (=> res!386943 e!344654)))

(declare-fun lt!274491 () (_ BitVec 64))

(declare-fun lt!274481 () (_ BitVec 64))

(assert (=> b!602610 (= res!386943 (or (not (= (select (arr!17839 a!2986) j!136) lt!274481)) (not (= (select (arr!17839 a!2986) j!136) lt!274491)) (bvsge j!136 index!984)))))

(declare-fun b!602611 () Bool)

(declare-fun res!386934 () Bool)

(declare-fun e!344651 () Bool)

(assert (=> b!602611 (=> (not res!386934) (not e!344651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!602611 (= res!386934 (validKeyInArray!0 k0!1786))))

(declare-fun b!602612 () Bool)

(declare-fun res!386937 () Bool)

(declare-fun e!344657 () Bool)

(assert (=> b!602612 (=> (not res!386937) (not e!344657))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!602612 (= res!386937 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17839 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!602613 () Bool)

(declare-fun e!344649 () Unit!19063)

(declare-fun Unit!19066 () Unit!19063)

(assert (=> b!602613 (= e!344649 Unit!19066)))

(assert (=> b!602613 false))

(declare-fun b!602614 () Bool)

(declare-fun e!344648 () Bool)

(assert (=> b!602614 (= e!344648 (or (bvsge index!984 (size!18203 a!2986)) (bvslt (size!18203 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!602614 (arrayContainsKey!0 lt!274487 (select (arr!17839 a!2986) j!136) j!136)))

(declare-fun b!602615 () Bool)

(declare-fun res!386950 () Bool)

(assert (=> b!602615 (=> (not res!386950) (not e!344657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37167 (_ BitVec 32)) Bool)

(assert (=> b!602615 (= res!386950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!602616 () Bool)

(declare-fun Unit!19067 () Unit!19063)

(assert (=> b!602616 (= e!344649 Unit!19067)))

(declare-fun res!386945 () Bool)

(assert (=> start!55068 (=> (not res!386945) (not e!344651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55068 (= res!386945 (validMask!0 mask!3053))))

(assert (=> start!55068 e!344651))

(assert (=> start!55068 true))

(declare-fun array_inv!13698 (array!37167) Bool)

(assert (=> start!55068 (array_inv!13698 a!2986)))

(declare-fun b!602617 () Bool)

(declare-fun e!344656 () Bool)

(declare-fun e!344653 () Bool)

(assert (=> b!602617 (= e!344656 e!344653)))

(declare-fun res!386938 () Bool)

(assert (=> b!602617 (=> (not res!386938) (not e!344653))))

(declare-datatypes ((SeekEntryResult!6235 0))(
  ( (MissingZero!6235 (index!27200 (_ BitVec 32))) (Found!6235 (index!27201 (_ BitVec 32))) (Intermediate!6235 (undefined!7047 Bool) (index!27202 (_ BitVec 32)) (x!56150 (_ BitVec 32))) (Undefined!6235) (MissingVacant!6235 (index!27203 (_ BitVec 32))) )
))
(declare-fun lt!274493 () SeekEntryResult!6235)

(assert (=> b!602617 (= res!386938 (and (= lt!274493 (Found!6235 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17839 a!2986) index!984) (select (arr!17839 a!2986) j!136))) (not (= (select (arr!17839 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37167 (_ BitVec 32)) SeekEntryResult!6235)

(assert (=> b!602617 (= lt!274493 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17839 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602618 () Bool)

(declare-fun res!386947 () Bool)

(assert (=> b!602618 (=> (not res!386947) (not e!344651))))

(assert (=> b!602618 (= res!386947 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!602619 () Bool)

(declare-fun res!386940 () Bool)

(assert (=> b!602619 (=> (not res!386940) (not e!344651))))

(assert (=> b!602619 (= res!386940 (and (= (size!18203 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18203 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18203 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!602620 () Bool)

(declare-fun e!344646 () Bool)

(declare-fun lt!274488 () SeekEntryResult!6235)

(assert (=> b!602620 (= e!344646 (= lt!274493 lt!274488))))

(declare-fun b!602621 () Bool)

(declare-fun e!344650 () Bool)

(assert (=> b!602621 (= e!344650 e!344648)))

(declare-fun res!386946 () Bool)

(assert (=> b!602621 (=> res!386946 e!344648)))

(assert (=> b!602621 (= res!386946 (bvsge index!984 j!136))))

(declare-fun lt!274495 () Unit!19063)

(assert (=> b!602621 (= lt!274495 e!344658)))

(declare-fun c!68206 () Bool)

(assert (=> b!602621 (= c!68206 (bvslt j!136 index!984))))

(declare-fun b!602622 () Bool)

(assert (=> b!602622 (= e!344647 (arrayContainsKey!0 lt!274487 (select (arr!17839 a!2986) j!136) index!984))))

(declare-fun b!602623 () Bool)

(assert (=> b!602623 (= e!344657 e!344656)))

(declare-fun res!386948 () Bool)

(assert (=> b!602623 (=> (not res!386948) (not e!344656))))

(assert (=> b!602623 (= res!386948 (= (select (store (arr!17839 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602623 (= lt!274487 (array!37168 (store (arr!17839 a!2986) i!1108 k0!1786) (size!18203 a!2986)))))

(declare-fun b!602624 () Bool)

(assert (=> b!602624 (= e!344651 e!344657)))

(declare-fun res!386941 () Bool)

(assert (=> b!602624 (=> (not res!386941) (not e!344657))))

(declare-fun lt!274485 () SeekEntryResult!6235)

(assert (=> b!602624 (= res!386941 (or (= lt!274485 (MissingZero!6235 i!1108)) (= lt!274485 (MissingVacant!6235 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37167 (_ BitVec 32)) SeekEntryResult!6235)

(assert (=> b!602624 (= lt!274485 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!602625 () Bool)

(declare-fun Unit!19068 () Unit!19063)

(assert (=> b!602625 (= e!344658 Unit!19068)))

(declare-fun b!602626 () Bool)

(declare-fun e!344655 () Bool)

(assert (=> b!602626 (= e!344655 e!344650)))

(declare-fun res!386933 () Bool)

(assert (=> b!602626 (=> res!386933 e!344650)))

(assert (=> b!602626 (= res!386933 (or (not (= (select (arr!17839 a!2986) j!136) lt!274481)) (not (= (select (arr!17839 a!2986) j!136) lt!274491))))))

(assert (=> b!602626 e!344645))

(declare-fun res!386949 () Bool)

(assert (=> b!602626 (=> (not res!386949) (not e!344645))))

(assert (=> b!602626 (= res!386949 (= lt!274491 (select (arr!17839 a!2986) j!136)))))

(assert (=> b!602626 (= lt!274491 (select (store (arr!17839 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!602627 () Bool)

(declare-fun res!386939 () Bool)

(assert (=> b!602627 (=> (not res!386939) (not e!344657))))

(assert (=> b!602627 (= res!386939 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11784))))

(declare-fun b!602628 () Bool)

(declare-fun res!386942 () Bool)

(assert (=> b!602628 (=> (not res!386942) (not e!344651))))

(assert (=> b!602628 (= res!386942 (validKeyInArray!0 (select (arr!17839 a!2986) j!136)))))

(declare-fun b!602629 () Bool)

(assert (=> b!602629 (= e!344653 (not e!344655))))

(declare-fun res!386936 () Bool)

(assert (=> b!602629 (=> res!386936 e!344655)))

(declare-fun lt!274484 () SeekEntryResult!6235)

(assert (=> b!602629 (= res!386936 (not (= lt!274484 (Found!6235 index!984))))))

(declare-fun lt!274490 () Unit!19063)

(assert (=> b!602629 (= lt!274490 e!344649)))

(declare-fun c!68207 () Bool)

(assert (=> b!602629 (= c!68207 (= lt!274484 Undefined!6235))))

(assert (=> b!602629 (= lt!274484 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274481 lt!274487 mask!3053))))

(assert (=> b!602629 e!344646))

(declare-fun res!386944 () Bool)

(assert (=> b!602629 (=> (not res!386944) (not e!344646))))

(declare-fun lt!274486 () (_ BitVec 32))

(assert (=> b!602629 (= res!386944 (= lt!274488 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274486 vacantSpotIndex!68 lt!274481 lt!274487 mask!3053)))))

(assert (=> b!602629 (= lt!274488 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274486 vacantSpotIndex!68 (select (arr!17839 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!602629 (= lt!274481 (select (store (arr!17839 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!274483 () Unit!19063)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37167 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19063)

(assert (=> b!602629 (= lt!274483 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274486 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!602629 (= lt!274486 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (= (and start!55068 res!386945) b!602619))

(assert (= (and b!602619 res!386940) b!602628))

(assert (= (and b!602628 res!386942) b!602611))

(assert (= (and b!602611 res!386934) b!602618))

(assert (= (and b!602618 res!386947) b!602624))

(assert (= (and b!602624 res!386941) b!602615))

(assert (= (and b!602615 res!386950) b!602627))

(assert (= (and b!602627 res!386939) b!602612))

(assert (= (and b!602612 res!386937) b!602623))

(assert (= (and b!602623 res!386948) b!602617))

(assert (= (and b!602617 res!386938) b!602629))

(assert (= (and b!602629 res!386944) b!602620))

(assert (= (and b!602629 c!68207) b!602613))

(assert (= (and b!602629 (not c!68207)) b!602616))

(assert (= (and b!602629 (not res!386936)) b!602626))

(assert (= (and b!602626 res!386949) b!602610))

(assert (= (and b!602610 (not res!386943)) b!602608))

(assert (= (and b!602608 res!386935) b!602622))

(assert (= (and b!602626 (not res!386933)) b!602621))

(assert (= (and b!602621 c!68206) b!602609))

(assert (= (and b!602621 (not c!68206)) b!602625))

(assert (= (and b!602621 (not res!386946)) b!602614))

(declare-fun m!579959 () Bool)

(assert (=> b!602626 m!579959))

(declare-fun m!579961 () Bool)

(assert (=> b!602626 m!579961))

(declare-fun m!579963 () Bool)

(assert (=> b!602626 m!579963))

(declare-fun m!579965 () Bool)

(assert (=> b!602618 m!579965))

(assert (=> b!602629 m!579959))

(declare-fun m!579967 () Bool)

(assert (=> b!602629 m!579967))

(declare-fun m!579969 () Bool)

(assert (=> b!602629 m!579969))

(declare-fun m!579971 () Bool)

(assert (=> b!602629 m!579971))

(assert (=> b!602629 m!579959))

(assert (=> b!602629 m!579961))

(declare-fun m!579973 () Bool)

(assert (=> b!602629 m!579973))

(declare-fun m!579975 () Bool)

(assert (=> b!602629 m!579975))

(declare-fun m!579977 () Bool)

(assert (=> b!602629 m!579977))

(assert (=> b!602610 m!579959))

(declare-fun m!579979 () Bool)

(assert (=> b!602624 m!579979))

(declare-fun m!579981 () Bool)

(assert (=> b!602609 m!579981))

(assert (=> b!602609 m!579959))

(assert (=> b!602609 m!579959))

(declare-fun m!579983 () Bool)

(assert (=> b!602609 m!579983))

(declare-fun m!579985 () Bool)

(assert (=> b!602609 m!579985))

(assert (=> b!602609 m!579959))

(declare-fun m!579987 () Bool)

(assert (=> b!602609 m!579987))

(declare-fun m!579989 () Bool)

(assert (=> b!602609 m!579989))

(assert (=> b!602609 m!579959))

(declare-fun m!579991 () Bool)

(assert (=> b!602609 m!579991))

(declare-fun m!579993 () Bool)

(assert (=> b!602609 m!579993))

(assert (=> b!602623 m!579961))

(declare-fun m!579995 () Bool)

(assert (=> b!602623 m!579995))

(assert (=> b!602622 m!579959))

(assert (=> b!602622 m!579959))

(declare-fun m!579997 () Bool)

(assert (=> b!602622 m!579997))

(declare-fun m!579999 () Bool)

(assert (=> start!55068 m!579999))

(declare-fun m!580001 () Bool)

(assert (=> start!55068 m!580001))

(assert (=> b!602628 m!579959))

(assert (=> b!602628 m!579959))

(declare-fun m!580003 () Bool)

(assert (=> b!602628 m!580003))

(declare-fun m!580005 () Bool)

(assert (=> b!602611 m!580005))

(declare-fun m!580007 () Bool)

(assert (=> b!602612 m!580007))

(declare-fun m!580009 () Bool)

(assert (=> b!602615 m!580009))

(declare-fun m!580011 () Bool)

(assert (=> b!602617 m!580011))

(assert (=> b!602617 m!579959))

(assert (=> b!602617 m!579959))

(declare-fun m!580013 () Bool)

(assert (=> b!602617 m!580013))

(assert (=> b!602614 m!579959))

(assert (=> b!602614 m!579959))

(declare-fun m!580015 () Bool)

(assert (=> b!602614 m!580015))

(declare-fun m!580017 () Bool)

(assert (=> b!602627 m!580017))

(assert (=> b!602608 m!579959))

(assert (=> b!602608 m!579959))

(assert (=> b!602608 m!580015))

(check-sat (not b!602608) (not start!55068) (not b!602615) (not b!602618) (not b!602629) (not b!602627) (not b!602628) (not b!602622) (not b!602611) (not b!602614) (not b!602617) (not b!602609) (not b!602624))
(check-sat)
(get-model)

(declare-fun d!87393 () Bool)

(assert (=> d!87393 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!602611 d!87393))

(declare-fun d!87395 () Bool)

(declare-fun res!387063 () Bool)

(declare-fun e!344747 () Bool)

(assert (=> d!87395 (=> res!387063 e!344747)))

(assert (=> d!87395 (= res!387063 (= (select (arr!17839 lt!274487) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17839 a!2986) j!136)))))

(assert (=> d!87395 (= (arrayContainsKey!0 lt!274487 (select (arr!17839 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!344747)))

(declare-fun b!602766 () Bool)

(declare-fun e!344748 () Bool)

(assert (=> b!602766 (= e!344747 e!344748)))

(declare-fun res!387064 () Bool)

(assert (=> b!602766 (=> (not res!387064) (not e!344748))))

(assert (=> b!602766 (= res!387064 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18203 lt!274487)))))

(declare-fun b!602767 () Bool)

(assert (=> b!602767 (= e!344748 (arrayContainsKey!0 lt!274487 (select (arr!17839 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87395 (not res!387063)) b!602766))

(assert (= (and b!602766 res!387064) b!602767))

(declare-fun m!580139 () Bool)

(assert (=> d!87395 m!580139))

(assert (=> b!602767 m!579959))

(declare-fun m!580141 () Bool)

(assert (=> b!602767 m!580141))

(assert (=> b!602609 d!87395))

(declare-fun b!602778 () Bool)

(declare-fun e!344759 () Bool)

(declare-fun e!344760 () Bool)

(assert (=> b!602778 (= e!344759 e!344760)))

(declare-fun res!387072 () Bool)

(assert (=> b!602778 (=> (not res!387072) (not e!344760))))

(declare-fun e!344758 () Bool)

(assert (=> b!602778 (= res!387072 (not e!344758))))

(declare-fun res!387073 () Bool)

(assert (=> b!602778 (=> (not res!387073) (not e!344758))))

(assert (=> b!602778 (= res!387073 (validKeyInArray!0 (select (arr!17839 lt!274487) #b00000000000000000000000000000000)))))

(declare-fun b!602779 () Bool)

(declare-fun e!344757 () Bool)

(assert (=> b!602779 (= e!344760 e!344757)))

(declare-fun c!68222 () Bool)

(assert (=> b!602779 (= c!68222 (validKeyInArray!0 (select (arr!17839 lt!274487) #b00000000000000000000000000000000)))))

(declare-fun b!602780 () Bool)

(declare-fun contains!2965 (List!11787 (_ BitVec 64)) Bool)

(assert (=> b!602780 (= e!344758 (contains!2965 Nil!11784 (select (arr!17839 lt!274487) #b00000000000000000000000000000000)))))

(declare-fun b!602781 () Bool)

(declare-fun call!32997 () Bool)

(assert (=> b!602781 (= e!344757 call!32997)))

(declare-fun bm!32994 () Bool)

(assert (=> bm!32994 (= call!32997 (arrayNoDuplicates!0 lt!274487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68222 (Cons!11783 (select (arr!17839 lt!274487) #b00000000000000000000000000000000) Nil!11784) Nil!11784)))))

(declare-fun b!602782 () Bool)

(assert (=> b!602782 (= e!344757 call!32997)))

(declare-fun d!87397 () Bool)

(declare-fun res!387071 () Bool)

(assert (=> d!87397 (=> res!387071 e!344759)))

(assert (=> d!87397 (= res!387071 (bvsge #b00000000000000000000000000000000 (size!18203 lt!274487)))))

(assert (=> d!87397 (= (arrayNoDuplicates!0 lt!274487 #b00000000000000000000000000000000 Nil!11784) e!344759)))

(assert (= (and d!87397 (not res!387071)) b!602778))

(assert (= (and b!602778 res!387073) b!602780))

(assert (= (and b!602778 res!387072) b!602779))

(assert (= (and b!602779 c!68222) b!602782))

(assert (= (and b!602779 (not c!68222)) b!602781))

(assert (= (or b!602782 b!602781) bm!32994))

(declare-fun m!580143 () Bool)

(assert (=> b!602778 m!580143))

(assert (=> b!602778 m!580143))

(declare-fun m!580145 () Bool)

(assert (=> b!602778 m!580145))

(assert (=> b!602779 m!580143))

(assert (=> b!602779 m!580143))

(assert (=> b!602779 m!580145))

(assert (=> b!602780 m!580143))

(assert (=> b!602780 m!580143))

(declare-fun m!580147 () Bool)

(assert (=> b!602780 m!580147))

(assert (=> bm!32994 m!580143))

(declare-fun m!580149 () Bool)

(assert (=> bm!32994 m!580149))

(assert (=> b!602609 d!87397))

(declare-fun d!87399 () Bool)

(assert (=> d!87399 (arrayContainsKey!0 lt!274487 (select (arr!17839 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274588 () Unit!19063)

(declare-fun choose!114 (array!37167 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19063)

(assert (=> d!87399 (= lt!274588 (choose!114 lt!274487 (select (arr!17839 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87399 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87399 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274487 (select (arr!17839 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!274588)))

(declare-fun bs!18479 () Bool)

(assert (= bs!18479 d!87399))

(assert (=> bs!18479 m!579959))

(assert (=> bs!18479 m!579983))

(assert (=> bs!18479 m!579959))

(declare-fun m!580151 () Bool)

(assert (=> bs!18479 m!580151))

(assert (=> b!602609 d!87399))

(declare-fun d!87401 () Bool)

(assert (=> d!87401 (arrayNoDuplicates!0 lt!274487 j!136 Nil!11784)))

(declare-fun lt!274591 () Unit!19063)

(declare-fun choose!39 (array!37167 (_ BitVec 32) (_ BitVec 32)) Unit!19063)

(assert (=> d!87401 (= lt!274591 (choose!39 lt!274487 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87401 (bvslt (size!18203 lt!274487) #b01111111111111111111111111111111)))

(assert (=> d!87401 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!274487 #b00000000000000000000000000000000 j!136) lt!274591)))

(declare-fun bs!18480 () Bool)

(assert (= bs!18480 d!87401))

(assert (=> bs!18480 m!579985))

(declare-fun m!580153 () Bool)

(assert (=> bs!18480 m!580153))

(assert (=> b!602609 d!87401))

(declare-fun d!87403 () Bool)

(assert (=> d!87403 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18203 lt!274487)) (not (= (select (arr!17839 lt!274487) j!136) (select (arr!17839 a!2986) j!136))))))

(declare-fun lt!274594 () Unit!19063)

(declare-fun choose!21 (array!37167 (_ BitVec 64) (_ BitVec 32) List!11787) Unit!19063)

(assert (=> d!87403 (= lt!274594 (choose!21 lt!274487 (select (arr!17839 a!2986) j!136) j!136 Nil!11784))))

(assert (=> d!87403 (bvslt (size!18203 lt!274487) #b01111111111111111111111111111111)))

(assert (=> d!87403 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274487 (select (arr!17839 a!2986) j!136) j!136 Nil!11784) lt!274594)))

(declare-fun bs!18481 () Bool)

(assert (= bs!18481 d!87403))

(declare-fun m!580155 () Bool)

(assert (=> bs!18481 m!580155))

(assert (=> bs!18481 m!579959))

(declare-fun m!580157 () Bool)

(assert (=> bs!18481 m!580157))

(assert (=> b!602609 d!87403))

(declare-fun b!602783 () Bool)

(declare-fun e!344763 () Bool)

(declare-fun e!344764 () Bool)

(assert (=> b!602783 (= e!344763 e!344764)))

(declare-fun res!387075 () Bool)

(assert (=> b!602783 (=> (not res!387075) (not e!344764))))

(declare-fun e!344762 () Bool)

(assert (=> b!602783 (= res!387075 (not e!344762))))

(declare-fun res!387076 () Bool)

(assert (=> b!602783 (=> (not res!387076) (not e!344762))))

(assert (=> b!602783 (= res!387076 (validKeyInArray!0 (select (arr!17839 lt!274487) j!136)))))

(declare-fun b!602784 () Bool)

(declare-fun e!344761 () Bool)

(assert (=> b!602784 (= e!344764 e!344761)))

(declare-fun c!68223 () Bool)

(assert (=> b!602784 (= c!68223 (validKeyInArray!0 (select (arr!17839 lt!274487) j!136)))))

(declare-fun b!602785 () Bool)

(assert (=> b!602785 (= e!344762 (contains!2965 Nil!11784 (select (arr!17839 lt!274487) j!136)))))

(declare-fun b!602786 () Bool)

(declare-fun call!32998 () Bool)

(assert (=> b!602786 (= e!344761 call!32998)))

(declare-fun bm!32995 () Bool)

(assert (=> bm!32995 (= call!32998 (arrayNoDuplicates!0 lt!274487 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68223 (Cons!11783 (select (arr!17839 lt!274487) j!136) Nil!11784) Nil!11784)))))

(declare-fun b!602787 () Bool)

(assert (=> b!602787 (= e!344761 call!32998)))

(declare-fun d!87405 () Bool)

(declare-fun res!387074 () Bool)

(assert (=> d!87405 (=> res!387074 e!344763)))

(assert (=> d!87405 (= res!387074 (bvsge j!136 (size!18203 lt!274487)))))

(assert (=> d!87405 (= (arrayNoDuplicates!0 lt!274487 j!136 Nil!11784) e!344763)))

(assert (= (and d!87405 (not res!387074)) b!602783))

(assert (= (and b!602783 res!387076) b!602785))

(assert (= (and b!602783 res!387075) b!602784))

(assert (= (and b!602784 c!68223) b!602787))

(assert (= (and b!602784 (not c!68223)) b!602786))

(assert (= (or b!602787 b!602786) bm!32995))

(assert (=> b!602783 m!580155))

(assert (=> b!602783 m!580155))

(declare-fun m!580159 () Bool)

(assert (=> b!602783 m!580159))

(assert (=> b!602784 m!580155))

(assert (=> b!602784 m!580155))

(assert (=> b!602784 m!580159))

(assert (=> b!602785 m!580155))

(assert (=> b!602785 m!580155))

(declare-fun m!580161 () Bool)

(assert (=> b!602785 m!580161))

(assert (=> bm!32995 m!580155))

(declare-fun m!580163 () Bool)

(assert (=> bm!32995 m!580163))

(assert (=> b!602609 d!87405))

(declare-fun d!87407 () Bool)

(declare-fun e!344767 () Bool)

(assert (=> d!87407 e!344767))

(declare-fun res!387079 () Bool)

(assert (=> d!87407 (=> (not res!387079) (not e!344767))))

(assert (=> d!87407 (= res!387079 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18203 a!2986))))))

(declare-fun lt!274597 () Unit!19063)

(declare-fun choose!41 (array!37167 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11787) Unit!19063)

(assert (=> d!87407 (= lt!274597 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11784))))

(assert (=> d!87407 (bvslt (size!18203 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87407 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11784) lt!274597)))

(declare-fun b!602790 () Bool)

(assert (=> b!602790 (= e!344767 (arrayNoDuplicates!0 (array!37168 (store (arr!17839 a!2986) i!1108 k0!1786) (size!18203 a!2986)) #b00000000000000000000000000000000 Nil!11784))))

(assert (= (and d!87407 res!387079) b!602790))

(declare-fun m!580165 () Bool)

(assert (=> d!87407 m!580165))

(assert (=> b!602790 m!579961))

(declare-fun m!580167 () Bool)

(assert (=> b!602790 m!580167))

(assert (=> b!602609 d!87407))

(declare-fun e!344775 () SeekEntryResult!6235)

(declare-fun b!602803 () Bool)

(declare-fun lt!274606 () SeekEntryResult!6235)

(assert (=> b!602803 (= e!344775 (seekKeyOrZeroReturnVacant!0 (x!56150 lt!274606) (index!27202 lt!274606) (index!27202 lt!274606) k0!1786 a!2986 mask!3053))))

(declare-fun d!87409 () Bool)

(declare-fun lt!274605 () SeekEntryResult!6235)

(get-info :version)

(assert (=> d!87409 (and (or ((_ is Undefined!6235) lt!274605) (not ((_ is Found!6235) lt!274605)) (and (bvsge (index!27201 lt!274605) #b00000000000000000000000000000000) (bvslt (index!27201 lt!274605) (size!18203 a!2986)))) (or ((_ is Undefined!6235) lt!274605) ((_ is Found!6235) lt!274605) (not ((_ is MissingZero!6235) lt!274605)) (and (bvsge (index!27200 lt!274605) #b00000000000000000000000000000000) (bvslt (index!27200 lt!274605) (size!18203 a!2986)))) (or ((_ is Undefined!6235) lt!274605) ((_ is Found!6235) lt!274605) ((_ is MissingZero!6235) lt!274605) (not ((_ is MissingVacant!6235) lt!274605)) (and (bvsge (index!27203 lt!274605) #b00000000000000000000000000000000) (bvslt (index!27203 lt!274605) (size!18203 a!2986)))) (or ((_ is Undefined!6235) lt!274605) (ite ((_ is Found!6235) lt!274605) (= (select (arr!17839 a!2986) (index!27201 lt!274605)) k0!1786) (ite ((_ is MissingZero!6235) lt!274605) (= (select (arr!17839 a!2986) (index!27200 lt!274605)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6235) lt!274605) (= (select (arr!17839 a!2986) (index!27203 lt!274605)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!344776 () SeekEntryResult!6235)

(assert (=> d!87409 (= lt!274605 e!344776)))

(declare-fun c!68231 () Bool)

(assert (=> d!87409 (= c!68231 (and ((_ is Intermediate!6235) lt!274606) (undefined!7047 lt!274606)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37167 (_ BitVec 32)) SeekEntryResult!6235)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87409 (= lt!274606 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87409 (validMask!0 mask!3053)))

(assert (=> d!87409 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!274605)))

(declare-fun b!602804 () Bool)

(declare-fun e!344774 () SeekEntryResult!6235)

(assert (=> b!602804 (= e!344776 e!344774)))

(declare-fun lt!274604 () (_ BitVec 64))

(assert (=> b!602804 (= lt!274604 (select (arr!17839 a!2986) (index!27202 lt!274606)))))

(declare-fun c!68230 () Bool)

(assert (=> b!602804 (= c!68230 (= lt!274604 k0!1786))))

(declare-fun b!602805 () Bool)

(assert (=> b!602805 (= e!344775 (MissingZero!6235 (index!27202 lt!274606)))))

(declare-fun b!602806 () Bool)

(declare-fun c!68232 () Bool)

(assert (=> b!602806 (= c!68232 (= lt!274604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602806 (= e!344774 e!344775)))

(declare-fun b!602807 () Bool)

(assert (=> b!602807 (= e!344774 (Found!6235 (index!27202 lt!274606)))))

(declare-fun b!602808 () Bool)

(assert (=> b!602808 (= e!344776 Undefined!6235)))

(assert (= (and d!87409 c!68231) b!602808))

(assert (= (and d!87409 (not c!68231)) b!602804))

(assert (= (and b!602804 c!68230) b!602807))

(assert (= (and b!602804 (not c!68230)) b!602806))

(assert (= (and b!602806 c!68232) b!602805))

(assert (= (and b!602806 (not c!68232)) b!602803))

(declare-fun m!580169 () Bool)

(assert (=> b!602803 m!580169))

(declare-fun m!580171 () Bool)

(assert (=> d!87409 m!580171))

(declare-fun m!580173 () Bool)

(assert (=> d!87409 m!580173))

(declare-fun m!580175 () Bool)

(assert (=> d!87409 m!580175))

(declare-fun m!580177 () Bool)

(assert (=> d!87409 m!580177))

(declare-fun m!580179 () Bool)

(assert (=> d!87409 m!580179))

(assert (=> d!87409 m!579999))

(assert (=> d!87409 m!580173))

(declare-fun m!580181 () Bool)

(assert (=> b!602804 m!580181))

(assert (=> b!602624 d!87409))

(declare-fun d!87411 () Bool)

(declare-fun res!387080 () Bool)

(declare-fun e!344777 () Bool)

(assert (=> d!87411 (=> res!387080 e!344777)))

(assert (=> d!87411 (= res!387080 (= (select (arr!17839 lt!274487) index!984) (select (arr!17839 a!2986) j!136)))))

(assert (=> d!87411 (= (arrayContainsKey!0 lt!274487 (select (arr!17839 a!2986) j!136) index!984) e!344777)))

(declare-fun b!602809 () Bool)

(declare-fun e!344778 () Bool)

(assert (=> b!602809 (= e!344777 e!344778)))

(declare-fun res!387081 () Bool)

(assert (=> b!602809 (=> (not res!387081) (not e!344778))))

(assert (=> b!602809 (= res!387081 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18203 lt!274487)))))

(declare-fun b!602810 () Bool)

(assert (=> b!602810 (= e!344778 (arrayContainsKey!0 lt!274487 (select (arr!17839 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87411 (not res!387080)) b!602809))

(assert (= (and b!602809 res!387081) b!602810))

(declare-fun m!580183 () Bool)

(assert (=> d!87411 m!580183))

(assert (=> b!602810 m!579959))

(declare-fun m!580185 () Bool)

(assert (=> b!602810 m!580185))

(assert (=> b!602622 d!87411))

(declare-fun b!602811 () Bool)

(declare-fun e!344781 () Bool)

(declare-fun e!344782 () Bool)

(assert (=> b!602811 (= e!344781 e!344782)))

(declare-fun res!387083 () Bool)

(assert (=> b!602811 (=> (not res!387083) (not e!344782))))

(declare-fun e!344780 () Bool)

(assert (=> b!602811 (= res!387083 (not e!344780))))

(declare-fun res!387084 () Bool)

(assert (=> b!602811 (=> (not res!387084) (not e!344780))))

(assert (=> b!602811 (= res!387084 (validKeyInArray!0 (select (arr!17839 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!602812 () Bool)

(declare-fun e!344779 () Bool)

(assert (=> b!602812 (= e!344782 e!344779)))

(declare-fun c!68233 () Bool)

(assert (=> b!602812 (= c!68233 (validKeyInArray!0 (select (arr!17839 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!602813 () Bool)

(assert (=> b!602813 (= e!344780 (contains!2965 Nil!11784 (select (arr!17839 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!602814 () Bool)

(declare-fun call!32999 () Bool)

(assert (=> b!602814 (= e!344779 call!32999)))

(declare-fun bm!32996 () Bool)

(assert (=> bm!32996 (= call!32999 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68233 (Cons!11783 (select (arr!17839 a!2986) #b00000000000000000000000000000000) Nil!11784) Nil!11784)))))

(declare-fun b!602815 () Bool)

(assert (=> b!602815 (= e!344779 call!32999)))

(declare-fun d!87413 () Bool)

(declare-fun res!387082 () Bool)

(assert (=> d!87413 (=> res!387082 e!344781)))

(assert (=> d!87413 (= res!387082 (bvsge #b00000000000000000000000000000000 (size!18203 a!2986)))))

(assert (=> d!87413 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11784) e!344781)))

(assert (= (and d!87413 (not res!387082)) b!602811))

(assert (= (and b!602811 res!387084) b!602813))

(assert (= (and b!602811 res!387083) b!602812))

(assert (= (and b!602812 c!68233) b!602815))

(assert (= (and b!602812 (not c!68233)) b!602814))

(assert (= (or b!602815 b!602814) bm!32996))

(declare-fun m!580187 () Bool)

(assert (=> b!602811 m!580187))

(assert (=> b!602811 m!580187))

(declare-fun m!580189 () Bool)

(assert (=> b!602811 m!580189))

(assert (=> b!602812 m!580187))

(assert (=> b!602812 m!580187))

(assert (=> b!602812 m!580189))

(assert (=> b!602813 m!580187))

(assert (=> b!602813 m!580187))

(declare-fun m!580191 () Bool)

(assert (=> b!602813 m!580191))

(assert (=> bm!32996 m!580187))

(declare-fun m!580193 () Bool)

(assert (=> bm!32996 m!580193))

(assert (=> b!602627 d!87413))

(declare-fun d!87415 () Bool)

(declare-fun res!387085 () Bool)

(declare-fun e!344783 () Bool)

(assert (=> d!87415 (=> res!387085 e!344783)))

(assert (=> d!87415 (= res!387085 (= (select (arr!17839 lt!274487) j!136) (select (arr!17839 a!2986) j!136)))))

(assert (=> d!87415 (= (arrayContainsKey!0 lt!274487 (select (arr!17839 a!2986) j!136) j!136) e!344783)))

(declare-fun b!602816 () Bool)

(declare-fun e!344784 () Bool)

(assert (=> b!602816 (= e!344783 e!344784)))

(declare-fun res!387086 () Bool)

(assert (=> b!602816 (=> (not res!387086) (not e!344784))))

(assert (=> b!602816 (= res!387086 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18203 lt!274487)))))

(declare-fun b!602817 () Bool)

(assert (=> b!602817 (= e!344784 (arrayContainsKey!0 lt!274487 (select (arr!17839 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87415 (not res!387085)) b!602816))

(assert (= (and b!602816 res!387086) b!602817))

(assert (=> d!87415 m!580155))

(assert (=> b!602817 m!579959))

(declare-fun m!580195 () Bool)

(assert (=> b!602817 m!580195))

(assert (=> b!602614 d!87415))

(declare-fun b!602832 () Bool)

(declare-fun e!344797 () Bool)

(declare-fun e!344798 () Bool)

(assert (=> b!602832 (= e!344797 e!344798)))

(declare-fun lt!274614 () (_ BitVec 64))

(assert (=> b!602832 (= lt!274614 (select (arr!17839 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!274613 () Unit!19063)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37167 (_ BitVec 64) (_ BitVec 32)) Unit!19063)

(assert (=> b!602832 (= lt!274613 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!274614 #b00000000000000000000000000000000))))

(assert (=> b!602832 (arrayContainsKey!0 a!2986 lt!274614 #b00000000000000000000000000000000)))

(declare-fun lt!274615 () Unit!19063)

(assert (=> b!602832 (= lt!274615 lt!274613)))

(declare-fun res!387098 () Bool)

(assert (=> b!602832 (= res!387098 (= (seekEntryOrOpen!0 (select (arr!17839 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6235 #b00000000000000000000000000000000)))))

(assert (=> b!602832 (=> (not res!387098) (not e!344798))))

(declare-fun b!602833 () Bool)

(declare-fun e!344799 () Bool)

(assert (=> b!602833 (= e!344799 e!344797)))

(declare-fun c!68236 () Bool)

(assert (=> b!602833 (= c!68236 (validKeyInArray!0 (select (arr!17839 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32999 () Bool)

(declare-fun call!33002 () Bool)

(assert (=> bm!32999 (= call!33002 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!87417 () Bool)

(declare-fun res!387097 () Bool)

(assert (=> d!87417 (=> res!387097 e!344799)))

(assert (=> d!87417 (= res!387097 (bvsge #b00000000000000000000000000000000 (size!18203 a!2986)))))

(assert (=> d!87417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!344799)))

(declare-fun b!602834 () Bool)

(assert (=> b!602834 (= e!344797 call!33002)))

(declare-fun b!602835 () Bool)

(assert (=> b!602835 (= e!344798 call!33002)))

(assert (= (and d!87417 (not res!387097)) b!602833))

(assert (= (and b!602833 c!68236) b!602832))

(assert (= (and b!602833 (not c!68236)) b!602834))

(assert (= (and b!602832 res!387098) b!602835))

(assert (= (or b!602835 b!602834) bm!32999))

(assert (=> b!602832 m!580187))

(declare-fun m!580201 () Bool)

(assert (=> b!602832 m!580201))

(declare-fun m!580203 () Bool)

(assert (=> b!602832 m!580203))

(assert (=> b!602832 m!580187))

(declare-fun m!580205 () Bool)

(assert (=> b!602832 m!580205))

(assert (=> b!602833 m!580187))

(assert (=> b!602833 m!580187))

(assert (=> b!602833 m!580189))

(declare-fun m!580207 () Bool)

(assert (=> bm!32999 m!580207))

(assert (=> b!602615 d!87417))

(declare-fun b!602899 () Bool)

(declare-fun e!344836 () SeekEntryResult!6235)

(assert (=> b!602899 (= e!344836 (Found!6235 index!984))))

(declare-fun e!344838 () SeekEntryResult!6235)

(declare-fun b!602900 () Bool)

(assert (=> b!602900 (= e!344838 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!274481 lt!274487 mask!3053))))

(declare-fun b!602901 () Bool)

(declare-fun e!344837 () SeekEntryResult!6235)

(assert (=> b!602901 (= e!344837 e!344836)))

(declare-fun c!68264 () Bool)

(declare-fun lt!274632 () (_ BitVec 64))

(assert (=> b!602901 (= c!68264 (= lt!274632 lt!274481))))

(declare-fun b!602902 () Bool)

(assert (=> b!602902 (= e!344838 (MissingVacant!6235 vacantSpotIndex!68))))

(declare-fun b!602903 () Bool)

(assert (=> b!602903 (= e!344837 Undefined!6235)))

(declare-fun b!602904 () Bool)

(declare-fun c!68265 () Bool)

(assert (=> b!602904 (= c!68265 (= lt!274632 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602904 (= e!344836 e!344838)))

(declare-fun lt!274633 () SeekEntryResult!6235)

(declare-fun d!87425 () Bool)

(assert (=> d!87425 (and (or ((_ is Undefined!6235) lt!274633) (not ((_ is Found!6235) lt!274633)) (and (bvsge (index!27201 lt!274633) #b00000000000000000000000000000000) (bvslt (index!27201 lt!274633) (size!18203 lt!274487)))) (or ((_ is Undefined!6235) lt!274633) ((_ is Found!6235) lt!274633) (not ((_ is MissingVacant!6235) lt!274633)) (not (= (index!27203 lt!274633) vacantSpotIndex!68)) (and (bvsge (index!27203 lt!274633) #b00000000000000000000000000000000) (bvslt (index!27203 lt!274633) (size!18203 lt!274487)))) (or ((_ is Undefined!6235) lt!274633) (ite ((_ is Found!6235) lt!274633) (= (select (arr!17839 lt!274487) (index!27201 lt!274633)) lt!274481) (and ((_ is MissingVacant!6235) lt!274633) (= (index!27203 lt!274633) vacantSpotIndex!68) (= (select (arr!17839 lt!274487) (index!27203 lt!274633)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87425 (= lt!274633 e!344837)))

(declare-fun c!68266 () Bool)

(assert (=> d!87425 (= c!68266 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87425 (= lt!274632 (select (arr!17839 lt!274487) index!984))))

(assert (=> d!87425 (validMask!0 mask!3053)))

(assert (=> d!87425 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274481 lt!274487 mask!3053) lt!274633)))

(assert (= (and d!87425 c!68266) b!602903))

(assert (= (and d!87425 (not c!68266)) b!602901))

(assert (= (and b!602901 c!68264) b!602899))

(assert (= (and b!602901 (not c!68264)) b!602904))

(assert (= (and b!602904 c!68265) b!602902))

(assert (= (and b!602904 (not c!68265)) b!602900))

(declare-fun m!580231 () Bool)

(assert (=> b!602900 m!580231))

(assert (=> b!602900 m!580231))

(declare-fun m!580235 () Bool)

(assert (=> b!602900 m!580235))

(declare-fun m!580237 () Bool)

(assert (=> d!87425 m!580237))

(declare-fun m!580239 () Bool)

(assert (=> d!87425 m!580239))

(assert (=> d!87425 m!580183))

(assert (=> d!87425 m!579999))

(assert (=> b!602629 d!87425))

(declare-fun b!602905 () Bool)

(declare-fun e!344839 () SeekEntryResult!6235)

(assert (=> b!602905 (= e!344839 (Found!6235 lt!274486))))

(declare-fun e!344841 () SeekEntryResult!6235)

(declare-fun b!602906 () Bool)

(assert (=> b!602906 (= e!344841 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!274486 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!274481 lt!274487 mask!3053))))

(declare-fun b!602907 () Bool)

(declare-fun e!344840 () SeekEntryResult!6235)

(assert (=> b!602907 (= e!344840 e!344839)))

(declare-fun c!68267 () Bool)

(declare-fun lt!274634 () (_ BitVec 64))

(assert (=> b!602907 (= c!68267 (= lt!274634 lt!274481))))

(declare-fun b!602908 () Bool)

(assert (=> b!602908 (= e!344841 (MissingVacant!6235 vacantSpotIndex!68))))

(declare-fun b!602909 () Bool)

(assert (=> b!602909 (= e!344840 Undefined!6235)))

(declare-fun b!602910 () Bool)

(declare-fun c!68268 () Bool)

(assert (=> b!602910 (= c!68268 (= lt!274634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602910 (= e!344839 e!344841)))

(declare-fun d!87435 () Bool)

(declare-fun lt!274635 () SeekEntryResult!6235)

(assert (=> d!87435 (and (or ((_ is Undefined!6235) lt!274635) (not ((_ is Found!6235) lt!274635)) (and (bvsge (index!27201 lt!274635) #b00000000000000000000000000000000) (bvslt (index!27201 lt!274635) (size!18203 lt!274487)))) (or ((_ is Undefined!6235) lt!274635) ((_ is Found!6235) lt!274635) (not ((_ is MissingVacant!6235) lt!274635)) (not (= (index!27203 lt!274635) vacantSpotIndex!68)) (and (bvsge (index!27203 lt!274635) #b00000000000000000000000000000000) (bvslt (index!27203 lt!274635) (size!18203 lt!274487)))) (or ((_ is Undefined!6235) lt!274635) (ite ((_ is Found!6235) lt!274635) (= (select (arr!17839 lt!274487) (index!27201 lt!274635)) lt!274481) (and ((_ is MissingVacant!6235) lt!274635) (= (index!27203 lt!274635) vacantSpotIndex!68) (= (select (arr!17839 lt!274487) (index!27203 lt!274635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87435 (= lt!274635 e!344840)))

(declare-fun c!68269 () Bool)

(assert (=> d!87435 (= c!68269 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87435 (= lt!274634 (select (arr!17839 lt!274487) lt!274486))))

(assert (=> d!87435 (validMask!0 mask!3053)))

(assert (=> d!87435 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274486 vacantSpotIndex!68 lt!274481 lt!274487 mask!3053) lt!274635)))

(assert (= (and d!87435 c!68269) b!602909))

(assert (= (and d!87435 (not c!68269)) b!602907))

(assert (= (and b!602907 c!68267) b!602905))

(assert (= (and b!602907 (not c!68267)) b!602910))

(assert (= (and b!602910 c!68268) b!602908))

(assert (= (and b!602910 (not c!68268)) b!602906))

(declare-fun m!580241 () Bool)

(assert (=> b!602906 m!580241))

(assert (=> b!602906 m!580241))

(declare-fun m!580243 () Bool)

(assert (=> b!602906 m!580243))

(declare-fun m!580245 () Bool)

(assert (=> d!87435 m!580245))

(declare-fun m!580247 () Bool)

(assert (=> d!87435 m!580247))

(declare-fun m!580249 () Bool)

(assert (=> d!87435 m!580249))

(assert (=> d!87435 m!579999))

(assert (=> b!602629 d!87435))

(declare-fun d!87437 () Bool)

(declare-fun e!344853 () Bool)

(assert (=> d!87437 e!344853))

(declare-fun res!387113 () Bool)

(assert (=> d!87437 (=> (not res!387113) (not e!344853))))

(assert (=> d!87437 (= res!387113 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18203 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18203 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18203 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18203 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18203 a!2986))))))

(declare-fun lt!274645 () Unit!19063)

(declare-fun choose!9 (array!37167 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19063)

(assert (=> d!87437 (= lt!274645 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274486 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87437 (validMask!0 mask!3053)))

(assert (=> d!87437 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274486 vacantSpotIndex!68 mask!3053) lt!274645)))

(declare-fun b!602928 () Bool)

(assert (=> b!602928 (= e!344853 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274486 vacantSpotIndex!68 (select (arr!17839 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274486 vacantSpotIndex!68 (select (store (arr!17839 a!2986) i!1108 k0!1786) j!136) (array!37168 (store (arr!17839 a!2986) i!1108 k0!1786) (size!18203 a!2986)) mask!3053)))))

(assert (= (and d!87437 res!387113) b!602928))

(declare-fun m!580273 () Bool)

(assert (=> d!87437 m!580273))

(assert (=> d!87437 m!579999))

(assert (=> b!602928 m!579971))

(assert (=> b!602928 m!579959))

(assert (=> b!602928 m!579967))

(assert (=> b!602928 m!579971))

(declare-fun m!580275 () Bool)

(assert (=> b!602928 m!580275))

(assert (=> b!602928 m!579959))

(assert (=> b!602928 m!579961))

(assert (=> b!602629 d!87437))

(declare-fun b!602929 () Bool)

(declare-fun e!344854 () SeekEntryResult!6235)

(assert (=> b!602929 (= e!344854 (Found!6235 lt!274486))))

(declare-fun b!602930 () Bool)

(declare-fun e!344856 () SeekEntryResult!6235)

(assert (=> b!602930 (= e!344856 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!274486 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17839 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602931 () Bool)

(declare-fun e!344855 () SeekEntryResult!6235)

(assert (=> b!602931 (= e!344855 e!344854)))

(declare-fun c!68276 () Bool)

(declare-fun lt!274646 () (_ BitVec 64))

(assert (=> b!602931 (= c!68276 (= lt!274646 (select (arr!17839 a!2986) j!136)))))

(declare-fun b!602932 () Bool)

(assert (=> b!602932 (= e!344856 (MissingVacant!6235 vacantSpotIndex!68))))

(declare-fun b!602933 () Bool)

(assert (=> b!602933 (= e!344855 Undefined!6235)))

(declare-fun b!602934 () Bool)

(declare-fun c!68277 () Bool)

(assert (=> b!602934 (= c!68277 (= lt!274646 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602934 (= e!344854 e!344856)))

(declare-fun d!87445 () Bool)

(declare-fun lt!274647 () SeekEntryResult!6235)

(assert (=> d!87445 (and (or ((_ is Undefined!6235) lt!274647) (not ((_ is Found!6235) lt!274647)) (and (bvsge (index!27201 lt!274647) #b00000000000000000000000000000000) (bvslt (index!27201 lt!274647) (size!18203 a!2986)))) (or ((_ is Undefined!6235) lt!274647) ((_ is Found!6235) lt!274647) (not ((_ is MissingVacant!6235) lt!274647)) (not (= (index!27203 lt!274647) vacantSpotIndex!68)) (and (bvsge (index!27203 lt!274647) #b00000000000000000000000000000000) (bvslt (index!27203 lt!274647) (size!18203 a!2986)))) (or ((_ is Undefined!6235) lt!274647) (ite ((_ is Found!6235) lt!274647) (= (select (arr!17839 a!2986) (index!27201 lt!274647)) (select (arr!17839 a!2986) j!136)) (and ((_ is MissingVacant!6235) lt!274647) (= (index!27203 lt!274647) vacantSpotIndex!68) (= (select (arr!17839 a!2986) (index!27203 lt!274647)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87445 (= lt!274647 e!344855)))

(declare-fun c!68278 () Bool)

(assert (=> d!87445 (= c!68278 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87445 (= lt!274646 (select (arr!17839 a!2986) lt!274486))))

(assert (=> d!87445 (validMask!0 mask!3053)))

(assert (=> d!87445 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274486 vacantSpotIndex!68 (select (arr!17839 a!2986) j!136) a!2986 mask!3053) lt!274647)))

(assert (= (and d!87445 c!68278) b!602933))

(assert (= (and d!87445 (not c!68278)) b!602931))

(assert (= (and b!602931 c!68276) b!602929))

(assert (= (and b!602931 (not c!68276)) b!602934))

(assert (= (and b!602934 c!68277) b!602932))

(assert (= (and b!602934 (not c!68277)) b!602930))

(assert (=> b!602930 m!580241))

(assert (=> b!602930 m!580241))

(assert (=> b!602930 m!579959))

(declare-fun m!580277 () Bool)

(assert (=> b!602930 m!580277))

(declare-fun m!580279 () Bool)

(assert (=> d!87445 m!580279))

(declare-fun m!580281 () Bool)

(assert (=> d!87445 m!580281))

(declare-fun m!580283 () Bool)

(assert (=> d!87445 m!580283))

(assert (=> d!87445 m!579999))

(assert (=> b!602629 d!87445))

(declare-fun d!87447 () Bool)

(declare-fun lt!274661 () (_ BitVec 32))

(assert (=> d!87447 (and (bvsge lt!274661 #b00000000000000000000000000000000) (bvslt lt!274661 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87447 (= lt!274661 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!87447 (validMask!0 mask!3053)))

(assert (=> d!87447 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!274661)))

(declare-fun bs!18483 () Bool)

(assert (= bs!18483 d!87447))

(declare-fun m!580295 () Bool)

(assert (=> bs!18483 m!580295))

(assert (=> bs!18483 m!579999))

(assert (=> b!602629 d!87447))

(declare-fun d!87453 () Bool)

(declare-fun res!387114 () Bool)

(declare-fun e!344866 () Bool)

(assert (=> d!87453 (=> res!387114 e!344866)))

(assert (=> d!87453 (= res!387114 (= (select (arr!17839 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87453 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!344866)))

(declare-fun b!602953 () Bool)

(declare-fun e!344867 () Bool)

(assert (=> b!602953 (= e!344866 e!344867)))

(declare-fun res!387115 () Bool)

(assert (=> b!602953 (=> (not res!387115) (not e!344867))))

(assert (=> b!602953 (= res!387115 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18203 a!2986)))))

(declare-fun b!602954 () Bool)

(assert (=> b!602954 (= e!344867 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87453 (not res!387114)) b!602953))

(assert (= (and b!602953 res!387115) b!602954))

(assert (=> d!87453 m!580187))

(declare-fun m!580297 () Bool)

(assert (=> b!602954 m!580297))

(assert (=> b!602618 d!87453))

(assert (=> b!602608 d!87415))

(declare-fun d!87455 () Bool)

(assert (=> d!87455 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55068 d!87455))

(declare-fun d!87461 () Bool)

(assert (=> d!87461 (= (array_inv!13698 a!2986) (bvsge (size!18203 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55068 d!87461))

(declare-fun b!602967 () Bool)

(declare-fun e!344877 () SeekEntryResult!6235)

(assert (=> b!602967 (= e!344877 (Found!6235 index!984))))

(declare-fun e!344879 () SeekEntryResult!6235)

(declare-fun b!602968 () Bool)

(assert (=> b!602968 (= e!344879 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17839 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602969 () Bool)

(declare-fun e!344878 () SeekEntryResult!6235)

(assert (=> b!602969 (= e!344878 e!344877)))

(declare-fun lt!274665 () (_ BitVec 64))

(declare-fun c!68291 () Bool)

(assert (=> b!602969 (= c!68291 (= lt!274665 (select (arr!17839 a!2986) j!136)))))

(declare-fun b!602970 () Bool)

(assert (=> b!602970 (= e!344879 (MissingVacant!6235 vacantSpotIndex!68))))

(declare-fun b!602971 () Bool)

(assert (=> b!602971 (= e!344878 Undefined!6235)))

(declare-fun b!602972 () Bool)

(declare-fun c!68292 () Bool)

(assert (=> b!602972 (= c!68292 (= lt!274665 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602972 (= e!344877 e!344879)))

(declare-fun d!87463 () Bool)

(declare-fun lt!274666 () SeekEntryResult!6235)

(assert (=> d!87463 (and (or ((_ is Undefined!6235) lt!274666) (not ((_ is Found!6235) lt!274666)) (and (bvsge (index!27201 lt!274666) #b00000000000000000000000000000000) (bvslt (index!27201 lt!274666) (size!18203 a!2986)))) (or ((_ is Undefined!6235) lt!274666) ((_ is Found!6235) lt!274666) (not ((_ is MissingVacant!6235) lt!274666)) (not (= (index!27203 lt!274666) vacantSpotIndex!68)) (and (bvsge (index!27203 lt!274666) #b00000000000000000000000000000000) (bvslt (index!27203 lt!274666) (size!18203 a!2986)))) (or ((_ is Undefined!6235) lt!274666) (ite ((_ is Found!6235) lt!274666) (= (select (arr!17839 a!2986) (index!27201 lt!274666)) (select (arr!17839 a!2986) j!136)) (and ((_ is MissingVacant!6235) lt!274666) (= (index!27203 lt!274666) vacantSpotIndex!68) (= (select (arr!17839 a!2986) (index!27203 lt!274666)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87463 (= lt!274666 e!344878)))

(declare-fun c!68293 () Bool)

(assert (=> d!87463 (= c!68293 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87463 (= lt!274665 (select (arr!17839 a!2986) index!984))))

(assert (=> d!87463 (validMask!0 mask!3053)))

(assert (=> d!87463 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17839 a!2986) j!136) a!2986 mask!3053) lt!274666)))

(assert (= (and d!87463 c!68293) b!602971))

(assert (= (and d!87463 (not c!68293)) b!602969))

(assert (= (and b!602969 c!68291) b!602967))

(assert (= (and b!602969 (not c!68291)) b!602972))

(assert (= (and b!602972 c!68292) b!602970))

(assert (= (and b!602972 (not c!68292)) b!602968))

(assert (=> b!602968 m!580231))

(assert (=> b!602968 m!580231))

(assert (=> b!602968 m!579959))

(declare-fun m!580317 () Bool)

(assert (=> b!602968 m!580317))

(declare-fun m!580319 () Bool)

(assert (=> d!87463 m!580319))

(declare-fun m!580321 () Bool)

(assert (=> d!87463 m!580321))

(assert (=> d!87463 m!580011))

(assert (=> d!87463 m!579999))

(assert (=> b!602617 d!87463))

(declare-fun d!87465 () Bool)

(assert (=> d!87465 (= (validKeyInArray!0 (select (arr!17839 a!2986) j!136)) (and (not (= (select (arr!17839 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17839 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!602628 d!87465))

(check-sat (not d!87425) (not b!602790) (not d!87409) (not b!602784) (not b!602813) (not d!87399) (not b!602803) (not b!602928) (not d!87435) (not bm!32995) (not b!602832) (not d!87437) (not b!602810) (not b!602783) (not b!602779) (not b!602780) (not bm!32999) (not d!87447) (not d!87403) (not bm!32994) (not b!602817) (not b!602833) (not b!602785) (not b!602954) (not d!87445) (not b!602930) (not d!87401) (not b!602767) (not b!602778) (not b!602812) (not b!602968) (not bm!32996) (not d!87463) (not b!602906) (not d!87407) (not b!602900) (not b!602811))
(check-sat)
