; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65762 () Bool)

(assert start!65762)

(declare-fun b!755702 () Bool)

(declare-fun e!421417 () Bool)

(declare-fun e!421419 () Bool)

(assert (=> b!755702 (= e!421417 e!421419)))

(declare-fun res!510842 () Bool)

(assert (=> b!755702 (=> (not res!510842) (not e!421419))))

(declare-datatypes ((SeekEntryResult!7681 0))(
  ( (MissingZero!7681 (index!33092 (_ BitVec 32))) (Found!7681 (index!33093 (_ BitVec 32))) (Intermediate!7681 (undefined!8493 Bool) (index!33094 (_ BitVec 32)) (x!63991 (_ BitVec 32))) (Undefined!7681) (MissingVacant!7681 (index!33095 (_ BitVec 32))) )
))
(declare-fun lt!336402 () SeekEntryResult!7681)

(declare-fun lt!336407 () SeekEntryResult!7681)

(assert (=> b!755702 (= res!510842 (= lt!336402 lt!336407))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!336403 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41935 0))(
  ( (array!41936 (arr!20081 (Array (_ BitVec 32) (_ BitVec 64))) (size!20502 (_ BitVec 32))) )
))
(declare-fun lt!336404 () array!41935)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41935 (_ BitVec 32)) SeekEntryResult!7681)

(assert (=> b!755702 (= lt!336407 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336403 lt!336404 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755702 (= lt!336402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336403 mask!3328) lt!336403 lt!336404 mask!3328))))

(declare-fun a!3186 () array!41935)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!755702 (= lt!336403 (select (store (arr!20081 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!755702 (= lt!336404 (array!41936 (store (arr!20081 a!3186) i!1173 k!2102) (size!20502 a!3186)))))

(declare-fun b!755703 () Bool)

(declare-fun res!510848 () Bool)

(declare-fun e!421415 () Bool)

(assert (=> b!755703 (=> (not res!510848) (not e!421415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755703 (= res!510848 (validKeyInArray!0 (select (arr!20081 a!3186) j!159)))))

(declare-fun b!755704 () Bool)

(declare-fun res!510834 () Bool)

(assert (=> b!755704 (=> (not res!510834) (not e!421415))))

(assert (=> b!755704 (= res!510834 (and (= (size!20502 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20502 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20502 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755705 () Bool)

(declare-fun e!421418 () Bool)

(assert (=> b!755705 (= e!421419 (not e!421418))))

(declare-fun res!510851 () Bool)

(assert (=> b!755705 (=> res!510851 e!421418)))

(assert (=> b!755705 (= res!510851 (or (not (is-Intermediate!7681 lt!336407)) (bvslt x!1131 (x!63991 lt!336407)) (not (= x!1131 (x!63991 lt!336407))) (not (= index!1321 (index!33094 lt!336407)))))))

(declare-fun e!421416 () Bool)

(assert (=> b!755705 e!421416))

(declare-fun res!510836 () Bool)

(assert (=> b!755705 (=> (not res!510836) (not e!421416))))

(declare-fun lt!336406 () SeekEntryResult!7681)

(declare-fun lt!336412 () SeekEntryResult!7681)

(assert (=> b!755705 (= res!510836 (= lt!336406 lt!336412))))

(assert (=> b!755705 (= lt!336412 (Found!7681 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41935 (_ BitVec 32)) SeekEntryResult!7681)

(assert (=> b!755705 (= lt!336406 (seekEntryOrOpen!0 (select (arr!20081 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41935 (_ BitVec 32)) Bool)

(assert (=> b!755705 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26104 0))(
  ( (Unit!26105) )
))
(declare-fun lt!336408 () Unit!26104)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41935 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26104)

(assert (=> b!755705 (= lt!336408 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!510837 () Bool)

(assert (=> start!65762 (=> (not res!510837) (not e!421415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65762 (= res!510837 (validMask!0 mask!3328))))

(assert (=> start!65762 e!421415))

(assert (=> start!65762 true))

(declare-fun array_inv!15877 (array!41935) Bool)

(assert (=> start!65762 (array_inv!15877 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!755706 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41935 (_ BitVec 32)) SeekEntryResult!7681)

(assert (=> b!755706 (= e!421416 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20081 a!3186) j!159) a!3186 mask!3328) lt!336412))))

(declare-fun b!755707 () Bool)

(declare-fun e!421410 () Bool)

(assert (=> b!755707 (= e!421418 e!421410)))

(declare-fun res!510846 () Bool)

(assert (=> b!755707 (=> res!510846 e!421410)))

(declare-fun lt!336405 () SeekEntryResult!7681)

(assert (=> b!755707 (= res!510846 (not (= lt!336405 lt!336412)))))

(assert (=> b!755707 (= lt!336405 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20081 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755708 () Bool)

(declare-fun e!421413 () Unit!26104)

(declare-fun Unit!26106 () Unit!26104)

(assert (=> b!755708 (= e!421413 Unit!26106)))

(declare-fun b!755709 () Bool)

(declare-fun e!421414 () Bool)

(assert (=> b!755709 (= e!421414 e!421417)))

(declare-fun res!510847 () Bool)

(assert (=> b!755709 (=> (not res!510847) (not e!421417))))

(declare-fun lt!336411 () SeekEntryResult!7681)

(assert (=> b!755709 (= res!510847 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20081 a!3186) j!159) mask!3328) (select (arr!20081 a!3186) j!159) a!3186 mask!3328) lt!336411))))

(assert (=> b!755709 (= lt!336411 (Intermediate!7681 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755710 () Bool)

(declare-fun e!421420 () Bool)

(assert (=> b!755710 (= e!421410 e!421420)))

(declare-fun res!510850 () Bool)

(assert (=> b!755710 (=> res!510850 e!421420)))

(declare-fun lt!336413 () (_ BitVec 64))

(assert (=> b!755710 (= res!510850 (= lt!336413 lt!336403))))

(assert (=> b!755710 (= lt!336413 (select (store (arr!20081 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!755711 () Bool)

(assert (=> b!755711 (= e!421415 e!421414)))

(declare-fun res!510838 () Bool)

(assert (=> b!755711 (=> (not res!510838) (not e!421414))))

(declare-fun lt!336410 () SeekEntryResult!7681)

(assert (=> b!755711 (= res!510838 (or (= lt!336410 (MissingZero!7681 i!1173)) (= lt!336410 (MissingVacant!7681 i!1173))))))

(assert (=> b!755711 (= lt!336410 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!755712 () Bool)

(declare-fun res!510840 () Bool)

(assert (=> b!755712 (=> (not res!510840) (not e!421414))))

(assert (=> b!755712 (= res!510840 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20502 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20502 a!3186))))))

(declare-fun b!755713 () Bool)

(declare-fun res!510835 () Bool)

(assert (=> b!755713 (=> (not res!510835) (not e!421414))))

(declare-datatypes ((List!14083 0))(
  ( (Nil!14080) (Cons!14079 (h!15151 (_ BitVec 64)) (t!20398 List!14083)) )
))
(declare-fun arrayNoDuplicates!0 (array!41935 (_ BitVec 32) List!14083) Bool)

(assert (=> b!755713 (= res!510835 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14080))))

(declare-fun e!421412 () Bool)

(declare-fun b!755714 () Bool)

(assert (=> b!755714 (= e!421412 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20081 a!3186) j!159) a!3186 mask!3328) (Found!7681 j!159)))))

(declare-fun b!755715 () Bool)

(declare-fun res!510849 () Bool)

(assert (=> b!755715 (=> (not res!510849) (not e!421415))))

(declare-fun arrayContainsKey!0 (array!41935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755715 (= res!510849 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755716 () Bool)

(declare-fun res!510845 () Bool)

(assert (=> b!755716 (=> (not res!510845) (not e!421414))))

(assert (=> b!755716 (= res!510845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755717 () Bool)

(assert (=> b!755717 (= e!421420 true)))

(declare-fun e!421411 () Bool)

(assert (=> b!755717 e!421411))

(declare-fun res!510843 () Bool)

(assert (=> b!755717 (=> (not res!510843) (not e!421411))))

(assert (=> b!755717 (= res!510843 (= lt!336413 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336409 () Unit!26104)

(assert (=> b!755717 (= lt!336409 e!421413)))

(declare-fun c!82815 () Bool)

(assert (=> b!755717 (= c!82815 (= lt!336413 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755718 () Bool)

(assert (=> b!755718 (= e!421411 (= lt!336406 lt!336405))))

(declare-fun b!755719 () Bool)

(declare-fun Unit!26107 () Unit!26104)

(assert (=> b!755719 (= e!421413 Unit!26107)))

(assert (=> b!755719 false))

(declare-fun b!755720 () Bool)

(declare-fun res!510839 () Bool)

(assert (=> b!755720 (=> (not res!510839) (not e!421415))))

(assert (=> b!755720 (= res!510839 (validKeyInArray!0 k!2102))))

(declare-fun b!755721 () Bool)

(declare-fun res!510833 () Bool)

(assert (=> b!755721 (=> (not res!510833) (not e!421411))))

(assert (=> b!755721 (= res!510833 (= (seekEntryOrOpen!0 lt!336403 lt!336404 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336403 lt!336404 mask!3328)))))

(declare-fun b!755722 () Bool)

(declare-fun res!510841 () Bool)

(assert (=> b!755722 (=> (not res!510841) (not e!421417))))

(assert (=> b!755722 (= res!510841 e!421412)))

(declare-fun c!82816 () Bool)

(assert (=> b!755722 (= c!82816 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755723 () Bool)

(declare-fun res!510844 () Bool)

(assert (=> b!755723 (=> (not res!510844) (not e!421417))))

(assert (=> b!755723 (= res!510844 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20081 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755724 () Bool)

(assert (=> b!755724 (= e!421412 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20081 a!3186) j!159) a!3186 mask!3328) lt!336411))))

(assert (= (and start!65762 res!510837) b!755704))

(assert (= (and b!755704 res!510834) b!755703))

(assert (= (and b!755703 res!510848) b!755720))

(assert (= (and b!755720 res!510839) b!755715))

(assert (= (and b!755715 res!510849) b!755711))

(assert (= (and b!755711 res!510838) b!755716))

(assert (= (and b!755716 res!510845) b!755713))

(assert (= (and b!755713 res!510835) b!755712))

(assert (= (and b!755712 res!510840) b!755709))

(assert (= (and b!755709 res!510847) b!755723))

(assert (= (and b!755723 res!510844) b!755722))

(assert (= (and b!755722 c!82816) b!755724))

(assert (= (and b!755722 (not c!82816)) b!755714))

(assert (= (and b!755722 res!510841) b!755702))

(assert (= (and b!755702 res!510842) b!755705))

(assert (= (and b!755705 res!510836) b!755706))

(assert (= (and b!755705 (not res!510851)) b!755707))

(assert (= (and b!755707 (not res!510846)) b!755710))

(assert (= (and b!755710 (not res!510850)) b!755717))

(assert (= (and b!755717 c!82815) b!755719))

(assert (= (and b!755717 (not c!82815)) b!755708))

(assert (= (and b!755717 res!510843) b!755721))

(assert (= (and b!755721 res!510833) b!755718))

(declare-fun m!703839 () Bool)

(assert (=> start!65762 m!703839))

(declare-fun m!703841 () Bool)

(assert (=> start!65762 m!703841))

(declare-fun m!703843 () Bool)

(assert (=> b!755723 m!703843))

(declare-fun m!703845 () Bool)

(assert (=> b!755724 m!703845))

(assert (=> b!755724 m!703845))

(declare-fun m!703847 () Bool)

(assert (=> b!755724 m!703847))

(assert (=> b!755707 m!703845))

(assert (=> b!755707 m!703845))

(declare-fun m!703849 () Bool)

(assert (=> b!755707 m!703849))

(declare-fun m!703851 () Bool)

(assert (=> b!755716 m!703851))

(assert (=> b!755706 m!703845))

(assert (=> b!755706 m!703845))

(declare-fun m!703853 () Bool)

(assert (=> b!755706 m!703853))

(assert (=> b!755709 m!703845))

(assert (=> b!755709 m!703845))

(declare-fun m!703855 () Bool)

(assert (=> b!755709 m!703855))

(assert (=> b!755709 m!703855))

(assert (=> b!755709 m!703845))

(declare-fun m!703857 () Bool)

(assert (=> b!755709 m!703857))

(declare-fun m!703859 () Bool)

(assert (=> b!755710 m!703859))

(declare-fun m!703861 () Bool)

(assert (=> b!755710 m!703861))

(declare-fun m!703863 () Bool)

(assert (=> b!755713 m!703863))

(assert (=> b!755705 m!703845))

(assert (=> b!755705 m!703845))

(declare-fun m!703865 () Bool)

(assert (=> b!755705 m!703865))

(declare-fun m!703867 () Bool)

(assert (=> b!755705 m!703867))

(declare-fun m!703869 () Bool)

(assert (=> b!755705 m!703869))

(declare-fun m!703871 () Bool)

(assert (=> b!755702 m!703871))

(declare-fun m!703873 () Bool)

(assert (=> b!755702 m!703873))

(declare-fun m!703875 () Bool)

(assert (=> b!755702 m!703875))

(assert (=> b!755702 m!703859))

(assert (=> b!755702 m!703873))

(declare-fun m!703877 () Bool)

(assert (=> b!755702 m!703877))

(declare-fun m!703879 () Bool)

(assert (=> b!755715 m!703879))

(assert (=> b!755703 m!703845))

(assert (=> b!755703 m!703845))

(declare-fun m!703881 () Bool)

(assert (=> b!755703 m!703881))

(declare-fun m!703883 () Bool)

(assert (=> b!755711 m!703883))

(declare-fun m!703885 () Bool)

(assert (=> b!755720 m!703885))

(assert (=> b!755714 m!703845))

(assert (=> b!755714 m!703845))

(assert (=> b!755714 m!703849))

(declare-fun m!703887 () Bool)

(assert (=> b!755721 m!703887))

(declare-fun m!703889 () Bool)

(assert (=> b!755721 m!703889))

(push 1)

