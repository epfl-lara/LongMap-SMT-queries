; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67132 () Bool)

(assert start!67132)

(declare-fun b!774065 () Bool)

(declare-fun e!430950 () Bool)

(assert (=> b!774065 (= e!430950 true)))

(declare-datatypes ((Unit!26659 0))(
  ( (Unit!26660) )
))
(declare-fun lt!344673 () Unit!26659)

(declare-fun e!430953 () Unit!26659)

(assert (=> b!774065 (= lt!344673 e!430953)))

(declare-fun c!85766 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!774065 (= c!85766 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!344671 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774065 (= lt!344671 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!774066 () Bool)

(declare-fun e!430951 () Bool)

(declare-fun e!430954 () Bool)

(assert (=> b!774066 (= e!430951 e!430954)))

(declare-fun res!523353 () Bool)

(assert (=> b!774066 (=> (not res!523353) (not e!430954))))

(declare-datatypes ((array!42436 0))(
  ( (array!42437 (arr!20311 (Array (_ BitVec 32) (_ BitVec 64))) (size!20731 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42436)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7867 0))(
  ( (MissingZero!7867 (index!33836 (_ BitVec 32))) (Found!7867 (index!33837 (_ BitVec 32))) (Intermediate!7867 (undefined!8679 Bool) (index!33838 (_ BitVec 32)) (x!64937 (_ BitVec 32))) (Undefined!7867) (MissingVacant!7867 (index!33839 (_ BitVec 32))) )
))
(declare-fun lt!344674 () SeekEntryResult!7867)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42436 (_ BitVec 32)) SeekEntryResult!7867)

(assert (=> b!774066 (= res!523353 (= (seekEntryOrOpen!0 (select (arr!20311 a!3186) j!159) a!3186 mask!3328) lt!344674))))

(assert (=> b!774066 (= lt!344674 (Found!7867 j!159))))

(declare-fun b!774067 () Bool)

(declare-fun res!523343 () Bool)

(declare-fun e!430956 () Bool)

(assert (=> b!774067 (=> (not res!523343) (not e!430956))))

(declare-datatypes ((List!14220 0))(
  ( (Nil!14217) (Cons!14216 (h!15327 (_ BitVec 64)) (t!20527 List!14220)) )
))
(declare-fun arrayNoDuplicates!0 (array!42436 (_ BitVec 32) List!14220) Bool)

(assert (=> b!774067 (= res!523343 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14217))))

(declare-fun e!430952 () Bool)

(declare-fun lt!344677 () SeekEntryResult!7867)

(declare-fun b!774068 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42436 (_ BitVec 32)) SeekEntryResult!7867)

(assert (=> b!774068 (= e!430952 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20311 a!3186) j!159) a!3186 mask!3328) lt!344677))))

(declare-fun b!774069 () Bool)

(declare-fun res!523340 () Bool)

(assert (=> b!774069 (=> (not res!523340) (not e!430956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42436 (_ BitVec 32)) Bool)

(assert (=> b!774069 (= res!523340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!774070 () Bool)

(declare-fun res!523346 () Bool)

(declare-fun e!430955 () Bool)

(assert (=> b!774070 (=> (not res!523346) (not e!430955))))

(assert (=> b!774070 (= res!523346 e!430952)))

(declare-fun c!85765 () Bool)

(assert (=> b!774070 (= c!85765 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!774071 () Bool)

(declare-fun Unit!26661 () Unit!26659)

(assert (=> b!774071 (= e!430953 Unit!26661)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!344670 () SeekEntryResult!7867)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42436 (_ BitVec 32)) SeekEntryResult!7867)

(assert (=> b!774071 (= lt!344670 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20311 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!774071 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344671 resIntermediateIndex!5 (select (arr!20311 a!3186) j!159) a!3186 mask!3328) (Found!7867 j!159))))

(declare-fun res!523350 () Bool)

(declare-fun e!430957 () Bool)

(assert (=> start!67132 (=> (not res!523350) (not e!430957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67132 (= res!523350 (validMask!0 mask!3328))))

(assert (=> start!67132 e!430957))

(assert (=> start!67132 true))

(declare-fun array_inv!16170 (array!42436) Bool)

(assert (=> start!67132 (array_inv!16170 a!3186)))

(declare-fun b!774072 () Bool)

(declare-fun res!523349 () Bool)

(assert (=> b!774072 (=> (not res!523349) (not e!430957))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!774072 (= res!523349 (and (= (size!20731 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20731 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20731 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!774073 () Bool)

(assert (=> b!774073 (= e!430956 e!430955)))

(declare-fun res!523344 () Bool)

(assert (=> b!774073 (=> (not res!523344) (not e!430955))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774073 (= res!523344 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20311 a!3186) j!159) mask!3328) (select (arr!20311 a!3186) j!159) a!3186 mask!3328) lt!344677))))

(assert (=> b!774073 (= lt!344677 (Intermediate!7867 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!774074 () Bool)

(declare-fun res!523351 () Bool)

(assert (=> b!774074 (=> (not res!523351) (not e!430956))))

(assert (=> b!774074 (= res!523351 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20731 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20731 a!3186))))))

(declare-fun b!774075 () Bool)

(declare-fun res!523341 () Bool)

(assert (=> b!774075 (=> (not res!523341) (not e!430957))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!774075 (= res!523341 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!774076 () Bool)

(declare-fun res!523348 () Bool)

(assert (=> b!774076 (=> (not res!523348) (not e!430957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!774076 (= res!523348 (validKeyInArray!0 k0!2102))))

(declare-fun b!774077 () Bool)

(declare-fun e!430949 () Bool)

(assert (=> b!774077 (= e!430949 (not e!430950))))

(declare-fun res!523338 () Bool)

(assert (=> b!774077 (=> res!523338 e!430950)))

(declare-fun lt!344676 () SeekEntryResult!7867)

(get-info :version)

(assert (=> b!774077 (= res!523338 (or (not ((_ is Intermediate!7867) lt!344676)) (bvsge x!1131 (x!64937 lt!344676))))))

(assert (=> b!774077 e!430951))

(declare-fun res!523342 () Bool)

(assert (=> b!774077 (=> (not res!523342) (not e!430951))))

(assert (=> b!774077 (= res!523342 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344680 () Unit!26659)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42436 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26659)

(assert (=> b!774077 (= lt!344680 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!774078 () Bool)

(assert (=> b!774078 (= e!430957 e!430956)))

(declare-fun res!523347 () Bool)

(assert (=> b!774078 (=> (not res!523347) (not e!430956))))

(declare-fun lt!344678 () SeekEntryResult!7867)

(assert (=> b!774078 (= res!523347 (or (= lt!344678 (MissingZero!7867 i!1173)) (= lt!344678 (MissingVacant!7867 i!1173))))))

(assert (=> b!774078 (= lt!344678 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!774079 () Bool)

(declare-fun res!523352 () Bool)

(assert (=> b!774079 (=> (not res!523352) (not e!430955))))

(assert (=> b!774079 (= res!523352 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20311 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774080 () Bool)

(declare-fun Unit!26662 () Unit!26659)

(assert (=> b!774080 (= e!430953 Unit!26662)))

(assert (=> b!774080 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344671 (select (arr!20311 a!3186) j!159) a!3186 mask!3328) lt!344677)))

(declare-fun b!774081 () Bool)

(assert (=> b!774081 (= e!430955 e!430949)))

(declare-fun res!523345 () Bool)

(assert (=> b!774081 (=> (not res!523345) (not e!430949))))

(declare-fun lt!344672 () SeekEntryResult!7867)

(assert (=> b!774081 (= res!523345 (= lt!344672 lt!344676))))

(declare-fun lt!344679 () array!42436)

(declare-fun lt!344675 () (_ BitVec 64))

(assert (=> b!774081 (= lt!344676 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344675 lt!344679 mask!3328))))

(assert (=> b!774081 (= lt!344672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344675 mask!3328) lt!344675 lt!344679 mask!3328))))

(assert (=> b!774081 (= lt!344675 (select (store (arr!20311 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!774081 (= lt!344679 (array!42437 (store (arr!20311 a!3186) i!1173 k0!2102) (size!20731 a!3186)))))

(declare-fun b!774082 () Bool)

(assert (=> b!774082 (= e!430952 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20311 a!3186) j!159) a!3186 mask!3328) (Found!7867 j!159)))))

(declare-fun b!774083 () Bool)

(assert (=> b!774083 (= e!430954 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20311 a!3186) j!159) a!3186 mask!3328) lt!344674))))

(declare-fun b!774084 () Bool)

(declare-fun res!523339 () Bool)

(assert (=> b!774084 (=> (not res!523339) (not e!430957))))

(assert (=> b!774084 (= res!523339 (validKeyInArray!0 (select (arr!20311 a!3186) j!159)))))

(assert (= (and start!67132 res!523350) b!774072))

(assert (= (and b!774072 res!523349) b!774084))

(assert (= (and b!774084 res!523339) b!774076))

(assert (= (and b!774076 res!523348) b!774075))

(assert (= (and b!774075 res!523341) b!774078))

(assert (= (and b!774078 res!523347) b!774069))

(assert (= (and b!774069 res!523340) b!774067))

(assert (= (and b!774067 res!523343) b!774074))

(assert (= (and b!774074 res!523351) b!774073))

(assert (= (and b!774073 res!523344) b!774079))

(assert (= (and b!774079 res!523352) b!774070))

(assert (= (and b!774070 c!85765) b!774068))

(assert (= (and b!774070 (not c!85765)) b!774082))

(assert (= (and b!774070 res!523346) b!774081))

(assert (= (and b!774081 res!523345) b!774077))

(assert (= (and b!774077 res!523342) b!774066))

(assert (= (and b!774066 res!523353) b!774083))

(assert (= (and b!774077 (not res!523338)) b!774065))

(assert (= (and b!774065 c!85766) b!774080))

(assert (= (and b!774065 (not c!85766)) b!774071))

(declare-fun m!719207 () Bool)

(assert (=> b!774080 m!719207))

(assert (=> b!774080 m!719207))

(declare-fun m!719209 () Bool)

(assert (=> b!774080 m!719209))

(declare-fun m!719211 () Bool)

(assert (=> b!774067 m!719211))

(declare-fun m!719213 () Bool)

(assert (=> b!774076 m!719213))

(declare-fun m!719215 () Bool)

(assert (=> b!774069 m!719215))

(assert (=> b!774071 m!719207))

(assert (=> b!774071 m!719207))

(declare-fun m!719217 () Bool)

(assert (=> b!774071 m!719217))

(assert (=> b!774071 m!719207))

(declare-fun m!719219 () Bool)

(assert (=> b!774071 m!719219))

(declare-fun m!719221 () Bool)

(assert (=> b!774065 m!719221))

(declare-fun m!719223 () Bool)

(assert (=> b!774079 m!719223))

(declare-fun m!719225 () Bool)

(assert (=> start!67132 m!719225))

(declare-fun m!719227 () Bool)

(assert (=> start!67132 m!719227))

(declare-fun m!719229 () Bool)

(assert (=> b!774081 m!719229))

(declare-fun m!719231 () Bool)

(assert (=> b!774081 m!719231))

(declare-fun m!719233 () Bool)

(assert (=> b!774081 m!719233))

(declare-fun m!719235 () Bool)

(assert (=> b!774081 m!719235))

(assert (=> b!774081 m!719231))

(declare-fun m!719237 () Bool)

(assert (=> b!774081 m!719237))

(assert (=> b!774066 m!719207))

(assert (=> b!774066 m!719207))

(declare-fun m!719239 () Bool)

(assert (=> b!774066 m!719239))

(assert (=> b!774073 m!719207))

(assert (=> b!774073 m!719207))

(declare-fun m!719241 () Bool)

(assert (=> b!774073 m!719241))

(assert (=> b!774073 m!719241))

(assert (=> b!774073 m!719207))

(declare-fun m!719243 () Bool)

(assert (=> b!774073 m!719243))

(assert (=> b!774082 m!719207))

(assert (=> b!774082 m!719207))

(assert (=> b!774082 m!719217))

(assert (=> b!774084 m!719207))

(assert (=> b!774084 m!719207))

(declare-fun m!719245 () Bool)

(assert (=> b!774084 m!719245))

(assert (=> b!774083 m!719207))

(assert (=> b!774083 m!719207))

(declare-fun m!719247 () Bool)

(assert (=> b!774083 m!719247))

(declare-fun m!719249 () Bool)

(assert (=> b!774078 m!719249))

(assert (=> b!774068 m!719207))

(assert (=> b!774068 m!719207))

(declare-fun m!719251 () Bool)

(assert (=> b!774068 m!719251))

(declare-fun m!719253 () Bool)

(assert (=> b!774075 m!719253))

(declare-fun m!719255 () Bool)

(assert (=> b!774077 m!719255))

(declare-fun m!719257 () Bool)

(assert (=> b!774077 m!719257))

(check-sat (not b!774084) (not b!774077) (not b!774075) (not b!774069) (not b!774076) (not b!774067) (not b!774065) (not b!774068) (not b!774080) (not b!774082) (not start!67132) (not b!774081) (not b!774083) (not b!774066) (not b!774073) (not b!774078) (not b!774071))
(check-sat)
