; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54060 () Bool)

(assert start!54060)

(declare-fun b!590368 () Bool)

(declare-fun e!337048 () Bool)

(declare-fun e!337044 () Bool)

(assert (=> b!590368 (= e!337048 (not e!337044))))

(declare-fun res!377603 () Bool)

(assert (=> b!590368 (=> res!377603 e!337044)))

(declare-datatypes ((SeekEntryResult!6135 0))(
  ( (MissingZero!6135 (index!26773 (_ BitVec 32))) (Found!6135 (index!26774 (_ BitVec 32))) (Intermediate!6135 (undefined!6947 Bool) (index!26775 (_ BitVec 32)) (x!55566 (_ BitVec 32))) (Undefined!6135) (MissingVacant!6135 (index!26776 (_ BitVec 32))) )
))
(declare-fun lt!267834 () SeekEntryResult!6135)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!590368 (= res!377603 (not (= lt!267834 (Found!6135 index!984))))))

(declare-datatypes ((Unit!18458 0))(
  ( (Unit!18459) )
))
(declare-fun lt!267827 () Unit!18458)

(declare-fun e!337046 () Unit!18458)

(assert (=> b!590368 (= lt!267827 e!337046)))

(declare-fun c!66752 () Bool)

(assert (=> b!590368 (= c!66752 (= lt!267834 Undefined!6135))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!267829 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36847 0))(
  ( (array!36848 (arr!17695 (Array (_ BitVec 32) (_ BitVec 64))) (size!18059 (_ BitVec 32))) )
))
(declare-fun lt!267833 () array!36847)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36847 (_ BitVec 32)) SeekEntryResult!6135)

(assert (=> b!590368 (= lt!267834 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267829 lt!267833 mask!3053))))

(declare-fun e!337045 () Bool)

(assert (=> b!590368 e!337045))

(declare-fun res!377607 () Bool)

(assert (=> b!590368 (=> (not res!377607) (not e!337045))))

(declare-fun lt!267835 () (_ BitVec 32))

(declare-fun lt!267831 () SeekEntryResult!6135)

(assert (=> b!590368 (= res!377607 (= lt!267831 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267835 vacantSpotIndex!68 lt!267829 lt!267833 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!36847)

(assert (=> b!590368 (= lt!267831 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267835 vacantSpotIndex!68 (select (arr!17695 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!590368 (= lt!267829 (select (store (arr!17695 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267832 () Unit!18458)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36847 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18458)

(assert (=> b!590368 (= lt!267832 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267835 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590368 (= lt!267835 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!590369 () Bool)

(declare-fun e!337053 () Bool)

(declare-fun arrayContainsKey!0 (array!36847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590369 (= e!337053 (arrayContainsKey!0 lt!267833 (select (arr!17695 a!2986) j!136) j!136))))

(declare-fun b!590370 () Bool)

(declare-fun res!377611 () Bool)

(declare-fun e!337052 () Bool)

(assert (=> b!590370 (=> (not res!377611) (not e!337052))))

(assert (=> b!590370 (= res!377611 (and (= (size!18059 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18059 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18059 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!377608 () Bool)

(assert (=> start!54060 (=> (not res!377608) (not e!337052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54060 (= res!377608 (validMask!0 mask!3053))))

(assert (=> start!54060 e!337052))

(assert (=> start!54060 true))

(declare-fun array_inv!13491 (array!36847) Bool)

(assert (=> start!54060 (array_inv!13491 a!2986)))

(declare-fun b!590371 () Bool)

(declare-fun e!337051 () Bool)

(declare-fun e!337047 () Bool)

(assert (=> b!590371 (= e!337051 e!337047)))

(declare-fun res!377609 () Bool)

(assert (=> b!590371 (=> (not res!377609) (not e!337047))))

(assert (=> b!590371 (= res!377609 (= (select (store (arr!17695 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590371 (= lt!267833 (array!36848 (store (arr!17695 a!2986) i!1108 k0!1786) (size!18059 a!2986)))))

(declare-fun b!590372 () Bool)

(declare-fun lt!267830 () SeekEntryResult!6135)

(assert (=> b!590372 (= e!337045 (= lt!267830 lt!267831))))

(declare-fun b!590373 () Bool)

(declare-fun res!377610 () Bool)

(assert (=> b!590373 (=> (not res!377610) (not e!337052))))

(assert (=> b!590373 (= res!377610 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!590374 () Bool)

(assert (=> b!590374 (= e!337044 true)))

(declare-fun e!337049 () Bool)

(assert (=> b!590374 e!337049))

(declare-fun res!377600 () Bool)

(assert (=> b!590374 (=> (not res!377600) (not e!337049))))

(assert (=> b!590374 (= res!377600 (= (select (store (arr!17695 a!2986) i!1108 k0!1786) index!984) (select (arr!17695 a!2986) j!136)))))

(declare-fun b!590375 () Bool)

(assert (=> b!590375 (= e!337052 e!337051)))

(declare-fun res!377599 () Bool)

(assert (=> b!590375 (=> (not res!377599) (not e!337051))))

(declare-fun lt!267828 () SeekEntryResult!6135)

(assert (=> b!590375 (= res!377599 (or (= lt!267828 (MissingZero!6135 i!1108)) (= lt!267828 (MissingVacant!6135 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36847 (_ BitVec 32)) SeekEntryResult!6135)

(assert (=> b!590375 (= lt!267828 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!590376 () Bool)

(declare-fun res!377604 () Bool)

(assert (=> b!590376 (=> (not res!377604) (not e!337051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36847 (_ BitVec 32)) Bool)

(assert (=> b!590376 (= res!377604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!590377 () Bool)

(declare-fun res!377606 () Bool)

(assert (=> b!590377 (=> (not res!377606) (not e!337052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590377 (= res!377606 (validKeyInArray!0 k0!1786))))

(declare-fun b!590378 () Bool)

(assert (=> b!590378 (= e!337047 e!337048)))

(declare-fun res!377601 () Bool)

(assert (=> b!590378 (=> (not res!377601) (not e!337048))))

(assert (=> b!590378 (= res!377601 (and (= lt!267830 (Found!6135 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17695 a!2986) index!984) (select (arr!17695 a!2986) j!136))) (not (= (select (arr!17695 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!590378 (= lt!267830 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17695 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590379 () Bool)

(assert (=> b!590379 (= e!337049 e!337053)))

(declare-fun res!377598 () Bool)

(assert (=> b!590379 (=> res!377598 e!337053)))

(assert (=> b!590379 (= res!377598 (or (not (= (select (arr!17695 a!2986) j!136) lt!267829)) (not (= (select (arr!17695 a!2986) j!136) (select (store (arr!17695 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984)))))

(declare-fun b!590380 () Bool)

(declare-fun Unit!18460 () Unit!18458)

(assert (=> b!590380 (= e!337046 Unit!18460)))

(declare-fun b!590381 () Bool)

(declare-fun res!377602 () Bool)

(assert (=> b!590381 (=> (not res!377602) (not e!337052))))

(assert (=> b!590381 (= res!377602 (validKeyInArray!0 (select (arr!17695 a!2986) j!136)))))

(declare-fun b!590382 () Bool)

(declare-fun res!377605 () Bool)

(assert (=> b!590382 (=> (not res!377605) (not e!337051))))

(declare-datatypes ((List!11736 0))(
  ( (Nil!11733) (Cons!11732 (h!12777 (_ BitVec 64)) (t!17964 List!11736)) )
))
(declare-fun arrayNoDuplicates!0 (array!36847 (_ BitVec 32) List!11736) Bool)

(assert (=> b!590382 (= res!377605 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11733))))

(declare-fun b!590383 () Bool)

(declare-fun Unit!18461 () Unit!18458)

(assert (=> b!590383 (= e!337046 Unit!18461)))

(assert (=> b!590383 false))

(declare-fun b!590384 () Bool)

(declare-fun res!377612 () Bool)

(assert (=> b!590384 (=> (not res!377612) (not e!337051))))

(assert (=> b!590384 (= res!377612 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17695 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54060 res!377608) b!590370))

(assert (= (and b!590370 res!377611) b!590381))

(assert (= (and b!590381 res!377602) b!590377))

(assert (= (and b!590377 res!377606) b!590373))

(assert (= (and b!590373 res!377610) b!590375))

(assert (= (and b!590375 res!377599) b!590376))

(assert (= (and b!590376 res!377604) b!590382))

(assert (= (and b!590382 res!377605) b!590384))

(assert (= (and b!590384 res!377612) b!590371))

(assert (= (and b!590371 res!377609) b!590378))

(assert (= (and b!590378 res!377601) b!590368))

(assert (= (and b!590368 res!377607) b!590372))

(assert (= (and b!590368 c!66752) b!590383))

(assert (= (and b!590368 (not c!66752)) b!590380))

(assert (= (and b!590368 (not res!377603)) b!590374))

(assert (= (and b!590374 res!377600) b!590379))

(assert (= (and b!590379 (not res!377598)) b!590369))

(declare-fun m!568785 () Bool)

(assert (=> b!590378 m!568785))

(declare-fun m!568787 () Bool)

(assert (=> b!590378 m!568787))

(assert (=> b!590378 m!568787))

(declare-fun m!568789 () Bool)

(assert (=> b!590378 m!568789))

(assert (=> b!590369 m!568787))

(assert (=> b!590369 m!568787))

(declare-fun m!568791 () Bool)

(assert (=> b!590369 m!568791))

(declare-fun m!568793 () Bool)

(assert (=> b!590375 m!568793))

(declare-fun m!568795 () Bool)

(assert (=> b!590377 m!568795))

(declare-fun m!568797 () Bool)

(assert (=> b!590371 m!568797))

(declare-fun m!568799 () Bool)

(assert (=> b!590371 m!568799))

(declare-fun m!568801 () Bool)

(assert (=> b!590373 m!568801))

(assert (=> b!590374 m!568797))

(declare-fun m!568803 () Bool)

(assert (=> b!590374 m!568803))

(assert (=> b!590374 m!568787))

(declare-fun m!568805 () Bool)

(assert (=> b!590384 m!568805))

(declare-fun m!568807 () Bool)

(assert (=> b!590376 m!568807))

(declare-fun m!568809 () Bool)

(assert (=> start!54060 m!568809))

(declare-fun m!568811 () Bool)

(assert (=> start!54060 m!568811))

(declare-fun m!568813 () Bool)

(assert (=> b!590382 m!568813))

(declare-fun m!568815 () Bool)

(assert (=> b!590368 m!568815))

(declare-fun m!568817 () Bool)

(assert (=> b!590368 m!568817))

(assert (=> b!590368 m!568787))

(assert (=> b!590368 m!568797))

(declare-fun m!568819 () Bool)

(assert (=> b!590368 m!568819))

(assert (=> b!590368 m!568787))

(declare-fun m!568821 () Bool)

(assert (=> b!590368 m!568821))

(declare-fun m!568823 () Bool)

(assert (=> b!590368 m!568823))

(declare-fun m!568825 () Bool)

(assert (=> b!590368 m!568825))

(assert (=> b!590379 m!568787))

(assert (=> b!590379 m!568797))

(assert (=> b!590379 m!568803))

(assert (=> b!590381 m!568787))

(assert (=> b!590381 m!568787))

(declare-fun m!568827 () Bool)

(assert (=> b!590381 m!568827))

(check-sat (not b!590369) (not b!590382) (not b!590373) (not b!590381) (not b!590376) (not b!590375) (not b!590378) (not b!590377) (not b!590368) (not start!54060))
(check-sat)
