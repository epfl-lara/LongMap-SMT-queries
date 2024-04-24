; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65334 () Bool)

(assert start!65334)

(declare-fun b!738941 () Bool)

(declare-fun res!496557 () Bool)

(declare-fun e!413332 () Bool)

(assert (=> b!738941 (=> (not res!496557) (not e!413332))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41377 0))(
  ( (array!41378 (arr!19798 (Array (_ BitVec 32) (_ BitVec 64))) (size!20218 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41377)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738941 (= res!496557 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20218 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20218 a!3186))))))

(declare-fun res!496558 () Bool)

(declare-fun e!413330 () Bool)

(assert (=> start!65334 (=> (not res!496558) (not e!413330))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65334 (= res!496558 (validMask!0 mask!3328))))

(assert (=> start!65334 e!413330))

(assert (=> start!65334 true))

(declare-fun array_inv!15657 (array!41377) Bool)

(assert (=> start!65334 (array_inv!15657 a!3186)))

(declare-fun b!738942 () Bool)

(declare-fun e!413339 () Bool)

(declare-fun e!413340 () Bool)

(assert (=> b!738942 (= e!413339 (not e!413340))))

(declare-fun res!496562 () Bool)

(assert (=> b!738942 (=> res!496562 e!413340)))

(declare-datatypes ((SeekEntryResult!7354 0))(
  ( (MissingZero!7354 (index!31784 (_ BitVec 32))) (Found!7354 (index!31785 (_ BitVec 32))) (Intermediate!7354 (undefined!8166 Bool) (index!31786 (_ BitVec 32)) (x!62940 (_ BitVec 32))) (Undefined!7354) (MissingVacant!7354 (index!31787 (_ BitVec 32))) )
))
(declare-fun lt!327944 () SeekEntryResult!7354)

(get-info :version)

(assert (=> b!738942 (= res!496562 (or (not ((_ is Intermediate!7354) lt!327944)) (bvsge x!1131 (x!62940 lt!327944))))))

(declare-fun lt!327937 () SeekEntryResult!7354)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!738942 (= lt!327937 (Found!7354 j!159))))

(declare-fun e!413338 () Bool)

(assert (=> b!738942 e!413338))

(declare-fun res!496552 () Bool)

(assert (=> b!738942 (=> (not res!496552) (not e!413338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41377 (_ BitVec 32)) Bool)

(assert (=> b!738942 (= res!496552 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25189 0))(
  ( (Unit!25190) )
))
(declare-fun lt!327942 () Unit!25189)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41377 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25189)

(assert (=> b!738942 (= lt!327942 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738943 () Bool)

(declare-fun res!496563 () Bool)

(assert (=> b!738943 (=> (not res!496563) (not e!413330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738943 (= res!496563 (validKeyInArray!0 (select (arr!19798 a!3186) j!159)))))

(declare-fun b!738944 () Bool)

(declare-fun res!496550 () Bool)

(declare-fun e!413333 () Bool)

(assert (=> b!738944 (=> res!496550 e!413333)))

(declare-fun e!413335 () Bool)

(assert (=> b!738944 (= res!496550 e!413335)))

(declare-fun c!81579 () Bool)

(declare-fun lt!327938 () Bool)

(assert (=> b!738944 (= c!81579 lt!327938)))

(declare-fun lt!327943 () (_ BitVec 32))

(declare-fun b!738945 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41377 (_ BitVec 32)) SeekEntryResult!7354)

(assert (=> b!738945 (= e!413335 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327943 resIntermediateIndex!5 (select (arr!19798 a!3186) j!159) a!3186 mask!3328) lt!327937)))))

(declare-fun b!738946 () Bool)

(declare-fun res!496567 () Bool)

(assert (=> b!738946 (=> (not res!496567) (not e!413332))))

(declare-datatypes ((List!13707 0))(
  ( (Nil!13704) (Cons!13703 (h!14781 (_ BitVec 64)) (t!20014 List!13707)) )
))
(declare-fun arrayNoDuplicates!0 (array!41377 (_ BitVec 32) List!13707) Bool)

(assert (=> b!738946 (= res!496567 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13704))))

(declare-fun b!738947 () Bool)

(declare-fun e!413336 () Bool)

(assert (=> b!738947 (= e!413338 e!413336)))

(declare-fun res!496561 () Bool)

(assert (=> b!738947 (=> (not res!496561) (not e!413336))))

(declare-fun lt!327947 () SeekEntryResult!7354)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41377 (_ BitVec 32)) SeekEntryResult!7354)

(assert (=> b!738947 (= res!496561 (= (seekEntryOrOpen!0 (select (arr!19798 a!3186) j!159) a!3186 mask!3328) lt!327947))))

(assert (=> b!738947 (= lt!327947 (Found!7354 j!159))))

(declare-fun b!738948 () Bool)

(declare-fun e!413329 () Bool)

(assert (=> b!738948 (= e!413332 e!413329)))

(declare-fun res!496560 () Bool)

(assert (=> b!738948 (=> (not res!496560) (not e!413329))))

(declare-fun lt!327941 () SeekEntryResult!7354)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41377 (_ BitVec 32)) SeekEntryResult!7354)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738948 (= res!496560 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19798 a!3186) j!159) mask!3328) (select (arr!19798 a!3186) j!159) a!3186 mask!3328) lt!327941))))

(assert (=> b!738948 (= lt!327941 (Intermediate!7354 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738949 () Bool)

(declare-fun res!496555 () Bool)

(assert (=> b!738949 (=> (not res!496555) (not e!413329))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!738949 (= res!496555 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19798 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738950 () Bool)

(declare-fun res!496553 () Bool)

(assert (=> b!738950 (=> (not res!496553) (not e!413330))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738950 (= res!496553 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!413337 () Bool)

(declare-fun b!738951 () Bool)

(assert (=> b!738951 (= e!413337 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19798 a!3186) j!159) a!3186 mask!3328) (Found!7354 j!159)))))

(declare-fun b!738952 () Bool)

(declare-fun res!496554 () Bool)

(assert (=> b!738952 (=> (not res!496554) (not e!413329))))

(assert (=> b!738952 (= res!496554 e!413337)))

(declare-fun c!81581 () Bool)

(assert (=> b!738952 (= c!81581 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738953 () Bool)

(declare-fun res!496566 () Bool)

(assert (=> b!738953 (=> (not res!496566) (not e!413330))))

(assert (=> b!738953 (= res!496566 (validKeyInArray!0 k0!2102))))

(declare-fun b!738954 () Bool)

(assert (=> b!738954 (= e!413336 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19798 a!3186) j!159) a!3186 mask!3328) lt!327947))))

(declare-fun b!738955 () Bool)

(declare-fun e!413334 () Unit!25189)

(declare-fun Unit!25191 () Unit!25189)

(assert (=> b!738955 (= e!413334 Unit!25191)))

(assert (=> b!738955 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327943 (select (arr!19798 a!3186) j!159) a!3186 mask!3328) lt!327941)))

(declare-fun b!738956 () Bool)

(declare-fun Unit!25192 () Unit!25189)

(assert (=> b!738956 (= e!413334 Unit!25192)))

(declare-fun lt!327939 () SeekEntryResult!7354)

(assert (=> b!738956 (= lt!327939 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19798 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!738956 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327943 resIntermediateIndex!5 (select (arr!19798 a!3186) j!159) a!3186 mask!3328) lt!327937)))

(declare-fun b!738957 () Bool)

(declare-fun res!496551 () Bool)

(assert (=> b!738957 (=> (not res!496551) (not e!413330))))

(assert (=> b!738957 (= res!496551 (and (= (size!20218 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20218 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20218 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738958 () Bool)

(declare-fun res!496564 () Bool)

(assert (=> b!738958 (=> (not res!496564) (not e!413332))))

(assert (=> b!738958 (= res!496564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738959 () Bool)

(assert (=> b!738959 (= e!413337 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19798 a!3186) j!159) a!3186 mask!3328) lt!327941))))

(declare-fun b!738960 () Bool)

(assert (=> b!738960 (= e!413330 e!413332)))

(declare-fun res!496565 () Bool)

(assert (=> b!738960 (=> (not res!496565) (not e!413332))))

(declare-fun lt!327946 () SeekEntryResult!7354)

(assert (=> b!738960 (= res!496565 (or (= lt!327946 (MissingZero!7354 i!1173)) (= lt!327946 (MissingVacant!7354 i!1173))))))

(assert (=> b!738960 (= lt!327946 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!738961 () Bool)

(assert (=> b!738961 (= e!413333 true)))

(declare-fun lt!327935 () (_ BitVec 64))

(declare-fun lt!327945 () array!41377)

(declare-fun lt!327940 () SeekEntryResult!7354)

(assert (=> b!738961 (= lt!327940 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327943 lt!327935 lt!327945 mask!3328))))

(declare-fun b!738962 () Bool)

(assert (=> b!738962 (= e!413340 e!413333)))

(declare-fun res!496559 () Bool)

(assert (=> b!738962 (=> res!496559 e!413333)))

(assert (=> b!738962 (= res!496559 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327943 #b00000000000000000000000000000000) (bvsge lt!327943 (size!20218 a!3186))))))

(declare-fun lt!327948 () Unit!25189)

(assert (=> b!738962 (= lt!327948 e!413334)))

(declare-fun c!81580 () Bool)

(assert (=> b!738962 (= c!81580 lt!327938)))

(assert (=> b!738962 (= lt!327938 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738962 (= lt!327943 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!738963 () Bool)

(assert (=> b!738963 (= e!413329 e!413339)))

(declare-fun res!496556 () Bool)

(assert (=> b!738963 (=> (not res!496556) (not e!413339))))

(declare-fun lt!327936 () SeekEntryResult!7354)

(assert (=> b!738963 (= res!496556 (= lt!327936 lt!327944))))

(assert (=> b!738963 (= lt!327944 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327935 lt!327945 mask!3328))))

(assert (=> b!738963 (= lt!327936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327935 mask!3328) lt!327935 lt!327945 mask!3328))))

(assert (=> b!738963 (= lt!327935 (select (store (arr!19798 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!738963 (= lt!327945 (array!41378 (store (arr!19798 a!3186) i!1173 k0!2102) (size!20218 a!3186)))))

(declare-fun b!738964 () Bool)

(assert (=> b!738964 (= e!413335 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327943 (select (arr!19798 a!3186) j!159) a!3186 mask!3328) lt!327941)))))

(assert (= (and start!65334 res!496558) b!738957))

(assert (= (and b!738957 res!496551) b!738943))

(assert (= (and b!738943 res!496563) b!738953))

(assert (= (and b!738953 res!496566) b!738950))

(assert (= (and b!738950 res!496553) b!738960))

(assert (= (and b!738960 res!496565) b!738958))

(assert (= (and b!738958 res!496564) b!738946))

(assert (= (and b!738946 res!496567) b!738941))

(assert (= (and b!738941 res!496557) b!738948))

(assert (= (and b!738948 res!496560) b!738949))

(assert (= (and b!738949 res!496555) b!738952))

(assert (= (and b!738952 c!81581) b!738959))

(assert (= (and b!738952 (not c!81581)) b!738951))

(assert (= (and b!738952 res!496554) b!738963))

(assert (= (and b!738963 res!496556) b!738942))

(assert (= (and b!738942 res!496552) b!738947))

(assert (= (and b!738947 res!496561) b!738954))

(assert (= (and b!738942 (not res!496562)) b!738962))

(assert (= (and b!738962 c!81580) b!738955))

(assert (= (and b!738962 (not c!81580)) b!738956))

(assert (= (and b!738962 (not res!496559)) b!738944))

(assert (= (and b!738944 c!81579) b!738964))

(assert (= (and b!738944 (not c!81579)) b!738945))

(assert (= (and b!738944 (not res!496550)) b!738961))

(declare-fun m!691047 () Bool)

(assert (=> b!738948 m!691047))

(assert (=> b!738948 m!691047))

(declare-fun m!691049 () Bool)

(assert (=> b!738948 m!691049))

(assert (=> b!738948 m!691049))

(assert (=> b!738948 m!691047))

(declare-fun m!691051 () Bool)

(assert (=> b!738948 m!691051))

(assert (=> b!738956 m!691047))

(assert (=> b!738956 m!691047))

(declare-fun m!691053 () Bool)

(assert (=> b!738956 m!691053))

(assert (=> b!738956 m!691047))

(declare-fun m!691055 () Bool)

(assert (=> b!738956 m!691055))

(assert (=> b!738959 m!691047))

(assert (=> b!738959 m!691047))

(declare-fun m!691057 () Bool)

(assert (=> b!738959 m!691057))

(declare-fun m!691059 () Bool)

(assert (=> b!738960 m!691059))

(assert (=> b!738947 m!691047))

(assert (=> b!738947 m!691047))

(declare-fun m!691061 () Bool)

(assert (=> b!738947 m!691061))

(declare-fun m!691063 () Bool)

(assert (=> b!738942 m!691063))

(declare-fun m!691065 () Bool)

(assert (=> b!738942 m!691065))

(declare-fun m!691067 () Bool)

(assert (=> b!738961 m!691067))

(declare-fun m!691069 () Bool)

(assert (=> b!738958 m!691069))

(declare-fun m!691071 () Bool)

(assert (=> start!65334 m!691071))

(declare-fun m!691073 () Bool)

(assert (=> start!65334 m!691073))

(declare-fun m!691075 () Bool)

(assert (=> b!738950 m!691075))

(declare-fun m!691077 () Bool)

(assert (=> b!738963 m!691077))

(declare-fun m!691079 () Bool)

(assert (=> b!738963 m!691079))

(declare-fun m!691081 () Bool)

(assert (=> b!738963 m!691081))

(declare-fun m!691083 () Bool)

(assert (=> b!738963 m!691083))

(declare-fun m!691085 () Bool)

(assert (=> b!738963 m!691085))

(assert (=> b!738963 m!691077))

(assert (=> b!738951 m!691047))

(assert (=> b!738951 m!691047))

(assert (=> b!738951 m!691053))

(assert (=> b!738945 m!691047))

(assert (=> b!738945 m!691047))

(assert (=> b!738945 m!691055))

(declare-fun m!691087 () Bool)

(assert (=> b!738949 m!691087))

(assert (=> b!738955 m!691047))

(assert (=> b!738955 m!691047))

(declare-fun m!691089 () Bool)

(assert (=> b!738955 m!691089))

(assert (=> b!738954 m!691047))

(assert (=> b!738954 m!691047))

(declare-fun m!691091 () Bool)

(assert (=> b!738954 m!691091))

(assert (=> b!738943 m!691047))

(assert (=> b!738943 m!691047))

(declare-fun m!691093 () Bool)

(assert (=> b!738943 m!691093))

(declare-fun m!691095 () Bool)

(assert (=> b!738953 m!691095))

(declare-fun m!691097 () Bool)

(assert (=> b!738946 m!691097))

(assert (=> b!738964 m!691047))

(assert (=> b!738964 m!691047))

(assert (=> b!738964 m!691089))

(declare-fun m!691099 () Bool)

(assert (=> b!738962 m!691099))

(check-sat (not b!738956) (not b!738951) (not b!738946) (not b!738955) (not b!738943) (not b!738953) (not b!738959) (not b!738954) (not b!738962) (not b!738960) (not b!738950) (not b!738948) (not start!65334) (not b!738942) (not b!738958) (not b!738964) (not b!738963) (not b!738945) (not b!738947) (not b!738961))
(check-sat)
