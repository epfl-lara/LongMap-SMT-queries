; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56508 () Bool)

(assert start!56508)

(declare-fun res!404067 () Bool)

(declare-fun e!358817 () Bool)

(assert (=> start!56508 (=> (not res!404067) (not e!358817))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56508 (= res!404067 (validMask!0 mask!3053))))

(assert (=> start!56508 e!358817))

(assert (=> start!56508 true))

(declare-datatypes ((array!37845 0))(
  ( (array!37846 (arr!18164 (Array (_ BitVec 32) (_ BitVec 64))) (size!18528 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37845)

(declare-fun array_inv!13960 (array!37845) Bool)

(assert (=> start!56508 (array_inv!13960 a!2986)))

(declare-fun b!626219 () Bool)

(declare-fun e!358816 () Bool)

(assert (=> b!626219 (= e!358817 e!358816)))

(declare-fun res!404064 () Bool)

(assert (=> b!626219 (=> (not res!404064) (not e!358816))))

(declare-datatypes ((SeekEntryResult!6604 0))(
  ( (MissingZero!6604 (index!28700 (_ BitVec 32))) (Found!6604 (index!28701 (_ BitVec 32))) (Intermediate!6604 (undefined!7416 Bool) (index!28702 (_ BitVec 32)) (x!57445 (_ BitVec 32))) (Undefined!6604) (MissingVacant!6604 (index!28703 (_ BitVec 32))) )
))
(declare-fun lt!290014 () SeekEntryResult!6604)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626219 (= res!404064 (or (= lt!290014 (MissingZero!6604 i!1108)) (= lt!290014 (MissingVacant!6604 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37845 (_ BitVec 32)) SeekEntryResult!6604)

(assert (=> b!626219 (= lt!290014 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!626220 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!626220 (= e!358816 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18164 a!2986) index!984) (select (arr!18164 a!2986) j!136))) (bvsge index!984 (size!18528 a!2986))))))

(declare-fun b!626221 () Bool)

(declare-fun res!404071 () Bool)

(assert (=> b!626221 (=> (not res!404071) (not e!358816))))

(declare-datatypes ((List!12205 0))(
  ( (Nil!12202) (Cons!12201 (h!13246 (_ BitVec 64)) (t!18433 List!12205)) )
))
(declare-fun arrayNoDuplicates!0 (array!37845 (_ BitVec 32) List!12205) Bool)

(assert (=> b!626221 (= res!404071 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12202))))

(declare-fun b!626222 () Bool)

(declare-fun res!404065 () Bool)

(assert (=> b!626222 (=> (not res!404065) (not e!358817))))

(declare-fun arrayContainsKey!0 (array!37845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626222 (= res!404065 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626223 () Bool)

(declare-fun res!404066 () Bool)

(assert (=> b!626223 (=> (not res!404066) (not e!358816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37845 (_ BitVec 32)) Bool)

(assert (=> b!626223 (= res!404066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626224 () Bool)

(declare-fun res!404068 () Bool)

(assert (=> b!626224 (=> (not res!404068) (not e!358817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626224 (= res!404068 (validKeyInArray!0 (select (arr!18164 a!2986) j!136)))))

(declare-fun b!626225 () Bool)

(declare-fun res!404072 () Bool)

(assert (=> b!626225 (=> (not res!404072) (not e!358817))))

(assert (=> b!626225 (= res!404072 (validKeyInArray!0 k!1786))))

(declare-fun b!626226 () Bool)

(declare-fun res!404063 () Bool)

(assert (=> b!626226 (=> (not res!404063) (not e!358816))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37845 (_ BitVec 32)) SeekEntryResult!6604)

(assert (=> b!626226 (= res!404063 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18164 a!2986) j!136) a!2986 mask!3053) (Found!6604 j!136)))))

(declare-fun b!626227 () Bool)

(declare-fun res!404070 () Bool)

(assert (=> b!626227 (=> (not res!404070) (not e!358817))))

(assert (=> b!626227 (= res!404070 (and (= (size!18528 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18528 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18528 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626228 () Bool)

(declare-fun res!404069 () Bool)

(assert (=> b!626228 (=> (not res!404069) (not e!358816))))

(assert (=> b!626228 (= res!404069 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18164 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18164 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56508 res!404067) b!626227))

(assert (= (and b!626227 res!404070) b!626224))

(assert (= (and b!626224 res!404068) b!626225))

(assert (= (and b!626225 res!404072) b!626222))

(assert (= (and b!626222 res!404065) b!626219))

(assert (= (and b!626219 res!404064) b!626223))

(assert (= (and b!626223 res!404066) b!626221))

(assert (= (and b!626221 res!404071) b!626228))

(assert (= (and b!626228 res!404069) b!626226))

(assert (= (and b!626226 res!404063) b!626220))

(declare-fun m!601685 () Bool)

(assert (=> b!626221 m!601685))

(declare-fun m!601687 () Bool)

(assert (=> b!626222 m!601687))

(declare-fun m!601689 () Bool)

(assert (=> b!626220 m!601689))

(declare-fun m!601691 () Bool)

(assert (=> b!626220 m!601691))

(declare-fun m!601693 () Bool)

(assert (=> start!56508 m!601693))

(declare-fun m!601695 () Bool)

(assert (=> start!56508 m!601695))

(declare-fun m!601697 () Bool)

(assert (=> b!626219 m!601697))

(declare-fun m!601699 () Bool)

(assert (=> b!626225 m!601699))

(assert (=> b!626224 m!601691))

(assert (=> b!626224 m!601691))

(declare-fun m!601701 () Bool)

(assert (=> b!626224 m!601701))

(declare-fun m!601703 () Bool)

(assert (=> b!626223 m!601703))

(declare-fun m!601705 () Bool)

(assert (=> b!626228 m!601705))

(declare-fun m!601707 () Bool)

(assert (=> b!626228 m!601707))

(declare-fun m!601709 () Bool)

(assert (=> b!626228 m!601709))

(assert (=> b!626226 m!601691))

(assert (=> b!626226 m!601691))

(declare-fun m!601711 () Bool)

(assert (=> b!626226 m!601711))

(push 1)

(assert (not b!626221))

(assert (not b!626225))

(assert (not b!626219))

(assert (not b!626226))

(assert (not start!56508))

(assert (not b!626223))

(assert (not b!626222))

(assert (not b!626224))

(check-sat)

(pop 1)

(push 1)

(check-sat)

