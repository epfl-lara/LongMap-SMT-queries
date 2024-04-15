; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50684 () Bool)

(assert start!50684)

(declare-fun res!346656 () Bool)

(declare-fun e!319497 () Bool)

(assert (=> start!50684 (=> (not res!346656) (not e!319497))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50684 (= res!346656 (validMask!0 mask!3119))))

(assert (=> start!50684 e!319497))

(assert (=> start!50684 true))

(declare-datatypes ((array!34918 0))(
  ( (array!34919 (arr!16769 (Array (_ BitVec 32) (_ BitVec 64))) (size!17134 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34918)

(declare-fun array_inv!12652 (array!34918) Bool)

(assert (=> start!50684 (array_inv!12652 a!3118)))

(declare-fun b!554101 () Bool)

(declare-fun res!346664 () Bool)

(declare-fun e!319495 () Bool)

(assert (=> b!554101 (=> (not res!346664) (not e!319495))))

(declare-datatypes ((List!10888 0))(
  ( (Nil!10885) (Cons!10884 (h!11869 (_ BitVec 64)) (t!17107 List!10888)) )
))
(declare-fun arrayNoDuplicates!0 (array!34918 (_ BitVec 32) List!10888) Bool)

(assert (=> b!554101 (= res!346664 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10885))))

(declare-fun b!554102 () Bool)

(declare-fun res!346661 () Bool)

(assert (=> b!554102 (=> (not res!346661) (not e!319497))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554102 (= res!346661 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554103 () Bool)

(declare-fun res!346662 () Bool)

(assert (=> b!554103 (=> (not res!346662) (not e!319495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34918 (_ BitVec 32)) Bool)

(assert (=> b!554103 (= res!346662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554104 () Bool)

(declare-fun res!346660 () Bool)

(assert (=> b!554104 (=> (not res!346660) (not e!319495))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5215 0))(
  ( (MissingZero!5215 (index!23087 (_ BitVec 32))) (Found!5215 (index!23088 (_ BitVec 32))) (Intermediate!5215 (undefined!6027 Bool) (index!23089 (_ BitVec 32)) (x!52012 (_ BitVec 32))) (Undefined!5215) (MissingVacant!5215 (index!23090 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34918 (_ BitVec 32)) SeekEntryResult!5215)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554104 (= res!346660 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16769 a!3118) j!142) mask!3119) (select (arr!16769 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16769 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16769 a!3118) i!1132 k0!1914) j!142) (array!34919 (store (arr!16769 a!3118) i!1132 k0!1914) (size!17134 a!3118)) mask!3119)))))

(declare-fun b!554105 () Bool)

(declare-fun res!346658 () Bool)

(assert (=> b!554105 (=> (not res!346658) (not e!319497))))

(assert (=> b!554105 (= res!346658 (and (= (size!17134 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17134 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17134 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554106 () Bool)

(assert (=> b!554106 (= e!319497 e!319495)))

(declare-fun res!346659 () Bool)

(assert (=> b!554106 (=> (not res!346659) (not e!319495))))

(declare-fun lt!251545 () SeekEntryResult!5215)

(assert (=> b!554106 (= res!346659 (or (= lt!251545 (MissingZero!5215 i!1132)) (= lt!251545 (MissingVacant!5215 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34918 (_ BitVec 32)) SeekEntryResult!5215)

(assert (=> b!554106 (= lt!251545 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554107 () Bool)

(declare-fun e!319496 () Bool)

(assert (=> b!554107 (= e!319496 (= (seekEntryOrOpen!0 (select (arr!16769 a!3118) j!142) a!3118 mask!3119) (Found!5215 j!142)))))

(declare-fun b!554108 () Bool)

(declare-fun res!346657 () Bool)

(assert (=> b!554108 (=> (not res!346657) (not e!319497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554108 (= res!346657 (validKeyInArray!0 (select (arr!16769 a!3118) j!142)))))

(declare-fun b!554109 () Bool)

(assert (=> b!554109 (= e!319495 (not true))))

(assert (=> b!554109 e!319496))

(declare-fun res!346663 () Bool)

(assert (=> b!554109 (=> (not res!346663) (not e!319496))))

(assert (=> b!554109 (= res!346663 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17190 0))(
  ( (Unit!17191) )
))
(declare-fun lt!251544 () Unit!17190)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17190)

(assert (=> b!554109 (= lt!251544 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554110 () Bool)

(declare-fun res!346655 () Bool)

(assert (=> b!554110 (=> (not res!346655) (not e!319497))))

(assert (=> b!554110 (= res!346655 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50684 res!346656) b!554105))

(assert (= (and b!554105 res!346658) b!554108))

(assert (= (and b!554108 res!346657) b!554110))

(assert (= (and b!554110 res!346655) b!554102))

(assert (= (and b!554102 res!346661) b!554106))

(assert (= (and b!554106 res!346659) b!554103))

(assert (= (and b!554103 res!346662) b!554101))

(assert (= (and b!554101 res!346664) b!554104))

(assert (= (and b!554104 res!346660) b!554109))

(assert (= (and b!554109 res!346663) b!554107))

(declare-fun m!530885 () Bool)

(assert (=> b!554110 m!530885))

(declare-fun m!530887 () Bool)

(assert (=> b!554103 m!530887))

(declare-fun m!530889 () Bool)

(assert (=> b!554108 m!530889))

(assert (=> b!554108 m!530889))

(declare-fun m!530891 () Bool)

(assert (=> b!554108 m!530891))

(assert (=> b!554104 m!530889))

(declare-fun m!530893 () Bool)

(assert (=> b!554104 m!530893))

(assert (=> b!554104 m!530889))

(declare-fun m!530895 () Bool)

(assert (=> b!554104 m!530895))

(declare-fun m!530897 () Bool)

(assert (=> b!554104 m!530897))

(assert (=> b!554104 m!530895))

(declare-fun m!530899 () Bool)

(assert (=> b!554104 m!530899))

(assert (=> b!554104 m!530893))

(assert (=> b!554104 m!530889))

(declare-fun m!530901 () Bool)

(assert (=> b!554104 m!530901))

(declare-fun m!530903 () Bool)

(assert (=> b!554104 m!530903))

(assert (=> b!554104 m!530895))

(assert (=> b!554104 m!530897))

(assert (=> b!554107 m!530889))

(assert (=> b!554107 m!530889))

(declare-fun m!530905 () Bool)

(assert (=> b!554107 m!530905))

(declare-fun m!530907 () Bool)

(assert (=> start!50684 m!530907))

(declare-fun m!530909 () Bool)

(assert (=> start!50684 m!530909))

(declare-fun m!530911 () Bool)

(assert (=> b!554101 m!530911))

(declare-fun m!530913 () Bool)

(assert (=> b!554102 m!530913))

(declare-fun m!530915 () Bool)

(assert (=> b!554109 m!530915))

(declare-fun m!530917 () Bool)

(assert (=> b!554109 m!530917))

(declare-fun m!530919 () Bool)

(assert (=> b!554106 m!530919))

(check-sat (not b!554101) (not b!554108) (not b!554103) (not b!554106) (not b!554107) (not b!554102) (not b!554110) (not b!554104) (not start!50684) (not b!554109))
(check-sat)
