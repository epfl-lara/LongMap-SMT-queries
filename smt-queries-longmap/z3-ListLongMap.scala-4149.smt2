; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56634 () Bool)

(assert start!56634)

(declare-fun b!626996 () Bool)

(declare-fun res!404593 () Bool)

(declare-fun e!359199 () Bool)

(assert (=> b!626996 (=> (not res!404593) (not e!359199))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37869 0))(
  ( (array!37870 (arr!18172 (Array (_ BitVec 32) (_ BitVec 64))) (size!18536 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37869)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!626996 (= res!404593 (and (= (size!18536 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18536 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18536 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626997 () Bool)

(declare-fun res!404598 () Bool)

(declare-fun e!359197 () Bool)

(assert (=> b!626997 (=> (not res!404598) (not e!359197))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!626997 (= res!404598 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18172 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18172 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626998 () Bool)

(assert (=> b!626998 (= e!359197 false)))

(declare-datatypes ((SeekEntryResult!6568 0))(
  ( (MissingZero!6568 (index!28556 (_ BitVec 32))) (Found!6568 (index!28557 (_ BitVec 32))) (Intermediate!6568 (undefined!7380 Bool) (index!28558 (_ BitVec 32)) (x!57455 (_ BitVec 32))) (Undefined!6568) (MissingVacant!6568 (index!28559 (_ BitVec 32))) )
))
(declare-fun lt!290256 () SeekEntryResult!6568)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37869 (_ BitVec 32)) SeekEntryResult!6568)

(assert (=> b!626998 (= lt!290256 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18172 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626999 () Bool)

(declare-fun res!404599 () Bool)

(assert (=> b!626999 (=> (not res!404599) (not e!359197))))

(declare-datatypes ((List!12120 0))(
  ( (Nil!12117) (Cons!12116 (h!13164 (_ BitVec 64)) (t!18340 List!12120)) )
))
(declare-fun arrayNoDuplicates!0 (array!37869 (_ BitVec 32) List!12120) Bool)

(assert (=> b!626999 (= res!404599 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12117))))

(declare-fun b!627000 () Bool)

(declare-fun res!404597 () Bool)

(assert (=> b!627000 (=> (not res!404597) (not e!359199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627000 (= res!404597 (validKeyInArray!0 (select (arr!18172 a!2986) j!136)))))

(declare-fun b!627002 () Bool)

(declare-fun res!404592 () Bool)

(assert (=> b!627002 (=> (not res!404592) (not e!359199))))

(declare-fun arrayContainsKey!0 (array!37869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627002 (= res!404592 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627003 () Bool)

(assert (=> b!627003 (= e!359199 e!359197)))

(declare-fun res!404594 () Bool)

(assert (=> b!627003 (=> (not res!404594) (not e!359197))))

(declare-fun lt!290257 () SeekEntryResult!6568)

(assert (=> b!627003 (= res!404594 (or (= lt!290257 (MissingZero!6568 i!1108)) (= lt!290257 (MissingVacant!6568 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37869 (_ BitVec 32)) SeekEntryResult!6568)

(assert (=> b!627003 (= lt!290257 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627004 () Bool)

(declare-fun res!404595 () Bool)

(assert (=> b!627004 (=> (not res!404595) (not e!359199))))

(assert (=> b!627004 (= res!404595 (validKeyInArray!0 k0!1786))))

(declare-fun b!627001 () Bool)

(declare-fun res!404596 () Bool)

(assert (=> b!627001 (=> (not res!404596) (not e!359197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37869 (_ BitVec 32)) Bool)

(assert (=> b!627001 (= res!404596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!404591 () Bool)

(assert (=> start!56634 (=> (not res!404591) (not e!359199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56634 (= res!404591 (validMask!0 mask!3053))))

(assert (=> start!56634 e!359199))

(assert (=> start!56634 true))

(declare-fun array_inv!14031 (array!37869) Bool)

(assert (=> start!56634 (array_inv!14031 a!2986)))

(assert (= (and start!56634 res!404591) b!626996))

(assert (= (and b!626996 res!404593) b!627000))

(assert (= (and b!627000 res!404597) b!627004))

(assert (= (and b!627004 res!404595) b!627002))

(assert (= (and b!627002 res!404592) b!627003))

(assert (= (and b!627003 res!404594) b!627001))

(assert (= (and b!627001 res!404596) b!626999))

(assert (= (and b!626999 res!404599) b!626997))

(assert (= (and b!626997 res!404598) b!626998))

(declare-fun m!602641 () Bool)

(assert (=> b!626997 m!602641))

(declare-fun m!602643 () Bool)

(assert (=> b!626997 m!602643))

(declare-fun m!602645 () Bool)

(assert (=> b!626997 m!602645))

(declare-fun m!602647 () Bool)

(assert (=> b!627000 m!602647))

(assert (=> b!627000 m!602647))

(declare-fun m!602649 () Bool)

(assert (=> b!627000 m!602649))

(declare-fun m!602651 () Bool)

(assert (=> b!627004 m!602651))

(declare-fun m!602653 () Bool)

(assert (=> b!627001 m!602653))

(declare-fun m!602655 () Bool)

(assert (=> b!627002 m!602655))

(declare-fun m!602657 () Bool)

(assert (=> b!627003 m!602657))

(declare-fun m!602659 () Bool)

(assert (=> b!626999 m!602659))

(declare-fun m!602661 () Bool)

(assert (=> start!56634 m!602661))

(declare-fun m!602663 () Bool)

(assert (=> start!56634 m!602663))

(assert (=> b!626998 m!602647))

(assert (=> b!626998 m!602647))

(declare-fun m!602665 () Bool)

(assert (=> b!626998 m!602665))

(check-sat (not b!627004) (not start!56634) (not b!627001) (not b!626998) (not b!627003) (not b!627002) (not b!627000) (not b!626999))
(check-sat)
