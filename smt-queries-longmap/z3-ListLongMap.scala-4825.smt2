; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66292 () Bool)

(assert start!66292)

(declare-datatypes ((array!42197 0))(
  ( (array!42198 (arr!20206 (Array (_ BitVec 32) (_ BitVec 64))) (size!20627 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42197)

(declare-datatypes ((SeekEntryResult!7806 0))(
  ( (MissingZero!7806 (index!33592 (_ BitVec 32))) (Found!7806 (index!33593 (_ BitVec 32))) (Intermediate!7806 (undefined!8618 Bool) (index!33594 (_ BitVec 32)) (x!64490 (_ BitVec 32))) (Undefined!7806) (MissingVacant!7806 (index!33595 (_ BitVec 32))) )
))
(declare-fun lt!340023 () SeekEntryResult!7806)

(declare-fun b!764058 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!425603 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42197 (_ BitVec 32)) SeekEntryResult!7806)

(assert (=> b!764058 (= e!425603 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20206 a!3186) j!159) a!3186 mask!3328) lt!340023))))

(declare-fun res!516949 () Bool)

(declare-fun e!425601 () Bool)

(assert (=> start!66292 (=> (not res!516949) (not e!425601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66292 (= res!516949 (validMask!0 mask!3328))))

(assert (=> start!66292 e!425601))

(assert (=> start!66292 true))

(declare-fun array_inv!16002 (array!42197) Bool)

(assert (=> start!66292 (array_inv!16002 a!3186)))

(declare-fun b!764059 () Bool)

(declare-fun res!516943 () Bool)

(declare-fun e!425600 () Bool)

(assert (=> b!764059 (=> (not res!516943) (not e!425600))))

(declare-datatypes ((List!14208 0))(
  ( (Nil!14205) (Cons!14204 (h!15288 (_ BitVec 64)) (t!20523 List!14208)) )
))
(declare-fun arrayNoDuplicates!0 (array!42197 (_ BitVec 32) List!14208) Bool)

(assert (=> b!764059 (= res!516943 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14205))))

(declare-fun b!764060 () Bool)

(declare-fun e!425604 () Bool)

(assert (=> b!764060 (= e!425600 e!425604)))

(declare-fun res!516952 () Bool)

(assert (=> b!764060 (=> (not res!516952) (not e!425604))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764060 (= res!516952 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20206 a!3186) j!159) mask!3328) (select (arr!20206 a!3186) j!159) a!3186 mask!3328) lt!340023))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764060 (= lt!340023 (Intermediate!7806 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764061 () Bool)

(declare-fun e!425599 () Bool)

(assert (=> b!764061 (= e!425604 e!425599)))

(declare-fun res!516945 () Bool)

(assert (=> b!764061 (=> (not res!516945) (not e!425599))))

(declare-fun lt!340024 () (_ BitVec 64))

(declare-fun lt!340022 () array!42197)

(assert (=> b!764061 (= res!516945 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340024 mask!3328) lt!340024 lt!340022 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340024 lt!340022 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!764061 (= lt!340024 (select (store (arr!20206 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!764061 (= lt!340022 (array!42198 (store (arr!20206 a!3186) i!1173 k0!2102) (size!20627 a!3186)))))

(declare-fun b!764062 () Bool)

(declare-fun res!516953 () Bool)

(assert (=> b!764062 (=> (not res!516953) (not e!425601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764062 (= res!516953 (validKeyInArray!0 (select (arr!20206 a!3186) j!159)))))

(declare-fun b!764063 () Bool)

(declare-fun res!516951 () Bool)

(assert (=> b!764063 (=> (not res!516951) (not e!425600))))

(assert (=> b!764063 (= res!516951 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20627 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20627 a!3186))))))

(declare-fun b!764064 () Bool)

(declare-fun res!516955 () Bool)

(assert (=> b!764064 (=> (not res!516955) (not e!425601))))

(assert (=> b!764064 (= res!516955 (validKeyInArray!0 k0!2102))))

(declare-fun b!764065 () Bool)

(declare-fun res!516950 () Bool)

(assert (=> b!764065 (=> (not res!516950) (not e!425600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42197 (_ BitVec 32)) Bool)

(assert (=> b!764065 (= res!516950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764066 () Bool)

(declare-fun res!516944 () Bool)

(assert (=> b!764066 (=> (not res!516944) (not e!425604))))

(assert (=> b!764066 (= res!516944 e!425603)))

(declare-fun c!83944 () Bool)

(assert (=> b!764066 (= c!83944 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764067 () Bool)

(declare-fun res!516947 () Bool)

(assert (=> b!764067 (=> (not res!516947) (not e!425604))))

(assert (=> b!764067 (= res!516947 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20206 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764068 () Bool)

(assert (=> b!764068 (= e!425601 e!425600)))

(declare-fun res!516948 () Bool)

(assert (=> b!764068 (=> (not res!516948) (not e!425600))))

(declare-fun lt!340025 () SeekEntryResult!7806)

(assert (=> b!764068 (= res!516948 (or (= lt!340025 (MissingZero!7806 i!1173)) (= lt!340025 (MissingVacant!7806 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42197 (_ BitVec 32)) SeekEntryResult!7806)

(assert (=> b!764068 (= lt!340025 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!764069 () Bool)

(assert (=> b!764069 (= e!425599 (and (bvsle #b00000000000000000000000000000000 (size!20627 a!3186)) (bvsgt j!159 (size!20627 a!3186))))))

(declare-fun b!764070 () Bool)

(declare-fun res!516954 () Bool)

(assert (=> b!764070 (=> (not res!516954) (not e!425601))))

(declare-fun arrayContainsKey!0 (array!42197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764070 (= res!516954 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764071 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42197 (_ BitVec 32)) SeekEntryResult!7806)

(assert (=> b!764071 (= e!425603 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20206 a!3186) j!159) a!3186 mask!3328) (Found!7806 j!159)))))

(declare-fun b!764072 () Bool)

(declare-fun res!516946 () Bool)

(assert (=> b!764072 (=> (not res!516946) (not e!425601))))

(assert (=> b!764072 (= res!516946 (and (= (size!20627 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20627 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20627 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!66292 res!516949) b!764072))

(assert (= (and b!764072 res!516946) b!764062))

(assert (= (and b!764062 res!516953) b!764064))

(assert (= (and b!764064 res!516955) b!764070))

(assert (= (and b!764070 res!516954) b!764068))

(assert (= (and b!764068 res!516948) b!764065))

(assert (= (and b!764065 res!516950) b!764059))

(assert (= (and b!764059 res!516943) b!764063))

(assert (= (and b!764063 res!516951) b!764060))

(assert (= (and b!764060 res!516952) b!764067))

(assert (= (and b!764067 res!516947) b!764066))

(assert (= (and b!764066 c!83944) b!764058))

(assert (= (and b!764066 (not c!83944)) b!764071))

(assert (= (and b!764066 res!516944) b!764061))

(assert (= (and b!764061 res!516945) b!764069))

(declare-fun m!710465 () Bool)

(assert (=> b!764071 m!710465))

(assert (=> b!764071 m!710465))

(declare-fun m!710467 () Bool)

(assert (=> b!764071 m!710467))

(declare-fun m!710469 () Bool)

(assert (=> b!764067 m!710469))

(declare-fun m!710471 () Bool)

(assert (=> b!764059 m!710471))

(declare-fun m!710473 () Bool)

(assert (=> b!764065 m!710473))

(assert (=> b!764062 m!710465))

(assert (=> b!764062 m!710465))

(declare-fun m!710475 () Bool)

(assert (=> b!764062 m!710475))

(assert (=> b!764060 m!710465))

(assert (=> b!764060 m!710465))

(declare-fun m!710477 () Bool)

(assert (=> b!764060 m!710477))

(assert (=> b!764060 m!710477))

(assert (=> b!764060 m!710465))

(declare-fun m!710479 () Bool)

(assert (=> b!764060 m!710479))

(declare-fun m!710481 () Bool)

(assert (=> b!764061 m!710481))

(declare-fun m!710483 () Bool)

(assert (=> b!764061 m!710483))

(assert (=> b!764061 m!710481))

(declare-fun m!710485 () Bool)

(assert (=> b!764061 m!710485))

(declare-fun m!710487 () Bool)

(assert (=> b!764061 m!710487))

(declare-fun m!710489 () Bool)

(assert (=> b!764061 m!710489))

(declare-fun m!710491 () Bool)

(assert (=> b!764064 m!710491))

(declare-fun m!710493 () Bool)

(assert (=> b!764068 m!710493))

(declare-fun m!710495 () Bool)

(assert (=> start!66292 m!710495))

(declare-fun m!710497 () Bool)

(assert (=> start!66292 m!710497))

(assert (=> b!764058 m!710465))

(assert (=> b!764058 m!710465))

(declare-fun m!710499 () Bool)

(assert (=> b!764058 m!710499))

(declare-fun m!710501 () Bool)

(assert (=> b!764070 m!710501))

(check-sat (not b!764071) (not b!764061) (not b!764064) (not b!764060) (not b!764070) (not b!764058) (not b!764068) (not start!66292) (not b!764059) (not b!764062) (not b!764065))
(check-sat)
