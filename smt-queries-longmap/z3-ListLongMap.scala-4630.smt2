; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64542 () Bool)

(assert start!64542)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40993 0))(
  ( (array!40994 (arr!19615 (Array (_ BitVec 32) (_ BitVec 64))) (size!20035 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40993)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!725643 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!406420 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7171 0))(
  ( (MissingZero!7171 (index!31052 (_ BitVec 32))) (Found!7171 (index!31053 (_ BitVec 32))) (Intermediate!7171 (undefined!7983 Bool) (index!31054 (_ BitVec 32)) (x!62200 (_ BitVec 32))) (Undefined!7171) (MissingVacant!7171 (index!31055 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40993 (_ BitVec 32)) SeekEntryResult!7171)

(assert (=> b!725643 (= e!406420 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19615 a!3186) j!159) a!3186 mask!3328) (Found!7171 j!159)))))

(declare-fun b!725644 () Bool)

(declare-fun e!406418 () Bool)

(declare-fun e!406419 () Bool)

(assert (=> b!725644 (= e!406418 e!406419)))

(declare-fun res!486614 () Bool)

(assert (=> b!725644 (=> (not res!486614) (not e!406419))))

(declare-fun lt!321435 () SeekEntryResult!7171)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40993 (_ BitVec 32)) SeekEntryResult!7171)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725644 (= res!486614 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19615 a!3186) j!159) mask!3328) (select (arr!19615 a!3186) j!159) a!3186 mask!3328) lt!321435))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725644 (= lt!321435 (Intermediate!7171 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725645 () Bool)

(assert (=> b!725645 (= e!406420 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19615 a!3186) j!159) a!3186 mask!3328) lt!321435))))

(declare-fun b!725646 () Bool)

(declare-fun e!406421 () Bool)

(assert (=> b!725646 (= e!406421 e!406418)))

(declare-fun res!486608 () Bool)

(assert (=> b!725646 (=> (not res!486608) (not e!406418))))

(declare-fun lt!321431 () SeekEntryResult!7171)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725646 (= res!486608 (or (= lt!321431 (MissingZero!7171 i!1173)) (= lt!321431 (MissingVacant!7171 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40993 (_ BitVec 32)) SeekEntryResult!7171)

(assert (=> b!725646 (= lt!321431 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!725647 () Bool)

(declare-fun res!486618 () Bool)

(assert (=> b!725647 (=> (not res!486618) (not e!406418))))

(declare-datatypes ((List!13524 0))(
  ( (Nil!13521) (Cons!13520 (h!14580 (_ BitVec 64)) (t!19831 List!13524)) )
))
(declare-fun arrayNoDuplicates!0 (array!40993 (_ BitVec 32) List!13524) Bool)

(assert (=> b!725647 (= res!486618 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13521))))

(declare-fun b!725648 () Bool)

(declare-fun res!486620 () Bool)

(assert (=> b!725648 (=> (not res!486620) (not e!406421))))

(declare-fun arrayContainsKey!0 (array!40993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725648 (= res!486620 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!486615 () Bool)

(assert (=> start!64542 (=> (not res!486615) (not e!406421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64542 (= res!486615 (validMask!0 mask!3328))))

(assert (=> start!64542 e!406421))

(assert (=> start!64542 true))

(declare-fun array_inv!15474 (array!40993) Bool)

(assert (=> start!64542 (array_inv!15474 a!3186)))

(declare-fun b!725649 () Bool)

(declare-fun res!486610 () Bool)

(assert (=> b!725649 (=> (not res!486610) (not e!406421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725649 (= res!486610 (validKeyInArray!0 (select (arr!19615 a!3186) j!159)))))

(declare-fun b!725650 () Bool)

(declare-fun e!406423 () Bool)

(declare-fun e!406424 () Bool)

(assert (=> b!725650 (= e!406423 e!406424)))

(declare-fun res!486612 () Bool)

(assert (=> b!725650 (=> (not res!486612) (not e!406424))))

(declare-fun lt!321430 () SeekEntryResult!7171)

(assert (=> b!725650 (= res!486612 (= (seekEntryOrOpen!0 (select (arr!19615 a!3186) j!159) a!3186 mask!3328) lt!321430))))

(assert (=> b!725650 (= lt!321430 (Found!7171 j!159))))

(declare-fun b!725651 () Bool)

(declare-fun res!486617 () Bool)

(assert (=> b!725651 (=> (not res!486617) (not e!406419))))

(assert (=> b!725651 (= res!486617 e!406420)))

(declare-fun c!79892 () Bool)

(assert (=> b!725651 (= c!79892 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725652 () Bool)

(declare-fun res!486613 () Bool)

(assert (=> b!725652 (=> (not res!486613) (not e!406421))))

(assert (=> b!725652 (= res!486613 (validKeyInArray!0 k0!2102))))

(declare-fun b!725653 () Bool)

(declare-fun e!406422 () Bool)

(assert (=> b!725653 (= e!406419 e!406422)))

(declare-fun res!486609 () Bool)

(assert (=> b!725653 (=> (not res!486609) (not e!406422))))

(declare-fun lt!321433 () (_ BitVec 64))

(declare-fun lt!321432 () array!40993)

(assert (=> b!725653 (= res!486609 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321433 mask!3328) lt!321433 lt!321432 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321433 lt!321432 mask!3328)))))

(assert (=> b!725653 (= lt!321433 (select (store (arr!19615 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725653 (= lt!321432 (array!40994 (store (arr!19615 a!3186) i!1173 k0!2102) (size!20035 a!3186)))))

(declare-fun b!725654 () Bool)

(declare-fun res!486621 () Bool)

(assert (=> b!725654 (=> (not res!486621) (not e!406421))))

(assert (=> b!725654 (= res!486621 (and (= (size!20035 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20035 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20035 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725655 () Bool)

(declare-fun res!486619 () Bool)

(assert (=> b!725655 (=> (not res!486619) (not e!406418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40993 (_ BitVec 32)) Bool)

(assert (=> b!725655 (= res!486619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725656 () Bool)

(assert (=> b!725656 (= e!406424 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19615 a!3186) j!159) a!3186 mask!3328) lt!321430))))

(declare-fun b!725657 () Bool)

(assert (=> b!725657 (= e!406422 (not (bvsge mask!3328 #b00000000000000000000000000000000)))))

(assert (=> b!725657 e!406423))

(declare-fun res!486611 () Bool)

(assert (=> b!725657 (=> (not res!486611) (not e!406423))))

(assert (=> b!725657 (= res!486611 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24739 0))(
  ( (Unit!24740) )
))
(declare-fun lt!321434 () Unit!24739)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24739)

(assert (=> b!725657 (= lt!321434 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725658 () Bool)

(declare-fun res!486622 () Bool)

(assert (=> b!725658 (=> (not res!486622) (not e!406419))))

(assert (=> b!725658 (= res!486622 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19615 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725659 () Bool)

(declare-fun res!486616 () Bool)

(assert (=> b!725659 (=> (not res!486616) (not e!406418))))

(assert (=> b!725659 (= res!486616 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20035 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20035 a!3186))))))

(assert (= (and start!64542 res!486615) b!725654))

(assert (= (and b!725654 res!486621) b!725649))

(assert (= (and b!725649 res!486610) b!725652))

(assert (= (and b!725652 res!486613) b!725648))

(assert (= (and b!725648 res!486620) b!725646))

(assert (= (and b!725646 res!486608) b!725655))

(assert (= (and b!725655 res!486619) b!725647))

(assert (= (and b!725647 res!486618) b!725659))

(assert (= (and b!725659 res!486616) b!725644))

(assert (= (and b!725644 res!486614) b!725658))

(assert (= (and b!725658 res!486622) b!725651))

(assert (= (and b!725651 c!79892) b!725645))

(assert (= (and b!725651 (not c!79892)) b!725643))

(assert (= (and b!725651 res!486617) b!725653))

(assert (= (and b!725653 res!486609) b!725657))

(assert (= (and b!725657 res!486611) b!725650))

(assert (= (and b!725650 res!486612) b!725656))

(declare-fun m!680337 () Bool)

(assert (=> b!725657 m!680337))

(declare-fun m!680339 () Bool)

(assert (=> b!725657 m!680339))

(declare-fun m!680341 () Bool)

(assert (=> b!725653 m!680341))

(declare-fun m!680343 () Bool)

(assert (=> b!725653 m!680343))

(declare-fun m!680345 () Bool)

(assert (=> b!725653 m!680345))

(declare-fun m!680347 () Bool)

(assert (=> b!725653 m!680347))

(assert (=> b!725653 m!680341))

(declare-fun m!680349 () Bool)

(assert (=> b!725653 m!680349))

(declare-fun m!680351 () Bool)

(assert (=> b!725652 m!680351))

(declare-fun m!680353 () Bool)

(assert (=> b!725645 m!680353))

(assert (=> b!725645 m!680353))

(declare-fun m!680355 () Bool)

(assert (=> b!725645 m!680355))

(assert (=> b!725644 m!680353))

(assert (=> b!725644 m!680353))

(declare-fun m!680357 () Bool)

(assert (=> b!725644 m!680357))

(assert (=> b!725644 m!680357))

(assert (=> b!725644 m!680353))

(declare-fun m!680359 () Bool)

(assert (=> b!725644 m!680359))

(assert (=> b!725656 m!680353))

(assert (=> b!725656 m!680353))

(declare-fun m!680361 () Bool)

(assert (=> b!725656 m!680361))

(assert (=> b!725649 m!680353))

(assert (=> b!725649 m!680353))

(declare-fun m!680363 () Bool)

(assert (=> b!725649 m!680363))

(declare-fun m!680365 () Bool)

(assert (=> b!725658 m!680365))

(declare-fun m!680367 () Bool)

(assert (=> b!725648 m!680367))

(assert (=> b!725643 m!680353))

(assert (=> b!725643 m!680353))

(declare-fun m!680369 () Bool)

(assert (=> b!725643 m!680369))

(declare-fun m!680371 () Bool)

(assert (=> start!64542 m!680371))

(declare-fun m!680373 () Bool)

(assert (=> start!64542 m!680373))

(declare-fun m!680375 () Bool)

(assert (=> b!725655 m!680375))

(assert (=> b!725650 m!680353))

(assert (=> b!725650 m!680353))

(declare-fun m!680377 () Bool)

(assert (=> b!725650 m!680377))

(declare-fun m!680379 () Bool)

(assert (=> b!725646 m!680379))

(declare-fun m!680381 () Bool)

(assert (=> b!725647 m!680381))

(check-sat (not b!725652) (not b!725650) (not b!725656) (not b!725643) (not b!725657) (not b!725648) (not b!725647) (not b!725645) (not start!64542) (not b!725649) (not b!725646) (not b!725644) (not b!725653) (not b!725655))
(check-sat)
