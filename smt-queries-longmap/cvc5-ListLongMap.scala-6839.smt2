; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86072 () Bool)

(assert start!86072)

(declare-fun b!997094 () Bool)

(declare-fun res!667218 () Bool)

(declare-fun e!562417 () Bool)

(assert (=> b!997094 (=> (not res!667218) (not e!562417))))

(declare-datatypes ((array!63077 0))(
  ( (array!63078 (arr!30370 (Array (_ BitVec 32) (_ BitVec 64))) (size!30872 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63077)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997094 (= res!667218 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997095 () Bool)

(declare-fun res!667216 () Bool)

(declare-fun e!562415 () Bool)

(assert (=> b!997095 (=> (not res!667216) (not e!562415))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9302 0))(
  ( (MissingZero!9302 (index!39579 (_ BitVec 32))) (Found!9302 (index!39580 (_ BitVec 32))) (Intermediate!9302 (undefined!10114 Bool) (index!39581 (_ BitVec 32)) (x!87010 (_ BitVec 32))) (Undefined!9302) (MissingVacant!9302 (index!39582 (_ BitVec 32))) )
))
(declare-fun lt!441343 () SeekEntryResult!9302)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63077 (_ BitVec 32)) SeekEntryResult!9302)

(assert (=> b!997095 (= res!667216 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30370 a!3219) j!170) a!3219 mask!3464) lt!441343))))

(declare-fun b!997097 () Bool)

(declare-fun res!667211 () Bool)

(declare-fun e!562414 () Bool)

(assert (=> b!997097 (=> (not res!667211) (not e!562414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63077 (_ BitVec 32)) Bool)

(assert (=> b!997097 (= res!667211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997098 () Bool)

(assert (=> b!997098 (= e!562415 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsgt mask!3464 #b00111111111111111111111111111111)))))

(declare-fun res!667209 () Bool)

(assert (=> start!86072 (=> (not res!667209) (not e!562417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86072 (= res!667209 (validMask!0 mask!3464))))

(assert (=> start!86072 e!562417))

(declare-fun array_inv!23494 (array!63077) Bool)

(assert (=> start!86072 (array_inv!23494 a!3219)))

(assert (=> start!86072 true))

(declare-fun b!997096 () Bool)

(declare-fun res!667210 () Bool)

(assert (=> b!997096 (=> (not res!667210) (not e!562417))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997096 (= res!667210 (and (= (size!30872 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30872 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30872 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997099 () Bool)

(assert (=> b!997099 (= e!562414 e!562415)))

(declare-fun res!667214 () Bool)

(assert (=> b!997099 (=> (not res!667214) (not e!562415))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997099 (= res!667214 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30370 a!3219) j!170) mask!3464) (select (arr!30370 a!3219) j!170) a!3219 mask!3464) lt!441343))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997099 (= lt!441343 (Intermediate!9302 false resIndex!38 resX!38))))

(declare-fun b!997100 () Bool)

(assert (=> b!997100 (= e!562417 e!562414)))

(declare-fun res!667212 () Bool)

(assert (=> b!997100 (=> (not res!667212) (not e!562414))))

(declare-fun lt!441344 () SeekEntryResult!9302)

(assert (=> b!997100 (= res!667212 (or (= lt!441344 (MissingVacant!9302 i!1194)) (= lt!441344 (MissingZero!9302 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63077 (_ BitVec 32)) SeekEntryResult!9302)

(assert (=> b!997100 (= lt!441344 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!997101 () Bool)

(declare-fun res!667215 () Bool)

(assert (=> b!997101 (=> (not res!667215) (not e!562417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997101 (= res!667215 (validKeyInArray!0 (select (arr!30370 a!3219) j!170)))))

(declare-fun b!997102 () Bool)

(declare-fun res!667217 () Bool)

(assert (=> b!997102 (=> (not res!667217) (not e!562414))))

(assert (=> b!997102 (= res!667217 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30872 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30872 a!3219))))))

(declare-fun b!997103 () Bool)

(declare-fun res!667208 () Bool)

(assert (=> b!997103 (=> (not res!667208) (not e!562414))))

(declare-datatypes ((List!21046 0))(
  ( (Nil!21043) (Cons!21042 (h!22207 (_ BitVec 64)) (t!30047 List!21046)) )
))
(declare-fun arrayNoDuplicates!0 (array!63077 (_ BitVec 32) List!21046) Bool)

(assert (=> b!997103 (= res!667208 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21043))))

(declare-fun b!997104 () Bool)

(declare-fun res!667213 () Bool)

(assert (=> b!997104 (=> (not res!667213) (not e!562417))))

(assert (=> b!997104 (= res!667213 (validKeyInArray!0 k!2224))))

(assert (= (and start!86072 res!667209) b!997096))

(assert (= (and b!997096 res!667210) b!997101))

(assert (= (and b!997101 res!667215) b!997104))

(assert (= (and b!997104 res!667213) b!997094))

(assert (= (and b!997094 res!667218) b!997100))

(assert (= (and b!997100 res!667212) b!997097))

(assert (= (and b!997097 res!667211) b!997103))

(assert (= (and b!997103 res!667208) b!997102))

(assert (= (and b!997102 res!667217) b!997099))

(assert (= (and b!997099 res!667214) b!997095))

(assert (= (and b!997095 res!667216) b!997098))

(declare-fun m!924053 () Bool)

(assert (=> b!997101 m!924053))

(assert (=> b!997101 m!924053))

(declare-fun m!924055 () Bool)

(assert (=> b!997101 m!924055))

(declare-fun m!924057 () Bool)

(assert (=> start!86072 m!924057))

(declare-fun m!924059 () Bool)

(assert (=> start!86072 m!924059))

(assert (=> b!997099 m!924053))

(assert (=> b!997099 m!924053))

(declare-fun m!924061 () Bool)

(assert (=> b!997099 m!924061))

(assert (=> b!997099 m!924061))

(assert (=> b!997099 m!924053))

(declare-fun m!924063 () Bool)

(assert (=> b!997099 m!924063))

(declare-fun m!924065 () Bool)

(assert (=> b!997103 m!924065))

(declare-fun m!924067 () Bool)

(assert (=> b!997094 m!924067))

(assert (=> b!997095 m!924053))

(assert (=> b!997095 m!924053))

(declare-fun m!924069 () Bool)

(assert (=> b!997095 m!924069))

(declare-fun m!924071 () Bool)

(assert (=> b!997097 m!924071))

(declare-fun m!924073 () Bool)

(assert (=> b!997104 m!924073))

(declare-fun m!924075 () Bool)

(assert (=> b!997100 m!924075))

(push 1)

(assert (not b!997097))

(assert (not start!86072))

(assert (not b!997094))

(assert (not b!997095))

(assert (not b!997100))

(assert (not b!997101))

(assert (not b!997099))

(assert (not b!997104))

(assert (not b!997103))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!997181 () Bool)

(declare-fun e!562452 () Bool)

(declare-fun e!562450 () Bool)

(assert (=> b!997181 (= e!562452 e!562450)))

(declare-fun res!667293 () Bool)

(assert (=> b!997181 (=> (not res!667293) (not e!562450))))

(declare-fun e!562451 () Bool)

(assert (=> b!997181 (= res!667293 (not e!562451))))

(declare-fun res!667292 () Bool)

(assert (=> b!997181 (=> (not res!667292) (not e!562451))))

(assert (=> b!997181 (= res!667292 (validKeyInArray!0 (select (arr!30370 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997182 () Bool)

(declare-fun e!562453 () Bool)

(declare-fun call!42242 () Bool)

(assert (=> b!997182 (= e!562453 call!42242)))

(declare-fun b!997183 () Bool)

(assert (=> b!997183 (= e!562453 call!42242)))

(declare-fun b!997184 () Bool)

(declare-fun contains!5868 (List!21046 (_ BitVec 64)) Bool)

(assert (=> b!997184 (= e!562451 (contains!5868 Nil!21043 (select (arr!30370 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997185 () Bool)

(assert (=> b!997185 (= e!562450 e!562453)))

(declare-fun c!101087 () Bool)

(assert (=> b!997185 (= c!101087 (validKeyInArray!0 (select (arr!30370 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119031 () Bool)

(declare-fun res!667291 () Bool)

(assert (=> d!119031 (=> res!667291 e!562452)))

(assert (=> d!119031 (= res!667291 (bvsge #b00000000000000000000000000000000 (size!30872 a!3219)))))

(assert (=> d!119031 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21043) e!562452)))

(declare-fun bm!42239 () Bool)

(assert (=> bm!42239 (= call!42242 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101087 (Cons!21042 (select (arr!30370 a!3219) #b00000000000000000000000000000000) Nil!21043) Nil!21043)))))

(assert (= (and d!119031 (not res!667291)) b!997181))

(assert (= (and b!997181 res!667292) b!997184))

(assert (= (and b!997181 res!667293) b!997185))

(assert (= (and b!997185 c!101087) b!997183))

(assert (= (and b!997185 (not c!101087)) b!997182))

(assert (= (or b!997183 b!997182) bm!42239))

(declare-fun m!924125 () Bool)

(assert (=> b!997181 m!924125))

(assert (=> b!997181 m!924125))

(declare-fun m!924127 () Bool)

(assert (=> b!997181 m!924127))

(assert (=> b!997184 m!924125))

(assert (=> b!997184 m!924125))

(declare-fun m!924129 () Bool)

(assert (=> b!997184 m!924129))

(assert (=> b!997185 m!924125))

(assert (=> b!997185 m!924125))

(assert (=> b!997185 m!924127))

(assert (=> bm!42239 m!924125))

(declare-fun m!924131 () Bool)

(assert (=> bm!42239 m!924131))

(assert (=> b!997103 d!119031))

(declare-fun b!997210 () Bool)

(declare-fun e!562475 () Bool)

(declare-fun call!42247 () Bool)

(assert (=> b!997210 (= e!562475 call!42247)))

(declare-fun b!997211 () Bool)

(declare-fun e!562476 () Bool)

(declare-fun e!562474 () Bool)

(assert (=> b!997211 (= e!562476 e!562474)))

(declare-fun c!101092 () Bool)

(assert (=> b!997211 (= c!101092 (validKeyInArray!0 (select (arr!30370 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997212 () Bool)

(assert (=> b!997212 (= e!562474 call!42247)))

(declare-fun d!119037 () Bool)

(declare-fun res!667310 () Bool)

(assert (=> d!119037 (=> res!667310 e!562476)))

(assert (=> d!119037 (= res!667310 (bvsge #b00000000000000000000000000000000 (size!30872 a!3219)))))

(assert (=> d!119037 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!562476)))

(declare-fun bm!42244 () Bool)

(assert (=> bm!42244 (= call!42247 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!997213 () Bool)

(assert (=> b!997213 (= e!562474 e!562475)))

(declare-fun lt!441363 () (_ BitVec 64))

(assert (=> b!997213 (= lt!441363 (select (arr!30370 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32974 0))(
  ( (Unit!32975) )
))
(declare-fun lt!441365 () Unit!32974)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63077 (_ BitVec 64) (_ BitVec 32)) Unit!32974)

(assert (=> b!997213 (= lt!441365 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441363 #b00000000000000000000000000000000))))

(assert (=> b!997213 (arrayContainsKey!0 a!3219 lt!441363 #b00000000000000000000000000000000)))

(declare-fun lt!441364 () Unit!32974)

(assert (=> b!997213 (= lt!441364 lt!441365)))

(declare-fun res!667311 () Bool)

(assert (=> b!997213 (= res!667311 (= (seekEntryOrOpen!0 (select (arr!30370 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9302 #b00000000000000000000000000000000)))))

(assert (=> b!997213 (=> (not res!667311) (not e!562475))))

(assert (= (and d!119037 (not res!667310)) b!997211))

(assert (= (and b!997211 c!101092) b!997213))

(assert (= (and b!997211 (not c!101092)) b!997212))

(assert (= (and b!997213 res!667311) b!997210))

(assert (= (or b!997210 b!997212) bm!42244))

(assert (=> b!997211 m!924125))

(assert (=> b!997211 m!924125))

(assert (=> b!997211 m!924127))

(declare-fun m!924137 () Bool)

(assert (=> bm!42244 m!924137))

(assert (=> b!997213 m!924125))

(declare-fun m!924139 () Bool)

(assert (=> b!997213 m!924139))

(declare-fun m!924141 () Bool)

(assert (=> b!997213 m!924141))

(assert (=> b!997213 m!924125))

(declare-fun m!924143 () Bool)

(assert (=> b!997213 m!924143))

(assert (=> b!997097 d!119037))

(declare-fun d!119049 () Bool)

(assert (=> d!119049 (= (validKeyInArray!0 (select (arr!30370 a!3219) j!170)) (and (not (= (select (arr!30370 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30370 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!997101 d!119049))

(declare-fun b!997257 () Bool)

(declare-fun e!562505 () SeekEntryResult!9302)

(declare-fun lt!441387 () SeekEntryResult!9302)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63077 (_ BitVec 32)) SeekEntryResult!9302)

(assert (=> b!997257 (= e!562505 (seekKeyOrZeroReturnVacant!0 (x!87010 lt!441387) (index!39581 lt!441387) (index!39581 lt!441387) k!2224 a!3219 mask!3464))))

(declare-fun b!997258 () Bool)

(declare-fun c!101111 () Bool)

(declare-fun lt!441385 () (_ BitVec 64))

(assert (=> b!997258 (= c!101111 (= lt!441385 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!562504 () SeekEntryResult!9302)

(assert (=> b!997258 (= e!562504 e!562505)))

(declare-fun b!997259 () Bool)

(declare-fun e!562506 () SeekEntryResult!9302)

(assert (=> b!997259 (= e!562506 e!562504)))

(assert (=> b!997259 (= lt!441385 (select (arr!30370 a!3219) (index!39581 lt!441387)))))

(declare-fun c!101109 () Bool)

(assert (=> b!997259 (= c!101109 (= lt!441385 k!2224))))

(declare-fun b!997260 () Bool)

(assert (=> b!997260 (= e!562504 (Found!9302 (index!39581 lt!441387)))))

(declare-fun b!997261 () Bool)

(assert (=> b!997261 (= e!562506 Undefined!9302)))

(declare-fun d!119051 () Bool)

(declare-fun lt!441386 () SeekEntryResult!9302)

(assert (=> d!119051 (and (or (is-Undefined!9302 lt!441386) (not (is-Found!9302 lt!441386)) (and (bvsge (index!39580 lt!441386) #b00000000000000000000000000000000) (bvslt (index!39580 lt!441386) (size!30872 a!3219)))) (or (is-Undefined!9302 lt!441386) (is-Found!9302 lt!441386) (not (is-MissingZero!9302 lt!441386)) (and (bvsge (index!39579 lt!441386) #b00000000000000000000000000000000) (bvslt (index!39579 lt!441386) (size!30872 a!3219)))) (or (is-Undefined!9302 lt!441386) (is-Found!9302 lt!441386) (is-MissingZero!9302 lt!441386) (not (is-MissingVacant!9302 lt!441386)) (and (bvsge (index!39582 lt!441386) #b00000000000000000000000000000000) (bvslt (index!39582 lt!441386) (size!30872 a!3219)))) (or (is-Undefined!9302 lt!441386) (ite (is-Found!9302 lt!441386) (= (select (arr!30370 a!3219) (index!39580 lt!441386)) k!2224) (ite (is-MissingZero!9302 lt!441386) (= (select (arr!30370 a!3219) (index!39579 lt!441386)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9302 lt!441386) (= (select (arr!30370 a!3219) (index!39582 lt!441386)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119051 (= lt!441386 e!562506)))

(declare-fun c!101110 () Bool)

(assert (=> d!119051 (= c!101110 (and (is-Intermediate!9302 lt!441387) (undefined!10114 lt!441387)))))

(assert (=> d!119051 (= lt!441387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119051 (validMask!0 mask!3464)))

(assert (=> d!119051 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!441386)))

(declare-fun b!997262 () Bool)

(assert (=> b!997262 (= e!562505 (MissingZero!9302 (index!39581 lt!441387)))))

(assert (= (and d!119051 c!101110) b!997261))

(assert (= (and d!119051 (not c!101110)) b!997259))

(assert (= (and b!997259 c!101109) b!997260))

(assert (= (and b!997259 (not c!101109)) b!997258))

(assert (= (and b!997258 c!101111) b!997262))

(assert (= (and b!997258 (not c!101111)) b!997257))

(declare-fun m!924163 () Bool)

(assert (=> b!997257 m!924163))

(declare-fun m!924165 () Bool)

(assert (=> b!997259 m!924165))

(declare-fun m!924167 () Bool)

(assert (=> d!119051 m!924167))

(declare-fun m!924169 () Bool)

(assert (=> d!119051 m!924169))

(assert (=> d!119051 m!924057))

(declare-fun m!924171 () Bool)

(assert (=> d!119051 m!924171))

(assert (=> d!119051 m!924171))

(declare-fun m!924173 () Bool)

(assert (=> d!119051 m!924173))

(declare-fun m!924175 () Bool)

(assert (=> d!119051 m!924175))

(assert (=> b!997100 d!119051))

(declare-fun d!119059 () Bool)

(assert (=> d!119059 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86072 d!119059))

(declare-fun d!119065 () Bool)

(assert (=> d!119065 (= (array_inv!23494 a!3219) (bvsge (size!30872 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86072 d!119065))

(declare-fun b!997333 () Bool)

(declare-fun lt!441423 () SeekEntryResult!9302)

(assert (=> b!997333 (and (bvsge (index!39581 lt!441423) #b00000000000000000000000000000000) (bvslt (index!39581 lt!441423) (size!30872 a!3219)))))

(declare-fun res!667348 () Bool)

(assert (=> b!997333 (= res!667348 (= (select (arr!30370 a!3219) (index!39581 lt!441423)) (select (arr!30370 a!3219) j!170)))))

(declare-fun e!562549 () Bool)

(assert (=> b!997333 (=> res!667348 e!562549)))

(declare-fun e!562548 () Bool)

(assert (=> b!997333 (= e!562548 e!562549)))

(declare-fun d!119067 () Bool)

(declare-fun e!562546 () Bool)

(assert (=> d!119067 e!562546))

(declare-fun c!101137 () Bool)

(assert (=> d!119067 (= c!101137 (and (is-Intermediate!9302 lt!441423) (undefined!10114 lt!441423)))))

(declare-fun e!562545 () SeekEntryResult!9302)

(assert (=> d!119067 (= lt!441423 e!562545)))

(declare-fun c!101138 () Bool)

(assert (=> d!119067 (= c!101138 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!441422 () (_ BitVec 64))

(assert (=> d!119067 (= lt!441422 (select (arr!30370 a!3219) index!1507))))

(assert (=> d!119067 (validMask!0 mask!3464)))

(assert (=> d!119067 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30370 a!3219) j!170) a!3219 mask!3464) lt!441423)))

(declare-fun b!997334 () Bool)

(assert (=> b!997334 (= e!562546 e!562548)))

(declare-fun res!667349 () Bool)

(assert (=> b!997334 (= res!667349 (and (is-Intermediate!9302 lt!441423) (not (undefined!10114 lt!441423)) (bvslt (x!87010 lt!441423) #b01111111111111111111111111111110) (bvsge (x!87010 lt!441423) #b00000000000000000000000000000000) (bvsge (x!87010 lt!441423) x!1245)))))

(assert (=> b!997334 (=> (not res!667349) (not e!562548))))

(declare-fun b!997335 () Bool)

(assert (=> b!997335 (= e!562546 (bvsge (x!87010 lt!441423) #b01111111111111111111111111111110))))

(declare-fun b!997336 () Bool)

(declare-fun e!562547 () SeekEntryResult!9302)

(assert (=> b!997336 (= e!562545 e!562547)))

(declare-fun c!101136 () Bool)

(assert (=> b!997336 (= c!101136 (or (= lt!441422 (select (arr!30370 a!3219) j!170)) (= (bvadd lt!441422 lt!441422) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!997337 () Bool)

(assert (=> b!997337 (= e!562547 (Intermediate!9302 false index!1507 x!1245))))

(declare-fun b!997338 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997338 (= e!562547 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30370 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997339 () Bool)

(assert (=> b!997339 (and (bvsge (index!39581 lt!441423) #b00000000000000000000000000000000) (bvslt (index!39581 lt!441423) (size!30872 a!3219)))))

(declare-fun res!667347 () Bool)

(assert (=> b!997339 (= res!667347 (= (select (arr!30370 a!3219) (index!39581 lt!441423)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!997339 (=> res!667347 e!562549)))

(declare-fun b!997340 () Bool)

(assert (=> b!997340 (= e!562545 (Intermediate!9302 true index!1507 x!1245))))

(declare-fun b!997341 () Bool)

(assert (=> b!997341 (and (bvsge (index!39581 lt!441423) #b00000000000000000000000000000000) (bvslt (index!39581 lt!441423) (size!30872 a!3219)))))

(assert (=> b!997341 (= e!562549 (= (select (arr!30370 a!3219) (index!39581 lt!441423)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!119067 c!101138) b!997340))

(assert (= (and d!119067 (not c!101138)) b!997336))

(assert (= (and b!997336 c!101136) b!997337))

(assert (= (and b!997336 (not c!101136)) b!997338))

(assert (= (and d!119067 c!101137) b!997335))

(assert (= (and d!119067 (not c!101137)) b!997334))

(assert (= (and b!997334 res!667349) b!997333))

(assert (= (and b!997333 (not res!667348)) b!997339))

(assert (= (and b!997339 (not res!667347)) b!997341))

(declare-fun m!924193 () Bool)

(assert (=> b!997338 m!924193))

(assert (=> b!997338 m!924193))

(assert (=> b!997338 m!924053))

(declare-fun m!924195 () Bool)

(assert (=> b!997338 m!924195))

(declare-fun m!924197 () Bool)

(assert (=> b!997339 m!924197))

(assert (=> b!997333 m!924197))

(assert (=> b!997341 m!924197))

(declare-fun m!924199 () Bool)

(assert (=> d!119067 m!924199))

(assert (=> d!119067 m!924057))

(assert (=> b!997095 d!119067))

(declare-fun d!119073 () Bool)

(declare-fun res!667354 () Bool)

(declare-fun e!562563 () Bool)

(assert (=> d!119073 (=> res!667354 e!562563)))

(assert (=> d!119073 (= res!667354 (= (select (arr!30370 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119073 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!562563)))

(declare-fun b!997364 () Bool)

(declare-fun e!562564 () Bool)

(assert (=> b!997364 (= e!562563 e!562564)))

(declare-fun res!667355 () Bool)

(assert (=> b!997364 (=> (not res!667355) (not e!562564))))

(assert (=> b!997364 (= res!667355 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30872 a!3219)))))

(declare-fun b!997365 () Bool)

(assert (=> b!997365 (= e!562564 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119073 (not res!667354)) b!997364))

(assert (= (and b!997364 res!667355) b!997365))

(assert (=> d!119073 m!924125))

(declare-fun m!924215 () Bool)

(assert (=> b!997365 m!924215))

(assert (=> b!997094 d!119073))

(declare-fun d!119079 () Bool)

(assert (=> d!119079 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!997104 d!119079))

(declare-fun b!997366 () Bool)

(declare-fun lt!441430 () SeekEntryResult!9302)

(assert (=> b!997366 (and (bvsge (index!39581 lt!441430) #b00000000000000000000000000000000) (bvslt (index!39581 lt!441430) (size!30872 a!3219)))))

(declare-fun res!667357 () Bool)

(assert (=> b!997366 (= res!667357 (= (select (arr!30370 a!3219) (index!39581 lt!441430)) (select (arr!30370 a!3219) j!170)))))

(declare-fun e!562569 () Bool)

(assert (=> b!997366 (=> res!667357 e!562569)))

(declare-fun e!562568 () Bool)

(assert (=> b!997366 (= e!562568 e!562569)))

(declare-fun d!119081 () Bool)

(declare-fun e!562566 () Bool)

(assert (=> d!119081 e!562566))

(declare-fun c!101149 () Bool)

(assert (=> d!119081 (= c!101149 (and (is-Intermediate!9302 lt!441430) (undefined!10114 lt!441430)))))

(declare-fun e!562565 () SeekEntryResult!9302)

(assert (=> d!119081 (= lt!441430 e!562565)))

(declare-fun c!101150 () Bool)

(assert (=> d!119081 (= c!101150 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!441429 () (_ BitVec 64))

(assert (=> d!119081 (= lt!441429 (select (arr!30370 a!3219) (toIndex!0 (select (arr!30370 a!3219) j!170) mask!3464)))))

(assert (=> d!119081 (validMask!0 mask!3464)))

(assert (=> d!119081 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30370 a!3219) j!170) mask!3464) (select (arr!30370 a!3219) j!170) a!3219 mask!3464) lt!441430)))

(declare-fun b!997367 () Bool)

(assert (=> b!997367 (= e!562566 e!562568)))

(declare-fun res!667358 () Bool)

(assert (=> b!997367 (= res!667358 (and (is-Intermediate!9302 lt!441430) (not (undefined!10114 lt!441430)) (bvslt (x!87010 lt!441430) #b01111111111111111111111111111110) (bvsge (x!87010 lt!441430) #b00000000000000000000000000000000) (bvsge (x!87010 lt!441430) #b00000000000000000000000000000000)))))

(assert (=> b!997367 (=> (not res!667358) (not e!562568))))

(declare-fun b!997368 () Bool)

(assert (=> b!997368 (= e!562566 (bvsge (x!87010 lt!441430) #b01111111111111111111111111111110))))

(declare-fun b!997369 () Bool)

(declare-fun e!562567 () SeekEntryResult!9302)

(assert (=> b!997369 (= e!562565 e!562567)))

(declare-fun c!101148 () Bool)

(assert (=> b!997369 (= c!101148 (or (= lt!441429 (select (arr!30370 a!3219) j!170)) (= (bvadd lt!441429 lt!441429) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!997370 () Bool)

(assert (=> b!997370 (= e!562567 (Intermediate!9302 false (toIndex!0 (select (arr!30370 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!997371 () Bool)

(assert (=> b!997371 (= e!562567 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30370 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30370 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997372 () Bool)

(assert (=> b!997372 (and (bvsge (index!39581 lt!441430) #b00000000000000000000000000000000) (bvslt (index!39581 lt!441430) (size!30872 a!3219)))))

(declare-fun res!667356 () Bool)

(assert (=> b!997372 (= res!667356 (= (select (arr!30370 a!3219) (index!39581 lt!441430)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!997372 (=> res!667356 e!562569)))

(declare-fun b!997373 () Bool)

(assert (=> b!997373 (= e!562565 (Intermediate!9302 true (toIndex!0 (select (arr!30370 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!997374 () Bool)

(assert (=> b!997374 (and (bvsge (index!39581 lt!441430) #b00000000000000000000000000000000) (bvslt (index!39581 lt!441430) (size!30872 a!3219)))))

(assert (=> b!997374 (= e!562569 (= (select (arr!30370 a!3219) (index!39581 lt!441430)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!119081 c!101150) b!997373))

(assert (= (and d!119081 (not c!101150)) b!997369))

(assert (= (and b!997369 c!101148) b!997370))

(assert (= (and b!997369 (not c!101148)) b!997371))

(assert (= (and d!119081 c!101149) b!997368))

(assert (= (and d!119081 (not c!101149)) b!997367))

(assert (= (and b!997367 res!667358) b!997366))

(assert (= (and b!997366 (not res!667357)) b!997372))

(assert (= (and b!997372 (not res!667356)) b!997374))

(assert (=> b!997371 m!924061))

(declare-fun m!924217 () Bool)

(assert (=> b!997371 m!924217))

(assert (=> b!997371 m!924217))

(assert (=> b!997371 m!924053))

(declare-fun m!924219 () Bool)

(assert (=> b!997371 m!924219))

(declare-fun m!924221 () Bool)

(assert (=> b!997372 m!924221))

(assert (=> b!997366 m!924221))

(assert (=> b!997374 m!924221))

(assert (=> d!119081 m!924061))

(declare-fun m!924223 () Bool)

(assert (=> d!119081 m!924223))

(assert (=> d!119081 m!924057))

(assert (=> b!997099 d!119081))

(declare-fun d!119083 () Bool)

(declare-fun lt!441441 () (_ BitVec 32))

(declare-fun lt!441440 () (_ BitVec 32))

(assert (=> d!119083 (= lt!441441 (bvmul (bvxor lt!441440 (bvlshr lt!441440 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119083 (= lt!441440 ((_ extract 31 0) (bvand (bvxor (select (arr!30370 a!3219) j!170) (bvlshr (select (arr!30370 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119083 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!667365 (let ((h!22212 ((_ extract 31 0) (bvand (bvxor (select (arr!30370 a!3219) j!170) (bvlshr (select (arr!30370 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87018 (bvmul (bvxor h!22212 (bvlshr h!22212 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87018 (bvlshr x!87018 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!667365 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!667365 #b00000000000000000000000000000000))))))

(assert (=> d!119083 (= (toIndex!0 (select (arr!30370 a!3219) j!170) mask!3464) (bvand (bvxor lt!441441 (bvlshr lt!441441 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!997099 d!119083))

(push 1)

(assert (not b!997257))

(assert (not bm!42244))

(assert (not d!119081))

(assert (not d!119067))

(assert (not b!997213))

(assert (not bm!42239))

(assert (not b!997338))

(assert (not b!997365))

(assert (not b!997185))

(assert (not d!119051))

(assert (not b!997181))

(assert (not b!997371))

(assert (not b!997211))

(assert (not b!997184))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

