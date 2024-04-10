; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58318 () Bool)

(assert start!58318)

(declare-fun b!643729 () Bool)

(declare-fun res!416926 () Bool)

(declare-fun e!368771 () Bool)

(assert (=> b!643729 (=> (not res!416926) (not e!368771))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!643729 (= res!416926 (validKeyInArray!0 k0!1786))))

(declare-fun b!643730 () Bool)

(declare-fun res!416938 () Bool)

(declare-fun e!368763 () Bool)

(assert (=> b!643730 (=> (not res!416938) (not e!368763))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38415 0))(
  ( (array!38416 (arr!18421 (Array (_ BitVec 32) (_ BitVec 64))) (size!18785 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38415)

(assert (=> b!643730 (= res!416938 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18421 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!643731 () Bool)

(declare-datatypes ((Unit!21792 0))(
  ( (Unit!21793) )
))
(declare-fun e!368767 () Unit!21792)

(declare-fun Unit!21794 () Unit!21792)

(assert (=> b!643731 (= e!368767 Unit!21794)))

(declare-fun b!643732 () Bool)

(declare-fun e!368772 () Bool)

(declare-fun e!368773 () Bool)

(assert (=> b!643732 (= e!368772 e!368773)))

(declare-fun res!416934 () Bool)

(assert (=> b!643732 (=> (not res!416934) (not e!368773))))

(declare-fun lt!298252 () array!38415)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!643732 (= res!416934 (arrayContainsKey!0 lt!298252 (select (arr!18421 a!2986) j!136) j!136))))

(declare-fun b!643733 () Bool)

(declare-fun res!416939 () Bool)

(assert (=> b!643733 (=> (not res!416939) (not e!368771))))

(assert (=> b!643733 (= res!416939 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!416929 () Bool)

(assert (=> start!58318 (=> (not res!416929) (not e!368771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58318 (= res!416929 (validMask!0 mask!3053))))

(assert (=> start!58318 e!368771))

(assert (=> start!58318 true))

(declare-fun array_inv!14217 (array!38415) Bool)

(assert (=> start!58318 (array_inv!14217 a!2986)))

(declare-fun b!643734 () Bool)

(declare-fun e!368765 () Unit!21792)

(declare-fun Unit!21795 () Unit!21792)

(assert (=> b!643734 (= e!368765 Unit!21795)))

(declare-fun b!643735 () Bool)

(assert (=> b!643735 (= e!368771 e!368763)))

(declare-fun res!416937 () Bool)

(assert (=> b!643735 (=> (not res!416937) (not e!368763))))

(declare-datatypes ((SeekEntryResult!6861 0))(
  ( (MissingZero!6861 (index!29776 (_ BitVec 32))) (Found!6861 (index!29777 (_ BitVec 32))) (Intermediate!6861 (undefined!7673 Bool) (index!29778 (_ BitVec 32)) (x!58549 (_ BitVec 32))) (Undefined!6861) (MissingVacant!6861 (index!29779 (_ BitVec 32))) )
))
(declare-fun lt!298247 () SeekEntryResult!6861)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!643735 (= res!416937 (or (= lt!298247 (MissingZero!6861 i!1108)) (= lt!298247 (MissingVacant!6861 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38415 (_ BitVec 32)) SeekEntryResult!6861)

(assert (=> b!643735 (= lt!298247 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!643736 () Bool)

(declare-fun e!368774 () Bool)

(assert (=> b!643736 (= e!368774 true)))

(declare-fun e!368770 () Bool)

(assert (=> b!643736 e!368770))

(declare-fun res!416936 () Bool)

(assert (=> b!643736 (=> (not res!416936) (not e!368770))))

(assert (=> b!643736 (= res!416936 (arrayContainsKey!0 lt!298252 (select (arr!18421 a!2986) j!136) j!136))))

(declare-fun b!643737 () Bool)

(declare-fun res!416932 () Bool)

(assert (=> b!643737 (=> (not res!416932) (not e!368763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38415 (_ BitVec 32)) Bool)

(assert (=> b!643737 (= res!416932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!643738 () Bool)

(declare-fun e!368766 () Bool)

(assert (=> b!643738 (= e!368766 e!368772)))

(declare-fun res!416935 () Bool)

(assert (=> b!643738 (=> res!416935 e!368772)))

(declare-fun lt!298250 () (_ BitVec 64))

(declare-fun lt!298248 () (_ BitVec 64))

(assert (=> b!643738 (= res!416935 (or (not (= (select (arr!18421 a!2986) j!136) lt!298248)) (not (= (select (arr!18421 a!2986) j!136) lt!298250)) (bvsge j!136 index!984)))))

(declare-fun b!643739 () Bool)

(declare-fun res!416928 () Bool)

(assert (=> b!643739 (=> (not res!416928) (not e!368763))))

(declare-datatypes ((List!12462 0))(
  ( (Nil!12459) (Cons!12458 (h!13503 (_ BitVec 64)) (t!18690 List!12462)) )
))
(declare-fun arrayNoDuplicates!0 (array!38415 (_ BitVec 32) List!12462) Bool)

(assert (=> b!643739 (= res!416928 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12459))))

(declare-fun b!643740 () Bool)

(declare-fun e!368762 () Bool)

(declare-fun lt!298245 () SeekEntryResult!6861)

(declare-fun lt!298243 () SeekEntryResult!6861)

(assert (=> b!643740 (= e!368762 (= lt!298245 lt!298243))))

(declare-fun b!643741 () Bool)

(declare-fun res!416933 () Bool)

(assert (=> b!643741 (=> (not res!416933) (not e!368771))))

(assert (=> b!643741 (= res!416933 (and (= (size!18785 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18785 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18785 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!643742 () Bool)

(assert (=> b!643742 (= e!368770 (arrayContainsKey!0 lt!298252 (select (arr!18421 a!2986) j!136) index!984))))

(declare-fun b!643743 () Bool)

(declare-fun res!416923 () Bool)

(assert (=> b!643743 (=> (not res!416923) (not e!368771))))

(assert (=> b!643743 (= res!416923 (validKeyInArray!0 (select (arr!18421 a!2986) j!136)))))

(declare-fun b!643744 () Bool)

(declare-fun Unit!21796 () Unit!21792)

(assert (=> b!643744 (= e!368765 Unit!21796)))

(assert (=> b!643744 false))

(declare-fun b!643745 () Bool)

(declare-fun e!368764 () Bool)

(declare-fun e!368769 () Bool)

(assert (=> b!643745 (= e!368764 (not e!368769))))

(declare-fun res!416927 () Bool)

(assert (=> b!643745 (=> res!416927 e!368769)))

(declare-fun lt!298249 () SeekEntryResult!6861)

(assert (=> b!643745 (= res!416927 (not (= lt!298249 (Found!6861 index!984))))))

(declare-fun lt!298239 () Unit!21792)

(assert (=> b!643745 (= lt!298239 e!368765)))

(declare-fun c!73772 () Bool)

(assert (=> b!643745 (= c!73772 (= lt!298249 Undefined!6861))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38415 (_ BitVec 32)) SeekEntryResult!6861)

(assert (=> b!643745 (= lt!298249 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298248 lt!298252 mask!3053))))

(assert (=> b!643745 e!368762))

(declare-fun res!416921 () Bool)

(assert (=> b!643745 (=> (not res!416921) (not e!368762))))

(declare-fun lt!298244 () (_ BitVec 32))

(assert (=> b!643745 (= res!416921 (= lt!298243 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298244 vacantSpotIndex!68 lt!298248 lt!298252 mask!3053)))))

(assert (=> b!643745 (= lt!298243 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298244 vacantSpotIndex!68 (select (arr!18421 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!643745 (= lt!298248 (select (store (arr!18421 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!298238 () Unit!21792)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38415 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21792)

(assert (=> b!643745 (= lt!298238 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298244 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!643745 (= lt!298244 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!643746 () Bool)

(declare-fun e!368768 () Bool)

(assert (=> b!643746 (= e!368763 e!368768)))

(declare-fun res!416925 () Bool)

(assert (=> b!643746 (=> (not res!416925) (not e!368768))))

(assert (=> b!643746 (= res!416925 (= (select (store (arr!18421 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643746 (= lt!298252 (array!38416 (store (arr!18421 a!2986) i!1108 k0!1786) (size!18785 a!2986)))))

(declare-fun b!643747 () Bool)

(declare-fun Unit!21797 () Unit!21792)

(assert (=> b!643747 (= e!368767 Unit!21797)))

(declare-fun lt!298246 () Unit!21792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38415 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21792)

(assert (=> b!643747 (= lt!298246 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298252 (select (arr!18421 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!643747 (arrayContainsKey!0 lt!298252 (select (arr!18421 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298240 () Unit!21792)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38415 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12462) Unit!21792)

(assert (=> b!643747 (= lt!298240 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12459))))

(assert (=> b!643747 (arrayNoDuplicates!0 lt!298252 #b00000000000000000000000000000000 Nil!12459)))

(declare-fun lt!298242 () Unit!21792)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38415 (_ BitVec 32) (_ BitVec 32)) Unit!21792)

(assert (=> b!643747 (= lt!298242 (lemmaNoDuplicateFromThenFromBigger!0 lt!298252 #b00000000000000000000000000000000 j!136))))

(assert (=> b!643747 (arrayNoDuplicates!0 lt!298252 j!136 Nil!12459)))

(declare-fun lt!298241 () Unit!21792)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38415 (_ BitVec 64) (_ BitVec 32) List!12462) Unit!21792)

(assert (=> b!643747 (= lt!298241 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298252 (select (arr!18421 a!2986) j!136) j!136 Nil!12459))))

(assert (=> b!643747 false))

(declare-fun b!643748 () Bool)

(assert (=> b!643748 (= e!368768 e!368764)))

(declare-fun res!416922 () Bool)

(assert (=> b!643748 (=> (not res!416922) (not e!368764))))

(assert (=> b!643748 (= res!416922 (and (= lt!298245 (Found!6861 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18421 a!2986) index!984) (select (arr!18421 a!2986) j!136))) (not (= (select (arr!18421 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!643748 (= lt!298245 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18421 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643749 () Bool)

(assert (=> b!643749 (= e!368773 (arrayContainsKey!0 lt!298252 (select (arr!18421 a!2986) j!136) index!984))))

(declare-fun b!643750 () Bool)

(declare-fun e!368761 () Bool)

(assert (=> b!643750 (= e!368769 e!368761)))

(declare-fun res!416924 () Bool)

(assert (=> b!643750 (=> res!416924 e!368761)))

(assert (=> b!643750 (= res!416924 (or (not (= (select (arr!18421 a!2986) j!136) lt!298248)) (not (= (select (arr!18421 a!2986) j!136) lt!298250))))))

(assert (=> b!643750 e!368766))

(declare-fun res!416930 () Bool)

(assert (=> b!643750 (=> (not res!416930) (not e!368766))))

(assert (=> b!643750 (= res!416930 (= lt!298250 (select (arr!18421 a!2986) j!136)))))

(assert (=> b!643750 (= lt!298250 (select (store (arr!18421 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!643751 () Bool)

(assert (=> b!643751 (= e!368761 e!368774)))

(declare-fun res!416931 () Bool)

(assert (=> b!643751 (=> res!416931 e!368774)))

(assert (=> b!643751 (= res!416931 (bvsge index!984 j!136))))

(declare-fun lt!298251 () Unit!21792)

(assert (=> b!643751 (= lt!298251 e!368767)))

(declare-fun c!73771 () Bool)

(assert (=> b!643751 (= c!73771 (bvslt j!136 index!984))))

(assert (= (and start!58318 res!416929) b!643741))

(assert (= (and b!643741 res!416933) b!643743))

(assert (= (and b!643743 res!416923) b!643729))

(assert (= (and b!643729 res!416926) b!643733))

(assert (= (and b!643733 res!416939) b!643735))

(assert (= (and b!643735 res!416937) b!643737))

(assert (= (and b!643737 res!416932) b!643739))

(assert (= (and b!643739 res!416928) b!643730))

(assert (= (and b!643730 res!416938) b!643746))

(assert (= (and b!643746 res!416925) b!643748))

(assert (= (and b!643748 res!416922) b!643745))

(assert (= (and b!643745 res!416921) b!643740))

(assert (= (and b!643745 c!73772) b!643744))

(assert (= (and b!643745 (not c!73772)) b!643734))

(assert (= (and b!643745 (not res!416927)) b!643750))

(assert (= (and b!643750 res!416930) b!643738))

(assert (= (and b!643738 (not res!416935)) b!643732))

(assert (= (and b!643732 res!416934) b!643749))

(assert (= (and b!643750 (not res!416924)) b!643751))

(assert (= (and b!643751 c!73771) b!643747))

(assert (= (and b!643751 (not c!73771)) b!643731))

(assert (= (and b!643751 (not res!416931)) b!643736))

(assert (= (and b!643736 res!416936) b!643742))

(declare-fun m!617429 () Bool)

(assert (=> b!643735 m!617429))

(declare-fun m!617431 () Bool)

(assert (=> b!643736 m!617431))

(assert (=> b!643736 m!617431))

(declare-fun m!617433 () Bool)

(assert (=> b!643736 m!617433))

(assert (=> b!643742 m!617431))

(assert (=> b!643742 m!617431))

(declare-fun m!617435 () Bool)

(assert (=> b!643742 m!617435))

(assert (=> b!643749 m!617431))

(assert (=> b!643749 m!617431))

(assert (=> b!643749 m!617435))

(declare-fun m!617437 () Bool)

(assert (=> b!643737 m!617437))

(declare-fun m!617439 () Bool)

(assert (=> b!643739 m!617439))

(declare-fun m!617441 () Bool)

(assert (=> b!643733 m!617441))

(assert (=> b!643743 m!617431))

(assert (=> b!643743 m!617431))

(declare-fun m!617443 () Bool)

(assert (=> b!643743 m!617443))

(declare-fun m!617445 () Bool)

(assert (=> b!643748 m!617445))

(assert (=> b!643748 m!617431))

(assert (=> b!643748 m!617431))

(declare-fun m!617447 () Bool)

(assert (=> b!643748 m!617447))

(declare-fun m!617449 () Bool)

(assert (=> start!58318 m!617449))

(declare-fun m!617451 () Bool)

(assert (=> start!58318 m!617451))

(declare-fun m!617453 () Bool)

(assert (=> b!643747 m!617453))

(assert (=> b!643747 m!617431))

(assert (=> b!643747 m!617431))

(declare-fun m!617455 () Bool)

(assert (=> b!643747 m!617455))

(declare-fun m!617457 () Bool)

(assert (=> b!643747 m!617457))

(declare-fun m!617459 () Bool)

(assert (=> b!643747 m!617459))

(assert (=> b!643747 m!617431))

(declare-fun m!617461 () Bool)

(assert (=> b!643747 m!617461))

(assert (=> b!643747 m!617431))

(declare-fun m!617463 () Bool)

(assert (=> b!643747 m!617463))

(declare-fun m!617465 () Bool)

(assert (=> b!643747 m!617465))

(declare-fun m!617467 () Bool)

(assert (=> b!643730 m!617467))

(declare-fun m!617469 () Bool)

(assert (=> b!643746 m!617469))

(declare-fun m!617471 () Bool)

(assert (=> b!643746 m!617471))

(declare-fun m!617473 () Bool)

(assert (=> b!643745 m!617473))

(assert (=> b!643745 m!617431))

(declare-fun m!617475 () Bool)

(assert (=> b!643745 m!617475))

(assert (=> b!643745 m!617469))

(assert (=> b!643745 m!617431))

(declare-fun m!617477 () Bool)

(assert (=> b!643745 m!617477))

(declare-fun m!617479 () Bool)

(assert (=> b!643745 m!617479))

(declare-fun m!617481 () Bool)

(assert (=> b!643745 m!617481))

(declare-fun m!617483 () Bool)

(assert (=> b!643745 m!617483))

(assert (=> b!643732 m!617431))

(assert (=> b!643732 m!617431))

(assert (=> b!643732 m!617433))

(declare-fun m!617485 () Bool)

(assert (=> b!643729 m!617485))

(assert (=> b!643738 m!617431))

(assert (=> b!643750 m!617431))

(assert (=> b!643750 m!617469))

(declare-fun m!617487 () Bool)

(assert (=> b!643750 m!617487))

(check-sat (not b!643749) (not b!643732) (not start!58318) (not b!643747) (not b!643733) (not b!643736) (not b!643742) (not b!643729) (not b!643743) (not b!643748) (not b!643735) (not b!643745) (not b!643737) (not b!643739))
(check-sat)
