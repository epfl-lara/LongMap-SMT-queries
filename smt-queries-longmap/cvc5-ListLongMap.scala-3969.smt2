; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53884 () Bool)

(assert start!53884)

(declare-fun b!587812 () Bool)

(declare-fun e!335737 () Bool)

(declare-fun e!335735 () Bool)

(assert (=> b!587812 (= e!335737 e!335735)))

(declare-fun res!375458 () Bool)

(assert (=> b!587812 (=> (not res!375458) (not e!335735))))

(declare-datatypes ((SeekEntryResult!6077 0))(
  ( (MissingZero!6077 (index!26538 (_ BitVec 32))) (Found!6077 (index!26539 (_ BitVec 32))) (Intermediate!6077 (undefined!6889 Bool) (index!26540 (_ BitVec 32)) (x!55347 (_ BitVec 32))) (Undefined!6077) (MissingVacant!6077 (index!26541 (_ BitVec 32))) )
))
(declare-fun lt!266508 () SeekEntryResult!6077)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587812 (= res!375458 (or (= lt!266508 (MissingZero!6077 i!1108)) (= lt!266508 (MissingVacant!6077 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36728 0))(
  ( (array!36729 (arr!17637 (Array (_ BitVec 32) (_ BitVec 64))) (size!18001 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36728)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36728 (_ BitVec 32)) SeekEntryResult!6077)

(assert (=> b!587812 (= lt!266508 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!587813 () Bool)

(declare-fun e!335739 () Bool)

(declare-fun lt!266505 () SeekEntryResult!6077)

(declare-fun lt!266507 () SeekEntryResult!6077)

(assert (=> b!587813 (= e!335739 (= lt!266505 lt!266507))))

(declare-fun b!587814 () Bool)

(declare-fun res!375451 () Bool)

(assert (=> b!587814 (=> (not res!375451) (not e!335737))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!587814 (= res!375451 (and (= (size!18001 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18001 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18001 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587815 () Bool)

(declare-fun res!375455 () Bool)

(assert (=> b!587815 (=> (not res!375455) (not e!335735))))

(declare-datatypes ((List!11678 0))(
  ( (Nil!11675) (Cons!11674 (h!12719 (_ BitVec 64)) (t!17906 List!11678)) )
))
(declare-fun arrayNoDuplicates!0 (array!36728 (_ BitVec 32) List!11678) Bool)

(assert (=> b!587815 (= res!375455 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11675))))

(declare-fun b!587816 () Bool)

(declare-fun res!375450 () Bool)

(assert (=> b!587816 (=> (not res!375450) (not e!335735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36728 (_ BitVec 32)) Bool)

(assert (=> b!587816 (= res!375450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587817 () Bool)

(declare-fun e!335738 () Bool)

(assert (=> b!587817 (= e!335735 e!335738)))

(declare-fun res!375457 () Bool)

(assert (=> b!587817 (=> (not res!375457) (not e!335738))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!587817 (= res!375457 (and (= lt!266505 (Found!6077 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17637 a!2986) index!984) (select (arr!17637 a!2986) j!136))) (not (= (select (arr!17637 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36728 (_ BitVec 32)) SeekEntryResult!6077)

(assert (=> b!587817 (= lt!266505 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17637 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587819 () Bool)

(declare-fun res!375456 () Bool)

(assert (=> b!587819 (=> (not res!375456) (not e!335735))))

(assert (=> b!587819 (= res!375456 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17637 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17637 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587820 () Bool)

(declare-fun res!375452 () Bool)

(assert (=> b!587820 (=> (not res!375452) (not e!335737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587820 (= res!375452 (validKeyInArray!0 k!1786))))

(declare-fun b!587821 () Bool)

(assert (=> b!587821 (= e!335738 (not true))))

(assert (=> b!587821 e!335739))

(declare-fun res!375449 () Bool)

(assert (=> b!587821 (=> (not res!375449) (not e!335739))))

(declare-fun lt!266509 () (_ BitVec 32))

(assert (=> b!587821 (= res!375449 (= lt!266507 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266509 vacantSpotIndex!68 (select (store (arr!17637 a!2986) i!1108 k!1786) j!136) (array!36729 (store (arr!17637 a!2986) i!1108 k!1786) (size!18001 a!2986)) mask!3053)))))

(assert (=> b!587821 (= lt!266507 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266509 vacantSpotIndex!68 (select (arr!17637 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18274 0))(
  ( (Unit!18275) )
))
(declare-fun lt!266506 () Unit!18274)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36728 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18274)

(assert (=> b!587821 (= lt!266506 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266509 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587821 (= lt!266509 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587822 () Bool)

(declare-fun res!375448 () Bool)

(assert (=> b!587822 (=> (not res!375448) (not e!335737))))

(declare-fun arrayContainsKey!0 (array!36728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587822 (= res!375448 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587818 () Bool)

(declare-fun res!375454 () Bool)

(assert (=> b!587818 (=> (not res!375454) (not e!335737))))

(assert (=> b!587818 (= res!375454 (validKeyInArray!0 (select (arr!17637 a!2986) j!136)))))

(declare-fun res!375453 () Bool)

(assert (=> start!53884 (=> (not res!375453) (not e!335737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53884 (= res!375453 (validMask!0 mask!3053))))

(assert (=> start!53884 e!335737))

(assert (=> start!53884 true))

(declare-fun array_inv!13433 (array!36728) Bool)

(assert (=> start!53884 (array_inv!13433 a!2986)))

(assert (= (and start!53884 res!375453) b!587814))

(assert (= (and b!587814 res!375451) b!587818))

(assert (= (and b!587818 res!375454) b!587820))

(assert (= (and b!587820 res!375452) b!587822))

(assert (= (and b!587822 res!375448) b!587812))

(assert (= (and b!587812 res!375458) b!587816))

(assert (= (and b!587816 res!375450) b!587815))

(assert (= (and b!587815 res!375455) b!587819))

(assert (= (and b!587819 res!375456) b!587817))

(assert (= (and b!587817 res!375457) b!587821))

(assert (= (and b!587821 res!375449) b!587813))

(declare-fun m!566269 () Bool)

(assert (=> b!587817 m!566269))

(declare-fun m!566271 () Bool)

(assert (=> b!587817 m!566271))

(assert (=> b!587817 m!566271))

(declare-fun m!566273 () Bool)

(assert (=> b!587817 m!566273))

(declare-fun m!566275 () Bool)

(assert (=> b!587820 m!566275))

(declare-fun m!566277 () Bool)

(assert (=> b!587812 m!566277))

(declare-fun m!566279 () Bool)

(assert (=> b!587816 m!566279))

(assert (=> b!587818 m!566271))

(assert (=> b!587818 m!566271))

(declare-fun m!566281 () Bool)

(assert (=> b!587818 m!566281))

(declare-fun m!566283 () Bool)

(assert (=> start!53884 m!566283))

(declare-fun m!566285 () Bool)

(assert (=> start!53884 m!566285))

(declare-fun m!566287 () Bool)

(assert (=> b!587822 m!566287))

(declare-fun m!566289 () Bool)

(assert (=> b!587815 m!566289))

(declare-fun m!566291 () Bool)

(assert (=> b!587819 m!566291))

(declare-fun m!566293 () Bool)

(assert (=> b!587819 m!566293))

(declare-fun m!566295 () Bool)

(assert (=> b!587819 m!566295))

(declare-fun m!566297 () Bool)

(assert (=> b!587821 m!566297))

(declare-fun m!566299 () Bool)

(assert (=> b!587821 m!566299))

(declare-fun m!566301 () Bool)

(assert (=> b!587821 m!566301))

(assert (=> b!587821 m!566271))

(assert (=> b!587821 m!566293))

(assert (=> b!587821 m!566271))

(declare-fun m!566303 () Bool)

(assert (=> b!587821 m!566303))

(assert (=> b!587821 m!566301))

(declare-fun m!566305 () Bool)

(assert (=> b!587821 m!566305))

(push 1)

