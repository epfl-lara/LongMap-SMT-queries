; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33082 () Bool)

(assert start!33082)

(declare-fun b!329282 () Bool)

(declare-fun e!202297 () Bool)

(declare-fun e!202295 () Bool)

(assert (=> b!329282 (= e!202297 e!202295)))

(declare-fun res!181470 () Bool)

(assert (=> b!329282 (=> (not res!181470) (not e!202295))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3098 0))(
  ( (MissingZero!3098 (index!14568 (_ BitVec 32))) (Found!3098 (index!14569 (_ BitVec 32))) (Intermediate!3098 (undefined!3910 Bool) (index!14570 (_ BitVec 32)) (x!32839 (_ BitVec 32))) (Undefined!3098) (MissingVacant!3098 (index!14571 (_ BitVec 32))) )
))
(declare-fun lt!158172 () SeekEntryResult!3098)

(declare-datatypes ((array!16843 0))(
  ( (array!16844 (arr!7967 (Array (_ BitVec 32) (_ BitVec 64))) (size!8319 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16843)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16843 (_ BitVec 32)) SeekEntryResult!3098)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329282 (= res!181470 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158172))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!329282 (= lt!158172 (Intermediate!3098 false resIndex!58 resX!58))))

(declare-fun b!329283 () Bool)

(declare-fun res!181475 () Bool)

(assert (=> b!329283 (=> (not res!181475) (not e!202297))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16843 (_ BitVec 32)) SeekEntryResult!3098)

(assert (=> b!329283 (= res!181475 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3098 i!1250)))))

(declare-fun b!329284 () Bool)

(declare-fun res!181469 () Bool)

(assert (=> b!329284 (=> (not res!181469) (not e!202297))))

(declare-fun arrayContainsKey!0 (array!16843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329284 (= res!181469 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!329285 () Bool)

(declare-fun res!181472 () Bool)

(assert (=> b!329285 (=> (not res!181472) (not e!202297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329285 (= res!181472 (validKeyInArray!0 k!2497))))

(declare-fun b!329286 () Bool)

(declare-fun res!181473 () Bool)

(assert (=> b!329286 (=> (not res!181473) (not e!202295))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!329286 (= res!181473 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158172))))

(declare-fun res!181476 () Bool)

(assert (=> start!33082 (=> (not res!181476) (not e!202297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33082 (= res!181476 (validMask!0 mask!3777))))

(assert (=> start!33082 e!202297))

(declare-fun array_inv!5930 (array!16843) Bool)

(assert (=> start!33082 (array_inv!5930 a!3305)))

(assert (=> start!33082 true))

(declare-fun b!329287 () Bool)

(declare-fun res!181471 () Bool)

(assert (=> b!329287 (=> (not res!181471) (not e!202295))))

(assert (=> b!329287 (= res!181471 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7967 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7967 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7967 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!329288 () Bool)

(declare-fun res!181468 () Bool)

(assert (=> b!329288 (=> (not res!181468) (not e!202297))))

(assert (=> b!329288 (= res!181468 (and (= (size!8319 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8319 a!3305))))))

(declare-fun b!329289 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329289 (= e!202295 (not (is-Intermediate!3098 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))))

(declare-fun b!329290 () Bool)

(declare-fun res!181474 () Bool)

(assert (=> b!329290 (=> (not res!181474) (not e!202295))))

(assert (=> b!329290 (= res!181474 (and (= (select (arr!7967 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8319 a!3305))))))

(declare-fun b!329291 () Bool)

(declare-fun res!181467 () Bool)

(assert (=> b!329291 (=> (not res!181467) (not e!202297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16843 (_ BitVec 32)) Bool)

(assert (=> b!329291 (= res!181467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!33082 res!181476) b!329288))

(assert (= (and b!329288 res!181468) b!329285))

(assert (= (and b!329285 res!181472) b!329284))

(assert (= (and b!329284 res!181469) b!329283))

(assert (= (and b!329283 res!181475) b!329291))

(assert (= (and b!329291 res!181467) b!329282))

(assert (= (and b!329282 res!181470) b!329290))

(assert (= (and b!329290 res!181474) b!329286))

(assert (= (and b!329286 res!181473) b!329287))

(assert (= (and b!329287 res!181471) b!329289))

(declare-fun m!334991 () Bool)

(assert (=> b!329290 m!334991))

(declare-fun m!334993 () Bool)

(assert (=> b!329286 m!334993))

(declare-fun m!334995 () Bool)

(assert (=> start!33082 m!334995))

(declare-fun m!334997 () Bool)

(assert (=> start!33082 m!334997))

(declare-fun m!334999 () Bool)

(assert (=> b!329283 m!334999))

(declare-fun m!335001 () Bool)

(assert (=> b!329285 m!335001))

(declare-fun m!335003 () Bool)

(assert (=> b!329282 m!335003))

(assert (=> b!329282 m!335003))

(declare-fun m!335005 () Bool)

(assert (=> b!329282 m!335005))

(declare-fun m!335007 () Bool)

(assert (=> b!329291 m!335007))

(declare-fun m!335009 () Bool)

(assert (=> b!329284 m!335009))

(declare-fun m!335011 () Bool)

(assert (=> b!329289 m!335011))

(assert (=> b!329289 m!335011))

(declare-fun m!335013 () Bool)

(assert (=> b!329289 m!335013))

(declare-fun m!335015 () Bool)

(assert (=> b!329287 m!335015))

(push 1)

(assert (not b!329286))

(assert (not b!329282))

(assert (not b!329283))

(assert (not b!329285))

(assert (not b!329289))

(assert (not b!329284))

(assert (not b!329291))

(assert (not start!33082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!329412 () Bool)

(declare-fun e!202353 () SeekEntryResult!3098)

(assert (=> b!329412 (= e!202353 (Intermediate!3098 true (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun e!202354 () SeekEntryResult!3098)

(declare-fun b!329413 () Bool)

(assert (=> b!329413 (= e!202354 (Intermediate!3098 false (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!329414 () Bool)

(assert (=> b!329414 (= e!202354 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!329415 () Bool)

(declare-fun lt!158196 () SeekEntryResult!3098)

(assert (=> b!329415 (and (bvsge (index!14570 lt!158196) #b00000000000000000000000000000000) (bvslt (index!14570 lt!158196) (size!8319 a!3305)))))

(declare-fun res!181557 () Bool)

(assert (=> b!329415 (= res!181557 (= (select (arr!7967 a!3305) (index!14570 lt!158196)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202352 () Bool)

(assert (=> b!329415 (=> res!181557 e!202352)))

(declare-fun b!329416 () Bool)

(declare-fun e!202351 () Bool)

(assert (=> b!329416 (= e!202351 (bvsge (x!32839 lt!158196) #b01111111111111111111111111111110))))

(declare-fun b!329417 () Bool)

(assert (=> b!329417 (= e!202353 e!202354)))

(declare-fun c!51570 () Bool)

(declare-fun lt!158197 () (_ BitVec 64))

(assert (=> b!329417 (= c!51570 (or (= lt!158197 k!2497) (= (bvadd lt!158197 lt!158197) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!70153 () Bool)

(assert (=> d!70153 e!202351))

(declare-fun c!51569 () Bool)

(assert (=> d!70153 (= c!51569 (and (is-Intermediate!3098 lt!158196) (undefined!3910 lt!158196)))))

(assert (=> d!70153 (= lt!158196 e!202353)))

(declare-fun c!51568 () Bool)

(assert (=> d!70153 (= c!51568 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(assert (=> d!70153 (= lt!158197 (select (arr!7967 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)))))

(assert (=> d!70153 (validMask!0 mask!3777)))

(assert (=> d!70153 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777) lt!158196)))

(declare-fun b!329418 () Bool)

(declare-fun e!202355 () Bool)

(assert (=> b!329418 (= e!202351 e!202355)))

(declare-fun res!181555 () Bool)

(assert (=> b!329418 (= res!181555 (and (is-Intermediate!3098 lt!158196) (not (undefined!3910 lt!158196)) (bvslt (x!32839 lt!158196) #b01111111111111111111111111111110) (bvsge (x!32839 lt!158196) #b00000000000000000000000000000000) (bvsge (x!32839 lt!158196) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!329418 (=> (not res!181555) (not e!202355))))

(declare-fun b!329419 () Bool)

(assert (=> b!329419 (and (bvsge (index!14570 lt!158196) #b00000000000000000000000000000000) (bvslt (index!14570 lt!158196) (size!8319 a!3305)))))

(declare-fun res!181556 () Bool)

(assert (=> b!329419 (= res!181556 (= (select (arr!7967 a!3305) (index!14570 lt!158196)) k!2497))))

(assert (=> b!329419 (=> res!181556 e!202352)))

(assert (=> b!329419 (= e!202355 e!202352)))

(declare-fun b!329420 () Bool)

(assert (=> b!329420 (and (bvsge (index!14570 lt!158196) #b00000000000000000000000000000000) (bvslt (index!14570 lt!158196) (size!8319 a!3305)))))

(assert (=> b!329420 (= e!202352 (= (select (arr!7967 a!3305) (index!14570 lt!158196)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!70153 c!51568) b!329412))

(assert (= (and d!70153 (not c!51568)) b!329417))

(assert (= (and b!329417 c!51570) b!329413))

(assert (= (and b!329417 (not c!51570)) b!329414))

(assert (= (and d!70153 c!51569) b!329416))

(assert (= (and d!70153 (not c!51569)) b!329418))

(assert (= (and b!329418 res!181555) b!329419))

(assert (= (and b!329419 (not res!181556)) b!329415))

(assert (= (and b!329415 (not res!181557)) b!329420))

(declare-fun m!335083 () Bool)

(assert (=> b!329415 m!335083))

(assert (=> b!329420 m!335083))

(assert (=> d!70153 m!335011))

(declare-fun m!335085 () Bool)

(assert (=> d!70153 m!335085))

(assert (=> d!70153 m!334995))

(assert (=> b!329419 m!335083))

(assert (=> b!329414 m!335011))

(declare-fun m!335087 () Bool)

(assert (=> b!329414 m!335087))

(assert (=> b!329414 m!335087))

(declare-fun m!335089 () Bool)

(assert (=> b!329414 m!335089))

(assert (=> b!329289 d!70153))

(declare-fun d!70165 () Bool)

(declare-fun lt!158206 () (_ BitVec 32))

(assert (=> d!70165 (and (bvsge lt!158206 #b00000000000000000000000000000000) (bvslt lt!158206 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70165 (= lt!158206 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!70165 (validMask!0 mask!3777)))

(assert (=> d!70165 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!158206)))

(declare-fun bs!11408 () Bool)

(assert (= bs!11408 d!70165))

(declare-fun m!335099 () Bool)

(assert (=> bs!11408 m!335099))

(assert (=> bs!11408 m!334995))

(assert (=> b!329289 d!70165))

(declare-fun d!70169 () Bool)

(declare-fun res!181574 () Bool)

(declare-fun e!202380 () Bool)

(assert (=> d!70169 (=> res!181574 e!202380)))

(assert (=> d!70169 (= res!181574 (= (select (arr!7967 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!70169 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!202380)))

(declare-fun b!329461 () Bool)

(declare-fun e!202381 () Bool)

(assert (=> b!329461 (= e!202380 e!202381)))

(declare-fun res!181575 () Bool)

(assert (=> b!329461 (=> (not res!181575) (not e!202381))))

(assert (=> b!329461 (= res!181575 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8319 a!3305)))))

(declare-fun b!329462 () Bool)

(assert (=> b!329462 (= e!202381 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70169 (not res!181574)) b!329461))

(assert (= (and b!329461 res!181575) b!329462))

(declare-fun m!335107 () Bool)

(assert (=> d!70169 m!335107))

(declare-fun m!335109 () Bool)

(assert (=> b!329462 m!335109))

(assert (=> b!329284 d!70169))

(declare-fun d!70175 () Bool)

(assert (=> d!70175 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33082 d!70175))

(declare-fun d!70191 () Bool)

(assert (=> d!70191 (= (array_inv!5930 a!3305) (bvsge (size!8319 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33082 d!70191))

(declare-fun b!329555 () Bool)

(declare-fun e!202440 () SeekEntryResult!3098)

(declare-fun lt!158266 () SeekEntryResult!3098)

(assert (=> b!329555 (= e!202440 (MissingZero!3098 (index!14570 lt!158266)))))

(declare-fun b!329556 () Bool)

(declare-fun e!202439 () SeekEntryResult!3098)

(assert (=> b!329556 (= e!202439 Undefined!3098)))

(declare-fun d!70193 () Bool)

(declare-fun lt!158267 () SeekEntryResult!3098)

(assert (=> d!70193 (and (or (is-Undefined!3098 lt!158267) (not (is-Found!3098 lt!158267)) (and (bvsge (index!14569 lt!158267) #b00000000000000000000000000000000) (bvslt (index!14569 lt!158267) (size!8319 a!3305)))) (or (is-Undefined!3098 lt!158267) (is-Found!3098 lt!158267) (not (is-MissingZero!3098 lt!158267)) (and (bvsge (index!14568 lt!158267) #b00000000000000000000000000000000) (bvslt (index!14568 lt!158267) (size!8319 a!3305)))) (or (is-Undefined!3098 lt!158267) (is-Found!3098 lt!158267) (is-MissingZero!3098 lt!158267) (not (is-MissingVacant!3098 lt!158267)) (and (bvsge (index!14571 lt!158267) #b00000000000000000000000000000000) (bvslt (index!14571 lt!158267) (size!8319 a!3305)))) (or (is-Undefined!3098 lt!158267) (ite (is-Found!3098 lt!158267) (= (select (arr!7967 a!3305) (index!14569 lt!158267)) k!2497) (ite (is-MissingZero!3098 lt!158267) (= (select (arr!7967 a!3305) (index!14568 lt!158267)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3098 lt!158267) (= (select (arr!7967 a!3305) (index!14571 lt!158267)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70193 (= lt!158267 e!202439)))

(declare-fun c!51617 () Bool)

(assert (=> d!70193 (= c!51617 (and (is-Intermediate!3098 lt!158266) (undefined!3910 lt!158266)))))

(assert (=> d!70193 (= lt!158266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!70193 (validMask!0 mask!3777)))

(assert (=> d!70193 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!158267)))

(declare-fun b!329557 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16843 (_ BitVec 32)) SeekEntryResult!3098)

(assert (=> b!329557 (= e!202440 (seekKeyOrZeroReturnVacant!0 (x!32839 lt!158266) (index!14570 lt!158266) (index!14570 lt!158266) k!2497 a!3305 mask!3777))))

(declare-fun b!329558 () Bool)

(declare-fun e!202438 () SeekEntryResult!3098)

(assert (=> b!329558 (= e!202438 (Found!3098 (index!14570 lt!158266)))))

(declare-fun b!329559 () Bool)

(declare-fun c!51615 () Bool)

(declare-fun lt!158265 () (_ BitVec 64))

(assert (=> b!329559 (= c!51615 (= lt!158265 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329559 (= e!202438 e!202440)))

(declare-fun b!329560 () Bool)

(assert (=> b!329560 (= e!202439 e!202438)))

(assert (=> b!329560 (= lt!158265 (select (arr!7967 a!3305) (index!14570 lt!158266)))))

(declare-fun c!51616 () Bool)

(assert (=> b!329560 (= c!51616 (= lt!158265 k!2497))))

(assert (= (and d!70193 c!51617) b!329556))

(assert (= (and d!70193 (not c!51617)) b!329560))

(assert (= (and b!329560 c!51616) b!329558))

(assert (= (and b!329560 (not c!51616)) b!329559))

(assert (= (and b!329559 c!51615) b!329555))

(assert (= (and b!329559 (not c!51615)) b!329557))

(assert (=> d!70193 m!335003))

(assert (=> d!70193 m!335005))

(declare-fun m!335165 () Bool)

(assert (=> d!70193 m!335165))

(declare-fun m!335167 () Bool)

(assert (=> d!70193 m!335167))

(assert (=> d!70193 m!335003))

(declare-fun m!335169 () Bool)

(assert (=> d!70193 m!335169))

(assert (=> d!70193 m!334995))

(declare-fun m!335171 () Bool)

(assert (=> b!329557 m!335171))

(declare-fun m!335173 () Bool)

(assert (=> b!329560 m!335173))

(assert (=> b!329283 d!70193))

(declare-fun b!329561 () Bool)

(declare-fun e!202443 () SeekEntryResult!3098)

(assert (=> b!329561 (= e!202443 (Intermediate!3098 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329562 () Bool)

(declare-fun e!202444 () SeekEntryResult!3098)

(assert (=> b!329562 (= e!202444 (Intermediate!3098 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329563 () Bool)

(assert (=> b!329563 (= e!202444 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!329564 () Bool)

(declare-fun lt!158268 () SeekEntryResult!3098)

(assert (=> b!329564 (and (bvsge (index!14570 lt!158268) #b00000000000000000000000000000000) (bvslt (index!14570 lt!158268) (size!8319 a!3305)))))

(declare-fun res!181608 () Bool)

(assert (=> b!329564 (= res!181608 (= (select (arr!7967 a!3305) (index!14570 lt!158268)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202442 () Bool)

(assert (=> b!329564 (=> res!181608 e!202442)))

(declare-fun b!329565 () Bool)

(declare-fun e!202441 () Bool)

(assert (=> b!329565 (= e!202441 (bvsge (x!32839 lt!158268) #b01111111111111111111111111111110))))

(declare-fun b!329566 () Bool)

(assert (=> b!329566 (= e!202443 e!202444)))

(declare-fun c!51620 () Bool)

(declare-fun lt!158269 () (_ BitVec 64))

(assert (=> b!329566 (= c!51620 (or (= lt!158269 k!2497) (= (bvadd lt!158269 lt!158269) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!70207 () Bool)

(assert (=> d!70207 e!202441))

(declare-fun c!51619 () Bool)

(assert (=> d!70207 (= c!51619 (and (is-Intermediate!3098 lt!158268) (undefined!3910 lt!158268)))))

(assert (=> d!70207 (= lt!158268 e!202443)))

(declare-fun c!51618 () Bool)

(assert (=> d!70207 (= c!51618 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!70207 (= lt!158269 (select (arr!7967 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!70207 (validMask!0 mask!3777)))

(assert (=> d!70207 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158268)))

(declare-fun b!329567 () Bool)

(declare-fun e!202445 () Bool)

(assert (=> b!329567 (= e!202441 e!202445)))

(declare-fun res!181606 () Bool)

(assert (=> b!329567 (= res!181606 (and (is-Intermediate!3098 lt!158268) (not (undefined!3910 lt!158268)) (bvslt (x!32839 lt!158268) #b01111111111111111111111111111110) (bvsge (x!32839 lt!158268) #b00000000000000000000000000000000) (bvsge (x!32839 lt!158268) #b00000000000000000000000000000000)))))

(assert (=> b!329567 (=> (not res!181606) (not e!202445))))

(declare-fun b!329568 () Bool)

(assert (=> b!329568 (and (bvsge (index!14570 lt!158268) #b00000000000000000000000000000000) (bvslt (index!14570 lt!158268) (size!8319 a!3305)))))

(declare-fun res!181607 () Bool)

(assert (=> b!329568 (= res!181607 (= (select (arr!7967 a!3305) (index!14570 lt!158268)) k!2497))))

(assert (=> b!329568 (=> res!181607 e!202442)))

(assert (=> b!329568 (= e!202445 e!202442)))

(declare-fun b!329569 () Bool)

(assert (=> b!329569 (and (bvsge (index!14570 lt!158268) #b00000000000000000000000000000000) (bvslt (index!14570 lt!158268) (size!8319 a!3305)))))

(assert (=> b!329569 (= e!202442 (= (select (arr!7967 a!3305) (index!14570 lt!158268)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!70207 c!51618) b!329561))

(assert (= (and d!70207 (not c!51618)) b!329566))

(assert (= (and b!329566 c!51620) b!329562))

(assert (= (and b!329566 (not c!51620)) b!329563))

(assert (= (and d!70207 c!51619) b!329565))

(assert (= (and d!70207 (not c!51619)) b!329567))

(assert (= (and b!329567 res!181606) b!329568))

(assert (= (and b!329568 (not res!181607)) b!329564))

(assert (= (and b!329564 (not res!181608)) b!329569))

(declare-fun m!335177 () Bool)

(assert (=> b!329564 m!335177))

(assert (=> b!329569 m!335177))

(assert (=> d!70207 m!335003))

(declare-fun m!335183 () Bool)

(assert (=> d!70207 m!335183))

(assert (=> d!70207 m!334995))

(assert (=> b!329568 m!335177))

(assert (=> b!329563 m!335003))

(declare-fun m!335189 () Bool)

(assert (=> b!329563 m!335189))

(assert (=> b!329563 m!335189))

(declare-fun m!335191 () Bool)

(assert (=> b!329563 m!335191))

(assert (=> b!329282 d!70207))

(declare-fun d!70209 () Bool)

(declare-fun lt!158278 () (_ BitVec 32))

(declare-fun lt!158277 () (_ BitVec 32))

(assert (=> d!70209 (= lt!158278 (bvmul (bvxor lt!158277 (bvlshr lt!158277 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70209 (= lt!158277 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70209 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!181611 (let ((h!5417 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32850 (bvmul (bvxor h!5417 (bvlshr h!5417 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32850 (bvlshr x!32850 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!181611 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!181611 #b00000000000000000000000000000000))))))

(assert (=> d!70209 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!158278 (bvlshr lt!158278 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!329282 d!70209))

(declare-fun d!70211 () Bool)

(assert (=> d!70211 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!329285 d!70211))

(declare-fun b!329582 () Bool)

(declare-fun e!202455 () Bool)

(declare-fun call!26152 () Bool)

(assert (=> b!329582 (= e!202455 call!26152)))

(declare-fun b!329583 () Bool)

(declare-fun e!202456 () Bool)

(declare-fun e!202457 () Bool)

(assert (=> b!329583 (= e!202456 e!202457)))

