; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66580 () Bool)

(assert start!66580)

(declare-fun b!767449 () Bool)

(declare-fun e!427355 () Bool)

(declare-fun e!427360 () Bool)

(assert (=> b!767449 (= e!427355 e!427360)))

(declare-fun res!519226 () Bool)

(assert (=> b!767449 (=> (not res!519226) (not e!427360))))

(declare-datatypes ((array!42290 0))(
  ( (array!42291 (arr!20248 (Array (_ BitVec 32) (_ BitVec 64))) (size!20669 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42290)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7848 0))(
  ( (MissingZero!7848 (index!33760 (_ BitVec 32))) (Found!7848 (index!33761 (_ BitVec 32))) (Intermediate!7848 (undefined!8660 Bool) (index!33762 (_ BitVec 32)) (x!64674 (_ BitVec 32))) (Undefined!7848) (MissingVacant!7848 (index!33763 (_ BitVec 32))) )
))
(declare-fun lt!341402 () SeekEntryResult!7848)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42290 (_ BitVec 32)) SeekEntryResult!7848)

(assert (=> b!767449 (= res!519226 (= (seekEntryOrOpen!0 (select (arr!20248 a!3186) j!159) a!3186 mask!3328) lt!341402))))

(assert (=> b!767449 (= lt!341402 (Found!7848 j!159))))

(declare-fun b!767450 () Bool)

(declare-fun res!519224 () Bool)

(declare-fun e!427353 () Bool)

(assert (=> b!767450 (=> (not res!519224) (not e!427353))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!767450 (= res!519224 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20248 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767451 () Bool)

(declare-fun e!427357 () Bool)

(assert (=> b!767451 (= e!427357 e!427353)))

(declare-fun res!519222 () Bool)

(assert (=> b!767451 (=> (not res!519222) (not e!427353))))

(declare-fun lt!341410 () SeekEntryResult!7848)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42290 (_ BitVec 32)) SeekEntryResult!7848)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767451 (= res!519222 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20248 a!3186) j!159) mask!3328) (select (arr!20248 a!3186) j!159) a!3186 mask!3328) lt!341410))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!767451 (= lt!341410 (Intermediate!7848 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!767452 () Bool)

(declare-fun e!427358 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42290 (_ BitVec 32)) SeekEntryResult!7848)

(assert (=> b!767452 (= e!427358 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20248 a!3186) j!159) a!3186 mask!3328) (Found!7848 j!159)))))

(declare-fun b!767453 () Bool)

(declare-fun res!519220 () Bool)

(declare-fun e!427354 () Bool)

(assert (=> b!767453 (=> (not res!519220) (not e!427354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!767453 (= res!519220 (validKeyInArray!0 (select (arr!20248 a!3186) j!159)))))

(declare-fun b!767454 () Bool)

(declare-fun res!519211 () Bool)

(declare-fun e!427356 () Bool)

(assert (=> b!767454 (=> res!519211 e!427356)))

(declare-fun lt!341406 () SeekEntryResult!7848)

(assert (=> b!767454 (= res!519211 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20248 a!3186) j!159) a!3186 mask!3328) lt!341406)))))

(declare-fun b!767455 () Bool)

(assert (=> b!767455 (= e!427354 e!427357)))

(declare-fun res!519219 () Bool)

(assert (=> b!767455 (=> (not res!519219) (not e!427357))))

(declare-fun lt!341409 () SeekEntryResult!7848)

(assert (=> b!767455 (= res!519219 (or (= lt!341409 (MissingZero!7848 i!1173)) (= lt!341409 (MissingVacant!7848 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!767455 (= lt!341409 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!767456 () Bool)

(declare-fun e!427362 () Bool)

(declare-fun e!427361 () Bool)

(assert (=> b!767456 (= e!427362 (not e!427361))))

(declare-fun res!519214 () Bool)

(assert (=> b!767456 (=> res!519214 e!427361)))

(declare-fun lt!341411 () SeekEntryResult!7848)

(get-info :version)

(assert (=> b!767456 (= res!519214 (or (not ((_ is Intermediate!7848) lt!341411)) (bvsge x!1131 (x!64674 lt!341411))))))

(assert (=> b!767456 (= lt!341406 (Found!7848 j!159))))

(assert (=> b!767456 e!427355))

(declare-fun res!519217 () Bool)

(assert (=> b!767456 (=> (not res!519217) (not e!427355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42290 (_ BitVec 32)) Bool)

(assert (=> b!767456 (= res!519217 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26422 0))(
  ( (Unit!26423) )
))
(declare-fun lt!341405 () Unit!26422)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26422)

(assert (=> b!767456 (= lt!341405 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!341404 () (_ BitVec 32))

(declare-fun b!767457 () Bool)

(assert (=> b!767457 (= e!427356 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341404 resIntermediateIndex!5 (select (arr!20248 a!3186) j!159) a!3186 mask!3328) lt!341406))))

(declare-fun b!767458 () Bool)

(declare-fun res!519212 () Bool)

(assert (=> b!767458 (=> (not res!519212) (not e!427354))))

(assert (=> b!767458 (= res!519212 (validKeyInArray!0 k0!2102))))

(declare-fun b!767459 () Bool)

(declare-fun res!519210 () Bool)

(assert (=> b!767459 (=> (not res!519210) (not e!427353))))

(assert (=> b!767459 (= res!519210 e!427358)))

(declare-fun c!84511 () Bool)

(assert (=> b!767459 (= c!84511 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!767460 () Bool)

(declare-fun res!519221 () Bool)

(assert (=> b!767460 (=> (not res!519221) (not e!427357))))

(assert (=> b!767460 (= res!519221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!767462 () Bool)

(declare-fun res!519216 () Bool)

(assert (=> b!767462 (=> (not res!519216) (not e!427354))))

(declare-fun arrayContainsKey!0 (array!42290 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!767462 (= res!519216 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!767463 () Bool)

(assert (=> b!767463 (= e!427353 e!427362)))

(declare-fun res!519223 () Bool)

(assert (=> b!767463 (=> (not res!519223) (not e!427362))))

(declare-fun lt!341408 () SeekEntryResult!7848)

(assert (=> b!767463 (= res!519223 (= lt!341408 lt!341411))))

(declare-fun lt!341403 () array!42290)

(declare-fun lt!341407 () (_ BitVec 64))

(assert (=> b!767463 (= lt!341411 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341407 lt!341403 mask!3328))))

(assert (=> b!767463 (= lt!341408 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341407 mask!3328) lt!341407 lt!341403 mask!3328))))

(assert (=> b!767463 (= lt!341407 (select (store (arr!20248 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!767463 (= lt!341403 (array!42291 (store (arr!20248 a!3186) i!1173 k0!2102) (size!20669 a!3186)))))

(declare-fun b!767464 () Bool)

(assert (=> b!767464 (= e!427361 e!427356)))

(declare-fun res!519225 () Bool)

(assert (=> b!767464 (=> res!519225 e!427356)))

(assert (=> b!767464 (= res!519225 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767464 (= lt!341404 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!767465 () Bool)

(assert (=> b!767465 (= e!427358 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20248 a!3186) j!159) a!3186 mask!3328) lt!341410))))

(declare-fun b!767466 () Bool)

(assert (=> b!767466 (= e!427360 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20248 a!3186) j!159) a!3186 mask!3328) lt!341402))))

(declare-fun b!767467 () Bool)

(declare-fun res!519209 () Bool)

(assert (=> b!767467 (=> (not res!519209) (not e!427357))))

(assert (=> b!767467 (= res!519209 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20669 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20669 a!3186))))))

(declare-fun b!767468 () Bool)

(declare-fun res!519215 () Bool)

(assert (=> b!767468 (=> (not res!519215) (not e!427354))))

(assert (=> b!767468 (= res!519215 (and (= (size!20669 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20669 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20669 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!519213 () Bool)

(assert (=> start!66580 (=> (not res!519213) (not e!427354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66580 (= res!519213 (validMask!0 mask!3328))))

(assert (=> start!66580 e!427354))

(assert (=> start!66580 true))

(declare-fun array_inv!16044 (array!42290) Bool)

(assert (=> start!66580 (array_inv!16044 a!3186)))

(declare-fun b!767461 () Bool)

(declare-fun res!519218 () Bool)

(assert (=> b!767461 (=> (not res!519218) (not e!427357))))

(declare-datatypes ((List!14250 0))(
  ( (Nil!14247) (Cons!14246 (h!15339 (_ BitVec 64)) (t!20565 List!14250)) )
))
(declare-fun arrayNoDuplicates!0 (array!42290 (_ BitVec 32) List!14250) Bool)

(assert (=> b!767461 (= res!519218 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14247))))

(assert (= (and start!66580 res!519213) b!767468))

(assert (= (and b!767468 res!519215) b!767453))

(assert (= (and b!767453 res!519220) b!767458))

(assert (= (and b!767458 res!519212) b!767462))

(assert (= (and b!767462 res!519216) b!767455))

(assert (= (and b!767455 res!519219) b!767460))

(assert (= (and b!767460 res!519221) b!767461))

(assert (= (and b!767461 res!519218) b!767467))

(assert (= (and b!767467 res!519209) b!767451))

(assert (= (and b!767451 res!519222) b!767450))

(assert (= (and b!767450 res!519224) b!767459))

(assert (= (and b!767459 c!84511) b!767465))

(assert (= (and b!767459 (not c!84511)) b!767452))

(assert (= (and b!767459 res!519210) b!767463))

(assert (= (and b!767463 res!519223) b!767456))

(assert (= (and b!767456 res!519217) b!767449))

(assert (= (and b!767449 res!519226) b!767466))

(assert (= (and b!767456 (not res!519214)) b!767464))

(assert (= (and b!767464 (not res!519225)) b!767454))

(assert (= (and b!767454 (not res!519211)) b!767457))

(declare-fun m!713219 () Bool)

(assert (=> b!767451 m!713219))

(assert (=> b!767451 m!713219))

(declare-fun m!713221 () Bool)

(assert (=> b!767451 m!713221))

(assert (=> b!767451 m!713221))

(assert (=> b!767451 m!713219))

(declare-fun m!713223 () Bool)

(assert (=> b!767451 m!713223))

(declare-fun m!713225 () Bool)

(assert (=> b!767463 m!713225))

(declare-fun m!713227 () Bool)

(assert (=> b!767463 m!713227))

(assert (=> b!767463 m!713225))

(declare-fun m!713229 () Bool)

(assert (=> b!767463 m!713229))

(declare-fun m!713231 () Bool)

(assert (=> b!767463 m!713231))

(declare-fun m!713233 () Bool)

(assert (=> b!767463 m!713233))

(assert (=> b!767457 m!713219))

(assert (=> b!767457 m!713219))

(declare-fun m!713235 () Bool)

(assert (=> b!767457 m!713235))

(declare-fun m!713237 () Bool)

(assert (=> b!767455 m!713237))

(assert (=> b!767465 m!713219))

(assert (=> b!767465 m!713219))

(declare-fun m!713239 () Bool)

(assert (=> b!767465 m!713239))

(declare-fun m!713241 () Bool)

(assert (=> start!66580 m!713241))

(declare-fun m!713243 () Bool)

(assert (=> start!66580 m!713243))

(assert (=> b!767453 m!713219))

(assert (=> b!767453 m!713219))

(declare-fun m!713245 () Bool)

(assert (=> b!767453 m!713245))

(declare-fun m!713247 () Bool)

(assert (=> b!767460 m!713247))

(declare-fun m!713249 () Bool)

(assert (=> b!767461 m!713249))

(assert (=> b!767452 m!713219))

(assert (=> b!767452 m!713219))

(declare-fun m!713251 () Bool)

(assert (=> b!767452 m!713251))

(declare-fun m!713253 () Bool)

(assert (=> b!767450 m!713253))

(declare-fun m!713255 () Bool)

(assert (=> b!767464 m!713255))

(assert (=> b!767466 m!713219))

(assert (=> b!767466 m!713219))

(declare-fun m!713257 () Bool)

(assert (=> b!767466 m!713257))

(declare-fun m!713259 () Bool)

(assert (=> b!767458 m!713259))

(assert (=> b!767449 m!713219))

(assert (=> b!767449 m!713219))

(declare-fun m!713261 () Bool)

(assert (=> b!767449 m!713261))

(declare-fun m!713263 () Bool)

(assert (=> b!767456 m!713263))

(declare-fun m!713265 () Bool)

(assert (=> b!767456 m!713265))

(assert (=> b!767454 m!713219))

(assert (=> b!767454 m!713219))

(assert (=> b!767454 m!713251))

(declare-fun m!713267 () Bool)

(assert (=> b!767462 m!713267))

(check-sat (not b!767449) (not b!767461) (not b!767455) (not b!767464) (not b!767457) (not start!66580) (not b!767462) (not b!767466) (not b!767460) (not b!767465) (not b!767451) (not b!767463) (not b!767456) (not b!767454) (not b!767458) (not b!767452) (not b!767453))
(check-sat)
(get-model)

(declare-fun d!101349 () Bool)

(assert (=> d!101349 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66580 d!101349))

(declare-fun d!101351 () Bool)

(assert (=> d!101351 (= (array_inv!16044 a!3186) (bvsge (size!20669 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66580 d!101351))

(declare-fun b!767539 () Bool)

(declare-fun e!427404 () Bool)

(declare-fun e!427401 () Bool)

(assert (=> b!767539 (= e!427404 e!427401)))

(declare-fun c!84517 () Bool)

(assert (=> b!767539 (= c!84517 (validKeyInArray!0 (select (arr!20248 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!767540 () Bool)

(declare-fun e!427402 () Bool)

(assert (=> b!767540 (= e!427402 e!427404)))

(declare-fun res!519289 () Bool)

(assert (=> b!767540 (=> (not res!519289) (not e!427404))))

(declare-fun e!427403 () Bool)

(assert (=> b!767540 (= res!519289 (not e!427403))))

(declare-fun res!519287 () Bool)

(assert (=> b!767540 (=> (not res!519287) (not e!427403))))

(assert (=> b!767540 (= res!519287 (validKeyInArray!0 (select (arr!20248 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35064 () Bool)

(declare-fun call!35067 () Bool)

(assert (=> bm!35064 (= call!35067 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84517 (Cons!14246 (select (arr!20248 a!3186) #b00000000000000000000000000000000) Nil!14247) Nil!14247)))))

(declare-fun b!767541 () Bool)

(declare-fun contains!4083 (List!14250 (_ BitVec 64)) Bool)

(assert (=> b!767541 (= e!427403 (contains!4083 Nil!14247 (select (arr!20248 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!767542 () Bool)

(assert (=> b!767542 (= e!427401 call!35067)))

(declare-fun b!767543 () Bool)

(assert (=> b!767543 (= e!427401 call!35067)))

(declare-fun d!101353 () Bool)

(declare-fun res!519288 () Bool)

(assert (=> d!101353 (=> res!519288 e!427402)))

(assert (=> d!101353 (= res!519288 (bvsge #b00000000000000000000000000000000 (size!20669 a!3186)))))

(assert (=> d!101353 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14247) e!427402)))

(assert (= (and d!101353 (not res!519288)) b!767540))

(assert (= (and b!767540 res!519287) b!767541))

(assert (= (and b!767540 res!519289) b!767539))

(assert (= (and b!767539 c!84517) b!767542))

(assert (= (and b!767539 (not c!84517)) b!767543))

(assert (= (or b!767542 b!767543) bm!35064))

(declare-fun m!713319 () Bool)

(assert (=> b!767539 m!713319))

(assert (=> b!767539 m!713319))

(declare-fun m!713321 () Bool)

(assert (=> b!767539 m!713321))

(assert (=> b!767540 m!713319))

(assert (=> b!767540 m!713319))

(assert (=> b!767540 m!713321))

(assert (=> bm!35064 m!713319))

(declare-fun m!713323 () Bool)

(assert (=> bm!35064 m!713323))

(assert (=> b!767541 m!713319))

(assert (=> b!767541 m!713319))

(declare-fun m!713325 () Bool)

(assert (=> b!767541 m!713325))

(assert (=> b!767461 d!101353))

(declare-fun b!767552 () Bool)

(declare-fun e!427413 () Bool)

(declare-fun e!427411 () Bool)

(assert (=> b!767552 (= e!427413 e!427411)))

(declare-fun lt!341448 () (_ BitVec 64))

(assert (=> b!767552 (= lt!341448 (select (arr!20248 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!341450 () Unit!26422)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42290 (_ BitVec 64) (_ BitVec 32)) Unit!26422)

(assert (=> b!767552 (= lt!341450 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341448 #b00000000000000000000000000000000))))

(assert (=> b!767552 (arrayContainsKey!0 a!3186 lt!341448 #b00000000000000000000000000000000)))

(declare-fun lt!341449 () Unit!26422)

(assert (=> b!767552 (= lt!341449 lt!341450)))

(declare-fun res!519294 () Bool)

(assert (=> b!767552 (= res!519294 (= (seekEntryOrOpen!0 (select (arr!20248 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7848 #b00000000000000000000000000000000)))))

(assert (=> b!767552 (=> (not res!519294) (not e!427411))))

(declare-fun b!767553 () Bool)

(declare-fun call!35070 () Bool)

(assert (=> b!767553 (= e!427411 call!35070)))

(declare-fun d!101355 () Bool)

(declare-fun res!519295 () Bool)

(declare-fun e!427412 () Bool)

(assert (=> d!101355 (=> res!519295 e!427412)))

(assert (=> d!101355 (= res!519295 (bvsge #b00000000000000000000000000000000 (size!20669 a!3186)))))

(assert (=> d!101355 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!427412)))

(declare-fun bm!35067 () Bool)

(assert (=> bm!35067 (= call!35070 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!767554 () Bool)

(assert (=> b!767554 (= e!427412 e!427413)))

(declare-fun c!84520 () Bool)

(assert (=> b!767554 (= c!84520 (validKeyInArray!0 (select (arr!20248 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!767555 () Bool)

(assert (=> b!767555 (= e!427413 call!35070)))

(assert (= (and d!101355 (not res!519295)) b!767554))

(assert (= (and b!767554 c!84520) b!767552))

(assert (= (and b!767554 (not c!84520)) b!767555))

(assert (= (and b!767552 res!519294) b!767553))

(assert (= (or b!767553 b!767555) bm!35067))

(assert (=> b!767552 m!713319))

(declare-fun m!713327 () Bool)

(assert (=> b!767552 m!713327))

(declare-fun m!713329 () Bool)

(assert (=> b!767552 m!713329))

(assert (=> b!767552 m!713319))

(declare-fun m!713331 () Bool)

(assert (=> b!767552 m!713331))

(declare-fun m!713333 () Bool)

(assert (=> bm!35067 m!713333))

(assert (=> b!767554 m!713319))

(assert (=> b!767554 m!713319))

(assert (=> b!767554 m!713321))

(assert (=> b!767460 d!101355))

(declare-fun d!101357 () Bool)

(declare-fun lt!341458 () SeekEntryResult!7848)

(assert (=> d!101357 (and (or ((_ is Undefined!7848) lt!341458) (not ((_ is Found!7848) lt!341458)) (and (bvsge (index!33761 lt!341458) #b00000000000000000000000000000000) (bvslt (index!33761 lt!341458) (size!20669 a!3186)))) (or ((_ is Undefined!7848) lt!341458) ((_ is Found!7848) lt!341458) (not ((_ is MissingZero!7848) lt!341458)) (and (bvsge (index!33760 lt!341458) #b00000000000000000000000000000000) (bvslt (index!33760 lt!341458) (size!20669 a!3186)))) (or ((_ is Undefined!7848) lt!341458) ((_ is Found!7848) lt!341458) ((_ is MissingZero!7848) lt!341458) (not ((_ is MissingVacant!7848) lt!341458)) (and (bvsge (index!33763 lt!341458) #b00000000000000000000000000000000) (bvslt (index!33763 lt!341458) (size!20669 a!3186)))) (or ((_ is Undefined!7848) lt!341458) (ite ((_ is Found!7848) lt!341458) (= (select (arr!20248 a!3186) (index!33761 lt!341458)) (select (arr!20248 a!3186) j!159)) (ite ((_ is MissingZero!7848) lt!341458) (= (select (arr!20248 a!3186) (index!33760 lt!341458)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7848) lt!341458) (= (select (arr!20248 a!3186) (index!33763 lt!341458)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!427422 () SeekEntryResult!7848)

(assert (=> d!101357 (= lt!341458 e!427422)))

(declare-fun c!84529 () Bool)

(declare-fun lt!341457 () SeekEntryResult!7848)

(assert (=> d!101357 (= c!84529 (and ((_ is Intermediate!7848) lt!341457) (undefined!8660 lt!341457)))))

(assert (=> d!101357 (= lt!341457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20248 a!3186) j!159) mask!3328) (select (arr!20248 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101357 (validMask!0 mask!3328)))

(assert (=> d!101357 (= (seekEntryOrOpen!0 (select (arr!20248 a!3186) j!159) a!3186 mask!3328) lt!341458)))

(declare-fun b!767568 () Bool)

(assert (=> b!767568 (= e!427422 Undefined!7848)))

(declare-fun b!767569 () Bool)

(declare-fun e!427421 () SeekEntryResult!7848)

(assert (=> b!767569 (= e!427421 (Found!7848 (index!33762 lt!341457)))))

(declare-fun b!767570 () Bool)

(declare-fun e!427420 () SeekEntryResult!7848)

(assert (=> b!767570 (= e!427420 (seekKeyOrZeroReturnVacant!0 (x!64674 lt!341457) (index!33762 lt!341457) (index!33762 lt!341457) (select (arr!20248 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767571 () Bool)

(assert (=> b!767571 (= e!427422 e!427421)))

(declare-fun lt!341459 () (_ BitVec 64))

(assert (=> b!767571 (= lt!341459 (select (arr!20248 a!3186) (index!33762 lt!341457)))))

(declare-fun c!84528 () Bool)

(assert (=> b!767571 (= c!84528 (= lt!341459 (select (arr!20248 a!3186) j!159)))))

(declare-fun b!767572 () Bool)

(declare-fun c!84527 () Bool)

(assert (=> b!767572 (= c!84527 (= lt!341459 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767572 (= e!427421 e!427420)))

(declare-fun b!767573 () Bool)

(assert (=> b!767573 (= e!427420 (MissingZero!7848 (index!33762 lt!341457)))))

(assert (= (and d!101357 c!84529) b!767568))

(assert (= (and d!101357 (not c!84529)) b!767571))

(assert (= (and b!767571 c!84528) b!767569))

(assert (= (and b!767571 (not c!84528)) b!767572))

(assert (= (and b!767572 c!84527) b!767573))

(assert (= (and b!767572 (not c!84527)) b!767570))

(assert (=> d!101357 m!713221))

(assert (=> d!101357 m!713219))

(assert (=> d!101357 m!713223))

(assert (=> d!101357 m!713219))

(assert (=> d!101357 m!713221))

(declare-fun m!713335 () Bool)

(assert (=> d!101357 m!713335))

(declare-fun m!713337 () Bool)

(assert (=> d!101357 m!713337))

(declare-fun m!713339 () Bool)

(assert (=> d!101357 m!713339))

(assert (=> d!101357 m!713241))

(assert (=> b!767570 m!713219))

(declare-fun m!713341 () Bool)

(assert (=> b!767570 m!713341))

(declare-fun m!713343 () Bool)

(assert (=> b!767571 m!713343))

(assert (=> b!767449 d!101357))

(declare-fun b!767646 () Bool)

(declare-fun e!427463 () SeekEntryResult!7848)

(assert (=> b!767646 (= e!427463 (Intermediate!7848 true index!1321 x!1131))))

(declare-fun b!767647 () Bool)

(declare-fun e!427462 () Bool)

(declare-fun lt!341485 () SeekEntryResult!7848)

(assert (=> b!767647 (= e!427462 (bvsge (x!64674 lt!341485) #b01111111111111111111111111111110))))

(declare-fun b!767648 () Bool)

(declare-fun e!427464 () SeekEntryResult!7848)

(assert (=> b!767648 (= e!427464 (Intermediate!7848 false index!1321 x!1131))))

(declare-fun b!767649 () Bool)

(assert (=> b!767649 (and (bvsge (index!33762 lt!341485) #b00000000000000000000000000000000) (bvslt (index!33762 lt!341485) (size!20669 lt!341403)))))

(declare-fun res!519316 () Bool)

(assert (=> b!767649 (= res!519316 (= (select (arr!20248 lt!341403) (index!33762 lt!341485)) lt!341407))))

(declare-fun e!427465 () Bool)

(assert (=> b!767649 (=> res!519316 e!427465)))

(declare-fun e!427466 () Bool)

(assert (=> b!767649 (= e!427466 e!427465)))

(declare-fun b!767650 () Bool)

(assert (=> b!767650 (= e!427463 e!427464)))

(declare-fun c!84558 () Bool)

(declare-fun lt!341484 () (_ BitVec 64))

(assert (=> b!767650 (= c!84558 (or (= lt!341484 lt!341407) (= (bvadd lt!341484 lt!341484) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!101365 () Bool)

(assert (=> d!101365 e!427462))

(declare-fun c!84559 () Bool)

(assert (=> d!101365 (= c!84559 (and ((_ is Intermediate!7848) lt!341485) (undefined!8660 lt!341485)))))

(assert (=> d!101365 (= lt!341485 e!427463)))

(declare-fun c!84557 () Bool)

(assert (=> d!101365 (= c!84557 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101365 (= lt!341484 (select (arr!20248 lt!341403) index!1321))))

(assert (=> d!101365 (validMask!0 mask!3328)))

(assert (=> d!101365 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341407 lt!341403 mask!3328) lt!341485)))

(declare-fun b!767651 () Bool)

(assert (=> b!767651 (and (bvsge (index!33762 lt!341485) #b00000000000000000000000000000000) (bvslt (index!33762 lt!341485) (size!20669 lt!341403)))))

(assert (=> b!767651 (= e!427465 (= (select (arr!20248 lt!341403) (index!33762 lt!341485)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767652 () Bool)

(assert (=> b!767652 (= e!427464 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!341407 lt!341403 mask!3328))))

(declare-fun b!767653 () Bool)

(assert (=> b!767653 (= e!427462 e!427466)))

(declare-fun res!519317 () Bool)

(assert (=> b!767653 (= res!519317 (and ((_ is Intermediate!7848) lt!341485) (not (undefined!8660 lt!341485)) (bvslt (x!64674 lt!341485) #b01111111111111111111111111111110) (bvsge (x!64674 lt!341485) #b00000000000000000000000000000000) (bvsge (x!64674 lt!341485) x!1131)))))

(assert (=> b!767653 (=> (not res!519317) (not e!427466))))

(declare-fun b!767654 () Bool)

(assert (=> b!767654 (and (bvsge (index!33762 lt!341485) #b00000000000000000000000000000000) (bvslt (index!33762 lt!341485) (size!20669 lt!341403)))))

(declare-fun res!519315 () Bool)

(assert (=> b!767654 (= res!519315 (= (select (arr!20248 lt!341403) (index!33762 lt!341485)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767654 (=> res!519315 e!427465)))

(assert (= (and d!101365 c!84557) b!767646))

(assert (= (and d!101365 (not c!84557)) b!767650))

(assert (= (and b!767650 c!84558) b!767648))

(assert (= (and b!767650 (not c!84558)) b!767652))

(assert (= (and d!101365 c!84559) b!767647))

(assert (= (and d!101365 (not c!84559)) b!767653))

(assert (= (and b!767653 res!519317) b!767649))

(assert (= (and b!767649 (not res!519316)) b!767654))

(assert (= (and b!767654 (not res!519315)) b!767651))

(declare-fun m!713367 () Bool)

(assert (=> b!767651 m!713367))

(assert (=> b!767652 m!713255))

(assert (=> b!767652 m!713255))

(declare-fun m!713369 () Bool)

(assert (=> b!767652 m!713369))

(assert (=> b!767649 m!713367))

(declare-fun m!713371 () Bool)

(assert (=> d!101365 m!713371))

(assert (=> d!101365 m!713241))

(assert (=> b!767654 m!713367))

(assert (=> b!767463 d!101365))

(declare-fun b!767655 () Bool)

(declare-fun e!427468 () SeekEntryResult!7848)

(assert (=> b!767655 (= e!427468 (Intermediate!7848 true (toIndex!0 lt!341407 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767656 () Bool)

(declare-fun e!427467 () Bool)

(declare-fun lt!341487 () SeekEntryResult!7848)

(assert (=> b!767656 (= e!427467 (bvsge (x!64674 lt!341487) #b01111111111111111111111111111110))))

(declare-fun b!767657 () Bool)

(declare-fun e!427469 () SeekEntryResult!7848)

(assert (=> b!767657 (= e!427469 (Intermediate!7848 false (toIndex!0 lt!341407 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767658 () Bool)

(assert (=> b!767658 (and (bvsge (index!33762 lt!341487) #b00000000000000000000000000000000) (bvslt (index!33762 lt!341487) (size!20669 lt!341403)))))

(declare-fun res!519319 () Bool)

(assert (=> b!767658 (= res!519319 (= (select (arr!20248 lt!341403) (index!33762 lt!341487)) lt!341407))))

(declare-fun e!427470 () Bool)

(assert (=> b!767658 (=> res!519319 e!427470)))

(declare-fun e!427471 () Bool)

(assert (=> b!767658 (= e!427471 e!427470)))

(declare-fun b!767659 () Bool)

(assert (=> b!767659 (= e!427468 e!427469)))

(declare-fun c!84561 () Bool)

(declare-fun lt!341486 () (_ BitVec 64))

(assert (=> b!767659 (= c!84561 (or (= lt!341486 lt!341407) (= (bvadd lt!341486 lt!341486) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!101377 () Bool)

(assert (=> d!101377 e!427467))

(declare-fun c!84562 () Bool)

(assert (=> d!101377 (= c!84562 (and ((_ is Intermediate!7848) lt!341487) (undefined!8660 lt!341487)))))

(assert (=> d!101377 (= lt!341487 e!427468)))

(declare-fun c!84560 () Bool)

(assert (=> d!101377 (= c!84560 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101377 (= lt!341486 (select (arr!20248 lt!341403) (toIndex!0 lt!341407 mask!3328)))))

(assert (=> d!101377 (validMask!0 mask!3328)))

(assert (=> d!101377 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341407 mask!3328) lt!341407 lt!341403 mask!3328) lt!341487)))

(declare-fun b!767660 () Bool)

(assert (=> b!767660 (and (bvsge (index!33762 lt!341487) #b00000000000000000000000000000000) (bvslt (index!33762 lt!341487) (size!20669 lt!341403)))))

(assert (=> b!767660 (= e!427470 (= (select (arr!20248 lt!341403) (index!33762 lt!341487)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767661 () Bool)

(assert (=> b!767661 (= e!427469 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!341407 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!341407 lt!341403 mask!3328))))

(declare-fun b!767662 () Bool)

(assert (=> b!767662 (= e!427467 e!427471)))

(declare-fun res!519320 () Bool)

(assert (=> b!767662 (= res!519320 (and ((_ is Intermediate!7848) lt!341487) (not (undefined!8660 lt!341487)) (bvslt (x!64674 lt!341487) #b01111111111111111111111111111110) (bvsge (x!64674 lt!341487) #b00000000000000000000000000000000) (bvsge (x!64674 lt!341487) #b00000000000000000000000000000000)))))

(assert (=> b!767662 (=> (not res!519320) (not e!427471))))

(declare-fun b!767663 () Bool)

(assert (=> b!767663 (and (bvsge (index!33762 lt!341487) #b00000000000000000000000000000000) (bvslt (index!33762 lt!341487) (size!20669 lt!341403)))))

(declare-fun res!519318 () Bool)

(assert (=> b!767663 (= res!519318 (= (select (arr!20248 lt!341403) (index!33762 lt!341487)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767663 (=> res!519318 e!427470)))

(assert (= (and d!101377 c!84560) b!767655))

(assert (= (and d!101377 (not c!84560)) b!767659))

(assert (= (and b!767659 c!84561) b!767657))

(assert (= (and b!767659 (not c!84561)) b!767661))

(assert (= (and d!101377 c!84562) b!767656))

(assert (= (and d!101377 (not c!84562)) b!767662))

(assert (= (and b!767662 res!519320) b!767658))

(assert (= (and b!767658 (not res!519319)) b!767663))

(assert (= (and b!767663 (not res!519318)) b!767660))

(declare-fun m!713373 () Bool)

(assert (=> b!767660 m!713373))

(assert (=> b!767661 m!713225))

(declare-fun m!713375 () Bool)

(assert (=> b!767661 m!713375))

(assert (=> b!767661 m!713375))

(declare-fun m!713377 () Bool)

(assert (=> b!767661 m!713377))

(assert (=> b!767658 m!713373))

(assert (=> d!101377 m!713225))

(declare-fun m!713379 () Bool)

(assert (=> d!101377 m!713379))

(assert (=> d!101377 m!713241))

(assert (=> b!767663 m!713373))

(assert (=> b!767463 d!101377))

(declare-fun d!101379 () Bool)

(declare-fun lt!341499 () (_ BitVec 32))

(declare-fun lt!341498 () (_ BitVec 32))

(assert (=> d!101379 (= lt!341499 (bvmul (bvxor lt!341498 (bvlshr lt!341498 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101379 (= lt!341498 ((_ extract 31 0) (bvand (bvxor lt!341407 (bvlshr lt!341407 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101379 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519321 (let ((h!15342 ((_ extract 31 0) (bvand (bvxor lt!341407 (bvlshr lt!341407 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64680 (bvmul (bvxor h!15342 (bvlshr h!15342 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64680 (bvlshr x!64680 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519321 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519321 #b00000000000000000000000000000000))))))

(assert (=> d!101379 (= (toIndex!0 lt!341407 mask!3328) (bvand (bvxor lt!341499 (bvlshr lt!341499 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!767463 d!101379))

(declare-fun d!101381 () Bool)

(declare-fun lt!341509 () (_ BitVec 32))

(assert (=> d!101381 (and (bvsge lt!341509 #b00000000000000000000000000000000) (bvslt lt!341509 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101381 (= lt!341509 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101381 (validMask!0 mask!3328)))

(assert (=> d!101381 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!341509)))

(declare-fun bs!21522 () Bool)

(assert (= bs!21522 d!101381))

(declare-fun m!713395 () Bool)

(assert (=> bs!21522 m!713395))

(assert (=> bs!21522 m!713241))

(assert (=> b!767464 d!101381))

(declare-fun d!101385 () Bool)

(assert (=> d!101385 (= (validKeyInArray!0 (select (arr!20248 a!3186) j!159)) (and (not (= (select (arr!20248 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20248 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!767453 d!101385))

(declare-fun d!101387 () Bool)

(declare-fun res!519326 () Bool)

(declare-fun e!427491 () Bool)

(assert (=> d!101387 (=> res!519326 e!427491)))

(assert (=> d!101387 (= res!519326 (= (select (arr!20248 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101387 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!427491)))

(declare-fun b!767698 () Bool)

(declare-fun e!427492 () Bool)

(assert (=> b!767698 (= e!427491 e!427492)))

(declare-fun res!519327 () Bool)

(assert (=> b!767698 (=> (not res!519327) (not e!427492))))

(assert (=> b!767698 (= res!519327 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20669 a!3186)))))

(declare-fun b!767699 () Bool)

(assert (=> b!767699 (= e!427492 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101387 (not res!519326)) b!767698))

(assert (= (and b!767698 res!519327) b!767699))

(assert (=> d!101387 m!713319))

(declare-fun m!713397 () Bool)

(assert (=> b!767699 m!713397))

(assert (=> b!767462 d!101387))

(declare-fun b!767706 () Bool)

(declare-fun e!427497 () SeekEntryResult!7848)

(assert (=> b!767706 (= e!427497 (Intermediate!7848 true (toIndex!0 (select (arr!20248 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767707 () Bool)

(declare-fun e!427496 () Bool)

(declare-fun lt!341513 () SeekEntryResult!7848)

(assert (=> b!767707 (= e!427496 (bvsge (x!64674 lt!341513) #b01111111111111111111111111111110))))

(declare-fun b!767708 () Bool)

(declare-fun e!427498 () SeekEntryResult!7848)

(assert (=> b!767708 (= e!427498 (Intermediate!7848 false (toIndex!0 (select (arr!20248 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767709 () Bool)

(assert (=> b!767709 (and (bvsge (index!33762 lt!341513) #b00000000000000000000000000000000) (bvslt (index!33762 lt!341513) (size!20669 a!3186)))))

(declare-fun res!519329 () Bool)

(assert (=> b!767709 (= res!519329 (= (select (arr!20248 a!3186) (index!33762 lt!341513)) (select (arr!20248 a!3186) j!159)))))

(declare-fun e!427499 () Bool)

(assert (=> b!767709 (=> res!519329 e!427499)))

(declare-fun e!427500 () Bool)

(assert (=> b!767709 (= e!427500 e!427499)))

(declare-fun b!767710 () Bool)

(assert (=> b!767710 (= e!427497 e!427498)))

(declare-fun c!84582 () Bool)

(declare-fun lt!341512 () (_ BitVec 64))

(assert (=> b!767710 (= c!84582 (or (= lt!341512 (select (arr!20248 a!3186) j!159)) (= (bvadd lt!341512 lt!341512) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!101389 () Bool)

(assert (=> d!101389 e!427496))

(declare-fun c!84583 () Bool)

(assert (=> d!101389 (= c!84583 (and ((_ is Intermediate!7848) lt!341513) (undefined!8660 lt!341513)))))

(assert (=> d!101389 (= lt!341513 e!427497)))

(declare-fun c!84581 () Bool)

(assert (=> d!101389 (= c!84581 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101389 (= lt!341512 (select (arr!20248 a!3186) (toIndex!0 (select (arr!20248 a!3186) j!159) mask!3328)))))

(assert (=> d!101389 (validMask!0 mask!3328)))

(assert (=> d!101389 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20248 a!3186) j!159) mask!3328) (select (arr!20248 a!3186) j!159) a!3186 mask!3328) lt!341513)))

(declare-fun b!767711 () Bool)

(assert (=> b!767711 (and (bvsge (index!33762 lt!341513) #b00000000000000000000000000000000) (bvslt (index!33762 lt!341513) (size!20669 a!3186)))))

(assert (=> b!767711 (= e!427499 (= (select (arr!20248 a!3186) (index!33762 lt!341513)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767712 () Bool)

(assert (=> b!767712 (= e!427498 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20248 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20248 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767713 () Bool)

(assert (=> b!767713 (= e!427496 e!427500)))

(declare-fun res!519330 () Bool)

(assert (=> b!767713 (= res!519330 (and ((_ is Intermediate!7848) lt!341513) (not (undefined!8660 lt!341513)) (bvslt (x!64674 lt!341513) #b01111111111111111111111111111110) (bvsge (x!64674 lt!341513) #b00000000000000000000000000000000) (bvsge (x!64674 lt!341513) #b00000000000000000000000000000000)))))

(assert (=> b!767713 (=> (not res!519330) (not e!427500))))

(declare-fun b!767714 () Bool)

(assert (=> b!767714 (and (bvsge (index!33762 lt!341513) #b00000000000000000000000000000000) (bvslt (index!33762 lt!341513) (size!20669 a!3186)))))

(declare-fun res!519328 () Bool)

(assert (=> b!767714 (= res!519328 (= (select (arr!20248 a!3186) (index!33762 lt!341513)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767714 (=> res!519328 e!427499)))

(assert (= (and d!101389 c!84581) b!767706))

(assert (= (and d!101389 (not c!84581)) b!767710))

(assert (= (and b!767710 c!84582) b!767708))

(assert (= (and b!767710 (not c!84582)) b!767712))

(assert (= (and d!101389 c!84583) b!767707))

(assert (= (and d!101389 (not c!84583)) b!767713))

(assert (= (and b!767713 res!519330) b!767709))

(assert (= (and b!767709 (not res!519329)) b!767714))

(assert (= (and b!767714 (not res!519328)) b!767711))

(declare-fun m!713407 () Bool)

(assert (=> b!767711 m!713407))

(assert (=> b!767712 m!713221))

(declare-fun m!713409 () Bool)

(assert (=> b!767712 m!713409))

(assert (=> b!767712 m!713409))

(assert (=> b!767712 m!713219))

(declare-fun m!713411 () Bool)

(assert (=> b!767712 m!713411))

(assert (=> b!767709 m!713407))

(assert (=> d!101389 m!713221))

(declare-fun m!713413 () Bool)

(assert (=> d!101389 m!713413))

(assert (=> d!101389 m!713241))

(assert (=> b!767714 m!713407))

(assert (=> b!767451 d!101389))

(declare-fun d!101393 () Bool)

(declare-fun lt!341517 () (_ BitVec 32))

(declare-fun lt!341516 () (_ BitVec 32))

(assert (=> d!101393 (= lt!341517 (bvmul (bvxor lt!341516 (bvlshr lt!341516 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101393 (= lt!341516 ((_ extract 31 0) (bvand (bvxor (select (arr!20248 a!3186) j!159) (bvlshr (select (arr!20248 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101393 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519321 (let ((h!15342 ((_ extract 31 0) (bvand (bvxor (select (arr!20248 a!3186) j!159) (bvlshr (select (arr!20248 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64680 (bvmul (bvxor h!15342 (bvlshr h!15342 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64680 (bvlshr x!64680 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519321 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519321 #b00000000000000000000000000000000))))))

(assert (=> d!101393 (= (toIndex!0 (select (arr!20248 a!3186) j!159) mask!3328) (bvand (bvxor lt!341517 (bvlshr lt!341517 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!767451 d!101393))

(declare-fun b!767769 () Bool)

(declare-fun e!427530 () SeekEntryResult!7848)

(assert (=> b!767769 (= e!427530 (Found!7848 index!1321))))

(declare-fun lt!341533 () SeekEntryResult!7848)

(declare-fun d!101397 () Bool)

(assert (=> d!101397 (and (or ((_ is Undefined!7848) lt!341533) (not ((_ is Found!7848) lt!341533)) (and (bvsge (index!33761 lt!341533) #b00000000000000000000000000000000) (bvslt (index!33761 lt!341533) (size!20669 a!3186)))) (or ((_ is Undefined!7848) lt!341533) ((_ is Found!7848) lt!341533) (not ((_ is MissingVacant!7848) lt!341533)) (not (= (index!33763 lt!341533) resIntermediateIndex!5)) (and (bvsge (index!33763 lt!341533) #b00000000000000000000000000000000) (bvslt (index!33763 lt!341533) (size!20669 a!3186)))) (or ((_ is Undefined!7848) lt!341533) (ite ((_ is Found!7848) lt!341533) (= (select (arr!20248 a!3186) (index!33761 lt!341533)) (select (arr!20248 a!3186) j!159)) (and ((_ is MissingVacant!7848) lt!341533) (= (index!33763 lt!341533) resIntermediateIndex!5) (= (select (arr!20248 a!3186) (index!33763 lt!341533)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!427532 () SeekEntryResult!7848)

(assert (=> d!101397 (= lt!341533 e!427532)))

(declare-fun c!84605 () Bool)

(assert (=> d!101397 (= c!84605 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!341534 () (_ BitVec 64))

(assert (=> d!101397 (= lt!341534 (select (arr!20248 a!3186) index!1321))))

(assert (=> d!101397 (validMask!0 mask!3328)))

(assert (=> d!101397 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20248 a!3186) j!159) a!3186 mask!3328) lt!341533)))

(declare-fun b!767770 () Bool)

(declare-fun c!84606 () Bool)

(assert (=> b!767770 (= c!84606 (= lt!341534 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427531 () SeekEntryResult!7848)

(assert (=> b!767770 (= e!427530 e!427531)))

(declare-fun b!767771 () Bool)

(assert (=> b!767771 (= e!427532 Undefined!7848)))

(declare-fun b!767772 () Bool)

(assert (=> b!767772 (= e!427531 (MissingVacant!7848 resIntermediateIndex!5))))

(declare-fun b!767773 () Bool)

(assert (=> b!767773 (= e!427531 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20248 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767774 () Bool)

(assert (=> b!767774 (= e!427532 e!427530)))

(declare-fun c!84607 () Bool)

(assert (=> b!767774 (= c!84607 (= lt!341534 (select (arr!20248 a!3186) j!159)))))

(assert (= (and d!101397 c!84605) b!767771))

(assert (= (and d!101397 (not c!84605)) b!767774))

(assert (= (and b!767774 c!84607) b!767769))

(assert (= (and b!767774 (not c!84607)) b!767770))

(assert (= (and b!767770 c!84606) b!767772))

(assert (= (and b!767770 (not c!84606)) b!767773))

(declare-fun m!713431 () Bool)

(assert (=> d!101397 m!713431))

(declare-fun m!713435 () Bool)

(assert (=> d!101397 m!713435))

(declare-fun m!713439 () Bool)

(assert (=> d!101397 m!713439))

(assert (=> d!101397 m!713241))

(assert (=> b!767773 m!713255))

(assert (=> b!767773 m!713255))

(assert (=> b!767773 m!713219))

(declare-fun m!713443 () Bool)

(assert (=> b!767773 m!713443))

(assert (=> b!767452 d!101397))

(declare-fun b!767775 () Bool)

(declare-fun e!427533 () SeekEntryResult!7848)

(assert (=> b!767775 (= e!427533 (Found!7848 resIntermediateIndex!5))))

(declare-fun d!101405 () Bool)

(declare-fun lt!341535 () SeekEntryResult!7848)

(assert (=> d!101405 (and (or ((_ is Undefined!7848) lt!341535) (not ((_ is Found!7848) lt!341535)) (and (bvsge (index!33761 lt!341535) #b00000000000000000000000000000000) (bvslt (index!33761 lt!341535) (size!20669 a!3186)))) (or ((_ is Undefined!7848) lt!341535) ((_ is Found!7848) lt!341535) (not ((_ is MissingVacant!7848) lt!341535)) (not (= (index!33763 lt!341535) resIntermediateIndex!5)) (and (bvsge (index!33763 lt!341535) #b00000000000000000000000000000000) (bvslt (index!33763 lt!341535) (size!20669 a!3186)))) (or ((_ is Undefined!7848) lt!341535) (ite ((_ is Found!7848) lt!341535) (= (select (arr!20248 a!3186) (index!33761 lt!341535)) (select (arr!20248 a!3186) j!159)) (and ((_ is MissingVacant!7848) lt!341535) (= (index!33763 lt!341535) resIntermediateIndex!5) (= (select (arr!20248 a!3186) (index!33763 lt!341535)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!427535 () SeekEntryResult!7848)

(assert (=> d!101405 (= lt!341535 e!427535)))

(declare-fun c!84608 () Bool)

(assert (=> d!101405 (= c!84608 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!341536 () (_ BitVec 64))

(assert (=> d!101405 (= lt!341536 (select (arr!20248 a!3186) resIntermediateIndex!5))))

(assert (=> d!101405 (validMask!0 mask!3328)))

(assert (=> d!101405 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20248 a!3186) j!159) a!3186 mask!3328) lt!341535)))

(declare-fun b!767776 () Bool)

(declare-fun c!84609 () Bool)

(assert (=> b!767776 (= c!84609 (= lt!341536 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427534 () SeekEntryResult!7848)

(assert (=> b!767776 (= e!427533 e!427534)))

(declare-fun b!767777 () Bool)

(assert (=> b!767777 (= e!427535 Undefined!7848)))

(declare-fun b!767778 () Bool)

(assert (=> b!767778 (= e!427534 (MissingVacant!7848 resIntermediateIndex!5))))

(declare-fun b!767779 () Bool)

(assert (=> b!767779 (= e!427534 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20248 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767780 () Bool)

(assert (=> b!767780 (= e!427535 e!427533)))

(declare-fun c!84610 () Bool)

(assert (=> b!767780 (= c!84610 (= lt!341536 (select (arr!20248 a!3186) j!159)))))

(assert (= (and d!101405 c!84608) b!767777))

(assert (= (and d!101405 (not c!84608)) b!767780))

(assert (= (and b!767780 c!84610) b!767775))

(assert (= (and b!767780 (not c!84610)) b!767776))

(assert (= (and b!767776 c!84609) b!767778))

(assert (= (and b!767776 (not c!84609)) b!767779))

(declare-fun m!713445 () Bool)

(assert (=> d!101405 m!713445))

(declare-fun m!713447 () Bool)

(assert (=> d!101405 m!713447))

(assert (=> d!101405 m!713253))

(assert (=> d!101405 m!713241))

(declare-fun m!713449 () Bool)

(assert (=> b!767779 m!713449))

(assert (=> b!767779 m!713449))

(assert (=> b!767779 m!713219))

(declare-fun m!713451 () Bool)

(assert (=> b!767779 m!713451))

(assert (=> b!767466 d!101405))

(declare-fun d!101407 () Bool)

(declare-fun lt!341538 () SeekEntryResult!7848)

(assert (=> d!101407 (and (or ((_ is Undefined!7848) lt!341538) (not ((_ is Found!7848) lt!341538)) (and (bvsge (index!33761 lt!341538) #b00000000000000000000000000000000) (bvslt (index!33761 lt!341538) (size!20669 a!3186)))) (or ((_ is Undefined!7848) lt!341538) ((_ is Found!7848) lt!341538) (not ((_ is MissingZero!7848) lt!341538)) (and (bvsge (index!33760 lt!341538) #b00000000000000000000000000000000) (bvslt (index!33760 lt!341538) (size!20669 a!3186)))) (or ((_ is Undefined!7848) lt!341538) ((_ is Found!7848) lt!341538) ((_ is MissingZero!7848) lt!341538) (not ((_ is MissingVacant!7848) lt!341538)) (and (bvsge (index!33763 lt!341538) #b00000000000000000000000000000000) (bvslt (index!33763 lt!341538) (size!20669 a!3186)))) (or ((_ is Undefined!7848) lt!341538) (ite ((_ is Found!7848) lt!341538) (= (select (arr!20248 a!3186) (index!33761 lt!341538)) k0!2102) (ite ((_ is MissingZero!7848) lt!341538) (= (select (arr!20248 a!3186) (index!33760 lt!341538)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7848) lt!341538) (= (select (arr!20248 a!3186) (index!33763 lt!341538)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!427538 () SeekEntryResult!7848)

(assert (=> d!101407 (= lt!341538 e!427538)))

(declare-fun c!84613 () Bool)

(declare-fun lt!341537 () SeekEntryResult!7848)

(assert (=> d!101407 (= c!84613 (and ((_ is Intermediate!7848) lt!341537) (undefined!8660 lt!341537)))))

(assert (=> d!101407 (= lt!341537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101407 (validMask!0 mask!3328)))

(assert (=> d!101407 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!341538)))

(declare-fun b!767781 () Bool)

(assert (=> b!767781 (= e!427538 Undefined!7848)))

(declare-fun b!767782 () Bool)

(declare-fun e!427537 () SeekEntryResult!7848)

(assert (=> b!767782 (= e!427537 (Found!7848 (index!33762 lt!341537)))))

(declare-fun b!767783 () Bool)

(declare-fun e!427536 () SeekEntryResult!7848)

(assert (=> b!767783 (= e!427536 (seekKeyOrZeroReturnVacant!0 (x!64674 lt!341537) (index!33762 lt!341537) (index!33762 lt!341537) k0!2102 a!3186 mask!3328))))

(declare-fun b!767784 () Bool)

(assert (=> b!767784 (= e!427538 e!427537)))

(declare-fun lt!341539 () (_ BitVec 64))

(assert (=> b!767784 (= lt!341539 (select (arr!20248 a!3186) (index!33762 lt!341537)))))

(declare-fun c!84612 () Bool)

(assert (=> b!767784 (= c!84612 (= lt!341539 k0!2102))))

(declare-fun b!767785 () Bool)

(declare-fun c!84611 () Bool)

(assert (=> b!767785 (= c!84611 (= lt!341539 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767785 (= e!427537 e!427536)))

(declare-fun b!767786 () Bool)

(assert (=> b!767786 (= e!427536 (MissingZero!7848 (index!33762 lt!341537)))))

(assert (= (and d!101407 c!84613) b!767781))

(assert (= (and d!101407 (not c!84613)) b!767784))

(assert (= (and b!767784 c!84612) b!767782))

(assert (= (and b!767784 (not c!84612)) b!767785))

(assert (= (and b!767785 c!84611) b!767786))

(assert (= (and b!767785 (not c!84611)) b!767783))

(declare-fun m!713453 () Bool)

(assert (=> d!101407 m!713453))

(declare-fun m!713455 () Bool)

(assert (=> d!101407 m!713455))

(assert (=> d!101407 m!713453))

(declare-fun m!713457 () Bool)

(assert (=> d!101407 m!713457))

(declare-fun m!713459 () Bool)

(assert (=> d!101407 m!713459))

(declare-fun m!713461 () Bool)

(assert (=> d!101407 m!713461))

(assert (=> d!101407 m!713241))

(declare-fun m!713463 () Bool)

(assert (=> b!767783 m!713463))

(declare-fun m!713465 () Bool)

(assert (=> b!767784 m!713465))

(assert (=> b!767455 d!101407))

(declare-fun b!767799 () Bool)

(declare-fun e!427547 () Bool)

(declare-fun e!427543 () Bool)

(assert (=> b!767799 (= e!427547 e!427543)))

(declare-fun lt!341546 () (_ BitVec 64))

(assert (=> b!767799 (= lt!341546 (select (arr!20248 a!3186) j!159))))

(declare-fun lt!341548 () Unit!26422)

(assert (=> b!767799 (= lt!341548 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341546 j!159))))

(assert (=> b!767799 (arrayContainsKey!0 a!3186 lt!341546 #b00000000000000000000000000000000)))

(declare-fun lt!341547 () Unit!26422)

(assert (=> b!767799 (= lt!341547 lt!341548)))

(declare-fun res!519344 () Bool)

(assert (=> b!767799 (= res!519344 (= (seekEntryOrOpen!0 (select (arr!20248 a!3186) j!159) a!3186 mask!3328) (Found!7848 j!159)))))

(assert (=> b!767799 (=> (not res!519344) (not e!427543))))

(declare-fun b!767800 () Bool)

(declare-fun call!35071 () Bool)

(assert (=> b!767800 (= e!427543 call!35071)))

(declare-fun d!101409 () Bool)

(declare-fun res!519345 () Bool)

(declare-fun e!427545 () Bool)

(assert (=> d!101409 (=> res!519345 e!427545)))

(assert (=> d!101409 (= res!519345 (bvsge j!159 (size!20669 a!3186)))))

(assert (=> d!101409 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!427545)))

(declare-fun bm!35068 () Bool)

(assert (=> bm!35068 (= call!35071 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!767801 () Bool)

(assert (=> b!767801 (= e!427545 e!427547)))

(declare-fun c!84618 () Bool)

(assert (=> b!767801 (= c!84618 (validKeyInArray!0 (select (arr!20248 a!3186) j!159)))))

(declare-fun b!767802 () Bool)

(assert (=> b!767802 (= e!427547 call!35071)))

(assert (= (and d!101409 (not res!519345)) b!767801))

(assert (= (and b!767801 c!84618) b!767799))

(assert (= (and b!767801 (not c!84618)) b!767802))

(assert (= (and b!767799 res!519344) b!767800))

(assert (= (or b!767800 b!767802) bm!35068))

(assert (=> b!767799 m!713219))

(declare-fun m!713467 () Bool)

(assert (=> b!767799 m!713467))

(declare-fun m!713469 () Bool)

(assert (=> b!767799 m!713469))

(assert (=> b!767799 m!713219))

(assert (=> b!767799 m!713261))

(declare-fun m!713471 () Bool)

(assert (=> bm!35068 m!713471))

(assert (=> b!767801 m!713219))

(assert (=> b!767801 m!713219))

(assert (=> b!767801 m!713245))

(assert (=> b!767456 d!101409))

(declare-fun d!101411 () Bool)

(assert (=> d!101411 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!341560 () Unit!26422)

(declare-fun choose!38 (array!42290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26422)

(assert (=> d!101411 (= lt!341560 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101411 (validMask!0 mask!3328)))

(assert (=> d!101411 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!341560)))

(declare-fun bs!21524 () Bool)

(assert (= bs!21524 d!101411))

(assert (=> bs!21524 m!713263))

(declare-fun m!713479 () Bool)

(assert (=> bs!21524 m!713479))

(assert (=> bs!21524 m!713241))

(assert (=> b!767456 d!101411))

(assert (=> b!767454 d!101397))

(declare-fun b!767809 () Bool)

(declare-fun e!427552 () SeekEntryResult!7848)

(assert (=> b!767809 (= e!427552 (Intermediate!7848 true index!1321 x!1131))))

(declare-fun b!767810 () Bool)

(declare-fun e!427551 () Bool)

(declare-fun lt!341562 () SeekEntryResult!7848)

(assert (=> b!767810 (= e!427551 (bvsge (x!64674 lt!341562) #b01111111111111111111111111111110))))

(declare-fun b!767811 () Bool)

(declare-fun e!427553 () SeekEntryResult!7848)

(assert (=> b!767811 (= e!427553 (Intermediate!7848 false index!1321 x!1131))))

(declare-fun b!767812 () Bool)

(assert (=> b!767812 (and (bvsge (index!33762 lt!341562) #b00000000000000000000000000000000) (bvslt (index!33762 lt!341562) (size!20669 a!3186)))))

(declare-fun res!519347 () Bool)

(assert (=> b!767812 (= res!519347 (= (select (arr!20248 a!3186) (index!33762 lt!341562)) (select (arr!20248 a!3186) j!159)))))

(declare-fun e!427554 () Bool)

(assert (=> b!767812 (=> res!519347 e!427554)))

(declare-fun e!427555 () Bool)

(assert (=> b!767812 (= e!427555 e!427554)))

(declare-fun b!767813 () Bool)

(assert (=> b!767813 (= e!427552 e!427553)))

(declare-fun c!84625 () Bool)

(declare-fun lt!341561 () (_ BitVec 64))

(assert (=> b!767813 (= c!84625 (or (= lt!341561 (select (arr!20248 a!3186) j!159)) (= (bvadd lt!341561 lt!341561) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!101415 () Bool)

(assert (=> d!101415 e!427551))

(declare-fun c!84626 () Bool)

(assert (=> d!101415 (= c!84626 (and ((_ is Intermediate!7848) lt!341562) (undefined!8660 lt!341562)))))

(assert (=> d!101415 (= lt!341562 e!427552)))

(declare-fun c!84624 () Bool)

(assert (=> d!101415 (= c!84624 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101415 (= lt!341561 (select (arr!20248 a!3186) index!1321))))

(assert (=> d!101415 (validMask!0 mask!3328)))

(assert (=> d!101415 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20248 a!3186) j!159) a!3186 mask!3328) lt!341562)))

(declare-fun b!767814 () Bool)

(assert (=> b!767814 (and (bvsge (index!33762 lt!341562) #b00000000000000000000000000000000) (bvslt (index!33762 lt!341562) (size!20669 a!3186)))))

(assert (=> b!767814 (= e!427554 (= (select (arr!20248 a!3186) (index!33762 lt!341562)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767815 () Bool)

(assert (=> b!767815 (= e!427553 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20248 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767816 () Bool)

(assert (=> b!767816 (= e!427551 e!427555)))

(declare-fun res!519348 () Bool)

(assert (=> b!767816 (= res!519348 (and ((_ is Intermediate!7848) lt!341562) (not (undefined!8660 lt!341562)) (bvslt (x!64674 lt!341562) #b01111111111111111111111111111110) (bvsge (x!64674 lt!341562) #b00000000000000000000000000000000) (bvsge (x!64674 lt!341562) x!1131)))))

(assert (=> b!767816 (=> (not res!519348) (not e!427555))))

(declare-fun b!767817 () Bool)

(assert (=> b!767817 (and (bvsge (index!33762 lt!341562) #b00000000000000000000000000000000) (bvslt (index!33762 lt!341562) (size!20669 a!3186)))))

(declare-fun res!519346 () Bool)

(assert (=> b!767817 (= res!519346 (= (select (arr!20248 a!3186) (index!33762 lt!341562)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767817 (=> res!519346 e!427554)))

(assert (= (and d!101415 c!84624) b!767809))

(assert (= (and d!101415 (not c!84624)) b!767813))

(assert (= (and b!767813 c!84625) b!767811))

(assert (= (and b!767813 (not c!84625)) b!767815))

(assert (= (and d!101415 c!84626) b!767810))

(assert (= (and d!101415 (not c!84626)) b!767816))

(assert (= (and b!767816 res!519348) b!767812))

(assert (= (and b!767812 (not res!519347)) b!767817))

(assert (= (and b!767817 (not res!519346)) b!767814))

(declare-fun m!713493 () Bool)

(assert (=> b!767814 m!713493))

(assert (=> b!767815 m!713255))

(assert (=> b!767815 m!713255))

(assert (=> b!767815 m!713219))

(declare-fun m!713497 () Bool)

(assert (=> b!767815 m!713497))

(assert (=> b!767812 m!713493))

(assert (=> d!101415 m!713439))

(assert (=> d!101415 m!713241))

(assert (=> b!767817 m!713493))

(assert (=> b!767465 d!101415))

(declare-fun d!101421 () Bool)

(assert (=> d!101421 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!767458 d!101421))

(declare-fun b!767824 () Bool)

(declare-fun e!427559 () SeekEntryResult!7848)

(assert (=> b!767824 (= e!427559 (Found!7848 lt!341404))))

(declare-fun lt!341565 () SeekEntryResult!7848)

(declare-fun d!101423 () Bool)

(assert (=> d!101423 (and (or ((_ is Undefined!7848) lt!341565) (not ((_ is Found!7848) lt!341565)) (and (bvsge (index!33761 lt!341565) #b00000000000000000000000000000000) (bvslt (index!33761 lt!341565) (size!20669 a!3186)))) (or ((_ is Undefined!7848) lt!341565) ((_ is Found!7848) lt!341565) (not ((_ is MissingVacant!7848) lt!341565)) (not (= (index!33763 lt!341565) resIntermediateIndex!5)) (and (bvsge (index!33763 lt!341565) #b00000000000000000000000000000000) (bvslt (index!33763 lt!341565) (size!20669 a!3186)))) (or ((_ is Undefined!7848) lt!341565) (ite ((_ is Found!7848) lt!341565) (= (select (arr!20248 a!3186) (index!33761 lt!341565)) (select (arr!20248 a!3186) j!159)) (and ((_ is MissingVacant!7848) lt!341565) (= (index!33763 lt!341565) resIntermediateIndex!5) (= (select (arr!20248 a!3186) (index!33763 lt!341565)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!427561 () SeekEntryResult!7848)

(assert (=> d!101423 (= lt!341565 e!427561)))

(declare-fun c!84630 () Bool)

(assert (=> d!101423 (= c!84630 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!341566 () (_ BitVec 64))

(assert (=> d!101423 (= lt!341566 (select (arr!20248 a!3186) lt!341404))))

(assert (=> d!101423 (validMask!0 mask!3328)))

(assert (=> d!101423 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341404 resIntermediateIndex!5 (select (arr!20248 a!3186) j!159) a!3186 mask!3328) lt!341565)))

(declare-fun b!767825 () Bool)

(declare-fun c!84631 () Bool)

(assert (=> b!767825 (= c!84631 (= lt!341566 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427560 () SeekEntryResult!7848)

(assert (=> b!767825 (= e!427559 e!427560)))

(declare-fun b!767826 () Bool)

(assert (=> b!767826 (= e!427561 Undefined!7848)))

(declare-fun b!767827 () Bool)

(assert (=> b!767827 (= e!427560 (MissingVacant!7848 resIntermediateIndex!5))))

(declare-fun b!767828 () Bool)

(assert (=> b!767828 (= e!427560 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!341404 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20248 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767829 () Bool)

(assert (=> b!767829 (= e!427561 e!427559)))

(declare-fun c!84632 () Bool)

(assert (=> b!767829 (= c!84632 (= lt!341566 (select (arr!20248 a!3186) j!159)))))

(assert (= (and d!101423 c!84630) b!767826))

(assert (= (and d!101423 (not c!84630)) b!767829))

(assert (= (and b!767829 c!84632) b!767824))

(assert (= (and b!767829 (not c!84632)) b!767825))

(assert (= (and b!767825 c!84631) b!767827))

(assert (= (and b!767825 (not c!84631)) b!767828))

(declare-fun m!713499 () Bool)

(assert (=> d!101423 m!713499))

(declare-fun m!713501 () Bool)

(assert (=> d!101423 m!713501))

(declare-fun m!713503 () Bool)

(assert (=> d!101423 m!713503))

(assert (=> d!101423 m!713241))

(declare-fun m!713505 () Bool)

(assert (=> b!767828 m!713505))

(assert (=> b!767828 m!713505))

(assert (=> b!767828 m!713219))

(declare-fun m!713507 () Bool)

(assert (=> b!767828 m!713507))

(assert (=> b!767457 d!101423))

(check-sat (not b!767539) (not b!767554) (not d!101377) (not b!767799) (not d!101397) (not d!101415) (not b!767540) (not b!767828) (not b!767712) (not b!767779) (not b!767815) (not b!767773) (not d!101405) (not d!101381) (not bm!35064) (not d!101357) (not b!767801) (not b!767699) (not b!767783) (not b!767552) (not b!767652) (not bm!35068) (not b!767570) (not d!101365) (not d!101423) (not b!767541) (not b!767661) (not d!101389) (not bm!35067) (not d!101411) (not d!101407))
(check-sat)
