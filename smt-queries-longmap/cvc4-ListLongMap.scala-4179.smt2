; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56994 () Bool)

(assert start!56994)

(declare-fun b!630823 () Bool)

(declare-fun e!360703 () Bool)

(declare-datatypes ((SeekEntryResult!6709 0))(
  ( (MissingZero!6709 (index!29126 (_ BitVec 32))) (Found!6709 (index!29127 (_ BitVec 32))) (Intermediate!6709 (undefined!7521 Bool) (index!29128 (_ BitVec 32)) (x!57863 (_ BitVec 32))) (Undefined!6709) (MissingVacant!6709 (index!29129 (_ BitVec 32))) )
))
(declare-fun lt!291380 () SeekEntryResult!6709)

(declare-fun lt!291376 () SeekEntryResult!6709)

(assert (=> b!630823 (= e!360703 (= lt!291380 lt!291376))))

(declare-fun b!630824 () Bool)

(declare-datatypes ((Unit!21170 0))(
  ( (Unit!21171) )
))
(declare-fun e!360707 () Unit!21170)

(declare-fun Unit!21172 () Unit!21170)

(assert (=> b!630824 (= e!360707 Unit!21172)))

(assert (=> b!630824 false))

(declare-fun b!630825 () Bool)

(declare-fun e!360706 () Bool)

(assert (=> b!630825 (= e!360706 (not true))))

(declare-fun lt!291375 () Unit!21170)

(assert (=> b!630825 (= lt!291375 e!360707)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38070 0))(
  ( (array!38071 (arr!18269 (Array (_ BitVec 32) (_ BitVec 64))) (size!18633 (_ BitVec 32))) )
))
(declare-fun lt!291381 () array!38070)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!291378 () (_ BitVec 64))

(declare-fun c!71876 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38070 (_ BitVec 32)) SeekEntryResult!6709)

(assert (=> b!630825 (= c!71876 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291378 lt!291381 mask!3053) Undefined!6709))))

(assert (=> b!630825 e!360703))

(declare-fun res!407813 () Bool)

(assert (=> b!630825 (=> (not res!407813) (not e!360703))))

(declare-fun lt!291377 () (_ BitVec 32))

(assert (=> b!630825 (= res!407813 (= lt!291376 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291377 vacantSpotIndex!68 lt!291378 lt!291381 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38070)

(assert (=> b!630825 (= lt!291376 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291377 vacantSpotIndex!68 (select (arr!18269 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!630825 (= lt!291378 (select (store (arr!18269 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!291379 () Unit!21170)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38070 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21170)

(assert (=> b!630825 (= lt!291379 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291377 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630825 (= lt!291377 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630826 () Bool)

(declare-fun res!407816 () Bool)

(declare-fun e!360705 () Bool)

(assert (=> b!630826 (=> (not res!407816) (not e!360705))))

(assert (=> b!630826 (= res!407816 (and (= (size!18633 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18633 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18633 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!407811 () Bool)

(assert (=> start!56994 (=> (not res!407811) (not e!360705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56994 (= res!407811 (validMask!0 mask!3053))))

(assert (=> start!56994 e!360705))

(assert (=> start!56994 true))

(declare-fun array_inv!14065 (array!38070) Bool)

(assert (=> start!56994 (array_inv!14065 a!2986)))

(declare-fun b!630827 () Bool)

(declare-fun e!360708 () Bool)

(assert (=> b!630827 (= e!360705 e!360708)))

(declare-fun res!407815 () Bool)

(assert (=> b!630827 (=> (not res!407815) (not e!360708))))

(declare-fun lt!291382 () SeekEntryResult!6709)

(assert (=> b!630827 (= res!407815 (or (= lt!291382 (MissingZero!6709 i!1108)) (= lt!291382 (MissingVacant!6709 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38070 (_ BitVec 32)) SeekEntryResult!6709)

(assert (=> b!630827 (= lt!291382 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!630828 () Bool)

(declare-fun res!407814 () Bool)

(assert (=> b!630828 (=> (not res!407814) (not e!360705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630828 (= res!407814 (validKeyInArray!0 (select (arr!18269 a!2986) j!136)))))

(declare-fun b!630829 () Bool)

(declare-fun e!360702 () Bool)

(assert (=> b!630829 (= e!360708 e!360702)))

(declare-fun res!407808 () Bool)

(assert (=> b!630829 (=> (not res!407808) (not e!360702))))

(assert (=> b!630829 (= res!407808 (= (select (store (arr!18269 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630829 (= lt!291381 (array!38071 (store (arr!18269 a!2986) i!1108 k!1786) (size!18633 a!2986)))))

(declare-fun b!630830 () Bool)

(assert (=> b!630830 (= e!360702 e!360706)))

(declare-fun res!407806 () Bool)

(assert (=> b!630830 (=> (not res!407806) (not e!360706))))

(assert (=> b!630830 (= res!407806 (and (= lt!291380 (Found!6709 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18269 a!2986) index!984) (select (arr!18269 a!2986) j!136))) (not (= (select (arr!18269 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!630830 (= lt!291380 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18269 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630831 () Bool)

(declare-fun Unit!21173 () Unit!21170)

(assert (=> b!630831 (= e!360707 Unit!21173)))

(declare-fun b!630832 () Bool)

(declare-fun res!407810 () Bool)

(assert (=> b!630832 (=> (not res!407810) (not e!360705))))

(declare-fun arrayContainsKey!0 (array!38070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630832 (= res!407810 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630833 () Bool)

(declare-fun res!407812 () Bool)

(assert (=> b!630833 (=> (not res!407812) (not e!360705))))

(assert (=> b!630833 (= res!407812 (validKeyInArray!0 k!1786))))

(declare-fun b!630834 () Bool)

(declare-fun res!407809 () Bool)

(assert (=> b!630834 (=> (not res!407809) (not e!360708))))

(declare-datatypes ((List!12310 0))(
  ( (Nil!12307) (Cons!12306 (h!13351 (_ BitVec 64)) (t!18538 List!12310)) )
))
(declare-fun arrayNoDuplicates!0 (array!38070 (_ BitVec 32) List!12310) Bool)

(assert (=> b!630834 (= res!407809 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12307))))

(declare-fun b!630835 () Bool)

(declare-fun res!407805 () Bool)

(assert (=> b!630835 (=> (not res!407805) (not e!360708))))

(assert (=> b!630835 (= res!407805 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18269 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630836 () Bool)

(declare-fun res!407807 () Bool)

(assert (=> b!630836 (=> (not res!407807) (not e!360708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38070 (_ BitVec 32)) Bool)

(assert (=> b!630836 (= res!407807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56994 res!407811) b!630826))

(assert (= (and b!630826 res!407816) b!630828))

(assert (= (and b!630828 res!407814) b!630833))

(assert (= (and b!630833 res!407812) b!630832))

(assert (= (and b!630832 res!407810) b!630827))

(assert (= (and b!630827 res!407815) b!630836))

(assert (= (and b!630836 res!407807) b!630834))

(assert (= (and b!630834 res!407809) b!630835))

(assert (= (and b!630835 res!407805) b!630829))

(assert (= (and b!630829 res!407808) b!630830))

(assert (= (and b!630830 res!407806) b!630825))

(assert (= (and b!630825 res!407813) b!630823))

(assert (= (and b!630825 c!71876) b!630824))

(assert (= (and b!630825 (not c!71876)) b!630831))

(declare-fun m!605783 () Bool)

(assert (=> b!630829 m!605783))

(declare-fun m!605785 () Bool)

(assert (=> b!630829 m!605785))

(declare-fun m!605787 () Bool)

(assert (=> b!630830 m!605787))

(declare-fun m!605789 () Bool)

(assert (=> b!630830 m!605789))

(assert (=> b!630830 m!605789))

(declare-fun m!605791 () Bool)

(assert (=> b!630830 m!605791))

(declare-fun m!605793 () Bool)

(assert (=> b!630836 m!605793))

(assert (=> b!630828 m!605789))

(assert (=> b!630828 m!605789))

(declare-fun m!605795 () Bool)

(assert (=> b!630828 m!605795))

(declare-fun m!605797 () Bool)

(assert (=> b!630833 m!605797))

(declare-fun m!605799 () Bool)

(assert (=> start!56994 m!605799))

(declare-fun m!605801 () Bool)

(assert (=> start!56994 m!605801))

(declare-fun m!605803 () Bool)

(assert (=> b!630825 m!605803))

(declare-fun m!605805 () Bool)

(assert (=> b!630825 m!605805))

(declare-fun m!605807 () Bool)

(assert (=> b!630825 m!605807))

(assert (=> b!630825 m!605789))

(assert (=> b!630825 m!605783))

(declare-fun m!605809 () Bool)

(assert (=> b!630825 m!605809))

(declare-fun m!605811 () Bool)

(assert (=> b!630825 m!605811))

(assert (=> b!630825 m!605789))

(declare-fun m!605813 () Bool)

(assert (=> b!630825 m!605813))

(declare-fun m!605815 () Bool)

(assert (=> b!630827 m!605815))

(declare-fun m!605817 () Bool)

(assert (=> b!630834 m!605817))

(declare-fun m!605819 () Bool)

(assert (=> b!630832 m!605819))

(declare-fun m!605821 () Bool)

(assert (=> b!630835 m!605821))

(push 1)

