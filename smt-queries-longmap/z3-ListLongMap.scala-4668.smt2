; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65052 () Bool)

(assert start!65052)

(declare-fun b!733498 () Bool)

(declare-fun res!492619 () Bool)

(declare-fun e!410502 () Bool)

(assert (=> b!733498 (=> (not res!492619) (not e!410502))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41233 0))(
  ( (array!41234 (arr!19729 (Array (_ BitVec 32) (_ BitVec 64))) (size!20149 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41233)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!733498 (= res!492619 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19729 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733499 () Bool)

(declare-fun res!492617 () Bool)

(declare-fun e!410505 () Bool)

(assert (=> b!733499 (=> (not res!492617) (not e!410505))))

(declare-datatypes ((List!13638 0))(
  ( (Nil!13635) (Cons!13634 (h!14706 (_ BitVec 64)) (t!19945 List!13638)) )
))
(declare-fun arrayNoDuplicates!0 (array!41233 (_ BitVec 32) List!13638) Bool)

(assert (=> b!733499 (= res!492617 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13635))))

(declare-fun b!733500 () Bool)

(declare-fun e!410499 () Bool)

(declare-fun e!410501 () Bool)

(assert (=> b!733500 (= e!410499 e!410501)))

(declare-fun res!492618 () Bool)

(assert (=> b!733500 (=> (not res!492618) (not e!410501))))

(declare-datatypes ((SeekEntryResult!7285 0))(
  ( (MissingZero!7285 (index!31508 (_ BitVec 32))) (Found!7285 (index!31509 (_ BitVec 32))) (Intermediate!7285 (undefined!8097 Bool) (index!31510 (_ BitVec 32)) (x!62663 (_ BitVec 32))) (Undefined!7285) (MissingVacant!7285 (index!31511 (_ BitVec 32))) )
))
(declare-fun lt!325048 () SeekEntryResult!7285)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41233 (_ BitVec 32)) SeekEntryResult!7285)

(assert (=> b!733500 (= res!492618 (= (seekEntryOrOpen!0 (select (arr!19729 a!3186) j!159) a!3186 mask!3328) lt!325048))))

(assert (=> b!733500 (= lt!325048 (Found!7285 j!159))))

(declare-fun b!733501 () Bool)

(assert (=> b!733501 (= e!410505 e!410502)))

(declare-fun res!492623 () Bool)

(assert (=> b!733501 (=> (not res!492623) (not e!410502))))

(declare-fun lt!325049 () SeekEntryResult!7285)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41233 (_ BitVec 32)) SeekEntryResult!7285)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733501 (= res!492623 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19729 a!3186) j!159) mask!3328) (select (arr!19729 a!3186) j!159) a!3186 mask!3328) lt!325049))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!733501 (= lt!325049 (Intermediate!7285 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!733502 () Bool)

(declare-fun res!492624 () Bool)

(declare-fun e!410504 () Bool)

(assert (=> b!733502 (=> (not res!492624) (not e!410504))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!733502 (= res!492624 (validKeyInArray!0 k0!2102))))

(declare-fun b!733503 () Bool)

(declare-fun e!410503 () Bool)

(declare-fun e!410507 () Bool)

(assert (=> b!733503 (= e!410503 e!410507)))

(declare-fun res!492616 () Bool)

(assert (=> b!733503 (=> res!492616 e!410507)))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!733503 (= res!492616 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!325044 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733503 (= lt!325044 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!733504 () Bool)

(declare-fun e!410508 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41233 (_ BitVec 32)) SeekEntryResult!7285)

(assert (=> b!733504 (= e!410508 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19729 a!3186) j!159) a!3186 mask!3328) (Found!7285 j!159)))))

(declare-fun res!492622 () Bool)

(assert (=> start!65052 (=> (not res!492622) (not e!410504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65052 (= res!492622 (validMask!0 mask!3328))))

(assert (=> start!65052 e!410504))

(assert (=> start!65052 true))

(declare-fun array_inv!15588 (array!41233) Bool)

(assert (=> start!65052 (array_inv!15588 a!3186)))

(declare-fun b!733505 () Bool)

(assert (=> b!733505 (= e!410504 e!410505)))

(declare-fun res!492620 () Bool)

(assert (=> b!733505 (=> (not res!492620) (not e!410505))))

(declare-fun lt!325045 () SeekEntryResult!7285)

(assert (=> b!733505 (= res!492620 (or (= lt!325045 (MissingZero!7285 i!1173)) (= lt!325045 (MissingVacant!7285 i!1173))))))

(assert (=> b!733505 (= lt!325045 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!733506 () Bool)

(declare-fun res!492626 () Bool)

(assert (=> b!733506 (=> (not res!492626) (not e!410504))))

(assert (=> b!733506 (= res!492626 (validKeyInArray!0 (select (arr!19729 a!3186) j!159)))))

(declare-fun b!733507 () Bool)

(assert (=> b!733507 (= e!410507 true)))

(declare-fun lt!325043 () SeekEntryResult!7285)

(assert (=> b!733507 (= lt!325043 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19729 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733508 () Bool)

(declare-fun e!410506 () Bool)

(assert (=> b!733508 (= e!410506 (not e!410503))))

(declare-fun res!492621 () Bool)

(assert (=> b!733508 (=> res!492621 e!410503)))

(declare-fun lt!325041 () SeekEntryResult!7285)

(get-info :version)

(assert (=> b!733508 (= res!492621 (or (not ((_ is Intermediate!7285) lt!325041)) (bvsge x!1131 (x!62663 lt!325041))))))

(assert (=> b!733508 e!410499))

(declare-fun res!492631 () Bool)

(assert (=> b!733508 (=> (not res!492631) (not e!410499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41233 (_ BitVec 32)) Bool)

(assert (=> b!733508 (= res!492631 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24967 0))(
  ( (Unit!24968) )
))
(declare-fun lt!325046 () Unit!24967)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41233 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24967)

(assert (=> b!733508 (= lt!325046 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!733509 () Bool)

(assert (=> b!733509 (= e!410508 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19729 a!3186) j!159) a!3186 mask!3328) lt!325049))))

(declare-fun b!733510 () Bool)

(assert (=> b!733510 (= e!410501 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19729 a!3186) j!159) a!3186 mask!3328) lt!325048))))

(declare-fun b!733511 () Bool)

(declare-fun res!492630 () Bool)

(assert (=> b!733511 (=> (not res!492630) (not e!410504))))

(declare-fun arrayContainsKey!0 (array!41233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!733511 (= res!492630 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!733512 () Bool)

(declare-fun res!492627 () Bool)

(assert (=> b!733512 (=> (not res!492627) (not e!410505))))

(assert (=> b!733512 (= res!492627 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20149 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20149 a!3186))))))

(declare-fun b!733513 () Bool)

(assert (=> b!733513 (= e!410502 e!410506)))

(declare-fun res!492615 () Bool)

(assert (=> b!733513 (=> (not res!492615) (not e!410506))))

(declare-fun lt!325047 () SeekEntryResult!7285)

(assert (=> b!733513 (= res!492615 (= lt!325047 lt!325041))))

(declare-fun lt!325050 () array!41233)

(declare-fun lt!325042 () (_ BitVec 64))

(assert (=> b!733513 (= lt!325041 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325042 lt!325050 mask!3328))))

(assert (=> b!733513 (= lt!325047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325042 mask!3328) lt!325042 lt!325050 mask!3328))))

(assert (=> b!733513 (= lt!325042 (select (store (arr!19729 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!733513 (= lt!325050 (array!41234 (store (arr!19729 a!3186) i!1173 k0!2102) (size!20149 a!3186)))))

(declare-fun b!733514 () Bool)

(declare-fun res!492625 () Bool)

(assert (=> b!733514 (=> (not res!492625) (not e!410504))))

(assert (=> b!733514 (= res!492625 (and (= (size!20149 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20149 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20149 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!733515 () Bool)

(declare-fun res!492629 () Bool)

(assert (=> b!733515 (=> (not res!492629) (not e!410505))))

(assert (=> b!733515 (= res!492629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!733516 () Bool)

(declare-fun res!492628 () Bool)

(assert (=> b!733516 (=> (not res!492628) (not e!410502))))

(assert (=> b!733516 (= res!492628 e!410508)))

(declare-fun c!80822 () Bool)

(assert (=> b!733516 (= c!80822 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65052 res!492622) b!733514))

(assert (= (and b!733514 res!492625) b!733506))

(assert (= (and b!733506 res!492626) b!733502))

(assert (= (and b!733502 res!492624) b!733511))

(assert (= (and b!733511 res!492630) b!733505))

(assert (= (and b!733505 res!492620) b!733515))

(assert (= (and b!733515 res!492629) b!733499))

(assert (= (and b!733499 res!492617) b!733512))

(assert (= (and b!733512 res!492627) b!733501))

(assert (= (and b!733501 res!492623) b!733498))

(assert (= (and b!733498 res!492619) b!733516))

(assert (= (and b!733516 c!80822) b!733509))

(assert (= (and b!733516 (not c!80822)) b!733504))

(assert (= (and b!733516 res!492628) b!733513))

(assert (= (and b!733513 res!492615) b!733508))

(assert (= (and b!733508 res!492631) b!733500))

(assert (= (and b!733500 res!492618) b!733510))

(assert (= (and b!733508 (not res!492621)) b!733503))

(assert (= (and b!733503 (not res!492616)) b!733507))

(declare-fun m!686907 () Bool)

(assert (=> b!733511 m!686907))

(declare-fun m!686909 () Bool)

(assert (=> b!733506 m!686909))

(assert (=> b!733506 m!686909))

(declare-fun m!686911 () Bool)

(assert (=> b!733506 m!686911))

(declare-fun m!686913 () Bool)

(assert (=> b!733498 m!686913))

(declare-fun m!686915 () Bool)

(assert (=> start!65052 m!686915))

(declare-fun m!686917 () Bool)

(assert (=> start!65052 m!686917))

(declare-fun m!686919 () Bool)

(assert (=> b!733513 m!686919))

(declare-fun m!686921 () Bool)

(assert (=> b!733513 m!686921))

(declare-fun m!686923 () Bool)

(assert (=> b!733513 m!686923))

(declare-fun m!686925 () Bool)

(assert (=> b!733513 m!686925))

(declare-fun m!686927 () Bool)

(assert (=> b!733513 m!686927))

(assert (=> b!733513 m!686923))

(assert (=> b!733504 m!686909))

(assert (=> b!733504 m!686909))

(declare-fun m!686929 () Bool)

(assert (=> b!733504 m!686929))

(assert (=> b!733500 m!686909))

(assert (=> b!733500 m!686909))

(declare-fun m!686931 () Bool)

(assert (=> b!733500 m!686931))

(declare-fun m!686933 () Bool)

(assert (=> b!733502 m!686933))

(assert (=> b!733507 m!686909))

(assert (=> b!733507 m!686909))

(assert (=> b!733507 m!686929))

(declare-fun m!686935 () Bool)

(assert (=> b!733508 m!686935))

(declare-fun m!686937 () Bool)

(assert (=> b!733508 m!686937))

(declare-fun m!686939 () Bool)

(assert (=> b!733503 m!686939))

(assert (=> b!733501 m!686909))

(assert (=> b!733501 m!686909))

(declare-fun m!686941 () Bool)

(assert (=> b!733501 m!686941))

(assert (=> b!733501 m!686941))

(assert (=> b!733501 m!686909))

(declare-fun m!686943 () Bool)

(assert (=> b!733501 m!686943))

(assert (=> b!733510 m!686909))

(assert (=> b!733510 m!686909))

(declare-fun m!686945 () Bool)

(assert (=> b!733510 m!686945))

(declare-fun m!686947 () Bool)

(assert (=> b!733505 m!686947))

(declare-fun m!686949 () Bool)

(assert (=> b!733499 m!686949))

(assert (=> b!733509 m!686909))

(assert (=> b!733509 m!686909))

(declare-fun m!686951 () Bool)

(assert (=> b!733509 m!686951))

(declare-fun m!686953 () Bool)

(assert (=> b!733515 m!686953))

(check-sat (not b!733508) (not b!733505) (not b!733511) (not b!733499) (not b!733507) (not b!733509) (not b!733501) (not b!733515) (not b!733502) (not b!733510) (not b!733503) (not b!733513) (not b!733504) (not b!733500) (not b!733506) (not start!65052))
(check-sat)
