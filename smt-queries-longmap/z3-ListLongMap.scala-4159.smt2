; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56644 () Bool)

(assert start!56644)

(declare-fun b!627778 () Bool)

(declare-fun res!405485 () Bool)

(declare-fun e!359347 () Bool)

(assert (=> b!627778 (=> (not res!405485) (not e!359347))))

(declare-datatypes ((array!37936 0))(
  ( (array!37937 (arr!18208 (Array (_ BitVec 32) (_ BitVec 64))) (size!18572 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37936)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37936 (_ BitVec 32)) Bool)

(assert (=> b!627778 (= res!405485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627779 () Bool)

(declare-fun res!405481 () Bool)

(declare-fun e!359348 () Bool)

(assert (=> b!627779 (=> (not res!405481) (not e!359348))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627779 (= res!405481 (and (= (size!18572 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18572 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18572 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!405487 () Bool)

(assert (=> start!56644 (=> (not res!405487) (not e!359348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56644 (= res!405487 (validMask!0 mask!3053))))

(assert (=> start!56644 e!359348))

(assert (=> start!56644 true))

(declare-fun array_inv!14004 (array!37936) Bool)

(assert (=> start!56644 (array_inv!14004 a!2986)))

(declare-fun b!627780 () Bool)

(declare-fun res!405480 () Bool)

(assert (=> b!627780 (=> (not res!405480) (not e!359347))))

(declare-datatypes ((List!12249 0))(
  ( (Nil!12246) (Cons!12245 (h!13290 (_ BitVec 64)) (t!18477 List!12249)) )
))
(declare-fun arrayNoDuplicates!0 (array!37936 (_ BitVec 32) List!12249) Bool)

(assert (=> b!627780 (= res!405480 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12246))))

(declare-fun b!627781 () Bool)

(declare-fun res!405488 () Bool)

(assert (=> b!627781 (=> (not res!405488) (not e!359347))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!627781 (= res!405488 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18208 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18208 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627782 () Bool)

(declare-fun res!405483 () Bool)

(assert (=> b!627782 (=> (not res!405483) (not e!359347))))

(assert (=> b!627782 (= res!405483 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18208 a!2986) index!984) (select (arr!18208 a!2986) j!136))) (not (= (select (arr!18208 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627783 () Bool)

(declare-fun res!405479 () Bool)

(assert (=> b!627783 (=> (not res!405479) (not e!359348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627783 (= res!405479 (validKeyInArray!0 (select (arr!18208 a!2986) j!136)))))

(declare-fun b!627784 () Bool)

(declare-fun res!405478 () Bool)

(assert (=> b!627784 (=> (not res!405478) (not e!359348))))

(declare-fun arrayContainsKey!0 (array!37936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627784 (= res!405478 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627785 () Bool)

(declare-fun res!405484 () Bool)

(assert (=> b!627785 (=> (not res!405484) (not e!359347))))

(declare-datatypes ((SeekEntryResult!6648 0))(
  ( (MissingZero!6648 (index!28876 (_ BitVec 32))) (Found!6648 (index!28877 (_ BitVec 32))) (Intermediate!6648 (undefined!7460 Bool) (index!28878 (_ BitVec 32)) (x!57612 (_ BitVec 32))) (Undefined!6648) (MissingVacant!6648 (index!28879 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37936 (_ BitVec 32)) SeekEntryResult!6648)

(assert (=> b!627785 (= res!405484 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18208 a!2986) j!136) a!2986 mask!3053) (Found!6648 j!136)))))

(declare-fun b!627786 () Bool)

(declare-fun res!405486 () Bool)

(assert (=> b!627786 (=> (not res!405486) (not e!359348))))

(assert (=> b!627786 (= res!405486 (validKeyInArray!0 k0!1786))))

(declare-fun b!627787 () Bool)

(assert (=> b!627787 (= e!359348 e!359347)))

(declare-fun res!405482 () Bool)

(assert (=> b!627787 (=> (not res!405482) (not e!359347))))

(declare-fun lt!290340 () SeekEntryResult!6648)

(assert (=> b!627787 (= res!405482 (or (= lt!290340 (MissingZero!6648 i!1108)) (= lt!290340 (MissingVacant!6648 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37936 (_ BitVec 32)) SeekEntryResult!6648)

(assert (=> b!627787 (= lt!290340 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627788 () Bool)

(assert (=> b!627788 (= e!359347 false)))

(declare-fun lt!290341 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627788 (= lt!290341 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56644 res!405487) b!627779))

(assert (= (and b!627779 res!405481) b!627783))

(assert (= (and b!627783 res!405479) b!627786))

(assert (= (and b!627786 res!405486) b!627784))

(assert (= (and b!627784 res!405478) b!627787))

(assert (= (and b!627787 res!405482) b!627778))

(assert (= (and b!627778 res!405485) b!627780))

(assert (= (and b!627780 res!405480) b!627781))

(assert (= (and b!627781 res!405488) b!627785))

(assert (= (and b!627785 res!405484) b!627782))

(assert (= (and b!627782 res!405483) b!627788))

(declare-fun m!603057 () Bool)

(assert (=> start!56644 m!603057))

(declare-fun m!603059 () Bool)

(assert (=> start!56644 m!603059))

(declare-fun m!603061 () Bool)

(assert (=> b!627788 m!603061))

(declare-fun m!603063 () Bool)

(assert (=> b!627785 m!603063))

(assert (=> b!627785 m!603063))

(declare-fun m!603065 () Bool)

(assert (=> b!627785 m!603065))

(declare-fun m!603067 () Bool)

(assert (=> b!627784 m!603067))

(declare-fun m!603069 () Bool)

(assert (=> b!627787 m!603069))

(declare-fun m!603071 () Bool)

(assert (=> b!627781 m!603071))

(declare-fun m!603073 () Bool)

(assert (=> b!627781 m!603073))

(declare-fun m!603075 () Bool)

(assert (=> b!627781 m!603075))

(declare-fun m!603077 () Bool)

(assert (=> b!627778 m!603077))

(assert (=> b!627783 m!603063))

(assert (=> b!627783 m!603063))

(declare-fun m!603079 () Bool)

(assert (=> b!627783 m!603079))

(declare-fun m!603081 () Bool)

(assert (=> b!627782 m!603081))

(assert (=> b!627782 m!603063))

(declare-fun m!603083 () Bool)

(assert (=> b!627780 m!603083))

(declare-fun m!603085 () Bool)

(assert (=> b!627786 m!603085))

(check-sat (not b!627783) (not b!627788) (not b!627780) (not start!56644) (not b!627786) (not b!627785) (not b!627784) (not b!627778) (not b!627787))
(check-sat)
