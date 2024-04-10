; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64528 () Bool)

(assert start!64528)

(declare-datatypes ((SeekEntryResult!7244 0))(
  ( (MissingZero!7244 (index!31344 (_ BitVec 32))) (Found!7244 (index!31345 (_ BitVec 32))) (Intermediate!7244 (undefined!8056 Bool) (index!31346 (_ BitVec 32)) (x!62334 (_ BitVec 32))) (Undefined!7244) (MissingVacant!7244 (index!31347 (_ BitVec 32))) )
))
(declare-fun lt!321769 () SeekEntryResult!7244)

(declare-datatypes ((array!41046 0))(
  ( (array!41047 (arr!19644 (Array (_ BitVec 32) (_ BitVec 64))) (size!20065 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41046)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!726548 () Bool)

(declare-fun e!406782 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41046 (_ BitVec 32)) SeekEntryResult!7244)

(assert (=> b!726548 (= e!406782 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19644 a!3186) j!159) a!3186 mask!3328) lt!321769))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!726549 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41046 (_ BitVec 32)) SeekEntryResult!7244)

(assert (=> b!726549 (= e!406782 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19644 a!3186) j!159) a!3186 mask!3328) (Found!7244 j!159)))))

(declare-fun b!726550 () Bool)

(declare-fun res!487519 () Bool)

(declare-fun e!406784 () Bool)

(assert (=> b!726550 (=> (not res!487519) (not e!406784))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!726550 (= res!487519 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19644 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726551 () Bool)

(declare-fun e!406779 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!321773 () SeekEntryResult!7244)

(assert (=> b!726551 (= e!406779 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19644 a!3186) j!159) a!3186 mask!3328) lt!321773))))

(declare-fun b!726552 () Bool)

(declare-fun e!406780 () Bool)

(assert (=> b!726552 (= e!406780 (not true))))

(declare-fun e!406783 () Bool)

(assert (=> b!726552 e!406783))

(declare-fun res!487524 () Bool)

(assert (=> b!726552 (=> (not res!487524) (not e!406783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41046 (_ BitVec 32)) Bool)

(assert (=> b!726552 (= res!487524 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24806 0))(
  ( (Unit!24807) )
))
(declare-fun lt!321771 () Unit!24806)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41046 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24806)

(assert (=> b!726552 (= lt!321771 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726553 () Bool)

(assert (=> b!726553 (= e!406784 e!406780)))

(declare-fun res!487526 () Bool)

(assert (=> b!726553 (=> (not res!487526) (not e!406780))))

(declare-fun lt!321772 () array!41046)

(declare-fun lt!321768 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726553 (= res!487526 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321768 mask!3328) lt!321768 lt!321772 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321768 lt!321772 mask!3328)))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!726553 (= lt!321768 (select (store (arr!19644 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!726553 (= lt!321772 (array!41047 (store (arr!19644 a!3186) i!1173 k!2102) (size!20065 a!3186)))))

(declare-fun b!726554 () Bool)

(declare-fun res!487520 () Bool)

(declare-fun e!406778 () Bool)

(assert (=> b!726554 (=> (not res!487520) (not e!406778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726554 (= res!487520 (validKeyInArray!0 k!2102))))

(declare-fun b!726555 () Bool)

(assert (=> b!726555 (= e!406783 e!406779)))

(declare-fun res!487518 () Bool)

(assert (=> b!726555 (=> (not res!487518) (not e!406779))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41046 (_ BitVec 32)) SeekEntryResult!7244)

(assert (=> b!726555 (= res!487518 (= (seekEntryOrOpen!0 (select (arr!19644 a!3186) j!159) a!3186 mask!3328) lt!321773))))

(assert (=> b!726555 (= lt!321773 (Found!7244 j!159))))

(declare-fun b!726556 () Bool)

(declare-fun res!487527 () Bool)

(assert (=> b!726556 (=> (not res!487527) (not e!406778))))

(assert (=> b!726556 (= res!487527 (and (= (size!20065 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20065 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20065 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!487525 () Bool)

(assert (=> start!64528 (=> (not res!487525) (not e!406778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64528 (= res!487525 (validMask!0 mask!3328))))

(assert (=> start!64528 e!406778))

(assert (=> start!64528 true))

(declare-fun array_inv!15440 (array!41046) Bool)

(assert (=> start!64528 (array_inv!15440 a!3186)))

(declare-fun b!726557 () Bool)

(declare-fun e!406777 () Bool)

(assert (=> b!726557 (= e!406777 e!406784)))

(declare-fun res!487531 () Bool)

(assert (=> b!726557 (=> (not res!487531) (not e!406784))))

(assert (=> b!726557 (= res!487531 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19644 a!3186) j!159) mask!3328) (select (arr!19644 a!3186) j!159) a!3186 mask!3328) lt!321769))))

(assert (=> b!726557 (= lt!321769 (Intermediate!7244 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726558 () Bool)

(declare-fun res!487528 () Bool)

(assert (=> b!726558 (=> (not res!487528) (not e!406777))))

(declare-datatypes ((List!13646 0))(
  ( (Nil!13643) (Cons!13642 (h!14699 (_ BitVec 64)) (t!19961 List!13646)) )
))
(declare-fun arrayNoDuplicates!0 (array!41046 (_ BitVec 32) List!13646) Bool)

(assert (=> b!726558 (= res!487528 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13643))))

(declare-fun b!726559 () Bool)

(assert (=> b!726559 (= e!406778 e!406777)))

(declare-fun res!487523 () Bool)

(assert (=> b!726559 (=> (not res!487523) (not e!406777))))

(declare-fun lt!321770 () SeekEntryResult!7244)

(assert (=> b!726559 (= res!487523 (or (= lt!321770 (MissingZero!7244 i!1173)) (= lt!321770 (MissingVacant!7244 i!1173))))))

(assert (=> b!726559 (= lt!321770 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!726560 () Bool)

(declare-fun res!487530 () Bool)

(assert (=> b!726560 (=> (not res!487530) (not e!406777))))

(assert (=> b!726560 (= res!487530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726561 () Bool)

(declare-fun res!487521 () Bool)

(assert (=> b!726561 (=> (not res!487521) (not e!406784))))

(assert (=> b!726561 (= res!487521 e!406782)))

(declare-fun c!79888 () Bool)

(assert (=> b!726561 (= c!79888 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726562 () Bool)

(declare-fun res!487529 () Bool)

(assert (=> b!726562 (=> (not res!487529) (not e!406777))))

(assert (=> b!726562 (= res!487529 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20065 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20065 a!3186))))))

(declare-fun b!726563 () Bool)

(declare-fun res!487522 () Bool)

(assert (=> b!726563 (=> (not res!487522) (not e!406778))))

(declare-fun arrayContainsKey!0 (array!41046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726563 (= res!487522 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726564 () Bool)

(declare-fun res!487532 () Bool)

(assert (=> b!726564 (=> (not res!487532) (not e!406778))))

(assert (=> b!726564 (= res!487532 (validKeyInArray!0 (select (arr!19644 a!3186) j!159)))))

(assert (= (and start!64528 res!487525) b!726556))

(assert (= (and b!726556 res!487527) b!726564))

(assert (= (and b!726564 res!487532) b!726554))

(assert (= (and b!726554 res!487520) b!726563))

(assert (= (and b!726563 res!487522) b!726559))

(assert (= (and b!726559 res!487523) b!726560))

(assert (= (and b!726560 res!487530) b!726558))

(assert (= (and b!726558 res!487528) b!726562))

(assert (= (and b!726562 res!487529) b!726557))

(assert (= (and b!726557 res!487531) b!726550))

(assert (= (and b!726550 res!487519) b!726561))

(assert (= (and b!726561 c!79888) b!726548))

(assert (= (and b!726561 (not c!79888)) b!726549))

(assert (= (and b!726561 res!487521) b!726553))

(assert (= (and b!726553 res!487526) b!726552))

(assert (= (and b!726552 res!487524) b!726555))

(assert (= (and b!726555 res!487518) b!726551))

(declare-fun m!680599 () Bool)

(assert (=> b!726550 m!680599))

(declare-fun m!680601 () Bool)

(assert (=> b!726564 m!680601))

(assert (=> b!726564 m!680601))

(declare-fun m!680603 () Bool)

(assert (=> b!726564 m!680603))

(declare-fun m!680605 () Bool)

(assert (=> b!726553 m!680605))

(assert (=> b!726553 m!680605))

(declare-fun m!680607 () Bool)

(assert (=> b!726553 m!680607))

(declare-fun m!680609 () Bool)

(assert (=> b!726553 m!680609))

(declare-fun m!680611 () Bool)

(assert (=> b!726553 m!680611))

(declare-fun m!680613 () Bool)

(assert (=> b!726553 m!680613))

(declare-fun m!680615 () Bool)

(assert (=> b!726563 m!680615))

(assert (=> b!726548 m!680601))

(assert (=> b!726548 m!680601))

(declare-fun m!680617 () Bool)

(assert (=> b!726548 m!680617))

(declare-fun m!680619 () Bool)

(assert (=> b!726558 m!680619))

(declare-fun m!680621 () Bool)

(assert (=> b!726559 m!680621))

(assert (=> b!726549 m!680601))

(assert (=> b!726549 m!680601))

(declare-fun m!680623 () Bool)

(assert (=> b!726549 m!680623))

(assert (=> b!726555 m!680601))

(assert (=> b!726555 m!680601))

(declare-fun m!680625 () Bool)

(assert (=> b!726555 m!680625))

(declare-fun m!680627 () Bool)

(assert (=> b!726560 m!680627))

(declare-fun m!680629 () Bool)

(assert (=> b!726554 m!680629))

(assert (=> b!726557 m!680601))

(assert (=> b!726557 m!680601))

(declare-fun m!680631 () Bool)

(assert (=> b!726557 m!680631))

(assert (=> b!726557 m!680631))

(assert (=> b!726557 m!680601))

(declare-fun m!680633 () Bool)

(assert (=> b!726557 m!680633))

(assert (=> b!726551 m!680601))

(assert (=> b!726551 m!680601))

(declare-fun m!680635 () Bool)

(assert (=> b!726551 m!680635))

(declare-fun m!680637 () Bool)

(assert (=> start!64528 m!680637))

(declare-fun m!680639 () Bool)

(assert (=> start!64528 m!680639))

(declare-fun m!680641 () Bool)

(assert (=> b!726552 m!680641))

(declare-fun m!680643 () Bool)

(assert (=> b!726552 m!680643))

(push 1)

