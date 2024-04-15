; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66794 () Bool)

(assert start!66794)

(declare-fun b!770626 () Bool)

(declare-fun res!521404 () Bool)

(declare-fun e!429024 () Bool)

(assert (=> b!770626 (=> (not res!521404) (not e!429024))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770626 (= res!521404 (validKeyInArray!0 k0!2102))))

(declare-fun b!770627 () Bool)

(declare-fun res!521402 () Bool)

(declare-fun e!429019 () Bool)

(assert (=> b!770627 (=> (not res!521402) (not e!429019))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42375 0))(
  ( (array!42376 (arr!20288 (Array (_ BitVec 32) (_ BitVec 64))) (size!20709 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42375)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770627 (= res!521402 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20288 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!770628 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7885 0))(
  ( (MissingZero!7885 (index!33908 (_ BitVec 32))) (Found!7885 (index!33909 (_ BitVec 32))) (Intermediate!7885 (undefined!8697 Bool) (index!33910 (_ BitVec 32)) (x!64843 (_ BitVec 32))) (Undefined!7885) (MissingVacant!7885 (index!33911 (_ BitVec 32))) )
))
(declare-fun lt!342897 () SeekEntryResult!7885)

(declare-fun e!429023 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42375 (_ BitVec 32)) SeekEntryResult!7885)

(assert (=> b!770628 (= e!429023 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20288 a!3186) j!159) a!3186 mask!3328) lt!342897))))

(declare-fun res!521405 () Bool)

(assert (=> start!66794 (=> (not res!521405) (not e!429024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66794 (= res!521405 (validMask!0 mask!3328))))

(assert (=> start!66794 e!429024))

(assert (=> start!66794 true))

(declare-fun array_inv!16171 (array!42375) Bool)

(assert (=> start!66794 (array_inv!16171 a!3186)))

(declare-fun b!770629 () Bool)

(declare-fun res!521400 () Bool)

(assert (=> b!770629 (=> (not res!521400) (not e!429019))))

(declare-fun e!429017 () Bool)

(assert (=> b!770629 (= res!521400 e!429017)))

(declare-fun c!85014 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!770629 (= c!85014 (bvsle x!1131 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!770630 () Bool)

(assert (=> b!770630 (= e!429017 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20288 a!3186) j!159) a!3186 mask!3328) (Found!7885 j!159)))))

(declare-fun b!770631 () Bool)

(declare-fun e!429022 () Bool)

(assert (=> b!770631 (= e!429024 e!429022)))

(declare-fun res!521392 () Bool)

(assert (=> b!770631 (=> (not res!521392) (not e!429022))))

(declare-fun lt!342898 () SeekEntryResult!7885)

(assert (=> b!770631 (= res!521392 (or (= lt!342898 (MissingZero!7885 i!1173)) (= lt!342898 (MissingVacant!7885 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42375 (_ BitVec 32)) SeekEntryResult!7885)

(assert (=> b!770631 (= lt!342898 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!770632 () Bool)

(declare-datatypes ((Unit!26534 0))(
  ( (Unit!26535) )
))
(declare-fun e!429025 () Unit!26534)

(declare-fun Unit!26536 () Unit!26534)

(assert (=> b!770632 (= e!429025 Unit!26536)))

(declare-fun lt!342896 () SeekEntryResult!7885)

(assert (=> b!770632 (= lt!342896 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20288 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!342905 () (_ BitVec 32))

(assert (=> b!770632 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342905 resIntermediateIndex!5 (select (arr!20288 a!3186) j!159) a!3186 mask!3328) (Found!7885 j!159))))

(declare-fun b!770633 () Bool)

(declare-fun e!429018 () Bool)

(declare-fun e!429016 () Bool)

(assert (=> b!770633 (= e!429018 (not e!429016))))

(declare-fun res!521396 () Bool)

(assert (=> b!770633 (=> res!521396 e!429016)))

(declare-fun lt!342902 () SeekEntryResult!7885)

(get-info :version)

(assert (=> b!770633 (= res!521396 (or (not ((_ is Intermediate!7885) lt!342902)) (bvsge x!1131 (x!64843 lt!342902))))))

(declare-fun e!429021 () Bool)

(assert (=> b!770633 e!429021))

(declare-fun res!521399 () Bool)

(assert (=> b!770633 (=> (not res!521399) (not e!429021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42375 (_ BitVec 32)) Bool)

(assert (=> b!770633 (= res!521399 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342904 () Unit!26534)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42375 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26534)

(assert (=> b!770633 (= lt!342904 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770634 () Bool)

(declare-fun res!521401 () Bool)

(assert (=> b!770634 (=> (not res!521401) (not e!429024))))

(declare-fun arrayContainsKey!0 (array!42375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770634 (= res!521401 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770635 () Bool)

(declare-fun res!521398 () Bool)

(assert (=> b!770635 (=> (not res!521398) (not e!429022))))

(assert (=> b!770635 (= res!521398 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20709 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20709 a!3186))))))

(declare-fun b!770636 () Bool)

(declare-fun res!521391 () Bool)

(assert (=> b!770636 (=> (not res!521391) (not e!429022))))

(declare-datatypes ((List!14329 0))(
  ( (Nil!14326) (Cons!14325 (h!15424 (_ BitVec 64)) (t!20635 List!14329)) )
))
(declare-fun arrayNoDuplicates!0 (array!42375 (_ BitVec 32) List!14329) Bool)

(assert (=> b!770636 (= res!521391 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14326))))

(declare-fun b!770637 () Bool)

(declare-fun Unit!26537 () Unit!26534)

(assert (=> b!770637 (= e!429025 Unit!26537)))

(declare-fun lt!342903 () SeekEntryResult!7885)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42375 (_ BitVec 32)) SeekEntryResult!7885)

(assert (=> b!770637 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342905 (select (arr!20288 a!3186) j!159) a!3186 mask!3328) lt!342903)))

(declare-fun b!770638 () Bool)

(declare-fun res!521406 () Bool)

(assert (=> b!770638 (=> (not res!521406) (not e!429022))))

(assert (=> b!770638 (= res!521406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770639 () Bool)

(assert (=> b!770639 (= e!429017 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20288 a!3186) j!159) a!3186 mask!3328) lt!342903))))

(declare-fun b!770640 () Bool)

(declare-fun res!521395 () Bool)

(assert (=> b!770640 (=> (not res!521395) (not e!429024))))

(assert (=> b!770640 (= res!521395 (validKeyInArray!0 (select (arr!20288 a!3186) j!159)))))

(declare-fun b!770641 () Bool)

(assert (=> b!770641 (= e!429019 e!429018)))

(declare-fun res!521394 () Bool)

(assert (=> b!770641 (=> (not res!521394) (not e!429018))))

(declare-fun lt!342899 () SeekEntryResult!7885)

(assert (=> b!770641 (= res!521394 (= lt!342899 lt!342902))))

(declare-fun lt!342900 () (_ BitVec 64))

(declare-fun lt!342895 () array!42375)

(assert (=> b!770641 (= lt!342902 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342900 lt!342895 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770641 (= lt!342899 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342900 mask!3328) lt!342900 lt!342895 mask!3328))))

(assert (=> b!770641 (= lt!342900 (select (store (arr!20288 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!770641 (= lt!342895 (array!42376 (store (arr!20288 a!3186) i!1173 k0!2102) (size!20709 a!3186)))))

(declare-fun b!770642 () Bool)

(declare-fun res!521397 () Bool)

(assert (=> b!770642 (=> (not res!521397) (not e!429024))))

(assert (=> b!770642 (= res!521397 (and (= (size!20709 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20709 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20709 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770643 () Bool)

(assert (=> b!770643 (= e!429022 e!429019)))

(declare-fun res!521403 () Bool)

(assert (=> b!770643 (=> (not res!521403) (not e!429019))))

(assert (=> b!770643 (= res!521403 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20288 a!3186) j!159) mask!3328) (select (arr!20288 a!3186) j!159) a!3186 mask!3328) lt!342903))))

(assert (=> b!770643 (= lt!342903 (Intermediate!7885 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770644 () Bool)

(assert (=> b!770644 (= e!429016 true)))

(declare-fun lt!342901 () Unit!26534)

(assert (=> b!770644 (= lt!342901 e!429025)))

(declare-fun c!85013 () Bool)

(assert (=> b!770644 (= c!85013 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770644 (= lt!342905 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!770645 () Bool)

(assert (=> b!770645 (= e!429021 e!429023)))

(declare-fun res!521393 () Bool)

(assert (=> b!770645 (=> (not res!521393) (not e!429023))))

(assert (=> b!770645 (= res!521393 (= (seekEntryOrOpen!0 (select (arr!20288 a!3186) j!159) a!3186 mask!3328) lt!342897))))

(assert (=> b!770645 (= lt!342897 (Found!7885 j!159))))

(assert (= (and start!66794 res!521405) b!770642))

(assert (= (and b!770642 res!521397) b!770640))

(assert (= (and b!770640 res!521395) b!770626))

(assert (= (and b!770626 res!521404) b!770634))

(assert (= (and b!770634 res!521401) b!770631))

(assert (= (and b!770631 res!521392) b!770638))

(assert (= (and b!770638 res!521406) b!770636))

(assert (= (and b!770636 res!521391) b!770635))

(assert (= (and b!770635 res!521398) b!770643))

(assert (= (and b!770643 res!521403) b!770627))

(assert (= (and b!770627 res!521402) b!770629))

(assert (= (and b!770629 c!85014) b!770639))

(assert (= (and b!770629 (not c!85014)) b!770630))

(assert (= (and b!770629 res!521400) b!770641))

(assert (= (and b!770641 res!521394) b!770633))

(assert (= (and b!770633 res!521399) b!770645))

(assert (= (and b!770645 res!521393) b!770628))

(assert (= (and b!770633 (not res!521396)) b!770644))

(assert (= (and b!770644 c!85013) b!770637))

(assert (= (and b!770644 (not c!85013)) b!770632))

(declare-fun m!715341 () Bool)

(assert (=> b!770630 m!715341))

(assert (=> b!770630 m!715341))

(declare-fun m!715343 () Bool)

(assert (=> b!770630 m!715343))

(declare-fun m!715345 () Bool)

(assert (=> b!770626 m!715345))

(declare-fun m!715347 () Bool)

(assert (=> b!770641 m!715347))

(declare-fun m!715349 () Bool)

(assert (=> b!770641 m!715349))

(declare-fun m!715351 () Bool)

(assert (=> b!770641 m!715351))

(declare-fun m!715353 () Bool)

(assert (=> b!770641 m!715353))

(assert (=> b!770641 m!715347))

(declare-fun m!715355 () Bool)

(assert (=> b!770641 m!715355))

(declare-fun m!715357 () Bool)

(assert (=> b!770644 m!715357))

(declare-fun m!715359 () Bool)

(assert (=> b!770633 m!715359))

(declare-fun m!715361 () Bool)

(assert (=> b!770633 m!715361))

(assert (=> b!770645 m!715341))

(assert (=> b!770645 m!715341))

(declare-fun m!715363 () Bool)

(assert (=> b!770645 m!715363))

(declare-fun m!715365 () Bool)

(assert (=> b!770634 m!715365))

(declare-fun m!715367 () Bool)

(assert (=> b!770627 m!715367))

(assert (=> b!770643 m!715341))

(assert (=> b!770643 m!715341))

(declare-fun m!715369 () Bool)

(assert (=> b!770643 m!715369))

(assert (=> b!770643 m!715369))

(assert (=> b!770643 m!715341))

(declare-fun m!715371 () Bool)

(assert (=> b!770643 m!715371))

(declare-fun m!715373 () Bool)

(assert (=> start!66794 m!715373))

(declare-fun m!715375 () Bool)

(assert (=> start!66794 m!715375))

(assert (=> b!770639 m!715341))

(assert (=> b!770639 m!715341))

(declare-fun m!715377 () Bool)

(assert (=> b!770639 m!715377))

(assert (=> b!770628 m!715341))

(assert (=> b!770628 m!715341))

(declare-fun m!715379 () Bool)

(assert (=> b!770628 m!715379))

(assert (=> b!770632 m!715341))

(assert (=> b!770632 m!715341))

(assert (=> b!770632 m!715343))

(assert (=> b!770632 m!715341))

(declare-fun m!715381 () Bool)

(assert (=> b!770632 m!715381))

(declare-fun m!715383 () Bool)

(assert (=> b!770638 m!715383))

(assert (=> b!770640 m!715341))

(assert (=> b!770640 m!715341))

(declare-fun m!715385 () Bool)

(assert (=> b!770640 m!715385))

(declare-fun m!715387 () Bool)

(assert (=> b!770636 m!715387))

(declare-fun m!715389 () Bool)

(assert (=> b!770631 m!715389))

(assert (=> b!770637 m!715341))

(assert (=> b!770637 m!715341))

(declare-fun m!715391 () Bool)

(assert (=> b!770637 m!715391))

(check-sat (not b!770626) (not b!770636) (not b!770644) (not b!770643) (not b!770631) (not b!770638) (not b!770630) (not start!66794) (not b!770628) (not b!770637) (not b!770632) (not b!770640) (not b!770633) (not b!770645) (not b!770634) (not b!770639) (not b!770641))
(check-sat)
