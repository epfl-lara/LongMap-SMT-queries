; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64664 () Bool)

(assert start!64664)

(declare-fun b!728976 () Bool)

(declare-fun res!489543 () Bool)

(declare-fun e!408009 () Bool)

(assert (=> b!728976 (=> (not res!489543) (not e!408009))))

(declare-datatypes ((array!41130 0))(
  ( (array!41131 (arr!19685 (Array (_ BitVec 32) (_ BitVec 64))) (size!20106 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41130)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728976 (= res!489543 (validKeyInArray!0 (select (arr!19685 a!3186) j!159)))))

(declare-fun b!728977 () Bool)

(declare-fun res!489550 () Bool)

(declare-fun e!408003 () Bool)

(assert (=> b!728977 (=> (not res!489550) (not e!408003))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728977 (= res!489550 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19685 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728978 () Bool)

(declare-fun e!408006 () Bool)

(assert (=> b!728978 (= e!408003 e!408006)))

(declare-fun res!489551 () Bool)

(assert (=> b!728978 (=> (not res!489551) (not e!408006))))

(declare-datatypes ((SeekEntryResult!7282 0))(
  ( (MissingZero!7282 (index!31496 (_ BitVec 32))) (Found!7282 (index!31497 (_ BitVec 32))) (Intermediate!7282 (undefined!8094 Bool) (index!31498 (_ BitVec 32)) (x!62491 (_ BitVec 32))) (Undefined!7282) (MissingVacant!7282 (index!31499 (_ BitVec 32))) )
))
(declare-fun lt!322821 () SeekEntryResult!7282)

(declare-fun lt!322819 () SeekEntryResult!7282)

(assert (=> b!728978 (= res!489551 (= lt!322821 lt!322819))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!322818 () array!41130)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!322816 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41130 (_ BitVec 32)) SeekEntryResult!7282)

(assert (=> b!728978 (= lt!322819 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322816 lt!322818 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728978 (= lt!322821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322816 mask!3328) lt!322816 lt!322818 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!728978 (= lt!322816 (select (store (arr!19685 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!728978 (= lt!322818 (array!41131 (store (arr!19685 a!3186) i!1173 k0!2102) (size!20106 a!3186)))))

(declare-fun b!728979 () Bool)

(declare-fun res!489555 () Bool)

(declare-fun e!408004 () Bool)

(assert (=> b!728979 (=> (not res!489555) (not e!408004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41130 (_ BitVec 32)) Bool)

(assert (=> b!728979 (= res!489555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728981 () Bool)

(declare-fun res!489558 () Bool)

(assert (=> b!728981 (=> (not res!489558) (not e!408009))))

(declare-fun arrayContainsKey!0 (array!41130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728981 (= res!489558 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728982 () Bool)

(declare-fun lt!322823 () SeekEntryResult!7282)

(declare-fun e!408007 () Bool)

(assert (=> b!728982 (= e!408007 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19685 a!3186) j!159) a!3186 mask!3328) lt!322823))))

(declare-fun b!728983 () Bool)

(declare-fun res!489556 () Bool)

(assert (=> b!728983 (=> (not res!489556) (not e!408009))))

(assert (=> b!728983 (= res!489556 (validKeyInArray!0 k0!2102))))

(declare-fun b!728984 () Bool)

(assert (=> b!728984 (= e!408009 e!408004)))

(declare-fun res!489552 () Bool)

(assert (=> b!728984 (=> (not res!489552) (not e!408004))))

(declare-fun lt!322820 () SeekEntryResult!7282)

(assert (=> b!728984 (= res!489552 (or (= lt!322820 (MissingZero!7282 i!1173)) (= lt!322820 (MissingVacant!7282 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41130 (_ BitVec 32)) SeekEntryResult!7282)

(assert (=> b!728984 (= lt!322820 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!728985 () Bool)

(declare-fun e!408002 () Bool)

(assert (=> b!728985 (= e!408006 (not e!408002))))

(declare-fun res!489544 () Bool)

(assert (=> b!728985 (=> res!489544 e!408002)))

(get-info :version)

(assert (=> b!728985 (= res!489544 (or (not ((_ is Intermediate!7282) lt!322819)) (bvsge x!1131 (x!62491 lt!322819))))))

(declare-fun e!408008 () Bool)

(assert (=> b!728985 e!408008))

(declare-fun res!489554 () Bool)

(assert (=> b!728985 (=> (not res!489554) (not e!408008))))

(assert (=> b!728985 (= res!489554 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24854 0))(
  ( (Unit!24855) )
))
(declare-fun lt!322822 () Unit!24854)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24854)

(assert (=> b!728985 (= lt!322822 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728986 () Bool)

(declare-fun res!489547 () Bool)

(assert (=> b!728986 (=> (not res!489547) (not e!408004))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728986 (= res!489547 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20106 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20106 a!3186))))))

(declare-fun lt!322815 () SeekEntryResult!7282)

(declare-fun e!408005 () Bool)

(declare-fun b!728987 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41130 (_ BitVec 32)) SeekEntryResult!7282)

(assert (=> b!728987 (= e!408005 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19685 a!3186) j!159) a!3186 mask!3328) lt!322815))))

(declare-fun b!728988 () Bool)

(assert (=> b!728988 (= e!408008 e!408005)))

(declare-fun res!489553 () Bool)

(assert (=> b!728988 (=> (not res!489553) (not e!408005))))

(assert (=> b!728988 (= res!489553 (= (seekEntryOrOpen!0 (select (arr!19685 a!3186) j!159) a!3186 mask!3328) lt!322815))))

(assert (=> b!728988 (= lt!322815 (Found!7282 j!159))))

(declare-fun b!728989 () Bool)

(assert (=> b!728989 (= e!408004 e!408003)))

(declare-fun res!489548 () Bool)

(assert (=> b!728989 (=> (not res!489548) (not e!408003))))

(assert (=> b!728989 (= res!489548 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19685 a!3186) j!159) mask!3328) (select (arr!19685 a!3186) j!159) a!3186 mask!3328) lt!322823))))

(assert (=> b!728989 (= lt!322823 (Intermediate!7282 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728980 () Bool)

(declare-fun res!489549 () Bool)

(assert (=> b!728980 (=> (not res!489549) (not e!408004))))

(declare-datatypes ((List!13726 0))(
  ( (Nil!13723) (Cons!13722 (h!14782 (_ BitVec 64)) (t!20032 List!13726)) )
))
(declare-fun arrayNoDuplicates!0 (array!41130 (_ BitVec 32) List!13726) Bool)

(assert (=> b!728980 (= res!489549 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13723))))

(declare-fun res!489546 () Bool)

(assert (=> start!64664 (=> (not res!489546) (not e!408009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64664 (= res!489546 (validMask!0 mask!3328))))

(assert (=> start!64664 e!408009))

(assert (=> start!64664 true))

(declare-fun array_inv!15568 (array!41130) Bool)

(assert (=> start!64664 (array_inv!15568 a!3186)))

(declare-fun b!728990 () Bool)

(declare-fun res!489557 () Bool)

(assert (=> b!728990 (=> (not res!489557) (not e!408003))))

(assert (=> b!728990 (= res!489557 e!408007)))

(declare-fun c!80091 () Bool)

(assert (=> b!728990 (= c!80091 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728991 () Bool)

(declare-fun res!489545 () Bool)

(assert (=> b!728991 (=> (not res!489545) (not e!408009))))

(assert (=> b!728991 (= res!489545 (and (= (size!20106 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20106 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20106 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728992 () Bool)

(assert (=> b!728992 (= e!408007 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19685 a!3186) j!159) a!3186 mask!3328) (Found!7282 j!159)))))

(declare-fun b!728993 () Bool)

(assert (=> b!728993 (= e!408002 true)))

(declare-fun lt!322817 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728993 (= lt!322817 (nextIndex!0 index!1321 x!1131 mask!3328))))

(assert (= (and start!64664 res!489546) b!728991))

(assert (= (and b!728991 res!489545) b!728976))

(assert (= (and b!728976 res!489543) b!728983))

(assert (= (and b!728983 res!489556) b!728981))

(assert (= (and b!728981 res!489558) b!728984))

(assert (= (and b!728984 res!489552) b!728979))

(assert (= (and b!728979 res!489555) b!728980))

(assert (= (and b!728980 res!489549) b!728986))

(assert (= (and b!728986 res!489547) b!728989))

(assert (= (and b!728989 res!489548) b!728977))

(assert (= (and b!728977 res!489550) b!728990))

(assert (= (and b!728990 c!80091) b!728982))

(assert (= (and b!728990 (not c!80091)) b!728992))

(assert (= (and b!728990 res!489557) b!728978))

(assert (= (and b!728978 res!489551) b!728985))

(assert (= (and b!728985 res!489554) b!728988))

(assert (= (and b!728988 res!489553) b!728987))

(assert (= (and b!728985 (not res!489544)) b!728993))

(declare-fun m!682133 () Bool)

(assert (=> b!728988 m!682133))

(assert (=> b!728988 m!682133))

(declare-fun m!682135 () Bool)

(assert (=> b!728988 m!682135))

(declare-fun m!682137 () Bool)

(assert (=> b!728983 m!682137))

(declare-fun m!682139 () Bool)

(assert (=> b!728978 m!682139))

(declare-fun m!682141 () Bool)

(assert (=> b!728978 m!682141))

(declare-fun m!682143 () Bool)

(assert (=> b!728978 m!682143))

(declare-fun m!682145 () Bool)

(assert (=> b!728978 m!682145))

(declare-fun m!682147 () Bool)

(assert (=> b!728978 m!682147))

(assert (=> b!728978 m!682139))

(declare-fun m!682149 () Bool)

(assert (=> b!728993 m!682149))

(declare-fun m!682151 () Bool)

(assert (=> b!728980 m!682151))

(assert (=> b!728982 m!682133))

(assert (=> b!728982 m!682133))

(declare-fun m!682153 () Bool)

(assert (=> b!728982 m!682153))

(declare-fun m!682155 () Bool)

(assert (=> start!64664 m!682155))

(declare-fun m!682157 () Bool)

(assert (=> start!64664 m!682157))

(declare-fun m!682159 () Bool)

(assert (=> b!728985 m!682159))

(declare-fun m!682161 () Bool)

(assert (=> b!728985 m!682161))

(declare-fun m!682163 () Bool)

(assert (=> b!728979 m!682163))

(assert (=> b!728987 m!682133))

(assert (=> b!728987 m!682133))

(declare-fun m!682165 () Bool)

(assert (=> b!728987 m!682165))

(declare-fun m!682167 () Bool)

(assert (=> b!728981 m!682167))

(declare-fun m!682169 () Bool)

(assert (=> b!728977 m!682169))

(assert (=> b!728989 m!682133))

(assert (=> b!728989 m!682133))

(declare-fun m!682171 () Bool)

(assert (=> b!728989 m!682171))

(assert (=> b!728989 m!682171))

(assert (=> b!728989 m!682133))

(declare-fun m!682173 () Bool)

(assert (=> b!728989 m!682173))

(assert (=> b!728992 m!682133))

(assert (=> b!728992 m!682133))

(declare-fun m!682175 () Bool)

(assert (=> b!728992 m!682175))

(declare-fun m!682177 () Bool)

(assert (=> b!728984 m!682177))

(assert (=> b!728976 m!682133))

(assert (=> b!728976 m!682133))

(declare-fun m!682179 () Bool)

(assert (=> b!728976 m!682179))

(check-sat (not b!728983) (not b!728985) (not b!728982) (not b!728984) (not b!728987) (not b!728980) (not b!728988) (not b!728993) (not b!728979) (not b!728978) (not b!728976) (not b!728981) (not start!64664) (not b!728992) (not b!728989))
(check-sat)
