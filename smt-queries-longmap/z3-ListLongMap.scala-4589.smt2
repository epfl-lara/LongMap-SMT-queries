; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64050 () Bool)

(assert start!64050)

(declare-fun b!719312 () Bool)

(declare-fun e!403659 () Bool)

(declare-fun e!403660 () Bool)

(assert (=> b!719312 (= e!403659 e!403660)))

(declare-fun res!481706 () Bool)

(assert (=> b!719312 (=> (not res!481706) (not e!403660))))

(declare-datatypes ((SeekEntryResult!7098 0))(
  ( (MissingZero!7098 (index!30760 (_ BitVec 32))) (Found!7098 (index!30761 (_ BitVec 32))) (Intermediate!7098 (undefined!7910 Bool) (index!30762 (_ BitVec 32)) (x!61769 (_ BitVec 32))) (Undefined!7098) (MissingVacant!7098 (index!30763 (_ BitVec 32))) )
))
(declare-fun lt!319574 () SeekEntryResult!7098)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719312 (= res!481706 (or (= lt!319574 (MissingZero!7098 i!1173)) (= lt!319574 (MissingVacant!7098 i!1173))))))

(declare-datatypes ((array!40745 0))(
  ( (array!40746 (arr!19498 (Array (_ BitVec 32) (_ BitVec 64))) (size!19919 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40745)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40745 (_ BitVec 32)) SeekEntryResult!7098)

(assert (=> b!719312 (= lt!319574 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719313 () Bool)

(declare-fun res!481705 () Bool)

(assert (=> b!719313 (=> (not res!481705) (not e!403659))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719313 (= res!481705 (and (= (size!19919 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19919 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19919 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719314 () Bool)

(declare-fun res!481710 () Bool)

(assert (=> b!719314 (=> (not res!481710) (not e!403660))))

(declare-datatypes ((List!13500 0))(
  ( (Nil!13497) (Cons!13496 (h!14544 (_ BitVec 64)) (t!19815 List!13500)) )
))
(declare-fun arrayNoDuplicates!0 (array!40745 (_ BitVec 32) List!13500) Bool)

(assert (=> b!719314 (= res!481710 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13497))))

(declare-fun b!719315 () Bool)

(declare-fun res!481709 () Bool)

(assert (=> b!719315 (=> (not res!481709) (not e!403660))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!719315 (= res!481709 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19919 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19919 a!3186))))))

(declare-fun b!719316 () Bool)

(declare-fun res!481704 () Bool)

(assert (=> b!719316 (=> (not res!481704) (not e!403659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719316 (= res!481704 (validKeyInArray!0 (select (arr!19498 a!3186) j!159)))))

(declare-fun b!719317 () Bool)

(declare-fun res!481711 () Bool)

(assert (=> b!719317 (=> (not res!481711) (not e!403659))))

(assert (=> b!719317 (= res!481711 (validKeyInArray!0 k0!2102))))

(declare-fun b!719318 () Bool)

(declare-fun res!481712 () Bool)

(assert (=> b!719318 (=> (not res!481712) (not e!403660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40745 (_ BitVec 32)) Bool)

(assert (=> b!719318 (= res!481712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719319 () Bool)

(declare-fun res!481707 () Bool)

(assert (=> b!719319 (=> (not res!481707) (not e!403659))))

(declare-fun arrayContainsKey!0 (array!40745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719319 (= res!481707 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!481708 () Bool)

(assert (=> start!64050 (=> (not res!481708) (not e!403659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64050 (= res!481708 (validMask!0 mask!3328))))

(assert (=> start!64050 e!403659))

(assert (=> start!64050 true))

(declare-fun array_inv!15294 (array!40745) Bool)

(assert (=> start!64050 (array_inv!15294 a!3186)))

(declare-fun b!719311 () Bool)

(assert (=> b!719311 (= e!403660 false)))

(declare-fun lt!319573 () SeekEntryResult!7098)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40745 (_ BitVec 32)) SeekEntryResult!7098)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719311 (= lt!319573 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19498 a!3186) j!159) mask!3328) (select (arr!19498 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!64050 res!481708) b!719313))

(assert (= (and b!719313 res!481705) b!719316))

(assert (= (and b!719316 res!481704) b!719317))

(assert (= (and b!719317 res!481711) b!719319))

(assert (= (and b!719319 res!481707) b!719312))

(assert (= (and b!719312 res!481706) b!719318))

(assert (= (and b!719318 res!481712) b!719314))

(assert (= (and b!719314 res!481710) b!719315))

(assert (= (and b!719315 res!481709) b!719311))

(declare-fun m!674741 () Bool)

(assert (=> start!64050 m!674741))

(declare-fun m!674743 () Bool)

(assert (=> start!64050 m!674743))

(declare-fun m!674745 () Bool)

(assert (=> b!719314 m!674745))

(declare-fun m!674747 () Bool)

(assert (=> b!719318 m!674747))

(declare-fun m!674749 () Bool)

(assert (=> b!719311 m!674749))

(assert (=> b!719311 m!674749))

(declare-fun m!674751 () Bool)

(assert (=> b!719311 m!674751))

(assert (=> b!719311 m!674751))

(assert (=> b!719311 m!674749))

(declare-fun m!674753 () Bool)

(assert (=> b!719311 m!674753))

(declare-fun m!674755 () Bool)

(assert (=> b!719317 m!674755))

(assert (=> b!719316 m!674749))

(assert (=> b!719316 m!674749))

(declare-fun m!674757 () Bool)

(assert (=> b!719316 m!674757))

(declare-fun m!674759 () Bool)

(assert (=> b!719319 m!674759))

(declare-fun m!674761 () Bool)

(assert (=> b!719312 m!674761))

(check-sat (not b!719316) (not b!719312) (not b!719311) (not b!719318) (not start!64050) (not b!719314) (not b!719319) (not b!719317))
