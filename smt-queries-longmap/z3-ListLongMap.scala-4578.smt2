; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63936 () Bool)

(assert start!63936)

(declare-fun res!480729 () Bool)

(declare-fun e!403254 () Bool)

(assert (=> start!63936 (=> (not res!480729) (not e!403254))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63936 (= res!480729 (validMask!0 mask!3328))))

(assert (=> start!63936 e!403254))

(assert (=> start!63936 true))

(declare-datatypes ((array!40676 0))(
  ( (array!40677 (arr!19465 (Array (_ BitVec 32) (_ BitVec 64))) (size!19886 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40676)

(declare-fun array_inv!15261 (array!40676) Bool)

(assert (=> start!63936 (array_inv!15261 a!3186)))

(declare-fun b!718249 () Bool)

(declare-fun res!480731 () Bool)

(declare-fun e!403255 () Bool)

(assert (=> b!718249 (=> (not res!480731) (not e!403255))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718249 (= res!480731 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19886 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19886 a!3186))))))

(declare-fun b!718250 () Bool)

(assert (=> b!718250 (= e!403255 false)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!319321 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718250 (= lt!319321 (toIndex!0 (select (arr!19465 a!3186) j!159) mask!3328))))

(declare-fun b!718251 () Bool)

(declare-fun res!480732 () Bool)

(assert (=> b!718251 (=> (not res!480732) (not e!403254))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718251 (= res!480732 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718252 () Bool)

(declare-fun res!480735 () Bool)

(assert (=> b!718252 (=> (not res!480735) (not e!403254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718252 (= res!480735 (validKeyInArray!0 (select (arr!19465 a!3186) j!159)))))

(declare-fun b!718253 () Bool)

(declare-fun res!480736 () Bool)

(assert (=> b!718253 (=> (not res!480736) (not e!403254))))

(assert (=> b!718253 (= res!480736 (validKeyInArray!0 k0!2102))))

(declare-fun b!718254 () Bool)

(declare-fun res!480737 () Bool)

(assert (=> b!718254 (=> (not res!480737) (not e!403255))))

(declare-datatypes ((List!13467 0))(
  ( (Nil!13464) (Cons!13463 (h!14508 (_ BitVec 64)) (t!19782 List!13467)) )
))
(declare-fun arrayNoDuplicates!0 (array!40676 (_ BitVec 32) List!13467) Bool)

(assert (=> b!718254 (= res!480737 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13464))))

(declare-fun b!718255 () Bool)

(declare-fun res!480733 () Bool)

(assert (=> b!718255 (=> (not res!480733) (not e!403254))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718255 (= res!480733 (and (= (size!19886 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19886 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19886 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718256 () Bool)

(declare-fun res!480730 () Bool)

(assert (=> b!718256 (=> (not res!480730) (not e!403255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40676 (_ BitVec 32)) Bool)

(assert (=> b!718256 (= res!480730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718257 () Bool)

(assert (=> b!718257 (= e!403254 e!403255)))

(declare-fun res!480734 () Bool)

(assert (=> b!718257 (=> (not res!480734) (not e!403255))))

(declare-datatypes ((SeekEntryResult!7065 0))(
  ( (MissingZero!7065 (index!30628 (_ BitVec 32))) (Found!7065 (index!30629 (_ BitVec 32))) (Intermediate!7065 (undefined!7877 Bool) (index!30630 (_ BitVec 32)) (x!61645 (_ BitVec 32))) (Undefined!7065) (MissingVacant!7065 (index!30631 (_ BitVec 32))) )
))
(declare-fun lt!319322 () SeekEntryResult!7065)

(assert (=> b!718257 (= res!480734 (or (= lt!319322 (MissingZero!7065 i!1173)) (= lt!319322 (MissingVacant!7065 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40676 (_ BitVec 32)) SeekEntryResult!7065)

(assert (=> b!718257 (= lt!319322 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!63936 res!480729) b!718255))

(assert (= (and b!718255 res!480733) b!718252))

(assert (= (and b!718252 res!480735) b!718253))

(assert (= (and b!718253 res!480736) b!718251))

(assert (= (and b!718251 res!480732) b!718257))

(assert (= (and b!718257 res!480734) b!718256))

(assert (= (and b!718256 res!480730) b!718254))

(assert (= (and b!718254 res!480737) b!718249))

(assert (= (and b!718249 res!480731) b!718250))

(declare-fun m!673941 () Bool)

(assert (=> b!718251 m!673941))

(declare-fun m!673943 () Bool)

(assert (=> b!718254 m!673943))

(declare-fun m!673945 () Bool)

(assert (=> b!718257 m!673945))

(declare-fun m!673947 () Bool)

(assert (=> b!718253 m!673947))

(declare-fun m!673949 () Bool)

(assert (=> start!63936 m!673949))

(declare-fun m!673951 () Bool)

(assert (=> start!63936 m!673951))

(declare-fun m!673953 () Bool)

(assert (=> b!718252 m!673953))

(assert (=> b!718252 m!673953))

(declare-fun m!673955 () Bool)

(assert (=> b!718252 m!673955))

(declare-fun m!673957 () Bool)

(assert (=> b!718256 m!673957))

(assert (=> b!718250 m!673953))

(assert (=> b!718250 m!673953))

(declare-fun m!673959 () Bool)

(assert (=> b!718250 m!673959))

(check-sat (not b!718252) (not b!718256) (not b!718250) (not b!718257) (not start!63936) (not b!718254) (not b!718251) (not b!718253))
(check-sat)
