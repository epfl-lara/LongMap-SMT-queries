; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65696 () Bool)

(assert start!65696)

(declare-fun b!753865 () Bool)

(declare-fun res!509428 () Bool)

(declare-fun e!420431 () Bool)

(assert (=> b!753865 (=> (not res!509428) (not e!420431))))

(declare-datatypes ((array!41886 0))(
  ( (array!41887 (arr!20057 (Array (_ BitVec 32) (_ BitVec 64))) (size!20478 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41886)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753865 (= res!509428 (validKeyInArray!0 (select (arr!20057 a!3186) j!159)))))

(declare-fun b!753866 () Bool)

(declare-fun res!509430 () Bool)

(declare-fun e!420430 () Bool)

(assert (=> b!753866 (=> (not res!509430) (not e!420430))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!335340 () array!41886)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!335338 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7654 0))(
  ( (MissingZero!7654 (index!32984 (_ BitVec 32))) (Found!7654 (index!32985 (_ BitVec 32))) (Intermediate!7654 (undefined!8466 Bool) (index!32986 (_ BitVec 32)) (x!63903 (_ BitVec 32))) (Undefined!7654) (MissingVacant!7654 (index!32987 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41886 (_ BitVec 32)) SeekEntryResult!7654)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41886 (_ BitVec 32)) SeekEntryResult!7654)

(assert (=> b!753866 (= res!509430 (= (seekEntryOrOpen!0 lt!335338 lt!335340 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335338 lt!335340 mask!3328)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!420439 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!753867 () Bool)

(declare-fun lt!335334 () SeekEntryResult!7654)

(assert (=> b!753867 (= e!420439 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20057 a!3186) j!159) a!3186 mask!3328) lt!335334))))

(declare-fun b!753869 () Bool)

(declare-fun e!420434 () Bool)

(assert (=> b!753869 (= e!420434 true)))

(assert (=> b!753869 e!420430))

(declare-fun res!509423 () Bool)

(assert (=> b!753869 (=> (not res!509423) (not e!420430))))

(declare-fun lt!335335 () (_ BitVec 64))

(assert (=> b!753869 (= res!509423 (= lt!335335 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25976 0))(
  ( (Unit!25977) )
))
(declare-fun lt!335343 () Unit!25976)

(declare-fun e!420432 () Unit!25976)

(assert (=> b!753869 (= lt!335343 e!420432)))

(declare-fun c!82608 () Bool)

(assert (=> b!753869 (= c!82608 (= lt!335335 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753870 () Bool)

(declare-fun Unit!25978 () Unit!25976)

(assert (=> b!753870 (= e!420432 Unit!25978)))

(assert (=> b!753870 false))

(declare-fun b!753871 () Bool)

(declare-fun res!509412 () Bool)

(declare-fun e!420435 () Bool)

(assert (=> b!753871 (=> (not res!509412) (not e!420435))))

(declare-fun e!420428 () Bool)

(assert (=> b!753871 (= res!509412 e!420428)))

(declare-fun c!82607 () Bool)

(assert (=> b!753871 (= c!82607 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753872 () Bool)

(declare-fun res!509419 () Bool)

(declare-fun e!420438 () Bool)

(assert (=> b!753872 (=> (not res!509419) (not e!420438))))

(declare-datatypes ((List!14098 0))(
  ( (Nil!14095) (Cons!14094 (h!15166 (_ BitVec 64)) (t!20404 List!14098)) )
))
(declare-fun arrayNoDuplicates!0 (array!41886 (_ BitVec 32) List!14098) Bool)

(assert (=> b!753872 (= res!509419 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14095))))

(declare-fun b!753873 () Bool)

(declare-fun res!509425 () Bool)

(assert (=> b!753873 (=> (not res!509425) (not e!420431))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753873 (= res!509425 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!335345 () SeekEntryResult!7654)

(declare-fun b!753874 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41886 (_ BitVec 32)) SeekEntryResult!7654)

(assert (=> b!753874 (= e!420428 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20057 a!3186) j!159) a!3186 mask!3328) lt!335345))))

(declare-fun b!753875 () Bool)

(declare-fun e!420433 () Bool)

(declare-fun e!420437 () Bool)

(assert (=> b!753875 (= e!420433 e!420437)))

(declare-fun res!509417 () Bool)

(assert (=> b!753875 (=> res!509417 e!420437)))

(declare-fun lt!335336 () SeekEntryResult!7654)

(assert (=> b!753875 (= res!509417 (not (= lt!335336 lt!335334)))))

(assert (=> b!753875 (= lt!335336 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20057 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753876 () Bool)

(assert (=> b!753876 (= e!420438 e!420435)))

(declare-fun res!509429 () Bool)

(assert (=> b!753876 (=> (not res!509429) (not e!420435))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753876 (= res!509429 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20057 a!3186) j!159) mask!3328) (select (arr!20057 a!3186) j!159) a!3186 mask!3328) lt!335345))))

(assert (=> b!753876 (= lt!335345 (Intermediate!7654 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753877 () Bool)

(declare-fun e!420436 () Bool)

(assert (=> b!753877 (= e!420435 e!420436)))

(declare-fun res!509422 () Bool)

(assert (=> b!753877 (=> (not res!509422) (not e!420436))))

(declare-fun lt!335341 () SeekEntryResult!7654)

(declare-fun lt!335337 () SeekEntryResult!7654)

(assert (=> b!753877 (= res!509422 (= lt!335341 lt!335337))))

(assert (=> b!753877 (= lt!335337 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335338 lt!335340 mask!3328))))

(assert (=> b!753877 (= lt!335341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335338 mask!3328) lt!335338 lt!335340 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!753877 (= lt!335338 (select (store (arr!20057 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!753877 (= lt!335340 (array!41887 (store (arr!20057 a!3186) i!1173 k0!2102) (size!20478 a!3186)))))

(declare-fun b!753868 () Bool)

(assert (=> b!753868 (= e!420431 e!420438)))

(declare-fun res!509426 () Bool)

(assert (=> b!753868 (=> (not res!509426) (not e!420438))))

(declare-fun lt!335344 () SeekEntryResult!7654)

(assert (=> b!753868 (= res!509426 (or (= lt!335344 (MissingZero!7654 i!1173)) (= lt!335344 (MissingVacant!7654 i!1173))))))

(assert (=> b!753868 (= lt!335344 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!509413 () Bool)

(assert (=> start!65696 (=> (not res!509413) (not e!420431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65696 (= res!509413 (validMask!0 mask!3328))))

(assert (=> start!65696 e!420431))

(assert (=> start!65696 true))

(declare-fun array_inv!15940 (array!41886) Bool)

(assert (=> start!65696 (array_inv!15940 a!3186)))

(declare-fun b!753878 () Bool)

(declare-fun res!509414 () Bool)

(assert (=> b!753878 (=> (not res!509414) (not e!420438))))

(assert (=> b!753878 (= res!509414 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20478 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20478 a!3186))))))

(declare-fun b!753879 () Bool)

(assert (=> b!753879 (= e!420437 e!420434)))

(declare-fun res!509427 () Bool)

(assert (=> b!753879 (=> res!509427 e!420434)))

(assert (=> b!753879 (= res!509427 (= lt!335335 lt!335338))))

(assert (=> b!753879 (= lt!335335 (select (store (arr!20057 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!753880 () Bool)

(assert (=> b!753880 (= e!420428 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20057 a!3186) j!159) a!3186 mask!3328) (Found!7654 j!159)))))

(declare-fun b!753881 () Bool)

(declare-fun lt!335339 () SeekEntryResult!7654)

(assert (=> b!753881 (= e!420430 (= lt!335339 lt!335336))))

(declare-fun b!753882 () Bool)

(declare-fun res!509418 () Bool)

(assert (=> b!753882 (=> (not res!509418) (not e!420431))))

(assert (=> b!753882 (= res!509418 (validKeyInArray!0 k0!2102))))

(declare-fun b!753883 () Bool)

(declare-fun res!509415 () Bool)

(assert (=> b!753883 (=> (not res!509415) (not e!420435))))

(assert (=> b!753883 (= res!509415 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20057 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753884 () Bool)

(declare-fun res!509424 () Bool)

(assert (=> b!753884 (=> (not res!509424) (not e!420438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41886 (_ BitVec 32)) Bool)

(assert (=> b!753884 (= res!509424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753885 () Bool)

(declare-fun Unit!25979 () Unit!25976)

(assert (=> b!753885 (= e!420432 Unit!25979)))

(declare-fun b!753886 () Bool)

(assert (=> b!753886 (= e!420436 (not e!420433))))

(declare-fun res!509421 () Bool)

(assert (=> b!753886 (=> res!509421 e!420433)))

(get-info :version)

(assert (=> b!753886 (= res!509421 (or (not ((_ is Intermediate!7654) lt!335337)) (bvslt x!1131 (x!63903 lt!335337)) (not (= x!1131 (x!63903 lt!335337))) (not (= index!1321 (index!32986 lt!335337)))))))

(assert (=> b!753886 e!420439))

(declare-fun res!509416 () Bool)

(assert (=> b!753886 (=> (not res!509416) (not e!420439))))

(assert (=> b!753886 (= res!509416 (= lt!335339 lt!335334))))

(assert (=> b!753886 (= lt!335334 (Found!7654 j!159))))

(assert (=> b!753886 (= lt!335339 (seekEntryOrOpen!0 (select (arr!20057 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!753886 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335342 () Unit!25976)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41886 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25976)

(assert (=> b!753886 (= lt!335342 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753887 () Bool)

(declare-fun res!509420 () Bool)

(assert (=> b!753887 (=> (not res!509420) (not e!420431))))

(assert (=> b!753887 (= res!509420 (and (= (size!20478 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20478 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20478 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65696 res!509413) b!753887))

(assert (= (and b!753887 res!509420) b!753865))

(assert (= (and b!753865 res!509428) b!753882))

(assert (= (and b!753882 res!509418) b!753873))

(assert (= (and b!753873 res!509425) b!753868))

(assert (= (and b!753868 res!509426) b!753884))

(assert (= (and b!753884 res!509424) b!753872))

(assert (= (and b!753872 res!509419) b!753878))

(assert (= (and b!753878 res!509414) b!753876))

(assert (= (and b!753876 res!509429) b!753883))

(assert (= (and b!753883 res!509415) b!753871))

(assert (= (and b!753871 c!82607) b!753874))

(assert (= (and b!753871 (not c!82607)) b!753880))

(assert (= (and b!753871 res!509412) b!753877))

(assert (= (and b!753877 res!509422) b!753886))

(assert (= (and b!753886 res!509416) b!753867))

(assert (= (and b!753886 (not res!509421)) b!753875))

(assert (= (and b!753875 (not res!509417)) b!753879))

(assert (= (and b!753879 (not res!509427)) b!753869))

(assert (= (and b!753869 c!82608) b!753870))

(assert (= (and b!753869 (not c!82608)) b!753885))

(assert (= (and b!753869 res!509423) b!753866))

(assert (= (and b!753866 res!509430) b!753881))

(declare-fun m!701885 () Bool)

(assert (=> b!753879 m!701885))

(declare-fun m!701887 () Bool)

(assert (=> b!753879 m!701887))

(declare-fun m!701889 () Bool)

(assert (=> b!753873 m!701889))

(declare-fun m!701891 () Bool)

(assert (=> b!753872 m!701891))

(declare-fun m!701893 () Bool)

(assert (=> b!753884 m!701893))

(declare-fun m!701895 () Bool)

(assert (=> b!753868 m!701895))

(declare-fun m!701897 () Bool)

(assert (=> b!753883 m!701897))

(declare-fun m!701899 () Bool)

(assert (=> b!753886 m!701899))

(assert (=> b!753886 m!701899))

(declare-fun m!701901 () Bool)

(assert (=> b!753886 m!701901))

(declare-fun m!701903 () Bool)

(assert (=> b!753886 m!701903))

(declare-fun m!701905 () Bool)

(assert (=> b!753886 m!701905))

(declare-fun m!701907 () Bool)

(assert (=> b!753866 m!701907))

(declare-fun m!701909 () Bool)

(assert (=> b!753866 m!701909))

(declare-fun m!701911 () Bool)

(assert (=> start!65696 m!701911))

(declare-fun m!701913 () Bool)

(assert (=> start!65696 m!701913))

(assert (=> b!753875 m!701899))

(assert (=> b!753875 m!701899))

(declare-fun m!701915 () Bool)

(assert (=> b!753875 m!701915))

(assert (=> b!753874 m!701899))

(assert (=> b!753874 m!701899))

(declare-fun m!701917 () Bool)

(assert (=> b!753874 m!701917))

(declare-fun m!701919 () Bool)

(assert (=> b!753882 m!701919))

(assert (=> b!753865 m!701899))

(assert (=> b!753865 m!701899))

(declare-fun m!701921 () Bool)

(assert (=> b!753865 m!701921))

(declare-fun m!701923 () Bool)

(assert (=> b!753877 m!701923))

(declare-fun m!701925 () Bool)

(assert (=> b!753877 m!701925))

(declare-fun m!701927 () Bool)

(assert (=> b!753877 m!701927))

(assert (=> b!753877 m!701885))

(declare-fun m!701929 () Bool)

(assert (=> b!753877 m!701929))

(assert (=> b!753877 m!701923))

(assert (=> b!753880 m!701899))

(assert (=> b!753880 m!701899))

(assert (=> b!753880 m!701915))

(assert (=> b!753876 m!701899))

(assert (=> b!753876 m!701899))

(declare-fun m!701931 () Bool)

(assert (=> b!753876 m!701931))

(assert (=> b!753876 m!701931))

(assert (=> b!753876 m!701899))

(declare-fun m!701933 () Bool)

(assert (=> b!753876 m!701933))

(assert (=> b!753867 m!701899))

(assert (=> b!753867 m!701899))

(declare-fun m!701935 () Bool)

(assert (=> b!753867 m!701935))

(check-sat (not b!753866) (not b!753868) (not b!753884) (not b!753886) (not b!753867) (not b!753873) (not b!753876) (not b!753882) (not b!753865) (not b!753880) (not b!753872) (not b!753875) (not b!753877) (not b!753874) (not start!65696))
(check-sat)
