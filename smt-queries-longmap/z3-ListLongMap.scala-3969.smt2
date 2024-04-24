; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53934 () Bool)

(assert start!53934)

(declare-fun b!588021 () Bool)

(declare-fun res!375552 () Bool)

(declare-fun e!335865 () Bool)

(assert (=> b!588021 (=> (not res!375552) (not e!335865))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588021 (= res!375552 (validKeyInArray!0 k0!1786))))

(declare-fun b!588022 () Bool)

(declare-fun e!335866 () Bool)

(declare-fun e!335868 () Bool)

(assert (=> b!588022 (= e!335866 e!335868)))

(declare-fun res!375557 () Bool)

(assert (=> b!588022 (=> (not res!375557) (not e!335868))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6028 0))(
  ( (MissingZero!6028 (index!26342 (_ BitVec 32))) (Found!6028 (index!26343 (_ BitVec 32))) (Intermediate!6028 (undefined!6840 Bool) (index!26344 (_ BitVec 32)) (x!55301 (_ BitVec 32))) (Undefined!6028) (MissingVacant!6028 (index!26345 (_ BitVec 32))) )
))
(declare-fun lt!266608 () SeekEntryResult!6028)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36723 0))(
  ( (array!36724 (arr!17632 (Array (_ BitVec 32) (_ BitVec 64))) (size!17996 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36723)

(assert (=> b!588022 (= res!375557 (and (= lt!266608 (Found!6028 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17632 a!2986) index!984) (select (arr!17632 a!2986) j!136))) (not (= (select (arr!17632 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36723 (_ BitVec 32)) SeekEntryResult!6028)

(assert (=> b!588022 (= lt!266608 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17632 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588023 () Bool)

(declare-fun res!375560 () Bool)

(assert (=> b!588023 (=> (not res!375560) (not e!335865))))

(declare-fun arrayContainsKey!0 (array!36723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588023 (= res!375560 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588024 () Bool)

(declare-fun res!375556 () Bool)

(assert (=> b!588024 (=> (not res!375556) (not e!335866))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588024 (= res!375556 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17632 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17632 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588025 () Bool)

(declare-fun res!375555 () Bool)

(assert (=> b!588025 (=> (not res!375555) (not e!335865))))

(assert (=> b!588025 (= res!375555 (and (= (size!17996 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17996 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17996 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588026 () Bool)

(declare-fun res!375553 () Bool)

(assert (=> b!588026 (=> (not res!375553) (not e!335865))))

(assert (=> b!588026 (= res!375553 (validKeyInArray!0 (select (arr!17632 a!2986) j!136)))))

(declare-fun res!375558 () Bool)

(assert (=> start!53934 (=> (not res!375558) (not e!335865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53934 (= res!375558 (validMask!0 mask!3053))))

(assert (=> start!53934 e!335865))

(assert (=> start!53934 true))

(declare-fun array_inv!13491 (array!36723) Bool)

(assert (=> start!53934 (array_inv!13491 a!2986)))

(declare-fun b!588027 () Bool)

(assert (=> b!588027 (= e!335865 e!335866)))

(declare-fun res!375562 () Bool)

(assert (=> b!588027 (=> (not res!375562) (not e!335866))))

(declare-fun lt!266607 () SeekEntryResult!6028)

(assert (=> b!588027 (= res!375562 (or (= lt!266607 (MissingZero!6028 i!1108)) (= lt!266607 (MissingVacant!6028 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36723 (_ BitVec 32)) SeekEntryResult!6028)

(assert (=> b!588027 (= lt!266607 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588028 () Bool)

(assert (=> b!588028 (= e!335868 (not true))))

(declare-fun e!335864 () Bool)

(assert (=> b!588028 e!335864))

(declare-fun res!375561 () Bool)

(assert (=> b!588028 (=> (not res!375561) (not e!335864))))

(declare-fun lt!266609 () SeekEntryResult!6028)

(declare-fun lt!266611 () (_ BitVec 32))

(assert (=> b!588028 (= res!375561 (= lt!266609 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266611 vacantSpotIndex!68 (select (store (arr!17632 a!2986) i!1108 k0!1786) j!136) (array!36724 (store (arr!17632 a!2986) i!1108 k0!1786) (size!17996 a!2986)) mask!3053)))))

(assert (=> b!588028 (= lt!266609 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266611 vacantSpotIndex!68 (select (arr!17632 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18253 0))(
  ( (Unit!18254) )
))
(declare-fun lt!266610 () Unit!18253)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36723 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18253)

(assert (=> b!588028 (= lt!266610 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266611 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588028 (= lt!266611 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!588029 () Bool)

(assert (=> b!588029 (= e!335864 (= lt!266608 lt!266609))))

(declare-fun b!588030 () Bool)

(declare-fun res!375559 () Bool)

(assert (=> b!588030 (=> (not res!375559) (not e!335866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36723 (_ BitVec 32)) Bool)

(assert (=> b!588030 (= res!375559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588031 () Bool)

(declare-fun res!375554 () Bool)

(assert (=> b!588031 (=> (not res!375554) (not e!335866))))

(declare-datatypes ((List!11580 0))(
  ( (Nil!11577) (Cons!11576 (h!12624 (_ BitVec 64)) (t!17800 List!11580)) )
))
(declare-fun arrayNoDuplicates!0 (array!36723 (_ BitVec 32) List!11580) Bool)

(assert (=> b!588031 (= res!375554 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11577))))

(assert (= (and start!53934 res!375558) b!588025))

(assert (= (and b!588025 res!375555) b!588026))

(assert (= (and b!588026 res!375553) b!588021))

(assert (= (and b!588021 res!375552) b!588023))

(assert (= (and b!588023 res!375560) b!588027))

(assert (= (and b!588027 res!375562) b!588030))

(assert (= (and b!588030 res!375559) b!588031))

(assert (= (and b!588031 res!375554) b!588024))

(assert (= (and b!588024 res!375556) b!588022))

(assert (= (and b!588022 res!375557) b!588028))

(assert (= (and b!588028 res!375561) b!588029))

(declare-fun m!566633 () Bool)

(assert (=> start!53934 m!566633))

(declare-fun m!566635 () Bool)

(assert (=> start!53934 m!566635))

(declare-fun m!566637 () Bool)

(assert (=> b!588027 m!566637))

(declare-fun m!566639 () Bool)

(assert (=> b!588030 m!566639))

(declare-fun m!566641 () Bool)

(assert (=> b!588021 m!566641))

(declare-fun m!566643 () Bool)

(assert (=> b!588022 m!566643))

(declare-fun m!566645 () Bool)

(assert (=> b!588022 m!566645))

(assert (=> b!588022 m!566645))

(declare-fun m!566647 () Bool)

(assert (=> b!588022 m!566647))

(declare-fun m!566649 () Bool)

(assert (=> b!588031 m!566649))

(assert (=> b!588026 m!566645))

(assert (=> b!588026 m!566645))

(declare-fun m!566651 () Bool)

(assert (=> b!588026 m!566651))

(declare-fun m!566653 () Bool)

(assert (=> b!588028 m!566653))

(declare-fun m!566655 () Bool)

(assert (=> b!588028 m!566655))

(assert (=> b!588028 m!566645))

(declare-fun m!566657 () Bool)

(assert (=> b!588028 m!566657))

(assert (=> b!588028 m!566655))

(declare-fun m!566659 () Bool)

(assert (=> b!588028 m!566659))

(assert (=> b!588028 m!566645))

(declare-fun m!566661 () Bool)

(assert (=> b!588028 m!566661))

(declare-fun m!566663 () Bool)

(assert (=> b!588028 m!566663))

(declare-fun m!566665 () Bool)

(assert (=> b!588023 m!566665))

(declare-fun m!566667 () Bool)

(assert (=> b!588024 m!566667))

(assert (=> b!588024 m!566657))

(declare-fun m!566669 () Bool)

(assert (=> b!588024 m!566669))

(check-sat (not b!588028) (not b!588026) (not start!53934) (not b!588021) (not b!588031) (not b!588030) (not b!588023) (not b!588027) (not b!588022))
(check-sat)
