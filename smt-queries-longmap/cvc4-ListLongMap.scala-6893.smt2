; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86670 () Bool)

(assert start!86670)

(declare-fun b!1004997 () Bool)

(declare-fun e!565917 () Bool)

(declare-fun e!565921 () Bool)

(assert (=> b!1004997 (= e!565917 e!565921)))

(declare-fun res!674283 () Bool)

(assert (=> b!1004997 (=> (not res!674283) (not e!565921))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!444405 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9466 0))(
  ( (MissingZero!9466 (index!40235 (_ BitVec 32))) (Found!9466 (index!40236 (_ BitVec 32))) (Intermediate!9466 (undefined!10278 Bool) (index!40237 (_ BitVec 32)) (x!87636 (_ BitVec 32))) (Undefined!9466) (MissingVacant!9466 (index!40238 (_ BitVec 32))) )
))
(declare-fun lt!444403 () SeekEntryResult!9466)

(declare-datatypes ((array!63420 0))(
  ( (array!63421 (arr!30534 (Array (_ BitVec 32) (_ BitVec 64))) (size!31036 (_ BitVec 32))) )
))
(declare-fun lt!444404 () array!63420)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63420 (_ BitVec 32)) SeekEntryResult!9466)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004997 (= res!674283 (not (= lt!444403 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444405 mask!3464) lt!444405 lt!444404 mask!3464))))))

(declare-fun a!3219 () array!63420)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1004997 (= lt!444405 (select (store (arr!30534 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1004997 (= lt!444404 (array!63421 (store (arr!30534 a!3219) i!1194 k!2224) (size!31036 a!3219)))))

(declare-fun b!1004998 () Bool)

(declare-fun res!674280 () Bool)

(declare-fun e!565920 () Bool)

(assert (=> b!1004998 (=> (not res!674280) (not e!565920))))

(declare-datatypes ((List!21210 0))(
  ( (Nil!21207) (Cons!21206 (h!22386 (_ BitVec 64)) (t!30211 List!21210)) )
))
(declare-fun arrayNoDuplicates!0 (array!63420 (_ BitVec 32) List!21210) Bool)

(assert (=> b!1004998 (= res!674280 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21207))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun b!1004999 () Bool)

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1004999 (= e!565921 (and (not (= index!1507 resIndex!38)) (= index!1507 i!1194)))))

(declare-fun b!1005000 () Bool)

(declare-fun res!674292 () Bool)

(declare-fun e!565918 () Bool)

(assert (=> b!1005000 (=> (not res!674292) (not e!565918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005000 (= res!674292 (validKeyInArray!0 k!2224))))

(declare-fun b!1005001 () Bool)

(declare-fun res!674282 () Bool)

(assert (=> b!1005001 (=> (not res!674282) (not e!565918))))

(declare-fun arrayContainsKey!0 (array!63420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005001 (= res!674282 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005002 () Bool)

(assert (=> b!1005002 (= e!565918 e!565920)))

(declare-fun res!674285 () Bool)

(assert (=> b!1005002 (=> (not res!674285) (not e!565920))))

(declare-fun lt!444407 () SeekEntryResult!9466)

(assert (=> b!1005002 (= res!674285 (or (= lt!444407 (MissingVacant!9466 i!1194)) (= lt!444407 (MissingZero!9466 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63420 (_ BitVec 32)) SeekEntryResult!9466)

(assert (=> b!1005002 (= lt!444407 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!674287 () Bool)

(assert (=> start!86670 (=> (not res!674287) (not e!565918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86670 (= res!674287 (validMask!0 mask!3464))))

(assert (=> start!86670 e!565918))

(declare-fun array_inv!23658 (array!63420) Bool)

(assert (=> start!86670 (array_inv!23658 a!3219)))

(assert (=> start!86670 true))

(declare-fun b!1005003 () Bool)

(declare-fun res!674290 () Bool)

(assert (=> b!1005003 (=> (not res!674290) (not e!565918))))

(assert (=> b!1005003 (= res!674290 (validKeyInArray!0 (select (arr!30534 a!3219) j!170)))))

(declare-fun b!1005004 () Bool)

(declare-fun res!674291 () Bool)

(assert (=> b!1005004 (=> (not res!674291) (not e!565918))))

(assert (=> b!1005004 (= res!674291 (and (= (size!31036 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31036 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31036 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005005 () Bool)

(declare-fun e!565919 () Bool)

(assert (=> b!1005005 (= e!565920 e!565919)))

(declare-fun res!674286 () Bool)

(assert (=> b!1005005 (=> (not res!674286) (not e!565919))))

(declare-fun lt!444406 () SeekEntryResult!9466)

(assert (=> b!1005005 (= res!674286 (= lt!444403 lt!444406))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005005 (= lt!444406 (Intermediate!9466 false resIndex!38 resX!38))))

(assert (=> b!1005005 (= lt!444403 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30534 a!3219) j!170) mask!3464) (select (arr!30534 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005006 () Bool)

(declare-fun res!674281 () Bool)

(assert (=> b!1005006 (=> (not res!674281) (not e!565920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63420 (_ BitVec 32)) Bool)

(assert (=> b!1005006 (= res!674281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005007 () Bool)

(assert (=> b!1005007 (= e!565919 e!565917)))

(declare-fun res!674284 () Bool)

(assert (=> b!1005007 (=> (not res!674284) (not e!565917))))

(declare-fun lt!444402 () SeekEntryResult!9466)

(assert (=> b!1005007 (= res!674284 (= lt!444402 lt!444406))))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1005007 (= lt!444402 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30534 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005008 () Bool)

(declare-fun res!674288 () Bool)

(assert (=> b!1005008 (=> (not res!674288) (not e!565921))))

(assert (=> b!1005008 (= res!674288 (not (= lt!444402 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444405 lt!444404 mask!3464))))))

(declare-fun b!1005009 () Bool)

(declare-fun res!674289 () Bool)

(assert (=> b!1005009 (=> (not res!674289) (not e!565920))))

(assert (=> b!1005009 (= res!674289 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31036 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31036 a!3219))))))

(assert (= (and start!86670 res!674287) b!1005004))

(assert (= (and b!1005004 res!674291) b!1005003))

(assert (= (and b!1005003 res!674290) b!1005000))

(assert (= (and b!1005000 res!674292) b!1005001))

(assert (= (and b!1005001 res!674282) b!1005002))

(assert (= (and b!1005002 res!674285) b!1005006))

(assert (= (and b!1005006 res!674281) b!1004998))

(assert (= (and b!1004998 res!674280) b!1005009))

(assert (= (and b!1005009 res!674289) b!1005005))

(assert (= (and b!1005005 res!674286) b!1005007))

(assert (= (and b!1005007 res!674284) b!1004997))

(assert (= (and b!1004997 res!674283) b!1005008))

(assert (= (and b!1005008 res!674288) b!1004999))

(declare-fun m!930385 () Bool)

(assert (=> b!1005002 m!930385))

(declare-fun m!930387 () Bool)

(assert (=> b!1005006 m!930387))

(declare-fun m!930389 () Bool)

(assert (=> b!1005008 m!930389))

(declare-fun m!930391 () Bool)

(assert (=> b!1005001 m!930391))

(declare-fun m!930393 () Bool)

(assert (=> b!1005003 m!930393))

(assert (=> b!1005003 m!930393))

(declare-fun m!930395 () Bool)

(assert (=> b!1005003 m!930395))

(declare-fun m!930397 () Bool)

(assert (=> start!86670 m!930397))

(declare-fun m!930399 () Bool)

(assert (=> start!86670 m!930399))

(declare-fun m!930401 () Bool)

(assert (=> b!1005000 m!930401))

(declare-fun m!930403 () Bool)

(assert (=> b!1004998 m!930403))

(declare-fun m!930405 () Bool)

(assert (=> b!1004997 m!930405))

(assert (=> b!1004997 m!930405))

(declare-fun m!930407 () Bool)

(assert (=> b!1004997 m!930407))

(declare-fun m!930409 () Bool)

(assert (=> b!1004997 m!930409))

(declare-fun m!930411 () Bool)

(assert (=> b!1004997 m!930411))

(assert (=> b!1005005 m!930393))

(assert (=> b!1005005 m!930393))

(declare-fun m!930413 () Bool)

(assert (=> b!1005005 m!930413))

(assert (=> b!1005005 m!930413))

(assert (=> b!1005005 m!930393))

(declare-fun m!930415 () Bool)

(assert (=> b!1005005 m!930415))

(assert (=> b!1005007 m!930393))

(assert (=> b!1005007 m!930393))

(declare-fun m!930417 () Bool)

(assert (=> b!1005007 m!930417))

(push 1)

(assert (not b!1005003))

(assert (not b!1005001))

(assert (not b!1005002))

(assert (not b!1004998))

(assert (not b!1005000))

(assert (not start!86670))

(assert (not b!1005008))

(assert (not b!1005005))

(assert (not b!1005007))

(assert (not b!1004997))

(assert (not b!1005006))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!42332 () Bool)

(declare-fun call!42335 () Bool)

(declare-fun c!101522 () Bool)

(assert (=> bm!42332 (= call!42335 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101522 (Cons!21206 (select (arr!30534 a!3219) #b00000000000000000000000000000000) Nil!21207) Nil!21207)))))

(declare-fun b!1005053 () Bool)

(declare-fun e!565952 () Bool)

(assert (=> b!1005053 (= e!565952 call!42335)))

(declare-fun b!1005054 () Bool)

(assert (=> b!1005054 (= e!565952 call!42335)))

(declare-fun b!1005055 () Bool)

(declare-fun e!565953 () Bool)

(declare-fun e!565954 () Bool)

(assert (=> b!1005055 (= e!565953 e!565954)))

(declare-fun res!674309 () Bool)

(assert (=> b!1005055 (=> (not res!674309) (not e!565954))))

(declare-fun e!565951 () Bool)

(assert (=> b!1005055 (= res!674309 (not e!565951))))

(declare-fun res!674310 () Bool)

(assert (=> b!1005055 (=> (not res!674310) (not e!565951))))

(assert (=> b!1005055 (= res!674310 (validKeyInArray!0 (select (arr!30534 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1005056 () Bool)

(declare-fun contains!5884 (List!21210 (_ BitVec 64)) Bool)

(assert (=> b!1005056 (= e!565951 (contains!5884 Nil!21207 (select (arr!30534 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1005057 () Bool)

(assert (=> b!1005057 (= e!565954 e!565952)))

(assert (=> b!1005057 (= c!101522 (validKeyInArray!0 (select (arr!30534 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119505 () Bool)

(declare-fun res!674308 () Bool)

(assert (=> d!119505 (=> res!674308 e!565953)))

(assert (=> d!119505 (= res!674308 (bvsge #b00000000000000000000000000000000 (size!31036 a!3219)))))

(assert (=> d!119505 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21207) e!565953)))

(assert (= (and d!119505 (not res!674308)) b!1005055))

(assert (= (and b!1005055 res!674310) b!1005056))

(assert (= (and b!1005055 res!674309) b!1005057))

(assert (= (and b!1005057 c!101522) b!1005054))

(assert (= (and b!1005057 (not c!101522)) b!1005053))

(assert (= (or b!1005054 b!1005053) bm!42332))

(declare-fun m!930439 () Bool)

(assert (=> bm!42332 m!930439))

(declare-fun m!930443 () Bool)

(assert (=> bm!42332 m!930443))

(assert (=> b!1005055 m!930439))

(assert (=> b!1005055 m!930439))

(declare-fun m!930445 () Bool)

(assert (=> b!1005055 m!930445))

(assert (=> b!1005056 m!930439))

(assert (=> b!1005056 m!930439))

(declare-fun m!930447 () Bool)

(assert (=> b!1005056 m!930447))

(assert (=> b!1005057 m!930439))

(assert (=> b!1005057 m!930439))

(assert (=> b!1005057 m!930445))

(assert (=> b!1004998 d!119505))

(declare-fun d!119509 () Bool)

(assert (=> d!119509 (= (validKeyInArray!0 (select (arr!30534 a!3219) j!170)) (and (not (= (select (arr!30534 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30534 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1005003 d!119509))

(declare-fun b!1005121 () Bool)

(declare-fun e!565992 () SeekEntryResult!9466)

(assert (=> b!1005121 (= e!565992 (Intermediate!9466 true index!1507 x!1245))))

(declare-fun d!119511 () Bool)

(declare-fun e!565991 () Bool)

(assert (=> d!119511 e!565991))

(declare-fun c!101546 () Bool)

(declare-fun lt!444432 () SeekEntryResult!9466)

(assert (=> d!119511 (= c!101546 (and (is-Intermediate!9466 lt!444432) (undefined!10278 lt!444432)))))

(assert (=> d!119511 (= lt!444432 e!565992)))

(declare-fun c!101545 () Bool)

(assert (=> d!119511 (= c!101545 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!444431 () (_ BitVec 64))

(assert (=> d!119511 (= lt!444431 (select (arr!30534 lt!444404) index!1507))))

(assert (=> d!119511 (validMask!0 mask!3464)))

(assert (=> d!119511 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444405 lt!444404 mask!3464) lt!444432)))

(declare-fun b!1005122 () Bool)

(declare-fun e!565990 () SeekEntryResult!9466)

(assert (=> b!1005122 (= e!565990 (Intermediate!9466 false index!1507 x!1245))))

(declare-fun b!1005123 () Bool)

(assert (=> b!1005123 (= e!565992 e!565990)))

(declare-fun c!101544 () Bool)

(assert (=> b!1005123 (= c!101544 (or (= lt!444431 lt!444405) (= (bvadd lt!444431 lt!444431) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1005124 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005124 (= e!565990 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!444405 lt!444404 mask!3464))))

(declare-fun b!1005125 () Bool)

(assert (=> b!1005125 (= e!565991 (bvsge (x!87636 lt!444432) #b01111111111111111111111111111110))))

(declare-fun b!1005126 () Bool)

(assert (=> b!1005126 (and (bvsge (index!40237 lt!444432) #b00000000000000000000000000000000) (bvslt (index!40237 lt!444432) (size!31036 lt!444404)))))

(declare-fun e!565994 () Bool)

(assert (=> b!1005126 (= e!565994 (= (select (arr!30534 lt!444404) (index!40237 lt!444432)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1005127 () Bool)

(declare-fun e!565993 () Bool)

(assert (=> b!1005127 (= e!565991 e!565993)))

(declare-fun res!674334 () Bool)

(assert (=> b!1005127 (= res!674334 (and (is-Intermediate!9466 lt!444432) (not (undefined!10278 lt!444432)) (bvslt (x!87636 lt!444432) #b01111111111111111111111111111110) (bvsge (x!87636 lt!444432) #b00000000000000000000000000000000) (bvsge (x!87636 lt!444432) x!1245)))))

(assert (=> b!1005127 (=> (not res!674334) (not e!565993))))

(declare-fun b!1005128 () Bool)

(assert (=> b!1005128 (and (bvsge (index!40237 lt!444432) #b00000000000000000000000000000000) (bvslt (index!40237 lt!444432) (size!31036 lt!444404)))))

(declare-fun res!674333 () Bool)

(assert (=> b!1005128 (= res!674333 (= (select (arr!30534 lt!444404) (index!40237 lt!444432)) lt!444405))))

(assert (=> b!1005128 (=> res!674333 e!565994)))

(assert (=> b!1005128 (= e!565993 e!565994)))

(declare-fun b!1005129 () Bool)

(assert (=> b!1005129 (and (bvsge (index!40237 lt!444432) #b00000000000000000000000000000000) (bvslt (index!40237 lt!444432) (size!31036 lt!444404)))))

(declare-fun res!674332 () Bool)

(assert (=> b!1005129 (= res!674332 (= (select (arr!30534 lt!444404) (index!40237 lt!444432)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1005129 (=> res!674332 e!565994)))

(assert (= (and d!119511 c!101545) b!1005121))

(assert (= (and d!119511 (not c!101545)) b!1005123))

(assert (= (and b!1005123 c!101544) b!1005122))

(assert (= (and b!1005123 (not c!101544)) b!1005124))

(assert (= (and d!119511 c!101546) b!1005125))

(assert (= (and d!119511 (not c!101546)) b!1005127))

(assert (= (and b!1005127 res!674334) b!1005128))

(assert (= (and b!1005128 (not res!674333)) b!1005129))

(assert (= (and b!1005129 (not res!674332)) b!1005126))

(declare-fun m!930457 () Bool)

(assert (=> d!119511 m!930457))

(assert (=> d!119511 m!930397))

(declare-fun m!930459 () Bool)

(assert (=> b!1005128 m!930459))

(declare-fun m!930461 () Bool)

(assert (=> b!1005124 m!930461))

(assert (=> b!1005124 m!930461))

(declare-fun m!930463 () Bool)

(assert (=> b!1005124 m!930463))

(assert (=> b!1005126 m!930459))

(assert (=> b!1005129 m!930459))

(assert (=> b!1005008 d!119511))

(declare-fun b!1005130 () Bool)

(declare-fun e!565997 () SeekEntryResult!9466)

(assert (=> b!1005130 (= e!565997 (Intermediate!9466 true (toIndex!0 lt!444405 mask!3464) #b00000000000000000000000000000000))))

(declare-fun d!119517 () Bool)

(declare-fun e!565996 () Bool)

(assert (=> d!119517 e!565996))

(declare-fun c!101549 () Bool)

(declare-fun lt!444434 () SeekEntryResult!9466)

(assert (=> d!119517 (= c!101549 (and (is-Intermediate!9466 lt!444434) (undefined!10278 lt!444434)))))

(assert (=> d!119517 (= lt!444434 e!565997)))

(declare-fun c!101548 () Bool)

(assert (=> d!119517 (= c!101548 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!444433 () (_ BitVec 64))

(assert (=> d!119517 (= lt!444433 (select (arr!30534 lt!444404) (toIndex!0 lt!444405 mask!3464)))))

(assert (=> d!119517 (validMask!0 mask!3464)))

(assert (=> d!119517 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444405 mask!3464) lt!444405 lt!444404 mask!3464) lt!444434)))

(declare-fun b!1005131 () Bool)

(declare-fun e!565995 () SeekEntryResult!9466)

(assert (=> b!1005131 (= e!565995 (Intermediate!9466 false (toIndex!0 lt!444405 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1005132 () Bool)

(assert (=> b!1005132 (= e!565997 e!565995)))

(declare-fun c!101547 () Bool)

(assert (=> b!1005132 (= c!101547 (or (= lt!444433 lt!444405) (= (bvadd lt!444433 lt!444433) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1005133 () Bool)

(assert (=> b!1005133 (= e!565995 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!444405 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!444405 lt!444404 mask!3464))))

(declare-fun b!1005134 () Bool)

(assert (=> b!1005134 (= e!565996 (bvsge (x!87636 lt!444434) #b01111111111111111111111111111110))))

(declare-fun b!1005135 () Bool)

(assert (=> b!1005135 (and (bvsge (index!40237 lt!444434) #b00000000000000000000000000000000) (bvslt (index!40237 lt!444434) (size!31036 lt!444404)))))

(declare-fun e!565999 () Bool)

(assert (=> b!1005135 (= e!565999 (= (select (arr!30534 lt!444404) (index!40237 lt!444434)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1005136 () Bool)

(declare-fun e!565998 () Bool)

(assert (=> b!1005136 (= e!565996 e!565998)))

(declare-fun res!674338 () Bool)

(assert (=> b!1005136 (= res!674338 (and (is-Intermediate!9466 lt!444434) (not (undefined!10278 lt!444434)) (bvslt (x!87636 lt!444434) #b01111111111111111111111111111110) (bvsge (x!87636 lt!444434) #b00000000000000000000000000000000) (bvsge (x!87636 lt!444434) #b00000000000000000000000000000000)))))

(assert (=> b!1005136 (=> (not res!674338) (not e!565998))))

(declare-fun b!1005137 () Bool)

(assert (=> b!1005137 (and (bvsge (index!40237 lt!444434) #b00000000000000000000000000000000) (bvslt (index!40237 lt!444434) (size!31036 lt!444404)))))

(declare-fun res!674337 () Bool)

(assert (=> b!1005137 (= res!674337 (= (select (arr!30534 lt!444404) (index!40237 lt!444434)) lt!444405))))

(assert (=> b!1005137 (=> res!674337 e!565999)))

(assert (=> b!1005137 (= e!565998 e!565999)))

(declare-fun b!1005138 () Bool)

(assert (=> b!1005138 (and (bvsge (index!40237 lt!444434) #b00000000000000000000000000000000) (bvslt (index!40237 lt!444434) (size!31036 lt!444404)))))

(declare-fun res!674336 () Bool)

(assert (=> b!1005138 (= res!674336 (= (select (arr!30534 lt!444404) (index!40237 lt!444434)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1005138 (=> res!674336 e!565999)))

(assert (= (and d!119517 c!101548) b!1005130))

(assert (= (and d!119517 (not c!101548)) b!1005132))

(assert (= (and b!1005132 c!101547) b!1005131))

(assert (= (and b!1005132 (not c!101547)) b!1005133))

(assert (= (and d!119517 c!101549) b!1005134))

(assert (= (and d!119517 (not c!101549)) b!1005136))

(assert (= (and b!1005136 res!674338) b!1005137))

(assert (= (and b!1005137 (not res!674337)) b!1005138))

(assert (= (and b!1005138 (not res!674336)) b!1005135))

(assert (=> d!119517 m!930405))

(declare-fun m!930465 () Bool)

(assert (=> d!119517 m!930465))

(assert (=> d!119517 m!930397))

(declare-fun m!930467 () Bool)

(assert (=> b!1005137 m!930467))

(assert (=> b!1005133 m!930405))

(declare-fun m!930469 () Bool)

(assert (=> b!1005133 m!930469))

(assert (=> b!1005133 m!930469))

(declare-fun m!930471 () Bool)

(assert (=> b!1005133 m!930471))

(assert (=> b!1005135 m!930467))

(assert (=> b!1005138 m!930467))

(assert (=> b!1004997 d!119517))

(declare-fun d!119519 () Bool)

(declare-fun lt!444452 () (_ BitVec 32))

(declare-fun lt!444451 () (_ BitVec 32))

(assert (=> d!119519 (= lt!444452 (bvmul (bvxor lt!444451 (bvlshr lt!444451 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119519 (= lt!444451 ((_ extract 31 0) (bvand (bvxor lt!444405 (bvlshr lt!444405 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119519 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!674342 (let ((h!22388 ((_ extract 31 0) (bvand (bvxor lt!444405 (bvlshr lt!444405 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87641 (bvmul (bvxor h!22388 (bvlshr h!22388 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87641 (bvlshr x!87641 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!674342 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!674342 #b00000000000000000000000000000000))))))

(assert (=> d!119519 (= (toIndex!0 lt!444405 mask!3464) (bvand (bvxor lt!444452 (bvlshr lt!444452 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1004997 d!119519))

(declare-fun b!1005214 () Bool)

(declare-fun e!566047 () SeekEntryResult!9466)

(assert (=> b!1005214 (= e!566047 Undefined!9466)))

(declare-fun b!1005215 () Bool)

(declare-fun e!566046 () SeekEntryResult!9466)

(assert (=> b!1005215 (= e!566047 e!566046)))

(declare-fun lt!444476 () (_ BitVec 64))

(declare-fun lt!444475 () SeekEntryResult!9466)

(assert (=> b!1005215 (= lt!444476 (select (arr!30534 a!3219) (index!40237 lt!444475)))))

(declare-fun c!101574 () Bool)

(assert (=> b!1005215 (= c!101574 (= lt!444476 k!2224))))

(declare-fun b!1005216 () Bool)

(declare-fun c!101576 () Bool)

(assert (=> b!1005216 (= c!101576 (= lt!444476 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566048 () SeekEntryResult!9466)

(assert (=> b!1005216 (= e!566046 e!566048)))

(declare-fun b!1005217 () Bool)

(assert (=> b!1005217 (= e!566048 (MissingZero!9466 (index!40237 lt!444475)))))

(declare-fun d!119529 () Bool)

(declare-fun lt!444474 () SeekEntryResult!9466)

(assert (=> d!119529 (and (or (is-Undefined!9466 lt!444474) (not (is-Found!9466 lt!444474)) (and (bvsge (index!40236 lt!444474) #b00000000000000000000000000000000) (bvslt (index!40236 lt!444474) (size!31036 a!3219)))) (or (is-Undefined!9466 lt!444474) (is-Found!9466 lt!444474) (not (is-MissingZero!9466 lt!444474)) (and (bvsge (index!40235 lt!444474) #b00000000000000000000000000000000) (bvslt (index!40235 lt!444474) (size!31036 a!3219)))) (or (is-Undefined!9466 lt!444474) (is-Found!9466 lt!444474) (is-MissingZero!9466 lt!444474) (not (is-MissingVacant!9466 lt!444474)) (and (bvsge (index!40238 lt!444474) #b00000000000000000000000000000000) (bvslt (index!40238 lt!444474) (size!31036 a!3219)))) (or (is-Undefined!9466 lt!444474) (ite (is-Found!9466 lt!444474) (= (select (arr!30534 a!3219) (index!40236 lt!444474)) k!2224) (ite (is-MissingZero!9466 lt!444474) (= (select (arr!30534 a!3219) (index!40235 lt!444474)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9466 lt!444474) (= (select (arr!30534 a!3219) (index!40238 lt!444474)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119529 (= lt!444474 e!566047)))

(declare-fun c!101575 () Bool)

(assert (=> d!119529 (= c!101575 (and (is-Intermediate!9466 lt!444475) (undefined!10278 lt!444475)))))

(assert (=> d!119529 (= lt!444475 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119529 (validMask!0 mask!3464)))

(assert (=> d!119529 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!444474)))

(declare-fun b!1005218 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63420 (_ BitVec 32)) SeekEntryResult!9466)

(assert (=> b!1005218 (= e!566048 (seekKeyOrZeroReturnVacant!0 (x!87636 lt!444475) (index!40237 lt!444475) (index!40237 lt!444475) k!2224 a!3219 mask!3464))))

(declare-fun b!1005219 () Bool)

(assert (=> b!1005219 (= e!566046 (Found!9466 (index!40237 lt!444475)))))

(assert (= (and d!119529 c!101575) b!1005214))

(assert (= (and d!119529 (not c!101575)) b!1005215))

(assert (= (and b!1005215 c!101574) b!1005219))

(assert (= (and b!1005215 (not c!101574)) b!1005216))

(assert (= (and b!1005216 c!101576) b!1005217))

(assert (= (and b!1005216 (not c!101576)) b!1005218))

(declare-fun m!930519 () Bool)

(assert (=> b!1005215 m!930519))

(declare-fun m!930521 () Bool)

(assert (=> d!119529 m!930521))

(declare-fun m!930523 () Bool)

(assert (=> d!119529 m!930523))

(assert (=> d!119529 m!930397))

(assert (=> d!119529 m!930521))

(declare-fun m!930525 () Bool)

(assert (=> d!119529 m!930525))

(declare-fun m!930527 () Bool)

(assert (=> d!119529 m!930527))

(declare-fun m!930529 () Bool)

(assert (=> d!119529 m!930529))

(declare-fun m!930531 () Bool)

(assert (=> b!1005218 m!930531))

(assert (=> b!1005002 d!119529))

(declare-fun b!1005220 () Bool)

(declare-fun e!566051 () SeekEntryResult!9466)

(assert (=> b!1005220 (= e!566051 (Intermediate!9466 true index!1507 x!1245))))

(declare-fun d!119543 () Bool)

(declare-fun e!566050 () Bool)

(assert (=> d!119543 e!566050))

(declare-fun c!101579 () Bool)

(declare-fun lt!444478 () SeekEntryResult!9466)

(assert (=> d!119543 (= c!101579 (and (is-Intermediate!9466 lt!444478) (undefined!10278 lt!444478)))))

(assert (=> d!119543 (= lt!444478 e!566051)))

(declare-fun c!101578 () Bool)

(assert (=> d!119543 (= c!101578 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!444477 () (_ BitVec 64))

(assert (=> d!119543 (= lt!444477 (select (arr!30534 a!3219) index!1507))))

(assert (=> d!119543 (validMask!0 mask!3464)))

(assert (=> d!119543 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30534 a!3219) j!170) a!3219 mask!3464) lt!444478)))

(declare-fun b!1005221 () Bool)

(declare-fun e!566049 () SeekEntryResult!9466)

(assert (=> b!1005221 (= e!566049 (Intermediate!9466 false index!1507 x!1245))))

(declare-fun b!1005222 () Bool)

(assert (=> b!1005222 (= e!566051 e!566049)))

(declare-fun c!101577 () Bool)

(assert (=> b!1005222 (= c!101577 (or (= lt!444477 (select (arr!30534 a!3219) j!170)) (= (bvadd lt!444477 lt!444477) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1005223 () Bool)

(assert (=> b!1005223 (= e!566049 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30534 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005224 () Bool)

(assert (=> b!1005224 (= e!566050 (bvsge (x!87636 lt!444478) #b01111111111111111111111111111110))))

(declare-fun b!1005225 () Bool)

(assert (=> b!1005225 (and (bvsge (index!40237 lt!444478) #b00000000000000000000000000000000) (bvslt (index!40237 lt!444478) (size!31036 a!3219)))))

(declare-fun e!566053 () Bool)

(assert (=> b!1005225 (= e!566053 (= (select (arr!30534 a!3219) (index!40237 lt!444478)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1005226 () Bool)

(declare-fun e!566052 () Bool)

(assert (=> b!1005226 (= e!566050 e!566052)))

(declare-fun res!674369 () Bool)

(assert (=> b!1005226 (= res!674369 (and (is-Intermediate!9466 lt!444478) (not (undefined!10278 lt!444478)) (bvslt (x!87636 lt!444478) #b01111111111111111111111111111110) (bvsge (x!87636 lt!444478) #b00000000000000000000000000000000) (bvsge (x!87636 lt!444478) x!1245)))))

(assert (=> b!1005226 (=> (not res!674369) (not e!566052))))

(declare-fun b!1005227 () Bool)

(assert (=> b!1005227 (and (bvsge (index!40237 lt!444478) #b00000000000000000000000000000000) (bvslt (index!40237 lt!444478) (size!31036 a!3219)))))

(declare-fun res!674368 () Bool)

(assert (=> b!1005227 (= res!674368 (= (select (arr!30534 a!3219) (index!40237 lt!444478)) (select (arr!30534 a!3219) j!170)))))

(assert (=> b!1005227 (=> res!674368 e!566053)))

(assert (=> b!1005227 (= e!566052 e!566053)))

(declare-fun b!1005228 () Bool)

(assert (=> b!1005228 (and (bvsge (index!40237 lt!444478) #b00000000000000000000000000000000) (bvslt (index!40237 lt!444478) (size!31036 a!3219)))))

(declare-fun res!674367 () Bool)

(assert (=> b!1005228 (= res!674367 (= (select (arr!30534 a!3219) (index!40237 lt!444478)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1005228 (=> res!674367 e!566053)))

(assert (= (and d!119543 c!101578) b!1005220))

(assert (= (and d!119543 (not c!101578)) b!1005222))

(assert (= (and b!1005222 c!101577) b!1005221))

(assert (= (and b!1005222 (not c!101577)) b!1005223))

(assert (= (and d!119543 c!101579) b!1005224))

(assert (= (and d!119543 (not c!101579)) b!1005226))

(assert (= (and b!1005226 res!674369) b!1005227))

(assert (= (and b!1005227 (not res!674368)) b!1005228))

(assert (= (and b!1005228 (not res!674367)) b!1005225))

(declare-fun m!930533 () Bool)

(assert (=> d!119543 m!930533))

(assert (=> d!119543 m!930397))

(declare-fun m!930535 () Bool)

(assert (=> b!1005227 m!930535))

(assert (=> b!1005223 m!930461))

(assert (=> b!1005223 m!930461))

(assert (=> b!1005223 m!930393))

(declare-fun m!930537 () Bool)

(assert (=> b!1005223 m!930537))

(assert (=> b!1005225 m!930535))

(assert (=> b!1005228 m!930535))

(assert (=> b!1005007 d!119543))

(declare-fun d!119545 () Bool)

(declare-fun res!674374 () Bool)

(declare-fun e!566064 () Bool)

(assert (=> d!119545 (=> res!674374 e!566064)))

(assert (=> d!119545 (= res!674374 (= (select (arr!30534 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119545 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!566064)))

(declare-fun b!1005245 () Bool)

(declare-fun e!566065 () Bool)

(assert (=> b!1005245 (= e!566064 e!566065)))

(declare-fun res!674375 () Bool)

(assert (=> b!1005245 (=> (not res!674375) (not e!566065))))

(assert (=> b!1005245 (= res!674375 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31036 a!3219)))))

(declare-fun b!1005246 () Bool)

(assert (=> b!1005246 (= e!566065 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119545 (not res!674374)) b!1005245))

(assert (= (and b!1005245 res!674375) b!1005246))

(assert (=> d!119545 m!930439))

(declare-fun m!930539 () Bool)

(assert (=> b!1005246 m!930539))

(assert (=> b!1005001 d!119545))

(declare-fun d!119547 () Bool)

(assert (=> d!119547 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86670 d!119547))

(declare-fun d!119555 () Bool)

(assert (=> d!119555 (= (array_inv!23658 a!3219) (bvsge (size!31036 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86670 d!119555))

(declare-fun b!1005287 () Bool)

(declare-fun e!566092 () Bool)

(declare-fun e!566093 () Bool)

(assert (=> b!1005287 (= e!566092 e!566093)))

(declare-fun c!101599 () Bool)

(assert (=> b!1005287 (= c!101599 (validKeyInArray!0 (select (arr!30534 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1005288 () Bool)

(declare-fun call!42343 () Bool)

(assert (=> b!1005288 (= e!566093 call!42343)))

(declare-fun d!119557 () Bool)

(declare-fun res!674391 () Bool)

(assert (=> d!119557 (=> res!674391 e!566092)))

(assert (=> d!119557 (= res!674391 (bvsge #b00000000000000000000000000000000 (size!31036 a!3219)))))

(assert (=> d!119557 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!566092)))

(declare-fun bm!42340 () Bool)

(assert (=> bm!42340 (= call!42343 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1005289 () Bool)

(declare-fun e!566091 () Bool)

(assert (=> b!1005289 (= e!566091 call!42343)))

(declare-fun b!1005290 () Bool)

(assert (=> b!1005290 (= e!566093 e!566091)))

(declare-fun lt!444513 () (_ BitVec 64))

(assert (=> b!1005290 (= lt!444513 (select (arr!30534 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33008 0))(
  ( (Unit!33009) )
))
(declare-fun lt!444512 () Unit!33008)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63420 (_ BitVec 64) (_ BitVec 32)) Unit!33008)

(assert (=> b!1005290 (= lt!444512 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!444513 #b00000000000000000000000000000000))))

(assert (=> b!1005290 (arrayContainsKey!0 a!3219 lt!444513 #b00000000000000000000000000000000)))

(declare-fun lt!444514 () Unit!33008)

(assert (=> b!1005290 (= lt!444514 lt!444512)))

(declare-fun res!674392 () Bool)

(assert (=> b!1005290 (= res!674392 (= (seekEntryOrOpen!0 (select (arr!30534 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9466 #b00000000000000000000000000000000)))))

(assert (=> b!1005290 (=> (not res!674392) (not e!566091))))

(assert (= (and d!119557 (not res!674391)) b!1005287))

(assert (= (and b!1005287 c!101599) b!1005290))

(assert (= (and b!1005287 (not c!101599)) b!1005288))

(assert (= (and b!1005290 res!674392) b!1005289))

(assert (= (or b!1005289 b!1005288) bm!42340))

(assert (=> b!1005287 m!930439))

(assert (=> b!1005287 m!930439))

(assert (=> b!1005287 m!930445))

(declare-fun m!930571 () Bool)

(assert (=> bm!42340 m!930571))

(assert (=> b!1005290 m!930439))

(declare-fun m!930573 () Bool)

(assert (=> b!1005290 m!930573))

(declare-fun m!930575 () Bool)

(assert (=> b!1005290 m!930575))

(assert (=> b!1005290 m!930439))

(declare-fun m!930577 () Bool)

(assert (=> b!1005290 m!930577))

(assert (=> b!1005006 d!119557))

(declare-fun d!119563 () Bool)

(assert (=> d!119563 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1005000 d!119563))

(declare-fun e!566099 () SeekEntryResult!9466)

(declare-fun b!1005295 () Bool)

(assert (=> b!1005295 (= e!566099 (Intermediate!9466 true (toIndex!0 (select (arr!30534 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun d!119565 () Bool)

(declare-fun e!566098 () Bool)

(assert (=> d!119565 e!566098))

(declare-fun c!101603 () Bool)

(declare-fun lt!444519 () SeekEntryResult!9466)

(assert (=> d!119565 (= c!101603 (and (is-Intermediate!9466 lt!444519) (undefined!10278 lt!444519)))))

(assert (=> d!119565 (= lt!444519 e!566099)))

(declare-fun c!101602 () Bool)

(assert (=> d!119565 (= c!101602 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!444518 () (_ BitVec 64))

(assert (=> d!119565 (= lt!444518 (select (arr!30534 a!3219) (toIndex!0 (select (arr!30534 a!3219) j!170) mask!3464)))))

(assert (=> d!119565 (validMask!0 mask!3464)))

(assert (=> d!119565 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30534 a!3219) j!170) mask!3464) (select (arr!30534 a!3219) j!170) a!3219 mask!3464) lt!444519)))

(declare-fun b!1005296 () Bool)

(declare-fun e!566097 () SeekEntryResult!9466)

(assert (=> b!1005296 (= e!566097 (Intermediate!9466 false (toIndex!0 (select (arr!30534 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1005297 () Bool)

(assert (=> b!1005297 (= e!566099 e!566097)))

(declare-fun c!101601 () Bool)

(assert (=> b!1005297 (= c!101601 (or (= lt!444518 (select (arr!30534 a!3219) j!170)) (= (bvadd lt!444518 lt!444518) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1005298 () Bool)

(assert (=> b!1005298 (= e!566097 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30534 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30534 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005299 () Bool)

(assert (=> b!1005299 (= e!566098 (bvsge (x!87636 lt!444519) #b01111111111111111111111111111110))))

(declare-fun b!1005300 () Bool)

(assert (=> b!1005300 (and (bvsge (index!40237 lt!444519) #b00000000000000000000000000000000) (bvslt (index!40237 lt!444519) (size!31036 a!3219)))))

(declare-fun e!566101 () Bool)

(assert (=> b!1005300 (= e!566101 (= (select (arr!30534 a!3219) (index!40237 lt!444519)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1005301 () Bool)

(declare-fun e!566100 () Bool)

(assert (=> b!1005301 (= e!566098 e!566100)))

(declare-fun res!674397 () Bool)

(assert (=> b!1005301 (= res!674397 (and (is-Intermediate!9466 lt!444519) (not (undefined!10278 lt!444519)) (bvslt (x!87636 lt!444519) #b01111111111111111111111111111110) (bvsge (x!87636 lt!444519) #b00000000000000000000000000000000) (bvsge (x!87636 lt!444519) #b00000000000000000000000000000000)))))

(assert (=> b!1005301 (=> (not res!674397) (not e!566100))))

(declare-fun b!1005302 () Bool)

(assert (=> b!1005302 (and (bvsge (index!40237 lt!444519) #b00000000000000000000000000000000) (bvslt (index!40237 lt!444519) (size!31036 a!3219)))))

(declare-fun res!674396 () Bool)

(assert (=> b!1005302 (= res!674396 (= (select (arr!30534 a!3219) (index!40237 lt!444519)) (select (arr!30534 a!3219) j!170)))))

(assert (=> b!1005302 (=> res!674396 e!566101)))

(assert (=> b!1005302 (= e!566100 e!566101)))

(declare-fun b!1005303 () Bool)

(assert (=> b!1005303 (and (bvsge (index!40237 lt!444519) #b00000000000000000000000000000000) (bvslt (index!40237 lt!444519) (size!31036 a!3219)))))

(declare-fun res!674395 () Bool)

(assert (=> b!1005303 (= res!674395 (= (select (arr!30534 a!3219) (index!40237 lt!444519)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1005303 (=> res!674395 e!566101)))

(assert (= (and d!119565 c!101602) b!1005295))

(assert (= (and d!119565 (not c!101602)) b!1005297))

(assert (= (and b!1005297 c!101601) b!1005296))

(assert (= (and b!1005297 (not c!101601)) b!1005298))

(assert (= (and d!119565 c!101603) b!1005299))

(assert (= (and d!119565 (not c!101603)) b!1005301))

(assert (= (and b!1005301 res!674397) b!1005302))

(assert (= (and b!1005302 (not res!674396)) b!1005303))

(assert (= (and b!1005303 (not res!674395)) b!1005300))

(assert (=> d!119565 m!930413))

(declare-fun m!930591 () Bool)

(assert (=> d!119565 m!930591))

(assert (=> d!119565 m!930397))

(declare-fun m!930593 () Bool)

(assert (=> b!1005302 m!930593))

(assert (=> b!1005298 m!930413))

(declare-fun m!930595 () Bool)

(assert (=> b!1005298 m!930595))

(assert (=> b!1005298 m!930595))

(assert (=> b!1005298 m!930393))

(declare-fun m!930597 () Bool)

(assert (=> b!1005298 m!930597))

(assert (=> b!1005300 m!930593))

(assert (=> b!1005303 m!930593))

(assert (=> b!1005005 d!119565))

(declare-fun d!119569 () Bool)

(declare-fun lt!444521 () (_ BitVec 32))

(declare-fun lt!444520 () (_ BitVec 32))

(assert (=> d!119569 (= lt!444521 (bvmul (bvxor lt!444520 (bvlshr lt!444520 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119569 (= lt!444520 ((_ extract 31 0) (bvand (bvxor (select (arr!30534 a!3219) j!170) (bvlshr (select (arr!30534 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119569 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!674342 (let ((h!22388 ((_ extract 31 0) (bvand (bvxor (select (arr!30534 a!3219) j!170) (bvlshr (select (arr!30534 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87641 (bvmul (bvxor h!22388 (bvlshr h!22388 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87641 (bvlshr x!87641 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!674342 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!674342 #b00000000000000000000000000000000))))))

(assert (=> d!119569 (= (toIndex!0 (select (arr!30534 a!3219) j!170) mask!3464) (bvand (bvxor lt!444521 (bvlshr lt!444521 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1005005 d!119569))

(push 1)

