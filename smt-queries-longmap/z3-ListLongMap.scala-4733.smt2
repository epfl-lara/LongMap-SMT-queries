; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65586 () Bool)

(assert start!65586)

(declare-fun b!746570 () Bool)

(declare-fun e!417013 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!746570 (= e!417013 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!7480 0))(
  ( (MissingZero!7480 (index!32288 (_ BitVec 32))) (Found!7480 (index!32289 (_ BitVec 32))) (Intermediate!7480 (undefined!8292 Bool) (index!32290 (_ BitVec 32)) (x!63402 (_ BitVec 32))) (Undefined!7480) (MissingVacant!7480 (index!32291 (_ BitVec 32))) )
))
(declare-fun lt!331698 () SeekEntryResult!7480)

(declare-fun lt!331692 () SeekEntryResult!7480)

(assert (=> b!746570 (= lt!331698 lt!331692)))

(declare-fun b!746571 () Bool)

(declare-fun res!502974 () Bool)

(declare-fun e!417021 () Bool)

(assert (=> b!746571 (=> (not res!502974) (not e!417021))))

(declare-fun e!417014 () Bool)

(assert (=> b!746571 (= res!502974 e!417014)))

(declare-fun c!82187 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746571 (= c!82187 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!502977 () Bool)

(declare-fun e!417016 () Bool)

(assert (=> start!65586 (=> (not res!502977) (not e!417016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65586 (= res!502977 (validMask!0 mask!3328))))

(assert (=> start!65586 e!417016))

(assert (=> start!65586 true))

(declare-datatypes ((array!41629 0))(
  ( (array!41630 (arr!19924 (Array (_ BitVec 32) (_ BitVec 64))) (size!20344 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41629)

(declare-fun array_inv!15783 (array!41629) Bool)

(assert (=> start!65586 (array_inv!15783 a!3186)))

(declare-fun b!746572 () Bool)

(declare-fun res!502972 () Bool)

(assert (=> b!746572 (=> (not res!502972) (not e!417021))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746572 (= res!502972 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19924 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746573 () Bool)

(declare-fun res!502965 () Bool)

(declare-fun e!417015 () Bool)

(assert (=> b!746573 (=> (not res!502965) (not e!417015))))

(declare-datatypes ((List!13833 0))(
  ( (Nil!13830) (Cons!13829 (h!14907 (_ BitVec 64)) (t!20140 List!13833)) )
))
(declare-fun arrayNoDuplicates!0 (array!41629 (_ BitVec 32) List!13833) Bool)

(assert (=> b!746573 (= res!502965 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13830))))

(declare-fun b!746574 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41629 (_ BitVec 32)) SeekEntryResult!7480)

(assert (=> b!746574 (= e!417014 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19924 a!3186) j!159) a!3186 mask!3328) (Found!7480 j!159)))))

(declare-fun b!746575 () Bool)

(declare-fun res!502978 () Bool)

(assert (=> b!746575 (=> (not res!502978) (not e!417015))))

(assert (=> b!746575 (= res!502978 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20344 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20344 a!3186))))))

(declare-fun b!746576 () Bool)

(declare-fun res!502968 () Bool)

(assert (=> b!746576 (=> (not res!502968) (not e!417016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746576 (= res!502968 (validKeyInArray!0 (select (arr!19924 a!3186) j!159)))))

(declare-fun e!417017 () Bool)

(declare-fun lt!331697 () SeekEntryResult!7480)

(declare-fun b!746577 () Bool)

(assert (=> b!746577 (= e!417017 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19924 a!3186) j!159) a!3186 mask!3328) lt!331697))))

(declare-fun b!746578 () Bool)

(declare-fun res!502975 () Bool)

(assert (=> b!746578 (=> (not res!502975) (not e!417016))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746578 (= res!502975 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!331693 () SeekEntryResult!7480)

(declare-fun b!746579 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41629 (_ BitVec 32)) SeekEntryResult!7480)

(assert (=> b!746579 (= e!417014 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19924 a!3186) j!159) a!3186 mask!3328) lt!331693))))

(declare-fun b!746580 () Bool)

(declare-fun e!417018 () Bool)

(assert (=> b!746580 (= e!417018 e!417013)))

(declare-fun res!502970 () Bool)

(assert (=> b!746580 (=> res!502970 e!417013)))

(declare-fun lt!331696 () (_ BitVec 64))

(assert (=> b!746580 (= res!502970 (or (not (= lt!331692 lt!331697)) (= (select (store (arr!19924 a!3186) i!1173 k0!2102) index!1321) lt!331696) (not (= (select (store (arr!19924 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746580 (= lt!331692 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19924 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746581 () Bool)

(assert (=> b!746581 (= e!417015 e!417021)))

(declare-fun res!502967 () Bool)

(assert (=> b!746581 (=> (not res!502967) (not e!417021))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746581 (= res!502967 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19924 a!3186) j!159) mask!3328) (select (arr!19924 a!3186) j!159) a!3186 mask!3328) lt!331693))))

(assert (=> b!746581 (= lt!331693 (Intermediate!7480 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746582 () Bool)

(declare-fun res!502971 () Bool)

(assert (=> b!746582 (=> (not res!502971) (not e!417016))))

(assert (=> b!746582 (= res!502971 (validKeyInArray!0 k0!2102))))

(declare-fun b!746583 () Bool)

(declare-fun res!502969 () Bool)

(assert (=> b!746583 (=> (not res!502969) (not e!417015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41629 (_ BitVec 32)) Bool)

(assert (=> b!746583 (= res!502969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746584 () Bool)

(assert (=> b!746584 (= e!417016 e!417015)))

(declare-fun res!502964 () Bool)

(assert (=> b!746584 (=> (not res!502964) (not e!417015))))

(declare-fun lt!331694 () SeekEntryResult!7480)

(assert (=> b!746584 (= res!502964 (or (= lt!331694 (MissingZero!7480 i!1173)) (= lt!331694 (MissingVacant!7480 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41629 (_ BitVec 32)) SeekEntryResult!7480)

(assert (=> b!746584 (= lt!331694 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!746585 () Bool)

(declare-fun e!417019 () Bool)

(assert (=> b!746585 (= e!417019 (not e!417018))))

(declare-fun res!502976 () Bool)

(assert (=> b!746585 (=> res!502976 e!417018)))

(declare-fun lt!331691 () SeekEntryResult!7480)

(get-info :version)

(assert (=> b!746585 (= res!502976 (or (not ((_ is Intermediate!7480) lt!331691)) (bvslt x!1131 (x!63402 lt!331691)) (not (= x!1131 (x!63402 lt!331691))) (not (= index!1321 (index!32290 lt!331691)))))))

(assert (=> b!746585 e!417017))

(declare-fun res!502966 () Bool)

(assert (=> b!746585 (=> (not res!502966) (not e!417017))))

(assert (=> b!746585 (= res!502966 (= lt!331698 lt!331697))))

(assert (=> b!746585 (= lt!331697 (Found!7480 j!159))))

(assert (=> b!746585 (= lt!331698 (seekEntryOrOpen!0 (select (arr!19924 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!746585 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25519 0))(
  ( (Unit!25520) )
))
(declare-fun lt!331690 () Unit!25519)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41629 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25519)

(assert (=> b!746585 (= lt!331690 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746586 () Bool)

(declare-fun res!502963 () Bool)

(assert (=> b!746586 (=> (not res!502963) (not e!417016))))

(assert (=> b!746586 (= res!502963 (and (= (size!20344 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20344 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20344 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746587 () Bool)

(assert (=> b!746587 (= e!417021 e!417019)))

(declare-fun res!502973 () Bool)

(assert (=> b!746587 (=> (not res!502973) (not e!417019))))

(declare-fun lt!331689 () SeekEntryResult!7480)

(assert (=> b!746587 (= res!502973 (= lt!331689 lt!331691))))

(declare-fun lt!331695 () array!41629)

(assert (=> b!746587 (= lt!331691 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331696 lt!331695 mask!3328))))

(assert (=> b!746587 (= lt!331689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331696 mask!3328) lt!331696 lt!331695 mask!3328))))

(assert (=> b!746587 (= lt!331696 (select (store (arr!19924 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746587 (= lt!331695 (array!41630 (store (arr!19924 a!3186) i!1173 k0!2102) (size!20344 a!3186)))))

(assert (= (and start!65586 res!502977) b!746586))

(assert (= (and b!746586 res!502963) b!746576))

(assert (= (and b!746576 res!502968) b!746582))

(assert (= (and b!746582 res!502971) b!746578))

(assert (= (and b!746578 res!502975) b!746584))

(assert (= (and b!746584 res!502964) b!746583))

(assert (= (and b!746583 res!502969) b!746573))

(assert (= (and b!746573 res!502965) b!746575))

(assert (= (and b!746575 res!502978) b!746581))

(assert (= (and b!746581 res!502967) b!746572))

(assert (= (and b!746572 res!502972) b!746571))

(assert (= (and b!746571 c!82187) b!746579))

(assert (= (and b!746571 (not c!82187)) b!746574))

(assert (= (and b!746571 res!502974) b!746587))

(assert (= (and b!746587 res!502973) b!746585))

(assert (= (and b!746585 res!502966) b!746577))

(assert (= (and b!746585 (not res!502976)) b!746580))

(assert (= (and b!746580 (not res!502970)) b!746570))

(declare-fun m!697311 () Bool)

(assert (=> b!746584 m!697311))

(declare-fun m!697313 () Bool)

(assert (=> b!746574 m!697313))

(assert (=> b!746574 m!697313))

(declare-fun m!697315 () Bool)

(assert (=> b!746574 m!697315))

(assert (=> b!746581 m!697313))

(assert (=> b!746581 m!697313))

(declare-fun m!697317 () Bool)

(assert (=> b!746581 m!697317))

(assert (=> b!746581 m!697317))

(assert (=> b!746581 m!697313))

(declare-fun m!697319 () Bool)

(assert (=> b!746581 m!697319))

(declare-fun m!697321 () Bool)

(assert (=> b!746572 m!697321))

(declare-fun m!697323 () Bool)

(assert (=> b!746578 m!697323))

(declare-fun m!697325 () Bool)

(assert (=> b!746583 m!697325))

(declare-fun m!697327 () Bool)

(assert (=> start!65586 m!697327))

(declare-fun m!697329 () Bool)

(assert (=> start!65586 m!697329))

(declare-fun m!697331 () Bool)

(assert (=> b!746580 m!697331))

(declare-fun m!697333 () Bool)

(assert (=> b!746580 m!697333))

(assert (=> b!746580 m!697313))

(assert (=> b!746580 m!697313))

(assert (=> b!746580 m!697315))

(assert (=> b!746576 m!697313))

(assert (=> b!746576 m!697313))

(declare-fun m!697335 () Bool)

(assert (=> b!746576 m!697335))

(declare-fun m!697337 () Bool)

(assert (=> b!746573 m!697337))

(declare-fun m!697339 () Bool)

(assert (=> b!746582 m!697339))

(assert (=> b!746579 m!697313))

(assert (=> b!746579 m!697313))

(declare-fun m!697341 () Bool)

(assert (=> b!746579 m!697341))

(assert (=> b!746585 m!697313))

(assert (=> b!746585 m!697313))

(declare-fun m!697343 () Bool)

(assert (=> b!746585 m!697343))

(declare-fun m!697345 () Bool)

(assert (=> b!746585 m!697345))

(declare-fun m!697347 () Bool)

(assert (=> b!746585 m!697347))

(assert (=> b!746577 m!697313))

(assert (=> b!746577 m!697313))

(declare-fun m!697349 () Bool)

(assert (=> b!746577 m!697349))

(declare-fun m!697351 () Bool)

(assert (=> b!746587 m!697351))

(declare-fun m!697353 () Bool)

(assert (=> b!746587 m!697353))

(declare-fun m!697355 () Bool)

(assert (=> b!746587 m!697355))

(assert (=> b!746587 m!697353))

(assert (=> b!746587 m!697331))

(declare-fun m!697357 () Bool)

(assert (=> b!746587 m!697357))

(check-sat (not b!746580) (not b!746585) (not b!746573) (not b!746587) (not b!746583) (not b!746576) (not b!746582) (not b!746577) (not start!65586) (not b!746581) (not b!746584) (not b!746574) (not b!746578) (not b!746579))
(check-sat)
