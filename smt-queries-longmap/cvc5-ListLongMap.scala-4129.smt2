; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56320 () Bool)

(assert start!56320)

(declare-fun b!624483 () Bool)

(declare-fun res!402639 () Bool)

(declare-fun e!358106 () Bool)

(assert (=> b!624483 (=> (not res!402639) (not e!358106))))

(declare-datatypes ((array!37745 0))(
  ( (array!37746 (arr!18117 (Array (_ BitVec 32) (_ BitVec 64))) (size!18481 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37745)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624483 (= res!402639 (validKeyInArray!0 (select (arr!18117 a!2986) j!136)))))

(declare-fun res!402636 () Bool)

(assert (=> start!56320 (=> (not res!402636) (not e!358106))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56320 (= res!402636 (validMask!0 mask!3053))))

(assert (=> start!56320 e!358106))

(assert (=> start!56320 true))

(declare-fun array_inv!13913 (array!37745) Bool)

(assert (=> start!56320 (array_inv!13913 a!2986)))

(declare-fun b!624484 () Bool)

(declare-fun e!358105 () Bool)

(assert (=> b!624484 (= e!358105 false)))

(declare-datatypes ((SeekEntryResult!6557 0))(
  ( (MissingZero!6557 (index!28512 (_ BitVec 32))) (Found!6557 (index!28513 (_ BitVec 32))) (Intermediate!6557 (undefined!7369 Bool) (index!28514 (_ BitVec 32)) (x!57272 (_ BitVec 32))) (Undefined!6557) (MissingVacant!6557 (index!28515 (_ BitVec 32))) )
))
(declare-fun lt!289608 () SeekEntryResult!6557)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37745 (_ BitVec 32)) SeekEntryResult!6557)

(assert (=> b!624484 (= lt!289608 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18117 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624485 () Bool)

(assert (=> b!624485 (= e!358106 e!358105)))

(declare-fun res!402640 () Bool)

(assert (=> b!624485 (=> (not res!402640) (not e!358105))))

(declare-fun lt!289609 () SeekEntryResult!6557)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624485 (= res!402640 (or (= lt!289609 (MissingZero!6557 i!1108)) (= lt!289609 (MissingVacant!6557 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37745 (_ BitVec 32)) SeekEntryResult!6557)

(assert (=> b!624485 (= lt!289609 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!624486 () Bool)

(declare-fun res!402634 () Bool)

(assert (=> b!624486 (=> (not res!402634) (not e!358105))))

(assert (=> b!624486 (= res!402634 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18117 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18117 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624487 () Bool)

(declare-fun res!402635 () Bool)

(assert (=> b!624487 (=> (not res!402635) (not e!358105))))

(declare-datatypes ((List!12158 0))(
  ( (Nil!12155) (Cons!12154 (h!13199 (_ BitVec 64)) (t!18386 List!12158)) )
))
(declare-fun arrayNoDuplicates!0 (array!37745 (_ BitVec 32) List!12158) Bool)

(assert (=> b!624487 (= res!402635 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12155))))

(declare-fun b!624488 () Bool)

(declare-fun res!402641 () Bool)

(assert (=> b!624488 (=> (not res!402641) (not e!358106))))

(assert (=> b!624488 (= res!402641 (and (= (size!18481 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18481 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18481 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624489 () Bool)

(declare-fun res!402638 () Bool)

(assert (=> b!624489 (=> (not res!402638) (not e!358106))))

(declare-fun arrayContainsKey!0 (array!37745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624489 (= res!402638 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624490 () Bool)

(declare-fun res!402637 () Bool)

(assert (=> b!624490 (=> (not res!402637) (not e!358106))))

(assert (=> b!624490 (= res!402637 (validKeyInArray!0 k!1786))))

(declare-fun b!624491 () Bool)

(declare-fun res!402633 () Bool)

(assert (=> b!624491 (=> (not res!402633) (not e!358105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37745 (_ BitVec 32)) Bool)

(assert (=> b!624491 (= res!402633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56320 res!402636) b!624488))

(assert (= (and b!624488 res!402641) b!624483))

(assert (= (and b!624483 res!402639) b!624490))

(assert (= (and b!624490 res!402637) b!624489))

(assert (= (and b!624489 res!402638) b!624485))

(assert (= (and b!624485 res!402640) b!624491))

(assert (= (and b!624491 res!402633) b!624487))

(assert (= (and b!624487 res!402635) b!624486))

(assert (= (and b!624486 res!402634) b!624484))

(declare-fun m!600179 () Bool)

(assert (=> b!624484 m!600179))

(assert (=> b!624484 m!600179))

(declare-fun m!600181 () Bool)

(assert (=> b!624484 m!600181))

(declare-fun m!600183 () Bool)

(assert (=> b!624489 m!600183))

(declare-fun m!600185 () Bool)

(assert (=> start!56320 m!600185))

(declare-fun m!600187 () Bool)

(assert (=> start!56320 m!600187))

(declare-fun m!600189 () Bool)

(assert (=> b!624485 m!600189))

(declare-fun m!600191 () Bool)

(assert (=> b!624486 m!600191))

(declare-fun m!600193 () Bool)

(assert (=> b!624486 m!600193))

(declare-fun m!600195 () Bool)

(assert (=> b!624486 m!600195))

(declare-fun m!600197 () Bool)

(assert (=> b!624487 m!600197))

(assert (=> b!624483 m!600179))

(assert (=> b!624483 m!600179))

(declare-fun m!600199 () Bool)

(assert (=> b!624483 m!600199))

(declare-fun m!600201 () Bool)

(assert (=> b!624491 m!600201))

(declare-fun m!600203 () Bool)

(assert (=> b!624490 m!600203))

(push 1)

