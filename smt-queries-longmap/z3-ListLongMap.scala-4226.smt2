; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58112 () Bool)

(assert start!58112)

(declare-fun b!641943 () Bool)

(declare-fun res!415841 () Bool)

(declare-fun e!367604 () Bool)

(assert (=> b!641943 (=> (not res!415841) (not e!367604))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38382 0))(
  ( (array!38383 (arr!18407 (Array (_ BitVec 32) (_ BitVec 64))) (size!18772 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38382)

(assert (=> b!641943 (= res!415841 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18407 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641944 () Bool)

(declare-fun e!367607 () Bool)

(assert (=> b!641944 (= e!367604 e!367607)))

(declare-fun res!415851 () Bool)

(assert (=> b!641944 (=> (not res!415851) (not e!367607))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!641944 (= res!415851 (= (select (store (arr!18407 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!297134 () array!38382)

(assert (=> b!641944 (= lt!297134 (array!38383 (store (arr!18407 a!2986) i!1108 k0!1786) (size!18772 a!2986)))))

(declare-fun b!641945 () Bool)

(declare-fun res!415850 () Bool)

(declare-fun e!367612 () Bool)

(assert (=> b!641945 (=> (not res!415850) (not e!367612))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!641945 (= res!415850 (and (= (size!18772 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18772 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18772 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!641946 () Bool)

(declare-fun res!415839 () Bool)

(assert (=> b!641946 (=> (not res!415839) (not e!367612))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!641946 (= res!415839 (validKeyInArray!0 k0!1786))))

(declare-fun b!641947 () Bool)

(declare-fun res!415858 () Bool)

(declare-fun e!367602 () Bool)

(assert (=> b!641947 (=> res!415858 e!367602)))

(declare-datatypes ((List!12487 0))(
  ( (Nil!12484) (Cons!12483 (h!13528 (_ BitVec 64)) (t!18706 List!12487)) )
))
(declare-fun noDuplicate!413 (List!12487) Bool)

(assert (=> b!641947 (= res!415858 (not (noDuplicate!413 Nil!12484)))))

(declare-fun b!641948 () Bool)

(declare-fun e!367603 () Bool)

(declare-datatypes ((SeekEntryResult!6844 0))(
  ( (MissingZero!6844 (index!29702 (_ BitVec 32))) (Found!6844 (index!29703 (_ BitVec 32))) (Intermediate!6844 (undefined!7656 Bool) (index!29704 (_ BitVec 32)) (x!58477 (_ BitVec 32))) (Undefined!6844) (MissingVacant!6844 (index!29705 (_ BitVec 32))) )
))
(declare-fun lt!297127 () SeekEntryResult!6844)

(declare-fun lt!297133 () SeekEntryResult!6844)

(assert (=> b!641948 (= e!367603 (= lt!297127 lt!297133))))

(declare-fun b!641949 () Bool)

(declare-datatypes ((Unit!21704 0))(
  ( (Unit!21705) )
))
(declare-fun e!367608 () Unit!21704)

(declare-fun Unit!21706 () Unit!21704)

(assert (=> b!641949 (= e!367608 Unit!21706)))

(declare-fun b!641950 () Bool)

(declare-fun e!367611 () Bool)

(declare-fun e!367610 () Bool)

(assert (=> b!641950 (= e!367611 (not e!367610))))

(declare-fun res!415843 () Bool)

(assert (=> b!641950 (=> res!415843 e!367610)))

(declare-fun lt!297135 () SeekEntryResult!6844)

(assert (=> b!641950 (= res!415843 (not (= lt!297135 (Found!6844 index!984))))))

(declare-fun lt!297138 () Unit!21704)

(assert (=> b!641950 (= lt!297138 e!367608)))

(declare-fun c!73419 () Bool)

(assert (=> b!641950 (= c!73419 (= lt!297135 Undefined!6844))))

(declare-fun lt!297130 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38382 (_ BitVec 32)) SeekEntryResult!6844)

(assert (=> b!641950 (= lt!297135 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297130 lt!297134 mask!3053))))

(assert (=> b!641950 e!367603))

(declare-fun res!415857 () Bool)

(assert (=> b!641950 (=> (not res!415857) (not e!367603))))

(declare-fun lt!297132 () (_ BitVec 32))

(assert (=> b!641950 (= res!415857 (= lt!297133 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297132 vacantSpotIndex!68 lt!297130 lt!297134 mask!3053)))))

(assert (=> b!641950 (= lt!297133 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297132 vacantSpotIndex!68 (select (arr!18407 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!641950 (= lt!297130 (select (store (arr!18407 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!297129 () Unit!21704)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38382 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21704)

(assert (=> b!641950 (= lt!297129 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297132 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!641950 (= lt!297132 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!641951 () Bool)

(declare-fun e!367605 () Bool)

(declare-fun e!367613 () Bool)

(assert (=> b!641951 (= e!367605 e!367613)))

(declare-fun res!415845 () Bool)

(assert (=> b!641951 (=> res!415845 e!367613)))

(declare-fun lt!297125 () (_ BitVec 64))

(assert (=> b!641951 (= res!415845 (or (not (= (select (arr!18407 a!2986) j!136) lt!297130)) (not (= (select (arr!18407 a!2986) j!136) lt!297125)) (bvsge j!136 index!984)))))

(declare-fun b!641952 () Bool)

(assert (=> b!641952 (= e!367607 e!367611)))

(declare-fun res!415847 () Bool)

(assert (=> b!641952 (=> (not res!415847) (not e!367611))))

(assert (=> b!641952 (= res!415847 (and (= lt!297127 (Found!6844 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18407 a!2986) index!984) (select (arr!18407 a!2986) j!136))) (not (= (select (arr!18407 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!641952 (= lt!297127 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18407 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!641953 () Bool)

(declare-fun Unit!21707 () Unit!21704)

(assert (=> b!641953 (= e!367608 Unit!21707)))

(assert (=> b!641953 false))

(declare-fun b!641954 () Bool)

(declare-fun e!367601 () Bool)

(assert (=> b!641954 (= e!367601 e!367602)))

(declare-fun res!415840 () Bool)

(assert (=> b!641954 (=> res!415840 e!367602)))

(assert (=> b!641954 (= res!415840 (or (bvsge (size!18772 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18772 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!38382 (_ BitVec 32) List!12487) Bool)

(assert (=> b!641954 (arrayNoDuplicates!0 lt!297134 j!136 Nil!12484)))

(declare-fun lt!297126 () Unit!21704)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38382 (_ BitVec 32) (_ BitVec 32)) Unit!21704)

(assert (=> b!641954 (= lt!297126 (lemmaNoDuplicateFromThenFromBigger!0 lt!297134 #b00000000000000000000000000000000 j!136))))

(assert (=> b!641954 (arrayNoDuplicates!0 lt!297134 #b00000000000000000000000000000000 Nil!12484)))

(declare-fun lt!297131 () Unit!21704)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38382 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12487) Unit!21704)

(assert (=> b!641954 (= lt!297131 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12484))))

(declare-fun arrayContainsKey!0 (array!38382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!641954 (arrayContainsKey!0 lt!297134 (select (arr!18407 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297136 () Unit!21704)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38382 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21704)

(assert (=> b!641954 (= lt!297136 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297134 (select (arr!18407 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun res!415844 () Bool)

(assert (=> start!58112 (=> (not res!415844) (not e!367612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58112 (= res!415844 (validMask!0 mask!3053))))

(assert (=> start!58112 e!367612))

(assert (=> start!58112 true))

(declare-fun array_inv!14290 (array!38382) Bool)

(assert (=> start!58112 (array_inv!14290 a!2986)))

(declare-fun b!641955 () Bool)

(assert (=> b!641955 (= e!367612 e!367604)))

(declare-fun res!415855 () Bool)

(assert (=> b!641955 (=> (not res!415855) (not e!367604))))

(declare-fun lt!297137 () SeekEntryResult!6844)

(assert (=> b!641955 (= res!415855 (or (= lt!297137 (MissingZero!6844 i!1108)) (= lt!297137 (MissingVacant!6844 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38382 (_ BitVec 32)) SeekEntryResult!6844)

(assert (=> b!641955 (= lt!297137 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!641956 () Bool)

(assert (=> b!641956 (= e!367610 e!367601)))

(declare-fun res!415852 () Bool)

(assert (=> b!641956 (=> res!415852 e!367601)))

(assert (=> b!641956 (= res!415852 (or (not (= (select (arr!18407 a!2986) j!136) lt!297130)) (not (= (select (arr!18407 a!2986) j!136) lt!297125)) (bvsge j!136 index!984)))))

(assert (=> b!641956 e!367605))

(declare-fun res!415842 () Bool)

(assert (=> b!641956 (=> (not res!415842) (not e!367605))))

(assert (=> b!641956 (= res!415842 (= lt!297125 (select (arr!18407 a!2986) j!136)))))

(assert (=> b!641956 (= lt!297125 (select (store (arr!18407 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!641957 () Bool)

(declare-fun res!415846 () Bool)

(assert (=> b!641957 (=> (not res!415846) (not e!367612))))

(assert (=> b!641957 (= res!415846 (validKeyInArray!0 (select (arr!18407 a!2986) j!136)))))

(declare-fun b!641958 () Bool)

(assert (=> b!641958 (= e!367602 true)))

(declare-fun lt!297128 () Bool)

(declare-fun contains!3120 (List!12487 (_ BitVec 64)) Bool)

(assert (=> b!641958 (= lt!297128 (contains!3120 Nil!12484 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!641959 () Bool)

(declare-fun res!415856 () Bool)

(assert (=> b!641959 (=> (not res!415856) (not e!367604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38382 (_ BitVec 32)) Bool)

(assert (=> b!641959 (= res!415856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!641960 () Bool)

(declare-fun res!415849 () Bool)

(assert (=> b!641960 (=> (not res!415849) (not e!367612))))

(assert (=> b!641960 (= res!415849 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!641961 () Bool)

(declare-fun res!415848 () Bool)

(assert (=> b!641961 (=> (not res!415848) (not e!367604))))

(assert (=> b!641961 (= res!415848 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12484))))

(declare-fun b!641962 () Bool)

(declare-fun e!367609 () Bool)

(assert (=> b!641962 (= e!367613 e!367609)))

(declare-fun res!415853 () Bool)

(assert (=> b!641962 (=> (not res!415853) (not e!367609))))

(assert (=> b!641962 (= res!415853 (arrayContainsKey!0 lt!297134 (select (arr!18407 a!2986) j!136) j!136))))

(declare-fun b!641963 () Bool)

(declare-fun res!415854 () Bool)

(assert (=> b!641963 (=> res!415854 e!367602)))

(assert (=> b!641963 (= res!415854 (contains!3120 Nil!12484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!641964 () Bool)

(assert (=> b!641964 (= e!367609 (arrayContainsKey!0 lt!297134 (select (arr!18407 a!2986) j!136) index!984))))

(assert (= (and start!58112 res!415844) b!641945))

(assert (= (and b!641945 res!415850) b!641957))

(assert (= (and b!641957 res!415846) b!641946))

(assert (= (and b!641946 res!415839) b!641960))

(assert (= (and b!641960 res!415849) b!641955))

(assert (= (and b!641955 res!415855) b!641959))

(assert (= (and b!641959 res!415856) b!641961))

(assert (= (and b!641961 res!415848) b!641943))

(assert (= (and b!641943 res!415841) b!641944))

(assert (= (and b!641944 res!415851) b!641952))

(assert (= (and b!641952 res!415847) b!641950))

(assert (= (and b!641950 res!415857) b!641948))

(assert (= (and b!641950 c!73419) b!641953))

(assert (= (and b!641950 (not c!73419)) b!641949))

(assert (= (and b!641950 (not res!415843)) b!641956))

(assert (= (and b!641956 res!415842) b!641951))

(assert (= (and b!641951 (not res!415845)) b!641962))

(assert (= (and b!641962 res!415853) b!641964))

(assert (= (and b!641956 (not res!415852)) b!641954))

(assert (= (and b!641954 (not res!415840)) b!641947))

(assert (= (and b!641947 (not res!415858)) b!641963))

(assert (= (and b!641963 (not res!415854)) b!641958))

(declare-fun m!615231 () Bool)

(assert (=> b!641962 m!615231))

(assert (=> b!641962 m!615231))

(declare-fun m!615233 () Bool)

(assert (=> b!641962 m!615233))

(declare-fun m!615235 () Bool)

(assert (=> b!641952 m!615235))

(assert (=> b!641952 m!615231))

(assert (=> b!641952 m!615231))

(declare-fun m!615237 () Bool)

(assert (=> b!641952 m!615237))

(declare-fun m!615239 () Bool)

(assert (=> b!641955 m!615239))

(declare-fun m!615241 () Bool)

(assert (=> b!641947 m!615241))

(declare-fun m!615243 () Bool)

(assert (=> b!641961 m!615243))

(declare-fun m!615245 () Bool)

(assert (=> b!641958 m!615245))

(declare-fun m!615247 () Bool)

(assert (=> b!641943 m!615247))

(declare-fun m!615249 () Bool)

(assert (=> b!641950 m!615249))

(declare-fun m!615251 () Bool)

(assert (=> b!641950 m!615251))

(assert (=> b!641950 m!615231))

(declare-fun m!615253 () Bool)

(assert (=> b!641950 m!615253))

(declare-fun m!615255 () Bool)

(assert (=> b!641950 m!615255))

(declare-fun m!615257 () Bool)

(assert (=> b!641950 m!615257))

(declare-fun m!615259 () Bool)

(assert (=> b!641950 m!615259))

(assert (=> b!641950 m!615231))

(declare-fun m!615261 () Bool)

(assert (=> b!641950 m!615261))

(assert (=> b!641964 m!615231))

(assert (=> b!641964 m!615231))

(declare-fun m!615263 () Bool)

(assert (=> b!641964 m!615263))

(declare-fun m!615265 () Bool)

(assert (=> b!641960 m!615265))

(assert (=> b!641951 m!615231))

(declare-fun m!615267 () Bool)

(assert (=> b!641946 m!615267))

(declare-fun m!615269 () Bool)

(assert (=> b!641954 m!615269))

(assert (=> b!641954 m!615231))

(declare-fun m!615271 () Bool)

(assert (=> b!641954 m!615271))

(assert (=> b!641954 m!615231))

(declare-fun m!615273 () Bool)

(assert (=> b!641954 m!615273))

(assert (=> b!641954 m!615231))

(declare-fun m!615275 () Bool)

(assert (=> b!641954 m!615275))

(declare-fun m!615277 () Bool)

(assert (=> b!641954 m!615277))

(declare-fun m!615279 () Bool)

(assert (=> b!641954 m!615279))

(declare-fun m!615281 () Bool)

(assert (=> start!58112 m!615281))

(declare-fun m!615283 () Bool)

(assert (=> start!58112 m!615283))

(declare-fun m!615285 () Bool)

(assert (=> b!641963 m!615285))

(declare-fun m!615287 () Bool)

(assert (=> b!641959 m!615287))

(assert (=> b!641957 m!615231))

(assert (=> b!641957 m!615231))

(declare-fun m!615289 () Bool)

(assert (=> b!641957 m!615289))

(assert (=> b!641944 m!615255))

(declare-fun m!615291 () Bool)

(assert (=> b!641944 m!615291))

(assert (=> b!641956 m!615231))

(assert (=> b!641956 m!615255))

(declare-fun m!615293 () Bool)

(assert (=> b!641956 m!615293))

(check-sat (not b!641960) (not b!641958) (not b!641962) (not b!641954) (not b!641950) (not b!641946) (not b!641961) (not b!641955) (not b!641959) (not b!641963) (not b!641952) (not b!641964) (not b!641957) (not b!641947) (not start!58112))
(check-sat)
