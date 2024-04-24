; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67678 () Bool)

(assert start!67678)

(declare-fun res!529319 () Bool)

(declare-fun e!435278 () Bool)

(assert (=> start!67678 (=> (not res!529319) (not e!435278))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67678 (= res!529319 (validMask!0 mask!3328))))

(assert (=> start!67678 e!435278))

(assert (=> start!67678 true))

(declare-datatypes ((array!42661 0))(
  ( (array!42662 (arr!20416 (Array (_ BitVec 32) (_ BitVec 64))) (size!20836 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42661)

(declare-fun array_inv!16275 (array!42661) Bool)

(assert (=> start!67678 (array_inv!16275 a!3186)))

(declare-fun b!782596 () Bool)

(declare-fun res!529331 () Bool)

(assert (=> b!782596 (=> (not res!529331) (not e!435278))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!782596 (= res!529331 (and (= (size!20836 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20836 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20836 a!3186)) (not (= i!1173 j!159))))))

(declare-datatypes ((SeekEntryResult!7972 0))(
  ( (MissingZero!7972 (index!34256 (_ BitVec 32))) (Found!7972 (index!34257 (_ BitVec 32))) (Intermediate!7972 (undefined!8784 Bool) (index!34258 (_ BitVec 32)) (x!65370 (_ BitVec 32))) (Undefined!7972) (MissingVacant!7972 (index!34259 (_ BitVec 32))) )
))
(declare-fun lt!348748 () SeekEntryResult!7972)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!435280 () Bool)

(declare-fun b!782597 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42661 (_ BitVec 32)) SeekEntryResult!7972)

(assert (=> b!782597 (= e!435280 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20416 a!3186) j!159) a!3186 mask!3328) lt!348748))))

(declare-fun b!782598 () Bool)

(declare-fun res!529325 () Bool)

(assert (=> b!782598 (=> (not res!529325) (not e!435278))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782598 (= res!529325 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782599 () Bool)

(declare-fun res!529326 () Bool)

(declare-fun e!435281 () Bool)

(assert (=> b!782599 (=> (not res!529326) (not e!435281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42661 (_ BitVec 32)) Bool)

(assert (=> b!782599 (= res!529326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!782600 () Bool)

(declare-fun res!529322 () Bool)

(assert (=> b!782600 (=> (not res!529322) (not e!435281))))

(declare-datatypes ((List!14325 0))(
  ( (Nil!14322) (Cons!14321 (h!15447 (_ BitVec 64)) (t!20632 List!14325)) )
))
(declare-fun arrayNoDuplicates!0 (array!42661 (_ BitVec 32) List!14325) Bool)

(assert (=> b!782600 (= res!529322 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14322))))

(declare-fun b!782601 () Bool)

(declare-fun e!435284 () Bool)

(assert (=> b!782601 (= e!435284 true)))

(assert (=> b!782601 (= (select (store (arr!20416 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!26953 0))(
  ( (Unit!26954) )
))
(declare-fun lt!348751 () Unit!26953)

(declare-fun e!435283 () Unit!26953)

(assert (=> b!782601 (= lt!348751 e!435283)))

(declare-fun c!87049 () Bool)

(assert (=> b!782601 (= c!87049 (= (select (store (arr!20416 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782602 () Bool)

(declare-fun Unit!26955 () Unit!26953)

(assert (=> b!782602 (= e!435283 Unit!26955)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!782603 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42661 (_ BitVec 32)) SeekEntryResult!7972)

(assert (=> b!782603 (= e!435280 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20416 a!3186) j!159) a!3186 mask!3328) (Found!7972 j!159)))))

(declare-fun b!782604 () Bool)

(declare-fun res!529318 () Bool)

(declare-fun e!435282 () Bool)

(assert (=> b!782604 (=> (not res!529318) (not e!435282))))

(assert (=> b!782604 (= res!529318 e!435280)))

(declare-fun c!87050 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!782604 (= c!87050 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782605 () Bool)

(declare-fun res!529324 () Bool)

(assert (=> b!782605 (=> (not res!529324) (not e!435282))))

(assert (=> b!782605 (= res!529324 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20416 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782606 () Bool)

(declare-fun res!529332 () Bool)

(assert (=> b!782606 (=> (not res!529332) (not e!435281))))

(assert (=> b!782606 (= res!529332 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20836 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20836 a!3186))))))

(declare-fun b!782607 () Bool)

(assert (=> b!782607 (= e!435281 e!435282)))

(declare-fun res!529316 () Bool)

(assert (=> b!782607 (=> (not res!529316) (not e!435282))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782607 (= res!529316 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20416 a!3186) j!159) mask!3328) (select (arr!20416 a!3186) j!159) a!3186 mask!3328) lt!348748))))

(assert (=> b!782607 (= lt!348748 (Intermediate!7972 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782608 () Bool)

(declare-fun res!529317 () Bool)

(assert (=> b!782608 (=> res!529317 e!435284)))

(declare-fun lt!348745 () (_ BitVec 64))

(assert (=> b!782608 (= res!529317 (= (select (store (arr!20416 a!3186) i!1173 k0!2102) index!1321) lt!348745))))

(declare-fun b!782609 () Bool)

(declare-fun e!435279 () Bool)

(assert (=> b!782609 (= e!435279 (not e!435284))))

(declare-fun res!529320 () Bool)

(assert (=> b!782609 (=> res!529320 e!435284)))

(declare-fun lt!348743 () SeekEntryResult!7972)

(get-info :version)

(assert (=> b!782609 (= res!529320 (or (not ((_ is Intermediate!7972) lt!348743)) (bvslt x!1131 (x!65370 lt!348743)) (not (= x!1131 (x!65370 lt!348743))) (not (= index!1321 (index!34258 lt!348743)))))))

(declare-fun e!435285 () Bool)

(assert (=> b!782609 e!435285))

(declare-fun res!529328 () Bool)

(assert (=> b!782609 (=> (not res!529328) (not e!435285))))

(declare-fun lt!348746 () SeekEntryResult!7972)

(declare-fun lt!348742 () SeekEntryResult!7972)

(assert (=> b!782609 (= res!529328 (= lt!348746 lt!348742))))

(assert (=> b!782609 (= lt!348742 (Found!7972 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42661 (_ BitVec 32)) SeekEntryResult!7972)

(assert (=> b!782609 (= lt!348746 (seekEntryOrOpen!0 (select (arr!20416 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!782609 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348744 () Unit!26953)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26953)

(assert (=> b!782609 (= lt!348744 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782610 () Bool)

(assert (=> b!782610 (= e!435278 e!435281)))

(declare-fun res!529327 () Bool)

(assert (=> b!782610 (=> (not res!529327) (not e!435281))))

(declare-fun lt!348750 () SeekEntryResult!7972)

(assert (=> b!782610 (= res!529327 (or (= lt!348750 (MissingZero!7972 i!1173)) (= lt!348750 (MissingVacant!7972 i!1173))))))

(assert (=> b!782610 (= lt!348750 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!782611 () Bool)

(declare-fun res!529330 () Bool)

(assert (=> b!782611 (=> (not res!529330) (not e!435278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782611 (= res!529330 (validKeyInArray!0 k0!2102))))

(declare-fun b!782612 () Bool)

(assert (=> b!782612 (= e!435282 e!435279)))

(declare-fun res!529329 () Bool)

(assert (=> b!782612 (=> (not res!529329) (not e!435279))))

(declare-fun lt!348749 () SeekEntryResult!7972)

(assert (=> b!782612 (= res!529329 (= lt!348749 lt!348743))))

(declare-fun lt!348747 () array!42661)

(assert (=> b!782612 (= lt!348743 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348745 lt!348747 mask!3328))))

(assert (=> b!782612 (= lt!348749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348745 mask!3328) lt!348745 lt!348747 mask!3328))))

(assert (=> b!782612 (= lt!348745 (select (store (arr!20416 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!782612 (= lt!348747 (array!42662 (store (arr!20416 a!3186) i!1173 k0!2102) (size!20836 a!3186)))))

(declare-fun b!782613 () Bool)

(declare-fun res!529323 () Bool)

(assert (=> b!782613 (=> (not res!529323) (not e!435278))))

(assert (=> b!782613 (= res!529323 (validKeyInArray!0 (select (arr!20416 a!3186) j!159)))))

(declare-fun b!782614 () Bool)

(declare-fun res!529321 () Bool)

(assert (=> b!782614 (=> res!529321 e!435284)))

(assert (=> b!782614 (= res!529321 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20416 a!3186) j!159) a!3186 mask!3328) lt!348742)))))

(declare-fun b!782615 () Bool)

(assert (=> b!782615 (= e!435285 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20416 a!3186) j!159) a!3186 mask!3328) lt!348742))))

(declare-fun b!782616 () Bool)

(declare-fun Unit!26956 () Unit!26953)

(assert (=> b!782616 (= e!435283 Unit!26956)))

(assert (=> b!782616 false))

(assert (= (and start!67678 res!529319) b!782596))

(assert (= (and b!782596 res!529331) b!782613))

(assert (= (and b!782613 res!529323) b!782611))

(assert (= (and b!782611 res!529330) b!782598))

(assert (= (and b!782598 res!529325) b!782610))

(assert (= (and b!782610 res!529327) b!782599))

(assert (= (and b!782599 res!529326) b!782600))

(assert (= (and b!782600 res!529322) b!782606))

(assert (= (and b!782606 res!529332) b!782607))

(assert (= (and b!782607 res!529316) b!782605))

(assert (= (and b!782605 res!529324) b!782604))

(assert (= (and b!782604 c!87050) b!782597))

(assert (= (and b!782604 (not c!87050)) b!782603))

(assert (= (and b!782604 res!529318) b!782612))

(assert (= (and b!782612 res!529329) b!782609))

(assert (= (and b!782609 res!529328) b!782615))

(assert (= (and b!782609 (not res!529320)) b!782614))

(assert (= (and b!782614 (not res!529321)) b!782608))

(assert (= (and b!782608 (not res!529317)) b!782601))

(assert (= (and b!782601 c!87049) b!782616))

(assert (= (and b!782601 (not c!87049)) b!782602))

(declare-fun m!725921 () Bool)

(assert (=> b!782607 m!725921))

(assert (=> b!782607 m!725921))

(declare-fun m!725923 () Bool)

(assert (=> b!782607 m!725923))

(assert (=> b!782607 m!725923))

(assert (=> b!782607 m!725921))

(declare-fun m!725925 () Bool)

(assert (=> b!782607 m!725925))

(declare-fun m!725927 () Bool)

(assert (=> b!782599 m!725927))

(declare-fun m!725929 () Bool)

(assert (=> b!782605 m!725929))

(declare-fun m!725931 () Bool)

(assert (=> b!782600 m!725931))

(assert (=> b!782597 m!725921))

(assert (=> b!782597 m!725921))

(declare-fun m!725933 () Bool)

(assert (=> b!782597 m!725933))

(declare-fun m!725935 () Bool)

(assert (=> b!782598 m!725935))

(declare-fun m!725937 () Bool)

(assert (=> b!782610 m!725937))

(declare-fun m!725939 () Bool)

(assert (=> b!782612 m!725939))

(declare-fun m!725941 () Bool)

(assert (=> b!782612 m!725941))

(declare-fun m!725943 () Bool)

(assert (=> b!782612 m!725943))

(declare-fun m!725945 () Bool)

(assert (=> b!782612 m!725945))

(assert (=> b!782612 m!725939))

(declare-fun m!725947 () Bool)

(assert (=> b!782612 m!725947))

(declare-fun m!725949 () Bool)

(assert (=> b!782611 m!725949))

(assert (=> b!782614 m!725921))

(assert (=> b!782614 m!725921))

(declare-fun m!725951 () Bool)

(assert (=> b!782614 m!725951))

(assert (=> b!782601 m!725941))

(declare-fun m!725953 () Bool)

(assert (=> b!782601 m!725953))

(assert (=> b!782603 m!725921))

(assert (=> b!782603 m!725921))

(assert (=> b!782603 m!725951))

(assert (=> b!782615 m!725921))

(assert (=> b!782615 m!725921))

(declare-fun m!725955 () Bool)

(assert (=> b!782615 m!725955))

(declare-fun m!725957 () Bool)

(assert (=> start!67678 m!725957))

(declare-fun m!725959 () Bool)

(assert (=> start!67678 m!725959))

(assert (=> b!782608 m!725941))

(assert (=> b!782608 m!725953))

(assert (=> b!782613 m!725921))

(assert (=> b!782613 m!725921))

(declare-fun m!725961 () Bool)

(assert (=> b!782613 m!725961))

(assert (=> b!782609 m!725921))

(assert (=> b!782609 m!725921))

(declare-fun m!725963 () Bool)

(assert (=> b!782609 m!725963))

(declare-fun m!725965 () Bool)

(assert (=> b!782609 m!725965))

(declare-fun m!725967 () Bool)

(assert (=> b!782609 m!725967))

(check-sat (not b!782599) (not b!782612) (not b!782600) (not b!782614) (not b!782615) (not b!782598) (not b!782613) (not b!782607) (not b!782611) (not b!782609) (not b!782610) (not b!782603) (not start!67678) (not b!782597))
(check-sat)
