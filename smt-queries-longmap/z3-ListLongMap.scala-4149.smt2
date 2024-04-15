; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56568 () Bool)

(assert start!56568)

(declare-fun b!626516 () Bool)

(declare-fun res!404361 () Bool)

(declare-fun e!358894 () Bool)

(assert (=> b!626516 (=> (not res!404361) (not e!358894))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37872 0))(
  ( (array!37873 (arr!18176 (Array (_ BitVec 32) (_ BitVec 64))) (size!18541 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37872)

(assert (=> b!626516 (= res!404361 (and (= (size!18541 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18541 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18541 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626517 () Bool)

(declare-fun res!404363 () Bool)

(assert (=> b!626517 (=> (not res!404363) (not e!358894))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626517 (= res!404363 (validKeyInArray!0 k0!1786))))

(declare-fun b!626518 () Bool)

(declare-fun e!358896 () Bool)

(assert (=> b!626518 (= e!358896 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6613 0))(
  ( (MissingZero!6613 (index!28736 (_ BitVec 32))) (Found!6613 (index!28737 (_ BitVec 32))) (Intermediate!6613 (undefined!7425 Bool) (index!28738 (_ BitVec 32)) (x!57492 (_ BitVec 32))) (Undefined!6613) (MissingVacant!6613 (index!28739 (_ BitVec 32))) )
))
(declare-fun lt!289920 () SeekEntryResult!6613)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37872 (_ BitVec 32)) SeekEntryResult!6613)

(assert (=> b!626518 (= lt!289920 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18176 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626520 () Bool)

(declare-fun res!404365 () Bool)

(assert (=> b!626520 (=> (not res!404365) (not e!358894))))

(assert (=> b!626520 (= res!404365 (validKeyInArray!0 (select (arr!18176 a!2986) j!136)))))

(declare-fun b!626521 () Bool)

(declare-fun res!404364 () Bool)

(assert (=> b!626521 (=> (not res!404364) (not e!358896))))

(declare-datatypes ((List!12256 0))(
  ( (Nil!12253) (Cons!12252 (h!13297 (_ BitVec 64)) (t!18475 List!12256)) )
))
(declare-fun arrayNoDuplicates!0 (array!37872 (_ BitVec 32) List!12256) Bool)

(assert (=> b!626521 (= res!404364 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12253))))

(declare-fun b!626522 () Bool)

(declare-fun res!404360 () Bool)

(assert (=> b!626522 (=> (not res!404360) (not e!358894))))

(declare-fun arrayContainsKey!0 (array!37872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626522 (= res!404360 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!404359 () Bool)

(assert (=> start!56568 (=> (not res!404359) (not e!358894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56568 (= res!404359 (validMask!0 mask!3053))))

(assert (=> start!56568 e!358894))

(assert (=> start!56568 true))

(declare-fun array_inv!14059 (array!37872) Bool)

(assert (=> start!56568 (array_inv!14059 a!2986)))

(declare-fun b!626519 () Bool)

(declare-fun res!404362 () Bool)

(assert (=> b!626519 (=> (not res!404362) (not e!358896))))

(assert (=> b!626519 (= res!404362 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18176 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18176 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626523 () Bool)

(declare-fun res!404358 () Bool)

(assert (=> b!626523 (=> (not res!404358) (not e!358896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37872 (_ BitVec 32)) Bool)

(assert (=> b!626523 (= res!404358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626524 () Bool)

(assert (=> b!626524 (= e!358894 e!358896)))

(declare-fun res!404366 () Bool)

(assert (=> b!626524 (=> (not res!404366) (not e!358896))))

(declare-fun lt!289921 () SeekEntryResult!6613)

(assert (=> b!626524 (= res!404366 (or (= lt!289921 (MissingZero!6613 i!1108)) (= lt!289921 (MissingVacant!6613 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37872 (_ BitVec 32)) SeekEntryResult!6613)

(assert (=> b!626524 (= lt!289921 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!56568 res!404359) b!626516))

(assert (= (and b!626516 res!404361) b!626520))

(assert (= (and b!626520 res!404365) b!626517))

(assert (= (and b!626517 res!404363) b!626522))

(assert (= (and b!626522 res!404360) b!626524))

(assert (= (and b!626524 res!404366) b!626523))

(assert (= (and b!626523 res!404358) b!626521))

(assert (= (and b!626521 res!404364) b!626519))

(assert (= (and b!626519 res!404362) b!626518))

(declare-fun m!601387 () Bool)

(assert (=> b!626518 m!601387))

(assert (=> b!626518 m!601387))

(declare-fun m!601389 () Bool)

(assert (=> b!626518 m!601389))

(declare-fun m!601391 () Bool)

(assert (=> b!626519 m!601391))

(declare-fun m!601393 () Bool)

(assert (=> b!626519 m!601393))

(declare-fun m!601395 () Bool)

(assert (=> b!626519 m!601395))

(declare-fun m!601397 () Bool)

(assert (=> b!626522 m!601397))

(declare-fun m!601399 () Bool)

(assert (=> b!626517 m!601399))

(declare-fun m!601401 () Bool)

(assert (=> b!626521 m!601401))

(declare-fun m!601403 () Bool)

(assert (=> b!626523 m!601403))

(declare-fun m!601405 () Bool)

(assert (=> b!626524 m!601405))

(assert (=> b!626520 m!601387))

(assert (=> b!626520 m!601387))

(declare-fun m!601407 () Bool)

(assert (=> b!626520 m!601407))

(declare-fun m!601409 () Bool)

(assert (=> start!56568 m!601409))

(declare-fun m!601411 () Bool)

(assert (=> start!56568 m!601411))

(check-sat (not b!626524) (not start!56568) (not b!626518) (not b!626517) (not b!626520) (not b!626523) (not b!626522) (not b!626521))
(check-sat)
