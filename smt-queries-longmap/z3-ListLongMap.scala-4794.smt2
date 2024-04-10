; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65826 () Bool)

(assert start!65826)

(declare-fun b!757910 () Bool)

(declare-fun res!512665 () Bool)

(declare-fun e!422569 () Bool)

(assert (=> b!757910 (=> (not res!512665) (not e!422569))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!337557 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41999 0))(
  ( (array!42000 (arr!20113 (Array (_ BitVec 32) (_ BitVec 64))) (size!20534 (_ BitVec 32))) )
))
(declare-fun lt!337558 () array!41999)

(declare-datatypes ((SeekEntryResult!7713 0))(
  ( (MissingZero!7713 (index!33220 (_ BitVec 32))) (Found!7713 (index!33221 (_ BitVec 32))) (Intermediate!7713 (undefined!8525 Bool) (index!33222 (_ BitVec 32)) (x!64111 (_ BitVec 32))) (Undefined!7713) (MissingVacant!7713 (index!33223 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41999 (_ BitVec 32)) SeekEntryResult!7713)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41999 (_ BitVec 32)) SeekEntryResult!7713)

(assert (=> b!757910 (= res!512665 (= (seekEntryOrOpen!0 lt!337557 lt!337558 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337557 lt!337558 mask!3328)))))

(declare-fun a!3186 () array!41999)

(declare-fun lt!337561 () SeekEntryResult!7713)

(declare-fun e!422563 () Bool)

(declare-fun b!757911 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41999 (_ BitVec 32)) SeekEntryResult!7713)

(assert (=> b!757911 (= e!422563 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20113 a!3186) j!159) a!3186 mask!3328) lt!337561))))

(declare-fun b!757912 () Bool)

(declare-fun e!422564 () Bool)

(declare-fun e!422566 () Bool)

(assert (=> b!757912 (= e!422564 e!422566)))

(declare-fun res!512658 () Bool)

(assert (=> b!757912 (=> res!512658 e!422566)))

(declare-fun lt!337562 () (_ BitVec 64))

(assert (=> b!757912 (= res!512658 (= lt!337562 lt!337557))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!757912 (= lt!337562 (select (store (arr!20113 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!757913 () Bool)

(declare-fun res!512674 () Bool)

(declare-fun e!422571 () Bool)

(assert (=> b!757913 (=> (not res!512674) (not e!422571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757913 (= res!512674 (validKeyInArray!0 k0!2102))))

(declare-fun b!757914 () Bool)

(declare-fun e!422562 () Bool)

(assert (=> b!757914 (= e!422562 e!422564)))

(declare-fun res!512663 () Bool)

(assert (=> b!757914 (=> res!512663 e!422564)))

(declare-fun lt!337560 () SeekEntryResult!7713)

(declare-fun lt!337555 () SeekEntryResult!7713)

(assert (=> b!757914 (= res!512663 (not (= lt!337560 lt!337555)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!757914 (= lt!337560 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20113 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757915 () Bool)

(declare-datatypes ((Unit!26232 0))(
  ( (Unit!26233) )
))
(declare-fun e!422568 () Unit!26232)

(declare-fun Unit!26234 () Unit!26232)

(assert (=> b!757915 (= e!422568 Unit!26234)))

(assert (=> b!757915 false))

(declare-fun b!757916 () Bool)

(declare-fun res!512657 () Bool)

(assert (=> b!757916 (=> (not res!512657) (not e!422571))))

(declare-fun arrayContainsKey!0 (array!41999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757916 (= res!512657 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757917 () Bool)

(declare-fun e!422570 () Bool)

(assert (=> b!757917 (= e!422570 (not e!422562))))

(declare-fun res!512668 () Bool)

(assert (=> b!757917 (=> res!512668 e!422562)))

(declare-fun lt!337563 () SeekEntryResult!7713)

(get-info :version)

(assert (=> b!757917 (= res!512668 (or (not ((_ is Intermediate!7713) lt!337563)) (bvslt x!1131 (x!64111 lt!337563)) (not (= x!1131 (x!64111 lt!337563))) (not (= index!1321 (index!33222 lt!337563)))))))

(declare-fun e!422567 () Bool)

(assert (=> b!757917 e!422567))

(declare-fun res!512670 () Bool)

(assert (=> b!757917 (=> (not res!512670) (not e!422567))))

(declare-fun lt!337554 () SeekEntryResult!7713)

(assert (=> b!757917 (= res!512670 (= lt!337554 lt!337555))))

(assert (=> b!757917 (= lt!337555 (Found!7713 j!159))))

(assert (=> b!757917 (= lt!337554 (seekEntryOrOpen!0 (select (arr!20113 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41999 (_ BitVec 32)) Bool)

(assert (=> b!757917 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337559 () Unit!26232)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41999 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26232)

(assert (=> b!757917 (= lt!337559 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!512673 () Bool)

(assert (=> start!65826 (=> (not res!512673) (not e!422571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65826 (= res!512673 (validMask!0 mask!3328))))

(assert (=> start!65826 e!422571))

(assert (=> start!65826 true))

(declare-fun array_inv!15909 (array!41999) Bool)

(assert (=> start!65826 (array_inv!15909 a!3186)))

(declare-fun b!757918 () Bool)

(declare-fun res!512666 () Bool)

(declare-fun e!422565 () Bool)

(assert (=> b!757918 (=> (not res!512666) (not e!422565))))

(assert (=> b!757918 (= res!512666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757919 () Bool)

(declare-fun res!512672 () Bool)

(declare-fun e!422573 () Bool)

(assert (=> b!757919 (=> (not res!512672) (not e!422573))))

(assert (=> b!757919 (= res!512672 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20113 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757920 () Bool)

(declare-fun res!512664 () Bool)

(assert (=> b!757920 (=> (not res!512664) (not e!422565))))

(declare-datatypes ((List!14115 0))(
  ( (Nil!14112) (Cons!14111 (h!15183 (_ BitVec 64)) (t!20430 List!14115)) )
))
(declare-fun arrayNoDuplicates!0 (array!41999 (_ BitVec 32) List!14115) Bool)

(assert (=> b!757920 (= res!512664 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14112))))

(declare-fun b!757921 () Bool)

(declare-fun Unit!26235 () Unit!26232)

(assert (=> b!757921 (= e!422568 Unit!26235)))

(declare-fun b!757922 () Bool)

(assert (=> b!757922 (= e!422569 (= lt!337554 lt!337560))))

(declare-fun b!757923 () Bool)

(declare-fun res!512661 () Bool)

(assert (=> b!757923 (=> (not res!512661) (not e!422571))))

(assert (=> b!757923 (= res!512661 (and (= (size!20534 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20534 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20534 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757924 () Bool)

(declare-fun res!512671 () Bool)

(assert (=> b!757924 (=> (not res!512671) (not e!422565))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757924 (= res!512671 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20534 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20534 a!3186))))))

(declare-fun b!757925 () Bool)

(assert (=> b!757925 (= e!422566 true)))

(assert (=> b!757925 e!422569))

(declare-fun res!512659 () Bool)

(assert (=> b!757925 (=> (not res!512659) (not e!422569))))

(assert (=> b!757925 (= res!512659 (= lt!337562 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337565 () Unit!26232)

(assert (=> b!757925 (= lt!337565 e!422568)))

(declare-fun c!83008 () Bool)

(assert (=> b!757925 (= c!83008 (= lt!337562 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757926 () Bool)

(declare-fun res!512667 () Bool)

(assert (=> b!757926 (=> (not res!512667) (not e!422571))))

(assert (=> b!757926 (= res!512667 (validKeyInArray!0 (select (arr!20113 a!3186) j!159)))))

(declare-fun b!757927 () Bool)

(assert (=> b!757927 (= e!422571 e!422565)))

(declare-fun res!512675 () Bool)

(assert (=> b!757927 (=> (not res!512675) (not e!422565))))

(declare-fun lt!337564 () SeekEntryResult!7713)

(assert (=> b!757927 (= res!512675 (or (= lt!337564 (MissingZero!7713 i!1173)) (= lt!337564 (MissingVacant!7713 i!1173))))))

(assert (=> b!757927 (= lt!337564 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!757928 () Bool)

(assert (=> b!757928 (= e!422567 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20113 a!3186) j!159) a!3186 mask!3328) lt!337555))))

(declare-fun b!757929 () Bool)

(assert (=> b!757929 (= e!422563 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20113 a!3186) j!159) a!3186 mask!3328) (Found!7713 j!159)))))

(declare-fun b!757930 () Bool)

(assert (=> b!757930 (= e!422565 e!422573)))

(declare-fun res!512669 () Bool)

(assert (=> b!757930 (=> (not res!512669) (not e!422573))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757930 (= res!512669 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20113 a!3186) j!159) mask!3328) (select (arr!20113 a!3186) j!159) a!3186 mask!3328) lt!337561))))

(assert (=> b!757930 (= lt!337561 (Intermediate!7713 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757931 () Bool)

(assert (=> b!757931 (= e!422573 e!422570)))

(declare-fun res!512660 () Bool)

(assert (=> b!757931 (=> (not res!512660) (not e!422570))))

(declare-fun lt!337556 () SeekEntryResult!7713)

(assert (=> b!757931 (= res!512660 (= lt!337556 lt!337563))))

(assert (=> b!757931 (= lt!337563 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337557 lt!337558 mask!3328))))

(assert (=> b!757931 (= lt!337556 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337557 mask!3328) lt!337557 lt!337558 mask!3328))))

(assert (=> b!757931 (= lt!337557 (select (store (arr!20113 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!757931 (= lt!337558 (array!42000 (store (arr!20113 a!3186) i!1173 k0!2102) (size!20534 a!3186)))))

(declare-fun b!757932 () Bool)

(declare-fun res!512662 () Bool)

(assert (=> b!757932 (=> (not res!512662) (not e!422573))))

(assert (=> b!757932 (= res!512662 e!422563)))

(declare-fun c!83007 () Bool)

(assert (=> b!757932 (= c!83007 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65826 res!512673) b!757923))

(assert (= (and b!757923 res!512661) b!757926))

(assert (= (and b!757926 res!512667) b!757913))

(assert (= (and b!757913 res!512674) b!757916))

(assert (= (and b!757916 res!512657) b!757927))

(assert (= (and b!757927 res!512675) b!757918))

(assert (= (and b!757918 res!512666) b!757920))

(assert (= (and b!757920 res!512664) b!757924))

(assert (= (and b!757924 res!512671) b!757930))

(assert (= (and b!757930 res!512669) b!757919))

(assert (= (and b!757919 res!512672) b!757932))

(assert (= (and b!757932 c!83007) b!757911))

(assert (= (and b!757932 (not c!83007)) b!757929))

(assert (= (and b!757932 res!512662) b!757931))

(assert (= (and b!757931 res!512660) b!757917))

(assert (= (and b!757917 res!512670) b!757928))

(assert (= (and b!757917 (not res!512668)) b!757914))

(assert (= (and b!757914 (not res!512663)) b!757912))

(assert (= (and b!757912 (not res!512658)) b!757925))

(assert (= (and b!757925 c!83008) b!757915))

(assert (= (and b!757925 (not c!83008)) b!757921))

(assert (= (and b!757925 res!512659) b!757910))

(assert (= (and b!757910 res!512665) b!757922))

(declare-fun m!705503 () Bool)

(assert (=> b!757912 m!705503))

(declare-fun m!705505 () Bool)

(assert (=> b!757912 m!705505))

(declare-fun m!705507 () Bool)

(assert (=> b!757927 m!705507))

(declare-fun m!705509 () Bool)

(assert (=> b!757929 m!705509))

(assert (=> b!757929 m!705509))

(declare-fun m!705511 () Bool)

(assert (=> b!757929 m!705511))

(assert (=> b!757917 m!705509))

(assert (=> b!757917 m!705509))

(declare-fun m!705513 () Bool)

(assert (=> b!757917 m!705513))

(declare-fun m!705515 () Bool)

(assert (=> b!757917 m!705515))

(declare-fun m!705517 () Bool)

(assert (=> b!757917 m!705517))

(declare-fun m!705519 () Bool)

(assert (=> start!65826 m!705519))

(declare-fun m!705521 () Bool)

(assert (=> start!65826 m!705521))

(declare-fun m!705523 () Bool)

(assert (=> b!757920 m!705523))

(declare-fun m!705525 () Bool)

(assert (=> b!757913 m!705525))

(declare-fun m!705527 () Bool)

(assert (=> b!757910 m!705527))

(declare-fun m!705529 () Bool)

(assert (=> b!757910 m!705529))

(assert (=> b!757914 m!705509))

(assert (=> b!757914 m!705509))

(assert (=> b!757914 m!705511))

(assert (=> b!757911 m!705509))

(assert (=> b!757911 m!705509))

(declare-fun m!705531 () Bool)

(assert (=> b!757911 m!705531))

(assert (=> b!757930 m!705509))

(assert (=> b!757930 m!705509))

(declare-fun m!705533 () Bool)

(assert (=> b!757930 m!705533))

(assert (=> b!757930 m!705533))

(assert (=> b!757930 m!705509))

(declare-fun m!705535 () Bool)

(assert (=> b!757930 m!705535))

(assert (=> b!757928 m!705509))

(assert (=> b!757928 m!705509))

(declare-fun m!705537 () Bool)

(assert (=> b!757928 m!705537))

(declare-fun m!705539 () Bool)

(assert (=> b!757918 m!705539))

(declare-fun m!705541 () Bool)

(assert (=> b!757916 m!705541))

(declare-fun m!705543 () Bool)

(assert (=> b!757919 m!705543))

(assert (=> b!757926 m!705509))

(assert (=> b!757926 m!705509))

(declare-fun m!705545 () Bool)

(assert (=> b!757926 m!705545))

(declare-fun m!705547 () Bool)

(assert (=> b!757931 m!705547))

(assert (=> b!757931 m!705503))

(declare-fun m!705549 () Bool)

(assert (=> b!757931 m!705549))

(declare-fun m!705551 () Bool)

(assert (=> b!757931 m!705551))

(assert (=> b!757931 m!705547))

(declare-fun m!705553 () Bool)

(assert (=> b!757931 m!705553))

(check-sat (not b!757920) (not b!757928) (not b!757916) (not start!65826) (not b!757911) (not b!757918) (not b!757910) (not b!757930) (not b!757917) (not b!757927) (not b!757931) (not b!757926) (not b!757929) (not b!757914) (not b!757913))
(check-sat)
