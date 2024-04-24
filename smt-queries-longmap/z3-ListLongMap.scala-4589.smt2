; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64110 () Bool)

(assert start!64110)

(declare-fun b!719612 () Bool)

(declare-fun res!481858 () Bool)

(declare-fun e!403877 () Bool)

(assert (=> b!719612 (=> (not res!481858) (not e!403877))))

(declare-datatypes ((array!40738 0))(
  ( (array!40739 (arr!19492 (Array (_ BitVec 32) (_ BitVec 64))) (size!19912 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40738)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719612 (= res!481858 (validKeyInArray!0 (select (arr!19492 a!3186) j!159)))))

(declare-fun b!719613 () Bool)

(declare-fun res!481857 () Bool)

(assert (=> b!719613 (=> (not res!481857) (not e!403877))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!719613 (= res!481857 (and (= (size!19912 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19912 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19912 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719614 () Bool)

(declare-fun res!481856 () Bool)

(declare-fun e!403876 () Bool)

(assert (=> b!719614 (=> (not res!481856) (not e!403876))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!719614 (= res!481856 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19912 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19912 a!3186))))))

(declare-fun b!719615 () Bool)

(assert (=> b!719615 (= e!403877 e!403876)))

(declare-fun res!481862 () Bool)

(assert (=> b!719615 (=> (not res!481862) (not e!403876))))

(declare-datatypes ((SeekEntryResult!7048 0))(
  ( (MissingZero!7048 (index!30560 (_ BitVec 32))) (Found!7048 (index!30561 (_ BitVec 32))) (Intermediate!7048 (undefined!7860 Bool) (index!30562 (_ BitVec 32)) (x!61722 (_ BitVec 32))) (Undefined!7048) (MissingVacant!7048 (index!30563 (_ BitVec 32))) )
))
(declare-fun lt!319698 () SeekEntryResult!7048)

(assert (=> b!719615 (= res!481862 (or (= lt!319698 (MissingZero!7048 i!1173)) (= lt!319698 (MissingVacant!7048 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40738 (_ BitVec 32)) SeekEntryResult!7048)

(assert (=> b!719615 (= lt!319698 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719616 () Bool)

(declare-fun res!481861 () Bool)

(assert (=> b!719616 (=> (not res!481861) (not e!403876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40738 (_ BitVec 32)) Bool)

(assert (=> b!719616 (= res!481861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!481863 () Bool)

(assert (=> start!64110 (=> (not res!481863) (not e!403877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64110 (= res!481863 (validMask!0 mask!3328))))

(assert (=> start!64110 e!403877))

(assert (=> start!64110 true))

(declare-fun array_inv!15351 (array!40738) Bool)

(assert (=> start!64110 (array_inv!15351 a!3186)))

(declare-fun b!719617 () Bool)

(declare-fun res!481859 () Bool)

(assert (=> b!719617 (=> (not res!481859) (not e!403877))))

(declare-fun arrayContainsKey!0 (array!40738 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719617 (= res!481859 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719618 () Bool)

(declare-fun res!481864 () Bool)

(assert (=> b!719618 (=> (not res!481864) (not e!403877))))

(assert (=> b!719618 (= res!481864 (validKeyInArray!0 k0!2102))))

(declare-fun b!719619 () Bool)

(declare-fun res!481860 () Bool)

(assert (=> b!719619 (=> (not res!481860) (not e!403876))))

(declare-datatypes ((List!13401 0))(
  ( (Nil!13398) (Cons!13397 (h!14448 (_ BitVec 64)) (t!19708 List!13401)) )
))
(declare-fun arrayNoDuplicates!0 (array!40738 (_ BitVec 32) List!13401) Bool)

(assert (=> b!719619 (= res!481860 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13398))))

(declare-fun b!719620 () Bool)

(assert (=> b!719620 (= e!403876 false)))

(declare-fun lt!319697 () SeekEntryResult!7048)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40738 (_ BitVec 32)) SeekEntryResult!7048)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719620 (= lt!319697 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19492 a!3186) j!159) mask!3328) (select (arr!19492 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!64110 res!481863) b!719613))

(assert (= (and b!719613 res!481857) b!719612))

(assert (= (and b!719612 res!481858) b!719618))

(assert (= (and b!719618 res!481864) b!719617))

(assert (= (and b!719617 res!481859) b!719615))

(assert (= (and b!719615 res!481862) b!719616))

(assert (= (and b!719616 res!481861) b!719619))

(assert (= (and b!719619 res!481860) b!719614))

(assert (= (and b!719614 res!481856) b!719620))

(declare-fun m!675567 () Bool)

(assert (=> b!719612 m!675567))

(assert (=> b!719612 m!675567))

(declare-fun m!675569 () Bool)

(assert (=> b!719612 m!675569))

(declare-fun m!675571 () Bool)

(assert (=> start!64110 m!675571))

(declare-fun m!675573 () Bool)

(assert (=> start!64110 m!675573))

(declare-fun m!675575 () Bool)

(assert (=> b!719617 m!675575))

(assert (=> b!719620 m!675567))

(assert (=> b!719620 m!675567))

(declare-fun m!675577 () Bool)

(assert (=> b!719620 m!675577))

(assert (=> b!719620 m!675577))

(assert (=> b!719620 m!675567))

(declare-fun m!675579 () Bool)

(assert (=> b!719620 m!675579))

(declare-fun m!675581 () Bool)

(assert (=> b!719616 m!675581))

(declare-fun m!675583 () Bool)

(assert (=> b!719619 m!675583))

(declare-fun m!675585 () Bool)

(assert (=> b!719615 m!675585))

(declare-fun m!675587 () Bool)

(assert (=> b!719618 m!675587))

(check-sat (not b!719617) (not b!719620) (not b!719618) (not b!719612) (not b!719619) (not b!719615) (not b!719616) (not start!64110))
(check-sat)
