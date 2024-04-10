; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53914 () Bool)

(assert start!53914)

(declare-fun b!588307 () Bool)

(declare-fun res!375949 () Bool)

(declare-fun e!335961 () Bool)

(assert (=> b!588307 (=> (not res!375949) (not e!335961))))

(declare-datatypes ((array!36758 0))(
  ( (array!36759 (arr!17652 (Array (_ BitVec 32) (_ BitVec 64))) (size!18016 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36758)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588307 (= res!375949 (validKeyInArray!0 (select (arr!17652 a!2986) j!136)))))

(declare-fun b!588308 () Bool)

(declare-fun e!335964 () Bool)

(assert (=> b!588308 (= e!335964 (not true))))

(declare-fun e!335963 () Bool)

(assert (=> b!588308 e!335963))

(declare-fun res!375952 () Bool)

(assert (=> b!588308 (=> (not res!375952) (not e!335963))))

(declare-datatypes ((SeekEntryResult!6092 0))(
  ( (MissingZero!6092 (index!26598 (_ BitVec 32))) (Found!6092 (index!26599 (_ BitVec 32))) (Intermediate!6092 (undefined!6904 Bool) (index!26600 (_ BitVec 32)) (x!55402 (_ BitVec 32))) (Undefined!6092) (MissingVacant!6092 (index!26601 (_ BitVec 32))) )
))
(declare-fun lt!266733 () SeekEntryResult!6092)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!266732 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36758 (_ BitVec 32)) SeekEntryResult!6092)

(assert (=> b!588308 (= res!375952 (= lt!266733 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266732 vacantSpotIndex!68 (select (store (arr!17652 a!2986) i!1108 k!1786) j!136) (array!36759 (store (arr!17652 a!2986) i!1108 k!1786) (size!18016 a!2986)) mask!3053)))))

(assert (=> b!588308 (= lt!266733 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266732 vacantSpotIndex!68 (select (arr!17652 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18304 0))(
  ( (Unit!18305) )
))
(declare-fun lt!266731 () Unit!18304)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36758 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18304)

(assert (=> b!588308 (= lt!266731 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266732 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588308 (= lt!266732 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588309 () Bool)

(declare-fun e!335960 () Bool)

(assert (=> b!588309 (= e!335960 e!335964)))

(declare-fun res!375944 () Bool)

(assert (=> b!588309 (=> (not res!375944) (not e!335964))))

(declare-fun lt!266734 () SeekEntryResult!6092)

(assert (=> b!588309 (= res!375944 (and (= lt!266734 (Found!6092 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17652 a!2986) index!984) (select (arr!17652 a!2986) j!136))) (not (= (select (arr!17652 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588309 (= lt!266734 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17652 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588310 () Bool)

(declare-fun res!375950 () Bool)

(assert (=> b!588310 (=> (not res!375950) (not e!335961))))

(assert (=> b!588310 (= res!375950 (validKeyInArray!0 k!1786))))

(declare-fun b!588311 () Bool)

(declare-fun res!375943 () Bool)

(assert (=> b!588311 (=> (not res!375943) (not e!335960))))

(assert (=> b!588311 (= res!375943 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17652 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17652 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588312 () Bool)

(declare-fun res!375946 () Bool)

(assert (=> b!588312 (=> (not res!375946) (not e!335961))))

(declare-fun arrayContainsKey!0 (array!36758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588312 (= res!375946 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588313 () Bool)

(declare-fun res!375945 () Bool)

(assert (=> b!588313 (=> (not res!375945) (not e!335961))))

(assert (=> b!588313 (= res!375945 (and (= (size!18016 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18016 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18016 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588314 () Bool)

(declare-fun res!375948 () Bool)

(assert (=> b!588314 (=> (not res!375948) (not e!335960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36758 (_ BitVec 32)) Bool)

(assert (=> b!588314 (= res!375948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588315 () Bool)

(declare-fun res!375951 () Bool)

(assert (=> b!588315 (=> (not res!375951) (not e!335960))))

(declare-datatypes ((List!11693 0))(
  ( (Nil!11690) (Cons!11689 (h!12734 (_ BitVec 64)) (t!17921 List!11693)) )
))
(declare-fun arrayNoDuplicates!0 (array!36758 (_ BitVec 32) List!11693) Bool)

(assert (=> b!588315 (= res!375951 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11690))))

(declare-fun b!588316 () Bool)

(assert (=> b!588316 (= e!335961 e!335960)))

(declare-fun res!375953 () Bool)

(assert (=> b!588316 (=> (not res!375953) (not e!335960))))

(declare-fun lt!266730 () SeekEntryResult!6092)

(assert (=> b!588316 (= res!375953 (or (= lt!266730 (MissingZero!6092 i!1108)) (= lt!266730 (MissingVacant!6092 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36758 (_ BitVec 32)) SeekEntryResult!6092)

(assert (=> b!588316 (= lt!266730 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!375947 () Bool)

(assert (=> start!53914 (=> (not res!375947) (not e!335961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53914 (= res!375947 (validMask!0 mask!3053))))

(assert (=> start!53914 e!335961))

(assert (=> start!53914 true))

(declare-fun array_inv!13448 (array!36758) Bool)

(assert (=> start!53914 (array_inv!13448 a!2986)))

(declare-fun b!588317 () Bool)

(assert (=> b!588317 (= e!335963 (= lt!266734 lt!266733))))

(assert (= (and start!53914 res!375947) b!588313))

(assert (= (and b!588313 res!375945) b!588307))

(assert (= (and b!588307 res!375949) b!588310))

(assert (= (and b!588310 res!375950) b!588312))

(assert (= (and b!588312 res!375946) b!588316))

(assert (= (and b!588316 res!375953) b!588314))

(assert (= (and b!588314 res!375948) b!588315))

(assert (= (and b!588315 res!375951) b!588311))

(assert (= (and b!588311 res!375943) b!588309))

(assert (= (and b!588309 res!375944) b!588308))

(assert (= (and b!588308 res!375952) b!588317))

(declare-fun m!566839 () Bool)

(assert (=> b!588314 m!566839))

(declare-fun m!566841 () Bool)

(assert (=> b!588308 m!566841))

(declare-fun m!566843 () Bool)

(assert (=> b!588308 m!566843))

(declare-fun m!566845 () Bool)

(assert (=> b!588308 m!566845))

(declare-fun m!566847 () Bool)

(assert (=> b!588308 m!566847))

(assert (=> b!588308 m!566843))

(declare-fun m!566849 () Bool)

(assert (=> b!588308 m!566849))

(assert (=> b!588308 m!566845))

(declare-fun m!566851 () Bool)

(assert (=> b!588308 m!566851))

(declare-fun m!566853 () Bool)

(assert (=> b!588308 m!566853))

(declare-fun m!566855 () Bool)

(assert (=> b!588310 m!566855))

(assert (=> b!588307 m!566845))

(assert (=> b!588307 m!566845))

(declare-fun m!566857 () Bool)

(assert (=> b!588307 m!566857))

(declare-fun m!566859 () Bool)

(assert (=> start!53914 m!566859))

(declare-fun m!566861 () Bool)

(assert (=> start!53914 m!566861))

(declare-fun m!566863 () Bool)

(assert (=> b!588311 m!566863))

(assert (=> b!588311 m!566847))

(declare-fun m!566865 () Bool)

(assert (=> b!588311 m!566865))

(declare-fun m!566867 () Bool)

(assert (=> b!588316 m!566867))

(declare-fun m!566869 () Bool)

(assert (=> b!588309 m!566869))

(assert (=> b!588309 m!566845))

(assert (=> b!588309 m!566845))

(declare-fun m!566871 () Bool)

(assert (=> b!588309 m!566871))

(declare-fun m!566873 () Bool)

(assert (=> b!588312 m!566873))

(declare-fun m!566875 () Bool)

(assert (=> b!588315 m!566875))

(push 1)

