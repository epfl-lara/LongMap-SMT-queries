; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55916 () Bool)

(assert start!55916)

(declare-fun b!612193 () Bool)

(declare-fun res!393812 () Bool)

(declare-fun e!350885 () Bool)

(assert (=> b!612193 (=> (not res!393812) (not e!350885))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37386 0))(
  ( (array!37387 (arr!17939 (Array (_ BitVec 32) (_ BitVec 64))) (size!18303 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37386)

(assert (=> b!612193 (= res!393812 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17939 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!612195 () Bool)

(declare-fun e!350881 () Bool)

(declare-fun e!350880 () Bool)

(assert (=> b!612195 (= e!350881 (not e!350880))))

(declare-fun res!393808 () Bool)

(assert (=> b!612195 (=> res!393808 e!350880)))

(declare-datatypes ((SeekEntryResult!6379 0))(
  ( (MissingZero!6379 (index!27800 (_ BitVec 32))) (Found!6379 (index!27801 (_ BitVec 32))) (Intermediate!6379 (undefined!7191 Bool) (index!27802 (_ BitVec 32)) (x!56611 (_ BitVec 32))) (Undefined!6379) (MissingVacant!6379 (index!27803 (_ BitVec 32))) )
))
(declare-fun lt!280245 () SeekEntryResult!6379)

(assert (=> b!612195 (= res!393808 (not (= lt!280245 (Found!6379 index!984))))))

(declare-datatypes ((Unit!19654 0))(
  ( (Unit!19655) )
))
(declare-fun lt!280251 () Unit!19654)

(declare-fun e!350879 () Unit!19654)

(assert (=> b!612195 (= lt!280251 e!350879)))

(declare-fun c!69563 () Bool)

(assert (=> b!612195 (= c!69563 (= lt!280245 Undefined!6379))))

(declare-fun lt!280250 () array!37386)

(declare-fun lt!280247 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37386 (_ BitVec 32)) SeekEntryResult!6379)

(assert (=> b!612195 (= lt!280245 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280247 lt!280250 mask!3053))))

(declare-fun e!350888 () Bool)

(assert (=> b!612195 e!350888))

(declare-fun res!393804 () Bool)

(assert (=> b!612195 (=> (not res!393804) (not e!350888))))

(declare-fun lt!280238 () (_ BitVec 32))

(declare-fun lt!280240 () SeekEntryResult!6379)

(assert (=> b!612195 (= res!393804 (= lt!280240 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280238 vacantSpotIndex!68 lt!280247 lt!280250 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!612195 (= lt!280240 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280238 vacantSpotIndex!68 (select (arr!17939 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!612195 (= lt!280247 (select (store (arr!17939 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!280246 () Unit!19654)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37386 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19654)

(assert (=> b!612195 (= lt!280246 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280238 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612195 (= lt!280238 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!612196 () Bool)

(declare-fun Unit!19656 () Unit!19654)

(assert (=> b!612196 (= e!350879 Unit!19656)))

(declare-fun b!612197 () Bool)

(declare-fun res!393819 () Bool)

(assert (=> b!612197 (=> (not res!393819) (not e!350885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37386 (_ BitVec 32)) Bool)

(assert (=> b!612197 (= res!393819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!612198 () Bool)

(declare-fun Unit!19657 () Unit!19654)

(assert (=> b!612198 (= e!350879 Unit!19657)))

(assert (=> b!612198 false))

(declare-fun b!612199 () Bool)

(declare-fun e!350882 () Bool)

(assert (=> b!612199 (= e!350882 true)))

(declare-datatypes ((List!11980 0))(
  ( (Nil!11977) (Cons!11976 (h!13021 (_ BitVec 64)) (t!18208 List!11980)) )
))
(declare-fun arrayNoDuplicates!0 (array!37386 (_ BitVec 32) List!11980) Bool)

(assert (=> b!612199 (arrayNoDuplicates!0 lt!280250 #b00000000000000000000000000000000 Nil!11977)))

(declare-fun lt!280249 () Unit!19654)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37386 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11980) Unit!19654)

(assert (=> b!612199 (= lt!280249 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11977))))

(declare-fun arrayContainsKey!0 (array!37386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612199 (arrayContainsKey!0 lt!280250 (select (arr!17939 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280248 () Unit!19654)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37386 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19654)

(assert (=> b!612199 (= lt!280248 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280250 (select (arr!17939 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!350883 () Bool)

(assert (=> b!612199 e!350883))

(declare-fun res!393810 () Bool)

(assert (=> b!612199 (=> (not res!393810) (not e!350883))))

(assert (=> b!612199 (= res!393810 (arrayContainsKey!0 lt!280250 (select (arr!17939 a!2986) j!136) j!136))))

(declare-fun b!612200 () Bool)

(declare-fun e!350886 () Bool)

(assert (=> b!612200 (= e!350886 e!350881)))

(declare-fun res!393818 () Bool)

(assert (=> b!612200 (=> (not res!393818) (not e!350881))))

(declare-fun lt!280243 () SeekEntryResult!6379)

(assert (=> b!612200 (= res!393818 (and (= lt!280243 (Found!6379 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17939 a!2986) index!984) (select (arr!17939 a!2986) j!136))) (not (= (select (arr!17939 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!612200 (= lt!280243 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17939 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!612201 () Bool)

(declare-fun e!350876 () Bool)

(assert (=> b!612201 (= e!350876 (arrayContainsKey!0 lt!280250 (select (arr!17939 a!2986) j!136) index!984))))

(declare-fun b!612202 () Bool)

(declare-fun e!350875 () Bool)

(assert (=> b!612202 (= e!350880 e!350875)))

(declare-fun res!393807 () Bool)

(assert (=> b!612202 (=> res!393807 e!350875)))

(declare-fun lt!280242 () (_ BitVec 64))

(assert (=> b!612202 (= res!393807 (or (not (= (select (arr!17939 a!2986) j!136) lt!280247)) (not (= (select (arr!17939 a!2986) j!136) lt!280242))))))

(declare-fun e!350884 () Bool)

(assert (=> b!612202 e!350884))

(declare-fun res!393817 () Bool)

(assert (=> b!612202 (=> (not res!393817) (not e!350884))))

(assert (=> b!612202 (= res!393817 (= lt!280242 (select (arr!17939 a!2986) j!136)))))

(assert (=> b!612202 (= lt!280242 (select (store (arr!17939 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!612203 () Bool)

(declare-fun e!350878 () Bool)

(assert (=> b!612203 (= e!350884 e!350878)))

(declare-fun res!393809 () Bool)

(assert (=> b!612203 (=> res!393809 e!350878)))

(assert (=> b!612203 (= res!393809 (or (not (= (select (arr!17939 a!2986) j!136) lt!280247)) (not (= (select (arr!17939 a!2986) j!136) lt!280242)) (bvsge j!136 index!984)))))

(declare-fun res!393803 () Bool)

(declare-fun e!350877 () Bool)

(assert (=> start!55916 (=> (not res!393803) (not e!350877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55916 (= res!393803 (validMask!0 mask!3053))))

(assert (=> start!55916 e!350877))

(assert (=> start!55916 true))

(declare-fun array_inv!13735 (array!37386) Bool)

(assert (=> start!55916 (array_inv!13735 a!2986)))

(declare-fun b!612194 () Bool)

(assert (=> b!612194 (= e!350883 (arrayContainsKey!0 lt!280250 (select (arr!17939 a!2986) j!136) index!984))))

(declare-fun b!612204 () Bool)

(declare-fun res!393806 () Bool)

(assert (=> b!612204 (=> (not res!393806) (not e!350877))))

(assert (=> b!612204 (= res!393806 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!612205 () Bool)

(assert (=> b!612205 (= e!350878 e!350876)))

(declare-fun res!393805 () Bool)

(assert (=> b!612205 (=> (not res!393805) (not e!350876))))

(assert (=> b!612205 (= res!393805 (arrayContainsKey!0 lt!280250 (select (arr!17939 a!2986) j!136) j!136))))

(declare-fun b!612206 () Bool)

(declare-fun res!393813 () Bool)

(assert (=> b!612206 (=> (not res!393813) (not e!350877))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!612206 (= res!393813 (validKeyInArray!0 k!1786))))

(declare-fun b!612207 () Bool)

(assert (=> b!612207 (= e!350885 e!350886)))

(declare-fun res!393820 () Bool)

(assert (=> b!612207 (=> (not res!393820) (not e!350886))))

(assert (=> b!612207 (= res!393820 (= (select (store (arr!17939 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!612207 (= lt!280250 (array!37387 (store (arr!17939 a!2986) i!1108 k!1786) (size!18303 a!2986)))))

(declare-fun b!612208 () Bool)

(declare-fun e!350889 () Unit!19654)

(declare-fun Unit!19658 () Unit!19654)

(assert (=> b!612208 (= e!350889 Unit!19658)))

(declare-fun b!612209 () Bool)

(declare-fun res!393814 () Bool)

(assert (=> b!612209 (=> (not res!393814) (not e!350885))))

(assert (=> b!612209 (= res!393814 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11977))))

(declare-fun b!612210 () Bool)

(declare-fun res!393821 () Bool)

(assert (=> b!612210 (=> (not res!393821) (not e!350877))))

(assert (=> b!612210 (= res!393821 (validKeyInArray!0 (select (arr!17939 a!2986) j!136)))))

(declare-fun b!612211 () Bool)

(assert (=> b!612211 (= e!350875 e!350882)))

(declare-fun res!393815 () Bool)

(assert (=> b!612211 (=> res!393815 e!350882)))

(assert (=> b!612211 (= res!393815 (bvsge index!984 j!136))))

(declare-fun lt!280239 () Unit!19654)

(assert (=> b!612211 (= lt!280239 e!350889)))

(declare-fun c!69562 () Bool)

(assert (=> b!612211 (= c!69562 (bvslt j!136 index!984))))

(declare-fun b!612212 () Bool)

(assert (=> b!612212 (= e!350888 (= lt!280243 lt!280240))))

(declare-fun b!612213 () Bool)

(declare-fun Unit!19659 () Unit!19654)

(assert (=> b!612213 (= e!350889 Unit!19659)))

(declare-fun lt!280241 () Unit!19654)

(assert (=> b!612213 (= lt!280241 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280250 (select (arr!17939 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!612213 (arrayContainsKey!0 lt!280250 (select (arr!17939 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280244 () Unit!19654)

(assert (=> b!612213 (= lt!280244 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11977))))

(assert (=> b!612213 (arrayNoDuplicates!0 lt!280250 #b00000000000000000000000000000000 Nil!11977)))

(declare-fun lt!280237 () Unit!19654)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37386 (_ BitVec 32) (_ BitVec 32)) Unit!19654)

(assert (=> b!612213 (= lt!280237 (lemmaNoDuplicateFromThenFromBigger!0 lt!280250 #b00000000000000000000000000000000 j!136))))

(assert (=> b!612213 (arrayNoDuplicates!0 lt!280250 j!136 Nil!11977)))

(declare-fun lt!280252 () Unit!19654)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37386 (_ BitVec 64) (_ BitVec 32) List!11980) Unit!19654)

(assert (=> b!612213 (= lt!280252 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280250 (select (arr!17939 a!2986) j!136) j!136 Nil!11977))))

(assert (=> b!612213 false))

(declare-fun b!612214 () Bool)

(declare-fun res!393811 () Bool)

(assert (=> b!612214 (=> (not res!393811) (not e!350877))))

(assert (=> b!612214 (= res!393811 (and (= (size!18303 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18303 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18303 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612215 () Bool)

(assert (=> b!612215 (= e!350877 e!350885)))

(declare-fun res!393816 () Bool)

(assert (=> b!612215 (=> (not res!393816) (not e!350885))))

(declare-fun lt!280236 () SeekEntryResult!6379)

(assert (=> b!612215 (= res!393816 (or (= lt!280236 (MissingZero!6379 i!1108)) (= lt!280236 (MissingVacant!6379 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37386 (_ BitVec 32)) SeekEntryResult!6379)

(assert (=> b!612215 (= lt!280236 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!55916 res!393803) b!612214))

(assert (= (and b!612214 res!393811) b!612210))

(assert (= (and b!612210 res!393821) b!612206))

(assert (= (and b!612206 res!393813) b!612204))

(assert (= (and b!612204 res!393806) b!612215))

(assert (= (and b!612215 res!393816) b!612197))

(assert (= (and b!612197 res!393819) b!612209))

(assert (= (and b!612209 res!393814) b!612193))

(assert (= (and b!612193 res!393812) b!612207))

(assert (= (and b!612207 res!393820) b!612200))

(assert (= (and b!612200 res!393818) b!612195))

(assert (= (and b!612195 res!393804) b!612212))

(assert (= (and b!612195 c!69563) b!612198))

(assert (= (and b!612195 (not c!69563)) b!612196))

(assert (= (and b!612195 (not res!393808)) b!612202))

(assert (= (and b!612202 res!393817) b!612203))

(assert (= (and b!612203 (not res!393809)) b!612205))

(assert (= (and b!612205 res!393805) b!612201))

(assert (= (and b!612202 (not res!393807)) b!612211))

(assert (= (and b!612211 c!69562) b!612213))

(assert (= (and b!612211 (not c!69562)) b!612208))

(assert (= (and b!612211 (not res!393815)) b!612199))

(assert (= (and b!612199 res!393810) b!612194))

(declare-fun m!588559 () Bool)

(assert (=> b!612207 m!588559))

(declare-fun m!588561 () Bool)

(assert (=> b!612207 m!588561))

(declare-fun m!588563 () Bool)

(assert (=> b!612200 m!588563))

(declare-fun m!588565 () Bool)

(assert (=> b!612200 m!588565))

(assert (=> b!612200 m!588565))

(declare-fun m!588567 () Bool)

(assert (=> b!612200 m!588567))

(declare-fun m!588569 () Bool)

(assert (=> b!612209 m!588569))

(declare-fun m!588571 () Bool)

(assert (=> b!612195 m!588571))

(declare-fun m!588573 () Bool)

(assert (=> b!612195 m!588573))

(declare-fun m!588575 () Bool)

(assert (=> b!612195 m!588575))

(assert (=> b!612195 m!588565))

(assert (=> b!612195 m!588559))

(declare-fun m!588577 () Bool)

(assert (=> b!612195 m!588577))

(assert (=> b!612195 m!588565))

(declare-fun m!588579 () Bool)

(assert (=> b!612195 m!588579))

(declare-fun m!588581 () Bool)

(assert (=> b!612195 m!588581))

(declare-fun m!588583 () Bool)

(assert (=> b!612215 m!588583))

(declare-fun m!588585 () Bool)

(assert (=> b!612206 m!588585))

(assert (=> b!612202 m!588565))

(assert (=> b!612202 m!588559))

(declare-fun m!588587 () Bool)

(assert (=> b!612202 m!588587))

(declare-fun m!588589 () Bool)

(assert (=> b!612193 m!588589))

(assert (=> b!612205 m!588565))

(assert (=> b!612205 m!588565))

(declare-fun m!588591 () Bool)

(assert (=> b!612205 m!588591))

(assert (=> b!612199 m!588565))

(assert (=> b!612199 m!588565))

(assert (=> b!612199 m!588591))

(declare-fun m!588593 () Bool)

(assert (=> b!612199 m!588593))

(assert (=> b!612199 m!588565))

(declare-fun m!588595 () Bool)

(assert (=> b!612199 m!588595))

(assert (=> b!612199 m!588565))

(declare-fun m!588597 () Bool)

(assert (=> b!612199 m!588597))

(declare-fun m!588599 () Bool)

(assert (=> b!612199 m!588599))

(declare-fun m!588601 () Bool)

(assert (=> start!55916 m!588601))

(declare-fun m!588603 () Bool)

(assert (=> start!55916 m!588603))

(assert (=> b!612213 m!588565))

(declare-fun m!588605 () Bool)

(assert (=> b!612213 m!588605))

(assert (=> b!612213 m!588565))

(declare-fun m!588607 () Bool)

(assert (=> b!612213 m!588607))

(assert (=> b!612213 m!588565))

(declare-fun m!588609 () Bool)

(assert (=> b!612213 m!588609))

(assert (=> b!612213 m!588565))

(declare-fun m!588611 () Bool)

(assert (=> b!612213 m!588611))

(assert (=> b!612213 m!588593))

(declare-fun m!588613 () Bool)

(assert (=> b!612213 m!588613))

(assert (=> b!612213 m!588599))

(assert (=> b!612203 m!588565))

(declare-fun m!588615 () Bool)

(assert (=> b!612204 m!588615))

(assert (=> b!612201 m!588565))

(assert (=> b!612201 m!588565))

(declare-fun m!588617 () Bool)

(assert (=> b!612201 m!588617))

(assert (=> b!612210 m!588565))

(assert (=> b!612210 m!588565))

(declare-fun m!588619 () Bool)

(assert (=> b!612210 m!588619))

(assert (=> b!612194 m!588565))

(assert (=> b!612194 m!588565))

(assert (=> b!612194 m!588617))

(declare-fun m!588621 () Bool)

(assert (=> b!612197 m!588621))

(push 1)

(assert (not b!612201))

(assert (not b!612209))

(assert (not b!612199))

(assert (not b!612215))

(assert (not b!612206))

(assert (not b!612213))

(assert (not start!55916))

(assert (not b!612194))

(assert (not b!612195))

(assert (not b!612205))

(assert (not b!612204))

(assert (not b!612200))

(assert (not b!612197))

(assert (not b!612210))

(check-sat)

(pop 1)

