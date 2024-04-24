; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87184 () Bool)

(assert start!87184)

(declare-fun b!1010055 () Bool)

(declare-fun res!678197 () Bool)

(declare-fun e!568380 () Bool)

(assert (=> b!1010055 (=> (not res!678197) (not e!568380))))

(declare-datatypes ((array!63651 0))(
  ( (array!63652 (arr!30640 (Array (_ BitVec 32) (_ BitVec 64))) (size!31143 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63651)

(declare-datatypes ((List!21287 0))(
  ( (Nil!21284) (Cons!21283 (h!22478 (_ BitVec 64)) (t!30280 List!21287)) )
))
(declare-fun arrayNoDuplicates!0 (array!63651 (_ BitVec 32) List!21287) Bool)

(assert (=> b!1010055 (= res!678197 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21284))))

(declare-fun b!1010056 () Bool)

(declare-fun res!678190 () Bool)

(assert (=> b!1010056 (=> (not res!678190) (not e!568380))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010056 (= res!678190 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31143 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31143 a!3219))))))

(declare-fun b!1010057 () Bool)

(declare-fun res!678194 () Bool)

(declare-fun e!568378 () Bool)

(assert (=> b!1010057 (=> (not res!678194) (not e!568378))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1010057 (= res!678194 (and (= (size!31143 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31143 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31143 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1010058 () Bool)

(declare-fun res!678193 () Bool)

(declare-fun e!568375 () Bool)

(assert (=> b!1010058 (=> (not res!678193) (not e!568375))))

(declare-fun lt!446366 () array!63651)

(declare-datatypes ((SeekEntryResult!9508 0))(
  ( (MissingZero!9508 (index!40403 (_ BitVec 32))) (Found!9508 (index!40404 (_ BitVec 32))) (Intermediate!9508 (undefined!10320 Bool) (index!40405 (_ BitVec 32)) (x!87950 (_ BitVec 32))) (Undefined!9508) (MissingVacant!9508 (index!40406 (_ BitVec 32))) )
))
(declare-fun lt!446363 () SeekEntryResult!9508)

(declare-fun lt!446367 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63651 (_ BitVec 32)) SeekEntryResult!9508)

(assert (=> b!1010058 (= res!678193 (not (= lt!446363 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446367 lt!446366 mask!3464))))))

(declare-fun res!678189 () Bool)

(assert (=> start!87184 (=> (not res!678189) (not e!568378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87184 (= res!678189 (validMask!0 mask!3464))))

(assert (=> start!87184 e!568378))

(declare-fun array_inv!23776 (array!63651) Bool)

(assert (=> start!87184 (array_inv!23776 a!3219)))

(assert (=> start!87184 true))

(declare-fun b!1010059 () Bool)

(declare-fun res!678191 () Bool)

(assert (=> b!1010059 (=> (not res!678191) (not e!568380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63651 (_ BitVec 32)) Bool)

(assert (=> b!1010059 (= res!678191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010060 () Bool)

(declare-fun res!678192 () Bool)

(assert (=> b!1010060 (=> (not res!678192) (not e!568378))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010060 (= res!678192 (validKeyInArray!0 k0!2224))))

(declare-fun b!1010061 () Bool)

(declare-fun res!678199 () Bool)

(assert (=> b!1010061 (=> (not res!678199) (not e!568378))))

(declare-fun arrayContainsKey!0 (array!63651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010061 (= res!678199 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1010062 () Bool)

(declare-fun res!678188 () Bool)

(assert (=> b!1010062 (=> (not res!678188) (not e!568378))))

(assert (=> b!1010062 (= res!678188 (validKeyInArray!0 (select (arr!30640 a!3219) j!170)))))

(declare-fun b!1010063 () Bool)

(declare-fun e!568379 () Bool)

(declare-fun e!568377 () Bool)

(assert (=> b!1010063 (= e!568379 e!568377)))

(declare-fun res!678198 () Bool)

(assert (=> b!1010063 (=> (not res!678198) (not e!568377))))

(declare-fun lt!446365 () SeekEntryResult!9508)

(assert (=> b!1010063 (= res!678198 (= lt!446363 lt!446365))))

(assert (=> b!1010063 (= lt!446363 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30640 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010064 () Bool)

(assert (=> b!1010064 (= e!568375 (bvsgt (bvadd #b00000000000000000000000000000001 x!1245) resX!38))))

(declare-fun lt!446364 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010064 (= lt!446364 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1010065 () Bool)

(declare-fun res!678196 () Bool)

(assert (=> b!1010065 (=> (not res!678196) (not e!568375))))

(assert (=> b!1010065 (= res!678196 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010066 () Bool)

(assert (=> b!1010066 (= e!568378 e!568380)))

(declare-fun res!678200 () Bool)

(assert (=> b!1010066 (=> (not res!678200) (not e!568380))))

(declare-fun lt!446368 () SeekEntryResult!9508)

(assert (=> b!1010066 (= res!678200 (or (= lt!446368 (MissingVacant!9508 i!1194)) (= lt!446368 (MissingZero!9508 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63651 (_ BitVec 32)) SeekEntryResult!9508)

(assert (=> b!1010066 (= lt!446368 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1010067 () Bool)

(assert (=> b!1010067 (= e!568380 e!568379)))

(declare-fun res!678195 () Bool)

(assert (=> b!1010067 (=> (not res!678195) (not e!568379))))

(declare-fun lt!446369 () SeekEntryResult!9508)

(assert (=> b!1010067 (= res!678195 (= lt!446369 lt!446365))))

(assert (=> b!1010067 (= lt!446365 (Intermediate!9508 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010067 (= lt!446369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) (select (arr!30640 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010068 () Bool)

(assert (=> b!1010068 (= e!568377 e!568375)))

(declare-fun res!678187 () Bool)

(assert (=> b!1010068 (=> (not res!678187) (not e!568375))))

(assert (=> b!1010068 (= res!678187 (not (= lt!446369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446367 mask!3464) lt!446367 lt!446366 mask!3464))))))

(assert (=> b!1010068 (= lt!446367 (select (store (arr!30640 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1010068 (= lt!446366 (array!63652 (store (arr!30640 a!3219) i!1194 k0!2224) (size!31143 a!3219)))))

(assert (= (and start!87184 res!678189) b!1010057))

(assert (= (and b!1010057 res!678194) b!1010062))

(assert (= (and b!1010062 res!678188) b!1010060))

(assert (= (and b!1010060 res!678192) b!1010061))

(assert (= (and b!1010061 res!678199) b!1010066))

(assert (= (and b!1010066 res!678200) b!1010059))

(assert (= (and b!1010059 res!678191) b!1010055))

(assert (= (and b!1010055 res!678197) b!1010056))

(assert (= (and b!1010056 res!678190) b!1010067))

(assert (= (and b!1010067 res!678195) b!1010063))

(assert (= (and b!1010063 res!678198) b!1010068))

(assert (= (and b!1010068 res!678187) b!1010058))

(assert (= (and b!1010058 res!678193) b!1010065))

(assert (= (and b!1010065 res!678196) b!1010064))

(declare-fun m!935027 () Bool)

(assert (=> b!1010058 m!935027))

(declare-fun m!935029 () Bool)

(assert (=> b!1010068 m!935029))

(assert (=> b!1010068 m!935029))

(declare-fun m!935031 () Bool)

(assert (=> b!1010068 m!935031))

(declare-fun m!935033 () Bool)

(assert (=> b!1010068 m!935033))

(declare-fun m!935035 () Bool)

(assert (=> b!1010068 m!935035))

(declare-fun m!935037 () Bool)

(assert (=> b!1010055 m!935037))

(declare-fun m!935039 () Bool)

(assert (=> b!1010064 m!935039))

(declare-fun m!935041 () Bool)

(assert (=> b!1010067 m!935041))

(assert (=> b!1010067 m!935041))

(declare-fun m!935043 () Bool)

(assert (=> b!1010067 m!935043))

(assert (=> b!1010067 m!935043))

(assert (=> b!1010067 m!935041))

(declare-fun m!935045 () Bool)

(assert (=> b!1010067 m!935045))

(assert (=> b!1010062 m!935041))

(assert (=> b!1010062 m!935041))

(declare-fun m!935047 () Bool)

(assert (=> b!1010062 m!935047))

(declare-fun m!935049 () Bool)

(assert (=> b!1010066 m!935049))

(assert (=> b!1010063 m!935041))

(assert (=> b!1010063 m!935041))

(declare-fun m!935051 () Bool)

(assert (=> b!1010063 m!935051))

(declare-fun m!935053 () Bool)

(assert (=> b!1010059 m!935053))

(declare-fun m!935055 () Bool)

(assert (=> b!1010060 m!935055))

(declare-fun m!935057 () Bool)

(assert (=> b!1010061 m!935057))

(declare-fun m!935059 () Bool)

(assert (=> start!87184 m!935059))

(declare-fun m!935061 () Bool)

(assert (=> start!87184 m!935061))

(check-sat (not b!1010060) (not b!1010061) (not b!1010064) (not b!1010059) (not b!1010063) (not b!1010058) (not b!1010067) (not start!87184) (not b!1010062) (not b!1010055) (not b!1010066) (not b!1010068))
(check-sat)
(get-model)

(declare-fun d!120155 () Bool)

(assert (=> d!120155 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!87184 d!120155))

(declare-fun d!120157 () Bool)

(assert (=> d!120157 (= (array_inv!23776 a!3219) (bvsge (size!31143 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!87184 d!120157))

(declare-fun d!120159 () Bool)

(assert (=> d!120159 (= (validKeyInArray!0 (select (arr!30640 a!3219) j!170)) (and (not (= (select (arr!30640 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30640 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1010062 d!120159))

(declare-fun d!120161 () Bool)

(declare-fun res!678289 () Bool)

(declare-fun e!568421 () Bool)

(assert (=> d!120161 (=> res!678289 e!568421)))

(assert (=> d!120161 (= res!678289 (= (select (arr!30640 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!120161 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!568421)))

(declare-fun b!1010157 () Bool)

(declare-fun e!568422 () Bool)

(assert (=> b!1010157 (= e!568421 e!568422)))

(declare-fun res!678290 () Bool)

(assert (=> b!1010157 (=> (not res!678290) (not e!568422))))

(assert (=> b!1010157 (= res!678290 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31143 a!3219)))))

(declare-fun b!1010158 () Bool)

(assert (=> b!1010158 (= e!568422 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!120161 (not res!678289)) b!1010157))

(assert (= (and b!1010157 res!678290) b!1010158))

(declare-fun m!935135 () Bool)

(assert (=> d!120161 m!935135))

(declare-fun m!935137 () Bool)

(assert (=> b!1010158 m!935137))

(assert (=> b!1010061 d!120161))

(declare-fun d!120163 () Bool)

(assert (=> d!120163 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1010060 d!120163))

(declare-fun d!120165 () Bool)

(declare-fun lt!446414 () (_ BitVec 32))

(assert (=> d!120165 (and (bvsge lt!446414 #b00000000000000000000000000000000) (bvslt lt!446414 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!120165 (= lt!446414 (choose!52 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(assert (=> d!120165 (validMask!0 mask!3464)))

(assert (=> d!120165 (= (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464) lt!446414)))

(declare-fun bs!28709 () Bool)

(assert (= bs!28709 d!120165))

(declare-fun m!935139 () Bool)

(assert (=> bs!28709 m!935139))

(assert (=> bs!28709 m!935059))

(assert (=> b!1010064 d!120165))

(declare-fun b!1010177 () Bool)

(declare-fun e!568433 () Bool)

(declare-fun e!568434 () Bool)

(assert (=> b!1010177 (= e!568433 e!568434)))

(declare-fun res!678297 () Bool)

(declare-fun lt!446420 () SeekEntryResult!9508)

(get-info :version)

(assert (=> b!1010177 (= res!678297 (and ((_ is Intermediate!9508) lt!446420) (not (undefined!10320 lt!446420)) (bvslt (x!87950 lt!446420) #b01111111111111111111111111111110) (bvsge (x!87950 lt!446420) #b00000000000000000000000000000000) (bvsge (x!87950 lt!446420) x!1245)))))

(assert (=> b!1010177 (=> (not res!678297) (not e!568434))))

(declare-fun b!1010178 () Bool)

(declare-fun e!568437 () SeekEntryResult!9508)

(assert (=> b!1010178 (= e!568437 (Intermediate!9508 true index!1507 x!1245))))

(declare-fun b!1010179 () Bool)

(declare-fun e!568435 () SeekEntryResult!9508)

(assert (=> b!1010179 (= e!568435 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (select (arr!30640 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010180 () Bool)

(assert (=> b!1010180 (= e!568437 e!568435)))

(declare-fun c!102098 () Bool)

(declare-fun lt!446419 () (_ BitVec 64))

(assert (=> b!1010180 (= c!102098 (or (= lt!446419 (select (arr!30640 a!3219) j!170)) (= (bvadd lt!446419 lt!446419) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010182 () Bool)

(assert (=> b!1010182 (and (bvsge (index!40405 lt!446420) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446420) (size!31143 a!3219)))))

(declare-fun res!678299 () Bool)

(assert (=> b!1010182 (= res!678299 (= (select (arr!30640 a!3219) (index!40405 lt!446420)) (select (arr!30640 a!3219) j!170)))))

(declare-fun e!568436 () Bool)

(assert (=> b!1010182 (=> res!678299 e!568436)))

(assert (=> b!1010182 (= e!568434 e!568436)))

(declare-fun b!1010183 () Bool)

(assert (=> b!1010183 (= e!568435 (Intermediate!9508 false index!1507 x!1245))))

(declare-fun b!1010184 () Bool)

(assert (=> b!1010184 (and (bvsge (index!40405 lt!446420) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446420) (size!31143 a!3219)))))

(declare-fun res!678298 () Bool)

(assert (=> b!1010184 (= res!678298 (= (select (arr!30640 a!3219) (index!40405 lt!446420)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010184 (=> res!678298 e!568436)))

(declare-fun b!1010185 () Bool)

(assert (=> b!1010185 (and (bvsge (index!40405 lt!446420) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446420) (size!31143 a!3219)))))

(assert (=> b!1010185 (= e!568436 (= (select (arr!30640 a!3219) (index!40405 lt!446420)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010181 () Bool)

(assert (=> b!1010181 (= e!568433 (bvsge (x!87950 lt!446420) #b01111111111111111111111111111110))))

(declare-fun d!120167 () Bool)

(assert (=> d!120167 e!568433))

(declare-fun c!102099 () Bool)

(assert (=> d!120167 (= c!102099 (and ((_ is Intermediate!9508) lt!446420) (undefined!10320 lt!446420)))))

(assert (=> d!120167 (= lt!446420 e!568437)))

(declare-fun c!102100 () Bool)

(assert (=> d!120167 (= c!102100 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!120167 (= lt!446419 (select (arr!30640 a!3219) index!1507))))

(assert (=> d!120167 (validMask!0 mask!3464)))

(assert (=> d!120167 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30640 a!3219) j!170) a!3219 mask!3464) lt!446420)))

(assert (= (and d!120167 c!102100) b!1010178))

(assert (= (and d!120167 (not c!102100)) b!1010180))

(assert (= (and b!1010180 c!102098) b!1010183))

(assert (= (and b!1010180 (not c!102098)) b!1010179))

(assert (= (and d!120167 c!102099) b!1010181))

(assert (= (and d!120167 (not c!102099)) b!1010177))

(assert (= (and b!1010177 res!678297) b!1010182))

(assert (= (and b!1010182 (not res!678299)) b!1010184))

(assert (= (and b!1010184 (not res!678298)) b!1010185))

(declare-fun m!935141 () Bool)

(assert (=> b!1010182 m!935141))

(assert (=> b!1010185 m!935141))

(assert (=> b!1010184 m!935141))

(declare-fun m!935143 () Bool)

(assert (=> b!1010179 m!935143))

(assert (=> b!1010179 m!935143))

(assert (=> b!1010179 m!935041))

(declare-fun m!935145 () Bool)

(assert (=> b!1010179 m!935145))

(declare-fun m!935147 () Bool)

(assert (=> d!120167 m!935147))

(assert (=> d!120167 m!935059))

(assert (=> b!1010063 d!120167))

(declare-fun b!1010186 () Bool)

(declare-fun e!568438 () Bool)

(declare-fun e!568439 () Bool)

(assert (=> b!1010186 (= e!568438 e!568439)))

(declare-fun res!678300 () Bool)

(declare-fun lt!446422 () SeekEntryResult!9508)

(assert (=> b!1010186 (= res!678300 (and ((_ is Intermediate!9508) lt!446422) (not (undefined!10320 lt!446422)) (bvslt (x!87950 lt!446422) #b01111111111111111111111111111110) (bvsge (x!87950 lt!446422) #b00000000000000000000000000000000) (bvsge (x!87950 lt!446422) #b00000000000000000000000000000000)))))

(assert (=> b!1010186 (=> (not res!678300) (not e!568439))))

(declare-fun e!568442 () SeekEntryResult!9508)

(declare-fun b!1010187 () Bool)

(assert (=> b!1010187 (= e!568442 (Intermediate!9508 true (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun e!568440 () SeekEntryResult!9508)

(declare-fun b!1010188 () Bool)

(assert (=> b!1010188 (= e!568440 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (select (arr!30640 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010189 () Bool)

(assert (=> b!1010189 (= e!568442 e!568440)))

(declare-fun c!102101 () Bool)

(declare-fun lt!446421 () (_ BitVec 64))

(assert (=> b!1010189 (= c!102101 (or (= lt!446421 (select (arr!30640 a!3219) j!170)) (= (bvadd lt!446421 lt!446421) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010191 () Bool)

(assert (=> b!1010191 (and (bvsge (index!40405 lt!446422) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446422) (size!31143 a!3219)))))

(declare-fun res!678302 () Bool)

(assert (=> b!1010191 (= res!678302 (= (select (arr!30640 a!3219) (index!40405 lt!446422)) (select (arr!30640 a!3219) j!170)))))

(declare-fun e!568441 () Bool)

(assert (=> b!1010191 (=> res!678302 e!568441)))

(assert (=> b!1010191 (= e!568439 e!568441)))

(declare-fun b!1010192 () Bool)

(assert (=> b!1010192 (= e!568440 (Intermediate!9508 false (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010193 () Bool)

(assert (=> b!1010193 (and (bvsge (index!40405 lt!446422) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446422) (size!31143 a!3219)))))

(declare-fun res!678301 () Bool)

(assert (=> b!1010193 (= res!678301 (= (select (arr!30640 a!3219) (index!40405 lt!446422)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010193 (=> res!678301 e!568441)))

(declare-fun b!1010194 () Bool)

(assert (=> b!1010194 (and (bvsge (index!40405 lt!446422) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446422) (size!31143 a!3219)))))

(assert (=> b!1010194 (= e!568441 (= (select (arr!30640 a!3219) (index!40405 lt!446422)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010190 () Bool)

(assert (=> b!1010190 (= e!568438 (bvsge (x!87950 lt!446422) #b01111111111111111111111111111110))))

(declare-fun d!120173 () Bool)

(assert (=> d!120173 e!568438))

(declare-fun c!102102 () Bool)

(assert (=> d!120173 (= c!102102 (and ((_ is Intermediate!9508) lt!446422) (undefined!10320 lt!446422)))))

(assert (=> d!120173 (= lt!446422 e!568442)))

(declare-fun c!102103 () Bool)

(assert (=> d!120173 (= c!102103 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!120173 (= lt!446421 (select (arr!30640 a!3219) (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464)))))

(assert (=> d!120173 (validMask!0 mask!3464)))

(assert (=> d!120173 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) (select (arr!30640 a!3219) j!170) a!3219 mask!3464) lt!446422)))

(assert (= (and d!120173 c!102103) b!1010187))

(assert (= (and d!120173 (not c!102103)) b!1010189))

(assert (= (and b!1010189 c!102101) b!1010192))

(assert (= (and b!1010189 (not c!102101)) b!1010188))

(assert (= (and d!120173 c!102102) b!1010190))

(assert (= (and d!120173 (not c!102102)) b!1010186))

(assert (= (and b!1010186 res!678300) b!1010191))

(assert (= (and b!1010191 (not res!678302)) b!1010193))

(assert (= (and b!1010193 (not res!678301)) b!1010194))

(declare-fun m!935149 () Bool)

(assert (=> b!1010191 m!935149))

(assert (=> b!1010194 m!935149))

(assert (=> b!1010193 m!935149))

(assert (=> b!1010188 m!935043))

(declare-fun m!935151 () Bool)

(assert (=> b!1010188 m!935151))

(assert (=> b!1010188 m!935151))

(assert (=> b!1010188 m!935041))

(declare-fun m!935153 () Bool)

(assert (=> b!1010188 m!935153))

(assert (=> d!120173 m!935043))

(declare-fun m!935155 () Bool)

(assert (=> d!120173 m!935155))

(assert (=> d!120173 m!935059))

(assert (=> b!1010067 d!120173))

(declare-fun d!120175 () Bool)

(declare-fun lt!446428 () (_ BitVec 32))

(declare-fun lt!446427 () (_ BitVec 32))

(assert (=> d!120175 (= lt!446428 (bvmul (bvxor lt!446427 (bvlshr lt!446427 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120175 (= lt!446427 ((_ extract 31 0) (bvand (bvxor (select (arr!30640 a!3219) j!170) (bvlshr (select (arr!30640 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120175 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678303 (let ((h!22481 ((_ extract 31 0) (bvand (bvxor (select (arr!30640 a!3219) j!170) (bvlshr (select (arr!30640 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87955 (bvmul (bvxor h!22481 (bvlshr h!22481 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87955 (bvlshr x!87955 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678303 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678303 #b00000000000000000000000000000000))))))

(assert (=> d!120175 (= (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) (bvand (bvxor lt!446428 (bvlshr lt!446428 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1010067 d!120175))

(declare-fun b!1010267 () Bool)

(declare-fun e!568486 () SeekEntryResult!9508)

(declare-fun lt!446452 () SeekEntryResult!9508)

(assert (=> b!1010267 (= e!568486 (MissingZero!9508 (index!40405 lt!446452)))))

(declare-fun b!1010268 () Bool)

(declare-fun e!568487 () SeekEntryResult!9508)

(assert (=> b!1010268 (= e!568487 (Found!9508 (index!40405 lt!446452)))))

(declare-fun b!1010269 () Bool)

(declare-fun c!102131 () Bool)

(declare-fun lt!446450 () (_ BitVec 64))

(assert (=> b!1010269 (= c!102131 (= lt!446450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010269 (= e!568487 e!568486)))

(declare-fun b!1010270 () Bool)

(declare-fun e!568485 () SeekEntryResult!9508)

(assert (=> b!1010270 (= e!568485 Undefined!9508)))

(declare-fun d!120177 () Bool)

(declare-fun lt!446451 () SeekEntryResult!9508)

(assert (=> d!120177 (and (or ((_ is Undefined!9508) lt!446451) (not ((_ is Found!9508) lt!446451)) (and (bvsge (index!40404 lt!446451) #b00000000000000000000000000000000) (bvslt (index!40404 lt!446451) (size!31143 a!3219)))) (or ((_ is Undefined!9508) lt!446451) ((_ is Found!9508) lt!446451) (not ((_ is MissingZero!9508) lt!446451)) (and (bvsge (index!40403 lt!446451) #b00000000000000000000000000000000) (bvslt (index!40403 lt!446451) (size!31143 a!3219)))) (or ((_ is Undefined!9508) lt!446451) ((_ is Found!9508) lt!446451) ((_ is MissingZero!9508) lt!446451) (not ((_ is MissingVacant!9508) lt!446451)) (and (bvsge (index!40406 lt!446451) #b00000000000000000000000000000000) (bvslt (index!40406 lt!446451) (size!31143 a!3219)))) (or ((_ is Undefined!9508) lt!446451) (ite ((_ is Found!9508) lt!446451) (= (select (arr!30640 a!3219) (index!40404 lt!446451)) k0!2224) (ite ((_ is MissingZero!9508) lt!446451) (= (select (arr!30640 a!3219) (index!40403 lt!446451)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9508) lt!446451) (= (select (arr!30640 a!3219) (index!40406 lt!446451)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!120177 (= lt!446451 e!568485)))

(declare-fun c!102132 () Bool)

(assert (=> d!120177 (= c!102132 (and ((_ is Intermediate!9508) lt!446452) (undefined!10320 lt!446452)))))

(assert (=> d!120177 (= lt!446452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!120177 (validMask!0 mask!3464)))

(assert (=> d!120177 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!446451)))

(declare-fun b!1010271 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63651 (_ BitVec 32)) SeekEntryResult!9508)

(assert (=> b!1010271 (= e!568486 (seekKeyOrZeroReturnVacant!0 (x!87950 lt!446452) (index!40405 lt!446452) (index!40405 lt!446452) k0!2224 a!3219 mask!3464))))

(declare-fun b!1010272 () Bool)

(assert (=> b!1010272 (= e!568485 e!568487)))

(assert (=> b!1010272 (= lt!446450 (select (arr!30640 a!3219) (index!40405 lt!446452)))))

(declare-fun c!102133 () Bool)

(assert (=> b!1010272 (= c!102133 (= lt!446450 k0!2224))))

(assert (= (and d!120177 c!102132) b!1010270))

(assert (= (and d!120177 (not c!102132)) b!1010272))

(assert (= (and b!1010272 c!102133) b!1010268))

(assert (= (and b!1010272 (not c!102133)) b!1010269))

(assert (= (and b!1010269 c!102131) b!1010267))

(assert (= (and b!1010269 (not c!102131)) b!1010271))

(declare-fun m!935187 () Bool)

(assert (=> d!120177 m!935187))

(declare-fun m!935189 () Bool)

(assert (=> d!120177 m!935189))

(declare-fun m!935191 () Bool)

(assert (=> d!120177 m!935191))

(assert (=> d!120177 m!935059))

(declare-fun m!935193 () Bool)

(assert (=> d!120177 m!935193))

(assert (=> d!120177 m!935191))

(declare-fun m!935195 () Bool)

(assert (=> d!120177 m!935195))

(declare-fun m!935197 () Bool)

(assert (=> b!1010271 m!935197))

(declare-fun m!935199 () Bool)

(assert (=> b!1010272 m!935199))

(assert (=> b!1010066 d!120177))

(declare-fun b!1010302 () Bool)

(declare-fun e!568512 () Bool)

(declare-fun e!568511 () Bool)

(assert (=> b!1010302 (= e!568512 e!568511)))

(declare-fun res!678340 () Bool)

(assert (=> b!1010302 (=> (not res!678340) (not e!568511))))

(declare-fun e!568510 () Bool)

(assert (=> b!1010302 (= res!678340 (not e!568510))))

(declare-fun res!678339 () Bool)

(assert (=> b!1010302 (=> (not res!678339) (not e!568510))))

(assert (=> b!1010302 (= res!678339 (validKeyInArray!0 (select (arr!30640 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1010303 () Bool)

(declare-fun e!568509 () Bool)

(assert (=> b!1010303 (= e!568511 e!568509)))

(declare-fun c!102141 () Bool)

(assert (=> b!1010303 (= c!102141 (validKeyInArray!0 (select (arr!30640 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1010304 () Bool)

(declare-fun call!42436 () Bool)

(assert (=> b!1010304 (= e!568509 call!42436)))

(declare-fun b!1010305 () Bool)

(declare-fun contains!5908 (List!21287 (_ BitVec 64)) Bool)

(assert (=> b!1010305 (= e!568510 (contains!5908 Nil!21284 (select (arr!30640 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1010306 () Bool)

(assert (=> b!1010306 (= e!568509 call!42436)))

(declare-fun d!120191 () Bool)

(declare-fun res!678338 () Bool)

(assert (=> d!120191 (=> res!678338 e!568512)))

(assert (=> d!120191 (= res!678338 (bvsge #b00000000000000000000000000000000 (size!31143 a!3219)))))

(assert (=> d!120191 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21284) e!568512)))

(declare-fun bm!42433 () Bool)

(assert (=> bm!42433 (= call!42436 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!102141 (Cons!21283 (select (arr!30640 a!3219) #b00000000000000000000000000000000) Nil!21284) Nil!21284)))))

(assert (= (and d!120191 (not res!678338)) b!1010302))

(assert (= (and b!1010302 res!678339) b!1010305))

(assert (= (and b!1010302 res!678340) b!1010303))

(assert (= (and b!1010303 c!102141) b!1010306))

(assert (= (and b!1010303 (not c!102141)) b!1010304))

(assert (= (or b!1010306 b!1010304) bm!42433))

(assert (=> b!1010302 m!935135))

(assert (=> b!1010302 m!935135))

(declare-fun m!935211 () Bool)

(assert (=> b!1010302 m!935211))

(assert (=> b!1010303 m!935135))

(assert (=> b!1010303 m!935135))

(assert (=> b!1010303 m!935211))

(assert (=> b!1010305 m!935135))

(assert (=> b!1010305 m!935135))

(declare-fun m!935213 () Bool)

(assert (=> b!1010305 m!935213))

(assert (=> bm!42433 m!935135))

(declare-fun m!935215 () Bool)

(assert (=> bm!42433 m!935215))

(assert (=> b!1010055 d!120191))

(declare-fun d!120201 () Bool)

(declare-fun res!678351 () Bool)

(declare-fun e!568529 () Bool)

(assert (=> d!120201 (=> res!678351 e!568529)))

(assert (=> d!120201 (= res!678351 (bvsge #b00000000000000000000000000000000 (size!31143 a!3219)))))

(assert (=> d!120201 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!568529)))

(declare-fun b!1010329 () Bool)

(declare-fun e!568530 () Bool)

(declare-fun call!42442 () Bool)

(assert (=> b!1010329 (= e!568530 call!42442)))

(declare-fun b!1010330 () Bool)

(declare-fun e!568528 () Bool)

(assert (=> b!1010330 (= e!568528 call!42442)))

(declare-fun b!1010331 () Bool)

(assert (=> b!1010331 (= e!568528 e!568530)))

(declare-fun lt!446475 () (_ BitVec 64))

(assert (=> b!1010331 (= lt!446475 (select (arr!30640 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33003 0))(
  ( (Unit!33004) )
))
(declare-fun lt!446474 () Unit!33003)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63651 (_ BitVec 64) (_ BitVec 32)) Unit!33003)

(assert (=> b!1010331 (= lt!446474 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!446475 #b00000000000000000000000000000000))))

(assert (=> b!1010331 (arrayContainsKey!0 a!3219 lt!446475 #b00000000000000000000000000000000)))

(declare-fun lt!446476 () Unit!33003)

(assert (=> b!1010331 (= lt!446476 lt!446474)))

(declare-fun res!678352 () Bool)

(assert (=> b!1010331 (= res!678352 (= (seekEntryOrOpen!0 (select (arr!30640 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9508 #b00000000000000000000000000000000)))))

(assert (=> b!1010331 (=> (not res!678352) (not e!568530))))

(declare-fun bm!42439 () Bool)

(assert (=> bm!42439 (= call!42442 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1010332 () Bool)

(assert (=> b!1010332 (= e!568529 e!568528)))

(declare-fun c!102148 () Bool)

(assert (=> b!1010332 (= c!102148 (validKeyInArray!0 (select (arr!30640 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!120201 (not res!678351)) b!1010332))

(assert (= (and b!1010332 c!102148) b!1010331))

(assert (= (and b!1010332 (not c!102148)) b!1010330))

(assert (= (and b!1010331 res!678352) b!1010329))

(assert (= (or b!1010329 b!1010330) bm!42439))

(assert (=> b!1010331 m!935135))

(declare-fun m!935233 () Bool)

(assert (=> b!1010331 m!935233))

(declare-fun m!935235 () Bool)

(assert (=> b!1010331 m!935235))

(assert (=> b!1010331 m!935135))

(declare-fun m!935237 () Bool)

(assert (=> b!1010331 m!935237))

(declare-fun m!935239 () Bool)

(assert (=> bm!42439 m!935239))

(assert (=> b!1010332 m!935135))

(assert (=> b!1010332 m!935135))

(assert (=> b!1010332 m!935211))

(assert (=> b!1010059 d!120201))

(declare-fun b!1010333 () Bool)

(declare-fun e!568531 () Bool)

(declare-fun e!568532 () Bool)

(assert (=> b!1010333 (= e!568531 e!568532)))

(declare-fun res!678353 () Bool)

(declare-fun lt!446478 () SeekEntryResult!9508)

(assert (=> b!1010333 (= res!678353 (and ((_ is Intermediate!9508) lt!446478) (not (undefined!10320 lt!446478)) (bvslt (x!87950 lt!446478) #b01111111111111111111111111111110) (bvsge (x!87950 lt!446478) #b00000000000000000000000000000000) (bvsge (x!87950 lt!446478) x!1245)))))

(assert (=> b!1010333 (=> (not res!678353) (not e!568532))))

(declare-fun b!1010334 () Bool)

(declare-fun e!568535 () SeekEntryResult!9508)

(assert (=> b!1010334 (= e!568535 (Intermediate!9508 true index!1507 x!1245))))

(declare-fun e!568533 () SeekEntryResult!9508)

(declare-fun b!1010335 () Bool)

(assert (=> b!1010335 (= e!568533 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) lt!446367 lt!446366 mask!3464))))

(declare-fun b!1010336 () Bool)

(assert (=> b!1010336 (= e!568535 e!568533)))

(declare-fun c!102149 () Bool)

(declare-fun lt!446477 () (_ BitVec 64))

(assert (=> b!1010336 (= c!102149 (or (= lt!446477 lt!446367) (= (bvadd lt!446477 lt!446477) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010338 () Bool)

(assert (=> b!1010338 (and (bvsge (index!40405 lt!446478) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446478) (size!31143 lt!446366)))))

(declare-fun res!678355 () Bool)

(assert (=> b!1010338 (= res!678355 (= (select (arr!30640 lt!446366) (index!40405 lt!446478)) lt!446367))))

(declare-fun e!568534 () Bool)

(assert (=> b!1010338 (=> res!678355 e!568534)))

(assert (=> b!1010338 (= e!568532 e!568534)))

(declare-fun b!1010339 () Bool)

(assert (=> b!1010339 (= e!568533 (Intermediate!9508 false index!1507 x!1245))))

(declare-fun b!1010340 () Bool)

(assert (=> b!1010340 (and (bvsge (index!40405 lt!446478) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446478) (size!31143 lt!446366)))))

(declare-fun res!678354 () Bool)

(assert (=> b!1010340 (= res!678354 (= (select (arr!30640 lt!446366) (index!40405 lt!446478)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010340 (=> res!678354 e!568534)))

(declare-fun b!1010341 () Bool)

(assert (=> b!1010341 (and (bvsge (index!40405 lt!446478) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446478) (size!31143 lt!446366)))))

(assert (=> b!1010341 (= e!568534 (= (select (arr!30640 lt!446366) (index!40405 lt!446478)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010337 () Bool)

(assert (=> b!1010337 (= e!568531 (bvsge (x!87950 lt!446478) #b01111111111111111111111111111110))))

(declare-fun d!120211 () Bool)

(assert (=> d!120211 e!568531))

(declare-fun c!102150 () Bool)

(assert (=> d!120211 (= c!102150 (and ((_ is Intermediate!9508) lt!446478) (undefined!10320 lt!446478)))))

(assert (=> d!120211 (= lt!446478 e!568535)))

(declare-fun c!102151 () Bool)

(assert (=> d!120211 (= c!102151 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!120211 (= lt!446477 (select (arr!30640 lt!446366) index!1507))))

(assert (=> d!120211 (validMask!0 mask!3464)))

(assert (=> d!120211 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446367 lt!446366 mask!3464) lt!446478)))

(assert (= (and d!120211 c!102151) b!1010334))

(assert (= (and d!120211 (not c!102151)) b!1010336))

(assert (= (and b!1010336 c!102149) b!1010339))

(assert (= (and b!1010336 (not c!102149)) b!1010335))

(assert (= (and d!120211 c!102150) b!1010337))

(assert (= (and d!120211 (not c!102150)) b!1010333))

(assert (= (and b!1010333 res!678353) b!1010338))

(assert (= (and b!1010338 (not res!678355)) b!1010340))

(assert (= (and b!1010340 (not res!678354)) b!1010341))

(declare-fun m!935241 () Bool)

(assert (=> b!1010338 m!935241))

(assert (=> b!1010341 m!935241))

(assert (=> b!1010340 m!935241))

(assert (=> b!1010335 m!935143))

(assert (=> b!1010335 m!935143))

(declare-fun m!935243 () Bool)

(assert (=> b!1010335 m!935243))

(declare-fun m!935245 () Bool)

(assert (=> d!120211 m!935245))

(assert (=> d!120211 m!935059))

(assert (=> b!1010058 d!120211))

(declare-fun b!1010342 () Bool)

(declare-fun e!568536 () Bool)

(declare-fun e!568537 () Bool)

(assert (=> b!1010342 (= e!568536 e!568537)))

(declare-fun res!678356 () Bool)

(declare-fun lt!446480 () SeekEntryResult!9508)

(assert (=> b!1010342 (= res!678356 (and ((_ is Intermediate!9508) lt!446480) (not (undefined!10320 lt!446480)) (bvslt (x!87950 lt!446480) #b01111111111111111111111111111110) (bvsge (x!87950 lt!446480) #b00000000000000000000000000000000) (bvsge (x!87950 lt!446480) #b00000000000000000000000000000000)))))

(assert (=> b!1010342 (=> (not res!678356) (not e!568537))))

(declare-fun b!1010343 () Bool)

(declare-fun e!568540 () SeekEntryResult!9508)

(assert (=> b!1010343 (= e!568540 (Intermediate!9508 true (toIndex!0 lt!446367 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010344 () Bool)

(declare-fun e!568538 () SeekEntryResult!9508)

(assert (=> b!1010344 (= e!568538 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!446367 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) lt!446367 lt!446366 mask!3464))))

(declare-fun b!1010345 () Bool)

(assert (=> b!1010345 (= e!568540 e!568538)))

(declare-fun c!102152 () Bool)

(declare-fun lt!446479 () (_ BitVec 64))

(assert (=> b!1010345 (= c!102152 (or (= lt!446479 lt!446367) (= (bvadd lt!446479 lt!446479) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010347 () Bool)

(assert (=> b!1010347 (and (bvsge (index!40405 lt!446480) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446480) (size!31143 lt!446366)))))

(declare-fun res!678358 () Bool)

(assert (=> b!1010347 (= res!678358 (= (select (arr!30640 lt!446366) (index!40405 lt!446480)) lt!446367))))

(declare-fun e!568539 () Bool)

(assert (=> b!1010347 (=> res!678358 e!568539)))

(assert (=> b!1010347 (= e!568537 e!568539)))

(declare-fun b!1010348 () Bool)

(assert (=> b!1010348 (= e!568538 (Intermediate!9508 false (toIndex!0 lt!446367 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010349 () Bool)

(assert (=> b!1010349 (and (bvsge (index!40405 lt!446480) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446480) (size!31143 lt!446366)))))

(declare-fun res!678357 () Bool)

(assert (=> b!1010349 (= res!678357 (= (select (arr!30640 lt!446366) (index!40405 lt!446480)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010349 (=> res!678357 e!568539)))

(declare-fun b!1010350 () Bool)

(assert (=> b!1010350 (and (bvsge (index!40405 lt!446480) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446480) (size!31143 lt!446366)))))

(assert (=> b!1010350 (= e!568539 (= (select (arr!30640 lt!446366) (index!40405 lt!446480)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010346 () Bool)

(assert (=> b!1010346 (= e!568536 (bvsge (x!87950 lt!446480) #b01111111111111111111111111111110))))

(declare-fun d!120213 () Bool)

(assert (=> d!120213 e!568536))

(declare-fun c!102153 () Bool)

(assert (=> d!120213 (= c!102153 (and ((_ is Intermediate!9508) lt!446480) (undefined!10320 lt!446480)))))

(assert (=> d!120213 (= lt!446480 e!568540)))

(declare-fun c!102154 () Bool)

(assert (=> d!120213 (= c!102154 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!120213 (= lt!446479 (select (arr!30640 lt!446366) (toIndex!0 lt!446367 mask!3464)))))

(assert (=> d!120213 (validMask!0 mask!3464)))

(assert (=> d!120213 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446367 mask!3464) lt!446367 lt!446366 mask!3464) lt!446480)))

(assert (= (and d!120213 c!102154) b!1010343))

(assert (= (and d!120213 (not c!102154)) b!1010345))

(assert (= (and b!1010345 c!102152) b!1010348))

(assert (= (and b!1010345 (not c!102152)) b!1010344))

(assert (= (and d!120213 c!102153) b!1010346))

(assert (= (and d!120213 (not c!102153)) b!1010342))

(assert (= (and b!1010342 res!678356) b!1010347))

(assert (= (and b!1010347 (not res!678358)) b!1010349))

(assert (= (and b!1010349 (not res!678357)) b!1010350))

(declare-fun m!935247 () Bool)

(assert (=> b!1010347 m!935247))

(assert (=> b!1010350 m!935247))

(assert (=> b!1010349 m!935247))

(assert (=> b!1010344 m!935029))

(declare-fun m!935249 () Bool)

(assert (=> b!1010344 m!935249))

(assert (=> b!1010344 m!935249))

(declare-fun m!935251 () Bool)

(assert (=> b!1010344 m!935251))

(assert (=> d!120213 m!935029))

(declare-fun m!935253 () Bool)

(assert (=> d!120213 m!935253))

(assert (=> d!120213 m!935059))

(assert (=> b!1010068 d!120213))

(declare-fun d!120215 () Bool)

(declare-fun lt!446482 () (_ BitVec 32))

(declare-fun lt!446481 () (_ BitVec 32))

(assert (=> d!120215 (= lt!446482 (bvmul (bvxor lt!446481 (bvlshr lt!446481 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120215 (= lt!446481 ((_ extract 31 0) (bvand (bvxor lt!446367 (bvlshr lt!446367 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120215 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678303 (let ((h!22481 ((_ extract 31 0) (bvand (bvxor lt!446367 (bvlshr lt!446367 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87955 (bvmul (bvxor h!22481 (bvlshr h!22481 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87955 (bvlshr x!87955 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678303 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678303 #b00000000000000000000000000000000))))))

(assert (=> d!120215 (= (toIndex!0 lt!446367 mask!3464) (bvand (bvxor lt!446482 (bvlshr lt!446482 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1010068 d!120215))

(check-sat (not d!120165) (not bm!42439) (not d!120177) (not d!120167) (not d!120213) (not b!1010188) (not b!1010158) (not d!120173) (not b!1010331) (not b!1010179) (not bm!42433) (not b!1010303) (not b!1010335) (not b!1010344) (not b!1010302) (not d!120211) (not b!1010332) (not b!1010271) (not b!1010305))
(check-sat)
(get-model)

(assert (=> d!120167 d!120155))

(declare-fun b!1010644 () Bool)

(declare-fun e!568723 () Bool)

(declare-fun e!568724 () Bool)

(assert (=> b!1010644 (= e!568723 e!568724)))

(declare-fun res!678471 () Bool)

(declare-fun lt!446602 () SeekEntryResult!9508)

(assert (=> b!1010644 (= res!678471 (and ((_ is Intermediate!9508) lt!446602) (not (undefined!10320 lt!446602)) (bvslt (x!87950 lt!446602) #b01111111111111111111111111111110) (bvsge (x!87950 lt!446602) #b00000000000000000000000000000000) (bvsge (x!87950 lt!446602) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1010644 (=> (not res!678471) (not e!568724))))

(declare-fun b!1010645 () Bool)

(declare-fun e!568727 () SeekEntryResult!9508)

(assert (=> b!1010645 (= e!568727 (Intermediate!9508 true (nextIndex!0 (toIndex!0 lt!446367 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1010646 () Bool)

(declare-fun e!568725 () SeekEntryResult!9508)

(assert (=> b!1010646 (= e!568725 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!446367 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!3464) lt!446367 lt!446366 mask!3464))))

(declare-fun b!1010647 () Bool)

(assert (=> b!1010647 (= e!568727 e!568725)))

(declare-fun c!102249 () Bool)

(declare-fun lt!446601 () (_ BitVec 64))

(assert (=> b!1010647 (= c!102249 (or (= lt!446601 lt!446367) (= (bvadd lt!446601 lt!446601) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010649 () Bool)

(assert (=> b!1010649 (and (bvsge (index!40405 lt!446602) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446602) (size!31143 lt!446366)))))

(declare-fun res!678473 () Bool)

(assert (=> b!1010649 (= res!678473 (= (select (arr!30640 lt!446366) (index!40405 lt!446602)) lt!446367))))

(declare-fun e!568726 () Bool)

(assert (=> b!1010649 (=> res!678473 e!568726)))

(assert (=> b!1010649 (= e!568724 e!568726)))

(declare-fun b!1010650 () Bool)

(assert (=> b!1010650 (= e!568725 (Intermediate!9508 false (nextIndex!0 (toIndex!0 lt!446367 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1010651 () Bool)

(assert (=> b!1010651 (and (bvsge (index!40405 lt!446602) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446602) (size!31143 lt!446366)))))

(declare-fun res!678472 () Bool)

(assert (=> b!1010651 (= res!678472 (= (select (arr!30640 lt!446366) (index!40405 lt!446602)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010651 (=> res!678472 e!568726)))

(declare-fun b!1010652 () Bool)

(assert (=> b!1010652 (and (bvsge (index!40405 lt!446602) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446602) (size!31143 lt!446366)))))

(assert (=> b!1010652 (= e!568726 (= (select (arr!30640 lt!446366) (index!40405 lt!446602)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010648 () Bool)

(assert (=> b!1010648 (= e!568723 (bvsge (x!87950 lt!446602) #b01111111111111111111111111111110))))

(declare-fun d!120321 () Bool)

(assert (=> d!120321 e!568723))

(declare-fun c!102250 () Bool)

(assert (=> d!120321 (= c!102250 (and ((_ is Intermediate!9508) lt!446602) (undefined!10320 lt!446602)))))

(assert (=> d!120321 (= lt!446602 e!568727)))

(declare-fun c!102251 () Bool)

(assert (=> d!120321 (= c!102251 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!120321 (= lt!446601 (select (arr!30640 lt!446366) (nextIndex!0 (toIndex!0 lt!446367 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464)))))

(assert (=> d!120321 (validMask!0 mask!3464)))

(assert (=> d!120321 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!446367 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) lt!446367 lt!446366 mask!3464) lt!446602)))

(assert (= (and d!120321 c!102251) b!1010645))

(assert (= (and d!120321 (not c!102251)) b!1010647))

(assert (= (and b!1010647 c!102249) b!1010650))

(assert (= (and b!1010647 (not c!102249)) b!1010646))

(assert (= (and d!120321 c!102250) b!1010648))

(assert (= (and d!120321 (not c!102250)) b!1010644))

(assert (= (and b!1010644 res!678471) b!1010649))

(assert (= (and b!1010649 (not res!678473)) b!1010651))

(assert (= (and b!1010651 (not res!678472)) b!1010652))

(declare-fun m!935515 () Bool)

(assert (=> b!1010649 m!935515))

(assert (=> b!1010652 m!935515))

(assert (=> b!1010651 m!935515))

(assert (=> b!1010646 m!935249))

(declare-fun m!935517 () Bool)

(assert (=> b!1010646 m!935517))

(assert (=> b!1010646 m!935517))

(declare-fun m!935519 () Bool)

(assert (=> b!1010646 m!935519))

(assert (=> d!120321 m!935249))

(declare-fun m!935521 () Bool)

(assert (=> d!120321 m!935521))

(assert (=> d!120321 m!935059))

(assert (=> b!1010344 d!120321))

(declare-fun d!120323 () Bool)

(declare-fun lt!446603 () (_ BitVec 32))

(assert (=> d!120323 (and (bvsge lt!446603 #b00000000000000000000000000000000) (bvslt lt!446603 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(assert (=> d!120323 (= lt!446603 (choose!52 (toIndex!0 lt!446367 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464))))

(assert (=> d!120323 (validMask!0 mask!3464)))

(assert (=> d!120323 (= (nextIndex!0 (toIndex!0 lt!446367 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) lt!446603)))

(declare-fun bs!28720 () Bool)

(assert (= bs!28720 d!120323))

(assert (=> bs!28720 m!935029))

(declare-fun m!935523 () Bool)

(assert (=> bs!28720 m!935523))

(assert (=> bs!28720 m!935059))

(assert (=> b!1010344 d!120323))

(declare-fun d!120325 () Bool)

(declare-fun lt!446606 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!486 (List!21287) (InoxSet (_ BitVec 64)))

(assert (=> d!120325 (= lt!446606 (select (content!486 Nil!21284) (select (arr!30640 a!3219) #b00000000000000000000000000000000)))))

(declare-fun e!568732 () Bool)

(assert (=> d!120325 (= lt!446606 e!568732)))

(declare-fun res!678478 () Bool)

(assert (=> d!120325 (=> (not res!678478) (not e!568732))))

(assert (=> d!120325 (= res!678478 ((_ is Cons!21283) Nil!21284))))

(assert (=> d!120325 (= (contains!5908 Nil!21284 (select (arr!30640 a!3219) #b00000000000000000000000000000000)) lt!446606)))

(declare-fun b!1010657 () Bool)

(declare-fun e!568733 () Bool)

(assert (=> b!1010657 (= e!568732 e!568733)))

(declare-fun res!678479 () Bool)

(assert (=> b!1010657 (=> res!678479 e!568733)))

(assert (=> b!1010657 (= res!678479 (= (h!22478 Nil!21284) (select (arr!30640 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1010658 () Bool)

(assert (=> b!1010658 (= e!568733 (contains!5908 (t!30280 Nil!21284) (select (arr!30640 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!120325 res!678478) b!1010657))

(assert (= (and b!1010657 (not res!678479)) b!1010658))

(declare-fun m!935525 () Bool)

(assert (=> d!120325 m!935525))

(assert (=> d!120325 m!935135))

(declare-fun m!935527 () Bool)

(assert (=> d!120325 m!935527))

(assert (=> b!1010658 m!935135))

(declare-fun m!935529 () Bool)

(assert (=> b!1010658 m!935529))

(assert (=> b!1010305 d!120325))

(declare-fun b!1010659 () Bool)

(declare-fun e!568734 () Bool)

(declare-fun e!568735 () Bool)

(assert (=> b!1010659 (= e!568734 e!568735)))

(declare-fun res!678480 () Bool)

(declare-fun lt!446608 () SeekEntryResult!9508)

(assert (=> b!1010659 (= res!678480 (and ((_ is Intermediate!9508) lt!446608) (not (undefined!10320 lt!446608)) (bvslt (x!87950 lt!446608) #b01111111111111111111111111111110) (bvsge (x!87950 lt!446608) #b00000000000000000000000000000000) (bvsge (x!87950 lt!446608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1010659 (=> (not res!678480) (not e!568735))))

(declare-fun e!568738 () SeekEntryResult!9508)

(declare-fun b!1010660 () Bool)

(assert (=> b!1010660 (= e!568738 (Intermediate!9508 true (nextIndex!0 (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1010661 () Bool)

(declare-fun e!568736 () SeekEntryResult!9508)

(assert (=> b!1010661 (= e!568736 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!3464) (select (arr!30640 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010662 () Bool)

(assert (=> b!1010662 (= e!568738 e!568736)))

(declare-fun lt!446607 () (_ BitVec 64))

(declare-fun c!102252 () Bool)

(assert (=> b!1010662 (= c!102252 (or (= lt!446607 (select (arr!30640 a!3219) j!170)) (= (bvadd lt!446607 lt!446607) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010664 () Bool)

(assert (=> b!1010664 (and (bvsge (index!40405 lt!446608) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446608) (size!31143 a!3219)))))

(declare-fun res!678482 () Bool)

(assert (=> b!1010664 (= res!678482 (= (select (arr!30640 a!3219) (index!40405 lt!446608)) (select (arr!30640 a!3219) j!170)))))

(declare-fun e!568737 () Bool)

(assert (=> b!1010664 (=> res!678482 e!568737)))

(assert (=> b!1010664 (= e!568735 e!568737)))

(declare-fun b!1010665 () Bool)

(assert (=> b!1010665 (= e!568736 (Intermediate!9508 false (nextIndex!0 (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1010666 () Bool)

(assert (=> b!1010666 (and (bvsge (index!40405 lt!446608) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446608) (size!31143 a!3219)))))

(declare-fun res!678481 () Bool)

(assert (=> b!1010666 (= res!678481 (= (select (arr!30640 a!3219) (index!40405 lt!446608)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010666 (=> res!678481 e!568737)))

(declare-fun b!1010667 () Bool)

(assert (=> b!1010667 (and (bvsge (index!40405 lt!446608) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446608) (size!31143 a!3219)))))

(assert (=> b!1010667 (= e!568737 (= (select (arr!30640 a!3219) (index!40405 lt!446608)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010663 () Bool)

(assert (=> b!1010663 (= e!568734 (bvsge (x!87950 lt!446608) #b01111111111111111111111111111110))))

(declare-fun d!120327 () Bool)

(assert (=> d!120327 e!568734))

(declare-fun c!102253 () Bool)

(assert (=> d!120327 (= c!102253 (and ((_ is Intermediate!9508) lt!446608) (undefined!10320 lt!446608)))))

(assert (=> d!120327 (= lt!446608 e!568738)))

(declare-fun c!102254 () Bool)

(assert (=> d!120327 (= c!102254 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!120327 (= lt!446607 (select (arr!30640 a!3219) (nextIndex!0 (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464)))))

(assert (=> d!120327 (validMask!0 mask!3464)))

(assert (=> d!120327 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (select (arr!30640 a!3219) j!170) a!3219 mask!3464) lt!446608)))

(assert (= (and d!120327 c!102254) b!1010660))

(assert (= (and d!120327 (not c!102254)) b!1010662))

(assert (= (and b!1010662 c!102252) b!1010665))

(assert (= (and b!1010662 (not c!102252)) b!1010661))

(assert (= (and d!120327 c!102253) b!1010663))

(assert (= (and d!120327 (not c!102253)) b!1010659))

(assert (= (and b!1010659 res!678480) b!1010664))

(assert (= (and b!1010664 (not res!678482)) b!1010666))

(assert (= (and b!1010666 (not res!678481)) b!1010667))

(declare-fun m!935531 () Bool)

(assert (=> b!1010664 m!935531))

(assert (=> b!1010667 m!935531))

(assert (=> b!1010666 m!935531))

(assert (=> b!1010661 m!935151))

(declare-fun m!935533 () Bool)

(assert (=> b!1010661 m!935533))

(assert (=> b!1010661 m!935533))

(assert (=> b!1010661 m!935041))

(declare-fun m!935535 () Bool)

(assert (=> b!1010661 m!935535))

(assert (=> d!120327 m!935151))

(declare-fun m!935537 () Bool)

(assert (=> d!120327 m!935537))

(assert (=> d!120327 m!935059))

(assert (=> b!1010188 d!120327))

(declare-fun d!120329 () Bool)

(declare-fun lt!446609 () (_ BitVec 32))

(assert (=> d!120329 (and (bvsge lt!446609 #b00000000000000000000000000000000) (bvslt lt!446609 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(assert (=> d!120329 (= lt!446609 (choose!52 (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464))))

(assert (=> d!120329 (validMask!0 mask!3464)))

(assert (=> d!120329 (= (nextIndex!0 (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) lt!446609)))

(declare-fun bs!28721 () Bool)

(assert (= bs!28721 d!120329))

(assert (=> bs!28721 m!935043))

(declare-fun m!935539 () Bool)

(assert (=> bs!28721 m!935539))

(assert (=> bs!28721 m!935059))

(assert (=> b!1010188 d!120329))

(declare-fun b!1010668 () Bool)

(declare-fun e!568739 () Bool)

(declare-fun e!568740 () Bool)

(assert (=> b!1010668 (= e!568739 e!568740)))

(declare-fun res!678483 () Bool)

(declare-fun lt!446611 () SeekEntryResult!9508)

(assert (=> b!1010668 (= res!678483 (and ((_ is Intermediate!9508) lt!446611) (not (undefined!10320 lt!446611)) (bvslt (x!87950 lt!446611) #b01111111111111111111111111111110) (bvsge (x!87950 lt!446611) #b00000000000000000000000000000000) (bvsge (x!87950 lt!446611) (bvadd x!1245 #b00000000000000000000000000000001))))))

(assert (=> b!1010668 (=> (not res!678483) (not e!568740))))

(declare-fun b!1010669 () Bool)

(declare-fun e!568743 () SeekEntryResult!9508)

(assert (=> b!1010669 (= e!568743 (Intermediate!9508 true (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (bvadd x!1245 #b00000000000000000000000000000001)))))

(declare-fun e!568741 () SeekEntryResult!9508)

(declare-fun b!1010670 () Bool)

(assert (=> b!1010670 (= e!568741 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (bvadd x!1245 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!3464) (select (arr!30640 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010671 () Bool)

(assert (=> b!1010671 (= e!568743 e!568741)))

(declare-fun c!102255 () Bool)

(declare-fun lt!446610 () (_ BitVec 64))

(assert (=> b!1010671 (= c!102255 (or (= lt!446610 (select (arr!30640 a!3219) j!170)) (= (bvadd lt!446610 lt!446610) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010673 () Bool)

(assert (=> b!1010673 (and (bvsge (index!40405 lt!446611) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446611) (size!31143 a!3219)))))

(declare-fun res!678485 () Bool)

(assert (=> b!1010673 (= res!678485 (= (select (arr!30640 a!3219) (index!40405 lt!446611)) (select (arr!30640 a!3219) j!170)))))

(declare-fun e!568742 () Bool)

(assert (=> b!1010673 (=> res!678485 e!568742)))

(assert (=> b!1010673 (= e!568740 e!568742)))

(declare-fun b!1010674 () Bool)

(assert (=> b!1010674 (= e!568741 (Intermediate!9508 false (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (bvadd x!1245 #b00000000000000000000000000000001)))))

(declare-fun b!1010675 () Bool)

(assert (=> b!1010675 (and (bvsge (index!40405 lt!446611) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446611) (size!31143 a!3219)))))

(declare-fun res!678484 () Bool)

(assert (=> b!1010675 (= res!678484 (= (select (arr!30640 a!3219) (index!40405 lt!446611)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010675 (=> res!678484 e!568742)))

(declare-fun b!1010676 () Bool)

(assert (=> b!1010676 (and (bvsge (index!40405 lt!446611) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446611) (size!31143 a!3219)))))

(assert (=> b!1010676 (= e!568742 (= (select (arr!30640 a!3219) (index!40405 lt!446611)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010672 () Bool)

(assert (=> b!1010672 (= e!568739 (bvsge (x!87950 lt!446611) #b01111111111111111111111111111110))))

(declare-fun d!120331 () Bool)

(assert (=> d!120331 e!568739))

(declare-fun c!102256 () Bool)

(assert (=> d!120331 (= c!102256 (and ((_ is Intermediate!9508) lt!446611) (undefined!10320 lt!446611)))))

(assert (=> d!120331 (= lt!446611 e!568743)))

(declare-fun c!102257 () Bool)

(assert (=> d!120331 (= c!102257 (bvsge (bvadd x!1245 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!120331 (= lt!446610 (select (arr!30640 a!3219) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464)))))

(assert (=> d!120331 (validMask!0 mask!3464)))

(assert (=> d!120331 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (select (arr!30640 a!3219) j!170) a!3219 mask!3464) lt!446611)))

(assert (= (and d!120331 c!102257) b!1010669))

(assert (= (and d!120331 (not c!102257)) b!1010671))

(assert (= (and b!1010671 c!102255) b!1010674))

(assert (= (and b!1010671 (not c!102255)) b!1010670))

(assert (= (and d!120331 c!102256) b!1010672))

(assert (= (and d!120331 (not c!102256)) b!1010668))

(assert (= (and b!1010668 res!678483) b!1010673))

(assert (= (and b!1010673 (not res!678485)) b!1010675))

(assert (= (and b!1010675 (not res!678484)) b!1010676))

(declare-fun m!935541 () Bool)

(assert (=> b!1010673 m!935541))

(assert (=> b!1010676 m!935541))

(assert (=> b!1010675 m!935541))

(assert (=> b!1010670 m!935143))

(declare-fun m!935543 () Bool)

(assert (=> b!1010670 m!935543))

(assert (=> b!1010670 m!935543))

(assert (=> b!1010670 m!935041))

(declare-fun m!935545 () Bool)

(assert (=> b!1010670 m!935545))

(assert (=> d!120331 m!935143))

(declare-fun m!935547 () Bool)

(assert (=> d!120331 m!935547))

(assert (=> d!120331 m!935059))

(assert (=> b!1010179 d!120331))

(declare-fun d!120333 () Bool)

(declare-fun lt!446612 () (_ BitVec 32))

(assert (=> d!120333 (and (bvsge lt!446612 #b00000000000000000000000000000000) (bvslt lt!446612 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(assert (=> d!120333 (= lt!446612 (choose!52 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464))))

(assert (=> d!120333 (validMask!0 mask!3464)))

(assert (=> d!120333 (= (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) lt!446612)))

(declare-fun bs!28722 () Bool)

(assert (= bs!28722 d!120333))

(declare-fun m!935549 () Bool)

(assert (=> bs!28722 m!935549))

(assert (=> bs!28722 m!935059))

(assert (=> b!1010179 d!120333))

(declare-fun b!1010677 () Bool)

(declare-fun e!568744 () Bool)

(declare-fun e!568745 () Bool)

(assert (=> b!1010677 (= e!568744 e!568745)))

(declare-fun res!678486 () Bool)

(declare-fun lt!446614 () SeekEntryResult!9508)

(assert (=> b!1010677 (= res!678486 (and ((_ is Intermediate!9508) lt!446614) (not (undefined!10320 lt!446614)) (bvslt (x!87950 lt!446614) #b01111111111111111111111111111110) (bvsge (x!87950 lt!446614) #b00000000000000000000000000000000) (bvsge (x!87950 lt!446614) #b00000000000000000000000000000000)))))

(assert (=> b!1010677 (=> (not res!678486) (not e!568745))))

(declare-fun b!1010678 () Bool)

(declare-fun e!568748 () SeekEntryResult!9508)

(assert (=> b!1010678 (= e!568748 (Intermediate!9508 true (toIndex!0 k0!2224 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010679 () Bool)

(declare-fun e!568746 () SeekEntryResult!9508)

(assert (=> b!1010679 (= e!568746 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2224 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) k0!2224 a!3219 mask!3464))))

(declare-fun b!1010680 () Bool)

(assert (=> b!1010680 (= e!568748 e!568746)))

(declare-fun c!102258 () Bool)

(declare-fun lt!446613 () (_ BitVec 64))

(assert (=> b!1010680 (= c!102258 (or (= lt!446613 k0!2224) (= (bvadd lt!446613 lt!446613) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010682 () Bool)

(assert (=> b!1010682 (and (bvsge (index!40405 lt!446614) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446614) (size!31143 a!3219)))))

(declare-fun res!678488 () Bool)

(assert (=> b!1010682 (= res!678488 (= (select (arr!30640 a!3219) (index!40405 lt!446614)) k0!2224))))

(declare-fun e!568747 () Bool)

(assert (=> b!1010682 (=> res!678488 e!568747)))

(assert (=> b!1010682 (= e!568745 e!568747)))

(declare-fun b!1010683 () Bool)

(assert (=> b!1010683 (= e!568746 (Intermediate!9508 false (toIndex!0 k0!2224 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010684 () Bool)

(assert (=> b!1010684 (and (bvsge (index!40405 lt!446614) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446614) (size!31143 a!3219)))))

(declare-fun res!678487 () Bool)

(assert (=> b!1010684 (= res!678487 (= (select (arr!30640 a!3219) (index!40405 lt!446614)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010684 (=> res!678487 e!568747)))

(declare-fun b!1010685 () Bool)

(assert (=> b!1010685 (and (bvsge (index!40405 lt!446614) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446614) (size!31143 a!3219)))))

(assert (=> b!1010685 (= e!568747 (= (select (arr!30640 a!3219) (index!40405 lt!446614)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010681 () Bool)

(assert (=> b!1010681 (= e!568744 (bvsge (x!87950 lt!446614) #b01111111111111111111111111111110))))

(declare-fun d!120335 () Bool)

(assert (=> d!120335 e!568744))

(declare-fun c!102259 () Bool)

(assert (=> d!120335 (= c!102259 (and ((_ is Intermediate!9508) lt!446614) (undefined!10320 lt!446614)))))

(assert (=> d!120335 (= lt!446614 e!568748)))

(declare-fun c!102260 () Bool)

(assert (=> d!120335 (= c!102260 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!120335 (= lt!446613 (select (arr!30640 a!3219) (toIndex!0 k0!2224 mask!3464)))))

(assert (=> d!120335 (validMask!0 mask!3464)))

(assert (=> d!120335 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464) lt!446614)))

(assert (= (and d!120335 c!102260) b!1010678))

(assert (= (and d!120335 (not c!102260)) b!1010680))

(assert (= (and b!1010680 c!102258) b!1010683))

(assert (= (and b!1010680 (not c!102258)) b!1010679))

(assert (= (and d!120335 c!102259) b!1010681))

(assert (= (and d!120335 (not c!102259)) b!1010677))

(assert (= (and b!1010677 res!678486) b!1010682))

(assert (= (and b!1010682 (not res!678488)) b!1010684))

(assert (= (and b!1010684 (not res!678487)) b!1010685))

(declare-fun m!935551 () Bool)

(assert (=> b!1010682 m!935551))

(assert (=> b!1010685 m!935551))

(assert (=> b!1010684 m!935551))

(assert (=> b!1010679 m!935191))

(declare-fun m!935553 () Bool)

(assert (=> b!1010679 m!935553))

(assert (=> b!1010679 m!935553))

(declare-fun m!935555 () Bool)

(assert (=> b!1010679 m!935555))

(assert (=> d!120335 m!935191))

(declare-fun m!935557 () Bool)

(assert (=> d!120335 m!935557))

(assert (=> d!120335 m!935059))

(assert (=> d!120177 d!120335))

(declare-fun d!120337 () Bool)

(declare-fun lt!446616 () (_ BitVec 32))

(declare-fun lt!446615 () (_ BitVec 32))

(assert (=> d!120337 (= lt!446616 (bvmul (bvxor lt!446615 (bvlshr lt!446615 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120337 (= lt!446615 ((_ extract 31 0) (bvand (bvxor k0!2224 (bvlshr k0!2224 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120337 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678303 (let ((h!22481 ((_ extract 31 0) (bvand (bvxor k0!2224 (bvlshr k0!2224 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87955 (bvmul (bvxor h!22481 (bvlshr h!22481 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87955 (bvlshr x!87955 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678303 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678303 #b00000000000000000000000000000000))))))

(assert (=> d!120337 (= (toIndex!0 k0!2224 mask!3464) (bvand (bvxor lt!446616 (bvlshr lt!446616 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> d!120177 d!120337))

(assert (=> d!120177 d!120155))

(declare-fun b!1010698 () Bool)

(declare-fun e!568757 () SeekEntryResult!9508)

(assert (=> b!1010698 (= e!568757 (MissingVacant!9508 (index!40405 lt!446452)))))

(declare-fun lt!446621 () SeekEntryResult!9508)

(declare-fun d!120339 () Bool)

(assert (=> d!120339 (and (or ((_ is Undefined!9508) lt!446621) (not ((_ is Found!9508) lt!446621)) (and (bvsge (index!40404 lt!446621) #b00000000000000000000000000000000) (bvslt (index!40404 lt!446621) (size!31143 a!3219)))) (or ((_ is Undefined!9508) lt!446621) ((_ is Found!9508) lt!446621) (not ((_ is MissingVacant!9508) lt!446621)) (not (= (index!40406 lt!446621) (index!40405 lt!446452))) (and (bvsge (index!40406 lt!446621) #b00000000000000000000000000000000) (bvslt (index!40406 lt!446621) (size!31143 a!3219)))) (or ((_ is Undefined!9508) lt!446621) (ite ((_ is Found!9508) lt!446621) (= (select (arr!30640 a!3219) (index!40404 lt!446621)) k0!2224) (and ((_ is MissingVacant!9508) lt!446621) (= (index!40406 lt!446621) (index!40405 lt!446452)) (= (select (arr!30640 a!3219) (index!40406 lt!446621)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!568756 () SeekEntryResult!9508)

(assert (=> d!120339 (= lt!446621 e!568756)))

(declare-fun c!102269 () Bool)

(assert (=> d!120339 (= c!102269 (bvsge (x!87950 lt!446452) #b01111111111111111111111111111110))))

(declare-fun lt!446622 () (_ BitVec 64))

(assert (=> d!120339 (= lt!446622 (select (arr!30640 a!3219) (index!40405 lt!446452)))))

(assert (=> d!120339 (validMask!0 mask!3464)))

(assert (=> d!120339 (= (seekKeyOrZeroReturnVacant!0 (x!87950 lt!446452) (index!40405 lt!446452) (index!40405 lt!446452) k0!2224 a!3219 mask!3464) lt!446621)))

(declare-fun b!1010699 () Bool)

(declare-fun e!568755 () SeekEntryResult!9508)

(assert (=> b!1010699 (= e!568755 (Found!9508 (index!40405 lt!446452)))))

(declare-fun b!1010700 () Bool)

(assert (=> b!1010700 (= e!568756 Undefined!9508)))

(declare-fun b!1010701 () Bool)

(assert (=> b!1010701 (= e!568757 (seekKeyOrZeroReturnVacant!0 (bvadd (x!87950 lt!446452) #b00000000000000000000000000000001) (nextIndex!0 (index!40405 lt!446452) (bvadd (x!87950 lt!446452) #b00000000000000000000000000000001) mask!3464) (index!40405 lt!446452) k0!2224 a!3219 mask!3464))))

(declare-fun b!1010702 () Bool)

(declare-fun c!102268 () Bool)

(assert (=> b!1010702 (= c!102268 (= lt!446622 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010702 (= e!568755 e!568757)))

(declare-fun b!1010703 () Bool)

(assert (=> b!1010703 (= e!568756 e!568755)))

(declare-fun c!102267 () Bool)

(assert (=> b!1010703 (= c!102267 (= lt!446622 k0!2224))))

(assert (= (and d!120339 c!102269) b!1010700))

(assert (= (and d!120339 (not c!102269)) b!1010703))

(assert (= (and b!1010703 c!102267) b!1010699))

(assert (= (and b!1010703 (not c!102267)) b!1010702))

(assert (= (and b!1010702 c!102268) b!1010698))

(assert (= (and b!1010702 (not c!102268)) b!1010701))

(declare-fun m!935559 () Bool)

(assert (=> d!120339 m!935559))

(declare-fun m!935561 () Bool)

(assert (=> d!120339 m!935561))

(assert (=> d!120339 m!935199))

(assert (=> d!120339 m!935059))

(declare-fun m!935563 () Bool)

(assert (=> b!1010701 m!935563))

(assert (=> b!1010701 m!935563))

(declare-fun m!935565 () Bool)

(assert (=> b!1010701 m!935565))

(assert (=> b!1010271 d!120339))

(declare-fun d!120341 () Bool)

(assert (=> d!120341 (= (validKeyInArray!0 (select (arr!30640 a!3219) #b00000000000000000000000000000000)) (and (not (= (select (arr!30640 a!3219) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30640 a!3219) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1010303 d!120341))

(declare-fun d!120343 () Bool)

(declare-fun res!678491 () (_ BitVec 32))

(assert (=> d!120343 (and (bvsge res!678491 #b00000000000000000000000000000000) (bvslt res!678491 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(assert (=> d!120343 true))

(assert (=> d!120343 (= (choose!52 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464) res!678491)))

(assert (=> d!120165 d!120343))

(assert (=> d!120165 d!120155))

(declare-fun b!1010704 () Bool)

(declare-fun e!568758 () Bool)

(declare-fun e!568759 () Bool)

(assert (=> b!1010704 (= e!568758 e!568759)))

(declare-fun res!678492 () Bool)

(declare-fun lt!446624 () SeekEntryResult!9508)

(assert (=> b!1010704 (= res!678492 (and ((_ is Intermediate!9508) lt!446624) (not (undefined!10320 lt!446624)) (bvslt (x!87950 lt!446624) #b01111111111111111111111111111110) (bvsge (x!87950 lt!446624) #b00000000000000000000000000000000) (bvsge (x!87950 lt!446624) (bvadd x!1245 #b00000000000000000000000000000001))))))

(assert (=> b!1010704 (=> (not res!678492) (not e!568759))))

(declare-fun e!568762 () SeekEntryResult!9508)

(declare-fun b!1010705 () Bool)

(assert (=> b!1010705 (= e!568762 (Intermediate!9508 true (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (bvadd x!1245 #b00000000000000000000000000000001)))))

(declare-fun b!1010706 () Bool)

(declare-fun e!568760 () SeekEntryResult!9508)

(assert (=> b!1010706 (= e!568760 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (bvadd x!1245 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!3464) lt!446367 lt!446366 mask!3464))))

(declare-fun b!1010707 () Bool)

(assert (=> b!1010707 (= e!568762 e!568760)))

(declare-fun c!102270 () Bool)

(declare-fun lt!446623 () (_ BitVec 64))

(assert (=> b!1010707 (= c!102270 (or (= lt!446623 lt!446367) (= (bvadd lt!446623 lt!446623) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010709 () Bool)

(assert (=> b!1010709 (and (bvsge (index!40405 lt!446624) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446624) (size!31143 lt!446366)))))

(declare-fun res!678494 () Bool)

(assert (=> b!1010709 (= res!678494 (= (select (arr!30640 lt!446366) (index!40405 lt!446624)) lt!446367))))

(declare-fun e!568761 () Bool)

(assert (=> b!1010709 (=> res!678494 e!568761)))

(assert (=> b!1010709 (= e!568759 e!568761)))

(declare-fun b!1010710 () Bool)

(assert (=> b!1010710 (= e!568760 (Intermediate!9508 false (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (bvadd x!1245 #b00000000000000000000000000000001)))))

(declare-fun b!1010711 () Bool)

(assert (=> b!1010711 (and (bvsge (index!40405 lt!446624) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446624) (size!31143 lt!446366)))))

(declare-fun res!678493 () Bool)

(assert (=> b!1010711 (= res!678493 (= (select (arr!30640 lt!446366) (index!40405 lt!446624)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010711 (=> res!678493 e!568761)))

(declare-fun b!1010712 () Bool)

(assert (=> b!1010712 (and (bvsge (index!40405 lt!446624) #b00000000000000000000000000000000) (bvslt (index!40405 lt!446624) (size!31143 lt!446366)))))

(assert (=> b!1010712 (= e!568761 (= (select (arr!30640 lt!446366) (index!40405 lt!446624)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010708 () Bool)

(assert (=> b!1010708 (= e!568758 (bvsge (x!87950 lt!446624) #b01111111111111111111111111111110))))

(declare-fun d!120345 () Bool)

(assert (=> d!120345 e!568758))

(declare-fun c!102271 () Bool)

(assert (=> d!120345 (= c!102271 (and ((_ is Intermediate!9508) lt!446624) (undefined!10320 lt!446624)))))

(assert (=> d!120345 (= lt!446624 e!568762)))

(declare-fun c!102272 () Bool)

(assert (=> d!120345 (= c!102272 (bvsge (bvadd x!1245 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!120345 (= lt!446623 (select (arr!30640 lt!446366) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464)))))

(assert (=> d!120345 (validMask!0 mask!3464)))

(assert (=> d!120345 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) lt!446367 lt!446366 mask!3464) lt!446624)))

(assert (= (and d!120345 c!102272) b!1010705))

(assert (= (and d!120345 (not c!102272)) b!1010707))

(assert (= (and b!1010707 c!102270) b!1010710))

(assert (= (and b!1010707 (not c!102270)) b!1010706))

(assert (= (and d!120345 c!102271) b!1010708))

(assert (= (and d!120345 (not c!102271)) b!1010704))

(assert (= (and b!1010704 res!678492) b!1010709))

(assert (= (and b!1010709 (not res!678494)) b!1010711))

(assert (= (and b!1010711 (not res!678493)) b!1010712))

(declare-fun m!935567 () Bool)

(assert (=> b!1010709 m!935567))

(assert (=> b!1010712 m!935567))

(assert (=> b!1010711 m!935567))

(assert (=> b!1010706 m!935143))

(assert (=> b!1010706 m!935543))

(assert (=> b!1010706 m!935543))

(declare-fun m!935569 () Bool)

(assert (=> b!1010706 m!935569))

(assert (=> d!120345 m!935143))

(declare-fun m!935571 () Bool)

(assert (=> d!120345 m!935571))

(assert (=> d!120345 m!935059))

(assert (=> b!1010335 d!120345))

(assert (=> b!1010335 d!120333))

(declare-fun d!120347 () Bool)

(declare-fun res!678495 () Bool)

(declare-fun e!568763 () Bool)

(assert (=> d!120347 (=> res!678495 e!568763)))

(assert (=> d!120347 (= res!678495 (= (select (arr!30640 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2224))))

(assert (=> d!120347 (= (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!568763)))

(declare-fun b!1010713 () Bool)

(declare-fun e!568764 () Bool)

(assert (=> b!1010713 (= e!568763 e!568764)))

(declare-fun res!678496 () Bool)

(assert (=> b!1010713 (=> (not res!678496) (not e!568764))))

(assert (=> b!1010713 (= res!678496 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31143 a!3219)))))

(declare-fun b!1010714 () Bool)

(assert (=> b!1010714 (= e!568764 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!120347 (not res!678495)) b!1010713))

(assert (= (and b!1010713 res!678496) b!1010714))

(declare-fun m!935573 () Bool)

(assert (=> d!120347 m!935573))

(declare-fun m!935575 () Bool)

(assert (=> b!1010714 m!935575))

(assert (=> b!1010158 d!120347))

(assert (=> d!120213 d!120155))

(assert (=> d!120173 d!120155))

(assert (=> b!1010332 d!120341))

(assert (=> d!120211 d!120155))

(declare-fun b!1010715 () Bool)

(declare-fun e!568768 () Bool)

(declare-fun e!568767 () Bool)

(assert (=> b!1010715 (= e!568768 e!568767)))

(declare-fun res!678499 () Bool)

(assert (=> b!1010715 (=> (not res!678499) (not e!568767))))

(declare-fun e!568766 () Bool)

(assert (=> b!1010715 (= res!678499 (not e!568766))))

(declare-fun res!678498 () Bool)

(assert (=> b!1010715 (=> (not res!678498) (not e!568766))))

(assert (=> b!1010715 (= res!678498 (validKeyInArray!0 (select (arr!30640 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1010716 () Bool)

(declare-fun e!568765 () Bool)

(assert (=> b!1010716 (= e!568767 e!568765)))

(declare-fun c!102273 () Bool)

(assert (=> b!1010716 (= c!102273 (validKeyInArray!0 (select (arr!30640 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1010717 () Bool)

(declare-fun call!42453 () Bool)

(assert (=> b!1010717 (= e!568765 call!42453)))

(declare-fun b!1010718 () Bool)

(assert (=> b!1010718 (= e!568766 (contains!5908 (ite c!102141 (Cons!21283 (select (arr!30640 a!3219) #b00000000000000000000000000000000) Nil!21284) Nil!21284) (select (arr!30640 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1010719 () Bool)

(assert (=> b!1010719 (= e!568765 call!42453)))

(declare-fun d!120349 () Bool)

(declare-fun res!678497 () Bool)

(assert (=> d!120349 (=> res!678497 e!568768)))

(assert (=> d!120349 (= res!678497 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31143 a!3219)))))

(assert (=> d!120349 (= (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!102141 (Cons!21283 (select (arr!30640 a!3219) #b00000000000000000000000000000000) Nil!21284) Nil!21284)) e!568768)))

(declare-fun bm!42450 () Bool)

(assert (=> bm!42450 (= call!42453 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!102273 (Cons!21283 (select (arr!30640 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!102141 (Cons!21283 (select (arr!30640 a!3219) #b00000000000000000000000000000000) Nil!21284) Nil!21284)) (ite c!102141 (Cons!21283 (select (arr!30640 a!3219) #b00000000000000000000000000000000) Nil!21284) Nil!21284))))))

(assert (= (and d!120349 (not res!678497)) b!1010715))

(assert (= (and b!1010715 res!678498) b!1010718))

(assert (= (and b!1010715 res!678499) b!1010716))

(assert (= (and b!1010716 c!102273) b!1010719))

(assert (= (and b!1010716 (not c!102273)) b!1010717))

(assert (= (or b!1010719 b!1010717) bm!42450))

(assert (=> b!1010715 m!935573))

(assert (=> b!1010715 m!935573))

(declare-fun m!935577 () Bool)

(assert (=> b!1010715 m!935577))

(assert (=> b!1010716 m!935573))

(assert (=> b!1010716 m!935573))

(assert (=> b!1010716 m!935577))

(assert (=> b!1010718 m!935573))

(assert (=> b!1010718 m!935573))

(declare-fun m!935579 () Bool)

(assert (=> b!1010718 m!935579))

(assert (=> bm!42450 m!935573))

(declare-fun m!935581 () Bool)

(assert (=> bm!42450 m!935581))

(assert (=> bm!42433 d!120349))

(assert (=> b!1010302 d!120341))

(declare-fun d!120351 () Bool)

(declare-fun res!678500 () Bool)

(declare-fun e!568770 () Bool)

(assert (=> d!120351 (=> res!678500 e!568770)))

(assert (=> d!120351 (= res!678500 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31143 a!3219)))))

(assert (=> d!120351 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464) e!568770)))

(declare-fun b!1010720 () Bool)

(declare-fun e!568771 () Bool)

(declare-fun call!42454 () Bool)

(assert (=> b!1010720 (= e!568771 call!42454)))

(declare-fun b!1010721 () Bool)

(declare-fun e!568769 () Bool)

(assert (=> b!1010721 (= e!568769 call!42454)))

(declare-fun b!1010722 () Bool)

(assert (=> b!1010722 (= e!568769 e!568771)))

(declare-fun lt!446626 () (_ BitVec 64))

(assert (=> b!1010722 (= lt!446626 (select (arr!30640 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!446625 () Unit!33003)

(assert (=> b!1010722 (= lt!446625 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!446626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1010722 (arrayContainsKey!0 a!3219 lt!446626 #b00000000000000000000000000000000)))

(declare-fun lt!446627 () Unit!33003)

(assert (=> b!1010722 (= lt!446627 lt!446625)))

(declare-fun res!678501 () Bool)

(assert (=> b!1010722 (= res!678501 (= (seekEntryOrOpen!0 (select (arr!30640 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3219 mask!3464) (Found!9508 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1010722 (=> (not res!678501) (not e!568771))))

(declare-fun bm!42451 () Bool)

(assert (=> bm!42451 (= call!42454 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1010723 () Bool)

(assert (=> b!1010723 (= e!568770 e!568769)))

(declare-fun c!102274 () Bool)

(assert (=> b!1010723 (= c!102274 (validKeyInArray!0 (select (arr!30640 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!120351 (not res!678500)) b!1010723))

(assert (= (and b!1010723 c!102274) b!1010722))

(assert (= (and b!1010723 (not c!102274)) b!1010721))

(assert (= (and b!1010722 res!678501) b!1010720))

(assert (= (or b!1010720 b!1010721) bm!42451))

(assert (=> b!1010722 m!935573))

(declare-fun m!935583 () Bool)

(assert (=> b!1010722 m!935583))

(declare-fun m!935585 () Bool)

(assert (=> b!1010722 m!935585))

(assert (=> b!1010722 m!935573))

(declare-fun m!935587 () Bool)

(assert (=> b!1010722 m!935587))

(declare-fun m!935589 () Bool)

(assert (=> bm!42451 m!935589))

(assert (=> b!1010723 m!935573))

(assert (=> b!1010723 m!935573))

(assert (=> b!1010723 m!935577))

(assert (=> bm!42439 d!120351))

(declare-fun d!120353 () Bool)

(assert (=> d!120353 (arrayContainsKey!0 a!3219 lt!446475 #b00000000000000000000000000000000)))

(declare-fun lt!446630 () Unit!33003)

(declare-fun choose!13 (array!63651 (_ BitVec 64) (_ BitVec 32)) Unit!33003)

(assert (=> d!120353 (= lt!446630 (choose!13 a!3219 lt!446475 #b00000000000000000000000000000000))))

(assert (=> d!120353 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!120353 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!446475 #b00000000000000000000000000000000) lt!446630)))

(declare-fun bs!28723 () Bool)

(assert (= bs!28723 d!120353))

(assert (=> bs!28723 m!935235))

(declare-fun m!935591 () Bool)

(assert (=> bs!28723 m!935591))

(assert (=> b!1010331 d!120353))

(declare-fun d!120355 () Bool)

(declare-fun res!678502 () Bool)

(declare-fun e!568772 () Bool)

(assert (=> d!120355 (=> res!678502 e!568772)))

(assert (=> d!120355 (= res!678502 (= (select (arr!30640 a!3219) #b00000000000000000000000000000000) lt!446475))))

(assert (=> d!120355 (= (arrayContainsKey!0 a!3219 lt!446475 #b00000000000000000000000000000000) e!568772)))

(declare-fun b!1010724 () Bool)

(declare-fun e!568773 () Bool)

(assert (=> b!1010724 (= e!568772 e!568773)))

(declare-fun res!678503 () Bool)

(assert (=> b!1010724 (=> (not res!678503) (not e!568773))))

(assert (=> b!1010724 (= res!678503 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31143 a!3219)))))

(declare-fun b!1010725 () Bool)

(assert (=> b!1010725 (= e!568773 (arrayContainsKey!0 a!3219 lt!446475 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!120355 (not res!678502)) b!1010724))

(assert (= (and b!1010724 res!678503) b!1010725))

(assert (=> d!120355 m!935135))

(declare-fun m!935593 () Bool)

(assert (=> b!1010725 m!935593))

(assert (=> b!1010331 d!120355))

(declare-fun b!1010726 () Bool)

(declare-fun e!568775 () SeekEntryResult!9508)

(declare-fun lt!446633 () SeekEntryResult!9508)

(assert (=> b!1010726 (= e!568775 (MissingZero!9508 (index!40405 lt!446633)))))

(declare-fun b!1010727 () Bool)

(declare-fun e!568776 () SeekEntryResult!9508)

(assert (=> b!1010727 (= e!568776 (Found!9508 (index!40405 lt!446633)))))

(declare-fun b!1010728 () Bool)

(declare-fun c!102275 () Bool)

(declare-fun lt!446631 () (_ BitVec 64))

(assert (=> b!1010728 (= c!102275 (= lt!446631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010728 (= e!568776 e!568775)))

(declare-fun b!1010729 () Bool)

(declare-fun e!568774 () SeekEntryResult!9508)

(assert (=> b!1010729 (= e!568774 Undefined!9508)))

(declare-fun d!120357 () Bool)

(declare-fun lt!446632 () SeekEntryResult!9508)

(assert (=> d!120357 (and (or ((_ is Undefined!9508) lt!446632) (not ((_ is Found!9508) lt!446632)) (and (bvsge (index!40404 lt!446632) #b00000000000000000000000000000000) (bvslt (index!40404 lt!446632) (size!31143 a!3219)))) (or ((_ is Undefined!9508) lt!446632) ((_ is Found!9508) lt!446632) (not ((_ is MissingZero!9508) lt!446632)) (and (bvsge (index!40403 lt!446632) #b00000000000000000000000000000000) (bvslt (index!40403 lt!446632) (size!31143 a!3219)))) (or ((_ is Undefined!9508) lt!446632) ((_ is Found!9508) lt!446632) ((_ is MissingZero!9508) lt!446632) (not ((_ is MissingVacant!9508) lt!446632)) (and (bvsge (index!40406 lt!446632) #b00000000000000000000000000000000) (bvslt (index!40406 lt!446632) (size!31143 a!3219)))) (or ((_ is Undefined!9508) lt!446632) (ite ((_ is Found!9508) lt!446632) (= (select (arr!30640 a!3219) (index!40404 lt!446632)) (select (arr!30640 a!3219) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9508) lt!446632) (= (select (arr!30640 a!3219) (index!40403 lt!446632)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9508) lt!446632) (= (select (arr!30640 a!3219) (index!40406 lt!446632)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!120357 (= lt!446632 e!568774)))

(declare-fun c!102276 () Bool)

(assert (=> d!120357 (= c!102276 (and ((_ is Intermediate!9508) lt!446633) (undefined!10320 lt!446633)))))

(assert (=> d!120357 (= lt!446633 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30640 a!3219) #b00000000000000000000000000000000) mask!3464) (select (arr!30640 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464))))

(assert (=> d!120357 (validMask!0 mask!3464)))

(assert (=> d!120357 (= (seekEntryOrOpen!0 (select (arr!30640 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) lt!446632)))

(declare-fun b!1010730 () Bool)

(assert (=> b!1010730 (= e!568775 (seekKeyOrZeroReturnVacant!0 (x!87950 lt!446633) (index!40405 lt!446633) (index!40405 lt!446633) (select (arr!30640 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464))))

(declare-fun b!1010731 () Bool)

(assert (=> b!1010731 (= e!568774 e!568776)))

(assert (=> b!1010731 (= lt!446631 (select (arr!30640 a!3219) (index!40405 lt!446633)))))

(declare-fun c!102277 () Bool)

(assert (=> b!1010731 (= c!102277 (= lt!446631 (select (arr!30640 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!120357 c!102276) b!1010729))

(assert (= (and d!120357 (not c!102276)) b!1010731))

(assert (= (and b!1010731 c!102277) b!1010727))

(assert (= (and b!1010731 (not c!102277)) b!1010728))

(assert (= (and b!1010728 c!102275) b!1010726))

(assert (= (and b!1010728 (not c!102275)) b!1010730))

(declare-fun m!935595 () Bool)

(assert (=> d!120357 m!935595))

(declare-fun m!935597 () Bool)

(assert (=> d!120357 m!935597))

(assert (=> d!120357 m!935135))

(declare-fun m!935599 () Bool)

(assert (=> d!120357 m!935599))

(assert (=> d!120357 m!935059))

(declare-fun m!935601 () Bool)

(assert (=> d!120357 m!935601))

(assert (=> d!120357 m!935599))

(assert (=> d!120357 m!935135))

(declare-fun m!935603 () Bool)

(assert (=> d!120357 m!935603))

(assert (=> b!1010730 m!935135))

(declare-fun m!935605 () Bool)

(assert (=> b!1010730 m!935605))

(declare-fun m!935607 () Bool)

(assert (=> b!1010731 m!935607))

(assert (=> b!1010331 d!120357))

(check-sat (not d!120329) (not b!1010716) (not d!120331) (not b!1010714) (not b!1010679) (not b!1010730) (not d!120357) (not d!120325) (not b!1010701) (not b!1010661) (not b!1010722) (not b!1010706) (not b!1010646) (not d!120327) (not b!1010715) (not d!120333) (not b!1010723) (not b!1010718) (not d!120335) (not d!120339) (not b!1010725) (not d!120353) (not bm!42450) (not b!1010658) (not bm!42451) (not d!120345) (not d!120323) (not d!120321) (not b!1010670))
(check-sat)
