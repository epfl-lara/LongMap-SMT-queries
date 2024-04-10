; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64696 () Bool)

(assert start!64696)

(declare-fun b!729550 () Bool)

(declare-fun res!489948 () Bool)

(declare-fun e!408325 () Bool)

(assert (=> b!729550 (=> (not res!489948) (not e!408325))))

(declare-datatypes ((array!41145 0))(
  ( (array!41146 (arr!19692 (Array (_ BitVec 32) (_ BitVec 64))) (size!20113 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41145)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41145 (_ BitVec 32)) Bool)

(assert (=> b!729550 (= res!489948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729551 () Bool)

(declare-fun res!489954 () Bool)

(declare-fun e!408322 () Bool)

(assert (=> b!729551 (=> (not res!489954) (not e!408322))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729551 (= res!489954 (validKeyInArray!0 k!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!729552 () Bool)

(declare-fun e!408319 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7292 0))(
  ( (MissingZero!7292 (index!31536 (_ BitVec 32))) (Found!7292 (index!31537 (_ BitVec 32))) (Intermediate!7292 (undefined!8104 Bool) (index!31538 (_ BitVec 32)) (x!62522 (_ BitVec 32))) (Undefined!7292) (MissingVacant!7292 (index!31539 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41145 (_ BitVec 32)) SeekEntryResult!7292)

(assert (=> b!729552 (= e!408319 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19692 a!3186) j!159) a!3186 mask!3328) (Found!7292 j!159)))))

(declare-fun b!729553 () Bool)

(declare-fun e!408324 () Bool)

(declare-fun e!408320 () Bool)

(assert (=> b!729553 (= e!408324 e!408320)))

(declare-fun res!489951 () Bool)

(assert (=> b!729553 (=> (not res!489951) (not e!408320))))

(declare-fun lt!323225 () SeekEntryResult!7292)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41145 (_ BitVec 32)) SeekEntryResult!7292)

(assert (=> b!729553 (= res!489951 (= (seekEntryOrOpen!0 (select (arr!19692 a!3186) j!159) a!3186 mask!3328) lt!323225))))

(assert (=> b!729553 (= lt!323225 (Found!7292 j!159))))

(declare-fun b!729554 () Bool)

(declare-fun res!489945 () Bool)

(assert (=> b!729554 (=> (not res!489945) (not e!408325))))

(declare-datatypes ((List!13694 0))(
  ( (Nil!13691) (Cons!13690 (h!14750 (_ BitVec 64)) (t!20009 List!13694)) )
))
(declare-fun arrayNoDuplicates!0 (array!41145 (_ BitVec 32) List!13694) Bool)

(assert (=> b!729554 (= res!489945 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13691))))

(declare-fun b!729555 () Bool)

(declare-fun res!489953 () Bool)

(declare-fun e!408318 () Bool)

(assert (=> b!729555 (=> (not res!489953) (not e!408318))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729555 (= res!489953 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19692 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729556 () Bool)

(declare-fun e!408326 () Bool)

(assert (=> b!729556 (= e!408318 e!408326)))

(declare-fun res!489943 () Bool)

(assert (=> b!729556 (=> (not res!489943) (not e!408326))))

(declare-fun lt!323222 () SeekEntryResult!7292)

(declare-fun lt!323223 () SeekEntryResult!7292)

(assert (=> b!729556 (= res!489943 (= lt!323222 lt!323223))))

(declare-fun lt!323218 () array!41145)

(declare-fun lt!323220 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41145 (_ BitVec 32)) SeekEntryResult!7292)

(assert (=> b!729556 (= lt!323223 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323220 lt!323218 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729556 (= lt!323222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323220 mask!3328) lt!323220 lt!323218 mask!3328))))

(assert (=> b!729556 (= lt!323220 (select (store (arr!19692 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!729556 (= lt!323218 (array!41146 (store (arr!19692 a!3186) i!1173 k!2102) (size!20113 a!3186)))))

(declare-fun b!729557 () Bool)

(assert (=> b!729557 (= e!408322 e!408325)))

(declare-fun res!489949 () Bool)

(assert (=> b!729557 (=> (not res!489949) (not e!408325))))

(declare-fun lt!323219 () SeekEntryResult!7292)

(assert (=> b!729557 (= res!489949 (or (= lt!323219 (MissingZero!7292 i!1173)) (= lt!323219 (MissingVacant!7292 i!1173))))))

(assert (=> b!729557 (= lt!323219 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!729558 () Bool)

(declare-fun res!489941 () Bool)

(assert (=> b!729558 (=> (not res!489941) (not e!408322))))

(declare-fun arrayContainsKey!0 (array!41145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729558 (= res!489941 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729559 () Bool)

(declare-fun res!489944 () Bool)

(assert (=> b!729559 (=> (not res!489944) (not e!408322))))

(assert (=> b!729559 (= res!489944 (and (= (size!20113 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20113 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20113 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729560 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!408321 () Bool)

(assert (=> b!729560 (= e!408321 (or (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun lt!323224 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729560 (= lt!323224 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!729561 () Bool)

(declare-fun res!489952 () Bool)

(assert (=> b!729561 (=> (not res!489952) (not e!408318))))

(assert (=> b!729561 (= res!489952 e!408319)))

(declare-fun c!80179 () Bool)

(assert (=> b!729561 (= c!80179 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729562 () Bool)

(assert (=> b!729562 (= e!408325 e!408318)))

(declare-fun res!489950 () Bool)

(assert (=> b!729562 (=> (not res!489950) (not e!408318))))

(declare-fun lt!323217 () SeekEntryResult!7292)

(assert (=> b!729562 (= res!489950 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19692 a!3186) j!159) mask!3328) (select (arr!19692 a!3186) j!159) a!3186 mask!3328) lt!323217))))

(assert (=> b!729562 (= lt!323217 (Intermediate!7292 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729563 () Bool)

(assert (=> b!729563 (= e!408326 (not e!408321))))

(declare-fun res!489956 () Bool)

(assert (=> b!729563 (=> res!489956 e!408321)))

(assert (=> b!729563 (= res!489956 (or (not (is-Intermediate!7292 lt!323223)) (bvsge x!1131 (x!62522 lt!323223))))))

(assert (=> b!729563 e!408324))

(declare-fun res!489955 () Bool)

(assert (=> b!729563 (=> (not res!489955) (not e!408324))))

(assert (=> b!729563 (= res!489955 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24902 0))(
  ( (Unit!24903) )
))
(declare-fun lt!323221 () Unit!24902)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24902)

(assert (=> b!729563 (= lt!323221 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!489947 () Bool)

(assert (=> start!64696 (=> (not res!489947) (not e!408322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64696 (= res!489947 (validMask!0 mask!3328))))

(assert (=> start!64696 e!408322))

(assert (=> start!64696 true))

(declare-fun array_inv!15488 (array!41145) Bool)

(assert (=> start!64696 (array_inv!15488 a!3186)))

(declare-fun b!729564 () Bool)

(declare-fun res!489942 () Bool)

(assert (=> b!729564 (=> (not res!489942) (not e!408325))))

(assert (=> b!729564 (= res!489942 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20113 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20113 a!3186))))))

(declare-fun b!729565 () Bool)

(declare-fun res!489946 () Bool)

(assert (=> b!729565 (=> (not res!489946) (not e!408322))))

(assert (=> b!729565 (= res!489946 (validKeyInArray!0 (select (arr!19692 a!3186) j!159)))))

(declare-fun b!729566 () Bool)

(assert (=> b!729566 (= e!408319 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19692 a!3186) j!159) a!3186 mask!3328) lt!323217))))

(declare-fun b!729567 () Bool)

(assert (=> b!729567 (= e!408320 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19692 a!3186) j!159) a!3186 mask!3328) lt!323225))))

(assert (= (and start!64696 res!489947) b!729559))

(assert (= (and b!729559 res!489944) b!729565))

(assert (= (and b!729565 res!489946) b!729551))

(assert (= (and b!729551 res!489954) b!729558))

(assert (= (and b!729558 res!489941) b!729557))

(assert (= (and b!729557 res!489949) b!729550))

(assert (= (and b!729550 res!489948) b!729554))

(assert (= (and b!729554 res!489945) b!729564))

(assert (= (and b!729564 res!489942) b!729562))

(assert (= (and b!729562 res!489950) b!729555))

(assert (= (and b!729555 res!489953) b!729561))

(assert (= (and b!729561 c!80179) b!729566))

(assert (= (and b!729561 (not c!80179)) b!729552))

(assert (= (and b!729561 res!489952) b!729556))

(assert (= (and b!729556 res!489943) b!729563))

(assert (= (and b!729563 res!489955) b!729553))

(assert (= (and b!729553 res!489951) b!729567))

(assert (= (and b!729563 (not res!489956)) b!729560))

(declare-fun m!683179 () Bool)

(assert (=> b!729552 m!683179))

(assert (=> b!729552 m!683179))

(declare-fun m!683181 () Bool)

(assert (=> b!729552 m!683181))

(declare-fun m!683183 () Bool)

(assert (=> b!729556 m!683183))

(declare-fun m!683185 () Bool)

(assert (=> b!729556 m!683185))

(assert (=> b!729556 m!683183))

(declare-fun m!683187 () Bool)

(assert (=> b!729556 m!683187))

(declare-fun m!683189 () Bool)

(assert (=> b!729556 m!683189))

(declare-fun m!683191 () Bool)

(assert (=> b!729556 m!683191))

(declare-fun m!683193 () Bool)

(assert (=> b!729560 m!683193))

(declare-fun m!683195 () Bool)

(assert (=> b!729554 m!683195))

(assert (=> b!729565 m!683179))

(assert (=> b!729565 m!683179))

(declare-fun m!683197 () Bool)

(assert (=> b!729565 m!683197))

(declare-fun m!683199 () Bool)

(assert (=> b!729555 m!683199))

(declare-fun m!683201 () Bool)

(assert (=> start!64696 m!683201))

(declare-fun m!683203 () Bool)

(assert (=> start!64696 m!683203))

(declare-fun m!683205 () Bool)

(assert (=> b!729550 m!683205))

(declare-fun m!683207 () Bool)

(assert (=> b!729557 m!683207))

(assert (=> b!729567 m!683179))

(assert (=> b!729567 m!683179))

(declare-fun m!683209 () Bool)

(assert (=> b!729567 m!683209))

(declare-fun m!683211 () Bool)

(assert (=> b!729551 m!683211))

(assert (=> b!729562 m!683179))

(assert (=> b!729562 m!683179))

(declare-fun m!683213 () Bool)

(assert (=> b!729562 m!683213))

(assert (=> b!729562 m!683213))

(assert (=> b!729562 m!683179))

(declare-fun m!683215 () Bool)

(assert (=> b!729562 m!683215))

(assert (=> b!729566 m!683179))

(assert (=> b!729566 m!683179))

(declare-fun m!683217 () Bool)

(assert (=> b!729566 m!683217))

(declare-fun m!683219 () Bool)

(assert (=> b!729563 m!683219))

(declare-fun m!683221 () Bool)

(assert (=> b!729563 m!683221))

(assert (=> b!729553 m!683179))

(assert (=> b!729553 m!683179))

(declare-fun m!683223 () Bool)

(assert (=> b!729553 m!683223))

(declare-fun m!683225 () Bool)

(assert (=> b!729558 m!683225))

(push 1)

