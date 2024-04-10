; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50824 () Bool)

(assert start!50824)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!556139 () Bool)

(declare-datatypes ((array!35049 0))(
  ( (array!35050 (arr!16834 (Array (_ BitVec 32) (_ BitVec 64))) (size!17198 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35049)

(declare-fun e!320446 () Bool)

(declare-datatypes ((SeekEntryResult!5283 0))(
  ( (MissingZero!5283 (index!23359 (_ BitVec 32))) (Found!5283 (index!23360 (_ BitVec 32))) (Intermediate!5283 (undefined!6095 Bool) (index!23361 (_ BitVec 32)) (x!52253 (_ BitVec 32))) (Undefined!5283) (MissingVacant!5283 (index!23362 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35049 (_ BitVec 32)) SeekEntryResult!5283)

(assert (=> b!556139 (= e!320446 (= (seekEntryOrOpen!0 (select (arr!16834 a!3118) j!142) a!3118 mask!3119) (Found!5283 j!142)))))

(declare-fun b!556140 () Bool)

(declare-fun res!348559 () Bool)

(declare-fun e!320448 () Bool)

(assert (=> b!556140 (=> (not res!348559) (not e!320448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556140 (= res!348559 (validKeyInArray!0 (select (arr!16834 a!3118) j!142)))))

(declare-fun b!556141 () Bool)

(declare-fun res!348556 () Bool)

(declare-fun e!320447 () Bool)

(assert (=> b!556141 (=> (not res!348556) (not e!320447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35049 (_ BitVec 32)) Bool)

(assert (=> b!556141 (= res!348556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556142 () Bool)

(declare-fun res!348555 () Bool)

(assert (=> b!556142 (=> (not res!348555) (not e!320448))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556142 (= res!348555 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556143 () Bool)

(declare-fun res!348553 () Bool)

(assert (=> b!556143 (=> (not res!348553) (not e!320447))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35049 (_ BitVec 32)) SeekEntryResult!5283)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556143 (= res!348553 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16834 a!3118) j!142) mask!3119) (select (arr!16834 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16834 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16834 a!3118) i!1132 k0!1914) j!142) (array!35050 (store (arr!16834 a!3118) i!1132 k0!1914) (size!17198 a!3118)) mask!3119)))))

(declare-fun b!556144 () Bool)

(declare-fun res!348554 () Bool)

(assert (=> b!556144 (=> (not res!348554) (not e!320448))))

(assert (=> b!556144 (= res!348554 (validKeyInArray!0 k0!1914))))

(declare-fun b!556145 () Bool)

(declare-fun res!348558 () Bool)

(assert (=> b!556145 (=> (not res!348558) (not e!320447))))

(declare-datatypes ((List!10914 0))(
  ( (Nil!10911) (Cons!10910 (h!11895 (_ BitVec 64)) (t!17142 List!10914)) )
))
(declare-fun arrayNoDuplicates!0 (array!35049 (_ BitVec 32) List!10914) Bool)

(assert (=> b!556145 (= res!348558 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10911))))

(declare-fun b!556146 () Bool)

(declare-fun res!348560 () Bool)

(assert (=> b!556146 (=> (not res!348560) (not e!320448))))

(assert (=> b!556146 (= res!348560 (and (= (size!17198 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17198 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17198 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!348557 () Bool)

(assert (=> start!50824 (=> (not res!348557) (not e!320448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50824 (= res!348557 (validMask!0 mask!3119))))

(assert (=> start!50824 e!320448))

(assert (=> start!50824 true))

(declare-fun array_inv!12630 (array!35049) Bool)

(assert (=> start!50824 (array_inv!12630 a!3118)))

(declare-fun b!556147 () Bool)

(assert (=> b!556147 (= e!320447 (not true))))

(assert (=> b!556147 e!320446))

(declare-fun res!348552 () Bool)

(assert (=> b!556147 (=> (not res!348552) (not e!320446))))

(assert (=> b!556147 (= res!348552 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17340 0))(
  ( (Unit!17341) )
))
(declare-fun lt!252802 () Unit!17340)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35049 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17340)

(assert (=> b!556147 (= lt!252802 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556148 () Bool)

(assert (=> b!556148 (= e!320448 e!320447)))

(declare-fun res!348551 () Bool)

(assert (=> b!556148 (=> (not res!348551) (not e!320447))))

(declare-fun lt!252801 () SeekEntryResult!5283)

(assert (=> b!556148 (= res!348551 (or (= lt!252801 (MissingZero!5283 i!1132)) (= lt!252801 (MissingVacant!5283 i!1132))))))

(assert (=> b!556148 (= lt!252801 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50824 res!348557) b!556146))

(assert (= (and b!556146 res!348560) b!556140))

(assert (= (and b!556140 res!348559) b!556144))

(assert (= (and b!556144 res!348554) b!556142))

(assert (= (and b!556142 res!348555) b!556148))

(assert (= (and b!556148 res!348551) b!556141))

(assert (= (and b!556141 res!348556) b!556145))

(assert (= (and b!556145 res!348558) b!556143))

(assert (= (and b!556143 res!348553) b!556147))

(assert (= (and b!556147 res!348552) b!556139))

(declare-fun m!534069 () Bool)

(assert (=> b!556145 m!534069))

(declare-fun m!534071 () Bool)

(assert (=> b!556140 m!534071))

(assert (=> b!556140 m!534071))

(declare-fun m!534073 () Bool)

(assert (=> b!556140 m!534073))

(assert (=> b!556143 m!534071))

(declare-fun m!534075 () Bool)

(assert (=> b!556143 m!534075))

(assert (=> b!556143 m!534071))

(declare-fun m!534077 () Bool)

(assert (=> b!556143 m!534077))

(declare-fun m!534079 () Bool)

(assert (=> b!556143 m!534079))

(assert (=> b!556143 m!534077))

(declare-fun m!534081 () Bool)

(assert (=> b!556143 m!534081))

(assert (=> b!556143 m!534075))

(assert (=> b!556143 m!534071))

(declare-fun m!534083 () Bool)

(assert (=> b!556143 m!534083))

(declare-fun m!534085 () Bool)

(assert (=> b!556143 m!534085))

(assert (=> b!556143 m!534077))

(assert (=> b!556143 m!534079))

(declare-fun m!534087 () Bool)

(assert (=> b!556142 m!534087))

(declare-fun m!534089 () Bool)

(assert (=> b!556144 m!534089))

(declare-fun m!534091 () Bool)

(assert (=> b!556147 m!534091))

(declare-fun m!534093 () Bool)

(assert (=> b!556147 m!534093))

(assert (=> b!556139 m!534071))

(assert (=> b!556139 m!534071))

(declare-fun m!534095 () Bool)

(assert (=> b!556139 m!534095))

(declare-fun m!534097 () Bool)

(assert (=> b!556141 m!534097))

(declare-fun m!534099 () Bool)

(assert (=> start!50824 m!534099))

(declare-fun m!534101 () Bool)

(assert (=> start!50824 m!534101))

(declare-fun m!534103 () Bool)

(assert (=> b!556148 m!534103))

(check-sat (not b!556140) (not b!556141) (not b!556145) (not b!556144) (not b!556142) (not b!556139) (not b!556143) (not b!556147) (not start!50824) (not b!556148))
(check-sat)
