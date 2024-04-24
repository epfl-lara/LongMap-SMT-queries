; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57864 () Bool)

(assert start!57864)

(declare-fun b!639472 () Bool)

(declare-fun res!413936 () Bool)

(declare-fun e!365983 () Bool)

(assert (=> b!639472 (=> (not res!413936) (not e!365983))))

(declare-datatypes ((array!38304 0))(
  ( (array!38305 (arr!18370 (Array (_ BitVec 32) (_ BitVec 64))) (size!18734 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38304)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38304 (_ BitVec 32)) Bool)

(assert (=> b!639472 (= res!413936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639473 () Bool)

(declare-fun e!365989 () Bool)

(declare-datatypes ((SeekEntryResult!6766 0))(
  ( (MissingZero!6766 (index!29381 (_ BitVec 32))) (Found!6766 (index!29382 (_ BitVec 32))) (Intermediate!6766 (undefined!7578 Bool) (index!29383 (_ BitVec 32)) (x!58292 (_ BitVec 32))) (Undefined!6766) (MissingVacant!6766 (index!29384 (_ BitVec 32))) )
))
(declare-fun lt!295797 () SeekEntryResult!6766)

(declare-fun lt!295803 () SeekEntryResult!6766)

(assert (=> b!639473 (= e!365989 (= lt!295797 lt!295803))))

(declare-fun b!639474 () Bool)

(declare-fun e!365987 () Bool)

(declare-fun e!365982 () Bool)

(assert (=> b!639474 (= e!365987 e!365982)))

(declare-fun res!413935 () Bool)

(assert (=> b!639474 (=> (not res!413935) (not e!365982))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!639474 (= res!413935 (and (= lt!295797 (Found!6766 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18370 a!2986) index!984) (select (arr!18370 a!2986) j!136))) (not (= (select (arr!18370 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38304 (_ BitVec 32)) SeekEntryResult!6766)

(assert (=> b!639474 (= lt!295797 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18370 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639475 () Bool)

(declare-fun res!413933 () Bool)

(declare-fun e!365986 () Bool)

(assert (=> b!639475 (=> (not res!413933) (not e!365986))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639475 (= res!413933 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639476 () Bool)

(assert (=> b!639476 (= e!365986 e!365983)))

(declare-fun res!413925 () Bool)

(assert (=> b!639476 (=> (not res!413925) (not e!365983))))

(declare-fun lt!295800 () SeekEntryResult!6766)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!639476 (= res!413925 (or (= lt!295800 (MissingZero!6766 i!1108)) (= lt!295800 (MissingVacant!6766 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38304 (_ BitVec 32)) SeekEntryResult!6766)

(assert (=> b!639476 (= lt!295800 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!639477 () Bool)

(declare-fun e!365985 () Bool)

(assert (=> b!639477 (= e!365982 (not e!365985))))

(declare-fun res!413926 () Bool)

(assert (=> b!639477 (=> res!413926 e!365985)))

(declare-fun lt!295796 () SeekEntryResult!6766)

(assert (=> b!639477 (= res!413926 (not (= lt!295796 (Found!6766 index!984))))))

(declare-datatypes ((Unit!21573 0))(
  ( (Unit!21574) )
))
(declare-fun lt!295804 () Unit!21573)

(declare-fun e!365990 () Unit!21573)

(assert (=> b!639477 (= lt!295804 e!365990)))

(declare-fun c!73142 () Bool)

(assert (=> b!639477 (= c!73142 (= lt!295796 Undefined!6766))))

(declare-fun lt!295801 () array!38304)

(declare-fun lt!295798 () (_ BitVec 64))

(assert (=> b!639477 (= lt!295796 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295798 lt!295801 mask!3053))))

(assert (=> b!639477 e!365989))

(declare-fun res!413941 () Bool)

(assert (=> b!639477 (=> (not res!413941) (not e!365989))))

(declare-fun lt!295793 () (_ BitVec 32))

(assert (=> b!639477 (= res!413941 (= lt!295803 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295793 vacantSpotIndex!68 lt!295798 lt!295801 mask!3053)))))

(assert (=> b!639477 (= lt!295803 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295793 vacantSpotIndex!68 (select (arr!18370 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639477 (= lt!295798 (select (store (arr!18370 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295795 () Unit!21573)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38304 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21573)

(assert (=> b!639477 (= lt!295795 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295793 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639477 (= lt!295793 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!639478 () Bool)

(declare-fun res!413937 () Bool)

(assert (=> b!639478 (=> (not res!413937) (not e!365983))))

(assert (=> b!639478 (= res!413937 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18370 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639479 () Bool)

(declare-fun e!365988 () Bool)

(assert (=> b!639479 (= e!365988 (arrayContainsKey!0 lt!295801 (select (arr!18370 a!2986) j!136) index!984))))

(declare-fun b!639480 () Bool)

(declare-fun Unit!21575 () Unit!21573)

(assert (=> b!639480 (= e!365990 Unit!21575)))

(declare-fun b!639481 () Bool)

(declare-fun res!413930 () Bool)

(assert (=> b!639481 (=> (not res!413930) (not e!365983))))

(declare-datatypes ((List!12318 0))(
  ( (Nil!12315) (Cons!12314 (h!13362 (_ BitVec 64)) (t!18538 List!12318)) )
))
(declare-fun arrayNoDuplicates!0 (array!38304 (_ BitVec 32) List!12318) Bool)

(assert (=> b!639481 (= res!413930 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12315))))

(declare-fun b!639482 () Bool)

(declare-fun res!413932 () Bool)

(assert (=> b!639482 (=> (not res!413932) (not e!365986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639482 (= res!413932 (validKeyInArray!0 (select (arr!18370 a!2986) j!136)))))

(declare-fun b!639483 () Bool)

(assert (=> b!639483 (= e!365983 e!365987)))

(declare-fun res!413929 () Bool)

(assert (=> b!639483 (=> (not res!413929) (not e!365987))))

(assert (=> b!639483 (= res!413929 (= (select (store (arr!18370 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639483 (= lt!295801 (array!38305 (store (arr!18370 a!2986) i!1108 k0!1786) (size!18734 a!2986)))))

(declare-fun b!639484 () Bool)

(declare-fun e!365981 () Bool)

(assert (=> b!639484 (= e!365985 e!365981)))

(declare-fun res!413931 () Bool)

(assert (=> b!639484 (=> res!413931 e!365981)))

(declare-fun lt!295799 () (_ BitVec 64))

(assert (=> b!639484 (= res!413931 (or (not (= (select (arr!18370 a!2986) j!136) lt!295798)) (not (= (select (arr!18370 a!2986) j!136) lt!295799)) (bvsge j!136 index!984)))))

(declare-fun e!365984 () Bool)

(assert (=> b!639484 e!365984))

(declare-fun res!413934 () Bool)

(assert (=> b!639484 (=> (not res!413934) (not e!365984))))

(assert (=> b!639484 (= res!413934 (= lt!295799 (select (arr!18370 a!2986) j!136)))))

(assert (=> b!639484 (= lt!295799 (select (store (arr!18370 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!639485 () Bool)

(declare-fun Unit!21576 () Unit!21573)

(assert (=> b!639485 (= e!365990 Unit!21576)))

(assert (=> b!639485 false))

(declare-fun b!639486 () Bool)

(declare-fun e!365980 () Bool)

(assert (=> b!639486 (= e!365980 e!365988)))

(declare-fun res!413940 () Bool)

(assert (=> b!639486 (=> (not res!413940) (not e!365988))))

(assert (=> b!639486 (= res!413940 (arrayContainsKey!0 lt!295801 (select (arr!18370 a!2986) j!136) j!136))))

(declare-fun b!639487 () Bool)

(declare-fun res!413927 () Bool)

(assert (=> b!639487 (=> (not res!413927) (not e!365986))))

(assert (=> b!639487 (= res!413927 (and (= (size!18734 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18734 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18734 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639488 () Bool)

(assert (=> b!639488 (= e!365984 e!365980)))

(declare-fun res!413928 () Bool)

(assert (=> b!639488 (=> res!413928 e!365980)))

(assert (=> b!639488 (= res!413928 (or (not (= (select (arr!18370 a!2986) j!136) lt!295798)) (not (= (select (arr!18370 a!2986) j!136) lt!295799)) (bvsge j!136 index!984)))))

(declare-fun b!639489 () Bool)

(declare-fun res!413938 () Bool)

(assert (=> b!639489 (=> (not res!413938) (not e!365986))))

(assert (=> b!639489 (= res!413938 (validKeyInArray!0 k0!1786))))

(declare-fun b!639490 () Bool)

(assert (=> b!639490 (= e!365981 (or (bvsge (size!18734 a!2986) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!18734 a!2986))))))

(assert (=> b!639490 (arrayNoDuplicates!0 lt!295801 #b00000000000000000000000000000000 Nil!12315)))

(declare-fun lt!295802 () Unit!21573)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38304 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12318) Unit!21573)

(assert (=> b!639490 (= lt!295802 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12315))))

(assert (=> b!639490 (arrayContainsKey!0 lt!295801 (select (arr!18370 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295794 () Unit!21573)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38304 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21573)

(assert (=> b!639490 (= lt!295794 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295801 (select (arr!18370 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun res!413939 () Bool)

(assert (=> start!57864 (=> (not res!413939) (not e!365986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57864 (= res!413939 (validMask!0 mask!3053))))

(assert (=> start!57864 e!365986))

(assert (=> start!57864 true))

(declare-fun array_inv!14229 (array!38304) Bool)

(assert (=> start!57864 (array_inv!14229 a!2986)))

(assert (= (and start!57864 res!413939) b!639487))

(assert (= (and b!639487 res!413927) b!639482))

(assert (= (and b!639482 res!413932) b!639489))

(assert (= (and b!639489 res!413938) b!639475))

(assert (= (and b!639475 res!413933) b!639476))

(assert (= (and b!639476 res!413925) b!639472))

(assert (= (and b!639472 res!413936) b!639481))

(assert (= (and b!639481 res!413930) b!639478))

(assert (= (and b!639478 res!413937) b!639483))

(assert (= (and b!639483 res!413929) b!639474))

(assert (= (and b!639474 res!413935) b!639477))

(assert (= (and b!639477 res!413941) b!639473))

(assert (= (and b!639477 c!73142) b!639485))

(assert (= (and b!639477 (not c!73142)) b!639480))

(assert (= (and b!639477 (not res!413926)) b!639484))

(assert (= (and b!639484 res!413934) b!639488))

(assert (= (and b!639488 (not res!413928)) b!639486))

(assert (= (and b!639486 res!413940) b!639479))

(assert (= (and b!639484 (not res!413931)) b!639490))

(declare-fun m!613717 () Bool)

(assert (=> b!639479 m!613717))

(assert (=> b!639479 m!613717))

(declare-fun m!613719 () Bool)

(assert (=> b!639479 m!613719))

(declare-fun m!613721 () Bool)

(assert (=> b!639489 m!613721))

(declare-fun m!613723 () Bool)

(assert (=> b!639481 m!613723))

(declare-fun m!613725 () Bool)

(assert (=> b!639477 m!613725))

(declare-fun m!613727 () Bool)

(assert (=> b!639477 m!613727))

(assert (=> b!639477 m!613717))

(declare-fun m!613729 () Bool)

(assert (=> b!639477 m!613729))

(assert (=> b!639477 m!613717))

(declare-fun m!613731 () Bool)

(assert (=> b!639477 m!613731))

(declare-fun m!613733 () Bool)

(assert (=> b!639477 m!613733))

(declare-fun m!613735 () Bool)

(assert (=> b!639477 m!613735))

(declare-fun m!613737 () Bool)

(assert (=> b!639477 m!613737))

(assert (=> b!639490 m!613717))

(assert (=> b!639490 m!613717))

(declare-fun m!613739 () Bool)

(assert (=> b!639490 m!613739))

(assert (=> b!639490 m!613717))

(declare-fun m!613741 () Bool)

(assert (=> b!639490 m!613741))

(declare-fun m!613743 () Bool)

(assert (=> b!639490 m!613743))

(declare-fun m!613745 () Bool)

(assert (=> b!639490 m!613745))

(declare-fun m!613747 () Bool)

(assert (=> b!639472 m!613747))

(declare-fun m!613749 () Bool)

(assert (=> b!639476 m!613749))

(assert (=> b!639483 m!613729))

(declare-fun m!613751 () Bool)

(assert (=> b!639483 m!613751))

(assert (=> b!639486 m!613717))

(assert (=> b!639486 m!613717))

(declare-fun m!613753 () Bool)

(assert (=> b!639486 m!613753))

(declare-fun m!613755 () Bool)

(assert (=> start!57864 m!613755))

(declare-fun m!613757 () Bool)

(assert (=> start!57864 m!613757))

(declare-fun m!613759 () Bool)

(assert (=> b!639478 m!613759))

(declare-fun m!613761 () Bool)

(assert (=> b!639475 m!613761))

(declare-fun m!613763 () Bool)

(assert (=> b!639474 m!613763))

(assert (=> b!639474 m!613717))

(assert (=> b!639474 m!613717))

(declare-fun m!613765 () Bool)

(assert (=> b!639474 m!613765))

(assert (=> b!639482 m!613717))

(assert (=> b!639482 m!613717))

(declare-fun m!613767 () Bool)

(assert (=> b!639482 m!613767))

(assert (=> b!639484 m!613717))

(assert (=> b!639484 m!613729))

(declare-fun m!613769 () Bool)

(assert (=> b!639484 m!613769))

(assert (=> b!639488 m!613717))

(check-sat (not b!639479) (not b!639476) (not b!639490) (not start!57864) (not b!639482) (not b!639474) (not b!639475) (not b!639489) (not b!639472) (not b!639477) (not b!639481) (not b!639486))
(check-sat)
