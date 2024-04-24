; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64104 () Bool)

(assert start!64104)

(declare-fun b!719531 () Bool)

(declare-fun res!481775 () Bool)

(declare-fun e!403850 () Bool)

(assert (=> b!719531 (=> (not res!481775) (not e!403850))))

(declare-datatypes ((array!40732 0))(
  ( (array!40733 (arr!19489 (Array (_ BitVec 32) (_ BitVec 64))) (size!19909 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40732)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40732 (_ BitVec 32)) Bool)

(assert (=> b!719531 (= res!481775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719532 () Bool)

(declare-fun e!403851 () Bool)

(assert (=> b!719532 (= e!403851 e!403850)))

(declare-fun res!481783 () Bool)

(assert (=> b!719532 (=> (not res!481783) (not e!403850))))

(declare-datatypes ((SeekEntryResult!7045 0))(
  ( (MissingZero!7045 (index!30548 (_ BitVec 32))) (Found!7045 (index!30549 (_ BitVec 32))) (Intermediate!7045 (undefined!7857 Bool) (index!30550 (_ BitVec 32)) (x!61711 (_ BitVec 32))) (Undefined!7045) (MissingVacant!7045 (index!30551 (_ BitVec 32))) )
))
(declare-fun lt!319679 () SeekEntryResult!7045)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719532 (= res!481783 (or (= lt!319679 (MissingZero!7045 i!1173)) (= lt!319679 (MissingVacant!7045 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40732 (_ BitVec 32)) SeekEntryResult!7045)

(assert (=> b!719532 (= lt!319679 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719533 () Bool)

(declare-fun res!481777 () Bool)

(assert (=> b!719533 (=> (not res!481777) (not e!403851))))

(declare-fun arrayContainsKey!0 (array!40732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719533 (= res!481777 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!481779 () Bool)

(assert (=> start!64104 (=> (not res!481779) (not e!403851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64104 (= res!481779 (validMask!0 mask!3328))))

(assert (=> start!64104 e!403851))

(assert (=> start!64104 true))

(declare-fun array_inv!15348 (array!40732) Bool)

(assert (=> start!64104 (array_inv!15348 a!3186)))

(declare-fun b!719534 () Bool)

(declare-fun res!481778 () Bool)

(assert (=> b!719534 (=> (not res!481778) (not e!403850))))

(declare-datatypes ((List!13398 0))(
  ( (Nil!13395) (Cons!13394 (h!14445 (_ BitVec 64)) (t!19705 List!13398)) )
))
(declare-fun arrayNoDuplicates!0 (array!40732 (_ BitVec 32) List!13398) Bool)

(assert (=> b!719534 (= res!481778 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13395))))

(declare-fun b!719535 () Bool)

(declare-fun res!481782 () Bool)

(assert (=> b!719535 (=> (not res!481782) (not e!403851))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719535 (= res!481782 (and (= (size!19909 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19909 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19909 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719536 () Bool)

(declare-fun res!481776 () Bool)

(assert (=> b!719536 (=> (not res!481776) (not e!403850))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719536 (= res!481776 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19909 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19909 a!3186))))))

(declare-fun b!719537 () Bool)

(assert (=> b!719537 (= e!403850 false)))

(declare-fun lt!319680 () SeekEntryResult!7045)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40732 (_ BitVec 32)) SeekEntryResult!7045)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719537 (= lt!319680 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19489 a!3186) j!159) mask!3328) (select (arr!19489 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719538 () Bool)

(declare-fun res!481781 () Bool)

(assert (=> b!719538 (=> (not res!481781) (not e!403851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719538 (= res!481781 (validKeyInArray!0 (select (arr!19489 a!3186) j!159)))))

(declare-fun b!719539 () Bool)

(declare-fun res!481780 () Bool)

(assert (=> b!719539 (=> (not res!481780) (not e!403851))))

(assert (=> b!719539 (= res!481780 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64104 res!481779) b!719535))

(assert (= (and b!719535 res!481782) b!719538))

(assert (= (and b!719538 res!481781) b!719539))

(assert (= (and b!719539 res!481780) b!719533))

(assert (= (and b!719533 res!481777) b!719532))

(assert (= (and b!719532 res!481783) b!719531))

(assert (= (and b!719531 res!481775) b!719534))

(assert (= (and b!719534 res!481778) b!719536))

(assert (= (and b!719536 res!481776) b!719537))

(declare-fun m!675501 () Bool)

(assert (=> b!719538 m!675501))

(assert (=> b!719538 m!675501))

(declare-fun m!675503 () Bool)

(assert (=> b!719538 m!675503))

(declare-fun m!675505 () Bool)

(assert (=> start!64104 m!675505))

(declare-fun m!675507 () Bool)

(assert (=> start!64104 m!675507))

(assert (=> b!719537 m!675501))

(assert (=> b!719537 m!675501))

(declare-fun m!675509 () Bool)

(assert (=> b!719537 m!675509))

(assert (=> b!719537 m!675509))

(assert (=> b!719537 m!675501))

(declare-fun m!675511 () Bool)

(assert (=> b!719537 m!675511))

(declare-fun m!675513 () Bool)

(assert (=> b!719532 m!675513))

(declare-fun m!675515 () Bool)

(assert (=> b!719531 m!675515))

(declare-fun m!675517 () Bool)

(assert (=> b!719539 m!675517))

(declare-fun m!675519 () Bool)

(assert (=> b!719534 m!675519))

(declare-fun m!675521 () Bool)

(assert (=> b!719533 m!675521))

(check-sat (not b!719534) (not b!719531) (not b!719537) (not b!719538) (not b!719539) (not start!64104) (not b!719533) (not b!719532))
(check-sat)
