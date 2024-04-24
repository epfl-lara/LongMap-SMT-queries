; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64008 () Bool)

(assert start!64008)

(declare-fun b!718712 () Bool)

(declare-fun res!481051 () Bool)

(declare-fun e!403526 () Bool)

(assert (=> b!718712 (=> (not res!481051) (not e!403526))))

(declare-datatypes ((array!40681 0))(
  ( (array!40682 (arr!19465 (Array (_ BitVec 32) (_ BitVec 64))) (size!19885 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40681)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!718712 (= res!481051 (and (= (size!19885 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19885 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19885 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718713 () Bool)

(declare-fun e!403525 () Bool)

(assert (=> b!718713 (= e!403525 false)))

(declare-fun lt!319481 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718713 (= lt!319481 (toIndex!0 (select (arr!19465 a!3186) j!159) mask!3328))))

(declare-fun res!481044 () Bool)

(assert (=> start!64008 (=> (not res!481044) (not e!403526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64008 (= res!481044 (validMask!0 mask!3328))))

(assert (=> start!64008 e!403526))

(assert (=> start!64008 true))

(declare-fun array_inv!15324 (array!40681) Bool)

(assert (=> start!64008 (array_inv!15324 a!3186)))

(declare-fun b!718714 () Bool)

(declare-fun res!481047 () Bool)

(assert (=> b!718714 (=> (not res!481047) (not e!403525))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718714 (= res!481047 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19885 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19885 a!3186))))))

(declare-fun b!718715 () Bool)

(declare-fun res!481043 () Bool)

(assert (=> b!718715 (=> (not res!481043) (not e!403526))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718715 (= res!481043 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718716 () Bool)

(declare-fun res!481048 () Bool)

(assert (=> b!718716 (=> (not res!481048) (not e!403525))))

(declare-datatypes ((List!13374 0))(
  ( (Nil!13371) (Cons!13370 (h!14418 (_ BitVec 64)) (t!19681 List!13374)) )
))
(declare-fun arrayNoDuplicates!0 (array!40681 (_ BitVec 32) List!13374) Bool)

(assert (=> b!718716 (= res!481048 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13371))))

(declare-fun b!718717 () Bool)

(declare-fun res!481046 () Bool)

(assert (=> b!718717 (=> (not res!481046) (not e!403525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40681 (_ BitVec 32)) Bool)

(assert (=> b!718717 (= res!481046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718718 () Bool)

(assert (=> b!718718 (= e!403526 e!403525)))

(declare-fun res!481049 () Bool)

(assert (=> b!718718 (=> (not res!481049) (not e!403525))))

(declare-datatypes ((SeekEntryResult!7021 0))(
  ( (MissingZero!7021 (index!30452 (_ BitVec 32))) (Found!7021 (index!30453 (_ BitVec 32))) (Intermediate!7021 (undefined!7833 Bool) (index!30454 (_ BitVec 32)) (x!61620 (_ BitVec 32))) (Undefined!7021) (MissingVacant!7021 (index!30455 (_ BitVec 32))) )
))
(declare-fun lt!319482 () SeekEntryResult!7021)

(assert (=> b!718718 (= res!481049 (or (= lt!319482 (MissingZero!7021 i!1173)) (= lt!319482 (MissingVacant!7021 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40681 (_ BitVec 32)) SeekEntryResult!7021)

(assert (=> b!718718 (= lt!319482 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!718719 () Bool)

(declare-fun res!481045 () Bool)

(assert (=> b!718719 (=> (not res!481045) (not e!403526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718719 (= res!481045 (validKeyInArray!0 (select (arr!19465 a!3186) j!159)))))

(declare-fun b!718720 () Bool)

(declare-fun res!481050 () Bool)

(assert (=> b!718720 (=> (not res!481050) (not e!403526))))

(assert (=> b!718720 (= res!481050 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64008 res!481044) b!718712))

(assert (= (and b!718712 res!481051) b!718719))

(assert (= (and b!718719 res!481045) b!718720))

(assert (= (and b!718720 res!481050) b!718715))

(assert (= (and b!718715 res!481043) b!718718))

(assert (= (and b!718718 res!481049) b!718717))

(assert (= (and b!718717 res!481046) b!718716))

(assert (= (and b!718716 res!481048) b!718714))

(assert (= (and b!718714 res!481047) b!718713))

(declare-fun m!674889 () Bool)

(assert (=> start!64008 m!674889))

(declare-fun m!674891 () Bool)

(assert (=> start!64008 m!674891))

(declare-fun m!674893 () Bool)

(assert (=> b!718717 m!674893))

(declare-fun m!674895 () Bool)

(assert (=> b!718716 m!674895))

(declare-fun m!674897 () Bool)

(assert (=> b!718713 m!674897))

(assert (=> b!718713 m!674897))

(declare-fun m!674899 () Bool)

(assert (=> b!718713 m!674899))

(declare-fun m!674901 () Bool)

(assert (=> b!718720 m!674901))

(assert (=> b!718719 m!674897))

(assert (=> b!718719 m!674897))

(declare-fun m!674903 () Bool)

(assert (=> b!718719 m!674903))

(declare-fun m!674905 () Bool)

(assert (=> b!718718 m!674905))

(declare-fun m!674907 () Bool)

(assert (=> b!718715 m!674907))

(check-sat (not b!718717) (not b!718715) (not b!718716) (not b!718720) (not start!64008) (not b!718719) (not b!718718) (not b!718713))
(check-sat)
