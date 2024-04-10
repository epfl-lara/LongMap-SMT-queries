; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52398 () Bool)

(assert start!52398)

(declare-fun b!571724 () Bool)

(declare-fun res!361239 () Bool)

(declare-fun e!328841 () Bool)

(assert (=> b!571724 (=> (not res!361239) (not e!328841))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571724 (= res!361239 (validKeyInArray!0 k!1914))))

(declare-fun b!571725 () Bool)

(declare-fun res!361244 () Bool)

(declare-fun e!328839 () Bool)

(assert (=> b!571725 (=> (not res!361244) (not e!328839))))

(declare-datatypes ((array!35795 0))(
  ( (array!35796 (arr!17186 (Array (_ BitVec 32) (_ BitVec 64))) (size!17550 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35795)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35795 (_ BitVec 32)) Bool)

(assert (=> b!571725 (= res!361244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571726 () Bool)

(declare-fun e!328842 () Bool)

(assert (=> b!571726 (= e!328842 (not true))))

(declare-fun e!328837 () Bool)

(assert (=> b!571726 e!328837))

(declare-fun res!361240 () Bool)

(assert (=> b!571726 (=> (not res!361240) (not e!328837))))

(declare-datatypes ((SeekEntryResult!5635 0))(
  ( (MissingZero!5635 (index!24767 (_ BitVec 32))) (Found!5635 (index!24768 (_ BitVec 32))) (Intermediate!5635 (undefined!6447 Bool) (index!24769 (_ BitVec 32)) (x!53640 (_ BitVec 32))) (Undefined!5635) (MissingVacant!5635 (index!24770 (_ BitVec 32))) )
))
(declare-fun lt!260742 () SeekEntryResult!5635)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!571726 (= res!361240 (= lt!260742 (Found!5635 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35795 (_ BitVec 32)) SeekEntryResult!5635)

(assert (=> b!571726 (= lt!260742 (seekEntryOrOpen!0 (select (arr!17186 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!571726 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17972 0))(
  ( (Unit!17973) )
))
(declare-fun lt!260749 () Unit!17972)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35795 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17972)

(assert (=> b!571726 (= lt!260749 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571727 () Bool)

(declare-fun e!328835 () Bool)

(declare-fun e!328840 () Bool)

(assert (=> b!571727 (= e!328835 e!328840)))

(declare-fun res!361232 () Bool)

(assert (=> b!571727 (=> (not res!361232) (not e!328840))))

(declare-fun lt!260743 () SeekEntryResult!5635)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35795 (_ BitVec 32)) SeekEntryResult!5635)

(assert (=> b!571727 (= res!361232 (= lt!260742 (seekKeyOrZeroReturnVacant!0 (x!53640 lt!260743) (index!24769 lt!260743) (index!24769 lt!260743) (select (arr!17186 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571728 () Bool)

(declare-fun res!361233 () Bool)

(assert (=> b!571728 (=> (not res!361233) (not e!328839))))

(declare-datatypes ((List!11266 0))(
  ( (Nil!11263) (Cons!11262 (h!12289 (_ BitVec 64)) (t!17494 List!11266)) )
))
(declare-fun arrayNoDuplicates!0 (array!35795 (_ BitVec 32) List!11266) Bool)

(assert (=> b!571728 (= res!361233 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11263))))

(declare-fun b!571729 () Bool)

(declare-fun res!361242 () Bool)

(assert (=> b!571729 (=> (not res!361242) (not e!328841))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571729 (= res!361242 (and (= (size!17550 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17550 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17550 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571730 () Bool)

(declare-fun e!328838 () Bool)

(assert (=> b!571730 (= e!328837 e!328838)))

(declare-fun res!361241 () Bool)

(assert (=> b!571730 (=> res!361241 e!328838)))

(assert (=> b!571730 (= res!361241 (or (undefined!6447 lt!260743) (not (is-Intermediate!5635 lt!260743))))))

(declare-fun b!571731 () Bool)

(assert (=> b!571731 (= e!328841 e!328839)))

(declare-fun res!361238 () Bool)

(assert (=> b!571731 (=> (not res!361238) (not e!328839))))

(declare-fun lt!260746 () SeekEntryResult!5635)

(assert (=> b!571731 (= res!361238 (or (= lt!260746 (MissingZero!5635 i!1132)) (= lt!260746 (MissingVacant!5635 i!1132))))))

(assert (=> b!571731 (= lt!260746 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!571732 () Bool)

(declare-fun res!361234 () Bool)

(assert (=> b!571732 (=> (not res!361234) (not e!328841))))

(declare-fun arrayContainsKey!0 (array!35795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571732 (= res!361234 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun lt!260741 () (_ BitVec 64))

(declare-fun lt!260745 () array!35795)

(declare-fun b!571733 () Bool)

(assert (=> b!571733 (= e!328840 (= (seekEntryOrOpen!0 lt!260741 lt!260745 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53640 lt!260743) (index!24769 lt!260743) (index!24769 lt!260743) lt!260741 lt!260745 mask!3119)))))

(declare-fun b!571734 () Bool)

(assert (=> b!571734 (= e!328838 e!328835)))

(declare-fun res!361236 () Bool)

(assert (=> b!571734 (=> res!361236 e!328835)))

(declare-fun lt!260748 () (_ BitVec 64))

(assert (=> b!571734 (= res!361236 (or (= lt!260748 (select (arr!17186 a!3118) j!142)) (= lt!260748 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571734 (= lt!260748 (select (arr!17186 a!3118) (index!24769 lt!260743)))))

(declare-fun res!361243 () Bool)

(assert (=> start!52398 (=> (not res!361243) (not e!328841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52398 (= res!361243 (validMask!0 mask!3119))))

(assert (=> start!52398 e!328841))

(assert (=> start!52398 true))

(declare-fun array_inv!12982 (array!35795) Bool)

(assert (=> start!52398 (array_inv!12982 a!3118)))

(declare-fun b!571735 () Bool)

(assert (=> b!571735 (= e!328839 e!328842)))

(declare-fun res!361235 () Bool)

(assert (=> b!571735 (=> (not res!361235) (not e!328842))))

(declare-fun lt!260744 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35795 (_ BitVec 32)) SeekEntryResult!5635)

(assert (=> b!571735 (= res!361235 (= lt!260743 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260744 lt!260741 lt!260745 mask!3119)))))

(declare-fun lt!260747 () (_ BitVec 32))

(assert (=> b!571735 (= lt!260743 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260747 (select (arr!17186 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571735 (= lt!260744 (toIndex!0 lt!260741 mask!3119))))

(assert (=> b!571735 (= lt!260741 (select (store (arr!17186 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!571735 (= lt!260747 (toIndex!0 (select (arr!17186 a!3118) j!142) mask!3119))))

(assert (=> b!571735 (= lt!260745 (array!35796 (store (arr!17186 a!3118) i!1132 k!1914) (size!17550 a!3118)))))

(declare-fun b!571736 () Bool)

(declare-fun res!361237 () Bool)

(assert (=> b!571736 (=> (not res!361237) (not e!328841))))

(assert (=> b!571736 (= res!361237 (validKeyInArray!0 (select (arr!17186 a!3118) j!142)))))

(assert (= (and start!52398 res!361243) b!571729))

(assert (= (and b!571729 res!361242) b!571736))

(assert (= (and b!571736 res!361237) b!571724))

(assert (= (and b!571724 res!361239) b!571732))

(assert (= (and b!571732 res!361234) b!571731))

(assert (= (and b!571731 res!361238) b!571725))

(assert (= (and b!571725 res!361244) b!571728))

(assert (= (and b!571728 res!361233) b!571735))

(assert (= (and b!571735 res!361235) b!571726))

(assert (= (and b!571726 res!361240) b!571730))

(assert (= (and b!571730 (not res!361241)) b!571734))

(assert (= (and b!571734 (not res!361236)) b!571727))

(assert (= (and b!571727 res!361232) b!571733))

(declare-fun m!550609 () Bool)

(assert (=> b!571734 m!550609))

(declare-fun m!550611 () Bool)

(assert (=> b!571734 m!550611))

(assert (=> b!571726 m!550609))

(assert (=> b!571726 m!550609))

(declare-fun m!550613 () Bool)

(assert (=> b!571726 m!550613))

(declare-fun m!550615 () Bool)

(assert (=> b!571726 m!550615))

(declare-fun m!550617 () Bool)

(assert (=> b!571726 m!550617))

(declare-fun m!550619 () Bool)

(assert (=> b!571732 m!550619))

(declare-fun m!550621 () Bool)

(assert (=> b!571733 m!550621))

(declare-fun m!550623 () Bool)

(assert (=> b!571733 m!550623))

(assert (=> b!571736 m!550609))

(assert (=> b!571736 m!550609))

(declare-fun m!550625 () Bool)

(assert (=> b!571736 m!550625))

(assert (=> b!571727 m!550609))

(assert (=> b!571727 m!550609))

(declare-fun m!550627 () Bool)

(assert (=> b!571727 m!550627))

(declare-fun m!550629 () Bool)

(assert (=> b!571724 m!550629))

(declare-fun m!550631 () Bool)

(assert (=> b!571725 m!550631))

(declare-fun m!550633 () Bool)

(assert (=> b!571731 m!550633))

(declare-fun m!550635 () Bool)

(assert (=> start!52398 m!550635))

(declare-fun m!550637 () Bool)

(assert (=> start!52398 m!550637))

(declare-fun m!550639 () Bool)

(assert (=> b!571728 m!550639))

(assert (=> b!571735 m!550609))

(declare-fun m!550641 () Bool)

(assert (=> b!571735 m!550641))

(assert (=> b!571735 m!550609))

(declare-fun m!550643 () Bool)

(assert (=> b!571735 m!550643))

(declare-fun m!550645 () Bool)

(assert (=> b!571735 m!550645))

(assert (=> b!571735 m!550609))

(declare-fun m!550647 () Bool)

(assert (=> b!571735 m!550647))

(declare-fun m!550649 () Bool)

(assert (=> b!571735 m!550649))

(declare-fun m!550651 () Bool)

(assert (=> b!571735 m!550651))

(push 1)

