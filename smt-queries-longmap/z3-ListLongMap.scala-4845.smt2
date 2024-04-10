; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66770 () Bool)

(assert start!66770)

(declare-fun b!769496 () Bool)

(declare-fun res!520406 () Bool)

(declare-fun e!428483 () Bool)

(assert (=> b!769496 (=> (not res!520406) (not e!428483))))

(declare-datatypes ((array!42332 0))(
  ( (array!42333 (arr!20266 (Array (_ BitVec 32) (_ BitVec 64))) (size!20687 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42332)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769496 (= res!520406 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769497 () Bool)

(declare-fun res!520412 () Bool)

(declare-fun e!428485 () Bool)

(assert (=> b!769497 (=> (not res!520412) (not e!428485))))

(declare-fun e!428481 () Bool)

(assert (=> b!769497 (= res!520412 e!428481)))

(declare-fun c!84946 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769497 (= c!84946 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769498 () Bool)

(declare-fun e!428480 () Bool)

(declare-fun e!428482 () Bool)

(assert (=> b!769498 (= e!428480 (not e!428482))))

(declare-fun res!520410 () Bool)

(assert (=> b!769498 (=> res!520410 e!428482)))

(declare-datatypes ((SeekEntryResult!7866 0))(
  ( (MissingZero!7866 (index!33832 (_ BitVec 32))) (Found!7866 (index!33833 (_ BitVec 32))) (Intermediate!7866 (undefined!8678 Bool) (index!33834 (_ BitVec 32)) (x!64765 (_ BitVec 32))) (Undefined!7866) (MissingVacant!7866 (index!33835 (_ BitVec 32))) )
))
(declare-fun lt!342376 () SeekEntryResult!7866)

(get-info :version)

(assert (=> b!769498 (= res!520410 (or (not ((_ is Intermediate!7866) lt!342376)) (bvsge x!1131 (x!64765 lt!342376))))))

(declare-fun e!428486 () Bool)

(assert (=> b!769498 e!428486))

(declare-fun res!520397 () Bool)

(assert (=> b!769498 (=> (not res!520397) (not e!428486))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42332 (_ BitVec 32)) Bool)

(assert (=> b!769498 (= res!520397 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26478 0))(
  ( (Unit!26479) )
))
(declare-fun lt!342386 () Unit!26478)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26478)

(assert (=> b!769498 (= lt!342386 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769499 () Bool)

(assert (=> b!769499 (= e!428485 e!428480)))

(declare-fun res!520399 () Bool)

(assert (=> b!769499 (=> (not res!520399) (not e!428480))))

(declare-fun lt!342377 () SeekEntryResult!7866)

(assert (=> b!769499 (= res!520399 (= lt!342377 lt!342376))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!342384 () array!42332)

(declare-fun lt!342383 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42332 (_ BitVec 32)) SeekEntryResult!7866)

(assert (=> b!769499 (= lt!342376 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342383 lt!342384 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769499 (= lt!342377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342383 mask!3328) lt!342383 lt!342384 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769499 (= lt!342383 (select (store (arr!20266 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!769499 (= lt!342384 (array!42333 (store (arr!20266 a!3186) i!1173 k0!2102) (size!20687 a!3186)))))

(declare-fun b!769500 () Bool)

(declare-fun res!520405 () Bool)

(assert (=> b!769500 (=> (not res!520405) (not e!428485))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!769500 (= res!520405 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20266 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769501 () Bool)

(declare-fun res!520411 () Bool)

(declare-fun e!428489 () Bool)

(assert (=> b!769501 (=> (not res!520411) (not e!428489))))

(assert (=> b!769501 (= res!520411 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20687 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20687 a!3186))))))

(declare-fun b!769502 () Bool)

(declare-fun res!520408 () Bool)

(assert (=> b!769502 (=> (not res!520408) (not e!428489))))

(declare-datatypes ((List!14268 0))(
  ( (Nil!14265) (Cons!14264 (h!15363 (_ BitVec 64)) (t!20583 List!14268)) )
))
(declare-fun arrayNoDuplicates!0 (array!42332 (_ BitVec 32) List!14268) Bool)

(assert (=> b!769502 (= res!520408 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14265))))

(declare-fun b!769503 () Bool)

(declare-fun e!428484 () Unit!26478)

(declare-fun Unit!26480 () Unit!26478)

(assert (=> b!769503 (= e!428484 Unit!26480)))

(declare-fun lt!342381 () (_ BitVec 32))

(declare-fun lt!342380 () SeekEntryResult!7866)

(assert (=> b!769503 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342381 (select (arr!20266 a!3186) j!159) a!3186 mask!3328) lt!342380)))

(declare-fun b!769504 () Bool)

(assert (=> b!769504 (= e!428489 e!428485)))

(declare-fun res!520409 () Bool)

(assert (=> b!769504 (=> (not res!520409) (not e!428485))))

(assert (=> b!769504 (= res!520409 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20266 a!3186) j!159) mask!3328) (select (arr!20266 a!3186) j!159) a!3186 mask!3328) lt!342380))))

(assert (=> b!769504 (= lt!342380 (Intermediate!7866 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!520407 () Bool)

(assert (=> start!66770 (=> (not res!520407) (not e!428483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66770 (= res!520407 (validMask!0 mask!3328))))

(assert (=> start!66770 e!428483))

(assert (=> start!66770 true))

(declare-fun array_inv!16062 (array!42332) Bool)

(assert (=> start!66770 (array_inv!16062 a!3186)))

(declare-fun b!769505 () Bool)

(declare-fun res!520401 () Bool)

(assert (=> b!769505 (=> (not res!520401) (not e!428489))))

(assert (=> b!769505 (= res!520401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769506 () Bool)

(assert (=> b!769506 (= e!428483 e!428489)))

(declare-fun res!520404 () Bool)

(assert (=> b!769506 (=> (not res!520404) (not e!428489))))

(declare-fun lt!342379 () SeekEntryResult!7866)

(assert (=> b!769506 (= res!520404 (or (= lt!342379 (MissingZero!7866 i!1173)) (= lt!342379 (MissingVacant!7866 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42332 (_ BitVec 32)) SeekEntryResult!7866)

(assert (=> b!769506 (= lt!342379 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!769507 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42332 (_ BitVec 32)) SeekEntryResult!7866)

(assert (=> b!769507 (= e!428481 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20266 a!3186) j!159) a!3186 mask!3328) (Found!7866 j!159)))))

(declare-fun b!769508 () Bool)

(assert (=> b!769508 (= e!428482 true)))

(declare-fun lt!342378 () Unit!26478)

(assert (=> b!769508 (= lt!342378 e!428484)))

(declare-fun c!84945 () Bool)

(assert (=> b!769508 (= c!84945 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769508 (= lt!342381 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769509 () Bool)

(declare-fun e!428488 () Bool)

(declare-fun lt!342385 () SeekEntryResult!7866)

(assert (=> b!769509 (= e!428488 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20266 a!3186) j!159) a!3186 mask!3328) lt!342385))))

(declare-fun b!769510 () Bool)

(declare-fun res!520403 () Bool)

(assert (=> b!769510 (=> (not res!520403) (not e!428483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769510 (= res!520403 (validKeyInArray!0 (select (arr!20266 a!3186) j!159)))))

(declare-fun b!769511 () Bool)

(assert (=> b!769511 (= e!428481 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20266 a!3186) j!159) a!3186 mask!3328) lt!342380))))

(declare-fun b!769512 () Bool)

(assert (=> b!769512 (= e!428486 e!428488)))

(declare-fun res!520398 () Bool)

(assert (=> b!769512 (=> (not res!520398) (not e!428488))))

(assert (=> b!769512 (= res!520398 (= (seekEntryOrOpen!0 (select (arr!20266 a!3186) j!159) a!3186 mask!3328) lt!342385))))

(assert (=> b!769512 (= lt!342385 (Found!7866 j!159))))

(declare-fun b!769513 () Bool)

(declare-fun res!520402 () Bool)

(assert (=> b!769513 (=> (not res!520402) (not e!428483))))

(assert (=> b!769513 (= res!520402 (validKeyInArray!0 k0!2102))))

(declare-fun b!769514 () Bool)

(declare-fun Unit!26481 () Unit!26478)

(assert (=> b!769514 (= e!428484 Unit!26481)))

(declare-fun lt!342382 () SeekEntryResult!7866)

(assert (=> b!769514 (= lt!342382 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20266 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769514 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342381 resIntermediateIndex!5 (select (arr!20266 a!3186) j!159) a!3186 mask!3328) (Found!7866 j!159))))

(declare-fun b!769515 () Bool)

(declare-fun res!520400 () Bool)

(assert (=> b!769515 (=> (not res!520400) (not e!428483))))

(assert (=> b!769515 (= res!520400 (and (= (size!20687 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20687 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20687 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!66770 res!520407) b!769515))

(assert (= (and b!769515 res!520400) b!769510))

(assert (= (and b!769510 res!520403) b!769513))

(assert (= (and b!769513 res!520402) b!769496))

(assert (= (and b!769496 res!520406) b!769506))

(assert (= (and b!769506 res!520404) b!769505))

(assert (= (and b!769505 res!520401) b!769502))

(assert (= (and b!769502 res!520408) b!769501))

(assert (= (and b!769501 res!520411) b!769504))

(assert (= (and b!769504 res!520409) b!769500))

(assert (= (and b!769500 res!520405) b!769497))

(assert (= (and b!769497 c!84946) b!769511))

(assert (= (and b!769497 (not c!84946)) b!769507))

(assert (= (and b!769497 res!520412) b!769499))

(assert (= (and b!769499 res!520399) b!769498))

(assert (= (and b!769498 res!520397) b!769512))

(assert (= (and b!769512 res!520398) b!769509))

(assert (= (and b!769498 (not res!520410)) b!769508))

(assert (= (and b!769508 c!84945) b!769503))

(assert (= (and b!769508 (not c!84945)) b!769514))

(declare-fun m!714903 () Bool)

(assert (=> b!769511 m!714903))

(assert (=> b!769511 m!714903))

(declare-fun m!714905 () Bool)

(assert (=> b!769511 m!714905))

(declare-fun m!714907 () Bool)

(assert (=> start!66770 m!714907))

(declare-fun m!714909 () Bool)

(assert (=> start!66770 m!714909))

(assert (=> b!769507 m!714903))

(assert (=> b!769507 m!714903))

(declare-fun m!714911 () Bool)

(assert (=> b!769507 m!714911))

(declare-fun m!714913 () Bool)

(assert (=> b!769500 m!714913))

(declare-fun m!714915 () Bool)

(assert (=> b!769513 m!714915))

(declare-fun m!714917 () Bool)

(assert (=> b!769496 m!714917))

(assert (=> b!769503 m!714903))

(assert (=> b!769503 m!714903))

(declare-fun m!714919 () Bool)

(assert (=> b!769503 m!714919))

(declare-fun m!714921 () Bool)

(assert (=> b!769498 m!714921))

(declare-fun m!714923 () Bool)

(assert (=> b!769498 m!714923))

(declare-fun m!714925 () Bool)

(assert (=> b!769506 m!714925))

(assert (=> b!769512 m!714903))

(assert (=> b!769512 m!714903))

(declare-fun m!714927 () Bool)

(assert (=> b!769512 m!714927))

(declare-fun m!714929 () Bool)

(assert (=> b!769505 m!714929))

(assert (=> b!769510 m!714903))

(assert (=> b!769510 m!714903))

(declare-fun m!714931 () Bool)

(assert (=> b!769510 m!714931))

(declare-fun m!714933 () Bool)

(assert (=> b!769508 m!714933))

(declare-fun m!714935 () Bool)

(assert (=> b!769499 m!714935))

(declare-fun m!714937 () Bool)

(assert (=> b!769499 m!714937))

(declare-fun m!714939 () Bool)

(assert (=> b!769499 m!714939))

(assert (=> b!769499 m!714935))

(declare-fun m!714941 () Bool)

(assert (=> b!769499 m!714941))

(declare-fun m!714943 () Bool)

(assert (=> b!769499 m!714943))

(declare-fun m!714945 () Bool)

(assert (=> b!769502 m!714945))

(assert (=> b!769509 m!714903))

(assert (=> b!769509 m!714903))

(declare-fun m!714947 () Bool)

(assert (=> b!769509 m!714947))

(assert (=> b!769504 m!714903))

(assert (=> b!769504 m!714903))

(declare-fun m!714949 () Bool)

(assert (=> b!769504 m!714949))

(assert (=> b!769504 m!714949))

(assert (=> b!769504 m!714903))

(declare-fun m!714951 () Bool)

(assert (=> b!769504 m!714951))

(assert (=> b!769514 m!714903))

(assert (=> b!769514 m!714903))

(assert (=> b!769514 m!714911))

(assert (=> b!769514 m!714903))

(declare-fun m!714953 () Bool)

(assert (=> b!769514 m!714953))

(check-sat (not b!769496) (not b!769514) (not b!769503) (not start!66770) (not b!769509) (not b!769507) (not b!769513) (not b!769508) (not b!769511) (not b!769498) (not b!769502) (not b!769504) (not b!769499) (not b!769510) (not b!769512) (not b!769505) (not b!769506))
(check-sat)
