; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52052 () Bool)

(assert start!52052)

(declare-fun b!568373 () Bool)

(declare-fun res!358576 () Bool)

(declare-fun e!327053 () Bool)

(assert (=> b!568373 (=> (not res!358576) (not e!327053))))

(declare-datatypes ((array!35632 0))(
  ( (array!35633 (arr!17109 (Array (_ BitVec 32) (_ BitVec 64))) (size!17473 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35632)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568373 (= res!358576 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568374 () Bool)

(declare-fun res!358574 () Bool)

(assert (=> b!568374 (=> (not res!358574) (not e!327053))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!568374 (= res!358574 (and (= (size!17473 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17473 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17473 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568375 () Bool)

(declare-fun e!327051 () Bool)

(assert (=> b!568375 (= e!327053 e!327051)))

(declare-fun res!358577 () Bool)

(assert (=> b!568375 (=> (not res!358577) (not e!327051))))

(declare-datatypes ((SeekEntryResult!5558 0))(
  ( (MissingZero!5558 (index!24459 (_ BitVec 32))) (Found!5558 (index!24460 (_ BitVec 32))) (Intermediate!5558 (undefined!6370 Bool) (index!24461 (_ BitVec 32)) (x!53339 (_ BitVec 32))) (Undefined!5558) (MissingVacant!5558 (index!24462 (_ BitVec 32))) )
))
(declare-fun lt!258930 () SeekEntryResult!5558)

(assert (=> b!568375 (= res!358577 (or (= lt!258930 (MissingZero!5558 i!1132)) (= lt!258930 (MissingVacant!5558 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35632 (_ BitVec 32)) SeekEntryResult!5558)

(assert (=> b!568375 (= lt!258930 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!568376 () Bool)

(assert (=> b!568376 (= e!327051 (not true))))

(declare-fun e!327052 () Bool)

(assert (=> b!568376 e!327052))

(declare-fun res!358575 () Bool)

(assert (=> b!568376 (=> (not res!358575) (not e!327052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35632 (_ BitVec 32)) Bool)

(assert (=> b!568376 (= res!358575 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17818 0))(
  ( (Unit!17819) )
))
(declare-fun lt!258931 () Unit!17818)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17818)

(assert (=> b!568376 (= lt!258931 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!358582 () Bool)

(assert (=> start!52052 (=> (not res!358582) (not e!327053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52052 (= res!358582 (validMask!0 mask!3119))))

(assert (=> start!52052 e!327053))

(assert (=> start!52052 true))

(declare-fun array_inv!12905 (array!35632) Bool)

(assert (=> start!52052 (array_inv!12905 a!3118)))

(declare-fun b!568377 () Bool)

(declare-fun res!358583 () Bool)

(assert (=> b!568377 (=> (not res!358583) (not e!327051))))

(assert (=> b!568377 (= res!358583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568378 () Bool)

(assert (=> b!568378 (= e!327052 (= (seekEntryOrOpen!0 (select (arr!17109 a!3118) j!142) a!3118 mask!3119) (Found!5558 j!142)))))

(declare-fun b!568379 () Bool)

(declare-fun res!358580 () Bool)

(assert (=> b!568379 (=> (not res!358580) (not e!327053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568379 (= res!358580 (validKeyInArray!0 (select (arr!17109 a!3118) j!142)))))

(declare-fun b!568380 () Bool)

(declare-fun res!358579 () Bool)

(assert (=> b!568380 (=> (not res!358579) (not e!327051))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35632 (_ BitVec 32)) SeekEntryResult!5558)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568380 (= res!358579 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17109 a!3118) j!142) mask!3119) (select (arr!17109 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17109 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17109 a!3118) i!1132 k!1914) j!142) (array!35633 (store (arr!17109 a!3118) i!1132 k!1914) (size!17473 a!3118)) mask!3119)))))

(declare-fun b!568381 () Bool)

(declare-fun res!358581 () Bool)

(assert (=> b!568381 (=> (not res!358581) (not e!327053))))

(assert (=> b!568381 (= res!358581 (validKeyInArray!0 k!1914))))

(declare-fun b!568382 () Bool)

(declare-fun res!358578 () Bool)

(assert (=> b!568382 (=> (not res!358578) (not e!327051))))

(declare-datatypes ((List!11189 0))(
  ( (Nil!11186) (Cons!11185 (h!12203 (_ BitVec 64)) (t!17417 List!11189)) )
))
(declare-fun arrayNoDuplicates!0 (array!35632 (_ BitVec 32) List!11189) Bool)

(assert (=> b!568382 (= res!358578 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11186))))

(assert (= (and start!52052 res!358582) b!568374))

(assert (= (and b!568374 res!358574) b!568379))

(assert (= (and b!568379 res!358580) b!568381))

(assert (= (and b!568381 res!358581) b!568373))

(assert (= (and b!568373 res!358576) b!568375))

(assert (= (and b!568375 res!358577) b!568377))

(assert (= (and b!568377 res!358583) b!568382))

(assert (= (and b!568382 res!358578) b!568380))

(assert (= (and b!568380 res!358579) b!568376))

(assert (= (and b!568376 res!358575) b!568378))

(declare-fun m!546891 () Bool)

(assert (=> b!568376 m!546891))

(declare-fun m!546893 () Bool)

(assert (=> b!568376 m!546893))

(declare-fun m!546895 () Bool)

(assert (=> b!568375 m!546895))

(declare-fun m!546897 () Bool)

(assert (=> b!568381 m!546897))

(declare-fun m!546899 () Bool)

(assert (=> b!568377 m!546899))

(declare-fun m!546901 () Bool)

(assert (=> b!568382 m!546901))

(declare-fun m!546903 () Bool)

(assert (=> b!568380 m!546903))

(declare-fun m!546905 () Bool)

(assert (=> b!568380 m!546905))

(assert (=> b!568380 m!546903))

(declare-fun m!546907 () Bool)

(assert (=> b!568380 m!546907))

(declare-fun m!546909 () Bool)

(assert (=> b!568380 m!546909))

(assert (=> b!568380 m!546907))

(declare-fun m!546911 () Bool)

(assert (=> b!568380 m!546911))

(assert (=> b!568380 m!546905))

(assert (=> b!568380 m!546903))

(declare-fun m!546913 () Bool)

(assert (=> b!568380 m!546913))

(declare-fun m!546915 () Bool)

(assert (=> b!568380 m!546915))

(assert (=> b!568380 m!546907))

(assert (=> b!568380 m!546909))

(assert (=> b!568379 m!546903))

(assert (=> b!568379 m!546903))

(declare-fun m!546917 () Bool)

(assert (=> b!568379 m!546917))

(assert (=> b!568378 m!546903))

(assert (=> b!568378 m!546903))

(declare-fun m!546919 () Bool)

(assert (=> b!568378 m!546919))

(declare-fun m!546921 () Bool)

(assert (=> b!568373 m!546921))

(declare-fun m!546923 () Bool)

(assert (=> start!52052 m!546923))

(declare-fun m!546925 () Bool)

(assert (=> start!52052 m!546925))

(push 1)

