; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64352 () Bool)

(assert start!64352)

(declare-fun b!723647 () Bool)

(declare-datatypes ((array!40950 0))(
  ( (array!40951 (arr!19598 (Array (_ BitVec 32) (_ BitVec 64))) (size!20019 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40950)

(declare-datatypes ((SeekEntryResult!7195 0))(
  ( (MissingZero!7195 (index!31148 (_ BitVec 32))) (Found!7195 (index!31149 (_ BitVec 32))) (Intermediate!7195 (undefined!8007 Bool) (index!31150 (_ BitVec 32)) (x!62151 (_ BitVec 32))) (Undefined!7195) (MissingVacant!7195 (index!31151 (_ BitVec 32))) )
))
(declare-fun lt!320575 () SeekEntryResult!7195)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!405345 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40950 (_ BitVec 32)) SeekEntryResult!7195)

(assert (=> b!723647 (= e!405345 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19598 a!3186) j!159) a!3186 mask!3328) lt!320575))))

(declare-fun b!723648 () Bool)

(declare-fun e!405344 () Bool)

(declare-fun e!405346 () Bool)

(assert (=> b!723648 (= e!405344 e!405346)))

(declare-fun res!485300 () Bool)

(assert (=> b!723648 (=> (not res!485300) (not e!405346))))

(declare-fun lt!320579 () SeekEntryResult!7195)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723648 (= res!485300 (or (= lt!320579 (MissingZero!7195 i!1173)) (= lt!320579 (MissingVacant!7195 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40950 (_ BitVec 32)) SeekEntryResult!7195)

(assert (=> b!723648 (= lt!320579 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723649 () Bool)

(declare-fun res!485304 () Bool)

(assert (=> b!723649 (=> (not res!485304) (not e!405344))))

(assert (=> b!723649 (= res!485304 (and (= (size!20019 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20019 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20019 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!405349 () Bool)

(declare-fun b!723650 () Bool)

(assert (=> b!723650 (= e!405349 (= (seekEntryOrOpen!0 (select (arr!19598 a!3186) j!159) a!3186 mask!3328) (Found!7195 j!159)))))

(declare-fun b!723651 () Bool)

(declare-fun res!485301 () Bool)

(assert (=> b!723651 (=> (not res!485301) (not e!405344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723651 (= res!485301 (validKeyInArray!0 (select (arr!19598 a!3186) j!159)))))

(declare-fun b!723652 () Bool)

(declare-fun res!485313 () Bool)

(assert (=> b!723652 (=> (not res!485313) (not e!405346))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723652 (= res!485313 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20019 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20019 a!3186))))))

(declare-fun b!723653 () Bool)

(declare-fun res!485302 () Bool)

(assert (=> b!723653 (=> (not res!485302) (not e!405344))))

(assert (=> b!723653 (= res!485302 (validKeyInArray!0 k0!2102))))

(declare-fun b!723654 () Bool)

(declare-fun e!405347 () Bool)

(declare-fun e!405348 () Bool)

(assert (=> b!723654 (= e!405347 e!405348)))

(declare-fun res!485312 () Bool)

(assert (=> b!723654 (=> (not res!485312) (not e!405348))))

(declare-fun lt!320576 () (_ BitVec 64))

(declare-fun lt!320577 () array!40950)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723654 (= res!485312 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320576 mask!3328) lt!320576 lt!320577 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320576 lt!320577 mask!3328)))))

(assert (=> b!723654 (= lt!320576 (select (store (arr!19598 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723654 (= lt!320577 (array!40951 (store (arr!19598 a!3186) i!1173 k0!2102) (size!20019 a!3186)))))

(declare-fun b!723655 () Bool)

(assert (=> b!723655 (= e!405348 (not true))))

(assert (=> b!723655 e!405349))

(declare-fun res!485307 () Bool)

(assert (=> b!723655 (=> (not res!485307) (not e!405349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40950 (_ BitVec 32)) Bool)

(assert (=> b!723655 (= res!485307 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24680 0))(
  ( (Unit!24681) )
))
(declare-fun lt!320578 () Unit!24680)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40950 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24680)

(assert (=> b!723655 (= lt!320578 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723656 () Bool)

(declare-fun res!485306 () Bool)

(assert (=> b!723656 (=> (not res!485306) (not e!405344))))

(declare-fun arrayContainsKey!0 (array!40950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723656 (= res!485306 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723657 () Bool)

(declare-fun res!485309 () Bool)

(assert (=> b!723657 (=> (not res!485309) (not e!405346))))

(assert (=> b!723657 (= res!485309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!485311 () Bool)

(assert (=> start!64352 (=> (not res!485311) (not e!405344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64352 (= res!485311 (validMask!0 mask!3328))))

(assert (=> start!64352 e!405344))

(assert (=> start!64352 true))

(declare-fun array_inv!15481 (array!40950) Bool)

(assert (=> start!64352 (array_inv!15481 a!3186)))

(declare-fun b!723658 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40950 (_ BitVec 32)) SeekEntryResult!7195)

(assert (=> b!723658 (= e!405345 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19598 a!3186) j!159) a!3186 mask!3328) (Found!7195 j!159)))))

(declare-fun b!723659 () Bool)

(assert (=> b!723659 (= e!405346 e!405347)))

(declare-fun res!485310 () Bool)

(assert (=> b!723659 (=> (not res!485310) (not e!405347))))

(assert (=> b!723659 (= res!485310 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19598 a!3186) j!159) mask!3328) (select (arr!19598 a!3186) j!159) a!3186 mask!3328) lt!320575))))

(assert (=> b!723659 (= lt!320575 (Intermediate!7195 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723660 () Bool)

(declare-fun res!485303 () Bool)

(assert (=> b!723660 (=> (not res!485303) (not e!405347))))

(assert (=> b!723660 (= res!485303 e!405345)))

(declare-fun c!79545 () Bool)

(assert (=> b!723660 (= c!79545 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723661 () Bool)

(declare-fun res!485308 () Bool)

(assert (=> b!723661 (=> (not res!485308) (not e!405346))))

(declare-datatypes ((List!13639 0))(
  ( (Nil!13636) (Cons!13635 (h!14689 (_ BitVec 64)) (t!19945 List!13639)) )
))
(declare-fun arrayNoDuplicates!0 (array!40950 (_ BitVec 32) List!13639) Bool)

(assert (=> b!723661 (= res!485308 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13636))))

(declare-fun b!723662 () Bool)

(declare-fun res!485305 () Bool)

(assert (=> b!723662 (=> (not res!485305) (not e!405347))))

(assert (=> b!723662 (= res!485305 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19598 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64352 res!485311) b!723649))

(assert (= (and b!723649 res!485304) b!723651))

(assert (= (and b!723651 res!485301) b!723653))

(assert (= (and b!723653 res!485302) b!723656))

(assert (= (and b!723656 res!485306) b!723648))

(assert (= (and b!723648 res!485300) b!723657))

(assert (= (and b!723657 res!485309) b!723661))

(assert (= (and b!723661 res!485308) b!723652))

(assert (= (and b!723652 res!485313) b!723659))

(assert (= (and b!723659 res!485310) b!723662))

(assert (= (and b!723662 res!485305) b!723660))

(assert (= (and b!723660 c!79545) b!723647))

(assert (= (and b!723660 (not c!79545)) b!723658))

(assert (= (and b!723660 res!485303) b!723654))

(assert (= (and b!723654 res!485312) b!723655))

(assert (= (and b!723655 res!485307) b!723650))

(declare-fun m!677543 () Bool)

(assert (=> b!723651 m!677543))

(assert (=> b!723651 m!677543))

(declare-fun m!677545 () Bool)

(assert (=> b!723651 m!677545))

(assert (=> b!723658 m!677543))

(assert (=> b!723658 m!677543))

(declare-fun m!677547 () Bool)

(assert (=> b!723658 m!677547))

(declare-fun m!677549 () Bool)

(assert (=> b!723648 m!677549))

(declare-fun m!677551 () Bool)

(assert (=> b!723656 m!677551))

(declare-fun m!677553 () Bool)

(assert (=> b!723655 m!677553))

(declare-fun m!677555 () Bool)

(assert (=> b!723655 m!677555))

(declare-fun m!677557 () Bool)

(assert (=> b!723654 m!677557))

(declare-fun m!677559 () Bool)

(assert (=> b!723654 m!677559))

(declare-fun m!677561 () Bool)

(assert (=> b!723654 m!677561))

(assert (=> b!723654 m!677557))

(declare-fun m!677563 () Bool)

(assert (=> b!723654 m!677563))

(declare-fun m!677565 () Bool)

(assert (=> b!723654 m!677565))

(assert (=> b!723647 m!677543))

(assert (=> b!723647 m!677543))

(declare-fun m!677567 () Bool)

(assert (=> b!723647 m!677567))

(declare-fun m!677569 () Bool)

(assert (=> start!64352 m!677569))

(declare-fun m!677571 () Bool)

(assert (=> start!64352 m!677571))

(assert (=> b!723650 m!677543))

(assert (=> b!723650 m!677543))

(declare-fun m!677573 () Bool)

(assert (=> b!723650 m!677573))

(declare-fun m!677575 () Bool)

(assert (=> b!723661 m!677575))

(assert (=> b!723659 m!677543))

(assert (=> b!723659 m!677543))

(declare-fun m!677577 () Bool)

(assert (=> b!723659 m!677577))

(assert (=> b!723659 m!677577))

(assert (=> b!723659 m!677543))

(declare-fun m!677579 () Bool)

(assert (=> b!723659 m!677579))

(declare-fun m!677581 () Bool)

(assert (=> b!723662 m!677581))

(declare-fun m!677583 () Bool)

(assert (=> b!723657 m!677583))

(declare-fun m!677585 () Bool)

(assert (=> b!723653 m!677585))

(check-sat (not b!723654) (not b!723655) (not b!723648) (not b!723656) (not b!723647) (not b!723657) (not b!723653) (not b!723659) (not b!723650) (not b!723661) (not b!723658) (not b!723651) (not start!64352))
(check-sat)
