; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50222 () Bool)

(assert start!50222)

(declare-fun b!549605 () Bool)

(declare-fun res!342897 () Bool)

(declare-fun e!317328 () Bool)

(assert (=> b!549605 (=> (not res!342897) (not e!317328))))

(declare-datatypes ((array!34684 0))(
  ( (array!34685 (arr!16658 (Array (_ BitVec 32) (_ BitVec 64))) (size!17023 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34684)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34684 (_ BitVec 32)) Bool)

(assert (=> b!549605 (= res!342897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549606 () Bool)

(declare-fun res!342896 () Bool)

(declare-fun e!317327 () Bool)

(assert (=> b!549606 (=> (not res!342896) (not e!317327))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549606 (= res!342896 (validKeyInArray!0 (select (arr!16658 a!3118) j!142)))))

(declare-fun b!549607 () Bool)

(assert (=> b!549607 (= e!317328 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!549607 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!16968 0))(
  ( (Unit!16969) )
))
(declare-fun lt!250128 () Unit!16968)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34684 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16968)

(assert (=> b!549607 (= lt!250128 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!549608 () Bool)

(declare-fun res!342894 () Bool)

(assert (=> b!549608 (=> (not res!342894) (not e!317327))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!549608 (= res!342894 (validKeyInArray!0 k0!1914))))

(declare-fun b!549609 () Bool)

(assert (=> b!549609 (= e!317327 e!317328)))

(declare-fun res!342898 () Bool)

(assert (=> b!549609 (=> (not res!342898) (not e!317328))))

(declare-datatypes ((SeekEntryResult!5104 0))(
  ( (MissingZero!5104 (index!22643 (_ BitVec 32))) (Found!5104 (index!22644 (_ BitVec 32))) (Intermediate!5104 (undefined!5916 Bool) (index!22645 (_ BitVec 32)) (x!51581 (_ BitVec 32))) (Undefined!5104) (MissingVacant!5104 (index!22646 (_ BitVec 32))) )
))
(declare-fun lt!250129 () SeekEntryResult!5104)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549609 (= res!342898 (or (= lt!250129 (MissingZero!5104 i!1132)) (= lt!250129 (MissingVacant!5104 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34684 (_ BitVec 32)) SeekEntryResult!5104)

(assert (=> b!549609 (= lt!250129 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549610 () Bool)

(declare-fun res!342899 () Bool)

(assert (=> b!549610 (=> (not res!342899) (not e!317327))))

(declare-fun arrayContainsKey!0 (array!34684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549610 (= res!342899 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!342891 () Bool)

(assert (=> start!50222 (=> (not res!342891) (not e!317327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50222 (= res!342891 (validMask!0 mask!3119))))

(assert (=> start!50222 e!317327))

(assert (=> start!50222 true))

(declare-fun array_inv!12541 (array!34684) Bool)

(assert (=> start!50222 (array_inv!12541 a!3118)))

(declare-fun b!549611 () Bool)

(declare-fun res!342892 () Bool)

(assert (=> b!549611 (=> (not res!342892) (not e!317327))))

(assert (=> b!549611 (= res!342892 (and (= (size!17023 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17023 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17023 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549612 () Bool)

(declare-fun res!342893 () Bool)

(assert (=> b!549612 (=> (not res!342893) (not e!317328))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34684 (_ BitVec 32)) SeekEntryResult!5104)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549612 (= res!342893 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16658 a!3118) j!142) mask!3119) (select (arr!16658 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16658 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16658 a!3118) i!1132 k0!1914) j!142) (array!34685 (store (arr!16658 a!3118) i!1132 k0!1914) (size!17023 a!3118)) mask!3119)))))

(declare-fun b!549613 () Bool)

(declare-fun res!342895 () Bool)

(assert (=> b!549613 (=> (not res!342895) (not e!317328))))

(declare-datatypes ((List!10777 0))(
  ( (Nil!10774) (Cons!10773 (h!11746 (_ BitVec 64)) (t!16996 List!10777)) )
))
(declare-fun arrayNoDuplicates!0 (array!34684 (_ BitVec 32) List!10777) Bool)

(assert (=> b!549613 (= res!342895 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10774))))

(assert (= (and start!50222 res!342891) b!549611))

(assert (= (and b!549611 res!342892) b!549606))

(assert (= (and b!549606 res!342896) b!549608))

(assert (= (and b!549608 res!342894) b!549610))

(assert (= (and b!549610 res!342899) b!549609))

(assert (= (and b!549609 res!342898) b!549605))

(assert (= (and b!549605 res!342897) b!549613))

(assert (= (and b!549613 res!342895) b!549612))

(assert (= (and b!549612 res!342893) b!549607))

(declare-fun m!526061 () Bool)

(assert (=> b!549608 m!526061))

(declare-fun m!526063 () Bool)

(assert (=> start!50222 m!526063))

(declare-fun m!526065 () Bool)

(assert (=> start!50222 m!526065))

(declare-fun m!526067 () Bool)

(assert (=> b!549606 m!526067))

(assert (=> b!549606 m!526067))

(declare-fun m!526069 () Bool)

(assert (=> b!549606 m!526069))

(assert (=> b!549612 m!526067))

(declare-fun m!526071 () Bool)

(assert (=> b!549612 m!526071))

(assert (=> b!549612 m!526067))

(declare-fun m!526073 () Bool)

(assert (=> b!549612 m!526073))

(declare-fun m!526075 () Bool)

(assert (=> b!549612 m!526075))

(assert (=> b!549612 m!526073))

(declare-fun m!526077 () Bool)

(assert (=> b!549612 m!526077))

(assert (=> b!549612 m!526071))

(assert (=> b!549612 m!526067))

(declare-fun m!526079 () Bool)

(assert (=> b!549612 m!526079))

(declare-fun m!526081 () Bool)

(assert (=> b!549612 m!526081))

(assert (=> b!549612 m!526073))

(assert (=> b!549612 m!526075))

(declare-fun m!526083 () Bool)

(assert (=> b!549609 m!526083))

(declare-fun m!526085 () Bool)

(assert (=> b!549613 m!526085))

(declare-fun m!526087 () Bool)

(assert (=> b!549605 m!526087))

(declare-fun m!526089 () Bool)

(assert (=> b!549610 m!526089))

(declare-fun m!526091 () Bool)

(assert (=> b!549607 m!526091))

(declare-fun m!526093 () Bool)

(assert (=> b!549607 m!526093))

(check-sat (not b!549607) (not b!549606) (not b!549612) (not b!549610) (not b!549613) (not b!549608) (not b!549605) (not b!549609) (not start!50222))
(check-sat)
