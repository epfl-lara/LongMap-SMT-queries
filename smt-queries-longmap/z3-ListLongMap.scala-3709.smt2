; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50978 () Bool)

(assert start!50978)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5302 0))(
  ( (MissingZero!5302 (index!23435 (_ BitVec 32))) (Found!5302 (index!23436 (_ BitVec 32))) (Intermediate!5302 (undefined!6114 Bool) (index!23437 (_ BitVec 32)) (x!52343 (_ BitVec 32))) (Undefined!5302) (MissingVacant!5302 (index!23438 (_ BitVec 32))) )
))
(declare-fun lt!253053 () SeekEntryResult!5302)

(declare-fun e!320950 () Bool)

(declare-fun b!557140 () Bool)

(declare-datatypes ((array!35098 0))(
  ( (array!35099 (arr!16856 (Array (_ BitVec 32) (_ BitVec 64))) (size!17221 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35098)

(get-info :version)

(assert (=> b!557140 (= e!320950 (not (or (not ((_ is Intermediate!5302) lt!253053)) (undefined!6114 lt!253053) (= (select (arr!16856 a!3118) (index!23437 lt!253053)) (select (arr!16856 a!3118) j!142)) (= (select (arr!16856 a!3118) (index!23437 lt!253053)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23437 lt!253053) #b00000000000000000000000000000000) (bvsge (index!23437 lt!253053) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52343 lt!253053) #b01111111111111111111111111111110) (bvslt (x!52343 lt!253053) #b00000000000000000000000000000000) (= (select (arr!16856 a!3118) (index!23437 lt!253053)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!320951 () Bool)

(assert (=> b!557140 e!320951))

(declare-fun res!349332 () Bool)

(assert (=> b!557140 (=> (not res!349332) (not e!320951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35098 (_ BitVec 32)) Bool)

(assert (=> b!557140 (= res!349332 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17364 0))(
  ( (Unit!17365) )
))
(declare-fun lt!253052 () Unit!17364)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17364)

(assert (=> b!557140 (= lt!253052 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557141 () Bool)

(declare-fun res!349336 () Bool)

(declare-fun e!320948 () Bool)

(assert (=> b!557141 (=> (not res!349336) (not e!320948))))

(declare-datatypes ((List!10975 0))(
  ( (Nil!10972) (Cons!10971 (h!11962 (_ BitVec 64)) (t!17194 List!10975)) )
))
(declare-fun arrayNoDuplicates!0 (array!35098 (_ BitVec 32) List!10975) Bool)

(assert (=> b!557141 (= res!349336 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10972))))

(declare-fun b!557142 () Bool)

(assert (=> b!557142 (= e!320948 e!320950)))

(declare-fun res!349330 () Bool)

(assert (=> b!557142 (=> (not res!349330) (not e!320950))))

(declare-fun lt!253050 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35098 (_ BitVec 32)) SeekEntryResult!5302)

(assert (=> b!557142 (= res!349330 (= lt!253053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253050 (select (store (arr!16856 a!3118) i!1132 k0!1914) j!142) (array!35099 (store (arr!16856 a!3118) i!1132 k0!1914) (size!17221 a!3118)) mask!3119)))))

(declare-fun lt!253054 () (_ BitVec 32))

(assert (=> b!557142 (= lt!253053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253054 (select (arr!16856 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557142 (= lt!253050 (toIndex!0 (select (store (arr!16856 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!557142 (= lt!253054 (toIndex!0 (select (arr!16856 a!3118) j!142) mask!3119))))

(declare-fun b!557144 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35098 (_ BitVec 32)) SeekEntryResult!5302)

(assert (=> b!557144 (= e!320951 (= (seekEntryOrOpen!0 (select (arr!16856 a!3118) j!142) a!3118 mask!3119) (Found!5302 j!142)))))

(declare-fun b!557145 () Bool)

(declare-fun res!349329 () Bool)

(declare-fun e!320952 () Bool)

(assert (=> b!557145 (=> (not res!349329) (not e!320952))))

(assert (=> b!557145 (= res!349329 (and (= (size!17221 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17221 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17221 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557146 () Bool)

(declare-fun res!349335 () Bool)

(assert (=> b!557146 (=> (not res!349335) (not e!320952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557146 (= res!349335 (validKeyInArray!0 (select (arr!16856 a!3118) j!142)))))

(declare-fun b!557147 () Bool)

(declare-fun res!349334 () Bool)

(assert (=> b!557147 (=> (not res!349334) (not e!320952))))

(declare-fun arrayContainsKey!0 (array!35098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557147 (= res!349334 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557148 () Bool)

(declare-fun res!349337 () Bool)

(assert (=> b!557148 (=> (not res!349337) (not e!320948))))

(assert (=> b!557148 (= res!349337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557149 () Bool)

(assert (=> b!557149 (= e!320952 e!320948)))

(declare-fun res!349328 () Bool)

(assert (=> b!557149 (=> (not res!349328) (not e!320948))))

(declare-fun lt!253051 () SeekEntryResult!5302)

(assert (=> b!557149 (= res!349328 (or (= lt!253051 (MissingZero!5302 i!1132)) (= lt!253051 (MissingVacant!5302 i!1132))))))

(assert (=> b!557149 (= lt!253051 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!557143 () Bool)

(declare-fun res!349333 () Bool)

(assert (=> b!557143 (=> (not res!349333) (not e!320952))))

(assert (=> b!557143 (= res!349333 (validKeyInArray!0 k0!1914))))

(declare-fun res!349331 () Bool)

(assert (=> start!50978 (=> (not res!349331) (not e!320952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50978 (= res!349331 (validMask!0 mask!3119))))

(assert (=> start!50978 e!320952))

(assert (=> start!50978 true))

(declare-fun array_inv!12739 (array!35098) Bool)

(assert (=> start!50978 (array_inv!12739 a!3118)))

(assert (= (and start!50978 res!349331) b!557145))

(assert (= (and b!557145 res!349329) b!557146))

(assert (= (and b!557146 res!349335) b!557143))

(assert (= (and b!557143 res!349333) b!557147))

(assert (= (and b!557147 res!349334) b!557149))

(assert (= (and b!557149 res!349328) b!557148))

(assert (= (and b!557148 res!349337) b!557141))

(assert (= (and b!557141 res!349336) b!557142))

(assert (= (and b!557142 res!349330) b!557140))

(assert (= (and b!557140 res!349332) b!557144))

(declare-fun m!534551 () Bool)

(assert (=> b!557140 m!534551))

(declare-fun m!534553 () Bool)

(assert (=> b!557140 m!534553))

(declare-fun m!534555 () Bool)

(assert (=> b!557140 m!534555))

(declare-fun m!534557 () Bool)

(assert (=> b!557140 m!534557))

(declare-fun m!534559 () Bool)

(assert (=> b!557143 m!534559))

(declare-fun m!534561 () Bool)

(assert (=> b!557141 m!534561))

(declare-fun m!534563 () Bool)

(assert (=> b!557149 m!534563))

(declare-fun m!534565 () Bool)

(assert (=> start!50978 m!534565))

(declare-fun m!534567 () Bool)

(assert (=> start!50978 m!534567))

(declare-fun m!534569 () Bool)

(assert (=> b!557147 m!534569))

(declare-fun m!534571 () Bool)

(assert (=> b!557148 m!534571))

(assert (=> b!557142 m!534553))

(declare-fun m!534573 () Bool)

(assert (=> b!557142 m!534573))

(assert (=> b!557142 m!534553))

(declare-fun m!534575 () Bool)

(assert (=> b!557142 m!534575))

(assert (=> b!557142 m!534553))

(declare-fun m!534577 () Bool)

(assert (=> b!557142 m!534577))

(declare-fun m!534579 () Bool)

(assert (=> b!557142 m!534579))

(assert (=> b!557142 m!534575))

(declare-fun m!534581 () Bool)

(assert (=> b!557142 m!534581))

(assert (=> b!557142 m!534575))

(declare-fun m!534583 () Bool)

(assert (=> b!557142 m!534583))

(assert (=> b!557146 m!534553))

(assert (=> b!557146 m!534553))

(declare-fun m!534585 () Bool)

(assert (=> b!557146 m!534585))

(assert (=> b!557144 m!534553))

(assert (=> b!557144 m!534553))

(declare-fun m!534587 () Bool)

(assert (=> b!557144 m!534587))

(check-sat (not b!557149) (not b!557148) (not b!557147) (not b!557141) (not b!557142) (not start!50978) (not b!557143) (not b!557140) (not b!557144) (not b!557146))
(check-sat)
(get-model)

(declare-fun d!83265 () Bool)

(assert (=> d!83265 (= (validKeyInArray!0 (select (arr!16856 a!3118) j!142)) (and (not (= (select (arr!16856 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16856 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!557146 d!83265))

(declare-fun b!557218 () Bool)

(declare-fun e!320991 () Bool)

(declare-fun call!32350 () Bool)

(assert (=> b!557218 (= e!320991 call!32350)))

(declare-fun d!83267 () Bool)

(declare-fun res!349402 () Bool)

(declare-fun e!320989 () Bool)

(assert (=> d!83267 (=> res!349402 e!320989)))

(assert (=> d!83267 (= res!349402 (bvsge j!142 (size!17221 a!3118)))))

(assert (=> d!83267 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!320989)))

(declare-fun b!557219 () Bool)

(declare-fun e!320990 () Bool)

(assert (=> b!557219 (= e!320990 call!32350)))

(declare-fun b!557220 () Bool)

(assert (=> b!557220 (= e!320989 e!320990)))

(declare-fun c!64248 () Bool)

(assert (=> b!557220 (= c!64248 (validKeyInArray!0 (select (arr!16856 a!3118) j!142)))))

(declare-fun bm!32347 () Bool)

(assert (=> bm!32347 (= call!32350 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!557221 () Bool)

(assert (=> b!557221 (= e!320990 e!320991)))

(declare-fun lt!253092 () (_ BitVec 64))

(assert (=> b!557221 (= lt!253092 (select (arr!16856 a!3118) j!142))))

(declare-fun lt!253093 () Unit!17364)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35098 (_ BitVec 64) (_ BitVec 32)) Unit!17364)

(assert (=> b!557221 (= lt!253093 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253092 j!142))))

(assert (=> b!557221 (arrayContainsKey!0 a!3118 lt!253092 #b00000000000000000000000000000000)))

(declare-fun lt!253091 () Unit!17364)

(assert (=> b!557221 (= lt!253091 lt!253093)))

(declare-fun res!349403 () Bool)

(assert (=> b!557221 (= res!349403 (= (seekEntryOrOpen!0 (select (arr!16856 a!3118) j!142) a!3118 mask!3119) (Found!5302 j!142)))))

(assert (=> b!557221 (=> (not res!349403) (not e!320991))))

(assert (= (and d!83267 (not res!349402)) b!557220))

(assert (= (and b!557220 c!64248) b!557221))

(assert (= (and b!557220 (not c!64248)) b!557219))

(assert (= (and b!557221 res!349403) b!557218))

(assert (= (or b!557218 b!557219) bm!32347))

(assert (=> b!557220 m!534553))

(assert (=> b!557220 m!534553))

(assert (=> b!557220 m!534585))

(declare-fun m!534665 () Bool)

(assert (=> bm!32347 m!534665))

(assert (=> b!557221 m!534553))

(declare-fun m!534667 () Bool)

(assert (=> b!557221 m!534667))

(declare-fun m!534669 () Bool)

(assert (=> b!557221 m!534669))

(assert (=> b!557221 m!534553))

(assert (=> b!557221 m!534587))

(assert (=> b!557140 d!83267))

(declare-fun d!83269 () Bool)

(assert (=> d!83269 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!253096 () Unit!17364)

(declare-fun choose!38 (array!35098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17364)

(assert (=> d!83269 (= lt!253096 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83269 (validMask!0 mask!3119)))

(assert (=> d!83269 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!253096)))

(declare-fun bs!17326 () Bool)

(assert (= bs!17326 d!83269))

(assert (=> bs!17326 m!534555))

(declare-fun m!534671 () Bool)

(assert (=> bs!17326 m!534671))

(assert (=> bs!17326 m!534565))

(assert (=> b!557140 d!83269))

(declare-fun d!83273 () Bool)

(assert (=> d!83273 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50978 d!83273))

(declare-fun d!83279 () Bool)

(assert (=> d!83279 (= (array_inv!12739 a!3118) (bvsge (size!17221 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50978 d!83279))

(declare-fun e!321038 () SeekEntryResult!5302)

(declare-fun lt!253120 () SeekEntryResult!5302)

(declare-fun b!557291 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35098 (_ BitVec 32)) SeekEntryResult!5302)

(assert (=> b!557291 (= e!321038 (seekKeyOrZeroReturnVacant!0 (x!52343 lt!253120) (index!23437 lt!253120) (index!23437 lt!253120) (select (arr!16856 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!557292 () Bool)

(declare-fun e!321036 () SeekEntryResult!5302)

(assert (=> b!557292 (= e!321036 (Found!5302 (index!23437 lt!253120)))))

(declare-fun d!83281 () Bool)

(declare-fun lt!253119 () SeekEntryResult!5302)

(assert (=> d!83281 (and (or ((_ is Undefined!5302) lt!253119) (not ((_ is Found!5302) lt!253119)) (and (bvsge (index!23436 lt!253119) #b00000000000000000000000000000000) (bvslt (index!23436 lt!253119) (size!17221 a!3118)))) (or ((_ is Undefined!5302) lt!253119) ((_ is Found!5302) lt!253119) (not ((_ is MissingZero!5302) lt!253119)) (and (bvsge (index!23435 lt!253119) #b00000000000000000000000000000000) (bvslt (index!23435 lt!253119) (size!17221 a!3118)))) (or ((_ is Undefined!5302) lt!253119) ((_ is Found!5302) lt!253119) ((_ is MissingZero!5302) lt!253119) (not ((_ is MissingVacant!5302) lt!253119)) (and (bvsge (index!23438 lt!253119) #b00000000000000000000000000000000) (bvslt (index!23438 lt!253119) (size!17221 a!3118)))) (or ((_ is Undefined!5302) lt!253119) (ite ((_ is Found!5302) lt!253119) (= (select (arr!16856 a!3118) (index!23436 lt!253119)) (select (arr!16856 a!3118) j!142)) (ite ((_ is MissingZero!5302) lt!253119) (= (select (arr!16856 a!3118) (index!23435 lt!253119)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5302) lt!253119) (= (select (arr!16856 a!3118) (index!23438 lt!253119)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!321037 () SeekEntryResult!5302)

(assert (=> d!83281 (= lt!253119 e!321037)))

(declare-fun c!64276 () Bool)

(assert (=> d!83281 (= c!64276 (and ((_ is Intermediate!5302) lt!253120) (undefined!6114 lt!253120)))))

(assert (=> d!83281 (= lt!253120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16856 a!3118) j!142) mask!3119) (select (arr!16856 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83281 (validMask!0 mask!3119)))

(assert (=> d!83281 (= (seekEntryOrOpen!0 (select (arr!16856 a!3118) j!142) a!3118 mask!3119) lt!253119)))

(declare-fun b!557293 () Bool)

(assert (=> b!557293 (= e!321037 Undefined!5302)))

(declare-fun b!557294 () Bool)

(declare-fun c!64277 () Bool)

(declare-fun lt!253121 () (_ BitVec 64))

(assert (=> b!557294 (= c!64277 (= lt!253121 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557294 (= e!321036 e!321038)))

(declare-fun b!557295 () Bool)

(assert (=> b!557295 (= e!321037 e!321036)))

(assert (=> b!557295 (= lt!253121 (select (arr!16856 a!3118) (index!23437 lt!253120)))))

(declare-fun c!64278 () Bool)

(assert (=> b!557295 (= c!64278 (= lt!253121 (select (arr!16856 a!3118) j!142)))))

(declare-fun b!557296 () Bool)

(assert (=> b!557296 (= e!321038 (MissingZero!5302 (index!23437 lt!253120)))))

(assert (= (and d!83281 c!64276) b!557293))

(assert (= (and d!83281 (not c!64276)) b!557295))

(assert (= (and b!557295 c!64278) b!557292))

(assert (= (and b!557295 (not c!64278)) b!557294))

(assert (= (and b!557294 c!64277) b!557296))

(assert (= (and b!557294 (not c!64277)) b!557291))

(assert (=> b!557291 m!534553))

(declare-fun m!534707 () Bool)

(assert (=> b!557291 m!534707))

(declare-fun m!534709 () Bool)

(assert (=> d!83281 m!534709))

(declare-fun m!534711 () Bool)

(assert (=> d!83281 m!534711))

(assert (=> d!83281 m!534553))

(assert (=> d!83281 m!534573))

(declare-fun m!534713 () Bool)

(assert (=> d!83281 m!534713))

(assert (=> d!83281 m!534573))

(assert (=> d!83281 m!534553))

(declare-fun m!534717 () Bool)

(assert (=> d!83281 m!534717))

(assert (=> d!83281 m!534565))

(declare-fun m!534719 () Bool)

(assert (=> b!557295 m!534719))

(assert (=> b!557144 d!83281))

(declare-fun b!557303 () Bool)

(declare-fun e!321043 () SeekEntryResult!5302)

(declare-fun lt!253123 () SeekEntryResult!5302)

(assert (=> b!557303 (= e!321043 (seekKeyOrZeroReturnVacant!0 (x!52343 lt!253123) (index!23437 lt!253123) (index!23437 lt!253123) k0!1914 a!3118 mask!3119))))

(declare-fun b!557304 () Bool)

(declare-fun e!321041 () SeekEntryResult!5302)

(assert (=> b!557304 (= e!321041 (Found!5302 (index!23437 lt!253123)))))

(declare-fun d!83291 () Bool)

(declare-fun lt!253122 () SeekEntryResult!5302)

(assert (=> d!83291 (and (or ((_ is Undefined!5302) lt!253122) (not ((_ is Found!5302) lt!253122)) (and (bvsge (index!23436 lt!253122) #b00000000000000000000000000000000) (bvslt (index!23436 lt!253122) (size!17221 a!3118)))) (or ((_ is Undefined!5302) lt!253122) ((_ is Found!5302) lt!253122) (not ((_ is MissingZero!5302) lt!253122)) (and (bvsge (index!23435 lt!253122) #b00000000000000000000000000000000) (bvslt (index!23435 lt!253122) (size!17221 a!3118)))) (or ((_ is Undefined!5302) lt!253122) ((_ is Found!5302) lt!253122) ((_ is MissingZero!5302) lt!253122) (not ((_ is MissingVacant!5302) lt!253122)) (and (bvsge (index!23438 lt!253122) #b00000000000000000000000000000000) (bvslt (index!23438 lt!253122) (size!17221 a!3118)))) (or ((_ is Undefined!5302) lt!253122) (ite ((_ is Found!5302) lt!253122) (= (select (arr!16856 a!3118) (index!23436 lt!253122)) k0!1914) (ite ((_ is MissingZero!5302) lt!253122) (= (select (arr!16856 a!3118) (index!23435 lt!253122)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5302) lt!253122) (= (select (arr!16856 a!3118) (index!23438 lt!253122)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!321042 () SeekEntryResult!5302)

(assert (=> d!83291 (= lt!253122 e!321042)))

(declare-fun c!64279 () Bool)

(assert (=> d!83291 (= c!64279 (and ((_ is Intermediate!5302) lt!253123) (undefined!6114 lt!253123)))))

(assert (=> d!83291 (= lt!253123 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83291 (validMask!0 mask!3119)))

(assert (=> d!83291 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!253122)))

(declare-fun b!557305 () Bool)

(assert (=> b!557305 (= e!321042 Undefined!5302)))

(declare-fun b!557306 () Bool)

(declare-fun c!64280 () Bool)

(declare-fun lt!253124 () (_ BitVec 64))

(assert (=> b!557306 (= c!64280 (= lt!253124 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557306 (= e!321041 e!321043)))

(declare-fun b!557307 () Bool)

(assert (=> b!557307 (= e!321042 e!321041)))

(assert (=> b!557307 (= lt!253124 (select (arr!16856 a!3118) (index!23437 lt!253123)))))

(declare-fun c!64281 () Bool)

(assert (=> b!557307 (= c!64281 (= lt!253124 k0!1914))))

(declare-fun b!557308 () Bool)

(assert (=> b!557308 (= e!321043 (MissingZero!5302 (index!23437 lt!253123)))))

(assert (= (and d!83291 c!64279) b!557305))

(assert (= (and d!83291 (not c!64279)) b!557307))

(assert (= (and b!557307 c!64281) b!557304))

(assert (= (and b!557307 (not c!64281)) b!557306))

(assert (= (and b!557306 c!64280) b!557308))

(assert (= (and b!557306 (not c!64280)) b!557303))

(declare-fun m!534721 () Bool)

(assert (=> b!557303 m!534721))

(declare-fun m!534723 () Bool)

(assert (=> d!83291 m!534723))

(declare-fun m!534725 () Bool)

(assert (=> d!83291 m!534725))

(declare-fun m!534727 () Bool)

(assert (=> d!83291 m!534727))

(declare-fun m!534729 () Bool)

(assert (=> d!83291 m!534729))

(assert (=> d!83291 m!534727))

(declare-fun m!534731 () Bool)

(assert (=> d!83291 m!534731))

(assert (=> d!83291 m!534565))

(declare-fun m!534733 () Bool)

(assert (=> b!557307 m!534733))

(assert (=> b!557149 d!83291))

(declare-fun d!83295 () Bool)

(assert (=> d!83295 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!557143 d!83295))

(declare-fun b!557309 () Bool)

(declare-fun e!321046 () Bool)

(declare-fun call!32354 () Bool)

(assert (=> b!557309 (= e!321046 call!32354)))

(declare-fun d!83297 () Bool)

(declare-fun res!349425 () Bool)

(declare-fun e!321044 () Bool)

(assert (=> d!83297 (=> res!349425 e!321044)))

(assert (=> d!83297 (= res!349425 (bvsge #b00000000000000000000000000000000 (size!17221 a!3118)))))

(assert (=> d!83297 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!321044)))

(declare-fun b!557310 () Bool)

(declare-fun e!321045 () Bool)

(assert (=> b!557310 (= e!321045 call!32354)))

(declare-fun b!557311 () Bool)

(assert (=> b!557311 (= e!321044 e!321045)))

(declare-fun c!64282 () Bool)

(assert (=> b!557311 (= c!64282 (validKeyInArray!0 (select (arr!16856 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32351 () Bool)

(assert (=> bm!32351 (= call!32354 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!557312 () Bool)

(assert (=> b!557312 (= e!321045 e!321046)))

(declare-fun lt!253126 () (_ BitVec 64))

(assert (=> b!557312 (= lt!253126 (select (arr!16856 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!253127 () Unit!17364)

(assert (=> b!557312 (= lt!253127 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253126 #b00000000000000000000000000000000))))

(assert (=> b!557312 (arrayContainsKey!0 a!3118 lt!253126 #b00000000000000000000000000000000)))

(declare-fun lt!253125 () Unit!17364)

(assert (=> b!557312 (= lt!253125 lt!253127)))

(declare-fun res!349426 () Bool)

(assert (=> b!557312 (= res!349426 (= (seekEntryOrOpen!0 (select (arr!16856 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5302 #b00000000000000000000000000000000)))))

(assert (=> b!557312 (=> (not res!349426) (not e!321046))))

(assert (= (and d!83297 (not res!349425)) b!557311))

(assert (= (and b!557311 c!64282) b!557312))

(assert (= (and b!557311 (not c!64282)) b!557310))

(assert (= (and b!557312 res!349426) b!557309))

(assert (= (or b!557309 b!557310) bm!32351))

(declare-fun m!534735 () Bool)

(assert (=> b!557311 m!534735))

(assert (=> b!557311 m!534735))

(declare-fun m!534737 () Bool)

(assert (=> b!557311 m!534737))

(declare-fun m!534739 () Bool)

(assert (=> bm!32351 m!534739))

(assert (=> b!557312 m!534735))

(declare-fun m!534741 () Bool)

(assert (=> b!557312 m!534741))

(declare-fun m!534743 () Bool)

(assert (=> b!557312 m!534743))

(assert (=> b!557312 m!534735))

(declare-fun m!534745 () Bool)

(assert (=> b!557312 m!534745))

(assert (=> b!557148 d!83297))

(declare-fun b!557361 () Bool)

(declare-fun e!321078 () SeekEntryResult!5302)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557361 (= e!321078 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253050 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16856 a!3118) i!1132 k0!1914) j!142) (array!35099 (store (arr!16856 a!3118) i!1132 k0!1914) (size!17221 a!3118)) mask!3119))))

(declare-fun b!557362 () Bool)

(declare-fun e!321077 () Bool)

(declare-fun e!321076 () Bool)

(assert (=> b!557362 (= e!321077 e!321076)))

(declare-fun res!349446 () Bool)

(declare-fun lt!253153 () SeekEntryResult!5302)

(assert (=> b!557362 (= res!349446 (and ((_ is Intermediate!5302) lt!253153) (not (undefined!6114 lt!253153)) (bvslt (x!52343 lt!253153) #b01111111111111111111111111111110) (bvsge (x!52343 lt!253153) #b00000000000000000000000000000000) (bvsge (x!52343 lt!253153) #b00000000000000000000000000000000)))))

(assert (=> b!557362 (=> (not res!349446) (not e!321076))))

(declare-fun d!83299 () Bool)

(assert (=> d!83299 e!321077))

(declare-fun c!64299 () Bool)

(assert (=> d!83299 (= c!64299 (and ((_ is Intermediate!5302) lt!253153) (undefined!6114 lt!253153)))))

(declare-fun e!321080 () SeekEntryResult!5302)

(assert (=> d!83299 (= lt!253153 e!321080)))

(declare-fun c!64300 () Bool)

(assert (=> d!83299 (= c!64300 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253154 () (_ BitVec 64))

(assert (=> d!83299 (= lt!253154 (select (arr!16856 (array!35099 (store (arr!16856 a!3118) i!1132 k0!1914) (size!17221 a!3118))) lt!253050))))

(assert (=> d!83299 (validMask!0 mask!3119)))

(assert (=> d!83299 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253050 (select (store (arr!16856 a!3118) i!1132 k0!1914) j!142) (array!35099 (store (arr!16856 a!3118) i!1132 k0!1914) (size!17221 a!3118)) mask!3119) lt!253153)))

(declare-fun b!557363 () Bool)

(assert (=> b!557363 (and (bvsge (index!23437 lt!253153) #b00000000000000000000000000000000) (bvslt (index!23437 lt!253153) (size!17221 (array!35099 (store (arr!16856 a!3118) i!1132 k0!1914) (size!17221 a!3118)))))))

(declare-fun res!349448 () Bool)

(assert (=> b!557363 (= res!349448 (= (select (arr!16856 (array!35099 (store (arr!16856 a!3118) i!1132 k0!1914) (size!17221 a!3118))) (index!23437 lt!253153)) (select (store (arr!16856 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!321079 () Bool)

(assert (=> b!557363 (=> res!349448 e!321079)))

(assert (=> b!557363 (= e!321076 e!321079)))

(declare-fun b!557364 () Bool)

(assert (=> b!557364 (= e!321080 (Intermediate!5302 true lt!253050 #b00000000000000000000000000000000))))

(declare-fun b!557365 () Bool)

(assert (=> b!557365 (and (bvsge (index!23437 lt!253153) #b00000000000000000000000000000000) (bvslt (index!23437 lt!253153) (size!17221 (array!35099 (store (arr!16856 a!3118) i!1132 k0!1914) (size!17221 a!3118)))))))

(assert (=> b!557365 (= e!321079 (= (select (arr!16856 (array!35099 (store (arr!16856 a!3118) i!1132 k0!1914) (size!17221 a!3118))) (index!23437 lt!253153)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!557366 () Bool)

(assert (=> b!557366 (= e!321078 (Intermediate!5302 false lt!253050 #b00000000000000000000000000000000))))

(declare-fun b!557367 () Bool)

(assert (=> b!557367 (and (bvsge (index!23437 lt!253153) #b00000000000000000000000000000000) (bvslt (index!23437 lt!253153) (size!17221 (array!35099 (store (arr!16856 a!3118) i!1132 k0!1914) (size!17221 a!3118)))))))

(declare-fun res!349447 () Bool)

(assert (=> b!557367 (= res!349447 (= (select (arr!16856 (array!35099 (store (arr!16856 a!3118) i!1132 k0!1914) (size!17221 a!3118))) (index!23437 lt!253153)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557367 (=> res!349447 e!321079)))

(declare-fun b!557368 () Bool)

(assert (=> b!557368 (= e!321080 e!321078)))

(declare-fun c!64298 () Bool)

(assert (=> b!557368 (= c!64298 (or (= lt!253154 (select (store (arr!16856 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!253154 lt!253154) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557369 () Bool)

(assert (=> b!557369 (= e!321077 (bvsge (x!52343 lt!253153) #b01111111111111111111111111111110))))

(assert (= (and d!83299 c!64300) b!557364))

(assert (= (and d!83299 (not c!64300)) b!557368))

(assert (= (and b!557368 c!64298) b!557366))

(assert (= (and b!557368 (not c!64298)) b!557361))

(assert (= (and d!83299 c!64299) b!557369))

(assert (= (and d!83299 (not c!64299)) b!557362))

(assert (= (and b!557362 res!349446) b!557363))

(assert (= (and b!557363 (not res!349448)) b!557367))

(assert (= (and b!557367 (not res!349447)) b!557365))

(declare-fun m!534769 () Bool)

(assert (=> b!557361 m!534769))

(assert (=> b!557361 m!534769))

(assert (=> b!557361 m!534575))

(declare-fun m!534771 () Bool)

(assert (=> b!557361 m!534771))

(declare-fun m!534773 () Bool)

(assert (=> b!557367 m!534773))

(assert (=> b!557365 m!534773))

(assert (=> b!557363 m!534773))

(declare-fun m!534775 () Bool)

(assert (=> d!83299 m!534775))

(assert (=> d!83299 m!534565))

(assert (=> b!557142 d!83299))

(declare-fun b!557370 () Bool)

(declare-fun e!321083 () SeekEntryResult!5302)

(assert (=> b!557370 (= e!321083 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253054 #b00000000000000000000000000000000 mask!3119) (select (arr!16856 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!557371 () Bool)

(declare-fun e!321082 () Bool)

(declare-fun e!321081 () Bool)

(assert (=> b!557371 (= e!321082 e!321081)))

(declare-fun res!349449 () Bool)

(declare-fun lt!253155 () SeekEntryResult!5302)

(assert (=> b!557371 (= res!349449 (and ((_ is Intermediate!5302) lt!253155) (not (undefined!6114 lt!253155)) (bvslt (x!52343 lt!253155) #b01111111111111111111111111111110) (bvsge (x!52343 lt!253155) #b00000000000000000000000000000000) (bvsge (x!52343 lt!253155) #b00000000000000000000000000000000)))))

(assert (=> b!557371 (=> (not res!349449) (not e!321081))))

(declare-fun d!83317 () Bool)

(assert (=> d!83317 e!321082))

(declare-fun c!64302 () Bool)

(assert (=> d!83317 (= c!64302 (and ((_ is Intermediate!5302) lt!253155) (undefined!6114 lt!253155)))))

(declare-fun e!321085 () SeekEntryResult!5302)

(assert (=> d!83317 (= lt!253155 e!321085)))

(declare-fun c!64303 () Bool)

(assert (=> d!83317 (= c!64303 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253156 () (_ BitVec 64))

(assert (=> d!83317 (= lt!253156 (select (arr!16856 a!3118) lt!253054))))

(assert (=> d!83317 (validMask!0 mask!3119)))

(assert (=> d!83317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253054 (select (arr!16856 a!3118) j!142) a!3118 mask!3119) lt!253155)))

(declare-fun b!557372 () Bool)

(assert (=> b!557372 (and (bvsge (index!23437 lt!253155) #b00000000000000000000000000000000) (bvslt (index!23437 lt!253155) (size!17221 a!3118)))))

(declare-fun res!349451 () Bool)

(assert (=> b!557372 (= res!349451 (= (select (arr!16856 a!3118) (index!23437 lt!253155)) (select (arr!16856 a!3118) j!142)))))

(declare-fun e!321084 () Bool)

(assert (=> b!557372 (=> res!349451 e!321084)))

(assert (=> b!557372 (= e!321081 e!321084)))

(declare-fun b!557373 () Bool)

(assert (=> b!557373 (= e!321085 (Intermediate!5302 true lt!253054 #b00000000000000000000000000000000))))

(declare-fun b!557374 () Bool)

(assert (=> b!557374 (and (bvsge (index!23437 lt!253155) #b00000000000000000000000000000000) (bvslt (index!23437 lt!253155) (size!17221 a!3118)))))

(assert (=> b!557374 (= e!321084 (= (select (arr!16856 a!3118) (index!23437 lt!253155)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!557375 () Bool)

(assert (=> b!557375 (= e!321083 (Intermediate!5302 false lt!253054 #b00000000000000000000000000000000))))

(declare-fun b!557376 () Bool)

(assert (=> b!557376 (and (bvsge (index!23437 lt!253155) #b00000000000000000000000000000000) (bvslt (index!23437 lt!253155) (size!17221 a!3118)))))

(declare-fun res!349450 () Bool)

(assert (=> b!557376 (= res!349450 (= (select (arr!16856 a!3118) (index!23437 lt!253155)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557376 (=> res!349450 e!321084)))

(declare-fun b!557377 () Bool)

(assert (=> b!557377 (= e!321085 e!321083)))

(declare-fun c!64301 () Bool)

(assert (=> b!557377 (= c!64301 (or (= lt!253156 (select (arr!16856 a!3118) j!142)) (= (bvadd lt!253156 lt!253156) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557378 () Bool)

(assert (=> b!557378 (= e!321082 (bvsge (x!52343 lt!253155) #b01111111111111111111111111111110))))

(assert (= (and d!83317 c!64303) b!557373))

(assert (= (and d!83317 (not c!64303)) b!557377))

(assert (= (and b!557377 c!64301) b!557375))

(assert (= (and b!557377 (not c!64301)) b!557370))

(assert (= (and d!83317 c!64302) b!557378))

(assert (= (and d!83317 (not c!64302)) b!557371))

(assert (= (and b!557371 res!349449) b!557372))

(assert (= (and b!557372 (not res!349451)) b!557376))

(assert (= (and b!557376 (not res!349450)) b!557374))

(declare-fun m!534777 () Bool)

(assert (=> b!557370 m!534777))

(assert (=> b!557370 m!534777))

(assert (=> b!557370 m!534553))

(declare-fun m!534781 () Bool)

(assert (=> b!557370 m!534781))

(declare-fun m!534783 () Bool)

(assert (=> b!557376 m!534783))

(assert (=> b!557374 m!534783))

(assert (=> b!557372 m!534783))

(declare-fun m!534785 () Bool)

(assert (=> d!83317 m!534785))

(assert (=> d!83317 m!534565))

(assert (=> b!557142 d!83317))

(declare-fun d!83321 () Bool)

(declare-fun lt!253174 () (_ BitVec 32))

(declare-fun lt!253173 () (_ BitVec 32))

(assert (=> d!83321 (= lt!253174 (bvmul (bvxor lt!253173 (bvlshr lt!253173 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83321 (= lt!253173 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16856 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16856 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83321 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349454 (let ((h!11966 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16856 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16856 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52349 (bvmul (bvxor h!11966 (bvlshr h!11966 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52349 (bvlshr x!52349 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349454 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349454 #b00000000000000000000000000000000))))))

(assert (=> d!83321 (= (toIndex!0 (select (store (arr!16856 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!253174 (bvlshr lt!253174 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!557142 d!83321))

(declare-fun d!83325 () Bool)

(declare-fun lt!253176 () (_ BitVec 32))

(declare-fun lt!253175 () (_ BitVec 32))

(assert (=> d!83325 (= lt!253176 (bvmul (bvxor lt!253175 (bvlshr lt!253175 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83325 (= lt!253175 ((_ extract 31 0) (bvand (bvxor (select (arr!16856 a!3118) j!142) (bvlshr (select (arr!16856 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83325 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349454 (let ((h!11966 ((_ extract 31 0) (bvand (bvxor (select (arr!16856 a!3118) j!142) (bvlshr (select (arr!16856 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52349 (bvmul (bvxor h!11966 (bvlshr h!11966 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52349 (bvlshr x!52349 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349454 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349454 #b00000000000000000000000000000000))))))

(assert (=> d!83325 (= (toIndex!0 (select (arr!16856 a!3118) j!142) mask!3119) (bvand (bvxor lt!253176 (bvlshr lt!253176 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!557142 d!83325))

(declare-fun d!83327 () Bool)

(declare-fun res!349459 () Bool)

(declare-fun e!321102 () Bool)

(assert (=> d!83327 (=> res!349459 e!321102)))

(assert (=> d!83327 (= res!349459 (= (select (arr!16856 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83327 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!321102)))

(declare-fun b!557405 () Bool)

(declare-fun e!321103 () Bool)

(assert (=> b!557405 (= e!321102 e!321103)))

(declare-fun res!349460 () Bool)

(assert (=> b!557405 (=> (not res!349460) (not e!321103))))

(assert (=> b!557405 (= res!349460 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17221 a!3118)))))

(declare-fun b!557406 () Bool)

(assert (=> b!557406 (= e!321103 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83327 (not res!349459)) b!557405))

(assert (= (and b!557405 res!349460) b!557406))

(assert (=> d!83327 m!534735))

(declare-fun m!534807 () Bool)

(assert (=> b!557406 m!534807))

(assert (=> b!557147 d!83327))

(declare-fun bm!32358 () Bool)

(declare-fun call!32361 () Bool)

(declare-fun c!64316 () Bool)

(assert (=> bm!32358 (= call!32361 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64316 (Cons!10971 (select (arr!16856 a!3118) #b00000000000000000000000000000000) Nil!10972) Nil!10972)))))

(declare-fun d!83331 () Bool)

(declare-fun res!349474 () Bool)

(declare-fun e!321121 () Bool)

(assert (=> d!83331 (=> res!349474 e!321121)))

(assert (=> d!83331 (= res!349474 (bvsge #b00000000000000000000000000000000 (size!17221 a!3118)))))

(assert (=> d!83331 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10972) e!321121)))

(declare-fun b!557423 () Bool)

(declare-fun e!321119 () Bool)

(assert (=> b!557423 (= e!321121 e!321119)))

(declare-fun res!349473 () Bool)

(assert (=> b!557423 (=> (not res!349473) (not e!321119))))

(declare-fun e!321118 () Bool)

(assert (=> b!557423 (= res!349473 (not e!321118))))

(declare-fun res!349475 () Bool)

(assert (=> b!557423 (=> (not res!349475) (not e!321118))))

(assert (=> b!557423 (= res!349475 (validKeyInArray!0 (select (arr!16856 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557424 () Bool)

(declare-fun e!321120 () Bool)

(assert (=> b!557424 (= e!321119 e!321120)))

(assert (=> b!557424 (= c!64316 (validKeyInArray!0 (select (arr!16856 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557425 () Bool)

(assert (=> b!557425 (= e!321120 call!32361)))

(declare-fun b!557426 () Bool)

(declare-fun contains!2832 (List!10975 (_ BitVec 64)) Bool)

(assert (=> b!557426 (= e!321118 (contains!2832 Nil!10972 (select (arr!16856 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557427 () Bool)

(assert (=> b!557427 (= e!321120 call!32361)))

(assert (= (and d!83331 (not res!349474)) b!557423))

(assert (= (and b!557423 res!349475) b!557426))

(assert (= (and b!557423 res!349473) b!557424))

(assert (= (and b!557424 c!64316) b!557427))

(assert (= (and b!557424 (not c!64316)) b!557425))

(assert (= (or b!557427 b!557425) bm!32358))

(assert (=> bm!32358 m!534735))

(declare-fun m!534813 () Bool)

(assert (=> bm!32358 m!534813))

(assert (=> b!557423 m!534735))

(assert (=> b!557423 m!534735))

(assert (=> b!557423 m!534737))

(assert (=> b!557424 m!534735))

(assert (=> b!557424 m!534735))

(assert (=> b!557424 m!534737))

(assert (=> b!557426 m!534735))

(assert (=> b!557426 m!534735))

(declare-fun m!534815 () Bool)

(assert (=> b!557426 m!534815))

(assert (=> b!557141 d!83331))

(check-sat (not b!557291) (not b!557220) (not b!557406) (not b!557426) (not d!83317) (not d!83299) (not d!83269) (not bm!32347) (not b!557423) (not d!83291) (not b!557221) (not b!557303) (not b!557361) (not bm!32358) (not b!557312) (not b!557424) (not b!557370) (not d!83281) (not b!557311) (not bm!32351))
(check-sat)
