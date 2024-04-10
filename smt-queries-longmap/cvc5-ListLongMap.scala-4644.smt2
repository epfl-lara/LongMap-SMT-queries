; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64636 () Bool)

(assert start!64636)

(declare-fun b!727930 () Bool)

(declare-fun res!488509 () Bool)

(declare-fun e!407514 () Bool)

(assert (=> b!727930 (=> (not res!488509) (not e!407514))))

(declare-datatypes ((array!41085 0))(
  ( (array!41086 (arr!19662 (Array (_ BitVec 32) (_ BitVec 64))) (size!20083 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41085)

(declare-datatypes ((List!13664 0))(
  ( (Nil!13661) (Cons!13660 (h!14720 (_ BitVec 64)) (t!19979 List!13664)) )
))
(declare-fun arrayNoDuplicates!0 (array!41085 (_ BitVec 32) List!13664) Bool)

(assert (=> b!727930 (= res!488509 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13661))))

(declare-fun b!727931 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!407515 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7262 0))(
  ( (MissingZero!7262 (index!31416 (_ BitVec 32))) (Found!7262 (index!31417 (_ BitVec 32))) (Intermediate!7262 (undefined!8074 Bool) (index!31418 (_ BitVec 32)) (x!62412 (_ BitVec 32))) (Undefined!7262) (MissingVacant!7262 (index!31419 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41085 (_ BitVec 32)) SeekEntryResult!7262)

(assert (=> b!727931 (= e!407515 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19662 a!3186) j!159) a!3186 mask!3328) (Found!7262 j!159)))))

(declare-fun b!727932 () Bool)

(declare-fun e!407509 () Bool)

(declare-fun e!407516 () Bool)

(assert (=> b!727932 (= e!407509 e!407516)))

(declare-fun res!488503 () Bool)

(assert (=> b!727932 (=> (not res!488503) (not e!407516))))

(declare-fun lt!322414 () SeekEntryResult!7262)

(declare-fun lt!322408 () SeekEntryResult!7262)

(assert (=> b!727932 (= res!488503 (= lt!322414 lt!322408))))

(declare-fun lt!322411 () (_ BitVec 64))

(declare-fun lt!322412 () array!41085)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41085 (_ BitVec 32)) SeekEntryResult!7262)

(assert (=> b!727932 (= lt!322408 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322411 lt!322412 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727932 (= lt!322414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322411 mask!3328) lt!322411 lt!322412 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!727932 (= lt!322411 (select (store (arr!19662 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!727932 (= lt!322412 (array!41086 (store (arr!19662 a!3186) i!1173 k!2102) (size!20083 a!3186)))))

(declare-fun res!488513 () Bool)

(declare-fun e!407512 () Bool)

(assert (=> start!64636 (=> (not res!488513) (not e!407512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64636 (= res!488513 (validMask!0 mask!3328))))

(assert (=> start!64636 e!407512))

(assert (=> start!64636 true))

(declare-fun array_inv!15458 (array!41085) Bool)

(assert (=> start!64636 (array_inv!15458 a!3186)))

(declare-fun b!727933 () Bool)

(declare-fun res!488515 () Bool)

(assert (=> b!727933 (=> (not res!488515) (not e!407512))))

(declare-fun arrayContainsKey!0 (array!41085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!727933 (= res!488515 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!727934 () Bool)

(assert (=> b!727934 (= e!407512 e!407514)))

(declare-fun res!488516 () Bool)

(assert (=> b!727934 (=> (not res!488516) (not e!407514))))

(declare-fun lt!322410 () SeekEntryResult!7262)

(assert (=> b!727934 (= res!488516 (or (= lt!322410 (MissingZero!7262 i!1173)) (= lt!322410 (MissingVacant!7262 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41085 (_ BitVec 32)) SeekEntryResult!7262)

(assert (=> b!727934 (= lt!322410 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!727935 () Bool)

(declare-fun res!488511 () Bool)

(assert (=> b!727935 (=> (not res!488511) (not e!407509))))

(assert (=> b!727935 (= res!488511 e!407515)))

(declare-fun c!80089 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!727935 (= c!80089 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!322415 () SeekEntryResult!7262)

(declare-fun b!727936 () Bool)

(assert (=> b!727936 (= e!407515 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19662 a!3186) j!159) a!3186 mask!3328) lt!322415))))

(declare-fun b!727937 () Bool)

(declare-fun e!407511 () Bool)

(declare-fun e!407508 () Bool)

(assert (=> b!727937 (= e!407511 e!407508)))

(declare-fun res!488507 () Bool)

(assert (=> b!727937 (=> (not res!488507) (not e!407508))))

(declare-fun lt!322407 () SeekEntryResult!7262)

(assert (=> b!727937 (= res!488507 (= (seekEntryOrOpen!0 (select (arr!19662 a!3186) j!159) a!3186 mask!3328) lt!322407))))

(assert (=> b!727937 (= lt!322407 (Found!7262 j!159))))

(declare-fun b!727938 () Bool)

(declare-fun res!488512 () Bool)

(assert (=> b!727938 (=> (not res!488512) (not e!407514))))

(assert (=> b!727938 (= res!488512 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20083 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20083 a!3186))))))

(declare-fun b!727939 () Bool)

(declare-fun res!488510 () Bool)

(assert (=> b!727939 (=> (not res!488510) (not e!407514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41085 (_ BitVec 32)) Bool)

(assert (=> b!727939 (= res!488510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!727940 () Bool)

(declare-fun res!488514 () Bool)

(assert (=> b!727940 (=> (not res!488514) (not e!407512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!727940 (= res!488514 (validKeyInArray!0 k!2102))))

(declare-fun b!727941 () Bool)

(declare-fun e!407513 () Bool)

(assert (=> b!727941 (= e!407516 (not e!407513))))

(declare-fun res!488501 () Bool)

(assert (=> b!727941 (=> res!488501 e!407513)))

(assert (=> b!727941 (= res!488501 (or (not (is-Intermediate!7262 lt!322408)) (bvsge x!1131 (x!62412 lt!322408))))))

(assert (=> b!727941 e!407511))

(declare-fun res!488506 () Bool)

(assert (=> b!727941 (=> (not res!488506) (not e!407511))))

(assert (=> b!727941 (= res!488506 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24842 0))(
  ( (Unit!24843) )
))
(declare-fun lt!322409 () Unit!24842)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41085 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24842)

(assert (=> b!727941 (= lt!322409 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!727942 () Bool)

(declare-fun res!488508 () Bool)

(assert (=> b!727942 (=> (not res!488508) (not e!407509))))

(assert (=> b!727942 (= res!488508 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19662 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727943 () Bool)

(declare-fun res!488504 () Bool)

(assert (=> b!727943 (=> (not res!488504) (not e!407512))))

(assert (=> b!727943 (= res!488504 (validKeyInArray!0 (select (arr!19662 a!3186) j!159)))))

(declare-fun b!727944 () Bool)

(assert (=> b!727944 (= e!407513 true)))

(declare-fun lt!322413 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727944 (= lt!322413 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!727945 () Bool)

(assert (=> b!727945 (= e!407508 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19662 a!3186) j!159) a!3186 mask!3328) lt!322407))))

(declare-fun b!727946 () Bool)

(assert (=> b!727946 (= e!407514 e!407509)))

(declare-fun res!488505 () Bool)

(assert (=> b!727946 (=> (not res!488505) (not e!407509))))

(assert (=> b!727946 (= res!488505 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19662 a!3186) j!159) mask!3328) (select (arr!19662 a!3186) j!159) a!3186 mask!3328) lt!322415))))

(assert (=> b!727946 (= lt!322415 (Intermediate!7262 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!727947 () Bool)

(declare-fun res!488502 () Bool)

(assert (=> b!727947 (=> (not res!488502) (not e!407512))))

(assert (=> b!727947 (= res!488502 (and (= (size!20083 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20083 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20083 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64636 res!488513) b!727947))

(assert (= (and b!727947 res!488502) b!727943))

(assert (= (and b!727943 res!488504) b!727940))

(assert (= (and b!727940 res!488514) b!727933))

(assert (= (and b!727933 res!488515) b!727934))

(assert (= (and b!727934 res!488516) b!727939))

(assert (= (and b!727939 res!488510) b!727930))

(assert (= (and b!727930 res!488509) b!727938))

(assert (= (and b!727938 res!488512) b!727946))

(assert (= (and b!727946 res!488505) b!727942))

(assert (= (and b!727942 res!488508) b!727935))

(assert (= (and b!727935 c!80089) b!727936))

(assert (= (and b!727935 (not c!80089)) b!727931))

(assert (= (and b!727935 res!488511) b!727932))

(assert (= (and b!727932 res!488503) b!727941))

(assert (= (and b!727941 res!488506) b!727937))

(assert (= (and b!727937 res!488507) b!727945))

(assert (= (and b!727941 (not res!488501)) b!727944))

(declare-fun m!681739 () Bool)

(assert (=> b!727931 m!681739))

(assert (=> b!727931 m!681739))

(declare-fun m!681741 () Bool)

(assert (=> b!727931 m!681741))

(assert (=> b!727943 m!681739))

(assert (=> b!727943 m!681739))

(declare-fun m!681743 () Bool)

(assert (=> b!727943 m!681743))

(assert (=> b!727946 m!681739))

(assert (=> b!727946 m!681739))

(declare-fun m!681745 () Bool)

(assert (=> b!727946 m!681745))

(assert (=> b!727946 m!681745))

(assert (=> b!727946 m!681739))

(declare-fun m!681747 () Bool)

(assert (=> b!727946 m!681747))

(declare-fun m!681749 () Bool)

(assert (=> b!727940 m!681749))

(declare-fun m!681751 () Bool)

(assert (=> b!727939 m!681751))

(declare-fun m!681753 () Bool)

(assert (=> b!727930 m!681753))

(declare-fun m!681755 () Bool)

(assert (=> b!727942 m!681755))

(assert (=> b!727945 m!681739))

(assert (=> b!727945 m!681739))

(declare-fun m!681757 () Bool)

(assert (=> b!727945 m!681757))

(assert (=> b!727937 m!681739))

(assert (=> b!727937 m!681739))

(declare-fun m!681759 () Bool)

(assert (=> b!727937 m!681759))

(declare-fun m!681761 () Bool)

(assert (=> b!727941 m!681761))

(declare-fun m!681763 () Bool)

(assert (=> b!727941 m!681763))

(declare-fun m!681765 () Bool)

(assert (=> b!727944 m!681765))

(assert (=> b!727936 m!681739))

(assert (=> b!727936 m!681739))

(declare-fun m!681767 () Bool)

(assert (=> b!727936 m!681767))

(declare-fun m!681769 () Bool)

(assert (=> b!727933 m!681769))

(declare-fun m!681771 () Bool)

(assert (=> start!64636 m!681771))

(declare-fun m!681773 () Bool)

(assert (=> start!64636 m!681773))

(declare-fun m!681775 () Bool)

(assert (=> b!727932 m!681775))

(assert (=> b!727932 m!681775))

(declare-fun m!681777 () Bool)

(assert (=> b!727932 m!681777))

(declare-fun m!681779 () Bool)

(assert (=> b!727932 m!681779))

(declare-fun m!681781 () Bool)

(assert (=> b!727932 m!681781))

(declare-fun m!681783 () Bool)

(assert (=> b!727932 m!681783))

(declare-fun m!681785 () Bool)

(assert (=> b!727934 m!681785))

(push 1)

