; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53766 () Bool)

(assert start!53766)

(declare-fun res!374557 () Bool)

(declare-fun e!335207 () Bool)

(assert (=> start!53766 (=> (not res!374557) (not e!335207))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53766 (= res!374557 (validMask!0 mask!3053))))

(assert (=> start!53766 e!335207))

(assert (=> start!53766 true))

(declare-datatypes ((array!36681 0))(
  ( (array!36682 (arr!17615 (Array (_ BitVec 32) (_ BitVec 64))) (size!17980 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36681)

(declare-fun array_inv!13498 (array!36681) Bool)

(assert (=> start!53766 (array_inv!13498 a!2986)))

(declare-fun b!586596 () Bool)

(declare-fun res!374564 () Bool)

(declare-fun e!335208 () Bool)

(assert (=> b!586596 (=> (not res!374564) (not e!335208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36681 (_ BitVec 32)) Bool)

(assert (=> b!586596 (= res!374564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586597 () Bool)

(assert (=> b!586597 (= e!335208 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265977 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6052 0))(
  ( (MissingZero!6052 (index!26435 (_ BitVec 32))) (Found!6052 (index!26436 (_ BitVec 32))) (Intermediate!6052 (undefined!6864 Bool) (index!26437 (_ BitVec 32)) (x!55252 (_ BitVec 32))) (Undefined!6052) (MissingVacant!6052 (index!26438 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36681 (_ BitVec 32)) SeekEntryResult!6052)

(assert (=> b!586597 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265977 vacantSpotIndex!68 (select (arr!17615 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265977 vacantSpotIndex!68 (select (store (arr!17615 a!2986) i!1108 k0!1786) j!136) (array!36682 (store (arr!17615 a!2986) i!1108 k0!1786) (size!17980 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18210 0))(
  ( (Unit!18211) )
))
(declare-fun lt!265976 () Unit!18210)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36681 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18210)

(assert (=> b!586597 (= lt!265976 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265977 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586597 (= lt!265977 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586598 () Bool)

(declare-fun res!374556 () Bool)

(assert (=> b!586598 (=> (not res!374556) (not e!335207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586598 (= res!374556 (validKeyInArray!0 k0!1786))))

(declare-fun b!586599 () Bool)

(declare-fun res!374554 () Bool)

(assert (=> b!586599 (=> (not res!374554) (not e!335208))))

(assert (=> b!586599 (= res!374554 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17615 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17615 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586600 () Bool)

(declare-fun res!374558 () Bool)

(assert (=> b!586600 (=> (not res!374558) (not e!335207))))

(declare-fun arrayContainsKey!0 (array!36681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586600 (= res!374558 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586601 () Bool)

(declare-fun res!374562 () Bool)

(assert (=> b!586601 (=> (not res!374562) (not e!335208))))

(assert (=> b!586601 (= res!374562 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17615 a!2986) j!136) a!2986 mask!3053) (Found!6052 j!136)))))

(declare-fun b!586602 () Bool)

(declare-fun res!374561 () Bool)

(assert (=> b!586602 (=> (not res!374561) (not e!335207))))

(assert (=> b!586602 (= res!374561 (validKeyInArray!0 (select (arr!17615 a!2986) j!136)))))

(declare-fun b!586603 () Bool)

(declare-fun res!374560 () Bool)

(assert (=> b!586603 (=> (not res!374560) (not e!335208))))

(declare-datatypes ((List!11695 0))(
  ( (Nil!11692) (Cons!11691 (h!12736 (_ BitVec 64)) (t!17914 List!11695)) )
))
(declare-fun arrayNoDuplicates!0 (array!36681 (_ BitVec 32) List!11695) Bool)

(assert (=> b!586603 (= res!374560 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11692))))

(declare-fun b!586604 () Bool)

(declare-fun res!374563 () Bool)

(assert (=> b!586604 (=> (not res!374563) (not e!335207))))

(assert (=> b!586604 (= res!374563 (and (= (size!17980 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17980 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17980 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586605 () Bool)

(assert (=> b!586605 (= e!335207 e!335208)))

(declare-fun res!374555 () Bool)

(assert (=> b!586605 (=> (not res!374555) (not e!335208))))

(declare-fun lt!265978 () SeekEntryResult!6052)

(assert (=> b!586605 (= res!374555 (or (= lt!265978 (MissingZero!6052 i!1108)) (= lt!265978 (MissingVacant!6052 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36681 (_ BitVec 32)) SeekEntryResult!6052)

(assert (=> b!586605 (= lt!265978 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586606 () Bool)

(declare-fun res!374559 () Bool)

(assert (=> b!586606 (=> (not res!374559) (not e!335208))))

(assert (=> b!586606 (= res!374559 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17615 a!2986) index!984) (select (arr!17615 a!2986) j!136))) (not (= (select (arr!17615 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53766 res!374557) b!586604))

(assert (= (and b!586604 res!374563) b!586602))

(assert (= (and b!586602 res!374561) b!586598))

(assert (= (and b!586598 res!374556) b!586600))

(assert (= (and b!586600 res!374558) b!586605))

(assert (= (and b!586605 res!374555) b!586596))

(assert (= (and b!586596 res!374564) b!586603))

(assert (= (and b!586603 res!374560) b!586599))

(assert (= (and b!586599 res!374554) b!586601))

(assert (= (and b!586601 res!374562) b!586606))

(assert (= (and b!586606 res!374559) b!586597))

(declare-fun m!564505 () Bool)

(assert (=> b!586599 m!564505))

(declare-fun m!564507 () Bool)

(assert (=> b!586599 m!564507))

(declare-fun m!564509 () Bool)

(assert (=> b!586599 m!564509))

(declare-fun m!564511 () Bool)

(assert (=> start!53766 m!564511))

(declare-fun m!564513 () Bool)

(assert (=> start!53766 m!564513))

(declare-fun m!564515 () Bool)

(assert (=> b!586598 m!564515))

(declare-fun m!564517 () Bool)

(assert (=> b!586605 m!564517))

(declare-fun m!564519 () Bool)

(assert (=> b!586606 m!564519))

(declare-fun m!564521 () Bool)

(assert (=> b!586606 m!564521))

(declare-fun m!564523 () Bool)

(assert (=> b!586596 m!564523))

(assert (=> b!586602 m!564521))

(assert (=> b!586602 m!564521))

(declare-fun m!564525 () Bool)

(assert (=> b!586602 m!564525))

(assert (=> b!586601 m!564521))

(assert (=> b!586601 m!564521))

(declare-fun m!564527 () Bool)

(assert (=> b!586601 m!564527))

(declare-fun m!564529 () Bool)

(assert (=> b!586600 m!564529))

(declare-fun m!564531 () Bool)

(assert (=> b!586603 m!564531))

(declare-fun m!564533 () Bool)

(assert (=> b!586597 m!564533))

(declare-fun m!564535 () Bool)

(assert (=> b!586597 m!564535))

(declare-fun m!564537 () Bool)

(assert (=> b!586597 m!564537))

(assert (=> b!586597 m!564521))

(assert (=> b!586597 m!564507))

(assert (=> b!586597 m!564535))

(declare-fun m!564539 () Bool)

(assert (=> b!586597 m!564539))

(assert (=> b!586597 m!564521))

(declare-fun m!564541 () Bool)

(assert (=> b!586597 m!564541))

(check-sat (not b!586605) (not b!586600) (not b!586597) (not b!586598) (not b!586596) (not start!53766) (not b!586602) (not b!586603) (not b!586601))
(check-sat)
