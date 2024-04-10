; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52394 () Bool)

(assert start!52394)

(declare-fun b!571646 () Bool)

(declare-fun e!328791 () Bool)

(declare-fun e!328789 () Bool)

(assert (=> b!571646 (= e!328791 e!328789)))

(declare-fun res!361156 () Bool)

(assert (=> b!571646 (=> res!361156 e!328789)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!260693 () (_ BitVec 64))

(declare-datatypes ((array!35791 0))(
  ( (array!35792 (arr!17184 (Array (_ BitVec 32) (_ BitVec 64))) (size!17548 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35791)

(assert (=> b!571646 (= res!361156 (or (= lt!260693 (select (arr!17184 a!3118) j!142)) (= lt!260693 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5633 0))(
  ( (MissingZero!5633 (index!24759 (_ BitVec 32))) (Found!5633 (index!24760 (_ BitVec 32))) (Intermediate!5633 (undefined!6445 Bool) (index!24761 (_ BitVec 32)) (x!53638 (_ BitVec 32))) (Undefined!5633) (MissingVacant!5633 (index!24762 (_ BitVec 32))) )
))
(declare-fun lt!260687 () SeekEntryResult!5633)

(assert (=> b!571646 (= lt!260693 (select (arr!17184 a!3118) (index!24761 lt!260687)))))

(declare-fun e!328788 () Bool)

(declare-fun lt!260694 () array!35791)

(declare-fun lt!260692 () (_ BitVec 64))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!571647 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35791 (_ BitVec 32)) SeekEntryResult!5633)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35791 (_ BitVec 32)) SeekEntryResult!5633)

(assert (=> b!571647 (= e!328788 (= (seekEntryOrOpen!0 lt!260692 lt!260694 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53638 lt!260687) (index!24761 lt!260687) (index!24761 lt!260687) lt!260692 lt!260694 mask!3119)))))

(declare-fun b!571648 () Bool)

(declare-fun res!361165 () Bool)

(declare-fun e!328787 () Bool)

(assert (=> b!571648 (=> (not res!361165) (not e!328787))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571648 (= res!361165 (validKeyInArray!0 k!1914))))

(declare-fun b!571649 () Bool)

(declare-fun e!328790 () Bool)

(assert (=> b!571649 (= e!328790 e!328791)))

(declare-fun res!361162 () Bool)

(assert (=> b!571649 (=> res!361162 e!328791)))

(assert (=> b!571649 (= res!361162 (or (undefined!6445 lt!260687) (not (is-Intermediate!5633 lt!260687))))))

(declare-fun b!571650 () Bool)

(declare-fun res!361161 () Bool)

(assert (=> b!571650 (=> (not res!361161) (not e!328787))))

(assert (=> b!571650 (= res!361161 (validKeyInArray!0 (select (arr!17184 a!3118) j!142)))))

(declare-fun b!571651 () Bool)

(declare-fun res!361159 () Bool)

(assert (=> b!571651 (=> (not res!361159) (not e!328787))))

(declare-fun arrayContainsKey!0 (array!35791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571651 (= res!361159 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571652 () Bool)

(assert (=> b!571652 (= e!328789 e!328788)))

(declare-fun res!361154 () Bool)

(assert (=> b!571652 (=> (not res!361154) (not e!328788))))

(declare-fun lt!260690 () SeekEntryResult!5633)

(assert (=> b!571652 (= res!361154 (= lt!260690 (seekKeyOrZeroReturnVacant!0 (x!53638 lt!260687) (index!24761 lt!260687) (index!24761 lt!260687) (select (arr!17184 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571654 () Bool)

(declare-fun res!361160 () Bool)

(declare-fun e!328793 () Bool)

(assert (=> b!571654 (=> (not res!361160) (not e!328793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35791 (_ BitVec 32)) Bool)

(assert (=> b!571654 (= res!361160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571655 () Bool)

(declare-fun e!328794 () Bool)

(assert (=> b!571655 (= e!328793 e!328794)))

(declare-fun res!361164 () Bool)

(assert (=> b!571655 (=> (not res!361164) (not e!328794))))

(declare-fun lt!260688 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35791 (_ BitVec 32)) SeekEntryResult!5633)

(assert (=> b!571655 (= res!361164 (= lt!260687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260688 lt!260692 lt!260694 mask!3119)))))

(declare-fun lt!260691 () (_ BitVec 32))

(assert (=> b!571655 (= lt!260687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260691 (select (arr!17184 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571655 (= lt!260688 (toIndex!0 lt!260692 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571655 (= lt!260692 (select (store (arr!17184 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!571655 (= lt!260691 (toIndex!0 (select (arr!17184 a!3118) j!142) mask!3119))))

(assert (=> b!571655 (= lt!260694 (array!35792 (store (arr!17184 a!3118) i!1132 k!1914) (size!17548 a!3118)))))

(declare-fun b!571656 () Bool)

(assert (=> b!571656 (= e!328794 (not true))))

(assert (=> b!571656 e!328790))

(declare-fun res!361155 () Bool)

(assert (=> b!571656 (=> (not res!361155) (not e!328790))))

(assert (=> b!571656 (= res!361155 (= lt!260690 (Found!5633 j!142)))))

(assert (=> b!571656 (= lt!260690 (seekEntryOrOpen!0 (select (arr!17184 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!571656 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17968 0))(
  ( (Unit!17969) )
))
(declare-fun lt!260689 () Unit!17968)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17968)

(assert (=> b!571656 (= lt!260689 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571657 () Bool)

(assert (=> b!571657 (= e!328787 e!328793)))

(declare-fun res!361166 () Bool)

(assert (=> b!571657 (=> (not res!361166) (not e!328793))))

(declare-fun lt!260695 () SeekEntryResult!5633)

(assert (=> b!571657 (= res!361166 (or (= lt!260695 (MissingZero!5633 i!1132)) (= lt!260695 (MissingVacant!5633 i!1132))))))

(assert (=> b!571657 (= lt!260695 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!571658 () Bool)

(declare-fun res!361157 () Bool)

(assert (=> b!571658 (=> (not res!361157) (not e!328787))))

(assert (=> b!571658 (= res!361157 (and (= (size!17548 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17548 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17548 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!361163 () Bool)

(assert (=> start!52394 (=> (not res!361163) (not e!328787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52394 (= res!361163 (validMask!0 mask!3119))))

(assert (=> start!52394 e!328787))

(assert (=> start!52394 true))

(declare-fun array_inv!12980 (array!35791) Bool)

(assert (=> start!52394 (array_inv!12980 a!3118)))

(declare-fun b!571653 () Bool)

(declare-fun res!361158 () Bool)

(assert (=> b!571653 (=> (not res!361158) (not e!328793))))

(declare-datatypes ((List!11264 0))(
  ( (Nil!11261) (Cons!11260 (h!12287 (_ BitVec 64)) (t!17492 List!11264)) )
))
(declare-fun arrayNoDuplicates!0 (array!35791 (_ BitVec 32) List!11264) Bool)

(assert (=> b!571653 (= res!361158 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11261))))

(assert (= (and start!52394 res!361163) b!571658))

(assert (= (and b!571658 res!361157) b!571650))

(assert (= (and b!571650 res!361161) b!571648))

(assert (= (and b!571648 res!361165) b!571651))

(assert (= (and b!571651 res!361159) b!571657))

(assert (= (and b!571657 res!361166) b!571654))

(assert (= (and b!571654 res!361160) b!571653))

(assert (= (and b!571653 res!361158) b!571655))

(assert (= (and b!571655 res!361164) b!571656))

(assert (= (and b!571656 res!361155) b!571649))

(assert (= (and b!571649 (not res!361162)) b!571646))

(assert (= (and b!571646 (not res!361156)) b!571652))

(assert (= (and b!571652 res!361154) b!571647))

(declare-fun m!550521 () Bool)

(assert (=> b!571646 m!550521))

(declare-fun m!550523 () Bool)

(assert (=> b!571646 m!550523))

(declare-fun m!550525 () Bool)

(assert (=> b!571653 m!550525))

(assert (=> b!571652 m!550521))

(assert (=> b!571652 m!550521))

(declare-fun m!550527 () Bool)

(assert (=> b!571652 m!550527))

(declare-fun m!550529 () Bool)

(assert (=> b!571657 m!550529))

(declare-fun m!550531 () Bool)

(assert (=> start!52394 m!550531))

(declare-fun m!550533 () Bool)

(assert (=> start!52394 m!550533))

(declare-fun m!550535 () Bool)

(assert (=> b!571651 m!550535))

(assert (=> b!571650 m!550521))

(assert (=> b!571650 m!550521))

(declare-fun m!550537 () Bool)

(assert (=> b!571650 m!550537))

(declare-fun m!550539 () Bool)

(assert (=> b!571648 m!550539))

(assert (=> b!571655 m!550521))

(declare-fun m!550541 () Bool)

(assert (=> b!571655 m!550541))

(assert (=> b!571655 m!550521))

(declare-fun m!550543 () Bool)

(assert (=> b!571655 m!550543))

(declare-fun m!550545 () Bool)

(assert (=> b!571655 m!550545))

(declare-fun m!550547 () Bool)

(assert (=> b!571655 m!550547))

(declare-fun m!550549 () Bool)

(assert (=> b!571655 m!550549))

(assert (=> b!571655 m!550521))

(declare-fun m!550551 () Bool)

(assert (=> b!571655 m!550551))

(declare-fun m!550553 () Bool)

(assert (=> b!571647 m!550553))

(declare-fun m!550555 () Bool)

(assert (=> b!571647 m!550555))

(declare-fun m!550557 () Bool)

(assert (=> b!571654 m!550557))

(assert (=> b!571656 m!550521))

(assert (=> b!571656 m!550521))

(declare-fun m!550559 () Bool)

(assert (=> b!571656 m!550559))

(declare-fun m!550561 () Bool)

(assert (=> b!571656 m!550561))

(declare-fun m!550563 () Bool)

(assert (=> b!571656 m!550563))

(push 1)

