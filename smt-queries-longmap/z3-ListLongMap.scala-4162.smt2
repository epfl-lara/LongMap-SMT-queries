; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56646 () Bool)

(assert start!56646)

(declare-fun b!627771 () Bool)

(declare-fun res!405615 () Bool)

(declare-fun e!359245 () Bool)

(assert (=> b!627771 (=> (not res!405615) (not e!359245))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37950 0))(
  ( (array!37951 (arr!18215 (Array (_ BitVec 32) (_ BitVec 64))) (size!18580 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37950)

(assert (=> b!627771 (= res!405615 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18215 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18215 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627773 () Bool)

(declare-fun res!405621 () Bool)

(declare-fun e!359247 () Bool)

(assert (=> b!627773 (=> (not res!405621) (not e!359247))))

(declare-fun arrayContainsKey!0 (array!37950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627773 (= res!405621 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627774 () Bool)

(declare-fun res!405613 () Bool)

(assert (=> b!627774 (=> (not res!405613) (not e!359247))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!627774 (= res!405613 (and (= (size!18580 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18580 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18580 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627775 () Bool)

(declare-fun res!405616 () Bool)

(assert (=> b!627775 (=> (not res!405616) (not e!359245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37950 (_ BitVec 32)) Bool)

(assert (=> b!627775 (= res!405616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627776 () Bool)

(declare-fun res!405614 () Bool)

(assert (=> b!627776 (=> (not res!405614) (not e!359247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627776 (= res!405614 (validKeyInArray!0 (select (arr!18215 a!2986) j!136)))))

(declare-fun b!627777 () Bool)

(assert (=> b!627777 (= e!359247 e!359245)))

(declare-fun res!405620 () Bool)

(assert (=> b!627777 (=> (not res!405620) (not e!359245))))

(declare-datatypes ((SeekEntryResult!6652 0))(
  ( (MissingZero!6652 (index!28892 (_ BitVec 32))) (Found!6652 (index!28893 (_ BitVec 32))) (Intermediate!6652 (undefined!7464 Bool) (index!28894 (_ BitVec 32)) (x!57635 (_ BitVec 32))) (Undefined!6652) (MissingVacant!6652 (index!28895 (_ BitVec 32))) )
))
(declare-fun lt!290155 () SeekEntryResult!6652)

(assert (=> b!627777 (= res!405620 (or (= lt!290155 (MissingZero!6652 i!1108)) (= lt!290155 (MissingVacant!6652 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37950 (_ BitVec 32)) SeekEntryResult!6652)

(assert (=> b!627777 (= lt!290155 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627778 () Bool)

(assert (=> b!627778 (= e!359245 false)))

(declare-fun lt!290154 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627778 (= lt!290154 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627779 () Bool)

(declare-fun res!405617 () Bool)

(assert (=> b!627779 (=> (not res!405617) (not e!359245))))

(assert (=> b!627779 (= res!405617 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18215 a!2986) index!984) (select (arr!18215 a!2986) j!136))) (not (= (select (arr!18215 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627780 () Bool)

(declare-fun res!405623 () Bool)

(assert (=> b!627780 (=> (not res!405623) (not e!359245))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37950 (_ BitVec 32)) SeekEntryResult!6652)

(assert (=> b!627780 (= res!405623 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18215 a!2986) j!136) a!2986 mask!3053) (Found!6652 j!136)))))

(declare-fun b!627781 () Bool)

(declare-fun res!405622 () Bool)

(assert (=> b!627781 (=> (not res!405622) (not e!359245))))

(declare-datatypes ((List!12295 0))(
  ( (Nil!12292) (Cons!12291 (h!13336 (_ BitVec 64)) (t!18514 List!12295)) )
))
(declare-fun arrayNoDuplicates!0 (array!37950 (_ BitVec 32) List!12295) Bool)

(assert (=> b!627781 (= res!405622 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12292))))

(declare-fun b!627772 () Bool)

(declare-fun res!405618 () Bool)

(assert (=> b!627772 (=> (not res!405618) (not e!359247))))

(assert (=> b!627772 (= res!405618 (validKeyInArray!0 k0!1786))))

(declare-fun res!405619 () Bool)

(assert (=> start!56646 (=> (not res!405619) (not e!359247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56646 (= res!405619 (validMask!0 mask!3053))))

(assert (=> start!56646 e!359247))

(assert (=> start!56646 true))

(declare-fun array_inv!14098 (array!37950) Bool)

(assert (=> start!56646 (array_inv!14098 a!2986)))

(assert (= (and start!56646 res!405619) b!627774))

(assert (= (and b!627774 res!405613) b!627776))

(assert (= (and b!627776 res!405614) b!627772))

(assert (= (and b!627772 res!405618) b!627773))

(assert (= (and b!627773 res!405621) b!627777))

(assert (= (and b!627777 res!405620) b!627775))

(assert (= (and b!627775 res!405616) b!627781))

(assert (= (and b!627781 res!405622) b!627771))

(assert (= (and b!627771 res!405615) b!627780))

(assert (= (and b!627780 res!405623) b!627779))

(assert (= (and b!627779 res!405617) b!627778))

(declare-fun m!602533 () Bool)

(assert (=> b!627776 m!602533))

(assert (=> b!627776 m!602533))

(declare-fun m!602535 () Bool)

(assert (=> b!627776 m!602535))

(declare-fun m!602537 () Bool)

(assert (=> b!627775 m!602537))

(declare-fun m!602539 () Bool)

(assert (=> b!627778 m!602539))

(declare-fun m!602541 () Bool)

(assert (=> b!627771 m!602541))

(declare-fun m!602543 () Bool)

(assert (=> b!627771 m!602543))

(declare-fun m!602545 () Bool)

(assert (=> b!627771 m!602545))

(declare-fun m!602547 () Bool)

(assert (=> b!627773 m!602547))

(declare-fun m!602549 () Bool)

(assert (=> b!627781 m!602549))

(assert (=> b!627780 m!602533))

(assert (=> b!627780 m!602533))

(declare-fun m!602551 () Bool)

(assert (=> b!627780 m!602551))

(declare-fun m!602553 () Bool)

(assert (=> b!627779 m!602553))

(assert (=> b!627779 m!602533))

(declare-fun m!602555 () Bool)

(assert (=> b!627772 m!602555))

(declare-fun m!602557 () Bool)

(assert (=> b!627777 m!602557))

(declare-fun m!602559 () Bool)

(assert (=> start!56646 m!602559))

(declare-fun m!602561 () Bool)

(assert (=> start!56646 m!602561))

(check-sat (not b!627776) (not b!627773) (not b!627772) (not b!627778) (not b!627775) (not b!627781) (not b!627780) (not b!627777) (not start!56646))
(check-sat)
