; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51428 () Bool)

(assert start!51428)

(declare-fun b!562037 () Bool)

(declare-fun res!353192 () Bool)

(declare-fun e!323889 () Bool)

(assert (=> b!562037 (=> (not res!353192) (not e!323889))))

(declare-datatypes ((array!35293 0))(
  ( (array!35294 (arr!16947 (Array (_ BitVec 32) (_ BitVec 64))) (size!17311 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35293)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562037 (= res!353192 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun e!323893 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5396 0))(
  ( (MissingZero!5396 (index!23811 (_ BitVec 32))) (Found!5396 (index!23812 (_ BitVec 32))) (Intermediate!5396 (undefined!6208 Bool) (index!23813 (_ BitVec 32)) (x!52715 (_ BitVec 32))) (Undefined!5396) (MissingVacant!5396 (index!23814 (_ BitVec 32))) )
))
(declare-fun lt!255930 () SeekEntryResult!5396)

(declare-fun b!562038 () Bool)

(declare-fun lt!255931 () array!35293)

(declare-fun lt!255929 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35293 (_ BitVec 32)) SeekEntryResult!5396)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35293 (_ BitVec 32)) SeekEntryResult!5396)

(assert (=> b!562038 (= e!323893 (= (seekEntryOrOpen!0 lt!255929 lt!255931 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52715 lt!255930) (index!23813 lt!255930) (index!23813 lt!255930) lt!255929 lt!255931 mask!3119)))))

(declare-fun b!562039 () Bool)

(declare-fun e!323892 () Bool)

(declare-fun e!323888 () Bool)

(assert (=> b!562039 (= e!323892 e!323888)))

(declare-fun res!353198 () Bool)

(assert (=> b!562039 (=> res!353198 e!323888)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255924 () (_ BitVec 64))

(assert (=> b!562039 (= res!353198 (or (= lt!255924 (select (arr!16947 a!3118) j!142)) (= lt!255924 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562039 (= lt!255924 (select (arr!16947 a!3118) (index!23813 lt!255930)))))

(declare-fun b!562040 () Bool)

(declare-fun e!323890 () Bool)

(declare-fun e!323891 () Bool)

(assert (=> b!562040 (= e!323890 e!323891)))

(declare-fun res!353191 () Bool)

(assert (=> b!562040 (=> (not res!353191) (not e!323891))))

(declare-fun lt!255923 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35293 (_ BitVec 32)) SeekEntryResult!5396)

(assert (=> b!562040 (= res!353191 (= lt!255930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255923 lt!255929 lt!255931 mask!3119)))))

(declare-fun lt!255928 () (_ BitVec 32))

(assert (=> b!562040 (= lt!255930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255928 (select (arr!16947 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562040 (= lt!255923 (toIndex!0 lt!255929 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562040 (= lt!255929 (select (store (arr!16947 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562040 (= lt!255928 (toIndex!0 (select (arr!16947 a!3118) j!142) mask!3119))))

(assert (=> b!562040 (= lt!255931 (array!35294 (store (arr!16947 a!3118) i!1132 k!1914) (size!17311 a!3118)))))

(declare-fun b!562041 () Bool)

(declare-fun res!353197 () Bool)

(assert (=> b!562041 (=> (not res!353197) (not e!323889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562041 (= res!353197 (validKeyInArray!0 (select (arr!16947 a!3118) j!142)))))

(declare-fun res!353201 () Bool)

(assert (=> start!51428 (=> (not res!353201) (not e!323889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51428 (= res!353201 (validMask!0 mask!3119))))

(assert (=> start!51428 e!323889))

(assert (=> start!51428 true))

(declare-fun array_inv!12743 (array!35293) Bool)

(assert (=> start!51428 (array_inv!12743 a!3118)))

(declare-fun b!562042 () Bool)

(declare-fun res!353196 () Bool)

(assert (=> b!562042 (=> (not res!353196) (not e!323889))))

(assert (=> b!562042 (= res!353196 (and (= (size!17311 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17311 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17311 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562043 () Bool)

(declare-fun e!323895 () Bool)

(assert (=> b!562043 (= e!323895 e!323892)))

(declare-fun res!353189 () Bool)

(assert (=> b!562043 (=> res!353189 e!323892)))

(assert (=> b!562043 (= res!353189 (or (undefined!6208 lt!255930) (not (is-Intermediate!5396 lt!255930))))))

(declare-fun b!562044 () Bool)

(assert (=> b!562044 (= e!323891 (not true))))

(assert (=> b!562044 e!323895))

(declare-fun res!353199 () Bool)

(assert (=> b!562044 (=> (not res!353199) (not e!323895))))

(declare-fun lt!255927 () SeekEntryResult!5396)

(assert (=> b!562044 (= res!353199 (= lt!255927 (Found!5396 j!142)))))

(assert (=> b!562044 (= lt!255927 (seekEntryOrOpen!0 (select (arr!16947 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35293 (_ BitVec 32)) Bool)

(assert (=> b!562044 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17566 0))(
  ( (Unit!17567) )
))
(declare-fun lt!255926 () Unit!17566)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35293 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17566)

(assert (=> b!562044 (= lt!255926 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562045 () Bool)

(declare-fun res!353195 () Bool)

(assert (=> b!562045 (=> (not res!353195) (not e!323889))))

(assert (=> b!562045 (= res!353195 (validKeyInArray!0 k!1914))))

(declare-fun b!562046 () Bool)

(declare-fun res!353193 () Bool)

(assert (=> b!562046 (=> (not res!353193) (not e!323890))))

(declare-datatypes ((List!11027 0))(
  ( (Nil!11024) (Cons!11023 (h!12026 (_ BitVec 64)) (t!17255 List!11027)) )
))
(declare-fun arrayNoDuplicates!0 (array!35293 (_ BitVec 32) List!11027) Bool)

(assert (=> b!562046 (= res!353193 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11024))))

(declare-fun b!562047 () Bool)

(declare-fun res!353200 () Bool)

(assert (=> b!562047 (=> (not res!353200) (not e!323890))))

(assert (=> b!562047 (= res!353200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562048 () Bool)

(assert (=> b!562048 (= e!323888 e!323893)))

(declare-fun res!353194 () Bool)

(assert (=> b!562048 (=> (not res!353194) (not e!323893))))

(assert (=> b!562048 (= res!353194 (= lt!255927 (seekKeyOrZeroReturnVacant!0 (x!52715 lt!255930) (index!23813 lt!255930) (index!23813 lt!255930) (select (arr!16947 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!562049 () Bool)

(assert (=> b!562049 (= e!323889 e!323890)))

(declare-fun res!353190 () Bool)

(assert (=> b!562049 (=> (not res!353190) (not e!323890))))

(declare-fun lt!255925 () SeekEntryResult!5396)

(assert (=> b!562049 (= res!353190 (or (= lt!255925 (MissingZero!5396 i!1132)) (= lt!255925 (MissingVacant!5396 i!1132))))))

(assert (=> b!562049 (= lt!255925 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!51428 res!353201) b!562042))

(assert (= (and b!562042 res!353196) b!562041))

(assert (= (and b!562041 res!353197) b!562045))

(assert (= (and b!562045 res!353195) b!562037))

(assert (= (and b!562037 res!353192) b!562049))

(assert (= (and b!562049 res!353190) b!562047))

(assert (= (and b!562047 res!353200) b!562046))

(assert (= (and b!562046 res!353193) b!562040))

(assert (= (and b!562040 res!353191) b!562044))

(assert (= (and b!562044 res!353199) b!562043))

(assert (= (and b!562043 (not res!353189)) b!562039))

(assert (= (and b!562039 (not res!353198)) b!562048))

(assert (= (and b!562048 res!353194) b!562038))

(declare-fun m!540009 () Bool)

(assert (=> b!562046 m!540009))

(declare-fun m!540011 () Bool)

(assert (=> b!562039 m!540011))

(declare-fun m!540013 () Bool)

(assert (=> b!562039 m!540013))

(assert (=> b!562040 m!540011))

(assert (=> b!562040 m!540011))

(declare-fun m!540015 () Bool)

(assert (=> b!562040 m!540015))

(declare-fun m!540017 () Bool)

(assert (=> b!562040 m!540017))

(declare-fun m!540019 () Bool)

(assert (=> b!562040 m!540019))

(declare-fun m!540021 () Bool)

(assert (=> b!562040 m!540021))

(assert (=> b!562040 m!540011))

(declare-fun m!540023 () Bool)

(assert (=> b!562040 m!540023))

(declare-fun m!540025 () Bool)

(assert (=> b!562040 m!540025))

(declare-fun m!540027 () Bool)

(assert (=> b!562045 m!540027))

(declare-fun m!540029 () Bool)

(assert (=> start!51428 m!540029))

(declare-fun m!540031 () Bool)

(assert (=> start!51428 m!540031))

(declare-fun m!540033 () Bool)

(assert (=> b!562049 m!540033))

(declare-fun m!540035 () Bool)

(assert (=> b!562037 m!540035))

(assert (=> b!562048 m!540011))

(assert (=> b!562048 m!540011))

(declare-fun m!540037 () Bool)

(assert (=> b!562048 m!540037))

(declare-fun m!540039 () Bool)

(assert (=> b!562047 m!540039))

(assert (=> b!562044 m!540011))

(assert (=> b!562044 m!540011))

(declare-fun m!540041 () Bool)

(assert (=> b!562044 m!540041))

(declare-fun m!540043 () Bool)

(assert (=> b!562044 m!540043))

(declare-fun m!540045 () Bool)

(assert (=> b!562044 m!540045))

(declare-fun m!540047 () Bool)

(assert (=> b!562038 m!540047))

(declare-fun m!540049 () Bool)

(assert (=> b!562038 m!540049))

(assert (=> b!562041 m!540011))

(assert (=> b!562041 m!540011))

(declare-fun m!540051 () Bool)

(assert (=> b!562041 m!540051))

(push 1)

