; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58978 () Bool)

(assert start!58978)

(declare-fun b!650428 () Bool)

(declare-fun e!373153 () Bool)

(assert (=> b!650428 (= e!373153 true)))

(declare-datatypes ((array!38559 0))(
  ( (array!38560 (arr!18484 (Array (_ BitVec 32) (_ BitVec 64))) (size!18848 (_ BitVec 32))) )
))
(declare-fun lt!302195 () array!38559)

(declare-datatypes ((List!12525 0))(
  ( (Nil!12522) (Cons!12521 (h!13566 (_ BitVec 64)) (t!18753 List!12525)) )
))
(declare-fun arrayNoDuplicates!0 (array!38559 (_ BitVec 32) List!12525) Bool)

(assert (=> b!650428 (arrayNoDuplicates!0 lt!302195 #b00000000000000000000000000000000 Nil!12522)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((Unit!22170 0))(
  ( (Unit!22171) )
))
(declare-fun lt!302203 () Unit!22170)

(declare-fun a!2986 () array!38559)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38559 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12525) Unit!22170)

(assert (=> b!650428 (= lt!302203 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12522))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650428 (arrayContainsKey!0 lt!302195 (select (arr!18484 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302201 () Unit!22170)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38559 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22170)

(assert (=> b!650428 (= lt!302201 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302195 (select (arr!18484 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!373152 () Bool)

(assert (=> b!650428 e!373152))

(declare-fun res!421621 () Bool)

(assert (=> b!650428 (=> (not res!421621) (not e!373152))))

(assert (=> b!650428 (= res!421621 (arrayContainsKey!0 lt!302195 (select (arr!18484 a!2986) j!136) j!136))))

(declare-fun b!650429 () Bool)

(declare-fun e!373161 () Bool)

(declare-fun e!373157 () Bool)

(assert (=> b!650429 (= e!373161 (not e!373157))))

(declare-fun res!421616 () Bool)

(assert (=> b!650429 (=> res!421616 e!373157)))

(declare-datatypes ((SeekEntryResult!6924 0))(
  ( (MissingZero!6924 (index!30046 (_ BitVec 32))) (Found!6924 (index!30047 (_ BitVec 32))) (Intermediate!6924 (undefined!7736 Bool) (index!30048 (_ BitVec 32)) (x!58834 (_ BitVec 32))) (Undefined!6924) (MissingVacant!6924 (index!30049 (_ BitVec 32))) )
))
(declare-fun lt!302199 () SeekEntryResult!6924)

(assert (=> b!650429 (= res!421616 (not (= lt!302199 (Found!6924 index!984))))))

(declare-fun lt!302193 () Unit!22170)

(declare-fun e!373158 () Unit!22170)

(assert (=> b!650429 (= lt!302193 e!373158)))

(declare-fun c!74779 () Bool)

(assert (=> b!650429 (= c!74779 (= lt!302199 Undefined!6924))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!302200 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38559 (_ BitVec 32)) SeekEntryResult!6924)

(assert (=> b!650429 (= lt!302199 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302200 lt!302195 mask!3053))))

(declare-fun e!373150 () Bool)

(assert (=> b!650429 e!373150))

(declare-fun res!421611 () Bool)

(assert (=> b!650429 (=> (not res!421611) (not e!373150))))

(declare-fun lt!302198 () SeekEntryResult!6924)

(declare-fun lt!302191 () (_ BitVec 32))

(assert (=> b!650429 (= res!421611 (= lt!302198 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302191 vacantSpotIndex!68 lt!302200 lt!302195 mask!3053)))))

(assert (=> b!650429 (= lt!302198 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302191 vacantSpotIndex!68 (select (arr!18484 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!650429 (= lt!302200 (select (store (arr!18484 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!302202 () Unit!22170)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38559 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22170)

(assert (=> b!650429 (= lt!302202 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302191 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650429 (= lt!302191 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!650430 () Bool)

(declare-fun res!421614 () Bool)

(declare-fun e!373154 () Bool)

(assert (=> b!650430 (=> (not res!421614) (not e!373154))))

(assert (=> b!650430 (= res!421614 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650431 () Bool)

(declare-fun Unit!22172 () Unit!22170)

(assert (=> b!650431 (= e!373158 Unit!22172)))

(assert (=> b!650431 false))

(declare-fun b!650432 () Bool)

(declare-fun e!373160 () Bool)

(assert (=> b!650432 (= e!373157 e!373160)))

(declare-fun res!421604 () Bool)

(assert (=> b!650432 (=> res!421604 e!373160)))

(declare-fun lt!302194 () (_ BitVec 64))

(assert (=> b!650432 (= res!421604 (or (not (= (select (arr!18484 a!2986) j!136) lt!302200)) (not (= (select (arr!18484 a!2986) j!136) lt!302194))))))

(declare-fun e!373151 () Bool)

(assert (=> b!650432 e!373151))

(declare-fun res!421605 () Bool)

(assert (=> b!650432 (=> (not res!421605) (not e!373151))))

(assert (=> b!650432 (= res!421605 (= lt!302194 (select (arr!18484 a!2986) j!136)))))

(assert (=> b!650432 (= lt!302194 (select (store (arr!18484 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!650433 () Bool)

(declare-fun res!421620 () Bool)

(assert (=> b!650433 (=> (not res!421620) (not e!373154))))

(assert (=> b!650433 (= res!421620 (and (= (size!18848 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18848 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18848 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!650434 () Bool)

(declare-fun res!421607 () Bool)

(assert (=> b!650434 (=> (not res!421607) (not e!373154))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650434 (= res!421607 (validKeyInArray!0 k0!1786))))

(declare-fun b!650435 () Bool)

(declare-fun Unit!22173 () Unit!22170)

(assert (=> b!650435 (= e!373158 Unit!22173)))

(declare-fun e!373155 () Bool)

(declare-fun b!650436 () Bool)

(assert (=> b!650436 (= e!373155 (arrayContainsKey!0 lt!302195 (select (arr!18484 a!2986) j!136) index!984))))

(declare-fun b!650437 () Bool)

(declare-fun e!373147 () Unit!22170)

(declare-fun Unit!22174 () Unit!22170)

(assert (=> b!650437 (= e!373147 Unit!22174)))

(declare-fun lt!302188 () Unit!22170)

(assert (=> b!650437 (= lt!302188 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302195 (select (arr!18484 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!650437 (arrayContainsKey!0 lt!302195 (select (arr!18484 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302196 () Unit!22170)

(assert (=> b!650437 (= lt!302196 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12522))))

(assert (=> b!650437 (arrayNoDuplicates!0 lt!302195 #b00000000000000000000000000000000 Nil!12522)))

(declare-fun lt!302187 () Unit!22170)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38559 (_ BitVec 32) (_ BitVec 32)) Unit!22170)

(assert (=> b!650437 (= lt!302187 (lemmaNoDuplicateFromThenFromBigger!0 lt!302195 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650437 (arrayNoDuplicates!0 lt!302195 j!136 Nil!12522)))

(declare-fun lt!302197 () Unit!22170)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38559 (_ BitVec 64) (_ BitVec 32) List!12525) Unit!22170)

(assert (=> b!650437 (= lt!302197 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302195 (select (arr!18484 a!2986) j!136) j!136 Nil!12522))))

(assert (=> b!650437 false))

(declare-fun res!421618 () Bool)

(assert (=> start!58978 (=> (not res!421618) (not e!373154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58978 (= res!421618 (validMask!0 mask!3053))))

(assert (=> start!58978 e!373154))

(assert (=> start!58978 true))

(declare-fun array_inv!14280 (array!38559) Bool)

(assert (=> start!58978 (array_inv!14280 a!2986)))

(declare-fun b!650438 () Bool)

(declare-fun e!373149 () Bool)

(assert (=> b!650438 (= e!373149 e!373161)))

(declare-fun res!421612 () Bool)

(assert (=> b!650438 (=> (not res!421612) (not e!373161))))

(declare-fun lt!302190 () SeekEntryResult!6924)

(assert (=> b!650438 (= res!421612 (and (= lt!302190 (Found!6924 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18484 a!2986) index!984) (select (arr!18484 a!2986) j!136))) (not (= (select (arr!18484 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!650438 (= lt!302190 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18484 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650439 () Bool)

(declare-fun e!373156 () Bool)

(assert (=> b!650439 (= e!373154 e!373156)))

(declare-fun res!421617 () Bool)

(assert (=> b!650439 (=> (not res!421617) (not e!373156))))

(declare-fun lt!302192 () SeekEntryResult!6924)

(assert (=> b!650439 (= res!421617 (or (= lt!302192 (MissingZero!6924 i!1108)) (= lt!302192 (MissingVacant!6924 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38559 (_ BitVec 32)) SeekEntryResult!6924)

(assert (=> b!650439 (= lt!302192 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!650440 () Bool)

(assert (=> b!650440 (= e!373150 (= lt!302190 lt!302198))))

(declare-fun b!650441 () Bool)

(declare-fun e!373159 () Bool)

(assert (=> b!650441 (= e!373159 e!373155)))

(declare-fun res!421622 () Bool)

(assert (=> b!650441 (=> (not res!421622) (not e!373155))))

(assert (=> b!650441 (= res!421622 (arrayContainsKey!0 lt!302195 (select (arr!18484 a!2986) j!136) j!136))))

(declare-fun b!650442 () Bool)

(declare-fun res!421615 () Bool)

(assert (=> b!650442 (=> (not res!421615) (not e!373156))))

(assert (=> b!650442 (= res!421615 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12522))))

(declare-fun b!650443 () Bool)

(assert (=> b!650443 (= e!373152 (arrayContainsKey!0 lt!302195 (select (arr!18484 a!2986) j!136) index!984))))

(declare-fun b!650444 () Bool)

(declare-fun Unit!22175 () Unit!22170)

(assert (=> b!650444 (= e!373147 Unit!22175)))

(declare-fun b!650445 () Bool)

(declare-fun res!421606 () Bool)

(assert (=> b!650445 (=> (not res!421606) (not e!373156))))

(assert (=> b!650445 (= res!421606 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18484 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!650446 () Bool)

(assert (=> b!650446 (= e!373151 e!373159)))

(declare-fun res!421610 () Bool)

(assert (=> b!650446 (=> res!421610 e!373159)))

(assert (=> b!650446 (= res!421610 (or (not (= (select (arr!18484 a!2986) j!136) lt!302200)) (not (= (select (arr!18484 a!2986) j!136) lt!302194)) (bvsge j!136 index!984)))))

(declare-fun b!650447 () Bool)

(assert (=> b!650447 (= e!373156 e!373149)))

(declare-fun res!421608 () Bool)

(assert (=> b!650447 (=> (not res!421608) (not e!373149))))

(assert (=> b!650447 (= res!421608 (= (select (store (arr!18484 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650447 (= lt!302195 (array!38560 (store (arr!18484 a!2986) i!1108 k0!1786) (size!18848 a!2986)))))

(declare-fun b!650448 () Bool)

(declare-fun res!421609 () Bool)

(assert (=> b!650448 (=> (not res!421609) (not e!373154))))

(assert (=> b!650448 (= res!421609 (validKeyInArray!0 (select (arr!18484 a!2986) j!136)))))

(declare-fun b!650449 () Bool)

(declare-fun res!421613 () Bool)

(assert (=> b!650449 (=> (not res!421613) (not e!373156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38559 (_ BitVec 32)) Bool)

(assert (=> b!650449 (= res!421613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!650450 () Bool)

(assert (=> b!650450 (= e!373160 e!373153)))

(declare-fun res!421619 () Bool)

(assert (=> b!650450 (=> res!421619 e!373153)))

(assert (=> b!650450 (= res!421619 (bvsge index!984 j!136))))

(declare-fun lt!302189 () Unit!22170)

(assert (=> b!650450 (= lt!302189 e!373147)))

(declare-fun c!74780 () Bool)

(assert (=> b!650450 (= c!74780 (bvslt j!136 index!984))))

(assert (= (and start!58978 res!421618) b!650433))

(assert (= (and b!650433 res!421620) b!650448))

(assert (= (and b!650448 res!421609) b!650434))

(assert (= (and b!650434 res!421607) b!650430))

(assert (= (and b!650430 res!421614) b!650439))

(assert (= (and b!650439 res!421617) b!650449))

(assert (= (and b!650449 res!421613) b!650442))

(assert (= (and b!650442 res!421615) b!650445))

(assert (= (and b!650445 res!421606) b!650447))

(assert (= (and b!650447 res!421608) b!650438))

(assert (= (and b!650438 res!421612) b!650429))

(assert (= (and b!650429 res!421611) b!650440))

(assert (= (and b!650429 c!74779) b!650431))

(assert (= (and b!650429 (not c!74779)) b!650435))

(assert (= (and b!650429 (not res!421616)) b!650432))

(assert (= (and b!650432 res!421605) b!650446))

(assert (= (and b!650446 (not res!421610)) b!650441))

(assert (= (and b!650441 res!421622) b!650436))

(assert (= (and b!650432 (not res!421604)) b!650450))

(assert (= (and b!650450 c!74780) b!650437))

(assert (= (and b!650450 (not c!74780)) b!650444))

(assert (= (and b!650450 (not res!421619)) b!650428))

(assert (= (and b!650428 res!421621) b!650443))

(declare-fun m!623631 () Bool)

(assert (=> b!650441 m!623631))

(assert (=> b!650441 m!623631))

(declare-fun m!623633 () Bool)

(assert (=> b!650441 m!623633))

(declare-fun m!623635 () Bool)

(assert (=> b!650442 m!623635))

(assert (=> b!650432 m!623631))

(declare-fun m!623637 () Bool)

(assert (=> b!650432 m!623637))

(declare-fun m!623639 () Bool)

(assert (=> b!650432 m!623639))

(declare-fun m!623641 () Bool)

(assert (=> start!58978 m!623641))

(declare-fun m!623643 () Bool)

(assert (=> start!58978 m!623643))

(assert (=> b!650436 m!623631))

(assert (=> b!650436 m!623631))

(declare-fun m!623645 () Bool)

(assert (=> b!650436 m!623645))

(assert (=> b!650437 m!623631))

(declare-fun m!623647 () Bool)

(assert (=> b!650437 m!623647))

(assert (=> b!650437 m!623631))

(assert (=> b!650437 m!623631))

(declare-fun m!623649 () Bool)

(assert (=> b!650437 m!623649))

(declare-fun m!623651 () Bool)

(assert (=> b!650437 m!623651))

(declare-fun m!623653 () Bool)

(assert (=> b!650437 m!623653))

(assert (=> b!650437 m!623631))

(declare-fun m!623655 () Bool)

(assert (=> b!650437 m!623655))

(declare-fun m!623657 () Bool)

(assert (=> b!650437 m!623657))

(declare-fun m!623659 () Bool)

(assert (=> b!650437 m!623659))

(declare-fun m!623661 () Bool)

(assert (=> b!650438 m!623661))

(assert (=> b!650438 m!623631))

(assert (=> b!650438 m!623631))

(declare-fun m!623663 () Bool)

(assert (=> b!650438 m!623663))

(declare-fun m!623665 () Bool)

(assert (=> b!650445 m!623665))

(declare-fun m!623667 () Bool)

(assert (=> b!650439 m!623667))

(declare-fun m!623669 () Bool)

(assert (=> b!650434 m!623669))

(assert (=> b!650448 m!623631))

(assert (=> b!650448 m!623631))

(declare-fun m!623671 () Bool)

(assert (=> b!650448 m!623671))

(assert (=> b!650428 m!623631))

(declare-fun m!623673 () Bool)

(assert (=> b!650428 m!623673))

(assert (=> b!650428 m!623631))

(assert (=> b!650428 m!623653))

(assert (=> b!650428 m!623631))

(assert (=> b!650428 m!623633))

(assert (=> b!650428 m!623631))

(declare-fun m!623675 () Bool)

(assert (=> b!650428 m!623675))

(assert (=> b!650428 m!623659))

(declare-fun m!623677 () Bool)

(assert (=> b!650430 m!623677))

(assert (=> b!650446 m!623631))

(assert (=> b!650447 m!623637))

(declare-fun m!623679 () Bool)

(assert (=> b!650447 m!623679))

(declare-fun m!623681 () Bool)

(assert (=> b!650449 m!623681))

(declare-fun m!623683 () Bool)

(assert (=> b!650429 m!623683))

(assert (=> b!650429 m!623637))

(declare-fun m!623685 () Bool)

(assert (=> b!650429 m!623685))

(declare-fun m!623687 () Bool)

(assert (=> b!650429 m!623687))

(declare-fun m!623689 () Bool)

(assert (=> b!650429 m!623689))

(assert (=> b!650429 m!623631))

(declare-fun m!623691 () Bool)

(assert (=> b!650429 m!623691))

(assert (=> b!650429 m!623631))

(declare-fun m!623693 () Bool)

(assert (=> b!650429 m!623693))

(assert (=> b!650443 m!623631))

(assert (=> b!650443 m!623631))

(assert (=> b!650443 m!623645))

(check-sat (not b!650441) (not b!650436) (not b!650429) (not b!650428) (not b!650443) (not b!650442) (not b!650437) (not b!650430) (not start!58978) (not b!650438) (not b!650449) (not b!650439) (not b!650434) (not b!650448))
(check-sat)
