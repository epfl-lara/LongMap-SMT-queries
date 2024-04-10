; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51370 () Bool)

(assert start!51370)

(declare-fun b!560906 () Bool)

(declare-fun e!323196 () Bool)

(declare-fun e!323199 () Bool)

(assert (=> b!560906 (= e!323196 e!323199)))

(declare-fun res!352060 () Bool)

(assert (=> b!560906 (=> (not res!352060) (not e!323199))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35235 0))(
  ( (array!35236 (arr!16918 (Array (_ BitVec 32) (_ BitVec 64))) (size!17282 (_ BitVec 32))) )
))
(declare-fun lt!255148 () array!35235)

(declare-datatypes ((SeekEntryResult!5367 0))(
  ( (MissingZero!5367 (index!23695 (_ BitVec 32))) (Found!5367 (index!23696 (_ BitVec 32))) (Intermediate!5367 (undefined!6179 Bool) (index!23697 (_ BitVec 32)) (x!52606 (_ BitVec 32))) (Undefined!5367) (MissingVacant!5367 (index!23698 (_ BitVec 32))) )
))
(declare-fun lt!255144 () SeekEntryResult!5367)

(declare-fun lt!255145 () (_ BitVec 32))

(declare-fun lt!255146 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35235 (_ BitVec 32)) SeekEntryResult!5367)

(assert (=> b!560906 (= res!352060 (= lt!255144 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255145 lt!255146 lt!255148 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255140 () (_ BitVec 32))

(declare-fun a!3118 () array!35235)

(assert (=> b!560906 (= lt!255144 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255140 (select (arr!16918 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560906 (= lt!255145 (toIndex!0 lt!255146 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560906 (= lt!255146 (select (store (arr!16918 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560906 (= lt!255140 (toIndex!0 (select (arr!16918 a!3118) j!142) mask!3119))))

(assert (=> b!560906 (= lt!255148 (array!35236 (store (arr!16918 a!3118) i!1132 k0!1914) (size!17282 a!3118)))))

(declare-fun b!560907 () Bool)

(declare-fun e!323194 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35235 (_ BitVec 32)) SeekEntryResult!5367)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35235 (_ BitVec 32)) SeekEntryResult!5367)

(assert (=> b!560907 (= e!323194 (= (seekEntryOrOpen!0 lt!255146 lt!255148 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52606 lt!255144) (index!23697 lt!255144) (index!23697 lt!255144) lt!255146 lt!255148 mask!3119)))))

(declare-fun b!560908 () Bool)

(declare-fun res!352068 () Bool)

(declare-fun e!323193 () Bool)

(assert (=> b!560908 (=> (not res!352068) (not e!323193))))

(assert (=> b!560908 (= res!352068 (and (= (size!17282 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17282 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17282 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560909 () Bool)

(declare-fun e!323195 () Bool)

(declare-fun e!323192 () Bool)

(assert (=> b!560909 (= e!323195 e!323192)))

(declare-fun res!352064 () Bool)

(assert (=> b!560909 (=> res!352064 e!323192)))

(declare-fun lt!255142 () (_ BitVec 64))

(assert (=> b!560909 (= res!352064 (or (= lt!255142 (select (arr!16918 a!3118) j!142)) (= lt!255142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560909 (= lt!255142 (select (arr!16918 a!3118) (index!23697 lt!255144)))))

(declare-fun b!560910 () Bool)

(assert (=> b!560910 (= e!323192 e!323194)))

(declare-fun res!352069 () Bool)

(assert (=> b!560910 (=> (not res!352069) (not e!323194))))

(declare-fun lt!255147 () SeekEntryResult!5367)

(assert (=> b!560910 (= res!352069 (= lt!255147 (seekKeyOrZeroReturnVacant!0 (x!52606 lt!255144) (index!23697 lt!255144) (index!23697 lt!255144) (select (arr!16918 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560911 () Bool)

(assert (=> b!560911 (= e!323193 e!323196)))

(declare-fun res!352059 () Bool)

(assert (=> b!560911 (=> (not res!352059) (not e!323196))))

(declare-fun lt!255143 () SeekEntryResult!5367)

(assert (=> b!560911 (= res!352059 (or (= lt!255143 (MissingZero!5367 i!1132)) (= lt!255143 (MissingVacant!5367 i!1132))))))

(assert (=> b!560911 (= lt!255143 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560913 () Bool)

(declare-fun res!352065 () Bool)

(assert (=> b!560913 (=> (not res!352065) (not e!323196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35235 (_ BitVec 32)) Bool)

(assert (=> b!560913 (= res!352065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560914 () Bool)

(declare-fun res!352062 () Bool)

(assert (=> b!560914 (=> (not res!352062) (not e!323196))))

(declare-datatypes ((List!10998 0))(
  ( (Nil!10995) (Cons!10994 (h!11997 (_ BitVec 64)) (t!17226 List!10998)) )
))
(declare-fun arrayNoDuplicates!0 (array!35235 (_ BitVec 32) List!10998) Bool)

(assert (=> b!560914 (= res!352062 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10995))))

(declare-fun b!560915 () Bool)

(declare-fun res!352070 () Bool)

(assert (=> b!560915 (=> (not res!352070) (not e!323193))))

(declare-fun arrayContainsKey!0 (array!35235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560915 (= res!352070 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560916 () Bool)

(declare-fun res!352058 () Bool)

(assert (=> b!560916 (=> (not res!352058) (not e!323193))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560916 (= res!352058 (validKeyInArray!0 (select (arr!16918 a!3118) j!142)))))

(declare-fun b!560917 () Bool)

(assert (=> b!560917 (= e!323199 (not true))))

(declare-fun e!323198 () Bool)

(assert (=> b!560917 e!323198))

(declare-fun res!352066 () Bool)

(assert (=> b!560917 (=> (not res!352066) (not e!323198))))

(assert (=> b!560917 (= res!352066 (= lt!255147 (Found!5367 j!142)))))

(assert (=> b!560917 (= lt!255147 (seekEntryOrOpen!0 (select (arr!16918 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!560917 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17508 0))(
  ( (Unit!17509) )
))
(declare-fun lt!255141 () Unit!17508)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17508)

(assert (=> b!560917 (= lt!255141 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560918 () Bool)

(assert (=> b!560918 (= e!323198 e!323195)))

(declare-fun res!352067 () Bool)

(assert (=> b!560918 (=> res!352067 e!323195)))

(get-info :version)

(assert (=> b!560918 (= res!352067 (or (undefined!6179 lt!255144) (not ((_ is Intermediate!5367) lt!255144))))))

(declare-fun res!352061 () Bool)

(assert (=> start!51370 (=> (not res!352061) (not e!323193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51370 (= res!352061 (validMask!0 mask!3119))))

(assert (=> start!51370 e!323193))

(assert (=> start!51370 true))

(declare-fun array_inv!12714 (array!35235) Bool)

(assert (=> start!51370 (array_inv!12714 a!3118)))

(declare-fun b!560912 () Bool)

(declare-fun res!352063 () Bool)

(assert (=> b!560912 (=> (not res!352063) (not e!323193))))

(assert (=> b!560912 (= res!352063 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51370 res!352061) b!560908))

(assert (= (and b!560908 res!352068) b!560916))

(assert (= (and b!560916 res!352058) b!560912))

(assert (= (and b!560912 res!352063) b!560915))

(assert (= (and b!560915 res!352070) b!560911))

(assert (= (and b!560911 res!352059) b!560913))

(assert (= (and b!560913 res!352065) b!560914))

(assert (= (and b!560914 res!352062) b!560906))

(assert (= (and b!560906 res!352060) b!560917))

(assert (= (and b!560917 res!352066) b!560918))

(assert (= (and b!560918 (not res!352067)) b!560909))

(assert (= (and b!560909 (not res!352064)) b!560910))

(assert (= (and b!560910 res!352069) b!560907))

(declare-fun m!538733 () Bool)

(assert (=> b!560910 m!538733))

(assert (=> b!560910 m!538733))

(declare-fun m!538735 () Bool)

(assert (=> b!560910 m!538735))

(declare-fun m!538737 () Bool)

(assert (=> b!560915 m!538737))

(assert (=> b!560917 m!538733))

(assert (=> b!560917 m!538733))

(declare-fun m!538739 () Bool)

(assert (=> b!560917 m!538739))

(declare-fun m!538741 () Bool)

(assert (=> b!560917 m!538741))

(declare-fun m!538743 () Bool)

(assert (=> b!560917 m!538743))

(declare-fun m!538745 () Bool)

(assert (=> b!560911 m!538745))

(assert (=> b!560916 m!538733))

(assert (=> b!560916 m!538733))

(declare-fun m!538747 () Bool)

(assert (=> b!560916 m!538747))

(declare-fun m!538749 () Bool)

(assert (=> b!560907 m!538749))

(declare-fun m!538751 () Bool)

(assert (=> b!560907 m!538751))

(assert (=> b!560909 m!538733))

(declare-fun m!538753 () Bool)

(assert (=> b!560909 m!538753))

(declare-fun m!538755 () Bool)

(assert (=> b!560912 m!538755))

(declare-fun m!538757 () Bool)

(assert (=> b!560913 m!538757))

(assert (=> b!560906 m!538733))

(declare-fun m!538759 () Bool)

(assert (=> b!560906 m!538759))

(assert (=> b!560906 m!538733))

(declare-fun m!538761 () Bool)

(assert (=> b!560906 m!538761))

(declare-fun m!538763 () Bool)

(assert (=> b!560906 m!538763))

(declare-fun m!538765 () Bool)

(assert (=> b!560906 m!538765))

(declare-fun m!538767 () Bool)

(assert (=> b!560906 m!538767))

(declare-fun m!538769 () Bool)

(assert (=> b!560906 m!538769))

(assert (=> b!560906 m!538733))

(declare-fun m!538771 () Bool)

(assert (=> start!51370 m!538771))

(declare-fun m!538773 () Bool)

(assert (=> start!51370 m!538773))

(declare-fun m!538775 () Bool)

(assert (=> b!560914 m!538775))

(check-sat (not b!560917) (not b!560911) (not b!560915) (not b!560910) (not b!560912) (not b!560907) (not b!560913) (not b!560914) (not b!560906) (not start!51370) (not b!560916))
(check-sat)
