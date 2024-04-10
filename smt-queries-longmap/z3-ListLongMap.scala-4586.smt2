; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64032 () Bool)

(assert start!64032)

(declare-fun b!719059 () Bool)

(declare-fun res!481460 () Bool)

(declare-fun e!403579 () Bool)

(assert (=> b!719059 (=> (not res!481460) (not e!403579))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719059 (= res!481460 (validKeyInArray!0 k0!2102))))

(declare-fun res!481454 () Bool)

(assert (=> start!64032 (=> (not res!481454) (not e!403579))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64032 (= res!481454 (validMask!0 mask!3328))))

(assert (=> start!64032 e!403579))

(assert (=> start!64032 true))

(declare-datatypes ((array!40727 0))(
  ( (array!40728 (arr!19489 (Array (_ BitVec 32) (_ BitVec 64))) (size!19910 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40727)

(declare-fun array_inv!15285 (array!40727) Bool)

(assert (=> start!64032 (array_inv!15285 a!3186)))

(declare-fun b!719060 () Bool)

(declare-fun res!481457 () Bool)

(declare-fun e!403578 () Bool)

(assert (=> b!719060 (=> (not res!481457) (not e!403578))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719060 (= res!481457 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19910 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19910 a!3186))))))

(declare-fun b!719061 () Bool)

(declare-fun res!481459 () Bool)

(assert (=> b!719061 (=> (not res!481459) (not e!403578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40727 (_ BitVec 32)) Bool)

(assert (=> b!719061 (= res!481459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719062 () Bool)

(declare-fun res!481452 () Bool)

(assert (=> b!719062 (=> (not res!481452) (not e!403578))))

(declare-datatypes ((List!13491 0))(
  ( (Nil!13488) (Cons!13487 (h!14535 (_ BitVec 64)) (t!19806 List!13491)) )
))
(declare-fun arrayNoDuplicates!0 (array!40727 (_ BitVec 32) List!13491) Bool)

(assert (=> b!719062 (= res!481452 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13488))))

(declare-fun b!719063 () Bool)

(declare-fun res!481453 () Bool)

(assert (=> b!719063 (=> (not res!481453) (not e!403579))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719063 (= res!481453 (validKeyInArray!0 (select (arr!19489 a!3186) j!159)))))

(declare-fun b!719064 () Bool)

(assert (=> b!719064 (= e!403578 false)))

(declare-datatypes ((SeekEntryResult!7089 0))(
  ( (MissingZero!7089 (index!30724 (_ BitVec 32))) (Found!7089 (index!30725 (_ BitVec 32))) (Intermediate!7089 (undefined!7901 Bool) (index!30726 (_ BitVec 32)) (x!61736 (_ BitVec 32))) (Undefined!7089) (MissingVacant!7089 (index!30727 (_ BitVec 32))) )
))
(declare-fun lt!319528 () SeekEntryResult!7089)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40727 (_ BitVec 32)) SeekEntryResult!7089)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719064 (= lt!319528 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19489 a!3186) j!159) mask!3328) (select (arr!19489 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719065 () Bool)

(assert (=> b!719065 (= e!403579 e!403578)))

(declare-fun res!481455 () Bool)

(assert (=> b!719065 (=> (not res!481455) (not e!403578))))

(declare-fun lt!319529 () SeekEntryResult!7089)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719065 (= res!481455 (or (= lt!319529 (MissingZero!7089 i!1173)) (= lt!319529 (MissingVacant!7089 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40727 (_ BitVec 32)) SeekEntryResult!7089)

(assert (=> b!719065 (= lt!319529 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719066 () Bool)

(declare-fun res!481456 () Bool)

(assert (=> b!719066 (=> (not res!481456) (not e!403579))))

(declare-fun arrayContainsKey!0 (array!40727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719066 (= res!481456 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719067 () Bool)

(declare-fun res!481458 () Bool)

(assert (=> b!719067 (=> (not res!481458) (not e!403579))))

(assert (=> b!719067 (= res!481458 (and (= (size!19910 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19910 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19910 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64032 res!481454) b!719067))

(assert (= (and b!719067 res!481458) b!719063))

(assert (= (and b!719063 res!481453) b!719059))

(assert (= (and b!719059 res!481460) b!719066))

(assert (= (and b!719066 res!481456) b!719065))

(assert (= (and b!719065 res!481455) b!719061))

(assert (= (and b!719061 res!481459) b!719062))

(assert (= (and b!719062 res!481452) b!719060))

(assert (= (and b!719060 res!481457) b!719064))

(declare-fun m!674537 () Bool)

(assert (=> b!719059 m!674537))

(declare-fun m!674539 () Bool)

(assert (=> b!719066 m!674539))

(declare-fun m!674541 () Bool)

(assert (=> start!64032 m!674541))

(declare-fun m!674543 () Bool)

(assert (=> start!64032 m!674543))

(declare-fun m!674545 () Bool)

(assert (=> b!719064 m!674545))

(assert (=> b!719064 m!674545))

(declare-fun m!674547 () Bool)

(assert (=> b!719064 m!674547))

(assert (=> b!719064 m!674547))

(assert (=> b!719064 m!674545))

(declare-fun m!674549 () Bool)

(assert (=> b!719064 m!674549))

(declare-fun m!674551 () Bool)

(assert (=> b!719062 m!674551))

(declare-fun m!674553 () Bool)

(assert (=> b!719061 m!674553))

(declare-fun m!674555 () Bool)

(assert (=> b!719065 m!674555))

(assert (=> b!719063 m!674545))

(assert (=> b!719063 m!674545))

(declare-fun m!674557 () Bool)

(assert (=> b!719063 m!674557))

(check-sat (not b!719066) (not b!719061) (not start!64032) (not b!719063) (not b!719059) (not b!719062) (not b!719064) (not b!719065))
(check-sat)
