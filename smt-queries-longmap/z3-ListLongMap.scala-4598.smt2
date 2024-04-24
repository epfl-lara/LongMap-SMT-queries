; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64164 () Bool)

(assert start!64164)

(declare-fun b!720378 () Bool)

(declare-fun e!404124 () Bool)

(declare-fun e!404125 () Bool)

(assert (=> b!720378 (= e!404124 e!404125)))

(declare-fun res!482627 () Bool)

(assert (=> b!720378 (=> (not res!482627) (not e!404125))))

(declare-datatypes ((array!40792 0))(
  ( (array!40793 (arr!19519 (Array (_ BitVec 32) (_ BitVec 64))) (size!19939 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40792)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7075 0))(
  ( (MissingZero!7075 (index!30668 (_ BitVec 32))) (Found!7075 (index!30669 (_ BitVec 32))) (Intermediate!7075 (undefined!7887 Bool) (index!30670 (_ BitVec 32)) (x!61821 (_ BitVec 32))) (Undefined!7075) (MissingVacant!7075 (index!30671 (_ BitVec 32))) )
))
(declare-fun lt!319833 () SeekEntryResult!7075)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40792 (_ BitVec 32)) SeekEntryResult!7075)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720378 (= res!482627 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19519 a!3186) j!159) mask!3328) (select (arr!19519 a!3186) j!159) a!3186 mask!3328) lt!319833))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720378 (= lt!319833 (Intermediate!7075 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!720379 () Bool)

(declare-fun res!482623 () Bool)

(declare-fun e!404127 () Bool)

(assert (=> b!720379 (=> (not res!482623) (not e!404127))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720379 (= res!482623 (and (= (size!19939 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19939 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19939 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720380 () Bool)

(declare-fun res!482621 () Bool)

(assert (=> b!720380 (=> (not res!482621) (not e!404127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720380 (= res!482621 (validKeyInArray!0 (select (arr!19519 a!3186) j!159)))))

(declare-fun b!720381 () Bool)

(declare-fun res!482618 () Bool)

(assert (=> b!720381 (=> (not res!482618) (not e!404125))))

(declare-fun e!404126 () Bool)

(assert (=> b!720381 (= res!482618 e!404126)))

(declare-fun c!79250 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!720381 (= c!79250 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!720382 () Bool)

(declare-fun res!482625 () Bool)

(assert (=> b!720382 (=> (not res!482625) (not e!404127))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!720382 (= res!482625 (validKeyInArray!0 k0!2102))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!720383 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40792 (_ BitVec 32)) SeekEntryResult!7075)

(assert (=> b!720383 (= e!404126 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19519 a!3186) j!159) a!3186 mask!3328) (Found!7075 j!159)))))

(declare-fun b!720384 () Bool)

(declare-fun res!482619 () Bool)

(assert (=> b!720384 (=> (not res!482619) (not e!404125))))

(assert (=> b!720384 (= res!482619 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19519 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720385 () Bool)

(declare-fun res!482629 () Bool)

(assert (=> b!720385 (=> (not res!482629) (not e!404124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40792 (_ BitVec 32)) Bool)

(assert (=> b!720385 (= res!482629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720386 () Bool)

(declare-fun res!482626 () Bool)

(assert (=> b!720386 (=> (not res!482626) (not e!404127))))

(declare-fun arrayContainsKey!0 (array!40792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720386 (= res!482626 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720387 () Bool)

(declare-fun res!482622 () Bool)

(assert (=> b!720387 (=> (not res!482622) (not e!404124))))

(declare-datatypes ((List!13428 0))(
  ( (Nil!13425) (Cons!13424 (h!14475 (_ BitVec 64)) (t!19735 List!13428)) )
))
(declare-fun arrayNoDuplicates!0 (array!40792 (_ BitVec 32) List!13428) Bool)

(assert (=> b!720387 (= res!482622 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13425))))

(declare-fun b!720388 () Bool)

(assert (=> b!720388 (= e!404125 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!720389 () Bool)

(assert (=> b!720389 (= e!404126 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19519 a!3186) j!159) a!3186 mask!3328) lt!319833))))

(declare-fun res!482628 () Bool)

(assert (=> start!64164 (=> (not res!482628) (not e!404127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64164 (= res!482628 (validMask!0 mask!3328))))

(assert (=> start!64164 e!404127))

(assert (=> start!64164 true))

(declare-fun array_inv!15378 (array!40792) Bool)

(assert (=> start!64164 (array_inv!15378 a!3186)))

(declare-fun b!720390 () Bool)

(assert (=> b!720390 (= e!404127 e!404124)))

(declare-fun res!482620 () Bool)

(assert (=> b!720390 (=> (not res!482620) (not e!404124))))

(declare-fun lt!319832 () SeekEntryResult!7075)

(assert (=> b!720390 (= res!482620 (or (= lt!319832 (MissingZero!7075 i!1173)) (= lt!319832 (MissingVacant!7075 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40792 (_ BitVec 32)) SeekEntryResult!7075)

(assert (=> b!720390 (= lt!319832 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!720391 () Bool)

(declare-fun res!482624 () Bool)

(assert (=> b!720391 (=> (not res!482624) (not e!404124))))

(assert (=> b!720391 (= res!482624 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19939 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19939 a!3186))))))

(assert (= (and start!64164 res!482628) b!720379))

(assert (= (and b!720379 res!482623) b!720380))

(assert (= (and b!720380 res!482621) b!720382))

(assert (= (and b!720382 res!482625) b!720386))

(assert (= (and b!720386 res!482626) b!720390))

(assert (= (and b!720390 res!482620) b!720385))

(assert (= (and b!720385 res!482629) b!720387))

(assert (= (and b!720387 res!482622) b!720391))

(assert (= (and b!720391 res!482624) b!720378))

(assert (= (and b!720378 res!482627) b!720384))

(assert (= (and b!720384 res!482619) b!720381))

(assert (= (and b!720381 c!79250) b!720389))

(assert (= (and b!720381 (not c!79250)) b!720383))

(assert (= (and b!720381 res!482618) b!720388))

(declare-fun m!676179 () Bool)

(assert (=> b!720390 m!676179))

(declare-fun m!676181 () Bool)

(assert (=> b!720385 m!676181))

(declare-fun m!676183 () Bool)

(assert (=> start!64164 m!676183))

(declare-fun m!676185 () Bool)

(assert (=> start!64164 m!676185))

(declare-fun m!676187 () Bool)

(assert (=> b!720380 m!676187))

(assert (=> b!720380 m!676187))

(declare-fun m!676189 () Bool)

(assert (=> b!720380 m!676189))

(declare-fun m!676191 () Bool)

(assert (=> b!720384 m!676191))

(assert (=> b!720389 m!676187))

(assert (=> b!720389 m!676187))

(declare-fun m!676193 () Bool)

(assert (=> b!720389 m!676193))

(declare-fun m!676195 () Bool)

(assert (=> b!720387 m!676195))

(declare-fun m!676197 () Bool)

(assert (=> b!720382 m!676197))

(assert (=> b!720383 m!676187))

(assert (=> b!720383 m!676187))

(declare-fun m!676199 () Bool)

(assert (=> b!720383 m!676199))

(declare-fun m!676201 () Bool)

(assert (=> b!720386 m!676201))

(assert (=> b!720378 m!676187))

(assert (=> b!720378 m!676187))

(declare-fun m!676203 () Bool)

(assert (=> b!720378 m!676203))

(assert (=> b!720378 m!676203))

(assert (=> b!720378 m!676187))

(declare-fun m!676205 () Bool)

(assert (=> b!720378 m!676205))

(check-sat (not b!720383) (not start!64164) (not b!720380) (not b!720387) (not b!720389) (not b!720382) (not b!720378) (not b!720390) (not b!720386) (not b!720385))
(check-sat)
