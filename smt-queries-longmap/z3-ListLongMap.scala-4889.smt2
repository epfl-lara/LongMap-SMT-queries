; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67498 () Bool)

(assert start!67498)

(declare-fun b!780298 () Bool)

(declare-fun res!527858 () Bool)

(declare-fun e!434132 () Bool)

(assert (=> b!780298 (=> (not res!527858) (not e!434132))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!780298 (= res!527858 (validKeyInArray!0 k0!2102))))

(declare-fun b!780299 () Bool)

(declare-fun res!527866 () Bool)

(declare-fun e!434130 () Bool)

(assert (=> b!780299 (=> (not res!527866) (not e!434130))))

(declare-datatypes ((array!42607 0))(
  ( (array!42608 (arr!20392 (Array (_ BitVec 32) (_ BitVec 64))) (size!20812 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42607)

(declare-datatypes ((List!14301 0))(
  ( (Nil!14298) (Cons!14297 (h!15417 (_ BitVec 64)) (t!20608 List!14301)) )
))
(declare-fun arrayNoDuplicates!0 (array!42607 (_ BitVec 32) List!14301) Bool)

(assert (=> b!780299 (= res!527866 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14298))))

(declare-fun b!780300 () Bool)

(declare-fun res!527859 () Bool)

(assert (=> b!780300 (=> (not res!527859) (not e!434132))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!780300 (= res!527859 (and (= (size!20812 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20812 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20812 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!780301 () Bool)

(declare-fun e!434134 () Bool)

(declare-fun e!434126 () Bool)

(assert (=> b!780301 (= e!434134 e!434126)))

(declare-fun res!527865 () Bool)

(assert (=> b!780301 (=> res!527865 e!434126)))

(declare-fun lt!347700 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7948 0))(
  ( (MissingZero!7948 (index!34160 (_ BitVec 32))) (Found!7948 (index!34161 (_ BitVec 32))) (Intermediate!7948 (undefined!8760 Bool) (index!34162 (_ BitVec 32)) (x!65264 (_ BitVec 32))) (Undefined!7948) (MissingVacant!7948 (index!34163 (_ BitVec 32))) )
))
(declare-fun lt!347697 () SeekEntryResult!7948)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!347698 () SeekEntryResult!7948)

(assert (=> b!780301 (= res!527865 (or (not (= lt!347697 lt!347698)) (= (select (store (arr!20392 a!3186) i!1173 k0!2102) index!1321) lt!347700) (not (= (select (store (arr!20392 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42607 (_ BitVec 32)) SeekEntryResult!7948)

(assert (=> b!780301 (= lt!347697 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20392 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!780302 () Bool)

(declare-fun res!527863 () Bool)

(declare-fun e!434127 () Bool)

(assert (=> b!780302 (=> (not res!527863) (not e!434127))))

(assert (=> b!780302 (= res!527863 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20392 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780303 () Bool)

(assert (=> b!780303 (= e!434130 e!434127)))

(declare-fun res!527871 () Bool)

(assert (=> b!780303 (=> (not res!527871) (not e!434127))))

(declare-fun lt!347699 () SeekEntryResult!7948)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42607 (_ BitVec 32)) SeekEntryResult!7948)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780303 (= res!527871 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20392 a!3186) j!159) mask!3328) (select (arr!20392 a!3186) j!159) a!3186 mask!3328) lt!347699))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!780303 (= lt!347699 (Intermediate!7948 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!780304 () Bool)

(assert (=> b!780304 (= e!434132 e!434130)))

(declare-fun res!527862 () Bool)

(assert (=> b!780304 (=> (not res!527862) (not e!434130))))

(declare-fun lt!347694 () SeekEntryResult!7948)

(assert (=> b!780304 (= res!527862 (or (= lt!347694 (MissingZero!7948 i!1173)) (= lt!347694 (MissingVacant!7948 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42607 (_ BitVec 32)) SeekEntryResult!7948)

(assert (=> b!780304 (= lt!347694 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!780305 () Bool)

(declare-fun e!434128 () Bool)

(assert (=> b!780305 (= e!434128 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20392 a!3186) j!159) a!3186 mask!3328) (Found!7948 j!159)))))

(declare-fun b!780306 () Bool)

(declare-fun e!434133 () Bool)

(assert (=> b!780306 (= e!434127 e!434133)))

(declare-fun res!527860 () Bool)

(assert (=> b!780306 (=> (not res!527860) (not e!434133))))

(declare-fun lt!347701 () SeekEntryResult!7948)

(declare-fun lt!347692 () SeekEntryResult!7948)

(assert (=> b!780306 (= res!527860 (= lt!347701 lt!347692))))

(declare-fun lt!347696 () array!42607)

(assert (=> b!780306 (= lt!347692 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347700 lt!347696 mask!3328))))

(assert (=> b!780306 (= lt!347701 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347700 mask!3328) lt!347700 lt!347696 mask!3328))))

(assert (=> b!780306 (= lt!347700 (select (store (arr!20392 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!780306 (= lt!347696 (array!42608 (store (arr!20392 a!3186) i!1173 k0!2102) (size!20812 a!3186)))))

(declare-fun b!780307 () Bool)

(declare-fun res!527870 () Bool)

(assert (=> b!780307 (=> (not res!527870) (not e!434132))))

(assert (=> b!780307 (= res!527870 (validKeyInArray!0 (select (arr!20392 a!3186) j!159)))))

(declare-fun b!780308 () Bool)

(assert (=> b!780308 (= e!434128 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20392 a!3186) j!159) a!3186 mask!3328) lt!347699))))

(declare-fun b!780309 () Bool)

(declare-fun res!527856 () Bool)

(assert (=> b!780309 (=> (not res!527856) (not e!434130))))

(assert (=> b!780309 (= res!527856 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20812 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20812 a!3186))))))

(declare-fun b!780310 () Bool)

(assert (=> b!780310 (= e!434126 (= lt!347697 (MissingVacant!7948 resIntermediateIndex!5)))))

(declare-fun lt!347695 () SeekEntryResult!7948)

(assert (=> b!780310 (= lt!347695 lt!347697)))

(declare-fun res!527868 () Bool)

(assert (=> start!67498 (=> (not res!527868) (not e!434132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67498 (= res!527868 (validMask!0 mask!3328))))

(assert (=> start!67498 e!434132))

(assert (=> start!67498 true))

(declare-fun array_inv!16251 (array!42607) Bool)

(assert (=> start!67498 (array_inv!16251 a!3186)))

(declare-fun b!780311 () Bool)

(declare-fun res!527869 () Bool)

(assert (=> b!780311 (=> (not res!527869) (not e!434130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42607 (_ BitVec 32)) Bool)

(assert (=> b!780311 (= res!527869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!780312 () Bool)

(declare-fun e!434131 () Bool)

(assert (=> b!780312 (= e!434131 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20392 a!3186) j!159) a!3186 mask!3328) lt!347698))))

(declare-fun b!780313 () Bool)

(declare-fun res!527867 () Bool)

(assert (=> b!780313 (=> (not res!527867) (not e!434132))))

(declare-fun arrayContainsKey!0 (array!42607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!780313 (= res!527867 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!780314 () Bool)

(assert (=> b!780314 (= e!434133 (not e!434134))))

(declare-fun res!527861 () Bool)

(assert (=> b!780314 (=> res!527861 e!434134)))

(get-info :version)

(assert (=> b!780314 (= res!527861 (or (not ((_ is Intermediate!7948) lt!347692)) (bvslt x!1131 (x!65264 lt!347692)) (not (= x!1131 (x!65264 lt!347692))) (not (= index!1321 (index!34162 lt!347692)))))))

(assert (=> b!780314 e!434131))

(declare-fun res!527864 () Bool)

(assert (=> b!780314 (=> (not res!527864) (not e!434131))))

(assert (=> b!780314 (= res!527864 (= lt!347695 lt!347698))))

(assert (=> b!780314 (= lt!347698 (Found!7948 j!159))))

(assert (=> b!780314 (= lt!347695 (seekEntryOrOpen!0 (select (arr!20392 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!780314 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26869 0))(
  ( (Unit!26870) )
))
(declare-fun lt!347693 () Unit!26869)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26869)

(assert (=> b!780314 (= lt!347693 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!780315 () Bool)

(declare-fun res!527857 () Bool)

(assert (=> b!780315 (=> (not res!527857) (not e!434127))))

(assert (=> b!780315 (= res!527857 e!434128)))

(declare-fun c!86627 () Bool)

(assert (=> b!780315 (= c!86627 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67498 res!527868) b!780300))

(assert (= (and b!780300 res!527859) b!780307))

(assert (= (and b!780307 res!527870) b!780298))

(assert (= (and b!780298 res!527858) b!780313))

(assert (= (and b!780313 res!527867) b!780304))

(assert (= (and b!780304 res!527862) b!780311))

(assert (= (and b!780311 res!527869) b!780299))

(assert (= (and b!780299 res!527866) b!780309))

(assert (= (and b!780309 res!527856) b!780303))

(assert (= (and b!780303 res!527871) b!780302))

(assert (= (and b!780302 res!527863) b!780315))

(assert (= (and b!780315 c!86627) b!780308))

(assert (= (and b!780315 (not c!86627)) b!780305))

(assert (= (and b!780315 res!527857) b!780306))

(assert (= (and b!780306 res!527860) b!780314))

(assert (= (and b!780314 res!527864) b!780312))

(assert (= (and b!780314 (not res!527861)) b!780301))

(assert (= (and b!780301 (not res!527865)) b!780310))

(declare-fun m!724205 () Bool)

(assert (=> b!780306 m!724205))

(declare-fun m!724207 () Bool)

(assert (=> b!780306 m!724207))

(declare-fun m!724209 () Bool)

(assert (=> b!780306 m!724209))

(declare-fun m!724211 () Bool)

(assert (=> b!780306 m!724211))

(assert (=> b!780306 m!724207))

(declare-fun m!724213 () Bool)

(assert (=> b!780306 m!724213))

(declare-fun m!724215 () Bool)

(assert (=> b!780312 m!724215))

(assert (=> b!780312 m!724215))

(declare-fun m!724217 () Bool)

(assert (=> b!780312 m!724217))

(declare-fun m!724219 () Bool)

(assert (=> b!780311 m!724219))

(assert (=> b!780314 m!724215))

(assert (=> b!780314 m!724215))

(declare-fun m!724221 () Bool)

(assert (=> b!780314 m!724221))

(declare-fun m!724223 () Bool)

(assert (=> b!780314 m!724223))

(declare-fun m!724225 () Bool)

(assert (=> b!780314 m!724225))

(assert (=> b!780301 m!724205))

(declare-fun m!724227 () Bool)

(assert (=> b!780301 m!724227))

(assert (=> b!780301 m!724215))

(assert (=> b!780301 m!724215))

(declare-fun m!724229 () Bool)

(assert (=> b!780301 m!724229))

(declare-fun m!724231 () Bool)

(assert (=> b!780299 m!724231))

(assert (=> b!780305 m!724215))

(assert (=> b!780305 m!724215))

(assert (=> b!780305 m!724229))

(declare-fun m!724233 () Bool)

(assert (=> b!780313 m!724233))

(declare-fun m!724235 () Bool)

(assert (=> b!780298 m!724235))

(declare-fun m!724237 () Bool)

(assert (=> start!67498 m!724237))

(declare-fun m!724239 () Bool)

(assert (=> start!67498 m!724239))

(assert (=> b!780303 m!724215))

(assert (=> b!780303 m!724215))

(declare-fun m!724241 () Bool)

(assert (=> b!780303 m!724241))

(assert (=> b!780303 m!724241))

(assert (=> b!780303 m!724215))

(declare-fun m!724243 () Bool)

(assert (=> b!780303 m!724243))

(assert (=> b!780307 m!724215))

(assert (=> b!780307 m!724215))

(declare-fun m!724245 () Bool)

(assert (=> b!780307 m!724245))

(declare-fun m!724247 () Bool)

(assert (=> b!780302 m!724247))

(assert (=> b!780308 m!724215))

(assert (=> b!780308 m!724215))

(declare-fun m!724249 () Bool)

(assert (=> b!780308 m!724249))

(declare-fun m!724251 () Bool)

(assert (=> b!780304 m!724251))

(check-sat (not b!780308) (not b!780306) (not b!780298) (not b!780311) (not b!780314) (not b!780307) (not b!780312) (not b!780305) (not b!780299) (not b!780313) (not b!780301) (not start!67498) (not b!780303) (not b!780304))
(check-sat)
(get-model)

(declare-fun b!780443 () Bool)

(declare-fun e!434199 () SeekEntryResult!7948)

(declare-fun e!434203 () SeekEntryResult!7948)

(assert (=> b!780443 (= e!434199 e!434203)))

(declare-fun c!86640 () Bool)

(declare-fun lt!347767 () (_ BitVec 64))

(assert (=> b!780443 (= c!86640 (or (= lt!347767 lt!347700) (= (bvadd lt!347767 lt!347767) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780444 () Bool)

(declare-fun lt!347766 () SeekEntryResult!7948)

(assert (=> b!780444 (and (bvsge (index!34162 lt!347766) #b00000000000000000000000000000000) (bvslt (index!34162 lt!347766) (size!20812 lt!347696)))))

(declare-fun e!434202 () Bool)

(assert (=> b!780444 (= e!434202 (= (select (arr!20392 lt!347696) (index!34162 lt!347766)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780445 () Bool)

(declare-fun e!434200 () Bool)

(declare-fun e!434201 () Bool)

(assert (=> b!780445 (= e!434200 e!434201)))

(declare-fun res!527976 () Bool)

(assert (=> b!780445 (= res!527976 (and ((_ is Intermediate!7948) lt!347766) (not (undefined!8760 lt!347766)) (bvslt (x!65264 lt!347766) #b01111111111111111111111111111110) (bvsge (x!65264 lt!347766) #b00000000000000000000000000000000) (bvsge (x!65264 lt!347766) x!1131)))))

(assert (=> b!780445 (=> (not res!527976) (not e!434201))))

(declare-fun b!780446 () Bool)

(assert (=> b!780446 (= e!434199 (Intermediate!7948 true index!1321 x!1131))))

(declare-fun b!780447 () Bool)

(assert (=> b!780447 (= e!434203 (Intermediate!7948 false index!1321 x!1131))))

(declare-fun b!780448 () Bool)

(assert (=> b!780448 (and (bvsge (index!34162 lt!347766) #b00000000000000000000000000000000) (bvslt (index!34162 lt!347766) (size!20812 lt!347696)))))

(declare-fun res!527975 () Bool)

(assert (=> b!780448 (= res!527975 (= (select (arr!20392 lt!347696) (index!34162 lt!347766)) lt!347700))))

(assert (=> b!780448 (=> res!527975 e!434202)))

(assert (=> b!780448 (= e!434201 e!434202)))

(declare-fun b!780449 () Bool)

(assert (=> b!780449 (= e!434200 (bvsge (x!65264 lt!347766) #b01111111111111111111111111111110))))

(declare-fun b!780450 () Bool)

(assert (=> b!780450 (and (bvsge (index!34162 lt!347766) #b00000000000000000000000000000000) (bvslt (index!34162 lt!347766) (size!20812 lt!347696)))))

(declare-fun res!527974 () Bool)

(assert (=> b!780450 (= res!527974 (= (select (arr!20392 lt!347696) (index!34162 lt!347766)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!780450 (=> res!527974 e!434202)))

(declare-fun d!102655 () Bool)

(assert (=> d!102655 e!434200))

(declare-fun c!86642 () Bool)

(assert (=> d!102655 (= c!86642 (and ((_ is Intermediate!7948) lt!347766) (undefined!8760 lt!347766)))))

(assert (=> d!102655 (= lt!347766 e!434199)))

(declare-fun c!86641 () Bool)

(assert (=> d!102655 (= c!86641 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102655 (= lt!347767 (select (arr!20392 lt!347696) index!1321))))

(assert (=> d!102655 (validMask!0 mask!3328)))

(assert (=> d!102655 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347700 lt!347696 mask!3328) lt!347766)))

(declare-fun b!780442 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780442 (= e!434203 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!347700 lt!347696 mask!3328))))

(assert (= (and d!102655 c!86641) b!780446))

(assert (= (and d!102655 (not c!86641)) b!780443))

(assert (= (and b!780443 c!86640) b!780447))

(assert (= (and b!780443 (not c!86640)) b!780442))

(assert (= (and d!102655 c!86642) b!780449))

(assert (= (and d!102655 (not c!86642)) b!780445))

(assert (= (and b!780445 res!527976) b!780448))

(assert (= (and b!780448 (not res!527975)) b!780450))

(assert (= (and b!780450 (not res!527974)) b!780444))

(declare-fun m!724349 () Bool)

(assert (=> b!780448 m!724349))

(declare-fun m!724351 () Bool)

(assert (=> d!102655 m!724351))

(assert (=> d!102655 m!724237))

(declare-fun m!724353 () Bool)

(assert (=> b!780442 m!724353))

(assert (=> b!780442 m!724353))

(declare-fun m!724355 () Bool)

(assert (=> b!780442 m!724355))

(assert (=> b!780444 m!724349))

(assert (=> b!780450 m!724349))

(assert (=> b!780306 d!102655))

(declare-fun b!780452 () Bool)

(declare-fun e!434204 () SeekEntryResult!7948)

(declare-fun e!434208 () SeekEntryResult!7948)

(assert (=> b!780452 (= e!434204 e!434208)))

(declare-fun c!86643 () Bool)

(declare-fun lt!347769 () (_ BitVec 64))

(assert (=> b!780452 (= c!86643 (or (= lt!347769 lt!347700) (= (bvadd lt!347769 lt!347769) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780453 () Bool)

(declare-fun lt!347768 () SeekEntryResult!7948)

(assert (=> b!780453 (and (bvsge (index!34162 lt!347768) #b00000000000000000000000000000000) (bvslt (index!34162 lt!347768) (size!20812 lt!347696)))))

(declare-fun e!434207 () Bool)

(assert (=> b!780453 (= e!434207 (= (select (arr!20392 lt!347696) (index!34162 lt!347768)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780454 () Bool)

(declare-fun e!434205 () Bool)

(declare-fun e!434206 () Bool)

(assert (=> b!780454 (= e!434205 e!434206)))

(declare-fun res!527979 () Bool)

(assert (=> b!780454 (= res!527979 (and ((_ is Intermediate!7948) lt!347768) (not (undefined!8760 lt!347768)) (bvslt (x!65264 lt!347768) #b01111111111111111111111111111110) (bvsge (x!65264 lt!347768) #b00000000000000000000000000000000) (bvsge (x!65264 lt!347768) #b00000000000000000000000000000000)))))

(assert (=> b!780454 (=> (not res!527979) (not e!434206))))

(declare-fun b!780455 () Bool)

(assert (=> b!780455 (= e!434204 (Intermediate!7948 true (toIndex!0 lt!347700 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!780456 () Bool)

(assert (=> b!780456 (= e!434208 (Intermediate!7948 false (toIndex!0 lt!347700 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!780457 () Bool)

(assert (=> b!780457 (and (bvsge (index!34162 lt!347768) #b00000000000000000000000000000000) (bvslt (index!34162 lt!347768) (size!20812 lt!347696)))))

(declare-fun res!527978 () Bool)

(assert (=> b!780457 (= res!527978 (= (select (arr!20392 lt!347696) (index!34162 lt!347768)) lt!347700))))

(assert (=> b!780457 (=> res!527978 e!434207)))

(assert (=> b!780457 (= e!434206 e!434207)))

(declare-fun b!780458 () Bool)

(assert (=> b!780458 (= e!434205 (bvsge (x!65264 lt!347768) #b01111111111111111111111111111110))))

(declare-fun b!780459 () Bool)

(assert (=> b!780459 (and (bvsge (index!34162 lt!347768) #b00000000000000000000000000000000) (bvslt (index!34162 lt!347768) (size!20812 lt!347696)))))

(declare-fun res!527977 () Bool)

(assert (=> b!780459 (= res!527977 (= (select (arr!20392 lt!347696) (index!34162 lt!347768)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!780459 (=> res!527977 e!434207)))

(declare-fun d!102657 () Bool)

(assert (=> d!102657 e!434205))

(declare-fun c!86645 () Bool)

(assert (=> d!102657 (= c!86645 (and ((_ is Intermediate!7948) lt!347768) (undefined!8760 lt!347768)))))

(assert (=> d!102657 (= lt!347768 e!434204)))

(declare-fun c!86644 () Bool)

(assert (=> d!102657 (= c!86644 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102657 (= lt!347769 (select (arr!20392 lt!347696) (toIndex!0 lt!347700 mask!3328)))))

(assert (=> d!102657 (validMask!0 mask!3328)))

(assert (=> d!102657 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347700 mask!3328) lt!347700 lt!347696 mask!3328) lt!347768)))

(declare-fun b!780451 () Bool)

(assert (=> b!780451 (= e!434208 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!347700 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!347700 lt!347696 mask!3328))))

(assert (= (and d!102657 c!86644) b!780455))

(assert (= (and d!102657 (not c!86644)) b!780452))

(assert (= (and b!780452 c!86643) b!780456))

(assert (= (and b!780452 (not c!86643)) b!780451))

(assert (= (and d!102657 c!86645) b!780458))

(assert (= (and d!102657 (not c!86645)) b!780454))

(assert (= (and b!780454 res!527979) b!780457))

(assert (= (and b!780457 (not res!527978)) b!780459))

(assert (= (and b!780459 (not res!527977)) b!780453))

(declare-fun m!724357 () Bool)

(assert (=> b!780457 m!724357))

(assert (=> d!102657 m!724207))

(declare-fun m!724359 () Bool)

(assert (=> d!102657 m!724359))

(assert (=> d!102657 m!724237))

(assert (=> b!780451 m!724207))

(declare-fun m!724361 () Bool)

(assert (=> b!780451 m!724361))

(assert (=> b!780451 m!724361))

(declare-fun m!724363 () Bool)

(assert (=> b!780451 m!724363))

(assert (=> b!780453 m!724357))

(assert (=> b!780459 m!724357))

(assert (=> b!780306 d!102657))

(declare-fun d!102659 () Bool)

(declare-fun lt!347775 () (_ BitVec 32))

(declare-fun lt!347774 () (_ BitVec 32))

(assert (=> d!102659 (= lt!347775 (bvmul (bvxor lt!347774 (bvlshr lt!347774 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102659 (= lt!347774 ((_ extract 31 0) (bvand (bvxor lt!347700 (bvlshr lt!347700 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102659 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!527980 (let ((h!15420 ((_ extract 31 0) (bvand (bvxor lt!347700 (bvlshr lt!347700 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65268 (bvmul (bvxor h!15420 (bvlshr h!15420 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65268 (bvlshr x!65268 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!527980 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!527980 #b00000000000000000000000000000000))))))

(assert (=> d!102659 (= (toIndex!0 lt!347700 mask!3328) (bvand (bvxor lt!347775 (bvlshr lt!347775 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!780306 d!102659))

(declare-fun b!780487 () Bool)

(declare-fun e!434227 () SeekEntryResult!7948)

(declare-fun e!434228 () SeekEntryResult!7948)

(assert (=> b!780487 (= e!434227 e!434228)))

(declare-fun lt!347780 () (_ BitVec 64))

(declare-fun c!86655 () Bool)

(assert (=> b!780487 (= c!86655 (= lt!347780 (select (arr!20392 a!3186) j!159)))))

(declare-fun b!780488 () Bool)

(assert (=> b!780488 (= e!434227 Undefined!7948)))

(declare-fun b!780489 () Bool)

(assert (=> b!780489 (= e!434228 (Found!7948 index!1321))))

(declare-fun b!780490 () Bool)

(declare-fun c!86656 () Bool)

(assert (=> b!780490 (= c!86656 (= lt!347780 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434229 () SeekEntryResult!7948)

(assert (=> b!780490 (= e!434228 e!434229)))

(declare-fun b!780491 () Bool)

(assert (=> b!780491 (= e!434229 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20392 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!102661 () Bool)

(declare-fun lt!347781 () SeekEntryResult!7948)

(assert (=> d!102661 (and (or ((_ is Undefined!7948) lt!347781) (not ((_ is Found!7948) lt!347781)) (and (bvsge (index!34161 lt!347781) #b00000000000000000000000000000000) (bvslt (index!34161 lt!347781) (size!20812 a!3186)))) (or ((_ is Undefined!7948) lt!347781) ((_ is Found!7948) lt!347781) (not ((_ is MissingVacant!7948) lt!347781)) (not (= (index!34163 lt!347781) resIntermediateIndex!5)) (and (bvsge (index!34163 lt!347781) #b00000000000000000000000000000000) (bvslt (index!34163 lt!347781) (size!20812 a!3186)))) (or ((_ is Undefined!7948) lt!347781) (ite ((_ is Found!7948) lt!347781) (= (select (arr!20392 a!3186) (index!34161 lt!347781)) (select (arr!20392 a!3186) j!159)) (and ((_ is MissingVacant!7948) lt!347781) (= (index!34163 lt!347781) resIntermediateIndex!5) (= (select (arr!20392 a!3186) (index!34163 lt!347781)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102661 (= lt!347781 e!434227)))

(declare-fun c!86657 () Bool)

(assert (=> d!102661 (= c!86657 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102661 (= lt!347780 (select (arr!20392 a!3186) index!1321))))

(assert (=> d!102661 (validMask!0 mask!3328)))

(assert (=> d!102661 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20392 a!3186) j!159) a!3186 mask!3328) lt!347781)))

(declare-fun b!780492 () Bool)

(assert (=> b!780492 (= e!434229 (MissingVacant!7948 resIntermediateIndex!5))))

(assert (= (and d!102661 c!86657) b!780488))

(assert (= (and d!102661 (not c!86657)) b!780487))

(assert (= (and b!780487 c!86655) b!780489))

(assert (= (and b!780487 (not c!86655)) b!780490))

(assert (= (and b!780490 c!86656) b!780492))

(assert (= (and b!780490 (not c!86656)) b!780491))

(assert (=> b!780491 m!724353))

(assert (=> b!780491 m!724353))

(assert (=> b!780491 m!724215))

(declare-fun m!724373 () Bool)

(assert (=> b!780491 m!724373))

(declare-fun m!724375 () Bool)

(assert (=> d!102661 m!724375))

(declare-fun m!724377 () Bool)

(assert (=> d!102661 m!724377))

(declare-fun m!724379 () Bool)

(assert (=> d!102661 m!724379))

(assert (=> d!102661 m!724237))

(assert (=> b!780305 d!102661))

(declare-fun b!780494 () Bool)

(declare-fun e!434230 () SeekEntryResult!7948)

(declare-fun e!434234 () SeekEntryResult!7948)

(assert (=> b!780494 (= e!434230 e!434234)))

(declare-fun lt!347783 () (_ BitVec 64))

(declare-fun c!86658 () Bool)

(assert (=> b!780494 (= c!86658 (or (= lt!347783 (select (arr!20392 a!3186) j!159)) (= (bvadd lt!347783 lt!347783) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780495 () Bool)

(declare-fun lt!347782 () SeekEntryResult!7948)

(assert (=> b!780495 (and (bvsge (index!34162 lt!347782) #b00000000000000000000000000000000) (bvslt (index!34162 lt!347782) (size!20812 a!3186)))))

(declare-fun e!434233 () Bool)

(assert (=> b!780495 (= e!434233 (= (select (arr!20392 a!3186) (index!34162 lt!347782)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780496 () Bool)

(declare-fun e!434231 () Bool)

(declare-fun e!434232 () Bool)

(assert (=> b!780496 (= e!434231 e!434232)))

(declare-fun res!527992 () Bool)

(assert (=> b!780496 (= res!527992 (and ((_ is Intermediate!7948) lt!347782) (not (undefined!8760 lt!347782)) (bvslt (x!65264 lt!347782) #b01111111111111111111111111111110) (bvsge (x!65264 lt!347782) #b00000000000000000000000000000000) (bvsge (x!65264 lt!347782) #b00000000000000000000000000000000)))))

(assert (=> b!780496 (=> (not res!527992) (not e!434232))))

(declare-fun b!780497 () Bool)

(assert (=> b!780497 (= e!434230 (Intermediate!7948 true (toIndex!0 (select (arr!20392 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!780498 () Bool)

(assert (=> b!780498 (= e!434234 (Intermediate!7948 false (toIndex!0 (select (arr!20392 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!780499 () Bool)

(assert (=> b!780499 (and (bvsge (index!34162 lt!347782) #b00000000000000000000000000000000) (bvslt (index!34162 lt!347782) (size!20812 a!3186)))))

(declare-fun res!527991 () Bool)

(assert (=> b!780499 (= res!527991 (= (select (arr!20392 a!3186) (index!34162 lt!347782)) (select (arr!20392 a!3186) j!159)))))

(assert (=> b!780499 (=> res!527991 e!434233)))

(assert (=> b!780499 (= e!434232 e!434233)))

(declare-fun b!780500 () Bool)

(assert (=> b!780500 (= e!434231 (bvsge (x!65264 lt!347782) #b01111111111111111111111111111110))))

(declare-fun b!780501 () Bool)

(assert (=> b!780501 (and (bvsge (index!34162 lt!347782) #b00000000000000000000000000000000) (bvslt (index!34162 lt!347782) (size!20812 a!3186)))))

(declare-fun res!527990 () Bool)

(assert (=> b!780501 (= res!527990 (= (select (arr!20392 a!3186) (index!34162 lt!347782)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!780501 (=> res!527990 e!434233)))

(declare-fun d!102671 () Bool)

(assert (=> d!102671 e!434231))

(declare-fun c!86660 () Bool)

(assert (=> d!102671 (= c!86660 (and ((_ is Intermediate!7948) lt!347782) (undefined!8760 lt!347782)))))

(assert (=> d!102671 (= lt!347782 e!434230)))

(declare-fun c!86659 () Bool)

(assert (=> d!102671 (= c!86659 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102671 (= lt!347783 (select (arr!20392 a!3186) (toIndex!0 (select (arr!20392 a!3186) j!159) mask!3328)))))

(assert (=> d!102671 (validMask!0 mask!3328)))

(assert (=> d!102671 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20392 a!3186) j!159) mask!3328) (select (arr!20392 a!3186) j!159) a!3186 mask!3328) lt!347782)))

(declare-fun b!780493 () Bool)

(assert (=> b!780493 (= e!434234 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20392 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20392 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!102671 c!86659) b!780497))

(assert (= (and d!102671 (not c!86659)) b!780494))

(assert (= (and b!780494 c!86658) b!780498))

(assert (= (and b!780494 (not c!86658)) b!780493))

(assert (= (and d!102671 c!86660) b!780500))

(assert (= (and d!102671 (not c!86660)) b!780496))

(assert (= (and b!780496 res!527992) b!780499))

(assert (= (and b!780499 (not res!527991)) b!780501))

(assert (= (and b!780501 (not res!527990)) b!780495))

(declare-fun m!724381 () Bool)

(assert (=> b!780499 m!724381))

(assert (=> d!102671 m!724241))

(declare-fun m!724383 () Bool)

(assert (=> d!102671 m!724383))

(assert (=> d!102671 m!724237))

(assert (=> b!780493 m!724241))

(declare-fun m!724385 () Bool)

(assert (=> b!780493 m!724385))

(assert (=> b!780493 m!724385))

(assert (=> b!780493 m!724215))

(declare-fun m!724387 () Bool)

(assert (=> b!780493 m!724387))

(assert (=> b!780495 m!724381))

(assert (=> b!780501 m!724381))

(assert (=> b!780303 d!102671))

(declare-fun d!102673 () Bool)

(declare-fun lt!347789 () (_ BitVec 32))

(declare-fun lt!347788 () (_ BitVec 32))

(assert (=> d!102673 (= lt!347789 (bvmul (bvxor lt!347788 (bvlshr lt!347788 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102673 (= lt!347788 ((_ extract 31 0) (bvand (bvxor (select (arr!20392 a!3186) j!159) (bvlshr (select (arr!20392 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102673 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!527980 (let ((h!15420 ((_ extract 31 0) (bvand (bvxor (select (arr!20392 a!3186) j!159) (bvlshr (select (arr!20392 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65268 (bvmul (bvxor h!15420 (bvlshr h!15420 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65268 (bvlshr x!65268 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!527980 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!527980 #b00000000000000000000000000000000))))))

(assert (=> d!102673 (= (toIndex!0 (select (arr!20392 a!3186) j!159) mask!3328) (bvand (bvxor lt!347789 (bvlshr lt!347789 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!780303 d!102673))

(declare-fun b!780560 () Bool)

(declare-fun e!434267 () SeekEntryResult!7948)

(declare-fun lt!347812 () SeekEntryResult!7948)

(assert (=> b!780560 (= e!434267 (MissingZero!7948 (index!34162 lt!347812)))))

(declare-fun b!780561 () Bool)

(declare-fun c!86689 () Bool)

(declare-fun lt!347813 () (_ BitVec 64))

(assert (=> b!780561 (= c!86689 (= lt!347813 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434268 () SeekEntryResult!7948)

(assert (=> b!780561 (= e!434268 e!434267)))

(declare-fun b!780562 () Bool)

(assert (=> b!780562 (= e!434268 (Found!7948 (index!34162 lt!347812)))))

(declare-fun b!780563 () Bool)

(declare-fun e!434269 () SeekEntryResult!7948)

(assert (=> b!780563 (= e!434269 Undefined!7948)))

(declare-fun b!780565 () Bool)

(assert (=> b!780565 (= e!434267 (seekKeyOrZeroReturnVacant!0 (x!65264 lt!347812) (index!34162 lt!347812) (index!34162 lt!347812) (select (arr!20392 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!780567 () Bool)

(assert (=> b!780567 (= e!434269 e!434268)))

(assert (=> b!780567 (= lt!347813 (select (arr!20392 a!3186) (index!34162 lt!347812)))))

(declare-fun c!86688 () Bool)

(assert (=> b!780567 (= c!86688 (= lt!347813 (select (arr!20392 a!3186) j!159)))))

(declare-fun d!102675 () Bool)

(declare-fun lt!347811 () SeekEntryResult!7948)

(assert (=> d!102675 (and (or ((_ is Undefined!7948) lt!347811) (not ((_ is Found!7948) lt!347811)) (and (bvsge (index!34161 lt!347811) #b00000000000000000000000000000000) (bvslt (index!34161 lt!347811) (size!20812 a!3186)))) (or ((_ is Undefined!7948) lt!347811) ((_ is Found!7948) lt!347811) (not ((_ is MissingZero!7948) lt!347811)) (and (bvsge (index!34160 lt!347811) #b00000000000000000000000000000000) (bvslt (index!34160 lt!347811) (size!20812 a!3186)))) (or ((_ is Undefined!7948) lt!347811) ((_ is Found!7948) lt!347811) ((_ is MissingZero!7948) lt!347811) (not ((_ is MissingVacant!7948) lt!347811)) (and (bvsge (index!34163 lt!347811) #b00000000000000000000000000000000) (bvslt (index!34163 lt!347811) (size!20812 a!3186)))) (or ((_ is Undefined!7948) lt!347811) (ite ((_ is Found!7948) lt!347811) (= (select (arr!20392 a!3186) (index!34161 lt!347811)) (select (arr!20392 a!3186) j!159)) (ite ((_ is MissingZero!7948) lt!347811) (= (select (arr!20392 a!3186) (index!34160 lt!347811)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7948) lt!347811) (= (select (arr!20392 a!3186) (index!34163 lt!347811)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102675 (= lt!347811 e!434269)))

(declare-fun c!86687 () Bool)

(assert (=> d!102675 (= c!86687 (and ((_ is Intermediate!7948) lt!347812) (undefined!8760 lt!347812)))))

(assert (=> d!102675 (= lt!347812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20392 a!3186) j!159) mask!3328) (select (arr!20392 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102675 (validMask!0 mask!3328)))

(assert (=> d!102675 (= (seekEntryOrOpen!0 (select (arr!20392 a!3186) j!159) a!3186 mask!3328) lt!347811)))

(assert (= (and d!102675 c!86687) b!780563))

(assert (= (and d!102675 (not c!86687)) b!780567))

(assert (= (and b!780567 c!86688) b!780562))

(assert (= (and b!780567 (not c!86688)) b!780561))

(assert (= (and b!780561 c!86689) b!780560))

(assert (= (and b!780561 (not c!86689)) b!780565))

(assert (=> b!780565 m!724215))

(declare-fun m!724417 () Bool)

(assert (=> b!780565 m!724417))

(declare-fun m!724419 () Bool)

(assert (=> b!780567 m!724419))

(declare-fun m!724421 () Bool)

(assert (=> d!102675 m!724421))

(declare-fun m!724423 () Bool)

(assert (=> d!102675 m!724423))

(assert (=> d!102675 m!724237))

(assert (=> d!102675 m!724215))

(assert (=> d!102675 m!724241))

(assert (=> d!102675 m!724241))

(assert (=> d!102675 m!724215))

(assert (=> d!102675 m!724243))

(declare-fun m!724425 () Bool)

(assert (=> d!102675 m!724425))

(assert (=> b!780314 d!102675))

(declare-fun d!102683 () Bool)

(declare-fun res!528017 () Bool)

(declare-fun e!434305 () Bool)

(assert (=> d!102683 (=> res!528017 e!434305)))

(assert (=> d!102683 (= res!528017 (bvsge j!159 (size!20812 a!3186)))))

(assert (=> d!102683 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!434305)))

(declare-fun b!780624 () Bool)

(declare-fun e!434304 () Bool)

(declare-fun call!35247 () Bool)

(assert (=> b!780624 (= e!434304 call!35247)))

(declare-fun b!780625 () Bool)

(declare-fun e!434303 () Bool)

(assert (=> b!780625 (= e!434303 call!35247)))

(declare-fun b!780626 () Bool)

(assert (=> b!780626 (= e!434303 e!434304)))

(declare-fun lt!347841 () (_ BitVec 64))

(assert (=> b!780626 (= lt!347841 (select (arr!20392 a!3186) j!159))))

(declare-fun lt!347839 () Unit!26869)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42607 (_ BitVec 64) (_ BitVec 32)) Unit!26869)

(assert (=> b!780626 (= lt!347839 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!347841 j!159))))

(assert (=> b!780626 (arrayContainsKey!0 a!3186 lt!347841 #b00000000000000000000000000000000)))

(declare-fun lt!347840 () Unit!26869)

(assert (=> b!780626 (= lt!347840 lt!347839)))

(declare-fun res!528016 () Bool)

(assert (=> b!780626 (= res!528016 (= (seekEntryOrOpen!0 (select (arr!20392 a!3186) j!159) a!3186 mask!3328) (Found!7948 j!159)))))

(assert (=> b!780626 (=> (not res!528016) (not e!434304))))

(declare-fun bm!35244 () Bool)

(assert (=> bm!35244 (= call!35247 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!780627 () Bool)

(assert (=> b!780627 (= e!434305 e!434303)))

(declare-fun c!86711 () Bool)

(assert (=> b!780627 (= c!86711 (validKeyInArray!0 (select (arr!20392 a!3186) j!159)))))

(assert (= (and d!102683 (not res!528017)) b!780627))

(assert (= (and b!780627 c!86711) b!780626))

(assert (= (and b!780627 (not c!86711)) b!780625))

(assert (= (and b!780626 res!528016) b!780624))

(assert (= (or b!780624 b!780625) bm!35244))

(assert (=> b!780626 m!724215))

(declare-fun m!724453 () Bool)

(assert (=> b!780626 m!724453))

(declare-fun m!724455 () Bool)

(assert (=> b!780626 m!724455))

(assert (=> b!780626 m!724215))

(assert (=> b!780626 m!724221))

(declare-fun m!724457 () Bool)

(assert (=> bm!35244 m!724457))

(assert (=> b!780627 m!724215))

(assert (=> b!780627 m!724215))

(assert (=> b!780627 m!724245))

(assert (=> b!780314 d!102683))

(declare-fun d!102693 () Bool)

(assert (=> d!102693 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!347852 () Unit!26869)

(declare-fun choose!38 (array!42607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26869)

(assert (=> d!102693 (= lt!347852 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102693 (validMask!0 mask!3328)))

(assert (=> d!102693 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!347852)))

(declare-fun bs!21731 () Bool)

(assert (= bs!21731 d!102693))

(assert (=> bs!21731 m!724223))

(declare-fun m!724465 () Bool)

(assert (=> bs!21731 m!724465))

(assert (=> bs!21731 m!724237))

(assert (=> b!780314 d!102693))

(declare-fun b!780645 () Bool)

(declare-fun e!434317 () SeekEntryResult!7948)

(declare-fun lt!347854 () SeekEntryResult!7948)

(assert (=> b!780645 (= e!434317 (MissingZero!7948 (index!34162 lt!347854)))))

(declare-fun b!780646 () Bool)

(declare-fun c!86719 () Bool)

(declare-fun lt!347855 () (_ BitVec 64))

(assert (=> b!780646 (= c!86719 (= lt!347855 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434318 () SeekEntryResult!7948)

(assert (=> b!780646 (= e!434318 e!434317)))

(declare-fun b!780647 () Bool)

(assert (=> b!780647 (= e!434318 (Found!7948 (index!34162 lt!347854)))))

(declare-fun b!780648 () Bool)

(declare-fun e!434319 () SeekEntryResult!7948)

(assert (=> b!780648 (= e!434319 Undefined!7948)))

(declare-fun b!780649 () Bool)

(assert (=> b!780649 (= e!434317 (seekKeyOrZeroReturnVacant!0 (x!65264 lt!347854) (index!34162 lt!347854) (index!34162 lt!347854) k0!2102 a!3186 mask!3328))))

(declare-fun b!780650 () Bool)

(assert (=> b!780650 (= e!434319 e!434318)))

(assert (=> b!780650 (= lt!347855 (select (arr!20392 a!3186) (index!34162 lt!347854)))))

(declare-fun c!86718 () Bool)

(assert (=> b!780650 (= c!86718 (= lt!347855 k0!2102))))

(declare-fun d!102703 () Bool)

(declare-fun lt!347853 () SeekEntryResult!7948)

(assert (=> d!102703 (and (or ((_ is Undefined!7948) lt!347853) (not ((_ is Found!7948) lt!347853)) (and (bvsge (index!34161 lt!347853) #b00000000000000000000000000000000) (bvslt (index!34161 lt!347853) (size!20812 a!3186)))) (or ((_ is Undefined!7948) lt!347853) ((_ is Found!7948) lt!347853) (not ((_ is MissingZero!7948) lt!347853)) (and (bvsge (index!34160 lt!347853) #b00000000000000000000000000000000) (bvslt (index!34160 lt!347853) (size!20812 a!3186)))) (or ((_ is Undefined!7948) lt!347853) ((_ is Found!7948) lt!347853) ((_ is MissingZero!7948) lt!347853) (not ((_ is MissingVacant!7948) lt!347853)) (and (bvsge (index!34163 lt!347853) #b00000000000000000000000000000000) (bvslt (index!34163 lt!347853) (size!20812 a!3186)))) (or ((_ is Undefined!7948) lt!347853) (ite ((_ is Found!7948) lt!347853) (= (select (arr!20392 a!3186) (index!34161 lt!347853)) k0!2102) (ite ((_ is MissingZero!7948) lt!347853) (= (select (arr!20392 a!3186) (index!34160 lt!347853)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7948) lt!347853) (= (select (arr!20392 a!3186) (index!34163 lt!347853)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102703 (= lt!347853 e!434319)))

(declare-fun c!86717 () Bool)

(assert (=> d!102703 (= c!86717 (and ((_ is Intermediate!7948) lt!347854) (undefined!8760 lt!347854)))))

(assert (=> d!102703 (= lt!347854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!102703 (validMask!0 mask!3328)))

(assert (=> d!102703 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!347853)))

(assert (= (and d!102703 c!86717) b!780648))

(assert (= (and d!102703 (not c!86717)) b!780650))

(assert (= (and b!780650 c!86718) b!780647))

(assert (= (and b!780650 (not c!86718)) b!780646))

(assert (= (and b!780646 c!86719) b!780645))

(assert (= (and b!780646 (not c!86719)) b!780649))

(declare-fun m!724467 () Bool)

(assert (=> b!780649 m!724467))

(declare-fun m!724469 () Bool)

(assert (=> b!780650 m!724469))

(declare-fun m!724471 () Bool)

(assert (=> d!102703 m!724471))

(declare-fun m!724473 () Bool)

(assert (=> d!102703 m!724473))

(assert (=> d!102703 m!724237))

(declare-fun m!724475 () Bool)

(assert (=> d!102703 m!724475))

(assert (=> d!102703 m!724475))

(declare-fun m!724477 () Bool)

(assert (=> d!102703 m!724477))

(declare-fun m!724479 () Bool)

(assert (=> d!102703 m!724479))

(assert (=> b!780304 d!102703))

(declare-fun d!102705 () Bool)

(declare-fun res!528031 () Bool)

(declare-fun e!434327 () Bool)

(assert (=> d!102705 (=> res!528031 e!434327)))

(assert (=> d!102705 (= res!528031 (= (select (arr!20392 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!102705 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!434327)))

(declare-fun b!780659 () Bool)

(declare-fun e!434328 () Bool)

(assert (=> b!780659 (= e!434327 e!434328)))

(declare-fun res!528032 () Bool)

(assert (=> b!780659 (=> (not res!528032) (not e!434328))))

(assert (=> b!780659 (= res!528032 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20812 a!3186)))))

(declare-fun b!780660 () Bool)

(assert (=> b!780660 (= e!434328 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102705 (not res!528031)) b!780659))

(assert (= (and b!780659 res!528032) b!780660))

(declare-fun m!724487 () Bool)

(assert (=> d!102705 m!724487))

(declare-fun m!724489 () Bool)

(assert (=> b!780660 m!724489))

(assert (=> b!780313 d!102705))

(declare-fun d!102709 () Bool)

(assert (=> d!102709 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67498 d!102709))

(declare-fun d!102723 () Bool)

(assert (=> d!102723 (= (array_inv!16251 a!3186) (bvsge (size!20812 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67498 d!102723))

(declare-fun d!102725 () Bool)

(declare-fun res!528043 () Bool)

(declare-fun e!434354 () Bool)

(assert (=> d!102725 (=> res!528043 e!434354)))

(assert (=> d!102725 (= res!528043 (bvsge #b00000000000000000000000000000000 (size!20812 a!3186)))))

(assert (=> d!102725 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!434354)))

(declare-fun b!780700 () Bool)

(declare-fun e!434353 () Bool)

(declare-fun call!35251 () Bool)

(assert (=> b!780700 (= e!434353 call!35251)))

(declare-fun b!780701 () Bool)

(declare-fun e!434352 () Bool)

(assert (=> b!780701 (= e!434352 call!35251)))

(declare-fun b!780702 () Bool)

(assert (=> b!780702 (= e!434352 e!434353)))

(declare-fun lt!347876 () (_ BitVec 64))

(assert (=> b!780702 (= lt!347876 (select (arr!20392 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!347874 () Unit!26869)

(assert (=> b!780702 (= lt!347874 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!347876 #b00000000000000000000000000000000))))

(assert (=> b!780702 (arrayContainsKey!0 a!3186 lt!347876 #b00000000000000000000000000000000)))

(declare-fun lt!347875 () Unit!26869)

(assert (=> b!780702 (= lt!347875 lt!347874)))

(declare-fun res!528042 () Bool)

(assert (=> b!780702 (= res!528042 (= (seekEntryOrOpen!0 (select (arr!20392 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7948 #b00000000000000000000000000000000)))))

(assert (=> b!780702 (=> (not res!528042) (not e!434353))))

(declare-fun bm!35248 () Bool)

(assert (=> bm!35248 (= call!35251 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!780703 () Bool)

(assert (=> b!780703 (= e!434354 e!434352)))

(declare-fun c!86736 () Bool)

(assert (=> b!780703 (= c!86736 (validKeyInArray!0 (select (arr!20392 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!102725 (not res!528043)) b!780703))

(assert (= (and b!780703 c!86736) b!780702))

(assert (= (and b!780703 (not c!86736)) b!780701))

(assert (= (and b!780702 res!528042) b!780700))

(assert (= (or b!780700 b!780701) bm!35248))

(assert (=> b!780702 m!724487))

(declare-fun m!724517 () Bool)

(assert (=> b!780702 m!724517))

(declare-fun m!724519 () Bool)

(assert (=> b!780702 m!724519))

(assert (=> b!780702 m!724487))

(declare-fun m!724521 () Bool)

(assert (=> b!780702 m!724521))

(declare-fun m!724523 () Bool)

(assert (=> bm!35248 m!724523))

(assert (=> b!780703 m!724487))

(assert (=> b!780703 m!724487))

(declare-fun m!724525 () Bool)

(assert (=> b!780703 m!724525))

(assert (=> b!780311 d!102725))

(assert (=> b!780301 d!102661))

(declare-fun b!780704 () Bool)

(declare-fun e!434355 () SeekEntryResult!7948)

(declare-fun e!434356 () SeekEntryResult!7948)

(assert (=> b!780704 (= e!434355 e!434356)))

(declare-fun c!86737 () Bool)

(declare-fun lt!347877 () (_ BitVec 64))

(assert (=> b!780704 (= c!86737 (= lt!347877 (select (arr!20392 a!3186) j!159)))))

(declare-fun b!780705 () Bool)

(assert (=> b!780705 (= e!434355 Undefined!7948)))

(declare-fun b!780706 () Bool)

(assert (=> b!780706 (= e!434356 (Found!7948 resIntermediateIndex!5))))

(declare-fun b!780707 () Bool)

(declare-fun c!86738 () Bool)

(assert (=> b!780707 (= c!86738 (= lt!347877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434357 () SeekEntryResult!7948)

(assert (=> b!780707 (= e!434356 e!434357)))

(declare-fun b!780708 () Bool)

(assert (=> b!780708 (= e!434357 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20392 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!102727 () Bool)

(declare-fun lt!347878 () SeekEntryResult!7948)

(assert (=> d!102727 (and (or ((_ is Undefined!7948) lt!347878) (not ((_ is Found!7948) lt!347878)) (and (bvsge (index!34161 lt!347878) #b00000000000000000000000000000000) (bvslt (index!34161 lt!347878) (size!20812 a!3186)))) (or ((_ is Undefined!7948) lt!347878) ((_ is Found!7948) lt!347878) (not ((_ is MissingVacant!7948) lt!347878)) (not (= (index!34163 lt!347878) resIntermediateIndex!5)) (and (bvsge (index!34163 lt!347878) #b00000000000000000000000000000000) (bvslt (index!34163 lt!347878) (size!20812 a!3186)))) (or ((_ is Undefined!7948) lt!347878) (ite ((_ is Found!7948) lt!347878) (= (select (arr!20392 a!3186) (index!34161 lt!347878)) (select (arr!20392 a!3186) j!159)) (and ((_ is MissingVacant!7948) lt!347878) (= (index!34163 lt!347878) resIntermediateIndex!5) (= (select (arr!20392 a!3186) (index!34163 lt!347878)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102727 (= lt!347878 e!434355)))

(declare-fun c!86739 () Bool)

(assert (=> d!102727 (= c!86739 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102727 (= lt!347877 (select (arr!20392 a!3186) resIntermediateIndex!5))))

(assert (=> d!102727 (validMask!0 mask!3328)))

(assert (=> d!102727 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20392 a!3186) j!159) a!3186 mask!3328) lt!347878)))

(declare-fun b!780709 () Bool)

(assert (=> b!780709 (= e!434357 (MissingVacant!7948 resIntermediateIndex!5))))

(assert (= (and d!102727 c!86739) b!780705))

(assert (= (and d!102727 (not c!86739)) b!780704))

(assert (= (and b!780704 c!86737) b!780706))

(assert (= (and b!780704 (not c!86737)) b!780707))

(assert (= (and b!780707 c!86738) b!780709))

(assert (= (and b!780707 (not c!86738)) b!780708))

(declare-fun m!724527 () Bool)

(assert (=> b!780708 m!724527))

(assert (=> b!780708 m!724527))

(assert (=> b!780708 m!724215))

(declare-fun m!724529 () Bool)

(assert (=> b!780708 m!724529))

(declare-fun m!724531 () Bool)

(assert (=> d!102727 m!724531))

(declare-fun m!724533 () Bool)

(assert (=> d!102727 m!724533))

(assert (=> d!102727 m!724247))

(assert (=> d!102727 m!724237))

(assert (=> b!780312 d!102727))

(declare-fun b!780760 () Bool)

(declare-fun e!434392 () Bool)

(declare-fun call!35258 () Bool)

(assert (=> b!780760 (= e!434392 call!35258)))

(declare-fun b!780761 () Bool)

(assert (=> b!780761 (= e!434392 call!35258)))

(declare-fun b!780762 () Bool)

(declare-fun e!434391 () Bool)

(declare-fun e!434394 () Bool)

(assert (=> b!780762 (= e!434391 e!434394)))

(declare-fun res!528066 () Bool)

(assert (=> b!780762 (=> (not res!528066) (not e!434394))))

(declare-fun e!434393 () Bool)

(assert (=> b!780762 (= res!528066 (not e!434393))))

(declare-fun res!528064 () Bool)

(assert (=> b!780762 (=> (not res!528064) (not e!434393))))

(assert (=> b!780762 (= res!528064 (validKeyInArray!0 (select (arr!20392 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!780763 () Bool)

(assert (=> b!780763 (= e!434394 e!434392)))

(declare-fun c!86755 () Bool)

(assert (=> b!780763 (= c!86755 (validKeyInArray!0 (select (arr!20392 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102729 () Bool)

(declare-fun res!528065 () Bool)

(assert (=> d!102729 (=> res!528065 e!434391)))

(assert (=> d!102729 (= res!528065 (bvsge #b00000000000000000000000000000000 (size!20812 a!3186)))))

(assert (=> d!102729 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14298) e!434391)))

(declare-fun b!780764 () Bool)

(declare-fun contains!4080 (List!14301 (_ BitVec 64)) Bool)

(assert (=> b!780764 (= e!434393 (contains!4080 Nil!14298 (select (arr!20392 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35255 () Bool)

(assert (=> bm!35255 (= call!35258 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86755 (Cons!14297 (select (arr!20392 a!3186) #b00000000000000000000000000000000) Nil!14298) Nil!14298)))))

(assert (= (and d!102729 (not res!528065)) b!780762))

(assert (= (and b!780762 res!528064) b!780764))

(assert (= (and b!780762 res!528066) b!780763))

(assert (= (and b!780763 c!86755) b!780761))

(assert (= (and b!780763 (not c!86755)) b!780760))

(assert (= (or b!780761 b!780760) bm!35255))

(assert (=> b!780762 m!724487))

(assert (=> b!780762 m!724487))

(assert (=> b!780762 m!724525))

(assert (=> b!780763 m!724487))

(assert (=> b!780763 m!724487))

(assert (=> b!780763 m!724525))

(assert (=> b!780764 m!724487))

(assert (=> b!780764 m!724487))

(declare-fun m!724561 () Bool)

(assert (=> b!780764 m!724561))

(assert (=> bm!35255 m!724487))

(declare-fun m!724563 () Bool)

(assert (=> bm!35255 m!724563))

(assert (=> b!780299 d!102729))

(declare-fun d!102737 () Bool)

(assert (=> d!102737 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!780298 d!102737))

(declare-fun d!102739 () Bool)

(assert (=> d!102739 (= (validKeyInArray!0 (select (arr!20392 a!3186) j!159)) (and (not (= (select (arr!20392 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20392 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!780307 d!102739))

(declare-fun b!780766 () Bool)

(declare-fun e!434395 () SeekEntryResult!7948)

(declare-fun e!434399 () SeekEntryResult!7948)

(assert (=> b!780766 (= e!434395 e!434399)))

(declare-fun c!86756 () Bool)

(declare-fun lt!347902 () (_ BitVec 64))

(assert (=> b!780766 (= c!86756 (or (= lt!347902 (select (arr!20392 a!3186) j!159)) (= (bvadd lt!347902 lt!347902) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780767 () Bool)

(declare-fun lt!347901 () SeekEntryResult!7948)

(assert (=> b!780767 (and (bvsge (index!34162 lt!347901) #b00000000000000000000000000000000) (bvslt (index!34162 lt!347901) (size!20812 a!3186)))))

(declare-fun e!434398 () Bool)

(assert (=> b!780767 (= e!434398 (= (select (arr!20392 a!3186) (index!34162 lt!347901)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780768 () Bool)

(declare-fun e!434396 () Bool)

(declare-fun e!434397 () Bool)

(assert (=> b!780768 (= e!434396 e!434397)))

(declare-fun res!528069 () Bool)

(assert (=> b!780768 (= res!528069 (and ((_ is Intermediate!7948) lt!347901) (not (undefined!8760 lt!347901)) (bvslt (x!65264 lt!347901) #b01111111111111111111111111111110) (bvsge (x!65264 lt!347901) #b00000000000000000000000000000000) (bvsge (x!65264 lt!347901) x!1131)))))

(assert (=> b!780768 (=> (not res!528069) (not e!434397))))

(declare-fun b!780769 () Bool)

(assert (=> b!780769 (= e!434395 (Intermediate!7948 true index!1321 x!1131))))

(declare-fun b!780770 () Bool)

(assert (=> b!780770 (= e!434399 (Intermediate!7948 false index!1321 x!1131))))

(declare-fun b!780771 () Bool)

(assert (=> b!780771 (and (bvsge (index!34162 lt!347901) #b00000000000000000000000000000000) (bvslt (index!34162 lt!347901) (size!20812 a!3186)))))

(declare-fun res!528068 () Bool)

(assert (=> b!780771 (= res!528068 (= (select (arr!20392 a!3186) (index!34162 lt!347901)) (select (arr!20392 a!3186) j!159)))))

(assert (=> b!780771 (=> res!528068 e!434398)))

(assert (=> b!780771 (= e!434397 e!434398)))

(declare-fun b!780772 () Bool)

(assert (=> b!780772 (= e!434396 (bvsge (x!65264 lt!347901) #b01111111111111111111111111111110))))

(declare-fun b!780773 () Bool)

(assert (=> b!780773 (and (bvsge (index!34162 lt!347901) #b00000000000000000000000000000000) (bvslt (index!34162 lt!347901) (size!20812 a!3186)))))

(declare-fun res!528067 () Bool)

(assert (=> b!780773 (= res!528067 (= (select (arr!20392 a!3186) (index!34162 lt!347901)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!780773 (=> res!528067 e!434398)))

(declare-fun d!102741 () Bool)

(assert (=> d!102741 e!434396))

(declare-fun c!86758 () Bool)

(assert (=> d!102741 (= c!86758 (and ((_ is Intermediate!7948) lt!347901) (undefined!8760 lt!347901)))))

(assert (=> d!102741 (= lt!347901 e!434395)))

(declare-fun c!86757 () Bool)

(assert (=> d!102741 (= c!86757 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102741 (= lt!347902 (select (arr!20392 a!3186) index!1321))))

(assert (=> d!102741 (validMask!0 mask!3328)))

(assert (=> d!102741 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20392 a!3186) j!159) a!3186 mask!3328) lt!347901)))

(declare-fun b!780765 () Bool)

(assert (=> b!780765 (= e!434399 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20392 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!102741 c!86757) b!780769))

(assert (= (and d!102741 (not c!86757)) b!780766))

(assert (= (and b!780766 c!86756) b!780770))

(assert (= (and b!780766 (not c!86756)) b!780765))

(assert (= (and d!102741 c!86758) b!780772))

(assert (= (and d!102741 (not c!86758)) b!780768))

(assert (= (and b!780768 res!528069) b!780771))

(assert (= (and b!780771 (not res!528068)) b!780773))

(assert (= (and b!780773 (not res!528067)) b!780767))

(declare-fun m!724565 () Bool)

(assert (=> b!780771 m!724565))

(assert (=> d!102741 m!724379))

(assert (=> d!102741 m!724237))

(assert (=> b!780765 m!724353))

(assert (=> b!780765 m!724353))

(assert (=> b!780765 m!724215))

(declare-fun m!724567 () Bool)

(assert (=> b!780765 m!724567))

(assert (=> b!780767 m!724565))

(assert (=> b!780773 m!724565))

(assert (=> b!780308 d!102741))

(check-sat (not b!780451) (not b!780493) (not b!780442) (not d!102675) (not b!780708) (not d!102671) (not d!102703) (not b!780763) (not d!102655) (not d!102727) (not d!102741) (not bm!35248) (not bm!35244) (not b!780649) (not bm!35255) (not b!780762) (not d!102693) (not b!780765) (not b!780491) (not b!780703) (not b!780626) (not d!102661) (not b!780660) (not d!102657) (not b!780702) (not b!780764) (not b!780627) (not b!780565))
(check-sat)
