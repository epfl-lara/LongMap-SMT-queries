; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66468 () Bool)

(assert start!66468)

(declare-datatypes ((array!42247 0))(
  ( (array!42248 (arr!20228 (Array (_ BitVec 32) (_ BitVec 64))) (size!20649 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42247)

(declare-fun b!765907 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7828 0))(
  ( (MissingZero!7828 (index!33680 (_ BitVec 32))) (Found!7828 (index!33681 (_ BitVec 32))) (Intermediate!7828 (undefined!8640 Bool) (index!33682 (_ BitVec 32)) (x!64586 (_ BitVec 32))) (Undefined!7828) (MissingVacant!7828 (index!33683 (_ BitVec 32))) )
))
(declare-fun lt!340699 () SeekEntryResult!7828)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!426538 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42247 (_ BitVec 32)) SeekEntryResult!7828)

(assert (=> b!765907 (= e!426538 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20228 a!3186) j!159) a!3186 mask!3328) lt!340699))))

(declare-fun b!765908 () Bool)

(declare-fun res!518104 () Bool)

(declare-fun e!426535 () Bool)

(assert (=> b!765908 (=> (not res!518104) (not e!426535))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!765908 (= res!518104 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20649 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20649 a!3186))))))

(declare-fun b!765909 () Bool)

(declare-fun e!426533 () Bool)

(declare-fun e!426536 () Bool)

(assert (=> b!765909 (= e!426533 e!426536)))

(declare-fun res!518100 () Bool)

(assert (=> b!765909 (=> (not res!518100) (not e!426536))))

(declare-fun lt!340703 () array!42247)

(declare-fun lt!340698 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765909 (= res!518100 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340698 mask!3328) lt!340698 lt!340703 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340698 lt!340703 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!765909 (= lt!340698 (select (store (arr!20228 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!765909 (= lt!340703 (array!42248 (store (arr!20228 a!3186) i!1173 k!2102) (size!20649 a!3186)))))

(declare-fun b!765910 () Bool)

(declare-fun res!518106 () Bool)

(declare-fun e!426534 () Bool)

(assert (=> b!765910 (=> (not res!518106) (not e!426534))))

(declare-fun arrayContainsKey!0 (array!42247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!765910 (= res!518106 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!765911 () Bool)

(declare-fun res!518096 () Bool)

(assert (=> b!765911 (=> (not res!518096) (not e!426533))))

(assert (=> b!765911 (= res!518096 e!426538)))

(declare-fun c!84295 () Bool)

(assert (=> b!765911 (= c!84295 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!765912 () Bool)

(declare-fun res!518109 () Bool)

(assert (=> b!765912 (=> (not res!518109) (not e!426535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42247 (_ BitVec 32)) Bool)

(assert (=> b!765912 (= res!518109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!765913 () Bool)

(declare-fun res!518097 () Bool)

(assert (=> b!765913 (=> (not res!518097) (not e!426534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765913 (= res!518097 (validKeyInArray!0 k!2102))))

(declare-fun b!765914 () Bool)

(assert (=> b!765914 (= e!426534 e!426535)))

(declare-fun res!518105 () Bool)

(assert (=> b!765914 (=> (not res!518105) (not e!426535))))

(declare-fun lt!340700 () SeekEntryResult!7828)

(assert (=> b!765914 (= res!518105 (or (= lt!340700 (MissingZero!7828 i!1173)) (= lt!340700 (MissingVacant!7828 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42247 (_ BitVec 32)) SeekEntryResult!7828)

(assert (=> b!765914 (= lt!340700 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!765915 () Bool)

(declare-fun res!518101 () Bool)

(assert (=> b!765915 (=> (not res!518101) (not e!426535))))

(declare-datatypes ((List!14230 0))(
  ( (Nil!14227) (Cons!14226 (h!15316 (_ BitVec 64)) (t!20545 List!14230)) )
))
(declare-fun arrayNoDuplicates!0 (array!42247 (_ BitVec 32) List!14230) Bool)

(assert (=> b!765915 (= res!518101 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14227))))

(declare-fun b!765916 () Bool)

(assert (=> b!765916 (= e!426536 (not true))))

(declare-fun e!426539 () Bool)

(assert (=> b!765916 e!426539))

(declare-fun res!518098 () Bool)

(assert (=> b!765916 (=> (not res!518098) (not e!426539))))

(assert (=> b!765916 (= res!518098 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26382 0))(
  ( (Unit!26383) )
))
(declare-fun lt!340701 () Unit!26382)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26382)

(assert (=> b!765916 (= lt!340701 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!765918 () Bool)

(assert (=> b!765918 (= e!426535 e!426533)))

(declare-fun res!518110 () Bool)

(assert (=> b!765918 (=> (not res!518110) (not e!426533))))

(assert (=> b!765918 (= res!518110 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20228 a!3186) j!159) mask!3328) (select (arr!20228 a!3186) j!159) a!3186 mask!3328) lt!340699))))

(assert (=> b!765918 (= lt!340699 (Intermediate!7828 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!765919 () Bool)

(declare-fun res!518102 () Bool)

(assert (=> b!765919 (=> (not res!518102) (not e!426534))))

(assert (=> b!765919 (= res!518102 (validKeyInArray!0 (select (arr!20228 a!3186) j!159)))))

(declare-fun b!765920 () Bool)

(declare-fun res!518108 () Bool)

(assert (=> b!765920 (=> (not res!518108) (not e!426533))))

(assert (=> b!765920 (= res!518108 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20228 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765921 () Bool)

(declare-fun e!426540 () Bool)

(assert (=> b!765921 (= e!426539 e!426540)))

(declare-fun res!518103 () Bool)

(assert (=> b!765921 (=> (not res!518103) (not e!426540))))

(declare-fun lt!340702 () SeekEntryResult!7828)

(assert (=> b!765921 (= res!518103 (= (seekEntryOrOpen!0 (select (arr!20228 a!3186) j!159) a!3186 mask!3328) lt!340702))))

(assert (=> b!765921 (= lt!340702 (Found!7828 j!159))))

(declare-fun b!765922 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42247 (_ BitVec 32)) SeekEntryResult!7828)

(assert (=> b!765922 (= e!426538 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20228 a!3186) j!159) a!3186 mask!3328) (Found!7828 j!159)))))

(declare-fun b!765923 () Bool)

(assert (=> b!765923 (= e!426540 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20228 a!3186) j!159) a!3186 mask!3328) lt!340702))))

(declare-fun b!765917 () Bool)

(declare-fun res!518099 () Bool)

(assert (=> b!765917 (=> (not res!518099) (not e!426534))))

(assert (=> b!765917 (= res!518099 (and (= (size!20649 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20649 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20649 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!518107 () Bool)

(assert (=> start!66468 (=> (not res!518107) (not e!426534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66468 (= res!518107 (validMask!0 mask!3328))))

(assert (=> start!66468 e!426534))

(assert (=> start!66468 true))

(declare-fun array_inv!16024 (array!42247) Bool)

(assert (=> start!66468 (array_inv!16024 a!3186)))

(assert (= (and start!66468 res!518107) b!765917))

(assert (= (and b!765917 res!518099) b!765919))

(assert (= (and b!765919 res!518102) b!765913))

(assert (= (and b!765913 res!518097) b!765910))

(assert (= (and b!765910 res!518106) b!765914))

(assert (= (and b!765914 res!518105) b!765912))

(assert (= (and b!765912 res!518109) b!765915))

(assert (= (and b!765915 res!518101) b!765908))

(assert (= (and b!765908 res!518104) b!765918))

(assert (= (and b!765918 res!518110) b!765920))

(assert (= (and b!765920 res!518108) b!765911))

(assert (= (and b!765911 c!84295) b!765907))

(assert (= (and b!765911 (not c!84295)) b!765922))

(assert (= (and b!765911 res!518096) b!765909))

(assert (= (and b!765909 res!518100) b!765916))

(assert (= (and b!765916 res!518098) b!765921))

(assert (= (and b!765921 res!518103) b!765923))

(declare-fun m!711953 () Bool)

(assert (=> b!765921 m!711953))

(assert (=> b!765921 m!711953))

(declare-fun m!711955 () Bool)

(assert (=> b!765921 m!711955))

(assert (=> b!765922 m!711953))

(assert (=> b!765922 m!711953))

(declare-fun m!711957 () Bool)

(assert (=> b!765922 m!711957))

(declare-fun m!711959 () Bool)

(assert (=> b!765909 m!711959))

(declare-fun m!711961 () Bool)

(assert (=> b!765909 m!711961))

(declare-fun m!711963 () Bool)

(assert (=> b!765909 m!711963))

(assert (=> b!765909 m!711959))

(declare-fun m!711965 () Bool)

(assert (=> b!765909 m!711965))

(declare-fun m!711967 () Bool)

(assert (=> b!765909 m!711967))

(declare-fun m!711969 () Bool)

(assert (=> b!765914 m!711969))

(declare-fun m!711971 () Bool)

(assert (=> b!765916 m!711971))

(declare-fun m!711973 () Bool)

(assert (=> b!765916 m!711973))

(assert (=> b!765918 m!711953))

(assert (=> b!765918 m!711953))

(declare-fun m!711975 () Bool)

(assert (=> b!765918 m!711975))

(assert (=> b!765918 m!711975))

(assert (=> b!765918 m!711953))

(declare-fun m!711977 () Bool)

(assert (=> b!765918 m!711977))

(declare-fun m!711979 () Bool)

(assert (=> start!66468 m!711979))

(declare-fun m!711981 () Bool)

(assert (=> start!66468 m!711981))

(assert (=> b!765923 m!711953))

(assert (=> b!765923 m!711953))

(declare-fun m!711983 () Bool)

(assert (=> b!765923 m!711983))

(declare-fun m!711985 () Bool)

(assert (=> b!765913 m!711985))

(assert (=> b!765919 m!711953))

(assert (=> b!765919 m!711953))

(declare-fun m!711987 () Bool)

(assert (=> b!765919 m!711987))

(declare-fun m!711989 () Bool)

(assert (=> b!765915 m!711989))

(declare-fun m!711991 () Bool)

(assert (=> b!765912 m!711991))

(declare-fun m!711993 () Bool)

(assert (=> b!765920 m!711993))

(declare-fun m!711995 () Bool)

(assert (=> b!765910 m!711995))

(assert (=> b!765907 m!711953))

(assert (=> b!765907 m!711953))

(declare-fun m!711997 () Bool)

(assert (=> b!765907 m!711997))

(push 1)

