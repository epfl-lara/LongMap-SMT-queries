; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66486 () Bool)

(assert start!66486)

(declare-fun b!766383 () Bool)

(declare-fun res!518527 () Bool)

(declare-fun e!426771 () Bool)

(assert (=> b!766383 (=> (not res!518527) (not e!426771))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42265 0))(
  ( (array!42266 (arr!20237 (Array (_ BitVec 32) (_ BitVec 64))) (size!20658 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42265)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!766383 (= res!518527 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20658 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20658 a!3186))))))

(declare-fun b!766384 () Bool)

(declare-fun e!426774 () Bool)

(assert (=> b!766384 (= e!426771 e!426774)))

(declare-fun res!518526 () Bool)

(assert (=> b!766384 (=> (not res!518526) (not e!426774))))

(declare-datatypes ((SeekEntryResult!7837 0))(
  ( (MissingZero!7837 (index!33716 (_ BitVec 32))) (Found!7837 (index!33717 (_ BitVec 32))) (Intermediate!7837 (undefined!8649 Bool) (index!33718 (_ BitVec 32)) (x!64619 (_ BitVec 32))) (Undefined!7837) (MissingVacant!7837 (index!33719 (_ BitVec 32))) )
))
(declare-fun lt!340916 () SeekEntryResult!7837)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42265 (_ BitVec 32)) SeekEntryResult!7837)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766384 (= res!518526 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20237 a!3186) j!159) mask!3328) (select (arr!20237 a!3186) j!159) a!3186 mask!3328) lt!340916))))

(assert (=> b!766384 (= lt!340916 (Intermediate!7837 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766385 () Bool)

(declare-fun e!426766 () Bool)

(declare-fun e!426768 () Bool)

(assert (=> b!766385 (= e!426766 (not e!426768))))

(declare-fun res!518520 () Bool)

(assert (=> b!766385 (=> res!518520 e!426768)))

(declare-fun lt!340919 () SeekEntryResult!7837)

(assert (=> b!766385 (= res!518520 (or (not (is-Intermediate!7837 lt!340919)) (bvsge x!1131 (x!64619 lt!340919))))))

(declare-fun e!426773 () Bool)

(assert (=> b!766385 e!426773))

(declare-fun res!518530 () Bool)

(assert (=> b!766385 (=> (not res!518530) (not e!426773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42265 (_ BitVec 32)) Bool)

(assert (=> b!766385 (= res!518530 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26400 0))(
  ( (Unit!26401) )
))
(declare-fun lt!340918 () Unit!26400)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26400)

(assert (=> b!766385 (= lt!340918 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!766386 () Bool)

(declare-fun res!518525 () Bool)

(assert (=> b!766386 (=> (not res!518525) (not e!426774))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!766386 (= res!518525 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20237 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766387 () Bool)

(declare-fun res!518531 () Bool)

(assert (=> b!766387 (=> (not res!518531) (not e!426771))))

(declare-datatypes ((List!14239 0))(
  ( (Nil!14236) (Cons!14235 (h!15325 (_ BitVec 64)) (t!20554 List!14239)) )
))
(declare-fun arrayNoDuplicates!0 (array!42265 (_ BitVec 32) List!14239) Bool)

(assert (=> b!766387 (= res!518531 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14236))))

(declare-fun e!426767 () Bool)

(declare-fun b!766389 () Bool)

(assert (=> b!766389 (= e!426767 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20237 a!3186) j!159) a!3186 mask!3328) lt!340916))))

(declare-fun b!766390 () Bool)

(declare-fun e!426769 () Bool)

(declare-fun lt!340911 () SeekEntryResult!7837)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42265 (_ BitVec 32)) SeekEntryResult!7837)

(assert (=> b!766390 (= e!426769 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20237 a!3186) j!159) a!3186 mask!3328) lt!340911))))

(declare-fun b!766391 () Bool)

(declare-fun res!518523 () Bool)

(assert (=> b!766391 (=> (not res!518523) (not e!426771))))

(assert (=> b!766391 (= res!518523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766392 () Bool)

(assert (=> b!766392 (= e!426768 true)))

(declare-fun lt!340913 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766392 (= lt!340913 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!766393 () Bool)

(declare-fun res!518519 () Bool)

(declare-fun e!426772 () Bool)

(assert (=> b!766393 (=> (not res!518519) (not e!426772))))

(assert (=> b!766393 (= res!518519 (and (= (size!20658 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20658 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20658 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!766394 () Bool)

(assert (=> b!766394 (= e!426772 e!426771)))

(declare-fun res!518518 () Bool)

(assert (=> b!766394 (=> (not res!518518) (not e!426771))))

(declare-fun lt!340914 () SeekEntryResult!7837)

(assert (=> b!766394 (= res!518518 (or (= lt!340914 (MissingZero!7837 i!1173)) (= lt!340914 (MissingVacant!7837 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42265 (_ BitVec 32)) SeekEntryResult!7837)

(assert (=> b!766394 (= lt!340914 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!766395 () Bool)

(declare-fun res!518524 () Bool)

(assert (=> b!766395 (=> (not res!518524) (not e!426772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766395 (= res!518524 (validKeyInArray!0 k!2102))))

(declare-fun b!766396 () Bool)

(assert (=> b!766396 (= e!426773 e!426769)))

(declare-fun res!518533 () Bool)

(assert (=> b!766396 (=> (not res!518533) (not e!426769))))

(assert (=> b!766396 (= res!518533 (= (seekEntryOrOpen!0 (select (arr!20237 a!3186) j!159) a!3186 mask!3328) lt!340911))))

(assert (=> b!766396 (= lt!340911 (Found!7837 j!159))))

(declare-fun b!766397 () Bool)

(declare-fun res!518532 () Bool)

(assert (=> b!766397 (=> (not res!518532) (not e!426772))))

(declare-fun arrayContainsKey!0 (array!42265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766397 (= res!518532 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!766398 () Bool)

(declare-fun res!518522 () Bool)

(assert (=> b!766398 (=> (not res!518522) (not e!426772))))

(assert (=> b!766398 (= res!518522 (validKeyInArray!0 (select (arr!20237 a!3186) j!159)))))

(declare-fun b!766388 () Bool)

(assert (=> b!766388 (= e!426774 e!426766)))

(declare-fun res!518521 () Bool)

(assert (=> b!766388 (=> (not res!518521) (not e!426766))))

(declare-fun lt!340912 () SeekEntryResult!7837)

(assert (=> b!766388 (= res!518521 (= lt!340912 lt!340919))))

(declare-fun lt!340917 () (_ BitVec 64))

(declare-fun lt!340915 () array!42265)

(assert (=> b!766388 (= lt!340919 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340917 lt!340915 mask!3328))))

(assert (=> b!766388 (= lt!340912 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340917 mask!3328) lt!340917 lt!340915 mask!3328))))

(assert (=> b!766388 (= lt!340917 (select (store (arr!20237 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!766388 (= lt!340915 (array!42266 (store (arr!20237 a!3186) i!1173 k!2102) (size!20658 a!3186)))))

(declare-fun res!518528 () Bool)

(assert (=> start!66486 (=> (not res!518528) (not e!426772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66486 (= res!518528 (validMask!0 mask!3328))))

(assert (=> start!66486 e!426772))

(assert (=> start!66486 true))

(declare-fun array_inv!16033 (array!42265) Bool)

(assert (=> start!66486 (array_inv!16033 a!3186)))

(declare-fun b!766399 () Bool)

(assert (=> b!766399 (= e!426767 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20237 a!3186) j!159) a!3186 mask!3328) (Found!7837 j!159)))))

(declare-fun b!766400 () Bool)

(declare-fun res!518529 () Bool)

(assert (=> b!766400 (=> (not res!518529) (not e!426774))))

(assert (=> b!766400 (= res!518529 e!426767)))

(declare-fun c!84322 () Bool)

(assert (=> b!766400 (= c!84322 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66486 res!518528) b!766393))

(assert (= (and b!766393 res!518519) b!766398))

(assert (= (and b!766398 res!518522) b!766395))

(assert (= (and b!766395 res!518524) b!766397))

(assert (= (and b!766397 res!518532) b!766394))

(assert (= (and b!766394 res!518518) b!766391))

(assert (= (and b!766391 res!518523) b!766387))

(assert (= (and b!766387 res!518531) b!766383))

(assert (= (and b!766383 res!518527) b!766384))

(assert (= (and b!766384 res!518526) b!766386))

(assert (= (and b!766386 res!518525) b!766400))

(assert (= (and b!766400 c!84322) b!766389))

(assert (= (and b!766400 (not c!84322)) b!766399))

(assert (= (and b!766400 res!518529) b!766388))

(assert (= (and b!766388 res!518521) b!766385))

(assert (= (and b!766385 res!518530) b!766396))

(assert (= (and b!766396 res!518533) b!766390))

(assert (= (and b!766385 (not res!518520)) b!766392))

(declare-fun m!712377 () Bool)

(assert (=> b!766391 m!712377))

(declare-fun m!712379 () Bool)

(assert (=> b!766384 m!712379))

(assert (=> b!766384 m!712379))

(declare-fun m!712381 () Bool)

(assert (=> b!766384 m!712381))

(assert (=> b!766384 m!712381))

(assert (=> b!766384 m!712379))

(declare-fun m!712383 () Bool)

(assert (=> b!766384 m!712383))

(declare-fun m!712385 () Bool)

(assert (=> b!766388 m!712385))

(assert (=> b!766388 m!712385))

(declare-fun m!712387 () Bool)

(assert (=> b!766388 m!712387))

(declare-fun m!712389 () Bool)

(assert (=> b!766388 m!712389))

(declare-fun m!712391 () Bool)

(assert (=> b!766388 m!712391))

(declare-fun m!712393 () Bool)

(assert (=> b!766388 m!712393))

(assert (=> b!766390 m!712379))

(assert (=> b!766390 m!712379))

(declare-fun m!712395 () Bool)

(assert (=> b!766390 m!712395))

(declare-fun m!712397 () Bool)

(assert (=> b!766387 m!712397))

(declare-fun m!712399 () Bool)

(assert (=> b!766395 m!712399))

(declare-fun m!712401 () Bool)

(assert (=> b!766385 m!712401))

(declare-fun m!712403 () Bool)

(assert (=> b!766385 m!712403))

(declare-fun m!712405 () Bool)

(assert (=> start!66486 m!712405))

(declare-fun m!712407 () Bool)

(assert (=> start!66486 m!712407))

(assert (=> b!766396 m!712379))

(assert (=> b!766396 m!712379))

(declare-fun m!712409 () Bool)

(assert (=> b!766396 m!712409))

(declare-fun m!712411 () Bool)

(assert (=> b!766392 m!712411))

(declare-fun m!712413 () Bool)

(assert (=> b!766394 m!712413))

(assert (=> b!766389 m!712379))

(assert (=> b!766389 m!712379))

(declare-fun m!712415 () Bool)

(assert (=> b!766389 m!712415))

(assert (=> b!766398 m!712379))

(assert (=> b!766398 m!712379))

(declare-fun m!712417 () Bool)

(assert (=> b!766398 m!712417))

(declare-fun m!712419 () Bool)

(assert (=> b!766397 m!712419))

(assert (=> b!766399 m!712379))

(assert (=> b!766399 m!712379))

(declare-fun m!712421 () Bool)

(assert (=> b!766399 m!712421))

(declare-fun m!712423 () Bool)

(assert (=> b!766386 m!712423))

(push 1)

