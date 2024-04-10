; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50576 () Bool)

(assert start!50576)

(declare-fun b!552545 () Bool)

(declare-fun e!318850 () Bool)

(assert (=> b!552545 (= e!318850 (not true))))

(declare-fun e!318851 () Bool)

(assert (=> b!552545 e!318851))

(declare-fun res!344966 () Bool)

(assert (=> b!552545 (=> (not res!344966) (not e!318851))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!34801 0))(
  ( (array!34802 (arr!16710 (Array (_ BitVec 32) (_ BitVec 64))) (size!17074 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34801)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34801 (_ BitVec 32)) Bool)

(assert (=> b!552545 (= res!344966 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17092 0))(
  ( (Unit!17093) )
))
(declare-fun lt!251211 () Unit!17092)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34801 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17092)

(assert (=> b!552545 (= lt!251211 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552546 () Bool)

(declare-fun res!344960 () Bool)

(assert (=> b!552546 (=> (not res!344960) (not e!318850))))

(declare-datatypes ((List!10790 0))(
  ( (Nil!10787) (Cons!10786 (h!11771 (_ BitVec 64)) (t!17018 List!10790)) )
))
(declare-fun arrayNoDuplicates!0 (array!34801 (_ BitVec 32) List!10790) Bool)

(assert (=> b!552546 (= res!344960 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10787))))

(declare-fun res!344964 () Bool)

(declare-fun e!318849 () Bool)

(assert (=> start!50576 (=> (not res!344964) (not e!318849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50576 (= res!344964 (validMask!0 mask!3119))))

(assert (=> start!50576 e!318849))

(assert (=> start!50576 true))

(declare-fun array_inv!12506 (array!34801) Bool)

(assert (=> start!50576 (array_inv!12506 a!3118)))

(declare-fun b!552547 () Bool)

(assert (=> b!552547 (= e!318849 e!318850)))

(declare-fun res!344958 () Bool)

(assert (=> b!552547 (=> (not res!344958) (not e!318850))))

(declare-datatypes ((SeekEntryResult!5159 0))(
  ( (MissingZero!5159 (index!22863 (_ BitVec 32))) (Found!5159 (index!22864 (_ BitVec 32))) (Intermediate!5159 (undefined!5971 Bool) (index!22865 (_ BitVec 32)) (x!51801 (_ BitVec 32))) (Undefined!5159) (MissingVacant!5159 (index!22866 (_ BitVec 32))) )
))
(declare-fun lt!251212 () SeekEntryResult!5159)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552547 (= res!344958 (or (= lt!251212 (MissingZero!5159 i!1132)) (= lt!251212 (MissingVacant!5159 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34801 (_ BitVec 32)) SeekEntryResult!5159)

(assert (=> b!552547 (= lt!251212 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!552548 () Bool)

(declare-fun res!344959 () Bool)

(assert (=> b!552548 (=> (not res!344959) (not e!318850))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34801 (_ BitVec 32)) SeekEntryResult!5159)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552548 (= res!344959 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16710 a!3118) j!142) mask!3119) (select (arr!16710 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16710 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16710 a!3118) i!1132 k!1914) j!142) (array!34802 (store (arr!16710 a!3118) i!1132 k!1914) (size!17074 a!3118)) mask!3119)))))

(declare-fun b!552549 () Bool)

(declare-fun res!344962 () Bool)

(assert (=> b!552549 (=> (not res!344962) (not e!318849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552549 (= res!344962 (validKeyInArray!0 (select (arr!16710 a!3118) j!142)))))

(declare-fun b!552550 () Bool)

(declare-fun res!344961 () Bool)

(assert (=> b!552550 (=> (not res!344961) (not e!318849))))

(assert (=> b!552550 (= res!344961 (validKeyInArray!0 k!1914))))

(declare-fun b!552551 () Bool)

(declare-fun res!344965 () Bool)

(assert (=> b!552551 (=> (not res!344965) (not e!318850))))

(assert (=> b!552551 (= res!344965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552552 () Bool)

(assert (=> b!552552 (= e!318851 (= (seekEntryOrOpen!0 (select (arr!16710 a!3118) j!142) a!3118 mask!3119) (Found!5159 j!142)))))

(declare-fun b!552553 () Bool)

(declare-fun res!344957 () Bool)

(assert (=> b!552553 (=> (not res!344957) (not e!318849))))

(declare-fun arrayContainsKey!0 (array!34801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552553 (= res!344957 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552554 () Bool)

(declare-fun res!344963 () Bool)

(assert (=> b!552554 (=> (not res!344963) (not e!318849))))

(assert (=> b!552554 (= res!344963 (and (= (size!17074 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17074 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17074 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50576 res!344964) b!552554))

(assert (= (and b!552554 res!344963) b!552549))

(assert (= (and b!552549 res!344962) b!552550))

(assert (= (and b!552550 res!344961) b!552553))

(assert (= (and b!552553 res!344957) b!552547))

(assert (= (and b!552547 res!344958) b!552551))

(assert (= (and b!552551 res!344965) b!552546))

(assert (= (and b!552546 res!344960) b!552548))

(assert (= (and b!552548 res!344959) b!552545))

(assert (= (and b!552545 res!344966) b!552552))

(declare-fun m!529455 () Bool)

(assert (=> b!552550 m!529455))

(declare-fun m!529457 () Bool)

(assert (=> b!552552 m!529457))

(assert (=> b!552552 m!529457))

(declare-fun m!529459 () Bool)

(assert (=> b!552552 m!529459))

(declare-fun m!529461 () Bool)

(assert (=> start!50576 m!529461))

(declare-fun m!529463 () Bool)

(assert (=> start!50576 m!529463))

(declare-fun m!529465 () Bool)

(assert (=> b!552545 m!529465))

(declare-fun m!529467 () Bool)

(assert (=> b!552545 m!529467))

(declare-fun m!529469 () Bool)

(assert (=> b!552547 m!529469))

(assert (=> b!552549 m!529457))

(assert (=> b!552549 m!529457))

(declare-fun m!529471 () Bool)

(assert (=> b!552549 m!529471))

(declare-fun m!529473 () Bool)

(assert (=> b!552551 m!529473))

(assert (=> b!552548 m!529457))

(declare-fun m!529475 () Bool)

(assert (=> b!552548 m!529475))

(assert (=> b!552548 m!529457))

(declare-fun m!529477 () Bool)

(assert (=> b!552548 m!529477))

(declare-fun m!529479 () Bool)

(assert (=> b!552548 m!529479))

(assert (=> b!552548 m!529477))

(declare-fun m!529481 () Bool)

(assert (=> b!552548 m!529481))

(assert (=> b!552548 m!529475))

(assert (=> b!552548 m!529457))

(declare-fun m!529483 () Bool)

(assert (=> b!552548 m!529483))

(declare-fun m!529485 () Bool)

(assert (=> b!552548 m!529485))

(assert (=> b!552548 m!529477))

(assert (=> b!552548 m!529479))

(declare-fun m!529487 () Bool)

(assert (=> b!552553 m!529487))

(declare-fun m!529489 () Bool)

(assert (=> b!552546 m!529489))

(push 1)

