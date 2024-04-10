; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54510 () Bool)

(assert start!54510)

(declare-fun b!594964 () Bool)

(declare-fun e!339939 () Bool)

(declare-fun e!339943 () Bool)

(assert (=> b!594964 (= e!339939 e!339943)))

(declare-fun res!380896 () Bool)

(assert (=> b!594964 (=> res!380896 e!339943)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!270128 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36970 0))(
  ( (array!36971 (arr!17749 (Array (_ BitVec 32) (_ BitVec 64))) (size!18113 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36970)

(declare-fun lt!270126 () (_ BitVec 64))

(assert (=> b!594964 (= res!380896 (or (not (= (select (arr!17749 a!2986) j!136) lt!270126)) (not (= (select (arr!17749 a!2986) j!136) lt!270128)) (bvsge j!136 index!984)))))

(declare-fun e!339938 () Bool)

(assert (=> b!594964 e!339938))

(declare-fun res!380898 () Bool)

(assert (=> b!594964 (=> (not res!380898) (not e!339938))))

(assert (=> b!594964 (= res!380898 (= lt!270128 (select (arr!17749 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!594964 (= lt!270128 (select (store (arr!17749 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!594965 () Bool)

(declare-fun res!380888 () Bool)

(declare-fun e!339945 () Bool)

(assert (=> b!594965 (=> res!380888 e!339945)))

(declare-datatypes ((List!11790 0))(
  ( (Nil!11787) (Cons!11786 (h!12831 (_ BitVec 64)) (t!18018 List!11790)) )
))
(declare-fun noDuplicate!244 (List!11790) Bool)

(assert (=> b!594965 (= res!380888 (not (noDuplicate!244 Nil!11787)))))

(declare-fun b!594966 () Bool)

(declare-fun res!380883 () Bool)

(declare-fun e!339936 () Bool)

(assert (=> b!594966 (=> (not res!380883) (not e!339936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!594966 (= res!380883 (validKeyInArray!0 k0!1786))))

(declare-fun b!594967 () Bool)

(declare-fun e!339935 () Bool)

(declare-fun e!339944 () Bool)

(assert (=> b!594967 (= e!339935 e!339944)))

(declare-fun res!380900 () Bool)

(assert (=> b!594967 (=> (not res!380900) (not e!339944))))

(declare-datatypes ((SeekEntryResult!6189 0))(
  ( (MissingZero!6189 (index!27004 (_ BitVec 32))) (Found!6189 (index!27005 (_ BitVec 32))) (Intermediate!6189 (undefined!7001 Bool) (index!27006 (_ BitVec 32)) (x!55809 (_ BitVec 32))) (Undefined!6189) (MissingVacant!6189 (index!27007 (_ BitVec 32))) )
))
(declare-fun lt!270129 () SeekEntryResult!6189)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!594967 (= res!380900 (and (= lt!270129 (Found!6189 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17749 a!2986) index!984) (select (arr!17749 a!2986) j!136))) (not (= (select (arr!17749 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36970 (_ BitVec 32)) SeekEntryResult!6189)

(assert (=> b!594967 (= lt!270129 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17749 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!594968 () Bool)

(declare-fun res!380891 () Bool)

(declare-fun e!339933 () Bool)

(assert (=> b!594968 (=> (not res!380891) (not e!339933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36970 (_ BitVec 32)) Bool)

(assert (=> b!594968 (= res!380891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!594969 () Bool)

(assert (=> b!594969 (= e!339945 true)))

(declare-fun lt!270127 () Bool)

(declare-fun contains!2925 (List!11790 (_ BitVec 64)) Bool)

(assert (=> b!594969 (= lt!270127 (contains!2925 Nil!11787 k0!1786))))

(declare-fun b!594970 () Bool)

(declare-fun res!380894 () Bool)

(assert (=> b!594970 (=> (not res!380894) (not e!339936))))

(assert (=> b!594970 (= res!380894 (and (= (size!18113 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18113 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18113 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!594972 () Bool)

(declare-fun e!339942 () Bool)

(declare-fun e!339937 () Bool)

(assert (=> b!594972 (= e!339942 e!339937)))

(declare-fun res!380895 () Bool)

(assert (=> b!594972 (=> (not res!380895) (not e!339937))))

(declare-fun lt!270122 () array!36970)

(declare-fun arrayContainsKey!0 (array!36970 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!594972 (= res!380895 (arrayContainsKey!0 lt!270122 (select (arr!17749 a!2986) j!136) j!136))))

(declare-fun b!594973 () Bool)

(assert (=> b!594973 (= e!339943 e!339945)))

(declare-fun res!380899 () Bool)

(assert (=> b!594973 (=> res!380899 e!339945)))

(assert (=> b!594973 (= res!380899 (or (bvsge (size!18113 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18113 a!2986))))))

(assert (=> b!594973 (arrayContainsKey!0 lt!270122 (select (arr!17749 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!18674 0))(
  ( (Unit!18675) )
))
(declare-fun lt!270132 () Unit!18674)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36970 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18674)

(assert (=> b!594973 (= lt!270132 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270122 (select (arr!17749 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!594974 () Bool)

(declare-fun e!339941 () Bool)

(declare-fun lt!270123 () SeekEntryResult!6189)

(assert (=> b!594974 (= e!339941 (= lt!270129 lt!270123))))

(declare-fun b!594975 () Bool)

(declare-fun res!380884 () Bool)

(assert (=> b!594975 (=> res!380884 e!339945)))

(assert (=> b!594975 (= res!380884 (contains!2925 Nil!11787 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594976 () Bool)

(declare-fun res!380886 () Bool)

(assert (=> b!594976 (=> (not res!380886) (not e!339933))))

(declare-fun arrayNoDuplicates!0 (array!36970 (_ BitVec 32) List!11790) Bool)

(assert (=> b!594976 (= res!380886 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11787))))

(declare-fun b!594977 () Bool)

(assert (=> b!594977 (= e!339944 (not e!339939))))

(declare-fun res!380887 () Bool)

(assert (=> b!594977 (=> res!380887 e!339939)))

(declare-fun lt!270131 () SeekEntryResult!6189)

(assert (=> b!594977 (= res!380887 (not (= lt!270131 (Found!6189 index!984))))))

(declare-fun lt!270125 () Unit!18674)

(declare-fun e!339940 () Unit!18674)

(assert (=> b!594977 (= lt!270125 e!339940)))

(declare-fun c!67409 () Bool)

(assert (=> b!594977 (= c!67409 (= lt!270131 Undefined!6189))))

(assert (=> b!594977 (= lt!270131 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270126 lt!270122 mask!3053))))

(assert (=> b!594977 e!339941))

(declare-fun res!380880 () Bool)

(assert (=> b!594977 (=> (not res!380880) (not e!339941))))

(declare-fun lt!270133 () (_ BitVec 32))

(assert (=> b!594977 (= res!380880 (= lt!270123 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270133 vacantSpotIndex!68 lt!270126 lt!270122 mask!3053)))))

(assert (=> b!594977 (= lt!270123 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270133 vacantSpotIndex!68 (select (arr!17749 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!594977 (= lt!270126 (select (store (arr!17749 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270130 () Unit!18674)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36970 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18674)

(assert (=> b!594977 (= lt!270130 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270133 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!594977 (= lt!270133 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!594978 () Bool)

(declare-fun Unit!18676 () Unit!18674)

(assert (=> b!594978 (= e!339940 Unit!18676)))

(declare-fun b!594979 () Bool)

(declare-fun res!380892 () Bool)

(assert (=> b!594979 (=> (not res!380892) (not e!339936))))

(assert (=> b!594979 (= res!380892 (validKeyInArray!0 (select (arr!17749 a!2986) j!136)))))

(declare-fun b!594980 () Bool)

(declare-fun res!380890 () Bool)

(assert (=> b!594980 (=> res!380890 e!339945)))

(assert (=> b!594980 (= res!380890 (contains!2925 Nil!11787 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594971 () Bool)

(declare-fun Unit!18677 () Unit!18674)

(assert (=> b!594971 (= e!339940 Unit!18677)))

(assert (=> b!594971 false))

(declare-fun res!380885 () Bool)

(assert (=> start!54510 (=> (not res!380885) (not e!339936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54510 (= res!380885 (validMask!0 mask!3053))))

(assert (=> start!54510 e!339936))

(assert (=> start!54510 true))

(declare-fun array_inv!13545 (array!36970) Bool)

(assert (=> start!54510 (array_inv!13545 a!2986)))

(declare-fun b!594981 () Bool)

(assert (=> b!594981 (= e!339938 e!339942)))

(declare-fun res!380893 () Bool)

(assert (=> b!594981 (=> res!380893 e!339942)))

(assert (=> b!594981 (= res!380893 (or (not (= (select (arr!17749 a!2986) j!136) lt!270126)) (not (= (select (arr!17749 a!2986) j!136) lt!270128)) (bvsge j!136 index!984)))))

(declare-fun b!594982 () Bool)

(declare-fun res!380889 () Bool)

(assert (=> b!594982 (=> (not res!380889) (not e!339933))))

(assert (=> b!594982 (= res!380889 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17749 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594983 () Bool)

(assert (=> b!594983 (= e!339936 e!339933)))

(declare-fun res!380882 () Bool)

(assert (=> b!594983 (=> (not res!380882) (not e!339933))))

(declare-fun lt!270124 () SeekEntryResult!6189)

(assert (=> b!594983 (= res!380882 (or (= lt!270124 (MissingZero!6189 i!1108)) (= lt!270124 (MissingVacant!6189 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36970 (_ BitVec 32)) SeekEntryResult!6189)

(assert (=> b!594983 (= lt!270124 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!594984 () Bool)

(assert (=> b!594984 (= e!339937 (arrayContainsKey!0 lt!270122 (select (arr!17749 a!2986) j!136) index!984))))

(declare-fun b!594985 () Bool)

(assert (=> b!594985 (= e!339933 e!339935)))

(declare-fun res!380897 () Bool)

(assert (=> b!594985 (=> (not res!380897) (not e!339935))))

(assert (=> b!594985 (= res!380897 (= (select (store (arr!17749 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594985 (= lt!270122 (array!36971 (store (arr!17749 a!2986) i!1108 k0!1786) (size!18113 a!2986)))))

(declare-fun b!594986 () Bool)

(declare-fun res!380881 () Bool)

(assert (=> b!594986 (=> (not res!380881) (not e!339936))))

(assert (=> b!594986 (= res!380881 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!54510 res!380885) b!594970))

(assert (= (and b!594970 res!380894) b!594979))

(assert (= (and b!594979 res!380892) b!594966))

(assert (= (and b!594966 res!380883) b!594986))

(assert (= (and b!594986 res!380881) b!594983))

(assert (= (and b!594983 res!380882) b!594968))

(assert (= (and b!594968 res!380891) b!594976))

(assert (= (and b!594976 res!380886) b!594982))

(assert (= (and b!594982 res!380889) b!594985))

(assert (= (and b!594985 res!380897) b!594967))

(assert (= (and b!594967 res!380900) b!594977))

(assert (= (and b!594977 res!380880) b!594974))

(assert (= (and b!594977 c!67409) b!594971))

(assert (= (and b!594977 (not c!67409)) b!594978))

(assert (= (and b!594977 (not res!380887)) b!594964))

(assert (= (and b!594964 res!380898) b!594981))

(assert (= (and b!594981 (not res!380893)) b!594972))

(assert (= (and b!594972 res!380895) b!594984))

(assert (= (and b!594964 (not res!380896)) b!594973))

(assert (= (and b!594973 (not res!380899)) b!594965))

(assert (= (and b!594965 (not res!380888)) b!594975))

(assert (= (and b!594975 (not res!380884)) b!594980))

(assert (= (and b!594980 (not res!380890)) b!594969))

(declare-fun m!572691 () Bool)

(assert (=> b!594985 m!572691))

(declare-fun m!572693 () Bool)

(assert (=> b!594985 m!572693))

(declare-fun m!572695 () Bool)

(assert (=> b!594980 m!572695))

(declare-fun m!572697 () Bool)

(assert (=> start!54510 m!572697))

(declare-fun m!572699 () Bool)

(assert (=> start!54510 m!572699))

(declare-fun m!572701 () Bool)

(assert (=> b!594983 m!572701))

(declare-fun m!572703 () Bool)

(assert (=> b!594966 m!572703))

(declare-fun m!572705 () Bool)

(assert (=> b!594977 m!572705))

(declare-fun m!572707 () Bool)

(assert (=> b!594977 m!572707))

(declare-fun m!572709 () Bool)

(assert (=> b!594977 m!572709))

(declare-fun m!572711 () Bool)

(assert (=> b!594977 m!572711))

(assert (=> b!594977 m!572691))

(declare-fun m!572713 () Bool)

(assert (=> b!594977 m!572713))

(declare-fun m!572715 () Bool)

(assert (=> b!594977 m!572715))

(assert (=> b!594977 m!572711))

(declare-fun m!572717 () Bool)

(assert (=> b!594977 m!572717))

(assert (=> b!594984 m!572711))

(assert (=> b!594984 m!572711))

(declare-fun m!572719 () Bool)

(assert (=> b!594984 m!572719))

(declare-fun m!572721 () Bool)

(assert (=> b!594968 m!572721))

(declare-fun m!572723 () Bool)

(assert (=> b!594982 m!572723))

(declare-fun m!572725 () Bool)

(assert (=> b!594976 m!572725))

(declare-fun m!572727 () Bool)

(assert (=> b!594969 m!572727))

(assert (=> b!594964 m!572711))

(assert (=> b!594964 m!572691))

(declare-fun m!572729 () Bool)

(assert (=> b!594964 m!572729))

(declare-fun m!572731 () Bool)

(assert (=> b!594967 m!572731))

(assert (=> b!594967 m!572711))

(assert (=> b!594967 m!572711))

(declare-fun m!572733 () Bool)

(assert (=> b!594967 m!572733))

(assert (=> b!594972 m!572711))

(assert (=> b!594972 m!572711))

(declare-fun m!572735 () Bool)

(assert (=> b!594972 m!572735))

(assert (=> b!594973 m!572711))

(assert (=> b!594973 m!572711))

(declare-fun m!572737 () Bool)

(assert (=> b!594973 m!572737))

(assert (=> b!594973 m!572711))

(declare-fun m!572739 () Bool)

(assert (=> b!594973 m!572739))

(declare-fun m!572741 () Bool)

(assert (=> b!594986 m!572741))

(declare-fun m!572743 () Bool)

(assert (=> b!594965 m!572743))

(assert (=> b!594981 m!572711))

(assert (=> b!594979 m!572711))

(assert (=> b!594979 m!572711))

(declare-fun m!572745 () Bool)

(assert (=> b!594979 m!572745))

(declare-fun m!572747 () Bool)

(assert (=> b!594975 m!572747))

(check-sat (not b!594983) (not start!54510) (not b!594972) (not b!594979) (not b!594965) (not b!594977) (not b!594966) (not b!594973) (not b!594986) (not b!594975) (not b!594976) (not b!594969) (not b!594968) (not b!594967) (not b!594980) (not b!594984))
(check-sat)
