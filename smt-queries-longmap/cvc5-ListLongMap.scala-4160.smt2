; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56648 () Bool)

(assert start!56648)

(declare-fun b!627844 () Bool)

(declare-fun res!405544 () Bool)

(declare-fun e!359365 () Bool)

(assert (=> b!627844 (=> (not res!405544) (not e!359365))))

(declare-datatypes ((array!37940 0))(
  ( (array!37941 (arr!18210 (Array (_ BitVec 32) (_ BitVec 64))) (size!18574 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37940)

(declare-datatypes ((List!12251 0))(
  ( (Nil!12248) (Cons!12247 (h!13292 (_ BitVec 64)) (t!18479 List!12251)) )
))
(declare-fun arrayNoDuplicates!0 (array!37940 (_ BitVec 32) List!12251) Bool)

(assert (=> b!627844 (= res!405544 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12248))))

(declare-fun b!627845 () Bool)

(declare-fun e!359366 () Bool)

(assert (=> b!627845 (= e!359366 e!359365)))

(declare-fun res!405554 () Bool)

(assert (=> b!627845 (=> (not res!405554) (not e!359365))))

(declare-datatypes ((SeekEntryResult!6650 0))(
  ( (MissingZero!6650 (index!28884 (_ BitVec 32))) (Found!6650 (index!28885 (_ BitVec 32))) (Intermediate!6650 (undefined!7462 Bool) (index!28886 (_ BitVec 32)) (x!57622 (_ BitVec 32))) (Undefined!6650) (MissingVacant!6650 (index!28887 (_ BitVec 32))) )
))
(declare-fun lt!290352 () SeekEntryResult!6650)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627845 (= res!405554 (or (= lt!290352 (MissingZero!6650 i!1108)) (= lt!290352 (MissingVacant!6650 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37940 (_ BitVec 32)) SeekEntryResult!6650)

(assert (=> b!627845 (= lt!290352 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627846 () Bool)

(declare-fun res!405552 () Bool)

(assert (=> b!627846 (=> (not res!405552) (not e!359366))))

(declare-fun arrayContainsKey!0 (array!37940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627846 (= res!405552 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627847 () Bool)

(declare-fun res!405548 () Bool)

(assert (=> b!627847 (=> (not res!405548) (not e!359366))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!627847 (= res!405548 (and (= (size!18574 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18574 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18574 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627848 () Bool)

(declare-fun res!405550 () Bool)

(assert (=> b!627848 (=> (not res!405550) (not e!359365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37940 (_ BitVec 32)) Bool)

(assert (=> b!627848 (= res!405550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627849 () Bool)

(assert (=> b!627849 (= e!359365 false)))

(declare-fun lt!290353 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627849 (= lt!290353 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627851 () Bool)

(declare-fun res!405547 () Bool)

(assert (=> b!627851 (=> (not res!405547) (not e!359366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627851 (= res!405547 (validKeyInArray!0 k!1786))))

(declare-fun b!627852 () Bool)

(declare-fun res!405551 () Bool)

(assert (=> b!627852 (=> (not res!405551) (not e!359365))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37940 (_ BitVec 32)) SeekEntryResult!6650)

(assert (=> b!627852 (= res!405551 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18210 a!2986) j!136) a!2986 mask!3053) (Found!6650 j!136)))))

(declare-fun b!627853 () Bool)

(declare-fun res!405545 () Bool)

(assert (=> b!627853 (=> (not res!405545) (not e!359365))))

(assert (=> b!627853 (= res!405545 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18210 a!2986) index!984) (select (arr!18210 a!2986) j!136))) (not (= (select (arr!18210 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627854 () Bool)

(declare-fun res!405546 () Bool)

(assert (=> b!627854 (=> (not res!405546) (not e!359366))))

(assert (=> b!627854 (= res!405546 (validKeyInArray!0 (select (arr!18210 a!2986) j!136)))))

(declare-fun res!405553 () Bool)

(assert (=> start!56648 (=> (not res!405553) (not e!359366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56648 (= res!405553 (validMask!0 mask!3053))))

(assert (=> start!56648 e!359366))

(assert (=> start!56648 true))

(declare-fun array_inv!14006 (array!37940) Bool)

(assert (=> start!56648 (array_inv!14006 a!2986)))

(declare-fun b!627850 () Bool)

(declare-fun res!405549 () Bool)

(assert (=> b!627850 (=> (not res!405549) (not e!359365))))

(assert (=> b!627850 (= res!405549 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18210 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18210 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56648 res!405553) b!627847))

(assert (= (and b!627847 res!405548) b!627854))

(assert (= (and b!627854 res!405546) b!627851))

(assert (= (and b!627851 res!405547) b!627846))

(assert (= (and b!627846 res!405552) b!627845))

(assert (= (and b!627845 res!405554) b!627848))

(assert (= (and b!627848 res!405550) b!627844))

(assert (= (and b!627844 res!405544) b!627850))

(assert (= (and b!627850 res!405549) b!627852))

(assert (= (and b!627852 res!405551) b!627853))

(assert (= (and b!627853 res!405545) b!627849))

(declare-fun m!603117 () Bool)

(assert (=> b!627849 m!603117))

(declare-fun m!603119 () Bool)

(assert (=> b!627853 m!603119))

(declare-fun m!603121 () Bool)

(assert (=> b!627853 m!603121))

(assert (=> b!627852 m!603121))

(assert (=> b!627852 m!603121))

(declare-fun m!603123 () Bool)

(assert (=> b!627852 m!603123))

(declare-fun m!603125 () Bool)

(assert (=> b!627844 m!603125))

(declare-fun m!603127 () Bool)

(assert (=> b!627851 m!603127))

(declare-fun m!603129 () Bool)

(assert (=> b!627848 m!603129))

(declare-fun m!603131 () Bool)

(assert (=> b!627845 m!603131))

(assert (=> b!627854 m!603121))

(assert (=> b!627854 m!603121))

(declare-fun m!603133 () Bool)

(assert (=> b!627854 m!603133))

(declare-fun m!603135 () Bool)

(assert (=> b!627850 m!603135))

(declare-fun m!603137 () Bool)

(assert (=> b!627850 m!603137))

(declare-fun m!603139 () Bool)

(assert (=> b!627850 m!603139))

(declare-fun m!603141 () Bool)

(assert (=> start!56648 m!603141))

(declare-fun m!603143 () Bool)

(assert (=> start!56648 m!603143))

(declare-fun m!603145 () Bool)

(assert (=> b!627846 m!603145))

(push 1)

