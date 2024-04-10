; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50328 () Bool)

(assert start!50328)

(declare-fun b!550652 () Bool)

(declare-fun res!343613 () Bool)

(declare-fun e!317866 () Bool)

(assert (=> b!550652 (=> (not res!343613) (not e!317866))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550652 (= res!343613 (validKeyInArray!0 k!1914))))

(declare-fun b!550653 () Bool)

(declare-fun res!343619 () Bool)

(assert (=> b!550653 (=> (not res!343619) (not e!317866))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34724 0))(
  ( (array!34725 (arr!16676 (Array (_ BitVec 32) (_ BitVec 64))) (size!17040 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34724)

(assert (=> b!550653 (= res!343619 (and (= (size!17040 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17040 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17040 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550654 () Bool)

(declare-fun res!343621 () Bool)

(assert (=> b!550654 (=> (not res!343621) (not e!317866))))

(declare-fun arrayContainsKey!0 (array!34724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550654 (= res!343621 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550655 () Bool)

(declare-fun res!343615 () Bool)

(assert (=> b!550655 (=> (not res!343615) (not e!317866))))

(assert (=> b!550655 (= res!343615 (validKeyInArray!0 (select (arr!16676 a!3118) j!142)))))

(declare-fun b!550656 () Bool)

(declare-fun e!317868 () Bool)

(assert (=> b!550656 (= e!317866 e!317868)))

(declare-fun res!343614 () Bool)

(assert (=> b!550656 (=> (not res!343614) (not e!317868))))

(declare-datatypes ((SeekEntryResult!5125 0))(
  ( (MissingZero!5125 (index!22727 (_ BitVec 32))) (Found!5125 (index!22728 (_ BitVec 32))) (Intermediate!5125 (undefined!5937 Bool) (index!22729 (_ BitVec 32)) (x!51653 (_ BitVec 32))) (Undefined!5125) (MissingVacant!5125 (index!22730 (_ BitVec 32))) )
))
(declare-fun lt!250593 () SeekEntryResult!5125)

(assert (=> b!550656 (= res!343614 (or (= lt!250593 (MissingZero!5125 i!1132)) (= lt!250593 (MissingVacant!5125 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34724 (_ BitVec 32)) SeekEntryResult!5125)

(assert (=> b!550656 (= lt!250593 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!550657 () Bool)

(assert (=> b!550657 (= e!317868 (not true))))

(declare-fun e!317867 () Bool)

(assert (=> b!550657 e!317867))

(declare-fun res!343617 () Bool)

(assert (=> b!550657 (=> (not res!343617) (not e!317867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34724 (_ BitVec 32)) Bool)

(assert (=> b!550657 (= res!343617 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17024 0))(
  ( (Unit!17025) )
))
(declare-fun lt!250594 () Unit!17024)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17024)

(assert (=> b!550657 (= lt!250594 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!343618 () Bool)

(assert (=> start!50328 (=> (not res!343618) (not e!317866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50328 (= res!343618 (validMask!0 mask!3119))))

(assert (=> start!50328 e!317866))

(assert (=> start!50328 true))

(declare-fun array_inv!12472 (array!34724) Bool)

(assert (=> start!50328 (array_inv!12472 a!3118)))

(declare-fun b!550658 () Bool)

(declare-fun res!343622 () Bool)

(assert (=> b!550658 (=> (not res!343622) (not e!317868))))

(declare-datatypes ((List!10756 0))(
  ( (Nil!10753) (Cons!10752 (h!11728 (_ BitVec 64)) (t!16984 List!10756)) )
))
(declare-fun arrayNoDuplicates!0 (array!34724 (_ BitVec 32) List!10756) Bool)

(assert (=> b!550658 (= res!343622 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10753))))

(declare-fun b!550659 () Bool)

(assert (=> b!550659 (= e!317867 (= (seekEntryOrOpen!0 (select (arr!16676 a!3118) j!142) a!3118 mask!3119) (Found!5125 j!142)))))

(declare-fun b!550660 () Bool)

(declare-fun res!343620 () Bool)

(assert (=> b!550660 (=> (not res!343620) (not e!317868))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34724 (_ BitVec 32)) SeekEntryResult!5125)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550660 (= res!343620 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16676 a!3118) j!142) mask!3119) (select (arr!16676 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16676 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16676 a!3118) i!1132 k!1914) j!142) (array!34725 (store (arr!16676 a!3118) i!1132 k!1914) (size!17040 a!3118)) mask!3119)))))

(declare-fun b!550661 () Bool)

(declare-fun res!343616 () Bool)

(assert (=> b!550661 (=> (not res!343616) (not e!317868))))

(assert (=> b!550661 (= res!343616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50328 res!343618) b!550653))

(assert (= (and b!550653 res!343619) b!550655))

(assert (= (and b!550655 res!343615) b!550652))

(assert (= (and b!550652 res!343613) b!550654))

(assert (= (and b!550654 res!343621) b!550656))

(assert (= (and b!550656 res!343614) b!550661))

(assert (= (and b!550661 res!343616) b!550658))

(assert (= (and b!550658 res!343622) b!550660))

(assert (= (and b!550660 res!343620) b!550657))

(assert (= (and b!550657 res!343617) b!550659))

(declare-fun m!527625 () Bool)

(assert (=> b!550660 m!527625))

(declare-fun m!527627 () Bool)

(assert (=> b!550660 m!527627))

(assert (=> b!550660 m!527625))

(declare-fun m!527629 () Bool)

(assert (=> b!550660 m!527629))

(declare-fun m!527631 () Bool)

(assert (=> b!550660 m!527631))

(assert (=> b!550660 m!527629))

(declare-fun m!527633 () Bool)

(assert (=> b!550660 m!527633))

(assert (=> b!550660 m!527627))

(assert (=> b!550660 m!527625))

(declare-fun m!527635 () Bool)

(assert (=> b!550660 m!527635))

(declare-fun m!527637 () Bool)

(assert (=> b!550660 m!527637))

(assert (=> b!550660 m!527629))

(assert (=> b!550660 m!527631))

(assert (=> b!550659 m!527625))

(assert (=> b!550659 m!527625))

(declare-fun m!527639 () Bool)

(assert (=> b!550659 m!527639))

(declare-fun m!527641 () Bool)

(assert (=> b!550661 m!527641))

(declare-fun m!527643 () Bool)

(assert (=> start!50328 m!527643))

(declare-fun m!527645 () Bool)

(assert (=> start!50328 m!527645))

(declare-fun m!527647 () Bool)

(assert (=> b!550657 m!527647))

(declare-fun m!527649 () Bool)

(assert (=> b!550657 m!527649))

(assert (=> b!550655 m!527625))

(assert (=> b!550655 m!527625))

(declare-fun m!527651 () Bool)

(assert (=> b!550655 m!527651))

(declare-fun m!527653 () Bool)

(assert (=> b!550652 m!527653))

(declare-fun m!527655 () Bool)

(assert (=> b!550654 m!527655))

(declare-fun m!527657 () Bool)

(assert (=> b!550658 m!527657))

(declare-fun m!527659 () Bool)

(assert (=> b!550656 m!527659))

(push 1)

