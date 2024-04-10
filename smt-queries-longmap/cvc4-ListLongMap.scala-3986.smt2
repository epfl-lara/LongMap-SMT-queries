; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53990 () Bool)

(assert start!53990)

(declare-fun b!589863 () Bool)

(declare-fun res!377326 () Bool)

(declare-fun e!336745 () Bool)

(assert (=> b!589863 (=> (not res!377326) (not e!336745))))

(declare-datatypes ((array!36834 0))(
  ( (array!36835 (arr!17690 (Array (_ BitVec 32) (_ BitVec 64))) (size!18054 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36834)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589863 (= res!377326 (validKeyInArray!0 (select (arr!17690 a!2986) j!136)))))

(declare-fun b!589864 () Bool)

(declare-fun e!336746 () Bool)

(declare-fun e!336747 () Bool)

(assert (=> b!589864 (= e!336746 e!336747)))

(declare-fun res!377330 () Bool)

(assert (=> b!589864 (=> (not res!377330) (not e!336747))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!589864 (= res!377330 (= (select (store (arr!17690 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267591 () array!36834)

(assert (=> b!589864 (= lt!267591 (array!36835 (store (arr!17690 a!2986) i!1108 k!1786) (size!18054 a!2986)))))

(declare-fun b!589865 () Bool)

(declare-fun res!377324 () Bool)

(assert (=> b!589865 (=> (not res!377324) (not e!336746))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36834 (_ BitVec 32)) Bool)

(assert (=> b!589865 (= res!377324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589866 () Bool)

(declare-fun res!377333 () Bool)

(assert (=> b!589866 (=> (not res!377333) (not e!336745))))

(declare-fun arrayContainsKey!0 (array!36834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589866 (= res!377333 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589867 () Bool)

(declare-fun e!336744 () Bool)

(assert (=> b!589867 (= e!336747 e!336744)))

(declare-fun res!377321 () Bool)

(assert (=> b!589867 (=> (not res!377321) (not e!336744))))

(declare-datatypes ((SeekEntryResult!6130 0))(
  ( (MissingZero!6130 (index!26750 (_ BitVec 32))) (Found!6130 (index!26751 (_ BitVec 32))) (Intermediate!6130 (undefined!6942 Bool) (index!26752 (_ BitVec 32)) (x!55536 (_ BitVec 32))) (Undefined!6130) (MissingVacant!6130 (index!26753 (_ BitVec 32))) )
))
(declare-fun lt!267589 () SeekEntryResult!6130)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589867 (= res!377321 (and (= lt!267589 (Found!6130 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17690 a!2986) index!984) (select (arr!17690 a!2986) j!136))) (not (= (select (arr!17690 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36834 (_ BitVec 32)) SeekEntryResult!6130)

(assert (=> b!589867 (= lt!267589 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17690 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589868 () Bool)

(declare-fun res!377323 () Bool)

(assert (=> b!589868 (=> (not res!377323) (not e!336746))))

(declare-datatypes ((List!11731 0))(
  ( (Nil!11728) (Cons!11727 (h!12772 (_ BitVec 64)) (t!17959 List!11731)) )
))
(declare-fun arrayNoDuplicates!0 (array!36834 (_ BitVec 32) List!11731) Bool)

(assert (=> b!589868 (= res!377323 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11728))))

(declare-fun b!589869 () Bool)

(declare-fun res!377327 () Bool)

(assert (=> b!589869 (=> (not res!377327) (not e!336745))))

(assert (=> b!589869 (= res!377327 (and (= (size!18054 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18054 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18054 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589870 () Bool)

(assert (=> b!589870 (= e!336745 e!336746)))

(declare-fun res!377322 () Bool)

(assert (=> b!589870 (=> (not res!377322) (not e!336746))))

(declare-fun lt!267590 () SeekEntryResult!6130)

(assert (=> b!589870 (= res!377322 (or (= lt!267590 (MissingZero!6130 i!1108)) (= lt!267590 (MissingVacant!6130 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36834 (_ BitVec 32)) SeekEntryResult!6130)

(assert (=> b!589870 (= lt!267590 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!589871 () Bool)

(declare-fun res!377332 () Bool)

(assert (=> b!589871 (=> (not res!377332) (not e!336746))))

(assert (=> b!589871 (= res!377332 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17690 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589872 () Bool)

(declare-fun e!336748 () Bool)

(assert (=> b!589872 (= e!336744 (not e!336748))))

(declare-fun res!377325 () Bool)

(assert (=> b!589872 (=> res!377325 e!336748)))

(declare-fun lt!267586 () SeekEntryResult!6130)

(assert (=> b!589872 (= res!377325 (not (= lt!267586 (Found!6130 index!984))))))

(declare-datatypes ((Unit!18438 0))(
  ( (Unit!18439) )
))
(declare-fun lt!267588 () Unit!18438)

(declare-fun e!336749 () Unit!18438)

(assert (=> b!589872 (= lt!267588 e!336749)))

(declare-fun c!66638 () Bool)

(assert (=> b!589872 (= c!66638 (= lt!267586 Undefined!6130))))

(declare-fun lt!267585 () (_ BitVec 64))

(assert (=> b!589872 (= lt!267586 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267585 lt!267591 mask!3053))))

(declare-fun e!336743 () Bool)

(assert (=> b!589872 e!336743))

(declare-fun res!377331 () Bool)

(assert (=> b!589872 (=> (not res!377331) (not e!336743))))

(declare-fun lt!267584 () (_ BitVec 32))

(declare-fun lt!267592 () SeekEntryResult!6130)

(assert (=> b!589872 (= res!377331 (= lt!267592 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267584 vacantSpotIndex!68 lt!267585 lt!267591 mask!3053)))))

(assert (=> b!589872 (= lt!267592 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267584 vacantSpotIndex!68 (select (arr!17690 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589872 (= lt!267585 (select (store (arr!17690 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267587 () Unit!18438)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36834 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18438)

(assert (=> b!589872 (= lt!267587 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267584 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589872 (= lt!267584 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589874 () Bool)

(declare-fun res!377329 () Bool)

(assert (=> b!589874 (=> (not res!377329) (not e!336745))))

(assert (=> b!589874 (= res!377329 (validKeyInArray!0 k!1786))))

(declare-fun b!589875 () Bool)

(assert (=> b!589875 (= e!336748 true)))

(assert (=> b!589875 (= (select (store (arr!17690 a!2986) i!1108 k!1786) index!984) (select (arr!17690 a!2986) j!136))))

(declare-fun b!589876 () Bool)

(assert (=> b!589876 (= e!336743 (= lt!267589 lt!267592))))

(declare-fun b!589877 () Bool)

(declare-fun Unit!18440 () Unit!18438)

(assert (=> b!589877 (= e!336749 Unit!18440)))

(declare-fun res!377328 () Bool)

(assert (=> start!53990 (=> (not res!377328) (not e!336745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53990 (= res!377328 (validMask!0 mask!3053))))

(assert (=> start!53990 e!336745))

(assert (=> start!53990 true))

(declare-fun array_inv!13486 (array!36834) Bool)

(assert (=> start!53990 (array_inv!13486 a!2986)))

(declare-fun b!589873 () Bool)

(declare-fun Unit!18441 () Unit!18438)

(assert (=> b!589873 (= e!336749 Unit!18441)))

(assert (=> b!589873 false))

(assert (= (and start!53990 res!377328) b!589869))

(assert (= (and b!589869 res!377327) b!589863))

(assert (= (and b!589863 res!377326) b!589874))

(assert (= (and b!589874 res!377329) b!589866))

(assert (= (and b!589866 res!377333) b!589870))

(assert (= (and b!589870 res!377322) b!589865))

(assert (= (and b!589865 res!377324) b!589868))

(assert (= (and b!589868 res!377323) b!589871))

(assert (= (and b!589871 res!377332) b!589864))

(assert (= (and b!589864 res!377330) b!589867))

(assert (= (and b!589867 res!377321) b!589872))

(assert (= (and b!589872 res!377331) b!589876))

(assert (= (and b!589872 c!66638) b!589873))

(assert (= (and b!589872 (not c!66638)) b!589877))

(assert (= (and b!589872 (not res!377325)) b!589875))

(declare-fun m!568363 () Bool)

(assert (=> b!589870 m!568363))

(declare-fun m!568365 () Bool)

(assert (=> b!589871 m!568365))

(declare-fun m!568367 () Bool)

(assert (=> b!589867 m!568367))

(declare-fun m!568369 () Bool)

(assert (=> b!589867 m!568369))

(assert (=> b!589867 m!568369))

(declare-fun m!568371 () Bool)

(assert (=> b!589867 m!568371))

(declare-fun m!568373 () Bool)

(assert (=> start!53990 m!568373))

(declare-fun m!568375 () Bool)

(assert (=> start!53990 m!568375))

(declare-fun m!568377 () Bool)

(assert (=> b!589866 m!568377))

(declare-fun m!568379 () Bool)

(assert (=> b!589874 m!568379))

(declare-fun m!568381 () Bool)

(assert (=> b!589865 m!568381))

(declare-fun m!568383 () Bool)

(assert (=> b!589875 m!568383))

(declare-fun m!568385 () Bool)

(assert (=> b!589875 m!568385))

(assert (=> b!589875 m!568369))

(declare-fun m!568387 () Bool)

(assert (=> b!589868 m!568387))

(assert (=> b!589863 m!568369))

(assert (=> b!589863 m!568369))

(declare-fun m!568389 () Bool)

(assert (=> b!589863 m!568389))

(assert (=> b!589864 m!568383))

(declare-fun m!568391 () Bool)

(assert (=> b!589864 m!568391))

(declare-fun m!568393 () Bool)

(assert (=> b!589872 m!568393))

(declare-fun m!568395 () Bool)

(assert (=> b!589872 m!568395))

(assert (=> b!589872 m!568369))

(declare-fun m!568397 () Bool)

(assert (=> b!589872 m!568397))

(assert (=> b!589872 m!568383))

(declare-fun m!568399 () Bool)

(assert (=> b!589872 m!568399))

(assert (=> b!589872 m!568369))

(declare-fun m!568401 () Bool)

(assert (=> b!589872 m!568401))

(declare-fun m!568403 () Bool)

(assert (=> b!589872 m!568403))

(push 1)

