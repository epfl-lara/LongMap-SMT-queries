; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53970 () Bool)

(assert start!53970)

(declare-fun b!589502 () Bool)

(declare-fun e!336521 () Bool)

(declare-datatypes ((SeekEntryResult!6124 0))(
  ( (MissingZero!6124 (index!26726 (_ BitVec 32))) (Found!6124 (index!26727 (_ BitVec 32))) (Intermediate!6124 (undefined!6936 Bool) (index!26728 (_ BitVec 32)) (x!55525 (_ BitVec 32))) (Undefined!6124) (MissingVacant!6124 (index!26729 (_ BitVec 32))) )
))
(declare-fun lt!267299 () SeekEntryResult!6124)

(declare-fun lt!267297 () SeekEntryResult!6124)

(assert (=> b!589502 (= e!336521 (= lt!267299 lt!267297))))

(declare-fun b!589503 () Bool)

(declare-fun res!377116 () Bool)

(declare-fun e!336527 () Bool)

(assert (=> b!589503 (=> (not res!377116) (not e!336527))))

(declare-datatypes ((array!36828 0))(
  ( (array!36829 (arr!17687 (Array (_ BitVec 32) (_ BitVec 64))) (size!18052 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36828)

(declare-datatypes ((List!11767 0))(
  ( (Nil!11764) (Cons!11763 (h!12808 (_ BitVec 64)) (t!17986 List!11767)) )
))
(declare-fun arrayNoDuplicates!0 (array!36828 (_ BitVec 32) List!11767) Bool)

(assert (=> b!589503 (= res!377116 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11764))))

(declare-fun b!589505 () Bool)

(declare-fun res!377125 () Bool)

(declare-fun e!336528 () Bool)

(assert (=> b!589505 (=> (not res!377125) (not e!336528))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36828 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589505 (= res!377125 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589506 () Bool)

(declare-fun e!336523 () Bool)

(declare-fun e!336526 () Bool)

(assert (=> b!589506 (= e!336523 e!336526)))

(declare-fun res!377118 () Bool)

(assert (=> b!589506 (=> (not res!377118) (not e!336526))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589506 (= res!377118 (and (= lt!267299 (Found!6124 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17687 a!2986) index!984) (select (arr!17687 a!2986) j!136))) (not (= (select (arr!17687 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36828 (_ BitVec 32)) SeekEntryResult!6124)

(assert (=> b!589506 (= lt!267299 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17687 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589507 () Bool)

(declare-fun res!377126 () Bool)

(assert (=> b!589507 (=> (not res!377126) (not e!336528))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589507 (= res!377126 (validKeyInArray!0 k0!1786))))

(declare-fun b!589508 () Bool)

(declare-fun res!377120 () Bool)

(assert (=> b!589508 (=> (not res!377120) (not e!336528))))

(assert (=> b!589508 (= res!377120 (validKeyInArray!0 (select (arr!17687 a!2986) j!136)))))

(declare-fun b!589509 () Bool)

(declare-fun res!377121 () Bool)

(assert (=> b!589509 (=> (not res!377121) (not e!336527))))

(assert (=> b!589509 (= res!377121 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17687 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589510 () Bool)

(assert (=> b!589510 (= e!336527 e!336523)))

(declare-fun res!377117 () Bool)

(assert (=> b!589510 (=> (not res!377117) (not e!336523))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589510 (= res!377117 (= (select (store (arr!17687 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267296 () array!36828)

(assert (=> b!589510 (= lt!267296 (array!36829 (store (arr!17687 a!2986) i!1108 k0!1786) (size!18052 a!2986)))))

(declare-fun b!589504 () Bool)

(assert (=> b!589504 (= e!336528 e!336527)))

(declare-fun res!377115 () Bool)

(assert (=> b!589504 (=> (not res!377115) (not e!336527))))

(declare-fun lt!267304 () SeekEntryResult!6124)

(assert (=> b!589504 (= res!377115 (or (= lt!267304 (MissingZero!6124 i!1108)) (= lt!267304 (MissingVacant!6124 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36828 (_ BitVec 32)) SeekEntryResult!6124)

(assert (=> b!589504 (= lt!267304 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!377119 () Bool)

(assert (=> start!53970 (=> (not res!377119) (not e!336528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53970 (= res!377119 (validMask!0 mask!3053))))

(assert (=> start!53970 e!336528))

(assert (=> start!53970 true))

(declare-fun array_inv!13570 (array!36828) Bool)

(assert (=> start!53970 (array_inv!13570 a!2986)))

(declare-fun b!589511 () Bool)

(declare-fun res!377124 () Bool)

(assert (=> b!589511 (=> (not res!377124) (not e!336527))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36828 (_ BitVec 32)) Bool)

(assert (=> b!589511 (= res!377124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589512 () Bool)

(declare-fun e!336525 () Bool)

(assert (=> b!589512 (= e!336526 (not e!336525))))

(declare-fun res!377122 () Bool)

(assert (=> b!589512 (=> res!377122 e!336525)))

(declare-fun lt!267300 () SeekEntryResult!6124)

(assert (=> b!589512 (= res!377122 (not (= lt!267300 (Found!6124 index!984))))))

(declare-datatypes ((Unit!18408 0))(
  ( (Unit!18409) )
))
(declare-fun lt!267303 () Unit!18408)

(declare-fun e!336524 () Unit!18408)

(assert (=> b!589512 (= lt!267303 e!336524)))

(declare-fun c!66561 () Bool)

(assert (=> b!589512 (= c!66561 (= lt!267300 Undefined!6124))))

(declare-fun lt!267301 () (_ BitVec 64))

(assert (=> b!589512 (= lt!267300 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267301 lt!267296 mask!3053))))

(assert (=> b!589512 e!336521))

(declare-fun res!377123 () Bool)

(assert (=> b!589512 (=> (not res!377123) (not e!336521))))

(declare-fun lt!267298 () (_ BitVec 32))

(assert (=> b!589512 (= res!377123 (= lt!267297 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267298 vacantSpotIndex!68 lt!267301 lt!267296 mask!3053)))))

(assert (=> b!589512 (= lt!267297 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267298 vacantSpotIndex!68 (select (arr!17687 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589512 (= lt!267301 (select (store (arr!17687 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267302 () Unit!18408)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36828 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18408)

(assert (=> b!589512 (= lt!267302 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267298 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589512 (= lt!267298 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589513 () Bool)

(declare-fun Unit!18410 () Unit!18408)

(assert (=> b!589513 (= e!336524 Unit!18410)))

(assert (=> b!589513 false))

(declare-fun b!589514 () Bool)

(declare-fun res!377114 () Bool)

(assert (=> b!589514 (=> (not res!377114) (not e!336528))))

(assert (=> b!589514 (= res!377114 (and (= (size!18052 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18052 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18052 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589515 () Bool)

(assert (=> b!589515 (= e!336525 true)))

(assert (=> b!589515 (= (select (store (arr!17687 a!2986) i!1108 k0!1786) index!984) (select (arr!17687 a!2986) j!136))))

(declare-fun b!589516 () Bool)

(declare-fun Unit!18411 () Unit!18408)

(assert (=> b!589516 (= e!336524 Unit!18411)))

(assert (= (and start!53970 res!377119) b!589514))

(assert (= (and b!589514 res!377114) b!589508))

(assert (= (and b!589508 res!377120) b!589507))

(assert (= (and b!589507 res!377126) b!589505))

(assert (= (and b!589505 res!377125) b!589504))

(assert (= (and b!589504 res!377115) b!589511))

(assert (= (and b!589511 res!377124) b!589503))

(assert (= (and b!589503 res!377116) b!589509))

(assert (= (and b!589509 res!377121) b!589510))

(assert (= (and b!589510 res!377117) b!589506))

(assert (= (and b!589506 res!377118) b!589512))

(assert (= (and b!589512 res!377123) b!589502))

(assert (= (and b!589512 c!66561) b!589513))

(assert (= (and b!589512 (not c!66561)) b!589516))

(assert (= (and b!589512 (not res!377122)) b!589515))

(declare-fun m!567493 () Bool)

(assert (=> b!589506 m!567493))

(declare-fun m!567495 () Bool)

(assert (=> b!589506 m!567495))

(assert (=> b!589506 m!567495))

(declare-fun m!567497 () Bool)

(assert (=> b!589506 m!567497))

(declare-fun m!567499 () Bool)

(assert (=> b!589510 m!567499))

(declare-fun m!567501 () Bool)

(assert (=> b!589510 m!567501))

(declare-fun m!567503 () Bool)

(assert (=> b!589509 m!567503))

(declare-fun m!567505 () Bool)

(assert (=> b!589505 m!567505))

(declare-fun m!567507 () Bool)

(assert (=> b!589504 m!567507))

(declare-fun m!567509 () Bool)

(assert (=> b!589511 m!567509))

(declare-fun m!567511 () Bool)

(assert (=> start!53970 m!567511))

(declare-fun m!567513 () Bool)

(assert (=> start!53970 m!567513))

(declare-fun m!567515 () Bool)

(assert (=> b!589503 m!567515))

(assert (=> b!589508 m!567495))

(assert (=> b!589508 m!567495))

(declare-fun m!567517 () Bool)

(assert (=> b!589508 m!567517))

(declare-fun m!567519 () Bool)

(assert (=> b!589512 m!567519))

(declare-fun m!567521 () Bool)

(assert (=> b!589512 m!567521))

(assert (=> b!589512 m!567495))

(assert (=> b!589512 m!567499))

(assert (=> b!589512 m!567495))

(declare-fun m!567523 () Bool)

(assert (=> b!589512 m!567523))

(declare-fun m!567525 () Bool)

(assert (=> b!589512 m!567525))

(declare-fun m!567527 () Bool)

(assert (=> b!589512 m!567527))

(declare-fun m!567529 () Bool)

(assert (=> b!589512 m!567529))

(assert (=> b!589515 m!567499))

(declare-fun m!567531 () Bool)

(assert (=> b!589515 m!567531))

(assert (=> b!589515 m!567495))

(declare-fun m!567533 () Bool)

(assert (=> b!589507 m!567533))

(check-sat (not b!589505) (not b!589504) (not b!589506) (not b!589512) (not b!589508) (not b!589511) (not b!589503) (not b!589507) (not start!53970))
(check-sat)
