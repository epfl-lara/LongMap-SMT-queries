; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53348 () Bool)

(assert start!53348)

(declare-fun res!368031 () Bool)

(declare-fun e!333256 () Bool)

(assert (=> start!53348 (=> (not res!368031) (not e!333256))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53348 (= res!368031 (validMask!0 mask!3053))))

(assert (=> start!53348 e!333256))

(assert (=> start!53348 true))

(declare-datatypes ((array!36249 0))(
  ( (array!36250 (arr!17399 (Array (_ BitVec 32) (_ BitVec 64))) (size!17763 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36249)

(declare-fun array_inv!13195 (array!36249) Bool)

(assert (=> start!53348 (array_inv!13195 a!2986)))

(declare-fun b!580212 () Bool)

(declare-fun res!368032 () Bool)

(assert (=> b!580212 (=> (not res!368032) (not e!333256))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580212 (= res!368032 (and (= (size!17763 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17763 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17763 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580213 () Bool)

(declare-fun res!368030 () Bool)

(declare-fun e!333257 () Bool)

(assert (=> b!580213 (=> (not res!368030) (not e!333257))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580213 (= res!368030 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17399 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17399 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580214 () Bool)

(declare-fun res!368035 () Bool)

(assert (=> b!580214 (=> (not res!368035) (not e!333256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580214 (= res!368035 (validKeyInArray!0 (select (arr!17399 a!2986) j!136)))))

(declare-fun b!580215 () Bool)

(declare-fun res!368028 () Bool)

(assert (=> b!580215 (=> (not res!368028) (not e!333257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36249 (_ BitVec 32)) Bool)

(assert (=> b!580215 (= res!368028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580216 () Bool)

(declare-fun res!368036 () Bool)

(assert (=> b!580216 (=> (not res!368036) (not e!333256))))

(declare-fun arrayContainsKey!0 (array!36249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580216 (= res!368036 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580217 () Bool)

(assert (=> b!580217 (= e!333256 e!333257)))

(declare-fun res!368033 () Bool)

(assert (=> b!580217 (=> (not res!368033) (not e!333257))))

(declare-datatypes ((SeekEntryResult!5839 0))(
  ( (MissingZero!5839 (index!25583 (_ BitVec 32))) (Found!5839 (index!25584 (_ BitVec 32))) (Intermediate!5839 (undefined!6651 Bool) (index!25585 (_ BitVec 32)) (x!54460 (_ BitVec 32))) (Undefined!5839) (MissingVacant!5839 (index!25586 (_ BitVec 32))) )
))
(declare-fun lt!264654 () SeekEntryResult!5839)

(assert (=> b!580217 (= res!368033 (or (= lt!264654 (MissingZero!5839 i!1108)) (= lt!264654 (MissingVacant!5839 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36249 (_ BitVec 32)) SeekEntryResult!5839)

(assert (=> b!580217 (= lt!264654 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580218 () Bool)

(declare-fun res!368029 () Bool)

(assert (=> b!580218 (=> (not res!368029) (not e!333257))))

(declare-datatypes ((List!11440 0))(
  ( (Nil!11437) (Cons!11436 (h!12481 (_ BitVec 64)) (t!17668 List!11440)) )
))
(declare-fun arrayNoDuplicates!0 (array!36249 (_ BitVec 32) List!11440) Bool)

(assert (=> b!580218 (= res!368029 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11437))))

(declare-fun b!580219 () Bool)

(assert (=> b!580219 (= e!333257 false)))

(declare-fun lt!264655 () SeekEntryResult!5839)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36249 (_ BitVec 32)) SeekEntryResult!5839)

(assert (=> b!580219 (= lt!264655 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17399 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580220 () Bool)

(declare-fun res!368034 () Bool)

(assert (=> b!580220 (=> (not res!368034) (not e!333256))))

(assert (=> b!580220 (= res!368034 (validKeyInArray!0 k!1786))))

(assert (= (and start!53348 res!368031) b!580212))

(assert (= (and b!580212 res!368032) b!580214))

(assert (= (and b!580214 res!368035) b!580220))

(assert (= (and b!580220 res!368034) b!580216))

(assert (= (and b!580216 res!368036) b!580217))

(assert (= (and b!580217 res!368033) b!580215))

(assert (= (and b!580215 res!368028) b!580218))

(assert (= (and b!580218 res!368029) b!580213))

(assert (= (and b!580213 res!368030) b!580219))

(declare-fun m!558803 () Bool)

(assert (=> b!580218 m!558803))

(declare-fun m!558805 () Bool)

(assert (=> b!580219 m!558805))

(assert (=> b!580219 m!558805))

(declare-fun m!558807 () Bool)

(assert (=> b!580219 m!558807))

(declare-fun m!558809 () Bool)

(assert (=> b!580217 m!558809))

(declare-fun m!558811 () Bool)

(assert (=> b!580220 m!558811))

(declare-fun m!558813 () Bool)

(assert (=> b!580215 m!558813))

(declare-fun m!558815 () Bool)

(assert (=> b!580216 m!558815))

(assert (=> b!580214 m!558805))

(assert (=> b!580214 m!558805))

(declare-fun m!558817 () Bool)

(assert (=> b!580214 m!558817))

(declare-fun m!558819 () Bool)

(assert (=> start!53348 m!558819))

(declare-fun m!558821 () Bool)

(assert (=> start!53348 m!558821))

(declare-fun m!558823 () Bool)

(assert (=> b!580213 m!558823))

(declare-fun m!558825 () Bool)

(assert (=> b!580213 m!558825))

(declare-fun m!558827 () Bool)

(assert (=> b!580213 m!558827))

(push 1)

(assert (not b!580220))

(assert (not b!580215))

(assert (not start!53348))

(assert (not b!580218))

(assert (not b!580219))

(assert (not b!580216))

(assert (not b!580217))

(assert (not b!580214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

