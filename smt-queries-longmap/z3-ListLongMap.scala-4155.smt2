; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56620 () Bool)

(assert start!56620)

(declare-fun b!627382 () Bool)

(declare-fun res!405084 () Bool)

(declare-fun e!359239 () Bool)

(assert (=> b!627382 (=> (not res!405084) (not e!359239))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37912 0))(
  ( (array!37913 (arr!18196 (Array (_ BitVec 32) (_ BitVec 64))) (size!18560 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37912)

(assert (=> b!627382 (= res!405084 (and (= (size!18560 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18560 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18560 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627383 () Bool)

(declare-fun e!359241 () Bool)

(assert (=> b!627383 (= e!359239 e!359241)))

(declare-fun res!405087 () Bool)

(assert (=> b!627383 (=> (not res!405087) (not e!359241))))

(declare-datatypes ((SeekEntryResult!6636 0))(
  ( (MissingZero!6636 (index!28828 (_ BitVec 32))) (Found!6636 (index!28829 (_ BitVec 32))) (Intermediate!6636 (undefined!7448 Bool) (index!28830 (_ BitVec 32)) (x!57568 (_ BitVec 32))) (Undefined!6636) (MissingVacant!6636 (index!28831 (_ BitVec 32))) )
))
(declare-fun lt!290268 () SeekEntryResult!6636)

(assert (=> b!627383 (= res!405087 (or (= lt!290268 (MissingZero!6636 i!1108)) (= lt!290268 (MissingVacant!6636 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37912 (_ BitVec 32)) SeekEntryResult!6636)

(assert (=> b!627383 (= lt!290268 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!405092 () Bool)

(assert (=> start!56620 (=> (not res!405092) (not e!359239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56620 (= res!405092 (validMask!0 mask!3053))))

(assert (=> start!56620 e!359239))

(assert (=> start!56620 true))

(declare-fun array_inv!13992 (array!37912) Bool)

(assert (=> start!56620 (array_inv!13992 a!2986)))

(declare-fun b!627384 () Bool)

(declare-fun res!405083 () Bool)

(assert (=> b!627384 (=> (not res!405083) (not e!359241))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!627384 (= res!405083 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18196 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18196 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627385 () Bool)

(assert (=> b!627385 (= e!359241 false)))

(declare-fun lt!290269 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627385 (= lt!290269 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627386 () Bool)

(declare-fun res!405086 () Bool)

(assert (=> b!627386 (=> (not res!405086) (not e!359239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627386 (= res!405086 (validKeyInArray!0 k0!1786))))

(declare-fun b!627387 () Bool)

(declare-fun res!405082 () Bool)

(assert (=> b!627387 (=> (not res!405082) (not e!359239))))

(declare-fun arrayContainsKey!0 (array!37912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627387 (= res!405082 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627388 () Bool)

(declare-fun res!405091 () Bool)

(assert (=> b!627388 (=> (not res!405091) (not e!359241))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37912 (_ BitVec 32)) SeekEntryResult!6636)

(assert (=> b!627388 (= res!405091 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18196 a!2986) j!136) a!2986 mask!3053) (Found!6636 j!136)))))

(declare-fun b!627389 () Bool)

(declare-fun res!405090 () Bool)

(assert (=> b!627389 (=> (not res!405090) (not e!359241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37912 (_ BitVec 32)) Bool)

(assert (=> b!627389 (= res!405090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627390 () Bool)

(declare-fun res!405088 () Bool)

(assert (=> b!627390 (=> (not res!405088) (not e!359241))))

(declare-datatypes ((List!12237 0))(
  ( (Nil!12234) (Cons!12233 (h!13278 (_ BitVec 64)) (t!18465 List!12237)) )
))
(declare-fun arrayNoDuplicates!0 (array!37912 (_ BitVec 32) List!12237) Bool)

(assert (=> b!627390 (= res!405088 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12234))))

(declare-fun b!627391 () Bool)

(declare-fun res!405085 () Bool)

(assert (=> b!627391 (=> (not res!405085) (not e!359239))))

(assert (=> b!627391 (= res!405085 (validKeyInArray!0 (select (arr!18196 a!2986) j!136)))))

(declare-fun b!627392 () Bool)

(declare-fun res!405089 () Bool)

(assert (=> b!627392 (=> (not res!405089) (not e!359241))))

(assert (=> b!627392 (= res!405089 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18196 a!2986) index!984) (select (arr!18196 a!2986) j!136))) (not (= (select (arr!18196 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!56620 res!405092) b!627382))

(assert (= (and b!627382 res!405084) b!627391))

(assert (= (and b!627391 res!405085) b!627386))

(assert (= (and b!627386 res!405086) b!627387))

(assert (= (and b!627387 res!405082) b!627383))

(assert (= (and b!627383 res!405087) b!627389))

(assert (= (and b!627389 res!405090) b!627390))

(assert (= (and b!627390 res!405088) b!627384))

(assert (= (and b!627384 res!405083) b!627388))

(assert (= (and b!627388 res!405091) b!627392))

(assert (= (and b!627392 res!405089) b!627385))

(declare-fun m!602697 () Bool)

(assert (=> b!627384 m!602697))

(declare-fun m!602699 () Bool)

(assert (=> b!627384 m!602699))

(declare-fun m!602701 () Bool)

(assert (=> b!627384 m!602701))

(declare-fun m!602703 () Bool)

(assert (=> b!627383 m!602703))

(declare-fun m!602705 () Bool)

(assert (=> b!627385 m!602705))

(declare-fun m!602707 () Bool)

(assert (=> b!627392 m!602707))

(declare-fun m!602709 () Bool)

(assert (=> b!627392 m!602709))

(declare-fun m!602711 () Bool)

(assert (=> b!627387 m!602711))

(assert (=> b!627391 m!602709))

(assert (=> b!627391 m!602709))

(declare-fun m!602713 () Bool)

(assert (=> b!627391 m!602713))

(declare-fun m!602715 () Bool)

(assert (=> b!627386 m!602715))

(declare-fun m!602717 () Bool)

(assert (=> start!56620 m!602717))

(declare-fun m!602719 () Bool)

(assert (=> start!56620 m!602719))

(assert (=> b!627388 m!602709))

(assert (=> b!627388 m!602709))

(declare-fun m!602721 () Bool)

(assert (=> b!627388 m!602721))

(declare-fun m!602723 () Bool)

(assert (=> b!627390 m!602723))

(declare-fun m!602725 () Bool)

(assert (=> b!627389 m!602725))

(check-sat (not b!627383) (not start!56620) (not b!627386) (not b!627385) (not b!627389) (not b!627387) (not b!627391) (not b!627388) (not b!627390))
(check-sat)
