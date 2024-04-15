; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55890 () Bool)

(assert start!55890)

(declare-fun b!611577 () Bool)

(declare-fun e!350481 () Bool)

(declare-fun e!350485 () Bool)

(assert (=> b!611577 (= e!350481 e!350485)))

(declare-fun res!393396 () Bool)

(assert (=> b!611577 (=> res!393396 e!350485)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!279758 () (_ BitVec 64))

(declare-fun lt!279752 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37374 0))(
  ( (array!37375 (arr!17933 (Array (_ BitVec 32) (_ BitVec 64))) (size!18298 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37374)

(assert (=> b!611577 (= res!393396 (or (not (= (select (arr!17933 a!2986) j!136) lt!279752)) (not (= (select (arr!17933 a!2986) j!136) lt!279758)) (bvsge j!136 index!984)))))

(declare-fun b!611578 () Bool)

(declare-fun e!350479 () Bool)

(declare-fun e!350476 () Bool)

(assert (=> b!611578 (= e!350479 (not e!350476))))

(declare-fun res!393407 () Bool)

(assert (=> b!611578 (=> res!393407 e!350476)))

(declare-datatypes ((SeekEntryResult!6370 0))(
  ( (MissingZero!6370 (index!27764 (_ BitVec 32))) (Found!6370 (index!27765 (_ BitVec 32))) (Intermediate!6370 (undefined!7182 Bool) (index!27766 (_ BitVec 32)) (x!56589 (_ BitVec 32))) (Undefined!6370) (MissingVacant!6370 (index!27767 (_ BitVec 32))) )
))
(declare-fun lt!279747 () SeekEntryResult!6370)

(assert (=> b!611578 (= res!393407 (not (= lt!279747 (Found!6370 index!984))))))

(declare-datatypes ((Unit!19602 0))(
  ( (Unit!19603) )
))
(declare-fun lt!279756 () Unit!19602)

(declare-fun e!350478 () Unit!19602)

(assert (=> b!611578 (= lt!279756 e!350478)))

(declare-fun c!69462 () Bool)

(assert (=> b!611578 (= c!69462 (= lt!279747 Undefined!6370))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!279754 () array!37374)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37374 (_ BitVec 32)) SeekEntryResult!6370)

(assert (=> b!611578 (= lt!279747 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279752 lt!279754 mask!3053))))

(declare-fun e!350488 () Bool)

(assert (=> b!611578 e!350488))

(declare-fun res!393401 () Bool)

(assert (=> b!611578 (=> (not res!393401) (not e!350488))))

(declare-fun lt!279763 () (_ BitVec 32))

(declare-fun lt!279751 () SeekEntryResult!6370)

(assert (=> b!611578 (= res!393401 (= lt!279751 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279763 vacantSpotIndex!68 lt!279752 lt!279754 mask!3053)))))

(assert (=> b!611578 (= lt!279751 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279763 vacantSpotIndex!68 (select (arr!17933 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!611578 (= lt!279752 (select (store (arr!17933 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!279749 () Unit!19602)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37374 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19602)

(assert (=> b!611578 (= lt!279749 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279763 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!611578 (= lt!279763 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!611579 () Bool)

(declare-fun e!350490 () Bool)

(assert (=> b!611579 (= e!350490 e!350479)))

(declare-fun res!393391 () Bool)

(assert (=> b!611579 (=> (not res!393391) (not e!350479))))

(declare-fun lt!279762 () SeekEntryResult!6370)

(assert (=> b!611579 (= res!393391 (and (= lt!279762 (Found!6370 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17933 a!2986) index!984) (select (arr!17933 a!2986) j!136))) (not (= (select (arr!17933 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!611579 (= lt!279762 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17933 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611580 () Bool)

(declare-fun res!393393 () Bool)

(declare-fun e!350484 () Bool)

(assert (=> b!611580 (=> (not res!393393) (not e!350484))))

(declare-fun arrayContainsKey!0 (array!37374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!611580 (= res!393393 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!611581 () Bool)

(declare-fun res!393405 () Bool)

(declare-fun e!350483 () Bool)

(assert (=> b!611581 (=> (not res!393405) (not e!350483))))

(declare-datatypes ((List!12013 0))(
  ( (Nil!12010) (Cons!12009 (h!13054 (_ BitVec 64)) (t!18232 List!12013)) )
))
(declare-fun arrayNoDuplicates!0 (array!37374 (_ BitVec 32) List!12013) Bool)

(assert (=> b!611581 (= res!393405 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12010))))

(declare-fun b!611582 () Bool)

(declare-fun e!350487 () Bool)

(assert (=> b!611582 (= e!350476 e!350487)))

(declare-fun res!393394 () Bool)

(assert (=> b!611582 (=> res!393394 e!350487)))

(assert (=> b!611582 (= res!393394 (or (not (= (select (arr!17933 a!2986) j!136) lt!279752)) (not (= (select (arr!17933 a!2986) j!136) lt!279758))))))

(assert (=> b!611582 e!350481))

(declare-fun res!393398 () Bool)

(assert (=> b!611582 (=> (not res!393398) (not e!350481))))

(assert (=> b!611582 (= res!393398 (= lt!279758 (select (arr!17933 a!2986) j!136)))))

(assert (=> b!611582 (= lt!279758 (select (store (arr!17933 a!2986) i!1108 k0!1786) index!984))))

(declare-fun e!350489 () Bool)

(declare-fun b!611583 () Bool)

(assert (=> b!611583 (= e!350489 (arrayContainsKey!0 lt!279754 (select (arr!17933 a!2986) j!136) index!984))))

(declare-fun b!611584 () Bool)

(assert (=> b!611584 (= e!350488 (= lt!279762 lt!279751))))

(declare-fun b!611585 () Bool)

(declare-fun e!350477 () Bool)

(assert (=> b!611585 (= e!350487 e!350477)))

(declare-fun res!393395 () Bool)

(assert (=> b!611585 (=> res!393395 e!350477)))

(assert (=> b!611585 (= res!393395 (bvsge index!984 j!136))))

(declare-fun lt!279755 () Unit!19602)

(declare-fun e!350482 () Unit!19602)

(assert (=> b!611585 (= lt!279755 e!350482)))

(declare-fun c!69461 () Bool)

(assert (=> b!611585 (= c!69461 (bvslt j!136 index!984))))

(declare-fun b!611586 () Bool)

(declare-fun Unit!19604 () Unit!19602)

(assert (=> b!611586 (= e!350478 Unit!19604)))

(declare-fun b!611587 () Bool)

(declare-fun Unit!19605 () Unit!19602)

(assert (=> b!611587 (= e!350478 Unit!19605)))

(assert (=> b!611587 false))

(declare-fun b!611588 () Bool)

(assert (=> b!611588 (= e!350483 e!350490)))

(declare-fun res!393397 () Bool)

(assert (=> b!611588 (=> (not res!393397) (not e!350490))))

(assert (=> b!611588 (= res!393397 (= (select (store (arr!17933 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611588 (= lt!279754 (array!37375 (store (arr!17933 a!2986) i!1108 k0!1786) (size!18298 a!2986)))))

(declare-fun b!611589 () Bool)

(assert (=> b!611589 (= e!350484 e!350483)))

(declare-fun res!393392 () Bool)

(assert (=> b!611589 (=> (not res!393392) (not e!350483))))

(declare-fun lt!279748 () SeekEntryResult!6370)

(assert (=> b!611589 (= res!393392 (or (= lt!279748 (MissingZero!6370 i!1108)) (= lt!279748 (MissingVacant!6370 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37374 (_ BitVec 32)) SeekEntryResult!6370)

(assert (=> b!611589 (= lt!279748 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!611590 () Bool)

(declare-fun res!393399 () Bool)

(assert (=> b!611590 (=> (not res!393399) (not e!350483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37374 (_ BitVec 32)) Bool)

(assert (=> b!611590 (= res!393399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!611591 () Bool)

(declare-fun Unit!19606 () Unit!19602)

(assert (=> b!611591 (= e!350482 Unit!19606)))

(declare-fun lt!279750 () Unit!19602)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37374 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19602)

(assert (=> b!611591 (= lt!279750 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279754 (select (arr!17933 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!611591 (arrayContainsKey!0 lt!279754 (select (arr!17933 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279760 () Unit!19602)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37374 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12013) Unit!19602)

(assert (=> b!611591 (= lt!279760 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12010))))

(assert (=> b!611591 (arrayNoDuplicates!0 lt!279754 #b00000000000000000000000000000000 Nil!12010)))

(declare-fun lt!279753 () Unit!19602)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37374 (_ BitVec 32) (_ BitVec 32)) Unit!19602)

(assert (=> b!611591 (= lt!279753 (lemmaNoDuplicateFromThenFromBigger!0 lt!279754 #b00000000000000000000000000000000 j!136))))

(assert (=> b!611591 (arrayNoDuplicates!0 lt!279754 j!136 Nil!12010)))

(declare-fun lt!279759 () Unit!19602)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37374 (_ BitVec 64) (_ BitVec 32) List!12013) Unit!19602)

(assert (=> b!611591 (= lt!279759 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279754 (select (arr!17933 a!2986) j!136) j!136 Nil!12010))))

(assert (=> b!611591 false))

(declare-fun b!611592 () Bool)

(declare-fun res!393406 () Bool)

(assert (=> b!611592 (=> (not res!393406) (not e!350484))))

(assert (=> b!611592 (= res!393406 (and (= (size!18298 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18298 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18298 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!350486 () Bool)

(declare-fun b!611593 () Bool)

(assert (=> b!611593 (= e!350486 (arrayContainsKey!0 lt!279754 (select (arr!17933 a!2986) j!136) index!984))))

(declare-fun b!611594 () Bool)

(declare-fun res!393400 () Bool)

(assert (=> b!611594 (=> (not res!393400) (not e!350484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!611594 (= res!393400 (validKeyInArray!0 k0!1786))))

(declare-fun b!611595 () Bool)

(declare-fun res!393389 () Bool)

(assert (=> b!611595 (=> (not res!393389) (not e!350484))))

(assert (=> b!611595 (= res!393389 (validKeyInArray!0 (select (arr!17933 a!2986) j!136)))))

(declare-fun b!611596 () Bool)

(declare-fun res!393404 () Bool)

(assert (=> b!611596 (=> (not res!393404) (not e!350483))))

(assert (=> b!611596 (= res!393404 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17933 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611597 () Bool)

(assert (=> b!611597 (= e!350485 e!350486)))

(declare-fun res!393402 () Bool)

(assert (=> b!611597 (=> (not res!393402) (not e!350486))))

(assert (=> b!611597 (= res!393402 (arrayContainsKey!0 lt!279754 (select (arr!17933 a!2986) j!136) j!136))))

(declare-fun b!611598 () Bool)

(declare-fun Unit!19607 () Unit!19602)

(assert (=> b!611598 (= e!350482 Unit!19607)))

(declare-fun res!393390 () Bool)

(assert (=> start!55890 (=> (not res!393390) (not e!350484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55890 (= res!393390 (validMask!0 mask!3053))))

(assert (=> start!55890 e!350484))

(assert (=> start!55890 true))

(declare-fun array_inv!13816 (array!37374) Bool)

(assert (=> start!55890 (array_inv!13816 a!2986)))

(declare-fun b!611599 () Bool)

(assert (=> b!611599 (= e!350477 true)))

(assert (=> b!611599 (arrayNoDuplicates!0 lt!279754 #b00000000000000000000000000000000 Nil!12010)))

(declare-fun lt!279761 () Unit!19602)

(assert (=> b!611599 (= lt!279761 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12010))))

(assert (=> b!611599 (arrayContainsKey!0 lt!279754 (select (arr!17933 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279757 () Unit!19602)

(assert (=> b!611599 (= lt!279757 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279754 (select (arr!17933 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!611599 e!350489))

(declare-fun res!393403 () Bool)

(assert (=> b!611599 (=> (not res!393403) (not e!350489))))

(assert (=> b!611599 (= res!393403 (arrayContainsKey!0 lt!279754 (select (arr!17933 a!2986) j!136) j!136))))

(assert (= (and start!55890 res!393390) b!611592))

(assert (= (and b!611592 res!393406) b!611595))

(assert (= (and b!611595 res!393389) b!611594))

(assert (= (and b!611594 res!393400) b!611580))

(assert (= (and b!611580 res!393393) b!611589))

(assert (= (and b!611589 res!393392) b!611590))

(assert (= (and b!611590 res!393399) b!611581))

(assert (= (and b!611581 res!393405) b!611596))

(assert (= (and b!611596 res!393404) b!611588))

(assert (= (and b!611588 res!393397) b!611579))

(assert (= (and b!611579 res!393391) b!611578))

(assert (= (and b!611578 res!393401) b!611584))

(assert (= (and b!611578 c!69462) b!611587))

(assert (= (and b!611578 (not c!69462)) b!611586))

(assert (= (and b!611578 (not res!393407)) b!611582))

(assert (= (and b!611582 res!393398) b!611577))

(assert (= (and b!611577 (not res!393396)) b!611597))

(assert (= (and b!611597 res!393402) b!611593))

(assert (= (and b!611582 (not res!393394)) b!611585))

(assert (= (and b!611585 c!69461) b!611591))

(assert (= (and b!611585 (not c!69461)) b!611598))

(assert (= (and b!611585 (not res!393395)) b!611599))

(assert (= (and b!611599 res!393403) b!611583))

(declare-fun m!587467 () Bool)

(assert (=> b!611595 m!587467))

(assert (=> b!611595 m!587467))

(declare-fun m!587469 () Bool)

(assert (=> b!611595 m!587469))

(declare-fun m!587471 () Bool)

(assert (=> b!611596 m!587471))

(assert (=> b!611583 m!587467))

(assert (=> b!611583 m!587467))

(declare-fun m!587473 () Bool)

(assert (=> b!611583 m!587473))

(declare-fun m!587475 () Bool)

(assert (=> b!611594 m!587475))

(declare-fun m!587477 () Bool)

(assert (=> b!611588 m!587477))

(declare-fun m!587479 () Bool)

(assert (=> b!611588 m!587479))

(assert (=> b!611599 m!587467))

(declare-fun m!587481 () Bool)

(assert (=> b!611599 m!587481))

(assert (=> b!611599 m!587467))

(declare-fun m!587483 () Bool)

(assert (=> b!611599 m!587483))

(declare-fun m!587485 () Bool)

(assert (=> b!611599 m!587485))

(assert (=> b!611599 m!587467))

(assert (=> b!611599 m!587467))

(declare-fun m!587487 () Bool)

(assert (=> b!611599 m!587487))

(declare-fun m!587489 () Bool)

(assert (=> b!611599 m!587489))

(declare-fun m!587491 () Bool)

(assert (=> b!611590 m!587491))

(declare-fun m!587493 () Bool)

(assert (=> b!611579 m!587493))

(assert (=> b!611579 m!587467))

(assert (=> b!611579 m!587467))

(declare-fun m!587495 () Bool)

(assert (=> b!611579 m!587495))

(assert (=> b!611582 m!587467))

(assert (=> b!611582 m!587477))

(declare-fun m!587497 () Bool)

(assert (=> b!611582 m!587497))

(declare-fun m!587499 () Bool)

(assert (=> start!55890 m!587499))

(declare-fun m!587501 () Bool)

(assert (=> start!55890 m!587501))

(declare-fun m!587503 () Bool)

(assert (=> b!611580 m!587503))

(assert (=> b!611591 m!587485))

(assert (=> b!611591 m!587467))

(declare-fun m!587505 () Bool)

(assert (=> b!611591 m!587505))

(assert (=> b!611591 m!587467))

(declare-fun m!587507 () Bool)

(assert (=> b!611591 m!587507))

(assert (=> b!611591 m!587467))

(declare-fun m!587509 () Bool)

(assert (=> b!611591 m!587509))

(assert (=> b!611591 m!587489))

(declare-fun m!587511 () Bool)

(assert (=> b!611591 m!587511))

(assert (=> b!611591 m!587467))

(declare-fun m!587513 () Bool)

(assert (=> b!611591 m!587513))

(assert (=> b!611593 m!587467))

(assert (=> b!611593 m!587467))

(assert (=> b!611593 m!587473))

(assert (=> b!611577 m!587467))

(declare-fun m!587515 () Bool)

(assert (=> b!611581 m!587515))

(declare-fun m!587517 () Bool)

(assert (=> b!611578 m!587517))

(declare-fun m!587519 () Bool)

(assert (=> b!611578 m!587519))

(declare-fun m!587521 () Bool)

(assert (=> b!611578 m!587521))

(assert (=> b!611578 m!587467))

(declare-fun m!587523 () Bool)

(assert (=> b!611578 m!587523))

(assert (=> b!611578 m!587467))

(declare-fun m!587525 () Bool)

(assert (=> b!611578 m!587525))

(assert (=> b!611578 m!587477))

(declare-fun m!587527 () Bool)

(assert (=> b!611578 m!587527))

(assert (=> b!611597 m!587467))

(assert (=> b!611597 m!587467))

(assert (=> b!611597 m!587481))

(declare-fun m!587529 () Bool)

(assert (=> b!611589 m!587529))

(check-sat (not b!611589) (not b!611590) (not b!611581) (not b!611591) (not b!611595) (not b!611578) (not b!611580) (not start!55890) (not b!611593) (not b!611599) (not b!611583) (not b!611594) (not b!611579) (not b!611597))
(check-sat)
