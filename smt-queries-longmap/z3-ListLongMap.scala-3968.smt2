; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53862 () Bool)

(assert start!53862)

(declare-fun b!587442 () Bool)

(declare-fun e!335530 () Bool)

(declare-fun e!335532 () Bool)

(assert (=> b!587442 (= e!335530 e!335532)))

(declare-fun res!375229 () Bool)

(assert (=> b!587442 (=> (not res!375229) (not e!335532))))

(declare-datatypes ((SeekEntryResult!6070 0))(
  ( (MissingZero!6070 (index!26510 (_ BitVec 32))) (Found!6070 (index!26511 (_ BitVec 32))) (Intermediate!6070 (undefined!6882 Bool) (index!26512 (_ BitVec 32)) (x!55327 (_ BitVec 32))) (Undefined!6070) (MissingVacant!6070 (index!26513 (_ BitVec 32))) )
))
(declare-fun lt!266240 () SeekEntryResult!6070)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587442 (= res!375229 (or (= lt!266240 (MissingZero!6070 i!1108)) (= lt!266240 (MissingVacant!6070 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36720 0))(
  ( (array!36721 (arr!17633 (Array (_ BitVec 32) (_ BitVec 64))) (size!17998 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36720)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36720 (_ BitVec 32)) SeekEntryResult!6070)

(assert (=> b!587442 (= lt!266240 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!587443 () Bool)

(assert (=> b!587443 (= e!335532 (not true))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!266241 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36720 (_ BitVec 32)) SeekEntryResult!6070)

(assert (=> b!587443 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266241 vacantSpotIndex!68 (select (arr!17633 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266241 vacantSpotIndex!68 (select (store (arr!17633 a!2986) i!1108 k0!1786) j!136) (array!36721 (store (arr!17633 a!2986) i!1108 k0!1786) (size!17998 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18246 0))(
  ( (Unit!18247) )
))
(declare-fun lt!266242 () Unit!18246)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36720 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18246)

(assert (=> b!587443 (= lt!266242 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266241 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587443 (= lt!266241 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587444 () Bool)

(declare-fun res!375222 () Bool)

(assert (=> b!587444 (=> (not res!375222) (not e!335532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36720 (_ BitVec 32)) Bool)

(assert (=> b!587444 (= res!375222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587445 () Bool)

(declare-fun res!375223 () Bool)

(assert (=> b!587445 (=> (not res!375223) (not e!335532))))

(assert (=> b!587445 (= res!375223 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17633 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17633 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!375230 () Bool)

(assert (=> start!53862 (=> (not res!375230) (not e!335530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53862 (= res!375230 (validMask!0 mask!3053))))

(assert (=> start!53862 e!335530))

(assert (=> start!53862 true))

(declare-fun array_inv!13516 (array!36720) Bool)

(assert (=> start!53862 (array_inv!13516 a!2986)))

(declare-fun b!587446 () Bool)

(declare-fun res!375224 () Bool)

(assert (=> b!587446 (=> (not res!375224) (not e!335530))))

(declare-fun arrayContainsKey!0 (array!36720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587446 (= res!375224 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587447 () Bool)

(declare-fun res!375226 () Bool)

(assert (=> b!587447 (=> (not res!375226) (not e!335530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587447 (= res!375226 (validKeyInArray!0 (select (arr!17633 a!2986) j!136)))))

(declare-fun b!587448 () Bool)

(declare-fun res!375220 () Bool)

(assert (=> b!587448 (=> (not res!375220) (not e!335532))))

(assert (=> b!587448 (= res!375220 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17633 a!2986) index!984) (select (arr!17633 a!2986) j!136))) (not (= (select (arr!17633 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587449 () Bool)

(declare-fun res!375225 () Bool)

(assert (=> b!587449 (=> (not res!375225) (not e!335530))))

(assert (=> b!587449 (= res!375225 (and (= (size!17998 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17998 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17998 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587450 () Bool)

(declare-fun res!375227 () Bool)

(assert (=> b!587450 (=> (not res!375227) (not e!335532))))

(declare-datatypes ((List!11713 0))(
  ( (Nil!11710) (Cons!11709 (h!12754 (_ BitVec 64)) (t!17932 List!11713)) )
))
(declare-fun arrayNoDuplicates!0 (array!36720 (_ BitVec 32) List!11713) Bool)

(assert (=> b!587450 (= res!375227 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11710))))

(declare-fun b!587451 () Bool)

(declare-fun res!375228 () Bool)

(assert (=> b!587451 (=> (not res!375228) (not e!335532))))

(assert (=> b!587451 (= res!375228 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17633 a!2986) j!136) a!2986 mask!3053) (Found!6070 j!136)))))

(declare-fun b!587452 () Bool)

(declare-fun res!375221 () Bool)

(assert (=> b!587452 (=> (not res!375221) (not e!335530))))

(assert (=> b!587452 (= res!375221 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53862 res!375230) b!587449))

(assert (= (and b!587449 res!375225) b!587447))

(assert (= (and b!587447 res!375226) b!587452))

(assert (= (and b!587452 res!375221) b!587446))

(assert (= (and b!587446 res!375224) b!587442))

(assert (= (and b!587442 res!375229) b!587444))

(assert (= (and b!587444 res!375222) b!587450))

(assert (= (and b!587450 res!375227) b!587445))

(assert (= (and b!587445 res!375223) b!587451))

(assert (= (and b!587451 res!375228) b!587448))

(assert (= (and b!587448 res!375220) b!587443))

(declare-fun m!565369 () Bool)

(assert (=> b!587450 m!565369))

(declare-fun m!565371 () Bool)

(assert (=> b!587447 m!565371))

(assert (=> b!587447 m!565371))

(declare-fun m!565373 () Bool)

(assert (=> b!587447 m!565373))

(declare-fun m!565375 () Bool)

(assert (=> start!53862 m!565375))

(declare-fun m!565377 () Bool)

(assert (=> start!53862 m!565377))

(declare-fun m!565379 () Bool)

(assert (=> b!587446 m!565379))

(assert (=> b!587451 m!565371))

(assert (=> b!587451 m!565371))

(declare-fun m!565381 () Bool)

(assert (=> b!587451 m!565381))

(declare-fun m!565383 () Bool)

(assert (=> b!587444 m!565383))

(declare-fun m!565385 () Bool)

(assert (=> b!587452 m!565385))

(declare-fun m!565387 () Bool)

(assert (=> b!587442 m!565387))

(declare-fun m!565389 () Bool)

(assert (=> b!587443 m!565389))

(declare-fun m!565391 () Bool)

(assert (=> b!587443 m!565391))

(assert (=> b!587443 m!565391))

(declare-fun m!565393 () Bool)

(assert (=> b!587443 m!565393))

(assert (=> b!587443 m!565371))

(declare-fun m!565395 () Bool)

(assert (=> b!587443 m!565395))

(assert (=> b!587443 m!565371))

(declare-fun m!565397 () Bool)

(assert (=> b!587443 m!565397))

(declare-fun m!565399 () Bool)

(assert (=> b!587443 m!565399))

(declare-fun m!565401 () Bool)

(assert (=> b!587448 m!565401))

(assert (=> b!587448 m!565371))

(declare-fun m!565403 () Bool)

(assert (=> b!587445 m!565403))

(assert (=> b!587445 m!565395))

(declare-fun m!565405 () Bool)

(assert (=> b!587445 m!565405))

(check-sat (not b!587451) (not start!53862) (not b!587444) (not b!587442) (not b!587452) (not b!587447) (not b!587450) (not b!587446) (not b!587443))
(check-sat)
