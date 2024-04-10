; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86232 () Bool)

(assert start!86232)

(declare-fun b!998438 () Bool)

(declare-fun res!668244 () Bool)

(declare-fun e!563029 () Bool)

(assert (=> b!998438 (=> (not res!668244) (not e!563029))))

(declare-datatypes ((array!63135 0))(
  ( (array!63136 (arr!30396 (Array (_ BitVec 32) (_ BitVec 64))) (size!30898 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63135)

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9328 0))(
  ( (MissingZero!9328 (index!39683 (_ BitVec 32))) (Found!9328 (index!39684 (_ BitVec 32))) (Intermediate!9328 (undefined!10140 Bool) (index!39685 (_ BitVec 32)) (x!87112 (_ BitVec 32))) (Undefined!9328) (MissingVacant!9328 (index!39686 (_ BitVec 32))) )
))
(declare-fun lt!441700 () SeekEntryResult!9328)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63135 (_ BitVec 32)) SeekEntryResult!9328)

(assert (=> b!998438 (= res!668244 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30396 a!3219) j!170) a!3219 mask!3464) lt!441700))))

(declare-fun b!998439 () Bool)

(declare-fun res!668242 () Bool)

(declare-fun e!563028 () Bool)

(assert (=> b!998439 (=> (not res!668242) (not e!563028))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998439 (= res!668242 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998441 () Bool)

(declare-fun res!668237 () Bool)

(assert (=> b!998441 (=> (not res!668237) (not e!563028))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998441 (= res!668237 (and (= (size!30898 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30898 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30898 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998442 () Bool)

(assert (=> b!998442 (= e!563029 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsgt mask!3464 #b00111111111111111111111111111111)))))

(declare-fun b!998443 () Bool)

(declare-fun res!668243 () Bool)

(assert (=> b!998443 (=> (not res!668243) (not e!563028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998443 (= res!668243 (validKeyInArray!0 (select (arr!30396 a!3219) j!170)))))

(declare-fun b!998444 () Bool)

(declare-fun e!563027 () Bool)

(assert (=> b!998444 (= e!563027 e!563029)))

(declare-fun res!668235 () Bool)

(assert (=> b!998444 (=> (not res!668235) (not e!563029))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998444 (= res!668235 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30396 a!3219) j!170) mask!3464) (select (arr!30396 a!3219) j!170) a!3219 mask!3464) lt!441700))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998444 (= lt!441700 (Intermediate!9328 false resIndex!38 resX!38))))

(declare-fun b!998445 () Bool)

(declare-fun res!668239 () Bool)

(assert (=> b!998445 (=> (not res!668239) (not e!563027))))

(assert (=> b!998445 (= res!668239 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30898 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30898 a!3219))))))

(declare-fun b!998446 () Bool)

(declare-fun res!668240 () Bool)

(assert (=> b!998446 (=> (not res!668240) (not e!563027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63135 (_ BitVec 32)) Bool)

(assert (=> b!998446 (= res!668240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998447 () Bool)

(declare-fun res!668241 () Bool)

(assert (=> b!998447 (=> (not res!668241) (not e!563027))))

(declare-datatypes ((List!21072 0))(
  ( (Nil!21069) (Cons!21068 (h!22239 (_ BitVec 64)) (t!30073 List!21072)) )
))
(declare-fun arrayNoDuplicates!0 (array!63135 (_ BitVec 32) List!21072) Bool)

(assert (=> b!998447 (= res!668241 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21069))))

(declare-fun b!998448 () Bool)

(declare-fun res!668236 () Bool)

(assert (=> b!998448 (=> (not res!668236) (not e!563028))))

(assert (=> b!998448 (= res!668236 (validKeyInArray!0 k!2224))))

(declare-fun res!668238 () Bool)

(assert (=> start!86232 (=> (not res!668238) (not e!563028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86232 (= res!668238 (validMask!0 mask!3464))))

(assert (=> start!86232 e!563028))

(declare-fun array_inv!23520 (array!63135) Bool)

(assert (=> start!86232 (array_inv!23520 a!3219)))

(assert (=> start!86232 true))

(declare-fun b!998440 () Bool)

(assert (=> b!998440 (= e!563028 e!563027)))

(declare-fun res!668234 () Bool)

(assert (=> b!998440 (=> (not res!668234) (not e!563027))))

(declare-fun lt!441701 () SeekEntryResult!9328)

(assert (=> b!998440 (= res!668234 (or (= lt!441701 (MissingVacant!9328 i!1194)) (= lt!441701 (MissingZero!9328 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63135 (_ BitVec 32)) SeekEntryResult!9328)

(assert (=> b!998440 (= lt!441701 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!86232 res!668238) b!998441))

(assert (= (and b!998441 res!668237) b!998443))

(assert (= (and b!998443 res!668243) b!998448))

(assert (= (and b!998448 res!668236) b!998439))

(assert (= (and b!998439 res!668242) b!998440))

(assert (= (and b!998440 res!668234) b!998446))

(assert (= (and b!998446 res!668240) b!998447))

(assert (= (and b!998447 res!668241) b!998445))

(assert (= (and b!998445 res!668239) b!998444))

(assert (= (and b!998444 res!668235) b!998438))

(assert (= (and b!998438 res!668244) b!998442))

(declare-fun m!924965 () Bool)

(assert (=> b!998443 m!924965))

(assert (=> b!998443 m!924965))

(declare-fun m!924967 () Bool)

(assert (=> b!998443 m!924967))

(declare-fun m!924969 () Bool)

(assert (=> start!86232 m!924969))

(declare-fun m!924971 () Bool)

(assert (=> start!86232 m!924971))

(declare-fun m!924973 () Bool)

(assert (=> b!998447 m!924973))

(declare-fun m!924975 () Bool)

(assert (=> b!998440 m!924975))

(assert (=> b!998444 m!924965))

(assert (=> b!998444 m!924965))

(declare-fun m!924977 () Bool)

(assert (=> b!998444 m!924977))

(assert (=> b!998444 m!924977))

(assert (=> b!998444 m!924965))

(declare-fun m!924979 () Bool)

(assert (=> b!998444 m!924979))

(assert (=> b!998438 m!924965))

(assert (=> b!998438 m!924965))

(declare-fun m!924981 () Bool)

(assert (=> b!998438 m!924981))

(declare-fun m!924983 () Bool)

(assert (=> b!998448 m!924983))

(declare-fun m!924985 () Bool)

(assert (=> b!998439 m!924985))

(declare-fun m!924987 () Bool)

(assert (=> b!998446 m!924987))

(push 1)

(assert (not b!998443))

(assert (not start!86232))

(assert (not b!998446))

(assert (not b!998439))

(assert (not b!998444))

(assert (not b!998438))

(assert (not b!998447))

(assert (not b!998448))

(assert (not b!998440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!998515 () Bool)

(declare-fun e!563068 () SeekEntryResult!9328)

(declare-fun lt!441720 () SeekEntryResult!9328)

(assert (=> b!998515 (= e!563068 (MissingZero!9328 (index!39685 lt!441720)))))

(declare-fun b!998516 () Bool)

(declare-fun c!101272 () Bool)

(declare-fun lt!441721 () (_ BitVec 64))

(assert (=> b!998516 (= c!101272 (= lt!441721 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!563066 () SeekEntryResult!9328)

(assert (=> b!998516 (= e!563066 e!563068)))

(declare-fun b!998517 () Bool)

(declare-fun e!563067 () SeekEntryResult!9328)

(assert (=> b!998517 (= e!563067 e!563066)))

(assert (=> b!998517 (= lt!441721 (select (arr!30396 a!3219) (index!39685 lt!441720)))))

(declare-fun c!101271 () Bool)

(assert (=> b!998517 (= c!101271 (= lt!441721 k!2224))))

(declare-fun b!998518 () Bool)

(assert (=> b!998518 (= e!563066 (Found!9328 (index!39685 lt!441720)))))

(declare-fun b!998519 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63135 (_ BitVec 32)) SeekEntryResult!9328)

(assert (=> b!998519 (= e!563068 (seekKeyOrZeroReturnVacant!0 (x!87112 lt!441720) (index!39685 lt!441720) (index!39685 lt!441720) k!2224 a!3219 mask!3464))))

(declare-fun b!998520 () Bool)

(assert (=> b!998520 (= e!563067 Undefined!9328)))

(declare-fun d!119183 () Bool)

(declare-fun lt!441722 () SeekEntryResult!9328)

(assert (=> d!119183 (and (or (is-Undefined!9328 lt!441722) (not (is-Found!9328 lt!441722)) (and (bvsge (index!39684 lt!441722) #b00000000000000000000000000000000) (bvslt (index!39684 lt!441722) (size!30898 a!3219)))) (or (is-Undefined!9328 lt!441722) (is-Found!9328 lt!441722) (not (is-MissingZero!9328 lt!441722)) (and (bvsge (index!39683 lt!441722) #b00000000000000000000000000000000) (bvslt (index!39683 lt!441722) (size!30898 a!3219)))) (or (is-Undefined!9328 lt!441722) (is-Found!9328 lt!441722) (is-MissingZero!9328 lt!441722) (not (is-MissingVacant!9328 lt!441722)) (and (bvsge (index!39686 lt!441722) #b00000000000000000000000000000000) (bvslt (index!39686 lt!441722) (size!30898 a!3219)))) (or (is-Undefined!9328 lt!441722) (ite (is-Found!9328 lt!441722) (= (select (arr!30396 a!3219) (index!39684 lt!441722)) k!2224) (ite (is-MissingZero!9328 lt!441722) (= (select (arr!30396 a!3219) (index!39683 lt!441722)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9328 lt!441722) (= (select (arr!30396 a!3219) (index!39686 lt!441722)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119183 (= lt!441722 e!563067)))

(declare-fun c!101273 () Bool)

(assert (=> d!119183 (= c!101273 (and (is-Intermediate!9328 lt!441720) (undefined!10140 lt!441720)))))

(assert (=> d!119183 (= lt!441720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119183 (validMask!0 mask!3464)))

(assert (=> d!119183 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!441722)))

(assert (= (and d!119183 c!101273) b!998520))

(assert (= (and d!119183 (not c!101273)) b!998517))

(assert (= (and b!998517 c!101271) b!998518))

(assert (= (and b!998517 (not c!101271)) b!998516))

(assert (= (and b!998516 c!101272) b!998515))

(assert (= (and b!998516 (not c!101272)) b!998519))

(declare-fun m!925005 () Bool)

(assert (=> b!998517 m!925005))

(declare-fun m!925007 () Bool)

(assert (=> b!998519 m!925007))

(declare-fun m!925009 () Bool)

(assert (=> d!119183 m!925009))

(assert (=> d!119183 m!924969))

(declare-fun m!925011 () Bool)

(assert (=> d!119183 m!925011))

(declare-fun m!925013 () Bool)

(assert (=> d!119183 m!925013))

(declare-fun m!925015 () Bool)

(assert (=> d!119183 m!925015))

(assert (=> d!119183 m!925009))

(declare-fun m!925017 () Bool)

(assert (=> d!119183 m!925017))

(assert (=> b!998440 d!119183))

(declare-fun b!998531 () Bool)

(declare-fun e!563079 () Bool)

(declare-fun call!42278 () Bool)

(assert (=> b!998531 (= e!563079 call!42278)))

(declare-fun b!998532 () Bool)

(declare-fun e!563081 () Bool)

(assert (=> b!998532 (= e!563081 e!563079)))

(declare-fun lt!441735 () (_ BitVec 64))

(assert (=> b!998532 (= lt!441735 (select (arr!30396 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32986 0))(
  ( (Unit!32987) )
))
(declare-fun lt!441737 () Unit!32986)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63135 (_ BitVec 64) (_ BitVec 32)) Unit!32986)

(assert (=> b!998532 (= lt!441737 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441735 #b00000000000000000000000000000000))))

(assert (=> b!998532 (arrayContainsKey!0 a!3219 lt!441735 #b00000000000000000000000000000000)))

(declare-fun lt!441736 () Unit!32986)

(assert (=> b!998532 (= lt!441736 lt!441737)))

(declare-fun res!668273 () Bool)

(assert (=> b!998532 (= res!668273 (= (seekEntryOrOpen!0 (select (arr!30396 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9328 #b00000000000000000000000000000000)))))

(assert (=> b!998532 (=> (not res!668273) (not e!563079))))

(declare-fun bm!42275 () Bool)

(assert (=> bm!42275 (= call!42278 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun d!119189 () Bool)

(declare-fun res!668272 () Bool)

(declare-fun e!563080 () Bool)

(assert (=> d!119189 (=> res!668272 e!563080)))

(assert (=> d!119189 (= res!668272 (bvsge #b00000000000000000000000000000000 (size!30898 a!3219)))))

(assert (=> d!119189 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!563080)))

(declare-fun b!998533 () Bool)

(assert (=> b!998533 (= e!563081 call!42278)))

(declare-fun b!998534 () Bool)

(assert (=> b!998534 (= e!563080 e!563081)))

(declare-fun c!101276 () Bool)

(assert (=> b!998534 (= c!101276 (validKeyInArray!0 (select (arr!30396 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119189 (not res!668272)) b!998534))

(assert (= (and b!998534 c!101276) b!998532))

(assert (= (and b!998534 (not c!101276)) b!998533))

(assert (= (and b!998532 res!668273) b!998531))

(assert (= (or b!998531 b!998533) bm!42275))

(declare-fun m!925019 () Bool)

(assert (=> b!998532 m!925019))

(declare-fun m!925021 () Bool)

(assert (=> b!998532 m!925021))

(declare-fun m!925023 () Bool)

(assert (=> b!998532 m!925023))

(assert (=> b!998532 m!925019))

(declare-fun m!925025 () Bool)

(assert (=> b!998532 m!925025))

(declare-fun m!925027 () Bool)

(assert (=> bm!42275 m!925027))

(assert (=> b!998534 m!925019))

(assert (=> b!998534 m!925019))

(declare-fun m!925029 () Bool)

(assert (=> b!998534 m!925029))

(assert (=> b!998446 d!119189))

(declare-fun b!998558 () Bool)

(declare-fun e!563098 () Bool)

(declare-fun e!563100 () Bool)

(assert (=> b!998558 (= e!563098 e!563100)))

(declare-fun res!668286 () Bool)

(assert (=> b!998558 (=> (not res!668286) (not e!563100))))

(declare-fun e!563099 () Bool)

(assert (=> b!998558 (= res!668286 (not e!563099))))

(declare-fun res!668287 () Bool)

(assert (=> b!998558 (=> (not res!668287) (not e!563099))))

(assert (=> b!998558 (= res!668287 (validKeyInArray!0 (select (arr!30396 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42281 () Bool)

(declare-fun call!42284 () Bool)

(declare-fun c!101282 () Bool)

(assert (=> bm!42281 (= call!42284 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101282 (Cons!21068 (select (arr!30396 a!3219) #b00000000000000000000000000000000) Nil!21069) Nil!21069)))))

(declare-fun b!998559 () Bool)

(declare-fun e!563101 () Bool)

(assert (=> b!998559 (= e!563101 call!42284)))

(declare-fun b!998560 () Bool)

(assert (=> b!998560 (= e!563100 e!563101)))

(assert (=> b!998560 (= c!101282 (validKeyInArray!0 (select (arr!30396 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!998561 () Bool)

(declare-fun contains!5875 (List!21072 (_ BitVec 64)) Bool)

(assert (=> b!998561 (= e!563099 (contains!5875 Nil!21069 (select (arr!30396 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119197 () Bool)

(declare-fun res!668285 () Bool)

(assert (=> d!119197 (=> res!668285 e!563098)))

(assert (=> d!119197 (= res!668285 (bvsge #b00000000000000000000000000000000 (size!30898 a!3219)))))

(assert (=> d!119197 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21069) e!563098)))

(declare-fun b!998562 () Bool)

(assert (=> b!998562 (= e!563101 call!42284)))

(assert (= (and d!119197 (not res!668285)) b!998558))

(assert (= (and b!998558 res!668287) b!998561))

(assert (= (and b!998558 res!668286) b!998560))

(assert (= (and b!998560 c!101282) b!998562))

(assert (= (and b!998560 (not c!101282)) b!998559))

(assert (= (or b!998562 b!998559) bm!42281))

(assert (=> b!998558 m!925019))

(assert (=> b!998558 m!925019))

(assert (=> b!998558 m!925029))

(assert (=> bm!42281 m!925019))

(declare-fun m!925039 () Bool)

(assert (=> bm!42281 m!925039))

(assert (=> b!998560 m!925019))

(assert (=> b!998560 m!925019))

(assert (=> b!998560 m!925029))

(assert (=> b!998561 m!925019))

(assert (=> b!998561 m!925019))

(declare-fun m!925041 () Bool)

(assert (=> b!998561 m!925041))

(assert (=> b!998447 d!119197))

(declare-fun d!119205 () Bool)

(assert (=> d!119205 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!998448 d!119205))

(declare-fun d!119207 () Bool)

(assert (=> d!119207 (= (validKeyInArray!0 (select (arr!30396 a!3219) j!170)) (and (not (= (select (arr!30396 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30396 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!998443 d!119207))

(declare-fun d!119209 () Bool)

(declare-fun e!563132 () Bool)

(assert (=> d!119209 e!563132))

(declare-fun c!101305 () Bool)

(declare-fun lt!441756 () SeekEntryResult!9328)

(assert (=> d!119209 (= c!101305 (and (is-Intermediate!9328 lt!441756) (undefined!10140 lt!441756)))))

(declare-fun e!563133 () SeekEntryResult!9328)

(assert (=> d!119209 (= lt!441756 e!563133)))

(declare-fun c!101306 () Bool)

(assert (=> d!119209 (= c!101306 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!441755 () (_ BitVec 64))

(assert (=> d!119209 (= lt!441755 (select (arr!30396 a!3219) index!1507))))

(assert (=> d!119209 (validMask!0 mask!3464)))

(assert (=> d!119209 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30396 a!3219) j!170) a!3219 mask!3464) lt!441756)))

(declare-fun b!998617 () Bool)

(declare-fun e!563131 () SeekEntryResult!9328)

(assert (=> b!998617 (= e!563131 (Intermediate!9328 false index!1507 x!1245))))

(declare-fun b!998618 () Bool)

(assert (=> b!998618 (= e!563132 (bvsge (x!87112 lt!441756) #b01111111111111111111111111111110))))

(declare-fun b!998619 () Bool)

(assert (=> b!998619 (and (bvsge (index!39685 lt!441756) #b00000000000000000000000000000000) (bvslt (index!39685 lt!441756) (size!30898 a!3219)))))

(declare-fun res!668300 () Bool)

(assert (=> b!998619 (= res!668300 (= (select (arr!30396 a!3219) (index!39685 lt!441756)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!563134 () Bool)

(assert (=> b!998619 (=> res!668300 e!563134)))

(declare-fun b!998620 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998620 (= e!563131 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30396 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!998621 () Bool)

(assert (=> b!998621 (= e!563133 (Intermediate!9328 true index!1507 x!1245))))

(declare-fun b!998622 () Bool)

(assert (=> b!998622 (and (bvsge (index!39685 lt!441756) #b00000000000000000000000000000000) (bvslt (index!39685 lt!441756) (size!30898 a!3219)))))

(declare-fun res!668301 () Bool)

(assert (=> b!998622 (= res!668301 (= (select (arr!30396 a!3219) (index!39685 lt!441756)) (select (arr!30396 a!3219) j!170)))))

(assert (=> b!998622 (=> res!668301 e!563134)))

(declare-fun e!563135 () Bool)

(assert (=> b!998622 (= e!563135 e!563134)))

(declare-fun b!998623 () Bool)

(assert (=> b!998623 (and (bvsge (index!39685 lt!441756) #b00000000000000000000000000000000) (bvslt (index!39685 lt!441756) (size!30898 a!3219)))))

(assert (=> b!998623 (= e!563134 (= (select (arr!30396 a!3219) (index!39685 lt!441756)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!998624 () Bool)

(assert (=> b!998624 (= e!563133 e!563131)))

(declare-fun c!101304 () Bool)

(assert (=> b!998624 (= c!101304 (or (= lt!441755 (select (arr!30396 a!3219) j!170)) (= (bvadd lt!441755 lt!441755) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!998625 () Bool)

(assert (=> b!998625 (= e!563132 e!563135)))

(declare-fun res!668302 () Bool)

(assert (=> b!998625 (= res!668302 (and (is-Intermediate!9328 lt!441756) (not (undefined!10140 lt!441756)) (bvslt (x!87112 lt!441756) #b01111111111111111111111111111110) (bvsge (x!87112 lt!441756) #b00000000000000000000000000000000) (bvsge (x!87112 lt!441756) x!1245)))))

(assert (=> b!998625 (=> (not res!668302) (not e!563135))))

(assert (= (and d!119209 c!101306) b!998621))

(assert (= (and d!119209 (not c!101306)) b!998624))

(assert (= (and b!998624 c!101304) b!998617))

(assert (= (and b!998624 (not c!101304)) b!998620))

(assert (= (and d!119209 c!101305) b!998618))

(assert (= (and d!119209 (not c!101305)) b!998625))

(assert (= (and b!998625 res!668302) b!998622))

(assert (= (and b!998622 (not res!668301)) b!998619))

(assert (= (and b!998619 (not res!668300)) b!998623))

(declare-fun m!925073 () Bool)

(assert (=> b!998619 m!925073))

(declare-fun m!925075 () Bool)

(assert (=> b!998620 m!925075))

(assert (=> b!998620 m!925075))

(assert (=> b!998620 m!924965))

(declare-fun m!925077 () Bool)

(assert (=> b!998620 m!925077))

(assert (=> b!998622 m!925073))

(declare-fun m!925079 () Bool)

(assert (=> d!119209 m!925079))

(assert (=> d!119209 m!924969))

(assert (=> b!998623 m!925073))

(assert (=> b!998438 d!119209))

(declare-fun d!119223 () Bool)

(declare-fun e!563137 () Bool)

(assert (=> d!119223 e!563137))

(declare-fun c!101308 () Bool)

(declare-fun lt!441758 () SeekEntryResult!9328)

(assert (=> d!119223 (= c!101308 (and (is-Intermediate!9328 lt!441758) (undefined!10140 lt!441758)))))

(declare-fun e!563138 () SeekEntryResult!9328)

(assert (=> d!119223 (= lt!441758 e!563138)))

(declare-fun c!101309 () Bool)

(assert (=> d!119223 (= c!101309 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!441757 () (_ BitVec 64))

(assert (=> d!119223 (= lt!441757 (select (arr!30396 a!3219) (toIndex!0 (select (arr!30396 a!3219) j!170) mask!3464)))))

(assert (=> d!119223 (validMask!0 mask!3464)))

(assert (=> d!119223 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30396 a!3219) j!170) mask!3464) (select (arr!30396 a!3219) j!170) a!3219 mask!3464) lt!441758)))

(declare-fun b!998626 () Bool)

(declare-fun e!563136 () SeekEntryResult!9328)

(assert (=> b!998626 (= e!563136 (Intermediate!9328 false (toIndex!0 (select (arr!30396 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!998627 () Bool)

(assert (=> b!998627 (= e!563137 (bvsge (x!87112 lt!441758) #b01111111111111111111111111111110))))

(declare-fun b!998628 () Bool)

(assert (=> b!998628 (and (bvsge (index!39685 lt!441758) #b00000000000000000000000000000000) (bvslt (index!39685 lt!441758) (size!30898 a!3219)))))

(declare-fun res!668303 () Bool)

(assert (=> b!998628 (= res!668303 (= (select (arr!30396 a!3219) (index!39685 lt!441758)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!563139 () Bool)

(assert (=> b!998628 (=> res!668303 e!563139)))

(declare-fun b!998629 () Bool)

(assert (=> b!998629 (= e!563136 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30396 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30396 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!998630 () Bool)

(assert (=> b!998630 (= e!563138 (Intermediate!9328 true (toIndex!0 (select (arr!30396 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!998631 () Bool)

(assert (=> b!998631 (and (bvsge (index!39685 lt!441758) #b00000000000000000000000000000000) (bvslt (index!39685 lt!441758) (size!30898 a!3219)))))

(declare-fun res!668304 () Bool)

(assert (=> b!998631 (= res!668304 (= (select (arr!30396 a!3219) (index!39685 lt!441758)) (select (arr!30396 a!3219) j!170)))))

(assert (=> b!998631 (=> res!668304 e!563139)))

(declare-fun e!563140 () Bool)

(assert (=> b!998631 (= e!563140 e!563139)))

(declare-fun b!998632 () Bool)

(assert (=> b!998632 (and (bvsge (index!39685 lt!441758) #b00000000000000000000000000000000) (bvslt (index!39685 lt!441758) (size!30898 a!3219)))))

(assert (=> b!998632 (= e!563139 (= (select (arr!30396 a!3219) (index!39685 lt!441758)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!998633 () Bool)

(assert (=> b!998633 (= e!563138 e!563136)))

(declare-fun c!101307 () Bool)

(assert (=> b!998633 (= c!101307 (or (= lt!441757 (select (arr!30396 a!3219) j!170)) (= (bvadd lt!441757 lt!441757) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!998634 () Bool)

(assert (=> b!998634 (= e!563137 e!563140)))

(declare-fun res!668305 () Bool)

(assert (=> b!998634 (= res!668305 (and (is-Intermediate!9328 lt!441758) (not (undefined!10140 lt!441758)) (bvslt (x!87112 lt!441758) #b01111111111111111111111111111110) (bvsge (x!87112 lt!441758) #b00000000000000000000000000000000) (bvsge (x!87112 lt!441758) #b00000000000000000000000000000000)))))

(assert (=> b!998634 (=> (not res!668305) (not e!563140))))

(assert (= (and d!119223 c!101309) b!998630))

(assert (= (and d!119223 (not c!101309)) b!998633))

(assert (= (and b!998633 c!101307) b!998626))

(assert (= (and b!998633 (not c!101307)) b!998629))

(assert (= (and d!119223 c!101308) b!998627))

(assert (= (and d!119223 (not c!101308)) b!998634))

(assert (= (and b!998634 res!668305) b!998631))

(assert (= (and b!998631 (not res!668304)) b!998628))

(assert (= (and b!998628 (not res!668303)) b!998632))

(declare-fun m!925081 () Bool)

(assert (=> b!998628 m!925081))

(assert (=> b!998629 m!924977))

(declare-fun m!925083 () Bool)

(assert (=> b!998629 m!925083))

(assert (=> b!998629 m!925083))

(assert (=> b!998629 m!924965))

(declare-fun m!925085 () Bool)

(assert (=> b!998629 m!925085))

(assert (=> b!998631 m!925081))

(assert (=> d!119223 m!924977))

(declare-fun m!925087 () Bool)

(assert (=> d!119223 m!925087))

(assert (=> d!119223 m!924969))

(assert (=> b!998632 m!925081))

(assert (=> b!998444 d!119223))

(declare-fun d!119225 () Bool)

(declare-fun lt!441779 () (_ BitVec 32))

(declare-fun lt!441778 () (_ BitVec 32))

(assert (=> d!119225 (= lt!441779 (bvmul (bvxor lt!441778 (bvlshr lt!441778 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119225 (= lt!441778 ((_ extract 31 0) (bvand (bvxor (select (arr!30396 a!3219) j!170) (bvlshr (select (arr!30396 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119225 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!668307 (let ((h!22242 ((_ extract 31 0) (bvand (bvxor (select (arr!30396 a!3219) j!170) (bvlshr (select (arr!30396 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87118 (bvmul (bvxor h!22242 (bvlshr h!22242 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87118 (bvlshr x!87118 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!668307 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!668307 #b00000000000000000000000000000000))))))

(assert (=> d!119225 (= (toIndex!0 (select (arr!30396 a!3219) j!170) mask!3464) (bvand (bvxor lt!441779 (bvlshr lt!441779 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!998444 d!119225))

(declare-fun d!119231 () Bool)

(assert (=> d!119231 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86232 d!119231))

(declare-fun d!119235 () Bool)

(assert (=> d!119235 (= (array_inv!23520 a!3219) (bvsge (size!30898 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86232 d!119235))

(declare-fun d!119237 () Bool)

(declare-fun res!668330 () Bool)

(declare-fun e!563178 () Bool)

(assert (=> d!119237 (=> res!668330 e!563178)))

(assert (=> d!119237 (= res!668330 (= (select (arr!30396 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119237 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!563178)))

(declare-fun b!998687 () Bool)

(declare-fun e!563179 () Bool)

(assert (=> b!998687 (= e!563178 e!563179)))

(declare-fun res!668331 () Bool)

(assert (=> b!998687 (=> (not res!668331) (not e!563179))))

(assert (=> b!998687 (= res!668331 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30898 a!3219)))))

(declare-fun b!998688 () Bool)

(assert (=> b!998688 (= e!563179 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119237 (not res!668330)) b!998687))

(assert (= (and b!998687 res!668331) b!998688))

(assert (=> d!119237 m!925019))

(declare-fun m!925125 () Bool)

(assert (=> b!998688 m!925125))

(assert (=> b!998439 d!119237))

(push 1)

