; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52194 () Bool)

(assert start!52194)

(declare-fun b!569778 () Bool)

(declare-fun res!359804 () Bool)

(declare-fun e!327732 () Bool)

(assert (=> b!569778 (=> (not res!359804) (not e!327732))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35717 0))(
  ( (array!35718 (arr!17150 (Array (_ BitVec 32) (_ BitVec 64))) (size!17514 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35717)

(assert (=> b!569778 (= res!359804 (and (= (size!17514 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17514 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17514 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569779 () Bool)

(declare-fun res!359802 () Bool)

(assert (=> b!569779 (=> (not res!359802) (not e!327732))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569779 (= res!359802 (validKeyInArray!0 k!1914))))

(declare-fun res!359797 () Bool)

(assert (=> start!52194 (=> (not res!359797) (not e!327732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52194 (= res!359797 (validMask!0 mask!3119))))

(assert (=> start!52194 e!327732))

(assert (=> start!52194 true))

(declare-fun array_inv!12946 (array!35717) Bool)

(assert (=> start!52194 (array_inv!12946 a!3118)))

(declare-fun b!569780 () Bool)

(declare-fun res!359803 () Bool)

(declare-fun e!327730 () Bool)

(assert (=> b!569780 (=> (not res!359803) (not e!327730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35717 (_ BitVec 32)) Bool)

(assert (=> b!569780 (= res!359803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569781 () Bool)

(declare-fun res!359798 () Bool)

(assert (=> b!569781 (=> (not res!359798) (not e!327730))))

(declare-datatypes ((List!11230 0))(
  ( (Nil!11227) (Cons!11226 (h!12247 (_ BitVec 64)) (t!17458 List!11230)) )
))
(declare-fun arrayNoDuplicates!0 (array!35717 (_ BitVec 32) List!11230) Bool)

(assert (=> b!569781 (= res!359798 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11227))))

(declare-fun b!569782 () Bool)

(declare-fun res!359799 () Bool)

(assert (=> b!569782 (=> (not res!359799) (not e!327732))))

(declare-fun arrayContainsKey!0 (array!35717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569782 (= res!359799 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569783 () Bool)

(declare-fun e!327729 () Bool)

(assert (=> b!569783 (= e!327729 (not true))))

(declare-datatypes ((SeekEntryResult!5599 0))(
  ( (MissingZero!5599 (index!24623 (_ BitVec 32))) (Found!5599 (index!24624 (_ BitVec 32))) (Intermediate!5599 (undefined!6411 Bool) (index!24625 (_ BitVec 32)) (x!53490 (_ BitVec 32))) (Undefined!5599) (MissingVacant!5599 (index!24626 (_ BitVec 32))) )
))
(declare-fun lt!259772 () SeekEntryResult!5599)

(declare-fun lt!259773 () SeekEntryResult!5599)

(assert (=> b!569783 (and (= lt!259772 (Found!5599 j!142)) (or (undefined!6411 lt!259773) (not (is-Intermediate!5599 lt!259773)) (= (select (arr!17150 a!3118) (index!24625 lt!259773)) (select (arr!17150 a!3118) j!142)) (not (= (select (arr!17150 a!3118) (index!24625 lt!259773)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259772 (MissingZero!5599 (index!24625 lt!259773)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35717 (_ BitVec 32)) SeekEntryResult!5599)

(assert (=> b!569783 (= lt!259772 (seekEntryOrOpen!0 (select (arr!17150 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569783 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17900 0))(
  ( (Unit!17901) )
))
(declare-fun lt!259774 () Unit!17900)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17900)

(assert (=> b!569783 (= lt!259774 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569784 () Bool)

(assert (=> b!569784 (= e!327732 e!327730)))

(declare-fun res!359800 () Bool)

(assert (=> b!569784 (=> (not res!359800) (not e!327730))))

(declare-fun lt!259770 () SeekEntryResult!5599)

(assert (=> b!569784 (= res!359800 (or (= lt!259770 (MissingZero!5599 i!1132)) (= lt!259770 (MissingVacant!5599 i!1132))))))

(assert (=> b!569784 (= lt!259770 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569785 () Bool)

(assert (=> b!569785 (= e!327730 e!327729)))

(declare-fun res!359796 () Bool)

(assert (=> b!569785 (=> (not res!359796) (not e!327729))))

(declare-fun lt!259771 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35717 (_ BitVec 32)) SeekEntryResult!5599)

(assert (=> b!569785 (= res!359796 (= lt!259773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259771 (select (store (arr!17150 a!3118) i!1132 k!1914) j!142) (array!35718 (store (arr!17150 a!3118) i!1132 k!1914) (size!17514 a!3118)) mask!3119)))))

(declare-fun lt!259769 () (_ BitVec 32))

(assert (=> b!569785 (= lt!259773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259769 (select (arr!17150 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569785 (= lt!259771 (toIndex!0 (select (store (arr!17150 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569785 (= lt!259769 (toIndex!0 (select (arr!17150 a!3118) j!142) mask!3119))))

(declare-fun b!569786 () Bool)

(declare-fun res!359801 () Bool)

(assert (=> b!569786 (=> (not res!359801) (not e!327732))))

(assert (=> b!569786 (= res!359801 (validKeyInArray!0 (select (arr!17150 a!3118) j!142)))))

(assert (= (and start!52194 res!359797) b!569778))

(assert (= (and b!569778 res!359804) b!569786))

(assert (= (and b!569786 res!359801) b!569779))

(assert (= (and b!569779 res!359802) b!569782))

(assert (= (and b!569782 res!359799) b!569784))

(assert (= (and b!569784 res!359800) b!569780))

(assert (= (and b!569780 res!359803) b!569781))

(assert (= (and b!569781 res!359798) b!569785))

(assert (= (and b!569785 res!359796) b!569783))

(declare-fun m!548647 () Bool)

(assert (=> b!569785 m!548647))

(declare-fun m!548649 () Bool)

(assert (=> b!569785 m!548649))

(assert (=> b!569785 m!548647))

(declare-fun m!548651 () Bool)

(assert (=> b!569785 m!548651))

(declare-fun m!548653 () Bool)

(assert (=> b!569785 m!548653))

(assert (=> b!569785 m!548647))

(declare-fun m!548655 () Bool)

(assert (=> b!569785 m!548655))

(assert (=> b!569785 m!548651))

(declare-fun m!548657 () Bool)

(assert (=> b!569785 m!548657))

(assert (=> b!569785 m!548651))

(declare-fun m!548659 () Bool)

(assert (=> b!569785 m!548659))

(assert (=> b!569783 m!548647))

(declare-fun m!548661 () Bool)

(assert (=> b!569783 m!548661))

(declare-fun m!548663 () Bool)

(assert (=> b!569783 m!548663))

(declare-fun m!548665 () Bool)

(assert (=> b!569783 m!548665))

(assert (=> b!569783 m!548647))

(declare-fun m!548667 () Bool)

(assert (=> b!569783 m!548667))

(declare-fun m!548669 () Bool)

(assert (=> b!569780 m!548669))

(declare-fun m!548671 () Bool)

(assert (=> b!569781 m!548671))

(declare-fun m!548673 () Bool)

(assert (=> b!569784 m!548673))

(declare-fun m!548675 () Bool)

(assert (=> b!569779 m!548675))

(assert (=> b!569786 m!548647))

(assert (=> b!569786 m!548647))

(declare-fun m!548677 () Bool)

(assert (=> b!569786 m!548677))

(declare-fun m!548679 () Bool)

(assert (=> b!569782 m!548679))

(declare-fun m!548681 () Bool)

(assert (=> start!52194 m!548681))

(declare-fun m!548683 () Bool)

(assert (=> start!52194 m!548683))

(push 1)

