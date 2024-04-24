; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57312 () Bool)

(assert start!57312)

(declare-fun b!633818 () Bool)

(declare-fun e!362418 () Bool)

(declare-fun e!362420 () Bool)

(assert (=> b!633818 (= e!362418 e!362420)))

(declare-fun res!409845 () Bool)

(assert (=> b!633818 (=> res!409845 e!362420)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!292962 () (_ BitVec 64))

(declare-fun lt!292957 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38160 0))(
  ( (array!38161 (arr!18307 (Array (_ BitVec 32) (_ BitVec 64))) (size!18671 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38160)

(assert (=> b!633818 (= res!409845 (or (not (= (select (arr!18307 a!2986) j!136) lt!292962)) (not (= (select (arr!18307 a!2986) j!136) lt!292957)) (bvsge j!136 index!984)))))

(declare-fun b!633819 () Bool)

(declare-fun res!409858 () Bool)

(declare-fun e!362426 () Bool)

(assert (=> b!633819 (=> (not res!409858) (not e!362426))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38160 (_ BitVec 32)) Bool)

(assert (=> b!633819 (= res!409858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633820 () Bool)

(declare-fun e!362419 () Bool)

(assert (=> b!633820 (= e!362420 e!362419)))

(declare-fun res!409855 () Bool)

(assert (=> b!633820 (=> (not res!409855) (not e!362419))))

(declare-fun lt!292956 () array!38160)

(declare-fun arrayContainsKey!0 (array!38160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633820 (= res!409855 (arrayContainsKey!0 lt!292956 (select (arr!18307 a!2986) j!136) j!136))))

(declare-fun res!409852 () Bool)

(declare-fun e!362427 () Bool)

(assert (=> start!57312 (=> (not res!409852) (not e!362427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57312 (= res!409852 (validMask!0 mask!3053))))

(assert (=> start!57312 e!362427))

(assert (=> start!57312 true))

(declare-fun array_inv!14166 (array!38160) Bool)

(assert (=> start!57312 (array_inv!14166 a!2986)))

(declare-fun b!633821 () Bool)

(assert (=> b!633821 (= e!362419 (arrayContainsKey!0 lt!292956 (select (arr!18307 a!2986) j!136) index!984))))

(declare-fun b!633822 () Bool)

(declare-fun res!409854 () Bool)

(assert (=> b!633822 (=> (not res!409854) (not e!362427))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633822 (= res!409854 (validKeyInArray!0 k0!1786))))

(declare-fun b!633823 () Bool)

(declare-fun e!362423 () Bool)

(declare-fun e!362425 () Bool)

(assert (=> b!633823 (= e!362423 e!362425)))

(declare-fun res!409849 () Bool)

(assert (=> b!633823 (=> (not res!409849) (not e!362425))))

(declare-datatypes ((SeekEntryResult!6703 0))(
  ( (MissingZero!6703 (index!29111 (_ BitVec 32))) (Found!6703 (index!29112 (_ BitVec 32))) (Intermediate!6703 (undefined!7515 Bool) (index!29113 (_ BitVec 32)) (x!58007 (_ BitVec 32))) (Undefined!6703) (MissingVacant!6703 (index!29114 (_ BitVec 32))) )
))
(declare-fun lt!292954 () SeekEntryResult!6703)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!633823 (= res!409849 (and (= lt!292954 (Found!6703 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18307 a!2986) index!984) (select (arr!18307 a!2986) j!136))) (not (= (select (arr!18307 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38160 (_ BitVec 32)) SeekEntryResult!6703)

(assert (=> b!633823 (= lt!292954 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18307 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633824 () Bool)

(declare-datatypes ((Unit!21321 0))(
  ( (Unit!21322) )
))
(declare-fun e!362422 () Unit!21321)

(declare-fun Unit!21323 () Unit!21321)

(assert (=> b!633824 (= e!362422 Unit!21323)))

(assert (=> b!633824 false))

(declare-fun b!633825 () Bool)

(declare-fun res!409843 () Bool)

(assert (=> b!633825 (=> (not res!409843) (not e!362427))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!633825 (= res!409843 (and (= (size!18671 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18671 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18671 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633826 () Bool)

(assert (=> b!633826 (= e!362427 e!362426)))

(declare-fun res!409848 () Bool)

(assert (=> b!633826 (=> (not res!409848) (not e!362426))))

(declare-fun lt!292958 () SeekEntryResult!6703)

(assert (=> b!633826 (= res!409848 (or (= lt!292958 (MissingZero!6703 i!1108)) (= lt!292958 (MissingVacant!6703 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38160 (_ BitVec 32)) SeekEntryResult!6703)

(assert (=> b!633826 (= lt!292958 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!633827 () Bool)

(declare-fun e!362424 () Bool)

(assert (=> b!633827 (= e!362425 (not e!362424))))

(declare-fun res!409847 () Bool)

(assert (=> b!633827 (=> res!409847 e!362424)))

(declare-fun lt!292960 () SeekEntryResult!6703)

(assert (=> b!633827 (= res!409847 (not (= lt!292960 (Found!6703 index!984))))))

(declare-fun lt!292959 () Unit!21321)

(assert (=> b!633827 (= lt!292959 e!362422)))

(declare-fun c!72356 () Bool)

(assert (=> b!633827 (= c!72356 (= lt!292960 Undefined!6703))))

(assert (=> b!633827 (= lt!292960 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292962 lt!292956 mask!3053))))

(declare-fun e!362421 () Bool)

(assert (=> b!633827 e!362421))

(declare-fun res!409844 () Bool)

(assert (=> b!633827 (=> (not res!409844) (not e!362421))))

(declare-fun lt!292955 () SeekEntryResult!6703)

(declare-fun lt!292961 () (_ BitVec 32))

(assert (=> b!633827 (= res!409844 (= lt!292955 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292961 vacantSpotIndex!68 lt!292962 lt!292956 mask!3053)))))

(assert (=> b!633827 (= lt!292955 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292961 vacantSpotIndex!68 (select (arr!18307 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633827 (= lt!292962 (select (store (arr!18307 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292963 () Unit!21321)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38160 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21321)

(assert (=> b!633827 (= lt!292963 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292961 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633827 (= lt!292961 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!633828 () Bool)

(declare-fun res!409846 () Bool)

(assert (=> b!633828 (=> (not res!409846) (not e!362427))))

(assert (=> b!633828 (= res!409846 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633829 () Bool)

(declare-fun res!409853 () Bool)

(assert (=> b!633829 (=> (not res!409853) (not e!362426))))

(assert (=> b!633829 (= res!409853 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18307 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633830 () Bool)

(assert (=> b!633830 (= e!362424 (or (not (= (select (arr!18307 a!2986) j!136) lt!292962)) (not (= (select (arr!18307 a!2986) j!136) lt!292957)) (bvsge j!136 index!984) (bvslt index!984 (size!18671 a!2986))))))

(assert (=> b!633830 e!362418))

(declare-fun res!409856 () Bool)

(assert (=> b!633830 (=> (not res!409856) (not e!362418))))

(assert (=> b!633830 (= res!409856 (= lt!292957 (select (arr!18307 a!2986) j!136)))))

(assert (=> b!633830 (= lt!292957 (select (store (arr!18307 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!633831 () Bool)

(declare-fun Unit!21324 () Unit!21321)

(assert (=> b!633831 (= e!362422 Unit!21324)))

(declare-fun b!633832 () Bool)

(assert (=> b!633832 (= e!362426 e!362423)))

(declare-fun res!409857 () Bool)

(assert (=> b!633832 (=> (not res!409857) (not e!362423))))

(assert (=> b!633832 (= res!409857 (= (select (store (arr!18307 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633832 (= lt!292956 (array!38161 (store (arr!18307 a!2986) i!1108 k0!1786) (size!18671 a!2986)))))

(declare-fun b!633833 () Bool)

(assert (=> b!633833 (= e!362421 (= lt!292954 lt!292955))))

(declare-fun b!633834 () Bool)

(declare-fun res!409850 () Bool)

(assert (=> b!633834 (=> (not res!409850) (not e!362426))))

(declare-datatypes ((List!12255 0))(
  ( (Nil!12252) (Cons!12251 (h!13299 (_ BitVec 64)) (t!18475 List!12255)) )
))
(declare-fun arrayNoDuplicates!0 (array!38160 (_ BitVec 32) List!12255) Bool)

(assert (=> b!633834 (= res!409850 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12252))))

(declare-fun b!633835 () Bool)

(declare-fun res!409851 () Bool)

(assert (=> b!633835 (=> (not res!409851) (not e!362427))))

(assert (=> b!633835 (= res!409851 (validKeyInArray!0 (select (arr!18307 a!2986) j!136)))))

(assert (= (and start!57312 res!409852) b!633825))

(assert (= (and b!633825 res!409843) b!633835))

(assert (= (and b!633835 res!409851) b!633822))

(assert (= (and b!633822 res!409854) b!633828))

(assert (= (and b!633828 res!409846) b!633826))

(assert (= (and b!633826 res!409848) b!633819))

(assert (= (and b!633819 res!409858) b!633834))

(assert (= (and b!633834 res!409850) b!633829))

(assert (= (and b!633829 res!409853) b!633832))

(assert (= (and b!633832 res!409857) b!633823))

(assert (= (and b!633823 res!409849) b!633827))

(assert (= (and b!633827 res!409844) b!633833))

(assert (= (and b!633827 c!72356) b!633824))

(assert (= (and b!633827 (not c!72356)) b!633831))

(assert (= (and b!633827 (not res!409847)) b!633830))

(assert (= (and b!633830 res!409856) b!633818))

(assert (= (and b!633818 (not res!409845)) b!633820))

(assert (= (and b!633820 res!409855) b!633821))

(declare-fun m!608785 () Bool)

(assert (=> b!633829 m!608785))

(declare-fun m!608787 () Bool)

(assert (=> b!633820 m!608787))

(assert (=> b!633820 m!608787))

(declare-fun m!608789 () Bool)

(assert (=> b!633820 m!608789))

(declare-fun m!608791 () Bool)

(assert (=> b!633832 m!608791))

(declare-fun m!608793 () Bool)

(assert (=> b!633832 m!608793))

(assert (=> b!633830 m!608787))

(assert (=> b!633830 m!608791))

(declare-fun m!608795 () Bool)

(assert (=> b!633830 m!608795))

(assert (=> b!633835 m!608787))

(assert (=> b!633835 m!608787))

(declare-fun m!608797 () Bool)

(assert (=> b!633835 m!608797))

(declare-fun m!608799 () Bool)

(assert (=> b!633822 m!608799))

(declare-fun m!608801 () Bool)

(assert (=> start!57312 m!608801))

(declare-fun m!608803 () Bool)

(assert (=> start!57312 m!608803))

(declare-fun m!608805 () Bool)

(assert (=> b!633823 m!608805))

(assert (=> b!633823 m!608787))

(assert (=> b!633823 m!608787))

(declare-fun m!608807 () Bool)

(assert (=> b!633823 m!608807))

(declare-fun m!608809 () Bool)

(assert (=> b!633828 m!608809))

(assert (=> b!633821 m!608787))

(assert (=> b!633821 m!608787))

(declare-fun m!608811 () Bool)

(assert (=> b!633821 m!608811))

(declare-fun m!608813 () Bool)

(assert (=> b!633819 m!608813))

(declare-fun m!608815 () Bool)

(assert (=> b!633826 m!608815))

(declare-fun m!608817 () Bool)

(assert (=> b!633827 m!608817))

(declare-fun m!608819 () Bool)

(assert (=> b!633827 m!608819))

(assert (=> b!633827 m!608787))

(declare-fun m!608821 () Bool)

(assert (=> b!633827 m!608821))

(assert (=> b!633827 m!608787))

(assert (=> b!633827 m!608791))

(declare-fun m!608823 () Bool)

(assert (=> b!633827 m!608823))

(declare-fun m!608825 () Bool)

(assert (=> b!633827 m!608825))

(declare-fun m!608827 () Bool)

(assert (=> b!633827 m!608827))

(declare-fun m!608829 () Bool)

(assert (=> b!633834 m!608829))

(assert (=> b!633818 m!608787))

(check-sat (not b!633821) (not b!633820) (not b!633819) (not b!633823) (not start!57312) (not b!633827) (not b!633835) (not b!633828) (not b!633826) (not b!633822) (not b!633834))
(check-sat)
