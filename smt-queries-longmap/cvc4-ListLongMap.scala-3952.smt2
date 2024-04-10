; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53726 () Bool)

(assert start!53726)

(declare-fun b!585943 () Bool)

(declare-fun res!373767 () Bool)

(declare-fun e!335129 () Bool)

(assert (=> b!585943 (=> (not res!373767) (not e!335129))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585943 (= res!373767 (validKeyInArray!0 k!1786))))

(declare-fun b!585944 () Bool)

(declare-fun res!373760 () Bool)

(declare-fun e!335128 () Bool)

(assert (=> b!585944 (=> (not res!373760) (not e!335128))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36627 0))(
  ( (array!36628 (arr!17588 (Array (_ BitVec 32) (_ BitVec 64))) (size!17952 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36627)

(declare-datatypes ((SeekEntryResult!6028 0))(
  ( (MissingZero!6028 (index!26339 (_ BitVec 32))) (Found!6028 (index!26340 (_ BitVec 32))) (Intermediate!6028 (undefined!6840 Bool) (index!26341 (_ BitVec 32)) (x!55153 (_ BitVec 32))) (Undefined!6028) (MissingVacant!6028 (index!26342 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36627 (_ BitVec 32)) SeekEntryResult!6028)

(assert (=> b!585944 (= res!373760 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17588 a!2986) j!136) a!2986 mask!3053) (Found!6028 j!136)))))

(declare-fun b!585945 () Bool)

(declare-fun res!373763 () Bool)

(assert (=> b!585945 (=> (not res!373763) (not e!335129))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585945 (= res!373763 (and (= (size!17952 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17952 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17952 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!373759 () Bool)

(assert (=> start!53726 (=> (not res!373759) (not e!335129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53726 (= res!373759 (validMask!0 mask!3053))))

(assert (=> start!53726 e!335129))

(assert (=> start!53726 true))

(declare-fun array_inv!13384 (array!36627) Bool)

(assert (=> start!53726 (array_inv!13384 a!2986)))

(declare-fun b!585946 () Bool)

(declare-fun res!373765 () Bool)

(assert (=> b!585946 (=> (not res!373765) (not e!335128))))

(assert (=> b!585946 (= res!373765 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17588 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17588 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585947 () Bool)

(declare-fun res!373769 () Bool)

(assert (=> b!585947 (=> (not res!373769) (not e!335128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36627 (_ BitVec 32)) Bool)

(assert (=> b!585947 (= res!373769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585948 () Bool)

(assert (=> b!585948 (= e!335129 e!335128)))

(declare-fun res!373762 () Bool)

(assert (=> b!585948 (=> (not res!373762) (not e!335128))))

(declare-fun lt!265959 () SeekEntryResult!6028)

(assert (=> b!585948 (= res!373762 (or (= lt!265959 (MissingZero!6028 i!1108)) (= lt!265959 (MissingVacant!6028 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36627 (_ BitVec 32)) SeekEntryResult!6028)

(assert (=> b!585948 (= lt!265959 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!585949 () Bool)

(declare-fun res!373761 () Bool)

(assert (=> b!585949 (=> (not res!373761) (not e!335128))))

(assert (=> b!585949 (= res!373761 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17588 a!2986) index!984) (select (arr!17588 a!2986) j!136))) (not (= (select (arr!17588 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585950 () Bool)

(declare-fun res!373768 () Bool)

(assert (=> b!585950 (=> (not res!373768) (not e!335129))))

(assert (=> b!585950 (= res!373768 (validKeyInArray!0 (select (arr!17588 a!2986) j!136)))))

(declare-fun b!585951 () Bool)

(declare-fun res!373766 () Bool)

(assert (=> b!585951 (=> (not res!373766) (not e!335129))))

(declare-fun arrayContainsKey!0 (array!36627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585951 (= res!373766 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585952 () Bool)

(assert (=> b!585952 (= e!335128 (not true))))

(declare-fun lt!265960 () (_ BitVec 32))

(assert (=> b!585952 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265960 vacantSpotIndex!68 (select (arr!17588 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265960 vacantSpotIndex!68 (select (store (arr!17588 a!2986) i!1108 k!1786) j!136) (array!36628 (store (arr!17588 a!2986) i!1108 k!1786) (size!17952 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18176 0))(
  ( (Unit!18177) )
))
(declare-fun lt!265958 () Unit!18176)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36627 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18176)

(assert (=> b!585952 (= lt!265958 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265960 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585952 (= lt!265960 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585953 () Bool)

(declare-fun res!373764 () Bool)

(assert (=> b!585953 (=> (not res!373764) (not e!335128))))

(declare-datatypes ((List!11629 0))(
  ( (Nil!11626) (Cons!11625 (h!12670 (_ BitVec 64)) (t!17857 List!11629)) )
))
(declare-fun arrayNoDuplicates!0 (array!36627 (_ BitVec 32) List!11629) Bool)

(assert (=> b!585953 (= res!373764 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11626))))

(assert (= (and start!53726 res!373759) b!585945))

(assert (= (and b!585945 res!373763) b!585950))

(assert (= (and b!585950 res!373768) b!585943))

(assert (= (and b!585943 res!373767) b!585951))

(assert (= (and b!585951 res!373766) b!585948))

(assert (= (and b!585948 res!373762) b!585947))

(assert (= (and b!585947 res!373769) b!585953))

(assert (= (and b!585953 res!373764) b!585946))

(assert (= (and b!585946 res!373765) b!585944))

(assert (= (and b!585944 res!373760) b!585949))

(assert (= (and b!585949 res!373761) b!585952))

(declare-fun m!564227 () Bool)

(assert (=> b!585944 m!564227))

(assert (=> b!585944 m!564227))

(declare-fun m!564229 () Bool)

(assert (=> b!585944 m!564229))

(declare-fun m!564231 () Bool)

(assert (=> b!585949 m!564231))

(assert (=> b!585949 m!564227))

(declare-fun m!564233 () Bool)

(assert (=> start!53726 m!564233))

(declare-fun m!564235 () Bool)

(assert (=> start!53726 m!564235))

(declare-fun m!564237 () Bool)

(assert (=> b!585948 m!564237))

(declare-fun m!564239 () Bool)

(assert (=> b!585953 m!564239))

(declare-fun m!564241 () Bool)

(assert (=> b!585952 m!564241))

(declare-fun m!564243 () Bool)

(assert (=> b!585952 m!564243))

(assert (=> b!585952 m!564227))

(declare-fun m!564245 () Bool)

(assert (=> b!585952 m!564245))

(declare-fun m!564247 () Bool)

(assert (=> b!585952 m!564247))

(assert (=> b!585952 m!564227))

(declare-fun m!564249 () Bool)

(assert (=> b!585952 m!564249))

(assert (=> b!585952 m!564243))

(declare-fun m!564251 () Bool)

(assert (=> b!585952 m!564251))

(declare-fun m!564253 () Bool)

(assert (=> b!585943 m!564253))

(declare-fun m!564255 () Bool)

(assert (=> b!585947 m!564255))

(declare-fun m!564257 () Bool)

(assert (=> b!585946 m!564257))

(assert (=> b!585946 m!564245))

(declare-fun m!564259 () Bool)

(assert (=> b!585946 m!564259))

(declare-fun m!564261 () Bool)

(assert (=> b!585951 m!564261))

(assert (=> b!585950 m!564227))

(assert (=> b!585950 m!564227))

(declare-fun m!564263 () Bool)

(assert (=> b!585950 m!564263))

(push 1)

