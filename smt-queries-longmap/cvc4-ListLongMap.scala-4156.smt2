; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56628 () Bool)

(assert start!56628)

(declare-fun b!627514 () Bool)

(declare-fun res!405219 () Bool)

(declare-fun e!359277 () Bool)

(assert (=> b!627514 (=> (not res!405219) (not e!359277))))

(declare-datatypes ((array!37920 0))(
  ( (array!37921 (arr!18200 (Array (_ BitVec 32) (_ BitVec 64))) (size!18564 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37920)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627514 (= res!405219 (validKeyInArray!0 (select (arr!18200 a!2986) j!136)))))

(declare-fun res!405217 () Bool)

(assert (=> start!56628 (=> (not res!405217) (not e!359277))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56628 (= res!405217 (validMask!0 mask!3053))))

(assert (=> start!56628 e!359277))

(assert (=> start!56628 true))

(declare-fun array_inv!13996 (array!37920) Bool)

(assert (=> start!56628 (array_inv!13996 a!2986)))

(declare-fun b!627515 () Bool)

(declare-fun e!359275 () Bool)

(assert (=> b!627515 (= e!359277 e!359275)))

(declare-fun res!405222 () Bool)

(assert (=> b!627515 (=> (not res!405222) (not e!359275))))

(declare-datatypes ((SeekEntryResult!6640 0))(
  ( (MissingZero!6640 (index!28844 (_ BitVec 32))) (Found!6640 (index!28845 (_ BitVec 32))) (Intermediate!6640 (undefined!7452 Bool) (index!28846 (_ BitVec 32)) (x!57580 (_ BitVec 32))) (Undefined!6640) (MissingVacant!6640 (index!28847 (_ BitVec 32))) )
))
(declare-fun lt!290293 () SeekEntryResult!6640)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627515 (= res!405222 (or (= lt!290293 (MissingZero!6640 i!1108)) (= lt!290293 (MissingVacant!6640 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37920 (_ BitVec 32)) SeekEntryResult!6640)

(assert (=> b!627515 (= lt!290293 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627516 () Bool)

(declare-fun res!405221 () Bool)

(assert (=> b!627516 (=> (not res!405221) (not e!359275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37920 (_ BitVec 32)) Bool)

(assert (=> b!627516 (= res!405221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627517 () Bool)

(declare-fun res!405220 () Bool)

(assert (=> b!627517 (=> (not res!405220) (not e!359277))))

(assert (=> b!627517 (= res!405220 (and (= (size!18564 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18564 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18564 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627518 () Bool)

(declare-fun res!405216 () Bool)

(assert (=> b!627518 (=> (not res!405216) (not e!359275))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!627518 (= res!405216 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18200 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18200 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627519 () Bool)

(assert (=> b!627519 (= e!359275 false)))

(declare-fun lt!290292 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627519 (= lt!290292 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627520 () Bool)

(declare-fun res!405223 () Bool)

(assert (=> b!627520 (=> (not res!405223) (not e!359275))))

(assert (=> b!627520 (= res!405223 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18200 a!2986) index!984) (select (arr!18200 a!2986) j!136))) (not (= (select (arr!18200 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627521 () Bool)

(declare-fun res!405218 () Bool)

(assert (=> b!627521 (=> (not res!405218) (not e!359277))))

(declare-fun arrayContainsKey!0 (array!37920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627521 (= res!405218 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627522 () Bool)

(declare-fun res!405215 () Bool)

(assert (=> b!627522 (=> (not res!405215) (not e!359275))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37920 (_ BitVec 32)) SeekEntryResult!6640)

(assert (=> b!627522 (= res!405215 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18200 a!2986) j!136) a!2986 mask!3053) (Found!6640 j!136)))))

(declare-fun b!627523 () Bool)

(declare-fun res!405224 () Bool)

(assert (=> b!627523 (=> (not res!405224) (not e!359277))))

(assert (=> b!627523 (= res!405224 (validKeyInArray!0 k!1786))))

(declare-fun b!627524 () Bool)

(declare-fun res!405214 () Bool)

(assert (=> b!627524 (=> (not res!405214) (not e!359275))))

(declare-datatypes ((List!12241 0))(
  ( (Nil!12238) (Cons!12237 (h!13282 (_ BitVec 64)) (t!18469 List!12241)) )
))
(declare-fun arrayNoDuplicates!0 (array!37920 (_ BitVec 32) List!12241) Bool)

(assert (=> b!627524 (= res!405214 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12238))))

(assert (= (and start!56628 res!405217) b!627517))

(assert (= (and b!627517 res!405220) b!627514))

(assert (= (and b!627514 res!405219) b!627523))

(assert (= (and b!627523 res!405224) b!627521))

(assert (= (and b!627521 res!405218) b!627515))

(assert (= (and b!627515 res!405222) b!627516))

(assert (= (and b!627516 res!405221) b!627524))

(assert (= (and b!627524 res!405214) b!627518))

(assert (= (and b!627518 res!405216) b!627522))

(assert (= (and b!627522 res!405215) b!627520))

(assert (= (and b!627520 res!405223) b!627519))

(declare-fun m!602817 () Bool)

(assert (=> b!627515 m!602817))

(declare-fun m!602819 () Bool)

(assert (=> b!627519 m!602819))

(declare-fun m!602821 () Bool)

(assert (=> b!627522 m!602821))

(assert (=> b!627522 m!602821))

(declare-fun m!602823 () Bool)

(assert (=> b!627522 m!602823))

(declare-fun m!602825 () Bool)

(assert (=> b!627524 m!602825))

(declare-fun m!602827 () Bool)

(assert (=> b!627523 m!602827))

(declare-fun m!602829 () Bool)

(assert (=> b!627521 m!602829))

(assert (=> b!627514 m!602821))

(assert (=> b!627514 m!602821))

(declare-fun m!602831 () Bool)

(assert (=> b!627514 m!602831))

(declare-fun m!602833 () Bool)

(assert (=> start!56628 m!602833))

(declare-fun m!602835 () Bool)

(assert (=> start!56628 m!602835))

(declare-fun m!602837 () Bool)

(assert (=> b!627518 m!602837))

(declare-fun m!602839 () Bool)

(assert (=> b!627518 m!602839))

(declare-fun m!602841 () Bool)

(assert (=> b!627518 m!602841))

(declare-fun m!602843 () Bool)

(assert (=> b!627520 m!602843))

(assert (=> b!627520 m!602821))

(declare-fun m!602845 () Bool)

(assert (=> b!627516 m!602845))

(push 1)

(assert (not b!627516))

(assert (not b!627523))

(assert (not start!56628))

(assert (not b!627524))

(assert (not b!627521))

(assert (not b!627519))

(assert (not b!627522))

(assert (not b!627514))

(assert (not b!627515))

(check-sat)

