; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58188 () Bool)

(assert start!58188)

(declare-fun b!642655 () Bool)

(declare-fun res!416263 () Bool)

(declare-fun e!368049 () Bool)

(assert (=> b!642655 (=> (not res!416263) (not e!368049))))

(declare-datatypes ((array!38385 0))(
  ( (array!38386 (arr!18406 (Array (_ BitVec 32) (_ BitVec 64))) (size!18770 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38385)

(declare-datatypes ((List!12354 0))(
  ( (Nil!12351) (Cons!12350 (h!13398 (_ BitVec 64)) (t!18574 List!12354)) )
))
(declare-fun arrayNoDuplicates!0 (array!38385 (_ BitVec 32) List!12354) Bool)

(assert (=> b!642655 (= res!416263 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12351))))

(declare-fun b!642656 () Bool)

(declare-fun res!416277 () Bool)

(declare-fun e!368050 () Bool)

(assert (=> b!642656 (=> (not res!416277) (not e!368050))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!642656 (= res!416277 (and (= (size!18770 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18770 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18770 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642658 () Bool)

(declare-fun res!416278 () Bool)

(assert (=> b!642658 (=> (not res!416278) (not e!368050))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642658 (= res!416278 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!642659 () Bool)

(declare-fun e!368057 () Bool)

(declare-fun e!368056 () Bool)

(assert (=> b!642659 (= e!368057 e!368056)))

(declare-fun res!416267 () Bool)

(assert (=> b!642659 (=> res!416267 e!368056)))

(declare-fun lt!297616 () (_ BitVec 64))

(declare-fun lt!297620 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!642659 (= res!416267 (or (not (= (select (arr!18406 a!2986) j!136) lt!297620)) (not (= (select (arr!18406 a!2986) j!136) lt!297616)) (bvsge j!136 index!984)))))

(declare-fun e!368048 () Bool)

(assert (=> b!642659 e!368048))

(declare-fun res!416276 () Bool)

(assert (=> b!642659 (=> (not res!416276) (not e!368048))))

(assert (=> b!642659 (= res!416276 (= lt!297616 (select (arr!18406 a!2986) j!136)))))

(assert (=> b!642659 (= lt!297616 (select (store (arr!18406 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!642660 () Bool)

(declare-fun res!416262 () Bool)

(assert (=> b!642660 (=> (not res!416262) (not e!368049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38385 (_ BitVec 32)) Bool)

(assert (=> b!642660 (= res!416262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!642661 () Bool)

(declare-fun res!416271 () Bool)

(assert (=> b!642661 (=> (not res!416271) (not e!368050))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642661 (= res!416271 (validKeyInArray!0 k0!1786))))

(declare-fun b!642662 () Bool)

(declare-fun e!368047 () Bool)

(declare-datatypes ((SeekEntryResult!6802 0))(
  ( (MissingZero!6802 (index!29534 (_ BitVec 32))) (Found!6802 (index!29535 (_ BitVec 32))) (Intermediate!6802 (undefined!7614 Bool) (index!29536 (_ BitVec 32)) (x!58451 (_ BitVec 32))) (Undefined!6802) (MissingVacant!6802 (index!29537 (_ BitVec 32))) )
))
(declare-fun lt!297613 () SeekEntryResult!6802)

(declare-fun lt!297622 () SeekEntryResult!6802)

(assert (=> b!642662 (= e!368047 (= lt!297613 lt!297622))))

(declare-fun b!642663 () Bool)

(declare-fun res!416270 () Bool)

(assert (=> b!642663 (=> (not res!416270) (not e!368049))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!642663 (= res!416270 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18406 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642664 () Bool)

(declare-fun res!416273 () Bool)

(assert (=> b!642664 (=> (not res!416273) (not e!368050))))

(assert (=> b!642664 (= res!416273 (validKeyInArray!0 (select (arr!18406 a!2986) j!136)))))

(declare-fun b!642665 () Bool)

(declare-fun e!368054 () Bool)

(assert (=> b!642665 (= e!368054 (not e!368057))))

(declare-fun res!416269 () Bool)

(assert (=> b!642665 (=> res!416269 e!368057)))

(declare-fun lt!297609 () SeekEntryResult!6802)

(assert (=> b!642665 (= res!416269 (not (= lt!297609 (Found!6802 index!984))))))

(declare-datatypes ((Unit!21717 0))(
  ( (Unit!21718) )
))
(declare-fun lt!297617 () Unit!21717)

(declare-fun e!368052 () Unit!21717)

(assert (=> b!642665 (= lt!297617 e!368052)))

(declare-fun c!73565 () Bool)

(assert (=> b!642665 (= c!73565 (= lt!297609 Undefined!6802))))

(declare-fun lt!297618 () array!38385)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38385 (_ BitVec 32)) SeekEntryResult!6802)

(assert (=> b!642665 (= lt!297609 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297620 lt!297618 mask!3053))))

(assert (=> b!642665 e!368047))

(declare-fun res!416264 () Bool)

(assert (=> b!642665 (=> (not res!416264) (not e!368047))))

(declare-fun lt!297615 () (_ BitVec 32))

(assert (=> b!642665 (= res!416264 (= lt!297622 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297615 vacantSpotIndex!68 lt!297620 lt!297618 mask!3053)))))

(assert (=> b!642665 (= lt!297622 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297615 vacantSpotIndex!68 (select (arr!18406 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!642665 (= lt!297620 (select (store (arr!18406 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!297621 () Unit!21717)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21717)

(assert (=> b!642665 (= lt!297621 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297615 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642665 (= lt!297615 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!642666 () Bool)

(declare-fun e!368055 () Bool)

(assert (=> b!642666 (= e!368049 e!368055)))

(declare-fun res!416275 () Bool)

(assert (=> b!642666 (=> (not res!416275) (not e!368055))))

(assert (=> b!642666 (= res!416275 (= (select (store (arr!18406 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642666 (= lt!297618 (array!38386 (store (arr!18406 a!2986) i!1108 k0!1786) (size!18770 a!2986)))))

(declare-fun b!642667 () Bool)

(declare-fun e!368058 () Bool)

(declare-fun e!368051 () Bool)

(assert (=> b!642667 (= e!368058 e!368051)))

(declare-fun res!416274 () Bool)

(assert (=> b!642667 (=> (not res!416274) (not e!368051))))

(assert (=> b!642667 (= res!416274 (arrayContainsKey!0 lt!297618 (select (arr!18406 a!2986) j!136) j!136))))

(declare-fun res!416265 () Bool)

(assert (=> start!58188 (=> (not res!416265) (not e!368050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58188 (= res!416265 (validMask!0 mask!3053))))

(assert (=> start!58188 e!368050))

(assert (=> start!58188 true))

(declare-fun array_inv!14265 (array!38385) Bool)

(assert (=> start!58188 (array_inv!14265 a!2986)))

(declare-fun b!642657 () Bool)

(assert (=> b!642657 (= e!368048 e!368058)))

(declare-fun res!416266 () Bool)

(assert (=> b!642657 (=> res!416266 e!368058)))

(assert (=> b!642657 (= res!416266 (or (not (= (select (arr!18406 a!2986) j!136) lt!297620)) (not (= (select (arr!18406 a!2986) j!136) lt!297616)) (bvsge j!136 index!984)))))

(declare-fun b!642668 () Bool)

(declare-fun Unit!21719 () Unit!21717)

(assert (=> b!642668 (= e!368052 Unit!21719)))

(assert (=> b!642668 false))

(declare-fun b!642669 () Bool)

(declare-fun Unit!21720 () Unit!21717)

(assert (=> b!642669 (= e!368052 Unit!21720)))

(declare-fun b!642670 () Bool)

(assert (=> b!642670 (= e!368055 e!368054)))

(declare-fun res!416268 () Bool)

(assert (=> b!642670 (=> (not res!416268) (not e!368054))))

(assert (=> b!642670 (= res!416268 (and (= lt!297613 (Found!6802 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18406 a!2986) index!984) (select (arr!18406 a!2986) j!136))) (not (= (select (arr!18406 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!642670 (= lt!297613 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18406 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642671 () Bool)

(assert (=> b!642671 (= e!368051 (arrayContainsKey!0 lt!297618 (select (arr!18406 a!2986) j!136) index!984))))

(declare-fun b!642672 () Bool)

(assert (=> b!642672 (= e!368050 e!368049)))

(declare-fun res!416272 () Bool)

(assert (=> b!642672 (=> (not res!416272) (not e!368049))))

(declare-fun lt!297614 () SeekEntryResult!6802)

(assert (=> b!642672 (= res!416272 (or (= lt!297614 (MissingZero!6802 i!1108)) (= lt!297614 (MissingVacant!6802 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38385 (_ BitVec 32)) SeekEntryResult!6802)

(assert (=> b!642672 (= lt!297614 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!642673 () Bool)

(assert (=> b!642673 (= e!368056 false)))

(assert (=> b!642673 (not (= lt!297620 (select (arr!18406 a!2986) j!136)))))

(declare-fun lt!297610 () Unit!21717)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38385 (_ BitVec 64) (_ BitVec 32) List!12354) Unit!21717)

(assert (=> b!642673 (= lt!297610 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297618 (select (arr!18406 a!2986) j!136) j!136 Nil!12351))))

(assert (=> b!642673 (arrayNoDuplicates!0 lt!297618 j!136 Nil!12351)))

(declare-fun lt!297619 () Unit!21717)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38385 (_ BitVec 32) (_ BitVec 32)) Unit!21717)

(assert (=> b!642673 (= lt!297619 (lemmaNoDuplicateFromThenFromBigger!0 lt!297618 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642673 (arrayNoDuplicates!0 lt!297618 #b00000000000000000000000000000000 Nil!12351)))

(declare-fun lt!297611 () Unit!21717)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38385 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12354) Unit!21717)

(assert (=> b!642673 (= lt!297611 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12351))))

(assert (=> b!642673 (arrayContainsKey!0 lt!297618 (select (arr!18406 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297612 () Unit!21717)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38385 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21717)

(assert (=> b!642673 (= lt!297612 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297618 (select (arr!18406 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!58188 res!416265) b!642656))

(assert (= (and b!642656 res!416277) b!642664))

(assert (= (and b!642664 res!416273) b!642661))

(assert (= (and b!642661 res!416271) b!642658))

(assert (= (and b!642658 res!416278) b!642672))

(assert (= (and b!642672 res!416272) b!642660))

(assert (= (and b!642660 res!416262) b!642655))

(assert (= (and b!642655 res!416263) b!642663))

(assert (= (and b!642663 res!416270) b!642666))

(assert (= (and b!642666 res!416275) b!642670))

(assert (= (and b!642670 res!416268) b!642665))

(assert (= (and b!642665 res!416264) b!642662))

(assert (= (and b!642665 c!73565) b!642668))

(assert (= (and b!642665 (not c!73565)) b!642669))

(assert (= (and b!642665 (not res!416269)) b!642659))

(assert (= (and b!642659 res!416276) b!642657))

(assert (= (and b!642657 (not res!416266)) b!642667))

(assert (= (and b!642667 res!416274) b!642671))

(assert (= (and b!642659 (not res!416267)) b!642673))

(declare-fun m!616819 () Bool)

(assert (=> b!642657 m!616819))

(declare-fun m!616821 () Bool)

(assert (=> b!642663 m!616821))

(declare-fun m!616823 () Bool)

(assert (=> b!642660 m!616823))

(declare-fun m!616825 () Bool)

(assert (=> b!642665 m!616825))

(declare-fun m!616827 () Bool)

(assert (=> b!642665 m!616827))

(assert (=> b!642665 m!616819))

(declare-fun m!616829 () Bool)

(assert (=> b!642665 m!616829))

(declare-fun m!616831 () Bool)

(assert (=> b!642665 m!616831))

(assert (=> b!642665 m!616819))

(declare-fun m!616833 () Bool)

(assert (=> b!642665 m!616833))

(declare-fun m!616835 () Bool)

(assert (=> b!642665 m!616835))

(declare-fun m!616837 () Bool)

(assert (=> b!642665 m!616837))

(declare-fun m!616839 () Bool)

(assert (=> start!58188 m!616839))

(declare-fun m!616841 () Bool)

(assert (=> start!58188 m!616841))

(assert (=> b!642666 m!616831))

(declare-fun m!616843 () Bool)

(assert (=> b!642666 m!616843))

(declare-fun m!616845 () Bool)

(assert (=> b!642661 m!616845))

(assert (=> b!642659 m!616819))

(assert (=> b!642659 m!616831))

(declare-fun m!616847 () Bool)

(assert (=> b!642659 m!616847))

(declare-fun m!616849 () Bool)

(assert (=> b!642670 m!616849))

(assert (=> b!642670 m!616819))

(assert (=> b!642670 m!616819))

(declare-fun m!616851 () Bool)

(assert (=> b!642670 m!616851))

(declare-fun m!616853 () Bool)

(assert (=> b!642655 m!616853))

(declare-fun m!616855 () Bool)

(assert (=> b!642658 m!616855))

(assert (=> b!642667 m!616819))

(assert (=> b!642667 m!616819))

(declare-fun m!616857 () Bool)

(assert (=> b!642667 m!616857))

(declare-fun m!616859 () Bool)

(assert (=> b!642672 m!616859))

(assert (=> b!642671 m!616819))

(assert (=> b!642671 m!616819))

(declare-fun m!616861 () Bool)

(assert (=> b!642671 m!616861))

(declare-fun m!616863 () Bool)

(assert (=> b!642673 m!616863))

(assert (=> b!642673 m!616819))

(declare-fun m!616865 () Bool)

(assert (=> b!642673 m!616865))

(assert (=> b!642673 m!616819))

(declare-fun m!616867 () Bool)

(assert (=> b!642673 m!616867))

(assert (=> b!642673 m!616819))

(declare-fun m!616869 () Bool)

(assert (=> b!642673 m!616869))

(declare-fun m!616871 () Bool)

(assert (=> b!642673 m!616871))

(declare-fun m!616873 () Bool)

(assert (=> b!642673 m!616873))

(assert (=> b!642673 m!616819))

(declare-fun m!616875 () Bool)

(assert (=> b!642673 m!616875))

(assert (=> b!642664 m!616819))

(assert (=> b!642664 m!616819))

(declare-fun m!616877 () Bool)

(assert (=> b!642664 m!616877))

(check-sat (not b!642670) (not b!642658) (not b!642665) (not b!642672) (not b!642671) (not b!642655) (not b!642661) (not start!58188) (not b!642673) (not b!642664) (not b!642667) (not b!642660))
(check-sat)
