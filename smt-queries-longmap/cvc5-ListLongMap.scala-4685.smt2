; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65170 () Bool)

(assert start!65170)

(declare-fun b!736900 () Bool)

(declare-datatypes ((Unit!25136 0))(
  ( (Unit!25137) )
))
(declare-fun e!412210 () Unit!25136)

(declare-fun Unit!25138 () Unit!25136)

(assert (=> b!736900 (= e!412210 Unit!25138)))

(declare-datatypes ((array!41343 0))(
  ( (array!41344 (arr!19785 (Array (_ BitVec 32) (_ BitVec 64))) (size!20206 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41343)

(declare-datatypes ((SeekEntryResult!7385 0))(
  ( (MissingZero!7385 (index!31908 (_ BitVec 32))) (Found!7385 (index!31909 (_ BitVec 32))) (Intermediate!7385 (undefined!8197 Bool) (index!31910 (_ BitVec 32)) (x!62911 (_ BitVec 32))) (Undefined!7385) (MissingVacant!7385 (index!31911 (_ BitVec 32))) )
))
(declare-fun lt!326879 () SeekEntryResult!7385)

(declare-fun lt!326874 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41343 (_ BitVec 32)) SeekEntryResult!7385)

(assert (=> b!736900 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326874 (select (arr!19785 a!3186) j!159) a!3186 mask!3328) lt!326879)))

(declare-fun b!736901 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!412206 () Bool)

(assert (=> b!736901 (= e!412206 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19785 a!3186) j!159) a!3186 mask!3328) lt!326879))))

(declare-fun b!736902 () Bool)

(declare-fun res!495285 () Bool)

(declare-fun e!412213 () Bool)

(assert (=> b!736902 (=> (not res!495285) (not e!412213))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736902 (= res!495285 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20206 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20206 a!3186))))))

(declare-fun b!736904 () Bool)

(declare-fun Unit!25139 () Unit!25136)

(assert (=> b!736904 (= e!412210 Unit!25139)))

(declare-fun lt!326869 () SeekEntryResult!7385)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41343 (_ BitVec 32)) SeekEntryResult!7385)

(assert (=> b!736904 (= lt!326869 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19785 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!326878 () SeekEntryResult!7385)

(assert (=> b!736904 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326874 resIntermediateIndex!5 (select (arr!19785 a!3186) j!159) a!3186 mask!3328) lt!326878)))

(declare-fun b!736905 () Bool)

(declare-fun res!495280 () Bool)

(declare-fun e!412203 () Bool)

(assert (=> b!736905 (=> (not res!495280) (not e!412203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736905 (= res!495280 (validKeyInArray!0 (select (arr!19785 a!3186) j!159)))))

(declare-fun b!736906 () Bool)

(declare-fun e!412207 () Bool)

(assert (=> b!736906 (= e!412207 true)))

(declare-fun lt!326868 () SeekEntryResult!7385)

(declare-fun lt!326866 () (_ BitVec 64))

(declare-fun lt!326872 () array!41343)

(assert (=> b!736906 (= lt!326868 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326874 lt!326866 lt!326872 mask!3328))))

(declare-fun b!736907 () Bool)

(declare-fun res!495289 () Bool)

(declare-fun e!412212 () Bool)

(assert (=> b!736907 (=> (not res!495289) (not e!412212))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736907 (= res!495289 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19785 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736908 () Bool)

(declare-fun res!495281 () Bool)

(assert (=> b!736908 (=> (not res!495281) (not e!412213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41343 (_ BitVec 32)) Bool)

(assert (=> b!736908 (= res!495281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736909 () Bool)

(assert (=> b!736909 (= e!412206 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19785 a!3186) j!159) a!3186 mask!3328) (Found!7385 j!159)))))

(declare-fun b!736910 () Bool)

(declare-fun e!412208 () Bool)

(assert (=> b!736910 (= e!412212 e!412208)))

(declare-fun res!495282 () Bool)

(assert (=> b!736910 (=> (not res!495282) (not e!412208))))

(declare-fun lt!326871 () SeekEntryResult!7385)

(declare-fun lt!326870 () SeekEntryResult!7385)

(assert (=> b!736910 (= res!495282 (= lt!326871 lt!326870))))

(assert (=> b!736910 (= lt!326870 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326866 lt!326872 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736910 (= lt!326871 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326866 mask!3328) lt!326866 lt!326872 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!736910 (= lt!326866 (select (store (arr!19785 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!736910 (= lt!326872 (array!41344 (store (arr!19785 a!3186) i!1173 k!2102) (size!20206 a!3186)))))

(declare-fun b!736911 () Bool)

(declare-fun e!412214 () Bool)

(assert (=> b!736911 (= e!412208 (not e!412214))))

(declare-fun res!495283 () Bool)

(assert (=> b!736911 (=> res!495283 e!412214)))

(assert (=> b!736911 (= res!495283 (or (not (is-Intermediate!7385 lt!326870)) (bvsge x!1131 (x!62911 lt!326870))))))

(assert (=> b!736911 (= lt!326878 (Found!7385 j!159))))

(declare-fun e!412204 () Bool)

(assert (=> b!736911 e!412204))

(declare-fun res!495278 () Bool)

(assert (=> b!736911 (=> (not res!495278) (not e!412204))))

(assert (=> b!736911 (= res!495278 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326876 () Unit!25136)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41343 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25136)

(assert (=> b!736911 (= lt!326876 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736912 () Bool)

(declare-fun e!412205 () Bool)

(assert (=> b!736912 (= e!412204 e!412205)))

(declare-fun res!495287 () Bool)

(assert (=> b!736912 (=> (not res!495287) (not e!412205))))

(declare-fun lt!326875 () SeekEntryResult!7385)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41343 (_ BitVec 32)) SeekEntryResult!7385)

(assert (=> b!736912 (= res!495287 (= (seekEntryOrOpen!0 (select (arr!19785 a!3186) j!159) a!3186 mask!3328) lt!326875))))

(assert (=> b!736912 (= lt!326875 (Found!7385 j!159))))

(declare-fun b!736903 () Bool)

(assert (=> b!736903 (= e!412203 e!412213)))

(declare-fun res!495277 () Bool)

(assert (=> b!736903 (=> (not res!495277) (not e!412213))))

(declare-fun lt!326877 () SeekEntryResult!7385)

(assert (=> b!736903 (= res!495277 (or (= lt!326877 (MissingZero!7385 i!1173)) (= lt!326877 (MissingVacant!7385 i!1173))))))

(assert (=> b!736903 (= lt!326877 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!495288 () Bool)

(assert (=> start!65170 (=> (not res!495288) (not e!412203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65170 (= res!495288 (validMask!0 mask!3328))))

(assert (=> start!65170 e!412203))

(assert (=> start!65170 true))

(declare-fun array_inv!15581 (array!41343) Bool)

(assert (=> start!65170 (array_inv!15581 a!3186)))

(declare-fun b!736913 () Bool)

(declare-fun res!495290 () Bool)

(assert (=> b!736913 (=> (not res!495290) (not e!412203))))

(assert (=> b!736913 (= res!495290 (and (= (size!20206 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20206 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20206 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736914 () Bool)

(declare-fun res!495279 () Bool)

(assert (=> b!736914 (=> (not res!495279) (not e!412203))))

(assert (=> b!736914 (= res!495279 (validKeyInArray!0 k!2102))))

(declare-fun b!736915 () Bool)

(assert (=> b!736915 (= e!412213 e!412212)))

(declare-fun res!495286 () Bool)

(assert (=> b!736915 (=> (not res!495286) (not e!412212))))

(assert (=> b!736915 (= res!495286 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19785 a!3186) j!159) mask!3328) (select (arr!19785 a!3186) j!159) a!3186 mask!3328) lt!326879))))

(assert (=> b!736915 (= lt!326879 (Intermediate!7385 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736916 () Bool)

(assert (=> b!736916 (= e!412205 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19785 a!3186) j!159) a!3186 mask!3328) lt!326875))))

(declare-fun b!736917 () Bool)

(assert (=> b!736917 (= e!412214 e!412207)))

(declare-fun res!495276 () Bool)

(assert (=> b!736917 (=> res!495276 e!412207)))

(assert (=> b!736917 (= res!495276 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326874 #b00000000000000000000000000000000) (bvsge lt!326874 (size!20206 a!3186))))))

(declare-fun lt!326873 () Unit!25136)

(assert (=> b!736917 (= lt!326873 e!412210)))

(declare-fun c!81196 () Bool)

(declare-fun lt!326867 () Bool)

(assert (=> b!736917 (= c!81196 lt!326867)))

(assert (=> b!736917 (= lt!326867 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736917 (= lt!326874 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736918 () Bool)

(declare-fun res!495273 () Bool)

(assert (=> b!736918 (=> (not res!495273) (not e!412203))))

(declare-fun arrayContainsKey!0 (array!41343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736918 (= res!495273 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736919 () Bool)

(declare-fun res!495275 () Bool)

(assert (=> b!736919 (=> res!495275 e!412207)))

(declare-fun e!412209 () Bool)

(assert (=> b!736919 (= res!495275 e!412209)))

(declare-fun c!81195 () Bool)

(assert (=> b!736919 (= c!81195 lt!326867)))

(declare-fun b!736920 () Bool)

(assert (=> b!736920 (= e!412209 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326874 resIntermediateIndex!5 (select (arr!19785 a!3186) j!159) a!3186 mask!3328) lt!326878)))))

(declare-fun b!736921 () Bool)

(declare-fun res!495284 () Bool)

(assert (=> b!736921 (=> (not res!495284) (not e!412213))))

(declare-datatypes ((List!13787 0))(
  ( (Nil!13784) (Cons!13783 (h!14855 (_ BitVec 64)) (t!20102 List!13787)) )
))
(declare-fun arrayNoDuplicates!0 (array!41343 (_ BitVec 32) List!13787) Bool)

(assert (=> b!736921 (= res!495284 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13784))))

(declare-fun b!736922 () Bool)

(declare-fun res!495274 () Bool)

(assert (=> b!736922 (=> (not res!495274) (not e!412212))))

(assert (=> b!736922 (= res!495274 e!412206)))

(declare-fun c!81194 () Bool)

(assert (=> b!736922 (= c!81194 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!736923 () Bool)

(assert (=> b!736923 (= e!412209 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326874 (select (arr!19785 a!3186) j!159) a!3186 mask!3328) lt!326879)))))

(assert (= (and start!65170 res!495288) b!736913))

(assert (= (and b!736913 res!495290) b!736905))

(assert (= (and b!736905 res!495280) b!736914))

(assert (= (and b!736914 res!495279) b!736918))

(assert (= (and b!736918 res!495273) b!736903))

(assert (= (and b!736903 res!495277) b!736908))

(assert (= (and b!736908 res!495281) b!736921))

(assert (= (and b!736921 res!495284) b!736902))

(assert (= (and b!736902 res!495285) b!736915))

(assert (= (and b!736915 res!495286) b!736907))

(assert (= (and b!736907 res!495289) b!736922))

(assert (= (and b!736922 c!81194) b!736901))

(assert (= (and b!736922 (not c!81194)) b!736909))

(assert (= (and b!736922 res!495274) b!736910))

(assert (= (and b!736910 res!495282) b!736911))

(assert (= (and b!736911 res!495278) b!736912))

(assert (= (and b!736912 res!495287) b!736916))

(assert (= (and b!736911 (not res!495283)) b!736917))

(assert (= (and b!736917 c!81196) b!736900))

(assert (= (and b!736917 (not c!81196)) b!736904))

(assert (= (and b!736917 (not res!495276)) b!736919))

(assert (= (and b!736919 c!81195) b!736923))

(assert (= (and b!736919 (not c!81195)) b!736920))

(assert (= (and b!736919 (not res!495275)) b!736906))

(declare-fun m!688915 () Bool)

(assert (=> b!736910 m!688915))

(declare-fun m!688917 () Bool)

(assert (=> b!736910 m!688917))

(declare-fun m!688919 () Bool)

(assert (=> b!736910 m!688919))

(declare-fun m!688921 () Bool)

(assert (=> b!736910 m!688921))

(declare-fun m!688923 () Bool)

(assert (=> b!736910 m!688923))

(assert (=> b!736910 m!688919))

(declare-fun m!688925 () Bool)

(assert (=> b!736904 m!688925))

(assert (=> b!736904 m!688925))

(declare-fun m!688927 () Bool)

(assert (=> b!736904 m!688927))

(assert (=> b!736904 m!688925))

(declare-fun m!688929 () Bool)

(assert (=> b!736904 m!688929))

(declare-fun m!688931 () Bool)

(assert (=> b!736911 m!688931))

(declare-fun m!688933 () Bool)

(assert (=> b!736911 m!688933))

(declare-fun m!688935 () Bool)

(assert (=> start!65170 m!688935))

(declare-fun m!688937 () Bool)

(assert (=> start!65170 m!688937))

(assert (=> b!736923 m!688925))

(assert (=> b!736923 m!688925))

(declare-fun m!688939 () Bool)

(assert (=> b!736923 m!688939))

(assert (=> b!736900 m!688925))

(assert (=> b!736900 m!688925))

(assert (=> b!736900 m!688939))

(declare-fun m!688941 () Bool)

(assert (=> b!736907 m!688941))

(assert (=> b!736901 m!688925))

(assert (=> b!736901 m!688925))

(declare-fun m!688943 () Bool)

(assert (=> b!736901 m!688943))

(assert (=> b!736916 m!688925))

(assert (=> b!736916 m!688925))

(declare-fun m!688945 () Bool)

(assert (=> b!736916 m!688945))

(declare-fun m!688947 () Bool)

(assert (=> b!736917 m!688947))

(assert (=> b!736909 m!688925))

(assert (=> b!736909 m!688925))

(assert (=> b!736909 m!688927))

(assert (=> b!736920 m!688925))

(assert (=> b!736920 m!688925))

(assert (=> b!736920 m!688929))

(declare-fun m!688949 () Bool)

(assert (=> b!736914 m!688949))

(assert (=> b!736912 m!688925))

(assert (=> b!736912 m!688925))

(declare-fun m!688951 () Bool)

(assert (=> b!736912 m!688951))

(declare-fun m!688953 () Bool)

(assert (=> b!736906 m!688953))

(declare-fun m!688955 () Bool)

(assert (=> b!736903 m!688955))

(assert (=> b!736915 m!688925))

(assert (=> b!736915 m!688925))

(declare-fun m!688957 () Bool)

(assert (=> b!736915 m!688957))

(assert (=> b!736915 m!688957))

(assert (=> b!736915 m!688925))

(declare-fun m!688959 () Bool)

(assert (=> b!736915 m!688959))

(declare-fun m!688961 () Bool)

(assert (=> b!736921 m!688961))

(assert (=> b!736905 m!688925))

(assert (=> b!736905 m!688925))

(declare-fun m!688963 () Bool)

(assert (=> b!736905 m!688963))

(declare-fun m!688965 () Bool)

(assert (=> b!736918 m!688965))

(declare-fun m!688967 () Bool)

(assert (=> b!736908 m!688967))

(push 1)

