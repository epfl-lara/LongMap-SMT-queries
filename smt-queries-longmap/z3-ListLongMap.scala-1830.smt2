; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33068 () Bool)

(assert start!33068)

(declare-fun b!329007 () Bool)

(declare-fun res!181346 () Bool)

(declare-fun e!202119 () Bool)

(assert (=> b!329007 (=> (not res!181346) (not e!202119))))

(declare-datatypes ((array!16833 0))(
  ( (array!16834 (arr!7962 (Array (_ BitVec 32) (_ BitVec 64))) (size!8315 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16833)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16833 (_ BitVec 32)) Bool)

(assert (=> b!329007 (= res!181346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!329008 () Bool)

(declare-fun e!202121 () Bool)

(assert (=> b!329008 (= e!202119 e!202121)))

(declare-fun res!181344 () Bool)

(assert (=> b!329008 (=> (not res!181344) (not e!202121))))

(declare-datatypes ((SeekEntryResult!3092 0))(
  ( (MissingZero!3092 (index!14544 (_ BitVec 32))) (Found!3092 (index!14545 (_ BitVec 32))) (Intermediate!3092 (undefined!3904 Bool) (index!14546 (_ BitVec 32)) (x!32828 (_ BitVec 32))) (Undefined!3092) (MissingVacant!3092 (index!14547 (_ BitVec 32))) )
))
(declare-fun lt!157937 () SeekEntryResult!3092)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16833 (_ BitVec 32)) SeekEntryResult!3092)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329008 (= res!181344 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157937))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!329008 (= lt!157937 (Intermediate!3092 false resIndex!58 resX!58))))

(declare-fun b!329009 () Bool)

(declare-fun res!181340 () Bool)

(assert (=> b!329009 (=> (not res!181340) (not e!202119))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16833 (_ BitVec 32)) SeekEntryResult!3092)

(assert (=> b!329009 (= res!181340 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3092 i!1250)))))

(declare-fun b!329010 () Bool)

(declare-fun res!181338 () Bool)

(assert (=> b!329010 (=> (not res!181338) (not e!202119))))

(declare-fun arrayContainsKey!0 (array!16833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329010 (= res!181338 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!329011 () Bool)

(declare-fun res!181343 () Bool)

(assert (=> b!329011 (=> (not res!181343) (not e!202121))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!329011 (= res!181343 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157937))))

(declare-fun res!181347 () Bool)

(assert (=> start!33068 (=> (not res!181347) (not e!202119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33068 (= res!181347 (validMask!0 mask!3777))))

(assert (=> start!33068 e!202119))

(declare-fun array_inv!5934 (array!16833) Bool)

(assert (=> start!33068 (array_inv!5934 a!3305)))

(assert (=> start!33068 true))

(declare-fun b!329012 () Bool)

(declare-fun res!181339 () Bool)

(assert (=> b!329012 (=> (not res!181339) (not e!202121))))

(assert (=> b!329012 (= res!181339 (and (= (select (arr!7962 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8315 a!3305))))))

(declare-fun b!329013 () Bool)

(declare-fun res!181342 () Bool)

(assert (=> b!329013 (=> (not res!181342) (not e!202121))))

(assert (=> b!329013 (= res!181342 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7962 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7962 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7962 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!329014 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329014 (= e!202121 (not ((_ is Intermediate!3092) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))))

(declare-fun b!329015 () Bool)

(declare-fun res!181341 () Bool)

(assert (=> b!329015 (=> (not res!181341) (not e!202119))))

(assert (=> b!329015 (= res!181341 (and (= (size!8315 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8315 a!3305))))))

(declare-fun b!329016 () Bool)

(declare-fun res!181345 () Bool)

(assert (=> b!329016 (=> (not res!181345) (not e!202119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329016 (= res!181345 (validKeyInArray!0 k0!2497))))

(assert (= (and start!33068 res!181347) b!329015))

(assert (= (and b!329015 res!181341) b!329016))

(assert (= (and b!329016 res!181345) b!329010))

(assert (= (and b!329010 res!181338) b!329009))

(assert (= (and b!329009 res!181340) b!329007))

(assert (= (and b!329007 res!181346) b!329008))

(assert (= (and b!329008 res!181344) b!329012))

(assert (= (and b!329012 res!181339) b!329011))

(assert (= (and b!329011 res!181343) b!329013))

(assert (= (and b!329013 res!181342) b!329014))

(declare-fun m!334261 () Bool)

(assert (=> b!329014 m!334261))

(assert (=> b!329014 m!334261))

(declare-fun m!334263 () Bool)

(assert (=> b!329014 m!334263))

(declare-fun m!334265 () Bool)

(assert (=> b!329016 m!334265))

(declare-fun m!334267 () Bool)

(assert (=> b!329008 m!334267))

(assert (=> b!329008 m!334267))

(declare-fun m!334269 () Bool)

(assert (=> b!329008 m!334269))

(declare-fun m!334271 () Bool)

(assert (=> start!33068 m!334271))

(declare-fun m!334273 () Bool)

(assert (=> start!33068 m!334273))

(declare-fun m!334275 () Bool)

(assert (=> b!329013 m!334275))

(declare-fun m!334277 () Bool)

(assert (=> b!329009 m!334277))

(declare-fun m!334279 () Bool)

(assert (=> b!329011 m!334279))

(declare-fun m!334281 () Bool)

(assert (=> b!329010 m!334281))

(declare-fun m!334283 () Bool)

(assert (=> b!329012 m!334283))

(declare-fun m!334285 () Bool)

(assert (=> b!329007 m!334285))

(check-sat (not b!329016) (not b!329007) (not b!329011) (not b!329008) (not start!33068) (not b!329010) (not b!329009) (not b!329014))
(check-sat)
(get-model)

(declare-fun b!329085 () Bool)

(declare-fun e!202146 () Bool)

(declare-fun e!202148 () Bool)

(assert (=> b!329085 (= e!202146 e!202148)))

(declare-fun c!51476 () Bool)

(assert (=> b!329085 (= c!51476 (validKeyInArray!0 (select (arr!7962 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!329086 () Bool)

(declare-fun e!202147 () Bool)

(assert (=> b!329086 (= e!202148 e!202147)))

(declare-fun lt!157951 () (_ BitVec 64))

(assert (=> b!329086 (= lt!157951 (select (arr!7962 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10172 0))(
  ( (Unit!10173) )
))
(declare-fun lt!157950 () Unit!10172)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16833 (_ BitVec 64) (_ BitVec 32)) Unit!10172)

(assert (=> b!329086 (= lt!157950 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157951 #b00000000000000000000000000000000))))

(assert (=> b!329086 (arrayContainsKey!0 a!3305 lt!157951 #b00000000000000000000000000000000)))

(declare-fun lt!157952 () Unit!10172)

(assert (=> b!329086 (= lt!157952 lt!157950)))

(declare-fun res!181413 () Bool)

(assert (=> b!329086 (= res!181413 (= (seekEntryOrOpen!0 (select (arr!7962 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3092 #b00000000000000000000000000000000)))))

(assert (=> b!329086 (=> (not res!181413) (not e!202147))))

(declare-fun d!69945 () Bool)

(declare-fun res!181412 () Bool)

(assert (=> d!69945 (=> res!181412 e!202146)))

(assert (=> d!69945 (= res!181412 (bvsge #b00000000000000000000000000000000 (size!8315 a!3305)))))

(assert (=> d!69945 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!202146)))

(declare-fun b!329087 () Bool)

(declare-fun call!26120 () Bool)

(assert (=> b!329087 (= e!202148 call!26120)))

(declare-fun b!329088 () Bool)

(assert (=> b!329088 (= e!202147 call!26120)))

(declare-fun bm!26117 () Bool)

(assert (=> bm!26117 (= call!26120 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(assert (= (and d!69945 (not res!181412)) b!329085))

(assert (= (and b!329085 c!51476) b!329086))

(assert (= (and b!329085 (not c!51476)) b!329087))

(assert (= (and b!329086 res!181413) b!329088))

(assert (= (or b!329088 b!329087) bm!26117))

(declare-fun m!334339 () Bool)

(assert (=> b!329085 m!334339))

(assert (=> b!329085 m!334339))

(declare-fun m!334341 () Bool)

(assert (=> b!329085 m!334341))

(assert (=> b!329086 m!334339))

(declare-fun m!334343 () Bool)

(assert (=> b!329086 m!334343))

(declare-fun m!334345 () Bool)

(assert (=> b!329086 m!334345))

(assert (=> b!329086 m!334339))

(declare-fun m!334347 () Bool)

(assert (=> b!329086 m!334347))

(declare-fun m!334349 () Bool)

(assert (=> bm!26117 m!334349))

(assert (=> b!329007 d!69945))

(declare-fun b!329107 () Bool)

(declare-fun e!202161 () SeekEntryResult!3092)

(assert (=> b!329107 (= e!202161 (Intermediate!3092 true index!1840 x!1490))))

(declare-fun b!329109 () Bool)

(declare-fun lt!157958 () SeekEntryResult!3092)

(assert (=> b!329109 (and (bvsge (index!14546 lt!157958) #b00000000000000000000000000000000) (bvslt (index!14546 lt!157958) (size!8315 a!3305)))))

(declare-fun res!181421 () Bool)

(assert (=> b!329109 (= res!181421 (= (select (arr!7962 a!3305) (index!14546 lt!157958)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202162 () Bool)

(assert (=> b!329109 (=> res!181421 e!202162)))

(declare-fun b!329110 () Bool)

(declare-fun e!202159 () Bool)

(assert (=> b!329110 (= e!202159 (bvsge (x!32828 lt!157958) #b01111111111111111111111111111110))))

(declare-fun e!202160 () SeekEntryResult!3092)

(declare-fun b!329111 () Bool)

(assert (=> b!329111 (= e!202160 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!329112 () Bool)

(declare-fun e!202163 () Bool)

(assert (=> b!329112 (= e!202159 e!202163)))

(declare-fun res!181422 () Bool)

(assert (=> b!329112 (= res!181422 (and ((_ is Intermediate!3092) lt!157958) (not (undefined!3904 lt!157958)) (bvslt (x!32828 lt!157958) #b01111111111111111111111111111110) (bvsge (x!32828 lt!157958) #b00000000000000000000000000000000) (bvsge (x!32828 lt!157958) x!1490)))))

(assert (=> b!329112 (=> (not res!181422) (not e!202163))))

(declare-fun b!329113 () Bool)

(assert (=> b!329113 (= e!202160 (Intermediate!3092 false index!1840 x!1490))))

(declare-fun b!329114 () Bool)

(assert (=> b!329114 (and (bvsge (index!14546 lt!157958) #b00000000000000000000000000000000) (bvslt (index!14546 lt!157958) (size!8315 a!3305)))))

(assert (=> b!329114 (= e!202162 (= (select (arr!7962 a!3305) (index!14546 lt!157958)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329115 () Bool)

(assert (=> b!329115 (and (bvsge (index!14546 lt!157958) #b00000000000000000000000000000000) (bvslt (index!14546 lt!157958) (size!8315 a!3305)))))

(declare-fun res!181420 () Bool)

(assert (=> b!329115 (= res!181420 (= (select (arr!7962 a!3305) (index!14546 lt!157958)) k0!2497))))

(assert (=> b!329115 (=> res!181420 e!202162)))

(assert (=> b!329115 (= e!202163 e!202162)))

(declare-fun b!329108 () Bool)

(assert (=> b!329108 (= e!202161 e!202160)))

(declare-fun c!51483 () Bool)

(declare-fun lt!157957 () (_ BitVec 64))

(assert (=> b!329108 (= c!51483 (or (= lt!157957 k0!2497) (= (bvadd lt!157957 lt!157957) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!69947 () Bool)

(assert (=> d!69947 e!202159))

(declare-fun c!51485 () Bool)

(assert (=> d!69947 (= c!51485 (and ((_ is Intermediate!3092) lt!157958) (undefined!3904 lt!157958)))))

(assert (=> d!69947 (= lt!157958 e!202161)))

(declare-fun c!51484 () Bool)

(assert (=> d!69947 (= c!51484 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!69947 (= lt!157957 (select (arr!7962 a!3305) index!1840))))

(assert (=> d!69947 (validMask!0 mask!3777)))

(assert (=> d!69947 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157958)))

(assert (= (and d!69947 c!51484) b!329107))

(assert (= (and d!69947 (not c!51484)) b!329108))

(assert (= (and b!329108 c!51483) b!329113))

(assert (= (and b!329108 (not c!51483)) b!329111))

(assert (= (and d!69947 c!51485) b!329110))

(assert (= (and d!69947 (not c!51485)) b!329112))

(assert (= (and b!329112 res!181422) b!329115))

(assert (= (and b!329115 (not res!181420)) b!329109))

(assert (= (and b!329109 (not res!181421)) b!329114))

(declare-fun m!334351 () Bool)

(assert (=> b!329109 m!334351))

(assert (=> d!69947 m!334275))

(assert (=> d!69947 m!334271))

(assert (=> b!329111 m!334261))

(assert (=> b!329111 m!334261))

(declare-fun m!334353 () Bool)

(assert (=> b!329111 m!334353))

(assert (=> b!329115 m!334351))

(assert (=> b!329114 m!334351))

(assert (=> b!329011 d!69947))

(declare-fun d!69951 () Bool)

(assert (=> d!69951 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!329016 d!69951))

(declare-fun d!69953 () Bool)

(declare-fun res!181427 () Bool)

(declare-fun e!202168 () Bool)

(assert (=> d!69953 (=> res!181427 e!202168)))

(assert (=> d!69953 (= res!181427 (= (select (arr!7962 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69953 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!202168)))

(declare-fun b!329120 () Bool)

(declare-fun e!202169 () Bool)

(assert (=> b!329120 (= e!202168 e!202169)))

(declare-fun res!181428 () Bool)

(assert (=> b!329120 (=> (not res!181428) (not e!202169))))

(assert (=> b!329120 (= res!181428 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8315 a!3305)))))

(declare-fun b!329121 () Bool)

(assert (=> b!329121 (= e!202169 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69953 (not res!181427)) b!329120))

(assert (= (and b!329120 res!181428) b!329121))

(assert (=> d!69953 m!334339))

(declare-fun m!334355 () Bool)

(assert (=> b!329121 m!334355))

(assert (=> b!329010 d!69953))

(declare-fun b!329179 () Bool)

(declare-fun e!202201 () SeekEntryResult!3092)

(declare-fun e!202200 () SeekEntryResult!3092)

(assert (=> b!329179 (= e!202201 e!202200)))

(declare-fun lt!157987 () (_ BitVec 64))

(declare-fun lt!157986 () SeekEntryResult!3092)

(assert (=> b!329179 (= lt!157987 (select (arr!7962 a!3305) (index!14546 lt!157986)))))

(declare-fun c!51512 () Bool)

(assert (=> b!329179 (= c!51512 (= lt!157987 k0!2497))))

(declare-fun b!329180 () Bool)

(assert (=> b!329180 (= e!202201 Undefined!3092)))

(declare-fun b!329181 () Bool)

(assert (=> b!329181 (= e!202200 (Found!3092 (index!14546 lt!157986)))))

(declare-fun d!69957 () Bool)

(declare-fun lt!157988 () SeekEntryResult!3092)

(assert (=> d!69957 (and (or ((_ is Undefined!3092) lt!157988) (not ((_ is Found!3092) lt!157988)) (and (bvsge (index!14545 lt!157988) #b00000000000000000000000000000000) (bvslt (index!14545 lt!157988) (size!8315 a!3305)))) (or ((_ is Undefined!3092) lt!157988) ((_ is Found!3092) lt!157988) (not ((_ is MissingZero!3092) lt!157988)) (and (bvsge (index!14544 lt!157988) #b00000000000000000000000000000000) (bvslt (index!14544 lt!157988) (size!8315 a!3305)))) (or ((_ is Undefined!3092) lt!157988) ((_ is Found!3092) lt!157988) ((_ is MissingZero!3092) lt!157988) (not ((_ is MissingVacant!3092) lt!157988)) (and (bvsge (index!14547 lt!157988) #b00000000000000000000000000000000) (bvslt (index!14547 lt!157988) (size!8315 a!3305)))) (or ((_ is Undefined!3092) lt!157988) (ite ((_ is Found!3092) lt!157988) (= (select (arr!7962 a!3305) (index!14545 lt!157988)) k0!2497) (ite ((_ is MissingZero!3092) lt!157988) (= (select (arr!7962 a!3305) (index!14544 lt!157988)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3092) lt!157988) (= (select (arr!7962 a!3305) (index!14547 lt!157988)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69957 (= lt!157988 e!202201)))

(declare-fun c!51510 () Bool)

(assert (=> d!69957 (= c!51510 (and ((_ is Intermediate!3092) lt!157986) (undefined!3904 lt!157986)))))

(assert (=> d!69957 (= lt!157986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69957 (validMask!0 mask!3777)))

(assert (=> d!69957 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157988)))

(declare-fun b!329182 () Bool)

(declare-fun e!202202 () SeekEntryResult!3092)

(assert (=> b!329182 (= e!202202 (MissingZero!3092 (index!14546 lt!157986)))))

(declare-fun b!329183 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16833 (_ BitVec 32)) SeekEntryResult!3092)

(assert (=> b!329183 (= e!202202 (seekKeyOrZeroReturnVacant!0 (x!32828 lt!157986) (index!14546 lt!157986) (index!14546 lt!157986) k0!2497 a!3305 mask!3777))))

(declare-fun b!329184 () Bool)

(declare-fun c!51511 () Bool)

(assert (=> b!329184 (= c!51511 (= lt!157987 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329184 (= e!202200 e!202202)))

(assert (= (and d!69957 c!51510) b!329180))

(assert (= (and d!69957 (not c!51510)) b!329179))

(assert (= (and b!329179 c!51512) b!329181))

(assert (= (and b!329179 (not c!51512)) b!329184))

(assert (= (and b!329184 c!51511) b!329182))

(assert (= (and b!329184 (not c!51511)) b!329183))

(declare-fun m!334375 () Bool)

(assert (=> b!329179 m!334375))

(assert (=> d!69957 m!334267))

(assert (=> d!69957 m!334267))

(assert (=> d!69957 m!334269))

(declare-fun m!334377 () Bool)

(assert (=> d!69957 m!334377))

(assert (=> d!69957 m!334271))

(declare-fun m!334379 () Bool)

(assert (=> d!69957 m!334379))

(declare-fun m!334381 () Bool)

(assert (=> d!69957 m!334381))

(declare-fun m!334383 () Bool)

(assert (=> b!329183 m!334383))

(assert (=> b!329009 d!69957))

(declare-fun e!202205 () SeekEntryResult!3092)

(declare-fun b!329185 () Bool)

(assert (=> b!329185 (= e!202205 (Intermediate!3092 true (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!329187 () Bool)

(declare-fun lt!157990 () SeekEntryResult!3092)

(assert (=> b!329187 (and (bvsge (index!14546 lt!157990) #b00000000000000000000000000000000) (bvslt (index!14546 lt!157990) (size!8315 a!3305)))))

(declare-fun res!181440 () Bool)

(assert (=> b!329187 (= res!181440 (= (select (arr!7962 a!3305) (index!14546 lt!157990)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202206 () Bool)

(assert (=> b!329187 (=> res!181440 e!202206)))

(declare-fun b!329188 () Bool)

(declare-fun e!202203 () Bool)

(assert (=> b!329188 (= e!202203 (bvsge (x!32828 lt!157990) #b01111111111111111111111111111110))))

(declare-fun e!202204 () SeekEntryResult!3092)

(declare-fun b!329189 () Bool)

(assert (=> b!329189 (= e!202204 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!329190 () Bool)

(declare-fun e!202207 () Bool)

(assert (=> b!329190 (= e!202203 e!202207)))

(declare-fun res!181441 () Bool)

(assert (=> b!329190 (= res!181441 (and ((_ is Intermediate!3092) lt!157990) (not (undefined!3904 lt!157990)) (bvslt (x!32828 lt!157990) #b01111111111111111111111111111110) (bvsge (x!32828 lt!157990) #b00000000000000000000000000000000) (bvsge (x!32828 lt!157990) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!329190 (=> (not res!181441) (not e!202207))))

(declare-fun b!329191 () Bool)

(assert (=> b!329191 (= e!202204 (Intermediate!3092 false (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!329192 () Bool)

(assert (=> b!329192 (and (bvsge (index!14546 lt!157990) #b00000000000000000000000000000000) (bvslt (index!14546 lt!157990) (size!8315 a!3305)))))

(assert (=> b!329192 (= e!202206 (= (select (arr!7962 a!3305) (index!14546 lt!157990)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329193 () Bool)

(assert (=> b!329193 (and (bvsge (index!14546 lt!157990) #b00000000000000000000000000000000) (bvslt (index!14546 lt!157990) (size!8315 a!3305)))))

(declare-fun res!181439 () Bool)

(assert (=> b!329193 (= res!181439 (= (select (arr!7962 a!3305) (index!14546 lt!157990)) k0!2497))))

(assert (=> b!329193 (=> res!181439 e!202206)))

(assert (=> b!329193 (= e!202207 e!202206)))

(declare-fun b!329186 () Bool)

(assert (=> b!329186 (= e!202205 e!202204)))

(declare-fun c!51513 () Bool)

(declare-fun lt!157989 () (_ BitVec 64))

(assert (=> b!329186 (= c!51513 (or (= lt!157989 k0!2497) (= (bvadd lt!157989 lt!157989) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!69965 () Bool)

(assert (=> d!69965 e!202203))

(declare-fun c!51515 () Bool)

(assert (=> d!69965 (= c!51515 (and ((_ is Intermediate!3092) lt!157990) (undefined!3904 lt!157990)))))

(assert (=> d!69965 (= lt!157990 e!202205)))

(declare-fun c!51514 () Bool)

(assert (=> d!69965 (= c!51514 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(assert (=> d!69965 (= lt!157989 (select (arr!7962 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)))))

(assert (=> d!69965 (validMask!0 mask!3777)))

(assert (=> d!69965 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777) lt!157990)))

(assert (= (and d!69965 c!51514) b!329185))

(assert (= (and d!69965 (not c!51514)) b!329186))

(assert (= (and b!329186 c!51513) b!329191))

(assert (= (and b!329186 (not c!51513)) b!329189))

(assert (= (and d!69965 c!51515) b!329188))

(assert (= (and d!69965 (not c!51515)) b!329190))

(assert (= (and b!329190 res!181441) b!329193))

(assert (= (and b!329193 (not res!181439)) b!329187))

(assert (= (and b!329187 (not res!181440)) b!329192))

(declare-fun m!334385 () Bool)

(assert (=> b!329187 m!334385))

(assert (=> d!69965 m!334261))

(declare-fun m!334387 () Bool)

(assert (=> d!69965 m!334387))

(assert (=> d!69965 m!334271))

(assert (=> b!329189 m!334261))

(declare-fun m!334389 () Bool)

(assert (=> b!329189 m!334389))

(assert (=> b!329189 m!334389))

(declare-fun m!334391 () Bool)

(assert (=> b!329189 m!334391))

(assert (=> b!329193 m!334385))

(assert (=> b!329192 m!334385))

(assert (=> b!329014 d!69965))

(declare-fun d!69967 () Bool)

(declare-fun lt!157993 () (_ BitVec 32))

(assert (=> d!69967 (and (bvsge lt!157993 #b00000000000000000000000000000000) (bvslt lt!157993 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69967 (= lt!157993 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!69967 (validMask!0 mask!3777)))

(assert (=> d!69967 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!157993)))

(declare-fun bs!11378 () Bool)

(assert (= bs!11378 d!69967))

(declare-fun m!334397 () Bool)

(assert (=> bs!11378 m!334397))

(assert (=> bs!11378 m!334271))

(assert (=> b!329014 d!69967))

(declare-fun b!329200 () Bool)

(declare-fun e!202216 () SeekEntryResult!3092)

(assert (=> b!329200 (= e!202216 (Intermediate!3092 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329202 () Bool)

(declare-fun lt!157995 () SeekEntryResult!3092)

(assert (=> b!329202 (and (bvsge (index!14546 lt!157995) #b00000000000000000000000000000000) (bvslt (index!14546 lt!157995) (size!8315 a!3305)))))

(declare-fun res!181449 () Bool)

(assert (=> b!329202 (= res!181449 (= (select (arr!7962 a!3305) (index!14546 lt!157995)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202217 () Bool)

(assert (=> b!329202 (=> res!181449 e!202217)))

(declare-fun b!329203 () Bool)

(declare-fun e!202214 () Bool)

(assert (=> b!329203 (= e!202214 (bvsge (x!32828 lt!157995) #b01111111111111111111111111111110))))

(declare-fun e!202215 () SeekEntryResult!3092)

(declare-fun b!329204 () Bool)

(assert (=> b!329204 (= e!202215 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!329205 () Bool)

(declare-fun e!202218 () Bool)

(assert (=> b!329205 (= e!202214 e!202218)))

(declare-fun res!181450 () Bool)

(assert (=> b!329205 (= res!181450 (and ((_ is Intermediate!3092) lt!157995) (not (undefined!3904 lt!157995)) (bvslt (x!32828 lt!157995) #b01111111111111111111111111111110) (bvsge (x!32828 lt!157995) #b00000000000000000000000000000000) (bvsge (x!32828 lt!157995) #b00000000000000000000000000000000)))))

(assert (=> b!329205 (=> (not res!181450) (not e!202218))))

(declare-fun b!329206 () Bool)

(assert (=> b!329206 (= e!202215 (Intermediate!3092 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329207 () Bool)

(assert (=> b!329207 (and (bvsge (index!14546 lt!157995) #b00000000000000000000000000000000) (bvslt (index!14546 lt!157995) (size!8315 a!3305)))))

(assert (=> b!329207 (= e!202217 (= (select (arr!7962 a!3305) (index!14546 lt!157995)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329208 () Bool)

(assert (=> b!329208 (and (bvsge (index!14546 lt!157995) #b00000000000000000000000000000000) (bvslt (index!14546 lt!157995) (size!8315 a!3305)))))

(declare-fun res!181448 () Bool)

(assert (=> b!329208 (= res!181448 (= (select (arr!7962 a!3305) (index!14546 lt!157995)) k0!2497))))

(assert (=> b!329208 (=> res!181448 e!202217)))

(assert (=> b!329208 (= e!202218 e!202217)))

(declare-fun b!329201 () Bool)

(assert (=> b!329201 (= e!202216 e!202215)))

(declare-fun c!51516 () Bool)

(declare-fun lt!157994 () (_ BitVec 64))

(assert (=> b!329201 (= c!51516 (or (= lt!157994 k0!2497) (= (bvadd lt!157994 lt!157994) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!69971 () Bool)

(assert (=> d!69971 e!202214))

(declare-fun c!51518 () Bool)

(assert (=> d!69971 (= c!51518 (and ((_ is Intermediate!3092) lt!157995) (undefined!3904 lt!157995)))))

(assert (=> d!69971 (= lt!157995 e!202216)))

(declare-fun c!51517 () Bool)

(assert (=> d!69971 (= c!51517 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69971 (= lt!157994 (select (arr!7962 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69971 (validMask!0 mask!3777)))

(assert (=> d!69971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157995)))

(assert (= (and d!69971 c!51517) b!329200))

(assert (= (and d!69971 (not c!51517)) b!329201))

(assert (= (and b!329201 c!51516) b!329206))

(assert (= (and b!329201 (not c!51516)) b!329204))

(assert (= (and d!69971 c!51518) b!329203))

(assert (= (and d!69971 (not c!51518)) b!329205))

(assert (= (and b!329205 res!181450) b!329208))

(assert (= (and b!329208 (not res!181448)) b!329202))

(assert (= (and b!329202 (not res!181449)) b!329207))

(declare-fun m!334399 () Bool)

(assert (=> b!329202 m!334399))

(assert (=> d!69971 m!334267))

(declare-fun m!334401 () Bool)

(assert (=> d!69971 m!334401))

(assert (=> d!69971 m!334271))

(assert (=> b!329204 m!334267))

(declare-fun m!334403 () Bool)

(assert (=> b!329204 m!334403))

(assert (=> b!329204 m!334403))

(declare-fun m!334405 () Bool)

(assert (=> b!329204 m!334405))

(assert (=> b!329208 m!334399))

(assert (=> b!329207 m!334399))

(assert (=> b!329008 d!69971))

(declare-fun d!69973 () Bool)

(declare-fun lt!158003 () (_ BitVec 32))

(declare-fun lt!158002 () (_ BitVec 32))

(assert (=> d!69973 (= lt!158003 (bvmul (bvxor lt!158002 (bvlshr lt!158002 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69973 (= lt!158002 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69973 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!181451 (let ((h!5384 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32835 (bvmul (bvxor h!5384 (bvlshr h!5384 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32835 (bvlshr x!32835 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!181451 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!181451 #b00000000000000000000000000000000))))))

(assert (=> d!69973 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!158003 (bvlshr lt!158003 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!329008 d!69973))

(declare-fun d!69981 () Bool)

(assert (=> d!69981 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33068 d!69981))

(declare-fun d!69985 () Bool)

(assert (=> d!69985 (= (array_inv!5934 a!3305) (bvsge (size!8315 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33068 d!69985))

(check-sat (not b!329189) (not d!69947) (not d!69965) (not d!69957) (not d!69971) (not b!329183) (not b!329121) (not b!329086) (not bm!26117) (not b!329111) (not b!329085) (not b!329204) (not d!69967))
(check-sat)
