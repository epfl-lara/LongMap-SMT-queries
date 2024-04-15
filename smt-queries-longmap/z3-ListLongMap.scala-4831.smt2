; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66438 () Bool)

(assert start!66438)

(declare-fun b!765402 () Bool)

(declare-fun res!517774 () Bool)

(declare-fun e!426261 () Bool)

(assert (=> b!765402 (=> (not res!517774) (not e!426261))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-datatypes ((array!42234 0))(
  ( (array!42235 (arr!20222 (Array (_ BitVec 32) (_ BitVec 64))) (size!20643 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42234)

(assert (=> b!765402 (= res!517774 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20222 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765403 () Bool)

(declare-fun res!517771 () Bool)

(declare-fun e!426262 () Bool)

(assert (=> b!765403 (=> (not res!517771) (not e!426262))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!765403 (= res!517771 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!765404 () Bool)

(declare-fun e!426266 () Bool)

(assert (=> b!765404 (= e!426262 e!426266)))

(declare-fun res!517763 () Bool)

(assert (=> b!765404 (=> (not res!517763) (not e!426266))))

(declare-datatypes ((SeekEntryResult!7819 0))(
  ( (MissingZero!7819 (index!33644 (_ BitVec 32))) (Found!7819 (index!33645 (_ BitVec 32))) (Intermediate!7819 (undefined!8631 Bool) (index!33646 (_ BitVec 32)) (x!64564 (_ BitVec 32))) (Undefined!7819) (MissingVacant!7819 (index!33647 (_ BitVec 32))) )
))
(declare-fun lt!340369 () SeekEntryResult!7819)

(assert (=> b!765404 (= res!517763 (or (= lt!340369 (MissingZero!7819 i!1173)) (= lt!340369 (MissingVacant!7819 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42234 (_ BitVec 32)) SeekEntryResult!7819)

(assert (=> b!765404 (= lt!340369 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!340370 () SeekEntryResult!7819)

(declare-fun b!765405 () Bool)

(declare-fun e!426263 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42234 (_ BitVec 32)) SeekEntryResult!7819)

(assert (=> b!765405 (= e!426263 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20222 a!3186) j!159) a!3186 mask!3328) lt!340370))))

(declare-fun b!765406 () Bool)

(declare-fun res!517762 () Bool)

(assert (=> b!765406 (=> (not res!517762) (not e!426266))))

(declare-datatypes ((List!14263 0))(
  ( (Nil!14260) (Cons!14259 (h!15349 (_ BitVec 64)) (t!20569 List!14263)) )
))
(declare-fun arrayNoDuplicates!0 (array!42234 (_ BitVec 32) List!14263) Bool)

(assert (=> b!765406 (= res!517762 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14260))))

(declare-fun b!765407 () Bool)

(declare-fun res!517765 () Bool)

(assert (=> b!765407 (=> (not res!517765) (not e!426266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42234 (_ BitVec 32)) Bool)

(assert (=> b!765407 (= res!517765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!517770 () Bool)

(assert (=> start!66438 (=> (not res!517770) (not e!426262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66438 (= res!517770 (validMask!0 mask!3328))))

(assert (=> start!66438 e!426262))

(assert (=> start!66438 true))

(declare-fun array_inv!16105 (array!42234) Bool)

(assert (=> start!66438 (array_inv!16105 a!3186)))

(declare-fun b!765408 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!426264 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!765408 (= e!426264 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20222 a!3186) j!159) a!3186 mask!3328) (Found!7819 j!159)))))

(declare-fun b!765409 () Bool)

(declare-fun e!426259 () Bool)

(assert (=> b!765409 (= e!426261 e!426259)))

(declare-fun res!517773 () Bool)

(assert (=> b!765409 (=> (not res!517773) (not e!426259))))

(declare-fun lt!340373 () array!42234)

(declare-fun lt!340371 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42234 (_ BitVec 32)) SeekEntryResult!7819)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765409 (= res!517773 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340371 mask!3328) lt!340371 lt!340373 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340371 lt!340373 mask!3328)))))

(assert (=> b!765409 (= lt!340371 (select (store (arr!20222 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!765409 (= lt!340373 (array!42235 (store (arr!20222 a!3186) i!1173 k0!2102) (size!20643 a!3186)))))

(declare-fun b!765410 () Bool)

(declare-fun lt!340372 () SeekEntryResult!7819)

(assert (=> b!765410 (= e!426264 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20222 a!3186) j!159) a!3186 mask!3328) lt!340372))))

(declare-fun b!765411 () Bool)

(assert (=> b!765411 (= e!426266 e!426261)))

(declare-fun res!517769 () Bool)

(assert (=> b!765411 (=> (not res!517769) (not e!426261))))

(assert (=> b!765411 (= res!517769 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20222 a!3186) j!159) mask!3328) (select (arr!20222 a!3186) j!159) a!3186 mask!3328) lt!340372))))

(assert (=> b!765411 (= lt!340372 (Intermediate!7819 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!765412 () Bool)

(declare-fun res!517772 () Bool)

(assert (=> b!765412 (=> (not res!517772) (not e!426261))))

(assert (=> b!765412 (= res!517772 e!426264)))

(declare-fun c!84210 () Bool)

(assert (=> b!765412 (= c!84210 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!765413 () Bool)

(declare-fun res!517761 () Bool)

(assert (=> b!765413 (=> (not res!517761) (not e!426262))))

(assert (=> b!765413 (= res!517761 (and (= (size!20643 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20643 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20643 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!765414 () Bool)

(declare-fun res!517764 () Bool)

(assert (=> b!765414 (=> (not res!517764) (not e!426262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765414 (= res!517764 (validKeyInArray!0 k0!2102))))

(declare-fun b!765415 () Bool)

(declare-fun res!517767 () Bool)

(assert (=> b!765415 (=> (not res!517767) (not e!426266))))

(assert (=> b!765415 (= res!517767 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20643 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20643 a!3186))))))

(declare-fun b!765416 () Bool)

(assert (=> b!765416 (= e!426259 (not true))))

(declare-fun e!426265 () Bool)

(assert (=> b!765416 e!426265))

(declare-fun res!517766 () Bool)

(assert (=> b!765416 (=> (not res!517766) (not e!426265))))

(assert (=> b!765416 (= res!517766 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26336 0))(
  ( (Unit!26337) )
))
(declare-fun lt!340368 () Unit!26336)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42234 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26336)

(assert (=> b!765416 (= lt!340368 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!765417 () Bool)

(assert (=> b!765417 (= e!426265 e!426263)))

(declare-fun res!517775 () Bool)

(assert (=> b!765417 (=> (not res!517775) (not e!426263))))

(assert (=> b!765417 (= res!517775 (= (seekEntryOrOpen!0 (select (arr!20222 a!3186) j!159) a!3186 mask!3328) lt!340370))))

(assert (=> b!765417 (= lt!340370 (Found!7819 j!159))))

(declare-fun b!765418 () Bool)

(declare-fun res!517768 () Bool)

(assert (=> b!765418 (=> (not res!517768) (not e!426262))))

(assert (=> b!765418 (= res!517768 (validKeyInArray!0 (select (arr!20222 a!3186) j!159)))))

(assert (= (and start!66438 res!517770) b!765413))

(assert (= (and b!765413 res!517761) b!765418))

(assert (= (and b!765418 res!517768) b!765414))

(assert (= (and b!765414 res!517764) b!765403))

(assert (= (and b!765403 res!517771) b!765404))

(assert (= (and b!765404 res!517763) b!765407))

(assert (= (and b!765407 res!517765) b!765406))

(assert (= (and b!765406 res!517762) b!765415))

(assert (= (and b!765415 res!517767) b!765411))

(assert (= (and b!765411 res!517769) b!765402))

(assert (= (and b!765402 res!517774) b!765412))

(assert (= (and b!765412 c!84210) b!765410))

(assert (= (and b!765412 (not c!84210)) b!765408))

(assert (= (and b!765412 res!517772) b!765409))

(assert (= (and b!765409 res!517773) b!765416))

(assert (= (and b!765416 res!517766) b!765417))

(assert (= (and b!765417 res!517775) b!765405))

(declare-fun m!710965 () Bool)

(assert (=> b!765410 m!710965))

(assert (=> b!765410 m!710965))

(declare-fun m!710967 () Bool)

(assert (=> b!765410 m!710967))

(declare-fun m!710969 () Bool)

(assert (=> b!765402 m!710969))

(assert (=> b!765418 m!710965))

(assert (=> b!765418 m!710965))

(declare-fun m!710971 () Bool)

(assert (=> b!765418 m!710971))

(declare-fun m!710973 () Bool)

(assert (=> b!765406 m!710973))

(assert (=> b!765411 m!710965))

(assert (=> b!765411 m!710965))

(declare-fun m!710975 () Bool)

(assert (=> b!765411 m!710975))

(assert (=> b!765411 m!710975))

(assert (=> b!765411 m!710965))

(declare-fun m!710977 () Bool)

(assert (=> b!765411 m!710977))

(declare-fun m!710979 () Bool)

(assert (=> b!765403 m!710979))

(assert (=> b!765408 m!710965))

(assert (=> b!765408 m!710965))

(declare-fun m!710981 () Bool)

(assert (=> b!765408 m!710981))

(assert (=> b!765405 m!710965))

(assert (=> b!765405 m!710965))

(declare-fun m!710983 () Bool)

(assert (=> b!765405 m!710983))

(declare-fun m!710985 () Bool)

(assert (=> b!765409 m!710985))

(declare-fun m!710987 () Bool)

(assert (=> b!765409 m!710987))

(declare-fun m!710989 () Bool)

(assert (=> b!765409 m!710989))

(assert (=> b!765409 m!710985))

(declare-fun m!710991 () Bool)

(assert (=> b!765409 m!710991))

(declare-fun m!710993 () Bool)

(assert (=> b!765409 m!710993))

(declare-fun m!710995 () Bool)

(assert (=> b!765407 m!710995))

(declare-fun m!710997 () Bool)

(assert (=> b!765416 m!710997))

(declare-fun m!710999 () Bool)

(assert (=> b!765416 m!710999))

(declare-fun m!711001 () Bool)

(assert (=> b!765414 m!711001))

(assert (=> b!765417 m!710965))

(assert (=> b!765417 m!710965))

(declare-fun m!711003 () Bool)

(assert (=> b!765417 m!711003))

(declare-fun m!711005 () Bool)

(assert (=> b!765404 m!711005))

(declare-fun m!711007 () Bool)

(assert (=> start!66438 m!711007))

(declare-fun m!711009 () Bool)

(assert (=> start!66438 m!711009))

(check-sat (not start!66438) (not b!765417) (not b!765414) (not b!765418) (not b!765411) (not b!765404) (not b!765408) (not b!765409) (not b!765416) (not b!765405) (not b!765406) (not b!765407) (not b!765403) (not b!765410))
(check-sat)
