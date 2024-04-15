; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66468 () Bool)

(assert start!66468)

(declare-fun b!766189 () Bool)

(declare-fun e!426642 () Bool)

(declare-fun e!426641 () Bool)

(assert (=> b!766189 (= e!426642 (not e!426641))))

(declare-fun res!518464 () Bool)

(assert (=> b!766189 (=> res!518464 e!426641)))

(declare-datatypes ((SeekEntryResult!7834 0))(
  ( (MissingZero!7834 (index!33704 (_ BitVec 32))) (Found!7834 (index!33705 (_ BitVec 32))) (Intermediate!7834 (undefined!8646 Bool) (index!33706 (_ BitVec 32)) (x!64619 (_ BitVec 32))) (Undefined!7834) (MissingVacant!7834 (index!33707 (_ BitVec 32))) )
))
(declare-fun lt!340703 () SeekEntryResult!7834)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!766189 (= res!518464 (or (not ((_ is Intermediate!7834) lt!340703)) (bvsge x!1131 (x!64619 lt!340703))))))

(declare-fun e!426646 () Bool)

(assert (=> b!766189 e!426646))

(declare-fun res!518460 () Bool)

(assert (=> b!766189 (=> (not res!518460) (not e!426646))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42264 0))(
  ( (array!42265 (arr!20237 (Array (_ BitVec 32) (_ BitVec 64))) (size!20658 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42264)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42264 (_ BitVec 32)) Bool)

(assert (=> b!766189 (= res!518460 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26366 0))(
  ( (Unit!26367) )
))
(declare-fun lt!340705 () Unit!26366)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42264 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26366)

(assert (=> b!766189 (= lt!340705 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!426645 () Bool)

(declare-fun b!766190 () Bool)

(declare-fun lt!340698 () SeekEntryResult!7834)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42264 (_ BitVec 32)) SeekEntryResult!7834)

(assert (=> b!766190 (= e!426645 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20237 a!3186) j!159) a!3186 mask!3328) lt!340698))))

(declare-fun b!766191 () Bool)

(declare-fun res!518468 () Bool)

(declare-fun e!426648 () Bool)

(assert (=> b!766191 (=> (not res!518468) (not e!426648))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766191 (= res!518468 (validKeyInArray!0 k0!2102))))

(declare-fun b!766192 () Bool)

(declare-fun res!518472 () Bool)

(assert (=> b!766192 (=> (not res!518472) (not e!426648))))

(assert (=> b!766192 (= res!518472 (validKeyInArray!0 (select (arr!20237 a!3186) j!159)))))

(declare-fun b!766193 () Bool)

(declare-fun res!518473 () Bool)

(assert (=> b!766193 (=> (not res!518473) (not e!426648))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!766193 (= res!518473 (and (= (size!20658 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20658 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20658 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!766195 () Bool)

(declare-fun e!426649 () Bool)

(assert (=> b!766195 (= e!426649 e!426642)))

(declare-fun res!518466 () Bool)

(assert (=> b!766195 (=> (not res!518466) (not e!426642))))

(declare-fun lt!340699 () SeekEntryResult!7834)

(assert (=> b!766195 (= res!518466 (= lt!340699 lt!340703))))

(declare-fun lt!340701 () array!42264)

(declare-fun lt!340702 () (_ BitVec 64))

(assert (=> b!766195 (= lt!340703 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340702 lt!340701 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766195 (= lt!340699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340702 mask!3328) lt!340702 lt!340701 mask!3328))))

(assert (=> b!766195 (= lt!340702 (select (store (arr!20237 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!766195 (= lt!340701 (array!42265 (store (arr!20237 a!3186) i!1173 k0!2102) (size!20658 a!3186)))))

(declare-fun b!766196 () Bool)

(declare-fun res!518465 () Bool)

(assert (=> b!766196 (=> (not res!518465) (not e!426648))))

(declare-fun arrayContainsKey!0 (array!42264 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766196 (= res!518465 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!766197 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42264 (_ BitVec 32)) SeekEntryResult!7834)

(assert (=> b!766197 (= e!426645 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20237 a!3186) j!159) a!3186 mask!3328) (Found!7834 j!159)))))

(declare-fun b!766198 () Bool)

(declare-fun res!518458 () Bool)

(declare-fun e!426644 () Bool)

(assert (=> b!766198 (=> (not res!518458) (not e!426644))))

(assert (=> b!766198 (= res!518458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766199 () Bool)

(assert (=> b!766199 (= e!426644 e!426649)))

(declare-fun res!518461 () Bool)

(assert (=> b!766199 (=> (not res!518461) (not e!426649))))

(assert (=> b!766199 (= res!518461 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20237 a!3186) j!159) mask!3328) (select (arr!20237 a!3186) j!159) a!3186 mask!3328) lt!340698))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!766199 (= lt!340698 (Intermediate!7834 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766200 () Bool)

(assert (=> b!766200 (= e!426648 e!426644)))

(declare-fun res!518471 () Bool)

(assert (=> b!766200 (=> (not res!518471) (not e!426644))))

(declare-fun lt!340704 () SeekEntryResult!7834)

(assert (=> b!766200 (= res!518471 (or (= lt!340704 (MissingZero!7834 i!1173)) (= lt!340704 (MissingVacant!7834 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42264 (_ BitVec 32)) SeekEntryResult!7834)

(assert (=> b!766200 (= lt!340704 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!766201 () Bool)

(declare-fun e!426647 () Bool)

(assert (=> b!766201 (= e!426646 e!426647)))

(declare-fun res!518467 () Bool)

(assert (=> b!766201 (=> (not res!518467) (not e!426647))))

(declare-fun lt!340706 () SeekEntryResult!7834)

(assert (=> b!766201 (= res!518467 (= (seekEntryOrOpen!0 (select (arr!20237 a!3186) j!159) a!3186 mask!3328) lt!340706))))

(assert (=> b!766201 (= lt!340706 (Found!7834 j!159))))

(declare-fun b!766202 () Bool)

(declare-fun lt!340700 () (_ BitVec 32))

(declare-fun e!426643 () Bool)

(assert (=> b!766202 (= e!426643 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!340700 (select (arr!20237 a!3186) j!159) a!3186 mask!3328) lt!340698))))

(declare-fun b!766203 () Bool)

(declare-fun res!518469 () Bool)

(assert (=> b!766203 (=> (not res!518469) (not e!426649))))

(assert (=> b!766203 (= res!518469 e!426645)))

(declare-fun c!84255 () Bool)

(assert (=> b!766203 (= c!84255 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!766204 () Bool)

(assert (=> b!766204 (= e!426641 e!426643)))

(declare-fun res!518463 () Bool)

(assert (=> b!766204 (=> res!518463 e!426643)))

(assert (=> b!766204 (= res!518463 (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766204 (= lt!340700 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!766205 () Bool)

(assert (=> b!766205 (= e!426647 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20237 a!3186) j!159) a!3186 mask!3328) lt!340706))))

(declare-fun b!766206 () Bool)

(declare-fun res!518459 () Bool)

(assert (=> b!766206 (=> (not res!518459) (not e!426644))))

(assert (=> b!766206 (= res!518459 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20658 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20658 a!3186))))))

(declare-fun b!766207 () Bool)

(declare-fun res!518470 () Bool)

(assert (=> b!766207 (=> (not res!518470) (not e!426644))))

(declare-datatypes ((List!14278 0))(
  ( (Nil!14275) (Cons!14274 (h!15364 (_ BitVec 64)) (t!20584 List!14278)) )
))
(declare-fun arrayNoDuplicates!0 (array!42264 (_ BitVec 32) List!14278) Bool)

(assert (=> b!766207 (= res!518470 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14275))))

(declare-fun res!518474 () Bool)

(assert (=> start!66468 (=> (not res!518474) (not e!426648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66468 (= res!518474 (validMask!0 mask!3328))))

(assert (=> start!66468 e!426648))

(assert (=> start!66468 true))

(declare-fun array_inv!16120 (array!42264) Bool)

(assert (=> start!66468 (array_inv!16120 a!3186)))

(declare-fun b!766194 () Bool)

(declare-fun res!518462 () Bool)

(assert (=> b!766194 (=> (not res!518462) (not e!426649))))

(assert (=> b!766194 (= res!518462 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20237 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!66468 res!518474) b!766193))

(assert (= (and b!766193 res!518473) b!766192))

(assert (= (and b!766192 res!518472) b!766191))

(assert (= (and b!766191 res!518468) b!766196))

(assert (= (and b!766196 res!518465) b!766200))

(assert (= (and b!766200 res!518471) b!766198))

(assert (= (and b!766198 res!518458) b!766207))

(assert (= (and b!766207 res!518470) b!766206))

(assert (= (and b!766206 res!518459) b!766199))

(assert (= (and b!766199 res!518461) b!766194))

(assert (= (and b!766194 res!518462) b!766203))

(assert (= (and b!766203 c!84255) b!766190))

(assert (= (and b!766203 (not c!84255)) b!766197))

(assert (= (and b!766203 res!518469) b!766195))

(assert (= (and b!766195 res!518466) b!766189))

(assert (= (and b!766189 res!518460) b!766201))

(assert (= (and b!766201 res!518467) b!766205))

(assert (= (and b!766189 (not res!518464)) b!766204))

(assert (= (and b!766204 (not res!518463)) b!766202))

(declare-fun m!711667 () Bool)

(assert (=> b!766202 m!711667))

(assert (=> b!766202 m!711667))

(declare-fun m!711669 () Bool)

(assert (=> b!766202 m!711669))

(assert (=> b!766201 m!711667))

(assert (=> b!766201 m!711667))

(declare-fun m!711671 () Bool)

(assert (=> b!766201 m!711671))

(declare-fun m!711673 () Bool)

(assert (=> b!766194 m!711673))

(assert (=> b!766205 m!711667))

(assert (=> b!766205 m!711667))

(declare-fun m!711675 () Bool)

(assert (=> b!766205 m!711675))

(assert (=> b!766199 m!711667))

(assert (=> b!766199 m!711667))

(declare-fun m!711677 () Bool)

(assert (=> b!766199 m!711677))

(assert (=> b!766199 m!711677))

(assert (=> b!766199 m!711667))

(declare-fun m!711679 () Bool)

(assert (=> b!766199 m!711679))

(assert (=> b!766197 m!711667))

(assert (=> b!766197 m!711667))

(declare-fun m!711681 () Bool)

(assert (=> b!766197 m!711681))

(declare-fun m!711683 () Bool)

(assert (=> b!766198 m!711683))

(declare-fun m!711685 () Bool)

(assert (=> b!766200 m!711685))

(assert (=> b!766192 m!711667))

(assert (=> b!766192 m!711667))

(declare-fun m!711687 () Bool)

(assert (=> b!766192 m!711687))

(declare-fun m!711689 () Bool)

(assert (=> b!766204 m!711689))

(declare-fun m!711691 () Bool)

(assert (=> b!766191 m!711691))

(declare-fun m!711693 () Bool)

(assert (=> start!66468 m!711693))

(declare-fun m!711695 () Bool)

(assert (=> start!66468 m!711695))

(declare-fun m!711697 () Bool)

(assert (=> b!766207 m!711697))

(assert (=> b!766190 m!711667))

(assert (=> b!766190 m!711667))

(declare-fun m!711699 () Bool)

(assert (=> b!766190 m!711699))

(declare-fun m!711701 () Bool)

(assert (=> b!766189 m!711701))

(declare-fun m!711703 () Bool)

(assert (=> b!766189 m!711703))

(declare-fun m!711705 () Bool)

(assert (=> b!766195 m!711705))

(declare-fun m!711707 () Bool)

(assert (=> b!766195 m!711707))

(declare-fun m!711709 () Bool)

(assert (=> b!766195 m!711709))

(assert (=> b!766195 m!711705))

(declare-fun m!711711 () Bool)

(assert (=> b!766195 m!711711))

(declare-fun m!711713 () Bool)

(assert (=> b!766195 m!711713))

(declare-fun m!711715 () Bool)

(assert (=> b!766196 m!711715))

(check-sat (not b!766207) (not b!766202) (not b!766201) (not b!766195) (not b!766200) (not start!66468) (not b!766190) (not b!766198) (not b!766205) (not b!766197) (not b!766191) (not b!766189) (not b!766199) (not b!766204) (not b!766196) (not b!766192))
(check-sat)
(get-model)

(declare-fun d!101023 () Bool)

(declare-fun res!518582 () Bool)

(declare-fun e!426717 () Bool)

(assert (=> d!101023 (=> res!518582 e!426717)))

(assert (=> d!101023 (= res!518582 (bvsge #b00000000000000000000000000000000 (size!20658 a!3186)))))

(assert (=> d!101023 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!426717)))

(declare-fun b!766330 () Bool)

(declare-fun e!426719 () Bool)

(assert (=> b!766330 (= e!426717 e!426719)))

(declare-fun c!84264 () Bool)

(assert (=> b!766330 (= c!84264 (validKeyInArray!0 (select (arr!20237 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!766331 () Bool)

(declare-fun e!426718 () Bool)

(declare-fun call!35020 () Bool)

(assert (=> b!766331 (= e!426718 call!35020)))

(declare-fun b!766332 () Bool)

(assert (=> b!766332 (= e!426719 call!35020)))

(declare-fun bm!35017 () Bool)

(assert (=> bm!35017 (= call!35020 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!766333 () Bool)

(assert (=> b!766333 (= e!426719 e!426718)))

(declare-fun lt!340769 () (_ BitVec 64))

(assert (=> b!766333 (= lt!340769 (select (arr!20237 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!340768 () Unit!26366)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42264 (_ BitVec 64) (_ BitVec 32)) Unit!26366)

(assert (=> b!766333 (= lt!340768 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!340769 #b00000000000000000000000000000000))))

(assert (=> b!766333 (arrayContainsKey!0 a!3186 lt!340769 #b00000000000000000000000000000000)))

(declare-fun lt!340767 () Unit!26366)

(assert (=> b!766333 (= lt!340767 lt!340768)))

(declare-fun res!518581 () Bool)

(assert (=> b!766333 (= res!518581 (= (seekEntryOrOpen!0 (select (arr!20237 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7834 #b00000000000000000000000000000000)))))

(assert (=> b!766333 (=> (not res!518581) (not e!426718))))

(assert (= (and d!101023 (not res!518582)) b!766330))

(assert (= (and b!766330 c!84264) b!766333))

(assert (= (and b!766330 (not c!84264)) b!766332))

(assert (= (and b!766333 res!518581) b!766331))

(assert (= (or b!766331 b!766332) bm!35017))

(declare-fun m!711817 () Bool)

(assert (=> b!766330 m!711817))

(assert (=> b!766330 m!711817))

(declare-fun m!711819 () Bool)

(assert (=> b!766330 m!711819))

(declare-fun m!711821 () Bool)

(assert (=> bm!35017 m!711821))

(assert (=> b!766333 m!711817))

(declare-fun m!711823 () Bool)

(assert (=> b!766333 m!711823))

(declare-fun m!711825 () Bool)

(assert (=> b!766333 m!711825))

(assert (=> b!766333 m!711817))

(declare-fun m!711827 () Bool)

(assert (=> b!766333 m!711827))

(assert (=> b!766198 d!101023))

(declare-fun d!101025 () Bool)

(assert (=> d!101025 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66468 d!101025))

(declare-fun d!101027 () Bool)

(assert (=> d!101027 (= (array_inv!16120 a!3186) (bvsge (size!20658 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66468 d!101027))

(declare-fun b!766346 () Bool)

(declare-fun e!426727 () SeekEntryResult!7834)

(assert (=> b!766346 (= e!426727 (MissingVacant!7834 resIntermediateIndex!5))))

(declare-fun b!766347 () Bool)

(declare-fun e!426728 () SeekEntryResult!7834)

(assert (=> b!766347 (= e!426728 (Found!7834 index!1321))))

(declare-fun b!766348 () Bool)

(declare-fun e!426726 () SeekEntryResult!7834)

(assert (=> b!766348 (= e!426726 Undefined!7834)))

(declare-fun b!766349 () Bool)

(assert (=> b!766349 (= e!426726 e!426728)))

(declare-fun lt!340775 () (_ BitVec 64))

(declare-fun c!84271 () Bool)

(assert (=> b!766349 (= c!84271 (= lt!340775 (select (arr!20237 a!3186) j!159)))))

(declare-fun b!766350 () Bool)

(declare-fun c!84272 () Bool)

(assert (=> b!766350 (= c!84272 (= lt!340775 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766350 (= e!426728 e!426727)))

(declare-fun lt!340774 () SeekEntryResult!7834)

(declare-fun d!101029 () Bool)

(assert (=> d!101029 (and (or ((_ is Undefined!7834) lt!340774) (not ((_ is Found!7834) lt!340774)) (and (bvsge (index!33705 lt!340774) #b00000000000000000000000000000000) (bvslt (index!33705 lt!340774) (size!20658 a!3186)))) (or ((_ is Undefined!7834) lt!340774) ((_ is Found!7834) lt!340774) (not ((_ is MissingVacant!7834) lt!340774)) (not (= (index!33707 lt!340774) resIntermediateIndex!5)) (and (bvsge (index!33707 lt!340774) #b00000000000000000000000000000000) (bvslt (index!33707 lt!340774) (size!20658 a!3186)))) (or ((_ is Undefined!7834) lt!340774) (ite ((_ is Found!7834) lt!340774) (= (select (arr!20237 a!3186) (index!33705 lt!340774)) (select (arr!20237 a!3186) j!159)) (and ((_ is MissingVacant!7834) lt!340774) (= (index!33707 lt!340774) resIntermediateIndex!5) (= (select (arr!20237 a!3186) (index!33707 lt!340774)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101029 (= lt!340774 e!426726)))

(declare-fun c!84273 () Bool)

(assert (=> d!101029 (= c!84273 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101029 (= lt!340775 (select (arr!20237 a!3186) index!1321))))

(assert (=> d!101029 (validMask!0 mask!3328)))

(assert (=> d!101029 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20237 a!3186) j!159) a!3186 mask!3328) lt!340774)))

(declare-fun b!766351 () Bool)

(assert (=> b!766351 (= e!426727 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20237 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101029 c!84273) b!766348))

(assert (= (and d!101029 (not c!84273)) b!766349))

(assert (= (and b!766349 c!84271) b!766347))

(assert (= (and b!766349 (not c!84271)) b!766350))

(assert (= (and b!766350 c!84272) b!766346))

(assert (= (and b!766350 (not c!84272)) b!766351))

(declare-fun m!711829 () Bool)

(assert (=> d!101029 m!711829))

(declare-fun m!711831 () Bool)

(assert (=> d!101029 m!711831))

(declare-fun m!711833 () Bool)

(assert (=> d!101029 m!711833))

(assert (=> d!101029 m!711693))

(assert (=> b!766351 m!711689))

(assert (=> b!766351 m!711689))

(assert (=> b!766351 m!711667))

(declare-fun m!711835 () Bool)

(assert (=> b!766351 m!711835))

(assert (=> b!766197 d!101029))

(declare-fun e!426741 () SeekEntryResult!7834)

(declare-fun b!766370 () Bool)

(assert (=> b!766370 (= e!426741 (Intermediate!7834 true (toIndex!0 (select (arr!20237 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!766371 () Bool)

(declare-fun lt!340781 () SeekEntryResult!7834)

(assert (=> b!766371 (and (bvsge (index!33706 lt!340781) #b00000000000000000000000000000000) (bvslt (index!33706 lt!340781) (size!20658 a!3186)))))

(declare-fun e!426742 () Bool)

(assert (=> b!766371 (= e!426742 (= (select (arr!20237 a!3186) (index!33706 lt!340781)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766372 () Bool)

(declare-fun e!426743 () Bool)

(assert (=> b!766372 (= e!426743 (bvsge (x!64619 lt!340781) #b01111111111111111111111111111110))))

(declare-fun b!766373 () Bool)

(assert (=> b!766373 (and (bvsge (index!33706 lt!340781) #b00000000000000000000000000000000) (bvslt (index!33706 lt!340781) (size!20658 a!3186)))))

(declare-fun res!518591 () Bool)

(assert (=> b!766373 (= res!518591 (= (select (arr!20237 a!3186) (index!33706 lt!340781)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766373 (=> res!518591 e!426742)))

(declare-fun b!766374 () Bool)

(declare-fun e!426740 () SeekEntryResult!7834)

(assert (=> b!766374 (= e!426740 (Intermediate!7834 false (toIndex!0 (select (arr!20237 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!766375 () Bool)

(declare-fun e!426739 () Bool)

(assert (=> b!766375 (= e!426743 e!426739)))

(declare-fun res!518590 () Bool)

(assert (=> b!766375 (= res!518590 (and ((_ is Intermediate!7834) lt!340781) (not (undefined!8646 lt!340781)) (bvslt (x!64619 lt!340781) #b01111111111111111111111111111110) (bvsge (x!64619 lt!340781) #b00000000000000000000000000000000) (bvsge (x!64619 lt!340781) #b00000000000000000000000000000000)))))

(assert (=> b!766375 (=> (not res!518590) (not e!426739))))

(declare-fun b!766376 () Bool)

(assert (=> b!766376 (and (bvsge (index!33706 lt!340781) #b00000000000000000000000000000000) (bvslt (index!33706 lt!340781) (size!20658 a!3186)))))

(declare-fun res!518589 () Bool)

(assert (=> b!766376 (= res!518589 (= (select (arr!20237 a!3186) (index!33706 lt!340781)) (select (arr!20237 a!3186) j!159)))))

(assert (=> b!766376 (=> res!518589 e!426742)))

(assert (=> b!766376 (= e!426739 e!426742)))

(declare-fun b!766377 () Bool)

(assert (=> b!766377 (= e!426741 e!426740)))

(declare-fun c!84282 () Bool)

(declare-fun lt!340780 () (_ BitVec 64))

(assert (=> b!766377 (= c!84282 (or (= lt!340780 (select (arr!20237 a!3186) j!159)) (= (bvadd lt!340780 lt!340780) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766378 () Bool)

(assert (=> b!766378 (= e!426740 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20237 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20237 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101031 () Bool)

(assert (=> d!101031 e!426743))

(declare-fun c!84280 () Bool)

(assert (=> d!101031 (= c!84280 (and ((_ is Intermediate!7834) lt!340781) (undefined!8646 lt!340781)))))

(assert (=> d!101031 (= lt!340781 e!426741)))

(declare-fun c!84281 () Bool)

(assert (=> d!101031 (= c!84281 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101031 (= lt!340780 (select (arr!20237 a!3186) (toIndex!0 (select (arr!20237 a!3186) j!159) mask!3328)))))

(assert (=> d!101031 (validMask!0 mask!3328)))

(assert (=> d!101031 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20237 a!3186) j!159) mask!3328) (select (arr!20237 a!3186) j!159) a!3186 mask!3328) lt!340781)))

(assert (= (and d!101031 c!84281) b!766370))

(assert (= (and d!101031 (not c!84281)) b!766377))

(assert (= (and b!766377 c!84282) b!766374))

(assert (= (and b!766377 (not c!84282)) b!766378))

(assert (= (and d!101031 c!84280) b!766372))

(assert (= (and d!101031 (not c!84280)) b!766375))

(assert (= (and b!766375 res!518590) b!766376))

(assert (= (and b!766376 (not res!518589)) b!766373))

(assert (= (and b!766373 (not res!518591)) b!766371))

(assert (=> d!101031 m!711677))

(declare-fun m!711837 () Bool)

(assert (=> d!101031 m!711837))

(assert (=> d!101031 m!711693))

(declare-fun m!711839 () Bool)

(assert (=> b!766373 m!711839))

(assert (=> b!766378 m!711677))

(declare-fun m!711841 () Bool)

(assert (=> b!766378 m!711841))

(assert (=> b!766378 m!711841))

(assert (=> b!766378 m!711667))

(declare-fun m!711843 () Bool)

(assert (=> b!766378 m!711843))

(assert (=> b!766371 m!711839))

(assert (=> b!766376 m!711839))

(assert (=> b!766199 d!101031))

(declare-fun d!101043 () Bool)

(declare-fun lt!340787 () (_ BitVec 32))

(declare-fun lt!340786 () (_ BitVec 32))

(assert (=> d!101043 (= lt!340787 (bvmul (bvxor lt!340786 (bvlshr lt!340786 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101043 (= lt!340786 ((_ extract 31 0) (bvand (bvxor (select (arr!20237 a!3186) j!159) (bvlshr (select (arr!20237 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101043 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!518592 (let ((h!15367 ((_ extract 31 0) (bvand (bvxor (select (arr!20237 a!3186) j!159) (bvlshr (select (arr!20237 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64624 (bvmul (bvxor h!15367 (bvlshr h!15367 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64624 (bvlshr x!64624 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!518592 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!518592 #b00000000000000000000000000000000))))))

(assert (=> d!101043 (= (toIndex!0 (select (arr!20237 a!3186) j!159) mask!3328) (bvand (bvxor lt!340787 (bvlshr lt!340787 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!766199 d!101043))

(declare-fun b!766379 () Bool)

(declare-fun e!426746 () SeekEntryResult!7834)

(assert (=> b!766379 (= e!426746 (Intermediate!7834 true index!1321 x!1131))))

(declare-fun b!766380 () Bool)

(declare-fun lt!340789 () SeekEntryResult!7834)

(assert (=> b!766380 (and (bvsge (index!33706 lt!340789) #b00000000000000000000000000000000) (bvslt (index!33706 lt!340789) (size!20658 lt!340701)))))

(declare-fun e!426747 () Bool)

(assert (=> b!766380 (= e!426747 (= (select (arr!20237 lt!340701) (index!33706 lt!340789)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766381 () Bool)

(declare-fun e!426748 () Bool)

(assert (=> b!766381 (= e!426748 (bvsge (x!64619 lt!340789) #b01111111111111111111111111111110))))

(declare-fun b!766382 () Bool)

(assert (=> b!766382 (and (bvsge (index!33706 lt!340789) #b00000000000000000000000000000000) (bvslt (index!33706 lt!340789) (size!20658 lt!340701)))))

(declare-fun res!518595 () Bool)

(assert (=> b!766382 (= res!518595 (= (select (arr!20237 lt!340701) (index!33706 lt!340789)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766382 (=> res!518595 e!426747)))

(declare-fun b!766383 () Bool)

(declare-fun e!426745 () SeekEntryResult!7834)

(assert (=> b!766383 (= e!426745 (Intermediate!7834 false index!1321 x!1131))))

(declare-fun b!766384 () Bool)

(declare-fun e!426744 () Bool)

(assert (=> b!766384 (= e!426748 e!426744)))

(declare-fun res!518594 () Bool)

(assert (=> b!766384 (= res!518594 (and ((_ is Intermediate!7834) lt!340789) (not (undefined!8646 lt!340789)) (bvslt (x!64619 lt!340789) #b01111111111111111111111111111110) (bvsge (x!64619 lt!340789) #b00000000000000000000000000000000) (bvsge (x!64619 lt!340789) x!1131)))))

(assert (=> b!766384 (=> (not res!518594) (not e!426744))))

(declare-fun b!766385 () Bool)

(assert (=> b!766385 (and (bvsge (index!33706 lt!340789) #b00000000000000000000000000000000) (bvslt (index!33706 lt!340789) (size!20658 lt!340701)))))

(declare-fun res!518593 () Bool)

(assert (=> b!766385 (= res!518593 (= (select (arr!20237 lt!340701) (index!33706 lt!340789)) lt!340702))))

(assert (=> b!766385 (=> res!518593 e!426747)))

(assert (=> b!766385 (= e!426744 e!426747)))

(declare-fun b!766386 () Bool)

(assert (=> b!766386 (= e!426746 e!426745)))

(declare-fun c!84285 () Bool)

(declare-fun lt!340788 () (_ BitVec 64))

(assert (=> b!766386 (= c!84285 (or (= lt!340788 lt!340702) (= (bvadd lt!340788 lt!340788) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766387 () Bool)

(assert (=> b!766387 (= e!426745 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!340702 lt!340701 mask!3328))))

(declare-fun d!101045 () Bool)

(assert (=> d!101045 e!426748))

(declare-fun c!84283 () Bool)

(assert (=> d!101045 (= c!84283 (and ((_ is Intermediate!7834) lt!340789) (undefined!8646 lt!340789)))))

(assert (=> d!101045 (= lt!340789 e!426746)))

(declare-fun c!84284 () Bool)

(assert (=> d!101045 (= c!84284 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101045 (= lt!340788 (select (arr!20237 lt!340701) index!1321))))

(assert (=> d!101045 (validMask!0 mask!3328)))

(assert (=> d!101045 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340702 lt!340701 mask!3328) lt!340789)))

(assert (= (and d!101045 c!84284) b!766379))

(assert (= (and d!101045 (not c!84284)) b!766386))

(assert (= (and b!766386 c!84285) b!766383))

(assert (= (and b!766386 (not c!84285)) b!766387))

(assert (= (and d!101045 c!84283) b!766381))

(assert (= (and d!101045 (not c!84283)) b!766384))

(assert (= (and b!766384 res!518594) b!766385))

(assert (= (and b!766385 (not res!518593)) b!766382))

(assert (= (and b!766382 (not res!518595)) b!766380))

(declare-fun m!711845 () Bool)

(assert (=> d!101045 m!711845))

(assert (=> d!101045 m!711693))

(declare-fun m!711847 () Bool)

(assert (=> b!766382 m!711847))

(assert (=> b!766387 m!711689))

(assert (=> b!766387 m!711689))

(declare-fun m!711849 () Bool)

(assert (=> b!766387 m!711849))

(assert (=> b!766380 m!711847))

(assert (=> b!766385 m!711847))

(assert (=> b!766195 d!101045))

(declare-fun b!766388 () Bool)

(declare-fun e!426751 () SeekEntryResult!7834)

(assert (=> b!766388 (= e!426751 (Intermediate!7834 true (toIndex!0 lt!340702 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!766389 () Bool)

(declare-fun lt!340791 () SeekEntryResult!7834)

(assert (=> b!766389 (and (bvsge (index!33706 lt!340791) #b00000000000000000000000000000000) (bvslt (index!33706 lt!340791) (size!20658 lt!340701)))))

(declare-fun e!426752 () Bool)

(assert (=> b!766389 (= e!426752 (= (select (arr!20237 lt!340701) (index!33706 lt!340791)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766390 () Bool)

(declare-fun e!426753 () Bool)

(assert (=> b!766390 (= e!426753 (bvsge (x!64619 lt!340791) #b01111111111111111111111111111110))))

(declare-fun b!766391 () Bool)

(assert (=> b!766391 (and (bvsge (index!33706 lt!340791) #b00000000000000000000000000000000) (bvslt (index!33706 lt!340791) (size!20658 lt!340701)))))

(declare-fun res!518598 () Bool)

(assert (=> b!766391 (= res!518598 (= (select (arr!20237 lt!340701) (index!33706 lt!340791)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766391 (=> res!518598 e!426752)))

(declare-fun b!766392 () Bool)

(declare-fun e!426750 () SeekEntryResult!7834)

(assert (=> b!766392 (= e!426750 (Intermediate!7834 false (toIndex!0 lt!340702 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!766393 () Bool)

(declare-fun e!426749 () Bool)

(assert (=> b!766393 (= e!426753 e!426749)))

(declare-fun res!518597 () Bool)

(assert (=> b!766393 (= res!518597 (and ((_ is Intermediate!7834) lt!340791) (not (undefined!8646 lt!340791)) (bvslt (x!64619 lt!340791) #b01111111111111111111111111111110) (bvsge (x!64619 lt!340791) #b00000000000000000000000000000000) (bvsge (x!64619 lt!340791) #b00000000000000000000000000000000)))))

(assert (=> b!766393 (=> (not res!518597) (not e!426749))))

(declare-fun b!766394 () Bool)

(assert (=> b!766394 (and (bvsge (index!33706 lt!340791) #b00000000000000000000000000000000) (bvslt (index!33706 lt!340791) (size!20658 lt!340701)))))

(declare-fun res!518596 () Bool)

(assert (=> b!766394 (= res!518596 (= (select (arr!20237 lt!340701) (index!33706 lt!340791)) lt!340702))))

(assert (=> b!766394 (=> res!518596 e!426752)))

(assert (=> b!766394 (= e!426749 e!426752)))

(declare-fun b!766395 () Bool)

(assert (=> b!766395 (= e!426751 e!426750)))

(declare-fun c!84288 () Bool)

(declare-fun lt!340790 () (_ BitVec 64))

(assert (=> b!766395 (= c!84288 (or (= lt!340790 lt!340702) (= (bvadd lt!340790 lt!340790) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766396 () Bool)

(assert (=> b!766396 (= e!426750 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!340702 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!340702 lt!340701 mask!3328))))

(declare-fun d!101047 () Bool)

(assert (=> d!101047 e!426753))

(declare-fun c!84286 () Bool)

(assert (=> d!101047 (= c!84286 (and ((_ is Intermediate!7834) lt!340791) (undefined!8646 lt!340791)))))

(assert (=> d!101047 (= lt!340791 e!426751)))

(declare-fun c!84287 () Bool)

(assert (=> d!101047 (= c!84287 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101047 (= lt!340790 (select (arr!20237 lt!340701) (toIndex!0 lt!340702 mask!3328)))))

(assert (=> d!101047 (validMask!0 mask!3328)))

(assert (=> d!101047 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340702 mask!3328) lt!340702 lt!340701 mask!3328) lt!340791)))

(assert (= (and d!101047 c!84287) b!766388))

(assert (= (and d!101047 (not c!84287)) b!766395))

(assert (= (and b!766395 c!84288) b!766392))

(assert (= (and b!766395 (not c!84288)) b!766396))

(assert (= (and d!101047 c!84286) b!766390))

(assert (= (and d!101047 (not c!84286)) b!766393))

(assert (= (and b!766393 res!518597) b!766394))

(assert (= (and b!766394 (not res!518596)) b!766391))

(assert (= (and b!766391 (not res!518598)) b!766389))

(assert (=> d!101047 m!711705))

(declare-fun m!711851 () Bool)

(assert (=> d!101047 m!711851))

(assert (=> d!101047 m!711693))

(declare-fun m!711853 () Bool)

(assert (=> b!766391 m!711853))

(assert (=> b!766396 m!711705))

(declare-fun m!711855 () Bool)

(assert (=> b!766396 m!711855))

(assert (=> b!766396 m!711855))

(declare-fun m!711857 () Bool)

(assert (=> b!766396 m!711857))

(assert (=> b!766389 m!711853))

(assert (=> b!766394 m!711853))

(assert (=> b!766195 d!101047))

(declare-fun d!101049 () Bool)

(declare-fun lt!340793 () (_ BitVec 32))

(declare-fun lt!340792 () (_ BitVec 32))

(assert (=> d!101049 (= lt!340793 (bvmul (bvxor lt!340792 (bvlshr lt!340792 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101049 (= lt!340792 ((_ extract 31 0) (bvand (bvxor lt!340702 (bvlshr lt!340702 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101049 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!518592 (let ((h!15367 ((_ extract 31 0) (bvand (bvxor lt!340702 (bvlshr lt!340702 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64624 (bvmul (bvxor h!15367 (bvlshr h!15367 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64624 (bvlshr x!64624 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!518592 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!518592 #b00000000000000000000000000000000))))))

(assert (=> d!101049 (= (toIndex!0 lt!340702 mask!3328) (bvand (bvxor lt!340793 (bvlshr lt!340793 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!766195 d!101049))

(declare-fun b!766397 () Bool)

(declare-fun e!426755 () SeekEntryResult!7834)

(assert (=> b!766397 (= e!426755 (MissingVacant!7834 resIntermediateIndex!5))))

(declare-fun b!766398 () Bool)

(declare-fun e!426756 () SeekEntryResult!7834)

(assert (=> b!766398 (= e!426756 (Found!7834 resIntermediateIndex!5))))

(declare-fun b!766399 () Bool)

(declare-fun e!426754 () SeekEntryResult!7834)

(assert (=> b!766399 (= e!426754 Undefined!7834)))

(declare-fun b!766400 () Bool)

(assert (=> b!766400 (= e!426754 e!426756)))

(declare-fun lt!340795 () (_ BitVec 64))

(declare-fun c!84289 () Bool)

(assert (=> b!766400 (= c!84289 (= lt!340795 (select (arr!20237 a!3186) j!159)))))

(declare-fun b!766401 () Bool)

(declare-fun c!84290 () Bool)

(assert (=> b!766401 (= c!84290 (= lt!340795 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766401 (= e!426756 e!426755)))

(declare-fun lt!340794 () SeekEntryResult!7834)

(declare-fun d!101051 () Bool)

(assert (=> d!101051 (and (or ((_ is Undefined!7834) lt!340794) (not ((_ is Found!7834) lt!340794)) (and (bvsge (index!33705 lt!340794) #b00000000000000000000000000000000) (bvslt (index!33705 lt!340794) (size!20658 a!3186)))) (or ((_ is Undefined!7834) lt!340794) ((_ is Found!7834) lt!340794) (not ((_ is MissingVacant!7834) lt!340794)) (not (= (index!33707 lt!340794) resIntermediateIndex!5)) (and (bvsge (index!33707 lt!340794) #b00000000000000000000000000000000) (bvslt (index!33707 lt!340794) (size!20658 a!3186)))) (or ((_ is Undefined!7834) lt!340794) (ite ((_ is Found!7834) lt!340794) (= (select (arr!20237 a!3186) (index!33705 lt!340794)) (select (arr!20237 a!3186) j!159)) (and ((_ is MissingVacant!7834) lt!340794) (= (index!33707 lt!340794) resIntermediateIndex!5) (= (select (arr!20237 a!3186) (index!33707 lt!340794)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101051 (= lt!340794 e!426754)))

(declare-fun c!84291 () Bool)

(assert (=> d!101051 (= c!84291 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!101051 (= lt!340795 (select (arr!20237 a!3186) resIntermediateIndex!5))))

(assert (=> d!101051 (validMask!0 mask!3328)))

(assert (=> d!101051 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20237 a!3186) j!159) a!3186 mask!3328) lt!340794)))

(declare-fun b!766402 () Bool)

(assert (=> b!766402 (= e!426755 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20237 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101051 c!84291) b!766399))

(assert (= (and d!101051 (not c!84291)) b!766400))

(assert (= (and b!766400 c!84289) b!766398))

(assert (= (and b!766400 (not c!84289)) b!766401))

(assert (= (and b!766401 c!84290) b!766397))

(assert (= (and b!766401 (not c!84290)) b!766402))

(declare-fun m!711859 () Bool)

(assert (=> d!101051 m!711859))

(declare-fun m!711861 () Bool)

(assert (=> d!101051 m!711861))

(assert (=> d!101051 m!711673))

(assert (=> d!101051 m!711693))

(declare-fun m!711863 () Bool)

(assert (=> b!766402 m!711863))

(assert (=> b!766402 m!711863))

(assert (=> b!766402 m!711667))

(declare-fun m!711865 () Bool)

(assert (=> b!766402 m!711865))

(assert (=> b!766205 d!101051))

(declare-fun b!766431 () Bool)

(declare-fun e!426776 () Bool)

(declare-fun contains!4061 (List!14278 (_ BitVec 64)) Bool)

(assert (=> b!766431 (= e!426776 (contains!4061 Nil!14275 (select (arr!20237 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101053 () Bool)

(declare-fun res!518606 () Bool)

(declare-fun e!426774 () Bool)

(assert (=> d!101053 (=> res!518606 e!426774)))

(assert (=> d!101053 (= res!518606 (bvsge #b00000000000000000000000000000000 (size!20658 a!3186)))))

(assert (=> d!101053 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14275) e!426774)))

(declare-fun b!766432 () Bool)

(declare-fun e!426777 () Bool)

(declare-fun call!35023 () Bool)

(assert (=> b!766432 (= e!426777 call!35023)))

(declare-fun b!766433 () Bool)

(declare-fun e!426775 () Bool)

(assert (=> b!766433 (= e!426774 e!426775)))

(declare-fun res!518605 () Bool)

(assert (=> b!766433 (=> (not res!518605) (not e!426775))))

(assert (=> b!766433 (= res!518605 (not e!426776))))

(declare-fun res!518607 () Bool)

(assert (=> b!766433 (=> (not res!518607) (not e!426776))))

(assert (=> b!766433 (= res!518607 (validKeyInArray!0 (select (arr!20237 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!766434 () Bool)

(assert (=> b!766434 (= e!426775 e!426777)))

(declare-fun c!84303 () Bool)

(assert (=> b!766434 (= c!84303 (validKeyInArray!0 (select (arr!20237 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!766435 () Bool)

(assert (=> b!766435 (= e!426777 call!35023)))

(declare-fun bm!35020 () Bool)

(assert (=> bm!35020 (= call!35023 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84303 (Cons!14274 (select (arr!20237 a!3186) #b00000000000000000000000000000000) Nil!14275) Nil!14275)))))

(assert (= (and d!101053 (not res!518606)) b!766433))

(assert (= (and b!766433 res!518607) b!766431))

(assert (= (and b!766433 res!518605) b!766434))

(assert (= (and b!766434 c!84303) b!766432))

(assert (= (and b!766434 (not c!84303)) b!766435))

(assert (= (or b!766432 b!766435) bm!35020))

(assert (=> b!766431 m!711817))

(assert (=> b!766431 m!711817))

(declare-fun m!711875 () Bool)

(assert (=> b!766431 m!711875))

(assert (=> b!766433 m!711817))

(assert (=> b!766433 m!711817))

(assert (=> b!766433 m!711819))

(assert (=> b!766434 m!711817))

(assert (=> b!766434 m!711817))

(assert (=> b!766434 m!711819))

(assert (=> bm!35020 m!711817))

(declare-fun m!711877 () Bool)

(assert (=> bm!35020 m!711877))

(assert (=> b!766207 d!101053))

(declare-fun d!101057 () Bool)

(declare-fun res!518618 () Bool)

(declare-fun e!426792 () Bool)

(assert (=> d!101057 (=> res!518618 e!426792)))

(assert (=> d!101057 (= res!518618 (= (select (arr!20237 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101057 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!426792)))

(declare-fun b!766458 () Bool)

(declare-fun e!426793 () Bool)

(assert (=> b!766458 (= e!426792 e!426793)))

(declare-fun res!518619 () Bool)

(assert (=> b!766458 (=> (not res!518619) (not e!426793))))

(assert (=> b!766458 (= res!518619 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20658 a!3186)))))

(declare-fun b!766459 () Bool)

(assert (=> b!766459 (= e!426793 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101057 (not res!518618)) b!766458))

(assert (= (and b!766458 res!518619) b!766459))

(assert (=> d!101057 m!711817))

(declare-fun m!711879 () Bool)

(assert (=> b!766459 m!711879))

(assert (=> b!766196 d!101057))

(declare-fun d!101059 () Bool)

(assert (=> d!101059 (= (validKeyInArray!0 (select (arr!20237 a!3186) j!159)) (and (not (= (select (arr!20237 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20237 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!766192 d!101059))

(declare-fun d!101061 () Bool)

(declare-fun lt!340810 () (_ BitVec 32))

(assert (=> d!101061 (and (bvsge lt!340810 #b00000000000000000000000000000000) (bvslt lt!340810 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101061 (= lt!340810 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101061 (validMask!0 mask!3328)))

(assert (=> d!101061 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!340810)))

(declare-fun bs!21476 () Bool)

(assert (= bs!21476 d!101061))

(declare-fun m!711881 () Bool)

(assert (=> bs!21476 m!711881))

(assert (=> bs!21476 m!711693))

(assert (=> b!766204 d!101061))

(declare-fun b!766469 () Bool)

(declare-fun e!426801 () SeekEntryResult!7834)

(assert (=> b!766469 (= e!426801 (Intermediate!7834 true index!1321 x!1131))))

(declare-fun b!766470 () Bool)

(declare-fun lt!340812 () SeekEntryResult!7834)

(assert (=> b!766470 (and (bvsge (index!33706 lt!340812) #b00000000000000000000000000000000) (bvslt (index!33706 lt!340812) (size!20658 a!3186)))))

(declare-fun e!426802 () Bool)

(assert (=> b!766470 (= e!426802 (= (select (arr!20237 a!3186) (index!33706 lt!340812)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766471 () Bool)

(declare-fun e!426803 () Bool)

(assert (=> b!766471 (= e!426803 (bvsge (x!64619 lt!340812) #b01111111111111111111111111111110))))

(declare-fun b!766472 () Bool)

(assert (=> b!766472 (and (bvsge (index!33706 lt!340812) #b00000000000000000000000000000000) (bvslt (index!33706 lt!340812) (size!20658 a!3186)))))

(declare-fun res!518625 () Bool)

(assert (=> b!766472 (= res!518625 (= (select (arr!20237 a!3186) (index!33706 lt!340812)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766472 (=> res!518625 e!426802)))

(declare-fun b!766473 () Bool)

(declare-fun e!426800 () SeekEntryResult!7834)

(assert (=> b!766473 (= e!426800 (Intermediate!7834 false index!1321 x!1131))))

(declare-fun b!766474 () Bool)

(declare-fun e!426799 () Bool)

(assert (=> b!766474 (= e!426803 e!426799)))

(declare-fun res!518624 () Bool)

(assert (=> b!766474 (= res!518624 (and ((_ is Intermediate!7834) lt!340812) (not (undefined!8646 lt!340812)) (bvslt (x!64619 lt!340812) #b01111111111111111111111111111110) (bvsge (x!64619 lt!340812) #b00000000000000000000000000000000) (bvsge (x!64619 lt!340812) x!1131)))))

(assert (=> b!766474 (=> (not res!518624) (not e!426799))))

(declare-fun b!766475 () Bool)

(assert (=> b!766475 (and (bvsge (index!33706 lt!340812) #b00000000000000000000000000000000) (bvslt (index!33706 lt!340812) (size!20658 a!3186)))))

(declare-fun res!518623 () Bool)

(assert (=> b!766475 (= res!518623 (= (select (arr!20237 a!3186) (index!33706 lt!340812)) (select (arr!20237 a!3186) j!159)))))

(assert (=> b!766475 (=> res!518623 e!426802)))

(assert (=> b!766475 (= e!426799 e!426802)))

(declare-fun b!766476 () Bool)

(assert (=> b!766476 (= e!426801 e!426800)))

(declare-fun c!84315 () Bool)

(declare-fun lt!340811 () (_ BitVec 64))

(assert (=> b!766476 (= c!84315 (or (= lt!340811 (select (arr!20237 a!3186) j!159)) (= (bvadd lt!340811 lt!340811) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766477 () Bool)

(assert (=> b!766477 (= e!426800 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20237 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101063 () Bool)

(assert (=> d!101063 e!426803))

(declare-fun c!84313 () Bool)

(assert (=> d!101063 (= c!84313 (and ((_ is Intermediate!7834) lt!340812) (undefined!8646 lt!340812)))))

(assert (=> d!101063 (= lt!340812 e!426801)))

(declare-fun c!84314 () Bool)

(assert (=> d!101063 (= c!84314 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101063 (= lt!340811 (select (arr!20237 a!3186) index!1321))))

(assert (=> d!101063 (validMask!0 mask!3328)))

(assert (=> d!101063 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20237 a!3186) j!159) a!3186 mask!3328) lt!340812)))

(assert (= (and d!101063 c!84314) b!766469))

(assert (= (and d!101063 (not c!84314)) b!766476))

(assert (= (and b!766476 c!84315) b!766473))

(assert (= (and b!766476 (not c!84315)) b!766477))

(assert (= (and d!101063 c!84313) b!766471))

(assert (= (and d!101063 (not c!84313)) b!766474))

(assert (= (and b!766474 res!518624) b!766475))

(assert (= (and b!766475 (not res!518623)) b!766472))

(assert (= (and b!766472 (not res!518625)) b!766470))

(assert (=> d!101063 m!711833))

(assert (=> d!101063 m!711693))

(declare-fun m!711889 () Bool)

(assert (=> b!766472 m!711889))

(assert (=> b!766477 m!711689))

(assert (=> b!766477 m!711689))

(assert (=> b!766477 m!711667))

(declare-fun m!711891 () Bool)

(assert (=> b!766477 m!711891))

(assert (=> b!766470 m!711889))

(assert (=> b!766475 m!711889))

(assert (=> b!766190 d!101063))

(declare-fun b!766526 () Bool)

(declare-fun c!84336 () Bool)

(declare-fun lt!340834 () (_ BitVec 64))

(assert (=> b!766526 (= c!84336 (= lt!340834 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426830 () SeekEntryResult!7834)

(declare-fun e!426831 () SeekEntryResult!7834)

(assert (=> b!766526 (= e!426830 e!426831)))

(declare-fun b!766527 () Bool)

(declare-fun e!426832 () SeekEntryResult!7834)

(assert (=> b!766527 (= e!426832 Undefined!7834)))

(declare-fun b!766528 () Bool)

(declare-fun lt!340833 () SeekEntryResult!7834)

(assert (=> b!766528 (= e!426831 (MissingZero!7834 (index!33706 lt!340833)))))

(declare-fun b!766529 () Bool)

(assert (=> b!766529 (= e!426831 (seekKeyOrZeroReturnVacant!0 (x!64619 lt!340833) (index!33706 lt!340833) (index!33706 lt!340833) k0!2102 a!3186 mask!3328))))

(declare-fun b!766530 () Bool)

(assert (=> b!766530 (= e!426830 (Found!7834 (index!33706 lt!340833)))))

(declare-fun b!766531 () Bool)

(assert (=> b!766531 (= e!426832 e!426830)))

(assert (=> b!766531 (= lt!340834 (select (arr!20237 a!3186) (index!33706 lt!340833)))))

(declare-fun c!84334 () Bool)

(assert (=> b!766531 (= c!84334 (= lt!340834 k0!2102))))

(declare-fun d!101067 () Bool)

(declare-fun lt!340835 () SeekEntryResult!7834)

(assert (=> d!101067 (and (or ((_ is Undefined!7834) lt!340835) (not ((_ is Found!7834) lt!340835)) (and (bvsge (index!33705 lt!340835) #b00000000000000000000000000000000) (bvslt (index!33705 lt!340835) (size!20658 a!3186)))) (or ((_ is Undefined!7834) lt!340835) ((_ is Found!7834) lt!340835) (not ((_ is MissingZero!7834) lt!340835)) (and (bvsge (index!33704 lt!340835) #b00000000000000000000000000000000) (bvslt (index!33704 lt!340835) (size!20658 a!3186)))) (or ((_ is Undefined!7834) lt!340835) ((_ is Found!7834) lt!340835) ((_ is MissingZero!7834) lt!340835) (not ((_ is MissingVacant!7834) lt!340835)) (and (bvsge (index!33707 lt!340835) #b00000000000000000000000000000000) (bvslt (index!33707 lt!340835) (size!20658 a!3186)))) (or ((_ is Undefined!7834) lt!340835) (ite ((_ is Found!7834) lt!340835) (= (select (arr!20237 a!3186) (index!33705 lt!340835)) k0!2102) (ite ((_ is MissingZero!7834) lt!340835) (= (select (arr!20237 a!3186) (index!33704 lt!340835)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7834) lt!340835) (= (select (arr!20237 a!3186) (index!33707 lt!340835)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101067 (= lt!340835 e!426832)))

(declare-fun c!84335 () Bool)

(assert (=> d!101067 (= c!84335 (and ((_ is Intermediate!7834) lt!340833) (undefined!8646 lt!340833)))))

(assert (=> d!101067 (= lt!340833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101067 (validMask!0 mask!3328)))

(assert (=> d!101067 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!340835)))

(assert (= (and d!101067 c!84335) b!766527))

(assert (= (and d!101067 (not c!84335)) b!766531))

(assert (= (and b!766531 c!84334) b!766530))

(assert (= (and b!766531 (not c!84334)) b!766526))

(assert (= (and b!766526 c!84336) b!766528))

(assert (= (and b!766526 (not c!84336)) b!766529))

(declare-fun m!711909 () Bool)

(assert (=> b!766529 m!711909))

(declare-fun m!711911 () Bool)

(assert (=> b!766531 m!711911))

(declare-fun m!711913 () Bool)

(assert (=> d!101067 m!711913))

(declare-fun m!711915 () Bool)

(assert (=> d!101067 m!711915))

(assert (=> d!101067 m!711693))

(declare-fun m!711917 () Bool)

(assert (=> d!101067 m!711917))

(declare-fun m!711919 () Bool)

(assert (=> d!101067 m!711919))

(assert (=> d!101067 m!711913))

(declare-fun m!711921 () Bool)

(assert (=> d!101067 m!711921))

(assert (=> b!766200 d!101067))

(declare-fun d!101077 () Bool)

(declare-fun res!518642 () Bool)

(declare-fun e!426837 () Bool)

(assert (=> d!101077 (=> res!518642 e!426837)))

(assert (=> d!101077 (= res!518642 (bvsge j!159 (size!20658 a!3186)))))

(assert (=> d!101077 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!426837)))

(declare-fun b!766538 () Bool)

(declare-fun e!426839 () Bool)

(assert (=> b!766538 (= e!426837 e!426839)))

(declare-fun c!84339 () Bool)

(assert (=> b!766538 (= c!84339 (validKeyInArray!0 (select (arr!20237 a!3186) j!159)))))

(declare-fun b!766539 () Bool)

(declare-fun e!426838 () Bool)

(declare-fun call!35024 () Bool)

(assert (=> b!766539 (= e!426838 call!35024)))

(declare-fun b!766540 () Bool)

(assert (=> b!766540 (= e!426839 call!35024)))

(declare-fun bm!35021 () Bool)

(assert (=> bm!35021 (= call!35024 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!766541 () Bool)

(assert (=> b!766541 (= e!426839 e!426838)))

(declare-fun lt!340844 () (_ BitVec 64))

(assert (=> b!766541 (= lt!340844 (select (arr!20237 a!3186) j!159))))

(declare-fun lt!340843 () Unit!26366)

(assert (=> b!766541 (= lt!340843 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!340844 j!159))))

(assert (=> b!766541 (arrayContainsKey!0 a!3186 lt!340844 #b00000000000000000000000000000000)))

(declare-fun lt!340842 () Unit!26366)

(assert (=> b!766541 (= lt!340842 lt!340843)))

(declare-fun res!518641 () Bool)

(assert (=> b!766541 (= res!518641 (= (seekEntryOrOpen!0 (select (arr!20237 a!3186) j!159) a!3186 mask!3328) (Found!7834 j!159)))))

(assert (=> b!766541 (=> (not res!518641) (not e!426838))))

(assert (= (and d!101077 (not res!518642)) b!766538))

(assert (= (and b!766538 c!84339) b!766541))

(assert (= (and b!766538 (not c!84339)) b!766540))

(assert (= (and b!766541 res!518641) b!766539))

(assert (= (or b!766539 b!766540) bm!35021))

(assert (=> b!766538 m!711667))

(assert (=> b!766538 m!711667))

(assert (=> b!766538 m!711687))

(declare-fun m!711923 () Bool)

(assert (=> bm!35021 m!711923))

(assert (=> b!766541 m!711667))

(declare-fun m!711925 () Bool)

(assert (=> b!766541 m!711925))

(declare-fun m!711927 () Bool)

(assert (=> b!766541 m!711927))

(assert (=> b!766541 m!711667))

(assert (=> b!766541 m!711671))

(assert (=> b!766189 d!101077))

(declare-fun d!101081 () Bool)

(assert (=> d!101081 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!340852 () Unit!26366)

(declare-fun choose!38 (array!42264 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26366)

(assert (=> d!101081 (= lt!340852 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101081 (validMask!0 mask!3328)))

(assert (=> d!101081 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!340852)))

(declare-fun bs!21477 () Bool)

(assert (= bs!21477 d!101081))

(assert (=> bs!21477 m!711701))

(declare-fun m!711941 () Bool)

(assert (=> bs!21477 m!711941))

(assert (=> bs!21477 m!711693))

(assert (=> b!766189 d!101081))

(declare-fun b!766558 () Bool)

(declare-fun e!426855 () SeekEntryResult!7834)

(assert (=> b!766558 (= e!426855 (Intermediate!7834 true lt!340700 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!766559 () Bool)

(declare-fun lt!340855 () SeekEntryResult!7834)

(assert (=> b!766559 (and (bvsge (index!33706 lt!340855) #b00000000000000000000000000000000) (bvslt (index!33706 lt!340855) (size!20658 a!3186)))))

(declare-fun e!426856 () Bool)

(assert (=> b!766559 (= e!426856 (= (select (arr!20237 a!3186) (index!33706 lt!340855)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766560 () Bool)

(declare-fun e!426857 () Bool)

(assert (=> b!766560 (= e!426857 (bvsge (x!64619 lt!340855) #b01111111111111111111111111111110))))

(declare-fun b!766561 () Bool)

(assert (=> b!766561 (and (bvsge (index!33706 lt!340855) #b00000000000000000000000000000000) (bvslt (index!33706 lt!340855) (size!20658 a!3186)))))

(declare-fun res!518655 () Bool)

(assert (=> b!766561 (= res!518655 (= (select (arr!20237 a!3186) (index!33706 lt!340855)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766561 (=> res!518655 e!426856)))

(declare-fun b!766562 () Bool)

(declare-fun e!426854 () SeekEntryResult!7834)

(assert (=> b!766562 (= e!426854 (Intermediate!7834 false lt!340700 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!766563 () Bool)

(declare-fun e!426853 () Bool)

(assert (=> b!766563 (= e!426857 e!426853)))

(declare-fun res!518654 () Bool)

(assert (=> b!766563 (= res!518654 (and ((_ is Intermediate!7834) lt!340855) (not (undefined!8646 lt!340855)) (bvslt (x!64619 lt!340855) #b01111111111111111111111111111110) (bvsge (x!64619 lt!340855) #b00000000000000000000000000000000) (bvsge (x!64619 lt!340855) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!766563 (=> (not res!518654) (not e!426853))))

(declare-fun b!766564 () Bool)

(assert (=> b!766564 (and (bvsge (index!33706 lt!340855) #b00000000000000000000000000000000) (bvslt (index!33706 lt!340855) (size!20658 a!3186)))))

(declare-fun res!518653 () Bool)

(assert (=> b!766564 (= res!518653 (= (select (arr!20237 a!3186) (index!33706 lt!340855)) (select (arr!20237 a!3186) j!159)))))

(assert (=> b!766564 (=> res!518653 e!426856)))

(assert (=> b!766564 (= e!426853 e!426856)))

(declare-fun b!766565 () Bool)

(assert (=> b!766565 (= e!426855 e!426854)))

(declare-fun lt!340854 () (_ BitVec 64))

(declare-fun c!84345 () Bool)

(assert (=> b!766565 (= c!84345 (or (= lt!340854 (select (arr!20237 a!3186) j!159)) (= (bvadd lt!340854 lt!340854) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766566 () Bool)

(assert (=> b!766566 (= e!426854 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!340700 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) (select (arr!20237 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101085 () Bool)

(assert (=> d!101085 e!426857))

(declare-fun c!84343 () Bool)

(assert (=> d!101085 (= c!84343 (and ((_ is Intermediate!7834) lt!340855) (undefined!8646 lt!340855)))))

(assert (=> d!101085 (= lt!340855 e!426855)))

(declare-fun c!84344 () Bool)

(assert (=> d!101085 (= c!84344 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101085 (= lt!340854 (select (arr!20237 a!3186) lt!340700))))

(assert (=> d!101085 (validMask!0 mask!3328)))

(assert (=> d!101085 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!340700 (select (arr!20237 a!3186) j!159) a!3186 mask!3328) lt!340855)))

(assert (= (and d!101085 c!84344) b!766558))

(assert (= (and d!101085 (not c!84344)) b!766565))

(assert (= (and b!766565 c!84345) b!766562))

(assert (= (and b!766565 (not c!84345)) b!766566))

(assert (= (and d!101085 c!84343) b!766560))

(assert (= (and d!101085 (not c!84343)) b!766563))

(assert (= (and b!766563 res!518654) b!766564))

(assert (= (and b!766564 (not res!518653)) b!766561))

(assert (= (and b!766561 (not res!518655)) b!766559))

(declare-fun m!711951 () Bool)

(assert (=> d!101085 m!711951))

(assert (=> d!101085 m!711693))

(declare-fun m!711959 () Bool)

(assert (=> b!766561 m!711959))

(declare-fun m!711963 () Bool)

(assert (=> b!766566 m!711963))

(assert (=> b!766566 m!711963))

(assert (=> b!766566 m!711667))

(declare-fun m!711965 () Bool)

(assert (=> b!766566 m!711965))

(assert (=> b!766559 m!711959))

(assert (=> b!766564 m!711959))

(assert (=> b!766202 d!101085))

(declare-fun d!101095 () Bool)

(assert (=> d!101095 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!766191 d!101095))

(declare-fun b!766576 () Bool)

(declare-fun c!84350 () Bool)

(declare-fun lt!340860 () (_ BitVec 64))

(assert (=> b!766576 (= c!84350 (= lt!340860 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426865 () SeekEntryResult!7834)

(declare-fun e!426866 () SeekEntryResult!7834)

(assert (=> b!766576 (= e!426865 e!426866)))

(declare-fun b!766577 () Bool)

(declare-fun e!426867 () SeekEntryResult!7834)

(assert (=> b!766577 (= e!426867 Undefined!7834)))

(declare-fun b!766578 () Bool)

(declare-fun lt!340859 () SeekEntryResult!7834)

(assert (=> b!766578 (= e!426866 (MissingZero!7834 (index!33706 lt!340859)))))

(declare-fun b!766579 () Bool)

(assert (=> b!766579 (= e!426866 (seekKeyOrZeroReturnVacant!0 (x!64619 lt!340859) (index!33706 lt!340859) (index!33706 lt!340859) (select (arr!20237 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!766580 () Bool)

(assert (=> b!766580 (= e!426865 (Found!7834 (index!33706 lt!340859)))))

(declare-fun b!766581 () Bool)

(assert (=> b!766581 (= e!426867 e!426865)))

(assert (=> b!766581 (= lt!340860 (select (arr!20237 a!3186) (index!33706 lt!340859)))))

(declare-fun c!84348 () Bool)

(assert (=> b!766581 (= c!84348 (= lt!340860 (select (arr!20237 a!3186) j!159)))))

(declare-fun d!101097 () Bool)

(declare-fun lt!340861 () SeekEntryResult!7834)

(assert (=> d!101097 (and (or ((_ is Undefined!7834) lt!340861) (not ((_ is Found!7834) lt!340861)) (and (bvsge (index!33705 lt!340861) #b00000000000000000000000000000000) (bvslt (index!33705 lt!340861) (size!20658 a!3186)))) (or ((_ is Undefined!7834) lt!340861) ((_ is Found!7834) lt!340861) (not ((_ is MissingZero!7834) lt!340861)) (and (bvsge (index!33704 lt!340861) #b00000000000000000000000000000000) (bvslt (index!33704 lt!340861) (size!20658 a!3186)))) (or ((_ is Undefined!7834) lt!340861) ((_ is Found!7834) lt!340861) ((_ is MissingZero!7834) lt!340861) (not ((_ is MissingVacant!7834) lt!340861)) (and (bvsge (index!33707 lt!340861) #b00000000000000000000000000000000) (bvslt (index!33707 lt!340861) (size!20658 a!3186)))) (or ((_ is Undefined!7834) lt!340861) (ite ((_ is Found!7834) lt!340861) (= (select (arr!20237 a!3186) (index!33705 lt!340861)) (select (arr!20237 a!3186) j!159)) (ite ((_ is MissingZero!7834) lt!340861) (= (select (arr!20237 a!3186) (index!33704 lt!340861)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7834) lt!340861) (= (select (arr!20237 a!3186) (index!33707 lt!340861)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101097 (= lt!340861 e!426867)))

(declare-fun c!84349 () Bool)

(assert (=> d!101097 (= c!84349 (and ((_ is Intermediate!7834) lt!340859) (undefined!8646 lt!340859)))))

(assert (=> d!101097 (= lt!340859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20237 a!3186) j!159) mask!3328) (select (arr!20237 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101097 (validMask!0 mask!3328)))

(assert (=> d!101097 (= (seekEntryOrOpen!0 (select (arr!20237 a!3186) j!159) a!3186 mask!3328) lt!340861)))

(assert (= (and d!101097 c!84349) b!766577))

(assert (= (and d!101097 (not c!84349)) b!766581))

(assert (= (and b!766581 c!84348) b!766580))

(assert (= (and b!766581 (not c!84348)) b!766576))

(assert (= (and b!766576 c!84350) b!766578))

(assert (= (and b!766576 (not c!84350)) b!766579))

(assert (=> b!766579 m!711667))

(declare-fun m!711967 () Bool)

(assert (=> b!766579 m!711967))

(declare-fun m!711969 () Bool)

(assert (=> b!766581 m!711969))

(assert (=> d!101097 m!711667))

(assert (=> d!101097 m!711677))

(declare-fun m!711971 () Bool)

(assert (=> d!101097 m!711971))

(assert (=> d!101097 m!711693))

(declare-fun m!711973 () Bool)

(assert (=> d!101097 m!711973))

(declare-fun m!711975 () Bool)

(assert (=> d!101097 m!711975))

(assert (=> d!101097 m!711677))

(assert (=> d!101097 m!711667))

(assert (=> d!101097 m!711679))

(assert (=> b!766201 d!101097))

(check-sat (not d!101029) (not b!766529) (not d!101063) (not b!766333) (not d!101097) (not d!101047) (not b!766459) (not d!101031) (not b!766378) (not d!101081) (not bm!35020) (not b!766566) (not b!766387) (not d!101061) (not bm!35017) (not b!766330) (not b!766541) (not b!766402) (not d!101051) (not b!766433) (not bm!35021) (not d!101085) (not b!766396) (not b!766434) (not b!766431) (not b!766477) (not d!101067) (not b!766579) (not b!766538) (not d!101045) (not b!766351))
(check-sat)
