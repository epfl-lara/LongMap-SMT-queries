; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56290 () Bool)

(assert start!56290)

(declare-fun b!624090 () Bool)

(declare-fun res!402257 () Bool)

(declare-fun e!357941 () Bool)

(assert (=> b!624090 (=> (not res!402257) (not e!357941))))

(declare-datatypes ((array!37715 0))(
  ( (array!37716 (arr!18102 (Array (_ BitVec 32) (_ BitVec 64))) (size!18466 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37715)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624090 (= res!402257 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624091 () Bool)

(declare-fun e!357940 () Bool)

(declare-fun e!357939 () Bool)

(assert (=> b!624091 (= e!357940 e!357939)))

(declare-fun res!402266 () Bool)

(assert (=> b!624091 (=> (not res!402266) (not e!357939))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!624091 (= res!402266 (= (select (store (arr!18102 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!289491 () array!37715)

(assert (=> b!624091 (= lt!289491 (array!37716 (store (arr!18102 a!2986) i!1108 k!1786) (size!18466 a!2986)))))

(declare-fun res!402263 () Bool)

(assert (=> start!56290 (=> (not res!402263) (not e!357941))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56290 (= res!402263 (validMask!0 mask!3053))))

(assert (=> start!56290 e!357941))

(assert (=> start!56290 true))

(declare-fun array_inv!13898 (array!37715) Bool)

(assert (=> start!56290 (array_inv!13898 a!2986)))

(declare-fun b!624092 () Bool)

(declare-fun res!402258 () Bool)

(assert (=> b!624092 (=> (not res!402258) (not e!357940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37715 (_ BitVec 32)) Bool)

(assert (=> b!624092 (= res!402258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624093 () Bool)

(declare-fun res!402261 () Bool)

(assert (=> b!624093 (=> (not res!402261) (not e!357940))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624093 (= res!402261 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18102 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624094 () Bool)

(declare-fun e!357937 () Bool)

(declare-fun e!357942 () Bool)

(assert (=> b!624094 (= e!357937 (not e!357942))))

(declare-fun res!402256 () Bool)

(assert (=> b!624094 (=> res!402256 e!357942)))

(declare-datatypes ((SeekEntryResult!6542 0))(
  ( (MissingZero!6542 (index!28452 (_ BitVec 32))) (Found!6542 (index!28453 (_ BitVec 32))) (Intermediate!6542 (undefined!7354 Bool) (index!28454 (_ BitVec 32)) (x!57217 (_ BitVec 32))) (Undefined!6542) (MissingVacant!6542 (index!28455 (_ BitVec 32))) )
))
(declare-fun lt!289492 () SeekEntryResult!6542)

(assert (=> b!624094 (= res!402256 (not (= lt!289492 (Found!6542 index!984))))))

(declare-datatypes ((Unit!21076 0))(
  ( (Unit!21077) )
))
(declare-fun lt!289488 () Unit!21076)

(declare-fun e!357936 () Unit!21076)

(assert (=> b!624094 (= lt!289488 e!357936)))

(declare-fun c!71285 () Bool)

(assert (=> b!624094 (= c!71285 (= lt!289492 Undefined!6542))))

(declare-fun lt!289490 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37715 (_ BitVec 32)) SeekEntryResult!6542)

(assert (=> b!624094 (= lt!289492 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!289490 lt!289491 mask!3053))))

(declare-fun e!357935 () Bool)

(assert (=> b!624094 e!357935))

(declare-fun res!402265 () Bool)

(assert (=> b!624094 (=> (not res!402265) (not e!357935))))

(declare-fun lt!289494 () SeekEntryResult!6542)

(declare-fun lt!289489 () (_ BitVec 32))

(assert (=> b!624094 (= res!402265 (= lt!289494 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289489 vacantSpotIndex!68 lt!289490 lt!289491 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624094 (= lt!289494 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289489 vacantSpotIndex!68 (select (arr!18102 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!624094 (= lt!289490 (select (store (arr!18102 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!289487 () Unit!21076)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37715 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21076)

(assert (=> b!624094 (= lt!289487 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!289489 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!624094 (= lt!289489 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!624095 () Bool)

(declare-fun res!402260 () Bool)

(assert (=> b!624095 (=> (not res!402260) (not e!357941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624095 (= res!402260 (validKeyInArray!0 k!1786))))

(declare-fun b!624096 () Bool)

(declare-fun res!402264 () Bool)

(assert (=> b!624096 (=> (not res!402264) (not e!357940))))

(declare-datatypes ((List!12143 0))(
  ( (Nil!12140) (Cons!12139 (h!13184 (_ BitVec 64)) (t!18371 List!12143)) )
))
(declare-fun arrayNoDuplicates!0 (array!37715 (_ BitVec 32) List!12143) Bool)

(assert (=> b!624096 (= res!402264 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12140))))

(declare-fun b!624097 () Bool)

(assert (=> b!624097 (= e!357939 e!357937)))

(declare-fun res!402255 () Bool)

(assert (=> b!624097 (=> (not res!402255) (not e!357937))))

(declare-fun lt!289493 () SeekEntryResult!6542)

(assert (=> b!624097 (= res!402255 (and (= lt!289493 (Found!6542 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18102 a!2986) index!984) (select (arr!18102 a!2986) j!136))) (not (= (select (arr!18102 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!624097 (= lt!289493 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18102 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624098 () Bool)

(assert (=> b!624098 (= e!357942 (or (not (= (select (arr!18102 a!2986) j!136) lt!289490)) (= (select (arr!18102 a!2986) j!136) (select (store (arr!18102 a!2986) i!1108 k!1786) index!984))))))

(assert (=> b!624098 (= (select (store (arr!18102 a!2986) i!1108 k!1786) index!984) (select (arr!18102 a!2986) j!136))))

(declare-fun b!624099 () Bool)

(assert (=> b!624099 (= e!357941 e!357940)))

(declare-fun res!402254 () Bool)

(assert (=> b!624099 (=> (not res!402254) (not e!357940))))

(declare-fun lt!289495 () SeekEntryResult!6542)

(assert (=> b!624099 (= res!402254 (or (= lt!289495 (MissingZero!6542 i!1108)) (= lt!289495 (MissingVacant!6542 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37715 (_ BitVec 32)) SeekEntryResult!6542)

(assert (=> b!624099 (= lt!289495 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!624100 () Bool)

(declare-fun Unit!21078 () Unit!21076)

(assert (=> b!624100 (= e!357936 Unit!21078)))

(assert (=> b!624100 false))

(declare-fun b!624101 () Bool)

(declare-fun res!402262 () Bool)

(assert (=> b!624101 (=> (not res!402262) (not e!357941))))

(assert (=> b!624101 (= res!402262 (and (= (size!18466 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18466 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18466 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624102 () Bool)

(declare-fun Unit!21079 () Unit!21076)

(assert (=> b!624102 (= e!357936 Unit!21079)))

(declare-fun b!624103 () Bool)

(assert (=> b!624103 (= e!357935 (= lt!289493 lt!289494))))

(declare-fun b!624104 () Bool)

(declare-fun res!402259 () Bool)

(assert (=> b!624104 (=> (not res!402259) (not e!357941))))

(assert (=> b!624104 (= res!402259 (validKeyInArray!0 (select (arr!18102 a!2986) j!136)))))

(assert (= (and start!56290 res!402263) b!624101))

(assert (= (and b!624101 res!402262) b!624104))

(assert (= (and b!624104 res!402259) b!624095))

(assert (= (and b!624095 res!402260) b!624090))

(assert (= (and b!624090 res!402257) b!624099))

(assert (= (and b!624099 res!402254) b!624092))

(assert (= (and b!624092 res!402258) b!624096))

(assert (= (and b!624096 res!402264) b!624093))

(assert (= (and b!624093 res!402261) b!624091))

(assert (= (and b!624091 res!402266) b!624097))

(assert (= (and b!624097 res!402255) b!624094))

(assert (= (and b!624094 res!402265) b!624103))

(assert (= (and b!624094 c!71285) b!624100))

(assert (= (and b!624094 (not c!71285)) b!624102))

(assert (= (and b!624094 (not res!402256)) b!624098))

(declare-fun m!599831 () Bool)

(assert (=> b!624096 m!599831))

(declare-fun m!599833 () Bool)

(assert (=> b!624098 m!599833))

(declare-fun m!599835 () Bool)

(assert (=> b!624098 m!599835))

(declare-fun m!599837 () Bool)

(assert (=> b!624098 m!599837))

(declare-fun m!599839 () Bool)

(assert (=> start!56290 m!599839))

(declare-fun m!599841 () Bool)

(assert (=> start!56290 m!599841))

(assert (=> b!624091 m!599835))

(declare-fun m!599843 () Bool)

(assert (=> b!624091 m!599843))

(assert (=> b!624104 m!599833))

(assert (=> b!624104 m!599833))

(declare-fun m!599845 () Bool)

(assert (=> b!624104 m!599845))

(declare-fun m!599847 () Bool)

(assert (=> b!624094 m!599847))

(declare-fun m!599849 () Bool)

(assert (=> b!624094 m!599849))

(assert (=> b!624094 m!599833))

(assert (=> b!624094 m!599833))

(declare-fun m!599851 () Bool)

(assert (=> b!624094 m!599851))

(assert (=> b!624094 m!599835))

(declare-fun m!599853 () Bool)

(assert (=> b!624094 m!599853))

(declare-fun m!599855 () Bool)

(assert (=> b!624094 m!599855))

(declare-fun m!599857 () Bool)

(assert (=> b!624094 m!599857))

(declare-fun m!599859 () Bool)

(assert (=> b!624092 m!599859))

(declare-fun m!599861 () Bool)

(assert (=> b!624097 m!599861))

(assert (=> b!624097 m!599833))

(assert (=> b!624097 m!599833))

(declare-fun m!599863 () Bool)

(assert (=> b!624097 m!599863))

(declare-fun m!599865 () Bool)

(assert (=> b!624099 m!599865))

(declare-fun m!599867 () Bool)

(assert (=> b!624093 m!599867))

(declare-fun m!599869 () Bool)

(assert (=> b!624090 m!599869))

(declare-fun m!599871 () Bool)

(assert (=> b!624095 m!599871))

(push 1)

