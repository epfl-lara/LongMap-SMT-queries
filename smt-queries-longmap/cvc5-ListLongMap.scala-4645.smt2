; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64642 () Bool)

(assert start!64642)

(declare-fun b!728092 () Bool)

(declare-fun res!488654 () Bool)

(declare-fun e!407596 () Bool)

(assert (=> b!728092 (=> (not res!488654) (not e!407596))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41091 0))(
  ( (array!41092 (arr!19665 (Array (_ BitVec 32) (_ BitVec 64))) (size!20086 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41091)

(assert (=> b!728092 (= res!488654 (and (= (size!20086 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20086 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20086 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728093 () Bool)

(declare-fun res!488651 () Bool)

(assert (=> b!728093 (=> (not res!488651) (not e!407596))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728093 (= res!488651 (validKeyInArray!0 k!2102))))

(declare-fun b!728094 () Bool)

(declare-fun e!407592 () Bool)

(assert (=> b!728094 (= e!407596 e!407592)))

(declare-fun res!488656 () Bool)

(assert (=> b!728094 (=> (not res!488656) (not e!407592))))

(declare-datatypes ((SeekEntryResult!7265 0))(
  ( (MissingZero!7265 (index!31428 (_ BitVec 32))) (Found!7265 (index!31429 (_ BitVec 32))) (Intermediate!7265 (undefined!8077 Bool) (index!31430 (_ BitVec 32)) (x!62423 (_ BitVec 32))) (Undefined!7265) (MissingVacant!7265 (index!31431 (_ BitVec 32))) )
))
(declare-fun lt!322489 () SeekEntryResult!7265)

(assert (=> b!728094 (= res!488656 (or (= lt!322489 (MissingZero!7265 i!1173)) (= lt!322489 (MissingVacant!7265 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41091 (_ BitVec 32)) SeekEntryResult!7265)

(assert (=> b!728094 (= lt!322489 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!728095 () Bool)

(declare-fun res!488647 () Bool)

(assert (=> b!728095 (=> (not res!488647) (not e!407592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41091 (_ BitVec 32)) Bool)

(assert (=> b!728095 (= res!488647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728096 () Bool)

(declare-fun lt!322493 () SeekEntryResult!7265)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!407589 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41091 (_ BitVec 32)) SeekEntryResult!7265)

(assert (=> b!728096 (= e!407589 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19665 a!3186) j!159) a!3186 mask!3328) lt!322493))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!407595 () Bool)

(declare-fun b!728098 () Bool)

(declare-fun lt!322491 () SeekEntryResult!7265)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41091 (_ BitVec 32)) SeekEntryResult!7265)

(assert (=> b!728098 (= e!407595 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19665 a!3186) j!159) a!3186 mask!3328) lt!322491))))

(declare-fun b!728099 () Bool)

(declare-fun res!488652 () Bool)

(assert (=> b!728099 (=> (not res!488652) (not e!407592))))

(assert (=> b!728099 (= res!488652 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20086 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20086 a!3186))))))

(declare-fun b!728100 () Bool)

(declare-fun e!407597 () Bool)

(declare-fun e!407591 () Bool)

(assert (=> b!728100 (= e!407597 e!407591)))

(declare-fun res!488658 () Bool)

(assert (=> b!728100 (=> (not res!488658) (not e!407591))))

(declare-fun lt!322494 () SeekEntryResult!7265)

(declare-fun lt!322490 () SeekEntryResult!7265)

(assert (=> b!728100 (= res!488658 (= lt!322494 lt!322490))))

(declare-fun lt!322496 () (_ BitVec 64))

(declare-fun lt!322495 () array!41091)

(assert (=> b!728100 (= lt!322490 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322496 lt!322495 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728100 (= lt!322494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322496 mask!3328) lt!322496 lt!322495 mask!3328))))

(assert (=> b!728100 (= lt!322496 (select (store (arr!19665 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!728100 (= lt!322495 (array!41092 (store (arr!19665 a!3186) i!1173 k!2102) (size!20086 a!3186)))))

(declare-fun b!728101 () Bool)

(declare-fun res!488659 () Bool)

(assert (=> b!728101 (=> (not res!488659) (not e!407596))))

(declare-fun arrayContainsKey!0 (array!41091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728101 (= res!488659 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728102 () Bool)

(declare-fun res!488649 () Bool)

(assert (=> b!728102 (=> (not res!488649) (not e!407592))))

(declare-datatypes ((List!13667 0))(
  ( (Nil!13664) (Cons!13663 (h!14723 (_ BitVec 64)) (t!19982 List!13667)) )
))
(declare-fun arrayNoDuplicates!0 (array!41091 (_ BitVec 32) List!13667) Bool)

(assert (=> b!728102 (= res!488649 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13664))))

(declare-fun b!728103 () Bool)

(declare-fun res!488648 () Bool)

(assert (=> b!728103 (=> (not res!488648) (not e!407596))))

(assert (=> b!728103 (= res!488648 (validKeyInArray!0 (select (arr!19665 a!3186) j!159)))))

(declare-fun b!728104 () Bool)

(declare-fun e!407594 () Bool)

(assert (=> b!728104 (= e!407591 (not e!407594))))

(declare-fun res!488646 () Bool)

(assert (=> b!728104 (=> res!488646 e!407594)))

(assert (=> b!728104 (= res!488646 (or (not (is-Intermediate!7265 lt!322490)) (bvsge x!1131 (x!62423 lt!322490))))))

(declare-fun e!407590 () Bool)

(assert (=> b!728104 e!407590))

(declare-fun res!488655 () Bool)

(assert (=> b!728104 (=> (not res!488655) (not e!407590))))

(assert (=> b!728104 (= res!488655 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24848 0))(
  ( (Unit!24849) )
))
(declare-fun lt!322488 () Unit!24848)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41091 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24848)

(assert (=> b!728104 (= lt!322488 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728105 () Bool)

(declare-fun res!488645 () Bool)

(assert (=> b!728105 (=> (not res!488645) (not e!407597))))

(assert (=> b!728105 (= res!488645 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19665 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728106 () Bool)

(declare-fun res!488657 () Bool)

(assert (=> b!728106 (=> (not res!488657) (not e!407597))))

(assert (=> b!728106 (= res!488657 e!407589)))

(declare-fun c!80098 () Bool)

(assert (=> b!728106 (= c!80098 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728107 () Bool)

(assert (=> b!728107 (= e!407590 e!407595)))

(declare-fun res!488653 () Bool)

(assert (=> b!728107 (=> (not res!488653) (not e!407595))))

(assert (=> b!728107 (= res!488653 (= (seekEntryOrOpen!0 (select (arr!19665 a!3186) j!159) a!3186 mask!3328) lt!322491))))

(assert (=> b!728107 (= lt!322491 (Found!7265 j!159))))

(declare-fun b!728108 () Bool)

(assert (=> b!728108 (= e!407592 e!407597)))

(declare-fun res!488650 () Bool)

(assert (=> b!728108 (=> (not res!488650) (not e!407597))))

(assert (=> b!728108 (= res!488650 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19665 a!3186) j!159) mask!3328) (select (arr!19665 a!3186) j!159) a!3186 mask!3328) lt!322493))))

(assert (=> b!728108 (= lt!322493 (Intermediate!7265 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728109 () Bool)

(assert (=> b!728109 (= e!407594 true)))

(declare-fun lt!322492 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728109 (= lt!322492 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!488660 () Bool)

(assert (=> start!64642 (=> (not res!488660) (not e!407596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64642 (= res!488660 (validMask!0 mask!3328))))

(assert (=> start!64642 e!407596))

(assert (=> start!64642 true))

(declare-fun array_inv!15461 (array!41091) Bool)

(assert (=> start!64642 (array_inv!15461 a!3186)))

(declare-fun b!728097 () Bool)

(assert (=> b!728097 (= e!407589 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19665 a!3186) j!159) a!3186 mask!3328) (Found!7265 j!159)))))

(assert (= (and start!64642 res!488660) b!728092))

(assert (= (and b!728092 res!488654) b!728103))

(assert (= (and b!728103 res!488648) b!728093))

(assert (= (and b!728093 res!488651) b!728101))

(assert (= (and b!728101 res!488659) b!728094))

(assert (= (and b!728094 res!488656) b!728095))

(assert (= (and b!728095 res!488647) b!728102))

(assert (= (and b!728102 res!488649) b!728099))

(assert (= (and b!728099 res!488652) b!728108))

(assert (= (and b!728108 res!488650) b!728105))

(assert (= (and b!728105 res!488645) b!728106))

(assert (= (and b!728106 c!80098) b!728096))

(assert (= (and b!728106 (not c!80098)) b!728097))

(assert (= (and b!728106 res!488657) b!728100))

(assert (= (and b!728100 res!488658) b!728104))

(assert (= (and b!728104 res!488655) b!728107))

(assert (= (and b!728107 res!488653) b!728098))

(assert (= (and b!728104 (not res!488646)) b!728109))

(declare-fun m!681883 () Bool)

(assert (=> b!728102 m!681883))

(declare-fun m!681885 () Bool)

(assert (=> start!64642 m!681885))

(declare-fun m!681887 () Bool)

(assert (=> start!64642 m!681887))

(declare-fun m!681889 () Bool)

(assert (=> b!728101 m!681889))

(declare-fun m!681891 () Bool)

(assert (=> b!728109 m!681891))

(declare-fun m!681893 () Bool)

(assert (=> b!728094 m!681893))

(declare-fun m!681895 () Bool)

(assert (=> b!728095 m!681895))

(declare-fun m!681897 () Bool)

(assert (=> b!728096 m!681897))

(assert (=> b!728096 m!681897))

(declare-fun m!681899 () Bool)

(assert (=> b!728096 m!681899))

(assert (=> b!728103 m!681897))

(assert (=> b!728103 m!681897))

(declare-fun m!681901 () Bool)

(assert (=> b!728103 m!681901))

(declare-fun m!681903 () Bool)

(assert (=> b!728105 m!681903))

(assert (=> b!728107 m!681897))

(assert (=> b!728107 m!681897))

(declare-fun m!681905 () Bool)

(assert (=> b!728107 m!681905))

(declare-fun m!681907 () Bool)

(assert (=> b!728093 m!681907))

(assert (=> b!728108 m!681897))

(assert (=> b!728108 m!681897))

(declare-fun m!681909 () Bool)

(assert (=> b!728108 m!681909))

(assert (=> b!728108 m!681909))

(assert (=> b!728108 m!681897))

(declare-fun m!681911 () Bool)

(assert (=> b!728108 m!681911))

(assert (=> b!728098 m!681897))

(assert (=> b!728098 m!681897))

(declare-fun m!681913 () Bool)

(assert (=> b!728098 m!681913))

(assert (=> b!728097 m!681897))

(assert (=> b!728097 m!681897))

(declare-fun m!681915 () Bool)

(assert (=> b!728097 m!681915))

(declare-fun m!681917 () Bool)

(assert (=> b!728100 m!681917))

(declare-fun m!681919 () Bool)

(assert (=> b!728100 m!681919))

(declare-fun m!681921 () Bool)

(assert (=> b!728100 m!681921))

(declare-fun m!681923 () Bool)

(assert (=> b!728100 m!681923))

(assert (=> b!728100 m!681923))

(declare-fun m!681925 () Bool)

(assert (=> b!728100 m!681925))

(declare-fun m!681927 () Bool)

(assert (=> b!728104 m!681927))

(declare-fun m!681929 () Bool)

(assert (=> b!728104 m!681929))

(push 1)

