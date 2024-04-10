; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49524 () Bool)

(assert start!49524)

(declare-fun b!545072 () Bool)

(declare-fun e!315070 () Bool)

(declare-fun e!315069 () Bool)

(assert (=> b!545072 (= e!315070 e!315069)))

(declare-fun res!339185 () Bool)

(assert (=> b!545072 (=> (not res!339185) (not e!315069))))

(declare-datatypes ((SeekEntryResult!4985 0))(
  ( (MissingZero!4985 (index!22164 (_ BitVec 32))) (Found!4985 (index!22165 (_ BitVec 32))) (Intermediate!4985 (undefined!5797 Bool) (index!22166 (_ BitVec 32)) (x!51088 (_ BitVec 32))) (Undefined!4985) (MissingVacant!4985 (index!22167 (_ BitVec 32))) )
))
(declare-fun lt!248692 () SeekEntryResult!4985)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545072 (= res!339185 (or (= lt!248692 (MissingZero!4985 i!1153)) (= lt!248692 (MissingVacant!4985 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!34394 0))(
  ( (array!34395 (arr!16527 (Array (_ BitVec 32) (_ BitVec 64))) (size!16891 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34394)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34394 (_ BitVec 32)) SeekEntryResult!4985)

(assert (=> b!545072 (= lt!248692 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!545073 () Bool)

(declare-fun res!339184 () Bool)

(declare-fun e!315072 () Bool)

(assert (=> b!545073 (=> (not res!339184) (not e!315072))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!545073 (= res!339184 (and (not (= (select (arr!16527 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16527 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16527 a!3154) index!1177) (select (arr!16527 a!3154) j!147)))))))

(declare-fun b!545074 () Bool)

(declare-fun res!339179 () Bool)

(assert (=> b!545074 (=> (not res!339179) (not e!315070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545074 (= res!339179 (validKeyInArray!0 k!1998))))

(declare-fun b!545075 () Bool)

(declare-fun res!339186 () Bool)

(assert (=> b!545075 (=> (not res!339186) (not e!315070))))

(assert (=> b!545075 (= res!339186 (validKeyInArray!0 (select (arr!16527 a!3154) j!147)))))

(declare-fun b!545076 () Bool)

(declare-fun e!315071 () Bool)

(assert (=> b!545076 (= e!315072 e!315071)))

(declare-fun res!339178 () Bool)

(assert (=> b!545076 (=> (not res!339178) (not e!315071))))

(declare-fun lt!248689 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!545076 (= res!339178 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248689 #b00000000000000000000000000000000) (bvslt lt!248689 (size!16891 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545076 (= lt!248689 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545077 () Bool)

(declare-fun res!339176 () Bool)

(assert (=> b!545077 (=> (not res!339176) (not e!315069))))

(declare-datatypes ((List!10646 0))(
  ( (Nil!10643) (Cons!10642 (h!11603 (_ BitVec 64)) (t!16874 List!10646)) )
))
(declare-fun arrayNoDuplicates!0 (array!34394 (_ BitVec 32) List!10646) Bool)

(assert (=> b!545077 (= res!339176 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10643))))

(declare-fun b!545078 () Bool)

(declare-fun res!339181 () Bool)

(assert (=> b!545078 (=> (not res!339181) (not e!315069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34394 (_ BitVec 32)) Bool)

(assert (=> b!545078 (= res!339181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545079 () Bool)

(declare-fun res!339183 () Bool)

(assert (=> b!545079 (=> (not res!339183) (not e!315070))))

(assert (=> b!545079 (= res!339183 (and (= (size!16891 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16891 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16891 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545080 () Bool)

(declare-fun res!339187 () Bool)

(assert (=> b!545080 (=> (not res!339187) (not e!315072))))

(declare-fun lt!248690 () SeekEntryResult!4985)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34394 (_ BitVec 32)) SeekEntryResult!4985)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545080 (= res!339187 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16527 a!3154) j!147) mask!3216) (select (arr!16527 a!3154) j!147) a!3154 mask!3216) lt!248690))))

(declare-fun res!339188 () Bool)

(assert (=> start!49524 (=> (not res!339188) (not e!315070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49524 (= res!339188 (validMask!0 mask!3216))))

(assert (=> start!49524 e!315070))

(assert (=> start!49524 true))

(declare-fun array_inv!12323 (array!34394) Bool)

(assert (=> start!49524 (array_inv!12323 a!3154)))

(declare-fun b!545081 () Bool)

(assert (=> b!545081 (= e!315069 e!315072)))

(declare-fun res!339177 () Bool)

(assert (=> b!545081 (=> (not res!339177) (not e!315072))))

(declare-fun lt!248691 () SeekEntryResult!4985)

(assert (=> b!545081 (= res!339177 (= lt!248690 lt!248691))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!545081 (= lt!248691 (Intermediate!4985 false resIndex!32 resX!32))))

(assert (=> b!545081 (= lt!248690 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16527 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545082 () Bool)

(declare-fun res!339182 () Bool)

(assert (=> b!545082 (=> (not res!339182) (not e!315069))))

(assert (=> b!545082 (= res!339182 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16891 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16891 a!3154)) (= (select (arr!16527 a!3154) resIndex!32) (select (arr!16527 a!3154) j!147))))))

(declare-fun b!545083 () Bool)

(declare-fun res!339180 () Bool)

(assert (=> b!545083 (=> (not res!339180) (not e!315070))))

(declare-fun arrayContainsKey!0 (array!34394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545083 (= res!339180 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545084 () Bool)

(assert (=> b!545084 (= e!315071 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248689 (select (arr!16527 a!3154) j!147) a!3154 mask!3216) lt!248691)))))

(assert (= (and start!49524 res!339188) b!545079))

(assert (= (and b!545079 res!339183) b!545075))

(assert (= (and b!545075 res!339186) b!545074))

(assert (= (and b!545074 res!339179) b!545083))

(assert (= (and b!545083 res!339180) b!545072))

(assert (= (and b!545072 res!339185) b!545078))

(assert (= (and b!545078 res!339181) b!545077))

(assert (= (and b!545077 res!339176) b!545082))

(assert (= (and b!545082 res!339182) b!545081))

(assert (= (and b!545081 res!339177) b!545080))

(assert (= (and b!545080 res!339187) b!545073))

(assert (= (and b!545073 res!339184) b!545076))

(assert (= (and b!545076 res!339178) b!545084))

(declare-fun m!522783 () Bool)

(assert (=> b!545083 m!522783))

(declare-fun m!522785 () Bool)

(assert (=> b!545084 m!522785))

(assert (=> b!545084 m!522785))

(declare-fun m!522787 () Bool)

(assert (=> b!545084 m!522787))

(declare-fun m!522789 () Bool)

(assert (=> b!545077 m!522789))

(declare-fun m!522791 () Bool)

(assert (=> start!49524 m!522791))

(declare-fun m!522793 () Bool)

(assert (=> start!49524 m!522793))

(declare-fun m!522795 () Bool)

(assert (=> b!545073 m!522795))

(assert (=> b!545073 m!522785))

(declare-fun m!522797 () Bool)

(assert (=> b!545076 m!522797))

(assert (=> b!545081 m!522785))

(assert (=> b!545081 m!522785))

(declare-fun m!522799 () Bool)

(assert (=> b!545081 m!522799))

(declare-fun m!522801 () Bool)

(assert (=> b!545072 m!522801))

(declare-fun m!522803 () Bool)

(assert (=> b!545078 m!522803))

(declare-fun m!522805 () Bool)

(assert (=> b!545082 m!522805))

(assert (=> b!545082 m!522785))

(assert (=> b!545080 m!522785))

(assert (=> b!545080 m!522785))

(declare-fun m!522807 () Bool)

(assert (=> b!545080 m!522807))

(assert (=> b!545080 m!522807))

(assert (=> b!545080 m!522785))

(declare-fun m!522809 () Bool)

(assert (=> b!545080 m!522809))

(assert (=> b!545075 m!522785))

(assert (=> b!545075 m!522785))

(declare-fun m!522811 () Bool)

(assert (=> b!545075 m!522811))

(declare-fun m!522813 () Bool)

(assert (=> b!545074 m!522813))

(push 1)

(assert (not b!545074))

(assert (not b!545076))

(assert (not b!545072))

(assert (not b!545077))

(assert (not b!545084))

(assert (not start!49524))

(assert (not b!545083))

(assert (not b!545078))

(assert (not b!545075))

(assert (not b!545081))

(assert (not b!545080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82173 () Bool)

(declare-fun e!315150 () Bool)

(assert (=> d!82173 e!315150))

(declare-fun c!63299 () Bool)

(declare-fun lt!248746 () SeekEntryResult!4985)

(assert (=> d!82173 (= c!63299 (and (is-Intermediate!4985 lt!248746) (undefined!5797 lt!248746)))))

(declare-fun e!315151 () SeekEntryResult!4985)

(assert (=> d!82173 (= lt!248746 e!315151)))

(declare-fun c!63298 () Bool)

(assert (=> d!82173 (= c!63298 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!248747 () (_ BitVec 64))

(assert (=> d!82173 (= lt!248747 (select (arr!16527 a!3154) index!1177))))

(assert (=> d!82173 (validMask!0 mask!3216)))

(assert (=> d!82173 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16527 a!3154) j!147) a!3154 mask!3216) lt!248746)))

(declare-fun b!545234 () Bool)

(assert (=> b!545234 (and (bvsge (index!22166 lt!248746) #b00000000000000000000000000000000) (bvslt (index!22166 lt!248746) (size!16891 a!3154)))))

(declare-fun e!315148 () Bool)

(assert (=> b!545234 (= e!315148 (= (select (arr!16527 a!3154) (index!22166 lt!248746)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!545235 () Bool)

(assert (=> b!545235 (and (bvsge (index!22166 lt!248746) #b00000000000000000000000000000000) (bvslt (index!22166 lt!248746) (size!16891 a!3154)))))

(declare-fun res!339290 () Bool)

(assert (=> b!545235 (= res!339290 (= (select (arr!16527 a!3154) (index!22166 lt!248746)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545235 (=> res!339290 e!315148)))

(declare-fun b!545236 () Bool)

(declare-fun e!315147 () SeekEntryResult!4985)

(assert (=> b!545236 (= e!315147 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16527 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545237 () Bool)

(assert (=> b!545237 (and (bvsge (index!22166 lt!248746) #b00000000000000000000000000000000) (bvslt (index!22166 lt!248746) (size!16891 a!3154)))))

(declare-fun res!339289 () Bool)

(assert (=> b!545237 (= res!339289 (= (select (arr!16527 a!3154) (index!22166 lt!248746)) (select (arr!16527 a!3154) j!147)))))

(assert (=> b!545237 (=> res!339289 e!315148)))

(declare-fun e!315149 () Bool)

(assert (=> b!545237 (= e!315149 e!315148)))

(declare-fun b!545238 () Bool)

(assert (=> b!545238 (= e!315150 (bvsge (x!51088 lt!248746) #b01111111111111111111111111111110))))

(declare-fun b!545239 () Bool)

(assert (=> b!545239 (= e!315147 (Intermediate!4985 false index!1177 x!1030))))

(declare-fun b!545240 () Bool)

(assert (=> b!545240 (= e!315150 e!315149)))

(declare-fun res!339288 () Bool)

(assert (=> b!545240 (= res!339288 (and (is-Intermediate!4985 lt!248746) (not (undefined!5797 lt!248746)) (bvslt (x!51088 lt!248746) #b01111111111111111111111111111110) (bvsge (x!51088 lt!248746) #b00000000000000000000000000000000) (bvsge (x!51088 lt!248746) x!1030)))))

(assert (=> b!545240 (=> (not res!339288) (not e!315149))))

(declare-fun b!545241 () Bool)

(assert (=> b!545241 (= e!315151 e!315147)))

(declare-fun c!63300 () Bool)

(assert (=> b!545241 (= c!63300 (or (= lt!248747 (select (arr!16527 a!3154) j!147)) (= (bvadd lt!248747 lt!248747) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!545242 () Bool)

(assert (=> b!545242 (= e!315151 (Intermediate!4985 true index!1177 x!1030))))

(assert (= (and d!82173 c!63298) b!545242))

(assert (= (and d!82173 (not c!63298)) b!545241))

(assert (= (and b!545241 c!63300) b!545239))

(assert (= (and b!545241 (not c!63300)) b!545236))

(assert (= (and d!82173 c!63299) b!545238))

(assert (= (and d!82173 (not c!63299)) b!545240))

(assert (= (and b!545240 res!339288) b!545237))

(assert (= (and b!545237 (not res!339289)) b!545235))

(assert (= (and b!545235 (not res!339290)) b!545234))

(declare-fun m!522915 () Bool)

(assert (=> b!545234 m!522915))

(assert (=> b!545235 m!522915))

(assert (=> d!82173 m!522795))

(assert (=> d!82173 m!522791))

(assert (=> b!545237 m!522915))

(assert (=> b!545236 m!522797))

(assert (=> b!545236 m!522797))

(assert (=> b!545236 m!522785))

(declare-fun m!522917 () Bool)

(assert (=> b!545236 m!522917))

(assert (=> b!545081 d!82173))

(declare-fun d!82187 () Bool)

(declare-fun lt!248750 () (_ BitVec 32))

(assert (=> d!82187 (and (bvsge lt!248750 #b00000000000000000000000000000000) (bvslt lt!248750 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82187 (= lt!248750 (choose!52 index!1177 x!1030 mask!3216))))

(assert (=> d!82187 (validMask!0 mask!3216)))

(assert (=> d!82187 (= (nextIndex!0 index!1177 x!1030 mask!3216) lt!248750)))

(declare-fun bs!17003 () Bool)

(assert (= bs!17003 d!82187))

(declare-fun m!522919 () Bool)

(assert (=> bs!17003 m!522919))

(assert (=> bs!17003 m!522791))

(assert (=> b!545076 d!82187))

(declare-fun d!82189 () Bool)

(assert (=> d!82189 (= (validKeyInArray!0 (select (arr!16527 a!3154) j!147)) (and (not (= (select (arr!16527 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16527 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!545075 d!82189))

(declare-fun d!82191 () Bool)

(assert (=> d!82191 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49524 d!82191))

(declare-fun d!82199 () Bool)

(assert (=> d!82199 (= (array_inv!12323 a!3154) (bvsge (size!16891 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49524 d!82199))

(declare-fun b!545295 () Bool)

(declare-fun e!315186 () Bool)

(declare-fun contains!2811 (List!10646 (_ BitVec 64)) Bool)

(assert (=> b!545295 (= e!315186 (contains!2811 Nil!10643 (select (arr!16527 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!545296 () Bool)

(declare-fun e!315189 () Bool)

(declare-fun e!315187 () Bool)

(assert (=> b!545296 (= e!315189 e!315187)))

(declare-fun res!339317 () Bool)

(assert (=> b!545296 (=> (not res!339317) (not e!315187))))

(assert (=> b!545296 (= res!339317 (not e!315186))))

(declare-fun res!339316 () Bool)

(assert (=> b!545296 (=> (not res!339316) (not e!315186))))

(assert (=> b!545296 (= res!339316 (validKeyInArray!0 (select (arr!16527 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!545297 () Bool)

(declare-fun e!315188 () Bool)

(declare-fun call!32120 () Bool)

(assert (=> b!545297 (= e!315188 call!32120)))

(declare-fun d!82201 () Bool)

(declare-fun res!339318 () Bool)

(assert (=> d!82201 (=> res!339318 e!315189)))

(assert (=> d!82201 (= res!339318 (bvsge #b00000000000000000000000000000000 (size!16891 a!3154)))))

(assert (=> d!82201 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10643) e!315189)))

(declare-fun b!545298 () Bool)

(assert (=> b!545298 (= e!315187 e!315188)))

(declare-fun c!63315 () Bool)

(assert (=> b!545298 (= c!63315 (validKeyInArray!0 (select (arr!16527 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!545299 () Bool)

(assert (=> b!545299 (= e!315188 call!32120)))

(declare-fun bm!32117 () Bool)

(assert (=> bm!32117 (= call!32120 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63315 (Cons!10642 (select (arr!16527 a!3154) #b00000000000000000000000000000000) Nil!10643) Nil!10643)))))

(assert (= (and d!82201 (not res!339318)) b!545296))

(assert (= (and b!545296 res!339316) b!545295))

(assert (= (and b!545296 res!339317) b!545298))

(assert (= (and b!545298 c!63315) b!545297))

(assert (= (and b!545298 (not c!63315)) b!545299))

(assert (= (or b!545297 b!545299) bm!32117))

(declare-fun m!522935 () Bool)

(assert (=> b!545295 m!522935))

(assert (=> b!545295 m!522935))

(declare-fun m!522937 () Bool)

(assert (=> b!545295 m!522937))

(assert (=> b!545296 m!522935))

(assert (=> b!545296 m!522935))

(declare-fun m!522939 () Bool)

(assert (=> b!545296 m!522939))

(assert (=> b!545298 m!522935))

(assert (=> b!545298 m!522935))

(assert (=> b!545298 m!522939))

(assert (=> bm!32117 m!522935))

(declare-fun m!522941 () Bool)

(assert (=> bm!32117 m!522941))

(assert (=> b!545077 d!82201))

(declare-fun d!82211 () Bool)

(declare-fun lt!248797 () SeekEntryResult!4985)

(assert (=> d!82211 (and (or (is-Undefined!4985 lt!248797) (not (is-Found!4985 lt!248797)) (and (bvsge (index!22165 lt!248797) #b00000000000000000000000000000000) (bvslt (index!22165 lt!248797) (size!16891 a!3154)))) (or (is-Undefined!4985 lt!248797) (is-Found!4985 lt!248797) (not (is-MissingZero!4985 lt!248797)) (and (bvsge (index!22164 lt!248797) #b00000000000000000000000000000000) (bvslt (index!22164 lt!248797) (size!16891 a!3154)))) (or (is-Undefined!4985 lt!248797) (is-Found!4985 lt!248797) (is-MissingZero!4985 lt!248797) (not (is-MissingVacant!4985 lt!248797)) (and (bvsge (index!22167 lt!248797) #b00000000000000000000000000000000) (bvslt (index!22167 lt!248797) (size!16891 a!3154)))) (or (is-Undefined!4985 lt!248797) (ite (is-Found!4985 lt!248797) (= (select (arr!16527 a!3154) (index!22165 lt!248797)) k!1998) (ite (is-MissingZero!4985 lt!248797) (= (select (arr!16527 a!3154) (index!22164 lt!248797)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4985 lt!248797) (= (select (arr!16527 a!3154) (index!22167 lt!248797)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!315238 () SeekEntryResult!4985)

(assert (=> d!82211 (= lt!248797 e!315238)))

(declare-fun c!63341 () Bool)

(declare-fun lt!248796 () SeekEntryResult!4985)

(assert (=> d!82211 (= c!63341 (and (is-Intermediate!4985 lt!248796) (undefined!5797 lt!248796)))))

(assert (=> d!82211 (= lt!248796 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!82211 (validMask!0 mask!3216)))

(assert (=> d!82211 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!248797)))

(declare-fun b!545376 () Bool)

(declare-fun e!315239 () SeekEntryResult!4985)

(assert (=> b!545376 (= e!315239 (Found!4985 (index!22166 lt!248796)))))

(declare-fun b!545377 () Bool)

(declare-fun e!315240 () SeekEntryResult!4985)

(assert (=> b!545377 (= e!315240 (MissingZero!4985 (index!22166 lt!248796)))))

(declare-fun b!545378 () Bool)

(assert (=> b!545378 (= e!315238 Undefined!4985)))

(declare-fun b!545379 () Bool)

(declare-fun c!63339 () Bool)

(declare-fun lt!248795 () (_ BitVec 64))

(assert (=> b!545379 (= c!63339 (= lt!248795 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545379 (= e!315239 e!315240)))

(declare-fun b!545380 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34394 (_ BitVec 32)) SeekEntryResult!4985)

(assert (=> b!545380 (= e!315240 (seekKeyOrZeroReturnVacant!0 (x!51088 lt!248796) (index!22166 lt!248796) (index!22166 lt!248796) k!1998 a!3154 mask!3216))))

(declare-fun b!545381 () Bool)

(assert (=> b!545381 (= e!315238 e!315239)))

(assert (=> b!545381 (= lt!248795 (select (arr!16527 a!3154) (index!22166 lt!248796)))))

(declare-fun c!63340 () Bool)

(assert (=> b!545381 (= c!63340 (= lt!248795 k!1998))))

(assert (= (and d!82211 c!63341) b!545378))

(assert (= (and d!82211 (not c!63341)) b!545381))

(assert (= (and b!545381 c!63340) b!545376))

(assert (= (and b!545381 (not c!63340)) b!545379))

(assert (= (and b!545379 c!63339) b!545377))

(assert (= (and b!545379 (not c!63339)) b!545380))

(declare-fun m!522977 () Bool)

(assert (=> d!82211 m!522977))

(declare-fun m!522979 () Bool)

(assert (=> d!82211 m!522979))

(declare-fun m!522981 () Bool)

(assert (=> d!82211 m!522981))

(declare-fun m!522983 () Bool)

(assert (=> d!82211 m!522983))

(assert (=> d!82211 m!522791))

(assert (=> d!82211 m!522979))

(declare-fun m!522985 () Bool)

(assert (=> d!82211 m!522985))

(declare-fun m!522987 () Bool)

(assert (=> b!545380 m!522987))

(declare-fun m!522989 () Bool)

(assert (=> b!545381 m!522989))

(assert (=> b!545072 d!82211))

(declare-fun d!82229 () Bool)

(declare-fun e!315244 () Bool)

(assert (=> d!82229 e!315244))

(declare-fun c!63343 () Bool)

(declare-fun lt!248798 () SeekEntryResult!4985)

(assert (=> d!82229 (= c!63343 (and (is-Intermediate!4985 lt!248798) (undefined!5797 lt!248798)))))

(declare-fun e!315245 () SeekEntryResult!4985)

(assert (=> d!82229 (= lt!248798 e!315245)))

(declare-fun c!63342 () Bool)

(assert (=> d!82229 (= c!63342 (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b01111111111111111111111111111110))))

(declare-fun lt!248799 () (_ BitVec 64))

(assert (=> d!82229 (= lt!248799 (select (arr!16527 a!3154) lt!248689))))

(assert (=> d!82229 (validMask!0 mask!3216)))

(assert (=> d!82229 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248689 (select (arr!16527 a!3154) j!147) a!3154 mask!3216) lt!248798)))

(declare-fun b!545382 () Bool)

(assert (=> b!545382 (and (bvsge (index!22166 lt!248798) #b00000000000000000000000000000000) (bvslt (index!22166 lt!248798) (size!16891 a!3154)))))

(declare-fun e!315242 () Bool)

(assert (=> b!545382 (= e!315242 (= (select (arr!16527 a!3154) (index!22166 lt!248798)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!545383 () Bool)

(assert (=> b!545383 (and (bvsge (index!22166 lt!248798) #b00000000000000000000000000000000) (bvslt (index!22166 lt!248798) (size!16891 a!3154)))))

(declare-fun res!339352 () Bool)

(assert (=> b!545383 (= res!339352 (= (select (arr!16527 a!3154) (index!22166 lt!248798)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545383 (=> res!339352 e!315242)))

(declare-fun b!545384 () Bool)

(declare-fun e!315241 () SeekEntryResult!4985)

(assert (=> b!545384 (= e!315241 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030 #b00000000000000000000000000000001) (nextIndex!0 lt!248689 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216) (select (arr!16527 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545385 () Bool)

(assert (=> b!545385 (and (bvsge (index!22166 lt!248798) #b00000000000000000000000000000000) (bvslt (index!22166 lt!248798) (size!16891 a!3154)))))

(declare-fun res!339351 () Bool)

(assert (=> b!545385 (= res!339351 (= (select (arr!16527 a!3154) (index!22166 lt!248798)) (select (arr!16527 a!3154) j!147)))))

(assert (=> b!545385 (=> res!339351 e!315242)))

(declare-fun e!315243 () Bool)

(assert (=> b!545385 (= e!315243 e!315242)))

(declare-fun b!545386 () Bool)

(assert (=> b!545386 (= e!315244 (bvsge (x!51088 lt!248798) #b01111111111111111111111111111110))))

(declare-fun b!545387 () Bool)

(assert (=> b!545387 (= e!315241 (Intermediate!4985 false lt!248689 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!545388 () Bool)

(assert (=> b!545388 (= e!315244 e!315243)))

(declare-fun res!339350 () Bool)

(assert (=> b!545388 (= res!339350 (and (is-Intermediate!4985 lt!248798) (not (undefined!5797 lt!248798)) (bvslt (x!51088 lt!248798) #b01111111111111111111111111111110) (bvsge (x!51088 lt!248798) #b00000000000000000000000000000000) (bvsge (x!51088 lt!248798) (bvadd #b00000000000000000000000000000001 x!1030))))))

(assert (=> b!545388 (=> (not res!339350) (not e!315243))))

(declare-fun b!545389 () Bool)

(assert (=> b!545389 (= e!315245 e!315241)))

(declare-fun c!63344 () Bool)

(assert (=> b!545389 (= c!63344 (or (= lt!248799 (select (arr!16527 a!3154) j!147)) (= (bvadd lt!248799 lt!248799) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!545390 () Bool)

(assert (=> b!545390 (= e!315245 (Intermediate!4985 true lt!248689 (bvadd #b00000000000000000000000000000001 x!1030)))))

(assert (= (and d!82229 c!63342) b!545390))

(assert (= (and d!82229 (not c!63342)) b!545389))

(assert (= (and b!545389 c!63344) b!545387))

(assert (= (and b!545389 (not c!63344)) b!545384))

(assert (= (and d!82229 c!63343) b!545386))

(assert (= (and d!82229 (not c!63343)) b!545388))

(assert (= (and b!545388 res!339350) b!545385))

(assert (= (and b!545385 (not res!339351)) b!545383))

(assert (= (and b!545383 (not res!339352)) b!545382))

(declare-fun m!522991 () Bool)

(assert (=> b!545382 m!522991))

(assert (=> b!545383 m!522991))

(declare-fun m!522993 () Bool)

(assert (=> d!82229 m!522993))

(assert (=> d!82229 m!522791))

(assert (=> b!545385 m!522991))

(declare-fun m!522995 () Bool)

(assert (=> b!545384 m!522995))

(assert (=> b!545384 m!522995))

(assert (=> b!545384 m!522785))

(declare-fun m!522997 () Bool)

(assert (=> b!545384 m!522997))

(assert (=> b!545084 d!82229))

(declare-fun d!82231 () Bool)

(declare-fun res!339357 () Bool)

(declare-fun e!315250 () Bool)

(assert (=> d!82231 (=> res!339357 e!315250)))

(assert (=> d!82231 (= res!339357 (= (select (arr!16527 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!82231 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!315250)))

(declare-fun b!545395 () Bool)

(declare-fun e!315251 () Bool)

(assert (=> b!545395 (= e!315250 e!315251)))

(declare-fun res!339358 () Bool)

(assert (=> b!545395 (=> (not res!339358) (not e!315251))))

(assert (=> b!545395 (= res!339358 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16891 a!3154)))))

(declare-fun b!545396 () Bool)

(assert (=> b!545396 (= e!315251 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82231 (not res!339357)) b!545395))

(assert (= (and b!545395 res!339358) b!545396))

(assert (=> d!82231 m!522935))

(declare-fun m!522999 () Bool)

(assert (=> b!545396 m!522999))

(assert (=> b!545083 d!82231))

(declare-fun b!545417 () Bool)

(declare-fun e!315264 () Bool)

(declare-fun call!32129 () Bool)

(assert (=> b!545417 (= e!315264 call!32129)))

(declare-fun bm!32126 () Bool)

(assert (=> bm!32126 (= call!32129 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!545418 () Bool)

(declare-fun e!315266 () Bool)

(assert (=> b!545418 (= e!315264 e!315266)))

(declare-fun lt!248814 () (_ BitVec 64))

(assert (=> b!545418 (= lt!248814 (select (arr!16527 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16920 0))(
  ( (Unit!16921) )
))
(declare-fun lt!248812 () Unit!16920)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34394 (_ BitVec 64) (_ BitVec 32)) Unit!16920)

(assert (=> b!545418 (= lt!248812 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248814 #b00000000000000000000000000000000))))

(assert (=> b!545418 (arrayContainsKey!0 a!3154 lt!248814 #b00000000000000000000000000000000)))

(declare-fun lt!248813 () Unit!16920)

(assert (=> b!545418 (= lt!248813 lt!248812)))

(declare-fun res!339364 () Bool)

(assert (=> b!545418 (= res!339364 (= (seekEntryOrOpen!0 (select (arr!16527 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4985 #b00000000000000000000000000000000)))))

(assert (=> b!545418 (=> (not res!339364) (not e!315266))))

(declare-fun b!545419 () Bool)

(declare-fun e!315265 () Bool)

(assert (=> b!545419 (= e!315265 e!315264)))

(declare-fun c!63353 () Bool)

(assert (=> b!545419 (= c!63353 (validKeyInArray!0 (select (arr!16527 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!545420 () Bool)

(assert (=> b!545420 (= e!315266 call!32129)))

(declare-fun d!82233 () Bool)

(declare-fun res!339363 () Bool)

(assert (=> d!82233 (=> res!339363 e!315265)))

(assert (=> d!82233 (= res!339363 (bvsge #b00000000000000000000000000000000 (size!16891 a!3154)))))

(assert (=> d!82233 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!315265)))

(assert (= (and d!82233 (not res!339363)) b!545419))

(assert (= (and b!545419 c!63353) b!545418))

(assert (= (and b!545419 (not c!63353)) b!545417))

(assert (= (and b!545418 res!339364) b!545420))

(assert (= (or b!545420 b!545417) bm!32126))

(declare-fun m!523001 () Bool)

(assert (=> bm!32126 m!523001))

(assert (=> b!545418 m!522935))

(declare-fun m!523003 () Bool)

(assert (=> b!545418 m!523003))

(declare-fun m!523005 () Bool)

(assert (=> b!545418 m!523005))

(assert (=> b!545418 m!522935))

(declare-fun m!523007 () Bool)

(assert (=> b!545418 m!523007))

(assert (=> b!545419 m!522935))

(assert (=> b!545419 m!522935))

(assert (=> b!545419 m!522939))

(assert (=> b!545078 d!82233))

(declare-fun d!82235 () Bool)

(declare-fun e!315270 () Bool)

(assert (=> d!82235 e!315270))

(declare-fun c!63355 () Bool)

(declare-fun lt!248815 () SeekEntryResult!4985)

(assert (=> d!82235 (= c!63355 (and (is-Intermediate!4985 lt!248815) (undefined!5797 lt!248815)))))

(declare-fun e!315271 () SeekEntryResult!4985)

(assert (=> d!82235 (= lt!248815 e!315271)))

(declare-fun c!63354 () Bool)

(assert (=> d!82235 (= c!63354 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!248816 () (_ BitVec 64))

(assert (=> d!82235 (= lt!248816 (select (arr!16527 a!3154) (toIndex!0 (select (arr!16527 a!3154) j!147) mask!3216)))))

(assert (=> d!82235 (validMask!0 mask!3216)))

(assert (=> d!82235 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16527 a!3154) j!147) mask!3216) (select (arr!16527 a!3154) j!147) a!3154 mask!3216) lt!248815)))

(declare-fun b!545421 () Bool)

(assert (=> b!545421 (and (bvsge (index!22166 lt!248815) #b00000000000000000000000000000000) (bvslt (index!22166 lt!248815) (size!16891 a!3154)))))

(declare-fun e!315268 () Bool)

(assert (=> b!545421 (= e!315268 (= (select (arr!16527 a!3154) (index!22166 lt!248815)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!545422 () Bool)

(assert (=> b!545422 (and (bvsge (index!22166 lt!248815) #b00000000000000000000000000000000) (bvslt (index!22166 lt!248815) (size!16891 a!3154)))))

(declare-fun res!339367 () Bool)

(assert (=> b!545422 (= res!339367 (= (select (arr!16527 a!3154) (index!22166 lt!248815)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545422 (=> res!339367 e!315268)))

(declare-fun e!315267 () SeekEntryResult!4985)

(declare-fun b!545423 () Bool)

(assert (=> b!545423 (= e!315267 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16527 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16527 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545424 () Bool)

(assert (=> b!545424 (and (bvsge (index!22166 lt!248815) #b00000000000000000000000000000000) (bvslt (index!22166 lt!248815) (size!16891 a!3154)))))

(declare-fun res!339366 () Bool)

(assert (=> b!545424 (= res!339366 (= (select (arr!16527 a!3154) (index!22166 lt!248815)) (select (arr!16527 a!3154) j!147)))))

(assert (=> b!545424 (=> res!339366 e!315268)))

(declare-fun e!315269 () Bool)

(assert (=> b!545424 (= e!315269 e!315268)))

(declare-fun b!545425 () Bool)

(assert (=> b!545425 (= e!315270 (bvsge (x!51088 lt!248815) #b01111111111111111111111111111110))))

(declare-fun b!545426 () Bool)

(assert (=> b!545426 (= e!315267 (Intermediate!4985 false (toIndex!0 (select (arr!16527 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!545427 () Bool)

(assert (=> b!545427 (= e!315270 e!315269)))

(declare-fun res!339365 () Bool)

(assert (=> b!545427 (= res!339365 (and (is-Intermediate!4985 lt!248815) (not (undefined!5797 lt!248815)) (bvslt (x!51088 lt!248815) #b01111111111111111111111111111110) (bvsge (x!51088 lt!248815) #b00000000000000000000000000000000) (bvsge (x!51088 lt!248815) #b00000000000000000000000000000000)))))

(assert (=> b!545427 (=> (not res!339365) (not e!315269))))

(declare-fun b!545428 () Bool)

(assert (=> b!545428 (= e!315271 e!315267)))

(declare-fun c!63356 () Bool)

(assert (=> b!545428 (= c!63356 (or (= lt!248816 (select (arr!16527 a!3154) j!147)) (= (bvadd lt!248816 lt!248816) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!545429 () Bool)

(assert (=> b!545429 (= e!315271 (Intermediate!4985 true (toIndex!0 (select (arr!16527 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(assert (= (and d!82235 c!63354) b!545429))

(assert (= (and d!82235 (not c!63354)) b!545428))

(assert (= (and b!545428 c!63356) b!545426))

(assert (= (and b!545428 (not c!63356)) b!545423))

(assert (= (and d!82235 c!63355) b!545425))

(assert (= (and d!82235 (not c!63355)) b!545427))

(assert (= (and b!545427 res!339365) b!545424))

(assert (= (and b!545424 (not res!339366)) b!545422))

(assert (= (and b!545422 (not res!339367)) b!545421))

(declare-fun m!523009 () Bool)

(assert (=> b!545421 m!523009))

(assert (=> b!545422 m!523009))

(assert (=> d!82235 m!522807))

(declare-fun m!523011 () Bool)

(assert (=> d!82235 m!523011))

(assert (=> d!82235 m!522791))

(assert (=> b!545424 m!523009))

(assert (=> b!545423 m!522807))

(declare-fun m!523013 () Bool)

(assert (=> b!545423 m!523013))

(assert (=> b!545423 m!523013))

(assert (=> b!545423 m!522785))

(declare-fun m!523015 () Bool)

(assert (=> b!545423 m!523015))

(assert (=> b!545080 d!82235))

(declare-fun d!82237 () Bool)

(declare-fun lt!248827 () (_ BitVec 32))

(declare-fun lt!248826 () (_ BitVec 32))

(assert (=> d!82237 (= lt!248827 (bvmul (bvxor lt!248826 (bvlshr lt!248826 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82237 (= lt!248826 ((_ extract 31 0) (bvand (bvxor (select (arr!16527 a!3154) j!147) (bvlshr (select (arr!16527 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82237 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!339368 (let ((h!11608 ((_ extract 31 0) (bvand (bvxor (select (arr!16527 a!3154) j!147) (bvlshr (select (arr!16527 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51099 (bvmul (bvxor h!11608 (bvlshr h!11608 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51099 (bvlshr x!51099 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!339368 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!339368 #b00000000000000000000000000000000))))))

