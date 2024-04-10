; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56432 () Bool)

(assert start!56432)

(declare-fun b!625572 () Bool)

(declare-fun res!403581 () Bool)

(declare-fun e!358530 () Bool)

(assert (=> b!625572 (=> (not res!403581) (not e!358530))))

(declare-datatypes ((array!37812 0))(
  ( (array!37813 (arr!18149 (Array (_ BitVec 32) (_ BitVec 64))) (size!18513 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37812)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37812 (_ BitVec 32)) Bool)

(assert (=> b!625572 (= res!403581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625573 () Bool)

(declare-fun res!403579 () Bool)

(assert (=> b!625573 (=> (not res!403579) (not e!358530))))

(declare-datatypes ((List!12190 0))(
  ( (Nil!12187) (Cons!12186 (h!13231 (_ BitVec 64)) (t!18418 List!12190)) )
))
(declare-fun arrayNoDuplicates!0 (array!37812 (_ BitVec 32) List!12190) Bool)

(assert (=> b!625573 (= res!403579 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12187))))

(declare-fun b!625574 () Bool)

(assert (=> b!625574 (= e!358530 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6589 0))(
  ( (MissingZero!6589 (index!28640 (_ BitVec 32))) (Found!6589 (index!28641 (_ BitVec 32))) (Intermediate!6589 (undefined!7401 Bool) (index!28642 (_ BitVec 32)) (x!57387 (_ BitVec 32))) (Undefined!6589) (MissingVacant!6589 (index!28643 (_ BitVec 32))) )
))
(declare-fun lt!289855 () SeekEntryResult!6589)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37812 (_ BitVec 32)) SeekEntryResult!6589)

(assert (=> b!625574 (= lt!289855 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18149 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625575 () Bool)

(declare-fun res!403583 () Bool)

(declare-fun e!358529 () Bool)

(assert (=> b!625575 (=> (not res!403583) (not e!358529))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625575 (= res!403583 (validKeyInArray!0 (select (arr!18149 a!2986) j!136)))))

(declare-fun b!625576 () Bool)

(declare-fun res!403584 () Bool)

(assert (=> b!625576 (=> (not res!403584) (not e!358529))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625576 (= res!403584 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625577 () Bool)

(assert (=> b!625577 (= e!358529 e!358530)))

(declare-fun res!403582 () Bool)

(assert (=> b!625577 (=> (not res!403582) (not e!358530))))

(declare-fun lt!289854 () SeekEntryResult!6589)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625577 (= res!403582 (or (= lt!289854 (MissingZero!6589 i!1108)) (= lt!289854 (MissingVacant!6589 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37812 (_ BitVec 32)) SeekEntryResult!6589)

(assert (=> b!625577 (= lt!289854 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!625578 () Bool)

(declare-fun res!403580 () Bool)

(assert (=> b!625578 (=> (not res!403580) (not e!358529))))

(assert (=> b!625578 (= res!403580 (validKeyInArray!0 k!1786))))

(declare-fun res!403585 () Bool)

(assert (=> start!56432 (=> (not res!403585) (not e!358529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56432 (= res!403585 (validMask!0 mask!3053))))

(assert (=> start!56432 e!358529))

(assert (=> start!56432 true))

(declare-fun array_inv!13945 (array!37812) Bool)

(assert (=> start!56432 (array_inv!13945 a!2986)))

(declare-fun b!625579 () Bool)

(declare-fun res!403578 () Bool)

(assert (=> b!625579 (=> (not res!403578) (not e!358529))))

(assert (=> b!625579 (= res!403578 (and (= (size!18513 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18513 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18513 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625580 () Bool)

(declare-fun res!403586 () Bool)

(assert (=> b!625580 (=> (not res!403586) (not e!358530))))

(assert (=> b!625580 (= res!403586 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18149 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18149 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56432 res!403585) b!625579))

(assert (= (and b!625579 res!403578) b!625575))

(assert (= (and b!625575 res!403583) b!625578))

(assert (= (and b!625578 res!403580) b!625576))

(assert (= (and b!625576 res!403584) b!625577))

(assert (= (and b!625577 res!403582) b!625572))

(assert (= (and b!625572 res!403581) b!625573))

(assert (= (and b!625573 res!403579) b!625580))

(assert (= (and b!625580 res!403586) b!625574))

(declare-fun m!601137 () Bool)

(assert (=> b!625577 m!601137))

(declare-fun m!601139 () Bool)

(assert (=> b!625573 m!601139))

(declare-fun m!601141 () Bool)

(assert (=> b!625572 m!601141))

(declare-fun m!601143 () Bool)

(assert (=> b!625575 m!601143))

(assert (=> b!625575 m!601143))

(declare-fun m!601145 () Bool)

(assert (=> b!625575 m!601145))

(declare-fun m!601147 () Bool)

(assert (=> b!625578 m!601147))

(declare-fun m!601149 () Bool)

(assert (=> b!625576 m!601149))

(declare-fun m!601151 () Bool)

(assert (=> start!56432 m!601151))

(declare-fun m!601153 () Bool)

(assert (=> start!56432 m!601153))

(declare-fun m!601155 () Bool)

(assert (=> b!625580 m!601155))

(declare-fun m!601157 () Bool)

(assert (=> b!625580 m!601157))

(declare-fun m!601159 () Bool)

(assert (=> b!625580 m!601159))

(assert (=> b!625574 m!601143))

(assert (=> b!625574 m!601143))

(declare-fun m!601161 () Bool)

(assert (=> b!625574 m!601161))

(push 1)

