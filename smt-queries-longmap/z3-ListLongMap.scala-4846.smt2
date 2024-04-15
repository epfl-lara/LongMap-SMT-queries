; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66752 () Bool)

(assert start!66752)

(declare-fun b!769366 () Bool)

(declare-fun res!520388 () Bool)

(declare-fun e!428389 () Bool)

(assert (=> b!769366 (=> (not res!520388) (not e!428389))))

(declare-datatypes ((array!42333 0))(
  ( (array!42334 (arr!20267 (Array (_ BitVec 32) (_ BitVec 64))) (size!20688 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42333)

(declare-datatypes ((List!14308 0))(
  ( (Nil!14305) (Cons!14304 (h!15403 (_ BitVec 64)) (t!20614 List!14308)) )
))
(declare-fun arrayNoDuplicates!0 (array!42333 (_ BitVec 32) List!14308) Bool)

(assert (=> b!769366 (= res!520388 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14305))))

(declare-fun b!769367 () Bool)

(declare-fun res!520384 () Bool)

(assert (=> b!769367 (=> (not res!520384) (not e!428389))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769367 (= res!520384 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20688 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20688 a!3186))))))

(declare-fun b!769368 () Bool)

(declare-fun res!520392 () Bool)

(declare-fun e!428392 () Bool)

(assert (=> b!769368 (=> (not res!520392) (not e!428392))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769368 (= res!520392 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20267 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769369 () Bool)

(declare-fun e!428390 () Bool)

(assert (=> b!769369 (= e!428392 e!428390)))

(declare-fun res!520383 () Bool)

(assert (=> b!769369 (=> (not res!520383) (not e!428390))))

(declare-datatypes ((SeekEntryResult!7864 0))(
  ( (MissingZero!7864 (index!33824 (_ BitVec 32))) (Found!7864 (index!33825 (_ BitVec 32))) (Intermediate!7864 (undefined!8676 Bool) (index!33826 (_ BitVec 32)) (x!64766 (_ BitVec 32))) (Undefined!7864) (MissingVacant!7864 (index!33827 (_ BitVec 32))) )
))
(declare-fun lt!342208 () SeekEntryResult!7864)

(declare-fun lt!342209 () SeekEntryResult!7864)

(assert (=> b!769369 (= res!520383 (= lt!342208 lt!342209))))

(declare-fun lt!342207 () array!42333)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!342202 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42333 (_ BitVec 32)) SeekEntryResult!7864)

(assert (=> b!769369 (= lt!342209 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342202 lt!342207 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769369 (= lt!342208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342202 mask!3328) lt!342202 lt!342207 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!769369 (= lt!342202 (select (store (arr!20267 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!769369 (= lt!342207 (array!42334 (store (arr!20267 a!3186) i!1173 k0!2102) (size!20688 a!3186)))))

(declare-fun b!769370 () Bool)

(declare-fun e!428393 () Bool)

(assert (=> b!769370 (= e!428393 e!428389)))

(declare-fun res!520391 () Bool)

(assert (=> b!769370 (=> (not res!520391) (not e!428389))))

(declare-fun lt!342204 () SeekEntryResult!7864)

(assert (=> b!769370 (= res!520391 (or (= lt!342204 (MissingZero!7864 i!1173)) (= lt!342204 (MissingVacant!7864 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42333 (_ BitVec 32)) SeekEntryResult!7864)

(assert (=> b!769370 (= lt!342204 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!769371 () Bool)

(declare-fun e!428388 () Bool)

(declare-fun e!428386 () Bool)

(assert (=> b!769371 (= e!428388 e!428386)))

(declare-fun res!520398 () Bool)

(assert (=> b!769371 (=> (not res!520398) (not e!428386))))

(declare-fun lt!342205 () SeekEntryResult!7864)

(assert (=> b!769371 (= res!520398 (= (seekEntryOrOpen!0 (select (arr!20267 a!3186) j!159) a!3186 mask!3328) lt!342205))))

(assert (=> b!769371 (= lt!342205 (Found!7864 j!159))))

(declare-fun b!769372 () Bool)

(declare-fun e!428391 () Bool)

(assert (=> b!769372 (= e!428391 true)))

(declare-datatypes ((Unit!26450 0))(
  ( (Unit!26451) )
))
(declare-fun lt!342210 () Unit!26450)

(declare-fun e!428395 () Unit!26450)

(assert (=> b!769372 (= lt!342210 e!428395)))

(declare-fun c!84888 () Bool)

(assert (=> b!769372 (= c!84888 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!342211 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769372 (= lt!342211 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769373 () Bool)

(declare-fun res!520394 () Bool)

(assert (=> b!769373 (=> (not res!520394) (not e!428393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769373 (= res!520394 (validKeyInArray!0 (select (arr!20267 a!3186) j!159)))))

(declare-fun b!769374 () Bool)

(declare-fun res!520395 () Bool)

(assert (=> b!769374 (=> (not res!520395) (not e!428389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42333 (_ BitVec 32)) Bool)

(assert (=> b!769374 (= res!520395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769375 () Bool)

(assert (=> b!769375 (= e!428389 e!428392)))

(declare-fun res!520389 () Bool)

(assert (=> b!769375 (=> (not res!520389) (not e!428392))))

(declare-fun lt!342212 () SeekEntryResult!7864)

(assert (=> b!769375 (= res!520389 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20267 a!3186) j!159) mask!3328) (select (arr!20267 a!3186) j!159) a!3186 mask!3328) lt!342212))))

(assert (=> b!769375 (= lt!342212 (Intermediate!7864 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769376 () Bool)

(declare-fun res!520397 () Bool)

(assert (=> b!769376 (=> (not res!520397) (not e!428393))))

(assert (=> b!769376 (= res!520397 (validKeyInArray!0 k0!2102))))

(declare-fun res!520387 () Bool)

(assert (=> start!66752 (=> (not res!520387) (not e!428393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66752 (= res!520387 (validMask!0 mask!3328))))

(assert (=> start!66752 e!428393))

(assert (=> start!66752 true))

(declare-fun array_inv!16150 (array!42333) Bool)

(assert (=> start!66752 (array_inv!16150 a!3186)))

(declare-fun b!769377 () Bool)

(declare-fun Unit!26452 () Unit!26450)

(assert (=> b!769377 (= e!428395 Unit!26452)))

(declare-fun lt!342203 () SeekEntryResult!7864)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42333 (_ BitVec 32)) SeekEntryResult!7864)

(assert (=> b!769377 (= lt!342203 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20267 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769377 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342211 resIntermediateIndex!5 (select (arr!20267 a!3186) j!159) a!3186 mask!3328) (Found!7864 j!159))))

(declare-fun b!769378 () Bool)

(assert (=> b!769378 (= e!428390 (not e!428391))))

(declare-fun res!520396 () Bool)

(assert (=> b!769378 (=> res!520396 e!428391)))

(get-info :version)

(assert (=> b!769378 (= res!520396 (or (not ((_ is Intermediate!7864) lt!342209)) (bvsge x!1131 (x!64766 lt!342209))))))

(assert (=> b!769378 e!428388))

(declare-fun res!520385 () Bool)

(assert (=> b!769378 (=> (not res!520385) (not e!428388))))

(assert (=> b!769378 (= res!520385 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342206 () Unit!26450)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42333 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26450)

(assert (=> b!769378 (= lt!342206 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!428394 () Bool)

(declare-fun b!769379 () Bool)

(assert (=> b!769379 (= e!428394 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20267 a!3186) j!159) a!3186 mask!3328) lt!342212))))

(declare-fun b!769380 () Bool)

(declare-fun res!520393 () Bool)

(assert (=> b!769380 (=> (not res!520393) (not e!428393))))

(assert (=> b!769380 (= res!520393 (and (= (size!20688 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20688 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20688 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769381 () Bool)

(assert (=> b!769381 (= e!428386 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20267 a!3186) j!159) a!3186 mask!3328) lt!342205))))

(declare-fun b!769382 () Bool)

(assert (=> b!769382 (= e!428394 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20267 a!3186) j!159) a!3186 mask!3328) (Found!7864 j!159)))))

(declare-fun b!769383 () Bool)

(declare-fun res!520390 () Bool)

(assert (=> b!769383 (=> (not res!520390) (not e!428392))))

(assert (=> b!769383 (= res!520390 e!428394)))

(declare-fun c!84887 () Bool)

(assert (=> b!769383 (= c!84887 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769384 () Bool)

(declare-fun res!520386 () Bool)

(assert (=> b!769384 (=> (not res!520386) (not e!428393))))

(declare-fun arrayContainsKey!0 (array!42333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769384 (= res!520386 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769385 () Bool)

(declare-fun Unit!26453 () Unit!26450)

(assert (=> b!769385 (= e!428395 Unit!26453)))

(assert (=> b!769385 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342211 (select (arr!20267 a!3186) j!159) a!3186 mask!3328) lt!342212)))

(assert (= (and start!66752 res!520387) b!769380))

(assert (= (and b!769380 res!520393) b!769373))

(assert (= (and b!769373 res!520394) b!769376))

(assert (= (and b!769376 res!520397) b!769384))

(assert (= (and b!769384 res!520386) b!769370))

(assert (= (and b!769370 res!520391) b!769374))

(assert (= (and b!769374 res!520395) b!769366))

(assert (= (and b!769366 res!520388) b!769367))

(assert (= (and b!769367 res!520384) b!769375))

(assert (= (and b!769375 res!520389) b!769368))

(assert (= (and b!769368 res!520392) b!769383))

(assert (= (and b!769383 c!84887) b!769379))

(assert (= (and b!769383 (not c!84887)) b!769382))

(assert (= (and b!769383 res!520390) b!769369))

(assert (= (and b!769369 res!520383) b!769378))

(assert (= (and b!769378 res!520385) b!769371))

(assert (= (and b!769371 res!520398) b!769381))

(assert (= (and b!769378 (not res!520396)) b!769372))

(assert (= (and b!769372 c!84888) b!769385))

(assert (= (and b!769372 (not c!84888)) b!769377))

(declare-fun m!714249 () Bool)

(assert (=> b!769379 m!714249))

(assert (=> b!769379 m!714249))

(declare-fun m!714251 () Bool)

(assert (=> b!769379 m!714251))

(declare-fun m!714253 () Bool)

(assert (=> b!769374 m!714253))

(declare-fun m!714255 () Bool)

(assert (=> b!769369 m!714255))

(assert (=> b!769369 m!714255))

(declare-fun m!714257 () Bool)

(assert (=> b!769369 m!714257))

(declare-fun m!714259 () Bool)

(assert (=> b!769369 m!714259))

(declare-fun m!714261 () Bool)

(assert (=> b!769369 m!714261))

(declare-fun m!714263 () Bool)

(assert (=> b!769369 m!714263))

(declare-fun m!714265 () Bool)

(assert (=> start!66752 m!714265))

(declare-fun m!714267 () Bool)

(assert (=> start!66752 m!714267))

(declare-fun m!714269 () Bool)

(assert (=> b!769368 m!714269))

(assert (=> b!769385 m!714249))

(assert (=> b!769385 m!714249))

(declare-fun m!714271 () Bool)

(assert (=> b!769385 m!714271))

(declare-fun m!714273 () Bool)

(assert (=> b!769366 m!714273))

(declare-fun m!714275 () Bool)

(assert (=> b!769372 m!714275))

(assert (=> b!769377 m!714249))

(assert (=> b!769377 m!714249))

(declare-fun m!714277 () Bool)

(assert (=> b!769377 m!714277))

(assert (=> b!769377 m!714249))

(declare-fun m!714279 () Bool)

(assert (=> b!769377 m!714279))

(assert (=> b!769375 m!714249))

(assert (=> b!769375 m!714249))

(declare-fun m!714281 () Bool)

(assert (=> b!769375 m!714281))

(assert (=> b!769375 m!714281))

(assert (=> b!769375 m!714249))

(declare-fun m!714283 () Bool)

(assert (=> b!769375 m!714283))

(assert (=> b!769373 m!714249))

(assert (=> b!769373 m!714249))

(declare-fun m!714285 () Bool)

(assert (=> b!769373 m!714285))

(declare-fun m!714287 () Bool)

(assert (=> b!769370 m!714287))

(assert (=> b!769371 m!714249))

(assert (=> b!769371 m!714249))

(declare-fun m!714289 () Bool)

(assert (=> b!769371 m!714289))

(declare-fun m!714291 () Bool)

(assert (=> b!769376 m!714291))

(declare-fun m!714293 () Bool)

(assert (=> b!769384 m!714293))

(declare-fun m!714295 () Bool)

(assert (=> b!769378 m!714295))

(declare-fun m!714297 () Bool)

(assert (=> b!769378 m!714297))

(assert (=> b!769382 m!714249))

(assert (=> b!769382 m!714249))

(assert (=> b!769382 m!714277))

(assert (=> b!769381 m!714249))

(assert (=> b!769381 m!714249))

(declare-fun m!714299 () Bool)

(assert (=> b!769381 m!714299))

(check-sat (not b!769369) (not b!769384) (not b!769385) (not b!769370) (not start!66752) (not b!769382) (not b!769375) (not b!769376) (not b!769379) (not b!769372) (not b!769371) (not b!769373) (not b!769381) (not b!769374) (not b!769378) (not b!769366) (not b!769377))
(check-sat)
