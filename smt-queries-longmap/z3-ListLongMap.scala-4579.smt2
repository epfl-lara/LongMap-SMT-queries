; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63920 () Bool)

(assert start!63920)

(declare-fun b!718053 () Bool)

(declare-fun res!480676 () Bool)

(declare-fun e!403120 () Bool)

(assert (=> b!718053 (=> (not res!480676) (not e!403120))))

(declare-datatypes ((array!40677 0))(
  ( (array!40678 (arr!19466 (Array (_ BitVec 32) (_ BitVec 64))) (size!19887 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40677)

(declare-datatypes ((List!13507 0))(
  ( (Nil!13504) (Cons!13503 (h!14548 (_ BitVec 64)) (t!19813 List!13507)) )
))
(declare-fun arrayNoDuplicates!0 (array!40677 (_ BitVec 32) List!13507) Bool)

(assert (=> b!718053 (= res!480676 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13504))))

(declare-fun b!718054 () Bool)

(declare-fun res!480677 () Bool)

(assert (=> b!718054 (=> (not res!480677) (not e!403120))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718054 (= res!480677 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19887 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19887 a!3186))))))

(declare-fun b!718056 () Bool)

(declare-fun e!403118 () Bool)

(assert (=> b!718056 (= e!403118 e!403120)))

(declare-fun res!480679 () Bool)

(assert (=> b!718056 (=> (not res!480679) (not e!403120))))

(declare-datatypes ((SeekEntryResult!7063 0))(
  ( (MissingZero!7063 (index!30620 (_ BitVec 32))) (Found!7063 (index!30621 (_ BitVec 32))) (Intermediate!7063 (undefined!7875 Bool) (index!30622 (_ BitVec 32)) (x!61646 (_ BitVec 32))) (Undefined!7063) (MissingVacant!7063 (index!30623 (_ BitVec 32))) )
))
(declare-fun lt!319093 () SeekEntryResult!7063)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718056 (= res!480679 (or (= lt!319093 (MissingZero!7063 i!1173)) (= lt!319093 (MissingVacant!7063 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40677 (_ BitVec 32)) SeekEntryResult!7063)

(assert (=> b!718056 (= lt!319093 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!718057 () Bool)

(declare-fun res!480678 () Bool)

(assert (=> b!718057 (=> (not res!480678) (not e!403120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40677 (_ BitVec 32)) Bool)

(assert (=> b!718057 (= res!480678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718058 () Bool)

(declare-fun res!480681 () Bool)

(assert (=> b!718058 (=> (not res!480681) (not e!403118))))

(declare-fun arrayContainsKey!0 (array!40677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718058 (= res!480681 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718059 () Bool)

(declare-fun res!480673 () Bool)

(assert (=> b!718059 (=> (not res!480673) (not e!403118))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!718059 (= res!480673 (and (= (size!19887 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19887 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19887 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!480674 () Bool)

(assert (=> start!63920 (=> (not res!480674) (not e!403118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63920 (= res!480674 (validMask!0 mask!3328))))

(assert (=> start!63920 e!403118))

(assert (=> start!63920 true))

(declare-fun array_inv!15349 (array!40677) Bool)

(assert (=> start!63920 (array_inv!15349 a!3186)))

(declare-fun b!718055 () Bool)

(declare-fun res!480680 () Bool)

(assert (=> b!718055 (=> (not res!480680) (not e!403118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718055 (= res!480680 (validKeyInArray!0 (select (arr!19466 a!3186) j!159)))))

(declare-fun b!718060 () Bool)

(declare-fun res!480675 () Bool)

(assert (=> b!718060 (=> (not res!480675) (not e!403118))))

(assert (=> b!718060 (= res!480675 (validKeyInArray!0 k0!2102))))

(declare-fun b!718061 () Bool)

(assert (=> b!718061 (= e!403120 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun lt!319094 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718061 (= lt!319094 (toIndex!0 (select (arr!19466 a!3186) j!159) mask!3328))))

(assert (= (and start!63920 res!480674) b!718059))

(assert (= (and b!718059 res!480673) b!718055))

(assert (= (and b!718055 res!480680) b!718060))

(assert (= (and b!718060 res!480675) b!718058))

(assert (= (and b!718058 res!480681) b!718056))

(assert (= (and b!718056 res!480679) b!718057))

(assert (= (and b!718057 res!480678) b!718053))

(assert (= (and b!718053 res!480676) b!718054))

(assert (= (and b!718054 res!480677) b!718061))

(declare-fun m!673223 () Bool)

(assert (=> b!718055 m!673223))

(assert (=> b!718055 m!673223))

(declare-fun m!673225 () Bool)

(assert (=> b!718055 m!673225))

(assert (=> b!718061 m!673223))

(assert (=> b!718061 m!673223))

(declare-fun m!673227 () Bool)

(assert (=> b!718061 m!673227))

(declare-fun m!673229 () Bool)

(assert (=> start!63920 m!673229))

(declare-fun m!673231 () Bool)

(assert (=> start!63920 m!673231))

(declare-fun m!673233 () Bool)

(assert (=> b!718058 m!673233))

(declare-fun m!673235 () Bool)

(assert (=> b!718053 m!673235))

(declare-fun m!673237 () Bool)

(assert (=> b!718060 m!673237))

(declare-fun m!673239 () Bool)

(assert (=> b!718057 m!673239))

(declare-fun m!673241 () Bool)

(assert (=> b!718056 m!673241))

(check-sat (not b!718055) (not b!718053) (not b!718056) (not b!718058) (not b!718060) (not b!718061) (not start!63920) (not b!718057))
(check-sat)
