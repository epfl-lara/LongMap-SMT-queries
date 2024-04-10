; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53696 () Bool)

(assert start!53696)

(declare-fun b!585438 () Bool)

(declare-fun e!334983 () Bool)

(declare-fun e!334985 () Bool)

(assert (=> b!585438 (= e!334983 e!334985)))

(declare-fun res!373255 () Bool)

(assert (=> b!585438 (=> (not res!373255) (not e!334985))))

(declare-datatypes ((SeekEntryResult!6013 0))(
  ( (MissingZero!6013 (index!26279 (_ BitVec 32))) (Found!6013 (index!26280 (_ BitVec 32))) (Intermediate!6013 (undefined!6825 Bool) (index!26281 (_ BitVec 32)) (x!55098 (_ BitVec 32))) (Undefined!6013) (MissingVacant!6013 (index!26282 (_ BitVec 32))) )
))
(declare-fun lt!265823 () SeekEntryResult!6013)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585438 (= res!373255 (or (= lt!265823 (MissingZero!6013 i!1108)) (= lt!265823 (MissingVacant!6013 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36597 0))(
  ( (array!36598 (arr!17573 (Array (_ BitVec 32) (_ BitVec 64))) (size!17937 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36597)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36597 (_ BitVec 32)) SeekEntryResult!6013)

(assert (=> b!585438 (= lt!265823 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!585439 () Bool)

(declare-fun res!373263 () Bool)

(assert (=> b!585439 (=> (not res!373263) (not e!334985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36597 (_ BitVec 32)) Bool)

(assert (=> b!585439 (= res!373263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585440 () Bool)

(declare-fun res!373257 () Bool)

(assert (=> b!585440 (=> (not res!373257) (not e!334985))))

(declare-datatypes ((List!11614 0))(
  ( (Nil!11611) (Cons!11610 (h!12655 (_ BitVec 64)) (t!17842 List!11614)) )
))
(declare-fun arrayNoDuplicates!0 (array!36597 (_ BitVec 32) List!11614) Bool)

(assert (=> b!585440 (= res!373257 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11611))))

(declare-fun b!585441 () Bool)

(declare-fun e!334984 () Bool)

(assert (=> b!585441 (= e!334985 e!334984)))

(declare-fun res!373264 () Bool)

(assert (=> b!585441 (=> (not res!373264) (not e!334984))))

(declare-fun lt!265825 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!585441 (= res!373264 (and (bvsge lt!265825 #b00000000000000000000000000000000) (bvslt lt!265825 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585441 (= lt!265825 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585442 () Bool)

(declare-fun res!373259 () Bool)

(assert (=> b!585442 (=> (not res!373259) (not e!334985))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36597 (_ BitVec 32)) SeekEntryResult!6013)

(assert (=> b!585442 (= res!373259 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17573 a!2986) j!136) a!2986 mask!3053) (Found!6013 j!136)))))

(declare-fun b!585443 () Bool)

(declare-fun res!373262 () Bool)

(assert (=> b!585443 (=> (not res!373262) (not e!334983))))

(assert (=> b!585443 (= res!373262 (and (= (size!17937 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17937 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17937 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585444 () Bool)

(declare-fun res!373256 () Bool)

(assert (=> b!585444 (=> (not res!373256) (not e!334985))))

(assert (=> b!585444 (= res!373256 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17573 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17573 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585445 () Bool)

(declare-fun res!373260 () Bool)

(assert (=> b!585445 (=> (not res!373260) (not e!334983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585445 (= res!373260 (validKeyInArray!0 (select (arr!17573 a!2986) j!136)))))

(declare-fun b!585446 () Bool)

(assert (=> b!585446 (= e!334984 false)))

(declare-fun lt!265824 () SeekEntryResult!6013)

(assert (=> b!585446 (= lt!265824 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265825 vacantSpotIndex!68 (select (arr!17573 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!373261 () Bool)

(assert (=> start!53696 (=> (not res!373261) (not e!334983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53696 (= res!373261 (validMask!0 mask!3053))))

(assert (=> start!53696 e!334983))

(assert (=> start!53696 true))

(declare-fun array_inv!13369 (array!36597) Bool)

(assert (=> start!53696 (array_inv!13369 a!2986)))

(declare-fun b!585447 () Bool)

(declare-fun res!373258 () Bool)

(assert (=> b!585447 (=> (not res!373258) (not e!334985))))

(assert (=> b!585447 (= res!373258 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17573 a!2986) index!984) (select (arr!17573 a!2986) j!136))) (not (= (select (arr!17573 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585448 () Bool)

(declare-fun res!373254 () Bool)

(assert (=> b!585448 (=> (not res!373254) (not e!334983))))

(declare-fun arrayContainsKey!0 (array!36597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585448 (= res!373254 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585449 () Bool)

(declare-fun res!373265 () Bool)

(assert (=> b!585449 (=> (not res!373265) (not e!334983))))

(assert (=> b!585449 (= res!373265 (validKeyInArray!0 k!1786))))

(assert (= (and start!53696 res!373261) b!585443))

(assert (= (and b!585443 res!373262) b!585445))

(assert (= (and b!585445 res!373260) b!585449))

(assert (= (and b!585449 res!373265) b!585448))

(assert (= (and b!585448 res!373254) b!585438))

(assert (= (and b!585438 res!373255) b!585439))

(assert (= (and b!585439 res!373263) b!585440))

(assert (= (and b!585440 res!373257) b!585444))

(assert (= (and b!585444 res!373256) b!585442))

(assert (= (and b!585442 res!373259) b!585447))

(assert (= (and b!585447 res!373258) b!585441))

(assert (= (and b!585441 res!373264) b!585446))

(declare-fun m!563681 () Bool)

(assert (=> b!585448 m!563681))

(declare-fun m!563683 () Bool)

(assert (=> b!585445 m!563683))

(assert (=> b!585445 m!563683))

(declare-fun m!563685 () Bool)

(assert (=> b!585445 m!563685))

(declare-fun m!563687 () Bool)

(assert (=> b!585449 m!563687))

(declare-fun m!563689 () Bool)

(assert (=> b!585440 m!563689))

(assert (=> b!585446 m!563683))

(assert (=> b!585446 m!563683))

(declare-fun m!563691 () Bool)

(assert (=> b!585446 m!563691))

(declare-fun m!563693 () Bool)

(assert (=> b!585444 m!563693))

(declare-fun m!563695 () Bool)

(assert (=> b!585444 m!563695))

(declare-fun m!563697 () Bool)

(assert (=> b!585444 m!563697))

(declare-fun m!563699 () Bool)

(assert (=> b!585439 m!563699))

(declare-fun m!563701 () Bool)

(assert (=> b!585441 m!563701))

(declare-fun m!563703 () Bool)

(assert (=> b!585447 m!563703))

(assert (=> b!585447 m!563683))

(assert (=> b!585442 m!563683))

(assert (=> b!585442 m!563683))

(declare-fun m!563705 () Bool)

(assert (=> b!585442 m!563705))

(declare-fun m!563707 () Bool)

(assert (=> start!53696 m!563707))

(declare-fun m!563709 () Bool)

(assert (=> start!53696 m!563709))

(declare-fun m!563711 () Bool)

(assert (=> b!585438 m!563711))

(push 1)

(assert (not b!585446))

(assert (not b!585438))

(assert (not b!585449))

(assert (not b!585439))

(assert (not b!585440))

(assert (not b!585442))

(assert (not b!585441))

(assert (not b!585445))

(assert (not b!585448))

(assert (not start!53696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

