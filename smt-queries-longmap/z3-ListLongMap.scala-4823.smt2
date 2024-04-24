; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66398 () Bool)

(assert start!66398)

(declare-fun b!764395 () Bool)

(declare-fun e!425900 () Bool)

(assert (=> b!764395 (= e!425900 false)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!42181 0))(
  ( (array!42182 (arr!20194 (Array (_ BitVec 32) (_ BitVec 64))) (size!20614 (_ BitVec 32))) )
))
(declare-fun lt!340197 () array!42181)

(declare-fun lt!340199 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7750 0))(
  ( (MissingZero!7750 (index!33368 (_ BitVec 32))) (Found!7750 (index!33369 (_ BitVec 32))) (Intermediate!7750 (undefined!8562 Bool) (index!33370 (_ BitVec 32)) (x!64429 (_ BitVec 32))) (Undefined!7750) (MissingVacant!7750 (index!33371 (_ BitVec 32))) )
))
(declare-fun lt!340195 () SeekEntryResult!7750)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42181 (_ BitVec 32)) SeekEntryResult!7750)

(assert (=> b!764395 (= lt!340195 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340199 lt!340197 mask!3328))))

(declare-fun lt!340196 () SeekEntryResult!7750)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764395 (= lt!340196 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340199 mask!3328) lt!340199 lt!340197 mask!3328))))

(declare-fun a!3186 () array!42181)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!764395 (= lt!340199 (select (store (arr!20194 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!764395 (= lt!340197 (array!42182 (store (arr!20194 a!3186) i!1173 k0!2102) (size!20614 a!3186)))))

(declare-fun res!516952 () Bool)

(declare-fun e!425897 () Bool)

(assert (=> start!66398 (=> (not res!516952) (not e!425897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66398 (= res!516952 (validMask!0 mask!3328))))

(assert (=> start!66398 e!425897))

(assert (=> start!66398 true))

(declare-fun array_inv!16053 (array!42181) Bool)

(assert (=> start!66398 (array_inv!16053 a!3186)))

(declare-fun b!764396 () Bool)

(declare-fun res!516954 () Bool)

(assert (=> b!764396 (=> (not res!516954) (not e!425897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764396 (= res!516954 (validKeyInArray!0 k0!2102))))

(declare-fun lt!340200 () SeekEntryResult!7750)

(declare-fun b!764397 () Bool)

(declare-fun e!425898 () Bool)

(assert (=> b!764397 (= e!425898 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20194 a!3186) j!159) a!3186 mask!3328) lt!340200))))

(declare-fun b!764398 () Bool)

(declare-fun res!516951 () Bool)

(assert (=> b!764398 (=> (not res!516951) (not e!425897))))

(declare-fun arrayContainsKey!0 (array!42181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764398 (= res!516951 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764399 () Bool)

(declare-fun res!516955 () Bool)

(declare-fun e!425899 () Bool)

(assert (=> b!764399 (=> (not res!516955) (not e!425899))))

(declare-datatypes ((List!14103 0))(
  ( (Nil!14100) (Cons!14099 (h!15189 (_ BitVec 64)) (t!20410 List!14103)) )
))
(declare-fun arrayNoDuplicates!0 (array!42181 (_ BitVec 32) List!14103) Bool)

(assert (=> b!764399 (= res!516955 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14100))))

(declare-fun b!764400 () Bool)

(declare-fun res!516959 () Bool)

(assert (=> b!764400 (=> (not res!516959) (not e!425900))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!764400 (= res!516959 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20194 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764401 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42181 (_ BitVec 32)) SeekEntryResult!7750)

(assert (=> b!764401 (= e!425898 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20194 a!3186) j!159) a!3186 mask!3328) (Found!7750 j!159)))))

(declare-fun b!764402 () Bool)

(assert (=> b!764402 (= e!425899 e!425900)))

(declare-fun res!516953 () Bool)

(assert (=> b!764402 (=> (not res!516953) (not e!425900))))

(assert (=> b!764402 (= res!516953 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20194 a!3186) j!159) mask!3328) (select (arr!20194 a!3186) j!159) a!3186 mask!3328) lt!340200))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764402 (= lt!340200 (Intermediate!7750 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764403 () Bool)

(assert (=> b!764403 (= e!425897 e!425899)))

(declare-fun res!516949 () Bool)

(assert (=> b!764403 (=> (not res!516949) (not e!425899))))

(declare-fun lt!340198 () SeekEntryResult!7750)

(assert (=> b!764403 (= res!516949 (or (= lt!340198 (MissingZero!7750 i!1173)) (= lt!340198 (MissingVacant!7750 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42181 (_ BitVec 32)) SeekEntryResult!7750)

(assert (=> b!764403 (= lt!340198 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!764404 () Bool)

(declare-fun res!516948 () Bool)

(assert (=> b!764404 (=> (not res!516948) (not e!425897))))

(assert (=> b!764404 (= res!516948 (validKeyInArray!0 (select (arr!20194 a!3186) j!159)))))

(declare-fun b!764405 () Bool)

(declare-fun res!516958 () Bool)

(assert (=> b!764405 (=> (not res!516958) (not e!425899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42181 (_ BitVec 32)) Bool)

(assert (=> b!764405 (= res!516958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764406 () Bool)

(declare-fun res!516956 () Bool)

(assert (=> b!764406 (=> (not res!516956) (not e!425899))))

(assert (=> b!764406 (= res!516956 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20614 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20614 a!3186))))))

(declare-fun b!764407 () Bool)

(declare-fun res!516950 () Bool)

(assert (=> b!764407 (=> (not res!516950) (not e!425897))))

(assert (=> b!764407 (= res!516950 (and (= (size!20614 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20614 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20614 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764408 () Bool)

(declare-fun res!516957 () Bool)

(assert (=> b!764408 (=> (not res!516957) (not e!425900))))

(assert (=> b!764408 (= res!516957 e!425898)))

(declare-fun c!84113 () Bool)

(assert (=> b!764408 (= c!84113 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66398 res!516952) b!764407))

(assert (= (and b!764407 res!516950) b!764404))

(assert (= (and b!764404 res!516948) b!764396))

(assert (= (and b!764396 res!516954) b!764398))

(assert (= (and b!764398 res!516951) b!764403))

(assert (= (and b!764403 res!516949) b!764405))

(assert (= (and b!764405 res!516958) b!764399))

(assert (= (and b!764399 res!516955) b!764406))

(assert (= (and b!764406 res!516956) b!764402))

(assert (= (and b!764402 res!516953) b!764400))

(assert (= (and b!764400 res!516959) b!764408))

(assert (= (and b!764408 c!84113) b!764397))

(assert (= (and b!764408 (not c!84113)) b!764401))

(assert (= (and b!764408 res!516957) b!764395))

(declare-fun m!711223 () Bool)

(assert (=> b!764401 m!711223))

(assert (=> b!764401 m!711223))

(declare-fun m!711225 () Bool)

(assert (=> b!764401 m!711225))

(assert (=> b!764402 m!711223))

(assert (=> b!764402 m!711223))

(declare-fun m!711227 () Bool)

(assert (=> b!764402 m!711227))

(assert (=> b!764402 m!711227))

(assert (=> b!764402 m!711223))

(declare-fun m!711229 () Bool)

(assert (=> b!764402 m!711229))

(assert (=> b!764404 m!711223))

(assert (=> b!764404 m!711223))

(declare-fun m!711231 () Bool)

(assert (=> b!764404 m!711231))

(declare-fun m!711233 () Bool)

(assert (=> start!66398 m!711233))

(declare-fun m!711235 () Bool)

(assert (=> start!66398 m!711235))

(declare-fun m!711237 () Bool)

(assert (=> b!764400 m!711237))

(declare-fun m!711239 () Bool)

(assert (=> b!764395 m!711239))

(declare-fun m!711241 () Bool)

(assert (=> b!764395 m!711241))

(declare-fun m!711243 () Bool)

(assert (=> b!764395 m!711243))

(assert (=> b!764395 m!711241))

(declare-fun m!711245 () Bool)

(assert (=> b!764395 m!711245))

(declare-fun m!711247 () Bool)

(assert (=> b!764395 m!711247))

(declare-fun m!711249 () Bool)

(assert (=> b!764398 m!711249))

(assert (=> b!764397 m!711223))

(assert (=> b!764397 m!711223))

(declare-fun m!711251 () Bool)

(assert (=> b!764397 m!711251))

(declare-fun m!711253 () Bool)

(assert (=> b!764403 m!711253))

(declare-fun m!711255 () Bool)

(assert (=> b!764399 m!711255))

(declare-fun m!711257 () Bool)

(assert (=> b!764396 m!711257))

(declare-fun m!711259 () Bool)

(assert (=> b!764405 m!711259))

(check-sat (not b!764397) (not b!764401) (not b!764404) (not b!764399) (not b!764403) (not b!764402) (not b!764396) (not b!764395) (not start!66398) (not b!764398) (not b!764405))
(check-sat)
