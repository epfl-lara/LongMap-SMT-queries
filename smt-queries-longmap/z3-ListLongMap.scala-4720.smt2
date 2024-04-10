; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65382 () Bool)

(assert start!65382)

(declare-fun b!743737 () Bool)

(declare-fun e!415513 () Bool)

(declare-fun e!415512 () Bool)

(assert (=> b!743737 (= e!415513 (not e!415512))))

(declare-fun res!500803 () Bool)

(assert (=> b!743737 (=> res!500803 e!415512)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7491 0))(
  ( (MissingZero!7491 (index!32332 (_ BitVec 32))) (Found!7491 (index!32333 (_ BitVec 32))) (Intermediate!7491 (undefined!8303 Bool) (index!32334 (_ BitVec 32)) (x!63297 (_ BitVec 32))) (Undefined!7491) (MissingVacant!7491 (index!32335 (_ BitVec 32))) )
))
(declare-fun lt!330382 () SeekEntryResult!7491)

(get-info :version)

(assert (=> b!743737 (= res!500803 (or (not ((_ is Intermediate!7491) lt!330382)) (bvslt x!1131 (x!63297 lt!330382)) (not (= x!1131 (x!63297 lt!330382))) (not (= index!1321 (index!32334 lt!330382)))))))

(declare-fun e!415510 () Bool)

(assert (=> b!743737 e!415510))

(declare-fun res!500807 () Bool)

(assert (=> b!743737 (=> (not res!500807) (not e!415510))))

(declare-datatypes ((array!41555 0))(
  ( (array!41556 (arr!19891 (Array (_ BitVec 32) (_ BitVec 64))) (size!20312 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41555)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41555 (_ BitVec 32)) Bool)

(assert (=> b!743737 (= res!500807 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25462 0))(
  ( (Unit!25463) )
))
(declare-fun lt!330379 () Unit!25462)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41555 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25462)

(assert (=> b!743737 (= lt!330379 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!415516 () Bool)

(declare-fun b!743738 () Bool)

(declare-fun lt!330375 () SeekEntryResult!7491)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41555 (_ BitVec 32)) SeekEntryResult!7491)

(assert (=> b!743738 (= e!415516 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19891 a!3186) j!159) a!3186 mask!3328) lt!330375))))

(declare-fun b!743739 () Bool)

(declare-fun e!415514 () Bool)

(declare-fun e!415517 () Bool)

(assert (=> b!743739 (= e!415514 e!415517)))

(declare-fun res!500808 () Bool)

(assert (=> b!743739 (=> (not res!500808) (not e!415517))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743739 (= res!500808 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19891 a!3186) j!159) mask!3328) (select (arr!19891 a!3186) j!159) a!3186 mask!3328) lt!330375))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743739 (= lt!330375 (Intermediate!7491 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743740 () Bool)

(declare-fun res!500806 () Bool)

(assert (=> b!743740 (=> (not res!500806) (not e!415514))))

(assert (=> b!743740 (= res!500806 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20312 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20312 a!3186))))))

(declare-fun b!743741 () Bool)

(assert (=> b!743741 (= e!415517 e!415513)))

(declare-fun res!500813 () Bool)

(assert (=> b!743741 (=> (not res!500813) (not e!415513))))

(declare-fun lt!330378 () SeekEntryResult!7491)

(assert (=> b!743741 (= res!500813 (= lt!330378 lt!330382))))

(declare-fun lt!330381 () (_ BitVec 64))

(declare-fun lt!330383 () array!41555)

(assert (=> b!743741 (= lt!330382 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330381 lt!330383 mask!3328))))

(assert (=> b!743741 (= lt!330378 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330381 mask!3328) lt!330381 lt!330383 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!743741 (= lt!330381 (select (store (arr!19891 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743741 (= lt!330383 (array!41556 (store (arr!19891 a!3186) i!1173 k0!2102) (size!20312 a!3186)))))

(declare-fun b!743742 () Bool)

(declare-fun res!500804 () Bool)

(assert (=> b!743742 (=> (not res!500804) (not e!415514))))

(assert (=> b!743742 (= res!500804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743743 () Bool)

(declare-fun res!500801 () Bool)

(assert (=> b!743743 (=> (not res!500801) (not e!415517))))

(assert (=> b!743743 (= res!500801 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19891 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!330377 () SeekEntryResult!7491)

(declare-fun b!743744 () Bool)

(declare-fun e!415515 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41555 (_ BitVec 32)) SeekEntryResult!7491)

(assert (=> b!743744 (= e!415515 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19891 a!3186) j!159) a!3186 mask!3328) lt!330377))))

(declare-fun b!743745 () Bool)

(assert (=> b!743745 (= e!415510 e!415515)))

(declare-fun res!500802 () Bool)

(assert (=> b!743745 (=> (not res!500802) (not e!415515))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41555 (_ BitVec 32)) SeekEntryResult!7491)

(assert (=> b!743745 (= res!500802 (= (seekEntryOrOpen!0 (select (arr!19891 a!3186) j!159) a!3186 mask!3328) lt!330377))))

(assert (=> b!743745 (= lt!330377 (Found!7491 j!159))))

(declare-fun res!500800 () Bool)

(declare-fun e!415511 () Bool)

(assert (=> start!65382 (=> (not res!500800) (not e!415511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65382 (= res!500800 (validMask!0 mask!3328))))

(assert (=> start!65382 e!415511))

(assert (=> start!65382 true))

(declare-fun array_inv!15687 (array!41555) Bool)

(assert (=> start!65382 (array_inv!15687 a!3186)))

(declare-fun b!743746 () Bool)

(declare-fun res!500811 () Bool)

(assert (=> b!743746 (=> (not res!500811) (not e!415511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743746 (= res!500811 (validKeyInArray!0 k0!2102))))

(declare-fun b!743747 () Bool)

(declare-fun res!500809 () Bool)

(assert (=> b!743747 (=> (not res!500809) (not e!415511))))

(assert (=> b!743747 (= res!500809 (validKeyInArray!0 (select (arr!19891 a!3186) j!159)))))

(declare-fun b!743748 () Bool)

(assert (=> b!743748 (= e!415516 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19891 a!3186) j!159) a!3186 mask!3328) (Found!7491 j!159)))))

(declare-fun b!743749 () Bool)

(declare-fun res!500810 () Bool)

(assert (=> b!743749 (=> (not res!500810) (not e!415517))))

(assert (=> b!743749 (= res!500810 e!415516)))

(declare-fun c!81850 () Bool)

(assert (=> b!743749 (= c!81850 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743750 () Bool)

(assert (=> b!743750 (= e!415511 e!415514)))

(declare-fun res!500799 () Bool)

(assert (=> b!743750 (=> (not res!500799) (not e!415514))))

(declare-fun lt!330376 () SeekEntryResult!7491)

(assert (=> b!743750 (= res!500799 (or (= lt!330376 (MissingZero!7491 i!1173)) (= lt!330376 (MissingVacant!7491 i!1173))))))

(assert (=> b!743750 (= lt!330376 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!743751 () Bool)

(declare-fun res!500798 () Bool)

(assert (=> b!743751 (=> (not res!500798) (not e!415511))))

(assert (=> b!743751 (= res!500798 (and (= (size!20312 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20312 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20312 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743752 () Bool)

(declare-fun res!500812 () Bool)

(assert (=> b!743752 (=> (not res!500812) (not e!415514))))

(declare-datatypes ((List!13893 0))(
  ( (Nil!13890) (Cons!13889 (h!14961 (_ BitVec 64)) (t!20208 List!13893)) )
))
(declare-fun arrayNoDuplicates!0 (array!41555 (_ BitVec 32) List!13893) Bool)

(assert (=> b!743752 (= res!500812 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13890))))

(declare-fun b!743753 () Bool)

(assert (=> b!743753 (= e!415512 true)))

(declare-fun lt!330380 () SeekEntryResult!7491)

(assert (=> b!743753 (= lt!330380 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19891 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!743754 () Bool)

(declare-fun res!500805 () Bool)

(assert (=> b!743754 (=> (not res!500805) (not e!415511))))

(declare-fun arrayContainsKey!0 (array!41555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743754 (= res!500805 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65382 res!500800) b!743751))

(assert (= (and b!743751 res!500798) b!743747))

(assert (= (and b!743747 res!500809) b!743746))

(assert (= (and b!743746 res!500811) b!743754))

(assert (= (and b!743754 res!500805) b!743750))

(assert (= (and b!743750 res!500799) b!743742))

(assert (= (and b!743742 res!500804) b!743752))

(assert (= (and b!743752 res!500812) b!743740))

(assert (= (and b!743740 res!500806) b!743739))

(assert (= (and b!743739 res!500808) b!743743))

(assert (= (and b!743743 res!500801) b!743749))

(assert (= (and b!743749 c!81850) b!743738))

(assert (= (and b!743749 (not c!81850)) b!743748))

(assert (= (and b!743749 res!500810) b!743741))

(assert (= (and b!743741 res!500813) b!743737))

(assert (= (and b!743737 res!500807) b!743745))

(assert (= (and b!743745 res!500802) b!743744))

(assert (= (and b!743737 (not res!500803)) b!743753))

(declare-fun m!694373 () Bool)

(assert (=> b!743747 m!694373))

(assert (=> b!743747 m!694373))

(declare-fun m!694375 () Bool)

(assert (=> b!743747 m!694375))

(assert (=> b!743739 m!694373))

(assert (=> b!743739 m!694373))

(declare-fun m!694377 () Bool)

(assert (=> b!743739 m!694377))

(assert (=> b!743739 m!694377))

(assert (=> b!743739 m!694373))

(declare-fun m!694379 () Bool)

(assert (=> b!743739 m!694379))

(declare-fun m!694381 () Bool)

(assert (=> b!743750 m!694381))

(declare-fun m!694383 () Bool)

(assert (=> b!743741 m!694383))

(declare-fun m!694385 () Bool)

(assert (=> b!743741 m!694385))

(declare-fun m!694387 () Bool)

(assert (=> b!743741 m!694387))

(declare-fun m!694389 () Bool)

(assert (=> b!743741 m!694389))

(assert (=> b!743741 m!694383))

(declare-fun m!694391 () Bool)

(assert (=> b!743741 m!694391))

(assert (=> b!743738 m!694373))

(assert (=> b!743738 m!694373))

(declare-fun m!694393 () Bool)

(assert (=> b!743738 m!694393))

(declare-fun m!694395 () Bool)

(assert (=> b!743746 m!694395))

(assert (=> b!743745 m!694373))

(assert (=> b!743745 m!694373))

(declare-fun m!694397 () Bool)

(assert (=> b!743745 m!694397))

(declare-fun m!694399 () Bool)

(assert (=> b!743742 m!694399))

(declare-fun m!694401 () Bool)

(assert (=> start!65382 m!694401))

(declare-fun m!694403 () Bool)

(assert (=> start!65382 m!694403))

(declare-fun m!694405 () Bool)

(assert (=> b!743737 m!694405))

(declare-fun m!694407 () Bool)

(assert (=> b!743737 m!694407))

(assert (=> b!743744 m!694373))

(assert (=> b!743744 m!694373))

(declare-fun m!694409 () Bool)

(assert (=> b!743744 m!694409))

(assert (=> b!743753 m!694373))

(assert (=> b!743753 m!694373))

(declare-fun m!694411 () Bool)

(assert (=> b!743753 m!694411))

(declare-fun m!694413 () Bool)

(assert (=> b!743752 m!694413))

(declare-fun m!694415 () Bool)

(assert (=> b!743743 m!694415))

(declare-fun m!694417 () Bool)

(assert (=> b!743754 m!694417))

(assert (=> b!743748 m!694373))

(assert (=> b!743748 m!694373))

(assert (=> b!743748 m!694411))

(check-sat (not b!743741) (not b!743746) (not b!743739) (not b!743747) (not b!743754) (not b!743753) (not b!743745) (not b!743738) (not b!743742) (not start!65382) (not b!743737) (not b!743744) (not b!743752) (not b!743750) (not b!743748))
(check-sat)
