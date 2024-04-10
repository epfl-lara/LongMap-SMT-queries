; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65218 () Bool)

(assert start!65218)

(declare-fun b!738628 () Bool)

(declare-fun e!413078 () Bool)

(declare-fun e!413073 () Bool)

(assert (=> b!738628 (= e!413078 e!413073)))

(declare-fun res!496581 () Bool)

(assert (=> b!738628 (=> res!496581 e!413073)))

(declare-datatypes ((array!41391 0))(
  ( (array!41392 (arr!19809 (Array (_ BitVec 32) (_ BitVec 64))) (size!20230 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41391)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!327878 () (_ BitVec 32))

(assert (=> b!738628 (= res!496581 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327878 #b00000000000000000000000000000000) (bvsge lt!327878 (size!20230 a!3186))))))

(declare-datatypes ((Unit!25232 0))(
  ( (Unit!25233) )
))
(declare-fun lt!327887 () Unit!25232)

(declare-fun e!413069 () Unit!25232)

(assert (=> b!738628 (= lt!327887 e!413069)))

(declare-fun c!81410 () Bool)

(declare-fun lt!327885 () Bool)

(assert (=> b!738628 (= c!81410 lt!327885)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738628 (= lt!327885 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738628 (= lt!327878 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!738629 () Bool)

(declare-fun res!496571 () Bool)

(assert (=> b!738629 (=> res!496571 e!413073)))

(declare-fun e!413071 () Bool)

(assert (=> b!738629 (= res!496571 e!413071)))

(declare-fun c!81411 () Bool)

(assert (=> b!738629 (= c!81411 lt!327885)))

(declare-fun b!738630 () Bool)

(declare-fun res!496577 () Bool)

(declare-fun e!413072 () Bool)

(assert (=> b!738630 (=> (not res!496577) (not e!413072))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738630 (= res!496577 (validKeyInArray!0 (select (arr!19809 a!3186) j!159)))))

(declare-fun b!738631 () Bool)

(declare-fun e!413070 () Bool)

(declare-fun e!413068 () Bool)

(assert (=> b!738631 (= e!413070 e!413068)))

(declare-fun res!496578 () Bool)

(assert (=> b!738631 (=> (not res!496578) (not e!413068))))

(declare-datatypes ((SeekEntryResult!7409 0))(
  ( (MissingZero!7409 (index!32004 (_ BitVec 32))) (Found!7409 (index!32005 (_ BitVec 32))) (Intermediate!7409 (undefined!8221 Bool) (index!32006 (_ BitVec 32)) (x!62999 (_ BitVec 32))) (Undefined!7409) (MissingVacant!7409 (index!32007 (_ BitVec 32))) )
))
(declare-fun lt!327882 () SeekEntryResult!7409)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41391 (_ BitVec 32)) SeekEntryResult!7409)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738631 (= res!496578 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19809 a!3186) j!159) mask!3328) (select (arr!19809 a!3186) j!159) a!3186 mask!3328) lt!327882))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!738631 (= lt!327882 (Intermediate!7409 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738632 () Bool)

(declare-fun Unit!25234 () Unit!25232)

(assert (=> b!738632 (= e!413069 Unit!25234)))

(assert (=> b!738632 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327878 (select (arr!19809 a!3186) j!159) a!3186 mask!3328) lt!327882)))

(declare-fun b!738633 () Bool)

(declare-fun lt!327874 () SeekEntryResult!7409)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41391 (_ BitVec 32)) SeekEntryResult!7409)

(assert (=> b!738633 (= e!413071 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327878 resIntermediateIndex!5 (select (arr!19809 a!3186) j!159) a!3186 mask!3328) lt!327874)))))

(declare-fun b!738634 () Bool)

(declare-fun res!496582 () Bool)

(assert (=> b!738634 (=> (not res!496582) (not e!413068))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!738634 (= res!496582 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19809 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!496580 () Bool)

(assert (=> start!65218 (=> (not res!496580) (not e!413072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65218 (= res!496580 (validMask!0 mask!3328))))

(assert (=> start!65218 e!413072))

(assert (=> start!65218 true))

(declare-fun array_inv!15605 (array!41391) Bool)

(assert (=> start!65218 (array_inv!15605 a!3186)))

(declare-fun b!738635 () Bool)

(declare-fun res!496575 () Bool)

(assert (=> b!738635 (=> (not res!496575) (not e!413070))))

(declare-datatypes ((List!13811 0))(
  ( (Nil!13808) (Cons!13807 (h!14879 (_ BitVec 64)) (t!20126 List!13811)) )
))
(declare-fun arrayNoDuplicates!0 (array!41391 (_ BitVec 32) List!13811) Bool)

(assert (=> b!738635 (= res!496575 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13808))))

(declare-fun b!738636 () Bool)

(declare-fun Unit!25235 () Unit!25232)

(assert (=> b!738636 (= e!413069 Unit!25235)))

(declare-fun lt!327881 () SeekEntryResult!7409)

(assert (=> b!738636 (= lt!327881 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19809 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!738636 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327878 resIntermediateIndex!5 (select (arr!19809 a!3186) j!159) a!3186 mask!3328) lt!327874)))

(declare-fun b!738637 () Bool)

(declare-fun e!413077 () Bool)

(assert (=> b!738637 (= e!413068 e!413077)))

(declare-fun res!496573 () Bool)

(assert (=> b!738637 (=> (not res!496573) (not e!413077))))

(declare-fun lt!327876 () SeekEntryResult!7409)

(declare-fun lt!327880 () SeekEntryResult!7409)

(assert (=> b!738637 (= res!496573 (= lt!327876 lt!327880))))

(declare-fun lt!327884 () array!41391)

(declare-fun lt!327877 () (_ BitVec 64))

(assert (=> b!738637 (= lt!327880 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327877 lt!327884 mask!3328))))

(assert (=> b!738637 (= lt!327876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327877 mask!3328) lt!327877 lt!327884 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!738637 (= lt!327877 (select (store (arr!19809 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!738637 (= lt!327884 (array!41392 (store (arr!19809 a!3186) i!1173 k!2102) (size!20230 a!3186)))))

(declare-fun b!738638 () Bool)

(declare-fun res!496586 () Bool)

(assert (=> b!738638 (=> (not res!496586) (not e!413072))))

(assert (=> b!738638 (= res!496586 (validKeyInArray!0 k!2102))))

(declare-fun b!738639 () Bool)

(declare-fun res!496574 () Bool)

(assert (=> b!738639 (=> (not res!496574) (not e!413072))))

(declare-fun arrayContainsKey!0 (array!41391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738639 (= res!496574 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun e!413076 () Bool)

(declare-fun b!738640 () Bool)

(assert (=> b!738640 (= e!413076 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19809 a!3186) j!159) a!3186 mask!3328) lt!327882))))

(declare-fun b!738641 () Bool)

(assert (=> b!738641 (= e!413071 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327878 (select (arr!19809 a!3186) j!159) a!3186 mask!3328) lt!327882)))))

(declare-fun b!738642 () Bool)

(assert (=> b!738642 (= e!413077 (not e!413078))))

(declare-fun res!496576 () Bool)

(assert (=> b!738642 (=> res!496576 e!413078)))

(assert (=> b!738642 (= res!496576 (or (not (is-Intermediate!7409 lt!327880)) (bvsge x!1131 (x!62999 lt!327880))))))

(assert (=> b!738642 (= lt!327874 (Found!7409 j!159))))

(declare-fun e!413075 () Bool)

(assert (=> b!738642 e!413075))

(declare-fun res!496585 () Bool)

(assert (=> b!738642 (=> (not res!496585) (not e!413075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41391 (_ BitVec 32)) Bool)

(assert (=> b!738642 (= res!496585 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327886 () Unit!25232)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41391 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25232)

(assert (=> b!738642 (= lt!327886 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738643 () Bool)

(assert (=> b!738643 (= e!413073 true)))

(declare-fun lt!327875 () SeekEntryResult!7409)

(assert (=> b!738643 (= lt!327875 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327878 lt!327877 lt!327884 mask!3328))))

(declare-fun b!738644 () Bool)

(declare-fun e!413074 () Bool)

(assert (=> b!738644 (= e!413075 e!413074)))

(declare-fun res!496572 () Bool)

(assert (=> b!738644 (=> (not res!496572) (not e!413074))))

(declare-fun lt!327883 () SeekEntryResult!7409)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41391 (_ BitVec 32)) SeekEntryResult!7409)

(assert (=> b!738644 (= res!496572 (= (seekEntryOrOpen!0 (select (arr!19809 a!3186) j!159) a!3186 mask!3328) lt!327883))))

(assert (=> b!738644 (= lt!327883 (Found!7409 j!159))))

(declare-fun b!738645 () Bool)

(declare-fun res!496583 () Bool)

(assert (=> b!738645 (=> (not res!496583) (not e!413068))))

(assert (=> b!738645 (= res!496583 e!413076)))

(declare-fun c!81412 () Bool)

(assert (=> b!738645 (= c!81412 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738646 () Bool)

(assert (=> b!738646 (= e!413074 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19809 a!3186) j!159) a!3186 mask!3328) lt!327883))))

(declare-fun b!738647 () Bool)

(assert (=> b!738647 (= e!413072 e!413070)))

(declare-fun res!496579 () Bool)

(assert (=> b!738647 (=> (not res!496579) (not e!413070))))

(declare-fun lt!327879 () SeekEntryResult!7409)

(assert (=> b!738647 (= res!496579 (or (= lt!327879 (MissingZero!7409 i!1173)) (= lt!327879 (MissingVacant!7409 i!1173))))))

(assert (=> b!738647 (= lt!327879 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!738648 () Bool)

(declare-fun res!496570 () Bool)

(assert (=> b!738648 (=> (not res!496570) (not e!413070))))

(assert (=> b!738648 (= res!496570 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20230 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20230 a!3186))))))

(declare-fun b!738649 () Bool)

(declare-fun res!496569 () Bool)

(assert (=> b!738649 (=> (not res!496569) (not e!413070))))

(assert (=> b!738649 (= res!496569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738650 () Bool)

(declare-fun res!496584 () Bool)

(assert (=> b!738650 (=> (not res!496584) (not e!413072))))

(assert (=> b!738650 (= res!496584 (and (= (size!20230 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20230 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20230 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738651 () Bool)

(assert (=> b!738651 (= e!413076 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19809 a!3186) j!159) a!3186 mask!3328) (Found!7409 j!159)))))

(assert (= (and start!65218 res!496580) b!738650))

(assert (= (and b!738650 res!496584) b!738630))

(assert (= (and b!738630 res!496577) b!738638))

(assert (= (and b!738638 res!496586) b!738639))

(assert (= (and b!738639 res!496574) b!738647))

(assert (= (and b!738647 res!496579) b!738649))

(assert (= (and b!738649 res!496569) b!738635))

(assert (= (and b!738635 res!496575) b!738648))

(assert (= (and b!738648 res!496570) b!738631))

(assert (= (and b!738631 res!496578) b!738634))

(assert (= (and b!738634 res!496582) b!738645))

(assert (= (and b!738645 c!81412) b!738640))

(assert (= (and b!738645 (not c!81412)) b!738651))

(assert (= (and b!738645 res!496583) b!738637))

(assert (= (and b!738637 res!496573) b!738642))

(assert (= (and b!738642 res!496585) b!738644))

(assert (= (and b!738644 res!496572) b!738646))

(assert (= (and b!738642 (not res!496576)) b!738628))

(assert (= (and b!738628 c!81410) b!738632))

(assert (= (and b!738628 (not c!81410)) b!738636))

(assert (= (and b!738628 (not res!496581)) b!738629))

(assert (= (and b!738629 c!81411) b!738641))

(assert (= (and b!738629 (not c!81411)) b!738633))

(assert (= (and b!738629 (not res!496571)) b!738643))

(declare-fun m!690211 () Bool)

(assert (=> b!738630 m!690211))

(assert (=> b!738630 m!690211))

(declare-fun m!690213 () Bool)

(assert (=> b!738630 m!690213))

(declare-fun m!690215 () Bool)

(assert (=> b!738643 m!690215))

(declare-fun m!690217 () Bool)

(assert (=> b!738647 m!690217))

(assert (=> b!738632 m!690211))

(assert (=> b!738632 m!690211))

(declare-fun m!690219 () Bool)

(assert (=> b!738632 m!690219))

(declare-fun m!690221 () Bool)

(assert (=> b!738628 m!690221))

(declare-fun m!690223 () Bool)

(assert (=> b!738639 m!690223))

(assert (=> b!738646 m!690211))

(assert (=> b!738646 m!690211))

(declare-fun m!690225 () Bool)

(assert (=> b!738646 m!690225))

(assert (=> b!738651 m!690211))

(assert (=> b!738651 m!690211))

(declare-fun m!690227 () Bool)

(assert (=> b!738651 m!690227))

(declare-fun m!690229 () Bool)

(assert (=> b!738638 m!690229))

(declare-fun m!690231 () Bool)

(assert (=> b!738634 m!690231))

(assert (=> b!738644 m!690211))

(assert (=> b!738644 m!690211))

(declare-fun m!690233 () Bool)

(assert (=> b!738644 m!690233))

(assert (=> b!738633 m!690211))

(assert (=> b!738633 m!690211))

(declare-fun m!690235 () Bool)

(assert (=> b!738633 m!690235))

(assert (=> b!738640 m!690211))

(assert (=> b!738640 m!690211))

(declare-fun m!690237 () Bool)

(assert (=> b!738640 m!690237))

(declare-fun m!690239 () Bool)

(assert (=> b!738637 m!690239))

(declare-fun m!690241 () Bool)

(assert (=> b!738637 m!690241))

(assert (=> b!738637 m!690239))

(declare-fun m!690243 () Bool)

(assert (=> b!738637 m!690243))

(declare-fun m!690245 () Bool)

(assert (=> b!738637 m!690245))

(declare-fun m!690247 () Bool)

(assert (=> b!738637 m!690247))

(assert (=> b!738641 m!690211))

(assert (=> b!738641 m!690211))

(assert (=> b!738641 m!690219))

(declare-fun m!690249 () Bool)

(assert (=> b!738642 m!690249))

(declare-fun m!690251 () Bool)

(assert (=> b!738642 m!690251))

(declare-fun m!690253 () Bool)

(assert (=> start!65218 m!690253))

(declare-fun m!690255 () Bool)

(assert (=> start!65218 m!690255))

(declare-fun m!690257 () Bool)

(assert (=> b!738635 m!690257))

(assert (=> b!738636 m!690211))

(assert (=> b!738636 m!690211))

(assert (=> b!738636 m!690227))

(assert (=> b!738636 m!690211))

(assert (=> b!738636 m!690235))

(assert (=> b!738631 m!690211))

(assert (=> b!738631 m!690211))

(declare-fun m!690259 () Bool)

(assert (=> b!738631 m!690259))

(assert (=> b!738631 m!690259))

(assert (=> b!738631 m!690211))

(declare-fun m!690261 () Bool)

(assert (=> b!738631 m!690261))

(declare-fun m!690263 () Bool)

(assert (=> b!738649 m!690263))

(push 1)

