; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65490 () Bool)

(assert start!65490)

(declare-fun b!743867 () Bool)

(declare-fun e!415722 () Bool)

(declare-fun e!415720 () Bool)

(assert (=> b!743867 (= e!415722 e!415720)))

(declare-fun res!500554 () Bool)

(assert (=> b!743867 (=> (not res!500554) (not e!415720))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7432 0))(
  ( (MissingZero!7432 (index!32096 (_ BitVec 32))) (Found!7432 (index!32097 (_ BitVec 32))) (Intermediate!7432 (undefined!8244 Bool) (index!32098 (_ BitVec 32)) (x!63226 (_ BitVec 32))) (Undefined!7432) (MissingVacant!7432 (index!32099 (_ BitVec 32))) )
))
(declare-fun lt!330438 () SeekEntryResult!7432)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41533 0))(
  ( (array!41534 (arr!19876 (Array (_ BitVec 32) (_ BitVec 64))) (size!20296 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41533)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41533 (_ BitVec 32)) SeekEntryResult!7432)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743867 (= res!500554 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19876 a!3186) j!159) mask!3328) (select (arr!19876 a!3186) j!159) a!3186 mask!3328) lt!330438))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743867 (= lt!330438 (Intermediate!7432 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!500557 () Bool)

(declare-fun e!415725 () Bool)

(assert (=> start!65490 (=> (not res!500557) (not e!415725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65490 (= res!500557 (validMask!0 mask!3328))))

(assert (=> start!65490 e!415725))

(assert (=> start!65490 true))

(declare-fun array_inv!15735 (array!41533) Bool)

(assert (=> start!65490 (array_inv!15735 a!3186)))

(declare-fun b!743868 () Bool)

(declare-fun e!415723 () Bool)

(declare-fun e!415724 () Bool)

(assert (=> b!743868 (= e!415723 e!415724)))

(declare-fun res!500551 () Bool)

(assert (=> b!743868 (=> (not res!500551) (not e!415724))))

(declare-fun lt!330435 () SeekEntryResult!7432)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41533 (_ BitVec 32)) SeekEntryResult!7432)

(assert (=> b!743868 (= res!500551 (= (seekEntryOrOpen!0 (select (arr!19876 a!3186) j!159) a!3186 mask!3328) lt!330435))))

(assert (=> b!743868 (= lt!330435 (Found!7432 j!159))))

(declare-fun b!743869 () Bool)

(declare-fun res!500559 () Bool)

(assert (=> b!743869 (=> (not res!500559) (not e!415725))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743869 (= res!500559 (and (= (size!20296 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20296 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20296 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743870 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!415717 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41533 (_ BitVec 32)) SeekEntryResult!7432)

(assert (=> b!743870 (= e!415717 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19876 a!3186) j!159) a!3186 mask!3328) (Found!7432 j!159)))))

(declare-fun b!743871 () Bool)

(assert (=> b!743871 (= e!415725 e!415722)))

(declare-fun res!500556 () Bool)

(assert (=> b!743871 (=> (not res!500556) (not e!415722))))

(declare-fun lt!330440 () SeekEntryResult!7432)

(assert (=> b!743871 (= res!500556 (or (= lt!330440 (MissingZero!7432 i!1173)) (= lt!330440 (MissingVacant!7432 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!743871 (= lt!330440 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!743872 () Bool)

(declare-fun res!500553 () Bool)

(assert (=> b!743872 (=> (not res!500553) (not e!415722))))

(declare-datatypes ((List!13785 0))(
  ( (Nil!13782) (Cons!13781 (h!14859 (_ BitVec 64)) (t!20092 List!13785)) )
))
(declare-fun arrayNoDuplicates!0 (array!41533 (_ BitVec 32) List!13785) Bool)

(assert (=> b!743872 (= res!500553 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13782))))

(declare-fun b!743873 () Bool)

(declare-fun e!415719 () Bool)

(assert (=> b!743873 (= e!415720 e!415719)))

(declare-fun res!500558 () Bool)

(assert (=> b!743873 (=> (not res!500558) (not e!415719))))

(declare-fun lt!330434 () SeekEntryResult!7432)

(declare-fun lt!330439 () SeekEntryResult!7432)

(assert (=> b!743873 (= res!500558 (= lt!330434 lt!330439))))

(declare-fun lt!330436 () array!41533)

(declare-fun lt!330441 () (_ BitVec 64))

(assert (=> b!743873 (= lt!330439 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330441 lt!330436 mask!3328))))

(assert (=> b!743873 (= lt!330434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330441 mask!3328) lt!330441 lt!330436 mask!3328))))

(assert (=> b!743873 (= lt!330441 (select (store (arr!19876 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743873 (= lt!330436 (array!41534 (store (arr!19876 a!3186) i!1173 k0!2102) (size!20296 a!3186)))))

(declare-fun b!743874 () Bool)

(declare-fun res!500565 () Bool)

(declare-fun e!415718 () Bool)

(assert (=> b!743874 (=> res!500565 e!415718)))

(assert (=> b!743874 (= res!500565 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19876 a!3186) j!159) a!3186 mask!3328) (Found!7432 j!159))))))

(declare-fun b!743875 () Bool)

(declare-fun res!500560 () Bool)

(assert (=> b!743875 (=> res!500560 e!415718)))

(assert (=> b!743875 (= res!500560 (or (not (= (select (store (arr!19876 a!3186) i!1173 k0!2102) index!1321) lt!330441)) (undefined!8244 lt!330439)))))

(declare-fun b!743876 () Bool)

(assert (=> b!743876 (= e!415719 (not e!415718))))

(declare-fun res!500561 () Bool)

(assert (=> b!743876 (=> res!500561 e!415718)))

(get-info :version)

(assert (=> b!743876 (= res!500561 (or (not ((_ is Intermediate!7432) lt!330439)) (bvslt x!1131 (x!63226 lt!330439)) (not (= x!1131 (x!63226 lt!330439))) (not (= index!1321 (index!32098 lt!330439)))))))

(assert (=> b!743876 e!415723))

(declare-fun res!500563 () Bool)

(assert (=> b!743876 (=> (not res!500563) (not e!415723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41533 (_ BitVec 32)) Bool)

(assert (=> b!743876 (= res!500563 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25423 0))(
  ( (Unit!25424) )
))
(declare-fun lt!330437 () Unit!25423)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41533 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25423)

(assert (=> b!743876 (= lt!330437 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743877 () Bool)

(assert (=> b!743877 (= e!415718 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!743878 () Bool)

(assert (=> b!743878 (= e!415717 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19876 a!3186) j!159) a!3186 mask!3328) lt!330438))))

(declare-fun b!743879 () Bool)

(assert (=> b!743879 (= e!415724 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19876 a!3186) j!159) a!3186 mask!3328) lt!330435))))

(declare-fun b!743880 () Bool)

(declare-fun res!500555 () Bool)

(assert (=> b!743880 (=> (not res!500555) (not e!415725))))

(declare-fun arrayContainsKey!0 (array!41533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743880 (= res!500555 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743881 () Bool)

(declare-fun res!500566 () Bool)

(assert (=> b!743881 (=> (not res!500566) (not e!415722))))

(assert (=> b!743881 (= res!500566 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20296 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20296 a!3186))))))

(declare-fun b!743882 () Bool)

(declare-fun res!500548 () Bool)

(assert (=> b!743882 (=> (not res!500548) (not e!415722))))

(assert (=> b!743882 (= res!500548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743883 () Bool)

(declare-fun res!500549 () Bool)

(assert (=> b!743883 (=> (not res!500549) (not e!415720))))

(assert (=> b!743883 (= res!500549 e!415717)))

(declare-fun c!82043 () Bool)

(assert (=> b!743883 (= c!82043 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743884 () Bool)

(declare-fun res!500550 () Bool)

(assert (=> b!743884 (=> res!500550 e!415718)))

(assert (=> b!743884 (= res!500550 (not (= (seekEntryOrOpen!0 lt!330441 lt!330436 mask!3328) (Found!7432 index!1321))))))

(declare-fun b!743885 () Bool)

(declare-fun res!500562 () Bool)

(assert (=> b!743885 (=> (not res!500562) (not e!415725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743885 (= res!500562 (validKeyInArray!0 k0!2102))))

(declare-fun b!743886 () Bool)

(declare-fun res!500564 () Bool)

(assert (=> b!743886 (=> (not res!500564) (not e!415725))))

(assert (=> b!743886 (= res!500564 (validKeyInArray!0 (select (arr!19876 a!3186) j!159)))))

(declare-fun b!743887 () Bool)

(declare-fun res!500552 () Bool)

(assert (=> b!743887 (=> (not res!500552) (not e!415720))))

(assert (=> b!743887 (= res!500552 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19876 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65490 res!500557) b!743869))

(assert (= (and b!743869 res!500559) b!743886))

(assert (= (and b!743886 res!500564) b!743885))

(assert (= (and b!743885 res!500562) b!743880))

(assert (= (and b!743880 res!500555) b!743871))

(assert (= (and b!743871 res!500556) b!743882))

(assert (= (and b!743882 res!500548) b!743872))

(assert (= (and b!743872 res!500553) b!743881))

(assert (= (and b!743881 res!500566) b!743867))

(assert (= (and b!743867 res!500554) b!743887))

(assert (= (and b!743887 res!500552) b!743883))

(assert (= (and b!743883 c!82043) b!743878))

(assert (= (and b!743883 (not c!82043)) b!743870))

(assert (= (and b!743883 res!500549) b!743873))

(assert (= (and b!743873 res!500558) b!743876))

(assert (= (and b!743876 res!500563) b!743868))

(assert (= (and b!743868 res!500551) b!743879))

(assert (= (and b!743876 (not res!500561)) b!743874))

(assert (= (and b!743874 (not res!500565)) b!743875))

(assert (= (and b!743875 (not res!500560)) b!743884))

(assert (= (and b!743884 (not res!500550)) b!743877))

(declare-fun m!695031 () Bool)

(assert (=> b!743879 m!695031))

(assert (=> b!743879 m!695031))

(declare-fun m!695033 () Bool)

(assert (=> b!743879 m!695033))

(assert (=> b!743870 m!695031))

(assert (=> b!743870 m!695031))

(declare-fun m!695035 () Bool)

(assert (=> b!743870 m!695035))

(assert (=> b!743868 m!695031))

(assert (=> b!743868 m!695031))

(declare-fun m!695037 () Bool)

(assert (=> b!743868 m!695037))

(declare-fun m!695039 () Bool)

(assert (=> b!743871 m!695039))

(assert (=> b!743878 m!695031))

(assert (=> b!743878 m!695031))

(declare-fun m!695041 () Bool)

(assert (=> b!743878 m!695041))

(assert (=> b!743867 m!695031))

(assert (=> b!743867 m!695031))

(declare-fun m!695043 () Bool)

(assert (=> b!743867 m!695043))

(assert (=> b!743867 m!695043))

(assert (=> b!743867 m!695031))

(declare-fun m!695045 () Bool)

(assert (=> b!743867 m!695045))

(declare-fun m!695047 () Bool)

(assert (=> b!743872 m!695047))

(declare-fun m!695049 () Bool)

(assert (=> b!743885 m!695049))

(declare-fun m!695051 () Bool)

(assert (=> b!743882 m!695051))

(declare-fun m!695053 () Bool)

(assert (=> b!743876 m!695053))

(declare-fun m!695055 () Bool)

(assert (=> b!743876 m!695055))

(declare-fun m!695057 () Bool)

(assert (=> b!743880 m!695057))

(declare-fun m!695059 () Bool)

(assert (=> b!743873 m!695059))

(declare-fun m!695061 () Bool)

(assert (=> b!743873 m!695061))

(declare-fun m!695063 () Bool)

(assert (=> b!743873 m!695063))

(declare-fun m!695065 () Bool)

(assert (=> b!743873 m!695065))

(assert (=> b!743873 m!695059))

(declare-fun m!695067 () Bool)

(assert (=> b!743873 m!695067))

(declare-fun m!695069 () Bool)

(assert (=> b!743884 m!695069))

(assert (=> b!743886 m!695031))

(assert (=> b!743886 m!695031))

(declare-fun m!695071 () Bool)

(assert (=> b!743886 m!695071))

(declare-fun m!695073 () Bool)

(assert (=> start!65490 m!695073))

(declare-fun m!695075 () Bool)

(assert (=> start!65490 m!695075))

(assert (=> b!743875 m!695063))

(declare-fun m!695077 () Bool)

(assert (=> b!743875 m!695077))

(assert (=> b!743874 m!695031))

(assert (=> b!743874 m!695031))

(assert (=> b!743874 m!695035))

(declare-fun m!695079 () Bool)

(assert (=> b!743887 m!695079))

(check-sat (not start!65490) (not b!743886) (not b!743878) (not b!743867) (not b!743880) (not b!743884) (not b!743879) (not b!743882) (not b!743874) (not b!743873) (not b!743876) (not b!743885) (not b!743872) (not b!743870) (not b!743868) (not b!743871))
(check-sat)
