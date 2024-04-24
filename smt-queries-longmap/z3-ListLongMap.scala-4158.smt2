; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56688 () Bool)

(assert start!56688)

(declare-fun b!627855 () Bool)

(declare-fun res!405454 () Bool)

(declare-fun e!359440 () Bool)

(assert (=> b!627855 (=> (not res!405454) (not e!359440))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37923 0))(
  ( (array!37924 (arr!18199 (Array (_ BitVec 32) (_ BitVec 64))) (size!18563 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37923)

(declare-datatypes ((SeekEntryResult!6595 0))(
  ( (MissingZero!6595 (index!28664 (_ BitVec 32))) (Found!6595 (index!28665 (_ BitVec 32))) (Intermediate!6595 (undefined!7407 Bool) (index!28666 (_ BitVec 32)) (x!57554 (_ BitVec 32))) (Undefined!6595) (MissingVacant!6595 (index!28667 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37923 (_ BitVec 32)) SeekEntryResult!6595)

(assert (=> b!627855 (= res!405454 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18199 a!2986) j!136) a!2986 mask!3053) (Found!6595 j!136)))))

(declare-fun res!405460 () Bool)

(declare-fun e!359441 () Bool)

(assert (=> start!56688 (=> (not res!405460) (not e!359441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56688 (= res!405460 (validMask!0 mask!3053))))

(assert (=> start!56688 e!359441))

(assert (=> start!56688 true))

(declare-fun array_inv!14058 (array!37923) Bool)

(assert (=> start!56688 (array_inv!14058 a!2986)))

(declare-fun b!627856 () Bool)

(declare-fun res!405455 () Bool)

(assert (=> b!627856 (=> (not res!405455) (not e!359441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627856 (= res!405455 (validKeyInArray!0 (select (arr!18199 a!2986) j!136)))))

(declare-fun b!627857 () Bool)

(declare-fun res!405459 () Bool)

(assert (=> b!627857 (=> (not res!405459) (not e!359440))))

(declare-datatypes ((List!12147 0))(
  ( (Nil!12144) (Cons!12143 (h!13191 (_ BitVec 64)) (t!18367 List!12147)) )
))
(declare-fun arrayNoDuplicates!0 (array!37923 (_ BitVec 32) List!12147) Bool)

(assert (=> b!627857 (= res!405459 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12144))))

(declare-fun b!627858 () Bool)

(declare-fun res!405450 () Bool)

(assert (=> b!627858 (=> (not res!405450) (not e!359441))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627858 (= res!405450 (and (= (size!18563 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18563 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18563 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627859 () Bool)

(declare-fun res!405457 () Bool)

(assert (=> b!627859 (=> (not res!405457) (not e!359441))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627859 (= res!405457 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627860 () Bool)

(assert (=> b!627860 (= e!359441 e!359440)))

(declare-fun res!405458 () Bool)

(assert (=> b!627860 (=> (not res!405458) (not e!359440))))

(declare-fun lt!290419 () SeekEntryResult!6595)

(assert (=> b!627860 (= res!405458 (or (= lt!290419 (MissingZero!6595 i!1108)) (= lt!290419 (MissingVacant!6595 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37923 (_ BitVec 32)) SeekEntryResult!6595)

(assert (=> b!627860 (= lt!290419 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627861 () Bool)

(declare-fun res!405453 () Bool)

(assert (=> b!627861 (=> (not res!405453) (not e!359441))))

(assert (=> b!627861 (= res!405453 (validKeyInArray!0 k0!1786))))

(declare-fun b!627862 () Bool)

(declare-fun res!405451 () Bool)

(assert (=> b!627862 (=> (not res!405451) (not e!359440))))

(assert (=> b!627862 (= res!405451 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18199 a!2986) index!984) (select (arr!18199 a!2986) j!136))) (not (= (select (arr!18199 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627863 () Bool)

(declare-fun res!405452 () Bool)

(assert (=> b!627863 (=> (not res!405452) (not e!359440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37923 (_ BitVec 32)) Bool)

(assert (=> b!627863 (= res!405452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627864 () Bool)

(declare-fun res!405456 () Bool)

(assert (=> b!627864 (=> (not res!405456) (not e!359440))))

(assert (=> b!627864 (= res!405456 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18199 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18199 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627865 () Bool)

(assert (=> b!627865 (= e!359440 false)))

(declare-fun lt!290418 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627865 (= lt!290418 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (= (and start!56688 res!405460) b!627858))

(assert (= (and b!627858 res!405450) b!627856))

(assert (= (and b!627856 res!405455) b!627861))

(assert (= (and b!627861 res!405453) b!627859))

(assert (= (and b!627859 res!405457) b!627860))

(assert (= (and b!627860 res!405458) b!627863))

(assert (= (and b!627863 res!405452) b!627857))

(assert (= (and b!627857 res!405459) b!627864))

(assert (= (and b!627864 res!405456) b!627855))

(assert (= (and b!627855 res!405454) b!627862))

(assert (= (and b!627862 res!405451) b!627865))

(declare-fun m!603427 () Bool)

(assert (=> b!627857 m!603427))

(declare-fun m!603429 () Bool)

(assert (=> start!56688 m!603429))

(declare-fun m!603431 () Bool)

(assert (=> start!56688 m!603431))

(declare-fun m!603433 () Bool)

(assert (=> b!627862 m!603433))

(declare-fun m!603435 () Bool)

(assert (=> b!627862 m!603435))

(declare-fun m!603437 () Bool)

(assert (=> b!627864 m!603437))

(declare-fun m!603439 () Bool)

(assert (=> b!627864 m!603439))

(declare-fun m!603441 () Bool)

(assert (=> b!627864 m!603441))

(assert (=> b!627856 m!603435))

(assert (=> b!627856 m!603435))

(declare-fun m!603443 () Bool)

(assert (=> b!627856 m!603443))

(assert (=> b!627855 m!603435))

(assert (=> b!627855 m!603435))

(declare-fun m!603445 () Bool)

(assert (=> b!627855 m!603445))

(declare-fun m!603447 () Bool)

(assert (=> b!627860 m!603447))

(declare-fun m!603449 () Bool)

(assert (=> b!627859 m!603449))

(declare-fun m!603451 () Bool)

(assert (=> b!627863 m!603451))

(declare-fun m!603453 () Bool)

(assert (=> b!627865 m!603453))

(declare-fun m!603455 () Bool)

(assert (=> b!627861 m!603455))

(check-sat (not b!627859) (not b!627860) (not b!627856) (not b!627857) (not start!56688) (not b!627861) (not b!627855) (not b!627865) (not b!627863))
(check-sat)
