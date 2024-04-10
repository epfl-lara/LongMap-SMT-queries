; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65708 () Bool)

(assert start!65708)

(declare-fun b!753840 () Bool)

(declare-fun e!420444 () Bool)

(declare-fun e!420445 () Bool)

(assert (=> b!753840 (= e!420444 (not e!420445))))

(declare-fun res!509307 () Bool)

(assert (=> b!753840 (=> res!509307 e!420445)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7654 0))(
  ( (MissingZero!7654 (index!32984 (_ BitVec 32))) (Found!7654 (index!32985 (_ BitVec 32))) (Intermediate!7654 (undefined!8466 Bool) (index!32986 (_ BitVec 32)) (x!63892 (_ BitVec 32))) (Undefined!7654) (MissingVacant!7654 (index!32987 (_ BitVec 32))) )
))
(declare-fun lt!335433 () SeekEntryResult!7654)

(assert (=> b!753840 (= res!509307 (or (not (is-Intermediate!7654 lt!335433)) (bvslt x!1131 (x!63892 lt!335433)) (not (= x!1131 (x!63892 lt!335433))) (not (= index!1321 (index!32986 lt!335433)))))))

(declare-fun e!420448 () Bool)

(assert (=> b!753840 e!420448))

(declare-fun res!509308 () Bool)

(assert (=> b!753840 (=> (not res!509308) (not e!420448))))

(declare-fun lt!335441 () SeekEntryResult!7654)

(declare-fun lt!335434 () SeekEntryResult!7654)

(assert (=> b!753840 (= res!509308 (= lt!335441 lt!335434))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!753840 (= lt!335434 (Found!7654 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41881 0))(
  ( (array!41882 (arr!20054 (Array (_ BitVec 32) (_ BitVec 64))) (size!20475 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41881)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41881 (_ BitVec 32)) SeekEntryResult!7654)

(assert (=> b!753840 (= lt!335441 (seekEntryOrOpen!0 (select (arr!20054 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41881 (_ BitVec 32)) Bool)

(assert (=> b!753840 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25996 0))(
  ( (Unit!25997) )
))
(declare-fun lt!335440 () Unit!25996)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41881 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25996)

(assert (=> b!753840 (= lt!335440 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753841 () Bool)

(declare-fun res!509306 () Bool)

(declare-fun e!420441 () Bool)

(assert (=> b!753841 (=> (not res!509306) (not e!420441))))

(declare-fun e!420447 () Bool)

(assert (=> b!753841 (= res!509306 e!420447)))

(declare-fun c!82653 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753841 (= c!82653 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753842 () Bool)

(declare-fun e!420440 () Unit!25996)

(declare-fun Unit!25998 () Unit!25996)

(assert (=> b!753842 (= e!420440 Unit!25998)))

(assert (=> b!753842 false))

(declare-fun b!753843 () Bool)

(declare-fun res!509298 () Bool)

(declare-fun e!420446 () Bool)

(assert (=> b!753843 (=> (not res!509298) (not e!420446))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!753843 (= res!509298 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20475 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20475 a!3186))))))

(declare-fun b!753844 () Bool)

(assert (=> b!753844 (= e!420446 e!420441)))

(declare-fun res!509310 () Bool)

(assert (=> b!753844 (=> (not res!509310) (not e!420441))))

(declare-fun lt!335439 () SeekEntryResult!7654)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41881 (_ BitVec 32)) SeekEntryResult!7654)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753844 (= res!509310 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20054 a!3186) j!159) mask!3328) (select (arr!20054 a!3186) j!159) a!3186 mask!3328) lt!335439))))

(assert (=> b!753844 (= lt!335439 (Intermediate!7654 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753845 () Bool)

(declare-fun res!509296 () Bool)

(assert (=> b!753845 (=> (not res!509296) (not e!420446))))

(assert (=> b!753845 (= res!509296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753846 () Bool)

(declare-fun Unit!25999 () Unit!25996)

(assert (=> b!753846 (= e!420440 Unit!25999)))

(declare-fun b!753847 () Bool)

(declare-fun e!420443 () Bool)

(assert (=> b!753847 (= e!420445 e!420443)))

(declare-fun res!509309 () Bool)

(assert (=> b!753847 (=> res!509309 e!420443)))

(declare-fun lt!335431 () SeekEntryResult!7654)

(assert (=> b!753847 (= res!509309 (not (= lt!335431 lt!335434)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41881 (_ BitVec 32)) SeekEntryResult!7654)

(assert (=> b!753847 (= lt!335431 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20054 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753848 () Bool)

(declare-fun res!509301 () Bool)

(assert (=> b!753848 (=> (not res!509301) (not e!420441))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!753848 (= res!509301 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20054 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753849 () Bool)

(declare-fun e!420442 () Bool)

(assert (=> b!753849 (= e!420443 e!420442)))

(declare-fun res!509294 () Bool)

(assert (=> b!753849 (=> res!509294 e!420442)))

(declare-fun lt!335430 () (_ BitVec 64))

(declare-fun lt!335432 () (_ BitVec 64))

(assert (=> b!753849 (= res!509294 (= lt!335430 lt!335432))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!753849 (= lt!335430 (select (store (arr!20054 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!753850 () Bool)

(declare-fun res!509302 () Bool)

(declare-fun e!420449 () Bool)

(assert (=> b!753850 (=> (not res!509302) (not e!420449))))

(declare-fun lt!335438 () array!41881)

(assert (=> b!753850 (= res!509302 (= (seekEntryOrOpen!0 lt!335432 lt!335438 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335432 lt!335438 mask!3328)))))

(declare-fun b!753851 () Bool)

(declare-fun res!509300 () Bool)

(declare-fun e!420439 () Bool)

(assert (=> b!753851 (=> (not res!509300) (not e!420439))))

(assert (=> b!753851 (= res!509300 (and (= (size!20475 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20475 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20475 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753852 () Bool)

(declare-fun res!509297 () Bool)

(assert (=> b!753852 (=> (not res!509297) (not e!420446))))

(declare-datatypes ((List!14056 0))(
  ( (Nil!14053) (Cons!14052 (h!15124 (_ BitVec 64)) (t!20371 List!14056)) )
))
(declare-fun arrayNoDuplicates!0 (array!41881 (_ BitVec 32) List!14056) Bool)

(assert (=> b!753852 (= res!509297 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14053))))

(declare-fun b!753853 () Bool)

(assert (=> b!753853 (= e!420447 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20054 a!3186) j!159) a!3186 mask!3328) lt!335439))))

(declare-fun b!753854 () Bool)

(declare-fun res!509305 () Bool)

(assert (=> b!753854 (=> (not res!509305) (not e!420439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753854 (= res!509305 (validKeyInArray!0 (select (arr!20054 a!3186) j!159)))))

(declare-fun b!753855 () Bool)

(assert (=> b!753855 (= e!420441 e!420444)))

(declare-fun res!509299 () Bool)

(assert (=> b!753855 (=> (not res!509299) (not e!420444))))

(declare-fun lt!335435 () SeekEntryResult!7654)

(assert (=> b!753855 (= res!509299 (= lt!335435 lt!335433))))

(assert (=> b!753855 (= lt!335433 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335432 lt!335438 mask!3328))))

(assert (=> b!753855 (= lt!335435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335432 mask!3328) lt!335432 lt!335438 mask!3328))))

(assert (=> b!753855 (= lt!335432 (select (store (arr!20054 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!753855 (= lt!335438 (array!41882 (store (arr!20054 a!3186) i!1173 k!2102) (size!20475 a!3186)))))

(declare-fun b!753856 () Bool)

(assert (=> b!753856 (= e!420448 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20054 a!3186) j!159) a!3186 mask!3328) lt!335434))))

(declare-fun b!753857 () Bool)

(declare-fun res!509295 () Bool)

(assert (=> b!753857 (=> (not res!509295) (not e!420439))))

(declare-fun arrayContainsKey!0 (array!41881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753857 (= res!509295 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!509303 () Bool)

(assert (=> start!65708 (=> (not res!509303) (not e!420439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65708 (= res!509303 (validMask!0 mask!3328))))

(assert (=> start!65708 e!420439))

(assert (=> start!65708 true))

(declare-fun array_inv!15850 (array!41881) Bool)

(assert (=> start!65708 (array_inv!15850 a!3186)))

(declare-fun b!753839 () Bool)

(declare-fun res!509311 () Bool)

(assert (=> b!753839 (=> (not res!509311) (not e!420439))))

(assert (=> b!753839 (= res!509311 (validKeyInArray!0 k!2102))))

(declare-fun b!753858 () Bool)

(assert (=> b!753858 (= e!420447 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20054 a!3186) j!159) a!3186 mask!3328) (Found!7654 j!159)))))

(declare-fun b!753859 () Bool)

(assert (=> b!753859 (= e!420442 true)))

(assert (=> b!753859 e!420449))

(declare-fun res!509312 () Bool)

(assert (=> b!753859 (=> (not res!509312) (not e!420449))))

(assert (=> b!753859 (= res!509312 (= lt!335430 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335437 () Unit!25996)

(assert (=> b!753859 (= lt!335437 e!420440)))

(declare-fun c!82654 () Bool)

(assert (=> b!753859 (= c!82654 (= lt!335430 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753860 () Bool)

(assert (=> b!753860 (= e!420449 (= lt!335441 lt!335431))))

(declare-fun b!753861 () Bool)

(assert (=> b!753861 (= e!420439 e!420446)))

(declare-fun res!509304 () Bool)

(assert (=> b!753861 (=> (not res!509304) (not e!420446))))

(declare-fun lt!335436 () SeekEntryResult!7654)

(assert (=> b!753861 (= res!509304 (or (= lt!335436 (MissingZero!7654 i!1173)) (= lt!335436 (MissingVacant!7654 i!1173))))))

(assert (=> b!753861 (= lt!335436 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!65708 res!509303) b!753851))

(assert (= (and b!753851 res!509300) b!753854))

(assert (= (and b!753854 res!509305) b!753839))

(assert (= (and b!753839 res!509311) b!753857))

(assert (= (and b!753857 res!509295) b!753861))

(assert (= (and b!753861 res!509304) b!753845))

(assert (= (and b!753845 res!509296) b!753852))

(assert (= (and b!753852 res!509297) b!753843))

(assert (= (and b!753843 res!509298) b!753844))

(assert (= (and b!753844 res!509310) b!753848))

(assert (= (and b!753848 res!509301) b!753841))

(assert (= (and b!753841 c!82653) b!753853))

(assert (= (and b!753841 (not c!82653)) b!753858))

(assert (= (and b!753841 res!509306) b!753855))

(assert (= (and b!753855 res!509299) b!753840))

(assert (= (and b!753840 res!509308) b!753856))

(assert (= (and b!753840 (not res!509307)) b!753847))

(assert (= (and b!753847 (not res!509309)) b!753849))

(assert (= (and b!753849 (not res!509294)) b!753859))

(assert (= (and b!753859 c!82654) b!753842))

(assert (= (and b!753859 (not c!82654)) b!753846))

(assert (= (and b!753859 res!509312) b!753850))

(assert (= (and b!753850 res!509302) b!753860))

(declare-fun m!702435 () Bool)

(assert (=> b!753854 m!702435))

(assert (=> b!753854 m!702435))

(declare-fun m!702437 () Bool)

(assert (=> b!753854 m!702437))

(declare-fun m!702439 () Bool)

(assert (=> b!753849 m!702439))

(declare-fun m!702441 () Bool)

(assert (=> b!753849 m!702441))

(declare-fun m!702443 () Bool)

(assert (=> b!753852 m!702443))

(assert (=> b!753847 m!702435))

(assert (=> b!753847 m!702435))

(declare-fun m!702445 () Bool)

(assert (=> b!753847 m!702445))

(assert (=> b!753853 m!702435))

(assert (=> b!753853 m!702435))

(declare-fun m!702447 () Bool)

(assert (=> b!753853 m!702447))

(assert (=> b!753856 m!702435))

(assert (=> b!753856 m!702435))

(declare-fun m!702449 () Bool)

(assert (=> b!753856 m!702449))

(declare-fun m!702451 () Bool)

(assert (=> start!65708 m!702451))

(declare-fun m!702453 () Bool)

(assert (=> start!65708 m!702453))

(assert (=> b!753840 m!702435))

(assert (=> b!753840 m!702435))

(declare-fun m!702455 () Bool)

(assert (=> b!753840 m!702455))

(declare-fun m!702457 () Bool)

(assert (=> b!753840 m!702457))

(declare-fun m!702459 () Bool)

(assert (=> b!753840 m!702459))

(declare-fun m!702461 () Bool)

(assert (=> b!753855 m!702461))

(declare-fun m!702463 () Bool)

(assert (=> b!753855 m!702463))

(assert (=> b!753855 m!702461))

(assert (=> b!753855 m!702439))

(declare-fun m!702465 () Bool)

(assert (=> b!753855 m!702465))

(declare-fun m!702467 () Bool)

(assert (=> b!753855 m!702467))

(declare-fun m!702469 () Bool)

(assert (=> b!753850 m!702469))

(declare-fun m!702471 () Bool)

(assert (=> b!753850 m!702471))

(declare-fun m!702473 () Bool)

(assert (=> b!753861 m!702473))

(declare-fun m!702475 () Bool)

(assert (=> b!753848 m!702475))

(declare-fun m!702477 () Bool)

(assert (=> b!753839 m!702477))

(declare-fun m!702479 () Bool)

(assert (=> b!753845 m!702479))

(assert (=> b!753858 m!702435))

(assert (=> b!753858 m!702435))

(assert (=> b!753858 m!702445))

(declare-fun m!702481 () Bool)

(assert (=> b!753857 m!702481))

(assert (=> b!753844 m!702435))

(assert (=> b!753844 m!702435))

(declare-fun m!702483 () Bool)

(assert (=> b!753844 m!702483))

(assert (=> b!753844 m!702483))

(assert (=> b!753844 m!702435))

(declare-fun m!702485 () Bool)

(assert (=> b!753844 m!702485))

(push 1)

