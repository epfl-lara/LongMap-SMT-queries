; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54960 () Bool)

(assert start!54960)

(declare-fun b!601505 () Bool)

(declare-fun res!386189 () Bool)

(declare-fun e!343935 () Bool)

(assert (=> b!601505 (=> (not res!386189) (not e!343935))))

(declare-datatypes ((array!37140 0))(
  ( (array!37141 (arr!17827 (Array (_ BitVec 32) (_ BitVec 64))) (size!18191 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37140)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37140 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!601505 (= res!386189 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!601506 () Bool)

(declare-fun res!386188 () Bool)

(declare-fun e!343936 () Bool)

(assert (=> b!601506 (=> (not res!386188) (not e!343936))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37140 (_ BitVec 32)) Bool)

(assert (=> b!601506 (= res!386188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!601507 () Bool)

(declare-datatypes ((Unit!18991 0))(
  ( (Unit!18992) )
))
(declare-fun e!343947 () Unit!18991)

(declare-fun Unit!18993 () Unit!18991)

(assert (=> b!601507 (= e!343947 Unit!18993)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!273802 () Unit!18991)

(declare-fun lt!273800 () array!37140)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37140 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18991)

(assert (=> b!601507 (= lt!273802 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273800 (select (arr!17827 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!601507 (arrayContainsKey!0 lt!273800 (select (arr!17827 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!273811 () Unit!18991)

(declare-datatypes ((List!11775 0))(
  ( (Nil!11772) (Cons!11771 (h!12819 (_ BitVec 64)) (t!17995 List!11775)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37140 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11775) Unit!18991)

(assert (=> b!601507 (= lt!273811 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11772))))

(declare-fun arrayNoDuplicates!0 (array!37140 (_ BitVec 32) List!11775) Bool)

(assert (=> b!601507 (arrayNoDuplicates!0 lt!273800 #b00000000000000000000000000000000 Nil!11772)))

(declare-fun lt!273801 () Unit!18991)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37140 (_ BitVec 32) (_ BitVec 32)) Unit!18991)

(assert (=> b!601507 (= lt!273801 (lemmaNoDuplicateFromThenFromBigger!0 lt!273800 #b00000000000000000000000000000000 j!136))))

(assert (=> b!601507 (arrayNoDuplicates!0 lt!273800 j!136 Nil!11772)))

(declare-fun lt!273809 () Unit!18991)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37140 (_ BitVec 64) (_ BitVec 32) List!11775) Unit!18991)

(assert (=> b!601507 (= lt!273809 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273800 (select (arr!17827 a!2986) j!136) j!136 Nil!11772))))

(assert (=> b!601507 false))

(declare-fun b!601509 () Bool)

(declare-fun res!386198 () Bool)

(assert (=> b!601509 (=> (not res!386198) (not e!343936))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!601509 (= res!386198 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17827 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!601510 () Bool)

(declare-fun res!386192 () Bool)

(assert (=> b!601510 (=> (not res!386192) (not e!343935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!601510 (= res!386192 (validKeyInArray!0 k0!1786))))

(declare-fun b!601511 () Bool)

(declare-fun Unit!18994 () Unit!18991)

(assert (=> b!601511 (= e!343947 Unit!18994)))

(declare-fun b!601512 () Bool)

(declare-fun e!343942 () Bool)

(declare-fun e!343944 () Bool)

(assert (=> b!601512 (= e!343942 (not e!343944))))

(declare-fun res!386184 () Bool)

(assert (=> b!601512 (=> res!386184 e!343944)))

(declare-datatypes ((SeekEntryResult!6223 0))(
  ( (MissingZero!6223 (index!27149 (_ BitVec 32))) (Found!6223 (index!27150 (_ BitVec 32))) (Intermediate!6223 (undefined!7035 Bool) (index!27151 (_ BitVec 32)) (x!56097 (_ BitVec 32))) (Undefined!6223) (MissingVacant!6223 (index!27152 (_ BitVec 32))) )
))
(declare-fun lt!273799 () SeekEntryResult!6223)

(assert (=> b!601512 (= res!386184 (not (= lt!273799 (Found!6223 index!984))))))

(declare-fun lt!273798 () Unit!18991)

(declare-fun e!343945 () Unit!18991)

(assert (=> b!601512 (= lt!273798 e!343945)))

(declare-fun c!68029 () Bool)

(assert (=> b!601512 (= c!68029 (= lt!273799 Undefined!6223))))

(declare-fun lt!273797 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37140 (_ BitVec 32)) SeekEntryResult!6223)

(assert (=> b!601512 (= lt!273799 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273797 lt!273800 mask!3053))))

(declare-fun e!343946 () Bool)

(assert (=> b!601512 e!343946))

(declare-fun res!386195 () Bool)

(assert (=> b!601512 (=> (not res!386195) (not e!343946))))

(declare-fun lt!273808 () (_ BitVec 32))

(declare-fun lt!273805 () SeekEntryResult!6223)

(assert (=> b!601512 (= res!386195 (= lt!273805 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273808 vacantSpotIndex!68 lt!273797 lt!273800 mask!3053)))))

(assert (=> b!601512 (= lt!273805 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273808 vacantSpotIndex!68 (select (arr!17827 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!601512 (= lt!273797 (select (store (arr!17827 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273804 () Unit!18991)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37140 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18991)

(assert (=> b!601512 (= lt!273804 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273808 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!601512 (= lt!273808 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!601513 () Bool)

(declare-fun Unit!18995 () Unit!18991)

(assert (=> b!601513 (= e!343945 Unit!18995)))

(declare-fun b!601514 () Bool)

(declare-fun e!343938 () Bool)

(assert (=> b!601514 (= e!343938 true)))

(declare-fun lt!273806 () Unit!18991)

(assert (=> b!601514 (= lt!273806 e!343947)))

(declare-fun c!68030 () Bool)

(assert (=> b!601514 (= c!68030 (bvslt j!136 index!984))))

(declare-fun b!601515 () Bool)

(declare-fun res!386200 () Bool)

(assert (=> b!601515 (=> (not res!386200) (not e!343935))))

(assert (=> b!601515 (= res!386200 (and (= (size!18191 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18191 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18191 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!601516 () Bool)

(declare-fun e!343937 () Bool)

(assert (=> b!601516 (= e!343937 (arrayContainsKey!0 lt!273800 (select (arr!17827 a!2986) j!136) index!984))))

(declare-fun b!601508 () Bool)

(assert (=> b!601508 (= e!343935 e!343936)))

(declare-fun res!386196 () Bool)

(assert (=> b!601508 (=> (not res!386196) (not e!343936))))

(declare-fun lt!273810 () SeekEntryResult!6223)

(assert (=> b!601508 (= res!386196 (or (= lt!273810 (MissingZero!6223 i!1108)) (= lt!273810 (MissingVacant!6223 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37140 (_ BitVec 32)) SeekEntryResult!6223)

(assert (=> b!601508 (= lt!273810 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!386193 () Bool)

(assert (=> start!54960 (=> (not res!386193) (not e!343935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54960 (= res!386193 (validMask!0 mask!3053))))

(assert (=> start!54960 e!343935))

(assert (=> start!54960 true))

(declare-fun array_inv!13686 (array!37140) Bool)

(assert (=> start!54960 (array_inv!13686 a!2986)))

(declare-fun b!601517 () Bool)

(assert (=> b!601517 (= e!343944 e!343938)))

(declare-fun res!386199 () Bool)

(assert (=> b!601517 (=> res!386199 e!343938)))

(declare-fun lt!273807 () (_ BitVec 64))

(assert (=> b!601517 (= res!386199 (or (not (= (select (arr!17827 a!2986) j!136) lt!273797)) (not (= (select (arr!17827 a!2986) j!136) lt!273807))))))

(declare-fun e!343939 () Bool)

(assert (=> b!601517 e!343939))

(declare-fun res!386187 () Bool)

(assert (=> b!601517 (=> (not res!386187) (not e!343939))))

(assert (=> b!601517 (= res!386187 (= lt!273807 (select (arr!17827 a!2986) j!136)))))

(assert (=> b!601517 (= lt!273807 (select (store (arr!17827 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!601518 () Bool)

(declare-fun e!343943 () Bool)

(assert (=> b!601518 (= e!343943 e!343942)))

(declare-fun res!386197 () Bool)

(assert (=> b!601518 (=> (not res!386197) (not e!343942))))

(declare-fun lt!273803 () SeekEntryResult!6223)

(assert (=> b!601518 (= res!386197 (and (= lt!273803 (Found!6223 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17827 a!2986) index!984) (select (arr!17827 a!2986) j!136))) (not (= (select (arr!17827 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!601518 (= lt!273803 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17827 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601519 () Bool)

(declare-fun e!343941 () Bool)

(assert (=> b!601519 (= e!343939 e!343941)))

(declare-fun res!386186 () Bool)

(assert (=> b!601519 (=> res!386186 e!343941)))

(assert (=> b!601519 (= res!386186 (or (not (= (select (arr!17827 a!2986) j!136) lt!273797)) (not (= (select (arr!17827 a!2986) j!136) lt!273807)) (bvsge j!136 index!984)))))

(declare-fun b!601520 () Bool)

(declare-fun res!386185 () Bool)

(assert (=> b!601520 (=> (not res!386185) (not e!343936))))

(assert (=> b!601520 (= res!386185 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11772))))

(declare-fun b!601521 () Bool)

(declare-fun Unit!18996 () Unit!18991)

(assert (=> b!601521 (= e!343945 Unit!18996)))

(assert (=> b!601521 false))

(declare-fun b!601522 () Bool)

(assert (=> b!601522 (= e!343941 e!343937)))

(declare-fun res!386191 () Bool)

(assert (=> b!601522 (=> (not res!386191) (not e!343937))))

(assert (=> b!601522 (= res!386191 (arrayContainsKey!0 lt!273800 (select (arr!17827 a!2986) j!136) j!136))))

(declare-fun b!601523 () Bool)

(assert (=> b!601523 (= e!343946 (= lt!273803 lt!273805))))

(declare-fun b!601524 () Bool)

(assert (=> b!601524 (= e!343936 e!343943)))

(declare-fun res!386190 () Bool)

(assert (=> b!601524 (=> (not res!386190) (not e!343943))))

(assert (=> b!601524 (= res!386190 (= (select (store (arr!17827 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601524 (= lt!273800 (array!37141 (store (arr!17827 a!2986) i!1108 k0!1786) (size!18191 a!2986)))))

(declare-fun b!601525 () Bool)

(declare-fun res!386194 () Bool)

(assert (=> b!601525 (=> (not res!386194) (not e!343935))))

(assert (=> b!601525 (= res!386194 (validKeyInArray!0 (select (arr!17827 a!2986) j!136)))))

(assert (= (and start!54960 res!386193) b!601515))

(assert (= (and b!601515 res!386200) b!601525))

(assert (= (and b!601525 res!386194) b!601510))

(assert (= (and b!601510 res!386192) b!601505))

(assert (= (and b!601505 res!386189) b!601508))

(assert (= (and b!601508 res!386196) b!601506))

(assert (= (and b!601506 res!386188) b!601520))

(assert (= (and b!601520 res!386185) b!601509))

(assert (= (and b!601509 res!386198) b!601524))

(assert (= (and b!601524 res!386190) b!601518))

(assert (= (and b!601518 res!386197) b!601512))

(assert (= (and b!601512 res!386195) b!601523))

(assert (= (and b!601512 c!68029) b!601521))

(assert (= (and b!601512 (not c!68029)) b!601513))

(assert (= (and b!601512 (not res!386184)) b!601517))

(assert (= (and b!601517 res!386187) b!601519))

(assert (= (and b!601519 (not res!386186)) b!601522))

(assert (= (and b!601522 res!386191) b!601516))

(assert (= (and b!601517 (not res!386199)) b!601514))

(assert (= (and b!601514 c!68030) b!601507))

(assert (= (and b!601514 (not c!68030)) b!601511))

(declare-fun m!578921 () Bool)

(assert (=> b!601519 m!578921))

(assert (=> b!601522 m!578921))

(assert (=> b!601522 m!578921))

(declare-fun m!578923 () Bool)

(assert (=> b!601522 m!578923))

(declare-fun m!578925 () Bool)

(assert (=> b!601512 m!578925))

(declare-fun m!578927 () Bool)

(assert (=> b!601512 m!578927))

(assert (=> b!601512 m!578921))

(declare-fun m!578929 () Bool)

(assert (=> b!601512 m!578929))

(assert (=> b!601512 m!578921))

(declare-fun m!578931 () Bool)

(assert (=> b!601512 m!578931))

(declare-fun m!578933 () Bool)

(assert (=> b!601512 m!578933))

(declare-fun m!578935 () Bool)

(assert (=> b!601512 m!578935))

(declare-fun m!578937 () Bool)

(assert (=> b!601512 m!578937))

(assert (=> b!601507 m!578921))

(declare-fun m!578939 () Bool)

(assert (=> b!601507 m!578939))

(declare-fun m!578941 () Bool)

(assert (=> b!601507 m!578941))

(assert (=> b!601507 m!578921))

(declare-fun m!578943 () Bool)

(assert (=> b!601507 m!578943))

(declare-fun m!578945 () Bool)

(assert (=> b!601507 m!578945))

(assert (=> b!601507 m!578921))

(declare-fun m!578947 () Bool)

(assert (=> b!601507 m!578947))

(assert (=> b!601507 m!578921))

(declare-fun m!578949 () Bool)

(assert (=> b!601507 m!578949))

(declare-fun m!578951 () Bool)

(assert (=> b!601507 m!578951))

(assert (=> b!601517 m!578921))

(assert (=> b!601517 m!578933))

(declare-fun m!578953 () Bool)

(assert (=> b!601517 m!578953))

(declare-fun m!578955 () Bool)

(assert (=> b!601520 m!578955))

(assert (=> b!601516 m!578921))

(assert (=> b!601516 m!578921))

(declare-fun m!578957 () Bool)

(assert (=> b!601516 m!578957))

(declare-fun m!578959 () Bool)

(assert (=> b!601506 m!578959))

(declare-fun m!578961 () Bool)

(assert (=> b!601505 m!578961))

(declare-fun m!578963 () Bool)

(assert (=> start!54960 m!578963))

(declare-fun m!578965 () Bool)

(assert (=> start!54960 m!578965))

(declare-fun m!578967 () Bool)

(assert (=> b!601508 m!578967))

(assert (=> b!601525 m!578921))

(assert (=> b!601525 m!578921))

(declare-fun m!578969 () Bool)

(assert (=> b!601525 m!578969))

(assert (=> b!601524 m!578933))

(declare-fun m!578971 () Bool)

(assert (=> b!601524 m!578971))

(declare-fun m!578973 () Bool)

(assert (=> b!601509 m!578973))

(declare-fun m!578975 () Bool)

(assert (=> b!601518 m!578975))

(assert (=> b!601518 m!578921))

(assert (=> b!601518 m!578921))

(declare-fun m!578977 () Bool)

(assert (=> b!601518 m!578977))

(declare-fun m!578979 () Bool)

(assert (=> b!601510 m!578979))

(check-sat (not b!601510) (not b!601520) (not start!54960) (not b!601516) (not b!601506) (not b!601522) (not b!601525) (not b!601508) (not b!601518) (not b!601507) (not b!601505) (not b!601512))
(check-sat)
