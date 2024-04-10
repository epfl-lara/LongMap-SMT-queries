; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53752 () Bool)

(assert start!53752)

(declare-fun b!586372 () Bool)

(declare-fun res!374191 () Bool)

(declare-fun e!335247 () Bool)

(assert (=> b!586372 (=> (not res!374191) (not e!335247))))

(declare-datatypes ((array!36653 0))(
  ( (array!36654 (arr!17601 (Array (_ BitVec 32) (_ BitVec 64))) (size!17965 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36653)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586372 (= res!374191 (validKeyInArray!0 (select (arr!17601 a!2986) j!136)))))

(declare-fun b!586373 () Bool)

(declare-fun res!374188 () Bool)

(assert (=> b!586373 (=> (not res!374188) (not e!335247))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586373 (= res!374188 (and (= (size!17965 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17965 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17965 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586374 () Bool)

(declare-fun res!374192 () Bool)

(assert (=> b!586374 (=> (not res!374192) (not e!335247))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!586374 (= res!374192 (validKeyInArray!0 k!1786))))

(declare-fun b!586375 () Bool)

(declare-fun e!335246 () Bool)

(assert (=> b!586375 (= e!335246 (not true))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!266076 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6041 0))(
  ( (MissingZero!6041 (index!26391 (_ BitVec 32))) (Found!6041 (index!26392 (_ BitVec 32))) (Intermediate!6041 (undefined!6853 Bool) (index!26393 (_ BitVec 32)) (x!55206 (_ BitVec 32))) (Undefined!6041) (MissingVacant!6041 (index!26394 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36653 (_ BitVec 32)) SeekEntryResult!6041)

(assert (=> b!586375 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266076 vacantSpotIndex!68 (select (arr!17601 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266076 vacantSpotIndex!68 (select (store (arr!17601 a!2986) i!1108 k!1786) j!136) (array!36654 (store (arr!17601 a!2986) i!1108 k!1786) (size!17965 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18202 0))(
  ( (Unit!18203) )
))
(declare-fun lt!266075 () Unit!18202)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36653 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18202)

(assert (=> b!586375 (= lt!266075 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266076 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586375 (= lt!266076 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586376 () Bool)

(declare-fun res!374193 () Bool)

(assert (=> b!586376 (=> (not res!374193) (not e!335246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36653 (_ BitVec 32)) Bool)

(assert (=> b!586376 (= res!374193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!374195 () Bool)

(assert (=> start!53752 (=> (not res!374195) (not e!335247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53752 (= res!374195 (validMask!0 mask!3053))))

(assert (=> start!53752 e!335247))

(assert (=> start!53752 true))

(declare-fun array_inv!13397 (array!36653) Bool)

(assert (=> start!53752 (array_inv!13397 a!2986)))

(declare-fun b!586377 () Bool)

(declare-fun res!374196 () Bool)

(assert (=> b!586377 (=> (not res!374196) (not e!335246))))

(declare-datatypes ((List!11642 0))(
  ( (Nil!11639) (Cons!11638 (h!12683 (_ BitVec 64)) (t!17870 List!11642)) )
))
(declare-fun arrayNoDuplicates!0 (array!36653 (_ BitVec 32) List!11642) Bool)

(assert (=> b!586377 (= res!374196 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11639))))

(declare-fun b!586378 () Bool)

(declare-fun res!374197 () Bool)

(assert (=> b!586378 (=> (not res!374197) (not e!335246))))

(assert (=> b!586378 (= res!374197 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17601 a!2986) j!136) a!2986 mask!3053) (Found!6041 j!136)))))

(declare-fun b!586379 () Bool)

(declare-fun res!374198 () Bool)

(assert (=> b!586379 (=> (not res!374198) (not e!335246))))

(assert (=> b!586379 (= res!374198 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17601 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17601 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586380 () Bool)

(declare-fun res!374190 () Bool)

(assert (=> b!586380 (=> (not res!374190) (not e!335247))))

(declare-fun arrayContainsKey!0 (array!36653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586380 (= res!374190 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586381 () Bool)

(assert (=> b!586381 (= e!335247 e!335246)))

(declare-fun res!374194 () Bool)

(assert (=> b!586381 (=> (not res!374194) (not e!335246))))

(declare-fun lt!266077 () SeekEntryResult!6041)

(assert (=> b!586381 (= res!374194 (or (= lt!266077 (MissingZero!6041 i!1108)) (= lt!266077 (MissingVacant!6041 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36653 (_ BitVec 32)) SeekEntryResult!6041)

(assert (=> b!586381 (= lt!266077 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586382 () Bool)

(declare-fun res!374189 () Bool)

(assert (=> b!586382 (=> (not res!374189) (not e!335246))))

(assert (=> b!586382 (= res!374189 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17601 a!2986) index!984) (select (arr!17601 a!2986) j!136))) (not (= (select (arr!17601 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53752 res!374195) b!586373))

(assert (= (and b!586373 res!374188) b!586372))

(assert (= (and b!586372 res!374191) b!586374))

(assert (= (and b!586374 res!374192) b!586380))

(assert (= (and b!586380 res!374190) b!586381))

(assert (= (and b!586381 res!374194) b!586376))

(assert (= (and b!586376 res!374193) b!586377))

(assert (= (and b!586377 res!374196) b!586379))

(assert (= (and b!586379 res!374198) b!586378))

(assert (= (and b!586378 res!374197) b!586382))

(assert (= (and b!586382 res!374189) b!586375))

(declare-fun m!564721 () Bool)

(assert (=> b!586374 m!564721))

(declare-fun m!564723 () Bool)

(assert (=> b!586380 m!564723))

(declare-fun m!564725 () Bool)

(assert (=> b!586377 m!564725))

(declare-fun m!564727 () Bool)

(assert (=> b!586375 m!564727))

(declare-fun m!564729 () Bool)

(assert (=> b!586375 m!564729))

(declare-fun m!564731 () Bool)

(assert (=> b!586375 m!564731))

(declare-fun m!564733 () Bool)

(assert (=> b!586375 m!564733))

(assert (=> b!586375 m!564727))

(declare-fun m!564735 () Bool)

(assert (=> b!586375 m!564735))

(declare-fun m!564737 () Bool)

(assert (=> b!586375 m!564737))

(assert (=> b!586375 m!564733))

(declare-fun m!564739 () Bool)

(assert (=> b!586375 m!564739))

(declare-fun m!564741 () Bool)

(assert (=> b!586381 m!564741))

(declare-fun m!564743 () Bool)

(assert (=> start!53752 m!564743))

(declare-fun m!564745 () Bool)

(assert (=> start!53752 m!564745))

(declare-fun m!564747 () Bool)

(assert (=> b!586379 m!564747))

(assert (=> b!586379 m!564735))

(declare-fun m!564749 () Bool)

(assert (=> b!586379 m!564749))

(assert (=> b!586372 m!564727))

(assert (=> b!586372 m!564727))

(declare-fun m!564751 () Bool)

(assert (=> b!586372 m!564751))

(assert (=> b!586378 m!564727))

(assert (=> b!586378 m!564727))

(declare-fun m!564753 () Bool)

(assert (=> b!586378 m!564753))

(declare-fun m!564755 () Bool)

(assert (=> b!586382 m!564755))

(assert (=> b!586382 m!564727))

(declare-fun m!564757 () Bool)

(assert (=> b!586376 m!564757))

(push 1)

