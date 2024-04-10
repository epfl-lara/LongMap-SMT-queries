; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65690 () Bool)

(assert start!65690)

(declare-fun b!753218 () Bool)

(declare-fun res!508787 () Bool)

(declare-fun e!420119 () Bool)

(assert (=> b!753218 (=> (not res!508787) (not e!420119))))

(declare-datatypes ((array!41863 0))(
  ( (array!41864 (arr!20045 (Array (_ BitVec 32) (_ BitVec 64))) (size!20466 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41863)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753218 (= res!508787 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753219 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7645 0))(
  ( (MissingZero!7645 (index!32948 (_ BitVec 32))) (Found!7645 (index!32949 (_ BitVec 32))) (Intermediate!7645 (undefined!8457 Bool) (index!32950 (_ BitVec 32)) (x!63859 (_ BitVec 32))) (Undefined!7645) (MissingVacant!7645 (index!32951 (_ BitVec 32))) )
))
(declare-fun lt!335114 () SeekEntryResult!7645)

(declare-fun e!420120 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41863 (_ BitVec 32)) SeekEntryResult!7645)

(assert (=> b!753219 (= e!420120 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20045 a!3186) j!159) a!3186 mask!3328) lt!335114))))

(declare-fun b!753220 () Bool)

(declare-fun res!508796 () Bool)

(declare-fun e!420122 () Bool)

(assert (=> b!753220 (=> (not res!508796) (not e!420122))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!753220 (= res!508796 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20045 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753221 () Bool)

(declare-datatypes ((Unit!25960 0))(
  ( (Unit!25961) )
))
(declare-fun e!420115 () Unit!25960)

(declare-fun Unit!25962 () Unit!25960)

(assert (=> b!753221 (= e!420115 Unit!25962)))

(assert (=> b!753221 false))

(declare-fun b!753222 () Bool)

(declare-fun res!508799 () Bool)

(declare-fun e!420123 () Bool)

(assert (=> b!753222 (=> (not res!508799) (not e!420123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41863 (_ BitVec 32)) Bool)

(assert (=> b!753222 (= res!508799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753223 () Bool)

(declare-fun Unit!25963 () Unit!25960)

(assert (=> b!753223 (= e!420115 Unit!25963)))

(declare-fun b!753224 () Bool)

(declare-fun res!508788 () Bool)

(assert (=> b!753224 (=> (not res!508788) (not e!420123))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753224 (= res!508788 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20466 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20466 a!3186))))))

(declare-fun b!753225 () Bool)

(declare-fun res!508792 () Bool)

(assert (=> b!753225 (=> (not res!508792) (not e!420123))))

(declare-datatypes ((List!14047 0))(
  ( (Nil!14044) (Cons!14043 (h!15115 (_ BitVec 64)) (t!20362 List!14047)) )
))
(declare-fun arrayNoDuplicates!0 (array!41863 (_ BitVec 32) List!14047) Bool)

(assert (=> b!753225 (= res!508792 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14044))))

(declare-fun b!753226 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41863 (_ BitVec 32)) SeekEntryResult!7645)

(assert (=> b!753226 (= e!420120 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20045 a!3186) j!159) a!3186 mask!3328) (Found!7645 j!159)))))

(declare-fun b!753227 () Bool)

(declare-fun e!420121 () Bool)

(declare-fun e!420114 () Bool)

(assert (=> b!753227 (= e!420121 (not e!420114))))

(declare-fun res!508783 () Bool)

(assert (=> b!753227 (=> res!508783 e!420114)))

(declare-fun lt!335112 () SeekEntryResult!7645)

(assert (=> b!753227 (= res!508783 (or (not (is-Intermediate!7645 lt!335112)) (bvslt x!1131 (x!63859 lt!335112)) (not (= x!1131 (x!63859 lt!335112))) (not (= index!1321 (index!32950 lt!335112)))))))

(declare-fun e!420117 () Bool)

(assert (=> b!753227 e!420117))

(declare-fun res!508794 () Bool)

(assert (=> b!753227 (=> (not res!508794) (not e!420117))))

(declare-fun lt!335109 () SeekEntryResult!7645)

(declare-fun lt!335116 () SeekEntryResult!7645)

(assert (=> b!753227 (= res!508794 (= lt!335109 lt!335116))))

(assert (=> b!753227 (= lt!335116 (Found!7645 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41863 (_ BitVec 32)) SeekEntryResult!7645)

(assert (=> b!753227 (= lt!335109 (seekEntryOrOpen!0 (select (arr!20045 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!753227 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335115 () Unit!25960)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41863 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25960)

(assert (=> b!753227 (= lt!335115 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753228 () Bool)

(declare-fun res!508786 () Bool)

(assert (=> b!753228 (=> (not res!508786) (not e!420122))))

(assert (=> b!753228 (= res!508786 e!420120)))

(declare-fun c!82600 () Bool)

(assert (=> b!753228 (= c!82600 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753229 () Bool)

(declare-fun e!420124 () Bool)

(declare-fun e!420116 () Bool)

(assert (=> b!753229 (= e!420124 e!420116)))

(declare-fun res!508791 () Bool)

(assert (=> b!753229 (=> res!508791 e!420116)))

(declare-fun lt!335113 () (_ BitVec 64))

(declare-fun lt!335107 () (_ BitVec 64))

(assert (=> b!753229 (= res!508791 (= lt!335113 lt!335107))))

(assert (=> b!753229 (= lt!335113 (select (store (arr!20045 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!753230 () Bool)

(declare-fun res!508797 () Bool)

(declare-fun e!420118 () Bool)

(assert (=> b!753230 (=> (not res!508797) (not e!420118))))

(declare-fun lt!335108 () array!41863)

(assert (=> b!753230 (= res!508797 (= (seekEntryOrOpen!0 lt!335107 lt!335108 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335107 lt!335108 mask!3328)))))

(declare-fun b!753231 () Bool)

(declare-fun res!508789 () Bool)

(assert (=> b!753231 (=> (not res!508789) (not e!420119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753231 (= res!508789 (validKeyInArray!0 (select (arr!20045 a!3186) j!159)))))

(declare-fun b!753232 () Bool)

(assert (=> b!753232 (= e!420116 true)))

(assert (=> b!753232 e!420118))

(declare-fun res!508795 () Bool)

(assert (=> b!753232 (=> (not res!508795) (not e!420118))))

(assert (=> b!753232 (= res!508795 (= lt!335113 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335111 () Unit!25960)

(assert (=> b!753232 (= lt!335111 e!420115)))

(declare-fun c!82599 () Bool)

(assert (=> b!753232 (= c!82599 (= lt!335113 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753233 () Bool)

(assert (=> b!753233 (= e!420117 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20045 a!3186) j!159) a!3186 mask!3328) lt!335116))))

(declare-fun b!753234 () Bool)

(assert (=> b!753234 (= e!420123 e!420122)))

(declare-fun res!508790 () Bool)

(assert (=> b!753234 (=> (not res!508790) (not e!420122))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753234 (= res!508790 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20045 a!3186) j!159) mask!3328) (select (arr!20045 a!3186) j!159) a!3186 mask!3328) lt!335114))))

(assert (=> b!753234 (= lt!335114 (Intermediate!7645 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753235 () Bool)

(declare-fun res!508785 () Bool)

(assert (=> b!753235 (=> (not res!508785) (not e!420119))))

(assert (=> b!753235 (= res!508785 (and (= (size!20466 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20466 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20466 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753236 () Bool)

(declare-fun lt!335110 () SeekEntryResult!7645)

(assert (=> b!753236 (= e!420118 (= lt!335109 lt!335110))))

(declare-fun b!753237 () Bool)

(declare-fun res!508781 () Bool)

(assert (=> b!753237 (=> (not res!508781) (not e!420119))))

(assert (=> b!753237 (= res!508781 (validKeyInArray!0 k!2102))))

(declare-fun b!753238 () Bool)

(assert (=> b!753238 (= e!420119 e!420123)))

(declare-fun res!508793 () Bool)

(assert (=> b!753238 (=> (not res!508793) (not e!420123))))

(declare-fun lt!335117 () SeekEntryResult!7645)

(assert (=> b!753238 (= res!508793 (or (= lt!335117 (MissingZero!7645 i!1173)) (= lt!335117 (MissingVacant!7645 i!1173))))))

(assert (=> b!753238 (= lt!335117 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!753239 () Bool)

(assert (=> b!753239 (= e!420122 e!420121)))

(declare-fun res!508784 () Bool)

(assert (=> b!753239 (=> (not res!508784) (not e!420121))))

(declare-fun lt!335106 () SeekEntryResult!7645)

(assert (=> b!753239 (= res!508784 (= lt!335106 lt!335112))))

(assert (=> b!753239 (= lt!335112 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335107 lt!335108 mask!3328))))

(assert (=> b!753239 (= lt!335106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335107 mask!3328) lt!335107 lt!335108 mask!3328))))

(assert (=> b!753239 (= lt!335107 (select (store (arr!20045 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!753239 (= lt!335108 (array!41864 (store (arr!20045 a!3186) i!1173 k!2102) (size!20466 a!3186)))))

(declare-fun res!508782 () Bool)

(assert (=> start!65690 (=> (not res!508782) (not e!420119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65690 (= res!508782 (validMask!0 mask!3328))))

(assert (=> start!65690 e!420119))

(assert (=> start!65690 true))

(declare-fun array_inv!15841 (array!41863) Bool)

(assert (=> start!65690 (array_inv!15841 a!3186)))

(declare-fun b!753240 () Bool)

(assert (=> b!753240 (= e!420114 e!420124)))

(declare-fun res!508798 () Bool)

(assert (=> b!753240 (=> res!508798 e!420124)))

(assert (=> b!753240 (= res!508798 (not (= lt!335110 lt!335116)))))

(assert (=> b!753240 (= lt!335110 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20045 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!65690 res!508782) b!753235))

(assert (= (and b!753235 res!508785) b!753231))

(assert (= (and b!753231 res!508789) b!753237))

(assert (= (and b!753237 res!508781) b!753218))

(assert (= (and b!753218 res!508787) b!753238))

(assert (= (and b!753238 res!508793) b!753222))

(assert (= (and b!753222 res!508799) b!753225))

(assert (= (and b!753225 res!508792) b!753224))

(assert (= (and b!753224 res!508788) b!753234))

(assert (= (and b!753234 res!508790) b!753220))

(assert (= (and b!753220 res!508796) b!753228))

(assert (= (and b!753228 c!82600) b!753219))

(assert (= (and b!753228 (not c!82600)) b!753226))

(assert (= (and b!753228 res!508786) b!753239))

(assert (= (and b!753239 res!508784) b!753227))

(assert (= (and b!753227 res!508794) b!753233))

(assert (= (and b!753227 (not res!508783)) b!753240))

(assert (= (and b!753240 (not res!508798)) b!753229))

(assert (= (and b!753229 (not res!508791)) b!753232))

(assert (= (and b!753232 c!82599) b!753221))

(assert (= (and b!753232 (not c!82599)) b!753223))

(assert (= (and b!753232 res!508795) b!753230))

(assert (= (and b!753230 res!508797) b!753236))

(declare-fun m!701967 () Bool)

(assert (=> b!753239 m!701967))

(declare-fun m!701969 () Bool)

(assert (=> b!753239 m!701969))

(declare-fun m!701971 () Bool)

(assert (=> b!753239 m!701971))

(declare-fun m!701973 () Bool)

(assert (=> b!753239 m!701973))

(declare-fun m!701975 () Bool)

(assert (=> b!753239 m!701975))

(assert (=> b!753239 m!701967))

(declare-fun m!701977 () Bool)

(assert (=> b!753230 m!701977))

(declare-fun m!701979 () Bool)

(assert (=> b!753230 m!701979))

(declare-fun m!701981 () Bool)

(assert (=> b!753240 m!701981))

(assert (=> b!753240 m!701981))

(declare-fun m!701983 () Bool)

(assert (=> b!753240 m!701983))

(declare-fun m!701985 () Bool)

(assert (=> b!753220 m!701985))

(assert (=> b!753219 m!701981))

(assert (=> b!753219 m!701981))

(declare-fun m!701987 () Bool)

(assert (=> b!753219 m!701987))

(declare-fun m!701989 () Bool)

(assert (=> start!65690 m!701989))

(declare-fun m!701991 () Bool)

(assert (=> start!65690 m!701991))

(declare-fun m!701993 () Bool)

(assert (=> b!753222 m!701993))

(assert (=> b!753234 m!701981))

(assert (=> b!753234 m!701981))

(declare-fun m!701995 () Bool)

(assert (=> b!753234 m!701995))

(assert (=> b!753234 m!701995))

(assert (=> b!753234 m!701981))

(declare-fun m!701997 () Bool)

(assert (=> b!753234 m!701997))

(assert (=> b!753233 m!701981))

(assert (=> b!753233 m!701981))

(declare-fun m!701999 () Bool)

(assert (=> b!753233 m!701999))

(declare-fun m!702001 () Bool)

(assert (=> b!753218 m!702001))

(declare-fun m!702003 () Bool)

(assert (=> b!753237 m!702003))

(declare-fun m!702005 () Bool)

(assert (=> b!753238 m!702005))

(assert (=> b!753231 m!701981))

(assert (=> b!753231 m!701981))

(declare-fun m!702007 () Bool)

(assert (=> b!753231 m!702007))

(assert (=> b!753227 m!701981))

(assert (=> b!753227 m!701981))

(declare-fun m!702009 () Bool)

(assert (=> b!753227 m!702009))

(declare-fun m!702011 () Bool)

(assert (=> b!753227 m!702011))

(declare-fun m!702013 () Bool)

(assert (=> b!753227 m!702013))

(assert (=> b!753226 m!701981))

(assert (=> b!753226 m!701981))

(assert (=> b!753226 m!701983))

(declare-fun m!702015 () Bool)

(assert (=> b!753225 m!702015))

(assert (=> b!753229 m!701973))

(declare-fun m!702017 () Bool)

(assert (=> b!753229 m!702017))

(push 1)

