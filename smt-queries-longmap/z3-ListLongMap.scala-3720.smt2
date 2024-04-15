; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51236 () Bool)

(assert start!51236)

(declare-fun b!559212 () Bool)

(declare-fun e!322152 () Bool)

(declare-fun e!322149 () Bool)

(assert (=> b!559212 (= e!322152 e!322149)))

(declare-fun res!350746 () Bool)

(assert (=> b!559212 (=> (not res!350746) (not e!322149))))

(declare-datatypes ((SeekEntryResult!5335 0))(
  ( (MissingZero!5335 (index!23567 (_ BitVec 32))) (Found!5335 (index!23568 (_ BitVec 32))) (Intermediate!5335 (undefined!6147 Bool) (index!23569 (_ BitVec 32)) (x!52488 (_ BitVec 32))) (Undefined!5335) (MissingVacant!5335 (index!23570 (_ BitVec 32))) )
))
(declare-fun lt!254034 () SeekEntryResult!5335)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!559212 (= res!350746 (or (= lt!254034 (MissingZero!5335 i!1132)) (= lt!254034 (MissingVacant!5335 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35173 0))(
  ( (array!35174 (arr!16889 (Array (_ BitVec 32) (_ BitVec 64))) (size!17254 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35173)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35173 (_ BitVec 32)) SeekEntryResult!5335)

(assert (=> b!559212 (= lt!254034 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!559213 () Bool)

(declare-fun res!350751 () Bool)

(assert (=> b!559213 (=> (not res!350751) (not e!322152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!559213 (= res!350751 (validKeyInArray!0 k0!1914))))

(declare-fun e!322147 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!254036 () SeekEntryResult!5335)

(declare-fun b!559214 () Bool)

(declare-fun lt!254038 () SeekEntryResult!5335)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35173 (_ BitVec 32)) SeekEntryResult!5335)

(assert (=> b!559214 (= e!322147 (= lt!254038 (seekKeyOrZeroReturnVacant!0 (x!52488 lt!254036) (index!23569 lt!254036) (index!23569 lt!254036) (select (arr!16889 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!559215 () Bool)

(declare-fun res!350744 () Bool)

(assert (=> b!559215 (=> (not res!350744) (not e!322152))))

(assert (=> b!559215 (= res!350744 (and (= (size!17254 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17254 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17254 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!559216 () Bool)

(declare-fun res!350748 () Bool)

(assert (=> b!559216 (=> (not res!350748) (not e!322149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35173 (_ BitVec 32)) Bool)

(assert (=> b!559216 (= res!350748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!559217 () Bool)

(declare-fun e!322151 () Bool)

(assert (=> b!559217 (= e!322151 e!322147)))

(declare-fun res!350743 () Bool)

(assert (=> b!559217 (=> res!350743 e!322147)))

(get-info :version)

(assert (=> b!559217 (= res!350743 (or (undefined!6147 lt!254036) (not ((_ is Intermediate!5335) lt!254036)) (= (select (arr!16889 a!3118) (index!23569 lt!254036)) (select (arr!16889 a!3118) j!142)) (= (select (arr!16889 a!3118) (index!23569 lt!254036)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559218 () Bool)

(declare-fun e!322150 () Bool)

(assert (=> b!559218 (= e!322149 e!322150)))

(declare-fun res!350750 () Bool)

(assert (=> b!559218 (=> (not res!350750) (not e!322150))))

(declare-fun lt!254033 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35173 (_ BitVec 32)) SeekEntryResult!5335)

(assert (=> b!559218 (= res!350750 (= lt!254036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254033 (select (store (arr!16889 a!3118) i!1132 k0!1914) j!142) (array!35174 (store (arr!16889 a!3118) i!1132 k0!1914) (size!17254 a!3118)) mask!3119)))))

(declare-fun lt!254035 () (_ BitVec 32))

(assert (=> b!559218 (= lt!254036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254035 (select (arr!16889 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559218 (= lt!254033 (toIndex!0 (select (store (arr!16889 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!559218 (= lt!254035 (toIndex!0 (select (arr!16889 a!3118) j!142) mask!3119))))

(declare-fun res!350747 () Bool)

(assert (=> start!51236 (=> (not res!350747) (not e!322152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51236 (= res!350747 (validMask!0 mask!3119))))

(assert (=> start!51236 e!322152))

(assert (=> start!51236 true))

(declare-fun array_inv!12772 (array!35173) Bool)

(assert (=> start!51236 (array_inv!12772 a!3118)))

(declare-fun b!559219 () Bool)

(assert (=> b!559219 (= e!322150 (not true))))

(assert (=> b!559219 e!322151))

(declare-fun res!350749 () Bool)

(assert (=> b!559219 (=> (not res!350749) (not e!322151))))

(assert (=> b!559219 (= res!350749 (= lt!254038 (Found!5335 j!142)))))

(assert (=> b!559219 (= lt!254038 (seekEntryOrOpen!0 (select (arr!16889 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!559219 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17430 0))(
  ( (Unit!17431) )
))
(declare-fun lt!254037 () Unit!17430)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17430)

(assert (=> b!559219 (= lt!254037 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!559220 () Bool)

(declare-fun res!350752 () Bool)

(assert (=> b!559220 (=> (not res!350752) (not e!322152))))

(declare-fun arrayContainsKey!0 (array!35173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!559220 (= res!350752 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!559221 () Bool)

(declare-fun res!350745 () Bool)

(assert (=> b!559221 (=> (not res!350745) (not e!322152))))

(assert (=> b!559221 (= res!350745 (validKeyInArray!0 (select (arr!16889 a!3118) j!142)))))

(declare-fun b!559222 () Bool)

(declare-fun res!350753 () Bool)

(assert (=> b!559222 (=> (not res!350753) (not e!322149))))

(declare-datatypes ((List!11008 0))(
  ( (Nil!11005) (Cons!11004 (h!12004 (_ BitVec 64)) (t!17227 List!11008)) )
))
(declare-fun arrayNoDuplicates!0 (array!35173 (_ BitVec 32) List!11008) Bool)

(assert (=> b!559222 (= res!350753 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11005))))

(assert (= (and start!51236 res!350747) b!559215))

(assert (= (and b!559215 res!350744) b!559221))

(assert (= (and b!559221 res!350745) b!559213))

(assert (= (and b!559213 res!350751) b!559220))

(assert (= (and b!559220 res!350752) b!559212))

(assert (= (and b!559212 res!350746) b!559216))

(assert (= (and b!559216 res!350748) b!559222))

(assert (= (and b!559222 res!350753) b!559218))

(assert (= (and b!559218 res!350750) b!559219))

(assert (= (and b!559219 res!350749) b!559217))

(assert (= (and b!559217 (not res!350743)) b!559214))

(declare-fun m!536519 () Bool)

(assert (=> b!559214 m!536519))

(assert (=> b!559214 m!536519))

(declare-fun m!536521 () Bool)

(assert (=> b!559214 m!536521))

(declare-fun m!536523 () Bool)

(assert (=> b!559222 m!536523))

(declare-fun m!536525 () Bool)

(assert (=> b!559213 m!536525))

(declare-fun m!536527 () Bool)

(assert (=> b!559212 m!536527))

(assert (=> b!559221 m!536519))

(assert (=> b!559221 m!536519))

(declare-fun m!536529 () Bool)

(assert (=> b!559221 m!536529))

(declare-fun m!536531 () Bool)

(assert (=> start!51236 m!536531))

(declare-fun m!536533 () Bool)

(assert (=> start!51236 m!536533))

(declare-fun m!536535 () Bool)

(assert (=> b!559220 m!536535))

(assert (=> b!559219 m!536519))

(assert (=> b!559219 m!536519))

(declare-fun m!536537 () Bool)

(assert (=> b!559219 m!536537))

(declare-fun m!536539 () Bool)

(assert (=> b!559219 m!536539))

(declare-fun m!536541 () Bool)

(assert (=> b!559219 m!536541))

(declare-fun m!536543 () Bool)

(assert (=> b!559218 m!536543))

(declare-fun m!536545 () Bool)

(assert (=> b!559218 m!536545))

(assert (=> b!559218 m!536543))

(declare-fun m!536547 () Bool)

(assert (=> b!559218 m!536547))

(assert (=> b!559218 m!536519))

(declare-fun m!536549 () Bool)

(assert (=> b!559218 m!536549))

(assert (=> b!559218 m!536519))

(declare-fun m!536551 () Bool)

(assert (=> b!559218 m!536551))

(assert (=> b!559218 m!536543))

(declare-fun m!536553 () Bool)

(assert (=> b!559218 m!536553))

(assert (=> b!559218 m!536519))

(declare-fun m!536555 () Bool)

(assert (=> b!559217 m!536555))

(assert (=> b!559217 m!536519))

(declare-fun m!536557 () Bool)

(assert (=> b!559216 m!536557))

(check-sat (not start!51236) (not b!559212) (not b!559214) (not b!559213) (not b!559219) (not b!559218) (not b!559221) (not b!559216) (not b!559220) (not b!559222))
(check-sat)
