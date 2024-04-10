; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67874 () Bool)

(assert start!67874)

(declare-fun b!789041 () Bool)

(declare-fun res!534405 () Bool)

(declare-fun e!438577 () Bool)

(assert (=> b!789041 (=> (not res!534405) (not e!438577))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42851 0))(
  ( (array!42852 (arr!20512 (Array (_ BitVec 32) (_ BitVec 64))) (size!20933 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42851)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!789041 (= res!534405 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20933 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20933 a!3186))))))

(declare-fun b!789042 () Bool)

(declare-fun e!438578 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8112 0))(
  ( (MissingZero!8112 (index!34816 (_ BitVec 32))) (Found!8112 (index!34817 (_ BitVec 32))) (Intermediate!8112 (undefined!8924 Bool) (index!34818 (_ BitVec 32)) (x!65757 (_ BitVec 32))) (Undefined!8112) (MissingVacant!8112 (index!34819 (_ BitVec 32))) )
))
(declare-fun lt!352032 () SeekEntryResult!8112)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42851 (_ BitVec 32)) SeekEntryResult!8112)

(assert (=> b!789042 (= e!438578 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20512 a!3186) j!159) a!3186 mask!3328) lt!352032))))

(declare-fun b!789043 () Bool)

(declare-fun e!438570 () Bool)

(declare-fun e!438567 () Bool)

(assert (=> b!789043 (= e!438570 e!438567)))

(declare-fun res!534400 () Bool)

(assert (=> b!789043 (=> res!534400 e!438567)))

(declare-fun lt!352034 () SeekEntryResult!8112)

(declare-fun lt!352035 () SeekEntryResult!8112)

(assert (=> b!789043 (= res!534400 (not (= lt!352034 lt!352035)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42851 (_ BitVec 32)) SeekEntryResult!8112)

(assert (=> b!789043 (= lt!352034 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20512 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789044 () Bool)

(declare-fun e!438569 () Bool)

(declare-fun e!438576 () Bool)

(assert (=> b!789044 (= e!438569 e!438576)))

(declare-fun res!534401 () Bool)

(assert (=> b!789044 (=> (not res!534401) (not e!438576))))

(declare-fun lt!352038 () SeekEntryResult!8112)

(declare-fun lt!352030 () SeekEntryResult!8112)

(assert (=> b!789044 (= res!534401 (= lt!352038 lt!352030))))

(declare-fun lt!352036 () array!42851)

(declare-fun lt!352037 () (_ BitVec 64))

(assert (=> b!789044 (= lt!352030 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352037 lt!352036 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789044 (= lt!352038 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352037 mask!3328) lt!352037 lt!352036 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!789044 (= lt!352037 (select (store (arr!20512 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!789044 (= lt!352036 (array!42852 (store (arr!20512 a!3186) i!1173 k0!2102) (size!20933 a!3186)))))

(declare-fun b!789045 () Bool)

(assert (=> b!789045 (= e!438578 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20512 a!3186) j!159) a!3186 mask!3328) (Found!8112 j!159)))))

(declare-fun b!789046 () Bool)

(declare-fun res!534394 () Bool)

(declare-fun e!438568 () Bool)

(assert (=> b!789046 (=> (not res!534394) (not e!438568))))

(assert (=> b!789046 (= res!534394 (and (= (size!20933 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20933 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20933 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789047 () Bool)

(declare-fun e!438572 () Bool)

(declare-fun lt!352029 () SeekEntryResult!8112)

(assert (=> b!789047 (= e!438572 (= lt!352029 lt!352034))))

(declare-fun b!789048 () Bool)

(declare-fun res!534391 () Bool)

(assert (=> b!789048 (=> (not res!534391) (not e!438569))))

(assert (=> b!789048 (= res!534391 e!438578)))

(declare-fun c!87735 () Bool)

(assert (=> b!789048 (= c!87735 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!789049 () Bool)

(declare-datatypes ((Unit!27336 0))(
  ( (Unit!27337) )
))
(declare-fun e!438571 () Unit!27336)

(declare-fun Unit!27338 () Unit!27336)

(assert (=> b!789049 (= e!438571 Unit!27338)))

(assert (=> b!789049 false))

(declare-fun b!789050 () Bool)

(assert (=> b!789050 (= e!438577 e!438569)))

(declare-fun res!534389 () Bool)

(assert (=> b!789050 (=> (not res!534389) (not e!438569))))

(assert (=> b!789050 (= res!534389 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20512 a!3186) j!159) mask!3328) (select (arr!20512 a!3186) j!159) a!3186 mask!3328) lt!352032))))

(assert (=> b!789050 (= lt!352032 (Intermediate!8112 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789051 () Bool)

(declare-fun res!534399 () Bool)

(assert (=> b!789051 (=> (not res!534399) (not e!438572))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42851 (_ BitVec 32)) SeekEntryResult!8112)

(assert (=> b!789051 (= res!534399 (= (seekEntryOrOpen!0 lt!352037 lt!352036 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352037 lt!352036 mask!3328)))))

(declare-fun b!789052 () Bool)

(assert (=> b!789052 (= e!438568 e!438577)))

(declare-fun res!534390 () Bool)

(assert (=> b!789052 (=> (not res!534390) (not e!438577))))

(declare-fun lt!352039 () SeekEntryResult!8112)

(assert (=> b!789052 (= res!534390 (or (= lt!352039 (MissingZero!8112 i!1173)) (= lt!352039 (MissingVacant!8112 i!1173))))))

(assert (=> b!789052 (= lt!352039 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!789053 () Bool)

(declare-fun res!534407 () Bool)

(assert (=> b!789053 (=> (not res!534407) (not e!438569))))

(assert (=> b!789053 (= res!534407 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20512 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789054 () Bool)

(declare-fun e!438573 () Bool)

(assert (=> b!789054 (= e!438573 true)))

(assert (=> b!789054 e!438572))

(declare-fun res!534406 () Bool)

(assert (=> b!789054 (=> (not res!534406) (not e!438572))))

(declare-fun lt!352031 () (_ BitVec 64))

(assert (=> b!789054 (= res!534406 (= lt!352031 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!352040 () Unit!27336)

(assert (=> b!789054 (= lt!352040 e!438571)))

(declare-fun c!87736 () Bool)

(assert (=> b!789054 (= c!87736 (= lt!352031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789055 () Bool)

(declare-fun res!534393 () Bool)

(assert (=> b!789055 (=> (not res!534393) (not e!438568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789055 (= res!534393 (validKeyInArray!0 (select (arr!20512 a!3186) j!159)))))

(declare-fun b!789056 () Bool)

(declare-fun res!534402 () Bool)

(assert (=> b!789056 (=> (not res!534402) (not e!438568))))

(assert (=> b!789056 (= res!534402 (validKeyInArray!0 k0!2102))))

(declare-fun b!789057 () Bool)

(declare-fun e!438574 () Bool)

(assert (=> b!789057 (= e!438574 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20512 a!3186) j!159) a!3186 mask!3328) lt!352035))))

(declare-fun b!789058 () Bool)

(declare-fun res!534392 () Bool)

(assert (=> b!789058 (=> (not res!534392) (not e!438568))))

(declare-fun arrayContainsKey!0 (array!42851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789058 (= res!534392 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789059 () Bool)

(assert (=> b!789059 (= e!438576 (not e!438570))))

(declare-fun res!534404 () Bool)

(assert (=> b!789059 (=> res!534404 e!438570)))

(get-info :version)

(assert (=> b!789059 (= res!534404 (or (not ((_ is Intermediate!8112) lt!352030)) (bvslt x!1131 (x!65757 lt!352030)) (not (= x!1131 (x!65757 lt!352030))) (not (= index!1321 (index!34818 lt!352030)))))))

(assert (=> b!789059 e!438574))

(declare-fun res!534403 () Bool)

(assert (=> b!789059 (=> (not res!534403) (not e!438574))))

(assert (=> b!789059 (= res!534403 (= lt!352029 lt!352035))))

(assert (=> b!789059 (= lt!352035 (Found!8112 j!159))))

(assert (=> b!789059 (= lt!352029 (seekEntryOrOpen!0 (select (arr!20512 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42851 (_ BitVec 32)) Bool)

(assert (=> b!789059 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352033 () Unit!27336)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42851 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27336)

(assert (=> b!789059 (= lt!352033 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789060 () Bool)

(declare-fun res!534396 () Bool)

(assert (=> b!789060 (=> (not res!534396) (not e!438577))))

(assert (=> b!789060 (= res!534396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789061 () Bool)

(declare-fun Unit!27339 () Unit!27336)

(assert (=> b!789061 (= e!438571 Unit!27339)))

(declare-fun b!789062 () Bool)

(declare-fun res!534397 () Bool)

(assert (=> b!789062 (=> (not res!534397) (not e!438577))))

(declare-datatypes ((List!14514 0))(
  ( (Nil!14511) (Cons!14510 (h!15636 (_ BitVec 64)) (t!20829 List!14514)) )
))
(declare-fun arrayNoDuplicates!0 (array!42851 (_ BitVec 32) List!14514) Bool)

(assert (=> b!789062 (= res!534397 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14511))))

(declare-fun b!789063 () Bool)

(assert (=> b!789063 (= e!438567 e!438573)))

(declare-fun res!534398 () Bool)

(assert (=> b!789063 (=> res!534398 e!438573)))

(assert (=> b!789063 (= res!534398 (= lt!352031 lt!352037))))

(assert (=> b!789063 (= lt!352031 (select (store (arr!20512 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun res!534395 () Bool)

(assert (=> start!67874 (=> (not res!534395) (not e!438568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67874 (= res!534395 (validMask!0 mask!3328))))

(assert (=> start!67874 e!438568))

(assert (=> start!67874 true))

(declare-fun array_inv!16308 (array!42851) Bool)

(assert (=> start!67874 (array_inv!16308 a!3186)))

(assert (= (and start!67874 res!534395) b!789046))

(assert (= (and b!789046 res!534394) b!789055))

(assert (= (and b!789055 res!534393) b!789056))

(assert (= (and b!789056 res!534402) b!789058))

(assert (= (and b!789058 res!534392) b!789052))

(assert (= (and b!789052 res!534390) b!789060))

(assert (= (and b!789060 res!534396) b!789062))

(assert (= (and b!789062 res!534397) b!789041))

(assert (= (and b!789041 res!534405) b!789050))

(assert (= (and b!789050 res!534389) b!789053))

(assert (= (and b!789053 res!534407) b!789048))

(assert (= (and b!789048 c!87735) b!789042))

(assert (= (and b!789048 (not c!87735)) b!789045))

(assert (= (and b!789048 res!534391) b!789044))

(assert (= (and b!789044 res!534401) b!789059))

(assert (= (and b!789059 res!534403) b!789057))

(assert (= (and b!789059 (not res!534404)) b!789043))

(assert (= (and b!789043 (not res!534400)) b!789063))

(assert (= (and b!789063 (not res!534398)) b!789054))

(assert (= (and b!789054 c!87736) b!789049))

(assert (= (and b!789054 (not c!87736)) b!789061))

(assert (= (and b!789054 res!534406) b!789051))

(assert (= (and b!789051 res!534399) b!789047))

(declare-fun m!730221 () Bool)

(assert (=> b!789045 m!730221))

(assert (=> b!789045 m!730221))

(declare-fun m!730223 () Bool)

(assert (=> b!789045 m!730223))

(declare-fun m!730225 () Bool)

(assert (=> b!789058 m!730225))

(declare-fun m!730227 () Bool)

(assert (=> b!789051 m!730227))

(declare-fun m!730229 () Bool)

(assert (=> b!789051 m!730229))

(assert (=> b!789042 m!730221))

(assert (=> b!789042 m!730221))

(declare-fun m!730231 () Bool)

(assert (=> b!789042 m!730231))

(assert (=> b!789059 m!730221))

(assert (=> b!789059 m!730221))

(declare-fun m!730233 () Bool)

(assert (=> b!789059 m!730233))

(declare-fun m!730235 () Bool)

(assert (=> b!789059 m!730235))

(declare-fun m!730237 () Bool)

(assert (=> b!789059 m!730237))

(declare-fun m!730239 () Bool)

(assert (=> b!789053 m!730239))

(declare-fun m!730241 () Bool)

(assert (=> b!789056 m!730241))

(declare-fun m!730243 () Bool)

(assert (=> b!789060 m!730243))

(assert (=> b!789055 m!730221))

(assert (=> b!789055 m!730221))

(declare-fun m!730245 () Bool)

(assert (=> b!789055 m!730245))

(declare-fun m!730247 () Bool)

(assert (=> b!789052 m!730247))

(assert (=> b!789057 m!730221))

(assert (=> b!789057 m!730221))

(declare-fun m!730249 () Bool)

(assert (=> b!789057 m!730249))

(assert (=> b!789050 m!730221))

(assert (=> b!789050 m!730221))

(declare-fun m!730251 () Bool)

(assert (=> b!789050 m!730251))

(assert (=> b!789050 m!730251))

(assert (=> b!789050 m!730221))

(declare-fun m!730253 () Bool)

(assert (=> b!789050 m!730253))

(declare-fun m!730255 () Bool)

(assert (=> b!789062 m!730255))

(declare-fun m!730257 () Bool)

(assert (=> b!789044 m!730257))

(declare-fun m!730259 () Bool)

(assert (=> b!789044 m!730259))

(assert (=> b!789044 m!730257))

(declare-fun m!730261 () Bool)

(assert (=> b!789044 m!730261))

(declare-fun m!730263 () Bool)

(assert (=> b!789044 m!730263))

(declare-fun m!730265 () Bool)

(assert (=> b!789044 m!730265))

(declare-fun m!730267 () Bool)

(assert (=> start!67874 m!730267))

(declare-fun m!730269 () Bool)

(assert (=> start!67874 m!730269))

(assert (=> b!789043 m!730221))

(assert (=> b!789043 m!730221))

(assert (=> b!789043 m!730223))

(assert (=> b!789063 m!730261))

(declare-fun m!730271 () Bool)

(assert (=> b!789063 m!730271))

(check-sat (not b!789052) (not b!789059) (not b!789056) (not b!789055) (not b!789062) (not start!67874) (not b!789043) (not b!789058) (not b!789060) (not b!789045) (not b!789051) (not b!789042) (not b!789057) (not b!789044) (not b!789050))
(check-sat)
