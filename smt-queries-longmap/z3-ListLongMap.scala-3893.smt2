; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53370 () Bool)

(assert start!53370)

(declare-fun b!580509 () Bool)

(declare-fun e!333356 () Bool)

(assert (=> b!580509 (= e!333356 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5850 0))(
  ( (MissingZero!5850 (index!25627 (_ BitVec 32))) (Found!5850 (index!25628 (_ BitVec 32))) (Intermediate!5850 (undefined!6662 Bool) (index!25629 (_ BitVec 32)) (x!54503 (_ BitVec 32))) (Undefined!5850) (MissingVacant!5850 (index!25630 (_ BitVec 32))) )
))
(declare-fun lt!264721 () SeekEntryResult!5850)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36271 0))(
  ( (array!36272 (arr!17410 (Array (_ BitVec 32) (_ BitVec 64))) (size!17774 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36271)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36271 (_ BitVec 32)) SeekEntryResult!5850)

(assert (=> b!580509 (= lt!264721 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17410 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580510 () Bool)

(declare-fun res!368327 () Bool)

(declare-fun e!333355 () Bool)

(assert (=> b!580510 (=> (not res!368327) (not e!333355))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580510 (= res!368327 (validKeyInArray!0 k0!1786))))

(declare-fun b!580512 () Bool)

(declare-fun res!368329 () Bool)

(assert (=> b!580512 (=> (not res!368329) (not e!333355))))

(assert (=> b!580512 (= res!368329 (validKeyInArray!0 (select (arr!17410 a!2986) j!136)))))

(declare-fun b!580513 () Bool)

(declare-fun res!368325 () Bool)

(assert (=> b!580513 (=> (not res!368325) (not e!333356))))

(declare-datatypes ((List!11451 0))(
  ( (Nil!11448) (Cons!11447 (h!12492 (_ BitVec 64)) (t!17679 List!11451)) )
))
(declare-fun arrayNoDuplicates!0 (array!36271 (_ BitVec 32) List!11451) Bool)

(assert (=> b!580513 (= res!368325 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11448))))

(declare-fun b!580514 () Bool)

(declare-fun res!368330 () Bool)

(assert (=> b!580514 (=> (not res!368330) (not e!333355))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580514 (= res!368330 (and (= (size!17774 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17774 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17774 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580515 () Bool)

(declare-fun res!368331 () Bool)

(assert (=> b!580515 (=> (not res!368331) (not e!333355))))

(declare-fun arrayContainsKey!0 (array!36271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580515 (= res!368331 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580516 () Bool)

(assert (=> b!580516 (= e!333355 e!333356)))

(declare-fun res!368332 () Bool)

(assert (=> b!580516 (=> (not res!368332) (not e!333356))))

(declare-fun lt!264720 () SeekEntryResult!5850)

(assert (=> b!580516 (= res!368332 (or (= lt!264720 (MissingZero!5850 i!1108)) (= lt!264720 (MissingVacant!5850 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36271 (_ BitVec 32)) SeekEntryResult!5850)

(assert (=> b!580516 (= lt!264720 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580517 () Bool)

(declare-fun res!368326 () Bool)

(assert (=> b!580517 (=> (not res!368326) (not e!333356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36271 (_ BitVec 32)) Bool)

(assert (=> b!580517 (= res!368326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580511 () Bool)

(declare-fun res!368333 () Bool)

(assert (=> b!580511 (=> (not res!368333) (not e!333356))))

(assert (=> b!580511 (= res!368333 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17410 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17410 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!368328 () Bool)

(assert (=> start!53370 (=> (not res!368328) (not e!333355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53370 (= res!368328 (validMask!0 mask!3053))))

(assert (=> start!53370 e!333355))

(assert (=> start!53370 true))

(declare-fun array_inv!13206 (array!36271) Bool)

(assert (=> start!53370 (array_inv!13206 a!2986)))

(assert (= (and start!53370 res!368328) b!580514))

(assert (= (and b!580514 res!368330) b!580512))

(assert (= (and b!580512 res!368329) b!580510))

(assert (= (and b!580510 res!368327) b!580515))

(assert (= (and b!580515 res!368331) b!580516))

(assert (= (and b!580516 res!368332) b!580517))

(assert (= (and b!580517 res!368326) b!580513))

(assert (= (and b!580513 res!368325) b!580511))

(assert (= (and b!580511 res!368333) b!580509))

(declare-fun m!559089 () Bool)

(assert (=> b!580513 m!559089))

(declare-fun m!559091 () Bool)

(assert (=> start!53370 m!559091))

(declare-fun m!559093 () Bool)

(assert (=> start!53370 m!559093))

(declare-fun m!559095 () Bool)

(assert (=> b!580510 m!559095))

(declare-fun m!559097 () Bool)

(assert (=> b!580512 m!559097))

(assert (=> b!580512 m!559097))

(declare-fun m!559099 () Bool)

(assert (=> b!580512 m!559099))

(declare-fun m!559101 () Bool)

(assert (=> b!580515 m!559101))

(declare-fun m!559103 () Bool)

(assert (=> b!580511 m!559103))

(declare-fun m!559105 () Bool)

(assert (=> b!580511 m!559105))

(declare-fun m!559107 () Bool)

(assert (=> b!580511 m!559107))

(assert (=> b!580509 m!559097))

(assert (=> b!580509 m!559097))

(declare-fun m!559109 () Bool)

(assert (=> b!580509 m!559109))

(declare-fun m!559111 () Bool)

(assert (=> b!580517 m!559111))

(declare-fun m!559113 () Bool)

(assert (=> b!580516 m!559113))

(check-sat (not b!580513) (not b!580509) (not start!53370) (not b!580510) (not b!580517) (not b!580515) (not b!580516) (not b!580512))
(check-sat)
