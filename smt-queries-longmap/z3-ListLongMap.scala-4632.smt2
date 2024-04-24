; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64554 () Bool)

(assert start!64554)

(declare-fun res!486883 () Bool)

(declare-fun e!406566 () Bool)

(assert (=> start!64554 (=> (not res!486883) (not e!406566))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64554 (= res!486883 (validMask!0 mask!3328))))

(assert (=> start!64554 e!406566))

(assert (=> start!64554 true))

(declare-datatypes ((array!41005 0))(
  ( (array!41006 (arr!19621 (Array (_ BitVec 32) (_ BitVec 64))) (size!20041 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41005)

(declare-fun array_inv!15480 (array!41005) Bool)

(assert (=> start!64554 (array_inv!15480 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!406564 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!725949 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7177 0))(
  ( (MissingZero!7177 (index!31076 (_ BitVec 32))) (Found!7177 (index!31077 (_ BitVec 32))) (Intermediate!7177 (undefined!7989 Bool) (index!31078 (_ BitVec 32)) (x!62222 (_ BitVec 32))) (Undefined!7177) (MissingVacant!7177 (index!31079 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41005 (_ BitVec 32)) SeekEntryResult!7177)

(assert (=> b!725949 (= e!406564 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19621 a!3186) j!159) a!3186 mask!3328) (Found!7177 j!159)))))

(declare-fun b!725950 () Bool)

(declare-fun e!406569 () Bool)

(declare-fun e!406563 () Bool)

(assert (=> b!725950 (= e!406569 e!406563)))

(declare-fun res!486888 () Bool)

(assert (=> b!725950 (=> (not res!486888) (not e!406563))))

(declare-fun lt!321541 () (_ BitVec 64))

(declare-fun lt!321542 () array!41005)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41005 (_ BitVec 32)) SeekEntryResult!7177)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725950 (= res!486888 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321541 mask!3328) lt!321541 lt!321542 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321541 lt!321542 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!725950 (= lt!321541 (select (store (arr!19621 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725950 (= lt!321542 (array!41006 (store (arr!19621 a!3186) i!1173 k0!2102) (size!20041 a!3186)))))

(declare-fun b!725951 () Bool)

(declare-fun res!486887 () Bool)

(assert (=> b!725951 (=> (not res!486887) (not e!406569))))

(assert (=> b!725951 (= res!486887 e!406564)))

(declare-fun c!79910 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725951 (= c!79910 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725952 () Bool)

(assert (=> b!725952 (= e!406563 (not (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun e!406567 () Bool)

(assert (=> b!725952 e!406567))

(declare-fun res!486881 () Bool)

(assert (=> b!725952 (=> (not res!486881) (not e!406567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41005 (_ BitVec 32)) Bool)

(assert (=> b!725952 (= res!486881 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24751 0))(
  ( (Unit!24752) )
))
(declare-fun lt!321538 () Unit!24751)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41005 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24751)

(assert (=> b!725952 (= lt!321538 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725953 () Bool)

(declare-fun res!486891 () Bool)

(assert (=> b!725953 (=> (not res!486891) (not e!406569))))

(assert (=> b!725953 (= res!486891 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19621 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725954 () Bool)

(declare-fun res!486892 () Bool)

(declare-fun e!406565 () Bool)

(assert (=> b!725954 (=> (not res!486892) (not e!406565))))

(assert (=> b!725954 (= res!486892 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20041 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20041 a!3186))))))

(declare-fun b!725955 () Bool)

(declare-fun lt!321539 () SeekEntryResult!7177)

(assert (=> b!725955 (= e!406564 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19621 a!3186) j!159) a!3186 mask!3328) lt!321539))))

(declare-fun b!725956 () Bool)

(declare-fun e!406568 () Bool)

(assert (=> b!725956 (= e!406567 e!406568)))

(declare-fun res!486880 () Bool)

(assert (=> b!725956 (=> (not res!486880) (not e!406568))))

(declare-fun lt!321540 () SeekEntryResult!7177)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41005 (_ BitVec 32)) SeekEntryResult!7177)

(assert (=> b!725956 (= res!486880 (= (seekEntryOrOpen!0 (select (arr!19621 a!3186) j!159) a!3186 mask!3328) lt!321540))))

(assert (=> b!725956 (= lt!321540 (Found!7177 j!159))))

(declare-fun b!725957 () Bool)

(assert (=> b!725957 (= e!406568 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19621 a!3186) j!159) a!3186 mask!3328) lt!321540))))

(declare-fun b!725958 () Bool)

(declare-fun res!486890 () Bool)

(assert (=> b!725958 (=> (not res!486890) (not e!406565))))

(declare-datatypes ((List!13530 0))(
  ( (Nil!13527) (Cons!13526 (h!14586 (_ BitVec 64)) (t!19837 List!13530)) )
))
(declare-fun arrayNoDuplicates!0 (array!41005 (_ BitVec 32) List!13530) Bool)

(assert (=> b!725958 (= res!486890 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13527))))

(declare-fun b!725959 () Bool)

(declare-fun res!486885 () Bool)

(assert (=> b!725959 (=> (not res!486885) (not e!406565))))

(assert (=> b!725959 (= res!486885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725960 () Bool)

(declare-fun res!486878 () Bool)

(assert (=> b!725960 (=> (not res!486878) (not e!406566))))

(declare-fun arrayContainsKey!0 (array!41005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725960 (= res!486878 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725961 () Bool)

(assert (=> b!725961 (= e!406565 e!406569)))

(declare-fun res!486882 () Bool)

(assert (=> b!725961 (=> (not res!486882) (not e!406569))))

(assert (=> b!725961 (= res!486882 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19621 a!3186) j!159) mask!3328) (select (arr!19621 a!3186) j!159) a!3186 mask!3328) lt!321539))))

(assert (=> b!725961 (= lt!321539 (Intermediate!7177 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725962 () Bool)

(assert (=> b!725962 (= e!406566 e!406565)))

(declare-fun res!486886 () Bool)

(assert (=> b!725962 (=> (not res!486886) (not e!406565))))

(declare-fun lt!321543 () SeekEntryResult!7177)

(assert (=> b!725962 (= res!486886 (or (= lt!321543 (MissingZero!7177 i!1173)) (= lt!321543 (MissingVacant!7177 i!1173))))))

(assert (=> b!725962 (= lt!321543 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!725963 () Bool)

(declare-fun res!486884 () Bool)

(assert (=> b!725963 (=> (not res!486884) (not e!406566))))

(assert (=> b!725963 (= res!486884 (and (= (size!20041 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20041 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20041 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725964 () Bool)

(declare-fun res!486889 () Bool)

(assert (=> b!725964 (=> (not res!486889) (not e!406566))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725964 (= res!486889 (validKeyInArray!0 (select (arr!19621 a!3186) j!159)))))

(declare-fun b!725965 () Bool)

(declare-fun res!486879 () Bool)

(assert (=> b!725965 (=> (not res!486879) (not e!406566))))

(assert (=> b!725965 (= res!486879 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64554 res!486883) b!725963))

(assert (= (and b!725963 res!486884) b!725964))

(assert (= (and b!725964 res!486889) b!725965))

(assert (= (and b!725965 res!486879) b!725960))

(assert (= (and b!725960 res!486878) b!725962))

(assert (= (and b!725962 res!486886) b!725959))

(assert (= (and b!725959 res!486885) b!725958))

(assert (= (and b!725958 res!486890) b!725954))

(assert (= (and b!725954 res!486892) b!725961))

(assert (= (and b!725961 res!486882) b!725953))

(assert (= (and b!725953 res!486891) b!725951))

(assert (= (and b!725951 c!79910) b!725955))

(assert (= (and b!725951 (not c!79910)) b!725949))

(assert (= (and b!725951 res!486887) b!725950))

(assert (= (and b!725950 res!486888) b!725952))

(assert (= (and b!725952 res!486881) b!725956))

(assert (= (and b!725956 res!486880) b!725957))

(declare-fun m!680613 () Bool)

(assert (=> start!64554 m!680613))

(declare-fun m!680615 () Bool)

(assert (=> start!64554 m!680615))

(declare-fun m!680617 () Bool)

(assert (=> b!725949 m!680617))

(assert (=> b!725949 m!680617))

(declare-fun m!680619 () Bool)

(assert (=> b!725949 m!680619))

(declare-fun m!680621 () Bool)

(assert (=> b!725953 m!680621))

(declare-fun m!680623 () Bool)

(assert (=> b!725959 m!680623))

(declare-fun m!680625 () Bool)

(assert (=> b!725962 m!680625))

(assert (=> b!725955 m!680617))

(assert (=> b!725955 m!680617))

(declare-fun m!680627 () Bool)

(assert (=> b!725955 m!680627))

(declare-fun m!680629 () Bool)

(assert (=> b!725960 m!680629))

(assert (=> b!725957 m!680617))

(assert (=> b!725957 m!680617))

(declare-fun m!680631 () Bool)

(assert (=> b!725957 m!680631))

(assert (=> b!725956 m!680617))

(assert (=> b!725956 m!680617))

(declare-fun m!680633 () Bool)

(assert (=> b!725956 m!680633))

(declare-fun m!680635 () Bool)

(assert (=> b!725952 m!680635))

(declare-fun m!680637 () Bool)

(assert (=> b!725952 m!680637))

(declare-fun m!680639 () Bool)

(assert (=> b!725958 m!680639))

(declare-fun m!680641 () Bool)

(assert (=> b!725950 m!680641))

(declare-fun m!680643 () Bool)

(assert (=> b!725950 m!680643))

(declare-fun m!680645 () Bool)

(assert (=> b!725950 m!680645))

(assert (=> b!725950 m!680641))

(declare-fun m!680647 () Bool)

(assert (=> b!725950 m!680647))

(declare-fun m!680649 () Bool)

(assert (=> b!725950 m!680649))

(declare-fun m!680651 () Bool)

(assert (=> b!725965 m!680651))

(assert (=> b!725961 m!680617))

(assert (=> b!725961 m!680617))

(declare-fun m!680653 () Bool)

(assert (=> b!725961 m!680653))

(assert (=> b!725961 m!680653))

(assert (=> b!725961 m!680617))

(declare-fun m!680655 () Bool)

(assert (=> b!725961 m!680655))

(assert (=> b!725964 m!680617))

(assert (=> b!725964 m!680617))

(declare-fun m!680657 () Bool)

(assert (=> b!725964 m!680657))

(check-sat (not b!725957) (not b!725962) (not b!725959) (not b!725965) (not start!64554) (not b!725949) (not b!725960) (not b!725956) (not b!725950) (not b!725952) (not b!725955) (not b!725961) (not b!725958) (not b!725964))
(check-sat)
