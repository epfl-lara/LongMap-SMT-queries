; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65486 () Bool)

(assert start!65486)

(declare-fun b!746904 () Bool)

(declare-fun res!503721 () Bool)

(declare-fun e!417029 () Bool)

(assert (=> b!746904 (=> (not res!503721) (not e!417029))))

(declare-datatypes ((array!41676 0))(
  ( (array!41677 (arr!19952 (Array (_ BitVec 32) (_ BitVec 64))) (size!20373 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41676)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41676 (_ BitVec 32)) Bool)

(assert (=> b!746904 (= res!503721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746905 () Bool)

(declare-fun res!503725 () Bool)

(assert (=> b!746905 (=> (not res!503725) (not e!417029))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746905 (= res!503725 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20373 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20373 a!3186))))))

(declare-fun b!746906 () Bool)

(declare-fun res!503724 () Bool)

(declare-fun e!417037 () Bool)

(assert (=> b!746906 (=> (not res!503724) (not e!417037))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746906 (= res!503724 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746907 () Bool)

(assert (=> b!746907 (= e!417037 e!417029)))

(declare-fun res!503719 () Bool)

(assert (=> b!746907 (=> (not res!503719) (not e!417029))))

(declare-datatypes ((SeekEntryResult!7549 0))(
  ( (MissingZero!7549 (index!32564 (_ BitVec 32))) (Found!7549 (index!32565 (_ BitVec 32))) (Intermediate!7549 (undefined!8361 Bool) (index!32566 (_ BitVec 32)) (x!63518 (_ BitVec 32))) (Undefined!7549) (MissingVacant!7549 (index!32567 (_ BitVec 32))) )
))
(declare-fun lt!331865 () SeekEntryResult!7549)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746907 (= res!503719 (or (= lt!331865 (MissingZero!7549 i!1173)) (= lt!331865 (MissingVacant!7549 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41676 (_ BitVec 32)) SeekEntryResult!7549)

(assert (=> b!746907 (= lt!331865 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!503723 () Bool)

(assert (=> start!65486 (=> (not res!503723) (not e!417037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65486 (= res!503723 (validMask!0 mask!3328))))

(assert (=> start!65486 e!417037))

(assert (=> start!65486 true))

(declare-fun array_inv!15835 (array!41676) Bool)

(assert (=> start!65486 (array_inv!15835 a!3186)))

(declare-fun b!746908 () Bool)

(declare-fun res!503713 () Bool)

(declare-fun e!417033 () Bool)

(assert (=> b!746908 (=> (not res!503713) (not e!417033))))

(declare-fun e!417031 () Bool)

(assert (=> b!746908 (= res!503713 e!417031)))

(declare-fun c!81978 () Bool)

(assert (=> b!746908 (= c!81978 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746909 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41676 (_ BitVec 32)) SeekEntryResult!7549)

(assert (=> b!746909 (= e!417031 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19952 a!3186) j!159) a!3186 mask!3328) (Found!7549 j!159)))))

(declare-fun e!417032 () Bool)

(declare-fun b!746910 () Bool)

(declare-fun lt!331858 () SeekEntryResult!7549)

(assert (=> b!746910 (= e!417032 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19952 a!3186) j!159) a!3186 mask!3328) lt!331858))))

(declare-fun b!746911 () Bool)

(declare-fun e!417034 () Bool)

(declare-fun e!417035 () Bool)

(assert (=> b!746911 (= e!417034 (not e!417035))))

(declare-fun res!503727 () Bool)

(assert (=> b!746911 (=> res!503727 e!417035)))

(declare-fun lt!331860 () SeekEntryResult!7549)

(get-info :version)

(assert (=> b!746911 (= res!503727 (or (not ((_ is Intermediate!7549) lt!331860)) (bvslt x!1131 (x!63518 lt!331860)) (not (= x!1131 (x!63518 lt!331860))) (not (= index!1321 (index!32566 lt!331860)))))))

(assert (=> b!746911 e!417032))

(declare-fun res!503712 () Bool)

(assert (=> b!746911 (=> (not res!503712) (not e!417032))))

(declare-fun lt!331856 () SeekEntryResult!7549)

(assert (=> b!746911 (= res!503712 (= lt!331856 lt!331858))))

(assert (=> b!746911 (= lt!331858 (Found!7549 j!159))))

(assert (=> b!746911 (= lt!331856 (seekEntryOrOpen!0 (select (arr!19952 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!746911 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25556 0))(
  ( (Unit!25557) )
))
(declare-fun lt!331864 () Unit!25556)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25556)

(assert (=> b!746911 (= lt!331864 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746912 () Bool)

(declare-fun res!503716 () Bool)

(assert (=> b!746912 (=> (not res!503716) (not e!417037))))

(assert (=> b!746912 (= res!503716 (and (= (size!20373 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20373 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20373 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746913 () Bool)

(declare-fun e!417030 () Unit!25556)

(declare-fun Unit!25558 () Unit!25556)

(assert (=> b!746913 (= e!417030 Unit!25558)))

(declare-fun b!746914 () Bool)

(declare-fun Unit!25559 () Unit!25556)

(assert (=> b!746914 (= e!417030 Unit!25559)))

(assert (=> b!746914 false))

(declare-fun b!746915 () Bool)

(assert (=> b!746915 (= e!417035 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!746915 (= (select (store (arr!19952 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!331861 () Unit!25556)

(assert (=> b!746915 (= lt!331861 e!417030)))

(declare-fun c!81977 () Bool)

(assert (=> b!746915 (= c!81977 (= (select (store (arr!19952 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!746916 () Bool)

(declare-fun res!503720 () Bool)

(assert (=> b!746916 (=> res!503720 e!417035)))

(declare-fun lt!331863 () (_ BitVec 64))

(assert (=> b!746916 (= res!503720 (= (select (store (arr!19952 a!3186) i!1173 k0!2102) index!1321) lt!331863))))

(declare-fun b!746917 () Bool)

(declare-fun res!503717 () Bool)

(assert (=> b!746917 (=> (not res!503717) (not e!417037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746917 (= res!503717 (validKeyInArray!0 k0!2102))))

(declare-fun b!746918 () Bool)

(declare-fun res!503718 () Bool)

(assert (=> b!746918 (=> res!503718 e!417035)))

(assert (=> b!746918 (= res!503718 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19952 a!3186) j!159) a!3186 mask!3328) lt!331858)))))

(declare-fun b!746919 () Bool)

(declare-fun res!503714 () Bool)

(assert (=> b!746919 (=> (not res!503714) (not e!417033))))

(assert (=> b!746919 (= res!503714 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19952 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746920 () Bool)

(assert (=> b!746920 (= e!417033 e!417034)))

(declare-fun res!503726 () Bool)

(assert (=> b!746920 (=> (not res!503726) (not e!417034))))

(declare-fun lt!331859 () SeekEntryResult!7549)

(assert (=> b!746920 (= res!503726 (= lt!331859 lt!331860))))

(declare-fun lt!331862 () array!41676)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41676 (_ BitVec 32)) SeekEntryResult!7549)

(assert (=> b!746920 (= lt!331860 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331863 lt!331862 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746920 (= lt!331859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331863 mask!3328) lt!331863 lt!331862 mask!3328))))

(assert (=> b!746920 (= lt!331863 (select (store (arr!19952 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746920 (= lt!331862 (array!41677 (store (arr!19952 a!3186) i!1173 k0!2102) (size!20373 a!3186)))))

(declare-fun b!746921 () Bool)

(declare-fun res!503715 () Bool)

(assert (=> b!746921 (=> (not res!503715) (not e!417029))))

(declare-datatypes ((List!13993 0))(
  ( (Nil!13990) (Cons!13989 (h!15061 (_ BitVec 64)) (t!20299 List!13993)) )
))
(declare-fun arrayNoDuplicates!0 (array!41676 (_ BitVec 32) List!13993) Bool)

(assert (=> b!746921 (= res!503715 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13990))))

(declare-fun b!746922 () Bool)

(declare-fun res!503711 () Bool)

(assert (=> b!746922 (=> (not res!503711) (not e!417037))))

(assert (=> b!746922 (= res!503711 (validKeyInArray!0 (select (arr!19952 a!3186) j!159)))))

(declare-fun b!746923 () Bool)

(assert (=> b!746923 (= e!417029 e!417033)))

(declare-fun res!503722 () Bool)

(assert (=> b!746923 (=> (not res!503722) (not e!417033))))

(declare-fun lt!331857 () SeekEntryResult!7549)

(assert (=> b!746923 (= res!503722 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19952 a!3186) j!159) mask!3328) (select (arr!19952 a!3186) j!159) a!3186 mask!3328) lt!331857))))

(assert (=> b!746923 (= lt!331857 (Intermediate!7549 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746924 () Bool)

(assert (=> b!746924 (= e!417031 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19952 a!3186) j!159) a!3186 mask!3328) lt!331857))))

(assert (= (and start!65486 res!503723) b!746912))

(assert (= (and b!746912 res!503716) b!746922))

(assert (= (and b!746922 res!503711) b!746917))

(assert (= (and b!746917 res!503717) b!746906))

(assert (= (and b!746906 res!503724) b!746907))

(assert (= (and b!746907 res!503719) b!746904))

(assert (= (and b!746904 res!503721) b!746921))

(assert (= (and b!746921 res!503715) b!746905))

(assert (= (and b!746905 res!503725) b!746923))

(assert (= (and b!746923 res!503722) b!746919))

(assert (= (and b!746919 res!503714) b!746908))

(assert (= (and b!746908 c!81978) b!746924))

(assert (= (and b!746908 (not c!81978)) b!746909))

(assert (= (and b!746908 res!503713) b!746920))

(assert (= (and b!746920 res!503726) b!746911))

(assert (= (and b!746911 res!503712) b!746910))

(assert (= (and b!746911 (not res!503727)) b!746918))

(assert (= (and b!746918 (not res!503718)) b!746916))

(assert (= (and b!746916 (not res!503720)) b!746915))

(assert (= (and b!746915 c!81977) b!746914))

(assert (= (and b!746915 (not c!81977)) b!746913))

(declare-fun m!696545 () Bool)

(assert (=> b!746916 m!696545))

(declare-fun m!696547 () Bool)

(assert (=> b!746916 m!696547))

(declare-fun m!696549 () Bool)

(assert (=> b!746924 m!696549))

(assert (=> b!746924 m!696549))

(declare-fun m!696551 () Bool)

(assert (=> b!746924 m!696551))

(declare-fun m!696553 () Bool)

(assert (=> b!746917 m!696553))

(declare-fun m!696555 () Bool)

(assert (=> b!746904 m!696555))

(declare-fun m!696557 () Bool)

(assert (=> b!746907 m!696557))

(assert (=> b!746910 m!696549))

(assert (=> b!746910 m!696549))

(declare-fun m!696559 () Bool)

(assert (=> b!746910 m!696559))

(assert (=> b!746915 m!696545))

(assert (=> b!746915 m!696547))

(assert (=> b!746911 m!696549))

(assert (=> b!746911 m!696549))

(declare-fun m!696561 () Bool)

(assert (=> b!746911 m!696561))

(declare-fun m!696563 () Bool)

(assert (=> b!746911 m!696563))

(declare-fun m!696565 () Bool)

(assert (=> b!746911 m!696565))

(declare-fun m!696567 () Bool)

(assert (=> start!65486 m!696567))

(declare-fun m!696569 () Bool)

(assert (=> start!65486 m!696569))

(assert (=> b!746909 m!696549))

(assert (=> b!746909 m!696549))

(declare-fun m!696571 () Bool)

(assert (=> b!746909 m!696571))

(assert (=> b!746922 m!696549))

(assert (=> b!746922 m!696549))

(declare-fun m!696573 () Bool)

(assert (=> b!746922 m!696573))

(declare-fun m!696575 () Bool)

(assert (=> b!746906 m!696575))

(declare-fun m!696577 () Bool)

(assert (=> b!746919 m!696577))

(declare-fun m!696579 () Bool)

(assert (=> b!746921 m!696579))

(assert (=> b!746918 m!696549))

(assert (=> b!746918 m!696549))

(assert (=> b!746918 m!696571))

(assert (=> b!746920 m!696545))

(declare-fun m!696581 () Bool)

(assert (=> b!746920 m!696581))

(declare-fun m!696583 () Bool)

(assert (=> b!746920 m!696583))

(declare-fun m!696585 () Bool)

(assert (=> b!746920 m!696585))

(assert (=> b!746920 m!696581))

(declare-fun m!696587 () Bool)

(assert (=> b!746920 m!696587))

(assert (=> b!746923 m!696549))

(assert (=> b!746923 m!696549))

(declare-fun m!696589 () Bool)

(assert (=> b!746923 m!696589))

(assert (=> b!746923 m!696589))

(assert (=> b!746923 m!696549))

(declare-fun m!696591 () Bool)

(assert (=> b!746923 m!696591))

(check-sat (not b!746911) (not b!746921) (not start!65486) (not b!746920) (not b!746923) (not b!746910) (not b!746904) (not b!746917) (not b!746909) (not b!746918) (not b!746906) (not b!746922) (not b!746924) (not b!746907))
(check-sat)
