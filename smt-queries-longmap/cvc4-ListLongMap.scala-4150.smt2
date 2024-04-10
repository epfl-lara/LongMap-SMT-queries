; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56592 () Bool)

(assert start!56592)

(declare-fun b!626922 () Bool)

(declare-fun res!404627 () Bool)

(declare-fun e!359113 () Bool)

(assert (=> b!626922 (=> (not res!404627) (not e!359113))))

(declare-datatypes ((array!37884 0))(
  ( (array!37885 (arr!18182 (Array (_ BitVec 32) (_ BitVec 64))) (size!18546 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37884)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37884 (_ BitVec 32)) Bool)

(assert (=> b!626922 (= res!404627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626924 () Bool)

(declare-fun e!359114 () Bool)

(assert (=> b!626924 (= e!359114 e!359113)))

(declare-fun res!404623 () Bool)

(assert (=> b!626924 (=> (not res!404623) (not e!359113))))

(declare-datatypes ((SeekEntryResult!6622 0))(
  ( (MissingZero!6622 (index!28772 (_ BitVec 32))) (Found!6622 (index!28773 (_ BitVec 32))) (Intermediate!6622 (undefined!7434 Bool) (index!28774 (_ BitVec 32)) (x!57514 (_ BitVec 32))) (Undefined!6622) (MissingVacant!6622 (index!28775 (_ BitVec 32))) )
))
(declare-fun lt!290185 () SeekEntryResult!6622)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626924 (= res!404623 (or (= lt!290185 (MissingZero!6622 i!1108)) (= lt!290185 (MissingVacant!6622 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37884 (_ BitVec 32)) SeekEntryResult!6622)

(assert (=> b!626924 (= lt!290185 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!626925 () Bool)

(assert (=> b!626925 (= e!359113 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!290184 () SeekEntryResult!6622)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37884 (_ BitVec 32)) SeekEntryResult!6622)

(assert (=> b!626925 (= lt!290184 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18182 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626926 () Bool)

(declare-fun res!404626 () Bool)

(assert (=> b!626926 (=> (not res!404626) (not e!359113))))

(assert (=> b!626926 (= res!404626 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18182 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18182 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626927 () Bool)

(declare-fun res!404628 () Bool)

(assert (=> b!626927 (=> (not res!404628) (not e!359113))))

(declare-datatypes ((List!12223 0))(
  ( (Nil!12220) (Cons!12219 (h!13264 (_ BitVec 64)) (t!18451 List!12223)) )
))
(declare-fun arrayNoDuplicates!0 (array!37884 (_ BitVec 32) List!12223) Bool)

(assert (=> b!626927 (= res!404628 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12220))))

(declare-fun b!626928 () Bool)

(declare-fun res!404629 () Bool)

(assert (=> b!626928 (=> (not res!404629) (not e!359114))))

(declare-fun arrayContainsKey!0 (array!37884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626928 (= res!404629 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626929 () Bool)

(declare-fun res!404624 () Bool)

(assert (=> b!626929 (=> (not res!404624) (not e!359114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626929 (= res!404624 (validKeyInArray!0 k!1786))))

(declare-fun b!626930 () Bool)

(declare-fun res!404630 () Bool)

(assert (=> b!626930 (=> (not res!404630) (not e!359114))))

(assert (=> b!626930 (= res!404630 (validKeyInArray!0 (select (arr!18182 a!2986) j!136)))))

(declare-fun res!404625 () Bool)

(assert (=> start!56592 (=> (not res!404625) (not e!359114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56592 (= res!404625 (validMask!0 mask!3053))))

(assert (=> start!56592 e!359114))

(assert (=> start!56592 true))

(declare-fun array_inv!13978 (array!37884) Bool)

(assert (=> start!56592 (array_inv!13978 a!2986)))

(declare-fun b!626923 () Bool)

(declare-fun res!404622 () Bool)

(assert (=> b!626923 (=> (not res!404622) (not e!359114))))

(assert (=> b!626923 (= res!404622 (and (= (size!18546 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18546 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18546 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56592 res!404625) b!626923))

(assert (= (and b!626923 res!404622) b!626930))

(assert (= (and b!626930 res!404630) b!626929))

(assert (= (and b!626929 res!404624) b!626928))

(assert (= (and b!626928 res!404629) b!626924))

(assert (= (and b!626924 res!404623) b!626922))

(assert (= (and b!626922 res!404627) b!626927))

(assert (= (and b!626927 res!404628) b!626926))

(assert (= (and b!626926 res!404626) b!626925))

(declare-fun m!602281 () Bool)

(assert (=> b!626924 m!602281))

(declare-fun m!602283 () Bool)

(assert (=> b!626925 m!602283))

(assert (=> b!626925 m!602283))

(declare-fun m!602285 () Bool)

(assert (=> b!626925 m!602285))

(declare-fun m!602287 () Bool)

(assert (=> b!626922 m!602287))

(declare-fun m!602289 () Bool)

(assert (=> start!56592 m!602289))

(declare-fun m!602291 () Bool)

(assert (=> start!56592 m!602291))

(declare-fun m!602293 () Bool)

(assert (=> b!626927 m!602293))

(declare-fun m!602295 () Bool)

(assert (=> b!626926 m!602295))

(declare-fun m!602297 () Bool)

(assert (=> b!626926 m!602297))

(declare-fun m!602299 () Bool)

(assert (=> b!626926 m!602299))

(declare-fun m!602301 () Bool)

(assert (=> b!626928 m!602301))

(assert (=> b!626930 m!602283))

(assert (=> b!626930 m!602283))

(declare-fun m!602303 () Bool)

(assert (=> b!626930 m!602303))

(declare-fun m!602305 () Bool)

(assert (=> b!626929 m!602305))

(push 1)

