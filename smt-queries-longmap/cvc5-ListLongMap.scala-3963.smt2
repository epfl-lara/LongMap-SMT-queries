; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53788 () Bool)

(assert start!53788)

(declare-fun b!586966 () Bool)

(declare-fun res!374792 () Bool)

(declare-fun e!335409 () Bool)

(assert (=> b!586966 (=> (not res!374792) (not e!335409))))

(declare-datatypes ((array!36689 0))(
  ( (array!36690 (arr!17619 (Array (_ BitVec 32) (_ BitVec 64))) (size!17983 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36689)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36689 (_ BitVec 32)) Bool)

(assert (=> b!586966 (= res!374792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586967 () Bool)

(declare-fun res!374791 () Bool)

(assert (=> b!586967 (=> (not res!374791) (not e!335409))))

(declare-datatypes ((List!11660 0))(
  ( (Nil!11657) (Cons!11656 (h!12701 (_ BitVec 64)) (t!17888 List!11660)) )
))
(declare-fun arrayNoDuplicates!0 (array!36689 (_ BitVec 32) List!11660) Bool)

(assert (=> b!586967 (= res!374791 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11657))))

(declare-fun b!586968 () Bool)

(declare-fun res!374787 () Bool)

(declare-fun e!335408 () Bool)

(assert (=> b!586968 (=> (not res!374787) (not e!335408))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586968 (= res!374787 (validKeyInArray!0 (select (arr!17619 a!2986) j!136)))))

(declare-fun res!374786 () Bool)

(assert (=> start!53788 (=> (not res!374786) (not e!335408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53788 (= res!374786 (validMask!0 mask!3053))))

(assert (=> start!53788 e!335408))

(assert (=> start!53788 true))

(declare-fun array_inv!13415 (array!36689) Bool)

(assert (=> start!53788 (array_inv!13415 a!2986)))

(declare-fun b!586969 () Bool)

(declare-fun res!374785 () Bool)

(assert (=> b!586969 (=> (not res!374785) (not e!335408))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586969 (= res!374785 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586970 () Bool)

(declare-fun res!374782 () Bool)

(assert (=> b!586970 (=> (not res!374782) (not e!335409))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!586970 (= res!374782 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17619 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17619 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586971 () Bool)

(declare-fun res!374790 () Bool)

(assert (=> b!586971 (=> (not res!374790) (not e!335408))))

(assert (=> b!586971 (= res!374790 (and (= (size!17983 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17983 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17983 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586972 () Bool)

(declare-fun res!374783 () Bool)

(assert (=> b!586972 (=> (not res!374783) (not e!335409))))

(assert (=> b!586972 (= res!374783 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17619 a!2986) index!984) (select (arr!17619 a!2986) j!136))) (not (= (select (arr!17619 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586973 () Bool)

(assert (=> b!586973 (= e!335409 (not true))))

(declare-fun lt!266237 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6059 0))(
  ( (MissingZero!6059 (index!26463 (_ BitVec 32))) (Found!6059 (index!26464 (_ BitVec 32))) (Intermediate!6059 (undefined!6871 Bool) (index!26465 (_ BitVec 32)) (x!55272 (_ BitVec 32))) (Undefined!6059) (MissingVacant!6059 (index!26466 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36689 (_ BitVec 32)) SeekEntryResult!6059)

(assert (=> b!586973 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266237 vacantSpotIndex!68 (select (arr!17619 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266237 vacantSpotIndex!68 (select (store (arr!17619 a!2986) i!1108 k!1786) j!136) (array!36690 (store (arr!17619 a!2986) i!1108 k!1786) (size!17983 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18238 0))(
  ( (Unit!18239) )
))
(declare-fun lt!266238 () Unit!18238)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36689 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18238)

(assert (=> b!586973 (= lt!266238 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266237 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586973 (= lt!266237 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586974 () Bool)

(assert (=> b!586974 (= e!335408 e!335409)))

(declare-fun res!374788 () Bool)

(assert (=> b!586974 (=> (not res!374788) (not e!335409))))

(declare-fun lt!266239 () SeekEntryResult!6059)

(assert (=> b!586974 (= res!374788 (or (= lt!266239 (MissingZero!6059 i!1108)) (= lt!266239 (MissingVacant!6059 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36689 (_ BitVec 32)) SeekEntryResult!6059)

(assert (=> b!586974 (= lt!266239 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586975 () Bool)

(declare-fun res!374789 () Bool)

(assert (=> b!586975 (=> (not res!374789) (not e!335409))))

(assert (=> b!586975 (= res!374789 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17619 a!2986) j!136) a!2986 mask!3053) (Found!6059 j!136)))))

(declare-fun b!586976 () Bool)

(declare-fun res!374784 () Bool)

(assert (=> b!586976 (=> (not res!374784) (not e!335408))))

(assert (=> b!586976 (= res!374784 (validKeyInArray!0 k!1786))))

(assert (= (and start!53788 res!374786) b!586971))

(assert (= (and b!586971 res!374790) b!586968))

(assert (= (and b!586968 res!374787) b!586976))

(assert (= (and b!586976 res!374784) b!586969))

(assert (= (and b!586969 res!374785) b!586974))

(assert (= (and b!586974 res!374788) b!586966))

(assert (= (and b!586966 res!374792) b!586967))

(assert (= (and b!586967 res!374791) b!586970))

(assert (= (and b!586970 res!374782) b!586975))

(assert (= (and b!586975 res!374789) b!586972))

(assert (= (and b!586972 res!374783) b!586973))

(declare-fun m!565405 () Bool)

(assert (=> b!586969 m!565405))

(declare-fun m!565407 () Bool)

(assert (=> b!586968 m!565407))

(assert (=> b!586968 m!565407))

(declare-fun m!565409 () Bool)

(assert (=> b!586968 m!565409))

(assert (=> b!586975 m!565407))

(assert (=> b!586975 m!565407))

(declare-fun m!565411 () Bool)

(assert (=> b!586975 m!565411))

(declare-fun m!565413 () Bool)

(assert (=> b!586973 m!565413))

(declare-fun m!565415 () Bool)

(assert (=> b!586973 m!565415))

(assert (=> b!586973 m!565407))

(declare-fun m!565417 () Bool)

(assert (=> b!586973 m!565417))

(assert (=> b!586973 m!565407))

(declare-fun m!565419 () Bool)

(assert (=> b!586973 m!565419))

(declare-fun m!565421 () Bool)

(assert (=> b!586973 m!565421))

(assert (=> b!586973 m!565415))

(declare-fun m!565423 () Bool)

(assert (=> b!586973 m!565423))

(declare-fun m!565425 () Bool)

(assert (=> b!586972 m!565425))

(assert (=> b!586972 m!565407))

(declare-fun m!565427 () Bool)

(assert (=> b!586974 m!565427))

(declare-fun m!565429 () Bool)

(assert (=> start!53788 m!565429))

(declare-fun m!565431 () Bool)

(assert (=> start!53788 m!565431))

(declare-fun m!565433 () Bool)

(assert (=> b!586967 m!565433))

(declare-fun m!565435 () Bool)

(assert (=> b!586970 m!565435))

(assert (=> b!586970 m!565417))

(declare-fun m!565437 () Bool)

(assert (=> b!586970 m!565437))

(declare-fun m!565439 () Bool)

(assert (=> b!586966 m!565439))

(declare-fun m!565441 () Bool)

(assert (=> b!586976 m!565441))

(push 1)

(assert (not b!586975))

(assert (not b!586976))

(assert (not b!586974))

(assert (not start!53788))

(assert (not b!586973))

(assert (not b!586967))

(assert (not b!586966))

(assert (not b!586968))

(assert (not b!586969))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

