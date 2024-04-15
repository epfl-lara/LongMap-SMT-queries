; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57704 () Bool)

(assert start!57704)

(declare-fun b!638127 () Bool)

(declare-fun e!365121 () Bool)

(declare-fun e!365123 () Bool)

(assert (=> b!638127 (= e!365121 e!365123)))

(declare-fun res!413121 () Bool)

(assert (=> b!638127 (=> res!413121 e!365123)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!294993 () (_ BitVec 64))

(declare-fun lt!294991 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38286 0))(
  ( (array!38287 (arr!18365 (Array (_ BitVec 32) (_ BitVec 64))) (size!18730 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38286)

(assert (=> b!638127 (= res!413121 (or (not (= (select (arr!18365 a!2986) j!136) lt!294991)) (not (= (select (arr!18365 a!2986) j!136) lt!294993)) (bvsge j!136 index!984)))))

(declare-fun res!413117 () Bool)

(declare-fun e!365120 () Bool)

(assert (=> start!57704 (=> (not res!413117) (not e!365120))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57704 (= res!413117 (validMask!0 mask!3053))))

(assert (=> start!57704 e!365120))

(assert (=> start!57704 true))

(declare-fun array_inv!14248 (array!38286) Bool)

(assert (=> start!57704 (array_inv!14248 a!2986)))

(declare-fun b!638128 () Bool)

(declare-fun e!365115 () Bool)

(assert (=> b!638128 (= e!365115 true)))

(declare-fun lt!294995 () array!38286)

(declare-datatypes ((List!12445 0))(
  ( (Nil!12442) (Cons!12441 (h!13486 (_ BitVec 64)) (t!18664 List!12445)) )
))
(declare-fun arrayNoDuplicates!0 (array!38286 (_ BitVec 32) List!12445) Bool)

(assert (=> b!638128 (arrayNoDuplicates!0 lt!294995 #b00000000000000000000000000000000 Nil!12442)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((Unit!21536 0))(
  ( (Unit!21537) )
))
(declare-fun lt!294994 () Unit!21536)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38286 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12445) Unit!21536)

(assert (=> b!638128 (= lt!294994 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12442))))

(declare-fun arrayContainsKey!0 (array!38286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638128 (arrayContainsKey!0 lt!294995 (select (arr!18365 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294986 () Unit!21536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38286 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21536)

(assert (=> b!638128 (= lt!294986 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294995 (select (arr!18365 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638129 () Bool)

(declare-fun res!413118 () Bool)

(assert (=> b!638129 (=> (not res!413118) (not e!365120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638129 (= res!413118 (validKeyInArray!0 (select (arr!18365 a!2986) j!136)))))

(declare-fun b!638130 () Bool)

(declare-fun res!413114 () Bool)

(assert (=> b!638130 (=> (not res!413114) (not e!365120))))

(assert (=> b!638130 (= res!413114 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!638131 () Bool)

(declare-fun e!365126 () Bool)

(assert (=> b!638131 (= e!365126 (arrayContainsKey!0 lt!294995 (select (arr!18365 a!2986) j!136) index!984))))

(declare-fun b!638132 () Bool)

(declare-fun e!365116 () Bool)

(declare-datatypes ((SeekEntryResult!6802 0))(
  ( (MissingZero!6802 (index!29522 (_ BitVec 32))) (Found!6802 (index!29523 (_ BitVec 32))) (Intermediate!6802 (undefined!7614 Bool) (index!29524 (_ BitVec 32)) (x!58287 (_ BitVec 32))) (Undefined!6802) (MissingVacant!6802 (index!29525 (_ BitVec 32))) )
))
(declare-fun lt!294992 () SeekEntryResult!6802)

(declare-fun lt!294987 () SeekEntryResult!6802)

(assert (=> b!638132 (= e!365116 (= lt!294992 lt!294987))))

(declare-fun b!638133 () Bool)

(declare-fun e!365124 () Bool)

(declare-fun e!365118 () Bool)

(assert (=> b!638133 (= e!365124 e!365118)))

(declare-fun res!413109 () Bool)

(assert (=> b!638133 (=> (not res!413109) (not e!365118))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!638133 (= res!413109 (and (= lt!294992 (Found!6802 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18365 a!2986) index!984) (select (arr!18365 a!2986) j!136))) (not (= (select (arr!18365 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38286 (_ BitVec 32)) SeekEntryResult!6802)

(assert (=> b!638133 (= lt!294992 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18365 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638134 () Bool)

(declare-fun res!413115 () Bool)

(declare-fun e!365117 () Bool)

(assert (=> b!638134 (=> (not res!413115) (not e!365117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38286 (_ BitVec 32)) Bool)

(assert (=> b!638134 (= res!413115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638135 () Bool)

(declare-fun e!365125 () Bool)

(assert (=> b!638135 (= e!365125 e!365115)))

(declare-fun res!413125 () Bool)

(assert (=> b!638135 (=> res!413125 e!365115)))

(assert (=> b!638135 (= res!413125 (or (not (= (select (arr!18365 a!2986) j!136) lt!294991)) (not (= (select (arr!18365 a!2986) j!136) lt!294993)) (bvsge j!136 index!984)))))

(assert (=> b!638135 e!365121))

(declare-fun res!413122 () Bool)

(assert (=> b!638135 (=> (not res!413122) (not e!365121))))

(assert (=> b!638135 (= res!413122 (= lt!294993 (select (arr!18365 a!2986) j!136)))))

(assert (=> b!638135 (= lt!294993 (select (store (arr!18365 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!638136 () Bool)

(assert (=> b!638136 (= e!365117 e!365124)))

(declare-fun res!413111 () Bool)

(assert (=> b!638136 (=> (not res!413111) (not e!365124))))

(assert (=> b!638136 (= res!413111 (= (select (store (arr!18365 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638136 (= lt!294995 (array!38287 (store (arr!18365 a!2986) i!1108 k0!1786) (size!18730 a!2986)))))

(declare-fun b!638137 () Bool)

(declare-fun e!365119 () Unit!21536)

(declare-fun Unit!21538 () Unit!21536)

(assert (=> b!638137 (= e!365119 Unit!21538)))

(declare-fun b!638138 () Bool)

(assert (=> b!638138 (= e!365123 e!365126)))

(declare-fun res!413112 () Bool)

(assert (=> b!638138 (=> (not res!413112) (not e!365126))))

(assert (=> b!638138 (= res!413112 (arrayContainsKey!0 lt!294995 (select (arr!18365 a!2986) j!136) j!136))))

(declare-fun b!638139 () Bool)

(assert (=> b!638139 (= e!365118 (not e!365125))))

(declare-fun res!413120 () Bool)

(assert (=> b!638139 (=> res!413120 e!365125)))

(declare-fun lt!294989 () SeekEntryResult!6802)

(assert (=> b!638139 (= res!413120 (not (= lt!294989 (Found!6802 index!984))))))

(declare-fun lt!294990 () Unit!21536)

(assert (=> b!638139 (= lt!294990 e!365119)))

(declare-fun c!72876 () Bool)

(assert (=> b!638139 (= c!72876 (= lt!294989 Undefined!6802))))

(assert (=> b!638139 (= lt!294989 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294991 lt!294995 mask!3053))))

(assert (=> b!638139 e!365116))

(declare-fun res!413119 () Bool)

(assert (=> b!638139 (=> (not res!413119) (not e!365116))))

(declare-fun lt!294996 () (_ BitVec 32))

(assert (=> b!638139 (= res!413119 (= lt!294987 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294996 vacantSpotIndex!68 lt!294991 lt!294995 mask!3053)))))

(assert (=> b!638139 (= lt!294987 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294996 vacantSpotIndex!68 (select (arr!18365 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!638139 (= lt!294991 (select (store (arr!18365 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294988 () Unit!21536)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38286 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21536)

(assert (=> b!638139 (= lt!294988 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294996 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638139 (= lt!294996 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!638140 () Bool)

(declare-fun res!413123 () Bool)

(assert (=> b!638140 (=> (not res!413123) (not e!365120))))

(assert (=> b!638140 (= res!413123 (validKeyInArray!0 k0!1786))))

(declare-fun b!638141 () Bool)

(declare-fun res!413110 () Bool)

(assert (=> b!638141 (=> (not res!413110) (not e!365120))))

(assert (=> b!638141 (= res!413110 (and (= (size!18730 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18730 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18730 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638142 () Bool)

(declare-fun res!413113 () Bool)

(assert (=> b!638142 (=> (not res!413113) (not e!365117))))

(assert (=> b!638142 (= res!413113 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18365 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638143 () Bool)

(declare-fun Unit!21539 () Unit!21536)

(assert (=> b!638143 (= e!365119 Unit!21539)))

(assert (=> b!638143 false))

(declare-fun b!638144 () Bool)

(assert (=> b!638144 (= e!365120 e!365117)))

(declare-fun res!413116 () Bool)

(assert (=> b!638144 (=> (not res!413116) (not e!365117))))

(declare-fun lt!294985 () SeekEntryResult!6802)

(assert (=> b!638144 (= res!413116 (or (= lt!294985 (MissingZero!6802 i!1108)) (= lt!294985 (MissingVacant!6802 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38286 (_ BitVec 32)) SeekEntryResult!6802)

(assert (=> b!638144 (= lt!294985 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!638145 () Bool)

(declare-fun res!413124 () Bool)

(assert (=> b!638145 (=> (not res!413124) (not e!365117))))

(assert (=> b!638145 (= res!413124 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12442))))

(assert (= (and start!57704 res!413117) b!638141))

(assert (= (and b!638141 res!413110) b!638129))

(assert (= (and b!638129 res!413118) b!638140))

(assert (= (and b!638140 res!413123) b!638130))

(assert (= (and b!638130 res!413114) b!638144))

(assert (= (and b!638144 res!413116) b!638134))

(assert (= (and b!638134 res!413115) b!638145))

(assert (= (and b!638145 res!413124) b!638142))

(assert (= (and b!638142 res!413113) b!638136))

(assert (= (and b!638136 res!413111) b!638133))

(assert (= (and b!638133 res!413109) b!638139))

(assert (= (and b!638139 res!413119) b!638132))

(assert (= (and b!638139 c!72876) b!638143))

(assert (= (and b!638139 (not c!72876)) b!638137))

(assert (= (and b!638139 (not res!413120)) b!638135))

(assert (= (and b!638135 res!413122) b!638127))

(assert (= (and b!638127 (not res!413121)) b!638138))

(assert (= (and b!638138 res!413112) b!638131))

(assert (= (and b!638135 (not res!413125)) b!638128))

(declare-fun m!611571 () Bool)

(assert (=> b!638135 m!611571))

(declare-fun m!611573 () Bool)

(assert (=> b!638135 m!611573))

(declare-fun m!611575 () Bool)

(assert (=> b!638135 m!611575))

(declare-fun m!611577 () Bool)

(assert (=> b!638130 m!611577))

(assert (=> b!638136 m!611573))

(declare-fun m!611579 () Bool)

(assert (=> b!638136 m!611579))

(declare-fun m!611581 () Bool)

(assert (=> b!638145 m!611581))

(declare-fun m!611583 () Bool)

(assert (=> start!57704 m!611583))

(declare-fun m!611585 () Bool)

(assert (=> start!57704 m!611585))

(assert (=> b!638128 m!611571))

(assert (=> b!638128 m!611571))

(declare-fun m!611587 () Bool)

(assert (=> b!638128 m!611587))

(declare-fun m!611589 () Bool)

(assert (=> b!638128 m!611589))

(assert (=> b!638128 m!611571))

(declare-fun m!611591 () Bool)

(assert (=> b!638128 m!611591))

(declare-fun m!611593 () Bool)

(assert (=> b!638128 m!611593))

(declare-fun m!611595 () Bool)

(assert (=> b!638134 m!611595))

(assert (=> b!638127 m!611571))

(declare-fun m!611597 () Bool)

(assert (=> b!638140 m!611597))

(declare-fun m!611599 () Bool)

(assert (=> b!638142 m!611599))

(assert (=> b!638131 m!611571))

(assert (=> b!638131 m!611571))

(declare-fun m!611601 () Bool)

(assert (=> b!638131 m!611601))

(assert (=> b!638138 m!611571))

(assert (=> b!638138 m!611571))

(declare-fun m!611603 () Bool)

(assert (=> b!638138 m!611603))

(declare-fun m!611605 () Bool)

(assert (=> b!638133 m!611605))

(assert (=> b!638133 m!611571))

(assert (=> b!638133 m!611571))

(declare-fun m!611607 () Bool)

(assert (=> b!638133 m!611607))

(assert (=> b!638129 m!611571))

(assert (=> b!638129 m!611571))

(declare-fun m!611609 () Bool)

(assert (=> b!638129 m!611609))

(declare-fun m!611611 () Bool)

(assert (=> b!638144 m!611611))

(declare-fun m!611613 () Bool)

(assert (=> b!638139 m!611613))

(declare-fun m!611615 () Bool)

(assert (=> b!638139 m!611615))

(assert (=> b!638139 m!611571))

(declare-fun m!611617 () Bool)

(assert (=> b!638139 m!611617))

(assert (=> b!638139 m!611573))

(declare-fun m!611619 () Bool)

(assert (=> b!638139 m!611619))

(assert (=> b!638139 m!611571))

(declare-fun m!611621 () Bool)

(assert (=> b!638139 m!611621))

(declare-fun m!611623 () Bool)

(assert (=> b!638139 m!611623))

(check-sat (not b!638134) (not b!638140) (not b!638130) (not start!57704) (not b!638139) (not b!638133) (not b!638131) (not b!638145) (not b!638144) (not b!638129) (not b!638138) (not b!638128))
(check-sat)
