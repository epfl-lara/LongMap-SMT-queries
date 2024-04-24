; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50262 () Bool)

(assert start!50262)

(declare-fun b!549849 () Bool)

(declare-fun res!342895 () Bool)

(declare-fun e!317550 () Bool)

(assert (=> b!549849 (=> (not res!342895) (not e!317550))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34662 0))(
  ( (array!34663 (arr!16645 (Array (_ BitVec 32) (_ BitVec 64))) (size!17009 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34662)

(assert (=> b!549849 (= res!342895 (and (= (size!17009 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17009 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17009 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549850 () Bool)

(declare-fun res!342893 () Bool)

(assert (=> b!549850 (=> (not res!342893) (not e!317550))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549850 (= res!342893 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549851 () Bool)

(declare-fun res!342892 () Bool)

(declare-fun e!317549 () Bool)

(assert (=> b!549851 (=> (not res!342892) (not e!317549))))

(declare-datatypes ((List!10632 0))(
  ( (Nil!10629) (Cons!10628 (h!11604 (_ BitVec 64)) (t!16852 List!10632)) )
))
(declare-fun arrayNoDuplicates!0 (array!34662 (_ BitVec 32) List!10632) Bool)

(assert (=> b!549851 (= res!342892 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10629))))

(declare-fun b!549852 () Bool)

(assert (=> b!549852 (= e!317549 false)))

(declare-datatypes ((SeekEntryResult!5050 0))(
  ( (MissingZero!5050 (index!22427 (_ BitVec 32))) (Found!5050 (index!22428 (_ BitVec 32))) (Intermediate!5050 (undefined!5862 Bool) (index!22429 (_ BitVec 32)) (x!51511 (_ BitVec 32))) (Undefined!5050) (MissingVacant!5050 (index!22430 (_ BitVec 32))) )
))
(declare-fun lt!250375 () SeekEntryResult!5050)

(declare-fun lt!250374 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34662 (_ BitVec 32)) SeekEntryResult!5050)

(assert (=> b!549852 (= lt!250375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250374 (select (store (arr!16645 a!3118) i!1132 k0!1914) j!142) (array!34663 (store (arr!16645 a!3118) i!1132 k0!1914) (size!17009 a!3118)) mask!3119))))

(declare-fun lt!250372 () SeekEntryResult!5050)

(declare-fun lt!250371 () (_ BitVec 32))

(assert (=> b!549852 (= lt!250372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250371 (select (arr!16645 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549852 (= lt!250374 (toIndex!0 (select (store (arr!16645 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!549852 (= lt!250371 (toIndex!0 (select (arr!16645 a!3118) j!142) mask!3119))))

(declare-fun b!549853 () Bool)

(declare-fun res!342888 () Bool)

(assert (=> b!549853 (=> (not res!342888) (not e!317550))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549853 (= res!342888 (validKeyInArray!0 (select (arr!16645 a!3118) j!142)))))

(declare-fun b!549854 () Bool)

(declare-fun res!342894 () Bool)

(assert (=> b!549854 (=> (not res!342894) (not e!317549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34662 (_ BitVec 32)) Bool)

(assert (=> b!549854 (= res!342894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549855 () Bool)

(declare-fun res!342891 () Bool)

(assert (=> b!549855 (=> (not res!342891) (not e!317550))))

(assert (=> b!549855 (= res!342891 (validKeyInArray!0 k0!1914))))

(declare-fun b!549856 () Bool)

(assert (=> b!549856 (= e!317550 e!317549)))

(declare-fun res!342889 () Bool)

(assert (=> b!549856 (=> (not res!342889) (not e!317549))))

(declare-fun lt!250373 () SeekEntryResult!5050)

(assert (=> b!549856 (= res!342889 (or (= lt!250373 (MissingZero!5050 i!1132)) (= lt!250373 (MissingVacant!5050 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34662 (_ BitVec 32)) SeekEntryResult!5050)

(assert (=> b!549856 (= lt!250373 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!342890 () Bool)

(assert (=> start!50262 (=> (not res!342890) (not e!317550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50262 (= res!342890 (validMask!0 mask!3119))))

(assert (=> start!50262 e!317550))

(assert (=> start!50262 true))

(declare-fun array_inv!12504 (array!34662) Bool)

(assert (=> start!50262 (array_inv!12504 a!3118)))

(assert (= (and start!50262 res!342890) b!549849))

(assert (= (and b!549849 res!342895) b!549853))

(assert (= (and b!549853 res!342888) b!549855))

(assert (= (and b!549855 res!342891) b!549850))

(assert (= (and b!549850 res!342893) b!549856))

(assert (= (and b!549856 res!342889) b!549854))

(assert (= (and b!549854 res!342894) b!549851))

(assert (= (and b!549851 res!342892) b!549852))

(declare-fun m!526889 () Bool)

(assert (=> start!50262 m!526889))

(declare-fun m!526891 () Bool)

(assert (=> start!50262 m!526891))

(declare-fun m!526893 () Bool)

(assert (=> b!549852 m!526893))

(declare-fun m!526895 () Bool)

(assert (=> b!549852 m!526895))

(assert (=> b!549852 m!526893))

(declare-fun m!526897 () Bool)

(assert (=> b!549852 m!526897))

(assert (=> b!549852 m!526893))

(declare-fun m!526899 () Bool)

(assert (=> b!549852 m!526899))

(declare-fun m!526901 () Bool)

(assert (=> b!549852 m!526901))

(assert (=> b!549852 m!526897))

(declare-fun m!526903 () Bool)

(assert (=> b!549852 m!526903))

(assert (=> b!549852 m!526897))

(declare-fun m!526905 () Bool)

(assert (=> b!549852 m!526905))

(declare-fun m!526907 () Bool)

(assert (=> b!549850 m!526907))

(declare-fun m!526909 () Bool)

(assert (=> b!549851 m!526909))

(declare-fun m!526911 () Bool)

(assert (=> b!549855 m!526911))

(declare-fun m!526913 () Bool)

(assert (=> b!549854 m!526913))

(declare-fun m!526915 () Bool)

(assert (=> b!549856 m!526915))

(assert (=> b!549853 m!526893))

(assert (=> b!549853 m!526893))

(declare-fun m!526917 () Bool)

(assert (=> b!549853 m!526917))

(check-sat (not b!549855) (not b!549850) (not b!549853) (not b!549856) (not b!549854) (not start!50262) (not b!549852) (not b!549851))
(check-sat)
