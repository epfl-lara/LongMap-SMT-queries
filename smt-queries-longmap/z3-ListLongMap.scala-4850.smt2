; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66800 () Bool)

(assert start!66800)

(declare-fun b!770396 () Bool)

(declare-fun e!428937 () Bool)

(assert (=> b!770396 (= e!428937 true)))

(declare-datatypes ((Unit!26538 0))(
  ( (Unit!26539) )
))
(declare-fun lt!342877 () Unit!26538)

(declare-fun e!428934 () Unit!26538)

(assert (=> b!770396 (= lt!342877 e!428934)))

(declare-fun c!85036 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770396 (= c!85036 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!342873 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770396 (= lt!342873 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-datatypes ((SeekEntryResult!7881 0))(
  ( (MissingZero!7881 (index!33892 (_ BitVec 32))) (Found!7881 (index!33893 (_ BitVec 32))) (Intermediate!7881 (undefined!8693 Bool) (index!33894 (_ BitVec 32)) (x!64820 (_ BitVec 32))) (Undefined!7881) (MissingVacant!7881 (index!33895 (_ BitVec 32))) )
))
(declare-fun lt!342876 () SeekEntryResult!7881)

(declare-datatypes ((array!42362 0))(
  ( (array!42363 (arr!20281 (Array (_ BitVec 32) (_ BitVec 64))) (size!20702 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42362)

(declare-fun b!770397 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!428938 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42362 (_ BitVec 32)) SeekEntryResult!7881)

(assert (=> b!770397 (= e!428938 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20281 a!3186) j!159) a!3186 mask!3328) lt!342876))))

(declare-fun b!770398 () Bool)

(declare-fun res!521131 () Bool)

(declare-fun e!428933 () Bool)

(assert (=> b!770398 (=> (not res!521131) (not e!428933))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42362 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770398 (= res!521131 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770399 () Bool)

(declare-fun res!521119 () Bool)

(assert (=> b!770399 (=> (not res!521119) (not e!428933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770399 (= res!521119 (validKeyInArray!0 k0!2102))))

(declare-fun b!770400 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42362 (_ BitVec 32)) SeekEntryResult!7881)

(assert (=> b!770400 (= e!428938 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20281 a!3186) j!159) a!3186 mask!3328) (Found!7881 j!159)))))

(declare-fun b!770401 () Bool)

(declare-fun Unit!26540 () Unit!26538)

(assert (=> b!770401 (= e!428934 Unit!26540)))

(assert (=> b!770401 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342873 (select (arr!20281 a!3186) j!159) a!3186 mask!3328) lt!342876)))

(declare-fun b!770402 () Bool)

(declare-fun res!521132 () Bool)

(declare-fun e!428936 () Bool)

(assert (=> b!770402 (=> (not res!521132) (not e!428936))))

(declare-datatypes ((List!14283 0))(
  ( (Nil!14280) (Cons!14279 (h!15378 (_ BitVec 64)) (t!20598 List!14283)) )
))
(declare-fun arrayNoDuplicates!0 (array!42362 (_ BitVec 32) List!14283) Bool)

(assert (=> b!770402 (= res!521132 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14280))))

(declare-fun b!770403 () Bool)

(declare-fun e!428935 () Bool)

(assert (=> b!770403 (= e!428936 e!428935)))

(declare-fun res!521126 () Bool)

(assert (=> b!770403 (=> (not res!521126) (not e!428935))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770403 (= res!521126 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20281 a!3186) j!159) mask!3328) (select (arr!20281 a!3186) j!159) a!3186 mask!3328) lt!342876))))

(assert (=> b!770403 (= lt!342876 (Intermediate!7881 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770404 () Bool)

(declare-fun e!428931 () Bool)

(assert (=> b!770404 (= e!428935 e!428931)))

(declare-fun res!521121 () Bool)

(assert (=> b!770404 (=> (not res!521121) (not e!428931))))

(declare-fun lt!342880 () SeekEntryResult!7881)

(declare-fun lt!342881 () SeekEntryResult!7881)

(assert (=> b!770404 (= res!521121 (= lt!342880 lt!342881))))

(declare-fun lt!342878 () (_ BitVec 64))

(declare-fun lt!342874 () array!42362)

(assert (=> b!770404 (= lt!342881 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342878 lt!342874 mask!3328))))

(assert (=> b!770404 (= lt!342880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342878 mask!3328) lt!342878 lt!342874 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770404 (= lt!342878 (select (store (arr!20281 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!770404 (= lt!342874 (array!42363 (store (arr!20281 a!3186) i!1173 k0!2102) (size!20702 a!3186)))))

(declare-fun b!770405 () Bool)

(declare-fun res!521123 () Bool)

(assert (=> b!770405 (=> (not res!521123) (not e!428936))))

(assert (=> b!770405 (= res!521123 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20702 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20702 a!3186))))))

(declare-fun e!428932 () Bool)

(declare-fun b!770407 () Bool)

(declare-fun lt!342879 () SeekEntryResult!7881)

(assert (=> b!770407 (= e!428932 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20281 a!3186) j!159) a!3186 mask!3328) lt!342879))))

(declare-fun b!770408 () Bool)

(declare-fun res!521124 () Bool)

(assert (=> b!770408 (=> (not res!521124) (not e!428935))))

(assert (=> b!770408 (= res!521124 e!428938)))

(declare-fun c!85035 () Bool)

(assert (=> b!770408 (= c!85035 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770409 () Bool)

(declare-fun res!521129 () Bool)

(assert (=> b!770409 (=> (not res!521129) (not e!428933))))

(assert (=> b!770409 (= res!521129 (validKeyInArray!0 (select (arr!20281 a!3186) j!159)))))

(declare-fun b!770410 () Bool)

(assert (=> b!770410 (= e!428931 (not e!428937))))

(declare-fun res!521118 () Bool)

(assert (=> b!770410 (=> res!521118 e!428937)))

(get-info :version)

(assert (=> b!770410 (= res!521118 (or (not ((_ is Intermediate!7881) lt!342881)) (bvsge x!1131 (x!64820 lt!342881))))))

(declare-fun e!428939 () Bool)

(assert (=> b!770410 e!428939))

(declare-fun res!521125 () Bool)

(assert (=> b!770410 (=> (not res!521125) (not e!428939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42362 (_ BitVec 32)) Bool)

(assert (=> b!770410 (= res!521125 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342875 () Unit!26538)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26538)

(assert (=> b!770410 (= lt!342875 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770411 () Bool)

(declare-fun res!521117 () Bool)

(assert (=> b!770411 (=> (not res!521117) (not e!428936))))

(assert (=> b!770411 (= res!521117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770412 () Bool)

(declare-fun Unit!26541 () Unit!26538)

(assert (=> b!770412 (= e!428934 Unit!26541)))

(declare-fun lt!342872 () SeekEntryResult!7881)

(assert (=> b!770412 (= lt!342872 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20281 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!770412 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342873 resIntermediateIndex!5 (select (arr!20281 a!3186) j!159) a!3186 mask!3328) (Found!7881 j!159))))

(declare-fun b!770413 () Bool)

(assert (=> b!770413 (= e!428939 e!428932)))

(declare-fun res!521127 () Bool)

(assert (=> b!770413 (=> (not res!521127) (not e!428932))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42362 (_ BitVec 32)) SeekEntryResult!7881)

(assert (=> b!770413 (= res!521127 (= (seekEntryOrOpen!0 (select (arr!20281 a!3186) j!159) a!3186 mask!3328) lt!342879))))

(assert (=> b!770413 (= lt!342879 (Found!7881 j!159))))

(declare-fun b!770406 () Bool)

(declare-fun res!521130 () Bool)

(assert (=> b!770406 (=> (not res!521130) (not e!428935))))

(assert (=> b!770406 (= res!521130 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20281 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!521120 () Bool)

(assert (=> start!66800 (=> (not res!521120) (not e!428933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66800 (= res!521120 (validMask!0 mask!3328))))

(assert (=> start!66800 e!428933))

(assert (=> start!66800 true))

(declare-fun array_inv!16077 (array!42362) Bool)

(assert (=> start!66800 (array_inv!16077 a!3186)))

(declare-fun b!770414 () Bool)

(declare-fun res!521122 () Bool)

(assert (=> b!770414 (=> (not res!521122) (not e!428933))))

(assert (=> b!770414 (= res!521122 (and (= (size!20702 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20702 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20702 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770415 () Bool)

(assert (=> b!770415 (= e!428933 e!428936)))

(declare-fun res!521128 () Bool)

(assert (=> b!770415 (=> (not res!521128) (not e!428936))))

(declare-fun lt!342871 () SeekEntryResult!7881)

(assert (=> b!770415 (= res!521128 (or (= lt!342871 (MissingZero!7881 i!1173)) (= lt!342871 (MissingVacant!7881 i!1173))))))

(assert (=> b!770415 (= lt!342871 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!66800 res!521120) b!770414))

(assert (= (and b!770414 res!521122) b!770409))

(assert (= (and b!770409 res!521129) b!770399))

(assert (= (and b!770399 res!521119) b!770398))

(assert (= (and b!770398 res!521131) b!770415))

(assert (= (and b!770415 res!521128) b!770411))

(assert (= (and b!770411 res!521117) b!770402))

(assert (= (and b!770402 res!521132) b!770405))

(assert (= (and b!770405 res!521123) b!770403))

(assert (= (and b!770403 res!521126) b!770406))

(assert (= (and b!770406 res!521130) b!770408))

(assert (= (and b!770408 c!85035) b!770397))

(assert (= (and b!770408 (not c!85035)) b!770400))

(assert (= (and b!770408 res!521124) b!770404))

(assert (= (and b!770404 res!521121) b!770410))

(assert (= (and b!770410 res!521125) b!770413))

(assert (= (and b!770413 res!521127) b!770407))

(assert (= (and b!770410 (not res!521118)) b!770396))

(assert (= (and b!770396 c!85036) b!770401))

(assert (= (and b!770396 (not c!85036)) b!770412))

(declare-fun m!715683 () Bool)

(assert (=> b!770406 m!715683))

(declare-fun m!715685 () Bool)

(assert (=> b!770412 m!715685))

(assert (=> b!770412 m!715685))

(declare-fun m!715687 () Bool)

(assert (=> b!770412 m!715687))

(assert (=> b!770412 m!715685))

(declare-fun m!715689 () Bool)

(assert (=> b!770412 m!715689))

(declare-fun m!715691 () Bool)

(assert (=> b!770399 m!715691))

(declare-fun m!715693 () Bool)

(assert (=> b!770398 m!715693))

(declare-fun m!715695 () Bool)

(assert (=> b!770402 m!715695))

(assert (=> b!770397 m!715685))

(assert (=> b!770397 m!715685))

(declare-fun m!715697 () Bool)

(assert (=> b!770397 m!715697))

(declare-fun m!715699 () Bool)

(assert (=> b!770404 m!715699))

(declare-fun m!715701 () Bool)

(assert (=> b!770404 m!715701))

(assert (=> b!770404 m!715699))

(declare-fun m!715703 () Bool)

(assert (=> b!770404 m!715703))

(declare-fun m!715705 () Bool)

(assert (=> b!770404 m!715705))

(declare-fun m!715707 () Bool)

(assert (=> b!770404 m!715707))

(declare-fun m!715709 () Bool)

(assert (=> b!770410 m!715709))

(declare-fun m!715711 () Bool)

(assert (=> b!770410 m!715711))

(declare-fun m!715713 () Bool)

(assert (=> start!66800 m!715713))

(declare-fun m!715715 () Bool)

(assert (=> start!66800 m!715715))

(declare-fun m!715717 () Bool)

(assert (=> b!770396 m!715717))

(declare-fun m!715719 () Bool)

(assert (=> b!770411 m!715719))

(assert (=> b!770413 m!715685))

(assert (=> b!770413 m!715685))

(declare-fun m!715721 () Bool)

(assert (=> b!770413 m!715721))

(assert (=> b!770400 m!715685))

(assert (=> b!770400 m!715685))

(assert (=> b!770400 m!715687))

(assert (=> b!770401 m!715685))

(assert (=> b!770401 m!715685))

(declare-fun m!715723 () Bool)

(assert (=> b!770401 m!715723))

(assert (=> b!770403 m!715685))

(assert (=> b!770403 m!715685))

(declare-fun m!715725 () Bool)

(assert (=> b!770403 m!715725))

(assert (=> b!770403 m!715725))

(assert (=> b!770403 m!715685))

(declare-fun m!715727 () Bool)

(assert (=> b!770403 m!715727))

(declare-fun m!715729 () Bool)

(assert (=> b!770415 m!715729))

(assert (=> b!770409 m!715685))

(assert (=> b!770409 m!715685))

(declare-fun m!715731 () Bool)

(assert (=> b!770409 m!715731))

(assert (=> b!770407 m!715685))

(assert (=> b!770407 m!715685))

(declare-fun m!715733 () Bool)

(assert (=> b!770407 m!715733))

(check-sat (not b!770400) (not b!770397) (not b!770415) (not b!770401) (not b!770407) (not b!770413) (not start!66800) (not b!770412) (not b!770396) (not b!770403) (not b!770402) (not b!770404) (not b!770409) (not b!770398) (not b!770399) (not b!770410) (not b!770411))
(check-sat)
