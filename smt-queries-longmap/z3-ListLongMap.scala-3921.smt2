; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53520 () Bool)

(assert start!53520)

(declare-fun res!370474 () Bool)

(declare-fun e!333929 () Bool)

(assert (=> start!53520 (=> (not res!370474) (not e!333929))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53520 (= res!370474 (validMask!0 mask!3053))))

(assert (=> start!53520 e!333929))

(assert (=> start!53520 true))

(declare-datatypes ((array!36435 0))(
  ( (array!36436 (arr!17492 (Array (_ BitVec 32) (_ BitVec 64))) (size!17857 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36435)

(declare-fun array_inv!13375 (array!36435) Bool)

(assert (=> start!53520 (array_inv!13375 a!2986)))

(declare-fun b!582515 () Bool)

(declare-fun res!370478 () Bool)

(declare-fun e!333928 () Bool)

(assert (=> b!582515 (=> (not res!370478) (not e!333928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36435 (_ BitVec 32)) Bool)

(assert (=> b!582515 (= res!370478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582516 () Bool)

(assert (=> b!582516 (= e!333928 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5929 0))(
  ( (MissingZero!5929 (index!25943 (_ BitVec 32))) (Found!5929 (index!25944 (_ BitVec 32))) (Intermediate!5929 (undefined!6741 Bool) (index!25945 (_ BitVec 32)) (x!54801 (_ BitVec 32))) (Undefined!5929) (MissingVacant!5929 (index!25946 (_ BitVec 32))) )
))
(declare-fun lt!264958 () SeekEntryResult!5929)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36435 (_ BitVec 32)) SeekEntryResult!5929)

(assert (=> b!582516 (= lt!264958 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17492 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582517 () Bool)

(declare-fun res!370473 () Bool)

(assert (=> b!582517 (=> (not res!370473) (not e!333929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582517 (= res!370473 (validKeyInArray!0 (select (arr!17492 a!2986) j!136)))))

(declare-fun b!582518 () Bool)

(declare-fun res!370476 () Bool)

(assert (=> b!582518 (=> (not res!370476) (not e!333929))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582518 (= res!370476 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582519 () Bool)

(assert (=> b!582519 (= e!333929 e!333928)))

(declare-fun res!370475 () Bool)

(assert (=> b!582519 (=> (not res!370475) (not e!333928))))

(declare-fun lt!264957 () SeekEntryResult!5929)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582519 (= res!370475 (or (= lt!264957 (MissingZero!5929 i!1108)) (= lt!264957 (MissingVacant!5929 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36435 (_ BitVec 32)) SeekEntryResult!5929)

(assert (=> b!582519 (= lt!264957 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582520 () Bool)

(declare-fun res!370481 () Bool)

(assert (=> b!582520 (=> (not res!370481) (not e!333929))))

(assert (=> b!582520 (= res!370481 (validKeyInArray!0 k0!1786))))

(declare-fun b!582521 () Bool)

(declare-fun res!370479 () Bool)

(assert (=> b!582521 (=> (not res!370479) (not e!333929))))

(assert (=> b!582521 (= res!370479 (and (= (size!17857 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17857 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17857 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582522 () Bool)

(declare-fun res!370480 () Bool)

(assert (=> b!582522 (=> (not res!370480) (not e!333928))))

(assert (=> b!582522 (= res!370480 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17492 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17492 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582523 () Bool)

(declare-fun res!370477 () Bool)

(assert (=> b!582523 (=> (not res!370477) (not e!333928))))

(declare-datatypes ((List!11572 0))(
  ( (Nil!11569) (Cons!11568 (h!12613 (_ BitVec 64)) (t!17791 List!11572)) )
))
(declare-fun arrayNoDuplicates!0 (array!36435 (_ BitVec 32) List!11572) Bool)

(assert (=> b!582523 (= res!370477 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11569))))

(assert (= (and start!53520 res!370474) b!582521))

(assert (= (and b!582521 res!370479) b!582517))

(assert (= (and b!582517 res!370473) b!582520))

(assert (= (and b!582520 res!370481) b!582518))

(assert (= (and b!582518 res!370476) b!582519))

(assert (= (and b!582519 res!370475) b!582515))

(assert (= (and b!582515 res!370478) b!582523))

(assert (= (and b!582523 res!370477) b!582522))

(assert (= (and b!582522 res!370480) b!582516))

(declare-fun m!560491 () Bool)

(assert (=> b!582516 m!560491))

(assert (=> b!582516 m!560491))

(declare-fun m!560493 () Bool)

(assert (=> b!582516 m!560493))

(declare-fun m!560495 () Bool)

(assert (=> b!582520 m!560495))

(declare-fun m!560497 () Bool)

(assert (=> b!582523 m!560497))

(declare-fun m!560499 () Bool)

(assert (=> b!582519 m!560499))

(declare-fun m!560501 () Bool)

(assert (=> b!582518 m!560501))

(declare-fun m!560503 () Bool)

(assert (=> b!582522 m!560503))

(declare-fun m!560505 () Bool)

(assert (=> b!582522 m!560505))

(declare-fun m!560507 () Bool)

(assert (=> b!582522 m!560507))

(declare-fun m!560509 () Bool)

(assert (=> start!53520 m!560509))

(declare-fun m!560511 () Bool)

(assert (=> start!53520 m!560511))

(declare-fun m!560513 () Bool)

(assert (=> b!582515 m!560513))

(assert (=> b!582517 m!560491))

(assert (=> b!582517 m!560491))

(declare-fun m!560515 () Bool)

(assert (=> b!582517 m!560515))

(check-sat (not b!582519) (not b!582518) (not b!582516) (not b!582520) (not b!582523) (not b!582517) (not start!53520) (not b!582515))
(check-sat)
