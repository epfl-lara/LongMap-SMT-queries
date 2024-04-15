; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50228 () Bool)

(assert start!50228)

(declare-fun b!549686 () Bool)

(declare-fun res!342980 () Bool)

(declare-fun e!317354 () Bool)

(assert (=> b!549686 (=> (not res!342980) (not e!317354))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549686 (= res!342980 (validKeyInArray!0 k0!1914))))

(declare-fun b!549687 () Bool)

(declare-fun e!317355 () Bool)

(assert (=> b!549687 (= e!317355 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!34690 0))(
  ( (array!34691 (arr!16661 (Array (_ BitVec 32) (_ BitVec 64))) (size!17026 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34690)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34690 (_ BitVec 32)) Bool)

(assert (=> b!549687 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!16974 0))(
  ( (Unit!16975) )
))
(declare-fun lt!250146 () Unit!16974)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34690 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16974)

(assert (=> b!549687 (= lt!250146 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!549688 () Bool)

(declare-fun res!342975 () Bool)

(assert (=> b!549688 (=> (not res!342975) (not e!317355))))

(assert (=> b!549688 (= res!342975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549689 () Bool)

(declare-fun res!342972 () Bool)

(assert (=> b!549689 (=> (not res!342972) (not e!317354))))

(assert (=> b!549689 (= res!342972 (validKeyInArray!0 (select (arr!16661 a!3118) j!142)))))

(declare-fun b!549690 () Bool)

(declare-fun res!342978 () Bool)

(assert (=> b!549690 (=> (not res!342978) (not e!317354))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549690 (= res!342978 (and (= (size!17026 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17026 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17026 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!342974 () Bool)

(assert (=> start!50228 (=> (not res!342974) (not e!317354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50228 (= res!342974 (validMask!0 mask!3119))))

(assert (=> start!50228 e!317354))

(assert (=> start!50228 true))

(declare-fun array_inv!12544 (array!34690) Bool)

(assert (=> start!50228 (array_inv!12544 a!3118)))

(declare-fun b!549691 () Bool)

(assert (=> b!549691 (= e!317354 e!317355)))

(declare-fun res!342973 () Bool)

(assert (=> b!549691 (=> (not res!342973) (not e!317355))))

(declare-datatypes ((SeekEntryResult!5107 0))(
  ( (MissingZero!5107 (index!22655 (_ BitVec 32))) (Found!5107 (index!22656 (_ BitVec 32))) (Intermediate!5107 (undefined!5919 Bool) (index!22657 (_ BitVec 32)) (x!51592 (_ BitVec 32))) (Undefined!5107) (MissingVacant!5107 (index!22658 (_ BitVec 32))) )
))
(declare-fun lt!250147 () SeekEntryResult!5107)

(assert (=> b!549691 (= res!342973 (or (= lt!250147 (MissingZero!5107 i!1132)) (= lt!250147 (MissingVacant!5107 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34690 (_ BitVec 32)) SeekEntryResult!5107)

(assert (=> b!549691 (= lt!250147 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549692 () Bool)

(declare-fun res!342979 () Bool)

(assert (=> b!549692 (=> (not res!342979) (not e!317355))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34690 (_ BitVec 32)) SeekEntryResult!5107)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549692 (= res!342979 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16661 a!3118) j!142) mask!3119) (select (arr!16661 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16661 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16661 a!3118) i!1132 k0!1914) j!142) (array!34691 (store (arr!16661 a!3118) i!1132 k0!1914) (size!17026 a!3118)) mask!3119)))))

(declare-fun b!549693 () Bool)

(declare-fun res!342976 () Bool)

(assert (=> b!549693 (=> (not res!342976) (not e!317355))))

(declare-datatypes ((List!10780 0))(
  ( (Nil!10777) (Cons!10776 (h!11749 (_ BitVec 64)) (t!16999 List!10780)) )
))
(declare-fun arrayNoDuplicates!0 (array!34690 (_ BitVec 32) List!10780) Bool)

(assert (=> b!549693 (= res!342976 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10777))))

(declare-fun b!549694 () Bool)

(declare-fun res!342977 () Bool)

(assert (=> b!549694 (=> (not res!342977) (not e!317354))))

(declare-fun arrayContainsKey!0 (array!34690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549694 (= res!342977 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50228 res!342974) b!549690))

(assert (= (and b!549690 res!342978) b!549689))

(assert (= (and b!549689 res!342972) b!549686))

(assert (= (and b!549686 res!342980) b!549694))

(assert (= (and b!549694 res!342977) b!549691))

(assert (= (and b!549691 res!342973) b!549688))

(assert (= (and b!549688 res!342975) b!549693))

(assert (= (and b!549693 res!342976) b!549692))

(assert (= (and b!549692 res!342979) b!549687))

(declare-fun m!526163 () Bool)

(assert (=> b!549692 m!526163))

(declare-fun m!526165 () Bool)

(assert (=> b!549692 m!526165))

(assert (=> b!549692 m!526163))

(declare-fun m!526167 () Bool)

(assert (=> b!549692 m!526167))

(declare-fun m!526169 () Bool)

(assert (=> b!549692 m!526169))

(assert (=> b!549692 m!526167))

(declare-fun m!526171 () Bool)

(assert (=> b!549692 m!526171))

(assert (=> b!549692 m!526165))

(assert (=> b!549692 m!526163))

(declare-fun m!526173 () Bool)

(assert (=> b!549692 m!526173))

(declare-fun m!526175 () Bool)

(assert (=> b!549692 m!526175))

(assert (=> b!549692 m!526167))

(assert (=> b!549692 m!526169))

(declare-fun m!526177 () Bool)

(assert (=> b!549694 m!526177))

(declare-fun m!526179 () Bool)

(assert (=> start!50228 m!526179))

(declare-fun m!526181 () Bool)

(assert (=> start!50228 m!526181))

(declare-fun m!526183 () Bool)

(assert (=> b!549693 m!526183))

(declare-fun m!526185 () Bool)

(assert (=> b!549687 m!526185))

(declare-fun m!526187 () Bool)

(assert (=> b!549687 m!526187))

(assert (=> b!549689 m!526163))

(assert (=> b!549689 m!526163))

(declare-fun m!526189 () Bool)

(assert (=> b!549689 m!526189))

(declare-fun m!526191 () Bool)

(assert (=> b!549691 m!526191))

(declare-fun m!526193 () Bool)

(assert (=> b!549686 m!526193))

(declare-fun m!526195 () Bool)

(assert (=> b!549688 m!526195))

(check-sat (not b!549688) (not b!549692) (not b!549687) (not b!549694) (not start!50228) (not b!549689) (not b!549693) (not b!549686) (not b!549691))
(check-sat)
