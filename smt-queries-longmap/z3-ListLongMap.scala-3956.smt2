; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53748 () Bool)

(assert start!53748)

(declare-fun b!586306 () Bool)

(declare-fun res!374123 () Bool)

(declare-fun e!335229 () Bool)

(assert (=> b!586306 (=> (not res!374123) (not e!335229))))

(declare-datatypes ((array!36649 0))(
  ( (array!36650 (arr!17599 (Array (_ BitVec 32) (_ BitVec 64))) (size!17963 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36649)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36649 (_ BitVec 32)) Bool)

(assert (=> b!586306 (= res!374123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586307 () Bool)

(declare-fun e!335227 () Bool)

(assert (=> b!586307 (= e!335227 e!335229)))

(declare-fun res!374130 () Bool)

(assert (=> b!586307 (=> (not res!374130) (not e!335229))))

(declare-datatypes ((SeekEntryResult!6039 0))(
  ( (MissingZero!6039 (index!26383 (_ BitVec 32))) (Found!6039 (index!26384 (_ BitVec 32))) (Intermediate!6039 (undefined!6851 Bool) (index!26385 (_ BitVec 32)) (x!55196 (_ BitVec 32))) (Undefined!6039) (MissingVacant!6039 (index!26386 (_ BitVec 32))) )
))
(declare-fun lt!266059 () SeekEntryResult!6039)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586307 (= res!374130 (or (= lt!266059 (MissingZero!6039 i!1108)) (= lt!266059 (MissingVacant!6039 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36649 (_ BitVec 32)) SeekEntryResult!6039)

(assert (=> b!586307 (= lt!266059 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586308 () Bool)

(declare-fun res!374127 () Bool)

(assert (=> b!586308 (=> (not res!374127) (not e!335227))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586308 (= res!374127 (validKeyInArray!0 (select (arr!17599 a!2986) j!136)))))

(declare-fun b!586309 () Bool)

(declare-fun res!374125 () Bool)

(assert (=> b!586309 (=> (not res!374125) (not e!335229))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36649 (_ BitVec 32)) SeekEntryResult!6039)

(assert (=> b!586309 (= res!374125 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17599 a!2986) j!136) a!2986 mask!3053) (Found!6039 j!136)))))

(declare-fun b!586310 () Bool)

(assert (=> b!586310 (= e!335229 (not true))))

(declare-fun lt!266058 () (_ BitVec 32))

(assert (=> b!586310 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266058 vacantSpotIndex!68 (select (arr!17599 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266058 vacantSpotIndex!68 (select (store (arr!17599 a!2986) i!1108 k0!1786) j!136) (array!36650 (store (arr!17599 a!2986) i!1108 k0!1786) (size!17963 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18198 0))(
  ( (Unit!18199) )
))
(declare-fun lt!266057 () Unit!18198)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36649 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18198)

(assert (=> b!586310 (= lt!266057 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266058 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586310 (= lt!266058 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586311 () Bool)

(declare-fun res!374131 () Bool)

(assert (=> b!586311 (=> (not res!374131) (not e!335227))))

(assert (=> b!586311 (= res!374131 (validKeyInArray!0 k0!1786))))

(declare-fun b!586312 () Bool)

(declare-fun res!374132 () Bool)

(assert (=> b!586312 (=> (not res!374132) (not e!335229))))

(assert (=> b!586312 (= res!374132 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17599 a!2986) index!984) (select (arr!17599 a!2986) j!136))) (not (= (select (arr!17599 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586314 () Bool)

(declare-fun res!374124 () Bool)

(assert (=> b!586314 (=> (not res!374124) (not e!335227))))

(assert (=> b!586314 (= res!374124 (and (= (size!17963 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17963 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17963 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586315 () Bool)

(declare-fun res!374129 () Bool)

(assert (=> b!586315 (=> (not res!374129) (not e!335229))))

(declare-datatypes ((List!11640 0))(
  ( (Nil!11637) (Cons!11636 (h!12681 (_ BitVec 64)) (t!17868 List!11640)) )
))
(declare-fun arrayNoDuplicates!0 (array!36649 (_ BitVec 32) List!11640) Bool)

(assert (=> b!586315 (= res!374129 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11637))))

(declare-fun b!586316 () Bool)

(declare-fun res!374126 () Bool)

(assert (=> b!586316 (=> (not res!374126) (not e!335229))))

(assert (=> b!586316 (= res!374126 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17599 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17599 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!374122 () Bool)

(assert (=> start!53748 (=> (not res!374122) (not e!335227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53748 (= res!374122 (validMask!0 mask!3053))))

(assert (=> start!53748 e!335227))

(assert (=> start!53748 true))

(declare-fun array_inv!13395 (array!36649) Bool)

(assert (=> start!53748 (array_inv!13395 a!2986)))

(declare-fun b!586313 () Bool)

(declare-fun res!374128 () Bool)

(assert (=> b!586313 (=> (not res!374128) (not e!335227))))

(declare-fun arrayContainsKey!0 (array!36649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586313 (= res!374128 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53748 res!374122) b!586314))

(assert (= (and b!586314 res!374124) b!586308))

(assert (= (and b!586308 res!374127) b!586311))

(assert (= (and b!586311 res!374131) b!586313))

(assert (= (and b!586313 res!374128) b!586307))

(assert (= (and b!586307 res!374130) b!586306))

(assert (= (and b!586306 res!374123) b!586315))

(assert (= (and b!586315 res!374129) b!586316))

(assert (= (and b!586316 res!374126) b!586309))

(assert (= (and b!586309 res!374125) b!586312))

(assert (= (and b!586312 res!374132) b!586310))

(declare-fun m!564645 () Bool)

(assert (=> b!586311 m!564645))

(declare-fun m!564647 () Bool)

(assert (=> b!586309 m!564647))

(assert (=> b!586309 m!564647))

(declare-fun m!564649 () Bool)

(assert (=> b!586309 m!564649))

(declare-fun m!564651 () Bool)

(assert (=> b!586306 m!564651))

(declare-fun m!564653 () Bool)

(assert (=> b!586307 m!564653))

(declare-fun m!564655 () Bool)

(assert (=> b!586316 m!564655))

(declare-fun m!564657 () Bool)

(assert (=> b!586316 m!564657))

(declare-fun m!564659 () Bool)

(assert (=> b!586316 m!564659))

(declare-fun m!564661 () Bool)

(assert (=> b!586310 m!564661))

(declare-fun m!564663 () Bool)

(assert (=> b!586310 m!564663))

(assert (=> b!586310 m!564657))

(declare-fun m!564665 () Bool)

(assert (=> b!586310 m!564665))

(assert (=> b!586310 m!564665))

(declare-fun m!564667 () Bool)

(assert (=> b!586310 m!564667))

(assert (=> b!586310 m!564647))

(declare-fun m!564669 () Bool)

(assert (=> b!586310 m!564669))

(assert (=> b!586310 m!564647))

(declare-fun m!564671 () Bool)

(assert (=> b!586315 m!564671))

(declare-fun m!564673 () Bool)

(assert (=> start!53748 m!564673))

(declare-fun m!564675 () Bool)

(assert (=> start!53748 m!564675))

(assert (=> b!586308 m!564647))

(assert (=> b!586308 m!564647))

(declare-fun m!564677 () Bool)

(assert (=> b!586308 m!564677))

(declare-fun m!564679 () Bool)

(assert (=> b!586313 m!564679))

(declare-fun m!564681 () Bool)

(assert (=> b!586312 m!564681))

(assert (=> b!586312 m!564647))

(check-sat (not b!586307) (not b!586313) (not b!586315) (not b!586311) (not b!586308) (not b!586310) (not b!586309) (not b!586306) (not start!53748))
(check-sat)
