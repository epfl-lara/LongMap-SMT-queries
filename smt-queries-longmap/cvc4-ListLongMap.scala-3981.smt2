; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53960 () Bool)

(assert start!53960)

(declare-fun b!589207 () Bool)

(declare-fun res!376759 () Bool)

(declare-fun e!336407 () Bool)

(assert (=> b!589207 (=> (not res!376759) (not e!336407))))

(declare-datatypes ((array!36804 0))(
  ( (array!36805 (arr!17675 (Array (_ BitVec 32) (_ BitVec 64))) (size!18039 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36804)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36804 (_ BitVec 32)) Bool)

(assert (=> b!589207 (= res!376759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589208 () Bool)

(declare-fun res!376764 () Bool)

(assert (=> b!589208 (=> (not res!376764) (not e!336407))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589208 (= res!376764 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17675 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589209 () Bool)

(declare-fun e!336405 () Bool)

(declare-fun e!336404 () Bool)

(assert (=> b!589209 (= e!336405 e!336404)))

(declare-fun res!376758 () Bool)

(assert (=> b!589209 (=> (not res!376758) (not e!336404))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6115 0))(
  ( (MissingZero!6115 (index!26690 (_ BitVec 32))) (Found!6115 (index!26691 (_ BitVec 32))) (Intermediate!6115 (undefined!6927 Bool) (index!26692 (_ BitVec 32)) (x!55481 (_ BitVec 32))) (Undefined!6115) (MissingVacant!6115 (index!26693 (_ BitVec 32))) )
))
(declare-fun lt!267213 () SeekEntryResult!6115)

(assert (=> b!589209 (= res!376758 (and (= lt!267213 (Found!6115 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17675 a!2986) index!984) (select (arr!17675 a!2986) j!136))) (not (= (select (arr!17675 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36804 (_ BitVec 32)) SeekEntryResult!6115)

(assert (=> b!589209 (= lt!267213 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17675 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589210 () Bool)

(declare-fun res!376762 () Bool)

(declare-fun e!336406 () Bool)

(assert (=> b!589210 (=> (not res!376762) (not e!336406))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589210 (= res!376762 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589211 () Bool)

(assert (=> b!589211 (= e!336406 e!336407)))

(declare-fun res!376761 () Bool)

(assert (=> b!589211 (=> (not res!376761) (not e!336407))))

(declare-fun lt!267214 () SeekEntryResult!6115)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589211 (= res!376761 (or (= lt!267214 (MissingZero!6115 i!1108)) (= lt!267214 (MissingVacant!6115 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36804 (_ BitVec 32)) SeekEntryResult!6115)

(assert (=> b!589211 (= lt!267214 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!589212 () Bool)

(declare-fun res!376760 () Bool)

(assert (=> b!589212 (=> (not res!376760) (not e!336406))))

(assert (=> b!589212 (= res!376760 (and (= (size!18039 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18039 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18039 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589213 () Bool)

(assert (=> b!589213 (= e!336404 (not true))))

(declare-datatypes ((Unit!18378 0))(
  ( (Unit!18379) )
))
(declare-fun lt!267212 () Unit!18378)

(declare-fun e!336403 () Unit!18378)

(assert (=> b!589213 (= lt!267212 e!336403)))

(declare-fun lt!267207 () (_ BitVec 64))

(declare-fun lt!267211 () array!36804)

(declare-fun c!66593 () Bool)

(assert (=> b!589213 (= c!66593 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267207 lt!267211 mask!3053) Undefined!6115))))

(declare-fun e!336402 () Bool)

(assert (=> b!589213 e!336402))

(declare-fun res!376763 () Bool)

(assert (=> b!589213 (=> (not res!376763) (not e!336402))))

(declare-fun lt!267210 () SeekEntryResult!6115)

(declare-fun lt!267208 () (_ BitVec 32))

(assert (=> b!589213 (= res!376763 (= lt!267210 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267208 vacantSpotIndex!68 lt!267207 lt!267211 mask!3053)))))

(assert (=> b!589213 (= lt!267210 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267208 vacantSpotIndex!68 (select (arr!17675 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589213 (= lt!267207 (select (store (arr!17675 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267209 () Unit!18378)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36804 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18378)

(assert (=> b!589213 (= lt!267209 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267208 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589213 (= lt!267208 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589214 () Bool)

(declare-fun Unit!18380 () Unit!18378)

(assert (=> b!589214 (= e!336403 Unit!18380)))

(assert (=> b!589214 false))

(declare-fun b!589215 () Bool)

(assert (=> b!589215 (= e!336407 e!336405)))

(declare-fun res!376766 () Bool)

(assert (=> b!589215 (=> (not res!376766) (not e!336405))))

(assert (=> b!589215 (= res!376766 (= (select (store (arr!17675 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589215 (= lt!267211 (array!36805 (store (arr!17675 a!2986) i!1108 k!1786) (size!18039 a!2986)))))

(declare-fun b!589216 () Bool)

(declare-fun res!376765 () Bool)

(assert (=> b!589216 (=> (not res!376765) (not e!336406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589216 (= res!376765 (validKeyInArray!0 (select (arr!17675 a!2986) j!136)))))

(declare-fun res!376756 () Bool)

(assert (=> start!53960 (=> (not res!376756) (not e!336406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53960 (= res!376756 (validMask!0 mask!3053))))

(assert (=> start!53960 e!336406))

(assert (=> start!53960 true))

(declare-fun array_inv!13471 (array!36804) Bool)

(assert (=> start!53960 (array_inv!13471 a!2986)))

(declare-fun b!589217 () Bool)

(declare-fun Unit!18381 () Unit!18378)

(assert (=> b!589217 (= e!336403 Unit!18381)))

(declare-fun b!589218 () Bool)

(assert (=> b!589218 (= e!336402 (= lt!267213 lt!267210))))

(declare-fun b!589219 () Bool)

(declare-fun res!376757 () Bool)

(assert (=> b!589219 (=> (not res!376757) (not e!336406))))

(assert (=> b!589219 (= res!376757 (validKeyInArray!0 k!1786))))

(declare-fun b!589220 () Bool)

(declare-fun res!376755 () Bool)

(assert (=> b!589220 (=> (not res!376755) (not e!336407))))

(declare-datatypes ((List!11716 0))(
  ( (Nil!11713) (Cons!11712 (h!12757 (_ BitVec 64)) (t!17944 List!11716)) )
))
(declare-fun arrayNoDuplicates!0 (array!36804 (_ BitVec 32) List!11716) Bool)

(assert (=> b!589220 (= res!376755 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11713))))

(assert (= (and start!53960 res!376756) b!589212))

(assert (= (and b!589212 res!376760) b!589216))

(assert (= (and b!589216 res!376765) b!589219))

(assert (= (and b!589219 res!376757) b!589210))

(assert (= (and b!589210 res!376762) b!589211))

(assert (= (and b!589211 res!376761) b!589207))

(assert (= (and b!589207 res!376759) b!589220))

(assert (= (and b!589220 res!376755) b!589208))

(assert (= (and b!589208 res!376764) b!589215))

(assert (= (and b!589215 res!376766) b!589209))

(assert (= (and b!589209 res!376758) b!589213))

(assert (= (and b!589213 res!376763) b!589218))

(assert (= (and b!589213 c!66593) b!589214))

(assert (= (and b!589213 (not c!66593)) b!589217))

(declare-fun m!567747 () Bool)

(assert (=> b!589220 m!567747))

(declare-fun m!567749 () Bool)

(assert (=> b!589210 m!567749))

(declare-fun m!567751 () Bool)

(assert (=> b!589215 m!567751))

(declare-fun m!567753 () Bool)

(assert (=> b!589215 m!567753))

(declare-fun m!567755 () Bool)

(assert (=> b!589207 m!567755))

(declare-fun m!567757 () Bool)

(assert (=> b!589219 m!567757))

(declare-fun m!567759 () Bool)

(assert (=> b!589216 m!567759))

(assert (=> b!589216 m!567759))

(declare-fun m!567761 () Bool)

(assert (=> b!589216 m!567761))

(declare-fun m!567763 () Bool)

(assert (=> b!589213 m!567763))

(declare-fun m!567765 () Bool)

(assert (=> b!589213 m!567765))

(assert (=> b!589213 m!567759))

(assert (=> b!589213 m!567759))

(declare-fun m!567767 () Bool)

(assert (=> b!589213 m!567767))

(declare-fun m!567769 () Bool)

(assert (=> b!589213 m!567769))

(declare-fun m!567771 () Bool)

(assert (=> b!589213 m!567771))

(declare-fun m!567773 () Bool)

(assert (=> b!589213 m!567773))

(assert (=> b!589213 m!567751))

(declare-fun m!567775 () Bool)

(assert (=> b!589209 m!567775))

(assert (=> b!589209 m!567759))

(assert (=> b!589209 m!567759))

(declare-fun m!567777 () Bool)

(assert (=> b!589209 m!567777))

(declare-fun m!567779 () Bool)

(assert (=> b!589211 m!567779))

(declare-fun m!567781 () Bool)

(assert (=> start!53960 m!567781))

(declare-fun m!567783 () Bool)

(assert (=> start!53960 m!567783))

(declare-fun m!567785 () Bool)

(assert (=> b!589208 m!567785))

(push 1)

