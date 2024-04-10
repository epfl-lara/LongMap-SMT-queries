; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65118 () Bool)

(assert start!65118)

(declare-fun b!735048 () Bool)

(declare-fun res!493876 () Bool)

(declare-fun e!411283 () Bool)

(assert (=> b!735048 (=> (not res!493876) (not e!411283))))

(declare-fun e!411278 () Bool)

(assert (=> b!735048 (= res!493876 e!411278)))

(declare-fun c!80968 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735048 (= c!80968 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735049 () Bool)

(declare-fun e!411275 () Bool)

(declare-fun e!411279 () Bool)

(assert (=> b!735049 (= e!411275 e!411279)))

(declare-fun res!493873 () Bool)

(assert (=> b!735049 (=> (not res!493873) (not e!411279))))

(declare-datatypes ((SeekEntryResult!7359 0))(
  ( (MissingZero!7359 (index!31804 (_ BitVec 32))) (Found!7359 (index!31805 (_ BitVec 32))) (Intermediate!7359 (undefined!8171 Bool) (index!31806 (_ BitVec 32)) (x!62813 (_ BitVec 32))) (Undefined!7359) (MissingVacant!7359 (index!31807 (_ BitVec 32))) )
))
(declare-fun lt!325792 () SeekEntryResult!7359)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735049 (= res!493873 (or (= lt!325792 (MissingZero!7359 i!1173)) (= lt!325792 (MissingVacant!7359 i!1173))))))

(declare-datatypes ((array!41291 0))(
  ( (array!41292 (arr!19759 (Array (_ BitVec 32) (_ BitVec 64))) (size!20180 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41291)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41291 (_ BitVec 32)) SeekEntryResult!7359)

(assert (=> b!735049 (= lt!325792 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!735050 () Bool)

(declare-fun e!411282 () Bool)

(declare-fun e!411284 () Bool)

(assert (=> b!735050 (= e!411282 (not e!411284))))

(declare-fun res!493875 () Bool)

(assert (=> b!735050 (=> res!493875 e!411284)))

(declare-fun lt!325793 () SeekEntryResult!7359)

(get-info :version)

(assert (=> b!735050 (= res!493875 (or (not ((_ is Intermediate!7359) lt!325793)) (bvsge x!1131 (x!62813 lt!325793))))))

(declare-fun e!411276 () Bool)

(assert (=> b!735050 e!411276))

(declare-fun res!493877 () Bool)

(assert (=> b!735050 (=> (not res!493877) (not e!411276))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41291 (_ BitVec 32)) Bool)

(assert (=> b!735050 (= res!493877 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25036 0))(
  ( (Unit!25037) )
))
(declare-fun lt!325794 () Unit!25036)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41291 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25036)

(assert (=> b!735050 (= lt!325794 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735051 () Bool)

(assert (=> b!735051 (= e!411283 e!411282)))

(declare-fun res!493880 () Bool)

(assert (=> b!735051 (=> (not res!493880) (not e!411282))))

(declare-fun lt!325796 () SeekEntryResult!7359)

(assert (=> b!735051 (= res!493880 (= lt!325796 lt!325793))))

(declare-fun lt!325798 () array!41291)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!325797 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41291 (_ BitVec 32)) SeekEntryResult!7359)

(assert (=> b!735051 (= lt!325793 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325797 lt!325798 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735051 (= lt!325796 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325797 mask!3328) lt!325797 lt!325798 mask!3328))))

(assert (=> b!735051 (= lt!325797 (select (store (arr!19759 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!735051 (= lt!325798 (array!41292 (store (arr!19759 a!3186) i!1173 k0!2102) (size!20180 a!3186)))))

(declare-fun b!735052 () Bool)

(declare-fun e!411280 () Bool)

(assert (=> b!735052 (= e!411276 e!411280)))

(declare-fun res!493884 () Bool)

(assert (=> b!735052 (=> (not res!493884) (not e!411280))))

(declare-fun lt!325791 () SeekEntryResult!7359)

(assert (=> b!735052 (= res!493884 (= (seekEntryOrOpen!0 (select (arr!19759 a!3186) j!159) a!3186 mask!3328) lt!325791))))

(assert (=> b!735052 (= lt!325791 (Found!7359 j!159))))

(declare-fun b!735053 () Bool)

(declare-fun e!411277 () Bool)

(assert (=> b!735053 (= e!411277 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!325795 () SeekEntryResult!7359)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41291 (_ BitVec 32)) SeekEntryResult!7359)

(assert (=> b!735053 (= lt!325795 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19759 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!735054 () Bool)

(declare-fun res!493886 () Bool)

(assert (=> b!735054 (=> (not res!493886) (not e!411279))))

(assert (=> b!735054 (= res!493886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735055 () Bool)

(declare-fun res!493888 () Bool)

(assert (=> b!735055 (=> (not res!493888) (not e!411279))))

(declare-datatypes ((List!13761 0))(
  ( (Nil!13758) (Cons!13757 (h!14829 (_ BitVec 64)) (t!20076 List!13761)) )
))
(declare-fun arrayNoDuplicates!0 (array!41291 (_ BitVec 32) List!13761) Bool)

(assert (=> b!735055 (= res!493888 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13758))))

(declare-fun b!735056 () Bool)

(declare-fun res!493883 () Bool)

(assert (=> b!735056 (=> (not res!493883) (not e!411283))))

(assert (=> b!735056 (= res!493883 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19759 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735057 () Bool)

(assert (=> b!735057 (= e!411279 e!411283)))

(declare-fun res!493887 () Bool)

(assert (=> b!735057 (=> (not res!493887) (not e!411283))))

(declare-fun lt!325799 () SeekEntryResult!7359)

(assert (=> b!735057 (= res!493887 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19759 a!3186) j!159) mask!3328) (select (arr!19759 a!3186) j!159) a!3186 mask!3328) lt!325799))))

(assert (=> b!735057 (= lt!325799 (Intermediate!7359 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735058 () Bool)

(assert (=> b!735058 (= e!411284 e!411277)))

(declare-fun res!493889 () Bool)

(assert (=> b!735058 (=> res!493889 e!411277)))

(assert (=> b!735058 (= res!493889 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!325790 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735058 (= lt!325790 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!735059 () Bool)

(declare-fun res!493881 () Bool)

(assert (=> b!735059 (=> (not res!493881) (not e!411275))))

(assert (=> b!735059 (= res!493881 (and (= (size!20180 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20180 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20180 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735060 () Bool)

(declare-fun res!493878 () Bool)

(assert (=> b!735060 (=> (not res!493878) (not e!411275))))

(declare-fun arrayContainsKey!0 (array!41291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735060 (= res!493878 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735061 () Bool)

(assert (=> b!735061 (= e!411278 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19759 a!3186) j!159) a!3186 mask!3328) (Found!7359 j!159)))))

(declare-fun res!493879 () Bool)

(assert (=> start!65118 (=> (not res!493879) (not e!411275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65118 (= res!493879 (validMask!0 mask!3328))))

(assert (=> start!65118 e!411275))

(assert (=> start!65118 true))

(declare-fun array_inv!15555 (array!41291) Bool)

(assert (=> start!65118 (array_inv!15555 a!3186)))

(declare-fun b!735062 () Bool)

(assert (=> b!735062 (= e!411278 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19759 a!3186) j!159) a!3186 mask!3328) lt!325799))))

(declare-fun b!735063 () Bool)

(declare-fun res!493882 () Bool)

(assert (=> b!735063 (=> (not res!493882) (not e!411275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735063 (= res!493882 (validKeyInArray!0 k0!2102))))

(declare-fun b!735064 () Bool)

(declare-fun res!493885 () Bool)

(assert (=> b!735064 (=> (not res!493885) (not e!411275))))

(assert (=> b!735064 (= res!493885 (validKeyInArray!0 (select (arr!19759 a!3186) j!159)))))

(declare-fun b!735065 () Bool)

(assert (=> b!735065 (= e!411280 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19759 a!3186) j!159) a!3186 mask!3328) lt!325791))))

(declare-fun b!735066 () Bool)

(declare-fun res!493874 () Bool)

(assert (=> b!735066 (=> (not res!493874) (not e!411279))))

(assert (=> b!735066 (= res!493874 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20180 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20180 a!3186))))))

(assert (= (and start!65118 res!493879) b!735059))

(assert (= (and b!735059 res!493881) b!735064))

(assert (= (and b!735064 res!493885) b!735063))

(assert (= (and b!735063 res!493882) b!735060))

(assert (= (and b!735060 res!493878) b!735049))

(assert (= (and b!735049 res!493873) b!735054))

(assert (= (and b!735054 res!493886) b!735055))

(assert (= (and b!735055 res!493888) b!735066))

(assert (= (and b!735066 res!493874) b!735057))

(assert (= (and b!735057 res!493887) b!735056))

(assert (= (and b!735056 res!493883) b!735048))

(assert (= (and b!735048 c!80968) b!735062))

(assert (= (and b!735048 (not c!80968)) b!735061))

(assert (= (and b!735048 res!493876) b!735051))

(assert (= (and b!735051 res!493880) b!735050))

(assert (= (and b!735050 res!493877) b!735052))

(assert (= (and b!735052 res!493884) b!735065))

(assert (= (and b!735050 (not res!493875)) b!735058))

(assert (= (and b!735058 (not res!493889)) b!735053))

(declare-fun m!687523 () Bool)

(assert (=> b!735055 m!687523))

(declare-fun m!687525 () Bool)

(assert (=> b!735063 m!687525))

(declare-fun m!687527 () Bool)

(assert (=> start!65118 m!687527))

(declare-fun m!687529 () Bool)

(assert (=> start!65118 m!687529))

(declare-fun m!687531 () Bool)

(assert (=> b!735053 m!687531))

(assert (=> b!735053 m!687531))

(declare-fun m!687533 () Bool)

(assert (=> b!735053 m!687533))

(assert (=> b!735064 m!687531))

(assert (=> b!735064 m!687531))

(declare-fun m!687535 () Bool)

(assert (=> b!735064 m!687535))

(declare-fun m!687537 () Bool)

(assert (=> b!735051 m!687537))

(assert (=> b!735051 m!687537))

(declare-fun m!687539 () Bool)

(assert (=> b!735051 m!687539))

(declare-fun m!687541 () Bool)

(assert (=> b!735051 m!687541))

(declare-fun m!687543 () Bool)

(assert (=> b!735051 m!687543))

(declare-fun m!687545 () Bool)

(assert (=> b!735051 m!687545))

(declare-fun m!687547 () Bool)

(assert (=> b!735049 m!687547))

(declare-fun m!687549 () Bool)

(assert (=> b!735054 m!687549))

(declare-fun m!687551 () Bool)

(assert (=> b!735058 m!687551))

(assert (=> b!735052 m!687531))

(assert (=> b!735052 m!687531))

(declare-fun m!687553 () Bool)

(assert (=> b!735052 m!687553))

(assert (=> b!735062 m!687531))

(assert (=> b!735062 m!687531))

(declare-fun m!687555 () Bool)

(assert (=> b!735062 m!687555))

(declare-fun m!687557 () Bool)

(assert (=> b!735060 m!687557))

(assert (=> b!735061 m!687531))

(assert (=> b!735061 m!687531))

(assert (=> b!735061 m!687533))

(declare-fun m!687559 () Bool)

(assert (=> b!735050 m!687559))

(declare-fun m!687561 () Bool)

(assert (=> b!735050 m!687561))

(assert (=> b!735057 m!687531))

(assert (=> b!735057 m!687531))

(declare-fun m!687563 () Bool)

(assert (=> b!735057 m!687563))

(assert (=> b!735057 m!687563))

(assert (=> b!735057 m!687531))

(declare-fun m!687565 () Bool)

(assert (=> b!735057 m!687565))

(assert (=> b!735065 m!687531))

(assert (=> b!735065 m!687531))

(declare-fun m!687567 () Bool)

(assert (=> b!735065 m!687567))

(declare-fun m!687569 () Bool)

(assert (=> b!735056 m!687569))

(check-sat (not b!735057) (not b!735062) (not b!735060) (not b!735054) (not b!735049) (not b!735052) (not b!735064) (not start!65118) (not b!735065) (not b!735058) (not b!735050) (not b!735055) (not b!735061) (not b!735051) (not b!735053) (not b!735063))
(check-sat)
