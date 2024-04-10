; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53860 () Bool)

(assert start!53860)

(declare-fun b!587416 () Bool)

(declare-fun res!375052 () Bool)

(declare-fun e!335625 () Bool)

(assert (=> b!587416 (=> (not res!375052) (not e!335625))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36704 0))(
  ( (array!36705 (arr!17625 (Array (_ BitVec 32) (_ BitVec 64))) (size!17989 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36704)

(assert (=> b!587416 (= res!375052 (and (= (size!17989 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17989 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17989 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587417 () Bool)

(declare-fun res!375057 () Bool)

(declare-fun e!335623 () Bool)

(assert (=> b!587417 (=> (not res!375057) (not e!335623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36704 (_ BitVec 32)) Bool)

(assert (=> b!587417 (= res!375057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587418 () Bool)

(assert (=> b!587418 (= e!335625 e!335623)))

(declare-fun res!375061 () Bool)

(assert (=> b!587418 (=> (not res!375061) (not e!335623))))

(declare-datatypes ((SeekEntryResult!6065 0))(
  ( (MissingZero!6065 (index!26490 (_ BitVec 32))) (Found!6065 (index!26491 (_ BitVec 32))) (Intermediate!6065 (undefined!6877 Bool) (index!26492 (_ BitVec 32)) (x!55303 (_ BitVec 32))) (Undefined!6065) (MissingVacant!6065 (index!26493 (_ BitVec 32))) )
))
(declare-fun lt!266393 () SeekEntryResult!6065)

(assert (=> b!587418 (= res!375061 (or (= lt!266393 (MissingZero!6065 i!1108)) (= lt!266393 (MissingVacant!6065 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36704 (_ BitVec 32)) SeekEntryResult!6065)

(assert (=> b!587418 (= lt!266393 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!587419 () Bool)

(declare-fun res!375056 () Bool)

(assert (=> b!587419 (=> (not res!375056) (not e!335625))))

(declare-fun arrayContainsKey!0 (array!36704 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587419 (= res!375056 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587420 () Bool)

(declare-fun res!375059 () Bool)

(assert (=> b!587420 (=> (not res!375059) (not e!335625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587420 (= res!375059 (validKeyInArray!0 k!1786))))

(declare-fun b!587421 () Bool)

(declare-fun res!375055 () Bool)

(assert (=> b!587421 (=> (not res!375055) (not e!335623))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!587421 (= res!375055 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17625 a!2986) index!984) (select (arr!17625 a!2986) j!136))) (not (= (select (arr!17625 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587423 () Bool)

(declare-fun res!375054 () Bool)

(assert (=> b!587423 (=> (not res!375054) (not e!335625))))

(assert (=> b!587423 (= res!375054 (validKeyInArray!0 (select (arr!17625 a!2986) j!136)))))

(declare-fun b!587424 () Bool)

(declare-fun res!375060 () Bool)

(assert (=> b!587424 (=> (not res!375060) (not e!335623))))

(declare-datatypes ((List!11666 0))(
  ( (Nil!11663) (Cons!11662 (h!12707 (_ BitVec 64)) (t!17894 List!11666)) )
))
(declare-fun arrayNoDuplicates!0 (array!36704 (_ BitVec 32) List!11666) Bool)

(assert (=> b!587424 (= res!375060 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11663))))

(declare-fun res!375062 () Bool)

(assert (=> start!53860 (=> (not res!375062) (not e!335625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53860 (= res!375062 (validMask!0 mask!3053))))

(assert (=> start!53860 e!335625))

(assert (=> start!53860 true))

(declare-fun array_inv!13421 (array!36704) Bool)

(assert (=> start!53860 (array_inv!13421 a!2986)))

(declare-fun b!587422 () Bool)

(declare-fun res!375058 () Bool)

(assert (=> b!587422 (=> (not res!375058) (not e!335623))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36704 (_ BitVec 32)) SeekEntryResult!6065)

(assert (=> b!587422 (= res!375058 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17625 a!2986) j!136) a!2986 mask!3053) (Found!6065 j!136)))))

(declare-fun lt!266394 () (_ BitVec 32))

(declare-fun b!587425 () Bool)

(assert (=> b!587425 (= e!335623 (not (or (bvslt mask!3053 #b00000000000000000000000000000000) (bvslt lt!266394 #b00000000000000000000000000000000) (bvsge lt!266394 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000))))))

(assert (=> b!587425 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266394 vacantSpotIndex!68 (select (arr!17625 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266394 vacantSpotIndex!68 (select (store (arr!17625 a!2986) i!1108 k!1786) j!136) (array!36705 (store (arr!17625 a!2986) i!1108 k!1786) (size!17989 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18250 0))(
  ( (Unit!18251) )
))
(declare-fun lt!266395 () Unit!18250)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36704 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18250)

(assert (=> b!587425 (= lt!266395 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266394 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587425 (= lt!266394 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587426 () Bool)

(declare-fun res!375053 () Bool)

(assert (=> b!587426 (=> (not res!375053) (not e!335623))))

(assert (=> b!587426 (= res!375053 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17625 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17625 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53860 res!375062) b!587416))

(assert (= (and b!587416 res!375052) b!587423))

(assert (= (and b!587423 res!375054) b!587420))

(assert (= (and b!587420 res!375059) b!587419))

(assert (= (and b!587419 res!375056) b!587418))

(assert (= (and b!587418 res!375061) b!587417))

(assert (= (and b!587417 res!375057) b!587424))

(assert (= (and b!587424 res!375060) b!587426))

(assert (= (and b!587426 res!375053) b!587422))

(assert (= (and b!587422 res!375058) b!587421))

(assert (= (and b!587421 res!375055) b!587425))

(declare-fun m!565813 () Bool)

(assert (=> b!587419 m!565813))

(declare-fun m!565815 () Bool)

(assert (=> b!587421 m!565815))

(declare-fun m!565817 () Bool)

(assert (=> b!587421 m!565817))

(declare-fun m!565819 () Bool)

(assert (=> b!587418 m!565819))

(declare-fun m!565821 () Bool)

(assert (=> start!53860 m!565821))

(declare-fun m!565823 () Bool)

(assert (=> start!53860 m!565823))

(assert (=> b!587422 m!565817))

(assert (=> b!587422 m!565817))

(declare-fun m!565825 () Bool)

(assert (=> b!587422 m!565825))

(declare-fun m!565827 () Bool)

(assert (=> b!587417 m!565827))

(declare-fun m!565829 () Bool)

(assert (=> b!587420 m!565829))

(declare-fun m!565831 () Bool)

(assert (=> b!587426 m!565831))

(declare-fun m!565833 () Bool)

(assert (=> b!587426 m!565833))

(declare-fun m!565835 () Bool)

(assert (=> b!587426 m!565835))

(declare-fun m!565837 () Bool)

(assert (=> b!587425 m!565837))

(declare-fun m!565839 () Bool)

(assert (=> b!587425 m!565839))

(assert (=> b!587425 m!565817))

(declare-fun m!565841 () Bool)

(assert (=> b!587425 m!565841))

(assert (=> b!587425 m!565817))

(assert (=> b!587425 m!565833))

(assert (=> b!587425 m!565839))

(declare-fun m!565843 () Bool)

(assert (=> b!587425 m!565843))

(declare-fun m!565845 () Bool)

(assert (=> b!587425 m!565845))

(assert (=> b!587423 m!565817))

(assert (=> b!587423 m!565817))

(declare-fun m!565847 () Bool)

(assert (=> b!587423 m!565847))

(declare-fun m!565849 () Bool)

(assert (=> b!587424 m!565849))

(push 1)

(assert (not b!587419))

(assert (not b!587418))

(assert (not b!587422))

(assert (not b!587424))

(assert (not start!53860))

(assert (not b!587423))

(assert (not b!587425))

(assert (not b!587420))

