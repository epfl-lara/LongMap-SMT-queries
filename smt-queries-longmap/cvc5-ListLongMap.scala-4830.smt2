; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66386 () Bool)

(assert start!66386)

(declare-fun b!765089 () Bool)

(declare-fun res!517622 () Bool)

(declare-fun e!426102 () Bool)

(assert (=> b!765089 (=> (not res!517622) (not e!426102))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765089 (= res!517622 (validKeyInArray!0 k!2102))))

(declare-datatypes ((array!42228 0))(
  ( (array!42229 (arr!20220 (Array (_ BitVec 32) (_ BitVec 64))) (size!20641 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42228)

(declare-fun b!765090 () Bool)

(declare-fun e!426097 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7820 0))(
  ( (MissingZero!7820 (index!33648 (_ BitVec 32))) (Found!7820 (index!33649 (_ BitVec 32))) (Intermediate!7820 (undefined!8632 Bool) (index!33650 (_ BitVec 32)) (x!64553 (_ BitVec 32))) (Undefined!7820) (MissingVacant!7820 (index!33651 (_ BitVec 32))) )
))
(declare-fun lt!340396 () SeekEntryResult!7820)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42228 (_ BitVec 32)) SeekEntryResult!7820)

(assert (=> b!765090 (= e!426097 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20220 a!3186) j!159) a!3186 mask!3328) lt!340396))))

(declare-fun b!765091 () Bool)

(declare-fun res!517629 () Bool)

(assert (=> b!765091 (=> (not res!517629) (not e!426102))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!765091 (= res!517629 (and (= (size!20641 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20641 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20641 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!765092 () Bool)

(declare-fun res!517624 () Bool)

(declare-fun e!426099 () Bool)

(assert (=> b!765092 (=> (not res!517624) (not e!426099))))

(assert (=> b!765092 (= res!517624 e!426097)))

(declare-fun c!84124 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!765092 (= c!84124 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!765093 () Bool)

(declare-fun e!426101 () Bool)

(assert (=> b!765093 (= e!426102 e!426101)))

(declare-fun res!517626 () Bool)

(assert (=> b!765093 (=> (not res!517626) (not e!426101))))

(declare-fun lt!340400 () SeekEntryResult!7820)

(assert (=> b!765093 (= res!517626 (or (= lt!340400 (MissingZero!7820 i!1173)) (= lt!340400 (MissingVacant!7820 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42228 (_ BitVec 32)) SeekEntryResult!7820)

(assert (=> b!765093 (= lt!340400 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!765094 () Bool)

(declare-fun e!426098 () Bool)

(assert (=> b!765094 (= e!426099 e!426098)))

(declare-fun res!517618 () Bool)

(assert (=> b!765094 (=> (not res!517618) (not e!426098))))

(declare-fun lt!340398 () (_ BitVec 64))

(declare-fun lt!340397 () array!42228)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765094 (= res!517618 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340398 mask!3328) lt!340398 lt!340397 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340398 lt!340397 mask!3328)))))

(assert (=> b!765094 (= lt!340398 (select (store (arr!20220 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!765094 (= lt!340397 (array!42229 (store (arr!20220 a!3186) i!1173 k!2102) (size!20641 a!3186)))))

(declare-fun b!765096 () Bool)

(declare-fun res!517627 () Bool)

(assert (=> b!765096 (=> (not res!517627) (not e!426101))))

(declare-datatypes ((List!14222 0))(
  ( (Nil!14219) (Cons!14218 (h!15305 (_ BitVec 64)) (t!20537 List!14222)) )
))
(declare-fun arrayNoDuplicates!0 (array!42228 (_ BitVec 32) List!14222) Bool)

(assert (=> b!765096 (= res!517627 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14219))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!765097 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42228 (_ BitVec 32)) SeekEntryResult!7820)

(assert (=> b!765097 (= e!426097 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20220 a!3186) j!159) a!3186 mask!3328) (Found!7820 j!159)))))

(declare-fun b!765098 () Bool)

(declare-fun e!426100 () Bool)

(assert (=> b!765098 (= e!426100 (= (seekEntryOrOpen!0 (select (arr!20220 a!3186) j!159) a!3186 mask!3328) (Found!7820 j!159)))))

(declare-fun b!765099 () Bool)

(declare-fun res!517619 () Bool)

(assert (=> b!765099 (=> (not res!517619) (not e!426101))))

(assert (=> b!765099 (= res!517619 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20641 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20641 a!3186))))))

(declare-fun b!765100 () Bool)

(assert (=> b!765100 (= e!426098 (not (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20220 a!3186) j!159) a!3186 mask!3328) (Found!7820 j!159))))))

(assert (=> b!765100 e!426100))

(declare-fun res!517630 () Bool)

(assert (=> b!765100 (=> (not res!517630) (not e!426100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42228 (_ BitVec 32)) Bool)

(assert (=> b!765100 (= res!517630 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26366 0))(
  ( (Unit!26367) )
))
(declare-fun lt!340399 () Unit!26366)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42228 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26366)

(assert (=> b!765100 (= lt!340399 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!765101 () Bool)

(declare-fun res!517620 () Bool)

(assert (=> b!765101 (=> (not res!517620) (not e!426102))))

(assert (=> b!765101 (= res!517620 (validKeyInArray!0 (select (arr!20220 a!3186) j!159)))))

(declare-fun b!765102 () Bool)

(declare-fun res!517623 () Bool)

(assert (=> b!765102 (=> (not res!517623) (not e!426102))))

(declare-fun arrayContainsKey!0 (array!42228 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!765102 (= res!517623 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!765103 () Bool)

(assert (=> b!765103 (= e!426101 e!426099)))

(declare-fun res!517617 () Bool)

(assert (=> b!765103 (=> (not res!517617) (not e!426099))))

(assert (=> b!765103 (= res!517617 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20220 a!3186) j!159) mask!3328) (select (arr!20220 a!3186) j!159) a!3186 mask!3328) lt!340396))))

(assert (=> b!765103 (= lt!340396 (Intermediate!7820 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!765104 () Bool)

(declare-fun res!517625 () Bool)

(assert (=> b!765104 (=> (not res!517625) (not e!426101))))

(assert (=> b!765104 (= res!517625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!765095 () Bool)

(declare-fun res!517628 () Bool)

(assert (=> b!765095 (=> (not res!517628) (not e!426099))))

(assert (=> b!765095 (= res!517628 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20220 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!517621 () Bool)

(assert (=> start!66386 (=> (not res!517621) (not e!426102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66386 (= res!517621 (validMask!0 mask!3328))))

(assert (=> start!66386 e!426102))

(assert (=> start!66386 true))

(declare-fun array_inv!16016 (array!42228) Bool)

(assert (=> start!66386 (array_inv!16016 a!3186)))

(assert (= (and start!66386 res!517621) b!765091))

(assert (= (and b!765091 res!517629) b!765101))

(assert (= (and b!765101 res!517620) b!765089))

(assert (= (and b!765089 res!517622) b!765102))

(assert (= (and b!765102 res!517623) b!765093))

(assert (= (and b!765093 res!517626) b!765104))

(assert (= (and b!765104 res!517625) b!765096))

(assert (= (and b!765096 res!517627) b!765099))

(assert (= (and b!765099 res!517619) b!765103))

(assert (= (and b!765103 res!517617) b!765095))

(assert (= (and b!765095 res!517628) b!765092))

(assert (= (and b!765092 c!84124) b!765090))

(assert (= (and b!765092 (not c!84124)) b!765097))

(assert (= (and b!765092 res!517624) b!765094))

(assert (= (and b!765094 res!517618) b!765100))

(assert (= (and b!765100 res!517630) b!765098))

(declare-fun m!711303 () Bool)

(assert (=> b!765090 m!711303))

(assert (=> b!765090 m!711303))

(declare-fun m!711305 () Bool)

(assert (=> b!765090 m!711305))

(declare-fun m!711307 () Bool)

(assert (=> b!765096 m!711307))

(declare-fun m!711309 () Bool)

(assert (=> b!765094 m!711309))

(declare-fun m!711311 () Bool)

(assert (=> b!765094 m!711311))

(declare-fun m!711313 () Bool)

(assert (=> b!765094 m!711313))

(declare-fun m!711315 () Bool)

(assert (=> b!765094 m!711315))

(declare-fun m!711317 () Bool)

(assert (=> b!765094 m!711317))

(assert (=> b!765094 m!711311))

(assert (=> b!765101 m!711303))

(assert (=> b!765101 m!711303))

(declare-fun m!711319 () Bool)

(assert (=> b!765101 m!711319))

(assert (=> b!765103 m!711303))

(assert (=> b!765103 m!711303))

(declare-fun m!711321 () Bool)

(assert (=> b!765103 m!711321))

(assert (=> b!765103 m!711321))

(assert (=> b!765103 m!711303))

(declare-fun m!711323 () Bool)

(assert (=> b!765103 m!711323))

(declare-fun m!711325 () Bool)

(assert (=> b!765093 m!711325))

(declare-fun m!711327 () Bool)

(assert (=> b!765095 m!711327))

(assert (=> b!765100 m!711303))

(assert (=> b!765100 m!711303))

(declare-fun m!711329 () Bool)

(assert (=> b!765100 m!711329))

(declare-fun m!711331 () Bool)

(assert (=> b!765100 m!711331))

(declare-fun m!711333 () Bool)

(assert (=> b!765100 m!711333))

(declare-fun m!711335 () Bool)

(assert (=> start!66386 m!711335))

(declare-fun m!711337 () Bool)

(assert (=> start!66386 m!711337))

(declare-fun m!711339 () Bool)

(assert (=> b!765089 m!711339))

(assert (=> b!765098 m!711303))

(assert (=> b!765098 m!711303))

(declare-fun m!711341 () Bool)

(assert (=> b!765098 m!711341))

(assert (=> b!765097 m!711303))

(assert (=> b!765097 m!711303))

(declare-fun m!711343 () Bool)

(assert (=> b!765097 m!711343))

(declare-fun m!711345 () Bool)

(assert (=> b!765104 m!711345))

(declare-fun m!711347 () Bool)

(assert (=> b!765102 m!711347))

(push 1)

(assert (not b!765098))

(assert (not b!765096))

(assert (not b!765097))

(assert (not b!765093))

(assert (not start!66386))

(assert (not b!765104))

(assert (not b!765090))

(assert (not b!765103))

(assert (not b!765102))

(assert (not b!765089))

(assert (not b!765101))

(assert (not b!765094))

(assert (not b!765100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!765300 () Bool)

(declare-fun e!426203 () SeekEntryResult!7820)

(assert (=> b!765300 (= e!426203 Undefined!7820)))

(declare-fun b!765301 () Bool)

(declare-fun e!426204 () SeekEntryResult!7820)

(declare-fun lt!340469 () SeekEntryResult!7820)

(assert (=> b!765301 (= e!426204 (MissingZero!7820 (index!33650 lt!340469)))))

(declare-fun b!765303 () Bool)

(declare-fun c!84168 () Bool)

(declare-fun lt!340468 () (_ BitVec 64))

(assert (=> b!765303 (= c!84168 (= lt!340468 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426205 () SeekEntryResult!7820)

(assert (=> b!765303 (= e!426205 e!426204)))

(declare-fun b!765304 () Bool)

(assert (=> b!765304 (= e!426204 (seekKeyOrZeroReturnVacant!0 (x!64553 lt!340469) (index!33650 lt!340469) (index!33650 lt!340469) (select (arr!20220 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!765305 () Bool)

(assert (=> b!765305 (= e!426205 (Found!7820 (index!33650 lt!340469)))))

(declare-fun d!101105 () Bool)

(declare-fun lt!340470 () SeekEntryResult!7820)

(assert (=> d!101105 (and (or (is-Undefined!7820 lt!340470) (not (is-Found!7820 lt!340470)) (and (bvsge (index!33649 lt!340470) #b00000000000000000000000000000000) (bvslt (index!33649 lt!340470) (size!20641 a!3186)))) (or (is-Undefined!7820 lt!340470) (is-Found!7820 lt!340470) (not (is-MissingZero!7820 lt!340470)) (and (bvsge (index!33648 lt!340470) #b00000000000000000000000000000000) (bvslt (index!33648 lt!340470) (size!20641 a!3186)))) (or (is-Undefined!7820 lt!340470) (is-Found!7820 lt!340470) (is-MissingZero!7820 lt!340470) (not (is-MissingVacant!7820 lt!340470)) (and (bvsge (index!33651 lt!340470) #b00000000000000000000000000000000) (bvslt (index!33651 lt!340470) (size!20641 a!3186)))) (or (is-Undefined!7820 lt!340470) (ite (is-Found!7820 lt!340470) (= (select (arr!20220 a!3186) (index!33649 lt!340470)) (select (arr!20220 a!3186) j!159)) (ite (is-MissingZero!7820 lt!340470) (= (select (arr!20220 a!3186) (index!33648 lt!340470)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7820 lt!340470) (= (select (arr!20220 a!3186) (index!33651 lt!340470)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101105 (= lt!340470 e!426203)))

(declare-fun c!84169 () Bool)

(assert (=> d!101105 (= c!84169 (and (is-Intermediate!7820 lt!340469) (undefined!8632 lt!340469)))))

(assert (=> d!101105 (= lt!340469 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20220 a!3186) j!159) mask!3328) (select (arr!20220 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101105 (validMask!0 mask!3328)))

(assert (=> d!101105 (= (seekEntryOrOpen!0 (select (arr!20220 a!3186) j!159) a!3186 mask!3328) lt!340470)))

(declare-fun b!765302 () Bool)

(assert (=> b!765302 (= e!426203 e!426205)))

(assert (=> b!765302 (= lt!340468 (select (arr!20220 a!3186) (index!33650 lt!340469)))))

(declare-fun c!84167 () Bool)

(assert (=> b!765302 (= c!84167 (= lt!340468 (select (arr!20220 a!3186) j!159)))))

(assert (= (and d!101105 c!84169) b!765300))

(assert (= (and d!101105 (not c!84169)) b!765302))

(assert (= (and b!765302 c!84167) b!765305))

(assert (= (and b!765302 (not c!84167)) b!765303))

(assert (= (and b!765303 c!84168) b!765301))

(assert (= (and b!765303 (not c!84168)) b!765304))

(assert (=> b!765304 m!711303))

(declare-fun m!711483 () Bool)

(assert (=> b!765304 m!711483))

(declare-fun m!711485 () Bool)

(assert (=> d!101105 m!711485))

(assert (=> d!101105 m!711335))

(assert (=> d!101105 m!711321))

(assert (=> d!101105 m!711303))

(assert (=> d!101105 m!711323))

(declare-fun m!711487 () Bool)

(assert (=> d!101105 m!711487))

(declare-fun m!711489 () Bool)

(assert (=> d!101105 m!711489))

(assert (=> d!101105 m!711303))

(assert (=> d!101105 m!711321))

(declare-fun m!711491 () Bool)

(assert (=> b!765302 m!711491))

(assert (=> b!765098 d!101105))

(declare-fun d!101113 () Bool)

(assert (=> d!101113 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!765089 d!101113))

(declare-fun b!765354 () Bool)

(declare-fun c!84190 () Bool)

(declare-fun lt!340482 () (_ BitVec 64))

(assert (=> b!765354 (= c!84190 (= lt!340482 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426235 () SeekEntryResult!7820)

(declare-fun e!426236 () SeekEntryResult!7820)

(assert (=> b!765354 (= e!426235 e!426236)))

(declare-fun b!765355 () Bool)

(assert (=> b!765355 (= e!426236 (MissingVacant!7820 resIntermediateIndex!5))))

(declare-fun b!765356 () Bool)

(assert (=> b!765356 (= e!426235 (Found!7820 resIntermediateIndex!5))))

(declare-fun b!765357 () Bool)

(declare-fun e!426237 () SeekEntryResult!7820)

(assert (=> b!765357 (= e!426237 e!426235)))

(declare-fun c!84189 () Bool)

(assert (=> b!765357 (= c!84189 (= lt!340482 (select (arr!20220 a!3186) j!159)))))

(declare-fun b!765358 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765358 (= e!426236 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20220 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101115 () Bool)

(declare-fun lt!340483 () SeekEntryResult!7820)

(assert (=> d!101115 (and (or (is-Undefined!7820 lt!340483) (not (is-Found!7820 lt!340483)) (and (bvsge (index!33649 lt!340483) #b00000000000000000000000000000000) (bvslt (index!33649 lt!340483) (size!20641 a!3186)))) (or (is-Undefined!7820 lt!340483) (is-Found!7820 lt!340483) (not (is-MissingVacant!7820 lt!340483)) (not (= (index!33651 lt!340483) resIntermediateIndex!5)) (and (bvsge (index!33651 lt!340483) #b00000000000000000000000000000000) (bvslt (index!33651 lt!340483) (size!20641 a!3186)))) (or (is-Undefined!7820 lt!340483) (ite (is-Found!7820 lt!340483) (= (select (arr!20220 a!3186) (index!33649 lt!340483)) (select (arr!20220 a!3186) j!159)) (and (is-MissingVacant!7820 lt!340483) (= (index!33651 lt!340483) resIntermediateIndex!5) (= (select (arr!20220 a!3186) (index!33651 lt!340483)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101115 (= lt!340483 e!426237)))

(declare-fun c!84188 () Bool)

(assert (=> d!101115 (= c!84188 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!101115 (= lt!340482 (select (arr!20220 a!3186) resIntermediateIndex!5))))

(assert (=> d!101115 (validMask!0 mask!3328)))

(assert (=> d!101115 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20220 a!3186) j!159) a!3186 mask!3328) lt!340483)))

(declare-fun b!765359 () Bool)

(assert (=> b!765359 (= e!426237 Undefined!7820)))

(assert (= (and d!101115 c!84188) b!765359))

(assert (= (and d!101115 (not c!84188)) b!765357))

(assert (= (and b!765357 c!84189) b!765356))

(assert (= (and b!765357 (not c!84189)) b!765354))

(assert (= (and b!765354 c!84190) b!765355))

(assert (= (and b!765354 (not c!84190)) b!765358))

(declare-fun m!711529 () Bool)

(assert (=> b!765358 m!711529))

(assert (=> b!765358 m!711529))

(assert (=> b!765358 m!711303))

(declare-fun m!711531 () Bool)

(assert (=> b!765358 m!711531))

(declare-fun m!711533 () Bool)

(assert (=> d!101115 m!711533))

(declare-fun m!711535 () Bool)

(assert (=> d!101115 m!711535))

(assert (=> d!101115 m!711327))

(assert (=> d!101115 m!711335))

(assert (=> b!765100 d!101115))

(declare-fun b!765404 () Bool)

(declare-fun e!426263 () Bool)

(declare-fun call!35028 () Bool)

(assert (=> b!765404 (= e!426263 call!35028)))

(declare-fun bm!35025 () Bool)

(assert (=> bm!35025 (= call!35028 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!765406 () Bool)

(declare-fun e!426264 () Bool)

(assert (=> b!765406 (= e!426264 e!426263)))

(declare-fun c!84211 () Bool)

(assert (=> b!765406 (= c!84211 (validKeyInArray!0 (select (arr!20220 a!3186) j!159)))))

(declare-fun b!765407 () Bool)

(declare-fun e!426262 () Bool)

(assert (=> b!765407 (= e!426262 call!35028)))

(declare-fun b!765405 () Bool)

(assert (=> b!765405 (= e!426263 e!426262)))

(declare-fun lt!340507 () (_ BitVec 64))

(assert (=> b!765405 (= lt!340507 (select (arr!20220 a!3186) j!159))))

(declare-fun lt!340505 () Unit!26366)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42228 (_ BitVec 64) (_ BitVec 32)) Unit!26366)

(assert (=> b!765405 (= lt!340505 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!340507 j!159))))

(assert (=> b!765405 (arrayContainsKey!0 a!3186 lt!340507 #b00000000000000000000000000000000)))

(declare-fun lt!340506 () Unit!26366)

(assert (=> b!765405 (= lt!340506 lt!340505)))

(declare-fun res!517760 () Bool)

(assert (=> b!765405 (= res!517760 (= (seekEntryOrOpen!0 (select (arr!20220 a!3186) j!159) a!3186 mask!3328) (Found!7820 j!159)))))

(assert (=> b!765405 (=> (not res!517760) (not e!426262))))

(declare-fun d!101129 () Bool)

(declare-fun res!517759 () Bool)

(assert (=> d!101129 (=> res!517759 e!426264)))

(assert (=> d!101129 (= res!517759 (bvsge j!159 (size!20641 a!3186)))))

(assert (=> d!101129 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!426264)))

(assert (= (and d!101129 (not res!517759)) b!765406))

(assert (= (and b!765406 c!84211) b!765405))

(assert (= (and b!765406 (not c!84211)) b!765404))

(assert (= (and b!765405 res!517760) b!765407))

(assert (= (or b!765407 b!765404) bm!35025))

(declare-fun m!711559 () Bool)

(assert (=> bm!35025 m!711559))

(assert (=> b!765406 m!711303))

(assert (=> b!765406 m!711303))

(assert (=> b!765406 m!711319))

(assert (=> b!765405 m!711303))

(declare-fun m!711561 () Bool)

(assert (=> b!765405 m!711561))

(declare-fun m!711563 () Bool)

(assert (=> b!765405 m!711563))

(assert (=> b!765405 m!711303))

(assert (=> b!765405 m!711341))

(assert (=> b!765100 d!101129))

(declare-fun d!101135 () Bool)

(assert (=> d!101135 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!340518 () Unit!26366)

(declare-fun choose!38 (array!42228 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26366)

(assert (=> d!101135 (= lt!340518 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101135 (validMask!0 mask!3328)))

(assert (=> d!101135 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!340518)))

(declare-fun bs!21486 () Bool)

(assert (= bs!21486 d!101135))

(assert (=> bs!21486 m!711331))

(declare-fun m!711573 () Bool)

(assert (=> bs!21486 m!711573))

(assert (=> bs!21486 m!711335))

(assert (=> b!765100 d!101135))

(declare-fun d!101139 () Bool)

(declare-fun e!426314 () Bool)

(assert (=> d!101139 e!426314))

(declare-fun c!84235 () Bool)

(declare-fun lt!340546 () SeekEntryResult!7820)

(assert (=> d!101139 (= c!84235 (and (is-Intermediate!7820 lt!340546) (undefined!8632 lt!340546)))))

(declare-fun e!426317 () SeekEntryResult!7820)

(assert (=> d!101139 (= lt!340546 e!426317)))

(declare-fun c!84236 () Bool)

(assert (=> d!101139 (= c!84236 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!340547 () (_ BitVec 64))

(assert (=> d!101139 (= lt!340547 (select (arr!20220 a!3186) index!1321))))

(assert (=> d!101139 (validMask!0 mask!3328)))

(assert (=> d!101139 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20220 a!3186) j!159) a!3186 mask!3328) lt!340546)))

(declare-fun b!765481 () Bool)

(assert (=> b!765481 (= e!426317 (Intermediate!7820 true index!1321 x!1131))))

(declare-fun b!765482 () Bool)

(declare-fun e!426318 () Bool)

(assert (=> b!765482 (= e!426314 e!426318)))

(declare-fun res!517791 () Bool)

(assert (=> b!765482 (= res!517791 (and (is-Intermediate!7820 lt!340546) (not (undefined!8632 lt!340546)) (bvslt (x!64553 lt!340546) #b01111111111111111111111111111110) (bvsge (x!64553 lt!340546) #b00000000000000000000000000000000) (bvsge (x!64553 lt!340546) x!1131)))))

(assert (=> b!765482 (=> (not res!517791) (not e!426318))))

(declare-fun b!765483 () Bool)

(assert (=> b!765483 (and (bvsge (index!33650 lt!340546) #b00000000000000000000000000000000) (bvslt (index!33650 lt!340546) (size!20641 a!3186)))))

(declare-fun res!517792 () Bool)

(assert (=> b!765483 (= res!517792 (= (select (arr!20220 a!3186) (index!33650 lt!340546)) (select (arr!20220 a!3186) j!159)))))

(declare-fun e!426316 () Bool)

(assert (=> b!765483 (=> res!517792 e!426316)))

(assert (=> b!765483 (= e!426318 e!426316)))

(declare-fun b!765484 () Bool)

(declare-fun e!426315 () SeekEntryResult!7820)

(assert (=> b!765484 (= e!426317 e!426315)))

(declare-fun c!84234 () Bool)

(assert (=> b!765484 (= c!84234 (or (= lt!340547 (select (arr!20220 a!3186) j!159)) (= (bvadd lt!340547 lt!340547) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765485 () Bool)

(assert (=> b!765485 (= e!426314 (bvsge (x!64553 lt!340546) #b01111111111111111111111111111110))))

(declare-fun b!765486 () Bool)

(assert (=> b!765486 (and (bvsge (index!33650 lt!340546) #b00000000000000000000000000000000) (bvslt (index!33650 lt!340546) (size!20641 a!3186)))))

(assert (=> b!765486 (= e!426316 (= (select (arr!20220 a!3186) (index!33650 lt!340546)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!765487 () Bool)

(assert (=> b!765487 (= e!426315 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20220 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!765488 () Bool)

(assert (=> b!765488 (and (bvsge (index!33650 lt!340546) #b00000000000000000000000000000000) (bvslt (index!33650 lt!340546) (size!20641 a!3186)))))

(declare-fun res!517790 () Bool)

(assert (=> b!765488 (= res!517790 (= (select (arr!20220 a!3186) (index!33650 lt!340546)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!765488 (=> res!517790 e!426316)))

(declare-fun b!765489 () Bool)

(assert (=> b!765489 (= e!426315 (Intermediate!7820 false index!1321 x!1131))))

(assert (= (and d!101139 c!84236) b!765481))

(assert (= (and d!101139 (not c!84236)) b!765484))

(assert (= (and b!765484 c!84234) b!765489))

(assert (= (and b!765484 (not c!84234)) b!765487))

(assert (= (and d!101139 c!84235) b!765485))

(assert (= (and d!101139 (not c!84235)) b!765482))

(assert (= (and b!765482 res!517791) b!765483))

(assert (= (and b!765483 (not res!517792)) b!765488))

(assert (= (and b!765488 (not res!517790)) b!765486))

(declare-fun m!711611 () Bool)

(assert (=> b!765483 m!711611))

(assert (=> b!765486 m!711611))

(declare-fun m!711613 () Bool)

(assert (=> b!765487 m!711613))

(assert (=> b!765487 m!711613))

(assert (=> b!765487 m!711303))

(declare-fun m!711615 () Bool)

(assert (=> b!765487 m!711615))

(assert (=> b!765488 m!711611))

(declare-fun m!711617 () Bool)

(assert (=> d!101139 m!711617))

(assert (=> d!101139 m!711335))

(assert (=> b!765090 d!101139))

(declare-fun d!101161 () Bool)

(assert (=> d!101161 (= (validKeyInArray!0 (select (arr!20220 a!3186) j!159)) (and (not (= (select (arr!20220 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20220 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!765101 d!101161))

(declare-fun d!101163 () Bool)

(declare-fun res!517797 () Bool)

(declare-fun e!426323 () Bool)

(assert (=> d!101163 (=> res!517797 e!426323)))

(assert (=> d!101163 (= res!517797 (= (select (arr!20220 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!101163 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!426323)))

(declare-fun b!765494 () Bool)

(declare-fun e!426324 () Bool)

(assert (=> b!765494 (= e!426323 e!426324)))

(declare-fun res!517798 () Bool)

(assert (=> b!765494 (=> (not res!517798) (not e!426324))))

(assert (=> b!765494 (= res!517798 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20641 a!3186)))))

(declare-fun b!765495 () Bool)

(assert (=> b!765495 (= e!426324 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101163 (not res!517797)) b!765494))

(assert (= (and b!765494 res!517798) b!765495))

(declare-fun m!711619 () Bool)

(assert (=> d!101163 m!711619))

(declare-fun m!711621 () Bool)

(assert (=> b!765495 m!711621))

(assert (=> b!765102 d!101163))

(declare-fun d!101165 () Bool)

(assert (=> d!101165 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66386 d!101165))

(declare-fun d!101171 () Bool)

(assert (=> d!101171 (= (array_inv!16016 a!3186) (bvsge (size!20641 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66386 d!101171))

(declare-fun d!101173 () Bool)

(declare-fun e!426325 () Bool)

(assert (=> d!101173 e!426325))

(declare-fun c!84238 () Bool)

(declare-fun lt!340548 () SeekEntryResult!7820)

(assert (=> d!101173 (= c!84238 (and (is-Intermediate!7820 lt!340548) (undefined!8632 lt!340548)))))

(declare-fun e!426328 () SeekEntryResult!7820)

(assert (=> d!101173 (= lt!340548 e!426328)))

(declare-fun c!84239 () Bool)

(assert (=> d!101173 (= c!84239 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!340549 () (_ BitVec 64))

(assert (=> d!101173 (= lt!340549 (select (arr!20220 a!3186) (toIndex!0 (select (arr!20220 a!3186) j!159) mask!3328)))))

(assert (=> d!101173 (validMask!0 mask!3328)))

(assert (=> d!101173 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20220 a!3186) j!159) mask!3328) (select (arr!20220 a!3186) j!159) a!3186 mask!3328) lt!340548)))

(declare-fun b!765496 () Bool)

(assert (=> b!765496 (= e!426328 (Intermediate!7820 true (toIndex!0 (select (arr!20220 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!765497 () Bool)

(declare-fun e!426329 () Bool)

(assert (=> b!765497 (= e!426325 e!426329)))

(declare-fun res!517800 () Bool)

(assert (=> b!765497 (= res!517800 (and (is-Intermediate!7820 lt!340548) (not (undefined!8632 lt!340548)) (bvslt (x!64553 lt!340548) #b01111111111111111111111111111110) (bvsge (x!64553 lt!340548) #b00000000000000000000000000000000) (bvsge (x!64553 lt!340548) #b00000000000000000000000000000000)))))

(assert (=> b!765497 (=> (not res!517800) (not e!426329))))

(declare-fun b!765498 () Bool)

(assert (=> b!765498 (and (bvsge (index!33650 lt!340548) #b00000000000000000000000000000000) (bvslt (index!33650 lt!340548) (size!20641 a!3186)))))

(declare-fun res!517801 () Bool)

(assert (=> b!765498 (= res!517801 (= (select (arr!20220 a!3186) (index!33650 lt!340548)) (select (arr!20220 a!3186) j!159)))))

(declare-fun e!426327 () Bool)

(assert (=> b!765498 (=> res!517801 e!426327)))

(assert (=> b!765498 (= e!426329 e!426327)))

(declare-fun b!765499 () Bool)

(declare-fun e!426326 () SeekEntryResult!7820)

(assert (=> b!765499 (= e!426328 e!426326)))

(declare-fun c!84237 () Bool)

(assert (=> b!765499 (= c!84237 (or (= lt!340549 (select (arr!20220 a!3186) j!159)) (= (bvadd lt!340549 lt!340549) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765500 () Bool)

(assert (=> b!765500 (= e!426325 (bvsge (x!64553 lt!340548) #b01111111111111111111111111111110))))

(declare-fun b!765501 () Bool)

(assert (=> b!765501 (and (bvsge (index!33650 lt!340548) #b00000000000000000000000000000000) (bvslt (index!33650 lt!340548) (size!20641 a!3186)))))

(assert (=> b!765501 (= e!426327 (= (select (arr!20220 a!3186) (index!33650 lt!340548)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!765502 () Bool)

(assert (=> b!765502 (= e!426326 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20220 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20220 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!765503 () Bool)

(assert (=> b!765503 (and (bvsge (index!33650 lt!340548) #b00000000000000000000000000000000) (bvslt (index!33650 lt!340548) (size!20641 a!3186)))))

(declare-fun res!517799 () Bool)

(assert (=> b!765503 (= res!517799 (= (select (arr!20220 a!3186) (index!33650 lt!340548)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!765503 (=> res!517799 e!426327)))

(declare-fun b!765504 () Bool)

(assert (=> b!765504 (= e!426326 (Intermediate!7820 false (toIndex!0 (select (arr!20220 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!101173 c!84239) b!765496))

(assert (= (and d!101173 (not c!84239)) b!765499))

(assert (= (and b!765499 c!84237) b!765504))

(assert (= (and b!765499 (not c!84237)) b!765502))

(assert (= (and d!101173 c!84238) b!765500))

(assert (= (and d!101173 (not c!84238)) b!765497))

(assert (= (and b!765497 res!517800) b!765498))

(assert (= (and b!765498 (not res!517801)) b!765503))

(assert (= (and b!765503 (not res!517799)) b!765501))

(declare-fun m!711623 () Bool)

(assert (=> b!765498 m!711623))

(assert (=> b!765501 m!711623))

(assert (=> b!765502 m!711321))

(declare-fun m!711625 () Bool)

(assert (=> b!765502 m!711625))

(assert (=> b!765502 m!711625))

(assert (=> b!765502 m!711303))

(declare-fun m!711627 () Bool)

(assert (=> b!765502 m!711627))

(assert (=> b!765503 m!711623))

(assert (=> d!101173 m!711321))

(declare-fun m!711629 () Bool)

(assert (=> d!101173 m!711629))

(assert (=> d!101173 m!711335))

(assert (=> b!765103 d!101173))

(declare-fun d!101175 () Bool)

(declare-fun lt!340559 () (_ BitVec 32))

(declare-fun lt!340558 () (_ BitVec 32))

(assert (=> d!101175 (= lt!340559 (bvmul (bvxor lt!340558 (bvlshr lt!340558 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101175 (= lt!340558 ((_ extract 31 0) (bvand (bvxor (select (arr!20220 a!3186) j!159) (bvlshr (select (arr!20220 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101175 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!517802 (let ((h!15309 ((_ extract 31 0) (bvand (bvxor (select (arr!20220 a!3186) j!159) (bvlshr (select (arr!20220 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64562 (bvmul (bvxor h!15309 (bvlshr h!15309 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64562 (bvlshr x!64562 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!517802 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!517802 #b00000000000000000000000000000000))))))

(assert (=> d!101175 (= (toIndex!0 (select (arr!20220 a!3186) j!159) mask!3328) (bvand (bvxor lt!340559 (bvlshr lt!340559 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!765103 d!101175))

(declare-fun b!765519 () Bool)

(declare-fun e!426338 () SeekEntryResult!7820)

(assert (=> b!765519 (= e!426338 Undefined!7820)))

(declare-fun b!765520 () Bool)

(declare-fun e!426339 () SeekEntryResult!7820)

(declare-fun lt!340561 () SeekEntryResult!7820)

(assert (=> b!765520 (= e!426339 (MissingZero!7820 (index!33650 lt!340561)))))

(declare-fun b!765522 () Bool)

(declare-fun c!84247 () Bool)

(declare-fun lt!340560 () (_ BitVec 64))

(assert (=> b!765522 (= c!84247 (= lt!340560 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426340 () SeekEntryResult!7820)

(assert (=> b!765522 (= e!426340 e!426339)))

(declare-fun b!765523 () Bool)

(assert (=> b!765523 (= e!426339 (seekKeyOrZeroReturnVacant!0 (x!64553 lt!340561) (index!33650 lt!340561) (index!33650 lt!340561) k!2102 a!3186 mask!3328))))

(declare-fun b!765524 () Bool)

(assert (=> b!765524 (= e!426340 (Found!7820 (index!33650 lt!340561)))))

(declare-fun d!101177 () Bool)

(declare-fun lt!340562 () SeekEntryResult!7820)

(assert (=> d!101177 (and (or (is-Undefined!7820 lt!340562) (not (is-Found!7820 lt!340562)) (and (bvsge (index!33649 lt!340562) #b00000000000000000000000000000000) (bvslt (index!33649 lt!340562) (size!20641 a!3186)))) (or (is-Undefined!7820 lt!340562) (is-Found!7820 lt!340562) (not (is-MissingZero!7820 lt!340562)) (and (bvsge (index!33648 lt!340562) #b00000000000000000000000000000000) (bvslt (index!33648 lt!340562) (size!20641 a!3186)))) (or (is-Undefined!7820 lt!340562) (is-Found!7820 lt!340562) (is-MissingZero!7820 lt!340562) (not (is-MissingVacant!7820 lt!340562)) (and (bvsge (index!33651 lt!340562) #b00000000000000000000000000000000) (bvslt (index!33651 lt!340562) (size!20641 a!3186)))) (or (is-Undefined!7820 lt!340562) (ite (is-Found!7820 lt!340562) (= (select (arr!20220 a!3186) (index!33649 lt!340562)) k!2102) (ite (is-MissingZero!7820 lt!340562) (= (select (arr!20220 a!3186) (index!33648 lt!340562)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7820 lt!340562) (= (select (arr!20220 a!3186) (index!33651 lt!340562)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101177 (= lt!340562 e!426338)))

(declare-fun c!84248 () Bool)

(assert (=> d!101177 (= c!84248 (and (is-Intermediate!7820 lt!340561) (undefined!8632 lt!340561)))))

(assert (=> d!101177 (= lt!340561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!101177 (validMask!0 mask!3328)))

(assert (=> d!101177 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!340562)))

(declare-fun b!765521 () Bool)

(assert (=> b!765521 (= e!426338 e!426340)))

(assert (=> b!765521 (= lt!340560 (select (arr!20220 a!3186) (index!33650 lt!340561)))))

(declare-fun c!84246 () Bool)

(assert (=> b!765521 (= c!84246 (= lt!340560 k!2102))))

(assert (= (and d!101177 c!84248) b!765519))

(assert (= (and d!101177 (not c!84248)) b!765521))

(assert (= (and b!765521 c!84246) b!765524))

(assert (= (and b!765521 (not c!84246)) b!765522))

(assert (= (and b!765522 c!84247) b!765520))

(assert (= (and b!765522 (not c!84247)) b!765523))

(declare-fun m!711631 () Bool)

(assert (=> b!765523 m!711631))

(declare-fun m!711633 () Bool)

(assert (=> d!101177 m!711633))

(assert (=> d!101177 m!711335))

(declare-fun m!711635 () Bool)

(assert (=> d!101177 m!711635))

(declare-fun m!711637 () Bool)

(assert (=> d!101177 m!711637))

(declare-fun m!711639 () Bool)

(assert (=> d!101177 m!711639))

(declare-fun m!711641 () Bool)

(assert (=> d!101177 m!711641))

(assert (=> d!101177 m!711635))

(declare-fun m!711643 () Bool)

(assert (=> b!765521 m!711643))

(assert (=> b!765093 d!101177))

(declare-fun b!765529 () Bool)

(declare-fun e!426344 () Bool)

(declare-fun call!35039 () Bool)

(assert (=> b!765529 (= e!426344 call!35039)))

(declare-fun bm!35036 () Bool)

(assert (=> bm!35036 (= call!35039 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!765531 () Bool)

(declare-fun e!426345 () Bool)

(assert (=> b!765531 (= e!426345 e!426344)))

(declare-fun c!84249 () Bool)

(assert (=> b!765531 (= c!84249 (validKeyInArray!0 (select (arr!20220 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!765532 () Bool)

(declare-fun e!426343 () Bool)

(assert (=> b!765532 (= e!426343 call!35039)))

(declare-fun b!765530 () Bool)

(assert (=> b!765530 (= e!426344 e!426343)))

(declare-fun lt!340565 () (_ BitVec 64))

(assert (=> b!765530 (= lt!340565 (select (arr!20220 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!340563 () Unit!26366)

(assert (=> b!765530 (= lt!340563 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!340565 #b00000000000000000000000000000000))))

(assert (=> b!765530 (arrayContainsKey!0 a!3186 lt!340565 #b00000000000000000000000000000000)))

(declare-fun lt!340564 () Unit!26366)

(assert (=> b!765530 (= lt!340564 lt!340563)))

(declare-fun res!517810 () Bool)

(assert (=> b!765530 (= res!517810 (= (seekEntryOrOpen!0 (select (arr!20220 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7820 #b00000000000000000000000000000000)))))

(assert (=> b!765530 (=> (not res!517810) (not e!426343))))

(declare-fun d!101179 () Bool)

(declare-fun res!517809 () Bool)

(assert (=> d!101179 (=> res!517809 e!426345)))

(assert (=> d!101179 (= res!517809 (bvsge #b00000000000000000000000000000000 (size!20641 a!3186)))))

(assert (=> d!101179 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!426345)))

(assert (= (and d!101179 (not res!517809)) b!765531))

(assert (= (and b!765531 c!84249) b!765530))

(assert (= (and b!765531 (not c!84249)) b!765529))

(assert (= (and b!765530 res!517810) b!765532))

(assert (= (or b!765532 b!765529) bm!35036))

(declare-fun m!711645 () Bool)

(assert (=> bm!35036 m!711645))

(assert (=> b!765531 m!711619))

(assert (=> b!765531 m!711619))

(declare-fun m!711647 () Bool)

(assert (=> b!765531 m!711647))

(assert (=> b!765530 m!711619))

(declare-fun m!711649 () Bool)

(assert (=> b!765530 m!711649))

(declare-fun m!711651 () Bool)

(assert (=> b!765530 m!711651))

(assert (=> b!765530 m!711619))

(declare-fun m!711653 () Bool)

(assert (=> b!765530 m!711653))

(assert (=> b!765104 d!101179))

(declare-fun d!101181 () Bool)

(declare-fun e!426346 () Bool)

(assert (=> d!101181 e!426346))

(declare-fun c!84251 () Bool)

(declare-fun lt!340566 () SeekEntryResult!7820)

(assert (=> d!101181 (= c!84251 (and (is-Intermediate!7820 lt!340566) (undefined!8632 lt!340566)))))

(declare-fun e!426349 () SeekEntryResult!7820)

(assert (=> d!101181 (= lt!340566 e!426349)))

(declare-fun c!84252 () Bool)

(assert (=> d!101181 (= c!84252 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!340567 () (_ BitVec 64))

(assert (=> d!101181 (= lt!340567 (select (arr!20220 lt!340397) (toIndex!0 lt!340398 mask!3328)))))

(assert (=> d!101181 (validMask!0 mask!3328)))

(assert (=> d!101181 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340398 mask!3328) lt!340398 lt!340397 mask!3328) lt!340566)))

(declare-fun b!765533 () Bool)

(assert (=> b!765533 (= e!426349 (Intermediate!7820 true (toIndex!0 lt!340398 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!765534 () Bool)

(declare-fun e!426350 () Bool)

(assert (=> b!765534 (= e!426346 e!426350)))

(declare-fun res!517812 () Bool)

(assert (=> b!765534 (= res!517812 (and (is-Intermediate!7820 lt!340566) (not (undefined!8632 lt!340566)) (bvslt (x!64553 lt!340566) #b01111111111111111111111111111110) (bvsge (x!64553 lt!340566) #b00000000000000000000000000000000) (bvsge (x!64553 lt!340566) #b00000000000000000000000000000000)))))

(assert (=> b!765534 (=> (not res!517812) (not e!426350))))

(declare-fun b!765535 () Bool)

(assert (=> b!765535 (and (bvsge (index!33650 lt!340566) #b00000000000000000000000000000000) (bvslt (index!33650 lt!340566) (size!20641 lt!340397)))))

(declare-fun res!517813 () Bool)

(assert (=> b!765535 (= res!517813 (= (select (arr!20220 lt!340397) (index!33650 lt!340566)) lt!340398))))

(declare-fun e!426348 () Bool)

(assert (=> b!765535 (=> res!517813 e!426348)))

(assert (=> b!765535 (= e!426350 e!426348)))

(declare-fun b!765536 () Bool)

(declare-fun e!426347 () SeekEntryResult!7820)

(assert (=> b!765536 (= e!426349 e!426347)))

(declare-fun c!84250 () Bool)

(assert (=> b!765536 (= c!84250 (or (= lt!340567 lt!340398) (= (bvadd lt!340567 lt!340567) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765537 () Bool)

(assert (=> b!765537 (= e!426346 (bvsge (x!64553 lt!340566) #b01111111111111111111111111111110))))

(declare-fun b!765538 () Bool)

(assert (=> b!765538 (and (bvsge (index!33650 lt!340566) #b00000000000000000000000000000000) (bvslt (index!33650 lt!340566) (size!20641 lt!340397)))))

(assert (=> b!765538 (= e!426348 (= (select (arr!20220 lt!340397) (index!33650 lt!340566)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!765539 () Bool)

(assert (=> b!765539 (= e!426347 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!340398 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!340398 lt!340397 mask!3328))))

(declare-fun b!765540 () Bool)

(assert (=> b!765540 (and (bvsge (index!33650 lt!340566) #b00000000000000000000000000000000) (bvslt (index!33650 lt!340566) (size!20641 lt!340397)))))

(declare-fun res!517811 () Bool)

(assert (=> b!765540 (= res!517811 (= (select (arr!20220 lt!340397) (index!33650 lt!340566)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!765540 (=> res!517811 e!426348)))

(declare-fun b!765541 () Bool)

(assert (=> b!765541 (= e!426347 (Intermediate!7820 false (toIndex!0 lt!340398 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!101181 c!84252) b!765533))

(assert (= (and d!101181 (not c!84252)) b!765536))

(assert (= (and b!765536 c!84250) b!765541))

(assert (= (and b!765536 (not c!84250)) b!765539))

(assert (= (and d!101181 c!84251) b!765537))

(assert (= (and d!101181 (not c!84251)) b!765534))

(assert (= (and b!765534 res!517812) b!765535))

(assert (= (and b!765535 (not res!517813)) b!765540))

(assert (= (and b!765540 (not res!517811)) b!765538))

(declare-fun m!711655 () Bool)

(assert (=> b!765535 m!711655))

(assert (=> b!765538 m!711655))

(assert (=> b!765539 m!711311))

(declare-fun m!711657 () Bool)

(assert (=> b!765539 m!711657))

(assert (=> b!765539 m!711657))

(declare-fun m!711659 () Bool)

(assert (=> b!765539 m!711659))

(assert (=> b!765540 m!711655))

(assert (=> d!101181 m!711311))

(declare-fun m!711661 () Bool)

(assert (=> d!101181 m!711661))

(assert (=> d!101181 m!711335))

(assert (=> b!765094 d!101181))

(declare-fun d!101183 () Bool)

(declare-fun lt!340569 () (_ BitVec 32))

(declare-fun lt!340568 () (_ BitVec 32))

(assert (=> d!101183 (= lt!340569 (bvmul (bvxor lt!340568 (bvlshr lt!340568 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101183 (= lt!340568 ((_ extract 31 0) (bvand (bvxor lt!340398 (bvlshr lt!340398 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101183 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!517802 (let ((h!15309 ((_ extract 31 0) (bvand (bvxor lt!340398 (bvlshr lt!340398 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64562 (bvmul (bvxor h!15309 (bvlshr h!15309 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64562 (bvlshr x!64562 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!517802 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!517802 #b00000000000000000000000000000000))))))

(assert (=> d!101183 (= (toIndex!0 lt!340398 mask!3328) (bvand (bvxor lt!340569 (bvlshr lt!340569 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!765094 d!101183))

(declare-fun d!101185 () Bool)

(declare-fun e!426351 () Bool)

(assert (=> d!101185 e!426351))

(declare-fun c!84254 () Bool)

(declare-fun lt!340570 () SeekEntryResult!7820)

(assert (=> d!101185 (= c!84254 (and (is-Intermediate!7820 lt!340570) (undefined!8632 lt!340570)))))

(declare-fun e!426354 () SeekEntryResult!7820)

(assert (=> d!101185 (= lt!340570 e!426354)))

(declare-fun c!84255 () Bool)

(assert (=> d!101185 (= c!84255 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!340571 () (_ BitVec 64))

(assert (=> d!101185 (= lt!340571 (select (arr!20220 lt!340397) index!1321))))

(assert (=> d!101185 (validMask!0 mask!3328)))

(assert (=> d!101185 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340398 lt!340397 mask!3328) lt!340570)))

(declare-fun b!765542 () Bool)

(assert (=> b!765542 (= e!426354 (Intermediate!7820 true index!1321 x!1131))))

(declare-fun b!765543 () Bool)

(declare-fun e!426355 () Bool)

(assert (=> b!765543 (= e!426351 e!426355)))

(declare-fun res!517815 () Bool)

(assert (=> b!765543 (= res!517815 (and (is-Intermediate!7820 lt!340570) (not (undefined!8632 lt!340570)) (bvslt (x!64553 lt!340570) #b01111111111111111111111111111110) (bvsge (x!64553 lt!340570) #b00000000000000000000000000000000) (bvsge (x!64553 lt!340570) x!1131)))))

(assert (=> b!765543 (=> (not res!517815) (not e!426355))))

(declare-fun b!765544 () Bool)

(assert (=> b!765544 (and (bvsge (index!33650 lt!340570) #b00000000000000000000000000000000) (bvslt (index!33650 lt!340570) (size!20641 lt!340397)))))

(declare-fun res!517816 () Bool)

(assert (=> b!765544 (= res!517816 (= (select (arr!20220 lt!340397) (index!33650 lt!340570)) lt!340398))))

(declare-fun e!426353 () Bool)

(assert (=> b!765544 (=> res!517816 e!426353)))

(assert (=> b!765544 (= e!426355 e!426353)))

(declare-fun b!765545 () Bool)

(declare-fun e!426352 () SeekEntryResult!7820)

(assert (=> b!765545 (= e!426354 e!426352)))

(declare-fun c!84253 () Bool)

(assert (=> b!765545 (= c!84253 (or (= lt!340571 lt!340398) (= (bvadd lt!340571 lt!340571) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765546 () Bool)

(assert (=> b!765546 (= e!426351 (bvsge (x!64553 lt!340570) #b01111111111111111111111111111110))))

(declare-fun b!765547 () Bool)

(assert (=> b!765547 (and (bvsge (index!33650 lt!340570) #b00000000000000000000000000000000) (bvslt (index!33650 lt!340570) (size!20641 lt!340397)))))

(assert (=> b!765547 (= e!426353 (= (select (arr!20220 lt!340397) (index!33650 lt!340570)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!765548 () Bool)

(assert (=> b!765548 (= e!426352 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!340398 lt!340397 mask!3328))))

(declare-fun b!765549 () Bool)

(assert (=> b!765549 (and (bvsge (index!33650 lt!340570) #b00000000000000000000000000000000) (bvslt (index!33650 lt!340570) (size!20641 lt!340397)))))

(declare-fun res!517814 () Bool)

(assert (=> b!765549 (= res!517814 (= (select (arr!20220 lt!340397) (index!33650 lt!340570)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!765549 (=> res!517814 e!426353)))

(declare-fun b!765550 () Bool)

(assert (=> b!765550 (= e!426352 (Intermediate!7820 false index!1321 x!1131))))

(assert (= (and d!101185 c!84255) b!765542))

(assert (= (and d!101185 (not c!84255)) b!765545))

(assert (= (and b!765545 c!84253) b!765550))

(assert (= (and b!765545 (not c!84253)) b!765548))

(assert (= (and d!101185 c!84254) b!765546))

(assert (= (and d!101185 (not c!84254)) b!765543))

(assert (= (and b!765543 res!517815) b!765544))

(assert (= (and b!765544 (not res!517816)) b!765549))

(assert (= (and b!765549 (not res!517814)) b!765547))

(declare-fun m!711663 () Bool)

(assert (=> b!765544 m!711663))

(assert (=> b!765547 m!711663))

(assert (=> b!765548 m!711613))

(assert (=> b!765548 m!711613))

(declare-fun m!711665 () Bool)

(assert (=> b!765548 m!711665))

(assert (=> b!765549 m!711663))

(declare-fun m!711667 () Bool)

(assert (=> d!101185 m!711667))

(assert (=> d!101185 m!711335))

(assert (=> b!765094 d!101185))

(declare-fun bm!35039 () Bool)

(declare-fun call!35042 () Bool)

(declare-fun c!84264 () Bool)

(assert (=> bm!35039 (= call!35042 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84264 (Cons!14218 (select (arr!20220 a!3186) #b00000000000000000000000000000000) Nil!14219) Nil!14219)))))

(declare-fun b!765579 () Bool)

(declare-fun e!426377 () Bool)

(assert (=> b!765579 (= e!426377 call!35042)))

(declare-fun b!765580 () Bool)

(declare-fun e!426375 () Bool)

(assert (=> b!765580 (= e!426375 e!426377)))

(assert (=> b!765580 (= c!84264 (validKeyInArray!0 (select (arr!20220 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101187 () Bool)

(declare-fun res!517830 () Bool)

(declare-fun e!426374 () Bool)

(assert (=> d!101187 (=> res!517830 e!426374)))

(assert (=> d!101187 (= res!517830 (bvsge #b00000000000000000000000000000000 (size!20641 a!3186)))))

(assert (=> d!101187 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14219) e!426374)))

(declare-fun b!765581 () Bool)

(assert (=> b!765581 (= e!426374 e!426375)))

(declare-fun res!517832 () Bool)

(assert (=> b!765581 (=> (not res!517832) (not e!426375))))

(declare-fun e!426376 () Bool)

(assert (=> b!765581 (= res!517832 (not e!426376))))

(declare-fun res!517831 () Bool)

(assert (=> b!765581 (=> (not res!517831) (not e!426376))))

(assert (=> b!765581 (= res!517831 (validKeyInArray!0 (select (arr!20220 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!765582 () Bool)

(assert (=> b!765582 (= e!426377 call!35042)))

(declare-fun b!765583 () Bool)

(declare-fun contains!4079 (List!14222 (_ BitVec 64)) Bool)

(assert (=> b!765583 (= e!426376 (contains!4079 Nil!14219 (select (arr!20220 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101187 (not res!517830)) b!765581))

(assert (= (and b!765581 res!517831) b!765583))

(assert (= (and b!765581 res!517832) b!765580))

(assert (= (and b!765580 c!84264) b!765582))

(assert (= (and b!765580 (not c!84264)) b!765579))

(assert (= (or b!765582 b!765579) bm!35039))

(assert (=> bm!35039 m!711619))

(declare-fun m!711683 () Bool)

(assert (=> bm!35039 m!711683))

(assert (=> b!765580 m!711619))

(assert (=> b!765580 m!711619))

(assert (=> b!765580 m!711647))

(assert (=> b!765581 m!711619))

(assert (=> b!765581 m!711619))

(assert (=> b!765581 m!711647))

(assert (=> b!765583 m!711619))

(assert (=> b!765583 m!711619))

(declare-fun m!711685 () Bool)

(assert (=> b!765583 m!711685))

(assert (=> b!765096 d!101187))

(declare-fun b!765593 () Bool)

(declare-fun c!84270 () Bool)

(declare-fun lt!340584 () (_ BitVec 64))

(assert (=> b!765593 (= c!84270 (= lt!340584 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426383 () SeekEntryResult!7820)

(declare-fun e!426384 () SeekEntryResult!7820)

(assert (=> b!765593 (= e!426383 e!426384)))

(declare-fun b!765594 () Bool)

(assert (=> b!765594 (= e!426384 (MissingVacant!7820 resIntermediateIndex!5))))

(declare-fun b!765595 () Bool)

(assert (=> b!765595 (= e!426383 (Found!7820 index!1321))))

(declare-fun b!765596 () Bool)

(declare-fun e!426385 () SeekEntryResult!7820)

(assert (=> b!765596 (= e!426385 e!426383)))

(declare-fun c!84269 () Bool)

(assert (=> b!765596 (= c!84269 (= lt!340584 (select (arr!20220 a!3186) j!159)))))

(declare-fun b!765597 () Bool)

(assert (=> b!765597 (= e!426384 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20220 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!340585 () SeekEntryResult!7820)

(declare-fun d!101195 () Bool)

(assert (=> d!101195 (and (or (is-Undefined!7820 lt!340585) (not (is-Found!7820 lt!340585)) (and (bvsge (index!33649 lt!340585) #b00000000000000000000000000000000) (bvslt (index!33649 lt!340585) (size!20641 a!3186)))) (or (is-Undefined!7820 lt!340585) (is-Found!7820 lt!340585) (not (is-MissingVacant!7820 lt!340585)) (not (= (index!33651 lt!340585) resIntermediateIndex!5)) (and (bvsge (index!33651 lt!340585) #b00000000000000000000000000000000) (bvslt (index!33651 lt!340585) (size!20641 a!3186)))) (or (is-Undefined!7820 lt!340585) (ite (is-Found!7820 lt!340585) (= (select (arr!20220 a!3186) (index!33649 lt!340585)) (select (arr!20220 a!3186) j!159)) (and (is-MissingVacant!7820 lt!340585) (= (index!33651 lt!340585) resIntermediateIndex!5) (= (select (arr!20220 a!3186) (index!33651 lt!340585)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101195 (= lt!340585 e!426385)))

(declare-fun c!84268 () Bool)

(assert (=> d!101195 (= c!84268 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101195 (= lt!340584 (select (arr!20220 a!3186) index!1321))))

(assert (=> d!101195 (validMask!0 mask!3328)))

(assert (=> d!101195 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20220 a!3186) j!159) a!3186 mask!3328) lt!340585)))

(declare-fun b!765598 () Bool)

(assert (=> b!765598 (= e!426385 Undefined!7820)))

(assert (= (and d!101195 c!84268) b!765598))

(assert (= (and d!101195 (not c!84268)) b!765596))

(assert (= (and b!765596 c!84269) b!765595))

(assert (= (and b!765596 (not c!84269)) b!765593))

(assert (= (and b!765593 c!84270) b!765594))

(assert (= (and b!765593 (not c!84270)) b!765597))

(assert (=> b!765597 m!711613))

(assert (=> b!765597 m!711613))

(assert (=> b!765597 m!711303))

(declare-fun m!711691 () Bool)

(assert (=> b!765597 m!711691))

(declare-fun m!711693 () Bool)

(assert (=> d!101195 m!711693))

(declare-fun m!711695 () Bool)

(assert (=> d!101195 m!711695))

(assert (=> d!101195 m!711617))

(assert (=> d!101195 m!711335))

(assert (=> b!765097 d!101195))

(push 1)

