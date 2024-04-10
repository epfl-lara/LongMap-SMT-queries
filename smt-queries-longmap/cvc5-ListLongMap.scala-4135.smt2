; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56404 () Bool)

(assert start!56404)

(declare-fun b!625185 () Bool)

(declare-fun res!403193 () Bool)

(declare-fun e!358403 () Bool)

(assert (=> b!625185 (=> (not res!403193) (not e!358403))))

(declare-datatypes ((array!37784 0))(
  ( (array!37785 (arr!18135 (Array (_ BitVec 32) (_ BitVec 64))) (size!18499 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37784)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37784 (_ BitVec 32)) Bool)

(assert (=> b!625185 (= res!403193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625186 () Bool)

(declare-fun res!403197 () Bool)

(assert (=> b!625186 (=> (not res!403197) (not e!358403))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625186 (= res!403197 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18135 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18135 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625188 () Bool)

(declare-fun res!403199 () Bool)

(assert (=> b!625188 (=> (not res!403199) (not e!358403))))

(declare-datatypes ((List!12176 0))(
  ( (Nil!12173) (Cons!12172 (h!13217 (_ BitVec 64)) (t!18404 List!12176)) )
))
(declare-fun arrayNoDuplicates!0 (array!37784 (_ BitVec 32) List!12176) Bool)

(assert (=> b!625188 (= res!403199 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12173))))

(declare-fun b!625189 () Bool)

(declare-fun res!403196 () Bool)

(declare-fun e!358402 () Bool)

(assert (=> b!625189 (=> (not res!403196) (not e!358402))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!625189 (= res!403196 (and (= (size!18499 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18499 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18499 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625190 () Bool)

(declare-fun res!403194 () Bool)

(assert (=> b!625190 (=> (not res!403194) (not e!358402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625190 (= res!403194 (validKeyInArray!0 (select (arr!18135 a!2986) j!136)))))

(declare-fun b!625191 () Bool)

(declare-fun res!403198 () Bool)

(assert (=> b!625191 (=> (not res!403198) (not e!358402))))

(assert (=> b!625191 (= res!403198 (validKeyInArray!0 k!1786))))

(declare-fun b!625192 () Bool)

(assert (=> b!625192 (= e!358403 false)))

(declare-datatypes ((SeekEntryResult!6575 0))(
  ( (MissingZero!6575 (index!28584 (_ BitVec 32))) (Found!6575 (index!28585 (_ BitVec 32))) (Intermediate!6575 (undefined!7387 Bool) (index!28586 (_ BitVec 32)) (x!57341 (_ BitVec 32))) (Undefined!6575) (MissingVacant!6575 (index!28587 (_ BitVec 32))) )
))
(declare-fun lt!289780 () SeekEntryResult!6575)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37784 (_ BitVec 32)) SeekEntryResult!6575)

(assert (=> b!625192 (= lt!289780 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18135 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625193 () Bool)

(declare-fun res!403195 () Bool)

(assert (=> b!625193 (=> (not res!403195) (not e!358402))))

(declare-fun arrayContainsKey!0 (array!37784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625193 (= res!403195 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!403192 () Bool)

(assert (=> start!56404 (=> (not res!403192) (not e!358402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56404 (= res!403192 (validMask!0 mask!3053))))

(assert (=> start!56404 e!358402))

(assert (=> start!56404 true))

(declare-fun array_inv!13931 (array!37784) Bool)

(assert (=> start!56404 (array_inv!13931 a!2986)))

(declare-fun b!625187 () Bool)

(assert (=> b!625187 (= e!358402 e!358403)))

(declare-fun res!403191 () Bool)

(assert (=> b!625187 (=> (not res!403191) (not e!358403))))

(declare-fun lt!289779 () SeekEntryResult!6575)

(assert (=> b!625187 (= res!403191 (or (= lt!289779 (MissingZero!6575 i!1108)) (= lt!289779 (MissingVacant!6575 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37784 (_ BitVec 32)) SeekEntryResult!6575)

(assert (=> b!625187 (= lt!289779 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!56404 res!403192) b!625189))

(assert (= (and b!625189 res!403196) b!625190))

(assert (= (and b!625190 res!403194) b!625191))

(assert (= (and b!625191 res!403198) b!625193))

(assert (= (and b!625193 res!403195) b!625187))

(assert (= (and b!625187 res!403191) b!625185))

(assert (= (and b!625185 res!403193) b!625188))

(assert (= (and b!625188 res!403199) b!625186))

(assert (= (and b!625186 res!403197) b!625192))

(declare-fun m!600773 () Bool)

(assert (=> b!625191 m!600773))

(declare-fun m!600775 () Bool)

(assert (=> b!625186 m!600775))

(declare-fun m!600777 () Bool)

(assert (=> b!625186 m!600777))

(declare-fun m!600779 () Bool)

(assert (=> b!625186 m!600779))

(declare-fun m!600781 () Bool)

(assert (=> b!625193 m!600781))

(declare-fun m!600783 () Bool)

(assert (=> b!625187 m!600783))

(declare-fun m!600785 () Bool)

(assert (=> start!56404 m!600785))

(declare-fun m!600787 () Bool)

(assert (=> start!56404 m!600787))

(declare-fun m!600789 () Bool)

(assert (=> b!625190 m!600789))

(assert (=> b!625190 m!600789))

(declare-fun m!600791 () Bool)

(assert (=> b!625190 m!600791))

(declare-fun m!600793 () Bool)

(assert (=> b!625188 m!600793))

(assert (=> b!625192 m!600789))

(assert (=> b!625192 m!600789))

(declare-fun m!600795 () Bool)

(assert (=> b!625192 m!600795))

(declare-fun m!600797 () Bool)

(assert (=> b!625185 m!600797))

(push 1)

