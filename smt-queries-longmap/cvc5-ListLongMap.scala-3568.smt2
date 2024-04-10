; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49032 () Bool)

(assert start!49032)

(declare-fun b!540358 () Bool)

(declare-fun res!335405 () Bool)

(declare-fun e!313046 () Bool)

(assert (=> b!540358 (=> (not res!335405) (not e!313046))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4892 0))(
  ( (MissingZero!4892 (index!21792 (_ BitVec 32))) (Found!4892 (index!21793 (_ BitVec 32))) (Intermediate!4892 (undefined!5704 Bool) (index!21794 (_ BitVec 32)) (x!50705 (_ BitVec 32))) (Undefined!4892) (MissingVacant!4892 (index!21795 (_ BitVec 32))) )
))
(declare-fun lt!247363 () SeekEntryResult!4892)

(declare-datatypes ((array!34193 0))(
  ( (array!34194 (arr!16434 (Array (_ BitVec 32) (_ BitVec 64))) (size!16798 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34193)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34193 (_ BitVec 32)) SeekEntryResult!4892)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540358 (= res!335405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16434 a!3154) j!147) mask!3216) (select (arr!16434 a!3154) j!147) a!3154 mask!3216) lt!247363))))

(declare-fun res!335411 () Bool)

(declare-fun e!313044 () Bool)

(assert (=> start!49032 (=> (not res!335411) (not e!313044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49032 (= res!335411 (validMask!0 mask!3216))))

(assert (=> start!49032 e!313044))

(assert (=> start!49032 true))

(declare-fun array_inv!12230 (array!34193) Bool)

(assert (=> start!49032 (array_inv!12230 a!3154)))

(declare-fun b!540359 () Bool)

(declare-fun res!335406 () Bool)

(assert (=> b!540359 (=> (not res!335406) (not e!313044))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540359 (= res!335406 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540360 () Bool)

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!540360 (= e!313046 (and (not (= (select (arr!16434 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16434 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!540361 () Bool)

(declare-fun res!335408 () Bool)

(assert (=> b!540361 (=> (not res!335408) (not e!313044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540361 (= res!335408 (validKeyInArray!0 k!1998))))

(declare-fun b!540362 () Bool)

(declare-fun e!313045 () Bool)

(assert (=> b!540362 (= e!313045 e!313046)))

(declare-fun res!335404 () Bool)

(assert (=> b!540362 (=> (not res!335404) (not e!313046))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540362 (= res!335404 (= lt!247363 (Intermediate!4892 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!540362 (= lt!247363 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16434 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540363 () Bool)

(assert (=> b!540363 (= e!313044 e!313045)))

(declare-fun res!335410 () Bool)

(assert (=> b!540363 (=> (not res!335410) (not e!313045))))

(declare-fun lt!247362 () SeekEntryResult!4892)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540363 (= res!335410 (or (= lt!247362 (MissingZero!4892 i!1153)) (= lt!247362 (MissingVacant!4892 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34193 (_ BitVec 32)) SeekEntryResult!4892)

(assert (=> b!540363 (= lt!247362 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!540364 () Bool)

(declare-fun res!335414 () Bool)

(assert (=> b!540364 (=> (not res!335414) (not e!313044))))

(assert (=> b!540364 (= res!335414 (validKeyInArray!0 (select (arr!16434 a!3154) j!147)))))

(declare-fun b!540365 () Bool)

(declare-fun res!335409 () Bool)

(assert (=> b!540365 (=> (not res!335409) (not e!313045))))

(declare-datatypes ((List!10553 0))(
  ( (Nil!10550) (Cons!10549 (h!11495 (_ BitVec 64)) (t!16781 List!10553)) )
))
(declare-fun arrayNoDuplicates!0 (array!34193 (_ BitVec 32) List!10553) Bool)

(assert (=> b!540365 (= res!335409 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10550))))

(declare-fun b!540366 () Bool)

(declare-fun res!335407 () Bool)

(assert (=> b!540366 (=> (not res!335407) (not e!313044))))

(assert (=> b!540366 (= res!335407 (and (= (size!16798 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16798 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16798 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540367 () Bool)

(declare-fun res!335413 () Bool)

(assert (=> b!540367 (=> (not res!335413) (not e!313045))))

(assert (=> b!540367 (= res!335413 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16798 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16798 a!3154)) (= (select (arr!16434 a!3154) resIndex!32) (select (arr!16434 a!3154) j!147))))))

(declare-fun b!540368 () Bool)

(declare-fun res!335412 () Bool)

(assert (=> b!540368 (=> (not res!335412) (not e!313045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34193 (_ BitVec 32)) Bool)

(assert (=> b!540368 (= res!335412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49032 res!335411) b!540366))

(assert (= (and b!540366 res!335407) b!540364))

(assert (= (and b!540364 res!335414) b!540361))

(assert (= (and b!540361 res!335408) b!540359))

(assert (= (and b!540359 res!335406) b!540363))

(assert (= (and b!540363 res!335410) b!540368))

(assert (= (and b!540368 res!335412) b!540365))

(assert (= (and b!540365 res!335409) b!540367))

(assert (= (and b!540367 res!335413) b!540362))

(assert (= (and b!540362 res!335404) b!540358))

(assert (= (and b!540358 res!335405) b!540360))

(declare-fun m!519165 () Bool)

(assert (=> b!540359 m!519165))

(declare-fun m!519167 () Bool)

(assert (=> b!540365 m!519167))

(declare-fun m!519169 () Bool)

(assert (=> b!540364 m!519169))

(assert (=> b!540364 m!519169))

(declare-fun m!519171 () Bool)

(assert (=> b!540364 m!519171))

(declare-fun m!519173 () Bool)

(assert (=> b!540368 m!519173))

(declare-fun m!519175 () Bool)

(assert (=> b!540363 m!519175))

(assert (=> b!540362 m!519169))

(assert (=> b!540362 m!519169))

(declare-fun m!519177 () Bool)

(assert (=> b!540362 m!519177))

(declare-fun m!519179 () Bool)

(assert (=> b!540361 m!519179))

(declare-fun m!519181 () Bool)

(assert (=> b!540360 m!519181))

(declare-fun m!519183 () Bool)

(assert (=> b!540367 m!519183))

(assert (=> b!540367 m!519169))

(assert (=> b!540358 m!519169))

(assert (=> b!540358 m!519169))

(declare-fun m!519185 () Bool)

(assert (=> b!540358 m!519185))

(assert (=> b!540358 m!519185))

(assert (=> b!540358 m!519169))

(declare-fun m!519187 () Bool)

(assert (=> b!540358 m!519187))

(declare-fun m!519189 () Bool)

(assert (=> start!49032 m!519189))

(declare-fun m!519191 () Bool)

(assert (=> start!49032 m!519191))

(push 1)

(assert (not b!540361))

(assert (not b!540358))

(assert (not b!540362))

(assert (not b!540363))

(assert (not b!540359))

(assert (not b!540365))

(assert (not b!540364))

(assert (not start!49032))

(assert (not b!540368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81669 () Bool)

(assert (=> d!81669 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49032 d!81669))

(declare-fun d!81681 () Bool)

(assert (=> d!81681 (= (array_inv!12230 a!3154) (bvsge (size!16798 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49032 d!81681))

(declare-fun d!81683 () Bool)

(assert (=> d!81683 (= (validKeyInArray!0 (select (arr!16434 a!3154) j!147)) (and (not (= (select (arr!16434 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16434 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!540364 d!81683))

(declare-fun d!81685 () Bool)

(declare-fun res!335500 () Bool)

(declare-fun e!313097 () Bool)

(assert (=> d!81685 (=> res!335500 e!313097)))

(assert (=> d!81685 (= res!335500 (= (select (arr!16434 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81685 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!313097)))

(declare-fun b!540472 () Bool)

(declare-fun e!313098 () Bool)

(assert (=> b!540472 (= e!313097 e!313098)))

(declare-fun res!335501 () Bool)

(assert (=> b!540472 (=> (not res!335501) (not e!313098))))

(assert (=> b!540472 (= res!335501 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16798 a!3154)))))

(declare-fun b!540473 () Bool)

(assert (=> b!540473 (= e!313098 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81685 (not res!335500)) b!540472))

(assert (= (and b!540472 res!335501) b!540473))

(declare-fun m!519259 () Bool)

(assert (=> d!81685 m!519259))

(declare-fun m!519261 () Bool)

(assert (=> b!540473 m!519261))

(assert (=> b!540359 d!81685))

(declare-fun bm!32015 () Bool)

(declare-fun call!32018 () Bool)

(declare-fun c!62801 () Bool)

(assert (=> bm!32015 (= call!32018 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62801 (Cons!10549 (select (arr!16434 a!3154) #b00000000000000000000000000000000) Nil!10550) Nil!10550)))))

(declare-fun b!540484 () Bool)

(declare-fun e!313107 () Bool)

(declare-fun e!313109 () Bool)

(assert (=> b!540484 (= e!313107 e!313109)))

(declare-fun res!335510 () Bool)

(assert (=> b!540484 (=> (not res!335510) (not e!313109))))

(declare-fun e!313110 () Bool)

(assert (=> b!540484 (= res!335510 (not e!313110))))

(declare-fun res!335508 () Bool)

(assert (=> b!540484 (=> (not res!335508) (not e!313110))))

(assert (=> b!540484 (= res!335508 (validKeyInArray!0 (select (arr!16434 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81693 () Bool)

(declare-fun res!335509 () Bool)

(assert (=> d!81693 (=> res!335509 e!313107)))

(assert (=> d!81693 (= res!335509 (bvsge #b00000000000000000000000000000000 (size!16798 a!3154)))))

(assert (=> d!81693 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10550) e!313107)))

(declare-fun b!540485 () Bool)

(declare-fun e!313108 () Bool)

(assert (=> b!540485 (= e!313108 call!32018)))

(declare-fun b!540486 () Bool)

(assert (=> b!540486 (= e!313108 call!32018)))

(declare-fun b!540487 () Bool)

(declare-fun contains!2797 (List!10553 (_ BitVec 64)) Bool)

(assert (=> b!540487 (= e!313110 (contains!2797 Nil!10550 (select (arr!16434 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!540488 () Bool)

(assert (=> b!540488 (= e!313109 e!313108)))

(assert (=> b!540488 (= c!62801 (validKeyInArray!0 (select (arr!16434 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81693 (not res!335509)) b!540484))

(assert (= (and b!540484 res!335508) b!540487))

(assert (= (and b!540484 res!335510) b!540488))

(assert (= (and b!540488 c!62801) b!540486))

(assert (= (and b!540488 (not c!62801)) b!540485))

(assert (= (or b!540486 b!540485) bm!32015))

(assert (=> bm!32015 m!519259))

(declare-fun m!519263 () Bool)

(assert (=> bm!32015 m!519263))

(assert (=> b!540484 m!519259))

(assert (=> b!540484 m!519259))

(declare-fun m!519265 () Bool)

(assert (=> b!540484 m!519265))

(assert (=> b!540487 m!519259))

(assert (=> b!540487 m!519259))

(declare-fun m!519267 () Bool)

(assert (=> b!540487 m!519267))

(assert (=> b!540488 m!519259))

(assert (=> b!540488 m!519259))

(assert (=> b!540488 m!519265))

(assert (=> b!540365 d!81693))

(declare-fun d!81695 () Bool)

(assert (=> d!81695 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!540361 d!81695))

(declare-fun b!540582 () Bool)

(declare-fun e!313169 () Bool)

(declare-fun e!313173 () Bool)

(assert (=> b!540582 (= e!313169 e!313173)))

(declare-fun res!335546 () Bool)

(declare-fun lt!247401 () SeekEntryResult!4892)

(assert (=> b!540582 (= res!335546 (and (is-Intermediate!4892 lt!247401) (not (undefined!5704 lt!247401)) (bvslt (x!50705 lt!247401) #b01111111111111111111111111111110) (bvsge (x!50705 lt!247401) #b00000000000000000000000000000000) (bvsge (x!50705 lt!247401) x!1030)))))

(assert (=> b!540582 (=> (not res!335546) (not e!313173))))

(declare-fun b!540583 () Bool)

(declare-fun e!313170 () SeekEntryResult!4892)

(assert (=> b!540583 (= e!313170 (Intermediate!4892 false index!1177 x!1030))))

(declare-fun b!540584 () Bool)

(declare-fun e!313172 () SeekEntryResult!4892)

(assert (=> b!540584 (= e!313172 (Intermediate!4892 true index!1177 x!1030))))

(declare-fun b!540585 () Bool)

(assert (=> b!540585 (and (bvsge (index!21794 lt!247401) #b00000000000000000000000000000000) (bvslt (index!21794 lt!247401) (size!16798 a!3154)))))

(declare-fun res!335544 () Bool)

(assert (=> b!540585 (= res!335544 (= (select (arr!16434 a!3154) (index!21794 lt!247401)) (select (arr!16434 a!3154) j!147)))))

(declare-fun e!313171 () Bool)

(assert (=> b!540585 (=> res!335544 e!313171)))

(assert (=> b!540585 (= e!313173 e!313171)))

(declare-fun b!540586 () Bool)

(assert (=> b!540586 (= e!313169 (bvsge (x!50705 lt!247401) #b01111111111111111111111111111110))))

(declare-fun b!540587 () Bool)

(assert (=> b!540587 (and (bvsge (index!21794 lt!247401) #b00000000000000000000000000000000) (bvslt (index!21794 lt!247401) (size!16798 a!3154)))))

(assert (=> b!540587 (= e!313171 (= (select (arr!16434 a!3154) (index!21794 lt!247401)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!540588 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540588 (= e!313170 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16434 a!3154) j!147) a!3154 mask!3216))))

(declare-fun d!81697 () Bool)

(assert (=> d!81697 e!313169))

(declare-fun c!62832 () Bool)

(assert (=> d!81697 (= c!62832 (and (is-Intermediate!4892 lt!247401) (undefined!5704 lt!247401)))))

(assert (=> d!81697 (= lt!247401 e!313172)))

(declare-fun c!62834 () Bool)

(assert (=> d!81697 (= c!62834 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!247402 () (_ BitVec 64))

(assert (=> d!81697 (= lt!247402 (select (arr!16434 a!3154) index!1177))))

(assert (=> d!81697 (validMask!0 mask!3216)))

(assert (=> d!81697 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16434 a!3154) j!147) a!3154 mask!3216) lt!247401)))

(declare-fun b!540589 () Bool)

(assert (=> b!540589 (= e!313172 e!313170)))

(declare-fun c!62833 () Bool)

(assert (=> b!540589 (= c!62833 (or (= lt!247402 (select (arr!16434 a!3154) j!147)) (= (bvadd lt!247402 lt!247402) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!540590 () Bool)

(assert (=> b!540590 (and (bvsge (index!21794 lt!247401) #b00000000000000000000000000000000) (bvslt (index!21794 lt!247401) (size!16798 a!3154)))))

(declare-fun res!335545 () Bool)

(assert (=> b!540590 (= res!335545 (= (select (arr!16434 a!3154) (index!21794 lt!247401)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!540590 (=> res!335545 e!313171)))

(assert (= (and d!81697 c!62834) b!540584))

(assert (= (and d!81697 (not c!62834)) b!540589))

(assert (= (and b!540589 c!62833) b!540583))

(assert (= (and b!540589 (not c!62833)) b!540588))

(assert (= (and d!81697 c!62832) b!540586))

(assert (= (and d!81697 (not c!62832)) b!540582))

(assert (= (and b!540582 res!335546) b!540585))

(assert (= (and b!540585 (not res!335544)) b!540590))

(assert (= (and b!540590 (not res!335545)) b!540587))

(declare-fun m!519303 () Bool)

(assert (=> b!540587 m!519303))

(assert (=> b!540585 m!519303))

(declare-fun m!519305 () Bool)

(assert (=> b!540588 m!519305))

(assert (=> b!540588 m!519305))

(assert (=> b!540588 m!519169))

(declare-fun m!519307 () Bool)

(assert (=> b!540588 m!519307))

(assert (=> d!81697 m!519181))

(assert (=> d!81697 m!519189))

(assert (=> b!540590 m!519303))

(assert (=> b!540362 d!81697))

(declare-fun b!540622 () Bool)

(declare-fun e!313198 () Bool)

(declare-fun e!313199 () Bool)

(assert (=> b!540622 (= e!313198 e!313199)))

(declare-fun lt!247423 () (_ BitVec 64))

(assert (=> b!540622 (= lt!247423 (select (arr!16434 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16892 0))(
  ( (Unit!16893) )
))
(declare-fun lt!247421 () Unit!16892)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34193 (_ BitVec 64) (_ BitVec 32)) Unit!16892)

(assert (=> b!540622 (= lt!247421 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!247423 #b00000000000000000000000000000000))))

(assert (=> b!540622 (arrayContainsKey!0 a!3154 lt!247423 #b00000000000000000000000000000000)))

(declare-fun lt!247422 () Unit!16892)

(assert (=> b!540622 (= lt!247422 lt!247421)))

(declare-fun res!335565 () Bool)

(assert (=> b!540622 (= res!335565 (= (seekEntryOrOpen!0 (select (arr!16434 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4892 #b00000000000000000000000000000000)))))

(assert (=> b!540622 (=> (not res!335565) (not e!313199))))

(declare-fun bm!32026 () Bool)

(declare-fun call!32029 () Bool)

(assert (=> bm!32026 (= call!32029 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!540623 () Bool)

(assert (=> b!540623 (= e!313198 call!32029)))

(declare-fun b!540624 () Bool)

(assert (=> b!540624 (= e!313199 call!32029)))

(declare-fun d!81707 () Bool)

(declare-fun res!335566 () Bool)

(declare-fun e!313197 () Bool)

(assert (=> d!81707 (=> res!335566 e!313197)))

(assert (=> d!81707 (= res!335566 (bvsge #b00000000000000000000000000000000 (size!16798 a!3154)))))

(assert (=> d!81707 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!313197)))

(declare-fun b!540625 () Bool)

(assert (=> b!540625 (= e!313197 e!313198)))

(declare-fun c!62842 () Bool)

(assert (=> b!540625 (= c!62842 (validKeyInArray!0 (select (arr!16434 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81707 (not res!335566)) b!540625))

(assert (= (and b!540625 c!62842) b!540622))

(assert (= (and b!540625 (not c!62842)) b!540623))

(assert (= (and b!540622 res!335565) b!540624))

(assert (= (or b!540624 b!540623) bm!32026))

(assert (=> b!540622 m!519259))

(declare-fun m!519319 () Bool)

(assert (=> b!540622 m!519319))

(declare-fun m!519321 () Bool)

(assert (=> b!540622 m!519321))

(assert (=> b!540622 m!519259))

(declare-fun m!519323 () Bool)

(assert (=> b!540622 m!519323))

(declare-fun m!519325 () Bool)

(assert (=> bm!32026 m!519325))

(assert (=> b!540625 m!519259))

(assert (=> b!540625 m!519259))

(assert (=> b!540625 m!519265))

(assert (=> b!540368 d!81707))

(declare-fun b!540663 () Bool)

(declare-fun e!313225 () SeekEntryResult!4892)

(assert (=> b!540663 (= e!313225 Undefined!4892)))

(declare-fun b!540664 () Bool)

(declare-fun e!313223 () SeekEntryResult!4892)

(declare-fun lt!247452 () SeekEntryResult!4892)

(assert (=> b!540664 (= e!313223 (Found!4892 (index!21794 lt!247452)))))

(declare-fun e!313224 () SeekEntryResult!4892)

(declare-fun b!540665 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34193 (_ BitVec 32)) SeekEntryResult!4892)

(assert (=> b!540665 (= e!313224 (seekKeyOrZeroReturnVacant!0 (x!50705 lt!247452) (index!21794 lt!247452) (index!21794 lt!247452) k!1998 a!3154 mask!3216))))

(declare-fun b!540666 () Bool)

(declare-fun c!62857 () Bool)

(declare-fun lt!247454 () (_ BitVec 64))

(assert (=> b!540666 (= c!62857 (= lt!247454 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!540666 (= e!313223 e!313224)))

(declare-fun d!81719 () Bool)

(declare-fun lt!247453 () SeekEntryResult!4892)

(assert (=> d!81719 (and (or (is-Undefined!4892 lt!247453) (not (is-Found!4892 lt!247453)) (and (bvsge (index!21793 lt!247453) #b00000000000000000000000000000000) (bvslt (index!21793 lt!247453) (size!16798 a!3154)))) (or (is-Undefined!4892 lt!247453) (is-Found!4892 lt!247453) (not (is-MissingZero!4892 lt!247453)) (and (bvsge (index!21792 lt!247453) #b00000000000000000000000000000000) (bvslt (index!21792 lt!247453) (size!16798 a!3154)))) (or (is-Undefined!4892 lt!247453) (is-Found!4892 lt!247453) (is-MissingZero!4892 lt!247453) (not (is-MissingVacant!4892 lt!247453)) (and (bvsge (index!21795 lt!247453) #b00000000000000000000000000000000) (bvslt (index!21795 lt!247453) (size!16798 a!3154)))) (or (is-Undefined!4892 lt!247453) (ite (is-Found!4892 lt!247453) (= (select (arr!16434 a!3154) (index!21793 lt!247453)) k!1998) (ite (is-MissingZero!4892 lt!247453) (= (select (arr!16434 a!3154) (index!21792 lt!247453)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4892 lt!247453) (= (select (arr!16434 a!3154) (index!21795 lt!247453)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81719 (= lt!247453 e!313225)))

(declare-fun c!62858 () Bool)

(assert (=> d!81719 (= c!62858 (and (is-Intermediate!4892 lt!247452) (undefined!5704 lt!247452)))))

(assert (=> d!81719 (= lt!247452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81719 (validMask!0 mask!3216)))

(assert (=> d!81719 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!247453)))

(declare-fun b!540667 () Bool)

(assert (=> b!540667 (= e!313225 e!313223)))

(assert (=> b!540667 (= lt!247454 (select (arr!16434 a!3154) (index!21794 lt!247452)))))

(declare-fun c!62856 () Bool)

(assert (=> b!540667 (= c!62856 (= lt!247454 k!1998))))

(declare-fun b!540668 () Bool)

(assert (=> b!540668 (= e!313224 (MissingZero!4892 (index!21794 lt!247452)))))

(assert (= (and d!81719 c!62858) b!540663))

(assert (= (and d!81719 (not c!62858)) b!540667))

(assert (= (and b!540667 c!62856) b!540664))

(assert (= (and b!540667 (not c!62856)) b!540666))

(assert (= (and b!540666 c!62857) b!540668))

(assert (= (and b!540666 (not c!62857)) b!540665))

