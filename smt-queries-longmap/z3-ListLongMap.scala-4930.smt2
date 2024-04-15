; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67868 () Bool)

(assert start!67868)

(declare-fun b!789341 () Bool)

(declare-fun res!534734 () Bool)

(declare-fun e!438706 () Bool)

(assert (=> b!789341 (=> (not res!534734) (not e!438706))))

(declare-datatypes ((array!42864 0))(
  ( (array!42865 (arr!20519 (Array (_ BitVec 32) (_ BitVec 64))) (size!20940 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42864)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789341 (= res!534734 (validKeyInArray!0 (select (arr!20519 a!3186) j!159)))))

(declare-fun b!789342 () Bool)

(declare-fun res!534740 () Bool)

(declare-fun e!438712 () Bool)

(assert (=> b!789342 (=> (not res!534740) (not e!438712))))

(declare-fun e!438705 () Bool)

(assert (=> b!789342 (= res!534740 e!438705)))

(declare-fun c!87713 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!789342 (= c!87713 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!789343 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8116 0))(
  ( (MissingZero!8116 (index!34832 (_ BitVec 32))) (Found!8116 (index!34833 (_ BitVec 32))) (Intermediate!8116 (undefined!8928 Bool) (index!34834 (_ BitVec 32)) (x!65780 (_ BitVec 32))) (Undefined!8116) (MissingVacant!8116 (index!34835 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42864 (_ BitVec 32)) SeekEntryResult!8116)

(assert (=> b!789343 (= e!438705 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20519 a!3186) j!159) a!3186 mask!3328) (Found!8116 j!159)))))

(declare-fun b!789344 () Bool)

(declare-fun e!438701 () Bool)

(declare-fun e!438702 () Bool)

(assert (=> b!789344 (= e!438701 e!438702)))

(declare-fun res!534737 () Bool)

(assert (=> b!789344 (=> res!534737 e!438702)))

(declare-fun lt!352092 () SeekEntryResult!8116)

(declare-fun lt!352083 () SeekEntryResult!8116)

(assert (=> b!789344 (= res!534737 (not (= lt!352092 lt!352083)))))

(assert (=> b!789344 (= lt!352092 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20519 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789346 () Bool)

(declare-fun res!534743 () Bool)

(assert (=> b!789346 (=> (not res!534743) (not e!438712))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!789346 (= res!534743 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20519 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!438704 () Bool)

(declare-fun b!789347 () Bool)

(assert (=> b!789347 (= e!438704 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20519 a!3186) j!159) a!3186 mask!3328) lt!352083))))

(declare-fun b!789348 () Bool)

(declare-fun res!534738 () Bool)

(assert (=> b!789348 (=> (not res!534738) (not e!438706))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789348 (= res!534738 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789349 () Bool)

(declare-fun e!438709 () Bool)

(assert (=> b!789349 (= e!438702 e!438709)))

(declare-fun res!534733 () Bool)

(assert (=> b!789349 (=> res!534733 e!438709)))

(declare-fun lt!352090 () (_ BitVec 64))

(declare-fun lt!352089 () (_ BitVec 64))

(assert (=> b!789349 (= res!534733 (= lt!352090 lt!352089))))

(assert (=> b!789349 (= lt!352090 (select (store (arr!20519 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!789350 () Bool)

(declare-fun e!438707 () Bool)

(assert (=> b!789350 (= e!438712 e!438707)))

(declare-fun res!534735 () Bool)

(assert (=> b!789350 (=> (not res!534735) (not e!438707))))

(declare-fun lt!352084 () SeekEntryResult!8116)

(declare-fun lt!352085 () SeekEntryResult!8116)

(assert (=> b!789350 (= res!534735 (= lt!352084 lt!352085))))

(declare-fun lt!352093 () array!42864)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42864 (_ BitVec 32)) SeekEntryResult!8116)

(assert (=> b!789350 (= lt!352085 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352089 lt!352093 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789350 (= lt!352084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352089 mask!3328) lt!352089 lt!352093 mask!3328))))

(assert (=> b!789350 (= lt!352089 (select (store (arr!20519 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!789350 (= lt!352093 (array!42865 (store (arr!20519 a!3186) i!1173 k0!2102) (size!20940 a!3186)))))

(declare-fun b!789351 () Bool)

(declare-fun e!438710 () Bool)

(assert (=> b!789351 (= e!438706 e!438710)))

(declare-fun res!534741 () Bool)

(assert (=> b!789351 (=> (not res!534741) (not e!438710))))

(declare-fun lt!352096 () SeekEntryResult!8116)

(assert (=> b!789351 (= res!534741 (or (= lt!352096 (MissingZero!8116 i!1173)) (= lt!352096 (MissingVacant!8116 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42864 (_ BitVec 32)) SeekEntryResult!8116)

(assert (=> b!789351 (= lt!352096 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!789352 () Bool)

(declare-fun res!534736 () Bool)

(assert (=> b!789352 (=> (not res!534736) (not e!438710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42864 (_ BitVec 32)) Bool)

(assert (=> b!789352 (= res!534736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789353 () Bool)

(declare-fun res!534739 () Bool)

(assert (=> b!789353 (=> (not res!534739) (not e!438710))))

(declare-datatypes ((List!14560 0))(
  ( (Nil!14557) (Cons!14556 (h!15682 (_ BitVec 64)) (t!20866 List!14560)) )
))
(declare-fun arrayNoDuplicates!0 (array!42864 (_ BitVec 32) List!14560) Bool)

(assert (=> b!789353 (= res!534739 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14557))))

(declare-fun b!789354 () Bool)

(assert (=> b!789354 (= e!438710 e!438712)))

(declare-fun res!534744 () Bool)

(assert (=> b!789354 (=> (not res!534744) (not e!438712))))

(declare-fun lt!352094 () SeekEntryResult!8116)

(assert (=> b!789354 (= res!534744 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20519 a!3186) j!159) mask!3328) (select (arr!20519 a!3186) j!159) a!3186 mask!3328) lt!352094))))

(assert (=> b!789354 (= lt!352094 (Intermediate!8116 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789355 () Bool)

(declare-datatypes ((Unit!27332 0))(
  ( (Unit!27333) )
))
(declare-fun e!438708 () Unit!27332)

(declare-fun Unit!27334 () Unit!27332)

(assert (=> b!789355 (= e!438708 Unit!27334)))

(assert (=> b!789355 false))

(declare-fun b!789356 () Bool)

(assert (=> b!789356 (= e!438705 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20519 a!3186) j!159) a!3186 mask!3328) lt!352094))))

(declare-fun b!789357 () Bool)

(declare-fun res!534745 () Bool)

(assert (=> b!789357 (=> (not res!534745) (not e!438706))))

(assert (=> b!789357 (= res!534745 (validKeyInArray!0 k0!2102))))

(declare-fun b!789358 () Bool)

(assert (=> b!789358 (= e!438707 (not e!438701))))

(declare-fun res!534750 () Bool)

(assert (=> b!789358 (=> res!534750 e!438701)))

(get-info :version)

(assert (=> b!789358 (= res!534750 (or (not ((_ is Intermediate!8116) lt!352085)) (bvslt x!1131 (x!65780 lt!352085)) (not (= x!1131 (x!65780 lt!352085))) (not (= index!1321 (index!34834 lt!352085)))))))

(assert (=> b!789358 e!438704))

(declare-fun res!534749 () Bool)

(assert (=> b!789358 (=> (not res!534749) (not e!438704))))

(declare-fun lt!352097 () SeekEntryResult!8116)

(assert (=> b!789358 (= res!534749 (= lt!352097 lt!352083))))

(assert (=> b!789358 (= lt!352083 (Found!8116 j!159))))

(assert (=> b!789358 (= lt!352097 (seekEntryOrOpen!0 (select (arr!20519 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!789358 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352088 () Unit!27332)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42864 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27332)

(assert (=> b!789358 (= lt!352088 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!534748 () Bool)

(assert (=> start!67868 (=> (not res!534748) (not e!438706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67868 (= res!534748 (validMask!0 mask!3328))))

(assert (=> start!67868 e!438706))

(assert (=> start!67868 true))

(declare-fun array_inv!16402 (array!42864) Bool)

(assert (=> start!67868 (array_inv!16402 a!3186)))

(declare-fun b!789345 () Bool)

(declare-fun res!534742 () Bool)

(assert (=> b!789345 (=> (not res!534742) (not e!438706))))

(assert (=> b!789345 (= res!534742 (and (= (size!20940 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20940 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20940 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789359 () Bool)

(declare-fun res!534747 () Bool)

(assert (=> b!789359 (=> (not res!534747) (not e!438710))))

(assert (=> b!789359 (= res!534747 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20940 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20940 a!3186))))))

(declare-fun b!789360 () Bool)

(declare-fun Unit!27335 () Unit!27332)

(assert (=> b!789360 (= e!438708 Unit!27335)))

(declare-fun b!789361 () Bool)

(declare-fun e!438703 () Bool)

(assert (=> b!789361 (= e!438709 e!438703)))

(declare-fun res!534746 () Bool)

(assert (=> b!789361 (=> res!534746 e!438703)))

(assert (=> b!789361 (= res!534746 (or (not (= (select (arr!20519 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!352086 () SeekEntryResult!8116)

(declare-fun lt!352091 () SeekEntryResult!8116)

(assert (=> b!789361 (and (= lt!352086 lt!352091) (= lt!352097 lt!352092))))

(assert (=> b!789361 (= lt!352091 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352089 lt!352093 mask!3328))))

(assert (=> b!789361 (= lt!352086 (seekEntryOrOpen!0 lt!352089 lt!352093 mask!3328))))

(assert (=> b!789361 (= lt!352090 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!352095 () Unit!27332)

(assert (=> b!789361 (= lt!352095 e!438708)))

(declare-fun c!87714 () Bool)

(assert (=> b!789361 (= c!87714 (= lt!352090 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789362 () Bool)

(assert (=> b!789362 (= e!438703 true)))

(assert (=> b!789362 (= lt!352091 lt!352092)))

(declare-fun lt!352087 () Unit!27332)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42864 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27332)

(assert (=> b!789362 (= lt!352087 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(assert (= (and start!67868 res!534748) b!789345))

(assert (= (and b!789345 res!534742) b!789341))

(assert (= (and b!789341 res!534734) b!789357))

(assert (= (and b!789357 res!534745) b!789348))

(assert (= (and b!789348 res!534738) b!789351))

(assert (= (and b!789351 res!534741) b!789352))

(assert (= (and b!789352 res!534736) b!789353))

(assert (= (and b!789353 res!534739) b!789359))

(assert (= (and b!789359 res!534747) b!789354))

(assert (= (and b!789354 res!534744) b!789346))

(assert (= (and b!789346 res!534743) b!789342))

(assert (= (and b!789342 c!87713) b!789356))

(assert (= (and b!789342 (not c!87713)) b!789343))

(assert (= (and b!789342 res!534740) b!789350))

(assert (= (and b!789350 res!534735) b!789358))

(assert (= (and b!789358 res!534749) b!789347))

(assert (= (and b!789358 (not res!534750)) b!789344))

(assert (= (and b!789344 (not res!534737)) b!789349))

(assert (= (and b!789349 (not res!534733)) b!789361))

(assert (= (and b!789361 c!87714) b!789355))

(assert (= (and b!789361 (not c!87714)) b!789360))

(assert (= (and b!789361 (not res!534746)) b!789362))

(declare-fun m!729879 () Bool)

(assert (=> b!789356 m!729879))

(assert (=> b!789356 m!729879))

(declare-fun m!729881 () Bool)

(assert (=> b!789356 m!729881))

(assert (=> b!789344 m!729879))

(assert (=> b!789344 m!729879))

(declare-fun m!729883 () Bool)

(assert (=> b!789344 m!729883))

(declare-fun m!729885 () Bool)

(assert (=> b!789349 m!729885))

(declare-fun m!729887 () Bool)

(assert (=> b!789349 m!729887))

(assert (=> b!789341 m!729879))

(assert (=> b!789341 m!729879))

(declare-fun m!729889 () Bool)

(assert (=> b!789341 m!729889))

(declare-fun m!729891 () Bool)

(assert (=> b!789357 m!729891))

(declare-fun m!729893 () Bool)

(assert (=> b!789348 m!729893))

(declare-fun m!729895 () Bool)

(assert (=> b!789346 m!729895))

(declare-fun m!729897 () Bool)

(assert (=> b!789352 m!729897))

(declare-fun m!729899 () Bool)

(assert (=> b!789350 m!729899))

(declare-fun m!729901 () Bool)

(assert (=> b!789350 m!729901))

(assert (=> b!789350 m!729899))

(assert (=> b!789350 m!729885))

(declare-fun m!729903 () Bool)

(assert (=> b!789350 m!729903))

(declare-fun m!729905 () Bool)

(assert (=> b!789350 m!729905))

(assert (=> b!789354 m!729879))

(assert (=> b!789354 m!729879))

(declare-fun m!729907 () Bool)

(assert (=> b!789354 m!729907))

(assert (=> b!789354 m!729907))

(assert (=> b!789354 m!729879))

(declare-fun m!729909 () Bool)

(assert (=> b!789354 m!729909))

(declare-fun m!729911 () Bool)

(assert (=> b!789351 m!729911))

(assert (=> b!789347 m!729879))

(assert (=> b!789347 m!729879))

(declare-fun m!729913 () Bool)

(assert (=> b!789347 m!729913))

(assert (=> b!789343 m!729879))

(assert (=> b!789343 m!729879))

(assert (=> b!789343 m!729883))

(assert (=> b!789358 m!729879))

(assert (=> b!789358 m!729879))

(declare-fun m!729915 () Bool)

(assert (=> b!789358 m!729915))

(declare-fun m!729917 () Bool)

(assert (=> b!789358 m!729917))

(declare-fun m!729919 () Bool)

(assert (=> b!789358 m!729919))

(declare-fun m!729921 () Bool)

(assert (=> b!789361 m!729921))

(declare-fun m!729923 () Bool)

(assert (=> b!789361 m!729923))

(declare-fun m!729925 () Bool)

(assert (=> b!789361 m!729925))

(declare-fun m!729927 () Bool)

(assert (=> b!789362 m!729927))

(declare-fun m!729929 () Bool)

(assert (=> b!789353 m!729929))

(declare-fun m!729931 () Bool)

(assert (=> start!67868 m!729931))

(declare-fun m!729933 () Bool)

(assert (=> start!67868 m!729933))

(check-sat (not b!789344) (not b!789362) (not b!789353) (not b!789351) (not b!789354) (not b!789352) (not b!789358) (not b!789343) (not b!789341) (not b!789348) (not b!789350) (not b!789357) (not b!789356) (not start!67868) (not b!789347) (not b!789361))
(check-sat)
