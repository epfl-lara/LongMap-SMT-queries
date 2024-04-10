; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56570 () Bool)

(assert start!56570)

(declare-fun b!626625 () Bool)

(declare-fun res!404330 () Bool)

(declare-fun e!359016 () Bool)

(assert (=> b!626625 (=> (not res!404330) (not e!359016))))

(declare-datatypes ((array!37862 0))(
  ( (array!37863 (arr!18171 (Array (_ BitVec 32) (_ BitVec 64))) (size!18535 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37862)

(declare-datatypes ((List!12212 0))(
  ( (Nil!12209) (Cons!12208 (h!13253 (_ BitVec 64)) (t!18440 List!12212)) )
))
(declare-fun arrayNoDuplicates!0 (array!37862 (_ BitVec 32) List!12212) Bool)

(assert (=> b!626625 (= res!404330 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12209))))

(declare-fun b!626626 () Bool)

(declare-fun res!404331 () Bool)

(declare-fun e!359015 () Bool)

(assert (=> b!626626 (=> (not res!404331) (not e!359015))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626626 (= res!404331 (validKeyInArray!0 k!1786))))

(declare-fun res!404333 () Bool)

(assert (=> start!56570 (=> (not res!404333) (not e!359015))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56570 (= res!404333 (validMask!0 mask!3053))))

(assert (=> start!56570 e!359015))

(assert (=> start!56570 true))

(declare-fun array_inv!13967 (array!37862) Bool)

(assert (=> start!56570 (array_inv!13967 a!2986)))

(declare-fun b!626627 () Bool)

(declare-fun res!404327 () Bool)

(assert (=> b!626627 (=> (not res!404327) (not e!359016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37862 (_ BitVec 32)) Bool)

(assert (=> b!626627 (= res!404327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626628 () Bool)

(declare-fun res!404328 () Bool)

(assert (=> b!626628 (=> (not res!404328) (not e!359015))))

(declare-fun arrayContainsKey!0 (array!37862 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626628 (= res!404328 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626629 () Bool)

(declare-fun res!404329 () Bool)

(assert (=> b!626629 (=> (not res!404329) (not e!359015))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626629 (= res!404329 (and (= (size!18535 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18535 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18535 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626630 () Bool)

(declare-fun res!404332 () Bool)

(assert (=> b!626630 (=> (not res!404332) (not e!359015))))

(assert (=> b!626630 (= res!404332 (validKeyInArray!0 (select (arr!18171 a!2986) j!136)))))

(declare-fun b!626631 () Bool)

(assert (=> b!626631 (= e!359016 false)))

(declare-datatypes ((SeekEntryResult!6611 0))(
  ( (MissingZero!6611 (index!28728 (_ BitVec 32))) (Found!6611 (index!28729 (_ BitVec 32))) (Intermediate!6611 (undefined!7423 Bool) (index!28730 (_ BitVec 32)) (x!57479 (_ BitVec 32))) (Undefined!6611) (MissingVacant!6611 (index!28731 (_ BitVec 32))) )
))
(declare-fun lt!290118 () SeekEntryResult!6611)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37862 (_ BitVec 32)) SeekEntryResult!6611)

(assert (=> b!626631 (= lt!290118 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18171 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626632 () Bool)

(declare-fun res!404326 () Bool)

(assert (=> b!626632 (=> (not res!404326) (not e!359016))))

(assert (=> b!626632 (= res!404326 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18171 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18171 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626633 () Bool)

(assert (=> b!626633 (= e!359015 e!359016)))

(declare-fun res!404325 () Bool)

(assert (=> b!626633 (=> (not res!404325) (not e!359016))))

(declare-fun lt!290119 () SeekEntryResult!6611)

(assert (=> b!626633 (= res!404325 (or (= lt!290119 (MissingZero!6611 i!1108)) (= lt!290119 (MissingVacant!6611 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37862 (_ BitVec 32)) SeekEntryResult!6611)

(assert (=> b!626633 (= lt!290119 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!56570 res!404333) b!626629))

(assert (= (and b!626629 res!404329) b!626630))

(assert (= (and b!626630 res!404332) b!626626))

(assert (= (and b!626626 res!404331) b!626628))

(assert (= (and b!626628 res!404328) b!626633))

(assert (= (and b!626633 res!404325) b!626627))

(assert (= (and b!626627 res!404327) b!626625))

(assert (= (and b!626625 res!404330) b!626632))

(assert (= (and b!626632 res!404326) b!626631))

(declare-fun m!601995 () Bool)

(assert (=> b!626630 m!601995))

(assert (=> b!626630 m!601995))

(declare-fun m!601997 () Bool)

(assert (=> b!626630 m!601997))

(declare-fun m!601999 () Bool)

(assert (=> b!626628 m!601999))

(declare-fun m!602001 () Bool)

(assert (=> b!626626 m!602001))

(declare-fun m!602003 () Bool)

(assert (=> b!626625 m!602003))

(declare-fun m!602005 () Bool)

(assert (=> b!626633 m!602005))

(declare-fun m!602007 () Bool)

(assert (=> b!626627 m!602007))

(declare-fun m!602009 () Bool)

(assert (=> b!626632 m!602009))

(declare-fun m!602011 () Bool)

(assert (=> b!626632 m!602011))

(declare-fun m!602013 () Bool)

(assert (=> b!626632 m!602013))

(declare-fun m!602015 () Bool)

(assert (=> start!56570 m!602015))

(declare-fun m!602017 () Bool)

(assert (=> start!56570 m!602017))

(assert (=> b!626631 m!601995))

(assert (=> b!626631 m!601995))

(declare-fun m!602019 () Bool)

(assert (=> b!626631 m!602019))

(push 1)

