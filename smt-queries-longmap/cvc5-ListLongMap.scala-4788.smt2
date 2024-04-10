; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65788 () Bool)

(assert start!65788)

(declare-datatypes ((array!41961 0))(
  ( (array!41962 (arr!20094 (Array (_ BitVec 32) (_ BitVec 64))) (size!20515 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41961)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!421885 () Bool)

(declare-datatypes ((SeekEntryResult!7694 0))(
  ( (MissingZero!7694 (index!33144 (_ BitVec 32))) (Found!7694 (index!33145 (_ BitVec 32))) (Intermediate!7694 (undefined!8506 Bool) (index!33146 (_ BitVec 32)) (x!64044 (_ BitVec 32))) (Undefined!7694) (MissingVacant!7694 (index!33147 (_ BitVec 32))) )
))
(declare-fun lt!336873 () SeekEntryResult!7694)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!756599 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41961 (_ BitVec 32)) SeekEntryResult!7694)

(assert (=> b!756599 (= e!421885 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20094 a!3186) j!159) a!3186 mask!3328) lt!336873))))

(declare-fun b!756600 () Bool)

(declare-fun res!511581 () Bool)

(declare-fun e!421889 () Bool)

(assert (=> b!756600 (=> (not res!511581) (not e!421889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41961 (_ BitVec 32)) Bool)

(assert (=> b!756600 (= res!511581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756601 () Bool)

(declare-datatypes ((Unit!26156 0))(
  ( (Unit!26157) )
))
(declare-fun e!421879 () Unit!26156)

(declare-fun Unit!26158 () Unit!26156)

(assert (=> b!756601 (= e!421879 Unit!26158)))

(declare-fun b!756602 () Bool)

(declare-fun e!421882 () Bool)

(declare-fun e!421880 () Bool)

(assert (=> b!756602 (= e!421882 e!421880)))

(declare-fun res!511591 () Bool)

(assert (=> b!756602 (=> res!511591 e!421880)))

(declare-fun lt!336870 () (_ BitVec 64))

(declare-fun lt!336877 () (_ BitVec 64))

(assert (=> b!756602 (= res!511591 (= lt!336870 lt!336877))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!756602 (= lt!336870 (select (store (arr!20094 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!756603 () Bool)

(declare-fun res!511592 () Bool)

(declare-fun e!421886 () Bool)

(assert (=> b!756603 (=> (not res!511592) (not e!421886))))

(declare-fun lt!336876 () array!41961)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41961 (_ BitVec 32)) SeekEntryResult!7694)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41961 (_ BitVec 32)) SeekEntryResult!7694)

(assert (=> b!756603 (= res!511592 (= (seekEntryOrOpen!0 lt!336877 lt!336876 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336877 lt!336876 mask!3328)))))

(declare-fun b!756604 () Bool)

(declare-fun res!511590 () Bool)

(declare-fun e!421887 () Bool)

(assert (=> b!756604 (=> (not res!511590) (not e!421887))))

(assert (=> b!756604 (= res!511590 (and (= (size!20515 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20515 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20515 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756605 () Bool)

(declare-fun res!511579 () Bool)

(declare-fun e!421878 () Bool)

(assert (=> b!756605 (=> (not res!511579) (not e!421878))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!756605 (= res!511579 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20094 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756606 () Bool)

(assert (=> b!756606 (= e!421885 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20094 a!3186) j!159) a!3186 mask!3328) (Found!7694 j!159)))))

(declare-fun b!756607 () Bool)

(declare-fun res!511585 () Bool)

(assert (=> b!756607 (=> (not res!511585) (not e!421889))))

(declare-datatypes ((List!14096 0))(
  ( (Nil!14093) (Cons!14092 (h!15164 (_ BitVec 64)) (t!20411 List!14096)) )
))
(declare-fun arrayNoDuplicates!0 (array!41961 (_ BitVec 32) List!14096) Bool)

(assert (=> b!756607 (= res!511585 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14093))))

(declare-fun b!756608 () Bool)

(declare-fun lt!336875 () SeekEntryResult!7694)

(declare-fun lt!336872 () SeekEntryResult!7694)

(assert (=> b!756608 (= e!421886 (= lt!336875 lt!336872))))

(declare-fun b!756609 () Bool)

(declare-fun e!421883 () Bool)

(assert (=> b!756609 (= e!421883 e!421882)))

(declare-fun res!511576 () Bool)

(assert (=> b!756609 (=> res!511576 e!421882)))

(declare-fun lt!336874 () SeekEntryResult!7694)

(assert (=> b!756609 (= res!511576 (not (= lt!336872 lt!336874)))))

(assert (=> b!756609 (= lt!336872 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20094 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756610 () Bool)

(assert (=> b!756610 (= e!421889 e!421878)))

(declare-fun res!511589 () Bool)

(assert (=> b!756610 (=> (not res!511589) (not e!421878))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756610 (= res!511589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20094 a!3186) j!159) mask!3328) (select (arr!20094 a!3186) j!159) a!3186 mask!3328) lt!336873))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756610 (= lt!336873 (Intermediate!7694 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!511574 () Bool)

(assert (=> start!65788 (=> (not res!511574) (not e!421887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65788 (= res!511574 (validMask!0 mask!3328))))

(assert (=> start!65788 e!421887))

(assert (=> start!65788 true))

(declare-fun array_inv!15890 (array!41961) Bool)

(assert (=> start!65788 (array_inv!15890 a!3186)))

(declare-fun b!756611 () Bool)

(declare-fun res!511582 () Bool)

(assert (=> b!756611 (=> (not res!511582) (not e!421887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756611 (= res!511582 (validKeyInArray!0 (select (arr!20094 a!3186) j!159)))))

(declare-fun b!756612 () Bool)

(assert (=> b!756612 (= e!421887 e!421889)))

(declare-fun res!511586 () Bool)

(assert (=> b!756612 (=> (not res!511586) (not e!421889))))

(declare-fun lt!336880 () SeekEntryResult!7694)

(assert (=> b!756612 (= res!511586 (or (= lt!336880 (MissingZero!7694 i!1173)) (= lt!336880 (MissingVacant!7694 i!1173))))))

(assert (=> b!756612 (= lt!336880 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!756613 () Bool)

(declare-fun e!421888 () Bool)

(assert (=> b!756613 (= e!421878 e!421888)))

(declare-fun res!511583 () Bool)

(assert (=> b!756613 (=> (not res!511583) (not e!421888))))

(declare-fun lt!336881 () SeekEntryResult!7694)

(declare-fun lt!336878 () SeekEntryResult!7694)

(assert (=> b!756613 (= res!511583 (= lt!336881 lt!336878))))

(assert (=> b!756613 (= lt!336878 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336877 lt!336876 mask!3328))))

(assert (=> b!756613 (= lt!336881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336877 mask!3328) lt!336877 lt!336876 mask!3328))))

(assert (=> b!756613 (= lt!336877 (select (store (arr!20094 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!756613 (= lt!336876 (array!41962 (store (arr!20094 a!3186) i!1173 k!2102) (size!20515 a!3186)))))

(declare-fun e!421884 () Bool)

(declare-fun b!756614 () Bool)

(assert (=> b!756614 (= e!421884 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20094 a!3186) j!159) a!3186 mask!3328) lt!336874))))

(declare-fun b!756615 () Bool)

(assert (=> b!756615 (= e!421880 true)))

(assert (=> b!756615 e!421886))

(declare-fun res!511588 () Bool)

(assert (=> b!756615 (=> (not res!511588) (not e!421886))))

(assert (=> b!756615 (= res!511588 (= lt!336870 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336871 () Unit!26156)

(assert (=> b!756615 (= lt!336871 e!421879)))

(declare-fun c!82893 () Bool)

(assert (=> b!756615 (= c!82893 (= lt!336870 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756616 () Bool)

(declare-fun res!511584 () Bool)

(assert (=> b!756616 (=> (not res!511584) (not e!421887))))

(declare-fun arrayContainsKey!0 (array!41961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756616 (= res!511584 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756617 () Bool)

(assert (=> b!756617 (= e!421888 (not e!421883))))

(declare-fun res!511587 () Bool)

(assert (=> b!756617 (=> res!511587 e!421883)))

(assert (=> b!756617 (= res!511587 (or (not (is-Intermediate!7694 lt!336878)) (bvslt x!1131 (x!64044 lt!336878)) (not (= x!1131 (x!64044 lt!336878))) (not (= index!1321 (index!33146 lt!336878)))))))

(assert (=> b!756617 e!421884))

(declare-fun res!511578 () Bool)

(assert (=> b!756617 (=> (not res!511578) (not e!421884))))

(assert (=> b!756617 (= res!511578 (= lt!336875 lt!336874))))

(assert (=> b!756617 (= lt!336874 (Found!7694 j!159))))

(assert (=> b!756617 (= lt!336875 (seekEntryOrOpen!0 (select (arr!20094 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!756617 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336879 () Unit!26156)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41961 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26156)

(assert (=> b!756617 (= lt!336879 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756618 () Bool)

(declare-fun res!511575 () Bool)

(assert (=> b!756618 (=> (not res!511575) (not e!421878))))

(assert (=> b!756618 (= res!511575 e!421885)))

(declare-fun c!82894 () Bool)

(assert (=> b!756618 (= c!82894 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756619 () Bool)

(declare-fun Unit!26159 () Unit!26156)

(assert (=> b!756619 (= e!421879 Unit!26159)))

(assert (=> b!756619 false))

(declare-fun b!756620 () Bool)

(declare-fun res!511577 () Bool)

(assert (=> b!756620 (=> (not res!511577) (not e!421889))))

(assert (=> b!756620 (= res!511577 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20515 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20515 a!3186))))))

(declare-fun b!756621 () Bool)

(declare-fun res!511580 () Bool)

(assert (=> b!756621 (=> (not res!511580) (not e!421887))))

(assert (=> b!756621 (= res!511580 (validKeyInArray!0 k!2102))))

(assert (= (and start!65788 res!511574) b!756604))

(assert (= (and b!756604 res!511590) b!756611))

(assert (= (and b!756611 res!511582) b!756621))

(assert (= (and b!756621 res!511580) b!756616))

(assert (= (and b!756616 res!511584) b!756612))

(assert (= (and b!756612 res!511586) b!756600))

(assert (= (and b!756600 res!511581) b!756607))

(assert (= (and b!756607 res!511585) b!756620))

(assert (= (and b!756620 res!511577) b!756610))

(assert (= (and b!756610 res!511589) b!756605))

(assert (= (and b!756605 res!511579) b!756618))

(assert (= (and b!756618 c!82894) b!756599))

(assert (= (and b!756618 (not c!82894)) b!756606))

(assert (= (and b!756618 res!511575) b!756613))

(assert (= (and b!756613 res!511583) b!756617))

(assert (= (and b!756617 res!511578) b!756614))

(assert (= (and b!756617 (not res!511587)) b!756609))

(assert (= (and b!756609 (not res!511576)) b!756602))

(assert (= (and b!756602 (not res!511591)) b!756615))

(assert (= (and b!756615 c!82893) b!756619))

(assert (= (and b!756615 (not c!82893)) b!756601))

(assert (= (and b!756615 res!511588) b!756603))

(assert (= (and b!756603 res!511592) b!756608))

(declare-fun m!704515 () Bool)

(assert (=> b!756610 m!704515))

(assert (=> b!756610 m!704515))

(declare-fun m!704517 () Bool)

(assert (=> b!756610 m!704517))

(assert (=> b!756610 m!704517))

(assert (=> b!756610 m!704515))

(declare-fun m!704519 () Bool)

(assert (=> b!756610 m!704519))

(declare-fun m!704521 () Bool)

(assert (=> start!65788 m!704521))

(declare-fun m!704523 () Bool)

(assert (=> start!65788 m!704523))

(assert (=> b!756599 m!704515))

(assert (=> b!756599 m!704515))

(declare-fun m!704525 () Bool)

(assert (=> b!756599 m!704525))

(declare-fun m!704527 () Bool)

(assert (=> b!756613 m!704527))

(declare-fun m!704529 () Bool)

(assert (=> b!756613 m!704529))

(declare-fun m!704531 () Bool)

(assert (=> b!756613 m!704531))

(assert (=> b!756613 m!704527))

(declare-fun m!704533 () Bool)

(assert (=> b!756613 m!704533))

(declare-fun m!704535 () Bool)

(assert (=> b!756613 m!704535))

(assert (=> b!756602 m!704533))

(declare-fun m!704537 () Bool)

(assert (=> b!756602 m!704537))

(assert (=> b!756617 m!704515))

(assert (=> b!756617 m!704515))

(declare-fun m!704539 () Bool)

(assert (=> b!756617 m!704539))

(declare-fun m!704541 () Bool)

(assert (=> b!756617 m!704541))

(declare-fun m!704543 () Bool)

(assert (=> b!756617 m!704543))

(assert (=> b!756606 m!704515))

(assert (=> b!756606 m!704515))

(declare-fun m!704545 () Bool)

(assert (=> b!756606 m!704545))

(declare-fun m!704547 () Bool)

(assert (=> b!756605 m!704547))

(declare-fun m!704549 () Bool)

(assert (=> b!756621 m!704549))

(declare-fun m!704551 () Bool)

(assert (=> b!756612 m!704551))

(declare-fun m!704553 () Bool)

(assert (=> b!756603 m!704553))

(declare-fun m!704555 () Bool)

(assert (=> b!756603 m!704555))

(assert (=> b!756609 m!704515))

(assert (=> b!756609 m!704515))

(assert (=> b!756609 m!704545))

(assert (=> b!756614 m!704515))

(assert (=> b!756614 m!704515))

(declare-fun m!704557 () Bool)

(assert (=> b!756614 m!704557))

(declare-fun m!704559 () Bool)

(assert (=> b!756607 m!704559))

(declare-fun m!704561 () Bool)

(assert (=> b!756600 m!704561))

(declare-fun m!704563 () Bool)

(assert (=> b!756616 m!704563))

(assert (=> b!756611 m!704515))

(assert (=> b!756611 m!704515))

(declare-fun m!704565 () Bool)

(assert (=> b!756611 m!704565))

(push 1)

