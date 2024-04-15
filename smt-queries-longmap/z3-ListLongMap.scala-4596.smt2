; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64070 () Bool)

(assert start!64070)

(declare-fun res!482166 () Bool)

(declare-fun e!403687 () Bool)

(assert (=> start!64070 (=> (not res!482166) (not e!403687))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64070 (= res!482166 (validMask!0 mask!3328))))

(assert (=> start!64070 e!403687))

(assert (=> start!64070 true))

(declare-datatypes ((array!40782 0))(
  ( (array!40783 (arr!19517 (Array (_ BitVec 32) (_ BitVec 64))) (size!19938 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40782)

(declare-fun array_inv!15400 (array!40782) Bool)

(assert (=> start!64070 (array_inv!15400 a!3186)))

(declare-fun b!719628 () Bool)

(declare-fun res!482168 () Bool)

(declare-fun e!403686 () Bool)

(assert (=> b!719628 (=> (not res!482168) (not e!403686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40782 (_ BitVec 32)) Bool)

(assert (=> b!719628 (= res!482168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719629 () Bool)

(declare-fun res!482165 () Bool)

(assert (=> b!719629 (=> (not res!482165) (not e!403686))))

(declare-datatypes ((List!13558 0))(
  ( (Nil!13555) (Cons!13554 (h!14602 (_ BitVec 64)) (t!19864 List!13558)) )
))
(declare-fun arrayNoDuplicates!0 (array!40782 (_ BitVec 32) List!13558) Bool)

(assert (=> b!719629 (= res!482165 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13555))))

(declare-fun b!719630 () Bool)

(declare-fun res!482163 () Bool)

(assert (=> b!719630 (=> (not res!482163) (not e!403687))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719630 (= res!482163 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719631 () Bool)

(declare-fun res!482164 () Bool)

(assert (=> b!719631 (=> (not res!482164) (not e!403686))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!719631 (= res!482164 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19938 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19938 a!3186))))))

(declare-fun b!719632 () Bool)

(declare-fun res!482167 () Bool)

(assert (=> b!719632 (=> (not res!482167) (not e!403687))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719632 (= res!482167 (and (= (size!19938 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19938 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19938 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719633 () Bool)

(assert (=> b!719633 (= e!403686 false)))

(declare-datatypes ((SeekEntryResult!7114 0))(
  ( (MissingZero!7114 (index!30824 (_ BitVec 32))) (Found!7114 (index!30825 (_ BitVec 32))) (Intermediate!7114 (undefined!7926 Bool) (index!30826 (_ BitVec 32)) (x!61836 (_ BitVec 32))) (Undefined!7114) (MissingVacant!7114 (index!30827 (_ BitVec 32))) )
))
(declare-fun lt!319426 () SeekEntryResult!7114)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40782 (_ BitVec 32)) SeekEntryResult!7114)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719633 (= lt!319426 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19517 a!3186) j!159) mask!3328) (select (arr!19517 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719634 () Bool)

(declare-fun res!482162 () Bool)

(assert (=> b!719634 (=> (not res!482162) (not e!403687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719634 (= res!482162 (validKeyInArray!0 k0!2102))))

(declare-fun b!719635 () Bool)

(declare-fun res!482169 () Bool)

(assert (=> b!719635 (=> (not res!482169) (not e!403687))))

(assert (=> b!719635 (= res!482169 (validKeyInArray!0 (select (arr!19517 a!3186) j!159)))))

(declare-fun b!719636 () Bool)

(assert (=> b!719636 (= e!403687 e!403686)))

(declare-fun res!482161 () Bool)

(assert (=> b!719636 (=> (not res!482161) (not e!403686))))

(declare-fun lt!319427 () SeekEntryResult!7114)

(assert (=> b!719636 (= res!482161 (or (= lt!319427 (MissingZero!7114 i!1173)) (= lt!319427 (MissingVacant!7114 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40782 (_ BitVec 32)) SeekEntryResult!7114)

(assert (=> b!719636 (= lt!319427 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64070 res!482166) b!719632))

(assert (= (and b!719632 res!482167) b!719635))

(assert (= (and b!719635 res!482169) b!719634))

(assert (= (and b!719634 res!482162) b!719630))

(assert (= (and b!719630 res!482163) b!719636))

(assert (= (and b!719636 res!482161) b!719628))

(assert (= (and b!719628 res!482168) b!719629))

(assert (= (and b!719629 res!482165) b!719631))

(assert (= (and b!719631 res!482164) b!719633))

(declare-fun m!674441 () Bool)

(assert (=> b!719628 m!674441))

(declare-fun m!674443 () Bool)

(assert (=> start!64070 m!674443))

(declare-fun m!674445 () Bool)

(assert (=> start!64070 m!674445))

(declare-fun m!674447 () Bool)

(assert (=> b!719634 m!674447))

(declare-fun m!674449 () Bool)

(assert (=> b!719633 m!674449))

(assert (=> b!719633 m!674449))

(declare-fun m!674451 () Bool)

(assert (=> b!719633 m!674451))

(assert (=> b!719633 m!674451))

(assert (=> b!719633 m!674449))

(declare-fun m!674453 () Bool)

(assert (=> b!719633 m!674453))

(assert (=> b!719635 m!674449))

(assert (=> b!719635 m!674449))

(declare-fun m!674455 () Bool)

(assert (=> b!719635 m!674455))

(declare-fun m!674457 () Bool)

(assert (=> b!719629 m!674457))

(declare-fun m!674459 () Bool)

(assert (=> b!719630 m!674459))

(declare-fun m!674461 () Bool)

(assert (=> b!719636 m!674461))

(check-sat (not b!719634) (not b!719633) (not b!719628) (not start!64070) (not b!719635) (not b!719630) (not b!719629) (not b!719636))
(check-sat)
