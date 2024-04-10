; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48328 () Bool)

(assert start!48328)

(declare-fun b!531410 () Bool)

(declare-fun res!326979 () Bool)

(declare-fun e!309519 () Bool)

(assert (=> b!531410 (=> (not res!326979) (not e!309519))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531410 (= res!326979 (validKeyInArray!0 k!1998))))

(declare-fun b!531411 () Bool)

(declare-fun res!326981 () Bool)

(declare-fun e!309522 () Bool)

(assert (=> b!531411 (=> (not res!326981) (not e!309522))))

(declare-datatypes ((array!33681 0))(
  ( (array!33682 (arr!16184 (Array (_ BitVec 32) (_ BitVec 64))) (size!16548 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33681)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33681 (_ BitVec 32)) Bool)

(assert (=> b!531411 (= res!326981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531412 () Bool)

(declare-fun e!309521 () Bool)

(assert (=> b!531412 (= e!309522 e!309521)))

(declare-fun res!326972 () Bool)

(assert (=> b!531412 (=> res!326972 e!309521)))

(declare-datatypes ((List!10303 0))(
  ( (Nil!10300) (Cons!10299 (h!11239 (_ BitVec 64)) (t!16531 List!10303)) )
))
(declare-fun contains!2786 (List!10303 (_ BitVec 64)) Bool)

(assert (=> b!531412 (= res!326972 (contains!2786 Nil!10300 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!531413 () Bool)

(declare-fun res!326973 () Bool)

(assert (=> b!531413 (=> (not res!326973) (not e!309519))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!531413 (= res!326973 (validKeyInArray!0 (select (arr!16184 a!3154) j!147)))))

(declare-fun b!531414 () Bool)

(assert (=> b!531414 (= e!309519 e!309522)))

(declare-fun res!326978 () Bool)

(assert (=> b!531414 (=> (not res!326978) (not e!309522))))

(declare-datatypes ((SeekEntryResult!4642 0))(
  ( (MissingZero!4642 (index!20792 (_ BitVec 32))) (Found!4642 (index!20793 (_ BitVec 32))) (Intermediate!4642 (undefined!5454 Bool) (index!20794 (_ BitVec 32)) (x!49768 (_ BitVec 32))) (Undefined!4642) (MissingVacant!4642 (index!20795 (_ BitVec 32))) )
))
(declare-fun lt!244963 () SeekEntryResult!4642)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531414 (= res!326978 (or (= lt!244963 (MissingZero!4642 i!1153)) (= lt!244963 (MissingVacant!4642 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33681 (_ BitVec 32)) SeekEntryResult!4642)

(assert (=> b!531414 (= lt!244963 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!531415 () Bool)

(declare-fun res!326980 () Bool)

(assert (=> b!531415 (=> (not res!326980) (not e!309522))))

(assert (=> b!531415 (= res!326980 (and (bvsle #b00000000000000000000000000000000 (size!16548 a!3154)) (bvslt (size!16548 a!3154) #b01111111111111111111111111111111)))))

(declare-fun b!531416 () Bool)

(declare-fun res!326974 () Bool)

(assert (=> b!531416 (=> (not res!326974) (not e!309519))))

(declare-fun arrayContainsKey!0 (array!33681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531416 (= res!326974 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531417 () Bool)

(declare-fun res!326977 () Bool)

(assert (=> b!531417 (=> (not res!326977) (not e!309519))))

(assert (=> b!531417 (= res!326977 (and (= (size!16548 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16548 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16548 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!326975 () Bool)

(assert (=> start!48328 (=> (not res!326975) (not e!309519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48328 (= res!326975 (validMask!0 mask!3216))))

(assert (=> start!48328 e!309519))

(assert (=> start!48328 true))

(declare-fun array_inv!11980 (array!33681) Bool)

(assert (=> start!48328 (array_inv!11980 a!3154)))

(declare-fun b!531418 () Bool)

(declare-fun res!326976 () Bool)

(assert (=> b!531418 (=> (not res!326976) (not e!309522))))

(declare-fun noDuplicate!218 (List!10303) Bool)

(assert (=> b!531418 (= res!326976 (noDuplicate!218 Nil!10300))))

(declare-fun b!531419 () Bool)

(assert (=> b!531419 (= e!309521 (contains!2786 Nil!10300 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!48328 res!326975) b!531417))

(assert (= (and b!531417 res!326977) b!531413))

(assert (= (and b!531413 res!326973) b!531410))

(assert (= (and b!531410 res!326979) b!531416))

(assert (= (and b!531416 res!326974) b!531414))

(assert (= (and b!531414 res!326978) b!531411))

(assert (= (and b!531411 res!326981) b!531415))

(assert (= (and b!531415 res!326980) b!531418))

(assert (= (and b!531418 res!326976) b!531412))

(assert (= (and b!531412 (not res!326972)) b!531419))

(declare-fun m!511823 () Bool)

(assert (=> b!531416 m!511823))

(declare-fun m!511825 () Bool)

(assert (=> b!531411 m!511825))

(declare-fun m!511827 () Bool)

(assert (=> b!531410 m!511827))

(declare-fun m!511829 () Bool)

(assert (=> b!531414 m!511829))

(declare-fun m!511831 () Bool)

(assert (=> b!531419 m!511831))

(declare-fun m!511833 () Bool)

(assert (=> b!531412 m!511833))

(declare-fun m!511835 () Bool)

(assert (=> b!531413 m!511835))

(assert (=> b!531413 m!511835))

(declare-fun m!511837 () Bool)

(assert (=> b!531413 m!511837))

(declare-fun m!511839 () Bool)

(assert (=> b!531418 m!511839))

(declare-fun m!511841 () Bool)

(assert (=> start!48328 m!511841))

(declare-fun m!511843 () Bool)

(assert (=> start!48328 m!511843))

(push 1)

(assert (not b!531412))

(assert (not b!531418))

(assert (not b!531411))

(assert (not b!531410))

(assert (not start!48328))

(assert (not b!531414))

(assert (not b!531416))

(assert (not b!531413))

(assert (not b!531419))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81263 () Bool)

(assert (=> d!81263 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531410 d!81263))

(declare-fun b!531474 () Bool)

(declare-fun e!309554 () SeekEntryResult!4642)

(declare-fun e!309553 () SeekEntryResult!4642)

(assert (=> b!531474 (= e!309554 e!309553)))

(declare-fun lt!244990 () (_ BitVec 64))

(declare-fun lt!244989 () SeekEntryResult!4642)

(assert (=> b!531474 (= lt!244990 (select (arr!16184 a!3154) (index!20794 lt!244989)))))

(declare-fun c!62555 () Bool)

(assert (=> b!531474 (= c!62555 (= lt!244990 k!1998))))

(declare-fun b!531475 () Bool)

(declare-fun c!62554 () Bool)

(assert (=> b!531475 (= c!62554 (= lt!244990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!309555 () SeekEntryResult!4642)

(assert (=> b!531475 (= e!309553 e!309555)))

(declare-fun b!531476 () Bool)

(assert (=> b!531476 (= e!309554 Undefined!4642)))

(declare-fun b!531477 () Bool)

(assert (=> b!531477 (= e!309553 (Found!4642 (index!20794 lt!244989)))))

(declare-fun d!81265 () Bool)

(declare-fun lt!244988 () SeekEntryResult!4642)

(assert (=> d!81265 (and (or (is-Undefined!4642 lt!244988) (not (is-Found!4642 lt!244988)) (and (bvsge (index!20793 lt!244988) #b00000000000000000000000000000000) (bvslt (index!20793 lt!244988) (size!16548 a!3154)))) (or (is-Undefined!4642 lt!244988) (is-Found!4642 lt!244988) (not (is-MissingZero!4642 lt!244988)) (and (bvsge (index!20792 lt!244988) #b00000000000000000000000000000000) (bvslt (index!20792 lt!244988) (size!16548 a!3154)))) (or (is-Undefined!4642 lt!244988) (is-Found!4642 lt!244988) (is-MissingZero!4642 lt!244988) (not (is-MissingVacant!4642 lt!244988)) (and (bvsge (index!20795 lt!244988) #b00000000000000000000000000000000) (bvslt (index!20795 lt!244988) (size!16548 a!3154)))) (or (is-Undefined!4642 lt!244988) (ite (is-Found!4642 lt!244988) (= (select (arr!16184 a!3154) (index!20793 lt!244988)) k!1998) (ite (is-MissingZero!4642 lt!244988) (= (select (arr!16184 a!3154) (index!20792 lt!244988)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4642 lt!244988) (= (select (arr!16184 a!3154) (index!20795 lt!244988)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81265 (= lt!244988 e!309554)))

(declare-fun c!62553 () Bool)

(assert (=> d!81265 (= c!62553 (and (is-Intermediate!4642 lt!244989) (undefined!5454 lt!244989)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33681 (_ BitVec 32)) SeekEntryResult!4642)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81265 (= lt!244989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81265 (validMask!0 mask!3216)))

(assert (=> d!81265 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!244988)))

(declare-fun b!531478 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33681 (_ BitVec 32)) SeekEntryResult!4642)

(assert (=> b!531478 (= e!309555 (seekKeyOrZeroReturnVacant!0 (x!49768 lt!244989) (index!20794 lt!244989) (index!20794 lt!244989) k!1998 a!3154 mask!3216))))

(declare-fun b!531479 () Bool)

(assert (=> b!531479 (= e!309555 (MissingZero!4642 (index!20794 lt!244989)))))

(assert (= (and d!81265 c!62553) b!531476))

(assert (= (and d!81265 (not c!62553)) b!531474))

(assert (= (and b!531474 c!62555) b!531477))

(assert (= (and b!531474 (not c!62555)) b!531475))

(assert (= (and b!531475 c!62554) b!531479))

(assert (= (and b!531475 (not c!62554)) b!531478))

(declare-fun m!511877 () Bool)

(assert (=> b!531474 m!511877))

(declare-fun m!511879 () Bool)

(assert (=> d!81265 m!511879))

(assert (=> d!81265 m!511841))

(declare-fun m!511881 () Bool)

(assert (=> d!81265 m!511881))

(declare-fun m!511883 () Bool)

(assert (=> d!81265 m!511883))

(declare-fun m!511885 () Bool)

(assert (=> d!81265 m!511885))

(assert (=> d!81265 m!511883))

(declare-fun m!511887 () Bool)

(assert (=> d!81265 m!511887))

(declare-fun m!511889 () Bool)

(assert (=> b!531478 m!511889))

(assert (=> b!531414 d!81265))

(declare-fun d!81277 () Bool)

(declare-fun lt!244996 () Bool)

(declare-fun content!223 (List!10303) (Set (_ BitVec 64)))

(assert (=> d!81277 (= lt!244996 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!223 Nil!10300)))))

(declare-fun e!309566 () Bool)

(assert (=> d!81277 (= lt!244996 e!309566)))

(declare-fun res!326999 () Bool)

(assert (=> d!81277 (=> (not res!326999) (not e!309566))))

(assert (=> d!81277 (= res!326999 (is-Cons!10299 Nil!10300))))

(assert (=> d!81277 (= (contains!2786 Nil!10300 #b1000000000000000000000000000000000000000000000000000000000000000) lt!244996)))

(declare-fun b!531490 () Bool)

(declare-fun e!309567 () Bool)

(assert (=> b!531490 (= e!309566 e!309567)))

(declare-fun res!326998 () Bool)

(assert (=> b!531490 (=> res!326998 e!309567)))

(assert (=> b!531490 (= res!326998 (= (h!11239 Nil!10300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!531491 () Bool)

(assert (=> b!531491 (= e!309567 (contains!2786 (t!16531 Nil!10300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!81277 res!326999) b!531490))

(assert (= (and b!531490 (not res!326998)) b!531491))

(declare-fun m!511897 () Bool)

(assert (=> d!81277 m!511897))

(declare-fun m!511899 () Bool)

(assert (=> d!81277 m!511899))

(declare-fun m!511901 () Bool)

(assert (=> b!531491 m!511901))

(assert (=> b!531419 d!81277))

(declare-fun d!81285 () Bool)

(assert (=> d!81285 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48328 d!81285))

(declare-fun d!81293 () Bool)

(assert (=> d!81293 (= (array_inv!11980 a!3154) (bvsge (size!16548 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48328 d!81293))

(declare-fun d!81297 () Bool)

(assert (=> d!81297 (= (validKeyInArray!0 (select (arr!16184 a!3154) j!147)) (and (not (= (select (arr!16184 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16184 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531413 d!81297))

(declare-fun d!81301 () Bool)

(declare-fun res!327022 () Bool)

(declare-fun e!309592 () Bool)

(assert (=> d!81301 (=> res!327022 e!309592)))

(assert (=> d!81301 (= res!327022 (is-Nil!10300 Nil!10300))))

(assert (=> d!81301 (= (noDuplicate!218 Nil!10300) e!309592)))

(declare-fun b!531518 () Bool)

(declare-fun e!309593 () Bool)

(assert (=> b!531518 (= e!309592 e!309593)))

(declare-fun res!327023 () Bool)

(assert (=> b!531518 (=> (not res!327023) (not e!309593))))

(assert (=> b!531518 (= res!327023 (not (contains!2786 (t!16531 Nil!10300) (h!11239 Nil!10300))))))

(declare-fun b!531519 () Bool)

(assert (=> b!531519 (= e!309593 (noDuplicate!218 (t!16531 Nil!10300)))))

(assert (= (and d!81301 (not res!327022)) b!531518))

(assert (= (and b!531518 res!327023) b!531519))

(declare-fun m!511917 () Bool)

