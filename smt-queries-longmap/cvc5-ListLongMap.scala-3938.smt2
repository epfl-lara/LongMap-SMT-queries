; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53638 () Bool)

(assert start!53638)

(declare-fun b!584394 () Bool)

(declare-fun res!372215 () Bool)

(declare-fun e!334637 () Bool)

(assert (=> b!584394 (=> (not res!372215) (not e!334637))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36539 0))(
  ( (array!36540 (arr!17544 (Array (_ BitVec 32) (_ BitVec 64))) (size!17908 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36539)

(assert (=> b!584394 (= res!372215 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17544 a!2986) index!984) (select (arr!17544 a!2986) j!136))) (not (= (select (arr!17544 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584395 () Bool)

(declare-fun res!372219 () Bool)

(declare-fun e!334636 () Bool)

(assert (=> b!584395 (=> (not res!372219) (not e!334636))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584395 (= res!372219 (validKeyInArray!0 k!1786))))

(declare-fun b!584396 () Bool)

(declare-fun res!372217 () Bool)

(assert (=> b!584396 (=> (not res!372217) (not e!334636))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584396 (= res!372217 (and (= (size!17908 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17908 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17908 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584397 () Bool)

(declare-fun res!372213 () Bool)

(assert (=> b!584397 (=> (not res!372213) (not e!334636))))

(assert (=> b!584397 (= res!372213 (validKeyInArray!0 (select (arr!17544 a!2986) j!136)))))

(declare-fun b!584398 () Bool)

(declare-fun e!334638 () Bool)

(assert (=> b!584398 (= e!334638 false)))

(declare-datatypes ((SeekEntryResult!5984 0))(
  ( (MissingZero!5984 (index!26163 (_ BitVec 32))) (Found!5984 (index!26164 (_ BitVec 32))) (Intermediate!5984 (undefined!6796 Bool) (index!26165 (_ BitVec 32)) (x!54997 (_ BitVec 32))) (Undefined!5984) (MissingVacant!5984 (index!26166 (_ BitVec 32))) )
))
(declare-fun lt!265562 () SeekEntryResult!5984)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!265563 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36539 (_ BitVec 32)) SeekEntryResult!5984)

(assert (=> b!584398 (= lt!265562 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265563 vacantSpotIndex!68 (select (arr!17544 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584399 () Bool)

(assert (=> b!584399 (= e!334637 e!334638)))

(declare-fun res!372214 () Bool)

(assert (=> b!584399 (=> (not res!372214) (not e!334638))))

(assert (=> b!584399 (= res!372214 (and (bvsge lt!265563 #b00000000000000000000000000000000) (bvslt lt!265563 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584399 (= lt!265563 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584400 () Bool)

(declare-fun res!372216 () Bool)

(assert (=> b!584400 (=> (not res!372216) (not e!334637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36539 (_ BitVec 32)) Bool)

(assert (=> b!584400 (= res!372216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584402 () Bool)

(declare-fun res!372211 () Bool)

(assert (=> b!584402 (=> (not res!372211) (not e!334637))))

(declare-datatypes ((List!11585 0))(
  ( (Nil!11582) (Cons!11581 (h!12626 (_ BitVec 64)) (t!17813 List!11585)) )
))
(declare-fun arrayNoDuplicates!0 (array!36539 (_ BitVec 32) List!11585) Bool)

(assert (=> b!584402 (= res!372211 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11582))))

(declare-fun b!584403 () Bool)

(assert (=> b!584403 (= e!334636 e!334637)))

(declare-fun res!372221 () Bool)

(assert (=> b!584403 (=> (not res!372221) (not e!334637))))

(declare-fun lt!265564 () SeekEntryResult!5984)

(assert (=> b!584403 (= res!372221 (or (= lt!265564 (MissingZero!5984 i!1108)) (= lt!265564 (MissingVacant!5984 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36539 (_ BitVec 32)) SeekEntryResult!5984)

(assert (=> b!584403 (= lt!265564 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!584404 () Bool)

(declare-fun res!372220 () Bool)

(assert (=> b!584404 (=> (not res!372220) (not e!334637))))

(assert (=> b!584404 (= res!372220 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17544 a!2986) j!136) a!2986 mask!3053) (Found!5984 j!136)))))

(declare-fun b!584405 () Bool)

(declare-fun res!372218 () Bool)

(assert (=> b!584405 (=> (not res!372218) (not e!334636))))

(declare-fun arrayContainsKey!0 (array!36539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584405 (= res!372218 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!372212 () Bool)

(assert (=> start!53638 (=> (not res!372212) (not e!334636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53638 (= res!372212 (validMask!0 mask!3053))))

(assert (=> start!53638 e!334636))

(assert (=> start!53638 true))

(declare-fun array_inv!13340 (array!36539) Bool)

(assert (=> start!53638 (array_inv!13340 a!2986)))

(declare-fun b!584401 () Bool)

(declare-fun res!372210 () Bool)

(assert (=> b!584401 (=> (not res!372210) (not e!334637))))

(assert (=> b!584401 (= res!372210 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17544 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17544 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53638 res!372212) b!584396))

(assert (= (and b!584396 res!372217) b!584397))

(assert (= (and b!584397 res!372213) b!584395))

(assert (= (and b!584395 res!372219) b!584405))

(assert (= (and b!584405 res!372218) b!584403))

(assert (= (and b!584403 res!372221) b!584400))

(assert (= (and b!584400 res!372216) b!584402))

(assert (= (and b!584402 res!372211) b!584401))

(assert (= (and b!584401 res!372210) b!584404))

(assert (= (and b!584404 res!372220) b!584394))

(assert (= (and b!584394 res!372215) b!584399))

(assert (= (and b!584399 res!372214) b!584398))

(declare-fun m!562753 () Bool)

(assert (=> b!584400 m!562753))

(declare-fun m!562755 () Bool)

(assert (=> b!584399 m!562755))

(declare-fun m!562757 () Bool)

(assert (=> start!53638 m!562757))

(declare-fun m!562759 () Bool)

(assert (=> start!53638 m!562759))

(declare-fun m!562761 () Bool)

(assert (=> b!584402 m!562761))

(declare-fun m!562763 () Bool)

(assert (=> b!584403 m!562763))

(declare-fun m!562765 () Bool)

(assert (=> b!584404 m!562765))

(assert (=> b!584404 m!562765))

(declare-fun m!562767 () Bool)

(assert (=> b!584404 m!562767))

(declare-fun m!562769 () Bool)

(assert (=> b!584394 m!562769))

(assert (=> b!584394 m!562765))

(declare-fun m!562771 () Bool)

(assert (=> b!584395 m!562771))

(assert (=> b!584398 m!562765))

(assert (=> b!584398 m!562765))

(declare-fun m!562773 () Bool)

(assert (=> b!584398 m!562773))

(assert (=> b!584397 m!562765))

(assert (=> b!584397 m!562765))

(declare-fun m!562775 () Bool)

(assert (=> b!584397 m!562775))

(declare-fun m!562777 () Bool)

(assert (=> b!584405 m!562777))

(declare-fun m!562779 () Bool)

(assert (=> b!584401 m!562779))

(declare-fun m!562781 () Bool)

(assert (=> b!584401 m!562781))

(declare-fun m!562783 () Bool)

(assert (=> b!584401 m!562783))

(push 1)

