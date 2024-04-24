; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65952 () Bool)

(assert start!65952)

(declare-fun b!758586 () Bool)

(declare-fun res!512909 () Bool)

(declare-fun e!423006 () Bool)

(assert (=> b!758586 (=> (not res!512909) (not e!423006))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41995 0))(
  ( (array!41996 (arr!20107 (Array (_ BitVec 32) (_ BitVec 64))) (size!20527 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41995)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758586 (= res!512909 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20527 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20527 a!3186))))))

(declare-fun b!758587 () Bool)

(declare-datatypes ((Unit!26209 0))(
  ( (Unit!26210) )
))
(declare-fun e!423009 () Unit!26209)

(declare-fun Unit!26211 () Unit!26209)

(assert (=> b!758587 (= e!423009 Unit!26211)))

(declare-fun b!758588 () Bool)

(declare-fun e!423012 () Bool)

(assert (=> b!758588 (= e!423006 e!423012)))

(declare-fun res!512918 () Bool)

(assert (=> b!758588 (=> (not res!512918) (not e!423012))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7663 0))(
  ( (MissingZero!7663 (index!33020 (_ BitVec 32))) (Found!7663 (index!33021 (_ BitVec 32))) (Intermediate!7663 (undefined!8475 Bool) (index!33022 (_ BitVec 32)) (x!64073 (_ BitVec 32))) (Undefined!7663) (MissingVacant!7663 (index!33023 (_ BitVec 32))) )
))
(declare-fun lt!337837 () SeekEntryResult!7663)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41995 (_ BitVec 32)) SeekEntryResult!7663)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758588 (= res!512918 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20107 a!3186) j!159) mask!3328) (select (arr!20107 a!3186) j!159) a!3186 mask!3328) lt!337837))))

(assert (=> b!758588 (= lt!337837 (Intermediate!7663 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!512922 () Bool)

(declare-fun e!423008 () Bool)

(assert (=> start!65952 (=> (not res!512922) (not e!423008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65952 (= res!512922 (validMask!0 mask!3328))))

(assert (=> start!65952 e!423008))

(assert (=> start!65952 true))

(declare-fun array_inv!15966 (array!41995) Bool)

(assert (=> start!65952 (array_inv!15966 a!3186)))

(declare-fun e!423005 () Bool)

(declare-fun b!758589 () Bool)

(assert (=> b!758589 (= e!423005 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20107 a!3186) j!159) a!3186 mask!3328) lt!337837))))

(declare-fun b!758590 () Bool)

(assert (=> b!758590 (= e!423008 e!423006)))

(declare-fun res!512908 () Bool)

(assert (=> b!758590 (=> (not res!512908) (not e!423006))))

(declare-fun lt!337836 () SeekEntryResult!7663)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!758590 (= res!512908 (or (= lt!337836 (MissingZero!7663 i!1173)) (= lt!337836 (MissingVacant!7663 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41995 (_ BitVec 32)) SeekEntryResult!7663)

(assert (=> b!758590 (= lt!337836 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!758591 () Bool)

(declare-fun res!512923 () Bool)

(assert (=> b!758591 (=> (not res!512923) (not e!423012))))

(assert (=> b!758591 (= res!512923 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20107 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758592 () Bool)

(declare-fun res!512919 () Bool)

(assert (=> b!758592 (=> (not res!512919) (not e!423008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758592 (= res!512919 (validKeyInArray!0 k0!2102))))

(declare-fun b!758593 () Bool)

(declare-fun Unit!26212 () Unit!26209)

(assert (=> b!758593 (= e!423009 Unit!26212)))

(assert (=> b!758593 false))

(declare-fun b!758594 () Bool)

(declare-fun e!423015 () Bool)

(declare-fun e!423004 () Bool)

(assert (=> b!758594 (= e!423015 e!423004)))

(declare-fun res!512917 () Bool)

(assert (=> b!758594 (=> res!512917 e!423004)))

(declare-fun lt!337832 () SeekEntryResult!7663)

(declare-fun lt!337834 () SeekEntryResult!7663)

(assert (=> b!758594 (= res!512917 (not (= lt!337832 lt!337834)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41995 (_ BitVec 32)) SeekEntryResult!7663)

(assert (=> b!758594 (= lt!337832 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20107 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758595 () Bool)

(declare-fun res!512905 () Bool)

(assert (=> b!758595 (=> (not res!512905) (not e!423006))))

(declare-datatypes ((List!14016 0))(
  ( (Nil!14013) (Cons!14012 (h!15090 (_ BitVec 64)) (t!20323 List!14016)) )
))
(declare-fun arrayNoDuplicates!0 (array!41995 (_ BitVec 32) List!14016) Bool)

(assert (=> b!758595 (= res!512905 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14013))))

(declare-fun b!758596 () Bool)

(declare-fun res!512921 () Bool)

(assert (=> b!758596 (=> (not res!512921) (not e!423008))))

(declare-fun arrayContainsKey!0 (array!41995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758596 (= res!512921 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758597 () Bool)

(declare-fun res!512915 () Bool)

(assert (=> b!758597 (=> (not res!512915) (not e!423008))))

(assert (=> b!758597 (= res!512915 (and (= (size!20527 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20527 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20527 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758598 () Bool)

(declare-fun e!423014 () Bool)

(assert (=> b!758598 (= e!423014 (not e!423015))))

(declare-fun res!512916 () Bool)

(assert (=> b!758598 (=> res!512916 e!423015)))

(declare-fun lt!337842 () SeekEntryResult!7663)

(get-info :version)

(assert (=> b!758598 (= res!512916 (or (not ((_ is Intermediate!7663) lt!337842)) (bvslt x!1131 (x!64073 lt!337842)) (not (= x!1131 (x!64073 lt!337842))) (not (= index!1321 (index!33022 lt!337842)))))))

(declare-fun e!423007 () Bool)

(assert (=> b!758598 e!423007))

(declare-fun res!512907 () Bool)

(assert (=> b!758598 (=> (not res!512907) (not e!423007))))

(declare-fun lt!337835 () SeekEntryResult!7663)

(assert (=> b!758598 (= res!512907 (= lt!337835 lt!337834))))

(assert (=> b!758598 (= lt!337834 (Found!7663 j!159))))

(assert (=> b!758598 (= lt!337835 (seekEntryOrOpen!0 (select (arr!20107 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41995 (_ BitVec 32)) Bool)

(assert (=> b!758598 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337838 () Unit!26209)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41995 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26209)

(assert (=> b!758598 (= lt!337838 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758599 () Bool)

(declare-fun e!423010 () Bool)

(assert (=> b!758599 (= e!423010 true)))

(declare-fun e!423013 () Bool)

(assert (=> b!758599 e!423013))

(declare-fun res!512906 () Bool)

(assert (=> b!758599 (=> (not res!512906) (not e!423013))))

(declare-fun lt!337833 () (_ BitVec 64))

(assert (=> b!758599 (= res!512906 (= lt!337833 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337840 () Unit!26209)

(assert (=> b!758599 (= lt!337840 e!423009)))

(declare-fun c!83224 () Bool)

(assert (=> b!758599 (= c!83224 (= lt!337833 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758600 () Bool)

(assert (=> b!758600 (= e!423005 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20107 a!3186) j!159) a!3186 mask!3328) (Found!7663 j!159)))))

(declare-fun b!758601 () Bool)

(declare-fun res!512920 () Bool)

(assert (=> b!758601 (=> (not res!512920) (not e!423012))))

(assert (=> b!758601 (= res!512920 e!423005)))

(declare-fun c!83225 () Bool)

(assert (=> b!758601 (= c!83225 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758602 () Bool)

(declare-fun res!512912 () Bool)

(assert (=> b!758602 (=> (not res!512912) (not e!423008))))

(assert (=> b!758602 (= res!512912 (validKeyInArray!0 (select (arr!20107 a!3186) j!159)))))

(declare-fun b!758603 () Bool)

(declare-fun res!512913 () Bool)

(assert (=> b!758603 (=> (not res!512913) (not e!423013))))

(declare-fun lt!337839 () (_ BitVec 64))

(declare-fun lt!337841 () array!41995)

(assert (=> b!758603 (= res!512913 (= (seekEntryOrOpen!0 lt!337839 lt!337841 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337839 lt!337841 mask!3328)))))

(declare-fun b!758604 () Bool)

(assert (=> b!758604 (= e!423004 e!423010)))

(declare-fun res!512910 () Bool)

(assert (=> b!758604 (=> res!512910 e!423010)))

(assert (=> b!758604 (= res!512910 (= lt!337833 lt!337839))))

(assert (=> b!758604 (= lt!337833 (select (store (arr!20107 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!758605 () Bool)

(declare-fun res!512914 () Bool)

(assert (=> b!758605 (=> (not res!512914) (not e!423006))))

(assert (=> b!758605 (= res!512914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758606 () Bool)

(assert (=> b!758606 (= e!423013 (= lt!337835 lt!337832))))

(declare-fun b!758607 () Bool)

(assert (=> b!758607 (= e!423012 e!423014)))

(declare-fun res!512911 () Bool)

(assert (=> b!758607 (=> (not res!512911) (not e!423014))))

(declare-fun lt!337831 () SeekEntryResult!7663)

(assert (=> b!758607 (= res!512911 (= lt!337831 lt!337842))))

(assert (=> b!758607 (= lt!337842 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337839 lt!337841 mask!3328))))

(assert (=> b!758607 (= lt!337831 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337839 mask!3328) lt!337839 lt!337841 mask!3328))))

(assert (=> b!758607 (= lt!337839 (select (store (arr!20107 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!758607 (= lt!337841 (array!41996 (store (arr!20107 a!3186) i!1173 k0!2102) (size!20527 a!3186)))))

(declare-fun b!758608 () Bool)

(assert (=> b!758608 (= e!423007 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20107 a!3186) j!159) a!3186 mask!3328) lt!337834))))

(assert (= (and start!65952 res!512922) b!758597))

(assert (= (and b!758597 res!512915) b!758602))

(assert (= (and b!758602 res!512912) b!758592))

(assert (= (and b!758592 res!512919) b!758596))

(assert (= (and b!758596 res!512921) b!758590))

(assert (= (and b!758590 res!512908) b!758605))

(assert (= (and b!758605 res!512914) b!758595))

(assert (= (and b!758595 res!512905) b!758586))

(assert (= (and b!758586 res!512909) b!758588))

(assert (= (and b!758588 res!512918) b!758591))

(assert (= (and b!758591 res!512923) b!758601))

(assert (= (and b!758601 c!83225) b!758589))

(assert (= (and b!758601 (not c!83225)) b!758600))

(assert (= (and b!758601 res!512920) b!758607))

(assert (= (and b!758607 res!512911) b!758598))

(assert (= (and b!758598 res!512907) b!758608))

(assert (= (and b!758598 (not res!512916)) b!758594))

(assert (= (and b!758594 (not res!512917)) b!758604))

(assert (= (and b!758604 (not res!512910)) b!758599))

(assert (= (and b!758599 c!83224) b!758593))

(assert (= (and b!758599 (not c!83224)) b!758587))

(assert (= (and b!758599 res!512906) b!758603))

(assert (= (and b!758603 res!512913) b!758606))

(declare-fun m!706611 () Bool)

(assert (=> b!758590 m!706611))

(declare-fun m!706613 () Bool)

(assert (=> b!758603 m!706613))

(declare-fun m!706615 () Bool)

(assert (=> b!758603 m!706615))

(declare-fun m!706617 () Bool)

(assert (=> b!758605 m!706617))

(declare-fun m!706619 () Bool)

(assert (=> b!758602 m!706619))

(assert (=> b!758602 m!706619))

(declare-fun m!706621 () Bool)

(assert (=> b!758602 m!706621))

(assert (=> b!758608 m!706619))

(assert (=> b!758608 m!706619))

(declare-fun m!706623 () Bool)

(assert (=> b!758608 m!706623))

(assert (=> b!758598 m!706619))

(assert (=> b!758598 m!706619))

(declare-fun m!706625 () Bool)

(assert (=> b!758598 m!706625))

(declare-fun m!706627 () Bool)

(assert (=> b!758598 m!706627))

(declare-fun m!706629 () Bool)

(assert (=> b!758598 m!706629))

(assert (=> b!758589 m!706619))

(assert (=> b!758589 m!706619))

(declare-fun m!706631 () Bool)

(assert (=> b!758589 m!706631))

(declare-fun m!706633 () Bool)

(assert (=> b!758591 m!706633))

(assert (=> b!758588 m!706619))

(assert (=> b!758588 m!706619))

(declare-fun m!706635 () Bool)

(assert (=> b!758588 m!706635))

(assert (=> b!758588 m!706635))

(assert (=> b!758588 m!706619))

(declare-fun m!706637 () Bool)

(assert (=> b!758588 m!706637))

(declare-fun m!706639 () Bool)

(assert (=> start!65952 m!706639))

(declare-fun m!706641 () Bool)

(assert (=> start!65952 m!706641))

(declare-fun m!706643 () Bool)

(assert (=> b!758607 m!706643))

(declare-fun m!706645 () Bool)

(assert (=> b!758607 m!706645))

(declare-fun m!706647 () Bool)

(assert (=> b!758607 m!706647))

(declare-fun m!706649 () Bool)

(assert (=> b!758607 m!706649))

(declare-fun m!706651 () Bool)

(assert (=> b!758607 m!706651))

(assert (=> b!758607 m!706649))

(assert (=> b!758594 m!706619))

(assert (=> b!758594 m!706619))

(declare-fun m!706653 () Bool)

(assert (=> b!758594 m!706653))

(assert (=> b!758600 m!706619))

(assert (=> b!758600 m!706619))

(assert (=> b!758600 m!706653))

(declare-fun m!706655 () Bool)

(assert (=> b!758596 m!706655))

(declare-fun m!706657 () Bool)

(assert (=> b!758592 m!706657))

(declare-fun m!706659 () Bool)

(assert (=> b!758595 m!706659))

(assert (=> b!758604 m!706645))

(declare-fun m!706661 () Bool)

(assert (=> b!758604 m!706661))

(check-sat (not b!758608) (not b!758605) (not b!758588) (not b!758595) (not b!758602) (not b!758590) (not b!758589) (not start!65952) (not b!758603) (not b!758592) (not b!758594) (not b!758596) (not b!758598) (not b!758600) (not b!758607))
(check-sat)
