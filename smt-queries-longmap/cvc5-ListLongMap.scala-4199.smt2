; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57344 () Bool)

(assert start!57344)

(declare-fun b!634688 () Bool)

(declare-fun res!410540 () Bool)

(declare-fun e!362966 () Bool)

(assert (=> b!634688 (=> (not res!410540) (not e!362966))))

(declare-datatypes ((array!38197 0))(
  ( (array!38198 (arr!18327 (Array (_ BitVec 32) (_ BitVec 64))) (size!18691 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38197)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38197 (_ BitVec 32)) Bool)

(assert (=> b!634688 (= res!410540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634689 () Bool)

(declare-fun e!362963 () Bool)

(assert (=> b!634689 (= e!362966 e!362963)))

(declare-fun res!410545 () Bool)

(assert (=> b!634689 (=> (not res!410545) (not e!362963))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!634689 (= res!410545 (= (select (store (arr!18327 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!293420 () array!38197)

(assert (=> b!634689 (= lt!293420 (array!38198 (store (arr!18327 a!2986) i!1108 k!1786) (size!18691 a!2986)))))

(declare-fun b!634690 () Bool)

(declare-fun e!362960 () Bool)

(declare-datatypes ((SeekEntryResult!6767 0))(
  ( (MissingZero!6767 (index!29370 (_ BitVec 32))) (Found!6767 (index!29371 (_ BitVec 32))) (Intermediate!6767 (undefined!7579 Bool) (index!29372 (_ BitVec 32)) (x!58117 (_ BitVec 32))) (Undefined!6767) (MissingVacant!6767 (index!29373 (_ BitVec 32))) )
))
(declare-fun lt!293421 () SeekEntryResult!6767)

(declare-fun lt!293419 () SeekEntryResult!6767)

(assert (=> b!634690 (= e!362960 (= lt!293421 lt!293419))))

(declare-fun b!634691 () Bool)

(declare-fun res!410552 () Bool)

(declare-fun e!362964 () Bool)

(assert (=> b!634691 (=> (not res!410552) (not e!362964))))

(declare-fun arrayContainsKey!0 (array!38197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634691 (= res!410552 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634692 () Bool)

(declare-fun e!362957 () Bool)

(declare-fun e!362959 () Bool)

(assert (=> b!634692 (= e!362957 e!362959)))

(declare-fun res!410543 () Bool)

(assert (=> b!634692 (=> res!410543 e!362959)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!293418 () (_ BitVec 64))

(declare-fun lt!293413 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!634692 (= res!410543 (or (not (= (select (arr!18327 a!2986) j!136) lt!293413)) (not (= (select (arr!18327 a!2986) j!136) lt!293418)) (bvsge j!136 index!984)))))

(declare-fun e!362965 () Bool)

(assert (=> b!634692 e!362965))

(declare-fun res!410541 () Bool)

(assert (=> b!634692 (=> (not res!410541) (not e!362965))))

(assert (=> b!634692 (= res!410541 (= lt!293418 (select (arr!18327 a!2986) j!136)))))

(assert (=> b!634692 (= lt!293418 (select (store (arr!18327 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!634693 () Bool)

(declare-fun e!362967 () Bool)

(assert (=> b!634693 (= e!362967 (not e!362957))))

(declare-fun res!410551 () Bool)

(assert (=> b!634693 (=> res!410551 e!362957)))

(declare-fun lt!293412 () SeekEntryResult!6767)

(assert (=> b!634693 (= res!410551 (not (= lt!293412 (Found!6767 index!984))))))

(declare-datatypes ((Unit!21402 0))(
  ( (Unit!21403) )
))
(declare-fun lt!293415 () Unit!21402)

(declare-fun e!362962 () Unit!21402)

(assert (=> b!634693 (= lt!293415 e!362962)))

(declare-fun c!72443 () Bool)

(assert (=> b!634693 (= c!72443 (= lt!293412 Undefined!6767))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38197 (_ BitVec 32)) SeekEntryResult!6767)

(assert (=> b!634693 (= lt!293412 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293413 lt!293420 mask!3053))))

(assert (=> b!634693 e!362960))

(declare-fun res!410546 () Bool)

(assert (=> b!634693 (=> (not res!410546) (not e!362960))))

(declare-fun lt!293416 () (_ BitVec 32))

(assert (=> b!634693 (= res!410546 (= lt!293419 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293416 vacantSpotIndex!68 lt!293413 lt!293420 mask!3053)))))

(assert (=> b!634693 (= lt!293419 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293416 vacantSpotIndex!68 (select (arr!18327 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!634693 (= lt!293413 (select (store (arr!18327 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!293422 () Unit!21402)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38197 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21402)

(assert (=> b!634693 (= lt!293422 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293416 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634693 (= lt!293416 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!634694 () Bool)

(declare-fun res!410538 () Bool)

(assert (=> b!634694 (=> (not res!410538) (not e!362964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634694 (= res!410538 (validKeyInArray!0 k!1786))))

(declare-fun b!634695 () Bool)

(declare-fun e!362961 () Bool)

(declare-fun e!362958 () Bool)

(assert (=> b!634695 (= e!362961 e!362958)))

(declare-fun res!410549 () Bool)

(assert (=> b!634695 (=> (not res!410549) (not e!362958))))

(assert (=> b!634695 (= res!410549 (arrayContainsKey!0 lt!293420 (select (arr!18327 a!2986) j!136) j!136))))

(declare-fun b!634696 () Bool)

(assert (=> b!634696 (= e!362965 e!362961)))

(declare-fun res!410550 () Bool)

(assert (=> b!634696 (=> res!410550 e!362961)))

(assert (=> b!634696 (= res!410550 (or (not (= (select (arr!18327 a!2986) j!136) lt!293413)) (not (= (select (arr!18327 a!2986) j!136) lt!293418)) (bvsge j!136 index!984)))))

(declare-fun b!634698 () Bool)

(assert (=> b!634698 (= e!362963 e!362967)))

(declare-fun res!410544 () Bool)

(assert (=> b!634698 (=> (not res!410544) (not e!362967))))

(assert (=> b!634698 (= res!410544 (and (= lt!293421 (Found!6767 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18327 a!2986) index!984) (select (arr!18327 a!2986) j!136))) (not (= (select (arr!18327 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!634698 (= lt!293421 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18327 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634699 () Bool)

(assert (=> b!634699 (= e!362958 (arrayContainsKey!0 lt!293420 (select (arr!18327 a!2986) j!136) index!984))))

(declare-fun b!634700 () Bool)

(declare-fun res!410537 () Bool)

(assert (=> b!634700 (=> (not res!410537) (not e!362966))))

(declare-datatypes ((List!12368 0))(
  ( (Nil!12365) (Cons!12364 (h!13409 (_ BitVec 64)) (t!18596 List!12368)) )
))
(declare-fun arrayNoDuplicates!0 (array!38197 (_ BitVec 32) List!12368) Bool)

(assert (=> b!634700 (= res!410537 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12365))))

(declare-fun b!634701 () Bool)

(assert (=> b!634701 (= e!362964 e!362966)))

(declare-fun res!410542 () Bool)

(assert (=> b!634701 (=> (not res!410542) (not e!362966))))

(declare-fun lt!293414 () SeekEntryResult!6767)

(assert (=> b!634701 (= res!410542 (or (= lt!293414 (MissingZero!6767 i!1108)) (= lt!293414 (MissingVacant!6767 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38197 (_ BitVec 32)) SeekEntryResult!6767)

(assert (=> b!634701 (= lt!293414 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!634702 () Bool)

(declare-fun Unit!21404 () Unit!21402)

(assert (=> b!634702 (= e!362962 Unit!21404)))

(declare-fun b!634703 () Bool)

(declare-fun res!410548 () Bool)

(assert (=> b!634703 (=> (not res!410548) (not e!362966))))

(assert (=> b!634703 (= res!410548 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18327 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634704 () Bool)

(assert (=> b!634704 (= e!362959 true)))

(assert (=> b!634704 (arrayContainsKey!0 lt!293420 (select (arr!18327 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293417 () Unit!21402)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38197 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21402)

(assert (=> b!634704 (= lt!293417 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293420 (select (arr!18327 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!634697 () Bool)

(declare-fun res!410536 () Bool)

(assert (=> b!634697 (=> (not res!410536) (not e!362964))))

(assert (=> b!634697 (= res!410536 (and (= (size!18691 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18691 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18691 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!410547 () Bool)

(assert (=> start!57344 (=> (not res!410547) (not e!362964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57344 (= res!410547 (validMask!0 mask!3053))))

(assert (=> start!57344 e!362964))

(assert (=> start!57344 true))

(declare-fun array_inv!14123 (array!38197) Bool)

(assert (=> start!57344 (array_inv!14123 a!2986)))

(declare-fun b!634705 () Bool)

(declare-fun res!410539 () Bool)

(assert (=> b!634705 (=> (not res!410539) (not e!362964))))

(assert (=> b!634705 (= res!410539 (validKeyInArray!0 (select (arr!18327 a!2986) j!136)))))

(declare-fun b!634706 () Bool)

(declare-fun Unit!21405 () Unit!21402)

(assert (=> b!634706 (= e!362962 Unit!21405)))

(assert (=> b!634706 false))

(assert (= (and start!57344 res!410547) b!634697))

(assert (= (and b!634697 res!410536) b!634705))

(assert (= (and b!634705 res!410539) b!634694))

(assert (= (and b!634694 res!410538) b!634691))

(assert (= (and b!634691 res!410552) b!634701))

(assert (= (and b!634701 res!410542) b!634688))

(assert (= (and b!634688 res!410540) b!634700))

(assert (= (and b!634700 res!410537) b!634703))

(assert (= (and b!634703 res!410548) b!634689))

(assert (= (and b!634689 res!410545) b!634698))

(assert (= (and b!634698 res!410544) b!634693))

(assert (= (and b!634693 res!410546) b!634690))

(assert (= (and b!634693 c!72443) b!634706))

(assert (= (and b!634693 (not c!72443)) b!634702))

(assert (= (and b!634693 (not res!410551)) b!634692))

(assert (= (and b!634692 res!410541) b!634696))

(assert (= (and b!634696 (not res!410550)) b!634695))

(assert (= (and b!634695 res!410549) b!634699))

(assert (= (and b!634692 (not res!410543)) b!634704))

(declare-fun m!609143 () Bool)

(assert (=> b!634699 m!609143))

(assert (=> b!634699 m!609143))

(declare-fun m!609145 () Bool)

(assert (=> b!634699 m!609145))

(assert (=> b!634695 m!609143))

(assert (=> b!634695 m!609143))

(declare-fun m!609147 () Bool)

(assert (=> b!634695 m!609147))

(declare-fun m!609149 () Bool)

(assert (=> b!634701 m!609149))

(declare-fun m!609151 () Bool)

(assert (=> b!634691 m!609151))

(declare-fun m!609153 () Bool)

(assert (=> b!634689 m!609153))

(declare-fun m!609155 () Bool)

(assert (=> b!634689 m!609155))

(declare-fun m!609157 () Bool)

(assert (=> b!634688 m!609157))

(declare-fun m!609159 () Bool)

(assert (=> b!634693 m!609159))

(declare-fun m!609161 () Bool)

(assert (=> b!634693 m!609161))

(assert (=> b!634693 m!609143))

(assert (=> b!634693 m!609143))

(declare-fun m!609163 () Bool)

(assert (=> b!634693 m!609163))

(assert (=> b!634693 m!609153))

(declare-fun m!609165 () Bool)

(assert (=> b!634693 m!609165))

(declare-fun m!609167 () Bool)

(assert (=> b!634693 m!609167))

(declare-fun m!609169 () Bool)

(assert (=> b!634693 m!609169))

(declare-fun m!609171 () Bool)

(assert (=> b!634694 m!609171))

(assert (=> b!634696 m!609143))

(declare-fun m!609173 () Bool)

(assert (=> b!634700 m!609173))

(declare-fun m!609175 () Bool)

(assert (=> b!634698 m!609175))

(assert (=> b!634698 m!609143))

(assert (=> b!634698 m!609143))

(declare-fun m!609177 () Bool)

(assert (=> b!634698 m!609177))

(assert (=> b!634704 m!609143))

(assert (=> b!634704 m!609143))

(declare-fun m!609179 () Bool)

(assert (=> b!634704 m!609179))

(assert (=> b!634704 m!609143))

(declare-fun m!609181 () Bool)

(assert (=> b!634704 m!609181))

(assert (=> b!634705 m!609143))

(assert (=> b!634705 m!609143))

(declare-fun m!609183 () Bool)

(assert (=> b!634705 m!609183))

(declare-fun m!609185 () Bool)

(assert (=> b!634703 m!609185))

(declare-fun m!609187 () Bool)

(assert (=> start!57344 m!609187))

(declare-fun m!609189 () Bool)

(assert (=> start!57344 m!609189))

(assert (=> b!634692 m!609143))

(assert (=> b!634692 m!609153))

(declare-fun m!609191 () Bool)

(assert (=> b!634692 m!609191))

(push 1)

