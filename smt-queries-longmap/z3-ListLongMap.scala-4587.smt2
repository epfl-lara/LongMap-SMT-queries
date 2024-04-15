; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64016 () Bool)

(assert start!64016)

(declare-fun b!718865 () Bool)

(declare-fun res!481404 () Bool)

(declare-fun e!403443 () Bool)

(assert (=> b!718865 (=> (not res!481404) (not e!403443))))

(declare-datatypes ((array!40728 0))(
  ( (array!40729 (arr!19490 (Array (_ BitVec 32) (_ BitVec 64))) (size!19911 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40728)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718865 (= res!481404 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718866 () Bool)

(declare-fun res!481400 () Bool)

(declare-fun e!403442 () Bool)

(assert (=> b!718866 (=> (not res!481400) (not e!403442))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40728 (_ BitVec 32)) Bool)

(assert (=> b!718866 (= res!481400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718867 () Bool)

(declare-fun res!481402 () Bool)

(assert (=> b!718867 (=> (not res!481402) (not e!403442))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7087 0))(
  ( (MissingZero!7087 (index!30716 (_ BitVec 32))) (Found!7087 (index!30717 (_ BitVec 32))) (Intermediate!7087 (undefined!7899 Bool) (index!30718 (_ BitVec 32)) (x!61737 (_ BitVec 32))) (Undefined!7087) (MissingVacant!7087 (index!30719 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40728 (_ BitVec 32)) SeekEntryResult!7087)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718867 (= res!481402 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19490 a!3186) j!159) mask!3328) (select (arr!19490 a!3186) j!159) a!3186 mask!3328) (Intermediate!7087 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun b!718868 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!718868 (= e!403442 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19490 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsle x!1131 resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!718869 () Bool)

(declare-fun res!481407 () Bool)

(assert (=> b!718869 (=> (not res!481407) (not e!403443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718869 (= res!481407 (validKeyInArray!0 k0!2102))))

(declare-fun b!718870 () Bool)

(declare-fun res!481398 () Bool)

(assert (=> b!718870 (=> (not res!481398) (not e!403442))))

(declare-datatypes ((List!13531 0))(
  ( (Nil!13528) (Cons!13527 (h!14575 (_ BitVec 64)) (t!19837 List!13531)) )
))
(declare-fun arrayNoDuplicates!0 (array!40728 (_ BitVec 32) List!13531) Bool)

(assert (=> b!718870 (= res!481398 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13528))))

(declare-fun res!481406 () Bool)

(assert (=> start!64016 (=> (not res!481406) (not e!403443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64016 (= res!481406 (validMask!0 mask!3328))))

(assert (=> start!64016 e!403443))

(assert (=> start!64016 true))

(declare-fun array_inv!15373 (array!40728) Bool)

(assert (=> start!64016 (array_inv!15373 a!3186)))

(declare-fun b!718871 () Bool)

(assert (=> b!718871 (= e!403443 e!403442)))

(declare-fun res!481403 () Bool)

(assert (=> b!718871 (=> (not res!481403) (not e!403442))))

(declare-fun lt!319298 () SeekEntryResult!7087)

(assert (=> b!718871 (= res!481403 (or (= lt!319298 (MissingZero!7087 i!1173)) (= lt!319298 (MissingVacant!7087 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40728 (_ BitVec 32)) SeekEntryResult!7087)

(assert (=> b!718871 (= lt!319298 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!718872 () Bool)

(declare-fun res!481405 () Bool)

(assert (=> b!718872 (=> (not res!481405) (not e!403443))))

(assert (=> b!718872 (= res!481405 (and (= (size!19911 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19911 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19911 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718873 () Bool)

(declare-fun res!481399 () Bool)

(assert (=> b!718873 (=> (not res!481399) (not e!403443))))

(assert (=> b!718873 (= res!481399 (validKeyInArray!0 (select (arr!19490 a!3186) j!159)))))

(declare-fun b!718874 () Bool)

(declare-fun res!481401 () Bool)

(assert (=> b!718874 (=> (not res!481401) (not e!403442))))

(assert (=> b!718874 (= res!481401 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19911 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19911 a!3186))))))

(assert (= (and start!64016 res!481406) b!718872))

(assert (= (and b!718872 res!481405) b!718873))

(assert (= (and b!718873 res!481399) b!718869))

(assert (= (and b!718869 res!481407) b!718865))

(assert (= (and b!718865 res!481404) b!718871))

(assert (= (and b!718871 res!481403) b!718866))

(assert (= (and b!718866 res!481400) b!718870))

(assert (= (and b!718870 res!481398) b!718874))

(assert (= (and b!718874 res!481401) b!718867))

(assert (= (and b!718867 res!481402) b!718868))

(declare-fun m!673823 () Bool)

(assert (=> b!718869 m!673823))

(declare-fun m!673825 () Bool)

(assert (=> b!718867 m!673825))

(assert (=> b!718867 m!673825))

(declare-fun m!673827 () Bool)

(assert (=> b!718867 m!673827))

(assert (=> b!718867 m!673827))

(assert (=> b!718867 m!673825))

(declare-fun m!673829 () Bool)

(assert (=> b!718867 m!673829))

(assert (=> b!718873 m!673825))

(assert (=> b!718873 m!673825))

(declare-fun m!673831 () Bool)

(assert (=> b!718873 m!673831))

(declare-fun m!673833 () Bool)

(assert (=> b!718866 m!673833))

(declare-fun m!673835 () Bool)

(assert (=> b!718871 m!673835))

(declare-fun m!673837 () Bool)

(assert (=> b!718868 m!673837))

(declare-fun m!673839 () Bool)

(assert (=> start!64016 m!673839))

(declare-fun m!673841 () Bool)

(assert (=> start!64016 m!673841))

(declare-fun m!673843 () Bool)

(assert (=> b!718865 m!673843))

(declare-fun m!673845 () Bool)

(assert (=> b!718870 m!673845))

(check-sat (not start!64016) (not b!718870) (not b!718871) (not b!718865) (not b!718867) (not b!718873) (not b!718866) (not b!718869))
(check-sat)
