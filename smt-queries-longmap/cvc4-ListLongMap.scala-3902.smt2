; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53426 () Bool)

(assert start!53426)

(declare-fun b!581274 () Bool)

(declare-fun res!369094 () Bool)

(declare-fun e!333608 () Bool)

(assert (=> b!581274 (=> (not res!369094) (not e!333608))))

(declare-datatypes ((array!36327 0))(
  ( (array!36328 (arr!17438 (Array (_ BitVec 32) (_ BitVec 64))) (size!17802 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36327)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581274 (= res!369094 (validKeyInArray!0 (select (arr!17438 a!2986) j!136)))))

(declare-fun res!369095 () Bool)

(assert (=> start!53426 (=> (not res!369095) (not e!333608))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53426 (= res!369095 (validMask!0 mask!3053))))

(assert (=> start!53426 e!333608))

(assert (=> start!53426 true))

(declare-fun array_inv!13234 (array!36327) Bool)

(assert (=> start!53426 (array_inv!13234 a!2986)))

(declare-fun b!581275 () Bool)

(declare-fun e!333607 () Bool)

(assert (=> b!581275 (= e!333607 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5878 0))(
  ( (MissingZero!5878 (index!25739 (_ BitVec 32))) (Found!5878 (index!25740 (_ BitVec 32))) (Intermediate!5878 (undefined!6690 Bool) (index!25741 (_ BitVec 32)) (x!54603 (_ BitVec 32))) (Undefined!5878) (MissingVacant!5878 (index!25742 (_ BitVec 32))) )
))
(declare-fun lt!264879 () SeekEntryResult!5878)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36327 (_ BitVec 32)) SeekEntryResult!5878)

(assert (=> b!581275 (= lt!264879 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17438 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581276 () Bool)

(declare-fun res!369093 () Bool)

(assert (=> b!581276 (=> (not res!369093) (not e!333608))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!581276 (= res!369093 (validKeyInArray!0 k!1786))))

(declare-fun b!581277 () Bool)

(declare-fun res!369091 () Bool)

(assert (=> b!581277 (=> (not res!369091) (not e!333607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36327 (_ BitVec 32)) Bool)

(assert (=> b!581277 (= res!369091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581278 () Bool)

(assert (=> b!581278 (= e!333608 e!333607)))

(declare-fun res!369097 () Bool)

(assert (=> b!581278 (=> (not res!369097) (not e!333607))))

(declare-fun lt!264880 () SeekEntryResult!5878)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581278 (= res!369097 (or (= lt!264880 (MissingZero!5878 i!1108)) (= lt!264880 (MissingVacant!5878 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36327 (_ BitVec 32)) SeekEntryResult!5878)

(assert (=> b!581278 (= lt!264880 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581279 () Bool)

(declare-fun res!369098 () Bool)

(assert (=> b!581279 (=> (not res!369098) (not e!333607))))

(declare-datatypes ((List!11479 0))(
  ( (Nil!11476) (Cons!11475 (h!12520 (_ BitVec 64)) (t!17707 List!11479)) )
))
(declare-fun arrayNoDuplicates!0 (array!36327 (_ BitVec 32) List!11479) Bool)

(assert (=> b!581279 (= res!369098 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11476))))

(declare-fun b!581280 () Bool)

(declare-fun res!369092 () Bool)

(assert (=> b!581280 (=> (not res!369092) (not e!333608))))

(declare-fun arrayContainsKey!0 (array!36327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581280 (= res!369092 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581281 () Bool)

(declare-fun res!369096 () Bool)

(assert (=> b!581281 (=> (not res!369096) (not e!333608))))

(assert (=> b!581281 (= res!369096 (and (= (size!17802 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17802 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17802 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581282 () Bool)

(declare-fun res!369090 () Bool)

(assert (=> b!581282 (=> (not res!369090) (not e!333607))))

(assert (=> b!581282 (= res!369090 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17438 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17438 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53426 res!369095) b!581281))

(assert (= (and b!581281 res!369096) b!581274))

(assert (= (and b!581274 res!369094) b!581276))

(assert (= (and b!581276 res!369093) b!581280))

(assert (= (and b!581280 res!369092) b!581278))

(assert (= (and b!581278 res!369097) b!581277))

(assert (= (and b!581277 res!369091) b!581279))

(assert (= (and b!581279 res!369098) b!581282))

(assert (= (and b!581282 res!369090) b!581275))

(declare-fun m!559823 () Bool)

(assert (=> b!581274 m!559823))

(assert (=> b!581274 m!559823))

(declare-fun m!559825 () Bool)

(assert (=> b!581274 m!559825))

(declare-fun m!559827 () Bool)

(assert (=> start!53426 m!559827))

(declare-fun m!559829 () Bool)

(assert (=> start!53426 m!559829))

(declare-fun m!559831 () Bool)

(assert (=> b!581279 m!559831))

(declare-fun m!559833 () Bool)

(assert (=> b!581276 m!559833))

(declare-fun m!559835 () Bool)

(assert (=> b!581278 m!559835))

(declare-fun m!559837 () Bool)

(assert (=> b!581280 m!559837))

(declare-fun m!559839 () Bool)

(assert (=> b!581277 m!559839))

(declare-fun m!559841 () Bool)

(assert (=> b!581282 m!559841))

(declare-fun m!559843 () Bool)

(assert (=> b!581282 m!559843))

(declare-fun m!559845 () Bool)

(assert (=> b!581282 m!559845))

(assert (=> b!581275 m!559823))

(assert (=> b!581275 m!559823))

(declare-fun m!559847 () Bool)

(assert (=> b!581275 m!559847))

(push 1)

