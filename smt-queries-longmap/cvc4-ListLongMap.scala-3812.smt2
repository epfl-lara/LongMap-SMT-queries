; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52296 () Bool)

(assert start!52296)

(declare-fun b!570688 () Bool)

(declare-fun e!328223 () Bool)

(declare-fun e!328222 () Bool)

(assert (=> b!570688 (= e!328223 e!328222)))

(declare-fun res!360471 () Bool)

(assert (=> b!570688 (=> (not res!360471) (not e!328222))))

(declare-datatypes ((SeekEntryResult!5617 0))(
  ( (MissingZero!5617 (index!24695 (_ BitVec 32))) (Found!5617 (index!24696 (_ BitVec 32))) (Intermediate!5617 (undefined!6429 Bool) (index!24697 (_ BitVec 32)) (x!53565 (_ BitVec 32))) (Undefined!5617) (MissingVacant!5617 (index!24698 (_ BitVec 32))) )
))
(declare-fun lt!260173 () SeekEntryResult!5617)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!570688 (= res!360471 (or (= lt!260173 (MissingZero!5617 i!1132)) (= lt!260173 (MissingVacant!5617 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35756 0))(
  ( (array!35757 (arr!17168 (Array (_ BitVec 32) (_ BitVec 64))) (size!17532 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35756)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35756 (_ BitVec 32)) SeekEntryResult!5617)

(assert (=> b!570688 (= lt!260173 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!570689 () Bool)

(declare-fun e!328219 () Bool)

(assert (=> b!570689 (= e!328222 e!328219)))

(declare-fun res!360477 () Bool)

(assert (=> b!570689 (=> (not res!360477) (not e!328219))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!260171 () SeekEntryResult!5617)

(declare-fun lt!260168 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35756 (_ BitVec 32)) SeekEntryResult!5617)

(assert (=> b!570689 (= res!360477 (= lt!260171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260168 (select (store (arr!17168 a!3118) i!1132 k!1914) j!142) (array!35757 (store (arr!17168 a!3118) i!1132 k!1914) (size!17532 a!3118)) mask!3119)))))

(declare-fun lt!260172 () (_ BitVec 32))

(assert (=> b!570689 (= lt!260171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260172 (select (arr!17168 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570689 (= lt!260168 (toIndex!0 (select (store (arr!17168 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!570689 (= lt!260172 (toIndex!0 (select (arr!17168 a!3118) j!142) mask!3119))))

(declare-fun e!328220 () Bool)

(declare-fun lt!260169 () SeekEntryResult!5617)

(declare-fun b!570690 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35756 (_ BitVec 32)) SeekEntryResult!5617)

(assert (=> b!570690 (= e!328220 (= lt!260169 (seekKeyOrZeroReturnVacant!0 (x!53565 lt!260171) (index!24697 lt!260171) (index!24697 lt!260171) (select (arr!17168 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570691 () Bool)

(declare-fun res!360475 () Bool)

(assert (=> b!570691 (=> (not res!360475) (not e!328223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570691 (= res!360475 (validKeyInArray!0 (select (arr!17168 a!3118) j!142)))))

(declare-fun b!570692 () Bool)

(declare-fun res!360469 () Bool)

(assert (=> b!570692 (=> (not res!360469) (not e!328222))))

(declare-datatypes ((List!11248 0))(
  ( (Nil!11245) (Cons!11244 (h!12268 (_ BitVec 64)) (t!17476 List!11248)) )
))
(declare-fun arrayNoDuplicates!0 (array!35756 (_ BitVec 32) List!11248) Bool)

(assert (=> b!570692 (= res!360469 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11245))))

(declare-fun res!360473 () Bool)

(assert (=> start!52296 (=> (not res!360473) (not e!328223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52296 (= res!360473 (validMask!0 mask!3119))))

(assert (=> start!52296 e!328223))

(assert (=> start!52296 true))

(declare-fun array_inv!12964 (array!35756) Bool)

(assert (=> start!52296 (array_inv!12964 a!3118)))

(declare-fun b!570693 () Bool)

(declare-fun e!328221 () Bool)

(assert (=> b!570693 (= e!328221 e!328220)))

(declare-fun res!360470 () Bool)

(assert (=> b!570693 (=> res!360470 e!328220)))

(assert (=> b!570693 (= res!360470 (or (undefined!6429 lt!260171) (not (is-Intermediate!5617 lt!260171)) (= (select (arr!17168 a!3118) (index!24697 lt!260171)) (select (arr!17168 a!3118) j!142)) (= (select (arr!17168 a!3118) (index!24697 lt!260171)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570694 () Bool)

(declare-fun res!360476 () Bool)

(assert (=> b!570694 (=> (not res!360476) (not e!328223))))

(assert (=> b!570694 (= res!360476 (validKeyInArray!0 k!1914))))

(declare-fun b!570695 () Bool)

(declare-fun res!360472 () Bool)

(assert (=> b!570695 (=> (not res!360472) (not e!328223))))

(assert (=> b!570695 (= res!360472 (and (= (size!17532 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17532 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17532 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570696 () Bool)

(declare-fun res!360478 () Bool)

(assert (=> b!570696 (=> (not res!360478) (not e!328222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35756 (_ BitVec 32)) Bool)

(assert (=> b!570696 (= res!360478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570697 () Bool)

(declare-fun res!360474 () Bool)

(assert (=> b!570697 (=> (not res!360474) (not e!328223))))

(declare-fun arrayContainsKey!0 (array!35756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570697 (= res!360474 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570698 () Bool)

(assert (=> b!570698 (= e!328219 (not true))))

(assert (=> b!570698 e!328221))

(declare-fun res!360479 () Bool)

(assert (=> b!570698 (=> (not res!360479) (not e!328221))))

(assert (=> b!570698 (= res!360479 (= lt!260169 (Found!5617 j!142)))))

(assert (=> b!570698 (= lt!260169 (seekEntryOrOpen!0 (select (arr!17168 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!570698 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17936 0))(
  ( (Unit!17937) )
))
(declare-fun lt!260170 () Unit!17936)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35756 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17936)

(assert (=> b!570698 (= lt!260170 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52296 res!360473) b!570695))

(assert (= (and b!570695 res!360472) b!570691))

(assert (= (and b!570691 res!360475) b!570694))

(assert (= (and b!570694 res!360476) b!570697))

(assert (= (and b!570697 res!360474) b!570688))

(assert (= (and b!570688 res!360471) b!570696))

(assert (= (and b!570696 res!360478) b!570692))

(assert (= (and b!570692 res!360469) b!570689))

(assert (= (and b!570689 res!360477) b!570698))

(assert (= (and b!570698 res!360479) b!570693))

(assert (= (and b!570693 (not res!360470)) b!570690))

(declare-fun m!549569 () Bool)

(assert (=> b!570693 m!549569))

(declare-fun m!549571 () Bool)

(assert (=> b!570693 m!549571))

(declare-fun m!549573 () Bool)

(assert (=> b!570697 m!549573))

(assert (=> b!570690 m!549571))

(assert (=> b!570690 m!549571))

(declare-fun m!549575 () Bool)

(assert (=> b!570690 m!549575))

(assert (=> b!570698 m!549571))

(assert (=> b!570698 m!549571))

(declare-fun m!549577 () Bool)

(assert (=> b!570698 m!549577))

(declare-fun m!549579 () Bool)

(assert (=> b!570698 m!549579))

(declare-fun m!549581 () Bool)

(assert (=> b!570698 m!549581))

(assert (=> b!570689 m!549571))

(declare-fun m!549583 () Bool)

(assert (=> b!570689 m!549583))

(assert (=> b!570689 m!549571))

(declare-fun m!549585 () Bool)

(assert (=> b!570689 m!549585))

(declare-fun m!549587 () Bool)

(assert (=> b!570689 m!549587))

(assert (=> b!570689 m!549583))

(declare-fun m!549589 () Bool)

(assert (=> b!570689 m!549589))

(assert (=> b!570689 m!549583))

(declare-fun m!549591 () Bool)

(assert (=> b!570689 m!549591))

(assert (=> b!570689 m!549571))

(declare-fun m!549593 () Bool)

(assert (=> b!570689 m!549593))

(declare-fun m!549595 () Bool)

(assert (=> b!570692 m!549595))

(assert (=> b!570691 m!549571))

(assert (=> b!570691 m!549571))

(declare-fun m!549597 () Bool)

(assert (=> b!570691 m!549597))

(declare-fun m!549599 () Bool)

(assert (=> b!570688 m!549599))

(declare-fun m!549601 () Bool)

(assert (=> b!570694 m!549601))

(declare-fun m!549603 () Bool)

(assert (=> start!52296 m!549603))

(declare-fun m!549605 () Bool)

(assert (=> start!52296 m!549605))

(declare-fun m!549607 () Bool)

(assert (=> b!570696 m!549607))

(push 1)

