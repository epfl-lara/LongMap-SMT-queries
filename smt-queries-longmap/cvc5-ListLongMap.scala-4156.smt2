; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56624 () Bool)

(assert start!56624)

(declare-fun b!627448 () Bool)

(declare-fun res!405148 () Bool)

(declare-fun e!359258 () Bool)

(assert (=> b!627448 (=> (not res!405148) (not e!359258))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37916 0))(
  ( (array!37917 (arr!18198 (Array (_ BitVec 32) (_ BitVec 64))) (size!18562 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37916)

(assert (=> b!627448 (= res!405148 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18198 a!2986) index!984) (select (arr!18198 a!2986) j!136))) (not (= (select (arr!18198 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627449 () Bool)

(declare-fun res!405150 () Bool)

(declare-fun e!359257 () Bool)

(assert (=> b!627449 (=> (not res!405150) (not e!359257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627449 (= res!405150 (validKeyInArray!0 (select (arr!18198 a!2986) j!136)))))

(declare-fun b!627450 () Bool)

(declare-fun res!405152 () Bool)

(assert (=> b!627450 (=> (not res!405152) (not e!359258))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!627450 (= res!405152 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18198 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18198 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627451 () Bool)

(declare-fun res!405157 () Bool)

(assert (=> b!627451 (=> (not res!405157) (not e!359258))))

(declare-datatypes ((SeekEntryResult!6638 0))(
  ( (MissingZero!6638 (index!28836 (_ BitVec 32))) (Found!6638 (index!28837 (_ BitVec 32))) (Intermediate!6638 (undefined!7450 Bool) (index!28838 (_ BitVec 32)) (x!57578 (_ BitVec 32))) (Undefined!6638) (MissingVacant!6638 (index!28839 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37916 (_ BitVec 32)) SeekEntryResult!6638)

(assert (=> b!627451 (= res!405157 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18198 a!2986) j!136) a!2986 mask!3053) (Found!6638 j!136)))))

(declare-fun b!627452 () Bool)

(declare-fun res!405154 () Bool)

(assert (=> b!627452 (=> (not res!405154) (not e!359257))))

(declare-fun arrayContainsKey!0 (array!37916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627452 (= res!405154 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!405153 () Bool)

(assert (=> start!56624 (=> (not res!405153) (not e!359257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56624 (= res!405153 (validMask!0 mask!3053))))

(assert (=> start!56624 e!359257))

(assert (=> start!56624 true))

(declare-fun array_inv!13994 (array!37916) Bool)

(assert (=> start!56624 (array_inv!13994 a!2986)))

(declare-fun b!627453 () Bool)

(declare-fun res!405158 () Bool)

(assert (=> b!627453 (=> (not res!405158) (not e!359258))))

(declare-datatypes ((List!12239 0))(
  ( (Nil!12236) (Cons!12235 (h!13280 (_ BitVec 64)) (t!18467 List!12239)) )
))
(declare-fun arrayNoDuplicates!0 (array!37916 (_ BitVec 32) List!12239) Bool)

(assert (=> b!627453 (= res!405158 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12236))))

(declare-fun b!627454 () Bool)

(declare-fun res!405149 () Bool)

(assert (=> b!627454 (=> (not res!405149) (not e!359257))))

(assert (=> b!627454 (= res!405149 (and (= (size!18562 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18562 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18562 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627455 () Bool)

(declare-fun res!405151 () Bool)

(assert (=> b!627455 (=> (not res!405151) (not e!359257))))

(assert (=> b!627455 (= res!405151 (validKeyInArray!0 k!1786))))

(declare-fun b!627456 () Bool)

(declare-fun res!405156 () Bool)

(assert (=> b!627456 (=> (not res!405156) (not e!359258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37916 (_ BitVec 32)) Bool)

(assert (=> b!627456 (= res!405156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627457 () Bool)

(assert (=> b!627457 (= e!359257 e!359258)))

(declare-fun res!405155 () Bool)

(assert (=> b!627457 (=> (not res!405155) (not e!359258))))

(declare-fun lt!290280 () SeekEntryResult!6638)

(assert (=> b!627457 (= res!405155 (or (= lt!290280 (MissingZero!6638 i!1108)) (= lt!290280 (MissingVacant!6638 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37916 (_ BitVec 32)) SeekEntryResult!6638)

(assert (=> b!627457 (= lt!290280 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627458 () Bool)

(assert (=> b!627458 (= e!359258 false)))

(declare-fun lt!290281 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627458 (= lt!290281 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56624 res!405153) b!627454))

(assert (= (and b!627454 res!405149) b!627449))

(assert (= (and b!627449 res!405150) b!627455))

(assert (= (and b!627455 res!405151) b!627452))

(assert (= (and b!627452 res!405154) b!627457))

(assert (= (and b!627457 res!405155) b!627456))

(assert (= (and b!627456 res!405156) b!627453))

(assert (= (and b!627453 res!405158) b!627450))

(assert (= (and b!627450 res!405152) b!627451))

(assert (= (and b!627451 res!405157) b!627448))

(assert (= (and b!627448 res!405148) b!627458))

(declare-fun m!602757 () Bool)

(assert (=> b!627455 m!602757))

(declare-fun m!602759 () Bool)

(assert (=> b!627453 m!602759))

(declare-fun m!602761 () Bool)

(assert (=> b!627458 m!602761))

(declare-fun m!602763 () Bool)

(assert (=> b!627449 m!602763))

(assert (=> b!627449 m!602763))

(declare-fun m!602765 () Bool)

(assert (=> b!627449 m!602765))

(declare-fun m!602767 () Bool)

(assert (=> b!627456 m!602767))

(assert (=> b!627451 m!602763))

(assert (=> b!627451 m!602763))

(declare-fun m!602769 () Bool)

(assert (=> b!627451 m!602769))

(declare-fun m!602771 () Bool)

(assert (=> start!56624 m!602771))

(declare-fun m!602773 () Bool)

(assert (=> start!56624 m!602773))

(declare-fun m!602775 () Bool)

(assert (=> b!627452 m!602775))

(declare-fun m!602777 () Bool)

(assert (=> b!627450 m!602777))

(declare-fun m!602779 () Bool)

(assert (=> b!627450 m!602779))

(declare-fun m!602781 () Bool)

(assert (=> b!627450 m!602781))

(declare-fun m!602783 () Bool)

(assert (=> b!627457 m!602783))

(declare-fun m!602785 () Bool)

(assert (=> b!627448 m!602785))

(assert (=> b!627448 m!602763))

(push 1)

