; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128190 () Bool)

(assert start!128190)

(declare-fun b!1505142 () Bool)

(declare-fun res!1025733 () Bool)

(declare-fun e!841255 () Bool)

(assert (=> b!1505142 (=> (not res!1025733) (not e!841255))))

(declare-datatypes ((array!100388 0))(
  ( (array!100389 (arr!48446 (Array (_ BitVec 32) (_ BitVec 64))) (size!48996 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100388)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100388 (_ BitVec 32)) Bool)

(assert (=> b!1505142 (= res!1025733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun e!841254 () Bool)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653910 () (_ BitVec 64))

(declare-fun lt!653907 () array!100388)

(declare-datatypes ((SeekEntryResult!12644 0))(
  ( (MissingZero!12644 (index!52968 (_ BitVec 32))) (Found!12644 (index!52969 (_ BitVec 32))) (Intermediate!12644 (undefined!13456 Bool) (index!52970 (_ BitVec 32)) (x!134654 (_ BitVec 32))) (Undefined!12644) (MissingVacant!12644 (index!52971 (_ BitVec 32))) )
))
(declare-fun lt!653909 () SeekEntryResult!12644)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun b!1505143 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100388 (_ BitVec 32)) SeekEntryResult!12644)

(assert (=> b!1505143 (= e!841254 (not (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 lt!653910 lt!653907 mask!2661) lt!653909)))))

(declare-fun lt!653908 () (_ BitVec 32))

(assert (=> b!1505143 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653908 vacantAfter!10 lt!653910 lt!653907 mask!2661) lt!653909)))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1505143 (= lt!653910 (select (store (arr!48446 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87))))

(declare-datatypes ((Unit!50294 0))(
  ( (Unit!50295) )
))
(declare-fun lt!653911 () Unit!50294)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50294)

(assert (=> b!1505143 (= lt!653911 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653908 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1505144 () Bool)

(declare-fun res!1025737 () Bool)

(assert (=> b!1505144 (=> (not res!1025737) (not e!841255))))

(declare-datatypes ((List!34938 0))(
  ( (Nil!34935) (Cons!34934 (h!36331 (_ BitVec 64)) (t!49632 List!34938)) )
))
(declare-fun arrayNoDuplicates!0 (array!100388 (_ BitVec 32) List!34938) Bool)

(assert (=> b!1505144 (= res!1025737 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34935))))

(declare-fun b!1505145 () Bool)

(declare-fun e!841251 () Bool)

(assert (=> b!1505145 (= e!841255 e!841251)))

(declare-fun res!1025742 () Bool)

(assert (=> b!1505145 (=> (not res!1025742) (not e!841251))))

(assert (=> b!1505145 (= res!1025742 (and (= (select (store (arr!48446 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48996 a!2850))))))

(assert (=> b!1505145 (= lt!653907 (array!100389 (store (arr!48446 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48996 a!2850)))))

(declare-fun b!1505146 () Bool)

(declare-fun e!841253 () Bool)

(assert (=> b!1505146 (= e!841253 e!841254)))

(declare-fun res!1025732 () Bool)

(assert (=> b!1505146 (=> (not res!1025732) (not e!841254))))

(assert (=> b!1505146 (= res!1025732 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653908 #b00000000000000000000000000000000) (bvslt lt!653908 (size!48996 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505146 (= lt!653908 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1505147 () Bool)

(declare-fun res!1025740 () Bool)

(assert (=> b!1505147 (=> (not res!1025740) (not e!841253))))

(assert (=> b!1505147 (= res!1025740 (not (= (select (arr!48446 a!2850) index!625) (select (arr!48446 a!2850) j!87))))))

(declare-fun res!1025734 () Bool)

(assert (=> start!128190 (=> (not res!1025734) (not e!841255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128190 (= res!1025734 (validMask!0 mask!2661))))

(assert (=> start!128190 e!841255))

(assert (=> start!128190 true))

(declare-fun array_inv!37474 (array!100388) Bool)

(assert (=> start!128190 (array_inv!37474 a!2850)))

(declare-fun b!1505148 () Bool)

(declare-fun res!1025741 () Bool)

(assert (=> b!1505148 (=> (not res!1025741) (not e!841255))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505148 (= res!1025741 (validKeyInArray!0 (select (arr!48446 a!2850) i!996)))))

(declare-fun b!1505149 () Bool)

(declare-fun res!1025736 () Bool)

(assert (=> b!1505149 (=> (not res!1025736) (not e!841254))))

(assert (=> b!1505149 (= res!1025736 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653908 vacantBefore!10 (select (arr!48446 a!2850) j!87) a!2850 mask!2661) lt!653909))))

(declare-fun b!1505150 () Bool)

(declare-fun res!1025739 () Bool)

(assert (=> b!1505150 (=> (not res!1025739) (not e!841255))))

(assert (=> b!1505150 (= res!1025739 (validKeyInArray!0 (select (arr!48446 a!2850) j!87)))))

(declare-fun b!1505151 () Bool)

(declare-fun res!1025743 () Bool)

(assert (=> b!1505151 (=> (not res!1025743) (not e!841255))))

(assert (=> b!1505151 (= res!1025743 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48996 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48996 a!2850)) (= (select (arr!48446 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1505152 () Bool)

(assert (=> b!1505152 (= e!841251 e!841253)))

(declare-fun res!1025735 () Bool)

(assert (=> b!1505152 (=> (not res!1025735) (not e!841253))))

(assert (=> b!1505152 (= res!1025735 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48446 a!2850) j!87) a!2850 mask!2661) lt!653909))))

(assert (=> b!1505152 (= lt!653909 (Found!12644 j!87))))

(declare-fun b!1505153 () Bool)

(declare-fun res!1025738 () Bool)

(assert (=> b!1505153 (=> (not res!1025738) (not e!841255))))

(assert (=> b!1505153 (= res!1025738 (and (= (size!48996 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48996 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48996 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!128190 res!1025734) b!1505153))

(assert (= (and b!1505153 res!1025738) b!1505148))

(assert (= (and b!1505148 res!1025741) b!1505150))

(assert (= (and b!1505150 res!1025739) b!1505142))

(assert (= (and b!1505142 res!1025733) b!1505144))

(assert (= (and b!1505144 res!1025737) b!1505151))

(assert (= (and b!1505151 res!1025743) b!1505145))

(assert (= (and b!1505145 res!1025742) b!1505152))

(assert (= (and b!1505152 res!1025735) b!1505147))

(assert (= (and b!1505147 res!1025740) b!1505146))

(assert (= (and b!1505146 res!1025732) b!1505149))

(assert (= (and b!1505149 res!1025736) b!1505143))

(declare-fun m!1388257 () Bool)

(assert (=> b!1505149 m!1388257))

(assert (=> b!1505149 m!1388257))

(declare-fun m!1388259 () Bool)

(assert (=> b!1505149 m!1388259))

(declare-fun m!1388261 () Bool)

(assert (=> start!128190 m!1388261))

(declare-fun m!1388263 () Bool)

(assert (=> start!128190 m!1388263))

(declare-fun m!1388265 () Bool)

(assert (=> b!1505148 m!1388265))

(assert (=> b!1505148 m!1388265))

(declare-fun m!1388267 () Bool)

(assert (=> b!1505148 m!1388267))

(assert (=> b!1505150 m!1388257))

(assert (=> b!1505150 m!1388257))

(declare-fun m!1388269 () Bool)

(assert (=> b!1505150 m!1388269))

(declare-fun m!1388271 () Bool)

(assert (=> b!1505151 m!1388271))

(declare-fun m!1388273 () Bool)

(assert (=> b!1505145 m!1388273))

(declare-fun m!1388275 () Bool)

(assert (=> b!1505145 m!1388275))

(declare-fun m!1388277 () Bool)

(assert (=> b!1505147 m!1388277))

(assert (=> b!1505147 m!1388257))

(assert (=> b!1505152 m!1388257))

(assert (=> b!1505152 m!1388257))

(declare-fun m!1388279 () Bool)

(assert (=> b!1505152 m!1388279))

(declare-fun m!1388281 () Bool)

(assert (=> b!1505142 m!1388281))

(declare-fun m!1388283 () Bool)

(assert (=> b!1505143 m!1388283))

(declare-fun m!1388285 () Bool)

(assert (=> b!1505143 m!1388285))

(assert (=> b!1505143 m!1388273))

(declare-fun m!1388287 () Bool)

(assert (=> b!1505143 m!1388287))

(declare-fun m!1388289 () Bool)

(assert (=> b!1505143 m!1388289))

(declare-fun m!1388291 () Bool)

(assert (=> b!1505144 m!1388291))

(declare-fun m!1388293 () Bool)

(assert (=> b!1505146 m!1388293))

(push 1)

(assert (not b!1505142))

(assert (not b!1505149))

(assert (not b!1505146))

(assert (not b!1505150))

(assert (not start!128190))

(assert (not b!1505148))

(assert (not b!1505152))

(assert (not b!1505143))

(assert (not b!1505144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!157953 () Bool)

(declare-fun lt!653944 () (_ BitVec 32))

(assert (=> d!157953 (and (bvsge lt!653944 #b00000000000000000000000000000000) (bvslt lt!653944 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157953 (= lt!653944 (choose!52 index!625 x!647 mask!2661))))

(assert (=> d!157953 (validMask!0 mask!2661)))

(assert (=> d!157953 (= (nextIndex!0 index!625 x!647 mask!2661) lt!653944)))

(declare-fun bs!43219 () Bool)

(assert (= bs!43219 d!157953))

(declare-fun m!1388371 () Bool)

(assert (=> bs!43219 m!1388371))

(assert (=> bs!43219 m!1388261))

(assert (=> b!1505146 d!157953))

(declare-fun b!1505238 () Bool)

(declare-fun e!841294 () SeekEntryResult!12644)

(assert (=> b!1505238 (= e!841294 (MissingVacant!12644 vacantBefore!10))))

(declare-fun lt!653949 () SeekEntryResult!12644)

(declare-fun d!157955 () Bool)

(assert (=> d!157955 (and (or (is-Undefined!12644 lt!653949) (not (is-Found!12644 lt!653949)) (and (bvsge (index!52969 lt!653949) #b00000000000000000000000000000000) (bvslt (index!52969 lt!653949) (size!48996 a!2850)))) (or (is-Undefined!12644 lt!653949) (is-Found!12644 lt!653949) (not (is-MissingVacant!12644 lt!653949)) (not (= (index!52971 lt!653949) vacantBefore!10)) (and (bvsge (index!52971 lt!653949) #b00000000000000000000000000000000) (bvslt (index!52971 lt!653949) (size!48996 a!2850)))) (or (is-Undefined!12644 lt!653949) (ite (is-Found!12644 lt!653949) (= (select (arr!48446 a!2850) (index!52969 lt!653949)) (select (arr!48446 a!2850) j!87)) (and (is-MissingVacant!12644 lt!653949) (= (index!52971 lt!653949) vacantBefore!10) (= (select (arr!48446 a!2850) (index!52971 lt!653949)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!841293 () SeekEntryResult!12644)

(assert (=> d!157955 (= lt!653949 e!841293)))

(declare-fun c!139245 () Bool)

(assert (=> d!157955 (= c!139245 (bvsge x!647 #b01111111111111111111111111111110))))

(declare-fun lt!653950 () (_ BitVec 64))

(assert (=> d!157955 (= lt!653950 (select (arr!48446 a!2850) index!625))))

(assert (=> d!157955 (validMask!0 mask!2661)))

(assert (=> d!157955 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48446 a!2850) j!87) a!2850 mask!2661) lt!653949)))

(declare-fun b!1505239 () Bool)

(declare-fun e!841292 () SeekEntryResult!12644)

(assert (=> b!1505239 (= e!841293 e!841292)))

(declare-fun c!139247 () Bool)

(assert (=> b!1505239 (= c!139247 (= lt!653950 (select (arr!48446 a!2850) j!87)))))

(declare-fun b!1505240 () Bool)

(assert (=> b!1505240 (= e!841294 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48446 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1505241 () Bool)

(declare-fun c!139246 () Bool)

(assert (=> b!1505241 (= c!139246 (= lt!653950 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1505241 (= e!841292 e!841294)))

(declare-fun b!1505242 () Bool)

(assert (=> b!1505242 (= e!841292 (Found!12644 index!625))))

(declare-fun b!1505243 () Bool)

(assert (=> b!1505243 (= e!841293 Undefined!12644)))

(assert (= (and d!157955 c!139245) b!1505243))

(assert (= (and d!157955 (not c!139245)) b!1505239))

(assert (= (and b!1505239 c!139247) b!1505242))

(assert (= (and b!1505239 (not c!139247)) b!1505241))

(assert (= (and b!1505241 c!139246) b!1505238))

(assert (= (and b!1505241 (not c!139246)) b!1505240))

(declare-fun m!1388373 () Bool)

(assert (=> d!157955 m!1388373))

(declare-fun m!1388375 () Bool)

(assert (=> d!157955 m!1388375))

(assert (=> d!157955 m!1388277))

(assert (=> d!157955 m!1388261))

(assert (=> b!1505240 m!1388293))

(assert (=> b!1505240 m!1388293))

(assert (=> b!1505240 m!1388257))

(declare-fun m!1388377 () Bool)

(assert (=> b!1505240 m!1388377))

(assert (=> b!1505152 d!157955))

(declare-fun d!157957 () Bool)

(assert (=> d!157957 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128190 d!157957))

(declare-fun d!157959 () Bool)

(assert (=> d!157959 (= (array_inv!37474 a!2850) (bvsge (size!48996 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128190 d!157959))

(declare-fun bm!68157 () Bool)

(declare-fun call!68160 () Bool)

(assert (=> bm!68157 (= call!68160 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1505252 () Bool)

(declare-fun e!841302 () Bool)

(declare-fun e!841301 () Bool)

(assert (=> b!1505252 (= e!841302 e!841301)))

(declare-fun lt!653957 () (_ BitVec 64))

(assert (=> b!1505252 (= lt!653957 (select (arr!48446 a!2850) #b00000000000000000000000000000000))))

(declare-fun lt!653959 () Unit!50294)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100388 (_ BitVec 64) (_ BitVec 32)) Unit!50294)

(assert (=> b!1505252 (= lt!653959 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653957 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1505252 (arrayContainsKey!0 a!2850 lt!653957 #b00000000000000000000000000000000)))

(declare-fun lt!653958 () Unit!50294)

(assert (=> b!1505252 (= lt!653958 lt!653959)))

(declare-fun res!1025821 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100388 (_ BitVec 32)) SeekEntryResult!12644)

(assert (=> b!1505252 (= res!1025821 (= (seekEntryOrOpen!0 (select (arr!48446 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12644 #b00000000000000000000000000000000)))))

(assert (=> b!1505252 (=> (not res!1025821) (not e!841301))))

(declare-fun b!1505253 () Bool)

(assert (=> b!1505253 (= e!841302 call!68160)))

(declare-fun d!157961 () Bool)

(declare-fun res!1025820 () Bool)

(declare-fun e!841303 () Bool)

(assert (=> d!157961 (=> res!1025820 e!841303)))

(assert (=> d!157961 (= res!1025820 (bvsge #b00000000000000000000000000000000 (size!48996 a!2850)))))

(assert (=> d!157961 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!841303)))

(declare-fun b!1505254 () Bool)

(assert (=> b!1505254 (= e!841303 e!841302)))

(declare-fun c!139250 () Bool)

(assert (=> b!1505254 (= c!139250 (validKeyInArray!0 (select (arr!48446 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1505255 () Bool)

(assert (=> b!1505255 (= e!841301 call!68160)))

(assert (= (and d!157961 (not res!1025820)) b!1505254))

(assert (= (and b!1505254 c!139250) b!1505252))

(assert (= (and b!1505254 (not c!139250)) b!1505253))

(assert (= (and b!1505252 res!1025821) b!1505255))

(assert (= (or b!1505255 b!1505253) bm!68157))

(declare-fun m!1388379 () Bool)

(assert (=> bm!68157 m!1388379))

(declare-fun m!1388381 () Bool)

(assert (=> b!1505252 m!1388381))

(declare-fun m!1388383 () Bool)

(assert (=> b!1505252 m!1388383))

(declare-fun m!1388385 () Bool)

(assert (=> b!1505252 m!1388385))

(assert (=> b!1505252 m!1388381))

(declare-fun m!1388387 () Bool)

(assert (=> b!1505252 m!1388387))

(assert (=> b!1505254 m!1388381))

(assert (=> b!1505254 m!1388381))

(declare-fun m!1388389 () Bool)

(assert (=> b!1505254 m!1388389))

(assert (=> b!1505142 d!157961))

(declare-fun d!157965 () Bool)

(assert (=> d!157965 (= (validKeyInArray!0 (select (arr!48446 a!2850) i!996)) (and (not (= (select (arr!48446 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48446 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505148 d!157965))

(declare-fun b!1505256 () Bool)

(declare-fun e!841306 () SeekEntryResult!12644)

(assert (=> b!1505256 (= e!841306 (MissingVacant!12644 vacantAfter!10))))

(declare-fun lt!653960 () SeekEntryResult!12644)

(declare-fun d!157967 () Bool)

(assert (=> d!157967 (and (or (is-Undefined!12644 lt!653960) (not (is-Found!12644 lt!653960)) (and (bvsge (index!52969 lt!653960) #b00000000000000000000000000000000) (bvslt (index!52969 lt!653960) (size!48996 lt!653907)))) (or (is-Undefined!12644 lt!653960) (is-Found!12644 lt!653960) (not (is-MissingVacant!12644 lt!653960)) (not (= (index!52971 lt!653960) vacantAfter!10)) (and (bvsge (index!52971 lt!653960) #b00000000000000000000000000000000) (bvslt (index!52971 lt!653960) (size!48996 lt!653907)))) (or (is-Undefined!12644 lt!653960) (ite (is-Found!12644 lt!653960) (= (select (arr!48446 lt!653907) (index!52969 lt!653960)) lt!653910) (and (is-MissingVacant!12644 lt!653960) (= (index!52971 lt!653960) vacantAfter!10) (= (select (arr!48446 lt!653907) (index!52971 lt!653960)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!841305 () SeekEntryResult!12644)

(assert (=> d!157967 (= lt!653960 e!841305)))

(declare-fun c!139251 () Bool)

(assert (=> d!157967 (= c!139251 (bvsge x!647 #b01111111111111111111111111111110))))

(declare-fun lt!653961 () (_ BitVec 64))

(assert (=> d!157967 (= lt!653961 (select (arr!48446 lt!653907) index!625))))

(assert (=> d!157967 (validMask!0 mask!2661)))

(assert (=> d!157967 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 lt!653910 lt!653907 mask!2661) lt!653960)))

(declare-fun b!1505257 () Bool)

(declare-fun e!841304 () SeekEntryResult!12644)

(assert (=> b!1505257 (= e!841305 e!841304)))

(declare-fun c!139253 () Bool)

(assert (=> b!1505257 (= c!139253 (= lt!653961 lt!653910))))

(declare-fun b!1505258 () Bool)

(assert (=> b!1505258 (= e!841306 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantAfter!10 lt!653910 lt!653907 mask!2661))))

(declare-fun b!1505259 () Bool)

(declare-fun c!139252 () Bool)

(assert (=> b!1505259 (= c!139252 (= lt!653961 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1505259 (= e!841304 e!841306)))

(declare-fun b!1505260 () Bool)

(assert (=> b!1505260 (= e!841304 (Found!12644 index!625))))

(declare-fun b!1505261 () Bool)

(assert (=> b!1505261 (= e!841305 Undefined!12644)))

(assert (= (and d!157967 c!139251) b!1505261))

(assert (= (and d!157967 (not c!139251)) b!1505257))

(assert (= (and b!1505257 c!139253) b!1505260))

(assert (= (and b!1505257 (not c!139253)) b!1505259))

(assert (= (and b!1505259 c!139252) b!1505256))

(assert (= (and b!1505259 (not c!139252)) b!1505258))

(declare-fun m!1388391 () Bool)

(assert (=> d!157967 m!1388391))

(declare-fun m!1388393 () Bool)

(assert (=> d!157967 m!1388393))

(declare-fun m!1388395 () Bool)

(assert (=> d!157967 m!1388395))

(assert (=> d!157967 m!1388261))

(assert (=> b!1505258 m!1388293))

(assert (=> b!1505258 m!1388293))

(declare-fun m!1388397 () Bool)

(assert (=> b!1505258 m!1388397))

(assert (=> b!1505143 d!157967))

(declare-fun b!1505262 () Bool)

(declare-fun e!841309 () SeekEntryResult!12644)

(assert (=> b!1505262 (= e!841309 (MissingVacant!12644 vacantAfter!10))))

(declare-fun lt!653962 () SeekEntryResult!12644)

(declare-fun d!157969 () Bool)

(assert (=> d!157969 (and (or (is-Undefined!12644 lt!653962) (not (is-Found!12644 lt!653962)) (and (bvsge (index!52969 lt!653962) #b00000000000000000000000000000000) (bvslt (index!52969 lt!653962) (size!48996 lt!653907)))) (or (is-Undefined!12644 lt!653962) (is-Found!12644 lt!653962) (not (is-MissingVacant!12644 lt!653962)) (not (= (index!52971 lt!653962) vacantAfter!10)) (and (bvsge (index!52971 lt!653962) #b00000000000000000000000000000000) (bvslt (index!52971 lt!653962) (size!48996 lt!653907)))) (or (is-Undefined!12644 lt!653962) (ite (is-Found!12644 lt!653962) (= (select (arr!48446 lt!653907) (index!52969 lt!653962)) lt!653910) (and (is-MissingVacant!12644 lt!653962) (= (index!52971 lt!653962) vacantAfter!10) (= (select (arr!48446 lt!653907) (index!52971 lt!653962)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!841308 () SeekEntryResult!12644)

(assert (=> d!157969 (= lt!653962 e!841308)))

(declare-fun c!139254 () Bool)

(assert (=> d!157969 (= c!139254 (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110))))

(declare-fun lt!653963 () (_ BitVec 64))

(assert (=> d!157969 (= lt!653963 (select (arr!48446 lt!653907) lt!653908))))

(assert (=> d!157969 (validMask!0 mask!2661)))

(assert (=> d!157969 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653908 vacantAfter!10 lt!653910 lt!653907 mask!2661) lt!653962)))

(declare-fun b!1505263 () Bool)

(declare-fun e!841307 () SeekEntryResult!12644)

(assert (=> b!1505263 (= e!841308 e!841307)))

(declare-fun c!139256 () Bool)

(assert (=> b!1505263 (= c!139256 (= lt!653963 lt!653910))))

(declare-fun b!1505264 () Bool)

(assert (=> b!1505264 (= e!841309 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) (nextIndex!0 lt!653908 (bvadd #b00000000000000000000000000000001 x!647) mask!2661) vacantAfter!10 lt!653910 lt!653907 mask!2661))))

(declare-fun b!1505265 () Bool)

(declare-fun c!139255 () Bool)

(assert (=> b!1505265 (= c!139255 (= lt!653963 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1505265 (= e!841307 e!841309)))

(declare-fun b!1505266 () Bool)

(assert (=> b!1505266 (= e!841307 (Found!12644 lt!653908))))

(declare-fun b!1505267 () Bool)

(assert (=> b!1505267 (= e!841308 Undefined!12644)))

(assert (= (and d!157969 c!139254) b!1505267))

(assert (= (and d!157969 (not c!139254)) b!1505263))

(assert (= (and b!1505263 c!139256) b!1505266))

(assert (= (and b!1505263 (not c!139256)) b!1505265))

(assert (= (and b!1505265 c!139255) b!1505262))

(assert (= (and b!1505265 (not c!139255)) b!1505264))

(declare-fun m!1388399 () Bool)

(assert (=> d!157969 m!1388399))

(declare-fun m!1388401 () Bool)

(assert (=> d!157969 m!1388401))

(declare-fun m!1388403 () Bool)

(assert (=> d!157969 m!1388403))

(assert (=> d!157969 m!1388261))

(declare-fun m!1388405 () Bool)

(assert (=> b!1505264 m!1388405))

(assert (=> b!1505264 m!1388405))

(declare-fun m!1388407 () Bool)

(assert (=> b!1505264 m!1388407))

(assert (=> b!1505143 d!157969))

(declare-fun d!157971 () Bool)

(declare-fun e!841324 () Bool)

(assert (=> d!157971 e!841324))

(declare-fun res!1025833 () Bool)

(assert (=> d!157971 (=> (not res!1025833) (not e!841324))))

(assert (=> d!157971 (= res!1025833 (and (or (bvslt i!996 #b00000000000000000000000000000000) (bvsge i!996 (size!48996 a!2850)) (and (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48996 a!2850)))) (or (bvslt i!996 #b00000000000000000000000000000000) (bvsge i!996 (size!48996 a!2850)) (and (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48996 a!2850)))) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48996 a!2850))))))

(declare-fun lt!653966 () Unit!50294)

(declare-fun choose!27 (array!100388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50294)

(assert (=> d!157971 (= lt!653966 (choose!27 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653908 vacantBefore!10 vacantAfter!10 mask!2661))))

(assert (=> d!157971 (validMask!0 mask!2661)))

(assert (=> d!157971 (= (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653908 vacantBefore!10 vacantAfter!10 mask!2661) lt!653966)))

(declare-fun b!1505285 () Bool)

(assert (=> b!1505285 (= e!841324 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653908 vacantAfter!10 (select (store (arr!48446 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100389 (store (arr!48446 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48996 a!2850)) mask!2661) (Found!12644 j!87)))))

(assert (= (and d!157971 res!1025833) b!1505285))

(declare-fun m!1388417 () Bool)

(assert (=> d!157971 m!1388417))

(assert (=> d!157971 m!1388261))

(assert (=> b!1505285 m!1388273))

(assert (=> b!1505285 m!1388283))

(assert (=> b!1505285 m!1388283))

(declare-fun m!1388419 () Bool)

(assert (=> b!1505285 m!1388419))

(assert (=> b!1505143 d!157971))

(declare-fun b!1505286 () Bool)

(declare-fun e!841327 () SeekEntryResult!12644)

(assert (=> b!1505286 (= e!841327 (MissingVacant!12644 vacantBefore!10))))

(declare-fun lt!653967 () SeekEntryResult!12644)

(declare-fun d!157977 () Bool)

(assert (=> d!157977 (and (or (is-Undefined!12644 lt!653967) (not (is-Found!12644 lt!653967)) (and (bvsge (index!52969 lt!653967) #b00000000000000000000000000000000) (bvslt (index!52969 lt!653967) (size!48996 a!2850)))) (or (is-Undefined!12644 lt!653967) (is-Found!12644 lt!653967) (not (is-MissingVacant!12644 lt!653967)) (not (= (index!52971 lt!653967) vacantBefore!10)) (and (bvsge (index!52971 lt!653967) #b00000000000000000000000000000000) (bvslt (index!52971 lt!653967) (size!48996 a!2850)))) (or (is-Undefined!12644 lt!653967) (ite (is-Found!12644 lt!653967) (= (select (arr!48446 a!2850) (index!52969 lt!653967)) (select (arr!48446 a!2850) j!87)) (and (is-MissingVacant!12644 lt!653967) (= (index!52971 lt!653967) vacantBefore!10) (= (select (arr!48446 a!2850) (index!52971 lt!653967)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!841326 () SeekEntryResult!12644)

(assert (=> d!157977 (= lt!653967 e!841326)))

(declare-fun c!139260 () Bool)

(assert (=> d!157977 (= c!139260 (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110))))

(declare-fun lt!653968 () (_ BitVec 64))

(assert (=> d!157977 (= lt!653968 (select (arr!48446 a!2850) lt!653908))))

(assert (=> d!157977 (validMask!0 mask!2661)))

(assert (=> d!157977 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653908 vacantBefore!10 (select (arr!48446 a!2850) j!87) a!2850 mask!2661) lt!653967)))

(declare-fun b!1505287 () Bool)

(declare-fun e!841325 () SeekEntryResult!12644)

(assert (=> b!1505287 (= e!841326 e!841325)))

(declare-fun c!139262 () Bool)

(assert (=> b!1505287 (= c!139262 (= lt!653968 (select (arr!48446 a!2850) j!87)))))

(declare-fun b!1505288 () Bool)

(assert (=> b!1505288 (= e!841327 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) (nextIndex!0 lt!653908 (bvadd #b00000000000000000000000000000001 x!647) mask!2661) vacantBefore!10 (select (arr!48446 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1505289 () Bool)

(declare-fun c!139261 () Bool)

(assert (=> b!1505289 (= c!139261 (= lt!653968 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1505289 (= e!841325 e!841327)))

(declare-fun b!1505290 () Bool)

(assert (=> b!1505290 (= e!841325 (Found!12644 lt!653908))))

(declare-fun b!1505291 () Bool)

(assert (=> b!1505291 (= e!841326 Undefined!12644)))

(assert (= (and d!157977 c!139260) b!1505291))

(assert (= (and d!157977 (not c!139260)) b!1505287))

(assert (= (and b!1505287 c!139262) b!1505290))

(assert (= (and b!1505287 (not c!139262)) b!1505289))

(assert (= (and b!1505289 c!139261) b!1505286))

(assert (= (and b!1505289 (not c!139261)) b!1505288))

(declare-fun m!1388421 () Bool)

(assert (=> d!157977 m!1388421))

(declare-fun m!1388423 () Bool)

(assert (=> d!157977 m!1388423))

(declare-fun m!1388425 () Bool)

(assert (=> d!157977 m!1388425))

(assert (=> d!157977 m!1388261))

(assert (=> b!1505288 m!1388405))

(assert (=> b!1505288 m!1388405))

(assert (=> b!1505288 m!1388257))

(declare-fun m!1388427 () Bool)

(assert (=> b!1505288 m!1388427))

(assert (=> b!1505149 d!157977))

(declare-fun d!157979 () Bool)

(declare-fun res!1025841 () Bool)

(declare-fun e!841344 () Bool)

(assert (=> d!157979 (=> res!1025841 e!841344)))

(assert (=> d!157979 (= res!1025841 (bvsge #b00000000000000000000000000000000 (size!48996 a!2850)))))

(assert (=> d!157979 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34935) e!841344)))

(declare-fun b!1505314 () Bool)

(declare-fun e!841345 () Bool)

(declare-fun call!68166 () Bool)

(assert (=> b!1505314 (= e!841345 call!68166)))

(declare-fun b!1505315 () Bool)

(assert (=> b!1505315 (= e!841345 call!68166)))

(declare-fun b!1505316 () Bool)

(declare-fun e!841343 () Bool)

(declare-fun contains!9955 (List!34938 (_ BitVec 64)) Bool)

(assert (=> b!1505316 (= e!841343 (contains!9955 Nil!34935 (select (arr!48446 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1505317 () Bool)

(declare-fun e!841342 () Bool)

(assert (=> b!1505317 (= e!841342 e!841345)))

(declare-fun c!139271 () Bool)

(assert (=> b!1505317 (= c!139271 (validKeyInArray!0 (select (arr!48446 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1505318 () Bool)

(assert (=> b!1505318 (= e!841344 e!841342)))

(declare-fun res!1025842 () Bool)

(assert (=> b!1505318 (=> (not res!1025842) (not e!841342))))

(assert (=> b!1505318 (= res!1025842 (not e!841343))))

(declare-fun res!1025840 () Bool)

(assert (=> b!1505318 (=> (not res!1025840) (not e!841343))))

(assert (=> b!1505318 (= res!1025840 (validKeyInArray!0 (select (arr!48446 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68163 () Bool)

(assert (=> bm!68163 (= call!68166 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139271 (Cons!34934 (select (arr!48446 a!2850) #b00000000000000000000000000000000) Nil!34935) Nil!34935)))))

(assert (= (and d!157979 (not res!1025841)) b!1505318))

(assert (= (and b!1505318 res!1025840) b!1505316))

(assert (= (and b!1505318 res!1025842) b!1505317))

(assert (= (and b!1505317 c!139271) b!1505315))

(assert (= (and b!1505317 (not c!139271)) b!1505314))

(assert (= (or b!1505315 b!1505314) bm!68163))

(assert (=> b!1505316 m!1388381))

(assert (=> b!1505316 m!1388381))

(declare-fun m!1388429 () Bool)

(assert (=> b!1505316 m!1388429))

(assert (=> b!1505317 m!1388381))

(assert (=> b!1505317 m!1388381))

(assert (=> b!1505317 m!1388389))

(assert (=> b!1505318 m!1388381))

(assert (=> b!1505318 m!1388381))

(assert (=> b!1505318 m!1388389))

(assert (=> bm!68163 m!1388381))

(declare-fun m!1388431 () Bool)

(assert (=> bm!68163 m!1388431))

(assert (=> b!1505144 d!157979))

(declare-fun d!157981 () Bool)

(assert (=> d!157981 (= (validKeyInArray!0 (select (arr!48446 a!2850) j!87)) (and (not (= (select (arr!48446 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48446 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505150 d!157981))

(push 1)

(assert (not b!1505252))

(assert (not d!157977))

(assert (not b!1505240))

(assert (not bm!68163))

(assert (not b!1505264))

(assert (not b!1505258))

(assert (not b!1505288))

(assert (not d!157971))

(assert (not d!157953))

(assert (not b!1505316))

(assert (not d!157969))

(assert (not b!1505254))

(assert (not d!157967))

(assert (not d!157955))

(assert (not b!1505318))

(assert (not bm!68157))

(assert (not b!1505317))

(assert (not b!1505285))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

