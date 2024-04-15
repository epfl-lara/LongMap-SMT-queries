; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52136 () Bool)

(assert start!52136)

(declare-fun b!568886 () Bool)

(declare-fun res!359048 () Bool)

(declare-fun e!327281 () Bool)

(assert (=> b!568886 (=> (not res!359048) (not e!327281))))

(declare-datatypes ((array!35668 0))(
  ( (array!35669 (arr!17126 (Array (_ BitVec 32) (_ BitVec 64))) (size!17491 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35668)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35668 (_ BitVec 32)) Bool)

(assert (=> b!568886 (= res!359048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568887 () Bool)

(declare-fun e!327282 () Bool)

(assert (=> b!568887 (= e!327282 e!327281)))

(declare-fun res!359049 () Bool)

(assert (=> b!568887 (=> (not res!359049) (not e!327281))))

(declare-datatypes ((SeekEntryResult!5572 0))(
  ( (MissingZero!5572 (index!24515 (_ BitVec 32))) (Found!5572 (index!24516 (_ BitVec 32))) (Intermediate!5572 (undefined!6384 Bool) (index!24517 (_ BitVec 32)) (x!53402 (_ BitVec 32))) (Undefined!5572) (MissingVacant!5572 (index!24518 (_ BitVec 32))) )
))
(declare-fun lt!259124 () SeekEntryResult!5572)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!568887 (= res!359049 (or (= lt!259124 (MissingZero!5572 i!1132)) (= lt!259124 (MissingVacant!5572 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35668 (_ BitVec 32)) SeekEntryResult!5572)

(assert (=> b!568887 (= lt!259124 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!568888 () Bool)

(declare-fun res!359047 () Bool)

(assert (=> b!568888 (=> (not res!359047) (not e!327282))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568888 (= res!359047 (validKeyInArray!0 (select (arr!17126 a!3118) j!142)))))

(declare-fun b!568889 () Bool)

(declare-fun res!359046 () Bool)

(assert (=> b!568889 (=> (not res!359046) (not e!327282))))

(assert (=> b!568889 (= res!359046 (validKeyInArray!0 k0!1914))))

(declare-fun b!568890 () Bool)

(declare-fun res!359053 () Bool)

(assert (=> b!568890 (=> (not res!359053) (not e!327282))))

(assert (=> b!568890 (= res!359053 (and (= (size!17491 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17491 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17491 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568891 () Bool)

(declare-fun res!359052 () Bool)

(assert (=> b!568891 (=> (not res!359052) (not e!327281))))

(declare-datatypes ((List!11245 0))(
  ( (Nil!11242) (Cons!11241 (h!12262 (_ BitVec 64)) (t!17464 List!11245)) )
))
(declare-fun arrayNoDuplicates!0 (array!35668 (_ BitVec 32) List!11245) Bool)

(assert (=> b!568891 (= res!359052 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11242))))

(declare-fun b!568892 () Bool)

(declare-fun e!327279 () Bool)

(declare-fun lt!259121 () SeekEntryResult!5572)

(get-info :version)

(assert (=> b!568892 (= e!327279 (not (or (undefined!6384 lt!259121) (not ((_ is Intermediate!5572) lt!259121)) (= (select (arr!17126 a!3118) (index!24517 lt!259121)) (select (arr!17126 a!3118) j!142)) (not (= (select (arr!17126 a!3118) (index!24517 lt!259121)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsgt #b00000000000000000000000000000000 (size!17491 a!3118)) (bvsle j!142 (size!17491 a!3118)))))))

(declare-fun lt!259125 () SeekEntryResult!5572)

(assert (=> b!568892 (and (= lt!259125 (Found!5572 j!142)) (or (undefined!6384 lt!259121) (not ((_ is Intermediate!5572) lt!259121)) (= (select (arr!17126 a!3118) (index!24517 lt!259121)) (select (arr!17126 a!3118) j!142)) (not (= (select (arr!17126 a!3118) (index!24517 lt!259121)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259125 (MissingZero!5572 (index!24517 lt!259121)))))))

(assert (=> b!568892 (= lt!259125 (seekEntryOrOpen!0 (select (arr!17126 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!568892 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17832 0))(
  ( (Unit!17833) )
))
(declare-fun lt!259122 () Unit!17832)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35668 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17832)

(assert (=> b!568892 (= lt!259122 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568893 () Bool)

(assert (=> b!568893 (= e!327281 e!327279)))

(declare-fun res!359050 () Bool)

(assert (=> b!568893 (=> (not res!359050) (not e!327279))))

(declare-fun lt!259126 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35668 (_ BitVec 32)) SeekEntryResult!5572)

(assert (=> b!568893 (= res!359050 (= lt!259121 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259126 (select (store (arr!17126 a!3118) i!1132 k0!1914) j!142) (array!35669 (store (arr!17126 a!3118) i!1132 k0!1914) (size!17491 a!3118)) mask!3119)))))

(declare-fun lt!259123 () (_ BitVec 32))

(assert (=> b!568893 (= lt!259121 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259123 (select (arr!17126 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568893 (= lt!259126 (toIndex!0 (select (store (arr!17126 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!568893 (= lt!259123 (toIndex!0 (select (arr!17126 a!3118) j!142) mask!3119))))

(declare-fun b!568894 () Bool)

(declare-fun res!359054 () Bool)

(assert (=> b!568894 (=> (not res!359054) (not e!327282))))

(declare-fun arrayContainsKey!0 (array!35668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568894 (= res!359054 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!359051 () Bool)

(assert (=> start!52136 (=> (not res!359051) (not e!327282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52136 (= res!359051 (validMask!0 mask!3119))))

(assert (=> start!52136 e!327282))

(assert (=> start!52136 true))

(declare-fun array_inv!13009 (array!35668) Bool)

(assert (=> start!52136 (array_inv!13009 a!3118)))

(assert (= (and start!52136 res!359051) b!568890))

(assert (= (and b!568890 res!359053) b!568888))

(assert (= (and b!568888 res!359047) b!568889))

(assert (= (and b!568889 res!359046) b!568894))

(assert (= (and b!568894 res!359054) b!568887))

(assert (= (and b!568887 res!359049) b!568886))

(assert (= (and b!568886 res!359048) b!568891))

(assert (= (and b!568891 res!359052) b!568893))

(assert (= (and b!568893 res!359050) b!568892))

(declare-fun m!547001 () Bool)

(assert (=> b!568894 m!547001))

(declare-fun m!547003 () Bool)

(assert (=> b!568892 m!547003))

(declare-fun m!547005 () Bool)

(assert (=> b!568892 m!547005))

(declare-fun m!547007 () Bool)

(assert (=> b!568892 m!547007))

(declare-fun m!547009 () Bool)

(assert (=> b!568892 m!547009))

(assert (=> b!568892 m!547005))

(declare-fun m!547011 () Bool)

(assert (=> b!568892 m!547011))

(declare-fun m!547013 () Bool)

(assert (=> b!568887 m!547013))

(assert (=> b!568893 m!547005))

(declare-fun m!547015 () Bool)

(assert (=> b!568893 m!547015))

(assert (=> b!568893 m!547005))

(assert (=> b!568893 m!547005))

(declare-fun m!547017 () Bool)

(assert (=> b!568893 m!547017))

(declare-fun m!547019 () Bool)

(assert (=> b!568893 m!547019))

(assert (=> b!568893 m!547019))

(declare-fun m!547021 () Bool)

(assert (=> b!568893 m!547021))

(declare-fun m!547023 () Bool)

(assert (=> b!568893 m!547023))

(assert (=> b!568893 m!547019))

(declare-fun m!547025 () Bool)

(assert (=> b!568893 m!547025))

(declare-fun m!547027 () Bool)

(assert (=> start!52136 m!547027))

(declare-fun m!547029 () Bool)

(assert (=> start!52136 m!547029))

(declare-fun m!547031 () Bool)

(assert (=> b!568886 m!547031))

(declare-fun m!547033 () Bool)

(assert (=> b!568891 m!547033))

(assert (=> b!568888 m!547005))

(assert (=> b!568888 m!547005))

(declare-fun m!547035 () Bool)

(assert (=> b!568888 m!547035))

(declare-fun m!547037 () Bool)

(assert (=> b!568889 m!547037))

(check-sat (not b!568888) (not b!568889) (not b!568892) (not b!568894) (not b!568893) (not b!568886) (not b!568887) (not start!52136) (not b!568891))
(check-sat)
