; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86076 () Bool)

(assert start!86076)

(declare-fun b!997160 () Bool)

(declare-fun res!667275 () Bool)

(declare-fun e!562438 () Bool)

(assert (=> b!997160 (=> (not res!667275) (not e!562438))))

(declare-datatypes ((array!63081 0))(
  ( (array!63082 (arr!30372 (Array (_ BitVec 32) (_ BitVec 64))) (size!30874 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63081)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997160 (= res!667275 (validKeyInArray!0 (select (arr!30372 a!3219) j!170)))))

(declare-fun b!997161 () Bool)

(declare-fun res!667278 () Bool)

(declare-fun e!562441 () Bool)

(assert (=> b!997161 (=> (not res!667278) (not e!562441))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63081 (_ BitVec 32)) Bool)

(assert (=> b!997161 (= res!667278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997162 () Bool)

(declare-fun res!667281 () Bool)

(assert (=> b!997162 (=> (not res!667281) (not e!562438))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997162 (= res!667281 (and (= (size!30874 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30874 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30874 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997163 () Bool)

(declare-fun res!667283 () Bool)

(declare-fun e!562440 () Bool)

(assert (=> b!997163 (=> (not res!667283) (not e!562440))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9304 0))(
  ( (MissingZero!9304 (index!39587 (_ BitVec 32))) (Found!9304 (index!39588 (_ BitVec 32))) (Intermediate!9304 (undefined!10116 Bool) (index!39589 (_ BitVec 32)) (x!87012 (_ BitVec 32))) (Undefined!9304) (MissingVacant!9304 (index!39590 (_ BitVec 32))) )
))
(declare-fun lt!441355 () SeekEntryResult!9304)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63081 (_ BitVec 32)) SeekEntryResult!9304)

(assert (=> b!997163 (= res!667283 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30372 a!3219) j!170) a!3219 mask!3464) lt!441355))))

(declare-fun b!997164 () Bool)

(assert (=> b!997164 (= e!562438 e!562441)))

(declare-fun res!667282 () Bool)

(assert (=> b!997164 (=> (not res!667282) (not e!562441))))

(declare-fun lt!441356 () SeekEntryResult!9304)

(assert (=> b!997164 (= res!667282 (or (= lt!441356 (MissingVacant!9304 i!1194)) (= lt!441356 (MissingZero!9304 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63081 (_ BitVec 32)) SeekEntryResult!9304)

(assert (=> b!997164 (= lt!441356 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!667284 () Bool)

(assert (=> start!86076 (=> (not res!667284) (not e!562438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86076 (= res!667284 (validMask!0 mask!3464))))

(assert (=> start!86076 e!562438))

(declare-fun array_inv!23496 (array!63081) Bool)

(assert (=> start!86076 (array_inv!23496 a!3219)))

(assert (=> start!86076 true))

(declare-fun b!997165 () Bool)

(assert (=> b!997165 (= e!562440 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsgt mask!3464 #b00111111111111111111111111111111)))))

(declare-fun b!997166 () Bool)

(declare-fun res!667274 () Bool)

(assert (=> b!997166 (=> (not res!667274) (not e!562441))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997166 (= res!667274 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30874 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30874 a!3219))))))

(declare-fun b!997167 () Bool)

(declare-fun res!667276 () Bool)

(assert (=> b!997167 (=> (not res!667276) (not e!562438))))

(declare-fun arrayContainsKey!0 (array!63081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997167 (= res!667276 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997168 () Bool)

(declare-fun res!667277 () Bool)

(assert (=> b!997168 (=> (not res!667277) (not e!562441))))

(declare-datatypes ((List!21048 0))(
  ( (Nil!21045) (Cons!21044 (h!22209 (_ BitVec 64)) (t!30049 List!21048)) )
))
(declare-fun arrayNoDuplicates!0 (array!63081 (_ BitVec 32) List!21048) Bool)

(assert (=> b!997168 (= res!667277 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21045))))

(declare-fun b!997169 () Bool)

(declare-fun res!667279 () Bool)

(assert (=> b!997169 (=> (not res!667279) (not e!562438))))

(assert (=> b!997169 (= res!667279 (validKeyInArray!0 k!2224))))

(declare-fun b!997170 () Bool)

(assert (=> b!997170 (= e!562441 e!562440)))

(declare-fun res!667280 () Bool)

(assert (=> b!997170 (=> (not res!667280) (not e!562440))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997170 (= res!667280 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30372 a!3219) j!170) mask!3464) (select (arr!30372 a!3219) j!170) a!3219 mask!3464) lt!441355))))

(assert (=> b!997170 (= lt!441355 (Intermediate!9304 false resIndex!38 resX!38))))

(assert (= (and start!86076 res!667284) b!997162))

(assert (= (and b!997162 res!667281) b!997160))

(assert (= (and b!997160 res!667275) b!997169))

(assert (= (and b!997169 res!667279) b!997167))

(assert (= (and b!997167 res!667276) b!997164))

(assert (= (and b!997164 res!667282) b!997161))

(assert (= (and b!997161 res!667278) b!997168))

(assert (= (and b!997168 res!667277) b!997166))

(assert (= (and b!997166 res!667274) b!997170))

(assert (= (and b!997170 res!667280) b!997163))

(assert (= (and b!997163 res!667283) b!997165))

(declare-fun m!924101 () Bool)

(assert (=> b!997160 m!924101))

(assert (=> b!997160 m!924101))

(declare-fun m!924103 () Bool)

(assert (=> b!997160 m!924103))

(declare-fun m!924105 () Bool)

(assert (=> b!997167 m!924105))

(declare-fun m!924107 () Bool)

(assert (=> b!997161 m!924107))

(declare-fun m!924109 () Bool)

(assert (=> b!997168 m!924109))

(declare-fun m!924111 () Bool)

(assert (=> b!997169 m!924111))

(assert (=> b!997163 m!924101))

(assert (=> b!997163 m!924101))

(declare-fun m!924113 () Bool)

(assert (=> b!997163 m!924113))

(declare-fun m!924115 () Bool)

(assert (=> b!997164 m!924115))

(declare-fun m!924117 () Bool)

(assert (=> start!86076 m!924117))

(declare-fun m!924119 () Bool)

(assert (=> start!86076 m!924119))

(assert (=> b!997170 m!924101))

(assert (=> b!997170 m!924101))

(declare-fun m!924121 () Bool)

(assert (=> b!997170 m!924121))

(assert (=> b!997170 m!924121))

(assert (=> b!997170 m!924101))

(declare-fun m!924123 () Bool)

(assert (=> b!997170 m!924123))

(push 1)

(assert (not b!997164))

(assert (not start!86076))

(assert (not b!997170))

(assert (not b!997167))

(assert (not b!997168))

(assert (not b!997160))

(assert (not b!997169))

(assert (not b!997161))

(assert (not b!997163))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!119033 () Bool)

(assert (=> d!119033 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86076 d!119033))

(declare-fun d!119045 () Bool)

(assert (=> d!119045 (= (array_inv!23496 a!3219) (bvsge (size!30874 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86076 d!119045))

(declare-fun b!997227 () Bool)

(declare-fun e!562489 () Bool)

(declare-fun call!42251 () Bool)

(assert (=> b!997227 (= e!562489 call!42251)))

(declare-fun d!119047 () Bool)

(declare-fun res!667320 () Bool)

(declare-fun e!562487 () Bool)

(assert (=> d!119047 (=> res!667320 e!562487)))

(assert (=> d!119047 (= res!667320 (bvsge #b00000000000000000000000000000000 (size!30874 a!3219)))))

(assert (=> d!119047 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!562487)))

(declare-fun b!997228 () Bool)

(declare-fun e!562488 () Bool)

(assert (=> b!997228 (= e!562488 call!42251)))

(declare-fun b!997229 () Bool)

(assert (=> b!997229 (= e!562487 e!562489)))

(declare-fun c!101096 () Bool)

(assert (=> b!997229 (= c!101096 (validKeyInArray!0 (select (arr!30372 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42248 () Bool)

(assert (=> bm!42248 (= call!42251 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!997230 () Bool)

(assert (=> b!997230 (= e!562489 e!562488)))

(declare-fun lt!441373 () (_ BitVec 64))

(assert (=> b!997230 (= lt!441373 (select (arr!30372 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32976 0))(
  ( (Unit!32977) )
))
(declare-fun lt!441374 () Unit!32976)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63081 (_ BitVec 64) (_ BitVec 32)) Unit!32976)

(assert (=> b!997230 (= lt!441374 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441373 #b00000000000000000000000000000000))))

(assert (=> b!997230 (arrayContainsKey!0 a!3219 lt!441373 #b00000000000000000000000000000000)))

(declare-fun lt!441372 () Unit!32976)

(assert (=> b!997230 (= lt!441372 lt!441374)))

(declare-fun res!667319 () Bool)

(assert (=> b!997230 (= res!667319 (= (seekEntryOrOpen!0 (select (arr!30372 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9304 #b00000000000000000000000000000000)))))

(assert (=> b!997230 (=> (not res!667319) (not e!562488))))

(assert (= (and d!119047 (not res!667320)) b!997229))

(assert (= (and b!997229 c!101096) b!997230))

(assert (= (and b!997229 (not c!101096)) b!997227))

(assert (= (and b!997230 res!667319) b!997228))

(assert (= (or b!997228 b!997227) bm!42248))

(declare-fun m!924151 () Bool)

(assert (=> b!997229 m!924151))

(assert (=> b!997229 m!924151))

(declare-fun m!924153 () Bool)

(assert (=> b!997229 m!924153))

(declare-fun m!924155 () Bool)

(assert (=> bm!42248 m!924155))

(assert (=> b!997230 m!924151))

(declare-fun m!924157 () Bool)

(assert (=> b!997230 m!924157))

(declare-fun m!924159 () Bool)

(assert (=> b!997230 m!924159))

(assert (=> b!997230 m!924151))

(declare-fun m!924161 () Bool)

(assert (=> b!997230 m!924161))

(assert (=> b!997161 d!119047))

(declare-fun d!119055 () Bool)

(assert (=> d!119055 (= (validKeyInArray!0 (select (arr!30372 a!3219) j!170)) (and (not (= (select (arr!30372 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30372 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!997160 d!119055))

(declare-fun b!997294 () Bool)

(declare-fun lt!441395 () SeekEntryResult!9304)

(assert (=> b!997294 (and (bvsge (index!39589 lt!441395) #b00000000000000000000000000000000) (bvslt (index!39589 lt!441395) (size!30874 a!3219)))))

(declare-fun e!562524 () Bool)

(assert (=> b!997294 (= e!562524 (= (select (arr!30372 a!3219) (index!39589 lt!441395)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!997295 () Bool)

(assert (=> b!997295 (and (bvsge (index!39589 lt!441395) #b00000000000000000000000000000000) (bvslt (index!39589 lt!441395) (size!30874 a!3219)))))

(declare-fun res!667336 () Bool)

(assert (=> b!997295 (= res!667336 (= (select (arr!30372 a!3219) (index!39589 lt!441395)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!997295 (=> res!667336 e!562524)))

(declare-fun b!997296 () Bool)

(declare-fun e!562526 () SeekEntryResult!9304)

(assert (=> b!997296 (= e!562526 (Intermediate!9304 false (toIndex!0 (select (arr!30372 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun d!119057 () Bool)

(declare-fun e!562527 () Bool)

(assert (=> d!119057 e!562527))

(declare-fun c!101122 () Bool)

(assert (=> d!119057 (= c!101122 (and (is-Intermediate!9304 lt!441395) (undefined!10116 lt!441395)))))

(declare-fun e!562528 () SeekEntryResult!9304)

(assert (=> d!119057 (= lt!441395 e!562528)))

(declare-fun c!101121 () Bool)

(assert (=> d!119057 (= c!101121 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!441394 () (_ BitVec 64))

(assert (=> d!119057 (= lt!441394 (select (arr!30372 a!3219) (toIndex!0 (select (arr!30372 a!3219) j!170) mask!3464)))))

(assert (=> d!119057 (validMask!0 mask!3464)))

(assert (=> d!119057 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30372 a!3219) j!170) mask!3464) (select (arr!30372 a!3219) j!170) a!3219 mask!3464) lt!441395)))

(declare-fun b!997297 () Bool)

(assert (=> b!997297 (= e!562528 e!562526)))

(declare-fun c!101123 () Bool)

(assert (=> b!997297 (= c!101123 (or (= lt!441394 (select (arr!30372 a!3219) j!170)) (= (bvadd lt!441394 lt!441394) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!997298 () Bool)

(declare-fun e!562525 () Bool)

(assert (=> b!997298 (= e!562527 e!562525)))

(declare-fun res!667337 () Bool)

(assert (=> b!997298 (= res!667337 (and (is-Intermediate!9304 lt!441395) (not (undefined!10116 lt!441395)) (bvslt (x!87012 lt!441395) #b01111111111111111111111111111110) (bvsge (x!87012 lt!441395) #b00000000000000000000000000000000) (bvsge (x!87012 lt!441395) #b00000000000000000000000000000000)))))

(assert (=> b!997298 (=> (not res!667337) (not e!562525))))

(declare-fun b!997299 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997299 (= e!562526 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30372 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30372 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997300 () Bool)

(assert (=> b!997300 (and (bvsge (index!39589 lt!441395) #b00000000000000000000000000000000) (bvslt (index!39589 lt!441395) (size!30874 a!3219)))))

(declare-fun res!667338 () Bool)

(assert (=> b!997300 (= res!667338 (= (select (arr!30372 a!3219) (index!39589 lt!441395)) (select (arr!30372 a!3219) j!170)))))

(assert (=> b!997300 (=> res!667338 e!562524)))

(assert (=> b!997300 (= e!562525 e!562524)))

(declare-fun b!997301 () Bool)

(assert (=> b!997301 (= e!562527 (bvsge (x!87012 lt!441395) #b01111111111111111111111111111110))))

(declare-fun b!997302 () Bool)

(assert (=> b!997302 (= e!562528 (Intermediate!9304 true (toIndex!0 (select (arr!30372 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(assert (= (and d!119057 c!101121) b!997302))

(assert (= (and d!119057 (not c!101121)) b!997297))

(assert (= (and b!997297 c!101123) b!997296))

(assert (= (and b!997297 (not c!101123)) b!997299))

(assert (= (and d!119057 c!101122) b!997301))

(assert (= (and d!119057 (not c!101122)) b!997298))

(assert (= (and b!997298 res!667337) b!997300))

(assert (= (and b!997300 (not res!667338)) b!997295))

(assert (= (and b!997295 (not res!667336)) b!997294))

(assert (=> b!997299 m!924121))

(declare-fun m!924185 () Bool)

(assert (=> b!997299 m!924185))

(assert (=> b!997299 m!924185))

(assert (=> b!997299 m!924101))

(declare-fun m!924187 () Bool)

(assert (=> b!997299 m!924187))

(declare-fun m!924189 () Bool)

(assert (=> b!997295 m!924189))

(assert (=> b!997294 m!924189))

(assert (=> d!119057 m!924121))

(declare-fun m!924191 () Bool)

(assert (=> d!119057 m!924191))

(assert (=> d!119057 m!924117))

(assert (=> b!997300 m!924189))

(assert (=> b!997170 d!119057))

(declare-fun d!119063 () Bool)

(declare-fun lt!441405 () (_ BitVec 32))

(declare-fun lt!441404 () (_ BitVec 32))

(assert (=> d!119063 (= lt!441405 (bvmul (bvxor lt!441404 (bvlshr lt!441404 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119063 (= lt!441404 ((_ extract 31 0) (bvand (bvxor (select (arr!30372 a!3219) j!170) (bvlshr (select (arr!30372 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119063 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!667340 (let ((h!22211 ((_ extract 31 0) (bvand (bvxor (select (arr!30372 a!3219) j!170) (bvlshr (select (arr!30372 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87016 (bvmul (bvxor h!22211 (bvlshr h!22211 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87016 (bvlshr x!87016 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!667340 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!667340 #b00000000000000000000000000000000))))))

(assert (=> d!119063 (= (toIndex!0 (select (arr!30372 a!3219) j!170) mask!3464) (bvand (bvxor lt!441405 (bvlshr lt!441405 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!997170 d!119063))

(declare-fun b!997354 () Bool)

(declare-fun e!562557 () SeekEntryResult!9304)

(assert (=> b!997354 (= e!562557 Undefined!9304)))

(declare-fun d!119069 () Bool)

(declare-fun lt!441427 () SeekEntryResult!9304)

(assert (=> d!119069 (and (or (is-Undefined!9304 lt!441427) (not (is-Found!9304 lt!441427)) (and (bvsge (index!39588 lt!441427) #b00000000000000000000000000000000) (bvslt (index!39588 lt!441427) (size!30874 a!3219)))) (or (is-Undefined!9304 lt!441427) (is-Found!9304 lt!441427) (not (is-MissingZero!9304 lt!441427)) (and (bvsge (index!39587 lt!441427) #b00000000000000000000000000000000) (bvslt (index!39587 lt!441427) (size!30874 a!3219)))) (or (is-Undefined!9304 lt!441427) (is-Found!9304 lt!441427) (is-MissingZero!9304 lt!441427) (not (is-MissingVacant!9304 lt!441427)) (and (bvsge (index!39590 lt!441427) #b00000000000000000000000000000000) (bvslt (index!39590 lt!441427) (size!30874 a!3219)))) (or (is-Undefined!9304 lt!441427) (ite (is-Found!9304 lt!441427) (= (select (arr!30372 a!3219) (index!39588 lt!441427)) k!2224) (ite (is-MissingZero!9304 lt!441427) (= (select (arr!30372 a!3219) (index!39587 lt!441427)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9304 lt!441427) (= (select (arr!30372 a!3219) (index!39590 lt!441427)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119069 (= lt!441427 e!562557)))

(declare-fun c!101147 () Bool)

(declare-fun lt!441426 () SeekEntryResult!9304)

(assert (=> d!119069 (= c!101147 (and (is-Intermediate!9304 lt!441426) (undefined!10116 lt!441426)))))

(assert (=> d!119069 (= lt!441426 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119069 (validMask!0 mask!3464)))

(assert (=> d!119069 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!441427)))

(declare-fun b!997355 () Bool)

(declare-fun e!562556 () SeekEntryResult!9304)

(assert (=> b!997355 (= e!562557 e!562556)))

(declare-fun lt!441428 () (_ BitVec 64))

(assert (=> b!997355 (= lt!441428 (select (arr!30372 a!3219) (index!39589 lt!441426)))))

(declare-fun c!101145 () Bool)

(assert (=> b!997355 (= c!101145 (= lt!441428 k!2224))))

(declare-fun b!997356 () Bool)

(declare-fun c!101146 () Bool)

(assert (=> b!997356 (= c!101146 (= lt!441428 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!562558 () SeekEntryResult!9304)

(assert (=> b!997356 (= e!562556 e!562558)))

(declare-fun b!997357 () Bool)

(assert (=> b!997357 (= e!562558 (MissingZero!9304 (index!39589 lt!441426)))))

(declare-fun b!997358 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63081 (_ BitVec 32)) SeekEntryResult!9304)

(assert (=> b!997358 (= e!562558 (seekKeyOrZeroReturnVacant!0 (x!87012 lt!441426) (index!39589 lt!441426) (index!39589 lt!441426) k!2224 a!3219 mask!3464))))

(declare-fun b!997359 () Bool)

(assert (=> b!997359 (= e!562556 (Found!9304 (index!39589 lt!441426)))))

(assert (= (and d!119069 c!101147) b!997354))

(assert (= (and d!119069 (not c!101147)) b!997355))

(assert (= (and b!997355 c!101145) b!997359))

(assert (= (and b!997355 (not c!101145)) b!997356))

(assert (= (and b!997356 c!101146) b!997357))

(assert (= (and b!997356 (not c!101146)) b!997358))

(declare-fun m!924201 () Bool)

(assert (=> d!119069 m!924201))

(assert (=> d!119069 m!924201))

(declare-fun m!924203 () Bool)

(assert (=> d!119069 m!924203))

(assert (=> d!119069 m!924117))

(declare-fun m!924205 () Bool)

(assert (=> d!119069 m!924205))

(declare-fun m!924207 () Bool)

(assert (=> d!119069 m!924207))

(declare-fun m!924209 () Bool)

(assert (=> d!119069 m!924209))

(declare-fun m!924211 () Bool)

(assert (=> b!997355 m!924211))

(declare-fun m!924213 () Bool)

(assert (=> b!997358 m!924213))

(assert (=> b!997164 d!119069))

(declare-fun d!119075 () Bool)

(assert (=> d!119075 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!997169 d!119075))

(declare-fun b!997391 () Bool)

(declare-fun e!562584 () Bool)

(declare-fun call!42254 () Bool)

(assert (=> b!997391 (= e!562584 call!42254)))

(declare-fun b!997392 () Bool)

(assert (=> b!997392 (= e!562584 call!42254)))

(declare-fun b!997393 () Bool)

(declare-fun e!562583 () Bool)

(declare-fun contains!5870 (List!21048 (_ BitVec 64)) Bool)

(assert (=> b!997393 (= e!562583 (contains!5870 Nil!21045 (select (arr!30372 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997394 () Bool)

(declare-fun e!562581 () Bool)

(assert (=> b!997394 (= e!562581 e!562584)))

(declare-fun c!101156 () Bool)

(assert (=> b!997394 (= c!101156 (validKeyInArray!0 (select (arr!30372 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997395 () Bool)

(declare-fun e!562582 () Bool)

(assert (=> b!997395 (= e!562582 e!562581)))

(declare-fun res!667366 () Bool)

(assert (=> b!997395 (=> (not res!667366) (not e!562581))))

(assert (=> b!997395 (= res!667366 (not e!562583))))

(declare-fun res!667368 () Bool)

(assert (=> b!997395 (=> (not res!667368) (not e!562583))))

(assert (=> b!997395 (= res!667368 (validKeyInArray!0 (select (arr!30372 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42251 () Bool)

(assert (=> bm!42251 (= call!42254 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101156 (Cons!21044 (select (arr!30372 a!3219) #b00000000000000000000000000000000) Nil!21045) Nil!21045)))))

(declare-fun d!119077 () Bool)

(declare-fun res!667367 () Bool)

(assert (=> d!119077 (=> res!667367 e!562582)))

(assert (=> d!119077 (= res!667367 (bvsge #b00000000000000000000000000000000 (size!30874 a!3219)))))

(assert (=> d!119077 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21045) e!562582)))

(assert (= (and d!119077 (not res!667367)) b!997395))

(assert (= (and b!997395 res!667368) b!997393))

(assert (= (and b!997395 res!667366) b!997394))

(assert (= (and b!997394 c!101156) b!997391))

(assert (= (and b!997394 (not c!101156)) b!997392))

(assert (= (or b!997391 b!997392) bm!42251))

(assert (=> b!997393 m!924151))

(assert (=> b!997393 m!924151))

(declare-fun m!924239 () Bool)

(assert (=> b!997393 m!924239))

(assert (=> b!997394 m!924151))

(assert (=> b!997394 m!924151))

(assert (=> b!997394 m!924153))

(assert (=> b!997395 m!924151))

(assert (=> b!997395 m!924151))

(assert (=> b!997395 m!924153))

(assert (=> bm!42251 m!924151))

(declare-fun m!924241 () Bool)

(assert (=> bm!42251 m!924241))

(assert (=> b!997168 d!119077))

(declare-fun b!997396 () Bool)

(declare-fun lt!441437 () SeekEntryResult!9304)

(assert (=> b!997396 (and (bvsge (index!39589 lt!441437) #b00000000000000000000000000000000) (bvslt (index!39589 lt!441437) (size!30874 a!3219)))))

(declare-fun e!562585 () Bool)

(assert (=> b!997396 (= e!562585 (= (select (arr!30372 a!3219) (index!39589 lt!441437)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!997397 () Bool)

(assert (=> b!997397 (and (bvsge (index!39589 lt!441437) #b00000000000000000000000000000000) (bvslt (index!39589 lt!441437) (size!30874 a!3219)))))

(declare-fun res!667369 () Bool)

(assert (=> b!997397 (= res!667369 (= (select (arr!30372 a!3219) (index!39589 lt!441437)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!997397 (=> res!667369 e!562585)))

(declare-fun b!997398 () Bool)

(declare-fun e!562587 () SeekEntryResult!9304)

(assert (=> b!997398 (= e!562587 (Intermediate!9304 false index!1507 x!1245))))

(declare-fun d!119087 () Bool)

(declare-fun e!562588 () Bool)

(assert (=> d!119087 e!562588))

(declare-fun c!101158 () Bool)

(assert (=> d!119087 (= c!101158 (and (is-Intermediate!9304 lt!441437) (undefined!10116 lt!441437)))))

(declare-fun e!562589 () SeekEntryResult!9304)

(assert (=> d!119087 (= lt!441437 e!562589)))

(declare-fun c!101157 () Bool)

(assert (=> d!119087 (= c!101157 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!441436 () (_ BitVec 64))

(assert (=> d!119087 (= lt!441436 (select (arr!30372 a!3219) index!1507))))

(assert (=> d!119087 (validMask!0 mask!3464)))

(assert (=> d!119087 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30372 a!3219) j!170) a!3219 mask!3464) lt!441437)))

(declare-fun b!997399 () Bool)

(assert (=> b!997399 (= e!562589 e!562587)))

(declare-fun c!101159 () Bool)

(assert (=> b!997399 (= c!101159 (or (= lt!441436 (select (arr!30372 a!3219) j!170)) (= (bvadd lt!441436 lt!441436) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!997400 () Bool)

(declare-fun e!562586 () Bool)

(assert (=> b!997400 (= e!562588 e!562586)))

(declare-fun res!667370 () Bool)

(assert (=> b!997400 (= res!667370 (and (is-Intermediate!9304 lt!441437) (not (undefined!10116 lt!441437)) (bvslt (x!87012 lt!441437) #b01111111111111111111111111111110) (bvsge (x!87012 lt!441437) #b00000000000000000000000000000000) (bvsge (x!87012 lt!441437) x!1245)))))

(assert (=> b!997400 (=> (not res!667370) (not e!562586))))

(declare-fun b!997401 () Bool)

(assert (=> b!997401 (= e!562587 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30372 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997402 () Bool)

(assert (=> b!997402 (and (bvsge (index!39589 lt!441437) #b00000000000000000000000000000000) (bvslt (index!39589 lt!441437) (size!30874 a!3219)))))

(declare-fun res!667371 () Bool)

(assert (=> b!997402 (= res!667371 (= (select (arr!30372 a!3219) (index!39589 lt!441437)) (select (arr!30372 a!3219) j!170)))))

(assert (=> b!997402 (=> res!667371 e!562585)))

