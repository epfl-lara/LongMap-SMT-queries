; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50564 () Bool)

(assert start!50564)

(declare-fun b!552274 () Bool)

(declare-fun res!344832 () Bool)

(declare-fun e!318675 () Bool)

(assert (=> b!552274 (=> (not res!344832) (not e!318675))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552274 (= res!344832 (validKeyInArray!0 k0!1914))))

(declare-fun b!552275 () Bool)

(declare-fun res!344833 () Bool)

(declare-fun e!318677 () Bool)

(assert (=> b!552275 (=> (not res!344833) (not e!318677))))

(declare-datatypes ((array!34798 0))(
  ( (array!34799 (arr!16709 (Array (_ BitVec 32) (_ BitVec 64))) (size!17074 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34798)

(declare-datatypes ((List!10828 0))(
  ( (Nil!10825) (Cons!10824 (h!11809 (_ BitVec 64)) (t!17047 List!10828)) )
))
(declare-fun arrayNoDuplicates!0 (array!34798 (_ BitVec 32) List!10828) Bool)

(assert (=> b!552275 (= res!344833 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10825))))

(declare-fun b!552276 () Bool)

(declare-fun res!344836 () Bool)

(assert (=> b!552276 (=> (not res!344836) (not e!318677))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34798 (_ BitVec 32)) Bool)

(assert (=> b!552276 (= res!344836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552277 () Bool)

(declare-fun res!344834 () Bool)

(assert (=> b!552277 (=> (not res!344834) (not e!318675))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552277 (= res!344834 (and (= (size!17074 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17074 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17074 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552278 () Bool)

(declare-fun res!344831 () Bool)

(assert (=> b!552278 (=> (not res!344831) (not e!318677))))

(declare-datatypes ((SeekEntryResult!5155 0))(
  ( (MissingZero!5155 (index!22847 (_ BitVec 32))) (Found!5155 (index!22848 (_ BitVec 32))) (Intermediate!5155 (undefined!5967 Bool) (index!22849 (_ BitVec 32)) (x!51792 (_ BitVec 32))) (Undefined!5155) (MissingVacant!5155 (index!22850 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34798 (_ BitVec 32)) SeekEntryResult!5155)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552278 (= res!344831 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16709 a!3118) j!142) mask!3119) (select (arr!16709 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16709 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16709 a!3118) i!1132 k0!1914) j!142) (array!34799 (store (arr!16709 a!3118) i!1132 k0!1914) (size!17074 a!3118)) mask!3119)))))

(declare-fun b!552279 () Bool)

(declare-fun e!318676 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34798 (_ BitVec 32)) SeekEntryResult!5155)

(assert (=> b!552279 (= e!318676 (= (seekEntryOrOpen!0 (select (arr!16709 a!3118) j!142) a!3118 mask!3119) (Found!5155 j!142)))))

(declare-fun b!552280 () Bool)

(declare-fun res!344829 () Bool)

(assert (=> b!552280 (=> (not res!344829) (not e!318675))))

(assert (=> b!552280 (= res!344829 (validKeyInArray!0 (select (arr!16709 a!3118) j!142)))))

(declare-fun b!552281 () Bool)

(assert (=> b!552281 (= e!318675 e!318677)))

(declare-fun res!344835 () Bool)

(assert (=> b!552281 (=> (not res!344835) (not e!318677))))

(declare-fun lt!250977 () SeekEntryResult!5155)

(assert (=> b!552281 (= res!344835 (or (= lt!250977 (MissingZero!5155 i!1132)) (= lt!250977 (MissingVacant!5155 i!1132))))))

(assert (=> b!552281 (= lt!250977 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!344828 () Bool)

(assert (=> start!50564 (=> (not res!344828) (not e!318675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50564 (= res!344828 (validMask!0 mask!3119))))

(assert (=> start!50564 e!318675))

(assert (=> start!50564 true))

(declare-fun array_inv!12592 (array!34798) Bool)

(assert (=> start!50564 (array_inv!12592 a!3118)))

(declare-fun b!552282 () Bool)

(assert (=> b!552282 (= e!318677 (not true))))

(assert (=> b!552282 e!318676))

(declare-fun res!344837 () Bool)

(assert (=> b!552282 (=> (not res!344837) (not e!318676))))

(assert (=> b!552282 (= res!344837 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17070 0))(
  ( (Unit!17071) )
))
(declare-fun lt!250978 () Unit!17070)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34798 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17070)

(assert (=> b!552282 (= lt!250978 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552283 () Bool)

(declare-fun res!344830 () Bool)

(assert (=> b!552283 (=> (not res!344830) (not e!318675))))

(declare-fun arrayContainsKey!0 (array!34798 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552283 (= res!344830 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50564 res!344828) b!552277))

(assert (= (and b!552277 res!344834) b!552280))

(assert (= (and b!552280 res!344829) b!552274))

(assert (= (and b!552274 res!344832) b!552283))

(assert (= (and b!552283 res!344830) b!552281))

(assert (= (and b!552281 res!344835) b!552276))

(assert (= (and b!552276 res!344836) b!552275))

(assert (= (and b!552275 res!344833) b!552278))

(assert (= (and b!552278 res!344831) b!552282))

(assert (= (and b!552282 res!344837) b!552279))

(declare-fun m!528683 () Bool)

(assert (=> b!552278 m!528683))

(declare-fun m!528685 () Bool)

(assert (=> b!552278 m!528685))

(assert (=> b!552278 m!528683))

(declare-fun m!528687 () Bool)

(assert (=> b!552278 m!528687))

(declare-fun m!528689 () Bool)

(assert (=> b!552278 m!528689))

(assert (=> b!552278 m!528687))

(declare-fun m!528691 () Bool)

(assert (=> b!552278 m!528691))

(assert (=> b!552278 m!528685))

(assert (=> b!552278 m!528683))

(declare-fun m!528693 () Bool)

(assert (=> b!552278 m!528693))

(declare-fun m!528695 () Bool)

(assert (=> b!552278 m!528695))

(assert (=> b!552278 m!528687))

(assert (=> b!552278 m!528689))

(declare-fun m!528697 () Bool)

(assert (=> start!50564 m!528697))

(declare-fun m!528699 () Bool)

(assert (=> start!50564 m!528699))

(assert (=> b!552280 m!528683))

(assert (=> b!552280 m!528683))

(declare-fun m!528701 () Bool)

(assert (=> b!552280 m!528701))

(declare-fun m!528703 () Bool)

(assert (=> b!552281 m!528703))

(declare-fun m!528705 () Bool)

(assert (=> b!552274 m!528705))

(declare-fun m!528707 () Bool)

(assert (=> b!552283 m!528707))

(declare-fun m!528709 () Bool)

(assert (=> b!552276 m!528709))

(declare-fun m!528711 () Bool)

(assert (=> b!552282 m!528711))

(declare-fun m!528713 () Bool)

(assert (=> b!552282 m!528713))

(assert (=> b!552279 m!528683))

(assert (=> b!552279 m!528683))

(declare-fun m!528715 () Bool)

(assert (=> b!552279 m!528715))

(declare-fun m!528717 () Bool)

(assert (=> b!552275 m!528717))

(check-sat (not b!552278) (not b!552281) (not b!552282) (not b!552283) (not b!552274) (not b!552276) (not b!552279) (not b!552275) (not b!552280) (not start!50564))
(check-sat)
