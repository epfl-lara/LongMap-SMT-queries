; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64074 () Bool)

(assert start!64074)

(declare-fun b!719108 () Bool)

(declare-fun res!481360 () Bool)

(declare-fun e!403714 () Bool)

(assert (=> b!719108 (=> (not res!481360) (not e!403714))))

(declare-datatypes ((array!40702 0))(
  ( (array!40703 (arr!19474 (Array (_ BitVec 32) (_ BitVec 64))) (size!19894 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40702)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!719108 (= res!481360 (and (= (size!19894 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19894 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19894 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719109 () Bool)

(declare-fun res!481353 () Bool)

(declare-fun e!403716 () Bool)

(assert (=> b!719109 (=> (not res!481353) (not e!403716))))

(declare-datatypes ((List!13383 0))(
  ( (Nil!13380) (Cons!13379 (h!14430 (_ BitVec 64)) (t!19690 List!13383)) )
))
(declare-fun arrayNoDuplicates!0 (array!40702 (_ BitVec 32) List!13383) Bool)

(assert (=> b!719109 (= res!481353 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13380))))

(declare-fun b!719110 () Bool)

(assert (=> b!719110 (= e!403716 false)))

(declare-fun lt!319607 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719110 (= lt!319607 (toIndex!0 (select (arr!19474 a!3186) j!159) mask!3328))))

(declare-fun b!719111 () Bool)

(assert (=> b!719111 (= e!403714 e!403716)))

(declare-fun res!481359 () Bool)

(assert (=> b!719111 (=> (not res!481359) (not e!403716))))

(declare-datatypes ((SeekEntryResult!7030 0))(
  ( (MissingZero!7030 (index!30488 (_ BitVec 32))) (Found!7030 (index!30489 (_ BitVec 32))) (Intermediate!7030 (undefined!7842 Bool) (index!30490 (_ BitVec 32)) (x!61656 (_ BitVec 32))) (Undefined!7030) (MissingVacant!7030 (index!30491 (_ BitVec 32))) )
))
(declare-fun lt!319608 () SeekEntryResult!7030)

(assert (=> b!719111 (= res!481359 (or (= lt!319608 (MissingZero!7030 i!1173)) (= lt!319608 (MissingVacant!7030 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40702 (_ BitVec 32)) SeekEntryResult!7030)

(assert (=> b!719111 (= lt!319608 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719112 () Bool)

(declare-fun res!481356 () Bool)

(assert (=> b!719112 (=> (not res!481356) (not e!403714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719112 (= res!481356 (validKeyInArray!0 k0!2102))))

(declare-fun b!719114 () Bool)

(declare-fun res!481357 () Bool)

(assert (=> b!719114 (=> (not res!481357) (not e!403714))))

(declare-fun arrayContainsKey!0 (array!40702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719114 (= res!481357 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719115 () Bool)

(declare-fun res!481355 () Bool)

(assert (=> b!719115 (=> (not res!481355) (not e!403714))))

(assert (=> b!719115 (= res!481355 (validKeyInArray!0 (select (arr!19474 a!3186) j!159)))))

(declare-fun b!719116 () Bool)

(declare-fun res!481358 () Bool)

(assert (=> b!719116 (=> (not res!481358) (not e!403716))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719116 (= res!481358 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19894 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19894 a!3186))))))

(declare-fun res!481354 () Bool)

(assert (=> start!64074 (=> (not res!481354) (not e!403714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64074 (= res!481354 (validMask!0 mask!3328))))

(assert (=> start!64074 e!403714))

(assert (=> start!64074 true))

(declare-fun array_inv!15333 (array!40702) Bool)

(assert (=> start!64074 (array_inv!15333 a!3186)))

(declare-fun b!719113 () Bool)

(declare-fun res!481352 () Bool)

(assert (=> b!719113 (=> (not res!481352) (not e!403716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40702 (_ BitVec 32)) Bool)

(assert (=> b!719113 (= res!481352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64074 res!481354) b!719108))

(assert (= (and b!719108 res!481360) b!719115))

(assert (= (and b!719115 res!481355) b!719112))

(assert (= (and b!719112 res!481356) b!719114))

(assert (= (and b!719114 res!481357) b!719111))

(assert (= (and b!719111 res!481359) b!719113))

(assert (= (and b!719113 res!481352) b!719109))

(assert (= (and b!719109 res!481353) b!719116))

(assert (= (and b!719116 res!481358) b!719110))

(declare-fun m!675165 () Bool)

(assert (=> b!719112 m!675165))

(declare-fun m!675167 () Bool)

(assert (=> b!719111 m!675167))

(declare-fun m!675169 () Bool)

(assert (=> b!719110 m!675169))

(assert (=> b!719110 m!675169))

(declare-fun m!675171 () Bool)

(assert (=> b!719110 m!675171))

(declare-fun m!675173 () Bool)

(assert (=> start!64074 m!675173))

(declare-fun m!675175 () Bool)

(assert (=> start!64074 m!675175))

(assert (=> b!719115 m!675169))

(assert (=> b!719115 m!675169))

(declare-fun m!675177 () Bool)

(assert (=> b!719115 m!675177))

(declare-fun m!675179 () Bool)

(assert (=> b!719109 m!675179))

(declare-fun m!675181 () Bool)

(assert (=> b!719113 m!675181))

(declare-fun m!675183 () Bool)

(assert (=> b!719114 m!675183))

(check-sat (not start!64074) (not b!719109) (not b!719110) (not b!719115) (not b!719114) (not b!719113) (not b!719112) (not b!719111))
(check-sat)
