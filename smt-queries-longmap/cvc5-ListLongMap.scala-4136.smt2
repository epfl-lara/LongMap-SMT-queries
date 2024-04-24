; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56464 () Bool)

(assert start!56464)

(declare-fun b!625529 () Bool)

(declare-fun res!403437 () Bool)

(declare-fun e!358577 () Bool)

(assert (=> b!625529 (=> (not res!403437) (not e!358577))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37789 0))(
  ( (array!37790 (arr!18135 (Array (_ BitVec 32) (_ BitVec 64))) (size!18499 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37789)

(assert (=> b!625529 (= res!403437 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18135 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18135 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625530 () Bool)

(declare-fun e!358578 () Bool)

(assert (=> b!625530 (= e!358578 e!358577)))

(declare-fun res!403433 () Bool)

(assert (=> b!625530 (=> (not res!403433) (not e!358577))))

(declare-datatypes ((SeekEntryResult!6531 0))(
  ( (MissingZero!6531 (index!28408 (_ BitVec 32))) (Found!6531 (index!28409 (_ BitVec 32))) (Intermediate!6531 (undefined!7343 Bool) (index!28410 (_ BitVec 32)) (x!57308 (_ BitVec 32))) (Undefined!6531) (MissingVacant!6531 (index!28411 (_ BitVec 32))) )
))
(declare-fun lt!289911 () SeekEntryResult!6531)

(assert (=> b!625530 (= res!403433 (or (= lt!289911 (MissingZero!6531 i!1108)) (= lt!289911 (MissingVacant!6531 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37789 (_ BitVec 32)) SeekEntryResult!6531)

(assert (=> b!625530 (= lt!289911 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!625531 () Bool)

(declare-fun res!403430 () Bool)

(assert (=> b!625531 (=> (not res!403430) (not e!358578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625531 (= res!403430 (validKeyInArray!0 k!1786))))

(declare-fun b!625532 () Bool)

(declare-fun res!403436 () Bool)

(assert (=> b!625532 (=> (not res!403436) (not e!358578))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!625532 (= res!403436 (and (= (size!18499 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18499 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18499 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625534 () Bool)

(declare-fun res!403431 () Bool)

(assert (=> b!625534 (=> (not res!403431) (not e!358578))))

(declare-fun arrayContainsKey!0 (array!37789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625534 (= res!403431 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625535 () Bool)

(declare-fun res!403432 () Bool)

(assert (=> b!625535 (=> (not res!403432) (not e!358577))))

(declare-datatypes ((List!12083 0))(
  ( (Nil!12080) (Cons!12079 (h!13127 (_ BitVec 64)) (t!18303 List!12083)) )
))
(declare-fun arrayNoDuplicates!0 (array!37789 (_ BitVec 32) List!12083) Bool)

(assert (=> b!625535 (= res!403432 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12080))))

(declare-fun b!625536 () Bool)

(assert (=> b!625536 (= e!358577 false)))

(declare-fun lt!289912 () SeekEntryResult!6531)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37789 (_ BitVec 32)) SeekEntryResult!6531)

(assert (=> b!625536 (= lt!289912 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18135 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625537 () Bool)

(declare-fun res!403438 () Bool)

(assert (=> b!625537 (=> (not res!403438) (not e!358578))))

(assert (=> b!625537 (= res!403438 (validKeyInArray!0 (select (arr!18135 a!2986) j!136)))))

(declare-fun res!403434 () Bool)

(assert (=> start!56464 (=> (not res!403434) (not e!358578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56464 (= res!403434 (validMask!0 mask!3053))))

(assert (=> start!56464 e!358578))

(assert (=> start!56464 true))

(declare-fun array_inv!13994 (array!37789) Bool)

(assert (=> start!56464 (array_inv!13994 a!2986)))

(declare-fun b!625533 () Bool)

(declare-fun res!403435 () Bool)

(assert (=> b!625533 (=> (not res!403435) (not e!358577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37789 (_ BitVec 32)) Bool)

(assert (=> b!625533 (= res!403435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56464 res!403434) b!625532))

(assert (= (and b!625532 res!403436) b!625537))

(assert (= (and b!625537 res!403438) b!625531))

(assert (= (and b!625531 res!403430) b!625534))

(assert (= (and b!625534 res!403431) b!625530))

(assert (= (and b!625530 res!403433) b!625533))

(assert (= (and b!625533 res!403435) b!625535))

(assert (= (and b!625535 res!403432) b!625529))

(assert (= (and b!625529 res!403437) b!625536))

(declare-fun m!601385 () Bool)

(assert (=> b!625536 m!601385))

(assert (=> b!625536 m!601385))

(declare-fun m!601387 () Bool)

(assert (=> b!625536 m!601387))

(declare-fun m!601389 () Bool)

(assert (=> start!56464 m!601389))

(declare-fun m!601391 () Bool)

(assert (=> start!56464 m!601391))

(declare-fun m!601393 () Bool)

(assert (=> b!625533 m!601393))

(declare-fun m!601395 () Bool)

(assert (=> b!625530 m!601395))

(declare-fun m!601397 () Bool)

(assert (=> b!625531 m!601397))

(declare-fun m!601399 () Bool)

(assert (=> b!625529 m!601399))

(declare-fun m!601401 () Bool)

(assert (=> b!625529 m!601401))

(declare-fun m!601403 () Bool)

(assert (=> b!625529 m!601403))

(assert (=> b!625537 m!601385))

(assert (=> b!625537 m!601385))

(declare-fun m!601405 () Bool)

(assert (=> b!625537 m!601405))

(declare-fun m!601407 () Bool)

(assert (=> b!625534 m!601407))

(declare-fun m!601409 () Bool)

(assert (=> b!625535 m!601409))

(push 1)

(assert (not b!625530))

(assert (not b!625535))

(assert (not b!625533))

(assert (not b!625537))

(assert (not b!625531))

(assert (not start!56464))

(assert (not b!625534))

(assert (not b!625536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

