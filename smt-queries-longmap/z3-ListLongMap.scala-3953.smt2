; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53712 () Bool)

(assert start!53712)

(declare-fun b!585705 () Bool)

(declare-fun e!334965 () Bool)

(declare-fun e!334964 () Bool)

(assert (=> b!585705 (= e!334965 e!334964)))

(declare-fun res!373669 () Bool)

(assert (=> b!585705 (=> (not res!373669) (not e!334964))))

(declare-datatypes ((SeekEntryResult!6025 0))(
  ( (MissingZero!6025 (index!26327 (_ BitVec 32))) (Found!6025 (index!26328 (_ BitVec 32))) (Intermediate!6025 (undefined!6837 Bool) (index!26329 (_ BitVec 32)) (x!55153 (_ BitVec 32))) (Undefined!6025) (MissingVacant!6025 (index!26330 (_ BitVec 32))) )
))
(declare-fun lt!265734 () SeekEntryResult!6025)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585705 (= res!373669 (or (= lt!265734 (MissingZero!6025 i!1108)) (= lt!265734 (MissingVacant!6025 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36627 0))(
  ( (array!36628 (arr!17588 (Array (_ BitVec 32) (_ BitVec 64))) (size!17953 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36627)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36627 (_ BitVec 32)) SeekEntryResult!6025)

(assert (=> b!585705 (= lt!265734 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585706 () Bool)

(declare-fun res!373670 () Bool)

(assert (=> b!585706 (=> (not res!373670) (not e!334965))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585706 (= res!373670 (validKeyInArray!0 k0!1786))))

(declare-fun b!585707 () Bool)

(declare-fun res!373664 () Bool)

(assert (=> b!585707 (=> (not res!373664) (not e!334964))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36627 (_ BitVec 32)) SeekEntryResult!6025)

(assert (=> b!585707 (= res!373664 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17588 a!2986) j!136) a!2986 mask!3053) (Found!6025 j!136)))))

(declare-fun b!585708 () Bool)

(declare-fun res!373665 () Bool)

(assert (=> b!585708 (=> (not res!373665) (not e!334965))))

(assert (=> b!585708 (= res!373665 (and (= (size!17953 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17953 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17953 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585709 () Bool)

(declare-fun res!373671 () Bool)

(assert (=> b!585709 (=> (not res!373671) (not e!334964))))

(declare-datatypes ((List!11668 0))(
  ( (Nil!11665) (Cons!11664 (h!12709 (_ BitVec 64)) (t!17887 List!11668)) )
))
(declare-fun arrayNoDuplicates!0 (array!36627 (_ BitVec 32) List!11668) Bool)

(assert (=> b!585709 (= res!373671 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11665))))

(declare-fun b!585710 () Bool)

(declare-fun res!373668 () Bool)

(assert (=> b!585710 (=> (not res!373668) (not e!334964))))

(assert (=> b!585710 (= res!373668 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17588 a!2986) index!984) (select (arr!17588 a!2986) j!136))) (not (= (select (arr!17588 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585712 () Bool)

(assert (=> b!585712 (= e!334964 (not true))))

(declare-fun lt!265735 () (_ BitVec 32))

(assert (=> b!585712 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265735 vacantSpotIndex!68 (select (arr!17588 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265735 vacantSpotIndex!68 (select (store (arr!17588 a!2986) i!1108 k0!1786) j!136) (array!36628 (store (arr!17588 a!2986) i!1108 k0!1786) (size!17953 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18156 0))(
  ( (Unit!18157) )
))
(declare-fun lt!265733 () Unit!18156)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36627 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18156)

(assert (=> b!585712 (= lt!265733 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265735 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585712 (= lt!265735 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585713 () Bool)

(declare-fun res!373667 () Bool)

(assert (=> b!585713 (=> (not res!373667) (not e!334964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36627 (_ BitVec 32)) Bool)

(assert (=> b!585713 (= res!373667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585714 () Bool)

(declare-fun res!373666 () Bool)

(assert (=> b!585714 (=> (not res!373666) (not e!334965))))

(declare-fun arrayContainsKey!0 (array!36627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585714 (= res!373666 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585715 () Bool)

(declare-fun res!373673 () Bool)

(assert (=> b!585715 (=> (not res!373673) (not e!334965))))

(assert (=> b!585715 (= res!373673 (validKeyInArray!0 (select (arr!17588 a!2986) j!136)))))

(declare-fun b!585711 () Bool)

(declare-fun res!373663 () Bool)

(assert (=> b!585711 (=> (not res!373663) (not e!334964))))

(assert (=> b!585711 (= res!373663 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17588 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17588 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!373672 () Bool)

(assert (=> start!53712 (=> (not res!373672) (not e!334965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53712 (= res!373672 (validMask!0 mask!3053))))

(assert (=> start!53712 e!334965))

(assert (=> start!53712 true))

(declare-fun array_inv!13471 (array!36627) Bool)

(assert (=> start!53712 (array_inv!13471 a!2986)))

(assert (= (and start!53712 res!373672) b!585708))

(assert (= (and b!585708 res!373665) b!585715))

(assert (= (and b!585715 res!373673) b!585706))

(assert (= (and b!585706 res!373670) b!585714))

(assert (= (and b!585714 res!373666) b!585705))

(assert (= (and b!585705 res!373669) b!585713))

(assert (= (and b!585713 res!373667) b!585709))

(assert (= (and b!585709 res!373671) b!585711))

(assert (= (and b!585711 res!373663) b!585707))

(assert (= (and b!585707 res!373664) b!585710))

(assert (= (and b!585710 res!373668) b!585712))

(declare-fun m!563479 () Bool)

(assert (=> b!585705 m!563479))

(declare-fun m!563481 () Bool)

(assert (=> b!585707 m!563481))

(assert (=> b!585707 m!563481))

(declare-fun m!563483 () Bool)

(assert (=> b!585707 m!563483))

(declare-fun m!563485 () Bool)

(assert (=> b!585709 m!563485))

(declare-fun m!563487 () Bool)

(assert (=> b!585712 m!563487))

(declare-fun m!563489 () Bool)

(assert (=> b!585712 m!563489))

(assert (=> b!585712 m!563481))

(declare-fun m!563491 () Bool)

(assert (=> b!585712 m!563491))

(declare-fun m!563493 () Bool)

(assert (=> b!585712 m!563493))

(assert (=> b!585712 m!563481))

(declare-fun m!563495 () Bool)

(assert (=> b!585712 m!563495))

(assert (=> b!585712 m!563489))

(declare-fun m!563497 () Bool)

(assert (=> b!585712 m!563497))

(declare-fun m!563499 () Bool)

(assert (=> start!53712 m!563499))

(declare-fun m!563501 () Bool)

(assert (=> start!53712 m!563501))

(declare-fun m!563503 () Bool)

(assert (=> b!585710 m!563503))

(assert (=> b!585710 m!563481))

(declare-fun m!563505 () Bool)

(assert (=> b!585714 m!563505))

(declare-fun m!563507 () Bool)

(assert (=> b!585713 m!563507))

(declare-fun m!563509 () Bool)

(assert (=> b!585706 m!563509))

(declare-fun m!563511 () Bool)

(assert (=> b!585711 m!563511))

(assert (=> b!585711 m!563491))

(declare-fun m!563513 () Bool)

(assert (=> b!585711 m!563513))

(assert (=> b!585715 m!563481))

(assert (=> b!585715 m!563481))

(declare-fun m!563515 () Bool)

(assert (=> b!585715 m!563515))

(check-sat (not b!585709) (not b!585715) (not b!585714) (not b!585712) (not start!53712) (not b!585706) (not b!585713) (not b!585705) (not b!585707))
(check-sat)
