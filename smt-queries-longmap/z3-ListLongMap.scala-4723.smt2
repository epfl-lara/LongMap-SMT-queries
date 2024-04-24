; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65526 () Bool)

(assert start!65526)

(declare-fun b!744923 () Bool)

(declare-fun res!501501 () Bool)

(declare-fun e!416211 () Bool)

(assert (=> b!744923 (=> (not res!501501) (not e!416211))))

(declare-datatypes ((array!41569 0))(
  ( (array!41570 (arr!19894 (Array (_ BitVec 32) (_ BitVec 64))) (size!20314 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41569)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744923 (= res!501501 (validKeyInArray!0 (select (arr!19894 a!3186) j!159)))))

(declare-fun b!744924 () Bool)

(declare-fun res!501510 () Bool)

(assert (=> b!744924 (=> (not res!501510) (not e!416211))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!744924 (= res!501510 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!416204 () Bool)

(declare-fun b!744925 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7450 0))(
  ( (MissingZero!7450 (index!32168 (_ BitVec 32))) (Found!7450 (index!32169 (_ BitVec 32))) (Intermediate!7450 (undefined!8262 Bool) (index!32170 (_ BitVec 32)) (x!63292 (_ BitVec 32))) (Undefined!7450) (MissingVacant!7450 (index!32171 (_ BitVec 32))) )
))
(declare-fun lt!330898 () SeekEntryResult!7450)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41569 (_ BitVec 32)) SeekEntryResult!7450)

(assert (=> b!744925 (= e!416204 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19894 a!3186) j!159) a!3186 mask!3328) lt!330898))))

(declare-fun b!744926 () Bool)

(declare-fun res!501506 () Bool)

(assert (=> b!744926 (=> (not res!501506) (not e!416211))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744926 (= res!501506 (and (= (size!20314 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20314 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20314 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744927 () Bool)

(declare-fun res!501508 () Bool)

(declare-fun e!416205 () Bool)

(assert (=> b!744927 (=> (not res!501508) (not e!416205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41569 (_ BitVec 32)) Bool)

(assert (=> b!744927 (= res!501508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744928 () Bool)

(declare-fun res!501496 () Bool)

(declare-fun e!416207 () Bool)

(assert (=> b!744928 (=> (not res!501496) (not e!416207))))

(declare-fun e!416209 () Bool)

(assert (=> b!744928 (= res!501496 e!416209)))

(declare-fun c!82097 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!744928 (= c!82097 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744929 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!744929 (= e!416209 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19894 a!3186) j!159) a!3186 mask!3328) (Found!7450 j!159)))))

(declare-fun b!744930 () Bool)

(declare-fun e!416208 () Bool)

(assert (=> b!744930 (= e!416207 e!416208)))

(declare-fun res!501507 () Bool)

(assert (=> b!744930 (=> (not res!501507) (not e!416208))))

(declare-fun lt!330897 () SeekEntryResult!7450)

(declare-fun lt!330903 () SeekEntryResult!7450)

(assert (=> b!744930 (= res!501507 (= lt!330897 lt!330903))))

(declare-fun lt!330899 () (_ BitVec 64))

(declare-fun lt!330896 () array!41569)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41569 (_ BitVec 32)) SeekEntryResult!7450)

(assert (=> b!744930 (= lt!330903 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330899 lt!330896 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744930 (= lt!330897 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330899 mask!3328) lt!330899 lt!330896 mask!3328))))

(assert (=> b!744930 (= lt!330899 (select (store (arr!19894 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744930 (= lt!330896 (array!41570 (store (arr!19894 a!3186) i!1173 k0!2102) (size!20314 a!3186)))))

(declare-fun b!744931 () Bool)

(declare-fun res!501502 () Bool)

(assert (=> b!744931 (=> (not res!501502) (not e!416211))))

(declare-fun arrayContainsKey!0 (array!41569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744931 (= res!501502 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744932 () Bool)

(declare-fun e!416210 () Bool)

(assert (=> b!744932 (= e!416208 (not e!416210))))

(declare-fun res!501500 () Bool)

(assert (=> b!744932 (=> res!501500 e!416210)))

(get-info :version)

(assert (=> b!744932 (= res!501500 (or (not ((_ is Intermediate!7450) lt!330903)) (bvslt x!1131 (x!63292 lt!330903)) (not (= x!1131 (x!63292 lt!330903))) (not (= index!1321 (index!32170 lt!330903)))))))

(declare-fun e!416206 () Bool)

(assert (=> b!744932 e!416206))

(declare-fun res!501499 () Bool)

(assert (=> b!744932 (=> (not res!501499) (not e!416206))))

(assert (=> b!744932 (= res!501499 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25459 0))(
  ( (Unit!25460) )
))
(declare-fun lt!330902 () Unit!25459)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41569 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25459)

(assert (=> b!744932 (= lt!330902 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744934 () Bool)

(declare-fun res!501503 () Bool)

(assert (=> b!744934 (=> (not res!501503) (not e!416207))))

(assert (=> b!744934 (= res!501503 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19894 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!330900 () SeekEntryResult!7450)

(declare-fun b!744935 () Bool)

(assert (=> b!744935 (= e!416209 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19894 a!3186) j!159) a!3186 mask!3328) lt!330900))))

(declare-fun b!744936 () Bool)

(assert (=> b!744936 (= e!416205 e!416207)))

(declare-fun res!501511 () Bool)

(assert (=> b!744936 (=> (not res!501511) (not e!416207))))

(assert (=> b!744936 (= res!501511 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19894 a!3186) j!159) mask!3328) (select (arr!19894 a!3186) j!159) a!3186 mask!3328) lt!330900))))

(assert (=> b!744936 (= lt!330900 (Intermediate!7450 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744933 () Bool)

(assert (=> b!744933 (= e!416210 true)))

(declare-fun lt!330901 () SeekEntryResult!7450)

(assert (=> b!744933 (= lt!330901 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19894 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!501497 () Bool)

(assert (=> start!65526 (=> (not res!501497) (not e!416211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65526 (= res!501497 (validMask!0 mask!3328))))

(assert (=> start!65526 e!416211))

(assert (=> start!65526 true))

(declare-fun array_inv!15753 (array!41569) Bool)

(assert (=> start!65526 (array_inv!15753 a!3186)))

(declare-fun b!744937 () Bool)

(assert (=> b!744937 (= e!416206 e!416204)))

(declare-fun res!501504 () Bool)

(assert (=> b!744937 (=> (not res!501504) (not e!416204))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41569 (_ BitVec 32)) SeekEntryResult!7450)

(assert (=> b!744937 (= res!501504 (= (seekEntryOrOpen!0 (select (arr!19894 a!3186) j!159) a!3186 mask!3328) lt!330898))))

(assert (=> b!744937 (= lt!330898 (Found!7450 j!159))))

(declare-fun b!744938 () Bool)

(declare-fun res!501505 () Bool)

(assert (=> b!744938 (=> (not res!501505) (not e!416205))))

(assert (=> b!744938 (= res!501505 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20314 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20314 a!3186))))))

(declare-fun b!744939 () Bool)

(assert (=> b!744939 (= e!416211 e!416205)))

(declare-fun res!501509 () Bool)

(assert (=> b!744939 (=> (not res!501509) (not e!416205))))

(declare-fun lt!330895 () SeekEntryResult!7450)

(assert (=> b!744939 (= res!501509 (or (= lt!330895 (MissingZero!7450 i!1173)) (= lt!330895 (MissingVacant!7450 i!1173))))))

(assert (=> b!744939 (= lt!330895 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!744940 () Bool)

(declare-fun res!501498 () Bool)

(assert (=> b!744940 (=> (not res!501498) (not e!416205))))

(declare-datatypes ((List!13803 0))(
  ( (Nil!13800) (Cons!13799 (h!14877 (_ BitVec 64)) (t!20110 List!13803)) )
))
(declare-fun arrayNoDuplicates!0 (array!41569 (_ BitVec 32) List!13803) Bool)

(assert (=> b!744940 (= res!501498 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13800))))

(assert (= (and start!65526 res!501497) b!744926))

(assert (= (and b!744926 res!501506) b!744923))

(assert (= (and b!744923 res!501501) b!744924))

(assert (= (and b!744924 res!501510) b!744931))

(assert (= (and b!744931 res!501502) b!744939))

(assert (= (and b!744939 res!501509) b!744927))

(assert (= (and b!744927 res!501508) b!744940))

(assert (= (and b!744940 res!501498) b!744938))

(assert (= (and b!744938 res!501505) b!744936))

(assert (= (and b!744936 res!501511) b!744934))

(assert (= (and b!744934 res!501503) b!744928))

(assert (= (and b!744928 c!82097) b!744935))

(assert (= (and b!744928 (not c!82097)) b!744929))

(assert (= (and b!744928 res!501496) b!744930))

(assert (= (and b!744930 res!501507) b!744932))

(assert (= (and b!744932 res!501499) b!744937))

(assert (= (and b!744937 res!501504) b!744925))

(assert (= (and b!744932 (not res!501500)) b!744933))

(declare-fun m!695907 () Bool)

(assert (=> b!744937 m!695907))

(assert (=> b!744937 m!695907))

(declare-fun m!695909 () Bool)

(assert (=> b!744937 m!695909))

(declare-fun m!695911 () Bool)

(assert (=> b!744932 m!695911))

(declare-fun m!695913 () Bool)

(assert (=> b!744932 m!695913))

(declare-fun m!695915 () Bool)

(assert (=> b!744924 m!695915))

(declare-fun m!695917 () Bool)

(assert (=> b!744931 m!695917))

(assert (=> b!744929 m!695907))

(assert (=> b!744929 m!695907))

(declare-fun m!695919 () Bool)

(assert (=> b!744929 m!695919))

(assert (=> b!744935 m!695907))

(assert (=> b!744935 m!695907))

(declare-fun m!695921 () Bool)

(assert (=> b!744935 m!695921))

(declare-fun m!695923 () Bool)

(assert (=> b!744927 m!695923))

(declare-fun m!695925 () Bool)

(assert (=> b!744934 m!695925))

(declare-fun m!695927 () Bool)

(assert (=> start!65526 m!695927))

(declare-fun m!695929 () Bool)

(assert (=> start!65526 m!695929))

(declare-fun m!695931 () Bool)

(assert (=> b!744940 m!695931))

(assert (=> b!744933 m!695907))

(assert (=> b!744933 m!695907))

(assert (=> b!744933 m!695919))

(assert (=> b!744923 m!695907))

(assert (=> b!744923 m!695907))

(declare-fun m!695933 () Bool)

(assert (=> b!744923 m!695933))

(assert (=> b!744925 m!695907))

(assert (=> b!744925 m!695907))

(declare-fun m!695935 () Bool)

(assert (=> b!744925 m!695935))

(assert (=> b!744936 m!695907))

(assert (=> b!744936 m!695907))

(declare-fun m!695937 () Bool)

(assert (=> b!744936 m!695937))

(assert (=> b!744936 m!695937))

(assert (=> b!744936 m!695907))

(declare-fun m!695939 () Bool)

(assert (=> b!744936 m!695939))

(declare-fun m!695941 () Bool)

(assert (=> b!744939 m!695941))

(declare-fun m!695943 () Bool)

(assert (=> b!744930 m!695943))

(declare-fun m!695945 () Bool)

(assert (=> b!744930 m!695945))

(declare-fun m!695947 () Bool)

(assert (=> b!744930 m!695947))

(declare-fun m!695949 () Bool)

(assert (=> b!744930 m!695949))

(assert (=> b!744930 m!695945))

(declare-fun m!695951 () Bool)

(assert (=> b!744930 m!695951))

(check-sat (not b!744932) (not b!744936) (not b!744937) (not b!744927) (not b!744929) (not b!744930) (not b!744931) (not b!744940) (not b!744924) (not start!65526) (not b!744925) (not b!744939) (not b!744933) (not b!744935) (not b!744923))
(check-sat)
