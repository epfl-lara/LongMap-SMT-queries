; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56288 () Bool)

(assert start!56288)

(declare-fun b!624045 () Bool)

(declare-fun res!402226 () Bool)

(declare-fun e!357917 () Bool)

(assert (=> b!624045 (=> (not res!402226) (not e!357917))))

(declare-datatypes ((array!37713 0))(
  ( (array!37714 (arr!18101 (Array (_ BitVec 32) (_ BitVec 64))) (size!18465 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37713)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37713 (_ BitVec 32)) Bool)

(assert (=> b!624045 (= res!402226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624046 () Bool)

(declare-fun e!357918 () Bool)

(assert (=> b!624046 (= e!357917 e!357918)))

(declare-fun res!402218 () Bool)

(assert (=> b!624046 (=> (not res!402218) (not e!357918))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!624046 (= res!402218 (= (select (store (arr!18101 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!289468 () array!37713)

(assert (=> b!624046 (= lt!289468 (array!37714 (store (arr!18101 a!2986) i!1108 k!1786) (size!18465 a!2986)))))

(declare-fun b!624048 () Bool)

(declare-fun e!357914 () Bool)

(declare-fun e!357912 () Bool)

(assert (=> b!624048 (= e!357914 (not e!357912))))

(declare-fun res!402227 () Bool)

(assert (=> b!624048 (=> res!402227 e!357912)))

(declare-datatypes ((SeekEntryResult!6541 0))(
  ( (MissingZero!6541 (index!28448 (_ BitVec 32))) (Found!6541 (index!28449 (_ BitVec 32))) (Intermediate!6541 (undefined!7353 Bool) (index!28450 (_ BitVec 32)) (x!57208 (_ BitVec 32))) (Undefined!6541) (MissingVacant!6541 (index!28451 (_ BitVec 32))) )
))
(declare-fun lt!289467 () SeekEntryResult!6541)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624048 (= res!402227 (not (= lt!289467 (Found!6541 index!984))))))

(declare-datatypes ((Unit!21072 0))(
  ( (Unit!21073) )
))
(declare-fun lt!289463 () Unit!21072)

(declare-fun e!357913 () Unit!21072)

(assert (=> b!624048 (= lt!289463 e!357913)))

(declare-fun c!71282 () Bool)

(assert (=> b!624048 (= c!71282 (= lt!289467 Undefined!6541))))

(declare-fun lt!289460 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37713 (_ BitVec 32)) SeekEntryResult!6541)

(assert (=> b!624048 (= lt!289467 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!289460 lt!289468 mask!3053))))

(declare-fun e!357916 () Bool)

(assert (=> b!624048 e!357916))

(declare-fun res!402215 () Bool)

(assert (=> b!624048 (=> (not res!402215) (not e!357916))))

(declare-fun lt!289462 () SeekEntryResult!6541)

(declare-fun lt!289465 () (_ BitVec 32))

(assert (=> b!624048 (= res!402215 (= lt!289462 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289465 vacantSpotIndex!68 lt!289460 lt!289468 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624048 (= lt!289462 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289465 vacantSpotIndex!68 (select (arr!18101 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!624048 (= lt!289460 (select (store (arr!18101 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!289461 () Unit!21072)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37713 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21072)

(assert (=> b!624048 (= lt!289461 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!289465 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!624048 (= lt!289465 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!624049 () Bool)

(declare-fun res!402216 () Bool)

(declare-fun e!357915 () Bool)

(assert (=> b!624049 (=> (not res!402216) (not e!357915))))

(assert (=> b!624049 (= res!402216 (and (= (size!18465 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18465 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18465 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624050 () Bool)

(assert (=> b!624050 (= e!357918 e!357914)))

(declare-fun res!402222 () Bool)

(assert (=> b!624050 (=> (not res!402222) (not e!357914))))

(declare-fun lt!289466 () SeekEntryResult!6541)

(assert (=> b!624050 (= res!402222 (and (= lt!289466 (Found!6541 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18101 a!2986) index!984) (select (arr!18101 a!2986) j!136))) (not (= (select (arr!18101 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!624050 (= lt!289466 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18101 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624051 () Bool)

(declare-fun Unit!21074 () Unit!21072)

(assert (=> b!624051 (= e!357913 Unit!21074)))

(declare-fun b!624052 () Bool)

(assert (=> b!624052 (= e!357912 (= (select (arr!18101 a!2986) j!136) lt!289460))))

(assert (=> b!624052 (= (select (store (arr!18101 a!2986) i!1108 k!1786) index!984) (select (arr!18101 a!2986) j!136))))

(declare-fun b!624053 () Bool)

(declare-fun res!402224 () Bool)

(assert (=> b!624053 (=> (not res!402224) (not e!357915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624053 (= res!402224 (validKeyInArray!0 k!1786))))

(declare-fun b!624054 () Bool)

(assert (=> b!624054 (= e!357916 (= lt!289466 lt!289462))))

(declare-fun b!624055 () Bool)

(declare-fun res!402219 () Bool)

(assert (=> b!624055 (=> (not res!402219) (not e!357917))))

(declare-datatypes ((List!12142 0))(
  ( (Nil!12139) (Cons!12138 (h!13183 (_ BitVec 64)) (t!18370 List!12142)) )
))
(declare-fun arrayNoDuplicates!0 (array!37713 (_ BitVec 32) List!12142) Bool)

(assert (=> b!624055 (= res!402219 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12139))))

(declare-fun b!624047 () Bool)

(assert (=> b!624047 (= e!357915 e!357917)))

(declare-fun res!402223 () Bool)

(assert (=> b!624047 (=> (not res!402223) (not e!357917))))

(declare-fun lt!289464 () SeekEntryResult!6541)

(assert (=> b!624047 (= res!402223 (or (= lt!289464 (MissingZero!6541 i!1108)) (= lt!289464 (MissingVacant!6541 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37713 (_ BitVec 32)) SeekEntryResult!6541)

(assert (=> b!624047 (= lt!289464 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!402225 () Bool)

(assert (=> start!56288 (=> (not res!402225) (not e!357915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56288 (= res!402225 (validMask!0 mask!3053))))

(assert (=> start!56288 e!357915))

(assert (=> start!56288 true))

(declare-fun array_inv!13897 (array!37713) Bool)

(assert (=> start!56288 (array_inv!13897 a!2986)))

(declare-fun b!624056 () Bool)

(declare-fun res!402221 () Bool)

(assert (=> b!624056 (=> (not res!402221) (not e!357915))))

(declare-fun arrayContainsKey!0 (array!37713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624056 (= res!402221 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624057 () Bool)

(declare-fun Unit!21075 () Unit!21072)

(assert (=> b!624057 (= e!357913 Unit!21075)))

(assert (=> b!624057 false))

(declare-fun b!624058 () Bool)

(declare-fun res!402217 () Bool)

(assert (=> b!624058 (=> (not res!402217) (not e!357917))))

(assert (=> b!624058 (= res!402217 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18101 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624059 () Bool)

(declare-fun res!402220 () Bool)

(assert (=> b!624059 (=> (not res!402220) (not e!357915))))

(assert (=> b!624059 (= res!402220 (validKeyInArray!0 (select (arr!18101 a!2986) j!136)))))

(assert (= (and start!56288 res!402225) b!624049))

(assert (= (and b!624049 res!402216) b!624059))

(assert (= (and b!624059 res!402220) b!624053))

(assert (= (and b!624053 res!402224) b!624056))

(assert (= (and b!624056 res!402221) b!624047))

(assert (= (and b!624047 res!402223) b!624045))

(assert (= (and b!624045 res!402226) b!624055))

(assert (= (and b!624055 res!402219) b!624058))

(assert (= (and b!624058 res!402217) b!624046))

(assert (= (and b!624046 res!402218) b!624050))

(assert (= (and b!624050 res!402222) b!624048))

(assert (= (and b!624048 res!402215) b!624054))

(assert (= (and b!624048 c!71282) b!624057))

(assert (= (and b!624048 (not c!71282)) b!624051))

(assert (= (and b!624048 (not res!402227)) b!624052))

(declare-fun m!599789 () Bool)

(assert (=> b!624045 m!599789))

(declare-fun m!599791 () Bool)

(assert (=> b!624058 m!599791))

(declare-fun m!599793 () Bool)

(assert (=> b!624048 m!599793))

(declare-fun m!599795 () Bool)

(assert (=> b!624048 m!599795))

(declare-fun m!599797 () Bool)

(assert (=> b!624048 m!599797))

(declare-fun m!599799 () Bool)

(assert (=> b!624048 m!599799))

(assert (=> b!624048 m!599799))

(declare-fun m!599801 () Bool)

(assert (=> b!624048 m!599801))

(declare-fun m!599803 () Bool)

(assert (=> b!624048 m!599803))

(declare-fun m!599805 () Bool)

(assert (=> b!624048 m!599805))

(declare-fun m!599807 () Bool)

(assert (=> b!624048 m!599807))

(declare-fun m!599809 () Bool)

(assert (=> b!624047 m!599809))

(declare-fun m!599811 () Bool)

(assert (=> start!56288 m!599811))

(declare-fun m!599813 () Bool)

(assert (=> start!56288 m!599813))

(assert (=> b!624059 m!599799))

(assert (=> b!624059 m!599799))

(declare-fun m!599815 () Bool)

(assert (=> b!624059 m!599815))

(declare-fun m!599817 () Bool)

(assert (=> b!624056 m!599817))

(assert (=> b!624046 m!599807))

(declare-fun m!599819 () Bool)

(assert (=> b!624046 m!599819))

(declare-fun m!599821 () Bool)

(assert (=> b!624053 m!599821))

(assert (=> b!624052 m!599799))

(assert (=> b!624052 m!599807))

(declare-fun m!599823 () Bool)

(assert (=> b!624052 m!599823))

(declare-fun m!599825 () Bool)

(assert (=> b!624050 m!599825))

(assert (=> b!624050 m!599799))

(assert (=> b!624050 m!599799))

(declare-fun m!599827 () Bool)

(assert (=> b!624050 m!599827))

(declare-fun m!599829 () Bool)

(assert (=> b!624055 m!599829))

(push 1)

(assert (not start!56288))

(assert (not b!624056))

