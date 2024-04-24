; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56700 () Bool)

(assert start!56700)

(declare-fun b!628053 () Bool)

(declare-fun e!359495 () Bool)

(declare-fun e!359494 () Bool)

(assert (=> b!628053 (= e!359495 e!359494)))

(declare-fun res!405655 () Bool)

(assert (=> b!628053 (=> (not res!405655) (not e!359494))))

(declare-datatypes ((SeekEntryResult!6601 0))(
  ( (MissingZero!6601 (index!28688 (_ BitVec 32))) (Found!6601 (index!28689 (_ BitVec 32))) (Intermediate!6601 (undefined!7413 Bool) (index!28690 (_ BitVec 32)) (x!57576 (_ BitVec 32))) (Undefined!6601) (MissingVacant!6601 (index!28691 (_ BitVec 32))) )
))
(declare-fun lt!290455 () SeekEntryResult!6601)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628053 (= res!405655 (or (= lt!290455 (MissingZero!6601 i!1108)) (= lt!290455 (MissingVacant!6601 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37935 0))(
  ( (array!37936 (arr!18205 (Array (_ BitVec 32) (_ BitVec 64))) (size!18569 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37935)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37935 (_ BitVec 32)) SeekEntryResult!6601)

(assert (=> b!628053 (= lt!290455 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628054 () Bool)

(declare-fun res!405653 () Bool)

(assert (=> b!628054 (=> (not res!405653) (not e!359495))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628054 (= res!405653 (validKeyInArray!0 (select (arr!18205 a!2986) j!136)))))

(declare-fun b!628055 () Bool)

(assert (=> b!628055 (= e!359494 false)))

(declare-fun lt!290454 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628055 (= lt!290454 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!628056 () Bool)

(declare-fun res!405656 () Bool)

(assert (=> b!628056 (=> (not res!405656) (not e!359494))))

(declare-datatypes ((List!12153 0))(
  ( (Nil!12150) (Cons!12149 (h!13197 (_ BitVec 64)) (t!18373 List!12153)) )
))
(declare-fun arrayNoDuplicates!0 (array!37935 (_ BitVec 32) List!12153) Bool)

(assert (=> b!628056 (= res!405656 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12150))))

(declare-fun b!628057 () Bool)

(declare-fun res!405648 () Bool)

(assert (=> b!628057 (=> (not res!405648) (not e!359495))))

(declare-fun arrayContainsKey!0 (array!37935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628057 (= res!405648 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628058 () Bool)

(declare-fun res!405652 () Bool)

(assert (=> b!628058 (=> (not res!405652) (not e!359495))))

(assert (=> b!628058 (= res!405652 (and (= (size!18569 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18569 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18569 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!405657 () Bool)

(assert (=> start!56700 (=> (not res!405657) (not e!359495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56700 (= res!405657 (validMask!0 mask!3053))))

(assert (=> start!56700 e!359495))

(assert (=> start!56700 true))

(declare-fun array_inv!14064 (array!37935) Bool)

(assert (=> start!56700 (array_inv!14064 a!2986)))

(declare-fun b!628059 () Bool)

(declare-fun res!405654 () Bool)

(assert (=> b!628059 (=> (not res!405654) (not e!359494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37935 (_ BitVec 32)) Bool)

(assert (=> b!628059 (= res!405654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628060 () Bool)

(declare-fun res!405651 () Bool)

(assert (=> b!628060 (=> (not res!405651) (not e!359494))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!628060 (= res!405651 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18205 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18205 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628061 () Bool)

(declare-fun res!405649 () Bool)

(assert (=> b!628061 (=> (not res!405649) (not e!359494))))

(assert (=> b!628061 (= res!405649 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18205 a!2986) index!984) (select (arr!18205 a!2986) j!136))) (not (= (select (arr!18205 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628062 () Bool)

(declare-fun res!405650 () Bool)

(assert (=> b!628062 (=> (not res!405650) (not e!359494))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37935 (_ BitVec 32)) SeekEntryResult!6601)

(assert (=> b!628062 (= res!405650 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18205 a!2986) j!136) a!2986 mask!3053) (Found!6601 j!136)))))

(declare-fun b!628063 () Bool)

(declare-fun res!405658 () Bool)

(assert (=> b!628063 (=> (not res!405658) (not e!359495))))

(assert (=> b!628063 (= res!405658 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56700 res!405657) b!628058))

(assert (= (and b!628058 res!405652) b!628054))

(assert (= (and b!628054 res!405653) b!628063))

(assert (= (and b!628063 res!405658) b!628057))

(assert (= (and b!628057 res!405648) b!628053))

(assert (= (and b!628053 res!405655) b!628059))

(assert (= (and b!628059 res!405654) b!628056))

(assert (= (and b!628056 res!405656) b!628060))

(assert (= (and b!628060 res!405651) b!628062))

(assert (= (and b!628062 res!405650) b!628061))

(assert (= (and b!628061 res!405649) b!628055))

(declare-fun m!603607 () Bool)

(assert (=> b!628059 m!603607))

(declare-fun m!603609 () Bool)

(assert (=> start!56700 m!603609))

(declare-fun m!603611 () Bool)

(assert (=> start!56700 m!603611))

(declare-fun m!603613 () Bool)

(assert (=> b!628053 m!603613))

(declare-fun m!603615 () Bool)

(assert (=> b!628057 m!603615))

(declare-fun m!603617 () Bool)

(assert (=> b!628055 m!603617))

(declare-fun m!603619 () Bool)

(assert (=> b!628060 m!603619))

(declare-fun m!603621 () Bool)

(assert (=> b!628060 m!603621))

(declare-fun m!603623 () Bool)

(assert (=> b!628060 m!603623))

(declare-fun m!603625 () Bool)

(assert (=> b!628061 m!603625))

(declare-fun m!603627 () Bool)

(assert (=> b!628061 m!603627))

(declare-fun m!603629 () Bool)

(assert (=> b!628056 m!603629))

(assert (=> b!628062 m!603627))

(assert (=> b!628062 m!603627))

(declare-fun m!603631 () Bool)

(assert (=> b!628062 m!603631))

(declare-fun m!603633 () Bool)

(assert (=> b!628063 m!603633))

(assert (=> b!628054 m!603627))

(assert (=> b!628054 m!603627))

(declare-fun m!603635 () Bool)

(assert (=> b!628054 m!603635))

(check-sat (not b!628053) (not b!628062) (not b!628063) (not start!56700) (not b!628059) (not b!628056) (not b!628055) (not b!628054) (not b!628057))
(check-sat)
