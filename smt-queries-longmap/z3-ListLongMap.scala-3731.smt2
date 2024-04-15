; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51368 () Bool)

(assert start!51368)

(declare-fun b!560830 () Bool)

(declare-fun res!352127 () Bool)

(declare-fun e!323142 () Bool)

(assert (=> b!560830 (=> (not res!352127) (not e!323142))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560830 (= res!352127 (validKeyInArray!0 k0!1914))))

(declare-fun b!560831 () Bool)

(declare-fun res!352128 () Bool)

(assert (=> b!560831 (=> (not res!352128) (not e!323142))))

(declare-datatypes ((array!35242 0))(
  ( (array!35243 (arr!16922 (Array (_ BitVec 32) (_ BitVec 64))) (size!17287 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35242)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!560831 (= res!352128 (validKeyInArray!0 (select (arr!16922 a!3118) j!142)))))

(declare-fun b!560832 () Bool)

(declare-fun res!352124 () Bool)

(assert (=> b!560832 (=> (not res!352124) (not e!323142))))

(declare-fun arrayContainsKey!0 (array!35242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560832 (= res!352124 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560833 () Bool)

(declare-fun res!352134 () Bool)

(assert (=> b!560833 (=> (not res!352134) (not e!323142))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560833 (= res!352134 (and (= (size!17287 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17287 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17287 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560834 () Bool)

(declare-fun e!323144 () Bool)

(assert (=> b!560834 (= e!323144 (not true))))

(declare-fun e!323141 () Bool)

(assert (=> b!560834 e!323141))

(declare-fun res!352133 () Bool)

(assert (=> b!560834 (=> (not res!352133) (not e!323141))))

(declare-datatypes ((SeekEntryResult!5368 0))(
  ( (MissingZero!5368 (index!23699 (_ BitVec 32))) (Found!5368 (index!23700 (_ BitVec 32))) (Intermediate!5368 (undefined!6180 Bool) (index!23701 (_ BitVec 32)) (x!52618 (_ BitVec 32))) (Undefined!5368) (MissingVacant!5368 (index!23702 (_ BitVec 32))) )
))
(declare-fun lt!255049 () SeekEntryResult!5368)

(assert (=> b!560834 (= res!352133 (= lt!255049 (Found!5368 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35242 (_ BitVec 32)) SeekEntryResult!5368)

(assert (=> b!560834 (= lt!255049 (seekEntryOrOpen!0 (select (arr!16922 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35242 (_ BitVec 32)) Bool)

(assert (=> b!560834 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17496 0))(
  ( (Unit!17497) )
))
(declare-fun lt!255048 () Unit!17496)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35242 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17496)

(assert (=> b!560834 (= lt!255048 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560835 () Bool)

(declare-fun e!323145 () Bool)

(assert (=> b!560835 (= e!323142 e!323145)))

(declare-fun res!352125 () Bool)

(assert (=> b!560835 (=> (not res!352125) (not e!323145))))

(declare-fun lt!255046 () SeekEntryResult!5368)

(assert (=> b!560835 (= res!352125 (or (= lt!255046 (MissingZero!5368 i!1132)) (= lt!255046 (MissingVacant!5368 i!1132))))))

(assert (=> b!560835 (= lt!255046 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560836 () Bool)

(declare-fun e!323138 () Bool)

(assert (=> b!560836 (= e!323141 e!323138)))

(declare-fun res!352130 () Bool)

(assert (=> b!560836 (=> res!352130 e!323138)))

(declare-fun lt!255044 () SeekEntryResult!5368)

(get-info :version)

(assert (=> b!560836 (= res!352130 (or (undefined!6180 lt!255044) (not ((_ is Intermediate!5368) lt!255044))))))

(declare-fun res!352131 () Bool)

(assert (=> start!51368 (=> (not res!352131) (not e!323142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51368 (= res!352131 (validMask!0 mask!3119))))

(assert (=> start!51368 e!323142))

(assert (=> start!51368 true))

(declare-fun array_inv!12805 (array!35242) Bool)

(assert (=> start!51368 (array_inv!12805 a!3118)))

(declare-fun b!560837 () Bool)

(declare-fun res!352129 () Bool)

(assert (=> b!560837 (=> (not res!352129) (not e!323145))))

(declare-datatypes ((List!11041 0))(
  ( (Nil!11038) (Cons!11037 (h!12040 (_ BitVec 64)) (t!17260 List!11041)) )
))
(declare-fun arrayNoDuplicates!0 (array!35242 (_ BitVec 32) List!11041) Bool)

(assert (=> b!560837 (= res!352129 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11038))))

(declare-fun b!560838 () Bool)

(declare-fun res!352136 () Bool)

(assert (=> b!560838 (=> (not res!352136) (not e!323145))))

(assert (=> b!560838 (= res!352136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560839 () Bool)

(assert (=> b!560839 (= e!323145 e!323144)))

(declare-fun res!352126 () Bool)

(assert (=> b!560839 (=> (not res!352126) (not e!323144))))

(declare-fun lt!255045 () (_ BitVec 64))

(declare-fun lt!255043 () array!35242)

(declare-fun lt!255042 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35242 (_ BitVec 32)) SeekEntryResult!5368)

(assert (=> b!560839 (= res!352126 (= lt!255044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255042 lt!255045 lt!255043 mask!3119)))))

(declare-fun lt!255047 () (_ BitVec 32))

(assert (=> b!560839 (= lt!255044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255047 (select (arr!16922 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560839 (= lt!255042 (toIndex!0 lt!255045 mask!3119))))

(assert (=> b!560839 (= lt!255045 (select (store (arr!16922 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560839 (= lt!255047 (toIndex!0 (select (arr!16922 a!3118) j!142) mask!3119))))

(assert (=> b!560839 (= lt!255043 (array!35243 (store (arr!16922 a!3118) i!1132 k0!1914) (size!17287 a!3118)))))

(declare-fun b!560840 () Bool)

(declare-fun e!323139 () Bool)

(declare-fun e!323143 () Bool)

(assert (=> b!560840 (= e!323139 e!323143)))

(declare-fun res!352135 () Bool)

(assert (=> b!560840 (=> (not res!352135) (not e!323143))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35242 (_ BitVec 32)) SeekEntryResult!5368)

(assert (=> b!560840 (= res!352135 (= lt!255049 (seekKeyOrZeroReturnVacant!0 (x!52618 lt!255044) (index!23701 lt!255044) (index!23701 lt!255044) (select (arr!16922 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560841 () Bool)

(assert (=> b!560841 (= e!323138 e!323139)))

(declare-fun res!352132 () Bool)

(assert (=> b!560841 (=> res!352132 e!323139)))

(declare-fun lt!255041 () (_ BitVec 64))

(assert (=> b!560841 (= res!352132 (or (= lt!255041 (select (arr!16922 a!3118) j!142)) (= lt!255041 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560841 (= lt!255041 (select (arr!16922 a!3118) (index!23701 lt!255044)))))

(declare-fun b!560842 () Bool)

(assert (=> b!560842 (= e!323143 (= (seekEntryOrOpen!0 lt!255045 lt!255043 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52618 lt!255044) (index!23701 lt!255044) (index!23701 lt!255044) lt!255045 lt!255043 mask!3119)))))

(assert (= (and start!51368 res!352131) b!560833))

(assert (= (and b!560833 res!352134) b!560831))

(assert (= (and b!560831 res!352128) b!560830))

(assert (= (and b!560830 res!352127) b!560832))

(assert (= (and b!560832 res!352124) b!560835))

(assert (= (and b!560835 res!352125) b!560838))

(assert (= (and b!560838 res!352136) b!560837))

(assert (= (and b!560837 res!352129) b!560839))

(assert (= (and b!560839 res!352126) b!560834))

(assert (= (and b!560834 res!352133) b!560836))

(assert (= (and b!560836 (not res!352130)) b!560841))

(assert (= (and b!560841 (not res!352132)) b!560840))

(assert (= (and b!560840 res!352135) b!560842))

(declare-fun m!538181 () Bool)

(assert (=> b!560837 m!538181))

(declare-fun m!538183 () Bool)

(assert (=> b!560830 m!538183))

(declare-fun m!538185 () Bool)

(assert (=> b!560841 m!538185))

(declare-fun m!538187 () Bool)

(assert (=> b!560841 m!538187))

(assert (=> b!560831 m!538185))

(assert (=> b!560831 m!538185))

(declare-fun m!538189 () Bool)

(assert (=> b!560831 m!538189))

(declare-fun m!538191 () Bool)

(assert (=> start!51368 m!538191))

(declare-fun m!538193 () Bool)

(assert (=> start!51368 m!538193))

(declare-fun m!538195 () Bool)

(assert (=> b!560835 m!538195))

(assert (=> b!560839 m!538185))

(declare-fun m!538197 () Bool)

(assert (=> b!560839 m!538197))

(assert (=> b!560839 m!538185))

(assert (=> b!560839 m!538185))

(declare-fun m!538199 () Bool)

(assert (=> b!560839 m!538199))

(declare-fun m!538201 () Bool)

(assert (=> b!560839 m!538201))

(declare-fun m!538203 () Bool)

(assert (=> b!560839 m!538203))

(declare-fun m!538205 () Bool)

(assert (=> b!560839 m!538205))

(declare-fun m!538207 () Bool)

(assert (=> b!560839 m!538207))

(declare-fun m!538209 () Bool)

(assert (=> b!560842 m!538209))

(declare-fun m!538211 () Bool)

(assert (=> b!560842 m!538211))

(declare-fun m!538213 () Bool)

(assert (=> b!560838 m!538213))

(declare-fun m!538215 () Bool)

(assert (=> b!560832 m!538215))

(assert (=> b!560834 m!538185))

(assert (=> b!560834 m!538185))

(declare-fun m!538217 () Bool)

(assert (=> b!560834 m!538217))

(declare-fun m!538219 () Bool)

(assert (=> b!560834 m!538219))

(declare-fun m!538221 () Bool)

(assert (=> b!560834 m!538221))

(assert (=> b!560840 m!538185))

(assert (=> b!560840 m!538185))

(declare-fun m!538223 () Bool)

(assert (=> b!560840 m!538223))

(check-sat (not b!560837) (not b!560838) (not b!560831) (not start!51368) (not b!560842) (not b!560835) (not b!560832) (not b!560834) (not b!560839) (not b!560830) (not b!560840))
(check-sat)
