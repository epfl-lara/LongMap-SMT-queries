; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57806 () Bool)

(assert start!57806)

(declare-fun b!639294 () Bool)

(declare-fun res!413985 () Bool)

(declare-fun e!365875 () Bool)

(assert (=> b!639294 (=> (not res!413985) (not e!365875))))

(declare-datatypes ((array!38319 0))(
  ( (array!38320 (arr!18380 (Array (_ BitVec 32) (_ BitVec 64))) (size!18745 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38319)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639294 (= res!413985 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639295 () Bool)

(declare-fun res!413982 () Bool)

(declare-fun e!365865 () Bool)

(assert (=> b!639295 (=> (not res!413982) (not e!365865))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38319 (_ BitVec 32)) Bool)

(assert (=> b!639295 (= res!413982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639296 () Bool)

(declare-fun e!365866 () Bool)

(declare-fun e!365873 () Bool)

(assert (=> b!639296 (= e!365866 e!365873)))

(declare-fun res!413997 () Bool)

(assert (=> b!639296 (=> (not res!413997) (not e!365873))))

(declare-fun lt!295658 () array!38319)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!639296 (= res!413997 (arrayContainsKey!0 lt!295658 (select (arr!18380 a!2986) j!136) j!136))))

(declare-fun b!639297 () Bool)

(declare-fun res!413998 () Bool)

(assert (=> b!639297 (=> (not res!413998) (not e!365865))))

(declare-datatypes ((List!12460 0))(
  ( (Nil!12457) (Cons!12456 (h!13501 (_ BitVec 64)) (t!18679 List!12460)) )
))
(declare-fun arrayNoDuplicates!0 (array!38319 (_ BitVec 32) List!12460) Bool)

(assert (=> b!639297 (= res!413998 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12457))))

(declare-fun b!639298 () Bool)

(declare-fun e!365869 () Bool)

(declare-fun e!365872 () Bool)

(assert (=> b!639298 (= e!365869 e!365872)))

(declare-fun res!413993 () Bool)

(assert (=> b!639298 (=> (not res!413993) (not e!365872))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6817 0))(
  ( (MissingZero!6817 (index!29585 (_ BitVec 32))) (Found!6817 (index!29586 (_ BitVec 32))) (Intermediate!6817 (undefined!7629 Bool) (index!29587 (_ BitVec 32)) (x!58351 (_ BitVec 32))) (Undefined!6817) (MissingVacant!6817 (index!29588 (_ BitVec 32))) )
))
(declare-fun lt!295652 () SeekEntryResult!6817)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!639298 (= res!413993 (and (= lt!295652 (Found!6817 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18380 a!2986) index!984) (select (arr!18380 a!2986) j!136))) (not (= (select (arr!18380 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38319 (_ BitVec 32)) SeekEntryResult!6817)

(assert (=> b!639298 (= lt!295652 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18380 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639299 () Bool)

(declare-fun e!365876 () Bool)

(assert (=> b!639299 (= e!365876 true)))

(assert (=> b!639299 (arrayNoDuplicates!0 lt!295658 #b00000000000000000000000000000000 Nil!12457)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((Unit!21596 0))(
  ( (Unit!21597) )
))
(declare-fun lt!295651 () Unit!21596)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38319 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12460) Unit!21596)

(assert (=> b!639299 (= lt!295651 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12457))))

(assert (=> b!639299 (arrayContainsKey!0 lt!295658 (select (arr!18380 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295655 () Unit!21596)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38319 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21596)

(assert (=> b!639299 (= lt!295655 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295658 (select (arr!18380 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun res!413996 () Bool)

(assert (=> start!57806 (=> (not res!413996) (not e!365875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57806 (= res!413996 (validMask!0 mask!3053))))

(assert (=> start!57806 e!365875))

(assert (=> start!57806 true))

(declare-fun array_inv!14263 (array!38319) Bool)

(assert (=> start!57806 (array_inv!14263 a!2986)))

(declare-fun b!639300 () Bool)

(declare-fun e!365874 () Bool)

(assert (=> b!639300 (= e!365872 (not e!365874))))

(declare-fun res!413986 () Bool)

(assert (=> b!639300 (=> res!413986 e!365874)))

(declare-fun lt!295653 () SeekEntryResult!6817)

(assert (=> b!639300 (= res!413986 (not (= lt!295653 (Found!6817 index!984))))))

(declare-fun lt!295661 () Unit!21596)

(declare-fun e!365871 () Unit!21596)

(assert (=> b!639300 (= lt!295661 e!365871)))

(declare-fun c!73023 () Bool)

(assert (=> b!639300 (= c!73023 (= lt!295653 Undefined!6817))))

(declare-fun lt!295656 () (_ BitVec 64))

(assert (=> b!639300 (= lt!295653 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295656 lt!295658 mask!3053))))

(declare-fun e!365868 () Bool)

(assert (=> b!639300 e!365868))

(declare-fun res!413984 () Bool)

(assert (=> b!639300 (=> (not res!413984) (not e!365868))))

(declare-fun lt!295654 () (_ BitVec 32))

(declare-fun lt!295657 () SeekEntryResult!6817)

(assert (=> b!639300 (= res!413984 (= lt!295657 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295654 vacantSpotIndex!68 lt!295656 lt!295658 mask!3053)))))

(assert (=> b!639300 (= lt!295657 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295654 vacantSpotIndex!68 (select (arr!18380 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639300 (= lt!295656 (select (store (arr!18380 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295660 () Unit!21596)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38319 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21596)

(assert (=> b!639300 (= lt!295660 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295654 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639300 (= lt!295654 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639301 () Bool)

(assert (=> b!639301 (= e!365865 e!365869)))

(declare-fun res!413990 () Bool)

(assert (=> b!639301 (=> (not res!413990) (not e!365869))))

(assert (=> b!639301 (= res!413990 (= (select (store (arr!18380 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639301 (= lt!295658 (array!38320 (store (arr!18380 a!2986) i!1108 k0!1786) (size!18745 a!2986)))))

(declare-fun b!639302 () Bool)

(declare-fun Unit!21598 () Unit!21596)

(assert (=> b!639302 (= e!365871 Unit!21598)))

(declare-fun b!639303 () Bool)

(declare-fun Unit!21599 () Unit!21596)

(assert (=> b!639303 (= e!365871 Unit!21599)))

(assert (=> b!639303 false))

(declare-fun b!639304 () Bool)

(declare-fun res!413989 () Bool)

(assert (=> b!639304 (=> (not res!413989) (not e!365865))))

(assert (=> b!639304 (= res!413989 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18380 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639305 () Bool)

(assert (=> b!639305 (= e!365875 e!365865)))

(declare-fun res!413987 () Bool)

(assert (=> b!639305 (=> (not res!413987) (not e!365865))))

(declare-fun lt!295662 () SeekEntryResult!6817)

(assert (=> b!639305 (= res!413987 (or (= lt!295662 (MissingZero!6817 i!1108)) (= lt!295662 (MissingVacant!6817 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38319 (_ BitVec 32)) SeekEntryResult!6817)

(assert (=> b!639305 (= lt!295662 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!639306 () Bool)

(assert (=> b!639306 (= e!365873 (arrayContainsKey!0 lt!295658 (select (arr!18380 a!2986) j!136) index!984))))

(declare-fun b!639307 () Bool)

(assert (=> b!639307 (= e!365874 e!365876)))

(declare-fun res!413991 () Bool)

(assert (=> b!639307 (=> res!413991 e!365876)))

(declare-fun lt!295659 () (_ BitVec 64))

(assert (=> b!639307 (= res!413991 (or (not (= (select (arr!18380 a!2986) j!136) lt!295656)) (not (= (select (arr!18380 a!2986) j!136) lt!295659)) (bvsge j!136 index!984)))))

(declare-fun e!365867 () Bool)

(assert (=> b!639307 e!365867))

(declare-fun res!413995 () Bool)

(assert (=> b!639307 (=> (not res!413995) (not e!365867))))

(assert (=> b!639307 (= res!413995 (= lt!295659 (select (arr!18380 a!2986) j!136)))))

(assert (=> b!639307 (= lt!295659 (select (store (arr!18380 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!639308 () Bool)

(assert (=> b!639308 (= e!365868 (= lt!295652 lt!295657))))

(declare-fun b!639309 () Bool)

(declare-fun res!413992 () Bool)

(assert (=> b!639309 (=> (not res!413992) (not e!365875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639309 (= res!413992 (validKeyInArray!0 k0!1786))))

(declare-fun b!639310 () Bool)

(declare-fun res!413983 () Bool)

(assert (=> b!639310 (=> (not res!413983) (not e!365875))))

(assert (=> b!639310 (= res!413983 (and (= (size!18745 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18745 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18745 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639311 () Bool)

(assert (=> b!639311 (= e!365867 e!365866)))

(declare-fun res!413988 () Bool)

(assert (=> b!639311 (=> res!413988 e!365866)))

(assert (=> b!639311 (= res!413988 (or (not (= (select (arr!18380 a!2986) j!136) lt!295656)) (not (= (select (arr!18380 a!2986) j!136) lt!295659)) (bvsge j!136 index!984)))))

(declare-fun b!639312 () Bool)

(declare-fun res!413994 () Bool)

(assert (=> b!639312 (=> (not res!413994) (not e!365875))))

(assert (=> b!639312 (= res!413994 (validKeyInArray!0 (select (arr!18380 a!2986) j!136)))))

(assert (= (and start!57806 res!413996) b!639310))

(assert (= (and b!639310 res!413983) b!639312))

(assert (= (and b!639312 res!413994) b!639309))

(assert (= (and b!639309 res!413992) b!639294))

(assert (= (and b!639294 res!413985) b!639305))

(assert (= (and b!639305 res!413987) b!639295))

(assert (= (and b!639295 res!413982) b!639297))

(assert (= (and b!639297 res!413998) b!639304))

(assert (= (and b!639304 res!413989) b!639301))

(assert (= (and b!639301 res!413990) b!639298))

(assert (= (and b!639298 res!413993) b!639300))

(assert (= (and b!639300 res!413984) b!639308))

(assert (= (and b!639300 c!73023) b!639303))

(assert (= (and b!639300 (not c!73023)) b!639302))

(assert (= (and b!639300 (not res!413986)) b!639307))

(assert (= (and b!639307 res!413995) b!639311))

(assert (= (and b!639311 (not res!413988)) b!639296))

(assert (= (and b!639296 res!413997) b!639306))

(assert (= (and b!639307 (not res!413991)) b!639299))

(declare-fun m!612663 () Bool)

(assert (=> start!57806 m!612663))

(declare-fun m!612665 () Bool)

(assert (=> start!57806 m!612665))

(declare-fun m!612667 () Bool)

(assert (=> b!639304 m!612667))

(declare-fun m!612669 () Bool)

(assert (=> b!639306 m!612669))

(assert (=> b!639306 m!612669))

(declare-fun m!612671 () Bool)

(assert (=> b!639306 m!612671))

(declare-fun m!612673 () Bool)

(assert (=> b!639297 m!612673))

(assert (=> b!639311 m!612669))

(declare-fun m!612675 () Bool)

(assert (=> b!639300 m!612675))

(declare-fun m!612677 () Bool)

(assert (=> b!639300 m!612677))

(assert (=> b!639300 m!612669))

(declare-fun m!612679 () Bool)

(assert (=> b!639300 m!612679))

(declare-fun m!612681 () Bool)

(assert (=> b!639300 m!612681))

(declare-fun m!612683 () Bool)

(assert (=> b!639300 m!612683))

(declare-fun m!612685 () Bool)

(assert (=> b!639300 m!612685))

(assert (=> b!639300 m!612669))

(declare-fun m!612687 () Bool)

(assert (=> b!639300 m!612687))

(declare-fun m!612689 () Bool)

(assert (=> b!639305 m!612689))

(assert (=> b!639301 m!612681))

(declare-fun m!612691 () Bool)

(assert (=> b!639301 m!612691))

(assert (=> b!639299 m!612669))

(assert (=> b!639299 m!612669))

(declare-fun m!612693 () Bool)

(assert (=> b!639299 m!612693))

(declare-fun m!612695 () Bool)

(assert (=> b!639299 m!612695))

(assert (=> b!639299 m!612669))

(declare-fun m!612697 () Bool)

(assert (=> b!639299 m!612697))

(declare-fun m!612699 () Bool)

(assert (=> b!639299 m!612699))

(declare-fun m!612701 () Bool)

(assert (=> b!639294 m!612701))

(assert (=> b!639312 m!612669))

(assert (=> b!639312 m!612669))

(declare-fun m!612703 () Bool)

(assert (=> b!639312 m!612703))

(assert (=> b!639296 m!612669))

(assert (=> b!639296 m!612669))

(declare-fun m!612705 () Bool)

(assert (=> b!639296 m!612705))

(declare-fun m!612707 () Bool)

(assert (=> b!639298 m!612707))

(assert (=> b!639298 m!612669))

(assert (=> b!639298 m!612669))

(declare-fun m!612709 () Bool)

(assert (=> b!639298 m!612709))

(declare-fun m!612711 () Bool)

(assert (=> b!639295 m!612711))

(declare-fun m!612713 () Bool)

(assert (=> b!639309 m!612713))

(assert (=> b!639307 m!612669))

(assert (=> b!639307 m!612681))

(declare-fun m!612715 () Bool)

(assert (=> b!639307 m!612715))

(check-sat (not b!639294) (not b!639297) (not b!639295) (not b!639299) (not start!57806) (not b!639309) (not b!639296) (not b!639298) (not b!639300) (not b!639305) (not b!639312) (not b!639306))
(check-sat)
