; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50240 () Bool)

(assert start!50240)

(declare-fun res!343144 () Bool)

(declare-fun e!317410 () Bool)

(assert (=> start!50240 (=> (not res!343144) (not e!317410))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50240 (= res!343144 (validMask!0 mask!3119))))

(assert (=> start!50240 e!317410))

(assert (=> start!50240 true))

(declare-datatypes ((array!34702 0))(
  ( (array!34703 (arr!16667 (Array (_ BitVec 32) (_ BitVec 64))) (size!17032 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34702)

(declare-fun array_inv!12550 (array!34702) Bool)

(assert (=> start!50240 (array_inv!12550 a!3118)))

(declare-fun b!549850 () Bool)

(declare-fun res!343145 () Bool)

(declare-fun e!317412 () Bool)

(assert (=> b!549850 (=> (not res!343145) (not e!317412))))

(declare-datatypes ((List!10786 0))(
  ( (Nil!10783) (Cons!10782 (h!11755 (_ BitVec 64)) (t!17005 List!10786)) )
))
(declare-fun arrayNoDuplicates!0 (array!34702 (_ BitVec 32) List!10786) Bool)

(assert (=> b!549850 (= res!343145 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10783))))

(declare-fun b!549851 () Bool)

(declare-fun res!343137 () Bool)

(assert (=> b!549851 (=> (not res!343137) (not e!317410))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549851 (= res!343137 (validKeyInArray!0 (select (arr!16667 a!3118) j!142)))))

(declare-fun b!549852 () Bool)

(declare-fun res!343139 () Bool)

(assert (=> b!549852 (=> (not res!343139) (not e!317410))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549852 (= res!343139 (and (= (size!17032 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17032 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17032 a!3118)) (not (= i!1132 j!142))))))

(declare-fun e!317409 () Bool)

(declare-fun b!549853 () Bool)

(declare-datatypes ((SeekEntryResult!5113 0))(
  ( (MissingZero!5113 (index!22679 (_ BitVec 32))) (Found!5113 (index!22680 (_ BitVec 32))) (Intermediate!5113 (undefined!5925 Bool) (index!22681 (_ BitVec 32)) (x!51614 (_ BitVec 32))) (Undefined!5113) (MissingVacant!5113 (index!22682 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34702 (_ BitVec 32)) SeekEntryResult!5113)

(assert (=> b!549853 (= e!317409 (= (seekEntryOrOpen!0 (select (arr!16667 a!3118) j!142) a!3118 mask!3119) (Found!5113 j!142)))))

(declare-fun b!549854 () Bool)

(assert (=> b!549854 (= e!317412 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!549854 e!317409))

(declare-fun res!343143 () Bool)

(assert (=> b!549854 (=> (not res!343143) (not e!317409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34702 (_ BitVec 32)) Bool)

(assert (=> b!549854 (= res!343143 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!16986 0))(
  ( (Unit!16987) )
))
(declare-fun lt!250183 () Unit!16986)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34702 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16986)

(assert (=> b!549854 (= lt!250183 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!549855 () Bool)

(declare-fun res!343141 () Bool)

(assert (=> b!549855 (=> (not res!343141) (not e!317410))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549855 (= res!343141 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549856 () Bool)

(declare-fun res!343138 () Bool)

(assert (=> b!549856 (=> (not res!343138) (not e!317412))))

(assert (=> b!549856 (= res!343138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549857 () Bool)

(assert (=> b!549857 (= e!317410 e!317412)))

(declare-fun res!343136 () Bool)

(assert (=> b!549857 (=> (not res!343136) (not e!317412))))

(declare-fun lt!250182 () SeekEntryResult!5113)

(assert (=> b!549857 (= res!343136 (or (= lt!250182 (MissingZero!5113 i!1132)) (= lt!250182 (MissingVacant!5113 i!1132))))))

(assert (=> b!549857 (= lt!250182 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549858 () Bool)

(declare-fun res!343140 () Bool)

(assert (=> b!549858 (=> (not res!343140) (not e!317410))))

(assert (=> b!549858 (= res!343140 (validKeyInArray!0 k0!1914))))

(declare-fun b!549859 () Bool)

(declare-fun res!343142 () Bool)

(assert (=> b!549859 (=> (not res!343142) (not e!317412))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34702 (_ BitVec 32)) SeekEntryResult!5113)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549859 (= res!343142 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16667 a!3118) j!142) mask!3119) (select (arr!16667 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16667 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16667 a!3118) i!1132 k0!1914) j!142) (array!34703 (store (arr!16667 a!3118) i!1132 k0!1914) (size!17032 a!3118)) mask!3119)))))

(assert (= (and start!50240 res!343144) b!549852))

(assert (= (and b!549852 res!343139) b!549851))

(assert (= (and b!549851 res!343137) b!549858))

(assert (= (and b!549858 res!343140) b!549855))

(assert (= (and b!549855 res!343141) b!549857))

(assert (= (and b!549857 res!343136) b!549856))

(assert (= (and b!549856 res!343138) b!549850))

(assert (= (and b!549850 res!343145) b!549859))

(assert (= (and b!549859 res!343142) b!549854))

(assert (= (and b!549854 res!343143) b!549853))

(declare-fun m!526367 () Bool)

(assert (=> b!549850 m!526367))

(declare-fun m!526369 () Bool)

(assert (=> b!549858 m!526369))

(declare-fun m!526371 () Bool)

(assert (=> b!549857 m!526371))

(declare-fun m!526373 () Bool)

(assert (=> b!549855 m!526373))

(declare-fun m!526375 () Bool)

(assert (=> b!549854 m!526375))

(declare-fun m!526377 () Bool)

(assert (=> b!549854 m!526377))

(declare-fun m!526379 () Bool)

(assert (=> b!549851 m!526379))

(assert (=> b!549851 m!526379))

(declare-fun m!526381 () Bool)

(assert (=> b!549851 m!526381))

(assert (=> b!549859 m!526379))

(declare-fun m!526383 () Bool)

(assert (=> b!549859 m!526383))

(assert (=> b!549859 m!526379))

(declare-fun m!526385 () Bool)

(assert (=> b!549859 m!526385))

(declare-fun m!526387 () Bool)

(assert (=> b!549859 m!526387))

(assert (=> b!549859 m!526385))

(declare-fun m!526389 () Bool)

(assert (=> b!549859 m!526389))

(assert (=> b!549859 m!526383))

(assert (=> b!549859 m!526379))

(declare-fun m!526391 () Bool)

(assert (=> b!549859 m!526391))

(declare-fun m!526393 () Bool)

(assert (=> b!549859 m!526393))

(assert (=> b!549859 m!526385))

(assert (=> b!549859 m!526387))

(declare-fun m!526395 () Bool)

(assert (=> b!549856 m!526395))

(assert (=> b!549853 m!526379))

(assert (=> b!549853 m!526379))

(declare-fun m!526397 () Bool)

(assert (=> b!549853 m!526397))

(declare-fun m!526399 () Bool)

(assert (=> start!50240 m!526399))

(declare-fun m!526401 () Bool)

(assert (=> start!50240 m!526401))

(check-sat (not b!549859) (not b!549853) (not start!50240) (not b!549855) (not b!549850) (not b!549858) (not b!549856) (not b!549851) (not b!549857) (not b!549854))
(check-sat)
