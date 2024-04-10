; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51480 () Bool)

(assert start!51480)

(declare-fun b!562998 () Bool)

(declare-fun res!354154 () Bool)

(declare-fun e!324462 () Bool)

(assert (=> b!562998 (=> (not res!354154) (not e!324462))))

(declare-datatypes ((array!35345 0))(
  ( (array!35346 (arr!16973 (Array (_ BitVec 32) (_ BitVec 64))) (size!17337 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35345)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35345 (_ BitVec 32)) Bool)

(assert (=> b!562998 (= res!354154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562999 () Bool)

(declare-fun e!324459 () Bool)

(declare-fun e!324463 () Bool)

(assert (=> b!562999 (= e!324459 e!324463)))

(declare-fun res!354153 () Bool)

(assert (=> b!562999 (=> res!354153 e!324463)))

(declare-fun lt!256891 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5422 0))(
  ( (MissingZero!5422 (index!23915 (_ BitVec 32))) (Found!5422 (index!23916 (_ BitVec 32))) (Intermediate!5422 (undefined!6234 Bool) (index!23917 (_ BitVec 32)) (x!52805 (_ BitVec 32))) (Undefined!5422) (MissingVacant!5422 (index!23918 (_ BitVec 32))) )
))
(declare-fun lt!256899 () SeekEntryResult!5422)

(declare-fun lt!256892 () SeekEntryResult!5422)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!256893 () SeekEntryResult!5422)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562999 (= res!354153 (or (bvslt (index!23917 lt!256892) #b00000000000000000000000000000000) (bvsge (index!23917 lt!256892) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52805 lt!256892) #b01111111111111111111111111111110) (bvslt (x!52805 lt!256892) #b00000000000000000000000000000000) (not (= lt!256891 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16973 a!3118) i!1132 k!1914) (index!23917 lt!256892)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256893 lt!256899))))))

(declare-fun lt!256901 () SeekEntryResult!5422)

(declare-fun lt!256890 () SeekEntryResult!5422)

(assert (=> b!562999 (= lt!256901 lt!256890)))

(declare-fun lt!256896 () array!35345)

(declare-fun lt!256898 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35345 (_ BitVec 32)) SeekEntryResult!5422)

(assert (=> b!562999 (= lt!256890 (seekKeyOrZeroReturnVacant!0 (x!52805 lt!256892) (index!23917 lt!256892) (index!23917 lt!256892) lt!256898 lt!256896 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35345 (_ BitVec 32)) SeekEntryResult!5422)

(assert (=> b!562999 (= lt!256901 (seekEntryOrOpen!0 lt!256898 lt!256896 mask!3119))))

(declare-fun lt!256895 () SeekEntryResult!5422)

(assert (=> b!562999 (= lt!256895 lt!256893)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562999 (= lt!256893 (seekKeyOrZeroReturnVacant!0 (x!52805 lt!256892) (index!23917 lt!256892) (index!23917 lt!256892) (select (arr!16973 a!3118) j!142) a!3118 mask!3119))))

(declare-fun res!354160 () Bool)

(declare-fun e!324464 () Bool)

(assert (=> start!51480 (=> (not res!354160) (not e!324464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51480 (= res!354160 (validMask!0 mask!3119))))

(assert (=> start!51480 e!324464))

(assert (=> start!51480 true))

(declare-fun array_inv!12769 (array!35345) Bool)

(assert (=> start!51480 (array_inv!12769 a!3118)))

(declare-fun b!563000 () Bool)

(declare-fun res!354157 () Bool)

(assert (=> b!563000 (=> (not res!354157) (not e!324464))))

(assert (=> b!563000 (= res!354157 (and (= (size!17337 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17337 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17337 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563001 () Bool)

(declare-fun res!354159 () Bool)

(assert (=> b!563001 (=> (not res!354159) (not e!324464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563001 (= res!354159 (validKeyInArray!0 (select (arr!16973 a!3118) j!142)))))

(declare-fun b!563002 () Bool)

(declare-fun res!354150 () Bool)

(assert (=> b!563002 (=> (not res!354150) (not e!324464))))

(assert (=> b!563002 (= res!354150 (validKeyInArray!0 k!1914))))

(declare-fun b!563003 () Bool)

(assert (=> b!563003 (= e!324464 e!324462)))

(declare-fun res!354155 () Bool)

(assert (=> b!563003 (=> (not res!354155) (not e!324462))))

(declare-fun lt!256902 () SeekEntryResult!5422)

(assert (=> b!563003 (= res!354155 (or (= lt!256902 (MissingZero!5422 i!1132)) (= lt!256902 (MissingVacant!5422 i!1132))))))

(assert (=> b!563003 (= lt!256902 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563004 () Bool)

(declare-fun e!324465 () Bool)

(assert (=> b!563004 (= e!324465 e!324459)))

(declare-fun res!354152 () Bool)

(assert (=> b!563004 (=> res!354152 e!324459)))

(assert (=> b!563004 (= res!354152 (or (= lt!256891 (select (arr!16973 a!3118) j!142)) (= lt!256891 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!563004 (= lt!256891 (select (arr!16973 a!3118) (index!23917 lt!256892)))))

(declare-fun b!563005 () Bool)

(declare-fun res!354161 () Bool)

(assert (=> b!563005 (=> (not res!354161) (not e!324462))))

(declare-datatypes ((List!11053 0))(
  ( (Nil!11050) (Cons!11049 (h!12052 (_ BitVec 64)) (t!17281 List!11053)) )
))
(declare-fun arrayNoDuplicates!0 (array!35345 (_ BitVec 32) List!11053) Bool)

(assert (=> b!563005 (= res!354161 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11050))))

(declare-fun b!563006 () Bool)

(declare-fun e!324461 () Bool)

(assert (=> b!563006 (= e!324461 (not e!324465))))

(declare-fun res!354151 () Bool)

(assert (=> b!563006 (=> res!354151 e!324465)))

(assert (=> b!563006 (= res!354151 (or (undefined!6234 lt!256892) (not (is-Intermediate!5422 lt!256892))))))

(assert (=> b!563006 (= lt!256895 lt!256899)))

(assert (=> b!563006 (= lt!256899 (Found!5422 j!142))))

(assert (=> b!563006 (= lt!256895 (seekEntryOrOpen!0 (select (arr!16973 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!563006 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17618 0))(
  ( (Unit!17619) )
))
(declare-fun lt!256900 () Unit!17618)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35345 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17618)

(assert (=> b!563006 (= lt!256900 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563007 () Bool)

(declare-fun res!354156 () Bool)

(assert (=> b!563007 (=> (not res!354156) (not e!324464))))

(declare-fun arrayContainsKey!0 (array!35345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563007 (= res!354156 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563008 () Bool)

(assert (=> b!563008 (= e!324462 e!324461)))

(declare-fun res!354158 () Bool)

(assert (=> b!563008 (=> (not res!354158) (not e!324461))))

(declare-fun lt!256897 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35345 (_ BitVec 32)) SeekEntryResult!5422)

(assert (=> b!563008 (= res!354158 (= lt!256892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256897 lt!256898 lt!256896 mask!3119)))))

(declare-fun lt!256903 () (_ BitVec 32))

(assert (=> b!563008 (= lt!256892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256903 (select (arr!16973 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563008 (= lt!256897 (toIndex!0 lt!256898 mask!3119))))

(assert (=> b!563008 (= lt!256898 (select (store (arr!16973 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!563008 (= lt!256903 (toIndex!0 (select (arr!16973 a!3118) j!142) mask!3119))))

(assert (=> b!563008 (= lt!256896 (array!35346 (store (arr!16973 a!3118) i!1132 k!1914) (size!17337 a!3118)))))

(declare-fun b!563009 () Bool)

(assert (=> b!563009 (= e!324463 (bvsge mask!3119 #b00000000000000000000000000000000))))

(assert (=> b!563009 (= lt!256893 lt!256890)))

(declare-fun lt!256894 () Unit!17618)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17618)

(assert (=> b!563009 (= lt!256894 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!52805 lt!256892) (index!23917 lt!256892) (index!23917 lt!256892) mask!3119))))

(assert (= (and start!51480 res!354160) b!563000))

(assert (= (and b!563000 res!354157) b!563001))

(assert (= (and b!563001 res!354159) b!563002))

(assert (= (and b!563002 res!354150) b!563007))

(assert (= (and b!563007 res!354156) b!563003))

(assert (= (and b!563003 res!354155) b!562998))

(assert (= (and b!562998 res!354154) b!563005))

(assert (= (and b!563005 res!354161) b!563008))

(assert (= (and b!563008 res!354158) b!563006))

(assert (= (and b!563006 (not res!354151)) b!563004))

(assert (= (and b!563004 (not res!354152)) b!562999))

(assert (= (and b!562999 (not res!354153)) b!563009))

(declare-fun m!541221 () Bool)

(assert (=> b!563001 m!541221))

(assert (=> b!563001 m!541221))

(declare-fun m!541223 () Bool)

(assert (=> b!563001 m!541223))

(declare-fun m!541225 () Bool)

(assert (=> b!562998 m!541225))

(assert (=> b!563004 m!541221))

(declare-fun m!541227 () Bool)

(assert (=> b!563004 m!541227))

(assert (=> b!563008 m!541221))

(declare-fun m!541229 () Bool)

(assert (=> b!563008 m!541229))

(assert (=> b!563008 m!541221))

(declare-fun m!541231 () Bool)

(assert (=> b!563008 m!541231))

(assert (=> b!563008 m!541221))

(declare-fun m!541233 () Bool)

(assert (=> b!563008 m!541233))

(declare-fun m!541235 () Bool)

(assert (=> b!563008 m!541235))

(declare-fun m!541237 () Bool)

(assert (=> b!563008 m!541237))

(declare-fun m!541239 () Bool)

(assert (=> b!563008 m!541239))

(declare-fun m!541241 () Bool)

(assert (=> start!51480 m!541241))

(declare-fun m!541243 () Bool)

(assert (=> start!51480 m!541243))

(assert (=> b!563006 m!541221))

(assert (=> b!563006 m!541221))

(declare-fun m!541245 () Bool)

(assert (=> b!563006 m!541245))

(declare-fun m!541247 () Bool)

(assert (=> b!563006 m!541247))

(declare-fun m!541249 () Bool)

(assert (=> b!563006 m!541249))

(assert (=> b!562999 m!541221))

(declare-fun m!541251 () Bool)

(assert (=> b!562999 m!541251))

(assert (=> b!562999 m!541235))

(assert (=> b!562999 m!541221))

(declare-fun m!541253 () Bool)

(assert (=> b!562999 m!541253))

(declare-fun m!541255 () Bool)

(assert (=> b!562999 m!541255))

(declare-fun m!541257 () Bool)

(assert (=> b!562999 m!541257))

(declare-fun m!541259 () Bool)

(assert (=> b!563005 m!541259))

(declare-fun m!541261 () Bool)

(assert (=> b!563002 m!541261))

(declare-fun m!541263 () Bool)

(assert (=> b!563009 m!541263))

(declare-fun m!541265 () Bool)

(assert (=> b!563007 m!541265))

(declare-fun m!541267 () Bool)

(assert (=> b!563003 m!541267))

(push 1)

