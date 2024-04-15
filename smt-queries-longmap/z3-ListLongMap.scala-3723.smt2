; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51320 () Bool)

(assert start!51320)

(declare-fun b!559894 () Bool)

(declare-fun res!351200 () Bool)

(declare-fun e!322562 () Bool)

(assert (=> b!559894 (=> (not res!351200) (not e!322562))))

(declare-datatypes ((array!35194 0))(
  ( (array!35195 (arr!16898 (Array (_ BitVec 32) (_ BitVec 64))) (size!17263 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35194)

(declare-datatypes ((List!11017 0))(
  ( (Nil!11014) (Cons!11013 (h!12016 (_ BitVec 64)) (t!17236 List!11017)) )
))
(declare-fun arrayNoDuplicates!0 (array!35194 (_ BitVec 32) List!11017) Bool)

(assert (=> b!559894 (= res!351200 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11014))))

(declare-fun b!559895 () Bool)

(declare-fun res!351198 () Bool)

(declare-fun e!322569 () Bool)

(assert (=> b!559895 (=> (not res!351198) (not e!322569))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!559895 (= res!351198 (validKeyInArray!0 k0!1914))))

(declare-fun b!559896 () Bool)

(declare-fun res!351191 () Bool)

(assert (=> b!559896 (=> (not res!351191) (not e!322569))))

(declare-fun arrayContainsKey!0 (array!35194 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!559896 (= res!351191 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!559897 () Bool)

(declare-fun res!351197 () Bool)

(assert (=> b!559897 (=> (not res!351197) (not e!322562))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35194 (_ BitVec 32)) Bool)

(assert (=> b!559897 (= res!351197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!559898 () Bool)

(declare-fun res!351189 () Bool)

(assert (=> b!559898 (=> (not res!351189) (not e!322569))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!559898 (= res!351189 (and (= (size!17263 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17263 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17263 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!559899 () Bool)

(declare-fun e!322566 () Bool)

(assert (=> b!559899 (= e!322566 (not true))))

(declare-fun e!322568 () Bool)

(assert (=> b!559899 e!322568))

(declare-fun res!351190 () Bool)

(assert (=> b!559899 (=> (not res!351190) (not e!322568))))

(declare-datatypes ((SeekEntryResult!5344 0))(
  ( (MissingZero!5344 (index!23603 (_ BitVec 32))) (Found!5344 (index!23604 (_ BitVec 32))) (Intermediate!5344 (undefined!6156 Bool) (index!23605 (_ BitVec 32)) (x!52530 (_ BitVec 32))) (Undefined!5344) (MissingVacant!5344 (index!23606 (_ BitVec 32))) )
))
(declare-fun lt!254398 () SeekEntryResult!5344)

(assert (=> b!559899 (= res!351190 (= lt!254398 (Found!5344 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35194 (_ BitVec 32)) SeekEntryResult!5344)

(assert (=> b!559899 (= lt!254398 (seekEntryOrOpen!0 (select (arr!16898 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!559899 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17448 0))(
  ( (Unit!17449) )
))
(declare-fun lt!254395 () Unit!17448)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35194 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17448)

(assert (=> b!559899 (= lt!254395 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!559900 () Bool)

(declare-fun res!351196 () Bool)

(assert (=> b!559900 (=> (not res!351196) (not e!322569))))

(assert (=> b!559900 (= res!351196 (validKeyInArray!0 (select (arr!16898 a!3118) j!142)))))

(declare-fun res!351194 () Bool)

(assert (=> start!51320 (=> (not res!351194) (not e!322569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51320 (= res!351194 (validMask!0 mask!3119))))

(assert (=> start!51320 e!322569))

(assert (=> start!51320 true))

(declare-fun array_inv!12781 (array!35194) Bool)

(assert (=> start!51320 (array_inv!12781 a!3118)))

(declare-fun e!322563 () Bool)

(declare-fun lt!254399 () (_ BitVec 64))

(declare-fun lt!254394 () SeekEntryResult!5344)

(declare-fun lt!254401 () array!35194)

(declare-fun b!559901 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35194 (_ BitVec 32)) SeekEntryResult!5344)

(assert (=> b!559901 (= e!322563 (= (seekEntryOrOpen!0 lt!254399 lt!254401 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52530 lt!254394) (index!23605 lt!254394) (index!23605 lt!254394) lt!254399 lt!254401 mask!3119)))))

(declare-fun b!559902 () Bool)

(declare-fun e!322564 () Bool)

(declare-fun e!322565 () Bool)

(assert (=> b!559902 (= e!322564 e!322565)))

(declare-fun res!351188 () Bool)

(assert (=> b!559902 (=> res!351188 e!322565)))

(declare-fun lt!254393 () (_ BitVec 64))

(assert (=> b!559902 (= res!351188 (or (= lt!254393 (select (arr!16898 a!3118) j!142)) (= lt!254393 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!559902 (= lt!254393 (select (arr!16898 a!3118) (index!23605 lt!254394)))))

(declare-fun b!559903 () Bool)

(assert (=> b!559903 (= e!322562 e!322566)))

(declare-fun res!351192 () Bool)

(assert (=> b!559903 (=> (not res!351192) (not e!322566))))

(declare-fun lt!254396 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35194 (_ BitVec 32)) SeekEntryResult!5344)

(assert (=> b!559903 (= res!351192 (= lt!254394 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254396 lt!254399 lt!254401 mask!3119)))))

(declare-fun lt!254397 () (_ BitVec 32))

(assert (=> b!559903 (= lt!254394 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254397 (select (arr!16898 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559903 (= lt!254396 (toIndex!0 lt!254399 mask!3119))))

(assert (=> b!559903 (= lt!254399 (select (store (arr!16898 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!559903 (= lt!254397 (toIndex!0 (select (arr!16898 a!3118) j!142) mask!3119))))

(assert (=> b!559903 (= lt!254401 (array!35195 (store (arr!16898 a!3118) i!1132 k0!1914) (size!17263 a!3118)))))

(declare-fun b!559904 () Bool)

(assert (=> b!559904 (= e!322568 e!322564)))

(declare-fun res!351199 () Bool)

(assert (=> b!559904 (=> res!351199 e!322564)))

(get-info :version)

(assert (=> b!559904 (= res!351199 (or (undefined!6156 lt!254394) (not ((_ is Intermediate!5344) lt!254394))))))

(declare-fun b!559905 () Bool)

(assert (=> b!559905 (= e!322569 e!322562)))

(declare-fun res!351195 () Bool)

(assert (=> b!559905 (=> (not res!351195) (not e!322562))))

(declare-fun lt!254400 () SeekEntryResult!5344)

(assert (=> b!559905 (= res!351195 (or (= lt!254400 (MissingZero!5344 i!1132)) (= lt!254400 (MissingVacant!5344 i!1132))))))

(assert (=> b!559905 (= lt!254400 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!559906 () Bool)

(assert (=> b!559906 (= e!322565 e!322563)))

(declare-fun res!351193 () Bool)

(assert (=> b!559906 (=> (not res!351193) (not e!322563))))

(assert (=> b!559906 (= res!351193 (= lt!254398 (seekKeyOrZeroReturnVacant!0 (x!52530 lt!254394) (index!23605 lt!254394) (index!23605 lt!254394) (select (arr!16898 a!3118) j!142) a!3118 mask!3119)))))

(assert (= (and start!51320 res!351194) b!559898))

(assert (= (and b!559898 res!351189) b!559900))

(assert (= (and b!559900 res!351196) b!559895))

(assert (= (and b!559895 res!351198) b!559896))

(assert (= (and b!559896 res!351191) b!559905))

(assert (= (and b!559905 res!351195) b!559897))

(assert (= (and b!559897 res!351197) b!559894))

(assert (= (and b!559894 res!351200) b!559903))

(assert (= (and b!559903 res!351192) b!559899))

(assert (= (and b!559899 res!351190) b!559904))

(assert (= (and b!559904 (not res!351199)) b!559902))

(assert (= (and b!559902 (not res!351188)) b!559906))

(assert (= (and b!559906 res!351193) b!559901))

(declare-fun m!537125 () Bool)

(assert (=> b!559894 m!537125))

(declare-fun m!537127 () Bool)

(assert (=> b!559906 m!537127))

(assert (=> b!559906 m!537127))

(declare-fun m!537129 () Bool)

(assert (=> b!559906 m!537129))

(assert (=> b!559902 m!537127))

(declare-fun m!537131 () Bool)

(assert (=> b!559902 m!537131))

(declare-fun m!537133 () Bool)

(assert (=> b!559901 m!537133))

(declare-fun m!537135 () Bool)

(assert (=> b!559901 m!537135))

(declare-fun m!537137 () Bool)

(assert (=> b!559905 m!537137))

(assert (=> b!559900 m!537127))

(assert (=> b!559900 m!537127))

(declare-fun m!537139 () Bool)

(assert (=> b!559900 m!537139))

(declare-fun m!537141 () Bool)

(assert (=> start!51320 m!537141))

(declare-fun m!537143 () Bool)

(assert (=> start!51320 m!537143))

(assert (=> b!559899 m!537127))

(assert (=> b!559899 m!537127))

(declare-fun m!537145 () Bool)

(assert (=> b!559899 m!537145))

(declare-fun m!537147 () Bool)

(assert (=> b!559899 m!537147))

(declare-fun m!537149 () Bool)

(assert (=> b!559899 m!537149))

(declare-fun m!537151 () Bool)

(assert (=> b!559895 m!537151))

(declare-fun m!537153 () Bool)

(assert (=> b!559897 m!537153))

(declare-fun m!537155 () Bool)

(assert (=> b!559896 m!537155))

(assert (=> b!559903 m!537127))

(declare-fun m!537157 () Bool)

(assert (=> b!559903 m!537157))

(assert (=> b!559903 m!537127))

(declare-fun m!537159 () Bool)

(assert (=> b!559903 m!537159))

(declare-fun m!537161 () Bool)

(assert (=> b!559903 m!537161))

(declare-fun m!537163 () Bool)

(assert (=> b!559903 m!537163))

(declare-fun m!537165 () Bool)

(assert (=> b!559903 m!537165))

(assert (=> b!559903 m!537127))

(declare-fun m!537167 () Bool)

(assert (=> b!559903 m!537167))

(check-sat (not b!559901) (not b!559896) (not b!559903) (not b!559894) (not b!559906) (not b!559895) (not b!559905) (not b!559900) (not b!559899) (not start!51320) (not b!559897))
(check-sat)
