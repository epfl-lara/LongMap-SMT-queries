; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65596 () Bool)

(assert start!65596)

(declare-fun b!750045 () Bool)

(declare-fun res!506176 () Bool)

(declare-fun e!418500 () Bool)

(assert (=> b!750045 (=> (not res!506176) (not e!418500))))

(declare-datatypes ((array!41769 0))(
  ( (array!41770 (arr!19998 (Array (_ BitVec 32) (_ BitVec 64))) (size!20419 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41769)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750045 (= res!506176 (validKeyInArray!0 (select (arr!19998 a!3186) j!159)))))

(declare-fun b!750046 () Bool)

(declare-fun res!506182 () Bool)

(assert (=> b!750046 (=> (not res!506182) (not e!418500))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!750046 (= res!506182 (and (= (size!20419 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20419 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20419 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750047 () Bool)

(declare-fun e!418492 () Bool)

(declare-fun e!418494 () Bool)

(assert (=> b!750047 (= e!418492 (not e!418494))))

(declare-fun res!506183 () Bool)

(assert (=> b!750047 (=> res!506183 e!418494)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7598 0))(
  ( (MissingZero!7598 (index!32760 (_ BitVec 32))) (Found!7598 (index!32761 (_ BitVec 32))) (Intermediate!7598 (undefined!8410 Bool) (index!32762 (_ BitVec 32)) (x!63692 (_ BitVec 32))) (Undefined!7598) (MissingVacant!7598 (index!32763 (_ BitVec 32))) )
))
(declare-fun lt!333488 () SeekEntryResult!7598)

(assert (=> b!750047 (= res!506183 (or (not (is-Intermediate!7598 lt!333488)) (bvslt x!1131 (x!63692 lt!333488)) (not (= x!1131 (x!63692 lt!333488))) (not (= index!1321 (index!32762 lt!333488)))))))

(declare-fun e!418502 () Bool)

(assert (=> b!750047 e!418502))

(declare-fun res!506172 () Bool)

(assert (=> b!750047 (=> (not res!506172) (not e!418502))))

(declare-fun lt!333484 () SeekEntryResult!7598)

(declare-fun lt!333485 () SeekEntryResult!7598)

(assert (=> b!750047 (= res!506172 (= lt!333484 lt!333485))))

(assert (=> b!750047 (= lt!333485 (Found!7598 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41769 (_ BitVec 32)) SeekEntryResult!7598)

(assert (=> b!750047 (= lt!333484 (seekEntryOrOpen!0 (select (arr!19998 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41769 (_ BitVec 32)) Bool)

(assert (=> b!750047 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25772 0))(
  ( (Unit!25773) )
))
(declare-fun lt!333486 () Unit!25772)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25772)

(assert (=> b!750047 (= lt!333486 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750048 () Bool)

(declare-fun res!506186 () Bool)

(assert (=> b!750048 (=> (not res!506186) (not e!418500))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750048 (= res!506186 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750049 () Bool)

(declare-fun res!506177 () Bool)

(assert (=> b!750049 (=> (not res!506177) (not e!418500))))

(assert (=> b!750049 (= res!506177 (validKeyInArray!0 k!2102))))

(declare-fun b!750050 () Bool)

(declare-fun res!506185 () Bool)

(declare-fun e!418496 () Bool)

(assert (=> b!750050 (=> (not res!506185) (not e!418496))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750050 (= res!506185 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20419 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20419 a!3186))))))

(declare-fun b!750051 () Bool)

(declare-fun res!506184 () Bool)

(assert (=> b!750051 (=> (not res!506184) (not e!418496))))

(declare-datatypes ((List!14000 0))(
  ( (Nil!13997) (Cons!13996 (h!15068 (_ BitVec 64)) (t!20315 List!14000)) )
))
(declare-fun arrayNoDuplicates!0 (array!41769 (_ BitVec 32) List!14000) Bool)

(assert (=> b!750051 (= res!506184 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13997))))

(declare-fun b!750052 () Bool)

(declare-fun e!418495 () Bool)

(declare-fun lt!333489 () (_ BitVec 64))

(declare-fun lt!333487 () array!41769)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41769 (_ BitVec 32)) SeekEntryResult!7598)

(assert (=> b!750052 (= e!418495 (= (seekEntryOrOpen!0 lt!333489 lt!333487 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333489 lt!333487 mask!3328)))))

(declare-fun res!506179 () Bool)

(assert (=> start!65596 (=> (not res!506179) (not e!418500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65596 (= res!506179 (validMask!0 mask!3328))))

(assert (=> start!65596 e!418500))

(assert (=> start!65596 true))

(declare-fun array_inv!15794 (array!41769) Bool)

(assert (=> start!65596 (array_inv!15794 a!3186)))

(declare-fun b!750053 () Bool)

(declare-fun e!418501 () Unit!25772)

(declare-fun Unit!25774 () Unit!25772)

(assert (=> b!750053 (= e!418501 Unit!25774)))

(assert (=> b!750053 false))

(declare-fun b!750054 () Bool)

(declare-fun res!506173 () Bool)

(declare-fun e!418493 () Bool)

(assert (=> b!750054 (=> (not res!506173) (not e!418493))))

(assert (=> b!750054 (= res!506173 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19998 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750055 () Bool)

(assert (=> b!750055 (= e!418500 e!418496)))

(declare-fun res!506188 () Bool)

(assert (=> b!750055 (=> (not res!506188) (not e!418496))))

(declare-fun lt!333492 () SeekEntryResult!7598)

(assert (=> b!750055 (= res!506188 (or (= lt!333492 (MissingZero!7598 i!1173)) (= lt!333492 (MissingVacant!7598 i!1173))))))

(assert (=> b!750055 (= lt!333492 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!750056 () Bool)

(declare-fun res!506178 () Bool)

(assert (=> b!750056 (=> (not res!506178) (not e!418496))))

(assert (=> b!750056 (= res!506178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750057 () Bool)

(declare-fun res!506189 () Bool)

(assert (=> b!750057 (=> (not res!506189) (not e!418493))))

(declare-fun e!418497 () Bool)

(assert (=> b!750057 (= res!506189 e!418497)))

(declare-fun c!82318 () Bool)

(assert (=> b!750057 (= c!82318 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750058 () Bool)

(declare-fun Unit!25775 () Unit!25772)

(assert (=> b!750058 (= e!418501 Unit!25775)))

(declare-fun lt!333493 () SeekEntryResult!7598)

(declare-fun b!750059 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41769 (_ BitVec 32)) SeekEntryResult!7598)

(assert (=> b!750059 (= e!418497 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19998 a!3186) j!159) a!3186 mask!3328) lt!333493))))

(declare-fun b!750060 () Bool)

(assert (=> b!750060 (= e!418502 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19998 a!3186) j!159) a!3186 mask!3328) lt!333485))))

(declare-fun b!750061 () Bool)

(assert (=> b!750061 (= e!418493 e!418492)))

(declare-fun res!506180 () Bool)

(assert (=> b!750061 (=> (not res!506180) (not e!418492))))

(declare-fun lt!333494 () SeekEntryResult!7598)

(assert (=> b!750061 (= res!506180 (= lt!333494 lt!333488))))

(assert (=> b!750061 (= lt!333488 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333489 lt!333487 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750061 (= lt!333494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333489 mask!3328) lt!333489 lt!333487 mask!3328))))

(assert (=> b!750061 (= lt!333489 (select (store (arr!19998 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!750061 (= lt!333487 (array!41770 (store (arr!19998 a!3186) i!1173 k!2102) (size!20419 a!3186)))))

(declare-fun b!750062 () Bool)

(declare-fun res!506187 () Bool)

(assert (=> b!750062 (=> res!506187 e!418494)))

(assert (=> b!750062 (= res!506187 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19998 a!3186) j!159) a!3186 mask!3328) lt!333485)))))

(declare-fun b!750063 () Bool)

(assert (=> b!750063 (= e!418496 e!418493)))

(declare-fun res!506174 () Bool)

(assert (=> b!750063 (=> (not res!506174) (not e!418493))))

(assert (=> b!750063 (= res!506174 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19998 a!3186) j!159) mask!3328) (select (arr!19998 a!3186) j!159) a!3186 mask!3328) lt!333493))))

(assert (=> b!750063 (= lt!333493 (Intermediate!7598 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750064 () Bool)

(declare-fun e!418498 () Bool)

(assert (=> b!750064 (= e!418494 e!418498)))

(declare-fun res!506181 () Bool)

(assert (=> b!750064 (=> res!506181 e!418498)))

(declare-fun lt!333491 () (_ BitVec 64))

(assert (=> b!750064 (= res!506181 (= lt!333491 lt!333489))))

(assert (=> b!750064 (= lt!333491 (select (store (arr!19998 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!750065 () Bool)

(assert (=> b!750065 (= e!418497 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19998 a!3186) j!159) a!3186 mask!3328) (Found!7598 j!159)))))

(declare-fun b!750066 () Bool)

(assert (=> b!750066 (= e!418498 true)))

(assert (=> b!750066 e!418495))

(declare-fun res!506175 () Bool)

(assert (=> b!750066 (=> (not res!506175) (not e!418495))))

(assert (=> b!750066 (= res!506175 (= lt!333491 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333490 () Unit!25772)

(assert (=> b!750066 (= lt!333490 e!418501)))

(declare-fun c!82317 () Bool)

(assert (=> b!750066 (= c!82317 (= lt!333491 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!65596 res!506179) b!750046))

(assert (= (and b!750046 res!506182) b!750045))

(assert (= (and b!750045 res!506176) b!750049))

(assert (= (and b!750049 res!506177) b!750048))

(assert (= (and b!750048 res!506186) b!750055))

(assert (= (and b!750055 res!506188) b!750056))

(assert (= (and b!750056 res!506178) b!750051))

(assert (= (and b!750051 res!506184) b!750050))

(assert (= (and b!750050 res!506185) b!750063))

(assert (= (and b!750063 res!506174) b!750054))

(assert (= (and b!750054 res!506173) b!750057))

(assert (= (and b!750057 c!82318) b!750059))

(assert (= (and b!750057 (not c!82318)) b!750065))

(assert (= (and b!750057 res!506189) b!750061))

(assert (= (and b!750061 res!506180) b!750047))

(assert (= (and b!750047 res!506172) b!750060))

(assert (= (and b!750047 (not res!506183)) b!750062))

(assert (= (and b!750062 (not res!506187)) b!750064))

(assert (= (and b!750064 (not res!506181)) b!750066))

(assert (= (and b!750066 c!82317) b!750053))

(assert (= (and b!750066 (not c!82317)) b!750058))

(assert (= (and b!750066 res!506175) b!750052))

(declare-fun m!699523 () Bool)

(assert (=> b!750065 m!699523))

(assert (=> b!750065 m!699523))

(declare-fun m!699525 () Bool)

(assert (=> b!750065 m!699525))

(declare-fun m!699527 () Bool)

(assert (=> b!750054 m!699527))

(declare-fun m!699529 () Bool)

(assert (=> start!65596 m!699529))

(declare-fun m!699531 () Bool)

(assert (=> start!65596 m!699531))

(assert (=> b!750060 m!699523))

(assert (=> b!750060 m!699523))

(declare-fun m!699533 () Bool)

(assert (=> b!750060 m!699533))

(assert (=> b!750047 m!699523))

(assert (=> b!750047 m!699523))

(declare-fun m!699535 () Bool)

(assert (=> b!750047 m!699535))

(declare-fun m!699537 () Bool)

(assert (=> b!750047 m!699537))

(declare-fun m!699539 () Bool)

(assert (=> b!750047 m!699539))

(declare-fun m!699541 () Bool)

(assert (=> b!750064 m!699541))

(declare-fun m!699543 () Bool)

(assert (=> b!750064 m!699543))

(assert (=> b!750045 m!699523))

(assert (=> b!750045 m!699523))

(declare-fun m!699545 () Bool)

(assert (=> b!750045 m!699545))

(declare-fun m!699547 () Bool)

(assert (=> b!750049 m!699547))

(assert (=> b!750063 m!699523))

(assert (=> b!750063 m!699523))

(declare-fun m!699549 () Bool)

(assert (=> b!750063 m!699549))

(assert (=> b!750063 m!699549))

(assert (=> b!750063 m!699523))

(declare-fun m!699551 () Bool)

(assert (=> b!750063 m!699551))

(assert (=> b!750059 m!699523))

(assert (=> b!750059 m!699523))

(declare-fun m!699553 () Bool)

(assert (=> b!750059 m!699553))

(declare-fun m!699555 () Bool)

(assert (=> b!750051 m!699555))

(declare-fun m!699557 () Bool)

(assert (=> b!750055 m!699557))

(declare-fun m!699559 () Bool)

(assert (=> b!750056 m!699559))

(assert (=> b!750061 m!699541))

(declare-fun m!699561 () Bool)

(assert (=> b!750061 m!699561))

(declare-fun m!699563 () Bool)

(assert (=> b!750061 m!699563))

(assert (=> b!750061 m!699561))

(declare-fun m!699565 () Bool)

(assert (=> b!750061 m!699565))

(declare-fun m!699567 () Bool)

(assert (=> b!750061 m!699567))

(declare-fun m!699569 () Bool)

(assert (=> b!750048 m!699569))

(assert (=> b!750062 m!699523))

(assert (=> b!750062 m!699523))

(assert (=> b!750062 m!699525))

(declare-fun m!699571 () Bool)

(assert (=> b!750052 m!699571))

(declare-fun m!699573 () Bool)

(assert (=> b!750052 m!699573))

(push 1)

