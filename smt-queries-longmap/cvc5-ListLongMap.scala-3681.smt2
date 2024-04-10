; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50702 () Bool)

(assert start!50702)

(declare-fun b!554462 () Bool)

(declare-fun e!319704 () Bool)

(declare-fun e!319705 () Bool)

(assert (=> b!554462 (= e!319704 e!319705)))

(declare-fun res!346875 () Bool)

(assert (=> b!554462 (=> (not res!346875) (not e!319705))))

(declare-datatypes ((SeekEntryResult!5222 0))(
  ( (MissingZero!5222 (index!23115 (_ BitVec 32))) (Found!5222 (index!23116 (_ BitVec 32))) (Intermediate!5222 (undefined!6034 Bool) (index!23117 (_ BitVec 32)) (x!52032 (_ BitVec 32))) (Undefined!5222) (MissingVacant!5222 (index!23118 (_ BitVec 32))) )
))
(declare-fun lt!251796 () SeekEntryResult!5222)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554462 (= res!346875 (or (= lt!251796 (MissingZero!5222 i!1132)) (= lt!251796 (MissingVacant!5222 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!34927 0))(
  ( (array!34928 (arr!16773 (Array (_ BitVec 32) (_ BitVec 64))) (size!17137 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34927)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34927 (_ BitVec 32)) SeekEntryResult!5222)

(assert (=> b!554462 (= lt!251796 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554463 () Bool)

(declare-fun res!346880 () Bool)

(assert (=> b!554463 (=> (not res!346880) (not e!319705))))

(declare-datatypes ((List!10853 0))(
  ( (Nil!10850) (Cons!10849 (h!11834 (_ BitVec 64)) (t!17081 List!10853)) )
))
(declare-fun arrayNoDuplicates!0 (array!34927 (_ BitVec 32) List!10853) Bool)

(assert (=> b!554463 (= res!346880 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10850))))

(declare-fun e!319706 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!554464 () Bool)

(assert (=> b!554464 (= e!319706 (= (seekEntryOrOpen!0 (select (arr!16773 a!3118) j!142) a!3118 mask!3119) (Found!5222 j!142)))))

(declare-fun b!554465 () Bool)

(declare-fun res!346878 () Bool)

(assert (=> b!554465 (=> (not res!346878) (not e!319704))))

(assert (=> b!554465 (= res!346878 (and (= (size!17137 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17137 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17137 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!346879 () Bool)

(assert (=> start!50702 (=> (not res!346879) (not e!319704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50702 (= res!346879 (validMask!0 mask!3119))))

(assert (=> start!50702 e!319704))

(assert (=> start!50702 true))

(declare-fun array_inv!12569 (array!34927) Bool)

(assert (=> start!50702 (array_inv!12569 a!3118)))

(declare-fun b!554466 () Bool)

(assert (=> b!554466 (= e!319705 (not true))))

(assert (=> b!554466 e!319706))

(declare-fun res!346883 () Bool)

(assert (=> b!554466 (=> (not res!346883) (not e!319706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34927 (_ BitVec 32)) Bool)

(assert (=> b!554466 (= res!346883 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17218 0))(
  ( (Unit!17219) )
))
(declare-fun lt!251797 () Unit!17218)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34927 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17218)

(assert (=> b!554466 (= lt!251797 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554467 () Bool)

(declare-fun res!346882 () Bool)

(assert (=> b!554467 (=> (not res!346882) (not e!319704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554467 (= res!346882 (validKeyInArray!0 k!1914))))

(declare-fun b!554468 () Bool)

(declare-fun res!346874 () Bool)

(assert (=> b!554468 (=> (not res!346874) (not e!319705))))

(assert (=> b!554468 (= res!346874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554469 () Bool)

(declare-fun res!346877 () Bool)

(assert (=> b!554469 (=> (not res!346877) (not e!319704))))

(declare-fun arrayContainsKey!0 (array!34927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554469 (= res!346877 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554470 () Bool)

(declare-fun res!346876 () Bool)

(assert (=> b!554470 (=> (not res!346876) (not e!319705))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34927 (_ BitVec 32)) SeekEntryResult!5222)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554470 (= res!346876 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16773 a!3118) j!142) mask!3119) (select (arr!16773 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16773 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16773 a!3118) i!1132 k!1914) j!142) (array!34928 (store (arr!16773 a!3118) i!1132 k!1914) (size!17137 a!3118)) mask!3119)))))

(declare-fun b!554471 () Bool)

(declare-fun res!346881 () Bool)

(assert (=> b!554471 (=> (not res!346881) (not e!319704))))

(assert (=> b!554471 (= res!346881 (validKeyInArray!0 (select (arr!16773 a!3118) j!142)))))

(assert (= (and start!50702 res!346879) b!554465))

(assert (= (and b!554465 res!346878) b!554471))

(assert (= (and b!554471 res!346881) b!554467))

(assert (= (and b!554467 res!346882) b!554469))

(assert (= (and b!554469 res!346877) b!554462))

(assert (= (and b!554462 res!346875) b!554468))

(assert (= (and b!554468 res!346874) b!554463))

(assert (= (and b!554463 res!346880) b!554470))

(assert (= (and b!554470 res!346876) b!554466))

(assert (= (and b!554466 res!346883) b!554464))

(declare-fun m!531765 () Bool)

(assert (=> b!554469 m!531765))

(declare-fun m!531767 () Bool)

(assert (=> b!554471 m!531767))

(assert (=> b!554471 m!531767))

(declare-fun m!531769 () Bool)

(assert (=> b!554471 m!531769))

(declare-fun m!531771 () Bool)

(assert (=> b!554468 m!531771))

(declare-fun m!531773 () Bool)

(assert (=> b!554463 m!531773))

(assert (=> b!554470 m!531767))

(declare-fun m!531775 () Bool)

(assert (=> b!554470 m!531775))

(assert (=> b!554470 m!531767))

(declare-fun m!531777 () Bool)

(assert (=> b!554470 m!531777))

(declare-fun m!531779 () Bool)

(assert (=> b!554470 m!531779))

(assert (=> b!554470 m!531777))

(declare-fun m!531781 () Bool)

(assert (=> b!554470 m!531781))

(assert (=> b!554470 m!531775))

(assert (=> b!554470 m!531767))

(declare-fun m!531783 () Bool)

(assert (=> b!554470 m!531783))

(declare-fun m!531785 () Bool)

(assert (=> b!554470 m!531785))

(assert (=> b!554470 m!531777))

(assert (=> b!554470 m!531779))

(declare-fun m!531787 () Bool)

(assert (=> b!554462 m!531787))

(declare-fun m!531789 () Bool)

(assert (=> b!554466 m!531789))

(declare-fun m!531791 () Bool)

(assert (=> b!554466 m!531791))

(declare-fun m!531793 () Bool)

(assert (=> start!50702 m!531793))

(declare-fun m!531795 () Bool)

(assert (=> start!50702 m!531795))

(assert (=> b!554464 m!531767))

(assert (=> b!554464 m!531767))

(declare-fun m!531797 () Bool)

(assert (=> b!554464 m!531797))

(declare-fun m!531799 () Bool)

(assert (=> b!554467 m!531799))

(push 1)

