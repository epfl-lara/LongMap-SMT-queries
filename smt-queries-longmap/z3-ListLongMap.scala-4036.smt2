; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55008 () Bool)

(assert start!55008)

(declare-fun b!602069 () Bool)

(declare-fun res!386567 () Bool)

(declare-fun e!344309 () Bool)

(assert (=> b!602069 (=> (not res!386567) (not e!344309))))

(declare-datatypes ((array!37162 0))(
  ( (array!37163 (arr!17839 (Array (_ BitVec 32) (_ BitVec 64))) (size!18203 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37162)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!602069 (= res!386567 (validKeyInArray!0 (select (arr!17839 a!2986) j!136)))))

(declare-fun b!602070 () Bool)

(declare-datatypes ((Unit!19054 0))(
  ( (Unit!19055) )
))
(declare-fun e!344313 () Unit!19054)

(declare-fun Unit!19056 () Unit!19054)

(assert (=> b!602070 (= e!344313 Unit!19056)))

(declare-fun lt!274157 () Unit!19054)

(declare-fun lt!274162 () array!37162)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37162 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19054)

(assert (=> b!602070 (= lt!274157 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274162 (select (arr!17839 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37162 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602070 (arrayContainsKey!0 lt!274162 (select (arr!17839 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!274156 () Unit!19054)

(declare-datatypes ((List!11880 0))(
  ( (Nil!11877) (Cons!11876 (h!12921 (_ BitVec 64)) (t!18108 List!11880)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37162 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11880) Unit!19054)

(assert (=> b!602070 (= lt!274156 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11877))))

(declare-fun arrayNoDuplicates!0 (array!37162 (_ BitVec 32) List!11880) Bool)

(assert (=> b!602070 (arrayNoDuplicates!0 lt!274162 #b00000000000000000000000000000000 Nil!11877)))

(declare-fun lt!274168 () Unit!19054)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37162 (_ BitVec 32) (_ BitVec 32)) Unit!19054)

(assert (=> b!602070 (= lt!274168 (lemmaNoDuplicateFromThenFromBigger!0 lt!274162 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602070 (arrayNoDuplicates!0 lt!274162 j!136 Nil!11877)))

(declare-fun lt!274159 () Unit!19054)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37162 (_ BitVec 64) (_ BitVec 32) List!11880) Unit!19054)

(assert (=> b!602070 (= lt!274159 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274162 (select (arr!17839 a!2986) j!136) j!136 Nil!11877))))

(assert (=> b!602070 false))

(declare-fun b!602071 () Bool)

(declare-fun e!344306 () Bool)

(declare-fun e!344307 () Bool)

(assert (=> b!602071 (= e!344306 (not e!344307))))

(declare-fun res!386574 () Bool)

(assert (=> b!602071 (=> res!386574 e!344307)))

(declare-datatypes ((SeekEntryResult!6279 0))(
  ( (MissingZero!6279 (index!27376 (_ BitVec 32))) (Found!6279 (index!27377 (_ BitVec 32))) (Intermediate!6279 (undefined!7091 Bool) (index!27378 (_ BitVec 32)) (x!56175 (_ BitVec 32))) (Undefined!6279) (MissingVacant!6279 (index!27379 (_ BitVec 32))) )
))
(declare-fun lt!274164 () SeekEntryResult!6279)

(assert (=> b!602071 (= res!386574 (not (= lt!274164 (Found!6279 index!984))))))

(declare-fun lt!274165 () Unit!19054)

(declare-fun e!344316 () Unit!19054)

(assert (=> b!602071 (= lt!274165 e!344316)))

(declare-fun c!68123 () Bool)

(assert (=> b!602071 (= c!68123 (= lt!274164 Undefined!6279))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!274163 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37162 (_ BitVec 32)) SeekEntryResult!6279)

(assert (=> b!602071 (= lt!274164 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274163 lt!274162 mask!3053))))

(declare-fun e!344310 () Bool)

(assert (=> b!602071 e!344310))

(declare-fun res!386571 () Bool)

(assert (=> b!602071 (=> (not res!386571) (not e!344310))))

(declare-fun lt!274167 () (_ BitVec 32))

(declare-fun lt!274154 () SeekEntryResult!6279)

(assert (=> b!602071 (= res!386571 (= lt!274154 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274167 vacantSpotIndex!68 lt!274163 lt!274162 mask!3053)))))

(assert (=> b!602071 (= lt!274154 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274167 vacantSpotIndex!68 (select (arr!17839 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!602071 (= lt!274163 (select (store (arr!17839 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!274161 () Unit!19054)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37162 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19054)

(assert (=> b!602071 (= lt!274161 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274167 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!602071 (= lt!274167 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!602072 () Bool)

(declare-fun res!386569 () Bool)

(declare-fun e!344308 () Bool)

(assert (=> b!602072 (=> (not res!386569) (not e!344308))))

(assert (=> b!602072 (= res!386569 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17839 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!602073 () Bool)

(assert (=> b!602073 (= e!344309 e!344308)))

(declare-fun res!386561 () Bool)

(assert (=> b!602073 (=> (not res!386561) (not e!344308))))

(declare-fun lt!274166 () SeekEntryResult!6279)

(assert (=> b!602073 (= res!386561 (or (= lt!274166 (MissingZero!6279 i!1108)) (= lt!274166 (MissingVacant!6279 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37162 (_ BitVec 32)) SeekEntryResult!6279)

(assert (=> b!602073 (= lt!274166 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!602074 () Bool)

(declare-fun e!344312 () Bool)

(declare-fun e!344317 () Bool)

(assert (=> b!602074 (= e!344312 e!344317)))

(declare-fun res!386566 () Bool)

(assert (=> b!602074 (=> res!386566 e!344317)))

(declare-fun lt!274158 () (_ BitVec 64))

(assert (=> b!602074 (= res!386566 (or (not (= (select (arr!17839 a!2986) j!136) lt!274163)) (not (= (select (arr!17839 a!2986) j!136) lt!274158)) (bvsge j!136 index!984)))))

(declare-fun b!602075 () Bool)

(declare-fun e!344314 () Bool)

(assert (=> b!602075 (= e!344317 e!344314)))

(declare-fun res!386576 () Bool)

(assert (=> b!602075 (=> (not res!386576) (not e!344314))))

(assert (=> b!602075 (= res!386576 (arrayContainsKey!0 lt!274162 (select (arr!17839 a!2986) j!136) j!136))))

(declare-fun b!602077 () Bool)

(declare-fun res!386572 () Bool)

(assert (=> b!602077 (=> (not res!386572) (not e!344309))))

(assert (=> b!602077 (= res!386572 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!602078 () Bool)

(declare-fun Unit!19057 () Unit!19054)

(assert (=> b!602078 (= e!344313 Unit!19057)))

(declare-fun b!602079 () Bool)

(assert (=> b!602079 (= e!344314 (arrayContainsKey!0 lt!274162 (select (arr!17839 a!2986) j!136) index!984))))

(declare-fun b!602080 () Bool)

(declare-fun Unit!19058 () Unit!19054)

(assert (=> b!602080 (= e!344316 Unit!19058)))

(declare-fun b!602081 () Bool)

(declare-fun res!386568 () Bool)

(assert (=> b!602081 (=> (not res!386568) (not e!344309))))

(assert (=> b!602081 (= res!386568 (and (= (size!18203 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18203 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18203 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!602082 () Bool)

(declare-fun e!344311 () Bool)

(assert (=> b!602082 (= e!344307 e!344311)))

(declare-fun res!386563 () Bool)

(assert (=> b!602082 (=> res!386563 e!344311)))

(assert (=> b!602082 (= res!386563 (or (not (= (select (arr!17839 a!2986) j!136) lt!274163)) (not (= (select (arr!17839 a!2986) j!136) lt!274158))))))

(assert (=> b!602082 e!344312))

(declare-fun res!386564 () Bool)

(assert (=> b!602082 (=> (not res!386564) (not e!344312))))

(assert (=> b!602082 (= res!386564 (= lt!274158 (select (arr!17839 a!2986) j!136)))))

(assert (=> b!602082 (= lt!274158 (select (store (arr!17839 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!602083 () Bool)

(declare-fun res!386565 () Bool)

(assert (=> b!602083 (=> (not res!386565) (not e!344308))))

(assert (=> b!602083 (= res!386565 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11877))))

(declare-fun b!602084 () Bool)

(declare-fun e!344318 () Bool)

(assert (=> b!602084 (= e!344308 e!344318)))

(declare-fun res!386559 () Bool)

(assert (=> b!602084 (=> (not res!386559) (not e!344318))))

(assert (=> b!602084 (= res!386559 (= (select (store (arr!17839 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602084 (= lt!274162 (array!37163 (store (arr!17839 a!2986) i!1108 k0!1786) (size!18203 a!2986)))))

(declare-fun b!602085 () Bool)

(assert (=> b!602085 (= e!344318 e!344306)))

(declare-fun res!386560 () Bool)

(assert (=> b!602085 (=> (not res!386560) (not e!344306))))

(declare-fun lt!274155 () SeekEntryResult!6279)

(assert (=> b!602085 (= res!386560 (and (= lt!274155 (Found!6279 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17839 a!2986) index!984) (select (arr!17839 a!2986) j!136))) (not (= (select (arr!17839 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!602085 (= lt!274155 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17839 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602086 () Bool)

(declare-fun Unit!19059 () Unit!19054)

(assert (=> b!602086 (= e!344316 Unit!19059)))

(assert (=> b!602086 false))

(declare-fun b!602087 () Bool)

(declare-fun res!386575 () Bool)

(assert (=> b!602087 (=> (not res!386575) (not e!344308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37162 (_ BitVec 32)) Bool)

(assert (=> b!602087 (= res!386575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!602088 () Bool)

(declare-fun e!344319 () Bool)

(assert (=> b!602088 (= e!344319 true)))

(assert (=> b!602088 (arrayContainsKey!0 lt!274162 (select (arr!17839 a!2986) j!136) j!136)))

(declare-fun b!602089 () Bool)

(assert (=> b!602089 (= e!344310 (= lt!274155 lt!274154))))

(declare-fun b!602090 () Bool)

(declare-fun res!386562 () Bool)

(assert (=> b!602090 (=> (not res!386562) (not e!344309))))

(assert (=> b!602090 (= res!386562 (validKeyInArray!0 k0!1786))))

(declare-fun b!602076 () Bool)

(assert (=> b!602076 (= e!344311 e!344319)))

(declare-fun res!386570 () Bool)

(assert (=> b!602076 (=> res!386570 e!344319)))

(assert (=> b!602076 (= res!386570 (bvsge index!984 j!136))))

(declare-fun lt!274160 () Unit!19054)

(assert (=> b!602076 (= lt!274160 e!344313)))

(declare-fun c!68122 () Bool)

(assert (=> b!602076 (= c!68122 (bvslt j!136 index!984))))

(declare-fun res!386573 () Bool)

(assert (=> start!55008 (=> (not res!386573) (not e!344309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55008 (= res!386573 (validMask!0 mask!3053))))

(assert (=> start!55008 e!344309))

(assert (=> start!55008 true))

(declare-fun array_inv!13635 (array!37162) Bool)

(assert (=> start!55008 (array_inv!13635 a!2986)))

(assert (= (and start!55008 res!386573) b!602081))

(assert (= (and b!602081 res!386568) b!602069))

(assert (= (and b!602069 res!386567) b!602090))

(assert (= (and b!602090 res!386562) b!602077))

(assert (= (and b!602077 res!386572) b!602073))

(assert (= (and b!602073 res!386561) b!602087))

(assert (= (and b!602087 res!386575) b!602083))

(assert (= (and b!602083 res!386565) b!602072))

(assert (= (and b!602072 res!386569) b!602084))

(assert (= (and b!602084 res!386559) b!602085))

(assert (= (and b!602085 res!386560) b!602071))

(assert (= (and b!602071 res!386571) b!602089))

(assert (= (and b!602071 c!68123) b!602086))

(assert (= (and b!602071 (not c!68123)) b!602080))

(assert (= (and b!602071 (not res!386574)) b!602082))

(assert (= (and b!602082 res!386564) b!602074))

(assert (= (and b!602074 (not res!386566)) b!602075))

(assert (= (and b!602075 res!386576) b!602079))

(assert (= (and b!602082 (not res!386563)) b!602076))

(assert (= (and b!602076 c!68122) b!602070))

(assert (= (and b!602076 (not c!68122)) b!602078))

(assert (= (and b!602076 (not res!386570)) b!602088))

(declare-fun m!579221 () Bool)

(assert (=> b!602070 m!579221))

(declare-fun m!579223 () Bool)

(assert (=> b!602070 m!579223))

(declare-fun m!579225 () Bool)

(assert (=> b!602070 m!579225))

(assert (=> b!602070 m!579223))

(declare-fun m!579227 () Bool)

(assert (=> b!602070 m!579227))

(declare-fun m!579229 () Bool)

(assert (=> b!602070 m!579229))

(assert (=> b!602070 m!579223))

(declare-fun m!579231 () Bool)

(assert (=> b!602070 m!579231))

(assert (=> b!602070 m!579223))

(declare-fun m!579233 () Bool)

(assert (=> b!602070 m!579233))

(declare-fun m!579235 () Bool)

(assert (=> b!602070 m!579235))

(declare-fun m!579237 () Bool)

(assert (=> b!602077 m!579237))

(assert (=> b!602082 m!579223))

(declare-fun m!579239 () Bool)

(assert (=> b!602082 m!579239))

(declare-fun m!579241 () Bool)

(assert (=> b!602082 m!579241))

(assert (=> b!602079 m!579223))

(assert (=> b!602079 m!579223))

(declare-fun m!579243 () Bool)

(assert (=> b!602079 m!579243))

(assert (=> b!602069 m!579223))

(assert (=> b!602069 m!579223))

(declare-fun m!579245 () Bool)

(assert (=> b!602069 m!579245))

(assert (=> b!602088 m!579223))

(assert (=> b!602088 m!579223))

(declare-fun m!579247 () Bool)

(assert (=> b!602088 m!579247))

(declare-fun m!579249 () Bool)

(assert (=> b!602073 m!579249))

(declare-fun m!579251 () Bool)

(assert (=> b!602087 m!579251))

(declare-fun m!579253 () Bool)

(assert (=> start!55008 m!579253))

(declare-fun m!579255 () Bool)

(assert (=> start!55008 m!579255))

(declare-fun m!579257 () Bool)

(assert (=> b!602072 m!579257))

(assert (=> b!602084 m!579239))

(declare-fun m!579259 () Bool)

(assert (=> b!602084 m!579259))

(declare-fun m!579261 () Bool)

(assert (=> b!602083 m!579261))

(assert (=> b!602074 m!579223))

(declare-fun m!579263 () Bool)

(assert (=> b!602085 m!579263))

(assert (=> b!602085 m!579223))

(assert (=> b!602085 m!579223))

(declare-fun m!579265 () Bool)

(assert (=> b!602085 m!579265))

(assert (=> b!602075 m!579223))

(assert (=> b!602075 m!579223))

(assert (=> b!602075 m!579247))

(declare-fun m!579267 () Bool)

(assert (=> b!602071 m!579267))

(declare-fun m!579269 () Bool)

(assert (=> b!602071 m!579269))

(declare-fun m!579271 () Bool)

(assert (=> b!602071 m!579271))

(assert (=> b!602071 m!579223))

(assert (=> b!602071 m!579239))

(assert (=> b!602071 m!579223))

(declare-fun m!579273 () Bool)

(assert (=> b!602071 m!579273))

(declare-fun m!579275 () Bool)

(assert (=> b!602071 m!579275))

(declare-fun m!579277 () Bool)

(assert (=> b!602071 m!579277))

(declare-fun m!579279 () Bool)

(assert (=> b!602090 m!579279))

(check-sat (not b!602083) (not b!602088) (not b!602071) (not b!602077) (not b!602075) (not b!602090) (not b!602079) (not start!55008) (not b!602069) (not b!602073) (not b!602087) (not b!602085) (not b!602070))
(check-sat)
