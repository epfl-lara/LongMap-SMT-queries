; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53888 () Bool)

(assert start!53888)

(declare-fun b!587878 () Bool)

(declare-fun res!375519 () Bool)

(declare-fun e!335765 () Bool)

(assert (=> b!587878 (=> (not res!375519) (not e!335765))))

(declare-datatypes ((array!36732 0))(
  ( (array!36733 (arr!17639 (Array (_ BitVec 32) (_ BitVec 64))) (size!18003 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36732)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587878 (= res!375519 (validKeyInArray!0 (select (arr!17639 a!2986) j!136)))))

(declare-fun b!587879 () Bool)

(declare-fun res!375522 () Bool)

(assert (=> b!587879 (=> (not res!375522) (not e!335765))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587879 (= res!375522 (and (= (size!18003 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18003 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18003 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587880 () Bool)

(declare-fun e!335768 () Bool)

(declare-datatypes ((SeekEntryResult!6079 0))(
  ( (MissingZero!6079 (index!26546 (_ BitVec 32))) (Found!6079 (index!26547 (_ BitVec 32))) (Intermediate!6079 (undefined!6891 Bool) (index!26548 (_ BitVec 32)) (x!55349 (_ BitVec 32))) (Undefined!6079) (MissingVacant!6079 (index!26549 (_ BitVec 32))) )
))
(declare-fun lt!266537 () SeekEntryResult!6079)

(declare-fun lt!266536 () SeekEntryResult!6079)

(assert (=> b!587880 (= e!335768 (= lt!266537 lt!266536))))

(declare-fun b!587881 () Bool)

(declare-fun e!335767 () Bool)

(assert (=> b!587881 (= e!335765 e!335767)))

(declare-fun res!375523 () Bool)

(assert (=> b!587881 (=> (not res!375523) (not e!335767))))

(declare-fun lt!266539 () SeekEntryResult!6079)

(assert (=> b!587881 (= res!375523 (or (= lt!266539 (MissingZero!6079 i!1108)) (= lt!266539 (MissingVacant!6079 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36732 (_ BitVec 32)) SeekEntryResult!6079)

(assert (=> b!587881 (= lt!266539 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!587882 () Bool)

(declare-fun res!375517 () Bool)

(assert (=> b!587882 (=> (not res!375517) (not e!335767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36732 (_ BitVec 32)) Bool)

(assert (=> b!587882 (= res!375517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587883 () Bool)

(declare-fun res!375515 () Bool)

(assert (=> b!587883 (=> (not res!375515) (not e!335767))))

(declare-datatypes ((List!11680 0))(
  ( (Nil!11677) (Cons!11676 (h!12721 (_ BitVec 64)) (t!17908 List!11680)) )
))
(declare-fun arrayNoDuplicates!0 (array!36732 (_ BitVec 32) List!11680) Bool)

(assert (=> b!587883 (= res!375515 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11677))))

(declare-fun b!587884 () Bool)

(declare-fun res!375514 () Bool)

(assert (=> b!587884 (=> (not res!375514) (not e!335767))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!587884 (= res!375514 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17639 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17639 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587885 () Bool)

(declare-fun res!375516 () Bool)

(assert (=> b!587885 (=> (not res!375516) (not e!335765))))

(assert (=> b!587885 (= res!375516 (validKeyInArray!0 k!1786))))

(declare-fun res!375518 () Bool)

(assert (=> start!53888 (=> (not res!375518) (not e!335765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53888 (= res!375518 (validMask!0 mask!3053))))

(assert (=> start!53888 e!335765))

(assert (=> start!53888 true))

(declare-fun array_inv!13435 (array!36732) Bool)

(assert (=> start!53888 (array_inv!13435 a!2986)))

(declare-fun b!587886 () Bool)

(declare-fun res!375520 () Bool)

(assert (=> b!587886 (=> (not res!375520) (not e!335765))))

(declare-fun arrayContainsKey!0 (array!36732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587886 (= res!375520 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587887 () Bool)

(declare-fun e!335769 () Bool)

(assert (=> b!587887 (= e!335767 e!335769)))

(declare-fun res!375521 () Bool)

(assert (=> b!587887 (=> (not res!375521) (not e!335769))))

(assert (=> b!587887 (= res!375521 (and (= lt!266537 (Found!6079 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17639 a!2986) index!984) (select (arr!17639 a!2986) j!136))) (not (= (select (arr!17639 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36732 (_ BitVec 32)) SeekEntryResult!6079)

(assert (=> b!587887 (= lt!266537 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17639 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587888 () Bool)

(assert (=> b!587888 (= e!335769 (not true))))

(assert (=> b!587888 e!335768))

(declare-fun res!375524 () Bool)

(assert (=> b!587888 (=> (not res!375524) (not e!335768))))

(declare-fun lt!266535 () (_ BitVec 32))

(assert (=> b!587888 (= res!375524 (= lt!266536 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266535 vacantSpotIndex!68 (select (store (arr!17639 a!2986) i!1108 k!1786) j!136) (array!36733 (store (arr!17639 a!2986) i!1108 k!1786) (size!18003 a!2986)) mask!3053)))))

(assert (=> b!587888 (= lt!266536 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266535 vacantSpotIndex!68 (select (arr!17639 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18278 0))(
  ( (Unit!18279) )
))
(declare-fun lt!266538 () Unit!18278)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36732 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18278)

(assert (=> b!587888 (= lt!266538 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266535 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587888 (= lt!266535 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!53888 res!375518) b!587879))

(assert (= (and b!587879 res!375522) b!587878))

(assert (= (and b!587878 res!375519) b!587885))

(assert (= (and b!587885 res!375516) b!587886))

(assert (= (and b!587886 res!375520) b!587881))

(assert (= (and b!587881 res!375523) b!587882))

(assert (= (and b!587882 res!375517) b!587883))

(assert (= (and b!587883 res!375515) b!587884))

(assert (= (and b!587884 res!375514) b!587887))

(assert (= (and b!587887 res!375521) b!587888))

(assert (= (and b!587888 res!375524) b!587880))

(declare-fun m!566345 () Bool)

(assert (=> start!53888 m!566345))

(declare-fun m!566347 () Bool)

(assert (=> start!53888 m!566347))

(declare-fun m!566349 () Bool)

(assert (=> b!587881 m!566349))

(declare-fun m!566351 () Bool)

(assert (=> b!587885 m!566351))

(declare-fun m!566353 () Bool)

(assert (=> b!587883 m!566353))

(declare-fun m!566355 () Bool)

(assert (=> b!587888 m!566355))

(declare-fun m!566357 () Bool)

(assert (=> b!587888 m!566357))

(declare-fun m!566359 () Bool)

(assert (=> b!587888 m!566359))

(declare-fun m!566361 () Bool)

(assert (=> b!587888 m!566361))

(assert (=> b!587888 m!566359))

(declare-fun m!566363 () Bool)

(assert (=> b!587888 m!566363))

(assert (=> b!587888 m!566357))

(declare-fun m!566365 () Bool)

(assert (=> b!587888 m!566365))

(declare-fun m!566367 () Bool)

(assert (=> b!587888 m!566367))

(declare-fun m!566369 () Bool)

(assert (=> b!587882 m!566369))

(assert (=> b!587878 m!566359))

(assert (=> b!587878 m!566359))

(declare-fun m!566371 () Bool)

(assert (=> b!587878 m!566371))

(declare-fun m!566373 () Bool)

(assert (=> b!587886 m!566373))

(declare-fun m!566375 () Bool)

(assert (=> b!587887 m!566375))

(assert (=> b!587887 m!566359))

(assert (=> b!587887 m!566359))

(declare-fun m!566377 () Bool)

(assert (=> b!587887 m!566377))

(declare-fun m!566379 () Bool)

(assert (=> b!587884 m!566379))

(assert (=> b!587884 m!566361))

(declare-fun m!566381 () Bool)

(assert (=> b!587884 m!566381))

(push 1)

