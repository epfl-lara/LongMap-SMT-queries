; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54570 () Bool)

(assert start!54570)

(declare-fun b!596978 () Bool)

(declare-fun e!341092 () Bool)

(declare-fun e!341097 () Bool)

(assert (=> b!596978 (= e!341092 e!341097)))

(declare-fun res!382714 () Bool)

(assert (=> b!596978 (=> (not res!382714) (not e!341097))))

(declare-datatypes ((SeekEntryResult!6219 0))(
  ( (MissingZero!6219 (index!27124 (_ BitVec 32))) (Found!6219 (index!27125 (_ BitVec 32))) (Intermediate!6219 (undefined!7031 Bool) (index!27126 (_ BitVec 32)) (x!55919 (_ BitVec 32))) (Undefined!6219) (MissingVacant!6219 (index!27127 (_ BitVec 32))) )
))
(declare-fun lt!271208 () SeekEntryResult!6219)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596978 (= res!382714 (or (= lt!271208 (MissingZero!6219 i!1108)) (= lt!271208 (MissingVacant!6219 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37030 0))(
  ( (array!37031 (arr!17779 (Array (_ BitVec 32) (_ BitVec 64))) (size!18143 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37030)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37030 (_ BitVec 32)) SeekEntryResult!6219)

(assert (=> b!596978 (= lt!271208 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!596979 () Bool)

(declare-fun e!341090 () Bool)

(declare-fun e!341091 () Bool)

(assert (=> b!596979 (= e!341090 e!341091)))

(declare-fun res!382721 () Bool)

(assert (=> b!596979 (=> res!382721 e!341091)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!271206 () (_ BitVec 64))

(declare-fun lt!271213 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!596979 (= res!382721 (or (not (= (select (arr!17779 a!2986) j!136) lt!271213)) (not (= (select (arr!17779 a!2986) j!136) lt!271206)) (bvsge j!136 index!984)))))

(declare-fun e!341096 () Bool)

(assert (=> b!596979 e!341096))

(declare-fun res!382722 () Bool)

(assert (=> b!596979 (=> (not res!382722) (not e!341096))))

(assert (=> b!596979 (= res!382722 (= lt!271206 (select (arr!17779 a!2986) j!136)))))

(assert (=> b!596979 (= lt!271206 (select (store (arr!17779 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!596980 () Bool)

(declare-fun e!341099 () Bool)

(assert (=> b!596980 (= e!341099 (not e!341090))))

(declare-fun res!382720 () Bool)

(assert (=> b!596980 (=> res!382720 e!341090)))

(declare-fun lt!271203 () SeekEntryResult!6219)

(assert (=> b!596980 (= res!382720 (not (= lt!271203 (Found!6219 index!984))))))

(declare-datatypes ((Unit!18794 0))(
  ( (Unit!18795) )
))
(declare-fun lt!271205 () Unit!18794)

(declare-fun e!341100 () Unit!18794)

(assert (=> b!596980 (= lt!271205 e!341100)))

(declare-fun c!67499 () Bool)

(assert (=> b!596980 (= c!67499 (= lt!271203 Undefined!6219))))

(declare-fun lt!271210 () array!37030)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37030 (_ BitVec 32)) SeekEntryResult!6219)

(assert (=> b!596980 (= lt!271203 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271213 lt!271210 mask!3053))))

(declare-fun e!341094 () Bool)

(assert (=> b!596980 e!341094))

(declare-fun res!382725 () Bool)

(assert (=> b!596980 (=> (not res!382725) (not e!341094))))

(declare-fun lt!271202 () (_ BitVec 32))

(declare-fun lt!271212 () SeekEntryResult!6219)

(assert (=> b!596980 (= res!382725 (= lt!271212 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271202 vacantSpotIndex!68 lt!271213 lt!271210 mask!3053)))))

(assert (=> b!596980 (= lt!271212 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271202 vacantSpotIndex!68 (select (arr!17779 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596980 (= lt!271213 (select (store (arr!17779 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!271204 () Unit!18794)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37030 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18794)

(assert (=> b!596980 (= lt!271204 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271202 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596980 (= lt!271202 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596982 () Bool)

(declare-fun e!341095 () Bool)

(assert (=> b!596982 (= e!341096 e!341095)))

(declare-fun res!382715 () Bool)

(assert (=> b!596982 (=> res!382715 e!341095)))

(assert (=> b!596982 (= res!382715 (or (not (= (select (arr!17779 a!2986) j!136) lt!271213)) (not (= (select (arr!17779 a!2986) j!136) lt!271206)) (bvsge j!136 index!984)))))

(declare-fun e!341093 () Bool)

(declare-fun b!596983 () Bool)

(declare-fun arrayContainsKey!0 (array!37030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596983 (= e!341093 (arrayContainsKey!0 lt!271210 (select (arr!17779 a!2986) j!136) index!984))))

(declare-fun b!596984 () Bool)

(declare-fun res!382727 () Bool)

(assert (=> b!596984 (=> (not res!382727) (not e!341092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596984 (= res!382727 (validKeyInArray!0 (select (arr!17779 a!2986) j!136)))))

(declare-fun b!596985 () Bool)

(declare-fun res!382717 () Bool)

(assert (=> b!596985 (=> (not res!382717) (not e!341097))))

(assert (=> b!596985 (= res!382717 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17779 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596986 () Bool)

(declare-fun res!382726 () Bool)

(assert (=> b!596986 (=> (not res!382726) (not e!341097))))

(declare-datatypes ((List!11820 0))(
  ( (Nil!11817) (Cons!11816 (h!12861 (_ BitVec 64)) (t!18048 List!11820)) )
))
(declare-fun arrayNoDuplicates!0 (array!37030 (_ BitVec 32) List!11820) Bool)

(assert (=> b!596986 (= res!382726 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11817))))

(declare-fun b!596987 () Bool)

(declare-fun e!341089 () Bool)

(assert (=> b!596987 (= e!341089 e!341099)))

(declare-fun res!382724 () Bool)

(assert (=> b!596987 (=> (not res!382724) (not e!341099))))

(declare-fun lt!271211 () SeekEntryResult!6219)

(assert (=> b!596987 (= res!382724 (and (= lt!271211 (Found!6219 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17779 a!2986) index!984) (select (arr!17779 a!2986) j!136))) (not (= (select (arr!17779 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!596987 (= lt!271211 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17779 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596988 () Bool)

(declare-fun Unit!18796 () Unit!18794)

(assert (=> b!596988 (= e!341100 Unit!18796)))

(assert (=> b!596988 false))

(declare-fun b!596989 () Bool)

(declare-fun res!382723 () Bool)

(assert (=> b!596989 (=> (not res!382723) (not e!341097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37030 (_ BitVec 32)) Bool)

(assert (=> b!596989 (= res!382723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596990 () Bool)

(assert (=> b!596990 (= e!341094 (= lt!271211 lt!271212))))

(declare-fun b!596991 () Bool)

(assert (=> b!596991 (= e!341097 e!341089)))

(declare-fun res!382728 () Bool)

(assert (=> b!596991 (=> (not res!382728) (not e!341089))))

(assert (=> b!596991 (= res!382728 (= (select (store (arr!17779 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596991 (= lt!271210 (array!37031 (store (arr!17779 a!2986) i!1108 k0!1786) (size!18143 a!2986)))))

(declare-fun b!596992 () Bool)

(declare-fun res!382718 () Bool)

(assert (=> b!596992 (=> (not res!382718) (not e!341092))))

(assert (=> b!596992 (= res!382718 (and (= (size!18143 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18143 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18143 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596993 () Bool)

(declare-fun res!382716 () Bool)

(assert (=> b!596993 (=> (not res!382716) (not e!341092))))

(assert (=> b!596993 (= res!382716 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596994 () Bool)

(assert (=> b!596994 (= e!341095 e!341093)))

(declare-fun res!382719 () Bool)

(assert (=> b!596994 (=> (not res!382719) (not e!341093))))

(assert (=> b!596994 (= res!382719 (arrayContainsKey!0 lt!271210 (select (arr!17779 a!2986) j!136) j!136))))

(declare-fun res!382729 () Bool)

(assert (=> start!54570 (=> (not res!382729) (not e!341092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54570 (= res!382729 (validMask!0 mask!3053))))

(assert (=> start!54570 e!341092))

(assert (=> start!54570 true))

(declare-fun array_inv!13575 (array!37030) Bool)

(assert (=> start!54570 (array_inv!13575 a!2986)))

(declare-fun b!596981 () Bool)

(declare-fun Unit!18797 () Unit!18794)

(assert (=> b!596981 (= e!341100 Unit!18797)))

(declare-fun b!596995 () Bool)

(declare-fun res!382730 () Bool)

(assert (=> b!596995 (=> (not res!382730) (not e!341092))))

(assert (=> b!596995 (= res!382730 (validKeyInArray!0 k0!1786))))

(declare-fun b!596996 () Bool)

(assert (=> b!596996 (= e!341091 (or (bvsgt #b00000000000000000000000000000000 (size!18143 a!2986)) (bvslt (size!18143 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!596996 (arrayNoDuplicates!0 lt!271210 #b00000000000000000000000000000000 Nil!11817)))

(declare-fun lt!271207 () Unit!18794)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37030 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11820) Unit!18794)

(assert (=> b!596996 (= lt!271207 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11817))))

(assert (=> b!596996 (arrayContainsKey!0 lt!271210 (select (arr!17779 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271209 () Unit!18794)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37030 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18794)

(assert (=> b!596996 (= lt!271209 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271210 (select (arr!17779 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!54570 res!382729) b!596992))

(assert (= (and b!596992 res!382718) b!596984))

(assert (= (and b!596984 res!382727) b!596995))

(assert (= (and b!596995 res!382730) b!596993))

(assert (= (and b!596993 res!382716) b!596978))

(assert (= (and b!596978 res!382714) b!596989))

(assert (= (and b!596989 res!382723) b!596986))

(assert (= (and b!596986 res!382726) b!596985))

(assert (= (and b!596985 res!382717) b!596991))

(assert (= (and b!596991 res!382728) b!596987))

(assert (= (and b!596987 res!382724) b!596980))

(assert (= (and b!596980 res!382725) b!596990))

(assert (= (and b!596980 c!67499) b!596988))

(assert (= (and b!596980 (not c!67499)) b!596981))

(assert (= (and b!596980 (not res!382720)) b!596979))

(assert (= (and b!596979 res!382722) b!596982))

(assert (= (and b!596982 (not res!382715)) b!596994))

(assert (= (and b!596994 res!382719) b!596983))

(assert (= (and b!596979 (not res!382721)) b!596996))

(declare-fun m!574415 () Bool)

(assert (=> b!596982 m!574415))

(declare-fun m!574417 () Bool)

(assert (=> start!54570 m!574417))

(declare-fun m!574419 () Bool)

(assert (=> start!54570 m!574419))

(declare-fun m!574421 () Bool)

(assert (=> b!596985 m!574421))

(assert (=> b!596994 m!574415))

(assert (=> b!596994 m!574415))

(declare-fun m!574423 () Bool)

(assert (=> b!596994 m!574423))

(declare-fun m!574425 () Bool)

(assert (=> b!596993 m!574425))

(declare-fun m!574427 () Bool)

(assert (=> b!596995 m!574427))

(assert (=> b!596979 m!574415))

(declare-fun m!574429 () Bool)

(assert (=> b!596979 m!574429))

(declare-fun m!574431 () Bool)

(assert (=> b!596979 m!574431))

(assert (=> b!596984 m!574415))

(assert (=> b!596984 m!574415))

(declare-fun m!574433 () Bool)

(assert (=> b!596984 m!574433))

(assert (=> b!596991 m!574429))

(declare-fun m!574435 () Bool)

(assert (=> b!596991 m!574435))

(declare-fun m!574437 () Bool)

(assert (=> b!596978 m!574437))

(assert (=> b!596983 m!574415))

(assert (=> b!596983 m!574415))

(declare-fun m!574439 () Bool)

(assert (=> b!596983 m!574439))

(assert (=> b!596996 m!574415))

(assert (=> b!596996 m!574415))

(declare-fun m!574441 () Bool)

(assert (=> b!596996 m!574441))

(assert (=> b!596996 m!574415))

(declare-fun m!574443 () Bool)

(assert (=> b!596996 m!574443))

(declare-fun m!574445 () Bool)

(assert (=> b!596996 m!574445))

(declare-fun m!574447 () Bool)

(assert (=> b!596996 m!574447))

(declare-fun m!574449 () Bool)

(assert (=> b!596987 m!574449))

(assert (=> b!596987 m!574415))

(assert (=> b!596987 m!574415))

(declare-fun m!574451 () Bool)

(assert (=> b!596987 m!574451))

(declare-fun m!574453 () Bool)

(assert (=> b!596989 m!574453))

(declare-fun m!574455 () Bool)

(assert (=> b!596986 m!574455))

(declare-fun m!574457 () Bool)

(assert (=> b!596980 m!574457))

(declare-fun m!574459 () Bool)

(assert (=> b!596980 m!574459))

(assert (=> b!596980 m!574415))

(assert (=> b!596980 m!574415))

(declare-fun m!574461 () Bool)

(assert (=> b!596980 m!574461))

(assert (=> b!596980 m!574429))

(declare-fun m!574463 () Bool)

(assert (=> b!596980 m!574463))

(declare-fun m!574465 () Bool)

(assert (=> b!596980 m!574465))

(declare-fun m!574467 () Bool)

(assert (=> b!596980 m!574467))

(check-sat (not b!596983) (not b!596995) (not start!54570) (not b!596978) (not b!596986) (not b!596989) (not b!596993) (not b!596987) (not b!596994) (not b!596996) (not b!596984) (not b!596980))
(check-sat)
(get-model)

(declare-fun d!86715 () Bool)

(declare-fun res!382786 () Bool)

(declare-fun e!341141 () Bool)

(assert (=> d!86715 (=> res!382786 e!341141)))

(assert (=> d!86715 (= res!382786 (= (select (arr!17779 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86715 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!341141)))

(declare-fun b!597058 () Bool)

(declare-fun e!341142 () Bool)

(assert (=> b!597058 (= e!341141 e!341142)))

(declare-fun res!382787 () Bool)

(assert (=> b!597058 (=> (not res!382787) (not e!341142))))

(assert (=> b!597058 (= res!382787 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18143 a!2986)))))

(declare-fun b!597059 () Bool)

(assert (=> b!597059 (= e!341142 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86715 (not res!382786)) b!597058))

(assert (= (and b!597058 res!382787) b!597059))

(declare-fun m!574523 () Bool)

(assert (=> d!86715 m!574523))

(declare-fun m!574525 () Bool)

(assert (=> b!597059 m!574525))

(assert (=> b!596993 d!86715))

(declare-fun d!86717 () Bool)

(declare-fun res!382788 () Bool)

(declare-fun e!341143 () Bool)

(assert (=> d!86717 (=> res!382788 e!341143)))

(assert (=> d!86717 (= res!382788 (= (select (arr!17779 lt!271210) index!984) (select (arr!17779 a!2986) j!136)))))

(assert (=> d!86717 (= (arrayContainsKey!0 lt!271210 (select (arr!17779 a!2986) j!136) index!984) e!341143)))

(declare-fun b!597060 () Bool)

(declare-fun e!341144 () Bool)

(assert (=> b!597060 (= e!341143 e!341144)))

(declare-fun res!382789 () Bool)

(assert (=> b!597060 (=> (not res!382789) (not e!341144))))

(assert (=> b!597060 (= res!382789 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18143 lt!271210)))))

(declare-fun b!597061 () Bool)

(assert (=> b!597061 (= e!341144 (arrayContainsKey!0 lt!271210 (select (arr!17779 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86717 (not res!382788)) b!597060))

(assert (= (and b!597060 res!382789) b!597061))

(declare-fun m!574527 () Bool)

(assert (=> d!86717 m!574527))

(assert (=> b!597061 m!574415))

(declare-fun m!574529 () Bool)

(assert (=> b!597061 m!574529))

(assert (=> b!596983 d!86717))

(declare-fun d!86719 () Bool)

(declare-fun res!382790 () Bool)

(declare-fun e!341145 () Bool)

(assert (=> d!86719 (=> res!382790 e!341145)))

(assert (=> d!86719 (= res!382790 (= (select (arr!17779 lt!271210) j!136) (select (arr!17779 a!2986) j!136)))))

(assert (=> d!86719 (= (arrayContainsKey!0 lt!271210 (select (arr!17779 a!2986) j!136) j!136) e!341145)))

(declare-fun b!597062 () Bool)

(declare-fun e!341146 () Bool)

(assert (=> b!597062 (= e!341145 e!341146)))

(declare-fun res!382791 () Bool)

(assert (=> b!597062 (=> (not res!382791) (not e!341146))))

(assert (=> b!597062 (= res!382791 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18143 lt!271210)))))

(declare-fun b!597063 () Bool)

(assert (=> b!597063 (= e!341146 (arrayContainsKey!0 lt!271210 (select (arr!17779 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86719 (not res!382790)) b!597062))

(assert (= (and b!597062 res!382791) b!597063))

(declare-fun m!574531 () Bool)

(assert (=> d!86719 m!574531))

(assert (=> b!597063 m!574415))

(declare-fun m!574533 () Bool)

(assert (=> b!597063 m!574533))

(assert (=> b!596994 d!86719))

(declare-fun d!86721 () Bool)

(assert (=> d!86721 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54570 d!86721))

(declare-fun d!86725 () Bool)

(assert (=> d!86725 (= (array_inv!13575 a!2986) (bvsge (size!18143 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54570 d!86725))

(declare-fun d!86727 () Bool)

(assert (=> d!86727 (= (validKeyInArray!0 (select (arr!17779 a!2986) j!136)) (and (not (= (select (arr!17779 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17779 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!596984 d!86727))

(declare-fun d!86731 () Bool)

(assert (=> d!86731 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!596995 d!86731))

(declare-fun d!86733 () Bool)

(declare-fun res!382800 () Bool)

(declare-fun e!341155 () Bool)

(assert (=> d!86733 (=> res!382800 e!341155)))

(assert (=> d!86733 (= res!382800 (bvsge #b00000000000000000000000000000000 (size!18143 lt!271210)))))

(assert (=> d!86733 (= (arrayNoDuplicates!0 lt!271210 #b00000000000000000000000000000000 Nil!11817) e!341155)))

(declare-fun b!597074 () Bool)

(declare-fun e!341157 () Bool)

(declare-fun call!32906 () Bool)

(assert (=> b!597074 (= e!341157 call!32906)))

(declare-fun bm!32903 () Bool)

(declare-fun c!67505 () Bool)

(assert (=> bm!32903 (= call!32906 (arrayNoDuplicates!0 lt!271210 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67505 (Cons!11816 (select (arr!17779 lt!271210) #b00000000000000000000000000000000) Nil!11817) Nil!11817)))))

(declare-fun b!597075 () Bool)

(assert (=> b!597075 (= e!341157 call!32906)))

(declare-fun b!597076 () Bool)

(declare-fun e!341158 () Bool)

(assert (=> b!597076 (= e!341155 e!341158)))

(declare-fun res!382799 () Bool)

(assert (=> b!597076 (=> (not res!382799) (not e!341158))))

(declare-fun e!341156 () Bool)

(assert (=> b!597076 (= res!382799 (not e!341156))))

(declare-fun res!382798 () Bool)

(assert (=> b!597076 (=> (not res!382798) (not e!341156))))

(assert (=> b!597076 (= res!382798 (validKeyInArray!0 (select (arr!17779 lt!271210) #b00000000000000000000000000000000)))))

(declare-fun b!597077 () Bool)

(declare-fun contains!2951 (List!11820 (_ BitVec 64)) Bool)

(assert (=> b!597077 (= e!341156 (contains!2951 Nil!11817 (select (arr!17779 lt!271210) #b00000000000000000000000000000000)))))

(declare-fun b!597078 () Bool)

(assert (=> b!597078 (= e!341158 e!341157)))

(assert (=> b!597078 (= c!67505 (validKeyInArray!0 (select (arr!17779 lt!271210) #b00000000000000000000000000000000)))))

(assert (= (and d!86733 (not res!382800)) b!597076))

(assert (= (and b!597076 res!382798) b!597077))

(assert (= (and b!597076 res!382799) b!597078))

(assert (= (and b!597078 c!67505) b!597075))

(assert (= (and b!597078 (not c!67505)) b!597074))

(assert (= (or b!597075 b!597074) bm!32903))

(declare-fun m!574535 () Bool)

(assert (=> bm!32903 m!574535))

(declare-fun m!574537 () Bool)

(assert (=> bm!32903 m!574537))

(assert (=> b!597076 m!574535))

(assert (=> b!597076 m!574535))

(declare-fun m!574539 () Bool)

(assert (=> b!597076 m!574539))

(assert (=> b!597077 m!574535))

(assert (=> b!597077 m!574535))

(declare-fun m!574541 () Bool)

(assert (=> b!597077 m!574541))

(assert (=> b!597078 m!574535))

(assert (=> b!597078 m!574535))

(assert (=> b!597078 m!574539))

(assert (=> b!596996 d!86733))

(declare-fun d!86737 () Bool)

(declare-fun e!341167 () Bool)

(assert (=> d!86737 e!341167))

(declare-fun res!382803 () Bool)

(assert (=> d!86737 (=> (not res!382803) (not e!341167))))

(assert (=> d!86737 (= res!382803 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18143 a!2986))))))

(declare-fun lt!271256 () Unit!18794)

(declare-fun choose!41 (array!37030 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11820) Unit!18794)

(assert (=> d!86737 (= lt!271256 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11817))))

(assert (=> d!86737 (bvslt (size!18143 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!86737 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11817) lt!271256)))

(declare-fun b!597093 () Bool)

(assert (=> b!597093 (= e!341167 (arrayNoDuplicates!0 (array!37031 (store (arr!17779 a!2986) i!1108 k0!1786) (size!18143 a!2986)) #b00000000000000000000000000000000 Nil!11817))))

(assert (= (and d!86737 res!382803) b!597093))

(declare-fun m!574543 () Bool)

(assert (=> d!86737 m!574543))

(assert (=> b!597093 m!574429))

(declare-fun m!574545 () Bool)

(assert (=> b!597093 m!574545))

(assert (=> b!596996 d!86737))

(declare-fun d!86739 () Bool)

(declare-fun res!382804 () Bool)

(declare-fun e!341168 () Bool)

(assert (=> d!86739 (=> res!382804 e!341168)))

(assert (=> d!86739 (= res!382804 (= (select (arr!17779 lt!271210) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17779 a!2986) j!136)))))

(assert (=> d!86739 (= (arrayContainsKey!0 lt!271210 (select (arr!17779 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!341168)))

(declare-fun b!597094 () Bool)

(declare-fun e!341169 () Bool)

(assert (=> b!597094 (= e!341168 e!341169)))

(declare-fun res!382805 () Bool)

(assert (=> b!597094 (=> (not res!382805) (not e!341169))))

(assert (=> b!597094 (= res!382805 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18143 lt!271210)))))

(declare-fun b!597095 () Bool)

(assert (=> b!597095 (= e!341169 (arrayContainsKey!0 lt!271210 (select (arr!17779 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86739 (not res!382804)) b!597094))

(assert (= (and b!597094 res!382805) b!597095))

(declare-fun m!574547 () Bool)

(assert (=> d!86739 m!574547))

(assert (=> b!597095 m!574415))

(declare-fun m!574549 () Bool)

(assert (=> b!597095 m!574549))

(assert (=> b!596996 d!86739))

(declare-fun d!86741 () Bool)

(assert (=> d!86741 (arrayContainsKey!0 lt!271210 (select (arr!17779 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271263 () Unit!18794)

(declare-fun choose!114 (array!37030 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18794)

(assert (=> d!86741 (= lt!271263 (choose!114 lt!271210 (select (arr!17779 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86741 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86741 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271210 (select (arr!17779 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!271263)))

(declare-fun bs!18364 () Bool)

(assert (= bs!18364 d!86741))

(assert (=> bs!18364 m!574415))

(assert (=> bs!18364 m!574441))

(assert (=> bs!18364 m!574415))

(declare-fun m!574551 () Bool)

(assert (=> bs!18364 m!574551))

(assert (=> b!596996 d!86741))

(declare-fun d!86743 () Bool)

(declare-fun res!382808 () Bool)

(declare-fun e!341176 () Bool)

(assert (=> d!86743 (=> res!382808 e!341176)))

(assert (=> d!86743 (= res!382808 (bvsge #b00000000000000000000000000000000 (size!18143 a!2986)))))

(assert (=> d!86743 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11817) e!341176)))

(declare-fun b!597108 () Bool)

(declare-fun e!341178 () Bool)

(declare-fun call!32907 () Bool)

(assert (=> b!597108 (= e!341178 call!32907)))

(declare-fun bm!32904 () Bool)

(declare-fun c!67518 () Bool)

(assert (=> bm!32904 (= call!32907 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67518 (Cons!11816 (select (arr!17779 a!2986) #b00000000000000000000000000000000) Nil!11817) Nil!11817)))))

(declare-fun b!597109 () Bool)

(assert (=> b!597109 (= e!341178 call!32907)))

(declare-fun b!597110 () Bool)

(declare-fun e!341179 () Bool)

(assert (=> b!597110 (= e!341176 e!341179)))

(declare-fun res!382807 () Bool)

(assert (=> b!597110 (=> (not res!382807) (not e!341179))))

(declare-fun e!341177 () Bool)

(assert (=> b!597110 (= res!382807 (not e!341177))))

(declare-fun res!382806 () Bool)

(assert (=> b!597110 (=> (not res!382806) (not e!341177))))

(assert (=> b!597110 (= res!382806 (validKeyInArray!0 (select (arr!17779 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597111 () Bool)

(assert (=> b!597111 (= e!341177 (contains!2951 Nil!11817 (select (arr!17779 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597112 () Bool)

(assert (=> b!597112 (= e!341179 e!341178)))

(assert (=> b!597112 (= c!67518 (validKeyInArray!0 (select (arr!17779 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!86743 (not res!382808)) b!597110))

(assert (= (and b!597110 res!382806) b!597111))

(assert (= (and b!597110 res!382807) b!597112))

(assert (= (and b!597112 c!67518) b!597109))

(assert (= (and b!597112 (not c!67518)) b!597108))

(assert (= (or b!597109 b!597108) bm!32904))

(assert (=> bm!32904 m!574523))

(declare-fun m!574553 () Bool)

(assert (=> bm!32904 m!574553))

(assert (=> b!597110 m!574523))

(assert (=> b!597110 m!574523))

(declare-fun m!574555 () Bool)

(assert (=> b!597110 m!574555))

(assert (=> b!597111 m!574523))

(assert (=> b!597111 m!574523))

(declare-fun m!574557 () Bool)

(assert (=> b!597111 m!574557))

(assert (=> b!597112 m!574523))

(assert (=> b!597112 m!574523))

(assert (=> b!597112 m!574555))

(assert (=> b!596986 d!86743))

(declare-fun b!597173 () Bool)

(declare-fun e!341217 () SeekEntryResult!6219)

(declare-fun e!341218 () SeekEntryResult!6219)

(assert (=> b!597173 (= e!341217 e!341218)))

(declare-fun lt!271288 () (_ BitVec 64))

(declare-fun c!67544 () Bool)

(assert (=> b!597173 (= c!67544 (= lt!271288 (select (arr!17779 a!2986) j!136)))))

(declare-fun lt!271287 () SeekEntryResult!6219)

(declare-fun d!86745 () Bool)

(get-info :version)

(assert (=> d!86745 (and (or ((_ is Undefined!6219) lt!271287) (not ((_ is Found!6219) lt!271287)) (and (bvsge (index!27125 lt!271287) #b00000000000000000000000000000000) (bvslt (index!27125 lt!271287) (size!18143 a!2986)))) (or ((_ is Undefined!6219) lt!271287) ((_ is Found!6219) lt!271287) (not ((_ is MissingVacant!6219) lt!271287)) (not (= (index!27127 lt!271287) vacantSpotIndex!68)) (and (bvsge (index!27127 lt!271287) #b00000000000000000000000000000000) (bvslt (index!27127 lt!271287) (size!18143 a!2986)))) (or ((_ is Undefined!6219) lt!271287) (ite ((_ is Found!6219) lt!271287) (= (select (arr!17779 a!2986) (index!27125 lt!271287)) (select (arr!17779 a!2986) j!136)) (and ((_ is MissingVacant!6219) lt!271287) (= (index!27127 lt!271287) vacantSpotIndex!68) (= (select (arr!17779 a!2986) (index!27127 lt!271287)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86745 (= lt!271287 e!341217)))

(declare-fun c!67543 () Bool)

(assert (=> d!86745 (= c!67543 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86745 (= lt!271288 (select (arr!17779 a!2986) index!984))))

(assert (=> d!86745 (validMask!0 mask!3053)))

(assert (=> d!86745 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17779 a!2986) j!136) a!2986 mask!3053) lt!271287)))

(declare-fun b!597174 () Bool)

(assert (=> b!597174 (= e!341218 (Found!6219 index!984))))

(declare-fun b!597175 () Bool)

(declare-fun e!341216 () SeekEntryResult!6219)

(assert (=> b!597175 (= e!341216 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17779 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597176 () Bool)

(assert (=> b!597176 (= e!341216 (MissingVacant!6219 vacantSpotIndex!68))))

(declare-fun b!597177 () Bool)

(assert (=> b!597177 (= e!341217 Undefined!6219)))

(declare-fun b!597178 () Bool)

(declare-fun c!67545 () Bool)

(assert (=> b!597178 (= c!67545 (= lt!271288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597178 (= e!341218 e!341216)))

(assert (= (and d!86745 c!67543) b!597177))

(assert (= (and d!86745 (not c!67543)) b!597173))

(assert (= (and b!597173 c!67544) b!597174))

(assert (= (and b!597173 (not c!67544)) b!597178))

(assert (= (and b!597178 c!67545) b!597176))

(assert (= (and b!597178 (not c!67545)) b!597175))

(declare-fun m!574613 () Bool)

(assert (=> d!86745 m!574613))

(declare-fun m!574615 () Bool)

(assert (=> d!86745 m!574615))

(assert (=> d!86745 m!574449))

(assert (=> d!86745 m!574417))

(assert (=> b!597175 m!574457))

(assert (=> b!597175 m!574457))

(assert (=> b!597175 m!574415))

(declare-fun m!574619 () Bool)

(assert (=> b!597175 m!574619))

(assert (=> b!596987 d!86745))

(declare-fun d!86771 () Bool)

(declare-fun lt!271310 () SeekEntryResult!6219)

(assert (=> d!86771 (and (or ((_ is Undefined!6219) lt!271310) (not ((_ is Found!6219) lt!271310)) (and (bvsge (index!27125 lt!271310) #b00000000000000000000000000000000) (bvslt (index!27125 lt!271310) (size!18143 a!2986)))) (or ((_ is Undefined!6219) lt!271310) ((_ is Found!6219) lt!271310) (not ((_ is MissingZero!6219) lt!271310)) (and (bvsge (index!27124 lt!271310) #b00000000000000000000000000000000) (bvslt (index!27124 lt!271310) (size!18143 a!2986)))) (or ((_ is Undefined!6219) lt!271310) ((_ is Found!6219) lt!271310) ((_ is MissingZero!6219) lt!271310) (not ((_ is MissingVacant!6219) lt!271310)) (and (bvsge (index!27127 lt!271310) #b00000000000000000000000000000000) (bvslt (index!27127 lt!271310) (size!18143 a!2986)))) (or ((_ is Undefined!6219) lt!271310) (ite ((_ is Found!6219) lt!271310) (= (select (arr!17779 a!2986) (index!27125 lt!271310)) k0!1786) (ite ((_ is MissingZero!6219) lt!271310) (= (select (arr!17779 a!2986) (index!27124 lt!271310)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6219) lt!271310) (= (select (arr!17779 a!2986) (index!27127 lt!271310)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!341239 () SeekEntryResult!6219)

(assert (=> d!86771 (= lt!271310 e!341239)))

(declare-fun c!67563 () Bool)

(declare-fun lt!271311 () SeekEntryResult!6219)

(assert (=> d!86771 (= c!67563 (and ((_ is Intermediate!6219) lt!271311) (undefined!7031 lt!271311)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37030 (_ BitVec 32)) SeekEntryResult!6219)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86771 (= lt!271311 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86771 (validMask!0 mask!3053)))

(assert (=> d!86771 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!271310)))

(declare-fun b!597212 () Bool)

(declare-fun e!341238 () SeekEntryResult!6219)

(assert (=> b!597212 (= e!341238 (Found!6219 (index!27126 lt!271311)))))

(declare-fun b!597213 () Bool)

(declare-fun e!341237 () SeekEntryResult!6219)

(assert (=> b!597213 (= e!341237 (seekKeyOrZeroReturnVacant!0 (x!55919 lt!271311) (index!27126 lt!271311) (index!27126 lt!271311) k0!1786 a!2986 mask!3053))))

(declare-fun b!597214 () Bool)

(assert (=> b!597214 (= e!341239 e!341238)))

(declare-fun lt!271312 () (_ BitVec 64))

(assert (=> b!597214 (= lt!271312 (select (arr!17779 a!2986) (index!27126 lt!271311)))))

(declare-fun c!67561 () Bool)

(assert (=> b!597214 (= c!67561 (= lt!271312 k0!1786))))

(declare-fun b!597215 () Bool)

(assert (=> b!597215 (= e!341237 (MissingZero!6219 (index!27126 lt!271311)))))

(declare-fun b!597216 () Bool)

(assert (=> b!597216 (= e!341239 Undefined!6219)))

(declare-fun b!597217 () Bool)

(declare-fun c!67562 () Bool)

(assert (=> b!597217 (= c!67562 (= lt!271312 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597217 (= e!341238 e!341237)))

(assert (= (and d!86771 c!67563) b!597216))

(assert (= (and d!86771 (not c!67563)) b!597214))

(assert (= (and b!597214 c!67561) b!597212))

(assert (= (and b!597214 (not c!67561)) b!597217))

(assert (= (and b!597217 c!67562) b!597215))

(assert (= (and b!597217 (not c!67562)) b!597213))

(assert (=> d!86771 m!574417))

(declare-fun m!574639 () Bool)

(assert (=> d!86771 m!574639))

(declare-fun m!574641 () Bool)

(assert (=> d!86771 m!574641))

(declare-fun m!574643 () Bool)

(assert (=> d!86771 m!574643))

(declare-fun m!574645 () Bool)

(assert (=> d!86771 m!574645))

(assert (=> d!86771 m!574639))

(declare-fun m!574647 () Bool)

(assert (=> d!86771 m!574647))

(declare-fun m!574649 () Bool)

(assert (=> b!597213 m!574649))

(declare-fun m!574651 () Bool)

(assert (=> b!597214 m!574651))

(assert (=> b!596978 d!86771))

(declare-fun d!86781 () Bool)

(declare-fun res!382851 () Bool)

(declare-fun e!341283 () Bool)

(assert (=> d!86781 (=> res!382851 e!341283)))

(assert (=> d!86781 (= res!382851 (bvsge #b00000000000000000000000000000000 (size!18143 a!2986)))))

(assert (=> d!86781 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!341283)))

(declare-fun b!597272 () Bool)

(declare-fun e!341281 () Bool)

(declare-fun call!32917 () Bool)

(assert (=> b!597272 (= e!341281 call!32917)))

(declare-fun bm!32914 () Bool)

(assert (=> bm!32914 (= call!32917 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!597273 () Bool)

(assert (=> b!597273 (= e!341283 e!341281)))

(declare-fun c!67579 () Bool)

(assert (=> b!597273 (= c!67579 (validKeyInArray!0 (select (arr!17779 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597274 () Bool)

(declare-fun e!341282 () Bool)

(assert (=> b!597274 (= e!341281 e!341282)))

(declare-fun lt!271332 () (_ BitVec 64))

(assert (=> b!597274 (= lt!271332 (select (arr!17779 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!271331 () Unit!18794)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37030 (_ BitVec 64) (_ BitVec 32)) Unit!18794)

(assert (=> b!597274 (= lt!271331 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!271332 #b00000000000000000000000000000000))))

(assert (=> b!597274 (arrayContainsKey!0 a!2986 lt!271332 #b00000000000000000000000000000000)))

(declare-fun lt!271330 () Unit!18794)

(assert (=> b!597274 (= lt!271330 lt!271331)))

(declare-fun res!382850 () Bool)

(assert (=> b!597274 (= res!382850 (= (seekEntryOrOpen!0 (select (arr!17779 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6219 #b00000000000000000000000000000000)))))

(assert (=> b!597274 (=> (not res!382850) (not e!341282))))

(declare-fun b!597275 () Bool)

(assert (=> b!597275 (= e!341282 call!32917)))

(assert (= (and d!86781 (not res!382851)) b!597273))

(assert (= (and b!597273 c!67579) b!597274))

(assert (= (and b!597273 (not c!67579)) b!597272))

(assert (= (and b!597274 res!382850) b!597275))

(assert (= (or b!597275 b!597272) bm!32914))

(declare-fun m!574681 () Bool)

(assert (=> bm!32914 m!574681))

(assert (=> b!597273 m!574523))

(assert (=> b!597273 m!574523))

(assert (=> b!597273 m!574555))

(assert (=> b!597274 m!574523))

(declare-fun m!574687 () Bool)

(assert (=> b!597274 m!574687))

(declare-fun m!574689 () Bool)

(assert (=> b!597274 m!574689))

(assert (=> b!597274 m!574523))

(declare-fun m!574691 () Bool)

(assert (=> b!597274 m!574691))

(assert (=> b!596989 d!86781))

(declare-fun d!86793 () Bool)

(declare-fun e!341317 () Bool)

(assert (=> d!86793 e!341317))

(declare-fun res!382881 () Bool)

(assert (=> d!86793 (=> (not res!382881) (not e!341317))))

(assert (=> d!86793 (= res!382881 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18143 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18143 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18143 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18143 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18143 a!2986))))))

(declare-fun lt!271348 () Unit!18794)

(declare-fun choose!9 (array!37030 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18794)

(assert (=> d!86793 (= lt!271348 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271202 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86793 (validMask!0 mask!3053)))

(assert (=> d!86793 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271202 vacantSpotIndex!68 mask!3053) lt!271348)))

(declare-fun b!597315 () Bool)

(assert (=> b!597315 (= e!341317 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271202 vacantSpotIndex!68 (select (arr!17779 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271202 vacantSpotIndex!68 (select (store (arr!17779 a!2986) i!1108 k0!1786) j!136) (array!37031 (store (arr!17779 a!2986) i!1108 k0!1786) (size!18143 a!2986)) mask!3053)))))

(assert (= (and d!86793 res!382881) b!597315))

(declare-fun m!574737 () Bool)

(assert (=> d!86793 m!574737))

(assert (=> d!86793 m!574417))

(assert (=> b!597315 m!574459))

(assert (=> b!597315 m!574429))

(assert (=> b!597315 m!574415))

(assert (=> b!597315 m!574459))

(declare-fun m!574739 () Bool)

(assert (=> b!597315 m!574739))

(assert (=> b!597315 m!574415))

(assert (=> b!597315 m!574461))

(assert (=> b!596980 d!86793))

(declare-fun b!597316 () Bool)

(declare-fun e!341319 () SeekEntryResult!6219)

(declare-fun e!341320 () SeekEntryResult!6219)

(assert (=> b!597316 (= e!341319 e!341320)))

(declare-fun lt!271350 () (_ BitVec 64))

(declare-fun c!67585 () Bool)

(assert (=> b!597316 (= c!67585 (= lt!271350 (select (arr!17779 a!2986) j!136)))))

(declare-fun lt!271349 () SeekEntryResult!6219)

(declare-fun d!86819 () Bool)

(assert (=> d!86819 (and (or ((_ is Undefined!6219) lt!271349) (not ((_ is Found!6219) lt!271349)) (and (bvsge (index!27125 lt!271349) #b00000000000000000000000000000000) (bvslt (index!27125 lt!271349) (size!18143 a!2986)))) (or ((_ is Undefined!6219) lt!271349) ((_ is Found!6219) lt!271349) (not ((_ is MissingVacant!6219) lt!271349)) (not (= (index!27127 lt!271349) vacantSpotIndex!68)) (and (bvsge (index!27127 lt!271349) #b00000000000000000000000000000000) (bvslt (index!27127 lt!271349) (size!18143 a!2986)))) (or ((_ is Undefined!6219) lt!271349) (ite ((_ is Found!6219) lt!271349) (= (select (arr!17779 a!2986) (index!27125 lt!271349)) (select (arr!17779 a!2986) j!136)) (and ((_ is MissingVacant!6219) lt!271349) (= (index!27127 lt!271349) vacantSpotIndex!68) (= (select (arr!17779 a!2986) (index!27127 lt!271349)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86819 (= lt!271349 e!341319)))

(declare-fun c!67584 () Bool)

(assert (=> d!86819 (= c!67584 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86819 (= lt!271350 (select (arr!17779 a!2986) lt!271202))))

(assert (=> d!86819 (validMask!0 mask!3053)))

(assert (=> d!86819 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271202 vacantSpotIndex!68 (select (arr!17779 a!2986) j!136) a!2986 mask!3053) lt!271349)))

(declare-fun b!597317 () Bool)

(assert (=> b!597317 (= e!341320 (Found!6219 lt!271202))))

(declare-fun b!597318 () Bool)

(declare-fun e!341318 () SeekEntryResult!6219)

(assert (=> b!597318 (= e!341318 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271202 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17779 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597319 () Bool)

(assert (=> b!597319 (= e!341318 (MissingVacant!6219 vacantSpotIndex!68))))

(declare-fun b!597320 () Bool)

(assert (=> b!597320 (= e!341319 Undefined!6219)))

(declare-fun b!597321 () Bool)

(declare-fun c!67586 () Bool)

(assert (=> b!597321 (= c!67586 (= lt!271350 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597321 (= e!341320 e!341318)))

(assert (= (and d!86819 c!67584) b!597320))

(assert (= (and d!86819 (not c!67584)) b!597316))

(assert (= (and b!597316 c!67585) b!597317))

(assert (= (and b!597316 (not c!67585)) b!597321))

(assert (= (and b!597321 c!67586) b!597319))

(assert (= (and b!597321 (not c!67586)) b!597318))

(declare-fun m!574741 () Bool)

(assert (=> d!86819 m!574741))

(declare-fun m!574743 () Bool)

(assert (=> d!86819 m!574743))

(declare-fun m!574745 () Bool)

(assert (=> d!86819 m!574745))

(assert (=> d!86819 m!574417))

(declare-fun m!574747 () Bool)

(assert (=> b!597318 m!574747))

(assert (=> b!597318 m!574747))

(assert (=> b!597318 m!574415))

(declare-fun m!574749 () Bool)

(assert (=> b!597318 m!574749))

(assert (=> b!596980 d!86819))

(declare-fun d!86821 () Bool)

(declare-fun lt!271368 () (_ BitVec 32))

(assert (=> d!86821 (and (bvsge lt!271368 #b00000000000000000000000000000000) (bvslt lt!271368 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86821 (= lt!271368 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86821 (validMask!0 mask!3053)))

(assert (=> d!86821 (= (nextIndex!0 index!984 x!910 mask!3053) lt!271368)))

(declare-fun bs!18369 () Bool)

(assert (= bs!18369 d!86821))

(declare-fun m!574775 () Bool)

(assert (=> bs!18369 m!574775))

(assert (=> bs!18369 m!574417))

(assert (=> b!596980 d!86821))

(declare-fun b!597350 () Bool)

(declare-fun e!341339 () SeekEntryResult!6219)

(declare-fun e!341340 () SeekEntryResult!6219)

(assert (=> b!597350 (= e!341339 e!341340)))

(declare-fun c!67599 () Bool)

(declare-fun lt!271370 () (_ BitVec 64))

(assert (=> b!597350 (= c!67599 (= lt!271370 lt!271213))))

(declare-fun lt!271369 () SeekEntryResult!6219)

(declare-fun d!86831 () Bool)

(assert (=> d!86831 (and (or ((_ is Undefined!6219) lt!271369) (not ((_ is Found!6219) lt!271369)) (and (bvsge (index!27125 lt!271369) #b00000000000000000000000000000000) (bvslt (index!27125 lt!271369) (size!18143 lt!271210)))) (or ((_ is Undefined!6219) lt!271369) ((_ is Found!6219) lt!271369) (not ((_ is MissingVacant!6219) lt!271369)) (not (= (index!27127 lt!271369) vacantSpotIndex!68)) (and (bvsge (index!27127 lt!271369) #b00000000000000000000000000000000) (bvslt (index!27127 lt!271369) (size!18143 lt!271210)))) (or ((_ is Undefined!6219) lt!271369) (ite ((_ is Found!6219) lt!271369) (= (select (arr!17779 lt!271210) (index!27125 lt!271369)) lt!271213) (and ((_ is MissingVacant!6219) lt!271369) (= (index!27127 lt!271369) vacantSpotIndex!68) (= (select (arr!17779 lt!271210) (index!27127 lt!271369)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86831 (= lt!271369 e!341339)))

(declare-fun c!67598 () Bool)

(assert (=> d!86831 (= c!67598 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86831 (= lt!271370 (select (arr!17779 lt!271210) lt!271202))))

(assert (=> d!86831 (validMask!0 mask!3053)))

(assert (=> d!86831 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271202 vacantSpotIndex!68 lt!271213 lt!271210 mask!3053) lt!271369)))

(declare-fun b!597351 () Bool)

(assert (=> b!597351 (= e!341340 (Found!6219 lt!271202))))

(declare-fun b!597352 () Bool)

(declare-fun e!341338 () SeekEntryResult!6219)

(assert (=> b!597352 (= e!341338 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271202 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!271213 lt!271210 mask!3053))))

(declare-fun b!597353 () Bool)

(assert (=> b!597353 (= e!341338 (MissingVacant!6219 vacantSpotIndex!68))))

(declare-fun b!597354 () Bool)

(assert (=> b!597354 (= e!341339 Undefined!6219)))

(declare-fun b!597355 () Bool)

(declare-fun c!67600 () Bool)

(assert (=> b!597355 (= c!67600 (= lt!271370 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597355 (= e!341340 e!341338)))

(assert (= (and d!86831 c!67598) b!597354))

(assert (= (and d!86831 (not c!67598)) b!597350))

(assert (= (and b!597350 c!67599) b!597351))

(assert (= (and b!597350 (not c!67599)) b!597355))

(assert (= (and b!597355 c!67600) b!597353))

(assert (= (and b!597355 (not c!67600)) b!597352))

(declare-fun m!574783 () Bool)

(assert (=> d!86831 m!574783))

(declare-fun m!574785 () Bool)

(assert (=> d!86831 m!574785))

(declare-fun m!574787 () Bool)

(assert (=> d!86831 m!574787))

(assert (=> d!86831 m!574417))

(assert (=> b!597352 m!574747))

(assert (=> b!597352 m!574747))

(declare-fun m!574789 () Bool)

(assert (=> b!597352 m!574789))

(assert (=> b!596980 d!86831))

(declare-fun b!597356 () Bool)

(declare-fun e!341342 () SeekEntryResult!6219)

(declare-fun e!341343 () SeekEntryResult!6219)

(assert (=> b!597356 (= e!341342 e!341343)))

(declare-fun c!67602 () Bool)

(declare-fun lt!271372 () (_ BitVec 64))

(assert (=> b!597356 (= c!67602 (= lt!271372 lt!271213))))

(declare-fun d!86833 () Bool)

(declare-fun lt!271371 () SeekEntryResult!6219)

(assert (=> d!86833 (and (or ((_ is Undefined!6219) lt!271371) (not ((_ is Found!6219) lt!271371)) (and (bvsge (index!27125 lt!271371) #b00000000000000000000000000000000) (bvslt (index!27125 lt!271371) (size!18143 lt!271210)))) (or ((_ is Undefined!6219) lt!271371) ((_ is Found!6219) lt!271371) (not ((_ is MissingVacant!6219) lt!271371)) (not (= (index!27127 lt!271371) vacantSpotIndex!68)) (and (bvsge (index!27127 lt!271371) #b00000000000000000000000000000000) (bvslt (index!27127 lt!271371) (size!18143 lt!271210)))) (or ((_ is Undefined!6219) lt!271371) (ite ((_ is Found!6219) lt!271371) (= (select (arr!17779 lt!271210) (index!27125 lt!271371)) lt!271213) (and ((_ is MissingVacant!6219) lt!271371) (= (index!27127 lt!271371) vacantSpotIndex!68) (= (select (arr!17779 lt!271210) (index!27127 lt!271371)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86833 (= lt!271371 e!341342)))

(declare-fun c!67601 () Bool)

(assert (=> d!86833 (= c!67601 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86833 (= lt!271372 (select (arr!17779 lt!271210) index!984))))

(assert (=> d!86833 (validMask!0 mask!3053)))

(assert (=> d!86833 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271213 lt!271210 mask!3053) lt!271371)))

(declare-fun b!597357 () Bool)

(assert (=> b!597357 (= e!341343 (Found!6219 index!984))))

(declare-fun e!341341 () SeekEntryResult!6219)

(declare-fun b!597358 () Bool)

(assert (=> b!597358 (= e!341341 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!271213 lt!271210 mask!3053))))

(declare-fun b!597359 () Bool)

(assert (=> b!597359 (= e!341341 (MissingVacant!6219 vacantSpotIndex!68))))

(declare-fun b!597360 () Bool)

(assert (=> b!597360 (= e!341342 Undefined!6219)))

(declare-fun b!597361 () Bool)

(declare-fun c!67603 () Bool)

(assert (=> b!597361 (= c!67603 (= lt!271372 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597361 (= e!341343 e!341341)))

(assert (= (and d!86833 c!67601) b!597360))

(assert (= (and d!86833 (not c!67601)) b!597356))

(assert (= (and b!597356 c!67602) b!597357))

(assert (= (and b!597356 (not c!67602)) b!597361))

(assert (= (and b!597361 c!67603) b!597359))

(assert (= (and b!597361 (not c!67603)) b!597358))

(declare-fun m!574793 () Bool)

(assert (=> d!86833 m!574793))

(declare-fun m!574795 () Bool)

(assert (=> d!86833 m!574795))

(assert (=> d!86833 m!574527))

(assert (=> d!86833 m!574417))

(assert (=> b!597358 m!574457))

(assert (=> b!597358 m!574457))

(declare-fun m!574803 () Bool)

(assert (=> b!597358 m!574803))

(assert (=> b!596980 d!86833))

(check-sat (not b!597093) (not b!597078) (not b!597061) (not b!597273) (not b!597213) (not d!86793) (not b!597112) (not b!597111) (not bm!32914) (not d!86741) (not b!597095) (not d!86771) (not d!86831) (not d!86821) (not d!86819) (not b!597076) (not b!597315) (not b!597352) (not b!597318) (not d!86833) (not bm!32903) (not d!86737) (not d!86745) (not b!597175) (not b!597358) (not b!597274) (not b!597110) (not b!597077) (not bm!32904) (not b!597059) (not b!597063))
(check-sat)
