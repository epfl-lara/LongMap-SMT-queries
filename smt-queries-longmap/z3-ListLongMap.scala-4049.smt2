; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55236 () Bool)

(assert start!55236)

(declare-fun b!605058 () Bool)

(declare-fun e!346274 () Bool)

(declare-fun e!346271 () Bool)

(assert (=> b!605058 (= e!346274 e!346271)))

(declare-fun res!388821 () Bool)

(assert (=> b!605058 (=> (not res!388821) (not e!346271))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6313 0))(
  ( (MissingZero!6313 (index!27518 (_ BitVec 32))) (Found!6313 (index!27519 (_ BitVec 32))) (Intermediate!6313 (undefined!7125 Bool) (index!27520 (_ BitVec 32)) (x!56326 (_ BitVec 32))) (Undefined!6313) (MissingVacant!6313 (index!27521 (_ BitVec 32))) )
))
(declare-fun lt!275973 () SeekEntryResult!6313)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37242 0))(
  ( (array!37243 (arr!17876 (Array (_ BitVec 32) (_ BitVec 64))) (size!18241 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37242)

(assert (=> b!605058 (= res!388821 (and (= lt!275973 (Found!6313 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17876 a!2986) index!984) (select (arr!17876 a!2986) j!136))) (not (= (select (arr!17876 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37242 (_ BitVec 32)) SeekEntryResult!6313)

(assert (=> b!605058 (= lt!275973 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17876 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605059 () Bool)

(declare-fun res!388832 () Bool)

(declare-fun e!346272 () Bool)

(assert (=> b!605059 (=> (not res!388832) (not e!346272))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!605059 (= res!388832 (validKeyInArray!0 k0!1786))))

(declare-fun b!605060 () Bool)

(declare-fun e!346280 () Bool)

(declare-fun lt!275972 () SeekEntryResult!6313)

(assert (=> b!605060 (= e!346280 (= lt!275973 lt!275972))))

(declare-fun b!605061 () Bool)

(declare-fun res!388819 () Bool)

(assert (=> b!605061 (=> (not res!388819) (not e!346272))))

(declare-fun arrayContainsKey!0 (array!37242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!605061 (= res!388819 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun lt!275959 () array!37242)

(declare-fun e!346276 () Bool)

(declare-fun b!605062 () Bool)

(assert (=> b!605062 (= e!346276 (arrayContainsKey!0 lt!275959 (select (arr!17876 a!2986) j!136) index!984))))

(declare-fun b!605063 () Bool)

(declare-datatypes ((Unit!19260 0))(
  ( (Unit!19261) )
))
(declare-fun e!346270 () Unit!19260)

(declare-fun Unit!19262 () Unit!19260)

(assert (=> b!605063 (= e!346270 Unit!19262)))

(declare-fun b!605064 () Bool)

(declare-fun e!346273 () Bool)

(declare-fun e!346275 () Bool)

(assert (=> b!605064 (= e!346273 e!346275)))

(declare-fun res!388816 () Bool)

(assert (=> b!605064 (=> res!388816 e!346275)))

(assert (=> b!605064 (= res!388816 (bvsge index!984 j!136))))

(declare-fun lt!275967 () Unit!19260)

(declare-fun e!346279 () Unit!19260)

(assert (=> b!605064 (= lt!275967 e!346279)))

(declare-fun c!68489 () Bool)

(assert (=> b!605064 (= c!68489 (bvslt j!136 index!984))))

(declare-fun b!605065 () Bool)

(declare-fun Unit!19263 () Unit!19260)

(assert (=> b!605065 (= e!346270 Unit!19263)))

(assert (=> b!605065 false))

(declare-fun res!388815 () Bool)

(assert (=> start!55236 (=> (not res!388815) (not e!346272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55236 (= res!388815 (validMask!0 mask!3053))))

(assert (=> start!55236 e!346272))

(assert (=> start!55236 true))

(declare-fun array_inv!13759 (array!37242) Bool)

(assert (=> start!55236 (array_inv!13759 a!2986)))

(declare-fun b!605066 () Bool)

(declare-fun res!388827 () Bool)

(declare-fun e!346284 () Bool)

(assert (=> b!605066 (=> (not res!388827) (not e!346284))))

(assert (=> b!605066 (= res!388827 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17876 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!605067 () Bool)

(declare-fun res!388823 () Bool)

(assert (=> b!605067 (=> (not res!388823) (not e!346284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37242 (_ BitVec 32)) Bool)

(assert (=> b!605067 (= res!388823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!605068 () Bool)

(declare-fun e!346281 () Bool)

(assert (=> b!605068 (= e!346281 e!346273)))

(declare-fun res!388830 () Bool)

(assert (=> b!605068 (=> res!388830 e!346273)))

(declare-fun lt!275970 () (_ BitVec 64))

(declare-fun lt!275966 () (_ BitVec 64))

(assert (=> b!605068 (= res!388830 (or (not (= (select (arr!17876 a!2986) j!136) lt!275966)) (not (= (select (arr!17876 a!2986) j!136) lt!275970))))))

(declare-fun e!346278 () Bool)

(assert (=> b!605068 e!346278))

(declare-fun res!388817 () Bool)

(assert (=> b!605068 (=> (not res!388817) (not e!346278))))

(assert (=> b!605068 (= res!388817 (= lt!275970 (select (arr!17876 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!605068 (= lt!275970 (select (store (arr!17876 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!605069 () Bool)

(declare-fun res!388828 () Bool)

(assert (=> b!605069 (=> (not res!388828) (not e!346272))))

(assert (=> b!605069 (= res!388828 (validKeyInArray!0 (select (arr!17876 a!2986) j!136)))))

(declare-fun b!605070 () Bool)

(declare-fun e!346282 () Bool)

(declare-fun e!346283 () Bool)

(assert (=> b!605070 (= e!346282 e!346283)))

(declare-fun res!388820 () Bool)

(assert (=> b!605070 (=> (not res!388820) (not e!346283))))

(assert (=> b!605070 (= res!388820 (arrayContainsKey!0 lt!275959 (select (arr!17876 a!2986) j!136) j!136))))

(declare-fun b!605071 () Bool)

(assert (=> b!605071 (= e!346272 e!346284)))

(declare-fun res!388824 () Bool)

(assert (=> b!605071 (=> (not res!388824) (not e!346284))))

(declare-fun lt!275963 () SeekEntryResult!6313)

(assert (=> b!605071 (= res!388824 (or (= lt!275963 (MissingZero!6313 i!1108)) (= lt!275963 (MissingVacant!6313 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37242 (_ BitVec 32)) SeekEntryResult!6313)

(assert (=> b!605071 (= lt!275963 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!605072 () Bool)

(assert (=> b!605072 (= e!346283 (arrayContainsKey!0 lt!275959 (select (arr!17876 a!2986) j!136) index!984))))

(declare-fun b!605073 () Bool)

(declare-fun Unit!19264 () Unit!19260)

(assert (=> b!605073 (= e!346279 Unit!19264)))

(declare-fun b!605074 () Bool)

(assert (=> b!605074 (= e!346275 (or (bvsgt #b00000000000000000000000000000000 (size!18241 a!2986)) (bvslt (size!18241 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!605074 (arrayContainsKey!0 lt!275959 (select (arr!17876 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275968 () Unit!19260)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37242 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19260)

(assert (=> b!605074 (= lt!275968 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275959 (select (arr!17876 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!605074 e!346276))

(declare-fun res!388814 () Bool)

(assert (=> b!605074 (=> (not res!388814) (not e!346276))))

(assert (=> b!605074 (= res!388814 (arrayContainsKey!0 lt!275959 (select (arr!17876 a!2986) j!136) j!136))))

(declare-fun b!605075 () Bool)

(declare-fun res!388831 () Bool)

(assert (=> b!605075 (=> (not res!388831) (not e!346284))))

(declare-datatypes ((List!11956 0))(
  ( (Nil!11953) (Cons!11952 (h!12997 (_ BitVec 64)) (t!18175 List!11956)) )
))
(declare-fun arrayNoDuplicates!0 (array!37242 (_ BitVec 32) List!11956) Bool)

(assert (=> b!605075 (= res!388831 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11953))))

(declare-fun b!605076 () Bool)

(assert (=> b!605076 (= e!346284 e!346274)))

(declare-fun res!388829 () Bool)

(assert (=> b!605076 (=> (not res!388829) (not e!346274))))

(assert (=> b!605076 (= res!388829 (= (select (store (arr!17876 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605076 (= lt!275959 (array!37243 (store (arr!17876 a!2986) i!1108 k0!1786) (size!18241 a!2986)))))

(declare-fun b!605077 () Bool)

(assert (=> b!605077 (= e!346278 e!346282)))

(declare-fun res!388818 () Bool)

(assert (=> b!605077 (=> res!388818 e!346282)))

(assert (=> b!605077 (= res!388818 (or (not (= (select (arr!17876 a!2986) j!136) lt!275966)) (not (= (select (arr!17876 a!2986) j!136) lt!275970)) (bvsge j!136 index!984)))))

(declare-fun b!605078 () Bool)

(declare-fun Unit!19265 () Unit!19260)

(assert (=> b!605078 (= e!346279 Unit!19265)))

(declare-fun lt!275974 () Unit!19260)

(assert (=> b!605078 (= lt!275974 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275959 (select (arr!17876 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!605078 (arrayContainsKey!0 lt!275959 (select (arr!17876 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275960 () Unit!19260)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37242 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11956) Unit!19260)

(assert (=> b!605078 (= lt!275960 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11953))))

(assert (=> b!605078 (arrayNoDuplicates!0 lt!275959 #b00000000000000000000000000000000 Nil!11953)))

(declare-fun lt!275962 () Unit!19260)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37242 (_ BitVec 32) (_ BitVec 32)) Unit!19260)

(assert (=> b!605078 (= lt!275962 (lemmaNoDuplicateFromThenFromBigger!0 lt!275959 #b00000000000000000000000000000000 j!136))))

(assert (=> b!605078 (arrayNoDuplicates!0 lt!275959 j!136 Nil!11953)))

(declare-fun lt!275965 () Unit!19260)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37242 (_ BitVec 64) (_ BitVec 32) List!11956) Unit!19260)

(assert (=> b!605078 (= lt!275965 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275959 (select (arr!17876 a!2986) j!136) j!136 Nil!11953))))

(assert (=> b!605078 false))

(declare-fun b!605079 () Bool)

(declare-fun res!388826 () Bool)

(assert (=> b!605079 (=> (not res!388826) (not e!346272))))

(assert (=> b!605079 (= res!388826 (and (= (size!18241 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18241 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18241 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!605080 () Bool)

(assert (=> b!605080 (= e!346271 (not e!346281))))

(declare-fun res!388822 () Bool)

(assert (=> b!605080 (=> res!388822 e!346281)))

(declare-fun lt!275969 () SeekEntryResult!6313)

(assert (=> b!605080 (= res!388822 (not (= lt!275969 (Found!6313 index!984))))))

(declare-fun lt!275964 () Unit!19260)

(assert (=> b!605080 (= lt!275964 e!346270)))

(declare-fun c!68490 () Bool)

(assert (=> b!605080 (= c!68490 (= lt!275969 Undefined!6313))))

(assert (=> b!605080 (= lt!275969 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275966 lt!275959 mask!3053))))

(assert (=> b!605080 e!346280))

(declare-fun res!388825 () Bool)

(assert (=> b!605080 (=> (not res!388825) (not e!346280))))

(declare-fun lt!275961 () (_ BitVec 32))

(assert (=> b!605080 (= res!388825 (= lt!275972 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275961 vacantSpotIndex!68 lt!275966 lt!275959 mask!3053)))))

(assert (=> b!605080 (= lt!275972 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275961 vacantSpotIndex!68 (select (arr!17876 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!605080 (= lt!275966 (select (store (arr!17876 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275971 () Unit!19260)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37242 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19260)

(assert (=> b!605080 (= lt!275971 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275961 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!605080 (= lt!275961 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!55236 res!388815) b!605079))

(assert (= (and b!605079 res!388826) b!605069))

(assert (= (and b!605069 res!388828) b!605059))

(assert (= (and b!605059 res!388832) b!605061))

(assert (= (and b!605061 res!388819) b!605071))

(assert (= (and b!605071 res!388824) b!605067))

(assert (= (and b!605067 res!388823) b!605075))

(assert (= (and b!605075 res!388831) b!605066))

(assert (= (and b!605066 res!388827) b!605076))

(assert (= (and b!605076 res!388829) b!605058))

(assert (= (and b!605058 res!388821) b!605080))

(assert (= (and b!605080 res!388825) b!605060))

(assert (= (and b!605080 c!68490) b!605065))

(assert (= (and b!605080 (not c!68490)) b!605063))

(assert (= (and b!605080 (not res!388822)) b!605068))

(assert (= (and b!605068 res!388817) b!605077))

(assert (= (and b!605077 (not res!388818)) b!605070))

(assert (= (and b!605070 res!388820) b!605072))

(assert (= (and b!605068 (not res!388830)) b!605064))

(assert (= (and b!605064 c!68489) b!605078))

(assert (= (and b!605064 (not c!68489)) b!605073))

(assert (= (and b!605064 (not res!388816)) b!605074))

(assert (= (and b!605074 res!388814) b!605062))

(declare-fun m!581419 () Bool)

(assert (=> b!605071 m!581419))

(declare-fun m!581421 () Bool)

(assert (=> b!605075 m!581421))

(declare-fun m!581423 () Bool)

(assert (=> b!605074 m!581423))

(assert (=> b!605074 m!581423))

(declare-fun m!581425 () Bool)

(assert (=> b!605074 m!581425))

(assert (=> b!605074 m!581423))

(declare-fun m!581427 () Bool)

(assert (=> b!605074 m!581427))

(assert (=> b!605074 m!581423))

(declare-fun m!581429 () Bool)

(assert (=> b!605074 m!581429))

(declare-fun m!581431 () Bool)

(assert (=> b!605059 m!581431))

(declare-fun m!581433 () Bool)

(assert (=> b!605058 m!581433))

(assert (=> b!605058 m!581423))

(assert (=> b!605058 m!581423))

(declare-fun m!581435 () Bool)

(assert (=> b!605058 m!581435))

(declare-fun m!581437 () Bool)

(assert (=> b!605080 m!581437))

(declare-fun m!581439 () Bool)

(assert (=> b!605080 m!581439))

(assert (=> b!605080 m!581423))

(declare-fun m!581441 () Bool)

(assert (=> b!605080 m!581441))

(declare-fun m!581443 () Bool)

(assert (=> b!605080 m!581443))

(declare-fun m!581445 () Bool)

(assert (=> b!605080 m!581445))

(assert (=> b!605080 m!581423))

(declare-fun m!581447 () Bool)

(assert (=> b!605080 m!581447))

(declare-fun m!581449 () Bool)

(assert (=> b!605080 m!581449))

(assert (=> b!605068 m!581423))

(assert (=> b!605068 m!581449))

(declare-fun m!581451 () Bool)

(assert (=> b!605068 m!581451))

(declare-fun m!581453 () Bool)

(assert (=> b!605066 m!581453))

(assert (=> b!605070 m!581423))

(assert (=> b!605070 m!581423))

(assert (=> b!605070 m!581429))

(declare-fun m!581455 () Bool)

(assert (=> b!605067 m!581455))

(assert (=> b!605076 m!581449))

(declare-fun m!581457 () Bool)

(assert (=> b!605076 m!581457))

(assert (=> b!605062 m!581423))

(assert (=> b!605062 m!581423))

(declare-fun m!581459 () Bool)

(assert (=> b!605062 m!581459))

(assert (=> b!605069 m!581423))

(assert (=> b!605069 m!581423))

(declare-fun m!581461 () Bool)

(assert (=> b!605069 m!581461))

(declare-fun m!581463 () Bool)

(assert (=> start!55236 m!581463))

(declare-fun m!581465 () Bool)

(assert (=> start!55236 m!581465))

(assert (=> b!605078 m!581423))

(assert (=> b!605078 m!581423))

(declare-fun m!581467 () Bool)

(assert (=> b!605078 m!581467))

(assert (=> b!605078 m!581423))

(declare-fun m!581469 () Bool)

(assert (=> b!605078 m!581469))

(assert (=> b!605078 m!581423))

(declare-fun m!581471 () Bool)

(assert (=> b!605078 m!581471))

(declare-fun m!581473 () Bool)

(assert (=> b!605078 m!581473))

(declare-fun m!581475 () Bool)

(assert (=> b!605078 m!581475))

(declare-fun m!581477 () Bool)

(assert (=> b!605078 m!581477))

(declare-fun m!581479 () Bool)

(assert (=> b!605078 m!581479))

(assert (=> b!605077 m!581423))

(assert (=> b!605072 m!581423))

(assert (=> b!605072 m!581423))

(assert (=> b!605072 m!581459))

(declare-fun m!581481 () Bool)

(assert (=> b!605061 m!581481))

(check-sat (not b!605070) (not b!605072) (not b!605074) (not b!605062) (not b!605058) (not start!55236) (not b!605080) (not b!605067) (not b!605071) (not b!605075) (not b!605061) (not b!605069) (not b!605078) (not b!605059))
(check-sat)
(get-model)

(declare-fun d!87377 () Bool)

(assert (=> d!87377 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18241 lt!275959)) (not (= (select (arr!17876 lt!275959) j!136) (select (arr!17876 a!2986) j!136))))))

(declare-fun lt!276073 () Unit!19260)

(declare-fun choose!21 (array!37242 (_ BitVec 64) (_ BitVec 32) List!11956) Unit!19260)

(assert (=> d!87377 (= lt!276073 (choose!21 lt!275959 (select (arr!17876 a!2986) j!136) j!136 Nil!11953))))

(assert (=> d!87377 (bvslt (size!18241 lt!275959) #b01111111111111111111111111111111)))

(assert (=> d!87377 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275959 (select (arr!17876 a!2986) j!136) j!136 Nil!11953) lt!276073)))

(declare-fun bs!18490 () Bool)

(assert (= bs!18490 d!87377))

(declare-fun m!581611 () Bool)

(assert (=> bs!18490 m!581611))

(assert (=> bs!18490 m!581423))

(declare-fun m!581613 () Bool)

(assert (=> bs!18490 m!581613))

(assert (=> b!605078 d!87377))

(declare-fun d!87379 () Bool)

(assert (=> d!87379 (arrayNoDuplicates!0 lt!275959 j!136 Nil!11953)))

(declare-fun lt!276076 () Unit!19260)

(declare-fun choose!39 (array!37242 (_ BitVec 32) (_ BitVec 32)) Unit!19260)

(assert (=> d!87379 (= lt!276076 (choose!39 lt!275959 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87379 (bvslt (size!18241 lt!275959) #b01111111111111111111111111111111)))

(assert (=> d!87379 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!275959 #b00000000000000000000000000000000 j!136) lt!276076)))

(declare-fun bs!18491 () Bool)

(assert (= bs!18491 d!87379))

(assert (=> bs!18491 m!581473))

(declare-fun m!581615 () Bool)

(assert (=> bs!18491 m!581615))

(assert (=> b!605078 d!87379))

(declare-fun b!605229 () Bool)

(declare-fun e!346384 () Bool)

(declare-fun e!346383 () Bool)

(assert (=> b!605229 (= e!346384 e!346383)))

(declare-fun c!68505 () Bool)

(assert (=> b!605229 (= c!68505 (validKeyInArray!0 (select (arr!17876 lt!275959) #b00000000000000000000000000000000)))))

(declare-fun b!605230 () Bool)

(declare-fun e!346386 () Bool)

(assert (=> b!605230 (= e!346386 e!346384)))

(declare-fun res!388953 () Bool)

(assert (=> b!605230 (=> (not res!388953) (not e!346384))))

(declare-fun e!346385 () Bool)

(assert (=> b!605230 (= res!388953 (not e!346385))))

(declare-fun res!388954 () Bool)

(assert (=> b!605230 (=> (not res!388954) (not e!346385))))

(assert (=> b!605230 (= res!388954 (validKeyInArray!0 (select (arr!17876 lt!275959) #b00000000000000000000000000000000)))))

(declare-fun b!605231 () Bool)

(declare-fun contains!2979 (List!11956 (_ BitVec 64)) Bool)

(assert (=> b!605231 (= e!346385 (contains!2979 Nil!11953 (select (arr!17876 lt!275959) #b00000000000000000000000000000000)))))

(declare-fun b!605232 () Bool)

(declare-fun call!33016 () Bool)

(assert (=> b!605232 (= e!346383 call!33016)))

(declare-fun d!87381 () Bool)

(declare-fun res!388955 () Bool)

(assert (=> d!87381 (=> res!388955 e!346386)))

(assert (=> d!87381 (= res!388955 (bvsge #b00000000000000000000000000000000 (size!18241 lt!275959)))))

(assert (=> d!87381 (= (arrayNoDuplicates!0 lt!275959 #b00000000000000000000000000000000 Nil!11953) e!346386)))

(declare-fun b!605233 () Bool)

(assert (=> b!605233 (= e!346383 call!33016)))

(declare-fun bm!33013 () Bool)

(assert (=> bm!33013 (= call!33016 (arrayNoDuplicates!0 lt!275959 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68505 (Cons!11952 (select (arr!17876 lt!275959) #b00000000000000000000000000000000) Nil!11953) Nil!11953)))))

(assert (= (and d!87381 (not res!388955)) b!605230))

(assert (= (and b!605230 res!388954) b!605231))

(assert (= (and b!605230 res!388953) b!605229))

(assert (= (and b!605229 c!68505) b!605232))

(assert (= (and b!605229 (not c!68505)) b!605233))

(assert (= (or b!605232 b!605233) bm!33013))

(declare-fun m!581617 () Bool)

(assert (=> b!605229 m!581617))

(assert (=> b!605229 m!581617))

(declare-fun m!581619 () Bool)

(assert (=> b!605229 m!581619))

(assert (=> b!605230 m!581617))

(assert (=> b!605230 m!581617))

(assert (=> b!605230 m!581619))

(assert (=> b!605231 m!581617))

(assert (=> b!605231 m!581617))

(declare-fun m!581621 () Bool)

(assert (=> b!605231 m!581621))

(assert (=> bm!33013 m!581617))

(declare-fun m!581623 () Bool)

(assert (=> bm!33013 m!581623))

(assert (=> b!605078 d!87381))

(declare-fun d!87383 () Bool)

(declare-fun res!388960 () Bool)

(declare-fun e!346391 () Bool)

(assert (=> d!87383 (=> res!388960 e!346391)))

(assert (=> d!87383 (= res!388960 (= (select (arr!17876 lt!275959) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17876 a!2986) j!136)))))

(assert (=> d!87383 (= (arrayContainsKey!0 lt!275959 (select (arr!17876 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!346391)))

(declare-fun b!605238 () Bool)

(declare-fun e!346392 () Bool)

(assert (=> b!605238 (= e!346391 e!346392)))

(declare-fun res!388961 () Bool)

(assert (=> b!605238 (=> (not res!388961) (not e!346392))))

(assert (=> b!605238 (= res!388961 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18241 lt!275959)))))

(declare-fun b!605239 () Bool)

(assert (=> b!605239 (= e!346392 (arrayContainsKey!0 lt!275959 (select (arr!17876 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87383 (not res!388960)) b!605238))

(assert (= (and b!605238 res!388961) b!605239))

(declare-fun m!581625 () Bool)

(assert (=> d!87383 m!581625))

(assert (=> b!605239 m!581423))

(declare-fun m!581627 () Bool)

(assert (=> b!605239 m!581627))

(assert (=> b!605078 d!87383))

(declare-fun d!87385 () Bool)

(assert (=> d!87385 (arrayContainsKey!0 lt!275959 (select (arr!17876 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276079 () Unit!19260)

(declare-fun choose!114 (array!37242 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19260)

(assert (=> d!87385 (= lt!276079 (choose!114 lt!275959 (select (arr!17876 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87385 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87385 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275959 (select (arr!17876 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!276079)))

(declare-fun bs!18492 () Bool)

(assert (= bs!18492 d!87385))

(assert (=> bs!18492 m!581423))

(assert (=> bs!18492 m!581467))

(assert (=> bs!18492 m!581423))

(declare-fun m!581629 () Bool)

(assert (=> bs!18492 m!581629))

(assert (=> b!605078 d!87385))

(declare-fun d!87387 () Bool)

(declare-fun e!346395 () Bool)

(assert (=> d!87387 e!346395))

(declare-fun res!388964 () Bool)

(assert (=> d!87387 (=> (not res!388964) (not e!346395))))

(assert (=> d!87387 (= res!388964 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18241 a!2986))))))

(declare-fun lt!276082 () Unit!19260)

(declare-fun choose!41 (array!37242 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11956) Unit!19260)

(assert (=> d!87387 (= lt!276082 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11953))))

(assert (=> d!87387 (bvslt (size!18241 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87387 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11953) lt!276082)))

(declare-fun b!605242 () Bool)

(assert (=> b!605242 (= e!346395 (arrayNoDuplicates!0 (array!37243 (store (arr!17876 a!2986) i!1108 k0!1786) (size!18241 a!2986)) #b00000000000000000000000000000000 Nil!11953))))

(assert (= (and d!87387 res!388964) b!605242))

(declare-fun m!581631 () Bool)

(assert (=> d!87387 m!581631))

(assert (=> b!605242 m!581449))

(declare-fun m!581633 () Bool)

(assert (=> b!605242 m!581633))

(assert (=> b!605078 d!87387))

(declare-fun b!605243 () Bool)

(declare-fun e!346397 () Bool)

(declare-fun e!346396 () Bool)

(assert (=> b!605243 (= e!346397 e!346396)))

(declare-fun c!68506 () Bool)

(assert (=> b!605243 (= c!68506 (validKeyInArray!0 (select (arr!17876 lt!275959) j!136)))))

(declare-fun b!605244 () Bool)

(declare-fun e!346399 () Bool)

(assert (=> b!605244 (= e!346399 e!346397)))

(declare-fun res!388965 () Bool)

(assert (=> b!605244 (=> (not res!388965) (not e!346397))))

(declare-fun e!346398 () Bool)

(assert (=> b!605244 (= res!388965 (not e!346398))))

(declare-fun res!388966 () Bool)

(assert (=> b!605244 (=> (not res!388966) (not e!346398))))

(assert (=> b!605244 (= res!388966 (validKeyInArray!0 (select (arr!17876 lt!275959) j!136)))))

(declare-fun b!605245 () Bool)

(assert (=> b!605245 (= e!346398 (contains!2979 Nil!11953 (select (arr!17876 lt!275959) j!136)))))

(declare-fun b!605246 () Bool)

(declare-fun call!33017 () Bool)

(assert (=> b!605246 (= e!346396 call!33017)))

(declare-fun d!87389 () Bool)

(declare-fun res!388967 () Bool)

(assert (=> d!87389 (=> res!388967 e!346399)))

(assert (=> d!87389 (= res!388967 (bvsge j!136 (size!18241 lt!275959)))))

(assert (=> d!87389 (= (arrayNoDuplicates!0 lt!275959 j!136 Nil!11953) e!346399)))

(declare-fun b!605247 () Bool)

(assert (=> b!605247 (= e!346396 call!33017)))

(declare-fun bm!33014 () Bool)

(assert (=> bm!33014 (= call!33017 (arrayNoDuplicates!0 lt!275959 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68506 (Cons!11952 (select (arr!17876 lt!275959) j!136) Nil!11953) Nil!11953)))))

(assert (= (and d!87389 (not res!388967)) b!605244))

(assert (= (and b!605244 res!388966) b!605245))

(assert (= (and b!605244 res!388965) b!605243))

(assert (= (and b!605243 c!68506) b!605246))

(assert (= (and b!605243 (not c!68506)) b!605247))

(assert (= (or b!605246 b!605247) bm!33014))

(assert (=> b!605243 m!581611))

(assert (=> b!605243 m!581611))

(declare-fun m!581635 () Bool)

(assert (=> b!605243 m!581635))

(assert (=> b!605244 m!581611))

(assert (=> b!605244 m!581611))

(assert (=> b!605244 m!581635))

(assert (=> b!605245 m!581611))

(assert (=> b!605245 m!581611))

(declare-fun m!581637 () Bool)

(assert (=> b!605245 m!581637))

(assert (=> bm!33014 m!581611))

(declare-fun m!581639 () Bool)

(assert (=> bm!33014 m!581639))

(assert (=> b!605078 d!87389))

(declare-fun d!87391 () Bool)

(assert (=> d!87391 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55236 d!87391))

(declare-fun d!87393 () Bool)

(assert (=> d!87393 (= (array_inv!13759 a!2986) (bvsge (size!18241 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55236 d!87393))

(declare-fun b!605260 () Bool)

(declare-fun e!346406 () SeekEntryResult!6313)

(assert (=> b!605260 (= e!346406 (Found!6313 index!984))))

(declare-fun e!346407 () SeekEntryResult!6313)

(declare-fun b!605261 () Bool)

(assert (=> b!605261 (= e!346407 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17876 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605262 () Bool)

(assert (=> b!605262 (= e!346407 (MissingVacant!6313 vacantSpotIndex!68))))

(declare-fun b!605263 () Bool)

(declare-fun e!346408 () SeekEntryResult!6313)

(assert (=> b!605263 (= e!346408 e!346406)))

(declare-fun lt!276087 () (_ BitVec 64))

(declare-fun c!68513 () Bool)

(assert (=> b!605263 (= c!68513 (= lt!276087 (select (arr!17876 a!2986) j!136)))))

(declare-fun b!605264 () Bool)

(declare-fun c!68515 () Bool)

(assert (=> b!605264 (= c!68515 (= lt!276087 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605264 (= e!346406 e!346407)))

(declare-fun lt!276088 () SeekEntryResult!6313)

(declare-fun d!87395 () Bool)

(get-info :version)

(assert (=> d!87395 (and (or ((_ is Undefined!6313) lt!276088) (not ((_ is Found!6313) lt!276088)) (and (bvsge (index!27519 lt!276088) #b00000000000000000000000000000000) (bvslt (index!27519 lt!276088) (size!18241 a!2986)))) (or ((_ is Undefined!6313) lt!276088) ((_ is Found!6313) lt!276088) (not ((_ is MissingVacant!6313) lt!276088)) (not (= (index!27521 lt!276088) vacantSpotIndex!68)) (and (bvsge (index!27521 lt!276088) #b00000000000000000000000000000000) (bvslt (index!27521 lt!276088) (size!18241 a!2986)))) (or ((_ is Undefined!6313) lt!276088) (ite ((_ is Found!6313) lt!276088) (= (select (arr!17876 a!2986) (index!27519 lt!276088)) (select (arr!17876 a!2986) j!136)) (and ((_ is MissingVacant!6313) lt!276088) (= (index!27521 lt!276088) vacantSpotIndex!68) (= (select (arr!17876 a!2986) (index!27521 lt!276088)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87395 (= lt!276088 e!346408)))

(declare-fun c!68514 () Bool)

(assert (=> d!87395 (= c!68514 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87395 (= lt!276087 (select (arr!17876 a!2986) index!984))))

(assert (=> d!87395 (validMask!0 mask!3053)))

(assert (=> d!87395 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17876 a!2986) j!136) a!2986 mask!3053) lt!276088)))

(declare-fun b!605265 () Bool)

(assert (=> b!605265 (= e!346408 Undefined!6313)))

(assert (= (and d!87395 c!68514) b!605265))

(assert (= (and d!87395 (not c!68514)) b!605263))

(assert (= (and b!605263 c!68513) b!605260))

(assert (= (and b!605263 (not c!68513)) b!605264))

(assert (= (and b!605264 c!68515) b!605262))

(assert (= (and b!605264 (not c!68515)) b!605261))

(assert (=> b!605261 m!581437))

(assert (=> b!605261 m!581437))

(assert (=> b!605261 m!581423))

(declare-fun m!581641 () Bool)

(assert (=> b!605261 m!581641))

(declare-fun m!581643 () Bool)

(assert (=> d!87395 m!581643))

(declare-fun m!581645 () Bool)

(assert (=> d!87395 m!581645))

(assert (=> d!87395 m!581433))

(assert (=> d!87395 m!581463))

(assert (=> b!605058 d!87395))

(declare-fun d!87397 () Bool)

(assert (=> d!87397 (= (validKeyInArray!0 (select (arr!17876 a!2986) j!136)) (and (not (= (select (arr!17876 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17876 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!605069 d!87397))

(declare-fun b!605266 () Bool)

(declare-fun e!346409 () SeekEntryResult!6313)

(assert (=> b!605266 (= e!346409 (Found!6313 lt!275961))))

(declare-fun e!346410 () SeekEntryResult!6313)

(declare-fun b!605267 () Bool)

(assert (=> b!605267 (= e!346410 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!275961 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!275966 lt!275959 mask!3053))))

(declare-fun b!605268 () Bool)

(assert (=> b!605268 (= e!346410 (MissingVacant!6313 vacantSpotIndex!68))))

(declare-fun b!605269 () Bool)

(declare-fun e!346411 () SeekEntryResult!6313)

(assert (=> b!605269 (= e!346411 e!346409)))

(declare-fun c!68516 () Bool)

(declare-fun lt!276089 () (_ BitVec 64))

(assert (=> b!605269 (= c!68516 (= lt!276089 lt!275966))))

(declare-fun b!605270 () Bool)

(declare-fun c!68518 () Bool)

(assert (=> b!605270 (= c!68518 (= lt!276089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605270 (= e!346409 e!346410)))

(declare-fun d!87401 () Bool)

(declare-fun lt!276090 () SeekEntryResult!6313)

(assert (=> d!87401 (and (or ((_ is Undefined!6313) lt!276090) (not ((_ is Found!6313) lt!276090)) (and (bvsge (index!27519 lt!276090) #b00000000000000000000000000000000) (bvslt (index!27519 lt!276090) (size!18241 lt!275959)))) (or ((_ is Undefined!6313) lt!276090) ((_ is Found!6313) lt!276090) (not ((_ is MissingVacant!6313) lt!276090)) (not (= (index!27521 lt!276090) vacantSpotIndex!68)) (and (bvsge (index!27521 lt!276090) #b00000000000000000000000000000000) (bvslt (index!27521 lt!276090) (size!18241 lt!275959)))) (or ((_ is Undefined!6313) lt!276090) (ite ((_ is Found!6313) lt!276090) (= (select (arr!17876 lt!275959) (index!27519 lt!276090)) lt!275966) (and ((_ is MissingVacant!6313) lt!276090) (= (index!27521 lt!276090) vacantSpotIndex!68) (= (select (arr!17876 lt!275959) (index!27521 lt!276090)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87401 (= lt!276090 e!346411)))

(declare-fun c!68517 () Bool)

(assert (=> d!87401 (= c!68517 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87401 (= lt!276089 (select (arr!17876 lt!275959) lt!275961))))

(assert (=> d!87401 (validMask!0 mask!3053)))

(assert (=> d!87401 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275961 vacantSpotIndex!68 lt!275966 lt!275959 mask!3053) lt!276090)))

(declare-fun b!605271 () Bool)

(assert (=> b!605271 (= e!346411 Undefined!6313)))

(assert (= (and d!87401 c!68517) b!605271))

(assert (= (and d!87401 (not c!68517)) b!605269))

(assert (= (and b!605269 c!68516) b!605266))

(assert (= (and b!605269 (not c!68516)) b!605270))

(assert (= (and b!605270 c!68518) b!605268))

(assert (= (and b!605270 (not c!68518)) b!605267))

(declare-fun m!581647 () Bool)

(assert (=> b!605267 m!581647))

(assert (=> b!605267 m!581647))

(declare-fun m!581649 () Bool)

(assert (=> b!605267 m!581649))

(declare-fun m!581651 () Bool)

(assert (=> d!87401 m!581651))

(declare-fun m!581653 () Bool)

(assert (=> d!87401 m!581653))

(declare-fun m!581655 () Bool)

(assert (=> d!87401 m!581655))

(assert (=> d!87401 m!581463))

(assert (=> b!605080 d!87401))

(declare-fun d!87403 () Bool)

(declare-fun lt!276096 () (_ BitVec 32))

(assert (=> d!87403 (and (bvsge lt!276096 #b00000000000000000000000000000000) (bvslt lt!276096 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87403 (= lt!276096 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87403 (validMask!0 mask!3053)))

(assert (=> d!87403 (= (nextIndex!0 index!984 x!910 mask!3053) lt!276096)))

(declare-fun bs!18494 () Bool)

(assert (= bs!18494 d!87403))

(declare-fun m!581659 () Bool)

(assert (=> bs!18494 m!581659))

(assert (=> bs!18494 m!581463))

(assert (=> b!605080 d!87403))

(declare-fun d!87407 () Bool)

(declare-fun e!346420 () Bool)

(assert (=> d!87407 e!346420))

(declare-fun res!388970 () Bool)

(assert (=> d!87407 (=> (not res!388970) (not e!346420))))

(assert (=> d!87407 (= res!388970 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18241 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18241 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18241 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18241 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18241 a!2986))))))

(declare-fun lt!276103 () Unit!19260)

(declare-fun choose!9 (array!37242 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19260)

(assert (=> d!87407 (= lt!276103 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275961 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87407 (validMask!0 mask!3053)))

(assert (=> d!87407 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275961 vacantSpotIndex!68 mask!3053) lt!276103)))

(declare-fun b!605286 () Bool)

(assert (=> b!605286 (= e!346420 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275961 vacantSpotIndex!68 (select (arr!17876 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275961 vacantSpotIndex!68 (select (store (arr!17876 a!2986) i!1108 k0!1786) j!136) (array!37243 (store (arr!17876 a!2986) i!1108 k0!1786) (size!18241 a!2986)) mask!3053)))))

(assert (= (and d!87407 res!388970) b!605286))

(declare-fun m!581661 () Bool)

(assert (=> d!87407 m!581661))

(assert (=> d!87407 m!581463))

(assert (=> b!605286 m!581423))

(assert (=> b!605286 m!581439))

(declare-fun m!581663 () Bool)

(assert (=> b!605286 m!581663))

(assert (=> b!605286 m!581439))

(assert (=> b!605286 m!581449))

(assert (=> b!605286 m!581423))

(assert (=> b!605286 m!581447))

(assert (=> b!605080 d!87407))

(declare-fun b!605287 () Bool)

(declare-fun e!346421 () SeekEntryResult!6313)

(assert (=> b!605287 (= e!346421 (Found!6313 lt!275961))))

(declare-fun b!605288 () Bool)

(declare-fun e!346422 () SeekEntryResult!6313)

(assert (=> b!605288 (= e!346422 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!275961 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17876 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605289 () Bool)

(assert (=> b!605289 (= e!346422 (MissingVacant!6313 vacantSpotIndex!68))))

(declare-fun b!605290 () Bool)

(declare-fun e!346423 () SeekEntryResult!6313)

(assert (=> b!605290 (= e!346423 e!346421)))

(declare-fun lt!276104 () (_ BitVec 64))

(declare-fun c!68525 () Bool)

(assert (=> b!605290 (= c!68525 (= lt!276104 (select (arr!17876 a!2986) j!136)))))

(declare-fun b!605291 () Bool)

(declare-fun c!68527 () Bool)

(assert (=> b!605291 (= c!68527 (= lt!276104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605291 (= e!346421 e!346422)))

(declare-fun d!87409 () Bool)

(declare-fun lt!276105 () SeekEntryResult!6313)

(assert (=> d!87409 (and (or ((_ is Undefined!6313) lt!276105) (not ((_ is Found!6313) lt!276105)) (and (bvsge (index!27519 lt!276105) #b00000000000000000000000000000000) (bvslt (index!27519 lt!276105) (size!18241 a!2986)))) (or ((_ is Undefined!6313) lt!276105) ((_ is Found!6313) lt!276105) (not ((_ is MissingVacant!6313) lt!276105)) (not (= (index!27521 lt!276105) vacantSpotIndex!68)) (and (bvsge (index!27521 lt!276105) #b00000000000000000000000000000000) (bvslt (index!27521 lt!276105) (size!18241 a!2986)))) (or ((_ is Undefined!6313) lt!276105) (ite ((_ is Found!6313) lt!276105) (= (select (arr!17876 a!2986) (index!27519 lt!276105)) (select (arr!17876 a!2986) j!136)) (and ((_ is MissingVacant!6313) lt!276105) (= (index!27521 lt!276105) vacantSpotIndex!68) (= (select (arr!17876 a!2986) (index!27521 lt!276105)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87409 (= lt!276105 e!346423)))

(declare-fun c!68526 () Bool)

(assert (=> d!87409 (= c!68526 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87409 (= lt!276104 (select (arr!17876 a!2986) lt!275961))))

(assert (=> d!87409 (validMask!0 mask!3053)))

(assert (=> d!87409 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275961 vacantSpotIndex!68 (select (arr!17876 a!2986) j!136) a!2986 mask!3053) lt!276105)))

(declare-fun b!605292 () Bool)

(assert (=> b!605292 (= e!346423 Undefined!6313)))

(assert (= (and d!87409 c!68526) b!605292))

(assert (= (and d!87409 (not c!68526)) b!605290))

(assert (= (and b!605290 c!68525) b!605287))

(assert (= (and b!605290 (not c!68525)) b!605291))

(assert (= (and b!605291 c!68527) b!605289))

(assert (= (and b!605291 (not c!68527)) b!605288))

(assert (=> b!605288 m!581647))

(assert (=> b!605288 m!581647))

(assert (=> b!605288 m!581423))

(declare-fun m!581665 () Bool)

(assert (=> b!605288 m!581665))

(declare-fun m!581667 () Bool)

(assert (=> d!87409 m!581667))

(declare-fun m!581669 () Bool)

(assert (=> d!87409 m!581669))

(declare-fun m!581671 () Bool)

(assert (=> d!87409 m!581671))

(assert (=> d!87409 m!581463))

(assert (=> b!605080 d!87409))

(declare-fun b!605299 () Bool)

(declare-fun e!346427 () SeekEntryResult!6313)

(assert (=> b!605299 (= e!346427 (Found!6313 index!984))))

(declare-fun e!346428 () SeekEntryResult!6313)

(declare-fun b!605300 () Bool)

(assert (=> b!605300 (= e!346428 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!275966 lt!275959 mask!3053))))

(declare-fun b!605301 () Bool)

(assert (=> b!605301 (= e!346428 (MissingVacant!6313 vacantSpotIndex!68))))

(declare-fun b!605302 () Bool)

(declare-fun e!346429 () SeekEntryResult!6313)

(assert (=> b!605302 (= e!346429 e!346427)))

(declare-fun c!68531 () Bool)

(declare-fun lt!276108 () (_ BitVec 64))

(assert (=> b!605302 (= c!68531 (= lt!276108 lt!275966))))

(declare-fun b!605303 () Bool)

(declare-fun c!68533 () Bool)

(assert (=> b!605303 (= c!68533 (= lt!276108 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605303 (= e!346427 e!346428)))

(declare-fun lt!276109 () SeekEntryResult!6313)

(declare-fun d!87411 () Bool)

(assert (=> d!87411 (and (or ((_ is Undefined!6313) lt!276109) (not ((_ is Found!6313) lt!276109)) (and (bvsge (index!27519 lt!276109) #b00000000000000000000000000000000) (bvslt (index!27519 lt!276109) (size!18241 lt!275959)))) (or ((_ is Undefined!6313) lt!276109) ((_ is Found!6313) lt!276109) (not ((_ is MissingVacant!6313) lt!276109)) (not (= (index!27521 lt!276109) vacantSpotIndex!68)) (and (bvsge (index!27521 lt!276109) #b00000000000000000000000000000000) (bvslt (index!27521 lt!276109) (size!18241 lt!275959)))) (or ((_ is Undefined!6313) lt!276109) (ite ((_ is Found!6313) lt!276109) (= (select (arr!17876 lt!275959) (index!27519 lt!276109)) lt!275966) (and ((_ is MissingVacant!6313) lt!276109) (= (index!27521 lt!276109) vacantSpotIndex!68) (= (select (arr!17876 lt!275959) (index!27521 lt!276109)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87411 (= lt!276109 e!346429)))

(declare-fun c!68532 () Bool)

(assert (=> d!87411 (= c!68532 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87411 (= lt!276108 (select (arr!17876 lt!275959) index!984))))

(assert (=> d!87411 (validMask!0 mask!3053)))

(assert (=> d!87411 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275966 lt!275959 mask!3053) lt!276109)))

(declare-fun b!605304 () Bool)

(assert (=> b!605304 (= e!346429 Undefined!6313)))

(assert (= (and d!87411 c!68532) b!605304))

(assert (= (and d!87411 (not c!68532)) b!605302))

(assert (= (and b!605302 c!68531) b!605299))

(assert (= (and b!605302 (not c!68531)) b!605303))

(assert (= (and b!605303 c!68533) b!605301))

(assert (= (and b!605303 (not c!68533)) b!605300))

(assert (=> b!605300 m!581437))

(assert (=> b!605300 m!581437))

(declare-fun m!581683 () Bool)

(assert (=> b!605300 m!581683))

(declare-fun m!581685 () Bool)

(assert (=> d!87411 m!581685))

(declare-fun m!581687 () Bool)

(assert (=> d!87411 m!581687))

(declare-fun m!581689 () Bool)

(assert (=> d!87411 m!581689))

(assert (=> d!87411 m!581463))

(assert (=> b!605080 d!87411))

(declare-fun d!87415 () Bool)

(assert (=> d!87415 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!605059 d!87415))

(declare-fun b!605319 () Bool)

(declare-fun e!346440 () Bool)

(declare-fun e!346441 () Bool)

(assert (=> b!605319 (= e!346440 e!346441)))

(declare-fun c!68539 () Bool)

(assert (=> b!605319 (= c!68539 (validKeyInArray!0 (select (arr!17876 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605320 () Bool)

(declare-fun e!346439 () Bool)

(assert (=> b!605320 (= e!346441 e!346439)))

(declare-fun lt!276120 () (_ BitVec 64))

(assert (=> b!605320 (= lt!276120 (select (arr!17876 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!276119 () Unit!19260)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37242 (_ BitVec 64) (_ BitVec 32)) Unit!19260)

(assert (=> b!605320 (= lt!276119 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!276120 #b00000000000000000000000000000000))))

(assert (=> b!605320 (arrayContainsKey!0 a!2986 lt!276120 #b00000000000000000000000000000000)))

(declare-fun lt!276118 () Unit!19260)

(assert (=> b!605320 (= lt!276118 lt!276119)))

(declare-fun res!388976 () Bool)

(assert (=> b!605320 (= res!388976 (= (seekEntryOrOpen!0 (select (arr!17876 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6313 #b00000000000000000000000000000000)))))

(assert (=> b!605320 (=> (not res!388976) (not e!346439))))

(declare-fun bm!33017 () Bool)

(declare-fun call!33020 () Bool)

(assert (=> bm!33017 (= call!33020 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!87417 () Bool)

(declare-fun res!388975 () Bool)

(assert (=> d!87417 (=> res!388975 e!346440)))

(assert (=> d!87417 (= res!388975 (bvsge #b00000000000000000000000000000000 (size!18241 a!2986)))))

(assert (=> d!87417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!346440)))

(declare-fun b!605321 () Bool)

(assert (=> b!605321 (= e!346439 call!33020)))

(declare-fun b!605322 () Bool)

(assert (=> b!605322 (= e!346441 call!33020)))

(assert (= (and d!87417 (not res!388975)) b!605319))

(assert (= (and b!605319 c!68539) b!605320))

(assert (= (and b!605319 (not c!68539)) b!605322))

(assert (= (and b!605320 res!388976) b!605321))

(assert (= (or b!605321 b!605322) bm!33017))

(declare-fun m!581699 () Bool)

(assert (=> b!605319 m!581699))

(assert (=> b!605319 m!581699))

(declare-fun m!581701 () Bool)

(assert (=> b!605319 m!581701))

(assert (=> b!605320 m!581699))

(declare-fun m!581703 () Bool)

(assert (=> b!605320 m!581703))

(declare-fun m!581705 () Bool)

(assert (=> b!605320 m!581705))

(assert (=> b!605320 m!581699))

(declare-fun m!581707 () Bool)

(assert (=> b!605320 m!581707))

(declare-fun m!581709 () Bool)

(assert (=> bm!33017 m!581709))

(assert (=> b!605067 d!87417))

(declare-fun d!87423 () Bool)

(declare-fun res!388977 () Bool)

(declare-fun e!346442 () Bool)

(assert (=> d!87423 (=> res!388977 e!346442)))

(assert (=> d!87423 (= res!388977 (= (select (arr!17876 lt!275959) index!984) (select (arr!17876 a!2986) j!136)))))

(assert (=> d!87423 (= (arrayContainsKey!0 lt!275959 (select (arr!17876 a!2986) j!136) index!984) e!346442)))

(declare-fun b!605323 () Bool)

(declare-fun e!346443 () Bool)

(assert (=> b!605323 (= e!346442 e!346443)))

(declare-fun res!388978 () Bool)

(assert (=> b!605323 (=> (not res!388978) (not e!346443))))

(assert (=> b!605323 (= res!388978 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18241 lt!275959)))))

(declare-fun b!605324 () Bool)

(assert (=> b!605324 (= e!346443 (arrayContainsKey!0 lt!275959 (select (arr!17876 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87423 (not res!388977)) b!605323))

(assert (= (and b!605323 res!388978) b!605324))

(assert (=> d!87423 m!581689))

(assert (=> b!605324 m!581423))

(declare-fun m!581711 () Bool)

(assert (=> b!605324 m!581711))

(assert (=> b!605062 d!87423))

(declare-fun d!87425 () Bool)

(declare-fun res!388979 () Bool)

(declare-fun e!346444 () Bool)

(assert (=> d!87425 (=> res!388979 e!346444)))

(assert (=> d!87425 (= res!388979 (= (select (arr!17876 lt!275959) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17876 a!2986) j!136)))))

(assert (=> d!87425 (= (arrayContainsKey!0 lt!275959 (select (arr!17876 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!346444)))

(declare-fun b!605325 () Bool)

(declare-fun e!346445 () Bool)

(assert (=> b!605325 (= e!346444 e!346445)))

(declare-fun res!388980 () Bool)

(assert (=> b!605325 (=> (not res!388980) (not e!346445))))

(assert (=> b!605325 (= res!388980 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18241 lt!275959)))))

(declare-fun b!605326 () Bool)

(assert (=> b!605326 (= e!346445 (arrayContainsKey!0 lt!275959 (select (arr!17876 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87425 (not res!388979)) b!605325))

(assert (= (and b!605325 res!388980) b!605326))

(declare-fun m!581713 () Bool)

(assert (=> d!87425 m!581713))

(assert (=> b!605326 m!581423))

(declare-fun m!581715 () Bool)

(assert (=> b!605326 m!581715))

(assert (=> b!605074 d!87425))

(declare-fun d!87427 () Bool)

(assert (=> d!87427 (arrayContainsKey!0 lt!275959 (select (arr!17876 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276121 () Unit!19260)

(assert (=> d!87427 (= lt!276121 (choose!114 lt!275959 (select (arr!17876 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!87427 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!87427 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275959 (select (arr!17876 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!276121)))

(declare-fun bs!18495 () Bool)

(assert (= bs!18495 d!87427))

(assert (=> bs!18495 m!581423))

(assert (=> bs!18495 m!581425))

(assert (=> bs!18495 m!581423))

(declare-fun m!581717 () Bool)

(assert (=> bs!18495 m!581717))

(assert (=> b!605074 d!87427))

(declare-fun d!87429 () Bool)

(declare-fun res!388981 () Bool)

(declare-fun e!346446 () Bool)

(assert (=> d!87429 (=> res!388981 e!346446)))

(assert (=> d!87429 (= res!388981 (= (select (arr!17876 lt!275959) j!136) (select (arr!17876 a!2986) j!136)))))

(assert (=> d!87429 (= (arrayContainsKey!0 lt!275959 (select (arr!17876 a!2986) j!136) j!136) e!346446)))

(declare-fun b!605327 () Bool)

(declare-fun e!346447 () Bool)

(assert (=> b!605327 (= e!346446 e!346447)))

(declare-fun res!388982 () Bool)

(assert (=> b!605327 (=> (not res!388982) (not e!346447))))

(assert (=> b!605327 (= res!388982 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18241 lt!275959)))))

(declare-fun b!605328 () Bool)

(assert (=> b!605328 (= e!346447 (arrayContainsKey!0 lt!275959 (select (arr!17876 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87429 (not res!388981)) b!605327))

(assert (= (and b!605327 res!388982) b!605328))

(assert (=> d!87429 m!581611))

(assert (=> b!605328 m!581423))

(declare-fun m!581719 () Bool)

(assert (=> b!605328 m!581719))

(assert (=> b!605074 d!87429))

(declare-fun b!605329 () Bool)

(declare-fun e!346449 () Bool)

(declare-fun e!346448 () Bool)

(assert (=> b!605329 (= e!346449 e!346448)))

(declare-fun c!68540 () Bool)

(assert (=> b!605329 (= c!68540 (validKeyInArray!0 (select (arr!17876 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605330 () Bool)

(declare-fun e!346451 () Bool)

(assert (=> b!605330 (= e!346451 e!346449)))

(declare-fun res!388983 () Bool)

(assert (=> b!605330 (=> (not res!388983) (not e!346449))))

(declare-fun e!346450 () Bool)

(assert (=> b!605330 (= res!388983 (not e!346450))))

(declare-fun res!388984 () Bool)

(assert (=> b!605330 (=> (not res!388984) (not e!346450))))

(assert (=> b!605330 (= res!388984 (validKeyInArray!0 (select (arr!17876 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605331 () Bool)

(assert (=> b!605331 (= e!346450 (contains!2979 Nil!11953 (select (arr!17876 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605332 () Bool)

(declare-fun call!33021 () Bool)

(assert (=> b!605332 (= e!346448 call!33021)))

(declare-fun d!87431 () Bool)

(declare-fun res!388985 () Bool)

(assert (=> d!87431 (=> res!388985 e!346451)))

(assert (=> d!87431 (= res!388985 (bvsge #b00000000000000000000000000000000 (size!18241 a!2986)))))

(assert (=> d!87431 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11953) e!346451)))

(declare-fun b!605333 () Bool)

(assert (=> b!605333 (= e!346448 call!33021)))

(declare-fun bm!33018 () Bool)

(assert (=> bm!33018 (= call!33021 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68540 (Cons!11952 (select (arr!17876 a!2986) #b00000000000000000000000000000000) Nil!11953) Nil!11953)))))

(assert (= (and d!87431 (not res!388985)) b!605330))

(assert (= (and b!605330 res!388984) b!605331))

(assert (= (and b!605330 res!388983) b!605329))

(assert (= (and b!605329 c!68540) b!605332))

(assert (= (and b!605329 (not c!68540)) b!605333))

(assert (= (or b!605332 b!605333) bm!33018))

(assert (=> b!605329 m!581699))

(assert (=> b!605329 m!581699))

(assert (=> b!605329 m!581701))

(assert (=> b!605330 m!581699))

(assert (=> b!605330 m!581699))

(assert (=> b!605330 m!581701))

(assert (=> b!605331 m!581699))

(assert (=> b!605331 m!581699))

(declare-fun m!581721 () Bool)

(assert (=> b!605331 m!581721))

(assert (=> bm!33018 m!581699))

(declare-fun m!581723 () Bool)

(assert (=> bm!33018 m!581723))

(assert (=> b!605075 d!87431))

(assert (=> b!605070 d!87429))

(declare-fun b!605375 () Bool)

(declare-fun e!346481 () SeekEntryResult!6313)

(declare-fun lt!276142 () SeekEntryResult!6313)

(assert (=> b!605375 (= e!346481 (MissingZero!6313 (index!27520 lt!276142)))))

(declare-fun d!87433 () Bool)

(declare-fun lt!276144 () SeekEntryResult!6313)

(assert (=> d!87433 (and (or ((_ is Undefined!6313) lt!276144) (not ((_ is Found!6313) lt!276144)) (and (bvsge (index!27519 lt!276144) #b00000000000000000000000000000000) (bvslt (index!27519 lt!276144) (size!18241 a!2986)))) (or ((_ is Undefined!6313) lt!276144) ((_ is Found!6313) lt!276144) (not ((_ is MissingZero!6313) lt!276144)) (and (bvsge (index!27518 lt!276144) #b00000000000000000000000000000000) (bvslt (index!27518 lt!276144) (size!18241 a!2986)))) (or ((_ is Undefined!6313) lt!276144) ((_ is Found!6313) lt!276144) ((_ is MissingZero!6313) lt!276144) (not ((_ is MissingVacant!6313) lt!276144)) (and (bvsge (index!27521 lt!276144) #b00000000000000000000000000000000) (bvslt (index!27521 lt!276144) (size!18241 a!2986)))) (or ((_ is Undefined!6313) lt!276144) (ite ((_ is Found!6313) lt!276144) (= (select (arr!17876 a!2986) (index!27519 lt!276144)) k0!1786) (ite ((_ is MissingZero!6313) lt!276144) (= (select (arr!17876 a!2986) (index!27518 lt!276144)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6313) lt!276144) (= (select (arr!17876 a!2986) (index!27521 lt!276144)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!346482 () SeekEntryResult!6313)

(assert (=> d!87433 (= lt!276144 e!346482)))

(declare-fun c!68556 () Bool)

(assert (=> d!87433 (= c!68556 (and ((_ is Intermediate!6313) lt!276142) (undefined!7125 lt!276142)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37242 (_ BitVec 32)) SeekEntryResult!6313)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87433 (= lt!276142 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87433 (validMask!0 mask!3053)))

(assert (=> d!87433 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!276144)))

(declare-fun b!605376 () Bool)

(declare-fun e!346480 () SeekEntryResult!6313)

(assert (=> b!605376 (= e!346480 (Found!6313 (index!27520 lt!276142)))))

(declare-fun b!605377 () Bool)

(assert (=> b!605377 (= e!346482 Undefined!6313)))

(declare-fun b!605378 () Bool)

(declare-fun c!68555 () Bool)

(declare-fun lt!276143 () (_ BitVec 64))

(assert (=> b!605378 (= c!68555 (= lt!276143 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605378 (= e!346480 e!346481)))

(declare-fun b!605379 () Bool)

(assert (=> b!605379 (= e!346481 (seekKeyOrZeroReturnVacant!0 (x!56326 lt!276142) (index!27520 lt!276142) (index!27520 lt!276142) k0!1786 a!2986 mask!3053))))

(declare-fun b!605380 () Bool)

(assert (=> b!605380 (= e!346482 e!346480)))

(assert (=> b!605380 (= lt!276143 (select (arr!17876 a!2986) (index!27520 lt!276142)))))

(declare-fun c!68554 () Bool)

(assert (=> b!605380 (= c!68554 (= lt!276143 k0!1786))))

(assert (= (and d!87433 c!68556) b!605377))

(assert (= (and d!87433 (not c!68556)) b!605380))

(assert (= (and b!605380 c!68554) b!605376))

(assert (= (and b!605380 (not c!68554)) b!605378))

(assert (= (and b!605378 c!68555) b!605375))

(assert (= (and b!605378 (not c!68555)) b!605379))

(declare-fun m!581759 () Bool)

(assert (=> d!87433 m!581759))

(assert (=> d!87433 m!581759))

(declare-fun m!581761 () Bool)

(assert (=> d!87433 m!581761))

(declare-fun m!581763 () Bool)

(assert (=> d!87433 m!581763))

(declare-fun m!581765 () Bool)

(assert (=> d!87433 m!581765))

(declare-fun m!581767 () Bool)

(assert (=> d!87433 m!581767))

(assert (=> d!87433 m!581463))

(declare-fun m!581769 () Bool)

(assert (=> b!605379 m!581769))

(declare-fun m!581771 () Bool)

(assert (=> b!605380 m!581771))

(assert (=> b!605071 d!87433))

(declare-fun d!87455 () Bool)

(declare-fun res!389001 () Bool)

(declare-fun e!346483 () Bool)

(assert (=> d!87455 (=> res!389001 e!346483)))

(assert (=> d!87455 (= res!389001 (= (select (arr!17876 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87455 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!346483)))

(declare-fun b!605381 () Bool)

(declare-fun e!346484 () Bool)

(assert (=> b!605381 (= e!346483 e!346484)))

(declare-fun res!389002 () Bool)

(assert (=> b!605381 (=> (not res!389002) (not e!346484))))

(assert (=> b!605381 (= res!389002 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18241 a!2986)))))

(declare-fun b!605382 () Bool)

(assert (=> b!605382 (= e!346484 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87455 (not res!389001)) b!605381))

(assert (= (and b!605381 res!389002) b!605382))

(assert (=> d!87455 m!581699))

(declare-fun m!581773 () Bool)

(assert (=> b!605382 m!581773))

(assert (=> b!605061 d!87455))

(assert (=> b!605072 d!87423))

(check-sat (not d!87433) (not b!605242) (not bm!33017) (not b!605244) (not d!87395) (not bm!33018) (not b!605231) (not d!87427) (not b!605331) (not d!87403) (not b!605230) (not b!605229) (not b!605319) (not b!605243) (not d!87411) (not bm!33013) (not b!605261) (not b!605330) (not d!87407) (not d!87385) (not b!605239) (not bm!33014) (not d!87377) (not b!605267) (not b!605300) (not b!605382) (not d!87379) (not b!605320) (not b!605288) (not b!605329) (not d!87401) (not b!605328) (not d!87409) (not b!605379) (not b!605245) (not b!605286) (not b!605326) (not b!605324) (not d!87387))
(check-sat)
