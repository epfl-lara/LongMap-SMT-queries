; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65174 () Bool)

(assert start!65174)

(declare-fun b!737514 () Bool)

(declare-fun e!412488 () Bool)

(assert (=> b!737514 (= e!412488 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!327133 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7393 0))(
  ( (MissingZero!7393 (index!31940 (_ BitVec 32))) (Found!7393 (index!31941 (_ BitVec 32))) (Intermediate!7393 (undefined!8205 Bool) (index!31942 (_ BitVec 32)) (x!62946 (_ BitVec 32))) (Undefined!7393) (MissingVacant!7393 (index!31943 (_ BitVec 32))) )
))
(declare-fun lt!327143 () SeekEntryResult!7393)

(declare-datatypes ((array!41364 0))(
  ( (array!41365 (arr!19796 (Array (_ BitVec 32) (_ BitVec 64))) (size!20217 (_ BitVec 32))) )
))
(declare-fun lt!327142 () array!41364)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!327139 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41364 (_ BitVec 32)) SeekEntryResult!7393)

(assert (=> b!737514 (= lt!327143 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327139 lt!327133 lt!327142 mask!3328))))

(declare-fun b!737515 () Bool)

(declare-fun e!412481 () Bool)

(declare-fun e!412487 () Bool)

(assert (=> b!737515 (= e!412481 (not e!412487))))

(declare-fun res!495823 () Bool)

(assert (=> b!737515 (=> res!495823 e!412487)))

(declare-fun lt!327131 () SeekEntryResult!7393)

(get-info :version)

(assert (=> b!737515 (= res!495823 (or (not ((_ is Intermediate!7393) lt!327131)) (bvsge x!1131 (x!62946 lt!327131))))))

(declare-fun lt!327130 () SeekEntryResult!7393)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!737515 (= lt!327130 (Found!7393 j!159))))

(declare-fun e!412484 () Bool)

(assert (=> b!737515 e!412484))

(declare-fun res!495827 () Bool)

(assert (=> b!737515 (=> (not res!495827) (not e!412484))))

(declare-fun a!3186 () array!41364)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41364 (_ BitVec 32)) Bool)

(assert (=> b!737515 (= res!495827 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25148 0))(
  ( (Unit!25149) )
))
(declare-fun lt!327140 () Unit!25148)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25148)

(assert (=> b!737515 (= lt!327140 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!412485 () Bool)

(declare-fun b!737516 () Bool)

(declare-fun lt!327132 () SeekEntryResult!7393)

(assert (=> b!737516 (= e!412485 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327139 (select (arr!19796 a!3186) j!159) a!3186 mask!3328) lt!327132)))))

(declare-fun b!737517 () Bool)

(declare-fun res!495820 () Bool)

(declare-fun e!412492 () Bool)

(assert (=> b!737517 (=> (not res!495820) (not e!412492))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737517 (= res!495820 (and (= (size!20217 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20217 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20217 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737518 () Bool)

(declare-fun res!495813 () Bool)

(assert (=> b!737518 (=> (not res!495813) (not e!412492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737518 (= res!495813 (validKeyInArray!0 (select (arr!19796 a!3186) j!159)))))

(declare-fun b!737519 () Bool)

(declare-fun e!412486 () Bool)

(assert (=> b!737519 (= e!412486 e!412481)))

(declare-fun res!495819 () Bool)

(assert (=> b!737519 (=> (not res!495819) (not e!412481))))

(declare-fun lt!327138 () SeekEntryResult!7393)

(assert (=> b!737519 (= res!495819 (= lt!327138 lt!327131))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!737519 (= lt!327131 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327133 lt!327142 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737519 (= lt!327138 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327133 mask!3328) lt!327133 lt!327142 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!737519 (= lt!327133 (select (store (arr!19796 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!737519 (= lt!327142 (array!41365 (store (arr!19796 a!3186) i!1173 k0!2102) (size!20217 a!3186)))))

(declare-fun b!737520 () Bool)

(declare-fun e!412490 () Bool)

(assert (=> b!737520 (= e!412490 e!412486)))

(declare-fun res!495817 () Bool)

(assert (=> b!737520 (=> (not res!495817) (not e!412486))))

(assert (=> b!737520 (= res!495817 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19796 a!3186) j!159) mask!3328) (select (arr!19796 a!3186) j!159) a!3186 mask!3328) lt!327132))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!737520 (= lt!327132 (Intermediate!7393 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737521 () Bool)

(assert (=> b!737521 (= e!412492 e!412490)))

(declare-fun res!495816 () Bool)

(assert (=> b!737521 (=> (not res!495816) (not e!412490))))

(declare-fun lt!327141 () SeekEntryResult!7393)

(assert (=> b!737521 (= res!495816 (or (= lt!327141 (MissingZero!7393 i!1173)) (= lt!327141 (MissingVacant!7393 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41364 (_ BitVec 32)) SeekEntryResult!7393)

(assert (=> b!737521 (= lt!327141 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!737522 () Bool)

(declare-fun res!495826 () Bool)

(assert (=> b!737522 (=> (not res!495826) (not e!412486))))

(declare-fun e!412483 () Bool)

(assert (=> b!737522 (= res!495826 e!412483)))

(declare-fun c!81232 () Bool)

(assert (=> b!737522 (= c!81232 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!737523 () Bool)

(declare-fun res!495828 () Bool)

(assert (=> b!737523 (=> (not res!495828) (not e!412492))))

(assert (=> b!737523 (= res!495828 (validKeyInArray!0 k0!2102))))

(declare-fun b!737524 () Bool)

(declare-fun e!412491 () Unit!25148)

(declare-fun Unit!25150 () Unit!25148)

(assert (=> b!737524 (= e!412491 Unit!25150)))

(declare-fun lt!327134 () SeekEntryResult!7393)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41364 (_ BitVec 32)) SeekEntryResult!7393)

(assert (=> b!737524 (= lt!327134 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19796 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!737524 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327139 resIntermediateIndex!5 (select (arr!19796 a!3186) j!159) a!3186 mask!3328) lt!327130)))

(declare-fun b!737525 () Bool)

(declare-fun e!412482 () Bool)

(assert (=> b!737525 (= e!412484 e!412482)))

(declare-fun res!495812 () Bool)

(assert (=> b!737525 (=> (not res!495812) (not e!412482))))

(declare-fun lt!327135 () SeekEntryResult!7393)

(assert (=> b!737525 (= res!495812 (= (seekEntryOrOpen!0 (select (arr!19796 a!3186) j!159) a!3186 mask!3328) lt!327135))))

(assert (=> b!737525 (= lt!327135 (Found!7393 j!159))))

(declare-fun res!495824 () Bool)

(assert (=> start!65174 (=> (not res!495824) (not e!412492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65174 (= res!495824 (validMask!0 mask!3328))))

(assert (=> start!65174 e!412492))

(assert (=> start!65174 true))

(declare-fun array_inv!15679 (array!41364) Bool)

(assert (=> start!65174 (array_inv!15679 a!3186)))

(declare-fun b!737526 () Bool)

(declare-fun res!495818 () Bool)

(assert (=> b!737526 (=> (not res!495818) (not e!412490))))

(assert (=> b!737526 (= res!495818 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20217 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20217 a!3186))))))

(declare-fun b!737527 () Bool)

(assert (=> b!737527 (= e!412483 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19796 a!3186) j!159) a!3186 mask!3328) lt!327132))))

(declare-fun b!737528 () Bool)

(declare-fun res!495815 () Bool)

(assert (=> b!737528 (=> (not res!495815) (not e!412486))))

(assert (=> b!737528 (= res!495815 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19796 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737529 () Bool)

(declare-fun Unit!25151 () Unit!25148)

(assert (=> b!737529 (= e!412491 Unit!25151)))

(assert (=> b!737529 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327139 (select (arr!19796 a!3186) j!159) a!3186 mask!3328) lt!327132)))

(declare-fun b!737530 () Bool)

(assert (=> b!737530 (= e!412482 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19796 a!3186) j!159) a!3186 mask!3328) lt!327135))))

(declare-fun b!737531 () Bool)

(declare-fun res!495811 () Bool)

(assert (=> b!737531 (=> (not res!495811) (not e!412490))))

(assert (=> b!737531 (= res!495811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737532 () Bool)

(declare-fun res!495825 () Bool)

(assert (=> b!737532 (=> res!495825 e!412488)))

(assert (=> b!737532 (= res!495825 e!412485)))

(declare-fun c!81233 () Bool)

(declare-fun lt!327137 () Bool)

(assert (=> b!737532 (= c!81233 lt!327137)))

(declare-fun b!737533 () Bool)

(declare-fun res!495821 () Bool)

(assert (=> b!737533 (=> (not res!495821) (not e!412490))))

(declare-datatypes ((List!13837 0))(
  ( (Nil!13834) (Cons!13833 (h!14905 (_ BitVec 64)) (t!20143 List!13837)) )
))
(declare-fun arrayNoDuplicates!0 (array!41364 (_ BitVec 32) List!13837) Bool)

(assert (=> b!737533 (= res!495821 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13834))))

(declare-fun b!737534 () Bool)

(assert (=> b!737534 (= e!412485 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327139 resIntermediateIndex!5 (select (arr!19796 a!3186) j!159) a!3186 mask!3328) lt!327130)))))

(declare-fun b!737535 () Bool)

(assert (=> b!737535 (= e!412487 e!412488)))

(declare-fun res!495822 () Bool)

(assert (=> b!737535 (=> res!495822 e!412488)))

(assert (=> b!737535 (= res!495822 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327139 #b00000000000000000000000000000000) (bvsge lt!327139 (size!20217 a!3186))))))

(declare-fun lt!327136 () Unit!25148)

(assert (=> b!737535 (= lt!327136 e!412491)))

(declare-fun c!81234 () Bool)

(assert (=> b!737535 (= c!81234 lt!327137)))

(assert (=> b!737535 (= lt!327137 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737535 (= lt!327139 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!737536 () Bool)

(declare-fun res!495814 () Bool)

(assert (=> b!737536 (=> (not res!495814) (not e!412492))))

(declare-fun arrayContainsKey!0 (array!41364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737536 (= res!495814 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737537 () Bool)

(assert (=> b!737537 (= e!412483 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19796 a!3186) j!159) a!3186 mask!3328) (Found!7393 j!159)))))

(assert (= (and start!65174 res!495824) b!737517))

(assert (= (and b!737517 res!495820) b!737518))

(assert (= (and b!737518 res!495813) b!737523))

(assert (= (and b!737523 res!495828) b!737536))

(assert (= (and b!737536 res!495814) b!737521))

(assert (= (and b!737521 res!495816) b!737531))

(assert (= (and b!737531 res!495811) b!737533))

(assert (= (and b!737533 res!495821) b!737526))

(assert (= (and b!737526 res!495818) b!737520))

(assert (= (and b!737520 res!495817) b!737528))

(assert (= (and b!737528 res!495815) b!737522))

(assert (= (and b!737522 c!81232) b!737527))

(assert (= (and b!737522 (not c!81232)) b!737537))

(assert (= (and b!737522 res!495826) b!737519))

(assert (= (and b!737519 res!495819) b!737515))

(assert (= (and b!737515 res!495827) b!737525))

(assert (= (and b!737525 res!495812) b!737530))

(assert (= (and b!737515 (not res!495823)) b!737535))

(assert (= (and b!737535 c!81234) b!737529))

(assert (= (and b!737535 (not c!81234)) b!737524))

(assert (= (and b!737535 (not res!495822)) b!737532))

(assert (= (and b!737532 c!81233) b!737516))

(assert (= (and b!737532 (not c!81233)) b!737534))

(assert (= (and b!737532 (not res!495825)) b!737514))

(declare-fun m!688805 () Bool)

(assert (=> b!737535 m!688805))

(declare-fun m!688807 () Bool)

(assert (=> b!737537 m!688807))

(assert (=> b!737537 m!688807))

(declare-fun m!688809 () Bool)

(assert (=> b!737537 m!688809))

(declare-fun m!688811 () Bool)

(assert (=> b!737521 m!688811))

(declare-fun m!688813 () Bool)

(assert (=> start!65174 m!688813))

(declare-fun m!688815 () Bool)

(assert (=> start!65174 m!688815))

(assert (=> b!737530 m!688807))

(assert (=> b!737530 m!688807))

(declare-fun m!688817 () Bool)

(assert (=> b!737530 m!688817))

(declare-fun m!688819 () Bool)

(assert (=> b!737519 m!688819))

(declare-fun m!688821 () Bool)

(assert (=> b!737519 m!688821))

(declare-fun m!688823 () Bool)

(assert (=> b!737519 m!688823))

(declare-fun m!688825 () Bool)

(assert (=> b!737519 m!688825))

(declare-fun m!688827 () Bool)

(assert (=> b!737519 m!688827))

(assert (=> b!737519 m!688819))

(assert (=> b!737520 m!688807))

(assert (=> b!737520 m!688807))

(declare-fun m!688829 () Bool)

(assert (=> b!737520 m!688829))

(assert (=> b!737520 m!688829))

(assert (=> b!737520 m!688807))

(declare-fun m!688831 () Bool)

(assert (=> b!737520 m!688831))

(declare-fun m!688833 () Bool)

(assert (=> b!737531 m!688833))

(declare-fun m!688835 () Bool)

(assert (=> b!737523 m!688835))

(assert (=> b!737527 m!688807))

(assert (=> b!737527 m!688807))

(declare-fun m!688837 () Bool)

(assert (=> b!737527 m!688837))

(assert (=> b!737534 m!688807))

(assert (=> b!737534 m!688807))

(declare-fun m!688839 () Bool)

(assert (=> b!737534 m!688839))

(declare-fun m!688841 () Bool)

(assert (=> b!737528 m!688841))

(assert (=> b!737516 m!688807))

(assert (=> b!737516 m!688807))

(declare-fun m!688843 () Bool)

(assert (=> b!737516 m!688843))

(declare-fun m!688845 () Bool)

(assert (=> b!737514 m!688845))

(assert (=> b!737518 m!688807))

(assert (=> b!737518 m!688807))

(declare-fun m!688847 () Bool)

(assert (=> b!737518 m!688847))

(assert (=> b!737525 m!688807))

(assert (=> b!737525 m!688807))

(declare-fun m!688849 () Bool)

(assert (=> b!737525 m!688849))

(assert (=> b!737529 m!688807))

(assert (=> b!737529 m!688807))

(assert (=> b!737529 m!688843))

(declare-fun m!688851 () Bool)

(assert (=> b!737536 m!688851))

(declare-fun m!688853 () Bool)

(assert (=> b!737515 m!688853))

(declare-fun m!688855 () Bool)

(assert (=> b!737515 m!688855))

(declare-fun m!688857 () Bool)

(assert (=> b!737533 m!688857))

(assert (=> b!737524 m!688807))

(assert (=> b!737524 m!688807))

(assert (=> b!737524 m!688809))

(assert (=> b!737524 m!688807))

(assert (=> b!737524 m!688839))

(check-sat (not start!65174) (not b!737521) (not b!737525) (not b!737519) (not b!737524) (not b!737530) (not b!737520) (not b!737523) (not b!737537) (not b!737531) (not b!737529) (not b!737515) (not b!737514) (not b!737527) (not b!737535) (not b!737516) (not b!737533) (not b!737536) (not b!737518) (not b!737534))
(check-sat)
