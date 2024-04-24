; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51942 () Bool)

(assert start!51942)

(declare-fun b!567433 () Bool)

(declare-fun res!357915 () Bool)

(declare-fun e!326565 () Bool)

(assert (=> b!567433 (=> (not res!357915) (not e!326565))))

(declare-datatypes ((array!35583 0))(
  ( (array!35584 (arr!17086 (Array (_ BitVec 32) (_ BitVec 64))) (size!17450 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35583)

(declare-datatypes ((List!11073 0))(
  ( (Nil!11070) (Cons!11069 (h!12084 (_ BitVec 64)) (t!17293 List!11073)) )
))
(declare-fun arrayNoDuplicates!0 (array!35583 (_ BitVec 32) List!11073) Bool)

(assert (=> b!567433 (= res!357915 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11070))))

(declare-fun b!567434 () Bool)

(declare-fun res!357920 () Bool)

(declare-fun e!326566 () Bool)

(assert (=> b!567434 (=> (not res!357920) (not e!326566))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567434 (= res!357920 (validKeyInArray!0 (select (arr!17086 a!3118) j!142)))))

(declare-fun b!567435 () Bool)

(assert (=> b!567435 (= e!326566 e!326565)))

(declare-fun res!357921 () Bool)

(assert (=> b!567435 (=> (not res!357921) (not e!326565))))

(declare-datatypes ((SeekEntryResult!5491 0))(
  ( (MissingZero!5491 (index!24191 (_ BitVec 32))) (Found!5491 (index!24192 (_ BitVec 32))) (Intermediate!5491 (undefined!6303 Bool) (index!24193 (_ BitVec 32)) (x!53215 (_ BitVec 32))) (Undefined!5491) (MissingVacant!5491 (index!24194 (_ BitVec 32))) )
))
(declare-fun lt!258586 () SeekEntryResult!5491)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!567435 (= res!357921 (or (= lt!258586 (MissingZero!5491 i!1132)) (= lt!258586 (MissingVacant!5491 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35583 (_ BitVec 32)) SeekEntryResult!5491)

(assert (=> b!567435 (= lt!258586 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!357922 () Bool)

(assert (=> start!51942 (=> (not res!357922) (not e!326566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51942 (= res!357922 (validMask!0 mask!3119))))

(assert (=> start!51942 e!326566))

(assert (=> start!51942 true))

(declare-fun array_inv!12945 (array!35583) Bool)

(assert (=> start!51942 (array_inv!12945 a!3118)))

(declare-fun b!567436 () Bool)

(declare-fun res!357913 () Bool)

(assert (=> b!567436 (=> (not res!357913) (not e!326566))))

(declare-fun arrayContainsKey!0 (array!35583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567436 (= res!357913 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567437 () Bool)

(declare-fun res!357917 () Bool)

(assert (=> b!567437 (=> (not res!357917) (not e!326565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35583 (_ BitVec 32)) Bool)

(assert (=> b!567437 (= res!357917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567438 () Bool)

(declare-fun res!357916 () Bool)

(assert (=> b!567438 (=> (not res!357916) (not e!326566))))

(assert (=> b!567438 (= res!357916 (and (= (size!17450 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17450 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17450 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567439 () Bool)

(declare-fun res!357914 () Bool)

(assert (=> b!567439 (=> (not res!357914) (not e!326565))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35583 (_ BitVec 32)) SeekEntryResult!5491)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567439 (= res!357914 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17086 a!3118) j!142) mask!3119) (select (arr!17086 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17086 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17086 a!3118) i!1132 k0!1914) j!142) (array!35584 (store (arr!17086 a!3118) i!1132 k0!1914) (size!17450 a!3118)) mask!3119)))))

(declare-fun b!567440 () Bool)

(declare-fun res!357918 () Bool)

(assert (=> b!567440 (=> (not res!357918) (not e!326566))))

(assert (=> b!567440 (= res!357918 (validKeyInArray!0 k0!1914))))

(declare-fun b!567441 () Bool)

(assert (=> b!567441 (= e!326565 (not true))))

(declare-fun e!326567 () Bool)

(assert (=> b!567441 e!326567))

(declare-fun res!357919 () Bool)

(assert (=> b!567441 (=> (not res!357919) (not e!326567))))

(assert (=> b!567441 (= res!357919 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17755 0))(
  ( (Unit!17756) )
))
(declare-fun lt!258585 () Unit!17755)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17755)

(assert (=> b!567441 (= lt!258585 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567442 () Bool)

(assert (=> b!567442 (= e!326567 (= (seekEntryOrOpen!0 (select (arr!17086 a!3118) j!142) a!3118 mask!3119) (Found!5491 j!142)))))

(assert (= (and start!51942 res!357922) b!567438))

(assert (= (and b!567438 res!357916) b!567434))

(assert (= (and b!567434 res!357920) b!567440))

(assert (= (and b!567440 res!357918) b!567436))

(assert (= (and b!567436 res!357913) b!567435))

(assert (= (and b!567435 res!357921) b!567437))

(assert (= (and b!567437 res!357917) b!567433))

(assert (= (and b!567433 res!357915) b!567439))

(assert (= (and b!567439 res!357914) b!567441))

(assert (= (and b!567441 res!357919) b!567442))

(declare-fun m!546119 () Bool)

(assert (=> b!567435 m!546119))

(declare-fun m!546121 () Bool)

(assert (=> b!567441 m!546121))

(declare-fun m!546123 () Bool)

(assert (=> b!567441 m!546123))

(declare-fun m!546125 () Bool)

(assert (=> b!567436 m!546125))

(declare-fun m!546127 () Bool)

(assert (=> b!567442 m!546127))

(assert (=> b!567442 m!546127))

(declare-fun m!546129 () Bool)

(assert (=> b!567442 m!546129))

(declare-fun m!546131 () Bool)

(assert (=> b!567437 m!546131))

(assert (=> b!567434 m!546127))

(assert (=> b!567434 m!546127))

(declare-fun m!546133 () Bool)

(assert (=> b!567434 m!546133))

(declare-fun m!546135 () Bool)

(assert (=> start!51942 m!546135))

(declare-fun m!546137 () Bool)

(assert (=> start!51942 m!546137))

(declare-fun m!546139 () Bool)

(assert (=> b!567433 m!546139))

(declare-fun m!546141 () Bool)

(assert (=> b!567440 m!546141))

(assert (=> b!567439 m!546127))

(declare-fun m!546143 () Bool)

(assert (=> b!567439 m!546143))

(assert (=> b!567439 m!546127))

(declare-fun m!546145 () Bool)

(assert (=> b!567439 m!546145))

(declare-fun m!546147 () Bool)

(assert (=> b!567439 m!546147))

(assert (=> b!567439 m!546145))

(declare-fun m!546149 () Bool)

(assert (=> b!567439 m!546149))

(assert (=> b!567439 m!546143))

(assert (=> b!567439 m!546127))

(declare-fun m!546151 () Bool)

(assert (=> b!567439 m!546151))

(declare-fun m!546153 () Bool)

(assert (=> b!567439 m!546153))

(assert (=> b!567439 m!546145))

(assert (=> b!567439 m!546147))

(check-sat (not b!567434) (not b!567433) (not b!567436) (not b!567442) (not start!51942) (not b!567439) (not b!567437) (not b!567435) (not b!567441) (not b!567440))
(check-sat)
