; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65730 () Bool)

(assert start!65730)

(declare-fun b!754598 () Bool)

(declare-fun res!509926 () Bool)

(declare-fun e!420834 () Bool)

(assert (=> b!754598 (=> (not res!509926) (not e!420834))))

(declare-datatypes ((array!41903 0))(
  ( (array!41904 (arr!20065 (Array (_ BitVec 32) (_ BitVec 64))) (size!20486 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41903)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754598 (= res!509926 (validKeyInArray!0 (select (arr!20065 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!420835 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!754599 () Bool)

(declare-datatypes ((SeekEntryResult!7665 0))(
  ( (MissingZero!7665 (index!33028 (_ BitVec 32))) (Found!7665 (index!33029 (_ BitVec 32))) (Intermediate!7665 (undefined!8477 Bool) (index!33030 (_ BitVec 32)) (x!63935 (_ BitVec 32))) (Undefined!7665) (MissingVacant!7665 (index!33031 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41903 (_ BitVec 32)) SeekEntryResult!7665)

(assert (=> b!754599 (= e!420835 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20065 a!3186) j!159) a!3186 mask!3328) (Found!7665 j!159)))))

(declare-fun b!754600 () Bool)

(declare-fun res!509922 () Bool)

(assert (=> b!754600 (=> (not res!509922) (not e!420834))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754600 (= res!509922 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754601 () Bool)

(declare-fun e!420843 () Bool)

(declare-fun e!420842 () Bool)

(assert (=> b!754601 (= e!420843 e!420842)))

(declare-fun res!509936 () Bool)

(assert (=> b!754601 (=> res!509936 e!420842)))

(declare-fun lt!335834 () SeekEntryResult!7665)

(declare-fun lt!335831 () SeekEntryResult!7665)

(assert (=> b!754601 (= res!509936 (not (= lt!335834 lt!335831)))))

(assert (=> b!754601 (= lt!335834 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20065 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754602 () Bool)

(declare-fun e!420839 () Bool)

(assert (=> b!754602 (= e!420839 true)))

(declare-fun e!420845 () Bool)

(assert (=> b!754602 e!420845))

(declare-fun res!509923 () Bool)

(assert (=> b!754602 (=> (not res!509923) (not e!420845))))

(declare-fun lt!335828 () (_ BitVec 64))

(assert (=> b!754602 (= res!509923 (= lt!335828 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26040 0))(
  ( (Unit!26041) )
))
(declare-fun lt!335836 () Unit!26040)

(declare-fun e!420840 () Unit!26040)

(assert (=> b!754602 (= lt!335836 e!420840)))

(declare-fun c!82720 () Bool)

(assert (=> b!754602 (= c!82720 (= lt!335828 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754603 () Bool)

(declare-fun e!420841 () Bool)

(declare-fun e!420844 () Bool)

(assert (=> b!754603 (= e!420841 e!420844)))

(declare-fun res!509933 () Bool)

(assert (=> b!754603 (=> (not res!509933) (not e!420844))))

(declare-fun lt!335835 () SeekEntryResult!7665)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41903 (_ BitVec 32)) SeekEntryResult!7665)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754603 (= res!509933 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20065 a!3186) j!159) mask!3328) (select (arr!20065 a!3186) j!159) a!3186 mask!3328) lt!335835))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754603 (= lt!335835 (Intermediate!7665 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754604 () Bool)

(declare-fun Unit!26042 () Unit!26040)

(assert (=> b!754604 (= e!420840 Unit!26042)))

(declare-fun b!754605 () Bool)

(declare-fun res!509931 () Bool)

(assert (=> b!754605 (=> (not res!509931) (not e!420834))))

(assert (=> b!754605 (= res!509931 (validKeyInArray!0 k0!2102))))

(declare-fun e!420837 () Bool)

(declare-fun b!754606 () Bool)

(assert (=> b!754606 (= e!420837 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20065 a!3186) j!159) a!3186 mask!3328) lt!335831))))

(declare-fun res!509932 () Bool)

(assert (=> start!65730 (=> (not res!509932) (not e!420834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65730 (= res!509932 (validMask!0 mask!3328))))

(assert (=> start!65730 e!420834))

(assert (=> start!65730 true))

(declare-fun array_inv!15861 (array!41903) Bool)

(assert (=> start!65730 (array_inv!15861 a!3186)))

(declare-fun b!754607 () Bool)

(declare-fun res!509925 () Bool)

(assert (=> b!754607 (=> (not res!509925) (not e!420844))))

(assert (=> b!754607 (= res!509925 e!420835)))

(declare-fun c!82719 () Bool)

(assert (=> b!754607 (= c!82719 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754608 () Bool)

(declare-fun res!509929 () Bool)

(assert (=> b!754608 (=> (not res!509929) (not e!420834))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754608 (= res!509929 (and (= (size!20486 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20486 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20486 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754609 () Bool)

(assert (=> b!754609 (= e!420835 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20065 a!3186) j!159) a!3186 mask!3328) lt!335835))))

(declare-fun b!754610 () Bool)

(declare-fun res!509934 () Bool)

(assert (=> b!754610 (=> (not res!509934) (not e!420841))))

(assert (=> b!754610 (= res!509934 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20486 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20486 a!3186))))))

(declare-fun b!754611 () Bool)

(assert (=> b!754611 (= e!420834 e!420841)))

(declare-fun res!509921 () Bool)

(assert (=> b!754611 (=> (not res!509921) (not e!420841))))

(declare-fun lt!335830 () SeekEntryResult!7665)

(assert (=> b!754611 (= res!509921 (or (= lt!335830 (MissingZero!7665 i!1173)) (= lt!335830 (MissingVacant!7665 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41903 (_ BitVec 32)) SeekEntryResult!7665)

(assert (=> b!754611 (= lt!335830 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!754612 () Bool)

(declare-fun res!509928 () Bool)

(assert (=> b!754612 (=> (not res!509928) (not e!420841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41903 (_ BitVec 32)) Bool)

(assert (=> b!754612 (= res!509928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754613 () Bool)

(declare-fun res!509930 () Bool)

(assert (=> b!754613 (=> (not res!509930) (not e!420841))))

(declare-datatypes ((List!14067 0))(
  ( (Nil!14064) (Cons!14063 (h!15135 (_ BitVec 64)) (t!20382 List!14067)) )
))
(declare-fun arrayNoDuplicates!0 (array!41903 (_ BitVec 32) List!14067) Bool)

(assert (=> b!754613 (= res!509930 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14064))))

(declare-fun b!754614 () Bool)

(declare-fun e!420836 () Bool)

(assert (=> b!754614 (= e!420844 e!420836)))

(declare-fun res!509937 () Bool)

(assert (=> b!754614 (=> (not res!509937) (not e!420836))))

(declare-fun lt!335837 () SeekEntryResult!7665)

(declare-fun lt!335829 () SeekEntryResult!7665)

(assert (=> b!754614 (= res!509937 (= lt!335837 lt!335829))))

(declare-fun lt!335826 () array!41903)

(declare-fun lt!335827 () (_ BitVec 64))

(assert (=> b!754614 (= lt!335829 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335827 lt!335826 mask!3328))))

(assert (=> b!754614 (= lt!335837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335827 mask!3328) lt!335827 lt!335826 mask!3328))))

(assert (=> b!754614 (= lt!335827 (select (store (arr!20065 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!754614 (= lt!335826 (array!41904 (store (arr!20065 a!3186) i!1173 k0!2102) (size!20486 a!3186)))))

(declare-fun b!754615 () Bool)

(declare-fun lt!335833 () SeekEntryResult!7665)

(assert (=> b!754615 (= e!420845 (= lt!335833 lt!335834))))

(declare-fun b!754616 () Bool)

(assert (=> b!754616 (= e!420836 (not e!420843))))

(declare-fun res!509935 () Bool)

(assert (=> b!754616 (=> res!509935 e!420843)))

(get-info :version)

(assert (=> b!754616 (= res!509935 (or (not ((_ is Intermediate!7665) lt!335829)) (bvslt x!1131 (x!63935 lt!335829)) (not (= x!1131 (x!63935 lt!335829))) (not (= index!1321 (index!33030 lt!335829)))))))

(assert (=> b!754616 e!420837))

(declare-fun res!509924 () Bool)

(assert (=> b!754616 (=> (not res!509924) (not e!420837))))

(assert (=> b!754616 (= res!509924 (= lt!335833 lt!335831))))

(assert (=> b!754616 (= lt!335831 (Found!7665 j!159))))

(assert (=> b!754616 (= lt!335833 (seekEntryOrOpen!0 (select (arr!20065 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!754616 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335832 () Unit!26040)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41903 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26040)

(assert (=> b!754616 (= lt!335832 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754617 () Bool)

(declare-fun res!509938 () Bool)

(assert (=> b!754617 (=> (not res!509938) (not e!420844))))

(assert (=> b!754617 (= res!509938 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20065 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754618 () Bool)

(assert (=> b!754618 (= e!420842 e!420839)))

(declare-fun res!509927 () Bool)

(assert (=> b!754618 (=> res!509927 e!420839)))

(assert (=> b!754618 (= res!509927 (= lt!335828 lt!335827))))

(assert (=> b!754618 (= lt!335828 (select (store (arr!20065 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!754619 () Bool)

(declare-fun res!509939 () Bool)

(assert (=> b!754619 (=> (not res!509939) (not e!420845))))

(assert (=> b!754619 (= res!509939 (= (seekEntryOrOpen!0 lt!335827 lt!335826 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335827 lt!335826 mask!3328)))))

(declare-fun b!754620 () Bool)

(declare-fun Unit!26043 () Unit!26040)

(assert (=> b!754620 (= e!420840 Unit!26043)))

(assert (=> b!754620 false))

(assert (= (and start!65730 res!509932) b!754608))

(assert (= (and b!754608 res!509929) b!754598))

(assert (= (and b!754598 res!509926) b!754605))

(assert (= (and b!754605 res!509931) b!754600))

(assert (= (and b!754600 res!509922) b!754611))

(assert (= (and b!754611 res!509921) b!754612))

(assert (= (and b!754612 res!509928) b!754613))

(assert (= (and b!754613 res!509930) b!754610))

(assert (= (and b!754610 res!509934) b!754603))

(assert (= (and b!754603 res!509933) b!754617))

(assert (= (and b!754617 res!509938) b!754607))

(assert (= (and b!754607 c!82719) b!754609))

(assert (= (and b!754607 (not c!82719)) b!754599))

(assert (= (and b!754607 res!509925) b!754614))

(assert (= (and b!754614 res!509937) b!754616))

(assert (= (and b!754616 res!509924) b!754606))

(assert (= (and b!754616 (not res!509935)) b!754601))

(assert (= (and b!754601 (not res!509936)) b!754618))

(assert (= (and b!754618 (not res!509927)) b!754602))

(assert (= (and b!754602 c!82720) b!754620))

(assert (= (and b!754602 (not c!82720)) b!754604))

(assert (= (and b!754602 res!509923) b!754619))

(assert (= (and b!754619 res!509939) b!754615))

(declare-fun m!703007 () Bool)

(assert (=> b!754618 m!703007))

(declare-fun m!703009 () Bool)

(assert (=> b!754618 m!703009))

(declare-fun m!703011 () Bool)

(assert (=> b!754605 m!703011))

(declare-fun m!703013 () Bool)

(assert (=> b!754606 m!703013))

(assert (=> b!754606 m!703013))

(declare-fun m!703015 () Bool)

(assert (=> b!754606 m!703015))

(declare-fun m!703017 () Bool)

(assert (=> b!754613 m!703017))

(declare-fun m!703019 () Bool)

(assert (=> b!754600 m!703019))

(declare-fun m!703021 () Bool)

(assert (=> start!65730 m!703021))

(declare-fun m!703023 () Bool)

(assert (=> start!65730 m!703023))

(assert (=> b!754616 m!703013))

(assert (=> b!754616 m!703013))

(declare-fun m!703025 () Bool)

(assert (=> b!754616 m!703025))

(declare-fun m!703027 () Bool)

(assert (=> b!754616 m!703027))

(declare-fun m!703029 () Bool)

(assert (=> b!754616 m!703029))

(declare-fun m!703031 () Bool)

(assert (=> b!754617 m!703031))

(assert (=> b!754601 m!703013))

(assert (=> b!754601 m!703013))

(declare-fun m!703033 () Bool)

(assert (=> b!754601 m!703033))

(assert (=> b!754598 m!703013))

(assert (=> b!754598 m!703013))

(declare-fun m!703035 () Bool)

(assert (=> b!754598 m!703035))

(assert (=> b!754614 m!703007))

(declare-fun m!703037 () Bool)

(assert (=> b!754614 m!703037))

(declare-fun m!703039 () Bool)

(assert (=> b!754614 m!703039))

(declare-fun m!703041 () Bool)

(assert (=> b!754614 m!703041))

(declare-fun m!703043 () Bool)

(assert (=> b!754614 m!703043))

(assert (=> b!754614 m!703039))

(declare-fun m!703045 () Bool)

(assert (=> b!754612 m!703045))

(declare-fun m!703047 () Bool)

(assert (=> b!754619 m!703047))

(declare-fun m!703049 () Bool)

(assert (=> b!754619 m!703049))

(assert (=> b!754603 m!703013))

(assert (=> b!754603 m!703013))

(declare-fun m!703051 () Bool)

(assert (=> b!754603 m!703051))

(assert (=> b!754603 m!703051))

(assert (=> b!754603 m!703013))

(declare-fun m!703053 () Bool)

(assert (=> b!754603 m!703053))

(assert (=> b!754609 m!703013))

(assert (=> b!754609 m!703013))

(declare-fun m!703055 () Bool)

(assert (=> b!754609 m!703055))

(declare-fun m!703057 () Bool)

(assert (=> b!754611 m!703057))

(assert (=> b!754599 m!703013))

(assert (=> b!754599 m!703013))

(assert (=> b!754599 m!703033))

(check-sat (not b!754613) (not b!754619) (not b!754609) (not b!754606) (not start!65730) (not b!754614) (not b!754603) (not b!754612) (not b!754599) (not b!754598) (not b!754605) (not b!754616) (not b!754600) (not b!754611) (not b!754601))
(check-sat)
