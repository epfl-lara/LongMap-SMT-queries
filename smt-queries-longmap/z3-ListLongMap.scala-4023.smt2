; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54828 () Bool)

(assert start!54828)

(declare-fun b!598879 () Bool)

(declare-fun e!342355 () Bool)

(declare-fun e!342352 () Bool)

(assert (=> b!598879 (= e!342355 e!342352)))

(declare-fun res!384028 () Bool)

(assert (=> b!598879 (=> (not res!384028) (not e!342352))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37077 0))(
  ( (array!37078 (arr!17798 (Array (_ BitVec 32) (_ BitVec 64))) (size!18163 (_ BitVec 32))) )
))
(declare-fun lt!272086 () array!37077)

(declare-fun a!2986 () array!37077)

(declare-fun arrayContainsKey!0 (array!37077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598879 (= res!384028 (arrayContainsKey!0 lt!272086 (select (arr!17798 a!2986) j!136) j!136))))

(declare-fun res!384025 () Bool)

(declare-fun e!342356 () Bool)

(assert (=> start!54828 (=> (not res!384025) (not e!342356))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54828 (= res!384025 (validMask!0 mask!3053))))

(assert (=> start!54828 e!342356))

(assert (=> start!54828 true))

(declare-fun array_inv!13681 (array!37077) Bool)

(assert (=> start!54828 (array_inv!13681 a!2986)))

(declare-fun b!598880 () Bool)

(declare-fun res!384030 () Bool)

(declare-fun e!342360 () Bool)

(assert (=> b!598880 (=> (not res!384030) (not e!342360))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!598880 (= res!384030 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17798 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598881 () Bool)

(declare-fun e!342353 () Bool)

(declare-datatypes ((SeekEntryResult!6235 0))(
  ( (MissingZero!6235 (index!27197 (_ BitVec 32))) (Found!6235 (index!27198 (_ BitVec 32))) (Intermediate!6235 (undefined!7047 Bool) (index!27199 (_ BitVec 32)) (x!56013 (_ BitVec 32))) (Undefined!6235) (MissingVacant!6235 (index!27200 (_ BitVec 32))) )
))
(declare-fun lt!272088 () SeekEntryResult!6235)

(declare-fun lt!272081 () SeekEntryResult!6235)

(assert (=> b!598881 (= e!342353 (= lt!272088 lt!272081))))

(declare-fun b!598882 () Bool)

(declare-fun res!384034 () Bool)

(assert (=> b!598882 (=> (not res!384034) (not e!342356))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!598882 (= res!384034 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598883 () Bool)

(declare-fun e!342358 () Bool)

(declare-fun e!342354 () Bool)

(assert (=> b!598883 (= e!342358 e!342354)))

(declare-fun res!384038 () Bool)

(assert (=> b!598883 (=> (not res!384038) (not e!342354))))

(assert (=> b!598883 (= res!384038 (and (= lt!272088 (Found!6235 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17798 a!2986) index!984) (select (arr!17798 a!2986) j!136))) (not (= (select (arr!17798 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37077 (_ BitVec 32)) SeekEntryResult!6235)

(assert (=> b!598883 (= lt!272088 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17798 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598884 () Bool)

(declare-fun res!384032 () Bool)

(assert (=> b!598884 (=> (not res!384032) (not e!342360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37077 (_ BitVec 32)) Bool)

(assert (=> b!598884 (= res!384032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598885 () Bool)

(declare-fun res!384036 () Bool)

(assert (=> b!598885 (=> (not res!384036) (not e!342356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598885 (= res!384036 (validKeyInArray!0 k0!1786))))

(declare-fun b!598886 () Bool)

(assert (=> b!598886 (= e!342352 (arrayContainsKey!0 lt!272086 (select (arr!17798 a!2986) j!136) index!984))))

(declare-fun b!598887 () Bool)

(declare-fun e!342362 () Bool)

(assert (=> b!598887 (= e!342362 true)))

(declare-datatypes ((List!11878 0))(
  ( (Nil!11875) (Cons!11874 (h!12919 (_ BitVec 64)) (t!18097 List!11878)) )
))
(declare-fun arrayNoDuplicates!0 (array!37077 (_ BitVec 32) List!11878) Bool)

(assert (=> b!598887 (arrayNoDuplicates!0 lt!272086 #b00000000000000000000000000000000 Nil!11875)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((Unit!18852 0))(
  ( (Unit!18853) )
))
(declare-fun lt!272087 () Unit!18852)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37077 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11878) Unit!18852)

(assert (=> b!598887 (= lt!272087 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11875))))

(assert (=> b!598887 (arrayContainsKey!0 lt!272086 (select (arr!17798 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272083 () Unit!18852)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37077 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18852)

(assert (=> b!598887 (= lt!272083 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272086 (select (arr!17798 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598888 () Bool)

(declare-fun res!384029 () Bool)

(assert (=> b!598888 (=> (not res!384029) (not e!342356))))

(assert (=> b!598888 (= res!384029 (and (= (size!18163 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18163 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18163 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598889 () Bool)

(declare-fun e!342361 () Unit!18852)

(declare-fun Unit!18854 () Unit!18852)

(assert (=> b!598889 (= e!342361 Unit!18854)))

(assert (=> b!598889 false))

(declare-fun b!598890 () Bool)

(declare-fun Unit!18855 () Unit!18852)

(assert (=> b!598890 (= e!342361 Unit!18855)))

(declare-fun b!598891 () Bool)

(assert (=> b!598891 (= e!342356 e!342360)))

(declare-fun res!384041 () Bool)

(assert (=> b!598891 (=> (not res!384041) (not e!342360))))

(declare-fun lt!272082 () SeekEntryResult!6235)

(assert (=> b!598891 (= res!384041 (or (= lt!272082 (MissingZero!6235 i!1108)) (= lt!272082 (MissingVacant!6235 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37077 (_ BitVec 32)) SeekEntryResult!6235)

(assert (=> b!598891 (= lt!272082 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!598892 () Bool)

(declare-fun res!384035 () Bool)

(assert (=> b!598892 (=> (not res!384035) (not e!342360))))

(assert (=> b!598892 (= res!384035 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11875))))

(declare-fun b!598893 () Bool)

(declare-fun res!384027 () Bool)

(assert (=> b!598893 (=> (not res!384027) (not e!342356))))

(assert (=> b!598893 (= res!384027 (validKeyInArray!0 (select (arr!17798 a!2986) j!136)))))

(declare-fun b!598894 () Bool)

(declare-fun e!342359 () Bool)

(assert (=> b!598894 (= e!342359 e!342355)))

(declare-fun res!384037 () Bool)

(assert (=> b!598894 (=> res!384037 e!342355)))

(declare-fun lt!272080 () (_ BitVec 64))

(declare-fun lt!272085 () (_ BitVec 64))

(assert (=> b!598894 (= res!384037 (or (not (= (select (arr!17798 a!2986) j!136) lt!272085)) (not (= (select (arr!17798 a!2986) j!136) lt!272080)) (bvsge j!136 index!984)))))

(declare-fun b!598895 () Bool)

(assert (=> b!598895 (= e!342360 e!342358)))

(declare-fun res!384026 () Bool)

(assert (=> b!598895 (=> (not res!384026) (not e!342358))))

(assert (=> b!598895 (= res!384026 (= (select (store (arr!17798 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598895 (= lt!272086 (array!37078 (store (arr!17798 a!2986) i!1108 k0!1786) (size!18163 a!2986)))))

(declare-fun b!598896 () Bool)

(declare-fun e!342363 () Bool)

(assert (=> b!598896 (= e!342363 e!342362)))

(declare-fun res!384031 () Bool)

(assert (=> b!598896 (=> res!384031 e!342362)))

(assert (=> b!598896 (= res!384031 (or (not (= (select (arr!17798 a!2986) j!136) lt!272085)) (not (= (select (arr!17798 a!2986) j!136) lt!272080)) (bvsge j!136 index!984)))))

(assert (=> b!598896 e!342359))

(declare-fun res!384033 () Bool)

(assert (=> b!598896 (=> (not res!384033) (not e!342359))))

(assert (=> b!598896 (= res!384033 (= lt!272080 (select (arr!17798 a!2986) j!136)))))

(assert (=> b!598896 (= lt!272080 (select (store (arr!17798 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!598897 () Bool)

(assert (=> b!598897 (= e!342354 (not e!342363))))

(declare-fun res!384040 () Bool)

(assert (=> b!598897 (=> res!384040 e!342363)))

(declare-fun lt!272079 () SeekEntryResult!6235)

(assert (=> b!598897 (= res!384040 (not (= lt!272079 (Found!6235 index!984))))))

(declare-fun lt!272084 () Unit!18852)

(assert (=> b!598897 (= lt!272084 e!342361)))

(declare-fun c!67794 () Bool)

(assert (=> b!598897 (= c!67794 (= lt!272079 Undefined!6235))))

(assert (=> b!598897 (= lt!272079 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272085 lt!272086 mask!3053))))

(assert (=> b!598897 e!342353))

(declare-fun res!384039 () Bool)

(assert (=> b!598897 (=> (not res!384039) (not e!342353))))

(declare-fun lt!272089 () (_ BitVec 32))

(assert (=> b!598897 (= res!384039 (= lt!272081 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272089 vacantSpotIndex!68 lt!272085 lt!272086 mask!3053)))))

(assert (=> b!598897 (= lt!272081 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272089 vacantSpotIndex!68 (select (arr!17798 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!598897 (= lt!272085 (select (store (arr!17798 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272078 () Unit!18852)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37077 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18852)

(assert (=> b!598897 (= lt!272078 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272089 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598897 (= lt!272089 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!54828 res!384025) b!598888))

(assert (= (and b!598888 res!384029) b!598893))

(assert (= (and b!598893 res!384027) b!598885))

(assert (= (and b!598885 res!384036) b!598882))

(assert (= (and b!598882 res!384034) b!598891))

(assert (= (and b!598891 res!384041) b!598884))

(assert (= (and b!598884 res!384032) b!598892))

(assert (= (and b!598892 res!384035) b!598880))

(assert (= (and b!598880 res!384030) b!598895))

(assert (= (and b!598895 res!384026) b!598883))

(assert (= (and b!598883 res!384038) b!598897))

(assert (= (and b!598897 res!384039) b!598881))

(assert (= (and b!598897 c!67794) b!598889))

(assert (= (and b!598897 (not c!67794)) b!598890))

(assert (= (and b!598897 (not res!384040)) b!598896))

(assert (= (and b!598896 res!384033) b!598894))

(assert (= (and b!598894 (not res!384037)) b!598879))

(assert (= (and b!598879 res!384028) b!598886))

(assert (= (and b!598896 (not res!384031)) b!598887))

(declare-fun m!575647 () Bool)

(assert (=> b!598886 m!575647))

(assert (=> b!598886 m!575647))

(declare-fun m!575649 () Bool)

(assert (=> b!598886 m!575649))

(declare-fun m!575651 () Bool)

(assert (=> b!598891 m!575651))

(declare-fun m!575653 () Bool)

(assert (=> b!598892 m!575653))

(declare-fun m!575655 () Bool)

(assert (=> b!598880 m!575655))

(assert (=> b!598887 m!575647))

(declare-fun m!575657 () Bool)

(assert (=> b!598887 m!575657))

(assert (=> b!598887 m!575647))

(declare-fun m!575659 () Bool)

(assert (=> b!598887 m!575659))

(assert (=> b!598887 m!575647))

(declare-fun m!575661 () Bool)

(assert (=> b!598887 m!575661))

(declare-fun m!575663 () Bool)

(assert (=> b!598887 m!575663))

(declare-fun m!575665 () Bool)

(assert (=> b!598897 m!575665))

(declare-fun m!575667 () Bool)

(assert (=> b!598897 m!575667))

(assert (=> b!598897 m!575647))

(declare-fun m!575669 () Bool)

(assert (=> b!598897 m!575669))

(assert (=> b!598897 m!575647))

(declare-fun m!575671 () Bool)

(assert (=> b!598897 m!575671))

(declare-fun m!575673 () Bool)

(assert (=> b!598897 m!575673))

(declare-fun m!575675 () Bool)

(assert (=> b!598897 m!575675))

(declare-fun m!575677 () Bool)

(assert (=> b!598897 m!575677))

(assert (=> b!598895 m!575669))

(declare-fun m!575679 () Bool)

(assert (=> b!598895 m!575679))

(declare-fun m!575681 () Bool)

(assert (=> b!598882 m!575681))

(declare-fun m!575683 () Bool)

(assert (=> start!54828 m!575683))

(declare-fun m!575685 () Bool)

(assert (=> start!54828 m!575685))

(declare-fun m!575687 () Bool)

(assert (=> b!598885 m!575687))

(declare-fun m!575689 () Bool)

(assert (=> b!598884 m!575689))

(assert (=> b!598893 m!575647))

(assert (=> b!598893 m!575647))

(declare-fun m!575691 () Bool)

(assert (=> b!598893 m!575691))

(declare-fun m!575693 () Bool)

(assert (=> b!598883 m!575693))

(assert (=> b!598883 m!575647))

(assert (=> b!598883 m!575647))

(declare-fun m!575695 () Bool)

(assert (=> b!598883 m!575695))

(assert (=> b!598896 m!575647))

(assert (=> b!598896 m!575669))

(declare-fun m!575697 () Bool)

(assert (=> b!598896 m!575697))

(assert (=> b!598879 m!575647))

(assert (=> b!598879 m!575647))

(declare-fun m!575699 () Bool)

(assert (=> b!598879 m!575699))

(assert (=> b!598894 m!575647))

(check-sat (not b!598884) (not b!598891) (not b!598883) (not b!598892) (not b!598886) (not b!598897) (not start!54828) (not b!598887) (not b!598893) (not b!598885) (not b!598882) (not b!598879))
(check-sat)
