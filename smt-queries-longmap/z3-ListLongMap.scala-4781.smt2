; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65726 () Bool)

(assert start!65726)

(declare-fun b!754900 () Bool)

(declare-fun res!510268 () Bool)

(declare-fun e!420979 () Bool)

(assert (=> b!754900 (=> (not res!510268) (not e!420979))))

(declare-datatypes ((array!41916 0))(
  ( (array!41917 (arr!20072 (Array (_ BitVec 32) (_ BitVec 64))) (size!20493 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41916)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754900 (= res!510268 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!420969 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!754901 () Bool)

(declare-datatypes ((SeekEntryResult!7669 0))(
  ( (MissingZero!7669 (index!33044 (_ BitVec 32))) (Found!7669 (index!33045 (_ BitVec 32))) (Intermediate!7669 (undefined!8481 Bool) (index!33046 (_ BitVec 32)) (x!63958 (_ BitVec 32))) (Undefined!7669) (MissingVacant!7669 (index!33047 (_ BitVec 32))) )
))
(declare-fun lt!335879 () SeekEntryResult!7669)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41916 (_ BitVec 32)) SeekEntryResult!7669)

(assert (=> b!754901 (= e!420969 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20072 a!3186) j!159) a!3186 mask!3328) lt!335879))))

(declare-fun b!754902 () Bool)

(declare-fun e!420975 () Bool)

(declare-fun lt!335883 () SeekEntryResult!7669)

(declare-fun lt!335876 () SeekEntryResult!7669)

(assert (=> b!754902 (= e!420975 (= lt!335883 lt!335876))))

(declare-fun b!754903 () Bool)

(declare-datatypes ((Unit!26036 0))(
  ( (Unit!26037) )
))
(declare-fun e!420970 () Unit!26036)

(declare-fun Unit!26038 () Unit!26036)

(assert (=> b!754903 (= e!420970 Unit!26038)))

(declare-fun b!754904 () Bool)

(declare-fun e!420972 () Bool)

(declare-fun e!420977 () Bool)

(assert (=> b!754904 (= e!420972 e!420977)))

(declare-fun res!510271 () Bool)

(assert (=> b!754904 (=> res!510271 e!420977)))

(declare-fun lt!335885 () (_ BitVec 64))

(declare-fun lt!335880 () (_ BitVec 64))

(assert (=> b!754904 (= res!510271 (= lt!335885 lt!335880))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754904 (= lt!335885 (select (store (arr!20072 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!754905 () Bool)

(declare-fun e!420973 () Bool)

(declare-fun e!420971 () Bool)

(assert (=> b!754905 (= e!420973 e!420971)))

(declare-fun res!510283 () Bool)

(assert (=> b!754905 (=> (not res!510283) (not e!420971))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754905 (= res!510283 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20072 a!3186) j!159) mask!3328) (select (arr!20072 a!3186) j!159) a!3186 mask!3328) lt!335879))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754905 (= lt!335879 (Intermediate!7669 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754906 () Bool)

(declare-fun res!510273 () Bool)

(assert (=> b!754906 (=> (not res!510273) (not e!420979))))

(assert (=> b!754906 (= res!510273 (and (= (size!20493 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20493 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20493 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!510275 () Bool)

(assert (=> start!65726 (=> (not res!510275) (not e!420979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65726 (= res!510275 (validMask!0 mask!3328))))

(assert (=> start!65726 e!420979))

(assert (=> start!65726 true))

(declare-fun array_inv!15955 (array!41916) Bool)

(assert (=> start!65726 (array_inv!15955 a!3186)))

(declare-fun b!754907 () Bool)

(declare-fun res!510282 () Bool)

(assert (=> b!754907 (=> (not res!510282) (not e!420971))))

(assert (=> b!754907 (= res!510282 e!420969)))

(declare-fun c!82697 () Bool)

(assert (=> b!754907 (= c!82697 (bvsle x!1131 resIntermediateX!5))))

(declare-fun e!420976 () Bool)

(declare-fun lt!335875 () SeekEntryResult!7669)

(declare-fun b!754908 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41916 (_ BitVec 32)) SeekEntryResult!7669)

(assert (=> b!754908 (= e!420976 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20072 a!3186) j!159) a!3186 mask!3328) lt!335875))))

(declare-fun b!754909 () Bool)

(declare-fun res!510272 () Bool)

(assert (=> b!754909 (=> (not res!510272) (not e!420979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754909 (= res!510272 (validKeyInArray!0 k0!2102))))

(declare-fun b!754910 () Bool)

(declare-fun res!510277 () Bool)

(assert (=> b!754910 (=> (not res!510277) (not e!420973))))

(assert (=> b!754910 (= res!510277 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20493 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20493 a!3186))))))

(declare-fun b!754911 () Bool)

(declare-fun res!510267 () Bool)

(assert (=> b!754911 (=> (not res!510267) (not e!420971))))

(assert (=> b!754911 (= res!510267 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20072 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754912 () Bool)

(declare-fun res!510269 () Bool)

(assert (=> b!754912 (=> (not res!510269) (not e!420979))))

(assert (=> b!754912 (= res!510269 (validKeyInArray!0 (select (arr!20072 a!3186) j!159)))))

(declare-fun b!754913 () Bool)

(assert (=> b!754913 (= e!420977 true)))

(assert (=> b!754913 e!420975))

(declare-fun res!510280 () Bool)

(assert (=> b!754913 (=> (not res!510280) (not e!420975))))

(assert (=> b!754913 (= res!510280 (= lt!335885 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335881 () Unit!26036)

(assert (=> b!754913 (= lt!335881 e!420970)))

(declare-fun c!82698 () Bool)

(assert (=> b!754913 (= c!82698 (= lt!335885 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754914 () Bool)

(declare-fun e!420974 () Bool)

(assert (=> b!754914 (= e!420974 e!420972)))

(declare-fun res!510284 () Bool)

(assert (=> b!754914 (=> res!510284 e!420972)))

(assert (=> b!754914 (= res!510284 (not (= lt!335876 lt!335875)))))

(assert (=> b!754914 (= lt!335876 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20072 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754915 () Bool)

(declare-fun e!420968 () Bool)

(assert (=> b!754915 (= e!420971 e!420968)))

(declare-fun res!510274 () Bool)

(assert (=> b!754915 (=> (not res!510274) (not e!420968))))

(declare-fun lt!335884 () SeekEntryResult!7669)

(declare-fun lt!335878 () SeekEntryResult!7669)

(assert (=> b!754915 (= res!510274 (= lt!335884 lt!335878))))

(declare-fun lt!335874 () array!41916)

(assert (=> b!754915 (= lt!335878 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335880 lt!335874 mask!3328))))

(assert (=> b!754915 (= lt!335884 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335880 mask!3328) lt!335880 lt!335874 mask!3328))))

(assert (=> b!754915 (= lt!335880 (select (store (arr!20072 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!754915 (= lt!335874 (array!41917 (store (arr!20072 a!3186) i!1173 k0!2102) (size!20493 a!3186)))))

(declare-fun b!754916 () Bool)

(assert (=> b!754916 (= e!420968 (not e!420974))))

(declare-fun res!510276 () Bool)

(assert (=> b!754916 (=> res!510276 e!420974)))

(get-info :version)

(assert (=> b!754916 (= res!510276 (or (not ((_ is Intermediate!7669) lt!335878)) (bvslt x!1131 (x!63958 lt!335878)) (not (= x!1131 (x!63958 lt!335878))) (not (= index!1321 (index!33046 lt!335878)))))))

(assert (=> b!754916 e!420976))

(declare-fun res!510281 () Bool)

(assert (=> b!754916 (=> (not res!510281) (not e!420976))))

(assert (=> b!754916 (= res!510281 (= lt!335883 lt!335875))))

(assert (=> b!754916 (= lt!335875 (Found!7669 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41916 (_ BitVec 32)) SeekEntryResult!7669)

(assert (=> b!754916 (= lt!335883 (seekEntryOrOpen!0 (select (arr!20072 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41916 (_ BitVec 32)) Bool)

(assert (=> b!754916 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335877 () Unit!26036)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26036)

(assert (=> b!754916 (= lt!335877 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754917 () Bool)

(declare-fun res!510270 () Bool)

(assert (=> b!754917 (=> (not res!510270) (not e!420973))))

(declare-datatypes ((List!14113 0))(
  ( (Nil!14110) (Cons!14109 (h!15181 (_ BitVec 64)) (t!20419 List!14113)) )
))
(declare-fun arrayNoDuplicates!0 (array!41916 (_ BitVec 32) List!14113) Bool)

(assert (=> b!754917 (= res!510270 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14110))))

(declare-fun b!754918 () Bool)

(declare-fun res!510279 () Bool)

(assert (=> b!754918 (=> (not res!510279) (not e!420973))))

(assert (=> b!754918 (= res!510279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754919 () Bool)

(declare-fun Unit!26039 () Unit!26036)

(assert (=> b!754919 (= e!420970 Unit!26039)))

(assert (=> b!754919 false))

(declare-fun b!754920 () Bool)

(declare-fun res!510285 () Bool)

(assert (=> b!754920 (=> (not res!510285) (not e!420975))))

(assert (=> b!754920 (= res!510285 (= (seekEntryOrOpen!0 lt!335880 lt!335874 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335880 lt!335874 mask!3328)))))

(declare-fun b!754921 () Bool)

(assert (=> b!754921 (= e!420979 e!420973)))

(declare-fun res!510278 () Bool)

(assert (=> b!754921 (=> (not res!510278) (not e!420973))))

(declare-fun lt!335882 () SeekEntryResult!7669)

(assert (=> b!754921 (= res!510278 (or (= lt!335882 (MissingZero!7669 i!1173)) (= lt!335882 (MissingVacant!7669 i!1173))))))

(assert (=> b!754921 (= lt!335882 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!754922 () Bool)

(assert (=> b!754922 (= e!420969 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20072 a!3186) j!159) a!3186 mask!3328) (Found!7669 j!159)))))

(assert (= (and start!65726 res!510275) b!754906))

(assert (= (and b!754906 res!510273) b!754912))

(assert (= (and b!754912 res!510269) b!754909))

(assert (= (and b!754909 res!510272) b!754900))

(assert (= (and b!754900 res!510268) b!754921))

(assert (= (and b!754921 res!510278) b!754918))

(assert (= (and b!754918 res!510279) b!754917))

(assert (= (and b!754917 res!510270) b!754910))

(assert (= (and b!754910 res!510277) b!754905))

(assert (= (and b!754905 res!510283) b!754911))

(assert (= (and b!754911 res!510267) b!754907))

(assert (= (and b!754907 c!82697) b!754901))

(assert (= (and b!754907 (not c!82697)) b!754922))

(assert (= (and b!754907 res!510282) b!754915))

(assert (= (and b!754915 res!510274) b!754916))

(assert (= (and b!754916 res!510281) b!754908))

(assert (= (and b!754916 (not res!510276)) b!754914))

(assert (= (and b!754914 (not res!510284)) b!754904))

(assert (= (and b!754904 (not res!510271)) b!754913))

(assert (= (and b!754913 c!82698) b!754919))

(assert (= (and b!754913 (not c!82698)) b!754903))

(assert (= (and b!754913 res!510280) b!754920))

(assert (= (and b!754920 res!510285) b!754902))

(declare-fun m!702665 () Bool)

(assert (=> b!754921 m!702665))

(declare-fun m!702667 () Bool)

(assert (=> b!754908 m!702667))

(assert (=> b!754908 m!702667))

(declare-fun m!702669 () Bool)

(assert (=> b!754908 m!702669))

(assert (=> b!754914 m!702667))

(assert (=> b!754914 m!702667))

(declare-fun m!702671 () Bool)

(assert (=> b!754914 m!702671))

(declare-fun m!702673 () Bool)

(assert (=> b!754917 m!702673))

(declare-fun m!702675 () Bool)

(assert (=> b!754915 m!702675))

(declare-fun m!702677 () Bool)

(assert (=> b!754915 m!702677))

(declare-fun m!702679 () Bool)

(assert (=> b!754915 m!702679))

(declare-fun m!702681 () Bool)

(assert (=> b!754915 m!702681))

(assert (=> b!754915 m!702677))

(declare-fun m!702683 () Bool)

(assert (=> b!754915 m!702683))

(declare-fun m!702685 () Bool)

(assert (=> b!754900 m!702685))

(assert (=> b!754901 m!702667))

(assert (=> b!754901 m!702667))

(declare-fun m!702687 () Bool)

(assert (=> b!754901 m!702687))

(assert (=> b!754904 m!702679))

(declare-fun m!702689 () Bool)

(assert (=> b!754904 m!702689))

(assert (=> b!754916 m!702667))

(assert (=> b!754916 m!702667))

(declare-fun m!702691 () Bool)

(assert (=> b!754916 m!702691))

(declare-fun m!702693 () Bool)

(assert (=> b!754916 m!702693))

(declare-fun m!702695 () Bool)

(assert (=> b!754916 m!702695))

(assert (=> b!754912 m!702667))

(assert (=> b!754912 m!702667))

(declare-fun m!702697 () Bool)

(assert (=> b!754912 m!702697))

(assert (=> b!754905 m!702667))

(assert (=> b!754905 m!702667))

(declare-fun m!702699 () Bool)

(assert (=> b!754905 m!702699))

(assert (=> b!754905 m!702699))

(assert (=> b!754905 m!702667))

(declare-fun m!702701 () Bool)

(assert (=> b!754905 m!702701))

(declare-fun m!702703 () Bool)

(assert (=> b!754920 m!702703))

(declare-fun m!702705 () Bool)

(assert (=> b!754920 m!702705))

(declare-fun m!702707 () Bool)

(assert (=> b!754918 m!702707))

(assert (=> b!754922 m!702667))

(assert (=> b!754922 m!702667))

(assert (=> b!754922 m!702671))

(declare-fun m!702709 () Bool)

(assert (=> start!65726 m!702709))

(declare-fun m!702711 () Bool)

(assert (=> start!65726 m!702711))

(declare-fun m!702713 () Bool)

(assert (=> b!754911 m!702713))

(declare-fun m!702715 () Bool)

(assert (=> b!754909 m!702715))

(check-sat (not b!754921) (not b!754918) (not b!754914) (not b!754908) (not b!754917) (not b!754912) (not b!754916) (not b!754909) (not b!754900) (not b!754922) (not b!754901) (not b!754920) (not b!754905) (not start!65726) (not b!754915))
(check-sat)
