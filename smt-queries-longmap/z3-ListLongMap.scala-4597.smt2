; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64076 () Bool)

(assert start!64076)

(declare-fun b!719709 () Bool)

(declare-fun res!482249 () Bool)

(declare-fun e!403713 () Bool)

(assert (=> b!719709 (=> (not res!482249) (not e!403713))))

(declare-datatypes ((array!40788 0))(
  ( (array!40789 (arr!19520 (Array (_ BitVec 32) (_ BitVec 64))) (size!19941 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40788)

(declare-datatypes ((List!13561 0))(
  ( (Nil!13558) (Cons!13557 (h!14605 (_ BitVec 64)) (t!19867 List!13561)) )
))
(declare-fun arrayNoDuplicates!0 (array!40788 (_ BitVec 32) List!13561) Bool)

(assert (=> b!719709 (= res!482249 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13558))))

(declare-fun b!719710 () Bool)

(declare-fun res!482245 () Bool)

(assert (=> b!719710 (=> (not res!482245) (not e!403713))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40788 (_ BitVec 32)) Bool)

(assert (=> b!719710 (= res!482245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719711 () Bool)

(declare-fun res!482244 () Bool)

(declare-fun e!403712 () Bool)

(assert (=> b!719711 (=> (not res!482244) (not e!403712))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719711 (= res!482244 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719713 () Bool)

(declare-fun res!482242 () Bool)

(assert (=> b!719713 (=> (not res!482242) (not e!403712))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719713 (= res!482242 (and (= (size!19941 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19941 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19941 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719714 () Bool)

(assert (=> b!719714 (= e!403713 false)))

(declare-datatypes ((SeekEntryResult!7117 0))(
  ( (MissingZero!7117 (index!30836 (_ BitVec 32))) (Found!7117 (index!30837 (_ BitVec 32))) (Intermediate!7117 (undefined!7929 Bool) (index!30838 (_ BitVec 32)) (x!61847 (_ BitVec 32))) (Undefined!7117) (MissingVacant!7117 (index!30839 (_ BitVec 32))) )
))
(declare-fun lt!319444 () SeekEntryResult!7117)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40788 (_ BitVec 32)) SeekEntryResult!7117)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719714 (= lt!319444 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19520 a!3186) j!159) mask!3328) (select (arr!19520 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!482243 () Bool)

(assert (=> start!64076 (=> (not res!482243) (not e!403712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64076 (= res!482243 (validMask!0 mask!3328))))

(assert (=> start!64076 e!403712))

(assert (=> start!64076 true))

(declare-fun array_inv!15403 (array!40788) Bool)

(assert (=> start!64076 (array_inv!15403 a!3186)))

(declare-fun b!719712 () Bool)

(assert (=> b!719712 (= e!403712 e!403713)))

(declare-fun res!482250 () Bool)

(assert (=> b!719712 (=> (not res!482250) (not e!403713))))

(declare-fun lt!319445 () SeekEntryResult!7117)

(assert (=> b!719712 (= res!482250 (or (= lt!319445 (MissingZero!7117 i!1173)) (= lt!319445 (MissingVacant!7117 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40788 (_ BitVec 32)) SeekEntryResult!7117)

(assert (=> b!719712 (= lt!319445 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719715 () Bool)

(declare-fun res!482248 () Bool)

(assert (=> b!719715 (=> (not res!482248) (not e!403712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719715 (= res!482248 (validKeyInArray!0 (select (arr!19520 a!3186) j!159)))))

(declare-fun b!719716 () Bool)

(declare-fun res!482246 () Bool)

(assert (=> b!719716 (=> (not res!482246) (not e!403712))))

(assert (=> b!719716 (= res!482246 (validKeyInArray!0 k0!2102))))

(declare-fun b!719717 () Bool)

(declare-fun res!482247 () Bool)

(assert (=> b!719717 (=> (not res!482247) (not e!403713))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719717 (= res!482247 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19941 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19941 a!3186))))))

(assert (= (and start!64076 res!482243) b!719713))

(assert (= (and b!719713 res!482242) b!719715))

(assert (= (and b!719715 res!482248) b!719716))

(assert (= (and b!719716 res!482246) b!719711))

(assert (= (and b!719711 res!482244) b!719712))

(assert (= (and b!719712 res!482250) b!719710))

(assert (= (and b!719710 res!482245) b!719709))

(assert (= (and b!719709 res!482249) b!719717))

(assert (= (and b!719717 res!482247) b!719714))

(declare-fun m!674507 () Bool)

(assert (=> b!719714 m!674507))

(assert (=> b!719714 m!674507))

(declare-fun m!674509 () Bool)

(assert (=> b!719714 m!674509))

(assert (=> b!719714 m!674509))

(assert (=> b!719714 m!674507))

(declare-fun m!674511 () Bool)

(assert (=> b!719714 m!674511))

(declare-fun m!674513 () Bool)

(assert (=> b!719710 m!674513))

(declare-fun m!674515 () Bool)

(assert (=> start!64076 m!674515))

(declare-fun m!674517 () Bool)

(assert (=> start!64076 m!674517))

(declare-fun m!674519 () Bool)

(assert (=> b!719716 m!674519))

(declare-fun m!674521 () Bool)

(assert (=> b!719711 m!674521))

(declare-fun m!674523 () Bool)

(assert (=> b!719712 m!674523))

(declare-fun m!674525 () Bool)

(assert (=> b!719709 m!674525))

(assert (=> b!719715 m!674507))

(assert (=> b!719715 m!674507))

(declare-fun m!674527 () Bool)

(assert (=> b!719715 m!674527))

(check-sat (not b!719710) (not b!719712) (not b!719716) (not start!64076) (not b!719709) (not b!719714) (not b!719711) (not b!719715))
(check-sat)
