; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64462 () Bool)

(assert start!64462)

(declare-fun b!724872 () Bool)

(declare-fun res!486040 () Bool)

(declare-fun e!405994 () Bool)

(assert (=> b!724872 (=> (not res!486040) (not e!405994))))

(declare-datatypes ((array!40980 0))(
  ( (array!40981 (arr!19611 (Array (_ BitVec 32) (_ BitVec 64))) (size!20032 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40980)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40980 (_ BitVec 32)) Bool)

(assert (=> b!724872 (= res!486040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!405997 () Bool)

(declare-fun b!724873 () Bool)

(declare-datatypes ((SeekEntryResult!7211 0))(
  ( (MissingZero!7211 (index!31212 (_ BitVec 32))) (Found!7211 (index!31213 (_ BitVec 32))) (Intermediate!7211 (undefined!8023 Bool) (index!31214 (_ BitVec 32)) (x!62213 (_ BitVec 32))) (Undefined!7211) (MissingVacant!7211 (index!31215 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40980 (_ BitVec 32)) SeekEntryResult!7211)

(assert (=> b!724873 (= e!405997 (= (seekEntryOrOpen!0 (select (arr!19611 a!3186) j!159) a!3186 mask!3328) (Found!7211 j!159)))))

(declare-fun b!724874 () Bool)

(declare-fun res!486043 () Bool)

(declare-fun e!405993 () Bool)

(assert (=> b!724874 (=> (not res!486043) (not e!405993))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724874 (= res!486043 (validKeyInArray!0 k!2102))))

(declare-fun b!724875 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!405992 () Bool)

(declare-fun lt!321156 () SeekEntryResult!7211)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40980 (_ BitVec 32)) SeekEntryResult!7211)

(assert (=> b!724875 (= e!405992 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19611 a!3186) j!159) a!3186 mask!3328) lt!321156))))

(declare-fun b!724876 () Bool)

(declare-fun e!405996 () Bool)

(assert (=> b!724876 (= e!405994 e!405996)))

(declare-fun res!486050 () Bool)

(assert (=> b!724876 (=> (not res!486050) (not e!405996))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724876 (= res!486050 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19611 a!3186) j!159) mask!3328) (select (arr!19611 a!3186) j!159) a!3186 mask!3328) lt!321156))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724876 (= lt!321156 (Intermediate!7211 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724877 () Bool)

(declare-fun res!486047 () Bool)

(assert (=> b!724877 (=> (not res!486047) (not e!405994))))

(declare-datatypes ((List!13613 0))(
  ( (Nil!13610) (Cons!13609 (h!14666 (_ BitVec 64)) (t!19928 List!13613)) )
))
(declare-fun arrayNoDuplicates!0 (array!40980 (_ BitVec 32) List!13613) Bool)

(assert (=> b!724877 (= res!486047 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13610))))

(declare-fun b!724878 () Bool)

(declare-fun res!486046 () Bool)

(assert (=> b!724878 (=> (not res!486046) (not e!405993))))

(assert (=> b!724878 (= res!486046 (validKeyInArray!0 (select (arr!19611 a!3186) j!159)))))

(declare-fun res!486052 () Bool)

(assert (=> start!64462 (=> (not res!486052) (not e!405993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64462 (= res!486052 (validMask!0 mask!3328))))

(assert (=> start!64462 e!405993))

(assert (=> start!64462 true))

(declare-fun array_inv!15407 (array!40980) Bool)

(assert (=> start!64462 (array_inv!15407 a!3186)))

(declare-fun b!724879 () Bool)

(declare-fun e!405998 () Bool)

(assert (=> b!724879 (= e!405996 e!405998)))

(declare-fun res!486044 () Bool)

(assert (=> b!724879 (=> (not res!486044) (not e!405998))))

(declare-fun lt!321154 () (_ BitVec 64))

(declare-fun lt!321157 () array!40980)

(assert (=> b!724879 (= res!486044 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321154 mask!3328) lt!321154 lt!321157 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321154 lt!321157 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!724879 (= lt!321154 (select (store (arr!19611 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!724879 (= lt!321157 (array!40981 (store (arr!19611 a!3186) i!1173 k!2102) (size!20032 a!3186)))))

(declare-fun b!724880 () Bool)

(declare-fun res!486051 () Bool)

(assert (=> b!724880 (=> (not res!486051) (not e!405996))))

(assert (=> b!724880 (= res!486051 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19611 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724881 () Bool)

(assert (=> b!724881 (= e!405993 e!405994)))

(declare-fun res!486053 () Bool)

(assert (=> b!724881 (=> (not res!486053) (not e!405994))))

(declare-fun lt!321155 () SeekEntryResult!7211)

(assert (=> b!724881 (= res!486053 (or (= lt!321155 (MissingZero!7211 i!1173)) (= lt!321155 (MissingVacant!7211 i!1173))))))

(assert (=> b!724881 (= lt!321155 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!724882 () Bool)

(declare-fun res!486049 () Bool)

(assert (=> b!724882 (=> (not res!486049) (not e!405996))))

(assert (=> b!724882 (= res!486049 e!405992)))

(declare-fun c!79789 () Bool)

(assert (=> b!724882 (= c!79789 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724883 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40980 (_ BitVec 32)) SeekEntryResult!7211)

(assert (=> b!724883 (= e!405992 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19611 a!3186) j!159) a!3186 mask!3328) (Found!7211 j!159)))))

(declare-fun b!724884 () Bool)

(declare-fun res!486041 () Bool)

(assert (=> b!724884 (=> (not res!486041) (not e!405993))))

(assert (=> b!724884 (= res!486041 (and (= (size!20032 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20032 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20032 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!724885 () Bool)

(declare-fun res!486042 () Bool)

(assert (=> b!724885 (=> (not res!486042) (not e!405994))))

(assert (=> b!724885 (= res!486042 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20032 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20032 a!3186))))))

(declare-fun b!724886 () Bool)

(assert (=> b!724886 (= e!405998 (not true))))

(assert (=> b!724886 e!405997))

(declare-fun res!486048 () Bool)

(assert (=> b!724886 (=> (not res!486048) (not e!405997))))

(assert (=> b!724886 (= res!486048 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24740 0))(
  ( (Unit!24741) )
))
(declare-fun lt!321158 () Unit!24740)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24740)

(assert (=> b!724886 (= lt!321158 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!724887 () Bool)

(declare-fun res!486045 () Bool)

(assert (=> b!724887 (=> (not res!486045) (not e!405993))))

(declare-fun arrayContainsKey!0 (array!40980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724887 (= res!486045 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64462 res!486052) b!724884))

(assert (= (and b!724884 res!486041) b!724878))

(assert (= (and b!724878 res!486046) b!724874))

(assert (= (and b!724874 res!486043) b!724887))

(assert (= (and b!724887 res!486045) b!724881))

(assert (= (and b!724881 res!486053) b!724872))

(assert (= (and b!724872 res!486040) b!724877))

(assert (= (and b!724877 res!486047) b!724885))

(assert (= (and b!724885 res!486042) b!724876))

(assert (= (and b!724876 res!486050) b!724880))

(assert (= (and b!724880 res!486051) b!724882))

(assert (= (and b!724882 c!79789) b!724875))

(assert (= (and b!724882 (not c!79789)) b!724883))

(assert (= (and b!724882 res!486049) b!724879))

(assert (= (and b!724879 res!486044) b!724886))

(assert (= (and b!724886 res!486048) b!724873))

(declare-fun m!679087 () Bool)

(assert (=> b!724881 m!679087))

(declare-fun m!679089 () Bool)

(assert (=> b!724877 m!679089))

(declare-fun m!679091 () Bool)

(assert (=> b!724878 m!679091))

(assert (=> b!724878 m!679091))

(declare-fun m!679093 () Bool)

(assert (=> b!724878 m!679093))

(declare-fun m!679095 () Bool)

(assert (=> b!724879 m!679095))

(declare-fun m!679097 () Bool)

(assert (=> b!724879 m!679097))

(declare-fun m!679099 () Bool)

(assert (=> b!724879 m!679099))

(declare-fun m!679101 () Bool)

(assert (=> b!724879 m!679101))

(assert (=> b!724879 m!679095))

(declare-fun m!679103 () Bool)

(assert (=> b!724879 m!679103))

(assert (=> b!724876 m!679091))

(assert (=> b!724876 m!679091))

(declare-fun m!679105 () Bool)

(assert (=> b!724876 m!679105))

(assert (=> b!724876 m!679105))

(assert (=> b!724876 m!679091))

(declare-fun m!679107 () Bool)

(assert (=> b!724876 m!679107))

(assert (=> b!724883 m!679091))

(assert (=> b!724883 m!679091))

(declare-fun m!679109 () Bool)

(assert (=> b!724883 m!679109))

(assert (=> b!724873 m!679091))

(assert (=> b!724873 m!679091))

(declare-fun m!679111 () Bool)

(assert (=> b!724873 m!679111))

(declare-fun m!679113 () Bool)

(assert (=> b!724887 m!679113))

(declare-fun m!679115 () Bool)

(assert (=> b!724886 m!679115))

(declare-fun m!679117 () Bool)

(assert (=> b!724886 m!679117))

(declare-fun m!679119 () Bool)

(assert (=> b!724880 m!679119))

(declare-fun m!679121 () Bool)

(assert (=> b!724872 m!679121))

(declare-fun m!679123 () Bool)

(assert (=> b!724874 m!679123))

(declare-fun m!679125 () Bool)

(assert (=> start!64462 m!679125))

(declare-fun m!679127 () Bool)

(assert (=> start!64462 m!679127))

(assert (=> b!724875 m!679091))

(assert (=> b!724875 m!679091))

(declare-fun m!679129 () Bool)

(assert (=> b!724875 m!679129))

(push 1)

