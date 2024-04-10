; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54892 () Bool)

(assert start!54892)

(declare-fun b!600713 () Bool)

(declare-fun res!385577 () Bool)

(declare-fun e!343461 () Bool)

(assert (=> b!600713 (=> (not res!385577) (not e!343461))))

(declare-datatypes ((array!37127 0))(
  ( (array!37128 (arr!17823 (Array (_ BitVec 32) (_ BitVec 64))) (size!18187 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37127)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600713 (= res!385577 (validKeyInArray!0 (select (arr!17823 a!2986) j!136)))))

(declare-fun b!600714 () Bool)

(declare-fun e!343466 () Bool)

(declare-datatypes ((SeekEntryResult!6263 0))(
  ( (MissingZero!6263 (index!27309 (_ BitVec 32))) (Found!6263 (index!27310 (_ BitVec 32))) (Intermediate!6263 (undefined!7075 Bool) (index!27311 (_ BitVec 32)) (x!56110 (_ BitVec 32))) (Undefined!6263) (MissingVacant!6263 (index!27312 (_ BitVec 32))) )
))
(declare-fun lt!273313 () SeekEntryResult!6263)

(declare-fun lt!273317 () SeekEntryResult!6263)

(assert (=> b!600714 (= e!343466 (= lt!273313 lt!273317))))

(declare-fun b!600715 () Bool)

(declare-fun e!343467 () Bool)

(declare-fun e!343464 () Bool)

(assert (=> b!600715 (= e!343467 (not e!343464))))

(declare-fun res!385584 () Bool)

(assert (=> b!600715 (=> res!385584 e!343464)))

(declare-fun lt!273307 () SeekEntryResult!6263)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!600715 (= res!385584 (not (= lt!273307 (Found!6263 index!984))))))

(declare-datatypes ((Unit!18970 0))(
  ( (Unit!18971) )
))
(declare-fun lt!273311 () Unit!18970)

(declare-fun e!343456 () Unit!18970)

(assert (=> b!600715 (= lt!273311 e!343456)))

(declare-fun c!67937 () Bool)

(assert (=> b!600715 (= c!67937 (= lt!273307 Undefined!6263))))

(declare-fun lt!273308 () (_ BitVec 64))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!273309 () array!37127)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37127 (_ BitVec 32)) SeekEntryResult!6263)

(assert (=> b!600715 (= lt!273307 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273308 lt!273309 mask!3053))))

(assert (=> b!600715 e!343466))

(declare-fun res!385582 () Bool)

(assert (=> b!600715 (=> (not res!385582) (not e!343466))))

(declare-fun lt!273316 () (_ BitVec 32))

(assert (=> b!600715 (= res!385582 (= lt!273317 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273316 vacantSpotIndex!68 lt!273308 lt!273309 mask!3053)))))

(assert (=> b!600715 (= lt!273317 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273316 vacantSpotIndex!68 (select (arr!17823 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!600715 (= lt!273308 (select (store (arr!17823 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!273306 () Unit!18970)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37127 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18970)

(assert (=> b!600715 (= lt!273306 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273316 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600715 (= lt!273316 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!600716 () Bool)

(declare-fun e!343455 () Bool)

(assert (=> b!600716 (= e!343464 e!343455)))

(declare-fun res!385573 () Bool)

(assert (=> b!600716 (=> res!385573 e!343455)))

(declare-fun lt!273319 () (_ BitVec 64))

(assert (=> b!600716 (= res!385573 (or (not (= (select (arr!17823 a!2986) j!136) lt!273308)) (not (= (select (arr!17823 a!2986) j!136) lt!273319)) (bvsge j!136 index!984)))))

(declare-fun e!343465 () Bool)

(assert (=> b!600716 e!343465))

(declare-fun res!385585 () Bool)

(assert (=> b!600716 (=> (not res!385585) (not e!343465))))

(assert (=> b!600716 (= res!385585 (= lt!273319 (select (arr!17823 a!2986) j!136)))))

(assert (=> b!600716 (= lt!273319 (select (store (arr!17823 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!600717 () Bool)

(declare-fun res!385587 () Bool)

(declare-fun e!343457 () Bool)

(assert (=> b!600717 (=> res!385587 e!343457)))

(declare-datatypes ((List!11864 0))(
  ( (Nil!11861) (Cons!11860 (h!12905 (_ BitVec 64)) (t!18092 List!11864)) )
))
(declare-fun contains!2980 (List!11864 (_ BitVec 64)) Bool)

(assert (=> b!600717 (= res!385587 (contains!2980 Nil!11861 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600718 () Bool)

(assert (=> b!600718 (= e!343457 true)))

(declare-fun lt!273315 () Bool)

(assert (=> b!600718 (= lt!273315 (contains!2980 Nil!11861 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600719 () Bool)

(declare-fun e!343459 () Bool)

(assert (=> b!600719 (= e!343465 e!343459)))

(declare-fun res!385592 () Bool)

(assert (=> b!600719 (=> res!385592 e!343459)))

(assert (=> b!600719 (= res!385592 (or (not (= (select (arr!17823 a!2986) j!136) lt!273308)) (not (= (select (arr!17823 a!2986) j!136) lt!273319)) (bvsge j!136 index!984)))))

(declare-fun b!600720 () Bool)

(assert (=> b!600720 (= e!343455 e!343457)))

(declare-fun res!385578 () Bool)

(assert (=> b!600720 (=> res!385578 e!343457)))

(assert (=> b!600720 (= res!385578 (or (bvsge (size!18187 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18187 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37127 (_ BitVec 32) List!11864) Bool)

(assert (=> b!600720 (arrayNoDuplicates!0 lt!273309 j!136 Nil!11861)))

(declare-fun lt!273312 () Unit!18970)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37127 (_ BitVec 32) (_ BitVec 32)) Unit!18970)

(assert (=> b!600720 (= lt!273312 (lemmaNoDuplicateFromThenFromBigger!0 lt!273309 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600720 (arrayNoDuplicates!0 lt!273309 #b00000000000000000000000000000000 Nil!11861)))

(declare-fun lt!273314 () Unit!18970)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37127 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11864) Unit!18970)

(assert (=> b!600720 (= lt!273314 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11861))))

(declare-fun arrayContainsKey!0 (array!37127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600720 (arrayContainsKey!0 lt!273309 (select (arr!17823 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273310 () Unit!18970)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37127 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18970)

(assert (=> b!600720 (= lt!273310 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273309 (select (arr!17823 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600721 () Bool)

(declare-fun res!385588 () Bool)

(assert (=> b!600721 (=> (not res!385588) (not e!343461))))

(assert (=> b!600721 (= res!385588 (and (= (size!18187 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18187 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18187 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600722 () Bool)

(declare-fun e!343462 () Bool)

(assert (=> b!600722 (= e!343462 (arrayContainsKey!0 lt!273309 (select (arr!17823 a!2986) j!136) index!984))))

(declare-fun b!600723 () Bool)

(declare-fun res!385586 () Bool)

(assert (=> b!600723 (=> (not res!385586) (not e!343461))))

(assert (=> b!600723 (= res!385586 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600724 () Bool)

(declare-fun res!385574 () Bool)

(declare-fun e!343463 () Bool)

(assert (=> b!600724 (=> (not res!385574) (not e!343463))))

(assert (=> b!600724 (= res!385574 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11861))))

(declare-fun res!385579 () Bool)

(assert (=> start!54892 (=> (not res!385579) (not e!343461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54892 (= res!385579 (validMask!0 mask!3053))))

(assert (=> start!54892 e!343461))

(assert (=> start!54892 true))

(declare-fun array_inv!13619 (array!37127) Bool)

(assert (=> start!54892 (array_inv!13619 a!2986)))

(declare-fun b!600725 () Bool)

(assert (=> b!600725 (= e!343459 e!343462)))

(declare-fun res!385576 () Bool)

(assert (=> b!600725 (=> (not res!385576) (not e!343462))))

(assert (=> b!600725 (= res!385576 (arrayContainsKey!0 lt!273309 (select (arr!17823 a!2986) j!136) j!136))))

(declare-fun b!600726 () Bool)

(declare-fun e!343460 () Bool)

(assert (=> b!600726 (= e!343463 e!343460)))

(declare-fun res!385590 () Bool)

(assert (=> b!600726 (=> (not res!385590) (not e!343460))))

(assert (=> b!600726 (= res!385590 (= (select (store (arr!17823 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600726 (= lt!273309 (array!37128 (store (arr!17823 a!2986) i!1108 k!1786) (size!18187 a!2986)))))

(declare-fun b!600727 () Bool)

(assert (=> b!600727 (= e!343460 e!343467)))

(declare-fun res!385589 () Bool)

(assert (=> b!600727 (=> (not res!385589) (not e!343467))))

(assert (=> b!600727 (= res!385589 (and (= lt!273313 (Found!6263 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17823 a!2986) index!984) (select (arr!17823 a!2986) j!136))) (not (= (select (arr!17823 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!600727 (= lt!273313 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17823 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600728 () Bool)

(declare-fun res!385575 () Bool)

(assert (=> b!600728 (=> (not res!385575) (not e!343463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37127 (_ BitVec 32)) Bool)

(assert (=> b!600728 (= res!385575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600729 () Bool)

(declare-fun res!385580 () Bool)

(assert (=> b!600729 (=> (not res!385580) (not e!343463))))

(assert (=> b!600729 (= res!385580 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17823 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600730 () Bool)

(assert (=> b!600730 (= e!343461 e!343463)))

(declare-fun res!385591 () Bool)

(assert (=> b!600730 (=> (not res!385591) (not e!343463))))

(declare-fun lt!273318 () SeekEntryResult!6263)

(assert (=> b!600730 (= res!385591 (or (= lt!273318 (MissingZero!6263 i!1108)) (= lt!273318 (MissingVacant!6263 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37127 (_ BitVec 32)) SeekEntryResult!6263)

(assert (=> b!600730 (= lt!273318 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!600731 () Bool)

(declare-fun res!385583 () Bool)

(assert (=> b!600731 (=> res!385583 e!343457)))

(declare-fun noDuplicate!297 (List!11864) Bool)

(assert (=> b!600731 (= res!385583 (not (noDuplicate!297 Nil!11861)))))

(declare-fun b!600732 () Bool)

(declare-fun Unit!18972 () Unit!18970)

(assert (=> b!600732 (= e!343456 Unit!18972)))

(declare-fun b!600733 () Bool)

(declare-fun Unit!18973 () Unit!18970)

(assert (=> b!600733 (= e!343456 Unit!18973)))

(assert (=> b!600733 false))

(declare-fun b!600734 () Bool)

(declare-fun res!385581 () Bool)

(assert (=> b!600734 (=> (not res!385581) (not e!343461))))

(assert (=> b!600734 (= res!385581 (validKeyInArray!0 k!1786))))

(assert (= (and start!54892 res!385579) b!600721))

(assert (= (and b!600721 res!385588) b!600713))

(assert (= (and b!600713 res!385577) b!600734))

(assert (= (and b!600734 res!385581) b!600723))

(assert (= (and b!600723 res!385586) b!600730))

(assert (= (and b!600730 res!385591) b!600728))

(assert (= (and b!600728 res!385575) b!600724))

(assert (= (and b!600724 res!385574) b!600729))

(assert (= (and b!600729 res!385580) b!600726))

(assert (= (and b!600726 res!385590) b!600727))

(assert (= (and b!600727 res!385589) b!600715))

(assert (= (and b!600715 res!385582) b!600714))

(assert (= (and b!600715 c!67937) b!600733))

(assert (= (and b!600715 (not c!67937)) b!600732))

(assert (= (and b!600715 (not res!385584)) b!600716))

(assert (= (and b!600716 res!385585) b!600719))

(assert (= (and b!600719 (not res!385592)) b!600725))

(assert (= (and b!600725 res!385576) b!600722))

(assert (= (and b!600716 (not res!385573)) b!600720))

(assert (= (and b!600720 (not res!385578)) b!600731))

(assert (= (and b!600731 (not res!385583)) b!600717))

(assert (= (and b!600717 (not res!385587)) b!600718))

(declare-fun m!577925 () Bool)

(assert (=> b!600716 m!577925))

(declare-fun m!577927 () Bool)

(assert (=> b!600716 m!577927))

(declare-fun m!577929 () Bool)

(assert (=> b!600716 m!577929))

(declare-fun m!577931 () Bool)

(assert (=> b!600717 m!577931))

(declare-fun m!577933 () Bool)

(assert (=> b!600729 m!577933))

(declare-fun m!577935 () Bool)

(assert (=> b!600734 m!577935))

(declare-fun m!577937 () Bool)

(assert (=> b!600718 m!577937))

(declare-fun m!577939 () Bool)

(assert (=> b!600730 m!577939))

(assert (=> b!600722 m!577925))

(assert (=> b!600722 m!577925))

(declare-fun m!577941 () Bool)

(assert (=> b!600722 m!577941))

(declare-fun m!577943 () Bool)

(assert (=> start!54892 m!577943))

(declare-fun m!577945 () Bool)

(assert (=> start!54892 m!577945))

(declare-fun m!577947 () Bool)

(assert (=> b!600723 m!577947))

(declare-fun m!577949 () Bool)

(assert (=> b!600715 m!577949))

(assert (=> b!600715 m!577925))

(assert (=> b!600715 m!577927))

(declare-fun m!577951 () Bool)

(assert (=> b!600715 m!577951))

(declare-fun m!577953 () Bool)

(assert (=> b!600715 m!577953))

(declare-fun m!577955 () Bool)

(assert (=> b!600715 m!577955))

(declare-fun m!577957 () Bool)

(assert (=> b!600715 m!577957))

(assert (=> b!600715 m!577925))

(declare-fun m!577959 () Bool)

(assert (=> b!600715 m!577959))

(assert (=> b!600726 m!577927))

(declare-fun m!577961 () Bool)

(assert (=> b!600726 m!577961))

(assert (=> b!600725 m!577925))

(assert (=> b!600725 m!577925))

(declare-fun m!577963 () Bool)

(assert (=> b!600725 m!577963))

(declare-fun m!577965 () Bool)

(assert (=> b!600728 m!577965))

(assert (=> b!600719 m!577925))

(assert (=> b!600720 m!577925))

(declare-fun m!577967 () Bool)

(assert (=> b!600720 m!577967))

(assert (=> b!600720 m!577925))

(declare-fun m!577969 () Bool)

(assert (=> b!600720 m!577969))

(assert (=> b!600720 m!577925))

(declare-fun m!577971 () Bool)

(assert (=> b!600720 m!577971))

(declare-fun m!577973 () Bool)

(assert (=> b!600720 m!577973))

(declare-fun m!577975 () Bool)

(assert (=> b!600720 m!577975))

(declare-fun m!577977 () Bool)

(assert (=> b!600720 m!577977))

(assert (=> b!600713 m!577925))

(assert (=> b!600713 m!577925))

(declare-fun m!577979 () Bool)

(assert (=> b!600713 m!577979))

(declare-fun m!577981 () Bool)

(assert (=> b!600731 m!577981))

(declare-fun m!577983 () Bool)

(assert (=> b!600724 m!577983))

(declare-fun m!577985 () Bool)

(assert (=> b!600727 m!577985))

(assert (=> b!600727 m!577925))

(assert (=> b!600727 m!577925))

(declare-fun m!577987 () Bool)

(assert (=> b!600727 m!577987))

(push 1)

