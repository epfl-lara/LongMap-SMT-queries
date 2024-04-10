; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65824 () Bool)

(assert start!65824)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41997 0))(
  ( (array!41998 (arr!20112 (Array (_ BitVec 32) (_ BitVec 64))) (size!20533 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41997)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!757841 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!422526 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7712 0))(
  ( (MissingZero!7712 (index!33216 (_ BitVec 32))) (Found!7712 (index!33217 (_ BitVec 32))) (Intermediate!7712 (undefined!8524 Bool) (index!33218 (_ BitVec 32)) (x!64110 (_ BitVec 32))) (Undefined!7712) (MissingVacant!7712 (index!33219 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41997 (_ BitVec 32)) SeekEntryResult!7712)

(assert (=> b!757841 (= e!422526 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20112 a!3186) j!159) a!3186 mask!3328) (Found!7712 j!159)))))

(declare-fun b!757842 () Bool)

(declare-fun e!422535 () Bool)

(declare-fun e!422531 () Bool)

(assert (=> b!757842 (= e!422535 e!422531)))

(declare-fun res!512607 () Bool)

(assert (=> b!757842 (=> (not res!512607) (not e!422531))))

(declare-fun lt!337524 () SeekEntryResult!7712)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!757842 (= res!512607 (or (= lt!337524 (MissingZero!7712 i!1173)) (= lt!337524 (MissingVacant!7712 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41997 (_ BitVec 32)) SeekEntryResult!7712)

(assert (=> b!757842 (= lt!337524 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!757843 () Bool)

(declare-fun res!512603 () Bool)

(assert (=> b!757843 (=> (not res!512603) (not e!422535))))

(assert (=> b!757843 (= res!512603 (and (= (size!20533 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20533 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20533 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757844 () Bool)

(declare-fun res!512617 () Bool)

(assert (=> b!757844 (=> (not res!512617) (not e!422535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757844 (= res!512617 (validKeyInArray!0 k!2102))))

(declare-fun b!757845 () Bool)

(declare-fun res!512616 () Bool)

(assert (=> b!757845 (=> (not res!512616) (not e!422531))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757845 (= res!512616 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20533 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20533 a!3186))))))

(declare-fun b!757846 () Bool)

(declare-fun res!512605 () Bool)

(assert (=> b!757846 (=> (not res!512605) (not e!422535))))

(assert (=> b!757846 (= res!512605 (validKeyInArray!0 (select (arr!20112 a!3186) j!159)))))

(declare-fun b!757847 () Bool)

(declare-fun res!512610 () Bool)

(declare-fun e!422527 () Bool)

(assert (=> b!757847 (=> (not res!512610) (not e!422527))))

(declare-fun lt!337522 () array!41997)

(declare-fun lt!337518 () (_ BitVec 64))

(assert (=> b!757847 (= res!512610 (= (seekEntryOrOpen!0 lt!337518 lt!337522 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337518 lt!337522 mask!3328)))))

(declare-fun b!757848 () Bool)

(declare-fun e!422536 () Bool)

(declare-fun e!422533 () Bool)

(assert (=> b!757848 (= e!422536 e!422533)))

(declare-fun res!512606 () Bool)

(assert (=> b!757848 (=> res!512606 e!422533)))

(declare-fun lt!337523 () SeekEntryResult!7712)

(declare-fun lt!337526 () SeekEntryResult!7712)

(assert (=> b!757848 (= res!512606 (not (= lt!337523 lt!337526)))))

(assert (=> b!757848 (= lt!337523 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20112 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757849 () Bool)

(declare-fun res!512613 () Bool)

(assert (=> b!757849 (=> (not res!512613) (not e!422531))))

(declare-datatypes ((List!14114 0))(
  ( (Nil!14111) (Cons!14110 (h!15182 (_ BitVec 64)) (t!20429 List!14114)) )
))
(declare-fun arrayNoDuplicates!0 (array!41997 (_ BitVec 32) List!14114) Bool)

(assert (=> b!757849 (= res!512613 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14111))))

(declare-fun b!757850 () Bool)

(declare-datatypes ((Unit!26228 0))(
  ( (Unit!26229) )
))
(declare-fun e!422534 () Unit!26228)

(declare-fun Unit!26230 () Unit!26228)

(assert (=> b!757850 (= e!422534 Unit!26230)))

(assert (=> b!757850 false))

(declare-fun b!757851 () Bool)

(declare-fun lt!337527 () SeekEntryResult!7712)

(assert (=> b!757851 (= e!422527 (= lt!337527 lt!337523))))

(declare-fun b!757852 () Bool)

(declare-fun res!512615 () Bool)

(declare-fun e!422532 () Bool)

(assert (=> b!757852 (=> (not res!512615) (not e!422532))))

(assert (=> b!757852 (= res!512615 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20112 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757853 () Bool)

(declare-fun Unit!26231 () Unit!26228)

(assert (=> b!757853 (= e!422534 Unit!26231)))

(declare-fun res!512612 () Bool)

(assert (=> start!65824 (=> (not res!512612) (not e!422535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65824 (= res!512612 (validMask!0 mask!3328))))

(assert (=> start!65824 e!422535))

(assert (=> start!65824 true))

(declare-fun array_inv!15908 (array!41997) Bool)

(assert (=> start!65824 (array_inv!15908 a!3186)))

(declare-fun b!757854 () Bool)

(assert (=> b!757854 (= e!422531 e!422532)))

(declare-fun res!512611 () Bool)

(assert (=> b!757854 (=> (not res!512611) (not e!422532))))

(declare-fun lt!337529 () SeekEntryResult!7712)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41997 (_ BitVec 32)) SeekEntryResult!7712)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757854 (= res!512611 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20112 a!3186) j!159) mask!3328) (select (arr!20112 a!3186) j!159) a!3186 mask!3328) lt!337529))))

(assert (=> b!757854 (= lt!337529 (Intermediate!7712 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757855 () Bool)

(declare-fun res!512608 () Bool)

(assert (=> b!757855 (=> (not res!512608) (not e!422531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41997 (_ BitVec 32)) Bool)

(assert (=> b!757855 (= res!512608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!422530 () Bool)

(declare-fun b!757856 () Bool)

(assert (=> b!757856 (= e!422530 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20112 a!3186) j!159) a!3186 mask!3328) lt!337526))))

(declare-fun b!757857 () Bool)

(assert (=> b!757857 (= e!422526 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20112 a!3186) j!159) a!3186 mask!3328) lt!337529))))

(declare-fun b!757858 () Bool)

(declare-fun res!512609 () Bool)

(assert (=> b!757858 (=> (not res!512609) (not e!422535))))

(declare-fun arrayContainsKey!0 (array!41997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757858 (= res!512609 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757859 () Bool)

(declare-fun res!512602 () Bool)

(assert (=> b!757859 (=> (not res!512602) (not e!422532))))

(assert (=> b!757859 (= res!512602 e!422526)))

(declare-fun c!83001 () Bool)

(assert (=> b!757859 (= c!83001 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757860 () Bool)

(declare-fun e!422537 () Bool)

(assert (=> b!757860 (= e!422537 true)))

(assert (=> b!757860 e!422527))

(declare-fun res!512618 () Bool)

(assert (=> b!757860 (=> (not res!512618) (not e!422527))))

(declare-fun lt!337528 () (_ BitVec 64))

(assert (=> b!757860 (= res!512618 (= lt!337528 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337525 () Unit!26228)

(assert (=> b!757860 (= lt!337525 e!422534)))

(declare-fun c!83002 () Bool)

(assert (=> b!757860 (= c!83002 (= lt!337528 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757861 () Bool)

(declare-fun e!422529 () Bool)

(assert (=> b!757861 (= e!422532 e!422529)))

(declare-fun res!512601 () Bool)

(assert (=> b!757861 (=> (not res!512601) (not e!422529))))

(declare-fun lt!337519 () SeekEntryResult!7712)

(declare-fun lt!337521 () SeekEntryResult!7712)

(assert (=> b!757861 (= res!512601 (= lt!337519 lt!337521))))

(assert (=> b!757861 (= lt!337521 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337518 lt!337522 mask!3328))))

(assert (=> b!757861 (= lt!337519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337518 mask!3328) lt!337518 lt!337522 mask!3328))))

(assert (=> b!757861 (= lt!337518 (select (store (arr!20112 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!757861 (= lt!337522 (array!41998 (store (arr!20112 a!3186) i!1173 k!2102) (size!20533 a!3186)))))

(declare-fun b!757862 () Bool)

(assert (=> b!757862 (= e!422529 (not e!422536))))

(declare-fun res!512604 () Bool)

(assert (=> b!757862 (=> res!512604 e!422536)))

(assert (=> b!757862 (= res!512604 (or (not (is-Intermediate!7712 lt!337521)) (bvslt x!1131 (x!64110 lt!337521)) (not (= x!1131 (x!64110 lt!337521))) (not (= index!1321 (index!33218 lt!337521)))))))

(assert (=> b!757862 e!422530))

(declare-fun res!512614 () Bool)

(assert (=> b!757862 (=> (not res!512614) (not e!422530))))

(assert (=> b!757862 (= res!512614 (= lt!337527 lt!337526))))

(assert (=> b!757862 (= lt!337526 (Found!7712 j!159))))

(assert (=> b!757862 (= lt!337527 (seekEntryOrOpen!0 (select (arr!20112 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!757862 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337520 () Unit!26228)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41997 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26228)

(assert (=> b!757862 (= lt!337520 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757863 () Bool)

(assert (=> b!757863 (= e!422533 e!422537)))

(declare-fun res!512600 () Bool)

(assert (=> b!757863 (=> res!512600 e!422537)))

(assert (=> b!757863 (= res!512600 (= lt!337528 lt!337518))))

(assert (=> b!757863 (= lt!337528 (select (store (arr!20112 a!3186) i!1173 k!2102) index!1321))))

(assert (= (and start!65824 res!512612) b!757843))

(assert (= (and b!757843 res!512603) b!757846))

(assert (= (and b!757846 res!512605) b!757844))

(assert (= (and b!757844 res!512617) b!757858))

(assert (= (and b!757858 res!512609) b!757842))

(assert (= (and b!757842 res!512607) b!757855))

(assert (= (and b!757855 res!512608) b!757849))

(assert (= (and b!757849 res!512613) b!757845))

(assert (= (and b!757845 res!512616) b!757854))

(assert (= (and b!757854 res!512611) b!757852))

(assert (= (and b!757852 res!512615) b!757859))

(assert (= (and b!757859 c!83001) b!757857))

(assert (= (and b!757859 (not c!83001)) b!757841))

(assert (= (and b!757859 res!512602) b!757861))

(assert (= (and b!757861 res!512601) b!757862))

(assert (= (and b!757862 res!512614) b!757856))

(assert (= (and b!757862 (not res!512604)) b!757848))

(assert (= (and b!757848 (not res!512606)) b!757863))

(assert (= (and b!757863 (not res!512600)) b!757860))

(assert (= (and b!757860 c!83002) b!757850))

(assert (= (and b!757860 (not c!83002)) b!757853))

(assert (= (and b!757860 res!512618) b!757847))

(assert (= (and b!757847 res!512610) b!757851))

(declare-fun m!705451 () Bool)

(assert (=> b!757863 m!705451))

(declare-fun m!705453 () Bool)

(assert (=> b!757863 m!705453))

(declare-fun m!705455 () Bool)

(assert (=> b!757846 m!705455))

(assert (=> b!757846 m!705455))

(declare-fun m!705457 () Bool)

(assert (=> b!757846 m!705457))

(declare-fun m!705459 () Bool)

(assert (=> start!65824 m!705459))

(declare-fun m!705461 () Bool)

(assert (=> start!65824 m!705461))

(assert (=> b!757848 m!705455))

(assert (=> b!757848 m!705455))

(declare-fun m!705463 () Bool)

(assert (=> b!757848 m!705463))

(declare-fun m!705465 () Bool)

(assert (=> b!757849 m!705465))

(assert (=> b!757841 m!705455))

(assert (=> b!757841 m!705455))

(assert (=> b!757841 m!705463))

(declare-fun m!705467 () Bool)

(assert (=> b!757847 m!705467))

(declare-fun m!705469 () Bool)

(assert (=> b!757847 m!705469))

(assert (=> b!757854 m!705455))

(assert (=> b!757854 m!705455))

(declare-fun m!705471 () Bool)

(assert (=> b!757854 m!705471))

(assert (=> b!757854 m!705471))

(assert (=> b!757854 m!705455))

(declare-fun m!705473 () Bool)

(assert (=> b!757854 m!705473))

(assert (=> b!757857 m!705455))

(assert (=> b!757857 m!705455))

(declare-fun m!705475 () Bool)

(assert (=> b!757857 m!705475))

(declare-fun m!705477 () Bool)

(assert (=> b!757861 m!705477))

(assert (=> b!757861 m!705451))

(declare-fun m!705479 () Bool)

(assert (=> b!757861 m!705479))

(assert (=> b!757861 m!705477))

(declare-fun m!705481 () Bool)

(assert (=> b!757861 m!705481))

(declare-fun m!705483 () Bool)

(assert (=> b!757861 m!705483))

(declare-fun m!705485 () Bool)

(assert (=> b!757844 m!705485))

(assert (=> b!757862 m!705455))

(assert (=> b!757862 m!705455))

(declare-fun m!705487 () Bool)

(assert (=> b!757862 m!705487))

(declare-fun m!705489 () Bool)

(assert (=> b!757862 m!705489))

(declare-fun m!705491 () Bool)

(assert (=> b!757862 m!705491))

(declare-fun m!705493 () Bool)

(assert (=> b!757858 m!705493))

(declare-fun m!705495 () Bool)

(assert (=> b!757855 m!705495))

(assert (=> b!757856 m!705455))

(assert (=> b!757856 m!705455))

(declare-fun m!705497 () Bool)

(assert (=> b!757856 m!705497))

(declare-fun m!705499 () Bool)

(assert (=> b!757852 m!705499))

(declare-fun m!705501 () Bool)

(assert (=> b!757842 m!705501))

(push 1)

