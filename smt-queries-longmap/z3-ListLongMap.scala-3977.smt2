; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53982 () Bool)

(assert start!53982)

(declare-fun b!588828 () Bool)

(declare-fun res!376358 () Bool)

(declare-fun e!336238 () Bool)

(assert (=> b!588828 (=> (not res!376358) (not e!336238))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36771 0))(
  ( (array!36772 (arr!17656 (Array (_ BitVec 32) (_ BitVec 64))) (size!18020 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36771)

(assert (=> b!588828 (= res!376358 (and (= (size!18020 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18020 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18020 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588829 () Bool)

(declare-datatypes ((Unit!18301 0))(
  ( (Unit!18302) )
))
(declare-fun e!336240 () Unit!18301)

(declare-fun Unit!18303 () Unit!18301)

(assert (=> b!588829 (= e!336240 Unit!18303)))

(assert (=> b!588829 false))

(declare-fun b!588830 () Bool)

(declare-fun e!336243 () Bool)

(declare-fun e!336237 () Bool)

(assert (=> b!588830 (= e!336243 e!336237)))

(declare-fun res!376365 () Bool)

(assert (=> b!588830 (=> (not res!376365) (not e!336237))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6052 0))(
  ( (MissingZero!6052 (index!26438 (_ BitVec 32))) (Found!6052 (index!26439 (_ BitVec 32))) (Intermediate!6052 (undefined!6864 Bool) (index!26440 (_ BitVec 32)) (x!55389 (_ BitVec 32))) (Undefined!6052) (MissingVacant!6052 (index!26441 (_ BitVec 32))) )
))
(declare-fun lt!266979 () SeekEntryResult!6052)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588830 (= res!376365 (and (= lt!266979 (Found!6052 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17656 a!2986) index!984) (select (arr!17656 a!2986) j!136))) (not (= (select (arr!17656 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36771 (_ BitVec 32)) SeekEntryResult!6052)

(assert (=> b!588830 (= lt!266979 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17656 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588831 () Bool)

(declare-fun res!376361 () Bool)

(declare-fun e!336239 () Bool)

(assert (=> b!588831 (=> (not res!376361) (not e!336239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36771 (_ BitVec 32)) Bool)

(assert (=> b!588831 (= res!376361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588832 () Bool)

(declare-fun res!376359 () Bool)

(assert (=> b!588832 (=> (not res!376359) (not e!336238))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588832 (= res!376359 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588833 () Bool)

(assert (=> b!588833 (= e!336239 e!336243)))

(declare-fun res!376363 () Bool)

(assert (=> b!588833 (=> (not res!376363) (not e!336243))))

(assert (=> b!588833 (= res!376363 (= (select (store (arr!17656 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!266980 () array!36771)

(assert (=> b!588833 (= lt!266980 (array!36772 (store (arr!17656 a!2986) i!1108 k0!1786) (size!18020 a!2986)))))

(declare-fun b!588834 () Bool)

(declare-fun res!376366 () Bool)

(assert (=> b!588834 (=> (not res!376366) (not e!336238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588834 (= res!376366 (validKeyInArray!0 (select (arr!17656 a!2986) j!136)))))

(declare-fun b!588835 () Bool)

(declare-fun res!376364 () Bool)

(assert (=> b!588835 (=> (not res!376364) (not e!336239))))

(declare-datatypes ((List!11604 0))(
  ( (Nil!11601) (Cons!11600 (h!12648 (_ BitVec 64)) (t!17824 List!11604)) )
))
(declare-fun arrayNoDuplicates!0 (array!36771 (_ BitVec 32) List!11604) Bool)

(assert (=> b!588835 (= res!376364 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11601))))

(declare-fun b!588837 () Bool)

(declare-fun Unit!18304 () Unit!18301)

(assert (=> b!588837 (= e!336240 Unit!18304)))

(declare-fun b!588838 () Bool)

(declare-fun e!336242 () Bool)

(declare-fun lt!266974 () SeekEntryResult!6052)

(assert (=> b!588838 (= e!336242 (= lt!266979 lt!266974))))

(declare-fun b!588839 () Bool)

(declare-fun res!376362 () Bool)

(assert (=> b!588839 (=> (not res!376362) (not e!336239))))

(assert (=> b!588839 (= res!376362 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17656 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588840 () Bool)

(assert (=> b!588840 (= e!336238 e!336239)))

(declare-fun res!376355 () Bool)

(assert (=> b!588840 (=> (not res!376355) (not e!336239))))

(declare-fun lt!266975 () SeekEntryResult!6052)

(assert (=> b!588840 (= res!376355 (or (= lt!266975 (MissingZero!6052 i!1108)) (= lt!266975 (MissingVacant!6052 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36771 (_ BitVec 32)) SeekEntryResult!6052)

(assert (=> b!588840 (= lt!266975 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588841 () Bool)

(declare-fun res!376357 () Bool)

(assert (=> b!588841 (=> (not res!376357) (not e!336238))))

(assert (=> b!588841 (= res!376357 (validKeyInArray!0 k0!1786))))

(declare-fun b!588836 () Bool)

(assert (=> b!588836 (= e!336237 (not true))))

(declare-fun lt!266973 () Unit!18301)

(assert (=> b!588836 (= lt!266973 e!336240)))

(declare-fun c!66605 () Bool)

(declare-fun lt!266976 () (_ BitVec 64))

(assert (=> b!588836 (= c!66605 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!266976 lt!266980 mask!3053) Undefined!6052))))

(assert (=> b!588836 e!336242))

(declare-fun res!376356 () Bool)

(assert (=> b!588836 (=> (not res!376356) (not e!336242))))

(declare-fun lt!266978 () (_ BitVec 32))

(assert (=> b!588836 (= res!376356 (= lt!266974 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266978 vacantSpotIndex!68 lt!266976 lt!266980 mask!3053)))))

(assert (=> b!588836 (= lt!266974 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266978 vacantSpotIndex!68 (select (arr!17656 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!588836 (= lt!266976 (select (store (arr!17656 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!266977 () Unit!18301)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36771 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18301)

(assert (=> b!588836 (= lt!266977 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266978 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588836 (= lt!266978 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!376360 () Bool)

(assert (=> start!53982 (=> (not res!376360) (not e!336238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53982 (= res!376360 (validMask!0 mask!3053))))

(assert (=> start!53982 e!336238))

(assert (=> start!53982 true))

(declare-fun array_inv!13515 (array!36771) Bool)

(assert (=> start!53982 (array_inv!13515 a!2986)))

(assert (= (and start!53982 res!376360) b!588828))

(assert (= (and b!588828 res!376358) b!588834))

(assert (= (and b!588834 res!376366) b!588841))

(assert (= (and b!588841 res!376357) b!588832))

(assert (= (and b!588832 res!376359) b!588840))

(assert (= (and b!588840 res!376355) b!588831))

(assert (= (and b!588831 res!376361) b!588835))

(assert (= (and b!588835 res!376364) b!588839))

(assert (= (and b!588839 res!376362) b!588833))

(assert (= (and b!588833 res!376363) b!588830))

(assert (= (and b!588830 res!376365) b!588836))

(assert (= (and b!588836 res!376356) b!588838))

(assert (= (and b!588836 c!66605) b!588829))

(assert (= (and b!588836 (not c!66605)) b!588837))

(declare-fun m!567551 () Bool)

(assert (=> b!588832 m!567551))

(declare-fun m!567553 () Bool)

(assert (=> b!588839 m!567553))

(declare-fun m!567555 () Bool)

(assert (=> b!588834 m!567555))

(assert (=> b!588834 m!567555))

(declare-fun m!567557 () Bool)

(assert (=> b!588834 m!567557))

(declare-fun m!567559 () Bool)

(assert (=> b!588831 m!567559))

(declare-fun m!567561 () Bool)

(assert (=> b!588841 m!567561))

(declare-fun m!567563 () Bool)

(assert (=> b!588835 m!567563))

(declare-fun m!567565 () Bool)

(assert (=> b!588840 m!567565))

(declare-fun m!567567 () Bool)

(assert (=> b!588836 m!567567))

(declare-fun m!567569 () Bool)

(assert (=> b!588836 m!567569))

(assert (=> b!588836 m!567555))

(declare-fun m!567571 () Bool)

(assert (=> b!588836 m!567571))

(declare-fun m!567573 () Bool)

(assert (=> b!588836 m!567573))

(declare-fun m!567575 () Bool)

(assert (=> b!588836 m!567575))

(assert (=> b!588836 m!567555))

(declare-fun m!567577 () Bool)

(assert (=> b!588836 m!567577))

(declare-fun m!567579 () Bool)

(assert (=> b!588836 m!567579))

(assert (=> b!588833 m!567573))

(declare-fun m!567581 () Bool)

(assert (=> b!588833 m!567581))

(declare-fun m!567583 () Bool)

(assert (=> start!53982 m!567583))

(declare-fun m!567585 () Bool)

(assert (=> start!53982 m!567585))

(declare-fun m!567587 () Bool)

(assert (=> b!588830 m!567587))

(assert (=> b!588830 m!567555))

(assert (=> b!588830 m!567555))

(declare-fun m!567589 () Bool)

(assert (=> b!588830 m!567589))

(check-sat (not b!588835) (not b!588831) (not b!588836) (not b!588832) (not b!588841) (not b!588830) (not b!588840) (not b!588834) (not start!53982))
(check-sat)
