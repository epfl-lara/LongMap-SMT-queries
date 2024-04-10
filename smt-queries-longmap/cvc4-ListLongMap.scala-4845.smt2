; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66772 () Bool)

(assert start!66772)

(declare-fun b!769556 () Bool)

(declare-fun res!520449 () Bool)

(declare-fun e!428517 () Bool)

(assert (=> b!769556 (=> (not res!520449) (not e!428517))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42334 0))(
  ( (array!42335 (arr!20267 (Array (_ BitVec 32) (_ BitVec 64))) (size!20688 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42334)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769556 (= res!520449 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20688 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20688 a!3186))))))

(declare-fun b!769557 () Bool)

(declare-datatypes ((Unit!26482 0))(
  ( (Unit!26483) )
))
(declare-fun e!428511 () Unit!26482)

(declare-fun Unit!26484 () Unit!26482)

(assert (=> b!769557 (= e!428511 Unit!26484)))

(declare-datatypes ((SeekEntryResult!7867 0))(
  ( (MissingZero!7867 (index!33836 (_ BitVec 32))) (Found!7867 (index!33837 (_ BitVec 32))) (Intermediate!7867 (undefined!8679 Bool) (index!33838 (_ BitVec 32)) (x!64766 (_ BitVec 32))) (Undefined!7867) (MissingVacant!7867 (index!33839 (_ BitVec 32))) )
))
(declare-fun lt!342412 () SeekEntryResult!7867)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42334 (_ BitVec 32)) SeekEntryResult!7867)

(assert (=> b!769557 (= lt!342412 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20267 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!342418 () (_ BitVec 32))

(assert (=> b!769557 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342418 resIntermediateIndex!5 (select (arr!20267 a!3186) j!159) a!3186 mask!3328) (Found!7867 j!159))))

(declare-fun b!769558 () Bool)

(declare-fun e!428515 () Bool)

(declare-fun e!428519 () Bool)

(assert (=> b!769558 (= e!428515 (not e!428519))))

(declare-fun res!520452 () Bool)

(assert (=> b!769558 (=> res!520452 e!428519)))

(declare-fun lt!342416 () SeekEntryResult!7867)

(assert (=> b!769558 (= res!520452 (or (not (is-Intermediate!7867 lt!342416)) (bvsge x!1131 (x!64766 lt!342416))))))

(declare-fun e!428512 () Bool)

(assert (=> b!769558 e!428512))

(declare-fun res!520447 () Bool)

(assert (=> b!769558 (=> (not res!520447) (not e!428512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42334 (_ BitVec 32)) Bool)

(assert (=> b!769558 (= res!520447 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342415 () Unit!26482)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26482)

(assert (=> b!769558 (= lt!342415 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769559 () Bool)

(declare-fun Unit!26485 () Unit!26482)

(assert (=> b!769559 (= e!428511 Unit!26485)))

(declare-fun lt!342409 () SeekEntryResult!7867)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42334 (_ BitVec 32)) SeekEntryResult!7867)

(assert (=> b!769559 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342418 (select (arr!20267 a!3186) j!159) a!3186 mask!3328) lt!342409)))

(declare-fun b!769560 () Bool)

(declare-fun res!520458 () Bool)

(declare-fun e!428510 () Bool)

(assert (=> b!769560 (=> (not res!520458) (not e!428510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769560 (= res!520458 (validKeyInArray!0 (select (arr!20267 a!3186) j!159)))))

(declare-fun b!769561 () Bool)

(declare-fun res!520456 () Bool)

(assert (=> b!769561 (=> (not res!520456) (not e!428510))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!769561 (= res!520456 (validKeyInArray!0 k!2102))))

(declare-fun e!428518 () Bool)

(declare-fun b!769562 () Bool)

(assert (=> b!769562 (= e!428518 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20267 a!3186) j!159) a!3186 mask!3328) (Found!7867 j!159)))))

(declare-fun b!769563 () Bool)

(declare-fun e!428513 () Bool)

(assert (=> b!769563 (= e!428512 e!428513)))

(declare-fun res!520459 () Bool)

(assert (=> b!769563 (=> (not res!520459) (not e!428513))))

(declare-fun lt!342419 () SeekEntryResult!7867)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42334 (_ BitVec 32)) SeekEntryResult!7867)

(assert (=> b!769563 (= res!520459 (= (seekEntryOrOpen!0 (select (arr!20267 a!3186) j!159) a!3186 mask!3328) lt!342419))))

(assert (=> b!769563 (= lt!342419 (Found!7867 j!159))))

(declare-fun b!769564 () Bool)

(declare-fun e!428516 () Bool)

(assert (=> b!769564 (= e!428516 e!428515)))

(declare-fun res!520457 () Bool)

(assert (=> b!769564 (=> (not res!520457) (not e!428515))))

(declare-fun lt!342411 () SeekEntryResult!7867)

(assert (=> b!769564 (= res!520457 (= lt!342411 lt!342416))))

(declare-fun lt!342410 () (_ BitVec 64))

(declare-fun lt!342413 () array!42334)

(assert (=> b!769564 (= lt!342416 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342410 lt!342413 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769564 (= lt!342411 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342410 mask!3328) lt!342410 lt!342413 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769564 (= lt!342410 (select (store (arr!20267 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!769564 (= lt!342413 (array!42335 (store (arr!20267 a!3186) i!1173 k!2102) (size!20688 a!3186)))))

(declare-fun b!769565 () Bool)

(declare-fun res!520448 () Bool)

(assert (=> b!769565 (=> (not res!520448) (not e!428517))))

(assert (=> b!769565 (= res!520448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769566 () Bool)

(assert (=> b!769566 (= e!428513 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20267 a!3186) j!159) a!3186 mask!3328) lt!342419))))

(declare-fun b!769567 () Bool)

(assert (=> b!769567 (= e!428510 e!428517)))

(declare-fun res!520445 () Bool)

(assert (=> b!769567 (=> (not res!520445) (not e!428517))))

(declare-fun lt!342417 () SeekEntryResult!7867)

(assert (=> b!769567 (= res!520445 (or (= lt!342417 (MissingZero!7867 i!1173)) (= lt!342417 (MissingVacant!7867 i!1173))))))

(assert (=> b!769567 (= lt!342417 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!769568 () Bool)

(assert (=> b!769568 (= e!428519 true)))

(declare-fun lt!342414 () Unit!26482)

(assert (=> b!769568 (= lt!342414 e!428511)))

(declare-fun c!84952 () Bool)

(assert (=> b!769568 (= c!84952 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769568 (= lt!342418 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769569 () Bool)

(assert (=> b!769569 (= e!428517 e!428516)))

(declare-fun res!520451 () Bool)

(assert (=> b!769569 (=> (not res!520451) (not e!428516))))

(assert (=> b!769569 (= res!520451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20267 a!3186) j!159) mask!3328) (select (arr!20267 a!3186) j!159) a!3186 mask!3328) lt!342409))))

(assert (=> b!769569 (= lt!342409 (Intermediate!7867 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769570 () Bool)

(declare-fun res!520460 () Bool)

(assert (=> b!769570 (=> (not res!520460) (not e!428517))))

(declare-datatypes ((List!14269 0))(
  ( (Nil!14266) (Cons!14265 (h!15364 (_ BitVec 64)) (t!20584 List!14269)) )
))
(declare-fun arrayNoDuplicates!0 (array!42334 (_ BitVec 32) List!14269) Bool)

(assert (=> b!769570 (= res!520460 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14266))))

(declare-fun b!769571 () Bool)

(assert (=> b!769571 (= e!428518 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20267 a!3186) j!159) a!3186 mask!3328) lt!342409))))

(declare-fun b!769572 () Bool)

(declare-fun res!520450 () Bool)

(assert (=> b!769572 (=> (not res!520450) (not e!428516))))

(assert (=> b!769572 (= res!520450 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20267 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769573 () Bool)

(declare-fun res!520455 () Bool)

(assert (=> b!769573 (=> (not res!520455) (not e!428516))))

(assert (=> b!769573 (= res!520455 e!428518)))

(declare-fun c!84951 () Bool)

(assert (=> b!769573 (= c!84951 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769575 () Bool)

(declare-fun res!520446 () Bool)

(assert (=> b!769575 (=> (not res!520446) (not e!428510))))

(declare-fun arrayContainsKey!0 (array!42334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769575 (= res!520446 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769574 () Bool)

(declare-fun res!520454 () Bool)

(assert (=> b!769574 (=> (not res!520454) (not e!428510))))

(assert (=> b!769574 (= res!520454 (and (= (size!20688 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20688 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20688 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!520453 () Bool)

(assert (=> start!66772 (=> (not res!520453) (not e!428510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66772 (= res!520453 (validMask!0 mask!3328))))

(assert (=> start!66772 e!428510))

(assert (=> start!66772 true))

(declare-fun array_inv!16063 (array!42334) Bool)

(assert (=> start!66772 (array_inv!16063 a!3186)))

(assert (= (and start!66772 res!520453) b!769574))

(assert (= (and b!769574 res!520454) b!769560))

(assert (= (and b!769560 res!520458) b!769561))

(assert (= (and b!769561 res!520456) b!769575))

(assert (= (and b!769575 res!520446) b!769567))

(assert (= (and b!769567 res!520445) b!769565))

(assert (= (and b!769565 res!520448) b!769570))

(assert (= (and b!769570 res!520460) b!769556))

(assert (= (and b!769556 res!520449) b!769569))

(assert (= (and b!769569 res!520451) b!769572))

(assert (= (and b!769572 res!520450) b!769573))

(assert (= (and b!769573 c!84951) b!769571))

(assert (= (and b!769573 (not c!84951)) b!769562))

(assert (= (and b!769573 res!520455) b!769564))

(assert (= (and b!769564 res!520457) b!769558))

(assert (= (and b!769558 res!520447) b!769563))

(assert (= (and b!769563 res!520459) b!769566))

(assert (= (and b!769558 (not res!520452)) b!769568))

(assert (= (and b!769568 c!84952) b!769559))

(assert (= (and b!769568 (not c!84952)) b!769557))

(declare-fun m!714955 () Bool)

(assert (=> b!769575 m!714955))

(declare-fun m!714957 () Bool)

(assert (=> b!769571 m!714957))

(assert (=> b!769571 m!714957))

(declare-fun m!714959 () Bool)

(assert (=> b!769571 m!714959))

(assert (=> b!769559 m!714957))

(assert (=> b!769559 m!714957))

(declare-fun m!714961 () Bool)

(assert (=> b!769559 m!714961))

(declare-fun m!714963 () Bool)

(assert (=> b!769567 m!714963))

(assert (=> b!769563 m!714957))

(assert (=> b!769563 m!714957))

(declare-fun m!714965 () Bool)

(assert (=> b!769563 m!714965))

(declare-fun m!714967 () Bool)

(assert (=> b!769568 m!714967))

(declare-fun m!714969 () Bool)

(assert (=> b!769572 m!714969))

(declare-fun m!714971 () Bool)

(assert (=> b!769565 m!714971))

(declare-fun m!714973 () Bool)

(assert (=> b!769561 m!714973))

(assert (=> b!769562 m!714957))

(assert (=> b!769562 m!714957))

(declare-fun m!714975 () Bool)

(assert (=> b!769562 m!714975))

(assert (=> b!769560 m!714957))

(assert (=> b!769560 m!714957))

(declare-fun m!714977 () Bool)

(assert (=> b!769560 m!714977))

(assert (=> b!769569 m!714957))

(assert (=> b!769569 m!714957))

(declare-fun m!714979 () Bool)

(assert (=> b!769569 m!714979))

(assert (=> b!769569 m!714979))

(assert (=> b!769569 m!714957))

(declare-fun m!714981 () Bool)

(assert (=> b!769569 m!714981))

(declare-fun m!714983 () Bool)

(assert (=> start!66772 m!714983))

(declare-fun m!714985 () Bool)

(assert (=> start!66772 m!714985))

(assert (=> b!769566 m!714957))

(assert (=> b!769566 m!714957))

(declare-fun m!714987 () Bool)

(assert (=> b!769566 m!714987))

(declare-fun m!714989 () Bool)

(assert (=> b!769570 m!714989))

(declare-fun m!714991 () Bool)

(assert (=> b!769564 m!714991))

(declare-fun m!714993 () Bool)

(assert (=> b!769564 m!714993))

(declare-fun m!714995 () Bool)

(assert (=> b!769564 m!714995))

(declare-fun m!714997 () Bool)

(assert (=> b!769564 m!714997))

(declare-fun m!714999 () Bool)

(assert (=> b!769564 m!714999))

(assert (=> b!769564 m!714991))

(declare-fun m!715001 () Bool)

(assert (=> b!769558 m!715001))

(declare-fun m!715003 () Bool)

(assert (=> b!769558 m!715003))

(assert (=> b!769557 m!714957))

(assert (=> b!769557 m!714957))

(assert (=> b!769557 m!714975))

(assert (=> b!769557 m!714957))

(declare-fun m!715005 () Bool)

(assert (=> b!769557 m!715005))

(push 1)

