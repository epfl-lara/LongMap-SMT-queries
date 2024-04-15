; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64508 () Bool)

(assert start!64508)

(declare-fun b!726298 () Bool)

(declare-fun res!487421 () Bool)

(declare-fun e!406623 () Bool)

(assert (=> b!726298 (=> (not res!487421) (not e!406623))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726298 (= res!487421 (validKeyInArray!0 k0!2102))))

(declare-fun b!726299 () Bool)

(declare-fun res!487418 () Bool)

(declare-fun e!406630 () Bool)

(assert (=> b!726299 (=> (not res!487418) (not e!406630))))

(declare-datatypes ((array!41043 0))(
  ( (array!41044 (arr!19643 (Array (_ BitVec 32) (_ BitVec 64))) (size!20064 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41043)

(declare-datatypes ((List!13684 0))(
  ( (Nil!13681) (Cons!13680 (h!14737 (_ BitVec 64)) (t!19990 List!13684)) )
))
(declare-fun arrayNoDuplicates!0 (array!41043 (_ BitVec 32) List!13684) Bool)

(assert (=> b!726299 (= res!487418 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13681))))

(declare-fun b!726300 () Bool)

(declare-fun res!487417 () Bool)

(assert (=> b!726300 (=> (not res!487417) (not e!406623))))

(declare-fun arrayContainsKey!0 (array!41043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726300 (= res!487417 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726301 () Bool)

(declare-fun e!406626 () Bool)

(declare-fun e!406625 () Bool)

(assert (=> b!726301 (= e!406626 e!406625)))

(declare-fun res!487409 () Bool)

(assert (=> b!726301 (=> (not res!487409) (not e!406625))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7240 0))(
  ( (MissingZero!7240 (index!31328 (_ BitVec 32))) (Found!7240 (index!31329 (_ BitVec 32))) (Intermediate!7240 (undefined!8052 Bool) (index!31330 (_ BitVec 32)) (x!62325 (_ BitVec 32))) (Undefined!7240) (MissingVacant!7240 (index!31331 (_ BitVec 32))) )
))
(declare-fun lt!321533 () SeekEntryResult!7240)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41043 (_ BitVec 32)) SeekEntryResult!7240)

(assert (=> b!726301 (= res!487409 (= (seekEntryOrOpen!0 (select (arr!19643 a!3186) j!159) a!3186 mask!3328) lt!321533))))

(assert (=> b!726301 (= lt!321533 (Found!7240 j!159))))

(declare-fun b!726302 () Bool)

(declare-fun res!487408 () Bool)

(assert (=> b!726302 (=> (not res!487408) (not e!406630))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726302 (= res!487408 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20064 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20064 a!3186))))))

(declare-fun b!726303 () Bool)

(declare-fun e!406624 () Bool)

(assert (=> b!726303 (= e!406630 e!406624)))

(declare-fun res!487422 () Bool)

(assert (=> b!726303 (=> (not res!487422) (not e!406624))))

(declare-fun lt!321532 () SeekEntryResult!7240)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41043 (_ BitVec 32)) SeekEntryResult!7240)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726303 (= res!487422 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19643 a!3186) j!159) mask!3328) (select (arr!19643 a!3186) j!159) a!3186 mask!3328) lt!321532))))

(assert (=> b!726303 (= lt!321532 (Intermediate!7240 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726304 () Bool)

(declare-fun res!487410 () Bool)

(assert (=> b!726304 (=> (not res!487410) (not e!406623))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!726304 (= res!487410 (and (= (size!20064 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20064 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20064 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!487412 () Bool)

(assert (=> start!64508 (=> (not res!487412) (not e!406623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64508 (= res!487412 (validMask!0 mask!3328))))

(assert (=> start!64508 e!406623))

(assert (=> start!64508 true))

(declare-fun array_inv!15526 (array!41043) Bool)

(assert (=> start!64508 (array_inv!15526 a!3186)))

(declare-fun b!726305 () Bool)

(declare-fun res!487414 () Bool)

(assert (=> b!726305 (=> (not res!487414) (not e!406630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41043 (_ BitVec 32)) Bool)

(assert (=> b!726305 (= res!487414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726306 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41043 (_ BitVec 32)) SeekEntryResult!7240)

(assert (=> b!726306 (= e!406625 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19643 a!3186) j!159) a!3186 mask!3328) lt!321533))))

(declare-fun e!406627 () Bool)

(declare-fun b!726307 () Bool)

(assert (=> b!726307 (= e!406627 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19643 a!3186) j!159) a!3186 mask!3328) lt!321532))))

(declare-fun b!726308 () Bool)

(declare-fun e!406629 () Bool)

(assert (=> b!726308 (= e!406629 (not true))))

(assert (=> b!726308 e!406626))

(declare-fun res!487420 () Bool)

(assert (=> b!726308 (=> (not res!487420) (not e!406626))))

(assert (=> b!726308 (= res!487420 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24770 0))(
  ( (Unit!24771) )
))
(declare-fun lt!321531 () Unit!24770)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41043 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24770)

(assert (=> b!726308 (= lt!321531 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726309 () Bool)

(declare-fun res!487413 () Bool)

(assert (=> b!726309 (=> (not res!487413) (not e!406623))))

(assert (=> b!726309 (= res!487413 (validKeyInArray!0 (select (arr!19643 a!3186) j!159)))))

(declare-fun b!726310 () Bool)

(assert (=> b!726310 (= e!406627 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19643 a!3186) j!159) a!3186 mask!3328) (Found!7240 j!159)))))

(declare-fun b!726311 () Bool)

(assert (=> b!726311 (= e!406624 e!406629)))

(declare-fun res!487419 () Bool)

(assert (=> b!726311 (=> (not res!487419) (not e!406629))))

(declare-fun lt!321529 () (_ BitVec 64))

(declare-fun lt!321528 () array!41043)

(assert (=> b!726311 (= res!487419 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321529 mask!3328) lt!321529 lt!321528 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321529 lt!321528 mask!3328)))))

(assert (=> b!726311 (= lt!321529 (select (store (arr!19643 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!726311 (= lt!321528 (array!41044 (store (arr!19643 a!3186) i!1173 k0!2102) (size!20064 a!3186)))))

(declare-fun b!726312 () Bool)

(declare-fun res!487416 () Bool)

(assert (=> b!726312 (=> (not res!487416) (not e!406624))))

(assert (=> b!726312 (= res!487416 e!406627)))

(declare-fun c!79818 () Bool)

(assert (=> b!726312 (= c!79818 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726313 () Bool)

(assert (=> b!726313 (= e!406623 e!406630)))

(declare-fun res!487411 () Bool)

(assert (=> b!726313 (=> (not res!487411) (not e!406630))))

(declare-fun lt!321530 () SeekEntryResult!7240)

(assert (=> b!726313 (= res!487411 (or (= lt!321530 (MissingZero!7240 i!1173)) (= lt!321530 (MissingVacant!7240 i!1173))))))

(assert (=> b!726313 (= lt!321530 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!726314 () Bool)

(declare-fun res!487415 () Bool)

(assert (=> b!726314 (=> (not res!487415) (not e!406624))))

(assert (=> b!726314 (= res!487415 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19643 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64508 res!487412) b!726304))

(assert (= (and b!726304 res!487410) b!726309))

(assert (= (and b!726309 res!487413) b!726298))

(assert (= (and b!726298 res!487421) b!726300))

(assert (= (and b!726300 res!487417) b!726313))

(assert (= (and b!726313 res!487411) b!726305))

(assert (= (and b!726305 res!487414) b!726299))

(assert (= (and b!726299 res!487418) b!726302))

(assert (= (and b!726302 res!487408) b!726303))

(assert (= (and b!726303 res!487422) b!726314))

(assert (= (and b!726314 res!487415) b!726312))

(assert (= (and b!726312 c!79818) b!726307))

(assert (= (and b!726312 (not c!79818)) b!726310))

(assert (= (and b!726312 res!487416) b!726311))

(assert (= (and b!726311 res!487419) b!726308))

(assert (= (and b!726308 res!487420) b!726301))

(assert (= (and b!726301 res!487409) b!726306))

(declare-fun m!679841 () Bool)

(assert (=> b!726310 m!679841))

(assert (=> b!726310 m!679841))

(declare-fun m!679843 () Bool)

(assert (=> b!726310 m!679843))

(assert (=> b!726307 m!679841))

(assert (=> b!726307 m!679841))

(declare-fun m!679845 () Bool)

(assert (=> b!726307 m!679845))

(declare-fun m!679847 () Bool)

(assert (=> start!64508 m!679847))

(declare-fun m!679849 () Bool)

(assert (=> start!64508 m!679849))

(declare-fun m!679851 () Bool)

(assert (=> b!726298 m!679851))

(declare-fun m!679853 () Bool)

(assert (=> b!726313 m!679853))

(assert (=> b!726303 m!679841))

(assert (=> b!726303 m!679841))

(declare-fun m!679855 () Bool)

(assert (=> b!726303 m!679855))

(assert (=> b!726303 m!679855))

(assert (=> b!726303 m!679841))

(declare-fun m!679857 () Bool)

(assert (=> b!726303 m!679857))

(declare-fun m!679859 () Bool)

(assert (=> b!726299 m!679859))

(declare-fun m!679861 () Bool)

(assert (=> b!726300 m!679861))

(assert (=> b!726309 m!679841))

(assert (=> b!726309 m!679841))

(declare-fun m!679863 () Bool)

(assert (=> b!726309 m!679863))

(declare-fun m!679865 () Bool)

(assert (=> b!726311 m!679865))

(declare-fun m!679867 () Bool)

(assert (=> b!726311 m!679867))

(assert (=> b!726311 m!679865))

(declare-fun m!679869 () Bool)

(assert (=> b!726311 m!679869))

(declare-fun m!679871 () Bool)

(assert (=> b!726311 m!679871))

(declare-fun m!679873 () Bool)

(assert (=> b!726311 m!679873))

(assert (=> b!726306 m!679841))

(assert (=> b!726306 m!679841))

(declare-fun m!679875 () Bool)

(assert (=> b!726306 m!679875))

(assert (=> b!726301 m!679841))

(assert (=> b!726301 m!679841))

(declare-fun m!679877 () Bool)

(assert (=> b!726301 m!679877))

(declare-fun m!679879 () Bool)

(assert (=> b!726305 m!679879))

(declare-fun m!679881 () Bool)

(assert (=> b!726314 m!679881))

(declare-fun m!679883 () Bool)

(assert (=> b!726308 m!679883))

(declare-fun m!679885 () Bool)

(assert (=> b!726308 m!679885))

(check-sat (not b!726305) (not b!726310) (not b!726301) (not start!64508) (not b!726299) (not b!726308) (not b!726300) (not b!726313) (not b!726303) (not b!726298) (not b!726307) (not b!726309) (not b!726311) (not b!726306))
(check-sat)
