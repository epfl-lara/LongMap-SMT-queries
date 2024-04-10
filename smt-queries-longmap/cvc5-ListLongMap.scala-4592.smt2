; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64066 () Bool)

(assert start!64066)

(declare-fun b!719536 () Bool)

(declare-fun res!481932 () Bool)

(declare-fun e!403733 () Bool)

(assert (=> b!719536 (=> (not res!481932) (not e!403733))))

(declare-datatypes ((array!40761 0))(
  ( (array!40762 (arr!19506 (Array (_ BitVec 32) (_ BitVec 64))) (size!19927 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40761)

(declare-datatypes ((List!13508 0))(
  ( (Nil!13505) (Cons!13504 (h!14552 (_ BitVec 64)) (t!19823 List!13508)) )
))
(declare-fun arrayNoDuplicates!0 (array!40761 (_ BitVec 32) List!13508) Bool)

(assert (=> b!719536 (= res!481932 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13505))))

(declare-fun b!719537 () Bool)

(declare-fun res!481933 () Bool)

(declare-fun e!403731 () Bool)

(assert (=> b!719537 (=> (not res!481933) (not e!403731))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!719537 (= res!481933 (and (= (size!19927 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19927 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19927 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719538 () Bool)

(declare-fun res!481931 () Bool)

(assert (=> b!719538 (=> (not res!481931) (not e!403731))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719538 (= res!481931 (validKeyInArray!0 k!2102))))

(declare-fun b!719539 () Bool)

(assert (=> b!719539 (= e!403733 false)))

(declare-datatypes ((SeekEntryResult!7106 0))(
  ( (MissingZero!7106 (index!30792 (_ BitVec 32))) (Found!7106 (index!30793 (_ BitVec 32))) (Intermediate!7106 (undefined!7918 Bool) (index!30794 (_ BitVec 32)) (x!61801 (_ BitVec 32))) (Undefined!7106) (MissingVacant!7106 (index!30795 (_ BitVec 32))) )
))
(declare-fun lt!319613 () SeekEntryResult!7106)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40761 (_ BitVec 32)) SeekEntryResult!7106)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719539 (= lt!319613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19506 a!3186) j!159) mask!3328) (select (arr!19506 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719540 () Bool)

(declare-fun res!481935 () Bool)

(assert (=> b!719540 (=> (not res!481935) (not e!403733))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719540 (= res!481935 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19927 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19927 a!3186))))))

(declare-fun b!719541 () Bool)

(declare-fun res!481936 () Bool)

(assert (=> b!719541 (=> (not res!481936) (not e!403733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40761 (_ BitVec 32)) Bool)

(assert (=> b!719541 (= res!481936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!481937 () Bool)

(assert (=> start!64066 (=> (not res!481937) (not e!403731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64066 (= res!481937 (validMask!0 mask!3328))))

(assert (=> start!64066 e!403731))

(assert (=> start!64066 true))

(declare-fun array_inv!15302 (array!40761) Bool)

(assert (=> start!64066 (array_inv!15302 a!3186)))

(declare-fun b!719542 () Bool)

(declare-fun res!481929 () Bool)

(assert (=> b!719542 (=> (not res!481929) (not e!403731))))

(declare-fun arrayContainsKey!0 (array!40761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719542 (= res!481929 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719543 () Bool)

(declare-fun res!481934 () Bool)

(assert (=> b!719543 (=> (not res!481934) (not e!403731))))

(assert (=> b!719543 (= res!481934 (validKeyInArray!0 (select (arr!19506 a!3186) j!159)))))

(declare-fun b!719544 () Bool)

(assert (=> b!719544 (= e!403731 e!403733)))

(declare-fun res!481930 () Bool)

(assert (=> b!719544 (=> (not res!481930) (not e!403733))))

(declare-fun lt!319612 () SeekEntryResult!7106)

(assert (=> b!719544 (= res!481930 (or (= lt!319612 (MissingZero!7106 i!1173)) (= lt!319612 (MissingVacant!7106 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40761 (_ BitVec 32)) SeekEntryResult!7106)

(assert (=> b!719544 (= lt!319612 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!64066 res!481937) b!719537))

(assert (= (and b!719537 res!481933) b!719543))

(assert (= (and b!719543 res!481934) b!719538))

(assert (= (and b!719538 res!481931) b!719542))

(assert (= (and b!719542 res!481929) b!719544))

(assert (= (and b!719544 res!481930) b!719541))

(assert (= (and b!719541 res!481936) b!719536))

(assert (= (and b!719536 res!481932) b!719540))

(assert (= (and b!719540 res!481935) b!719539))

(declare-fun m!674923 () Bool)

(assert (=> b!719542 m!674923))

(declare-fun m!674925 () Bool)

(assert (=> b!719541 m!674925))

(declare-fun m!674927 () Bool)

(assert (=> start!64066 m!674927))

(declare-fun m!674929 () Bool)

(assert (=> start!64066 m!674929))

(declare-fun m!674931 () Bool)

(assert (=> b!719544 m!674931))

(declare-fun m!674933 () Bool)

(assert (=> b!719539 m!674933))

(assert (=> b!719539 m!674933))

(declare-fun m!674935 () Bool)

(assert (=> b!719539 m!674935))

(assert (=> b!719539 m!674935))

(assert (=> b!719539 m!674933))

(declare-fun m!674937 () Bool)

(assert (=> b!719539 m!674937))

(declare-fun m!674939 () Bool)

(assert (=> b!719536 m!674939))

(assert (=> b!719543 m!674933))

(assert (=> b!719543 m!674933))

(declare-fun m!674941 () Bool)

(assert (=> b!719543 m!674941))

(declare-fun m!674943 () Bool)

(assert (=> b!719538 m!674943))

(push 1)

(assert (not b!719539))

(assert (not b!719536))

(assert (not b!719544))

(assert (not b!719541))

(assert (not start!64066))

(assert (not b!719538))

(assert (not b!719542))

(assert (not b!719543))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

