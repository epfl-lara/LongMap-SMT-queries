; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55006 () Bool)

(assert start!55006)

(declare-fun b!602003 () Bool)

(declare-fun res!386507 () Bool)

(declare-fun e!344268 () Bool)

(assert (=> b!602003 (=> (not res!386507) (not e!344268))))

(declare-datatypes ((array!37160 0))(
  ( (array!37161 (arr!17838 (Array (_ BitVec 32) (_ BitVec 64))) (size!18202 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37160)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602003 (= res!386507 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!602004 () Bool)

(declare-fun res!386515 () Bool)

(declare-fun e!344264 () Bool)

(assert (=> b!602004 (=> (not res!386515) (not e!344264))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37160 (_ BitVec 32)) Bool)

(assert (=> b!602004 (= res!386515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!602005 () Bool)

(declare-fun res!386521 () Bool)

(assert (=> b!602005 (=> (not res!386521) (not e!344264))))

(declare-datatypes ((List!11879 0))(
  ( (Nil!11876) (Cons!11875 (h!12920 (_ BitVec 64)) (t!18107 List!11879)) )
))
(declare-fun arrayNoDuplicates!0 (array!37160 (_ BitVec 32) List!11879) Bool)

(assert (=> b!602005 (= res!386521 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11876))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!344275 () Bool)

(declare-fun b!602006 () Bool)

(declare-fun lt!274113 () array!37160)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!602006 (= e!344275 (arrayContainsKey!0 lt!274113 (select (arr!17838 a!2986) j!136) index!984))))

(declare-fun b!602007 () Bool)

(declare-datatypes ((Unit!19048 0))(
  ( (Unit!19049) )
))
(declare-fun e!344270 () Unit!19048)

(declare-fun Unit!19050 () Unit!19048)

(assert (=> b!602007 (= e!344270 Unit!19050)))

(assert (=> b!602007 false))

(declare-fun b!602008 () Bool)

(declare-fun e!344273 () Bool)

(assert (=> b!602008 (= e!344273 e!344275)))

(declare-fun res!386508 () Bool)

(assert (=> b!602008 (=> (not res!386508) (not e!344275))))

(assert (=> b!602008 (= res!386508 (arrayContainsKey!0 lt!274113 (select (arr!17838 a!2986) j!136) j!136))))

(declare-fun b!602009 () Bool)

(declare-fun e!344269 () Bool)

(declare-fun e!344265 () Bool)

(assert (=> b!602009 (= e!344269 (not e!344265))))

(declare-fun res!386511 () Bool)

(assert (=> b!602009 (=> res!386511 e!344265)))

(declare-datatypes ((SeekEntryResult!6278 0))(
  ( (MissingZero!6278 (index!27372 (_ BitVec 32))) (Found!6278 (index!27373 (_ BitVec 32))) (Intermediate!6278 (undefined!7090 Bool) (index!27374 (_ BitVec 32)) (x!56174 (_ BitVec 32))) (Undefined!6278) (MissingVacant!6278 (index!27375 (_ BitVec 32))) )
))
(declare-fun lt!274118 () SeekEntryResult!6278)

(assert (=> b!602009 (= res!386511 (not (= lt!274118 (Found!6278 index!984))))))

(declare-fun lt!274121 () Unit!19048)

(assert (=> b!602009 (= lt!274121 e!344270)))

(declare-fun c!68116 () Bool)

(assert (=> b!602009 (= c!68116 (= lt!274118 Undefined!6278))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!274115 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37160 (_ BitVec 32)) SeekEntryResult!6278)

(assert (=> b!602009 (= lt!274118 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274115 lt!274113 mask!3053))))

(declare-fun e!344272 () Bool)

(assert (=> b!602009 e!344272))

(declare-fun res!386522 () Bool)

(assert (=> b!602009 (=> (not res!386522) (not e!344272))))

(declare-fun lt!274112 () SeekEntryResult!6278)

(declare-fun lt!274117 () (_ BitVec 32))

(assert (=> b!602009 (= res!386522 (= lt!274112 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274117 vacantSpotIndex!68 lt!274115 lt!274113 mask!3053)))))

(assert (=> b!602009 (= lt!274112 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274117 vacantSpotIndex!68 (select (arr!17838 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!602009 (= lt!274115 (select (store (arr!17838 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!274116 () Unit!19048)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37160 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19048)

(assert (=> b!602009 (= lt!274116 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274117 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!602009 (= lt!274117 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!602010 () Bool)

(declare-fun e!344267 () Bool)

(declare-fun e!344271 () Bool)

(assert (=> b!602010 (= e!344267 e!344271)))

(declare-fun res!386509 () Bool)

(assert (=> b!602010 (=> res!386509 e!344271)))

(assert (=> b!602010 (= res!386509 (bvsge index!984 j!136))))

(declare-fun lt!274109 () Unit!19048)

(declare-fun e!344274 () Unit!19048)

(assert (=> b!602010 (= lt!274109 e!344274)))

(declare-fun c!68117 () Bool)

(assert (=> b!602010 (= c!68117 (bvslt j!136 index!984))))

(declare-fun b!602011 () Bool)

(declare-fun lt!274120 () SeekEntryResult!6278)

(assert (=> b!602011 (= e!344272 (= lt!274120 lt!274112))))

(declare-fun b!602012 () Bool)

(assert (=> b!602012 (= e!344271 true)))

(assert (=> b!602012 (arrayContainsKey!0 lt!274113 (select (arr!17838 a!2986) j!136) j!136)))

(declare-fun b!602014 () Bool)

(declare-fun res!386518 () Bool)

(assert (=> b!602014 (=> (not res!386518) (not e!344268))))

(assert (=> b!602014 (= res!386518 (and (= (size!18202 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18202 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18202 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!602015 () Bool)

(declare-fun res!386520 () Bool)

(assert (=> b!602015 (=> (not res!386520) (not e!344268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!602015 (= res!386520 (validKeyInArray!0 k!1786))))

(declare-fun b!602016 () Bool)

(declare-fun Unit!19051 () Unit!19048)

(assert (=> b!602016 (= e!344274 Unit!19051)))

(declare-fun b!602017 () Bool)

(declare-fun Unit!19052 () Unit!19048)

(assert (=> b!602017 (= e!344270 Unit!19052)))

(declare-fun b!602018 () Bool)

(declare-fun Unit!19053 () Unit!19048)

(assert (=> b!602018 (= e!344274 Unit!19053)))

(declare-fun lt!274122 () Unit!19048)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37160 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19048)

(assert (=> b!602018 (= lt!274122 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274113 (select (arr!17838 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!602018 (arrayContainsKey!0 lt!274113 (select (arr!17838 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274123 () Unit!19048)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37160 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11879) Unit!19048)

(assert (=> b!602018 (= lt!274123 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11876))))

(assert (=> b!602018 (arrayNoDuplicates!0 lt!274113 #b00000000000000000000000000000000 Nil!11876)))

(declare-fun lt!274119 () Unit!19048)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37160 (_ BitVec 32) (_ BitVec 32)) Unit!19048)

(assert (=> b!602018 (= lt!274119 (lemmaNoDuplicateFromThenFromBigger!0 lt!274113 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602018 (arrayNoDuplicates!0 lt!274113 j!136 Nil!11876)))

(declare-fun lt!274111 () Unit!19048)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37160 (_ BitVec 64) (_ BitVec 32) List!11879) Unit!19048)

(assert (=> b!602018 (= lt!274111 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274113 (select (arr!17838 a!2986) j!136) j!136 Nil!11876))))

(assert (=> b!602018 false))

(declare-fun b!602019 () Bool)

(assert (=> b!602019 (= e!344268 e!344264)))

(declare-fun res!386506 () Bool)

(assert (=> b!602019 (=> (not res!386506) (not e!344264))))

(declare-fun lt!274110 () SeekEntryResult!6278)

(assert (=> b!602019 (= res!386506 (or (= lt!274110 (MissingZero!6278 i!1108)) (= lt!274110 (MissingVacant!6278 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37160 (_ BitVec 32)) SeekEntryResult!6278)

(assert (=> b!602019 (= lt!274110 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!602013 () Bool)

(declare-fun res!386513 () Bool)

(assert (=> b!602013 (=> (not res!386513) (not e!344264))))

(assert (=> b!602013 (= res!386513 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17838 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!386510 () Bool)

(assert (=> start!55006 (=> (not res!386510) (not e!344268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55006 (= res!386510 (validMask!0 mask!3053))))

(assert (=> start!55006 e!344268))

(assert (=> start!55006 true))

(declare-fun array_inv!13634 (array!37160) Bool)

(assert (=> start!55006 (array_inv!13634 a!2986)))

(declare-fun b!602020 () Bool)

(declare-fun e!344277 () Bool)

(assert (=> b!602020 (= e!344277 e!344269)))

(declare-fun res!386514 () Bool)

(assert (=> b!602020 (=> (not res!386514) (not e!344269))))

(assert (=> b!602020 (= res!386514 (and (= lt!274120 (Found!6278 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17838 a!2986) index!984) (select (arr!17838 a!2986) j!136))) (not (= (select (arr!17838 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!602020 (= lt!274120 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17838 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602021 () Bool)

(declare-fun res!386519 () Bool)

(assert (=> b!602021 (=> (not res!386519) (not e!344268))))

(assert (=> b!602021 (= res!386519 (validKeyInArray!0 (select (arr!17838 a!2986) j!136)))))

(declare-fun b!602022 () Bool)

(assert (=> b!602022 (= e!344265 e!344267)))

(declare-fun res!386505 () Bool)

(assert (=> b!602022 (=> res!386505 e!344267)))

(declare-fun lt!274114 () (_ BitVec 64))

(assert (=> b!602022 (= res!386505 (or (not (= (select (arr!17838 a!2986) j!136) lt!274115)) (not (= (select (arr!17838 a!2986) j!136) lt!274114))))))

(declare-fun e!344266 () Bool)

(assert (=> b!602022 e!344266))

(declare-fun res!386517 () Bool)

(assert (=> b!602022 (=> (not res!386517) (not e!344266))))

(assert (=> b!602022 (= res!386517 (= lt!274114 (select (arr!17838 a!2986) j!136)))))

(assert (=> b!602022 (= lt!274114 (select (store (arr!17838 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!602023 () Bool)

(assert (=> b!602023 (= e!344264 e!344277)))

(declare-fun res!386516 () Bool)

(assert (=> b!602023 (=> (not res!386516) (not e!344277))))

(assert (=> b!602023 (= res!386516 (= (select (store (arr!17838 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602023 (= lt!274113 (array!37161 (store (arr!17838 a!2986) i!1108 k!1786) (size!18202 a!2986)))))

(declare-fun b!602024 () Bool)

(assert (=> b!602024 (= e!344266 e!344273)))

(declare-fun res!386512 () Bool)

(assert (=> b!602024 (=> res!386512 e!344273)))

(assert (=> b!602024 (= res!386512 (or (not (= (select (arr!17838 a!2986) j!136) lt!274115)) (not (= (select (arr!17838 a!2986) j!136) lt!274114)) (bvsge j!136 index!984)))))

(assert (= (and start!55006 res!386510) b!602014))

(assert (= (and b!602014 res!386518) b!602021))

(assert (= (and b!602021 res!386519) b!602015))

(assert (= (and b!602015 res!386520) b!602003))

(assert (= (and b!602003 res!386507) b!602019))

(assert (= (and b!602019 res!386506) b!602004))

(assert (= (and b!602004 res!386515) b!602005))

(assert (= (and b!602005 res!386521) b!602013))

(assert (= (and b!602013 res!386513) b!602023))

(assert (= (and b!602023 res!386516) b!602020))

(assert (= (and b!602020 res!386514) b!602009))

(assert (= (and b!602009 res!386522) b!602011))

(assert (= (and b!602009 c!68116) b!602007))

(assert (= (and b!602009 (not c!68116)) b!602017))

(assert (= (and b!602009 (not res!386511)) b!602022))

(assert (= (and b!602022 res!386517) b!602024))

(assert (= (and b!602024 (not res!386512)) b!602008))

(assert (= (and b!602008 res!386508) b!602006))

(assert (= (and b!602022 (not res!386505)) b!602010))

(assert (= (and b!602010 c!68117) b!602018))

(assert (= (and b!602010 (not c!68117)) b!602016))

(assert (= (and b!602010 (not res!386509)) b!602012))

(declare-fun m!579161 () Bool)

(assert (=> b!602023 m!579161))

(declare-fun m!579163 () Bool)

(assert (=> b!602023 m!579163))

(declare-fun m!579165 () Bool)

(assert (=> b!602008 m!579165))

(assert (=> b!602008 m!579165))

(declare-fun m!579167 () Bool)

(assert (=> b!602008 m!579167))

(assert (=> b!602022 m!579165))

(assert (=> b!602022 m!579161))

(declare-fun m!579169 () Bool)

(assert (=> b!602022 m!579169))

(declare-fun m!579171 () Bool)

(assert (=> b!602019 m!579171))

(declare-fun m!579173 () Bool)

(assert (=> b!602020 m!579173))

(assert (=> b!602020 m!579165))

(assert (=> b!602020 m!579165))

(declare-fun m!579175 () Bool)

(assert (=> b!602020 m!579175))

(assert (=> b!602006 m!579165))

(assert (=> b!602006 m!579165))

(declare-fun m!579177 () Bool)

(assert (=> b!602006 m!579177))

(declare-fun m!579179 () Bool)

(assert (=> b!602004 m!579179))

(declare-fun m!579181 () Bool)

(assert (=> b!602003 m!579181))

(declare-fun m!579183 () Bool)

(assert (=> start!55006 m!579183))

(declare-fun m!579185 () Bool)

(assert (=> start!55006 m!579185))

(declare-fun m!579187 () Bool)

(assert (=> b!602009 m!579187))

(declare-fun m!579189 () Bool)

(assert (=> b!602009 m!579189))

(assert (=> b!602009 m!579165))

(assert (=> b!602009 m!579165))

(declare-fun m!579191 () Bool)

(assert (=> b!602009 m!579191))

(assert (=> b!602009 m!579161))

(declare-fun m!579193 () Bool)

(assert (=> b!602009 m!579193))

(declare-fun m!579195 () Bool)

(assert (=> b!602009 m!579195))

(declare-fun m!579197 () Bool)

(assert (=> b!602009 m!579197))

(declare-fun m!579199 () Bool)

(assert (=> b!602005 m!579199))

(declare-fun m!579201 () Bool)

(assert (=> b!602015 m!579201))

(assert (=> b!602024 m!579165))

(declare-fun m!579203 () Bool)

(assert (=> b!602013 m!579203))

(assert (=> b!602021 m!579165))

(assert (=> b!602021 m!579165))

(declare-fun m!579205 () Bool)

(assert (=> b!602021 m!579205))

(declare-fun m!579207 () Bool)

(assert (=> b!602018 m!579207))

(assert (=> b!602018 m!579165))

(declare-fun m!579209 () Bool)

(assert (=> b!602018 m!579209))

(assert (=> b!602018 m!579165))

(declare-fun m!579211 () Bool)

(assert (=> b!602018 m!579211))

(assert (=> b!602018 m!579165))

(declare-fun m!579213 () Bool)

(assert (=> b!602018 m!579213))

(assert (=> b!602018 m!579165))

(declare-fun m!579215 () Bool)

(assert (=> b!602018 m!579215))

(declare-fun m!579217 () Bool)

(assert (=> b!602018 m!579217))

(declare-fun m!579219 () Bool)

(assert (=> b!602018 m!579219))

(assert (=> b!602012 m!579165))

(assert (=> b!602012 m!579165))

(assert (=> b!602012 m!579167))

(push 1)

