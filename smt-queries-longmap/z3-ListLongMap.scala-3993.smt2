; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54198 () Bool)

(assert start!54198)

(declare-fun b!591587 () Bool)

(declare-fun res!378430 () Bool)

(declare-fun e!337797 () Bool)

(assert (=> b!591587 (=> (not res!378430) (not e!337797))))

(declare-datatypes ((array!36873 0))(
  ( (array!36874 (arr!17704 (Array (_ BitVec 32) (_ BitVec 64))) (size!18068 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36873)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36873 (_ BitVec 32)) Bool)

(assert (=> b!591587 (= res!378430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591588 () Bool)

(declare-fun e!337791 () Bool)

(declare-datatypes ((SeekEntryResult!6100 0))(
  ( (MissingZero!6100 (index!26636 (_ BitVec 32))) (Found!6100 (index!26637 (_ BitVec 32))) (Intermediate!6100 (undefined!6912 Bool) (index!26638 (_ BitVec 32)) (x!55583 (_ BitVec 32))) (Undefined!6100) (MissingVacant!6100 (index!26639 (_ BitVec 32))) )
))
(declare-fun lt!268441 () SeekEntryResult!6100)

(declare-fun lt!268443 () SeekEntryResult!6100)

(assert (=> b!591588 (= e!337791 (= lt!268441 lt!268443))))

(declare-fun b!591589 () Bool)

(declare-datatypes ((Unit!18493 0))(
  ( (Unit!18494) )
))
(declare-fun e!337794 () Unit!18493)

(declare-fun Unit!18495 () Unit!18493)

(assert (=> b!591589 (= e!337794 Unit!18495)))

(assert (=> b!591589 false))

(declare-fun b!591590 () Bool)

(declare-fun e!337799 () Bool)

(declare-fun e!337796 () Bool)

(assert (=> b!591590 (= e!337799 e!337796)))

(declare-fun res!378444 () Bool)

(assert (=> b!591590 (=> (not res!378444) (not e!337796))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!268436 () array!36873)

(declare-fun arrayContainsKey!0 (array!36873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591590 (= res!378444 (arrayContainsKey!0 lt!268436 (select (arr!17704 a!2986) j!136) j!136))))

(declare-fun b!591591 () Bool)

(declare-fun res!378439 () Bool)

(declare-fun e!337798 () Bool)

(assert (=> b!591591 (=> (not res!378439) (not e!337798))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591591 (= res!378439 (validKeyInArray!0 k0!1786))))

(declare-fun b!591592 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!591592 (= e!337796 (arrayContainsKey!0 lt!268436 (select (arr!17704 a!2986) j!136) index!984))))

(declare-fun b!591593 () Bool)

(declare-fun e!337795 () Bool)

(assert (=> b!591593 (= e!337797 e!337795)))

(declare-fun res!378443 () Bool)

(assert (=> b!591593 (=> (not res!378443) (not e!337795))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!591593 (= res!378443 (= (select (store (arr!17704 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591593 (= lt!268436 (array!36874 (store (arr!17704 a!2986) i!1108 k0!1786) (size!18068 a!2986)))))

(declare-fun b!591594 () Bool)

(declare-fun e!337792 () Bool)

(assert (=> b!591594 (= e!337792 e!337799)))

(declare-fun res!378433 () Bool)

(assert (=> b!591594 (=> res!378433 e!337799)))

(declare-fun lt!268437 () (_ BitVec 64))

(declare-fun lt!268435 () (_ BitVec 64))

(assert (=> b!591594 (= res!378433 (or (not (= (select (arr!17704 a!2986) j!136) lt!268435)) (not (= (select (arr!17704 a!2986) j!136) lt!268437)) (bvsge j!136 index!984)))))

(declare-fun b!591595 () Bool)

(declare-fun e!337793 () Bool)

(assert (=> b!591595 (= e!337795 e!337793)))

(declare-fun res!378438 () Bool)

(assert (=> b!591595 (=> (not res!378438) (not e!337793))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!591595 (= res!378438 (and (= lt!268441 (Found!6100 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17704 a!2986) index!984) (select (arr!17704 a!2986) j!136))) (not (= (select (arr!17704 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36873 (_ BitVec 32)) SeekEntryResult!6100)

(assert (=> b!591595 (= lt!268441 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17704 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591596 () Bool)

(assert (=> b!591596 (= e!337798 e!337797)))

(declare-fun res!378440 () Bool)

(assert (=> b!591596 (=> (not res!378440) (not e!337797))))

(declare-fun lt!268438 () SeekEntryResult!6100)

(assert (=> b!591596 (= res!378440 (or (= lt!268438 (MissingZero!6100 i!1108)) (= lt!268438 (MissingVacant!6100 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36873 (_ BitVec 32)) SeekEntryResult!6100)

(assert (=> b!591596 (= lt!268438 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!591597 () Bool)

(declare-fun Unit!18496 () Unit!18493)

(assert (=> b!591597 (= e!337794 Unit!18496)))

(declare-fun b!591598 () Bool)

(declare-fun res!378437 () Bool)

(assert (=> b!591598 (=> (not res!378437) (not e!337798))))

(assert (=> b!591598 (= res!378437 (validKeyInArray!0 (select (arr!17704 a!2986) j!136)))))

(declare-fun b!591599 () Bool)

(declare-fun res!378435 () Bool)

(assert (=> b!591599 (=> (not res!378435) (not e!337798))))

(assert (=> b!591599 (= res!378435 (and (= (size!18068 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18068 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18068 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591600 () Bool)

(declare-fun res!378436 () Bool)

(assert (=> b!591600 (=> (not res!378436) (not e!337797))))

(assert (=> b!591600 (= res!378436 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17704 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!378434 () Bool)

(assert (=> start!54198 (=> (not res!378434) (not e!337798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54198 (= res!378434 (validMask!0 mask!3053))))

(assert (=> start!54198 e!337798))

(assert (=> start!54198 true))

(declare-fun array_inv!13563 (array!36873) Bool)

(assert (=> start!54198 (array_inv!13563 a!2986)))

(declare-fun b!591601 () Bool)

(declare-fun res!378431 () Bool)

(assert (=> b!591601 (=> (not res!378431) (not e!337798))))

(assert (=> b!591601 (= res!378431 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591602 () Bool)

(declare-fun e!337790 () Bool)

(assert (=> b!591602 (= e!337790 true)))

(assert (=> b!591602 e!337792))

(declare-fun res!378432 () Bool)

(assert (=> b!591602 (=> (not res!378432) (not e!337792))))

(assert (=> b!591602 (= res!378432 (= lt!268437 (select (arr!17704 a!2986) j!136)))))

(assert (=> b!591602 (= lt!268437 (select (store (arr!17704 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!591603 () Bool)

(assert (=> b!591603 (= e!337793 (not e!337790))))

(declare-fun res!378445 () Bool)

(assert (=> b!591603 (=> res!378445 e!337790)))

(declare-fun lt!268439 () SeekEntryResult!6100)

(assert (=> b!591603 (= res!378445 (not (= lt!268439 (Found!6100 index!984))))))

(declare-fun lt!268444 () Unit!18493)

(assert (=> b!591603 (= lt!268444 e!337794)))

(declare-fun c!66947 () Bool)

(assert (=> b!591603 (= c!66947 (= lt!268439 Undefined!6100))))

(assert (=> b!591603 (= lt!268439 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268435 lt!268436 mask!3053))))

(assert (=> b!591603 e!337791))

(declare-fun res!378442 () Bool)

(assert (=> b!591603 (=> (not res!378442) (not e!337791))))

(declare-fun lt!268440 () (_ BitVec 32))

(assert (=> b!591603 (= res!378442 (= lt!268443 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268440 vacantSpotIndex!68 lt!268435 lt!268436 mask!3053)))))

(assert (=> b!591603 (= lt!268443 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268440 vacantSpotIndex!68 (select (arr!17704 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591603 (= lt!268435 (select (store (arr!17704 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268442 () Unit!18493)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36873 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18493)

(assert (=> b!591603 (= lt!268442 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268440 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591603 (= lt!268440 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!591604 () Bool)

(declare-fun res!378441 () Bool)

(assert (=> b!591604 (=> (not res!378441) (not e!337797))))

(declare-datatypes ((List!11652 0))(
  ( (Nil!11649) (Cons!11648 (h!12696 (_ BitVec 64)) (t!17872 List!11652)) )
))
(declare-fun arrayNoDuplicates!0 (array!36873 (_ BitVec 32) List!11652) Bool)

(assert (=> b!591604 (= res!378441 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11649))))

(assert (= (and start!54198 res!378434) b!591599))

(assert (= (and b!591599 res!378435) b!591598))

(assert (= (and b!591598 res!378437) b!591591))

(assert (= (and b!591591 res!378439) b!591601))

(assert (= (and b!591601 res!378431) b!591596))

(assert (= (and b!591596 res!378440) b!591587))

(assert (= (and b!591587 res!378430) b!591604))

(assert (= (and b!591604 res!378441) b!591600))

(assert (= (and b!591600 res!378436) b!591593))

(assert (= (and b!591593 res!378443) b!591595))

(assert (= (and b!591595 res!378438) b!591603))

(assert (= (and b!591603 res!378442) b!591588))

(assert (= (and b!591603 c!66947) b!591589))

(assert (= (and b!591603 (not c!66947)) b!591597))

(assert (= (and b!591603 (not res!378445)) b!591602))

(assert (= (and b!591602 res!378432) b!591594))

(assert (= (and b!591594 (not res!378433)) b!591590))

(assert (= (and b!591590 res!378444) b!591592))

(declare-fun m!570011 () Bool)

(assert (=> b!591600 m!570011))

(declare-fun m!570013 () Bool)

(assert (=> b!591602 m!570013))

(declare-fun m!570015 () Bool)

(assert (=> b!591602 m!570015))

(declare-fun m!570017 () Bool)

(assert (=> b!591602 m!570017))

(assert (=> b!591593 m!570015))

(declare-fun m!570019 () Bool)

(assert (=> b!591593 m!570019))

(declare-fun m!570021 () Bool)

(assert (=> b!591604 m!570021))

(declare-fun m!570023 () Bool)

(assert (=> b!591591 m!570023))

(assert (=> b!591592 m!570013))

(assert (=> b!591592 m!570013))

(declare-fun m!570025 () Bool)

(assert (=> b!591592 m!570025))

(declare-fun m!570027 () Bool)

(assert (=> b!591596 m!570027))

(declare-fun m!570029 () Bool)

(assert (=> b!591603 m!570029))

(declare-fun m!570031 () Bool)

(assert (=> b!591603 m!570031))

(assert (=> b!591603 m!570013))

(assert (=> b!591603 m!570015))

(declare-fun m!570033 () Bool)

(assert (=> b!591603 m!570033))

(declare-fun m!570035 () Bool)

(assert (=> b!591603 m!570035))

(declare-fun m!570037 () Bool)

(assert (=> b!591603 m!570037))

(assert (=> b!591603 m!570013))

(declare-fun m!570039 () Bool)

(assert (=> b!591603 m!570039))

(declare-fun m!570041 () Bool)

(assert (=> b!591587 m!570041))

(declare-fun m!570043 () Bool)

(assert (=> b!591595 m!570043))

(assert (=> b!591595 m!570013))

(assert (=> b!591595 m!570013))

(declare-fun m!570045 () Bool)

(assert (=> b!591595 m!570045))

(declare-fun m!570047 () Bool)

(assert (=> b!591601 m!570047))

(declare-fun m!570049 () Bool)

(assert (=> start!54198 m!570049))

(declare-fun m!570051 () Bool)

(assert (=> start!54198 m!570051))

(assert (=> b!591598 m!570013))

(assert (=> b!591598 m!570013))

(declare-fun m!570053 () Bool)

(assert (=> b!591598 m!570053))

(assert (=> b!591590 m!570013))

(assert (=> b!591590 m!570013))

(declare-fun m!570055 () Bool)

(assert (=> b!591590 m!570055))

(assert (=> b!591594 m!570013))

(check-sat (not b!591591) (not b!591592) (not b!591601) (not b!591590) (not b!591587) (not b!591596) (not b!591603) (not b!591595) (not b!591598) (not start!54198) (not b!591604))
(check-sat)
