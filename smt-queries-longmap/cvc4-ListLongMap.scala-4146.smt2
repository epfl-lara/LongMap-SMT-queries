; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56568 () Bool)

(assert start!56568)

(declare-fun b!626598 () Bool)

(declare-fun res!404303 () Bool)

(declare-fun e!359005 () Bool)

(assert (=> b!626598 (=> (not res!404303) (not e!359005))))

(declare-datatypes ((array!37860 0))(
  ( (array!37861 (arr!18170 (Array (_ BitVec 32) (_ BitVec 64))) (size!18534 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37860)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626598 (= res!404303 (validKeyInArray!0 (select (arr!18170 a!2986) j!136)))))

(declare-fun b!626599 () Bool)

(declare-fun res!404300 () Bool)

(declare-fun e!359006 () Bool)

(assert (=> b!626599 (=> (not res!404300) (not e!359006))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!626599 (= res!404300 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18170 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18170 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626600 () Bool)

(declare-fun res!404305 () Bool)

(assert (=> b!626600 (=> (not res!404305) (not e!359006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37860 (_ BitVec 32)) Bool)

(assert (=> b!626600 (= res!404305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626601 () Bool)

(assert (=> b!626601 (= e!359005 e!359006)))

(declare-fun res!404306 () Bool)

(assert (=> b!626601 (=> (not res!404306) (not e!359006))))

(declare-datatypes ((SeekEntryResult!6610 0))(
  ( (MissingZero!6610 (index!28724 (_ BitVec 32))) (Found!6610 (index!28725 (_ BitVec 32))) (Intermediate!6610 (undefined!7422 Bool) (index!28726 (_ BitVec 32)) (x!57470 (_ BitVec 32))) (Undefined!6610) (MissingVacant!6610 (index!28727 (_ BitVec 32))) )
))
(declare-fun lt!290113 () SeekEntryResult!6610)

(assert (=> b!626601 (= res!404306 (or (= lt!290113 (MissingZero!6610 i!1108)) (= lt!290113 (MissingVacant!6610 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37860 (_ BitVec 32)) SeekEntryResult!6610)

(assert (=> b!626601 (= lt!290113 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!626602 () Bool)

(declare-fun res!404299 () Bool)

(assert (=> b!626602 (=> (not res!404299) (not e!359005))))

(declare-fun arrayContainsKey!0 (array!37860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626602 (= res!404299 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!404298 () Bool)

(assert (=> start!56568 (=> (not res!404298) (not e!359005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56568 (= res!404298 (validMask!0 mask!3053))))

(assert (=> start!56568 e!359005))

(assert (=> start!56568 true))

(declare-fun array_inv!13966 (array!37860) Bool)

(assert (=> start!56568 (array_inv!13966 a!2986)))

(declare-fun b!626603 () Bool)

(assert (=> b!626603 (= e!359006 false)))

(declare-fun lt!290112 () SeekEntryResult!6610)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37860 (_ BitVec 32)) SeekEntryResult!6610)

(assert (=> b!626603 (= lt!290112 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18170 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626604 () Bool)

(declare-fun res!404302 () Bool)

(assert (=> b!626604 (=> (not res!404302) (not e!359005))))

(assert (=> b!626604 (= res!404302 (validKeyInArray!0 k!1786))))

(declare-fun b!626605 () Bool)

(declare-fun res!404304 () Bool)

(assert (=> b!626605 (=> (not res!404304) (not e!359005))))

(assert (=> b!626605 (= res!404304 (and (= (size!18534 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18534 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18534 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626606 () Bool)

(declare-fun res!404301 () Bool)

(assert (=> b!626606 (=> (not res!404301) (not e!359006))))

(declare-datatypes ((List!12211 0))(
  ( (Nil!12208) (Cons!12207 (h!13252 (_ BitVec 64)) (t!18439 List!12211)) )
))
(declare-fun arrayNoDuplicates!0 (array!37860 (_ BitVec 32) List!12211) Bool)

(assert (=> b!626606 (= res!404301 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12208))))

(assert (= (and start!56568 res!404298) b!626605))

(assert (= (and b!626605 res!404304) b!626598))

(assert (= (and b!626598 res!404303) b!626604))

(assert (= (and b!626604 res!404302) b!626602))

(assert (= (and b!626602 res!404299) b!626601))

(assert (= (and b!626601 res!404306) b!626600))

(assert (= (and b!626600 res!404305) b!626606))

(assert (= (and b!626606 res!404301) b!626599))

(assert (= (and b!626599 res!404300) b!626603))

(declare-fun m!601969 () Bool)

(assert (=> b!626602 m!601969))

(declare-fun m!601971 () Bool)

(assert (=> b!626598 m!601971))

(assert (=> b!626598 m!601971))

(declare-fun m!601973 () Bool)

(assert (=> b!626598 m!601973))

(declare-fun m!601975 () Bool)

(assert (=> b!626606 m!601975))

(declare-fun m!601977 () Bool)

(assert (=> b!626599 m!601977))

(declare-fun m!601979 () Bool)

(assert (=> b!626599 m!601979))

(declare-fun m!601981 () Bool)

(assert (=> b!626599 m!601981))

(declare-fun m!601983 () Bool)

(assert (=> b!626604 m!601983))

(assert (=> b!626603 m!601971))

(assert (=> b!626603 m!601971))

(declare-fun m!601985 () Bool)

(assert (=> b!626603 m!601985))

(declare-fun m!601987 () Bool)

(assert (=> start!56568 m!601987))

(declare-fun m!601989 () Bool)

(assert (=> start!56568 m!601989))

(declare-fun m!601991 () Bool)

(assert (=> b!626600 m!601991))

(declare-fun m!601993 () Bool)

(assert (=> b!626601 m!601993))

(push 1)

