; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50236 () Bool)

(assert start!50236)

(declare-fun b!549903 () Bool)

(declare-fun res!343048 () Bool)

(declare-fun e!317510 () Bool)

(assert (=> b!549903 (=> (not res!343048) (not e!317510))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549903 (= res!343048 (validKeyInArray!0 k0!1914))))

(declare-fun b!549904 () Bool)

(declare-fun res!343049 () Bool)

(declare-fun e!317511 () Bool)

(assert (=> b!549904 (=> (not res!343049) (not e!317511))))

(declare-datatypes ((array!34689 0))(
  ( (array!34690 (arr!16660 (Array (_ BitVec 32) (_ BitVec 64))) (size!17024 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34689)

(declare-datatypes ((List!10740 0))(
  ( (Nil!10737) (Cons!10736 (h!11709 (_ BitVec 64)) (t!16968 List!10740)) )
))
(declare-fun arrayNoDuplicates!0 (array!34689 (_ BitVec 32) List!10740) Bool)

(assert (=> b!549904 (= res!343049 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10737))))

(declare-fun b!549905 () Bool)

(declare-fun res!343052 () Bool)

(assert (=> b!549905 (=> (not res!343052) (not e!317510))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549905 (= res!343052 (and (= (size!17024 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17024 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17024 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549906 () Bool)

(declare-fun res!343053 () Bool)

(assert (=> b!549906 (=> (not res!343053) (not e!317511))))

(declare-datatypes ((SeekEntryResult!5109 0))(
  ( (MissingZero!5109 (index!22663 (_ BitVec 32))) (Found!5109 (index!22664 (_ BitVec 32))) (Intermediate!5109 (undefined!5921 Bool) (index!22665 (_ BitVec 32)) (x!51591 (_ BitVec 32))) (Undefined!5109) (MissingVacant!5109 (index!22666 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34689 (_ BitVec 32)) SeekEntryResult!5109)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549906 (= res!343053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16660 a!3118) j!142) mask!3119) (select (arr!16660 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16660 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16660 a!3118) i!1132 k0!1914) j!142) (array!34690 (store (arr!16660 a!3118) i!1132 k0!1914) (size!17024 a!3118)) mask!3119)))))

(declare-fun res!343055 () Bool)

(assert (=> start!50236 (=> (not res!343055) (not e!317510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50236 (= res!343055 (validMask!0 mask!3119))))

(assert (=> start!50236 e!317510))

(assert (=> start!50236 true))

(declare-fun array_inv!12456 (array!34689) Bool)

(assert (=> start!50236 (array_inv!12456 a!3118)))

(declare-fun b!549907 () Bool)

(assert (=> b!549907 (= e!317510 e!317511)))

(declare-fun res!343054 () Bool)

(assert (=> b!549907 (=> (not res!343054) (not e!317511))))

(declare-fun lt!250369 () SeekEntryResult!5109)

(assert (=> b!549907 (= res!343054 (or (= lt!250369 (MissingZero!5109 i!1132)) (= lt!250369 (MissingVacant!5109 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34689 (_ BitVec 32)) SeekEntryResult!5109)

(assert (=> b!549907 (= lt!250369 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549908 () Bool)

(declare-fun res!343051 () Bool)

(assert (=> b!549908 (=> (not res!343051) (not e!317510))))

(declare-fun arrayContainsKey!0 (array!34689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549908 (= res!343051 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549909 () Bool)

(declare-fun res!343047 () Bool)

(assert (=> b!549909 (=> (not res!343047) (not e!317510))))

(assert (=> b!549909 (= res!343047 (validKeyInArray!0 (select (arr!16660 a!3118) j!142)))))

(declare-fun b!549910 () Bool)

(assert (=> b!549910 (= e!317511 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34689 (_ BitVec 32)) Bool)

(assert (=> b!549910 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!16992 0))(
  ( (Unit!16993) )
))
(declare-fun lt!250368 () Unit!16992)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34689 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16992)

(assert (=> b!549910 (= lt!250368 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!549911 () Bool)

(declare-fun res!343050 () Bool)

(assert (=> b!549911 (=> (not res!343050) (not e!317511))))

(assert (=> b!549911 (= res!343050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50236 res!343055) b!549905))

(assert (= (and b!549905 res!343052) b!549909))

(assert (= (and b!549909 res!343047) b!549903))

(assert (= (and b!549903 res!343048) b!549908))

(assert (= (and b!549908 res!343051) b!549907))

(assert (= (and b!549907 res!343054) b!549911))

(assert (= (and b!549911 res!343050) b!549904))

(assert (= (and b!549904 res!343049) b!549906))

(assert (= (and b!549906 res!343053) b!549910))

(declare-fun m!526867 () Bool)

(assert (=> b!549904 m!526867))

(declare-fun m!526869 () Bool)

(assert (=> b!549910 m!526869))

(declare-fun m!526871 () Bool)

(assert (=> b!549910 m!526871))

(declare-fun m!526873 () Bool)

(assert (=> b!549909 m!526873))

(assert (=> b!549909 m!526873))

(declare-fun m!526875 () Bool)

(assert (=> b!549909 m!526875))

(assert (=> b!549906 m!526873))

(declare-fun m!526877 () Bool)

(assert (=> b!549906 m!526877))

(assert (=> b!549906 m!526873))

(declare-fun m!526879 () Bool)

(assert (=> b!549906 m!526879))

(declare-fun m!526881 () Bool)

(assert (=> b!549906 m!526881))

(assert (=> b!549906 m!526879))

(declare-fun m!526883 () Bool)

(assert (=> b!549906 m!526883))

(assert (=> b!549906 m!526877))

(assert (=> b!549906 m!526873))

(declare-fun m!526885 () Bool)

(assert (=> b!549906 m!526885))

(declare-fun m!526887 () Bool)

(assert (=> b!549906 m!526887))

(assert (=> b!549906 m!526879))

(assert (=> b!549906 m!526881))

(declare-fun m!526889 () Bool)

(assert (=> b!549911 m!526889))

(declare-fun m!526891 () Bool)

(assert (=> b!549908 m!526891))

(declare-fun m!526893 () Bool)

(assert (=> b!549903 m!526893))

(declare-fun m!526895 () Bool)

(assert (=> b!549907 m!526895))

(declare-fun m!526897 () Bool)

(assert (=> start!50236 m!526897))

(declare-fun m!526899 () Bool)

(assert (=> start!50236 m!526899))

(check-sat (not b!549906) (not b!549909) (not b!549911) (not b!549904) (not b!549908) (not b!549907) (not b!549903) (not start!50236) (not b!549910))
(check-sat)
