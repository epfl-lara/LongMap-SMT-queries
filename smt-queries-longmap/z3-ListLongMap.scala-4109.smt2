; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56154 () Bool)

(assert start!56154)

(declare-fun b!621057 () Bool)

(declare-fun e!356213 () Bool)

(declare-fun e!356211 () Bool)

(assert (=> b!621057 (= e!356213 e!356211)))

(declare-fun res!400211 () Bool)

(assert (=> b!621057 (=> (not res!400211) (not e!356211))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37624 0))(
  ( (array!37625 (arr!18058 (Array (_ BitVec 32) (_ BitVec 64))) (size!18422 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37624)

(assert (=> b!621057 (= res!400211 (= (select (store (arr!18058 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!287257 () array!37624)

(assert (=> b!621057 (= lt!287257 (array!37625 (store (arr!18058 a!2986) i!1108 k0!1786) (size!18422 a!2986)))))

(declare-fun b!621058 () Bool)

(declare-fun res!400220 () Bool)

(declare-fun e!356218 () Bool)

(assert (=> b!621058 (=> (not res!400220) (not e!356218))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!621058 (= res!400220 (and (= (size!18422 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18422 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18422 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621059 () Bool)

(assert (=> b!621059 false))

(declare-datatypes ((Unit!20708 0))(
  ( (Unit!20709) )
))
(declare-fun lt!287256 () Unit!20708)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((List!12099 0))(
  ( (Nil!12096) (Cons!12095 (h!13140 (_ BitVec 64)) (t!18327 List!12099)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37624 (_ BitVec 64) (_ BitVec 32) List!12099) Unit!20708)

(assert (=> b!621059 (= lt!287256 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287257 (select (arr!18058 a!2986) j!136) index!984 Nil!12096))))

(declare-fun arrayNoDuplicates!0 (array!37624 (_ BitVec 32) List!12099) Bool)

(assert (=> b!621059 (arrayNoDuplicates!0 lt!287257 index!984 Nil!12096)))

(declare-fun lt!287248 () Unit!20708)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37624 (_ BitVec 32) (_ BitVec 32)) Unit!20708)

(assert (=> b!621059 (= lt!287248 (lemmaNoDuplicateFromThenFromBigger!0 lt!287257 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621059 (arrayNoDuplicates!0 lt!287257 #b00000000000000000000000000000000 Nil!12096)))

(declare-fun lt!287241 () Unit!20708)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37624 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12099) Unit!20708)

(assert (=> b!621059 (= lt!287241 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12096))))

(declare-fun arrayContainsKey!0 (array!37624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621059 (arrayContainsKey!0 lt!287257 (select (arr!18058 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287255 () Unit!20708)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37624 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20708)

(assert (=> b!621059 (= lt!287255 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287257 (select (arr!18058 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!356219 () Bool)

(assert (=> b!621059 e!356219))

(declare-fun res!400218 () Bool)

(assert (=> b!621059 (=> (not res!400218) (not e!356219))))

(assert (=> b!621059 (= res!400218 (arrayContainsKey!0 lt!287257 (select (arr!18058 a!2986) j!136) j!136))))

(declare-fun e!356216 () Unit!20708)

(declare-fun Unit!20710 () Unit!20708)

(assert (=> b!621059 (= e!356216 Unit!20710)))

(declare-fun b!621060 () Bool)

(declare-fun e!356220 () Bool)

(assert (=> b!621060 (= e!356220 (not true))))

(declare-fun lt!287238 () Unit!20708)

(declare-fun e!356207 () Unit!20708)

(assert (=> b!621060 (= lt!287238 e!356207)))

(declare-fun c!70791 () Bool)

(declare-datatypes ((SeekEntryResult!6498 0))(
  ( (MissingZero!6498 (index!28276 (_ BitVec 32))) (Found!6498 (index!28277 (_ BitVec 32))) (Intermediate!6498 (undefined!7310 Bool) (index!28278 (_ BitVec 32)) (x!57050 (_ BitVec 32))) (Undefined!6498) (MissingVacant!6498 (index!28279 (_ BitVec 32))) )
))
(declare-fun lt!287247 () SeekEntryResult!6498)

(assert (=> b!621060 (= c!70791 (= lt!287247 (Found!6498 index!984)))))

(declare-fun lt!287239 () Unit!20708)

(declare-fun e!356209 () Unit!20708)

(assert (=> b!621060 (= lt!287239 e!356209)))

(declare-fun c!70792 () Bool)

(assert (=> b!621060 (= c!70792 (= lt!287247 Undefined!6498))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!287253 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37624 (_ BitVec 32)) SeekEntryResult!6498)

(assert (=> b!621060 (= lt!287247 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287253 lt!287257 mask!3053))))

(declare-fun e!356217 () Bool)

(assert (=> b!621060 e!356217))

(declare-fun res!400215 () Bool)

(assert (=> b!621060 (=> (not res!400215) (not e!356217))))

(declare-fun lt!287244 () SeekEntryResult!6498)

(declare-fun lt!287245 () (_ BitVec 32))

(assert (=> b!621060 (= res!400215 (= lt!287244 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287245 vacantSpotIndex!68 lt!287253 lt!287257 mask!3053)))))

(assert (=> b!621060 (= lt!287244 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287245 vacantSpotIndex!68 (select (arr!18058 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621060 (= lt!287253 (select (store (arr!18058 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!287242 () Unit!20708)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37624 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20708)

(assert (=> b!621060 (= lt!287242 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287245 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621060 (= lt!287245 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!621061 () Bool)

(declare-fun res!400212 () Bool)

(assert (=> b!621061 (=> (not res!400212) (not e!356213))))

(assert (=> b!621061 (= res!400212 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18058 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621062 () Bool)

(declare-fun res!400217 () Bool)

(assert (=> b!621062 (=> (not res!400217) (not e!356213))))

(assert (=> b!621062 (= res!400217 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12096))))

(declare-fun b!621063 () Bool)

(declare-fun res!400225 () Bool)

(assert (=> b!621063 (=> (not res!400225) (not e!356218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621063 (= res!400225 (validKeyInArray!0 (select (arr!18058 a!2986) j!136)))))

(declare-fun b!621064 () Bool)

(declare-fun lt!287246 () SeekEntryResult!6498)

(assert (=> b!621064 (= e!356217 (= lt!287246 lt!287244))))

(declare-fun res!400216 () Bool)

(assert (=> start!56154 (=> (not res!400216) (not e!356218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56154 (= res!400216 (validMask!0 mask!3053))))

(assert (=> start!56154 e!356218))

(assert (=> start!56154 true))

(declare-fun array_inv!13854 (array!37624) Bool)

(assert (=> start!56154 (array_inv!13854 a!2986)))

(declare-fun b!621065 () Bool)

(declare-fun Unit!20711 () Unit!20708)

(assert (=> b!621065 (= e!356207 Unit!20711)))

(declare-fun res!400224 () Bool)

(assert (=> b!621065 (= res!400224 (= (select (store (arr!18058 a!2986) i!1108 k0!1786) index!984) (select (arr!18058 a!2986) j!136)))))

(declare-fun e!356215 () Bool)

(assert (=> b!621065 (=> (not res!400224) (not e!356215))))

(assert (=> b!621065 e!356215))

(declare-fun c!70793 () Bool)

(assert (=> b!621065 (= c!70793 (bvslt j!136 index!984))))

(declare-fun lt!287252 () Unit!20708)

(declare-fun e!356212 () Unit!20708)

(assert (=> b!621065 (= lt!287252 e!356212)))

(declare-fun c!70790 () Bool)

(assert (=> b!621065 (= c!70790 (bvslt index!984 j!136))))

(declare-fun lt!287251 () Unit!20708)

(assert (=> b!621065 (= lt!287251 e!356216)))

(assert (=> b!621065 false))

(declare-fun b!621066 () Bool)

(declare-fun res!400214 () Bool)

(assert (=> b!621066 (=> (not res!400214) (not e!356213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37624 (_ BitVec 32)) Bool)

(assert (=> b!621066 (= res!400214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621067 () Bool)

(assert (=> b!621067 false))

(declare-fun lt!287243 () Unit!20708)

(assert (=> b!621067 (= lt!287243 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287257 (select (arr!18058 a!2986) j!136) j!136 Nil!12096))))

(assert (=> b!621067 (arrayNoDuplicates!0 lt!287257 j!136 Nil!12096)))

(declare-fun lt!287254 () Unit!20708)

(assert (=> b!621067 (= lt!287254 (lemmaNoDuplicateFromThenFromBigger!0 lt!287257 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621067 (arrayNoDuplicates!0 lt!287257 #b00000000000000000000000000000000 Nil!12096)))

(declare-fun lt!287249 () Unit!20708)

(assert (=> b!621067 (= lt!287249 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12096))))

(assert (=> b!621067 (arrayContainsKey!0 lt!287257 (select (arr!18058 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287240 () Unit!20708)

(assert (=> b!621067 (= lt!287240 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287257 (select (arr!18058 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20712 () Unit!20708)

(assert (=> b!621067 (= e!356212 Unit!20712)))

(declare-fun b!621068 () Bool)

(declare-fun Unit!20713 () Unit!20708)

(assert (=> b!621068 (= e!356209 Unit!20713)))

(assert (=> b!621068 false))

(declare-fun b!621069 () Bool)

(assert (=> b!621069 (= e!356218 e!356213)))

(declare-fun res!400221 () Bool)

(assert (=> b!621069 (=> (not res!400221) (not e!356213))))

(declare-fun lt!287250 () SeekEntryResult!6498)

(assert (=> b!621069 (= res!400221 (or (= lt!287250 (MissingZero!6498 i!1108)) (= lt!287250 (MissingVacant!6498 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37624 (_ BitVec 32)) SeekEntryResult!6498)

(assert (=> b!621069 (= lt!287250 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!621070 () Bool)

(assert (=> b!621070 (= e!356211 e!356220)))

(declare-fun res!400219 () Bool)

(assert (=> b!621070 (=> (not res!400219) (not e!356220))))

(assert (=> b!621070 (= res!400219 (and (= lt!287246 (Found!6498 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18058 a!2986) index!984) (select (arr!18058 a!2986) j!136))) (not (= (select (arr!18058 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!621070 (= lt!287246 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18058 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621071 () Bool)

(declare-fun Unit!20714 () Unit!20708)

(assert (=> b!621071 (= e!356216 Unit!20714)))

(declare-fun b!621072 () Bool)

(declare-fun res!400222 () Bool)

(assert (=> b!621072 (=> (not res!400222) (not e!356218))))

(assert (=> b!621072 (= res!400222 (validKeyInArray!0 k0!1786))))

(declare-fun e!356214 () Bool)

(declare-fun b!621073 () Bool)

(assert (=> b!621073 (= e!356214 (arrayContainsKey!0 lt!287257 (select (arr!18058 a!2986) j!136) index!984))))

(declare-fun b!621074 () Bool)

(declare-fun res!400213 () Bool)

(assert (=> b!621074 (=> (not res!400213) (not e!356218))))

(assert (=> b!621074 (= res!400213 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621075 () Bool)

(declare-fun Unit!20715 () Unit!20708)

(assert (=> b!621075 (= e!356212 Unit!20715)))

(declare-fun res!400226 () Bool)

(declare-fun b!621076 () Bool)

(assert (=> b!621076 (= res!400226 (arrayContainsKey!0 lt!287257 (select (arr!18058 a!2986) j!136) j!136))))

(assert (=> b!621076 (=> (not res!400226) (not e!356214))))

(declare-fun e!356208 () Bool)

(assert (=> b!621076 (= e!356208 e!356214)))

(declare-fun b!621077 () Bool)

(declare-fun Unit!20716 () Unit!20708)

(assert (=> b!621077 (= e!356207 Unit!20716)))

(declare-fun b!621078 () Bool)

(assert (=> b!621078 (= e!356219 (arrayContainsKey!0 lt!287257 (select (arr!18058 a!2986) j!136) index!984))))

(declare-fun b!621079 () Bool)

(declare-fun res!400223 () Bool)

(assert (=> b!621079 (= res!400223 (bvsge j!136 index!984))))

(assert (=> b!621079 (=> res!400223 e!356208)))

(assert (=> b!621079 (= e!356215 e!356208)))

(declare-fun b!621080 () Bool)

(declare-fun Unit!20717 () Unit!20708)

(assert (=> b!621080 (= e!356209 Unit!20717)))

(assert (= (and start!56154 res!400216) b!621058))

(assert (= (and b!621058 res!400220) b!621063))

(assert (= (and b!621063 res!400225) b!621072))

(assert (= (and b!621072 res!400222) b!621074))

(assert (= (and b!621074 res!400213) b!621069))

(assert (= (and b!621069 res!400221) b!621066))

(assert (= (and b!621066 res!400214) b!621062))

(assert (= (and b!621062 res!400217) b!621061))

(assert (= (and b!621061 res!400212) b!621057))

(assert (= (and b!621057 res!400211) b!621070))

(assert (= (and b!621070 res!400219) b!621060))

(assert (= (and b!621060 res!400215) b!621064))

(assert (= (and b!621060 c!70792) b!621068))

(assert (= (and b!621060 (not c!70792)) b!621080))

(assert (= (and b!621060 c!70791) b!621065))

(assert (= (and b!621060 (not c!70791)) b!621077))

(assert (= (and b!621065 res!400224) b!621079))

(assert (= (and b!621079 (not res!400223)) b!621076))

(assert (= (and b!621076 res!400226) b!621073))

(assert (= (and b!621065 c!70793) b!621067))

(assert (= (and b!621065 (not c!70793)) b!621075))

(assert (= (and b!621065 c!70790) b!621059))

(assert (= (and b!621065 (not c!70790)) b!621071))

(assert (= (and b!621059 res!400218) b!621078))

(declare-fun m!596961 () Bool)

(assert (=> b!621078 m!596961))

(assert (=> b!621078 m!596961))

(declare-fun m!596963 () Bool)

(assert (=> b!621078 m!596963))

(declare-fun m!596965 () Bool)

(assert (=> b!621065 m!596965))

(declare-fun m!596967 () Bool)

(assert (=> b!621065 m!596967))

(assert (=> b!621065 m!596961))

(assert (=> b!621057 m!596965))

(declare-fun m!596969 () Bool)

(assert (=> b!621057 m!596969))

(declare-fun m!596971 () Bool)

(assert (=> b!621062 m!596971))

(assert (=> b!621063 m!596961))

(assert (=> b!621063 m!596961))

(declare-fun m!596973 () Bool)

(assert (=> b!621063 m!596973))

(declare-fun m!596975 () Bool)

(assert (=> b!621060 m!596975))

(declare-fun m!596977 () Bool)

(assert (=> b!621060 m!596977))

(assert (=> b!621060 m!596961))

(assert (=> b!621060 m!596961))

(declare-fun m!596979 () Bool)

(assert (=> b!621060 m!596979))

(assert (=> b!621060 m!596965))

(declare-fun m!596981 () Bool)

(assert (=> b!621060 m!596981))

(declare-fun m!596983 () Bool)

(assert (=> b!621060 m!596983))

(declare-fun m!596985 () Bool)

(assert (=> b!621060 m!596985))

(declare-fun m!596987 () Bool)

(assert (=> b!621069 m!596987))

(declare-fun m!596989 () Bool)

(assert (=> b!621066 m!596989))

(declare-fun m!596991 () Bool)

(assert (=> b!621072 m!596991))

(declare-fun m!596993 () Bool)

(assert (=> b!621070 m!596993))

(assert (=> b!621070 m!596961))

(assert (=> b!621070 m!596961))

(declare-fun m!596995 () Bool)

(assert (=> b!621070 m!596995))

(declare-fun m!596997 () Bool)

(assert (=> b!621074 m!596997))

(declare-fun m!596999 () Bool)

(assert (=> start!56154 m!596999))

(declare-fun m!597001 () Bool)

(assert (=> start!56154 m!597001))

(assert (=> b!621076 m!596961))

(assert (=> b!621076 m!596961))

(declare-fun m!597003 () Bool)

(assert (=> b!621076 m!597003))

(declare-fun m!597005 () Bool)

(assert (=> b!621061 m!597005))

(assert (=> b!621073 m!596961))

(assert (=> b!621073 m!596961))

(assert (=> b!621073 m!596963))

(assert (=> b!621059 m!596961))

(assert (=> b!621059 m!597003))

(declare-fun m!597007 () Bool)

(assert (=> b!621059 m!597007))

(assert (=> b!621059 m!596961))

(assert (=> b!621059 m!596961))

(declare-fun m!597009 () Bool)

(assert (=> b!621059 m!597009))

(assert (=> b!621059 m!596961))

(declare-fun m!597011 () Bool)

(assert (=> b!621059 m!597011))

(declare-fun m!597013 () Bool)

(assert (=> b!621059 m!597013))

(assert (=> b!621059 m!596961))

(declare-fun m!597015 () Bool)

(assert (=> b!621059 m!597015))

(declare-fun m!597017 () Bool)

(assert (=> b!621059 m!597017))

(declare-fun m!597019 () Bool)

(assert (=> b!621059 m!597019))

(assert (=> b!621067 m!596961))

(declare-fun m!597021 () Bool)

(assert (=> b!621067 m!597021))

(assert (=> b!621067 m!596961))

(declare-fun m!597023 () Bool)

(assert (=> b!621067 m!597023))

(assert (=> b!621067 m!596961))

(declare-fun m!597025 () Bool)

(assert (=> b!621067 m!597025))

(declare-fun m!597027 () Bool)

(assert (=> b!621067 m!597027))

(assert (=> b!621067 m!597013))

(assert (=> b!621067 m!596961))

(declare-fun m!597029 () Bool)

(assert (=> b!621067 m!597029))

(assert (=> b!621067 m!597019))

(check-sat (not b!621059) (not start!56154) (not b!621073) (not b!621076) (not b!621060) (not b!621069) (not b!621062) (not b!621072) (not b!621078) (not b!621067) (not b!621074) (not b!621070) (not b!621063) (not b!621066))
(check-sat)
