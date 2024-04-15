; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51356 () Bool)

(assert start!51356)

(declare-fun b!560596 () Bool)

(declare-fun e!322998 () Bool)

(declare-fun e!322999 () Bool)

(assert (=> b!560596 (= e!322998 e!322999)))

(declare-fun res!351890 () Bool)

(assert (=> b!560596 (=> (not res!351890) (not e!322999))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5362 0))(
  ( (MissingZero!5362 (index!23675 (_ BitVec 32))) (Found!5362 (index!23676 (_ BitVec 32))) (Intermediate!5362 (undefined!6174 Bool) (index!23677 (_ BitVec 32)) (x!52596 (_ BitVec 32))) (Undefined!5362) (MissingVacant!5362 (index!23678 (_ BitVec 32))) )
))
(declare-fun lt!254883 () SeekEntryResult!5362)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!254881 () SeekEntryResult!5362)

(declare-datatypes ((array!35230 0))(
  ( (array!35231 (arr!16916 (Array (_ BitVec 32) (_ BitVec 64))) (size!17281 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35230)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35230 (_ BitVec 32)) SeekEntryResult!5362)

(assert (=> b!560596 (= res!351890 (= lt!254883 (seekKeyOrZeroReturnVacant!0 (x!52596 lt!254881) (index!23677 lt!254881) (index!23677 lt!254881) (select (arr!16916 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560597 () Bool)

(declare-fun e!322994 () Bool)

(declare-fun e!323001 () Bool)

(assert (=> b!560597 (= e!322994 e!323001)))

(declare-fun res!351900 () Bool)

(assert (=> b!560597 (=> (not res!351900) (not e!323001))))

(declare-fun lt!254886 () SeekEntryResult!5362)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560597 (= res!351900 (or (= lt!254886 (MissingZero!5362 i!1132)) (= lt!254886 (MissingVacant!5362 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35230 (_ BitVec 32)) SeekEntryResult!5362)

(assert (=> b!560597 (= lt!254886 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560598 () Bool)

(declare-fun res!351898 () Bool)

(assert (=> b!560598 (=> (not res!351898) (not e!322994))))

(assert (=> b!560598 (= res!351898 (and (= (size!17281 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17281 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17281 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560599 () Bool)

(declare-fun e!322997 () Bool)

(assert (=> b!560599 (= e!323001 e!322997)))

(declare-fun res!351899 () Bool)

(assert (=> b!560599 (=> (not res!351899) (not e!322997))))

(declare-fun lt!254885 () array!35230)

(declare-fun lt!254879 () (_ BitVec 64))

(declare-fun lt!254882 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35230 (_ BitVec 32)) SeekEntryResult!5362)

(assert (=> b!560599 (= res!351899 (= lt!254881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254882 lt!254879 lt!254885 mask!3119)))))

(declare-fun lt!254884 () (_ BitVec 32))

(assert (=> b!560599 (= lt!254881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254884 (select (arr!16916 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560599 (= lt!254882 (toIndex!0 lt!254879 mask!3119))))

(assert (=> b!560599 (= lt!254879 (select (store (arr!16916 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560599 (= lt!254884 (toIndex!0 (select (arr!16916 a!3118) j!142) mask!3119))))

(assert (=> b!560599 (= lt!254885 (array!35231 (store (arr!16916 a!3118) i!1132 k0!1914) (size!17281 a!3118)))))

(declare-fun b!560600 () Bool)

(declare-fun e!322996 () Bool)

(declare-fun e!322995 () Bool)

(assert (=> b!560600 (= e!322996 e!322995)))

(declare-fun res!351892 () Bool)

(assert (=> b!560600 (=> res!351892 e!322995)))

(get-info :version)

(assert (=> b!560600 (= res!351892 (or (undefined!6174 lt!254881) (not ((_ is Intermediate!5362) lt!254881))))))

(declare-fun b!560601 () Bool)

(declare-fun res!351897 () Bool)

(assert (=> b!560601 (=> (not res!351897) (not e!322994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560601 (= res!351897 (validKeyInArray!0 (select (arr!16916 a!3118) j!142)))))

(declare-fun b!560602 () Bool)

(declare-fun res!351896 () Bool)

(assert (=> b!560602 (=> (not res!351896) (not e!322994))))

(assert (=> b!560602 (= res!351896 (validKeyInArray!0 k0!1914))))

(declare-fun b!560603 () Bool)

(assert (=> b!560603 (= e!322999 (= (seekEntryOrOpen!0 lt!254879 lt!254885 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52596 lt!254881) (index!23677 lt!254881) (index!23677 lt!254881) lt!254879 lt!254885 mask!3119)))))

(declare-fun b!560604 () Bool)

(assert (=> b!560604 (= e!322997 (not true))))

(assert (=> b!560604 e!322996))

(declare-fun res!351891 () Bool)

(assert (=> b!560604 (=> (not res!351891) (not e!322996))))

(assert (=> b!560604 (= res!351891 (= lt!254883 (Found!5362 j!142)))))

(assert (=> b!560604 (= lt!254883 (seekEntryOrOpen!0 (select (arr!16916 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35230 (_ BitVec 32)) Bool)

(assert (=> b!560604 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17484 0))(
  ( (Unit!17485) )
))
(declare-fun lt!254887 () Unit!17484)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35230 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17484)

(assert (=> b!560604 (= lt!254887 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!351901 () Bool)

(assert (=> start!51356 (=> (not res!351901) (not e!322994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51356 (= res!351901 (validMask!0 mask!3119))))

(assert (=> start!51356 e!322994))

(assert (=> start!51356 true))

(declare-fun array_inv!12799 (array!35230) Bool)

(assert (=> start!51356 (array_inv!12799 a!3118)))

(declare-fun b!560605 () Bool)

(declare-fun res!351893 () Bool)

(assert (=> b!560605 (=> (not res!351893) (not e!323001))))

(assert (=> b!560605 (= res!351893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560606 () Bool)

(declare-fun res!351894 () Bool)

(assert (=> b!560606 (=> (not res!351894) (not e!322994))))

(declare-fun arrayContainsKey!0 (array!35230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560606 (= res!351894 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560607 () Bool)

(assert (=> b!560607 (= e!322995 e!322998)))

(declare-fun res!351902 () Bool)

(assert (=> b!560607 (=> res!351902 e!322998)))

(declare-fun lt!254880 () (_ BitVec 64))

(assert (=> b!560607 (= res!351902 (or (= lt!254880 (select (arr!16916 a!3118) j!142)) (= lt!254880 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560607 (= lt!254880 (select (arr!16916 a!3118) (index!23677 lt!254881)))))

(declare-fun b!560608 () Bool)

(declare-fun res!351895 () Bool)

(assert (=> b!560608 (=> (not res!351895) (not e!323001))))

(declare-datatypes ((List!11035 0))(
  ( (Nil!11032) (Cons!11031 (h!12034 (_ BitVec 64)) (t!17254 List!11035)) )
))
(declare-fun arrayNoDuplicates!0 (array!35230 (_ BitVec 32) List!11035) Bool)

(assert (=> b!560608 (= res!351895 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11032))))

(assert (= (and start!51356 res!351901) b!560598))

(assert (= (and b!560598 res!351898) b!560601))

(assert (= (and b!560601 res!351897) b!560602))

(assert (= (and b!560602 res!351896) b!560606))

(assert (= (and b!560606 res!351894) b!560597))

(assert (= (and b!560597 res!351900) b!560605))

(assert (= (and b!560605 res!351893) b!560608))

(assert (= (and b!560608 res!351895) b!560599))

(assert (= (and b!560599 res!351899) b!560604))

(assert (= (and b!560604 res!351891) b!560600))

(assert (= (and b!560600 (not res!351892)) b!560607))

(assert (= (and b!560607 (not res!351902)) b!560596))

(assert (= (and b!560596 res!351890) b!560603))

(declare-fun m!537917 () Bool)

(assert (=> b!560597 m!537917))

(declare-fun m!537919 () Bool)

(assert (=> start!51356 m!537919))

(declare-fun m!537921 () Bool)

(assert (=> start!51356 m!537921))

(declare-fun m!537923 () Bool)

(assert (=> b!560608 m!537923))

(declare-fun m!537925 () Bool)

(assert (=> b!560606 m!537925))

(declare-fun m!537927 () Bool)

(assert (=> b!560607 m!537927))

(declare-fun m!537929 () Bool)

(assert (=> b!560607 m!537929))

(assert (=> b!560604 m!537927))

(assert (=> b!560604 m!537927))

(declare-fun m!537931 () Bool)

(assert (=> b!560604 m!537931))

(declare-fun m!537933 () Bool)

(assert (=> b!560604 m!537933))

(declare-fun m!537935 () Bool)

(assert (=> b!560604 m!537935))

(declare-fun m!537937 () Bool)

(assert (=> b!560602 m!537937))

(assert (=> b!560596 m!537927))

(assert (=> b!560596 m!537927))

(declare-fun m!537939 () Bool)

(assert (=> b!560596 m!537939))

(assert (=> b!560601 m!537927))

(assert (=> b!560601 m!537927))

(declare-fun m!537941 () Bool)

(assert (=> b!560601 m!537941))

(declare-fun m!537943 () Bool)

(assert (=> b!560603 m!537943))

(declare-fun m!537945 () Bool)

(assert (=> b!560603 m!537945))

(assert (=> b!560599 m!537927))

(declare-fun m!537947 () Bool)

(assert (=> b!560599 m!537947))

(declare-fun m!537949 () Bool)

(assert (=> b!560599 m!537949))

(assert (=> b!560599 m!537927))

(declare-fun m!537951 () Bool)

(assert (=> b!560599 m!537951))

(declare-fun m!537953 () Bool)

(assert (=> b!560599 m!537953))

(declare-fun m!537955 () Bool)

(assert (=> b!560599 m!537955))

(assert (=> b!560599 m!537927))

(declare-fun m!537957 () Bool)

(assert (=> b!560599 m!537957))

(declare-fun m!537959 () Bool)

(assert (=> b!560605 m!537959))

(check-sat (not b!560596) (not b!560599) (not b!560606) (not start!51356) (not b!560603) (not b!560608) (not b!560597) (not b!560605) (not b!560601) (not b!560602) (not b!560604))
(check-sat)
