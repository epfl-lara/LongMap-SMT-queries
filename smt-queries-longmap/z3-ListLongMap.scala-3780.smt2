; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51780 () Bool)

(assert start!51780)

(declare-fun b!566203 () Bool)

(declare-fun res!357074 () Bool)

(declare-fun e!325917 () Bool)

(assert (=> b!566203 (=> (not res!357074) (not e!325917))))

(declare-datatypes ((array!35535 0))(
  ( (array!35536 (arr!17065 (Array (_ BitVec 32) (_ BitVec 64))) (size!17429 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35535)

(declare-datatypes ((List!11052 0))(
  ( (Nil!11049) (Cons!11048 (h!12057 (_ BitVec 64)) (t!17272 List!11052)) )
))
(declare-fun arrayNoDuplicates!0 (array!35535 (_ BitVec 32) List!11052) Bool)

(assert (=> b!566203 (= res!357074 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11049))))

(declare-fun b!566204 () Bool)

(declare-fun res!357072 () Bool)

(declare-fun e!325916 () Bool)

(assert (=> b!566204 (=> (not res!357072) (not e!325916))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566204 (= res!357072 (validKeyInArray!0 (select (arr!17065 a!3118) j!142)))))

(declare-fun b!566205 () Bool)

(assert (=> b!566205 (= e!325916 e!325917)))

(declare-fun res!357068 () Bool)

(assert (=> b!566205 (=> (not res!357068) (not e!325917))))

(declare-datatypes ((SeekEntryResult!5470 0))(
  ( (MissingZero!5470 (index!24107 (_ BitVec 32))) (Found!5470 (index!24108 (_ BitVec 32))) (Intermediate!5470 (undefined!6282 Bool) (index!24109 (_ BitVec 32)) (x!53126 (_ BitVec 32))) (Undefined!5470) (MissingVacant!5470 (index!24110 (_ BitVec 32))) )
))
(declare-fun lt!258112 () SeekEntryResult!5470)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!566205 (= res!357068 (or (= lt!258112 (MissingZero!5470 i!1132)) (= lt!258112 (MissingVacant!5470 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35535 (_ BitVec 32)) SeekEntryResult!5470)

(assert (=> b!566205 (= lt!258112 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!357071 () Bool)

(assert (=> start!51780 (=> (not res!357071) (not e!325916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51780 (= res!357071 (validMask!0 mask!3119))))

(assert (=> start!51780 e!325916))

(assert (=> start!51780 true))

(declare-fun array_inv!12924 (array!35535) Bool)

(assert (=> start!51780 (array_inv!12924 a!3118)))

(declare-fun b!566206 () Bool)

(declare-fun res!357069 () Bool)

(assert (=> b!566206 (=> (not res!357069) (not e!325916))))

(assert (=> b!566206 (= res!357069 (and (= (size!17429 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17429 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17429 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566207 () Bool)

(assert (=> b!566207 (= e!325917 (not true))))

(declare-fun e!325915 () Bool)

(assert (=> b!566207 e!325915))

(declare-fun res!357075 () Bool)

(assert (=> b!566207 (=> (not res!357075) (not e!325915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35535 (_ BitVec 32)) Bool)

(assert (=> b!566207 (= res!357075 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17713 0))(
  ( (Unit!17714) )
))
(declare-fun lt!258111 () Unit!17713)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35535 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17713)

(assert (=> b!566207 (= lt!258111 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566208 () Bool)

(assert (=> b!566208 (= e!325915 (= (seekEntryOrOpen!0 (select (arr!17065 a!3118) j!142) a!3118 mask!3119) (Found!5470 j!142)))))

(declare-fun b!566209 () Bool)

(declare-fun res!357070 () Bool)

(assert (=> b!566209 (=> (not res!357070) (not e!325916))))

(assert (=> b!566209 (= res!357070 (validKeyInArray!0 k0!1914))))

(declare-fun b!566210 () Bool)

(declare-fun res!357073 () Bool)

(assert (=> b!566210 (=> (not res!357073) (not e!325916))))

(declare-fun arrayContainsKey!0 (array!35535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566210 (= res!357073 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566211 () Bool)

(declare-fun res!357076 () Bool)

(assert (=> b!566211 (=> (not res!357076) (not e!325917))))

(assert (=> b!566211 (= res!357076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566212 () Bool)

(declare-fun res!357067 () Bool)

(assert (=> b!566212 (=> (not res!357067) (not e!325917))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35535 (_ BitVec 32)) SeekEntryResult!5470)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566212 (= res!357067 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17065 a!3118) j!142) mask!3119) (select (arr!17065 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17065 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17065 a!3118) i!1132 k0!1914) j!142) (array!35536 (store (arr!17065 a!3118) i!1132 k0!1914) (size!17429 a!3118)) mask!3119)))))

(assert (= (and start!51780 res!357071) b!566206))

(assert (= (and b!566206 res!357069) b!566204))

(assert (= (and b!566204 res!357072) b!566209))

(assert (= (and b!566209 res!357070) b!566210))

(assert (= (and b!566210 res!357073) b!566205))

(assert (= (and b!566205 res!357068) b!566211))

(assert (= (and b!566211 res!357076) b!566203))

(assert (= (and b!566203 res!357074) b!566212))

(assert (= (and b!566212 res!357067) b!566207))

(assert (= (and b!566207 res!357075) b!566208))

(declare-fun m!544913 () Bool)

(assert (=> b!566210 m!544913))

(declare-fun m!544915 () Bool)

(assert (=> b!566207 m!544915))

(declare-fun m!544917 () Bool)

(assert (=> b!566207 m!544917))

(declare-fun m!544919 () Bool)

(assert (=> start!51780 m!544919))

(declare-fun m!544921 () Bool)

(assert (=> start!51780 m!544921))

(declare-fun m!544923 () Bool)

(assert (=> b!566204 m!544923))

(assert (=> b!566204 m!544923))

(declare-fun m!544925 () Bool)

(assert (=> b!566204 m!544925))

(declare-fun m!544927 () Bool)

(assert (=> b!566203 m!544927))

(assert (=> b!566212 m!544923))

(declare-fun m!544929 () Bool)

(assert (=> b!566212 m!544929))

(assert (=> b!566212 m!544923))

(declare-fun m!544931 () Bool)

(assert (=> b!566212 m!544931))

(declare-fun m!544933 () Bool)

(assert (=> b!566212 m!544933))

(assert (=> b!566212 m!544931))

(declare-fun m!544935 () Bool)

(assert (=> b!566212 m!544935))

(assert (=> b!566212 m!544929))

(assert (=> b!566212 m!544923))

(declare-fun m!544937 () Bool)

(assert (=> b!566212 m!544937))

(declare-fun m!544939 () Bool)

(assert (=> b!566212 m!544939))

(assert (=> b!566212 m!544931))

(assert (=> b!566212 m!544933))

(declare-fun m!544941 () Bool)

(assert (=> b!566211 m!544941))

(declare-fun m!544943 () Bool)

(assert (=> b!566209 m!544943))

(declare-fun m!544945 () Bool)

(assert (=> b!566205 m!544945))

(assert (=> b!566208 m!544923))

(assert (=> b!566208 m!544923))

(declare-fun m!544947 () Bool)

(assert (=> b!566208 m!544947))

(check-sat (not b!566211) (not b!566208) (not b!566205) (not b!566210) (not b!566207) (not b!566203) (not b!566204) (not b!566212) (not b!566209) (not start!51780))
(check-sat)
