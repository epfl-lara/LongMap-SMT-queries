; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51890 () Bool)

(assert start!51890)

(declare-fun b!567052 () Bool)

(declare-fun res!357782 () Bool)

(declare-fun e!326301 () Bool)

(assert (=> b!567052 (=> (not res!357782) (not e!326301))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567052 (= res!357782 (validKeyInArray!0 k0!1914))))

(declare-fun b!567053 () Bool)

(declare-fun e!326299 () Bool)

(assert (=> b!567053 (= e!326301 e!326299)))

(declare-fun res!357786 () Bool)

(assert (=> b!567053 (=> (not res!357786) (not e!326299))))

(declare-datatypes ((SeekEntryResult!5539 0))(
  ( (MissingZero!5539 (index!24383 (_ BitVec 32))) (Found!5539 (index!24384 (_ BitVec 32))) (Intermediate!5539 (undefined!6351 Bool) (index!24385 (_ BitVec 32)) (x!53263 (_ BitVec 32))) (Undefined!5539) (MissingVacant!5539 (index!24386 (_ BitVec 32))) )
))
(declare-fun lt!258259 () SeekEntryResult!5539)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!567053 (= res!357786 (or (= lt!258259 (MissingZero!5539 i!1132)) (= lt!258259 (MissingVacant!5539 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35593 0))(
  ( (array!35594 (arr!17093 (Array (_ BitVec 32) (_ BitVec 64))) (size!17458 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35593)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35593 (_ BitVec 32)) SeekEntryResult!5539)

(assert (=> b!567053 (= lt!258259 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!567054 () Bool)

(declare-fun res!357783 () Bool)

(assert (=> b!567054 (=> (not res!357783) (not e!326299))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35593 (_ BitVec 32)) SeekEntryResult!5539)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567054 (= res!357783 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17093 a!3118) j!142) mask!3119) (select (arr!17093 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17093 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17093 a!3118) i!1132 k0!1914) j!142) (array!35594 (store (arr!17093 a!3118) i!1132 k0!1914) (size!17458 a!3118)) mask!3119)))))

(declare-fun b!567055 () Bool)

(declare-fun res!357779 () Bool)

(assert (=> b!567055 (=> (not res!357779) (not e!326299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35593 (_ BitVec 32)) Bool)

(assert (=> b!567055 (= res!357779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567056 () Bool)

(declare-fun res!357784 () Bool)

(assert (=> b!567056 (=> (not res!357784) (not e!326299))))

(declare-datatypes ((List!11212 0))(
  ( (Nil!11209) (Cons!11208 (h!12220 (_ BitVec 64)) (t!17431 List!11212)) )
))
(declare-fun arrayNoDuplicates!0 (array!35593 (_ BitVec 32) List!11212) Bool)

(assert (=> b!567056 (= res!357784 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11209))))

(declare-fun b!567057 () Bool)

(declare-fun res!357785 () Bool)

(assert (=> b!567057 (=> (not res!357785) (not e!326301))))

(assert (=> b!567057 (= res!357785 (validKeyInArray!0 (select (arr!17093 a!3118) j!142)))))

(declare-fun b!567058 () Bool)

(assert (=> b!567058 (= e!326299 (not true))))

(declare-fun e!326298 () Bool)

(assert (=> b!567058 e!326298))

(declare-fun res!357780 () Bool)

(assert (=> b!567058 (=> (not res!357780) (not e!326298))))

(assert (=> b!567058 (= res!357780 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17766 0))(
  ( (Unit!17767) )
))
(declare-fun lt!258258 () Unit!17766)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17766)

(assert (=> b!567058 (= lt!258258 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567059 () Bool)

(declare-fun res!357787 () Bool)

(assert (=> b!567059 (=> (not res!357787) (not e!326301))))

(assert (=> b!567059 (= res!357787 (and (= (size!17458 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17458 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17458 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567060 () Bool)

(assert (=> b!567060 (= e!326298 (= (seekEntryOrOpen!0 (select (arr!17093 a!3118) j!142) a!3118 mask!3119) (Found!5539 j!142)))))

(declare-fun b!567061 () Bool)

(declare-fun res!357788 () Bool)

(assert (=> b!567061 (=> (not res!357788) (not e!326301))))

(declare-fun arrayContainsKey!0 (array!35593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567061 (= res!357788 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!357781 () Bool)

(assert (=> start!51890 (=> (not res!357781) (not e!326301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51890 (= res!357781 (validMask!0 mask!3119))))

(assert (=> start!51890 e!326301))

(assert (=> start!51890 true))

(declare-fun array_inv!12976 (array!35593) Bool)

(assert (=> start!51890 (array_inv!12976 a!3118)))

(assert (= (and start!51890 res!357781) b!567059))

(assert (= (and b!567059 res!357787) b!567057))

(assert (= (and b!567057 res!357785) b!567052))

(assert (= (and b!567052 res!357782) b!567061))

(assert (= (and b!567061 res!357788) b!567053))

(assert (= (and b!567053 res!357786) b!567055))

(assert (= (and b!567055 res!357779) b!567056))

(assert (= (and b!567056 res!357784) b!567054))

(assert (= (and b!567054 res!357783) b!567058))

(assert (= (and b!567058 res!357780) b!567060))

(declare-fun m!545117 () Bool)

(assert (=> b!567058 m!545117))

(declare-fun m!545119 () Bool)

(assert (=> b!567058 m!545119))

(declare-fun m!545121 () Bool)

(assert (=> b!567061 m!545121))

(declare-fun m!545123 () Bool)

(assert (=> start!51890 m!545123))

(declare-fun m!545125 () Bool)

(assert (=> start!51890 m!545125))

(declare-fun m!545127 () Bool)

(assert (=> b!567056 m!545127))

(declare-fun m!545129 () Bool)

(assert (=> b!567060 m!545129))

(assert (=> b!567060 m!545129))

(declare-fun m!545131 () Bool)

(assert (=> b!567060 m!545131))

(assert (=> b!567054 m!545129))

(declare-fun m!545133 () Bool)

(assert (=> b!567054 m!545133))

(assert (=> b!567054 m!545129))

(declare-fun m!545135 () Bool)

(assert (=> b!567054 m!545135))

(declare-fun m!545137 () Bool)

(assert (=> b!567054 m!545137))

(assert (=> b!567054 m!545135))

(declare-fun m!545139 () Bool)

(assert (=> b!567054 m!545139))

(assert (=> b!567054 m!545133))

(assert (=> b!567054 m!545129))

(declare-fun m!545141 () Bool)

(assert (=> b!567054 m!545141))

(declare-fun m!545143 () Bool)

(assert (=> b!567054 m!545143))

(assert (=> b!567054 m!545135))

(assert (=> b!567054 m!545137))

(declare-fun m!545145 () Bool)

(assert (=> b!567055 m!545145))

(assert (=> b!567057 m!545129))

(assert (=> b!567057 m!545129))

(declare-fun m!545147 () Bool)

(assert (=> b!567057 m!545147))

(declare-fun m!545149 () Bool)

(assert (=> b!567052 m!545149))

(declare-fun m!545151 () Bool)

(assert (=> b!567053 m!545151))

(check-sat (not b!567055) (not b!567056) (not b!567057) (not b!567060) (not b!567053) (not b!567061) (not b!567054) (not b!567052) (not start!51890) (not b!567058))
(check-sat)
