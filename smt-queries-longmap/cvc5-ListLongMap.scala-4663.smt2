; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64750 () Bool)

(assert start!64750)

(declare-fun b!731037 () Bool)

(declare-fun e!409073 () Bool)

(declare-fun e!409069 () Bool)

(assert (=> b!731037 (= e!409073 e!409069)))

(declare-fun res!491273 () Bool)

(assert (=> b!731037 (=> res!491273 e!409069)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!731037 (= res!491273 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!323957 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731037 (= lt!323957 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!731038 () Bool)

(declare-fun e!409072 () Bool)

(assert (=> b!731038 (= e!409072 (not e!409073))))

(declare-fun res!491269 () Bool)

(assert (=> b!731038 (=> res!491269 e!409073)))

(declare-datatypes ((SeekEntryResult!7319 0))(
  ( (MissingZero!7319 (index!31644 (_ BitVec 32))) (Found!7319 (index!31645 (_ BitVec 32))) (Intermediate!7319 (undefined!8131 Bool) (index!31646 (_ BitVec 32)) (x!62621 (_ BitVec 32))) (Undefined!7319) (MissingVacant!7319 (index!31647 (_ BitVec 32))) )
))
(declare-fun lt!323963 () SeekEntryResult!7319)

(assert (=> b!731038 (= res!491269 (or (not (is-Intermediate!7319 lt!323963)) (bvsge x!1131 (x!62621 lt!323963))))))

(declare-fun e!409070 () Bool)

(assert (=> b!731038 e!409070))

(declare-fun res!491276 () Bool)

(assert (=> b!731038 (=> (not res!491276) (not e!409070))))

(declare-datatypes ((array!41199 0))(
  ( (array!41200 (arr!19719 (Array (_ BitVec 32) (_ BitVec 64))) (size!20140 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41199)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41199 (_ BitVec 32)) Bool)

(assert (=> b!731038 (= res!491276 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24956 0))(
  ( (Unit!24957) )
))
(declare-fun lt!323964 () Unit!24956)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41199 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24956)

(assert (=> b!731038 (= lt!323964 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!409067 () Bool)

(declare-fun b!731039 () Bool)

(declare-fun lt!323962 () SeekEntryResult!7319)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41199 (_ BitVec 32)) SeekEntryResult!7319)

(assert (=> b!731039 (= e!409067 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19719 a!3186) j!159) a!3186 mask!3328) lt!323962))))

(declare-fun b!731040 () Bool)

(declare-fun e!409075 () Bool)

(assert (=> b!731040 (= e!409075 e!409072)))

(declare-fun res!491274 () Bool)

(assert (=> b!731040 (=> (not res!491274) (not e!409072))))

(declare-fun lt!323960 () SeekEntryResult!7319)

(assert (=> b!731040 (= res!491274 (= lt!323960 lt!323963))))

(declare-fun lt!323966 () array!41199)

(declare-fun lt!323959 () (_ BitVec 64))

(assert (=> b!731040 (= lt!323963 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323959 lt!323966 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731040 (= lt!323960 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323959 mask!3328) lt!323959 lt!323966 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!731040 (= lt!323959 (select (store (arr!19719 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!731040 (= lt!323966 (array!41200 (store (arr!19719 a!3186) i!1173 k!2102) (size!20140 a!3186)))))

(declare-fun b!731041 () Bool)

(declare-fun res!491280 () Bool)

(declare-fun e!409076 () Bool)

(assert (=> b!731041 (=> (not res!491280) (not e!409076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!731041 (= res!491280 (validKeyInArray!0 (select (arr!19719 a!3186) j!159)))))

(declare-fun b!731042 () Bool)

(declare-fun res!491277 () Bool)

(declare-fun e!409071 () Bool)

(assert (=> b!731042 (=> (not res!491277) (not e!409071))))

(assert (=> b!731042 (= res!491277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!731043 () Bool)

(declare-fun res!491275 () Bool)

(assert (=> b!731043 (=> (not res!491275) (not e!409076))))

(declare-fun arrayContainsKey!0 (array!41199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!731043 (= res!491275 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!731044 () Bool)

(declare-fun res!491270 () Bool)

(assert (=> b!731044 (=> (not res!491270) (not e!409071))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!731044 (= res!491270 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20140 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20140 a!3186))))))

(declare-fun b!731045 () Bool)

(declare-fun res!491267 () Bool)

(assert (=> b!731045 (=> (not res!491267) (not e!409076))))

(assert (=> b!731045 (= res!491267 (validKeyInArray!0 k!2102))))

(declare-fun b!731046 () Bool)

(declare-fun e!409068 () Bool)

(assert (=> b!731046 (= e!409070 e!409068)))

(declare-fun res!491281 () Bool)

(assert (=> b!731046 (=> (not res!491281) (not e!409068))))

(declare-fun lt!323961 () SeekEntryResult!7319)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41199 (_ BitVec 32)) SeekEntryResult!7319)

(assert (=> b!731046 (= res!491281 (= (seekEntryOrOpen!0 (select (arr!19719 a!3186) j!159) a!3186 mask!3328) lt!323961))))

(assert (=> b!731046 (= lt!323961 (Found!7319 j!159))))

(declare-fun res!491278 () Bool)

(assert (=> start!64750 (=> (not res!491278) (not e!409076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64750 (= res!491278 (validMask!0 mask!3328))))

(assert (=> start!64750 e!409076))

(assert (=> start!64750 true))

(declare-fun array_inv!15515 (array!41199) Bool)

(assert (=> start!64750 (array_inv!15515 a!3186)))

(declare-fun b!731047 () Bool)

(assert (=> b!731047 (= e!409076 e!409071)))

(declare-fun res!491268 () Bool)

(assert (=> b!731047 (=> (not res!491268) (not e!409071))))

(declare-fun lt!323958 () SeekEntryResult!7319)

(assert (=> b!731047 (= res!491268 (or (= lt!323958 (MissingZero!7319 i!1173)) (= lt!323958 (MissingVacant!7319 i!1173))))))

(assert (=> b!731047 (= lt!323958 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!731048 () Bool)

(declare-fun res!491282 () Bool)

(assert (=> b!731048 (=> (not res!491282) (not e!409075))))

(assert (=> b!731048 (= res!491282 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19719 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731049 () Bool)

(assert (=> b!731049 (= e!409071 e!409075)))

(declare-fun res!491279 () Bool)

(assert (=> b!731049 (=> (not res!491279) (not e!409075))))

(assert (=> b!731049 (= res!491279 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19719 a!3186) j!159) mask!3328) (select (arr!19719 a!3186) j!159) a!3186 mask!3328) lt!323962))))

(assert (=> b!731049 (= lt!323962 (Intermediate!7319 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!731050 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41199 (_ BitVec 32)) SeekEntryResult!7319)

(assert (=> b!731050 (= e!409068 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19719 a!3186) j!159) a!3186 mask!3328) lt!323961))))

(declare-fun b!731051 () Bool)

(declare-fun res!491266 () Bool)

(assert (=> b!731051 (=> (not res!491266) (not e!409075))))

(assert (=> b!731051 (= res!491266 e!409067)))

(declare-fun c!80260 () Bool)

(assert (=> b!731051 (= c!80260 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!731052 () Bool)

(declare-fun res!491271 () Bool)

(assert (=> b!731052 (=> (not res!491271) (not e!409076))))

(assert (=> b!731052 (= res!491271 (and (= (size!20140 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20140 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20140 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!731053 () Bool)

(assert (=> b!731053 (= e!409069 true)))

(declare-fun lt!323965 () SeekEntryResult!7319)

(assert (=> b!731053 (= lt!323965 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19719 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731054 () Bool)

(declare-fun res!491272 () Bool)

(assert (=> b!731054 (=> (not res!491272) (not e!409071))))

(declare-datatypes ((List!13721 0))(
  ( (Nil!13718) (Cons!13717 (h!14777 (_ BitVec 64)) (t!20036 List!13721)) )
))
(declare-fun arrayNoDuplicates!0 (array!41199 (_ BitVec 32) List!13721) Bool)

(assert (=> b!731054 (= res!491272 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13718))))

(declare-fun b!731055 () Bool)

(assert (=> b!731055 (= e!409067 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19719 a!3186) j!159) a!3186 mask!3328) (Found!7319 j!159)))))

(assert (= (and start!64750 res!491278) b!731052))

(assert (= (and b!731052 res!491271) b!731041))

(assert (= (and b!731041 res!491280) b!731045))

(assert (= (and b!731045 res!491267) b!731043))

(assert (= (and b!731043 res!491275) b!731047))

(assert (= (and b!731047 res!491268) b!731042))

(assert (= (and b!731042 res!491277) b!731054))

(assert (= (and b!731054 res!491272) b!731044))

(assert (= (and b!731044 res!491270) b!731049))

(assert (= (and b!731049 res!491279) b!731048))

(assert (= (and b!731048 res!491282) b!731051))

(assert (= (and b!731051 c!80260) b!731039))

(assert (= (and b!731051 (not c!80260)) b!731055))

(assert (= (and b!731051 res!491266) b!731040))

(assert (= (and b!731040 res!491274) b!731038))

(assert (= (and b!731038 res!491276) b!731046))

(assert (= (and b!731046 res!491281) b!731050))

(assert (= (and b!731038 (not res!491269)) b!731037))

(assert (= (and b!731037 (not res!491273)) b!731053))

(declare-fun m!684475 () Bool)

(assert (=> b!731048 m!684475))

(declare-fun m!684477 () Bool)

(assert (=> b!731045 m!684477))

(declare-fun m!684479 () Bool)

(assert (=> b!731042 m!684479))

(declare-fun m!684481 () Bool)

(assert (=> b!731055 m!684481))

(assert (=> b!731055 m!684481))

(declare-fun m!684483 () Bool)

(assert (=> b!731055 m!684483))

(declare-fun m!684485 () Bool)

(assert (=> start!64750 m!684485))

(declare-fun m!684487 () Bool)

(assert (=> start!64750 m!684487))

(declare-fun m!684489 () Bool)

(assert (=> b!731043 m!684489))

(declare-fun m!684491 () Bool)

(assert (=> b!731038 m!684491))

(declare-fun m!684493 () Bool)

(assert (=> b!731038 m!684493))

(assert (=> b!731049 m!684481))

(assert (=> b!731049 m!684481))

(declare-fun m!684495 () Bool)

(assert (=> b!731049 m!684495))

(assert (=> b!731049 m!684495))

(assert (=> b!731049 m!684481))

(declare-fun m!684497 () Bool)

(assert (=> b!731049 m!684497))

(declare-fun m!684499 () Bool)

(assert (=> b!731037 m!684499))

(assert (=> b!731053 m!684481))

(assert (=> b!731053 m!684481))

(assert (=> b!731053 m!684483))

(assert (=> b!731041 m!684481))

(assert (=> b!731041 m!684481))

(declare-fun m!684501 () Bool)

(assert (=> b!731041 m!684501))

(assert (=> b!731039 m!684481))

(assert (=> b!731039 m!684481))

(declare-fun m!684503 () Bool)

(assert (=> b!731039 m!684503))

(assert (=> b!731046 m!684481))

(assert (=> b!731046 m!684481))

(declare-fun m!684505 () Bool)

(assert (=> b!731046 m!684505))

(declare-fun m!684507 () Bool)

(assert (=> b!731040 m!684507))

(declare-fun m!684509 () Bool)

(assert (=> b!731040 m!684509))

(declare-fun m!684511 () Bool)

(assert (=> b!731040 m!684511))

(declare-fun m!684513 () Bool)

(assert (=> b!731040 m!684513))

(assert (=> b!731040 m!684507))

(declare-fun m!684515 () Bool)

(assert (=> b!731040 m!684515))

(declare-fun m!684517 () Bool)

(assert (=> b!731047 m!684517))

(declare-fun m!684519 () Bool)

(assert (=> b!731054 m!684519))

(assert (=> b!731050 m!684481))

(assert (=> b!731050 m!684481))

(declare-fun m!684521 () Bool)

(assert (=> b!731050 m!684521))

(push 1)

