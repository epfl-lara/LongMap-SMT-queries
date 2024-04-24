; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50694 () Bool)

(assert start!50694)

(declare-fun b!553843 () Bool)

(declare-fun res!346154 () Bool)

(declare-fun e!319474 () Bool)

(assert (=> b!553843 (=> (not res!346154) (not e!319474))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34866 0))(
  ( (array!34867 (arr!16741 (Array (_ BitVec 32) (_ BitVec 64))) (size!17105 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34866)

(assert (=> b!553843 (= res!346154 (and (= (size!17105 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17105 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17105 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553844 () Bool)

(declare-fun res!346153 () Bool)

(declare-fun e!319473 () Bool)

(assert (=> b!553844 (=> (not res!346153) (not e!319473))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5146 0))(
  ( (MissingZero!5146 (index!22811 (_ BitVec 32))) (Found!5146 (index!22812 (_ BitVec 32))) (Intermediate!5146 (undefined!5958 Bool) (index!22813 (_ BitVec 32)) (x!51887 (_ BitVec 32))) (Undefined!5146) (MissingVacant!5146 (index!22814 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34866 (_ BitVec 32)) SeekEntryResult!5146)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553844 (= res!346153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16741 a!3118) j!142) mask!3119) (select (arr!16741 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16741 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16741 a!3118) i!1132 k0!1914) j!142) (array!34867 (store (arr!16741 a!3118) i!1132 k0!1914) (size!17105 a!3118)) mask!3119)))))

(declare-fun b!553845 () Bool)

(declare-fun res!346158 () Bool)

(assert (=> b!553845 (=> (not res!346158) (not e!319473))))

(declare-datatypes ((List!10728 0))(
  ( (Nil!10725) (Cons!10724 (h!11712 (_ BitVec 64)) (t!16948 List!10728)) )
))
(declare-fun arrayNoDuplicates!0 (array!34866 (_ BitVec 32) List!10728) Bool)

(assert (=> b!553845 (= res!346158 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10725))))

(declare-fun b!553846 () Bool)

(assert (=> b!553846 (= e!319473 (not true))))

(declare-fun e!319476 () Bool)

(assert (=> b!553846 e!319476))

(declare-fun res!346159 () Bool)

(assert (=> b!553846 (=> (not res!346159) (not e!319476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34866 (_ BitVec 32)) Bool)

(assert (=> b!553846 (= res!346159 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17137 0))(
  ( (Unit!17138) )
))
(declare-fun lt!251665 () Unit!17137)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34866 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17137)

(assert (=> b!553846 (= lt!251665 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553847 () Bool)

(declare-fun res!346157 () Bool)

(assert (=> b!553847 (=> (not res!346157) (not e!319473))))

(assert (=> b!553847 (= res!346157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553848 () Bool)

(declare-fun res!346155 () Bool)

(assert (=> b!553848 (=> (not res!346155) (not e!319474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553848 (= res!346155 (validKeyInArray!0 k0!1914))))

(declare-fun res!346152 () Bool)

(assert (=> start!50694 (=> (not res!346152) (not e!319474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50694 (= res!346152 (validMask!0 mask!3119))))

(assert (=> start!50694 e!319474))

(assert (=> start!50694 true))

(declare-fun array_inv!12600 (array!34866) Bool)

(assert (=> start!50694 (array_inv!12600 a!3118)))

(declare-fun b!553849 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34866 (_ BitVec 32)) SeekEntryResult!5146)

(assert (=> b!553849 (= e!319476 (= (seekEntryOrOpen!0 (select (arr!16741 a!3118) j!142) a!3118 mask!3119) (Found!5146 j!142)))))

(declare-fun b!553850 () Bool)

(declare-fun res!346156 () Bool)

(assert (=> b!553850 (=> (not res!346156) (not e!319474))))

(declare-fun arrayContainsKey!0 (array!34866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553850 (= res!346156 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553851 () Bool)

(assert (=> b!553851 (= e!319474 e!319473)))

(declare-fun res!346151 () Bool)

(assert (=> b!553851 (=> (not res!346151) (not e!319473))))

(declare-fun lt!251664 () SeekEntryResult!5146)

(assert (=> b!553851 (= res!346151 (or (= lt!251664 (MissingZero!5146 i!1132)) (= lt!251664 (MissingVacant!5146 i!1132))))))

(assert (=> b!553851 (= lt!251664 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553852 () Bool)

(declare-fun res!346150 () Bool)

(assert (=> b!553852 (=> (not res!346150) (not e!319474))))

(assert (=> b!553852 (= res!346150 (validKeyInArray!0 (select (arr!16741 a!3118) j!142)))))

(assert (= (and start!50694 res!346152) b!553843))

(assert (= (and b!553843 res!346154) b!553852))

(assert (= (and b!553852 res!346150) b!553848))

(assert (= (and b!553848 res!346155) b!553850))

(assert (= (and b!553850 res!346156) b!553851))

(assert (= (and b!553851 res!346151) b!553847))

(assert (= (and b!553847 res!346157) b!553845))

(assert (= (and b!553845 res!346158) b!553844))

(assert (= (and b!553844 res!346153) b!553846))

(assert (= (and b!553846 res!346159) b!553849))

(declare-fun m!531107 () Bool)

(assert (=> b!553848 m!531107))

(declare-fun m!531109 () Bool)

(assert (=> b!553852 m!531109))

(assert (=> b!553852 m!531109))

(declare-fun m!531111 () Bool)

(assert (=> b!553852 m!531111))

(declare-fun m!531113 () Bool)

(assert (=> b!553847 m!531113))

(assert (=> b!553849 m!531109))

(assert (=> b!553849 m!531109))

(declare-fun m!531115 () Bool)

(assert (=> b!553849 m!531115))

(declare-fun m!531117 () Bool)

(assert (=> b!553850 m!531117))

(declare-fun m!531119 () Bool)

(assert (=> start!50694 m!531119))

(declare-fun m!531121 () Bool)

(assert (=> start!50694 m!531121))

(declare-fun m!531123 () Bool)

(assert (=> b!553846 m!531123))

(declare-fun m!531125 () Bool)

(assert (=> b!553846 m!531125))

(declare-fun m!531127 () Bool)

(assert (=> b!553851 m!531127))

(declare-fun m!531129 () Bool)

(assert (=> b!553845 m!531129))

(assert (=> b!553844 m!531109))

(declare-fun m!531131 () Bool)

(assert (=> b!553844 m!531131))

(assert (=> b!553844 m!531109))

(declare-fun m!531133 () Bool)

(assert (=> b!553844 m!531133))

(declare-fun m!531135 () Bool)

(assert (=> b!553844 m!531135))

(assert (=> b!553844 m!531133))

(declare-fun m!531137 () Bool)

(assert (=> b!553844 m!531137))

(assert (=> b!553844 m!531131))

(assert (=> b!553844 m!531109))

(declare-fun m!531139 () Bool)

(assert (=> b!553844 m!531139))

(declare-fun m!531141 () Bool)

(assert (=> b!553844 m!531141))

(assert (=> b!553844 m!531133))

(assert (=> b!553844 m!531135))

(check-sat (not b!553848) (not b!553845) (not b!553846) (not start!50694) (not b!553844) (not b!553847) (not b!553850) (not b!553849) (not b!553851) (not b!553852))
(check-sat)
