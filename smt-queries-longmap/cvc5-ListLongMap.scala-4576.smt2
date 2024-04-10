; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63880 () Bool)

(assert start!63880)

(declare-fun b!717923 () Bool)

(declare-fun res!480496 () Bool)

(declare-fun e!403083 () Bool)

(assert (=> b!717923 (=> (not res!480496) (not e!403083))))

(declare-datatypes ((array!40659 0))(
  ( (array!40660 (arr!19458 (Array (_ BitVec 32) (_ BitVec 64))) (size!19879 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40659)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717923 (= res!480496 (validKeyInArray!0 (select (arr!19458 a!3186) j!159)))))

(declare-fun b!717924 () Bool)

(declare-fun res!480499 () Bool)

(assert (=> b!717924 (=> (not res!480499) (not e!403083))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!717924 (= res!480499 (validKeyInArray!0 k!2102))))

(declare-fun b!717925 () Bool)

(declare-fun res!480498 () Bool)

(declare-fun e!403084 () Bool)

(assert (=> b!717925 (=> (not res!480498) (not e!403084))))

(declare-datatypes ((List!13460 0))(
  ( (Nil!13457) (Cons!13456 (h!14501 (_ BitVec 64)) (t!19775 List!13460)) )
))
(declare-fun arrayNoDuplicates!0 (array!40659 (_ BitVec 32) List!13460) Bool)

(assert (=> b!717925 (= res!480498 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13457))))

(declare-fun b!717926 () Bool)

(declare-fun res!480500 () Bool)

(assert (=> b!717926 (=> (not res!480500) (not e!403084))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40659 (_ BitVec 32)) Bool)

(assert (=> b!717926 (= res!480500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!717928 () Bool)

(declare-fun res!480495 () Bool)

(assert (=> b!717928 (=> (not res!480495) (not e!403083))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717928 (= res!480495 (and (= (size!19879 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19879 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19879 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717929 () Bool)

(assert (=> b!717929 (= e!403083 e!403084)))

(declare-fun res!480493 () Bool)

(assert (=> b!717929 (=> (not res!480493) (not e!403084))))

(declare-datatypes ((SeekEntryResult!7058 0))(
  ( (MissingZero!7058 (index!30600 (_ BitVec 32))) (Found!7058 (index!30601 (_ BitVec 32))) (Intermediate!7058 (undefined!7870 Bool) (index!30602 (_ BitVec 32)) (x!61622 (_ BitVec 32))) (Undefined!7058) (MissingVacant!7058 (index!30603 (_ BitVec 32))) )
))
(declare-fun lt!319241 () SeekEntryResult!7058)

(assert (=> b!717929 (= res!480493 (or (= lt!319241 (MissingZero!7058 i!1173)) (= lt!319241 (MissingVacant!7058 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40659 (_ BitVec 32)) SeekEntryResult!7058)

(assert (=> b!717929 (= lt!319241 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717930 () Bool)

(declare-fun res!480497 () Bool)

(assert (=> b!717930 (=> (not res!480497) (not e!403083))))

(declare-fun arrayContainsKey!0 (array!40659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717930 (= res!480497 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!717927 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!717927 (= e!403084 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19879 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19879 a!3186)) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun res!480494 () Bool)

(assert (=> start!63880 (=> (not res!480494) (not e!403083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63880 (= res!480494 (validMask!0 mask!3328))))

(assert (=> start!63880 e!403083))

(assert (=> start!63880 true))

(declare-fun array_inv!15254 (array!40659) Bool)

(assert (=> start!63880 (array_inv!15254 a!3186)))

(assert (= (and start!63880 res!480494) b!717928))

(assert (= (and b!717928 res!480495) b!717923))

(assert (= (and b!717923 res!480496) b!717924))

(assert (= (and b!717924 res!480499) b!717930))

(assert (= (and b!717930 res!480497) b!717929))

(assert (= (and b!717929 res!480493) b!717926))

(assert (= (and b!717926 res!480500) b!717925))

(assert (= (and b!717925 res!480498) b!717927))

(declare-fun m!673717 () Bool)

(assert (=> b!717929 m!673717))

(declare-fun m!673719 () Bool)

(assert (=> b!717923 m!673719))

(assert (=> b!717923 m!673719))

(declare-fun m!673721 () Bool)

(assert (=> b!717923 m!673721))

(declare-fun m!673723 () Bool)

(assert (=> b!717930 m!673723))

(declare-fun m!673725 () Bool)

(assert (=> b!717926 m!673725))

(declare-fun m!673727 () Bool)

(assert (=> b!717925 m!673727))

(declare-fun m!673729 () Bool)

(assert (=> b!717924 m!673729))

(declare-fun m!673731 () Bool)

(assert (=> start!63880 m!673731))

(declare-fun m!673733 () Bool)

(assert (=> start!63880 m!673733))

(push 1)

(assert (not b!717930))

(assert (not b!717926))

(assert (not start!63880))

(assert (not b!717925))

(assert (not b!717929))

