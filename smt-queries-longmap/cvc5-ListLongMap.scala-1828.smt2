; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33022 () Bool)

(assert start!33022)

(declare-fun res!181239 () Bool)

(declare-fun e!202102 () Bool)

(assert (=> start!33022 (=> (not res!181239) (not e!202102))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33022 (= res!181239 (validMask!0 mask!3777))))

(assert (=> start!33022 e!202102))

(declare-datatypes ((array!16828 0))(
  ( (array!16829 (arr!7961 (Array (_ BitVec 32) (_ BitVec 64))) (size!8313 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16828)

(declare-fun array_inv!5924 (array!16828) Bool)

(assert (=> start!33022 (array_inv!5924 a!3305)))

(assert (=> start!33022 true))

(declare-datatypes ((SeekEntryResult!3092 0))(
  ( (MissingZero!3092 (index!14544 (_ BitVec 32))) (Found!3092 (index!14545 (_ BitVec 32))) (Intermediate!3092 (undefined!3904 Bool) (index!14546 (_ BitVec 32)) (x!32811 (_ BitVec 32))) (Undefined!3092) (MissingVacant!3092 (index!14547 (_ BitVec 32))) )
))
(declare-fun lt!158043 () SeekEntryResult!3092)

(declare-fun b!328909 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun lt!158042 () SeekEntryResult!3092)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun e!202100 () Bool)

(assert (=> b!328909 (= e!202100 (and (= lt!158043 lt!158042) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7961 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7961 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7961 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!158043 (Intermediate!3092 false index!1840 resX!58)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16828 (_ BitVec 32)) SeekEntryResult!3092)

(assert (=> b!328909 (= lt!158043 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!328910 () Bool)

(declare-fun res!181235 () Bool)

(assert (=> b!328910 (=> (not res!181235) (not e!202102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16828 (_ BitVec 32)) Bool)

(assert (=> b!328910 (= res!181235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328911 () Bool)

(declare-fun res!181241 () Bool)

(assert (=> b!328911 (=> (not res!181241) (not e!202102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328911 (= res!181241 (validKeyInArray!0 k!2497))))

(declare-fun b!328912 () Bool)

(declare-fun res!181242 () Bool)

(assert (=> b!328912 (=> (not res!181242) (not e!202102))))

(declare-fun arrayContainsKey!0 (array!16828 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328912 (= res!181242 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328913 () Bool)

(declare-fun res!181238 () Bool)

(assert (=> b!328913 (=> (not res!181238) (not e!202102))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16828 (_ BitVec 32)) SeekEntryResult!3092)

(assert (=> b!328913 (= res!181238 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3092 i!1250)))))

(declare-fun b!328914 () Bool)

(assert (=> b!328914 (= e!202102 e!202100)))

(declare-fun res!181237 () Bool)

(assert (=> b!328914 (=> (not res!181237) (not e!202100))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328914 (= res!181237 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158042))))

(assert (=> b!328914 (= lt!158042 (Intermediate!3092 false resIndex!58 resX!58))))

(declare-fun b!328915 () Bool)

(declare-fun res!181240 () Bool)

(assert (=> b!328915 (=> (not res!181240) (not e!202102))))

(assert (=> b!328915 (= res!181240 (and (= (size!8313 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8313 a!3305))))))

(declare-fun b!328916 () Bool)

(declare-fun res!181236 () Bool)

(assert (=> b!328916 (=> (not res!181236) (not e!202100))))

(assert (=> b!328916 (= res!181236 (and (= (select (arr!7961 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8313 a!3305))))))

(assert (= (and start!33022 res!181239) b!328915))

(assert (= (and b!328915 res!181240) b!328911))

(assert (= (and b!328911 res!181241) b!328912))

(assert (= (and b!328912 res!181242) b!328913))

(assert (= (and b!328913 res!181238) b!328910))

(assert (= (and b!328910 res!181235) b!328914))

(assert (= (and b!328914 res!181237) b!328916))

(assert (= (and b!328916 res!181236) b!328909))

(declare-fun m!334745 () Bool)

(assert (=> b!328910 m!334745))

(declare-fun m!334747 () Bool)

(assert (=> b!328914 m!334747))

(assert (=> b!328914 m!334747))

(declare-fun m!334749 () Bool)

(assert (=> b!328914 m!334749))

(declare-fun m!334751 () Bool)

(assert (=> b!328913 m!334751))

(declare-fun m!334753 () Bool)

(assert (=> b!328911 m!334753))

(declare-fun m!334755 () Bool)

(assert (=> start!33022 m!334755))

(declare-fun m!334757 () Bool)

(assert (=> start!33022 m!334757))

(declare-fun m!334759 () Bool)

(assert (=> b!328912 m!334759))

(declare-fun m!334761 () Bool)

(assert (=> b!328916 m!334761))

(declare-fun m!334763 () Bool)

(assert (=> b!328909 m!334763))

(declare-fun m!334765 () Bool)

(assert (=> b!328909 m!334765))

(push 1)

(assert (not b!328909))

(assert (not b!328913))

(assert (not b!328912))

(assert (not b!328914))

(assert (not b!328910))

(assert (not start!33022))

(assert (not b!328911))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70095 () Bool)

(declare-fun e!202144 () Bool)

(assert (=> d!70095 e!202144))

(declare-fun c!51491 () Bool)

(declare-fun lt!158070 () SeekEntryResult!3092)

(assert (=> d!70095 (= c!51491 (and (is-Intermediate!3092 lt!158070) (undefined!3904 lt!158070)))))

(declare-fun e!202141 () SeekEntryResult!3092)

(assert (=> d!70095 (= lt!158070 e!202141)))

(declare-fun c!51490 () Bool)

(assert (=> d!70095 (= c!51490 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!158069 () (_ BitVec 64))

(assert (=> d!70095 (= lt!158069 (select (arr!7961 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!70095 (validMask!0 mask!3777)))

(assert (=> d!70095 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158070)))

(declare-fun b!329001 () Bool)

(assert (=> b!329001 (= e!202141 (Intermediate!3092 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329002 () Bool)

(declare-fun e!202143 () SeekEntryResult!3092)

(assert (=> b!329002 (= e!202143 (Intermediate!3092 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329003 () Bool)

(assert (=> b!329003 (and (bvsge (index!14546 lt!158070) #b00000000000000000000000000000000) (bvslt (index!14546 lt!158070) (size!8313 a!3305)))))

(declare-fun e!202142 () Bool)

(assert (=> b!329003 (= e!202142 (= (select (arr!7961 a!3305) (index!14546 lt!158070)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329004 () Bool)

(assert (=> b!329004 (= e!202144 (bvsge (x!32811 lt!158070) #b01111111111111111111111111111110))))

(declare-fun b!329005 () Bool)

(declare-fun e!202140 () Bool)

(assert (=> b!329005 (= e!202144 e!202140)))

(declare-fun res!181299 () Bool)

(assert (=> b!329005 (= res!181299 (and (is-Intermediate!3092 lt!158070) (not (undefined!3904 lt!158070)) (bvslt (x!32811 lt!158070) #b01111111111111111111111111111110) (bvsge (x!32811 lt!158070) #b00000000000000000000000000000000) (bvsge (x!32811 lt!158070) #b00000000000000000000000000000000)))))

(assert (=> b!329005 (=> (not res!181299) (not e!202140))))

(declare-fun b!329006 () Bool)

(assert (=> b!329006 (= e!202141 e!202143)))

(declare-fun c!51492 () Bool)

(assert (=> b!329006 (= c!51492 (or (= lt!158069 k!2497) (= (bvadd lt!158069 lt!158069) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329007 () Bool)

(assert (=> b!329007 (and (bvsge (index!14546 lt!158070) #b00000000000000000000000000000000) (bvslt (index!14546 lt!158070) (size!8313 a!3305)))))

(declare-fun res!181298 () Bool)

(assert (=> b!329007 (= res!181298 (= (select (arr!7961 a!3305) (index!14546 lt!158070)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329007 (=> res!181298 e!202142)))

(declare-fun b!329008 () Bool)

(assert (=> b!329008 (and (bvsge (index!14546 lt!158070) #b00000000000000000000000000000000) (bvslt (index!14546 lt!158070) (size!8313 a!3305)))))

(declare-fun res!181297 () Bool)

(assert (=> b!329008 (= res!181297 (= (select (arr!7961 a!3305) (index!14546 lt!158070)) k!2497))))

(assert (=> b!329008 (=> res!181297 e!202142)))

(assert (=> b!329008 (= e!202140 e!202142)))

(declare-fun b!329009 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329009 (= e!202143 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(assert (= (and d!70095 c!51490) b!329001))

(assert (= (and d!70095 (not c!51490)) b!329006))

(assert (= (and b!329006 c!51492) b!329002))

(assert (= (and b!329006 (not c!51492)) b!329009))

(assert (= (and d!70095 c!51491) b!329004))

(assert (= (and d!70095 (not c!51491)) b!329005))

(assert (= (and b!329005 res!181299) b!329008))

(assert (= (and b!329008 (not res!181297)) b!329007))

(assert (= (and b!329007 (not res!181298)) b!329003))

(declare-fun m!334821 () Bool)

(assert (=> b!329003 m!334821))

(assert (=> b!329007 m!334821))

(assert (=> d!70095 m!334747))

(declare-fun m!334823 () Bool)

(assert (=> d!70095 m!334823))

(assert (=> d!70095 m!334755))

(assert (=> b!329008 m!334821))

(assert (=> b!329009 m!334747))

(declare-fun m!334825 () Bool)

(assert (=> b!329009 m!334825))

(assert (=> b!329009 m!334825))

(declare-fun m!334827 () Bool)

(assert (=> b!329009 m!334827))

(assert (=> b!328914 d!70095))

(declare-fun d!70109 () Bool)

(declare-fun lt!158080 () (_ BitVec 32))

(declare-fun lt!158079 () (_ BitVec 32))

(assert (=> d!70109 (= lt!158080 (bvmul (bvxor lt!158079 (bvlshr lt!158079 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70109 (= lt!158079 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70109 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!181300 (let ((h!5412 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32815 (bvmul (bvxor h!5412 (bvlshr h!5412 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32815 (bvlshr x!32815 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!181300 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!181300 #b00000000000000000000000000000000))))))

(assert (=> d!70109 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!158080 (bvlshr lt!158080 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!328914 d!70109))

(declare-fun d!70111 () Bool)

(declare-fun e!202159 () Bool)

(assert (=> d!70111 e!202159))

(declare-fun c!51500 () Bool)

(declare-fun lt!158082 () SeekEntryResult!3092)

(assert (=> d!70111 (= c!51500 (and (is-Intermediate!3092 lt!158082) (undefined!3904 lt!158082)))))

(declare-fun e!202156 () SeekEntryResult!3092)

(assert (=> d!70111 (= lt!158082 e!202156)))

(declare-fun c!51499 () Bool)

(assert (=> d!70111 (= c!51499 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!158081 () (_ BitVec 64))

(assert (=> d!70111 (= lt!158081 (select (arr!7961 a!3305) index!1840))))

(assert (=> d!70111 (validMask!0 mask!3777)))

(assert (=> d!70111 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158082)))

(declare-fun b!329028 () Bool)

(assert (=> b!329028 (= e!202156 (Intermediate!3092 true index!1840 x!1490))))

(declare-fun b!329029 () Bool)

(declare-fun e!202158 () SeekEntryResult!3092)

(assert (=> b!329029 (= e!202158 (Intermediate!3092 false index!1840 x!1490))))

(declare-fun b!329030 () Bool)

(assert (=> b!329030 (and (bvsge (index!14546 lt!158082) #b00000000000000000000000000000000) (bvslt (index!14546 lt!158082) (size!8313 a!3305)))))

(declare-fun e!202157 () Bool)

(assert (=> b!329030 (= e!202157 (= (select (arr!7961 a!3305) (index!14546 lt!158082)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329031 () Bool)

(assert (=> b!329031 (= e!202159 (bvsge (x!32811 lt!158082) #b01111111111111111111111111111110))))

(declare-fun b!329032 () Bool)

(declare-fun e!202155 () Bool)

(assert (=> b!329032 (= e!202159 e!202155)))

(declare-fun res!181309 () Bool)

(assert (=> b!329032 (= res!181309 (and (is-Intermediate!3092 lt!158082) (not (undefined!3904 lt!158082)) (bvslt (x!32811 lt!158082) #b01111111111111111111111111111110) (bvsge (x!32811 lt!158082) #b00000000000000000000000000000000) (bvsge (x!32811 lt!158082) x!1490)))))

(assert (=> b!329032 (=> (not res!181309) (not e!202155))))

(declare-fun b!329033 () Bool)

(assert (=> b!329033 (= e!202156 e!202158)))

(declare-fun c!51501 () Bool)

(assert (=> b!329033 (= c!51501 (or (= lt!158081 k!2497) (= (bvadd lt!158081 lt!158081) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329034 () Bool)

(assert (=> b!329034 (and (bvsge (index!14546 lt!158082) #b00000000000000000000000000000000) (bvslt (index!14546 lt!158082) (size!8313 a!3305)))))

(declare-fun res!181308 () Bool)

(assert (=> b!329034 (= res!181308 (= (select (arr!7961 a!3305) (index!14546 lt!158082)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329034 (=> res!181308 e!202157)))

(declare-fun b!329035 () Bool)

(assert (=> b!329035 (and (bvsge (index!14546 lt!158082) #b00000000000000000000000000000000) (bvslt (index!14546 lt!158082) (size!8313 a!3305)))))

(declare-fun res!181307 () Bool)

(assert (=> b!329035 (= res!181307 (= (select (arr!7961 a!3305) (index!14546 lt!158082)) k!2497))))

(assert (=> b!329035 (=> res!181307 e!202157)))

(assert (=> b!329035 (= e!202155 e!202157)))

(declare-fun b!329036 () Bool)

(assert (=> b!329036 (= e!202158 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(assert (= (and d!70111 c!51499) b!329028))

(assert (= (and d!70111 (not c!51499)) b!329033))

(assert (= (and b!329033 c!51501) b!329029))

(assert (= (and b!329033 (not c!51501)) b!329036))

(assert (= (and d!70111 c!51500) b!329031))

(assert (= (and d!70111 (not c!51500)) b!329032))

(assert (= (and b!329032 res!181309) b!329035))

(assert (= (and b!329035 (not res!181307)) b!329034))

(assert (= (and b!329034 (not res!181308)) b!329030))

(declare-fun m!334829 () Bool)

(assert (=> b!329030 m!334829))

(assert (=> b!329034 m!334829))

(assert (=> d!70111 m!334763))

(assert (=> d!70111 m!334755))

(assert (=> b!329035 m!334829))

(declare-fun m!334831 () Bool)

(assert (=> b!329036 m!334831))

(assert (=> b!329036 m!334831))

(declare-fun m!334833 () Bool)

(assert (=> b!329036 m!334833))

(assert (=> b!328909 d!70111))

(declare-fun b!329103 () Bool)

(declare-fun c!51528 () Bool)

(declare-fun lt!158111 () (_ BitVec 64))

(assert (=> b!329103 (= c!51528 (= lt!158111 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202198 () SeekEntryResult!3092)

(declare-fun e!202199 () SeekEntryResult!3092)

(assert (=> b!329103 (= e!202198 e!202199)))

(declare-fun b!329104 () Bool)

(declare-fun e!202200 () SeekEntryResult!3092)

(assert (=> b!329104 (= e!202200 e!202198)))

(declare-fun lt!158109 () SeekEntryResult!3092)

(assert (=> b!329104 (= lt!158111 (select (arr!7961 a!3305) (index!14546 lt!158109)))))

(declare-fun c!51526 () Bool)

(assert (=> b!329104 (= c!51526 (= lt!158111 k!2497))))

(declare-fun b!329105 () Bool)

(assert (=> b!329105 (= e!202199 (MissingZero!3092 (index!14546 lt!158109)))))

(declare-fun b!329106 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16828 (_ BitVec 32)) SeekEntryResult!3092)

(assert (=> b!329106 (= e!202199 (seekKeyOrZeroReturnVacant!0 (x!32811 lt!158109) (index!14546 lt!158109) (index!14546 lt!158109) k!2497 a!3305 mask!3777))))

(declare-fun d!70113 () Bool)

(declare-fun lt!158110 () SeekEntryResult!3092)

(assert (=> d!70113 (and (or (is-Undefined!3092 lt!158110) (not (is-Found!3092 lt!158110)) (and (bvsge (index!14545 lt!158110) #b00000000000000000000000000000000) (bvslt (index!14545 lt!158110) (size!8313 a!3305)))) (or (is-Undefined!3092 lt!158110) (is-Found!3092 lt!158110) (not (is-MissingZero!3092 lt!158110)) (and (bvsge (index!14544 lt!158110) #b00000000000000000000000000000000) (bvslt (index!14544 lt!158110) (size!8313 a!3305)))) (or (is-Undefined!3092 lt!158110) (is-Found!3092 lt!158110) (is-MissingZero!3092 lt!158110) (not (is-MissingVacant!3092 lt!158110)) (and (bvsge (index!14547 lt!158110) #b00000000000000000000000000000000) (bvslt (index!14547 lt!158110) (size!8313 a!3305)))) (or (is-Undefined!3092 lt!158110) (ite (is-Found!3092 lt!158110) (= (select (arr!7961 a!3305) (index!14545 lt!158110)) k!2497) (ite (is-MissingZero!3092 lt!158110) (= (select (arr!7961 a!3305) (index!14544 lt!158110)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3092 lt!158110) (= (select (arr!7961 a!3305) (index!14547 lt!158110)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70113 (= lt!158110 e!202200)))

(declare-fun c!51527 () Bool)

(assert (=> d!70113 (= c!51527 (and (is-Intermediate!3092 lt!158109) (undefined!3904 lt!158109)))))

(assert (=> d!70113 (= lt!158109 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!70113 (validMask!0 mask!3777)))

(assert (=> d!70113 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!158110)))

(declare-fun b!329107 () Bool)

(assert (=> b!329107 (= e!202198 (Found!3092 (index!14546 lt!158109)))))

(declare-fun b!329108 () Bool)

(assert (=> b!329108 (= e!202200 Undefined!3092)))

(assert (= (and d!70113 c!51527) b!329108))

(assert (= (and d!70113 (not c!51527)) b!329104))

(assert (= (and b!329104 c!51526) b!329107))

(assert (= (and b!329104 (not c!51526)) b!329103))

(assert (= (and b!329103 c!51528) b!329105))

(assert (= (and b!329103 (not c!51528)) b!329106))

(declare-fun m!334853 () Bool)

(assert (=> b!329104 m!334853))

(declare-fun m!334855 () Bool)

(assert (=> b!329106 m!334855))

(declare-fun m!334857 () Bool)

(assert (=> d!70113 m!334857))

(declare-fun m!334859 () Bool)

(assert (=> d!70113 m!334859))

(assert (=> d!70113 m!334747))

(assert (=> d!70113 m!334747))

(assert (=> d!70113 m!334749))

(declare-fun m!334861 () Bool)

(assert (=> d!70113 m!334861))

(assert (=> d!70113 m!334755))

(assert (=> b!328913 d!70113))

(declare-fun d!70123 () Bool)

(declare-fun res!181337 () Bool)

(declare-fun e!202214 () Bool)

(assert (=> d!70123 (=> res!181337 e!202214)))

(assert (=> d!70123 (= res!181337 (= (select (arr!7961 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!70123 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!202214)))

(declare-fun b!329127 () Bool)

(declare-fun e!202215 () Bool)

(assert (=> b!329127 (= e!202214 e!202215)))

(declare-fun res!181338 () Bool)

(assert (=> b!329127 (=> (not res!181338) (not e!202215))))

(assert (=> b!329127 (= res!181338 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8313 a!3305)))))

(declare-fun b!329128 () Bool)

(assert (=> b!329128 (= e!202215 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70123 (not res!181337)) b!329127))

(assert (= (and b!329127 res!181338) b!329128))

(declare-fun m!334873 () Bool)

(assert (=> d!70123 m!334873))

(declare-fun m!334875 () Bool)

(assert (=> b!329128 m!334875))

(assert (=> b!328912 d!70123))

(declare-fun d!70127 () Bool)

(assert (=> d!70127 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33022 d!70127))

(declare-fun d!70131 () Bool)

(assert (=> d!70131 (= (array_inv!5924 a!3305) (bvsge (size!8313 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33022 d!70131))

(declare-fun d!70133 () Bool)

(assert (=> d!70133 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!328911 d!70133))

(declare-fun bm!26139 () Bool)

(declare-fun call!26142 () Bool)

(assert (=> bm!26139 (= call!26142 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!329158 () Bool)

(declare-fun e!202236 () Bool)

(declare-fun e!202238 () Bool)

(assert (=> b!329158 (= e!202236 e!202238)))

(declare-fun c!51542 () Bool)

(assert (=> b!329158 (= c!51542 (validKeyInArray!0 (select (arr!7961 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!329159 () Bool)

(assert (=> b!329159 (= e!202238 call!26142)))

(declare-fun b!329160 () Bool)

(declare-fun e!202237 () Bool)

(assert (=> b!329160 (= e!202237 call!26142)))

(declare-fun d!70139 () Bool)

(declare-fun res!181352 () Bool)

(assert (=> d!70139 (=> res!181352 e!202236)))

(assert (=> d!70139 (= res!181352 (bvsge #b00000000000000000000000000000000 (size!8313 a!3305)))))

(assert (=> d!70139 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!202236)))

(declare-fun b!329161 () Bool)

(assert (=> b!329161 (= e!202238 e!202237)))

(declare-fun lt!158140 () (_ BitVec 64))

(assert (=> b!329161 (= lt!158140 (select (arr!7961 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10202 0))(
  ( (Unit!10203) )
))
(declare-fun lt!158138 () Unit!10202)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16828 (_ BitVec 64) (_ BitVec 32)) Unit!10202)

(assert (=> b!329161 (= lt!158138 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158140 #b00000000000000000000000000000000))))

(assert (=> b!329161 (arrayContainsKey!0 a!3305 lt!158140 #b00000000000000000000000000000000)))

(declare-fun lt!158139 () Unit!10202)

(assert (=> b!329161 (= lt!158139 lt!158138)))

(declare-fun res!181353 () Bool)

(assert (=> b!329161 (= res!181353 (= (seekEntryOrOpen!0 (select (arr!7961 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3092 #b00000000000000000000000000000000)))))

(assert (=> b!329161 (=> (not res!181353) (not e!202237))))

(assert (= (and d!70139 (not res!181352)) b!329158))

(assert (= (and b!329158 c!51542) b!329161))

(assert (= (and b!329158 (not c!51542)) b!329159))

(assert (= (and b!329161 res!181353) b!329160))

(assert (= (or b!329160 b!329159) bm!26139))

(declare-fun m!334893 () Bool)

(assert (=> bm!26139 m!334893))

(assert (=> b!329158 m!334873))

(assert (=> b!329158 m!334873))

(declare-fun m!334895 () Bool)

(assert (=> b!329158 m!334895))

(assert (=> b!329161 m!334873))

(declare-fun m!334897 () Bool)

(assert (=> b!329161 m!334897))

(declare-fun m!334899 () Bool)

