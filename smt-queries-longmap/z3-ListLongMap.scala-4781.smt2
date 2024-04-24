; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65874 () Bool)

(assert start!65874)

(declare-fun b!755895 () Bool)

(declare-fun res!510692 () Bool)

(declare-fun e!421601 () Bool)

(assert (=> b!755895 (=> (not res!510692) (not e!421601))))

(declare-datatypes ((array!41917 0))(
  ( (array!41918 (arr!20068 (Array (_ BitVec 32) (_ BitVec 64))) (size!20488 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41917)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755895 (= res!510692 (validKeyInArray!0 (select (arr!20068 a!3186) j!159)))))

(declare-fun b!755896 () Bool)

(declare-datatypes ((Unit!26053 0))(
  ( (Unit!26054) )
))
(declare-fun e!421602 () Unit!26053)

(declare-fun Unit!26055 () Unit!26053)

(assert (=> b!755896 (= e!421602 Unit!26055)))

(assert (=> b!755896 false))

(declare-fun b!755897 () Bool)

(declare-fun e!421608 () Bool)

(declare-datatypes ((SeekEntryResult!7624 0))(
  ( (MissingZero!7624 (index!32864 (_ BitVec 32))) (Found!7624 (index!32865 (_ BitVec 32))) (Intermediate!7624 (undefined!8436 Bool) (index!32866 (_ BitVec 32)) (x!63930 (_ BitVec 32))) (Undefined!7624) (MissingVacant!7624 (index!32867 (_ BitVec 32))) )
))
(declare-fun lt!336430 () SeekEntryResult!7624)

(declare-fun lt!336428 () SeekEntryResult!7624)

(assert (=> b!755897 (= e!421608 (= lt!336430 lt!336428))))

(declare-fun b!755898 () Bool)

(declare-fun res!510687 () Bool)

(declare-fun e!421605 () Bool)

(assert (=> b!755898 (=> (not res!510687) (not e!421605))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41917 (_ BitVec 32)) Bool)

(assert (=> b!755898 (= res!510687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755899 () Bool)

(declare-fun res!510698 () Bool)

(assert (=> b!755899 (=> (not res!510698) (not e!421608))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!336432 () (_ BitVec 64))

(declare-fun lt!336435 () array!41917)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41917 (_ BitVec 32)) SeekEntryResult!7624)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41917 (_ BitVec 32)) SeekEntryResult!7624)

(assert (=> b!755899 (= res!510698 (= (seekEntryOrOpen!0 lt!336432 lt!336435 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336432 lt!336435 mask!3328)))))

(declare-fun b!755900 () Bool)

(declare-fun e!421600 () Bool)

(declare-fun e!421604 () Bool)

(assert (=> b!755900 (= e!421600 e!421604)))

(declare-fun res!510695 () Bool)

(assert (=> b!755900 (=> (not res!510695) (not e!421604))))

(declare-fun lt!336433 () SeekEntryResult!7624)

(declare-fun lt!336436 () SeekEntryResult!7624)

(assert (=> b!755900 (= res!510695 (= lt!336433 lt!336436))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41917 (_ BitVec 32)) SeekEntryResult!7624)

(assert (=> b!755900 (= lt!336436 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336432 lt!336435 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755900 (= lt!336433 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336432 mask!3328) lt!336432 lt!336435 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!755900 (= lt!336432 (select (store (arr!20068 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!755900 (= lt!336435 (array!41918 (store (arr!20068 a!3186) i!1173 k0!2102) (size!20488 a!3186)))))

(declare-fun b!755901 () Bool)

(declare-fun res!510688 () Bool)

(assert (=> b!755901 (=> (not res!510688) (not e!421605))))

(declare-datatypes ((List!13977 0))(
  ( (Nil!13974) (Cons!13973 (h!15051 (_ BitVec 64)) (t!20284 List!13977)) )
))
(declare-fun arrayNoDuplicates!0 (array!41917 (_ BitVec 32) List!13977) Bool)

(assert (=> b!755901 (= res!510688 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13974))))

(declare-fun b!755902 () Bool)

(declare-fun res!510696 () Bool)

(assert (=> b!755902 (=> (not res!510696) (not e!421600))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!755902 (= res!510696 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20068 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755903 () Bool)

(declare-fun e!421609 () Bool)

(assert (=> b!755903 (= e!421609 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20068 a!3186) j!159) a!3186 mask!3328) (Found!7624 j!159)))))

(declare-fun b!755904 () Bool)

(declare-fun Unit!26056 () Unit!26053)

(assert (=> b!755904 (= e!421602 Unit!26056)))

(declare-fun b!755905 () Bool)

(declare-fun e!421611 () Bool)

(declare-fun e!421607 () Bool)

(assert (=> b!755905 (= e!421611 e!421607)))

(declare-fun res!510690 () Bool)

(assert (=> b!755905 (=> res!510690 e!421607)))

(declare-fun lt!336427 () SeekEntryResult!7624)

(assert (=> b!755905 (= res!510690 (not (= lt!336428 lt!336427)))))

(assert (=> b!755905 (= lt!336428 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20068 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!510693 () Bool)

(assert (=> start!65874 (=> (not res!510693) (not e!421601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65874 (= res!510693 (validMask!0 mask!3328))))

(assert (=> start!65874 e!421601))

(assert (=> start!65874 true))

(declare-fun array_inv!15927 (array!41917) Bool)

(assert (=> start!65874 (array_inv!15927 a!3186)))

(declare-fun b!755906 () Bool)

(declare-fun res!510682 () Bool)

(assert (=> b!755906 (=> (not res!510682) (not e!421601))))

(assert (=> b!755906 (= res!510682 (and (= (size!20488 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20488 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20488 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755907 () Bool)

(assert (=> b!755907 (= e!421601 e!421605)))

(declare-fun res!510686 () Bool)

(assert (=> b!755907 (=> (not res!510686) (not e!421605))))

(declare-fun lt!336437 () SeekEntryResult!7624)

(assert (=> b!755907 (= res!510686 (or (= lt!336437 (MissingZero!7624 i!1173)) (= lt!336437 (MissingVacant!7624 i!1173))))))

(assert (=> b!755907 (= lt!336437 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!755908 () Bool)

(declare-fun res!510683 () Bool)

(assert (=> b!755908 (=> (not res!510683) (not e!421600))))

(assert (=> b!755908 (= res!510683 e!421609)))

(declare-fun c!82991 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!755908 (= c!82991 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755909 () Bool)

(declare-fun res!510700 () Bool)

(assert (=> b!755909 (=> (not res!510700) (not e!421601))))

(declare-fun arrayContainsKey!0 (array!41917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755909 (= res!510700 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755910 () Bool)

(assert (=> b!755910 (= e!421605 e!421600)))

(declare-fun res!510685 () Bool)

(assert (=> b!755910 (=> (not res!510685) (not e!421600))))

(declare-fun lt!336438 () SeekEntryResult!7624)

(assert (=> b!755910 (= res!510685 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20068 a!3186) j!159) mask!3328) (select (arr!20068 a!3186) j!159) a!3186 mask!3328) lt!336438))))

(assert (=> b!755910 (= lt!336438 (Intermediate!7624 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755911 () Bool)

(declare-fun e!421606 () Bool)

(assert (=> b!755911 (= e!421606 true)))

(assert (=> b!755911 e!421608))

(declare-fun res!510699 () Bool)

(assert (=> b!755911 (=> (not res!510699) (not e!421608))))

(declare-fun lt!336434 () (_ BitVec 64))

(assert (=> b!755911 (= res!510699 (= lt!336434 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336431 () Unit!26053)

(assert (=> b!755911 (= lt!336431 e!421602)))

(declare-fun c!82990 () Bool)

(assert (=> b!755911 (= c!82990 (= lt!336434 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755912 () Bool)

(assert (=> b!755912 (= e!421609 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20068 a!3186) j!159) a!3186 mask!3328) lt!336438))))

(declare-fun b!755913 () Bool)

(assert (=> b!755913 (= e!421604 (not e!421611))))

(declare-fun res!510684 () Bool)

(assert (=> b!755913 (=> res!510684 e!421611)))

(get-info :version)

(assert (=> b!755913 (= res!510684 (or (not ((_ is Intermediate!7624) lt!336436)) (bvslt x!1131 (x!63930 lt!336436)) (not (= x!1131 (x!63930 lt!336436))) (not (= index!1321 (index!32866 lt!336436)))))))

(declare-fun e!421603 () Bool)

(assert (=> b!755913 e!421603))

(declare-fun res!510694 () Bool)

(assert (=> b!755913 (=> (not res!510694) (not e!421603))))

(assert (=> b!755913 (= res!510694 (= lt!336430 lt!336427))))

(assert (=> b!755913 (= lt!336427 (Found!7624 j!159))))

(assert (=> b!755913 (= lt!336430 (seekEntryOrOpen!0 (select (arr!20068 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!755913 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336429 () Unit!26053)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41917 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26053)

(assert (=> b!755913 (= lt!336429 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755914 () Bool)

(assert (=> b!755914 (= e!421603 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20068 a!3186) j!159) a!3186 mask!3328) lt!336427))))

(declare-fun b!755915 () Bool)

(declare-fun res!510691 () Bool)

(assert (=> b!755915 (=> (not res!510691) (not e!421605))))

(assert (=> b!755915 (= res!510691 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20488 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20488 a!3186))))))

(declare-fun b!755916 () Bool)

(declare-fun res!510697 () Bool)

(assert (=> b!755916 (=> (not res!510697) (not e!421601))))

(assert (=> b!755916 (= res!510697 (validKeyInArray!0 k0!2102))))

(declare-fun b!755917 () Bool)

(assert (=> b!755917 (= e!421607 e!421606)))

(declare-fun res!510689 () Bool)

(assert (=> b!755917 (=> res!510689 e!421606)))

(assert (=> b!755917 (= res!510689 (= lt!336434 lt!336432))))

(assert (=> b!755917 (= lt!336434 (select (store (arr!20068 a!3186) i!1173 k0!2102) index!1321))))

(assert (= (and start!65874 res!510693) b!755906))

(assert (= (and b!755906 res!510682) b!755895))

(assert (= (and b!755895 res!510692) b!755916))

(assert (= (and b!755916 res!510697) b!755909))

(assert (= (and b!755909 res!510700) b!755907))

(assert (= (and b!755907 res!510686) b!755898))

(assert (= (and b!755898 res!510687) b!755901))

(assert (= (and b!755901 res!510688) b!755915))

(assert (= (and b!755915 res!510691) b!755910))

(assert (= (and b!755910 res!510685) b!755902))

(assert (= (and b!755902 res!510696) b!755908))

(assert (= (and b!755908 c!82991) b!755912))

(assert (= (and b!755908 (not c!82991)) b!755903))

(assert (= (and b!755908 res!510683) b!755900))

(assert (= (and b!755900 res!510695) b!755913))

(assert (= (and b!755913 res!510694) b!755914))

(assert (= (and b!755913 (not res!510684)) b!755905))

(assert (= (and b!755905 (not res!510690)) b!755917))

(assert (= (and b!755917 (not res!510689)) b!755911))

(assert (= (and b!755911 c!82990) b!755896))

(assert (= (and b!755911 (not c!82990)) b!755904))

(assert (= (and b!755911 res!510699) b!755899))

(assert (= (and b!755899 res!510698) b!755897))

(declare-fun m!704583 () Bool)

(assert (=> b!755913 m!704583))

(assert (=> b!755913 m!704583))

(declare-fun m!704585 () Bool)

(assert (=> b!755913 m!704585))

(declare-fun m!704587 () Bool)

(assert (=> b!755913 m!704587))

(declare-fun m!704589 () Bool)

(assert (=> b!755913 m!704589))

(declare-fun m!704591 () Bool)

(assert (=> b!755917 m!704591))

(declare-fun m!704593 () Bool)

(assert (=> b!755917 m!704593))

(declare-fun m!704595 () Bool)

(assert (=> b!755902 m!704595))

(declare-fun m!704597 () Bool)

(assert (=> b!755901 m!704597))

(declare-fun m!704599 () Bool)

(assert (=> b!755909 m!704599))

(assert (=> b!755905 m!704583))

(assert (=> b!755905 m!704583))

(declare-fun m!704601 () Bool)

(assert (=> b!755905 m!704601))

(declare-fun m!704603 () Bool)

(assert (=> b!755898 m!704603))

(declare-fun m!704605 () Bool)

(assert (=> start!65874 m!704605))

(declare-fun m!704607 () Bool)

(assert (=> start!65874 m!704607))

(assert (=> b!755910 m!704583))

(assert (=> b!755910 m!704583))

(declare-fun m!704609 () Bool)

(assert (=> b!755910 m!704609))

(assert (=> b!755910 m!704609))

(assert (=> b!755910 m!704583))

(declare-fun m!704611 () Bool)

(assert (=> b!755910 m!704611))

(declare-fun m!704613 () Bool)

(assert (=> b!755900 m!704613))

(declare-fun m!704615 () Bool)

(assert (=> b!755900 m!704615))

(declare-fun m!704617 () Bool)

(assert (=> b!755900 m!704617))

(assert (=> b!755900 m!704591))

(assert (=> b!755900 m!704615))

(declare-fun m!704619 () Bool)

(assert (=> b!755900 m!704619))

(assert (=> b!755912 m!704583))

(assert (=> b!755912 m!704583))

(declare-fun m!704621 () Bool)

(assert (=> b!755912 m!704621))

(declare-fun m!704623 () Bool)

(assert (=> b!755899 m!704623))

(declare-fun m!704625 () Bool)

(assert (=> b!755899 m!704625))

(assert (=> b!755895 m!704583))

(assert (=> b!755895 m!704583))

(declare-fun m!704627 () Bool)

(assert (=> b!755895 m!704627))

(declare-fun m!704629 () Bool)

(assert (=> b!755907 m!704629))

(assert (=> b!755903 m!704583))

(assert (=> b!755903 m!704583))

(assert (=> b!755903 m!704601))

(declare-fun m!704631 () Bool)

(assert (=> b!755916 m!704631))

(assert (=> b!755914 m!704583))

(assert (=> b!755914 m!704583))

(declare-fun m!704633 () Bool)

(assert (=> b!755914 m!704633))

(check-sat (not b!755903) (not b!755909) (not b!755913) (not b!755901) (not b!755912) (not b!755916) (not b!755900) (not b!755907) (not b!755898) (not b!755899) (not b!755914) (not b!755895) (not b!755905) (not b!755910) (not start!65874))
(check-sat)
