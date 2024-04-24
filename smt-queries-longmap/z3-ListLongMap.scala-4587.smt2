; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64098 () Bool)

(assert start!64098)

(declare-fun res!481692 () Bool)

(declare-fun e!403822 () Bool)

(assert (=> start!64098 (=> (not res!481692) (not e!403822))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64098 (= res!481692 (validMask!0 mask!3328))))

(assert (=> start!64098 e!403822))

(assert (=> start!64098 true))

(declare-datatypes ((array!40726 0))(
  ( (array!40727 (arr!19486 (Array (_ BitVec 32) (_ BitVec 64))) (size!19906 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40726)

(declare-fun array_inv!15345 (array!40726) Bool)

(assert (=> start!64098 (array_inv!15345 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun b!719443 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!403824 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719443 (= e!403824 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19486 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsle x!1131 resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!719444 () Bool)

(declare-fun res!481690 () Bool)

(assert (=> b!719444 (=> (not res!481690) (not e!403822))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40726 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719444 (= res!481690 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719445 () Bool)

(declare-fun res!481696 () Bool)

(assert (=> b!719445 (=> (not res!481696) (not e!403824))))

(declare-datatypes ((List!13395 0))(
  ( (Nil!13392) (Cons!13391 (h!14442 (_ BitVec 64)) (t!19702 List!13395)) )
))
(declare-fun arrayNoDuplicates!0 (array!40726 (_ BitVec 32) List!13395) Bool)

(assert (=> b!719445 (= res!481696 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13392))))

(declare-fun b!719446 () Bool)

(declare-fun res!481694 () Bool)

(assert (=> b!719446 (=> (not res!481694) (not e!403824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40726 (_ BitVec 32)) Bool)

(assert (=> b!719446 (= res!481694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719447 () Bool)

(declare-fun res!481693 () Bool)

(assert (=> b!719447 (=> (not res!481693) (not e!403824))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7042 0))(
  ( (MissingZero!7042 (index!30536 (_ BitVec 32))) (Found!7042 (index!30537 (_ BitVec 32))) (Intermediate!7042 (undefined!7854 Bool) (index!30538 (_ BitVec 32)) (x!61700 (_ BitVec 32))) (Undefined!7042) (MissingVacant!7042 (index!30539 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40726 (_ BitVec 32)) SeekEntryResult!7042)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719447 (= res!481693 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19486 a!3186) j!159) mask!3328) (select (arr!19486 a!3186) j!159) a!3186 mask!3328) (Intermediate!7042 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719448 () Bool)

(declare-fun res!481688 () Bool)

(assert (=> b!719448 (=> (not res!481688) (not e!403824))))

(assert (=> b!719448 (= res!481688 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19906 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19906 a!3186))))))

(declare-fun b!719449 () Bool)

(declare-fun res!481689 () Bool)

(assert (=> b!719449 (=> (not res!481689) (not e!403822))))

(assert (=> b!719449 (= res!481689 (and (= (size!19906 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19906 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19906 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719450 () Bool)

(declare-fun res!481695 () Bool)

(assert (=> b!719450 (=> (not res!481695) (not e!403822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719450 (= res!481695 (validKeyInArray!0 (select (arr!19486 a!3186) j!159)))))

(declare-fun b!719451 () Bool)

(declare-fun res!481687 () Bool)

(assert (=> b!719451 (=> (not res!481687) (not e!403822))))

(assert (=> b!719451 (= res!481687 (validKeyInArray!0 k0!2102))))

(declare-fun b!719452 () Bool)

(assert (=> b!719452 (= e!403822 e!403824)))

(declare-fun res!481691 () Bool)

(assert (=> b!719452 (=> (not res!481691) (not e!403824))))

(declare-fun lt!319668 () SeekEntryResult!7042)

(assert (=> b!719452 (= res!481691 (or (= lt!319668 (MissingZero!7042 i!1173)) (= lt!319668 (MissingVacant!7042 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40726 (_ BitVec 32)) SeekEntryResult!7042)

(assert (=> b!719452 (= lt!319668 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64098 res!481692) b!719449))

(assert (= (and b!719449 res!481689) b!719450))

(assert (= (and b!719450 res!481695) b!719451))

(assert (= (and b!719451 res!481687) b!719444))

(assert (= (and b!719444 res!481690) b!719452))

(assert (= (and b!719452 res!481691) b!719446))

(assert (= (and b!719446 res!481694) b!719445))

(assert (= (and b!719445 res!481696) b!719448))

(assert (= (and b!719448 res!481688) b!719447))

(assert (= (and b!719447 res!481693) b!719443))

(declare-fun m!675429 () Bool)

(assert (=> b!719445 m!675429))

(declare-fun m!675431 () Bool)

(assert (=> start!64098 m!675431))

(declare-fun m!675433 () Bool)

(assert (=> start!64098 m!675433))

(declare-fun m!675435 () Bool)

(assert (=> b!719451 m!675435))

(declare-fun m!675437 () Bool)

(assert (=> b!719450 m!675437))

(assert (=> b!719450 m!675437))

(declare-fun m!675439 () Bool)

(assert (=> b!719450 m!675439))

(declare-fun m!675441 () Bool)

(assert (=> b!719446 m!675441))

(declare-fun m!675443 () Bool)

(assert (=> b!719452 m!675443))

(declare-fun m!675445 () Bool)

(assert (=> b!719444 m!675445))

(declare-fun m!675447 () Bool)

(assert (=> b!719443 m!675447))

(assert (=> b!719447 m!675437))

(assert (=> b!719447 m!675437))

(declare-fun m!675449 () Bool)

(assert (=> b!719447 m!675449))

(assert (=> b!719447 m!675449))

(assert (=> b!719447 m!675437))

(declare-fun m!675451 () Bool)

(assert (=> b!719447 m!675451))

(check-sat (not b!719452) (not b!719451) (not b!719445) (not b!719446) (not b!719450) (not b!719444) (not start!64098) (not b!719447))
(check-sat)
