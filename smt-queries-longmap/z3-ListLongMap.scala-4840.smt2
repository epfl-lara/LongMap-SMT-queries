; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66636 () Bool)

(assert start!66636)

(declare-fun b!767752 () Bool)

(declare-fun e!427520 () Bool)

(declare-fun e!427526 () Bool)

(assert (=> b!767752 (= e!427520 (not e!427526))))

(declare-fun res!519347 () Bool)

(assert (=> b!767752 (=> res!519347 e!427526)))

(declare-datatypes ((SeekEntryResult!7846 0))(
  ( (MissingZero!7846 (index!33752 (_ BitVec 32))) (Found!7846 (index!33753 (_ BitVec 32))) (Intermediate!7846 (undefined!8658 Bool) (index!33754 (_ BitVec 32)) (x!64687 (_ BitVec 32))) (Undefined!7846) (MissingVacant!7846 (index!33755 (_ BitVec 32))) )
))
(declare-fun lt!341406 () SeekEntryResult!7846)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!767752 (= res!519347 (or (not ((_ is Intermediate!7846) lt!341406)) (bvsge x!1131 (x!64687 lt!341406))))))

(declare-fun e!427523 () Bool)

(assert (=> b!767752 e!427523))

(declare-fun res!519338 () Bool)

(assert (=> b!767752 (=> (not res!519338) (not e!427523))))

(declare-datatypes ((array!42294 0))(
  ( (array!42295 (arr!20249 (Array (_ BitVec 32) (_ BitVec 64))) (size!20670 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42294)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42294 (_ BitVec 32)) Bool)

(assert (=> b!767752 (= res!519338 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26390 0))(
  ( (Unit!26391) )
))
(declare-fun lt!341407 () Unit!26390)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42294 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26390)

(assert (=> b!767752 (= lt!341407 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!767753 () Bool)

(declare-fun res!519332 () Bool)

(declare-fun e!427522 () Bool)

(assert (=> b!767753 (=> (not res!519332) (not e!427522))))

(declare-datatypes ((List!14290 0))(
  ( (Nil!14287) (Cons!14286 (h!15382 (_ BitVec 64)) (t!20596 List!14290)) )
))
(declare-fun arrayNoDuplicates!0 (array!42294 (_ BitVec 32) List!14290) Bool)

(assert (=> b!767753 (= res!519332 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14287))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!767754 () Bool)

(declare-fun e!427525 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42294 (_ BitVec 32)) SeekEntryResult!7846)

(assert (=> b!767754 (= e!427525 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20249 a!3186) j!159) a!3186 mask!3328) (Found!7846 j!159)))))

(declare-fun b!767755 () Bool)

(declare-fun lt!341411 () SeekEntryResult!7846)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42294 (_ BitVec 32)) SeekEntryResult!7846)

(assert (=> b!767755 (= e!427525 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20249 a!3186) j!159) a!3186 mask!3328) lt!341411))))

(declare-fun b!767756 () Bool)

(declare-fun e!427521 () Bool)

(assert (=> b!767756 (= e!427523 e!427521)))

(declare-fun res!519334 () Bool)

(assert (=> b!767756 (=> (not res!519334) (not e!427521))))

(declare-fun lt!341405 () SeekEntryResult!7846)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42294 (_ BitVec 32)) SeekEntryResult!7846)

(assert (=> b!767756 (= res!519334 (= (seekEntryOrOpen!0 (select (arr!20249 a!3186) j!159) a!3186 mask!3328) lt!341405))))

(assert (=> b!767756 (= lt!341405 (Found!7846 j!159))))

(declare-fun b!767757 () Bool)

(declare-fun res!519346 () Bool)

(declare-fun e!427529 () Bool)

(assert (=> b!767757 (=> (not res!519346) (not e!427529))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!767757 (= res!519346 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20249 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767758 () Bool)

(declare-fun res!519333 () Bool)

(declare-fun e!427527 () Bool)

(assert (=> b!767758 (=> (not res!519333) (not e!427527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!767758 (= res!519333 (validKeyInArray!0 (select (arr!20249 a!3186) j!159)))))

(declare-fun b!767759 () Bool)

(declare-fun res!519341 () Bool)

(assert (=> b!767759 (=> (not res!519341) (not e!427522))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!767759 (= res!519341 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20670 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20670 a!3186))))))

(declare-fun b!767760 () Bool)

(declare-fun res!519335 () Bool)

(assert (=> b!767760 (=> (not res!519335) (not e!427527))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!767760 (= res!519335 (validKeyInArray!0 k0!2102))))

(declare-fun b!767761 () Bool)

(assert (=> b!767761 (= e!427521 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20249 a!3186) j!159) a!3186 mask!3328) lt!341405))))

(declare-fun b!767762 () Bool)

(declare-fun res!519331 () Bool)

(assert (=> b!767762 (=> (not res!519331) (not e!427522))))

(assert (=> b!767762 (= res!519331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!767763 () Bool)

(assert (=> b!767763 (= e!427527 e!427522)))

(declare-fun res!519340 () Bool)

(assert (=> b!767763 (=> (not res!519340) (not e!427522))))

(declare-fun lt!341408 () SeekEntryResult!7846)

(assert (=> b!767763 (= res!519340 (or (= lt!341408 (MissingZero!7846 i!1173)) (= lt!341408 (MissingVacant!7846 i!1173))))))

(assert (=> b!767763 (= lt!341408 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!767764 () Bool)

(declare-fun res!519337 () Bool)

(assert (=> b!767764 (=> (not res!519337) (not e!427529))))

(assert (=> b!767764 (= res!519337 e!427525)))

(declare-fun c!84603 () Bool)

(assert (=> b!767764 (= c!84603 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!767765 () Bool)

(declare-fun res!519336 () Bool)

(assert (=> b!767765 (=> (not res!519336) (not e!427527))))

(declare-fun arrayContainsKey!0 (array!42294 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!767765 (= res!519336 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!767766 () Bool)

(declare-fun res!519343 () Bool)

(assert (=> b!767766 (=> (not res!519343) (not e!427527))))

(assert (=> b!767766 (= res!519343 (and (= (size!20670 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20670 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20670 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!767767 () Bool)

(assert (=> b!767767 (= e!427522 e!427529)))

(declare-fun res!519342 () Bool)

(assert (=> b!767767 (=> (not res!519342) (not e!427529))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767767 (= res!519342 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20249 a!3186) j!159) mask!3328) (select (arr!20249 a!3186) j!159) a!3186 mask!3328) lt!341411))))

(assert (=> b!767767 (= lt!341411 (Intermediate!7846 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!767768 () Bool)

(declare-fun e!427528 () Bool)

(assert (=> b!767768 (= e!427528 true)))

(declare-fun lt!341410 () SeekEntryResult!7846)

(assert (=> b!767768 (= lt!341410 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20249 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!519344 () Bool)

(assert (=> start!66636 (=> (not res!519344) (not e!427527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66636 (= res!519344 (validMask!0 mask!3328))))

(assert (=> start!66636 e!427527))

(assert (=> start!66636 true))

(declare-fun array_inv!16132 (array!42294) Bool)

(assert (=> start!66636 (array_inv!16132 a!3186)))

(declare-fun b!767769 () Bool)

(assert (=> b!767769 (= e!427526 e!427528)))

(declare-fun res!519339 () Bool)

(assert (=> b!767769 (=> res!519339 e!427528)))

(assert (=> b!767769 (= res!519339 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!341409 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767769 (= lt!341409 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!767770 () Bool)

(assert (=> b!767770 (= e!427529 e!427520)))

(declare-fun res!519345 () Bool)

(assert (=> b!767770 (=> (not res!519345) (not e!427520))))

(declare-fun lt!341404 () SeekEntryResult!7846)

(assert (=> b!767770 (= res!519345 (= lt!341404 lt!341406))))

(declare-fun lt!341403 () array!42294)

(declare-fun lt!341402 () (_ BitVec 64))

(assert (=> b!767770 (= lt!341406 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341402 lt!341403 mask!3328))))

(assert (=> b!767770 (= lt!341404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341402 mask!3328) lt!341402 lt!341403 mask!3328))))

(assert (=> b!767770 (= lt!341402 (select (store (arr!20249 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!767770 (= lt!341403 (array!42295 (store (arr!20249 a!3186) i!1173 k0!2102) (size!20670 a!3186)))))

(assert (= (and start!66636 res!519344) b!767766))

(assert (= (and b!767766 res!519343) b!767758))

(assert (= (and b!767758 res!519333) b!767760))

(assert (= (and b!767760 res!519335) b!767765))

(assert (= (and b!767765 res!519336) b!767763))

(assert (= (and b!767763 res!519340) b!767762))

(assert (= (and b!767762 res!519331) b!767753))

(assert (= (and b!767753 res!519332) b!767759))

(assert (= (and b!767759 res!519341) b!767767))

(assert (= (and b!767767 res!519342) b!767757))

(assert (= (and b!767757 res!519346) b!767764))

(assert (= (and b!767764 c!84603) b!767755))

(assert (= (and b!767764 (not c!84603)) b!767754))

(assert (= (and b!767764 res!519337) b!767770))

(assert (= (and b!767770 res!519345) b!767752))

(assert (= (and b!767752 res!519338) b!767756))

(assert (= (and b!767756 res!519334) b!767761))

(assert (= (and b!767752 (not res!519347)) b!767769))

(assert (= (and b!767769 (not res!519339)) b!767768))

(declare-fun m!712873 () Bool)

(assert (=> b!767752 m!712873))

(declare-fun m!712875 () Bool)

(assert (=> b!767752 m!712875))

(declare-fun m!712877 () Bool)

(assert (=> b!767754 m!712877))

(assert (=> b!767754 m!712877))

(declare-fun m!712879 () Bool)

(assert (=> b!767754 m!712879))

(declare-fun m!712881 () Bool)

(assert (=> b!767762 m!712881))

(assert (=> b!767767 m!712877))

(assert (=> b!767767 m!712877))

(declare-fun m!712883 () Bool)

(assert (=> b!767767 m!712883))

(assert (=> b!767767 m!712883))

(assert (=> b!767767 m!712877))

(declare-fun m!712885 () Bool)

(assert (=> b!767767 m!712885))

(assert (=> b!767761 m!712877))

(assert (=> b!767761 m!712877))

(declare-fun m!712887 () Bool)

(assert (=> b!767761 m!712887))

(assert (=> b!767758 m!712877))

(assert (=> b!767758 m!712877))

(declare-fun m!712889 () Bool)

(assert (=> b!767758 m!712889))

(declare-fun m!712891 () Bool)

(assert (=> b!767765 m!712891))

(declare-fun m!712893 () Bool)

(assert (=> b!767753 m!712893))

(declare-fun m!712895 () Bool)

(assert (=> start!66636 m!712895))

(declare-fun m!712897 () Bool)

(assert (=> start!66636 m!712897))

(declare-fun m!712899 () Bool)

(assert (=> b!767763 m!712899))

(declare-fun m!712901 () Bool)

(assert (=> b!767757 m!712901))

(declare-fun m!712903 () Bool)

(assert (=> b!767760 m!712903))

(assert (=> b!767756 m!712877))

(assert (=> b!767756 m!712877))

(declare-fun m!712905 () Bool)

(assert (=> b!767756 m!712905))

(declare-fun m!712907 () Bool)

(assert (=> b!767770 m!712907))

(declare-fun m!712909 () Bool)

(assert (=> b!767770 m!712909))

(declare-fun m!712911 () Bool)

(assert (=> b!767770 m!712911))

(declare-fun m!712913 () Bool)

(assert (=> b!767770 m!712913))

(assert (=> b!767770 m!712911))

(declare-fun m!712915 () Bool)

(assert (=> b!767770 m!712915))

(declare-fun m!712917 () Bool)

(assert (=> b!767769 m!712917))

(assert (=> b!767768 m!712877))

(assert (=> b!767768 m!712877))

(assert (=> b!767768 m!712879))

(assert (=> b!767755 m!712877))

(assert (=> b!767755 m!712877))

(declare-fun m!712919 () Bool)

(assert (=> b!767755 m!712919))

(check-sat (not b!767767) (not b!767768) (not b!767760) (not b!767758) (not b!767755) (not b!767762) (not start!66636) (not b!767770) (not b!767765) (not b!767753) (not b!767752) (not b!767763) (not b!767761) (not b!767756) (not b!767754) (not b!767769))
(check-sat)
