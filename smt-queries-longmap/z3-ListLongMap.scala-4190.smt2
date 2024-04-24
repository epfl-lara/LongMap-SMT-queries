; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57168 () Bool)

(assert start!57168)

(declare-fun b!632651 () Bool)

(declare-fun res!409147 () Bool)

(declare-fun e!361701 () Bool)

(assert (=> b!632651 (=> (not res!409147) (not e!361701))))

(declare-datatypes ((array!38130 0))(
  ( (array!38131 (arr!18295 (Array (_ BitVec 32) (_ BitVec 64))) (size!18659 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38130)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632651 (= res!409147 (validKeyInArray!0 (select (arr!18295 a!2986) j!136)))))

(declare-fun res!409150 () Bool)

(assert (=> start!57168 (=> (not res!409150) (not e!361701))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57168 (= res!409150 (validMask!0 mask!3053))))

(assert (=> start!57168 e!361701))

(assert (=> start!57168 true))

(declare-fun array_inv!14154 (array!38130) Bool)

(assert (=> start!57168 (array_inv!14154 a!2986)))

(declare-fun lt!292398 () (_ BitVec 64))

(declare-fun e!361706 () Bool)

(declare-fun b!632652 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632652 (= e!361706 (or (not (= (select (arr!18295 a!2986) j!136) lt!292398)) (bvslt index!984 (size!18659 a!2986))))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!632652 (= (select (store (arr!18295 a!2986) i!1108 k0!1786) index!984) (select (arr!18295 a!2986) j!136))))

(declare-fun b!632653 () Bool)

(declare-fun res!409148 () Bool)

(assert (=> b!632653 (=> (not res!409148) (not e!361701))))

(assert (=> b!632653 (= res!409148 (validKeyInArray!0 k0!1786))))

(declare-fun b!632654 () Bool)

(declare-fun res!409144 () Bool)

(declare-fun e!361705 () Bool)

(assert (=> b!632654 (=> (not res!409144) (not e!361705))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!632654 (= res!409144 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18295 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632655 () Bool)

(declare-fun e!361704 () Bool)

(assert (=> b!632655 (= e!361705 e!361704)))

(declare-fun res!409149 () Bool)

(assert (=> b!632655 (=> (not res!409149) (not e!361704))))

(assert (=> b!632655 (= res!409149 (= (select (store (arr!18295 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!292396 () array!38130)

(assert (=> b!632655 (= lt!292396 (array!38131 (store (arr!18295 a!2986) i!1108 k0!1786) (size!18659 a!2986)))))

(declare-fun b!632656 () Bool)

(assert (=> b!632656 (= e!361701 e!361705)))

(declare-fun res!409146 () Bool)

(assert (=> b!632656 (=> (not res!409146) (not e!361705))))

(declare-datatypes ((SeekEntryResult!6691 0))(
  ( (MissingZero!6691 (index!29057 (_ BitVec 32))) (Found!6691 (index!29058 (_ BitVec 32))) (Intermediate!6691 (undefined!7503 Bool) (index!29059 (_ BitVec 32)) (x!57945 (_ BitVec 32))) (Undefined!6691) (MissingVacant!6691 (index!29060 (_ BitVec 32))) )
))
(declare-fun lt!292394 () SeekEntryResult!6691)

(assert (=> b!632656 (= res!409146 (or (= lt!292394 (MissingZero!6691 i!1108)) (= lt!292394 (MissingVacant!6691 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38130 (_ BitVec 32)) SeekEntryResult!6691)

(assert (=> b!632656 (= lt!292394 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!632657 () Bool)

(declare-fun res!409145 () Bool)

(assert (=> b!632657 (=> (not res!409145) (not e!361705))))

(declare-datatypes ((List!12243 0))(
  ( (Nil!12240) (Cons!12239 (h!13287 (_ BitVec 64)) (t!18463 List!12243)) )
))
(declare-fun arrayNoDuplicates!0 (array!38130 (_ BitVec 32) List!12243) Bool)

(assert (=> b!632657 (= res!409145 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12240))))

(declare-fun b!632658 () Bool)

(declare-datatypes ((Unit!21273 0))(
  ( (Unit!21274) )
))
(declare-fun e!361702 () Unit!21273)

(declare-fun Unit!21275 () Unit!21273)

(assert (=> b!632658 (= e!361702 Unit!21275)))

(assert (=> b!632658 false))

(declare-fun b!632659 () Bool)

(declare-fun res!409156 () Bool)

(assert (=> b!632659 (=> (not res!409156) (not e!361701))))

(assert (=> b!632659 (= res!409156 (and (= (size!18659 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18659 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18659 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632660 () Bool)

(declare-fun res!409153 () Bool)

(assert (=> b!632660 (=> (not res!409153) (not e!361701))))

(declare-fun arrayContainsKey!0 (array!38130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632660 (= res!409153 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632661 () Bool)

(declare-fun e!361707 () Bool)

(assert (=> b!632661 (= e!361704 e!361707)))

(declare-fun res!409152 () Bool)

(assert (=> b!632661 (=> (not res!409152) (not e!361707))))

(declare-fun lt!292401 () SeekEntryResult!6691)

(assert (=> b!632661 (= res!409152 (and (= lt!292401 (Found!6691 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18295 a!2986) index!984) (select (arr!18295 a!2986) j!136))) (not (= (select (arr!18295 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38130 (_ BitVec 32)) SeekEntryResult!6691)

(assert (=> b!632661 (= lt!292401 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18295 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632662 () Bool)

(declare-fun e!361700 () Bool)

(declare-fun lt!292400 () SeekEntryResult!6691)

(assert (=> b!632662 (= e!361700 (= lt!292401 lt!292400))))

(declare-fun b!632663 () Bool)

(declare-fun Unit!21276 () Unit!21273)

(assert (=> b!632663 (= e!361702 Unit!21276)))

(declare-fun b!632664 () Bool)

(assert (=> b!632664 (= e!361707 (not e!361706))))

(declare-fun res!409155 () Bool)

(assert (=> b!632664 (=> res!409155 e!361706)))

(declare-fun lt!292397 () SeekEntryResult!6691)

(assert (=> b!632664 (= res!409155 (not (= lt!292397 (Found!6691 index!984))))))

(declare-fun lt!292399 () Unit!21273)

(assert (=> b!632664 (= lt!292399 e!361702)))

(declare-fun c!72122 () Bool)

(assert (=> b!632664 (= c!72122 (= lt!292397 Undefined!6691))))

(assert (=> b!632664 (= lt!292397 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292398 lt!292396 mask!3053))))

(assert (=> b!632664 e!361700))

(declare-fun res!409154 () Bool)

(assert (=> b!632664 (=> (not res!409154) (not e!361700))))

(declare-fun lt!292402 () (_ BitVec 32))

(assert (=> b!632664 (= res!409154 (= lt!292400 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292402 vacantSpotIndex!68 lt!292398 lt!292396 mask!3053)))))

(assert (=> b!632664 (= lt!292400 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292402 vacantSpotIndex!68 (select (arr!18295 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632664 (= lt!292398 (select (store (arr!18295 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292395 () Unit!21273)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38130 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21273)

(assert (=> b!632664 (= lt!292395 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292402 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632664 (= lt!292402 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!632665 () Bool)

(declare-fun res!409151 () Bool)

(assert (=> b!632665 (=> (not res!409151) (not e!361705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38130 (_ BitVec 32)) Bool)

(assert (=> b!632665 (= res!409151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!57168 res!409150) b!632659))

(assert (= (and b!632659 res!409156) b!632651))

(assert (= (and b!632651 res!409147) b!632653))

(assert (= (and b!632653 res!409148) b!632660))

(assert (= (and b!632660 res!409153) b!632656))

(assert (= (and b!632656 res!409146) b!632665))

(assert (= (and b!632665 res!409151) b!632657))

(assert (= (and b!632657 res!409145) b!632654))

(assert (= (and b!632654 res!409144) b!632655))

(assert (= (and b!632655 res!409149) b!632661))

(assert (= (and b!632661 res!409152) b!632664))

(assert (= (and b!632664 res!409154) b!632662))

(assert (= (and b!632664 c!72122) b!632658))

(assert (= (and b!632664 (not c!72122)) b!632663))

(assert (= (and b!632664 (not res!409155)) b!632652))

(declare-fun m!607789 () Bool)

(assert (=> b!632653 m!607789))

(declare-fun m!607791 () Bool)

(assert (=> b!632657 m!607791))

(declare-fun m!607793 () Bool)

(assert (=> b!632652 m!607793))

(declare-fun m!607795 () Bool)

(assert (=> b!632652 m!607795))

(declare-fun m!607797 () Bool)

(assert (=> b!632652 m!607797))

(declare-fun m!607799 () Bool)

(assert (=> b!632660 m!607799))

(declare-fun m!607801 () Bool)

(assert (=> b!632656 m!607801))

(assert (=> b!632651 m!607793))

(assert (=> b!632651 m!607793))

(declare-fun m!607803 () Bool)

(assert (=> b!632651 m!607803))

(declare-fun m!607805 () Bool)

(assert (=> b!632654 m!607805))

(declare-fun m!607807 () Bool)

(assert (=> start!57168 m!607807))

(declare-fun m!607809 () Bool)

(assert (=> start!57168 m!607809))

(declare-fun m!607811 () Bool)

(assert (=> b!632665 m!607811))

(declare-fun m!607813 () Bool)

(assert (=> b!632661 m!607813))

(assert (=> b!632661 m!607793))

(assert (=> b!632661 m!607793))

(declare-fun m!607815 () Bool)

(assert (=> b!632661 m!607815))

(declare-fun m!607817 () Bool)

(assert (=> b!632664 m!607817))

(declare-fun m!607819 () Bool)

(assert (=> b!632664 m!607819))

(assert (=> b!632664 m!607793))

(assert (=> b!632664 m!607795))

(declare-fun m!607821 () Bool)

(assert (=> b!632664 m!607821))

(declare-fun m!607823 () Bool)

(assert (=> b!632664 m!607823))

(declare-fun m!607825 () Bool)

(assert (=> b!632664 m!607825))

(assert (=> b!632664 m!607793))

(declare-fun m!607827 () Bool)

(assert (=> b!632664 m!607827))

(assert (=> b!632655 m!607795))

(declare-fun m!607829 () Bool)

(assert (=> b!632655 m!607829))

(check-sat (not b!632664) (not b!632661) (not b!632665) (not b!632653) (not b!632651) (not start!57168) (not b!632660) (not b!632657) (not b!632656))
(check-sat)
