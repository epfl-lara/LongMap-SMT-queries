; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57876 () Bool)

(assert start!57876)

(declare-fun b!639814 () Bool)

(declare-fun e!366205 () Bool)

(declare-fun e!366199 () Bool)

(assert (=> b!639814 (= e!366205 e!366199)))

(declare-fun res!414232 () Bool)

(assert (=> b!639814 (=> (not res!414232) (not e!366199))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6772 0))(
  ( (MissingZero!6772 (index!29405 (_ BitVec 32))) (Found!6772 (index!29406 (_ BitVec 32))) (Intermediate!6772 (undefined!7584 Bool) (index!29407 (_ BitVec 32)) (x!58314 (_ BitVec 32))) (Undefined!6772) (MissingVacant!6772 (index!29408 (_ BitVec 32))) )
))
(declare-fun lt!296009 () SeekEntryResult!6772)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38316 0))(
  ( (array!38317 (arr!18376 (Array (_ BitVec 32) (_ BitVec 64))) (size!18740 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38316)

(assert (=> b!639814 (= res!414232 (and (= lt!296009 (Found!6772 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18376 a!2986) index!984) (select (arr!18376 a!2986) j!136))) (not (= (select (arr!18376 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38316 (_ BitVec 32)) SeekEntryResult!6772)

(assert (=> b!639814 (= lt!296009 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18376 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639815 () Bool)

(declare-fun res!414233 () Bool)

(declare-fun e!366204 () Bool)

(assert (=> b!639815 (=> (not res!414233) (not e!366204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639815 (= res!414233 (validKeyInArray!0 (select (arr!18376 a!2986) j!136)))))

(declare-fun b!639816 () Bool)

(declare-fun res!414234 () Bool)

(assert (=> b!639816 (=> (not res!414234) (not e!366204))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!639816 (= res!414234 (and (= (size!18740 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18740 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18740 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639817 () Bool)

(declare-fun e!366203 () Bool)

(assert (=> b!639817 (= e!366203 e!366205)))

(declare-fun res!414242 () Bool)

(assert (=> b!639817 (=> (not res!414242) (not e!366205))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!639817 (= res!414242 (= (select (store (arr!18376 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!296018 () array!38316)

(assert (=> b!639817 (= lt!296018 (array!38317 (store (arr!18376 a!2986) i!1108 k0!1786) (size!18740 a!2986)))))

(declare-fun b!639818 () Bool)

(declare-fun e!366202 () Bool)

(declare-fun e!366207 () Bool)

(assert (=> b!639818 (= e!366202 e!366207)))

(declare-fun res!414247 () Bool)

(assert (=> b!639818 (=> res!414247 e!366207)))

(declare-fun lt!296019 () (_ BitVec 64))

(declare-fun lt!296010 () (_ BitVec 64))

(assert (=> b!639818 (= res!414247 (or (not (= (select (arr!18376 a!2986) j!136) lt!296019)) (not (= (select (arr!18376 a!2986) j!136) lt!296010)) (bvsge j!136 index!984)))))

(declare-fun b!639819 () Bool)

(declare-fun res!414241 () Bool)

(assert (=> b!639819 (=> (not res!414241) (not e!366203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38316 (_ BitVec 32)) Bool)

(assert (=> b!639819 (= res!414241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639820 () Bool)

(assert (=> b!639820 (= e!366204 e!366203)))

(declare-fun res!414235 () Bool)

(assert (=> b!639820 (=> (not res!414235) (not e!366203))))

(declare-fun lt!296012 () SeekEntryResult!6772)

(assert (=> b!639820 (= res!414235 (or (= lt!296012 (MissingZero!6772 i!1108)) (= lt!296012 (MissingVacant!6772 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38316 (_ BitVec 32)) SeekEntryResult!6772)

(assert (=> b!639820 (= lt!296012 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!414236 () Bool)

(assert (=> start!57876 (=> (not res!414236) (not e!366204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57876 (= res!414236 (validMask!0 mask!3053))))

(assert (=> start!57876 e!366204))

(assert (=> start!57876 true))

(declare-fun array_inv!14235 (array!38316) Bool)

(assert (=> start!57876 (array_inv!14235 a!2986)))

(declare-fun b!639821 () Bool)

(declare-fun e!366196 () Bool)

(assert (=> b!639821 (= e!366199 (not e!366196))))

(declare-fun res!414238 () Bool)

(assert (=> b!639821 (=> res!414238 e!366196)))

(declare-fun lt!296016 () SeekEntryResult!6772)

(assert (=> b!639821 (= res!414238 (not (= lt!296016 (Found!6772 index!984))))))

(declare-datatypes ((Unit!21597 0))(
  ( (Unit!21598) )
))
(declare-fun lt!296017 () Unit!21597)

(declare-fun e!366201 () Unit!21597)

(assert (=> b!639821 (= lt!296017 e!366201)))

(declare-fun c!73160 () Bool)

(assert (=> b!639821 (= c!73160 (= lt!296016 Undefined!6772))))

(assert (=> b!639821 (= lt!296016 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296019 lt!296018 mask!3053))))

(declare-fun e!366200 () Bool)

(assert (=> b!639821 e!366200))

(declare-fun res!414245 () Bool)

(assert (=> b!639821 (=> (not res!414245) (not e!366200))))

(declare-fun lt!296011 () SeekEntryResult!6772)

(declare-fun lt!296013 () (_ BitVec 32))

(assert (=> b!639821 (= res!414245 (= lt!296011 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296013 vacantSpotIndex!68 lt!296019 lt!296018 mask!3053)))))

(assert (=> b!639821 (= lt!296011 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296013 vacantSpotIndex!68 (select (arr!18376 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639821 (= lt!296019 (select (store (arr!18376 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296020 () Unit!21597)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38316 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21597)

(assert (=> b!639821 (= lt!296020 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296013 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639821 (= lt!296013 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!639822 () Bool)

(declare-fun res!414244 () Bool)

(assert (=> b!639822 (=> (not res!414244) (not e!366203))))

(assert (=> b!639822 (= res!414244 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18376 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639823 () Bool)

(declare-fun e!366206 () Bool)

(assert (=> b!639823 (= e!366196 e!366206)))

(declare-fun res!414239 () Bool)

(assert (=> b!639823 (=> res!414239 e!366206)))

(assert (=> b!639823 (= res!414239 (or (not (= (select (arr!18376 a!2986) j!136) lt!296019)) (not (= (select (arr!18376 a!2986) j!136) lt!296010)) (bvsge j!136 index!984)))))

(assert (=> b!639823 e!366202))

(declare-fun res!414240 () Bool)

(assert (=> b!639823 (=> (not res!414240) (not e!366202))))

(assert (=> b!639823 (= res!414240 (= lt!296010 (select (arr!18376 a!2986) j!136)))))

(assert (=> b!639823 (= lt!296010 (select (store (arr!18376 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!639824 () Bool)

(declare-fun Unit!21599 () Unit!21597)

(assert (=> b!639824 (= e!366201 Unit!21599)))

(declare-fun b!639825 () Bool)

(declare-fun res!414243 () Bool)

(assert (=> b!639825 (=> (not res!414243) (not e!366204))))

(assert (=> b!639825 (= res!414243 (validKeyInArray!0 k0!1786))))

(declare-fun b!639826 () Bool)

(assert (=> b!639826 (= e!366200 (= lt!296009 lt!296011))))

(declare-fun b!639827 () Bool)

(declare-fun e!366197 () Bool)

(declare-fun arrayContainsKey!0 (array!38316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639827 (= e!366197 (arrayContainsKey!0 lt!296018 (select (arr!18376 a!2986) j!136) index!984))))

(declare-fun b!639828 () Bool)

(declare-fun Unit!21600 () Unit!21597)

(assert (=> b!639828 (= e!366201 Unit!21600)))

(assert (=> b!639828 false))

(declare-fun b!639829 () Bool)

(declare-fun res!414237 () Bool)

(assert (=> b!639829 (=> (not res!414237) (not e!366204))))

(assert (=> b!639829 (= res!414237 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639830 () Bool)

(assert (=> b!639830 (= e!366207 e!366197)))

(declare-fun res!414246 () Bool)

(assert (=> b!639830 (=> (not res!414246) (not e!366197))))

(assert (=> b!639830 (= res!414246 (arrayContainsKey!0 lt!296018 (select (arr!18376 a!2986) j!136) j!136))))

(declare-fun b!639831 () Bool)

(declare-fun res!414231 () Bool)

(assert (=> b!639831 (=> (not res!414231) (not e!366203))))

(declare-datatypes ((List!12324 0))(
  ( (Nil!12321) (Cons!12320 (h!13368 (_ BitVec 64)) (t!18544 List!12324)) )
))
(declare-fun arrayNoDuplicates!0 (array!38316 (_ BitVec 32) List!12324) Bool)

(assert (=> b!639831 (= res!414231 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12321))))

(declare-fun b!639832 () Bool)

(assert (=> b!639832 (= e!366206 true)))

(assert (=> b!639832 (arrayNoDuplicates!0 lt!296018 #b00000000000000000000000000000000 Nil!12321)))

(declare-fun lt!296015 () Unit!21597)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38316 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12324) Unit!21597)

(assert (=> b!639832 (= lt!296015 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12321))))

(assert (=> b!639832 (arrayContainsKey!0 lt!296018 (select (arr!18376 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296014 () Unit!21597)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38316 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21597)

(assert (=> b!639832 (= lt!296014 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296018 (select (arr!18376 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!57876 res!414236) b!639816))

(assert (= (and b!639816 res!414234) b!639815))

(assert (= (and b!639815 res!414233) b!639825))

(assert (= (and b!639825 res!414243) b!639829))

(assert (= (and b!639829 res!414237) b!639820))

(assert (= (and b!639820 res!414235) b!639819))

(assert (= (and b!639819 res!414241) b!639831))

(assert (= (and b!639831 res!414231) b!639822))

(assert (= (and b!639822 res!414244) b!639817))

(assert (= (and b!639817 res!414242) b!639814))

(assert (= (and b!639814 res!414232) b!639821))

(assert (= (and b!639821 res!414245) b!639826))

(assert (= (and b!639821 c!73160) b!639828))

(assert (= (and b!639821 (not c!73160)) b!639824))

(assert (= (and b!639821 (not res!414238)) b!639823))

(assert (= (and b!639823 res!414240) b!639818))

(assert (= (and b!639818 (not res!414247)) b!639830))

(assert (= (and b!639830 res!414246) b!639827))

(assert (= (and b!639823 (not res!414239)) b!639832))

(declare-fun m!614041 () Bool)

(assert (=> b!639817 m!614041))

(declare-fun m!614043 () Bool)

(assert (=> b!639817 m!614043))

(declare-fun m!614045 () Bool)

(assert (=> b!639818 m!614045))

(declare-fun m!614047 () Bool)

(assert (=> start!57876 m!614047))

(declare-fun m!614049 () Bool)

(assert (=> start!57876 m!614049))

(assert (=> b!639827 m!614045))

(assert (=> b!639827 m!614045))

(declare-fun m!614051 () Bool)

(assert (=> b!639827 m!614051))

(declare-fun m!614053 () Bool)

(assert (=> b!639821 m!614053))

(declare-fun m!614055 () Bool)

(assert (=> b!639821 m!614055))

(assert (=> b!639821 m!614045))

(assert (=> b!639821 m!614041))

(declare-fun m!614057 () Bool)

(assert (=> b!639821 m!614057))

(declare-fun m!614059 () Bool)

(assert (=> b!639821 m!614059))

(declare-fun m!614061 () Bool)

(assert (=> b!639821 m!614061))

(assert (=> b!639821 m!614045))

(declare-fun m!614063 () Bool)

(assert (=> b!639821 m!614063))

(declare-fun m!614065 () Bool)

(assert (=> b!639831 m!614065))

(assert (=> b!639823 m!614045))

(assert (=> b!639823 m!614041))

(declare-fun m!614067 () Bool)

(assert (=> b!639823 m!614067))

(declare-fun m!614069 () Bool)

(assert (=> b!639814 m!614069))

(assert (=> b!639814 m!614045))

(assert (=> b!639814 m!614045))

(declare-fun m!614071 () Bool)

(assert (=> b!639814 m!614071))

(assert (=> b!639830 m!614045))

(assert (=> b!639830 m!614045))

(declare-fun m!614073 () Bool)

(assert (=> b!639830 m!614073))

(assert (=> b!639832 m!614045))

(declare-fun m!614075 () Bool)

(assert (=> b!639832 m!614075))

(assert (=> b!639832 m!614045))

(declare-fun m!614077 () Bool)

(assert (=> b!639832 m!614077))

(assert (=> b!639832 m!614045))

(declare-fun m!614079 () Bool)

(assert (=> b!639832 m!614079))

(declare-fun m!614081 () Bool)

(assert (=> b!639832 m!614081))

(declare-fun m!614083 () Bool)

(assert (=> b!639820 m!614083))

(declare-fun m!614085 () Bool)

(assert (=> b!639829 m!614085))

(declare-fun m!614087 () Bool)

(assert (=> b!639825 m!614087))

(assert (=> b!639815 m!614045))

(assert (=> b!639815 m!614045))

(declare-fun m!614089 () Bool)

(assert (=> b!639815 m!614089))

(declare-fun m!614091 () Bool)

(assert (=> b!639822 m!614091))

(declare-fun m!614093 () Bool)

(assert (=> b!639819 m!614093))

(check-sat (not b!639829) (not b!639814) (not b!639821) (not b!639815) (not b!639832) (not b!639825) (not start!57876) (not b!639831) (not b!639827) (not b!639830) (not b!639819) (not b!639820))
(check-sat)
