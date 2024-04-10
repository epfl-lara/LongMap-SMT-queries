; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57262 () Bool)

(assert start!57262)

(declare-fun b!633810 () Bool)

(declare-fun e!362418 () Bool)

(declare-fun e!362415 () Bool)

(assert (=> b!633810 (= e!362418 e!362415)))

(declare-fun res!409931 () Bool)

(assert (=> b!633810 (=> (not res!409931) (not e!362415))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6756 0))(
  ( (MissingZero!6756 (index!29323 (_ BitVec 32))) (Found!6756 (index!29324 (_ BitVec 32))) (Intermediate!6756 (undefined!7568 Bool) (index!29325 (_ BitVec 32)) (x!58065 (_ BitVec 32))) (Undefined!6756) (MissingVacant!6756 (index!29326 (_ BitVec 32))) )
))
(declare-fun lt!292976 () SeekEntryResult!6756)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38172 0))(
  ( (array!38173 (arr!18316 (Array (_ BitVec 32) (_ BitVec 64))) (size!18680 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38172)

(assert (=> b!633810 (= res!409931 (and (= lt!292976 (Found!6756 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18316 a!2986) index!984) (select (arr!18316 a!2986) j!136))) (not (= (select (arr!18316 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38172 (_ BitVec 32)) SeekEntryResult!6756)

(assert (=> b!633810 (= lt!292976 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18316 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633811 () Bool)

(declare-fun res!409925 () Bool)

(declare-fun e!362416 () Bool)

(assert (=> b!633811 (=> (not res!409925) (not e!362416))))

(declare-datatypes ((List!12357 0))(
  ( (Nil!12354) (Cons!12353 (h!13398 (_ BitVec 64)) (t!18585 List!12357)) )
))
(declare-fun arrayNoDuplicates!0 (array!38172 (_ BitVec 32) List!12357) Bool)

(assert (=> b!633811 (= res!409925 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12354))))

(declare-fun b!633812 () Bool)

(declare-fun e!362409 () Bool)

(declare-fun e!362414 () Bool)

(assert (=> b!633812 (= e!362409 e!362414)))

(declare-fun res!409933 () Bool)

(assert (=> b!633812 (=> res!409933 e!362414)))

(declare-fun lt!292975 () (_ BitVec 64))

(declare-fun lt!292974 () (_ BitVec 64))

(assert (=> b!633812 (= res!409933 (or (not (= (select (arr!18316 a!2986) j!136) lt!292975)) (not (= (select (arr!18316 a!2986) j!136) lt!292974)) (bvsge j!136 index!984)))))

(declare-fun b!633813 () Bool)

(declare-fun e!362412 () Bool)

(assert (=> b!633813 (= e!362415 (not e!362412))))

(declare-fun res!409923 () Bool)

(assert (=> b!633813 (=> res!409923 e!362412)))

(declare-fun lt!292973 () SeekEntryResult!6756)

(assert (=> b!633813 (= res!409923 (not (= lt!292973 (Found!6756 index!984))))))

(declare-datatypes ((Unit!21358 0))(
  ( (Unit!21359) )
))
(declare-fun lt!292981 () Unit!21358)

(declare-fun e!362408 () Unit!21358)

(assert (=> b!633813 (= lt!292981 e!362408)))

(declare-fun c!72311 () Bool)

(assert (=> b!633813 (= c!72311 (= lt!292973 Undefined!6756))))

(declare-fun lt!292979 () array!38172)

(assert (=> b!633813 (= lt!292973 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292975 lt!292979 mask!3053))))

(declare-fun e!362410 () Bool)

(assert (=> b!633813 e!362410))

(declare-fun res!409927 () Bool)

(assert (=> b!633813 (=> (not res!409927) (not e!362410))))

(declare-fun lt!292977 () (_ BitVec 32))

(declare-fun lt!292978 () SeekEntryResult!6756)

(assert (=> b!633813 (= res!409927 (= lt!292978 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292977 vacantSpotIndex!68 lt!292975 lt!292979 mask!3053)))))

(assert (=> b!633813 (= lt!292978 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292977 vacantSpotIndex!68 (select (arr!18316 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!633813 (= lt!292975 (select (store (arr!18316 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292972 () Unit!21358)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38172 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21358)

(assert (=> b!633813 (= lt!292972 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292977 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633813 (= lt!292977 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!633814 () Bool)

(declare-fun e!362411 () Bool)

(assert (=> b!633814 (= e!362411 e!362416)))

(declare-fun res!409932 () Bool)

(assert (=> b!633814 (=> (not res!409932) (not e!362416))))

(declare-fun lt!292980 () SeekEntryResult!6756)

(assert (=> b!633814 (= res!409932 (or (= lt!292980 (MissingZero!6756 i!1108)) (= lt!292980 (MissingVacant!6756 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38172 (_ BitVec 32)) SeekEntryResult!6756)

(assert (=> b!633814 (= lt!292980 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!409928 () Bool)

(assert (=> start!57262 (=> (not res!409928) (not e!362411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57262 (= res!409928 (validMask!0 mask!3053))))

(assert (=> start!57262 e!362411))

(assert (=> start!57262 true))

(declare-fun array_inv!14112 (array!38172) Bool)

(assert (=> start!57262 (array_inv!14112 a!2986)))

(declare-fun b!633815 () Bool)

(declare-fun Unit!21360 () Unit!21358)

(assert (=> b!633815 (= e!362408 Unit!21360)))

(assert (=> b!633815 false))

(declare-fun b!633816 () Bool)

(declare-fun e!362413 () Bool)

(declare-fun arrayContainsKey!0 (array!38172 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633816 (= e!362413 (arrayContainsKey!0 lt!292979 (select (arr!18316 a!2986) j!136) index!984))))

(declare-fun b!633817 () Bool)

(declare-fun res!409930 () Bool)

(assert (=> b!633817 (=> (not res!409930) (not e!362411))))

(assert (=> b!633817 (= res!409930 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633818 () Bool)

(assert (=> b!633818 (= e!362416 e!362418)))

(declare-fun res!409937 () Bool)

(assert (=> b!633818 (=> (not res!409937) (not e!362418))))

(assert (=> b!633818 (= res!409937 (= (select (store (arr!18316 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633818 (= lt!292979 (array!38173 (store (arr!18316 a!2986) i!1108 k0!1786) (size!18680 a!2986)))))

(declare-fun b!633819 () Bool)

(declare-fun res!409936 () Bool)

(assert (=> b!633819 (=> (not res!409936) (not e!362411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633819 (= res!409936 (validKeyInArray!0 k0!1786))))

(declare-fun b!633820 () Bool)

(assert (=> b!633820 (= e!362410 (= lt!292976 lt!292978))))

(declare-fun b!633821 () Bool)

(assert (=> b!633821 (= e!362412 (or (not (= (select (arr!18316 a!2986) j!136) lt!292975)) (not (= (select (arr!18316 a!2986) j!136) lt!292974)) (bvsge j!136 index!984) (bvsge index!984 (size!18680 a!2986)) (bvsge (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000)))))

(assert (=> b!633821 e!362409))

(declare-fun res!409935 () Bool)

(assert (=> b!633821 (=> (not res!409935) (not e!362409))))

(assert (=> b!633821 (= res!409935 (= lt!292974 (select (arr!18316 a!2986) j!136)))))

(assert (=> b!633821 (= lt!292974 (select (store (arr!18316 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!633822 () Bool)

(assert (=> b!633822 (= e!362414 e!362413)))

(declare-fun res!409926 () Bool)

(assert (=> b!633822 (=> (not res!409926) (not e!362413))))

(assert (=> b!633822 (= res!409926 (arrayContainsKey!0 lt!292979 (select (arr!18316 a!2986) j!136) j!136))))

(declare-fun b!633823 () Bool)

(declare-fun Unit!21361 () Unit!21358)

(assert (=> b!633823 (= e!362408 Unit!21361)))

(declare-fun b!633824 () Bool)

(declare-fun res!409929 () Bool)

(assert (=> b!633824 (=> (not res!409929) (not e!362411))))

(assert (=> b!633824 (= res!409929 (and (= (size!18680 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18680 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18680 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633825 () Bool)

(declare-fun res!409934 () Bool)

(assert (=> b!633825 (=> (not res!409934) (not e!362416))))

(assert (=> b!633825 (= res!409934 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18316 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633826 () Bool)

(declare-fun res!409924 () Bool)

(assert (=> b!633826 (=> (not res!409924) (not e!362416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38172 (_ BitVec 32)) Bool)

(assert (=> b!633826 (= res!409924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633827 () Bool)

(declare-fun res!409922 () Bool)

(assert (=> b!633827 (=> (not res!409922) (not e!362411))))

(assert (=> b!633827 (= res!409922 (validKeyInArray!0 (select (arr!18316 a!2986) j!136)))))

(assert (= (and start!57262 res!409928) b!633824))

(assert (= (and b!633824 res!409929) b!633827))

(assert (= (and b!633827 res!409922) b!633819))

(assert (= (and b!633819 res!409936) b!633817))

(assert (= (and b!633817 res!409930) b!633814))

(assert (= (and b!633814 res!409932) b!633826))

(assert (= (and b!633826 res!409924) b!633811))

(assert (= (and b!633811 res!409925) b!633825))

(assert (= (and b!633825 res!409934) b!633818))

(assert (= (and b!633818 res!409937) b!633810))

(assert (= (and b!633810 res!409931) b!633813))

(assert (= (and b!633813 res!409927) b!633820))

(assert (= (and b!633813 c!72311) b!633815))

(assert (= (and b!633813 (not c!72311)) b!633823))

(assert (= (and b!633813 (not res!409923)) b!633821))

(assert (= (and b!633821 res!409935) b!633812))

(assert (= (and b!633812 (not res!409933)) b!633822))

(assert (= (and b!633822 res!409926) b!633816))

(declare-fun m!608409 () Bool)

(assert (=> b!633811 m!608409))

(declare-fun m!608411 () Bool)

(assert (=> b!633812 m!608411))

(assert (=> b!633816 m!608411))

(assert (=> b!633816 m!608411))

(declare-fun m!608413 () Bool)

(assert (=> b!633816 m!608413))

(declare-fun m!608415 () Bool)

(assert (=> b!633825 m!608415))

(declare-fun m!608417 () Bool)

(assert (=> b!633813 m!608417))

(declare-fun m!608419 () Bool)

(assert (=> b!633813 m!608419))

(declare-fun m!608421 () Bool)

(assert (=> b!633813 m!608421))

(declare-fun m!608423 () Bool)

(assert (=> b!633813 m!608423))

(declare-fun m!608425 () Bool)

(assert (=> b!633813 m!608425))

(assert (=> b!633813 m!608411))

(declare-fun m!608427 () Bool)

(assert (=> b!633813 m!608427))

(assert (=> b!633813 m!608411))

(declare-fun m!608429 () Bool)

(assert (=> b!633813 m!608429))

(declare-fun m!608431 () Bool)

(assert (=> b!633817 m!608431))

(assert (=> b!633827 m!608411))

(assert (=> b!633827 m!608411))

(declare-fun m!608433 () Bool)

(assert (=> b!633827 m!608433))

(assert (=> b!633818 m!608419))

(declare-fun m!608435 () Bool)

(assert (=> b!633818 m!608435))

(assert (=> b!633822 m!608411))

(assert (=> b!633822 m!608411))

(declare-fun m!608437 () Bool)

(assert (=> b!633822 m!608437))

(declare-fun m!608439 () Bool)

(assert (=> b!633826 m!608439))

(assert (=> b!633821 m!608411))

(assert (=> b!633821 m!608419))

(declare-fun m!608441 () Bool)

(assert (=> b!633821 m!608441))

(declare-fun m!608443 () Bool)

(assert (=> b!633810 m!608443))

(assert (=> b!633810 m!608411))

(assert (=> b!633810 m!608411))

(declare-fun m!608445 () Bool)

(assert (=> b!633810 m!608445))

(declare-fun m!608447 () Bool)

(assert (=> start!57262 m!608447))

(declare-fun m!608449 () Bool)

(assert (=> start!57262 m!608449))

(declare-fun m!608451 () Bool)

(assert (=> b!633814 m!608451))

(declare-fun m!608453 () Bool)

(assert (=> b!633819 m!608453))

(check-sat (not b!633817) (not b!633826) (not b!633813) (not start!57262) (not b!633822) (not b!633810) (not b!633819) (not b!633814) (not b!633816) (not b!633811) (not b!633827))
(check-sat)
