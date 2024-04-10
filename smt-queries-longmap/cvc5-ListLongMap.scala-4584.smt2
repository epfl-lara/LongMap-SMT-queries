; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64018 () Bool)

(assert start!64018)

(declare-fun b!718861 () Bool)

(declare-fun e!403515 () Bool)

(declare-fun e!403516 () Bool)

(assert (=> b!718861 (= e!403515 e!403516)))

(declare-fun res!481256 () Bool)

(assert (=> b!718861 (=> (not res!481256) (not e!403516))))

(declare-datatypes ((SeekEntryResult!7082 0))(
  ( (MissingZero!7082 (index!30696 (_ BitVec 32))) (Found!7082 (index!30697 (_ BitVec 32))) (Intermediate!7082 (undefined!7894 Bool) (index!30698 (_ BitVec 32)) (x!61713 (_ BitVec 32))) (Undefined!7082) (MissingVacant!7082 (index!30699 (_ BitVec 32))) )
))
(declare-fun lt!319496 () SeekEntryResult!7082)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718861 (= res!481256 (or (= lt!319496 (MissingZero!7082 i!1173)) (= lt!319496 (MissingVacant!7082 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!40713 0))(
  ( (array!40714 (arr!19482 (Array (_ BitVec 32) (_ BitVec 64))) (size!19903 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40713)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40713 (_ BitVec 32)) SeekEntryResult!7082)

(assert (=> b!718861 (= lt!319496 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!718862 () Bool)

(declare-fun res!481258 () Bool)

(assert (=> b!718862 (=> (not res!481258) (not e!403515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718862 (= res!481258 (validKeyInArray!0 k!2102))))

(declare-fun b!718863 () Bool)

(declare-fun res!481255 () Bool)

(assert (=> b!718863 (=> (not res!481255) (not e!403516))))

(declare-datatypes ((List!13484 0))(
  ( (Nil!13481) (Cons!13480 (h!14528 (_ BitVec 64)) (t!19799 List!13484)) )
))
(declare-fun arrayNoDuplicates!0 (array!40713 (_ BitVec 32) List!13484) Bool)

(assert (=> b!718863 (= res!481255 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13481))))

(declare-fun b!718864 () Bool)

(declare-fun res!481259 () Bool)

(assert (=> b!718864 (=> (not res!481259) (not e!403515))))

(declare-fun arrayContainsKey!0 (array!40713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718864 (= res!481259 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718865 () Bool)

(declare-fun res!481262 () Bool)

(assert (=> b!718865 (=> (not res!481262) (not e!403515))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!718865 (= res!481262 (validKeyInArray!0 (select (arr!19482 a!3186) j!159)))))

(declare-fun res!481257 () Bool)

(assert (=> start!64018 (=> (not res!481257) (not e!403515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64018 (= res!481257 (validMask!0 mask!3328))))

(assert (=> start!64018 e!403515))

(assert (=> start!64018 true))

(declare-fun array_inv!15278 (array!40713) Bool)

(assert (=> start!64018 (array_inv!15278 a!3186)))

(declare-fun b!718866 () Bool)

(declare-fun res!481260 () Bool)

(assert (=> b!718866 (=> (not res!481260) (not e!403515))))

(assert (=> b!718866 (= res!481260 (and (= (size!19903 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19903 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19903 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718867 () Bool)

(assert (=> b!718867 (= e!403516 false)))

(declare-fun lt!319495 () SeekEntryResult!7082)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40713 (_ BitVec 32)) SeekEntryResult!7082)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718867 (= lt!319495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19482 a!3186) j!159) mask!3328) (select (arr!19482 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!718868 () Bool)

(declare-fun res!481261 () Bool)

(assert (=> b!718868 (=> (not res!481261) (not e!403516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40713 (_ BitVec 32)) Bool)

(assert (=> b!718868 (= res!481261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718869 () Bool)

(declare-fun res!481254 () Bool)

(assert (=> b!718869 (=> (not res!481254) (not e!403516))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718869 (= res!481254 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19903 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19903 a!3186))))))

(assert (= (and start!64018 res!481257) b!718866))

(assert (= (and b!718866 res!481260) b!718865))

(assert (= (and b!718865 res!481262) b!718862))

(assert (= (and b!718862 res!481258) b!718864))

(assert (= (and b!718864 res!481259) b!718861))

(assert (= (and b!718861 res!481256) b!718868))

(assert (= (and b!718868 res!481261) b!718863))

(assert (= (and b!718863 res!481255) b!718869))

(assert (= (and b!718869 res!481254) b!718867))

(declare-fun m!674377 () Bool)

(assert (=> b!718861 m!674377))

(declare-fun m!674379 () Bool)

(assert (=> b!718862 m!674379))

(declare-fun m!674381 () Bool)

(assert (=> b!718868 m!674381))

(declare-fun m!674383 () Bool)

(assert (=> b!718863 m!674383))

(declare-fun m!674385 () Bool)

(assert (=> b!718864 m!674385))

(declare-fun m!674387 () Bool)

(assert (=> start!64018 m!674387))

(declare-fun m!674389 () Bool)

(assert (=> start!64018 m!674389))

(declare-fun m!674391 () Bool)

(assert (=> b!718865 m!674391))

(assert (=> b!718865 m!674391))

(declare-fun m!674393 () Bool)

(assert (=> b!718865 m!674393))

(assert (=> b!718867 m!674391))

(assert (=> b!718867 m!674391))

(declare-fun m!674395 () Bool)

(assert (=> b!718867 m!674395))

(assert (=> b!718867 m!674395))

(assert (=> b!718867 m!674391))

(declare-fun m!674397 () Bool)

(assert (=> b!718867 m!674397))

(push 1)

