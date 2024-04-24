; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66928 () Bool)

(assert start!66928)

(declare-fun b!771341 () Bool)

(declare-fun res!521639 () Bool)

(declare-fun e!429502 () Bool)

(assert (=> b!771341 (=> (not res!521639) (not e!429502))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42370 0))(
  ( (array!42371 (arr!20281 (Array (_ BitVec 32) (_ BitVec 64))) (size!20701 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42370)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!771341 (= res!521639 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20281 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!771342 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!429499 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7837 0))(
  ( (MissingZero!7837 (index!33716 (_ BitVec 32))) (Found!7837 (index!33717 (_ BitVec 32))) (Intermediate!7837 (undefined!8649 Bool) (index!33718 (_ BitVec 32)) (x!64803 (_ BitVec 32))) (Undefined!7837) (MissingVacant!7837 (index!33719 (_ BitVec 32))) )
))
(declare-fun lt!343316 () SeekEntryResult!7837)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42370 (_ BitVec 32)) SeekEntryResult!7837)

(assert (=> b!771342 (= e!429499 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20281 a!3186) j!159) a!3186 mask!3328) lt!343316))))

(declare-fun b!771343 () Bool)

(declare-datatypes ((Unit!26539 0))(
  ( (Unit!26540) )
))
(declare-fun e!429501 () Unit!26539)

(declare-fun Unit!26541 () Unit!26539)

(assert (=> b!771343 (= e!429501 Unit!26541)))

(declare-fun lt!343318 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!343311 () SeekEntryResult!7837)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42370 (_ BitVec 32)) SeekEntryResult!7837)

(assert (=> b!771343 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343318 (select (arr!20281 a!3186) j!159) a!3186 mask!3328) lt!343311)))

(declare-fun b!771344 () Bool)

(declare-fun res!521641 () Bool)

(declare-fun e!429496 () Bool)

(assert (=> b!771344 (=> (not res!521641) (not e!429496))))

(assert (=> b!771344 (= res!521641 (and (= (size!20701 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20701 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20701 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!521631 () Bool)

(assert (=> start!66928 (=> (not res!521631) (not e!429496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66928 (= res!521631 (validMask!0 mask!3328))))

(assert (=> start!66928 e!429496))

(assert (=> start!66928 true))

(declare-fun array_inv!16140 (array!42370) Bool)

(assert (=> start!66928 (array_inv!16140 a!3186)))

(declare-fun b!771345 () Bool)

(declare-fun res!521633 () Bool)

(assert (=> b!771345 (=> (not res!521633) (not e!429496))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!771345 (= res!521633 (validKeyInArray!0 k0!2102))))

(declare-fun b!771346 () Bool)

(declare-fun res!521630 () Bool)

(declare-fun e!429503 () Bool)

(assert (=> b!771346 (=> (not res!521630) (not e!429503))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!771346 (= res!521630 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20701 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20701 a!3186))))))

(declare-fun b!771347 () Bool)

(assert (=> b!771347 (= e!429496 e!429503)))

(declare-fun res!521629 () Bool)

(assert (=> b!771347 (=> (not res!521629) (not e!429503))))

(declare-fun lt!343308 () SeekEntryResult!7837)

(assert (=> b!771347 (= res!521629 (or (= lt!343308 (MissingZero!7837 i!1173)) (= lt!343308 (MissingVacant!7837 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42370 (_ BitVec 32)) SeekEntryResult!7837)

(assert (=> b!771347 (= lt!343308 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!771348 () Bool)

(declare-fun e!429504 () Bool)

(declare-fun e!429505 () Bool)

(assert (=> b!771348 (= e!429504 (not e!429505))))

(declare-fun res!521636 () Bool)

(assert (=> b!771348 (=> res!521636 e!429505)))

(declare-fun lt!343310 () SeekEntryResult!7837)

(get-info :version)

(assert (=> b!771348 (= res!521636 (or (not ((_ is Intermediate!7837) lt!343310)) (bvsge x!1131 (x!64803 lt!343310))))))

(declare-fun e!429498 () Bool)

(assert (=> b!771348 e!429498))

(declare-fun res!521640 () Bool)

(assert (=> b!771348 (=> (not res!521640) (not e!429498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42370 (_ BitVec 32)) Bool)

(assert (=> b!771348 (= res!521640 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343312 () Unit!26539)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26539)

(assert (=> b!771348 (= lt!343312 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!771349 () Bool)

(declare-fun res!521632 () Bool)

(assert (=> b!771349 (=> (not res!521632) (not e!429502))))

(declare-fun e!429500 () Bool)

(assert (=> b!771349 (= res!521632 e!429500)))

(declare-fun c!85256 () Bool)

(assert (=> b!771349 (= c!85256 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!771350 () Bool)

(assert (=> b!771350 (= e!429505 true)))

(declare-fun lt!343315 () Unit!26539)

(assert (=> b!771350 (= lt!343315 e!429501)))

(declare-fun c!85255 () Bool)

(assert (=> b!771350 (= c!85255 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771350 (= lt!343318 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!771351 () Bool)

(assert (=> b!771351 (= e!429502 e!429504)))

(declare-fun res!521637 () Bool)

(assert (=> b!771351 (=> (not res!521637) (not e!429504))))

(declare-fun lt!343309 () SeekEntryResult!7837)

(assert (=> b!771351 (= res!521637 (= lt!343309 lt!343310))))

(declare-fun lt!343313 () array!42370)

(declare-fun lt!343317 () (_ BitVec 64))

(assert (=> b!771351 (= lt!343310 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343317 lt!343313 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771351 (= lt!343309 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343317 mask!3328) lt!343317 lt!343313 mask!3328))))

(assert (=> b!771351 (= lt!343317 (select (store (arr!20281 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!771351 (= lt!343313 (array!42371 (store (arr!20281 a!3186) i!1173 k0!2102) (size!20701 a!3186)))))

(declare-fun b!771352 () Bool)

(assert (=> b!771352 (= e!429503 e!429502)))

(declare-fun res!521634 () Bool)

(assert (=> b!771352 (=> (not res!521634) (not e!429502))))

(assert (=> b!771352 (= res!521634 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20281 a!3186) j!159) mask!3328) (select (arr!20281 a!3186) j!159) a!3186 mask!3328) lt!343311))))

(assert (=> b!771352 (= lt!343311 (Intermediate!7837 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!771353 () Bool)

(declare-fun res!521642 () Bool)

(assert (=> b!771353 (=> (not res!521642) (not e!429496))))

(declare-fun arrayContainsKey!0 (array!42370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771353 (= res!521642 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!771354 () Bool)

(assert (=> b!771354 (= e!429500 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20281 a!3186) j!159) a!3186 mask!3328) (Found!7837 j!159)))))

(declare-fun b!771355 () Bool)

(declare-fun res!521638 () Bool)

(assert (=> b!771355 (=> (not res!521638) (not e!429503))))

(declare-datatypes ((List!14190 0))(
  ( (Nil!14187) (Cons!14186 (h!15291 (_ BitVec 64)) (t!20497 List!14190)) )
))
(declare-fun arrayNoDuplicates!0 (array!42370 (_ BitVec 32) List!14190) Bool)

(assert (=> b!771355 (= res!521638 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14187))))

(declare-fun b!771356 () Bool)

(assert (=> b!771356 (= e!429498 e!429499)))

(declare-fun res!521643 () Bool)

(assert (=> b!771356 (=> (not res!521643) (not e!429499))))

(assert (=> b!771356 (= res!521643 (= (seekEntryOrOpen!0 (select (arr!20281 a!3186) j!159) a!3186 mask!3328) lt!343316))))

(assert (=> b!771356 (= lt!343316 (Found!7837 j!159))))

(declare-fun b!771357 () Bool)

(declare-fun Unit!26542 () Unit!26539)

(assert (=> b!771357 (= e!429501 Unit!26542)))

(declare-fun lt!343314 () SeekEntryResult!7837)

(assert (=> b!771357 (= lt!343314 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20281 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!771357 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343318 resIntermediateIndex!5 (select (arr!20281 a!3186) j!159) a!3186 mask!3328) (Found!7837 j!159))))

(declare-fun b!771358 () Bool)

(assert (=> b!771358 (= e!429500 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20281 a!3186) j!159) a!3186 mask!3328) lt!343311))))

(declare-fun b!771359 () Bool)

(declare-fun res!521628 () Bool)

(assert (=> b!771359 (=> (not res!521628) (not e!429503))))

(assert (=> b!771359 (= res!521628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!771360 () Bool)

(declare-fun res!521635 () Bool)

(assert (=> b!771360 (=> (not res!521635) (not e!429496))))

(assert (=> b!771360 (= res!521635 (validKeyInArray!0 (select (arr!20281 a!3186) j!159)))))

(assert (= (and start!66928 res!521631) b!771344))

(assert (= (and b!771344 res!521641) b!771360))

(assert (= (and b!771360 res!521635) b!771345))

(assert (= (and b!771345 res!521633) b!771353))

(assert (= (and b!771353 res!521642) b!771347))

(assert (= (and b!771347 res!521629) b!771359))

(assert (= (and b!771359 res!521628) b!771355))

(assert (= (and b!771355 res!521638) b!771346))

(assert (= (and b!771346 res!521630) b!771352))

(assert (= (and b!771352 res!521634) b!771341))

(assert (= (and b!771341 res!521639) b!771349))

(assert (= (and b!771349 c!85256) b!771358))

(assert (= (and b!771349 (not c!85256)) b!771354))

(assert (= (and b!771349 res!521632) b!771351))

(assert (= (and b!771351 res!521637) b!771348))

(assert (= (and b!771348 res!521640) b!771356))

(assert (= (and b!771356 res!521643) b!771342))

(assert (= (and b!771348 (not res!521636)) b!771350))

(assert (= (and b!771350 c!85255) b!771343))

(assert (= (and b!771350 (not c!85255)) b!771357))

(declare-fun m!716987 () Bool)

(assert (=> start!66928 m!716987))

(declare-fun m!716989 () Bool)

(assert (=> start!66928 m!716989))

(declare-fun m!716991 () Bool)

(assert (=> b!771342 m!716991))

(assert (=> b!771342 m!716991))

(declare-fun m!716993 () Bool)

(assert (=> b!771342 m!716993))

(declare-fun m!716995 () Bool)

(assert (=> b!771355 m!716995))

(assert (=> b!771357 m!716991))

(assert (=> b!771357 m!716991))

(declare-fun m!716997 () Bool)

(assert (=> b!771357 m!716997))

(assert (=> b!771357 m!716991))

(declare-fun m!716999 () Bool)

(assert (=> b!771357 m!716999))

(declare-fun m!717001 () Bool)

(assert (=> b!771353 m!717001))

(assert (=> b!771358 m!716991))

(assert (=> b!771358 m!716991))

(declare-fun m!717003 () Bool)

(assert (=> b!771358 m!717003))

(assert (=> b!771343 m!716991))

(assert (=> b!771343 m!716991))

(declare-fun m!717005 () Bool)

(assert (=> b!771343 m!717005))

(assert (=> b!771352 m!716991))

(assert (=> b!771352 m!716991))

(declare-fun m!717007 () Bool)

(assert (=> b!771352 m!717007))

(assert (=> b!771352 m!717007))

(assert (=> b!771352 m!716991))

(declare-fun m!717009 () Bool)

(assert (=> b!771352 m!717009))

(declare-fun m!717011 () Bool)

(assert (=> b!771348 m!717011))

(declare-fun m!717013 () Bool)

(assert (=> b!771348 m!717013))

(assert (=> b!771356 m!716991))

(assert (=> b!771356 m!716991))

(declare-fun m!717015 () Bool)

(assert (=> b!771356 m!717015))

(declare-fun m!717017 () Bool)

(assert (=> b!771350 m!717017))

(declare-fun m!717019 () Bool)

(assert (=> b!771341 m!717019))

(assert (=> b!771354 m!716991))

(assert (=> b!771354 m!716991))

(assert (=> b!771354 m!716997))

(declare-fun m!717021 () Bool)

(assert (=> b!771351 m!717021))

(assert (=> b!771351 m!717021))

(declare-fun m!717023 () Bool)

(assert (=> b!771351 m!717023))

(declare-fun m!717025 () Bool)

(assert (=> b!771351 m!717025))

(declare-fun m!717027 () Bool)

(assert (=> b!771351 m!717027))

(declare-fun m!717029 () Bool)

(assert (=> b!771351 m!717029))

(declare-fun m!717031 () Bool)

(assert (=> b!771347 m!717031))

(declare-fun m!717033 () Bool)

(assert (=> b!771359 m!717033))

(declare-fun m!717035 () Bool)

(assert (=> b!771345 m!717035))

(assert (=> b!771360 m!716991))

(assert (=> b!771360 m!716991))

(declare-fun m!717037 () Bool)

(assert (=> b!771360 m!717037))

(check-sat (not start!66928) (not b!771345) (not b!771353) (not b!771357) (not b!771347) (not b!771352) (not b!771350) (not b!771351) (not b!771356) (not b!771359) (not b!771354) (not b!771358) (not b!771348) (not b!771360) (not b!771355) (not b!771343) (not b!771342))
(check-sat)
