; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50826 () Bool)

(assert start!50826)

(declare-fun b!556169 () Bool)

(declare-fun res!348590 () Bool)

(declare-fun e!320457 () Bool)

(assert (=> b!556169 (=> (not res!348590) (not e!320457))))

(declare-datatypes ((array!35051 0))(
  ( (array!35052 (arr!16835 (Array (_ BitVec 32) (_ BitVec 64))) (size!17199 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35051)

(declare-datatypes ((List!10915 0))(
  ( (Nil!10912) (Cons!10911 (h!11896 (_ BitVec 64)) (t!17143 List!10915)) )
))
(declare-fun arrayNoDuplicates!0 (array!35051 (_ BitVec 32) List!10915) Bool)

(assert (=> b!556169 (= res!348590 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10912))))

(declare-fun b!556170 () Bool)

(declare-fun e!320459 () Bool)

(assert (=> b!556170 (= e!320459 e!320457)))

(declare-fun res!348581 () Bool)

(assert (=> b!556170 (=> (not res!348581) (not e!320457))))

(declare-datatypes ((SeekEntryResult!5284 0))(
  ( (MissingZero!5284 (index!23363 (_ BitVec 32))) (Found!5284 (index!23364 (_ BitVec 32))) (Intermediate!5284 (undefined!6096 Bool) (index!23365 (_ BitVec 32)) (x!52254 (_ BitVec 32))) (Undefined!5284) (MissingVacant!5284 (index!23366 (_ BitVec 32))) )
))
(declare-fun lt!252807 () SeekEntryResult!5284)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556170 (= res!348581 (or (= lt!252807 (MissingZero!5284 i!1132)) (= lt!252807 (MissingVacant!5284 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35051 (_ BitVec 32)) SeekEntryResult!5284)

(assert (=> b!556170 (= lt!252807 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!348585 () Bool)

(assert (=> start!50826 (=> (not res!348585) (not e!320459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50826 (= res!348585 (validMask!0 mask!3119))))

(assert (=> start!50826 e!320459))

(assert (=> start!50826 true))

(declare-fun array_inv!12631 (array!35051) Bool)

(assert (=> start!50826 (array_inv!12631 a!3118)))

(declare-fun b!556171 () Bool)

(declare-fun res!348583 () Bool)

(assert (=> b!556171 (=> (not res!348583) (not e!320457))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35051 (_ BitVec 32)) SeekEntryResult!5284)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556171 (= res!348583 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16835 a!3118) j!142) mask!3119) (select (arr!16835 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16835 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16835 a!3118) i!1132 k!1914) j!142) (array!35052 (store (arr!16835 a!3118) i!1132 k!1914) (size!17199 a!3118)) mask!3119)))))

(declare-fun b!556172 () Bool)

(declare-fun e!320458 () Bool)

(assert (=> b!556172 (= e!320458 (= (seekEntryOrOpen!0 (select (arr!16835 a!3118) j!142) a!3118 mask!3119) (Found!5284 j!142)))))

(declare-fun b!556173 () Bool)

(declare-fun res!348589 () Bool)

(assert (=> b!556173 (=> (not res!348589) (not e!320459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556173 (= res!348589 (validKeyInArray!0 (select (arr!16835 a!3118) j!142)))))

(declare-fun b!556174 () Bool)

(declare-fun res!348584 () Bool)

(assert (=> b!556174 (=> (not res!348584) (not e!320457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35051 (_ BitVec 32)) Bool)

(assert (=> b!556174 (= res!348584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556175 () Bool)

(declare-fun res!348587 () Bool)

(assert (=> b!556175 (=> (not res!348587) (not e!320459))))

(assert (=> b!556175 (= res!348587 (validKeyInArray!0 k!1914))))

(declare-fun b!556176 () Bool)

(declare-fun res!348586 () Bool)

(assert (=> b!556176 (=> (not res!348586) (not e!320459))))

(declare-fun arrayContainsKey!0 (array!35051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556176 (= res!348586 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556177 () Bool)

(declare-fun res!348588 () Bool)

(assert (=> b!556177 (=> (not res!348588) (not e!320459))))

(assert (=> b!556177 (= res!348588 (and (= (size!17199 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17199 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17199 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556178 () Bool)

(assert (=> b!556178 (= e!320457 (not true))))

(assert (=> b!556178 e!320458))

(declare-fun res!348582 () Bool)

(assert (=> b!556178 (=> (not res!348582) (not e!320458))))

(assert (=> b!556178 (= res!348582 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17342 0))(
  ( (Unit!17343) )
))
(declare-fun lt!252808 () Unit!17342)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35051 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17342)

(assert (=> b!556178 (= lt!252808 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50826 res!348585) b!556177))

(assert (= (and b!556177 res!348588) b!556173))

(assert (= (and b!556173 res!348589) b!556175))

(assert (= (and b!556175 res!348587) b!556176))

(assert (= (and b!556176 res!348586) b!556170))

(assert (= (and b!556170 res!348581) b!556174))

(assert (= (and b!556174 res!348584) b!556169))

(assert (= (and b!556169 res!348590) b!556171))

(assert (= (and b!556171 res!348583) b!556178))

(assert (= (and b!556178 res!348582) b!556172))

(declare-fun m!534105 () Bool)

(assert (=> b!556172 m!534105))

(assert (=> b!556172 m!534105))

(declare-fun m!534107 () Bool)

(assert (=> b!556172 m!534107))

(declare-fun m!534109 () Bool)

(assert (=> start!50826 m!534109))

(declare-fun m!534111 () Bool)

(assert (=> start!50826 m!534111))

(declare-fun m!534113 () Bool)

(assert (=> b!556176 m!534113))

(declare-fun m!534115 () Bool)

(assert (=> b!556170 m!534115))

(assert (=> b!556173 m!534105))

(assert (=> b!556173 m!534105))

(declare-fun m!534117 () Bool)

(assert (=> b!556173 m!534117))

(assert (=> b!556171 m!534105))

(declare-fun m!534119 () Bool)

(assert (=> b!556171 m!534119))

(assert (=> b!556171 m!534105))

(declare-fun m!534121 () Bool)

(assert (=> b!556171 m!534121))

(declare-fun m!534123 () Bool)

(assert (=> b!556171 m!534123))

(assert (=> b!556171 m!534121))

(declare-fun m!534125 () Bool)

(assert (=> b!556171 m!534125))

(assert (=> b!556171 m!534119))

(assert (=> b!556171 m!534105))

(declare-fun m!534127 () Bool)

(assert (=> b!556171 m!534127))

(declare-fun m!534129 () Bool)

(assert (=> b!556171 m!534129))

(assert (=> b!556171 m!534121))

(assert (=> b!556171 m!534123))

(declare-fun m!534131 () Bool)

(assert (=> b!556169 m!534131))

(declare-fun m!534133 () Bool)

(assert (=> b!556178 m!534133))

(declare-fun m!534135 () Bool)

(assert (=> b!556178 m!534135))

(declare-fun m!534137 () Bool)

(assert (=> b!556175 m!534137))

(declare-fun m!534139 () Bool)

(assert (=> b!556174 m!534139))

(push 1)

