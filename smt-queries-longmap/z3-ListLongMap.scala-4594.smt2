; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64058 () Bool)

(assert start!64058)

(declare-fun res!481998 () Bool)

(declare-fun e!403632 () Bool)

(assert (=> start!64058 (=> (not res!481998) (not e!403632))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64058 (= res!481998 (validMask!0 mask!3328))))

(assert (=> start!64058 e!403632))

(assert (=> start!64058 true))

(declare-datatypes ((array!40770 0))(
  ( (array!40771 (arr!19511 (Array (_ BitVec 32) (_ BitVec 64))) (size!19932 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40770)

(declare-fun array_inv!15394 (array!40770) Bool)

(assert (=> start!64058 (array_inv!15394 a!3186)))

(declare-fun b!719457 () Bool)

(declare-fun res!481991 () Bool)

(assert (=> b!719457 (=> (not res!481991) (not e!403632))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719457 (= res!481991 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719458 () Bool)

(declare-fun res!481994 () Bool)

(assert (=> b!719458 (=> (not res!481994) (not e!403632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719458 (= res!481994 (validKeyInArray!0 k0!2102))))

(declare-fun b!719459 () Bool)

(declare-fun res!481996 () Bool)

(declare-fun e!403631 () Bool)

(assert (=> b!719459 (=> (not res!481996) (not e!403631))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719459 (= res!481996 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19932 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19932 a!3186))))))

(declare-fun b!719460 () Bool)

(declare-fun res!481990 () Bool)

(assert (=> b!719460 (=> (not res!481990) (not e!403631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40770 (_ BitVec 32)) Bool)

(assert (=> b!719460 (= res!481990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719461 () Bool)

(declare-fun res!481997 () Bool)

(assert (=> b!719461 (=> (not res!481997) (not e!403632))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719461 (= res!481997 (and (= (size!19932 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19932 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19932 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719462 () Bool)

(assert (=> b!719462 (= e!403631 false)))

(declare-datatypes ((SeekEntryResult!7108 0))(
  ( (MissingZero!7108 (index!30800 (_ BitVec 32))) (Found!7108 (index!30801 (_ BitVec 32))) (Intermediate!7108 (undefined!7920 Bool) (index!30802 (_ BitVec 32)) (x!61814 (_ BitVec 32))) (Undefined!7108) (MissingVacant!7108 (index!30803 (_ BitVec 32))) )
))
(declare-fun lt!319400 () SeekEntryResult!7108)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40770 (_ BitVec 32)) SeekEntryResult!7108)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719462 (= lt!319400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19511 a!3186) j!159) mask!3328) (select (arr!19511 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719463 () Bool)

(declare-fun res!481992 () Bool)

(assert (=> b!719463 (=> (not res!481992) (not e!403632))))

(assert (=> b!719463 (= res!481992 (validKeyInArray!0 (select (arr!19511 a!3186) j!159)))))

(declare-fun b!719464 () Bool)

(assert (=> b!719464 (= e!403632 e!403631)))

(declare-fun res!481993 () Bool)

(assert (=> b!719464 (=> (not res!481993) (not e!403631))))

(declare-fun lt!319399 () SeekEntryResult!7108)

(assert (=> b!719464 (= res!481993 (or (= lt!319399 (MissingZero!7108 i!1173)) (= lt!319399 (MissingVacant!7108 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40770 (_ BitVec 32)) SeekEntryResult!7108)

(assert (=> b!719464 (= lt!319399 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719465 () Bool)

(declare-fun res!481995 () Bool)

(assert (=> b!719465 (=> (not res!481995) (not e!403631))))

(declare-datatypes ((List!13552 0))(
  ( (Nil!13549) (Cons!13548 (h!14596 (_ BitVec 64)) (t!19858 List!13552)) )
))
(declare-fun arrayNoDuplicates!0 (array!40770 (_ BitVec 32) List!13552) Bool)

(assert (=> b!719465 (= res!481995 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13549))))

(assert (= (and start!64058 res!481998) b!719461))

(assert (= (and b!719461 res!481997) b!719463))

(assert (= (and b!719463 res!481992) b!719458))

(assert (= (and b!719458 res!481994) b!719457))

(assert (= (and b!719457 res!481991) b!719464))

(assert (= (and b!719464 res!481993) b!719460))

(assert (= (and b!719460 res!481990) b!719465))

(assert (= (and b!719465 res!481995) b!719459))

(assert (= (and b!719459 res!481996) b!719462))

(declare-fun m!674303 () Bool)

(assert (=> b!719464 m!674303))

(declare-fun m!674305 () Bool)

(assert (=> b!719462 m!674305))

(assert (=> b!719462 m!674305))

(declare-fun m!674307 () Bool)

(assert (=> b!719462 m!674307))

(assert (=> b!719462 m!674307))

(assert (=> b!719462 m!674305))

(declare-fun m!674309 () Bool)

(assert (=> b!719462 m!674309))

(declare-fun m!674311 () Bool)

(assert (=> b!719458 m!674311))

(assert (=> b!719463 m!674305))

(assert (=> b!719463 m!674305))

(declare-fun m!674313 () Bool)

(assert (=> b!719463 m!674313))

(declare-fun m!674315 () Bool)

(assert (=> b!719465 m!674315))

(declare-fun m!674317 () Bool)

(assert (=> b!719460 m!674317))

(declare-fun m!674319 () Bool)

(assert (=> start!64058 m!674319))

(declare-fun m!674321 () Bool)

(assert (=> start!64058 m!674321))

(declare-fun m!674323 () Bool)

(assert (=> b!719457 m!674323))

(check-sat (not b!719464) (not b!719462) (not b!719460) (not start!64058) (not b!719465) (not b!719457) (not b!719463) (not b!719458))
(check-sat)
