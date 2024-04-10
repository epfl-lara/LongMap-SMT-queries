; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65114 () Bool)

(assert start!65114)

(declare-fun b!734934 () Bool)

(declare-fun e!411221 () Bool)

(declare-fun e!411219 () Bool)

(assert (=> b!734934 (= e!411221 e!411219)))

(declare-fun res!493786 () Bool)

(assert (=> b!734934 (=> (not res!493786) (not e!411219))))

(declare-datatypes ((SeekEntryResult!7357 0))(
  ( (MissingZero!7357 (index!31796 (_ BitVec 32))) (Found!7357 (index!31797 (_ BitVec 32))) (Intermediate!7357 (undefined!8169 Bool) (index!31798 (_ BitVec 32)) (x!62803 (_ BitVec 32))) (Undefined!7357) (MissingVacant!7357 (index!31799 (_ BitVec 32))) )
))
(declare-fun lt!325738 () SeekEntryResult!7357)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!734934 (= res!493786 (or (= lt!325738 (MissingZero!7357 i!1173)) (= lt!325738 (MissingVacant!7357 i!1173))))))

(declare-datatypes ((array!41287 0))(
  ( (array!41288 (arr!19757 (Array (_ BitVec 32) (_ BitVec 64))) (size!20178 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41287)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41287 (_ BitVec 32)) SeekEntryResult!7357)

(assert (=> b!734934 (= lt!325738 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!734935 () Bool)

(declare-fun e!411224 () Bool)

(assert (=> b!734935 (= e!411219 e!411224)))

(declare-fun res!493780 () Bool)

(assert (=> b!734935 (=> (not res!493780) (not e!411224))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!325734 () SeekEntryResult!7357)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41287 (_ BitVec 32)) SeekEntryResult!7357)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734935 (= res!493780 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19757 a!3186) j!159) mask!3328) (select (arr!19757 a!3186) j!159) a!3186 mask!3328) lt!325734))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!734935 (= lt!325734 (Intermediate!7357 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!734936 () Bool)

(declare-fun res!493783 () Bool)

(assert (=> b!734936 (=> (not res!493783) (not e!411219))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!734936 (= res!493783 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20178 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20178 a!3186))))))

(declare-fun b!734937 () Bool)

(declare-fun res!493782 () Bool)

(assert (=> b!734937 (=> (not res!493782) (not e!411221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!734937 (= res!493782 (validKeyInArray!0 (select (arr!19757 a!3186) j!159)))))

(declare-fun b!734938 () Bool)

(declare-fun res!493771 () Bool)

(assert (=> b!734938 (=> (not res!493771) (not e!411219))))

(declare-datatypes ((List!13759 0))(
  ( (Nil!13756) (Cons!13755 (h!14827 (_ BitVec 64)) (t!20074 List!13759)) )
))
(declare-fun arrayNoDuplicates!0 (array!41287 (_ BitVec 32) List!13759) Bool)

(assert (=> b!734938 (= res!493771 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13756))))

(declare-fun b!734939 () Bool)

(declare-fun res!493787 () Bool)

(assert (=> b!734939 (=> (not res!493787) (not e!411221))))

(assert (=> b!734939 (= res!493787 (and (= (size!20178 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20178 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20178 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!734940 () Bool)

(declare-fun e!411215 () Bool)

(declare-fun e!411216 () Bool)

(assert (=> b!734940 (= e!411215 e!411216)))

(declare-fun res!493784 () Bool)

(assert (=> b!734940 (=> res!493784 e!411216)))

(assert (=> b!734940 (= res!493784 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!325733 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734940 (= lt!325733 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!734941 () Bool)

(declare-fun e!411220 () Bool)

(assert (=> b!734941 (= e!411220 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19757 a!3186) j!159) a!3186 mask!3328) lt!325734))))

(declare-fun b!734942 () Bool)

(declare-fun e!411217 () Bool)

(declare-fun e!411222 () Bool)

(assert (=> b!734942 (= e!411217 e!411222)))

(declare-fun res!493785 () Bool)

(assert (=> b!734942 (=> (not res!493785) (not e!411222))))

(declare-fun lt!325736 () SeekEntryResult!7357)

(assert (=> b!734942 (= res!493785 (= (seekEntryOrOpen!0 (select (arr!19757 a!3186) j!159) a!3186 mask!3328) lt!325736))))

(assert (=> b!734942 (= lt!325736 (Found!7357 j!159))))

(declare-fun b!734943 () Bool)

(assert (=> b!734943 (= e!411216 true)))

(declare-fun lt!325732 () SeekEntryResult!7357)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41287 (_ BitVec 32)) SeekEntryResult!7357)

(assert (=> b!734943 (= lt!325732 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19757 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!493776 () Bool)

(assert (=> start!65114 (=> (not res!493776) (not e!411221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65114 (= res!493776 (validMask!0 mask!3328))))

(assert (=> start!65114 e!411221))

(assert (=> start!65114 true))

(declare-fun array_inv!15553 (array!41287) Bool)

(assert (=> start!65114 (array_inv!15553 a!3186)))

(declare-fun b!734944 () Bool)

(declare-fun e!411223 () Bool)

(assert (=> b!734944 (= e!411223 (not e!411215))))

(declare-fun res!493777 () Bool)

(assert (=> b!734944 (=> res!493777 e!411215)))

(declare-fun lt!325735 () SeekEntryResult!7357)

(assert (=> b!734944 (= res!493777 (or (not (is-Intermediate!7357 lt!325735)) (bvsge x!1131 (x!62803 lt!325735))))))

(assert (=> b!734944 e!411217))

(declare-fun res!493773 () Bool)

(assert (=> b!734944 (=> (not res!493773) (not e!411217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41287 (_ BitVec 32)) Bool)

(assert (=> b!734944 (= res!493773 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25032 0))(
  ( (Unit!25033) )
))
(declare-fun lt!325731 () Unit!25032)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41287 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25032)

(assert (=> b!734944 (= lt!325731 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!734945 () Bool)

(assert (=> b!734945 (= e!411220 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19757 a!3186) j!159) a!3186 mask!3328) (Found!7357 j!159)))))

(declare-fun b!734946 () Bool)

(declare-fun res!493775 () Bool)

(assert (=> b!734946 (=> (not res!493775) (not e!411221))))

(declare-fun arrayContainsKey!0 (array!41287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!734946 (= res!493775 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!734947 () Bool)

(assert (=> b!734947 (= e!411222 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19757 a!3186) j!159) a!3186 mask!3328) lt!325736))))

(declare-fun b!734948 () Bool)

(declare-fun res!493772 () Bool)

(assert (=> b!734948 (=> (not res!493772) (not e!411221))))

(assert (=> b!734948 (= res!493772 (validKeyInArray!0 k!2102))))

(declare-fun b!734949 () Bool)

(assert (=> b!734949 (= e!411224 e!411223)))

(declare-fun res!493779 () Bool)

(assert (=> b!734949 (=> (not res!493779) (not e!411223))))

(declare-fun lt!325739 () SeekEntryResult!7357)

(assert (=> b!734949 (= res!493779 (= lt!325739 lt!325735))))

(declare-fun lt!325737 () array!41287)

(declare-fun lt!325730 () (_ BitVec 64))

(assert (=> b!734949 (= lt!325735 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325730 lt!325737 mask!3328))))

(assert (=> b!734949 (= lt!325739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325730 mask!3328) lt!325730 lt!325737 mask!3328))))

(assert (=> b!734949 (= lt!325730 (select (store (arr!19757 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!734949 (= lt!325737 (array!41288 (store (arr!19757 a!3186) i!1173 k!2102) (size!20178 a!3186)))))

(declare-fun b!734950 () Bool)

(declare-fun res!493781 () Bool)

(assert (=> b!734950 (=> (not res!493781) (not e!411224))))

(assert (=> b!734950 (= res!493781 e!411220)))

(declare-fun c!80962 () Bool)

(assert (=> b!734950 (= c!80962 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!734951 () Bool)

(declare-fun res!493778 () Bool)

(assert (=> b!734951 (=> (not res!493778) (not e!411219))))

(assert (=> b!734951 (= res!493778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!734952 () Bool)

(declare-fun res!493774 () Bool)

(assert (=> b!734952 (=> (not res!493774) (not e!411224))))

(assert (=> b!734952 (= res!493774 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19757 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65114 res!493776) b!734939))

(assert (= (and b!734939 res!493787) b!734937))

(assert (= (and b!734937 res!493782) b!734948))

(assert (= (and b!734948 res!493772) b!734946))

(assert (= (and b!734946 res!493775) b!734934))

(assert (= (and b!734934 res!493786) b!734951))

(assert (= (and b!734951 res!493778) b!734938))

(assert (= (and b!734938 res!493771) b!734936))

(assert (= (and b!734936 res!493783) b!734935))

(assert (= (and b!734935 res!493780) b!734952))

(assert (= (and b!734952 res!493774) b!734950))

(assert (= (and b!734950 c!80962) b!734941))

(assert (= (and b!734950 (not c!80962)) b!734945))

(assert (= (and b!734950 res!493781) b!734949))

(assert (= (and b!734949 res!493779) b!734944))

(assert (= (and b!734944 res!493773) b!734942))

(assert (= (and b!734942 res!493785) b!734947))

(assert (= (and b!734944 (not res!493777)) b!734940))

(assert (= (and b!734940 (not res!493784)) b!734943))

(declare-fun m!687427 () Bool)

(assert (=> b!734935 m!687427))

(assert (=> b!734935 m!687427))

(declare-fun m!687429 () Bool)

(assert (=> b!734935 m!687429))

(assert (=> b!734935 m!687429))

(assert (=> b!734935 m!687427))

(declare-fun m!687431 () Bool)

(assert (=> b!734935 m!687431))

(assert (=> b!734942 m!687427))

(assert (=> b!734942 m!687427))

(declare-fun m!687433 () Bool)

(assert (=> b!734942 m!687433))

(assert (=> b!734937 m!687427))

(assert (=> b!734937 m!687427))

(declare-fun m!687435 () Bool)

(assert (=> b!734937 m!687435))

(declare-fun m!687437 () Bool)

(assert (=> b!734952 m!687437))

(assert (=> b!734947 m!687427))

(assert (=> b!734947 m!687427))

(declare-fun m!687439 () Bool)

(assert (=> b!734947 m!687439))

(declare-fun m!687441 () Bool)

(assert (=> b!734946 m!687441))

(declare-fun m!687443 () Bool)

(assert (=> b!734949 m!687443))

(declare-fun m!687445 () Bool)

(assert (=> b!734949 m!687445))

(declare-fun m!687447 () Bool)

(assert (=> b!734949 m!687447))

(declare-fun m!687449 () Bool)

(assert (=> b!734949 m!687449))

(declare-fun m!687451 () Bool)

(assert (=> b!734949 m!687451))

(assert (=> b!734949 m!687443))

(declare-fun m!687453 () Bool)

(assert (=> b!734951 m!687453))

(declare-fun m!687455 () Bool)

(assert (=> b!734948 m!687455))

(declare-fun m!687457 () Bool)

(assert (=> b!734934 m!687457))

(assert (=> b!734941 m!687427))

(assert (=> b!734941 m!687427))

(declare-fun m!687459 () Bool)

(assert (=> b!734941 m!687459))

(declare-fun m!687461 () Bool)

(assert (=> b!734944 m!687461))

(declare-fun m!687463 () Bool)

(assert (=> b!734944 m!687463))

(assert (=> b!734945 m!687427))

(assert (=> b!734945 m!687427))

(declare-fun m!687465 () Bool)

(assert (=> b!734945 m!687465))

(declare-fun m!687467 () Bool)

(assert (=> b!734940 m!687467))

(declare-fun m!687469 () Bool)

(assert (=> start!65114 m!687469))

(declare-fun m!687471 () Bool)

(assert (=> start!65114 m!687471))

(declare-fun m!687473 () Bool)

(assert (=> b!734938 m!687473))

(assert (=> b!734943 m!687427))

(assert (=> b!734943 m!687427))

(assert (=> b!734943 m!687465))

(push 1)

