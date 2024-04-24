; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66500 () Bool)

(assert start!66500)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42220 0))(
  ( (array!42221 (arr!20212 (Array (_ BitVec 32) (_ BitVec 64))) (size!20632 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42220)

(declare-fun e!426453 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!765590 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7768 0))(
  ( (MissingZero!7768 (index!33440 (_ BitVec 32))) (Found!7768 (index!33441 (_ BitVec 32))) (Intermediate!7768 (undefined!8580 Bool) (index!33442 (_ BitVec 32)) (x!64504 (_ BitVec 32))) (Undefined!7768) (MissingVacant!7768 (index!33443 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42220 (_ BitVec 32)) SeekEntryResult!7768)

(assert (=> b!765590 (= e!426453 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20212 a!3186) j!159) a!3186 mask!3328) (Found!7768 j!159)))))

(declare-fun b!765591 () Bool)

(declare-fun res!517763 () Bool)

(declare-fun e!426450 () Bool)

(assert (=> b!765591 (=> (not res!517763) (not e!426450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765591 (= res!517763 (validKeyInArray!0 (select (arr!20212 a!3186) j!159)))))

(declare-fun b!765592 () Bool)

(declare-fun res!517773 () Bool)

(declare-fun e!426452 () Bool)

(assert (=> b!765592 (=> (not res!517773) (not e!426452))))

(assert (=> b!765592 (= res!517773 e!426453)))

(declare-fun c!84305 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!765592 (= c!84305 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!765593 () Bool)

(declare-fun res!517764 () Bool)

(declare-fun e!426455 () Bool)

(assert (=> b!765593 (=> (not res!517764) (not e!426455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42220 (_ BitVec 32)) Bool)

(assert (=> b!765593 (= res!517764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!765594 () Bool)

(declare-fun e!426454 () Bool)

(assert (=> b!765594 (= e!426454 (not true))))

(declare-fun e!426451 () Bool)

(assert (=> b!765594 e!426451))

(declare-fun res!517774 () Bool)

(assert (=> b!765594 (=> (not res!517774) (not e!426451))))

(assert (=> b!765594 (= res!517774 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26341 0))(
  ( (Unit!26342) )
))
(declare-fun lt!340624 () Unit!26341)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26341)

(assert (=> b!765594 (= lt!340624 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!765595 () Bool)

(declare-fun res!517772 () Bool)

(assert (=> b!765595 (=> (not res!517772) (not e!426450))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!765595 (= res!517772 (validKeyInArray!0 k0!2102))))

(declare-fun b!765596 () Bool)

(declare-fun res!517769 () Bool)

(assert (=> b!765596 (=> (not res!517769) (not e!426452))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!765596 (= res!517769 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20212 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765598 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42220 (_ BitVec 32)) SeekEntryResult!7768)

(assert (=> b!765598 (= e!426451 (= (seekEntryOrOpen!0 (select (arr!20212 a!3186) j!159) a!3186 mask!3328) (Found!7768 j!159)))))

(declare-fun b!765599 () Bool)

(declare-fun res!517770 () Bool)

(assert (=> b!765599 (=> (not res!517770) (not e!426450))))

(declare-fun arrayContainsKey!0 (array!42220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!765599 (= res!517770 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!765600 () Bool)

(declare-fun res!517775 () Bool)

(assert (=> b!765600 (=> (not res!517775) (not e!426450))))

(assert (=> b!765600 (= res!517775 (and (= (size!20632 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20632 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20632 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!765601 () Bool)

(assert (=> b!765601 (= e!426455 e!426452)))

(declare-fun res!517767 () Bool)

(assert (=> b!765601 (=> (not res!517767) (not e!426452))))

(declare-fun lt!340626 () SeekEntryResult!7768)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42220 (_ BitVec 32)) SeekEntryResult!7768)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765601 (= res!517767 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20212 a!3186) j!159) mask!3328) (select (arr!20212 a!3186) j!159) a!3186 mask!3328) lt!340626))))

(assert (=> b!765601 (= lt!340626 (Intermediate!7768 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!765602 () Bool)

(assert (=> b!765602 (= e!426450 e!426455)))

(declare-fun res!517768 () Bool)

(assert (=> b!765602 (=> (not res!517768) (not e!426455))))

(declare-fun lt!340622 () SeekEntryResult!7768)

(assert (=> b!765602 (= res!517768 (or (= lt!340622 (MissingZero!7768 i!1173)) (= lt!340622 (MissingVacant!7768 i!1173))))))

(assert (=> b!765602 (= lt!340622 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!765603 () Bool)

(assert (=> b!765603 (= e!426453 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20212 a!3186) j!159) a!3186 mask!3328) lt!340626))))

(declare-fun b!765604 () Bool)

(declare-fun res!517762 () Bool)

(assert (=> b!765604 (=> (not res!517762) (not e!426455))))

(declare-datatypes ((List!14121 0))(
  ( (Nil!14118) (Cons!14117 (h!15210 (_ BitVec 64)) (t!20428 List!14121)) )
))
(declare-fun arrayNoDuplicates!0 (array!42220 (_ BitVec 32) List!14121) Bool)

(assert (=> b!765604 (= res!517762 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14118))))

(declare-fun b!765605 () Bool)

(assert (=> b!765605 (= e!426452 e!426454)))

(declare-fun res!517765 () Bool)

(assert (=> b!765605 (=> (not res!517765) (not e!426454))))

(declare-fun lt!340625 () array!42220)

(declare-fun lt!340623 () (_ BitVec 64))

(assert (=> b!765605 (= res!517765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340623 mask!3328) lt!340623 lt!340625 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340623 lt!340625 mask!3328)))))

(assert (=> b!765605 (= lt!340623 (select (store (arr!20212 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!765605 (= lt!340625 (array!42221 (store (arr!20212 a!3186) i!1173 k0!2102) (size!20632 a!3186)))))

(declare-fun res!517766 () Bool)

(assert (=> start!66500 (=> (not res!517766) (not e!426450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66500 (= res!517766 (validMask!0 mask!3328))))

(assert (=> start!66500 e!426450))

(assert (=> start!66500 true))

(declare-fun array_inv!16071 (array!42220) Bool)

(assert (=> start!66500 (array_inv!16071 a!3186)))

(declare-fun b!765597 () Bool)

(declare-fun res!517771 () Bool)

(assert (=> b!765597 (=> (not res!517771) (not e!426455))))

(assert (=> b!765597 (= res!517771 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20632 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20632 a!3186))))))

(assert (= (and start!66500 res!517766) b!765600))

(assert (= (and b!765600 res!517775) b!765591))

(assert (= (and b!765591 res!517763) b!765595))

(assert (= (and b!765595 res!517772) b!765599))

(assert (= (and b!765599 res!517770) b!765602))

(assert (= (and b!765602 res!517768) b!765593))

(assert (= (and b!765593 res!517764) b!765604))

(assert (= (and b!765604 res!517762) b!765597))

(assert (= (and b!765597 res!517771) b!765601))

(assert (= (and b!765601 res!517767) b!765596))

(assert (= (and b!765596 res!517769) b!765592))

(assert (= (and b!765592 c!84305) b!765603))

(assert (= (and b!765592 (not c!84305)) b!765590))

(assert (= (and b!765592 res!517773) b!765605))

(assert (= (and b!765605 res!517765) b!765594))

(assert (= (and b!765594 res!517774) b!765598))

(declare-fun m!712195 () Bool)

(assert (=> start!66500 m!712195))

(declare-fun m!712197 () Bool)

(assert (=> start!66500 m!712197))

(declare-fun m!712199 () Bool)

(assert (=> b!765602 m!712199))

(declare-fun m!712201 () Bool)

(assert (=> b!765601 m!712201))

(assert (=> b!765601 m!712201))

(declare-fun m!712203 () Bool)

(assert (=> b!765601 m!712203))

(assert (=> b!765601 m!712203))

(assert (=> b!765601 m!712201))

(declare-fun m!712205 () Bool)

(assert (=> b!765601 m!712205))

(assert (=> b!765590 m!712201))

(assert (=> b!765590 m!712201))

(declare-fun m!712207 () Bool)

(assert (=> b!765590 m!712207))

(declare-fun m!712209 () Bool)

(assert (=> b!765605 m!712209))

(declare-fun m!712211 () Bool)

(assert (=> b!765605 m!712211))

(declare-fun m!712213 () Bool)

(assert (=> b!765605 m!712213))

(assert (=> b!765605 m!712211))

(declare-fun m!712215 () Bool)

(assert (=> b!765605 m!712215))

(declare-fun m!712217 () Bool)

(assert (=> b!765605 m!712217))

(declare-fun m!712219 () Bool)

(assert (=> b!765595 m!712219))

(assert (=> b!765598 m!712201))

(assert (=> b!765598 m!712201))

(declare-fun m!712221 () Bool)

(assert (=> b!765598 m!712221))

(declare-fun m!712223 () Bool)

(assert (=> b!765599 m!712223))

(declare-fun m!712225 () Bool)

(assert (=> b!765604 m!712225))

(declare-fun m!712227 () Bool)

(assert (=> b!765596 m!712227))

(assert (=> b!765591 m!712201))

(assert (=> b!765591 m!712201))

(declare-fun m!712229 () Bool)

(assert (=> b!765591 m!712229))

(declare-fun m!712231 () Bool)

(assert (=> b!765594 m!712231))

(declare-fun m!712233 () Bool)

(assert (=> b!765594 m!712233))

(assert (=> b!765603 m!712201))

(assert (=> b!765603 m!712201))

(declare-fun m!712235 () Bool)

(assert (=> b!765603 m!712235))

(declare-fun m!712237 () Bool)

(assert (=> b!765593 m!712237))

(check-sat (not b!765604) (not b!765603) (not b!765601) (not b!765593) (not b!765595) (not b!765591) (not b!765605) (not b!765594) (not start!66500) (not b!765599) (not b!765602) (not b!765598) (not b!765590))
(check-sat)
