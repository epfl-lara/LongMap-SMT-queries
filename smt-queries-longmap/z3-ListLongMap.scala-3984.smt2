; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54024 () Bool)

(assert start!54024)

(declare-fun b!589712 () Bool)

(declare-fun res!377117 () Bool)

(declare-fun e!336681 () Bool)

(assert (=> b!589712 (=> (not res!377117) (not e!336681))))

(declare-datatypes ((array!36813 0))(
  ( (array!36814 (arr!17677 (Array (_ BitVec 32) (_ BitVec 64))) (size!18041 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36813)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589712 (= res!377117 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589713 () Bool)

(declare-fun e!336682 () Bool)

(declare-fun e!336683 () Bool)

(assert (=> b!589713 (= e!336682 e!336683)))

(declare-fun res!377120 () Bool)

(assert (=> b!589713 (=> (not res!377120) (not e!336683))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6073 0))(
  ( (MissingZero!6073 (index!26522 (_ BitVec 32))) (Found!6073 (index!26523 (_ BitVec 32))) (Intermediate!6073 (undefined!6885 Bool) (index!26524 (_ BitVec 32)) (x!55466 (_ BitVec 32))) (Undefined!6073) (MissingVacant!6073 (index!26525 (_ BitVec 32))) )
))
(declare-fun lt!267480 () SeekEntryResult!6073)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589713 (= res!377120 (and (= lt!267480 (Found!6073 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17677 a!2986) index!984) (select (arr!17677 a!2986) j!136))) (not (= (select (arr!17677 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36813 (_ BitVec 32)) SeekEntryResult!6073)

(assert (=> b!589713 (= lt!267480 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17677 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589714 () Bool)

(declare-fun res!377124 () Bool)

(assert (=> b!589714 (=> (not res!377124) (not e!336681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589714 (= res!377124 (validKeyInArray!0 k0!1786))))

(declare-fun b!589715 () Bool)

(declare-fun e!336686 () Bool)

(assert (=> b!589715 (= e!336681 e!336686)))

(declare-fun res!377115 () Bool)

(assert (=> b!589715 (=> (not res!377115) (not e!336686))))

(declare-fun lt!267484 () SeekEntryResult!6073)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589715 (= res!377115 (or (= lt!267484 (MissingZero!6073 i!1108)) (= lt!267484 (MissingVacant!6073 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36813 (_ BitVec 32)) SeekEntryResult!6073)

(assert (=> b!589715 (= lt!267484 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!589716 () Bool)

(declare-fun res!377125 () Bool)

(assert (=> b!589716 (=> (not res!377125) (not e!336686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36813 (_ BitVec 32)) Bool)

(assert (=> b!589716 (= res!377125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589717 () Bool)

(declare-fun res!377121 () Bool)

(assert (=> b!589717 (=> (not res!377121) (not e!336681))))

(assert (=> b!589717 (= res!377121 (and (= (size!18041 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18041 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18041 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!377116 () Bool)

(assert (=> start!54024 (=> (not res!377116) (not e!336681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54024 (= res!377116 (validMask!0 mask!3053))))

(assert (=> start!54024 e!336681))

(assert (=> start!54024 true))

(declare-fun array_inv!13536 (array!36813) Bool)

(assert (=> start!54024 (array_inv!13536 a!2986)))

(declare-fun b!589718 () Bool)

(declare-datatypes ((Unit!18385 0))(
  ( (Unit!18386) )
))
(declare-fun e!336687 () Unit!18385)

(declare-fun Unit!18387 () Unit!18385)

(assert (=> b!589718 (= e!336687 Unit!18387)))

(declare-fun b!589719 () Bool)

(declare-fun res!377114 () Bool)

(assert (=> b!589719 (=> (not res!377114) (not e!336686))))

(assert (=> b!589719 (= res!377114 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17677 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589720 () Bool)

(declare-fun e!336685 () Bool)

(assert (=> b!589720 (= e!336683 (not e!336685))))

(declare-fun res!377122 () Bool)

(assert (=> b!589720 (=> res!377122 e!336685)))

(assert (=> b!589720 (= res!377122 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun lt!267481 () Unit!18385)

(assert (=> b!589720 (= lt!267481 e!336687)))

(declare-fun lt!267482 () array!36813)

(declare-fun lt!267479 () (_ BitVec 64))

(declare-fun c!66668 () Bool)

(assert (=> b!589720 (= c!66668 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267479 lt!267482 mask!3053) Undefined!6073))))

(declare-fun e!336684 () Bool)

(assert (=> b!589720 e!336684))

(declare-fun res!377123 () Bool)

(assert (=> b!589720 (=> (not res!377123) (not e!336684))))

(declare-fun lt!267477 () SeekEntryResult!6073)

(declare-fun lt!267483 () (_ BitVec 32))

(assert (=> b!589720 (= res!377123 (= lt!267477 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267483 vacantSpotIndex!68 lt!267479 lt!267482 mask!3053)))))

(assert (=> b!589720 (= lt!267477 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267483 vacantSpotIndex!68 (select (arr!17677 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589720 (= lt!267479 (select (store (arr!17677 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267478 () Unit!18385)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36813 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18385)

(assert (=> b!589720 (= lt!267478 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267483 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589720 (= lt!267483 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!589721 () Bool)

(assert (=> b!589721 (= e!336685 (validKeyInArray!0 lt!267479))))

(declare-fun b!589722 () Bool)

(declare-fun res!377119 () Bool)

(assert (=> b!589722 (=> (not res!377119) (not e!336686))))

(declare-datatypes ((List!11625 0))(
  ( (Nil!11622) (Cons!11621 (h!12669 (_ BitVec 64)) (t!17845 List!11625)) )
))
(declare-fun arrayNoDuplicates!0 (array!36813 (_ BitVec 32) List!11625) Bool)

(assert (=> b!589722 (= res!377119 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11622))))

(declare-fun b!589723 () Bool)

(declare-fun res!377113 () Bool)

(assert (=> b!589723 (=> (not res!377113) (not e!336681))))

(assert (=> b!589723 (= res!377113 (validKeyInArray!0 (select (arr!17677 a!2986) j!136)))))

(declare-fun b!589724 () Bool)

(declare-fun Unit!18388 () Unit!18385)

(assert (=> b!589724 (= e!336687 Unit!18388)))

(assert (=> b!589724 false))

(declare-fun b!589725 () Bool)

(assert (=> b!589725 (= e!336684 (= lt!267480 lt!267477))))

(declare-fun b!589726 () Bool)

(assert (=> b!589726 (= e!336686 e!336682)))

(declare-fun res!377118 () Bool)

(assert (=> b!589726 (=> (not res!377118) (not e!336682))))

(assert (=> b!589726 (= res!377118 (= (select (store (arr!17677 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589726 (= lt!267482 (array!36814 (store (arr!17677 a!2986) i!1108 k0!1786) (size!18041 a!2986)))))

(assert (= (and start!54024 res!377116) b!589717))

(assert (= (and b!589717 res!377121) b!589723))

(assert (= (and b!589723 res!377113) b!589714))

(assert (= (and b!589714 res!377124) b!589712))

(assert (= (and b!589712 res!377117) b!589715))

(assert (= (and b!589715 res!377115) b!589716))

(assert (= (and b!589716 res!377125) b!589722))

(assert (= (and b!589722 res!377119) b!589719))

(assert (= (and b!589719 res!377114) b!589726))

(assert (= (and b!589726 res!377118) b!589713))

(assert (= (and b!589713 res!377120) b!589720))

(assert (= (and b!589720 res!377123) b!589725))

(assert (= (and b!589720 c!66668) b!589724))

(assert (= (and b!589720 (not c!66668)) b!589718))

(assert (= (and b!589720 (not res!377122)) b!589721))

(declare-fun m!568391 () Bool)

(assert (=> b!589726 m!568391))

(declare-fun m!568393 () Bool)

(assert (=> b!589726 m!568393))

(declare-fun m!568395 () Bool)

(assert (=> b!589722 m!568395))

(declare-fun m!568397 () Bool)

(assert (=> b!589715 m!568397))

(declare-fun m!568399 () Bool)

(assert (=> b!589714 m!568399))

(declare-fun m!568401 () Bool)

(assert (=> b!589720 m!568401))

(declare-fun m!568403 () Bool)

(assert (=> b!589720 m!568403))

(declare-fun m!568405 () Bool)

(assert (=> b!589720 m!568405))

(declare-fun m!568407 () Bool)

(assert (=> b!589720 m!568407))

(declare-fun m!568409 () Bool)

(assert (=> b!589720 m!568409))

(assert (=> b!589720 m!568391))

(declare-fun m!568411 () Bool)

(assert (=> b!589720 m!568411))

(assert (=> b!589720 m!568407))

(declare-fun m!568413 () Bool)

(assert (=> b!589720 m!568413))

(declare-fun m!568415 () Bool)

(assert (=> start!54024 m!568415))

(declare-fun m!568417 () Bool)

(assert (=> start!54024 m!568417))

(declare-fun m!568419 () Bool)

(assert (=> b!589712 m!568419))

(declare-fun m!568421 () Bool)

(assert (=> b!589716 m!568421))

(assert (=> b!589723 m!568407))

(assert (=> b!589723 m!568407))

(declare-fun m!568423 () Bool)

(assert (=> b!589723 m!568423))

(declare-fun m!568425 () Bool)

(assert (=> b!589721 m!568425))

(declare-fun m!568427 () Bool)

(assert (=> b!589719 m!568427))

(declare-fun m!568429 () Bool)

(assert (=> b!589713 m!568429))

(assert (=> b!589713 m!568407))

(assert (=> b!589713 m!568407))

(declare-fun m!568431 () Bool)

(assert (=> b!589713 m!568431))

(check-sat (not b!589715) (not b!589713) (not b!589722) (not b!589712) (not start!54024) (not b!589716) (not b!589720) (not b!589723) (not b!589714) (not b!589721))
(check-sat)
