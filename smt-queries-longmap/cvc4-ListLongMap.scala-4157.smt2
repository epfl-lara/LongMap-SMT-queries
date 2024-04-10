; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56634 () Bool)

(assert start!56634)

(declare-fun b!627613 () Bool)

(declare-fun res!405320 () Bool)

(declare-fun e!359304 () Bool)

(assert (=> b!627613 (=> (not res!405320) (not e!359304))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37926 0))(
  ( (array!37927 (arr!18203 (Array (_ BitVec 32) (_ BitVec 64))) (size!18567 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37926)

(assert (=> b!627613 (= res!405320 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18203 a!2986) index!984) (select (arr!18203 a!2986) j!136))) (not (= (select (arr!18203 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627614 () Bool)

(declare-fun res!405321 () Bool)

(assert (=> b!627614 (=> (not res!405321) (not e!359304))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6643 0))(
  ( (MissingZero!6643 (index!28856 (_ BitVec 32))) (Found!6643 (index!28857 (_ BitVec 32))) (Intermediate!6643 (undefined!7455 Bool) (index!28858 (_ BitVec 32)) (x!57591 (_ BitVec 32))) (Undefined!6643) (MissingVacant!6643 (index!28859 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37926 (_ BitVec 32)) SeekEntryResult!6643)

(assert (=> b!627614 (= res!405321 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18203 a!2986) j!136) a!2986 mask!3053) (Found!6643 j!136)))))

(declare-fun b!627615 () Bool)

(declare-fun res!405319 () Bool)

(assert (=> b!627615 (=> (not res!405319) (not e!359304))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!627615 (= res!405319 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18203 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18203 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627616 () Bool)

(declare-fun res!405318 () Bool)

(declare-fun e!359302 () Bool)

(assert (=> b!627616 (=> (not res!405318) (not e!359302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627616 (= res!405318 (validKeyInArray!0 k!1786))))

(declare-fun b!627617 () Bool)

(declare-fun res!405322 () Bool)

(assert (=> b!627617 (=> (not res!405322) (not e!359304))))

(declare-datatypes ((List!12244 0))(
  ( (Nil!12241) (Cons!12240 (h!13285 (_ BitVec 64)) (t!18472 List!12244)) )
))
(declare-fun arrayNoDuplicates!0 (array!37926 (_ BitVec 32) List!12244) Bool)

(assert (=> b!627617 (= res!405322 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12241))))

(declare-fun res!405323 () Bool)

(assert (=> start!56634 (=> (not res!405323) (not e!359302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56634 (= res!405323 (validMask!0 mask!3053))))

(assert (=> start!56634 e!359302))

(assert (=> start!56634 true))

(declare-fun array_inv!13999 (array!37926) Bool)

(assert (=> start!56634 (array_inv!13999 a!2986)))

(declare-fun b!627618 () Bool)

(declare-fun res!405315 () Bool)

(assert (=> b!627618 (=> (not res!405315) (not e!359304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37926 (_ BitVec 32)) Bool)

(assert (=> b!627618 (= res!405315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627619 () Bool)

(assert (=> b!627619 (= e!359302 e!359304)))

(declare-fun res!405316 () Bool)

(assert (=> b!627619 (=> (not res!405316) (not e!359304))))

(declare-fun lt!290311 () SeekEntryResult!6643)

(assert (=> b!627619 (= res!405316 (or (= lt!290311 (MissingZero!6643 i!1108)) (= lt!290311 (MissingVacant!6643 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37926 (_ BitVec 32)) SeekEntryResult!6643)

(assert (=> b!627619 (= lt!290311 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627620 () Bool)

(declare-fun res!405314 () Bool)

(assert (=> b!627620 (=> (not res!405314) (not e!359302))))

(assert (=> b!627620 (= res!405314 (validKeyInArray!0 (select (arr!18203 a!2986) j!136)))))

(declare-fun b!627621 () Bool)

(declare-fun res!405313 () Bool)

(assert (=> b!627621 (=> (not res!405313) (not e!359302))))

(declare-fun arrayContainsKey!0 (array!37926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627621 (= res!405313 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627622 () Bool)

(assert (=> b!627622 (= e!359304 false)))

(declare-fun lt!290310 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627622 (= lt!290310 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627623 () Bool)

(declare-fun res!405317 () Bool)

(assert (=> b!627623 (=> (not res!405317) (not e!359302))))

(assert (=> b!627623 (= res!405317 (and (= (size!18567 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18567 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18567 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56634 res!405323) b!627623))

(assert (= (and b!627623 res!405317) b!627620))

(assert (= (and b!627620 res!405314) b!627616))

(assert (= (and b!627616 res!405318) b!627621))

(assert (= (and b!627621 res!405313) b!627619))

(assert (= (and b!627619 res!405316) b!627618))

(assert (= (and b!627618 res!405315) b!627617))

(assert (= (and b!627617 res!405322) b!627615))

(assert (= (and b!627615 res!405319) b!627614))

(assert (= (and b!627614 res!405321) b!627613))

(assert (= (and b!627613 res!405320) b!627622))

(declare-fun m!602907 () Bool)

(assert (=> b!627616 m!602907))

(declare-fun m!602909 () Bool)

(assert (=> b!627622 m!602909))

(declare-fun m!602911 () Bool)

(assert (=> b!627618 m!602911))

(declare-fun m!602913 () Bool)

(assert (=> b!627619 m!602913))

(declare-fun m!602915 () Bool)

(assert (=> b!627615 m!602915))

(declare-fun m!602917 () Bool)

(assert (=> b!627615 m!602917))

(declare-fun m!602919 () Bool)

(assert (=> b!627615 m!602919))

(declare-fun m!602921 () Bool)

(assert (=> b!627613 m!602921))

(declare-fun m!602923 () Bool)

(assert (=> b!627613 m!602923))

(declare-fun m!602925 () Bool)

(assert (=> b!627617 m!602925))

(declare-fun m!602927 () Bool)

(assert (=> start!56634 m!602927))

(declare-fun m!602929 () Bool)

(assert (=> start!56634 m!602929))

(assert (=> b!627614 m!602923))

(assert (=> b!627614 m!602923))

(declare-fun m!602931 () Bool)

(assert (=> b!627614 m!602931))

(assert (=> b!627620 m!602923))

(assert (=> b!627620 m!602923))

(declare-fun m!602933 () Bool)

(assert (=> b!627620 m!602933))

(declare-fun m!602935 () Bool)

(assert (=> b!627621 m!602935))

(push 1)

