; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65326 () Bool)

(assert start!65326)

(declare-fun b!742106 () Bool)

(declare-fun res!499346 () Bool)

(declare-fun e!414767 () Bool)

(assert (=> b!742106 (=> (not res!499346) (not e!414767))))

(declare-datatypes ((array!41499 0))(
  ( (array!41500 (arr!19863 (Array (_ BitVec 32) (_ BitVec 64))) (size!20284 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41499)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41499 (_ BitVec 32)) Bool)

(assert (=> b!742106 (= res!499346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742107 () Bool)

(declare-fun res!499348 () Bool)

(declare-fun e!414763 () Bool)

(assert (=> b!742107 (=> (not res!499348) (not e!414763))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742107 (= res!499348 (validKeyInArray!0 (select (arr!19863 a!3186) j!159)))))

(declare-fun b!742108 () Bool)

(declare-fun res!499345 () Bool)

(assert (=> b!742108 (=> (not res!499345) (not e!414767))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742108 (= res!499345 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20284 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20284 a!3186))))))

(declare-fun b!742109 () Bool)

(assert (=> b!742109 (= e!414763 e!414767)))

(declare-fun res!499337 () Bool)

(assert (=> b!742109 (=> (not res!499337) (not e!414767))))

(declare-datatypes ((SeekEntryResult!7463 0))(
  ( (MissingZero!7463 (index!32220 (_ BitVec 32))) (Found!7463 (index!32221 (_ BitVec 32))) (Intermediate!7463 (undefined!8275 Bool) (index!32222 (_ BitVec 32)) (x!63197 (_ BitVec 32))) (Undefined!7463) (MissingVacant!7463 (index!32223 (_ BitVec 32))) )
))
(declare-fun lt!329676 () SeekEntryResult!7463)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742109 (= res!499337 (or (= lt!329676 (MissingZero!7463 i!1173)) (= lt!329676 (MissingVacant!7463 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41499 (_ BitVec 32)) SeekEntryResult!7463)

(assert (=> b!742109 (= lt!329676 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!742110 () Bool)

(declare-fun res!499339 () Bool)

(declare-fun e!414760 () Bool)

(assert (=> b!742110 (=> (not res!499339) (not e!414760))))

(assert (=> b!742110 (= res!499339 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19863 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!329681 () SeekEntryResult!7463)

(declare-fun e!414764 () Bool)

(declare-fun b!742111 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41499 (_ BitVec 32)) SeekEntryResult!7463)

(assert (=> b!742111 (= e!414764 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19863 a!3186) j!159) a!3186 mask!3328) lt!329681))))

(declare-fun e!414761 () Bool)

(declare-fun lt!329680 () SeekEntryResult!7463)

(declare-fun b!742113 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41499 (_ BitVec 32)) SeekEntryResult!7463)

(assert (=> b!742113 (= e!414761 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19863 a!3186) j!159) a!3186 mask!3328) lt!329680))))

(declare-fun b!742114 () Bool)

(assert (=> b!742114 (= e!414767 e!414760)))

(declare-fun res!499342 () Bool)

(assert (=> b!742114 (=> (not res!499342) (not e!414760))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742114 (= res!499342 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19863 a!3186) j!159) mask!3328) (select (arr!19863 a!3186) j!159) a!3186 mask!3328) lt!329680))))

(assert (=> b!742114 (= lt!329680 (Intermediate!7463 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742115 () Bool)

(declare-fun e!414766 () Bool)

(assert (=> b!742115 (= e!414766 (not true))))

(declare-fun e!414762 () Bool)

(assert (=> b!742115 e!414762))

(declare-fun res!499338 () Bool)

(assert (=> b!742115 (=> (not res!499338) (not e!414762))))

(assert (=> b!742115 (= res!499338 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25406 0))(
  ( (Unit!25407) )
))
(declare-fun lt!329679 () Unit!25406)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25406)

(assert (=> b!742115 (= lt!329679 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742116 () Bool)

(assert (=> b!742116 (= e!414761 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19863 a!3186) j!159) a!3186 mask!3328) (Found!7463 j!159)))))

(declare-fun b!742117 () Bool)

(declare-fun res!499347 () Bool)

(assert (=> b!742117 (=> (not res!499347) (not e!414763))))

(declare-fun arrayContainsKey!0 (array!41499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742117 (= res!499347 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!499335 () Bool)

(assert (=> start!65326 (=> (not res!499335) (not e!414763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65326 (= res!499335 (validMask!0 mask!3328))))

(assert (=> start!65326 e!414763))

(assert (=> start!65326 true))

(declare-fun array_inv!15659 (array!41499) Bool)

(assert (=> start!65326 (array_inv!15659 a!3186)))

(declare-fun b!742112 () Bool)

(declare-fun res!499343 () Bool)

(assert (=> b!742112 (=> (not res!499343) (not e!414763))))

(assert (=> b!742112 (= res!499343 (validKeyInArray!0 k!2102))))

(declare-fun b!742118 () Bool)

(assert (=> b!742118 (= e!414762 e!414764)))

(declare-fun res!499341 () Bool)

(assert (=> b!742118 (=> (not res!499341) (not e!414764))))

(assert (=> b!742118 (= res!499341 (= (seekEntryOrOpen!0 (select (arr!19863 a!3186) j!159) a!3186 mask!3328) lt!329681))))

(assert (=> b!742118 (= lt!329681 (Found!7463 j!159))))

(declare-fun b!742119 () Bool)

(declare-fun res!499344 () Bool)

(assert (=> b!742119 (=> (not res!499344) (not e!414763))))

(assert (=> b!742119 (= res!499344 (and (= (size!20284 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20284 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20284 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742120 () Bool)

(declare-fun res!499349 () Bool)

(assert (=> b!742120 (=> (not res!499349) (not e!414767))))

(declare-datatypes ((List!13865 0))(
  ( (Nil!13862) (Cons!13861 (h!14933 (_ BitVec 64)) (t!20180 List!13865)) )
))
(declare-fun arrayNoDuplicates!0 (array!41499 (_ BitVec 32) List!13865) Bool)

(assert (=> b!742120 (= res!499349 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13862))))

(declare-fun b!742121 () Bool)

(assert (=> b!742121 (= e!414760 e!414766)))

(declare-fun res!499340 () Bool)

(assert (=> b!742121 (=> (not res!499340) (not e!414766))))

(declare-fun lt!329678 () array!41499)

(declare-fun lt!329677 () (_ BitVec 64))

(assert (=> b!742121 (= res!499340 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329677 mask!3328) lt!329677 lt!329678 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329677 lt!329678 mask!3328)))))

(assert (=> b!742121 (= lt!329677 (select (store (arr!19863 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!742121 (= lt!329678 (array!41500 (store (arr!19863 a!3186) i!1173 k!2102) (size!20284 a!3186)))))

(declare-fun b!742122 () Bool)

(declare-fun res!499336 () Bool)

(assert (=> b!742122 (=> (not res!499336) (not e!414760))))

(assert (=> b!742122 (= res!499336 e!414761)))

(declare-fun c!81766 () Bool)

(assert (=> b!742122 (= c!81766 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65326 res!499335) b!742119))

(assert (= (and b!742119 res!499344) b!742107))

(assert (= (and b!742107 res!499348) b!742112))

(assert (= (and b!742112 res!499343) b!742117))

(assert (= (and b!742117 res!499347) b!742109))

(assert (= (and b!742109 res!499337) b!742106))

(assert (= (and b!742106 res!499346) b!742120))

(assert (= (and b!742120 res!499349) b!742108))

(assert (= (and b!742108 res!499345) b!742114))

(assert (= (and b!742114 res!499342) b!742110))

(assert (= (and b!742110 res!499339) b!742122))

(assert (= (and b!742122 c!81766) b!742113))

(assert (= (and b!742122 (not c!81766)) b!742116))

(assert (= (and b!742122 res!499336) b!742121))

(assert (= (and b!742121 res!499340) b!742115))

(assert (= (and b!742115 res!499338) b!742118))

(assert (= (and b!742118 res!499341) b!742111))

(declare-fun m!693013 () Bool)

(assert (=> b!742111 m!693013))

(assert (=> b!742111 m!693013))

(declare-fun m!693015 () Bool)

(assert (=> b!742111 m!693015))

(assert (=> b!742116 m!693013))

(assert (=> b!742116 m!693013))

(declare-fun m!693017 () Bool)

(assert (=> b!742116 m!693017))

(declare-fun m!693019 () Bool)

(assert (=> b!742110 m!693019))

(declare-fun m!693021 () Bool)

(assert (=> b!742117 m!693021))

(assert (=> b!742118 m!693013))

(assert (=> b!742118 m!693013))

(declare-fun m!693023 () Bool)

(assert (=> b!742118 m!693023))

(declare-fun m!693025 () Bool)

(assert (=> b!742121 m!693025))

(declare-fun m!693027 () Bool)

(assert (=> b!742121 m!693027))

(assert (=> b!742121 m!693025))

(declare-fun m!693029 () Bool)

(assert (=> b!742121 m!693029))

(declare-fun m!693031 () Bool)

(assert (=> b!742121 m!693031))

(declare-fun m!693033 () Bool)

(assert (=> b!742121 m!693033))

(declare-fun m!693035 () Bool)

(assert (=> b!742120 m!693035))

(declare-fun m!693037 () Bool)

(assert (=> b!742106 m!693037))

(declare-fun m!693039 () Bool)

(assert (=> start!65326 m!693039))

(declare-fun m!693041 () Bool)

(assert (=> start!65326 m!693041))

(assert (=> b!742107 m!693013))

(assert (=> b!742107 m!693013))

(declare-fun m!693043 () Bool)

(assert (=> b!742107 m!693043))

(assert (=> b!742113 m!693013))

(assert (=> b!742113 m!693013))

(declare-fun m!693045 () Bool)

(assert (=> b!742113 m!693045))

(assert (=> b!742114 m!693013))

(assert (=> b!742114 m!693013))

(declare-fun m!693047 () Bool)

(assert (=> b!742114 m!693047))

(assert (=> b!742114 m!693047))

(assert (=> b!742114 m!693013))

(declare-fun m!693049 () Bool)

(assert (=> b!742114 m!693049))

(declare-fun m!693051 () Bool)

(assert (=> b!742109 m!693051))

(declare-fun m!693053 () Bool)

(assert (=> b!742115 m!693053))

(declare-fun m!693055 () Bool)

(assert (=> b!742115 m!693055))

(declare-fun m!693057 () Bool)

(assert (=> b!742112 m!693057))

(push 1)

