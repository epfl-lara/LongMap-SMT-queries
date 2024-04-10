; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56060 () Bool)

(assert start!56060)

(declare-fun b!617573 () Bool)

(declare-fun e!354139 () Bool)

(declare-fun e!354137 () Bool)

(assert (=> b!617573 (= e!354139 e!354137)))

(declare-fun res!397864 () Bool)

(assert (=> b!617573 (=> (not res!397864) (not e!354137))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37530 0))(
  ( (array!37531 (arr!18011 (Array (_ BitVec 32) (_ BitVec 64))) (size!18375 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37530)

(assert (=> b!617573 (= res!397864 (= (select (store (arr!18011 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!284425 () array!37530)

(assert (=> b!617573 (= lt!284425 (array!37531 (store (arr!18011 a!2986) i!1108 k!1786) (size!18375 a!2986)))))

(declare-fun b!617574 () Bool)

(declare-fun res!397856 () Bool)

(assert (=> b!617574 (=> (not res!397856) (not e!354139))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!617574 (= res!397856 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18011 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617575 () Bool)

(declare-fun res!397861 () Bool)

(declare-fun e!354146 () Bool)

(assert (=> b!617575 (=> (not res!397861) (not e!354146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617575 (= res!397861 (validKeyInArray!0 k!1786))))

(declare-fun b!617576 () Bool)

(declare-fun res!397855 () Bool)

(assert (=> b!617576 (=> (not res!397855) (not e!354139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37530 (_ BitVec 32)) Bool)

(assert (=> b!617576 (= res!397855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617577 () Bool)

(declare-datatypes ((Unit!20238 0))(
  ( (Unit!20239) )
))
(declare-fun e!354136 () Unit!20238)

(declare-fun Unit!20240 () Unit!20238)

(assert (=> b!617577 (= e!354136 Unit!20240)))

(declare-fun b!617578 () Bool)

(declare-fun e!354140 () Bool)

(declare-fun e!354138 () Bool)

(assert (=> b!617578 (= e!354140 (not e!354138))))

(declare-fun res!397857 () Bool)

(assert (=> b!617578 (=> res!397857 e!354138)))

(declare-datatypes ((SeekEntryResult!6451 0))(
  ( (MissingZero!6451 (index!28088 (_ BitVec 32))) (Found!6451 (index!28089 (_ BitVec 32))) (Intermediate!6451 (undefined!7263 Bool) (index!28090 (_ BitVec 32)) (x!56875 (_ BitVec 32))) (Undefined!6451) (MissingVacant!6451 (index!28091 (_ BitVec 32))) )
))
(declare-fun lt!284436 () SeekEntryResult!6451)

(assert (=> b!617578 (= res!397857 (not (= lt!284436 (MissingVacant!6451 vacantSpotIndex!68))))))

(declare-fun lt!284430 () Unit!20238)

(declare-fun e!354143 () Unit!20238)

(assert (=> b!617578 (= lt!284430 e!354143)))

(declare-fun c!70228 () Bool)

(assert (=> b!617578 (= c!70228 (= lt!284436 (Found!6451 index!984)))))

(declare-fun lt!284435 () Unit!20238)

(assert (=> b!617578 (= lt!284435 e!354136)))

(declare-fun c!70227 () Bool)

(assert (=> b!617578 (= c!70227 (= lt!284436 Undefined!6451))))

(declare-fun lt!284431 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37530 (_ BitVec 32)) SeekEntryResult!6451)

(assert (=> b!617578 (= lt!284436 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284431 lt!284425 mask!3053))))

(declare-fun e!354145 () Bool)

(assert (=> b!617578 e!354145))

(declare-fun res!397860 () Bool)

(assert (=> b!617578 (=> (not res!397860) (not e!354145))))

(declare-fun lt!284424 () SeekEntryResult!6451)

(declare-fun lt!284423 () (_ BitVec 32))

(assert (=> b!617578 (= res!397860 (= lt!284424 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284423 vacantSpotIndex!68 lt!284431 lt!284425 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!617578 (= lt!284424 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284423 vacantSpotIndex!68 (select (arr!18011 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617578 (= lt!284431 (select (store (arr!18011 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!284433 () Unit!20238)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37530 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20238)

(assert (=> b!617578 (= lt!284433 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284423 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617578 (= lt!284423 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!617579 () Bool)

(declare-fun e!354144 () Bool)

(declare-fun arrayContainsKey!0 (array!37530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617579 (= e!354144 (arrayContainsKey!0 lt!284425 (select (arr!18011 a!2986) j!136) index!984))))

(declare-fun res!397867 () Bool)

(assert (=> start!56060 (=> (not res!397867) (not e!354146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56060 (= res!397867 (validMask!0 mask!3053))))

(assert (=> start!56060 e!354146))

(assert (=> start!56060 true))

(declare-fun array_inv!13807 (array!37530) Bool)

(assert (=> start!56060 (array_inv!13807 a!2986)))

(declare-fun b!617580 () Bool)

(declare-fun lt!284427 () SeekEntryResult!6451)

(assert (=> b!617580 (= e!354145 (= lt!284427 lt!284424))))

(declare-fun b!617581 () Bool)

(declare-fun e!354135 () Unit!20238)

(declare-fun Unit!20241 () Unit!20238)

(assert (=> b!617581 (= e!354135 Unit!20241)))

(declare-fun b!617582 () Bool)

(declare-fun Unit!20242 () Unit!20238)

(assert (=> b!617582 (= e!354143 Unit!20242)))

(declare-fun b!617583 () Bool)

(declare-fun res!397870 () Bool)

(assert (=> b!617583 (=> (not res!397870) (not e!354146))))

(assert (=> b!617583 (= res!397870 (and (= (size!18375 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18375 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18375 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617584 () Bool)

(assert (=> b!617584 (= e!354146 e!354139)))

(declare-fun res!397871 () Bool)

(assert (=> b!617584 (=> (not res!397871) (not e!354139))))

(declare-fun lt!284434 () SeekEntryResult!6451)

(assert (=> b!617584 (= res!397871 (or (= lt!284434 (MissingZero!6451 i!1108)) (= lt!284434 (MissingVacant!6451 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37530 (_ BitVec 32)) SeekEntryResult!6451)

(assert (=> b!617584 (= lt!284434 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!617585 () Bool)

(declare-fun res!397866 () Bool)

(assert (=> b!617585 (= res!397866 (bvsge j!136 index!984))))

(declare-fun e!354142 () Bool)

(assert (=> b!617585 (=> res!397866 e!354142)))

(declare-fun e!354141 () Bool)

(assert (=> b!617585 (= e!354141 e!354142)))

(declare-fun b!617586 () Bool)

(declare-fun Unit!20243 () Unit!20238)

(assert (=> b!617586 (= e!354136 Unit!20243)))

(assert (=> b!617586 false))

(declare-fun b!617587 () Bool)

(assert (=> b!617587 false))

(declare-fun lt!284422 () Unit!20238)

(declare-datatypes ((List!12052 0))(
  ( (Nil!12049) (Cons!12048 (h!13093 (_ BitVec 64)) (t!18280 List!12052)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37530 (_ BitVec 64) (_ BitVec 32) List!12052) Unit!20238)

(assert (=> b!617587 (= lt!284422 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284425 (select (arr!18011 a!2986) j!136) j!136 Nil!12049))))

(declare-fun arrayNoDuplicates!0 (array!37530 (_ BitVec 32) List!12052) Bool)

(assert (=> b!617587 (arrayNoDuplicates!0 lt!284425 j!136 Nil!12049)))

(declare-fun lt!284428 () Unit!20238)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37530 (_ BitVec 32) (_ BitVec 32)) Unit!20238)

(assert (=> b!617587 (= lt!284428 (lemmaNoDuplicateFromThenFromBigger!0 lt!284425 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617587 (arrayNoDuplicates!0 lt!284425 #b00000000000000000000000000000000 Nil!12049)))

(declare-fun lt!284429 () Unit!20238)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37530 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12052) Unit!20238)

(assert (=> b!617587 (= lt!284429 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12049))))

(assert (=> b!617587 (arrayContainsKey!0 lt!284425 (select (arr!18011 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284437 () Unit!20238)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37530 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20238)

(assert (=> b!617587 (= lt!284437 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284425 (select (arr!18011 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20244 () Unit!20238)

(assert (=> b!617587 (= e!354135 Unit!20244)))

(declare-fun res!397869 () Bool)

(declare-fun b!617588 () Bool)

(assert (=> b!617588 (= res!397869 (arrayContainsKey!0 lt!284425 (select (arr!18011 a!2986) j!136) j!136))))

(declare-fun e!354147 () Bool)

(assert (=> b!617588 (=> (not res!397869) (not e!354147))))

(assert (=> b!617588 (= e!354142 e!354147)))

(declare-fun b!617589 () Bool)

(assert (=> b!617589 (= e!354137 e!354140)))

(declare-fun res!397863 () Bool)

(assert (=> b!617589 (=> (not res!397863) (not e!354140))))

(assert (=> b!617589 (= res!397863 (and (= lt!284427 (Found!6451 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18011 a!2986) index!984) (select (arr!18011 a!2986) j!136))) (not (= (select (arr!18011 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!617589 (= lt!284427 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18011 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617590 () Bool)

(declare-fun e!354134 () Unit!20238)

(declare-fun Unit!20245 () Unit!20238)

(assert (=> b!617590 (= e!354134 Unit!20245)))

(declare-fun b!617591 () Bool)

(assert (=> b!617591 (= e!354147 (arrayContainsKey!0 lt!284425 (select (arr!18011 a!2986) j!136) index!984))))

(declare-fun b!617592 () Bool)

(declare-fun Unit!20246 () Unit!20238)

(assert (=> b!617592 (= e!354143 Unit!20246)))

(declare-fun res!397865 () Bool)

(assert (=> b!617592 (= res!397865 (= (select (store (arr!18011 a!2986) i!1108 k!1786) index!984) (select (arr!18011 a!2986) j!136)))))

(assert (=> b!617592 (=> (not res!397865) (not e!354141))))

(assert (=> b!617592 e!354141))

(declare-fun c!70229 () Bool)

(assert (=> b!617592 (= c!70229 (bvslt j!136 index!984))))

(declare-fun lt!284419 () Unit!20238)

(assert (=> b!617592 (= lt!284419 e!354135)))

(declare-fun c!70226 () Bool)

(assert (=> b!617592 (= c!70226 (bvslt index!984 j!136))))

(declare-fun lt!284426 () Unit!20238)

(assert (=> b!617592 (= lt!284426 e!354134)))

(assert (=> b!617592 false))

(declare-fun b!617593 () Bool)

(assert (=> b!617593 false))

(declare-fun lt!284420 () Unit!20238)

(assert (=> b!617593 (= lt!284420 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284425 (select (arr!18011 a!2986) j!136) index!984 Nil!12049))))

(assert (=> b!617593 (arrayNoDuplicates!0 lt!284425 index!984 Nil!12049)))

(declare-fun lt!284418 () Unit!20238)

(assert (=> b!617593 (= lt!284418 (lemmaNoDuplicateFromThenFromBigger!0 lt!284425 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617593 (arrayNoDuplicates!0 lt!284425 #b00000000000000000000000000000000 Nil!12049)))

(declare-fun lt!284432 () Unit!20238)

(assert (=> b!617593 (= lt!284432 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12049))))

(assert (=> b!617593 (arrayContainsKey!0 lt!284425 (select (arr!18011 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284421 () Unit!20238)

(assert (=> b!617593 (= lt!284421 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284425 (select (arr!18011 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!617593 e!354144))

(declare-fun res!397859 () Bool)

(assert (=> b!617593 (=> (not res!397859) (not e!354144))))

(assert (=> b!617593 (= res!397859 (arrayContainsKey!0 lt!284425 (select (arr!18011 a!2986) j!136) j!136))))

(declare-fun Unit!20247 () Unit!20238)

(assert (=> b!617593 (= e!354134 Unit!20247)))

(declare-fun b!617594 () Bool)

(declare-fun res!397858 () Bool)

(assert (=> b!617594 (=> (not res!397858) (not e!354146))))

(assert (=> b!617594 (= res!397858 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617595 () Bool)

(declare-fun res!397868 () Bool)

(assert (=> b!617595 (=> (not res!397868) (not e!354139))))

(assert (=> b!617595 (= res!397868 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12049))))

(declare-fun b!617596 () Bool)

(declare-fun res!397862 () Bool)

(assert (=> b!617596 (=> (not res!397862) (not e!354146))))

(assert (=> b!617596 (= res!397862 (validKeyInArray!0 (select (arr!18011 a!2986) j!136)))))

(declare-fun b!617597 () Bool)

(assert (=> b!617597 (= e!354138 true)))

(assert (=> b!617597 (= (select (store (arr!18011 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and start!56060 res!397867) b!617583))

(assert (= (and b!617583 res!397870) b!617596))

(assert (= (and b!617596 res!397862) b!617575))

(assert (= (and b!617575 res!397861) b!617594))

(assert (= (and b!617594 res!397858) b!617584))

(assert (= (and b!617584 res!397871) b!617576))

(assert (= (and b!617576 res!397855) b!617595))

(assert (= (and b!617595 res!397868) b!617574))

(assert (= (and b!617574 res!397856) b!617573))

(assert (= (and b!617573 res!397864) b!617589))

(assert (= (and b!617589 res!397863) b!617578))

(assert (= (and b!617578 res!397860) b!617580))

(assert (= (and b!617578 c!70227) b!617586))

(assert (= (and b!617578 (not c!70227)) b!617577))

(assert (= (and b!617578 c!70228) b!617592))

(assert (= (and b!617578 (not c!70228)) b!617582))

(assert (= (and b!617592 res!397865) b!617585))

(assert (= (and b!617585 (not res!397866)) b!617588))

(assert (= (and b!617588 res!397869) b!617591))

(assert (= (and b!617592 c!70229) b!617587))

(assert (= (and b!617592 (not c!70229)) b!617581))

(assert (= (and b!617592 c!70226) b!617593))

(assert (= (and b!617592 (not c!70226)) b!617590))

(assert (= (and b!617593 res!397859) b!617579))

(assert (= (and b!617578 (not res!397857)) b!617597))

(declare-fun m!593671 () Bool)

(assert (=> b!617592 m!593671))

(declare-fun m!593673 () Bool)

(assert (=> b!617592 m!593673))

(declare-fun m!593675 () Bool)

(assert (=> b!617592 m!593675))

(assert (=> b!617588 m!593675))

(assert (=> b!617588 m!593675))

(declare-fun m!593677 () Bool)

(assert (=> b!617588 m!593677))

(declare-fun m!593679 () Bool)

(assert (=> b!617587 m!593679))

(declare-fun m!593681 () Bool)

(assert (=> b!617587 m!593681))

(assert (=> b!617587 m!593675))

(declare-fun m!593683 () Bool)

(assert (=> b!617587 m!593683))

(assert (=> b!617587 m!593675))

(declare-fun m!593685 () Bool)

(assert (=> b!617587 m!593685))

(declare-fun m!593687 () Bool)

(assert (=> b!617587 m!593687))

(declare-fun m!593689 () Bool)

(assert (=> b!617587 m!593689))

(assert (=> b!617587 m!593675))

(assert (=> b!617587 m!593675))

(declare-fun m!593691 () Bool)

(assert (=> b!617587 m!593691))

(declare-fun m!593693 () Bool)

(assert (=> b!617575 m!593693))

(declare-fun m!593695 () Bool)

(assert (=> b!617589 m!593695))

(assert (=> b!617589 m!593675))

(assert (=> b!617589 m!593675))

(declare-fun m!593697 () Bool)

(assert (=> b!617589 m!593697))

(assert (=> b!617578 m!593675))

(declare-fun m!593699 () Bool)

(assert (=> b!617578 m!593699))

(declare-fun m!593701 () Bool)

(assert (=> b!617578 m!593701))

(declare-fun m!593703 () Bool)

(assert (=> b!617578 m!593703))

(assert (=> b!617578 m!593675))

(assert (=> b!617578 m!593671))

(declare-fun m!593705 () Bool)

(assert (=> b!617578 m!593705))

(declare-fun m!593707 () Bool)

(assert (=> b!617578 m!593707))

(declare-fun m!593709 () Bool)

(assert (=> b!617578 m!593709))

(declare-fun m!593711 () Bool)

(assert (=> b!617594 m!593711))

(declare-fun m!593713 () Bool)

(assert (=> b!617574 m!593713))

(assert (=> b!617593 m!593675))

(declare-fun m!593715 () Bool)

(assert (=> b!617593 m!593715))

(declare-fun m!593717 () Bool)

(assert (=> b!617593 m!593717))

(assert (=> b!617593 m!593681))

(assert (=> b!617593 m!593675))

(assert (=> b!617593 m!593677))

(assert (=> b!617593 m!593675))

(assert (=> b!617593 m!593675))

(declare-fun m!593719 () Bool)

(assert (=> b!617593 m!593719))

(assert (=> b!617593 m!593689))

(assert (=> b!617593 m!593675))

(declare-fun m!593721 () Bool)

(assert (=> b!617593 m!593721))

(declare-fun m!593723 () Bool)

(assert (=> b!617593 m!593723))

(assert (=> b!617596 m!593675))

(assert (=> b!617596 m!593675))

(declare-fun m!593725 () Bool)

(assert (=> b!617596 m!593725))

(assert (=> b!617579 m!593675))

(assert (=> b!617579 m!593675))

(declare-fun m!593727 () Bool)

(assert (=> b!617579 m!593727))

(assert (=> b!617573 m!593671))

(declare-fun m!593729 () Bool)

(assert (=> b!617573 m!593729))

(declare-fun m!593731 () Bool)

(assert (=> b!617595 m!593731))

(assert (=> b!617591 m!593675))

(assert (=> b!617591 m!593675))

(assert (=> b!617591 m!593727))

(declare-fun m!593733 () Bool)

(assert (=> b!617576 m!593733))

(assert (=> b!617597 m!593671))

(assert (=> b!617597 m!593673))

(declare-fun m!593735 () Bool)

(assert (=> start!56060 m!593735))

(declare-fun m!593737 () Bool)

(assert (=> start!56060 m!593737))

(declare-fun m!593739 () Bool)

(assert (=> b!617584 m!593739))

(push 1)

