; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56630 () Bool)

(assert start!56630)

(declare-fun b!627547 () Bool)

(declare-fun res!405255 () Bool)

(declare-fun e!359285 () Bool)

(assert (=> b!627547 (=> (not res!405255) (not e!359285))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37922 0))(
  ( (array!37923 (arr!18201 (Array (_ BitVec 32) (_ BitVec 64))) (size!18565 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37922)

(assert (=> b!627547 (= res!405255 (and (= (size!18565 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18565 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18565 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!405248 () Bool)

(assert (=> start!56630 (=> (not res!405248) (not e!359285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56630 (= res!405248 (validMask!0 mask!3053))))

(assert (=> start!56630 e!359285))

(assert (=> start!56630 true))

(declare-fun array_inv!13997 (array!37922) Bool)

(assert (=> start!56630 (array_inv!13997 a!2986)))

(declare-fun b!627548 () Bool)

(declare-fun res!405254 () Bool)

(declare-fun e!359284 () Bool)

(assert (=> b!627548 (=> (not res!405254) (not e!359284))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!627548 (= res!405254 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18201 a!2986) index!984) (select (arr!18201 a!2986) j!136))) (not (= (select (arr!18201 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627549 () Bool)

(declare-fun res!405257 () Bool)

(assert (=> b!627549 (=> (not res!405257) (not e!359285))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627549 (= res!405257 (validKeyInArray!0 k!1786))))

(declare-fun b!627550 () Bool)

(declare-fun res!405256 () Bool)

(assert (=> b!627550 (=> (not res!405256) (not e!359284))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!627550 (= res!405256 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18201 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18201 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627551 () Bool)

(declare-fun res!405252 () Bool)

(assert (=> b!627551 (=> (not res!405252) (not e!359284))))

(declare-datatypes ((List!12242 0))(
  ( (Nil!12239) (Cons!12238 (h!13283 (_ BitVec 64)) (t!18470 List!12242)) )
))
(declare-fun arrayNoDuplicates!0 (array!37922 (_ BitVec 32) List!12242) Bool)

(assert (=> b!627551 (= res!405252 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12239))))

(declare-fun b!627552 () Bool)

(declare-fun res!405249 () Bool)

(assert (=> b!627552 (=> (not res!405249) (not e!359285))))

(declare-fun arrayContainsKey!0 (array!37922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627552 (= res!405249 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627553 () Bool)

(declare-fun res!405250 () Bool)

(assert (=> b!627553 (=> (not res!405250) (not e!359284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37922 (_ BitVec 32)) Bool)

(assert (=> b!627553 (= res!405250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627554 () Bool)

(declare-fun res!405251 () Bool)

(assert (=> b!627554 (=> (not res!405251) (not e!359284))))

(declare-datatypes ((SeekEntryResult!6641 0))(
  ( (MissingZero!6641 (index!28848 (_ BitVec 32))) (Found!6641 (index!28849 (_ BitVec 32))) (Intermediate!6641 (undefined!7453 Bool) (index!28850 (_ BitVec 32)) (x!57589 (_ BitVec 32))) (Undefined!6641) (MissingVacant!6641 (index!28851 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37922 (_ BitVec 32)) SeekEntryResult!6641)

(assert (=> b!627554 (= res!405251 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18201 a!2986) j!136) a!2986 mask!3053) (Found!6641 j!136)))))

(declare-fun b!627555 () Bool)

(declare-fun res!405253 () Bool)

(assert (=> b!627555 (=> (not res!405253) (not e!359285))))

(assert (=> b!627555 (= res!405253 (validKeyInArray!0 (select (arr!18201 a!2986) j!136)))))

(declare-fun b!627556 () Bool)

(assert (=> b!627556 (= e!359284 false)))

(declare-fun lt!290299 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627556 (= lt!290299 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627557 () Bool)

(assert (=> b!627557 (= e!359285 e!359284)))

(declare-fun res!405247 () Bool)

(assert (=> b!627557 (=> (not res!405247) (not e!359284))))

(declare-fun lt!290298 () SeekEntryResult!6641)

(assert (=> b!627557 (= res!405247 (or (= lt!290298 (MissingZero!6641 i!1108)) (= lt!290298 (MissingVacant!6641 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37922 (_ BitVec 32)) SeekEntryResult!6641)

(assert (=> b!627557 (= lt!290298 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!56630 res!405248) b!627547))

(assert (= (and b!627547 res!405255) b!627555))

(assert (= (and b!627555 res!405253) b!627549))

(assert (= (and b!627549 res!405257) b!627552))

(assert (= (and b!627552 res!405249) b!627557))

(assert (= (and b!627557 res!405247) b!627553))

(assert (= (and b!627553 res!405250) b!627551))

(assert (= (and b!627551 res!405252) b!627550))

(assert (= (and b!627550 res!405256) b!627554))

(assert (= (and b!627554 res!405251) b!627548))

(assert (= (and b!627548 res!405254) b!627556))

(declare-fun m!602847 () Bool)

(assert (=> b!627550 m!602847))

(declare-fun m!602849 () Bool)

(assert (=> b!627550 m!602849))

(declare-fun m!602851 () Bool)

(assert (=> b!627550 m!602851))

(declare-fun m!602853 () Bool)

(assert (=> start!56630 m!602853))

(declare-fun m!602855 () Bool)

(assert (=> start!56630 m!602855))

(declare-fun m!602857 () Bool)

(assert (=> b!627555 m!602857))

(assert (=> b!627555 m!602857))

(declare-fun m!602859 () Bool)

(assert (=> b!627555 m!602859))

(declare-fun m!602861 () Bool)

(assert (=> b!627548 m!602861))

(assert (=> b!627548 m!602857))

(declare-fun m!602863 () Bool)

(assert (=> b!627551 m!602863))

(assert (=> b!627554 m!602857))

(assert (=> b!627554 m!602857))

(declare-fun m!602865 () Bool)

(assert (=> b!627554 m!602865))

(declare-fun m!602867 () Bool)

(assert (=> b!627557 m!602867))

(declare-fun m!602869 () Bool)

(assert (=> b!627556 m!602869))

(declare-fun m!602871 () Bool)

(assert (=> b!627553 m!602871))

(declare-fun m!602873 () Bool)

(assert (=> b!627552 m!602873))

(declare-fun m!602875 () Bool)

(assert (=> b!627549 m!602875))

(push 1)

