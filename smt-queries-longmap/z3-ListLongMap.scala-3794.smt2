; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52046 () Bool)

(assert start!52046)

(declare-fun b!568190 () Bool)

(declare-fun res!358541 () Bool)

(declare-fun e!326916 () Bool)

(assert (=> b!568190 (=> (not res!358541) (not e!326916))))

(declare-datatypes ((array!35635 0))(
  ( (array!35636 (arr!17111 (Array (_ BitVec 32) (_ BitVec 64))) (size!17476 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35635)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568190 (= res!358541 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun e!326914 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5557 0))(
  ( (MissingZero!5557 (index!24455 (_ BitVec 32))) (Found!5557 (index!24456 (_ BitVec 32))) (Intermediate!5557 (undefined!6369 Bool) (index!24457 (_ BitVec 32)) (x!53341 (_ BitVec 32))) (Undefined!5557) (MissingVacant!5557 (index!24458 (_ BitVec 32))) )
))
(declare-fun lt!258727 () SeekEntryResult!5557)

(declare-fun b!568191 () Bool)

(declare-fun lt!258725 () SeekEntryResult!5557)

(get-info :version)

(assert (=> b!568191 (= e!326914 (not (or (not ((_ is Intermediate!5557) lt!258727)) (undefined!6369 lt!258727) (= (select (arr!17111 a!3118) (index!24457 lt!258727)) (select (arr!17111 a!3118) j!142)) (not (= (select (arr!17111 a!3118) (index!24457 lt!258727)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!258725 (MissingZero!5557 (index!24457 lt!258727))))))))

(assert (=> b!568191 (= lt!258725 (Found!5557 j!142))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35635 (_ BitVec 32)) SeekEntryResult!5557)

(assert (=> b!568191 (= lt!258725 (seekEntryOrOpen!0 (select (arr!17111 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35635 (_ BitVec 32)) Bool)

(assert (=> b!568191 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17802 0))(
  ( (Unit!17803) )
))
(declare-fun lt!258723 () Unit!17802)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17802)

(assert (=> b!568191 (= lt!258723 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568192 () Bool)

(declare-fun e!326913 () Bool)

(assert (=> b!568192 (= e!326913 e!326914)))

(declare-fun res!358533 () Bool)

(assert (=> b!568192 (=> (not res!358533) (not e!326914))))

(declare-fun lt!258726 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35635 (_ BitVec 32)) SeekEntryResult!5557)

(assert (=> b!568192 (= res!358533 (= lt!258727 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258726 (select (store (arr!17111 a!3118) i!1132 k0!1914) j!142) (array!35636 (store (arr!17111 a!3118) i!1132 k0!1914) (size!17476 a!3118)) mask!3119)))))

(declare-fun lt!258724 () (_ BitVec 32))

(assert (=> b!568192 (= lt!258727 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258724 (select (arr!17111 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568192 (= lt!258726 (toIndex!0 (select (store (arr!17111 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!568192 (= lt!258724 (toIndex!0 (select (arr!17111 a!3118) j!142) mask!3119))))

(declare-fun b!568193 () Bool)

(declare-fun res!358539 () Bool)

(assert (=> b!568193 (=> (not res!358539) (not e!326916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568193 (= res!358539 (validKeyInArray!0 k0!1914))))

(declare-fun b!568194 () Bool)

(assert (=> b!568194 (= e!326916 e!326913)))

(declare-fun res!358537 () Bool)

(assert (=> b!568194 (=> (not res!358537) (not e!326913))))

(declare-fun lt!258722 () SeekEntryResult!5557)

(assert (=> b!568194 (= res!358537 (or (= lt!258722 (MissingZero!5557 i!1132)) (= lt!258722 (MissingVacant!5557 i!1132))))))

(assert (=> b!568194 (= lt!258722 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!568195 () Bool)

(declare-fun res!358538 () Bool)

(assert (=> b!568195 (=> (not res!358538) (not e!326913))))

(declare-datatypes ((List!11230 0))(
  ( (Nil!11227) (Cons!11226 (h!12244 (_ BitVec 64)) (t!17449 List!11230)) )
))
(declare-fun arrayNoDuplicates!0 (array!35635 (_ BitVec 32) List!11230) Bool)

(assert (=> b!568195 (= res!358538 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11227))))

(declare-fun res!358534 () Bool)

(assert (=> start!52046 (=> (not res!358534) (not e!326916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52046 (= res!358534 (validMask!0 mask!3119))))

(assert (=> start!52046 e!326916))

(assert (=> start!52046 true))

(declare-fun array_inv!12994 (array!35635) Bool)

(assert (=> start!52046 (array_inv!12994 a!3118)))

(declare-fun b!568196 () Bool)

(declare-fun res!358540 () Bool)

(assert (=> b!568196 (=> (not res!358540) (not e!326913))))

(assert (=> b!568196 (= res!358540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568197 () Bool)

(declare-fun res!358535 () Bool)

(assert (=> b!568197 (=> (not res!358535) (not e!326916))))

(assert (=> b!568197 (= res!358535 (validKeyInArray!0 (select (arr!17111 a!3118) j!142)))))

(declare-fun b!568198 () Bool)

(declare-fun res!358536 () Bool)

(assert (=> b!568198 (=> (not res!358536) (not e!326916))))

(assert (=> b!568198 (= res!358536 (and (= (size!17476 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17476 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17476 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52046 res!358534) b!568198))

(assert (= (and b!568198 res!358536) b!568197))

(assert (= (and b!568197 res!358535) b!568193))

(assert (= (and b!568193 res!358539) b!568190))

(assert (= (and b!568190 res!358541) b!568194))

(assert (= (and b!568194 res!358537) b!568196))

(assert (= (and b!568196 res!358540) b!568195))

(assert (= (and b!568195 res!358538) b!568192))

(assert (= (and b!568192 res!358533) b!568191))

(declare-fun m!546227 () Bool)

(assert (=> b!568194 m!546227))

(declare-fun m!546229 () Bool)

(assert (=> start!52046 m!546229))

(declare-fun m!546231 () Bool)

(assert (=> start!52046 m!546231))

(declare-fun m!546233 () Bool)

(assert (=> b!568196 m!546233))

(declare-fun m!546235 () Bool)

(assert (=> b!568190 m!546235))

(declare-fun m!546237 () Bool)

(assert (=> b!568193 m!546237))

(declare-fun m!546239 () Bool)

(assert (=> b!568192 m!546239))

(declare-fun m!546241 () Bool)

(assert (=> b!568192 m!546241))

(assert (=> b!568192 m!546239))

(assert (=> b!568192 m!546239))

(declare-fun m!546243 () Bool)

(assert (=> b!568192 m!546243))

(declare-fun m!546245 () Bool)

(assert (=> b!568192 m!546245))

(declare-fun m!546247 () Bool)

(assert (=> b!568192 m!546247))

(assert (=> b!568192 m!546245))

(declare-fun m!546249 () Bool)

(assert (=> b!568192 m!546249))

(assert (=> b!568192 m!546245))

(declare-fun m!546251 () Bool)

(assert (=> b!568192 m!546251))

(assert (=> b!568197 m!546239))

(assert (=> b!568197 m!546239))

(declare-fun m!546253 () Bool)

(assert (=> b!568197 m!546253))

(declare-fun m!546255 () Bool)

(assert (=> b!568195 m!546255))

(assert (=> b!568191 m!546239))

(declare-fun m!546257 () Bool)

(assert (=> b!568191 m!546257))

(declare-fun m!546259 () Bool)

(assert (=> b!568191 m!546259))

(declare-fun m!546261 () Bool)

(assert (=> b!568191 m!546261))

(assert (=> b!568191 m!546239))

(declare-fun m!546263 () Bool)

(assert (=> b!568191 m!546263))

(check-sat (not b!568193) (not b!568196) (not b!568195) (not b!568194) (not b!568190) (not b!568191) (not start!52046) (not b!568197) (not b!568192))
(check-sat)
(get-model)

(declare-fun b!568263 () Bool)

(declare-fun e!326952 () Bool)

(declare-fun e!326950 () Bool)

(assert (=> b!568263 (= e!326952 e!326950)))

(declare-fun res!358604 () Bool)

(assert (=> b!568263 (=> (not res!358604) (not e!326950))))

(declare-fun e!326951 () Bool)

(assert (=> b!568263 (= res!358604 (not e!326951))))

(declare-fun res!358603 () Bool)

(assert (=> b!568263 (=> (not res!358603) (not e!326951))))

(assert (=> b!568263 (= res!358603 (validKeyInArray!0 (select (arr!17111 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84275 () Bool)

(declare-fun res!358602 () Bool)

(assert (=> d!84275 (=> res!358602 e!326952)))

(assert (=> d!84275 (= res!358602 (bvsge #b00000000000000000000000000000000 (size!17476 a!3118)))))

(assert (=> d!84275 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11227) e!326952)))

(declare-fun b!568264 () Bool)

(declare-fun e!326949 () Bool)

(declare-fun call!32539 () Bool)

(assert (=> b!568264 (= e!326949 call!32539)))

(declare-fun b!568265 () Bool)

(assert (=> b!568265 (= e!326950 e!326949)))

(declare-fun c!65184 () Bool)

(assert (=> b!568265 (= c!65184 (validKeyInArray!0 (select (arr!17111 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568266 () Bool)

(declare-fun contains!2855 (List!11230 (_ BitVec 64)) Bool)

(assert (=> b!568266 (= e!326951 (contains!2855 Nil!11227 (select (arr!17111 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568267 () Bool)

(assert (=> b!568267 (= e!326949 call!32539)))

(declare-fun bm!32536 () Bool)

(assert (=> bm!32536 (= call!32539 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65184 (Cons!11226 (select (arr!17111 a!3118) #b00000000000000000000000000000000) Nil!11227) Nil!11227)))))

(assert (= (and d!84275 (not res!358602)) b!568263))

(assert (= (and b!568263 res!358603) b!568266))

(assert (= (and b!568263 res!358604) b!568265))

(assert (= (and b!568265 c!65184) b!568264))

(assert (= (and b!568265 (not c!65184)) b!568267))

(assert (= (or b!568264 b!568267) bm!32536))

(declare-fun m!546341 () Bool)

(assert (=> b!568263 m!546341))

(assert (=> b!568263 m!546341))

(declare-fun m!546343 () Bool)

(assert (=> b!568263 m!546343))

(assert (=> b!568265 m!546341))

(assert (=> b!568265 m!546341))

(assert (=> b!568265 m!546343))

(assert (=> b!568266 m!546341))

(assert (=> b!568266 m!546341))

(declare-fun m!546345 () Bool)

(assert (=> b!568266 m!546345))

(assert (=> bm!32536 m!546341))

(declare-fun m!546347 () Bool)

(assert (=> bm!32536 m!546347))

(assert (=> b!568195 d!84275))

(declare-fun d!84277 () Bool)

(declare-fun res!358609 () Bool)

(declare-fun e!326957 () Bool)

(assert (=> d!84277 (=> res!358609 e!326957)))

(assert (=> d!84277 (= res!358609 (= (select (arr!17111 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84277 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!326957)))

(declare-fun b!568272 () Bool)

(declare-fun e!326958 () Bool)

(assert (=> b!568272 (= e!326957 e!326958)))

(declare-fun res!358610 () Bool)

(assert (=> b!568272 (=> (not res!358610) (not e!326958))))

(assert (=> b!568272 (= res!358610 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17476 a!3118)))))

(declare-fun b!568273 () Bool)

(assert (=> b!568273 (= e!326958 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84277 (not res!358609)) b!568272))

(assert (= (and b!568272 res!358610) b!568273))

(assert (=> d!84277 m!546341))

(declare-fun m!546349 () Bool)

(assert (=> b!568273 m!546349))

(assert (=> b!568190 d!84277))

(declare-fun d!84281 () Bool)

(declare-fun lt!258780 () SeekEntryResult!5557)

(assert (=> d!84281 (and (or ((_ is Undefined!5557) lt!258780) (not ((_ is Found!5557) lt!258780)) (and (bvsge (index!24456 lt!258780) #b00000000000000000000000000000000) (bvslt (index!24456 lt!258780) (size!17476 a!3118)))) (or ((_ is Undefined!5557) lt!258780) ((_ is Found!5557) lt!258780) (not ((_ is MissingZero!5557) lt!258780)) (and (bvsge (index!24455 lt!258780) #b00000000000000000000000000000000) (bvslt (index!24455 lt!258780) (size!17476 a!3118)))) (or ((_ is Undefined!5557) lt!258780) ((_ is Found!5557) lt!258780) ((_ is MissingZero!5557) lt!258780) (not ((_ is MissingVacant!5557) lt!258780)) (and (bvsge (index!24458 lt!258780) #b00000000000000000000000000000000) (bvslt (index!24458 lt!258780) (size!17476 a!3118)))) (or ((_ is Undefined!5557) lt!258780) (ite ((_ is Found!5557) lt!258780) (= (select (arr!17111 a!3118) (index!24456 lt!258780)) (select (arr!17111 a!3118) j!142)) (ite ((_ is MissingZero!5557) lt!258780) (= (select (arr!17111 a!3118) (index!24455 lt!258780)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5557) lt!258780) (= (select (arr!17111 a!3118) (index!24458 lt!258780)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!326975 () SeekEntryResult!5557)

(assert (=> d!84281 (= lt!258780 e!326975)))

(declare-fun c!65194 () Bool)

(declare-fun lt!258781 () SeekEntryResult!5557)

(assert (=> d!84281 (= c!65194 (and ((_ is Intermediate!5557) lt!258781) (undefined!6369 lt!258781)))))

(assert (=> d!84281 (= lt!258781 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17111 a!3118) j!142) mask!3119) (select (arr!17111 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84281 (validMask!0 mask!3119)))

(assert (=> d!84281 (= (seekEntryOrOpen!0 (select (arr!17111 a!3118) j!142) a!3118 mask!3119) lt!258780)))

(declare-fun b!568298 () Bool)

(declare-fun e!326974 () SeekEntryResult!5557)

(assert (=> b!568298 (= e!326974 (Found!5557 (index!24457 lt!258781)))))

(declare-fun b!568299 () Bool)

(assert (=> b!568299 (= e!326975 e!326974)))

(declare-fun lt!258779 () (_ BitVec 64))

(assert (=> b!568299 (= lt!258779 (select (arr!17111 a!3118) (index!24457 lt!258781)))))

(declare-fun c!65196 () Bool)

(assert (=> b!568299 (= c!65196 (= lt!258779 (select (arr!17111 a!3118) j!142)))))

(declare-fun e!326976 () SeekEntryResult!5557)

(declare-fun b!568300 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35635 (_ BitVec 32)) SeekEntryResult!5557)

(assert (=> b!568300 (= e!326976 (seekKeyOrZeroReturnVacant!0 (x!53341 lt!258781) (index!24457 lt!258781) (index!24457 lt!258781) (select (arr!17111 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!568301 () Bool)

(declare-fun c!65195 () Bool)

(assert (=> b!568301 (= c!65195 (= lt!258779 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568301 (= e!326974 e!326976)))

(declare-fun b!568302 () Bool)

(assert (=> b!568302 (= e!326975 Undefined!5557)))

(declare-fun b!568303 () Bool)

(assert (=> b!568303 (= e!326976 (MissingZero!5557 (index!24457 lt!258781)))))

(assert (= (and d!84281 c!65194) b!568302))

(assert (= (and d!84281 (not c!65194)) b!568299))

(assert (= (and b!568299 c!65196) b!568298))

(assert (= (and b!568299 (not c!65196)) b!568301))

(assert (= (and b!568301 c!65195) b!568303))

(assert (= (and b!568301 (not c!65195)) b!568300))

(declare-fun m!546363 () Bool)

(assert (=> d!84281 m!546363))

(assert (=> d!84281 m!546239))

(assert (=> d!84281 m!546241))

(assert (=> d!84281 m!546241))

(assert (=> d!84281 m!546239))

(declare-fun m!546365 () Bool)

(assert (=> d!84281 m!546365))

(declare-fun m!546367 () Bool)

(assert (=> d!84281 m!546367))

(assert (=> d!84281 m!546229))

(declare-fun m!546369 () Bool)

(assert (=> d!84281 m!546369))

(declare-fun m!546371 () Bool)

(assert (=> b!568299 m!546371))

(assert (=> b!568300 m!546239))

(declare-fun m!546373 () Bool)

(assert (=> b!568300 m!546373))

(assert (=> b!568191 d!84281))

(declare-fun b!568348 () Bool)

(declare-fun e!327005 () Bool)

(declare-fun call!32545 () Bool)

(assert (=> b!568348 (= e!327005 call!32545)))

(declare-fun b!568349 () Bool)

(declare-fun e!327003 () Bool)

(assert (=> b!568349 (= e!327003 call!32545)))

(declare-fun d!84289 () Bool)

(declare-fun res!358634 () Bool)

(declare-fun e!327004 () Bool)

(assert (=> d!84289 (=> res!358634 e!327004)))

(assert (=> d!84289 (= res!358634 (bvsge j!142 (size!17476 a!3118)))))

(assert (=> d!84289 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!327004)))

(declare-fun bm!32542 () Bool)

(assert (=> bm!32542 (= call!32545 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!568350 () Bool)

(assert (=> b!568350 (= e!327005 e!327003)))

(declare-fun lt!258798 () (_ BitVec 64))

(assert (=> b!568350 (= lt!258798 (select (arr!17111 a!3118) j!142))))

(declare-fun lt!258797 () Unit!17802)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35635 (_ BitVec 64) (_ BitVec 32)) Unit!17802)

(assert (=> b!568350 (= lt!258797 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258798 j!142))))

(assert (=> b!568350 (arrayContainsKey!0 a!3118 lt!258798 #b00000000000000000000000000000000)))

(declare-fun lt!258796 () Unit!17802)

(assert (=> b!568350 (= lt!258796 lt!258797)))

(declare-fun res!358633 () Bool)

(assert (=> b!568350 (= res!358633 (= (seekEntryOrOpen!0 (select (arr!17111 a!3118) j!142) a!3118 mask!3119) (Found!5557 j!142)))))

(assert (=> b!568350 (=> (not res!358633) (not e!327003))))

(declare-fun b!568351 () Bool)

(assert (=> b!568351 (= e!327004 e!327005)))

(declare-fun c!65211 () Bool)

(assert (=> b!568351 (= c!65211 (validKeyInArray!0 (select (arr!17111 a!3118) j!142)))))

(assert (= (and d!84289 (not res!358634)) b!568351))

(assert (= (and b!568351 c!65211) b!568350))

(assert (= (and b!568351 (not c!65211)) b!568348))

(assert (= (and b!568350 res!358633) b!568349))

(assert (= (or b!568349 b!568348) bm!32542))

(declare-fun m!546375 () Bool)

(assert (=> bm!32542 m!546375))

(assert (=> b!568350 m!546239))

(declare-fun m!546377 () Bool)

(assert (=> b!568350 m!546377))

(declare-fun m!546379 () Bool)

(assert (=> b!568350 m!546379))

(assert (=> b!568350 m!546239))

(assert (=> b!568350 m!546263))

(assert (=> b!568351 m!546239))

(assert (=> b!568351 m!546239))

(assert (=> b!568351 m!546253))

(assert (=> b!568191 d!84289))

(declare-fun d!84291 () Bool)

(assert (=> d!84291 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258809 () Unit!17802)

(declare-fun choose!38 (array!35635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17802)

(assert (=> d!84291 (= lt!258809 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84291 (validMask!0 mask!3119)))

(assert (=> d!84291 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258809)))

(declare-fun bs!17608 () Bool)

(assert (= bs!17608 d!84291))

(assert (=> bs!17608 m!546257))

(declare-fun m!546413 () Bool)

(assert (=> bs!17608 m!546413))

(assert (=> bs!17608 m!546229))

(assert (=> b!568191 d!84291))

(declare-fun b!568388 () Bool)

(declare-fun e!327028 () Bool)

(declare-fun call!32546 () Bool)

(assert (=> b!568388 (= e!327028 call!32546)))

(declare-fun b!568389 () Bool)

(declare-fun e!327026 () Bool)

(assert (=> b!568389 (= e!327026 call!32546)))

(declare-fun d!84301 () Bool)

(declare-fun res!358650 () Bool)

(declare-fun e!327027 () Bool)

(assert (=> d!84301 (=> res!358650 e!327027)))

(assert (=> d!84301 (= res!358650 (bvsge #b00000000000000000000000000000000 (size!17476 a!3118)))))

(assert (=> d!84301 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!327027)))

(declare-fun bm!32543 () Bool)

(assert (=> bm!32543 (= call!32546 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!568390 () Bool)

(assert (=> b!568390 (= e!327028 e!327026)))

(declare-fun lt!258812 () (_ BitVec 64))

(assert (=> b!568390 (= lt!258812 (select (arr!17111 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258811 () Unit!17802)

(assert (=> b!568390 (= lt!258811 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258812 #b00000000000000000000000000000000))))

(assert (=> b!568390 (arrayContainsKey!0 a!3118 lt!258812 #b00000000000000000000000000000000)))

(declare-fun lt!258810 () Unit!17802)

(assert (=> b!568390 (= lt!258810 lt!258811)))

(declare-fun res!358649 () Bool)

(assert (=> b!568390 (= res!358649 (= (seekEntryOrOpen!0 (select (arr!17111 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5557 #b00000000000000000000000000000000)))))

(assert (=> b!568390 (=> (not res!358649) (not e!327026))))

(declare-fun b!568391 () Bool)

(assert (=> b!568391 (= e!327027 e!327028)))

(declare-fun c!65224 () Bool)

(assert (=> b!568391 (= c!65224 (validKeyInArray!0 (select (arr!17111 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84301 (not res!358650)) b!568391))

(assert (= (and b!568391 c!65224) b!568390))

(assert (= (and b!568391 (not c!65224)) b!568388))

(assert (= (and b!568390 res!358649) b!568389))

(assert (= (or b!568389 b!568388) bm!32543))

(declare-fun m!546415 () Bool)

(assert (=> bm!32543 m!546415))

(assert (=> b!568390 m!546341))

(declare-fun m!546417 () Bool)

(assert (=> b!568390 m!546417))

(declare-fun m!546419 () Bool)

(assert (=> b!568390 m!546419))

(assert (=> b!568390 m!546341))

(declare-fun m!546421 () Bool)

(assert (=> b!568390 m!546421))

(assert (=> b!568391 m!546341))

(assert (=> b!568391 m!546341))

(assert (=> b!568391 m!546343))

(assert (=> b!568196 d!84301))

(declare-fun d!84303 () Bool)

(assert (=> d!84303 (= (validKeyInArray!0 (select (arr!17111 a!3118) j!142)) (and (not (= (select (arr!17111 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17111 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!568197 d!84303))

(declare-fun lt!258842 () SeekEntryResult!5557)

(declare-fun b!568422 () Bool)

(assert (=> b!568422 (and (bvsge (index!24457 lt!258842) #b00000000000000000000000000000000) (bvslt (index!24457 lt!258842) (size!17476 (array!35636 (store (arr!17111 a!3118) i!1132 k0!1914) (size!17476 a!3118)))))))

(declare-fun res!358663 () Bool)

(assert (=> b!568422 (= res!358663 (= (select (arr!17111 (array!35636 (store (arr!17111 a!3118) i!1132 k0!1914) (size!17476 a!3118))) (index!24457 lt!258842)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327049 () Bool)

(assert (=> b!568422 (=> res!358663 e!327049)))

(declare-fun b!568423 () Bool)

(declare-fun e!327050 () SeekEntryResult!5557)

(assert (=> b!568423 (= e!327050 (Intermediate!5557 true lt!258726 #b00000000000000000000000000000000))))

(declare-fun b!568424 () Bool)

(assert (=> b!568424 (and (bvsge (index!24457 lt!258842) #b00000000000000000000000000000000) (bvslt (index!24457 lt!258842) (size!17476 (array!35636 (store (arr!17111 a!3118) i!1132 k0!1914) (size!17476 a!3118)))))))

(declare-fun res!358664 () Bool)

(assert (=> b!568424 (= res!358664 (= (select (arr!17111 (array!35636 (store (arr!17111 a!3118) i!1132 k0!1914) (size!17476 a!3118))) (index!24457 lt!258842)) (select (store (arr!17111 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!568424 (=> res!358664 e!327049)))

(declare-fun e!327051 () Bool)

(assert (=> b!568424 (= e!327051 e!327049)))

(declare-fun b!568425 () Bool)

(declare-fun e!327048 () SeekEntryResult!5557)

(assert (=> b!568425 (= e!327050 e!327048)))

(declare-fun c!65236 () Bool)

(declare-fun lt!258843 () (_ BitVec 64))

(assert (=> b!568425 (= c!65236 (or (= lt!258843 (select (store (arr!17111 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!258843 lt!258843) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!568426 () Bool)

(assert (=> b!568426 (= e!327048 (Intermediate!5557 false lt!258726 #b00000000000000000000000000000000))))

(declare-fun b!568428 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568428 (= e!327048 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258726 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17111 a!3118) i!1132 k0!1914) j!142) (array!35636 (store (arr!17111 a!3118) i!1132 k0!1914) (size!17476 a!3118)) mask!3119))))

(declare-fun b!568429 () Bool)

(declare-fun e!327052 () Bool)

(assert (=> b!568429 (= e!327052 (bvsge (x!53341 lt!258842) #b01111111111111111111111111111110))))

(declare-fun b!568430 () Bool)

(assert (=> b!568430 (= e!327052 e!327051)))

(declare-fun res!358665 () Bool)

(assert (=> b!568430 (= res!358665 (and ((_ is Intermediate!5557) lt!258842) (not (undefined!6369 lt!258842)) (bvslt (x!53341 lt!258842) #b01111111111111111111111111111110) (bvsge (x!53341 lt!258842) #b00000000000000000000000000000000) (bvsge (x!53341 lt!258842) #b00000000000000000000000000000000)))))

(assert (=> b!568430 (=> (not res!358665) (not e!327051))))

(declare-fun b!568427 () Bool)

(assert (=> b!568427 (and (bvsge (index!24457 lt!258842) #b00000000000000000000000000000000) (bvslt (index!24457 lt!258842) (size!17476 (array!35636 (store (arr!17111 a!3118) i!1132 k0!1914) (size!17476 a!3118)))))))

(assert (=> b!568427 (= e!327049 (= (select (arr!17111 (array!35636 (store (arr!17111 a!3118) i!1132 k0!1914) (size!17476 a!3118))) (index!24457 lt!258842)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!84305 () Bool)

(assert (=> d!84305 e!327052))

(declare-fun c!65234 () Bool)

(assert (=> d!84305 (= c!65234 (and ((_ is Intermediate!5557) lt!258842) (undefined!6369 lt!258842)))))

(assert (=> d!84305 (= lt!258842 e!327050)))

(declare-fun c!65235 () Bool)

(assert (=> d!84305 (= c!65235 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84305 (= lt!258843 (select (arr!17111 (array!35636 (store (arr!17111 a!3118) i!1132 k0!1914) (size!17476 a!3118))) lt!258726))))

(assert (=> d!84305 (validMask!0 mask!3119)))

(assert (=> d!84305 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258726 (select (store (arr!17111 a!3118) i!1132 k0!1914) j!142) (array!35636 (store (arr!17111 a!3118) i!1132 k0!1914) (size!17476 a!3118)) mask!3119) lt!258842)))

(assert (= (and d!84305 c!65235) b!568423))

(assert (= (and d!84305 (not c!65235)) b!568425))

(assert (= (and b!568425 c!65236) b!568426))

(assert (= (and b!568425 (not c!65236)) b!568428))

(assert (= (and d!84305 c!65234) b!568429))

(assert (= (and d!84305 (not c!65234)) b!568430))

(assert (= (and b!568430 res!358665) b!568424))

(assert (= (and b!568424 (not res!358664)) b!568422))

(assert (= (and b!568422 (not res!358663)) b!568427))

(declare-fun m!546435 () Bool)

(assert (=> d!84305 m!546435))

(assert (=> d!84305 m!546229))

(declare-fun m!546437 () Bool)

(assert (=> b!568422 m!546437))

(declare-fun m!546439 () Bool)

(assert (=> b!568428 m!546439))

(assert (=> b!568428 m!546439))

(assert (=> b!568428 m!546245))

(declare-fun m!546441 () Bool)

(assert (=> b!568428 m!546441))

(assert (=> b!568427 m!546437))

(assert (=> b!568424 m!546437))

(assert (=> b!568192 d!84305))

(declare-fun b!568431 () Bool)

(declare-fun lt!258844 () SeekEntryResult!5557)

(assert (=> b!568431 (and (bvsge (index!24457 lt!258844) #b00000000000000000000000000000000) (bvslt (index!24457 lt!258844) (size!17476 a!3118)))))

(declare-fun res!358666 () Bool)

(assert (=> b!568431 (= res!358666 (= (select (arr!17111 a!3118) (index!24457 lt!258844)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327054 () Bool)

(assert (=> b!568431 (=> res!358666 e!327054)))

(declare-fun b!568432 () Bool)

(declare-fun e!327055 () SeekEntryResult!5557)

(assert (=> b!568432 (= e!327055 (Intermediate!5557 true lt!258724 #b00000000000000000000000000000000))))

(declare-fun b!568433 () Bool)

(assert (=> b!568433 (and (bvsge (index!24457 lt!258844) #b00000000000000000000000000000000) (bvslt (index!24457 lt!258844) (size!17476 a!3118)))))

(declare-fun res!358667 () Bool)

(assert (=> b!568433 (= res!358667 (= (select (arr!17111 a!3118) (index!24457 lt!258844)) (select (arr!17111 a!3118) j!142)))))

(assert (=> b!568433 (=> res!358667 e!327054)))

(declare-fun e!327056 () Bool)

(assert (=> b!568433 (= e!327056 e!327054)))

(declare-fun b!568434 () Bool)

(declare-fun e!327053 () SeekEntryResult!5557)

(assert (=> b!568434 (= e!327055 e!327053)))

(declare-fun lt!258845 () (_ BitVec 64))

(declare-fun c!65239 () Bool)

(assert (=> b!568434 (= c!65239 (or (= lt!258845 (select (arr!17111 a!3118) j!142)) (= (bvadd lt!258845 lt!258845) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!568435 () Bool)

(assert (=> b!568435 (= e!327053 (Intermediate!5557 false lt!258724 #b00000000000000000000000000000000))))

(declare-fun b!568437 () Bool)

(assert (=> b!568437 (= e!327053 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258724 #b00000000000000000000000000000000 mask!3119) (select (arr!17111 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!568438 () Bool)

(declare-fun e!327057 () Bool)

(assert (=> b!568438 (= e!327057 (bvsge (x!53341 lt!258844) #b01111111111111111111111111111110))))

(declare-fun b!568439 () Bool)

(assert (=> b!568439 (= e!327057 e!327056)))

(declare-fun res!358668 () Bool)

(assert (=> b!568439 (= res!358668 (and ((_ is Intermediate!5557) lt!258844) (not (undefined!6369 lt!258844)) (bvslt (x!53341 lt!258844) #b01111111111111111111111111111110) (bvsge (x!53341 lt!258844) #b00000000000000000000000000000000) (bvsge (x!53341 lt!258844) #b00000000000000000000000000000000)))))

(assert (=> b!568439 (=> (not res!358668) (not e!327056))))

(declare-fun b!568436 () Bool)

(assert (=> b!568436 (and (bvsge (index!24457 lt!258844) #b00000000000000000000000000000000) (bvslt (index!24457 lt!258844) (size!17476 a!3118)))))

(assert (=> b!568436 (= e!327054 (= (select (arr!17111 a!3118) (index!24457 lt!258844)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!84325 () Bool)

(assert (=> d!84325 e!327057))

(declare-fun c!65237 () Bool)

(assert (=> d!84325 (= c!65237 (and ((_ is Intermediate!5557) lt!258844) (undefined!6369 lt!258844)))))

(assert (=> d!84325 (= lt!258844 e!327055)))

(declare-fun c!65238 () Bool)

(assert (=> d!84325 (= c!65238 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84325 (= lt!258845 (select (arr!17111 a!3118) lt!258724))))

(assert (=> d!84325 (validMask!0 mask!3119)))

(assert (=> d!84325 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258724 (select (arr!17111 a!3118) j!142) a!3118 mask!3119) lt!258844)))

(assert (= (and d!84325 c!65238) b!568432))

(assert (= (and d!84325 (not c!65238)) b!568434))

(assert (= (and b!568434 c!65239) b!568435))

(assert (= (and b!568434 (not c!65239)) b!568437))

(assert (= (and d!84325 c!65237) b!568438))

(assert (= (and d!84325 (not c!65237)) b!568439))

(assert (= (and b!568439 res!358668) b!568433))

(assert (= (and b!568433 (not res!358667)) b!568431))

(assert (= (and b!568431 (not res!358666)) b!568436))

(declare-fun m!546443 () Bool)

(assert (=> d!84325 m!546443))

(assert (=> d!84325 m!546229))

(declare-fun m!546445 () Bool)

(assert (=> b!568431 m!546445))

(declare-fun m!546447 () Bool)

(assert (=> b!568437 m!546447))

(assert (=> b!568437 m!546447))

(assert (=> b!568437 m!546239))

(declare-fun m!546449 () Bool)

(assert (=> b!568437 m!546449))

(assert (=> b!568436 m!546445))

(assert (=> b!568433 m!546445))

(assert (=> b!568192 d!84325))

(declare-fun d!84327 () Bool)

(declare-fun lt!258857 () (_ BitVec 32))

(declare-fun lt!258856 () (_ BitVec 32))

(assert (=> d!84327 (= lt!258857 (bvmul (bvxor lt!258856 (bvlshr lt!258856 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84327 (= lt!258856 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17111 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17111 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84327 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358669 (let ((h!12249 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17111 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17111 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53349 (bvmul (bvxor h!12249 (bvlshr h!12249 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53349 (bvlshr x!53349 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358669 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358669 #b00000000000000000000000000000000))))))

(assert (=> d!84327 (= (toIndex!0 (select (store (arr!17111 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!258857 (bvlshr lt!258857 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!568192 d!84327))

(declare-fun d!84329 () Bool)

(declare-fun lt!258859 () (_ BitVec 32))

(declare-fun lt!258858 () (_ BitVec 32))

(assert (=> d!84329 (= lt!258859 (bvmul (bvxor lt!258858 (bvlshr lt!258858 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84329 (= lt!258858 ((_ extract 31 0) (bvand (bvxor (select (arr!17111 a!3118) j!142) (bvlshr (select (arr!17111 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84329 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358669 (let ((h!12249 ((_ extract 31 0) (bvand (bvxor (select (arr!17111 a!3118) j!142) (bvlshr (select (arr!17111 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53349 (bvmul (bvxor h!12249 (bvlshr h!12249 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53349 (bvlshr x!53349 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358669 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358669 #b00000000000000000000000000000000))))))

(assert (=> d!84329 (= (toIndex!0 (select (arr!17111 a!3118) j!142) mask!3119) (bvand (bvxor lt!258859 (bvlshr lt!258859 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!568192 d!84329))

(declare-fun d!84331 () Bool)

(assert (=> d!84331 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!568193 d!84331))

(declare-fun d!84333 () Bool)

(declare-fun lt!258861 () SeekEntryResult!5557)

(assert (=> d!84333 (and (or ((_ is Undefined!5557) lt!258861) (not ((_ is Found!5557) lt!258861)) (and (bvsge (index!24456 lt!258861) #b00000000000000000000000000000000) (bvslt (index!24456 lt!258861) (size!17476 a!3118)))) (or ((_ is Undefined!5557) lt!258861) ((_ is Found!5557) lt!258861) (not ((_ is MissingZero!5557) lt!258861)) (and (bvsge (index!24455 lt!258861) #b00000000000000000000000000000000) (bvslt (index!24455 lt!258861) (size!17476 a!3118)))) (or ((_ is Undefined!5557) lt!258861) ((_ is Found!5557) lt!258861) ((_ is MissingZero!5557) lt!258861) (not ((_ is MissingVacant!5557) lt!258861)) (and (bvsge (index!24458 lt!258861) #b00000000000000000000000000000000) (bvslt (index!24458 lt!258861) (size!17476 a!3118)))) (or ((_ is Undefined!5557) lt!258861) (ite ((_ is Found!5557) lt!258861) (= (select (arr!17111 a!3118) (index!24456 lt!258861)) k0!1914) (ite ((_ is MissingZero!5557) lt!258861) (= (select (arr!17111 a!3118) (index!24455 lt!258861)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5557) lt!258861) (= (select (arr!17111 a!3118) (index!24458 lt!258861)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!327065 () SeekEntryResult!5557)

(assert (=> d!84333 (= lt!258861 e!327065)))

(declare-fun c!65246 () Bool)

(declare-fun lt!258862 () SeekEntryResult!5557)

(assert (=> d!84333 (= c!65246 (and ((_ is Intermediate!5557) lt!258862) (undefined!6369 lt!258862)))))

(assert (=> d!84333 (= lt!258862 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84333 (validMask!0 mask!3119)))

(assert (=> d!84333 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!258861)))

(declare-fun b!568452 () Bool)

(declare-fun e!327064 () SeekEntryResult!5557)

(assert (=> b!568452 (= e!327064 (Found!5557 (index!24457 lt!258862)))))

(declare-fun b!568453 () Bool)

(assert (=> b!568453 (= e!327065 e!327064)))

(declare-fun lt!258860 () (_ BitVec 64))

(assert (=> b!568453 (= lt!258860 (select (arr!17111 a!3118) (index!24457 lt!258862)))))

(declare-fun c!65248 () Bool)

(assert (=> b!568453 (= c!65248 (= lt!258860 k0!1914))))

(declare-fun b!568454 () Bool)

(declare-fun e!327066 () SeekEntryResult!5557)

(assert (=> b!568454 (= e!327066 (seekKeyOrZeroReturnVacant!0 (x!53341 lt!258862) (index!24457 lt!258862) (index!24457 lt!258862) k0!1914 a!3118 mask!3119))))

(declare-fun b!568455 () Bool)

(declare-fun c!65247 () Bool)

(assert (=> b!568455 (= c!65247 (= lt!258860 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568455 (= e!327064 e!327066)))

(declare-fun b!568456 () Bool)

(assert (=> b!568456 (= e!327065 Undefined!5557)))

(declare-fun b!568457 () Bool)

(assert (=> b!568457 (= e!327066 (MissingZero!5557 (index!24457 lt!258862)))))

(assert (= (and d!84333 c!65246) b!568456))

(assert (= (and d!84333 (not c!65246)) b!568453))

(assert (= (and b!568453 c!65248) b!568452))

(assert (= (and b!568453 (not c!65248)) b!568455))

(assert (= (and b!568455 c!65247) b!568457))

(assert (= (and b!568455 (not c!65247)) b!568454))

(declare-fun m!546451 () Bool)

(assert (=> d!84333 m!546451))

(declare-fun m!546453 () Bool)

(assert (=> d!84333 m!546453))

(assert (=> d!84333 m!546453))

(declare-fun m!546455 () Bool)

(assert (=> d!84333 m!546455))

(declare-fun m!546457 () Bool)

(assert (=> d!84333 m!546457))

(assert (=> d!84333 m!546229))

(declare-fun m!546459 () Bool)

(assert (=> d!84333 m!546459))

(declare-fun m!546461 () Bool)

(assert (=> b!568453 m!546461))

(declare-fun m!546463 () Bool)

(assert (=> b!568454 m!546463))

(assert (=> b!568194 d!84333))

(declare-fun d!84335 () Bool)

(assert (=> d!84335 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52046 d!84335))

(declare-fun d!84343 () Bool)

(assert (=> d!84343 (= (array_inv!12994 a!3118) (bvsge (size!17476 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52046 d!84343))

(check-sat (not bm!32543) (not b!568265) (not d!84291) (not b!568428) (not b!568390) (not d!84333) (not b!568300) (not b!568391) (not bm!32536) (not d!84281) (not b!568266) (not d!84305) (not b!568437) (not d!84325) (not b!568351) (not b!568350) (not b!568454) (not b!568273) (not b!568263) (not bm!32542))
(check-sat)
