; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87046 () Bool)

(assert start!87046)

(declare-fun b!1007983 () Bool)

(declare-fun e!567425 () Bool)

(declare-fun e!567426 () Bool)

(assert (=> b!1007983 (= e!567425 e!567426)))

(declare-fun res!676322 () Bool)

(assert (=> b!1007983 (=> (not res!676322) (not e!567426))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9466 0))(
  ( (MissingZero!9466 (index!40235 (_ BitVec 32))) (Found!9466 (index!40236 (_ BitVec 32))) (Intermediate!9466 (undefined!10278 Bool) (index!40237 (_ BitVec 32)) (x!87790 (_ BitVec 32))) (Undefined!9466) (MissingVacant!9466 (index!40238 (_ BitVec 32))) )
))
(declare-fun lt!445376 () SeekEntryResult!9466)

(declare-fun lt!445374 () (_ BitVec 64))

(declare-datatypes ((array!63564 0))(
  ( (array!63565 (arr!30598 (Array (_ BitVec 32) (_ BitVec 64))) (size!31101 (_ BitVec 32))) )
))
(declare-fun lt!445375 () array!63564)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63564 (_ BitVec 32)) SeekEntryResult!9466)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007983 (= res!676322 (not (= lt!445376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445374 mask!3464) lt!445374 lt!445375 mask!3464))))))

(declare-fun a!3219 () array!63564)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1007983 (= lt!445374 (select (store (arr!30598 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1007983 (= lt!445375 (array!63565 (store (arr!30598 a!3219) i!1194 k0!2224) (size!31101 a!3219)))))

(declare-fun b!1007984 () Bool)

(declare-fun res!676318 () Bool)

(declare-fun e!567422 () Bool)

(assert (=> b!1007984 (=> (not res!676318) (not e!567422))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007984 (= res!676318 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007985 () Bool)

(declare-fun res!676311 () Bool)

(assert (=> b!1007985 (=> (not res!676311) (not e!567422))))

(assert (=> b!1007985 (= res!676311 (validKeyInArray!0 (select (arr!30598 a!3219) j!170)))))

(declare-fun b!1007986 () Bool)

(declare-fun e!567424 () Bool)

(declare-fun e!567423 () Bool)

(assert (=> b!1007986 (= e!567424 e!567423)))

(declare-fun res!676314 () Bool)

(assert (=> b!1007986 (=> (not res!676314) (not e!567423))))

(declare-fun lt!445377 () SeekEntryResult!9466)

(assert (=> b!1007986 (= res!676314 (= lt!445376 lt!445377))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007986 (= lt!445377 (Intermediate!9466 false resIndex!38 resX!38))))

(assert (=> b!1007986 (= lt!445376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30598 a!3219) j!170) mask!3464) (select (arr!30598 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007987 () Bool)

(declare-fun res!676319 () Bool)

(assert (=> b!1007987 (=> (not res!676319) (not e!567424))))

(declare-datatypes ((List!21245 0))(
  ( (Nil!21242) (Cons!21241 (h!22433 (_ BitVec 64)) (t!30238 List!21245)) )
))
(declare-fun arrayNoDuplicates!0 (array!63564 (_ BitVec 32) List!21245) Bool)

(assert (=> b!1007987 (= res!676319 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21242))))

(declare-fun b!1007988 () Bool)

(assert (=> b!1007988 (= e!567423 e!567425)))

(declare-fun res!676310 () Bool)

(assert (=> b!1007988 (=> (not res!676310) (not e!567425))))

(declare-fun lt!445378 () SeekEntryResult!9466)

(assert (=> b!1007988 (= res!676310 (= lt!445378 lt!445377))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1007988 (= lt!445378 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30598 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007990 () Bool)

(assert (=> b!1007990 (= e!567422 e!567424)))

(declare-fun res!676321 () Bool)

(assert (=> b!1007990 (=> (not res!676321) (not e!567424))))

(declare-fun lt!445379 () SeekEntryResult!9466)

(assert (=> b!1007990 (= res!676321 (or (= lt!445379 (MissingVacant!9466 i!1194)) (= lt!445379 (MissingZero!9466 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63564 (_ BitVec 32)) SeekEntryResult!9466)

(assert (=> b!1007990 (= lt!445379 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007991 () Bool)

(declare-fun res!676312 () Bool)

(assert (=> b!1007991 (=> (not res!676312) (not e!567422))))

(declare-fun arrayContainsKey!0 (array!63564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007991 (= res!676312 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007992 () Bool)

(declare-fun res!676316 () Bool)

(assert (=> b!1007992 (=> (not res!676316) (not e!567426))))

(assert (=> b!1007992 (= res!676316 (not (= lt!445378 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445374 lt!445375 mask!3464))))))

(declare-fun b!1007993 () Bool)

(declare-fun res!676313 () Bool)

(assert (=> b!1007993 (=> (not res!676313) (not e!567424))))

(assert (=> b!1007993 (= res!676313 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31101 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31101 a!3219))))))

(declare-fun b!1007994 () Bool)

(declare-fun res!676317 () Bool)

(assert (=> b!1007994 (=> (not res!676317) (not e!567422))))

(assert (=> b!1007994 (= res!676317 (and (= (size!31101 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31101 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31101 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007995 () Bool)

(assert (=> b!1007995 (= e!567426 (and (= index!1507 resIndex!38) (= x!1245 resX!38) (not (= resIndex!38 i!1194))))))

(declare-fun b!1007989 () Bool)

(declare-fun res!676320 () Bool)

(assert (=> b!1007989 (=> (not res!676320) (not e!567424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63564 (_ BitVec 32)) Bool)

(assert (=> b!1007989 (= res!676320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!676315 () Bool)

(assert (=> start!87046 (=> (not res!676315) (not e!567422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87046 (= res!676315 (validMask!0 mask!3464))))

(assert (=> start!87046 e!567422))

(declare-fun array_inv!23734 (array!63564) Bool)

(assert (=> start!87046 (array_inv!23734 a!3219)))

(assert (=> start!87046 true))

(assert (= (and start!87046 res!676315) b!1007994))

(assert (= (and b!1007994 res!676317) b!1007985))

(assert (= (and b!1007985 res!676311) b!1007984))

(assert (= (and b!1007984 res!676318) b!1007991))

(assert (= (and b!1007991 res!676312) b!1007990))

(assert (= (and b!1007990 res!676321) b!1007989))

(assert (= (and b!1007989 res!676320) b!1007987))

(assert (= (and b!1007987 res!676319) b!1007993))

(assert (= (and b!1007993 res!676313) b!1007986))

(assert (= (and b!1007986 res!676314) b!1007988))

(assert (= (and b!1007988 res!676310) b!1007983))

(assert (= (and b!1007983 res!676322) b!1007992))

(assert (= (and b!1007992 res!676316) b!1007995))

(declare-fun m!933335 () Bool)

(assert (=> b!1007986 m!933335))

(assert (=> b!1007986 m!933335))

(declare-fun m!933337 () Bool)

(assert (=> b!1007986 m!933337))

(assert (=> b!1007986 m!933337))

(assert (=> b!1007986 m!933335))

(declare-fun m!933339 () Bool)

(assert (=> b!1007986 m!933339))

(assert (=> b!1007988 m!933335))

(assert (=> b!1007988 m!933335))

(declare-fun m!933341 () Bool)

(assert (=> b!1007988 m!933341))

(declare-fun m!933343 () Bool)

(assert (=> b!1007984 m!933343))

(declare-fun m!933345 () Bool)

(assert (=> start!87046 m!933345))

(declare-fun m!933347 () Bool)

(assert (=> start!87046 m!933347))

(declare-fun m!933349 () Bool)

(assert (=> b!1007992 m!933349))

(declare-fun m!933351 () Bool)

(assert (=> b!1007989 m!933351))

(declare-fun m!933353 () Bool)

(assert (=> b!1007987 m!933353))

(assert (=> b!1007985 m!933335))

(assert (=> b!1007985 m!933335))

(declare-fun m!933355 () Bool)

(assert (=> b!1007985 m!933355))

(declare-fun m!933357 () Bool)

(assert (=> b!1007983 m!933357))

(assert (=> b!1007983 m!933357))

(declare-fun m!933359 () Bool)

(assert (=> b!1007983 m!933359))

(declare-fun m!933361 () Bool)

(assert (=> b!1007983 m!933361))

(declare-fun m!933363 () Bool)

(assert (=> b!1007983 m!933363))

(declare-fun m!933365 () Bool)

(assert (=> b!1007990 m!933365))

(declare-fun m!933367 () Bool)

(assert (=> b!1007991 m!933367))

(check-sat (not start!87046) (not b!1007985) (not b!1007990) (not b!1007991) (not b!1007984) (not b!1007988) (not b!1007986) (not b!1007992) (not b!1007983) (not b!1007987) (not b!1007989))
(check-sat)
(get-model)

(declare-fun b!1008092 () Bool)

(declare-fun e!567473 () SeekEntryResult!9466)

(assert (=> b!1008092 (= e!567473 (Intermediate!9466 false (toIndex!0 lt!445374 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1008093 () Bool)

(declare-fun e!567476 () Bool)

(declare-fun lt!445421 () SeekEntryResult!9466)

(assert (=> b!1008093 (= e!567476 (bvsge (x!87790 lt!445421) #b01111111111111111111111111111110))))

(declare-fun b!1008094 () Bool)

(declare-fun e!567477 () Bool)

(assert (=> b!1008094 (= e!567476 e!567477)))

(declare-fun res!676408 () Bool)

(get-info :version)

(assert (=> b!1008094 (= res!676408 (and ((_ is Intermediate!9466) lt!445421) (not (undefined!10278 lt!445421)) (bvslt (x!87790 lt!445421) #b01111111111111111111111111111110) (bvsge (x!87790 lt!445421) #b00000000000000000000000000000000) (bvsge (x!87790 lt!445421) #b00000000000000000000000000000000)))))

(assert (=> b!1008094 (=> (not res!676408) (not e!567477))))

(declare-fun b!1008095 () Bool)

(assert (=> b!1008095 (and (bvsge (index!40237 lt!445421) #b00000000000000000000000000000000) (bvslt (index!40237 lt!445421) (size!31101 lt!445375)))))

(declare-fun e!567474 () Bool)

(assert (=> b!1008095 (= e!567474 (= (select (arr!30598 lt!445375) (index!40237 lt!445421)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1008096 () Bool)

(assert (=> b!1008096 (and (bvsge (index!40237 lt!445421) #b00000000000000000000000000000000) (bvslt (index!40237 lt!445421) (size!31101 lt!445375)))))

(declare-fun res!676407 () Bool)

(assert (=> b!1008096 (= res!676407 (= (select (arr!30598 lt!445375) (index!40237 lt!445421)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1008096 (=> res!676407 e!567474)))

(declare-fun b!1008098 () Bool)

(assert (=> b!1008098 (and (bvsge (index!40237 lt!445421) #b00000000000000000000000000000000) (bvslt (index!40237 lt!445421) (size!31101 lt!445375)))))

(declare-fun res!676409 () Bool)

(assert (=> b!1008098 (= res!676409 (= (select (arr!30598 lt!445375) (index!40237 lt!445421)) lt!445374))))

(assert (=> b!1008098 (=> res!676409 e!567474)))

(assert (=> b!1008098 (= e!567477 e!567474)))

(declare-fun b!1008097 () Bool)

(declare-fun e!567475 () SeekEntryResult!9466)

(assert (=> b!1008097 (= e!567475 e!567473)))

(declare-fun c!102001 () Bool)

(declare-fun lt!445420 () (_ BitVec 64))

(assert (=> b!1008097 (= c!102001 (or (= lt!445420 lt!445374) (= (bvadd lt!445420 lt!445420) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!120043 () Bool)

(assert (=> d!120043 e!567476))

(declare-fun c!101999 () Bool)

(assert (=> d!120043 (= c!101999 (and ((_ is Intermediate!9466) lt!445421) (undefined!10278 lt!445421)))))

(assert (=> d!120043 (= lt!445421 e!567475)))

(declare-fun c!102000 () Bool)

(assert (=> d!120043 (= c!102000 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!120043 (= lt!445420 (select (arr!30598 lt!445375) (toIndex!0 lt!445374 mask!3464)))))

(assert (=> d!120043 (validMask!0 mask!3464)))

(assert (=> d!120043 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445374 mask!3464) lt!445374 lt!445375 mask!3464) lt!445421)))

(declare-fun b!1008099 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008099 (= e!567473 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!445374 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) lt!445374 lt!445375 mask!3464))))

(declare-fun b!1008100 () Bool)

(assert (=> b!1008100 (= e!567475 (Intermediate!9466 true (toIndex!0 lt!445374 mask!3464) #b00000000000000000000000000000000))))

(assert (= (and d!120043 c!102000) b!1008100))

(assert (= (and d!120043 (not c!102000)) b!1008097))

(assert (= (and b!1008097 c!102001) b!1008092))

(assert (= (and b!1008097 (not c!102001)) b!1008099))

(assert (= (and d!120043 c!101999) b!1008093))

(assert (= (and d!120043 (not c!101999)) b!1008094))

(assert (= (and b!1008094 res!676408) b!1008098))

(assert (= (and b!1008098 (not res!676409)) b!1008096))

(assert (= (and b!1008096 (not res!676407)) b!1008095))

(assert (=> b!1008099 m!933357))

(declare-fun m!933437 () Bool)

(assert (=> b!1008099 m!933437))

(assert (=> b!1008099 m!933437))

(declare-fun m!933439 () Bool)

(assert (=> b!1008099 m!933439))

(declare-fun m!933441 () Bool)

(assert (=> b!1008095 m!933441))

(assert (=> b!1008096 m!933441))

(assert (=> d!120043 m!933357))

(declare-fun m!933443 () Bool)

(assert (=> d!120043 m!933443))

(assert (=> d!120043 m!933345))

(assert (=> b!1008098 m!933441))

(assert (=> b!1007983 d!120043))

(declare-fun d!120045 () Bool)

(declare-fun lt!445427 () (_ BitVec 32))

(declare-fun lt!445426 () (_ BitVec 32))

(assert (=> d!120045 (= lt!445427 (bvmul (bvxor lt!445426 (bvlshr lt!445426 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120045 (= lt!445426 ((_ extract 31 0) (bvand (bvxor lt!445374 (bvlshr lt!445374 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120045 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!676410 (let ((h!22436 ((_ extract 31 0) (bvand (bvxor lt!445374 (bvlshr lt!445374 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87794 (bvmul (bvxor h!22436 (bvlshr h!22436 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87794 (bvlshr x!87794 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!676410 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!676410 #b00000000000000000000000000000000))))))

(assert (=> d!120045 (= (toIndex!0 lt!445374 mask!3464) (bvand (bvxor lt!445427 (bvlshr lt!445427 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1007983 d!120045))

(declare-fun d!120047 () Bool)

(assert (=> d!120047 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1007984 d!120047))

(declare-fun d!120049 () Bool)

(assert (=> d!120049 (= (validKeyInArray!0 (select (arr!30598 a!3219) j!170)) (and (not (= (select (arr!30598 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30598 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1007985 d!120049))

(declare-fun b!1008101 () Bool)

(declare-fun e!567478 () SeekEntryResult!9466)

(assert (=> b!1008101 (= e!567478 (Intermediate!9466 false (toIndex!0 (select (arr!30598 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1008102 () Bool)

(declare-fun e!567481 () Bool)

(declare-fun lt!445429 () SeekEntryResult!9466)

(assert (=> b!1008102 (= e!567481 (bvsge (x!87790 lt!445429) #b01111111111111111111111111111110))))

(declare-fun b!1008103 () Bool)

(declare-fun e!567482 () Bool)

(assert (=> b!1008103 (= e!567481 e!567482)))

(declare-fun res!676412 () Bool)

(assert (=> b!1008103 (= res!676412 (and ((_ is Intermediate!9466) lt!445429) (not (undefined!10278 lt!445429)) (bvslt (x!87790 lt!445429) #b01111111111111111111111111111110) (bvsge (x!87790 lt!445429) #b00000000000000000000000000000000) (bvsge (x!87790 lt!445429) #b00000000000000000000000000000000)))))

(assert (=> b!1008103 (=> (not res!676412) (not e!567482))))

(declare-fun b!1008104 () Bool)

(assert (=> b!1008104 (and (bvsge (index!40237 lt!445429) #b00000000000000000000000000000000) (bvslt (index!40237 lt!445429) (size!31101 a!3219)))))

(declare-fun e!567479 () Bool)

(assert (=> b!1008104 (= e!567479 (= (select (arr!30598 a!3219) (index!40237 lt!445429)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1008105 () Bool)

(assert (=> b!1008105 (and (bvsge (index!40237 lt!445429) #b00000000000000000000000000000000) (bvslt (index!40237 lt!445429) (size!31101 a!3219)))))

(declare-fun res!676411 () Bool)

(assert (=> b!1008105 (= res!676411 (= (select (arr!30598 a!3219) (index!40237 lt!445429)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1008105 (=> res!676411 e!567479)))

(declare-fun b!1008107 () Bool)

(assert (=> b!1008107 (and (bvsge (index!40237 lt!445429) #b00000000000000000000000000000000) (bvslt (index!40237 lt!445429) (size!31101 a!3219)))))

(declare-fun res!676413 () Bool)

(assert (=> b!1008107 (= res!676413 (= (select (arr!30598 a!3219) (index!40237 lt!445429)) (select (arr!30598 a!3219) j!170)))))

(assert (=> b!1008107 (=> res!676413 e!567479)))

(assert (=> b!1008107 (= e!567482 e!567479)))

(declare-fun b!1008106 () Bool)

(declare-fun e!567480 () SeekEntryResult!9466)

(assert (=> b!1008106 (= e!567480 e!567478)))

(declare-fun lt!445428 () (_ BitVec 64))

(declare-fun c!102004 () Bool)

(assert (=> b!1008106 (= c!102004 (or (= lt!445428 (select (arr!30598 a!3219) j!170)) (= (bvadd lt!445428 lt!445428) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!120051 () Bool)

(assert (=> d!120051 e!567481))

(declare-fun c!102002 () Bool)

(assert (=> d!120051 (= c!102002 (and ((_ is Intermediate!9466) lt!445429) (undefined!10278 lt!445429)))))

(assert (=> d!120051 (= lt!445429 e!567480)))

(declare-fun c!102003 () Bool)

(assert (=> d!120051 (= c!102003 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!120051 (= lt!445428 (select (arr!30598 a!3219) (toIndex!0 (select (arr!30598 a!3219) j!170) mask!3464)))))

(assert (=> d!120051 (validMask!0 mask!3464)))

(assert (=> d!120051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30598 a!3219) j!170) mask!3464) (select (arr!30598 a!3219) j!170) a!3219 mask!3464) lt!445429)))

(declare-fun b!1008108 () Bool)

(assert (=> b!1008108 (= e!567478 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30598 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (select (arr!30598 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008109 () Bool)

(assert (=> b!1008109 (= e!567480 (Intermediate!9466 true (toIndex!0 (select (arr!30598 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(assert (= (and d!120051 c!102003) b!1008109))

(assert (= (and d!120051 (not c!102003)) b!1008106))

(assert (= (and b!1008106 c!102004) b!1008101))

(assert (= (and b!1008106 (not c!102004)) b!1008108))

(assert (= (and d!120051 c!102002) b!1008102))

(assert (= (and d!120051 (not c!102002)) b!1008103))

(assert (= (and b!1008103 res!676412) b!1008107))

(assert (= (and b!1008107 (not res!676413)) b!1008105))

(assert (= (and b!1008105 (not res!676411)) b!1008104))

(assert (=> b!1008108 m!933337))

(declare-fun m!933445 () Bool)

(assert (=> b!1008108 m!933445))

(assert (=> b!1008108 m!933445))

(assert (=> b!1008108 m!933335))

(declare-fun m!933447 () Bool)

(assert (=> b!1008108 m!933447))

(declare-fun m!933449 () Bool)

(assert (=> b!1008104 m!933449))

(assert (=> b!1008105 m!933449))

(assert (=> d!120051 m!933337))

(declare-fun m!933451 () Bool)

(assert (=> d!120051 m!933451))

(assert (=> d!120051 m!933345))

(assert (=> b!1008107 m!933449))

(assert (=> b!1007986 d!120051))

(declare-fun d!120053 () Bool)

(declare-fun lt!445431 () (_ BitVec 32))

(declare-fun lt!445430 () (_ BitVec 32))

(assert (=> d!120053 (= lt!445431 (bvmul (bvxor lt!445430 (bvlshr lt!445430 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120053 (= lt!445430 ((_ extract 31 0) (bvand (bvxor (select (arr!30598 a!3219) j!170) (bvlshr (select (arr!30598 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120053 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!676410 (let ((h!22436 ((_ extract 31 0) (bvand (bvxor (select (arr!30598 a!3219) j!170) (bvlshr (select (arr!30598 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87794 (bvmul (bvxor h!22436 (bvlshr h!22436 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87794 (bvlshr x!87794 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!676410 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!676410 #b00000000000000000000000000000000))))))

(assert (=> d!120053 (= (toIndex!0 (select (arr!30598 a!3219) j!170) mask!3464) (bvand (bvxor lt!445431 (bvlshr lt!445431 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1007986 d!120053))

(declare-fun b!1008120 () Bool)

(declare-fun e!567492 () Bool)

(declare-fun contains!5905 (List!21245 (_ BitVec 64)) Bool)

(assert (=> b!1008120 (= e!567492 (contains!5905 Nil!21242 (select (arr!30598 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!120055 () Bool)

(declare-fun res!676422 () Bool)

(declare-fun e!567494 () Bool)

(assert (=> d!120055 (=> res!676422 e!567494)))

(assert (=> d!120055 (= res!676422 (bvsge #b00000000000000000000000000000000 (size!31101 a!3219)))))

(assert (=> d!120055 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21242) e!567494)))

(declare-fun bm!42412 () Bool)

(declare-fun call!42415 () Bool)

(declare-fun c!102007 () Bool)

(assert (=> bm!42412 (= call!42415 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!102007 (Cons!21241 (select (arr!30598 a!3219) #b00000000000000000000000000000000) Nil!21242) Nil!21242)))))

(declare-fun b!1008121 () Bool)

(declare-fun e!567493 () Bool)

(assert (=> b!1008121 (= e!567493 call!42415)))

(declare-fun b!1008122 () Bool)

(declare-fun e!567491 () Bool)

(assert (=> b!1008122 (= e!567494 e!567491)))

(declare-fun res!676421 () Bool)

(assert (=> b!1008122 (=> (not res!676421) (not e!567491))))

(assert (=> b!1008122 (= res!676421 (not e!567492))))

(declare-fun res!676420 () Bool)

(assert (=> b!1008122 (=> (not res!676420) (not e!567492))))

(assert (=> b!1008122 (= res!676420 (validKeyInArray!0 (select (arr!30598 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1008123 () Bool)

(assert (=> b!1008123 (= e!567493 call!42415)))

(declare-fun b!1008124 () Bool)

(assert (=> b!1008124 (= e!567491 e!567493)))

(assert (=> b!1008124 (= c!102007 (validKeyInArray!0 (select (arr!30598 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!120055 (not res!676422)) b!1008122))

(assert (= (and b!1008122 res!676420) b!1008120))

(assert (= (and b!1008122 res!676421) b!1008124))

(assert (= (and b!1008124 c!102007) b!1008121))

(assert (= (and b!1008124 (not c!102007)) b!1008123))

(assert (= (or b!1008121 b!1008123) bm!42412))

(declare-fun m!933453 () Bool)

(assert (=> b!1008120 m!933453))

(assert (=> b!1008120 m!933453))

(declare-fun m!933455 () Bool)

(assert (=> b!1008120 m!933455))

(assert (=> bm!42412 m!933453))

(declare-fun m!933457 () Bool)

(assert (=> bm!42412 m!933457))

(assert (=> b!1008122 m!933453))

(assert (=> b!1008122 m!933453))

(declare-fun m!933459 () Bool)

(assert (=> b!1008122 m!933459))

(assert (=> b!1008124 m!933453))

(assert (=> b!1008124 m!933453))

(assert (=> b!1008124 m!933459))

(assert (=> b!1007987 d!120055))

(declare-fun b!1008125 () Bool)

(declare-fun e!567495 () SeekEntryResult!9466)

(assert (=> b!1008125 (= e!567495 (Intermediate!9466 false index!1507 x!1245))))

(declare-fun b!1008126 () Bool)

(declare-fun e!567498 () Bool)

(declare-fun lt!445433 () SeekEntryResult!9466)

(assert (=> b!1008126 (= e!567498 (bvsge (x!87790 lt!445433) #b01111111111111111111111111111110))))

(declare-fun b!1008127 () Bool)

(declare-fun e!567499 () Bool)

(assert (=> b!1008127 (= e!567498 e!567499)))

(declare-fun res!676424 () Bool)

(assert (=> b!1008127 (= res!676424 (and ((_ is Intermediate!9466) lt!445433) (not (undefined!10278 lt!445433)) (bvslt (x!87790 lt!445433) #b01111111111111111111111111111110) (bvsge (x!87790 lt!445433) #b00000000000000000000000000000000) (bvsge (x!87790 lt!445433) x!1245)))))

(assert (=> b!1008127 (=> (not res!676424) (not e!567499))))

(declare-fun b!1008128 () Bool)

(assert (=> b!1008128 (and (bvsge (index!40237 lt!445433) #b00000000000000000000000000000000) (bvslt (index!40237 lt!445433) (size!31101 a!3219)))))

(declare-fun e!567496 () Bool)

(assert (=> b!1008128 (= e!567496 (= (select (arr!30598 a!3219) (index!40237 lt!445433)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1008129 () Bool)

(assert (=> b!1008129 (and (bvsge (index!40237 lt!445433) #b00000000000000000000000000000000) (bvslt (index!40237 lt!445433) (size!31101 a!3219)))))

(declare-fun res!676423 () Bool)

(assert (=> b!1008129 (= res!676423 (= (select (arr!30598 a!3219) (index!40237 lt!445433)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1008129 (=> res!676423 e!567496)))

(declare-fun b!1008131 () Bool)

(assert (=> b!1008131 (and (bvsge (index!40237 lt!445433) #b00000000000000000000000000000000) (bvslt (index!40237 lt!445433) (size!31101 a!3219)))))

(declare-fun res!676425 () Bool)

(assert (=> b!1008131 (= res!676425 (= (select (arr!30598 a!3219) (index!40237 lt!445433)) (select (arr!30598 a!3219) j!170)))))

(assert (=> b!1008131 (=> res!676425 e!567496)))

(assert (=> b!1008131 (= e!567499 e!567496)))

(declare-fun b!1008130 () Bool)

(declare-fun e!567497 () SeekEntryResult!9466)

(assert (=> b!1008130 (= e!567497 e!567495)))

(declare-fun lt!445432 () (_ BitVec 64))

(declare-fun c!102010 () Bool)

(assert (=> b!1008130 (= c!102010 (or (= lt!445432 (select (arr!30598 a!3219) j!170)) (= (bvadd lt!445432 lt!445432) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!120061 () Bool)

(assert (=> d!120061 e!567498))

(declare-fun c!102008 () Bool)

(assert (=> d!120061 (= c!102008 (and ((_ is Intermediate!9466) lt!445433) (undefined!10278 lt!445433)))))

(assert (=> d!120061 (= lt!445433 e!567497)))

(declare-fun c!102009 () Bool)

(assert (=> d!120061 (= c!102009 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!120061 (= lt!445432 (select (arr!30598 a!3219) index!1507))))

(assert (=> d!120061 (validMask!0 mask!3464)))

(assert (=> d!120061 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30598 a!3219) j!170) a!3219 mask!3464) lt!445433)))

(declare-fun b!1008132 () Bool)

(assert (=> b!1008132 (= e!567495 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (select (arr!30598 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008133 () Bool)

(assert (=> b!1008133 (= e!567497 (Intermediate!9466 true index!1507 x!1245))))

(assert (= (and d!120061 c!102009) b!1008133))

(assert (= (and d!120061 (not c!102009)) b!1008130))

(assert (= (and b!1008130 c!102010) b!1008125))

(assert (= (and b!1008130 (not c!102010)) b!1008132))

(assert (= (and d!120061 c!102008) b!1008126))

(assert (= (and d!120061 (not c!102008)) b!1008127))

(assert (= (and b!1008127 res!676424) b!1008131))

(assert (= (and b!1008131 (not res!676425)) b!1008129))

(assert (= (and b!1008129 (not res!676423)) b!1008128))

(declare-fun m!933461 () Bool)

(assert (=> b!1008132 m!933461))

(assert (=> b!1008132 m!933461))

(assert (=> b!1008132 m!933335))

(declare-fun m!933463 () Bool)

(assert (=> b!1008132 m!933463))

(declare-fun m!933465 () Bool)

(assert (=> b!1008128 m!933465))

(assert (=> b!1008129 m!933465))

(declare-fun m!933467 () Bool)

(assert (=> d!120061 m!933467))

(assert (=> d!120061 m!933345))

(assert (=> b!1008131 m!933465))

(assert (=> b!1007988 d!120061))

(declare-fun d!120063 () Bool)

(assert (=> d!120063 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!87046 d!120063))

(declare-fun d!120065 () Bool)

(assert (=> d!120065 (= (array_inv!23734 a!3219) (bvsge (size!31101 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!87046 d!120065))

(declare-fun b!1008196 () Bool)

(declare-fun e!567537 () Bool)

(declare-fun e!567536 () Bool)

(assert (=> b!1008196 (= e!567537 e!567536)))

(declare-fun lt!445459 () (_ BitVec 64))

(assert (=> b!1008196 (= lt!445459 (select (arr!30598 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32997 0))(
  ( (Unit!32998) )
))
(declare-fun lt!445457 () Unit!32997)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63564 (_ BitVec 64) (_ BitVec 32)) Unit!32997)

(assert (=> b!1008196 (= lt!445457 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!445459 #b00000000000000000000000000000000))))

(assert (=> b!1008196 (arrayContainsKey!0 a!3219 lt!445459 #b00000000000000000000000000000000)))

(declare-fun lt!445458 () Unit!32997)

(assert (=> b!1008196 (= lt!445458 lt!445457)))

(declare-fun res!676444 () Bool)

(assert (=> b!1008196 (= res!676444 (= (seekEntryOrOpen!0 (select (arr!30598 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9466 #b00000000000000000000000000000000)))))

(assert (=> b!1008196 (=> (not res!676444) (not e!567536))))

(declare-fun b!1008197 () Bool)

(declare-fun call!42418 () Bool)

(assert (=> b!1008197 (= e!567537 call!42418)))

(declare-fun d!120067 () Bool)

(declare-fun res!676443 () Bool)

(declare-fun e!567535 () Bool)

(assert (=> d!120067 (=> res!676443 e!567535)))

(assert (=> d!120067 (= res!676443 (bvsge #b00000000000000000000000000000000 (size!31101 a!3219)))))

(assert (=> d!120067 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!567535)))

(declare-fun b!1008198 () Bool)

(assert (=> b!1008198 (= e!567535 e!567537)))

(declare-fun c!102034 () Bool)

(assert (=> b!1008198 (= c!102034 (validKeyInArray!0 (select (arr!30598 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42415 () Bool)

(assert (=> bm!42415 (= call!42418 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1008199 () Bool)

(assert (=> b!1008199 (= e!567536 call!42418)))

(assert (= (and d!120067 (not res!676443)) b!1008198))

(assert (= (and b!1008198 c!102034) b!1008196))

(assert (= (and b!1008198 (not c!102034)) b!1008197))

(assert (= (and b!1008196 res!676444) b!1008199))

(assert (= (or b!1008199 b!1008197) bm!42415))

(assert (=> b!1008196 m!933453))

(declare-fun m!933499 () Bool)

(assert (=> b!1008196 m!933499))

(declare-fun m!933501 () Bool)

(assert (=> b!1008196 m!933501))

(assert (=> b!1008196 m!933453))

(declare-fun m!933503 () Bool)

(assert (=> b!1008196 m!933503))

(assert (=> b!1008198 m!933453))

(assert (=> b!1008198 m!933453))

(assert (=> b!1008198 m!933459))

(declare-fun m!933505 () Bool)

(assert (=> bm!42415 m!933505))

(assert (=> b!1007989 d!120067))

(declare-fun b!1008275 () Bool)

(declare-fun e!567585 () SeekEntryResult!9466)

(declare-fun lt!445489 () SeekEntryResult!9466)

(assert (=> b!1008275 (= e!567585 (MissingZero!9466 (index!40237 lt!445489)))))

(declare-fun b!1008276 () Bool)

(declare-fun e!567587 () SeekEntryResult!9466)

(assert (=> b!1008276 (= e!567587 (Found!9466 (index!40237 lt!445489)))))

(declare-fun b!1008278 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63564 (_ BitVec 32)) SeekEntryResult!9466)

(assert (=> b!1008278 (= e!567585 (seekKeyOrZeroReturnVacant!0 (x!87790 lt!445489) (index!40237 lt!445489) (index!40237 lt!445489) k0!2224 a!3219 mask!3464))))

(declare-fun b!1008279 () Bool)

(declare-fun e!567586 () SeekEntryResult!9466)

(assert (=> b!1008279 (= e!567586 Undefined!9466)))

(declare-fun b!1008280 () Bool)

(declare-fun c!102060 () Bool)

(declare-fun lt!445490 () (_ BitVec 64))

(assert (=> b!1008280 (= c!102060 (= lt!445490 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1008280 (= e!567587 e!567585)))

(declare-fun b!1008277 () Bool)

(assert (=> b!1008277 (= e!567586 e!567587)))

(assert (=> b!1008277 (= lt!445490 (select (arr!30598 a!3219) (index!40237 lt!445489)))))

(declare-fun c!102061 () Bool)

(assert (=> b!1008277 (= c!102061 (= lt!445490 k0!2224))))

(declare-fun d!120075 () Bool)

(declare-fun lt!445491 () SeekEntryResult!9466)

(assert (=> d!120075 (and (or ((_ is Undefined!9466) lt!445491) (not ((_ is Found!9466) lt!445491)) (and (bvsge (index!40236 lt!445491) #b00000000000000000000000000000000) (bvslt (index!40236 lt!445491) (size!31101 a!3219)))) (or ((_ is Undefined!9466) lt!445491) ((_ is Found!9466) lt!445491) (not ((_ is MissingZero!9466) lt!445491)) (and (bvsge (index!40235 lt!445491) #b00000000000000000000000000000000) (bvslt (index!40235 lt!445491) (size!31101 a!3219)))) (or ((_ is Undefined!9466) lt!445491) ((_ is Found!9466) lt!445491) ((_ is MissingZero!9466) lt!445491) (not ((_ is MissingVacant!9466) lt!445491)) (and (bvsge (index!40238 lt!445491) #b00000000000000000000000000000000) (bvslt (index!40238 lt!445491) (size!31101 a!3219)))) (or ((_ is Undefined!9466) lt!445491) (ite ((_ is Found!9466) lt!445491) (= (select (arr!30598 a!3219) (index!40236 lt!445491)) k0!2224) (ite ((_ is MissingZero!9466) lt!445491) (= (select (arr!30598 a!3219) (index!40235 lt!445491)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9466) lt!445491) (= (select (arr!30598 a!3219) (index!40238 lt!445491)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!120075 (= lt!445491 e!567586)))

(declare-fun c!102059 () Bool)

(assert (=> d!120075 (= c!102059 (and ((_ is Intermediate!9466) lt!445489) (undefined!10278 lt!445489)))))

(assert (=> d!120075 (= lt!445489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!120075 (validMask!0 mask!3464)))

(assert (=> d!120075 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!445491)))

(assert (= (and d!120075 c!102059) b!1008279))

(assert (= (and d!120075 (not c!102059)) b!1008277))

(assert (= (and b!1008277 c!102061) b!1008276))

(assert (= (and b!1008277 (not c!102061)) b!1008280))

(assert (= (and b!1008280 c!102060) b!1008275))

(assert (= (and b!1008280 (not c!102060)) b!1008278))

(declare-fun m!933539 () Bool)

(assert (=> b!1008278 m!933539))

(declare-fun m!933541 () Bool)

(assert (=> b!1008277 m!933541))

(declare-fun m!933543 () Bool)

(assert (=> d!120075 m!933543))

(declare-fun m!933545 () Bool)

(assert (=> d!120075 m!933545))

(declare-fun m!933547 () Bool)

(assert (=> d!120075 m!933547))

(declare-fun m!933549 () Bool)

(assert (=> d!120075 m!933549))

(assert (=> d!120075 m!933345))

(declare-fun m!933551 () Bool)

(assert (=> d!120075 m!933551))

(assert (=> d!120075 m!933545))

(assert (=> b!1007990 d!120075))

(declare-fun d!120087 () Bool)

(declare-fun res!676477 () Bool)

(declare-fun e!567592 () Bool)

(assert (=> d!120087 (=> res!676477 e!567592)))

(assert (=> d!120087 (= res!676477 (= (select (arr!30598 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!120087 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!567592)))

(declare-fun b!1008285 () Bool)

(declare-fun e!567593 () Bool)

(assert (=> b!1008285 (= e!567592 e!567593)))

(declare-fun res!676478 () Bool)

(assert (=> b!1008285 (=> (not res!676478) (not e!567593))))

(assert (=> b!1008285 (= res!676478 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31101 a!3219)))))

(declare-fun b!1008286 () Bool)

(assert (=> b!1008286 (= e!567593 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!120087 (not res!676477)) b!1008285))

(assert (= (and b!1008285 res!676478) b!1008286))

(assert (=> d!120087 m!933453))

(declare-fun m!933553 () Bool)

(assert (=> b!1008286 m!933553))

(assert (=> b!1007991 d!120087))

(declare-fun b!1008287 () Bool)

(declare-fun e!567594 () SeekEntryResult!9466)

(assert (=> b!1008287 (= e!567594 (Intermediate!9466 false index!1507 x!1245))))

(declare-fun b!1008288 () Bool)

(declare-fun e!567597 () Bool)

(declare-fun lt!445499 () SeekEntryResult!9466)

(assert (=> b!1008288 (= e!567597 (bvsge (x!87790 lt!445499) #b01111111111111111111111111111110))))

(declare-fun b!1008289 () Bool)

(declare-fun e!567598 () Bool)

(assert (=> b!1008289 (= e!567597 e!567598)))

(declare-fun res!676480 () Bool)

(assert (=> b!1008289 (= res!676480 (and ((_ is Intermediate!9466) lt!445499) (not (undefined!10278 lt!445499)) (bvslt (x!87790 lt!445499) #b01111111111111111111111111111110) (bvsge (x!87790 lt!445499) #b00000000000000000000000000000000) (bvsge (x!87790 lt!445499) x!1245)))))

(assert (=> b!1008289 (=> (not res!676480) (not e!567598))))

(declare-fun b!1008290 () Bool)

(assert (=> b!1008290 (and (bvsge (index!40237 lt!445499) #b00000000000000000000000000000000) (bvslt (index!40237 lt!445499) (size!31101 lt!445375)))))

(declare-fun e!567595 () Bool)

(assert (=> b!1008290 (= e!567595 (= (select (arr!30598 lt!445375) (index!40237 lt!445499)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1008291 () Bool)

(assert (=> b!1008291 (and (bvsge (index!40237 lt!445499) #b00000000000000000000000000000000) (bvslt (index!40237 lt!445499) (size!31101 lt!445375)))))

(declare-fun res!676479 () Bool)

(assert (=> b!1008291 (= res!676479 (= (select (arr!30598 lt!445375) (index!40237 lt!445499)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1008291 (=> res!676479 e!567595)))

(declare-fun b!1008293 () Bool)

(assert (=> b!1008293 (and (bvsge (index!40237 lt!445499) #b00000000000000000000000000000000) (bvslt (index!40237 lt!445499) (size!31101 lt!445375)))))

(declare-fun res!676481 () Bool)

(assert (=> b!1008293 (= res!676481 (= (select (arr!30598 lt!445375) (index!40237 lt!445499)) lt!445374))))

(assert (=> b!1008293 (=> res!676481 e!567595)))

(assert (=> b!1008293 (= e!567598 e!567595)))

(declare-fun b!1008292 () Bool)

(declare-fun e!567596 () SeekEntryResult!9466)

(assert (=> b!1008292 (= e!567596 e!567594)))

(declare-fun c!102064 () Bool)

(declare-fun lt!445498 () (_ BitVec 64))

(assert (=> b!1008292 (= c!102064 (or (= lt!445498 lt!445374) (= (bvadd lt!445498 lt!445498) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!120091 () Bool)

(assert (=> d!120091 e!567597))

(declare-fun c!102062 () Bool)

(assert (=> d!120091 (= c!102062 (and ((_ is Intermediate!9466) lt!445499) (undefined!10278 lt!445499)))))

(assert (=> d!120091 (= lt!445499 e!567596)))

(declare-fun c!102063 () Bool)

(assert (=> d!120091 (= c!102063 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!120091 (= lt!445498 (select (arr!30598 lt!445375) index!1507))))

(assert (=> d!120091 (validMask!0 mask!3464)))

(assert (=> d!120091 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445374 lt!445375 mask!3464) lt!445499)))

(declare-fun b!1008294 () Bool)

(assert (=> b!1008294 (= e!567594 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) lt!445374 lt!445375 mask!3464))))

(declare-fun b!1008295 () Bool)

(assert (=> b!1008295 (= e!567596 (Intermediate!9466 true index!1507 x!1245))))

(assert (= (and d!120091 c!102063) b!1008295))

(assert (= (and d!120091 (not c!102063)) b!1008292))

(assert (= (and b!1008292 c!102064) b!1008287))

(assert (= (and b!1008292 (not c!102064)) b!1008294))

(assert (= (and d!120091 c!102062) b!1008288))

(assert (= (and d!120091 (not c!102062)) b!1008289))

(assert (= (and b!1008289 res!676480) b!1008293))

(assert (= (and b!1008293 (not res!676481)) b!1008291))

(assert (= (and b!1008291 (not res!676479)) b!1008290))

(assert (=> b!1008294 m!933461))

(assert (=> b!1008294 m!933461))

(declare-fun m!933555 () Bool)

(assert (=> b!1008294 m!933555))

(declare-fun m!933557 () Bool)

(assert (=> b!1008290 m!933557))

(assert (=> b!1008291 m!933557))

(declare-fun m!933559 () Bool)

(assert (=> d!120091 m!933559))

(assert (=> d!120091 m!933345))

(assert (=> b!1008293 m!933557))

(assert (=> b!1007992 d!120091))

(check-sat (not b!1008108) (not b!1008278) (not b!1008120) (not b!1008198) (not b!1008286) (not bm!42412) (not d!120043) (not b!1008124) (not b!1008132) (not d!120061) (not d!120091) (not b!1008122) (not bm!42415) (not b!1008196) (not b!1008099) (not d!120075) (not d!120051) (not b!1008294))
(check-sat)
