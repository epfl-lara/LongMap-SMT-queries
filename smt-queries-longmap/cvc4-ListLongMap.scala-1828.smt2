; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33026 () Bool)

(assert start!33026)

(declare-fun b!328957 () Bool)

(declare-fun res!181284 () Bool)

(declare-fun e!202119 () Bool)

(assert (=> b!328957 (=> (not res!181284) (not e!202119))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328957 (= res!181284 (validKeyInArray!0 k!2497))))

(declare-fun b!328958 () Bool)

(declare-fun e!202120 () Bool)

(assert (=> b!328958 (= e!202119 e!202120)))

(declare-fun res!181287 () Bool)

(assert (=> b!328958 (=> (not res!181287) (not e!202120))))

(declare-datatypes ((SeekEntryResult!3094 0))(
  ( (MissingZero!3094 (index!14552 (_ BitVec 32))) (Found!3094 (index!14553 (_ BitVec 32))) (Intermediate!3094 (undefined!3906 Bool) (index!14554 (_ BitVec 32)) (x!32813 (_ BitVec 32))) (Undefined!3094) (MissingVacant!3094 (index!14555 (_ BitVec 32))) )
))
(declare-fun lt!158055 () SeekEntryResult!3094)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((array!16832 0))(
  ( (array!16833 (arr!7963 (Array (_ BitVec 32) (_ BitVec 64))) (size!8315 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16832)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16832 (_ BitVec 32)) SeekEntryResult!3094)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328958 (= res!181287 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158055))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!328958 (= lt!158055 (Intermediate!3094 false resIndex!58 resX!58))))

(declare-fun b!328959 () Bool)

(declare-fun res!181283 () Bool)

(assert (=> b!328959 (=> (not res!181283) (not e!202119))))

(declare-fun arrayContainsKey!0 (array!16832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328959 (= res!181283 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328960 () Bool)

(declare-fun res!181289 () Bool)

(assert (=> b!328960 (=> (not res!181289) (not e!202119))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16832 (_ BitVec 32)) SeekEntryResult!3094)

(assert (=> b!328960 (= res!181289 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3094 i!1250)))))

(declare-fun lt!158054 () SeekEntryResult!3094)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun b!328961 () Bool)

(assert (=> b!328961 (= e!202120 (and (= lt!158054 lt!158055) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7963 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7963 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7963 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!158054 (Intermediate!3094 false index!1840 resX!58)))))))

(assert (=> b!328961 (= lt!158054 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!328962 () Bool)

(declare-fun res!181285 () Bool)

(assert (=> b!328962 (=> (not res!181285) (not e!202120))))

(assert (=> b!328962 (= res!181285 (and (= (select (arr!7963 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8315 a!3305))))))

(declare-fun b!328963 () Bool)

(declare-fun res!181286 () Bool)

(assert (=> b!328963 (=> (not res!181286) (not e!202119))))

(assert (=> b!328963 (= res!181286 (and (= (size!8315 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8315 a!3305))))))

(declare-fun res!181288 () Bool)

(assert (=> start!33026 (=> (not res!181288) (not e!202119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33026 (= res!181288 (validMask!0 mask!3777))))

(assert (=> start!33026 e!202119))

(declare-fun array_inv!5926 (array!16832) Bool)

(assert (=> start!33026 (array_inv!5926 a!3305)))

(assert (=> start!33026 true))

(declare-fun b!328964 () Bool)

(declare-fun res!181290 () Bool)

(assert (=> b!328964 (=> (not res!181290) (not e!202119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16832 (_ BitVec 32)) Bool)

(assert (=> b!328964 (= res!181290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!33026 res!181288) b!328963))

(assert (= (and b!328963 res!181286) b!328957))

(assert (= (and b!328957 res!181284) b!328959))

(assert (= (and b!328959 res!181283) b!328960))

(assert (= (and b!328960 res!181289) b!328964))

(assert (= (and b!328964 res!181290) b!328958))

(assert (= (and b!328958 res!181287) b!328962))

(assert (= (and b!328962 res!181285) b!328961))

(declare-fun m!334789 () Bool)

(assert (=> start!33026 m!334789))

(declare-fun m!334791 () Bool)

(assert (=> start!33026 m!334791))

(declare-fun m!334793 () Bool)

(assert (=> b!328962 m!334793))

(declare-fun m!334795 () Bool)

(assert (=> b!328958 m!334795))

(assert (=> b!328958 m!334795))

(declare-fun m!334797 () Bool)

(assert (=> b!328958 m!334797))

(declare-fun m!334799 () Bool)

(assert (=> b!328957 m!334799))

(declare-fun m!334801 () Bool)

(assert (=> b!328961 m!334801))

(declare-fun m!334803 () Bool)

(assert (=> b!328961 m!334803))

(declare-fun m!334805 () Bool)

(assert (=> b!328964 m!334805))

(declare-fun m!334807 () Bool)

(assert (=> b!328959 m!334807))

(declare-fun m!334809 () Bool)

(assert (=> b!328960 m!334809))

(push 1)

(assert (not b!328958))

(assert (not b!328961))

(assert (not b!328960))

(assert (not start!33026))

(assert (not b!328964))

(assert (not b!328957))

(assert (not b!328959))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70099 () Bool)

(assert (=> d!70099 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!328957 d!70099))

(declare-fun b!329037 () Bool)

(declare-fun e!202164 () SeekEntryResult!3094)

(declare-fun e!202161 () SeekEntryResult!3094)

(assert (=> b!329037 (= e!202164 e!202161)))

(declare-fun c!51504 () Bool)

(declare-fun lt!158083 () (_ BitVec 64))

(assert (=> b!329037 (= c!51504 (or (= lt!158083 k!2497) (= (bvadd lt!158083 lt!158083) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329038 () Bool)

(declare-fun e!202162 () Bool)

(declare-fun lt!158084 () SeekEntryResult!3094)

(assert (=> b!329038 (= e!202162 (bvsge (x!32813 lt!158084) #b01111111111111111111111111111110))))

(declare-fun b!329039 () Bool)

(assert (=> b!329039 (= e!202164 (Intermediate!3094 true index!1840 x!1490))))

(declare-fun d!70101 () Bool)

(assert (=> d!70101 e!202162))

(declare-fun c!51503 () Bool)

(assert (=> d!70101 (= c!51503 (and (is-Intermediate!3094 lt!158084) (undefined!3906 lt!158084)))))

(assert (=> d!70101 (= lt!158084 e!202164)))

(declare-fun c!51502 () Bool)

(assert (=> d!70101 (= c!51502 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!70101 (= lt!158083 (select (arr!7963 a!3305) index!1840))))

(assert (=> d!70101 (validMask!0 mask!3777)))

(assert (=> d!70101 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158084)))

(declare-fun b!329040 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329040 (= e!202161 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!329041 () Bool)

(assert (=> b!329041 (and (bvsge (index!14554 lt!158084) #b00000000000000000000000000000000) (bvslt (index!14554 lt!158084) (size!8315 a!3305)))))

(declare-fun e!202160 () Bool)

(assert (=> b!329041 (= e!202160 (= (select (arr!7963 a!3305) (index!14554 lt!158084)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329042 () Bool)

(declare-fun e!202163 () Bool)

(assert (=> b!329042 (= e!202162 e!202163)))

(declare-fun res!181310 () Bool)

(assert (=> b!329042 (= res!181310 (and (is-Intermediate!3094 lt!158084) (not (undefined!3906 lt!158084)) (bvslt (x!32813 lt!158084) #b01111111111111111111111111111110) (bvsge (x!32813 lt!158084) #b00000000000000000000000000000000) (bvsge (x!32813 lt!158084) x!1490)))))

(assert (=> b!329042 (=> (not res!181310) (not e!202163))))

(declare-fun b!329043 () Bool)

(assert (=> b!329043 (and (bvsge (index!14554 lt!158084) #b00000000000000000000000000000000) (bvslt (index!14554 lt!158084) (size!8315 a!3305)))))

(declare-fun res!181311 () Bool)

(assert (=> b!329043 (= res!181311 (= (select (arr!7963 a!3305) (index!14554 lt!158084)) k!2497))))

(assert (=> b!329043 (=> res!181311 e!202160)))

(assert (=> b!329043 (= e!202163 e!202160)))

(declare-fun b!329044 () Bool)

(assert (=> b!329044 (and (bvsge (index!14554 lt!158084) #b00000000000000000000000000000000) (bvslt (index!14554 lt!158084) (size!8315 a!3305)))))

(declare-fun res!181312 () Bool)

(assert (=> b!329044 (= res!181312 (= (select (arr!7963 a!3305) (index!14554 lt!158084)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329044 (=> res!181312 e!202160)))

(declare-fun b!329045 () Bool)

(assert (=> b!329045 (= e!202161 (Intermediate!3094 false index!1840 x!1490))))

(assert (= (and d!70101 c!51502) b!329039))

(assert (= (and d!70101 (not c!51502)) b!329037))

(assert (= (and b!329037 c!51504) b!329045))

(assert (= (and b!329037 (not c!51504)) b!329040))

(assert (= (and d!70101 c!51503) b!329038))

(assert (= (and d!70101 (not c!51503)) b!329042))

(assert (= (and b!329042 res!181310) b!329043))

(assert (= (and b!329043 (not res!181311)) b!329044))

(assert (= (and b!329044 (not res!181312)) b!329041))

(assert (=> d!70101 m!334801))

(assert (=> d!70101 m!334789))

(declare-fun m!334835 () Bool)

(assert (=> b!329041 m!334835))

(assert (=> b!329043 m!334835))

(declare-fun m!334837 () Bool)

(assert (=> b!329040 m!334837))

(assert (=> b!329040 m!334837))

(declare-fun m!334839 () Bool)

(assert (=> b!329040 m!334839))

(assert (=> b!329044 m!334835))

(assert (=> b!328961 d!70101))

(declare-fun b!329117 () Bool)

(declare-fun e!202209 () SeekEntryResult!3094)

(assert (=> b!329117 (= e!202209 Undefined!3094)))

(declare-fun b!329118 () Bool)

(declare-fun e!202208 () SeekEntryResult!3094)

(assert (=> b!329118 (= e!202209 e!202208)))

(declare-fun lt!158113 () (_ BitVec 64))

(declare-fun lt!158114 () SeekEntryResult!3094)

(assert (=> b!329118 (= lt!158113 (select (arr!7963 a!3305) (index!14554 lt!158114)))))

(declare-fun c!51529 () Bool)

(assert (=> b!329118 (= c!51529 (= lt!158113 k!2497))))

(declare-fun e!202207 () SeekEntryResult!3094)

(declare-fun b!329119 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16832 (_ BitVec 32)) SeekEntryResult!3094)

(assert (=> b!329119 (= e!202207 (seekKeyOrZeroReturnVacant!0 (x!32813 lt!158114) (index!14554 lt!158114) (index!14554 lt!158114) k!2497 a!3305 mask!3777))))

(declare-fun b!329120 () Bool)

(declare-fun c!51531 () Bool)

(assert (=> b!329120 (= c!51531 (= lt!158113 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329120 (= e!202208 e!202207)))

(declare-fun b!329121 () Bool)

(assert (=> b!329121 (= e!202208 (Found!3094 (index!14554 lt!158114)))))

(declare-fun d!70115 () Bool)

(declare-fun lt!158112 () SeekEntryResult!3094)

(assert (=> d!70115 (and (or (is-Undefined!3094 lt!158112) (not (is-Found!3094 lt!158112)) (and (bvsge (index!14553 lt!158112) #b00000000000000000000000000000000) (bvslt (index!14553 lt!158112) (size!8315 a!3305)))) (or (is-Undefined!3094 lt!158112) (is-Found!3094 lt!158112) (not (is-MissingZero!3094 lt!158112)) (and (bvsge (index!14552 lt!158112) #b00000000000000000000000000000000) (bvslt (index!14552 lt!158112) (size!8315 a!3305)))) (or (is-Undefined!3094 lt!158112) (is-Found!3094 lt!158112) (is-MissingZero!3094 lt!158112) (not (is-MissingVacant!3094 lt!158112)) (and (bvsge (index!14555 lt!158112) #b00000000000000000000000000000000) (bvslt (index!14555 lt!158112) (size!8315 a!3305)))) (or (is-Undefined!3094 lt!158112) (ite (is-Found!3094 lt!158112) (= (select (arr!7963 a!3305) (index!14553 lt!158112)) k!2497) (ite (is-MissingZero!3094 lt!158112) (= (select (arr!7963 a!3305) (index!14552 lt!158112)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3094 lt!158112) (= (select (arr!7963 a!3305) (index!14555 lt!158112)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70115 (= lt!158112 e!202209)))

(declare-fun c!51530 () Bool)

(assert (=> d!70115 (= c!51530 (and (is-Intermediate!3094 lt!158114) (undefined!3906 lt!158114)))))

(assert (=> d!70115 (= lt!158114 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!70115 (validMask!0 mask!3777)))

(assert (=> d!70115 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!158112)))

(declare-fun b!329122 () Bool)

(assert (=> b!329122 (= e!202207 (MissingZero!3094 (index!14554 lt!158114)))))

(assert (= (and d!70115 c!51530) b!329117))

(assert (= (and d!70115 (not c!51530)) b!329118))

(assert (= (and b!329118 c!51529) b!329121))

(assert (= (and b!329118 (not c!51529)) b!329120))

(assert (= (and b!329120 c!51531) b!329122))

(assert (= (and b!329120 (not c!51531)) b!329119))

(declare-fun m!334863 () Bool)

(assert (=> b!329118 m!334863))

(declare-fun m!334865 () Bool)

(assert (=> b!329119 m!334865))

(assert (=> d!70115 m!334789))

(assert (=> d!70115 m!334795))

(declare-fun m!334867 () Bool)

(assert (=> d!70115 m!334867))

(declare-fun m!334869 () Bool)

(assert (=> d!70115 m!334869))

(declare-fun m!334871 () Bool)

(assert (=> d!70115 m!334871))

(assert (=> d!70115 m!334795))

(assert (=> d!70115 m!334797))

(assert (=> b!328960 d!70115))

(declare-fun d!70125 () Bool)

(assert (=> d!70125 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33026 d!70125))

(declare-fun d!70135 () Bool)

