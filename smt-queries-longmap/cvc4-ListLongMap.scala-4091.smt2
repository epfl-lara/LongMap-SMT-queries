; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56048 () Bool)

(assert start!56048)

(declare-fun b!617123 () Bool)

(declare-fun res!397554 () Bool)

(declare-fun e!353877 () Bool)

(assert (=> b!617123 (=> (not res!397554) (not e!353877))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37518 0))(
  ( (array!37519 (arr!18005 (Array (_ BitVec 32) (_ BitVec 64))) (size!18369 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37518)

(assert (=> b!617123 (= res!397554 (and (= (size!18369 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18369 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18369 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617124 () Bool)

(declare-datatypes ((Unit!20178 0))(
  ( (Unit!20179) )
))
(declare-fun e!353872 () Unit!20178)

(declare-fun Unit!20180 () Unit!20178)

(assert (=> b!617124 (= e!353872 Unit!20180)))

(declare-fun b!617125 () Bool)

(declare-fun res!397549 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!617125 (= res!397549 (bvsge j!136 index!984))))

(declare-fun e!353876 () Bool)

(assert (=> b!617125 (=> res!397549 e!353876)))

(declare-fun e!353863 () Bool)

(assert (=> b!617125 (= e!353863 e!353876)))

(declare-fun b!617126 () Bool)

(declare-fun res!397557 () Bool)

(declare-fun e!353873 () Bool)

(assert (=> b!617126 (=> (not res!397557) (not e!353873))))

(declare-datatypes ((List!12046 0))(
  ( (Nil!12043) (Cons!12042 (h!13087 (_ BitVec 64)) (t!18274 List!12046)) )
))
(declare-fun arrayNoDuplicates!0 (array!37518 (_ BitVec 32) List!12046) Bool)

(assert (=> b!617126 (= res!397557 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12043))))

(declare-fun b!617127 () Bool)

(assert (=> b!617127 false))

(declare-fun lt!284076 () array!37518)

(declare-fun lt!284060 () Unit!20178)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37518 (_ BitVec 64) (_ BitVec 32) List!12046) Unit!20178)

(assert (=> b!617127 (= lt!284060 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284076 (select (arr!18005 a!2986) j!136) j!136 Nil!12043))))

(assert (=> b!617127 (arrayNoDuplicates!0 lt!284076 j!136 Nil!12043)))

(declare-fun lt!284071 () Unit!20178)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37518 (_ BitVec 32) (_ BitVec 32)) Unit!20178)

(assert (=> b!617127 (= lt!284071 (lemmaNoDuplicateFromThenFromBigger!0 lt!284076 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617127 (arrayNoDuplicates!0 lt!284076 #b00000000000000000000000000000000 Nil!12043)))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!284070 () Unit!20178)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37518 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12046) Unit!20178)

(assert (=> b!617127 (= lt!284070 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12043))))

(declare-fun arrayContainsKey!0 (array!37518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617127 (arrayContainsKey!0 lt!284076 (select (arr!18005 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284072 () Unit!20178)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37518 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20178)

(assert (=> b!617127 (= lt!284072 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284076 (select (arr!18005 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!353865 () Unit!20178)

(declare-fun Unit!20181 () Unit!20178)

(assert (=> b!617127 (= e!353865 Unit!20181)))

(declare-fun b!617128 () Bool)

(declare-fun res!397562 () Bool)

(assert (=> b!617128 (=> (not res!397562) (not e!353877))))

(assert (=> b!617128 (= res!397562 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617129 () Bool)

(assert (=> b!617129 false))

(declare-fun lt!284069 () Unit!20178)

(assert (=> b!617129 (= lt!284069 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284076 (select (arr!18005 a!2986) j!136) index!984 Nil!12043))))

(assert (=> b!617129 (arrayNoDuplicates!0 lt!284076 index!984 Nil!12043)))

(declare-fun lt!284061 () Unit!20178)

(assert (=> b!617129 (= lt!284061 (lemmaNoDuplicateFromThenFromBigger!0 lt!284076 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617129 (arrayNoDuplicates!0 lt!284076 #b00000000000000000000000000000000 Nil!12043)))

(declare-fun lt!284074 () Unit!20178)

(assert (=> b!617129 (= lt!284074 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12043))))

(assert (=> b!617129 (arrayContainsKey!0 lt!284076 (select (arr!18005 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284073 () Unit!20178)

(assert (=> b!617129 (= lt!284073 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284076 (select (arr!18005 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353866 () Bool)

(assert (=> b!617129 e!353866))

(declare-fun res!397564 () Bool)

(assert (=> b!617129 (=> (not res!397564) (not e!353866))))

(assert (=> b!617129 (= res!397564 (arrayContainsKey!0 lt!284076 (select (arr!18005 a!2986) j!136) j!136))))

(declare-fun e!353864 () Unit!20178)

(declare-fun Unit!20182 () Unit!20178)

(assert (=> b!617129 (= e!353864 Unit!20182)))

(declare-fun b!617130 () Bool)

(declare-fun e!353874 () Bool)

(declare-fun e!353871 () Bool)

(assert (=> b!617130 (= e!353874 e!353871)))

(declare-fun res!397561 () Bool)

(assert (=> b!617130 (=> (not res!397561) (not e!353871))))

(declare-datatypes ((SeekEntryResult!6445 0))(
  ( (MissingZero!6445 (index!28064 (_ BitVec 32))) (Found!6445 (index!28065 (_ BitVec 32))) (Intermediate!6445 (undefined!7257 Bool) (index!28066 (_ BitVec 32)) (x!56853 (_ BitVec 32))) (Undefined!6445) (MissingVacant!6445 (index!28067 (_ BitVec 32))) )
))
(declare-fun lt!284064 () SeekEntryResult!6445)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!617130 (= res!397561 (and (= lt!284064 (Found!6445 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18005 a!2986) index!984) (select (arr!18005 a!2986) j!136))) (not (= (select (arr!18005 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37518 (_ BitVec 32)) SeekEntryResult!6445)

(assert (=> b!617130 (= lt!284064 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18005 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617131 () Bool)

(declare-fun e!353869 () Bool)

(assert (=> b!617131 (= e!353871 (not e!353869))))

(declare-fun res!397558 () Bool)

(assert (=> b!617131 (=> res!397558 e!353869)))

(declare-fun lt!284063 () SeekEntryResult!6445)

(assert (=> b!617131 (= res!397558 (not (= lt!284063 (MissingVacant!6445 vacantSpotIndex!68))))))

(declare-fun lt!284068 () Unit!20178)

(declare-fun e!353875 () Unit!20178)

(assert (=> b!617131 (= lt!284068 e!353875)))

(declare-fun c!70154 () Bool)

(assert (=> b!617131 (= c!70154 (= lt!284063 (Found!6445 index!984)))))

(declare-fun lt!284065 () Unit!20178)

(assert (=> b!617131 (= lt!284065 e!353872)))

(declare-fun c!70156 () Bool)

(assert (=> b!617131 (= c!70156 (= lt!284063 Undefined!6445))))

(declare-fun lt!284062 () (_ BitVec 64))

(assert (=> b!617131 (= lt!284063 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284062 lt!284076 mask!3053))))

(declare-fun e!353867 () Bool)

(assert (=> b!617131 e!353867))

(declare-fun res!397551 () Bool)

(assert (=> b!617131 (=> (not res!397551) (not e!353867))))

(declare-fun lt!284075 () SeekEntryResult!6445)

(declare-fun lt!284059 () (_ BitVec 32))

(assert (=> b!617131 (= res!397551 (= lt!284075 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284059 vacantSpotIndex!68 lt!284062 lt!284076 mask!3053)))))

(assert (=> b!617131 (= lt!284075 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284059 vacantSpotIndex!68 (select (arr!18005 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617131 (= lt!284062 (select (store (arr!18005 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!284058 () Unit!20178)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37518 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20178)

(assert (=> b!617131 (= lt!284058 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284059 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617131 (= lt!284059 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!617132 () Bool)

(declare-fun res!397556 () Bool)

(assert (=> b!617132 (=> (not res!397556) (not e!353873))))

(assert (=> b!617132 (= res!397556 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18005 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!397555 () Bool)

(assert (=> start!56048 (=> (not res!397555) (not e!353877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56048 (= res!397555 (validMask!0 mask!3053))))

(assert (=> start!56048 e!353877))

(assert (=> start!56048 true))

(declare-fun array_inv!13801 (array!37518) Bool)

(assert (=> start!56048 (array_inv!13801 a!2986)))

(declare-fun b!617133 () Bool)

(declare-fun res!397550 () Bool)

(assert (=> b!617133 (= res!397550 (arrayContainsKey!0 lt!284076 (select (arr!18005 a!2986) j!136) j!136))))

(declare-fun e!353868 () Bool)

(assert (=> b!617133 (=> (not res!397550) (not e!353868))))

(assert (=> b!617133 (= e!353876 e!353868)))

(declare-fun b!617134 () Bool)

(assert (=> b!617134 (= e!353873 e!353874)))

(declare-fun res!397563 () Bool)

(assert (=> b!617134 (=> (not res!397563) (not e!353874))))

(assert (=> b!617134 (= res!397563 (= (select (store (arr!18005 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!617134 (= lt!284076 (array!37519 (store (arr!18005 a!2986) i!1108 k!1786) (size!18369 a!2986)))))

(declare-fun b!617135 () Bool)

(declare-fun res!397559 () Bool)

(assert (=> b!617135 (=> (not res!397559) (not e!353873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37518 (_ BitVec 32)) Bool)

(assert (=> b!617135 (= res!397559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617136 () Bool)

(declare-fun Unit!20183 () Unit!20178)

(assert (=> b!617136 (= e!353875 Unit!20183)))

(declare-fun res!397552 () Bool)

(assert (=> b!617136 (= res!397552 (= (select (store (arr!18005 a!2986) i!1108 k!1786) index!984) (select (arr!18005 a!2986) j!136)))))

(assert (=> b!617136 (=> (not res!397552) (not e!353863))))

(assert (=> b!617136 e!353863))

(declare-fun c!70157 () Bool)

(assert (=> b!617136 (= c!70157 (bvslt j!136 index!984))))

(declare-fun lt!284077 () Unit!20178)

(assert (=> b!617136 (= lt!284077 e!353865)))

(declare-fun c!70155 () Bool)

(assert (=> b!617136 (= c!70155 (bvslt index!984 j!136))))

(declare-fun lt!284066 () Unit!20178)

(assert (=> b!617136 (= lt!284066 e!353864)))

(assert (=> b!617136 false))

(declare-fun b!617137 () Bool)

(declare-fun Unit!20184 () Unit!20178)

(assert (=> b!617137 (= e!353872 Unit!20184)))

(assert (=> b!617137 false))

(declare-fun b!617138 () Bool)

(declare-fun Unit!20185 () Unit!20178)

(assert (=> b!617138 (= e!353865 Unit!20185)))

(declare-fun b!617139 () Bool)

(declare-fun res!397565 () Bool)

(assert (=> b!617139 (=> (not res!397565) (not e!353877))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617139 (= res!397565 (validKeyInArray!0 (select (arr!18005 a!2986) j!136)))))

(declare-fun b!617140 () Bool)

(declare-fun Unit!20186 () Unit!20178)

(assert (=> b!617140 (= e!353875 Unit!20186)))

(declare-fun b!617141 () Bool)

(assert (=> b!617141 (= e!353867 (= lt!284064 lt!284075))))

(declare-fun b!617142 () Bool)

(assert (=> b!617142 (= e!353868 (arrayContainsKey!0 lt!284076 (select (arr!18005 a!2986) j!136) index!984))))

(declare-fun b!617143 () Bool)

(declare-fun res!397560 () Bool)

(assert (=> b!617143 (=> (not res!397560) (not e!353877))))

(assert (=> b!617143 (= res!397560 (validKeyInArray!0 k!1786))))

(declare-fun b!617144 () Bool)

(assert (=> b!617144 (= e!353869 true)))

(assert (=> b!617144 (= (select (store (arr!18005 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!617145 () Bool)

(assert (=> b!617145 (= e!353877 e!353873)))

(declare-fun res!397553 () Bool)

(assert (=> b!617145 (=> (not res!397553) (not e!353873))))

(declare-fun lt!284067 () SeekEntryResult!6445)

(assert (=> b!617145 (= res!397553 (or (= lt!284067 (MissingZero!6445 i!1108)) (= lt!284067 (MissingVacant!6445 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37518 (_ BitVec 32)) SeekEntryResult!6445)

(assert (=> b!617145 (= lt!284067 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!617146 () Bool)

(declare-fun Unit!20187 () Unit!20178)

(assert (=> b!617146 (= e!353864 Unit!20187)))

(declare-fun b!617147 () Bool)

(assert (=> b!617147 (= e!353866 (arrayContainsKey!0 lt!284076 (select (arr!18005 a!2986) j!136) index!984))))

(assert (= (and start!56048 res!397555) b!617123))

(assert (= (and b!617123 res!397554) b!617139))

(assert (= (and b!617139 res!397565) b!617143))

(assert (= (and b!617143 res!397560) b!617128))

(assert (= (and b!617128 res!397562) b!617145))

(assert (= (and b!617145 res!397553) b!617135))

(assert (= (and b!617135 res!397559) b!617126))

(assert (= (and b!617126 res!397557) b!617132))

(assert (= (and b!617132 res!397556) b!617134))

(assert (= (and b!617134 res!397563) b!617130))

(assert (= (and b!617130 res!397561) b!617131))

(assert (= (and b!617131 res!397551) b!617141))

(assert (= (and b!617131 c!70156) b!617137))

(assert (= (and b!617131 (not c!70156)) b!617124))

(assert (= (and b!617131 c!70154) b!617136))

(assert (= (and b!617131 (not c!70154)) b!617140))

(assert (= (and b!617136 res!397552) b!617125))

(assert (= (and b!617125 (not res!397549)) b!617133))

(assert (= (and b!617133 res!397550) b!617142))

(assert (= (and b!617136 c!70157) b!617127))

(assert (= (and b!617136 (not c!70157)) b!617138))

(assert (= (and b!617136 c!70155) b!617129))

(assert (= (and b!617136 (not c!70155)) b!617146))

(assert (= (and b!617129 res!397564) b!617147))

(assert (= (and b!617131 (not res!397558)) b!617144))

(declare-fun m!593251 () Bool)

(assert (=> b!617139 m!593251))

(assert (=> b!617139 m!593251))

(declare-fun m!593253 () Bool)

(assert (=> b!617139 m!593253))

(declare-fun m!593255 () Bool)

(assert (=> b!617143 m!593255))

(declare-fun m!593257 () Bool)

(assert (=> b!617134 m!593257))

(declare-fun m!593259 () Bool)

(assert (=> b!617134 m!593259))

(declare-fun m!593261 () Bool)

(assert (=> b!617130 m!593261))

(assert (=> b!617130 m!593251))

(assert (=> b!617130 m!593251))

(declare-fun m!593263 () Bool)

(assert (=> b!617130 m!593263))

(assert (=> b!617144 m!593257))

(declare-fun m!593265 () Bool)

(assert (=> b!617144 m!593265))

(declare-fun m!593267 () Bool)

(assert (=> b!617131 m!593267))

(assert (=> b!617131 m!593251))

(assert (=> b!617131 m!593257))

(assert (=> b!617131 m!593251))

(declare-fun m!593269 () Bool)

(assert (=> b!617131 m!593269))

(declare-fun m!593271 () Bool)

(assert (=> b!617131 m!593271))

(declare-fun m!593273 () Bool)

(assert (=> b!617131 m!593273))

(declare-fun m!593275 () Bool)

(assert (=> b!617131 m!593275))

(declare-fun m!593277 () Bool)

(assert (=> b!617131 m!593277))

(declare-fun m!593279 () Bool)

(assert (=> b!617145 m!593279))

(declare-fun m!593281 () Bool)

(assert (=> b!617128 m!593281))

(assert (=> b!617142 m!593251))

(assert (=> b!617142 m!593251))

(declare-fun m!593283 () Bool)

(assert (=> b!617142 m!593283))

(assert (=> b!617133 m!593251))

(assert (=> b!617133 m!593251))

(declare-fun m!593285 () Bool)

(assert (=> b!617133 m!593285))

(declare-fun m!593287 () Bool)

(assert (=> start!56048 m!593287))

(declare-fun m!593289 () Bool)

(assert (=> start!56048 m!593289))

(assert (=> b!617129 m!593251))

(declare-fun m!593291 () Bool)

(assert (=> b!617129 m!593291))

(declare-fun m!593293 () Bool)

(assert (=> b!617129 m!593293))

(assert (=> b!617129 m!593251))

(declare-fun m!593295 () Bool)

(assert (=> b!617129 m!593295))

(assert (=> b!617129 m!593251))

(assert (=> b!617129 m!593285))

(declare-fun m!593297 () Bool)

(assert (=> b!617129 m!593297))

(assert (=> b!617129 m!593251))

(declare-fun m!593299 () Bool)

(assert (=> b!617129 m!593299))

(declare-fun m!593301 () Bool)

(assert (=> b!617129 m!593301))

(assert (=> b!617129 m!593251))

(declare-fun m!593303 () Bool)

(assert (=> b!617129 m!593303))

(declare-fun m!593305 () Bool)

(assert (=> b!617126 m!593305))

(assert (=> b!617136 m!593257))

(assert (=> b!617136 m!593265))

(assert (=> b!617136 m!593251))

(declare-fun m!593307 () Bool)

(assert (=> b!617135 m!593307))

(declare-fun m!593309 () Bool)

(assert (=> b!617132 m!593309))

(assert (=> b!617147 m!593251))

(assert (=> b!617147 m!593251))

(assert (=> b!617147 m!593283))

(assert (=> b!617127 m!593251))

(assert (=> b!617127 m!593251))

(declare-fun m!593311 () Bool)

(assert (=> b!617127 m!593311))

(declare-fun m!593313 () Bool)

(assert (=> b!617127 m!593313))

(assert (=> b!617127 m!593251))

(declare-fun m!593315 () Bool)

(assert (=> b!617127 m!593315))

(assert (=> b!617127 m!593251))

(declare-fun m!593317 () Bool)

(assert (=> b!617127 m!593317))

(assert (=> b!617127 m!593301))

(declare-fun m!593319 () Bool)

(assert (=> b!617127 m!593319))

(assert (=> b!617127 m!593291))

(push 1)

