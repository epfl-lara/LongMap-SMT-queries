; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65276 () Bool)

(assert start!65276)

(declare-fun b!740742 () Bool)

(declare-fun res!498173 () Bool)

(declare-fun e!414116 () Bool)

(assert (=> b!740742 (=> (not res!498173) (not e!414116))))

(declare-datatypes ((array!41449 0))(
  ( (array!41450 (arr!19838 (Array (_ BitVec 32) (_ BitVec 64))) (size!20259 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41449)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41449 (_ BitVec 32)) Bool)

(assert (=> b!740742 (= res!498173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740743 () Bool)

(declare-fun e!414120 () Bool)

(assert (=> b!740743 (= e!414120 e!414116)))

(declare-fun res!498167 () Bool)

(assert (=> b!740743 (=> (not res!498167) (not e!414116))))

(declare-datatypes ((SeekEntryResult!7438 0))(
  ( (MissingZero!7438 (index!32120 (_ BitVec 32))) (Found!7438 (index!32121 (_ BitVec 32))) (Intermediate!7438 (undefined!8250 Bool) (index!32122 (_ BitVec 32)) (x!63100 (_ BitVec 32))) (Undefined!7438) (MissingVacant!7438 (index!32123 (_ BitVec 32))) )
))
(declare-fun lt!329092 () SeekEntryResult!7438)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!740743 (= res!498167 (or (= lt!329092 (MissingZero!7438 i!1173)) (= lt!329092 (MissingVacant!7438 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41449 (_ BitVec 32)) SeekEntryResult!7438)

(assert (=> b!740743 (= lt!329092 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!740744 () Bool)

(declare-fun e!414117 () Bool)

(declare-fun e!414118 () Bool)

(assert (=> b!740744 (= e!414117 e!414118)))

(declare-fun res!498171 () Bool)

(assert (=> b!740744 (=> (not res!498171) (not e!414118))))

(declare-fun lt!329101 () SeekEntryResult!7438)

(declare-fun lt!329096 () SeekEntryResult!7438)

(assert (=> b!740744 (= res!498171 (= lt!329101 lt!329096))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!329104 () array!41449)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!329095 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41449 (_ BitVec 32)) SeekEntryResult!7438)

(assert (=> b!740744 (= lt!329096 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329095 lt!329104 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740744 (= lt!329101 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329095 mask!3328) lt!329095 lt!329104 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!740744 (= lt!329095 (select (store (arr!19838 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!740744 (= lt!329104 (array!41450 (store (arr!19838 a!3186) i!1173 k!2102) (size!20259 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!414119 () Bool)

(declare-fun b!740745 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41449 (_ BitVec 32)) SeekEntryResult!7438)

(assert (=> b!740745 (= e!414119 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19838 a!3186) j!159) a!3186 mask!3328) (Found!7438 j!159)))))

(declare-fun lt!329103 () (_ BitVec 32))

(declare-fun lt!329102 () SeekEntryResult!7438)

(declare-fun b!740746 () Bool)

(declare-fun e!414115 () Bool)

(assert (=> b!740746 (= e!414115 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329103 resIntermediateIndex!5 (select (arr!19838 a!3186) j!159) a!3186 mask!3328) lt!329102)))))

(declare-fun b!740747 () Bool)

(declare-fun e!414113 () Bool)

(declare-fun e!414111 () Bool)

(assert (=> b!740747 (= e!414113 e!414111)))

(declare-fun res!498162 () Bool)

(assert (=> b!740747 (=> (not res!498162) (not e!414111))))

(declare-fun lt!329100 () SeekEntryResult!7438)

(assert (=> b!740747 (= res!498162 (= (seekEntryOrOpen!0 (select (arr!19838 a!3186) j!159) a!3186 mask!3328) lt!329100))))

(assert (=> b!740747 (= lt!329100 (Found!7438 j!159))))

(declare-fun b!740748 () Bool)

(declare-fun res!498168 () Bool)

(assert (=> b!740748 (=> (not res!498168) (not e!414120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740748 (= res!498168 (validKeyInArray!0 k!2102))))

(declare-fun b!740749 () Bool)

(declare-fun res!498174 () Bool)

(assert (=> b!740749 (=> (not res!498174) (not e!414120))))

(assert (=> b!740749 (= res!498174 (validKeyInArray!0 (select (arr!19838 a!3186) j!159)))))

(declare-fun b!740750 () Bool)

(declare-fun res!498166 () Bool)

(assert (=> b!740750 (=> (not res!498166) (not e!414116))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!740750 (= res!498166 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20259 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20259 a!3186))))))

(declare-fun b!740751 () Bool)

(declare-fun e!414112 () Bool)

(declare-fun e!414121 () Bool)

(assert (=> b!740751 (= e!414112 e!414121)))

(declare-fun res!498170 () Bool)

(assert (=> b!740751 (=> res!498170 e!414121)))

(assert (=> b!740751 (= res!498170 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!329103 #b00000000000000000000000000000000) (bvsge lt!329103 (size!20259 a!3186))))))

(declare-datatypes ((Unit!25348 0))(
  ( (Unit!25349) )
))
(declare-fun lt!329099 () Unit!25348)

(declare-fun e!414114 () Unit!25348)

(assert (=> b!740751 (= lt!329099 e!414114)))

(declare-fun c!81673 () Bool)

(declare-fun lt!329098 () Bool)

(assert (=> b!740751 (= c!81673 lt!329098)))

(assert (=> b!740751 (= lt!329098 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740751 (= lt!329103 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!498176 () Bool)

(assert (=> start!65276 (=> (not res!498176) (not e!414120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65276 (= res!498176 (validMask!0 mask!3328))))

(assert (=> start!65276 e!414120))

(assert (=> start!65276 true))

(declare-fun array_inv!15634 (array!41449) Bool)

(assert (=> start!65276 (array_inv!15634 a!3186)))

(declare-fun b!740752 () Bool)

(declare-fun res!498169 () Bool)

(assert (=> b!740752 (=> res!498169 e!414121)))

(assert (=> b!740752 (= res!498169 e!414115)))

(declare-fun c!81672 () Bool)

(assert (=> b!740752 (= c!81672 lt!329098)))

(declare-fun b!740753 () Bool)

(declare-fun Unit!25350 () Unit!25348)

(assert (=> b!740753 (= e!414114 Unit!25350)))

(declare-fun lt!329097 () SeekEntryResult!7438)

(assert (=> b!740753 (= lt!329097 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19838 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!740753 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329103 resIntermediateIndex!5 (select (arr!19838 a!3186) j!159) a!3186 mask!3328) lt!329102)))

(declare-fun b!740754 () Bool)

(assert (=> b!740754 (= e!414116 e!414117)))

(declare-fun res!498177 () Bool)

(assert (=> b!740754 (=> (not res!498177) (not e!414117))))

(declare-fun lt!329094 () SeekEntryResult!7438)

(assert (=> b!740754 (= res!498177 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19838 a!3186) j!159) mask!3328) (select (arr!19838 a!3186) j!159) a!3186 mask!3328) lt!329094))))

(assert (=> b!740754 (= lt!329094 (Intermediate!7438 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740755 () Bool)

(declare-fun res!498164 () Bool)

(assert (=> b!740755 (=> (not res!498164) (not e!414117))))

(assert (=> b!740755 (= res!498164 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19838 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740756 () Bool)

(declare-fun res!498175 () Bool)

(assert (=> b!740756 (=> (not res!498175) (not e!414116))))

(declare-datatypes ((List!13840 0))(
  ( (Nil!13837) (Cons!13836 (h!14908 (_ BitVec 64)) (t!20155 List!13840)) )
))
(declare-fun arrayNoDuplicates!0 (array!41449 (_ BitVec 32) List!13840) Bool)

(assert (=> b!740756 (= res!498175 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13837))))

(declare-fun b!740757 () Bool)

(declare-fun Unit!25351 () Unit!25348)

(assert (=> b!740757 (= e!414114 Unit!25351)))

(assert (=> b!740757 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329103 (select (arr!19838 a!3186) j!159) a!3186 mask!3328) lt!329094)))

(declare-fun b!740758 () Bool)

(assert (=> b!740758 (= e!414118 (not e!414112))))

(declare-fun res!498178 () Bool)

(assert (=> b!740758 (=> res!498178 e!414112)))

(assert (=> b!740758 (= res!498178 (or (not (is-Intermediate!7438 lt!329096)) (bvsge x!1131 (x!63100 lt!329096))))))

(assert (=> b!740758 (= lt!329102 (Found!7438 j!159))))

(assert (=> b!740758 e!414113))

(declare-fun res!498163 () Bool)

(assert (=> b!740758 (=> (not res!498163) (not e!414113))))

(assert (=> b!740758 (= res!498163 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!329105 () Unit!25348)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25348)

(assert (=> b!740758 (= lt!329105 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740759 () Bool)

(declare-fun res!498172 () Bool)

(assert (=> b!740759 (=> (not res!498172) (not e!414117))))

(assert (=> b!740759 (= res!498172 e!414119)))

(declare-fun c!81671 () Bool)

(assert (=> b!740759 (= c!81671 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740760 () Bool)

(assert (=> b!740760 (= e!414111 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19838 a!3186) j!159) a!3186 mask!3328) lt!329100))))

(declare-fun b!740761 () Bool)

(declare-fun res!498179 () Bool)

(assert (=> b!740761 (=> res!498179 e!414121)))

(assert (=> b!740761 (= res!498179 (not (= lt!329101 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329103 lt!329095 lt!329104 mask!3328))))))

(declare-fun b!740762 () Bool)

(declare-fun res!498165 () Bool)

(assert (=> b!740762 (=> (not res!498165) (not e!414120))))

(declare-fun arrayContainsKey!0 (array!41449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740762 (= res!498165 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740763 () Bool)

(assert (=> b!740763 (= e!414115 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329103 (select (arr!19838 a!3186) j!159) a!3186 mask!3328) lt!329094)))))

(declare-fun b!740764 () Bool)

(declare-fun res!498161 () Bool)

(assert (=> b!740764 (=> (not res!498161) (not e!414120))))

(assert (=> b!740764 (= res!498161 (and (= (size!20259 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20259 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20259 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740765 () Bool)

(assert (=> b!740765 (= e!414121 true)))

(assert (=> b!740765 (= (seekEntryOrOpen!0 lt!329095 lt!329104 mask!3328) lt!329102)))

(declare-fun lt!329093 () Unit!25348)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25348)

(assert (=> b!740765 (= lt!329093 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k!2102 j!159 lt!329103 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!740766 () Bool)

(assert (=> b!740766 (= e!414119 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19838 a!3186) j!159) a!3186 mask!3328) lt!329094))))

(assert (= (and start!65276 res!498176) b!740764))

(assert (= (and b!740764 res!498161) b!740749))

(assert (= (and b!740749 res!498174) b!740748))

(assert (= (and b!740748 res!498168) b!740762))

(assert (= (and b!740762 res!498165) b!740743))

(assert (= (and b!740743 res!498167) b!740742))

(assert (= (and b!740742 res!498173) b!740756))

(assert (= (and b!740756 res!498175) b!740750))

(assert (= (and b!740750 res!498166) b!740754))

(assert (= (and b!740754 res!498177) b!740755))

(assert (= (and b!740755 res!498164) b!740759))

(assert (= (and b!740759 c!81671) b!740766))

(assert (= (and b!740759 (not c!81671)) b!740745))

(assert (= (and b!740759 res!498172) b!740744))

(assert (= (and b!740744 res!498171) b!740758))

(assert (= (and b!740758 res!498163) b!740747))

(assert (= (and b!740747 res!498162) b!740760))

(assert (= (and b!740758 (not res!498178)) b!740751))

(assert (= (and b!740751 c!81673) b!740757))

(assert (= (and b!740751 (not c!81673)) b!740753))

(assert (= (and b!740751 (not res!498170)) b!740752))

(assert (= (and b!740752 c!81672) b!740763))

(assert (= (and b!740752 (not c!81672)) b!740746))

(assert (= (and b!740752 (not res!498169)) b!740761))

(assert (= (and b!740761 (not res!498179)) b!740765))

(declare-fun m!691809 () Bool)

(assert (=> b!740763 m!691809))

(assert (=> b!740763 m!691809))

(declare-fun m!691811 () Bool)

(assert (=> b!740763 m!691811))

(declare-fun m!691813 () Bool)

(assert (=> b!740762 m!691813))

(assert (=> b!740753 m!691809))

(assert (=> b!740753 m!691809))

(declare-fun m!691815 () Bool)

(assert (=> b!740753 m!691815))

(assert (=> b!740753 m!691809))

(declare-fun m!691817 () Bool)

(assert (=> b!740753 m!691817))

(assert (=> b!740745 m!691809))

(assert (=> b!740745 m!691809))

(assert (=> b!740745 m!691815))

(declare-fun m!691819 () Bool)

(assert (=> b!740751 m!691819))

(assert (=> b!740757 m!691809))

(assert (=> b!740757 m!691809))

(assert (=> b!740757 m!691811))

(assert (=> b!740746 m!691809))

(assert (=> b!740746 m!691809))

(assert (=> b!740746 m!691817))

(declare-fun m!691821 () Bool)

(assert (=> b!740765 m!691821))

(declare-fun m!691823 () Bool)

(assert (=> b!740765 m!691823))

(declare-fun m!691825 () Bool)

(assert (=> b!740748 m!691825))

(declare-fun m!691827 () Bool)

(assert (=> b!740744 m!691827))

(declare-fun m!691829 () Bool)

(assert (=> b!740744 m!691829))

(assert (=> b!740744 m!691827))

(declare-fun m!691831 () Bool)

(assert (=> b!740744 m!691831))

(declare-fun m!691833 () Bool)

(assert (=> b!740744 m!691833))

(declare-fun m!691835 () Bool)

(assert (=> b!740744 m!691835))

(declare-fun m!691837 () Bool)

(assert (=> b!740756 m!691837))

(declare-fun m!691839 () Bool)

(assert (=> b!740755 m!691839))

(assert (=> b!740766 m!691809))

(assert (=> b!740766 m!691809))

(declare-fun m!691841 () Bool)

(assert (=> b!740766 m!691841))

(declare-fun m!691843 () Bool)

(assert (=> b!740742 m!691843))

(assert (=> b!740754 m!691809))

(assert (=> b!740754 m!691809))

(declare-fun m!691845 () Bool)

(assert (=> b!740754 m!691845))

(assert (=> b!740754 m!691845))

(assert (=> b!740754 m!691809))

(declare-fun m!691847 () Bool)

(assert (=> b!740754 m!691847))

(declare-fun m!691849 () Bool)

(assert (=> start!65276 m!691849))

(declare-fun m!691851 () Bool)

(assert (=> start!65276 m!691851))

(assert (=> b!740749 m!691809))

(assert (=> b!740749 m!691809))

(declare-fun m!691853 () Bool)

(assert (=> b!740749 m!691853))

(declare-fun m!691855 () Bool)

(assert (=> b!740761 m!691855))

(declare-fun m!691857 () Bool)

(assert (=> b!740743 m!691857))

(assert (=> b!740747 m!691809))

(assert (=> b!740747 m!691809))

(declare-fun m!691859 () Bool)

(assert (=> b!740747 m!691859))

(declare-fun m!691861 () Bool)

(assert (=> b!740758 m!691861))

(declare-fun m!691863 () Bool)

(assert (=> b!740758 m!691863))

(assert (=> b!740760 m!691809))

(assert (=> b!740760 m!691809))

(declare-fun m!691865 () Bool)

(assert (=> b!740760 m!691865))

(push 1)

(assert (not b!740751))

(assert (not b!740749))

(assert (not b!740765))

(assert (not b!740766))

(assert (not b!740748))

(assert (not b!740747))

(assert (not b!740744))

(assert (not b!740762))

(assert (not start!65276))

(assert (not b!740745))

(assert (not b!740757))

(assert (not b!740760))

(assert (not b!740753))

(assert (not b!740761))

(assert (not b!740742))

(assert (not b!740743))

(assert (not b!740758))

(assert (not b!740763))

(assert (not b!740754))

(assert (not b!740746))

(assert (not b!740756))

(check-sat)

(pop 1)

(push 1)

(check-sat)

