; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64616 () Bool)

(assert start!64616)

(declare-fun b!727680 () Bool)

(declare-fun res!488396 () Bool)

(declare-fun e!407359 () Bool)

(assert (=> b!727680 (=> (not res!488396) (not e!407359))))

(declare-datatypes ((array!41082 0))(
  ( (array!41083 (arr!19661 (Array (_ BitVec 32) (_ BitVec 64))) (size!20082 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41082)

(declare-datatypes ((List!13702 0))(
  ( (Nil!13699) (Cons!13698 (h!14758 (_ BitVec 64)) (t!20008 List!13702)) )
))
(declare-fun arrayNoDuplicates!0 (array!41082 (_ BitVec 32) List!13702) Bool)

(assert (=> b!727680 (= res!488396 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13699))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7258 0))(
  ( (MissingZero!7258 (index!31400 (_ BitVec 32))) (Found!7258 (index!31401 (_ BitVec 32))) (Intermediate!7258 (undefined!8070 Bool) (index!31402 (_ BitVec 32)) (x!62403 (_ BitVec 32))) (Undefined!7258) (MissingVacant!7258 (index!31403 (_ BitVec 32))) )
))
(declare-fun lt!322175 () SeekEntryResult!7258)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!727681 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!407356 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41082 (_ BitVec 32)) SeekEntryResult!7258)

(assert (=> b!727681 (= e!407356 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19661 a!3186) j!159) a!3186 mask!3328) lt!322175))))

(declare-fun b!727682 () Bool)

(declare-fun e!407357 () Bool)

(declare-fun e!407358 () Bool)

(assert (=> b!727682 (= e!407357 e!407358)))

(declare-fun res!488402 () Bool)

(assert (=> b!727682 (=> (not res!488402) (not e!407358))))

(declare-fun lt!322170 () SeekEntryResult!7258)

(declare-fun lt!322172 () SeekEntryResult!7258)

(assert (=> b!727682 (= res!488402 (= lt!322170 lt!322172))))

(declare-fun lt!322171 () array!41082)

(declare-fun lt!322173 () (_ BitVec 64))

(assert (=> b!727682 (= lt!322172 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322173 lt!322171 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727682 (= lt!322170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322173 mask!3328) lt!322173 lt!322171 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!727682 (= lt!322173 (select (store (arr!19661 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!727682 (= lt!322171 (array!41083 (store (arr!19661 a!3186) i!1173 k0!2102) (size!20082 a!3186)))))

(declare-fun b!727683 () Bool)

(declare-fun res!488398 () Bool)

(declare-fun e!407362 () Bool)

(assert (=> b!727683 (=> (not res!488398) (not e!407362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!727683 (= res!488398 (validKeyInArray!0 k0!2102))))

(declare-fun b!727685 () Bool)

(declare-fun res!488404 () Bool)

(assert (=> b!727685 (=> (not res!488404) (not e!407357))))

(assert (=> b!727685 (= res!488404 e!407356)))

(declare-fun c!80019 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!727685 (= c!80019 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!727686 () Bool)

(declare-fun res!488405 () Bool)

(assert (=> b!727686 (=> (not res!488405) (not e!407359))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!727686 (= res!488405 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20082 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20082 a!3186))))))

(declare-fun b!727687 () Bool)

(declare-fun e!407360 () Bool)

(declare-fun e!407361 () Bool)

(assert (=> b!727687 (= e!407360 e!407361)))

(declare-fun res!488394 () Bool)

(assert (=> b!727687 (=> (not res!488394) (not e!407361))))

(declare-fun lt!322168 () SeekEntryResult!7258)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41082 (_ BitVec 32)) SeekEntryResult!7258)

(assert (=> b!727687 (= res!488394 (= (seekEntryOrOpen!0 (select (arr!19661 a!3186) j!159) a!3186 mask!3328) lt!322168))))

(assert (=> b!727687 (= lt!322168 (Found!7258 j!159))))

(declare-fun b!727688 () Bool)

(assert (=> b!727688 (= e!407359 e!407357)))

(declare-fun res!488397 () Bool)

(assert (=> b!727688 (=> (not res!488397) (not e!407357))))

(assert (=> b!727688 (= res!488397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19661 a!3186) j!159) mask!3328) (select (arr!19661 a!3186) j!159) a!3186 mask!3328) lt!322175))))

(assert (=> b!727688 (= lt!322175 (Intermediate!7258 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!727689 () Bool)

(declare-fun res!488391 () Bool)

(assert (=> b!727689 (=> (not res!488391) (not e!407359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41082 (_ BitVec 32)) Bool)

(assert (=> b!727689 (= res!488391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!727690 () Bool)

(declare-fun res!488403 () Bool)

(assert (=> b!727690 (=> (not res!488403) (not e!407362))))

(assert (=> b!727690 (= res!488403 (validKeyInArray!0 (select (arr!19661 a!3186) j!159)))))

(declare-fun res!488395 () Bool)

(assert (=> start!64616 (=> (not res!488395) (not e!407362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64616 (= res!488395 (validMask!0 mask!3328))))

(assert (=> start!64616 e!407362))

(assert (=> start!64616 true))

(declare-fun array_inv!15544 (array!41082) Bool)

(assert (=> start!64616 (array_inv!15544 a!3186)))

(declare-fun b!727684 () Bool)

(assert (=> b!727684 (= e!407362 e!407359)))

(declare-fun res!488406 () Bool)

(assert (=> b!727684 (=> (not res!488406) (not e!407359))))

(declare-fun lt!322167 () SeekEntryResult!7258)

(assert (=> b!727684 (= res!488406 (or (= lt!322167 (MissingZero!7258 i!1173)) (= lt!322167 (MissingVacant!7258 i!1173))))))

(assert (=> b!727684 (= lt!322167 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!727691 () Bool)

(declare-fun e!407354 () Bool)

(assert (=> b!727691 (= e!407354 true)))

(declare-fun lt!322174 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727691 (= lt!322174 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!727692 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41082 (_ BitVec 32)) SeekEntryResult!7258)

(assert (=> b!727692 (= e!407361 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19661 a!3186) j!159) a!3186 mask!3328) lt!322168))))

(declare-fun b!727693 () Bool)

(declare-fun res!488393 () Bool)

(assert (=> b!727693 (=> (not res!488393) (not e!407362))))

(assert (=> b!727693 (= res!488393 (and (= (size!20082 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20082 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20082 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!727694 () Bool)

(declare-fun res!488399 () Bool)

(assert (=> b!727694 (=> (not res!488399) (not e!407362))))

(declare-fun arrayContainsKey!0 (array!41082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!727694 (= res!488399 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!727695 () Bool)

(assert (=> b!727695 (= e!407356 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19661 a!3186) j!159) a!3186 mask!3328) (Found!7258 j!159)))))

(declare-fun b!727696 () Bool)

(assert (=> b!727696 (= e!407358 (not e!407354))))

(declare-fun res!488401 () Bool)

(assert (=> b!727696 (=> res!488401 e!407354)))

(get-info :version)

(assert (=> b!727696 (= res!488401 (or (not ((_ is Intermediate!7258) lt!322172)) (bvsge x!1131 (x!62403 lt!322172))))))

(assert (=> b!727696 e!407360))

(declare-fun res!488392 () Bool)

(assert (=> b!727696 (=> (not res!488392) (not e!407360))))

(assert (=> b!727696 (= res!488392 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24806 0))(
  ( (Unit!24807) )
))
(declare-fun lt!322169 () Unit!24806)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24806)

(assert (=> b!727696 (= lt!322169 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!727697 () Bool)

(declare-fun res!488400 () Bool)

(assert (=> b!727697 (=> (not res!488400) (not e!407357))))

(assert (=> b!727697 (= res!488400 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19661 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64616 res!488395) b!727693))

(assert (= (and b!727693 res!488393) b!727690))

(assert (= (and b!727690 res!488403) b!727683))

(assert (= (and b!727683 res!488398) b!727694))

(assert (= (and b!727694 res!488399) b!727684))

(assert (= (and b!727684 res!488406) b!727689))

(assert (= (and b!727689 res!488391) b!727680))

(assert (= (and b!727680 res!488396) b!727686))

(assert (= (and b!727686 res!488405) b!727688))

(assert (= (and b!727688 res!488397) b!727697))

(assert (= (and b!727697 res!488400) b!727685))

(assert (= (and b!727685 c!80019) b!727681))

(assert (= (and b!727685 (not c!80019)) b!727695))

(assert (= (and b!727685 res!488404) b!727682))

(assert (= (and b!727682 res!488402) b!727696))

(assert (= (and b!727696 res!488392) b!727687))

(assert (= (and b!727687 res!488394) b!727692))

(assert (= (and b!727696 (not res!488401)) b!727691))

(declare-fun m!680981 () Bool)

(assert (=> b!727682 m!680981))

(declare-fun m!680983 () Bool)

(assert (=> b!727682 m!680983))

(declare-fun m!680985 () Bool)

(assert (=> b!727682 m!680985))

(declare-fun m!680987 () Bool)

(assert (=> b!727682 m!680987))

(declare-fun m!680989 () Bool)

(assert (=> b!727682 m!680989))

(assert (=> b!727682 m!680987))

(declare-fun m!680991 () Bool)

(assert (=> b!727697 m!680991))

(declare-fun m!680993 () Bool)

(assert (=> b!727696 m!680993))

(declare-fun m!680995 () Bool)

(assert (=> b!727696 m!680995))

(declare-fun m!680997 () Bool)

(assert (=> b!727690 m!680997))

(assert (=> b!727690 m!680997))

(declare-fun m!680999 () Bool)

(assert (=> b!727690 m!680999))

(declare-fun m!681001 () Bool)

(assert (=> b!727683 m!681001))

(assert (=> b!727688 m!680997))

(assert (=> b!727688 m!680997))

(declare-fun m!681003 () Bool)

(assert (=> b!727688 m!681003))

(assert (=> b!727688 m!681003))

(assert (=> b!727688 m!680997))

(declare-fun m!681005 () Bool)

(assert (=> b!727688 m!681005))

(assert (=> b!727692 m!680997))

(assert (=> b!727692 m!680997))

(declare-fun m!681007 () Bool)

(assert (=> b!727692 m!681007))

(declare-fun m!681009 () Bool)

(assert (=> start!64616 m!681009))

(declare-fun m!681011 () Bool)

(assert (=> start!64616 m!681011))

(declare-fun m!681013 () Bool)

(assert (=> b!727689 m!681013))

(declare-fun m!681015 () Bool)

(assert (=> b!727680 m!681015))

(declare-fun m!681017 () Bool)

(assert (=> b!727694 m!681017))

(assert (=> b!727695 m!680997))

(assert (=> b!727695 m!680997))

(declare-fun m!681019 () Bool)

(assert (=> b!727695 m!681019))

(declare-fun m!681021 () Bool)

(assert (=> b!727684 m!681021))

(assert (=> b!727687 m!680997))

(assert (=> b!727687 m!680997))

(declare-fun m!681023 () Bool)

(assert (=> b!727687 m!681023))

(declare-fun m!681025 () Bool)

(assert (=> b!727691 m!681025))

(assert (=> b!727681 m!680997))

(assert (=> b!727681 m!680997))

(declare-fun m!681027 () Bool)

(assert (=> b!727681 m!681027))

(check-sat (not b!727683) (not b!727692) (not b!727696) (not b!727681) (not b!727682) (not b!727690) (not b!727684) (not start!64616) (not b!727694) (not b!727691) (not b!727680) (not b!727687) (not b!727695) (not b!727689) (not b!727688))
(check-sat)
