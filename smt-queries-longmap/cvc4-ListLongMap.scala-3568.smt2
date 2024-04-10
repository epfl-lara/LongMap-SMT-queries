; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49036 () Bool)

(assert start!49036)

(declare-fun b!540424 () Bool)

(declare-fun res!335472 () Bool)

(declare-fun e!313069 () Bool)

(assert (=> b!540424 (=> (not res!335472) (not e!313069))))

(declare-datatypes ((array!34197 0))(
  ( (array!34198 (arr!16436 (Array (_ BitVec 32) (_ BitVec 64))) (size!16800 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34197)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!540424 (= res!335472 (and (= (size!16800 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16800 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16800 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540426 () Bool)

(declare-fun res!335473 () Bool)

(declare-fun e!313068 () Bool)

(assert (=> b!540426 (=> (not res!335473) (not e!313068))))

(declare-datatypes ((List!10555 0))(
  ( (Nil!10552) (Cons!10551 (h!11497 (_ BitVec 64)) (t!16783 List!10555)) )
))
(declare-fun arrayNoDuplicates!0 (array!34197 (_ BitVec 32) List!10555) Bool)

(assert (=> b!540426 (= res!335473 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10552))))

(declare-fun b!540427 () Bool)

(declare-fun res!335474 () Bool)

(assert (=> b!540427 (=> (not res!335474) (not e!313068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34197 (_ BitVec 32)) Bool)

(assert (=> b!540427 (= res!335474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540428 () Bool)

(declare-fun e!313070 () Bool)

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!540428 (= e!313070 (and (not (= (select (arr!16436 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16436 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!540429 () Bool)

(assert (=> b!540429 (= e!313069 e!313068)))

(declare-fun res!335480 () Bool)

(assert (=> b!540429 (=> (not res!335480) (not e!313068))))

(declare-datatypes ((SeekEntryResult!4894 0))(
  ( (MissingZero!4894 (index!21800 (_ BitVec 32))) (Found!4894 (index!21801 (_ BitVec 32))) (Intermediate!4894 (undefined!5706 Bool) (index!21802 (_ BitVec 32)) (x!50707 (_ BitVec 32))) (Undefined!4894) (MissingVacant!4894 (index!21803 (_ BitVec 32))) )
))
(declare-fun lt!247375 () SeekEntryResult!4894)

(assert (=> b!540429 (= res!335480 (or (= lt!247375 (MissingZero!4894 i!1153)) (= lt!247375 (MissingVacant!4894 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34197 (_ BitVec 32)) SeekEntryResult!4894)

(assert (=> b!540429 (= lt!247375 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!540430 () Bool)

(declare-fun res!335470 () Bool)

(assert (=> b!540430 (=> (not res!335470) (not e!313069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540430 (= res!335470 (validKeyInArray!0 k!1998))))

(declare-fun b!540431 () Bool)

(assert (=> b!540431 (= e!313068 e!313070)))

(declare-fun res!335478 () Bool)

(assert (=> b!540431 (=> (not res!335478) (not e!313070))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun lt!247374 () SeekEntryResult!4894)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540431 (= res!335478 (= lt!247374 (Intermediate!4894 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34197 (_ BitVec 32)) SeekEntryResult!4894)

(assert (=> b!540431 (= lt!247374 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16436 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540432 () Bool)

(declare-fun res!335476 () Bool)

(assert (=> b!540432 (=> (not res!335476) (not e!313069))))

(declare-fun arrayContainsKey!0 (array!34197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540432 (= res!335476 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540425 () Bool)

(declare-fun res!335479 () Bool)

(assert (=> b!540425 (=> (not res!335479) (not e!313069))))

(assert (=> b!540425 (= res!335479 (validKeyInArray!0 (select (arr!16436 a!3154) j!147)))))

(declare-fun res!335475 () Bool)

(assert (=> start!49036 (=> (not res!335475) (not e!313069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49036 (= res!335475 (validMask!0 mask!3216))))

(assert (=> start!49036 e!313069))

(assert (=> start!49036 true))

(declare-fun array_inv!12232 (array!34197) Bool)

(assert (=> start!49036 (array_inv!12232 a!3154)))

(declare-fun b!540433 () Bool)

(declare-fun res!335477 () Bool)

(assert (=> b!540433 (=> (not res!335477) (not e!313068))))

(assert (=> b!540433 (= res!335477 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16800 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16800 a!3154)) (= (select (arr!16436 a!3154) resIndex!32) (select (arr!16436 a!3154) j!147))))))

(declare-fun b!540434 () Bool)

(declare-fun res!335471 () Bool)

(assert (=> b!540434 (=> (not res!335471) (not e!313070))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540434 (= res!335471 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16436 a!3154) j!147) mask!3216) (select (arr!16436 a!3154) j!147) a!3154 mask!3216) lt!247374))))

(assert (= (and start!49036 res!335475) b!540424))

(assert (= (and b!540424 res!335472) b!540425))

(assert (= (and b!540425 res!335479) b!540430))

(assert (= (and b!540430 res!335470) b!540432))

(assert (= (and b!540432 res!335476) b!540429))

(assert (= (and b!540429 res!335480) b!540427))

(assert (= (and b!540427 res!335474) b!540426))

(assert (= (and b!540426 res!335473) b!540433))

(assert (= (and b!540433 res!335477) b!540431))

(assert (= (and b!540431 res!335478) b!540434))

(assert (= (and b!540434 res!335471) b!540428))

(declare-fun m!519221 () Bool)

(assert (=> b!540434 m!519221))

(assert (=> b!540434 m!519221))

(declare-fun m!519223 () Bool)

(assert (=> b!540434 m!519223))

(assert (=> b!540434 m!519223))

(assert (=> b!540434 m!519221))

(declare-fun m!519225 () Bool)

(assert (=> b!540434 m!519225))

(declare-fun m!519227 () Bool)

(assert (=> b!540433 m!519227))

(assert (=> b!540433 m!519221))

(declare-fun m!519229 () Bool)

(assert (=> b!540428 m!519229))

(assert (=> b!540425 m!519221))

(assert (=> b!540425 m!519221))

(declare-fun m!519231 () Bool)

(assert (=> b!540425 m!519231))

(assert (=> b!540431 m!519221))

(assert (=> b!540431 m!519221))

(declare-fun m!519233 () Bool)

(assert (=> b!540431 m!519233))

(declare-fun m!519235 () Bool)

(assert (=> b!540432 m!519235))

(declare-fun m!519237 () Bool)

(assert (=> b!540426 m!519237))

(declare-fun m!519239 () Bool)

(assert (=> start!49036 m!519239))

(declare-fun m!519241 () Bool)

(assert (=> start!49036 m!519241))

(declare-fun m!519243 () Bool)

(assert (=> b!540430 m!519243))

(declare-fun m!519245 () Bool)

(assert (=> b!540429 m!519245))

(declare-fun m!519247 () Bool)

(assert (=> b!540427 m!519247))

(push 1)

(assert (not b!540431))

(assert (not b!540425))

(assert (not b!540427))

(assert (not b!540430))

(assert (not b!540432))

(assert (not b!540434))

(assert (not b!540426))

(assert (not start!49036))

(assert (not b!540429))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81671 () Bool)

(assert (=> d!81671 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!540430 d!81671))

(declare-fun d!81673 () Bool)

(assert (=> d!81673 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49036 d!81673))

(declare-fun d!81687 () Bool)

(assert (=> d!81687 (= (array_inv!12232 a!3154) (bvsge (size!16800 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49036 d!81687))

(declare-fun d!81689 () Bool)

(assert (=> d!81689 (= (validKeyInArray!0 (select (arr!16436 a!3154) j!147)) (and (not (= (select (arr!16436 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16436 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!540425 d!81689))

(declare-fun b!540535 () Bool)

(declare-fun e!313138 () SeekEntryResult!4894)

(assert (=> b!540535 (= e!313138 (Intermediate!4894 false index!1177 x!1030))))

(declare-fun b!540536 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540536 (= e!313138 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16436 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540537 () Bool)

(declare-fun e!313141 () Bool)

(declare-fun e!313142 () Bool)

(assert (=> b!540537 (= e!313141 e!313142)))

(declare-fun res!335523 () Bool)

(declare-fun lt!247395 () SeekEntryResult!4894)

(assert (=> b!540537 (= res!335523 (and (is-Intermediate!4894 lt!247395) (not (undefined!5706 lt!247395)) (bvslt (x!50707 lt!247395) #b01111111111111111111111111111110) (bvsge (x!50707 lt!247395) #b00000000000000000000000000000000) (bvsge (x!50707 lt!247395) x!1030)))))

(assert (=> b!540537 (=> (not res!335523) (not e!313142))))

(declare-fun d!81691 () Bool)

(assert (=> d!81691 e!313141))

(declare-fun c!62821 () Bool)

(assert (=> d!81691 (= c!62821 (and (is-Intermediate!4894 lt!247395) (undefined!5706 lt!247395)))))

(declare-fun e!313139 () SeekEntryResult!4894)

(assert (=> d!81691 (= lt!247395 e!313139)))

(declare-fun c!62820 () Bool)

(assert (=> d!81691 (= c!62820 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!247396 () (_ BitVec 64))

(assert (=> d!81691 (= lt!247396 (select (arr!16436 a!3154) index!1177))))

(assert (=> d!81691 (validMask!0 mask!3216)))

(assert (=> d!81691 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16436 a!3154) j!147) a!3154 mask!3216) lt!247395)))

(declare-fun b!540538 () Bool)

(assert (=> b!540538 (= e!313139 e!313138)))

(declare-fun c!62819 () Bool)

(assert (=> b!540538 (= c!62819 (or (= lt!247396 (select (arr!16436 a!3154) j!147)) (= (bvadd lt!247396 lt!247396) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!540539 () Bool)

(assert (=> b!540539 (= e!313139 (Intermediate!4894 true index!1177 x!1030))))

(declare-fun b!540540 () Bool)

(assert (=> b!540540 (= e!313141 (bvsge (x!50707 lt!247395) #b01111111111111111111111111111110))))

(declare-fun b!540541 () Bool)

(assert (=> b!540541 (and (bvsge (index!21802 lt!247395) #b00000000000000000000000000000000) (bvslt (index!21802 lt!247395) (size!16800 a!3154)))))

(declare-fun res!335525 () Bool)

(assert (=> b!540541 (= res!335525 (= (select (arr!16436 a!3154) (index!21802 lt!247395)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313140 () Bool)

(assert (=> b!540541 (=> res!335525 e!313140)))

(declare-fun b!540542 () Bool)

(assert (=> b!540542 (and (bvsge (index!21802 lt!247395) #b00000000000000000000000000000000) (bvslt (index!21802 lt!247395) (size!16800 a!3154)))))

(declare-fun res!335524 () Bool)

(assert (=> b!540542 (= res!335524 (= (select (arr!16436 a!3154) (index!21802 lt!247395)) (select (arr!16436 a!3154) j!147)))))

(assert (=> b!540542 (=> res!335524 e!313140)))

(assert (=> b!540542 (= e!313142 e!313140)))

(declare-fun b!540543 () Bool)

(assert (=> b!540543 (and (bvsge (index!21802 lt!247395) #b00000000000000000000000000000000) (bvslt (index!21802 lt!247395) (size!16800 a!3154)))))

(assert (=> b!540543 (= e!313140 (= (select (arr!16436 a!3154) (index!21802 lt!247395)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!81691 c!62820) b!540539))

(assert (= (and d!81691 (not c!62820)) b!540538))

(assert (= (and b!540538 c!62819) b!540535))

(assert (= (and b!540538 (not c!62819)) b!540536))

(assert (= (and d!81691 c!62821) b!540540))

(assert (= (and d!81691 (not c!62821)) b!540537))

(assert (= (and b!540537 res!335523) b!540542))

(assert (= (and b!540542 (not res!335524)) b!540541))

(assert (= (and b!540541 (not res!335525)) b!540543))

(declare-fun m!519283 () Bool)

(assert (=> b!540542 m!519283))

(assert (=> d!81691 m!519229))

(assert (=> d!81691 m!519239))

(declare-fun m!519285 () Bool)

(assert (=> b!540536 m!519285))

(assert (=> b!540536 m!519285))

(assert (=> b!540536 m!519221))

(declare-fun m!519287 () Bool)

(assert (=> b!540536 m!519287))

(assert (=> b!540543 m!519283))

(assert (=> b!540541 m!519283))

(assert (=> b!540431 d!81691))

(declare-fun b!540577 () Bool)

(declare-fun e!313166 () Bool)

(declare-fun contains!2798 (List!10555 (_ BitVec 64)) Bool)

(assert (=> b!540577 (= e!313166 (contains!2798 Nil!10552 (select (arr!16436 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81701 () Bool)

(declare-fun res!335541 () Bool)

(declare-fun e!313165 () Bool)

(assert (=> d!81701 (=> res!335541 e!313165)))

(assert (=> d!81701 (= res!335541 (bvsge #b00000000000000000000000000000000 (size!16800 a!3154)))))

(assert (=> d!81701 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10552) e!313165)))

(declare-fun bm!32021 () Bool)

(declare-fun call!32024 () Bool)

(declare-fun c!62831 () Bool)

(assert (=> bm!32021 (= call!32024 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62831 (Cons!10551 (select (arr!16436 a!3154) #b00000000000000000000000000000000) Nil!10552) Nil!10552)))))

(declare-fun b!540578 () Bool)

(declare-fun e!313168 () Bool)

(assert (=> b!540578 (= e!313168 call!32024)))

(declare-fun b!540579 () Bool)

(declare-fun e!313167 () Bool)

(assert (=> b!540579 (= e!313167 e!313168)))

(assert (=> b!540579 (= c!62831 (validKeyInArray!0 (select (arr!16436 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!540580 () Bool)

(assert (=> b!540580 (= e!313165 e!313167)))

(declare-fun res!335542 () Bool)

(assert (=> b!540580 (=> (not res!335542) (not e!313167))))

(assert (=> b!540580 (= res!335542 (not e!313166))))

(declare-fun res!335543 () Bool)

(assert (=> b!540580 (=> (not res!335543) (not e!313166))))

(assert (=> b!540580 (= res!335543 (validKeyInArray!0 (select (arr!16436 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!540581 () Bool)

(assert (=> b!540581 (= e!313168 call!32024)))

(assert (= (and d!81701 (not res!335541)) b!540580))

(assert (= (and b!540580 res!335543) b!540577))

(assert (= (and b!540580 res!335542) b!540579))

(assert (= (and b!540579 c!62831) b!540581))

(assert (= (and b!540579 (not c!62831)) b!540578))

(assert (= (or b!540581 b!540578) bm!32021))

(declare-fun m!519295 () Bool)

(assert (=> b!540577 m!519295))

(assert (=> b!540577 m!519295))

(declare-fun m!519297 () Bool)

(assert (=> b!540577 m!519297))

(assert (=> bm!32021 m!519295))

(declare-fun m!519299 () Bool)

(assert (=> bm!32021 m!519299))

(assert (=> b!540579 m!519295))

(assert (=> b!540579 m!519295))

(declare-fun m!519301 () Bool)

(assert (=> b!540579 m!519301))

(assert (=> b!540580 m!519295))

(assert (=> b!540580 m!519295))

(assert (=> b!540580 m!519301))

(assert (=> b!540426 d!81701))

(declare-fun d!81705 () Bool)

(declare-fun res!335551 () Bool)

(declare-fun e!313178 () Bool)

(assert (=> d!81705 (=> res!335551 e!313178)))

(assert (=> d!81705 (= res!335551 (= (select (arr!16436 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81705 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!313178)))

(declare-fun b!540595 () Bool)

(declare-fun e!313179 () Bool)

(assert (=> b!540595 (= e!313178 e!313179)))

(declare-fun res!335552 () Bool)

(assert (=> b!540595 (=> (not res!335552) (not e!313179))))

(assert (=> b!540595 (= res!335552 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16800 a!3154)))))

(declare-fun b!540596 () Bool)

(assert (=> b!540596 (= e!313179 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81705 (not res!335551)) b!540595))

(assert (= (and b!540595 res!335552) b!540596))

(assert (=> d!81705 m!519295))

(declare-fun m!519309 () Bool)

(assert (=> b!540596 m!519309))

(assert (=> b!540432 d!81705))

(declare-fun d!81709 () Bool)

(declare-fun res!335567 () Bool)

(declare-fun e!313201 () Bool)

(assert (=> d!81709 (=> res!335567 e!313201)))

(assert (=> d!81709 (= res!335567 (bvsge #b00000000000000000000000000000000 (size!16800 a!3154)))))

(assert (=> d!81709 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!313201)))

(declare-fun b!540626 () Bool)

(declare-fun e!313200 () Bool)

(declare-fun e!313202 () Bool)

(assert (=> b!540626 (= e!313200 e!313202)))

(declare-fun lt!247427 () (_ BitVec 64))

(assert (=> b!540626 (= lt!247427 (select (arr!16436 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16894 0))(
  ( (Unit!16895) )
))
(declare-fun lt!247428 () Unit!16894)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34197 (_ BitVec 64) (_ BitVec 32)) Unit!16894)

(assert (=> b!540626 (= lt!247428 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!247427 #b00000000000000000000000000000000))))

(assert (=> b!540626 (arrayContainsKey!0 a!3154 lt!247427 #b00000000000000000000000000000000)))

(declare-fun lt!247426 () Unit!16894)

(assert (=> b!540626 (= lt!247426 lt!247428)))

(declare-fun res!335568 () Bool)

(assert (=> b!540626 (= res!335568 (= (seekEntryOrOpen!0 (select (arr!16436 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4894 #b00000000000000000000000000000000)))))

(assert (=> b!540626 (=> (not res!335568) (not e!313202))))

(declare-fun bm!32027 () Bool)

(declare-fun call!32030 () Bool)

(assert (=> bm!32027 (= call!32030 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!540627 () Bool)

(assert (=> b!540627 (= e!313201 e!313200)))

(declare-fun c!62843 () Bool)

(assert (=> b!540627 (= c!62843 (validKeyInArray!0 (select (arr!16436 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!540628 () Bool)

(assert (=> b!540628 (= e!313202 call!32030)))

(declare-fun b!540629 () Bool)

(assert (=> b!540629 (= e!313200 call!32030)))

(assert (= (and d!81709 (not res!335567)) b!540627))

(assert (= (and b!540627 c!62843) b!540626))

(assert (= (and b!540627 (not c!62843)) b!540629))

(assert (= (and b!540626 res!335568) b!540628))

(assert (= (or b!540628 b!540629) bm!32027))

(assert (=> b!540626 m!519295))

(declare-fun m!519327 () Bool)

(assert (=> b!540626 m!519327))

(declare-fun m!519329 () Bool)

(assert (=> b!540626 m!519329))

(assert (=> b!540626 m!519295))

(declare-fun m!519331 () Bool)

(assert (=> b!540626 m!519331))

(declare-fun m!519333 () Bool)

(assert (=> bm!32027 m!519333))

(assert (=> b!540627 m!519295))

(assert (=> b!540627 m!519295))

(assert (=> b!540627 m!519301))

(assert (=> b!540427 d!81709))

(declare-fun e!313203 () SeekEntryResult!4894)

(declare-fun b!540630 () Bool)

(assert (=> b!540630 (= e!313203 (Intermediate!4894 false (toIndex!0 (select (arr!16436 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!540631 () Bool)

(assert (=> b!540631 (= e!313203 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16436 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16436 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540632 () Bool)

(declare-fun e!313206 () Bool)

(declare-fun e!313207 () Bool)

(assert (=> b!540632 (= e!313206 e!313207)))

(declare-fun res!335569 () Bool)

(declare-fun lt!247429 () SeekEntryResult!4894)

(assert (=> b!540632 (= res!335569 (and (is-Intermediate!4894 lt!247429) (not (undefined!5706 lt!247429)) (bvslt (x!50707 lt!247429) #b01111111111111111111111111111110) (bvsge (x!50707 lt!247429) #b00000000000000000000000000000000) (bvsge (x!50707 lt!247429) #b00000000000000000000000000000000)))))

(assert (=> b!540632 (=> (not res!335569) (not e!313207))))

(declare-fun d!81723 () Bool)

(assert (=> d!81723 e!313206))

(declare-fun c!62846 () Bool)

