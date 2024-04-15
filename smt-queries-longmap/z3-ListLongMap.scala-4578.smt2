; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63914 () Bool)

(assert start!63914)

(declare-fun b!717972 () Bool)

(declare-fun res!480593 () Bool)

(declare-fun e!403092 () Bool)

(assert (=> b!717972 (=> (not res!480593) (not e!403092))))

(declare-datatypes ((array!40671 0))(
  ( (array!40672 (arr!19463 (Array (_ BitVec 32) (_ BitVec 64))) (size!19884 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40671)

(declare-datatypes ((List!13504 0))(
  ( (Nil!13501) (Cons!13500 (h!14545 (_ BitVec 64)) (t!19810 List!13504)) )
))
(declare-fun arrayNoDuplicates!0 (array!40671 (_ BitVec 32) List!13504) Bool)

(assert (=> b!717972 (= res!480593 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13501))))

(declare-fun b!717973 () Bool)

(assert (=> b!717973 (= e!403092 false)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!319076 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!717973 (= lt!319076 (toIndex!0 (select (arr!19463 a!3186) j!159) mask!3328))))

(declare-fun b!717974 () Bool)

(declare-fun res!480594 () Bool)

(declare-fun e!403093 () Bool)

(assert (=> b!717974 (=> (not res!480594) (not e!403093))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717974 (= res!480594 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717975 () Bool)

(declare-fun res!480595 () Bool)

(assert (=> b!717975 (=> (not res!480595) (not e!403093))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717975 (= res!480595 (and (= (size!19884 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19884 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19884 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717976 () Bool)

(declare-fun res!480596 () Bool)

(assert (=> b!717976 (=> (not res!480596) (not e!403093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717976 (= res!480596 (validKeyInArray!0 k0!2102))))

(declare-fun b!717977 () Bool)

(assert (=> b!717977 (= e!403093 e!403092)))

(declare-fun res!480592 () Bool)

(assert (=> b!717977 (=> (not res!480592) (not e!403092))))

(declare-datatypes ((SeekEntryResult!7060 0))(
  ( (MissingZero!7060 (index!30608 (_ BitVec 32))) (Found!7060 (index!30609 (_ BitVec 32))) (Intermediate!7060 (undefined!7872 Bool) (index!30610 (_ BitVec 32)) (x!61635 (_ BitVec 32))) (Undefined!7060) (MissingVacant!7060 (index!30611 (_ BitVec 32))) )
))
(declare-fun lt!319075 () SeekEntryResult!7060)

(assert (=> b!717977 (= res!480592 (or (= lt!319075 (MissingZero!7060 i!1173)) (= lt!319075 (MissingVacant!7060 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40671 (_ BitVec 32)) SeekEntryResult!7060)

(assert (=> b!717977 (= lt!319075 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!717978 () Bool)

(declare-fun res!480598 () Bool)

(assert (=> b!717978 (=> (not res!480598) (not e!403093))))

(assert (=> b!717978 (= res!480598 (validKeyInArray!0 (select (arr!19463 a!3186) j!159)))))

(declare-fun b!717979 () Bool)

(declare-fun res!480597 () Bool)

(assert (=> b!717979 (=> (not res!480597) (not e!403092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40671 (_ BitVec 32)) Bool)

(assert (=> b!717979 (= res!480597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!717980 () Bool)

(declare-fun res!480599 () Bool)

(assert (=> b!717980 (=> (not res!480599) (not e!403092))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!717980 (= res!480599 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19884 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19884 a!3186))))))

(declare-fun res!480600 () Bool)

(assert (=> start!63914 (=> (not res!480600) (not e!403093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63914 (= res!480600 (validMask!0 mask!3328))))

(assert (=> start!63914 e!403093))

(assert (=> start!63914 true))

(declare-fun array_inv!15346 (array!40671) Bool)

(assert (=> start!63914 (array_inv!15346 a!3186)))

(assert (= (and start!63914 res!480600) b!717975))

(assert (= (and b!717975 res!480595) b!717978))

(assert (= (and b!717978 res!480598) b!717976))

(assert (= (and b!717976 res!480596) b!717974))

(assert (= (and b!717974 res!480594) b!717977))

(assert (= (and b!717977 res!480592) b!717979))

(assert (= (and b!717979 res!480597) b!717972))

(assert (= (and b!717972 res!480593) b!717980))

(assert (= (and b!717980 res!480599) b!717973))

(declare-fun m!673163 () Bool)

(assert (=> b!717973 m!673163))

(assert (=> b!717973 m!673163))

(declare-fun m!673165 () Bool)

(assert (=> b!717973 m!673165))

(declare-fun m!673167 () Bool)

(assert (=> b!717976 m!673167))

(declare-fun m!673169 () Bool)

(assert (=> b!717974 m!673169))

(declare-fun m!673171 () Bool)

(assert (=> b!717979 m!673171))

(declare-fun m!673173 () Bool)

(assert (=> b!717977 m!673173))

(assert (=> b!717978 m!673163))

(assert (=> b!717978 m!673163))

(declare-fun m!673175 () Bool)

(assert (=> b!717978 m!673175))

(declare-fun m!673177 () Bool)

(assert (=> start!63914 m!673177))

(declare-fun m!673179 () Bool)

(assert (=> start!63914 m!673179))

(declare-fun m!673181 () Bool)

(assert (=> b!717972 m!673181))

(check-sat (not b!717972) (not b!717976) (not b!717973) (not start!63914) (not b!717978) (not b!717974) (not b!717977) (not b!717979))
(check-sat)
